class SongsController < ApplicationController
    def show
        @song = Song.find(params[:id])
    end

    def index
        @songs = Song.all
    end

    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def new
        @song = Song.new
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        if @song.update(song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        Song.find(params[:id]).destroy
        redirect_to songs_path
    end

    private
        def song_params
            params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
        end

end
