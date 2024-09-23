@implementation RCMPDetailSlider

- (RCMPDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4 maxTrackWidth:(double)a5
{
  RCMPDetailSlider *v9;
  RCMPDetailScrubController *v10;
  RCMPDetailScrubController *scrubController;
  AVTimeFormatter *v12;
  AVTimeFormatter *formatter;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v20;
  void *v21;

  if (a3.size.height < 34.0 && a4 == 3 || a3.size.height == 0.0)
    a3.size.height = 34.0;
  v20.receiver = self;
  v20.super_class = (Class)RCMPDetailSlider;
  v9 = -[RCMPDetailSlider initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v9)
  {
    v10 = -[RCMPDetailScrubController initWithScrubbingControl:]([RCMPDetailScrubController alloc], "initWithScrubbingControl:", v9);
    scrubController = v9->_scrubController;
    v9->_scrubController = v10;

    -[RCMPDetailScrubController setDelegate:](v9->_scrubController, "setDelegate:", v9);
    -[RCMPDetailScrubController setDetailedScrubbingEnabled:](v9->_scrubController, "setDetailedScrubbingEnabled:", 1);
    v9->_allowsScrubbing = 1;
    v9->_maxTrackWidth = a5;
    v9->_style = a4;
    v9->_minTimeLabelWidth = 41.0;
    -[RCMPDetailSlider _setupControlsForStyle](v9, "_setupControlsForStyle");
    -[RCMPDetailSlider setDeliversTouchesForGesturesToSuperview:](v9, "setDeliversTouchesForGesturesToSuperview:", 0);
    -[RCMPDetailSlider setSemanticContentAttribute:](v9, "setSemanticContentAttribute:", 1);
    v12 = objc_opt_new(AVTimeFormatter);
    formatter = v9->_formatter;
    v9->_formatter = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v9, "didChangePreferredContentSize", UIContentSizeCategoryDidChangeNotification, 0);

    v15 = objc_opt_self(UITraitUserInterfaceStyle);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v21 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v18 = -[RCMPDetailSlider registerForTraitChanges:withAction:](v9, "registerForTraitChanges:withAction:", v17, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v9;
}

- (RCMPDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  return -[RCMPDetailSlider initWithFrame:style:maxTrackWidth:](self, "initWithFrame:style:maxTrackWidth:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (RCMPDetailSlider)initWithFrame:(CGRect)a3
{
  return -[RCMPDetailSlider initWithFrame:style:maxTrackWidth:](self, "initWithFrame:style:maxTrackWidth:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_autoscrubTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)RCMPDetailSlider;
  -[RCMPDetailSlider dealloc](&v3, "dealloc");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  UILabel *currentTimeLabel;
  UILabel *currentTimeInverseLabel;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  uint64_t v15;
  void *v16;
  UILabel *v17;
  UILabel *v18;
  UILabel *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MinX;
  CGFloat MaxY;
  uint64_t v29;
  UILabel *v30;
  UILabel *v31;
  UILabel *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double MaxX;
  double v44;
  double v45;
  void *v46;
  CGFloat rect;
  objc_super v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  -[RCMPDetailSlider bounds](self, "bounds");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider traitCollection](self, "traitCollection"));
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  if (v5 < 0.00000011920929)
    v5 = UIMainScreenScale();
  if (self->_timeLabelStyle == 1)
  {
    -[UILabel removeFromSuperview](self->_currentTimeLabel, "removeFromSuperview");
    currentTimeLabel = self->_currentTimeLabel;
    self->_currentTimeLabel = 0;

    -[UILabel removeFromSuperview](self->_currentTimeInverseLabel, "removeFromSuperview");
    currentTimeInverseLabel = self->_currentTimeInverseLabel;
    self->_currentTimeInverseLabel = 0;
  }
  else
  {
    -[RCMPDetailSlider bounds](self, "bounds");
    -[RCMPDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    rect = v14;
    currentTimeInverseLabel = (UILabel *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider timeLabelFontForStyle:](self, "timeLabelFontForStyle:", self->_style));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider timeLabelTextColorForStyle:](self, "timeLabelTextColorForStyle:", self->_style));
    v17 = self->_currentTimeLabel;
    if (!v17)
    {
      v18 = (UILabel *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(self, v15), "labelClass")), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v19 = self->_currentTimeLabel;
      self->_currentTimeLabel = v18;

      -[UILabel setBackgroundColor:](self->_currentTimeLabel, "setBackgroundColor:", 0);
      -[UILabel setFont:](self->_currentTimeLabel, "setFont:", currentTimeInverseLabel);
      -[UILabel setLineBreakMode:](self->_currentTimeLabel, "setLineBreakMode:", 2);
      -[UILabel setOpaque:](self->_currentTimeLabel, "setOpaque:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider _stringForCurrentTime:](self, "_stringForCurrentTime:", NAN));
      v21 = RCLocalizationNotNeeded();
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      -[UILabel setText:](self->_currentTimeLabel, "setText:", v22);

      -[UILabel setTextAlignment:](self->_currentTimeLabel, "setTextAlignment:", 2);
      -[UILabel setTextColor:](self->_currentTimeLabel, "setTextColor:", v16);
      -[RCMPDetailSlider addSubview:](self, "addSubview:", self->_currentTimeLabel);
      v17 = self->_currentTimeLabel;
    }
    -[UILabel setAdjustsFontForContentSizeCategory:](v17, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel sizeToFit](self->_currentTimeLabel, "sizeToFit");
    UIRectCenteredYInRectScale(-[UILabel frame](self->_currentTimeLabel, "frame"));
    v24 = v23;
    v26 = v25;
    v49.origin.x = v9;
    v49.origin.y = v11;
    v49.size.width = v13;
    v49.size.height = rect;
    MinX = CGRectGetMinX(v49);
    v50.origin.x = v9;
    v50.origin.y = v11;
    v50.size.width = v13;
    v50.size.height = rect;
    MaxY = CGRectGetMaxY(v50);
    UIRectIntegralWithScale(MinX, MaxY + 5.0, v24, v26, v5);
    -[UILabel setFrame:](self->_currentTimeLabel, "setFrame:");
    v30 = self->_currentTimeInverseLabel;
    if (!v30)
    {
      v31 = (UILabel *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(self, v29), "labelClass")), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v32 = self->_currentTimeInverseLabel;
      self->_currentTimeInverseLabel = v31;

      -[UILabel setBackgroundColor:](self->_currentTimeInverseLabel, "setBackgroundColor:", 0);
      -[UILabel setFont:](self->_currentTimeInverseLabel, "setFont:", currentTimeInverseLabel);
      -[UILabel setLineBreakMode:](self->_currentTimeInverseLabel, "setLineBreakMode:", 2);
      -[UILabel setOpaque:](self->_currentTimeInverseLabel, "setOpaque:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider _stringForInverseCurrentTime:](self, "_stringForInverseCurrentTime:", NAN));
      v34 = RCLocalizationNotNeeded();
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      -[UILabel setText:](self->_currentTimeInverseLabel, "setText:", v35);

      -[UILabel setTextAlignment:](self->_currentTimeInverseLabel, "setTextAlignment:", 0);
      -[UILabel setTextColor:](self->_currentTimeInverseLabel, "setTextColor:", v16);
      -[RCMPDetailSlider addSubview:](self, "addSubview:", self->_currentTimeInverseLabel);
      v30 = self->_currentTimeInverseLabel;
    }
    -[UILabel setAdjustsFontForContentSizeCategory:](v30, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel sizeToFit](self->_currentTimeInverseLabel, "sizeToFit");
    v36 = UIRectCenteredYInRectScale(-[UILabel frame](self->_currentTimeInverseLabel, "frame"));
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v51.origin.x = v9;
    v51.origin.y = v11;
    v51.size.width = v13;
    v51.size.height = rect;
    MaxX = CGRectGetMaxX(v51);
    v52.origin.x = v36;
    v52.origin.y = v38;
    v52.size.width = v40;
    v52.size.height = v42;
    v44 = MaxX - CGRectGetWidth(v52);
    -[UILabel frame](self->_currentTimeLabel, "frame");
    UIRectIntegralWithScale(v44, v45, v40, v42, v5);
    -[UILabel setFrame:](self->_currentTimeInverseLabel, "setFrame:");

  }
  -[RCMPDetailSlider _updateTrackInset](self, "_updateTrackInset");
  v48.receiver = self;
  v48.super_class = (Class)RCMPDetailSlider;
  -[RCMPDetailSlider layoutSubviews](&v48, "layoutSubviews");
  if ((unint64_t)(self->_style - 3) <= 1)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider _maxTrackView](self, "_maxTrackView"));
    objc_msgSend(v46, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);

    -[UILabel _setDrawsAsBackdropOverlayWithBlendMode:](self->_currentTimeLabel, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
    -[UILabel _setDrawsAsBackdropOverlayWithBlendMode:](self->_currentTimeInverseLabel, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double currentTime;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[RCMPDetailSlider bounds](self, "bounds");
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  if (!CGRectEqualToRect(v10, v11))
  {
    v9.receiver = self;
    v9.super_class = (Class)RCMPDetailSlider;
    -[RCMPDetailSlider setBounds:](&v9, "setBounds:", x, y, width, height);
    currentTime = self->_currentTime;
    *(float *)&currentTime = currentTime;
    -[RCMPDetailSlider setValue:](self, "setValue:", currentTime);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double currentTime;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[RCMPDetailSlider frame](self, "frame");
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  if (!CGRectEqualToRect(v10, v11))
  {
    v9.receiver = self;
    v9.super_class = (Class)RCMPDetailSlider;
    -[RCMPDetailSlider setFrame:](&v9, "setFrame:", x, y, width, height);
    currentTime = self->_currentTime;
    *(float *)&currentTime = currentTime;
    -[RCMPDetailSlider setValue:](self, "setValue:", currentTime);
  }
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCMPDetailSlider;
  -[RCMPDetailSlider tintColorDidChange](&v3, "tintColorDidChange");
  if (self->_style == 5)
    -[RCMPDetailSlider _setupControlsForStyle](self, "_setupControlsForStyle");
}

- (id)viewForFirstBaselineLayout
{
  return self->_currentTimeLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_currentTimeLabel;
}

- (id)createThumbView
{
  UIImageView *v3;
  UIImageView *thumbImageView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCMPDetailSlider;
  v3 = -[RCMPDetailSlider createThumbView](&v6, "createThumbView");
  thumbImageView = self->_thumbImageView;
  self->_thumbImageView = v3;

  return self->_thumbImageView;
}

- (id)currentThumbImage
{
  UIImageView *glowDetailScrubImageView;
  UIImageView *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  UIImageView *v11;
  UIImageView *v12;
  UIImageView *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  if ((unint64_t)(self->_style - 1) >= 5)
  {
    if (self->_isTracking
      && -[RCMPDetailScrubController detailedScrubbingEnabled](self->_scrubController, "detailedScrubbingEnabled")
      && -[RCMPDetailScrubController durationAllowsForDetailedScrubbing](self->_scrubController, "durationAllowsForDetailedScrubbing"))
    {
      glowDetailScrubImageView = self->_glowDetailScrubImageView;
      if (!glowDetailScrubImageView)
      {
        v6 = objc_alloc((Class)UIImageView);
        v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("scrubberglow"), v9));
        v11 = (UIImageView *)objc_msgSend(v6, "initWithImage:", v10);
        v12 = self->_glowDetailScrubImageView;
        self->_glowDetailScrubImageView = v11;

        v13 = self->_glowDetailScrubImageView;
        -[UIImageView bounds](v13, "bounds");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v22 = -[UIImageView bounds](self->_thumbImageView, "bounds");
        v30.origin.x = UIRectCenteredIntegralRect(v22, v15, v17, v19, v21, v23, v24, v25, v26);
        v31 = CGRectOffset(v30, 0.0, -1.0);
        -[UIImageView setFrame:](v13, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
        glowDetailScrubImageView = self->_glowDetailScrubImageView;
      }
      -[UIImageView addSubview:](self->_thumbImageView, "addSubview:", glowDetailScrubImageView);
    }
    else
    {
      v4 = self->_glowDetailScrubImageView;
      if (v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v4, "layer"));
        objc_msgSend(v5, "removeAllAnimations");

        -[UIImageView removeFromSuperview](self->_glowDetailScrubImageView, "removeFromSuperview");
      }
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)RCMPDetailSlider;
  v27 = -[RCMPDetailSlider currentThumbImage](&v29, "currentThumbImage");
  return (id)objc_claimAutoreleasedReturnValue(v27);
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double trackInset;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[RCMPDetailSlider _updateTrackInset](self, "_updateTrackInset");
  v14.receiver = self;
  v14.super_class = (Class)RCMPDetailSlider;
  -[RCMPDetailSlider trackRectForBounds:](&v14, "trackRectForBounds:", x, y, width, height);
  v8 = v15.origin.x;
  v9 = v15.origin.y;
  v10 = v15.size.width;
  v11 = v15.size.height;
  v12 = CGRectGetWidth(v15);
  trackInset = self->_trackInset;
  if (v12 <= trackInset + trackInset)
  {
    result.origin.x = CGRectZero.origin.x;
    result.origin.y = CGRectZero.origin.y;
    result.size.width = CGRectZero.size.width;
    result.size.height = CGRectZero.size.height;
  }
  else
  {
    v16.origin.x = v8;
    v16.origin.y = v9;
    v16.size.width = v10;
    v16.size.height = v11;
    return CGRectInset(v16, trackInset, 0.0);
  }
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  uint64_t v6;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  CGFloat x;
  double v19;
  CGFloat y;
  double v21;
  CGFloat width;
  double v23;
  CGFloat height;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  v31.receiver = self;
  v31.super_class = (Class)RCMPDetailSlider;
  -[RCMPDetailSlider thumbRectForBounds:trackRect:value:](&v31, "thumbRectForBounds:trackRect:value:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, LODWORD(a5));
  if ((unint64_t)(self->_style - 3) > 1)
  {
    v25 = 1.0;
    if (a5 < 0.5)
      v25 = -1.0;
    v33 = CGRectOffset(*(CGRect *)&v6, v25, 0.0);
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
  }
  else
  {
    v10 = 0.0;
    if (a5 < 0.5)
      v10 = -1.0;
    v32 = CGRectOffset(*(CGRect *)&v6, v10, 0.5);
    v11 = v32.origin.x;
    v12 = v32.origin.y;
    v13 = v32.size.width;
    v14 = v32.size.height;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider traitCollection](self, "traitCollection"));
    objc_msgSend(v15, "displayScale");
    v17 = v16;
    if (v16 == 0.0)
      v17 = UIMainScreenScale();
    x = UIRectIntegralWithScale(v11, v12, v13, v14, v17);
    y = v19;
    width = v21;
    height = v23;

  }
  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  -[RCMPDetailSlider setValue:duration:](self, "setValue:duration:", a4);
}

