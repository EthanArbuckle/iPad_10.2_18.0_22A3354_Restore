@implementation ISBehavior

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialLayoutInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)becomeActive
{
  self->_active = 1;
  -[ISBehavior activeDidChange](self, "activeDidChange");
}

- (ISBehavior)initWithInitialLayoutInfo:(id)a3
{
  id v5;
  ISBehavior *v6;
  ISBehavior *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISBehavior;
  v6 = -[ISBehavior init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_initialLayoutInfo, a3);

  return v7;
}

- (int64_t)behaviorType
{
  return 0;
}

- (void)resignActive
{
  self->_active = 0;
  -[ISBehavior activeDidChange](self, "activeDidChange");
}

- (void)setOutputInfo:(id)a3 withTransitionOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ISBehavior delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "behavior:didSetOutputInfo:withTransitionOptions:completion:", self, v10, v9, v8);

}

- (void)setVideoPlayRate:(float)a3
{
  double v5;
  id v6;

  -[ISBehavior delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v6, "behavior:setVideoPlayRate:", self, v5);

}

- (void)setVideoVolume:(float)a3
{
  double v5;
  id v6;

  -[ISBehavior delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v6, "behavior:setVideoVolume:", self, v5);

}

- (BOOL)seekVideoPlayerToTime:(id *)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  v6 = a4;
  -[ISBehavior delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *a3;
  LOBYTE(a3) = objc_msgSend(v7, "behavior:seekVideoPlayerToTime:completionHandler:", self, &v9, v6);

  return (char)a3;
}

- (BOOL)seekVideoPlayerToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;

  v10 = a6;
  -[ISBehavior delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *a3;
  v14 = *a4;
  v13 = *a5;
  LOBYTE(a5) = objc_msgSend(v11, "behavior:seekVideoPlayerToTime:toleranceBefore:toleranceAfter:completionHandler:", self, &v15, &v14, &v13, v10);

  return (char)a5;
}

- (BOOL)prerollVideoAtRate:(float)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  double v8;

  v6 = a4;
  -[ISBehavior delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  LOBYTE(self) = objc_msgSend(v7, "behavior:prerollVideoAtRate:completionHandler:", self, v6, v8);

  return (char)self;
}

- (void)setVideoForwardPlaybackEndTime:(id *)a3
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  -[ISBehavior delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  objc_msgSend(v5, "behavior:setVideoForwardPlaybackEndTime:", self, &v6);

}

- (ISBehaviorDelegate)delegate
{
  return (ISBehaviorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (ISPlayerState)initialLayoutInfo
{
  return self->_initialLayoutInfo;
}

- (BOOL)isActive
{
  return self->_active;
}

@end
