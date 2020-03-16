class UsersController < ApplicationController 
    include Pagy::Backend
    
    
    def index 
        @pagy, @users = pagy(User.all, items: params[:per_page] || 20) 
       

        respond_to do |format|
            format.html
            format.json do
               render json: @users, ###???
                #Cac thuoc tinh duoc nhac den  
                      adapter: :json,
                      each_serializer: UserSerializer,
                      meta: {
                        total: @pagy.count , page: @pagy.page,
                        from: @pagy.from , to: @pagy.to , 
                        series: @pagy.series
                      }

            end 
        end 
    end 
    
    def show
        render json: User.find(params[:id])
    end   
    
    def update 
        user = User.find(params[:id])
    end     
def create 
        user = User.new(user_params)
    ##ng dung save tu form vue
    if user.save
        render json: user.to_json, status: :created
    else 
        render json: user.errors.to_hash(true), status: :unprocessable_entity
    end 
end

def update 
    user = User.find(params[:id])

    if user.update(user_params)
        render json: user.to_json, status: :created
    else 
        render json: user.errors.to_hash(true), status: :unprocessable_entity
    end 
end     
    ###khi create can param.require..permit.. 
    private 
    def user_params
        params.require(:user).permit(:name,:description,:gender,:school_id)
    end     

end    