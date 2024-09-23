@implementation TUIVideoView

+ (id)renderModelWithIdentifier:(id)a3 url:(id)a4 posterFrameResource:(id)a5 videoId:(id)a6 loop:(BOOL)a7 muted:(BOOL)a8 allowFullScreen:(BOOL)a9 autoPlay:(BOOL)a10 showPlaybackControls:(BOOL)a11 gravity:(id)a12 cornerRadius:(double)a13 topTriggerName:(id)a14 bottomTriggerName:(id)a15 leftTriggerName:(id)a16 rightTriggerName:(id)a17 actionHandler:(id)a18
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _TUIRenderModelVideo *v31;
  TUIRenderModelView *v32;
  uint64_t v34;
  id v36;
  _BOOL4 v37;
  _BOOL4 v38;

  v37 = a7;
  v38 = a8;
  v22 = a18;
  v23 = a17;
  v24 = a16;
  v25 = a15;
  v26 = a14;
  v27 = a12;
  v28 = a6;
  v29 = a5;
  v30 = a4;
  v36 = a3;
  LOWORD(v34) = __PAIR16__(a11, a10);
  v31 = -[_TUIRenderModelVideo initWithUrl:posterFrameResource:videoId:loop:muted:allowFullScreen:autoPlay:showPlaybackControls:gravity:cornerRadius:topTriggerName:bottomTriggerName:leftTriggerName:rightTriggerName:actionHandler:]([_TUIRenderModelVideo alloc], "initWithUrl:posterFrameResource:videoId:loop:muted:allowFullScreen:autoPlay:showPlaybackControls:gravity:cornerRadius:topTriggerName:bottomTriggerName:leftTriggerName:rightTriggerName:actionHandler:", v30, v29, v28, v37, v38, a9, a13, v34, v27, v26, v25, v24, v23, v22);

  v32 = -[TUIRenderModelView initWithReuseIdentifier:identifier:submodel:]([TUIRenderModelView alloc], "initWithReuseIdentifier:identifier:submodel:", CFSTR("TUIReuseIdentifierVideoView"), v36, v31);
  return v32;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  -[AVPlayerController removeObserver:forKeyPath:context:](self->_playerController, "removeObserver:forKeyPath:context:", self, CFSTR("scrubbing"), &off_2418C8);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("playerController"), &off_2418C8);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("readyForDisplay"), &off_2418C8);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
  objc_msgSend(v5, "removeFromParentViewController");

  WeakRetained = objc_loadWeakRetained((id *)&self->_posterFrameResource);
  objc_msgSend(WeakRetained, "removeInterest");

  v7 = objc_loadWeakRetained((id *)&self->_posterFrameResource);
  objc_msgSend(v7, "removeObserver:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "videoPlayerManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
    objc_msgSend(v10, "endHostingForVideoId:forHost:", v11, self);

  }
  -[TUIVideoView _unregisterTriggers](self, "_unregisterTriggers");
  v12.receiver = self;
  v12.super_class = (Class)TUIVideoView;
  -[TUIVideoView dealloc](&v12, "dealloc");
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIVideoView;
  v4 = a3;
  -[TUIReusableBaseView applyLayoutAttributes:](&v7, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel", v7.receiver, v7.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submodel"));
  -[TUIVideoView _configureWithModel:](self, "_configureWithModel:", v6);

}

