@implementation ISLivePhotoPlayer

- (void)removePlaybackFilter:(id)a3
{
  NSMutableSet *playbackFilters;
  id v5;

  if (a3)
  {
    playbackFilters = self->_playbackFilters;
    v5 = a3;
    -[NSMutableSet removeObject:](playbackFilters, "removeObject:", v5);
    objc_msgSend(v5, "unregisterChangeObserver:context:", self, ISLivePhotoPlaybackFilterObservationContext);

  }
}

- (void)addPlaybackFilter:(id)a3
{
  NSMutableSet *playbackFilters;
  id v5;

  if (a3)
  {
    playbackFilters = self->_playbackFilters;
    v5 = a3;
    -[NSMutableSet addObject:](playbackFilters, "addObject:", v5);
    -[ISLivePhotoPlayer _configurePlaybackFilter:](self, "_configurePlaybackFilter:", v5);
    objc_msgSend(v5, "registerChangeObserver:context:", self, ISLivePhotoPlaybackFilterObservationContext);

  }
}

- (int64_t)currentPlaybackStyle
{
  return self->_currentPlaybackStyle;
}

- (ISLivePhotoPlayer)init
{
  ISLivePhotoPlayer *v2;
  ISLivePhotoPlayer *v3;
  void *v4;
  uint64_t v5;
  NSMutableSet *playbackFilters;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ISLivePhotoPlayer;
  v2 = -[ISBasePlayer init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lastAppliedScale = 1.0;
    +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_immediatelyShowsPhotoWhenPlaybackEnds = objc_msgSend(v4, "playIsSticky");

    v3->_playbackAllowed = 1;
    v3->_targetReadiness = 2;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    playbackFilters = v3->_playbackFilters;
    v3->_playbackFilters = (NSMutableSet *)v5;

  }
  return v3;
}

- (void)_updateHintingAndVitality
{
  void *v3;
  char v4;
  BOOL v5;
  uint64_t v6;
  _QWORD v7[5];
  char v8;
  BOOL v9;

  -[ISBasePlayer activeBehavior](self, "activeBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "behaviorType") == 3)
  {
    v4 = objc_msgSend(v3, "isPlaying");
    v5 = 0;
  }
  else
  {
    v6 = objc_msgSend(v3, "behaviorType");
    v4 = 0;
    v5 = v6 == 1;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ISLivePhotoPlayer__updateHintingAndVitality__block_invoke;
  v7[3] = &unk_1E94536E8;
  v7[4] = self;
  v8 = v4;
  v9 = v5;
  -[ISObservable performChanges:](self, "performChanges:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__vitalityTimeoutDate, 0);
  objc_storeStrong((id *)&self->_vitalityFilter, 0);
  objc_storeStrong((id *)&self->_playbackFilters, 0);
}

- (void)configurePlayerItem
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISLivePhotoPlayer;
  -[ISBasePlayer configurePlayerItem](&v3, sel_configurePlayerItem);
  -[ISLivePhotoPlayer _updatePlayerItemLoadingTarget](self, "_updatePlayerItemLoadingTarget");
}

- (void)playerItemDidChange
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  ISDefaultBehavior *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ISLivePhotoPlayer;
  -[ISBasePlayer playerItemDidChange](&v8, sel_playerItemDidChange);
  -[ISLivePhotoPlayer vitalityFilter](self, "vitalityFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  v5 = -[ISLivePhotoPlayer _coalescedPlaybackFilterState](self, "_coalescedPlaybackFilterState");
  -[ISBasePlayer setActiveBehavior:](self, "setActiveBehavior:", 0);
  -[ISLivePhotoPlayer _setCurrentPlaybackStyle:](self, "_setCurrentPlaybackStyle:", 0);
  -[ISBasePlayer playerItem](self, "playerItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v5 == 1)
      return;
    if (v5 == 2)
    {
      -[ISLivePhotoPlayer startPlaybackWithStyle:](self, "startPlaybackWithStyle:", 1);
      return;
    }
    if (v4 == 2)
    {
      -[ISLivePhotoPlayer playVitality](self, "playVitality");
      return;
    }
    if (v4 == 1)
    {
      -[ISLivePhotoPlayer prepareForVitality](self, "prepareForVitality");
      return;
    }
  }
  v7 = objc_alloc_init(ISDefaultBehavior);
  -[ISBasePlayer setActiveBehavior:](self, "setActiveBehavior:", v7);

}

- (void)statusDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISLivePhotoPlayer;
  -[ISBasePlayer statusDidChange](&v3, sel_statusDidChange);
  -[ISLivePhotoPlayer _configurePlaybackFilters](self, "_configurePlaybackFilters");
  -[ISLivePhotoPlayer _prepareForVitalityIfNeeded](self, "_prepareForVitalityIfNeeded");
  -[ISLivePhotoPlayer _playIfNeeded](self, "_playIfNeeded");
}

- (double)videoWillPlayToPhotoInterval
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  -[ISLivePhotoPlayer _photoTransitionDuration](self, "_photoTransitionDuration");
  v4 = v3;
  -[ISBasePlayer playerItem](self, "playerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "variationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "integerValue") == 3)
  {
    +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "longExposureVitality");

    if (v9)
      v4 = 0.25;
  }
  else
  {

  }
  return v4;
}

- (void)activeBehaviorDidChange
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISLivePhotoPlayer;
  -[ISBasePlayer activeBehaviorDidChange](&v4, sel_activeBehaviorDidChange);
  -[ISLivePhotoPlayer _updateHintingAndVitality](self, "_updateHintingAndVitality");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__ISLivePhotoPlayer_activeBehaviorDidChange__block_invoke;
  v3[3] = &unk_1E9454220;
  v3[4] = self;
  -[ISObservable performChanges:](self, "performChanges:", v3);
}

