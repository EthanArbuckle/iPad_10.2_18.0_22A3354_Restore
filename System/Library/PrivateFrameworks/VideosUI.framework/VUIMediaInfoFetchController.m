@implementation VUIMediaInfoFetchController

- (NSArray)mediaInfos
{
  return self->_mediaInfos;
}

- (void)_populateQueueWithMediaInfos:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  VUIMediaInfoImageFetchOperation *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = -[VUIMediaInfoImageFetchOperation initWithMediaInfo:]([VUIMediaInfoImageFetchOperation alloc], "initWithMediaInfo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        -[VUIMediaInfoFetchController imageQueue](self, "imageQueue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addOperation:", v9);

        -[VUIMediaInfoFetchController imageOperations](self, "imageOperations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  -[VUIMediaInfoFetchController _updateImageOperationPriorities](self, "_updateImageOperationPriorities");

}

- (NSOperationQueue)imageQueue
{
  return self->_imageQueue;
}

- (void)_updateImageOperationPriorities
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;

  -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = -[VUIMediaInfoFetchController index](self, "index");
  if (v4 >= 1)
  {
    v6 = v5;
    for (i = 0; i != v4; ++i)
    {
      -[VUIMediaInfoFetchController imageOperations](self, "imageOperations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setQueuePriority:", -[VUIMediaInfoFetchController queuePriorityForIndex:itemCount:selectedIndex:](self, "queuePriorityForIndex:itemCount:selectedIndex:", i, v4, v6));
    }
  }
}

- (NSMutableArray)imageOperations
{
  return self->_imageOperations;
}

- (int64_t)queuePriorityForIndex:(int64_t)a3 itemCount:(int64_t)a4 selectedIndex:(int64_t)a5
{
  unint64_t v5;
  int64_t v6;
  int64_t v7;

  v5 = a3 - a5;
  if (a3 - a5 < 0)
    v5 = a5 - a3;
  v6 = a4 + a3 - a5;
  if (v6 < 0)
    v6 = a5 - (a4 + a3);
  v7 = a3 - (a4 + a5);
  if (v7 < 0)
    v7 = a4 + a5 - a3;
  if (v6 >= (unint64_t)v7)
    v6 = v7;
  if (v5 >= v6)
    v5 = v6;
  if (v5)
    return 4 * (v5 == 1);
  else
    return 8;
}

uint64_t __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "image");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id WeakRetained;
  char v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  char v16;

  v7 = a2;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10 = objc_msgSend(MEMORY[0x1E0DC69B0], "canHandleDecodingOnRenderThread");
    if (!v7 || (v10 & 1) != 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend(WeakRetained, "imageDecodingQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_4;
      v12[3] = &unk_1E9F9E8F0;
      v13 = v7;
      v15 = *(id *)(a1 + 32);
      v14 = v8;
      v16 = a4;
      dispatch_async(v11, v12);

    }
  }

}

uint64_t __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  return result;
}

void __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  char v16;

  v7 = a2;
  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_2;
  v12[3] = &unk_1E9F9E8A0;
  v9 = *(id *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v13 = v7;
  v16 = a4;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __41__VUIMediaInfoFetchController_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIMediaInfoFetchController");
  v1 = (void *)sLogObject_10;
  sLogObject_10 = (uint64_t)v0;

}

- (void)setPreloadPlaybackEnabled:(BOOL)a3
{
  self->_preloadPlaybackEnabled = a3;
}

