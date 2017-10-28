require 'rails_helper'

feature "AddNewPosts", :type => :feature do
  it "should require the user log in before adding a post" do
    password = "123456789"
    u = create( :user, password: password, password_confirmation: password )

    visit new_post_path

    within "#new_user" do
      fill_in "user_email", with: u.email
      fill_in "user_password", with: password
    end

    click_button "Log in"

    within "#new_post" do
      fill_in "post_name", with: "Post title"
    end

    click_link_or_button "Create Post"

    expect( Post.count ).to eq(1)
    expect( Post.first.name).to eq( "Post title")
  end
end