- (void)playHintWhenReady
{
  -[ISLivePhotoPlayer startPlaybackWithStyleWhenReady:](self, "startPlaybackWithStyleWhenReady:", 2);
}

- (NSSet)playbackFilters
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_playbackFilters, "copy");
}

- (void)setVitalityFilter:(id)a3
{
  ISLivePhotoVitalityFilter *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v5 = (ISLivePhotoVitalityFilter *)a3;
  if (self->_vitalityFilter != v5)
  {
    objc_storeStrong((id *)&self->_vitalityFilter, a3);
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__ISLivePhotoPlayer_setVitalityFilter___block_invoke;
    v6[3] = &unk_1E9453630;
    objc_copyWeak(&v7, &location);
    -[ISLivePhotoVitalityFilter setOutputChangeHandler:](v5, "setOutputChangeHandler:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

- (void)setTargetReadiness:(int64_t)a3
{
  if (self->_targetReadiness != a3)
  {
    self->_targetReadiness = a3;
    -[ISLivePhotoPlayer _updatePlayerItemLoadingTarget](self, "_updatePlayerItemLoadingTarget");
  }
}

- (void)_updatePlayerItemLoadingTarget
{
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  -[ISBasePlayer playerItem](self, "playerItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[ISLivePhotoPlayer targetReadiness](self, "targetReadiness");
  v4 = -[ISLivePhotoPlayer _coalescedPlaybackFilterState](self, "_coalescedPlaybackFilterState");
  if (v4 | -[ISLivePhotoPlayer currentPlaybackStyle](self, "currentPlaybackStyle"))
  {
LABEL_9:
    v10 = 2;
    goto LABEL_15;
  }
  -[ISBasePlayer activeBehavior](self, "activeBehavior");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ISBasePlayer activeBehavior](self, "activeBehavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v9 = 1;
    if (v3 != 1)
      v9 = 2;
    if (v3)
      v10 = v9;
    else
      v10 = 0;
    if ((isKindOfClass & 1) != 0)
      goto LABEL_9;
  }
  else
  {
    v11 = 1;
    if (v3 != 1)
      v11 = 2;
    if (v3)
      v10 = v11;
    else
      v10 = 0;
  }
LABEL_15:
  objc_msgSend(v12, "setLoadingTarget:", v10);
  objc_msgSend(v12, "discardContentBelowLoadingTarget");

}

- (void)setPlaybackAllowed:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  ISDefaultBehavior *v6;

  if (self->_playbackAllowed != a3)
  {
    self->_playbackAllowed = a3;
    if (a3)
    {
      -[ISLivePhotoPlayer _playIfNeeded](self, "_playIfNeeded");
    }
    else
    {
      -[ISBasePlayer activeBehavior](self, "activeBehavior");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "behaviorType");

      if (v5 == 3)
      {
        v6 = objc_alloc_init(ISDefaultBehavior);
        -[ISBasePlayer setActiveBehavior:](self, "setActiveBehavior:", v6);

      }
    }
  }
}

- (void)startPlaybackWithStyleWhenReady:(int64_t)a3 settleAutomatically:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[ISLivePhotoPlayer _setStyleToPlayWhenReady:](self, "_setStyleToPlayWhenReady:", a3);
  -[ISLivePhotoPlayer _setSettleAutomaticallyWhenReady:](self, "_setSettleAutomaticallyWhenReady:", v4);
  -[ISLivePhotoPlayer _playIfNeeded](self, "_playIfNeeded");
}

- (void)startPlaybackWithStyleWhenReady:(int64_t)a3
{
  -[ISLivePhotoPlayer startPlaybackWithStyleWhenReady:settleAutomatically:](self, "startPlaybackWithStyleWhenReady:settleAutomatically:", a3, 0);
}

- (double)lastAppliedScale
{
  return self->_lastAppliedScale;
}

- (void)startPlaybackWithStyle:(int64_t)a3
{
  -[ISLivePhotoPlayer startPlaybackWithStyle:settleAutomatically:](self, "startPlaybackWithStyle:settleAutomatically:", a3, 0);
}

