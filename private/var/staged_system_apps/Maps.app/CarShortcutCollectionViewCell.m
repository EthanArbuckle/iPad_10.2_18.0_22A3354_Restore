@implementation CarShortcutCollectionViewCell

+ (id)maximumContentSizeCategory
{
  return UIContentSizeCategoryLarge;
}

+ (double)imageTopMargin
{
  return 0.0;
}

+ (double)imageSize
{
  return 30.0;
}

+ (id)titleFontWithTraitCollection:(id)a3
{
  return +[UIFont system12MediumCompatibleWithTraitCollection:](UIFont, "system12MediumCompatibleWithTraitCollection:", a3);
}

+ (id)subtitleFontWithTraitCollection:(id)a3
{
  return +[UIFont system12CompatibleWithTraitCollection:](UIFont, "system12CompatibleWithTraitCollection:", a3);
}

+ (double)titleTopMargin
{
  return 3.0;
}

+ (double)textHorizontalMargin
{
  return 0.0;
}

+ (double)bottomMargin
{
  return 6.0;
}

+ (double)focusRingTopOverhang
{
  return 4.0;
}

- (CarShortcutCollectionViewCell)initWithFrame:(CGRect)a3
{
  CarShortcutCollectionViewCell *v3;
  CarShortcutCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarShortcutCollectionViewCell;
  v3 = -[ShortcutsRowCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CarShortcutCollectionViewCell _createFocusRingLayer](v3, "_createFocusRingLayer");
  return v4;
}

- (id)accessibilityIdentifier
{
  return CFSTR("CarShortcutCollectionViewCell");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)CarShortcutCollectionViewCell;
  -[ShortcutsRowCollectionViewCell layoutSubviews](&v11, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v4 = CGRectGetWidth(v12) * 0.5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutCollectionViewCell contentView](self, "contentView"));
  v7 = UIRoundToViewScale(v5, v6, v4);
  objc_msgSend((id)objc_opt_class(self), "imageSize");
  v9 = v8 * 0.5;
  objc_msgSend((id)objc_opt_class(self), "imageTopMargin");
  -[CAShapeLayer setPosition:](self->_focusRingLayer, "setPosition:", v7, v9 + v10);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarShortcutCollectionViewCell;
  -[CarShortcutCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  -[CarShortcutCollectionViewCell setFocusOverridden:](self, "setFocusOverridden:", 0);
}

- (void)_updateFocus
{
  uint64_t v3;

  if ((-[CarShortcutCollectionViewCell isFocused](self, "isFocused") & 1) != 0)
    v3 = 0;
  else
    v3 = -[CarShortcutCollectionViewCell focusOverridden](self, "focusOverridden") ^ 1;
  if ((_DWORD)v3 != -[CAShapeLayer isHidden](self->_focusRingLayer, "isHidden"))
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[CAShapeLayer setHidden:](self->_focusRingLayer, "setHidden:", v3);
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)_createFocusRingLayer
{
  CAShapeLayer *v3;
  CAShapeLayer *focusRingLayer;
  id v5;
  double v6;
  const CGPath *v7;
  void *v8;
  void *v9;
  CGRect v10;

  if (!self->_focusRingLayer)
  {
    v3 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    focusRingLayer = self->_focusRingLayer;
    self->_focusRingLayer = v3;

    -[CAShapeLayer setHidden:](self->_focusRingLayer, "setHidden:", 1);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    -[CAShapeLayer setFillColor:](self->_focusRingLayer, "setFillColor:", objc_msgSend(v5, "CGColor"));

    -[CAShapeLayer setLineWidth:](self->_focusRingLayer, "setLineWidth:", 2.0);
    -[CAShapeLayer setAnchorPoint:](self->_focusRingLayer, "setAnchorPoint:", 0.5, 0.5);
    objc_msgSend((id)objc_opt_class(self), "imageSize");
    -[CAShapeLayer setBounds:](self->_focusRingLayer, "setBounds:", 0.0, 0.0, v6 + 4.0 + 2.0, v6 + 4.0 + 2.0);
    -[CAShapeLayer bounds](self->_focusRingLayer, "bounds");
    v7 = CGPathCreateWithEllipseInRect(v10, 0);
    -[CAShapeLayer setPath:](self->_focusRingLayer, "setPath:", v7);
    CGPathRelease(v7);
    -[CarShortcutCollectionViewCell updateFocusRingColor](self, "updateFocusRingColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutCollectionViewCell contentView](self, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
    objc_msgSend(v9, "addSublayer:", self->_focusRingLayer);

    -[CarShortcutCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateFocusRingColor
{
  void *v3;
  id v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UITraitCollection _currentTraitCollection](UITraitCollection, "_currentTraitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutCollectionViewCell traitCollection](self, "traitCollection"));
  +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v3);

  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CarShortcutCollectionViewCell focusColor](self, "focusColor")));
  -[CAShapeLayer setStrokeColor:](self->_focusRingLayer, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

  +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v5);
}

- (UIColor)focusColor
{
  return (UIColor *)+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor");
}

- (void)setFocusOverridden:(BOOL)a3
{
  if (self->_focusOverridden != a3)
  {
    self->_focusOverridden = a3;
    -[CarShortcutCollectionViewCell _updateFocus](self, "_updateFocus");
  }
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarShortcutCollectionViewCell;
  -[CarShortcutCollectionViewCell didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutCollectionViewCell window](self, "window"));

  if (v3)
    -[CarShortcutCollectionViewCell updateFocusRingColor](self, "updateFocusRingColor");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarShortcutCollectionViewCell;
  v4 = a3;
  -[ShortcutsRowCollectionViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarShortcutCollectionViewCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[CarShortcutCollectionViewCell updateFocusRingColor](self, "updateFocusRingColor");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  CarShortcutCollectionViewCell *v7;
  CarShortcutCollectionViewCell *v8;
  CarShortcutCollectionViewCell *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarShortcutCollectionViewCell;
  -[CarShortcutCollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:](&v10, "didUpdateFocusInContext:withAnimationCoordinator:", v6, a4);
  v7 = (CarShortcutCollectionViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedItem"));
  if (v7 == self)
  {

LABEL_5:
    -[CarShortcutCollectionViewCell _updateFocus](self, "_updateFocus");
    goto LABEL_6;
  }
  v8 = v7;
  v9 = (CarShortcutCollectionViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previouslyFocusedItem"));

  if (v9 == self)
    goto LABEL_5;
LABEL_6:

}

- (BOOL)focusOverridden
{
  return self->_focusOverridden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusRingLayer, 0);
}

@end
