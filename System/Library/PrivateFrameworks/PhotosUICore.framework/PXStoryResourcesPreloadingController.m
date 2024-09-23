@implementation PXStoryResourcesPreloadingController

- (PXStoryResourcesPreloadingController)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryResourcesPreloadingController.m"), 40, CFSTR("%s is not available as initializer"), "-[PXStoryResourcesPreloadingController initWithObservableModel:]");

  abort();
}

- (PXStoryResourcesPreloadingController)initWithModel:(id)a3 mediaProvider:(id)a4
{
  id v6;
  id v7;
  PXStoryResourcesPreloadingController *v8;
  PXStoryResourcesPreloadingController *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  PXStoryResourcesPreloader *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PXStoryResourcesPreloader *preloader;
  void *v21;
  _QWORD v23[4];
  PXStoryResourcesPreloadingController *v24;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PXStoryResourcesPreloadingController;
  v8 = -[PXStoryController initWithObservableModel:](&v25, sel_initWithObservableModel_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_model, v6);
    objc_msgSend(v6, "extendedTraitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayScale");
    v12 = v11;

    v13 = objc_msgSend(v6, "isExporting");
    v14 = objc_msgSend(v6, "isInline");
    v15 = [PXStoryResourcesPreloader alloc];
    objc_msgSend(v6, "videoSessionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loadingStatusReporter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryController storyQueue](v9, "storyQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PXStoryResourcesPreloader initWithMediaProvider:displayScale:videoSessionManager:loadingStatusReporter:storyQueue:isExporting:isInline:](v15, "initWithMediaProvider:displayScale:videoSessionManager:loadingStatusReporter:storyQueue:isExporting:isInline:", v7, v16, v17, v18, v13, v14, v12);
    preloader = v9->_preloader;
    v9->_preloader = (PXStoryResourcesPreloader *)v19;

    -[PXStoryResourcesPreloadingController log](v9, "log");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryResourcesPreloader setLog:](v9->_preloader, "setLog:", v21);

    -[PXStoryResourcesPreloader setLogContext:](v9->_preloader, "setLogContext:", -[PXStoryResourcesPreloadingController logContext](v9, "logContext"));
    -[PXStoryResourcesPreloader registerChangeObserver:context:](v9->_preloader, "registerChangeObserver:context:", v9, PreloaderObservationContext);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __68__PXStoryResourcesPreloadingController_initWithModel_mediaProvider___block_invoke;
    v23[3] = &unk_1E5148D58;
    v24 = v9;
    -[PXStoryController performChanges:](v24, "performChanges:", v23);

  }
  return v9;
}

- (void)dealloc
{
  PXStoryResourcesPreloader *v3;
  NSObject *v4;
  PXStoryResourcesPreloader *v5;
  objc_super v6;
  _QWORD block[4];
  PXStoryResourcesPreloader *v8;

  v3 = self->_preloader;
  -[PXStoryController storyQueue](self, "storyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PXStoryResourcesPreloadingController_dealloc__block_invoke;
  block[3] = &unk_1E5149198;
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryResourcesPreloadingController;
  -[PXStoryResourcesPreloadingController dealloc](&v6, sel_dealloc);
}

- (void)configureUpdater:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryResourcesPreloadingController;
  v3 = a3;
  -[PXStoryController configureUpdater:](&v4, sel_configureUpdater_, v3);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateCurrentPlaybackTimeOnPreloader, v4.receiver, v4.super_class);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateCurrentSegmentIdentifierOnPreloader);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateCanStartPreloading);
  objc_msgSend(v3, "addUpdateSelector:", sel__updatePreloadingRequest);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateReadinessStatus);

}

