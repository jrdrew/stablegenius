require 'test_helper'

class HorsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @horse = horses(:one)
  end

  test "should get index" do
    get horses_url
    assert_response :success
  end

  test "should get new" do
    get new_horse_url
    assert_response :success
  end

  test "should create horse" do
    assert_difference('Horse.count') do
      post horses_url, params: { horse: { breed: @horse.breed, dob: @horse.dob, job: @horse.job, microchip: @horse.microchip, name: @horse.name, neda: @horse.neda, owner: @horse.owner, reg_number: @horse.reg_number, usef: @horse.usef, usof: @horse.usof } }
    end

    assert_redirected_to horse_url(Horse.last)
  end

  test "should show horse" do
    get horse_url(@horse)
    assert_response :success
  end

  test "should get edit" do
    get edit_horse_url(@horse)
    assert_response :success
  end

  test "should update horse" do
    patch horse_url(@horse), params: { horse: { breed: @horse.breed, dob: @horse.dob, job: @horse.job, microchip: @horse.microchip, name: @horse.name, neda: @horse.neda, owner: @horse.owner, reg_number: @horse.reg_number, usef: @horse.usef, usof: @horse.usof } }
    assert_redirected_to horse_url(@horse)
  end

  test "should destroy horse" do
    assert_difference('Horse.count', -1) do
      delete horse_url(@horse)
    end

    assert_redirected_to horses_url
  end
end