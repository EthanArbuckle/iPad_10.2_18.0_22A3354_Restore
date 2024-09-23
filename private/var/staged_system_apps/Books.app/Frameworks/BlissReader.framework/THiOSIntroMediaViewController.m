@implementation THiOSIntroMediaViewController

- (THiOSIntroMediaViewController)initWithDocumentRoot:(id)a3
{
  THiOSIntroMediaViewController *v4;
  THWIntroMediaController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THiOSIntroMediaViewController;
  v4 = -[THiOSIntroMediaViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0, 0);
  if (v4)
  {
    v5 = -[THWIntroMediaController initWithDocumentRoot:]([THWIntroMediaController alloc], "initWithDocumentRoot:", a3);
    v4->_introMediaController = v5;
    if (v5)
    {
      -[THWIntroMediaController setDelegate:](v5, "setDelegate:", v4);
      -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v4, "didBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);
      -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v4, "willResignActive:", UIApplicationWillResignActiveNotification, 0);
      -[BCAudioMuxingCoordinator addAudioMuxingObserver:](+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"), "addAudioMuxingObserver:", v4);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[BCAudioMuxingCoordinator removeAudioMuxingObserver:](+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"), "removeAudioMuxingObserver:", self);
  -[THiOSIntroMediaViewController p_removePlaybackNotifications](self, "p_removePlaybackNotifications");
  -[THiOSIntroMediaViewController p_releaseOutlets](self, "p_releaseOutlets");
  -[THiOSIntroMediaViewController p_cancelUIFadeOutTimer](self, "p_cancelUIFadeOutTimer");
  -[THWIntroMediaController setDelegate:](self->_introMediaController, "setDelegate:", 0);

  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)THiOSIntroMediaViewController;
  -[THiOSIntroMediaViewController dealloc](&v3, "dealloc");
}

- (void)p_releaseOutlets
{
  -[THiOSIntroMediaViewController p_unloadMoviePlayer](self, "p_unloadMoviePlayer");
  objc_msgSend(-[UITapGestureRecognizer view](self->mTapGesture, "view"), "removeGestureRecognizer:", self->mTapGesture);
  -[UITapGestureRecognizer setDelegate:](self->mTapGesture, "setDelegate:", 0);

  self->mTapGesture = 0;
  -[THiOSIntroMediaViewController setImage:](self, "setImage:", 0);
  -[UIButton removeFromSuperview](-[THiOSIntroMediaViewController closeButton](self, "closeButton"), "removeFromSuperview");
  -[THiOSIntroMediaViewController setCloseButton:](self, "setCloseButton:", 0);
  -[THiOSIntroMediaViewController setDelegate:](self, "setDelegate:", 0);
  -[THiOSIntroMediaViewController setScrimView:](self, "setScrimView:", 0);
}

- (BOOL)prefersStatusBarHidden
{
  if (-[THWIntroMediaController isMovie](self->_introMediaController, "isMovie"))
    return 1;
  else
    return -[THiOSIntroMediaViewController controlsHidden](self, "controlsHidden");
}

- (int64_t)preferredStatusBarStyle
{
  return -[THWIntroMediaController isMovie](self->_introMediaController, "isMovie") ^ 1;
}

- (BOOL)p_isImage
{
  return !-[THWIntroMediaController isMovie](self->_introMediaController, "isMovie");
}

