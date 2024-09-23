@implementation ISWrappedAVPlayer

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  id v6;
  NSObject *avPlayerQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  avPlayerQueue = self->_avPlayerQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__ISWrappedAVPlayer_registerChangeObserver_context___block_invoke;
  v9[3] = &unk_1E9453EF8;
  objc_copyWeak(v11, &location);
  v10 = v6;
  v11[1] = a4;
  v8 = v6;
  dispatch_async(avPlayerQueue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  id v6;
  NSObject *avPlayerQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  avPlayerQueue = self->_avPlayerQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__ISWrappedAVPlayer_unregisterChangeObserver_context___block_invoke;
  v9[3] = &unk_1E9453EF8;
  objc_copyWeak(v11, &location);
  v10 = v6;
  v11[1] = a4;
  v8 = v6;
  dispatch_async(avPlayerQueue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)_avPlayerQueue_registerChangeObserver:(id)a3 context:(void *)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISWrappedAVPlayer;
  -[ISObservable registerChangeObserver:context:](&v4, sel_registerChangeObserver_context_, a3, a4);
}

- (void)_avPlayerQueue_unregisterChangeObserver:(id)a3 context:(void *)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISWrappedAVPlayer;
  -[ISObservable unregisterChangeObserver:context:](&v4, sel_unregisterChangeObserver_context_, a3, a4);
}

- (void)_performPlayerTransaction:(id)a3
{
  id v4;
  NSObject *avPlayerQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  avPlayerQueue = self->_avPlayerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ISWrappedAVPlayer__performPlayerTransaction___block_invoke;
  block[3] = &unk_1E9453F20;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(avPlayerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_performIvarRead:(id)a3
{
  id v4;
  BOOL v5;
  dispatch_block_t block;

  v4 = a3;
  block = v4;
  if (self->_ivarQueue && (v5 = -[ISWrappedAVPlayer _isOnIvarQueue](self, "_isOnIvarQueue"), v4 = block, !v5))
    dispatch_sync((dispatch_queue_t)self->_ivarQueue, block);
  else
    (*((void (**)(id))v4 + 2))(v4);

}

- (void)_performIvarWrite:(id)a3
{
  NSObject *ivarQueue;

  ivarQueue = self->_ivarQueue;
  if (ivarQueue)
    dispatch_barrier_sync(ivarQueue, a3);
  else
    (*((void (**)(id))a3 + 2))(a3);
}

- (BOOL)_isOnIvarQueue
{
  return dispatch_get_specific((const void *)QueueIdentifierContext_3825) == self->_ivarQueueIdentifier;
}

- (id)_initWithAVPlayer:(id)a3
{
  id v5;
  char *v6;
  id v7;
  _OWORD *v8;
  __int128 v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  dispatch_queue_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id from;
  id location;
  _QWORD block[4];
  id v35;
  objc_super v36;

  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ISWrappedAVPlayer;
  v6 = -[ISObservable init](&v36, sel_init);
  v7 = v6;
  if (v6)
  {
    v6[233] = 1;
    v8 = (_OWORD *)MEMORY[0x1E0CA2E40];
    *(_OWORD *)(v6 + 216) = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    v9 = v8[1];
    *(_OWORD *)(v6 + 184) = *v8;
    *(_OWORD *)(v6 + 200) = v9;
    v6[234] = objc_msgSend(v5, "preventsDisplaySleepDuringVideoPlayback");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    do
      v11 = __ldaxr((unsigned int *)&_initWithAVPlayer__ivarQueueCounter);
    while (__stlxr(v11 + 1, (unsigned int *)&_initWithAVPlayer__ivarQueueCounter));
    *((_QWORD *)v7 + 42) = objc_msgSend(v10, "numberWithInt:");
    v12 = MEMORY[0x1E0C80D38];
    objc_storeStrong((id *)v7 + 13, MEMORY[0x1E0C80D38]);
    v13 = dispatch_queue_create("com.apple.photosplayer.avplayerwrapper.ivars", MEMORY[0x1E0C80D50]);
    v14 = (void *)*((_QWORD *)v7 + 12);
    *((_QWORD *)v7 + 12) = v13;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v7 + 12), (const void *)QueueIdentifierContext_3825, *((void **)v7 + 42), 0);
    objc_msgSend(v5, "currentItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      ISGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location) = 0;
        _os_log_error_impl(&dword_1D2DCA000, v16, OS_LOG_TYPE_ERROR, "-[ISWrappedAVPlayer _initWithAVPlayer:] expected existing player to not have currentItem set", (uint8_t *)&location, 2u);
      }

    }
    objc_storeStrong((id *)v7 + 14, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*((id *)v7 + 14), "actualDispatchQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)*((_QWORD *)v7 + 11);
      *((_QWORD *)v7 + 11) = v17;
    }
    else
    {
      v18 = (void *)*((_QWORD *)v7 + 11);
      *((_QWORD *)v7 + 11) = v12;
    }

    v19 = *((_QWORD *)v7 + 11);
    v20 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__ISWrappedAVPlayer__initWithAVPlayer___block_invoke;
    block[3] = &unk_1E9453F48;
    v21 = v7;
    v35 = v21;
    dispatch_async(v19, block);
    objc_initWeak(&location, v21);
    objc_initWeak(&from, *((id *)v7 + 11));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0C8AC48];
    v29[0] = v20;
    v29[1] = 3221225472;
    v29[2] = __39__ISWrappedAVPlayer__initWithAVPlayer___block_invoke_2;
    v29[3] = &unk_1E9453F98;
    objc_copyWeak(&v30, &from);
    objc_copyWeak(&v31, &location);
    objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", v23, 0, 0, v29);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v21[16];
    v21[16] = v24;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v21[41];
    v21[41] = v26;

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  return v7;
}

- (ISWrappedAVPlayer)init
{
  ISAVPlayer *v3;
  ISAVPlayer *v4;
  ISWrappedAVPlayer *v5;

  if (init_onceToken != -1)
    dispatch_once(&init_onceToken, &__block_literal_global_3821);
  v3 = [ISAVPlayer alloc];
  v4 = -[ISAVPlayer initWithDispatchQueue:](v3, "initWithDispatchQueue:", init_avpq);
  v5 = -[ISWrappedAVPlayer _initWithAVPlayer:](self, "_initWithAVPlayer:", v4);

  return v5;
}

