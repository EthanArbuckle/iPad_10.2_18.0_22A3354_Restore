@implementation SUScriptMediaLibrary

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaLibrary;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)containsAdamID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  dispatch_time_t v7;
  id *v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (SSGetUnsignedLongLongFromValue())
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD16E0]);
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v5 = dispatch_semaphore_create(0);
    dispatch_retain(v5);
    v6 = +[SUMediaLibraryAdamIDCache sharedCache](SUMediaLibraryAdamIDCache, "sharedCache");
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __39__SUScriptMediaLibrary_containsAdamID___block_invoke;
    v10[3] = &unk_24DE7C9E0;
    v10[5] = v5;
    v10[6] = &v11;
    v10[4] = self;
    objc_msgSend(v6, "getContainsAdamID:completionBlock:", v4, v10);
    v7 = dispatch_time(0, 500000000);
    dispatch_semaphore_wait(v5, v7);
    dispatch_release(v5);
    -[SUScriptObject lock](self, "lock");
    LODWORD(v5) = *((unsigned __int8 *)v12 + 24);
    -[SUScriptObject unlock](self, "unlock");

    _Block_object_dispose(&v11, 8);
    v8 = (id *)MEMORY[0x24BDBD270];
    if (!(_DWORD)v5)
      v8 = (id *)MEMORY[0x24BDBD268];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v8 = (id *)MEMORY[0x24BDBD268];
  }
  return *v8;
}

void __39__SUScriptMediaLibrary_containsAdamID___block_invoke(uint64_t a1, char a2)
{
  objc_msgSend(*(id *)(a1 + 32), "lock");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

- (id)containsAdamIDs:(id)a3
{
  OpaqueJSContext *v5;
  const OpaqueJSContext *v6;
  OpaqueJSValue *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  dispatch_time_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __CFString *v20;
  void *v21;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = -[SUScriptObject copyJavaScriptContext](self, "copyJavaScriptContext");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = JSObjectMake(v5, 0, 0);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(a3, "webScriptValueAtIndex:", 0);
  v9 = SSGetUnsignedLongLongFromValue();
  if (v9)
  {
    v10 = v9;
    v11 = 1;
    do
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithItemIdentifier:", v10);
      objc_msgSend(v8, "addObject:", v12);

      objc_msgSend(a3, "webScriptValueAtIndex:", v11);
      v10 = SSGetUnsignedLongLongFromValue();
      v11 = (v11 + 1);
    }
    while (v10);
  }
  v24 = v8;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3052000000;
  v33 = __Block_byref_object_copy__20;
  v34 = __Block_byref_object_dispose__20;
  v35 = 0;
  v35 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v13 = dispatch_semaphore_create(0);
  dispatch_retain(v13);
  v14 = +[SUMediaLibraryAdamIDCache sharedCache](SUMediaLibraryAdamIDCache, "sharedCache");
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __40__SUScriptMediaLibrary_containsAdamIDs___block_invoke;
  v29[3] = &unk_24DE7CA08;
  v29[5] = v13;
  v29[6] = &v30;
  v29[4] = self;
  objc_msgSend(v14, "getIntersectionWithSet:completionBlock:", v8, v29);
  v15 = dispatch_time(0, 500000000);
  dispatch_semaphore_wait(v13, v15);
  dispatch_release(v13);
  -[SUScriptObject lock](self, "lock");
  v23 = a3;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = (void *)v31[5];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v16);
        v20 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%llu"), objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "itemIdentifierValue"));
        SUJSObjectSetBooleanProperty(v6, v7, v20);

      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    }
    while (v17);
  }

  v31[5] = 0;
  -[SUScriptObject unlock](self, "unlock");

  v21 = (void *)objc_msgSend(MEMORY[0x24BDFA950], "scriptObjectForJSObject:originRootObject:rootObject:", v7, objc_msgSend(v23, "_originRootObject"), objc_msgSend(v23, "_rootObject"));
  JSGlobalContextRelease(v6);
  _Block_object_dispose(&v30, 8);
  return v21;
}

void __40__SUScriptMediaLibrary_containsAdamIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "unionSet:", a2);
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