- (void)setMediaInfos:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *mediaInfos;
  NSArray *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "setMediaInfos: called with %@", buf, 0xCu);
  }
  -[VUIMediaInfoFetchController imageQueue](self, "imageQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelAllOperations");

  -[VUIMediaInfoFetchController imageOperations](self, "imageOperations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  if (v4)
  {
    v8 = (NSArray *)objc_msgSend(v4, "copy");
    mediaInfos = self->_mediaInfos;
    self->_mediaInfos = v8;

    -[VUIMediaInfoFetchController _populateQueueWithMediaInfos:](self, "_populateQueueWithMediaInfos:", v4);
  }
  else
  {
    v10 = self->_mediaInfos;
    self->_mediaInfos = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = -[VUIMediaInfoFetchController index](self, "index");
    -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v13 >= v15)
    {
      -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaInfoFetchController setIndex:](self, "setIndex:", objc_msgSend(v25, "count") - 1);

    }
    else
    {
      -[VUIMediaInfoFetchController _updatePrewarmedPlayers](self, "_updatePrewarmedPlayers");
    }
  }
  else
  {
    v16 = sLogObject_10;
    if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "setMediaInfos: called with empty mediaInfos array.  Invalidating all prewarm players", buf, 2u);
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[VUIMediaInfoFetchController prewarmedPlayers](self, "prewarmedPlayers", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v23, "stop");
          objc_msgSend(v23, "invalidate");
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v20);
    }

    -[VUIMediaInfoFetchController prewarmedPlayers](self, "prewarmedPlayers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeAllObjects");

  }
}

- (void)setIndex:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "setIndex: called with %lu", (uint8_t *)&v6, 0xCu);
  }
  self->_index = a3;
  -[VUIMediaInfoFetchController _updateImageOperationPriorities](self, "_updateImageOperationPriorities");
  -[VUIMediaInfoFetchController _updatePrewarmedPlayers](self, "_updatePrewarmedPlayers");
}

- (NSMutableDictionary)prewarmedPlayers
{
  return self->_prewarmedPlayers;
}

- (unint64_t)playerPreloadOffset
{
  return self->_playerPreloadOffset;
}

- (BOOL)mediaInfoContainsPlayerAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return 0;
  -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "tvpPlaylist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  return v10;
}

- (BOOL)mediaInfoContainsImageAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return 0;
  -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "imageProxies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") != 0;

  return v10;
}

- (id)loadPlayerAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return 0;
  -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "tvpPlaylist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaInfoFetchController _identifierForPlaylist:isForPrewarming:](self, "_identifierForPlaylist:isForPrewarming:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaInfoFetchController _identifierForPlaylist:isForPrewarming:](self, "_identifierForPlaylist:isForPrewarming:", v9, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaInfoFetchController prewarmedPlayers](self, "prewarmedPlayers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v13, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412546;
    v23 = v10;
    v24 = 2112;
    v25 = v16;
    _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Creating playback player for identifier [%@].  Prewarm player for this identifier is [%@]", (uint8_t *)&v22, 0x16u);

  }
  v17 = v9;
  v18 = v17;
  if (v13)
  {
    v19 = sLogObject_10;
    if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "Setting playlist from prewarm player on playback player", (uint8_t *)&v22, 2u);
    }
    objc_msgSend(v13, "playlist");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[VUIMediaInfoFetchController _createPlayerWithPlaylist:isForPrewarming:](self, "_createPlayerWithPlaylist:isForPrewarming:", v18, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)loadImageAtIndex:(unint64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;
  _QWORD aBlock[4];
  id v25;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke;
  aBlock[3] = &unk_1E9F9E8C8;
  v8 = v6;
  v25 = v8;
  v9 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_3;
  v20[3] = &unk_1E9F9E918;
  objc_copyWeak(&v22, &location);
  v10 = v9;
  v21 = v10;
  v11 = _Block_copy(v20);
  -[VUIMediaInfoFetchController imageOperations](self, "imageOperations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VUIMediaInfoFetchControllerErrorDomain"), 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *, _QWORD))v11 + 2))(v11, 0, v15, 0);
  }
  else
  {
    -[VUIMediaInfoFetchController imageOperations](self, "imageOperations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "isFinished"))
    {
      objc_msgSend(v15, "image");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *, void *, uint64_t))v11 + 2))(v11, v16, v17, objc_msgSend(v15, "imageLoadFinished"));

    }
    else
    {
      v18[0] = v7;
      v18[1] = 3221225472;
      v18[2] = __59__VUIMediaInfoFetchController_loadImageAtIndex_completion___block_invoke_5;
      v18[3] = &unk_1E9F9E8C8;
      v19 = v11;
      objc_msgSend(v15, "addCompletion:", v18);
      v16 = v19;
    }

  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (BOOL)isPreloadPlaybackEnabled
{
  return self->_preloadPlaybackEnabled;
}

