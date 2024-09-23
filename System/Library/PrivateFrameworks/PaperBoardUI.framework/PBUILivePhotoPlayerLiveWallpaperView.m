@implementation PBUILivePhotoPlayerLiveWallpaperView

- (PBUILivePhotoPlayerLiveWallpaperView)init
{
  PBUILivePhotoPlayerLiveWallpaperView *v2;
  void *v3;
  objc_class *v4;
  ISLiveWallpaperUIView *v5;
  ISLiveWallpaperUIView *liveWallpaperView;
  void *v7;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v9.receiver = self;
  v9.super_class = (Class)PBUILivePhotoPlayerLiveWallpaperView;
  v2 = -[PBUILivePhotoPlayerLiveWallpaperView init](&v9, sel_init);
  if (v2)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v3 = (void *)getISLiveWallpaperUIViewClass_softClass;
    v14 = getISLiveWallpaperUIViewClass_softClass;
    if (!getISLiveWallpaperUIViewClass_softClass)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getISLiveWallpaperUIViewClass_block_invoke;
      v10[3] = &unk_1E6B94840;
      v10[4] = &v11;
      __getISLiveWallpaperUIViewClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v11, 8);
    v5 = (ISLiveWallpaperUIView *)objc_alloc_init(v4);
    liveWallpaperView = v2->_liveWallpaperView;
    v2->_liveWallpaperView = v5;

    -[ISLiveWallpaperUIView player](v2->_liveWallpaperView, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUILivePhotoPlayerView _common_configurePlayer:](v2, "_common_configurePlayer:", v7);

    -[PBUILivePhotoPlayerView _common_configurePlayerView:](v2, "_common_configurePlayerView:", v2->_liveWallpaperView);
  }
  return v2;
}

- (id)gestureRecognizer
{
  return (id)-[ISLiveWallpaperUIView playbackGestureRecognizer](self->_liveWallpaperView, "playbackGestureRecognizer");
}

- (int64_t)playbackState
{
  void *v2;
  int v3;

  -[ISLiveWallpaperUIView player](self->_liveWallpaperView, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaying");

  if (v3)
    return 4;
  else
    return 0;
}

- (id)_playerUIView
{
  return self->_liveWallpaperView;
}

- (void)_subclass_updateForForcingPlayback:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  -[ISLiveWallpaperUIView player](self->_liveWallpaperView, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__PBUILivePhotoPlayerLiveWallpaperView__subclass_updateForForcingPlayback___block_invoke;
  v5[3] = &__block_descriptor_33_e31_v16__0__ISLiveWallpaperPlayer_8l;
  v6 = a3;
  objc_msgSend(v4, "performChanges:", v5);

}

void __75__PBUILivePhotoPlayerLiveWallpaperView__subclass_updateForForcingPlayback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = *(unsigned __int8 *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setTouching:", v3);
  v4 = 400.0;
  if (!*(_BYTE *)(a1 + 32))
    v4 = 0.0;
  objc_msgSend(v5, "setForce:", v4);

}

- (void)_subclass_updatePlayerItemForUse:(id)a3
{
  objc_msgSend(a3, "setLoadingTarget:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveWallpaperView, 0);
}

@end