- (void)startPlaybackWithStyle:(int64_t)a3 settleAutomatically:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  ISLivePhotoPlaybackBehavior *v19;
  ISLivePhotoPlaybackBehavior *v20;
  CMTime v21;
  CMTimeRange time1;
  CMTime time2;
  CMTime v24;
  CMTime start;
  CMTimeRange v26;
  CMTime v27;

  -[ISLivePhotoPlayer _setShouldPrepareForVitalityWhenReady:](self, "_setShouldPrepareForVitalityWhenReady:", 0);
  -[ISLivePhotoPlayer _setShouldPlayVitalityWhenReady:](self, "_setShouldPlayVitalityWhenReady:", 0);
  -[ISLivePhotoPlayer _setStyleToPlayWhenReady:](self, "_setStyleToPlayWhenReady:", 0);
  -[ISBasePlayer playerItem](self, "playerItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v27, 0, sizeof(v27));
  objc_msgSend(v7, "playerContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "photoTime");
  else
    memset(&v27, 0, sizeof(v27));

  -[ISBasePlayer lastAppliedLayoutInfo](self, "lastAppliedLayoutInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    LODWORD(v11) = 0;
    -[ISBasePlayer setVideoVolume:](self, "setVideoVolume:", v11);
    memset(&v26, 0, sizeof(v26));
    -[ISLivePhotoPlayer trimTimeRange](self, "trimTimeRange");
    v12 = 0;
    v13 = 0;
    v14 = 0.5;
  }
  else
  {
    +[ISVitalitySettings sharedInstance](ISVitalitySettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minimumPhotoTransitionDuration");
    v14 = v16;

    LODWORD(v17) = 0;
    -[ISBasePlayer setVideoVolume:](self, "setVideoVolume:", v17);
    memset(&v26, 0, sizeof(v26));
    -[ISLivePhotoPlayer trimTimeRange](self, "trimTimeRange");
    v13 = a3 == 2;
    v12 = a3 == 4;
    if (a3 == 4 || a3 == 2)
    {
      if ((v26.start.flags & 1) != 0)
      {
        start = v26.start;
        v24 = v27;
        if ((v26.duration.flags & 1) != 0 && !v26.duration.epoch && (v26.duration.value & 0x8000000000000000) == 0)
        {
          time1.start = v26.duration;
          time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          if (CMTimeCompare(&time1.start, &time2))
          {
            time1 = v26;
            time2 = v27;
            if (!CMTimeRangeContainsTime(&time1, &time2))
            {
              time1 = v26;
              CMTimeRangeGetEnd(&v24, &time1);
            }
          }
        }
      }
      else
      {
        start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        v24 = v27;
      }
      time2 = start;
      v21 = v24;
      CMTimeRangeFromTimeToTime(&time1, &time2, &v21);
      v26 = time1;
    }
  }
  if (a4)
    v18 = 1;
  else
    v18 = (v12 || v13) | -[ISLivePhotoPlayer immediatelyShowsPhotoWhenPlaybackEnds](self, "immediatelyShowsPhotoWhenPlaybackEnds");
  v19 = [ISLivePhotoPlaybackBehavior alloc];
  start = v27;
  time1 = v26;
  v20 = -[ISLivePhotoPlaybackBehavior initWithInitialLayoutInfo:keyTime:playbackTimeRange:photoTransitionDuration:immediatelyShowsPhotoWhenPlaybackEnds:hasBlurryTransition:](v19, "initWithInitialLayoutInfo:keyTime:playbackTimeRange:photoTransitionDuration:immediatelyShowsPhotoWhenPlaybackEnds:hasBlurryTransition:", v10, &start, &time1, v18, a3 != 4, v14);
  -[ISBasePlayer setActiveBehavior:](self, "setActiveBehavior:", v20);
  -[ISLivePhotoPlaybackBehavior startPlayback](v20, "startPlayback");
  -[ISLivePhotoPlayer _setCurrentPlaybackStyle:](self, "_setCurrentPlaybackStyle:", a3);

}

- (void)stopPlayback
{
  -[ISLivePhotoPlayer stopPlaybackAnimated:](self, "stopPlaybackAnimated:", 1);
}

- (void)stopPlaybackAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  ISLivePhotoSettleBehavior *v9;
  _QWORD v10[5];

  v3 = a3;
  -[ISBasePlayer activeBehavior](self, "activeBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "behaviorType");

  if ((unint64_t)(v6 - 1) < 2
    || v6 == 3
    && (-[ISBasePlayer activeBehavior](self, "activeBehavior"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isPlayingBeyondPhoto"),
        v7,
        v8))
  {
    v9 = objc_alloc_init(ISLivePhotoSettleBehavior);
    -[ISBehavior setDelegate:](v9, "setDelegate:", self);
    -[ISBasePlayer setActiveBehavior:](self, "setActiveBehavior:", v9);
    -[ISLivePhotoSettleBehavior settle:](v9, "settle:", v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__ISLivePhotoPlayer_stopPlaybackAnimated___block_invoke;
    v10[3] = &unk_1E9454220;
    v10[4] = self;
    -[ISObservable performChanges:](self, "performChanges:", v10);

  }
  else
  {
    -[ISLivePhotoPlayer _setCurrentPlaybackStyle:](self, "_setCurrentPlaybackStyle:", 0);
  }
  -[ISLivePhotoPlayer _setStyleToPlayWhenReady:](self, "_setStyleToPlayWhenReady:", 0);
}

- (void)prepareForVitality
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  if (-[ISLivePhotoPlayer isPlaybackAllowed](self, "isPlaybackAllowed")
    && -[ISLivePhotoPlayer _canPlayVitality](self, "_canPlayVitality"))
  {
    if (-[ISBasePlayer status](self, "status") <= 0)
    {
      v5 = (void *)MEMORY[0x1E0C99D68];
      +[ISVitalitySettings sharedInstance](ISVitalitySettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "maxVitalityDelay");
      objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISLivePhotoPlayer _setVitalityTimeoutDate:](self, "_setVitalityTimeoutDate:", v7);

      -[ISLivePhotoPlayer _setShouldPrepareForVitalityWhenReady:](self, "_setShouldPrepareForVitalityWhenReady:", 1);
    }
    else
    {
      -[ISLivePhotoPlayer _resetPlaybackFilters](self, "_resetPlaybackFilters");
      -[ISLivePhotoPlayer _setCurrentPlaybackStyle:](self, "_setCurrentPlaybackStyle:", 0);
      -[ISBasePlayer activeBehavior](self, "activeBehavior");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "behaviorType") == 3 && (objc_msgSend(v8, "isPrepared") & 1) != 0)
      {
        v3 = v8;
      }
      else
      {
        -[ISLivePhotoPlayer _createVitalityBehavior](self, "_createVitalityBehavior");
        v4 = objc_claimAutoreleasedReturnValue();

        -[ISBasePlayer setActiveBehavior:](self, "setActiveBehavior:", v4);
        v3 = (void *)v4;
      }
      v9 = v3;
      objc_msgSend(v3, "prepareForVitality");
      -[ISLivePhotoPlayer _setShouldPrepareForVitalityWhenReady:](self, "_setShouldPrepareForVitalityWhenReady:", 0);

    }
  }
}

