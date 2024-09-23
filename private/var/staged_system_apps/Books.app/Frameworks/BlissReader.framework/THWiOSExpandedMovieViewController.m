@implementation THWiOSExpandedMovieViewController

- (THWiOSExpandedMovieViewController)initWithDocumentRoot:(id)a3 expandableRep:(id)a4 delegate:(id)a5
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  THWiOSExpandedMovieViewController *v18;
  THWiOSExpandedMovieViewController *v19;
  NSObject *v20;
  uint64_t v21;
  double v22;
  id v23;
  objc_super v25;

  v9 = objc_opt_class(THWMovieInfo);
  v10 = TSUDynamicCast(v9, objc_msgSend(a4, "expandedContentDrawableToPresent")).n128_u64[0];
  v12 = v11;
  if (!v11)
  {
    v13 = objc_opt_class(THWDrawablesWidgetInfo);
    TSUDynamicCast(v13, objc_msgSend(a4, "info"));
    v15 = v14;
    v16 = objc_opt_class(THWMovieInfo);
    v10 = TSUDynamicCast(v16, objc_msgSend(v15, "expandedStageDrawable")).n128_u64[0];
    v12 = v17;
  }
  v25.receiver = self;
  v25.super_class = (Class)THWiOSExpandedMovieViewController;
  v18 = -[THWiOSExpandedMovieViewController init](&v25, "init", *(double *)&v10);
  v19 = v18;
  if (v18)
  {
    -[THWiOSExpandedMovieViewController setMovieInfo:](v18, "setMovieInfo:", v12);
    -[THWiOSExpandedMovieViewController setDelegate:](v19, "setDelegate:", a5);
    v19->_documentRoot = (THDocumentRoot *)a3;
    objc_msgSend(-[THWiOSExpandedMovieViewController view](v19, "view"), "setAutoresizesSubviews:", 1);
    objc_msgSend(-[THWiOSExpandedMovieViewController view](v19, "view"), "setAutoresizingMask:", 18);
    -[THWiOSExpandedMovieViewController setModalPresentationStyle:](v19, "setModalPresentationStyle:", 0);
    -[THWiOSExpandedMovieViewController setExpandedRepControllerState:](v19, "setExpandedRepControllerState:", 0);
    v19->_animationDelegate = -[THWiOSExpandedMovieAnimationDelegate initWithMovieViewController:]([THWiOSExpandedMovieAnimationDelegate alloc], "initWithMovieViewController:", v19);
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ibooks.expandedMovie", v20);
    v21 = objc_opt_class(THWIOSMovieRep);
    *(_QWORD *)&v22 = TSUDynamicCast(v21, -[THWiOSExpandedMovieViewController expandedRepSourceRep](v19, "expandedRepSourceRep")).n128_u64[0];
    if (!objc_msgSend(v23, "moviePlayerViewController", v22))
    {
      -[THWiOSExpandedMovieViewController p_initializeMoviePlayerController](v19, "p_initializeMoviePlayerController");
      -[THWiOSExpandedMovieViewController setIsFSOMovie:](v19, "setIsFSOMovie:", 1);
    }
    -[BCAudioMuxingCoordinator addAudioMuxingObserver:](+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"), "addAudioMuxingObserver:", v19);
  }
  return v19;
}

- (void)p_initializeMoviePlayerController
{
  AVPlayerItem *v3;
  id v4;
  id v5;

  v3 = +[AVPlayerItem playerItemWithURL:](AVPlayerItem, "playerItemWithURL:", -[THWMovieInfo movieRemoteURL](-[THWiOSExpandedMovieViewController movieInfo](self, "movieInfo"), "movieRemoteURL"));
  v4 = objc_msgSend(objc_alloc((Class)AVPlayer), "initWithPlayerItem:", v3);
  v5 = -[THWMovieInfo drmContext](-[THWiOSExpandedMovieViewController movieInfo](self, "movieInfo"), "drmContext");
  objc_msgSend(v4, "setAllowsExternalPlayback:", objc_msgSend(v5, "kiUanAfQBD5qIUraolUj") ^ 1);
  if (objc_msgSend(v5, "kiUanAfQBD5qIUraolUj"))
    objc_msgSend(v5, "authorizeAVPlayerItemForPlayback:", v3);
  self->_moviePlayerViewController = (AVPlayerViewController *)objc_alloc_init((Class)AVPlayerViewController);
  -[AVPlayerViewController setDelegate:](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "setDelegate:", self);
  -[AVPlayerViewController setPlayer:](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "setPlayer:", v4);
  -[AVPlayerViewController setAllowsPictureInPicturePlayback:](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "setAllowsPictureInPicturePlayback:", 0);
  -[AVPlayerViewController setModalPresentationStyle:](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "setModalPresentationStyle:", 0);
  if (-[THWMovieInfo loopOption](-[THWiOSExpandedMovieViewController movieInfo](self, "movieInfo"), "loopOption") == (char *)&dword_0 + 1)
    objc_msgSend(-[AVPlayerViewController playerController](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "playerController"), "setLooping:", 1);

  -[THWiOSExpandedMovieViewController p_setupPlaybackNotifications](self, "p_setupPlaybackNotifications");
  objc_msgSend(+[THWAVController sharedController](THWAVController, "sharedController"), "stopPlayer");
}

