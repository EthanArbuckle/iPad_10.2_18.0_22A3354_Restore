@implementation BSUIAudiobookControl

- (BSUIAudiobookControl)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUIAudiobookControl;

  return 0;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)BSUIAudiobookControl;
  -[BSUIAudiobookControl layoutSubviews](&v20, "layoutSubviews");
  -[BSUIAudiobookControl bounds](self, "bounds");
  if (v4 != self->_currentSize.width || v3 != self->_currentSize.height)
  {
    -[BSUIAudiobookControl bounds](self, "bounds");
    self->_currentSize.width = v6;
    self->_currentSize.height = v7;
    -[BSUIAudiobookControl bounds](self, "bounds");
    v8 = CGRectGetWidth(v21) * 0.5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_blurView, "layer"));
    objc_msgSend(v9, "setCornerRadius:", v8);

    -[BSUIAudiobookControl bounds](self, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAudiobookControl circleWithRect:color:](self, "circleWithRect:color:", v18, v11, v13, v15, v17));

    -[TUIUIKitButton setImage:forState:](self->_backgroundButton, "setImage:forState:", v19, 0);
    -[BSUIAudiobookControl _updateProgress](self, "_updateProgress");

  }
}

- (void)scaleDown:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.scale")));
  objc_msgSend(v10, "setFromValue:", &off_2FBA18);
  objc_msgSend(v10, "setToValue:", &off_2FBA28);
  objc_msgSend(v10, "setDuration:", 0.13);
  LODWORD(v4) = 1045220557;
  LODWORD(v5) = 1041865114;
  LODWORD(v6) = 0;
  LODWORD(v7) = 1.0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v4, v6, v5, v7));
  objc_msgSend(v10, "setTimingFunction:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAudiobookControl layer](self, "layer"));
  objc_msgSend(v9, "addAnimation:forKey:", v10, CFSTR("layerScaleDownAnimation"));

}

- (void)scaleUpAndTogglePlayPause:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("transform.scale")));
  objc_msgSend(v6, "setMass:", 1.0);
  objc_msgSend(v6, "setStiffness:", 400.0);
  objc_msgSend(v6, "setDamping:", 23.0);
  objc_msgSend(v6, "setInitialVelocity:", 0.0);
  objc_msgSend(v6, "setFromValue:", &off_2FBA28);
  objc_msgSend(v6, "setToValue:", &off_2FBA18);
  objc_msgSend(v6, "settlingDuration");
  objc_msgSend(v6, "setDuration:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAudiobookControl layer](self, "layer"));
  objc_msgSend(v4, "addAnimation:forKey:", v6, CFSTR("layerScaleUpAnimation"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "togglePlayPause:", self);

}

- (id)circleWithRect:(CGRect)a3 color:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  id v18;
  _QWORD *v19;
  void *v20;
  id v21;
  _QWORD *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v9 = CGRectGetWidth(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v10 = CGRectGetHeight(v35);
  if (v9 < v10)
    v10 = v9;
  v11 = v10 * 0.5;
  v12 = v10 + 1.0;
  v13 = (v10 + 1.0) * 0.5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v15 = objc_msgSend(v14, "scale");
  v17 = CGFloatRoundForScale(v15, v13, v16);

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_11454;
  v27[3] = &unk_2E45B8;
  v29 = v12;
  v30 = v12;
  v28 = v8;
  v31 = v17;
  v32 = v17;
  v33 = v11;
  v18 = v8;
  v19 = objc_retainBlock(v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat defaultFormat](UIGraphicsImageRendererFormat, "defaultFormat"));
  v21 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v20, v12, v12);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_11500;
  v25[3] = &unk_2E45E0;
  v26 = v19;
  v22 = v19;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "imageWithActions:", v25));

  return v23;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAudiobookControl window](self, "window"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAudiobookControl window](self, "window"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screen"));
    objc_msgSend(v5, "scale");
    v7 = v6;

    -[CAShapeLayer setRasterizationScale:](self->_progressLayer, "setRasterizationScale:", v7);
  }
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    -[BSUIAudiobookControl _updatePlaying](self, "_updatePlaying");
    -[BSUIAudiobookControl _updateProgress](self, "_updateProgress");
  }
}