- (void)playVitality
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  if (!-[ISLivePhotoPlayer isPlayingVitality](self, "isPlayingVitality")
    && -[ISLivePhotoPlayer isPlaybackAllowed](self, "isPlaybackAllowed"))
  {
    -[ISBasePlayer activeBehavior](self, "activeBehavior");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "behaviorType") == 5)
    {
LABEL_12:

      return;
    }
    v3 = -[ISLivePhotoPlayer _canPlayVitality](self, "_canPlayVitality");

    if (v3)
    {
      if (-[ISBasePlayer status](self, "status") <= 0)
      {
        v5 = (void *)MEMORY[0x1E0C99D68];
        +[ISVitalitySettings sharedInstance](ISVitalitySettings, "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "maxVitalityDelay");
        objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISLivePhotoPlayer _setVitalityTimeoutDate:](self, "_setVitalityTimeoutDate:", v7);

        -[ISLivePhotoPlayer _setShouldPlayVitalityWhenReady:](self, "_setShouldPlayVitalityWhenReady:", 1);
        return;
      }
      -[ISLivePhotoPlayer _setCurrentPlaybackStyle:](self, "_setCurrentPlaybackStyle:", 0);
      -[ISBasePlayer activeBehavior](self, "activeBehavior");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "behaviorType") == 3)
      {
        v4 = v10;
      }
      else
      {
        -[ISLivePhotoPlayer _createVitalityBehavior](self, "_createVitalityBehavior");
        v8 = objc_claimAutoreleasedReturnValue();

        -[ISBasePlayer setActiveBehavior:](self, "setActiveBehavior:", v8);
        v4 = (void *)v8;
      }
      v9 = v4;
      objc_msgSend(v4, "playVitality");
      -[ISLivePhotoPlayer _setShouldPrepareForVitalityWhenReady:](self, "_setShouldPrepareForVitalityWhenReady:", 0);
      -[ISLivePhotoPlayer _setShouldPlayVitalityWhenReady:](self, "_setShouldPlayVitalityWhenReady:", 0);
      goto LABEL_12;
    }
  }
}

- (id)_createVitalityBehavior
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  Float64 v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  ISLivePhotoVitalityBehavior *v16;
  double v17;
  unsigned int v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  ISLivePhotoVitalityBehavior *v23;
  CMTime v25;
  CMTime time2;
  CMTime lhs;
  CMTime rhs;
  CMTime v29;
  CMTime v30;
  CMTime v31;

  +[ISVitalitySettings sharedInstance](ISVitalitySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayer lastAppliedLayoutInfo](self, "lastAppliedLayoutInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayer playerItem](self, "playerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v31, 0, sizeof(v31));
  objc_msgSend(v5, "playerContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "videoDuration");
  else
    memset(&v31, 0, sizeof(v31));

  memset(&v30, 0, sizeof(v30));
  if (v6)
    objc_msgSend(v6, "photoTime");
  objc_msgSend(v3, "postDuration");
  CMTimeMakeWithSeconds(&rhs, v9, 600);
  lhs = v30;
  CMTimeAdd(&v29, &lhs, &rhs);
  v30 = v29;
  lhs = v29;
  time2 = v31;
  CMTimeMinimum(&v29, &lhs, &time2);
  v30 = v29;
  memset(&v29, 0, sizeof(v29));
  objc_msgSend(v3, "preDuration");
  v11 = v10;
  objc_msgSend(v3, "postDuration");
  CMTimeMakeWithSeconds(&v29, v11 + v12, 600);
  time2 = v29;
  v25 = v31;
  CMTimeMinimum(&lhs, &time2, &v25);
  v29 = lhs;
  objc_msgSend(v6, "variationIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "integerValue") == 3)
  {
    +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "longExposureVitality") ^ 1;

  }
  else
  {
    v15 = 1;
  }

  v16 = [ISLivePhotoVitalityBehavior alloc];
  objc_msgSend(v3, "playbackRate");
  *(float *)&v18 = v17;
  -[ISLivePhotoPlayer videoWillPlayToPhotoInterval](self, "videoWillPlayToPhotoInterval");
  v20 = v19;
  objc_msgSend(v5, "asset");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "options");
  lhs = v30;
  time2 = v29;
  v23 = -[ISLivePhotoVitalityBehavior initWithInitialLayoutInfo:playbackEndTime:playDuration:playRate:photoTransitionDuration:pauseDuringTransition:assetOptions:](v16, "initWithInitialLayoutInfo:playbackEndTime:playDuration:playRate:photoTransitionDuration:pauseDuringTransition:assetOptions:", v4, &lhs, &time2, v15, v22, COERCE_DOUBLE(__PAIR64__(HIDWORD(v29.value), v18)), v20);

  return v23;
}

