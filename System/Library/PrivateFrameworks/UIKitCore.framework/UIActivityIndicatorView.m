@implementation UIActivityIndicatorView

- (void)tintColorDidChange
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIActivityIndicatorView;
  -[UIView tintColorDidChange](&v2, sel_tintColorDidChange);
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIActivityIndicatorView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView bounds](self, "bounds");
  -[UIActivityIndicatorView _updateSubviewFramesWithBounds:](self, "_updateSubviewFramesWithBounds:");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  int64_t v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIActivityIndicatorView;
  -[UIView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  v5 = -[UIActivityIndicatorView _actualStyleByResolvingAutoUpdatingStyle:](self, "_actualStyleByResolvingAutoUpdatingStyle:", self->_activityIndicatorViewStyle);
  if (v5 != self->_actualActivityIndicatorViewStyle)
  {
    self->_actualActivityIndicatorViewStyle = v5;
    -[UIActivityIndicatorView _updateLayoutInfo](self, "_updateLayoutInfo");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
  if (dyld_program_sdk_at_least())
  {
    -[UIView traitCollection](self, "traitCollection");

  }
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return 1;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (id)_imageForStep:(int64_t)a3 withColor:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t spokeCount;
  double v12;
  double v13;
  double v14;
  void *v15;
  double width;
  double v17;
  double v18;
  double v19;
  double height;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD *ContextStack;
  CGContext *v29;
  double v30;
  uint64_t i;
  id v32;
  size_t NumberOfComponents;
  id v34;
  const CGFloat *Components;
  double v36;
  int64_t v37;
  int64_t v38;
  uint64_t v39;
  int64_t v40;
  double v41;
  int64_t v42;
  int64_t v43;
  int64_t v44;
  double v45;
  void *v46;
  void *v47;

  v6 = a4;
  -[UIActivityIndicatorView _spokeWidthForGearWidth:](self, "_spokeWidthForGearWidth:", self->_width);
  v8 = v7;
  -[UIActivityIndicatorView _spokeLengthForGearWidth:](self, "_spokeLengthForGearWidth:", self->_width);
  v10 = v9;
  spokeCount = self->_spokeCount;
  -[UIActivityIndicatorView _widthForGearWidth:](self, "_widthForGearWidth:", self->_width);
  v13 = v12 * 0.5;
  v14 = 0.0;
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, v12 * 0.5 - v8, v10, v8 + v8, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  width = self->_width;
  -[UIActivityIndicatorView _widthForGearWidth:](self, "_widthForGearWidth:", width);
  v18 = (width - v17) * 0.5;
  if (self->_shadowColor)
  {
    v19 = self->_shadowOffset.width;
    height = self->_shadowOffset.height;
    v21 = -v19;
    if (v19 >= 0.0)
      v21 = 0.0;
    v22 = v18 + v21;
    v23 = -height;
    if (height >= 0.0)
      v23 = 0.0;
    v24 = v18 + fmax(v19, 0.0);
    v14 = v18 + fmax(height, 0.0);
    v25 = self->_width;
    v18 = v18 + v23;
    v26 = fabs(v19) + v25;
    v27 = v25 + fabs(height);
  }
  else
  {
    v26 = self->_width;
    v24 = 0.0;
    v22 = v18;
    v27 = v26;
  }
  _UIGraphicsBeginImageContextWithOptions(0, 0, v26, v27, 0.0);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v29 = 0;
  else
    v29 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  v30 = 6.28318531 / (double)spokeCount;
  if ((self->_shadowOffset.width > 0.0 || self->_shadowOffset.height > 0.0) && self->_shadowColor)
  {
    CGContextSaveGState(v29);
    CGContextTranslateCTM(v29, v24, v14);
    if (spokeCount >= 1)
    {
      for (i = 0; i != spokeCount; ++i)
      {
        CGContextSaveGState(v29);
        CGContextTranslateCTM(v29, v13, v13);
        CGContextRotateCTM(v29, -v30 * (double)(int)i);
        CGContextTranslateCTM(v29, -v13, -v13);
        -[UIColor set](self->_shadowColor, "set");
        objc_msgSend(v15, "fill");
        CGContextRestoreGState(v29);
      }
    }
    CGContextTranslateCTM(v29, -v24, -v14);
    CGContextRestoreGState(v29);
  }
  v32 = objc_retainAutorelease(v6);
  NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)objc_msgSend(v32, "CGColor"));
  v34 = objc_retainAutorelease(v32);
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v34, "CGColor"));
  if ((_DWORD)NumberOfComponents)
    v36 = *(const CGFloat *)((char *)Components + ((uint64_t)((NumberOfComponents << 32) - 0x100000000) >> 29));
  else
    v36 = 1.0;
  CGContextSaveGState(v29);
  CGContextTranslateCTM(v29, v24, v14);
  v37 = -[UIActivityIndicatorView _spokeFrameRatio](self, "_spokeFrameRatio");
  v38 = -[UIActivityIndicatorView _spokeFrameRatio](self, "_spokeFrameRatio");
  if (spokeCount >= 1)
  {
    v39 = 0;
    v40 = a3 % v37;
    v41 = -v30;
    v42 = a3 / v38;
    do
    {
      v43 = v40 + -[UIActivityIndicatorView _spokeFrameRatio](self, "_spokeFrameRatio") * (v42 + v39);
      v44 = v43 % (-[UIActivityIndicatorView _spokeFrameRatio](self, "_spokeFrameRatio") * spokeCount);
      CGContextSaveGState(v29);
      CGContextTranslateCTM(v29, v13, v13);
      CGContextRotateCTM(v29, v41 * (double)(int)v39);
      CGContextTranslateCTM(v29, -v13, -v13);
      -[UIActivityIndicatorView _alphaValueForStep:](self, "_alphaValueForStep:", v44);
      objc_msgSend(v34, "colorWithAlphaComponent:", v36 * v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "set");

      objc_msgSend(v15, "fillWithBlendMode:alpha:", 17, 0.85);
      CGContextRestoreGState(v29);
      ++v39;
    }
    while (spokeCount != v39);
  }
  CGContextTranslateCTM(v29, -v22, -v18);
  CGContextRestoreGState(v29);
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v47;
}

- (int64_t)_spokeFrameRatio
{
  return self->_spokeFrameRatio;
}

- (double)_alphaValueForStep:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  double result;

  v5 = -[UIActivityIndicatorView _spokeCount](self, "_spokeCount");
  v6 = -[UIActivityIndicatorView _spokeFrameRatio](self, "_spokeFrameRatio") * v5;
  result = 1.0;
  if ((unint64_t)(v6 - 2) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    result = -0.68 / (double)(v6 / 2) * (double)a3 + 1.0;
    if (result < 0.32)
      return 0.32;
  }
  return result;
}

- (int64_t)_spokeCount
{
  return self->_spokeCount;
}

- (double)_widthForGearWidth:(double)result
{
  if (result == 37.0)
    return 35.0;
  return result;
}

- (double)_spokeWidthForGearWidth:(double)a3
{
  int64_t actualActivityIndicatorViewStyle;
  BOOL v5;
  double v6;
  _BOOL4 v8;
  BOOL v10;
  double v11;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  _BOOL4 v18;
  float v19;
  double v20;

  actualActivityIndicatorViewStyle = self->_actualActivityIndicatorViewStyle;
  v5 = a3 < 20.0 && actualActivityIndicatorViewStyle == 16;
  v6 = 1.0;
  if (a3 == 14.0 || v5)
    return v6;
  v8 = a3 < 30.0 && actualActivityIndicatorViewStyle == 16;
  if (a3 == 20.0 || v8)
  {
    v10 = self->_spokeCount == 12;
    v11 = 1.25;
    v6 = 1.0;
    goto LABEL_20;
  }
  v14 = a3 < 32.0 && actualActivityIndicatorViewStyle == 16;
  v6 = 1.75;
  if (a3 != 30.0 && !v14)
  {
    v15 = a3 < 37.0 && actualActivityIndicatorViewStyle == 16;
    v16 = v15;
    v6 = 2.0;
    if (a3 != 32.0 && !v16)
    {
      v18 = a3 < 42.75 && actualActivityIndicatorViewStyle == 16;
      if (a3 == 37.0 || v18)
      {
        v10 = self->_spokeCount == 12;
        v11 = 2.5;
        v6 = 1.5;
        goto LABEL_20;
      }
      if (a3 < 60.0 && actualActivityIndicatorViewStyle == 16)
      {
        if (a3 >= 48.5)
        {
          v10 = self->_spokeCount == 12;
          if (a3 >= 54.25)
          {
            v11 = 3.5;
            v6 = 3.0;
          }
          else
          {
            v11 = 3.0;
            v6 = 2.5;
          }
        }
        else
        {
          v10 = self->_spokeCount == 12;
          v11 = 3.0;
          v6 = 2.0;
        }
LABEL_20:
        if (!v10)
          return v11;
        return v6;
      }
      v6 = 3.5;
      if (a3 != 60.0)
      {
        v19 = a3 / 7.5;
        v20 = nearbyintf(v19) * 0.5;
        v6 = 1.0;
        if (v20 >= 1.0)
          return v20;
      }
    }
  }
  return v6;
}