- (void)setValue:(float)a3 duration:(double)a4
{
  if (!self->_isTracking)
    -[RCMPDetailSlider _setValueWhileTracking:duration:](self, "_setValueWhileTracking:duration:");
}

- (void)_setValueWhileTracking:(float)a3 duration:(double)a4
{
  double duration;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[5];
  float v17;

  duration = self->_duration;
  if (duration > 0.0)
  {
    v7 = fmax(a3, 0.0);
    if (duration < v7)
      v7 = self->_duration;
    v8 = v7;
    v9 = v8;
    v10 = v8 / duration;
    -[RCMPDetailSlider bounds](self, "bounds");
    if (vabdd_f64(1.0, v10) < 1.0 / v11)
      v10 = 1.0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider layer](self, "layer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "animationKeys"));
    v14 = objc_msgSend(v13, "count");

    if (v14)
      v15 = 196640;
    else
      v15 = 196644;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000913D4;
    v16[3] = &unk_1001AD1F8;
    v17 = v10;
    v16[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v15, v16, 0, a4, 0.0);
    -[RCMPDetailSlider _updateForAvailableDuraton](self, "_updateForAvailableDuraton");
    -[RCMPDetailSlider _updateTimeDisplayForTime:](self, "_updateTimeDisplayForTime:", v9);
    if (self->_isTracking && self->_canCommit)
      -[RCMPDetailSlider _commitValue](self, "_commitValue");
  }
}

