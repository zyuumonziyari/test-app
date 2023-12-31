class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy]

  # GET /tests
  def index
    @tests = Test.all
  end

  # GET /tests/1
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test, notice: t('.create_success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tests/1
  def update
    if @test.update(test_params)
      redirect_to @test, notice: t('.update_success'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tests/1
  def destroy
    @test.destroy
    redirect_to tests_url, notice: t('.destroy_success'), status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test
    @test = Test.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def test_params
    params.require(:test).permit(:title, :body)
  end
end
