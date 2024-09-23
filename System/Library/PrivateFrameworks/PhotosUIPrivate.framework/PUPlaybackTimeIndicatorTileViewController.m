@implementation PUPlaybackTimeIndicatorTileViewController

- (void)viewDidLoad
{
  void *v3;
  PUPlaybackTimeLabel *v4;
  PUPlaybackTimeLabel *v5;
  PUPlaybackTimeLabel *label;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPlaybackTimeIndicatorTileViewController;
  -[PUTileViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[PUTileViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PUPlaybackTimeLabel alloc];
  objc_msgSend(v3, "bounds");
  v5 = -[PUPlaybackTimeLabel initWithFrame:](v4, "initWithFrame:");
  label = self->__label;
  self->__label = v5;

  -[PUPlaybackTimeLabel setAutoresizingMask:](self->__label, "setAutoresizingMask:", 18);
  -[PUPlaybackTimeLabel setAlpha:](self->__label, "setAlpha:", 0.0);
  objc_msgSend(v3, "addSubview:", self->__label);

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToCanFlashIndicator = objc_opt_respondsToSelector() & 1;
  }

}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPlaybackTimeIndicatorTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUPlaybackTimeIndicatorTileViewController setVideoPlayer:](self, "setVideoPlayer:", 0);
  -[PUPlaybackTimeIndicatorTileViewController setViewModel:](self, "setViewModel:", 0);
}

- (void)setVideoPlayer:(id)a3
{
  PUBrowsingVideoPlayer *v5;
  PUBrowsingVideoPlayer **p_videoPlayer;
  PUBrowsingVideoPlayer *videoPlayer;
  _QWORD v8[3];

  v5 = (PUBrowsingVideoPlayer *)a3;
  p_videoPlayer = &self->_videoPlayer;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    -[PUBrowsingVideoPlayer unregisterTimeObserver:](videoPlayer, "unregisterTimeObserver:", self);
    -[PUBrowsingVideoPlayer unregisterChangeObserver:](*p_videoPlayer, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    -[PUBrowsingVideoPlayer registerTimeObserver:](*p_videoPlayer, "registerTimeObserver:", self);
    -[PUBrowsingVideoPlayer registerChangeObserver:](*p_videoPlayer, "registerChangeObserver:", self);
    if (v5)
      -[PUBrowsingVideoPlayer currentTime](v5, "currentTime");
    else
      memset(v8, 0, sizeof(v8));
    -[PUPlaybackTimeIndicatorTileViewController _updateIndicatorValueWithTime:](self, "_updateIndicatorValueWithTime:", v8);
  }

}

- (void)setViewModel:(id)a3
{
  PUBrowsingViewModel *v5;
  PUBrowsingViewModel *viewModel;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  PUBrowsingViewModel *v12;

  v5 = (PUBrowsingViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    v12 = v5;
    -[PUBrowsingViewModel unregisterChangeObserver:](viewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[PUBrowsingViewModel registerChangeObserver:](self->_viewModel, "registerChangeObserver:", self);
    -[PUPlaybackTimeIndicatorTileViewController _updateIndicatorDisplayStyle](self, "_updateIndicatorDisplayStyle");
    if (!-[PUBrowsingViewModel isChromeVisible](v12, "isChromeVisible"))
      goto LABEL_6;
    -[PUBrowsingViewModel lastChromeVisibilityChangeDate](v12, "lastChromeVisibilityChangeDate");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_6;
    v8 = (void *)v7;
    -[PUBrowsingViewModel lastChromeVisibilityChangeDate](v12, "lastChromeVisibilityChangeDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceNow");
    v11 = v10;

    if (v11 > -2.0)
      -[PUPlaybackTimeIndicatorTileViewController _flashTimeIndicator](self, "_flashTimeIndicator");
    else
LABEL_6:
      -[PUPlaybackTimeIndicatorTileViewController _cancelFlashTimeIndicator](self, "_cancelFlashTimeIndicator");
    v5 = v12;
  }

}

- (void)_setIndicatorFormat:(int64_t)a3
{
  -[PUPlaybackTimeIndicatorTileViewController _setIndicatorFormat:animated:](self, "_setIndicatorFormat:animated:", a3, 0);
}

- (void)_setIndicatorFormat:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;

  if (self->__indicatorFormat != a3)
  {
    v4 = a4;
    self->__indicatorFormat = a3;
    if (a3)
    {
      -[PUPlaybackTimeIndicatorTileViewController _label](self, "_label");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFormat:", a3);

    }
    -[PUPlaybackTimeIndicatorTileViewController _setIndicatorVisible:animated:](self, "_setIndicatorVisible:animated:", a3 != 0, v4);
  }
}

- (void)_setIndicatorVisible:(BOOL)a3
{
  -[PUPlaybackTimeIndicatorTileViewController _setIndicatorVisible:animated:](self, "_setIndicatorVisible:animated:", a3, 0);
}

