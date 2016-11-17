class PagesController < ApplicationController
  def index
    #@tags_infos = TagsInfo.all
    @tags_infos = TagsInfo.joins(:tag).all.page(params[:page]).per(10)
    
    # if params[:search]
    #   @tags_infos = TagsInfo.joins(:tag).search(params[:search],"","").page(params[:page]).per(10)
    #   @tags_infos = TagsInfo.joins(:tag).search("",params[:start_date],params[:end_date]).page(params[:page]).per(10)
    # elsif params[:search] &&  params[:start_date] && params[:end_date]
    #   @tags_infos = TagsInfo.joins(:tag).search(params[:search],params[:start_date],params[:end_date]).page(params[:page]).per(10)
    # else
    #   @tags_infos = TagsInfo.all.page(params[:page]).per(10)
       
    # end
     respond_to do |format|
          format.html
          format.csv { send_data @tags_infos.to_csv }
          format.xls { send_data @tags_infos.to_csv(col_sep: "\t") }
        end
  end
  
  def upload
  end
  
  def search_index
    @tags_infos = TagsInfo.joins(:tag).all.search(params[:search]).search_by_start_date(params[:start_date]).search_by_end_date(params[:end_date]).page(params[:page]).per(10)
  end
  
end