- (NSString)diagnosticDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  double Seconds;
  double v10;
  const __CFString *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  const __CFString *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  PXStoryDurationFormatter *v30;
  CMTimeRange v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTime v36;
  CMTimeRange v37;
  CMTime duration;
  CMTimeRange time;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[PXStoryResourcesPreloadingController model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "currentAssetCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v37, 0, sizeof(v37));
    objc_msgSend(v4, "timeline");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "timeRange");
    else
      memset(&v37, 0, sizeof(v37));

    *(_OWORD *)&time.start.value = *(_OWORD *)&v37.start.value;
    time.start.epoch = v37.start.epoch;
    Seconds = CMTimeGetSeconds(&time.start);
    time = v37;
    duration = v37.duration;
    v10 = CMTimeGetSeconds(&duration);
    v30 = objc_alloc_init(PXStoryDurationFormatter);
    if (-[PXStoryResourcesPreloadingController isActive](self, "isActive"))
    {
      if (-[PXStoryResourcesPreloadingController isCompleted](self, "isCompleted"))
      {
        v11 = CFSTR("Completed");
      }
      else if (-[PXStoryResourcesPreloadingController isPreloadingEnabled](self, "isPreloadingEnabled"))
      {
        if (-[PXStoryResourcesPreloadingController canStartPreloading](self, "canStartPreloading"))
          v11 = CFSTR("Preloading");
        else
          v11 = CFSTR("Waiting");
      }
      else
      {
        v11 = CFSTR("Paused");
      }
    }
    else
    {
      v11 = CFSTR("Inactive");
    }
    v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "simulateSlowResourcesBuffering");

    if (v14)
      objc_msgSend(v12, "appendString:", CFSTR("Simulating slow assets buffering!!!\n"));
    objc_msgSend(v12, "appendFormat:", CFSTR("State: %@\n"), v11);
    PXStoryDisplayAssetCollectionShortTitle(v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR("Asset Collection: “%@”, UUID: %@\n"), v15, v16);

    objc_msgSend(v12, "appendString:", CFSTR("["));
    for (i = 0; i != 30; ++i)
    {
      memset(&v36, 0, sizeof(v36));
      CMTimeMakeWithSeconds(&v36, Seconds + v10 * (double)i / 30.0, 600);
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      -[PXStoryResourcesPreloader loadedTimeRanges](self->_preloader, "loadedTimeRanges");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v33;
        while (2)
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
            if (v23)
              objc_msgSend(v23, "storyTimeRange");
            else
              memset(&v31, 0, sizeof(v31));
            duration = v36;
            time = v31;
            if (CMTimeRangeContainsTime(&time, &duration))
            {
              v24 = CFSTR("*");
              goto LABEL_26;
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v20)
            continue;
          break;
        }
      }
      v24 = CFSTR(".");
LABEL_26:

      objc_msgSend(v12, "appendString:", v24);
    }
    -[PXStoryDurationFormatter stringFromTimeInterval:](v30, "stringFromTimeInterval:", v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR("] %@\n"), v25);

    objc_msgSend(v4, "playbackFractionCompleted");
    objc_msgSend(&stru_1E5149688, "stringByPaddingToLength:withString:startingAtIndex:", (unint64_t)(v26 * 30.0), CFSTR(" "), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(" %@^\n"), v27);

    -[PXStoryResourcesPreloader diagnosticDescription](self->_preloader, "diagnosticDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR("%@\n"), v28);

    v8 = (__CFString *)objc_msgSend(v12, "copy");
  }
  else
  {
    v8 = CFSTR("n/a");
  }

  return (NSString *)v8;
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXStoryResourcesPreloadingController _invalidateCanStartPreloading](self, "_invalidateCanStartPreloading");
    -[PXStoryResourcesPreloadingController _invalidateReadinessStatus](self, "_invalidateReadinessStatus");
  }
}

- (void)setIsSongResourcesPreloadingEnabled:(BOOL)a3
{
  if (self->_isSongResourcesPreloadingEnabled != a3)
  {
    self->_isSongResourcesPreloadingEnabled = a3;
    -[PXStoryResourcesPreloadingController _invalidateCanStartPreloading](self, "_invalidateCanStartPreloading");
  }
}

- (void)setShouldSkipInitialSegment:(BOOL)a3
{
  if (self->_shouldSkipInitialSegment != a3)
  {
    self->_shouldSkipInitialSegment = a3;
    -[PXStoryResourcesPreloadingController _invalidatePreloadingRequest](self, "_invalidatePreloadingRequest");
  }
}