- (double)_spokeLengthForGearWidth:(double)a3
{
  int64_t actualActivityIndicatorViewStyle;
  double v5;
  double result;
  BOOL v8;

  actualActivityIndicatorViewStyle = self->_actualActivityIndicatorViewStyle;
  if (a3 > 14.0 || actualActivityIndicatorViewStyle != 16)
  {
    v5 = 4.0;
    if (a3 == 14.0)
      return v5;
    if (a3 > 20.0 || actualActivityIndicatorViewStyle != 16)
    {
      if (a3 == 20.0)
      {
        v5 = 5.0;
        if (self->_spokeCount == 12)
          return v5;
      }
      else
      {
        v8 = a3 <= 24.0 && actualActivityIndicatorViewStyle == 16;
        if (!v8
          && a3 != 24.0
          && (a3 > 30.0 || actualActivityIndicatorViewStyle != 16)
          && a3 != 30.0
          && (a3 > 32.0 || actualActivityIndicatorViewStyle != 16))
        {
          v5 = 10.0;
          if (a3 == 32.0)
            return v5;
          if (a3 > 40.0 || actualActivityIndicatorViewStyle != 16)
          {
            v5 = 14.0;
            if (a3 == 40.0)
              return v5;
            if (a3 > 60.0 || actualActivityIndicatorViewStyle != 16)
            {
              v5 = 19.0;
              if (a3 == 60.0)
                return v5;
              if ((a3 > 64.0 || actualActivityIndicatorViewStyle != 16)
                && a3 != 64.0
                && actualActivityIndicatorViewStyle != 16)
              {
                v5 = 10.0;
                if (self->_spokeCount != 12)
                  return 12.0;
                return v5;
              }
            }
          }
        }
      }
    }
  }
  UIRoundToViewScale(self);
  return result;
}

- (void)_setUpAnimation
{
  _UIActivityIndicatorViewStyleView *styleView;
  uint64_t v4;
  void *v5;
  NSArray *spokeHighlightImages;
  void *v7;
  void *v8;

  styleView = self->_styleView;
  if (styleView)
  {
    -[_UIActivityIndicatorViewStyleView setUpAnimation](styleView, "setUpAnimation");
  }
  else
  {
    v4 = -[UIActivityIndicatorView _indexOfFirstImageForStartingAnimation](self, "_indexOfFirstImageForStartingAnimation");
    _reorderImagesToStartAtIndex(self->_spokeImages, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setAnimationImages:](self->_animatingImageView, "setAnimationImages:", v5);

    spokeHighlightImages = self->_spokeHighlightImages;
    if (spokeHighlightImages)
    {
      _reorderImagesToStartAtIndex(spokeHighlightImages, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setHighlightedAnimationImages:](self->_animatingImageView, "setHighlightedAnimationImages:", v7);

    }
    else
    {
      -[UIImageView setHighlightedAnimationImages:](self->_animatingImageView, "setHighlightedAnimationImages:", 0);
    }
    if (self->_duration == 0.0)
    {
      +[_UIActivityIndicatorSettingsDomain rootSettings](_UIActivityIndicatorSettingsDomain, "rootSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fullLoopDuration");
      -[UIImageView setAnimationDuration:](self->_animatingImageView, "setAnimationDuration:");

    }
    else
    {
      -[UIImageView setAnimationDuration:](self->_animatingImageView, "setAnimationDuration:");
    }
    -[UIImageView setAnimationRepeatCount:](self->_animatingImageView, "setAnimationRepeatCount:", 0);
    -[UIImageView startAnimating](self->_animatingImageView, "startAnimating");
  }
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  _UIActivityIndicatorViewStyleView *v4;
  _UIActivityIndicatorViewStyleView *styleView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIActivityIndicatorView;
  v4 = (_UIActivityIndicatorViewStyleView *)a3;
  -[UIView _intrinsicContentSizeInvalidatedForChildView:](&v6, sel__intrinsicContentSizeInvalidatedForChildView_, v4);
  styleView = self->_styleView;

  if (styleView == v4)
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", v6.receiver, v6.super_class);
}

- (unint64_t)_indexOfFirstImageForStartingAnimation
{
  _BOOL4 v3;
  UIImageView *animatingImageView;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSArray *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  BOOL v15;

  v3 = -[UIActivityIndicatorView isHighlighted](self, "isHighlighted");
  animatingImageView = self->_animatingImageView;
  if (v3)
  {
    -[UIImageView highlightedImage](animatingImageView, "highlightedImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[UIImageView image](self->_animatingImageView, "image");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    if (!v8)
      goto LABEL_22;
  }
  else
  {
    -[UIImageView image](animatingImageView, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_22:
      v11 = 0;
      goto LABEL_23;
    }
  }
  v9 = 13;
  if (v3)
    v9 = 12;
  v10 = (NSArray *)objc_retain(*(id *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___UIActivityIndicatorView__shadowOffset[v9]));
  if (!v10)
    v10 = self->_spokeImages;
  v11 = -[NSArray indexOfObject:](v10, "indexOfObject:", v8);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = 12;
    if (v3)
      v12 = 13;
    v13 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                            + OBJC_IVAR___UIActivityIndicatorView__shadowOffset[v12]));
    v14 = objc_msgSend(v13, "indexOfObject:", v8);
    if (v14)
      v15 = v14 == 0x7FFFFFFFFFFFFFFFLL;
    else
      v15 = 1;
    if (v15 || (v11 = v14, v14 >= -[NSArray count](v10, "count")))
      v11 = 0;

  }
LABEL_23:

  return v11;
}