- (UIEdgeInsets)_thumbHitEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -19.0;
  v3 = -19.0;
  v4 = -19.0;
  v5 = -19.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_beginTracking
{
  RCMPDetailSliderDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  if (!self->_isTracking)
  {
    self->_isTracking = 1;
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector(WeakRetained, "detailSliderTrackingDidBegin:");

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v6, "detailSliderTrackingDidBegin:", self);

    }
  }
}

- (CGRect)thumbHitRect
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
  int v19;
  uint64_t v20;
  CGRect v21;

  -[RCMPDetailSlider bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[RCMPDetailSlider bounds](self, "bounds");
  -[RCMPDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[RCMPDetailSlider value](self, "value");
  LODWORD(v20) = v19;
  -[RCMPDetailSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v14, v16, v18, v20);
  return CGRectInset(v21, -19.0, -19.0);
}

- (void)detailScrubController:(id)a3 didChangeScrubSpeed:(int64_t)a4
{
  RCMPDetailSliderDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector(WeakRetained, "detailSlider:didChangeScrubSpeed:");

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "detailSlider:didChangeScrubSpeed:", self, a4);

  }
}

- (void)detailScrubController:(id)a3 didChangeValue:(float)a4
{
  -[RCMPDetailSlider _setValueWhileTracking:duration:](self, "_setValueWhileTracking:duration:", a3);
  -[RCMPDetailSlider _commitValue](self, "_commitValue");
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  BOOL v5;

  v5 = -[RCMPDetailScrubController beginTrackingWithTouch:withEvent:](self->_scrubController, "beginTrackingWithTouch:withEvent:", a3, a4);
  -[RCMPDetailSlider _beginTracking](self, "_beginTracking");
  return v5;
}

