class DownloadsController < ApplicationController
 autocomplete :downloads, :fund, :full => true
 def index


     @records = Download.all

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
          @records = Download.where("minimum_investment <= ?",params[:enter_max_value]).order(minimum_investment: :asc)
        else
          @records = Download.where("minimum_investment <=? and minimum_investment >= ?",params[:enter_max_value],params[:enter_min_value]).order(minimum_investment: :asc)       
        end

        when 'Expense Ratio'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("expense_ratio <= ?",params[:enter_max_value]).order(expense_ratio: :asc)
        else
          @records = Download.where("expense_ratio <= ? and expense_ratio >= ?",params[:enter_max_value],params[:enter_min_value]).order(expense_ratio: :asc)       
        end

        when '1-Month Return'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("one_month_return <= ?",params[:enter_max_value]).order(one_month_return: :asc)
        else
          @records = Download.where("one_month_return <= ? and one_month_return >= ?",params[:enter_max_value],params[:enter_min_value]).order(one_month_return: :asc)       
        end

        when '3-Month Return'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("three_month_return <= ?",params[:enter_max_value]).order(three_month_return: :asc)
        else
          @records = Download.where("three_month_return <= ? and three_month_return >= ?",params[:enter_max_value],params[:enter_min_value]).order(three_month_return: :asc)       
        end

        when '1-Year Return'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("one_year_return <= ?",params[:enter_max_value]).order(one_year_return: :asc)
        else
          @records = Download.where("one_year_return <= ? and one_year_return >=?",params[:enter_max_value],params[:enter_min_value]).order(one_year_return: :asc)       
        end

        when '3-Year Return'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("three_year_return <= ?",params[:enter_max_value]).order(three_year_return: :asc)
        else
          @records = Download.where("three_year_return <= ? and three_year_return >= ?",params[:enter_max_value],params[:enter_min_value]).order(three_year_return: :asc)       
        end

        when '5-Year Return'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("five_year_return <= ?",params[:enter_max_value]).order(five_year_return: :asc)
        else
          @records = Download.where("five_year_return <= ? and five_year_return >=?",params[:enter_max_value],params[:enter_min_value]).order(five_year_return: :asc)       
        end

        when '10-Year Return'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("ten_year_return <= ?",params[:enter_max_value]).order(ten_year_return: :asc)
        else
          @records = Download.where("ten_year_return <= ? and ten_year_return >= ?",params[:enter_max_value],params[:enter_min_value]).order(ten_year_return: :asc)       
        end

        when 'Net Assets'
        #@records = Download.where("expense_ratio > ?", params[:enter_number])
        if params[:enter_min_value].empty?
          @records = Download.where("net_assets <= ?",params[:enter_max_value]).order(net_assets: :asc)
        else
          @records = Download.where("net_assets <= ? and net_assets >= ?",params[:enter_max_value],params[:enter_min_value]).order(net_assets: :asc)       
        end
      else
       @records = Download.all
      end
    end
    render 'index'
  end


  def filter
  end

end
