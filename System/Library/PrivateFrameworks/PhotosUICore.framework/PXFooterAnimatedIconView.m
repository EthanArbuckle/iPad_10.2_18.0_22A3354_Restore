@implementation PXFooterAnimatedIconView

- (PXFooterAnimatedIconView)initWithFrame:(CGRect)a3
{
  char *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  CMTime v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXFooterAnimatedIconView;
  v3 = -[PXFooterAnimatedIconView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.mobileslideshow.PXFooterAnimatedIconView", v5);
    v7 = (void *)*((_QWORD *)v3 + 55);
    *((_QWORD *)v3 + 55) = v6;

    v3[585] = 1;
    CMTimeMakeWithSeconds(&v14, 0.0, 60);
    v8 = *(_OWORD *)&v14.value;
    *((_QWORD *)v3 + 59) = v14.epoch;
    *(_OWORD *)(v3 + 456) = v8;
    CMTimeMakeWithSeconds(&v14, 2.0, 60);
    v9 = *(_OWORD *)&v14.value;
    *((_QWORD *)v3 + 62) = v14.epoch;
    *((_OWORD *)v3 + 30) = v9;
    CMTimeMakeWithSeconds(&v14, 14.0, 60);
    v10 = *(_OWORD *)&v14.value;
    *((_QWORD *)v3 + 65) = v14.epoch;
    *(_OWORD *)(v3 + 504) = v10;
    CMTimeMakeWithSeconds(&v14, 16.0, 60);
    v11 = *(_OWORD *)&v14.value;
    *((_QWORD *)v3 + 68) = v14.epoch;
    *((_OWORD *)v3 + 33) = v11;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel__applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel__applicationDidEnterForeground_, *MEMORY[0x1E0DC4860], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel__mediaServicesWereReset_, *MEMORY[0x1E0C89EE8], 0);

  }
  return (PXFooterAnimatedIconView *)v3;
}

- (void)dealloc
{
  objc_super v3;

  -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:", self->_gridCycleTimeObservationToken);
  v3.receiver = self;
  v3.super_class = (Class)PXFooterAnimatedIconView;
  -[PXFooterAnimatedIconView dealloc](&v3, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 75.0;
  v4 = 75.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXFooterAnimatedIconView;
  -[PXFooterAnimatedIconView setHidden:](&v5, sel_setHidden_);
  if (v3)
    -[PXFooterAnimatedIconView _addReasonToPause:](self, "_addReasonToPause:", 1);
  else
    -[PXFooterAnimatedIconView _removeReasonToPause:](self, "_removeReasonToPause:", 1);
}

- (void)_windowDidChange
{
  void *v3;

  -[PXFooterAnimatedIconView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PXFooterAnimatedIconView _removeReasonToPause:](self, "_removeReasonToPause:", 2);
  else
    -[PXFooterAnimatedIconView _addReasonToPause:](self, "_addReasonToPause:", 2);
}

- (int64_t)desiredMode
{
  os_unfair_lock_s *p_lock;
  int64_t lock_desiredMode;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_desiredMode = self->_lock_desiredMode;
  os_unfair_lock_unlock(p_lock);
  return lock_desiredMode;
}

- (void)setDesiredMode:(int64_t)a3
{
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFooterAnimatedIconView.m"), 159, CFSTR("%s must be called on the main thread"), "-[PXFooterAnimatedIconView setDesiredMode:]");

  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_desiredMode == a3)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    self->_lock_desiredMode = a3;
    os_unfair_lock_unlock(&self->_lock);
    -[PXFooterAnimatedIconView _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)setPlayerLayer:(id)a3
{
  AVPlayerLayer *playerLayer;
  AVPlayerLayer *v7;
  void *v8;
  void *v9;
  AVPlayerLayer *v10;

  v10 = (AVPlayerLayer *)a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFooterAnimatedIconView.m"), 173, CFSTR("%s must be called on the main thread"), "-[PXFooterAnimatedIconView setPlayerLayer:]");

  }
  playerLayer = self->_playerLayer;
  v7 = v10;
  if (playerLayer != v10)
  {
    -[AVPlayerLayer removeFromSuperlayer](playerLayer, "removeFromSuperlayer");
    objc_storeStrong((id *)&self->_playerLayer, a3);
    -[PXFooterAnimatedIconView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSublayer:", self->_playerLayer);

    -[PXFooterAnimatedIconView setNeedsLayout](self, "setNeedsLayout");
    v7 = v10;
  }

}

- (void)_updateStyle
{
  void *v4;
  uint64_t v5;
  NSObject *queue;
  void *v7;
  _QWORD block[4];
  id v9[2];
  id location;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFooterAnimatedIconView.m"), 184, CFSTR("%s must be called on the main thread"), "-[PXFooterAnimatedIconView _updateStyle]");

  }
  -[PXFooterAnimatedIconView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PXUserInterfaceStyleFromUITraitCollection();

  if (v5 != 2)
    v5 = v5 == 1;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PXFooterAnimatedIconView__updateStyle__block_invoke;
  block[3] = &unk_1E51447A0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)v5;
  dispatch_async(queue, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_addReasonToPause:(unint64_t)a3
{
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFooterAnimatedIconView.m"), 215, CFSTR("%s must be called on the main thread"), "-[PXFooterAnimatedIconView _addReasonToPause:]");

  }
  self->_reasonsToPause |= a3;
  -[PXFooterAnimatedIconView _updateIsPlayerPaused](self, "_updateIsPlayerPaused");
}

- (void)_removeReasonToPause:(unint64_t)a3
{
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFooterAnimatedIconView.m"), 221, CFSTR("%s must be called on the main thread"), "-[PXFooterAnimatedIconView _removeReasonToPause:]");

  }
  self->_reasonsToPause &= ~a3;
  -[PXFooterAnimatedIconView _updateIsPlayerPaused](self, "_updateIsPlayerPaused");
}

