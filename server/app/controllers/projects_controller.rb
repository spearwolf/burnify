class ProjectsController < ApplicationController

  acts_as_resource_controller :order => 'name ASC'

  layout false

  def edit
    @project = Project.find(params[:id])
  end

end
