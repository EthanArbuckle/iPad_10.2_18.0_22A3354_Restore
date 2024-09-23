@implementation PXStoryAnalyticsController

- (PXStoryAnalyticsController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryAnalyticsController.m"), 84, CFSTR("%s is not available as initializer"), "-[PXStoryAnalyticsController init]");

  abort();
}

- (PXStoryAnalyticsController)initWithViewModel:(id)a3
{
  id v5;
  PXStoryAnalyticsController *v6;
  PXStoryAnalyticsController *v7;
  uint64_t v8;
  NSString *sessionIdentifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryAnalyticsController;
  v6 = -[PXStoryAnalyticsController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    -[PXStoryViewModel registerChangeObserver:context:](v7->_viewModel, "registerChangeObserver:context:", v7, ViewModelObservationContext_278926);
    -[PXStoryViewModel identifier](v7->_viewModel, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v7->_sessionIdentifier;
    v7->_sessionIdentifier = (NSString *)v8;

    -[PXStoryAnalyticsController _invalidateCurrentModel](v7, "_invalidateCurrentModel");
  }

  return v7;
}

- (void)viewDidAppear
{
  -[PXStoryAnalyticsController setIsSessionActive:](self, "setIsSessionActive:", 1);
}

- (void)viewDidDisappear
{
  -[PXStoryAnalyticsController setIsSessionActive:](self, "setIsSessionActive:", 0);
}

- (void)setIsSessionActive:(BOOL)a3
{
  _BOOL4 isSessionActive;
  void *v5;
  const __CFString *v6;
  void *v7;

  isSessionActive = self->_isSessionActive;
  if (isSessionActive != a3)
  {
    self->_isSessionActive = a3;
    -[PXStoryAnalyticsController _invalidateCurrentViewMode](self, "_invalidateCurrentViewMode");
    v5 = (void *)MEMORY[0x1E0D09910];
    if (self->_isSessionActive)
      v6 = CFSTR("com.apple.photos.memory.interactiveMemorySessionBegan");
    else
      v6 = CFSTR("com.apple.photos.memory.interactiveMemorySessionEnded");
    -[PXStoryAnalyticsController defaultPayload](self, "defaultPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendEvent:withPayload:", v6, v7);

    if (isSessionActive && !self->_isSessionActive)
      -[PXStoryAnalyticsController _collectAnalyticsAtPlaybackEnd](self, "_collectAnalyticsAtPlaybackEnd");
  }
}

- (void)setCurrentModel:(id)a3
{
  PXStoryModel *v5;
  PXStoryModel *currentModel;
  PXStoryModel *v7;

  v5 = (PXStoryModel *)a3;
  currentModel = self->_currentModel;
  if (currentModel != v5)
  {
    v7 = v5;
    -[PXStoryModel unregisterChangeObserver:context:](currentModel, "unregisterChangeObserver:context:", self, CurrentModelObservationContext);
    objc_storeStrong((id *)&self->_currentModel, a3);
    -[PXStoryModel registerChangeObserver:context:](self->_currentModel, "registerChangeObserver:context:", self, CurrentModelObservationContext);
    -[PXStoryAnalyticsController _invalidateCurrentViewMode](self, "_invalidateCurrentViewMode");
    -[PXStoryAnalyticsController setDidPlayStory:](self, "setDidPlayStory:", 0);
    -[PXStoryAnalyticsController setBufferingEventsCount:](self, "setBufferingEventsCount:", 0);
    -[PXStoryAnalyticsController setInitialBufferingDuration:](self, "setInitialBufferingDuration:", 0);
    -[PXStoryAnalyticsController setDidUserChangePlaybackTime:](self, "setDidUserChangePlaybackTime:", 0);
    -[PXStoryAnalyticsController _invalidateDidUserChangePlaybackTime](self, "_invalidateDidUserChangePlaybackTime");
    v5 = v7;
  }

}

- (void)setCurrentViewMode:(int64_t)a3
{
  int64_t currentViewMode;
  int64_t currentViewModeSignpostID;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  currentViewMode = self->_currentViewMode;
  if (currentViewMode != a3)
  {
    currentViewModeSignpostID = self->_currentViewModeSignpostID;
    self->_currentViewMode = a3;
    objc_msgSend((id)objc_opt_class(), "analyticsViewNameForViewMode:", currentViewMode);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = (uint64_t *)MEMORY[0x1E0D09830];
    v9 = (uint64_t *)MEMORY[0x1E0D09868];
    v10 = 0x1E0CB3000;
    if (v6)
    {
      v11 = (void *)MEMORY[0x1E0D09910];
      v12 = *MEMORY[0x1E0D09878];
      v35 = *MEMORY[0x1E0D09830];
      v13 = v35;
      v36[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "endSignpost:forEventName:withPayload:", currentViewModeSignpostID, v12, v14);

      v15 = (void *)MEMORY[0x1E0D09910];
      v16 = *MEMORY[0x1E0D09750];
      v17 = *v9;
      v33[0] = v13;
      v10 = 0x1E0CB3000uLL;
      v33[1] = v17;
      v34[0] = v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", currentViewModeSignpostID);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendEvent:withPayload:", v16, v19);

      v8 = (uint64_t *)MEMORY[0x1E0D09830];
    }
    objc_msgSend((id)objc_opt_class(), "analyticsViewNameForViewMode:", self->_currentViewMode);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = objc_msgSend(MEMORY[0x1E0D09910], "startSignpost");
      v22 = (void *)MEMORY[0x1E0D09910];
      v23 = v8;
      v24 = *MEMORY[0x1E0D09748];
      v25 = *v23;
      v26 = *v9;
      v31[0] = v25;
      v31[1] = v26;
      v32[0] = v20;
      objc_msgSend(*(id *)(v10 + 2024), "numberWithLongLong:", v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sendEvent:withPayload:", v24, v28);

    }
    else
    {
      v21 = 0;
    }
    self->_currentViewModeSignpostID = v21;
    if (-[PXStoryAnalyticsController currentViewMode](self, "currentViewMode") == 2)
    {
      v29 = (void *)objc_opt_class();
      -[PXStoryAnalyticsController currentModel](self, "currentModel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "sendMemoryEvent:model:payload:", CFSTR("com.apple.photos.CPAnalytics.memoryOpened"), v30, MEMORY[0x1E0C9AA70]);

    }
  }
}

- (NSDictionary)defaultPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  -[PXStoryAnalyticsController sessionIdentifier](self, "sessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("interactiveMemorySessionIdentifier"));

  -[PXStoryAnalyticsController currentModel](self, "currentModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAssetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D09818]);

  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D09830]);

  v9 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v9;
}