- (void)getProperties:(id)a3 ofAdamIDs:(id)a4 withCompletionFunction:(id)a5
{
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = (void *)objc_msgSend(a4, "copyArrayValueWithValidator:context:", SUISAValidator, objc_opt_class());
    v10 = (void *)objc_msgSend(a3, "copyArrayValueWithValidator:context:", SUISAValidator, objc_opt_class());
    if (objc_msgSend(v9, "count") && objc_msgSend(v10, "count"))
    {
      v11 = +[SUMediaLibraryAdamIDCache sharedCache](SUMediaLibraryAdamIDCache, "sharedCache");
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __71__SUScriptMediaLibrary_getProperties_ofAdamIDs_withCompletionFunction___block_invoke;
      v12[3] = &unk_24DE7CA30;
      v12[4] = a5;
      v12[5] = self;
      objc_msgSend(v11, "getProperties:ofAdamIDs:withCompletionBlock:", v10, v9, v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

void __71__SUScriptMediaLibrary_getProperties_ofAdamIDs_withCompletionFunction___block_invoke(uint64_t a1, void *a2)
{
  SUScriptFunction *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SUScriptMediaItem *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", *(_QWORD *)(a1 + 32));
  -[SUScriptFunction setThisObject:](v4, "setThisObject:", *(_QWORD *)(a1 + 40));
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(a2);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = objc_alloc_init(SUScriptMediaItem);
        -[SUScriptObject setNativeObject:](v11, "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v10));
        objc_msgSend(v5, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  -[SUScriptFunction callWithArguments:](v4, "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v5, 0));

  -[SUScriptFunction setThisObject:](v4, "setThisObject:", 0);
}

- (id)makeCollectionWithItems:(id)a3
{
  SUScriptMediaItemCollection *v5;
  SUScriptMediaItemCollection *v6;

  if (-[SUScriptMediaLibrary _isRestricted](self, "_isRestricted"))
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = -[SUScriptMediaItemCollection initWithItems:]([SUScriptMediaItemCollection alloc], "initWithItems:", a3);
  if (!v5)
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = v5;
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);
  return v6;
}

- (id)makePickerWithMediaTypes:(id)a3
{
  SUScriptMediaPickerController *v5;
  SUScriptMediaPickerController *v6;

  if (-[SUScriptMediaLibrary _isRestricted](self, "_isRestricted"))
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = -[SUScriptMediaPickerController initWithMediaTypes:]([SUScriptMediaPickerController alloc], "initWithMediaTypes:", a3);
  if (!v5)
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = v5;
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v5);
  return v6;
}

- (id)makeQueryWithPreset:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__20;
  v13 = __Block_byref_object_dispose__20;
  v14 = 0;
  if (!-[SUScriptMediaLibrary _isRestricted](self, "_isRestricted"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (a3 == 0) | objc_opt_isKindOfClass() & 1)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      WebThreadRunOnMainThread();
      -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v10[5]);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    }
  }
  v5 = (void *)v10[5];
  if (v5)
    v6 = v5;
  else
    v6 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = v6;
  _Block_object_dispose(&v9, 8);
  return v7;
}

uint64_t __44__SUScriptMediaLibrary_makeQueryWithPreset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetAlbums")))
  {
    v2 = objc_msgSend(MEMORY[0x24BDDC818], "albumsQuery");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetArtists")))
  {
    v2 = objc_msgSend(MEMORY[0x24BDDC818], "artistsQuery");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetSongs")))
  {
    v2 = objc_msgSend(MEMORY[0x24BDDC818], "songsQuery");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetPlaylists")))
  {
    v2 = objc_msgSend(MEMORY[0x24BDDC818], "playlistsQuery");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetPodcasts")))
  {
    v2 = objc_msgSend(MEMORY[0x24BDDC818], "podcastsQuery");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetAudiobooks")))
  {
    v2 = objc_msgSend(MEMORY[0x24BDDC818], "audiobooksQuery");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetCompilations")))
  {
    v2 = objc_msgSend(MEMORY[0x24BDDC818], "compilationsQuery");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetComposers")))
  {
    v2 = objc_msgSend(MEMORY[0x24BDDC818], "composersQuery");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetGenres")))
  {
    v2 = objc_msgSend(MEMORY[0x24BDDC818], "genresQuery");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetMovies")))
  {
    v2 = objc_msgSend(MEMORY[0x24BDDC818], "moviesQuery");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetMusicVideos")))
  {
    v2 = objc_msgSend(MEMORY[0x24BDDC818], "musicVideosQuery");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetTVShows")))
  {
    v2 = objc_msgSend(MEMORY[0x24BDDC818], "tvShowsQuery");
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(a1 + 40), "queryPresetVideoPodcasts")))
    {
LABEL_28:
      v3 = objc_alloc_init(MEMORY[0x24BDDC818]);
      goto LABEL_29;
    }
    v2 = objc_msgSend(MEMORY[0x24BDDC818], "videoPodcastsQuery");
  }
  v3 = (id)v2;
  if (!v2)
    goto LABEL_28;
LABEL_29:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_alloc_init(SUScriptMediaQuery);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v3));
}

- (id)musicPlayerForType:(id)a3
{
  NSMutableArray *musicPlayers;
  uint64_t v6;
  uint64_t v7;
  SUScriptMusicPlayerController *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  SUScriptMusicPlayerController *v13;
  NSMutableArray *v14;
  SUScriptMusicPlayerController *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  }
  if (-[SUScriptMediaLibrary _isRestricted](self, "_isRestricted"))
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  -[SUScriptObject lock](self, "lock");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  musicPlayers = self->_musicPlayers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](musicPlayers, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v6)
  {
    -[SUScriptObject unlock](self, "unlock");
    goto LABEL_19;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(musicPlayers);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend(v11, "playerType"), "isEqual:", a3))
        v8 = v11;
    }
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](musicPlayers, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v7);
  -[SUScriptObject unlock](self, "unlock");
  if (!v8 || !-[SUScriptObject scriptObjectIsCheckedIn:](self, "scriptObjectIsCheckedIn:", v8))
  {
LABEL_19:
    v13 = -[SUScriptMusicPlayerController initWithPlayerType:]([SUScriptMusicPlayerController alloc], "initWithPlayerType:", a3);
    if (v13)
    {
      v8 = v13;
      -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v13);
      -[SUScriptObject lock](self, "lock");
      v14 = self->_musicPlayers;
      if (!v14)
      {
        v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        self->_musicPlayers = v14;
      }
      -[NSMutableArray addObject:](v14, "addObject:", v8);
      -[SUScriptObject unlock](self, "unlock");
      v15 = v8;
      return v8;
    }
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  }
  return v8;
}

