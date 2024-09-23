@implementation ISPlayerItem

- (ISPlayerItem)init
{
  return -[ISPlayerItem initWithAsset:targetSize:](self, "initWithAsset:targetSize:", 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[ISPlayerItemChef defaultChef](ISPlayerItemChef, "defaultChef");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPreparationOfIrisAssetWithRequestID:", -[ISPlayerItem _videoPlayerItemRequestID](self, "_videoPlayerItemRequestID"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)ISPlayerItem;
  -[ISPlayerItem dealloc](&v5, sel_dealloc);
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISPlayerItem;
  -[ISObservable didPerformChanges](&v3, sel_didPerformChanges);
  -[ISPlayerItem _updateIfNeeded](self, "_updateIfNeeded");
}

- (ISPlayerItem)initWithAsset:(id)a3 targetSize:(CGSize)a4
{
  return -[ISPlayerItem initWithAsset:targetSize:contentAspectRatio:](self, "initWithAsset:targetSize:contentAspectRatio:", a3, 0, a4.width, a4.height);
}

- (ISPlayerItem)initWithAsset:(id)a3 targetSize:(CGSize)a4 contentAspectRatio:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  dispatch_queue_t v18;
  void *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  void *v22;
  ISPlayerContent *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  ISPlayerContent *v27;
  void *v28;
  ISPlayerContent *v29;
  void *v30;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  _QWORD v35[3];
  objc_super v36;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)ISPlayerItem;
  v12 = -[ISObservable init](&v36, sel_init);
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    do
      v14 = __ldaxr((unsigned int *)&initWithAsset_targetSize_contentAspectRatio__ivarQueueCounter);
    while (__stlxr(v14 + 1, (unsigned int *)&initWithAsset_targetSize_contentAspectRatio__ivarQueueCounter));
    *((_QWORD *)v12 + 11) = objc_msgSend(v13, "numberWithInt:");
    v15 = (void *)MEMORY[0x1E0CB37E8];
    do
      v16 = __ldaxr(&initWithAsset_targetSize_contentAspectRatio__workQueueCounter);
    while (__stlxr(v16 + 1, &initWithAsset_targetSize_contentAspectRatio__workQueueCounter));
    *((_QWORD *)v12 + 12) = objc_msgSend(v15, "numberWithInt:");
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.ISPlayerItem.state", v17);
    v19 = (void *)*((_QWORD *)v12 + 13);
    *((_QWORD *)v12 + 13) = v18;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v12 + 13), (const void *)QueueIdentifierContext, *((void **)v12 + 11), 0);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.ISPlayerItem.work", v20);
    v22 = (void *)*((_QWORD *)v12 + 14);
    *((_QWORD *)v12 + 14) = v21;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v12 + 14), (const void *)QueueIdentifierContext, *((void **)v12 + 12), 0);
    objc_storeStrong((id *)v12 + 34, a3);
    *((CGFloat *)v12 + 36) = width;
    *((CGFloat *)v12 + 37) = height;
    *((_QWORD *)v12 + 26) = 0;
    objc_storeStrong((id *)v12 + 35, a5);
    v23 = [ISPlayerContent alloc];
    v24 = objc_msgSend(v10, "photo");
    v25 = objc_msgSend(v10, "photoEXIFOrientation");
    if (v10)
      objc_msgSend(v10, "photoCMTime");
    else
      memset(v35, 0, sizeof(v35));
    v26 = objc_msgSend(v10, "hasColorAdjustments");
    v33 = *MEMORY[0x1E0CA2E18];
    v34 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    LOBYTE(v32) = 0;
    v27 = -[ISPlayerContent initWithPhoto:photoIsOriginal:photoEXIFOrientation:photoTime:videoDuration:photoHasColorAdjustments:videoPlayerItem:variationIdentifier:supportsVitality:](v23, "initWithPhoto:photoIsOriginal:photoEXIFOrientation:photoTime:videoDuration:photoHasColorAdjustments:videoPlayerItem:variationIdentifier:supportsVitality:", v24, 1, v25, v35, &v33, v26, 0, 0, v32);
    v28 = (void *)*((_QWORD *)v12 + 25);
    *((_QWORD *)v12 + 25) = v27;
    v29 = v27;

    *((_BYTE *)v12 + 146) = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v12, sel__dimFlashingLightsDidChangeValue_, *MEMORY[0x1E0CC1CA8], 0);

    objc_msgSend(v12, "_updateIfNeeded");
  }

  return (ISPlayerItem *)v12;
}

- (void)performChanges:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__ISPlayerItem_performChanges___block_invoke;
  v6[3] = &unk_1E9453918;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ISPlayerItem _performWork:sync:](self, "_performWork:sync:", v6, 0);

}

- (int64_t)loadingTarget
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
  v4[2] = __29__ISPlayerItem_loadingTarget__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setLoadingTarget:(int64_t)a3
{
  int64_t v5;
  _QWORD v6[7];

  v5 = -[ISPlayerItem loadingTarget](self, "loadingTarget");
  if (v5 != a3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__ISPlayerItem_setLoadingTarget___block_invoke;
    v6[3] = &unk_1E9453940;
    v6[4] = self;
    v6[5] = a3;
    v6[6] = v5;
    -[ISPlayerItem performChanges:](self, "performChanges:", v6);
  }
}

- (AVVideoComposition)videoComposition
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
  v8 = __Block_byref_object_copy__1807;
  v9 = __Block_byref_object_dispose__1808;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__ISPlayerItem_videoComposition__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (AVVideoComposition *)v2;
}

- (void)setVideoComposition:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[ISPlayerItem videoComposition](self, "videoComposition");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__ISPlayerItem_setVideoComposition___block_invoke;
    v6[3] = &unk_1E9454180;
    v6[4] = self;
    v7 = v4;
    -[ISPlayerItem performChanges:](self, "performChanges:", v6);

  }
}

- (void)_cancelLoading
{
  id v3;

  +[ISPlayerItemChef defaultChef](ISPlayerItemChef, "defaultChef");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPreparationOfIrisAssetWithRequestID:", -[ISPlayerItem _videoPlayerItemRequestID](self, "_videoPlayerItemRequestID"));

}

