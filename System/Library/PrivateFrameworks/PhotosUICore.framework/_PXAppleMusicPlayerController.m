@implementation _PXAppleMusicPlayerController

- (_PXAppleMusicPlayerController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicPlayerController.m"), 75, CFSTR("%s is not available as initializer"), "-[_PXAppleMusicPlayerController init]");

  abort();
}

- (id)_init
{
  _PXAppleMusicPlayerController *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  MPMusicPlayerApplicationController *queue_player;
  void *v7;
  uint64_t v8;
  MPMusicPlayerApplicationController *v9;
  uint64_t v10;
  uint64_t v11;
  id playbackStateChangeObserver;
  uint64_t v13;
  MPMusicPlayerApplicationController *v14;
  uint64_t v15;
  id playbackDidEndObserver;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_PXAppleMusicPlayerController;
  v2 = -[_PXAppleMusicPlayerController init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CC2478], "setShouldUseSystemMusicAppOnMacOS:", 0);
    px_dispatch_queue_create_serial();
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC2478]), "initWithClientIdentifier:queue:", CFSTR("com.photos.PXAppleMusicPlayerController"), v2->_queue);
    queue_player = v2->_queue_player;
    v2->_queue_player = (MPMusicPlayerApplicationController *)v5;

    -[MPMusicPlayerApplicationController setRepeatMode:](v2->_queue_player, "setRepeatMode:", 2);
    v2->_playerRespondsToRelativeVolume = objc_opt_respondsToSelector() & 1;
    v2->_queue_volume = 1.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MPMusicPlayerApplicationController setDisableAutomaticCanBeNowPlaying:](v2->_queue_player, "setDisableAutomaticCanBeNowPlaying:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MPMusicPlayerApplicationController setPrioritizeStartupOverQuality:](v2->_queue_player, "setPrioritizeStartupOverQuality:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v2);
    v8 = *MEMORY[0x1E0CC21D8];
    v9 = v2->_queue_player;
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __38___PXAppleMusicPlayerController__init__block_invoke;
    v20[3] = &unk_1E51441D8;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v8, v9, 0, v20);
    v11 = objc_claimAutoreleasedReturnValue();
    playbackStateChangeObserver = v2->_playbackStateChangeObserver;
    v2->_playbackStateChangeObserver = (id)v11;

    v13 = *MEMORY[0x1E0CC21C8];
    v14 = v2->_queue_player;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __38___PXAppleMusicPlayerController__init__block_invoke_2;
    v18[3] = &unk_1E51441D8;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v13, v14, 0, v18);
    v15 = objc_claimAutoreleasedReturnValue();
    playbackDidEndObserver = v2->_playbackDidEndObserver;
    v2->_playbackDidEndObserver = (id)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_playbackStateChangeObserver);
  objc_msgSend(v3, "removeObserver:", self->_playbackDidEndObserver);

  v4.receiver = self;
  v4.super_class = (Class)_PXAppleMusicPlayerController;
  -[_PXAppleMusicPlayerController dealloc](&v4, sel_dealloc);
}

- (void)setCurrentClientIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60___PXAppleMusicPlayerController_setCurrentClientIdentifier___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (NSString)currentClientIdentifier
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__190054;
  v10 = __Block_byref_object_dispose__190055;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56___PXAppleMusicPlayerController_currentClientIdentifier__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)setWindowSceneID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50___PXAppleMusicPlayerController_setWindowSceneID___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (NSString)windowSceneID
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__190054;
  v10 = __Block_byref_object_dispose__190055;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46___PXAppleMusicPlayerController_windowSceneID__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)clientIdentifier:(id)a3 performAsyncPlayerTransaction:(id)a4
{
  -[_PXAppleMusicPlayerController clientIdentifier:becomeCurrentClientIfNeeded:performAsyncPlayerTransaction:](self, "clientIdentifier:becomeCurrentClientIfNeeded:performAsyncPlayerTransaction:", a3, 0, a4);
}