- (void)_updateIsPlayerPaused
{
  BOOL v4;
  NSObject *queue;
  void *v6;
  _QWORD block[4];
  id v8;
  BOOL v9;
  id location;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFooterAnimatedIconView.m"), 227, CFSTR("%s must be called on the main thread"), "-[PXFooterAnimatedIconView _updateIsPlayerPaused]");

  }
  v4 = self->_reasonsToPause != 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PXFooterAnimatedIconView__updateIsPlayerPaused__block_invoke;
  block[3] = &unk_1E5145760;
  objc_copyWeak(&v8, &location);
  v9 = v4;
  dispatch_async(queue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_layoutPlayer
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFooterAnimatedIconView.m"), 236, CFSTR("%s must be called on the main thread"), "-[PXFooterAnimatedIconView _layoutPlayer]");

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[PXFooterAnimatedIconView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PXFooterAnimatedIconView playerLayer](self, "playerLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)_setNeedsUpdate
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__PXFooterAnimatedIconView__setNeedsUpdate__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_update
{
  int64_t waitingState;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  id v11;
  id v12;
  unsigned int (**v13)(_QWORD);
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL (*v19)(uint64_t);
  void *v20;
  PXFooterAnimatedIconView *v21;
  id v22;
  id v23;
  int64_t v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[6];
  _QWORD aBlock[7];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[PXFooterAnimatedIconView isPlayerPaused](self, "isPlayerPaused"))
  {
    waitingState = self->_waitingState;
    self->_waitingState = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5 = v4;
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __35__PXFooterAnimatedIconView__update__block_invoke;
    aBlock[3] = &unk_1E511FD00;
    aBlock[4] = self;
    aBlock[5] = waitingState;
    aBlock[6] = v4;
    v7 = _Block_copy(aBlock);
    v27[0] = v6;
    v27[1] = 3221225472;
    v27[2] = __35__PXFooterAnimatedIconView__update__block_invoke_3;
    v27[3] = &unk_1E5141E60;
    v27[5] = v5;
    v27[4] = self;
    v8 = _Block_copy(v27);
    v25[0] = v6;
    v25[1] = 3221225472;
    v25[2] = __35__PXFooterAnimatedIconView__update__block_invoke_4;
    v25[3] = &unk_1E5148A40;
    v9 = v7;
    v26 = v9;
    v10 = (void (**)(_QWORD))_Block_copy(v25);
    v17 = v6;
    v18 = 3221225472;
    v19 = __35__PXFooterAnimatedIconView__update__block_invoke_5;
    v20 = &unk_1E511FD28;
    v21 = self;
    v22 = v9;
    v23 = v8;
    v24 = waitingState;
    v11 = v8;
    v12 = v9;
    v13 = (unsigned int (**)(_QWORD))_Block_copy(&v17);
    v14 = -[PXFooterAnimatedIconView presentedState](self, "presentedState", v17, v18, v19, v20, v21);
    v15 = -[PXFooterAnimatedIconView desiredMode](self, "desiredMode");
    v16 = 1;
    switch(v15)
    {
      case 0:
        goto LABEL_18;
      case 1:
        if (v14 < 2)
          goto LABEL_17;
        if (v14 != 4)
          goto LABEL_20;
        v16 = 6;
        goto LABEL_18;
      case 2:
        if (v14 < 2)
        {
          v10[2](v10);
LABEL_17:
          v16 = 2;
        }
        else if (v14 == 2)
        {
          if (v13[2](v13))
            v16 = 3;
          else
            v16 = 2;
        }
        else
        {
          if (v14 != 4)
            goto LABEL_20;
          v16 = 5;
        }
        goto LABEL_18;
      case 3:
        if (v14 >= 2)
        {
          if (v14 != 4)
            goto LABEL_20;
          if (v13[2](v13))
            v16 = 6;
          else
            v16 = 4;
        }
        else
        {
          v10[2](v10);
          v16 = 4;
        }
LABEL_18:
        if (v16 != v14)
          -[PXFooterAnimatedIconView _transitionToState:](self, "_transitionToState:");
LABEL_20:

        break;
      default:
        goto LABEL_20;
    }
  }
}

- (void)_transitionToState:(int64_t)a3
{
  uint64_t v5;
  $95D729B680665BEAEFA1D6FCA8238556 *p_introStartTime;
  uint64_t v7;
  char *v8;
  char *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  int64_t epoch;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[PXFooterAnimatedIconView setWantsGridCycleTimeObservation:](self, "setWantsGridCycleTimeObservation:", 0);
  switch(a3)
  {
    case 1:
      -[PXFooterAnimatedIconView _hideVideo](self, "_hideVideo");
      return;
    case 2:
      v5 = 456;
      goto LABEL_6;
    case 3:
      p_introStartTime = &self->_introStartTime;
      v7 = 480;
      goto LABEL_9;
    case 4:
      v5 = 504;
LABEL_6:
      v8 = (char *)self + v5;
      v12 = *(_OWORD *)v8;
      epoch = *((_QWORD *)v8 + 2);
      -[PXFooterAnimatedIconView _seekToTime:](self, "_seekToTime:", &v12);
      return;
    case 5:
      p_introStartTime = &self->_loopStartTime;
      v7 = 504;
      goto LABEL_9;
    case 6:
      p_introStartTime = &self->_loopEndTime;
      v7 = 528;
LABEL_9:
      v9 = (char *)self + v7;
      v12 = *(_OWORD *)&p_introStartTime->value;
      epoch = p_introStartTime->epoch;
      v10 = *(_OWORD *)v9;
      v11 = *((_QWORD *)v9 + 2);
      -[PXFooterAnimatedIconView _playFromTime:toTime:](self, "_playFromTime:toTime:", &v12, &v10);
      break;
    default:
      return;
  }
}

- (BOOL)wantsGridCycleTimeObservation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return self->_wantsGridCycleTimeObservation;
}

