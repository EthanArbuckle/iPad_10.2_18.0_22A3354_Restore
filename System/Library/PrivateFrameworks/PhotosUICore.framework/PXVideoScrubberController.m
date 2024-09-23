@implementation PXVideoScrubberController

- (PXVideoScrubberController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoScrubberController.m"), 63, CFSTR("%s is not available as initializer"), "-[PXVideoScrubberController init]");

  abort();
}

- (PXVideoScrubberController)initWithTarget:(id)a3 estimatedDuration:(double)a4
{
  id v8;
  char *v9;
  uint64_t v10;
  __int128 *v11;
  uint64_t v12;
  __int128 v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PXVideoScrubberController;
  v9 = -[PXVideoScrubberController init](&v23, sel_init);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PXVideoScrubberController.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target != nil"));

    }
    *((double *)v9 + 16) = a4;
    objc_storeStrong((id *)v9 + 15, a3);
    objc_initWeak(&location, v9);
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__PXVideoScrubberController_initWithTarget_estimatedDuration___block_invoke;
    v20[3] = &unk_1E5148D30;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v8, "setDurationChangeHandler:", v20);
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __62__PXVideoScrubberController_initWithTarget_estimatedDuration___block_invoke_2;
    v18[3] = &unk_1E5148D30;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v8, "setStatusChangeHandler:", v18);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __62__PXVideoScrubberController_initWithTarget_estimatedDuration___block_invoke_3;
    v16[3] = &unk_1E5148D30;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v8, "setPlayerItemChangeHandler:", v16);
    v9[104] = 1;
    v9[105] = 1;
    v9[106] = 1;
    v11 = (__int128 *)MEMORY[0x1E0CA2E18];
    v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    *((_QWORD *)v9 + 22) = v12;
    v13 = *v11;
    *((_OWORD *)v9 + 10) = *v11;
    *(_OWORD *)(v9 + 184) = v13;
    *((_QWORD *)v9 + 25) = v12;
    objc_msgSend(v9, "_addObservers");
    objc_msgSend(v9, "_updateIfNeeded");
    v9[110] = objc_opt_respondsToSelector() & 1;
    v9[111] = objc_opt_respondsToSelector() & 1;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return (PXVideoScrubberController *)v9;
}

- (void)dealloc
{
  objc_super v3;

  -[PXVideoScrubberController _removeObservers](self, "_removeObservers");
  v3.receiver = self;
  v3.super_class = (Class)PXVideoScrubberController;
  -[PXVideoScrubberController dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $F233249C77DA7ADED1F889735C9F43D6 *p_videoScrubberDelegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_videoScrubberDelegateFlags = &self->_videoScrubberDelegateFlags;
    p_videoScrubberDelegateFlags->respondsToDidUpdate = objc_opt_respondsToSelector() & 1;
    p_videoScrubberDelegateFlags->respondsToLengthForDuration = objc_opt_respondsToSelector() & 1;
    p_videoScrubberDelegateFlags->respondsToDesiredSeekTime = objc_opt_respondsToSelector() & 1;
  }

}

- (double)length
{
  double v3;
  double Seconds;
  void *v5;
  void *v6;
  double result;
  CMTime v8;
  CMTime v9;

  -[PXVideoScrubberController estimatedDuration](self, "estimatedDuration");
  Seconds = v3;
  memset(&v9, 0, sizeof(v9));
  -[PXVideoScrubberController target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "currentItemDuration");
  else
    memset(&v9, 0, sizeof(v9));

  if ((v9.flags & 0x1D) == 1)
  {
    v8 = v9;
    Seconds = CMTimeGetSeconds(&v8);
  }
  -[PXVideoScrubberController _lengthForDuration:](self, "_lengthForDuration:", Seconds);
  return result;
}

- (double)playheadProgress
{
  double result;

  -[PXVideoScrubberController _playheadTime](self, "_playheadTime");
  -[PXVideoScrubberController _progressForTime:](self, "_progressForTime:");
  return result;
}

- (void)setPlayheadProgress:(double)a3
{
  -[PXVideoScrubberController _setPlayheadProgress:andSeekVideoPlayer:](self, "_setPlayheadProgress:andSeekVideoPlayer:", 1, a3);
}