- (id)playSongsInCollectionWithAdamID:(id)a3 firstItemID:(id)a4
{
  void **v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (!a4 || (objc_opt_respondsToSelector() & 1) != 0))
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  if (*((_BYTE *)v9 + 24))
    v5 = (void **)MEMORY[0x24BDBD270];
  else
    v5 = (void **)MEMORY[0x24BDBD268];
  v6 = *v5;
  _Block_object_dispose(&v8, 8);
  return v6;
}

void __68__SUScriptMediaLibrary_playSongsInCollectionWithAdamID_firstItemID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  int *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  int v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(MEMORY[0x24BDDC818], "albumsQuery");
  v3 = (void *)MEMORY[0x24BDDC810];
  v4 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(v2, "addFilterPredicate:", objc_msgSend(v3, "predicateWithValue:forProperty:", v4, *MEMORY[0x24BDDBCB8]));
  v5 = (void *)objc_msgSend(v2, "items");
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC7C8]), "initWithItems:", v5);
    v7 = *(void **)(a1 + 48);
    if (v7
      && (v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v7, "longLongValue")),
          v33 = 0u,
          v34 = 0u,
          v35 = 0u,
          v36 = 0u,
          (v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16)) != 0))
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      v12 = *MEMORY[0x24BDDBCB0];
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
        if ((objc_msgSend((id)objc_msgSend(v14, "valueForProperty:", v12), "isEqualToNumber:", v8) & 1) != 0)
          break;
        if (v10 == ++v13)
        {
          v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          v14 = 0;
          if (v10)
            goto LABEL_5;
          break;
        }
      }
    }
    else
    {
      v14 = 0;
    }
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v16 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v15, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v17 &= 2u;
    if (v17)
    {
      v18 = objc_opt_class();
      v19 = objc_msgSend(v5, "count");
      v38 = 138412546;
      v39 = v18;
      v40 = 2048;
      v41 = v19;
      LODWORD(v32) = 22;
      v31 = &v38;
      v20 = _os_log_send_and_compose_impl();
      if (v20)
      {
        v21 = (void *)v20;
        v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v38, v32);
        free(v21);
        v31 = (int *)v22;
        SSFileLog();
      }
    }
    v23 = (void *)objc_msgSend(MEMORY[0x24BDDCA60], "systemMusicPlayer", v31);
    objc_msgSend(v23, "setQueueWithItemCollection:", v6);
    objc_msgSend(*(id *)(a1 + 40), "_launchMusicAppAfterPlayback:firstItem:", v23, v14);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

  }
  else
  {
    v24 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v25 = objc_msgSend(v24, "shouldLog");
    if (objc_msgSend(v24, "shouldLogToDisk"))
      v26 = v25 | 2;
    else
      v26 = v25;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v24, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v26 &= 2u;
    if (v26)
    {
      v27 = objc_opt_class();
      v28 = *(_QWORD *)(a1 + 32);
      v38 = 138412546;
      v39 = v27;
      v40 = 2112;
      v41 = v28;
      LODWORD(v32) = 22;
      v29 = _os_log_send_and_compose_impl();
      if (v29)
      {
        v30 = (void *)v29;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v29, 4, &v38, v32);
        free(v30);
        SSFileLog();
      }
    }
  }
}

