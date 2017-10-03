require 'test_helper'

class TrainingTest < ActiveSupport::TestCase
  test "training title must not be empty" do
    training = Training.create
    assert_equal [:title, "can't be blank"], training.errors.first
  end

  test "training title length must be longer that 5 characters" do
    training = Training.new(title: "xyz")
    training.save
    assert_equal ["Title is too short (minimum is 5 characters)"], training.errors.full_messages

    training.title = "123456"
    assert training.save
  end

  test "training title must be unique" do
    training = Training.create(title: "123456")
    training1 = Training.create(title: "123456")
    assert_equal [:title, "has already been taken"], training1.errors.first
  end
end