- (void)_setCustomWidth:(double)a3
{
  double v5;

  if (self->_activityIndicatorViewStyle != 16)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("_customWidth property only modifiable for UIActivityIndicatorViewStyleCustom"));
  v5 = fmax(a3, 0.0);
  if (v5 != self->_customWidth)
  {
    self->_customWidth = v5;
    -[UIActivityIndicatorView _updateLayoutInfo](self, "_updateLayoutInfo");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle
{
  int64_t v4;
  int64_t v5;
  UIColor *v6;
  UIColor *color;

  v4 = -[UIActivityIndicatorView _internalStyleForStyle:](self, "_internalStyleForStyle:", activityIndicatorViewStyle);
  if (self->_actualActivityIndicatorViewStyle != v4)
  {
    v5 = v4;
    self->_activityIndicatorViewStyle = v4;
    self->_actualActivityIndicatorViewStyle = -[UIActivityIndicatorView _actualStyleByResolvingAutoUpdatingStyle:](self, "_actualStyleByResolvingAutoUpdatingStyle:", v4);
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      -[UIActivityIndicatorView _defaultColorForStyle:](self, "_defaultColorForStyle:", v5);
      v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
      color = self->_color;
      self->_color = v6;

    }
    -[UIActivityIndicatorView _updateMessageForStyle:](self, "_updateMessageForStyle:", v5);
    -[UIActivityIndicatorView _updateVisualStyleProperties](self, "_updateVisualStyleProperties");
    -[UIActivityIndicatorView _updateLayoutInfo](self, "_updateLayoutInfo");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setColor:(UIColor *)color
{
  UIColor *v5;

  v5 = color;
  if (self->_color != v5)
  {
    objc_storeStrong((id *)&self->_color, color);
    self->_disableUpdateColorOnTraitCollectionChange = v5 != 0;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIActivityIndicatorView _updateVisualStyleProperties](self, "_updateVisualStyleProperties");
  }

}

- (void)startAnimating
{
  if (!-[UIActivityIndicatorView isAnimating](self, "isAnimating"))
  {
    -[UIActivityIndicatorView _setUpAnimation](self, "_setUpAnimation");
    self->_animating = 1;
    -[UIActivityIndicatorView _updateVisualStyleProperties](self, "_updateVisualStyleProperties");
    if (-[UIActivityIndicatorView hidesWhenStopped](self, "hidesWhenStopped"))
      -[UIView setHidden:](self, "setHidden:", 0);
  }
}

- (void)stopAnimating
{
  -[UIActivityIndicatorView _tearDownAnimation](self, "_tearDownAnimation");
  self->_animating = 0;
  -[UIActivityIndicatorView _updateVisualStyleProperties](self, "_updateVisualStyleProperties");
  if (!self->_styleView)
  {
    if (-[UIActivityIndicatorView hidesWhenStopped](self, "hidesWhenStopped"))
      -[UIView setHidden:](self, "setHidden:", 1);
  }
}

- (BOOL)hidesWhenStopped
{
  return self->_hidesWhenStopped;
}

- (UIActivityIndicatorView)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style
{
  int64_t v4;
  double v5;
  double v6;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *v8;
  objc_super v10;

  v4 = -[UIActivityIndicatorView _internalStyleForStyle:](self, "_internalStyleForStyle:", style);
  objc_msgSend((id)objc_opt_class(), "defaultSizeForStyle:", v4);
  v10.receiver = self;
  v10.super_class = (Class)UIActivityIndicatorView;
  v7 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, 0.0, 0.0, v5, v6);
  v8 = v7;
  if (v7)
  {
    -[UIActivityIndicatorView _commonInit](v7, "_commonInit");
    v8->_activityIndicatorViewStyle = v4;
    v8->_actualActivityIndicatorViewStyle = -[UIActivityIndicatorView _actualStyleByResolvingAutoUpdatingStyle:](v8, "_actualStyleByResolvingAutoUpdatingStyle:", v4);
    -[UIActivityIndicatorView _updateMessageForStyle:](v8, "_updateMessageForStyle:", v4);
    -[UIActivityIndicatorView _refreshStyle](v8, "_refreshStyle");
  }
  return v8;
}

- (void)_updateMessageForStyle:(int64_t)a3
{
  id v4;

  if (a3 == 22)
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("Loading"), CFSTR("Loading"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView _setMessage:](self, "_setMessage:", v4);

  }
  else
  {
    -[UIActivityIndicatorView _setMessage:](self, "_setMessage:", 0);
  }
}

- (void)_setMessage:(id)a3
{
  id v5;
  NSString *v6;
  NSString *v7;
  char v8;
  NSString *v9;
  _UIActivityIndicatorMessageLabel *v10;
  void *v11;
  _UIActivityIndicatorMessageLabel *v12;
  _UIActivityIndicatorMessageLabel *messageLabel;
  void *v14;
  NSString *v15;

  v5 = a3;
  v6 = self->_message;
  v7 = (NSString *)v5;
  v15 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[NSString isEqual:](v6, "isEqual:", v7);

      v9 = v15;
      if ((v8 & 1) != 0)
        goto LABEL_14;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_message, a3);
    if (-[NSString length](v15, "length"))
    {
      if (!self->_messageLabel)
      {
        v10 = [_UIActivityIndicatorMessageLabel alloc];
        +[_UIActivityIndicatorMessageLabel defaultRegularContentSizeTextAttributes](_UIActivityIndicatorMessageLabel, "defaultRegularContentSizeTextAttributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[_UIActivityIndicatorMessageLabel initWithRegularTextAttributes:](v10, "initWithRegularTextAttributes:", v11);
        messageLabel = self->_messageLabel;
        self->_messageLabel = v12;

        -[UIView addSubview:](self, "addSubview:", self->_messageLabel);
      }
      -[NSString localizedUppercaseString](v15, "localizedUppercaseString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityIndicatorMessageLabel setText:](self->_messageLabel, "setText:", v14);

    }
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
  v9 = v15;
LABEL_14:

}

- (void)_commonInit
{
  int64_t v3;
  id v4;

  -[UIActivityIndicatorView setHidesWhenStopped:](self, "setHidesWhenStopped:", 1);
  self->_shadowOffset = (CGSize)*MEMORY[0x1E0C9D820];
  v3 = -[UIActivityIndicatorView _internalStyleForStyle:](self, "_internalStyleForStyle:", -[UIActivityIndicatorView _defaultStyle](self, "_defaultStyle"));
  self->_activityIndicatorViewStyle = v3;
  self->_actualActivityIndicatorViewStyle = -[UIActivityIndicatorView _actualStyleByResolvingAutoUpdatingStyle:](self, "_actualStyleByResolvingAutoUpdatingStyle:", v3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__applicationWillEnterForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

}

- (int64_t)_actualStyleByResolvingAutoUpdatingStyle:(int64_t)a3
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;

  if (a3 == 22)
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    if (IsAccessibilityCategory)
      return 10;
    else
      return 9;
  }
  return a3;
}

- (int64_t)_internalStyleForStyle:(int64_t)a3
{
  return a3;
}

