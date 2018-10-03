class TicketsController < ApplicationController
  before_action :set_ticket, only: [ :show, :update, :destroy, :edit ]

  def new
    @user = current_user
    @ticket = Ticket.new
  end

  def index
    @tickets = Ticket.all
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user

    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @ticket.update(ticket_params)
    if @ticket.save
      redirect_to ticket_path(@ticket)
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :price, :date)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