- (id)_playerQueue_avPlayer
{
  return self->_playerQueue_avPlayer;
}

- (void)dealloc
{
  NSMutableDictionary *observersByID;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[5];

  observersByID = self->_observersByID;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__ISWrappedAVPlayer_dealloc__block_invoke;
  v9[3] = &unk_1E9454000;
  v9[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](observersByID, "enumerateKeysAndObjectsUsingBlock:", v9);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self->_playerQueue_playerItemDidPlayToEndObserver);

  +[ISKVOProxyManager sharedManager](ISKVOProxyManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeProxyWithIdentifier:", self->_playerQueue_playerKVOIdentifier);

  +[ISKVOProxyManager sharedManager](ISKVOProxyManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeProxyWithIdentifier:", self->_playerQueue_playerItemKVOIdentifier);

  +[ISDeferredDealloc sharedInstance](ISDeferredDealloc, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_performDeferredDealloc:", self->_playerQueue_avPlayer);

  v8.receiver = self;
  v8.super_class = (Class)ISWrappedAVPlayer;
  -[ISWrappedAVPlayer dealloc](&v8, sel_dealloc);
}

- (void)attachToPlayerLayerIfNeeded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__ISWrappedAVPlayer_attachToPlayerLayerIfNeeded___block_invoke;
  v6[3] = &unk_1E9454028;
  v7 = v4;
  v5 = v4;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v6);

}

- (void)setItemForwardEndPlaybackTime:(id *)a3
{
  _QWORD v3[4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__ISWrappedAVPlayer_setItemForwardEndPlaybackTime___block_invoke;
  v3[3] = &__block_descriptor_56_e27_v16__0__ISWrappedAVPlayer_8l;
  v4 = *a3;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v3);
}

- (void)setItemBlendsVideoFrames:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__ISWrappedAVPlayer_setItemBlendsVideoFrames___block_invoke;
  v3[3] = &__block_descriptor_33_e27_v16__0__ISWrappedAVPlayer_8l;
  v4 = a3;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v3);
}

- (id)_nextObserverUID
{
  uint64_t v2;

  do
    v2 = __ldaxr((unsigned int *)&s_uniqueObserverID);
  while (__stlxr(v2 + 1, (unsigned int *)&s_uniqueObserverID));
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("avPlayerWrapperObserverID-%d"), v2);
}

- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21;

  v8 = a4;
  v9 = a5;
  -[ISWrappedAVPlayer _nextObserverUID](self, "_nextObserverUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__ISWrappedAVPlayer_addPeriodicTimeObserverForInterval_queue_usingBlock___block_invoke;
  v17[3] = &unk_1E94540B8;
  v21 = *a3;
  v18 = v8;
  v20 = v9;
  v11 = v10;
  v19 = v11;
  v12 = v9;
  v13 = v8;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v17);
  v14 = v19;
  v15 = v11;

  return v15;
}

- (id)addBoundaryTimeObserverForTimes:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ISWrappedAVPlayer _nextObserverUID](self, "_nextObserverUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__ISWrappedAVPlayer_addBoundaryTimeObserverForTimes_queue_usingBlock___block_invoke;
  v19[3] = &unk_1E94540E0;
  v20 = v8;
  v21 = v9;
  v23 = v10;
  v12 = v11;
  v22 = v12;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v19);
  v16 = v22;
  v17 = v12;

  return v17;
}

- (void)removeTimeObserver:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  ISWrappedAVPlayer *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__ISWrappedAVPlayer_removeTimeObserver___block_invoke;
    v6[3] = &unk_1E9454158;
    v7 = v4;
    v8 = self;
    -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v6);

  }
}

- (void)_playerQueue_startObservingPlayerItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  OS_dispatch_queue *avPlayerQueue;
  void *v8;
  NSString *v9;
  NSString *playerQueue_playerItemKVOIdentifier;
  _QWORD v11[5];

  v4 = a3;
  if (v4)
  {
    +[ISKVOProxyManager sharedManager](ISKVOProxyManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeProxyWithIdentifier:", self->_playerQueue_playerItemKVOIdentifier);

    +[ISKVOProxyManager sharedManager](ISKVOProxyManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    avPlayerQueue = self->_avPlayerQueue;
    objc_msgSend((id)objc_opt_class(), "observedAVPlayerItemKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addProxyWithTarget:queue:keyPaths:delegate:", v4, avPlayerQueue, v8, self);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    playerQueue_playerItemKVOIdentifier = self->_playerQueue_playerItemKVOIdentifier;
    self->_playerQueue_playerItemKVOIdentifier = v9;

  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__ISWrappedAVPlayer__playerQueue_startObservingPlayerItem___block_invoke;
    v11[3] = &unk_1E9453F48;
    v11[4] = self;
    -[ISWrappedAVPlayer _performIvarWrite:](self, "_performIvarWrite:", v11);
  }

}

- (void)_playerQueue_stopObservingPlayerItem:(id)a3
{
  id v4;

  +[ISKVOProxyManager sharedManager](ISKVOProxyManager, "sharedManager", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeProxyWithIdentifier:", self->_playerQueue_playerItemKVOIdentifier);

}

- (void)_playerItemDidPlayToEnd:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *delegateQueue;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISWrappedAVPlayer delegate](self, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[AVPlayer currentItem](self->_playerQueue_avPlayer, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v5)
    {
      delegateQueue = self->_delegateQueue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __45__ISWrappedAVPlayer__playerItemDidPlayToEnd___block_invoke;
      v10[3] = &unk_1E9454130;
      v10[4] = self;
      v11 = v4;
      dispatch_async(delegateQueue, v10);

    }
  }

}