- (void)p_setupPlaybackNotifications
{
  AVPlayer *v3;

  objc_sync_enter(self);
  if (!-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedMovieViewController p_setupPlaybackNotifications]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Movie/THWiOSExpandedMovieViewController.m"), 148, CFSTR("invalid nil value for '%s'"), "self.moviePlayerViewController");
  if (-[AVPlayer currentItem](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "currentItem")&& !-[THWiOSExpandedMovieViewController registeredForNotification](self, "registeredForNotification"))
  {
    v3 = -[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "player");
    -[AVPlayer addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, off_53E808);
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "p_moviePlayerPlaybackDidFinish:", AVPlayerItemDidPlayToEndTimeNotification, -[AVPlayer currentItem](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "currentItem"));
    -[THWiOSExpandedMovieViewController setRegisteredForNotification:](self, "setRegisteredForNotification:", 1);
  }
  -[AVPlayerViewController setDelegate:](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "setDelegate:", self);
  objc_sync_exit(self);
}

- (void)p_removePlaybackNotifications
{
  objc_sync_enter(self);
  if (-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController")
    && -[THWiOSExpandedMovieViewController registeredForNotification](self, "registeredForNotification"))
  {
    -[AVPlayer removeObserver:forKeyPath:](-[AVPlayerViewController player](self->_moviePlayerViewController, "player"), "removeObserver:forKeyPath:", self, CFSTR("status"));
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, AVPlayerItemDidPlayToEndTimeNotification, -[AVPlayer currentItem](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "currentItem"));
    -[THWiOSExpandedMovieViewController setRegisteredForNotification:](self, "setRegisteredForNotification:", 0);
  }
  -[AVPlayerViewController setDelegate:](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "setDelegate:", 0);
  objc_sync_exit(self);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v11;
  _QWORD v12[5];

  if (off_53E808 == a6 && objc_msgSend(a3, "isEqualToString:", CFSTR("status")))
  {
    if ((char *)-[AVPlayer status](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "status") == (char *)&dword_0 + 1)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_126924;
      v12[3] = &unk_427130;
      v12[4] = self;
      -[AVPlayer prerollAtRate:completionHandler:](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "prerollAtRate:completionHandler:", v12, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0)));
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)THWiOSExpandedMovieViewController;
    -[THWiOSExpandedMovieViewController observeValueForKeyPath:ofObject:change:context:](&v11, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5, a6);
  }
}

