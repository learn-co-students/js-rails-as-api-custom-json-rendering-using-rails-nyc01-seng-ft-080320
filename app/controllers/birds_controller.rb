class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  def show 
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: {message: 'Bird not found'}
    end
  end
end

# EXAMPLE - rendering specific content from API
# def show 
#   bird = Bird.find_by(id: params[:id]) =>> "find a bird in the database by the given id number"
#   render json: bird {id: bird.id, name: bird.name, species: bird.species} =>> "with that found bird, render only its id, name, & species"
#   altSyntax: render json: bird.slice(:id, :name, :species)
# end
#      //////////////////////
# render json: birds =>> for plurals such as the one in #index, the {only: []} method is needed (below:)
# syntax: render json: birds, only: {:id, :name, :species}
# altSyntax: render json: birds, except: [:created_at, :updated_at]
# !EXAMPLE

#full CRUD based controllers that only render JSON are possible 

# EXAMPLE - .to_json[only:, except]
# only: && except: are actually parameters of .to_json. that can be written explicitley to show their relationship to each other in birds#index
# altSyntax: render json: birds, except: [:created_at, :updated_at] === render json: birds.to_json(except: [:created_at, :updated_at])
# !EXAMPLE

# EXPLAINED - basic error messages when rendering JSON data
# def show 
#   bird = Bird.find_by(id: params[:id]) =>> "find this particular bird with this given id"
#   if bird =>> "if this bird was found..."
#     render json: bird.slice(:id, :name, :species) =>> "render its id, name, and species."
#   else =>> "if this bird was NOT found..."
#     render json: {message: 'Bird not found'} =>> "render this message"
#   end
# end
# !EXPLAINED - 