- (void)_configureWithModel:(id)a3
{
  _TUIRenderModelVideo **p_renderModel;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id WeakRetained;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  p_renderModel = &self->_renderModel;
  v24 = a3;
  if ((objc_msgSend(v24, "isEqualToRenderModel:", *p_renderModel) & 1) == 0)
  {
    if (*p_renderModel)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](*p_renderModel, "videoId"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "videoId"));
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) == 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "videoPlayerManager"));
        objc_msgSend(v10, "endHostingForVideoId:forHost:", v6, self);

      }
      -[TUIVideoView _unregisterTriggers](self, "_unregisterTriggers");

    }
    objc_storeStrong((id *)&self->_renderModel, a3);
    -[TUIVideoView _registerTriggers](self, "_registerTriggers");
    -[TUIVideoView _configureFullscreenTapGestureRecognizer](self, "_configureFullscreenTapGestureRecognizer");
    -[TUIVideoView _configureVideoViewController](self, "_configureVideoViewController");
    -[TUIVideoView _updateStateBasedTapGestureRecognizers](self, "_updateStateBasedTapGestureRecognizers");
    WeakRetained = objc_loadWeakRetained((id *)&self->_posterFrameResource);
    v12 = (id)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo posterFrameResource](*p_renderModel, "posterFrameResource"));

    if (WeakRetained != v12)
    {
      v13 = objc_loadWeakRetained((id *)&self->_posterFrameResource);
      objc_msgSend(v13, "removeInterest");

      v14 = objc_loadWeakRetained((id *)&self->_posterFrameResource);
      objc_msgSend(v14, "removeObserver:", self);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo posterFrameResource](*p_renderModel, "posterFrameResource"));
      objc_storeWeak((id *)&self->_posterFrameResource, v15);

      v16 = objc_loadWeakRetained((id *)&self->_posterFrameResource);
      objc_msgSend(v16, "addInterest");

      v17 = objc_loadWeakRetained((id *)&self->_posterFrameResource);
      objc_msgSend(v17, "addObserver:", self);

    }
    if (-[_TUIRenderModelVideo autoPlay](*p_renderModel, "autoPlay"))
      v18 = 2;
    else
      v18 = 0;
    if (-[_TUIRenderModelVideo muted](*p_renderModel, "muted"))
      v18 |= 4uLL;
    v19 = v18 | -[_TUIRenderModelVideo loop](*p_renderModel, "loop");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "videoPlayerManager"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "url"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "videoId"));
    objc_msgSend(v21, "configureHostWithPlayerForURL:videoId:host:options:", v22, v23, self, v19);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  v18.receiver = self;
  v18.super_class = (Class)TUIVideoView;
  -[TUIVideoView layoutSubviews](&v18, "layoutSubviews");
  -[TUIVideoView _configurePosterFrameImageView](self, "_configurePosterFrameImageView");
  -[TUIVideoView _configurePlayButtonView](self, "_configurePlayButtonView");
  -[TUIVideoView _configureActivityIndicatorView](self, "_configureActivityIndicatorView");
  -[TUIVideoView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  -[UIImageView setFrame:](self->_posterFrameImageView, "setFrame:", v4, v6, v8, v10);
  -[TUIVideoView center](self, "center");
  -[UIActivityIndicatorView setCenter:](self->_activityIndicatorView, "setCenter:");
  +[_TUIVideoPlayButton computeSizeFittingVideoSize:](_TUIVideoPlayButton, "computeSizeFittingVideoSize:", v8, v10);
  v14 = v13;
  v16 = v15;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  v17 = CGRectGetWidth(v19) * 0.5 - v14 * 0.5;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  -[_TUIVideoPlayButton setFrame:](self->_playButton, "setFrame:", v17, CGRectGetHeight(v20) * 0.5 - v16 * 0.5, v14, v16);
}

- (unint64_t)videoMode
{
  return self->_isInFullScreen;
}

- (double)currentTime
{
  void *v2;
  void *v3;
  void *v4;
  double Seconds;
  CMTime time;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "player"));
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- (double)duration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double Seconds;
  CMTime time;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "player"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentItem"));
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "duration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- (BOOL)isPlaying
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "videoPlayerManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
  v6 = objc_msgSend(v4, "playerWithVideoIdIsPlaying:", v5);

  return v6;
}

- (void)setPlayerController:(id)a3
{
  AVPlayerController *v5;
  AVPlayerController *playerController;
  AVPlayerController *v7;

  v5 = (AVPlayerController *)a3;
  playerController = self->_playerController;
  if (playerController != v5)
  {
    v7 = v5;
    if (playerController)
      -[AVPlayerController removeObserver:forKeyPath:context:](playerController, "removeObserver:forKeyPath:context:", self, CFSTR("scrubbing"), &off_2418C8);
    objc_storeStrong((id *)&self->_playerController, a3);
    -[AVPlayerController addObserver:forKeyPath:options:context:](self->_playerController, "addObserver:forKeyPath:options:context:", self, CFSTR("scrubbing"), 1, &off_2418C8);
    v5 = v7;
  }

}

- (id)viewStateSave
{
  return -[_TUIVideoViewState initWithMuteState:]([_TUIVideoViewState alloc], "initWithMuteState:", -[TUIVideoView shouldMuteOnNextDisplay](self, "shouldMuteOnNextDisplay"));
}

