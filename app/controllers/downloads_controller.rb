class DownloadsController < ApplicationController

 def index
  @records = Download.all
  
  #@funding = Download.find_by(id=1)

  end

  def create

    # @downloads = Category.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    if params[:commit]=="Sort Details"  
      case params[:choose]
      when 'fund'
        if params[:select]=="asc"
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(fund: :asc)
        else
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(fund: :desc)
        end

      when 'Portfolio Manager'
        if params[:select]=="asc"
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(portfolio_manager: :asc)
        else
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(portfolio_manager: :desc)
        end


      when 'minimum investment'
        if params[:select]=="asc"
         @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(minimum_investment: :asc)
        else
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(minimum_investment: :desc)
        end

      when 'Expense ratio'
        if params[:select]=="asc"
        @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(expense_ratio: :asc)
        else
        @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(expense_ratio: :desc)
        end

      when 'net assets'
        if params[:select]=="asc"
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(net_assets: :asc)
        else
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(net_assets: :desc)
        end

      when '1-Month Return'
        if params[:select]=="asc"
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(one_month_return: :asc)
        else
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(one_month_return: :desc)
        end

      when '3-Month Return'
        if params[:select]=="asc"
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(three_month_return: :asc)
        else
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(three_month_return: :desc)
        end

      when '1-Year Return'
        if params[:select]=="asc"
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(one_year_return: :asc)
        else
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(one_year_return: :desc)
        end

      when '3-Year Return'
        if params[:select]=="asc"
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(three_year_return: :asc)
        else
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(three_year_return: :desc)
        end
      when '5-Year Return'
        if params[:select]=="asc"
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(five_year_return: :asc)
        else
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(five_year_return: :desc)
        end

      when '10-Year Return'
        if params[:select]=="asc"
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(ten_year_return: :asc)
        else
          @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%").order(ten_year_return: :desc)
        end

      else
        @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%")
      end

    else
      case params[:pick]
      when 'Minimum Investment'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("fund LIKE ? and minimum_investment <= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value]).order(minimum_investment: params[:select].nil? ? :asc : params[:select])
        else
          @records = Download.where("fund LIKE ? and minimum_investment <=? and minimum_investment >= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value],params[:enter_min_value]).order(minimum_investment: params[:select].nil? ? :asc : params[:select])       
        end

        when 'Expense Ratio'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
      if params[:enter_min_value].empty?
         @records = Download.where("fund LIKE ? and expense_ratio <= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value]).order(expense_ratio: params[:select].nil? ? :asc : params[:select])
       else
          @records = Download.where("fund LIKE ? and expense_ratio <= ? and expense_ratio >= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value],params[:enter_min_value]).order(expense_ratio: params[:select].nil? ? :asc : params[:select])       
        end

        when '1-Month Return'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("fund LIKE ? and one_month_return <= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value]).order(one_month_return: params[:select].nil? ? :asc : params[:select])
        else
          @records = Download.where("fund LIKE ? and one_month_return <= ? and one_month_return >= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value],params[:enter_min_value]).order(one_month_return: params[:select].nil? ? :asc : params[:select])       
        end

        when '3-Month Return'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("fund LIKE ? and three_month_return <= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value]).order(three_month_return: params[:select].nil? ? :asc : params[:select])
        else
          @records = Download.where("fund LIKE ? and three_month_return <= ? and three_month_return >= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value],params[:enter_min_value]).order(three_month_return: params[:select].nil? ? :asc : params[:select])       
        end

        when '1-Year Return'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("fund LIKE ? and one_year_return <= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value]).order(one_year_return: params[:select].nil? ? :asc : params[:select])
        else
          @records = Download.where("fund LIKE ? and one_year_return <= ? and one_year_return >=?","%#{params[:enter_fund_name]}%",params[:enter_max_value],params[:enter_min_value]).order(one_year_return: params[:select].nil? ? :asc : params[:select])       
        end

        when '3-Year Return'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("fund LIKE ? and three_year_return <= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value]).order(three_year_return: params[:select].nil? ? :asc : params[:select])
        else
          @records = Download.where("fund LIKE ? and three_year_return <= ? and three_year_return >= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value],params[:enter_min_value]).order(three_year_return: params[:select].nil? ? :asc : params[:select])       
        end

        when '5-Year Return'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("fund LIKE ? and five_year_return <= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value]).order(five_year_return: params[:select].nil? ? :asc : params[:select])
        else
          @records = Download.where("fund LIKE ? and five_year_return <= ? and five_year_return >=?","%#{params[:enter_fund_name]}%",params[:enter_max_value],params[:enter_min_value]).order(five_year_return: params[:select].nil? ? :asc : params[:select])       
        end

        when '10-Year Return'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("fund LIKE ? and ten_year_return <= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value]).order(ten_year_return: params[:select].nil? ? :asc : params[:select])
        else
          @records = Download.where("fund LIKE ? and ten_year_return <= ? and ten_year_return >= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value],params[:enter_min_value]).order(ten_year_return: params[:select].nil? ? :asc : params[:select])       
        end

        when 'Net Assets'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("fund LIKE ? and net_assets <= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value]).order(net_assets: params[:select].nil? ? :asc : params[:select])
        else
          @records = Download.where("fund LIKE ? and net_assets <= ? and net_assets >= ?","%#{params[:enter_fund_name]}%",params[:enter_max_value],params[:enter_min_value]).order(net_assets: params[:select].nil? ? :asc : params[:select])       
        end
      else
       @records = Download.where("fund LIKE ?", "%#{params[:enter_fund_name]}%")
      end
    end
    render 'index'
  end


  def filter
  end

end
