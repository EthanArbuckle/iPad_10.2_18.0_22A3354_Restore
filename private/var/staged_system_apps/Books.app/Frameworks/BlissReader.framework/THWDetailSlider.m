@implementation THWDetailSlider

- (THWDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4 maxTrackWidth:(double)a5
{
  THWDetailSlider *v7;
  THWDetailSlider *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THWDetailSlider;
  v7 = -[THWDetailSlider initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_allowsScrubbing = 1;
    v7->_allowsDetailScrubbing = 1;
    v7->_detailScrubbingVerticalRange = 220.0;
    v7->_minTimeLabelWidth = 20.0;
    v7->_maxTrackWidth = a5;
    v7->_style = a4;
    -[THWDetailSlider _setupControlsForStyle](v7, "_setupControlsForStyle");
  }
  return v8;
}

- (THWDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  return -[THWDetailSlider initWithFrame:style:maxTrackWidth:](self, "initWithFrame:style:maxTrackWidth:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (THWDetailSlider)initWithFrame:(CGRect)a3
{
  return -[THWDetailSlider initWithFrame:style:maxTrackWidth:](self, "initWithFrame:style:maxTrackWidth:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_autoscrubTimer, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)THWDetailSlider;
  -[THWDetailSlider dealloc](&v3, "dealloc");
}

- (void)setHideLeftNumericDisplay:(BOOL)a3
{
  if (self->_hideLeftNumericDisplay != a3)
  {
    self->_hideLeftNumericDisplay = a3;
    if (a3)
    {
      -[UILabel removeFromSuperview](self->_currentTimeLabel, "removeFromSuperview");

      self->_currentTimeLabel = 0;
    }
    -[THWDetailSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHideRightNumericDisplay:(BOOL)a3
{
  if (self->_hideRightNumericDisplay != a3)
  {
    self->_hideRightNumericDisplay = a3;
    if (a3)
    {
      -[UILabel removeFromSuperview](self->_currentTimeInverseLabel, "removeFromSuperview");

      self->_currentTimeInverseLabel = 0;
    }
    -[THWDetailSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  objc_super v9;
  CGPoint v10;
  CGRect v11;

  y = a3.y;
  x = a3.x;
  -[THWDetailSlider _thumbHitFrame](self, "_thumbHitFrame");
  v10.x = x;
  v10.y = y;
  if (!CGRectContainsPoint(v11, v10))
    return 0;
  v9.receiver = self;
  v9.super_class = (Class)THWDetailSlider;
  return -[THWDetailSlider hitTest:withEvent:](&v9, "hitTest:withEvent:", a4, x, y);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  UILabel *currentTimeLabel;
  UILabel *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  UILabel *currentTimeInverseLabel;
  UILabel *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  double v30;
  objc_super v31;
  CGRect v32;

  -[THWDetailSlider timeLabelVerticalOffsetForStyle:](self, "timeLabelVerticalOffsetForStyle:", self->_style);
  v4 = v3;
  v5 = -[THWDetailSlider timeLabelFontForStyle:](self, "timeLabelFontForStyle:", self->_style);
  v6 = -[THWDetailSlider timeLabelTextColorForStyle:](self, "timeLabelTextColorForStyle:", self->_style);
  -[THWDetailSlider timeLabelShadowOffsetForStyle:](self, "timeLabelShadowOffsetForStyle:", self->_style);
  v8 = v7;
  v10 = v9;
  v11 = -[THWDetailSlider timeLabelShadowColorForStyle:](self, "timeLabelShadowColorForStyle:", self->_style);
  if (!-[THWDetailSlider hideLeftNumericDisplay](self, "hideLeftNumericDisplay"))
  {
    currentTimeLabel = self->_currentTimeLabel;
    if (!currentTimeLabel)
    {
      v13 = (UILabel *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(self), "labelClass")), "initWithFrame:", 0.0, 0.0, self->_minTimeLabelWidth, 25.0);
      self->_currentTimeLabel = v13;
      -[UILabel setTextColor:](v13, "setTextColor:", v6);
      -[UILabel setFont:](self->_currentTimeLabel, "setFont:", v5);
      -[UILabel setShadowOffset:](self->_currentTimeLabel, "setShadowOffset:", v8, v10);
      -[UILabel setShadowColor:](self->_currentTimeLabel, "setShadowColor:", v11);
      -[UILabel setOpaque:](self->_currentTimeLabel, "setOpaque:", 0);
      -[UILabel setBackgroundColor:](self->_currentTimeLabel, "setBackgroundColor:", 0);
      -[UILabel setLineBreakMode:](self->_currentTimeLabel, "setLineBreakMode:", 2);
      -[UILabel setText:](self->_currentTimeLabel, "setText:", -[THWDetailSlider _stringForCurrentTime:](self, "_stringForCurrentTime:", self->_currentTime));
      -[UILabel setTextAlignment:](self->_currentTimeLabel, "setTextAlignment:", 2);
      -[THWDetailSlider addSubview:](self, "addSubview:", self->_currentTimeLabel);
      currentTimeLabel = self->_currentTimeLabel;
    }
    -[UILabel frame](currentTimeLabel, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[THWDetailSlider bounds](self, "bounds");
    v21 = v4 + (v20 - v19) * 0.5;
    -[UILabel setFrame:](self->_currentTimeLabel, "setFrame:", v15, floorf(v21), v17, v19);
  }
  if (!-[THWDetailSlider hideRightNumericDisplay](self, "hideRightNumericDisplay"))
  {
    currentTimeInverseLabel = self->_currentTimeInverseLabel;
    if (!currentTimeInverseLabel)
    {
      v23 = (UILabel *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(self), "labelClass")), "initWithFrame:", 0.0, 0.0, self->_minTimeLabelWidth, 25.0);
      self->_currentTimeInverseLabel = v23;
      -[UILabel setTextColor:](v23, "setTextColor:", v6);
      -[UILabel setFont:](self->_currentTimeInverseLabel, "setFont:", v5);
      -[UILabel setShadowOffset:](self->_currentTimeInverseLabel, "setShadowOffset:", v8, v10);
      -[UILabel setShadowColor:](self->_currentTimeInverseLabel, "setShadowColor:", v11);
      -[UILabel setOpaque:](self->_currentTimeInverseLabel, "setOpaque:", 0);
      -[UILabel setBackgroundColor:](self->_currentTimeInverseLabel, "setBackgroundColor:", 0);
      -[UILabel setLineBreakMode:](self->_currentTimeInverseLabel, "setLineBreakMode:", 2);
      -[UILabel setText:](self->_currentTimeInverseLabel, "setText:", -[THWDetailSlider _stringForInverseCurrentTime:](self, "_stringForInverseCurrentTime:", self->_currentTime));
      -[UILabel setTextAlignment:](self->_currentTimeInverseLabel, "setTextAlignment:", 0);
      -[THWDetailSlider addSubview:](self, "addSubview:", self->_currentTimeInverseLabel);
      currentTimeInverseLabel = self->_currentTimeInverseLabel;
    }
    -[UILabel frame](currentTimeInverseLabel, "frame");
    v25 = v24;
    v27 = v26;
    -[THWDetailSlider bounds](self, "bounds");
    v29 = v4 + (v28 - v27) * 0.5;
    v30 = floorf(v29);
    -[THWDetailSlider bounds](self, "bounds");
    -[UILabel setFrame:](self->_currentTimeInverseLabel, "setFrame:", CGRectGetWidth(v32) - self->_trackInsetRight - self->_timeLabelInsets.left, self->_timeLabelInsets.top + v30, v25 - (-self->_timeLabelInsets.right - self->_timeLabelInsets.left), v27 - (self->_timeLabelInsets.top + self->_timeLabelInsets.bottom));
  }
  -[THWDetailSlider _adjustMinScale](self, "_adjustMinScale");
  -[THWDetailSlider _updateTrackInset](self, "_updateTrackInset");
  v31.receiver = self;
  v31.super_class = (Class)THWDetailSlider;
  -[THWDetailSlider layoutSubviews](&v31, "layoutSubviews");
}

- (void)setFrame:(CGRect)a3
{
  double currentTime;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWDetailSlider;
  -[THWDetailSlider setFrame:](&v5, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  currentTime = self->_currentTime;
  *(float *)&currentTime = currentTime;
  -[THWDetailSlider setValue:](self, "setValue:", currentTime);
}

- (UIImageView)thumbImageView
{
  uint64_t v3;
  UIImageView *result;
  uint64_t v5;

  v3 = objc_opt_class(UIImageView);
  TSUDynamicCast(v3, -[THWDetailSlider _thumbView](self, "_thumbView"));
  if (!result)
  {
    v5 = objc_opt_class(UIImageView);
    TSUDynamicCast(v5, -[THWDetailSlider _thumbViewNeue](self, "_thumbViewNeue"));
  }
  return result;
}

- (id)currentThumbImage
{
  UIImageView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIImageView *glowDetailScrubImageView;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  if ((unint64_t)(self->_style - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    if (self->_isTracking && self->_allowsDetailScrubbing && self->_durationAllowsDetailScrubbing)
    {
      if (!self->_glowDetailScrubImageView)
      {
        v3 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", +[UIImage th_imageNamed:](UIImage, "th_imageNamed:", CFSTR("scrubberglow")));
        self->_glowDetailScrubImageView = v3;
        -[UIImageView bounds](v3, "bounds");
        v5 = v4;
        v7 = v6;
        v9 = v8;
        v11 = v10;
        v12 = -[UIImageView bounds](-[THWDetailSlider thumbImageView](self, "thumbImageView"), "bounds");
        v20.origin.x = UIRectCenteredIntegralRect(v12, v5, v7, v9, v11, v13, v14, v15, v16);
        v21 = CGRectOffset(v20, 0.0, -1.0);
        -[UIImageView setFrame:](v3, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
      }
      -[UIImageView addSubview:](-[THWDetailSlider thumbImageView](self, "thumbImageView"), "addSubview:", self->_glowDetailScrubImageView);
    }
    else
    {
      glowDetailScrubImageView = self->_glowDetailScrubImageView;
      if (glowDetailScrubImageView)
      {
        objc_msgSend(-[UIImageView layer](glowDetailScrubImageView, "layer"), "removeAllAnimations");
        -[UIImageView removeFromSuperview](self->_glowDetailScrubImageView, "removeFromSuperview");
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)THWDetailSlider;
  return -[THWDetailSlider currentThumbImage](&v19, "currentThumbImage");
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  double trackInsetLeft;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[THWDetailSlider _updateTrackInset](self, "_updateTrackInset");
  v15.receiver = self;
  v15.super_class = (Class)THWDetailSlider;
  -[THWDetailSlider trackRectForBounds:](&v15, "trackRectForBounds:", x, y, width, height);
  v8 = v16.origin.x;
  v9 = v16.origin.y;
  v10 = v16.size.width;
  v11 = v16.size.height;
  v12 = CGRectGetWidth(v16);
  trackInsetLeft = self->_trackInsetLeft;
  v14 = trackInsetLeft + self->_trackInsetRight;
  if (v12 <= v14)
  {
    result.origin.x = CGRectZero.origin.x;
    result.origin.y = CGRectZero.origin.y;
    result.size.width = CGRectZero.size.width;
    result.size.height = CGRectZero.size.height;
  }
  else
  {
    v17.origin.x = v8 + trackInsetLeft;
    v17.size.width = v10 - v14;
    v17.origin.y = v9;
    v17.size.height = v11;
    return CGRectOffset(v17, 0.0, -2.0);
  }
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double height;
  double width;
  double y;
  double x;
  int64_t style;
  uint64_t v11;
  CGFloat v15;
  objc_super v16;
  objc_super v17;
  objc_super v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  style = self->_style;
  if (style == 4)
  {
    v18.receiver = self;
    v18.super_class = (Class)THWDetailSlider;
    -[THWDetailSlider thumbRectForBounds:trackRect:value:](&v18, "thumbRectForBounds:trackRect:value:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, LODWORD(a5));
    goto LABEL_6;
  }
  if (style == 3)
  {
    v17.receiver = self;
    v17.super_class = (Class)THWDetailSlider;
    -[THWDetailSlider thumbRectForBounds:trackRect:value:](&v17, "thumbRectForBounds:trackRect:value:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, LODWORD(a5));
LABEL_9:
    v15 = 3.0;
    return CGRectOffset(*(CGRect *)&v11, 0.0, v15);
  }
  if (style != 2)
  {
    v21 = CGRectInset(a4, -2.0, 0.0);
    v16.receiver = self;
    v16.super_class = (Class)THWDetailSlider;
    -[THWDetailSlider thumbRectForBounds:trackRect:value:](&v16, "thumbRectForBounds:trackRect:value:", x, y, width, height, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, LODWORD(a5));
    goto LABEL_9;
  }
  v20 = CGRectInset(a4, -3.0, 0.0);
  v19.receiver = self;
  v19.super_class = (Class)THWDetailSlider;
  -[THWDetailSlider thumbRectForBounds:trackRect:value:](&v19, "thumbRectForBounds:trackRect:value:", x, y, width, height, v20.origin.x, v20.origin.y, v20.size.width, v20.size.height, LODWORD(a5));
LABEL_6:
  v15 = 2.0;
  return CGRectOffset(*(CGRect *)&v11, 0.0, v15);
}

- (void)setValue:(float)a3
{
  if (!self->_isTracking)
    -[THWDetailSlider _setValueWhileTracking:](self, "_setValueWhileTracking:");
}

- (void)_setValueWhileTracking:(float)a3
{
  double duration;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  double v10;
  objc_super v11;

  duration = self->_duration;
  if (duration > 0.0)
  {
    v5 = fmax(a3, 0.0);
    if (duration < v5)
      v5 = self->_duration;
    v6 = v5;
    v7 = v6;
    v8 = v6 / duration;
    -[THWDetailSlider bounds](self, "bounds");
    v10 = 1.0 / v9;
    LODWORD(v10) = 1.0;
    if (vabdd_f64(1.0, v8) >= 1.0 / v9)
      *(float *)&v10 = v8;
    v11.receiver = self;
    v11.super_class = (Class)THWDetailSlider;
    -[THWDetailSlider setValue:](&v11, "setValue:", v10);
    -[THWDetailSlider _updateForAvailableDuration](self, "_updateForAvailableDuration");
    -[THWDetailSlider _updateTimeDisplayForTime:](self, "_updateTimeDisplayForTime:", v7);
    if (self->_isTracking && self->_canCommit)
      -[THWDetailSlider _commitValue](self, "_commitValue");
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  _BOOL4 v9;
  CGPoint v11;
  CGRect v12;

  self->_didBeginTracking = 0;
  objc_msgSend(a3, "locationInView:", self, a4);
  v6 = v5;
  v8 = v7;
  -[THWDetailSlider _thumbHitFrame](self, "_thumbHitFrame");
  v11.x = v6;
  v11.y = v8;
  v9 = CGRectContainsPoint(v12, v11);
  if (v9)
  {
    self->_isTracking = 1;
    self->_previousLocationInView.x = v6;
    self->_previousLocationInView.y = v8;
    self->_beginLocationInView.x = v6;
    self->_beginLocationInView.y = v8;
    self->_lastCommittedLocationInView.x = v6;
    self->_lastCommittedLocationInView.y = v8;
    if ((objc_opt_respondsToSelector(self->_delegate, "detailSliderTrackingDidBegin:") & 1) != 0)
      objc_msgSend(self->_delegate, "detailSliderTrackingDidBegin:", self);
    if ((objc_opt_respondsToSelector(self->_delegate, "detailSlider:didChangeScrubSpeed:") & 1) != 0)
      objc_msgSend(self->_delegate, "detailSlider:didChangeScrubSpeed:", self, 0);
  }
  return v9;
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
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  double v22;
  CGRect v23;
  CGRect v24;

  -[THWDetailSlider maximumValue](self, "maximumValue", a3);
  v5 = v4;
  -[THWDetailSlider minimumValue](self, "minimumValue");
  v7 = (float)(v5 - v6);
  -[THWDetailSlider bounds](self, "bounds");
  -[THWDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
  v8 = v7 / CGRectGetWidth(v23);
  -[THWDetailSlider _scaleForVerticalPosition:](self, "_scaleForVerticalPosition:", self->_previousLocationInView.y);
  v10 = v9;
  v11 = v8 * v9;
  -[THWDetailSlider convertPoint:toView:](self, "convertPoint:toView:", -[THWDetailSlider window](self, "window"), self->_previousLocationInView.x, self->_previousLocationInView.y);
  v13 = v12;
  objc_msgSend(-[THWDetailSlider window](self, "window"), "bounds");
  if (v13 >= CGRectGetMidX(v24))
    v14 = v11;
  else
    v14 = -(v8 * v10);
  v15 = v14;
  self->_needsCommit = 1;
  self->_canCommit = 1;
  -[THWDetailSlider minimumValue](self, "minimumValue");
  v17 = v16;
  -[THWDetailSlider maximumValue](self, "maximumValue");
  v19 = v18;
  -[THWDetailSlider value](self, "value");
  v21 = v20 + v15;
  if (v19 < v21)
    v21 = v19;
  if (v17 >= v21)
    v21 = v17;
  v22 = self->_duration * v21;
  *(float *)&v22 = v22;
  -[THWDetailSlider setValue:animated:](self, "setValue:animated:", 0, v22);
  if (-[THWDetailSlider isContinuous](self, "isContinuous"))
    -[THWDetailSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  float v10;
  double v11;
  int64_t v12;
  int v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 autoscrubActive;
  char *v20;
  uint64_t v21;
  double Width;
  int v26;
  CABasicAnimation *v27;
  double v28;
  double v29;
  float v30;
  double v31;
  CGFloat *p_y;
  THWDetailSlider *v33;
  double v34;
  float v35;
  float v36;
  float v37;
  double v38;
  double v39;
  float v40;
  float v41;
  double v42;
  int v43;
  float v44;
  float v45;
  float v46;
  float v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double x;
  double v53;
  double v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  double v61;
  float v62;
  double v63;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  objc_msgSend(a3, "locationInView:", self, a4);
  v7 = v6;
  v8 = v5;
  v9 = 1.0;
  if (self->_allowsDetailScrubbing && self->_durationAllowsDetailScrubbing)
  {
    -[THWDetailSlider _scaleForVerticalPosition:](self, "_scaleForVerticalPosition:", v5);
    v9 = v10;
    if (v10 <= self->_minScale || (v11 = v10, v9 <= 0.1))
    {
      v12 = 3;
    }
    else if (v11 > 0.35 || v11 <= 0.1)
    {
      v12 = v11 > 0.35 && v9 <= 0.75;
    }
    else
    {
      v12 = 2;
    }
    if (self->_scrubValue != v12)
    {
      self->_scrubValue = v12;
      if ((objc_opt_respondsToSelector(self->_delegate, "detailSlider:didChangeScrubSpeed:") & 1) != 0)
        objc_msgSend(self->_delegate, "detailSlider:didChangeScrubSpeed:", self, self->_scrubValue);
    }
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
  if (self->_didBeginTracking)
  {
    if (v13)
      goto LABEL_16;
  }
  else
  {
    if (vabdd_f64(self->_beginLocationInView.x, v7) < 12.0)
    {
LABEL_30:
      self->_previousLocationInView.x = v7;
      p_y = &self->_previousLocationInView.y;
      goto LABEL_56;
    }
    self->_didBeginTracking = 1;
    if (v13)
    {
LABEL_16:
      v14 = -[THWDetailSlider window](self, "window");
      -[THWDetailSlider convertPoint:toView:](self, "convertPoint:toView:", v14, v7, v8);
      v16 = v15;
      v18 = v17;
      autoscrubActive = self->_autoscrubActive;
      v20 = (char *)objc_msgSend(objc_msgSend(v14, "windowScene"), "interfaceOrientation") - 3;
      if ((unint64_t)v20 < 2)
        v16 = v18;
      objc_msgSend(v14, "bounds");
      if ((unint64_t)v20 > 1)
      {
        Width = CGRectGetWidth(*(CGRect *)&v21);
        if (v14)
        {
LABEL_20:
          v26 = v16 < 20.0;
          Width = Width + -20.0;
          if (v16 > Width)
            v26 = 1;
          self->_autoscrubActive = v26;
          if (v26 == 1)
          {
            -[UIImageView setImage:](-[THWDetailSlider thumbImageView](self, "thumbImageView"), "setImage:", -[THWDetailSlider currentThumbImage](self, "currentThumbImage"));
            if (!autoscrubActive)
            {
              v27 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
              LODWORD(v28) = 0;
              -[CABasicAnimation setToValue:](v27, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v28));
              -[CABasicAnimation setDuration:](v27, "setDuration:", 0.25);
              LODWORD(v29) = 2139095039;
              -[CABasicAnimation setRepeatCount:](v27, "setRepeatCount:", v29);
              -[CABasicAnimation setAutoreverses:](v27, "setAutoreverses:", 1);
              objc_msgSend(-[UIImageView layer](self->_glowDetailScrubImageView, "layer"), "addAnimation:forKey:", v27, CFSTR("pulseAnimation"));
            }
            -[THWDetailSlider value](self, "value");
            v31 = self->_duration * v30;
            *(float *)&v31 = v31;
            -[THWDetailSlider _setValueWhileTracking:](self, "_setValueWhileTracking:", v31);
            if (-[THWDetailSlider isContinuous](self, "isContinuous"))
              -[THWDetailSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
            if (!self->_autoscrubTimer)
              self->_autoscrubTimer = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_autoscrubTick:", 0, 1, 0.1);
            goto LABEL_30;
          }
          goto LABEL_33;
        }
      }
      else
      {
        Width = CGRectGetHeight(*(CGRect *)&v21);
        if (v14)
          goto LABEL_20;
      }
      self->_autoscrubActive = 0;
LABEL_33:
      if (self->_autoscrubTimer)
      {
        objc_msgSend(-[UIImageView layer](self->_glowDetailScrubImageView, "layer", Width), "removeAnimationForKey:", CFSTR("pulseAnimation"));
        v33 = self;
        -[NSTimer invalidate](self->_autoscrubTimer, "invalidate");

        self->_autoscrubTimer = 0;
      }
    }
  }
  v34 = v7 - self->_previousLocationInView.x;
  -[THWDetailSlider maximumValue](self, "maximumValue");
  v36 = v35;
  -[THWDetailSlider minimumValue](self, "minimumValue");
  v38 = (float)(v36 - v37);
  -[THWDetailSlider bounds](self, "bounds");
  -[THWDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
  v39 = v34 * (v38 / CGRectGetWidth(v65));
  -[THWDetailSlider value](self, "value");
  v41 = v40;
  v42 = v40 + v39 * v9;
  p_y = &self->_previousLocationInView.y;
  if (v8 - self->_previousLocationInView.y < 0.0)
    v43 = v13;
  else
    v43 = 0;
  if (v43 == 1)
  {
    -[THWDetailSlider minimumValue](self, "minimumValue");
    v45 = v44;
    -[THWDetailSlider maximumValue](self, "maximumValue");
    v47 = v46;
    -[THWDetailSlider bounds](self, "bounds");
    v49 = v48;
    v51 = v50;
    -[THWDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
    v66.origin.y = v49;
    v66.size.height = v51;
    v67 = CGRectInset(v66, -2.0, 0.0);
    x = v67.origin.x;
    v53 = v67.size.width;
    -[UIImageView frame](-[THWDetailSlider thumbImageView](self, "thumbImageView"), "frame");
    v55 = v7 - x + v54 * -0.5;
    v56 = (float)((float)(v47 - v45) * v55) / (v53 - v54) + v45;
    if (v45 <= v56)
    {
      v45 = v56;
      if (v47 < v56)
        v45 = v47;
    }
    -[THWDetailSlider _scaleForIdealValueForVerticalPosition:](self, "_scaleForIdealValueForVerticalPosition:", v8);
    v42 = v42 + (float)((float)(v45 - v41) * v57);
  }
  -[THWDetailSlider minimumValue](self, "minimumValue");
  v59 = v58;
  -[THWDetailSlider maximumValue](self, "maximumValue");
  v61 = v60;
  if (v42 <= v61)
    v61 = v42;
  if (v61 <= v59)
    v61 = v59;
  v62 = v61;
  if (vabds_f32(v62, v41) > 0.00000011921)
    self->_needsCommit = 1;
  if (vabdd_f64(self->_lastCommittedLocationInView.x, v7) > 8.0
    || vabdd_f64(self->_lastCommittedLocationInView.y, v8) > 4.0)
  {
    self->_canCommit = 1;
    self->_lastCommittedLocationInView.x = v7;
    self->_lastCommittedLocationInView.y = v8;
  }
  v63 = v61 * self->_duration;
  *(float *)&v63 = v63;
  -[THWDetailSlider _setValueWhileTracking:](self, "_setValueWhileTracking:", v63);
  if (-[THWDetailSlider isContinuous](self, "isContinuous"))
    -[THWDetailSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  self->_previousLocationInView.x = v7;
LABEL_56:
  *p_y = v8;
  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  THWDetailSlider *v6;
  double v7;

  v6 = self;
  -[NSTimer invalidate](self->_autoscrubTimer, "invalidate");

  self->_autoscrubTimer = 0;
  self->_autoscrubActive = 0;
  self->_isTracking = 0;
  -[THWDetailSlider _resetScrubInfo](self, "_resetScrubInfo");
  objc_msgSend(a3, "locationInView:", self);
  if (vabdd_f64(self->_lastCommittedLocationInView.x, v7) > 3.0)
    -[THWDetailSlider _commitValue](self, "_commitValue");
  if ((objc_opt_respondsToSelector(self->_delegate, "detailSliderTrackingDidEnd:") & 1) != 0)
    objc_msgSend(self->_delegate, "detailSliderTrackingDidEnd:", self);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  -[THWDetailSlider cancelTracking](self, "cancelTracking", a3);
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

+ (double)defaultHeight
{
  return 24.0;
}

+ (Class)labelClass
{
  return (Class)objc_opt_class(UILabel, a2);
}

- (BOOL)allowsDetailScrubbing
{
  return self->_allowsDetailScrubbing;
}

- (void)cancelTracking
{
  THWDetailSlider *v3;
  _BOOL4 isTracking;

  v3 = self;
  -[NSTimer invalidate](self->_autoscrubTimer, "invalidate");

  self->_autoscrubTimer = 0;
  self->_autoscrubActive = 0;
  isTracking = self->_isTracking;
  self->_isTracking = 0;
  -[THWDetailSlider _resetScrubInfo](self, "_resetScrubInfo");
  if (isTracking && (objc_opt_respondsToSelector(self->_delegate, "detailSliderTrackingDidCancel:") & 1) != 0)
    objc_msgSend(self->_delegate, "detailSliderTrackingDidCancel:", self);
}

- (BOOL)detailScrubbingAvailableForCurrentDuration
{
  return self->_duration >= 60.0;
}

- (void)setAllowsScrubbing:(BOOL)a3
{
  if (self->_allowsScrubbing != a3)
  {
    self->_allowsScrubbing = a3;
    -[THWDetailSlider setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  }
}

- (void)setAllowsDetailScrubbing:(BOOL)a3
{
  self->_allowsDetailScrubbing = a3;
}

- (void)setAvailableDuration:(double)duration
{
  if (self->_duration <= duration)
    duration = self->_duration;
  if (vabdd_f64(duration, self->_availableDuration) > 2.22044605e-16)
  {
    self->_availableDuration = duration;
    -[THWDetailSlider _updateForAvailableDuration](self, "_updateForAvailableDuration");
  }
}

- (void)setDuration:(double)a3
{
  double currentTime;
  double v5;

  if (vabdd_f64(self->_duration, a3) > 2.22044605e-16)
  {
    self->_duration = a3;
    self->_durationAllowsDetailScrubbing = -[THWDetailSlider detailScrubbingAvailableForCurrentDuration](self, "detailScrubbingAvailableForCurrentDuration");
    currentTime = self->_currentTime;
    if (currentTime >= self->_duration)
      currentTime = self->_duration;
    self->_currentTime = fmax(currentTime, 0.0);
    -[THWDetailSlider layoutSubviews](self, "layoutSubviews");
    v5 = self->_currentTime;
    *(float *)&v5 = v5;
    -[THWDetailSlider setValue:animated:](self, "setValue:animated:", 0, v5);
    -[THWDetailSlider setAvailableDuration:](self, "setAvailableDuration:", self->_duration);
    -[THWDetailSlider _updateTimeDisplayForTime:force:](self, "_updateTimeDisplayForTime:force:", 1, self->_currentTime);
  }
}

- (void)setMinTimeLabelWidth:(double)a3
{
  if (self->_minTimeLabelWidth != a3)
  {
    self->_minTimeLabelWidth = a3;
    -[THWDetailSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTimeLabelInsets:(UIEdgeInsets)a3
{
  if (self->_timeLabelInsets.left != a3.left
    || self->_timeLabelInsets.top != a3.top
    || self->_timeLabelInsets.right != a3.right
    || self->_timeLabelInsets.bottom != a3.bottom)
  {
    self->_timeLabelInsets = a3;
    -[THWDetailSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTimeLabelStyle:(int64_t)a3
{
  if (self->_timeLabelStyle != a3)
  {
    self->_timeLabelStyle = a3;
    -[THWDetailSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)timeLabelFontForStyle:(int64_t)a3
{
  int64_t style;
  double v4;

  style = self->_style;
  if ((unint64_t)(style - 1) < 2)
  {
    v4 = 12.0;
    return +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", a3, v4);
  }
  if (style != 4)
  {
    if (style == 3)
      v4 = 10.0;
    else
      v4 = 14.0;
    return +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", a3, v4);
  }
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", a3, 11.0);
}

- (id)timeLabelShadowColorForStyle:(int64_t)a3
{
  return +[UIColor blackColor](UIColor, "blackColor", a3);
}

- (CGSize)timeLabelShadowOffsetForStyle:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 1.0;
  if (self->_style != 2)
    v3 = -1.0;
  v4 = 0.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (id)timeLabelTextColorForStyle:(int64_t)a3
{
  return +[UIColor whiteColor](UIColor, "whiteColor", a3);
}

- (double)timeLabelVerticalOffsetForStyle:(int64_t)a3
{
  return -2.0;
}

- (void)_setupControlsForStyle
{
  unint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v3 = self->_style - 1;
  if (v3 > 3)
  {
    v6 = CFSTR("ScrubberKnob");
    v5 = CFSTR("VolumeBlueTrack");
    v7 = 5;
    v4 = CFSTR("VolumeWhiteTrack");
  }
  else
  {
    v4 = off_429FA8[v3];
    v5 = off_429FC8[v3];
    v6 = off_429FE8[v3];
    v7 = 6;
  }
  v8 = +[UIImage th_imageNamed:](UIImage, "th_imageNamed:", v6);
  v9 = objc_msgSend(+[UIImage th_imageNamed:](UIImage, "th_imageNamed:", v5), "stretchableImageWithLeftCapWidth:topCapHeight:", v7, 0);
  v10 = objc_msgSend(+[UIImage th_imageNamed:](UIImage, "th_imageNamed:", v4), "stretchableImageWithLeftCapWidth:topCapHeight:", v7, 0);
  -[THWDetailSlider setThumbImage:forState:](self, "setThumbImage:forState:", v8, 0);
  -[THWDetailSlider setMinimumTrackImage:forState:](self, "setMinimumTrackImage:forState:", v9, 0);
  -[THWDetailSlider setMaximumTrackImage:forState:](self, "setMaximumTrackImage:forState:", v10, 0);
}

- (void)_updateTrackInset
{
  double v3;
  double v4;
  id v5;
  double v6;
  id v7;
  double v8;
  unsigned __int8 v9;
  double v10;
  double v11;
  double minTimeLabelWidth;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSAttributedStringKey v20;
  UIFont *v21;
  NSAttributedStringKey v22;
  UIFont *v23;
  CGRect v24;

  if (self->_currentTimeInverseLabel && self->_currentTimeLabel)
  {
    v3 = 0.0;
    v4 = 0.0;
    if (!-[THWDetailSlider hideRightNumericDisplay](self, "hideRightNumericDisplay"))
    {
      -[THWDetailSlider duration](self, "duration");
      v5 = -[THWDetailSlider _stringForInverseCurrentTime:](self, "_stringForInverseCurrentTime:");
      v22 = NSFontAttributeName;
      v23 = -[UILabel font](self->_currentTimeInverseLabel, "font");
      objc_msgSend(v5, "sizeWithAttributes:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      v4 = v6;
    }
    if (!-[THWDetailSlider hideLeftNumericDisplay](self, "hideLeftNumericDisplay"))
    {
      -[THWDetailSlider duration](self, "duration");
      v7 = -[THWDetailSlider _stringForCurrentTime:](self, "_stringForCurrentTime:");
      v20 = NSFontAttributeName;
      v21 = -[UILabel font](self->_currentTimeLabel, "font");
      objc_msgSend(v7, "sizeWithAttributes:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
      v3 = v8;
    }
    v9 = -[THWDetailSlider hideLeftNumericDisplay](self, "hideLeftNumericDisplay");
    v10 = 2.0;
    v11 = 2.0;
    if ((v9 & 1) == 0)
    {
      minTimeLabelWidth = self->_minTimeLabelWidth;
      if (minTimeLabelWidth < v3)
        minTimeLabelWidth = v3;
      v11 = minTimeLabelWidth + 2.0;
    }
    self->_trackInsetLeft = v11;
    if (!-[THWDetailSlider hideRightNumericDisplay](self, "hideRightNumericDisplay"))
    {
      v13 = self->_minTimeLabelWidth;
      if (v13 < v4)
        v13 = v4;
      v10 = v13 + 2.0;
    }
    self->_trackInsetRight = v10;
    if (!-[THWDetailSlider hideLeftNumericDisplay](self, "hideLeftNumericDisplay"))
    {
      -[UILabel frame](self->_currentTimeLabel, "frame");
      -[UILabel setFrame:](self->_currentTimeLabel, "setFrame:", self->_timeLabelInsets.left + 0.0, v14 + self->_timeLabelInsets.top, self->_trackInsetLeft - (self->_timeLabelInsets.left + self->_timeLabelInsets.right), v15 - (self->_timeLabelInsets.top + self->_timeLabelInsets.bottom));
      -[UILabel setNeedsDisplay](self->_currentTimeLabel, "setNeedsDisplay");
    }
    if (!-[THWDetailSlider hideRightNumericDisplay](self, "hideRightNumericDisplay"))
    {
      -[UILabel frame](self->_currentTimeInverseLabel, "frame");
      v17 = v16;
      v19 = v18;
      -[THWDetailSlider bounds](self, "bounds");
      -[UILabel setFrame:](self->_currentTimeInverseLabel, "setFrame:", CGRectGetWidth(v24) - self->_trackInsetRight - self->_timeLabelInsets.left, v17 + self->_timeLabelInsets.top, self->_trackInsetRight - (-self->_timeLabelInsets.right - self->_timeLabelInsets.left), v19 - (self->_timeLabelInsets.top + self->_timeLabelInsets.bottom));
    }
  }
}

- (void)_adjustMinScale
{
  float Width;
  float duration;
  CGRect v5;

  -[THWDetailSlider bounds](self, "bounds");
  Width = CGRectGetWidth(v5);
  duration = self->_duration;
  self->_minScale = (float)(Width / duration) / 10.0;
}

- (float)_scaleForVerticalPosition:(double)a3
{
  uint64_t v5;
  uint64_t v6;
  double detailScrubbingVerticalRange;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  float v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float result;

  v5 = TSUPadUI(self, a2);
  detailScrubbingVerticalRange = self->_detailScrubbingVerticalRange;
  v8 = vabdd_f64(a3, self->_beginLocationInView.y);
  if (detailScrubbingVerticalRange >= v8)
    detailScrubbingVerticalRange = v8;
  if ((_DWORD)v5)
    v9 = 20.0;
  else
    v9 = 0.0;
  if (v9 >= detailScrubbingVerticalRange)
    v10 = v9;
  else
    v10 = detailScrubbingVerticalRange;
  v11 = TSUPadUI(v5, v6);
  if ((_DWORD)v11)
    v13 = 20.0;
  else
    v13 = 0.0;
  v14 = v10 - v13;
  v15 = v14;
  v16 = self->_detailScrubbingVerticalRange;
  if (TSUPadUI(v11, v12))
    v17 = 20.0;
  else
    v17 = 0.0;
  v18 = v15 / (v16 - v17);
  result = 1.0 - v18;
  if (self->_minScale >= result)
    return self->_minScale;
  return result;
}

- (float)_scaleForIdealValueForVerticalPosition:(double)a3
{
  double detailScrubbingVerticalRange;
  double v4;
  double v5;
  BOOL v6;
  BOOL v7;
  double v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;

  detailScrubbingVerticalRange = self->_detailScrubbingVerticalRange;
  v4 = vabdd_f64(a3, self->_beginLocationInView.y);
  if (detailScrubbingVerticalRange < v4)
    v4 = self->_detailScrubbingVerticalRange;
  v5 = v4 + -20.0;
  v6 = v4 == 20.0;
  v7 = v4 < 20.0;
  v8 = 0.0;
  if (!v7 && !v6)
    v8 = v5;
  v9 = v8;
  v10 = v9 / (detailScrubbingVerticalRange + -20.0);
  if (v10 <= 0.15)
  {
    v10 = v10 / 0.15;
    v11 = 0.33333;
  }
  else
  {
    v11 = 0.025;
  }
  v12 = powf(v10, v11);
  if (v12 <= 0.0)
    v13 = 1.0;
  else
    v13 = 1.0 - v12;
  if (v13 > 1.0)
    v13 = 1.0;
  return fmaxf(v13, 0.0);
}

- (void)_updateTimeDisplayForTime:(double)a3
{
  -[THWDetailSlider _updateTimeDisplayForTime:force:](self, "_updateTimeDisplayForTime:force:", 0, a3);
}

- (void)_updateTimeDisplayForTime:(double)a3 force:(BOOL)a4
{
  double v5;

  v5 = floor(a3);
  if (a4 || vabdd_f64(self->_currentTime, v5) > 2.22044605e-16)
  {
    -[UILabel setText:](self->_currentTimeLabel, "setText:", -[THWDetailSlider _stringForCurrentTime:](self, "_stringForCurrentTime:", v5));
    -[UILabel setText:](self->_currentTimeInverseLabel, "setText:", -[THWDetailSlider _stringForInverseCurrentTime:](self, "_stringForInverseCurrentTime:", self->_duration - v5));
    self->_currentTime = v5;
  }
}

- (id)_stringForTime:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v10;

  v3 = floor(a3);
  v4 = floor(v3 / 60.0);
  v5 = v3 - v4 * 60.0;
  v6 = floor(v4 / 60.0);
  v7 = v4 - v6 * 60.0;
  v8 = (void *)THBundle();
  if (v6 <= 0.0)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%1$2lu:%2$02lu"), &stru_43D7D8, 0), (unint64_t)v7, (unint64_t)v5, v10);
  else
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%1$2lu:%2$02lu:%3$02lu"), &stru_43D7D8, 0), (unint64_t)v6, (unint64_t)v7, (unint64_t)v5);
}

- (id)_stringForCurrentTime:(double)a3
{
  if (self->_timeLabelStyle == 1 && vabdd_f64(self->_duration, a3) < 30.0)
    return objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Unknown Duration"), &stru_43D7D8, 0);
  else
    return -[THWDetailSlider _stringForTime:](self, "_stringForTime:", a3);
}

- (id)_stringForInverseCurrentTime:(double)a3
{
  id v4;

  if (self->_timeLabelStyle == 1)
  {
    if (fabs(a3) < 30.0)
      return objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Live"), &stru_43D7D8, 0);
    v4 = -[THWDetailSlider _stringForTime:](self, "_stringForTime:");
  }
  else
  {
    v4 = -[THWDetailSlider _stringForCurrentTime:](self, "_stringForCurrentTime:", a3);
  }
  return objc_msgSend(CFSTR("-"), "stringByAppendingString:", v4);
}

- (CGRect)_thumbHitFrame
{
  CGRect v2;

  -[UIImageView frame](-[THWDetailSlider thumbImageView](self, "thumbImageView"), "frame");
  return CGRectInset(v2, -15.0, -15.0);
}

- (void)_resetScrubInfo
{
  self->_scrubValue = 0;
  -[UIImageView setImage:](-[THWDetailSlider thumbImageView](self, "thumbImageView"), "setImage:", -[THWDetailSlider currentThumbImage](self, "currentThumbImage"));
  objc_msgSend(-[UIImageView layer](self->_glowDetailScrubImageView, "layer"), "removeAnimationForKey:", CFSTR("pulseAnimation"));
}

- (void)_commitValue
{
  id delegate;
  float v4;
  double v5;

  if (self->_needsCommit && (objc_opt_respondsToSelector(self->_delegate, "detailSlider:didChangeValue:") & 1) != 0)
  {
    delegate = self->_delegate;
    -[THWDetailSlider value](self, "value");
    v5 = self->_duration * v4;
    *(float *)&v5 = v5;
    objc_msgSend(delegate, "detailSlider:didChangeValue:", self, v5);
    self->_needsCommit = 0;
  }
}

- (void)_updateForAvailableDuration
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  double MidX;
  CGFloat v28;
  CGFloat v29;
  CGContext *v30;
  double v31;
  UIImage *ImageFromCurrentImageContext;
  UIImageView *v33;
  UIImageView *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double availableDuration;
  double currentTime;
  CGFloat x;
  CGFloat y;
  double width;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGContext *CurrentContext;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGContext *v51;
  UIImage *v52;
  UIImageView *v53;
  UIImageView *v54;
  UIImageView *downloadingTrackOverlay;
  uint64_t v56;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGSize v61;
  CGSize v62;
  CGSize v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  -[THWDetailSlider bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!-[THWDetailSlider thumbImageView](self, "thumbImageView"))
  {
    -[THWDetailSlider setNeedsLayout](self, "setNeedsLayout");
    -[THWDetailSlider layoutIfNeeded](self, "layoutIfNeeded");
  }
  v64.origin.x = v4;
  v64.origin.y = v6;
  v64.size.width = v8;
  v64.size.height = v10;
  if (CGRectGetWidth(v64) > 0.0)
  {
    switch(self->_style)
    {
      case 0:
        availableDuration = self->_availableDuration;
        if (availableDuration >= self->_duration)
        {
          downloadingTrackOverlay = self->_downloadingTrackOverlay;
          if (downloadingTrackOverlay)
          {
            -[UIImageView removeFromSuperview](downloadingTrackOverlay, "removeFromSuperview");

            self->_downloadingTrackOverlay = 0;
          }
        }
        else
        {
          currentTime = fmax(availableDuration, 0.0);
          if (currentTime < self->_currentTime && !self->_isTracking)
            currentTime = self->_currentTime;
          -[THWDetailSlider trackRectForBounds:](self, "trackRectForBounds:", v4, v6, v8, v10);
          v76 = CGRectOffset(v75, 0.0, 1.0);
          v77 = CGRectInset(v76, 1.0, 0.0);
          if (v77.size.width > 0.0)
          {
            x = v77.origin.x;
            y = v77.origin.y;
            width = v77.size.width;
            if (!qword_5432C0)
              qword_5432C0 = (uint64_t)objc_msgSend(+[UIImage th_imageNamed:](UIImage, "th_imageNamed:", CFSTR("ScrubberDownloading")), "stretchableImageWithLeftCapWidth:topCapHeight:", 4, 0);
            -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
            v45 = v44;
            v62.height = 8.0;
            v62.width = width;
            UIGraphicsBeginImageContextWithOptions(v62, 0, v45);
            v78.size.height = 8.0;
            v78.origin.x = x;
            v78.origin.y = y;
            v78.size.width = width;
            v46 = floor(currentTime / self->_duration * CGRectGetWidth(v78));
            CurrentContext = UIGraphicsGetCurrentContext();
            v79.size.height = 8.0;
            v79.origin.x = x;
            v79.origin.y = y;
            v79.size.width = width;
            v80.size.width = CGRectGetWidth(v79) - v46;
            v80.origin.y = 0.0;
            v80.size.height = 8.0;
            v80.origin.x = v46;
            CGContextClipToRect(CurrentContext, v80);
            objc_msgSend((id)qword_5432C0, "drawInRect:blendMode:alpha:", 0, CGPointZero.x, CGPointZero.y, width, 8.0, 1.0);
            goto LABEL_20;
          }
        }
        break;
      case 2:
      case 4:
        -[THWDetailSlider trackRectForBounds:](self, "trackRectForBounds:", v4, v6, v8, v10);
        v66 = CGRectOffset(v65, 0.0, 1.0);
        v67 = CGRectInset(v66, 0.0, 0.0);
        if (v67.size.width > 0.0)
        {
          v11 = v67.origin.x;
          v12 = v67.origin.y;
          v13 = v67.size.width;
          -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
          v15 = v14;
          v61.height = 10.0;
          v61.width = v13;
          UIGraphicsBeginImageContextWithOptions(v61, 0, v15);
          rect_24 = v13;
          v16 = self->_availableDuration / self->_duration;
          v68.size.height = 10.0;
          v68.origin.x = v11;
          v68.origin.y = v12;
          v68.size.width = rect_24;
          v17 = v16 * CGRectGetWidth(v68);
          rect_8 = floorf(v17);
          -[THWDetailSlider trackRectForBounds:](self, "trackRectForBounds:", v4, v6, v8, v10);
          rect_16 = v12;
          rect = v11;
          v19 = v18;
          v21 = v20;
          v23 = v22;
          v25 = v24;
          -[THWDetailSlider value](self, "value");
          LODWORD(v56) = v26;
          -[THWDetailSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v19, v21, v23, v25, v56);
          MidX = CGRectGetMidX(v69);
          v70.origin.x = v19;
          v70.origin.y = v21;
          v70.size.width = v23;
          v70.size.height = v25;
          v28 = MidX - CGRectGetMinX(v70);
          v71.size.height = 10.0;
          v71.origin.x = rect;
          v71.size.width = rect_24;
          v71.origin.y = rect_16;
          v29 = fmax(CGRectGetWidth(v71) - v28, 0.0);
          v30 = UIGraphicsGetCurrentContext();
          v72.origin.x = 0.0;
          v72.origin.y = 0.0;
          v72.size.height = 10.0;
          v86.origin.y = 0.0;
          v86.size.height = 10.0;
          v72.size.width = rect_8;
          v86.origin.x = v28;
          v86.size.width = v29;
          v73 = CGRectIntersection(v72, v86);
          CGContextClipToRect(v30, v73);
          v31 = CGPointZero.y;
          -[UIBezierPath addClip](+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", CGPointZero.x, v31, v23, v25 + -1.0, 5.0), "addClip");
          -[UIColor set](+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.2), "set");
          v74.size.height = 10.0;
          v74.origin.x = CGPointZero.x;
          v74.origin.y = v31;
          v74.size.width = rect_24;
          UIRectFill(v74);
          ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
          UIGraphicsEndImageContext();
          if (!self->_downloadingTrackOverlay && -[THWDetailSlider thumbImageView](self, "thumbImageView"))
          {
            v33 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
            self->_downloadingTrackOverlay = v33;
            -[THWDetailSlider insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v33, -[THWDetailSlider thumbImageView](self, "thumbImageView"));
          }
          -[UIImageView setImage:](self->_downloadingTrackOverlay, "setImage:", ImageFromCurrentImageContext);
          v34 = self->_downloadingTrackOverlay;
          v35 = 10.0;
          v36 = rect;
          v37 = rect_16;
          v38 = rect_24;
          goto LABEL_23;
        }
        break;
      case 3:
        -[THWDetailSlider trackRectForBounds:](self, "trackRectForBounds:", v4, v6, v8, v10);
        v82 = CGRectOffset(v81, 0.0, 1.0);
        v83 = CGRectInset(v82, 1.0, 0.0);
        if (v83.size.width > 0.0)
        {
          x = v83.origin.x;
          y = v83.origin.y;
          width = v83.size.width;
          -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
          v49 = v48;
          v63.height = 8.0;
          v63.width = width;
          UIGraphicsBeginImageContextWithOptions(v63, 0, v49);
          -[UIColor set](+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.1), "set");
          v84.size.height = 8.0;
          v84.origin.x = x;
          v84.origin.y = y;
          v84.size.width = width;
          v50 = floor(self->_availableDuration / self->_duration * CGRectGetWidth(v84));
          v51 = UIGraphicsGetCurrentContext();
          v85.origin.x = 0.0;
          v85.origin.y = 0.0;
          v85.size.height = 8.0;
          v85.size.width = v50;
          CGContextClipToRect(v51, v85);
          -[UIBezierPath fill](+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", CGPointZero.x, CGPointZero.y, width, 8.0, 5.0), "fill");
LABEL_20:
          v52 = UIGraphicsGetImageFromCurrentImageContext();
          UIGraphicsEndImageContext();
          v53 = self->_downloadingTrackOverlay;
          if (!v53)
          {
            v54 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
            self->_downloadingTrackOverlay = v54;
            -[THWDetailSlider insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v54, -[THWDetailSlider thumbImageView](self, "thumbImageView"));
            v53 = self->_downloadingTrackOverlay;
          }
          -[UIImageView setImage:](v53, "setImage:", v52);
          v34 = self->_downloadingTrackOverlay;
          v35 = 8.0;
          v36 = x;
          v37 = y;
          v38 = width;
LABEL_23:
          -[UIImageView setFrame:](v34, "setFrame:", v36, v37, v38, v35);
        }
        break;
      default:
        return;
    }
  }
}

- (double)availableDuration
{
  return self->_availableDuration;
}

- (THWDetailSliderDelegate)delegate
{
  return (THWDetailSliderDelegate *)self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
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

- (UIEdgeInsets)timeLabelInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_timeLabelInsets.top;
  left = self->_timeLabelInsets.left;
  bottom = self->_timeLabelInsets.bottom;
  right = self->_timeLabelInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)timeLabelStyle
{
  return self->_timeLabelStyle;
}

- (double)minTimeLabelWidth
{
  return self->_minTimeLabelWidth;
}

- (BOOL)allowsScrubbing
{
  return self->_allowsScrubbing;
}

- (BOOL)hideLeftNumericDisplay
{
  return self->_hideLeftNumericDisplay;
}

- (BOOL)hideRightNumericDisplay
{
  return self->_hideRightNumericDisplay;
}

@end