- (void)viewStateRestore:(id)a3
{
  if (a3)
    -[TUIVideoView setShouldMuteOnNextDisplay:](self, "setShouldMuteOnNextDisplay:", objc_msgSend(a3, "muted"));
}

- (void)_registerTriggers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo topTriggerName](self->_renderModel, "topTriggerName"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo bottomTriggerName](self->_renderModel, "bottomTriggerName"));
    v5 = objc_msgSend(v4, "length");

    if (!v5)
      goto LABEL_5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "triggerStateManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo topTriggerName](self->_renderModel, "topTriggerName"));
    objc_msgSend(v7, "addObserver:forTrigger:", self, v8);

    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "triggerStateManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo bottomTriggerName](self->_renderModel, "bottomTriggerName"));
    objc_msgSend(v9, "addObserver:forTrigger:", self, v10);

  }
LABEL_5:
  v18 = (id)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo leftTriggerName](self->_renderModel, "leftTriggerName"));
  if (objc_msgSend(v18, "length"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo rightTriggerName](self->_renderModel, "rightTriggerName"));
    v12 = objc_msgSend(v11, "length");

    if (!v12)
      return;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "triggerStateManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo leftTriggerName](self->_renderModel, "leftTriggerName"));
    objc_msgSend(v14, "addObserver:forTrigger:", self, v15);

    v18 = (id)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "triggerStateManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo rightTriggerName](self->_renderModel, "rightTriggerName"));
    objc_msgSend(v16, "addObserver:forTrigger:", self, v17);

  }
}

- (void)_unregisterTriggers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo topTriggerName](self->_renderModel, "topTriggerName"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo bottomTriggerName](self->_renderModel, "bottomTriggerName"));
    v5 = objc_msgSend(v4, "length");

    if (!v5)
      goto LABEL_5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "triggerStateManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo topTriggerName](self->_renderModel, "topTriggerName"));
    objc_msgSend(v7, "removeObserver:forTrigger:", self, v8);

    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "triggerStateManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo bottomTriggerName](self->_renderModel, "bottomTriggerName"));
    objc_msgSend(v9, "removeObserver:forTrigger:", self, v10);

  }
LABEL_5:
  v18 = (id)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo leftTriggerName](self->_renderModel, "leftTriggerName"));
  if (objc_msgSend(v18, "length"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo rightTriggerName](self->_renderModel, "rightTriggerName"));
    v12 = objc_msgSend(v11, "length");

    if (!v12)
      return;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "triggerStateManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo leftTriggerName](self->_renderModel, "leftTriggerName"));
    objc_msgSend(v14, "removeObserver:forTrigger:", self, v15);

    v18 = (id)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "triggerStateManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo rightTriggerName](self->_renderModel, "rightTriggerName"));
    objc_msgSend(v16, "removeObserver:forTrigger:", self, v17);

  }
}

- (void)_setPosterFrameImageVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  double v8;
  _BOOL4 v9;
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];
  BOOL v13;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView posterFrameImageView](self, "posterFrameImageView"));
  objc_msgSend(v7, "alpha");
  v9 = v8 != 1.0;

  if (((v9 ^ v5) & 1) == 0)
  {
    if (v4)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_106020;
      v12[3] = &unk_23EA68;
      v12[4] = self;
      v13 = v5;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, 0, 0.2);
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_106064;
      v10[3] = &unk_23EA68;
      v10[4] = self;
      v11 = v5;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);
    }
  }
}

- (void)_setPlayButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  double v8;
  _BOOL4 v9;
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD v14[5];
  BOOL v15;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView playButton](self, "playButton"));
  objc_msgSend(v7, "alpha");
  v9 = v8 != 1.0;

  if (((v9 ^ v5) & 1) == 0)
  {
    if (v4)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1061BC;
      v14[3] = &unk_23EA68;
      v14[4] = self;
      v15 = v5;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_106200;
      v12[3] = &unk_2418D8;
      v12[4] = self;
      v13 = v5;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, v12, 0.3);
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10626C;
      v10[3] = &unk_23EA68;
      v10[4] = self;
      v11 = v5;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);
    }
  }
}

