class SearchController < ApplicationController
  def search
    @model = params[:search_model]
    @content = params[:search_content]
    @how = params[:search_how]
    @datas = search_for(@model, @content, @how)
  end
  
  private
  
  def match(model, content)
    if model == 'User'
      User.where(name: content)
    elsif model == 'Book'
      Book.where(title: content)
    end
  end
  
  def forward(model, content)
    if model == 'User'
      User.where("name LIKE ?", "#{content}%")
    elsif model == 'Book'  
      Book.where("title LIKE ?", "#{content}%")
    end
  end
  
  def backward(model, content)
    if model == 'User'
      User.where("name LIKE ?", "%#{content}")  
    elsif model == 'Book'
      Book.where("title LIKE ?", "%#{content}")
    end
  end
  
  def partical(model, content)
    if model == 'User'
      User.where("name LIKE ?", "%#{content}%")
    elsif model == 'Book'
      Book.where("title LIKE ?", "%#{content}%")
    end
  end
    
  def search_for(model, content, how)
    case how
    when 'match'
      match(model, content)
    when 'forward'
      forward(model, content)
    when 'backward'
      backward(model, content)
    when 'partical'
      partical(model, content)
    end  
  end
end