- (NSDictionary)commonSpinnerRelatedPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PXStoryAnalyticsController defaultPayload](self, "defaultPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PXStoryAnalyticsController currentModel](self, "currentModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentSongResource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_storyResourceSongAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pace");
  PFStoryRecipeSongPaceDescription();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("songPace"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PXStoryAnalyticsController didUserChangePlaybackTime](self, "didUserChangePlaybackTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("userDidInteractiveNavigation"));

  v10 = (void *)objc_msgSend(v4, "copy");
  return (NSDictionary *)v10;
}

- (void)_collectAnalyticsForPlayStateChange
{
  uint64_t v3;
  __CFString **v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXStoryAnalyticsController currentModel](self, "currentModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v9, "desiredPlayState");
  if (v3)
  {
    if (v3 != 1)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = PXStoryAnalyticsEventSessionPlayed;
  }
  else
  {
    v4 = PXStoryAnalyticsEventSessionPaused;
  }
  v5 = *v4;
LABEL_7:
  v6 = (void *)MEMORY[0x1E0D09910];
  -[PXStoryAnalyticsController defaultPayload](self, "defaultPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:withPayload:", v5, v7);

  if (!-[PXStoryAnalyticsController didPlayStory](self, "didPlayStory") && objc_msgSend(v9, "desiredPlayState") == 1)
  {
    objc_msgSend(v9, "currentAssetCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PXStoryAnalyticsController _incrementPlayCountForMemory:](self, "_incrementPlayCountForMemory:", v8);
    -[PXStoryAnalyticsController setDidPlayStory:](self, "setDidPlayStory:", 1);

  }
}

- (void)_incrementPlayCountForMemory:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D09910];
  v7 = *MEMORY[0x1E0D09818];
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.incrementMemoryViewCount"), v6);

}