- (id)_nilOrValue:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99E38];
  v4 = a3;
  objc_msgSend(v3, "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
    v6 = 0;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

- (void)observeChangeforKVOProxyIdentifier:(id)a3 keyPath:(id)a4 change:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD);
  id v19;
  uint64_t v20;
  int v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[6];
  _QWORD v39[5];
  int v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[6];
  _QWORD v48[5];
  id v49;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a5, "valueForKey:", *MEMORY[0x1E0CB2CB8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", self->_playerQueue_playerKVOIdentifier))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("rate")))
    {
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke;
      v48[3] = &unk_1E9454180;
      v48[4] = self;
      v49 = v10;
      -[ISObservable performChanges:](self, "performChanges:", v48);
      v11 = v49;
LABEL_35:

      goto LABEL_36;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("status")))
    {
      v14 = objc_msgSend(v10, "integerValue");
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_3;
      v47[3] = &unk_1E94541D0;
      v47[4] = self;
      v47[5] = v14;
      v13 = v47;
      goto LABEL_10;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("error")))
    {
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_5;
      v45[3] = &unk_1E9454180;
      v45[4] = self;
      v46 = v10;
      -[ISObservable performChanges:](self, "performChanges:", v45);
      v11 = v46;
      goto LABEL_35;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("currentItem")))
    {
      -[ISWrappedAVPlayer _nilOrValue:](self, "_nilOrValue:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_7;
      v43[3] = &unk_1E9454130;
      v43[4] = self;
      v17 = v15;
      v44 = v17;
      v18 = (void (**)(_QWORD))MEMORY[0x1D8248F20](v43);
      v41[0] = v16;
      v41[1] = 3221225472;
      v41[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_8;
      v41[3] = &unk_1E9454180;
      v41[4] = self;
      v42 = v17;
      v19 = v17;
      -[ISObservable performChanges:](self, "performChanges:", v41);

      if (!v18)
        goto LABEL_36;
      goto LABEL_22;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("volume")))
    {
      objc_msgSend(v10, "floatValue");
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_10;
      v39[3] = &unk_1E94541F8;
      v39[4] = self;
      v40 = v21;
      -[ISWrappedAVPlayer _performIvarWrite:](self, "_performIvarWrite:", v39);
    }
  }
  else if (objc_msgSend(v8, "isEqualToString:", self->_playerQueue_playerItemKVOIdentifier))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("status")))
    {
      v12 = objc_msgSend(v10, "integerValue");
      if (-[ISWrappedAVPlayer currentItemStatus](self, "currentItemStatus") != v12)
      {
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_11;
        v38[3] = &unk_1E94541D0;
        v38[4] = self;
        v38[5] = v12;
        v13 = v38;
LABEL_10:
        -[ISObservable performChanges:](self, "performChanges:", v13);
      }
    }
    else
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("error")))
      {
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_13;
        v36[3] = &unk_1E9454180;
        v36[4] = self;
        v37 = v10;
        -[ISObservable performChanges:](self, "performChanges:", v36);
        v11 = v37;
        goto LABEL_35;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("forwardPlaybackEndTime")))
      {
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_15;
        v34[3] = &unk_1E9454180;
        v34[4] = self;
        v35 = v10;
        -[ISObservable performChanges:](self, "performChanges:", v34);
        v11 = v35;
        goto LABEL_35;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("tracks")))
      {
        v20 = MEMORY[0x1E0C809B0];
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_17;
        v33[3] = &unk_1E9454220;
        v33[4] = self;
        -[ISObservable performChanges:](self, "performChanges:", v33);
        v32[0] = v20;
        v32[1] = 3221225472;
        v32[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_18;
        v32[3] = &unk_1E9453F48;
        v32[4] = self;
        v18 = (void (**)(_QWORD))MEMORY[0x1D8248F20](v32);
        if (!v18)
          goto LABEL_36;
LABEL_22:
        v18[2](v18);

        goto LABEL_36;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("playbackLikelyToKeepUp")))
      {
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_19;
        v30[3] = &unk_1E9454180;
        v30[4] = self;
        v31 = v10;
        -[ISObservable performChanges:](self, "performChanges:", v30);
        v11 = v31;
        goto LABEL_35;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("videoComposition")))
      {
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_21;
        v28[3] = &unk_1E9454180;
        v28[4] = self;
        v29 = v10;
        -[ISObservable performChanges:](self, "performChanges:", v28);
        v11 = v29;
        goto LABEL_35;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("playbackBufferFull")))
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_23;
        v26[3] = &unk_1E9454180;
        v26[4] = self;
        v27 = v10;
        -[ISObservable performChanges:](self, "performChanges:", v26);
        v11 = v27;
        goto LABEL_35;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("duration")))
      {
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_25;
        v24[3] = &unk_1E9454180;
        v24[4] = self;
        v25 = v10;
        -[ISObservable performChanges:](self, "performChanges:", v24);
        v11 = v25;
        goto LABEL_35;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("playbackBufferEmpty")))
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_27;
        v22[3] = &unk_1E9454180;
        v22[4] = self;
        v23 = v10;
        -[ISObservable performChanges:](self, "performChanges:", v22);
        v11 = v23;
        goto LABEL_35;
      }
    }
  }
LABEL_36:

}

- (BOOL)isLoopingEnabled
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__ISWrappedAVPlayer_isLoopingEnabled__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- ($D31FB86CA7B02E89CA780FE277FE9EC8)loopTimeRange
{
  uint64_t *v4;
  __int128 v5;
  $D31FB86CA7B02E89CA780FE277FE9EC8 *result;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v8 = 0;
  v9 = &v8;
  v10 = 0x5010000000;
  v11 = &unk_1D2DF8527;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__ISWrappedAVPlayer_loopTimeRange__block_invoke;
  v7[3] = &unk_1E9454248;
  v7[4] = self;
  v7[5] = &v8;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v7);
  v4 = v9;
  v5 = *((_OWORD *)v9 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v9 + 2);
  *(_OWORD *)&retstr->var0.var3 = v5;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v4 + 4);
  _Block_object_dispose(&v8, 8);
  return result;
}

- (int64_t)status
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__ISWrappedAVPlayer_status__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)currentItemStatus
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__ISWrappedAVPlayer_currentItemStatus__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentItemDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3810000000;
  v9 = &unk_1D2DF8527;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__ISWrappedAVPlayer_currentItemDuration__block_invoke;
  v5[3] = &unk_1E9454248;
  v5[4] = self;
  v5[5] = &v6;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v5);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v7 + 4);
  _Block_object_dispose(&v6, 8);
  return result;
}

