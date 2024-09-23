@implementation _UIBarCustomizationReservoirCell

- (void)setChiclet:(id)a3
{
  _UIBarCustomizationChiclet *v5;
  _UIBarCustomizationChiclet **p_chiclet;
  _UIBarCustomizationChiclet *chiclet;
  void *v8;
  void *v9;
  void *v10;
  _UIBarCustomizationChiclet *v11;

  v5 = (_UIBarCustomizationChiclet *)a3;
  p_chiclet = &self->_chiclet;
  chiclet = self->_chiclet;
  if (chiclet != v5)
  {
    v11 = v5;
    -[UIView superview](chiclet, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
      -[UIView removeFromSuperview](*p_chiclet, "removeFromSuperview");
    objc_storeStrong((id *)&self->_chiclet, a3);
    -[UICollectionViewCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", *p_chiclet);

    v5 = v11;
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIBarCustomizationReservoirCell;
  -[UICollectionViewCell layoutSubviews](&v11, sel_layoutSubviews);
  -[UICollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v6 = v5 + v4 * 0.5;
  v9 = v8 + v7 * 0.5;
  -[_UIBarCustomizationReservoirCell chiclet](self, "chiclet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCenter:", v6, v9);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_UIBarCustomizationReservoirCell chiclet](self, "chiclet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    v9 = objc_msgSend(v8, "pointInside:withEvent:", v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_UIBarCustomizationReservoirCell chiclet](self, "chiclet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UIBarCustomizationReservoirCell chiclet](self, "chiclet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
    objc_msgSend(v9, "hitTest:withEvent:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_UIBarCustomizationChiclet)chiclet
{
  return self->_chiclet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chiclet, 0);
}

@end
