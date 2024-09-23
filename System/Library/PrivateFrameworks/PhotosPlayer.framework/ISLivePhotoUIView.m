@implementation ISLivePhotoUIView

- (void)setPlayer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[ISBasePlayerUIView player](self, "player");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 != v4)
  {
    objc_msgSend(v5, "unregisterChangeObserver:context:", self, ISLivePhotoPlayerObservableContext);
    -[ISLivePhotoUIView _playbackFilter](self, "_playbackFilter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removePlaybackFilter:", v7);

    v9.receiver = self;
    v9.super_class = (Class)ISLivePhotoUIView;
    -[ISBasePlayerUIView setPlayer:](&v9, sel_setPlayer_, v4);
    objc_msgSend(v4, "registerChangeObserver:context:", self, ISLivePhotoPlayerObservableContext);
    -[ISLivePhotoUIView _playbackFilter](self, "_playbackFilter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addPlaybackFilter:", v8);

  }
}

- (ISTouchLivePhotoPlaybackFilter)_playbackFilter
{
  return self->__playbackFilter;
}

- (UIGestureRecognizer)playbackGestureRecognizer
{
  return self->_playbackGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__overlayLabel, 0);
  objc_storeStrong((id *)&self->__playbackFilter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vitalityTransform, 0);
  objc_storeStrong((id *)&self->_playbackGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
}

- (void)_ISLivePhotoUIViewCommonInitialization
{
  ISTouchingGestureRecognizer *v3;
  UIGestureRecognizer *playbackGestureRecognizer;
  ISTouchingGestureRecognizer *v5;
  UIImpactFeedbackGenerator *v6;
  UIImpactFeedbackGenerator *feedbackGenerator;
  ISLivePhotoPlayer *v8;

  -[ISBasePlayerUIView setContentMode:](self, "setContentMode:", 2);
  v8 = objc_alloc_init(ISLivePhotoPlayer);
  -[ISLivePhotoUIView setPlayer:](self, "setPlayer:", v8);
  -[ISLivePhotoUIView _updatePlaybackFilter](self, "_updatePlaybackFilter");
  v3 = -[ISTouchingGestureRecognizer initWithTarget:action:]([ISTouchingGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePlaybackRecognizer_);
  -[ISTouchingGestureRecognizer setMinimumTouchDuration:](v3, "setMinimumTouchDuration:", 0.15);
  -[ISTouchingGestureRecognizer setCancelsTouchesInView:](v3, "setCancelsTouchesInView:", 0);
  -[ISTouchingGestureRecognizer setDelegate:](v3, "setDelegate:", self);
  -[ISTouchingGestureRecognizer setRequireSingleTouch:](v3, "setRequireSingleTouch:", 1);
  -[ISLivePhotoUIView addGestureRecognizer:](self, "addGestureRecognizer:", v3);
  playbackGestureRecognizer = self->_playbackGestureRecognizer;
  self->_playbackGestureRecognizer = &v3->super;
  v5 = v3;

  -[ISLivePhotoUIView _updateGestureRecognizerParameters](self, "_updateGestureRecognizerParameters");
  v6 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", 0);
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = v6;

}

- (void)audioSessionDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISLivePhotoUIView;
  -[ISBasePlayerUIView audioSessionDidChange](&v3, sel_audioSessionDidChange);
  -[ISLivePhotoUIView _updatePlaybackFilter](self, "_updatePlaybackFilter");
}

- (ISLivePhotoUIView)initWithFrame:(CGRect)a3
{
  ISLivePhotoUIView *v3;
  ISLivePhotoUIView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISLivePhotoUIView;
  v3 = -[ISBasePlayerUIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ISLivePhotoUIView _ISLivePhotoUIViewCommonInitialization](v3, "_ISLivePhotoUIViewCommonInitialization");
  return v4;
}

