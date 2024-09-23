@implementation TUIStarRatingControl

- (TUIStarRatingControl)initWithRating:(double)a3 backgroundImageName:(id)a4 foregroundImageName:(id)a5 direction:(unint64_t)a6 color:(id)a7 startColor:(id)a8 backgroundColor:(id)a9 starWidth:(double)a10 starPadding:(double)a11
{
  id v21;
  id v22;
  id v23;
  TUIStarRatingControl *v24;
  TUIStarRatingControl *v25;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIImageView *v33;
  UIImageView *placeholderImageView;
  UIImageView *v35;
  UIImageView *backgroundImageView;
  id v37;
  UIView *v38;
  UIView *foregroundContainerView;
  UIImageView *v40;
  UIImageView *foregroundImageView;
  void *v42;
  id v43;
  id v45;
  id v46;
  objc_super v47;

  v46 = a4;
  v45 = a5;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v47.receiver = self;
  v47.super_class = (Class)TUIStarRatingControl;
  v24 = -[TUIStarRatingControl init](&v47, "init");
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_backgroundImageName, a4);
    objc_storeStrong((id *)&v25->_foregroundImageName, a5);
    v25->_direction = a6;
    objc_storeStrong((id *)&v25->_foregroundColor, a7);
    objc_storeStrong((id *)&v25->_backgroundColor, a9);
    objc_storeStrong((id *)&v25->_startColor, a8);
    v26 = a3;
    v25->_value = v26;
    v25->_starWidth = a10;
    v25->_starPadding = a11;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[TUIStarRatingImageCache sharedInstance](TUIStarRatingImageCache, "sharedInstance"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStarRatingControl traitCollection](v25, "traitCollection"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ratingStarsImageWithName:starSize:starCount:starPadding:traitCollection:", v46, 5, v28, a10, a11));

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[TUIStarRatingImageCache sharedInstance](TUIStarRatingImageCache, "sharedInstance"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStarRatingControl traitCollection](v25, "traitCollection"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "ratingStarsImageWithName:starSize:starCount:starPadding:traitCollection:", v45, 5, v31, a10, a11));

    v33 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v29);
    placeholderImageView = v25->_placeholderImageView;
    v25->_placeholderImageView = v33;

    -[UIImageView setTintColor:](v25->_placeholderImageView, "setTintColor:", v22);
    -[UIImageView setUserInteractionEnabled:](v25->_placeholderImageView, "setUserInteractionEnabled:", 0);
    -[UIImageView sizeToFit](v25->_placeholderImageView, "sizeToFit");
    -[TUIStarRatingControl addSubview:](v25, "addSubview:", v25->_placeholderImageView);
    v35 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v29);
    backgroundImageView = v25->_backgroundImageView;
    v25->_backgroundImageView = v35;

    -[UIImageView setTintColor:](v25->_backgroundImageView, "setTintColor:", v23);
    -[UIImageView setUserInteractionEnabled:](v25->_backgroundImageView, "setUserInteractionEnabled:", 0);
    -[UIImageView sizeToFit](v25->_backgroundImageView, "sizeToFit");
    -[TUIStarRatingControl addSubview:](v25, "addSubview:", v25->_backgroundImageView);
    v37 = objc_alloc((Class)UIView);
    -[TUIStarRatingControl bounds](v25, "bounds");
    v38 = (UIView *)objc_msgSend(v37, "initWithFrame:");
    foregroundContainerView = v25->_foregroundContainerView;
    v25->_foregroundContainerView = v38;

    -[UIView setClipsToBounds:](v25->_foregroundContainerView, "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](v25->_foregroundContainerView, "setUserInteractionEnabled:", 0);
    -[UIView setContentMode:](v25->_foregroundContainerView, "setContentMode:", 7);
    -[UIView sizeToFit](v25->_foregroundContainerView, "sizeToFit");
    v40 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v32);
    foregroundImageView = v25->_foregroundImageView;
    v25->_foregroundImageView = v40;

    -[UIImageView setTintColor:](v25->_foregroundImageView, "setTintColor:", v21);
    -[UIImageView setUserInteractionEnabled:](v25->_foregroundImageView, "setUserInteractionEnabled:", 0);
    -[UIImageView sizeToFit](v25->_foregroundImageView, "sizeToFit");
    -[UIView addSubview:](v25->_foregroundContainerView, "addSubview:", v25->_foregroundImageView);
    -[TUIStarRatingControl addSubview:](v25, "addSubview:", v25->_foregroundContainerView);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection tui_allAPITraits](UITraitCollection, "tui_allAPITraits"));
    v43 = -[TUIStarRatingControl registerForTraitChanges:withAction:](v25, "registerForTraitChanges:withAction:", v42, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v25;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  UIImageView *foregroundImageView;
  UIView *foregroundContainerView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TUIStarRatingControl;
  -[TUIStarRatingControl layoutSubviews](&v14, "layoutSubviews");
  -[TUIStarRatingControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  *(float *)&v3 = self->_value;
  v11 = *(float *)&v3 != 0.0;
  -[UIImageView setHidden:](self->_backgroundImageView, "setHidden:", *(float *)&v3 == 0.0);
  -[UIImageView setHidden:](self->_placeholderImageView, "setHidden:", v11);
  -[UIImageView setFrame:](self->_placeholderImageView, "setFrame:", v4, v6, v8, v10);
  -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:", v4, v6, v8, v10);
  foregroundImageView = self->_foregroundImageView;
  -[TUIStarRatingControl _foregroundImageClipBounds](self, "_foregroundImageClipBounds");
  -[UIImageView setFrame:](foregroundImageView, "setFrame:");
  foregroundContainerView = self->_foregroundContainerView;
  -[TUIStarRatingControl _foregroundImageContainerClipBounds](self, "_foregroundImageContainerClipBounds");
  -[UIView setFrame:](foregroundContainerView, "setFrame:");
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[TUIStarRatingControl frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[UIImageView bounds](self->_backgroundImageView, "bounds");
  -[TUIStarRatingControl setFrame:](self, "setFrame:", v4, v6);
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  -[TUIStarRatingControl _updateForegroundImage](self, "_updateForegroundImage", a3, a4);
  -[TUIStarRatingControl _updateBackgroundImage](self, "_updateBackgroundImage");
}

- (void)setHitPadding:(CGSize)a3
{
  self->_hitPadding = a3;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
  -[TUIStarRatingControl setNeedsLayout](self, "setNeedsLayout");
}

- (void)setStarWidth:(double)a3
{
  if (self->_starWidth != a3)
  {
    self->_starWidth = a3;
    -[TUIStarRatingControl _updateForegroundImage](self, "_updateForegroundImage");
    -[TUIStarRatingControl _updateBackgroundImage](self, "_updateBackgroundImage");
  }
}

- (void)setStarPadding:(double)a3
{
  if (self->_starPadding != a3)
  {
    self->_starPadding = a3;
    -[TUIStarRatingControl _updateForegroundImage](self, "_updateForegroundImage");
    -[TUIStarRatingControl _updateBackgroundImage](self, "_updateBackgroundImage");
  }
}

- (void)setForegroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  unsigned __int8 v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  v6 = v5;
  if (self->_foregroundColor != v5)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_foregroundColor, a3);
      -[UIImageView setTintColor:](self->_foregroundImageView, "setTintColor:", v8);
      v6 = v8;
    }
  }

}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  unsigned __int8 v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  v6 = v5;
  if (self->_backgroundColor != v5)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backgroundColor, a3);
      -[UIImageView setTintColor:](self->_backgroundImageView, "setTintColor:", v8);
      v6 = v8;
    }
  }

}