- (void)_autoscrubTick:(id)a3
{
  float v4;
  float v5;
  float v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  double v24;
  CGRect v25;
  CGRect v26;

  -[RCMPDetailSlider maximumValue](self, "maximumValue", a3);
  v5 = v4;
  -[RCMPDetailSlider minimumValue](self, "minimumValue");
  v7 = (float)(v5 - v6);
  -[RCMPDetailSlider bounds](self, "bounds");
  -[RCMPDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
  v8 = v7 / CGRectGetWidth(v25);
  -[RCMPDetailScrubController scaleForVerticalPosition:](self->_scrubController, "scaleForVerticalPosition:", self->_previousLocationInView.y);
  v10 = v9;
  v11 = v8 * v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider window](self, "window"));
  -[RCMPDetailSlider convertPoint:toView:](self, "convertPoint:toView:", v12, self->_previousLocationInView.x, self->_previousLocationInView.y);
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider window](self, "window"));
  objc_msgSend(v15, "bounds");
  if (v14 >= CGRectGetMidX(v26))
    v16 = v11;
  else
    v16 = -(v8 * v10);
  v17 = v16;

  self->_canCommit = 1;
  -[RCMPDetailSlider minimumValue](self, "minimumValue");
  v19 = v18;
  -[RCMPDetailSlider maximumValue](self, "maximumValue");
  v21 = v20;
  -[RCMPDetailSlider value](self, "value");
  v23 = v22 + v17;
  if (v21 < v23)
    v23 = v21;
  if (v19 >= v23)
    v23 = v19;
  v24 = self->_duration * v23;
  *(float *)&v24 = v24;
  -[RCMPDetailSlider setValue:animated:](self, "setValue:animated:", 0, v24);
  if (-[RCMPDetailSlider isContinuous](self, "isContinuous"))
    -[RCMPDetailSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;
  uint64_t v22;
  double Width;
  _BOOL4 v27;
  UIImageView *thumbImageView;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  float v35;
  double v36;
  NSTimer *v37;
  NSTimer *autoscrubTimer;
  BOOL v39;
  void *v40;
  NSTimer *v41;
  float v42;
  int v43;
  UIAccessibilityNotifications v44;
  void *v45;
  _BOOL4 autoscrubActive;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "locationInView:", self);
  v9 = v8;
  v11 = v10;
  if (-[RCMPDetailScrubController detailedScrubbingEnabled](self->_scrubController, "detailedScrubbingEnabled")
    && -[RCMPDetailScrubController durationAllowsForDetailedScrubbing](self->_scrubController, "durationAllowsForDetailedScrubbing"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider window](self, "window"));
    -[RCMPDetailSlider convertPoint:toView:](self, "convertPoint:toView:", v12, v9, v11);
    v14 = v13;
    v16 = v15;
    autoscrubActive = self->_autoscrubActive;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "window"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "windowScene"));
    v21 = (char *)objc_msgSend(v20, "interfaceOrientation") - 3;

    if ((unint64_t)v21 < 2)
      v14 = v16;
    objc_msgSend(v12, "bounds");
    if ((unint64_t)v21 > 1)
    {
      Width = CGRectGetWidth(*(CGRect *)&v22);
      if (v12)
      {
LABEL_7:
        v27 = v14 < 20.0;
        Width = Width + -20.0;
        if (v14 > Width)
          v27 = 1;
        self->_autoscrubActive = v27;
        if (v27)
        {
          thumbImageView = self->_thumbImageView;
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider currentThumbImage](self, "currentThumbImage"));
          -[UIImageView setImage:](thumbImageView, "setImage:", v29);

          if (!autoscrubActive)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
            LODWORD(v31) = 0;
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v31));
            objc_msgSend(v30, "setToValue:", v32);

            objc_msgSend(v30, "setDuration:", 0.25);
            LODWORD(v33) = 2139095039;
            objc_msgSend(v30, "setRepeatCount:", v33);
            objc_msgSend(v30, "setAutoreverses:", 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_glowDetailScrubImageView, "layer"));
            objc_msgSend(v34, "addAnimation:forKey:", v30, CFSTR("pulseAnimation"));

          }
          -[RCMPDetailSlider value](self, "value");
          v36 = self->_duration * v35;
          *(float *)&v36 = v36;
          -[RCMPDetailSlider _setValueWhileTracking:duration:](self, "_setValueWhileTracking:duration:", v36, 0.0);
          if (-[RCMPDetailSlider isContinuous](self, "isContinuous"))
            -[RCMPDetailSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
          if (!self->_autoscrubTimer)
          {
            v37 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_autoscrubTick:", 0, 1, 0.1));
            autoscrubTimer = self->_autoscrubTimer;
            self->_autoscrubTimer = v37;

          }
          self->_previousLocationInView.x = v9;
          self->_previousLocationInView.y = v11;

          v39 = 1;
          goto LABEL_28;
        }
        goto LABEL_19;
      }
    }
    else
    {
      Width = CGRectGetHeight(*(CGRect *)&v22);
      if (v12)
        goto LABEL_7;
    }
    self->_autoscrubActive = 0;
