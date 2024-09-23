@implementation PXStoryResourcesPreloader

- (PXStoryResourcesPreloader)initWithMediaProvider:(id)a3 displayScale:(double)a4 videoSessionManager:(id)a5 loadingStatusReporter:(id)a6 storyQueue:(id)a7 isExporting:(BOOL)a8 isInline:(BOOL)a9
{
  id v17;
  id v18;
  id v19;
  PXStoryResourcesPreloader *v20;
  PXStoryResourcesPreloader *v21;
  const char *v22;
  objc_class *v23;
  id v24;
  os_log_t v25;
  OS_os_log *log;
  uint64_t v27;
  PXUpdater *updater;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *timelineReadingQueue;
  dispatch_queue_t v32;
  OS_dispatch_queue *stateQueue;
  dispatch_queue_t v34;
  OS_dispatch_queue *estimationQueue;
  NSOperationQueue *v36;
  NSOperationQueue *loadingOperationQueue;
  void *v38;
  NSMutableIndexSet *v39;
  NSMutableIndexSet *timelineReadingQueue_loadedSegments;
  NSCountedSet *v41;
  NSCountedSet *stateQueue_loadingSegments;
  NSMutableArray *v43;
  NSMutableArray *stateQueue_loadedTimeRanges;
  NSMutableIndexSet *v45;
  NSMutableIndexSet *stateQueue_loadedSegments;
  PXStoryResourcesPreloadingStatsStore *v47;
  PXStoryResourcesPreloadingStatsStore *estimationQueue_statsStore;
  id v50;
  objc_super v51;

  v50 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v51.receiver = self;
  v51.super_class = (Class)PXStoryResourcesPreloader;
  v20 = -[PXStoryResourcesPreloader init](&v51, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_mediaProvider, a3);
    v21->_displayScale = a4;
    objc_storeStrong((id *)&v21->_videoSessionManager, a5);
    objc_storeStrong((id *)&v21->_loadingStatusReporter, a6);
    v22 = (const char *)*MEMORY[0x1E0D744D8];
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = os_log_create(v22, (const char *)objc_msgSend(v24, "UTF8String"));
    log = v21->_log;
    v21->_log = (OS_os_log *)v25;

    objc_storeStrong((id *)&v21->_storyQueue, a7);
    v21->_isExporting = a8;
    v21->_isInline = a9;
    v27 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v21, sel__setNeedsUpdate);
    updater = v21->_updater;
    v21->_updater = (PXUpdater *)v27;

    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateEstimation);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateProcessing);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_queue_create("PXStoryResourcesPreloader.timelineReading", v29);
    timelineReadingQueue = v21->_timelineReadingQueue;
    v21->_timelineReadingQueue = (OS_dispatch_queue *)v30;

    v32 = dispatch_queue_create("PXStoryResourcesPreloader.state", v29);
    stateQueue = v21->_stateQueue;
    v21->_stateQueue = (OS_dispatch_queue *)v32;

    v34 = dispatch_queue_create("PXStoryResourcesPreloader.estimation", v29);
    estimationQueue = v21->_estimationQueue;
    v21->_estimationQueue = (OS_dispatch_queue *)v34;

    v36 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    loadingOperationQueue = v21->_loadingOperationQueue;
    v21->_loadingOperationQueue = v36;

    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setMaxConcurrentOperationCount:](v21->_loadingOperationQueue, "setMaxConcurrentOperationCount:", objc_msgSend(v38, "simultaneousPreloadingOperationsCount"));

    -[NSOperationQueue setQualityOfService:](v21->_loadingOperationQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setName:](v21->_loadingOperationQueue, "setName:", CFSTR("PXStoryResourcesPreloader.resourcesLoading"));
    v39 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    timelineReadingQueue_loadedSegments = v21->_timelineReadingQueue_loadedSegments;
    v21->_timelineReadingQueue_loadedSegments = v39;

    v41 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    stateQueue_loadingSegments = v21->_stateQueue_loadingSegments;
    v21->_stateQueue_loadingSegments = v41;

    v43 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stateQueue_loadedTimeRanges = v21->_stateQueue_loadedTimeRanges;
    v21->_stateQueue_loadedTimeRanges = v43;

    v45 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    stateQueue_loadedSegments = v21->_stateQueue_loadedSegments;
    v21->_stateQueue_loadedSegments = v45;

    v47 = objc_alloc_init(PXStoryResourcesPreloadingStatsStore);
    estimationQueue_statsStore = v21->_estimationQueue_statsStore;
    v21->_estimationQueue_statsStore = v47;

  }
  return v21;
}

- (PXStoryResourcesPreloader)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryResourcesPreloader.m"), 160, CFSTR("%s is not available as initializer"), "-[PXStoryResourcesPreloader init]");

  abort();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PXStoryResourcesPreloadingRequest setIsCancelled:](self->_stateQueue_currentRequest, "setIsCancelled:", 1);
  -[PXStoryResourcesPreloader loadingOperationQueue](self, "loadingOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  v4.receiver = self;
  v4.super_class = (Class)PXStoryResourcesPreloader;
  -[PXStoryResourcesPreloader dealloc](&v4, sel_dealloc);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryResourcesPreloader;
  -[PXStoryResourcesPreloader performChanges:](&v3, sel_performChanges_, a3);
}

- (void)_performChangesOnStoryQueue:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PXStoryResourcesPreloader storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PXStoryResourcesPreloader__performChangesOnStoryQueue___block_invoke;
  v7[3] = &unk_1E5148CE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryResourcesPreloader;
  -[PXStoryResourcesPreloader didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryResourcesPreloader updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPlaybackTime
{
  NSObject *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3810000000;
  v11 = &unk_1A7E74EE7;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PXStoryResourcesPreloader_currentPlaybackTime__block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(v5, block);

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v9 + 4);
  _Block_object_dispose(&v8, 8);
  return result;
}

- (void)setCurrentPlaybackTime:(id *)a3
{
  NSObject *v5;
  _QWORD v6[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PXStoryResourcesPreloader_setCurrentPlaybackTime___block_invoke;
  v6[3] = &unk_1E51446C8;
  v7 = *a3;
  v6[4] = self;
  dispatch_sync(v5, v6);

}

- (int64_t)currentSegmentIdentifier
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PXStoryResourcesPreloader_currentSegmentIdentifier__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setCurrentSegmentIdentifier:(int64_t)a3
{
  NSObject *v5;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PXStoryResourcesPreloader_setCurrentSegmentIdentifier___block_invoke;
  block[3] = &unk_1E5141AE0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v8 + 24))
    -[PXStoryResourcesPreloader _invalidateEstimation](self, "_invalidateEstimation");
  _Block_object_dispose(&v7, 8);
}

- (PXStoryResourcesPreloadingRequest)currentRequest
{
  NSObject *v3;
  id v4;
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
  v10 = __Block_byref_object_copy__250346;
  v11 = __Block_byref_object_dispose__250347;
  v12 = 0;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PXStoryResourcesPreloader_currentRequest__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PXStoryResourcesPreloadingRequest *)v4;
}

- (id)previousRequest
{
  NSObject *v3;
  id v4;
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
  v10 = __Block_byref_object_copy__250346;
  v11 = __Block_byref_object_dispose__250347;
  v12 = 0;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PXStoryResourcesPreloader_previousRequest__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setCurrentRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  PXStoryResourcesPreloader *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PXStoryResourcesPreloader_setCurrentRequest___block_invoke;
  block[3] = &unk_1E513FD98;
  v6 = v4;
  v8 = v6;
  v9 = self;
  v10 = &v11;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v12 + 24))
  {
    -[PXStoryResourcesPreloader _invalidateEstimation](self, "_invalidateEstimation");
    -[PXStoryResourcesPreloader _invalidateProcessing](self, "_invalidateProcessing");
  }

  _Block_object_dispose(&v11, 8);
}

- (BOOL)isLoadingLikelyToKeepUpWithPlayback
{
  PXStoryResourcesPreloader *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PXStoryResourcesPreloader_isLoadingLikelyToKeepUpWithPlayback__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setIsLoadingLikelyToKeepUpWithPlayback:(BOOL)a3
{
  NSObject *v5;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PXStoryResourcesPreloader_setIsLoadingLikelyToKeepUpWithPlayback___block_invoke;
  block[3] = &unk_1E513FF00;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v9 + 24))
    -[PXStoryResourcesPreloader signalChange:](self, "signalChange:", 2);
  _Block_object_dispose(&v8, 8);
}

- (int64_t)lagsCount
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__PXStoryResourcesPreloader_lagsCount__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (float)loadingFractionComplete
{
  NSObject *v3;
  float v4;
  _QWORD v6[6];
  uint64_t v7;
  float *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = (float *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PXStoryResourcesPreloader_loadingFractionComplete__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setLoadingFractionComplete:(float)a3
{
  NSObject *v5;
  _QWORD block[6];
  float v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PXStoryResourcesPreloader_setLoadingFractionComplete___block_invoke;
  block[3] = &unk_1E5140108;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v9 + 24))
    -[PXStoryResourcesPreloader signalChange:](self, "signalChange:", 2);
  _Block_object_dispose(&v8, 8);
}

- (NSError)error
{
  NSObject *v3;
  id v4;
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
  v10 = __Block_byref_object_copy__250346;
  v11 = __Block_byref_object_dispose__250347;
  v12 = 0;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__PXStoryResourcesPreloader_error__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSError *)v4;
}