- (void)setWantsGridCycleTimeObservation:(BOOL)a3
{
  _BOOL4 wantsGridCycleTimeObservation;
  id gridCycleTimeObservationToken;
  AVPlayer *player;
  OS_dispatch_queue *queue;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  CMTime v12;
  id location;

  wantsGridCycleTimeObservation = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_wantsGridCycleTimeObservation != wantsGridCycleTimeObservation)
  {
    self->_wantsGridCycleTimeObservation = wantsGridCycleTimeObservation;
    if (self->_gridCycleTimeObservationToken)
    {
      -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:");
      gridCycleTimeObservationToken = self->_gridCycleTimeObservationToken;
      self->_gridCycleTimeObservationToken = 0;

      wantsGridCycleTimeObservation = self->_wantsGridCycleTimeObservation;
    }
    if (wantsGridCycleTimeObservation)
    {
      objc_initWeak(&location, self);
      player = self->_player;
      CMTimeMakeWithSeconds(&v12, 2.0, 60);
      queue = self->_queue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __61__PXFooterAnimatedIconView_setWantsGridCycleTimeObservation___block_invoke;
      v10[3] = &unk_1E5143B80;
      objc_copyWeak(&v11, &location);
      -[AVPlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](player, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v12, queue, v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self->_gridCycleTimeObservationToken;
      self->_gridCycleTimeObservationToken = v8;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_crossedGridCycleBoundary
{
  float v3;
  AVPlayer *player;
  _QWORD block[5];
  CMTime time2;
  CMTime time1;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[AVPlayer rate](self->_player, "rate");
  if (v3 > 0.0)
  {
    player = self->_player;
    if (player)
      -[AVPlayer currentTime](player, "currentTime");
    else
      memset(&time1, 0, sizeof(time1));
    time2 = (CMTime)self->_loopEndTime;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__PXFooterAnimatedIconView__crossedGridCycleBoundary__block_invoke;
      block[3] = &unk_1E5149198;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

- (void)_hideVideo
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[PXFooterAnimatedIconView setIsPlayerHidden:](self, "setIsPlayerHidden:", 1);
}

- (void)_createPlayerIfNeeded
{
  void *v3;
  AVPlayer *v4;
  AVPlayer *player;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_player)
  {
    -[PXFooterAnimatedIconView _movieURL](self, "_movieURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (AVPlayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B2E8]), "initWithURL:", v3);
      player = self->_player;
      self->_player = v4;

      -[AVPlayer _setDisallowsVideoLayerDisplayCompositing:](self->_player, "_setDisallowsVideoLayerDisplayCompositing:", 1);
      -[AVPlayer setPreventsDisplaySleepDuringVideoPlayback:](self->_player, "setPreventsDisplaySleepDuringVideoPlayback:", 0);
      -[AVPlayer setAllowsExternalPlayback:](self->_player, "setAllowsExternalPlayback:", 0);
      -[AVPlayer setMuted:](self->_player, "setMuted:", 1);
      -[AVPlayer setActionAtItemEnd:](self->_player, "setActionAtItemEnd:", 1);
      -[AVPlayer currentItem](self->_player, "currentItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFooterAnimatedIconView setPlayerItem:](self, "setPlayerItem:", v6);

      objc_msgSend(MEMORY[0x1E0C8B330], "playerLayerWithPlayer:", self->_player);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", self->_isPlayerHidden);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __49__PXFooterAnimatedIconView__createPlayerIfNeeded__block_invoke;
      v9[3] = &unk_1E5148D08;
      v9[4] = self;
      v10 = v7;
      v8 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], v9);

    }
  }
}

- (void)_seekToTime:(id *)a3
{
  OS_dispatch_queue *v5;
  AVPlayer *player;
  OS_dispatch_queue *v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  _QWORD v13[4];
  OS_dispatch_queue *v14;
  id v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[PXFooterAnimatedIconView _createPlayerIfNeeded](self, "_createPlayerIfNeeded");
  -[AVPlayer pause](self->_player, "pause");
  objc_initWeak(&location, self);
  v5 = self->_queue;
  player = self->_player;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__PXFooterAnimatedIconView__seekToTime___block_invoke;
  v13[3] = &unk_1E511FD50;
  v7 = v5;
  v14 = v7;
  objc_copyWeak(&v15, &location);
  v16 = *a3;
  v12 = *a3;
  v10 = *MEMORY[0x1E0CA2E68];
  v11 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v8 = *MEMORY[0x1E0CA2E68];
  v9 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  -[AVPlayer seekToTime:toleranceBefore:toleranceAfter:completionHandler:](player, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v12, &v10, &v8, v13);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

- (void)_didSeekToTime:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[PXFooterAnimatedIconView setIsPlayerHidden:](self, "setIsPlayerHidden:", 0);
}

- (void)_playFromTime:(id *)a3 toTime:(id *)a4
{
  OS_dispatch_queue *v7;
  AVPlayer *player;
  OS_dispatch_queue *v9;
  int64_t var3;
  int64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16;
  _QWORD v17[4];
  OS_dispatch_queue *v18;
  id v19;
  __int128 v20;
  int64_t v21;
  __int128 v22;
  int64_t v23;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[PXFooterAnimatedIconView _createPlayerIfNeeded](self, "_createPlayerIfNeeded");
  -[AVPlayer pause](self->_player, "pause");
  objc_initWeak(&location, self);
  v7 = self->_queue;
  player = self->_player;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__PXFooterAnimatedIconView__playFromTime_toTime___block_invoke;
  v17[3] = &unk_1E511FDA0;
  v9 = v7;
  v18 = v9;
  objc_copyWeak(&v19, &location);
  v20 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v22 = *(_OWORD *)&a4->var0;
  v11 = a4->var3;
  v21 = var3;
  v23 = v11;
  v16 = *a3;
  v14 = *MEMORY[0x1E0CA2E68];
  v15 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v12 = *MEMORY[0x1E0CA2E68];
  v13 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  -[AVPlayer seekToTime:toleranceBefore:toleranceAfter:completionHandler:](player, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v16, &v14, &v12, v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

- (void)_didSeekToPlayFromTime:(id *)a3 toTime:(id *)a4
{
  void *v7;
  $95D729B680665BEAEFA1D6FCA8238556 loopStartTime;
  CMTime time1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = *a4;
  -[AVPlayer currentItem](self->_player, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setForwardPlaybackEndTime:", &v10);

  -[AVPlayer play](self->_player, "play");
  -[PXFooterAnimatedIconView setIsPlayerHidden:](self, "setIsPlayerHidden:", 0);
  time1 = *(CMTime *)a3;
  loopStartTime = self->_loopStartTime;
  if (!CMTimeCompare(&time1, (CMTime *)&loopStartTime))
  {
    time1 = (CMTime)*a4;
    loopStartTime = self->_loopEndTime;
    if (!CMTimeCompare(&time1, (CMTime *)&loopStartTime))
      -[PXFooterAnimatedIconView setWantsGridCycleTimeObservation:](self, "setWantsGridCycleTimeObservation:", 1);
  }
}

- (AVPlayerItem)playerItem
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
  AVPlayerItem **p_playerItem;
  AVPlayerItem *playerItem;
  _QWORD *v7;
  void *v8;
  void *v9;
  AVPlayerItem *v10;

  v10 = (AVPlayerItem *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_playerItem = &self->_playerItem;
  playerItem = self->_playerItem;
  if (playerItem != v10)
  {
    v7 = (_QWORD *)MEMORY[0x1E0C8AC48];
    if (playerItem)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", self, *v7, *p_playerItem);

    }
    objc_storeStrong((id *)&self->_playerItem, a3);
    if (*p_playerItem)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__didPlayerToEndTime_, *v7, *p_playerItem);

    }
  }

}

- (BOOL)isPlayerHidden
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return self->_isPlayerHidden;
}

- (void)setIsPlayerHidden:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];
  BOOL v6;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isPlayerHidden != v3)
  {
    self->_isPlayerHidden = v3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__PXFooterAnimatedIconView_setIsPlayerHidden___block_invoke;
    v5[3] = &unk_1E5144398;
    v5[4] = self;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }
}