- (void)setSeekTime:(id *)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  __int128 v7;
  ISLivePhotoSettleBehavior *v8;
  void *v9;
  ISLivePhotoSeekBehavior *v10;
  void *v11;
  ISLivePhotoSeekBehavior *v12;
  $95D729B680665BEAEFA1D6FCA8238556 seekTime;
  CMTime time1;

  v6 = (void (**)(id, uint64_t))a4;
  time1 = *(CMTime *)a3;
  seekTime = self->_seekTime;
  if (CMTimeCompare(&time1, (CMTime *)&seekTime))
  {
    v7 = *(_OWORD *)&a3->var0;
    self->_seekTime.epoch = a3->var3;
    *(_OWORD *)&self->_seekTime.value = v7;
    if ((a3->var2 & 1) != 0)
    {
      -[ISBasePlayer activeBehavior](self, "activeBehavior");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "behaviorType") == 5)
      {
        objc_msgSend(v9, "setSeekCompletionHandler:", v6);
        time1 = (CMTime)*a3;
        objc_msgSend(v9, "setSeekTime:", &time1);
      }
      else
      {
        v10 = [ISLivePhotoSeekBehavior alloc];
        -[ISBasePlayer lastAppliedLayoutInfo](self, "lastAppliedLayoutInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        time1 = (CMTime)*a3;
        v12 = -[ISLivePhotoSeekBehavior initWithInitialLayoutInfo:seekTime:](v10, "initWithInitialLayoutInfo:seekTime:", v11, &time1);

        -[ISLivePhotoSeekBehavior setSeekCompletionHandler:](v12, "setSeekCompletionHandler:", v6);
        -[ISBasePlayer setActiveBehavior:](self, "setActiveBehavior:", v12);
        v9 = v12;
      }
      -[ISLivePhotoPlayer _setCurrentPlaybackStyle:](self, "_setCurrentPlaybackStyle:", 3);

    }
    else
    {
      v8 = objc_alloc_init(ISLivePhotoSettleBehavior);
      -[ISBehavior setDelegate:](v8, "setDelegate:", self);
      -[ISBasePlayer setActiveBehavior:](self, "setActiveBehavior:", v8);
      -[ISLivePhotoSettleBehavior settle:](v8, "settle:", 1);

    }
  }
  else if (v6)
  {
    v6[2](v6, 1);
  }

}

- (BOOL)_canPlayVitality
{
  void *v2;
  void *v3;
  BOOL v4;
  CMTime v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  -[ISBasePlayer playerItem](self, "playerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "supportsVitality"))
    goto LABEL_5;
  if (!v3)
  {
    v4 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v3, "photoTime");
  if ((BYTE4(v8) & 0x1D) == 1)
  {
    objc_msgSend(v3, "photoTime");
    v4 = CMTimeGetSeconds(&v6) >= 0.1;
  }
  else
  {
LABEL_5:
    v4 = 0;
  }
LABEL_7:

  return v4;
}

- (void)_playIfNeeded
{
  int64_t v3;
  _BOOL8 v4;

  if (-[ISLivePhotoPlayer _styleToPlayWhenReady](self, "_styleToPlayWhenReady")
    && -[ISBasePlayer status](self, "status") >= 2
    && -[ISLivePhotoPlayer isPlaybackAllowed](self, "isPlaybackAllowed")
    && !-[ISLivePhotoPlayer currentPlaybackStyle](self, "currentPlaybackStyle"))
  {
    v3 = -[ISLivePhotoPlayer _styleToPlayWhenReady](self, "_styleToPlayWhenReady");
    v4 = -[ISLivePhotoPlayer _settleAutomaticallyWhenReady](self, "_settleAutomaticallyWhenReady");
    -[ISLivePhotoPlayer _setStyleToPlayWhenReady:](self, "_setStyleToPlayWhenReady:", 0);
    -[ISLivePhotoPlayer _setSettleAutomaticallyWhenReady:](self, "_setSettleAutomaticallyWhenReady:", 0);
    -[ISLivePhotoPlayer startPlaybackWithStyle:settleAutomatically:](self, "startPlaybackWithStyle:settleAutomatically:", v3, v4);
  }
}

- (void)_prepareForVitalityIfNeeded
{
  void *v3;
  double v4;
  double v5;

  if ((-[ISLivePhotoPlayer _shouldPrepareForVitalityWhenReady](self, "_shouldPrepareForVitalityWhenReady")
     || -[ISLivePhotoPlayer _shouldPlayVitalityWhenReady](self, "_shouldPlayVitalityWhenReady"))
    && -[ISLivePhotoPlayer _canPlayVitality](self, "_canPlayVitality")
    && -[ISBasePlayer status](self, "status") >= 1)
  {
    -[ISLivePhotoPlayer _vitalityTimeoutDate](self, "_vitalityTimeoutDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceNow");
    v5 = v4;

    if (v5 >= 0.0)
    {
      if (-[ISLivePhotoPlayer _shouldPlayVitalityWhenReady](self, "_shouldPlayVitalityWhenReady"))
      {
        -[ISLivePhotoPlayer playVitality](self, "playVitality");
      }
      else if (-[ISLivePhotoPlayer _shouldPrepareForVitalityWhenReady](self, "_shouldPrepareForVitalityWhenReady"))
      {
        -[ISLivePhotoPlayer prepareForVitality](self, "prepareForVitality");
      }
    }
    else
    {
      -[ISLivePhotoPlayer _setShouldPrepareForVitalityWhenReady:](self, "_setShouldPrepareForVitalityWhenReady:", 0);
      -[ISLivePhotoPlayer _setShouldPlayVitalityWhenReady:](self, "_setShouldPlayVitalityWhenReady:", 0);
    }
  }
}

- (double)_photoTransitionDuration
{
  void *v2;
  void *v3;
  double v4;

  -[ISBasePlayer playerItem](self, "playerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasColorAdjustments"))
    v4 = 0.2;
  else
    v4 = 0.065;

  return v4;
}

