class ChangeColumnsAddNotnullOnBookComments < ActiveRecord::Migration[5.2]
  def change
    change_column_null :book_comments, :comment, false
  end
end