- (void)clientIdentifier:(id)a3 becomeCurrentClientIfNeeded:(BOOL)a4 performAsyncPlayerTransaction:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __108___PXAppleMusicPlayerController_clientIdentifier_becomeCurrentClientIfNeeded_performAsyncPlayerTransaction___block_invoke;
  v13[3] = &unk_1E5144238;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fetchCurrentTime
{
  NSObject *queue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_1A7E74EE7;
  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49___PXAppleMusicPlayerController_fetchCurrentTime__block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(queue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

- (double)volume
{
  NSObject *queue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39___PXAppleMusicPlayerController_volume__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setItemWithStoreID:(id)a3 startTime:(id *)a4
{
  NSString *v6;
  __int128 v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSString *v13;
  NSString *queue_itemStoreID;
  id v15;
  void *v16;
  void *v17;
  double Seconds;
  NSObject *v19;
  NSString *v20;
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((a4->var2 & 0x1D) != 1)
  {
    v7 = *MEMORY[0x1E0CA2E68];
    a4->var3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&a4->var0 = v7;
  }
  self->_isAtEnd = 0;
  v8 = self->_queue_itemStoreID;
  if (v8 == v6)
  {

  }
  else
  {
    v9 = v8;
    v10 = v6;
    v11 = -[NSString isEqualToString:](v10, "isEqualToString:", v9);

    if (!v11)
    {
      PLAudioPlaybackGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.var0) = 138543618;
        *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)self;
        LOWORD(buf.var2) = 2114;
        *(_QWORD *)((char *)&buf.var2 + 2) = v10;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ preparing item with store ID %{public}@.", (uint8_t *)&buf, 0x16u);
      }

      v13 = (NSString *)-[NSString copy](v10, "copy");
      queue_itemStoreID = self->_queue_itemStoreID;
      self->_queue_itemStoreID = v13;

      v15 = objc_alloc(MEMORY[0x1E0CC2488]);
      v20 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithStoreIDs:", v16);

      objc_msgSend(v17, "setPrivate:", 1);
      buf = *a4;
      objc_msgSend(v17, "setStartTime:forItemWithStoreID:", v10, CMTimeGetSeconds((CMTime *)&buf));
      -[MPMusicPlayerApplicationController setQueueWithDescriptor:](self->_queue_player, "setQueueWithDescriptor:", v17);

      goto LABEL_12;
    }
  }
  buf = *a4;
  Seconds = CMTimeGetSeconds((CMTime *)&buf);
  PLAudioPlaybackGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.var0) = 138543618;
    *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)self;
    LOWORD(buf.var2) = 2048;
    *(double *)((char *)&buf.var2 + 2) = Seconds;
    _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ seeking item in place to new time %.2f.", (uint8_t *)&buf, 0x16u);
  }

  -[MPMusicPlayerApplicationController setCurrentPlaybackTime:](self->_queue_player, "setCurrentPlaybackTime:", Seconds);
LABEL_12:

}

- (void)prepareToPlayWithCompletionHandler:(id)a3
{
  id v5;
  PXExpectation *queue_preparationExpectation;
  NSObject *v7;
  void *v8;
  PXExpectation *v9;
  OS_dispatch_queue *queue;
  void *v11;
  PXExpectation *v12;
  uint64_t v13;
  void *v14;
  id queue_preparationCompletionHandler;
  NSObject *v16;
  void *v17;
  char v18;
  MPMusicPlayerApplicationController *queue_player;
  _QWORD aBlock[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id from;
  id location;
  uint8_t buf[4];
  _PXAppleMusicPlayerController *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  queue_preparationExpectation = self->_queue_preparationExpectation;
  if (queue_preparationExpectation)
  {
    self->_queue_preparationExpectation = 0;

  }
  if (self->_queue_preparationCompletionHandler)
  {
    PLAudioPlaybackGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = self;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ informing existing preparation completion handler that preparation is being interrupted.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXAppleMusicPlayerControllerErrorDomain"), 5, CFSTR("Apple Music playback preparation was interrupted by another prepare command."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXAppleMusicPlayerController _queue_callPreparationCompletionHandler:error:](self, "_queue_callPreparationCompletionHandler:error:", 0, v8);

  }
  self->_preparationSignpostID = objc_msgSend(MEMORY[0x1E0D09910], "startSignpost");
  v9 = [PXExpectation alloc];
  queue = self->_queue;
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXExpectation initWithQueue:labelFormat:](v9, "initWithQueue:labelFormat:", queue, CFSTR("%@; Client: %@"),
          v11,
          self->_queue_currentClientIdentifier);

  objc_initWeak(&from, v12);
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __68___PXAppleMusicPlayerController_prepareToPlayWithCompletionHandler___block_invoke;
  v23[3] = &unk_1E5133B90;
  objc_copyWeak(&v24, &location);
  objc_copyWeak(&v25, &from);
  -[PXExpectation performWhenFulfilled:timeout:](v12, "performWhenFulfilled:timeout:", v23, 30.0);
  v14 = (void *)objc_msgSend(v5, "copy");
  queue_preparationCompletionHandler = self->_queue_preparationCompletionHandler;
  self->_queue_preparationCompletionHandler = v14;

  objc_storeStrong((id *)&self->_queue_preparationExpectation, v12);
  PLAudioPlaybackGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = self;
    _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ will prepare to play", buf, 0xCu);
  }

  aBlock[0] = v13;
  aBlock[1] = 3221225472;
  aBlock[2] = __68___PXAppleMusicPlayerController_prepareToPlayWithCompletionHandler___block_invoke_34;
  aBlock[3] = &unk_1E5133BB8;
  objc_copyWeak(&v21, &location);
  objc_copyWeak(&v22, &from);
  v17 = _Block_copy(aBlock);
  v18 = objc_opt_respondsToSelector();
  queue_player = self->_queue_player;
  if ((v18 & 1) != 0)
    -[MPMusicPlayerApplicationController prepareToPlayWithCompletionHandler:timeout:](queue_player, "prepareToPlayWithCompletionHandler:timeout:", v17, 30.0);
  else
    -[MPMusicPlayerApplicationController prepareToPlayWithCompletionHandler:](queue_player, "prepareToPlayWithCompletionHandler:", v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

- (void)pause
{
  NSObject *v3;
  MPMusicPlayerApplicationController *queue_player;
  int v5;
  _PXAppleMusicPlayerController *v6;
  __int16 v7;
  MPMusicPlayerApplicationController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  PLAudioPlaybackGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    queue_player = self->_queue_player;
    v5 = 138543618;
    v6 = self;
    v7 = 2112;
    v8 = queue_player;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ sending pause command to %@.", (uint8_t *)&v5, 0x16u);
  }

  -[MPMusicPlayerApplicationController pause](self->_queue_player, "pause");
}

