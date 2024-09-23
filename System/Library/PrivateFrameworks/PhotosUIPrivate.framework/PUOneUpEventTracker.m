@implementation PUOneUpEventTracker

- (PUOneUpEventTracker)initWithViewName:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 85, CFSTR("%s is not available as initializer"), "-[PUOneUpEventTracker initWithViewName:]");

  abort();
}

- (PUOneUpEventTracker)initWithViewModel:(id)a3 presentationOrigin:(int64_t)a4
{
  id v7;
  const __CFString *v8;
  PUOneUpEventTracker *v9;
  PUOneUpEventTracker *v10;
  void *v11;
  uint64_t v12;
  PXAssetMetadataDonator *assetMetadataDonator;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *biomeRequestQueue;
  objc_super v18;

  v7 = a3;
  if (a4 > 15)
  {
    if (a4 != 16)
    {
      if (a4 == 44)
      {
        v8 = CFSTR("OneUp_DuplicatesAlbum");
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    v8 = CFSTR("OneUp_ForYouContentSyndication");
  }
  else
  {
    if (a4 != 14)
    {
      if (a4 == 15)
      {
        v8 = CFSTR("OneUp_ForYouFeaturedSuggestion");
        goto LABEL_11;
      }
LABEL_8:
      v8 = CFSTR("OneUp");
      goto LABEL_11;
    }
    v8 = CFSTR("OneUp_ForYouSharedAlbumsActivity");
  }
LABEL_11:
  v18.receiver = self;
  v18.super_class = (Class)PUOneUpEventTracker;
  v9 = -[PXMediaViewControllerEventTracker initWithViewName:](&v18, sel_initWithViewName_, v8);
  v10 = v9;
  if (v9)
  {
    v9->_presentationOrigin = a4;
    -[PUOneUpEventTracker registerChangeObserver:context:](v9, "registerChangeObserver:context:", v9, EventTrackerObservationContext);
    -[PXUserInterfaceElementEventTracker updater](v10, "updater");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addUpdateSelector:", sel__updateIsSessionActive);
    objc_msgSend(v11, "addUpdateSelector:", sel__updateCurrentlyViewedAsset);
    objc_msgSend(v11, "addUpdateSelector:", sel__updateCurrentVideoPlayer);
    objc_msgSend(v11, "addUpdateSelector:", sel__updateCurrentVideoProperties);
    objc_msgSend(v11, "addUpdateSelector:", sel__updateOneUpInfoPanelShowingSignpost);
    objc_storeStrong((id *)&v10->_viewModel, a3);
    -[PUBrowsingViewModel registerChangeObserver:](v10->_viewModel, "registerChangeObserver:", v10);
    objc_msgSend(MEMORY[0x1E0D7B1E8], "sharedDonator");
    v12 = objc_claimAutoreleasedReturnValue();
    assetMetadataDonator = v10->_assetMetadataDonator;
    v10->_assetMetadataDonator = (PXAssetMetadataDonator *)v12;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.photosui.eventTracker.biome", v14);
    biomeRequestQueue = v10->_biomeRequestQueue;
    v10->_biomeRequestQueue = (OS_dispatch_queue *)v15;

  }
  return v10;
}

- (void)_invalidateIsSessionActive
{
  id v2;

  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateIsSessionActive);

}

- (void)_updateIsSessionActive
{
  -[PUOneUpEventTracker setIsSessionActive:](self, "setIsSessionActive:", -[PXViewControllerEventTracker isViewVisible](self, "isViewVisible"));
}

- (void)_invalidateCurrentlyViewedAsset
{
  id v2;

  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentlyViewedAsset);

}

- (void)_updateCurrentlyViewedAsset
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  -[PUOneUpEventTracker viewModel](self, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "browsingSpeedRegime");
  v4 = 0;
  if (-[PXViewControllerEventTracker isViewVisible](self, "isViewVisible") && v3 <= 1)
  {
    objc_msgSend(v6, "currentAssetReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PUOneUpEventTracker setDisplayedAsset:](self, "setDisplayedAsset:", v4);

}

- (void)_invalidateCurrentVideoPlayer
{
  id v2;

  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentVideoPlayer);

}

- (void)_updateCurrentVideoPlayer
{
  void *v3;
  id v4;

  if (-[PXViewControllerEventTracker isViewVisible](self, "isViewVisible"))
  {
    -[PUOneUpEventTracker viewModel](self, "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "videoPlayer");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  -[PUOneUpEventTracker setCurrentVideoPlayer:](self, "setCurrentVideoPlayer:", v4);

}

- (void)_invalidateCurrentVideoProperties
{
  id v2;

  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentVideoProperties);

}

- (void)_updateCurrentVideoProperties
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL8 v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  -[PUOneUpEventTracker currentVideoPlayer](self, "currentVideoPlayer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v15, "isPlaybackDesired");
  if (v3)
  {
    objc_msgSend(v15, "playerItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isFileURL");

      if ((v7 & 1) == 0)
      {
        v8 = objc_msgSend(v15, "playState") == 3;
        v9 = objc_msgSend(v15, "isStalled");
        v10 = 1;
        goto LABEL_7;
      }
    }
    else
    {

    }
  }
  v8 = 0;
  v10 = 0;
  v9 = 0;
LABEL_7:
  -[PUOneUpEventTracker currentVideoAsset](self, "currentVideoAsset");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v3)
    v13 = v11;
  else
    v13 = 0;
  -[PUOneUpEventTracker setCurrentlyPlayingVideoAsset:](self, "setCurrentlyPlayingVideoAsset:", v13);
  if (v10)
    v14 = v12;
  else
    v14 = 0;
  -[PUOneUpEventTracker setCurrentlyStreamingVideoAsset:](self, "setCurrentlyStreamingVideoAsset:", v14);
  -[PUOneUpEventTracker setCurrentlyStreamingVideoIsActuallyPlaying:](self, "setCurrentlyStreamingVideoIsActuallyPlaying:", v8);
  -[PUOneUpEventTracker setCurrentlyStreamingVideoIsStalled:](self, "setCurrentlyStreamingVideoIsStalled:", v9);

}

