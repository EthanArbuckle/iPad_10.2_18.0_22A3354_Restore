@implementation PXDisplayAssetLoopingVideoContentView

- (void)dealloc
{
  objc_super v3;

  -[PXDisplayAssetLoopingVideoContentView _endLoadingInterval:](self, "_endLoadingInterval:", 0);
  -[PXDisplayAssetLoopingVideoContentView _endPlaybackInterval](self, "_endPlaybackInterval");
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  -[PXDisplayAssetLoopingVideoContentView dealloc](&v3, sel_dealloc);
}

- (int64_t)playbackStyle
{
  return 5;
}

- (id)contentView
{
  PXVideoPlayerView *videoView;
  PXVideoPlayerView *v4;
  PXVideoPlayerView *v5;
  NSObject *v6;
  dispatch_block_t v7;
  _QWORD v9[4];
  id v10;
  id location;

  videoView = self->_videoView;
  if (!videoView)
  {
    v4 = objc_alloc_init(PXVideoPlayerView);
    -[PXDisplayAssetContentView placeholderTransitionDuration](self, "placeholderTransitionDuration");
    -[PXVideoPlayerView setVideoAppearanceCrossfadeDuration:](v4, "setVideoAppearanceCrossfadeDuration:");
    -[PXVideoPlayerView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[PXVideoPlayerView setPlaceholderDisplayMode:](v4, "setPlaceholderDisplayMode:", 1);
    -[PXVideoPlayerView setToneMapToStandardDynamicRange:](v4, "setToneMapToStandardDynamicRange:", -[PXDisplayAssetContentView toneMapVideoToStandardDynamicRange](self, "toneMapVideoToStandardDynamicRange"));
    v5 = self->_videoView;
    self->_videoView = v4;

    -[PXDisplayAssetLoopingVideoContentView _updateVideoViewContentMode](self, "_updateVideoViewContentMode");
    objc_initWeak(&location, self);
    dispatch_get_global_queue(9, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__PXDisplayAssetLoopingVideoContentView_contentView__block_invoke;
    v9[3] = &unk_1E5148D30;
    objc_copyWeak(&v10, &location);
    v7 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v9);
    dispatch_async(v6, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    videoView = self->_videoView;
  }
  return videoView;
}

- (void)setVideoPlayer:(id)a3
{
  ISWrappedAVPlayer *v5;
  ISWrappedAVPlayer *videoPlayer;
  void *v7;
  double v8;
  uint64_t v9;
  id v10;
  void *v11;
  id timeObserver;
  _QWORD v13[4];
  id v14;
  CMTime v15;
  id location;

  v5 = (ISWrappedAVPlayer *)a3;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    -[ISWrappedAVPlayer removeTimeObserver:](videoPlayer, "removeTimeObserver:", self->_timeObserver);
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    -[PXDisplayAssetLoopingVideoContentView audioSession](self, "audioSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[ISWrappedAVPlayer setWrappedAudioSession:](v5, "setWrappedAudioSession:", v7);
    LODWORD(v8) = 0;
    -[ISWrappedAVPlayer setVolume:](v5, "setVolume:", v8);
    -[ISWrappedAVPlayer setPreventsSleepDuringVideoPlayback:](v5, "setPreventsSleepDuringVideoPlayback:", 0);
    -[PXVideoPlayerView setPlayer:](self->_videoView, "setPlayer:", v5);
    objc_initWeak(&location, self);
    CMTimeMakeWithSeconds(&v15, 0.1, 600);
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__PXDisplayAssetLoopingVideoContentView_setVideoPlayer___block_invoke;
    v13[3] = &unk_1E5143B80;
    objc_copyWeak(&v14, &location);
    -[ISWrappedAVPlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](v5, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v15, v9, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    timeObserver = self->_timeObserver;
    self->_timeObserver = v11;

    -[PXDisplayAssetLoopingVideoContentView _updateVideoPlayerPlayerItem](self, "_updateVideoPlayerPlayerItem");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

- (CGRect)currentContentsRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)off_1E50B86D0;
  v3 = *((double *)off_1E50B86D0 + 1);
  v4 = *((double *)off_1E50B86D0 + 2);
  v5 = *((double *)off_1E50B86D0 + 3);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)currentImage
{
  return -[PXVideoPlayerView generateSnapshotImage](self->_videoView, "generateSnapshotImage");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  -[PXDisplayAssetContentView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PXDisplayAssetContentView setNeedsUpdateContent](self, "setNeedsUpdateContent");
}

- (void)updateContent
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  -[PXDisplayAssetContentView updateContent](&v11, sel_updateContent);
  -[PXDisplayAssetContentView mediaProvider](self, "mediaProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetContentView asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetContentView targetSize](self, "targetSize");
  v6 = v5;
  v8 = v7;
  +[PXActivityCoordinator coordinatorForActivity:](PXActivityCoordinator, "coordinatorForActivity:", CFSTR("PXDisplayAssetContentViewActivityVideo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXDisplayAssetContentView isAnimatedContentEnabled](self, "isAnimatedContentEnabled")
    && (-[PXDisplayAssetLoopingVideoContentView window](self, "window"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10)
    && v3
    && v4
    && v6 > 0.0
    && v8 > 0.0)
  {
    objc_msgSend(v9, "registerItem:", self);
  }
  else
  {
    objc_msgSend(v9, "unregisterItem:", self);
    -[PXDisplayAssetLoopingVideoContentView setQueuePosition:](self, "setQueuePosition:", 0);
    -[PXDisplayAssetLoopingVideoContentView setCanLoadVideo:](self, "setCanLoadVideo:", 0);
  }

}

- (double)loadingProgress
{
  void *v3;
  double v5;
  double v6;
  double v7;

  -[PXDisplayAssetLoopingVideoContentView videoPlayerItem](self, "videoPlayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1.0;
  -[PXDisplayAssetContentView imageProgress](self, "imageProgress");
  v6 = v5;
  -[PXDisplayAssetLoopingVideoContentView videoLoadingProgress](self, "videoLoadingProgress");
  return v7 * 0.75 + v6 * 0.25;
}

- (void)imageDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  -[PXDisplayAssetContentView imageDidChange](&v4, sel_imageDidChange);
  -[PXDisplayAssetContentView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoPlayerView setPlaceholderImage:](self->_videoView, "setPlaceholderImage:", v3);

  -[PXDisplayAssetLoopingVideoContentView _updateVideoViewPlaceholderFilters](self, "_updateVideoViewPlaceholderFilters");
}

- (void)imageProgressDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  -[PXDisplayAssetContentView imageProgressDidChange](&v3, sel_imageProgressDidChange);
  -[PXDisplayAssetContentView invalidateLoadingProgress](self, "invalidateLoadingProgress");
}

- (void)animatedContentEnabledDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  -[PXDisplayAssetContentView animatedContentEnabledDidChange](&v3, sel_animatedContentEnabledDidChange);
  -[PXDisplayAssetLoopingVideoContentView updateContent](self, "updateContent");
}

- (void)placeholderImageFiltersDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  -[PXDisplayAssetContentView placeholderImageFiltersDidChange](&v3, sel_placeholderImageFiltersDidChange);
  -[PXDisplayAssetLoopingVideoContentView _updateVideoViewPlaceholderFilters](self, "_updateVideoViewPlaceholderFilters");
}

- (void)contentModeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  -[PXDisplayAssetContentView contentModeDidChange](&v3, sel_contentModeDidChange);
  -[PXDisplayAssetLoopingVideoContentView _updateVideoViewContentMode](self, "_updateVideoViewContentMode");
}

- (BOOL)isDisplayingFullQualityContent
{
  void *v2;
  BOOL v3;

  -[PXDisplayAssetLoopingVideoContentView videoPlayerItem](self, "videoPlayerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)isDisplayingFullQualityContentDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  -[PXDisplayAssetContentView isDisplayingFullQualityContentDidChange](&v3, sel_isDisplayingFullQualityContentDidChange);
  -[PXDisplayAssetLoopingVideoContentView _updateVideoViewPlaceholderFilters](self, "_updateVideoViewPlaceholderFilters");
}

- (void)contentsRectDidChange
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  -[PXDisplayAssetContentView contentsRectDidChange](&v2, sel_contentsRectDidChange);
}

- (void)toneMapVideoToStandardDynamicRangeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetLoopingVideoContentView;
  -[PXDisplayAssetContentView toneMapVideoToStandardDynamicRangeDidChange](&v3, sel_toneMapVideoToStandardDynamicRangeDidChange);
  -[PXVideoPlayerView setToneMapToStandardDynamicRange:](self->_videoView, "setToneMapToStandardDynamicRange:", -[PXDisplayAssetContentView toneMapVideoToStandardDynamicRange](self, "toneMapVideoToStandardDynamicRange"));
}

