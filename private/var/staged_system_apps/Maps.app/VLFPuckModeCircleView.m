@implementation VLFPuckModeCircleView

- (VLFPuckModeCircleView)initWithFrame:(CGRect)a3
{
  VLFPuckModeCircleView *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const CGPath *v14;
  const CGPath *CopyByStrokingPath;
  void *v16;
  id v17;
  void *v18;
  UIVisualEffectView *v19;
  UIVisualEffectView *backgroundView;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UIImageView *v26;
  UIImageView *viewFinderImageView;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;
  uint8_t buf[4];
  VLFPuckModeCircleView *v34;
  CGRect v35;

  v32.receiver = self;
  v32.super_class = (Class)VLFPuckModeCircleView;
  v3 = -[VLFPuckModeCircleView initWithFrame:](&v32, "initWithFrame:", 0.0, 0.0, 44.0, 44.0);
  if (v3)
  {
    v4 = sub_100A180D8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v34 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[VLFPuckModeCircleView setBackgroundColor:](v3, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](v3, "layer"));
    LODWORD(v8) = 0;
    objc_msgSend(v7, "setOpacity:", v8);

    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    v10 = objc_msgSend(v9, "CGColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](v3, "layer"));
    objc_msgSend(v11, "setShadowColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](v3, "layer"));
    objc_msgSend(v12, "setShadowOffset:", 0.0, 1.0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](v3, "layer"));
    objc_msgSend(v13, "setShadowRadius:", 4.0);

    v35.size.width = 44.0;
    v35.origin.x = 0.0;
    v35.origin.y = 0.0;
    v35.size.height = 44.0;
    v14 = CGPathCreateWithEllipseInRect(v35, 0);
    CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v14, 0, 4.0, kCGLineCapRound, kCGLineJoinRound, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](v3, "layer"));
    objc_msgSend(v16, "setShadowPath:", CopyByStrokingPath);

    CGPathRelease(CopyByStrokingPath);
    CGPathRelease(v14);
    -[VLFPuckModeCircleView updateShadowForCurrentTraitCollection](v3, "updateShadowForCurrentTraitCollection");
    v17 = objc_alloc((Class)UIVisualEffectView);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 14));
    v19 = (UIVisualEffectView *)objc_msgSend(v17, "initWithEffect:", v18);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v19;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView _setGroupName:](v3->_backgroundView, "_setGroupName:", CFSTR("MapsTheme"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](v3->_backgroundView, "layer"));
    objc_msgSend(v21, "setCornerRadius:", 22.0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](v3->_backgroundView, "layer"));
    objc_msgSend(v22, "setMasksToBounds:", 1);

    -[VLFPuckModeCircleView addSubview:](v3, "addSubview:", v3->_backgroundView);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 27.0));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("location.viewfinder"), v23));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "imageWithRenderingMode:", 2));

    v26 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v25);
    viewFinderImageView = v3->_viewFinderImageView;
    v3->_viewFinderImageView = v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIImageView setTintColor:](v3->_viewFinderImageView, "setTintColor:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIImageView setBackgroundColor:](v3->_viewFinderImageView, "setBackgroundColor:", v29);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_viewFinderImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v3->_backgroundView, "contentView"));
    objc_msgSend(v30, "addSubview:", v3->_viewFinderImageView);

    -[VLFPuckModeCircleView setupConstraints](v3, "setupConstraints");
  }
  return v3;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  VLFPuckModeCircleView *v7;

  v3 = sub_100A180D8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)VLFPuckModeCircleView;
  -[VLFPuckModeCircleView dealloc](&v5, "dealloc");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VLFPuckModeCircleView;
  -[VLFPuckModeCircleView traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[VLFPuckModeCircleView updateShadowForCurrentTraitCollection](self, "updateShadowForCurrentTraitCollection");
}

- (void)startPulsing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  VLFPuckModeCircleView *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView viewFinderImageView](self, "viewFinderImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animationForKey:", CFSTR("transform.scale.xy.repeat")));

  v6 = sub_100A180D8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v12 = 134349056;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] There's already an ongoing pulse animation; ignoring",
        (uint8_t *)&v12,
        0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = 134349056;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Start pulsing", (uint8_t *)&v12, 0xCu);
    }

    v8 = objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView pulseAnimation](self, "pulseAnimation"));
    LODWORD(v9) = 2139095040;
    -[NSObject setRepeatCount:](v8, "setRepeatCount:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView viewFinderImageView](self, "viewFinderImageView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
    objc_msgSend(v11, "addAnimation:forKey:", v8, CFSTR("transform.scale.xy.repeat"));

  }
}