LABEL_19:
    if (self->_autoscrubTimer)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_glowDetailScrubImageView, "layer", Width));
      objc_msgSend(v40, "removeAnimationForKey:", CFSTR("pulseAnimation"));

      -[NSTimer invalidate](self->_autoscrubTimer, "invalidate");
      v41 = self->_autoscrubTimer;
      self->_autoscrubTimer = 0;

    }
  }
  if (-[RCMPDetailSlider isContinuous](self, "isContinuous"))
    -[RCMPDetailSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  v39 = -[RCMPDetailScrubController continueTrackingWithTouch:withEvent:](self->_scrubController, "continueTrackingWithTouch:withEvent:", v6, v7);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[RCMPDetailSlider value](self, "value");
    v43 = LODWORD(v42);
    if (vabds_f32(v42, *(float *)&dword_1001ED960) > 0.02
      || CFAbsoluteTimeGetCurrent() - *(double *)&qword_1001ED968 > 5.0)
    {
      v44 = UIAccessibilityAnnouncementNotification;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider accessibilityValue](self, "accessibilityValue"));
      UIAccessibilityPostNotification(v44, v45);

      dword_1001ED960 = v43;
      qword_1001ED968 = CFAbsoluteTimeGetCurrent();
    }
  }
LABEL_28:

  return v39;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  NSTimer *autoscrubTimer;
  id v7;
  id v8;
  NSTimer *v9;
  id WeakRetained;
  id v11;

  autoscrubTimer = self->_autoscrubTimer;
  v7 = a4;
  v8 = a3;
  -[NSTimer invalidate](autoscrubTimer, "invalidate");
  v9 = self->_autoscrubTimer;
  self->_autoscrubTimer = 0;

  self->_autoscrubActive = 0;
  self->_isTracking = 0;
  -[RCMPDetailSlider _resetScrubInfo](self, "_resetScrubInfo");
  -[RCMPDetailScrubController endTrackingWithTouch:withEvent:](self->_scrubController, "endTrackingWithTouch:withEvent:", v8, v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v7) = objc_opt_respondsToSelector(WeakRetained, "detailSliderTrackingDidEnd:");

  if ((v7 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "detailSliderTrackingDidEnd:", self);

  }
}