- (void)loadView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  THiOSIntroMediaView *v11;
  double v12;
  id v13;
  PFDContext *v14;
  UIImage *v15;
  id v16;
  UIButton *v17;
  UITapGestureRecognizer *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)THiOSIntroMediaViewController;
  -[THiOSIntroMediaViewController loadView](&v19, "loadView");
  objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[THiOSIntroMediaView initWithFrame:]([THiOSIntroMediaView alloc], "initWithFrame:", v3, v5, v7, v9);
  -[THiOSIntroMediaView setClipsToBounds:](v11, "setClipsToBounds:", 0);
  -[THiOSIntroMediaViewController setView:](self, "setView:", v11);
  objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "setAutoresizingMask:", 18);
  objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "setContentMode:", 1);
  -[THiOSIntroMediaViewController setMovieIsInAspectFitMode:](self, "setMovieIsInAspectFitMode:", 1);
  objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "setUserInteractionEnabled:", 1);

  if (v8 >= v10)
    v12 = v8;
  else
    v12 = v10;
  v13 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v4, v6, v12 * 1.42, v12 * 1.42);
  objc_msgSend(v13, "setBackgroundColor:", +[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "addSubview:", v13);
  objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "center");
  objc_msgSend(v13, "setCenter:");
  -[THiOSIntroMediaViewController setScrimView:](self, "setScrimView:", v13);

  if (!-[THWIntroMediaController isMovie](self->_introMediaController, "isMovie"))
  {
    v14 = -[THBookDescription drmContext](-[THDocumentRoot bookDescription](-[THWIntroMediaController documentRoot](self->_introMediaController, "documentRoot"), "bookDescription"), "drmContext");
    if (v14)
      v15 = +[UIImage imageWithData:](UIImage, "imageWithData:", -[PFDContext dataWithContentsOfFile:error:](v14, "dataWithContentsOfFile:error:", -[NSURL path](-[THWIntroMediaController url](self->_introMediaController, "url"), "path"), 0));
    else
      v15 = +[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", -[NSURL path](-[THWIntroMediaController url](self->_introMediaController, "url"), "path"));
    -[THiOSIntroMediaViewController setImage:](self, "setImage:", v15);
    objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "setBackgroundColor:", +[UIColor blackColor](UIColor, "blackColor"));
    v16 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", -[THiOSIntroMediaViewController image](self, "image"));
    objc_msgSend(v16, "setContentMode:", 1);
    objc_msgSend(v16, "setAutoresizingMask:", 18);
    objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "frame");
    objc_msgSend(v16, "setFrame:");
    objc_msgSend(v16, "setUserInteractionEnabled:", 0);
    objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "addSubview:", v16);

    v17 = +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
    -[UIButton setAdjustsImageWhenHighlighted:](v17, "setAdjustsImageWhenHighlighted:", 1);
    -[UIButton addTarget:action:forControlEvents:](v17, "addTarget:action:forControlEvents:", self, "p_nextPage", 64);
    -[UIButton setImage:forState:](v17, "setImage:forState:", +[UIImage th_imageNamed:](UIImage, "th_imageNamed:", CFSTR("ib_media_close-N")), 0);
    -[UIButton sizeToFit](v17, "sizeToFit");
    -[UIButton setAlpha:](v17, "setAlpha:", 0.0);
    -[THiOSIntroMediaViewController setCloseButton:](self, "setCloseButton:", v17);
    objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "addSubview:", -[THiOSIntroMediaViewController closeButton](self, "closeButton"));
    v18 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "introMediaControllerShouldToggleControls");
    self->mTapGesture = v18;
    -[UITapGestureRecognizer setDelegate:](v18, "setDelegate:", self);
    objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "addGestureRecognizer:", self->mTapGesture);
  }
}

- (void)didBecomeActive:(id)a3
{
  self->mIsResignedActive = 0;
}

- (void)willResignActive:(id)a3
{
  self->mIsResignedActive = 1;
  if (-[THiOSIntroMediaViewController isPlaying](self, "isPlaying", a3))
  {
    -[THiOSIntroMediaViewController pause](self, "pause");
  }
  else if (-[THiOSIntroMediaViewControllerDelegate introMediaControllerIsOffscreen](-[THiOSIntroMediaViewController delegate](self, "delegate"), "introMediaControllerIsOffscreen"))
  {
    self->mMovieNeedsUnloading = 1;
    -[THiOSIntroMediaViewController p_unloadMoviePlayer](self, "p_unloadMoviePlayer");
  }
}