- (VUIMediaInfoFetchController)init
{
  return -[VUIMediaInfoFetchController initWithMediaInfos:](self, "initWithMediaInfos:", MEMORY[0x1E0C9AA60]);
}

- (VUIMediaInfoFetchController)initWithMediaInfos:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VUIMediaInfoFetchController;
  v5 = -[VUIMediaInfoFetchController init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v6;

    v8 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v9 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v12;

    *(_OWORD *)(v5 + 24) = xmmword_1DA1C2070;
    v5[8] = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("VUIMediaInfoImageDecodingQueue", v14);
    v16 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v15;

    objc_msgSend(v5, "imageQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMaxConcurrentOperationCount:", 1);

    objc_msgSend(v5, "_populateQueueWithMediaInfos:", v4);
  }

  return (VUIMediaInfoFetchController *)v5;
}

- (unint64_t)index
{
  return self->_index;
}

- (OS_dispatch_queue)imageDecodingQueue
{
  return self->_imageDecodingQueue;
}

- (void)_updatePrewarmedPlayers
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  BOOL v46;
  void *v47;
  void *v48;
  int v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  VUIMediaInfoFetchController *v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = -[VUIMediaInfoFetchController isPreloadPlaybackEnabled](self, "isPreloadPlaybackEnabled");
  v4 = sLogObject_10;
  v5 = os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = v4;
      -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v75 = self;
      v76 = 2048;
      v77 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "MediaInfoFetch::(%p) updatePrewarm Updating prewarmed players for %lu media info(s)", buf, 0x16u);

    }
    -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      -[VUIMediaInfoFetchController _prewarmIndices](self, "_prewarmIndices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)sLogObject_10;
      if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 134218240;
        v75 = self;
        v76 = 2048;
        v77 = v13;
        _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "MediaInfoFetch::(%p) updatePrewarm prewarm %lu players", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v15 = v10;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v67 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
            -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v20, "unsignedIntegerValue"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "addObject:", v22);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
        }
        while (v17);
      }

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v24 = v14;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v63;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v63 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "tvpPlaylist");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIMediaInfoFetchController _identifierForPlaylist:isForPrewarming:](self, "_identifierForPlaylist:isForPrewarming:", v29, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
              objc_msgSend(v23, "addObject:", v30);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
        }
        while (v26);
      }

      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      -[VUIMediaInfoFetchController prewarmedPlayers](self, "prewarmedPlayers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "allKeys");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v59;
        do
        {
          for (k = 0; k != v34; ++k)
          {
            if (*(_QWORD *)v59 != v35)
              objc_enumerationMutation(v32);
            v37 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * k);
            if ((objc_msgSend(v23, "containsObject:", v37) & 1) == 0)
              -[VUIMediaInfoFetchController _removePrewarmedPlayerForIdentifier:](self, "_removePrewarmedPlayerForIdentifier:", v37);
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
        }
        while (v34);
      }
      v51 = v15;

      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      obj = v24;
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v55;
        v52 = *MEMORY[0x1E0DB1D48];
        do
        {
          for (m = 0; m != v39; ++m)
          {
            if (*(_QWORD *)v55 != v40)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * m), "tvpPlaylist");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIMediaInfoFetchController _identifierForPlaylist:isForPrewarming:](self, "_identifierForPlaylist:isForPrewarming:", v42, 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
            {
              -[VUIMediaInfoFetchController prewarmedPlayers](self, "prewarmedPlayers");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "objectForKey:", v43);
              v45 = objc_claimAutoreleasedReturnValue();
              if (v42)
                v46 = v45 == 0;
              else
                v46 = 0;
              if (v46)
              {
                objc_msgSend(v42, "currentMediaItem");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = objc_msgSend(v48, "hasTrait:", v52);

                if (!v49)
                  goto LABEL_48;
                v50 = sLogObject_10;
                if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218242;
                  v75 = self;
                  v76 = 2112;
                  v77 = (uint64_t)v43;
                  _os_log_impl(&dword_1D96EE000, v50, OS_LOG_TYPE_DEFAULT, "MediaInfoFetch::(%p) updatePrewarm Creating and starting prewarm player with identifier [%@]", buf, 0x16u);
                }
                -[VUIMediaInfoFetchController _createPlayerWithPlaylist:isForPrewarming:](self, "_createPlayerWithPlaylist:isForPrewarming:", v42, 1);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "pause");
                -[VUIMediaInfoFetchController prewarmedPlayers](self, "prewarmedPlayers");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "setObject:forKey:", v44, v43);
              }
              else
              {
                v47 = (void *)v45;
              }

            }
