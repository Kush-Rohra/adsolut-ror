class UploadsController < ApplicationController
    
    def new
    end
    
    def import
        
        spreadsheet = open_spreadsheet(params[:file])
        #excel_file = Roo::Spreadsheet.open(params[:file].path, extension: :xlsx)
        sheet_1 = spreadsheet.sheet('Sheet1')
        sheet_1.each_with_index(tag_name: 'tag_name', ad_request: 'ad_request', match_request: "matched_request", clicks: 'clicks',ctr: "ctr",ecpm: "ecpm",partner_revenue: "partner_revenue",frm_date:"from_date",to_date:"to_date") do |hash, index|
            unless index.zero?
            tag =  Tag.find_or_create_by(name: hash[:tag_name], user_id: params[:user_id])
            tag.tags_infos.create(ad_request: hash[:ad_request],
                                  match_request: hash[:match_request],
                                  clicks: hash[:clicks],
                                  ctr: hash[:ctr],
                                  ecpm: hash[:ecpm],
                                  partner_revenue: hash[:partner_revenue],
                                  frm_date: hash[:frm_date],
                                  to_date: hash[:to_date])
            end
         end
        redirect_to root_url
    end
    
    def open_spreadsheet(file)
        case File.extname(file.original_filename)
        when ".csv" then Roo::CSV.new(file.path)
        when ".xls" then Roo::Excel.new(file.path)
        when ".xlsx" then Roo::Excelx.new(file.path)
        else raise "Unknow file type: #{file.original_filename} "
        end
    end
end