- (ISLivePhotoUIView)initWithCoder:(id)a3
{
  ISLivePhotoUIView *v3;
  ISLivePhotoUIView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISLivePhotoUIView;
  v3 = -[ISBasePlayerUIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ISLivePhotoUIView _ISLivePhotoUIViewCommonInitialization](v3, "_ISLivePhotoUIViewCommonInitialization");
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ISLivePhotoUIView setPlayer:](self, "setPlayer:", 0);
  -[UIGestureRecognizer view](self->_playbackGestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_playbackGestureRecognizer);

  v4.receiver = self;
  v4.super_class = (Class)ISLivePhotoUIView;
  -[ISLivePhotoUIView dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  $D1C30ECBE0A406DE29D8314D6268E995 *p_delegateRespondsTo;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    self->_delegateRespondsTo.canBeginInteractivePlayback = objc_opt_respondsToSelector() & 1;

    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    p_delegateRespondsTo->extraMinimumTouchDuration = objc_opt_respondsToSelector() & 1;

  }
}

- (void)setVitalityTransform:(id)a3
{
  CAMeshTransform *v5;
  CAMeshTransform *v6;
  char v7;
  CAMeshTransform *v8;

  v5 = (CAMeshTransform *)a3;
  v6 = v5;
  if (self->_vitalityTransform != v5)
  {
    v8 = v5;
    v7 = -[CAMeshTransform isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_vitalityTransform, a3);
      -[ISLivePhotoUIView _updateVideoTransform](self, "_updateVideoTransform");
      v6 = v8;
    }
  }

}

- (void)setPlaybackFilterTouchActive:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  -[ISLivePhotoUIView _playbackFilter](self, "_playbackFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__ISLivePhotoUIView_setPlaybackFilterTouchActive___block_invoke;
  v5[3] = &__block_descriptor_33_e8_v16__0_8l;
  v6 = a3;
  objc_msgSend(v4, "performChanges:", v5);

}

