require 'test_helper'

class ListGuestTest < ActionDispatch::IntegrationTest
  fixtures :all
  include Capybara::DSL

  test "# visible guests should be equal to the total # of guests" do
    @event = Event.find(:first, :order => 'random()')
    visit event_path(@event)
    
    # Au chargement, les invitès ne doivent pas figurer dans la page
    assert_equal 0, all('.guest').size
    
    click_on "Show guests"

    p @event.inspect

    # On doit voir le bon nombre d'invités une fois le lien cliqué
    assert has_css?('.guest', :count => @event.guests.size)
    
    # L'url doit être toujours la même
    assert_equal current_path, event_path(@event)
  end
end
