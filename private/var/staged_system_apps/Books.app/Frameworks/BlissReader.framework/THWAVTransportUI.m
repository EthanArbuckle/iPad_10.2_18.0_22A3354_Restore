@implementation THWAVTransportUI

- (THWAVTransportUI)initWithTransportController:(id)a3
{
  THWAVTransportUI *v4;
  THWAVTransportUI *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWAVTransportUI;
  v4 = -[THWAVTransportUI init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    -[THWAVTransportUI setTransportController:](v4, "setTransportController:", a3);
    -[THWAVTransportUI createMovieUIView](v5, "createMovieUIView");
    -[THWAVTransportUI initialConfiguration](v5, "initialConfiguration");
    -[THWAVTransportUI createViewsForConfigurationChange](v5, "createViewsForConfigurationChange");
    -[THWAVTransportUI configureViewsForConfigurationChange](v5, "configureViewsForConfigurationChange");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[THWAVTransportUI setPlayButton:](self, "setPlayButton:", 0);
  -[THWAVTransportUI setScrubber:](self, "setScrubber:", 0);
  -[THWAVTransportUI setMovieUIView:](self, "setMovieUIView:", 0);
  -[THWAVTransportUI setCompactUIView:](self, "setCompactUIView:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportUI;
  -[THWAVTransportUI dealloc](&v3, "dealloc");
}

- (void)initialConfiguration
{
  -[THWAVTransportUI setWantsPlayButton:](self, "setWantsPlayButton:", 1);
  -[THWAVTransportUI setWantsScrubber:](self, "setWantsScrubber:", 1);
}

- (void)createMovieUIViewBackground
{
  id v3;
  double v4;
  double v5;

  v3 = +[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", CFSTR("ib_media_movie_transport_bg"), THBundle());
  -[THCustomLayerView setContentsFromImage:](-[THWAVTransportUI movieUIView](self, "movieUIView"), "setContentsFromImage:", v3);
  objc_msgSend(v3, "size");
  -[THCustomLayerView setContentsCenter:](-[THWAVTransportUI movieUIView](self, "movieUIView"), "setContentsCenter:", 0.5, 0.5, 1.0 / v4, 1.0 / v5);
}

- (void)createMovieUIView
{
  -[THWAVTransportUI setMovieUIView:](self, "setMovieUIView:", -[THCustomLayerView initWithFrame:]([THCustomLayerView alloc], "initWithFrame:", 0.0, 0.0, 0.0, 0.0));
  -[THCustomLayerView setAutoresizesSubviews:](-[THWAVTransportUI movieUIView](self, "movieUIView"), "setAutoresizesSubviews:", 1);
  -[THCustomLayerView setBackgroundColor:](-[THWAVTransportUI movieUIView](self, "movieUIView"), "setBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "platformColor"));
  -[THCustomLayerView setTsdAlpha:](-[THWAVTransportUI movieUIView](self, "movieUIView"), "setTsdAlpha:", 0.99);
  -[THCustomLayerView setOpaque:](-[THWAVTransportUI movieUIView](self, "movieUIView"), "setOpaque:", 0);
  -[THWAVTransportUI createMovieUIViewBackground](self, "createMovieUIViewBackground");
}

- (CGRect)frameForOnCanvasUI
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect result;

  -[THWAVTransportUI layoutRect](self, "layoutRect");
  v16 = CGRectIntegral(v15);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  -[THWAVTransportUI hudExternalPadding](self, "hudExternalPadding");
  if (v7 > 0.0)
  {
    -[THWAVTransportUI hudExternalPadding](self, "hudExternalPadding");
    x = x + v8;
    -[THWAVTransportUI hudExternalPadding](self, "hudExternalPadding");
    width = width + v9 * -2.0;
  }
  v10 = 545.0;
  if (width <= 545.0)
  {
    v10 = width;
  }
  else
  {
    v11 = (width + -545.0) * 0.5;
    x = x + roundf(v11);
  }
  v12 = y + height + -49.0 + -10.0;
  v13 = 49.0;
  v14 = x;
  result.size.height = v13;
  result.size.width = v10;
  result.origin.y = v12;
  result.origin.x = v14;
  return result;
}

- (THCustomLayerView)onCanvasView
{
  if (-[THWAVTransportUI compactUIView](self, "compactUIView"))
    return -[THWAVTransportUI compactUIView](self, "compactUIView");
  else
    return -[THWAVTransportUI movieUIView](self, "movieUIView");
}

- (THCustomLayerView)inHUDView
{
  return 0;
}

- (id)onCanvasViews
{
  return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", -[THWAVTransportUI onCanvasView](self, "onCanvasView"));
}

- (void)reconfigureViewsAndLayout
{
  -[THWAVTransportUI createViewsForConfigurationChange](self, "createViewsForConfigurationChange");
  -[THWAVTransportUI configureViewsForConfigurationChange](self, "configureViewsForConfigurationChange");
  -[THWAVTransportUI i_layout](self, "i_layout");
}

- (BOOL)isCompact
{
  return -[THWAVTransportController isCompact](-[THWAVTransportUI transportController](self, "transportController"), "isCompact");
}

- (BOOL)supportsCompactUI
{
  return 0;
}

- (void)compactnessChanged
{
  if (-[THWAVTransportUI supportsCompactUI](self, "supportsCompactUI"))
    -[THWAVTransportUI reconfigureViewsAndLayout](self, "reconfigureViewsAndLayout");
}

- (int64_t)scrubberStyle
{
  return 2;
}

- (void)createViewsForConfigurationChange
{
  id v3;
  THWDetailSlider *v4;

  if (-[THWAVTransportUI wantsPlayButton](self, "wantsPlayButton")
    && !-[THWAVTransportUI playButton](self, "playButton"))
  {
    v3 = +[TSKBiggerButton tsdPlatformButtonWithFrame:](TSKBiggerButton, "tsdPlatformButtonWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v3, "setTarget:action:", self, "p_handlePlayButtonPressed:");
    objc_msgSend(v3, "setHitBufferTop:left:bottom:right:", 10.0, 10.0, 10.0, 10.0);
    objc_msgSend(v3, "setShowsTouchWhenHighlighted:", 1);
    objc_msgSend(objc_msgSend(v3, "imageView"), "setContentMode:", 4);
    -[THWAVTransportUI setPlayButton:](self, "setPlayButton:", v3);
    -[THCustomLayerView addSubview:](-[THWAVTransportUI movieUIView](self, "movieUIView"), "addSubview:", -[THWAVTransportUI playButton](self, "playButton"));
  }
  if (-[THWAVTransportUI wantsScrubber](self, "wantsScrubber") && !-[THWAVTransportUI scrubber](self, "scrubber"))
  {
    v4 = -[THWDetailSlider initWithFrame:style:]([THWDetailSlider alloc], "initWithFrame:style:", -[THWAVTransportUI scrubberStyle](self, "scrubberStyle"), CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[THWDetailSlider setDelegate:](v4, "setDelegate:", self);
    -[THWAVTransportUI setScrubber:](self, "setScrubber:", v4);
    -[THCustomLayerView addSubview:](-[THWAVTransportUI movieUIView](self, "movieUIView"), "addSubview:", -[THWAVTransportUI scrubber](self, "scrubber"));
  }
  if (!-[THWAVTransportUI wantsPlayButton](self, "wantsPlayButton")
    && -[THWAVTransportUI playButton](self, "playButton"))
  {
    -[UIButton removeFromSuperview](-[THWAVTransportUI playButton](self, "playButton"), "removeFromSuperview");
    -[THWAVTransportUI setPlayButton:](self, "setPlayButton:", 0);
  }
  if (!-[THWAVTransportUI wantsScrubber](self, "wantsScrubber"))
  {
    if (-[THWAVTransportUI scrubber](self, "scrubber"))
    {
      -[THWDetailSlider removeFromSuperview](-[THWAVTransportUI scrubber](self, "scrubber"), "removeFromSuperview");
      -[THWAVTransportUI setScrubber:](self, "setScrubber:", 0);
    }
  }
}

- (void)configureViewsForConfigurationChange
{
  UIButton *v3;
  NSString *v4;
  UIButton *v5;
  NSString *v6;
  THWDetailSlider *v7;
  double v8;
  THWDetailSlider *v9;
  double v10;

  if (-[THWAVTransportUI playButton](self, "playButton"))
  {
    v3 = -[THWAVTransportUI playButton](self, "playButton");
    if (-[THWAVTransportController movieIsPlaying](-[THWAVTransportUI transportController](self, "transportController"), "movieIsPlaying"))
    {
      v4 = -[THWAVTransportUI imageNameForPauseButton](self, "imageNameForPauseButton");
    }
    else
    {
      v4 = -[THWAVTransportUI imageNameForPlayButton](self, "imageNameForPlayButton");
    }
    -[UIButton setImageNamed:inBundle:](v3, "setImageNamed:inBundle:", v4, THBundle());
    v5 = -[THWAVTransportUI playButton](self, "playButton");
    if (-[THWAVTransportController movieIsPlaying](-[THWAVTransportUI transportController](self, "transportController"), "movieIsPlaying"))
    {
      v6 = -[THWAVTransportUI imageNameForPauseButtonPressed](self, "imageNameForPauseButtonPressed");
    }
    else
    {
      v6 = -[THWAVTransportUI imageNameForPlayButtonPressed](self, "imageNameForPlayButtonPressed");
    }
    -[UIButton setAlternateImageNamed:inBundle:](v5, "setAlternateImageNamed:inBundle:", v6, THBundle());
  }
  if (-[THWAVTransportUI scrubber](self, "scrubber"))
  {
    v7 = -[THWAVTransportUI scrubber](self, "scrubber");
    -[THWAVTransportController duration](-[THWAVTransportUI transportController](self, "transportController"), "duration");
    *(float *)&v8 = v8;
    -[THWDetailSlider setDuration:](v7, "setDuration:", roundf(*(float *)&v8));
    v9 = -[THWAVTransportUI scrubber](self, "scrubber");
    -[THWAVTransportController currentTime](-[THWAVTransportUI transportController](self, "transportController"), "currentTime");
    *(float *)&v10 = v10;
    *(float *)&v10 = roundf(*(float *)&v10);
    -[THWDetailSlider setValue:](v9, "setValue:", v10);
  }
}

- (NSString)imageNameForPlayButton
{
  return (NSString *)CFSTR("ib_media_movie_transport_btn_play-N");
}

- (NSString)imageNameForPlayButtonPressed
{
  return (NSString *)CFSTR("ib_media_movie_transport_btn_play-P");
}

- (NSString)imageNameForPauseButton
{
  return (NSString *)CFSTR("ib_media_movie_transport_btn_pause-N");
}

- (NSString)imageNameForPauseButtonPressed
{
  return (NSString *)CFSTR("ib_media_movie_transport_btn_pause-P");
}

- (double)widthForPlayButton
{
  return 18.0;
}

- (double)hudInternalPadding
{
  return 15.0;
}

- (double)hudExternalPadding
{
  return 0.0;
}

- (double)minWidthToShowScrubberStartTime
{
  return 415.0;
}

- (double)minWidthToShowScrubberEndTime
{
  return 275.0;
}

- (void)i_layout
{
  -[THWAVTransportUI willLayout](self, "willLayout");
  -[THWAVTransportUI layout](self, "layout");
  -[THWAVTransportUI didLayout](self, "didLayout");
}

- (void)willLayout
{
  THCustomLayerView *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[3];
  _OWORD v8[2];
  __int128 v9;

  v3 = -[THWAVTransportUI onCanvasView](self, "onCanvasView");
  v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v5 = v8[0];
  v8[1] = v6;
  v9 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v4 = v9;
  -[THCustomLayerView setTransform:](v3, "setTransform:", v8);
  v7[0] = v5;
  v7[1] = v6;
  v7[2] = v4;
  -[THCustomLayerView setTransform:](-[THWAVTransportUI inHUDView](self, "inHUDView"), "setTransform:", v7);
}

- (void)didLayout
{
  __int128 v3;
  CGFloat v4;
  THCustomLayerView *v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  -[THWAVTransportController onCanvasScale](-[THWAVTransportUI transportController](self, "transportController"), "onCanvasScale");
  v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v7.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v7.c = v3;
  *(_OWORD *)&v7.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGAffineTransformScale(&v8, &v7, v4, v4);
  v5 = -[THWAVTransportUI onCanvasView](self, "onCanvasView");
  v6 = v8;
  -[THCustomLayerView setTransform:](v5, "setTransform:", &v6);
}

- (void)layout
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
  double v21;
  double v22;
  float v23;
  double Width;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;

  -[THWAVTransportUI frameForOnCanvasUI](self, "frameForOnCanvasUI");
  -[THCustomLayerView setFrame:](-[THWAVTransportUI movieUIView](self, "movieUIView"), "setFrame:", v3, v4, v5, v6);
  -[THCustomLayerView bounds](-[THWAVTransportUI movieUIView](self, "movieUIView"), "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[THWAVTransportUI hudInternalPadding](self, "hudInternalPadding");
  v16 = v15 + v8;
  -[THWAVTransportUI hudInternalPadding](self, "hudInternalPadding");
  v18 = v17;
  if (-[THWAVTransportUI playButton](self, "playButton"))
  {
    -[THWAVTransportUI widthForPlayButton](self, "widthForPlayButton");
    v20 = v19;
    -[UIButton setFrame:](-[THWAVTransportUI playButton](self, "playButton"), "setFrame:", v16, v10, v19, v14);
    v16 = v16 + v20 + 12.0;
    objc_msgSend(-[UIButton layer](-[THWAVTransportUI playButton](self, "playButton"), "layer"), "setNeedsDisplay");
  }
  if (-[THWAVTransportUI scrubber](self, "scrubber") && (v21 = v8 + v12 - v18 - v16, v21 > 100.0))
  {
    -[THWDetailSlider sizeThatFits:](-[THWAVTransportUI scrubber](self, "scrubber"), "sizeThatFits:", v12, v14);
    v23 = (v14 - v22) * 0.5;
    -[THWDetailSlider setFrame:](-[THWAVTransportUI scrubber](self, "scrubber"), "setFrame:", v16, v10 + floorf(v23) + 2.0, v21, v22);
    -[THWDetailSlider setHidden:](-[THWAVTransportUI scrubber](self, "scrubber"), "setHidden:", 0);
    -[THCustomLayerView frame](-[THWAVTransportUI movieUIView](self, "movieUIView"), "frame");
    Width = CGRectGetWidth(v28);
    -[THWAVTransportUI minWidthToShowScrubberStartTime](self, "minWidthToShowScrubberStartTime");
    -[THWDetailSlider setHideLeftNumericDisplay:](-[THWAVTransportUI scrubber](self, "scrubber"), "setHideLeftNumericDisplay:", Width < v25);
    -[THCustomLayerView frame](-[THWAVTransportUI movieUIView](self, "movieUIView"), "frame");
    v26 = CGRectGetWidth(v29);
    -[THWAVTransportUI minWidthToShowScrubberEndTime](self, "minWidthToShowScrubberEndTime");
    -[THWDetailSlider setHideRightNumericDisplay:](-[THWAVTransportUI scrubber](self, "scrubber"), "setHideRightNumericDisplay:", v26 < v27);
  }
  else
  {
    -[THWDetailSlider setHidden:](-[THWAVTransportUI scrubber](self, "scrubber"), "setHidden:", 1);
  }
  if (!-[THWAVTransportUI shouldShowControlsOnCanvas](self, "shouldShowControlsOnCanvas"))
    -[THCustomLayerView setHidden:](-[THWAVTransportUI movieUIView](self, "movieUIView"), "setHidden:", 1);
}

- (void)durationChanged:(double)a3
{
  THWDetailSlider *v4;
  float v5;

  v4 = -[THWAVTransportUI scrubber](self, "scrubber");
  v5 = a3;
  -[THWDetailSlider setDuration:](v4, "setDuration:", roundf(v5));
}

- (void)timeChanged:(double)a3
{
  THWDetailSlider *v4;
  float v5;
  double v6;

  v4 = -[THWAVTransportUI scrubber](self, "scrubber");
  v5 = a3;
  *(float *)&v6 = roundf(v5);
  -[THWDetailSlider setValue:](v4, "setValue:", v6);
}

- (void)configureButtonsForPlaying
{
  -[UIButton setImageNamed:inBundle:](-[THWAVTransportUI playButton](self, "playButton"), "setImageNamed:inBundle:", -[THWAVTransportUI imageNameForPauseButton](self, "imageNameForPauseButton"), THBundle());
  -[UIButton setAlternateImageNamed:inBundle:](-[THWAVTransportUI playButton](self, "playButton"), "setAlternateImageNamed:inBundle:", -[THWAVTransportUI imageNameForPauseButtonPressed](self, "imageNameForPauseButtonPressed"), THBundle());
}

- (void)configureButtonsForPaused
{
  -[UIButton setImageNamed:inBundle:](-[THWAVTransportUI playButton](self, "playButton"), "setImageNamed:inBundle:", -[THWAVTransportUI imageNameForPlayButton](self, "imageNameForPlayButton"), THBundle());
  -[UIButton setAlternateImageNamed:inBundle:](-[THWAVTransportUI playButton](self, "playButton"), "setAlternateImageNamed:inBundle:", -[THWAVTransportUI imageNameForPlayButtonPressed](self, "imageNameForPlayButtonPressed"), THBundle());
}

- (void)rateChanged:(double)a3
{
  if (-[THWAVTransportUI playButton](self, "playButton"))
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      if (a3 == 0.0)
        -[THWAVTransportUI configureButtonsForPaused](self, "configureButtonsForPaused");
      else
        -[THWAVTransportUI configureButtonsForPlaying](self, "configureButtonsForPlaying");
    }
    else
    {
      +[NSThread mainThread](NSThread, "mainThread");
      -[THWAVTransportUI performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:");
    }
  }
}

- (void)mediaDidPlayToEnd
{
  THWDetailSlider *v3;
  double v4;

  if (-[THWAVTransportUI scrubber](self, "scrubber"))
  {
    v3 = -[THWAVTransportUI scrubber](self, "scrubber");
    LODWORD(v4) = 0;
    -[THWDetailSlider setValue:](v3, "setValue:", v4);
  }
}

- (void)toggleHidden
{
  if (-[THWAVTransportUI shouldShowControlsOnCanvas](self, "shouldShowControlsOnCanvas"))
    -[THWAVTransportUI setHidden:](self, "setHidden:", -[THWAVTransportUI hidden](self, "hidden") ^ 1);
}

- (BOOL)hidden
{
  return -[THCustomLayerView isHidden](-[THWAVTransportUI movieUIView](self, "movieUIView"), "isHidden");
}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  NSNotificationCenter *v5;
  __CFString **v6;
  _QWORD v7[5];
  BOOL v8;
  _QWORD v9[5];
  BOOL v10;

  v3 = a3;
  if (-[THCustomLayerView isHidden](-[THWAVTransportUI movieUIView](self, "movieUIView"), "isHidden") != a3)
  {
    v5 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    v6 = &THWAVTransportUIWillHideNotification;
    if (!v3)
      v6 = &THWAVTransportUIWillShowNotification;
    -[NSNotificationCenter postNotificationName:object:](v5, "postNotificationName:object:", *v6, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_150D68;
    v9[3] = &unk_427268;
    v9[4] = self;
    v10 = v3;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_150DA0;
    v7[3] = &unk_429DE0;
    v7[4] = self;
    v8 = v3;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v9, v7, 0.3);
  }
}

- (BOOL)shouldPlayOnMainCanvasWithSize:(double)a3
{
  int v4;

  v4 = TSUPhoneUI(self, a2) ^ 1;
  if (a3 >= 150.0)
    return v4;
  else
    return 0;
}

- (BOOL)shouldShowControlsOnCanvas
{
  double v4;

  if ((TSUPhoneUI(self, a2) & 1) != 0)
    return 0;
  -[THCustomLayerView frame](-[THWAVTransportUI movieUIView](self, "movieUIView"), "frame");
  return v4 >= 150.0;
}

- (void)play
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_150EA8;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Play", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)pause
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_150F24;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Pause", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (BOOL)movieIsPlaying
{
  return -[THWAVTransportController movieIsPlaying](-[THWAVTransportUI transportController](self, "transportController"), "movieIsPlaying");
}

- (void)togglePlay
{
  _QWORD activity_block[5];

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_150FB4;
  activity_block[3] = &unk_426DD0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "AVTransport Toggle Play", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)changeCurrentTimeTo:(double)a3
{
  -[THWAVTransportController changeCurrentTimeTo:](-[THWAVTransportUI transportController](self, "transportController"), "changeCurrentTimeTo:", a3);
}

- (void)p_handlePlayButtonPressed:(id)a3
{
  -[THWAVTransportUI togglePlay](self, "togglePlay", a3);
}

- (void)detailSlider:(id)a3 didChangeValue:(float)a4
{
  if (-[THWAVTransportUI scrubber](self, "scrubber") == a3)
    -[THWAVTransportUI changeCurrentTimeTo:](self, "changeCurrentTimeTo:", a4);
}

- (THWAVTransportController)transportController
{
  return self->_transportController;
}

- (void)setTransportController:(id)a3
{
  self->_transportController = (THWAVTransportController *)a3;
}

- (CGRect)layoutRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_layoutRect.origin.x;
  y = self->_layoutRect.origin.y;
  width = self->_layoutRect.size.width;
  height = self->_layoutRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLayoutRect:(CGRect)a3
{
  self->_layoutRect = a3;
}

- (THCustomLayerView)movieUIView
{
  return self->_movieUIView;
}

- (void)setMovieUIView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (THCustomLayerView)compactUIView
{
  return self->_compactUIView;
}

- (void)setCompactUIView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (THWDetailSlider)scrubber
{
  return self->_scrubber;
}

- (void)setScrubber:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (UIButton)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)wantsPlayButton
{
  return self->_wantsPlayButton;
}

- (void)setWantsPlayButton:(BOOL)a3
{
  self->_wantsPlayButton = a3;
}

- (BOOL)wantsScrubber
{
  return self->_wantsScrubber;
}

- (void)setWantsScrubber:(BOOL)a3
{
  self->_wantsScrubber = a3;
}

@end