- (void)setError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  PXStoryResourcesPreloader *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PXStoryResourcesPreloader_setError___block_invoke;
  block[3] = &unk_1E513FD98;
  v6 = v4;
  v8 = v6;
  v9 = self;
  v10 = &v11;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v12 + 24))
    -[PXStoryResourcesPreloader signalChange:](self, "signalChange:", 4);

  _Block_object_dispose(&v11, 8);
}

- (NSArray)loadedTimeRanges
{
  NSObject *v3;
  id v4;
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
  v10 = __Block_byref_object_copy__250346;
  v11 = __Block_byref_object_dispose__250347;
  v12 = 0;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PXStoryResourcesPreloader_loadedTimeRanges__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)_noteSessionStartedWithLoadedSegments:(id)a3 segmentsToLoad:(id)a4 preloadableClipsCounts:(id *)a5 inTimeline:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v15;
  _QWORD block[5];
  id v17;

  v10 = a3;
  v11 = a6;
  v12 = a4;
  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__PXStoryResourcesPreloader__noteSessionStartedWithLoadedSegments_segmentsToLoad_preloadableClipsCounts_inTimeline___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = self;
  v17 = v10;
  v14 = v10;
  dispatch_sync(v13, block);

  v15 = *a5;
  -[PXStoryResourcesPreloader _estimationNoteSessionStartedWithSegmentsToLoad:preloadableClipsCounts:inTimeline:](self, "_estimationNoteSessionStartedWithSegmentsToLoad:preloadableClipsCounts:inTimeline:", v12, &v15, v11);

  -[PXStoryResourcesPreloader _estimationNoteLoadingSegments:loadedSegments:](self, "_estimationNoteLoadingSegments:loadedSegments:", 0, v14);
}

- (void)_accumulateLoadedTimeRange:(id *)a3 moreExpected:(BOOL)a4
{
  NSObject *v7;
  __int128 v8;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  BOOL v13;

  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[1] = 3221225472;
  v8 = *(_OWORD *)&a3->var0.var3;
  v10 = *(_OWORD *)&a3->var0.var0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __69__PXStoryResourcesPreloader__accumulateLoadedTimeRange_moreExpected___block_invoke;
  v9[3] = &unk_1E513E918;
  v9[4] = self;
  v11 = v8;
  v12 = *(_OWORD *)&a3->var1.var1;
  v13 = a4;
  dispatch_async(v7, v9);

}

- (void)_stateQueue_accumulateLoadedTimeRange:(id *)a3 moreExpected:(BOOL)a4
{
  $EB79B37EDD75B660E5EC336E3C45010D *p_stateQueue_loadedContinuousTimeRange;
  CMTimeFlags flags;
  CMTimeFlags v7;
  CMTimeValue v9;
  CMTimeEpoch epoch;
  CMTimeScale v13;
  __int128 v14;
  __int128 v15;
  NSMutableArray *stateQueue_loadedTimeRanges;
  PXStoryTimeRangeValue *v17;
  PXStoryTimeRangeValue *v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[3];
  CMTimeRange time2;
  _BYTE time1[32];
  __int128 v24;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_stateQueue_loadedContinuousTimeRange = &self->_stateQueue_loadedContinuousTimeRange;
  value = self->_stateQueue_loadedContinuousTimeRange.start.value;
  flags = self->_stateQueue_loadedContinuousTimeRange.start.flags;
  timescale = self->_stateQueue_loadedContinuousTimeRange.start.timescale;
  if ((flags & 1) != 0)
  {
    v7 = self->_stateQueue_loadedContinuousTimeRange.duration.flags;
    if ((v7 & 1) != 0 && self->_stateQueue_loadedContinuousTimeRange.duration.epoch == 0)
    {
      v9 = self->_stateQueue_loadedContinuousTimeRange.duration.value;
      if ((v9 & 0x8000000000000000) == 0)
      {
        epoch = self->_stateQueue_loadedContinuousTimeRange.start.epoch;
        v13 = self->_stateQueue_loadedContinuousTimeRange.duration.timescale;
        *(_OWORD *)time1 = *(_OWORD *)&a3->var0.var0;
        *(_QWORD *)&time1[16] = a3->var0.var3;
        time2.start.value = p_stateQueue_loadedContinuousTimeRange->start.value;
        time2.start.timescale = self->_stateQueue_loadedContinuousTimeRange.start.timescale;
        time2.start.flags = flags;
        time2.start.epoch = epoch;
        if ((CMTimeCompare((CMTime *)time1, &time2.start) & 0x80000000) == 0 && a4)
        {
          time2.start.value = value;
          time2.start.timescale = timescale;
          time2.start.flags = flags;
          time2.start.epoch = epoch;
          time2.duration.value = v9;
          time2.duration.timescale = v13;
          time2.duration.flags = v7;
          time2.duration.epoch = 0;
          v14 = *(_OWORD *)&a3->var0.var3;
          v21[0] = *(_OWORD *)&a3->var0.var0;
          v21[1] = v14;
          v21[2] = *(_OWORD *)&a3->var1.var1;
          PXStoryTimeRangeUnion(&time2, (uint64_t)v21, (uint64_t)time1);
          v15 = *(_OWORD *)&time1[16];
          *(_OWORD *)&p_stateQueue_loadedContinuousTimeRange->start.value = *(_OWORD *)time1;
          *(_OWORD *)&p_stateQueue_loadedContinuousTimeRange->start.epoch = v15;
          *(_OWORD *)&p_stateQueue_loadedContinuousTimeRange->duration.timescale = v24;
          return;
        }
        stateQueue_loadedTimeRanges = self->_stateQueue_loadedTimeRanges;
        v17 = [PXStoryTimeRangeValue alloc];
        *(_QWORD *)time1 = value;
        *(_QWORD *)&time1[8] = __PAIR64__(flags, timescale);
        *(_QWORD *)&time1[16] = epoch;
        *(_QWORD *)&time1[24] = v9;
        v24 = __PAIR64__(v7, v13);
        v18 = -[PXStoryTimeRangeValue initWithStoryTimeRange:](v17, "initWithStoryTimeRange:", time1);
        -[NSMutableArray addObject:](stateQueue_loadedTimeRanges, "addObject:", v18);

      }
    }
  }
  v19 = *(_OWORD *)&a3->var0.var0;
  v20 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&p_stateQueue_loadedContinuousTimeRange->start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&p_stateQueue_loadedContinuousTimeRange->duration.timescale = v20;
  *(_OWORD *)&p_stateQueue_loadedContinuousTimeRange->start.value = v19;
}

- (void)_noteLoadingStartedForClipInSegment:(int64_t)a3
{
  NSObject *v6;
  _QWORD block[7];

  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PXStoryResourcesPreloader__noteLoadingStartedForClipInSegment___block_invoke;
  block[3] = &unk_1E5149060;
  block[4] = self;
  block[5] = a3;
  block[6] = a2;
  dispatch_async(v6, block);

}

- (void)_noteLoadingEndedForClip:(id *)a3 inSegment:(int64_t)a4 resourceType:(id)a5 resourceIdentifier:(id)a6 timeRange:(id *)a7 error:(id)a8 loadingTime:(double)a9 playbackStyle:(int64_t)a10
{
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  __int128 v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  _BYTE v37[768];
  _QWORD block[8];
  __int128 v39;
  __int128 v40;
  __int128 v41;

  v17 = a5;
  v18 = a6;
  v19 = a8;
  -[PXStoryResourcesPreloader loadingStatusReporter](self, "loadingStatusReporter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "notifyPreloadingCompleteForClipIdentifier:", a3->var0);

  -[PXStoryResourcesPreloader stateQueue](self, "stateQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __138__PXStoryResourcesPreloader__noteLoadingEndedForClip_inSegment_resourceType_resourceIdentifier_timeRange_error_loadingTime_playbackStyle___block_invoke;
  block[3] = &unk_1E513E940;
  block[4] = self;
  block[5] = a4;
  v23 = *(_OWORD *)&a7->var0.var3;
  v39 = *(_OWORD *)&a7->var0.var0;
  v40 = v23;
  v41 = *(_OWORD *)&a7->var1.var1;
  block[6] = a10;
  *(double *)&block[7] = a9;
  dispatch_async(v21, block);

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "simulateResourcesBufferingError");

  if (!v19 && v25)
  {
    PXStoryErrorCreateWithCodeDebugFormat(22, CFSTR("Simulated preloading error."), v26, v27, v28, v29, v30, v31, v32);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v19)
  {
    v33[0] = v22;
    v33[1] = 3221225472;
    v33[2] = __138__PXStoryResourcesPreloader__noteLoadingEndedForClip_inSegment_resourceType_resourceIdentifier_timeRange_error_loadingTime_playbackStyle___block_invoke_2;
    v33[3] = &unk_1E513E968;
    v33[4] = self;
    v34 = v19;
    v35 = v17;
    v36 = v18;
    memcpy(v37, a3, sizeof(v37));
    -[PXStoryResourcesPreloader _performChangesOnStoryQueue:](self, "_performChangesOnStoryQueue:", v33);

  }
}

- (void)startProcessingRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  -[PXStoryResourcesPreloader currentRequest](self, "currentRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v15;
  if (v4 != v15)
  {
    -[PXStoryResourcesPreloader currentRequest](self, "currentRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeline");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeline");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {

    }
    else
    {
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if ((v9 & 1) == 0)
      {

        goto LABEL_11;
      }
    }
    objc_msgSend(v15, "songResource");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "songResource");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {

    }
    else
    {
      v12 = v11;
      v13 = objc_msgSend(v10, "isEqual:", v11);

      if ((v13 & 1) == 0)
        goto LABEL_11;
    }
    v14 = objc_msgSend(v15, "startingSegmentIdentifier");
    if (v14 == objc_msgSend(v6, "startingSegmentIdentifier"))
    {
LABEL_12:

      v5 = v15;
      goto LABEL_13;
    }
LABEL_11:
    -[PXStoryResourcesPreloader setCurrentRequest:](self, "setCurrentRequest:", v15);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)cancelProcessingAllRequests
{
  -[PXStoryResourcesPreloader setCurrentRequest:](self, "setCurrentRequest:", 0);
}