- (void)_invalidateOneUpInfoPanelShowingSignpost
{
  id v2;

  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateOneUpInfoPanelShowingSignpost);

}

- (void)_updateOneUpInfoPanelShowingSignpost
{
  if (!-[PUOneUpEventTracker isSessionActive](self, "isSessionActive"))
    -[PUOneUpEventTracker setCurrentlyShowingInfoPanelSignpost:](self, "setCurrentlyShowingInfoPanelSignpost:", 0);
}

- (void)setIsSessionActive:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_isSessionActive != a3)
  {
    v3 = a3;
    if (self->_isSessionActive)
      -[PUOneUpEventTracker _logDidEndSession](self, "_logDidEndSession");
    self->_isSessionActive = v3;
    if (v3)
      -[PUOneUpEventTracker _logDidStartSession](self, "_logDidStartSession");
  }
}

- (void)setCurrentVideoPlayer:(id)a3
{
  PUBrowsingVideoPlayer *v5;
  PUBrowsingVideoPlayer **p_currentVideoPlayer;
  PUBrowsingVideoPlayer *currentVideoPlayer;
  PUDisplayAsset *v8;
  PUDisplayAsset *currentVideoAsset;
  PUBrowsingVideoPlayer *v10;

  v5 = (PUBrowsingVideoPlayer *)a3;
  p_currentVideoPlayer = &self->_currentVideoPlayer;
  currentVideoPlayer = self->_currentVideoPlayer;
  if (currentVideoPlayer != v5)
  {
    v10 = v5;
    -[PUBrowsingVideoPlayer unregisterChangeObserver:](currentVideoPlayer, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_currentVideoPlayer, a3);
    -[PUBrowsingVideoPlayer registerChangeObserver:](*p_currentVideoPlayer, "registerChangeObserver:", self);
    -[PUBrowsingVideoPlayer asset](*p_currentVideoPlayer, "asset");
    v8 = (PUDisplayAsset *)objc_claimAutoreleasedReturnValue();
    currentVideoAsset = self->_currentVideoAsset;
    self->_currentVideoAsset = v8;

    -[PUOneUpEventTracker _invalidateCurrentVideoProperties](self, "_invalidateCurrentVideoProperties");
    v5 = v10;
  }

}

- (void)setCurrentlyPlayingVideoAsset:(id)a3
{
  PUDisplayAsset **p_currentlyPlayingVideoAsset;
  PUDisplayAsset *v6;
  char v7;
  double v8;
  PUDisplayAsset *v9;

  v9 = (PUDisplayAsset *)a3;
  p_currentlyPlayingVideoAsset = &self->_currentlyPlayingVideoAsset;
  v6 = self->_currentlyPlayingVideoAsset;
  if (v6 == v9)
  {

  }
  else
  {
    v7 = -[PUDisplayAsset isEqual:](v9, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      if (*p_currentlyPlayingVideoAsset)
      {
        -[PXUserInterfaceElementEventTracker timeIntervalSinceTimestamp:](self, "timeIntervalSinceTimestamp:", self->_currentlyPlayingVideoAssetTimestamp);
        -[PUOneUpEventTracker _logDidEndPlayingVideoAsset:duration:](self, "_logDidEndPlayingVideoAsset:duration:", *p_currentlyPlayingVideoAsset);
      }
      objc_storeStrong((id *)&self->_currentlyPlayingVideoAsset, a3);
      -[PXUserInterfaceElementEventTracker currentTimestamp](self, "currentTimestamp");
      self->_currentlyPlayingVideoAssetTimestamp = v8;
      if (*p_currentlyPlayingVideoAsset)
        -[PUOneUpEventTracker _logDidStartPlayingVideoAsset:](self, "_logDidStartPlayingVideoAsset:");
    }
  }

}

- (void)setCurrentlyStreamingVideoAsset:(id)a3
{
  PUDisplayAsset **p_currentlyStreamingVideoAsset;
  PUDisplayAsset *v6;
  char v7;
  PUDisplayAsset *v8;

  v8 = (PUDisplayAsset *)a3;
  p_currentlyStreamingVideoAsset = &self->_currentlyStreamingVideoAsset;
  v6 = self->_currentlyStreamingVideoAsset;
  if (v6 == v8)
  {

  }
  else
  {
    v7 = -[PUDisplayAsset isEqual:](v8, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      if (*p_currentlyStreamingVideoAsset)
        -[PUOneUpEventTracker _logWillEndPlaybackOfStreamedVideoAsset:](self, "_logWillEndPlaybackOfStreamedVideoAsset:");
      objc_storeStrong((id *)&self->_currentlyStreamingVideoAsset, a3);
      if (*p_currentlyStreamingVideoAsset)
      {
        -[PUOneUpEventTracker setCurrentlyStreamingVideoStallsCount:](self, "setCurrentlyStreamingVideoStallsCount:", 0);
        -[PUOneUpEventTracker setCurrentlyStreamingVideoDidStartActualPlayback:](self, "setCurrentlyStreamingVideoDidStartActualPlayback:", 0);
        -[PUOneUpEventTracker _logDidStartPlaybackOfStreamedVideoAsset:](self, "_logDidStartPlaybackOfStreamedVideoAsset:", *p_currentlyStreamingVideoAsset);
      }
    }
  }

}

