class StoriesController < ApplicationController

    def index
        stories = Story.all
        render json: {
            stories: stories
        }
    end

    def show
        story = Story.find_by(id: params[:id])
        render json: {
            story: story
        }
    end

    def new
    end

    def create
        story = Story.create(story_params)

        if story.valid?
            render json: story
        else
            render json: {error: "Unable to save story at this time"}
        end
    end

    def edit
        story = Story.find_by(id: params[:id])
    end

    def update
        story = Story.find_by(id: params[:id])
        story.update(story_params)
        
        if story.valid?
            story.save
            render json: story
        else
            render json: {error: "Unable to save your edits to this story at this time"}
        end
    end

    def destroy
        story.destroy
        render json: story
    end

    private

    def story_params
        params.require(:story).permit(:id, :date, :transcriber, :contributor, :contact_email, :contact_phone, :summary, :story, :image )
    end

end