- (void)_setIndicatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  double v9;
  double v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  _QWORD aBlock[5];
  BOOL v15;

  if (self->__isIndicatorVisible != a3)
  {
    v4 = a4;
    v5 = a3;
    self->__isIndicatorVisible = a3;
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__PUPlaybackTimeIndicatorTileViewController__setIndicatorVisible_animated___block_invoke;
    aBlock[3] = &unk_1E58AAD68;
    aBlock[4] = self;
    v15 = a3;
    v7 = (void (**)(_QWORD))_Block_copy(aBlock);
    v8 = v7;
    if (v4)
    {
      if (v5)
        v9 = 0.1;
      else
        v9 = 0.3;
      if (v5)
        v10 = 0.0;
      else
        v10 = 0.5;
      v11 = (void *)MEMORY[0x1E0DC3F10];
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __75__PUPlaybackTimeIndicatorTileViewController__setIndicatorVisible_animated___block_invoke_2;
      v12[3] = &unk_1E58ABAC8;
      v13 = v7;
      objc_msgSend(v11, "animateWithDuration:delay:options:animations:completion:", 4, v12, 0, v9, v10);

    }
    else
    {
      v7[2](v7);
    }

  }
}

- (void)setForcedIndicatorVisibilityEndDate:(id)a3
{
  NSDate *v5;
  NSDate *v6;
  NSDate *v7;
  char v8;
  double v9;
  double v10;
  dispatch_time_t v11;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = (NSDate *)a3;
  v6 = self->_forcedIndicatorVisibilityEndDate;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[NSDate isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_forcedIndicatorVisibilityEndDate, a3);
      -[PUPlaybackTimeIndicatorTileViewController _updateIndicatorDisplayStyle](self, "_updateIndicatorDisplayStyle");
      if (v5)
      {
        -[NSDate timeIntervalSinceNow](v5, "timeIntervalSinceNow");
        v10 = v9 + 0.05;
        objc_initWeak(&location, self);
        v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __81__PUPlaybackTimeIndicatorTileViewController_setForcedIndicatorVisibilityEndDate___block_invoke;
        v12[3] = &unk_1E58AB2F8;
        objc_copyWeak(&v13, &location);
        dispatch_after(v11, MEMORY[0x1E0C80D38], v12);
        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
    }
  }

}

- (void)_updateIndicatorValueWithTime:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8[2];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  -[PUPlaybackTimeIndicatorTileViewController videoPlayer](self, "videoPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v9 = *a3;
  memset(&v8[1], 0, sizeof($3CC8671D27C23BF42ADDB32F2B5E48AE));
  if (v5)
    objc_msgSend(v5, "duration");
  -[PUPlaybackTimeIndicatorTileViewController _label](self, "_label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v9;
  objc_msgSend(v7, "setCurrentPlaybackTime:", v8);
  v8[0] = v8[1];
  objc_msgSend(v7, "setPlaybackDuration:", v8);

}

- (void)_updateIndicatorDisplayStyle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  uint64_t v10;
  id v11;

  -[PUPlaybackTimeIndicatorTileViewController videoPlayer](self, "videoPlayer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPlaybackTimeIndicatorTileViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "desiredPlayState") == 3)
    goto LABEL_2;
  if (objc_msgSend(v3, "isScrubbing"))
  {
    v5 = objc_msgSend(v4, "scrubbingPlaybackIndicator");
  }
  else if (objc_msgSend(v11, "isAtBeginning") && objc_msgSend(v11, "isActivated"))
  {
    v5 = objc_msgSend(v4, "initialPlaybackIndicator");
  }
  else
  {
    -[PUPlaybackTimeIndicatorTileViewController forcedIndicatorVisibilityEndDate](self, "forcedIndicatorVisibilityEndDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceNow");
    v8 = v7;

    if (v8 <= 0.0)
    {
      if (objc_msgSend(v11, "desiredPlayState") != 4)
      {
LABEL_2:
        v5 = objc_msgSend(v4, "defaultPlaybackIndicator");
        goto LABEL_12;
      }
      v5 = objc_msgSend(v4, "playingPlaybackIndicator");
    }
    else
    {
      v5 = objc_msgSend(v4, "chromeShownPlaybackIndicator");
    }
  }
LABEL_12:
  if (v11)
    v9 = v3 == 0;
  else
    v9 = 1;
  v10 = !v9;
  -[PUPlaybackTimeIndicatorTileViewController _setIndicatorFormat:animated:](self, "_setIndicatorFormat:animated:", v5, v10);

}

- (void)videoPlayer:(id)a3 currentTimeDidChange:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a4;
  -[PUPlaybackTimeIndicatorTileViewController _updateIndicatorValueWithTime:](self, "_updateIndicatorValueWithTime:", &v4);
}

- (void)videoPlayer:(id)a3 desiredSeekTimeDidChange:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a4;
  -[PUPlaybackTimeIndicatorTileViewController _updateIndicatorValueWithTime:](self, "_updateIndicatorValueWithTime:", &v4);
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[PUPlaybackTimeIndicatorTileViewController videoPlayer](self, "videoPlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    -[PUPlaybackTimeIndicatorTileViewController _handleVideoPlayer:change:](self, "_handleVideoPlayer:change:", v9, v6);
  }
  else
  {
    -[PUPlaybackTimeIndicatorTileViewController viewModel](self, "viewModel");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[PUPlaybackTimeIndicatorTileViewController _handleViewModel:change:](self, "_handleViewModel:change:", v9, v6);
  }

}

