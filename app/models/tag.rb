class Tag < ActiveRecord::Base
    belongs_to :user
    has_many :tags_infos
end