- (void)_setNeedsUpdate
{
  -[PXStoryResourcesPreloader signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateEstimation
{
  id v2;

  -[PXStoryResourcesPreloader updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateEstimation);

}

- (void)_updateEstimation
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXStoryResourcesPreloader estimationQueue](self, "estimationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__PXStoryResourcesPreloader__updateEstimation__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_invalidateProcessing
{
  id v2;

  -[PXStoryResourcesPreloader updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateProcessing);

}

- (void)_updateProcessing
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id from;
  id location;

  objc_initWeak(&location, self);
  -[PXStoryResourcesPreloader currentRequest](self, "currentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&from, v3);

  -[PXStoryResourcesPreloader previousRequest](self, "previousRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&v10, v4);

  -[PXStoryResourcesPreloader timelineReadingQueue](self, "timelineReadingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PXStoryResourcesPreloader__updateProcessing__block_invoke;
  v6[3] = &unk_1E513E990;
  objc_copyWeak(&v7, &location);
  objc_copyWeak(&v8, &from);
  objc_copyWeak(&v9, &v10);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_estimationNoteSessionStartedWithSegmentsToLoad:(id)a3 preloadableClipsCounts:(id *)a4 inTimeline:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v16;

  v8 = a3;
  v9 = a5;
  -[PXStoryResourcesPreloader estimationQueue](self, "estimationQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__PXStoryResourcesPreloader__estimationNoteSessionStartedWithSegmentsToLoad_preloadableClipsCounts_inTimeline___block_invoke;
  block[3] = &unk_1E513E9B8;
  v16 = *a4;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(v10, block);

}

- (void)_estimationNoteLoadingSegments:(id)a3 loadedSegments:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  PXStoryResourcesPreloader *v14;
  id v15;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  v8 = (void *)objc_msgSend(v6, "copy");

  -[PXStoryResourcesPreloader estimationQueue](self, "estimationQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PXStoryResourcesPreloader__estimationNoteLoadingSegments_loadedSegments___block_invoke;
  block[3] = &unk_1E51457C8;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)_estimationNoteClipWithPlaybackStyle:(int64_t)a3 loadedWithLoadingTime:(double)a4
{
  NSObject *v7;
  _QWORD block[7];

  -[PXStoryResourcesPreloader estimationQueue](self, "estimationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PXStoryResourcesPreloader__estimationNoteClipWithPlaybackStyle_loadedWithLoadingTime___block_invoke;
  block[3] = &unk_1E5149060;
  block[4] = self;
  block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(v7, block);

}

- (void)_estimationQueue_updateEstimation
{
  void *v4;
  void *v5;
  float v6;
  float v7;
  PXStoryTimeline *v8;
  uint64_t v9;
  uint64_t v10;
  PXStoryTimeline *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSIndexSet *estimationQueue_loadedSegments;
  uint64_t v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSIndexSet *v26;
  double v27;
  int v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  uint64_t v36;
  int64_t v38;
  uint64_t v39;
  _BOOL4 v41;
  double Seconds;
  double v43;
  double v44;
  void *v45;
  int v46;
  float v47;
  NSObject *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  uint64_t v52;
  unint64_t estimationQueue_loadingStartTime;
  double v54;
  char v55;
  char v56;
  NSString *stateQueue_estimationDiagnostics;
  void *v58;
  __CFString *v59;
  unint64_t v60;
  uint64_t v61;
  __CFString *v62;
  void *v63;
  _QWORD v64[5];
  float v65;
  char v66;
  char v67;
  _QWORD v68[4];
  PXStoryTimeline *v69;
  CMTime *v70;
  CMTime *p_time2;
  uint64_t v72;
  CMTime v73;
  uint64_t v74;
  CMTime time2;
  uint64_t v76;
  CMTime v77;
  CMTime v78;
  CMTime v79;
  CMTime v80;
  CMTime v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  CMTime v89;
  _BYTE buf[32];
  _BYTE v91[20];
  __int16 v92;
  double v93;
  __int16 v94;
  double v95;
  __int16 v96;
  uint64_t v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  -[PXStoryResourcesPreloader currentRequest](self, "currentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || (objc_msgSend(v4, "isCancelled") & 1) != 0)
    goto LABEL_71;
  if (self->_estimationQueue_sessionStarted)
  {
    -[PXStoryResourcesPreloadingStatsStore loadedFraction](self->_estimationQueue_statsStore, "loadedFraction");
    v7 = v6;
  }
  else
  {
    v7 = 0.0;
  }
  v60 = -[PXStoryResourcesPreloader logContext](self, "logContext");
  v8 = self->_estimationQueue_currentSessionTimeline;
  v9 = -[PXStoryResourcesPreloader currentSegmentIdentifier](self, "currentSegmentIdentifier");
  v10 = objc_msgSend(v5, "startingSegmentIdentifier");
  objc_msgSend(v5, "timeline");
  v11 = (PXStoryTimeline *)objc_claimAutoreleasedReturnValue();

  if (v8 != v11)
  {
    objc_msgSend(v5, "timeline");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTimeline identifiersOfSegmentsMatchingSegmentWithIdentifier:inTimeline:](v8, "identifiersOfSegmentsMatchingSegmentWithIdentifier:inTimeline:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v13, "firstIndex");

    objc_msgSend(v5, "timeline");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTimeline identifiersOfSegmentsMatchingSegmentWithIdentifier:inTimeline:](v8, "identifiersOfSegmentsMatchingSegmentWithIdentifier:inTimeline:", v10, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v15, "firstIndex");

  }
  v61 = -[PXStoryTimeline indexOfSegmentWithIdentifier:](v8, "indexOfSegmentWithIdentifier:", v9);
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v63, "preloadingEstimationStrategy"))
  {
    memset(&v73, 0, sizeof(v73));
    -[PXStoryResourcesPreloader currentPlaybackTime](self, "currentPlaybackTime");
    memset(&v89, 0, sizeof(v89));
    if (v8)
    {
      -[PXStoryTimeline timeRange](v8, "timeRange");
    }
    else
    {
      v87 = 0u;
      v88 = 0u;
      v86 = 0u;
    }
    *(_OWORD *)buf = v86;
    *(_OWORD *)&buf[16] = v87;
    *(_OWORD *)v91 = v88;
    CMTimeRangeGetEnd(&v89, (CMTimeRange *)buf);
    v29 = -[PXStoryTimeline indexOfSegmentWithIdentifier:](v8, "indexOfSegmentWithIdentifier:", v10);
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    -[NSArray objectEnumerator](self->_estimationQueue_loadingSegments, "objectEnumerator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v83;
      v33 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v83 != v32)
            objc_enumerationMutation(v30);
          v35 = -[PXStoryTimeline indexOfSegmentWithIdentifier:](v8, "indexOfSegmentWithIdentifier:", objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "integerValue"));
          if (v35 >= v33)
            v36 = v33;
          else
            v36 = v35;
          if (v35 > v29 && v35 != 0x7FFFFFFFFFFFFFFFLL)
            v33 = v36;
        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
      }
      while (v31);

      if (v61 != 0x7FFFFFFFFFFFFFFFLL && v33 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v38 = -[PXStoryResourcesPreloader lagsCount](self, "lagsCount");
        memset(&v81, 0, sizeof(v81));
        *(CMTime *)buf = v89;
        CMTimeMultiplyByRatio(&v81, (CMTime *)buf, 1, 2);
        CMTimeMakeWithSeconds(&v80, 30.0, 600);
        *(CMTime *)buf = v81;
        time2 = v80;
        if (CMTimeCompare((CMTime *)buf, &time2) >= 1)
        {
          CMTimeMakeWithSeconds(&v78, 30.0, 600);
          *(CMTime *)buf = v89;
          time2 = v78;
          CMTimeSubtract(&v79, (CMTime *)buf, &time2);
          v81 = v79;
        }
        *(CMTime *)buf = v73;
        time2 = v81;
        v39 = 2 * v38 + 2;
        if (CMTimeCompare((CMTime *)buf, &time2) >= 1
          && !-[PXStoryResourcesPreloader isLoadingLikelyToKeepUpWithPlayback](self, "isLoadingLikelyToKeepUpWithPlayback"))
        {
          v39 = -[PXStoryTimeline numberOfSegments](v8, "numberOfSegments");
        }
        v41 = v33 < v29 || v33 - v61 >= v39;
        objc_msgSend(0, "appendFormat:", CFSTR("Indexes: (%ld - %ld = %ld) >= %ld\n"), v33, v61, v33 - v61, v39);
        v28 = 1;
        goto LABEL_49;
      }
    }
    else
    {

      v33 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_msgSend(0, "appendString:", CFSTR("canChangeIsLikelyToKeepUp = NO\n"));
    v28 = 0;
    v41 = 1;
LABEL_49:
    *(CMTime *)buf = v89;
    time2 = v73;
    CMTimeSubtract(&v77, (CMTime *)buf, &time2);
    *(CMTime *)buf = v77;
    Seconds = CMTimeGetSeconds((CMTime *)buf);
    -[PXStoryResourcesPreloadingStatsStore estimatedLoadingTimeLeft](self->_estimationQueue_statsStore, "estimatedLoadingTimeLeft");
    v44 = v43;
    objc_msgSend(0, "appendFormat:", CFSTR("playbackTimeLeft: %.2fs\n"), *(_QWORD *)&Seconds);
    objc_msgSend(0, "appendFormat:", CFSTR("loadingTimeLeft : %.2fs\n"), *(_QWORD *)&v44);
    if (Seconds < v44)
      v41 = 0;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "estimateTimeLeftPerPlaybackStyle");

    if ((v46 & v41) == 1)
      v19 = -[PXStoryResourcesPreloadingStatsStore didDownloadFirstVideo](self->_estimationQueue_statsStore, "didDownloadFirstVideo");
    else
      v19 = v41 & ~v46;
    -[PXStoryResourcesPreloader loadingFractionComplete](self, "loadingFractionComplete");
    if (v7 != v47)
    {
      PLStoryGetLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        if (v19)
          v49 = CFSTR("YES");
        else
          v49 = CFSTR("NO");
        v50 = v49;
        if (v28)
          v51 = CFSTR("YES");
        else
          v51 = CFSTR("NO");
        v62 = v51;
        v59 = v50;
        v52 = mach_absolute_time();
        estimationQueue_loadingStartTime = self->_estimationQueue_loadingStartTime;
        PXTimebaseConversionFactor();
        *(_DWORD *)buf = 134219778;
        *(_QWORD *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v7;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v50;
        *(_WORD *)v91 = 2112;
        *(_QWORD *)&v91[2] = v62;
        *(_WORD *)&v91[10] = 2048;
        *(double *)&v91[12] = v54 * (double)(uint64_t)(v52 - estimationQueue_loadingStartTime);
        v92 = 2048;
        v93 = Seconds;
        v94 = 2048;
        v95 = v44;
        v96 = 2048;
        v97 = v33;
        _os_log_impl(&dword_1A6789000, v48, OS_LOG_TYPE_INFO, "[Buffering] [Context=%llu] Progress: %f, isLikelyToKeepUp: %@, canChange: %@, elapsed time: %f, playback time left: %f, estimated loading time left: %f, current preloading segment: %ld", buf, 0x52u);

      }
    }
    goto LABEL_64;
  }
  if (objc_msgSend(v63, "preloadingEstimationStrategy") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryResourcesPreloader.m"), 627, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  time2.value = 0;
  *(_QWORD *)&time2.timescale = &time2;
  time2.epoch = 0x2020000000;
  v76 = 0;
  v73.value = 0;
  *(_QWORD *)&v73.timescale = &v73;
  v73.epoch = 0x2020000000;
  v74 = 0x7FFFFFFFFFFFFFFFLL;
  estimationQueue_loadedSegments = self->_estimationQueue_loadedSegments;
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __62__PXStoryResourcesPreloader__estimationQueue_updateEstimation__block_invoke;
  v68[3] = &unk_1E513E9E0;
  v69 = v8;
  v70 = &v73;
  p_time2 = &time2;
  v72 = v61;
  -[NSIndexSet enumerateIndexesUsingBlock:](estimationQueue_loadedSegments, "enumerateIndexesUsingBlock:", v68);
  v17 = *(_QWORD *)(*(_QWORD *)&time2.timescale + 24);
  v18 = objc_msgSend(v63, "minPreloadedeSegments");
  LOBYTE(v19) = v17 > v18;
  PLStoryGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = CFSTR("NO");
    if (v17 > v18)
      v21 = CFSTR("YES");
    v22 = v21;
    v23 = mach_absolute_time();
    v24 = self->_estimationQueue_loadingStartTime;
    PXTimebaseConversionFactor();
    v25 = *(_QWORD *)(*(_QWORD *)&time2.timescale + 24);
    v26 = self->_estimationQueue_loadedSegments;
    *(_DWORD *)buf = 134219266;
    *(_QWORD *)&buf[4] = v60;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v22;
    *(_WORD *)v91 = 2048;
    *(double *)&v91[2] = v27 * (double)(uint64_t)(v23 - v24);
    *(_WORD *)&v91[10] = 2048;
    *(_QWORD *)&v91[12] = v25;
    v92 = 2112;
    v93 = *(double *)&v26;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_INFO, "[Buffering] [Context=%llu] Progress: %f, isLikelyToKeepUp: %@, elapsed time: %f, loaded segments ahead count: %ld, loaded segments: %@", buf, 0x3Eu);

  }
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&time2, 8);
  LOBYTE(v28) = 1;