- (void)_handleVitalityFilterDidChange:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "state");
  if (v4)
  {
    if (v4 == 2)
    {
      -[ISLivePhotoPlayer playVitality](self, "playVitality");
    }
    else if (v4 == 1)
    {
      -[ISLivePhotoPlayer prepareForVitality](self, "prepareForVitality");
    }
  }
  else
  {
    -[ISBasePlayer activeBehavior](self, "activeBehavior");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "behaviorType") == 3 && objc_msgSend(v5, "isPrepared"))
      -[ISLivePhotoPlayer playVitality](self, "playVitality");
    -[ISLivePhotoPlayer _setShouldPrepareForVitalityWhenReady:](self, "_setShouldPrepareForVitalityWhenReady:", 0);
    -[ISLivePhotoPlayer _setShouldPlayVitalityWhenReady:](self, "_setShouldPlayVitalityWhenReady:", 0);

  }
}

- (void)_handlePlaybackFilterDidChange
{
  int64_t v3;
  id v4;

  v3 = -[ISLivePhotoPlayer _coalescedPlaybackFilterState](self, "_coalescedPlaybackFilterState");
  -[ISLivePhotoPlayer setIsAttemptingToPlayback:](self, "setIsAttemptingToPlayback:", v3 != 0);
  if (v3)
  {
    if (v3 == 2)
    {
      if (!-[ISLivePhotoPlayer currentPlaybackStyle](self, "currentPlaybackStyle")
        && !-[ISLivePhotoPlayer isPlayingVitality](self, "isPlayingVitality"))
      {
        -[ISLivePhotoPlayer startPlaybackWithStyleWhenReady:](self, "startPlaybackWithStyleWhenReady:", 1);
      }
      if (-[ISLivePhotoPlayer isPlayingVitality](self, "isPlayingVitality"))
      {
        -[ISLivePhotoPlayer _setCurrentPlaybackStyle:](self, "_setCurrentPlaybackStyle:", 1);
        -[ISBasePlayer activeBehavior](self, "activeBehavior");
        v4 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "cancelSettleToPhoto");

      }
    }
  }
  else
  {
    -[ISLivePhotoPlayer stopPlayback](self, "stopPlayback");
  }
}

- (void)_invalidateApertureMode
{
  self->_isValid.apertureMode = 0;
}

- (void)_updateApertureModeIfNeeded
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  if (!self->_isValid.apertureMode)
  {
    self->_isValid.apertureMode = 1;
    -[ISBasePlayer activeBehavior](self, "activeBehavior");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "behaviorType");

    v5 = (_QWORD *)MEMORY[0x1E0C8AE10];
    if (v4 != 5)
      v5 = (_QWORD *)MEMORY[0x1E0C8AE18];
    -[ISBasePlayer setApertureMode:](self, "setApertureMode:", *v5);
  }
}

- (void)_invalidateScale
{
  self->_isValid.scale = 0;
}

- (void)_updateScaleIfNeeded
{
  double v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  double v15;
  ISPlayerOutputTransitionOptions *v16;

  if (!self->_isValid.scale)
  {
    self->_isValid.scale = 1;
    v3 = 1.0;
    if (-[ISLivePhotoPlayer currentPlaybackStyle](self, "currentPlaybackStyle"))
    {
      +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "scaleDuringPlayback");

      if (v5)
      {
        -[ISBasePlayer activeBehavior](self, "activeBehavior");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "behaviorType") == 2)
        {
          -[ISBasePlayer activeBehavior](self, "activeBehavior");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "isTransitioningToPhoto");

          if ((v8 & 1) == 0 && -[ISLivePhotoPlayer currentPlaybackStyle](self, "currentPlaybackStyle") != 4)
          {
            -[ISBasePlayer playerItem](self, "playerItem");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "playerContent");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "supportsVitality");

            if (v11)
            {
              -[ISBasePlayer playerItem](self, "playerItem");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "asset");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "options");

              if ((v14 & 2) != 0)
                v3 = 1.0;
              else
                v3 = 1.075;
            }
          }
        }
        else
        {

        }
      }
    }
    -[ISLivePhotoPlayer lastAppliedScale](self, "lastAppliedScale");
    if (v15 != v3)
    {
      self->_lastAppliedScale = v3;
      v16 = objc_alloc_init(ISPlayerOutputTransitionOptions);
      -[ISPlayerOutputTransitionOptions setTransitionDuration:](v16, "setTransitionDuration:", 0.3);
      -[ISBasePlayer applyScale:withTransitionOptions:completion:](self, "applyScale:withTransitionOptions:completion:", v16, 0, v3);

    }
  }
}

- (void)_setPlayingVitality:(BOOL)a3
{
  if (self->_playingVitality != a3)
  {
    self->_playingVitality = a3;
    -[ISObservable signalChange:](self, "signalChange:", 16);
  }
}

- (void)_setHinting:(BOOL)a3
{
  if (self->_hinting != a3)
  {
    self->_hinting = a3;
    -[ISObservable signalChange:](self, "signalChange:", 32);
  }
}

- (void)_setCurrentPlaybackStyle:(int64_t)a3
{
  _QWORD v3[6];

  if (self->_currentPlaybackStyle != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __46__ISLivePhotoPlayer__setCurrentPlaybackStyle___block_invoke;
    v3[3] = &unk_1E94541D0;
    v3[4] = self;
    v3[5] = a3;
    -[ISObservable performChanges:](self, "performChanges:", v3);
  }
}

- (void)setIsAttemptingToPlayback:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_isAttemptingToPlayback != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __47__ISLivePhotoPlayer_setIsAttemptingToPlayback___block_invoke;
    v3[3] = &unk_1E9453A58;
    v3[4] = self;
    v4 = a3;
    -[ISObservable performChanges:](self, "performChanges:", v3);
  }
}