- (void)_updatePlaying
{
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_playing)
    v3 = CFSTR("audiobook_pause_glyph");
  else
    v3 = CFSTR("audiobook_play_glyph");
  v4 = v3;
  v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v5));
  v11 = (id)objc_claimAutoreleasedReturnValue(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tui_imageNamed:inBundle:](UIImage, "tui_imageNamed:inBundle:", v4, v11));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tui_imageMaskWithColor:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAudiobookControl playPauseButton](self, "playPauseButton"));
  objc_msgSend(v10, "setImage:forState:", v9, 0);

}

- (void)setProgress:(double)a3
{
  double progress;

  progress = self->_progress;
  if (progress != a3)
  {
    self->_progress = a3;
    if (a3 >= 0.01 || progress <= 0.98)
      -[BSUIAudiobookControl _updateProgress](self, "_updateProgress");
    else
      -[BSUIAudiobookControl _animateProgressWipe](self, "_animateProgressWipe");
  }
}

- (void)_animateProgressWipe
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  -[CAShapeLayer setStrokeStart:](self->_progressLayer, "setStrokeStart:", 1.0);
  v8 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("strokeStart")));
  objc_msgSend(v8, "setDuration:", 0.4);
  LODWORD(v3) = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v3));
  objc_msgSend(v8, "setFromValue:", v4);

  LODWORD(v5) = 1.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  objc_msgSend(v8, "setToValue:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  objc_msgSend(v8, "setTimingFunction:", v7);

  objc_msgSend(v8, "setDelegate:", self);
  -[CAShapeLayer addAnimation:forKey:](self->_progressLayer, "addAnimation:forKey:", v8, CFSTR("strokeStartAnimation"));

}

- (void)animationDidStart:(id)a3
{
  -[BSUIAudiobookControl setWipeAnimationInProgress:](self, "setWipeAnimationInProgress:", 1);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  -[CAShapeLayer setPath:](self->_progressLayer, "setPath:", 0, a4);
  -[CAShapeLayer setStrokeStart:](self->_progressLayer, "setStrokeStart:", 0.0);
  -[BSUIAudiobookControl setWipeAnimationInProgress:](self, "setWipeAnimationInProgress:", 0);
}

- (void)_updateProgress
{
  double progress;
  double v4;
  double v5;
  CGPath *Mutable;
  CGFloat Width;
  CGRect v8;

  progress = self->_progress;
  v4 = 0.0;
  if (progress < 0.0 || (v4 = 1.0, progress > 1.0))
    self->_progress = v4;
  if (!-[BSUIAudiobookControl wipeAnimationInProgress](self, "wipeAnimationInProgress"))
  {
    Mutable = CGPathCreateMutable();
    -[BSUIAudiobookControl bounds](self, "bounds");
    Width = CGRectGetWidth(v8);
    CGPathAddArc(Mutable, 0, Width * 0.5, Width * 0.5, Width * 0.5 + -1.0 + -1.0, -1.57079633, (self->_progress + self->_progress) * 3.14159265 + -1.57079633, 0);
    -[CAShapeLayer setPath:](self->_progressLayer, "setPath:", Mutable);
    CGPathRelease(Mutable);
  }
  LODWORD(v5) = 1.0;
  if (!self->_playing)
    *(float *)&v5 = 0.5;
  -[CAShapeLayer setOpacity:](self->_progressLayer, "setOpacity:", v5);
}

- (BSUIAudiobookControlDelegate)delegate
{
  return (BSUIAudiobookControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)playing
{
  return self->_playing;
}

- (TUIUIKitButton)backgroundButton
{
  return self->_backgroundButton;
}

- (void)setBackgroundButton:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundButton, a3);
}

- (UIView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (TUIUIKitButton)playPauseButton
{
  return self->_playPauseButton;
}

- (void)setPlayPauseButton:(id)a3
{
  objc_storeStrong((id *)&self->_playPauseButton, a3);
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressLayer, a3);
}

- (BOOL)wipeAnimationInProgress
{
  return self->_wipeAnimationInProgress;
}

- (void)setWipeAnimationInProgress:(BOOL)a3
{
  self->_wipeAnimationInProgress = a3;
}

- (CGSize)currentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_currentSize.width;
  height = self->_currentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCurrentSize:(CGSize)a3
{
  self->_currentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_backgroundButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
