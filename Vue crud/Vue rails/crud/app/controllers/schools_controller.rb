class SchoolController < ApplicationController

    def index 
       schools = School.all 

       render json: schools
    end 

end    