- (void)setCurrentlyStreamingVideoIsActuallyPlaying:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (self->_currentlyStreamingVideoIsActuallyPlaying != a3)
  {
    self->_currentlyStreamingVideoIsActuallyPlaying = a3;
    if (a3)
    {
      -[PUOneUpEventTracker setCurrentlyStreamingVideoDidStartActualPlayback:](self, "setCurrentlyStreamingVideoDidStartActualPlayback:", 1);
      if (self->_currentlyStreamingVideoAsset)
      {
        -[PUOneUpEventTracker _logDidStartActualPlaybackOfStreamedVideoAsset:](self, "_logDidStartActualPlaybackOfStreamedVideoAsset:");
      }
      else
      {
        PXAssertGetLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v5 = 0;
          _os_log_error_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_ERROR, "No currently streaming video asset when actual playback did start", v5, 2u);
        }

      }
    }
  }
}

- (void)setCurrentlyStreamingVideoIsStalled:(BOOL)a3
{
  if (self->_currentlyStreamingVideoIsStalled != a3)
  {
    self->_currentlyStreamingVideoIsStalled = a3;
    if (a3)
      -[PUOneUpEventTracker setCurrentlyStreamingVideoStallsCount:](self, "setCurrentlyStreamingVideoStallsCount:", -[PUOneUpEventTracker currentlyStreamingVideoStallsCount](self, "currentlyStreamingVideoStallsCount") + 1);
  }
}

- (void)setDisplayedAsset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  double v8;
  void *currentlyViewedAssetGeneration;
  dispatch_time_t v10;
  _QWORD block[4];
  id v12[2];
  id location;
  objc_super v14;

  v4 = a3;
  -[PXMediaViewControllerEventTracker displayedAsset](self, "displayedAsset");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v14.receiver = self;
      v14.super_class = (Class)PUOneUpEventTracker;
      -[PXMediaViewControllerEventTracker setDisplayedAsset:](&v14, sel_setDisplayedAsset_, v4);
      -[PXUserInterfaceElementEventTracker currentTimestamp](self, "currentTimestamp");
      self->_currentlyViewedAssetTimestamp = v8;
      ++self->_currentlyViewedAssetGeneration;
      if (v4)
      {
        objc_initWeak(&location, self);
        currentlyViewedAssetGeneration = (void *)self->_currentlyViewedAssetGeneration;
        v10 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __41__PUOneUpEventTracker_setDisplayedAsset___block_invoke;
        block[3] = &unk_1E58A79B8;
        objc_copyWeak(v12, &location);
        v12[1] = currentlyViewedAssetGeneration;
        dispatch_after(v10, MEMORY[0x1E0C80D38], block);
        objc_destroyWeak(v12);
        objc_destroyWeak(&location);
      }
    }
  }

}