- (void)_configurePlaybackFilters
{
  id v3;
  _QWORD v4[5];

  -[ISLivePhotoPlayer playbackFilters](self, "playbackFilters");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__ISLivePhotoPlayer__configurePlaybackFilters__block_invoke;
  v4[3] = &unk_1E9453658;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

- (void)_resetPlaybackFilters
{
  id v2;

  -[ISLivePhotoPlayer playbackFilters](self, "playbackFilters");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_846);

}

- (int64_t)_coalescedPlaybackFilterState
{
  void *v2;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ISLivePhotoPlayer playbackFilters](self, "playbackFilters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__ISLivePhotoPlayer__coalescedPlaybackFilterState__block_invoke;
  v5[3] = &unk_1E94536C0;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)_coalescedPlaybackFilterHintProgress
{
  void *v2;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ISLivePhotoPlayer playbackFilters](self, "playbackFilters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__ISLivePhotoPlayer__coalescedPlaybackFilterHintProgress__block_invoke;
  v5[3] = &unk_1E94536C0;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_configurePlaybackFilter:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setPlaybackDisabled:forReason:", -[ISBasePlayer status](self, "status") < 2, CFSTR("PlayerNotReady"));

}

- (void)_fadeInAudioIfNeeded
{
  void *v3;
  float v4;
  float v5;
  float v6;
  uint64_t v7;
  dispatch_time_t v8;
  _QWORD block[4];
  id v10;
  id location;
  _QWORD v12[5];
  float v13;
  _QWORD v14[5];

  if (-[ISLivePhotoPlayer _wantsAudioForPlaybackStyle:](self, "_wantsAudioForPlaybackStyle:", -[ISLivePhotoPlayer currentPlaybackStyle](self, "currentPlaybackStyle")))
  {
    -[ISBasePlayer videoPlayer](self, "videoPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "volume");
    v5 = v4;
    if (v4 < 1.0)
    {
      if (-[ISBasePlayer isAudioEnabled](self, "isAudioEnabled"))
      {
        v6 = sqrtf(v5) + 0.1;
        v7 = MEMORY[0x1E0C809B0];
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __41__ISLivePhotoPlayer__fadeInAudioIfNeeded__block_invoke_2;
        v12[3] = &unk_1E9453710;
        v12[4] = self;
        v13 = v6 * v6;
        -[ISObservable performChanges:](self, "performChanges:", v12);
        objc_initWeak(&location, self);
        v8 = dispatch_time(0, 100000000);
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __41__ISLivePhotoPlayer__fadeInAudioIfNeeded__block_invoke_3;
        block[3] = &unk_1E9453BF8;
        objc_copyWeak(&v10, &location);
        dispatch_after(v8, MEMORY[0x1E0C80D38], block);
        objc_destroyWeak(&v10);
        objc_destroyWeak(&location);
      }
    }

  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__ISLivePhotoPlayer__fadeInAudioIfNeeded__block_invoke;
    v14[3] = &unk_1E9454220;
    v14[4] = self;
    -[ISObservable performChanges:](self, "performChanges:", v14);
  }
}

- (void)didPerformChanges
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISLivePhotoPlayer;
  -[ISBasePlayer didPerformChanges](&v5, sel_didPerformChanges);
  -[ISBasePlayer videoPlayer](self, "videoPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLoopingEnabled:", objc_msgSend(v4, "loopingEnabled"));

  -[ISLivePhotoPlayer _updateScaleIfNeeded](self, "_updateScaleIfNeeded");
  -[ISLivePhotoPlayer _updateApertureModeIfNeeded](self, "_updateApertureModeIfNeeded");
}

- (BOOL)_wantsAudioForPlaybackStyle:(int64_t)a3
{
  return a3 == 1;
}

- (void)livePhotoPlaybackBehaviorWillTransitionToPhoto:(id)a3
{
  -[ISObservable performChanges:](self, "performChanges:", &__block_literal_global_26);
}

- (void)livePhotoPlaybackBehaviorDidFinish:(id)a3
{
  -[ISLivePhotoPlayer _resetPlaybackFilters](self, "_resetPlaybackFilters", a3);
  if (-[ISLivePhotoPlayer _coalescedPlaybackFilterState](self, "_coalescedPlaybackFilterState") != 2)
    -[ISLivePhotoPlayer _setCurrentPlaybackStyle:](self, "_setCurrentPlaybackStyle:", 0);
}

- (void)livePhotoSettleBehaviorDidFinish:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ISBasePlayer activeBehavior](self, "activeBehavior");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[ISLivePhotoPlayer _resetPlaybackFilters](self, "_resetPlaybackFilters");
    -[ISBasePlayer setActiveBehavior:](self, "setActiveBehavior:", 0);
    -[ISLivePhotoPlayer _setCurrentPlaybackStyle:](self, "_setCurrentPlaybackStyle:", 0);
    -[ISLivePhotoPlayer _playIfNeeded](self, "_playIfNeeded");
    -[ISLivePhotoPlayer _updatePlayerItemLoadingTarget](self, "_updatePlayerItemLoadingTarget");
  }
}

- (void)vitalityBehaviorDidEndPlaying:(id)a3
{
  -[ISLivePhotoPlayer _updateHintingAndVitality](self, "_updateHintingAndVitality", a3);
  -[ISLivePhotoPlayer _setCurrentPlaybackStyle:](self, "_setCurrentPlaybackStyle:", 0);
}

- (BOOL)vitalityBehaviorShouldEndPlayingAtPhoto:(id)a3
{
  return -[ISLivePhotoPlayer _coalescedPlaybackFilterState](self, "_coalescedPlaybackFilterState", a3) != 2;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  objc_super v9;
  _QWORD v10[6];

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__ISLivePhotoPlayer_observable_didChange_context___block_invoke;
  v10[3] = &unk_1E94541A8;
  v10[4] = self;
  v10[5] = a5;
  v8 = a3;
  is_dispatch_on_main_queue(v10);
  v9.receiver = self;
  v9.super_class = (Class)ISLivePhotoPlayer;
  -[ISBasePlayer observable:didChange:context:](&v9, sel_observable_didChange_context_, v8, a4, a5);

}