- (int64_t)_videoPlayerItemRequestID
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
  v4[2] = __41__ISPlayerItem__videoPlayerItemRequestID__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_setVideoPlayerItemRequestID:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__ISPlayerItem__setVideoPlayerItemRequestID___block_invoke;
  v3[3] = &unk_1E94541A8;
  v3[4] = self;
  v3[5] = a3;
  -[ISPlayerItem _performIvarWrite:](self, "_performIvarWrite:", v3);
}

- (void)discardContentBelowLoadingTarget
{
  -[ISPlayerItem _performWork:sync:](self, "_performWork:sync:", &__block_literal_global_1825, 0);
}

- (void)cancelLoading
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __29__ISPlayerItem_cancelLoading__block_invoke;
  v2[3] = &unk_1E94539A8;
  v2[4] = self;
  -[ISPlayerItem _performWork:sync:](self, "_performWork:sync:", v2, 0);
}

- (void)resetAVObjects
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[6];
  _QWORD v6[5];
  id v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__1807;
  v6[4] = __Block_byref_object_dispose__1808;
  v7 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__ISPlayerItem_resetAVObjects__block_invoke;
  v5[3] = &unk_1E9454248;
  v5[4] = self;
  v5[5] = v6;
  -[ISPlayerItem _performIvarWrite:](self, "_performIvarWrite:", v5);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __30__ISPlayerItem_resetAVObjects__block_invoke_2;
  v4[3] = &unk_1E94539A8;
  v4[4] = self;
  -[ISPlayerItem _performWork:sync:](self, "_performWork:sync:", v4, 0);
  _Block_object_dispose(v6, 8);

}

- (void)_reloadAllContent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__ISPlayerItem__reloadAllContent__block_invoke;
  v2[3] = &unk_1E94539A8;
  v2[4] = self;
  -[ISPlayerItem _performWork:](self, "_performWork:", v2);
}

- (void)setAggressivelyCacheVideoFrames:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (-[ISPlayerItem aggressivelyCacheVideoFrames](self, "aggressivelyCacheVideoFrames") != a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__ISPlayerItem_setAggressivelyCacheVideoFrames___block_invoke;
    v5[3] = &unk_1E9454270;
    v5[4] = self;
    v6 = a3;
    -[ISPlayerItem _performIvarWrite:](self, "_performIvarWrite:", v5);
  }
}

- (BOOL)aggressivelyCacheVideoFrames
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
  v4[2] = __44__ISPlayerItem_aggressivelyCacheVideoFrames__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setReversesMoreVideoFramesInMemory:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (-[ISPlayerItem reversesMoreVideoFramesInMemory](self, "reversesMoreVideoFramesInMemory") != a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__ISPlayerItem_setReversesMoreVideoFramesInMemory___block_invoke;
    v5[3] = &unk_1E9454270;
    v5[4] = self;
    v6 = a3;
    -[ISPlayerItem _performIvarWrite:](self, "_performIvarWrite:", v5);
  }
}

- (BOOL)reversesMoreVideoFramesInMemory
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
  v4[2] = __47__ISPlayerItem_reversesMoreVideoFramesInMemory__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setDecodesAllFramesDuringOrdinaryPlayback:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (-[ISPlayerItem decodesAllFramesDuringOrdinaryPlayback](self, "decodesAllFramesDuringOrdinaryPlayback") != a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__ISPlayerItem_setDecodesAllFramesDuringOrdinaryPlayback___block_invoke;
    v5[3] = &unk_1E9454270;
    v5[4] = self;
    v6 = a3;
    -[ISPlayerItem _performIvarWrite:](self, "_performIvarWrite:", v5);
  }
}

- (BOOL)decodesAllFramesDuringOrdinaryPlayback
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
  v4[2] = __54__ISPlayerItem_decodesAllFramesDuringOrdinaryPlayback__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_setError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[ISPlayerItem error](self, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __26__ISPlayerItem__setError___block_invoke;
    v6[3] = &unk_1E9454180;
    v6[4] = self;
    v7 = v4;
    -[ISPlayerItem performChanges:](self, "performChanges:", v6);

  }
}

- (NSError)error
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
  v8 = __Block_byref_object_copy__1807;
  v9 = __Block_byref_object_dispose__1808;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __21__ISPlayerItem_error__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSError *)v2;
}

- (void)_setPlayerContent:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[ISPlayerItem playerContent](self, "playerContent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4 && (objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__ISPlayerItem__setPlayerContent___block_invoke;
    v6[3] = &unk_1E9454180;
    v6[4] = self;
    v7 = v4;
    -[ISPlayerItem performChanges:](self, "performChanges:", v6);

  }
}

- (void)_setStatus:(int64_t)a3
{
  _QWORD v5[6];

  if (-[ISPlayerItem status](self, "status") != a3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __27__ISPlayerItem__setStatus___block_invoke;
    v5[3] = &unk_1E94541D0;
    v5[4] = self;
    v5[5] = a3;
    -[ISPlayerItem performChanges:](self, "performChanges:", v5);
  }
}

- (ISPlayerContent)playerContent
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
  v8 = __Block_byref_object_copy__1807;
  v9 = __Block_byref_object_dispose__1808;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__ISPlayerItem_playerContent__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ISPlayerContent *)v2;
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
  v4[2] = __22__ISPlayerItem_status__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_updateIfNeeded
{
  -[ISPlayerItem _performWork:](self, "_performWork:", &__block_literal_global_21);
}

- (BOOL)_needsUpdate
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
  v4[2] = __28__ISPlayerItem__needsUpdate__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_invalidateMinimumClientVersion
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__ISPlayerItem__invalidateMinimumClientVersion__block_invoke;
  v2[3] = &unk_1E94539A8;
  v2[4] = self;
  -[ISPlayerItem _performWork:](self, "_performWork:", v2);
}

