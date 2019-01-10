# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    def index
      @items = Item.all.order(created_at: :desc)
    end

    def edit
      @item = Item.find(params[:id])
    end

    # def update
    #   @item = Item.find(params[:id])
    #   @item.update(item_params)
    #   redirect_to administration_items_path, alert: "L'item a bien été modifié."
    # end

    def update
      @item = Item.find(params[:id])
      puts @item.id
      if params[:item][:discount_percentage].to_f > 100
        flash[:alert] = "Veuillez entrer une réduction valable"
      else
        item_params = params.require(:item).permit(:discount_percentage)
        @item.update(item_params)
        flash[:notice] = "L'item a bien été modifié"
      end
      if @item.discount_percentage.positive?
        @item.update(has_discount: true)
      elsif @item.discount_percentage = 0
        @item.update(has_discount: false)
      end
      redirect_to administration_items_path
    end

    private

    def item_params
      params.require(:item).permit(:discount_percentage)
    end
  end
end
