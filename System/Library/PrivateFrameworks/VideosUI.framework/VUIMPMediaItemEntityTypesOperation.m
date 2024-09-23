@implementation VUIMPMediaItemEntityTypesOperation

- (VUIMPMediaItemEntityTypesOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VUIMPMediaItemEntityTypesOperation)initWithMPMediaLibrary:(id)a3
{
  id v5;
  VUIMPMediaItemEntityTypesOperation *v6;
  VUIMPMediaItemEntityTypesOperation *v7;
  objc_super v9;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaLibrary"));
  v9.receiver = self;
  v9.super_class = (Class)VUIMPMediaItemEntityTypesOperation;
  v6 = -[VUIMPMediaItemEntityTypesOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);

  return v7;
}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  VUIMediaItemEntityTypesFetchResponse *v9;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  if (-[VUIMPMediaItemEntityTypesOperation _mediaLibraryHasEpisodes](self, "_mediaLibraryHasEpisodes"))
  {
    +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v3);

  }
  if (-[VUIMPMediaItemEntityTypesOperation _mediaLibraryHasHasHomeVideos](self, "_mediaLibraryHasHasHomeVideos"))
  {
    +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v4);

  }
  if (-[VUIMPMediaItemEntityTypesOperation _mediaLibraryHasMovies](self, "_mediaLibraryHasMovies"))
  {
    +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v5);

  }
  if (-[VUIMPMediaItemEntityTypesOperation _mediaLibraryHasMovieRentals](self, "_mediaLibraryHasMovieRentals"))
  {
    +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v6);

  }
  +[VUIMediaLibraryUtilities mediaItemEntityTypesSortComparator](VUIMediaLibraryUtilities, "mediaItemEntityTypesSortComparator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortUsingComparator:", v7);

  v8 = -[VUIMPMediaItemEntityTypesOperation _mediaLibraryHasLocalMediaItems](self, "_mediaLibraryHasLocalMediaItems");
  v9 = objc_alloc_init(VUIMediaItemEntityTypesFetchResponse);
  -[VUIMediaItemEntityTypesFetchResponse setMediaItemEntityTypes:](v9, "setMediaItemEntityTypes:", v10);
  -[VUIMediaItemEntityTypesFetchResponse setLocalMediaItemsAvailable:](v9, "setLocalMediaItemsAvailable:", v8);
  -[VUIMPMediaItemEntityTypesOperation setResponse:](self, "setResponse:", v9);
  -[VUIAsynchronousOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");

}

- (BOOL)_mediaLibraryHasMovies
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  char v6;
  void *v7;

  -[VUIMPMediaItemEntityTypesOperation mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VUIMPMediaItemEntityTypesOperation _canUseCheapEntityCheckWithMediaEntityType:](self, "_canUseCheapEntityCheckWithMediaEntityType:", v4);

  if (v5)
  {
    v6 = objc_msgSend(v3, "hasMovies");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC2438], "vui_moviesQueryWithMediaLibrary:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VUIMPMediaItemEntityTypesOperation _mediaLibraryHasMediaItemsWithQuery:](self, "_mediaLibraryHasMediaItemsWithQuery:", v7);

  }
  return v6;
}

- (BOOL)_mediaLibraryHasMovieRentals
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  char v6;
  void *v7;

  -[VUIMPMediaItemEntityTypesOperation mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VUIMPMediaItemEntityTypesOperation _canUseCheapEntityCheckWithMediaEntityType:](self, "_canUseCheapEntityCheckWithMediaEntityType:", v4);

  if (v5)
  {
    v6 = objc_msgSend(v3, "hasMovieRentals");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC2438], "vui_movieRentalsQueryWithMediaLibrary:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VUIMPMediaItemEntityTypesOperation _mediaLibraryHasMediaItemsWithQuery:](self, "_mediaLibraryHasMediaItemsWithQuery:", v7);

  }
  return v6;
}

- (BOOL)_mediaLibraryHasEpisodes
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  char v6;
  void *v7;

  -[VUIMPMediaItemEntityTypesOperation mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VUIMPMediaItemEntityTypesOperation _canUseCheapEntityCheckWithMediaEntityType:](self, "_canUseCheapEntityCheckWithMediaEntityType:", v4);

  if (v5)
  {
    v6 = objc_msgSend(v3, "hasTVShows");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC2438], "vui_episodesQueryWithMediaLibrary:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VUIMPMediaItemEntityTypesOperation _mediaLibraryHasMediaItemsWithQuery:](self, "_mediaLibraryHasMediaItemsWithQuery:", v7);

  }
  return v6;
}

- (BOOL)_mediaLibraryHasHasHomeVideos
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  char v6;
  void *v7;

  -[VUIMPMediaItemEntityTypesOperation mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VUIMPMediaItemEntityTypesOperation _canUseCheapEntityCheckWithMediaEntityType:](self, "_canUseCheapEntityCheckWithMediaEntityType:", v4);

  if (v5)
  {
    v6 = objc_msgSend(v3, "hasHomeVideos");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC2438], "vui_homeVideosQueryWithMediaLibrary:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[VUIMPMediaItemEntityTypesOperation _mediaLibraryHasMediaItemsWithQuery:](self, "_mediaLibraryHasMediaItemsWithQuery:", v7);

  }
  return v6;
}

- (BOOL)_mediaLibraryHasLocalMediaItems
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[VUIMPMediaItemEntityTypesOperation mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "vui_isDeviceMediaLibrary");

  if (!v4)
    return 0;
  objc_msgSend(MEMORY[0x1E0CC2428], "vui_isLocalPredicate:comparison:", 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2438]), "initWithFilterPredicates:", v6);
  v8 = -[VUIMPMediaItemEntityTypesOperation _mediaLibraryHasMediaItemsWithQuery:](self, "_mediaLibraryHasMediaItemsWithQuery:", v7);

  return v8;
}

- (BOOL)_canUseCheapEntityCheckWithMediaEntityType:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  char v9;
  BOOL v10;

  v4 = a3;
  -[VUIMPMediaItemEntityTypesOperation mediaLibrary](self, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "vui_isDeviceMediaLibrary");

  if (v6)
  {
    v7 = objc_msgSend(v4, "mediaCategoryType");
    if (v7 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC6A60], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "allowsShowingUndownloadedTVShows");
    }
    else
    {
      if (v7)
      {
        v10 = 1;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0DC6A60], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "allowsShowingUndownloadedMovies");
    }
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }
LABEL_9:

  return v10;
}

- (BOOL)_mediaLibraryHasMediaItemsWithQuery:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "setEntityLimit:", 1);
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "count") != 0;
  return (char)v3;
}

- (VUIMediaItemEntityTypesFetchResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