- (void)setAudioSession:(id)a3
{
  ISWrappedAVAudioSession *v5;
  void *v6;
  ISWrappedAVAudioSession *v7;

  v5 = (ISWrappedAVAudioSession *)a3;
  if (self->_audioSession != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_audioSession, a3);
    if (v7)
    {
      -[PXDisplayAssetLoopingVideoContentView videoPlayer](self, "videoPlayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWrappedAudioSession:", v7);

    }
    -[PXDisplayAssetLoopingVideoContentView _updateVideoPlayerPlayerItem](self, "_updateVideoPlayerPlayerItem");
    v5 = v7;
  }

}

- (void)setVideoLoadingProgress:(double)a3
{
  if (self->_videoLoadingProgress != a3)
  {
    self->_videoLoadingProgress = a3;
    -[PXDisplayAssetContentView invalidateLoadingProgress](self, "invalidateLoadingProgress");
  }
}

- (void)setActivityCoordinatorQueuePosition:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  -[PXDisplayAssetLoopingVideoContentView queuePosition](self, "queuePosition");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[PXDisplayAssetLoopingVideoContentView queuePosition](self, "queuePosition"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "unsignedIntegerValue"),
        v7,
        v6,
        v8 != a3))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDisplayAssetLoopingVideoContentView setQueuePosition:](self, "setQueuePosition:", v9);

    +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "maxSimultaneousVideoCount");

    -[PXDisplayAssetLoopingVideoContentView setCanLoadVideo:](self, "setCanLoadVideo:", v11 > a3);
  }
}

