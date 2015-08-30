class PostSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :user_id

  def meta
    1000
  end
end