- (void)setHidesWhenStopped:(BOOL)hidesWhenStopped
{
  self->_hidesWhenStopped = hidesWhenStopped;
  if (!-[UIActivityIndicatorView isAnimating](self, "isAnimating") && !self->_styleView)
    -[UIView setHidden:](self, "setHidden:", self->_hidesWhenStopped);
  -[UIActivityIndicatorView _updateVisualStyleProperties](self, "_updateVisualStyleProperties");
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (int64_t)_defaultStyle
{
  if (dyld_program_sdk_at_least())
    return 100;
  else
    return 1;
}

- (void)_refreshStyle
{
  _UIActivityIndicatorViewStyleView *styleView;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  _UIActivityIndicatorViewStyleView *v8;
  _UIActivityIndicatorViewStyleView *v9;
  _UIActivityIndicatorViewStyleView *v10;

  -[UIView removeFromSuperview](self->_styleView, "removeFromSuperview");
  styleView = self->_styleView;
  self->_styleView = 0;

  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_msgSend(v6, "visualStyleClassForStylableClass:", objc_opt_class());

  if (v7)
  {
    v8 = (_UIActivityIndicatorViewStyleView *)objc_msgSend([v7 alloc], "initWithProvider:", self);
    v9 = self->_styleView;
    self->_styleView = v8;
    v10 = v8;

    -[UIView addSubview:](self, "addSubview:", self->_styleView);
    -[UIView removeFromSuperview](self->_animatingImageView, "removeFromSuperview");

    -[UIView setHidden:](self, "setHidden:", 0);
  }
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIActivityIndicatorView _updateVisualStyleProperties](self, "_updateVisualStyleProperties");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateVisualStyleProperties
{
  -[_UIActivityIndicatorViewStyleView setAnimating:](self->_styleView, "setAnimating:", self->_animating);
  -[_UIActivityIndicatorViewStyleView setActivityIndicatorViewStyle:](self->_styleView, "setActivityIndicatorViewStyle:", self->_activityIndicatorViewStyle);
  -[_UIActivityIndicatorViewStyleView setColor:](self->_styleView, "setColor:", self->_color);
  -[_UIActivityIndicatorViewStyleView setHidesWhenStopped:](self->_styleView, "setHidesWhenStopped:", self->_hidesWhenStopped);
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  _UIActivityIndicatorViewStyleView *styleView;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double width;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  styleView = self->_styleView;
  if (styleView)
  {
    -[_UIActivityIndicatorViewStyleView sizeThatFits:](styleView, "sizeThatFits:", a3.width, a3.height);
    v6 = v5;
    v8 = v7;
  }
  else
  {
    -[UIActivityIndicatorView _defaultSizeConsultingCustomWidthIfApplicable](self, "_defaultSizeConsultingCustomWidthIfApplicable", a3.width, a3.height);
    v6 = v10;
    v8 = v9;
    width = self->_shadowOffset.width;
    if ((width > 0.0 || self->_shadowOffset.height > 0.0) && self->_shadowColor)
    {
      v12 = fabs(width);
      v6 = v6 + v12 + v12;
      v13 = fabs(self->_shadowOffset.height);
      v8 = v9 + v13 + v13;
    }
    if (-[UIActivityIndicatorView _isShowingMessage](self, "_isShowingMessage"))
    {
      -[UILabel intrinsicContentSize](self->_messageLabel, "intrinsicContentSize");
      v15 = v14;
      v17 = v16;
      -[_UIActivityIndicatorMessageLabel verticalSpacingToSpinner](self->_messageLabel, "verticalSpacingToSpinner");
      v8 = v8 + v17 + v18;
      if (v6 < v15)
        v6 = v15;
    }
  }
  v19 = v6;
  v20 = v8;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)_updateSubviewFramesWithBounds:(CGRect)a3
{
  _UIActivityIndicatorViewStyleView *styleView;
  _UIActivityIndicatorMessageLabel *messageLabel;
  double height;
  double width;
  double y;
  double x;
  UIImageView *v10;
  UIImageView *v11;
  UIImageView *animatingImageView;
  _UIActivityIndicatorMessageLabel *v13;

  styleView = self->_styleView;
  if (styleView)
  {
    -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    messageLabel = (_UIActivityIndicatorMessageLabel *)styleView;
LABEL_7:
    -[UILabel setFrame:](messageLabel, "setFrame:");
    return;
  }
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!self->_animatingImageView)
  {
    v10 = [UIImageView alloc];
    v11 = -[UIImageView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    animatingImageView = self->_animatingImageView;
    self->_animatingImageView = v11;

    -[UIView addSubview:](self, "addSubview:", self->_animatingImageView);
  }
  -[UIActivityIndicatorView _animatingImageViewFrameForBounds:](self, "_animatingImageViewFrameForBounds:", x, y, width, height);
  -[UIImageView setFrame:](self->_animatingImageView, "setFrame:");
  if (-[UIActivityIndicatorView _isShowingMessage](self, "_isShowingMessage"))
  {
    -[UIActivityIndicatorView _messageLabelFrameForBounds:](self, "_messageLabelFrameForBounds:", x, y, width, height);
    messageLabel = self->_messageLabel;
    goto LABEL_7;
  }
  -[UIView removeFromSuperview](self->_messageLabel, "removeFromSuperview");
  v13 = self->_messageLabel;
  self->_messageLabel = 0;

}

- (BOOL)_isShowingMessage
{
  return -[NSString length](self->_message, "length") != 0;
}

- (CGRect)_animatingImageViewFrameForBounds:(CGRect)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _UIActivityIndicatorMessageLabel *messageLabel;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  -[UIActivityIndicatorView _defaultSizeConsultingCustomWidthIfApplicable](self, "_defaultSizeConsultingCustomWidthIfApplicable", a3.origin.x, a3.origin.y);
  v7 = v6;
  v9 = self->_shadowOffset.width;
  v8 = self->_shadowOffset.height;
  v10 = fabs(v8);
  v12 = v11 + v10;
  messageLabel = self->_messageLabel;
  v14 = v9;
  v15 = v11 + v10;
  if (messageLabel)
  {
    -[_UIActivityIndicatorMessageLabel verticalSpacingToSpinner](messageLabel, "verticalSpacingToSpinner");
    v17 = v12 + v16;
    -[UILabel intrinsicContentSize](self->_messageLabel, "intrinsicContentSize");
    v15 = v17 + v18;
    v14 = self->_shadowOffset.width;
    v8 = self->_shadowOffset.height;
    v10 = fabs(v8);
  }
  v19 = v7 + fabs(v9);
  v20 = floor((width - v19) * 0.5) + v14;
  v21 = v8 + floor((height - v15) * 0.5);
  v22 = v19 + fabs(v14);
  v23 = v12 + v10;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGSize)_defaultSizeConsultingCustomWidthIfApplicable
{
  double v2;
  double v3;
  CGSize result;

  if (self->_actualActivityIndicatorViewStyle == 16)
  {
    -[UIActivityIndicatorView _effectiveCustomWidth](self, "_effectiveCustomWidth");
    v3 = v2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultSizeForStyle:", self->_actualActivityIndicatorViewStyle);
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)defaultSizeForStyle:(int64_t)a3
{
  double v4;
  double v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  NSObject *v16;
  int v17;
  int64_t v18;
  uint64_t v19;
  CGSize result;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = 37.0;
  v5 = 37.0;
  switch(a3)
  {
    case 0:
    case 10:
    case 16:
      break;
    case 1:
    case 2:
    case 9:
      goto LABEL_5;
    case 3:
    case 5:
    case 8:
      v4 = 14.0;
      v5 = 14.0;
      break;
    case 4:
      v5 = 15.0;
      v4 = 14.0;
      break;
    case 6:
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scale");
      if (v9 <= 1.0)
        v4 = 12.0;
      else
        v4 = 10.0;
      v5 = 20.0;

      break;
    case 7:
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scale");
      if (v11 <= 1.0)
        v4 = 13.0;
      else
        v4 = 13.5;
      goto LABEL_25;
    case 11:
      v5 = 24.0;
      v4 = 12.0;
      break;
    case 12:
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scale");
      if (v12 <= 1.0)
        v4 = 17.0;
      else
        v4 = 17.5;
LABEL_25:

      goto LABEL_31;
    case 13:
    case 21:
      v4 = 24.0;
      v5 = 24.0;
      break;
    case 14:
    case 15:
      goto LABEL_7;
    case 17:
      v4 = 20.0;
      v5 = 40.0;
      break;
    case 18:
      v4 = 27.0;
      v5 = 27.0;
      break;
    case 19:
      *(double *)&v13 = 40.0;
      goto LABEL_30;
    case 20:
      *(double *)&v13 = 64.0;
LABEL_30:
      v4 = *(double *)&v13;
LABEL_31:
      v5 = v4;
      break;
    default:
      v5 = 37.0;
      if (a3 != 101)
      {
        if (a3 == 100)
        {
LABEL_5:
          v4 = 20.0;
          v5 = 20.0;
        }
        else
        {
LABEL_7:
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              v17 = 134217984;
              v18 = a3;
              _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "Unknown UIActivityIndicatorViewStyle: %ld", (uint8_t *)&v17, 0xCu);
            }

          }
          else
          {
            v6 = defaultSizeForStyle____s_category;
            if (!defaultSizeForStyle____s_category)
            {
              v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v6, (unint64_t *)&defaultSizeForStyle____s_category);
            }
            v7 = *(NSObject **)(v6 + 8);
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            {
              v17 = 134217984;
              v18 = a3;
              _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Unknown UIActivityIndicatorViewStyle: %ld", (uint8_t *)&v17, 0xCu);
            }
          }
          v4 = *MEMORY[0x1E0C9D820];
          v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        }
      }
      break;
  }
  v14 = v4;
  v15 = v5;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  void *v5;
  int64_t actualActivityIndicatorViewStyle;
  int64_t activityIndicatorViewStyle;
  void *v8;
  void *v9;
  _UIActivityIndicatorViewArtworkCacheKey *v10;
  _UIActivityIndicatorViewArtworkCacheKey *v11;
  _UIActivityIndicatorViewArtworkCacheKey *v12;
  _UIActivityIndicatorViewArtworkCacheKey *lastArtCacheKey;
  NSArray *v14;
  _BOOL4 v15;
  BOOL v16;
  NSArray *v17;
  NSArray *spokeImages;
  _UIActivityIndicatorViewArtworkCacheKey *v19;
  void *v20;
  void *v21;
  _UIActivityIndicatorViewArtworkCacheKey *v22;
  _UIActivityIndicatorViewArtworkCacheKey *v23;
  _UIActivityIndicatorViewArtworkCacheKey *v24;
  _UIActivityIndicatorViewArtworkCacheKey *lastHighlightArtCacheKey;
  NSArray *v26;
  _BOOL4 v27;
  BOOL v28;
  NSArray *v29;
  NSArray *v30;
  NSArray *spokeHighlightImages;
  _UIActivityIndicatorViewArtworkCacheKey *v32;
  _BOOL4 animating;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)UIActivityIndicatorView;
  -[UIView layoutSubviews](&v37, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIActivityIndicatorView _updateSubviewFramesWithBounds:](self, "_updateSubviewFramesWithBounds:");
  if (self->_styleView)
  {
    if (self->_restartAnimationOnNextLayout && self->_animating)
    {
      -[UIView window](self, "window");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        -[UIActivityIndicatorView _setUpAnimation](self, "_setUpAnimation");
        self->_restartAnimationOnNextLayout = 0;
      }
    }
    return;
  }
  if (!layoutSubviews___AIVArtCache)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v5 = (void *)layoutSubviews___AIVArtCache;
    layoutSubviews___AIVArtCache = (uint64_t)v4;

    objc_msgSend((id)layoutSubviews___AIVArtCache, "setName:", CFSTR("com.apple.UIKit.UIActivityIndicatorViewGearImagesCache"));
  }
  if (!self->_lastArtCacheKey)
    -[UIActivityIndicatorView _updateLayoutInfo](self, "_updateLayoutInfo");
  if (self->_activityIndicatorViewStyle == 16)
  {
    actualActivityIndicatorViewStyle = 16;
    self->_actualActivityIndicatorViewStyle = 16;
    goto LABEL_18;
  }
  if (-[UIActivityIndicatorView _shouldGoToCustomStyle](self, "_shouldGoToCustomStyle"))
  {
    activityIndicatorViewStyle = -[UIActivityIndicatorView _customStyleForStyle:](self, "_customStyleForStyle:", self->_activityIndicatorViewStyle);
LABEL_16:
    actualActivityIndicatorViewStyle = -[UIActivityIndicatorView _actualStyleByResolvingAutoUpdatingStyle:](self, "_actualStyleByResolvingAutoUpdatingStyle:", activityIndicatorViewStyle);
    self->_actualActivityIndicatorViewStyle = actualActivityIndicatorViewStyle;
    goto LABEL_18;
  }
  if (-[UIActivityIndicatorView _shouldGoBackToBaseStyle](self, "_shouldGoBackToBaseStyle"))
  {
    activityIndicatorViewStyle = self->_activityIndicatorViewStyle;
    goto LABEL_16;
  }
  actualActivityIndicatorViewStyle = self->_actualActivityIndicatorViewStyle;