- (unint64_t)activityCoordinatorQueuePosition
{
  void *v2;
  unint64_t v3;

  -[PXDisplayAssetLoopingVideoContentView queuePosition](self, "queuePosition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setCanLoadVideo:(BOOL)a3
{
  if (self->_canLoadVideo != a3)
  {
    self->_canLoadVideo = a3;
    if (a3)
      -[PXDisplayAssetLoopingVideoContentView _loadVideo](self, "_loadVideo");
    else
      -[PXDisplayAssetLoopingVideoContentView _unloadVideo](self, "_unloadVideo");
  }
}

- (void)setVideoPlayerItem:(id)a3
{
  AVPlayerItem *v5;
  AVPlayerItem *v6;

  v5 = (AVPlayerItem *)a3;
  if (self->_videoPlayerItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_videoPlayerItem, a3);
    -[PXDisplayAssetLoopingVideoContentView _updateVideoPlayerPlayerItem](self, "_updateVideoPlayerPlayerItem");
    -[PXDisplayAssetLoopingVideoContentView isDisplayingFullQualityContentDidChange](self, "isDisplayingFullQualityContentDidChange");
    v5 = v6;
  }

}

- (void)_unloadVideo
{
  void *v3;
  PXVideoPlayerView *videoView;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  -[PXDisplayAssetLoopingVideoContentView _endPlaybackInterval](self, "_endPlaybackInterval");
  -[PXDisplayAssetLoopingVideoContentView _endLoadingInterval:](self, "_endLoadingInterval:", 0);
  -[PXDisplayAssetLoopingVideoContentView videoPlayerItem](self, "videoPlayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  videoView = self->_videoView;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PXDisplayAssetLoopingVideoContentView__unloadVideo__block_invoke;
  v6[3] = &unk_1E5147280;
  objc_copyWeak(&v8, &location);
  v5 = v3;
  v7 = v5;
  -[PXVideoPlayerView setPlaceholderDisplayMode:completion:](videoView, "setPlaceholderDisplayMode:completion:", 1, v6);
  -[PXDisplayAssetContentView setRequestID:](self, "setRequestID:", 0);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_handleDidShowPlaceholderForUnloadingPlayerItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXDisplayAssetLoopingVideoContentView videoPlayerItem](self, "videoPlayerItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[PXDisplayAssetLoopingVideoContentView setVideoPlayerItem:](self, "setVideoPlayerItem:", 0);
}

- (void)_loadVideo
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t loadingIntervalID;
  PXVideoRequestOptions *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  __int128 *p_buf;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  __int128 buf;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[PXDisplayAssetContentView asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetLoopingVideoContentView _endLoadingInterval:](self, "_endLoadingInterval:", 0);
  -[PXDisplayAssetContentView log](self, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  self->_loadingIntervalID = os_signpost_id_generate(v4);
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v3, "description");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = v4;
  v10 = v9;
  loadingIntervalID = self->_loadingIntervalID;
  if (loadingIntervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, loadingIntervalID, "Video Loading", "Asset: %@", (uint8_t *)&buf, 0xCu);
  }

  v12 = objc_alloc_init(PXVideoRequestOptions);
  -[PXVideoRequestOptions setNetworkAccessAllowed:](v12, "setNetworkAccessAllowed:", 1);
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __51__PXDisplayAssetLoopingVideoContentView__loadVideo__block_invoke;
  v22[3] = &unk_1E5145AC0;
  objc_copyWeak(&v23, &location);
  -[PXVideoRequestOptions setProgressHandler:](v12, "setProgressHandler:", v22);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x2020000000;
  v27 = 0;
  -[PXDisplayAssetContentView mediaProvider](self, "mediaProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  v17 = 3221225472;
  v18 = __51__PXDisplayAssetLoopingVideoContentView__loadVideo__block_invoke_3;
  v19 = &unk_1E5125F30;
  objc_copyWeak(&v21, &location);
  p_buf = &buf;
  v15 = objc_msgSend(v14, "requestPlayerItemForVideo:options:resultHandler:", v3, v12, &v16);

  *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v15;
  -[PXDisplayAssetContentView setRequestID:](self, "setRequestID:", v15, v16, v17, v18, v19);
  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)_handlePlayerItemResult:(id)a3 info:(id)a4 requestID:(int64_t)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B8420);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (-[PXDisplayAssetContentView requestID](self, "requestID") != a5 || v10)
  {
    -[PXDisplayAssetLoopingVideoContentView _endLoadingInterval:](self, "_endLoadingInterval:", 0);
  }
  else
  {
    -[PXDisplayAssetLoopingVideoContentView _endLoadingInterval:](self, "_endLoadingInterval:", v12 != 0);
    -[PXDisplayAssetLoopingVideoContentView setVideoPlayerItem:](self, "setVideoPlayerItem:", v12);
    if (v12)
    {
      -[PXDisplayAssetLoopingVideoContentView setVideoLoadingProgress:](self, "setVideoLoadingProgress:", 1.0);
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B8430);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXDisplayAssetContentView handleError:](self, "handleError:", v11);

    }
  }

}

- (void)_updateVideoPlayerPlayerItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t playbackIntervalID;
  double v11;
  double v12;
  uint8_t v13[16];

  -[PXDisplayAssetLoopingVideoContentView audioSession](self, "audioSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXDisplayAssetLoopingVideoContentView videoPlayerItem](self, "videoPlayerItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXVideoPlayerView player](self->_videoView, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      -[PXDisplayAssetContentView log](self, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      self->_playbackIntervalID = os_signpost_id_generate(v7);
      v8 = v7;
      v9 = v8;
      playbackIntervalID = self->_playbackIntervalID;
      if (playbackIntervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)v13 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_BEGIN, playbackIntervalID, "Video Playback Latency", ", v13, 2u);
      }

      objc_msgSend(v6, "setLoopingEnabled:withTemplateItem:", 1, v4);
      LODWORD(v11) = 1.0;
      objc_msgSend(v6, "setRate:", v11);
      -[PXVideoPlayerView setPlaceholderDisplayMode:](self->_videoView, "setPlaceholderDisplayMode:", 0);

    }
    else
    {
      objc_msgSend(v5, "setLoopingEnabled:withTemplateItem:", 0, 0);
      LODWORD(v12) = 0;
      objc_msgSend(v6, "setRate:", v12);
      objc_msgSend(v6, "replaceCurrentItemWithPlayerItem:", 0);
    }
    -[PXDisplayAssetLoopingVideoContentView _updateVideoViewPlaceholderFilters](self, "_updateVideoViewPlaceholderFilters");

  }
}

- (void)_updateVideoViewContentMode
{
  -[PXVideoPlayerView setVideoViewContentMode:](self->_videoView, "setVideoViewContentMode:", -[PXDisplayAssetLoopingVideoContentView contentMode](self, "contentMode") == 1);
}

