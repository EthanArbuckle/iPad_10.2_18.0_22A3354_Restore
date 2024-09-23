@implementation WFMediaItemDescriptor

- (id)collectionForPlayback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_class();
  -[WFMediaItemDescriptor itemName](self, "itemName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMediaItemDescriptor persistentIdentifier](self, "persistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMediaItemDescriptor type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionForPlaybackWithItemName:persistentIdentifier:mediaType:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)descriptorForMPMediaEntity:(id)a3 mediaType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  WFMediaItemDescriptor *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "persistentID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("Song"));
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Playlist")) & 1) != 0)
    v9 = 0;
  else
    v9 = objc_msgSend(v6, "isEqualToString:", CFSTR("Song")) ^ 1;
  if ((v8 | v9) == 1)
  {
    v10 = v5;
  }
  else
  {
    objc_msgSend(v5, "representativeItem");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v12 = v6;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Playlist")) & 1) != 0)
  {
    v13 = CFSTR("name");
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Song")) & 1) != 0)
  {
    v13 = CFSTR("title");
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Album")) & 1) != 0
         || (objc_msgSend(v12, "isEqualToString:", CFSTR("Compilation")) & 1) != 0)
  {
    v13 = CFSTR("albumTitle");
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Artist")) & 1) != 0)
  {
    v13 = CFSTR("artist");
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Genre")) & 1) != 0)
  {
    v13 = CFSTR("genre");
  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("Composer")))
  {
    v13 = CFSTR("composer");
  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(v11, "valueForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFMediaItemDescriptor initWithMediaItemName:persistentIdentifier:mediaType:]([WFMediaItemDescriptor alloc], "initWithMediaItemName:persistentIdentifier:mediaType:", v14, v7, v12);

  return v15;
}

+ (id)collectionsOrItemsFromQuery:(id)a3 forMediaType:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("Song")) & 1) != 0)
    objc_msgSend(v5, "items");
  else
    objc_msgSend(v5, "collections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)allDescriptorsForMediaTypeUsingMPMediaQuery:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Playlist")))
  {
    objc_msgSend(getMPMediaQueryClass(), "playlistsQuery");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Song")))
  {
    objc_msgSend(getMPMediaQueryClass(), "songsQuery");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Album")))
  {
    objc_msgSend(getMPMediaQueryClass(), "albumsQuery");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Artist")))
  {
    objc_msgSend(getMPMediaQueryClass(), "artistsQuery");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Genre")))
  {
    objc_msgSend(getMPMediaQueryClass(), "genresQuery");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Compilation")))
  {
    objc_msgSend(getMPMediaQueryClass(), "compilationsQuery");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Composer")) & 1) == 0)
    {

      goto LABEL_18;
    }
    objc_msgSend(getMPMediaQueryClass(), "composersQuery");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  if (!v6)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  objc_msgSend(a1, "collectionsOrItemsFromQuery:forMediaType:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__WFMediaItemDescriptor_Library__allDescriptorsForMediaTypeUsingMPMediaQuery___block_invoke;
  v10[3] = &unk_1E7AF04A8;
  v12 = a1;
  v11 = v4;
  objc_msgSend(v7, "if_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v8;
}

+ (id)mpMediaQueryForPersistentIdentifier:(id)a3 withMediaType:(id)a4
{
  id v5;
  id v6;
  id MPMediaPropertyPredicateClass;
  id v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id result;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a3;
  v6 = a4;
  MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
  v8 = v6;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("Playlist")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("Song")))
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v9 = (id *)getMPMediaItemPropertyPersistentIDSymbolLoc_ptr;
      v27 = getMPMediaItemPropertyPersistentIDSymbolLoc_ptr;
      if (!getMPMediaItemPropertyPersistentIDSymbolLoc_ptr)
      {
        v13 = MediaPlayerLibrary();
        v9 = (id *)dlsym(v13, "MPMediaItemPropertyPersistentID");
        v25[3] = (uint64_t)v9;
        getMPMediaItemPropertyPersistentIDSymbolLoc_ptr = (uint64_t)v9;
      }
      _Block_object_dispose(&v24, 8);
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyPersistentID(void)");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("WFMediaItemDescriptor+Library.m"), 21, CFSTR("%s"), dlerror());
        goto LABEL_35;
      }
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Album")) & 1) != 0
           || objc_msgSend(v8, "isEqualToString:", CFSTR("Compilation")))
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v9 = (id *)getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr;
      v27 = getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr;
      if (!getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr)
      {
        v14 = MediaPlayerLibrary();
        v9 = (id *)dlsym(v14, "MPMediaItemPropertyAlbumPersistentID");
        v25[3] = (uint64_t)v9;
        getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr = (uint64_t)v9;
      }
      _Block_object_dispose(&v24, 8);
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyAlbumPersistentID(void)");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("WFMediaItemDescriptor+Library.m"), 22, CFSTR("%s"), dlerror());
        goto LABEL_35;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Artist")))
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v9 = (id *)getMPMediaItemPropertyArtistPersistentIDSymbolLoc_ptr;
      v27 = getMPMediaItemPropertyArtistPersistentIDSymbolLoc_ptr;
      if (!getMPMediaItemPropertyArtistPersistentIDSymbolLoc_ptr)
      {
        v21 = MediaPlayerLibrary();
        v9 = (id *)dlsym(v21, "MPMediaItemPropertyArtistPersistentID");
        v25[3] = (uint64_t)v9;
        getMPMediaItemPropertyArtistPersistentIDSymbolLoc_ptr = (uint64_t)v9;
      }
      _Block_object_dispose(&v24, 8);
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyArtistPersistentID(void)");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("WFMediaItemDescriptor+Library.m"), 23, CFSTR("%s"), dlerror());
        goto LABEL_35;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Genre")))
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v9 = (id *)getMPMediaItemPropertyGenrePersistentIDSymbolLoc_ptr;
      v27 = getMPMediaItemPropertyGenrePersistentIDSymbolLoc_ptr;
      if (!getMPMediaItemPropertyGenrePersistentIDSymbolLoc_ptr)
      {
        v22 = MediaPlayerLibrary();
        v9 = (id *)dlsym(v22, "MPMediaItemPropertyGenrePersistentID");
        v25[3] = (uint64_t)v9;
        getMPMediaItemPropertyGenrePersistentIDSymbolLoc_ptr = (uint64_t)v9;
      }
      _Block_object_dispose(&v24, 8);
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyGenrePersistentID(void)");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("WFMediaItemDescriptor+Library.m"), 25, CFSTR("%s"), dlerror());
        goto LABEL_35;
      }
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("Composer")))
      {
        v15 = 0;
        goto LABEL_17;
      }
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v9 = (id *)getMPMediaItemPropertyComposerPersistentIDSymbolLoc_ptr;
      v27 = getMPMediaItemPropertyComposerPersistentIDSymbolLoc_ptr;
      if (!getMPMediaItemPropertyComposerPersistentIDSymbolLoc_ptr)
      {
        v23 = MediaPlayerLibrary();
        v9 = (id *)dlsym(v23, "MPMediaItemPropertyComposerPersistentID");
        v25[3] = (uint64_t)v9;
        getMPMediaItemPropertyComposerPersistentIDSymbolLoc_ptr = (uint64_t)v9;
      }
      _Block_object_dispose(&v24, 8);
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyComposerPersistentID(void)");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("WFMediaItemDescriptor+Library.m"), 24, CFSTR("%s"), dlerror());
        goto LABEL_35;
      }
    }