- (void)p_unloadMoviePlayer
{
  AVPlayerViewController *v3;

  if (-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"))
  {
    -[THWiOSExpandedMovieViewController p_removePlaybackNotifications](self, "p_removePlaybackNotifications");
    -[AVPlayer pause](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "pause");
    v3 = self->_moviePlayerViewController;
    self->_moviePlayerViewController = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[THWiOSExpandedMovieViewController teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)THWiOSExpandedMovieViewController;
  -[THWiOSExpandedMovieViewController dealloc](&v3, "dealloc");
}

- (void)teardown
{
  NSObject *dispatchQueue;

  -[BCAudioMuxingCoordinator removeAudioMuxingObserver:](+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"), "removeAudioMuxingObserver:", self);
  -[THWiOSExpandedMovieViewController setPresentCompletionBlock:](self, "setPresentCompletionBlock:", 0);

  self->_animationController = 0;
  -[THWiOSExpandedMovieViewController p_unloadMoviePlayer](self, "p_unloadMoviePlayer");
  -[THWiOSExpandedMovieAnimationDelegate setMovieViewController:](self->_animationDelegate, "setMovieViewController:", 0);

  self->_animationDelegate = 0;
  -[THWFreeTransformController setDelegate:](self->_freeTransformController, "setDelegate:", 0);
  -[THWFreeTransformController setTransformGR:](self->_freeTransformController, "setTransformGR:", 0);
  -[THWFreeTransformController setTargetLayer:](self->_freeTransformController, "setTargetLayer:", 0);

  self->_freeTransformController = 0;
  -[THWFreeTransformGestureRecognizer setFreeTransformDelegate:](self->_freeTransformGestureRecognizer, "setFreeTransformDelegate:", 0);

  self->_freeTransformGestureRecognizer = 0;
  self->_documentRoot = 0;

  self->_rootBackgroundColor = 0;
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_release(dispatchQueue);
    self->_dispatchQueue = 0;
  }
  -[THWiOSExpandedMovieViewController setMoviePosterView:](self, "setMoviePosterView:", 0);
}

- (id)expandedRepSourceRep
{
  return -[THWExpandedViewControllerDelegate expandableRepForInfo:](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "expandableRepForInfo:", -[THWiOSExpandedMovieViewController movieInfo](self, "movieInfo"));
}

- (BOOL)shouldAutorotate
{
  return -[THWiOSExpandedMovieViewController expandedRepControllerState](self, "expandedRepControllerState") == 2;
}

- (void)p_setupFreeTransformController
{
  if (!-[THWiOSExpandedMovieViewController freeTransformController](self, "freeTransformController"))
  {
    -[THWiOSExpandedMovieViewController setFreeTransformController:](self, "setFreeTransformController:", objc_alloc_init(THWFreeTransformController));
    -[THWFreeTransformController setDelegate:](-[THWiOSExpandedMovieViewController freeTransformController](self, "freeTransformController"), "setDelegate:", self);
    -[THWFreeTransformController setTransformGR:](-[THWiOSExpandedMovieViewController freeTransformController](self, "freeTransformController"), "setTransformGR:", -[THWiOSExpandedMovieViewController freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"));
    -[THWFreeTransformController setTargetLayer:](-[THWiOSExpandedMovieViewController freeTransformController](self, "freeTransformController"), "setTargetLayer:", -[THWiOSExpandedMovieAnimationDelegate animationLayer](self->_animationDelegate, "animationLayer"));
    -[THWFreeTransformController setScaleThreshold:](-[THWiOSExpandedMovieViewController freeTransformController](self, "freeTransformController"), "setScaleThreshold:", 0.75);
  }
}

- (void)handleGesture:(id)a3
{
  if (-[THWiOSExpandedMovieViewController freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer") == a3)
  {
    -[THWiOSExpandedMovieViewController p_setupFreeTransformController](self, "p_setupFreeTransformController");
    -[THWFreeTransformController transformGRChanged:](-[THWiOSExpandedMovieViewController freeTransformController](self, "freeTransformController"), "transformGRChanged:", -[THWiOSExpandedMovieViewController freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"));
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  char v8;
  unsigned __int8 v9;
  _QWORD v10[8];
  char v11;
  _QWORD v12[8];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  CGAffineTransform v18;
  objc_super v19;

  height = a3.height;
  width = a3.width;
  v19.receiver = self;
  v19.super_class = (Class)THWiOSExpandedMovieViewController;
  -[THWiOSExpandedMovieViewController viewWillTransitionToSize:withTransitionCoordinator:](&v19, "viewWillTransitionToSize:withTransitionCoordinator:");
  if (a4)
  {
    objc_msgSend(a4, "targetTransform");
    if (CGAffineTransformIsIdentity(&v18))
    {
      -[THWiOSExpandedMovieViewController bookViewWillTransitionToSize:withTransitionCoordinator:](self, "bookViewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
      v8 = 0;
    }
    else
    {
      -[THWiOSExpandedMovieViewController bookViewWillRotateTransitionToSize:withTransitionCoordinator:](self, "bookViewWillRotateTransitionToSize:withTransitionCoordinator:", a4, width, height);
      v8 = 1;
    }
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_126E84;
    v12[3] = &unk_4273F0;
    v13 = v8;
    v12[4] = self;
    v12[5] = &v14;
    *(double *)&v12[6] = width;
    *(double *)&v12[7] = height;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_126EB4;
    v10[3] = &unk_4273F0;
    v11 = v8;
    v10[4] = self;
    v10[5] = &v14;
    *(double *)&v10[6] = width;
    *(double *)&v10[7] = height;
    v9 = objc_msgSend(a4, "animateAlongsideTransition:completion:", v12, v10);
    *((_BYTE *)v15 + 24) = v9;
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    -[THWiOSExpandedMovieViewController bookViewWillTransitionToSize:withTransitionCoordinator:](self, "bookViewWillTransitionToSize:withTransitionCoordinator:", 0, width, height);
    -[THWiOSExpandedMovieViewController bookViewDidTransitionToSize:withContext:](self, "bookViewDidTransitionToSize:withContext:", 0, width, height);
  }
}

- (void)bookViewWillRotateTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGRect v17;
  CGRect v18;

  -[THWiOSExpandedMovieViewController setRotationScrim:](self, "setRotationScrim:", +[CALayer layer](CALayer, "layer", a4, a3.width, a3.height));
  -[CALayer setBackgroundColor:](-[THWiOSExpandedMovieViewController rotationScrim](self, "rotationScrim"), "setBackgroundColor:", -[UIColor CGColor](+[UIColor blackColor](UIColor, "blackColor"), "CGColor"));
  objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "bounds");
  v14 = v13 * -0.707;
  objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "bounds");
  v16 = v15 * -0.707;
  v17.origin.x = v6;
  v17.origin.y = v8;
  v17.size.width = v10;
  v17.size.height = v12;
  v18 = CGRectInset(v17, v14, v16);
  -[CALayer setFrame:](-[THWiOSExpandedMovieViewController rotationScrim](self, "rotationScrim"), "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  -[CALayer setZPosition:](-[THWiOSExpandedMovieViewController rotationScrim](self, "rotationScrim"), "setZPosition:", -32000.0);
  objc_msgSend(objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "layer"), "addSublayer:", -[THWiOSExpandedMovieViewController rotationScrim](self, "rotationScrim"));
}

- (void)bookViewDidAnimateRotationToSize:(CGSize)a3 withContext:(id)a4
{
  -[CALayer removeFromSuperlayer](-[THWiOSExpandedMovieViewController rotationScrim](self, "rotationScrim", a4, a3.width, a3.height), "removeFromSuperlayer");
  -[THWiOSExpandedMovieViewController setRotationScrim:](self, "setRotationScrim:", 0);
}

- (void)pauseAndDismissMoviePlayer
{
  -[AVPlayer pause](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "pause");
  -[AVPlayerViewController setShowsPlaybackControls:](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "setShowsPlaybackControls:", 0);
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  -[THWiOSExpandedMovieViewController pauseAndDismissMoviePlayer](self, "pauseAndDismissMoviePlayer", a3, a4);
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  -[AVPlayer play](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController", a3, a4), "player"), "play");
}

- (void)animationControllerWillPresent:(id)a3
{
  unsigned __int8 v4;
  THWExpandedViewControllerDelegate *v5;

  v4 = -[THWiOSExpandedMovieViewController isDismissing](self, "isDismissing", a3);
  v5 = -[THWiOSExpandedMovieViewController delegate](self, "delegate");
  if ((v4 & 1) != 0)
  {
    -[THWExpandedViewControllerDelegate expandedViewControllerWillDismiss:](v5, "expandedViewControllerWillDismiss:", self);
  }
  else
  {
    -[THWExpandedViewControllerDelegate expandedViewControllerWillPresent:](v5, "expandedViewControllerWillPresent:", self);
    -[THWiOSExpandedMovieViewController p_setMoviePlayerBackgroundColor:animated:](self, "p_setMoviePlayerBackgroundColor:animated:", objc_msgSend(-[THWiOSExpandedMovieViewController p_curtainColor](self, "p_curtainColor"), "UIColor"), 1);
  }
}

- (void)p_completeDismiss
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  THWiOSExpandedMovieViewController *v7;

  -[THWiOSExpandedMovieViewController p_removePlaybackNotifications](self, "p_removePlaybackNotifications");
  v3 = objc_opt_class(THWIOSMovieRep);
  *(_QWORD *)&v5 = TSUDynamicCast(v3, -[THWiOSExpandedMovieViewController expandedRepSourceRep](self, "expandedRepSourceRep")).n128_u64[0];
  v6 = v4;
  if (!v4
    || objc_msgSend(v4, "moviePlayerViewController", v5)
    || (objc_msgSend(v6, "wantsFullscreenOnlyDisplay") & 1) != 0)
  {
    -[AVPlayer pause](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController", v5), "player"), "pause");
    objc_msgSend(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"), "removeFromSuperview");
  }
  else
  {
    -[AVPlayerViewController removeFromParentViewController](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "removeFromParentViewController");
    objc_msgSend(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"), "removeFromSuperview");
    objc_msgSend(v6, "setMoviePlayerViewController:", -[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"));

    self->_moviePlayerViewController = 0;
  }
  if ((objc_opt_respondsToSelector(v6, "expandableExpandedPresentationDidEnd") & 1) != 0)
    objc_msgSend(v6, "expandableExpandedPresentationDidEnd");
  -[THWiOSExpandedMovieViewController removeFromParentViewController](self, "removeFromParentViewController");
  objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "removeFromSuperview");
  objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview"), "setBackgroundColor:", -[THWiOSExpandedMovieViewController rootBackgroundColor](self, "rootBackgroundColor"));
  v7 = self;
  -[THWExpandedViewControllerDelegate expandedViewControllerDidDismiss:](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "expandedViewControllerDidDismiss:", self);
}

- (void)animationControllerDidPresent:(id)a3
{
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (-[THWiOSExpandedMovieViewController isDismissing](self, "isDismissing", a3))
  {
    -[THWiOSExpandedMovieViewController p_completeDismiss](self, "p_completeDismiss");
  }
  else
  {
    -[THWExpandedViewControllerDelegate expandedViewControllerDidPresent:](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "expandedViewControllerDidPresent:", self);
    v4 = objc_opt_class(THWIOSMovieRep);
    *(_QWORD *)&v5 = TSUDynamicCast(v4, -[THWiOSExpandedMovieViewController expandedRepSourceRep](self, "expandedRepSourceRep")).n128_u64[0];
    v7 = v6;
    if (objc_msgSend(v6, "moviePlayerViewController", v5))
    {
      -[THWiOSExpandedMovieViewController setMoviePlayerViewController:](self, "setMoviePlayerViewController:", objc_msgSend(v7, "moviePlayerViewController"));
      objc_msgSend(v7, "setMoviePlayerViewController:", 0);
      objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "bounds");
      objc_msgSend(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"), "setFrame:", v8, v9, v10, v11);
      objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "addSubview:", -[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"));
      -[THWiOSExpandedMovieViewController addChildViewController:](self, "addChildViewController:", -[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"));
      -[THWiOSExpandedMovieViewController p_setupPlaybackNotifications](self, "p_setupPlaybackNotifications");
      objc_msgSend(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"), "setAutoresizingMask:", 18);
      -[AVPlayerViewController setShowsPlaybackControls:](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "setShowsPlaybackControls:", 1);
      -[THWiOSExpandedMovieViewController p_setMoviePlayerBackgroundColor:animated:](self, "p_setMoviePlayerBackgroundColor:animated:", objc_msgSend(-[THWiOSExpandedMovieViewController p_curtainColor](self, "p_curtainColor"), "UIColor"), 0);
    }
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self);
    objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "setNeedsUpdateConstraints");
  }
}

- (void)animationControllerDidPresentPostCommit:(id)a3
{
  uint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  -[THWiOSExpandedMovieViewController setIsDismissing:](self, "setIsDismissing:", 0);
  if (-[THWiOSExpandedMovieViewController expandedRepControllerState](self, "expandedRepControllerState") == 1)
  {
    v5 = 2;
  }
  else
  {
    if (-[THWiOSExpandedMovieViewController expandedRepControllerState](self, "expandedRepControllerState") != 3)
      goto LABEL_6;
    v5 = 4;
  }
  -[THWiOSExpandedMovieViewController setExpandedRepControllerState:](self, "setExpandedRepControllerState:", v5);
LABEL_6:
  objc_msgSend(a3, "removeObserver:", self);
  if (-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"))
  {
    objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview"), "bounds");
    v40.origin.x = v14;
    v40.origin.y = v15;
    v40.size.width = v16;
    v40.size.height = v17;
    v38.origin.x = v7;
    v38.origin.y = v9;
    v38.size.width = v11;
    v38.size.height = v13;
    if (!CGRectEqualToRect(v38, v40))
    {
      objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview"), "bounds");
      objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "setFrame:", v18, v19, v20, v21);
    }
    objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_msgSend(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"), "frame");
    v41.origin.x = v30;
    v41.origin.y = v31;
    v41.size.width = v32;
    v41.size.height = v33;
    v39.origin.x = v23;
    v39.origin.y = v25;
    v39.size.width = v27;
    v39.size.height = v29;
    if (!CGRectEqualToRect(v39, v41))
    {
      objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "bounds");
      objc_msgSend(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"), "setFrame:", v34, v35, v36, v37);
    }
  }
  objc_msgSend(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"), "setAutoresizingMask:", 18);
}

- (void)p_moviePlayerPlaybackDidFinish:(id)a3
{
  AVPlayerItem *v5;
  unsigned int v6;
  char *v7;
  char *v8;
  AVPlayer *v9;
  AVPlayerViewController *v10;
  AVPlayer *v11;
  __int128 v12;
  CMTimeEpoch epoch;

  v5 = (AVPlayerItem *)objc_msgSend(a3, "object");
  if (v5 == -[AVPlayer currentItem](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "currentItem")&& objc_msgSend(objc_msgSend(a3, "name"), "isEqualToString:", AVPlayerItemDidPlayToEndTimeNotification))
  {
    v6 = -[THWFreeTransformController isFreeTransformInProgress](-[THWiOSExpandedMovieViewController freeTransformController](self, "freeTransformController"), "isFreeTransformInProgress");
    v7 = (char *)-[THWMovieInfo loopOption](-[THWiOSExpandedMovieViewController movieInfo](self, "movieInfo"), "loopOption");
    v8 = v7;
    if (v6)
    {
      if (!v7)
      {
        v9 = -[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "player");
        v12 = *(_OWORD *)&kCMTimeZero.value;
        epoch = kCMTimeZero.epoch;
        -[AVPlayer seekToTime:](v9, "seekToTime:", &v12);
        -[AVPlayer pause](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "pause");
      }
    }
    else
    {
      v10 = -[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController");
      if (v8 == (_BYTE *)&dword_0 + 1)
      {
        v11 = -[AVPlayerViewController player](v10, "player");
        v12 = *(_OWORD *)&kCMTimeZero.value;
        epoch = kCMTimeZero.epoch;
        -[AVPlayer seekToTime:](v11, "seekToTime:", &v12);
        -[AVPlayer play](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "play");
      }
      else
      {
        -[AVPlayerViewController setShowsPlaybackControls:](v10, "setShowsPlaybackControls:", 0);
        -[THWiOSExpandedMovieViewController dismissExpandedAnimatedWithCompletionBlock:](self, "dismissExpandedAnimatedWithCompletionBlock:", 0);
      }
    }
  }
}

- (void)p_addViewToRoot
{
  id v3;
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _OWORD v13[3];

  if (!-[THWiOSExpandedMovieViewController view](self, "view"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedMovieViewController p_addViewToRoot]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Movie/THWiOSExpandedMovieViewController.m"), 548, CFSTR("invalid nil value for '%s'"), "self.view");
  v3 = -[THWiOSExpandedMovieViewController view](self, "view");
  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v13[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v13[1] = v4;
  v13[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v3, "setTransform:", v13);
  objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview"), "bounds");
  objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "setFrame:", v5, v6, v7, v8);
  objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview"), "addSubview:", -[THWiOSExpandedMovieViewController view](self, "view"));
  objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperviewController](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperviewController"), "addChildViewController:", self);
  -[THWiOSExpandedMovieViewController setRootBackgroundColor:](self, "setRootBackgroundColor:", objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview"), "backgroundColor"));
  if (!-[THWiOSExpandedMovieViewController isFSOMovie](self, "isFSOMovie"))
    objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview"), "setBackgroundColor:", +[UIColor blackColor](UIColor, "blackColor"));
  if (-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"))
  {
    objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "bounds");
    objc_msgSend(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"), "setFrame:", v9, v10, v11, v12);
    objc_msgSend(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"), "setAutoresizingMask:", 18);
    objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "addSubview:", -[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"));
    if (-[THWiOSExpandedMovieViewController isFSOMovie](self, "isFSOMovie"))
      -[AVPlayerViewController setShowsPlaybackControls:](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "setShowsPlaybackControls:", 0);
  }
  objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "layoutIfNeeded");
}

- (void)p_setupFTC
{
  -[THWiOSExpandedMovieViewController setFreeTransformGestureRecognizer:](self, "setFreeTransformGestureRecognizer:", -[THWFreeTransformGestureRecognizer initWithTarget:action:]([THWFreeTransformGestureRecognizer alloc], "initWithTarget:action:", self, "handleGesture:"));
  objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "addGestureRecognizer:", -[THWiOSExpandedMovieViewController freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"));
  -[THWFreeTransformGestureRecognizer setUnmovingParentView:](-[THWiOSExpandedMovieViewController freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"), "setUnmovingParentView:", -[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview"));
  -[THWFreeTransformGestureRecognizer setFreeTransformDelegate:](-[THWiOSExpandedMovieViewController freeTransformGestureRecognizer](self, "freeTransformGestureRecognizer"), "setFreeTransformDelegate:", self);
}

- (void)animationControllerSetupTarget:(id)a3
{
  if (!-[THWiOSExpandedMovieViewController isDismissing](self, "isDismissing", a3))
    objc_msgSend(-[AVPlayerViewController view](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"), "setAlpha:", 1.0);
}

- (BOOL)animationControllerSetsDestination:(id)a3
{
  return 1;
}

- (id)animationControllerForDismissedController:(id)a3
{
  -[THWExpandedViewControllerDelegate expandedViewControllerDidDismiss:](-[THWiOSExpandedMovieViewController delegate](self, "delegate", a3), "expandedViewControllerDidDismiss:", self);
  return 0;
}

- (void)presentExpandedAnimatedWithCompletionBlock:(id)a3
{
  -[AVPlayerViewController setTransitioningDelegate:](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "setTransitioningDelegate:", self);
  -[AVPlayer play](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "play");
  -[THWiOSExpandedMovieViewController presentViewController:withTransition:completion:](self, "presentViewController:withTransition:completion:", -[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), 1, a3);
}

- (void)dismissExpandedAnimatedWithCompletionBlock:(id)a3
{
  AVPlayerViewController *v5;

  v5 = (AVPlayerViewController *)-[THWiOSExpandedMovieViewController presentedViewController](self, "presentedViewController");
  if (v5 == -[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"))
  {
    -[AVPlayerViewController dismissViewControllerAnimated:completion:](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "dismissViewControllerAnimated:completion:", 1, a3);
  }
  else if (a3)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)p_dismissExpandedImmediateWithCompletionBlock:(id)a3
{
  if (!-[THWiOSExpandedMovieViewController isDismissing](self, "isDismissing"))
  {
    -[THWiOSExpandedMovieViewController setIsDismissing:](self, "setIsDismissing:", 1);
    -[THWiOSExpandedMovieViewController setExpandedRepControllerState:](self, "setExpandedRepControllerState:", 3);
    -[THWiOSExpandedMovieViewController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
    -[THWExpandedViewControllerDelegate expandedViewControllerWillDismiss:](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "expandedViewControllerWillDismiss:", self);
    -[THWiOSExpandedMovieViewController setNeedsWhitePointAdaptivityStyleUpdate](self, "setNeedsWhitePointAdaptivityStyleUpdate");
    if (a3)
      (*((void (**)(id))a3 + 2))(a3);
    -[THWiOSExpandedMovieViewController p_completeDismiss](self, "p_completeDismiss");
    -[THWiOSExpandedMovieViewController setIsDismissing:](self, "setIsDismissing:", 0);
    -[THWiOSExpandedMovieViewController setExpandedRepControllerState:](self, "setExpandedRepControllerState:", 4);
  }
}

- (void)p_dismissExpandedAnimatedWithCompletionBlock:(id)a3 freeTransformDidEnd:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a4;
  if (!-[THWiOSExpandedMovieViewController isDismissing](self, "isDismissing"))
  {
    -[THWiOSExpandedMovieViewController setIsDismissing:](self, "setIsDismissing:", 1);
    -[THWiOSExpandedMovieViewController setExpandedRepControllerState:](self, "setExpandedRepControllerState:", 3);
    -[THWiOSExpandedMovieViewController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
    v7 = -[THWiOSExpandedMovieViewController expandedRepSourceRep](self, "expandedRepSourceRep");
    v8 = v7;
    if (v4)
    {
      v9 = 0;
      v10 = 0;
    }
    else
    {
      v10 = objc_msgSend(objc_msgSend(objc_msgSend(v7, "hostICC"), "layerHost"), "canvasLayer");
      v9 = objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view"), "layer");
      -[THWiOSExpandedMovieViewController p_setMoviePlayerBackgroundColor:animated:](self, "p_setMoviePlayerBackgroundColor:animated:", +[UIColor clearColor](UIColor, "clearColor"), 0);
    }
    -[THWiOSExpandedMovieViewController setAnimationController:](self, "setAnimationController:", objc_alloc_init(THAnimationController));
    v11 = TSUProtocolCast(&OBJC_PROTOCOL___THAnimatableDestination, v8);
    -[THAnimationController setSource:](-[THWiOSExpandedMovieViewController animationController](self, "animationController"), "setSource:", self->_animationDelegate);
    -[THAnimationController setDestination:](-[THWiOSExpandedMovieViewController animationController](self, "animationController"), "setDestination:", v11);
    -[THAnimationController setHostLayer:](-[THWiOSExpandedMovieViewController animationController](self, "animationController"), "setHostLayer:", objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview"), "layer"));
    -[THAnimationController setForegroundLayer:](-[THWiOSExpandedMovieViewController animationController](self, "animationController"), "setForegroundLayer:", v10);
    -[THAnimationController setBackgroundLayer:](-[THWiOSExpandedMovieViewController animationController](self, "animationController"), "setBackgroundLayer:", v9);
    -[THAnimationController addObserver:](-[THWiOSExpandedMovieViewController animationController](self, "animationController"), "addObserver:", self);
    -[THAnimationController presentAnimationWithCompletionBlock:overshoot:](-[THWiOSExpandedMovieViewController animationController](self, "animationController", _NSConcreteStackBlock, 3221225472, sub_127D50, &unk_426E78, self, a3), "presentAnimationWithCompletionBlock:overshoot:", &v12, v4);
  }
}

- (void)dismissExpandedImmediate
{
  -[THWiOSExpandedMovieViewController dismissExpandedAnimatedWithCompletionBlock:](self, "dismissExpandedAnimatedWithCompletionBlock:", 0);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)isZoomed
{
  return 0;
}

- (BOOL)expandedRepControllerHasRoomForPanels
{
  return 0;
}

- (BOOL)freeTransformControllerWantsCurtainFadeOut:(id)a3
{
  return 1;
}

- (CGSize)curtainSizeForFreeTransformController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(-[THWiOSExpandedMovieViewController view](self, "view", a3), "frame");
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)freeTransformControllerDidBegin:(id)a3
{
  -[THWiOSExpandedMovieViewController p_setMoviePlayerBackgroundColor:animated:](self, "p_setMoviePlayerBackgroundColor:animated:", +[UIColor clearColor](UIColor, "clearColor", a3), 1);
  -[AVPlayerViewController setVideoGravity:](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "setVideoGravity:", AVLayerVideoGravityResizeAspect);
  -[AVPlayerViewController setShowsPlaybackControls:](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController"), "setShowsPlaybackControls:", 0);
}

- (void)p_setMoviePlayerBackgroundColor:(id)a3 animated:(BOOL)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_127ED8;
  v4[3] = &unk_426E28;
  v4[4] = self;
  v4[5] = a3;
  if (a4)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.25);
  else
    sub_127ED8((uint64_t)v4);
}

- (id)p_curtainColor
{
  return +[TSUColor blackColor](TSUColor, "blackColor");
}

- (CGRect)freeTransformControllerRectForCompletionAnimation:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(objc_msgSend(-[THWiOSExpandedMovieViewController expandedRepSourceRep](self, "expandedRepSourceRep", a3), "layout"), "frameInParent");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)freeTransformControllerDidFinishFreeTransforming:(id)a3 passedThreshold:(BOOL)a4 completionBlock:(id)a5
{
  uint64_t v8;
  _QWORD v9[6];
  _QWORD v10[6];

  if (a4 || objc_msgSend(objc_msgSend(a3, "transformGR"), "state") == &dword_4)
  {
    -[THWExpandedViewControllerDelegate expandedViewControllerWillBeginDismissing:](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "expandedViewControllerWillBeginDismissing:", self);
    if (objc_msgSend(objc_msgSend(a3, "transformGR"), "state") == &dword_4)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1281C0;
      v10[3] = &unk_426E78;
      v10[4] = self;
      v10[5] = a5;
      -[THWiOSExpandedMovieViewController p_dismissExpandedImmediateWithCompletionBlock:](self, "p_dismissExpandedImmediateWithCompletionBlock:", v10);
    }
    else
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_128214;
      v9[3] = &unk_426E78;
      v9[4] = self;
      v9[5] = a5;
      -[THWiOSExpandedMovieViewController p_dismissExpandedAnimatedWithCompletionBlock:freeTransformDidEnd:](self, "p_dismissExpandedAnimatedWithCompletionBlock:freeTransformDidEnd:", v9, 1);
    }
  }
  else
  {
    -[THWiOSExpandedMovieViewController p_setMoviePlayerBackgroundColor:animated:](self, "p_setMoviePlayerBackgroundColor:animated:", objc_msgSend(-[THWiOSExpandedMovieViewController p_curtainColor](self, "p_curtainColor"), "UIColor"), 1);
    -[THWiOSExpandedMovieViewController setAnimationController:](self, "setAnimationController:", objc_alloc_init(THAnimationController));
    -[THAnimationController setSource:](-[THWiOSExpandedMovieViewController animationController](self, "animationController"), "setSource:", self->_animationDelegate);
    -[THAnimationController setDestination:](-[THWiOSExpandedMovieViewController animationController](self, "animationController"), "setDestination:", self->_animationDelegate);
    -[THAnimationController setHostLayer:](-[THWiOSExpandedMovieViewController animationController](self, "animationController"), "setHostLayer:", objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate"), "rootSuperview"), "layer"));
    -[THAnimationController presentAnimationWithCompletionBlock:overshoot:](-[THWiOSExpandedMovieViewController animationController](self, "animationController", _NSConcreteStackBlock, 3221225472, sub_128268, &unk_426E78, self, a5), "presentAnimationWithCompletionBlock:overshoot:", &v8, 0);
  }
}

- (id)unmovingParentViewForFreeTransformController:(id)a3
{
  return -[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedMovieViewController delegate](self, "delegate", a3), "rootSuperview");
}

- ($A219A65C3B9F57E4A1EAB42BC6271E0A)shadowPropertiesForFreeTransformController:(SEL)a3 defaults:(id)a4
{
  return self;
}

- (BOOL)freeTransformControllerShouldMoveFreeTransformViewAboveStatusBar:(id)a3
{
  return 0;
}

- (BOOL)freeTransformGestureRecognizerShouldDelayRecognizeUntilScaleChange:(id)a3
{
  return 0;
}

- (BOOL)freeTransformGestureRecognizerShouldRubberband:(id)a3
{
  return 0;
}

- (BOOL)freeTransformGestureRecognizerShouldAllowPinchDown:(id)a3
{
  return 1;
}

- (BOOL)freeTransformGestureRecognizerShouldAllowPinchUp:(id)a3
{
  return 0;
}

- (id)hostCanvasLayer
{
  return 0;
}

- (id)curtainColorForFreeTransform
{
  return 0;
}

- (CGRect)rectForCompletionAnimationWithRep:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(objc_msgSend(-[THWiOSExpandedMovieViewController expandedRepSourceRep](self, "expandedRepSourceRep", a3), "layout"), "frameInParent");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)freeTransformDidBeginWithRep:(id)a3 expandableRep:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1283A4;
  v4[3] = &unk_426DD0;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, a4, 0.5);
}

- (void)animationController:(id)a3 updateWhitePointAdaptivtyStyleWithDuration:(double)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_128410;
  v4[3] = &unk_426DD0;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, a4);
}

- (void)audioPlaybackWillStart:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != self)
    -[AVPlayer pause](-[AVPlayerViewController player](-[THWiOSExpandedMovieViewController moviePlayerViewController](self, "moviePlayerViewController", v3, v4), "player"), "pause");
}

- (THWExpandedViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWExpandedViewControllerDelegate *)a3;
}

- (THDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (THWMovieInfo)movieInfo
{
  return self->_movieInfo;
}

- (void)setMovieInfo:(id)a3
{
  self->_movieInfo = (THWMovieInfo *)a3;
}

- (BOOL)presented
{
  return self->_presented;
}

- (void)setPresented:(BOOL)a3
{
  self->_presented = a3;
}

- (THAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (THWiOSExpandedMovieAnimationDelegate)animationDelegate
{
  return self->_animationDelegate;
}

- (void)setAnimationDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (AVPlayerViewController)moviePlayerViewController
{
  return self->_moviePlayerViewController;
}

- (void)setMoviePlayerViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)registeredForNotification
{
  return self->_registeredForNotification;
}

- (void)setRegisteredForNotification:(BOOL)a3
{
  self->_registeredForNotification = a3;
}

- (BOOL)isFSOMovie
{
  return self->_isFSOMovie;
}

- (void)setIsFSOMovie:(BOOL)a3
{
  self->_isFSOMovie = a3;
}

- (BOOL)receivedPreRoll
{
  return self->_receivedPreRoll;
}

- (void)setReceivedPreRoll:(BOOL)a3
{
  self->_receivedPreRoll = a3;
}

- (CALayer)rotationScrim
{
  return self->_rotationScrim;
}

- (void)setRotationScrim:(id)a3
{
  self->_rotationScrim = (CALayer *)a3;
}

- (int)expandedRepControllerState
{
  return self->_expandedRepControllerState;
}

- (void)setExpandedRepControllerState:(int)a3
{
  self->_expandedRepControllerState = a3;
}

- (THWFreeTransformController)freeTransformController
{
  return self->_freeTransformController;
}

- (void)setFreeTransformController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (THWFreeTransformGestureRecognizer)freeTransformGestureRecognizer
{
  return self->_freeTransformGestureRecognizer;
}

- (void)setFreeTransformGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (UIColor)rootBackgroundColor
{
  return self->_rootBackgroundColor;
}

- (void)setRootBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIImageView)moviePosterView
{
  return self->_moviePosterView;
}

- (void)setMoviePosterView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (id)presentCompletionBlock
{
  return self->_presentCompletionBlock;
}

- (void)setPresentCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
