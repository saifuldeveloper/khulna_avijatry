@extends('backend.layout.main')
@section('content')
<section>
	<div class="container-fluid">
		<div class="card">
			<div class="card-body">
				{{ Form::open(['route' => ['report.dailyPurchaseByWarehouse', $year, $month], 'method' => 'post', 'id' => 'report-form']) }}
				<input type="hidden" name="warehouse_id_hidden" value="{{$warehouse_id}}">
				<h4 class="text-center">{{trans('file.Daily Purchase Report')}} &nbsp;&nbsp;
				<select class="selectpicker" id="warehouse_id" name="warehouse_id">
					<option value="0">{{trans('file.All Warehouse')}}</option>
					@foreach($lims_warehouse_list as $warehouse)
					<option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
					@endforeach
				</select>
				</h4>
				<div class="table-responsive mt-4">
					<table class="table table-bordered" style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6;">
						<thead>
							<tr>
								<th><a href="{{url('report/daily_purchase/'.$prev_year.'/'.$prev_month)}}"><i class="fa fa-arrow-left"></i> {{trans('file.Previous')}}</a></th>
						    	<th colspan="5" class="text-center">{{date("F", strtotime($year.'-'.$month.'-01')).' ' .$year}}</th>
						    	<th><a href="{{url('report/daily_purchase/'.$next_year.'/'.$next_month)}}">{{trans('file.Next')}} <i class="fa fa-arrow-right"></i></a></th>
						    </tr>
						</thead>
					    <tbody>
                            <tr>
                                <td><strong>Sunday</strong></td>
                                <td><strong>Monday</strong></td>
                                <td><strong>Tuesday</strong></td>
                                <td><strong>Wednesday</strong></td>
                                <td><strong>Thursday</strong></td>
                                <td><strong>Friday</strong></td>
                                <td><strong>Saturday</strong></td>
                            </tr>
                            <?php
                            $i = 1;
                            $flag = 0;
                            while ($i <= $number_of_day) {
                                echo '<tr>';
                                for ($j = 1; $j <= 7; $j++) {
                                    if ($i > $number_of_day) {
                                        break;
                                    }
                                    $url = route('purchases.index', ['starting_date' => $year . '-' . $month . '-' . $i, 'ending_date' => $year . '-' . $month . '-' . $i]);

                                    if ($flag) {
                                        if ($year . '-' . $month . '-' . $i == date('Y') . '-' . date('m') . '-' . (int) date('d')) {
                                            echo '<td>
                                                    <a href="' . $url . '" target="_blank">
                                                        <p style="color:red">
                                                            <strong>' . $i . '</strong>
                                                        </p>';
                                        } else {
                                            echo '<td>
                                                    <a href="' . $url . '" target="_blank">
                                                        <p>
                                                            <strong>' . $i . '</strong>
                                                        </p>';
                                        }

                                        if ($brand_total[$i]) {
                                            foreach ($brand_total[$i] as $key => $value) {
                                                echo '<strong>' . $key . ' : </strong><span>' . $value . '</span><br>';
                                            }
                                        }
                                        if ($grand_total[$i]) {
                                            echo '<strong>' . trans('file.grand total') . ' : </strong><span>' . $grand_total[$i] . '</span><br><br>';
                                        }
                                        echo '</a></td>';
                                        $i++;
                                    } elseif ($j == $start_day) {
                                        if ($year . '-' . $month . '-' . $i == date('Y') . '-' . date('m') . '-' . (int) date('d')) {
                                            echo '<td>
                                                <a href="' . $url . '" target="_blank">
                                                    <p style="color:red">
                                                        <strong>' . $i . '</strong>
                                                    </p>';
                                        } else {
                                            echo '<td>
                                                <a href="' . $url . '" target="_blank">
                                                    <p>
                                                        <strong>' . $i . '</strong>
                                                    </p>';
                                        }

                                        if ($brand_total[$i]) {
                                            foreach ($brand_total[$i] as $key => $value) {
                                                echo '<strong>' . $key . ' : </strong><span>' . $value . '</span><br>';
                                            }
                                        }
                                        if ($grand_total[$i]) {
                                            echo '<strong>' . trans('file.grand total') . ' : </strong><span>' . $grand_total[$i] . '</span><br><br>';
                                        }
                                        echo '</a></td>';
                                        $flag = 1;
                                        $i++;
                                        continue;
                                    } else {
                                        echo '<td></td>';
                                    }
                                }
                                echo '</tr>';
                            }
                            ?>
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

	$("ul#report").siblings('a').attr('aria-expanded','true');
    $("ul#report").addClass("show");
    $("ul#report #daily-purchase-report-menu").addClass("active");

	$('#warehouse_id').val($('input[name="warehouse_id_hidden"]').val());
	$('.selectpicker').selectpicker('refresh');

	$('#warehouse_id').on("change", function(){
		$('#report-form').submit();
	});
</script>
@endpush