- (void)p_unloadMoviePlayer
{
  AVPlayerViewController *v3;

  -[THiOSIntroMediaViewController p_removePlaybackNotifications](self, "p_removePlaybackNotifications");
  -[AVPlayer pause](-[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "pause");
  if (-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"))
  {
    v3 = self->_moviePlayerViewController;
    self->_moviePlayerViewController = 0;
    -[THiOSIntroMediaViewController setMoviePlayerControllerIsLoaded:](self, "setMoviePlayerControllerIsLoaded:", 0);
  }
}

- (void)p_updateSetShowsDoneButton
{
  id v2;

  v2 = -[AVPlayerViewController childViewControllerForStatusBarHidden](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "childViewControllerForStatusBarHidden");
  if ((objc_opt_respondsToSelector(v2, "setShowsDoneButton:") & 1) != 0)
    objc_msgSend(v2, "setShowsDoneButton:", 1);
}

- (void)p_resetMoviePlayer
{
  id v3;
  PFDContext *v4;
  __int128 v5;
  CMTimeEpoch epoch;

  if (!-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"))
  {
    self->mMovieNeedsUnloading = 0;
    v3 = objc_msgSend(objc_alloc((Class)AVPlayer), "initWithPlayerItem:", +[AVPlayerItem playerItemWithURL:](AVPlayerItem, "playerItemWithURL:", -[THWIntroMediaController url](self->_introMediaController, "url")));
    v4 = -[THBookDescription drmContext](-[THDocumentRoot bookDescription](-[THWIntroMediaController documentRoot](self->_introMediaController, "documentRoot"), "bookDescription"), "drmContext");
    objc_msgSend(v3, "setAllowsExternalPlayback:", -[PFDContext kiUanAfQBD5qIUraolUj](v4, "kiUanAfQBD5qIUraolUj") ^ 1);
    if (-[PFDContext kiUanAfQBD5qIUraolUj](v4, "kiUanAfQBD5qIUraolUj"))
      -[PFDContext authorizeAVPlayerItemForPlayback:](v4, "authorizeAVPlayerItemForPlayback:", objc_msgSend(v3, "currentItem"));
    v5 = *(_OWORD *)&kCMTimeZero.value;
    epoch = kCMTimeZero.epoch;
    objc_msgSend(v3, "seekToTime:", &v5);
    self->_moviePlayerViewController = (AVPlayerViewController *)objc_alloc_init((Class)AVPlayerViewController);
    -[AVPlayerViewController setAllowsPictureInPicturePlayback:](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "setAllowsPictureInPicturePlayback:", 0);
    -[AVPlayerViewController setDelegate:](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "setDelegate:", self);
    -[AVPlayerViewController setPlayer:](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "setPlayer:", v3);

    -[THiOSIntroMediaViewController p_setupPlaybackNotifications](self, "p_setupPlaybackNotifications");
    -[THiOSIntroMediaViewController setMoviePlayerControllerIsLoaded:](self, "setMoviePlayerControllerIsLoaded:", 0);
    -[THiOSIntroMediaViewController setMoviePlayerControllerIsShowing:](self, "setMoviePlayerControllerIsShowing:", 0);
  }
  if (!-[THiOSIntroMediaViewController moviePlayerControllerIsShowing](self, "moviePlayerControllerIsShowing"))
  {
    if (!-[THiOSIntroMediaViewController parentViewController](self, "parentViewController"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSIntroMediaViewController p_resetMoviePlayer]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THiOSIntroMediaViewController.m"), 291, CFSTR("invalid nil value for '%s'"), "self.parentViewController");
    -[AVPlayerViewController setShowsPlaybackControls:](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "setShowsPlaybackControls:", 1);
    -[THiOSIntroMediaViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", -[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), 1, 0);
    -[THiOSIntroMediaViewController setMoviePlayerControllerIsShowing:](self, "setMoviePlayerControllerIsShowing:", 1);
  }
}

- (void)p_setupPlaybackNotifications
{
  AVPlayer *v3;

  objc_sync_enter(self);
  if (!-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSIntroMediaViewController p_setupPlaybackNotifications]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THiOSIntroMediaViewController.m"), 302, CFSTR("invalid nil value for '%s'"), "self.moviePlayerViewController");
  if (-[AVPlayer currentItem](-[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "currentItem")&& !-[THiOSIntroMediaViewController registeredForNotification](self, "registeredForNotification"))
  {
    v3 = -[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player");
    -[AVPlayer addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, off_53DE38);
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "p_playerDidPlayToEnd:", AVPlayerItemDidPlayToEndTimeNotification, -[AVPlayer currentItem](-[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "currentItem"));
    -[THiOSIntroMediaViewController setRegisteredForNotification:](self, "setRegisteredForNotification:", 1);
  }
  objc_sync_exit(self);
}

- (void)p_removePlaybackNotifications
{
  objc_sync_enter(self);
  if (-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController")
    && -[THiOSIntroMediaViewController registeredForNotification](self, "registeredForNotification"))
  {
    -[AVPlayer removeObserver:forKeyPath:](-[AVPlayerViewController player](self->_moviePlayerViewController, "player"), "removeObserver:forKeyPath:", self, CFSTR("status"));
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, AVPlayerItemDidPlayToEndTimeNotification, -[AVPlayer currentItem](-[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "currentItem"));
    -[THiOSIntroMediaViewController setRegisteredForNotification:](self, "setRegisteredForNotification:", 0);
  }
  objc_sync_exit(self);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v11;
  _QWORD v12[5];

  if (off_53DE38 == a6 && objc_msgSend(a3, "isEqualToString:", CFSTR("status")))
  {
    if ((char *)-[AVPlayer status](-[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "status") == (char *)&dword_0 + 1)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_ED0D4;
      v12[3] = &unk_427130;
      v12[4] = self;
      -[AVPlayer prerollAtRate:completionHandler:](-[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "prerollAtRate:completionHandler:", v12, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0)));
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)THiOSIntroMediaViewController;
    -[THiOSIntroMediaViewController observeValueForKeyPath:ofObject:change:context:](&v11, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5, a6);
  }
}

- (void)pauseAndDismissMoviePlayer
{
  -[THiOSIntroMediaViewController pause](self, "pause");
  -[THiOSIntroMediaViewController p_unloadMoviePlayer](self, "p_unloadMoviePlayer");
  if (-[THiOSIntroMediaViewController delegate](self, "delegate"))
    -[THiOSIntroMediaViewControllerDelegate introMediaControllerShouldAdvancePast:](-[THiOSIntroMediaViewController delegate](self, "delegate"), "introMediaControllerShouldAdvancePast:", self);
  else
    -[THiOSIntroMediaViewController prepareControlsForTOC](self, "prepareControlsForTOC");
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  -[AVPlayer play](-[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController", a3, a4), "player"), "play");
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  -[THiOSIntroMediaViewController pauseAndDismissMoviePlayer](self, "pauseAndDismissMoviePlayer", a3, a4);
}

- (void)audioPlaybackWillStart:(id)a3
{
  if (a3 != self)
    -[THiOSIntroMediaViewController pause](self, "pause");
}

- (void)introMediaControllerShouldToggleControls
{
  if (-[THiOSIntroMediaViewController areControlsHidden](self, "areControlsHidden"))
    -[THiOSIntroMediaViewController showControls](self, "showControls");
  else
    -[THiOSIntroMediaViewController hideControls](self, "hideControls");
}

- (void)p_playerDidPlayToEnd:(id)a3
{
  AVPlayerViewController *v4;

  if (!self->mIsResignedActive)
  {
    v4 = (AVPlayerViewController *)-[THiOSIntroMediaViewController presentedViewController](self, "presentedViewController", a3);
    if (v4 == -[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"))
      -[AVPlayerViewController dismissViewControllerAnimated:completion:](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "dismissViewControllerAnimated:completion:", 1, 0);
    if (-[THiOSIntroMediaViewController delegate](self, "delegate"))
      -[THiOSIntroMediaViewControllerDelegate introMediaControllerShouldAdvancePast:](-[THiOSIntroMediaViewController delegate](self, "delegate"), "introMediaControllerShouldAdvancePast:", self);
    else
      -[THiOSIntroMediaViewController prepareControlsForTOC](self, "prepareControlsForTOC");
    self->mMovieNeedsUnloading = 1;
  }
}

- (void)p_nextPage
{
  -[UIButton setAlpha:](-[THiOSIntroMediaViewController closeButton](self, "closeButton"), "setAlpha:", 0.0);
  -[THiOSIntroMediaViewControllerDelegate introMediaControllerShouldAdvancePast:](-[THiOSIntroMediaViewController delegate](self, "delegate"), "introMediaControllerShouldAdvancePast:", self);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v4;
  uint64_t v5;

  v4 = objc_msgSend(a4, "view", a3);
  v5 = objc_opt_class(UIButton);
  return (objc_opt_isKindOfClass(v4, v5) & 1) == 0;
}

- (void)playForIntroMediaBecomesVisible
{
  AVPlayer *v3;
  uint64_t v4;

  -[THiOSIntroMediaViewController p_updateSetShowsDoneButton](self, "p_updateSetShowsDoneButton");
  if (-[THWIntroMediaController isMovie](self->_introMediaController, "isMovie"))
  {
    v3 = -[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player");
    if (v3 && (-[AVPlayer currentTime](v3, "currentTime"), v4 > 0))
    {
      -[THiOSIntroMediaViewController p_showMovieControls](self, "p_showMovieControls");
    }
    else
    {
      -[THiOSIntroMediaViewController play](self, "play");
      -[THiOSIntroMediaViewController p_hideMovieControlsAnimated:](self, "p_hideMovieControlsAnimated:", 1);
    }
  }
  else
  {
    -[THiOSIntroMediaViewController showControls](self, "showControls");
  }
}

- (void)playForBookOpen
{
  -[THiOSIntroMediaViewController p_playForBookOpen:](self, "p_playForBookOpen:", 1);
}

- (void)play
{
  -[THiOSIntroMediaViewController p_playForBookOpen:](self, "p_playForBookOpen:", 0);
}

- (BOOL)p_isAtEnd
{
  AVPlayer *v3;
  AVPlayerItem *v4;
  uint64_t v5;
  uint64_t v8;

  v3 = -[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player");
  if (v3)
    -[AVPlayer currentTime](v3, "currentTime");
  v4 = -[AVPlayer currentItem](-[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController", 0, 0, 0), "player"), "currentItem");
  if (v4)
  {
    -[AVPlayerItem duration](v4, "duration");
    v5 = v8;
  }
  else
  {
    v5 = 0;
  }
  return vabdd_f64((double)0, (double)v5) < 0.00999999978 || v5 < 0;
}

- (void)p_playForBookOpen:(BOOL)a3
{
  _BOOL4 v3;
  AVPlayer *v5;
  __int128 v6;
  CMTimeEpoch epoch;

  v3 = a3;
  -[THiOSIntroMediaViewController p_updateSetShowsDoneButton](self, "p_updateSetShowsDoneButton");
  -[BCAudioMuxingCoordinator notifyPlaybackWillStart:](+[BCAudioMuxingCoordinator sharedInstance](BCAudioMuxingCoordinator, "sharedInstance"), "notifyPlaybackWillStart:", self);
  if (-[THiOSIntroMediaViewController p_isAtEnd](self, "p_isAtEnd"))
  {
    v5 = -[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player");
    v6 = *(_OWORD *)&kCMTimeZero.value;
    epoch = kCMTimeZero.epoch;
    -[AVPlayer seekToTime:](v5, "seekToTime:", &v6);
  }
  -[AVPlayer play](-[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "play");
  if (v3)
    -[THiOSIntroMediaViewController p_hideMovieControlsAnimated:](self, "p_hideMovieControlsAnimated:", 1);
}

- (void)pause
{
  -[AVPlayer pause](-[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "pause");
}

- (void)stop
{
  -[AVPlayer pause](-[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "pause");
}

- (void)ensureReadyToPlay
{
  if (-[THWIntroMediaController isMovie](self->_introMediaController, "isMovie"))
  {
    if (!-[THiOSIntroMediaViewController isPlaying](self, "isPlaying"))
      -[THiOSIntroMediaViewController p_resetMoviePlayer](self, "p_resetMoviePlayer");
  }
}

- (void)prepareControlsForTOC
{
  if (-[THiOSIntroMediaViewController isViewLoaded](self, "isViewLoaded")
    && !-[THiOSIntroMediaViewController controlsHidden](self, "controlsHidden"))
  {
    if (-[THWIntroMediaController isMovie](self->_introMediaController, "isMovie"))
      -[THiOSIntroMediaViewController p_hideMovieControlsAnimated:](self, "p_hideMovieControlsAnimated:", 0);
    else
      -[THiOSIntroMediaViewController hideControls](self, "hideControls");
    -[THiOSIntroMediaViewController p_resetUIFadeOutTimer](self, "p_resetUIFadeOutTimer");
  }
  -[THiOSIntroMediaViewController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
}

- (void)prepareMovieForTOC
{
  if (-[THiOSIntroMediaViewController isViewLoaded](self, "isViewLoaded")
    && -[THWIntroMediaController isMovie](self->_introMediaController, "isMovie")
    && self->mMovieNeedsUnloading)
  {
    -[THiOSIntroMediaViewController p_unloadMoviePlayer](self, "p_unloadMoviePlayer");
  }
}

- (BOOL)isPlaying
{
  double v2;

  -[THiOSIntroMediaViewController playbackRate](self, "playbackRate");
  return v2 != 0.0;
}

- (double)playbackRate
{
  float v3;

  if (!-[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"))return 0.0;
  -[AVPlayer rate](-[AVPlayerViewController player](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "player"), "rate");
  return v3;
}

- (BOOL)isMovie
{
  return -[THWIntroMediaController isMovie](self->_introMediaController, "isMovie");
}

- (void)showControls
{
  double v3;
  void ***v4;
  void ***v5;
  void **v6;
  uint64_t v7;
  id (*v8)(uint64_t);
  void *v9;
  THiOSIntroMediaViewController *v10;
  void **v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  THiOSIntroMediaViewController *v15;
  void **v16;
  uint64_t v17;
  id (*v18)(uint64_t);
  void *v19;
  THiOSIntroMediaViewController *v20;
  void **v21;
  uint64_t v22;
  id (*v23)(uint64_t);
  void *v24;
  THiOSIntroMediaViewController *v25;

  -[THiOSIntroMediaViewController p_resetUIFadeOutTimer](self, "p_resetUIFadeOutTimer");
  if (-[THWIntroMediaController isMovie](self->_introMediaController, "isMovie"))
  {
    -[THiOSIntroMediaViewController p_showMovieControls](self, "p_showMovieControls");
    -[THiOSIntroMediaViewController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
  }
  else
  {
    if (-[THiOSIntroMediaViewControllerDelegate closeButtonIsNeeded](-[THiOSIntroMediaViewController delegate](self, "delegate"), "closeButtonIsNeeded"))
    {
      -[THiOSIntroMediaViewController p_configureCloseButton](self, "p_configureCloseButton");
      v21 = _NSConcreteStackBlock;
      v22 = 3221225472;
      v23 = sub_ED778;
      v24 = &unk_426DD0;
      v25 = self;
      v16 = _NSConcreteStackBlock;
      v17 = 3221225472;
      v18 = sub_ED7C0;
      v19 = &unk_427130;
      v20 = self;
      v3 = 0.75;
      v4 = &v21;
      v5 = &v16;
    }
    else
    {
      -[UIButton setAlpha:](-[THiOSIntroMediaViewController closeButton](self, "closeButton"), "setAlpha:", 0.0);
      v10 = self;
      v11 = _NSConcreteStackBlock;
      v12 = 3221225472;
      v13 = sub_ED7C8;
      v14 = &unk_426DD0;
      v15 = self;
      v6 = _NSConcreteStackBlock;
      v7 = 3221225472;
      v8 = sub_ED7F8;
      v9 = &unk_427130;
      v3 = 0.75;
      v4 = &v11;
      v5 = &v6;
    }
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v4, v5, v3, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,
      v20,
      v21,
      v22,
      v23,
      v24,
      v25);
  }
}

- (void)p_configureCloseButton
{
  double v3;
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
  double v17;
  double v18;
  double v19;
  double v20;

  if (-[THiOSIntroMediaViewController controlsHidden](self, "controlsHidden"))
  {
    -[UIImage size](-[THiOSIntroMediaViewController image](self, "image"), "size");
    v4 = v3;
    v6 = v5;
    objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "frame");
    v8 = v7;
    objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "frame");
    if (v4 <= v6)
    {
      v13 = v9;
      objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "bounds");
      if (v6 == 0.0)
      {
        v13 = v14 * 0.5;
      }
      else
      {
        v15 = v14 / v6;
        objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "bounds");
        v8 = (v16 - v4 * v15) * 0.5;
      }
    }
    else
    {
      objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "bounds");
      v11 = v10 / v4;
      objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "bounds");
      v13 = (v12 - v6 * v11) * 0.5;
    }
    objc_msgSend(objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "window"), "statusBarMinDimension");
    if (v13 >= v17)
      v17 = -0.0;
    v18 = v13 + v17;
    -[UIButton frame](-[THiOSIntroMediaViewController closeButton](self, "closeButton"), "frame");
    -[UIButton setFrame:](-[THiOSIntroMediaViewController closeButton](self, "closeButton"), "setFrame:", v8 + 4.0, v18 + 4.0, v19, v20);
  }
}

- (void)hideControls
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (-[THWIntroMediaController isMovie](self->_introMediaController, "isMovie"))
  {
    -[THiOSIntroMediaViewController p_hideMovieControlsAnimated:](self, "p_hideMovieControlsAnimated:", 1);
  }
  else
  {
    -[THiOSIntroMediaViewController p_cancelUIFadeOutTimer](self, "p_cancelUIFadeOutTimer");
    v3[4] = self;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_EDA04;
    v4[3] = &unk_426DD0;
    v4[4] = self;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_EDA68;
    v3[3] = &unk_427130;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v4, v3, 0.75);
  }
}

- (void)p_hideMovieControlsAnimated:(BOOL)a3
{
  if (!-[THiOSIntroMediaViewController controlsHidden](self, "controlsHidden", a3))
  {
    -[THiOSIntroMediaViewController setControlsHidden:](self, "setControlsHidden:", 1);
    -[THiOSIntroMediaViewController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
  }
}

- (void)p_showMovieControls
{
  if (-[THiOSIntroMediaViewController controlsHidden](self, "controlsHidden"))
  {
    -[THiOSIntroMediaViewController setControlsHidden:](self, "setControlsHidden:", 0);
    -[THiOSIntroMediaViewController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
  }
}

- (id)movieGestureView
{
  if (!-[THWIntroMediaController isMovie](self->_introMediaController, "isMovie"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THiOSIntroMediaViewController movieGestureView]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THiOSIntroMediaViewController.m"), 677, CFSTR("Intro media is not a movie."));
  if (-[THWIntroMediaController isMovie](self->_introMediaController, "isMovie"))
    return objc_msgSend(objc_msgSend(-[AVPlayerViewController view](-[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController"), "view"), "superview"), "superview");
  else
    return 0;
}

- (id)controlsInfoForIntroMediaController:(id)a3
{
  return 0;
}

- (CGSize)hostViewSizeForIntroMediaController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(-[THiOSIntroMediaViewController view](self, "view", a3), "frame");
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)p_resetUIFadeOutTimer
{
  if (!-[THWIntroMediaController isMovie](self->_introMediaController, "isMovie"))
  {
    -[THiOSIntroMediaViewController p_cancelUIFadeOutTimer](self, "p_cancelUIFadeOutTimer");
    -[THiOSIntroMediaViewController setFadeoutTimer:](self, "setFadeoutTimer:", +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_hideUITimerFired", 0, 0, 5.0));
  }
}

- (void)p_cancelUIFadeOutTimer
{
  -[NSTimer invalidate](-[THiOSIntroMediaViewController fadeoutTimer](self, "fadeoutTimer"), "invalidate");
  -[THiOSIntroMediaViewController setFadeoutTimer:](self, "setFadeoutTimer:", 0);
}

- (void)p_updateFrameForSize:(CGSize)a3
{
  double height;
  double width;
  double y;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;

  height = a3.height;
  width = a3.width;
  y = CGRectZero.origin.y;
  objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "frame");
  v15.origin.x = v7;
  v15.origin.y = v8;
  v15.size.width = v9;
  v15.size.height = v10;
  v14.origin.x = CGRectZero.origin.x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  if (!CGRectEqualToRect(v14, v15))
  {
    objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "setFrame:", CGRectZero.origin.x, y, width, height);
    if (width >= height)
      v11 = width;
    else
      v11 = height;
    -[UIView setBounds:](-[THiOSIntroMediaViewController scrimView](self, "scrimView"), "setBounds:", CGRectZero.origin.x, y, v11 * 1.42, v11 * 1.42);
    objc_msgSend(-[THiOSIntroMediaViewController view](self, "view"), "center");
    -[UIView setCenter:](-[THiOSIntroMediaViewController scrimView](self, "scrimView"), "setCenter:", v12, v13);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  -[THiOSIntroMediaViewController p_updateFrameForSize:](self, "p_updateFrameForSize:");
  v8.receiver = self;
  v8.super_class = (Class)THiOSIntroMediaViewController;
  -[THiOSIntroMediaViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  if (-[THWIntroMediaController isMovie](self->_introMediaController, "isMovie"))
    return -[THiOSIntroMediaViewController moviePlayerViewController](self, "moviePlayerViewController");
  else
    return 0;
}

- (THiOSIntroMediaViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THiOSIntroMediaViewControllerDelegate *)a3;
}

- (BOOL)needsMoviePosterForOpenAnimation
{
  return self->_needsMoviePosterForOpenAnimation;
}

- (void)setNeedsMoviePosterForOpenAnimation:(BOOL)a3
{
  self->_needsMoviePosterForOpenAnimation = a3;
}

- (UIView)scrimView
{
  return self->_scrimView;
}

- (void)setScrimView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSTimer)fadeoutTimer
{
  return self->_fadeoutTimer;
}

- (void)setFadeoutTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (AVPlayerViewController)moviePlayerViewController
{
  return self->_moviePlayerViewController;
}

- (void)setMoviePlayerViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (BOOL)movieIsInAspectFitMode
{
  return self->_movieIsInAspectFitMode;
}

- (void)setMovieIsInAspectFitMode:(BOOL)a3
{
  self->_movieIsInAspectFitMode = a3;
}

- (double)movieAspectRatio
{
  return self->_movieAspectRatio;
}

- (void)setMovieAspectRatio:(double)a3
{
  self->_movieAspectRatio = a3;
}

- (BOOL)controlsHidden
{
  return self->_controlsHidden;
}

- (void)setControlsHidden:(BOOL)a3
{
  self->_controlsHidden = a3;
}

- (BOOL)moviePlayerControllerIsLoaded
{
  return self->_moviePlayerControllerIsLoaded;
}

- (void)setMoviePlayerControllerIsLoaded:(BOOL)a3
{
  self->_moviePlayerControllerIsLoaded = a3;
}

- (BOOL)moviePlayerControllerIsShowing
{
  return self->_moviePlayerControllerIsShowing;
}

- (void)setMoviePlayerControllerIsShowing:(BOOL)a3
{
  self->_moviePlayerControllerIsShowing = a3;
}

- (BOOL)registeredForNotification
{
  return self->_registeredForNotification;
}

- (void)setRegisteredForNotification:(BOOL)a3
{
  self->_registeredForNotification = a3;
}

@end