- (void)play
{
  NSObject *v3;
  MPMusicPlayerApplicationController *queue_player;
  int v5;
  _PXAppleMusicPlayerController *v6;
  __int16 v7;
  MPMusicPlayerApplicationController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  PLAudioPlaybackGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    queue_player = self->_queue_player;
    v5 = 138543618;
    v6 = self;
    v7 = 2112;
    v8 = queue_player;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ sending play command to %@.", (uint8_t *)&v5, 0x16u);
  }

  -[MPMusicPlayerApplicationController play](self->_queue_player, "play");
}

- (void)setVolume:(double)a3
{
  float v6;
  _QWORD v7[6];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = a3;
  self->_queue_volume = v6;
  if (self->_playerRespondsToRelativeVolume)
  {
    -[MPMusicPlayerApplicationController setRelativeVolume:](self->_queue_player, "setRelativeVolume:");
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43___PXAppleMusicPlayerController_setVolume___block_invoke;
    v7[3] = &unk_1E5144EB8;
    v7[4] = self;
    v7[5] = a2;
    if (setVolume__onceToken != -1)
      dispatch_once(&setVolume__onceToken, v7);
  }
}

- (void)_queue_handlePreparationExpectationFulfilled:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  _PXAppleMusicPlayerController *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (self->_queue_preparationExpectation == a3 && !a4)
  {
    PLAudioPlaybackGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "%{public}@ timed out preparing to play. Error: %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXAppleMusicPlayerControllerErrorDomain"), 2, v8, CFSTR("Apple Music playback preparation timed out after %fs."), 0x403E000000000000);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXAppleMusicPlayerController _queue_callPreparationCompletionHandler:error:](self, "_queue_callPreparationCompletionHandler:error:", 0, v10);

  }
}

- (void)_handleDidPrepareToPlayWithExpectation:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78___PXAppleMusicPlayerController__handleDidPrepareToPlayWithExpectation_error___block_invoke;
  v11[3] = &unk_1E5147B18;
  v12 = v6;
  v9 = v6;
  objc_copyWeak(&v14, &location);
  v13 = v7;
  v10 = v7;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_queue_handleDidPrepareToPlayWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  _PXAppleMusicPlayerController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "px_isDomain:code:", *MEMORY[0x1E0CC21C0], 2))
  {

LABEL_7:
    PLAudioPlaybackGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = self;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully finished preparing to play.", (uint8_t *)&v8, 0xCu);
    }
    v4 = 0;
    v5 = 0;
    v7 = 1;
    goto LABEL_10;
  }
  if (!v4)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXAppleMusicPlayerControllerErrorDomain"), 4, v4, CFSTR("Encountered a MediaPlayer error when preparing to play Apple Music."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLAudioPlaybackGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "%{public}@ encountered an error while preparing to play: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  v7 = 0;
LABEL_10:

  -[_PXAppleMusicPlayerController _queue_callPreparationCompletionHandler:error:](self, "_queue_callPreparationCompletionHandler:error:", v7, v5);
}

- (void)_queue_setCurrentClientIdentifier:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *queue_currentClientIdentifier;
  NSObject *v11;
  NSString *v12;
  int v13;
  _PXAppleMusicPlayerController *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  v5 = self->_queue_currentClientIdentifier;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v4, "isEqualToString:", v5);

    if (!v7)
    {
      v8 = self->_queue_currentClientIdentifier;
      v9 = (NSString *)-[NSString copy](v4, "copy");
      queue_currentClientIdentifier = self->_queue_currentClientIdentifier;
      self->_queue_currentClientIdentifier = v9;

      PLAudioPlaybackGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_queue_currentClientIdentifier;
        v13 = 138543874;
        v14 = self;
        v15 = 2114;
        v16 = v8;
        v17 = 2114;
        v18 = v12;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Did change current client identifier %{public}@ => %{public}@", (uint8_t *)&v13, 0x20u);
      }

    }
  }

}

