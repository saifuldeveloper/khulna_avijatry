<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Account;
use App\Models\Employee;
use App\Models\Payroll;
use Auth;
use DB;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Mail\PayrollDetails;
use Mail;
use App\Models\MailSetting;

class PayrollController extends Controller
{
    use \App\Traits\MailInfo;

    public function index(Request $request)
    {
        $role = Role::find(Auth::user()->role_id);
        if ($role->hasPermissionTo('payroll')) {
            if ($request->input('starting_date')) {
                $starting_date = $request->input('starting_date');
                $ending_date = $request->input('ending_date');
            } else {
                $payroll = Payroll::orderBy('created_at', 'asc')->get();
                $starting_date = $payroll->isEmpty() ? date('Y-m-d') : $payroll->first()->created_at->format('Y-m-d');
                $ending_date = $payroll->isEmpty() ? date('Y-m-d') : $payroll->last()->created_at->format('Y-m-d');
            }

            if ($request->input('employee_id'))
                $employee_id = $request->input('employee_id');
            else
                $employee_id = '';


            $lims_account_list = Account::where('is_active', true)->get();
            $lims_employee_list = Employee::where('is_active', true)->get();
            $general_setting = DB::table('general_settings')->latest()->first();
            if (Auth::user()->role_id > 2 && $general_setting->staff_access == 'own') {
                $lims_payroll_all = Payroll::orderBy('id', 'desc')
                    ->where('user_id', Auth::id())
                    ->whereBetween('created_at', [$starting_date, $ending_date])
                    ->get();
            } else {
                $lims_payroll_all = Payroll::orderBy('id', 'desc')
                    ->whereDate('created_at', '>=', $starting_date)
                    ->whereDate('created_at', '<=', $ending_date)
                    ->when($employee_id, function ($query) use ($employee_id) {
                        return $query->where('employee_id', $employee_id);
                    })
                    ->get();
            }

            return view('backend.payroll.index', compact('lims_account_list', 'lims_employee_list', 'lims_payroll_all', 'starting_date', 'ending_date', 'employee_id'));
        } else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $data = $request->all();
        if (isset($data['created_at']))
            $data['created_at'] = date("Y-m-d", strtotime(str_replace("/", "-", $data['created_at'])));
        else
            $data['created_at'] = date("Y-m-d");
        $data['reference_no'] = 'payroll-' . date("Ymd") . '-' . date("his");
        $data['user_id'] = Auth::id();
        Payroll::create($data);
        $message = 'Payroll created successfully';
        //collecting mail data
        $lims_employee_data = Employee::find($data['employee_id']);
        $mail_data['reference_no'] = $data['reference_no'];
        $mail_data['amount'] = $data['amount'];
        $mail_data['name'] = $lims_employee_data->name;
        $mail_data['email'] = $lims_employee_data->email;
        $mail_data['currency'] = config('currency');
        $mail_setting = MailSetting::latest()->first();
        if ($mail_setting) {
            $this->setMailInfo($mail_setting);
            try {
                Mail::to($mail_data['email'])->send(new PayrollDetails($mail_data));
            } catch (\Exception $e) {
                $message = ' Payroll created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('payroll')->with('message', $message);
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        $data = $request->all();
        if (isset($data['created_at']))
            $data['created_at'] = date("Y-m-d", strtotime(str_replace("/", "-", $data['created_at'])));
        else
            $data['created_at'] = date("Y-m-d");
        $lims_payroll_data = Payroll::find($data['payroll_id']);
        $lims_payroll_data->update($data);
        return redirect('payroll')->with('message', 'Payroll updated succesfully');
    }

    public function deleteBySelection(Request $request)
    {
        $payroll_id = $request['payrollIdArray'];
        foreach ($payroll_id as $id) {
            $lims_payroll_data = Payroll::find($id);
            $lims_payroll_data->delete();
        }
        return 'Payroll deleted successfully!';
    }

    public function destroy($id)
    {
        $lims_payroll_data = Payroll::find($id);
        $lims_payroll_data->delete();
        return redirect('payroll')->with('not_permitted', 'Payroll deleted succesfully');
    }
}