LABEL_18:
  -[UIActivityIndicatorView color](self, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView _artCacheKeyWithStyle:color:](self, "_artCacheKeyWithStyle:color:", actualActivityIndicatorViewStyle, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_lastArtCacheKey;
  v11 = v9;
  v12 = v11;
  lastArtCacheKey = v11;
  v14 = (NSArray *)v11;
  v15 = v10 != v11;
  if (v10 != v11)
  {
    if (v11 && v10)
    {
      v16 = -[_UIActivityIndicatorViewArtworkCacheKey isEqual:](v10, "isEqual:", v11);

      if (v16)
      {
        v15 = 0;
        goto LABEL_28;
      }
    }
    else
    {

    }
    objc_msgSend((id)layoutSubviews___AIVArtCache, "objectForKey:", v12);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      -[UIActivityIndicatorView _imagesForStyle:color:highlight:](self, "_imagesForStyle:color:highlight:", actualActivityIndicatorViewStyle, v8, 0);
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)layoutSubviews___AIVArtCache, "setObject:forKey:", v17, v12);
    }
    spokeImages = self->_spokeImages;
    self->_spokeImages = v17;
    v14 = v17;

    v19 = v12;
    lastArtCacheKey = self->_lastArtCacheKey;
    self->_lastArtCacheKey = v19;
  }

LABEL_28:
  -[UIActivityIndicatorView _highlightColorForStyle:](self, "_highlightColorForStyle:", actualActivityIndicatorViewStyle);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[UIActivityIndicatorView _artCacheKeyWithStyle:color:](self, "_artCacheKeyWithStyle:color:", actualActivityIndicatorViewStyle, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = self->_lastHighlightArtCacheKey;
    v23 = v21;
    v24 = v23;
    lastHighlightArtCacheKey = v23;
    v26 = (NSArray *)v23;
    v27 = v22 != v23;
    if (v22 != v23)
    {
      if (v23 && v22)
      {
        v28 = -[_UIActivityIndicatorViewArtworkCacheKey isEqual:](v22, "isEqual:", v23);

        if (v28)
        {
          v27 = 0;
          goto LABEL_40;
        }
      }
      else
      {

      }
      objc_msgSend((id)layoutSubviews___AIVArtCache, "objectForKey:", v24);
      v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        -[UIActivityIndicatorView _imagesForStyle:color:highlight:](self, "_imagesForStyle:color:highlight:", actualActivityIndicatorViewStyle, v20, 1);
        v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)layoutSubviews___AIVArtCache, "setObject:forKey:", v30, v24);
      }
      spokeHighlightImages = self->_spokeHighlightImages;
      self->_spokeHighlightImages = v30;
      v26 = v30;

      v32 = v24;
      lastHighlightArtCacheKey = self->_lastHighlightArtCacheKey;
      self->_lastHighlightArtCacheKey = v32;
    }

  }
  else
  {
    v29 = self->_spokeHighlightImages;
    self->_spokeHighlightImages = 0;

    v24 = self->_lastHighlightArtCacheKey;
    v27 = v24 != 0;
    self->_lastHighlightArtCacheKey = 0;
  }
LABEL_40:

  if (v15 || v27 || self->_restartAnimationOnNextLayout)
  {
    animating = self->_animating;
    if (self->_animating)
      -[UIActivityIndicatorView _tearDownAnimation](self, "_tearDownAnimation");
    -[NSArray firstObject](self->_spokeImages, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_animatingImageView, "setImage:", v34);

    -[NSArray firstObject](self->_spokeHighlightImages, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setHighlightedImage:](self->_animatingImageView, "setHighlightedImage:", v35);

    if (animating)
    {
      -[UIView window](self, "window");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        -[UIActivityIndicatorView _setUpAnimation](self, "_setUpAnimation");
        self->_restartAnimationOnNextLayout = 0;
      }
    }
  }

}

- (UIColor)color
{
  UIColor *v3;

  v3 = self->_color;
  if (!v3)
  {
    -[UIActivityIndicatorView _defaultColorForStyle:](self, "_defaultColorForStyle:", self->_activityIndicatorViewStyle);
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_defaultColorForStyle:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  UIColor *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  UIColor *v19;
  void *v21;
  uint64_t v22;
  unint64_t v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  int64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
    case 1:
    case 3:
    case 5:
    case 21:
      goto LABEL_9;
    case 2:
    case 4:
    case 8:
    case 9:
    case 10:
    case 13:
    case 16:
    case 22:
      goto LABEL_2;
    case 6:
    case 7:
    case 11:
    case 12:
    case 17:
    case 18:
      goto LABEL_3;
    case 14:
    case 15:
      goto LABEL_12;
    case 19:
    case 20:
      if (dyld_program_sdk_at_least()
        && (-[UIView traitCollection](self, "traitCollection"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v21, "userInterfaceStyle"),
            v21,
            v22 != 2))
      {
LABEL_3:
        +[UIColor blackColor](UIColor, "blackColor");
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_9:
        +[UIColor whiteColor](UIColor, "whiteColor");
        v4 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_10;
    default:
      if ((unint64_t)(a3 - 100) >= 2)
      {
LABEL_12:
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          {
            v27 = 134217984;
            v28 = a3;
            _os_log_fault_impl(&dword_185066000, v26, OS_LOG_TYPE_FAULT, "Unknown UIActivityIndicatorViewStyle: %ld", (uint8_t *)&v27, 0xCu);
          }

        }
        else
        {
          v24 = _defaultColorForStyle____s_category;
          if (!_defaultColorForStyle____s_category)
          {
            v24 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v24, (unint64_t *)&_defaultColorForStyle____s_category);
          }
          v25 = *(NSObject **)(v24 + 8);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v27 = 134217984;
            v28 = a3;
            _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Unknown UIActivityIndicatorViewStyle: %ld", (uint8_t *)&v27, 0xCu);
          }
        }
LABEL_2:
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.45);
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[_UIActivityIndicatorSettingsDomain rootSettings](_UIActivityIndicatorSettingsDomain, "rootSettings");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "customColor");

        if (v6)
        {
          v7 = [UIColor alloc];
          +[_UIActivityIndicatorSettingsDomain rootSettings](_UIActivityIndicatorSettingsDomain, "rootSettings");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "redValue");
          v10 = v9 / 255.0;
          +[_UIActivityIndicatorSettingsDomain rootSettings](_UIActivityIndicatorSettingsDomain, "rootSettings");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "greenValue");
          v13 = v12 / 255.0;
          +[_UIActivityIndicatorSettingsDomain rootSettings](_UIActivityIndicatorSettingsDomain, "rootSettings");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "blueValue");
          v16 = v15 / 255.0;
          +[_UIActivityIndicatorSettingsDomain rootSettings](_UIActivityIndicatorSettingsDomain, "rootSettings");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "alphaValue");
          v19 = -[UIColor initWithRed:green:blue:alpha:](v7, "initWithRed:green:blue:alpha:", v10, v13, v16, v18);

          return v19;
        }
        +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
        v4 = objc_claimAutoreleasedReturnValue();
      }
