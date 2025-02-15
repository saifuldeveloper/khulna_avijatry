@extends('backend.layout.main') @section('content')
    <section>
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    {{ Form::open(['route' => ['report.monthlyPurchaseByWarehouse', $year], 'method' => 'post', 'id' => 'report-form']) }}
                    <input type="hidden" name="warehouse_id_hidden" value="{{ $warehouse_id }}">
                    <h4 class="text-center">{{ trans('file.Monthly Purchase Report') }} &nbsp;&nbsp;
                        <select class="selectpicker" id="warehouse_id" name="warehouse_id">
                            <option value="0">{{ trans('file.All Warehouse') }}</option>
                            @foreach ($lims_warehouse_list as $warehouse)
                                <option value="{{ $warehouse->id }}">{{ $warehouse->name }}</option>
                            @endforeach
                        </select>
                    </h4>
                    <div class="table-responsive mt-4">
                        <table class="table table-bordered"
                            style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6;">
                            <thead>
                                <tr>
                                    <th><a href="{{ url('report/monthly_purchase/' . ($year - 1)) }}"><i
                                                class="fa fa-arrow-left"></i> {{ trans('file.Previous') }}</a></th>
                                    <th colspan="10" class="text-center">{{ $year }}</th>
                                    <th><a href="{{ url('report/monthly_purchase/' . ($year + 1)) }}">{{ trans('file.Next') }}
                                            <i class="fa fa-arrow-right"></i></a></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong>January</strong></td>
                                    <td><strong>February</strong></td>
                                    <td><strong>March</strong></td>
                                    <td><strong>April</strong></td>
                                    <td><strong>May</strong></td>
                                    <td><strong>June</strong></td>
                                    <td><strong>July</strong></td>
                                    <td><strong>August</strong></td>
                                    <td><strong>September</strong></td>
                                    <td><strong>October</strong></td>
                                    <td><strong>November</strong></td>
                                    <td><strong>December</strong></td>
                                </tr>
                                <tr>
                                    @foreach ($grand_total as $key => $total)
                                        <td>
                                            @if ($total)
                                                <a href="{{ route('purchases.index', ['starting_date' => $year . '-' . ($key + 1) . '-01', 'ending_date' => $year . '-' . ($key + 1) . '-' . cal_days_in_month(CAL_GREGORIAN, $key + 1, $year)]) }}"
                                                    target="_blank">
                                                    @foreach ($brand_total[$key + 1] as $brand => $total)
                                                        <strong>{{ $brand }} : </strong>
                                                        <span>{{ $total }}</span><br>
                                                    @endforeach
                                                    <strong>{{ trans('file.grand total') }} : </strong>
                                                    <span>{{ $total }}</span><br>
                                                </a>
                                            @endif
                                        </td>
                                    @endforeach
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('scripts')
    <script type="text/javascript">
        $("ul#report").siblings('a').attr('aria-expanded', 'true');
        $("ul#report").addClass("show");
        $("ul#report #monthly-purchase-report-menu").addClass("active");

        $('#warehouse_id').val($('input[name="warehouse_id_hidden"]').val());
        $('.selectpicker').selectpicker('refresh');

        $('#warehouse_id').on("change", function() {
            $('#report-form').submit();
        });
    </script>
@endpush
