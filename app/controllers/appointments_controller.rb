class AppointmentsController < ApplicationController
  attr_accessor :show, :created, :start_time, :end_time

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def update
  end

  def delete
  end

  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, :created, :start_time, :end_time @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end
end