LABEL_10:
      v19 = (UIColor *)v4;
      return v19;
  }
}

- (void)_updateLayoutInfo
{
  double v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;

  switch(-[UIActivityIndicatorView _sizeForStyle:](self, "_sizeForStyle:", self->_activityIndicatorViewStyle))
  {
    case 1:
    case 7:
      v3 = 14.0;
      goto LABEL_12;
    case 2:
    case 3:
      v3 = 20.0;
      goto LABEL_12;
    case 4:
    case 5:
      v4 = 8;
      v5 = 2;
      v3 = 37.0;
      break;
    case 6:
      -[UIActivityIndicatorView _effectiveCustomWidth](self, "_effectiveCustomWidth");
      goto LABEL_12;
    case 8:
      v4 = 8;
      v5 = 2;
      v6 = 0x4040000000000000;
      goto LABEL_10;
    case 9:
      v4 = 8;
      v5 = 2;
      v6 = 0x4044000000000000;
      goto LABEL_10;
    case 10:
      v4 = 8;
      v5 = 2;
      v6 = 0x4050000000000000;
LABEL_10:
      v3 = *(double *)&v6;
      break;
    case 11:
      v3 = 24.0;
LABEL_12:
      v4 = 8;
      v5 = 2;
      break;
    default:
      v5 = 0;
      v4 = 0;
      v3 = *MEMORY[0x1E0C9D820];
      break;
  }
  self->_spokeCount = v4;
  self->_spokeFrameRatio = v5;
  self->_width = v3;
}

- (int64_t)_sizeForStyle:(int64_t)a3
{
  int64_t v3;
  void *v4;
  NSString *v5;

  v3 = 4;
  switch(a3)
  {
    case 0:
      return 5;
    case 1:
    case 2:
      return 3;
    case 3:
    case 8:
      return 1;
    case 4:
    case 5:
      return 7;
    case 6:
    case 7:
    case 11:
    case 12:
    case 14:
    case 15:
    case 17:
    case 18:
      return 0;
    case 9:
      return 2;
    case 10:
      return v3;
    case 13:
      return 8;
    case 16:
      return 6;
    case 19:
      return 9;
    case 20:
      return 10;
    case 21:
      return 11;
    case 22:
      -[UIView traitCollection](self, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "preferredContentSizeCategory");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (UIContentSizeCategoryIsAccessibilityCategory(v5))
        v3 = 4;
      else
        v3 = 2;

      return v3;
    default:
      if (a3 == 100)
        return 2;
      if (a3 != 101)
        return 0;
      return v3;
  }
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIActivityIndicatorView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView bounds](self, "bounds");
  -[UIActivityIndicatorView _updateSubviewFramesWithBounds:](self, "_updateSubviewFramesWithBounds:");
}

- (void)_tearDownAnimation
{
  _UIActivityIndicatorViewStyleView *styleView;
  NSArray *spokeHighlightImages;
  NSArray *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  styleView = self->_styleView;
  if (styleView)
  {
    -[_UIActivityIndicatorViewStyleView tearDownAnimation](styleView, "tearDownAnimation");
  }
  else
  {
    spokeHighlightImages = self->_spokeHighlightImages;
    if (!spokeHighlightImages)
      spokeHighlightImages = self->_spokeImages;
    v5 = spokeHighlightImages;
    v6 = -[UIActivityIndicatorView isHighlighted](self, "isHighlighted");
    -[UIImageView _currentAnimationKeyframeImage](self->_animatingImageView, "_currentAnimationKeyframeImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        -[NSArray firstObject](v5, "firstObject");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v9;

      v12 = -[NSArray indexOfObject:](v5, "indexOfObject:", v11);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL || (v13 = v12, v12 >= -[NSArray count](self->_spokeImages, "count")))
      {
        -[NSArray firstObject](self->_spokeImages, "firstObject");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[NSArray objectAtIndexedSubscript:](self->_spokeImages, "objectAtIndexedSubscript:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v19 = (id)v14;
    }
    else
    {
      if (v7)
      {
        v10 = v7;
      }
      else
      {
        -[NSArray firstObject](self->_spokeImages, "firstObject");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = v10;

      v15 = -[NSArray indexOfObject:](self->_spokeImages, "indexOfObject:", v19);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL || (v16 = v15, v15 >= -[NSArray count](v5, "count")))
      {
        -[NSArray firstObject](v5, "firstObject");
        v17 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v16);
        v17 = objc_claimAutoreleasedReturnValue();
      }
      v11 = (void *)v17;
    }
    -[UIImageView stopAnimating](self->_animatingImageView, "stopAnimating");
    if (v19)
      -[UIImageView setImage:](self->_animatingImageView, "setImage:", v19);
    if (self->_spokeHighlightImages)
      v18 = v11;
    else
      v18 = 0;
    -[UIImageView setHighlightedImage:](self->_animatingImageView, "setHighlightedImage:", v18);

  }
}

- (BOOL)isHighlighted
{
  return -[UIImageView isHighlighted](self->_animatingImageView, "isHighlighted");
}

- (double)_effectiveCustomWidth
{
  double result;
  void *v5;

  if (self->_activityIndicatorViewStyle != 16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIActivityIndicatorView.m"), 667, CFSTR("_effectiveCustomWidth only valid for UIActivityIndicatorViewStyleCustom"));

  }
  result = self->_customWidth;
  if (result == 0.0)
    objc_msgSend((id)objc_opt_class(), "defaultSizeForStyle:", 16);
  return result;
}

- (id)_highlightColorForStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 21)
    return 0;
  +[UIColor _externalSystemExtraDarkGrayColor](UIColor, "_externalSystemExtraDarkGrayColor", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_artCacheKeyWithStyle:(int64_t)a3 color:(id)a4
{
  return -[_UIActivityIndicatorViewArtworkCacheKey initWithStyle:width:spokeCount:spokeFrameRatio:shadowOffset:color:shadowColor:]([_UIActivityIndicatorViewArtworkCacheKey alloc], "initWithStyle:width:spokeCount:spokeFrameRatio:shadowOffset:color:shadowColor:", a3, self->_spokeCount, self->_spokeFrameRatio, objc_msgSend(objc_retainAutorelease(a4), "CGColor"), -[UIColor CGColor](self->_shadowColor, "CGColor"), self->_width, self->_shadowOffset.width, self->_shadowOffset.height);
}

- (BOOL)_shouldGoToCustomStyle
{
  return -[UIActivityIndicatorView _colorRequiresDynamicTinting](self, "_colorRequiresDynamicTinting")
      || -[UIActivityIndicatorView _hasShadow](self, "_hasShadow")
      || -[UIActivityIndicatorView _useCustomStyleForLegacyStyles](self, "_useCustomStyleForLegacyStyles");
}

- (int64_t)_customStyleForStyle:(int64_t)a3
{
  int64_t v4;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = 10;
  switch(a3)
  {
    case 0:
      return v4;
    case 1:
    case 2:
      return 9;
    case 3:
    case 4:
    case 5:
      return 8;
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
      return a3;
    case 14:
    case 15:
      goto LABEL_8;
    default:
      if (a3 == 101)
        return v4;
      if (a3 == 100)
        return 9;
LABEL_8:
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          v9 = 134217984;
          v10 = a3;
          _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Unknown UIActivityIndicatorViewStyle: %ld", (uint8_t *)&v9, 0xCu);
        }

        return 16;
      }
      else
      {
        v6 = _customStyleForStyle____s_category;
        if (!_customStyleForStyle____s_category)
        {
          v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v6, (unint64_t *)&_customStyleForStyle____s_category);
        }
        v7 = *(NSObject **)(v6 + 8);
        v4 = 16;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v9 = 134217984;
          v10 = a3;
          v4 = 16;
          _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Unknown UIActivityIndicatorViewStyle: %ld", (uint8_t *)&v9, 0xCu);
        }
      }
      return v4;
  }
}