- (void)_setPlayheadProgress:(double)a3 andSeekVideoPlayer:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;

  v4 = a4;
  -[PXVideoScrubberController _timeForProgress:](self, "_timeForProgress:", a3);
  v7 = v6;
  if (v4)
    -[PXVideoScrubberController _seekToTime:](self, "_seekToTime:", v6);
  -[PXVideoScrubberController _setPlayheadTime:](self, "_setPlayheadTime:", v7);
}

- (void)beginSeeking
{
  if (self->_targetFlags.respondsToWillBeginSeeking)
    -[PXVideoScrubberControllerTarget videoScrubberControllerWillBeginSeeking:](self->_target, "videoScrubberControllerWillBeginSeeking:", self);
}

- (void)endSeeking
{
  if (self->_targetFlags.respondsToDidEndSeeking)
    -[PXVideoScrubberControllerTarget videoScrubberControllerDidEndSeeking:](self->_target, "videoScrubberControllerDidEndSeeking:", self);
}

- (AVPlayerItem)currentPlayerItem
{
  void *v2;
  void *v3;

  -[PXVideoScrubberController target](self, "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPlayerItem *)v3;
}

- (float)playRate
{
  void *v2;
  float v3;
  float v4;

  -[PXVideoScrubberController target](self, "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playRate");
  v4 = v3;

  return v4;
}

- (void)_seekToTime:(double)a3
{
  PXScrubberSeekRequest *v5;
  void *v6;
  PXScrubberSeekRequest *v7;

  v5 = [PXScrubberSeekRequest alloc];
  -[PXVideoScrubberController target](self, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXScrubberSeekRequest initWithTarget:seekTime:](v5, "initWithTarget:seekTime:", v6, a3);

  -[PXVideoScrubberController _setPendingSeekRequest:](self, "_setPendingSeekRequest:", v7);
  -[PXVideoScrubberController _updateSeeking](self, "_updateSeeking");

}

- (void)_updateSeeking
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  Float64 v14;
  void *v15;
  id v16;
  void *v17;
  CMTimeEpoch epoch;
  uint64_t v19;
  dispatch_time_t v20;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  CMTime v25;
  CMTime v26;
  _QWORD v27[4];
  id v28;
  id v29;
  CMTime v30;
  id from;
  id location;
  CMTime v33;
  CMTime time;
  __int128 v35;
  uint64_t v36;

  -[PXVideoScrubberController _activeSeekRequest](self, "_activeSeekRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoScrubberController target](self, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXVideoScrubberController _pendingSeekRequest](self, "_pendingSeekRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dateCreated");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", v7);
      v9 = v8;

      if (v9 >= 60.0 || v9 < 0.0)
      {
        objc_msgSend(v4, "cancelPendingSeeks");
        -[PXVideoScrubberController _setActiveSeekRequest:](self, "_setActiveSeekRequest:", 0);

        v3 = 0;
      }
    }
  }
  -[PXVideoScrubberController _pendingSeekRequest](self, "_pendingSeekRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "playerStatus");
  if (v10)
  {
    v12 = v11;
    objc_msgSend(v10, "seekTime");
    v14 = v13;
    v35 = 0uLL;
    v36 = 0;
    if (v4)
      objc_msgSend(v4, "currentItemDuration");
    memset(&time, 0, sizeof(time));
    CMTimeMakeWithSeconds(&time, v14, 100);
    if (self->_videoScrubberDelegateFlags.respondsToDesiredSeekTime)
    {
      -[PXVideoScrubberController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = time;
      objc_msgSend(v15, "videoScrubberController:desiredSeekTime:", self, &v33);

    }
    if (!v3 && v12 == 1)
    {
      v16 = v10;
      -[PXVideoScrubberController _setActiveSeekRequest:](self, "_setActiveSeekRequest:", v16);
      -[PXVideoScrubberController _setPendingSeekRequest:](self, "_setPendingSeekRequest:", 0);
      objc_initWeak(&location, self);
      objc_initWeak(&from, v16);
      objc_msgSend(v4, "playerItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = time;
      v21 = v17;
      if (objc_msgSend(v17, "px_loadedTimeRangesContainTime:", &v30))
      {
        *(_OWORD *)&v33.value = *MEMORY[0x1E0CA2E68];
        epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      }
      else
      {
        CMTimeMakeWithSeconds(&v30, 0.0001, 10000);
        *(_OWORD *)&v33.value = *(_OWORD *)&v30.value;
        epoch = v30.epoch;
      }
      v33.epoch = epoch;
      v19 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __43__PXVideoScrubberController__updateSeeking__block_invoke;
      v27[3] = &unk_1E5140988;
      objc_copyWeak(&v28, &location);
      objc_copyWeak(&v29, &from);
      v30 = time;
      v26 = v33;
      v25 = v33;
      objc_msgSend(v4, "videoScrubberController:seekToTime:toleranceBefore:toleranceAfter:completionHandler:", self, &v30, &v26, &v25, v27);
      v20 = dispatch_time(0, 60000000000);
      block[0] = v19;
      block[1] = 3221225472;
      block[2] = __43__PXVideoScrubberController__updateSeeking__block_invoke_3;
      block[3] = &unk_1E5144DF8;
      objc_copyWeak(&v23, &location);
      objc_copyWeak(&v24, &from);
      dispatch_after(v20, MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&v28);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

    }
  }
  -[PXVideoScrubberController _updateIfNeeded](self, "_updateIfNeeded");

}

- (void)_seekRequest:(id)a3 didFinish:(BOOL)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  if (v5)
  {
    v7 = v5;
    -[PXVideoScrubberController _activeSeekRequest](self, "_activeSeekRequest");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v7;
    if (v6 == v7)
    {
      -[PXVideoScrubberController _setActiveSeekRequest:](self, "_setActiveSeekRequest:", 0);
      -[PXVideoScrubberController _updateSeeking](self, "_updateSeeking");
      v5 = v7;
    }
  }

}

- (void)_handleTimeoutCallbackForSeekRequest:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    -[PXVideoScrubberController _activeSeekRequest](self, "_activeSeekRequest");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    if (v5 == v6)
    {
      -[PXVideoScrubberController _updateSeeking](self, "_updateSeeking");
      v4 = v6;
    }
  }

}

