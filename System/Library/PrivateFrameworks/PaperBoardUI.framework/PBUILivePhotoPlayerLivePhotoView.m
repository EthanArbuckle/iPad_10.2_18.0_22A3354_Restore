@implementation PBUILivePhotoPlayerLivePhotoView

- (PBUILivePhotoPlayerLivePhotoView)init
{
  PBUILivePhotoPlayerLivePhotoView *v2;
  void *v3;
  objc_class *v4;
  ISLivePhotoUIView *v5;
  ISLivePhotoUIView *livePhotoView;
  void *v7;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v9.receiver = self;
  v9.super_class = (Class)PBUILivePhotoPlayerLivePhotoView;
  v2 = -[PBUILivePhotoPlayerLivePhotoView init](&v9, sel_init);
  if (v2)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v3 = (void *)getISLivePhotoUIViewClass_softClass;
    v14 = getISLivePhotoUIViewClass_softClass;
    if (!getISLivePhotoUIViewClass_softClass)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getISLivePhotoUIViewClass_block_invoke;
      v10[3] = &unk_1E6B94840;
      v10[4] = &v11;
      __getISLivePhotoUIViewClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v11, 8);
    v5 = (ISLivePhotoUIView *)objc_alloc_init(v4);
    livePhotoView = v2->_livePhotoView;
    v2->_livePhotoView = v5;

    -[ISLivePhotoUIView player](v2->_livePhotoView, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUILivePhotoPlayerView _common_configurePlayer:](v2, "_common_configurePlayer:", v7);

    -[PBUILivePhotoPlayerView _common_configurePlayerView:](v2, "_common_configurePlayerView:", v2->_livePhotoView);
  }
  return v2;
}

- (id)gestureRecognizer
{
  return (id)-[ISLivePhotoUIView playbackGestureRecognizer](self->_livePhotoView, "playbackGestureRecognizer");
}

- (int64_t)playbackState
{
  void *v2;
  uint64_t v3;

  -[ISLivePhotoUIView player](self->_livePhotoView, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentPlaybackStyle");

  if ((unint64_t)(v3 - 1) > 3)
    return 0;
  else
    return qword_1B723F5F0[v3 - 1];
}

- (id)_playerUIView
{
  return self->_livePhotoView;
}

- (void)_subclass_updateForForcingPlayback:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[ISLivePhotoUIView player](self->_livePhotoView, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "startPlaybackWithStyleWhenReady:", 1);
  else
    objc_msgSend(v4, "stopPlayback");

}

- (void)_subclass_updatePlayerItemForUse:(id)a3
{
  objc_msgSend(a3, "setLoadingTarget:", 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_livePhotoView, 0);
}

@end