- (id)playSongsWithAdamIDs:(id)a3
{
  void *v4;
  void **v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(a3, "copyArrayValueWithValidator:context:", SURespondsValidator, sel_longLongValue);
    WebThreadRunOnMainThread();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  if (*((_BYTE *)v9 + 24))
    v5 = (void **)MEMORY[0x24BDBD270];
  else
    v5 = (void **)MEMORY[0x24BDBD268];
  v6 = *v5;
  _Block_object_dispose(&v8, 8);
  return v6;
}

void __45__SUScriptMediaLibrary_playSongsWithAdamIDs___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int *v29;
  uint64_t v30;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  int v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = *(id *)(a1 + 32);
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v35;
    v4 = *MEMORY[0x24BDDBCB0];
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v35 != v3)
          objc_enumerationMutation(obj);
        v6 = objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "longLongValue")), v4);
        v7 = objc_alloc(MEMORY[0x24BDDC818]);
        v8 = (void *)objc_msgSend(v7, "initWithFilterPredicates:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v6, 0));
        v9 = (void *)objc_msgSend(v8, "items");
        if (objc_msgSend(v9, "count") == 1)
          objc_msgSend(v32, "addObject:", objc_msgSend(v9, "objectAtIndex:", 0));

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v2);
  }
  if (objc_msgSend(v32, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC7C8]), "initWithItems:", v32);
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v11, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v14 = v13;
    else
      v14 = v13 & 2;
    if (v14)
    {
      v15 = objc_opt_class();
      v16 = objc_msgSend(v10, "count");
      v38 = 138412546;
      v39 = v15;
      v40 = 2048;
      v41 = v16;
      LODWORD(v30) = 22;
      v29 = &v38;
      v17 = _os_log_send_and_compose_impl();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v38, v30);
        free(v18);
        v29 = (int *)v19;
        SSFileLog();
      }
    }
    v20 = (void *)objc_msgSend(MEMORY[0x24BDDCA60], "systemMusicPlayer", v29);
    objc_msgSend(v20, "setQueueWithItemCollection:", v10);
    objc_msgSend(*(id *)(a1 + 40), "_launchMusicAppAfterPlayback:firstItem:", v20, 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

  }
  else
  {
    v21 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v22 = objc_msgSend(v21, "shouldLog");
    if (objc_msgSend(v21, "shouldLogToDisk"))
      v23 = v22 | 2;
    else
      v23 = v22;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v21, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v24 = v23;
    else
      v24 = v23 & 2;
    if (v24)
    {
      v25 = objc_opt_class();
      v26 = *(_QWORD *)(a1 + 32);
      v38 = 138412546;
      v39 = v25;
      v40 = 2112;
      v41 = v26;
      LODWORD(v30) = 22;
      v27 = _os_log_send_and_compose_impl();
      if (v27)
      {
        v28 = (void *)v27;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v27, 4, &v38, v30);
        free(v28);
        SSFileLog();
      }
    }
  }

}