- (void)setStartColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  unsigned __int8 v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  v6 = v5;
  if (self->_startColor != v5)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_startColor, a3);
      -[UIImageView setTintColor:](self->_placeholderImageView, "setTintColor:", v8);
      v6 = v8;
    }
  }

}

- (void)_updateImagesIfNeededWithForegroundImageName:(id)a3 backgroundImageName:(id)a4 starWidth:(double)a5 starPadding:(double)a6
{
  id v11;
  id v12;

  v12 = a3;
  v11 = a4;
  if (self->_starWidth != a5 || self->_starPadding != a6)
  {
    self->_starWidth = a5;
    self->_starPadding = a6;
    objc_storeStrong((id *)&self->_foregroundImageName, a3);
    -[TUIStarRatingControl _updateForegroundImage](self, "_updateForegroundImage");
LABEL_4:
    objc_storeStrong((id *)&self->_backgroundImageName, a4);
    -[TUIStarRatingControl _updateBackgroundImage](self, "_updateBackgroundImage");
    goto LABEL_5;
  }
  if ((objc_msgSend(v12, "isEqualToString:", self->_foregroundImageName) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_foregroundImageName, a3);
    -[TUIStarRatingControl _updateForegroundImage](self, "_updateForegroundImage");
  }
  if ((objc_msgSend(v11, "isEqualToString:", self->_backgroundImageName) & 1) == 0)
    goto LABEL_4;
LABEL_5:

}

- (void)_updateForegroundImage
{
  void *v3;
  NSString *foregroundImageName;
  double starWidth;
  double starPadding;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUIStarRatingImageCache sharedInstance](TUIStarRatingImageCache, "sharedInstance"));
  foregroundImageName = self->_foregroundImageName;
  starWidth = self->_starWidth;
  starPadding = self->_starPadding;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStarRatingControl traitCollection](self, "traitCollection"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ratingStarsImageWithName:starSize:starCount:starPadding:traitCollection:", foregroundImageName, 5, v7, starWidth, starPadding));

  -[UIImageView setImage:](self->_foregroundImageView, "setImage:", v8);
}