- (void)_updateVideoViewPlaceholderFilters
{
  id v3;

  if (-[PXDisplayAssetLoopingVideoContentView isDisplayingFullQualityContent](self, "isDisplayingFullQualityContent"))
  {
    -[PXVideoPlayerView setPlaceholderImageFilters:](self->_videoView, "setPlaceholderImageFilters:", 0);
  }
  else
  {
    -[PXDisplayAssetContentView placeholderImageFilters](self, "placeholderImageFilters");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PXVideoPlayerView setPlaceholderImageFilters:](self->_videoView, "setPlaceholderImageFilters:", v3);

  }
}

- (void)_endPlaybackInterval
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t playbackIntervalID;
  uint8_t v6[16];

  if (self->_playbackIntervalID)
  {
    -[PXDisplayAssetContentView log](self, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    playbackIntervalID = self->_playbackIntervalID;
    if (playbackIntervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_END, playbackIntervalID, "Video Playback Latency", ", v6, 2u);
    }

    self->_playbackIntervalID = 0;
  }
}

- (void)_endLoadingInterval:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t loadingIntervalID;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_loadingIntervalID)
  {
    v3 = a3;
    -[PXDisplayAssetContentView log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    loadingIntervalID = self->_loadingIntervalID;
    if (loadingIntervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_END, loadingIntervalID, "Video Loading", "Success: %d", (uint8_t *)v8, 8u);
    }

    self->_loadingIntervalID = 0;
  }
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (AVPlayerItem)videoPlayerItem
{
  return self->_videoPlayerItem;
}

- (BOOL)canLoadVideo
{
  return self->_canLoadVideo;
}

- (NSNumber)queuePosition
{
  return self->_queuePosition;
}

- (void)setQueuePosition:(id)a3
{
  objc_storeStrong((id *)&self->_queuePosition, a3);
}

- (ISWrappedAVAudioSession)audioSession
{
  return self->_audioSession;
}

- (double)videoLoadingProgress
{
  return self->_videoLoadingProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_queuePosition, 0);
  objc_storeStrong((id *)&self->_videoPlayerItem, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
}

void __51__PXDisplayAssetLoopingVideoContentView__loadVideo__block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10[2];

  v8 = a2;
  v9 = a5;
  objc_copyWeak(v10, (id *)(a1 + 32));
  v10[1] = *(id *)&a3;
  px_dispatch_on_main_queue();
  objc_destroyWeak(v10);

}

void __51__PXDisplayAssetLoopingVideoContentView__loadVideo__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = v5;
  v8 = v6;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __51__PXDisplayAssetLoopingVideoContentView__loadVideo__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handlePlayerItemResult:info:requestID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

}

void __51__PXDisplayAssetLoopingVideoContentView__loadVideo__block_invoke_2(uint64_t a1)
{
  double v1;
  id WeakRetained;

  v1 = *(double *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setVideoLoadingProgress:", v1);

}

void __53__PXDisplayAssetLoopingVideoContentView__unloadVideo__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleDidShowPlaceholderForUnloadingPlayerItem:", *(_QWORD *)(a1 + 32));

}

void __56__PXDisplayAssetLoopingVideoContentView_setVideoPlayer___block_invoke(uint64_t a1, __int128 *a2)
{
  id WeakRetained;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = *a2;
  v5 = *((_QWORD *)a2 + 2);
  objc_msgSend(WeakRetained, "_handleVideoPlayerTimeObserverWithTime:", &v4);

}

void __52__PXDisplayAssetLoopingVideoContentView_contentView__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = objc_alloc_init(MEMORY[0x1E0D78298]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__PXDisplayAssetLoopingVideoContentView_contentView__block_invoke_2;
  v4[3] = &unk_1E5147280;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

  objc_destroyWeak(&v6);
}

void __52__PXDisplayAssetLoopingVideoContentView_contentView__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setVideoPlayer:", v1);

  v4 = (void *)MEMORY[0x1E0D78290];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PXDisplayAssetLoopingVideoContentView_contentView__block_invoke_3;
  v5[3] = &unk_1E5125EE0;
  objc_copyWeak(&v6, v2);
  objc_msgSend(v4, "sharedAmbientInstanceWithLoadHandler:", v5);
  objc_destroyWeak(&v6);
}

void __52__PXDisplayAssetLoopingVideoContentView_contentView__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v5);
}

void __52__PXDisplayAssetLoopingVideoContentView_contentView__block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAudioSession:", v1);

}

@end