- (BOOL)currentItemPlaybackBufferFull
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__ISWrappedAVPlayer_currentItemPlaybackBufferFull__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)currentItemPlaybackBufferEmpty
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__ISWrappedAVPlayer_currentItemPlaybackBufferEmpty__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)currentItemIsLikelyToKeepUp
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__ISWrappedAVPlayer_currentItemIsLikelyToKeepUp__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)currentItemVideoComposition
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__3786;
  v9 = __Block_byref_object_dispose__3787;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__ISWrappedAVPlayer_currentItemVideoComposition__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)currentItemError
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__3786;
  v9 = __Block_byref_object_dispose__3787;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__ISWrappedAVPlayer_currentItemError__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)error
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3786;
  v11 = __Block_byref_object_dispose__3787;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__ISWrappedAVPlayer_error__block_invoke;
  v6[3] = &unk_1E9454248;
  v6[4] = self;
  v6[5] = &v7;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v6);
  v2 = (id)v8[5];
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (v2 == v3)
      v4 = 0;
    else
      v4 = (void *)v8[5];
    v2 = v4;

  }
  _Block_object_dispose(&v7, 8);

  return v2;
}

- (id)currentItem
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3786;
  v11 = __Block_byref_object_dispose__3787;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__ISWrappedAVPlayer_currentItem__block_invoke;
  v6[3] = &unk_1E9454248;
  v6[4] = self;
  v6[5] = &v7;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v6);
  v2 = (id)v8[5];
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (v2 == v3)
      v4 = 0;
    else
      v4 = (void *)v8[5];
    v2 = v4;

  }
  _Block_object_dispose(&v7, 8);

  return v2;
}

- (float)rate
{
  float v2;
  _QWORD v4[6];
  uint64_t v5;
  float *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = (float *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__ISWrappedAVPlayer_rate__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = v6[6];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (float)volume
{
  float v2;
  _QWORD v4[6];
  uint64_t v5;
  float *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = (float *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__ISWrappedAVPlayer_volume__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = v6[6];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isAudioEnabled
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__ISWrappedAVPlayer_isAudioEnabled__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_playerQueue_avPlayer;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE currentTime](result, "currentTime");
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)itemForwardPlaybackEndTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3810000000;
  v9 = &unk_1D2DF8527;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__ISWrappedAVPlayer_itemForwardPlaybackEndTime__block_invoke;
  v5[3] = &unk_1E9454248;
  v5[4] = self;
  v5[5] = &v6;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v5);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v7 + 4);
  _Block_object_dispose(&v6, 8);
  return result;
}

- (BOOL)preventsSleepDuringVideoPlayback
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__ISWrappedAVPlayer_preventsSleepDuringVideoPlayback__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)suppressesAudioRendering
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__ISWrappedAVPlayer_suppressesAudioRendering__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISWrappedAVPlayer _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setSuppressesAudioRendering:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (-[ISWrappedAVPlayer suppressesAudioRendering](self, "suppressesAudioRendering") != a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__ISWrappedAVPlayer_setSuppressesAudioRendering___block_invoke;
    v5[3] = &unk_1E9454298;
    v5[4] = self;
    v6 = a3;
    -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v5);
  }
}

- (void)setIsAudioEnabled:(BOOL)a3
{
  _QWORD v5[4];
  BOOL v6;

  if (-[ISWrappedAVPlayer isAudioEnabled](self, "isAudioEnabled") != a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__ISWrappedAVPlayer_setIsAudioEnabled___block_invoke;
    v5[3] = &__block_descriptor_33_e27_v16__0__ISWrappedAVPlayer_8l;
    v6 = a3;
    -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v5);
  }
}

- (void)photosOnly_waitForPlayerTransactionsToFinish
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[4];
  NSObject *v6;

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__ISWrappedAVPlayer_photosOnly_waitForPlayerTransactionsToFinish__block_invoke;
  v5[3] = &unk_1E9454028;
  v6 = v3;
  v4 = v3;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v5);
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)_playerQueue_updatePlayerItemAudioTracksEnabled
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[ISWrappedAVPlayer isAudioEnabled](self, "isAudioEnabled");
  -[ISWrappedAVPlayer currentItem](self, "currentItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E0C8A6F0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v3)
      objc_msgSend(v6, "selectMediaOptionAutomaticallyInMediaSelectionGroup:", v5);
    else
      objc_msgSend(v6, "selectMediaOption:inMediaSelectionGroup:", 0, v5);
  }
  else
  {
    objc_msgSend(v6, "is_setAudioTracksEnabled:", v3);
  }

}

- (void)setLoopingEnabled:(BOOL)a3
{
  uint64_t v5;
  _QWORD v6[4];
  BOOL v7;
  _QWORD v8[5];
  BOOL v9;

  if (-[ISWrappedAVPlayer isLoopingEnabled](self, "isLoopingEnabled") != a3)
  {
    v5 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__ISWrappedAVPlayer_setLoopingEnabled___block_invoke;
    v8[3] = &unk_1E9454270;
    v8[4] = self;
    v9 = a3;
    -[ISWrappedAVPlayer _performIvarWrite:](self, "_performIvarWrite:", v8);
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __39__ISWrappedAVPlayer_setLoopingEnabled___block_invoke_2;
    v6[3] = &__block_descriptor_33_e27_v16__0__ISWrappedAVPlayer_8l;
    v7 = a3;
    -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v6);
  }
}

- (void)setLoopingEnabled:(BOOL)a3 withTemplateItem:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  -[ISWrappedAVPlayer setLoopingEnabled:](self, "setLoopingEnabled:", v4);
  -[ISWrappedAVPlayer currentItem](self, "currentItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6 != v8)
  {
    -[ISWrappedAVPlayer replaceCurrentItemWithPlayerItem:](self, "replaceCurrentItemWithPlayerItem:", v8);
    v7 = v8;
  }

}

- (void)setLoopTimeRange:(id *)a3
{
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v6 = *(_OWORD *)&a3->var0.var3;
  v13 = *(_OWORD *)&a3->var0.var0;
  v12[1] = 3221225472;
  v12[2] = __38__ISWrappedAVPlayer_setLoopTimeRange___block_invoke;
  v12[3] = &unk_1E94542C0;
  v12[4] = self;
  v14 = v6;
  v15 = *(_OWORD *)&a3->var1.var1;
  -[ISWrappedAVPlayer _performIvarWrite:](self, "_performIvarWrite:", v12);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __38__ISWrappedAVPlayer_setLoopTimeRange___block_invoke_2;
  v8[3] = &__block_descriptor_80_e27_v16__0__ISWrappedAVPlayer_8l;
  v7 = *(_OWORD *)&a3->var0.var3;
  v9 = *(_OWORD *)&a3->var0.var0;
  v10 = v7;
  v11 = *(_OWORD *)&a3->var1.var1;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v8);
}

- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__ISWrappedAVPlayer_setPreventsSleepDuringVideoPlayback___block_invoke;
  v3[3] = &unk_1E9454298;
  v4 = a3;
  v3[4] = self;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v3);
}

- (void)setRate:(float)a3 time:(id *)a4 atHostTime:(id *)a5
{
  _QWORD v5[4];
  float v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ISWrappedAVPlayer_setRate_time_atHostTime___block_invoke;
  v5[3] = &__block_descriptor_84_e27_v16__0__ISWrappedAVPlayer_8l;
  v6 = a3;
  v7 = *a4;
  v8 = *a5;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v5);
}

- (void)playToTime:(id *)a3 withInitialRate:(float)a4 overDuration:(double)a5 progressHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  double v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;
  float v16;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__ISWrappedAVPlayer_playToTime_withInitialRate_overDuration_progressHandler___block_invoke;
  v12[3] = &unk_1E9454328;
  v15 = *a3;
  v16 = a4;
  v14 = a5;
  v13 = v10;
  v11 = v10;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v12);

}

- (void)setActionAtItemEnd:(int64_t)a3
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  if (a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __40__ISWrappedAVPlayer_setActionAtItemEnd___block_invoke;
    v4[3] = &__block_descriptor_40_e27_v16__0__ISWrappedAVPlayer_8l;
    v4[4] = a3;
    -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v4);
  }
  else
  {
    ISGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2DCA000, v3, OS_LOG_TYPE_ERROR, "-[ISWrappedAVPlayer setActionAtItemEnd:] ignoring AVPlayerActionAtItemEndAdvance argument because the underlying player is not an AVQueuePlayer. This should not be necessary if you are setting loopingEnabled or loopTimeRange.", buf, 2u);
    }

  }
}

- (void)setAllowsExternalPlayback:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__ISWrappedAVPlayer_setAllowsExternalPlayback___block_invoke;
  v3[3] = &__block_descriptor_33_e27_v16__0__ISWrappedAVPlayer_8l;
  v4 = a3;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v3);
}

- (void)setVolume:(float)a3
{
  _QWORD v3[4];
  float v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__ISWrappedAVPlayer_setVolume___block_invoke;
  v3[3] = &__block_descriptor_36_e27_v16__0__ISWrappedAVPlayer_8l;
  v4 = a3;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v3);
}

- (void)setRate:(float)a3
{
  _QWORD v3[4];
  float v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__ISWrappedAVPlayer_setRate___block_invoke;
  v3[3] = &__block_descriptor_36_e27_v16__0__ISWrappedAVPlayer_8l;
  v4 = a3;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v3);
}

- (void)pause
{
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", &__block_literal_global_56);
}

- (void)replaceCurrentItemWithPlayerItem:(id)a3 thenCall:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__ISWrappedAVPlayer_replaceCurrentItemWithPlayerItem_thenCall___block_invoke;
  v10[3] = &unk_1E94543D0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v10);

}

- (void)replaceCurrentItemWithPlayerItem:(id)a3
{
  -[ISWrappedAVPlayer replaceCurrentItemWithPlayerItem:thenCall:](self, "replaceCurrentItemWithPlayerItem:thenCall:", a3, 0);
}

- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__ISWrappedAVPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke;
  v12[3] = &unk_1E94543F8;
  v14 = *a3;
  v15 = *a4;
  v16 = *a5;
  v13 = v10;
  v11 = v10;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v12);

}

- (void)prerollAtRate:(float)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  float v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__ISWrappedAVPlayer_prerollAtRate_completionHandler___block_invoke;
  v8[3] = &unk_1E9454420;
  v10 = a3;
  v9 = v6;
  v7 = v6;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v8);

}

- (void)cancelPendingPrerolls
{
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", &__block_literal_global_57_3781);
}

- (void)setWrappedAudioSession:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__ISWrappedAVPlayer_setWrappedAudioSession___block_invoke;
  v6[3] = &unk_1E9454028;
  v7 = v4;
  v5 = v4;
  -[ISWrappedAVPlayer _performPlayerTransaction:](self, "_performPlayerTransaction:", v6);

}

- (void)becomeReusable
{
  __int128 v3;
  _OWORD v4[3];

  -[ISWrappedAVPlayer replaceCurrentItemWithPlayerItem:](self, "replaceCurrentItemWithPlayerItem:", 0);
  -[ISWrappedAVPlayer setIsAudioEnabled:](self, "setIsAudioEnabled:", 1);
  v3 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v4[0] = *MEMORY[0x1E0CA2E40];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  -[ISWrappedAVPlayer setLoopTimeRange:](self, "setLoopTimeRange:", v4);
}

- (ISWrappedAVPlayerDelegate)delegate
{
  return (ISWrappedAVPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observersByID, 0);
  objc_storeStrong((id *)&self->_ivarQueue_itemVideoComposition, 0);
  objc_storeStrong((id *)&self->_ivarQueue_itemError, 0);
  objc_destroyWeak((id *)&self->_ivarQueue_error);
  objc_destroyWeak((id *)&self->_ivarQueue_currentItem);
  objc_storeStrong((id *)&self->_playerQueue_playerItemKVOIdentifier, 0);
  objc_storeStrong((id *)&self->_playerQueue_playerKVOIdentifier, 0);
  objc_storeStrong(&self->_playerQueue_playerItemDidPlayToEndObserver, 0);
  objc_storeStrong((id *)&self->_playerQueue_wrappedAudioSession, 0);
  objc_storeStrong((id *)&self->_playerQueue_avPlayer, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_avPlayerQueue, 0);
}

void __44__ISWrappedAVPlayer_setWrappedAudioSession___block_invoke(uint64_t a1, id *a2)
{
  id *v4;
  void *v5;
  id v6;

  objc_storeStrong(a2 + 15, *(id *)(a1 + 32));
  v4 = a2;
  objc_msgSend(v4, "_playerQueue_avPlayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "audioSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAudioSession:", v5);

}

void __42__ISWrappedAVPlayer_cancelPendingPrerolls__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(a2, "_playerQueue_avPlayer");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelPendingPrerolls");

  }
}

void __53__ISWrappedAVPlayer_prerollAtRate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  objc_msgSend(a2, "_playerQueue_avPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v4, "prerollAtRate:completionHandler:", *(_QWORD *)(a1 + 32), v3);

}

