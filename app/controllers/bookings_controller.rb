class BookingsController < ApplicationController

 def index
    @bookings = Booking.where(user_id: current_user)
    @mevendor = []
    Booking.all.each do |booking|
      @mevendor << booking if booking.ticket.user == current_user
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @ticket = Ticket.find(params[:ticket_id])
    @booking = Booking.new
  end

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @booking = Booking.new(name: @ticket.name)
    # @booking.status = "Pending"
    @booking.ticket = @ticket
    @booking.user = current_user
    if @booking.save

      respond_to do |format|
        format.html { redirect_to ticket_booking_path(@ticket, @booking) }
        format.js
      end
      # redirect_to bookings_path
    else
      respond_to do |format|
        format.html { render :new }
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      respond_to do |format|
        format.html { redirect_to bookings_path }
        format.js
      end
    end
  end

  # CHANGED TO VALIDATE USER DIRECTLY FROM INDEX
  # def validates_user
  #   @booking = Booking.find(params[:id])
  #   @booking.status = "Accepted"
  #   @booking.save
  #   redirect_to bookings_path
  # end

  # # NOT IN USE
  # def refuses_user
  #   @booking = Booking.find(params[:id])
  #   @booking.status = "Declined"
  #   @booking.save
  #   redirect_to bookings_path
  # end

  private

  def booking_params
    params.require(:booking).permit(:name)
  end

end