LABEL_64:
  if (v7 >= 1.0)
    v55 = 1;
  else
    v55 = v28;
  v64[0] = MEMORY[0x1E0C809B0];
  if (v7 >= 1.0)
    v56 = 1;
  else
    v56 = v19;
  v64[1] = 3221225472;
  v64[2] = __62__PXStoryResourcesPreloader__estimationQueue_updateEstimation__block_invoke_48;
  v64[3] = &unk_1E513EA08;
  v66 = v55;
  v64[4] = self;
  v67 = v56;
  v65 = v7;
  -[PXStoryResourcesPreloader _performChangesOnStoryQueue:](self, "_performChangesOnStoryQueue:", v64);
  stateQueue_estimationDiagnostics = self->_stateQueue_estimationDiagnostics;
  self->_stateQueue_estimationDiagnostics = 0;

LABEL_71:
}

- (void)_timelineReadingQueue_sessionStartedWithAlreadyLoadedSegments:(id)a3 segmentsToLoad:(id)a4 preloadableClipsCounts:(id *)a5 request:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v10, "timeline");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a5->var0;
  *(_QWORD *)&v17 = a5->var2;
  -[PXStoryResourcesPreloader _noteSessionStartedWithLoadedSegments:segmentsToLoad:preloadableClipsCounts:inTimeline:](self, "_noteSessionStartedWithLoadedSegments:segmentsToLoad:preloadableClipsCounts:inTimeline:", v12, v11, &v16, v13);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __137__PXStoryResourcesPreloader__timelineReadingQueue_sessionStartedWithAlreadyLoadedSegments_segmentsToLoad_preloadableClipsCounts_request___block_invoke;
  v19[3] = &unk_1E51460E8;
  v19[4] = self;
  v20 = v10;
  v14 = v10;
  objc_msgSend(v12, "enumerateIndexesUsingBlock:", v19);
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  -[PXStoryResourcesPreloader _accumulateLoadedTimeRange:moreExpected:](self, "_accumulateLoadedTimeRange:moreExpected:", &v16, 0);
  v15 = (void *)objc_msgSend(v12, "mutableCopy");

  -[PXStoryResourcesPreloader setTimelineReadingQueue_loadedSegments:](self, "setTimelineReadingQueue_loadedSegments:", v15);
}

