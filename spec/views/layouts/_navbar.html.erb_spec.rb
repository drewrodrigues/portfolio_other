require "rails_helper"

RSpec.describe "layouts/_navbar", type: :view do
  it "has a home link" do
    render

    expect(rendered).to have_link 'Home', { href: root_path }
  end

  it "has a about link" do
    render

    expect(rendered).to have_link 'About', { href: about_path }
  end

  it "has a contact link" do
    render

    expect(rendered).to have_link 'Contact', { href: contact_path }
  end

  it "has a projects link" do
    render

    expect(rendered).to have_link 'Projects', { href: projects_path }
  end

  context "when admin logged in" do
    it "has a dashboard link" do
      allow(view).to receive(:logged_in?).and_return(true)

      render

      expect(rendered).to have_link 'Dashboard', { href: dashboard_path }
    end

    it "has a logout link" do
      allow(view).to receive(:logged_in?).and_return(true)

      render
      
      expect(rendered).to have_link "Logout", { href: logout_path }
    end
  end

  context "when admin not logged in" do
    it "doesn't have dashboard link" do
      render

      expect(rendered).to_not have_link 'Dashboard', { href: dashboard_path }
    end

    it "doesn't have a logout link" do
      render

      expect(rendered).to_not have_link "Logout", { href: logout_path }
    end
  end
end