LABEL_16:
    v15 = *v9;
LABEL_17:

    objc_msgSend(MPMediaPropertyPredicateClass, "predicateWithValue:forProperty:", v5, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc((Class)getMPMediaQueryClass());
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithFilterPredicates:", v18);

    return v19;
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v9 = (id *)getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr;
  v27 = getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr;
  if (!getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr)
  {
    v10 = MediaPlayerLibrary();
    v9 = (id *)dlsym(v10, "MPMediaPlaylistPropertyPersistentID");
    v25[3] = (uint64_t)v9;
    getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v24, 8);
  if (v9)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPMediaPlaylistPropertyPersistentID(void)");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("WFMediaItemDescriptor+Library.m"), 20, CFSTR("%s"), dlerror());
LABEL_35:

  __break(1u);
  return result;
}

+ (id)descriptorWithPersistentIdentifier:(id)a3 mediaType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a1, "mpMediaQueryForPersistentIdentifier:withMediaType:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "collectionsOrItemsFromQuery:forMediaType:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "descriptorForMPMediaEntity:mediaType:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)mpMediaQueryForName:(id)a3 withMediaType:(id)a4
{
  id v5;
  id v6;
  id MPMediaPropertyPredicateClass;
  id v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id result;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a3;
  v6 = a4;
  MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
  v8 = v6;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("Playlist")))
  {
    switch(WFGroupingPropertyForMediaType(v8))
    {
      case 1:
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v9 = (id *)getMPMediaItemPropertyAlbumTitleSymbolLoc_ptr;
        v28 = getMPMediaItemPropertyAlbumTitleSymbolLoc_ptr;
        if (!getMPMediaItemPropertyAlbumTitleSymbolLoc_ptr)
        {
          v18 = MediaPlayerLibrary();
          v9 = (id *)dlsym(v18, "MPMediaItemPropertyAlbumTitle");
          v26[3] = (uint64_t)v9;
          getMPMediaItemPropertyAlbumTitleSymbolLoc_ptr = (uint64_t)v9;
        }
        _Block_object_dispose(&v25, 8);
        if (v9)
          goto LABEL_5;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyAlbumTitle(void)");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFMediaItemDescriptor+Library.m"), 28, CFSTR("%s"), dlerror());
        break;
      case 2:
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v9 = (id *)getMPMediaItemPropertyArtistSymbolLoc_ptr;
        v28 = getMPMediaItemPropertyArtistSymbolLoc_ptr;
        if (!getMPMediaItemPropertyArtistSymbolLoc_ptr)
        {
          v21 = MediaPlayerLibrary();
          v9 = (id *)dlsym(v21, "MPMediaItemPropertyArtist");
          v26[3] = (uint64_t)v9;
          getMPMediaItemPropertyArtistSymbolLoc_ptr = (uint64_t)v9;
        }
        _Block_object_dispose(&v25, 8);
        if (v9)
          goto LABEL_5;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyArtist(void)");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFMediaItemDescriptor+Library.m"), 29, CFSTR("%s"), dlerror());
        break;
      case 3:
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v9 = (id *)getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr;
        v28 = getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr;
        if (!getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr)
        {
          v22 = MediaPlayerLibrary();
          v9 = (id *)dlsym(v22, "MPMediaItemPropertyAlbumArtist");
          v26[3] = (uint64_t)v9;
          getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr = (uint64_t)v9;
        }
        _Block_object_dispose(&v25, 8);
        if (v9)
          goto LABEL_5;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyAlbumArtist(void)");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFMediaItemDescriptor+Library.m"), 30, CFSTR("%s"), dlerror());
        break;
      case 4:
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v9 = (id *)getMPMediaItemPropertyComposerSymbolLoc_ptr;
        v28 = getMPMediaItemPropertyComposerSymbolLoc_ptr;
        if (!getMPMediaItemPropertyComposerSymbolLoc_ptr)
        {
          v23 = MediaPlayerLibrary();
          v9 = (id *)dlsym(v23, "MPMediaItemPropertyComposer");
          v26[3] = (uint64_t)v9;
          getMPMediaItemPropertyComposerSymbolLoc_ptr = (uint64_t)v9;
        }
        _Block_object_dispose(&v25, 8);
        if (v9)
          goto LABEL_5;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyComposer(void)");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFMediaItemDescriptor+Library.m"), 31, CFSTR("%s"), dlerror());
        break;
      case 5:
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v9 = (id *)getMPMediaItemPropertyGenreSymbolLoc_ptr;
        v28 = getMPMediaItemPropertyGenreSymbolLoc_ptr;
        if (!getMPMediaItemPropertyGenreSymbolLoc_ptr)
        {
          v24 = MediaPlayerLibrary();
          v9 = (id *)dlsym(v24, "MPMediaItemPropertyGenre");
          v26[3] = (uint64_t)v9;
          getMPMediaItemPropertyGenreSymbolLoc_ptr = (uint64_t)v9;
        }
        _Block_object_dispose(&v25, 8);
        if (v9)
          goto LABEL_5;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyGenre(void)");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFMediaItemDescriptor+Library.m"), 32, CFSTR("%s"), dlerror());
        break;
      default:
        getMPMediaItemPropertyTitle();
        v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
    }
    goto LABEL_30;
  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v9 = (id *)getMPMediaPlaylistPropertyNameSymbolLoc_ptr;
  v28 = getMPMediaPlaylistPropertyNameSymbolLoc_ptr;
  if (!getMPMediaPlaylistPropertyNameSymbolLoc_ptr)
  {
    v10 = MediaPlayerLibrary();
    v9 = (id *)dlsym(v10, "MPMediaPlaylistPropertyName");
    v26[3] = (uint64_t)v9;
    getMPMediaPlaylistPropertyNameSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v25, 8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMPMediaPlaylistPropertyName(void)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFMediaItemDescriptor+Library.m"), 26, CFSTR("%s"), dlerror());
LABEL_30:

    __break(1u);
    return result;
  }