- (void)_setActiveSeekRequest:(id)a3
{
  PXScrubberSeekRequest *v5;
  PXScrubberSeekRequest *v6;

  v5 = (PXScrubberSeekRequest *)a3;
  if (self->__activeSeekRequest != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__activeSeekRequest, a3);
    -[PXVideoScrubberController _invalidate](self, "_invalidate");
    v5 = v6;
  }

}

- (void)_addObservers
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id playerObserver;
  _QWORD v9[4];
  id v10;
  id v11;
  CMTime v12;
  id from;
  id location;

  objc_initWeak(&location, self);
  -[PXVideoScrubberController target](self, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&from, v3);

  v4 = objc_loadWeakRetained(&from);
  CMTimeMakeWithSeconds(&v12, 0.03, 100);
  v5 = MEMORY[0x1E0C80D38];
  v6 = MEMORY[0x1E0C80D38];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__PXVideoScrubberController__addObservers__block_invoke;
  v9[3] = &unk_1E51409B0;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  objc_msgSend(v4, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v12, v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  playerObserver = self->_playerObserver;
  self->_playerObserver = v7;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_removeObservers
{
  void *v3;
  id playerObserver;

  -[PXVideoScrubberController target](self, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTimeObserver:", self->_playerObserver);

  playerObserver = self->_playerObserver;
  self->_playerObserver = 0;

}

- (void)_playerDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXVideoScrubberController target](self, "target");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PXVideoScrubberController _invalidateAvPlayerCurrentTime](self, "_invalidateAvPlayerCurrentTime");
    -[PXVideoScrubberController _updateIfNeeded](self, "_updateIfNeeded");
  }
}

- (void)_playerItemDurationDidChange
{
  -[PXVideoScrubberController _invalidateAvPlayerDuration](self, "_invalidateAvPlayerDuration");
  -[PXVideoScrubberController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_playerItemDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__PXVideoScrubberController__playerItemDidChange__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXVideoScrubberController performChanges:](self, "performChanges:", v2);
}