- (void)_configureVideoViewController
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 isInFullScreen;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL8 v38;
  void *v39;
  _BOOL8 v40;
  void *v41;
  id v42;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));

  if (!v3)
  {
    v4 = objc_alloc_init((Class)AVPlayerViewController);
    -[TUIVideoView setVideoViewController:](self, "setVideoViewController:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v5, "setDelegate:", self);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v6, "setCanPausePlaybackWhenExitingFullScreen:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v7, "setCanToggleVideoGravityWhenEmbeddedInline:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v8, "setModalPresentationStyle:", 5);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v9, "setUpdatesNowPlayingInfoCenter:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v10, "setAllowsPictureInPicturePlayback:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v11, "setExitsFullScreenWhenPlaybackEnds:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
    objc_msgSend(v13, "setClipsToBounds:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
    objc_msgSend(v16, "setMasksToBounds:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v17, "addChildViewController:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
    -[TUIVideoView addSubview:](self, "addSubview:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v21, "didAddChildViewController:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v23, "addObserver:forKeyPath:options:context:", self, CFSTR("readyForDisplay"), 5, &off_2418C8);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v24, "addObserver:forKeyPath:options:context:", self, CFSTR("playerController"), 1, &off_2418C8);

  }
  isInFullScreen = self->_isInFullScreen;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
  v27 = v26;
  if (isInFullScreen)
  {
    objc_msgSend(v26, "setShowsPlaybackControls:", 1);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v28, "setCanHidePlaybackControls:", 1);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    v42 = v29;
    v30 = 0;
  }
  else
  {
    objc_msgSend(v26, "setCanHidePlaybackControls:", 0);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo gravity](self->_renderModel, "gravity"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v32, "setVideoGravity:", v31);

    -[_TUIRenderModelVideo cornerRadius](self->_renderModel, "cornerRadius");
    v34 = v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "view"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "layer"));
    objc_msgSend(v37, "setCornerRadius:", v34);

    v38 = -[_TUIRenderModelVideo allowFullScreen](self->_renderModel, "allowFullScreen");
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v39, "setAllowsEnteringFullScreen:", v38);

    v40 = -[_TUIRenderModelVideo showPlaybackControls](self->_renderModel, "showPlaybackControls");
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    objc_msgSend(v41, "setShowsPlaybackControls:", v40);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    v42 = v29;
    v30 = 1;
  }
  objc_msgSend(v29, "setPreferredUnobscuredArea:", v30);

}

- (void)_handleFullScreenTapGesture:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController", a3));
  objc_msgSend(v3, "enterFullScreenWithCompletion:", 0);

}

- (void)_handlePlayTapGesture:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "videoPlayerManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
  objc_msgSend(v4, "hostWantsToPlayVideoWithVideoId:requestingHost:isTriggerInitiated:", v5, self, 0);

}

- (void)_configureFullscreenTapGestureRecognizer
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *fullScreenTapGesture;

  if (!self->_fullScreenTapGesture)
  {
    v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleFullScreenTapGesture:");
    fullScreenTapGesture = self->_fullScreenTapGesture;
    self->_fullScreenTapGesture = v3;

  }
}

- (void)_configurePosterFrameImageView
{
  UIImageView *v3;
  UIImageView *posterFrameImageView;
  void *v5;
  UIImageView *v6;
  uint64_t v7;
  unsigned int v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  if (!self->_posterFrameImageView)
  {
    v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    posterFrameImageView = self->_posterFrameImageView;
    self->_posterFrameImageView = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_posterFrameImageView, "layer"));
    objc_msgSend(v5, "setMasksToBounds:", 1);

    -[TUIVideoView addSubview:](self, "addSubview:", self->_posterFrameImageView);
  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo gravity](self->_renderModel, "gravity"));
  if (objc_msgSend(v12, "isEqualToString:", AVLayerVideoGravityResizeAspect))
  {
    v6 = self->_posterFrameImageView;
    v7 = 1;
  }
  else
  {
    v8 = objc_msgSend(v12, "isEqualToString:", AVLayerVideoGravityResizeAspectFill);
    v6 = self->_posterFrameImageView;
    if (v8)
      v7 = 2;
    else
      v7 = 0;
  }
  -[UIImageView setContentMode:](v6, "setContentMode:", v7);
  -[_TUIRenderModelVideo cornerRadius](self->_renderModel, "cornerRadius");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_posterFrameImageView, "layer"));
  objc_msgSend(v11, "setCornerRadius:", v10);

}