- (void)cancelTrackingWithEvent:(id)a3
{
  -[RCMPDetailScrubController cancelTrackingWithEvent:](self->_scrubController, "cancelTrackingWithEvent:", a3);
  -[RCMPDetailSlider cancelTracking](self, "cancelTracking");
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

+ (Class)labelClass
{
  return (Class)objc_opt_class(UILabel, a2);
}

- (BOOL)allowsDetailScrubbing
{
  return -[RCMPDetailScrubController detailedScrubbingEnabled](self->_scrubController, "detailedScrubbingEnabled");
}

- (BOOL)detailScrubbingAvailableForCurrentDuration
{
  return -[RCMPDetailScrubController durationAllowsForDetailedScrubbing](self->_scrubController, "durationAllowsForDetailedScrubbing");
}

- (void)cancelTracking
{
  NSTimer *autoscrubTimer;
  _BOOL4 isTracking;
  id WeakRetained;
  char v6;
  id v7;

  -[NSTimer invalidate](self->_autoscrubTimer, "invalidate");
  autoscrubTimer = self->_autoscrubTimer;
  self->_autoscrubTimer = 0;

  self->_autoscrubActive = 0;
  isTracking = self->_isTracking;
  self->_isTracking = 0;
  -[RCMPDetailSlider _resetScrubInfo](self, "_resetScrubInfo");
  if (isTracking)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector(WeakRetained, "detailSliderTrackingDidCancel:");

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "detailSliderTrackingDidCancel:", self);

    }
  }
}

- (void)setAllowsScrubbing:(BOOL)a3
{
  if (self->_allowsScrubbing != a3)
  {
    self->_allowsScrubbing = a3;
    if (self->_style == 5)
    {
      -[RCMPDetailSlider _setupControlsForStyle](self, "_setupControlsForStyle");
      *(_QWORD *)&a3 = self->_allowsScrubbing;
    }
    -[RCMPDetailSlider setUserInteractionEnabled:](self, "setUserInteractionEnabled:", a3);
  }
}

- (void)setAllowsDetailScrubbing:(BOOL)a3
{
  -[RCMPDetailScrubController setDetailedScrubbingEnabled:](self->_scrubController, "setDetailedScrubbingEnabled:", a3);
}

- (void)setAvailableDuration:(double)duration
{
  if (self->_duration <= duration)
    duration = self->_duration;
  if (vabdd_f64(duration, self->_availableDuration) > 2.22044605e-16)
  {
    self->_availableDuration = duration;
    -[RCMPDetailSlider _updateForAvailableDuraton](self, "_updateForAvailableDuraton");
  }
}

- (void)setDuration:(double)a3
{
  double currentTime;
  double v5;
  CGRect v6;

  if (vabdd_f64(self->_duration, a3) > 2.22044605e-16)
  {
    self->_duration = a3;
    -[RCMPDetailScrubController setDuration:](self->_scrubController, "setDuration:");
    currentTime = self->_currentTime;
    if (currentTime >= self->_duration)
      currentTime = self->_duration;
    self->_currentTime = fmax(currentTime, 0.0);
    -[RCMPDetailSlider frame](self, "frame");
    if (!CGRectIsEmpty(v6))
      -[RCMPDetailSlider layoutSubviews](self, "layoutSubviews");
    v5 = self->_currentTime;
    *(float *)&v5 = v5;
    -[RCMPDetailSlider setValue:animated:](self, "setValue:animated:", 0, v5);
    -[RCMPDetailSlider setAvailableDuration:](self, "setAvailableDuration:", self->_duration);
    -[RCMPDetailSlider _updateTimeDisplayForTime:force:](self, "_updateTimeDisplayForTime:force:", 1, self->_currentTime);
  }
}

- (void)setMinTimeLabelWidth:(double)a3
{
  if (self->_minTimeLabelWidth != a3)
  {
    self->_minTimeLabelWidth = a3;
    -[RCMPDetailSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTimeLabelStyle:(int64_t)a3
{
  if (self->_timeLabelStyle != a3)
  {
    self->_timeLabelStyle = a3;
    -[RCMPDetailSlider _setupControlsForStyle](self, "_setupControlsForStyle");
    -[RCMPDetailSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)timeLabelFontForStyle:(int64_t)a3
{
  int64_t style;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];
  void *v17;
  UIFontDescriptorAttributeName v18;
  void *v19;

  style = self->_style;
  if ((unint64_t)(style - 1) < 2)
  {
    v5 = 12.0;
  }
  else
  {
    if ((unint64_t)(style - 3) < 2)
    {
      v4 = 13.0;
LABEL_9:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", a3, v4));
      goto LABEL_10;
    }
    if (style != 5)
    {
      v4 = 14.0;
      goto LABEL_9;
    }
    v5 = 10.0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", a3, v5));
LABEL_10:
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fontDescriptor"));
  v18 = UIFontDescriptorFeatureSettingsAttribute;
  v15[0] = UIFontFeatureTypeIdentifierKey;
  v15[1] = UIFontFeatureSelectorIdentifierKey;
  v16[0] = &off_1001B7378;
  v16[1] = &off_1001B7390;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
  v17 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v19 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontDescriptorByAddingAttributes:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v12, 0.0));
  return v13;
}

- (id)timeLabelTextColorForStyle:(int64_t)a3
{
  void *v3;

  if ((unint64_t)(self->_style - 3) > 1)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor", a3));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", a3, 1.0, 0.45));
  return v3;
}

- (id)_modernThumbImageWithColor:(id)a3 height:(double)a4 includeShadow:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  double v10;
  double v11;
  CGContext *CurrentContext;
  id v13;
  CGColor *v14;
  void *v15;
  UIImage *ImageFromCurrentImageContext;
  void *v17;
  CGSize v19;
  CGSize v20;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider traitCollection](self, "traitCollection"));
  objc_msgSend(v9, "displayScale");
  v11 = v10;
  if (v10 == 0.0)
    v11 = UIMainScreenScale();
  v19.width = a4;
  v19.height = a4;
  UIGraphicsBeginImageContextWithOptions(v19, 0, v11);

  if (v5)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.1)));
    v14 = (CGColor *)objc_msgSend(v13, "CGColor");
    v20.width = CGSizeZero.width;
    v20.height = CGSizeZero.height;
    CGContextSetShadowWithColor(CurrentContext, v20, 2.0, v14);

  }
  objc_msgSend(v8, "setFill");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, a4, a4, a4 * 0.5));
  objc_msgSend(v15, "fill");

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v17;
}

