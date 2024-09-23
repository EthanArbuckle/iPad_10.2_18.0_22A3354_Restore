@implementation UIPopoverBackgroundView

- (UIPopoverBackgroundView)initWithFrame:(CGRect)a3
{
  UIPopoverBackgroundView *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPopoverBackgroundView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "cornerRadius");
    v3->_customCornerRadius = v4;
  }
  return v3;
}

- (CGFloat)arrowOffset
{
  _UIPopoverBackgroundViewThrowForSelector(a2);
  return NAN;
}

- (void)setArrowOffset:(CGFloat)arrowOffset
{
  _UIPopoverBackgroundViewThrowForSelector(a2);
}

- (UIPopoverArrowDirection)arrowDirection
{
  _UIPopoverBackgroundViewThrowForSelector(a2);
  return -1;
}

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection
{
  _UIPopoverBackgroundViewThrowForSelector(a2);
}

+ (double)arrowHeight
{
  _UIPopoverBackgroundViewThrowForSelector(a2);
  return NAN;
}

+ (double)arrowBase
{
  _UIPopoverBackgroundViewThrowForSelector(a2);
  return NAN;
}

+ (UIEdgeInsets)contentViewInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  _UIPopoverBackgroundViewThrowForSelector(a2);
  v2 = NAN;
  v3 = NAN;
  v4 = NAN;
  v5 = NAN;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)_contentViewInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  objc_msgSend((id)objc_opt_class(), "contentViewInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)cornerRadius
{
  return 14.0;
}

- (void)_setCustomCornerRadius:(double)a3
{
  self->_customCornerRadius = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

+ (BOOL)wantsDefaultContentAppearance
{
  return 1;
}

- (void)_setChromeHidden:(BOOL)a3
{
  if (self->__chromeHidden != a3)
  {
    self->__chromeHidden = a3;
    -[UIPopoverBackgroundView _updateChrome](self, "_updateChrome");
  }
}

- (void)_setBackgroundBlurEffectStyle:(int64_t)a3
{
  if (self->__backgroundBlurEffectStyle != a3)
  {
    self->__backgroundBlurEffectStyle = a3;
    -[UIPopoverBackgroundView _updateChrome](self, "_updateChrome");
  }
}

- (id)_shadowPathForRect:(CGRect)a3 arrowDirection:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
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

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = 6.0;
  v10 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  switch(a4)
  {
    case 0uLL:
    case 2uLL:
      objc_msgSend((id)objc_opt_class(), "arrowHeight");
      v10 = v13;
      goto LABEL_4;
    case 1uLL:
      objc_msgSend((id)objc_opt_class(), "arrowHeight");
      v9 = v14 + 6.0;
      goto LABEL_4;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_8;
    case 4uLL:
      objc_msgSend((id)objc_opt_class(), "arrowHeight");
      v12 = v15;
      v11 = 0.0;
      goto LABEL_8;
    case 8uLL:
      objc_msgSend((id)objc_opt_class(), "arrowHeight");
      goto LABEL_7;
    default:
LABEL_4:
      v11 = 0.0;
LABEL_7:
      v12 = 0.0;
LABEL_8:
      v16 = x + v12;
      v17 = width - (v11 + v12);
      -[UIPopoverBackgroundView _shadowInsets](self, "_shadowInsets");
      return +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v16 + v21, y + v9 + v18, v17 - (v21 + v19), height - (v10 + v9) - (v18 + v20), 8.0);
  }
}

- (UIEdgeInsets)_shadowInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 2.0;
  v3 = 2.0;
  v4 = 2.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_shadowOpacity
{
  return 1.0;
}

- (double)_shadowRadius
{
  return 23.0;
}

- (CGSize)_shadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 6.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_shadowPath
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[UIView bounds](self, "bounds");
  return -[UIPopoverBackgroundView _shadowPathForRect:arrowDirection:](self, "_shadowPathForRect:arrowDirection:", -[UIPopoverBackgroundView arrowDirection](self, "arrowDirection"), v3, v4, v5, v6);
}