- (void)logDidStartViewingMedia:(id)a3 mediaKind:(int64_t)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 285, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("media != nil"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PUOneUpEventTracker;
  -[PXMediaViewControllerEventTracker logDidStartViewingMedia:mediaKind:](&v17, sel_logDidStartViewingMedia_mediaKind_, v7, a4);
  if (-[PUOneUpEventTracker currentAssetSignpost](self, "currentAssetSignpost"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.currentAssetSignpost == CPAnalyticsSignpostIDNull"));

  }
  -[PUOneUpEventTracker setCurrentAssetSignpost:](self, "setCurrentAssetSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));
  v8 = (void *)MEMORY[0x1E0D09910];
  v9 = *MEMORY[0x1E0D09748];
  v18[0] = *MEMORY[0x1E0D09830];
  -[PXMediaViewControllerEventTracker viewName](self, "viewName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v18[1] = *MEMORY[0x1E0D09868];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PUOneUpEventTracker currentAssetSignpost](self, "currentAssetSignpost"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:withPayload:", v9, v13);

  if (-[PUOneUpEventTracker currentAssetDisplayIntervalSignpost](self, "currentAssetDisplayIntervalSignpost"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.currentAssetDisplayIntervalSignpost == CPAnalyticsSignpostIDNull"));

  }
  -[PUOneUpEventTracker setCurrentAssetDisplayIntervalSignpost:](self, "setCurrentAssetDisplayIntervalSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));

}

- (void)logDidEndViewingMedia:(id)a3 mediaKind:(int64_t)a4 duration:(double)a5
{
  id v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  objc_super v35;
  uint64_t v36;
  id v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[3];
  _QWORD v43[5];

  v43[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("media != nil"));

  }
  v35.receiver = self;
  v35.super_class = (Class)PUOneUpEventTracker;
  -[PXMediaViewControllerEventTracker logDidEndViewingMedia:mediaKind:duration:](&v35, sel_logDidEndViewingMedia_mediaKind_duration_, v9, a4, a5);
  if (a4 == 1)
  {
    v10 = (void *)MEMORY[0x1E0D09910];
    v11 = -[PUOneUpEventTracker currentAssetSignpost](self, "currentAssetSignpost");
    v12 = *MEMORY[0x1E0D09878];
    v42[0] = *MEMORY[0x1E0D09830];
    v13 = v42[0];
    -[PXMediaViewControllerEventTracker viewName](self, "viewName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0D09828];
    v43[0] = v14;
    v43[1] = v9;
    v42[1] = v15;
    v42[2] = CFSTR("oneUpEngagement");
    v43[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endSignpost:forEventName:withPayload:", v11, v12, v17);

    v18 = (void *)MEMORY[0x1E0D09910];
    v19 = *MEMORY[0x1E0D09750];
    v40[0] = v13;
    -[PXMediaViewControllerEventTracker viewName](self, "viewName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v20;
    v40[1] = *MEMORY[0x1E0D09868];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PUOneUpEventTracker currentAssetSignpost](self, "currentAssetSignpost"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendEvent:withPayload:", v19, v23);

    -[PUOneUpEventTracker setCurrentAssetSignpost:](self, "setCurrentAssetSignpost:", 0);
    v24 = (void *)MEMORY[0x1E0D09910];
    v25 = -[PUOneUpEventTracker currentAssetDisplayIntervalSignpost](self, "currentAssetDisplayIntervalSignpost");
    v26 = *MEMORY[0x1E0D09708];
    v38[0] = *MEMORY[0x1E0D09850];
    v38[1] = v15;
    v39[0] = CFSTR("com.apple.photos.CPAnalytics.oneUpAssetDisplayed");
    v39[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "endSignpost:forEventName:withPayload:", v25, v26, v28);

    -[PUOneUpEventTracker setCurrentAssetDisplayIntervalSignpost:](self, "setCurrentAssetDisplayIntervalSignpost:", 0);
    if (a5 >= 1.0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = (void *)MEMORY[0x1E0D09910];
        v30 = *MEMORY[0x1E0D7BED0];
        v36 = v15;
        v37 = v9;
        v31 = (void *)MEMORY[0x1E0C99D80];
        v32 = v9;
        objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "sendEvent:withPayload:", v30, v33);

      }
    }
  }

}

- (void)_logDidStartSession
{
  void *v4;

  if (-[PUOneUpEventTracker sessionSignpost](self, "sessionSignpost"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.sessionSignpost == CPAnalyticsSignpostIDNull"));

  }
  -[PUOneUpEventTracker setSessionSignpost:](self, "setSessionSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));
}

- (void)_logDidEndSession
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D09910];
  v4 = -[PUOneUpEventTracker sessionSignpost](self, "sessionSignpost");
  v5 = *MEMORY[0x1E0D09708];
  v8 = *MEMORY[0x1E0D09850];
  v9[0] = CFSTR("com.apple.photos.CPAnalytics.oneUpBrowserDisplayed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endSignpost:forEventName:withPayload:", v4, v5, v7);

  -[PUOneUpEventTracker setSessionSignpost:](self, "setSessionSignpost:", 0);
}

- (void)_handleLongEnoughViewDurationWithGeneration:(int64_t)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_currentlyViewedAssetGeneration == a3)
  {
    -[PXMediaViewControllerEventTracker displayedAsset](self, "displayedAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v9;
    if ((isKindOfClass & 1) != 0)
    {
      v6 = v9;
      if ((objc_msgSend(v6, "needsDeferredProcessing") & 1) == 0)
      {
        -[PUOneUpEventTracker assetAnalyzer](self, "assetAnalyzer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "analyzeAsset:forWorkerType:", v6, 0);

      }
      -[PUOneUpEventTracker assetMetadataDonator](self, "assetMetadataDonator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "donateMetadataForAsset:", v6);

      v5 = v9;
    }

  }
}

- (void)logUserWillPlayLivePhoto:(id)a3
{
  -[PUOneUpEventTracker logUserWillPlayLivePhoto:firstTimeWaitDuration:](self, "logUserWillPlayLivePhoto:firstTimeWaitDuration:", a3, 0.0);
}

- (void)logUserWillPlayLivePhoto:(id)a3 firstTimeWaitDuration:(double)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 365, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

  }
  if (-[PUOneUpEventTracker currentlyPlayingLivePhotoSignpost](self, "currentlyPlayingLivePhotoSignpost"))
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_error_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Live Photo %@ will start playing before previous Live Photo did end playing", buf, 0xCu);
    }

  }
  -[PUOneUpEventTracker setCurrentlyPlayingLivePhotoSignpost:](self, "setCurrentlyPlayingLivePhotoSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));
  -[PUOneUpEventTracker setLivePhotoFirstPlayWaitDuration:](self, "setLivePhotoFirstPlayWaitDuration:", a4);

}

- (void)logUserDidPlayLivePhoto:(id)a3
{
  -[PUOneUpEventTracker logUserDidPlayLivePhoto:pressOnSubject:](self, "logUserDidPlayLivePhoto:pressOnSubject:", a3, 0);
}

- (void)logUserDidPlayLivePhoto:(id)a3 pressOnSubject:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v4 = a4;
  v21[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 377, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

  }
  v8 = (void *)MEMORY[0x1E0D09910];
  v9 = -[PUOneUpEventTracker currentlyPlayingLivePhotoSignpost](self, "currentlyPlayingLivePhotoSignpost");
  v10 = *MEMORY[0x1E0D09708];
  v11 = *MEMORY[0x1E0D09828];
  v20[0] = *MEMORY[0x1E0D09850];
  v20[1] = v11;
  v21[0] = CFSTR("com.apple.photos.CPAnalytics.oneUpLivePhotoPlayed");
  v21[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endSignpost:forEventName:withPayload:", v9, v10, v12);

  -[PUOneUpEventTracker setCurrentlyPlayingLivePhotoSignpost:](self, "setCurrentlyPlayingLivePhotoSignpost:", 0);
  -[PUOneUpEventTracker livePhotoFirstPlayWaitDuration](self, "livePhotoFirstPlayWaitDuration");
  v14 = v13;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v7;
  else
    v16 = 0;
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v11);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("pressOnSubject"));

  if (v14 <= 0.0 || v14 >= 120.0)
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, CFSTR("firstPlayWaitDuration"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("firstPlayWaitDuration"));

  }
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.oneUpLivePhotoPlayed"), v15);

}