- (BOOL)isPlayerPaused
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return self->_isPlayerPaused;
}

- (void)setIsPlayerPaused:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  float v6;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isPlayerPaused != v3)
  {
    self->_isPlayerPaused = v3;
    if (v3)
    {
      -[AVPlayer rate](self->_player, "rate");
      self->_playerRateBeforePause = v6;
      -[AVPlayer pause](self->_player, "pause");
    }
    else
    {
      *(float *)&v5 = self->_playerRateBeforePause;
      -[AVPlayer setRate:](self->_player, "setRate:", v5);
      -[PXFooterAnimatedIconView _update](self, "_update");
    }
  }
}

- (int64_t)presentedState
{
  int64_t result;
  float v4;
  CMTime v5;
  CMTime time2;
  CMTime v7;
  CMTime rhs;
  CMTime lhs;
  CMTime time;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[AVPlayer status](self->_player, "status") != AVPlayerStatusReadyToPlay
    || -[PXFooterAnimatedIconView isPlayerHidden](self, "isPlayerHidden"))
  {
    return 1;
  }
  memset(&v7, 0, sizeof(v7));
  result = (int64_t)self->_player;
  if (result)
  {
    objc_msgSend((id)result, "currentTime");
    if ((v7.flags & 0x1D) == 1)
    {
      -[AVPlayer rate](self->_player, "rate");
      if (v4 == 0.0)
      {
        lhs = (CMTime)self->_introStartTime;
        rhs = (CMTime)self->_loopStartTime;
        CMTimeAdd(&time, &lhs, &rhs);
        CMTimeMultiplyByFloat64(&time2, &time, 0.5);
        time = v7;
        if (CMTimeCompare(&time, &time2) < 0)
        {
          return 2;
        }
        else
        {
          lhs = (CMTime)self->_loopEndTime;
          rhs = (CMTime)self->_outroEndTime;
          CMTimeAdd(&time, &lhs, &rhs);
          CMTimeMultiplyByFloat64(&v5, &time, 0.5);
          time = v7;
          if (CMTimeCompare(&time, &v5) >= 1)
            return 2;
          else
            return 4;
        }
      }
      else
      {
        time = v7;
        lhs = (CMTime)self->_loopStartTime;
        if (CMTimeCompare(&time, &lhs) < 1)
        {
          return 3;
        }
        else
        {
          time = v7;
          lhs = (CMTime)self->_loopEndTime;
          if (CMTimeCompare(&time, &lhs) < 1)
          {
            return 5;
          }
          else
          {
            time = v7;
            lhs = (CMTime)self->_outroEndTime;
            if (CMTimeCompare(&time, &lhs) >= 1)
              return 0;
            else
              return 6;
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)isObscured
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  px_dispatch_on_main_queue_sync();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (int64_t)style
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  void *v5;
  AVPlayer *player;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  AVPlayer *v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  int v21;
  id location;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_style != a3)
  {
    self->_style = a3;
    -[PXFooterAnimatedIconView _movieURL](self, "_movieURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v27 = 0uLL;
      v28 = 0;
      player = self->_player;
      if (player)
      {
        -[AVPlayer currentTime](player, "currentTime");
        player = self->_player;
      }
      v25 = 0uLL;
      v26 = 0;
      -[AVPlayer currentItem](player, "currentItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "forwardPlaybackEndTime");
      }
      else
      {
        v25 = 0uLL;
        v26 = 0;
      }

      -[AVPlayer rate](self->_player, "rate");
      v10 = v9;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B300]), "initWithURL:", v5);
      -[AVPlayer replaceCurrentItemWithPlayerItem:](self->_player, "replaceCurrentItemWithPlayerItem:", v11);
      -[PXFooterAnimatedIconView setPlayerItem:](self, "setPlayerItem:", v11);
      v23 = v25;
      v24 = v26;
      objc_msgSend(v11, "setForwardPlaybackEndTime:", &v23);
      if ((BYTE12(v27) & 0x1D) == 1)
      {
        objc_initWeak(&location, self->_player);
        v12 = self->_player;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __37__PXFooterAnimatedIconView_setStyle___block_invoke;
        v19[3] = &unk_1E511FDC8;
        objc_copyWeak(&v20, &location);
        v21 = v10;
        v17 = v27;
        v18 = v28;
        v15 = *MEMORY[0x1E0CA2E68];
        v16 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        v13 = v15;
        v14 = v16;
        -[AVPlayer seekToTime:toleranceBefore:toleranceAfter:completionHandler:](v12, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v17, &v15, &v13, v19);
        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }

    }
  }
}

