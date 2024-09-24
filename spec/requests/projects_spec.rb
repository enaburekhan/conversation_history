require 'rails_helper'

RSpec.describe "Projects", type: :request do
  before(:example) do
    @project = Project.create(name: 'Eric Enaburekhan', description: 'This project is making progress', status: 'active')
  end

  it 'shows all projects' do
    get '/projects'
    expect(response).to have_http_status(:success)
  end
  
  it 'displays project information' do
    get project_path(@project)
    expect(response).to have_http_status(:success)
  end
end