- (void)logVitalityDidEndForLivePhoto:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

  }
  v6 = (void *)MEMORY[0x1E0D09910];
  v9 = *MEMORY[0x1E0D09828];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.oneUpLivePhotoVitalityPlayed"), v7);

}

- (void)_logDidStartPlayingVideoAsset:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 401, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

  }
  if (-[PUOneUpEventTracker currentlyPlayingVideoSignpost](self, "currentlyPlayingVideoSignpost"))
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_error_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Video %@ did start playing before previous video did end playing", buf, 0xCu);
    }

  }
  -[PUOneUpEventTracker setCurrentlyPlayingVideoSignpost:](self, "setCurrentlyPlayingVideoSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));

}

- (void)_logDidEndPlayingVideoAsset:(id)a3 duration:(double)a4
{
  id v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 407, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

  }
  v8 = (void *)MEMORY[0x1E0D09910];
  v9 = -[PUOneUpEventTracker currentlyPlayingVideoSignpost](self, "currentlyPlayingVideoSignpost");
  v10 = *MEMORY[0x1E0D09708];
  v11 = *MEMORY[0x1E0D09828];
  v25[0] = *MEMORY[0x1E0D09850];
  v25[1] = v11;
  v26[0] = CFSTR("com.apple.photos.CPAnalytics.oneUpVideoPlayed");
  v26[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endSignpost:forEventName:withPayload:", v9, v10, v12);

  -[PUOneUpEventTracker setCurrentlyPlayingVideoSignpost:](self, "setCurrentlyPlayingVideoSignpost:", 0);
  v13 = (void *)MEMORY[0x1E0D09910];
  v23 = v11;
  v24 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.oneUpVideoPlayed"), v14);

  if (a4 >= 0.5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)MEMORY[0x1E0D09910];
      v16 = *MEMORY[0x1E0D7BED0];
      v21 = v11;
      v22 = v7;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v7;
      objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendEvent:withPayload:", v16, v19);

    }
  }

}

- (void)_logDidStartPlaybackOfStreamedVideoAsset:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

  }
  if (-[PUOneUpEventTracker currentlyPlayingStreamedVideoSignpost](self, "currentlyPlayingStreamedVideoSignpost"))
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_error_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Streamed video %@ did start playing before previous video did end playing", buf, 0xCu);
    }

  }
  -[PUOneUpEventTracker setCurrentlyPlayingStreamedVideoSignpost:](self, "setCurrentlyPlayingStreamedVideoSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));
  -[PUOneUpEventTracker setCurrentlyPlayingStreamedVideoStartSignpost:](self, "setCurrentlyPlayingStreamedVideoStartSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));

}

- (void)_logDidStartActualPlaybackOfStreamedVideoAsset:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 434, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

  }
  v6 = (void *)MEMORY[0x1E0D09910];
  v7 = -[PUOneUpEventTracker currentlyPlayingStreamedVideoStartSignpost](self, "currentlyPlayingStreamedVideoStartSignpost");
  v8 = *MEMORY[0x1E0D09708];
  v9 = *MEMORY[0x1E0D09828];
  v12[0] = *MEMORY[0x1E0D09850];
  v12[1] = v9;
  v13[0] = CFSTR("com.apple.photos.CPAnalytics.oneUpStreamedVideoPlaybackLatency");
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endSignpost:forEventName:withPayload:", v7, v8, v10);

  -[PUOneUpEventTracker setCurrentlyPlayingStreamedVideoStartSignpost:](self, "setCurrentlyPlayingStreamedVideoStartSignpost:", 0);
}

- (void)_logWillEndPlaybackOfStreamedVideoAsset:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 443, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

  }
  v6 = (void *)MEMORY[0x1E0D09910];
  v7 = -[PUOneUpEventTracker currentlyPlayingStreamedVideoSignpost](self, "currentlyPlayingStreamedVideoSignpost");
  v8 = *MEMORY[0x1E0D09708];
  v9 = *MEMORY[0x1E0D09828];
  v22[0] = *MEMORY[0x1E0D09850];
  v22[1] = v9;
  v23[0] = CFSTR("com.apple.photos.CPAnalytics.oneUpStreamedVideoPlayed");
  v23[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endSignpost:forEventName:withPayload:", v7, v8, v10);

  -[PUOneUpEventTracker setCurrentlyPlayingStreamedVideoSignpost:](self, "setCurrentlyPlayingStreamedVideoSignpost:", 0);
  v11 = (void *)MEMORY[0x1E0D09910];
  v20 = v9;
  v21 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.oneUpStreamedVideoPlayed"), v12);

  if (!-[PUOneUpEventTracker currentlyStreamingVideoDidStartActualPlayback](self, "currentlyStreamingVideoDidStartActualPlayback"))
  {
    v16 = (void *)MEMORY[0x1E0D09910];
    v18 = v9;
    v19 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.oneUpStreamedVideoPlaybackCancelled"), v14);
    goto LABEL_7;
  }
  v13 = -[PUOneUpEventTracker currentlyStreamingVideoStallsCount](self, "currentlyStreamingVideoStallsCount");
  if (v13 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0D09910], "bucketNameForInteger:bucketLimits:", v13, 1, 2, 3, 5, 10, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.oneUpStreamedVideoPlaybackStalled%@Times"), v14);
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v15, MEMORY[0x1E0C9AA70]);

LABEL_7:
  }

}