- (void)_configurePlayButtonView
{
  _TUIVideoPlayButton *v3;
  _TUIVideoPlayButton *playButton;

  if (!self->_playButton)
  {
    v3 = objc_alloc_init(_TUIVideoPlayButton);
    playButton = self->_playButton;
    self->_playButton = v3;

    -[_TUIVideoPlayButton addTarget:action:forControlEvents:](self->_playButton, "addTarget:action:forControlEvents:", self, "_handlePlayTapGesture:", 64);
    -[TUIVideoView addSubview:](self, "addSubview:", self->_playButton);
  }
}

- (void)_configureActivityIndicatorView
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *activityIndicatorView;
  void *v5;

  if (!self->_activityIndicatorView)
  {
    v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    activityIndicatorView = self->_activityIndicatorView;
    self->_activityIndicatorView = v3;

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicatorView, "setHidesWhenStopped:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIActivityIndicatorView setColor:](self->_activityIndicatorView, "setColor:", v5);

    -[TUIVideoView addSubview:](self, "addSubview:", self->_activityIndicatorView);
  }
}

- (void)_updateStateBasedSubviewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  unsigned int v10;
  char v12;
  _BOOL8 v13;
  unsigned int v14;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "videoPlayerManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
  v8 = (char *)objc_msgSend(v6, "stateForPlayerWithVideoId:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
  v10 = objc_msgSend(v9, "isReadyForDisplay");

  -[TUIVideoView _setPosterFrameImageVisible:animated:](self, "_setPosterFrameImageVisible:animated:", v10 ^ 1, v3);
  if (v8 == (_BYTE *)&dword_4 + 1 || v8 == (_BYTE *)&dword_0 + 3)
  {
    v13 = 0;
    if (!-[_TUIRenderModelVideo showPlaybackControls](self->_renderModel, "showPlaybackControls"))
    {
      v12 = self->_isInFullScreen ? 0 : v10;
      if ((v12 & 1) != 0)
        v13 = 1;
    }
    -[TUIVideoView _setPlayButtonVisible:animated:](self, "_setPlayButtonVisible:animated:", v13, v3);
  }
  else
  {
    -[TUIVideoView _setPlayButtonVisible:animated:](self, "_setPlayButtonVisible:animated:", 0, v3);
    if (v8 == (_BYTE *)&dword_8 + 1)
      v14 = v10;
    else
      v14 = 0;
    if (v14 == 1)
    {
      -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
      return;
    }
  }
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
}

- (void)_updateStateBasedTapGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  int *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "videoPlayerManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
  v6 = (int *)objc_msgSend(v4, "stateForPlayerWithVideoId:", v5);

  if (self->_isInFullScreen
    || -[_TUIRenderModelVideo showPlaybackControls](self->_renderModel, "showPlaybackControls")
    || (-[_TUIRenderModelVideo allowFullScreen](self->_renderModel, "allowFullScreen")
      ? (v7 = v6 == &dword_4)
      : (v7 = 0),
        !v7))
  {
    v8 = TUIVideoLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Removing fullscreen tap gesture recognizer", v14, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    objc_msgSend(v11, "removeGestureRecognizer:", self->_fullScreenTapGesture);
  }
  else
  {
    v12 = TUIVideoLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Adding fullscreen tap gesture recognizer", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    objc_msgSend(v11, "addGestureRecognizer:", self->_fullScreenTapGesture);
  }

}

- (void)_reportEvent:(unint64_t)a3 mediaTimePlayed:(double)a4 videoId:(id)a5
{
  id v8;
  TUIVideoEventMetadata *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _BOOL8 v14;
  double v15;
  TUIVideoEventMetadata *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;

  v8 = a5;
  v9 = [TUIVideoEventMetadata alloc];
  v10 = -[TUIVideoView videoMode](self, "videoMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "player"));
  v13 = objc_msgSend(v12, "isMuted");
  v14 = -[TUIVideoView isPlaying](self, "isPlaying");
  -[TUIVideoView duration](self, "duration");
  v16 = -[TUIVideoEventMetadata initWithEventCase:mode:isMuted:isPlaying:mediaTimePlayed:mediaDuration:mediaId:](v9, "initWithEventCase:mode:isMuted:isPlaying:mediaTimePlayed:mediaDuration:mediaId:", a3, v10, v13, v14, v8, a4, v15);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo actionHandler](self->_renderModel, "actionHandler"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoEventMetadata serialize](v16, "serialize"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoEventMetadata triggerForEvent:](v16, "triggerForEvent:", a3));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo actionHandler](self->_renderModel, "actionHandler"));
      v22 = CFSTR("eventData");
      v23 = v18;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      objc_msgSend(v20, "invoke:arguments:", v19, v21);

    }
  }

}