- (id)_movieURL
{
  int64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = -[PXFooterAnimatedIconView style](self, "style");
  v4 = CFSTR("PXFooterAnimationLightWithAlpha");
  if (v3 != 1)
    v4 = 0;
  if (v3 == 2)
    v5 = CFSTR("PXFooterAnimationDarkWithAlpha");
  else
    v5 = v4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/Photos/Resources/PXFooterAnimation.bundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("mov"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFooterAnimatedIconView;
  -[PXFooterAnimatedIconView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXFooterAnimatedIconView _updateStyle](self, "_updateStyle");
  -[PXFooterAnimatedIconView _layoutPlayer](self, "_layoutPlayer");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFooterAnimatedIconView;
  -[PXFooterAnimatedIconView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PXFooterAnimatedIconView _windowDidChange](self, "_windowDidChange");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXFooterAnimatedIconView;
  -[PXFooterAnimatedIconView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PXFooterAnimatedIconView _updateStyle](self, "_updateStyle");
}

- (void)_applicationDidEnterBackground:(id)a3
{
  -[PXFooterAnimatedIconView _addReasonToPause:](self, "_addReasonToPause:", 4);
}

- (void)_applicationDidEnterForeground:(id)a3
{
  -[PXFooterAnimatedIconView _removeReasonToPause:](self, "_removeReasonToPause:", 4);
}

- (void)_mediaServicesWereReset:(id)a3
{
  px_dispatch_on_main_queue();
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong(&self->_gridCycleTimeObservationToken, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __52__PXFooterAnimatedIconView__mediaServicesWereReset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 448);
  *(_QWORD *)(v2 + 448) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 592);
  *(_QWORD *)(v4 + 592) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_setNeedsUpdate");
}