- (void)_updateShadow
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  -[UIPopoverBackgroundView _shadowPath](self, "_shadowPath");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGPath");

  if (v4)
  {
    -[UIView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShadowPath:", v4);

    -[UIView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPopoverBackgroundView _shadowOpacity](self, "_shadowOpacity");
    *(float *)&v7 = v7;
    objc_msgSend(v6, "setShadowOpacity:", v7);

    -[UIView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPopoverBackgroundView _shadowRadius](self, "_shadowRadius");
    objc_msgSend(v8, "setShadowRadius:");

    -[UIView layer](self, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UIPopoverBackgroundView _shadowOffset](self, "_shadowOffset");
    objc_msgSend(v9, "setShadowOffset:");

  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("shadowPath")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIPopoverBackgroundView;
    v5 = -[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  objc_super v22;

  v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)UIPopoverBackgroundView;
  v7 = a3;
  -[UIView actionForLayer:forKey:](&v22, sel_actionForLayer_forKey_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "hasBeenCommitted", v22.receiver, v22.super_class);

  if (v9 && objc_msgSend(v6, "isEqual:", CFSTR("shadowPath")) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentationLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    -[UIPopoverBackgroundView _shadowPathForRect:arrowDirection:](self, "_shadowPathForRect:arrowDirection:", -[UIPopoverBackgroundView arrowDirection](self, "arrowDirection"), v13, v15, v17, v19);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setFromValue:", objc_msgSend(v20, "CGPath"));

  }
  return v8;
}

- (CGRect)_contentViewFrame
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
  CGRect result;

  -[UIPopoverBackgroundView _backgroundContentViewFrame](self, "_backgroundContentViewFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIPopoverBackgroundView _contentViewInsets](self, "_contentViewInsets");
  v12 = v6 + v11;
  v15 = v8 - (v13 + v14);
  v17 = v10 - (v11 + v16);
  v18 = v4 + v13;
  v19 = v12;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_backgroundContentViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIPopoverArrowDirection v11;
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
  double v23;
  double v24;
  CGRect result;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UIPopoverBackgroundView arrowDirection](self, "arrowDirection");
  v12 = 0.0;
  if (v10 > 44.0)
    v13 = 0.0;
  else
    v13 = 6.0;
  v14 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  switch(v11)
  {
    case 0uLL:
    case 2uLL:
      objc_msgSend((id)objc_opt_class(), "arrowHeight");
      v14 = 0.0;
      v15 = 0.0;
      goto LABEL_12;
    case 1uLL:
      objc_msgSend((id)objc_opt_class(), "arrowHeight");
      v12 = v17;
      goto LABEL_7;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_12;
    case 4uLL:
      objc_msgSend((id)objc_opt_class(), "arrowHeight");
      v15 = v13 + v18;
      v14 = 0.0;
      goto LABEL_11;
    case 8uLL:
      objc_msgSend((id)objc_opt_class(), "arrowHeight");
      v14 = v13 + v19;
      goto LABEL_10;
    default:
LABEL_7:
      v14 = 0.0;
LABEL_10:
      v15 = 0.0;
LABEL_11:
      v16 = 0.0;
LABEL_12:
      v20 = v4 + v15;
      v21 = v6 + v12;
      v22 = v8 - (v14 + v15);
      v23 = v10 - (v16 + v12);
      v24 = v20;
      result.size.height = v23;
      result.size.width = v22;
      result.origin.y = v21;
      result.origin.x = v24;
      return result;
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPopoverBackgroundView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIPopoverBackgroundView _updateShadow](self, "_updateShadow");
}

- (int64_t)backgroundStyle
{
  return 0;
}

- (double)_customCornerRadius
{
  return self->_customCornerRadius;
}

- (BOOL)_chromeHidden
{
  return self->__chromeHidden;
}

- (int64_t)_backgroundBlurEffectStyle
{
  return self->__backgroundBlurEffectStyle;
}

@end
