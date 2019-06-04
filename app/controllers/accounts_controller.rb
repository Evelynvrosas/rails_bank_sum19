class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :destroy, :update]
  
  def index
    @accounts = current_user.accounts
  end

  def show
  end

  def new
    @accounts = current_user.accounts.new
  end

  def create
    @account = current_user.accounts.new(account_params)
    if @account.save
      flash[:success] = "Account created"
      redirect_to accounts_path
    else
      flash[:error] = "Error #{@account.errors.full_messages[0]}"
      render :new
    end
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to accounts_path
    else
      render :edit
  end
end

def destroy
  @account.destroy
  reditrect_to accounts_path

private
  def account_params
    params.require(:accounts).permit(:name, :balance)
  end

  def set_account
    @account = current_user.accounts.find(params[:id])
  end
end
