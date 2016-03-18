require 'test_helper'

class AppointmentGetTest < ActionDispatch::IntegrationTest

	test 'list of all appointments' do
		get '/appointments'
		assert_equal 200, response.status
	end

  test 'filtering appointments by one criteria' do
		first_appointment = Appointment.create!(
			first_name: 'Bill',last_name: 'Gonzo',start_time: '05:00pm',end_time: '06:00pm', day: '13',month: '12', year: '2015'
		 )
		second_appointment = Appointment.create!(
			first_name: 'Ed',last_name: 'toro',start_time: '09:00pm',end_time: '10:00pm', day: '13',month: '12', year: '2015'
		 )

		get '/appointments?start_time=05:00pm',{},{'Accept' => Mime::JSON}
		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type
		appointments = json(response.body)
		names = appointments.collect {|app| app[:first_name]}
		assert_includes names, "Bill"
		refute_includes names, "Ed"
	end

end