- (void)_updateBackgroundImage
{
  void *v3;
  NSString *backgroundImageName;
  double starWidth;
  double starPadding;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUIStarRatingImageCache sharedInstance](TUIStarRatingImageCache, "sharedInstance"));
  backgroundImageName = self->_backgroundImageName;
  starWidth = self->_starWidth;
  starPadding = self->_starPadding;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStarRatingControl traitCollection](self, "traitCollection"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ratingStarsImageWithName:starSize:starCount:starPadding:traitCollection:", backgroundImageName, 5, v7, starWidth, starPadding));

  -[UIImageView setImage:](self->_placeholderImageView, "setImage:", v8);
  -[UIImageView setImage:](self->_backgroundImageView, "setImage:", v8);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  v3 = a3;
  v6 = 1;
  if (objc_msgSend(v3, "numberOfTouches") == (char *)&dword_0 + 1)
  {
    v4 = objc_opt_class(UIPanGestureRecognizer);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
      || (v5 = objc_opt_class(UITapGestureRecognizer), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  CGPoint *p_trackingStartPoint;
  CGFloat v5;
  CGFloat v6;

  p_trackingStartPoint = &self->_trackingStartPoint;
  objc_msgSend(a3, "locationInView:", self, a4);
  p_trackingStartPoint->x = v5;
  p_trackingStartPoint->y = v6;
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  uint64_t v9;

  objc_msgSend(a3, "locationInView:", self, a4);
  v6 = v5 - self->_trackingStartPoint.y;
  self->_trackingLastPoint.x = v7;
  self->_trackingLastPoint.y = v5;
  if (v6 >= 0.0)
    v8 = v6;
  else
    v8 = -v6;
  if (v8 > 40.0)
  {
    v9 = 64;
  }
  else
  {
    -[TUIStarRatingControl _updateValueForPoint:](self, "_updateValueForPoint:");
    v9 = 4096;
  }
  -[TUIStarRatingControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", v9, 40.0);
  return v8 <= 40.0;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  CGPoint *p_trackingLastPoint;
  CGFloat v6;
  CGFloat v7;

  p_trackingLastPoint = &self->_trackingLastPoint;
  objc_msgSend(a3, "locationInView:", self, a4);
  p_trackingLastPoint->x = v6;
  p_trackingLastPoint->y = v7;
  -[TUIStarRatingControl _updateValueForPoint:](self, "_updateValueForPoint:");
  -[TUIStarRatingControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (CGRect)hitRect
{
  CGRect v3;

  -[TUIStarRatingControl bounds](self, "bounds");
  return CGRectInset(v3, -self->_hitPadding.width, -self->_hitPadding.height);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[TUIStarRatingControl hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (BOOL)_isRTL
{
  return self->_direction == 2;
}

- (CGRect)_foregroundImageClipBounds
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
  CGRect result;

  -[TUIStarRatingControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[TUIStarRatingControl _isRTL](self, "_isRTL"))
  {
    -[TUIStarRatingControl _foregroundImageContainerClipBounds](self, "_foregroundImageContainerClipBounds");
    v4 = -v11;
  }
  v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_foregroundImageContainerClipBounds
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double MaxX;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  -[TUIStarRatingControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = self->_value / (1.0 / (double)5uLL);
  -[TUIStarRatingControl starWidth](self, "starWidth");
  v13 = v12;
  -[TUIStarRatingControl starPadding](self, "starPadding");
  v15 = v14 * (double)4uLL + v13 * (double)5uLL;
  -[TUIStarRatingControl starWidth](self, "starWidth");
  v17 = v8 * (v16 / v15);
  -[TUIStarRatingControl starPadding](self, "starPadding");
  v19 = v8 * (v18 / v15);
  v20 = v11;
  v21 = ceilf(v20 + -1.0);
  if (v21 < 0.0)
    v21 = 0.0;
  v22 = v19 * (double)(unint64_t)v21 + v17 * v11;
  if (-[TUIStarRatingControl _isRTL](self, "_isRTL"))
  {
    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    MaxX = CGRectGetMaxX(v28);
    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.width = v22;
    v29.size.height = v10;
    v4 = MaxX - CGRectGetWidth(v29);
  }
  v24 = v4;
  v25 = v6;
  v26 = v22;
  v27 = v10;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)_updateValueForPoint:(CGPoint)a3
{
  unint64_t v3;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;

  x = a3.x;
  -[TUIStarRatingControl starWidth](self, "starWidth", a3.x, a3.y);
  v7 = v6;
  -[TUIStarRatingControl bounds](self, "bounds");
  v9 = ceil((v8 - v7 * (double)5uLL) / (double)4uLL);
  v10 = (v7 + v9) * (double)5uLL;
  v11 = -(v9 - v10);
  if (x <= v10)
    v11 = x;
  if (v11 < 0.0)
    v11 = 0.0;
  LODWORD(v3) = vcvtpd_u64_f64(v11 / (v7 + v9));
  if (-[TUIStarRatingControl _isRTL](self, "_isRTL"))
    v13 = 6 - v3;
  else
    v13 = v3;
  if (v13 <= 1)
    v13 = 1;
  *(float *)&v12 = (float)v13 / (float)5uLL;
  -[TUIStarRatingControl setValue:](self, "setValue:", v12);
}

- (double)starWidth
{
  return self->_starWidth;
}

- (double)starPadding
{
  return self->_starPadding;
}

- (float)value
{
  return self->_value;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)startColor
{
  return self->_startColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundImageName, 0);
  objc_storeStrong((id *)&self->_backgroundImageName, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_foregroundImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_foregroundContainerView, 0);
}

@end