- (void)_timelineReadingQueue_processRequest:(id)a3 previousRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  PXStorySongResourcePreloadingOperation *v21;
  void *v22;
  PXStorySongResourcePreloadingOperation *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  unint64_t v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void (**v48)(void *, uint64_t, uint64_t, _QWORD);
  void *v49;
  uint64_t v50;
  _QWORD aBlock[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  PXStoryResourcesPreloader *v58;
  _BYTE *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[5];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE buf[24];
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && (objc_msgSend(v6, "isCancelled") & 1) == 0)
  {
    v47 = v7;
    PLStoryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "timeline");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v6, "startingSegmentIdentifier");
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_INFO, "[Buffering] Starting for timeline: %@, starting segment %ld", buf, 0x16u);

    }
    objc_msgSend(v6, "timeline");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "shouldIgnoreStartingSegmentIdentifier")
      && objc_msgSend(v49, "numberOfSegments") <= 2)
    {
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __82__PXStoryResourcesPreloader__timelineReadingQueue_processRequest_previousRequest___block_invoke;
      v64[3] = &unk_1E5148DE8;
      v64[4] = self;
      -[PXStoryResourcesPreloader _performChangesOnStoryQueue:](self, "_performChangesOnStoryQueue:", v64);
    }
    else
    {
      objc_msgSend(v6, "timeline");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "size");
      PXRectWithOriginAndSize();
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

      -[PXStoryResourcesPreloader loadingOperationQueue](self, "loadingOperationQueue");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "songResource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19 == 0;

      if (!v20)
      {
        v21 = [PXStorySongResourcePreloadingOperation alloc];
        objc_msgSend(v6, "songResource");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[PXStorySongResourcePreloadingOperation initWithSongResource:](v21, "initWithSongResource:", v22);

        objc_msgSend(v44, "addOperation:", v23);
      }
      objc_msgSend(v47, "timeline");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[PXStoryResourcesPreloader timelineReadingQueue_loadedSegments](self, "timelineReadingQueue_loadedSegments");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v28 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3810000000;
      v69 = &unk_1A7E74EE7;
      v70 = 0;
      v71 = 0;
      v72 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __82__PXStoryResourcesPreloader__timelineReadingQueue_processRequest_previousRequest___block_invoke_2;
      aBlock[3] = &unk_1E513EA58;
      v29 = v49;
      v52 = v29;
      v41 = v24;
      v53 = v41;
      v43 = v26;
      v54 = v43;
      v45 = v27;
      v55 = v45;
      v46 = v28;
      v56 = v46;
      v30 = v25;
      v60 = v12;
      v61 = v14;
      v62 = v16;
      v63 = v18;
      v57 = v30;
      v58 = self;
      v59 = buf;
      v48 = (void (**)(void *, uint64_t, uint64_t, _QWORD))_Block_copy(aBlock);
      v31 = objc_msgSend(v29, "indexOfSegmentWithIdentifier:", objc_msgSend(v6, "startingSegmentIdentifier"));
      if (objc_msgSend(v6, "shouldIgnoreStartingSegmentIdentifier"))
      {
        v48[2](v48, v31, 2, 0);
        if (v31 + 2 < objc_msgSend(v29, "numberOfSegments"))
          v48[2](v48, v31 + 2, objc_msgSend(v29, "numberOfSegments") - (v31 + 2), 1);
        v48[2](v48, 0, v31, 1);
      }
      else
      {
        v48[2](v48, v31, objc_msgSend(v29, "numberOfSegments") - v31, 1);
        v48[2](v48, 0, v31, 1);
      }
      PLStoryGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        LODWORD(v65) = 138412290;
        *(_QWORD *)((char *)&v65 + 4) = v30;
        _os_log_impl(&dword_1A6789000, v32, OS_LOG_TYPE_INFO, "[Buffering] Will load resources for segments: %@", (uint8_t *)&v65, 0xCu);
      }

      v65 = *(_OWORD *)(*(_QWORD *)&buf[8] + 32);
      *(_QWORD *)&v66 = *(_QWORD *)(*(_QWORD *)&buf[8] + 48);
      -[PXStoryResourcesPreloader _timelineReadingQueue_sessionStartedWithAlreadyLoadedSegments:segmentsToLoad:preloadableClipsCounts:request:](self, "_timelineReadingQueue_sessionStartedWithAlreadyLoadedSegments:segmentsToLoad:preloadableClipsCounts:request:", v45, v46, &v65, v6);
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v42, "preloadingSegmentsBatchSize");
      v33 = 0;
      do
      {
        if (v33 >= objc_msgSend(v30, "count"))
          break;
        v34 = dispatch_group_create();
        v35 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        v36 = v50;
        v37 = v33 + v50;
        if (v33 < v33 + v50)
        {
          while (v33 < objc_msgSend(v30, "count"))
          {
            objc_msgSend(v30, "objectAtIndexedSubscript:", v33);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "integerValue");

            objc_msgSend(v35, "addIndex:", v39);
            -[PXStoryResourcesPreloader _timelineReadingQueue_loadResourcesForClipsInSegment:request:clipLoadingGroup:](self, "_timelineReadingQueue_loadResourcesForClipsInSegment:request:clipLoadingGroup:", v39, v6, v34);
            ++v33;
            if (!--v36)
            {
              v33 = v37;
              break;
            }
          }
        }
        dispatch_group_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
        -[PXStoryResourcesPreloader timelineReadingQueue_loadedSegments](self, "timelineReadingQueue_loadedSegments");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addIndexes:", v35);

        LODWORD(v40) = objc_msgSend(v6, "isCancelled");
      }
      while (!(_DWORD)v40);
      if ((objc_msgSend(v6, "isCancelled") & 1) == 0)
      {
        v66 = 0u;
        v67 = 0u;
        v65 = 0u;
        -[PXStoryResourcesPreloader _accumulateLoadedTimeRange:moreExpected:](self, "_accumulateLoadedTimeRange:moreExpected:", &v65, 0);
      }

      _Block_object_dispose(buf, 8);
    }

    v7 = v47;
  }

}

- (void)_timelineReadingQueue_loadResourcesForClipsInSegment:(int64_t)a3 request:(id)a4 clipLoadingGroup:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  unint64_t v42;
  int64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;

  v8 = a4;
  v9 = a5;
  -[PXStoryResourcesPreloader log](self, "log");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXStoryResourcesPreloader logContext](self, "logContext");
  -[PXStoryResourcesPreloader loadingStatusReporter](self, "loadingStatusReporter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeline");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  if (v13)
    objc_msgSend(v13, "timeRangeForSegmentWithIdentifier:", a3);
  objc_msgSend(v8, "timeline");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  PXRectWithOriginAndSize();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35[1] = 3221225472;
  v44 = v47;
  v45 = v48;
  v46 = v49;
  v32 = v47;
  v33 = v48;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[2] = __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke;
  v35[3] = &unk_1E513EAF8;
  v35[4] = self;
  v36 = v8;
  v37 = v14;
  v38 = v12;
  v42 = v11;
  v43 = a3;
  v39 = v10;
  v40 = v9;
  v41 = v24;
  v34 = v49;
  v25 = v24;
  v26 = v9;
  v27 = v10;
  v28 = v12;
  v29 = v14;
  v30 = v8;
  objc_msgSend(v29, "enumerateClipsInTimeRange:rect:usingBlock:", &v32, v35, v17, v19, v21, v23);
  -[PXStoryResourcesPreloader loadingOperationQueue](self, "loadingOperationQueue", v32, v33, v34);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addOperations:waitUntilFinished:", v25, 0);

}