- (BOOL)_isMinimumClientVersionValid
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
  v4[2] = __44__ISPlayerItem__isMinimumClientVersionValid__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_updateMinimumClientVersionIfNeeded
{
  _QWORD v3[5];

  if (!-[ISPlayerItem _isMinimumClientVersionValid](self, "_isMinimumClientVersionValid"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __51__ISPlayerItem__updateMinimumClientVersionIfNeeded__block_invoke;
    v3[3] = &unk_1E9453F48;
    v3[4] = self;
    -[ISPlayerItem _performIvarWrite:](self, "_performIvarWrite:", v3);
    -[ISPlayerItem _performWork:sync:](self, "_performWork:sync:", &__block_literal_global_22, 0);
  }
}

- (void)_setMinimumClientVersion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  ISPlayerItem *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ISPlayerItem _minimumClientVersion](self, "_minimumClientVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __41__ISPlayerItem__setMinimumClientVersion___block_invoke;
    v15 = &unk_1E9454130;
    v16 = self;
    v7 = v4;
    v17 = v7;
    -[ISPlayerItem _performIvarWrite:](self, "_performIvarWrite:", &v12);
    if (objc_msgSend(v7, "integerValue") >= 1)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The current client version of PhotosPlayer is %d, but the media in %@ requires version >= %@"), 0, self->_asset, v7, v12, v13, v14, v15, v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photosplayer"), 104, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[ISPlayerItem _setError:](self, "_setError:", v11);
    }

  }
}

- (NSString)_minimumClientVersion
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
  v8 = __Block_byref_object_copy__1807;
  v9 = __Block_byref_object_dispose__1808;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__ISPlayerItem__minimumClientVersion__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)_invalidatePlaybackStyleIdentifier
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__ISPlayerItem__invalidatePlaybackStyleIdentifier__block_invoke;
  v2[3] = &unk_1E94539A8;
  v2[4] = self;
  -[ISPlayerItem _performWork:](self, "_performWork:", v2);
}

- (BOOL)_isPlaybackStyleIdentifierValid
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
  v4[2] = __47__ISPlayerItem__isPlaybackStyleIdentifierValid__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_updatePlaybackStyleIdentifierIfNeeded
{
  _QWORD v3[5];

  if (!-[ISPlayerItem _isPlaybackStyleIdentifierValid](self, "_isPlaybackStyleIdentifierValid"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __54__ISPlayerItem__updatePlaybackStyleIdentifierIfNeeded__block_invoke;
    v3[3] = &unk_1E9453F48;
    v3[4] = self;
    -[ISPlayerItem _performIvarWrite:](self, "_performIvarWrite:", v3);
    -[ISPlayerItem _performWork:sync:](self, "_performWork:sync:", &__block_literal_global_29, 0);
  }
}

- (void)_setVariationIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__ISPlayerItem__setVariationIdentifier___block_invoke;
  v6[3] = &unk_1E9454180;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ISPlayerItem performChanges:](self, "performChanges:", v6);

}

- (NSNumber)_variationIdentifier
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
  v8 = __Block_byref_object_copy__1807;
  v9 = __Block_byref_object_dispose__1808;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__ISPlayerItem__variationIdentifier__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (BOOL)_isContentSupportsVitalityValid
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
  v4[2] = __47__ISPlayerItem__isContentSupportsVitalityValid__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_invalidateContentSupportsVitality
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__ISPlayerItem__invalidateContentSupportsVitality__block_invoke;
  v2[3] = &unk_1E94539A8;
  v2[4] = self;
  -[ISPlayerItem _performWork:](self, "_performWork:", v2);
}

- (void)_updateContentSupportsVitalityIfNeeded
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];

  if (!-[ISPlayerItem _isContentSupportsVitalityValid](self, "_isContentSupportsVitalityValid"))
  {
    v3 = MEMORY[0x1E0C809B0];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__ISPlayerItem__updateContentSupportsVitalityIfNeeded__block_invoke;
    v5[3] = &unk_1E9453F48;
    v5[4] = self;
    -[ISPlayerItem _performIvarWrite:](self, "_performIvarWrite:", v5);
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __54__ISPlayerItem__updateContentSupportsVitalityIfNeeded__block_invoke_2;
    v4[3] = &unk_1E94539A8;
    v4[4] = self;
    -[ISPlayerItem _performWork:sync:](self, "_performWork:sync:", v4, 0);
  }
}

- (void)setContentSupportsVitality:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__ISPlayerItem_setContentSupportsVitality___block_invoke;
  v3[3] = &unk_1E9453A58;
  v3[4] = self;
  v4 = a3;
  -[ISPlayerItem performChanges:](self, "performChanges:", v3);
}

- (BOOL)contentSupportsVitality
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
  v4[2] = __39__ISPlayerItem_contentSupportsVitality__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_invalidateVideoPlayerItem
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__ISPlayerItem__invalidateVideoPlayerItem__block_invoke;
  v2[3] = &unk_1E94539A8;
  v2[4] = self;
  -[ISPlayerItem _performWork:](self, "_performWork:", v2);
}

- (BOOL)_isVideoPlayerItemValid
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
  v4[2] = __39__ISPlayerItem__isVideoPlayerItemValid__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_updateVideoPlayerItemIfNeeded
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];

  if (!-[ISPlayerItem _isVideoPlayerItemValid](self, "_isVideoPlayerItemValid"))
  {
    v3 = MEMORY[0x1E0C809B0];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__ISPlayerItem__updateVideoPlayerItemIfNeeded__block_invoke;
    v5[3] = &unk_1E9453F48;
    v5[4] = self;
    -[ISPlayerItem _performIvarWrite:](self, "_performIvarWrite:", v5);
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __46__ISPlayerItem__updateVideoPlayerItemIfNeeded__block_invoke_2;
    v4[3] = &unk_1E94539A8;
    v4[4] = self;
    -[ISPlayerItem _performWork:](self, "_performWork:", v4);
  }
}

- (void)_handleVideoPlayerItemLoadResultWithSuccess:(BOOL)a3 playerItem:(id)a4 videoDuration:(id *)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;
  BOOL v18;

  v10 = a4;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__ISPlayerItem__handleVideoPlayerItemLoadResultWithSuccess_playerItem_videoDuration_error___block_invoke;
  v14[3] = &unk_1E9453AA8;
  v18 = a3;
  v17 = *a5;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[ISPlayerItem _performWork:](self, "_performWork:", v14);

}

- (void)_setVideoPlayerItem:(id)a3 videoDuration:(id *)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  __int128 v10;
  int64_t var3;

  v6 = a3;
  -[ISPlayerItem _videoPlayerItem](self, "_videoPlayerItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__ISPlayerItem__setVideoPlayerItem_videoDuration___block_invoke;
    v8[3] = &unk_1E9453AF8;
    v8[4] = self;
    v9 = v6;
    v10 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[ISPlayerItem performChanges:](self, "performChanges:", v8);

  }
}