- (void)_reportAction:(unint64_t)a3 origin:(unint64_t)a4 videoId:(id)a5
{
  id v8;
  TUIVideoActionMetadata *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _BOOL8 v14;
  double v15;
  double v16;
  double v17;
  TUIVideoActionMetadata *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;

  v8 = a5;
  v9 = [TUIVideoActionMetadata alloc];
  v10 = -[TUIVideoView videoMode](self, "videoMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "player"));
  v13 = objc_msgSend(v12, "isMuted");
  v14 = -[TUIVideoView isPlaying](self, "isPlaying");
  -[TUIVideoView currentTime](self, "currentTime");
  v16 = v15;
  -[TUIVideoView duration](self, "duration");
  v18 = -[TUIVideoActionMetadata initWithActionCase:origin:mode:isMuted:isPlaying:mediaTimePlayed:mediaDuration:mediaId:](v9, "initWithActionCase:origin:mode:isMuted:isPlaying:mediaTimePlayed:mediaDuration:mediaId:", a3, a4, v10, v13, v14, v8, v16, v17);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo actionHandler](self->_renderModel, "actionHandler"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoActionMetadata serialize](v18, "serialize"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoActionMetadata triggerForAction:](v18, "triggerForAction:", a3));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo actionHandler](self->_renderModel, "actionHandler"));
      v24 = CFSTR("actionData");
      v25 = v20;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
      objc_msgSend(v22, "invoke:arguments:", v21, v23);

    }
  }

}

- (void)imageResourceDidChangeImage:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  TUIVideoView *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_107108;
  v5[3] = &unk_23D7D0;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)playerWithVideoId:(id)a3 didChangeState:(unint64_t)a4
{
  -[TUIVideoView _updateStateBasedSubviewsAnimated:](self, "_updateStateBasedSubviewsAnimated:", 1, a4);
  -[TUIVideoView _updateStateBasedTapGestureRecognizers](self, "_updateStateBasedTapGestureRecognizers");
}

- (void)playerWithVideoIdDidPlayToEnd:(id)a3 mediaTimePlayed:(double)a4
{
  -[TUIVideoView _reportEvent:mediaTimePlayed:videoId:](self, "_reportEvent:mediaTimePlayed:videoId:", 7, a3, a4);
}

- (void)playerWithVideoId:(id)a3 didStallPlaybackAtTime:(double)a4
{
  -[TUIVideoView _reportEvent:mediaTimePlayed:videoId:](self, "_reportEvent:mediaTimePlayed:videoId:", 9, a3, a4);
}

- (void)playerWithVideoIdDidPlay:(id)a3 mediaTimePlayed:(double)a4
{
  -[TUIVideoView _reportEvent:mediaTimePlayed:videoId:](self, "_reportEvent:mediaTimePlayed:videoId:", 2 * (a4 >= 1.0), a3);
}

- (void)playerWithVideoIdDidPause:(id)a3 mediaTimePlayed:(double)a4
{
  -[TUIVideoView _reportEvent:mediaTimePlayed:videoId:](self, "_reportEvent:mediaTimePlayed:videoId:", 1, a3, a4);
}

- (void)playerWithVideoId:(id)a3 didSetMuted:(BOOL)a4 mediaTimePlayed:(double)a5
{
  uint64_t v6;

  if (a4)
    v6 = 3;
  else
    v6 = 4;
  -[TUIVideoView _reportEvent:mediaTimePlayed:videoId:](self, "_reportEvent:mediaTimePlayed:videoId:", v6, a3, a5);
}