- (void)stopPulsing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  VLFPuckModeCircleView *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView viewFinderImageView](self, "viewFinderImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "animationForKey:", CFSTR("transform.scale.xy.repeat")));

  if (v5)
  {
    v6 = sub_100A180D8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 134349056;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Stop pulsing", (uint8_t *)&v10, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView viewFinderImageView](self, "viewFinderImageView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
    objc_msgSend(v9, "removeAnimationForKey:", CFSTR("transform.scale.xy.repeat"));

  }
}

- (void)pulseOnce
{
  id v3;
  NSObject *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  int v9;
  VLFPuckModeCircleView *v10;

  v3 = sub_100A180D8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v9 = 134349056;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Pulsing once", (uint8_t *)&v9, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView pulseAnimation](self, "pulseAnimation"));
  LODWORD(v6) = 3.0;
  objc_msgSend(v5, "setRepeatCount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView viewFinderImageView](self, "viewFinderImageView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  objc_msgSend(v8, "addAnimation:forKey:", v5, CFSTR("transform.scale.xy.pulse"));

}

- (BOOL)isVisible
{
  void *v2;
  float v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](self, "layer"));
  objc_msgSend(v2, "opacity");
  v4 = fabsf(v3 + -1.0) < 0.00000011921;

  return v4;
}

- (void)show
{
  float v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](self, "layer"));
  objc_msgSend(v4, "opacity");
  -[VLFPuckModeCircleView showWithDuration:startingOpacity:shouldGrow:suppressOtherAnimations:](self, "showWithDuration:startingOpacity:shouldGrow:suppressOtherAnimations:", 1, 0, 0.200000003, v3);

}

- (void)showWithDuration:(double)a3 startingOpacity:(double)a4 shouldGrow:(BOOL)a5 suppressOtherAnimations:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  const char *label;
  const char *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  VLFPuckModeCircleView *v28;
  int v29;
  VLFPuckModeCircleView *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;

  v6 = a6;
  v7 = a5;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v12 = dispatch_queue_get_label(0);
  if (label != v12)
  {
    v13 = !label || v12 == 0;
    if (v13 || strcmp(label, v12))
    {
      v24 = sub_1004318FC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v29 = 136316418;
        v30 = (VLFPuckModeCircleView *)"-[VLFPuckModeCircleView showWithDuration:startingOpacity:shouldGrow:suppressOtherAnimations:]";
        v31 = 2080;
        v32 = "VLFPuckModeCircleView.m";
        v33 = 1024;
        v34 = 145;
        v35 = 2080;
        v36 = "dispatch_get_main_queue()";
        v37 = 2080;
        v38 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v39 = 2080;
        v40 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v29,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v26 = sub_1004318FC();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (VLFPuckModeCircleView *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v29 = 138412290;
          v30 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);

        }
      }
    }
  }
  if (fabs(a4 + -1.0) >= 0.00000011920929
    && !-[VLFPuckModeCircleView isSuppressingAnimations](self, "isSuppressingAnimations"))
  {
    v14 = sub_100A180D8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v29 = 134349056;
      v30 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] Showing VLF puck UI", (uint8_t *)&v29, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (v7)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy")));
      objc_msgSend(v17, "setFromValue:", &off_101270390);
      objc_msgSend(v17, "setToValue:", &off_1012703A8);
      objc_msgSend(v16, "addObject:", v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
    objc_msgSend(v18, "setFromValue:", v19);

    objc_msgSend(v18, "setToValue:", &off_1012703A8);
    objc_msgSend(v16, "addObject:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CAAnimationGroup animation](CAAnimationGroup, "animation"));
    objc_msgSend(v20, "setAnimations:", v16);
    objc_msgSend(v20, "setDuration:", a3);
    if (v6)
    {
      objc_msgSend(v20, "setDelegate:", self);
      -[VLFPuckModeCircleView setSuppressAnimations:](self, "setSuppressAnimations:", 1);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](self, "layer"));
    objc_msgSend(v21, "addAnimation:forKey:", v20, CFSTR("show"));

    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](self, "layer"));
    LODWORD(v23) = 1.0;
    objc_msgSend(v22, "setOpacity:", v23);

    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)hide
{
  float v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](self, "layer"));
  objc_msgSend(v4, "opacity");
  -[VLFPuckModeCircleView hideWithDuration:startingOpacity:shouldShrink:suppressOtherAnimations:](self, "hideWithDuration:startingOpacity:shouldShrink:suppressOtherAnimations:", 1, 0, 0.200000003, v3);

}