- (id)_videoPlayerItem
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
  v8 = __Block_byref_object_copy__1807;
  v9 = __Block_byref_object_dispose__1808;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__ISPlayerItem__videoPlayerItem__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)_blendsVideoFramesForVideoPlayerItem:(id)a3
{
  void *v3;
  int v4;

  if ((objc_msgSend(a3, "is_isHighFramerate") & 1) != 0)
    return 0;
  +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowFrameBlending");

  return v4 && !MADimFlashingLightsEnabled();
}

- (void)_dimFlashingLightsDidChangeValue:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__ISPlayerItem__dimFlashingLightsDidChangeValue___block_invoke;
  v3[3] = &unk_1E9454220;
  v3[4] = self;
  -[ISPlayerItem performChanges:](self, "performChanges:", v3);
}

- (void)_invalidatePlayerContent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__ISPlayerItem__invalidatePlayerContent__block_invoke;
  v2[3] = &unk_1E9453F48;
  v2[4] = self;
  -[ISPlayerItem _performIvarWrite:](self, "_performIvarWrite:", v2);
}

- (BOOL)_isPlayerContentValid
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
  v4[2] = __37__ISPlayerItem__isPlayerContentValid__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_updatePlayerContentIfNeeded
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__ISPlayerItem__updatePlayerContentIfNeeded__block_invoke;
  v2[3] = &unk_1E94539A8;
  v2[4] = self;
  -[ISPlayerItem _performWork:](self, "_performWork:", v2);
}

- (void)_invalidateStatus
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__ISPlayerItem__invalidateStatus__block_invoke;
  v2[3] = &unk_1E9453F48;
  v2[4] = self;
  -[ISPlayerItem _performIvarWrite:](self, "_performIvarWrite:", v2);
}

- (BOOL)_isStatusVaild
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
  v4[2] = __30__ISPlayerItem__isStatusVaild__block_invoke;
  v4[3] = &unk_1E9454248;
  v4[4] = self;
  v4[5] = &v5;
  -[ISPlayerItem _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_updateStatusIfNeeded
{
  _QWORD v3[5];

  if (!-[ISPlayerItem _isStatusVaild](self, "_isStatusVaild"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __37__ISPlayerItem__updateStatusIfNeeded__block_invoke;
    v3[3] = &unk_1E94539A8;
    v3[4] = self;
    -[ISPlayerItem _performWork:](self, "_performWork:", v3);
  }
}

- (void)_performWork:(id)a3 sync:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(id, ISPlayerItem *);
  NSObject *v7;
  NSObject *workQueue;
  _QWORD block[4];
  void (**v10)(id, ISPlayerItem *);
  id v11;
  id location;
  _QWORD v13[5];
  void (**v14)(id, ISPlayerItem *);

  v4 = a4;
  v6 = (void (**)(id, ISPlayerItem *))a3;
  if (v4)
  {
    if (-[ISPlayerItem _isOnWorkQueue](self, "_isOnWorkQueue"))
    {
      v6[2](v6, self);
    }
    else
    {
      workQueue = self->_workQueue;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __34__ISPlayerItem__performWork_sync___block_invoke;
      v13[3] = &unk_1E9453B48;
      v13[4] = self;
      v14 = v6;
      dispatch_sync(workQueue, v13);

    }
  }
  else
  {
    objc_initWeak(&location, self);
    v7 = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__ISPlayerItem__performWork_sync___block_invoke_2;
    block[3] = &unk_1E9453F20;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (void)_performWork:(id)a3
{
  -[ISPlayerItem _performWork:sync:](self, "_performWork:sync:", a3, 1);
}

- (void)_performIvarRead:(id)a3
{
  id v4;
  BOOL v5;
  dispatch_block_t block;

  v4 = a3;
  block = v4;
  if (self->_ivarQueue && (v5 = -[ISPlayerItem _isOnIvarQueue](self, "_isOnIvarQueue"), v4 = block, !v5))
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
  return dispatch_get_specific((const void *)QueueIdentifierContext) == self->_ivarQueueIdentifier;
}

- (BOOL)_isOnWorkQueue
{
  return dispatch_get_specific((const void *)QueueIdentifierContext) == self->_workQueueIdentifier;
}

- (ISAsset)asset
{
  return self->_asset;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSNumber)contentAspectRatio
{
  return self->_contentAspectRatio;
}

- (BOOL)_isLoadingCancelled
{
  return self->__loadingCancelled;
}

- (void)_setLoadingCancelled:(BOOL)a3
{
  self->__loadingCancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAspectRatio, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_workQueue_imageGenerator, 0);
  objc_storeStrong((id *)&self->_ivarQueue_error, 0);
  objc_storeStrong((id *)&self->_ivarQueue_minimumClientVersion, 0);
  objc_storeStrong((id *)&self->_ivarQueue_variationIdentifier, 0);
  objc_storeStrong((id *)&self->_ivarQueue_videoPlayerItem, 0);
  objc_storeStrong((id *)&self->_ivarQueue_playerContent, 0);
  objc_storeStrong((id *)&self->_ivarQueue_videoComposition, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
}

uint64_t __34__ISPlayerItem__performWork_sync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __34__ISPlayerItem__performWork_sync___block_invoke_2(uint64_t a1)
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

void __37__ISPlayerItem__updateStatusIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__ISPlayerItem__updateStatusIfNeeded__block_invoke_2;
  v8[3] = &unk_1E9453F48;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "_performIvarWrite:", v8);
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "playerContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPlayerItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v5 = 3;
    else
      v5 = 0;

  }
  objc_msgSend(v3, "_setStatus:", v5);

}

uint64_t __37__ISPlayerItem__updateStatusIfNeeded__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 249) = 1;
  return result;
}

uint64_t __30__ISPlayerItem__isStatusVaild__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 249);
  return result;
}

uint64_t __33__ISPlayerItem__invalidateStatus__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 249) = 0;
  return result;
}

