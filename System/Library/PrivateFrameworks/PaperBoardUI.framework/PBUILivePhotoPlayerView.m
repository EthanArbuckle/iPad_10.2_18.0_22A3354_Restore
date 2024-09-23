@implementation PBUILivePhotoPlayerView

+ (PBUILivePhotoPlayerView)playerViewWithRewindPlaybackStyle:(BOOL)a3
{
  __objc2_class **v3;

  v3 = off_1E6B93560;
  if (!a3)
    v3 = off_1E6B93558;
  return (PBUILivePhotoPlayerView *)objc_alloc_init(*v3);
}

- (void)prepareWithPhoto:(CGImage *)a3 videoAsset:(id)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6
{
  uint64_t v6;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double b;
  double a;
  double c;
  double d;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  CGAffineTransform v31;
  uint64_t v32;
  uint64_t v33;
  Class (*v34)(uint64_t);
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v6 = *(_QWORD *)&a6;
  v10 = a4;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v11 = (void *)getISAssetClass_softClass;
  v40 = getISAssetClass_softClass;
  if (!getISAssetClass_softClass)
  {
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __getISAssetClass_block_invoke;
    v35 = &unk_1E6B94840;
    v36 = &v37;
    __getISAssetClass_block_invoke((uint64_t)&v32);
    v11 = (void *)v38[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v37, 8);
  v13 = (void *)objc_msgSend([v12 alloc], "initWithVideoAsset:photo:photoTime:photoEXIFOrientation:", v10, a3, v6, a5);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scale");
  v21 = v20;

  CGAffineTransformMakeScale(&v31, v21, v21);
  a = v31.a;
  b = v31.b;
  c = v31.c;
  d = v31.d;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v26 = (void *)getISPlayerItemClass_softClass;
  v40 = getISPlayerItemClass_softClass;
  if (!getISPlayerItemClass_softClass)
  {
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __getISPlayerItemClass_block_invoke;
    v35 = &unk_1E6B94840;
    v36 = &v37;
    __getISPlayerItemClass_block_invoke((uint64_t)&v32);
    v26 = (void *)v38[3];
  }
  v27 = objc_retainAutorelease(v26);
  _Block_object_dispose(&v37, 8);
  objc_msgSend(v27, "playerItemWithAsset:targetSize:", v13, v18 * c + a * v16, v18 * d + b * v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "registerChangeObserver:context:", self, PlayerItemObservationContext);
  -[PBUILivePhotoPlayerView _subclass_updatePlayerItemForUse:](self, "_subclass_updatePlayerItemForUse:", v28);
  -[PBUILivePhotoPlayerView _playerUIView](self, "_playerUIView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "player");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPlayerItem:", v28);

}

- (void)startPlaybackWithReason:(id)a3
{
  id v4;
  NSMutableSet *forcePlaybackReasons;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  forcePlaybackReasons = self->_forcePlaybackReasons;
  v8 = v4;
  if (!forcePlaybackReasons)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_forcePlaybackReasons;
    self->_forcePlaybackReasons = v6;

    v4 = v8;
    forcePlaybackReasons = self->_forcePlaybackReasons;
  }
  -[NSMutableSet addObject:](forcePlaybackReasons, "addObject:", v4);
  -[PBUILivePhotoPlayerView _subclass_updateForForcingPlayback:](self, "_subclass_updateForForcingPlayback:", -[PBUILivePhotoPlayerView _isForcingPlayback](self, "_isForcingPlayback"));

}

- (void)stopPlaybackWithReason:(id)a3
{
  -[NSMutableSet removeObject:](self->_forcePlaybackReasons, "removeObject:", a3);
  -[PBUILivePhotoPlayerView _subclass_updateForForcingPlayback:](self, "_subclass_updateForForcingPlayback:", -[PBUILivePhotoPlayerView _isForcingPlayback](self, "_isForcingPlayback"));
}

- (void)setContentMode:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBUILivePhotoPlayerView;
  -[PBUILivePhotoPlayerView setContentMode:](&v6, sel_setContentMode_);
  -[PBUILivePhotoPlayerView _playerUIView](self, "_playerUIView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", a3);

}

- (BOOL)_isForcingPlayback
{
  return -[NSMutableSet count](self->_forcePlaybackReasons, "count") != 0;
}

- (void)_common_configurePlayer:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setAudioEnabled:", 0);
  objc_msgSend(v4, "registerChangeObserver:context:", self, PlayerObservationContext);
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)_common_configurePlayerView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PBUILivePhotoPlayerView bounds](self, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  -[PBUILivePhotoPlayerView addSubview:](self, "addSubview:", v4);

  -[PBUILivePhotoPlayerView gestureRecognizer](self, "gestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:", self, sel__handlePlaybackGesture_);

}

- (void)_setInteracting:(BOOL)a3
{
  id v4;

  if (self->_interacting != a3)
  {
    self->_interacting = a3;
    -[PBUILivePhotoPlayerView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "playerViewIsInteractingDidChange:", self);

  }
}

- (void)_handlePlaybackGesture:(id)a3
{
  -[PBUILivePhotoPlayerView _setInteracting:](self, "_setInteracting:", (unint64_t)(objc_msgSend(a3, "state") - 1) < 2);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  char isKindOfClass;
  uint64_t v15;
  uint64_t v16;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a4;
  v8 = a3;
  -[PBUILivePhotoPlayerView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((void *)PlayerObservationContext != a5)
    goto LABEL_2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v10 = (void *)getISLiveWallpaperPlayerClass_softClass;
  v23 = getISLiveWallpaperPlayerClass_softClass;
  if (!getISLiveWallpaperPlayerClass_softClass)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __getISLiveWallpaperPlayerClass_block_invoke;
    v18 = &unk_1E6B94840;
    v19 = &v20;
    __getISLiveWallpaperPlayerClass_block_invoke((uint64_t)&v15);
    v10 = (void *)v21[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v20, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((v6 & 0x10) == 0)
      goto LABEL_2;
    goto LABEL_12;
  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v12 = (void *)getISLivePhotoPlayerClass_softClass;
  v23 = getISLivePhotoPlayerClass_softClass;
  if (!getISLivePhotoPlayerClass_softClass)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __getISLivePhotoPlayerClass_block_invoke;
    v18 = &unk_1E6B94840;
    v19 = &v20;
    __getISLivePhotoPlayerClass_block_invoke((uint64_t)&v15);
    v12 = (void *)v21[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v20, 8);
  isKindOfClass = objc_opt_isKindOfClass();
  if ((v6 & 8) != 0 && (isKindOfClass & 1) != 0)
  {
LABEL_12:
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "playerViewPlaybackStateDidChange:", self);
  }
LABEL_2:

}

- (id)videoPlayerForPlayer:(id)a3
{
  void *v4;
  void *v5;

  -[PBUILivePhotoPlayerView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "videoPlayerForPlayerView:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PBUILivePhotoPlayerViewDelegate)delegate
{
  return (PBUILivePhotoPlayerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isInteracting
{
  return self->_interacting;
}

- (ISBasePlayerUIView)_playerUIView
{
  return self->__playerUIView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__playerUIView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_forcePlaybackReasons, 0);
}

- (UIGestureRecognizer)gestureRecognizer
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  return 0;
}

- (int64_t)playbackState
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  return 0;
}

@end