- (void)logViewControllerDidAppear:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PUOneUpEventTracker;
  -[PXViewControllerEventTracker logViewControllerDidAppear:](&v17, sel_logViewControllerDidAppear_, v4);
  -[PXViewControllerEventTracker currentViewController](self, "currentViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[PXViewControllerEventTracker currentViewController](self, "currentViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v4)
    {
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[PXViewControllerEventTracker currentViewController](self, "currentViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v4;
        v20 = 2112;
        v21 = v16;
        _os_log_error_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "viewController %@ appeared with unexpected currentViewController %@", buf, 0x16u);

      }
    }
  }
  if (-[PUOneUpEventTracker presentationOrigin](self, "presentationOrigin") == 7)
  {
    -[PXMediaViewControllerEventTracker viewName](self, "viewName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_15:

      goto LABEL_16;
    }
    -[PUOneUpEventTracker viewModel](self, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentAssetReference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;

      if (!v14)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v14, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpEventTracker _sendMapSelectionEventToBiomeWithAssetUUID:](self, "_sendMapSelectionEventToBiomeWithAssetUUID:", v15);
    }
    else
    {
      v14 = 0;
      v15 = v13;
    }

    goto LABEL_14;
  }
LABEL_16:

}

- (void)_sendMapSelectionEventToBiomeWithAssetUUID:(id)a3
{
  id v4;
  NSObject *biomeRequestQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  biomeRequestQueue = self->_biomeRequestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PUOneUpEventTracker__sendMapSelectionEventToBiomeWithAssetUUID___block_invoke;
  block[3] = &unk_1E58ABD10;
  v8 = v4;
  v6 = v4;
  dispatch_async(biomeRequestQueue, block);

}

- (void)logInfoPanelRotatedToHorizontalView
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D09910];
  v5 = *MEMORY[0x1E0D09830];
  -[PXMediaViewControllerEventTracker viewName](self, "viewName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.infoPanelRotatedToHorizontalView"), v4);

}

- (int64_t)startLoggingTimeInterval
{
  return objc_msgSend(MEMORY[0x1E0D09910], "startSignpost");
}

- (void)endLoggingTimeInterval:(int64_t)a3 event:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D09910];
  v7 = *MEMORY[0x1E0D09708];
  v8 = *MEMORY[0x1E0D09850];
  v14[0] = a4;
  v9 = *MEMORY[0x1E0D09830];
  v13[0] = v8;
  v13[1] = v9;
  v10 = a4;
  -[PXMediaViewControllerEventTracker viewName](self, "viewName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endSignpost:forEventName:withPayload:", a3, v7, v12);

}

- (void)logInfoPanelShownAndSwipeToNewAsset
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[PUOneUpEventTracker viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetBeforeLastViewedAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 == v5;

  v7 = (void *)MEMORY[0x1E0D09910];
  v11[0] = *MEMORY[0x1E0D09830];
  -[PXMediaViewControllerEventTracker viewName](self, "viewName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("swipeToPreviousAsset");
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.infoPanelSwipedToNewPhoto"), v10);

}

- (void)logTipPresentedForType:(int64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) <= 3)
  {
    v4 = off_1E58A70C8[a3 - 1];
    -[PUOneUpEventTracker viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetViewModelForCurrentAssetReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0D09910];
    v9 = *MEMORY[0x1E0D09828];
    v14[0] = v7;
    v10 = *MEMORY[0x1E0D09830];
    v13[0] = v9;
    v13[1] = v10;
    -[PXMediaViewControllerEventTracker viewName](self, "viewName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendEvent:withPayload:", v4, v12);

  }
}