- (void)setCanStartPreloading:(BOOL)a3
{
  if (self->_canStartPreloading != a3)
  {
    self->_canStartPreloading = a3;
    -[PXStoryResourcesPreloadingController _invalidatePreloadingRequest](self, "_invalidatePreloadingRequest");
  }
}

- (void)setError:(id)a3
{
  NSError *v5;
  char v6;
  NSError *v7;

  v7 = (NSError *)a3;
  v5 = self->_error;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSError isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_error, a3);
      -[PXStoryResourcesPreloadingController signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setLoadingFractionComplete:(float)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_loadingFractionComplete = a3;
    -[PXStoryResourcesPreloadingController signalChange:](self, "signalChange:", 2);
  }
}

- (void)setIsCompleted:(BOOL)a3
{
  if (self->_isCompleted != a3)
  {
    self->_isCompleted = a3;
    -[PXStoryResourcesPreloadingController signalChange:](self, "signalChange:", 1);
  }
}

- (unint64_t)isCompletedChangeDescriptor
{
  return 1;
}

- (void)setIsPreloadingEnabled:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_isPreloadingEnabled != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __63__PXStoryResourcesPreloadingController_setIsPreloadingEnabled___block_invoke;
    v3[3] = &unk_1E5148DC0;
    v3[4] = self;
    v4 = a3;
    -[PXStoryController performChanges:](self, "performChanges:", v3);
  }
}

- (void)_invalidateCanStartPreloading
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCanStartPreloading);

}

- (void)_updateCanStartPreloading
{
  _BOOL8 v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;

  if (-[PXStoryResourcesPreloadingController isActive](self, "isActive"))
    v3 = -[PXStoryResourcesPreloadingController isPreloadingEnabled](self, "isPreloadingEnabled");
  else
    v3 = 0;
  -[PXStoryResourcesPreloadingController model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "options");

  if (v3)
  {
    if ((v5 & 1) != 0)
      v6 = 2;
    else
      v6 = 1;
    -[PXStoryResourcesPreloadingController model](self, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (objc_msgSend(v7, "timelineAttributes") & v6) != 0;

  }
  -[PXStoryResourcesPreloadingController setCanStartPreloading:](self, "setCanStartPreloading:", v3);
}

- (void)_invalidatePreloadingRequest
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePreloadingRequest);

}