- (void)_handleVideoPlayer:(id)a3 change:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_msgSend(v5, "isAtBeginningDidChange") & 1) != 0
    || objc_msgSend(v5, "desiredPlayStateDidChange"))
  {
    -[PUPlaybackTimeIndicatorTileViewController _updateIndicatorDisplayStyle](self, "_updateIndicatorDisplayStyle");
  }

}

- (void)_handleViewModel:(id)a3 change:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isScrubbingDidChange"))
    -[PUPlaybackTimeIndicatorTileViewController _updateIndicatorDisplayStyle](self, "_updateIndicatorDisplayStyle");
  if (objc_msgSend(v6, "chromeVisibilityDidChange"))
  {
    if (objc_msgSend(v11, "isChromeVisible"))
    {
      if (objc_msgSend(v11, "lastChromeVisibilityChangeReason") == 1)
      {
        -[PUPlaybackTimeIndicatorTileViewController videoPlayer](self, "videoPlayer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "desiredPlayState");

        if (v8 == 4)
        {
          if (!self->_delegateFlags.respondsToCanFlashIndicator
            || (-[PUPlaybackTimeIndicatorTileViewController delegate](self, "delegate"),
                v9 = (void *)objc_claimAutoreleasedReturnValue(),
                v10 = objc_msgSend(v9, "playbackTimeIndicatorTileViewControllerCanFlashIndicator:", self),
                v9,
                v10))
          {
            -[PUPlaybackTimeIndicatorTileViewController _flashTimeIndicator](self, "_flashTimeIndicator");
          }
        }
      }
    }
  }

}

- (void)_flashTimeIndicator
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 2.0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPlaybackTimeIndicatorTileViewController setForcedIndicatorVisibilityEndDate:](self, "setForcedIndicatorVisibilityEndDate:", v3);

}

- (void)_cancelFlashTimeIndicator
{
  -[PUPlaybackTimeIndicatorTileViewController setForcedIndicatorVisibilityEndDate:](self, "setForcedIndicatorVisibilityEndDate:", 0);
}

- (PUPlaybackTimeIndicatorTileViewControllerDelegate)delegate
{
  return (PUPlaybackTimeIndicatorTileViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PUBrowsingVideoPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (PUBrowsingViewModel)viewModel
{
  return self->_viewModel;
}

- (PUPlaybackTimeLabel)_label
{
  return self->__label;
}

- (int64_t)_indicatorFormat
{
  return self->__indicatorFormat;
}

- (BOOL)_isIndicatorVisible
{
  return self->__isIndicatorVisible;
}

- (NSDate)forcedIndicatorVisibilityEndDate
{
  return self->_forcedIndicatorVisibilityEndDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcedIndicatorVisibilityEndDate, 0);
  objc_storeStrong((id *)&self->__label, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __81__PUPlaybackTimeIndicatorTileViewController_setForcedIndicatorVisibilityEndDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateIndicatorDisplayStyle");

}

void __75__PUPlaybackTimeIndicatorTileViewController__setIndicatorVisible_animated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v3 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = 0.0;
  objc_msgSend(v2, "setAlpha:", v3);

}

uint64_t __75__PUPlaybackTimeIndicatorTileViewController__setIndicatorVisible_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (CGSize)playbackTimeIndicatorTileSize
{
  double v2;
  double v3;
  CGSize result;

  if (playbackTimeIndicatorTileSize_onceToken != -1)
    dispatch_once(&playbackTimeIndicatorTileSize_onceToken, &__block_literal_global_75904);
  v2 = *(double *)&playbackTimeIndicatorTileSize_playbackTimeIndicatorTileSize_0;
  v3 = *(double *)&playbackTimeIndicatorTileSize_playbackTimeIndicatorTileSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __74__PUPlaybackTimeIndicatorTileViewController_playbackTimeIndicatorTileSize__block_invoke()
{
  PUPlaybackTimeLabel *v0;
  double v1;
  uint64_t v2;
  double v3;
  CMTime v4;

  v0 = objc_alloc_init(PUPlaybackTimeLabel);
  -[PUPlaybackTimeLabel setFormat:](v0, "setFormat:", 2);
  CMTimeMakeWithSeconds(&v4, 360000.0, 1);
  -[PUPlaybackTimeLabel setPlaybackDuration:](v0, "setPlaybackDuration:", &v4);
  -[PUPlaybackTimeLabel sizeThatFits:](v0, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  playbackTimeIndicatorTileSize_playbackTimeIndicatorTileSize_0 = v2;
  v3 = 18.0;
  if (v1 >= 18.0)
    v3 = v1;
  playbackTimeIndicatorTileSize_playbackTimeIndicatorTileSize_1 = *(_QWORD *)&v3;

}

@end