- (void)logInfoPanelOpenedBy:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[2];
  _QWORD v21[2];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (!-[PUOneUpEventTracker currentlyShowingInfoPanelSignpost](self, "currentlyShowingInfoPanelSignpost"))
  {
    -[PUOneUpEventTracker setCurrentlyShowingInfoPanelSignpost:](self, "setCurrentlyShowingInfoPanelSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));
    v5 = (void *)MEMORY[0x1E0D09910];
    v6 = *MEMORY[0x1E0D09830];
    v22 = *MEMORY[0x1E0D09830];
    -[PXMediaViewControllerEventTracker viewName](self, "viewName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.infoPanelViewed"), v8);

    -[PUOneUpEventTracker viewModel](self, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetViewModelForCurrentAssetReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "visualImageAnalysis");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasVisualSearchResults");

    if (a3 == 2)
    {
      v13 = (void *)MEMORY[0x1E0D09910];
      v18[0] = v6;
      -[PXMediaViewControllerEventTracker viewName](self, "viewName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v14;
      v18[1] = CFSTR("hasVisualSearchResults");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = CFSTR("tapToOpen");
      v19[1] = v15;
      v19[2] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("com.apple.photos.CPAnalytics.oneUpAccessoryViewTapped");
    }
    else
    {
      if (a3 != 1)
      {
LABEL_7:

        return;
      }
      v13 = (void *)MEMORY[0x1E0D09910];
      v20[0] = v6;
      -[PXMediaViewControllerEventTracker viewName](self, "viewName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = CFSTR("hasVisualSearchResults");
      v21[0] = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("com.apple.photos.CPAnalytics.oneUpAccessoryViewSwipedUp");
    }
    objc_msgSend(v13, "sendEvent:withPayload:", v17, v16);

    goto LABEL_7;
  }
}

- (void)logInfoPanelClosedBy:(int64_t)a3
{
  int64_t v5;
  uint64_t *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = -[PUOneUpEventTracker currentlyShowingInfoPanelSignpost](self, "currentlyShowingInfoPanelSignpost");
  v6 = (uint64_t *)MEMORY[0x1E0D09830];
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0D09910];
    v8 = -[PUOneUpEventTracker currentlyShowingInfoPanelSignpost](self, "currentlyShowingInfoPanelSignpost");
    v9 = *MEMORY[0x1E0D09708];
    v10 = *v6;
    v18[0] = *MEMORY[0x1E0D09850];
    v18[1] = v10;
    v19[0] = CFSTR("com.apple.photos.CPAnalytics.infoPanelViewingDuration");
    -[PXMediaViewControllerEventTracker viewName](self, "viewName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endSignpost:forEventName:withPayload:", v8, v9, v12);

    -[PUOneUpEventTracker setCurrentlyShowingInfoPanelSignpost:](self, "setCurrentlyShowingInfoPanelSignpost:", 0);
  }
  if (a3 == 2)
  {
    v13 = (void *)MEMORY[0x1E0D09910];
    v16[0] = *v6;
    -[PXMediaViewControllerEventTracker viewName](self, "viewName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = CFSTR("tapToOpen");
    v17[0] = v14;
    v17[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.oneUpAccessoryViewTapped"), v15);

  }
}

- (void)_logInfoPanelChangeEventsIfNeededWithChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUOneUpEventTracker viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetViewModelChangesByAssetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetViewModelForCurrentAssetReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v17 = v6;
    v13 = 0;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v10);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "accessoryViewVisibilityChanged"))
        {
          v16 = objc_msgSend(v9, "lastAccessoryViewVisibilityChangeReason") - 1;
          if (v16 <= 4 && ((0x17u >> v16) & 1) != 0)
            v13 = qword_1AB0F0058[v16];
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);

    v6 = v17;
    if (v13)
    {
      if (objc_msgSend(v9, "isAccessoryViewVisible"))
        -[PUOneUpEventTracker logInfoPanelOpenedBy:](self, "logInfoPanelOpenedBy:", v13);
      else
        -[PUOneUpEventTracker logInfoPanelClosedBy:](self, "logInfoPanelClosedBy:", v13);
    }
  }
  else
  {

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  _QWORD v9[5];
  unsigned __int32 v10;
  objc_super v11;

  v8 = a3;
  if ((void *)EventTrackerObservationContext == a5)
  {
    if ((a4 & 8) != 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __52__PUOneUpEventTracker_observable_didChange_context___block_invoke;
      v9[3] = &unk_1E58A7080;
      v9[4] = self;
      v10 = vdup_n_s8((a4 & 8) >> 3).u32[0];
      -[PUOneUpEventTracker performChanges:](self, "performChanges:", v9);
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PUOneUpEventTracker;
    -[PXMediaViewControllerEventTracker observable:didChange:context:](&v11, sel_observable_didChange_context_, v8, a4, a5);
  }

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  char v13;
  int v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  char v18;
  char v19;
  char v20;

  v7 = a3;
  v8 = a4;
  -[PUOneUpEventTracker viewModel](self, "viewModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    v15 = v8;
    if ((objc_msgSend(v15, "browsingSpeedRegimeDidChange") & 1) != 0)
      v12 = 1;
    else
      v12 = objc_msgSend(v15, "currentAssetDidChange");
    v13 = objc_msgSend(v15, "videoPlayerDidChange");
    -[PUOneUpEventTracker _logInfoPanelChangeEventsIfNeededWithChange:](self, "_logInfoPanelChangeEventsIfNeededWithChange:", v15);
    v14 = 0;
  }
  else
  {
    -[PUOneUpEventTracker currentVideoPlayer](self, "currentVideoPlayer");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 != v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpEventTracker.m"), 719, CFSTR("unexpected view model %@"), v7);

      abort();
    }
    v11 = v8;
    if ((objc_msgSend(v11, "desiredPlayStateDidChange") & 1) != 0
      || (objc_msgSend(v11, "playerItemDidChange") & 1) != 0
      || (objc_msgSend(v11, "playStateDidChange") & 1) != 0)
    {

      v12 = 0;
      v13 = 0;
      LOBYTE(v14) = 1;
LABEL_7:
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __43__PUOneUpEventTracker_viewModel_didChange___block_invoke;
      v17[3] = &unk_1E58A70A8;
      v18 = v12;
      v17[4] = self;
      v19 = v13;
      v20 = v14;
      -[PUOneUpEventTracker performChanges:](self, "performChanges:", v17);
      goto LABEL_15;
    }
    v14 = objc_msgSend(v11, "isStalledDidChange");
    v13 = 0;
    v12 = 0;
  }

  if ((v12 & 1) != 0 || (v13 & 1) != 0 || v14)
    goto LABEL_7;
LABEL_15:

}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (int64_t)presentationOrigin
{
  return self->_presentationOrigin;
}

- (BOOL)isSessionActive
{
  return self->_isSessionActive;
}

- (int64_t)sessionSignpost
{
  return self->_sessionSignpost;
}

- (void)setSessionSignpost:(int64_t)a3
{
  self->_sessionSignpost = a3;
}

- (double)currentlyViewedAssetTimestamp
{
  return self->_currentlyViewedAssetTimestamp;
}

- (int64_t)currentlyViewedAssetGeneration
{
  return self->_currentlyViewedAssetGeneration;
}

- (int64_t)currentAssetSignpost
{
  return self->_currentAssetSignpost;
}

- (void)setCurrentAssetSignpost:(int64_t)a3
{
  self->_currentAssetSignpost = a3;
}

- (int64_t)currentAssetDisplayIntervalSignpost
{
  return self->_currentAssetDisplayIntervalSignpost;
}

