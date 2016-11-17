class TagsInfo < ActiveRecord::Base
    belongs_to :tag
    def self.search(search)
        if search.present?
             where("tags.name LIKE ?", "%#{search}%")
        else
            all
        end    
    end
    
    def self.search_by_start_date(search)
        if search.values.present?
            if search.values.reject{|x| x.empty?}.present?
                search = Date.civil(search[:"start_date(1i)"].to_i, search[:"start_date(2i)"].to_i,search[:"start_date(3i)"].to_i) 
                 where("frm_date >= ?", search)
            else
                all
            end
        end
    end 
    
    def self.search_by_end_date(search)
        if search.values.present?
            if search.values.reject{|x| x.empty?}.present?
                 search = Date.civil(search[:"end_date(1i)"].to_i, search[:"end_date(2i)"].to_i,search[:"end_date(3i)"].to_i) 
                 where("to_date <= ?", search)
            else
                all
            end
        end
    end    
    
    def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
            all.each do |tagsinfo|
                csv << tagsinfo.attributes.values_at(*column_names)
            end
        end
    end
end