- (void)_queue_setWindowSceneID:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *queue_windowSceneID;
  NSObject *v11;
  NSString *v12;
  int v13;
  _PXAppleMusicPlayerController *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  v5 = self->_queue_windowSceneID;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v4, "isEqualToString:", v5);

    if (!v7)
    {
      v8 = self->_queue_currentClientIdentifier;
      v9 = (NSString *)-[NSString copy](v4, "copy");
      queue_windowSceneID = self->_queue_windowSceneID;
      self->_queue_windowSceneID = v9;

      PLAudioPlaybackGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_queue_windowSceneID;
        v13 = 138543874;
        v14 = self;
        v15 = 2114;
        v16 = v8;
        v17 = 2114;
        v18 = v12;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Did change audio scene ID %{public}@ => %{public}@", (uint8_t *)&v13, 0x20u);
      }

    }
  }

}

- (void)_queue_callPreparationCompletionHandler:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int64_t preparationSignpostID;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**queue_preparationCompletionHandler)(id, _BOOL8, id);
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v4 = a3;
  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D09910];
  preparationSignpostID = self->_preparationSignpostID;
  v9 = *MEMORY[0x1E0D09708];
  v21 = *MEMORY[0x1E0D09850];
  v22[0] = CFSTR("com.apple.photos.CPAnalytics.appleMusicPreparedToPlay");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endSignpost:forEventName:withPayload:", preparationSignpostID, v9, v10);

  v11 = (void *)MEMORY[0x1E0D09910];
  if (v4)
    v12 = CFSTR("com.apple.photos.CPAnalytics.appleMusicPreparationSucceeded");
  else
    v12 = CFSTR("com.apple.photos.CPAnalytics.appleMusicPreparationFailed");
  v19 = *MEMORY[0x1E0D09830];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "px_dictionaryBySettingObject:forKey:", v6, *MEMORY[0x1E0D09838]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:withPayload:", v12, v16);

  queue_preparationCompletionHandler = (void (**)(id, _BOOL8, id))self->_queue_preparationCompletionHandler;
  if (queue_preparationCompletionHandler)
  {
    queue_preparationCompletionHandler[2](queue_preparationCompletionHandler, v4, v6);
    v18 = self->_queue_preparationCompletionHandler;
    self->_queue_preparationCompletionHandler = 0;

  }
}

- (void)setPlaybackState:(int64_t)a3
{
  _QWORD v3[6];

  if (self->_playbackState != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __50___PXAppleMusicPlayerController_setPlaybackState___block_invoke;
    v3[3] = &unk_1E5144FE8;
    v3[4] = self;
    v3[5] = a3;
    -[_PXAppleMusicPlayerController performChanges:](self, "performChanges:", v3);
  }
}

- (void)setIsAtEnd:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  _PXAppleMusicPlayerController *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_isAtEnd != a3)
  {
    v3 = a3;
    PLAudioPlaybackGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("No");
      if (v3)
        v6 = CFSTR("Yes");
      *(_DWORD *)buf = 138543618;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Did change IsAtEnd: %@", buf, 0x16u);
    }

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44___PXAppleMusicPlayerController_setIsAtEnd___block_invoke;
    v7[3] = &unk_1E5142B28;
    v7[4] = self;
    v8 = v3;
    -[_PXAppleMusicPlayerController performChanges:](self, "performChanges:", v7);
  }
}

- (void)_handlePlaybackStateDidChange
{
  NSObject *queue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62___PXAppleMusicPlayerController__handlePlaybackStateDidChange__block_invoke;
  block[3] = &unk_1E5147280;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_handleItemPlaybackDidEnd
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58___PXAppleMusicPlayerController__handleItemPlaybackDidEnd__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (BOOL)isAtEnd
{
  return self->_isAtEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_playbackDidEndObserver, 0);
  objc_storeStrong(&self->_playbackStateChangeObserver, 0);
  objc_storeStrong((id *)&self->_queue_preparationExpectation, 0);
  objc_storeStrong(&self->_queue_preparationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_queue_player, 0);
  objc_storeStrong((id *)&self->_queue_windowSceneID, 0);
  objc_storeStrong((id *)&self->_queue_currentClientIdentifier, 0);
  objc_storeStrong((id *)&self->_queue_itemStoreID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (BOOL)canApplyWorkaroundFor80278485
{
  if (canApplyWorkaroundFor80278485_onceToken != -1)
    dispatch_once(&canApplyWorkaroundFor80278485_onceToken, &__block_literal_global_190074);
  return canApplyWorkaroundFor80278485_canApply;
}

@end