- (void)_updatePreloadingRequest
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  PXStoryResourcesPreloadingRequest *v9;
  uint64_t v10;
  uint64_t v11;
  PXStoryResourcesPreloadingRequest *v12;
  void *v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PXStoryResourcesPreloadingRequest *v19;
  uint64_t v20;
  PXStoryResourcesPreloadingRequest *v21;
  void *v22;
  PXStoryResourcesPreloader *preloader;
  PXStoryResourcesPreloadingRequest *v24;
  _QWORD v25[4];
  PXStoryResourcesPreloadingRequest *v26;

  if (-[PXStoryResourcesPreloadingController canStartPreloading](self, "canStartPreloading"))
  {
    -[PXStoryResourcesPreloadingController model](self, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeline");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryResourcesPreloadingController model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "options");

    if ((v6 & 1) != 0)
    {
      v9 = [PXStoryResourcesPreloadingRequest alloc];
      v10 = objc_msgSend(v3, "timelineAttributes");
      v11 = objc_msgSend(v4, "firstSegmentIdentifier");
      v12 = v9;
      v13 = v4;
      v14 = v10;
      v15 = 0;
      goto LABEL_12;
    }
    -[PXStoryResourcesPreloader currentRequest](self->_preloader, "currentRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v4)
    {
      v16 = objc_msgSend(v3, "lastPlaybackTimeChangeSource");

      if (v16 != 2)
        goto LABEL_16;
    }
    else
    {

    }
    if (objc_msgSend(v4, "numberOfSegments") >= 1)
    {
      if (objc_msgSend(v3, "currentSegmentIdentifier"))
        v17 = objc_msgSend(v3, "currentSegmentIdentifier");
      else
        v17 = objc_msgSend(v4, "firstSegmentIdentifier");
      v18 = v17;
      v19 = [PXStoryResourcesPreloadingRequest alloc];
      v20 = objc_msgSend(v3, "timelineAttributes");
      v15 = -[PXStoryResourcesPreloadingController shouldSkipInitialSegment](self, "shouldSkipInitialSegment");
      v12 = v19;
      v13 = v4;
      v14 = v20;
      v11 = v18;
LABEL_12:
      v21 = -[PXStoryResourcesPreloadingRequest initWithTimeline:timelineAttributes:startingSegmentIdentifier:shouldIgnoreStartingSegmentIdentifier:](v12, "initWithTimeline:timelineAttributes:startingSegmentIdentifier:shouldIgnoreStartingSegmentIdentifier:", v13, v14, v11, v15);
      if (v21)
      {
        if (-[PXStoryResourcesPreloadingController isSongResourcesPreloadingEnabled](self, "isSongResourcesPreloadingEnabled"))
        {
          objc_msgSend(v3, "currentSongResource");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXStoryResourcesPreloadingRequest setSongResource:](v21, "setSongResource:", v22);

        }
        preloader = self->_preloader;
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __64__PXStoryResourcesPreloadingController__updatePreloadingRequest__block_invoke;
        v25[3] = &unk_1E5148DE8;
        v26 = v21;
        v24 = v21;
        -[PXStoryResourcesPreloader performChanges:](preloader, "performChanges:", v25);

      }
    }
LABEL_16:

  }
}

- (void)_invalidateCurrentPlaybackTimeOnPreloader
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentPlaybackTimeOnPreloader);

}

- (void)_updateCurrentPlaybackTimeOnPreloader
{
  PXStoryResourcesPreloader *preloader;
  _QWORD v3[5];

  preloader = self->_preloader;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__PXStoryResourcesPreloadingController__updateCurrentPlaybackTimeOnPreloader__block_invoke;
  v3[3] = &unk_1E5148DE8;
  v3[4] = self;
  -[PXStoryResourcesPreloader performChanges:](preloader, "performChanges:", v3);
}

- (void)_invalidateCurrentSegmentIdentifierOnPreloader
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentSegmentIdentifierOnPreloader);

}

- (void)_updateCurrentSegmentIdentifierOnPreloader
{
  PXStoryResourcesPreloader *preloader;
  _QWORD v3[5];

  preloader = self->_preloader;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82__PXStoryResourcesPreloadingController__updateCurrentSegmentIdentifierOnPreloader__block_invoke;
  v3[3] = &unk_1E5148DE8;
  v3[4] = self;
  -[PXStoryResourcesPreloader performChanges:](preloader, "performChanges:", v3);
}

- (void)_invalidateReadinessStatus
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateReadinessStatus);

}