- (void)_collectAnalyticsForBuffering
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  -[PXStoryAnalyticsController currentModel](self, "currentModel");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v40, "readinessStatus");
  if (v3 == 3)
  {
    -[PXStoryAnalyticsController initialBufferingDuration](self, "initialBufferingDuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[PXStoryAnalyticsController setBufferingEventsCount:](self, "setBufferingEventsCount:", 1);
      -[PXStoryAnalyticsController viewModel](self, "viewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bufferingController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "lastNoncriticalBufferingDuration");
      v10 = v9;
      objc_msgSend(v7, "lastCriticalBufferingDuration");
      objc_msgSend(v8, "numberWithDouble:", v10 + v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryAnalyticsController setInitialBufferingDuration:](self, "setInitialBufferingDuration:", v12);

      -[PXStoryAnalyticsController commonSpinnerRelatedPayload](self, "commonSpinnerRelatedPayload");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "lastNoncriticalBufferingDuration");
      objc_msgSend(v15, "numberWithDouble:", v16 * 1000.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("loadingDelay"));

      v18 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "lastCriticalBufferingDuration");
      objc_msgSend(v18, "numberWithDouble:", v19 * 1000.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("userVisibleSpinnerLoadingDelay"));

      objc_msgSend(v7, "totalBufferingTimeIntervalsPerReason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v21, "objectForKeyedSubscript:", &unk_1E53EF648);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      objc_msgSend(v22, "numberWithDouble:", v24 * 1000.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v25, CFSTR("spinnerReasonMusicFetching"));

      v26 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v21, "objectForKeyedSubscript:", &unk_1E53EF660);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "doubleValue");
      objc_msgSend(v26, "numberWithDouble:", v28 * 1000.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v29, CFSTR("spinnerReasonMusicBuffering"));

      v30 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v21, "objectForKeyedSubscript:", &unk_1E53EF678);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      objc_msgSend(v30, "numberWithDouble:", v32 * 1000.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v33, CFSTR("spinnerReasonAssetsPreloading"));

      v34 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v21, "objectForKeyedSubscript:", &unk_1E53EF690);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "doubleValue");
      objc_msgSend(v34, "numberWithDouble:", v36 * 1000.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v37, CFSTR("spinnerReasonTimelineCreation"));

      v38 = (void *)objc_opt_class();
      -[PXStoryAnalyticsController currentModel](self, "currentModel");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "sendMemoryEvent:model:payload:", CFSTR("com.apple.photos.memory.playbackLaunchPerformance"), v39, v14);

    }
  }
  else if (v3 == 1)
  {
    -[PXStoryAnalyticsController initialBufferingDuration](self, "initialBufferingDuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[PXStoryAnalyticsController setBufferingEventsCount:](self, "setBufferingEventsCount:", -[PXStoryAnalyticsController bufferingEventsCount](self, "bufferingEventsCount") + 1);
  }

}

