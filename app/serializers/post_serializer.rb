class PostSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :user_id

  belongs_to :user
end