- (BOOL)_colorRequiresDynamicTinting
{
  void *v4;
  char v5;

  if (-[UIActivityIndicatorView _hasClientSetColor](self, "_hasClientSetColor"))
    return 1;
  -[UIActivityIndicatorView color](self, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isDynamic");

  return v5;
}

- (BOOL)_hasClientSetColor
{
  UIColor *color;
  void *v3;

  color = self->_color;
  if (color)
  {
    -[UIActivityIndicatorView _defaultColorForStyle:](self, "_defaultColorForStyle:", self->_activityIndicatorViewStyle);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(color) = !-[UIColor isEqual:](color, "isEqual:", v3);

  }
  return (char)color;
}

- (id)_imagesForStyle:(int64_t)a3 color:(id)a4 highlight:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  if (-[UIActivityIndicatorView _isStatusBarStyle](self, "_isStatusBarStyle")
    && -[UIActivityIndicatorView _colorRequiresDynamicTinting](self, "_colorRequiresDynamicTinting"))
  {
    objc_msgSend((id)objc_opt_class(), "_loadResourcesForArtworkBasedStyle:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView _generateModernImagesForImages:color:](self, "_generateModernImagesForImages:color:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (-[UIActivityIndicatorView _isArtworkBasedStyle](self, "_isArtworkBasedStyle"))
      objc_msgSend((id)objc_opt_class(), "_loadResourcesForArtworkBasedStyle:", a3);
    else
      -[UIActivityIndicatorView _generateImagesForColor:highlight:](self, "_generateImagesForColor:highlight:", v8, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)_isArtworkBasedStyle
{
  unint64_t actualActivityIndicatorViewStyle;
  _BOOL4 v4;

  if (-[UIActivityIndicatorView _isStatusBarStyle](self, "_isStatusBarStyle")
    || (actualActivityIndicatorViewStyle = self->_actualActivityIndicatorViewStyle,
        actualActivityIndicatorViewStyle > 0x16))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    return (0x6D8FFu >> actualActivityIndicatorViewStyle) & 1;
  }
  return v4;
}

- (BOOL)_isStatusBarStyle
{
  return (self->_activityIndicatorViewStyle < 0x13uLL) & (0x618C0u >> self->_activityIndicatorViewStyle);
}

- (id)_generateImagesForColor:(id)a3 highlight:(BOOL)a4
{
  id v5;
  int64_t v6;
  void *v7;
  uint64_t i;
  void *v9;

  v5 = a3;
  v6 = self->_spokeCount * self->_spokeFrameRatio;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= 1)
  {
    for (i = 0; i != v6; ++i)
    {
      -[UIActivityIndicatorView _imageForStep:withColor:](self, "_imageForStep:withColor:", i, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

    }
  }

  return v7;
}

- (UIActivityIndicatorView)initWithFrame:(CGRect)frame
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIActivityIndicatorView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIActivityIndicatorView _commonInit](v3, "_commonInit");
    -[UIActivityIndicatorView _refreshStyle](v4, "_refreshStyle");
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIApplicationDidEnterBackgroundNotification");
  v6[1] = CFSTR("UIApplicationWillEnterForegroundNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIActivityIndicatorView;
  -[UIView dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_lastHighlightArtCacheKey, 0);
  objc_storeStrong((id *)&self->_lastArtCacheKey, 0);
  objc_storeStrong((id *)&self->_spokeHighlightImages, 0);
  objc_storeStrong((id *)&self->_spokeImages, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_animatingImageView, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_styleView, 0);
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)CFSTR("UIActivityIndicatorView");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UIImageView isAnimating](self->_animatingImageView, "isAnimating"))
  {
    -[UIActivityIndicatorView _tearDownAnimation](self, "_tearDownAnimation");
    -[UIImageView setHighlighted:](self->_animatingImageView, "setHighlighted:", v3);
    -[UIActivityIndicatorView _setUpAnimation](self, "_setUpAnimation");
  }
  else
  {
    -[UIImageView setHighlighted:](self->_animatingImageView, "setHighlighted:", v3);
  }
}

- (void)_removeAllAnimations:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  self->_wasAnimatingWhenAnimationsRemoved = -[UIActivityIndicatorView isAnimating](self, "isAnimating");
  -[UIActivityIndicatorView stopAnimating](self, "stopAnimating");
  v5.receiver = self;
  v5.super_class = (Class)UIActivityIndicatorView;
  -[UIView _removeAllAnimations:](&v5, sel__removeAllAnimations_, v3);
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6;
  id v7;
  _BOOL4 animating;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  animating = self->_animating;
  if (self->_animating)
    -[UIActivityIndicatorView _tearDownAnimation](self, "_tearDownAnimation");
  v9.receiver = self;
  v9.super_class = (Class)UIActivityIndicatorView;
  -[UIView _didMoveFromWindow:toWindow:](&v9, sel__didMoveFromWindow_toWindow_, v6, v7);
  if (v7 && animating)
  {
    self->_restartAnimationOnNextLayout = 1;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_applicationWillEnterForeground:(id)a3
{
  if (self->_animating)
    -[UIActivityIndicatorView _setUpAnimation](self, "_setUpAnimation", a3);
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

- (UIActivityIndicatorView)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIActivityIndicatorView *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  UIColor *color;
  objc_super v13;

  v4 = coder;
  v13.receiver = self;
  v13.super_class = (Class)UIActivityIndicatorView;
  v5 = -[UIView initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = CFSTR("UIActivityIndicatorViewStyle-Modern");
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIActivityIndicatorViewStyle-Modern"))
      || (v6 = CFSTR("UIActivityIndicatorViewStyle"),
          -[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIActivityIndicatorViewStyle"))))
    {
      v7 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", v6);
    }
    else
    {
      v7 = 1;
    }
    v5->_activityIndicatorViewStyle = v7;
    v5->_actualActivityIndicatorViewStyle = -[UIActivityIndicatorView _actualStyleByResolvingAutoUpdatingStyle:](v5, "_actualStyleByResolvingAutoUpdatingStyle:");
    v5->_hidesWhenStopped = 1;
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIHidesWhenStopped")))
      v5->_hidesWhenStopped = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIHidesWhenStopped"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__applicationDidEnterBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__applicationWillEnterForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    v5->_animating = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIAnimating"));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIColor")))
      v9 = CFSTR("UIColor");
    else
      v9 = CFSTR("UITintColor");
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (UIColor *)v10;

    v5->_disableUpdateColorOnTraitCollectionChange = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIDisableUpdateColorOnTraitCollectionChange"));
    -[UIActivityIndicatorView _refreshStyle](v5, "_refreshStyle");
    -[UIView setNeedsLayout](v5, "setNeedsLayout");

  }
  return v5;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIActivityIndicatorView;
  v4 = a3;
  -[UIView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_, v4);
  objc_msgSend(v4, "removeObject:", self->_animatingImageView, v5.receiver, v5.super_class);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t activityIndicatorViewStyle;
  UIColor *v6;
  UIActivityIndicatorView *v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIActivityIndicatorView;
  -[UIView encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  activityIndicatorViewStyle = self->_activityIndicatorViewStyle;
  objc_msgSend(v4, "encodeInteger:forKey:", activityIndicatorViewStyle, CFSTR("UIActivityIndicatorViewStyle-Modern"));
  v6 = self->_color;
  if (activityIndicatorViewStyle == 101)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", 0, CFSTR("UIActivityIndicatorViewStyle"));
    if (v6)
      goto LABEL_9;
    v7 = self;
    v8 = 101;
    goto LABEL_7;
  }
  if (activityIndicatorViewStyle == 100)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("UIActivityIndicatorViewStyle"));
    if (v6)
      goto LABEL_9;
    v7 = self;
    v8 = 100;
LABEL_7:
    -[UIActivityIndicatorView _defaultColorForStyle:](v7, "_defaultColorForStyle:", v8);
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v4, "encodeInteger:forKey:", activityIndicatorViewStyle, CFSTR("UIActivityIndicatorViewStyle"));
LABEL_9:
  if (!self->_hidesWhenStopped)
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("UIHidesWhenStopped"));
  if (self->_animating)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIAnimating"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_color, CFSTR("UIColor"));
  if (v6)
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("UITintColor"));
  if (self->_disableUpdateColorOnTraitCollectionChange)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIDisableUpdateColorOnTraitCollectionChange"));

}

- (UIActivityIndicatorViewStyle)activityIndicatorViewStyle
{
  return -[UIActivityIndicatorView _externalStyleForStyle:](self, "_externalStyleForStyle:", self->_activityIndicatorViewStyle);
}

