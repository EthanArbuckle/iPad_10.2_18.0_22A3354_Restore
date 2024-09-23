@implementation PHVideoScrubberView

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)avPlayerObservationContext == a6)
  {
    -[PHVideoScrubberView _invalidateFilmStripView](self, "_invalidateFilmStripView", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PHVideoScrubberView;
    -[PHVideoScrubberView observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[AVPlayer removeObserver:forKeyPath:context:](self->_player, "removeObserver:forKeyPath:context:", self, CFSTR("status"), avPlayerObservationContext);
  -[AVPlayer removeObserver:forKeyPath:context:](self->_player, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem"), avPlayerObservationContext);
  -[AVPlayer removeObserver:forKeyPath:context:](self->_player, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.videoComposition"), avPlayerObservationContext);
  v3.receiver = self;
  v3.super_class = (Class)PHVideoScrubberView;
  -[PHVideoScrubberView dealloc](&v3, sel_dealloc);
}

- (PHVideoScrubberView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PHVideoScrubberView *v7;
  void *v8;
  PUPlayheadView *v9;
  PUPlayheadView *v10;
  void *v11;
  PUTouchingGestureRecognizer *v12;
  void *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)PHVideoScrubberView;
  v7 = -[PHVideoScrubberView initWithFrame:](&v15, sel_initWithFrame_);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C28]), "initWithFrame:", x, y, width, height);
    objc_msgSend(v8, "setAlwaysBounceHorizontal:", 1);
    objc_msgSend(v8, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v8, "setDelegate:", v7);
    objc_msgSend(v8, "_setSupportsPointerDragScrolling:", 1);
    -[PHVideoScrubberView _setScrollView:](v7, "_setScrollView:", v8);
    -[PHVideoScrubberView addSubview:](v7, "addSubview:", v8);
    v9 = [PUPlayheadView alloc];
    v10 = -[PUPlayheadView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PHVideoScrubberView _setPlayheadView:](v7, "_setPlayheadView:", v10);
    -[PHVideoScrubberView addSubview:](v7, "addSubview:", v10);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v7, sel__handleTapGesture_);
    -[PHVideoScrubberView addGestureRecognizer:](v7, "addGestureRecognizer:", v11);
    v12 = -[PUTouchingGestureRecognizer initWithTarget:action:]([PUTouchingGestureRecognizer alloc], "initWithTarget:action:", v7, sel__handleTouchGesture_);
    -[PUTouchingGestureRecognizer setDelegate:](v12, "setDelegate:", v7);
    -[PHVideoScrubberView addGestureRecognizer:](v7, "addGestureRecognizer:", v12);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v7, sel__handleLongPressGesture_);
    objc_msgSend(v11, "maximumSingleTapDuration");
    objc_msgSend(v13, "setMinimumPressDuration:");
    -[PHVideoScrubberView addGestureRecognizer:](v7, "addGestureRecognizer:", v13);

  }
  return v7;
}