void __37__PXFooterAnimatedIconView_setStyle___block_invoke(uint64_t a1, int a2)
{
  int v2;
  double v3;
  id WeakRetained;

  if (a2)
  {
    v2 = *(_DWORD *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    LODWORD(v3) = v2;
    objc_msgSend(WeakRetained, "setRate:", v3);

  }
}

void __38__PXFooterAnimatedIconView_isObscured__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "window");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v3, "convertRect:fromView:", *(_QWORD *)(a1 + 32));
  PXRectGetCenter();
  objc_msgSend(v3, "hitTest:withEvent:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != *(void **)(a1 + 32);

}

uint64_t __46__PXFooterAnimatedIconView_setIsPlayerHidden___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "playerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", v2);

  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __49__PXFooterAnimatedIconView__playFromTime_toTime___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD block[4];
  id v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  if (a2)
  {
    v3 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PXFooterAnimatedIconView__playFromTime_toTime___block_invoke_2;
    block[3] = &unk_1E511FD78;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    v6 = *(_OWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 64);
    v8 = *(_OWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 88);
    dispatch_async(v3, block);
    objc_destroyWeak(&v5);
  }
}

void __49__PXFooterAnimatedIconView__playFromTime_toTime___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = *(_OWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 56);
  v3 = *(_OWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 80);
  objc_msgSend(WeakRetained, "_didSeekToPlayFromTime:toTime:", &v5, &v3);

}

