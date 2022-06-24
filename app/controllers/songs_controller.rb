class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
        @genre = @song.genre
        @artist = @song.artist
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(name: params[:song][:name], artist: Artist.find(params[:song][:artist_id]), genre: Genre.find(params[:song][:genre_id]))
        redirect_to song_path(@song)
    end

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_path
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.update(name: params[:song][:name], artist: Artist.find(params[:song][:artist_id]), genre: Genre.find(params[:song][:genre_id]))
        redirect_to song_path(@song)
    end

end