- (void)playerWithVideoId:(id)a3 didSetFailureReason:(unint64_t)a4 mediaTimePlayed:(double)a5
{
  -[TUIVideoView _reportEvent:mediaTimePlayed:videoId:](self, "_reportEvent:mediaTimePlayed:videoId:", 8, a3, a5);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v22;

  v10 = a3;
  v11 = a5;
  if (a6 == &off_2418C8)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("scrubbing")))
    {
      v12 = objc_opt_class(NSNumber);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", NSKeyValueChangeNewKey));
      v14 = TUIDynamicCast(v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = objc_msgSend(v15, "BOOLValue");

      -[TUIVideoView currentTime](self, "currentTime");
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
      if (v16)
        v20 = 10;
      else
        v20 = 11;
      -[TUIVideoView _reportEvent:mediaTimePlayed:videoId:](self, "_reportEvent:mediaTimePlayed:videoId:", v20, v19, v18);
    }
    else
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("readyForDisplay")))
      {
        -[TUIVideoView _updateStateBasedSubviewsAnimated:](self, "_updateStateBasedSubviewsAnimated:", 1);
        goto LABEL_11;
      }
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("playerController")))
        goto LABEL_11;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "playerController"));
      -[TUIVideoView setPlayerController:](self, "setPlayerController:", v21);

    }
    goto LABEL_11;
  }
  v22.receiver = self;
  v22.super_class = (Class)TUIVideoView;
  -[TUIVideoView observeValueForKeyPath:ofObject:change:context:](&v22, "observeValueForKeyPath:ofObject:change:context:", v10, a4, v11, a6);
LABEL_11:

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  _TUIVideoPlayButton *playButton;
  void *v6;
  _QWORD v8[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoView videoViewController](self, "videoViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  playButton = self->_playButton;
  v8[0] = v4;
  v8[1] = playButton;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));

  return v6;
}

- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  int *v9;
  void *v10;
  void *v11;
  void *v12;
  int *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int *v21;
  _BOOL4 v23;
  void *v24;
  void *v25;
  unsigned int v26;
  _BOOL4 v30;
  BOOL v32;
  int v33;
  int v34;
  _BOOL4 v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  id v48;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost", a3, a4, a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "triggerStateManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo topTriggerName](self->_renderModel, "topTriggerName"));
  v9 = (int *)objc_msgSend(v7, "stateForTriggerWithName:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "triggerStateManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo bottomTriggerName](self->_renderModel, "bottomTriggerName"));
  v13 = (int *)objc_msgSend(v11, "stateForTriggerWithName:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "triggerStateManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo leftTriggerName](self->_renderModel, "leftTriggerName"));
  v17 = (unint64_t)objc_msgSend(v15, "stateForTriggerWithName:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "triggerStateManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo rightTriggerName](self->_renderModel, "rightTriggerName"));
  v21 = (int *)objc_msgSend(v19, "stateForTriggerWithName:", v20);

  v23 = v9 == (int *)((char *)&dword_0 + 2) || v13 == (int *)((char *)&dword_0 + 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "videoPlayerManager"));
  v26 = objc_msgSend(v25, "isInForeground");

  v30 = v9 == &dword_4 || v13 == &dword_4 || v17 == 4 || v21 == &dword_4;
  v32 = (v17 & 0xFFFFFFFFFFFFFFFDLL) == 0 || v21 == (int *)((char *)&dword_0 + 2) || v21 == 0;
  v33 = !v32;
  v46 = v33;
  v34 = !v32 || v30;
  v35 = v23;
  v36 = v23 & ~v34 & v26;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "videoPlayerManager"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
  objc_msgSend(v38, "hostWantsToSetPlayerIsWithinVisibleBoundsForPlayerWithVideoId:requestingHost:isWithinVisibleBounds:", v39, self, v36);

  if (a4 != 4)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "videoPlayerManager"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo url](self->_renderModel, "url"));
    objc_msgSend(v41, "setActiveHostOfPlayerForVideoId:videoUrl:host:", v42, v43, self);

  }
  if (!self->_fullScreenTransitionInFlight && !self->_isInFullScreen)
  {
    -[TUIVideoView _updateStateBasedSubviewsAnimated:](self, "_updateStateBasedSubviewsAnimated:", 1);
    if (((v30 | v46 | !v35) & 1) != 0)
    {
      v48 = (id)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "videoPlayerManager"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
      objc_msgSend(v44, "hostWantsToPausePlayerWithVideoId:requestingHost:isTriggerInitiated:", v45, self, 1);
    }
    else
    {
      if (!-[_TUIRenderModelVideo autoPlay](self->_renderModel, "autoPlay"))
        return;
      v48 = (id)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "videoPlayerManager"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
      objc_msgSend(v44, "hostWantsToPlayVideoWithVideoId:requestingHost:isTriggerInitiated:", v45, self, 1);
    }

  }
}