- (void)setCurrentAssetDisplayIntervalSignpost:(int64_t)a3
{
  self->_currentAssetDisplayIntervalSignpost = a3;
}

- (PXAssetAnalyzer)assetAnalyzer
{
  return self->_assetAnalyzer;
}

- (PXAssetMetadataDonator)assetMetadataDonator
{
  return self->_assetMetadataDonator;
}

- (PUBrowsingVideoPlayer)currentVideoPlayer
{
  return self->_currentVideoPlayer;
}

- (PUDisplayAsset)currentVideoAsset
{
  return self->_currentVideoAsset;
}

- (PUDisplayAsset)currentlyPlayingVideoAsset
{
  return self->_currentlyPlayingVideoAsset;
}

- (double)currentlyPlayingVideoAssetTimestamp
{
  return self->_currentlyPlayingVideoAssetTimestamp;
}

- (PUDisplayAsset)currentlyStreamingVideoAsset
{
  return self->_currentlyStreamingVideoAsset;
}

- (BOOL)currentlyStreamingVideoIsActuallyPlaying
{
  return self->_currentlyStreamingVideoIsActuallyPlaying;
}

- (BOOL)currentlyStreamingVideoIsStalled
{
  return self->_currentlyStreamingVideoIsStalled;
}

- (int64_t)currentlyStreamingVideoStallsCount
{
  return self->_currentlyStreamingVideoStallsCount;
}

- (void)setCurrentlyStreamingVideoStallsCount:(int64_t)a3
{
  self->_currentlyStreamingVideoStallsCount = a3;
}

- (BOOL)currentlyStreamingVideoDidStartActualPlayback
{
  return self->_currentlyStreamingVideoDidStartActualPlayback;
}

- (void)setCurrentlyStreamingVideoDidStartActualPlayback:(BOOL)a3
{
  self->_currentlyStreamingVideoDidStartActualPlayback = a3;
}

- (double)livePhotoFirstPlayWaitDuration
{
  return self->_livePhotoFirstPlayWaitDuration;
}

- (void)setLivePhotoFirstPlayWaitDuration:(double)a3
{
  self->_livePhotoFirstPlayWaitDuration = a3;
}

- (int64_t)currentlyPlayingLivePhotoSignpost
{
  return self->_currentlyPlayingLivePhotoSignpost;
}

- (void)setCurrentlyPlayingLivePhotoSignpost:(int64_t)a3
{
  self->_currentlyPlayingLivePhotoSignpost = a3;
}

- (int64_t)currentlyPlayingVideoSignpost
{
  return self->_currentlyPlayingVideoSignpost;
}

- (void)setCurrentlyPlayingVideoSignpost:(int64_t)a3
{
  self->_currentlyPlayingVideoSignpost = a3;
}

- (int64_t)currentlyPlayingStreamedVideoSignpost
{
  return self->_currentlyPlayingStreamedVideoSignpost;
}

- (void)setCurrentlyPlayingStreamedVideoSignpost:(int64_t)a3
{
  self->_currentlyPlayingStreamedVideoSignpost = a3;
}

- (int64_t)currentlyPlayingStreamedVideoStartSignpost
{
  return self->_currentlyPlayingStreamedVideoStartSignpost;
}

- (void)setCurrentlyPlayingStreamedVideoStartSignpost:(int64_t)a3
{
  self->_currentlyPlayingStreamedVideoStartSignpost = a3;
}

- (int64_t)currentlyShowingInfoPanelSignpost
{
  return self->_currentlyShowingInfoPanelSignpost;
}

- (void)setCurrentlyShowingInfoPanelSignpost:(int64_t)a3
{
  self->_currentlyShowingInfoPanelSignpost = a3;
}

- (OS_dispatch_queue)biomeRequestQueue
{
  return self->_biomeRequestQueue;
}

- (void)setBiomeRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_biomeRequestQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeRequestQueue, 0);
  objc_storeStrong((id *)&self->_currentlyStreamingVideoAsset, 0);
  objc_storeStrong((id *)&self->_currentlyPlayingVideoAsset, 0);
  objc_storeStrong((id *)&self->_currentVideoAsset, 0);
  objc_storeStrong((id *)&self->_currentVideoPlayer, 0);
  objc_storeStrong((id *)&self->_assetMetadataDonator, 0);
  objc_storeStrong((id *)&self->_assetAnalyzer, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __43__PUOneUpEventTracker_viewModel_didChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentlyViewedAsset");
  if (*(_BYTE *)(a1 + 41))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentVideoPlayer");
  if (*(_BYTE *)(a1 + 42))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentVideoProperties");

}

void __52__PUOneUpEventTracker_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateIsSessionActive");
  if (*(_BYTE *)(a1 + 41))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentlyViewedAsset");
  if (*(_BYTE *)(a1 + 42))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentVideoPlayer");
  if (*(_BYTE *)(a1 + 43))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateOneUpInfoPanelShowingSignpost");

}

void __66__PUOneUpEventTracker__sendMapSelectionEventToBiomeWithAssetUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    BiomeLibrary();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "Photos");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "Map");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02120]), "initWithIdentifier:subset:type:", *(_QWORD *)(a1 + 32), v3, 1);
    objc_msgSend(v7, "sendEvent:", v8);
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_INFO, "[PXOneUpPresentationOriginPlacesAlbum] Sent photos-map-selection event to Biome Stream with asset uuid: %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

void __41__PUOneUpEventTracker_setDisplayedAsset___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleLongEnoughViewDurationWithGeneration:", *(_QWORD *)(a1 + 40));

}

@end