void __44__ISPlayerItem__updatePlayerContentIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  ISPlayerContent *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  ISPlayerContent *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  _QWORD v22[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  __int128 v39;
  uint64_t v40;
  _QWORD v41[5];

  v3 = a2;
  if ((objc_msgSend(v3, "_isPlayerContentValid") & 1) == 0)
  {
    v4 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __44__ISPlayerItem__updatePlayerContentIfNeeded__block_invoke_2;
    v41[3] = &unk_1E9453F48;
    v41[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "_performIvarWrite:", v41);
    objc_msgSend(v3, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v39 = 0uLL;
    v40 = 0;
    if (v5)
      objc_msgSend(v5, "photoCMTime");
    v7 = objc_msgSend(v6, "photo");
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__1807;
    v37 = __Block_byref_object_dispose__1808;
    v38 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__1807;
    v27 = __Block_byref_object_dispose__1808;
    v28 = 0;
    v22[0] = v4;
    v22[1] = 3221225472;
    v22[2] = __44__ISPlayerItem__updatePlayerContentIfNeeded__block_invoke_3;
    v22[3] = &unk_1E9453B20;
    v22[4] = *(_QWORD *)(a1 + 32);
    v22[5] = &v33;
    v22[6] = &v29;
    v22[7] = &v23;
    objc_msgSend(v3, "_performIvarRead:", v22);
    v8 = objc_msgSend(v6, "photoEXIFOrientation");
    v9 = objc_msgSend(v6, "hasColorAdjustments");
    v10 = [ISPlayerContent alloc];
    v11 = *(_QWORD *)(a1 + 32) + 172;
    v12 = v34[5];
    v13 = v24[5];
    v14 = *((_BYTE *)v30 + 24);
    v20 = v39;
    v21 = v40;
    v15 = *(_OWORD *)v11;
    v19 = *(_QWORD *)(v11 + 16);
    v18 = v15;
    LOBYTE(v17) = v14;
    v16 = -[ISPlayerContent initWithPhoto:photoIsOriginal:photoEXIFOrientation:photoTime:videoDuration:photoHasColorAdjustments:videoPlayerItem:variationIdentifier:supportsVitality:](v10, "initWithPhoto:photoIsOriginal:photoEXIFOrientation:photoTime:videoDuration:photoHasColorAdjustments:videoPlayerItem:variationIdentifier:supportsVitality:", v7, 1, v8, &v20, &v18, v9, v12, v13, v17);
    objc_msgSend(v3, "_setPlayerContent:", v16);

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v33, 8);

  }
}

uint64_t __44__ISPlayerItem__updatePlayerContentIfNeeded__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 250) = 1;
  return result;
}

void __44__ISPlayerItem__updatePlayerContentIfNeeded__block_invoke_3(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 216));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 147);
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 224));
}

uint64_t __37__ISPlayerItem__isPlayerContentValid__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 250);
  return result;
}

uint64_t __40__ISPlayerItem__invalidatePlayerContent__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 250) = 0;
  return result;
}

uint64_t __49__ISPlayerItem__dimFlashingLightsDidChangeValue___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__ISPlayerItem__dimFlashingLightsDidChangeValue___block_invoke_2;
  v3[3] = &unk_1E9453F48;
  v3[4] = v1;
  return objc_msgSend(v1, "_performIvarWrite:", v3);
}

uint64_t __49__ISPlayerItem__dimFlashingLightsDidChangeValue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setBlendsVideoFrames:", objc_msgSend(*(id *)(a1 + 32), "_blendsVideoFramesForVideoPlayerItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216)));
}

void __32__ISPlayerItem__videoPlayerItem__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 216));
}

void __50__ISPlayerItem__setVideoPlayerItem_videoDuration___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  __int128 v6;
  uint64_t v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__ISPlayerItem__setVideoPlayerItem_videoDuration___block_invoke_2;
  v3[3] = &unk_1E9453AD0;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v4, "_performIvarWrite:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_invalidatePlayerContent");

}

__n128 __50__ISPlayerItem__setVideoPlayerItem_videoDuration___block_invoke_2(uint64_t a1)
{
  void *v2;
  __n128 *v3;
  unint64_t v4;
  __n128 result;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 216), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setAggressivelyCachesVideoFrames:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setReversesMoreVideoFramesInMemory:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 145));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setDecodesAllFramesDuringOrdinaryPlayback:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 146));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setVideoComposition:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 216);
  if (v2)
  {
    objc_msgSend(v2, "duration");
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 216);
  }
  else
  {
    v8 = 0uLL;
    v9 = 0;
  }
  v6 = v8;
  v7 = v9;
  objc_msgSend(v2, "setForwardPlaybackEndTime:", &v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setBlendsVideoFrames:", objc_msgSend(*(id *)(a1 + 32), "_blendsVideoFramesForVideoPlayerItem:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216)));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setSeekingWaitsForVideoCompositionRendering:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "is_enableColorMatching");
  v3 = (__n128 *)(*(_QWORD *)(a1 + 32) + 172);
  v4 = *(_QWORD *)(a1 + 64);
  result = *(__n128 *)(a1 + 48);
  *v3 = result;
  v3[1].n128_u64[0] = v4;
  return result;
}

void __91__ISPlayerItem__handleVideoPlayerItemLoadResultWithSuccess_playerItem_videoDuration_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 72))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v9 = *(_OWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 64);
    v4 = a2;
    objc_msgSend(v4, "_setVideoPlayerItem:videoDuration:", v3, &v9);
  }
  else
  {
    v5 = a2;
    objc_msgSend(v5, "_invalidateVideoPlayerItem");
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v11 = *MEMORY[0x1E0CB3388];
      v12[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photosplayer"), 102, v8);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photosplayer"), 102, 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "_setError:", v4);

  }
}

uint64_t __46__ISPlayerItem__updateVideoPlayerItemIfNeeded__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 248) = 1;
  return result;
}