- (void)_updateReadinessStatus
{
  float v3;
  float v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  PXStoryResourcesPreloadingController *v34;
  id v35;
  float v36;
  BOOL v37;
  _QWORD v38[5];
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  int64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[PXStoryResourcesPreloader loadingFractionComplete](self->_preloader, "loadingFractionComplete");
  v4 = v3;
  -[PXStoryResourcesPreloadingController model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "options") & 1;

  if (v4 < 1.0)
    v7 = 1;
  else
    v7 = 3;
  if (v4 < 1.0 && v6 == 0)
  {
    if (-[PXStoryResourcesPreloader isLoadingLikelyToKeepUpWithPlayback](self->_preloader, "isLoadingLikelyToKeepUpWithPlayback")&& (-[PXStoryResourcesPreloader currentRequest](self->_preloader, "currentRequest"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v9, "timelineAttributes"), v9, (v10 & 2) != 0))
    {
      v7 = 3;
    }
    else
    {
      v7 = -[PXStoryResourcesPreloadingController canStartPreloading](self, "canStartPreloading");
    }
  }
  -[PXStoryResourcesPreloadingController model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "desiredPlayState");

  if (v12 == 1)
  {
    -[PXStoryResourcesPreloadingController model](self, "model");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "contentReadinessStatus");

    if (v14 != v7)
    {
      if (v7 == 1)
      {
        -[PXStoryResourcesPreloadingController setBufferingEvents:](self, "setBufferingEvents:", -[PXStoryResourcesPreloadingController bufferingEvents](self, "bufferingEvents") + 1);
        -[PXStoryResourcesPreloadingController log](self, "log");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = os_signpost_id_make_with_pointer(v15, self);
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v17 = v16;
          if (os_signpost_enabled(v15))
          {
            *(_DWORD *)buf = 134217984;
            v40 = -[PXStoryResourcesPreloadingController logContext](self, "logContext");
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PXStoryResourcesPreloadingController.Buffering", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
          }
        }
LABEL_27:

        goto LABEL_28;
      }
      if (v7 == 3 && v14 == 1)
      {
        -[PXStoryResourcesPreloadingController log](self, "log");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v19 = os_signpost_id_make_with_pointer(v15, self);
        if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v20 = v19;
          if (os_signpost_enabled(v15))
          {
            v21 = -[PXStoryResourcesPreloadingController logContext](self, "logContext");
            +[PXNetworkStatusMonitor sharedInstance](PXNetworkStatusMonitor, "sharedInstance");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218496;
            v40 = v21;
            v41 = 2050;
            v42 = objc_msgSend(v22, "bestAvailableNetworkType");
            v43 = 2050;
            v44 = -[PXStoryResourcesPreloadingController bufferingEvents](self, "bufferingEvents");
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_END, v20, "PXStoryResourcesPreloadingController.Buffering", "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES networkType=%{signpost.telemetry:number1,public}lu bufferingEvents=%{signpost.telemetry:number2,public}lu", buf, 0x20u);

          }
        }
        goto LABEL_27;
      }
    }
  }
LABEL_28:
  -[PXStoryResourcesPreloadingController model](self, "model");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __62__PXStoryResourcesPreloadingController__updateReadinessStatus__block_invoke;
  v38[3] = &__block_descriptor_40_e31_v16__0___PXStoryMutableModel__8l;
  v38[4] = v7;
  objc_msgSend(v23, "performChanges:", v38);

  -[PXStoryResourcesPreloader error](self->_preloader, "error");
  v30 = v24;
  v31 = 3221225472;
  v32 = __62__PXStoryResourcesPreloadingController__updateReadinessStatus__block_invoke_2;
  v33 = &unk_1E5148E30;
  v34 = self;
  v37 = v4 >= 1.0;
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v35 = v25;
  v36 = v4;
  -[PXStoryController performChanges:](self, "performChanges:", &v30);
  objc_msgSend(v25, "domain", v30, v31, v32, v33, v34);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v26, "isEqualToString:", CFSTR("PXStoryErrorDomain")))
  {
LABEL_31:

    goto LABEL_32;
  }
  v27 = objc_msgSend(v25, "code");

  if (v27 == 22)
  {
    -[PXStoryResourcesPreloadingController model](self, "model");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "reportNetworkRelatedPlaybackFailure");
    goto LABEL_31;
  }
LABEL_32:
  -[PXStoryResourcesPreloadingController model](self, "model");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "errorReporter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setError:forComponent:", v25, CFSTR("Assets preloading"));

}

- (void)handleModelChange:(unint64_t)a3
{
  _QWORD v5[6];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryResourcesPreloadingController;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PXStoryResourcesPreloadingController_handleModelChange___block_invoke;
  v5[3] = &unk_1E5148E60;
  v5[4] = self;
  v5[5] = a3;
  -[PXStoryController performChanges:](self, "performChanges:", v5);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  objc_super v5;
  _QWORD v6[6];

  if ((void *)PreloaderObservationContext == a5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__PXStoryResourcesPreloadingController_observable_didChange_context___block_invoke;
    v6[3] = &unk_1E5148E60;
    v6[4] = self;
    v6[5] = a4;
    -[PXStoryController performChanges:](self, "performChanges:", v6);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PXStoryResourcesPreloadingController;
    -[PXStoryController observable:didChange:context:](&v5, sel_observable_didChange_context_, a3, a4);
  }
}