- (double)_duration
{
  double result;
  CMTime v4[2];

  memset(&v4[1], 0, sizeof(CMTime));
  -[PXVideoScrubberController _avPlayerDuration](self, "_avPlayerDuration");
  if ((unsigned __int128)0 >> 96 == 1)
  {
    v4[0] = v4[1];
    result = CMTimeGetSeconds(v4);
  }
  else
  {
    -[PXVideoScrubberController estimatedDuration](self, "estimatedDuration");
  }
  if (result == 0.0)
    return 1.0;
  return result;
}

- (double)_timeForProgress:(double)a3
{
  double v3;
  double v4;
  double v5;

  v3 = fmax(a3, 0.0);
  if (v3 <= 1.0)
    v4 = v3;
  else
    v4 = 1.0;
  -[PXVideoScrubberController _duration](self, "_duration");
  return v4 * v5;
}

- (double)_progressForTime:(double)a3
{
  double v4;
  double v5;
  double v6;

  -[PXVideoScrubberController _duration](self, "_duration");
  v5 = 0.0;
  if (v4 > 0.0)
  {
    v6 = fmax(a3, 0.0);
    if (v4 < v6)
      v6 = v4;
    return v6 / v4;
  }
  return v5;
}

- (double)_lengthForDuration:(double)a3
{
  void *v5;
  double v6;
  double v7;

  if (!self->_videoScrubberDelegateFlags.respondsToLengthForDuration)
    return a3 * 60.0;
  -[PXVideoScrubberController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoScrubberController:lengthForDuration:", self, a3);
  v7 = v6;

  return v7;
}

- (void)_setPlayheadTime:(double)a3
{
  if (self->__playheadTime != a3)
  {
    self->__playheadTime = a3;
    -[PXVideoScrubberController _invalidate](self, "_invalidate");
    -[PXVideoScrubberController _updateIfNeeded](self, "_updateIfNeeded");
  }
}

- (void)_invalidate
{
  self->_needsUpdate = 1;
}

- (void)_updateIfNeeded
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CMTime time;
  CMTime v10;

  if (self->_needsUpdate)
  {
    self->_needsUpdate = 0;
    -[PXVideoScrubberController _updateAvPlayerCurrentTimeIfNeeded](self, "_updateAvPlayerCurrentTimeIfNeeded");
    -[PXVideoScrubberController _updateAvPlayerDurationIfNeeded](self, "_updateAvPlayerDurationIfNeeded");
    -[PXVideoScrubberController _activeSeekRequest](self, "_activeSeekRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PXVideoScrubberController _pendingSeekRequest](self, "_pendingSeekRequest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5)
        v5 = v4;
      objc_msgSend(v5, "seekTime");
      -[PXVideoScrubberController _progressForTime:](self, "_progressForTime:");
      -[PXVideoScrubberController _setPlayheadProgress:andSeekVideoPlayer:](self, "_setPlayheadProgress:andSeekVideoPlayer:", 0);

    }
    else
    {
      memset(&v10, 0, sizeof(v10));
      -[PXVideoScrubberController _avPlayerCurrentTime](self, "_avPlayerCurrentTime");
      time = v10;
      -[PXVideoScrubberController _progressForTime:](self, "_progressForTime:", CMTimeGetSeconds(&time));
      -[PXVideoScrubberController _setPlayheadProgress:andSeekVideoPlayer:](self, "_setPlayheadProgress:andSeekVideoPlayer:", 0);
    }
    if (self->_videoScrubberDelegateFlags.respondsToDidUpdate)
    {
      -[PXVideoScrubberController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "videoScrubberControllerDidUpdate:", self);

    }
    if (self->_needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoScrubberController.m"), 389, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_needsUpdate"));

    }
  }
}

- (void)_invalidateAvPlayerCurrentTime
{
  self->_avPlayerCurrentTimeNeedsUpdate = 1;
  -[PXVideoScrubberController _invalidate](self, "_invalidate");
}