- (id)playVideoWithAdamID:(id)a3
{
  void **v3;
  void *v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  if (*((_BYTE *)v7 + 24))
    v3 = (void **)MEMORY[0x24BDBD270];
  else
    v3 = (void **)MEMORY[0x24BDBD268];
  v4 = *v3;
  _Block_object_dispose(&v6, 8);
  return v4;
}

void __44__SUScriptMediaLibrary_playVideoWithAdamID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  v3 = objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", v2, *MEMORY[0x24BDDBCB0]);
  v4 = objc_alloc(MEMORY[0x24BDDC818]);
  v5 = (void *)objc_msgSend(v4, "initWithFilterPredicates:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v3, 0));
  if ((objc_msgSend(v5, "_hasItems") & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("videos://play?adam-id=%@"), v2);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v6);
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v10 &= 2u;
    if (v10)
    {
      v23 = 138412546;
      v24 = objc_opt_class();
      v25 = 2112;
      v26 = v2;
      LODWORD(v22) = 22;
      v21 = &v23;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v23, v22);
        free(v12);
        v21 = (int *)v13;
        SSFileLog();
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace", v21), "openSensitiveURL:withOptions:", v7, 0);

  }
  else
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v14, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v16 &= 2u;
    if (v16)
    {
      v17 = objc_opt_class();
      v18 = *(_QWORD *)(a1 + 32);
      v23 = 138412546;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      LODWORD(v22) = 22;
      v19 = _os_log_send_and_compose_impl();
      if (v19)
      {
        v20 = (void *)v19;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v23, v22);
        free(v20);
        SSFileLog();
      }
    }
  }

}

- (id)_className
{
  return CFSTR("iTunesMediaLibrary");
}

- (NSString)itemPropertyAlbumArtist
{
  return (NSString *)*MEMORY[0x24BDDBAE0];
}

- (NSString)itemPropertyAlbumTitle
{
  return (NSString *)*MEMORY[0x24BDDBAF8];
}

- (NSString)itemPropertyArtist
{
  return (NSString *)*MEMORY[0x24BDDBB10];
}

- (NSString)itemPropertyComposer
{
  return (NSString *)*MEMORY[0x24BDDBB38];
}

- (NSString)itemPropertyDiscCount
{
  return (NSString *)*MEMORY[0x24BDDBB48];
}

- (NSString)itemPropertyDiscNumber
{
  return (NSString *)*MEMORY[0x24BDDBB50];
}

- (NSString)itemPropertyGenre
{
  return (NSString *)*MEMORY[0x24BDDBB78];
}

- (NSString)itemPropertyIsCompilation
{
  return (NSString *)*MEMORY[0x24BDDBBB8];
}

- (NSString)itemPropertyIsHD
{
  return (NSString *)*MEMORY[0x24BDDBBD0];
}

- (NSString)itemPropertyIsRental
{
  return (NSString *)*MEMORY[0x24BDDBBF8];
}

- (NSString)itemPropertyLastPlayedDate
{
  return (NSString *)*MEMORY[0x24BDDBC18];
}

- (NSString)itemPropertyLyrics
{
  return (NSString *)*MEMORY[0x24BDDBC28];
}

- (NSString)itemPropertyMediaType
{
  return (NSString *)*MEMORY[0x24BDDBC30];
}

- (NSString)itemPropertyPersistentID
{
  return (NSString *)*MEMORY[0x24BDDBC40];
}

- (NSString)itemPropertyPlayCount
{
  return (NSString *)*MEMORY[0x24BDDBC48];
}

- (NSString)itemPropertyPlaybackDuration
{
  return (NSString *)*MEMORY[0x24BDDBC58];
}