LABEL_48:

          }
          v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
        }
        while (v39);
      }

    }
  }
  else if (v5)
  {
    *(_DWORD *)buf = 134217984;
    v75 = self;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "MediaInfoFetch::(%p) updatePrewarm is skipped because isPreloadPlaybackEnabled is disabled", buf, 0xCu);
  }
}

- (id)_prewarmIndices
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t j;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VUIMediaInfoFetchController playerPreloadOffset](self, "playerPreloadOffset");
  -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = v6 - 1;
  if (-[VUIMediaInfoFetchController index](self, "index") < v6 - 1)
    v7 = -[VUIMediaInfoFetchController index](self, "index");
  if (v6)
  {
    if (v6 == 1)
    {
      v8 = &unk_1EA0BB8E0;
    }
    else
    {
      if (v4)
      {
        v9 = v7 - 1;
        for (i = 1; i <= v4; ++i)
        {
          if (i <= v7)
            v11 = v9;
          else
            v11 = v6 - v4 + i - 1;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

          --v9;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

        for (j = 1; j <= v4; ++j)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (v7 + j) % v6);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v15);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v16);

      }
      objc_msgSend(v3, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)_identifierForPlaylist:(id)a3 isForPrewarming:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v4 = a4;
  objc_msgSend(a3, "currentMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "mediaItemURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = &stru_1E9FF3598;
  if (v4)
    v10 = CFSTR("Prewarm ");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_createPlayerWithPlaylist:(id)a3 isForPrewarming:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  VUIPlayer *v8;
  VUIPlayer *v9;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    -[VUIMediaInfoFetchController _identifierForPlaylist:isForPrewarming:](self, "_identifierForPlaylist:isForPrewarming:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[VUIPlayer initWithName:]([VUIPlayer alloc], "initWithName:", v7);
    v9 = v8;
    if (v4)
    {
      -[TVPPlayer setWaitsAfterPreparingMediaItems:](v8, "setWaitsAfterPreparingMediaItems:", 1);
      -[TVPPlayer setSendsPlayerReports:](v9, "setSendsPlayerReports:", 0);
    }
    -[TVPPlayer setPlaylist:](v9, "setPlaylist:", v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)initialize
{
  if (initialize_onceToken_3 != -1)
    dispatch_once(&initialize_onceToken_3, &__block_literal_global_76);
}

- (void)clearPreloadedPlayback
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[VUIMediaInfoFetchController prewarmedPlayers](self, "prewarmedPlayers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "stop");
        objc_msgSend(v9, "invalidate");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[VUIMediaInfoFetchController prewarmedPlayers](self, "prewarmedPlayers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "dealloc cleaning", buf, 2u);
  }
  -[VUIMediaInfoFetchController setMediaInfos:](self, "setMediaInfos:", MEMORY[0x1E0C9AA60]);
  v4.receiver = self;
  v4.super_class = (Class)VUIMediaInfoFetchController;
  -[VUIMediaInfoFetchController dealloc](&v4, sel_dealloc);
}

- (void)_removePrewarmedPlayerForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  VUIMediaInfoFetchController *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "MediaInfoFetch::(%p) Invalidating prewarm player with identifier [%@]", (uint8_t *)&v9, 0x16u);
  }
  -[VUIMediaInfoFetchController prewarmedPlayers](self, "prewarmedPlayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stop");
  objc_msgSend(v7, "invalidate");
  -[VUIMediaInfoFetchController prewarmedPlayers](self, "prewarmedPlayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v4);

}

