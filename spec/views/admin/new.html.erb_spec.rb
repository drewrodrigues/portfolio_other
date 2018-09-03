require "rails_helper"

RSpec.describe "admin/new", type: :view do
  it "displays a form" do
    render

    expect(rendered).to have_selector "form"
  end

  it "has a username field" do
    render

    expect(rendered).to have_field "password"
  end

  it "has a password field" do
    render

    expect(rendered).to have_field "username"
  end

  it "has a submit button" do
    render

    expect(rendered).to have_selector "input[type='submit']"
  end
end
