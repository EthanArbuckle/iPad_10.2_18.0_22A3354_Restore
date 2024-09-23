@implementation _UIListContentImageView

- (_UIListContentImageView)initWithFrame:(CGRect)a3
{
  _UIListContentImageView *v3;
  _UIListContentImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIListContentImageView;
  v3 = -[UIImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_UIListContentImageView _registerTraitChanges](v3, "_registerTraitChanges");
  return v4;
}

- (void)_registerTraitChanges
{
  id v3;
  id v4;

  +[UITraitCollection systemTraitsAffectingColorAppearance](UITraitCollection, "systemTraitsAffectingColorAppearance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[UIView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v4, sel__updateStroke);

}

- (void)_setStrokeWidth:(double)a3
{
  if (self->_strokeWidth != a3)
  {
    self->_strokeWidth = a3;
    -[_UIListContentImageView _updateStroke](self, "_updateStroke");
  }
}

- (void)_setStrokeColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_strokeColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_strokeColor, a3);
    -[_UIListContentImageView _updateStroke](self, "_updateStroke");
    v5 = v6;
  }

}

- (void)_updateStroke
{
  void *v3;
  UIColor *v4;
  UIColor *v5;
  BOOL v6;
  UIColor *strokeColor;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_strokeWidth <= 0.0
    || (v4 = self->_strokeColor) == 0
    || (v11 = v3,
        +[UIColor clearColor](UIColor, "clearColor"),
        v5 = (UIColor *)objc_claimAutoreleasedReturnValue(),
        v5,
        v3 = v11,
        v4 == v5))
  {
    if (self->_hadStroke)
    {
      v12 = v3;
      +[UIColor blackColor](UIColor, "blackColor");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "setBorderColor:", objc_msgSend(v10, "CGColor"));

      objc_msgSend(v12, "setBorderWidth:", 0.0);
      v3 = v12;
    }
    v6 = 0;
  }
  else
  {
    v6 = 1;
    objc_msgSend(v11, "setMasksToBounds:", 1);
    strokeColor = self->_strokeColor;
    -[UIView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColor resolvedColorWithTraitCollection:](strokeColor, "resolvedColorWithTraitCollection:", v8);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "setBorderColor:", objc_msgSend(v9, "CGColor"));

    objc_msgSend(v11, "setBorderWidth:", self->_strokeWidth);
    v3 = v11;
  }
  self->_hadStroke = v6;

}

- (_UIListContentImageView)initWithImage:(id)a3
{
  _UIListContentImageView *v3;
  _UIListContentImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIListContentImageView;
  v3 = -[UIImageView initWithImage:](&v6, sel_initWithImage_, a3);
  v4 = v3;
  if (v3)
    -[_UIListContentImageView _registerTraitChanges](v3, "_registerTraitChanges");
  return v4;
}

- (_UIListContentImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  _UIListContentImageView *v4;
  _UIListContentImageView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIListContentImageView;
  v4 = -[UIImageView initWithImage:highlightedImage:](&v7, sel_initWithImage_highlightedImage_, a3, a4);
  v5 = v4;
  if (v4)
    -[_UIListContentImageView _registerTraitChanges](v4, "_registerTraitChanges");
  return v5;
}

- (_UIListContentImageView)initWithCoder:(id)a3
{
  _UIListContentImageView *v3;
  _UIListContentImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIListContentImageView;
  v3 = -[UIImageView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_UIListContentImageView _registerTraitChanges](v3, "_registerTraitChanges");
  return v4;
}

- (UIColor)_strokeColor
{
  return self->_strokeColor;
}

- (double)_strokeWidth
{
  return self->_strokeWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end
