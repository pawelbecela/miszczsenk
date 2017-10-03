require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  setup do
    @training = Training.create
  end

  test "exercise title must not be empty" do
    exercise = Exercise.create(training: @training)
    assert_equal [:title, "can't be blank"], exercise.errors.first
  end

  test "exercise title length must be longer that 5 characters" do
    exercise = Exercise.new(title: "xyz", training: @training)
    exercise.save
    assert_equal ["Title is too short (minimum is 5 characters)"], exercise.errors.full_messages

    exercise.title = "123456"
    assert exercise.save
  end

  test "exercise title must be unique" do
    exercise = Exercise.create(title: "123456", training: @training)
    exercise1 = Exercise.create(title: "123456", training: @training)
    assert_equal [:title, "has already been taken"], exercise1.errors.first
  end
end
