@implementation THWAVAudioUI

- (void)dealloc
{
  objc_super v3;

  -[THWAVAudioUI setHiddenPlayButton:](self, "setHiddenPlayButton:", 0);
  -[THWAVAudioUI setHiddenPlayButton_compactUI:](self, "setHiddenPlayButton_compactUI:", 0);
  -[THWAVAudioUI setPlayButton_compactUI:](self, "setPlayButton_compactUI:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWAVAudioUI;
  -[THWAVTransportUI dealloc](&v3, "dealloc");
}

- (void)pCreateHUDBackgroundForView:(id)a3
{
  id v4;
  double v5;

  v4 = +[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", CFSTR("ib_media_audio_transport_bg"), THBundle());
  objc_msgSend(a3, "setContentsFromImage:", v4);
  objc_msgSend(v4, "size");
  objc_msgSend(a3, "setContentsCenter:", 0.5, 0.0, 1.0 / v5, 1.0);
}

- (void)createMovieUIViewBackground
{
  -[THWAVAudioUI pCreateHUDBackgroundForView:](self, "pCreateHUDBackgroundForView:", -[THWAVTransportUI movieUIView](self, "movieUIView"));
}

- (void)initialConfiguration
{
  -[THWAVTransportUI setWantsPlayButton:](self, "setWantsPlayButton:", 1);
  -[THWAVTransportUI setWantsScrubber:](self, "setWantsScrubber:", 0);
}

- (void)createViewsForConfigurationChange
{
  double y;
  double width;
  double height;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWAVAudioUI;
  -[THWAVTransportUI createViewsForConfigurationChange](&v7, "createViewsForConfigurationChange");
  if (-[THWAVTransportUI isCompact](self, "isCompact"))
  {
    if (!-[THWAVTransportUI compactUIView](self, "compactUIView"))
    {
      -[THWAVTransportUI setCompactUIView:](self, "setCompactUIView:", -[THCustomLayerView initWithFrame:]([THCustomLayerView alloc], "initWithFrame:", 0.0, 0.0, 0.0, 0.0));
      -[THCustomLayerView setAutoresizesSubviews:](-[THWAVTransportUI compactUIView](self, "compactUIView"), "setAutoresizesSubviews:", 1);
      -[THCustomLayerView setBackgroundColor:](-[THWAVTransportUI compactUIView](self, "compactUIView"), "setBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "platformColor"));
      -[THWAVAudioUI pCreateHUDBackgroundForView:](self, "pCreateHUDBackgroundForView:", -[THWAVTransportUI compactUIView](self, "compactUIView"));
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      -[THWAVAudioUI setHiddenPlayButton_compactUI:](self, "setHiddenPlayButton_compactUI:", +[UIButton tsdPlatformButtonWithFrame:](UIButton, "tsdPlatformButtonWithFrame:", CGRectZero.origin.x, y, width, height));
      -[UIButton setTarget:action:](-[THWAVAudioUI hiddenPlayButton_compactUI](self, "hiddenPlayButton_compactUI"), "setTarget:action:", self, "p_handlePlayButtonPressed_compactUI:");
      -[THCustomLayerView addSubview:](-[THWAVTransportUI compactUIView](self, "compactUIView"), "addSubview:", -[THWAVAudioUI hiddenPlayButton_compactUI](self, "hiddenPlayButton_compactUI"));
      v6 = +[TSKBiggerButton tsdPlatformButtonWithFrame:](TSKBiggerButton, "tsdPlatformButtonWithFrame:", CGRectZero.origin.x, y, width, height);
      objc_msgSend(v6, "setTarget:action:", self, "p_handlePlayButtonPressed_compactUI:");
      objc_msgSend(v6, "setHitBufferTop:left:bottom:right:", 10.0, 10.0, 10.0, 10.0);
      objc_msgSend(v6, "setShowsTouchWhenHighlighted:", 1);
      objc_msgSend(objc_msgSend(v6, "imageView"), "setContentMode:", 4);
      objc_msgSend(v6, "setImageNamed:inBundle:", -[THWAVAudioUI imageNameForPlayButton](self, "imageNameForPlayButton"), THBundle());
      objc_msgSend(v6, "setAlternateImageNamed:inBundle:", -[THWAVAudioUI imageNameForPlayButtonPressed](self, "imageNameForPlayButtonPressed"), THBundle());
      -[THWAVAudioUI setPlayButton_compactUI:](self, "setPlayButton_compactUI:", v6);
      -[THCustomLayerView addSubview:](-[THWAVTransportUI compactUIView](self, "compactUIView"), "addSubview:", -[THWAVAudioUI playButton_compactUI](self, "playButton_compactUI"));
    }
    if (-[THWAVAudioUI hiddenPlayButton](self, "hiddenPlayButton"))
    {
      -[UIButton removeFromSuperview](-[THWAVAudioUI hiddenPlayButton](self, "hiddenPlayButton"), "removeFromSuperview");
      -[THWAVAudioUI setHiddenPlayButton:](self, "setHiddenPlayButton:", 0);
    }
  }
  else
  {
    if (!-[THWAVTransportUI wantsScrubber](self, "wantsScrubber")
      && !-[THWAVAudioUI hiddenPlayButton](self, "hiddenPlayButton"))
    {
      -[THWAVAudioUI setHiddenPlayButton:](self, "setHiddenPlayButton:", +[UIButton tsdPlatformButtonWithFrame:](UIButton, "tsdPlatformButtonWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height));
      -[UIButton setTarget:action:](-[THWAVAudioUI hiddenPlayButton](self, "hiddenPlayButton"), "setTarget:action:", self, "p_handlePlayButtonPressed:");
      -[THCustomLayerView addSubview:](-[THWAVTransportUI movieUIView](self, "movieUIView"), "addSubview:", -[THWAVAudioUI hiddenPlayButton](self, "hiddenPlayButton"));
    }
    if (-[THWAVTransportUI wantsScrubber](self, "wantsScrubber")
      && -[THWAVAudioUI hiddenPlayButton](self, "hiddenPlayButton"))
    {
      -[UIButton removeFromSuperview](-[THWAVAudioUI hiddenPlayButton](self, "hiddenPlayButton"), "removeFromSuperview");
      -[THWAVAudioUI setHiddenPlayButton:](self, "setHiddenPlayButton:", 0);
    }
    if (-[THWAVTransportUI compactUIView](self, "compactUIView"))
    {
      -[THCustomLayerView removeFromSuperview](-[THWAVTransportUI compactUIView](self, "compactUIView"), "removeFromSuperview");
      -[THWAVTransportUI setCompactUIView:](self, "setCompactUIView:", 0);
    }
  }
}

- (BOOL)supportsCompactUI
{
  return 1;
}

- (void)compactnessChanged
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWAVAudioUI;
  -[THWAVTransportUI compactnessChanged](&v3, "compactnessChanged");
  -[THWAVAudioUI pConfigureHUDVisibility](self, "pConfigureHUDVisibility");
}

- (CGRect)p_frameForHUDUI
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[THWAVTransportController frameOfHUDFor:](-[THWAVTransportUI transportController](self, "transportController"), "frameOfHUDFor:", self);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)p_frameForOnCanvasUI
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  -[THWAVTransportUI layoutRect](self, "layoutRect");
  v19 = CGRectIntegral(v18);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  -[THWAVTransportController onCanvasScale](-[THWAVTransportUI transportController](self, "transportController"), "onCanvasScale");
  if (v7 != 1.0)
  {
    v8 = TSDCenterOfRect(x, y, width, height);
    x = TSDRectWithCenterAndSize(v8);
    y = v9;
    width = v10;
    height = v11;
  }
  if (!objc_msgSend(-[THWMovieLayout movieInfo](-[THWAVTransportController movieLayout](-[THWAVTransportUI transportController](self, "transportController"), "movieLayout"), "movieInfo"), "posterImageData")&& -[THWAVTransportController controlStyle](-[THWAVTransportUI transportController](self, "transportController"), "controlStyle") == 1)
  {
    height = (height + -30.0) * 0.5;
  }
  v12 = 545.0;
  if (width <= 545.0)
  {
    v12 = 180.0;
    if (width >= 180.0)
    {
      v12 = width;
    }
    else
    {
      v14 = (180.0 - width) * 0.5;
      x = x - roundf(v14);
    }
  }
  else
  {
    v13 = (width + -545.0) * 0.5;
    x = x + roundf(v13);
  }
  v15 = y + height;
  v16 = 30.0;
  v17 = x;
  result.size.height = v16;
  result.size.width = v12;
  result.origin.y = v15;
  result.origin.x = v17;
  return result;
}

- (CGRect)frameForOnCanvasUI
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (-[THWAVTransportUI isCompact](self, "isCompact"))
    -[THWAVAudioUI p_frameForHUDUI](self, "p_frameForHUDUI");
  else
    -[THWAVAudioUI p_frameForOnCanvasUI](self, "p_frameForOnCanvasUI");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
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
  CGFloat MaxX;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;

  v32.receiver = self;
  v32.super_class = (Class)THWAVAudioUI;
  -[THWAVTransportUI layout](&v32, "layout");
  if (-[THWAVTransportUI compactUIView](self, "compactUIView"))
  {
    -[THWAVAudioUI p_frameForOnCanvasUI](self, "p_frameForOnCanvasUI");
    -[THCustomLayerView setFrame:](-[THWAVTransportUI compactUIView](self, "compactUIView"), "setFrame:", v3, v4, v5, v6);
    if (-[THWAVAudioUI playButton_compactUI](self, "playButton_compactUI"))
    {
      -[THCustomLayerView bounds](-[THWAVTransportUI compactUIView](self, "compactUIView"), "bounds");
      v8 = v7;
      v10 = v9;
      -[THWAVAudioUI widthForPlayButton](self, "widthForPlayButton");
      v12 = v11;
      -[THWAVAudioUI hudInternalPadding](self, "hudInternalPadding");
      -[UIButton setFrame:](-[THWAVAudioUI playButton_compactUI](self, "playButton_compactUI"), "setFrame:", v13, v8, v12, v10);
      objc_msgSend(-[UIButton layer](-[THWAVAudioUI playButton_compactUI](self, "playButton_compactUI"), "layer"), "setNeedsDisplay");
    }
    if (-[THWAVAudioUI hiddenPlayButton_compactUI](self, "hiddenPlayButton_compactUI"))
    {
      -[THCustomLayerView bounds](-[THWAVTransportUI compactUIView](self, "compactUIView"), "bounds");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[UIButton bounds](-[THWAVAudioUI playButton_compactUI](self, "playButton_compactUI"), "bounds");
      MaxX = CGRectGetMaxX(v33);
      -[UIButton setFrame:](-[THWAVAudioUI hiddenPlayButton_compactUI](self, "hiddenPlayButton_compactUI"), "setFrame:", v15 + MaxX, v17, v19 - MaxX, v21);
    }
  }
  if (-[THWAVAudioUI hiddenPlayButton](self, "hiddenPlayButton"))
  {
    -[THCustomLayerView bounds](-[THWAVTransportUI movieUIView](self, "movieUIView"), "bounds");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[UIButton bounds](-[THWAVTransportUI playButton](self, "playButton"), "bounds");
    v31 = CGRectGetMaxX(v34);
    -[UIButton setFrame:](-[THWAVAudioUI hiddenPlayButton](self, "hiddenPlayButton"), "setFrame:", v24 + v31, v26, v28 - v31, v30);
  }
}

- (int64_t)scrubberStyle
{
  return 3;
}

- (void)rateChanged:(double)a3
{
  _QWORD v4[5];
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWAVAudioUI;
  -[THWAVTransportUI rateChanged:](&v6, "rateChanged:", a3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1549D0;
  v5[3] = &unk_426DD0;
  v5[4] = self;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[THWAVAudioUI pConfigureScrubberVisibility](self, "pConfigureScrubberVisibility");
    -[THWAVAudioUI pConfigureHUDVisibility](self, "pConfigureHUDVisibility");
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1549F8;
    v4[3] = &unk_427830;
    v4[4] = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

- (void)timeChanged:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWAVAudioUI;
  -[THWAVTransportUI timeChanged:](&v4, "timeChanged:", a3);
  -[THWAVAudioUI pConfigureScrubberVisibility](self, "pConfigureScrubberVisibility");
}

- (void)pConfigureHUDVisibility
{
  if (-[THWAVTransportUI isCompact](self, "isCompact") && -[THWAVTransportUI movieIsPlaying](self, "movieIsPlaying"))
    -[THWAVTransportController showTransportHUDFor:](-[THWAVTransportUI transportController](self, "transportController"), "showTransportHUDFor:", self);
  else
    -[THWAVTransportController hideTransportHUDFor:](-[THWAVTransportUI transportController](self, "transportController"), "hideTransportHUDFor:", self);
}

- (void)pConfigureScrubberVisibility
{
  _BOOL8 v3;
  double v4;

  if (-[THWAVTransportUI movieIsPlaying](self, "movieIsPlaying"))
  {
    if (-[THWAVTransportUI wantsScrubber](self, "wantsScrubber"))
      return;
    v3 = 1;
  }
  else
  {
    -[THWAVTransportController currentTime](-[THWAVTransportUI transportController](self, "transportController"), "currentTime");
    v3 = v4 > 0.1;
    if (v3 == -[THWAVTransportUI wantsScrubber](self, "wantsScrubber"))
      return;
  }
  -[THWAVTransportUI setWantsScrubber:](self, "setWantsScrubber:", v3);
  -[THWAVAudioUI createViewsForConfigurationChange](self, "createViewsForConfigurationChange");
  -[THWAVTransportUI configureViewsForConfigurationChange](self, "configureViewsForConfigurationChange");
  -[THWAVTransportUI i_layout](self, "i_layout");
}

- (BOOL)shouldPlayOnMainCanvasWithSize:(double)a3
{
  return 1;
}

- (BOOL)shouldShowControlsOnCanvas
{
  return 1;
}

- (id)imageNameForPlayButton
{
  return CFSTR("ib_media_audio_transport_btn_play");
}

- (id)imageNameForPlayButtonPressed
{
  return CFSTR("ib_media_audio_transport_btn_play");
}

- (id)imageNameForPauseButton
{
  return CFSTR("ib_media_audio_transport_btn_pause");
}

- (id)imageNameForPauseButtonPressed
{
  return CFSTR("ib_media_audio_transport_btn_pause");
}

- (double)widthForPlayButton
{
  return 18.0;
}

- (double)hudInternalPadding
{
  return 12.0;
}

- (double)minWidthToShowScrubberStartTime
{
  return 275.0;
}

- (double)minWidthToShowScrubberEndTime
{
  return 0.0;
}

- (void)p_handlePlayButtonPressed_compactUI:(id)a3
{
  if (!-[THWAVTransportUI movieIsPlaying](self, "movieIsPlaying", a3))
    -[THWAVTransportUI togglePlay](self, "togglePlay");
}

- (UIButton)hiddenPlayButton
{
  return self->_hiddenPlayButton;
}

- (void)setHiddenPlayButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (UIButton)hiddenPlayButton_compactUI
{
  return self->_hiddenPlayButton_compactUI;
}

- (void)setHiddenPlayButton_compactUI:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (UIButton)playButton_compactUI
{
  return self->_playButton_compactUI;
}

- (void)setPlayButton_compactUI:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