- (void)_updatePlaybackFilterInput
{
  double v3;
  double v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[ISLivePhotoUIView playbackGestureRecognizer](self, "playbackGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "distanceFromInitialPoint");
  v4 = v3;
  v5 = (unint64_t)(objc_msgSend(v8, "state") - 1) < 2;
  -[ISLivePhotoUIView _playbackFilter](self, "_playbackFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "state");

  if (v7 != 2 && v4 > 20.0)
  {
    objc_msgSend(v8, "setEnabled:", 0);
    objc_msgSend(v8, "setEnabled:", 1);
    v5 = 0;
  }
  -[ISLivePhotoUIView setPlaybackFilterTouchActive:](self, "setPlaybackFilterTouchActive:", v5);

}

- (void)_updateVideoTransform
{
  void *v3;
  int v4;
  id v5;

  -[ISBasePlayerUIView player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlayingVitality");

  if (v4)
  {
    -[ISLivePhotoUIView vitalityTransform](self, "vitalityTransform");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[ISBasePlayerUIView setVideoTransform:](self, "setVideoTransform:", v5);

  }
  else
  {
    -[ISBasePlayerUIView setVideoTransform:](self, "setVideoTransform:", 0);
  }
}

- (void)_setPlaybackFilter:(id)a3
{
  ISTouchLivePhotoPlaybackFilter **p_playbackFilter;
  void *v6;
  ISTouchLivePhotoPlaybackFilter *v7;

  p_playbackFilter = &self->__playbackFilter;
  v7 = (ISTouchLivePhotoPlaybackFilter *)a3;
  if (*p_playbackFilter != v7)
  {
    -[ISBasePlayerUIView player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removePlaybackFilter:", *p_playbackFilter);
    objc_storeStrong((id *)p_playbackFilter, a3);
    objc_msgSend(v6, "addPlaybackFilter:", v7);

  }
}

- (void)contentDidChange
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ISLivePhotoUIView;
  -[ISBasePlayerUIView contentDidChange](&v2, sel_contentDidChange);
}

- (void)_updatePlaybackFilter
{
  void *v3;
  ISTouchLivePhotoPlaybackFilter *v4;
  void *v5;
  ISTouchLivePhotoPlaybackFilter *v6;

  -[ISBasePlayerUIView wrappedAudioSession](self, "wrappedAudioSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_alloc_init(ISTouchLivePhotoPlaybackFilter);
  else
    v4 = 0;
  v6 = v4;
  -[ISLivePhotoPlaybackFilter setPlaybackDisabled:forReason:](v4, "setPlaybackDisabled:forReason:", v3 == 0, CFSTR("ConfiguringAudioSession"));
  +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISLivePhotoPlaybackFilter setPlayIsSticky:](v6, "setPlayIsSticky:", objc_msgSend(v5, "playIsSticky"));

  -[ISLivePhotoUIView _setPlaybackFilter:](self, "_setPlaybackFilter:", v6);
}

- (void)_showOverlayLabel
{
  void *v3;
  int v4;
  UILabel *v5;
  UILabel *overlayLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  UILabel *v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  UILabel *v21;
  void *v22;
  dispatch_time_t v23;
  _QWORD block[4];
  id v25[2];
  id location;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  +[ISPlayerSettings sharedInstance](ISPlayerSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showStateOverlay");

  if (v4)
  {
    if (!self->__overlayLabel)
    {
      v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
      overlayLabel = self->__overlayLabel;
      self->__overlayLabel = v5;

      -[UILabel setAlpha:](self->__overlayLabel, "setAlpha:", 0.0);
      v7 = self->__overlayLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v7, "setTextColor:", v8);

      v9 = self->__overlayLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.2, 0.5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

      -[UILabel layer](self->__overlayLabel, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCornerRadius:", 8.0);

      -[UILabel layer](self->__overlayLabel, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMasksToBounds:", 1);

      -[UILabel setTextAlignment:](self->__overlayLabel, "setTextAlignment:", 1);
      -[ISLivePhotoUIView addSubview:](self, "addSubview:", self->__overlayLabel);
    }
    -[ISBasePlayerUIView player](self, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isPlayingVitality") & 1) != 0)
    {
      v14 = CFSTR("Vitality");
    }
    else if (objc_msgSend(v13, "currentPlaybackStyle") == 2)
    {
      v14 = CFSTR("Hint");
    }
    else if (objc_msgSend(v13, "currentPlaybackStyle") == 1)
    {
      v14 = CFSTR("Full");
    }
    else
    {
      v14 = CFSTR("Idle");
    }
    -[UILabel setText:](self->__overlayLabel, "setText:", v14);
    -[UILabel sizeToFit](self->__overlayLabel, "sizeToFit");
    v15 = self->__overlayLabel;
    -[ISLivePhotoUIView bounds](self, "bounds");
    x = v27.origin.x;
    y = v27.origin.y;
    width = v27.size.width;
    height = v27.size.height;
    MidX = CGRectGetMidX(v27);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    -[UILabel setCenter:](v15, "setCenter:", MidX, CGRectGetMidY(v28));
    v21 = self->__overlayLabel;
    -[UILabel frame](v21, "frame");
    v30 = CGRectInset(v29, -10.0, -10.0);
    -[UILabel setFrame:](v21, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
    -[UILabel setAlpha:](self->__overlayLabel, "setAlpha:", 1.0);
    v22 = (void *)(-[ISLivePhotoUIView _overlayDismissalID](self, "_overlayDismissalID") + 1);
    -[ISLivePhotoUIView _setOverlayDismissalID:](self, "_setOverlayDismissalID:", v22);
    objc_initWeak(&location, self);
    v23 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__ISLivePhotoUIView__showOverlayLabel__block_invoke;
    block[3] = &unk_1E9453D60;
    objc_copyWeak(v25, &location);
    v25[1] = v22;
    dispatch_after(v23, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(v25);
    objc_destroyWeak(&location);

  }
}

- (void)_dismissOverlayLabel:(int64_t)a3
{
  _QWORD v4[5];

  if (-[ISLivePhotoUIView _overlayDismissalID](self, "_overlayDismissalID") == a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __42__ISLivePhotoUIView__dismissOverlayLabel___block_invoke;
    v4[3] = &unk_1E9453F48;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v4, 0.2);
  }
}

- (void)_playerDidChangePlaybackStyle
{
  void *v3;
  uint64_t v4;

  -[ISBasePlayerUIView player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentPlaybackStyle");

  if (v4 == 1)
    -[UIImpactFeedbackGenerator impactOccurred](self->_feedbackGenerator, "impactOccurred");
  -[ISLivePhotoUIView _updateGestureRecognizerParameters](self, "_updateGestureRecognizerParameters");
}

- (void)_playerDidChangeHinting
{
  void *v3;
  int v4;

  -[ISBasePlayerUIView player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHinting");

  if (v4)
    -[UIImpactFeedbackGenerator prepare](self->_feedbackGenerator, "prepare");
}

- (void)_updateGestureRecognizerParameters
{
  void *v3;
  uint64_t v4;
  double v5;
  id v6;

  -[ISLivePhotoUIView playbackGestureRecognizer](self, "playbackGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ISBasePlayerUIView player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "currentPlaybackStyle");

    v5 = 1.79769313e308;
    if (v4 != 1)
      v5 = 10.0;
    objc_msgSend(v6, "setMaximumTouchMovement:", v5);
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  ISLivePhotoUIView *v3;
  void *v4;

  if (!self->_delegateRespondsTo.canBeginInteractivePlayback)
    return 1;
  v3 = self;
  -[ISLivePhotoUIView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "livePhotoViewCanBeginInteractivePlayback:", v3);

  return (char)v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[ISLivePhotoUIView playbackGestureRecognizer](self, "playbackGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
    v9 = v6;
  else
    v9 = 0;
  v10 = v9;

  if (v10 && self->_delegateRespondsTo.extraMinimumTouchDuration)
  {
    -[ISLivePhotoUIView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "livePhotoViewExtraMinimumTouchDuration:touch:", self, v7);
    objc_msgSend(v10, "setExtraMinimumTouchDuration:");

  }
  return 1;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v5;
  objc_super v7;

  v5 = a4;
  if ((void *)ISLivePhotoPlayerObservableContext != a5)
  {
    v7.receiver = self;
    v7.super_class = (Class)ISLivePhotoUIView;
    -[ISBasePlayerUIView observable:didChange:context:](&v7, sel_observable_didChange_context_, a3, a4);
    return;
  }
  -[ISLivePhotoUIView _showOverlayLabel](self, "_showOverlayLabel", a3);
  if ((v5 & 8) != 0)
  {
    -[ISLivePhotoUIView _playerDidChangePlaybackStyle](self, "_playerDidChangePlaybackStyle");
    if ((v5 & 0x20) == 0)
    {
LABEL_5:
      if ((v5 & 0x10) == 0)
        return;
LABEL_9:
      -[ISLivePhotoUIView _updateVideoTransform](self, "_updateVideoTransform");
      return;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_5;
  }
  -[ISLivePhotoUIView _playerDidChangeHinting](self, "_playerDidChangeHinting");
  if ((v5 & 0x10) != 0)
    goto LABEL_9;
}

- (CAMeshTransform)vitalityTransform
{
  return self->_vitalityTransform;
}

- (ISLivePhotoUIViewDelegate)delegate
{
  return (ISLivePhotoUIViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_playingVitality
{
  return self->__playingVitality;
}

- (void)_setPlayingVitality:(BOOL)a3
{
  self->__playingVitality = a3;
}

- (UILabel)_overlayLabel
{
  return self->__overlayLabel;
}

- (int64_t)_overlayDismissalID
{
  return self->__overlayDismissalID;
}

- (void)_setOverlayDismissalID:(int64_t)a3
{
  self->__overlayDismissalID = a3;
}

void __42__ISLivePhotoUIView__dismissOverlayLabel___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_overlayLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __38__ISLivePhotoUIView__showOverlayLabel__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissOverlayLabel:", *(_QWORD *)(a1 + 40));

}

uint64_t __50__ISLivePhotoUIView_setPlaybackFilterTouchActive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTouchActive:", *(unsigned __int8 *)(a1 + 32));
}

@end
