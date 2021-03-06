require File.dirname(__FILE__) + '/../test_helper'

class IterationsControllerTest < ActionController::TestCase

  def test_should_not_create_without_required_attributes
    xhr :post, :create, :iteration => {
      :name => 'foo'
    }
    assert_response :unprocessable_entity, @response.body
  end

  def test_create_should_return_valid_location
    p = Project.create :name => 'foo_project'

    xhr :post, :create, :iteration => {
      :name => 'foo',
      :start_at => Time.now,
      :deadline => 23.days.from_now,
      :project_id => p.id
    }
    assert_response :ok, @response.body
    
    location = @response.headers['Location']
    assert_not_nil location
    assert_match /iterations\/#{p.iterations.first.id}$/, location
    assert p.iterations.find_by_name('foo')
  end

end