- (id)_colorSliceImageWithColor:(id)a3 height:(double)a4
{
  CGFloat v5;
  id v6;
  void *v7;
  UIImage *ImageFromCurrentImageContext;
  void *v9;
  void *v10;
  CGSize v12;

  v5 = a4 * 3.0;
  v6 = a3;
  v12.width = v5;
  v12.height = a4;
  UIGraphicsBeginImageContext(v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v5, a4, a4 * 0.5));
  objc_msgSend(v6, "setFill");

  objc_msgSend(v7, "fill");
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stretchableImageWithLeftCapWidth:topCapHeight:", (uint64_t)a4, (uint64_t)(a4 * 0.5)));

  return v10;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = objc_msgSend(v5, "userInterfaceStyle");

  if (v7 != v8)
    -[RCMPDetailSlider _setupControlsForStyle](self, "_setupControlsForStyle");
}

- (void)_setupControlsForStyle
{
  UIImage *ImageFromCurrentImageContext;
  void *v4;
  char v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  CGSize v16;

  if (self->_timeLabelStyle == 3)
  {
    v16.width = 1.0;
    v16.height = 1.0;
    UIGraphicsBeginImageContextWithOptions(v16, 0, 0.0);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v4 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
    -[RCMPDetailSlider setThumbImage:forState:](self, "setThumbImage:forState:", v4, 0);

    v5 = 1;
  }
  else
  {
    if (self->_style == 5)
      -[RCMPDetailSlider duration](self, "duration");
    v5 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (self->_style == 5)
  {
    v15 = v6;
    if ((v5 & 1) == 0)
    {
      v7 = -[RCMPDetailSlider allowsScrubbing](self, "allowsScrubbing");
      if (v7)
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sliderThumbTintColor"));
      else
        v8 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider _modernThumbImageWithColor:height:includeShadow:](self, "_modernThumbImageWithColor:height:includeShadow:", v8, v7, 7.0));
      -[RCMPDetailSlider setThumbImage:forState:](self, "setThumbImage:forState:", v10, 0);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "minTrackTintColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider _colorSliceImageWithColor:height:](self, "_colorSliceImageWithColor:height:", v11, 3.0));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "maxTrackTintColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider _colorSliceImageWithColor:height:](self, "_colorSliceImageWithColor:height:", v13, 3.0));

    -[RCMPDetailSlider setMinimumTrackImage:forState:](self, "setMinimumTrackImage:forState:", v12, 0);
    -[RCMPDetailSlider setMaximumTrackImage:forState:](self, "setMaximumTrackImage:forState:", v14, 0);

    v6 = v15;
  }

}

- (void)_updateTrackInset
{
  double v2;

  v2 = 4.0;
  if (self->_style == 5)
    v2 = 0.0;
  self->_trackInset = v2;
}

- (void)_updateTimeDisplayForTime:(double)a3
{
  -[RCMPDetailSlider _updateTimeDisplayForTime:force:](self, "_updateTimeDisplayForTime:force:", 0, a3);
}

- (void)_updateTimeDisplayForTime:(double)a3 force:(BOOL)a4
{
  double v5;
  UILabel *currentTimeLabel;
  void *v7;
  uint64_t v8;
  void *v9;
  UILabel *currentTimeInverseLabel;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = floor(a3);
  if (a4 || vabdd_f64(self->_currentTime, v5) > 2.22044605e-16)
  {
    if (self->_timeLabelStyle != 1)
    {
      currentTimeLabel = self->_currentTimeLabel;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider _stringForCurrentTime:](self, "_stringForCurrentTime:", v5));
      v8 = RCLocalizationNotNeeded();
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      -[UILabel setText:](currentTimeLabel, "setText:", v9);

      currentTimeInverseLabel = self->_currentTimeInverseLabel;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider _stringForInverseCurrentTime:](self, "_stringForInverseCurrentTime:", self->_duration - v5));
      v12 = RCLocalizationNotNeeded();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      -[UILabel setText:](currentTimeInverseLabel, "setText:", v13);

      -[RCMPDetailSlider setNeedsLayout](self, "setNeedsLayout");
    }
    self->_currentTime = v5;
  }
}