LABEL_5:
  v11 = *v9;
LABEL_6:
  v12 = v11;

  objc_msgSend(MPMediaPropertyPredicateClass, "predicateWithValue:forProperty:", v5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc((Class)getMPMediaQueryClass());
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFilterPredicates:", v15);

  objc_msgSend(v16, "setGroupingType:", WFGroupingPropertyForMediaType(v8));
  return v16;
}

+ (id)itemCollectionFromQuery:(id)a3 mediaType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "collectionsOrItemsFromQuery:forMediaType:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  getMPMediaItemCollectionClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v11 = (void *)getMPMediaItemClass_softClass;
    v20 = getMPMediaItemClass_softClass;
    if (!getMPMediaItemClass_softClass)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __getMPMediaItemClass_block_invoke;
      v16[3] = &unk_1E7AF9520;
      v16[4] = &v17;
      __getMPMediaItemClass_block_invoke((uint64_t)v16);
      v11 = (void *)v18[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v17, 8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_alloc((Class)getMPMediaItemCollectionClass());
      v21[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v13, "initWithItems:", v14);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

+ (id)collectionForPlaybackWithItemName:(id)a3 persistentIdentifier:(id)a4 mediaType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9
    || (objc_msgSend(a1, "mpMediaQueryForPersistentIdentifier:withMediaType:", v9, v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1, "itemCollectionFromQuery:mediaType:", v11, v10),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(a1, "mpMediaQueryForName:withMediaType:", v8, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "itemCollectionFromQuery:mediaType:", v13, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

uint64_t __78__WFMediaItemDescriptor_Library__allDescriptorsForMediaTypeUsingMPMediaQuery___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "descriptorForMPMediaEntity:mediaType:", a2, *(_QWORD *)(a1 + 32));
}

- (WFMediaItemDescriptor)initWithMediaItemName:(id)a3 persistentIdentifier:(id)a4 mediaType:(id)a5
{
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  WFMediaItemDescriptor *v13;
  uint64_t v14;
  NSString *itemName;
  uint64_t v16;
  NSNumber *persistentIdentifier;
  uint64_t v18;
  NSString *type;
  WFMediaItemDescriptor *v20;
  void *v22;
  void *v23;
  objc_super v24;

  v9 = (unint64_t)a3;
  v10 = (unint64_t)a4;
  v11 = a5;
  v12 = v11;
  if (v9 | v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMediaItemState.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemName || persistentIdentifier"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMediaItemState.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)WFMediaItemDescriptor;
  v13 = -[MTLModel init](&v24, sel_init);
  if (v13)
  {
    v14 = objc_msgSend((id)v9, "copy");
    itemName = v13->_itemName;
    v13->_itemName = (NSString *)v14;

    v16 = objc_msgSend((id)v10, "copy");
    persistentIdentifier = v13->_persistentIdentifier;
    v13->_persistentIdentifier = (NSNumber *)v16;

    v18 = objc_msgSend(v12, "copy");
    type = v13->_type;
    v13->_type = (NSString *)v18;

    v20 = v13;
  }

  return v13;
}

- (WFMediaItemDescriptor)initWithMediaItemName:(id)a3 playbackArchiveData:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFMediaItemDescriptor *v10;
  uint64_t v11;
  NSString *itemName;
  uint64_t v13;
  NSData *playbackArchiveData;
  NSString *type;
  WFMediaItemDescriptor *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMediaItemState.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemName"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMediaItemState.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("playbackArchiveData"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)WFMediaItemDescriptor;
  v10 = -[MTLModel init](&v20, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    itemName = v10->_itemName;
    v10->_itemName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    playbackArchiveData = v10->_playbackArchiveData;
    v10->_playbackArchiveData = (NSData *)v13;

    type = v10->_type;
    v10->_type = (NSString *)CFSTR("PlaybackArchive");

    v16 = v10;
  }

  return v10;
}

- (WFMediaItemDescriptor)initWithIntent:(id)a3
{
  id v5;
  WFMediaItemDescriptor *v6;
  uint64_t v7;
  INPlayMediaIntent *intent;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *itemName;
  NSString *type;
  WFMediaItemDescriptor *v14;
  void *v16;
  objc_super v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMediaItemState.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("intent"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFMediaItemDescriptor;
  v6 = -[MTLModel init](&v17, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    intent = v6->_intent;
    v6->_intent = (INPlayMediaIntent *)v7;

    objc_msgSend(v5, "mediaContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    itemName = v6->_itemName;
    v6->_itemName = (NSString *)v11;

    type = v6->_type;
    v6->_type = (NSString *)CFSTR("ContextualActionIntent");

    v14 = v6;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  WFMediaItemDescriptor *v7;
  WFMediaItemDescriptor *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  char v27;

  v7 = (WFMediaItemDescriptor *)a3;
  if (self == v7)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      -[WFMediaItemDescriptor itemName](self, "itemName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9
        || (-[WFMediaItemDescriptor itemName](v8, "itemName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[WFMediaItemDescriptor itemName](self, "itemName");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFMediaItemDescriptor itemName](v8, "itemName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v4, "isEqual:", v10);

        if (v9)
        {
LABEL_11:

          -[WFMediaItemDescriptor persistentIdentifier](self, "persistentIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12
            || (-[WFMediaItemDescriptor persistentIdentifier](v8, "persistentIdentifier"),
                (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[WFMediaItemDescriptor persistentIdentifier](self, "persistentIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFMediaItemDescriptor persistentIdentifier](v8, "persistentIdentifier");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqual:", v5);

            if (v12)
            {
LABEL_17:

              -[WFMediaItemDescriptor type](self, "type");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFMediaItemDescriptor type](v8, "type");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v15, "isEqual:", v16);

              -[WFMediaItemDescriptor playbackArchiveData](self, "playbackArchiveData");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18
                || (-[WFMediaItemDescriptor playbackArchiveData](v8, "playbackArchiveData"),
                    (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
              {
                -[WFMediaItemDescriptor playbackArchiveData](self, "playbackArchiveData");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFMediaItemDescriptor playbackArchiveData](v8, "playbackArchiveData");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v19, "isEqual:", v20);

                if (v18)
                {
LABEL_23:

                  -[WFMediaItemDescriptor intent](self, "intent");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v22
                    || (-[WFMediaItemDescriptor intent](v8, "intent"),
                        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                  {
                    -[WFMediaItemDescriptor intent](self, "intent");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WFMediaItemDescriptor intent](v8, "intent");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = objc_msgSend(v23, "isEqual:", v24);

                    if (v22)
                    {
LABEL_29:

                      v11 = v27 & v14 & v17 & v21 & v25;
                      goto LABEL_30;
                    }
                  }
                  else
                  {
                    v25 = 1;
                  }

                  goto LABEL_29;
                }
              }
              else
              {
                v21 = 1;
              }

              goto LABEL_23;
            }
          }
          else
          {
            v14 = 1;
          }

          goto LABEL_17;
        }
      }
      else
      {
        v27 = 1;
      }

      goto LABEL_11;
    }
    v11 = 0;
  }
LABEL_30:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[WFMediaItemDescriptor itemName](self, "itemName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFMediaItemDescriptor persistentIdentifier](self, "persistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[WFMediaItemDescriptor type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[WFMediaItemDescriptor playbackArchiveData](self, "playbackArchiveData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[WFMediaItemDescriptor intent](self, "intent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (NSString)itemName
{
  return self->_itemName;
}

- (NSNumber)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (NSData)playbackArchiveData
{
  return self->_playbackArchiveData;
}

- (NSString)type
{
  return self->_type;
}

- (INPlayMediaIntent)intent
{
  return self->_intent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_playbackArchiveData, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
}

+ (id)playbackArchiveDataJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", &__block_literal_global_46462, &__block_literal_global_139_46463);
}

+ (id)intentJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", &__block_literal_global_140, &__block_literal_global_144_46459);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "mtl_identityPropertyMapWithModel:", a1);
}

id __46__WFMediaItemDescriptor_intentJSONTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(a2, "_JSONDictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __46__WFMediaItemDescriptor_intentJSONTransformer__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a2, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CBDA70]);
  objc_msgSend(v3, "_updateWithJSONDictionary:", v2);

  return v3;
}

uint64_t __59__WFMediaItemDescriptor_playbackArchiveDataJSONTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
}

id __59__WFMediaItemDescriptor_playbackArchiveDataJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0C99D50];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithBase64EncodedString:options:", v3, 0);

  return v4;
}

@end
