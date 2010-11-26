class Post < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
      post_date :date ,:required, :null=>false
      author :string ,:required, :null=>false
      content :text
    timestamps
  end

  belongs_to :user, :creator => true

  # --- Permissions --- #

  def create_permitted?
    acting_user.signed_up?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