- (void)_collectAnalyticsAtPlaybackEnd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double Seconds;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  const __CFString *v36;
  double v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  _OWORD v41[3];
  CMTime time;
  uint64_t v43;
  __int128 v44;
  _QWORD v45[4];

  -[PXStoryAnalyticsController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryAnalyticsController currentModel](self, "currentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryAnalyticsController commonSpinnerRelatedPayload](self, "commonSpinnerRelatedPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = -[PXStoryAnalyticsController bufferingEventsCount](self, "bufferingEventsCount");
  if (v8 <= 1)
    v9 = 1;
  else
    v9 = v8;
  objc_msgSend(v7, "numberWithInteger:", v9 - 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("midMemorySpinnerCount"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "bufferingController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "totalBufferingTimeInterval");
  v14 = v13;
  -[PXStoryAnalyticsController initialBufferingDuration](self, "initialBufferingDuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  objc_msgSend(v11, "numberWithDouble:", (v14 - v16) * 1000.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("midMemorySpinnerTotalTime"));

  objc_msgSend((id)objc_opt_class(), "sendMemoryEvent:model:payload:", CFSTR("com.apple.photos.memory.playbackReliability"), v4, v6);
  objc_msgSend(v4, "playbackMaxFractionCompleted");
  v19 = v18;
  objc_msgSend(v4, "playbackFractionCompleted");
  v21 = v20;
  objc_msgSend(v4, "timeline");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "timeRange");
  }
  else
  {
    memset(v45, 0, sizeof(v45));
    v44 = 0u;
  }
  time = *(CMTime *)&v45[1];
  Seconds = CMTimeGetSeconds(&time);

  -[PXStoryAnalyticsController defaultPayload](self, "defaultPayload");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  if (v19 < 1.0)
    v27 = MEMORY[0x1E0C9AAA0];
  else
    v27 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("didPlayToEnd"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 * 100.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("maxPlaybackPercentage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 * Seconds);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, CFSTR("maxPlayTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21 * Seconds);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("playTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)objc_msgSend(v3, "chromeItems") >> 15) & 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v31, CFSTR("spinnerVisible"));

  objc_msgSend((id)objc_opt_class(), "sendMemoryEvent:model:payload:", CFSTR("com.apple.photos.CPAnalytics.memoryPlayed"), v4, v26);
  objc_msgSend(v4, "timeline");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "numberOfSegments");
  if (v33 >= 5)
  {
    v34 = v33;
    time.value = 0;
    *(_QWORD *)&time.timescale = &time;
    time.epoch = 0x2020000000;
    v43 = 0;
    if (v32)
      objc_msgSend(v32, "timeRange");
    else
      memset(v41, 0, sizeof(v41));
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __60__PXStoryAnalyticsController__collectAnalyticsAtPlaybackEnd__block_invoke;
    v40[3] = &unk_1E5144438;
    v40[4] = &time;
    objc_msgSend(v32, "enumerateSegmentsInTimeRange:usingBlock:", v41, v40);
    v35 = (float)*(uint64_t *)(*(_QWORD *)&time.timescale + 24) / (float)v34;
    if (v35 >= 0.5)
    {
      if (v35 >= 0.75)
      {
        v37 = v35;
        if (v37 >= 0.85)
        {
          if (v37 >= 0.95)
            v36 = CFSTR("com.apple.photos.memory.interactiveMemoryTimelinePlayedWith95-100PercentTransitionsOnBar");
          else
            v36 = CFSTR("com.apple.photos.memory.interactiveMemoryTimelinePlayedWith85-94PercentTransitionsOnBar");
        }
        else
        {
          v36 = CFSTR("com.apple.photos.memory.interactiveMemoryTimelinePlayedWith75-84PercentTransitionsOnBar");
        }
      }
      else
      {
        v36 = CFSTR("com.apple.photos.memory.interactiveMemoryTimelinePlayedWith50-74PercentTransitionsOnBar");
      }
    }
    else
    {
      v36 = CFSTR("com.apple.photos.memory.interactiveMemoryTimelinePlayedWith0-49PercentTransitionsOnBar");
    }
    v38 = (void *)objc_opt_class();
    -[PXStoryAnalyticsController defaultPayload](self, "defaultPayload");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sendMemoryEvent:model:payload:", v36, v4, v39);

    _Block_object_dispose(&time, 8);
  }

}

- (void)_updateCurrentModel
{
  void *v3;
  void *v4;
  id v5;

  -[PXStoryAnalyticsController currentModel](self, "currentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PXStoryAnalyticsController _collectAnalyticsAtPlaybackEnd](self, "_collectAnalyticsAtPlaybackEnd");
  -[PXStoryAnalyticsController viewModel](self, "viewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryAnalyticsController setCurrentModel:](self, "setCurrentModel:", v4);

}

- (void)_updateCurrentViewMode
{
  id v3;

  if (-[PXStoryAnalyticsController isSessionActive](self, "isSessionActive"))
  {
    -[PXStoryAnalyticsController viewModel](self, "viewModel");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryAnalyticsController setCurrentViewMode:](self, "setCurrentViewMode:", objc_msgSend(v3, "viewMode"));

  }
  else
  {
    -[PXStoryAnalyticsController setCurrentViewMode:](self, "setCurrentViewMode:", 0);
  }
}

- (void)_updateDidUserChangePlaybackTime
{
  id v3;

  if (!-[PXStoryAnalyticsController didUserChangePlaybackTime](self, "didUserChangePlaybackTime"))
  {
    -[PXStoryAnalyticsController currentModel](self, "currentModel");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryAnalyticsController setDidUserChangePlaybackTime:](self, "setDidUserChangePlaybackTime:", objc_msgSend(v3, "lastPlaybackTimeChangeSource") == 2);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  id v10;

  v10 = a3;
  if ((void *)ViewModelObservationContext_278926 == a5)
  {
    if ((a4 & 0x40) != 0)
      -[PXStoryAnalyticsController _invalidateCurrentModel](self, "_invalidateCurrentModel");
    if ((a4 & 0x2000) != 0)
      -[PXStoryAnalyticsController _invalidateCurrentViewMode](self, "_invalidateCurrentViewMode");
  }
  else
  {
    if ((void *)CurrentModelObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryAnalyticsController.m"), 358, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((a4 & 2) != 0)
    {
      -[PXStoryAnalyticsController _collectAnalyticsForPlayStateChange](self, "_collectAnalyticsForPlayStateChange");
      if ((a4 & 0x200000) == 0)
      {
LABEL_5:
        if ((a4 & 0x10000000000000) == 0)
          goto LABEL_14;
        goto LABEL_13;
      }
    }
    else if ((a4 & 0x200000) == 0)
    {
      goto LABEL_5;
    }
    -[PXStoryAnalyticsController _collectAnalyticsForBuffering](self, "_collectAnalyticsForBuffering");
    if ((a4 & 0x10000000000000) != 0)
LABEL_13:
      -[PXStoryAnalyticsController _invalidateDidUserChangePlaybackTime](self, "_invalidateDidUserChangePlaybackTime");
  }
LABEL_14:

}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)isSessionActive
{
  return self->_isSessionActive;
}

- (PXStoryModel)currentModel
{
  return self->_currentModel;
}

- (int64_t)currentViewMode
{
  return self->_currentViewMode;
}

- (BOOL)didPlayStory
{
  return self->_didPlayStory;
}

- (void)setDidPlayStory:(BOOL)a3
{
  self->_didPlayStory = a3;
}

- (BOOL)didUserChangePlaybackTime
{
  return self->_didUserChangePlaybackTime;
}

- (void)setDidUserChangePlaybackTime:(BOOL)a3
{
  self->_didUserChangePlaybackTime = a3;
}

- (int64_t)bufferingEventsCount
{
  return self->_bufferingEventsCount;
}

- (void)setBufferingEventsCount:(int64_t)a3
{
  self->_bufferingEventsCount = a3;
}

- (NSNumber)initialBufferingDuration
{
  return self->_initialBufferingDuration;
}

- (void)setInitialBufferingDuration:(id)a3
{
  objc_storeStrong((id *)&self->_initialBufferingDuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialBufferingDuration, 0);
  objc_storeStrong((id *)&self->_currentModel, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

uint64_t __60__PXStoryAnalyticsController__collectAnalyticsAtPlaybackEnd__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;

  if (a2 >= 1)
  {
    v4 = (uint64_t *)(a4 + 184);
    do
    {
      v5 = *v4;
      v4 += 25;
      if (v5 >= 2)
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
      --a2;
    }
    while (a2);
  }
  return result;
}

+ (id)analyticsViewNameForViewMode:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("InteractiveMemoryBrowserGrid");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 4)
    return CFSTR("InteractiveMemoryStyleSwitcher");
  else
    return (id)v3;
}

+ (void)sendMemoryEvent:(id)a3 model:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "storyQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__PXStoryAnalyticsController_sendMemoryEvent_model_payload___block_invoke;
  v15[3] = &unk_1E5146098;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  v19 = a1;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(v11, v15);

}

+ (id)memoryPayloadFromStoryModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  _QWORD v28[4];
  CMTime time;

  v4 = a3;
  objc_msgSend(v4, "currentAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CD1638], "analyticsPayloadForMemory:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  }
  v8 = *MEMORY[0x1E0D09810];
  objc_msgSend(MEMORY[0x1E0D09910], "systemPropertyForKey:", *MEMORY[0x1E0D09810]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v8);

  objc_msgSend(v4, "currentSongResource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "px_storyResourceSongAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringForAudioAssetCatalog:", objc_msgSend(v11, "catalog"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("cpa_memory_songType"));

  objc_msgSend(v4, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "launchType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringForLaunchType:assetCollection:", v14, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("cpa_memory_launchType"));

  if ((objc_msgSend(v4, "timelineAttributes") & 2) != 0)
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "timeline");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "timeRange");
    }
    else
    {
      memset(v28, 0, sizeof(v28));
      v27 = 0u;
    }
    time = *(CMTime *)&v28[1];
    objc_msgSend(v16, "numberWithDouble:", CMTimeGetSeconds(&time));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("cpa_memory_duration"));

  }
  objc_msgSend(v4, "resourcesDataSourceManager", v27, v28[0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isDataSourceFinal");

  if (v21)
  {
    v22 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "resourcesDataSourceManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dataSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v24, "numberOfDisplayAssetResources"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("cpa_memory_assetCount"));

  }
  return v6;
}

+ (id)stringForLaunchType:(id)a3 assetCollection:(id)a4
{
  __CFString *v5;
  id v6;
  int v7;
  __CFString *v8;
  __CFString *v9;

  v5 = (__CFString *)a3;
  v6 = a4;
  v7 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("Unknown"));
  v8 = v5;
  if (v7)
  {
    if ((unint64_t)(objc_msgSend(v6, "assetCollectionType") - 1) >= 2)
      v8 = CFSTR("Unknown");
    else
      v8 = CFSTR("Albums");
  }
  v9 = v8;

  return v9;
}

+ (id)stringForAudioAssetCatalog:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("??");
  else
    return off_1E5144468[a3];
}

void __60__PXStoryAnalyticsController_sendMemoryEvent_model_payload___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 56), "memoryPayloadFromStoryModel:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v2);

  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", *(_QWORD *)(a1 + 48), v3);
}

@end