- (id)_stringForTime:(double)a3 elapsed:(BOOL)a4
{
  AVTimeFormatter *formatter;
  uint64_t v7;

  formatter = self->_formatter;
  if (a4)
    v7 = 1;
  else
    v7 = 2;
  -[AVTimeFormatter setStyle:](formatter, "setStyle:", v7);
  return -[AVTimeFormatter stringFromSeconds:](self->_formatter, "stringFromSeconds:", a3);
}

- (id)_stringForCurrentTime:(double)a3
{
  int64_t timeLabelStyle;

  timeLabelStyle = self->_timeLabelStyle;
  if (timeLabelStyle == 3 || timeLabelStyle == 2 && vabdd_f64(self->_duration, a3) < 30.0)
    return CFSTR("--:--");
  else
    return (id)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider _stringForTime:elapsed:](self, "_stringForTime:elapsed:", 1, a3));
}

- (id)_stringForInverseCurrentTime:(double)a3
{
  int64_t timeLabelStyle;
  double v4;
  BOOL v5;
  __CFString *v6;

  timeLabelStyle = self->_timeLabelStyle;
  if (timeLabelStyle == 3 || ((v4 = fabs(a3), timeLabelStyle == 2) ? (v5 = v4 < 30.0) : (v5 = 0), v5))
    v6 = CFSTR("Live");
  else
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider _stringForTime:elapsed:](self, "_stringForTime:elapsed:", 0, a3, v4));
  return v6;
}

- (void)_resetScrubInfo
{
  UIImageView *thumbImageView;
  void *v4;
  id v5;

  thumbImageView = self->_thumbImageView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCMPDetailSlider currentThumbImage](self, "currentThumbImage"));
  -[UIImageView setImage:](thumbImageView, "setImage:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_glowDetailScrubImageView, "layer"));
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("pulseAnimation"));

}

- (void)_commitValue
{
  RCMPDetailSliderDelegate **p_delegate;
  id WeakRetained;
  char v5;
  float v6;
  double v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "detailSlider:didChangeValue:");

  if ((v5 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    -[RCMPDetailSlider value](self, "value");
    v7 = self->_duration * v6;
    *(float *)&v7 = v7;
    objc_msgSend(v8, "detailSlider:didChangeValue:", self, v7);

  }
}

- (void)_updateForAvailableDuraton
{
  if (!self->_thumbImageView)
  {
    -[RCMPDetailSlider setNeedsLayout](self, "setNeedsLayout");
    -[RCMPDetailSlider layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 0;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateComponentsFormatter hoursMinutesSecondsStringWithInterval:forAccessibility:](NSDateComponentsFormatter, "hoursMinutesSecondsStringWithInterval:forAccessibility:", 1, self->_currentTime));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateComponentsFormatter hoursMinutesSecondsStringWithInterval:forAccessibility:](NSDateComponentsFormatter, "hoursMinutesSecondsStringWithInterval:forAccessibility:", 1, self->_availableDuration));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AX_DURATION_PROGRESS"), &stru_1001B2BC0, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v6, &stru_1001B2BC0, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v3, v4));

  return v9;
}

- (void)accessibilityIncrement
{
  float v3;
  float v4;
  double v5;

  -[RCMPDetailSlider value](self, "value");
  v4 = v3 + 0.1;
  v5 = self->_duration * v4;
  *(float *)&v5 = v5;
  -[RCMPDetailSlider setValue:animated:](self, "setValue:animated:", 0, v5);
  -[RCMPDetailSlider _commitValue](self, "_commitValue");
}

- (void)accessibilityDecrement
{
  float v3;
  float v4;
  double v5;

  -[RCMPDetailSlider value](self, "value");
  v4 = v3 + -0.1;
  v5 = self->_duration * v4;
  *(float *)&v5 = v5;
  -[RCMPDetailSlider setValue:animated:](self, "setValue:animated:", 0, v5);
  -[RCMPDetailSlider _commitValue](self, "_commitValue");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("TRACK_SLIDER"), &stru_1001B2BC0, 0));

  return v3;
}

- (RCMPDetailSliderDelegate)delegate
{
  return (RCMPDetailSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)allowsScrubbing
{
  return self->_allowsScrubbing;
}

- (double)detailScrubbingVerticalRange
{
  return self->_detailScrubbingVerticalRange;
}

- (void)setDetailScrubbingVerticalRange:(double)a3
{
  self->_detailScrubbingVerticalRange = a3;
}

- (double)duration
{
  return self->_duration;
}

- (double)availableDuration
{
  return self->_availableDuration;
}

- (int64_t)timeLabelStyle
{
  return self->_timeLabelStyle;
}

- (double)minTimeLabelWidth
{
  return self->_minTimeLabelWidth;
}

- (NSString)localizedScrubSpeedText
{
  return self->_localizedScrubSpeedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedScrubSpeedText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_thumbImageView, 0);
  objc_storeStrong((id *)&self->_glowDetailScrubImageView, 0);
  objc_storeStrong((id *)&self->_downloadingTrackOverlay, 0);
  objc_storeStrong((id *)&self->_autoscrubTimer, 0);
  objc_storeStrong((id *)&self->_scrubController, 0);
  objc_storeStrong((id *)&self->_currentTimeLabel, 0);
  objc_storeStrong((id *)&self->_currentTimeInverseLabel, 0);
}

@end