- (void)_updateAvPlayerCurrentTimeIfNeeded
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id location;

  if (self->_avPlayerCurrentTimeNeedsUpdate)
  {
    self->_avPlayerCurrentTimeNeedsUpdate = 0;
    objc_initWeak(&location, self);
    dispatch_get_global_queue(21, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PXVideoScrubberController__updateAvPlayerCurrentTimeIfNeeded__block_invoke;
    block[3] = &unk_1E5147280;
    block[4] = self;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, block);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_invalidateAvPlayerDuration
{
  self->_avPlayerDurationNeedsUpdate = 1;
  -[PXVideoScrubberController _invalidate](self, "_invalidate");
}

- (void)_updateAvPlayerDurationIfNeeded
{
  PXVideoScrubberControllerTarget *target;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  if (self->_avPlayerDurationNeedsUpdate)
  {
    self->_avPlayerDurationNeedsUpdate = 0;
    v6 = 0uLL;
    v7 = 0;
    target = self->_target;
    if (target)
      -[PXVideoScrubberControllerTarget currentItemDuration](target, "currentItemDuration");
    v4 = v6;
    v5 = v7;
    -[PXVideoScrubberController _setAvPlayerDuration:](self, "_setAvPlayerDuration:", &v4);
  }
}

- (PXVideoScrubberControllerDelegate)delegate
{
  return (PXVideoScrubberControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXVideoScrubberControllerTarget)target
{
  return self->_target;
}

- (double)estimatedDuration
{
  return self->_estimatedDuration;
}

- (double)_playheadTime
{
  return self->__playheadTime;
}

- (PXScrubberSeekRequest)_pendingSeekRequest
{
  return self->__pendingSeekRequest;
}

- (void)_setPendingSeekRequest:(id)a3
{
  objc_storeStrong((id *)&self->__pendingSeekRequest, a3);
}

- (PXScrubberSeekRequest)_activeSeekRequest
{
  return self->__activeSeekRequest;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_avPlayerCurrentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 160);
  return self;
}

- (void)_setAvPlayerCurrentTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->$95D729B680665BEAEFA1D6FCA8238556::value = *(_OWORD *)&a3->var0;
  self->$95D729B680665BEAEFA1D6FCA8238556::epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_avPlayerDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 184);
  return self;
}

- (void)_setAvPlayerDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->$95D729B680665BEAEFA1D6FCA8238556::value = *(_OWORD *)&a3->var0;
  self->$95D729B680665BEAEFA1D6FCA8238556::epoch = var3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeSeekRequest, 0);
  objc_storeStrong((id *)&self->__pendingSeekRequest, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_playerObserver, 0);
}

void __63__PXVideoScrubberController__updateAvPlayerCurrentTimeIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[4];
  id v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v7 = 0uLL;
  v8 = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (v2)
    objc_msgSend(v2, "playerCurrentTime");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PXVideoScrubberController__updateAvPlayerCurrentTimeIfNeeded__block_invoke_2;
  block[3] = &unk_1E5142558;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v5 = v7;
  v6 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __63__PXVideoScrubberController__updateAvPlayerCurrentTimeIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  __int128 v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(WeakRetained, "_setAvPlayerCurrentTime:", &v3);

}

uint64_t __49__PXVideoScrubberController__playerItemDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

void __42__PXVideoScrubberController__addObservers__block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_playerDidChange:", v2);

}

void __43__PXVideoScrubberController__updateSeeking__block_invoke(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PXVideoScrubberController__updateSeeking__block_invoke_2;
  block[3] = &unk_1E5140960;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v7 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

void __43__PXVideoScrubberController__updateSeeking__block_invoke_3(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleTimeoutCallbackForSeekRequest:", v2);

}

void __43__PXVideoScrubberController__updateSeeking__block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_seekRequest:didFinish:", v2, *(unsigned __int8 *)(a1 + 48));

}

void __62__PXVideoScrubberController_initWithTarget_estimatedDuration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_playerItemDurationDidChange");

}

void __62__PXVideoScrubberController_initWithTarget_estimatedDuration___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_playerStatusDidChange");

}

void __62__PXVideoScrubberController_initWithTarget_estimatedDuration___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_playerItemDidChange");

}

@end