- (void)setMediaInfo:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *mediaInfos;
  VUIMediaInfoImageFetchOperation *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412546;
    v21 = v6;
    v22 = 2048;
    v23 = a4;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "setMediaInfo:atIndex: called with %@ at index %lu", (uint8_t *)&v20, 0x16u);
  }
  -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 > a4)
  {
    -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    -[VUIMediaInfoFetchController imageOperations](self, "imageOperations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "cancel");
    -[VUIMediaInfoFetchController imageOperations](self, "imageOperations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectAtIndex:", a4);

    objc_msgSend(v11, "setObject:atIndexedSubscript:", v6, a4);
    v15 = (NSArray *)objc_msgSend(v11, "copy");
    mediaInfos = self->_mediaInfos;
    self->_mediaInfos = v15;

    v17 = -[VUIMediaInfoImageFetchOperation initWithMediaInfo:]([VUIMediaInfoImageFetchOperation alloc], "initWithMediaInfo:", v6);
    -[VUIMediaInfoFetchController imageQueue](self, "imageQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addOperation:", v17);

    -[VUIMediaInfoFetchController imageOperations](self, "imageOperations");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "insertObject:atIndex:", v17, a4);

    -[VUIMediaInfoFetchController _updatePrewarmedPlayers](self, "_updatePrewarmedPlayers");
  }

}

- (void)appendMediaInfos:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *mediaInfos;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "appendMediaInfos: called with mediaInfos %@", (uint8_t *)&v10, 0xCu);
  }
  if (v4)
  {
    -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "addObjectsFromArray:", v4);
    v8 = (NSArray *)objc_msgSend(v7, "copy");
    mediaInfos = self->_mediaInfos;
    self->_mediaInfos = v8;

    -[VUIMediaInfoFetchController _populateQueueWithMediaInfos:](self, "_populateQueueWithMediaInfos:", v4);
    -[VUIMediaInfoFetchController _updatePrewarmedPlayers](self, "_updatePrewarmedPlayers");

  }
}

- (void)removeMediaInfoAtIndex:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *mediaInfos;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = sLogObject_10;
  if (os_log_type_enabled((os_log_t)sLogObject_10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16 = a3;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "removeMediaInfoAtIndex: called with index %lu", (uint8_t *)&v15, 0xCu);
  }
  -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > a3)
  {
    -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "removeObjectAtIndex:", a3);
    v10 = (NSArray *)objc_msgSend(v9, "copy");
    mediaInfos = self->_mediaInfos;
    self->_mediaInfos = v10;

    -[VUIMediaInfoFetchController imageOperations](self, "imageOperations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "cancel");
    -[VUIMediaInfoFetchController imageOperations](self, "imageOperations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectAtIndex:", a3);

    -[VUIMediaInfoFetchController _updatePrewarmedPlayers](self, "_updatePrewarmedPlayers");
  }
}

- (void)populatePlaylistWithMediaItems:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    do
    {
      if (a4 != v9)
      {
        -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "tvpPlaylist");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "currentMediaItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v11, "tvpPlaylist");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "currentMediaItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);

        }
      }
      ++v9;
      -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    while (v9 < v17);
  }
  v18 = (void *)MEMORY[0x1E0CB3788];
  -[VUIMediaInfoFetchController mediaInfos](self, "mediaInfos");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "indexSetWithIndexesInRange:", 0, objc_msgSend(v19, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "removeIndex:", a4);
  objc_msgSend(v21, "insertItems:atIndexes:", v6, v20);

}

- (void)removePopulatedMediaItems:(id)a3 atIndex:(unint64_t)a4
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "trackList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 2)
  {
    v7 = (void *)MEMORY[0x1E0CB3788];
    objc_msgSend(v10, "trackList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "removeIndex:", a4);
    objc_msgSend(v10, "removeItemsAtIndexes:", v9);

  }
}

- (void)setPlayerPreloadOffset:(unint64_t)a3
{
  self->_playerPreloadOffset = a3;
}

- (void)setImageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_imageQueue, a3);
}

- (void)setImageOperations:(id)a3
{
  objc_storeStrong((id *)&self->_imageOperations, a3);
}

- (void)setPrewarmedPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmedPlayers, a3);
}

- (void)setImageDecodingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_imageDecodingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDecodingQueue, 0);
  objc_storeStrong((id *)&self->_prewarmedPlayers, 0);
  objc_storeStrong((id *)&self->_imageOperations, 0);
  objc_storeStrong((id *)&self->_imageQueue, 0);
  objc_storeStrong((id *)&self->_mediaInfos, 0);
}

@end