- (BOOL)_isClipPreloadable:(id *)a3
{
  return ((a3->var1 - 1) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (BOOL)_isImagePreloadingNeededForClipInfo:(id *)a3
{
  int64_t var1;
  int64_t var5;

  var1 = a3->var1;
  if (var1 == 5)
    return -[PXStoryResourcesPreloader isExporting](self, "isExporting");
  if (var1 != 1)
    return 0;
  var5 = a3->var5;
  if ((unint64_t)(var5 - 3) >= 3)
    return (unint64_t)(var5 - 1) <= 1;
  else
    return !-[PXStoryResourcesPreloader isExporting](self, "isExporting");
}

- (BOOL)_isVideoPreloadingNeededForClipInfo:(id *)a3
{
  return (unint64_t)(a3->var5 - 3) < 3;
}

- (NSString)diagnosticDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PXStoryResourcesPreloader loadingOperationQueue](self, "loadingOperationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "diagnosticDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v13);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return (NSString *)v3;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 320, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (unint64_t)logContext
{
  return self->_logContext;
}

- (void)setLogContext:(unint64_t)a3
{
  self->_logContext = a3;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXVideoSessionManager)videoSessionManager
{
  return self->_videoSessionManager;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (BOOL)isExporting
{
  return self->_isExporting;
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (PXStoryLoadingStatusReporter)loadingStatusReporter
{
  return self->_loadingStatusReporter;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (OS_dispatch_queue)timelineReadingQueue
{
  return self->_timelineReadingQueue;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (OS_dispatch_queue)estimationQueue
{
  return self->_estimationQueue;
}

- (NSOperationQueue)loadingOperationQueue
{
  return self->_loadingOperationQueue;
}

- (NSMutableIndexSet)timelineReadingQueue_loadedSegments
{
  return self->_timelineReadingQueue_loadedSegments;
}

- (void)setTimelineReadingQueue_loadedSegments:(id)a3
{
  objc_storeStrong((id *)&self->_timelineReadingQueue_loadedSegments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineReadingQueue_loadedSegments, 0);
  objc_storeStrong((id *)&self->_loadingOperationQueue, 0);
  objc_storeStrong((id *)&self->_estimationQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_timelineReadingQueue, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_loadingStatusReporter, 0);
  objc_storeStrong((id *)&self->_videoSessionManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_estimationQueue_statsStore, 0);
  objc_storeStrong((id *)&self->_estimationQueue_segmentsToLoad, 0);
  objc_storeStrong((id *)&self->_estimationQueue_loadedSegments, 0);
  objc_storeStrong((id *)&self->_estimationQueue_loadingSegments, 0);
  objc_storeStrong((id *)&self->_estimationQueue_currentSessionTimeline, 0);
  objc_storeStrong((id *)&self->_stateQueue_loadedSegments, 0);
  objc_storeStrong((id *)&self->_stateQueue_loadingSegments, 0);
  objc_storeStrong((id *)&self->_stateQueue_estimationDiagnostics, 0);
  objc_storeStrong((id *)&self->_stateQueue_loadedTimeRanges, 0);
  objc_storeStrong((id *)&self->_stateQueue_previousRequest, 0);
  objc_storeStrong((id *)&self->_stateQueue_currentRequest, 0);
  objc_storeStrong((id *)&self->_stateQueue_error, 0);
}

void __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  uint64_t v6;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  PXStoryImageAssetResourcePreloadingOperation *v39;
  void *v40;
  PXStoryImageAssetResourcePreloadingOperation *v41;
  void *v42;
  void (*v43)(_QWORD *, PXStoryImageAssetResourcePreloadingOperation *, const __CFString *, _BYTE *, uint64_t, double, double);
  __int128 v44;
  PXStoryVideoAssetResourcePreloadingOperation *v45;
  void *v46;
  void *v47;
  PXStoryVideoAssetResourcePreloadingOperation *v48;
  __n128 v49;
  __n128 v50;
  __int128 *v52;
  void *v55;
  _QWORD *v56;
  void *v57;
  _OWORD v58[3];
  _QWORD v59[4];
  id v60;
  uint64_t v61;
  _QWORD aBlock[4];
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  _BYTE v82[608];
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[56];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  _BYTE v95[608];
  _BYTE __dst[608];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;

  if (a2 >= 1)
  {
    v6 = a2;
    v8 = 0;
    v52 = (__int128 *)(a1 + 104);
    v9 = *MEMORY[0x1E0C9D820];
    v10 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
    v11 = (_QWORD *)(a5 + 160);
    do
    {
      v12 = *(v11 - 20);
      v13 = *(_OWORD *)(v11 - 9);
      v14 = *(_OWORD *)(v11 - 5);
      v103 = *(_OWORD *)(v11 - 7);
      v104 = v14;
      v105 = *(_OWORD *)(v11 - 3);
      v15 = *(_OWORD *)(v11 - 17);
      v16 = *(_OWORD *)(v11 - 13);
      v99 = *(_OWORD *)(v11 - 15);
      v100 = v16;
      v17 = *(_OWORD *)(v11 - 11);
      v102 = v13;
      v101 = v17;
      v18 = *(_OWORD *)(v11 - 19);
      v98 = v15;
      v97 = v18;
      v19 = *(v11 - 1);
      memcpy(__dst, v11, sizeof(__dst));
      v20 = *(void **)(a1 + 32);
      v21 = *(_OWORD *)(v11 - 9);
      v22 = *(_OWORD *)(v11 - 5);
      v91 = *(_OWORD *)(v11 - 7);
      v92 = v22;
      v93 = *(_OWORD *)(v11 - 3);
      v23 = *(_OWORD *)(v11 - 17);
      v24 = *(_OWORD *)(v11 - 13);
      *(_OWORD *)&v87[40] = *(_OWORD *)(v11 - 15);
      v88 = v24;
      v89 = *(_OWORD *)(v11 - 11);
      v90 = v21;
      *(_OWORD *)&v87[8] = *(_OWORD *)(v11 - 19);
      *(_OWORD *)&v87[24] = v23;
      *(_QWORD *)v87 = v12;
      v94 = v19;
      memcpy(v95, v11, sizeof(v95));
      if (objc_msgSend(v20, "_isClipPreloadable:", v87))
      {
        if ((objc_msgSend(*(id *)(a1 + 40), "isCancelled") & 1) != 0)
        {
          *a6 = 1;
          return;
        }
        objc_msgSend(*(id *)(a1 + 48), "clipWithIdentifier:", v12);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "identifier");
        v55 = v25;
        objc_msgSend(v25, "resource");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "notifyStartedPreloadingClipIdentifier:", v26);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke_2;
        aBlock[3] = &unk_1E513EAA8;
        v27 = *(id *)(a1 + 64);
        v67 = *(_QWORD *)(a1 + 88);
        v68 = v26;
        v69 = a3;
        v70 = v8;
        v28 = *(_QWORD *)(a1 + 32);
        v63 = v27;
        v64 = v28;
        v78 = v103;
        v79 = v104;
        v80 = v105;
        v74 = v99;
        v75 = v100;
        v76 = v101;
        v77 = v102;
        v72 = v97;
        v73 = v98;
        v71 = v12;
        v81 = v19;
        memcpy(v82, __dst, sizeof(v82));
        v83 = *(_QWORD *)(a1 + 96);
        v29 = v52[1];
        v84 = *v52;
        v85 = v29;
        v86 = v52[2];
        v65 = *(id *)(a1 + 72);
        v66 = *(id *)(a1 + 80);
        v56 = _Block_copy(aBlock);
        v30 = *(void **)(a1 + 32);
        v91 = v103;
        v92 = v104;
        v93 = v105;
        *(_OWORD *)&v87[40] = v99;
        v88 = v100;
        v89 = v101;
        v90 = v102;
        *(_OWORD *)&v87[8] = v97;
        *(_OWORD *)&v87[24] = v98;
        *(_QWORD *)v87 = v12;
        v94 = v19;
        memcpy(v95, __dst, sizeof(v95));
        v31 = objc_msgSend(v30, "_isImagePreloadingNeededForClipInfo:", v87);
        v32 = *(void **)(a1 + 32);
        v91 = v103;
        v92 = v104;
        v93 = v105;
        *(_OWORD *)&v87[40] = v99;
        v88 = v100;
        v89 = v101;
        v90 = v102;
        *(_OWORD *)&v87[8] = v97;
        *(_OWORD *)&v87[24] = v98;
        *(_QWORD *)v87 = v12;
        v94 = v19;
        memcpy(v95, __dst, sizeof(v95));
        if (objc_msgSend(v32, "_isVideoPreloadingNeededForClipInfo:", v87))
          v33 = objc_msgSend(*(id *)(a1 + 40), "timelineAttributes") & 1;
        else
          v33 = 0;
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke_55;
        v59[3] = &unk_1E513EAD0;
        v60 = *(id *)(a1 + 56);
        v61 = v26;
        v34 = _Block_copy(v59);
        if (v31)
        {
          objc_msgSend(*(id *)(a1 + 32), "displayScale");
          v91 = v103;
          v92 = v104;
          v93 = v105;
          *(_OWORD *)&v87[40] = v99;
          v88 = v100;
          v89 = v101;
          v90 = v102;
          *(_OWORD *)&v87[8] = v97;
          *(_OWORD *)&v87[24] = v98;
          *(_QWORD *)v87 = v12;
          v94 = v19;
          memcpy(v95, __dst, sizeof(v95));
          PXStoryMediaSizeForDisplayAssetClipInfo((uint64_t)v87);
          v36 = v35;
          v38 = v37;
          v39 = [PXStoryImageAssetResourcePreloadingOperation alloc];
          objc_msgSend(*(id *)(a1 + 32), "mediaProvider");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = -[PXStoryImageAssetResourcePreloadingOperation initWithDisplayAssetResource:targetSize:mediaProvider:isInline:](v39, "initWithDisplayAssetResource:targetSize:mediaProvider:isInline:", v57, v40, objc_msgSend(*(id *)(a1 + 32), "isInline"), v36, v38);

          if (v33)
            v42 = 0;
          else
            v42 = v34;
          -[PXStoryDisplayAssetResourcePreloadingOperation setProgressHandler:](v41, "setProgressHandler:", v42);
          v43 = (void (*)(_QWORD *, PXStoryImageAssetResourcePreloadingOperation *, const __CFString *, _BYTE *, uint64_t, double, double))v56[2];
          v44 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
          *(_OWORD *)v87 = *MEMORY[0x1E0CA2E40];
          *(_OWORD *)&v87[16] = v44;
          *(_OWORD *)&v87[32] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
          v43(v56, v41, CFSTR("image"), v87, 1, v36, v38);

        }
        if (v33)
        {
          memset(v87, 0, 48);
          PXStoryClipVideoSegmentTimeRange(v55, v87);
          v45 = [PXStoryVideoAssetResourcePreloadingOperation alloc];
          objc_msgSend(*(id *)(a1 + 32), "mediaProvider");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v58[0] = *(_OWORD *)v87;
          v58[1] = *(_OWORD *)&v87[16];
          v58[2] = *(_OWORD *)&v87[32];
          objc_msgSend(*(id *)(a1 + 32), "videoSessionManager");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = -[PXStoryVideoAssetResourcePreloadingOperation initWithVideoAssetResource:mediaProvider:downloadTimeRange:videoSessionManager:isExporting:isInline:](v45, "initWithVideoAssetResource:mediaProvider:downloadTimeRange:videoSessionManager:isExporting:isInline:", v57, v46, v58, v47, objc_msgSend(*(id *)(a1 + 32), "isExporting"), objc_msgSend(*(id *)(a1 + 32), "isInline"));

          -[PXStoryDisplayAssetResourcePreloadingOperation setProgressHandler:](v48, "setProgressHandler:", v34);
          v49.n128_u64[1] = *(_QWORD *)&v87[24];
          v50.n128_u64[1] = *(_QWORD *)&v87[40];
          v50.n128_u64[0] = v9;
          v49.n128_u64[0] = v10;
          ((void (*)(__n128, __n128))v56[2])(v50, v49);

        }
        v6 = a2;
      }
      ++v8;
      v11 += 96;
    }
    while (v6 != v8);
  }
}

void __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke_2(uint64_t a1, void *a2, void *a3, _OWORD *a4, uint64_t a5, CGFloat a6, CGFloat a7)
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  os_signpost_id_t v18;
  _OWORD *v19;
  void *v20;
  void *v21;
  __int128 v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37[2];
  _QWORD v38[99];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id location;
  _BYTE buf[32];
  _BYTE v44[20];
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;
  CGSize v50;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = a3;
  objc_msgSend(v12, "displayAsset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(id *)(a1 + 32);
  v17 = os_signpost_id_make_with_pointer(v16, v12);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v18 = v17;
    if (os_signpost_enabled(v16))
    {
      v28 = *(_QWORD *)(a1 + 64);
      v29 = *(_QWORD *)(a1 + 72);
      v19 = (_OWORD *)(*(_QWORD *)(a1 + 80) + 48 * *(_QWORD *)(a1 + 88));
      *(_OWORD *)buf = *v19;
      *(_OWORD *)&buf[16] = v19[1];
      *(_OWORD *)v44 = v19[2];
      PXStoryTimeRangeDescription((uint64_t)buf);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v50.width = a6;
      v50.height = a7;
      NSStringFromCGSize(v50);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = a4[1];
      *(_OWORD *)buf = *a4;
      *(_OWORD *)&buf[16] = v22;
      *(_OWORD *)v44 = a4[2];
      PXStoryTimeRangeDescription((uint64_t)buf);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219522;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v13;
      *(_WORD *)v44 = 2114;
      *(_QWORD *)&v44[2] = v15;
      *(_WORD *)&v44[10] = 2114;
      *(_QWORD *)&v44[12] = v20;
      v45 = 2114;
      v46 = v21;
      v47 = 2114;
      v48 = v23;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PXStoryResourcesPreloaderBufferingOperation", "Context=%{signpost.telemetry:string2}lu clipIdentifier=%{signpost.description:attribute, public}ld resourceType=%{signpost.description:attribute, public}@ asset=%{signpost.description:attribute, public}@ timeRange=%{signpost.description:attribute, public}@ targetSize=%{signpost.description:attribute, public}@ videoSegmentTimeRange=%{signpost.description:attribute, public}@ ", buf, 0x48u);

    }
  }

  v24 = mach_absolute_time();
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  objc_initWeak(&location, v12);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke_53;
  v31[3] = &unk_1E513EA80;
  v32 = *(id *)(a1 + 32);
  objc_copyWeak(&v36, &location);
  v37[1] = *(id *)(a1 + 64);
  objc_copyWeak(v37, (id *)buf);
  memcpy(v38, (const void *)(a1 + 96), 0x308uLL);
  v25 = v13;
  v33 = v25;
  v26 = v15;
  v27 = *(_OWORD *)(a1 + 888);
  v39 = *(_OWORD *)(a1 + 872);
  v40 = v27;
  v41 = *(_OWORD *)(a1 + 904);
  v34 = v26;
  v38[97] = v24;
  v38[98] = a5;
  v35 = *(id *)(a1 + 48);
  objc_msgSend(v12, "setCompletionBlock:", v31);
  objc_msgSend(*(id *)(a1 + 40), "_noteLoadingStartedForClipInSegment:", *(_QWORD *)(a1 + 864));
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);

  objc_destroyWeak(v37);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

uint64_t __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke_55(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyPreloadingProgress:error:forClipIdentifier:", a2, *(_QWORD *)(a1 + 40));
}

void __107__PXStoryResourcesPreloader__timelineReadingQueue_loadResourcesForClipsInSegment_request_clipLoadingGroup___block_invoke_53(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  os_signpost_id_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  __int128 v16;
  _OWORD v17[3];
  uint8_t buf[776];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = os_signpost_id_make_with_pointer(v2, WeakRetained);

  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v5 = *(_QWORD *)(a1 + 80);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v5;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v2, OS_SIGNPOST_INTERVAL_END, v4, "PXStoryResourcesPreloaderBufferingOperation", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
  }

  v6 = objc_loadWeakRetained((id *)(a1 + 72));
  v7 = *(_QWORD *)(a1 + 856);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v10, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (double)(uint64_t)(mach_absolute_time() - *(_QWORD *)(a1 + 864));
  PXTimebaseConversionFactor();
  v14 = v13 * v12;
  v15 = *(_QWORD *)(a1 + 872);
  memcpy(buf, (const void *)(a1 + 88), 0x300uLL);
  v16 = *(_OWORD *)(a1 + 896);
  v17[0] = *(_OWORD *)(a1 + 880);
  v17[1] = v16;
  v17[2] = *(_OWORD *)(a1 + 912);
  objc_msgSend(v6, "_noteLoadingEndedForClip:inSegment:resourceType:resourceIdentifier:timeRange:error:loadingTime:playbackStyle:", buf, v7, v8, v9, v17, v11, v14, v15);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __82__PXStoryResourcesPreloader__timelineReadingQueue_processRequest_previousRequest___block_invoke(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(a1 + 32), "setIsLoadingLikelyToKeepUpWithPlayback:", 1);
  LODWORD(v2) = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setLoadingFractionComplete:", v2);
}