void __46__ISPlayerItem__updateVideoPlayerItemIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  _OWORD v9[3];
  __int128 v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id location;
  __int128 v15;
  uint64_t v16;

  v3 = a2;
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0uLL;
  v16 = 0;
  if (v4)
    objc_msgSend(v4, "photoCMTime");
  if (v5 && objc_msgSend(*(id *)(a1 + 32), "loadingTarget") >= 1 && objc_msgSend(v3, "status") != 1)
  {
    objc_initWeak(&location, v3);
    +[ISPlayerItemChef defaultChef](ISPlayerItemChef, "defaultChef");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__ISPlayerItem__updateVideoPlayerItemIfNeeded__block_invoke_3;
    v12[3] = &unk_1E9453A80;
    objc_copyWeak(&v13, &location);
    v10 = v15;
    v11 = v16;
    v7 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v9[0] = *MEMORY[0x1E0CA2E40];
    v9[1] = v7;
    v9[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    v8 = objc_msgSend(v6, "prepareIrisVideoWithAsset:photoTime:trimmedTimeRange:completion:", v5, &v10, v9, v12);

    objc_msgSend(v3, "_setVideoPlayerItemRequestID:", v8);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __46__ISPlayerItem__updateVideoPlayerItemIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, __int128 *a4, void *a5)
{
  id *v8;
  id v9;
  id v10;
  id WeakRetained;
  __int128 v12;
  uint64_t v13;

  v8 = (id *)(a1 + 32);
  v9 = a5;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained(v8);
  v12 = *a4;
  v13 = *((_QWORD *)a4 + 2);
  objc_msgSend(WeakRetained, "_handleVideoPlayerItemLoadResultWithSuccess:playerItem:videoDuration:error:", a2, v10, &v12, v9);

}

uint64_t __39__ISPlayerItem__isVideoPlayerItemValid__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 248);
  return result;
}

void __42__ISPlayerItem__invalidateVideoPlayerItem__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__ISPlayerItem__invalidateVideoPlayerItem__block_invoke_2;
  v4[3] = &unk_1E9453F48;
  v4[4] = v2;
  objc_msgSend(v2, "_performIvarWrite:", v4);
  +[ISPlayerItemChef defaultChef](ISPlayerItemChef, "defaultChef");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPreparationOfIrisAssetWithRequestID:", objc_msgSend(*(id *)(a1 + 32), "_videoPlayerItemRequestID"));

}

uint64_t __42__ISPlayerItem__invalidateVideoPlayerItem__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 248) = 0;
  return result;
}

uint64_t __39__ISPlayerItem_contentSupportsVitality__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 147);
  return result;
}

void __43__ISPlayerItem_setContentSupportsVitality___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[6];
  char v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a2;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__ISPlayerItem_setContentSupportsVitality___block_invoke_2;
  v5[3] = &unk_1E9453A30;
  v6 = *(_BYTE *)(a1 + 40);
  v5[4] = v4;
  v5[5] = &v7;
  objc_msgSend(v4, "_performIvarWrite:", v5);
  if (*((_BYTE *)v8 + 24))
    objc_msgSend(*(id *)(a1 + 32), "_invalidatePlayerContent");
  _Block_object_dispose(&v7, 8);

}

uint64_t __43__ISPlayerItem_setContentSupportsVitality___block_invoke_2(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 48);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 147))
  {
    *(_BYTE *)(v2 + 147) = v1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __54__ISPlayerItem__updateContentSupportsVitalityIfNeeded__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 253) = 1;
  return result;
}

void __54__ISPlayerItem__updateContentSupportsVitalityIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  NSObject *v8;
  double v9;
  int v10;
  _BOOL8 v11;
  NSObject *v12;
  void *v13;
  float v14;
  float v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  float v19;
  NSObject *v20;
  uint64_t v21;
  float v22;
  int v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoAsset");
  v5 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  if (v5 != 0.0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithAVAsset:timeZoneLookup:", *(_QWORD *)&v5, 0);
    v7 = v6;
    if (v6)
    {
      if ((objc_msgSend(v6, "hasVitality") & 1) == 0)
      {
        ISGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = *(double *)(a1 + 32);
          v23 = 138412290;
          v24 = v9;
          _os_log_impl(&dword_1D2DCA000, v8, OS_LOG_TYPE_INFO, "Disabling vitality for Live Photo because of PFMetadataIdentifier.quickTimeMetadataLivePhotoVitalityDisabled: %@", (uint8_t *)&v23, 0xCu);
        }
        v10 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      ISGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v23 = 138412290;
        v24 = v5;
        _os_log_error_impl(&dword_1D2DCA000, v12, OS_LOG_TYPE_ERROR, "Unable to read vitality disabled flag from asset: %@.", (uint8_t *)&v23, 0xCu);
      }

    }
    +[ISVitalitySettings sharedInstance](ISVitalitySettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "vitalityTransitionScoreMinimumValueForPlayback");
    v15 = v14;

    if (v15 <= 0.0)
    {
      v10 = 1;
LABEL_24:

      v11 = v10 != 0;
      goto LABEL_25;
    }
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithAVAsset:timeZoneLookup:", *(_QWORD *)&v5, 0);
    v8 = v16;
    if (v16)
    {
      -[NSObject livePhotoVitalityTransitionScore](v16, "livePhotoVitalityTransitionScore");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        -[NSObject floatValue](v17, "floatValue");
        if (v19 < v15)
        {
          ISGetLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            -[NSObject floatValue](v18, "floatValue");
            v21 = *(_QWORD *)(a1 + 32);
            v23 = 134218498;
            v24 = v22;
            v25 = 2048;
            v26 = v15;
            v27 = 2112;
            v28 = v21;
            _os_log_impl(&dword_1D2DCA000, v20, OS_LOG_TYPE_INFO, "Disabling vitality for Live Photo because of PFMetadataIdentifier.quickTimeMetadataVitalityTransitionScore %f < %f: %@", (uint8_t *)&v23, 0x20u);
          }

          v10 = 0;
          goto LABEL_22;
        }
      }
    }
    else
    {
      ISGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v23 = 138412290;
        v24 = v5;
        _os_log_error_impl(&dword_1D2DCA000, v18, OS_LOG_TYPE_ERROR, "Unable to read vitality transition score from asset: %@.", (uint8_t *)&v23, 0xCu);
      }
    }
    v10 = 1;
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  v11 = 1;
LABEL_25:
  objc_msgSend(v3, "setContentSupportsVitality:", v11);

}

uint64_t __50__ISPlayerItem__invalidateContentSupportsVitality__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__ISPlayerItem__invalidateContentSupportsVitality__block_invoke_2;
  v3[3] = &unk_1E9453F48;
  v3[4] = v1;
  return objc_msgSend(v1, "_performIvarWrite:", v3);
}

uint64_t __50__ISPlayerItem__invalidateContentSupportsVitality__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 253) = 0;
  return result;
}

uint64_t __47__ISPlayerItem__isContentSupportsVitalityValid__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 253);
  return result;
}

void __36__ISPlayerItem__variationIdentifier__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 224));
}