- (void)willBecomeInactiveHost
{
  self->_shouldMuteOnNextDisplay = 1;
}

- (void)didBecomeActiveHost
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_shouldMuteOnNextDisplay)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "videoPlayerManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
    objc_msgSend(v4, "setMuteStateForPlayerWithVideoId:muted:requestingHost:isTriggerInitiated:", v5, 1, self, 1);

    self->_shouldMuteOnNextDisplay = 0;
  }
  -[TUIVideoView _updateStateBasedSubviewsAnimated:](self, "_updateStateBasedSubviewsAnimated:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "videoPlayerManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
  objc_msgSend(v6, "setLoopingStateForPlayerWithVideoId:loop:requestingHost:", v7, -[_TUIRenderModelVideo loop](self->_renderModel, "loop"), self);

}

- (void)managerAttemptingActionWithOrigin:(unint64_t)a3 actionCase:(unint64_t)a4
{
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
  -[TUIVideoView _reportAction:origin:videoId:](self, "_reportAction:origin:videoId:", a4, a3, v7);

}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  _QWORD v4[5];

  self->_fullScreenTransitionInFlight = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1079EC;
  v4[3] = &unk_241900;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", 0, v4);
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  _QWORD v4[5];

  self->_fullScreenTransitionInFlight = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_107B8C;
  v4[3] = &unk_241900;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", 0, v4);
}

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!a4 && !self->_isInFullScreen)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_107D40;
    v11[3] = &unk_23D938;
    v11[4] = self;
    objc_msgSend(v9, "addCoordinatedAnimations:completion:", v11, 0);
  }

}

- (void)playerViewController:(id)a3 metricsCollectionEventOccured:(int64_t)a4
{
  id v6;
  void *v7;
  TUIVideoView *v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  v10 = v6;
  switch(a4)
  {
    case 0:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
      v8 = self;
      v9 = 0;
      goto LABEL_8;
    case 1:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
      v8 = self;
      v9 = 1;
      goto LABEL_8;
    case 2:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
      v8 = self;
      v9 = 2;
      goto LABEL_8;
    case 3:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
      v8 = self;
      v9 = 3;
      goto LABEL_8;
    case 4:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
      v8 = self;
      v9 = 4;
      goto LABEL_8;
    case 5:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelVideo videoId](self->_renderModel, "videoId"));
      v8 = self;
      v9 = 5;
LABEL_8:
      -[TUIVideoView _reportAction:origin:videoId:](v8, "_reportAction:origin:videoId:", v9, 0, v7);

      v6 = v10;
      break;
    default:
      break;
  }

}

- (AVPlayerViewController)videoViewController
{
  return self->videoViewController;
}

- (void)setVideoViewController:(id)a3
{
  objc_storeStrong((id *)&self->videoViewController, a3);
}

- (UIImageView)posterFrameImageView
{
  return self->_posterFrameImageView;
}

- (void)setPosterFrameImageView:(id)a3
{
  objc_storeStrong((id *)&self->_posterFrameImageView, a3);
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (_TUIVideoPlayButton)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
  objc_storeStrong((id *)&self->_playButton, a3);
}

- (UITapGestureRecognizer)fullScreenTapGesture
{
  return self->_fullScreenTapGesture;
}

- (void)setFullScreenTapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_fullScreenTapGesture, a3);
}

- (TUIImageResource)posterFrameResource
{
  return (TUIImageResource *)objc_loadWeakRetained((id *)&self->_posterFrameResource);
}

- (void)setPosterFrameResource:(id)a3
{
  objc_storeWeak((id *)&self->_posterFrameResource, a3);
}

- (BOOL)shouldMuteOnNextDisplay
{
  return self->_shouldMuteOnNextDisplay;
}

- (void)setShouldMuteOnNextDisplay:(BOOL)a3
{
  self->_shouldMuteOnNextDisplay = a3;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_destroyWeak((id *)&self->_posterFrameResource);
  objc_storeStrong((id *)&self->_fullScreenTapGesture, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_posterFrameImageView, 0);
  objc_storeStrong((id *)&self->videoViewController, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end