- (NSString)itemPropertyPodcastTitle
{
  return (NSString *)*MEMORY[0x24BDDBC68];
}

- (NSString)itemPropertyRating
{
  return (NSString *)*MEMORY[0x24BDDBC78];
}

- (NSString)itemPropertySkipCount
{
  return (NSString *)*MEMORY[0x24BDDBC88];
}

- (NSString)itemPropertyStoreID
{
  return (NSString *)*MEMORY[0x24BDDBCB0];
}

- (NSString)itemPropertyTitle
{
  return (NSString *)*MEMORY[0x24BDDBCD8];
}

- (NSString)itemPropertyTrackCount
{
  return (NSString *)*MEMORY[0x24BDDBB00];
}

- (NSString)itemPropertyTrackNumber
{
  return (NSString *)*MEMORY[0x24BDDBB08];
}

- (NSString)mediaTypeAny
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:](SUScriptMediaItem, "scriptMediaTypeForNativeMediaType:", -1);
}

- (NSString)mediaTypeAnyAudio
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:](SUScriptMediaItem, "scriptMediaTypeForNativeMediaType:", 255);
}

- (NSString)mediaTypeAnyVideo
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:](SUScriptMediaItem, "scriptMediaTypeForNativeMediaType:", 65280);
}

- (NSString)mediaTypeAudiobook
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:](SUScriptMediaItem, "scriptMediaTypeForNativeMediaType:", 4);
}

- (NSString)mediaTypeMovie
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:](SUScriptMediaItem, "scriptMediaTypeForNativeMediaType:", 256);
}

- (NSString)mediaTypeMusic
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:](SUScriptMediaItem, "scriptMediaTypeForNativeMediaType:", 1);
}

- (NSString)mediaTypeMusicVideo
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:](SUScriptMediaItem, "scriptMediaTypeForNativeMediaType:", 2048);
}

- (NSString)mediaTypePodcast
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:](SUScriptMediaItem, "scriptMediaTypeForNativeMediaType:", 2);
}

- (NSString)mediaTypeTVShow
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:](SUScriptMediaItem, "scriptMediaTypeForNativeMediaType:", 512);
}

- (NSString)mediaTypeVideoPodcast
{
  return (NSString *)+[SUScriptMediaItem scriptMediaTypeForNativeMediaType:](SUScriptMediaItem, "scriptMediaTypeForNativeMediaType:", 1024);
}

- (NSString)playerTypeApplication
{
  return (NSString *)CFSTR("app");
}

- (NSString)playerTypeIPod
{
  return (NSString *)CFSTR("iPod");
}

- (NSString)queryPresetAlbums
{
  return (NSString *)CFSTR("albums");
}

- (NSString)queryPresetArtists
{
  return (NSString *)CFSTR("artists");
}

- (NSString)queryPresetAudiobooks
{
  return (NSString *)CFSTR("audiobooks");
}

- (NSString)queryPresetCompilations
{
  return (NSString *)CFSTR("compilations");
}

- (NSString)queryPresetComposers
{
  return (NSString *)CFSTR("composers");
}

- (NSString)queryPresetGenres
{
  return (NSString *)CFSTR("genres");
}

- (NSString)queryPresetMovies
{
  return (NSString *)CFSTR("movies");
}

- (NSString)queryPresetMusicVideos
{
  return (NSString *)CFSTR("musicvideos");
}

- (NSString)queryPresetPlaylists
{
  return (NSString *)CFSTR("playlists");
}

- (NSString)queryPresetPodcasts
{
  return (NSString *)CFSTR("podcasts");
}

- (NSString)queryPresetSongs
{
  return (NSString *)CFSTR("songs");
}

- (NSString)queryPresetTVShows
{
  return (NSString *)CFSTR("tvshows");
}

- (NSString)queryPresetVideoPodcasts
{
  return (NSString *)CFSTR("videopodcasts");
}

- (void)_connectNativeObject
{
  WebThreadRunOnMainThread();
}

uint64_t __44__SUScriptMediaLibrary__connectNativeObject__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptMediaLibraryNativeObject, "objectWithNativeObject:", objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary")));
}

- (BOOL)_isRestricted
{
  return !-[SUScriptObject sourceIsTrusted](self, "sourceIsTrusted");
}