- (BOOL)isPlayingVitality
{
  return self->_playingVitality;
}

- (BOOL)isHinting
{
  return self->_hinting;
}

- (ISLivePhotoVitalityFilter)vitalityFilter
{
  return self->_vitalityFilter;
}

- (BOOL)isAttemptingToPlayback
{
  return self->_isAttemptingToPlayback;
}

- (void)_setIsAttemptingToPlayback:(BOOL)a3
{
  self->_isAttemptingToPlayback = a3;
}

- (BOOL)immediatelyShowsPhotoWhenPlaybackEnds
{
  return self->_immediatelyShowsPhotoWhenPlaybackEnds;
}

- (void)setImmediatelyShowsPhotoWhenPlaybackEnds:(BOOL)a3
{
  self->_immediatelyShowsPhotoWhenPlaybackEnds = a3;
}

- (BOOL)isPlaybackAllowed
{
  return self->_playbackAllowed;
}

- (int64_t)targetReadiness
{
  return self->_targetReadiness;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[15];
  return self;
}

- ($D31FB86CA7B02E89CA780FE277FE9EC8)trimTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[8].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[8].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[8].var1.var1;
  return self;
}

- (void)setTrimTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.var3;
  v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_trimTimeRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_trimTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_trimTimeRange.duration.timescale = v3;
}

- (int64_t)_styleToPlayWhenReady
{
  return self->__styleToPlayWhenReady;
}

- (void)_setStyleToPlayWhenReady:(int64_t)a3
{
  self->__styleToPlayWhenReady = a3;
}

- (BOOL)_settleAutomaticallyWhenReady
{
  return self->__settleAutomaticallyWhenReady;
}

- (void)_setSettleAutomaticallyWhenReady:(BOOL)a3
{
  self->__settleAutomaticallyWhenReady = a3;
}

- (BOOL)_shouldPrepareForVitalityWhenReady
{
  return self->__shouldPrepareForVitalityWhenReady;
}

- (void)_setShouldPrepareForVitalityWhenReady:(BOOL)a3
{
  self->__shouldPrepareForVitalityWhenReady = a3;
}

- (BOOL)_shouldPlayVitalityWhenReady
{
  return self->__shouldPlayVitalityWhenReady;
}

- (void)_setShouldPlayVitalityWhenReady:(BOOL)a3
{
  self->__shouldPlayVitalityWhenReady = a3;
}

- (BOOL)_shouldPrepareForHintWhenReady
{
  return self->__shouldPrepareForHintWhenReady;
}

- (void)_setShouldPrepareForHintWhenReady:(BOOL)a3
{
  self->__shouldPrepareForHintWhenReady = a3;
}

- (NSDate)_vitalityTimeoutDate
{
  return self->__vitalityTimeoutDate;
}

- (void)_setVitalityTimeoutDate:(id)a3
{
  objc_storeStrong((id *)&self->__vitalityTimeoutDate, a3);
}

uint64_t __50__ISLivePhotoPlayer_observable_didChange_context___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 40) == ISLivePhotoPlaybackFilterObservationContext)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "_handlePlaybackFilterDidChange");
    return objc_msgSend(*(id *)(v1 + 32), "_updatePlayerItemLoadingTarget");
  }
  return result;
}

uint64_t __68__ISLivePhotoPlayer_livePhotoPlaybackBehaviorWillTransitionToPhoto___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_invalidateScale");
}

uint64_t __41__ISLivePhotoPlayer__fadeInAudioIfNeeded__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "setVideoVolume:", a2);
}

uint64_t __41__ISLivePhotoPlayer__fadeInAudioIfNeeded__block_invoke_2(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setVideoVolume:", a2);
}

void __41__ISLivePhotoPlayer__fadeInAudioIfNeeded__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fadeInAudioIfNeeded");

}

uint64_t __46__ISLivePhotoPlayer__updateHintingAndVitality__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setPlayingVitality:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setHinting:", *(unsigned __int8 *)(a1 + 41));
}

uint64_t __57__ISLivePhotoPlayer__coalescedPlaybackFilterHintProgress__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  double v4;
  uint64_t v5;

  result = objc_msgSend(a2, "hintProgress");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v4 < *(double *)(v5 + 24))
    v4 = *(double *)(v5 + 24);
  *(double *)(v5 + 24) = v4;
  return result;
}

uint64_t __50__ISLivePhotoPlayer__coalescedPlaybackFilterState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(a2, "state");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (result > v5)
    v5 = result;
  *(_QWORD *)(v4 + 24) = v5;
  return result;
}

uint64_t __42__ISLivePhotoPlayer__resetPlaybackFilters__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reset");
}

uint64_t __46__ISLivePhotoPlayer__configurePlaybackFilters__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configurePlaybackFilter:", a2);
}

uint64_t __47__ISLivePhotoPlayer_setIsAttemptingToPlayback___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 306) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 64);
}

uint64_t __46__ISLivePhotoPlayer__setCurrentPlaybackStyle___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328) = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_invalidateScale");
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 8);
}

uint64_t __42__ISLivePhotoPlayer_stopPlaybackAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 128);
}

void __39__ISLivePhotoPlayer_setVitalityFilter___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleVitalityFilterDidChange:", v3);

}

uint64_t __44__ISLivePhotoPlayer_activeBehaviorDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateScale");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateApertureMode");
}

@end
