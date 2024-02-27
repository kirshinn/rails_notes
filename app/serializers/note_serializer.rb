# app/serializers/note_serializer.rb
class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :tag_names

  def tag_names
    object.tags.pluck(:name)
  end
end