- (void)_launchMusicApp
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  if ((objc_msgSend(v2, "openSensitiveURL:withOptions:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("music://show-now-playing")), 0) & 1) == 0)SBSLaunchApplicationWithIdentifier();
}

- (void)_launchMusicAppAfterPlayback:(id)a3 firstItem:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  dispatch_time_t v13;
  _QWORD v14[8];
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;

  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__20;
  v20 = __Block_byref_object_dispose__20;
  v21 = 0;
  v8 = objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v9 = *MEMORY[0x24BDDC430];
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__SUScriptMediaLibrary__launchMusicAppAfterPlayback_firstItem___block_invoke;
  v15[3] = &unk_24DE7CAA8;
  v15[4] = a3;
  v15[5] = self;
  v15[6] = v7;
  v15[7] = &v16;
  v11 = (void *)objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v9, a3, v8, v15);
  v17[5] = (uint64_t)v11;
  v12 = v11;
  v13 = dispatch_time(0, 5000000000);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __63__SUScriptMediaLibrary__launchMusicAppAfterPlayback_firstItem___block_invoke_73;
  v14[3] = &unk_24DE7CAD0;
  v14[4] = self;
  v14[5] = v7;
  v14[6] = a3;
  v14[7] = &v16;
  dispatch_after(v13, MEMORY[0x24BDAC9B8], v14);
  objc_msgSend(a3, "beginGeneratingPlaybackNotifications");
  if (a4)
    objc_msgSend(a3, "setNowPlayingItem:", a4);
  objc_msgSend(a3, "play");
  _Block_object_dispose(&v16, 8);
}

uint64_t __63__SUScriptMediaLibrary__launchMusicAppAfterPlayback_firstItem___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "playbackState");
  if (result == 1)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v5 &= 2u;
    if (v5)
    {
      v11 = 138412290;
      v12 = objc_opt_class();
      LODWORD(v10) = 12;
      v9 = &v11;
      v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v6, 4, &v11, v10);
        free(v7);
        v9 = (int *)v8;
        SSFileLog();
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_launchMusicApp", v9);
    objc_msgSend(*(id *)(a1 + 48), "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = 0;
    return objc_msgSend(*(id *)(a1 + 32), "endGeneratingPlaybackNotifications");
  }
  return result;
}

