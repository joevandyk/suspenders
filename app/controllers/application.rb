class ApplicationController < ActionController::Base
  helper :all
  include HoptoadNotifier::Catcher

end