void __40__ISPlayerItem__setVariationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__ISPlayerItem__setVariationIdentifier___block_invoke_2;
  v7[3] = &unk_1E9454108;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v4, "_performIvarWrite:", v7);
  if (*((_BYTE *)v12 + 24))
    objc_msgSend(*(id *)(a1 + 32), "_invalidatePlayerContent");

  _Block_object_dispose(&v11, 8);
}

void __40__ISPlayerItem__setVariationIdentifier___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  char v5;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v3 != (void *)v2[28])
  {
    objc_msgSend(v2, "_variationIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 224), *(id *)(a1 + 32));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

uint64_t __54__ISPlayerItem__updatePlaybackStyleIdentifierIfNeeded__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 252) = 1;
  return result;
}

void __54__ISPlayerItem__updatePlaybackStyleIdentifierIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithAVAsset:timeZoneLookup:", v4, 0);
  if (!v5)
  {
    ISGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_error_impl(&dword_1D2DCA000, v6, OS_LOG_TYPE_ERROR, "Unable to read playback style identifier from asset: %@.", (uint8_t *)&v8, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(v5, "playbackVariation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setVariationIdentifier:", v7);

}

uint64_t __47__ISPlayerItem__isPlaybackStyleIdentifierValid__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 252);
  return result;
}

uint64_t __50__ISPlayerItem__invalidatePlaybackStyleIdentifier__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__ISPlayerItem__invalidatePlaybackStyleIdentifier__block_invoke_2;
  v3[3] = &unk_1E9453F48;
  v3[4] = v1;
  return objc_msgSend(v1, "_performIvarWrite:", v3);
}

uint64_t __50__ISPlayerItem__invalidatePlaybackStyleIdentifier__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 252) = 0;
  return result;
}

void __37__ISPlayerItem__minimumClientVersion__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 232));
}

void __41__ISPlayerItem__setMinimumClientVersion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 232);
  *(_QWORD *)(v3 + 232) = v2;

}

uint64_t __51__ISPlayerItem__updateMinimumClientVersionIfNeeded__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 251) = 1;
  return result;
}

void __51__ISPlayerItem__updateMinimumClientVersionIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithAVAsset:timeZoneLookup:", v4, 0);
  if (!v5)
  {
    ISGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_debug_impl(&dword_1D2DCA000, v6, OS_LOG_TYPE_DEBUG, "Unable to read minimum client version from source video: %@.", (uint8_t *)&v9, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(v5, "livePhotoMinimumClientVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setMinimumClientVersion:", v8);

}

uint64_t __44__ISPlayerItem__isMinimumClientVersionValid__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 251);
  return result;
}

uint64_t __47__ISPlayerItem__invalidateMinimumClientVersion__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__ISPlayerItem__invalidateMinimumClientVersion__block_invoke_2;
  v3[3] = &unk_1E9453F48;
  v3[4] = v1;
  return objc_msgSend(v1, "_performIvarWrite:", v3);
}

uint64_t __47__ISPlayerItem__invalidateMinimumClientVersion__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 251) = 0;
  return result;
}

uint64_t __28__ISPlayerItem__needsUpdate__block_invoke(uint64_t result)
{
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  BOOL v10;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 250) ^ 1;
  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    v2 = 1;
  else
    v2 = *(_BYTE *)(*(_QWORD *)(result + 32) + 249) == 0;
  *(_BYTE *)(v1 + 24) = v2;
  v3 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (*(_BYTE *)(v3 + 24))
    v4 = 1;
  else
    v4 = *(_BYTE *)(*(_QWORD *)(result + 32) + 248) == 0;
  *(_BYTE *)(v3 + 24) = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
    v6 = 1;
  else
    v6 = *(_BYTE *)(*(_QWORD *)(result + 32) + 251) == 0;
  *(_BYTE *)(v5 + 24) = v6;
  v7 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = 1;
  else
    v8 = *(_BYTE *)(*(_QWORD *)(result + 32) + 252) == 0;
  *(_BYTE *)(v7 + 24) = v8;
  v9 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (*(_BYTE *)(v9 + 24))
    v10 = 1;
  else
    v10 = *(_BYTE *)(*(_QWORD *)(result + 32) + 253) == 0;
  *(_BYTE *)(v9 + 24) = v10;
  return result;
}

void __31__ISPlayerItem__updateIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "_updateMinimumClientVersionIfNeeded");
  objc_msgSend(v2, "_updatePlaybackStyleIdentifierIfNeeded");
  objc_msgSend(v2, "_updateContentSupportsVitalityIfNeeded");
  objc_msgSend(v2, "_updateVideoPlayerItemIfNeeded");
  objc_msgSend(v2, "_updatePlayerContentIfNeeded");
  objc_msgSend(v2, "_updateStatusIfNeeded");

}

uint64_t __22__ISPlayerItem_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 208);
  return result;
}

void __29__ISPlayerItem_playerContent__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 200));
}

uint64_t __27__ISPlayerItem__setStatus___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__ISPlayerItem__setStatus___block_invoke_2;
  v4[3] = &unk_1E94541A8;
  v2 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v2;
  objc_msgSend(v5, "_performIvarWrite:", v4);
  if (*(_QWORD *)(a1 + 40) == 1)
    objc_msgSend(*(id *)(a1 + 32), "_cancelLoading");
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

uint64_t __27__ISPlayerItem__setStatus___block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 208) = *(_QWORD *)(result + 40);
  return result;
}

void __34__ISPlayerItem__setPlayerContent___block_invoke(uint64_t a1)
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
  v5 = __34__ISPlayerItem__setPlayerContent___block_invoke_2;
  v6 = &unk_1E9454130;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  objc_msgSend(v7, "_performIvarWrite:", &v3);
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2, v3, v4, v5, v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "_invalidateStatus");

}

void __34__ISPlayerItem__setPlayerContent___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 200), *(id *)(a1 + 40));
}

void __21__ISPlayerItem_error__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 240));
}

void __26__ISPlayerItem__setError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __26__ISPlayerItem__setError___block_invoke_2;
  v9 = &unk_1E9454130;
  v2 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = v2;
  objc_msgSend(v10, "_performIvarWrite:", &v6);
  ISGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    _os_log_error_impl(&dword_1D2DCA000, v3, OS_LOG_TYPE_ERROR, "%@ did receive error: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_invalidateStatus", v6, v7, v8, v9, v10);
}