- (void)layoutSubviews
{
  double width;
  double x;
  double y;
  double v6;
  double height;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)PHVideoScrubberView;
  -[PHVideoScrubberView layoutSubviews](&v17, sel_layoutSubviews);
  -[PHVideoScrubberView _updateIfNeeded](self, "_updateIfNeeded");
  -[PHVideoScrubberView bounds](self, "bounds");
  width = v18.size.width;
  v18.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v18.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v19 = CGRectInset(v18, 0.0, 1.0);
  x = v19.origin.x;
  y = v19.origin.y;
  v6 = v19.size.width;
  height = v19.size.height;
  -[PHVideoScrubberView scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", x, y, v6, height);

  v9 = width * 0.5;
  -[PHVideoScrubberView _videoScrubberController](self, "_videoScrubberController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "length");
  v12 = v11;

  -[PHVideoScrubberView scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentInset:", 0.0, v9, 0.0, v9);

  -[PHVideoScrubberView _filmStripView](self, "_filmStripView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PHVideoScrubberView _filmStripView](self, "_filmStripView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", 0.0, 0.0, v12, height);

  }
  -[PHVideoScrubberView scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentSize:", v12, height);

  -[PHVideoScrubberView _updateScrollViewContentOffset](self, "_updateScrollViewContentOffset");
  -[PHVideoScrubberView _updatePlayheadFrame](self, "_updatePlayheadFrame");
}

- (id)_scrollView
{
  return self->_scrollView;
}

- (void)setInteractionDelegate:(id)a3
{
  PHVideoScrubberViewInteractionDelegate **p_interactionDelegate;
  id WeakRetained;
  id v6;
  $5A16C09544520AF29E8F942F4BDBD711 *p_interactionDelegateRespondsTo;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id obj;

  obj = a3;
  p_interactionDelegate = &self->_interactionDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  if (WeakRetained != obj)
  {
    v6 = objc_storeWeak((id *)&self->_interactionDelegate, obj);
    p_interactionDelegateRespondsTo = &self->_interactionDelegateRespondsTo;
    self->_interactionDelegateRespondsTo.didBeginTouching = objc_opt_respondsToSelector() & 1;

    v8 = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    p_interactionDelegateRespondsTo->didEndTouching = objc_opt_respondsToSelector() & 1;

    v9 = objc_loadWeakRetained((id *)p_interactionDelegate);
    p_interactionDelegateRespondsTo->willBeginDragging = objc_opt_respondsToSelector() & 1;

    v10 = objc_loadWeakRetained((id *)p_interactionDelegate);
    p_interactionDelegateRespondsTo->didEndDragging = objc_opt_respondsToSelector() & 1;

    v11 = objc_loadWeakRetained((id *)p_interactionDelegate);
    p_interactionDelegateRespondsTo->willBeginDecelerating = objc_opt_respondsToSelector() & 1;

    v12 = objc_loadWeakRetained((id *)p_interactionDelegate);
    p_interactionDelegateRespondsTo->didEndDecelerating = objc_opt_respondsToSelector() & 1;

  }
}

- (void)setPlayer:(id)a3
{
  AVPlayer *v5;
  AVPlayer **p_player;
  AVPlayer *player;
  AVPlayer *v8;

  v5 = (AVPlayer *)a3;
  p_player = &self->_player;
  player = self->_player;
  if (player != v5)
  {
    v8 = v5;
    -[AVPlayer removeObserver:forKeyPath:context:](player, "removeObserver:forKeyPath:context:", self, CFSTR("status"), avPlayerObservationContext);
    -[AVPlayer removeObserver:forKeyPath:context:](*p_player, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem"), avPlayerObservationContext);
    -[AVPlayer removeObserver:forKeyPath:context:](*p_player, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.videoComposition"), avPlayerObservationContext);
    objc_storeStrong((id *)&self->_player, a3);
    -[AVPlayer addObserver:forKeyPath:options:context:](*p_player, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 0, avPlayerObservationContext);
    -[AVPlayer addObserver:forKeyPath:options:context:](*p_player, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem"), 0, avPlayerObservationContext);
    -[AVPlayer addObserver:forKeyPath:options:context:](*p_player, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.videoComposition"), 0, avPlayerObservationContext);
    -[PHVideoScrubberView _invalidateVideoScrubberController](self, "_invalidateVideoScrubberController");
    -[PHVideoScrubberView _invalidateFilmStripView](self, "_invalidateFilmStripView");
    v5 = v8;
  }

}

- (void)setEstimatedDuration:(double)a3
{
  if (self->_estimatedDuration != a3)
  {
    self->_estimatedDuration = a3;
    -[PHVideoScrubberView _invalidateVideoScrubberController](self, "_invalidateVideoScrubberController");
    -[PHVideoScrubberView _invalidateFilmStripView](self, "_invalidateFilmStripView");
  }
}

- (void)_setVideoScrubberController:(id)a3
{
  PXVideoScrubberController *v5;
  PXVideoScrubberController *videoScrubberController;
  PXVideoScrubberController *v7;

  v5 = (PXVideoScrubberController *)a3;
  videoScrubberController = self->__videoScrubberController;
  v7 = v5;
  if (videoScrubberController != v5)
  {
    -[PXVideoScrubberController setDelegate:](videoScrubberController, "setDelegate:", 0);
    objc_storeStrong((id *)&self->__videoScrubberController, a3);
    -[PXVideoScrubberController setDelegate:](v7, "setDelegate:", self);
  }

}

- (void)setPlaceholderThumbnail:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_placeholderThumbnail != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeholderThumbnail, a3);
    -[PHVideoScrubberView _invalidateFilmStripView](self, "_invalidateFilmStripView");
    v5 = v6;
  }

}

- (id)_currentAVAsset
{
  void *v2;
  void *v3;
  void *v4;

  -[PHVideoScrubberView player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_currentVideoComposition
{
  void *v2;
  void *v3;
  void *v4;

  -[PHVideoScrubberView player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "videoComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_isUserInteractingWithScrollView
{
  void *v2;
  char v3;

  -[PHVideoScrubberView scrollView](self, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isDragging") & 1) != 0 || (objc_msgSend(v2, "isTracking") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isDecelerating");

  return v3;
}

- (BOOL)_playerIsPlaying
{
  void *v2;
  float v3;
  BOOL v4;

  -[PHVideoScrubberView player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v4 = v3 > 0.0;

  return v4;
}

- (void)_handleTapGesture:(id)a3
{
  -[PHVideoScrubberView _handleInteractionEndedAndTogglePlayState:](self, "_handleInteractionEndedAndTogglePlayState:", 1);
}

- (void)_handleTouchGesture:(id)a3
{
  uint64_t v4;
  id WeakRetained;

  v4 = objc_msgSend(a3, "state");
  if (v4 == 3)
  {
    if (!self->_interactionDelegateRespondsTo.didEndTouching)
      return;
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    objc_msgSend(WeakRetained, "didEndTouchingVideoScrubberView:", self);
    goto LABEL_7;
  }
  if (v4 == 1)
  {
    -[PHVideoScrubberView _handleInteractionBegan](self, "_handleInteractionBegan");
    if (self->_interactionDelegateRespondsTo.didBeginTouching)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
      objc_msgSend(WeakRetained, "didBeginTouchingVideoScrubberView:", self);
LABEL_7:

    }
  }
}

- (void)_handleLongPressGesture:(id)a3
{
  self->_previousPlayState = 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[PHVideoScrubberView _isUserInteractingWithScrollView](self, "_isUserInteractingWithScrollView"))
  {
    objc_msgSend(v12, "contentSize");
    v5 = v4;
    objc_msgSend(v12, "contentInset");
    v7 = v6;
    objc_msgSend(v12, "contentOffset");
    v9 = fmax(v7 + v8, 0.0);
    if (v5 < v9)
      v9 = v5;
    v10 = v9 / v5;
    -[PHVideoScrubberView _videoScrubberController](self, "_videoScrubberController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPlayheadProgress:", v10);

  }
  -[PHVideoScrubberView _updateVisibleRectOfFilmStripView](self, "_updateVisibleRectOfFilmStripView");
  -[PHVideoScrubberView _updatePlayheadFrame](self, "_updatePlayheadFrame");

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  PHVideoScrubberViewInteractionDelegate **p_interactionDelegate;
  id v5;
  id WeakRetained;

  if (self->_interactionDelegateRespondsTo.willBeginDragging)
  {
    p_interactionDelegate = &self->_interactionDelegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_interactionDelegate);
    objc_msgSend(WeakRetained, "videoScrubberView:willBeginDraggingInScrollView:", self, v5);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v6 = a3;
  v8 = v6;
  if (!a4)
  {
    -[PHVideoScrubberView _handleInteractionEndedAndTogglePlayState:](self, "_handleInteractionEndedAndTogglePlayState:", 0);
    v6 = v8;
  }
  if (self->_interactionDelegateRespondsTo.didEndDragging)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    objc_msgSend(WeakRetained, "videoScrubberView:didEndDraggingInScrollView:", self, v8);

    v6 = v8;
  }

}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  PHVideoScrubberViewInteractionDelegate **p_interactionDelegate;
  id v5;
  id WeakRetained;

  if (self->_interactionDelegateRespondsTo.willBeginDecelerating)
  {
    p_interactionDelegate = &self->_interactionDelegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_interactionDelegate);
    objc_msgSend(WeakRetained, "videoScrubberView:willBeginDeceleratingInScrollView:", self, v5);

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  -[PHVideoScrubberView _handleInteractionEndedAndTogglePlayState:](self, "_handleInteractionEndedAndTogglePlayState:", 0);
  if (self->_interactionDelegateRespondsTo.didEndDecelerating)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
    objc_msgSend(WeakRetained, "videoScrubberView:didEndDeceleratingInScrollView:", self, v5);

  }
}

- (void)_handleInteractionBegan
{
  id v3;

  if (!self->_previousPlayState)
  {
    if (-[PHVideoScrubberView _playerIsPlaying](self, "_playerIsPlaying"))
    {
      self->_previousPlayState = 1;
      -[PHVideoScrubberView player](self, "player");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pause");

    }
    else
    {
      self->_previousPlayState = 2;
    }
  }
}

- (void)_handleInteractionEndedAndTogglePlayState:(BOOL)a3
{
  unint64_t previousPlayState;
  _BOOL4 v5;
  void *v6;

  previousPlayState = self->_previousPlayState;
  if (previousPlayState)
  {
    v5 = previousPlayState == 2;
    if (a3)
    {
      v5 = previousPlayState != 2;
      if (previousPlayState != 1)
      {
LABEL_4:
        -[PHVideoScrubberView player](self, "player");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "play");
        goto LABEL_8;
      }
    }
    else if (previousPlayState == 1)
    {
      goto LABEL_4;
    }
    if (!v5)
    {
LABEL_9:
      self->_previousPlayState = 0;
      return;
    }
    -[PHVideoScrubberView player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pause");
LABEL_8:

    goto LABEL_9;
  }
}

- (void)_invalidateFilmStripView
{
  -[PHVideoScrubberView _setNeedsUpdateFilmStripView:](self, "_setNeedsUpdateFilmStripView:", 1);
  -[PHVideoScrubberView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_invalidateVideoScrubberController
{
  -[PHVideoScrubberView _setNeedsUpdateVideoScrubberController:](self, "_setNeedsUpdateVideoScrubberController:", 1);
  -[PHVideoScrubberView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateFilmStripViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PUFilmstripView *v7;
  PUFilmstripView *v8;
  PUFilmstripView *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (-[PHVideoScrubberView _needsUpdateFilmStripView](self, "_needsUpdateFilmStripView"))
  {
    -[PHVideoScrubberView _setNeedsUpdateFilmStripView:](self, "_setNeedsUpdateFilmStripView:", 0);
    -[PHVideoScrubberView _filmStripView](self, "_filmStripView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[PHVideoScrubberView filmstripViewProvider](self, "filmstripViewProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "createFilmstripViewForVideoScrubberView:", self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v7 = v5;
      }
      else
      {
        v8 = [PUFilmstripView alloc];
        v7 = -[PUFilmstripView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      }
      v9 = v7;

      -[PHVideoScrubberView _setFilmStripView:](self, "_setFilmStripView:", v9);
      -[PHVideoScrubberView scrollView](self, "scrollView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v9);

    }
    -[PHVideoScrubberView _filmStripView](self, "_filmStripView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[PHVideoScrubberView _filmStripView](self, "_filmStripView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHVideoScrubberView _currentAVAsset](self, "_currentAVAsset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHVideoScrubberView _currentVideoComposition](self, "_currentVideoComposition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAsset:videoComposition:", v14, v15);

    }
    -[PHVideoScrubberView _filmStripView](self, "_filmStripView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHVideoScrubberView _currentAVAsset](self, "_currentAVAsset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAsset:", v17);

    -[PHVideoScrubberView _filmStripView](self, "_filmStripView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHVideoScrubberView placeholderThumbnail](self, "placeholderThumbnail");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPlaceholderImage:", v19);

    -[PHVideoScrubberView _updateVisibleRectOfFilmStripView](self, "_updateVisibleRectOfFilmStripView");
  }
}

- (void)_updateVideoscrubberControllerIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  if (-[PHVideoScrubberView _needsUpdateVideoScrubberController](self, "_needsUpdateVideoScrubberController"))
  {
    -[PHVideoScrubberView _setNeedsUpdateVideoScrubberController:](self, "_setNeedsUpdateVideoScrubberController:", 0);
    -[PHVideoScrubberView player](self, "player");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[PHVideoScrubberView _videoScrubberController](self, "_videoScrubberController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "target");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "videoPlayer");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (v5 != v14)
      {

LABEL_8:
        -[PHVideoScrubberView estimatedDuration](self, "estimatedDuration");
        v11 = v10;
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B9A8]), "initWithVideoPlayer:", v14);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7BBC8]), "initWithTarget:estimatedDuration:", v12, v11);
        -[PHVideoScrubberView _setVideoScrubberController:](self, "_setVideoScrubberController:", v13);

        goto LABEL_9;
      }
      objc_msgSend(v3, "estimatedDuration");
      v7 = v6;
      -[PHVideoScrubberView estimatedDuration](self, "estimatedDuration");
      v9 = v8;

      if (v7 != v9)
        goto LABEL_8;
    }
    else
    {
      -[PHVideoScrubberView _setVideoScrubberController:](self, "_setVideoScrubberController:", 0);
    }
LABEL_9:

  }
}

- (BOOL)_needsUpdate
{
  return -[PHVideoScrubberView _needsUpdateFilmStripView](self, "_needsUpdateFilmStripView")
      || -[PHVideoScrubberView _needsUpdateVideoScrubberController](self, "_needsUpdateVideoScrubberController");
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PHVideoScrubberView _needsUpdate](self, "_needsUpdate"))
  {
    -[PHVideoScrubberView _updateVideoscrubberControllerIfNeeded](self, "_updateVideoscrubberControllerIfNeeded");
    -[PHVideoScrubberView _updateFilmStripViewIfNeeded](self, "_updateFilmStripViewIfNeeded");
    if (-[PHVideoScrubberView _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHVideoScrubberView.m"), 396, CFSTR("Video scrubber still dirty after update"));

    }
  }
}

- (void)_updateVisibleRectOfFilmStripView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  -[PHVideoScrubberView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  if (v5 <= 0.0)
    v11 = *MEMORY[0x1E0C9D648];
  else
    v11 = v5;
  v12 = -0.0;
  if (v5 <= 0.0)
    v12 = v5;
  v13 = v7 + v12;
  -[PHVideoScrubberView _filmStripView](self, "_filmStripView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setVisibleRect:", v11, v10, v13, v9);

}

- (void)_updateScrollViewContentOffset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[PHVideoScrubberView scrollView](self, "scrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PHVideoScrubberView _videoScrubberController](self, "_videoScrubberController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playheadProgress");
  v5 = v4;

  objc_msgSend(v9, "contentSize");
  v7 = v5 * v6;
  objc_msgSend(v9, "contentInset");
  objc_msgSend(v9, "setContentOffset:", v7 - v8, 0.0);

}

- (void)_updatePlayheadFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  -[PHVideoScrubberView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  -[PHVideoScrubberView scrollView](self, "scrollView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentSize");
  v9 = v8;
  objc_msgSend(v18, "contentInset");
  v11 = v10;
  objc_msgSend(v18, "contentOffset");
  v13 = v11 + v12;
  v14 = v9 - v13;
  if (v13 <= v9)
    v14 = 0.0;
  if (v13 < 0.0)
    v15 = 0.0 - v13;
  else
    v15 = v14;
  v16 = v5 * 0.5 - v7 * 0.5 * 0.5 + v15;
  -[PHVideoScrubberView _playheadView](self, "_playheadView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v16, 0.0, v7 * 0.5, v7 + 2.0);

}

- (double)videoScrubberController:(id)a3 lengthForDuration:(double)a4
{
  double result;

  -[PHVideoScrubberView estimatedDuration](self, "estimatedDuration", a3, a4);
  -[PHVideoScrubberView _lengthForDuration:](self, "_lengthForDuration:");
  return result;
}

- (double)_lengthForDuration:(double)a3
{
  double v3;
  float v4;

  if (a3 < 1.0)
    a3 = 1.0;
  if (a3 >= 2.0)
  {
    v4 = a3;
    v3 = log2f(v4);
  }
  else
  {
    v3 = a3 * 0.5;
  }
  return v3 * 150.0;
}

- (void)videoScrubberControllerDidUpdate:(id)a3
{
  id v4;

  -[PHVideoScrubberView scrollView](self, "scrollView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDragging") & 1) == 0
    && (objc_msgSend(v4, "isTracking") & 1) == 0
    && (objc_msgSend(v4, "isDecelerating") & 1) == 0)
  {
    -[PHVideoScrubberView _updateScrollViewContentOffset](self, "_updateScrollViewContentOffset");
  }

}