void __81__ISWrappedAVPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  objc_msgSend(a2, "_playerQueue_avPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 56);
  v7 = *(_OWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 80);
  v5 = *(_OWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 104);
  objc_msgSend(v3, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v9, &v7, &v5, v4);

}

void __63__ISWrappedAVPlayer_replaceCurrentItemWithPlayerItem_thenCall___block_invoke(uint64_t a1, void *a2)
{
  dispatch_queue_t *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CMTimeRange v13;
  CMTime start;
  CMTime duration;
  CMTimeRange v16;
  _OWORD v17[6];
  uint64_t v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v3 = a2;
  -[dispatch_queue_t _playerQueue_avPlayer](v3, "_playerQueue_avPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  if (v5 != v6)
  {
    objc_msgSend(v6, "setAllowedAudioSpatializationFormats:", 4);
    if (-[dispatch_queue_t isLoopingEnabled](v3, "isLoopingEnabled"))
    {
      if (v3)
      {
        -[dispatch_queue_t loopTimeRange](v3, "loopTimeRange");
        if ((BYTE12(v21) & 1) != 0)
        {
          -[dispatch_queue_t loopTimeRange](v3, "loopTimeRange");
          if ((v20 & 1) != 0)
          {
            -[dispatch_queue_t loopTimeRange](v3, "loopTimeRange");
            if (!v19)
            {
              -[dispatch_queue_t loopTimeRange](v3, "loopTimeRange");
              if ((v18 & 0x8000000000000000) == 0)
              {
                -[dispatch_queue_t loopTimeRange](v3, "loopTimeRange");
                v7 = *(void **)(a1 + 32);
                v17[0] = v17[3];
                v17[1] = v17[4];
                v17[2] = v17[5];
                objc_msgSend(v7, "setLoopTimeRange:", v17);
                goto LABEL_14;
              }
            }
          }
        }
      }
      else
      {
        v22 = 0u;
        v23 = 0u;
        v21 = 0u;
      }
      objc_msgSend(*(id *)(a1 + 32), "asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "duration");
      else
        memset(&duration, 0, sizeof(duration));
      start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      CMTimeRangeMake(&v16, &start, &duration);
      v10 = *(void **)(a1 + 32);
      v13 = v16;
      objc_msgSend(v10, "setLoopTimeRange:", &v13);

    }
LABEL_14:
    -[dispatch_queue_t _playerQueue_stopObservingPlayerItem:](v3, "_playerQueue_stopObservingPlayerItem:", v5);
    -[dispatch_queue_t _playerQueue_avPlayer](v3, "_playerQueue_avPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replaceCurrentItemWithPlayerItem:", *(_QWORD *)(a1 + 32));

  }
  v12 = *(void **)(a1 + 40);
  if (v12)
    dispatch_async(v3[13], v12);

}

void __26__ISWrappedAVPlayer_pause__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "_playerQueue_avPlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

void __29__ISWrappedAVPlayer_setRate___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  objc_msgSend(a2, "_playerQueue_avPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = *(_DWORD *)(a1 + 32);
  objc_msgSend(v4, "setRate:", v3);

}

void __31__ISWrappedAVPlayer_setVolume___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  objc_msgSend(a2, "_playerQueue_avPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = *(_DWORD *)(a1 + 32);
  objc_msgSend(v4, "setVolume:", v3);

}

void __47__ISWrappedAVPlayer_setAllowsExternalPlayback___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_playerQueue_avPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsExternalPlayback:", *(unsigned __int8 *)(a1 + 32));

}

void __40__ISWrappedAVPlayer_setActionAtItemEnd___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_playerQueue_avPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActionAtItemEnd:", *(_QWORD *)(a1 + 32));

}

void __77__ISWrappedAVPlayer_playToTime_withInitialRate_overDuration_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  objc_msgSend(a2, "_playerQueue_avPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = *(_DWORD *)(a1 + 72);
  v5 = *(double *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v3, "playToTime:withInitialRate:overDuration:progressHandler:", &v7, v6, v4, v5);

}

void __45__ISWrappedAVPlayer_setRate_time_atHostTime___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  objc_msgSend(a2, "_playerQueue_avPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = *(_DWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 36);
  v8 = *(_QWORD *)(a1 + 52);
  v5 = *(_OWORD *)(a1 + 60);
  v6 = *(_QWORD *)(a1 + 76);
  objc_msgSend(v3, "setRate:time:atHostTime:", &v7, &v5, v4);

}

void __57__ISWrappedAVPlayer_setPreventsSleepDuringVideoPlayback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  char v6;

  v3 = a2;
  objc_msgSend(v3, "_playerQueue_avPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreventsDisplaySleepDuringVideoPlayback:", *(unsigned __int8 *)(a1 + 40));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__ISWrappedAVPlayer_setPreventsSleepDuringVideoPlayback___block_invoke_2;
  v5[3] = &unk_1E9454270;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v3, "_performIvarWrite:", v5);

}

uint64_t __57__ISWrappedAVPlayer_setPreventsSleepDuringVideoPlayback___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 234) = *(_BYTE *)(result + 40);
  return result;
}

__n128 __38__ISWrappedAVPlayer_setLoopTimeRange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(a1 + 32) + 184;
  result = *(__n128 *)(a1 + 72);
  v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)v1 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v1 + 16) = v3;
  *(__n128 *)(v1 + 32) = result;
  return result;
}

void __38__ISWrappedAVPlayer_setLoopTimeRange___block_invoke_2(_OWORD *a1, void *a2)
{
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  objc_msgSend(a2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[3];
  v5[0] = a1[2];
  v5[1] = v4;
  v5[2] = a1[4];
  objc_msgSend(v3, "setLoopTimeRange:", v5);

}

uint64_t __39__ISWrappedAVPlayer_setLoopingEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 232) = *(_BYTE *)(result + 40);
  return result;
}

void __39__ISWrappedAVPlayer_setLoopingEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  CMTimeRange v8;
  CMTime start;
  CMTime duration;
  CMTimeRange v11;

  objc_msgSend(a2, "_playerQueue_avPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(v4, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "duration");
    else
      memset(&duration, 0, sizeof(duration));
    start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    CMTimeRangeMake(&v11, &start, &duration);
    v8 = v11;
    objc_msgSend(v4, "setLoopTimeRange:", &v8);

  }
  else
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&v11.start.value = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&v11.start.epoch = v7;
    *(_OWORD *)&v11.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    *(_OWORD *)&v8.start.value = *(_OWORD *)&v11.start.value;
    *(_OWORD *)&v8.start.epoch = v7;
    *(_OWORD *)&v8.duration.timescale = *(_OWORD *)&v11.duration.timescale;
    objc_msgSend(v4, "setLoopTimeRange:", &v8);
  }

}

