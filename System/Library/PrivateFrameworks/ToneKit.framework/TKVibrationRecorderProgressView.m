@implementation TKVibrationRecorderProgressView

- (TKVibrationRecorderProgressView)initWithFrame:(CGRect)a3
{
  return -[TKVibrationRecorderProgressView initWithMaximumTimeInterval:styleProvider:](self, "initWithMaximumTimeInterval:styleProvider:", 0, 0.0, a3.origin.y, a3.size.width, a3.size.height);
}

- (TKVibrationRecorderProgressView)initWithMaximumTimeInterval:(double)a3 styleProvider:(id)a4
{
  id v7;
  TKVibrationRecorderProgressView *v8;
  TKVibrationRecorderProgressView *v9;
  TKVibrationRecorderProgressView *v10;
  void *v11;
  UIView *v12;
  UIView *progressView;
  UIView *v14;
  void *v15;
  uint64_t v16;
  NSLayoutConstraint *progressViewWidthConstraint;
  NSMutableArray *v18;
  NSMutableArray *dots;
  objc_super v21;

  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)TKVibrationRecorderProgressView;
  v8 = -[TKVibrationRecorderProgressView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = v8;
  if (a3 <= 0.0)
  {
    v10 = v8;
    v9 = 0;
    goto LABEL_5;
  }
  if (v8)
  {
    objc_storeStrong((id *)&v8->_styleProvider, a4);
    v9->_currentTimeInterval = 0.0;
    v9->_maximumTimeInterval = a3;
    v9->_currentVibrationComponentDidBeginTimeInterval = -1.0;
    v9->_previousPauseDidBeginTimeInterval = -1.0;
    v10 = (TKVibrationRecorderProgressView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    objc_msgSend(v7, "vibrationRecorderProgressViewTrackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKVibrationRecorderProgressView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[TKVibrationRecorderProgressView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TKVibrationRecorderProgressView addSubview:](v9, "addSubview:", v10);
    -[UIView tk_constrainLayoutAttribute:asEqualToValueOfItem:](v10, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 1, v9);
    -[UIView tk_constrainLayoutAttribute:asEqualToValueOfItem:](v10, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 2, v9);
    -[UIView tk_constrainLayoutAttribute:asEqualToValueOfItem:](v10, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 3, v9);
    -[UIView tk_constrainLayoutAttribute:asEqualToValueOfItem:](v10, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 4, v9);
    v12 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    progressView = v9->_progressView;
    v9->_progressView = v12;

    v14 = v9->_progressView;
    -[TKVibrationRecorderProgressView tintColor](v9, "tintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TKVibrationRecorderProgressView addSubview:](v9, "addSubview:", v9->_progressView);
    -[UIView tk_constrainLayoutAttribute:asEqualToValueOfItem:](v9->_progressView, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 1, v9);
    -[UIView tk_constrainLayoutAttribute:asEqualToValueOfItem:](v9->_progressView, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 3, v9);
    -[UIView tk_constrainLayoutAttribute:asEqualToValueOfItem:](v9->_progressView, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 4, v9);
    -[UIView tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:withMultiplier:](v9->_progressView, "tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:withMultiplier:", 7, v9, 0.0);
    v16 = objc_claimAutoreleasedReturnValue();
    progressViewWidthConstraint = v9->_progressViewWidthConstraint;
    v9->_progressViewWidthConstraint = (NSLayoutConstraint *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    dots = v9->_dots;
    v9->_dots = v18;

LABEL_5:
  }

  return v9;
}

- (void)setCurrentTimeInterval:(double)a3
{
  double v4;
  double v5;
  double v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *progressViewWidthConstraint;
  double v18;
  CGRect v19;

  self->_currentTimeInterval = a3;
  -[TKVibrationRecorderProgressView _cappedValueForTimeInterval:](self, "_cappedValueForTimeInterval:");
  v5 = v4;
  v6 = v4 / self->_maximumTimeInterval;
  v7 = -[TKVibrationRecorderProgressView roundedCornersCompensationDelayMode](self, "roundedCornersCompensationDelayMode");
  if (v7 == 2)
  {
    -[TKVibrationRecorderProgressView _dotInsets](self, "_dotInsets");
    v11 = v10;
    -[TKVibrationRecorderProgressView _dotSize](self, "_dotSize");
    v9 = v11 + v12 * 0.5;
  }
  else
  {
    if (v7 != 1)
      goto LABEL_12;
    -[TKVibrationRecorderProgressView _dotInsets](self, "_dotInsets");
    v9 = v8;
  }
  if (v9 > 0.0 && v5 > 0.0)
  {
    -[TKVibrationRecorderProgressView bounds](self, "bounds");
    v13 = v9 / CGRectGetWidth(v19);
    v14 = v6 - (1.0 - (v13 + v13));
    if (v14 < 0.0)
      v14 = 0.0;
    v15 = v6 - v13 * (1.0 - v14 / (v13 + v13));
    if (v15 >= 2.22044605e-16)
      v6 = v15;
    else
      v6 = 2.22044605e-16;
  }
LABEL_12:
  -[NSLayoutConstraint tk_removeFromContainer](self->_progressViewWidthConstraint, "tk_removeFromContainer");
  -[UIView tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:withMultiplier:](self->_progressView, "tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:withMultiplier:", 7, self, v6);
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  progressViewWidthConstraint = self->_progressViewWidthConstraint;
  self->_progressViewWidthConstraint = v16;

  if (self->_dotForCurrentVibrationComponent)
  {
    v18 = v5 - self->_currentVibrationComponentDidBeginTimeInterval;
    -[TKVibrationRecorderProgressView _frameForDotAtTimeInterval:duration:](self, "_frameForDotAtTimeInterval:duration:");
    -[TKVibrationRecorderProgressView _updateHorizontalConstraintsOfDotForCurrentVibrationComponent:withFrame:](self, "_updateHorizontalConstraintsOfDotForCurrentVibrationComponent:withFrame:", self->_dotForCurrentVibrationComponent);
    -[TKVibrationRecorderProgressDotImageView setDuration:](self->_dotForCurrentVibrationComponent, "setDuration:", v18);
  }
}

- (void)_updateProgressViewBackgroundColor
{
  UIView *progressView;
  id v3;

  progressView = self->_progressView;
  -[TKVibrationRecorderProgressView tintColor](self, "tintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](progressView, "setBackgroundColor:", v3);

}

- (id)_resizableDotImage
{
  return (id)-[TKVibrationRecorderStyleProvider vibrationRecorderProgressViewResizableDotImage](self->_styleProvider, "vibrationRecorderProgressViewResizableDotImage");
}

- (CGSize)_dotSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TKVibrationRecorderProgressView _resizableDotImage](self, "_resizableDotImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIOffset)_dotInsets
{
  double v2;
  double v3;
  UIOffset result;

  -[TKVibrationRecorderStyleProvider vibrationRecorderProgressViewDotHorizontalInset](self->_styleProvider, "vibrationRecorderProgressViewDotHorizontalInset");
  v3 = 0.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (id)_dotTintColor
{
  return (id)-[TKVibrationRecorderStyleProvider vibrationRecorderProgressViewDotTintColor](self->_styleProvider, "vibrationRecorderProgressViewDotTintColor");
}

- (void)vibrationComponentDidStart
{
  double v3;
  double v4;
  TKVibrationRecorderProgressDotImageView *v5;
  void *v6;
  TKVibrationRecorderProgressDotImageView *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  TKVibrationRecorderProgressDotImageView *dotForCurrentVibrationComponent;

  -[TKVibrationRecorderProgressView _cappedValueForTimeInterval:](self, "_cappedValueForTimeInterval:", self->_currentTimeInterval);
  v4 = v3;
  self->_currentVibrationComponentDidBeginTimeInterval = v3;
  v5 = [TKVibrationRecorderProgressDotImageView alloc];
  -[TKVibrationRecorderProgressView _resizableDotImage](self, "_resizableDotImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TKVibrationRecorderProgressDotImageView initWithImage:](v5, "initWithImage:", v6);

  -[TKVibrationRecorderProgressView _dotTintColor](self, "_dotTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKVibrationRecorderProgressDotImageView setTintColor:](v7, "setTintColor:", v8);

  -[TKVibrationRecorderProgressDotImageView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TKVibrationRecorderProgressView addSubview:](self, "addSubview:", v7);
  -[TKVibrationRecorderProgressView _frameForDotAtTimeInterval:duration:](self, "_frameForDotAtTimeInterval:duration:", v4, 0.0);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[UIView tk_constrainLayoutAttribute:asEqualToValueOfItem:](v7, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 10, self);
  -[TKVibrationRecorderProgressView _updateHorizontalConstraintsOfDotForCurrentVibrationComponent:withFrame:](self, "_updateHorizontalConstraintsOfDotForCurrentVibrationComponent:withFrame:", v7, v10, v12, v14, v16);
  -[TKVibrationRecorderProgressDotImageView setTimeInterval:](v7, "setTimeInterval:", v4);
  -[TKVibrationRecorderProgressDotImageView setDuration:](v7, "setDuration:", 0.0);
  -[TKVibrationRecorderProgressDotImageView setPreviousPauseTimeInterval:](v7, "setPreviousPauseTimeInterval:", self->_previousPauseDidBeginTimeInterval);
  -[TKVibrationRecorderProgressDotImageView setPreviousPauseDuration:](v7, "setPreviousPauseDuration:", v4 - self->_previousPauseDidBeginTimeInterval);
  -[TKVibrationRecorderStyleProvider vibrationRecorderProgressViewAccessibilityAdditionalHeight](self->_styleProvider, "vibrationRecorderProgressViewAccessibilityAdditionalHeight");
  -[TKVibrationRecorderProgressDotImageView setAccessibilityFrameAdditionalHeight:](v7, "setAccessibilityFrameAdditionalHeight:");
  -[NSMutableArray addObject:](self->_dots, "addObject:", v7);
  dotForCurrentVibrationComponent = self->_dotForCurrentVibrationComponent;
  self->_dotForCurrentVibrationComponent = v7;

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)vibrationComponentDidEnd
{
  TKVibrationRecorderProgressDotImageView *dotForCurrentVibrationComponent;
  NSLayoutConstraint *dotForCurrentVibrationComponentLeftConstraint;
  NSLayoutConstraint *dotForCurrentVibrationComponentRightConstraint;
  double v6;

  dotForCurrentVibrationComponent = self->_dotForCurrentVibrationComponent;
  self->_dotForCurrentVibrationComponent = 0;

  dotForCurrentVibrationComponentLeftConstraint = self->_dotForCurrentVibrationComponentLeftConstraint;
  self->_dotForCurrentVibrationComponentLeftConstraint = 0;

  dotForCurrentVibrationComponentRightConstraint = self->_dotForCurrentVibrationComponentRightConstraint;
  self->_dotForCurrentVibrationComponentRightConstraint = 0;

  self->_currentVibrationComponentDidBeginTimeInterval = -1.0;
  -[TKVibrationRecorderProgressView _cappedValueForTimeInterval:](self, "_cappedValueForTimeInterval:", self->_currentTimeInterval);
  self->_previousPauseDidBeginTimeInterval = v6;
}

- (void)clearAllVibrationComponents
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_dots;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeFromSuperview", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_dots, "removeAllObjects");
  -[TKVibrationRecorderProgressView vibrationComponentDidEnd](self, "vibrationComponentDidEnd");
  self->_previousPauseDidBeginTimeInterval = -1.0;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  v2 = *MEMORY[0x24BDF7FB8];
  -[TKVibrationRecorderStyleProvider vibrationRecorderProgressViewHeight](self->_styleProvider, "vibrationRecorderProgressViewHeight");
  v4 = v3;
  v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)_updateHorizontalConstraintsOfDotForCurrentVibrationComponent:(id)a3 withFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  CGFloat v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, double);
  CGFloat MinX;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *dotForCurrentVibrationComponentLeftConstraint;
  CGFloat MaxX;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *dotForCurrentVibrationComponentRightConstraint;
  _QWORD v19[4];
  id v20;
  TKVibrationRecorderProgressView *v21;
  CGFloat v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[TKVibrationRecorderProgressView bounds](self, "bounds");
  v10 = CGRectGetWidth(v23);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __107__TKVibrationRecorderProgressView__updateHorizontalConstraintsOfDotForCurrentVibrationComponent_withFrame___block_invoke;
  v19[3] = &unk_24D3803D0;
  v20 = v9;
  v21 = self;
  v22 = v10;
  v11 = v9;
  v12 = (void (**)(_QWORD, _QWORD, double))MEMORY[0x2199E5D50](v19);
  -[NSLayoutConstraint tk_removeFromContainer](self->_dotForCurrentVibrationComponentLeftConstraint, "tk_removeFromContainer");
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MinX = CGRectGetMinX(v24);
  v12[2](v12, 1, MinX);
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  dotForCurrentVibrationComponentLeftConstraint = self->_dotForCurrentVibrationComponentLeftConstraint;
  self->_dotForCurrentVibrationComponentLeftConstraint = v14;

  -[NSLayoutConstraint tk_removeFromContainer](self->_dotForCurrentVibrationComponentRightConstraint, "tk_removeFromContainer");
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MaxX = CGRectGetMaxX(v25);
  v12[2](v12, 2, MaxX);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  dotForCurrentVibrationComponentRightConstraint = self->_dotForCurrentVibrationComponentRightConstraint;
  self->_dotForCurrentVibrationComponentRightConstraint = v17;

}

uint64_t __107__TKVibrationRecorderProgressView__updateHorizontalConstraintsOfDotForCurrentVibrationComponent_withFrame___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withMultiplier:", a2, 9, *(_QWORD *)(a1 + 40), (a3 + a3) / *(double *)(a1 + 48));
}

- (CGRect)_frameForDotAtTimeInterval:(double)a3 duration:(double)a4
{
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
  double maximumTimeInterval;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect v37;
  CGRect result;

  -[TKVibrationRecorderProgressView _dotSize](self, "_dotSize");
  v8 = v7;
  v10 = v9;
  v11 = v7 * 0.5;
  -[TKVibrationRecorderProgressView _dotInsets](self, "_dotInsets");
  v13 = v12;
  v15 = v14;
  v16 = v12 + v11;
  -[TKVibrationRecorderProgressView bounds](self, "bounds");
  v17 = CGRectGetWidth(v37) - v13 - v11 - v16;
  maximumTimeInterval = self->_maximumTimeInterval;
  v19 = a3 / maximumTimeInterval * v17;
  v20 = a4 / maximumTimeInterval * v17;
  v21 = v19 + v20 - (v17 - (v11 + v11));
  v22 = 0.0;
  if (v21 < 0.0)
    v21 = 0.0;
  v23 = v20 + v11 * (v21 / (v11 + v11));
  v24 = v11 - v19;
  if (v11 - v19 < 0.0)
    v24 = 0.0;
  v25 = v24 / v11;
  v26 = v19 - v11 * (v24 / v11);
  v27 = v23 + v11 * v25;
  v28 = v8 * 1.2 - v27;
  if (v28 < 0.0)
    v28 = 0.0;
  v29 = v27 - v8 * (1.0 - v28 / (v8 * 1.2));
  if (v29 < 0.0)
    v29 = 0.0;
  v30 = v17 - v11 - (v26 + v29);
  if (v30 < 0.0)
  {
    v31 = -v30;
    v32 = v29 + v30;
    if (v32 >= 0.0)
      v22 = v32;
    v26 = v26 - (v31 - (v29 - v22));
    v29 = v22;
  }
  v33 = v16 + v26;
  v34 = v8 + v29;
  v35 = v15;
  v36 = v10;
  result.size.height = v36;
  result.size.width = v34;
  result.origin.y = v35;
  result.origin.x = v33;
  return result;
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TKVibrationRecorderProgressView;
  -[TKVibrationRecorderProgressView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[TKVibrationRecorderProgressView _updateProgressViewBackgroundColor](self, "_updateProgressViewBackgroundColor");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TKVibrationRecorderProgressView;
  -[TKVibrationRecorderProgressView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[TKVibrationRecorderProgressView _updateProgressViewBackgroundColor](self, "_updateProgressViewBackgroundColor");
}

- (double)_cappedValueForTimeInterval:(double)result
{
  if (result < 0.0)
    result = 0.0;
  if (result >= self->_maximumTimeInterval)
    return self->_maximumTimeInterval;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return -[NSMutableArray count](self->_dots, "count") == 0;
}

- (id)accessibilityLabel
{
  return (id)TLLocalizedString();
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  TLLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("VIBRATION_RECORDER_PROGRESS_VALUE_FORMAT"), "isEqualToString:", v3) & 1) != 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)TKVibrationRecorderProgressView;
    -[TKVibrationRecorderProgressView accessibilityValue](&v8, sel_accessibilityValue);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[TKVibrationInterfaceUtilities descriptionForDuration:](TKVibrationInterfaceUtilities, "descriptionForDuration:", self->_currentTimeInterval);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[TKVibrationInterfaceUtilities descriptionForDuration:](TKVibrationInterfaceUtilities, "descriptionForDuration:", self->_maximumTimeInterval);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v3, v5, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  objc_super v5;
  CGRect v6;

  -[TKVibrationRecorderStyleProvider vibrationRecorderProgressViewAccessibilityAdditionalHeight](self->_styleProvider, "vibrationRecorderProgressViewAccessibilityAdditionalHeight");
  v4 = v3;
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderProgressView;
  -[TKVibrationRecorderProgressView accessibilityFrame](&v5, sel_accessibilityFrame);
  return CGRectInset(v6, 0.0, v4 * -0.5);
}

- (double)currentTimeInterval
{
  return self->_currentTimeInterval;
}

- (int)roundedCornersCompensationDelayMode
{
  return self->_roundedCornersCompensationDelayMode;
}

- (void)setRoundedCornersCompensationDelayMode:(int)a3
{
  self->_roundedCornersCompensationDelayMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dots, 0);
  objc_storeStrong((id *)&self->_dotForCurrentVibrationComponentRightConstraint, 0);
  objc_storeStrong((id *)&self->_dotForCurrentVibrationComponentLeftConstraint, 0);
  objc_storeStrong((id *)&self->_dotForCurrentVibrationComponent, 0);
  objc_storeStrong((id *)&self->_progressViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end