- (BOOL)isCompleted
{
  return self->_isCompleted;
}

- (BOOL)isPreloadingEnabled
{
  return self->_isPreloadingEnabled;
}

- (PXStoryModel)model
{
  return (PXStoryModel *)objc_loadWeakRetained((id *)&self->_model);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)isSongResourcesPreloadingEnabled
{
  return self->_isSongResourcesPreloadingEnabled;
}

- (BOOL)shouldSkipInitialSegment
{
  return self->_shouldSkipInitialSegment;
}

- (float)loadingFractionComplete
{
  return self->_loadingFractionComplete;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)canStartPreloading
{
  return self->_canStartPreloading;
}

- (int64_t)bufferingEvents
{
  return self->_bufferingEvents;
}

- (void)setBufferingEvents:(int64_t)a3
{
  self->_bufferingEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_model);
  objc_storeStrong((id *)&self->_preloader, 0);
}

uint64_t __69__PXStoryResourcesPreloadingController_observable_didChange_context___block_invoke(uint64_t result)
{
  if ((*(_BYTE *)(result + 40) & 7) != 0)
    return objc_msgSend(*(id *)(result + 32), "_invalidateReadinessStatus");
  return result;
}

void __58__PXStoryResourcesPreloadingController_handleModelChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 0x20000000) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCanStartPreloading");
    v3 = *(_QWORD *)(a1 + 40);
  }
  if ((v3 & 0x20000030) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidatePreloadingRequest");
    objc_msgSend(*(id *)(a1 + 32), "_invalidateReadinessStatus");
    v3 = *(_QWORD *)(a1 + 40);
  }
  if ((v3 & 0x400) != 0 && objc_msgSend(*(id *)(a1 + 32), "isSongResourcesPreloadingEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "_invalidatePreloadingRequest");
  v4 = *(_QWORD *)(a1 + 40);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentPlaybackTimeOnPreloader");
    v4 = *(_QWORD *)(a1 + 40);
  }
  if ((v4 & 0x20) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentSegmentIdentifierOnPreloader");

}

uint64_t __62__PXStoryResourcesPreloadingController__updateReadinessStatus__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentReadinessStatus:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__PXStoryResourcesPreloadingController__updateReadinessStatus__block_invoke_2(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(a1 + 32), "setIsCompleted:", *(unsigned __int8 *)(a1 + 52));
  objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
  LODWORD(v2) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "setLoadingFractionComplete:", v2);
}

void __82__PXStoryResourcesPreloadingController__updateCurrentSegmentIdentifierOnPreloader__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "model");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentSegmentIdentifier:", objc_msgSend(v4, "currentSegmentIdentifier"));

}

void __77__PXStoryResourcesPreloadingController__updateCurrentPlaybackTimeOnPreloader__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "nominalPlaybackTime");
  }
  else
  {
    v8 = 0uLL;
    v9 = 0;
  }
  v6 = v8;
  v7 = v9;
  objc_msgSend(v3, "setCurrentPlaybackTime:", &v6);

}

uint64_t __64__PXStoryResourcesPreloadingController__updatePreloadingRequest__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startProcessingRequest:", *(_QWORD *)(a1 + 32));
}

uint64_t __63__PXStoryResourcesPreloadingController_setIsPreloadingEnabled___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 129) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCanStartPreloading");
}

uint64_t __47__PXStoryResourcesPreloadingController_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performChanges:", &__block_literal_global_301026);
}

uint64_t __47__PXStoryResourcesPreloadingController_dealloc__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancelProcessingAllRequests");
}

uint64_t __68__PXStoryResourcesPreloadingController_initWithModel_mediaProvider___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentPlaybackTimeOnPreloader");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentSegmentIdentifierOnPreloader");
}

@end