void __82__PXStoryResourcesPreloader__timelineReadingQueue_processRequest_previousRequest___block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v17[3];
  _QWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (a2 < a2 + a3)
  {
    v23 = v7;
    v24 = v6;
    v25 = v4;
    v26 = v5;
    v9 = a3;
    v10 = a2;
    do
    {
      if (v10 >= objc_msgSend(*(id *)(a1 + 32), "numberOfSegments"))
        break;
      v12 = objc_msgSend(*(id *)(a1 + 32), "identifierForSegmentAtIndex:", v10);
      objc_msgSend(*(id *)(a1 + 40), "identifiersOfSegmentsMatchingSegmentWithIdentifier:inTimeline:", v12, *(_QWORD *)(a1 + 32));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(*(id *)(a1 + 48), "containsIndex:", v12) & 1) != 0
        || v13 && objc_msgSend(*(id *)(a1 + 48), "containsIndexes:", v13))
      {
        objc_msgSend(*(id *)(a1 + 56), "addIndex:", v12);
      }
      else if (a4)
      {
        objc_msgSend(*(id *)(a1 + 64), "addIndex:", v12);
        v14 = *(void **)(a1 + 72);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v15);

        v21 = 0u;
        v22 = 0u;
        v20 = 0u;
        v16 = *(void **)(a1 + 32);
        if (v16)
        {
          objc_msgSend(v16, "timeRangeForSegmentWithIdentifier:", v12);
          v16 = *(void **)(a1 + 32);
        }
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __82__PXStoryResourcesPreloader__timelineReadingQueue_processRequest_previousRequest___block_invoke_3;
        v18[3] = &unk_1E513EA30;
        v19 = *(_OWORD *)(a1 + 80);
        v17[0] = v20;
        v17[1] = v21;
        v17[2] = v22;
        objc_msgSend(v16, "enumerateClipsInTimeRange:rect:usingBlock:", v17, v18, *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
      }

      ++v10;
      --v9;
    }
    while (v9);
  }
}

uint64_t __82__PXStoryResourcesPreloader__timelineReadingQueue_processRequest_previousRequest___block_invoke_3(uint64_t result, uint64_t a2, int a3, int a4, char *__src)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  _BYTE v15[768];
  uint64_t v16;
  uint64_t v17;

  if (a2 >= 1)
  {
    v16 = v5;
    v17 = v6;
    v8 = a2;
    v9 = result;
    do
    {
      v10 = *(void **)(v9 + 32);
      memcpy(v15, __src, sizeof(v15));
      result = objc_msgSend(v10, "_isClipPreloadable:", v15);
      if ((_DWORD)result)
      {
        v11 = *(void **)(v9 + 32);
        memcpy(v15, __src, sizeof(v15));
        if (objc_msgSend(v11, "_isImagePreloadingNeededForClipInfo:", v15))
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 40) + 8) + 32);
        v12 = *(void **)(v9 + 32);
        memcpy(v15, __src, sizeof(v15));
        result = objc_msgSend(v12, "_isVideoPreloadingNeededForClipInfo:", v15);
        if ((_DWORD)result)
        {
          v13 = *((_QWORD *)__src + 19);
          if (v13 == 5 || v13 == 3)
            v14 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 40) + 8) + 48);
          else
            v14 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 40) + 8) + 40);
          ++*v14;
        }
      }
      __src += 768;
      --v8;
    }
    while (v8);
  }
  return result;
}

void __137__PXStoryResourcesPreloader__timelineReadingQueue_sessionStartedWithAlreadyLoadedSegments_segmentsToLoad_preloadableClipsCounts_request___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  _OWORD v6[3];

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "timeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "timeRangeForSegmentWithIdentifier:", a2);
  else
    memset(v6, 0, sizeof(v6));
  objc_msgSend(v3, "_accumulateLoadedTimeRange:moreExpected:", v6, 1);

}

uint64_t __62__PXStoryResourcesPreloader__estimationQueue_updateEstimation__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(*(id *)(a1 + 32), "indexOfSegmentWithIdentifier:", a2);
  if (result - *(_QWORD *)(a1 + 56) >= 2)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_QWORD *)(v4 + 24) != 0x7FFFFFFFFFFFFFFFLL || result != 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_QWORD *)(v4 + 24) = result;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t __62__PXStoryResourcesPreloader__estimationQueue_updateEstimation__block_invoke_48(uint64_t a1, double a2)
{
  if (*(_BYTE *)(a1 + 44))
    objc_msgSend(*(id *)(a1 + 32), "setIsLoadingLikelyToKeepUpWithPlayback:", *(unsigned __int8 *)(a1 + 45));
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setLoadingFractionComplete:", a2);
}

uint64_t __88__PXStoryResourcesPreloader__estimationNoteClipWithPlaybackStyle_loadedWithLoadingTime___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "noteClipWithPlaybackStyle:loadedWithLoadingTime:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_estimationQueue_updateEstimation");
}

void __75__PXStoryResourcesPreloader__estimationNoteLoadingSegments_loadedSegments___block_invoke(id *a1)
{
  id v2;
  id v3;
  _BOOL4 v4;
  void *v5;
  id v6;
  char v7;
  _QWORD *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  char v14;

  v2 = a1[4];
  v3 = *((id *)a1[5] + 34);
  v4 = v2 != v3;
  if (v2 != v3)
  {
    v5 = v3;
    v6 = v2;
    v7 = objc_msgSend(v6, "isEqual:", v5);

    if ((v7 & 1) != 0)
    {
      v4 = 0;
      goto LABEL_6;
    }
    v8 = a1[5];
    v9 = a1[4];
    v2 = (id)v8[34];
    v8[34] = v9;
  }

LABEL_6:
  v10 = a1[6];
  v11 = *((id *)a1[5] + 35);
  if (v10 == v11)
  {

LABEL_10:
    if (!v4)
      return;
    goto LABEL_11;
  }
  v12 = v11;
  v13 = v10;
  v14 = objc_msgSend(v13, "isEqual:", v12);

  if ((v14 & 1) != 0)
    goto LABEL_10;
  objc_storeStrong((id *)a1[5] + 35, a1[6]);
  objc_msgSend(*((id *)a1[5] + 36), "removeIndexes:", a1[6]);
LABEL_11:
  objc_msgSend(a1[5], "_estimationQueue_updateEstimation");
}

void __111__PXStoryResourcesPreloader__estimationNoteSessionStartedWithSegmentsToLoad_preloadableClipsCounts_inTimeline___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  uint64_t v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 296);
  v10 = *(_OWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v2, "noteSessionStartedPreloadableClipsCounts:", &v10);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304) = mach_absolute_time();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 272);
  *(_QWORD *)(v3 + 272) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = 0;

  v7 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 288);
  *(_QWORD *)(v8 + 288) = v7;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = 1;
}