uint64_t __63__SUScriptMediaLibrary__launchMusicAppAfterPlayback_firstItem___block_invoke_73(uint64_t result)
{
  uint64_t v1;
  void *v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40))
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v4 &= 2u;
    if (v4)
    {
      v10 = 138412290;
      v11 = objc_opt_class();
      LODWORD(v9) = 12;
      v8 = &v10;
      v5 = _os_log_send_and_compose_impl();
      if (v5)
      {
        v6 = (void *)v5;
        v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 4, &v10, v9);
        free(v6);
        v8 = (int *)v7;
        SSFileLog();
      }
    }
    objc_msgSend(*(id *)(v1 + 32), "_launchMusicApp", v8);
    objc_msgSend(*(id *)(v1 + 40), "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40) = 0;
    return objc_msgSend(*(id *)(v1 + 48), "endGeneratingPlaybackNotifications");
  }
  return result;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_34, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaLibrary;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_28, 10);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaLibrary;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaLibrary;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_34, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_28 = (uint64_t)sel_containsAdamID_;
    unk_2551867B0 = CFSTR("containsAdamID");
    qword_2551867B8 = (uint64_t)sel_containsAdamIDs_;
    unk_2551867C0 = CFSTR("containsAdamIDs");
    qword_2551867C8 = (uint64_t)sel_getProperties_ofAdamIDs_withCompletionFunction_;
    unk_2551867D0 = CFSTR("getItemProperties");
    qword_2551867D8 = (uint64_t)sel_makeCollectionWithItems_;
    unk_2551867E0 = CFSTR("createCollection");
    qword_2551867E8 = (uint64_t)sel_makePickerWithMediaTypes_;
    unk_2551867F0 = CFSTR("createPicker");
    qword_2551867F8 = (uint64_t)sel_makeQueryWithPreset_;
    unk_255186800 = CFSTR("createQuery");
    qword_255186808 = (uint64_t)sel_musicPlayerForType_;
    unk_255186810 = CFSTR("getMusicPlayer");
    qword_255186818 = (uint64_t)sel_playSongsInCollectionWithAdamID_firstItemID_;
    unk_255186820 = CFSTR("playCollection");
    qword_255186828 = (uint64_t)sel_playSongsWithAdamIDs_;
    unk_255186830 = CFSTR("playMusic");
    qword_255186838 = (uint64_t)sel_playVideoWithAdamID_;
    unk_255186840 = CFSTR("playVideo");
    __KeyMapping_34 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("ITEM_ALBUM_ARTIST"), CFSTR("itemPropertyAlbumArtist"), CFSTR("ITEM_ALBUM_TITLE"), CFSTR("itemPropertyAlbumTitle"), CFSTR("ITEM_ARTIST"), CFSTR("itemPropertyArtist"), CFSTR("ITEM_COMPOSER"), CFSTR("itemPropertyComposer"), CFSTR("ITEM_DISC_COUNT"), CFSTR("itemPropertyDiscCount"), CFSTR("ITEM_DISC_NUMBER"), CFSTR("itemPropertyDiscNumber"), CFSTR("ITEM_GENRE"), CFSTR("itemPropertyGenre"), CFSTR("ITEM_IS_COMPILATION"), CFSTR("itemPropertyIsCompilation"), CFSTR("ITEM_IS_HD"),
                        CFSTR("itemPropertyIsHD"),
                        CFSTR("ITEM_IS_RENTAL"),
                        CFSTR("itemPropertyIsRental"),
                        CFSTR("ITEM_LAST_PLAYED_DATE"),
                        CFSTR("itemPropertyLastPlayedDate"),
                        CFSTR("ITEM_LYRICS"),
                        CFSTR("itemPropertyLyrics"),
                        CFSTR("ITEM_MEDIA_TYPE"),
                        CFSTR("itemPropertyMediaType"),
                        CFSTR("ITEM_PERSISTENT_ID"),
                        CFSTR("itemPropertyPersistentID"),
                        CFSTR("ITEM_PLAY_COUNT"),
                        CFSTR("itemPropertyPlayCount"),
                        CFSTR("ITEM_PLAYBACK_DURATION"),
                        CFSTR("itemPropertyPlaybackDuration"),
                        CFSTR("ITEM_PODCAST_TITLE"),
                        CFSTR("itemPropertyPodcastTitle"),
                        CFSTR("ITEM_RATING"),
                        CFSTR("itemPropertyRating"),
                        CFSTR("ITEM_SKIP_COUNT"),
                        CFSTR("itemPropertySkipCount"),
                        CFSTR("ITEM_STORE_ID"),
                        CFSTR("itemPropertyStoreID"),
                        CFSTR("ITEM_TITLE"),
                        CFSTR("itemPropertyTitle"),
                        CFSTR("ITEM_TRACK_COUNT"),
                        CFSTR("itemPropertyTrackCount"),
                        CFSTR("ITEM_TRACK_NUMBER"),
                        CFSTR("itemPropertyTrackNumber"),
                        CFSTR("MEDIA_TYPE_ANY"),
                        CFSTR("mediaTypeAny"),
                        CFSTR("MEDIA_TYPE_ANY_AUDIO"),
                        CFSTR("mediaTypeAnyAudio"),
                        CFSTR("MEDIA_TYPE_ANY_VIDEO"),
                        CFSTR("mediaTypeAnyVideo"),
                        CFSTR("MEDIA_TYPE_AUDIOBOOK"),
                        CFSTR("mediaTypeAudiobook"),
                        CFSTR("MEDIA_TYPE_MOVIE"),
                        CFSTR("mediaTypeMovie"),
                        CFSTR("MEDIA_TYPE_MUSIC"),
                        CFSTR("mediaTypeMusic"),
                        CFSTR("MEDIA_TYPE_MUSIC_VIDEO"),
                        CFSTR("mediaTypeMusicVideo"),
                        CFSTR("MEDIA_TYPE_PODCAST"));
  }
}

@end