- (void)hideWithDuration:(double)a3 startingOpacity:(double)a4 shouldShrink:(BOOL)a5 suppressOtherAnimations:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  const char *label;
  const char *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  VLFPuckModeCircleView *v28;
  int v29;
  VLFPuckModeCircleView *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;

  v6 = a6;
  v7 = a5;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v12 = dispatch_queue_get_label(0);
  if (label != v12)
  {
    v13 = !label || v12 == 0;
    if (v13 || strcmp(label, v12))
    {
      v24 = sub_1004318FC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v29 = 136316418;
        v30 = (VLFPuckModeCircleView *)"-[VLFPuckModeCircleView hideWithDuration:startingOpacity:shouldShrink:suppressOtherAnimations:]";
        v31 = 2080;
        v32 = "VLFPuckModeCircleView.m";
        v33 = 1024;
        v34 = 195;
        v35 = 2080;
        v36 = "dispatch_get_main_queue()";
        v37 = 2080;
        v38 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v39 = 2080;
        v40 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v29,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v26 = sub_1004318FC();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (VLFPuckModeCircleView *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v29 = 138412290;
          v30 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);

        }
      }
    }
  }
  if (fabs(a4) >= 0.00000011920929
    && !-[VLFPuckModeCircleView isSuppressingAnimations](self, "isSuppressingAnimations"))
  {
    v14 = sub_100A180D8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v29 = 134349056;
      v30 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[%{public}p] Hiding VLF puck UI", (uint8_t *)&v29, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (v7)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy")));
      objc_msgSend(v17, "setFromValue:", &off_1012703A8);
      objc_msgSend(v17, "setToValue:", &off_101270390);
      objc_msgSend(v16, "addObject:", v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
    objc_msgSend(v18, "setFromValue:", v19);

    objc_msgSend(v18, "setToValue:", &off_101270390);
    objc_msgSend(v16, "addObject:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CAAnimationGroup animation](CAAnimationGroup, "animation"));
    objc_msgSend(v20, "setAnimations:", v16);
    objc_msgSend(v20, "setDuration:", a3);
    if (v6)
    {
      objc_msgSend(v20, "setDelegate:", self);
      -[VLFPuckModeCircleView setSuppressAnimations:](self, "setSuppressAnimations:", 1);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](self, "layer"));
    objc_msgSend(v21, "addAnimation:forKey:", v20, CFSTR("hide"));

    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](self, "layer"));
    LODWORD(v23) = 0;
    objc_msgSend(v22, "setOpacity:", v23);

    +[CATransaction commit](CATransaction, "commit");
  }
}

- (id)pulseAnimation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy")));
  objc_msgSend(v2, "setValues:", &off_101274208);
  objc_msgSend(v2, "setKeyTimes:", &off_101274220);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionDefault));
  v7[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  v7[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  objc_msgSend(v2, "setTimingFunctions:", v5);

  objc_msgSend(v2, "setDuration:", 1.0);
  objc_msgSend(v2, "setRemovedOnCompletion:", 0);
  return v2;
}

- (void)updateShadowForCurrentTraitCollection
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if ((unint64_t)v4 >= 2)
  {
    if (v4 != (id)2)
      return;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](self, "layer"));
    LODWORD(v6) = 1045220557;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](self, "layer"));
    LODWORD(v6) = 1036831949;
  }
  v7 = v5;
  objc_msgSend(v5, "setShadowOpacity:", v6);

}

- (void)setupConstraints
{
  void *v3;
  void *v4;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[8];

  -[VLFPuckModeCircleView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView widthAnchor](self, "widthAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToConstant:", 44.0));
  v33[0] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView heightAnchor](self, "heightAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView widthAnchor](self, "widthAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:multiplier:", v29, 1.0));
  v33[1] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView backgroundView](self, "backgroundView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView leadingAnchor](self, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v33[2] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView backgroundView](self, "backgroundView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView trailingAnchor](self, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v33[3] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView backgroundView](self, "backgroundView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView topAnchor](self, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v33[4] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView backgroundView](self, "backgroundView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView bottomAnchor](self, "bottomAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v33[5] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView viewFinderImageView](self, "viewFinderImageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView centerXAnchor](self, "centerXAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  v33[6] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView viewFinderImageView](self, "viewFinderImageView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerYAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView centerYAnchor](self, "centerYAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v33[7] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  -[VLFPuckModeCircleView setSuppressAnimations:](self, "setSuppressAnimations:", 0, a4);
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIImageView)viewFinderImageView
{
  return self->_viewFinderImageView;
}

- (void)setViewFinderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_viewFinderImageView, a3);
}

- (BOOL)isSuppressingAnimations
{
  return self->_suppressAnimations;
}

- (void)setSuppressAnimations:(BOOL)a3
{
  self->_suppressAnimations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewFinderImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