void __40__PXFooterAnimatedIconView__seekToTime___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  __int128 v6;
  uint64_t v7;

  if (a2)
  {
    v3 = *(NSObject **)(a1 + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __40__PXFooterAnimatedIconView__seekToTime___block_invoke_2;
    v4[3] = &unk_1E5142558;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    v6 = *(_OWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 64);
    dispatch_async(v3, v4);
    objc_destroyWeak(&v5);
  }
}

void __40__PXFooterAnimatedIconView__seekToTime___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  __int128 v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(WeakRetained, "_didSeekToTime:", &v3);

}

uint64_t __49__PXFooterAnimatedIconView__createPlayerIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlayerLayer:", *(_QWORD *)(a1 + 40));
}

void __53__PXFooterAnimatedIconView__crossedGridCycleBoundary__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PXFooterAnimatedIconViewCrossedGridCycleBoundaryNotificationName"), *(_QWORD *)(a1 + 32));

}

void __61__PXFooterAnimatedIconView_setWantsGridCycleTimeObservation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_crossedGridCycleBoundary");

}

void __35__PXFooterAnimatedIconView__update__block_invoke(uint64_t a1, uint64_t a2)
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 568) = a2;
  if (*(_QWORD *)(a1 + 40) != a2)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576) = *(_QWORD *)(a1 + 48);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = dispatch_time(0, 200000000);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 440);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PXFooterAnimatedIconView__update__block_invoke_2;
  v5[3] = &unk_1E5148D30;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

BOOL __35__PXFooterAnimatedIconView__update__block_invoke_3(uint64_t a1, double a2)
{
  double v2;
  double v3;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(*(_QWORD *)(a1 + 32) + 576);
  return v2 < v3 + a2 && v2 >= v3;
}

uint64_t __35__PXFooterAnimatedIconView__update__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL __35__PXFooterAnimatedIconView__update__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  void (*v5)(void);
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 != 2)
  {
    if (v2 != 1)
      return v2 == 0;
    if (objc_msgSend(*(id *)(a1 + 32), "isObscured"))
      v4 = 1;
    else
      v4 = 2;
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4);
    return 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isObscured"))
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_12:
    v5();
    return 0;
  }
  v6 = *(_QWORD *)(a1 + 48);
  +[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationDelay");
  LODWORD(v6) = (*(uint64_t (**)(uint64_t))(v6 + 16))(v6);

  if ((_DWORD)v6)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_12;
  }
  return 1;
}

void __35__PXFooterAnimatedIconView__update__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_update");

}

void __43__PXFooterAnimatedIconView__setNeedsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_update");

}

void __49__PXFooterAnimatedIconView__updateIsPlayerPaused__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(unsigned __int8 *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsPlayerPaused:", v1);

}

void __40__PXFooterAnimatedIconView__updateStyle__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setStyle:", v1);

}

@end