void __65__ISWrappedAVPlayer_photosOnly_waitForPlayerTransactionsToFinish__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __39__ISWrappedAVPlayer_setIsAudioEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  char v10;

  v3 = a2;
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __39__ISWrappedAVPlayer_setIsAudioEnabled___block_invoke_2;
  v8 = &unk_1E9454270;
  v9 = v3;
  v10 = *(_BYTE *)(a1 + 32);
  v4 = v3;
  objc_msgSend(v4, "_performIvarWrite:", &v5);
  objc_msgSend(v4, "_playerQueue_updatePlayerItemAudioTracksEnabled", v5, v6, v7, v8);

}

uint64_t __39__ISWrappedAVPlayer_setIsAudioEnabled___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 233) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __49__ISWrappedAVPlayer_setSuppressesAudioRendering___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = *(void **)(a1 + 32);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __49__ISWrappedAVPlayer_setSuppressesAudioRendering___block_invoke_2;
  v11 = &unk_1E9454270;
  v12 = v3;
  LOBYTE(v13) = *(_BYTE *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "_performIvarWrite:", &v8);
  v5 = *(unsigned __int8 *)(a1 + 40);
  v6 = (void *)v4[14];

  return objc_msgSend(v6, "_setSuppressesAudioRendering:", v5, v8, v9, v10, v11, v12, v13);
}

uint64_t __49__ISWrappedAVPlayer_setSuppressesAudioRendering___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 235) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __45__ISWrappedAVPlayer_suppressesAudioRendering__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 235);
  return result;
}

uint64_t __53__ISWrappedAVPlayer_preventsSleepDuringVideoPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 234);
  return result;
}

__n128 __47__ISWrappedAVPlayer_itemForwardPlaybackEndTime__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 256);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

uint64_t __35__ISWrappedAVPlayer_isAudioEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 233);
  return result;
}

float __27__ISWrappedAVPlayer_volume__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 180);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

float __25__ISWrappedAVPlayer_rate__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 176);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __32__ISWrappedAVPlayer_currentItem__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 152));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __26__ISWrappedAVPlayer_error__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __37__ISWrappedAVPlayer_currentItemError__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 248));
}

void __48__ISWrappedAVPlayer_currentItemVideoComposition__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 312));
}

uint64_t __48__ISWrappedAVPlayer_currentItemIsLikelyToKeepUp__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 320);
  return result;
}

uint64_t __51__ISWrappedAVPlayer_currentItemPlaybackBufferEmpty__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 321);
  return result;
}

uint64_t __50__ISWrappedAVPlayer_currentItemPlaybackBufferFull__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 304);
  return result;
}

__n128 __40__ISWrappedAVPlayer_currentItemDuration__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 280);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

uint64_t __38__ISWrappedAVPlayer_currentItemStatus__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 240);
  return result;
}

uint64_t __27__ISWrappedAVPlayer_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 160);
  return result;
}

__n128 __34__ISWrappedAVPlayer_loopTimeRange__block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 200);
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 216);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 184);
  *(_OWORD *)(v1 + 48) = v3;
  *(__n128 *)(v1 + 64) = result;
  return result;
}

uint64_t __37__ISWrappedAVPlayer_isLoopingEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 232);
  return result;
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_2;
  v6 = &unk_1E9454130;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  objc_msgSend(v7, "_performIvarWrite:", &v3);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2, v3, v4, v5, v6, v7);

}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_4;
  v4[3] = &unk_1E94541A8;
  v2 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v2;
  objc_msgSend(v5, "_performIvarWrite:", v4);
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_6;
  v6 = &unk_1E9454130;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  objc_msgSend(v7, "_performIvarWrite:", &v3);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 8, v3, v4, v5, v6, v7);

}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playerQueue_startObservingPlayerItem:", *(_QWORD *)(a1 + 40));
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_9;
  v6 = &unk_1E9454130;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  objc_msgSend(v7, "_performIvarWrite:", &v3);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 4, v3, v4, v5, v6, v7);

}

float __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_10(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 180) = result;
  return result;
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_12;
  v4[3] = &unk_1E94541A8;
  v2 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v2;
  objc_msgSend(v5, "_performIvarWrite:", v4);
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 16);
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_13(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_14;
  v6 = &unk_1E9454130;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  objc_msgSend(v7, "_performIvarWrite:", &v3);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 8, v3, v4, v5, v6, v7);

}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_15(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __n128 (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_16;
  v6 = &unk_1E9454130;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  objc_msgSend(v7, "_performIvarWrite:", &v3);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2048, v3, v4, v5, v6, v7);

}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 0x2000);
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playerQueue_updatePlayerItemAudioTracksEnabled");
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_19(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_20;
  v6 = &unk_1E9454130;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  objc_msgSend(v7, "_performIvarWrite:", &v3);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 64, v3, v4, v5, v6, v7);

}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_21(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_22;
  v6 = &unk_1E9454130;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  objc_msgSend(v7, "_performIvarWrite:", &v3);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 4096, v3, v4, v5, v6, v7);

}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_23(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_24;
  v6 = &unk_1E9454130;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  objc_msgSend(v7, "_performIvarWrite:", &v3);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 128, v3, v4, v5, v6, v7);

}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_25(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __n128 (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_26;
  v6 = &unk_1E9454130;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  objc_msgSend(v7, "_performIvarWrite:", &v3);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 512, v3, v4, v5, v6, v7);

}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_27(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_28;
  v6 = &unk_1E9454130;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  objc_msgSend(v7, "_performIvarWrite:", &v3);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 256, v3, v4, v5, v6, v7);

}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_28(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 321) = result;
  return result;
}

__n128 __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_26(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  __n128 result;
  __n128 v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v1, "CMTimeValue");
  }
  else
  {
    v4 = 0uLL;
    v5 = 0;
  }
  result = v4;
  *(_QWORD *)(v2 + 296) = v5;
  *(__n128 *)(v2 + 280) = v4;
  return result;
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_24(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 304) = result;
  return result;
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_22(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 312), *(id *)(a1 + 40));
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_20(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = result;
  return result;
}

