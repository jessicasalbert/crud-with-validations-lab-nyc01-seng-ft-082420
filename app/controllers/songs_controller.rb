class SongsController < ApplicationController
    before_action :find_song, only: [:show, :update, :edit, :destroy]

    def show
    end

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params)
        if params[:song][:released] == "1"
            @song.released = true
        else
            @song.released = false
        end
        @song.save
        byebug
        redirect_to song_path(@song)
    end

    def update
        #byebug
        @song.update(song_params)
        redirect_to song_path(@song)
    end

    def edit
    end

    def destroy
    end



    private
    def find_song
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title, :artist_name, :release_year, :genre)
    end

end
