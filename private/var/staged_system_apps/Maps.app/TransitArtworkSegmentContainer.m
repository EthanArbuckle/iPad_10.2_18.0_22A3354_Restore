@implementation TransitArtworkSegmentContainer

- (void)setShowBackground:(BOOL)a3
{
  id v4;
  UIView *v5;
  UIView *backgroundView;
  void *v7;
  UIView *v8;

  if (self->_showBackground != a3)
  {
    self->_showBackground = a3;
    if (a3)
    {
      v4 = objc_alloc((Class)UIView);
      -[TransitArtworkSegmentContainer bounds](self, "bounds");
      v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
      backgroundView = self->_backgroundView;
      self->_backgroundView = v5;

      -[UIView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
      -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v7);

      -[TransitArtworkSegmentContainer addSubview:](self, "addSubview:", self->_backgroundView);
    }
    else
    {
      -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
      v8 = self->_backgroundView;
      self->_backgroundView = 0;

    }
  }
}

- (void)layoutSubviews
{
  TransitArtworkSegmentContainer *v3;
  CGFloat v4;
  void *v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)TransitArtworkSegmentContainer;
  -[TransitArtworkSegmentContainer layoutSubviews](&v6, "layoutSubviews");
  v3 = (TransitArtworkSegmentContainer *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_backgroundView, "superview"));

  if (v3 == self)
  {
    -[TransitArtworkSegmentContainer sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundView);
    -[TransitArtworkSegmentContainer bounds](self, "bounds");
    -[UIView setFrame:](self->_backgroundView, "setFrame:");
    -[TransitArtworkSegmentContainer bounds](self, "bounds");
    v4 = CGRectGetHeight(v7) * 0.5;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
    objc_msgSend(v5, "setCornerRadius:", v4);

  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  if (-[TransitArtworkSegmentContainer showBackground](self, "showBackground"))
  {
    top = 0.0;
    left = 8.0;
    bottom = 0.0;
    right = 8.0;
  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)showBackground
{
  return self->_showBackground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