__n128 __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_16(uint64_t a1)
{
  void *v1;
  __n128 *v2;
  __n128 result;
  __n128 v4;
  unint64_t v5;

  v2 = *(__n128 **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v1, "CMTimeValue");
  }
  else
  {
    v4 = 0uLL;
    v5 = 0;
  }
  result = v4;
  v2[17].n128_u64[0] = v5;
  v2[16] = v4;
  return result;
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_nilOrValue:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 248);
  *(_QWORD *)(v3 + 248) = v2;

}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_12(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 240) = *(_QWORD *)(result + 40);
  return result;
}

id __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_9(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 152), *(id *)(a1 + 40));
}

void __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_nilOrValue:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 168), v2);

}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_4(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 160) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __71__ISWrappedAVPlayer_observeChangeforKVOProxyIdentifier_keyPath_change___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = objc_msgSend(*(id *)(a1 + 40), "floatValue");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 176) = v3;
  return result;
}

void __45__ISWrappedAVPlayer__playerItemDidPlayToEnd___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avPlayer:itemDidPlayToEnd:", v2, v3);

}

__n128 __59__ISWrappedAVPlayer__playerQueue_startObservingPlayerItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __n128 *v7;
  __n128 result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 312);
  *(_QWORD *)(v2 + 312) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 248);
  *(_QWORD *)(v4 + 248) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 0;
  v6 = *(_QWORD *)(a1 + 32) + 280;
  v7 = (__n128 *)MEMORY[0x1E0CA2E18];
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  result = *v7;
  *(__n128 *)v6 = *v7;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 304) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 321) = 0;
  return result;
}

void __40__ISWrappedAVPlayer_removeTimeObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3786;
  v19 = __Block_byref_object_dispose__3787;
  v20 = 0;
  v5 = *(void **)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__ISWrappedAVPlayer_removeTimeObserver___block_invoke_46;
  v12[3] = &unk_1E9454108;
  v14 = &v15;
  v12[4] = v5;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "_performIvarRead:", v12);
  if (v16[5])
  {
    objc_msgSend(v3, "_playerQueue_avPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeTimeObserver:", v16[5]);

    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __40__ISWrappedAVPlayer_removeTimeObserver___block_invoke_2;
    v9[3] = &unk_1E9454130;
    v10 = v3;
    v11 = v7;
    objc_msgSend(v10, "_performIvarWrite:", v9);

  }
  _Block_object_dispose(&v15, 8);

}

void __40__ISWrappedAVPlayer_removeTimeObserver___block_invoke_46(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 328), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __40__ISWrappedAVPlayer_removeTimeObserver___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __70__ISWrappedAVPlayer_addBoundaryTimeObserverForTimes_queue_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "_playerQueue_avPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addBoundaryTimeObserverForTimes:queue:usingBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__ISWrappedAVPlayer_addBoundaryTimeObserverForTimes_queue_usingBlock___block_invoke_2;
  v8[3] = &unk_1E9454090;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v11 = v5;
  v6 = v5;
  v7 = v3;
  objc_msgSend(v7, "_performIvarWrite:", v8);

}

uint64_t __70__ISWrappedAVPlayer_addBoundaryTimeObserverForTimes_queue_usingBlock___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 328), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

void __73__ISWrappedAVPlayer_addPeriodicTimeObserverForInterval_queue_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  __int128 v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "_playerQueue_avPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v14 = *(_OWORD *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v4, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v14, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__ISWrappedAVPlayer_addPeriodicTimeObserverForInterval_queue_usingBlock___block_invoke_2;
  v10[3] = &unk_1E9454090;
  v11 = v3;
  v12 = *(id *)(a1 + 40);
  v13 = v7;
  v8 = v7;
  v9 = v3;
  objc_msgSend(v9, "_performIvarWrite:", v10);

}

uint64_t __73__ISWrappedAVPlayer_addPeriodicTimeObserverForInterval_queue_usingBlock___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 328), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

void __46__ISWrappedAVPlayer_setItemBlendsVideoFrames___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "_playerQueue_avPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBlendsVideoFrames:", *(unsigned __int8 *)(a1 + 32));

}

void __51__ISWrappedAVPlayer_setItemForwardEndPlaybackTime___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  __int128 v5;
  uint64_t v6;

  objc_msgSend(a2, "_playerQueue_avPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "setForwardPlaybackEndTime:", &v5);

}

void __49__ISWrappedAVPlayer_attachToPlayerLayerIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_playerQueue_avPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "_playerQueue_avPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWrappedPlayer:", v6);

  }
}

uint64_t __28__ISWrappedAVPlayer_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeTimeObserver:");
}

void __25__ISWrappedAVPlayer_init__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.photosplayer.wrappedAVPlayer.stateDispatch", v2);
  v1 = (void *)init_avpq;
  init_avpq = (uint64_t)v0;

}

uint64_t __39__ISWrappedAVPlayer__initWithAVPlayer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  +[ISKVOProxyManager sharedManager](ISKVOProxyManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 112);
  v5 = *(_QWORD *)(v3 + 88);
  objc_msgSend((id)objc_opt_class(), "observedAVPlayerKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addProxyWithTarget:queue:keyPaths:delegate:", v4, v5, v6, *(_QWORD *)(a1 + 32));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 136);
  *(_QWORD *)(v8 + 136) = v7;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setAllowsExternalPlayback:", 0);
}

void __39__ISWrappedAVPlayer__initWithAVPlayer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *WeakRetained;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__ISWrappedAVPlayer__initWithAVPlayer___block_invoke_3;
    v5[3] = &unk_1E9453F70;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v6 = v3;
    dispatch_async(WeakRetained, v5);

    objc_destroyWeak(&v7);
  }

}

void __39__ISWrappedAVPlayer__initWithAVPlayer___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_playerItemDidPlayToEnd:", *(_QWORD *)(a1 + 32));

}

void __47__ISWrappedAVPlayer__performPlayerTransaction___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

void __54__ISWrappedAVPlayer_unregisterChangeObserver_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_avPlayerQueue_unregisterChangeObserver:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

void __52__ISWrappedAVPlayer_registerChangeObserver_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_avPlayerQueue_registerChangeObserver:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

+ (id)observedAVPlayerKeys
{
  return &unk_1E94600C8;
}

+ (id)observedAVPlayerItemKeys
{
  return &unk_1E94600E0;
}

@end