void __26__ISPlayerItem__setError___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 240), *(id *)(a1 + 40));
}

uint64_t __54__ISPlayerItem_decodesAllFramesDuringOrdinaryPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 146);
  return result;
}

uint64_t __58__ISPlayerItem_setDecodesAllFramesDuringOrdinaryPlayback___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 146) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setDecodesAllFramesDuringOrdinaryPlayback:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __47__ISPlayerItem_reversesMoreVideoFramesInMemory__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 145);
  return result;
}

uint64_t __51__ISPlayerItem_setReversesMoreVideoFramesInMemory___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setReversesMoreVideoFramesInMemory:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __44__ISPlayerItem_aggressivelyCacheVideoFrames__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 144);
  return result;
}

uint64_t __48__ISPlayerItem_setAggressivelyCacheVideoFrames___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setAggressivelyCachesVideoFrames:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __33__ISPlayerItem__reloadAllContent__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_cancelLoading");
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__ISPlayerItem__reloadAllContent__block_invoke_2;
  v4[3] = &unk_1E9454220;
  v4[4] = v2;
  return objc_msgSend(v2, "performChanges:", v4);
}

uint64_t __33__ISPlayerItem__reloadAllContent__block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "_invalidateVideoPlayerItem");
  v2 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x1E0CA2E18];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  return objc_msgSend(v2, "_setVideoPlayerItem:videoDuration:", 0, &v4);
}

void __30__ISPlayerItem_resetAVObjects__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  ISPlayerContent *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 216));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 216);
  *(_QWORD *)(v2 + 216) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = 0;
  v4 = [ISPlayerContent alloc];
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "photo");
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "photoIsOriginal");
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "photoEXIFOrientation");
  v14 = *MEMORY[0x1E0CA2E18];
  v15 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v12 = v14;
  v13 = v15;
  LOBYTE(v11) = 0;
  v8 = -[ISPlayerContent initWithPhoto:photoIsOriginal:photoEXIFOrientation:photoTime:videoDuration:photoHasColorAdjustments:videoPlayerItem:variationIdentifier:supportsVitality:](v4, "initWithPhoto:photoIsOriginal:photoEXIFOrientation:photoTime:videoDuration:photoHasColorAdjustments:videoPlayerItem:variationIdentifier:supportsVitality:", v5, v6, v7, &v14, &v12, 0, 0, 0, v11);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 200);
  *(_QWORD *)(v9 + 200) = v8;

}

void __30__ISPlayerItem_resetAVObjects__block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];

  objc_msgSend(*(id *)(a2 + 272), "resetAVObjects");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__ISPlayerItem_resetAVObjects__block_invoke_3;
  block[3] = &unk_1E9453F48;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __30__ISPlayerItem_resetAVObjects__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadAllContent");
}

void __29__ISPlayerItem_cancelLoading__block_invoke(uint64_t a1)
{
  id v2;

  +[ISPlayerItemChef defaultChef](ISPlayerItemChef, "defaultChef");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelPreparationOfIrisAssetWithRequestID:", objc_msgSend(*(id *)(a1 + 32), "_videoPlayerItemRequestID"));

}

void __48__ISPlayerItem_discardContentBelowLoadingTarget__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = a2;
  v3 = objc_msgSend(v2, "loadingTarget");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__ISPlayerItem_discardContentBelowLoadingTarget__block_invoke_2;
  v5[3] = &unk_1E94541D0;
  v6 = v2;
  v7 = v3;
  v4 = v2;
  objc_msgSend(v4, "performChanges:", v5);

}

uint64_t __48__ISPlayerItem_discardContentBelowLoadingTarget__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  void *v2;
  __int128 v3;
  uint64_t v4;

  if (*(uint64_t *)(result + 40) <= 0)
  {
    v1 = result;
    v2 = *(void **)(result + 32);
    v3 = *MEMORY[0x1E0CA2E18];
    v4 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    objc_msgSend(v2, "_setVideoPlayerItem:videoDuration:", 0, &v3);
    return objc_msgSend(*(id *)(v1 + 32), "_invalidateVideoPlayerItem");
  }
  return result;
}

uint64_t __45__ISPlayerItem__setVideoPlayerItemRequestID___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 136) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __41__ISPlayerItem__videoPlayerItemRequestID__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 136);
  return result;
}

void __36__ISPlayerItem_setVideoComposition___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __36__ISPlayerItem_setVideoComposition___block_invoke_2;
  v2[3] = &unk_1E9454130;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_performIvarWrite:", v2);

}

uint64_t __36__ISPlayerItem_setVideoComposition___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 128);
  *(_QWORD *)(v3 + 128) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "setVideoComposition:", *(_QWORD *)(a1 + 40));
}

void __32__ISPlayerItem_videoComposition__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
}

uint64_t __33__ISPlayerItem_setLoadingTarget___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__ISPlayerItem_setLoadingTarget___block_invoke_2;
  v4[3] = &unk_1E94541A8;
  v2 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v2;
  result = objc_msgSend(v5, "_performIvarWrite:", v4);
  if (!*(_QWORD *)(a1 + 40))
    result = objc_msgSend(*(id *)(a1 + 32), "_cancelLoading");
  if (*(uint64_t *)(a1 + 48) <= 0 && *(uint64_t *)(a1 + 40) >= 1)
    return objc_msgSend(*(id *)(a1 + 32), "_invalidateVideoPlayerItem");
  return result;
}

uint64_t __33__ISPlayerItem_setLoadingTarget___block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 120) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __29__ISPlayerItem_loadingTarget__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 120);
  return result;
}

id __31__ISPlayerItem_performChanges___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ISPlayerItem;
  return objc_msgSendSuper2(&v3, sel_performChanges_, v1);
}

+ (int64_t)currentClientVersion
{
  return 0;
}

+ (ISPlayerItem)playerItemWithAsset:(id)a3 targetSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAsset:targetSize:", v7, width, height);

  return (ISPlayerItem *)v8;
}

+ (ISPlayerItem)playerItemWithAsset:(id)a3 targetSize:(CGSize)a4 contentAspectRatio:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAsset:targetSize:contentAspectRatio:", v10, v9, width, height);

  return (ISPlayerItem *)v11;
}

@end