- (void)setAnimationDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    if (self->_animating)
    {
      -[UIActivityIndicatorView stopAnimating](self, "stopAnimating");
      -[UIActivityIndicatorView startAnimating](self, "startAnimating");
    }
  }
}

- (BOOL)_wantsAnimationRestoration
{
  return 1;
}

- (void)_restoreRemovedAnimationsIncludingSubviews
{
  objc_super v3;

  if (self->_wasAnimatingWhenAnimationsRemoved)
  {
    -[UIActivityIndicatorView startAnimating](self, "startAnimating");
    self->_wasAnimatingWhenAnimationsRemoved = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)UIActivityIndicatorView;
  -[UIView _restoreRemovedAnimationsIncludingSubviews](&v3, sel__restoreRemovedAnimationsIncludingSubviews);
}

- (void)_applicationDidEnterBackground:(id)a3
{
  if (self->_animating)
    -[UIActivityIndicatorView _tearDownAnimation](self, "_tearDownAnimation", a3);
}

- (void)setWidth:(double)a3
{
  if (self->_width != a3)
  {
    self->_width = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShadowColor:(id)a3
{
  UIColor *v4;
  UIColor *v5;
  UIColor *shadowColor;
  UIColor *v7;

  v4 = (UIColor *)a3;
  if (self->_shadowColor != v4)
  {
    v7 = v4;
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      +[UIColor blackColor](UIColor, "blackColor");
      v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    shadowColor = self->_shadowColor;
    self->_shadowColor = v5;

    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v4 = v7;
  }

}

- (void)setShadowOffset:(CGSize)a3
{
  if (self->_shadowOffset.width != a3.width || self->_shadowOffset.height != a3.height)
  {
    self->_shadowOffset = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_generateModernImagesForImages:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "_flatImageWithColor:", v6, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)_imageSetNameForArtworkBasedStyle:(int64_t)a3 outImageCount:(int64_t *)a4
{
  int64_t v4;
  id result;

  v4 = 0;
  result = 0;
  switch(a3)
  {
    case 0:
      goto LABEL_5;
    case 1:
      goto LABEL_6;
    case 2:
      result = CFSTR("UIActivityIndicatorViewStyleGray");
      goto LABEL_21;
    case 3:
      result = CFSTR("UIActivityIndicatorViewStyleWhiteSmall");
      goto LABEL_10;
    case 4:
      result = CFSTR("UIActivityIndicatorViewStyleGraySmall");
      goto LABEL_10;
    case 5:
      result = CFSTR("UIActivityIndicatorViewStyleForBlueBackgroundSmall");
LABEL_10:
      v4 = 16;
      goto LABEL_22;
    case 6:
      result = CFSTR("UIActivityIndicatorViewStyleStatusBar");
      goto LABEL_16;
    case 7:
      result = CFSTR("UIActivityIndicatorViewStyleStatusBarSync");
      goto LABEL_18;
    case 8:
    case 9:
    case 10:
    case 13:
    case 14:
    case 15:
    case 16:
      goto LABEL_22;
    case 11:
      result = CFSTR("UIActivityIndicatorViewStyleStatusBarLockScreen");
      goto LABEL_16;
    case 12:
      result = CFSTR("UIActivityIndicatorViewStyleStatusBarLockScreenSync");
      goto LABEL_18;
    case 17:
      result = CFSTR("UIActivityIndicatorViewStyleStatusBarExternal");
LABEL_16:
      v4 = 8;
      goto LABEL_22;
    case 18:
      result = CFSTR("UIActivityIndicatorViewStyleStatusBarSyncExternal");
LABEL_18:
      v4 = 24;
      goto LABEL_22;
    case 19:
      result = CFSTR("UIActivityIndicatorViewStyleWhiteATV");
      goto LABEL_21;
    case 20:
      result = CFSTR("UIActivityIndicatorViewStyleWhiteLargeATV");
      goto LABEL_21;
    default:
      if (a3 == 100)
      {
LABEL_6:
        result = CFSTR("UIActivityIndicatorViewStyleWhite");
      }
      else
      {
        result = 0;
        if (a3 != 101)
          goto LABEL_22;
LABEL_5:
        result = CFSTR("UIActivityIndicatorViewStyleWhiteLarge");
      }
LABEL_21:
      v4 = 12;
LABEL_22:
      if (a4)
        *a4 = v4;
      return result;
  }
}

+ (id)_loadResourcesForArtworkBasedStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v9;

  v9 = 0;
  objc_msgSend(a1, "_imageSetNameForArtworkBasedStyle:outImageCount:", a3, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 >= 1)
  {
    for (i = 0; i < v9; ++i)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%ld.png"), v3, i);
      _UIImageWithName(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v4, "addObject:", v7);

    }
  }

  return v4;
}

- (CGRect)_messageLabelFrameForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[UIActivityIndicatorView _isShowingMessage](self, "_isShowingMessage"))
  {
    -[UIActivityIndicatorView _animatingImageViewFrameForBounds:](self, "_animatingImageViewFrameForBounds:", x, y, width, height);
    CGRectGetMaxY(v15);
    -[_UIActivityIndicatorMessageLabel verticalSpacingToSpinner](self->_messageLabel, "verticalSpacingToSpinner");
    UIRoundToViewScale(self);
    v9 = v8;
    -[UILabel intrinsicContentSize](self->_messageLabel, "intrinsicContentSize");
    v11 = v10;
    v12 = 0.0;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v13 = v9;
  v14 = width;
  result.size.height = v11;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)_useCustomStyleForLegacyStyles
{
  return (unint64_t)-[UIActivityIndicatorView activityIndicatorViewStyle](self, "activityIndicatorViewStyle") < (UIActivityIndicatorViewStyleGray|UIActivityIndicatorViewStyleWhite);
}

- (BOOL)_hasShadow
{
  if (!self->_shadowColor)
    return 0;
  if (self->_shadowOffset.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    return self->_shadowOffset.width != *MEMORY[0x1E0C9D820];
  return 1;
}

- (BOOL)_shouldGoBackToBaseStyle
{
  _BOOL4 v3;

  v3 = -[UIActivityIndicatorView _isArtworkBasedStyle](self, "_isArtworkBasedStyle");
  if (v3)
    LOBYTE(v3) = !-[UIActivityIndicatorView _shouldGoToCustomStyle](self, "_shouldGoToCustomStyle");
  return v3;
}

- (int64_t)_externalStyleForStyle:(int64_t)a3
{
  int64_t result;

  if (a3 == 20)
  {
    if (dyld_program_sdk_at_least())
      return 101;
    else
      return 0;
  }
  else
  {
    result = a3;
    if (a3 == 19)
    {
      if (dyld_program_sdk_at_least())
        return 100;
      else
        return 1;
    }
  }
  return result;
}

- (void)setAnimating:(BOOL)a3
{
  if (a3)
    -[UIActivityIndicatorView startAnimating](self, "startAnimating");
  else
    -[UIActivityIndicatorView stopAnimating](self, "stopAnimating");
}

- (double)animationDuration
{
  return self->_duration;
}

- (double)_customWidth
{
  return self->_customWidth;
}

- (UIImageView)_animatingImageView
{
  return self->_animatingImageView;
}

- (_UIActivityIndicatorMessageLabel)_messageLabel
{
  return self->_messageLabel;
}

- (NSString)_message
{
  return self->_message;
}

- (int64_t)_actualActivityIndicatorViewStyle
{
  return self->_actualActivityIndicatorViewStyle;
}

- (BOOL)_restartAnimationOnNextLayout
{
  return self->_restartAnimationOnNextLayout;
}

- (NSArray)_spokeImages
{
  return self->_spokeImages;
}

- (NSArray)_spokeHighlightImages
{
  return self->_spokeHighlightImages;
}

- (BOOL)_disableUpdateColorOnTraitCollectionChange
{
  return self->_disableUpdateColorOnTraitCollectionChange;
}

- (_UIActivityIndicatorViewArtworkCacheKey)_lastArtCacheKey
{
  return self->_lastArtCacheKey;
}

- (_UIActivityIndicatorViewArtworkCacheKey)_lastHighlightArtCacheKey
{
  return self->_lastHighlightArtCacheKey;
}

- (CGSize)shadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_shadowOffset.width;
  height = self->_shadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (double)width
{
  return self->_width;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (BOOL)spinning
{
  return self->_spinning;
}

- (void)setSpinning:(BOOL)a3
{
  self->_spinning = a3;
}

@end