- (AVPlayer)player
{
  return self->_player;
}

- (double)estimatedDuration
{
  return self->_estimatedDuration;
}

- (UIImage)placeholderThumbnail
{
  return self->_placeholderThumbnail;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)_setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (PHVideoScrubberViewInteractionDelegate)interactionDelegate
{
  return (PHVideoScrubberViewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (PHVideoScrubberFilmstripViewProvider)filmstripViewProvider
{
  return (PHVideoScrubberFilmstripViewProvider *)objc_loadWeakRetained((id *)&self->_filmstripViewProvider);
}

- (void)setFilmstripViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filmstripViewProvider, a3);
}

- (BOOL)_needsUpdateFilmStripView
{
  return self->__needsUpdateFilmStripView;
}

- (void)_setNeedsUpdateFilmStripView:(BOOL)a3
{
  self->__needsUpdateFilmStripView = a3;
}

- (BOOL)_needsUpdateVideoScrubberController
{
  return self->__needsUpdateVideoScrubberController;
}

- (void)_setNeedsUpdateVideoScrubberController:(BOOL)a3
{
  self->__needsUpdateVideoScrubberController = a3;
}

- (PHVideoScrubberFilmstripView)_filmStripView
{
  return self->__filmStripView;
}

- (void)_setFilmStripView:(id)a3
{
  objc_storeStrong((id *)&self->__filmStripView, a3);
}

- (PXVideoScrubberController)_videoScrubberController
{
  return self->__videoScrubberController;
}

- (PUPlayheadView)_playheadView
{
  return self->__playheadView;
}

- (void)_setPlayheadView:(id)a3
{
  objc_storeStrong((id *)&self->__playheadView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__playheadView, 0);
  objc_storeStrong((id *)&self->__videoScrubberController, 0);
  objc_storeStrong((id *)&self->__filmStripView, 0);
  objc_destroyWeak((id *)&self->_filmstripViewProvider);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_placeholderThumbnail, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