void __46__PXStoryResourcesPreloader__updateProcessing__block_invoke(id *a1)
{
  id v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v2 = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "_timelineReadingQueue_processRequest:previousRequest:", v2, v3);

}

void __46__PXStoryResourcesPreloader__updateEstimation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_estimationQueue_updateEstimation");

}

uint64_t __138__PXStoryResourcesPreloader__noteLoadingEndedForClip_inSegment_resourceType_resourceIdentifier_timeRange_error_loadingTime_playbackStyle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  id *v9;
  void *v10;
  void *v11;
  _OWORD v13[3];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 240);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 240);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "countForObject:", v5);

  if (!v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "addIndex:", *(_QWORD *)(a1 + 40));
    v7 = *(void **)(a1 + 32);
    v8 = *(_OWORD *)(a1 + 80);
    v13[0] = *(_OWORD *)(a1 + 64);
    v13[1] = v8;
    v13[2] = *(_OWORD *)(a1 + 96);
    objc_msgSend(v7, "_stateQueue_accumulateLoadedTimeRange:moreExpected:", v13, 1);
  }
  v9 = *(id **)(a1 + 32);
  objc_msgSend(v9[30], "objectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_estimationNoteLoadingSegments:loadedSegments:", v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248));

  return objc_msgSend(*(id *)(a1 + 32), "_estimationNoteClipWithPlaybackStyle:loadedWithLoadingTime:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

void __138__PXStoryResourcesPreloader__noteLoadingEndedForClip_inSegment_resourceType_resourceIdentifier_timeRange_error_loadingTime_playbackStyle___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("An error occured when preloading: %@ uuid: %@, clip %ld"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  PXStoryErrorCreateWithCodeUnderlyingErrorDebugDescription(22, v2, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setError:", v3);

}

void __65__PXStoryResourcesPreloader__noteLoadingStartedForClipInSegment___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "containsIndex:", *(_QWORD *)(a1 + 40)))
  {
    PXAssertGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Loaded segment is being loaded once again", v8, 2u);
    }

  }
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 240);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = *(id **)(a1 + 32);
  objc_msgSend(v5[30], "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_estimationNoteLoadingSegments:loadedSegments:", v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248));

}

uint64_t __69__PXStoryResourcesPreloader__accumulateLoadedTimeRange_moreExpected___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  __int128 v3;
  _OWORD v5[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 88);
  v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "_stateQueue_accumulateLoadedTimeRange:moreExpected:", v5, v2);
}

void __116__PXStoryResourcesPreloader__noteSessionStartedWithLoadedSegments_segmentsToLoad_preloadableClipsCounts_inTimeline___block_invoke(uint64_t a1)
{
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "removeAllObjects");
  v2 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 184);
  *v2 = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "removeAllObjects");
  v3 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 248);
  *(_QWORD *)(v4 + 248) = v3;

}

void __45__PXStoryResourcesPreloader_loadedTimeRanges__block_invoke(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  void *v4;
  PXStoryTimeRangeValue *v5;
  __int128 v6;
  __int128 v7;
  PXStoryTimeRangeValue *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _OWORD v15[3];

  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v2 + 196) & 1) != 0
    && ((*(_DWORD *)(v2 + 220) & 1) != 0 ? (v3 = *(_QWORD *)(v2 + 224) == 0) : (v3 = 0),
        v3 && (*(_QWORD *)(v2 + 208) & 0x8000000000000000) == 0))
  {
    v4 = *(void **)(v2 + 176);
    v5 = [PXStoryTimeRangeValue alloc];
    v6 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 184);
    v7 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 216);
    v15[1] = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 200);
    v15[2] = v7;
    v15[0] = v6;
    v8 = -[PXStoryTimeRangeValue initWithStoryTimeRange:](v5, "initWithStoryTimeRange:", v15);
    objc_msgSend(v4, "arrayByAddingObject:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    v12 = objc_msgSend(*(id *)(v2 + 176), "copy");
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

void __38__PXStoryResourcesPreloader_setError___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  char v4;
  id v5;

  v5 = *(id *)(a1 + 32);
  v2 = *(id *)(*(_QWORD *)(a1 + 40) + 120);
  if (v5 == v2)
  {

  }
  else
  {
    v3 = v5;
    v4 = objc_msgSend(v3, "isEqual:", v2);

    if ((v4 & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 120), *(id *)(a1 + 32));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

void __34__PXStoryResourcesPreloader_error__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
}

void __56__PXStoryResourcesPreloader_setLoadingFractionComplete___block_invoke(uint64_t a1)
{
  float v1;
  uint64_t v2;
  float *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  uint64_t v10;
  double v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = *(float *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  if (v1 != *(float *)(v2 + 112))
  {
    *(float *)(v2 + 112) = v1;
    v4 = *(float **)(a1 + 32);
    if (v4[28] >= 1.0)
    {
      PLStoryGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = objc_msgSend(*(id *)(a1 + 32), "logContext");
        v12 = 134217984;
        v13 = v6;
        _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "[Buffering] [Context=%llu] Preloading finished", (uint8_t *)&v12, 0xCu);
      }

      v4 = *(float **)(a1 + 32);
    }
    objc_msgSend(v4, "log");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 32));
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        v10 = objc_msgSend(*(id *)(a1 + 32), "logContext");
        v11 = *(float *)(a1 + 48);
        v12 = 134218240;
        v13 = v10;
        v14 = 2048;
        v15 = v11;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_EVENT, v9, "PXStoryResourcesPreloaderFractionComplete", "Context=%{signpost.telemetry:string2}lu %.2f", (uint8_t *)&v12, 0x16u);
      }
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

float __52__PXStoryResourcesPreloader_loadingFractionComplete__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 112);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __38__PXStoryResourcesPreloader_lagsCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 104);
  return result;
}

uint64_t __68__PXStoryResourcesPreloader_setIsLoadingLikelyToKeepUpWithPlayback___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned __int8 *)(result + 48);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 97))
  {
    v3 = result;
    *(_BYTE *)(v2 + 97) = v1;
    if (!*(_BYTE *)(result + 48))
      ++*(_QWORD *)(*(_QWORD *)(result + 32) + 104);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    result = *(_QWORD *)(result + 32);
    if (!*(_BYTE *)(v3 + 48))
      goto LABEL_10;
    if (*(_BYTE *)(result + 96))
    {
      objc_msgSend((id)result, "log");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = os_signpost_id_make_with_pointer(v4, *(const void **)(v3 + 32));
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v6 = v5;
        if (os_signpost_enabled(v4))
        {
          v7 = objc_msgSend(*(id *)(v3 + 32), "logContext");
          +[PXNetworkStatusMonitor sharedInstance](PXNetworkStatusMonitor, "sharedInstance");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 134218240;
          v14 = v7;
          v15 = 2050;
          v16 = objc_msgSend(v8, "bestAvailableNetworkType");
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryResourcesPreloaderNotLikelyToKeepUp", "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES networkType=%{signpost.telemetry:number1,public}lu ", (uint8_t *)&v13, 0x16u);

        }
      }

      result = *(_QWORD *)(v3 + 32);
      if (!*(_BYTE *)(v3 + 48))
      {
LABEL_10:
        objc_msgSend((id)result, "log");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = os_signpost_id_make_with_pointer(v9, *(const void **)(v3 + 32));
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v11 = v10;
          if (os_signpost_enabled(v9))
          {
            v12 = objc_msgSend(*(id *)(v3 + 32), "logContext");
            v13 = 134217984;
            v14 = v12;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PXStoryResourcesPreloaderNotLikelyToKeepUp", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v13, 0xCu);
          }
        }

        result = *(_QWORD *)(v3 + 32);
      }
    }
    *(_BYTE *)(result + 96) = 1;
  }
  return result;
}

uint64_t __64__PXStoryResourcesPreloader_isLoadingLikelyToKeepUpWithPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 97);
  return result;
}

void __47__PXStoryResourcesPreloader_setCurrentRequest___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(v1 + 160);
  if (*(void **)(a1 + 32) != v2)
  {
    objc_storeStrong((id *)(v1 + 168), v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "setIsCancelled:", 1);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 160), *(id *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __44__PXStoryResourcesPreloader_previousRequest__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 168));
}

void __43__PXStoryResourcesPreloader_currentRequest__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 160));
}

_QWORD *__57__PXStoryResourcesPreloader_setCurrentSegmentIdentifier___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[6];
  v2 = result[4];
  if (v1 != *(_QWORD *)(v2 + 152))
  {
    *(_QWORD *)(v2 + 152) = v1;
    *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = 1;
  }
  return result;
}

uint64_t __53__PXStoryResourcesPreloader_currentSegmentIdentifier__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 152);
  return result;
}

__n128 __52__PXStoryResourcesPreloader_setCurrentPlaybackTime___block_invoke(uint64_t a1)
{
  __int128 v2;
  __n128 result;
  __n128 *v4;
  CMTimeEpoch v5;
  CMTime time2;
  CMTime time1;

  v2 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 128);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
  time1 = *(CMTime *)(a1 + 40);
  *(_OWORD *)&time2.value = v2;
  time2.epoch = v5;
  if (CMTimeCompare(&time1, &time2))
  {
    v4 = (__n128 *)(*(_QWORD *)(a1 + 32) + 128);
    result = *(__n128 *)(a1 + 40);
    v4[1].n128_u64[0] = *(_QWORD *)(a1 + 56);
    *v4 = result;
  }
  return result;
}

__n128 __48__PXStoryResourcesPreloader_currentPlaybackTime__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 128);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

uint64_t __57__PXStoryResourcesPreloader__performChangesOnStoryQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performChanges:", *(_QWORD *)(a1 + 40));
}

@end
