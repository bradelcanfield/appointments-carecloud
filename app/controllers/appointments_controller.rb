class AppointmentsController < ApplicationController
  attr_accessor :show, :created, :start_time, :end_time

  def index
    @appointments = Appointment.all
  end

  # def new
  #   @appointment = Appointment.new
  # end

  def update
  end

  def delete
  end

  def create
    appointment = Appointment.new(appointment_params)

		if appointment.check && appointment.save
			render json: appointment, status: 201, location: appointment
		else
			render json: appointment.errors, status: 422
		end
  end
end
