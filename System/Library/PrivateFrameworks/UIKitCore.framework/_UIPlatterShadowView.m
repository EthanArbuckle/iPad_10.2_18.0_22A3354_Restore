@implementation _UIPlatterShadowView

- (_UIPlatterShadowView)initWithShadowPath:(id)a3
{
  id v4;
  _UIPlatterShadowView *v5;
  _UIPlatterShadowView *v6;
  void *v7;
  void *v8;
  _UIPlatterShadowView *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v11.receiver = self;
  v11.super_class = (Class)_UIPlatterShadowView;
  v5 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, 0.0, 0.0);
  v6 = v5;
  if (v5)
  {
    -[UIView layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupBlending:", 1);

    -[_UIPlatterShadowView setShadowPath:](v6, "setShadowPath:", v4);
    +[UIColor blackColor](UIColor, "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPlatterShadowView setShadowColor:](v6, "setShadowColor:", v8);

    v9 = v6;
  }

  return v6;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIPlatterShadowView;
  if (-[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4)
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("shadowOpacity")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("shadowColor")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("shadowRadius")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("shadowOffset")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("shadowPath"));
  }

  return v5;
}

- (void)setPunchOut:(BOOL)a3
{
  _UIShapeView *shadowMaskView;
  _UIShapeView *v5;
  _UIShapeView *v6;
  _UIShapeView *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (self->_punchOut != a3)
  {
    self->_punchOut = a3;
    shadowMaskView = self->_shadowMaskView;
    if (a3)
    {
      if (!shadowMaskView)
      {
        v5 = [_UIShapeView alloc];
        -[UIView bounds](self, "bounds");
        v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
        v7 = self->_shadowMaskView;
        self->_shadowMaskView = v6;

        v8 = *MEMORY[0x1E0CD2C50];
        -[UIView layer](self->_shadowMaskView, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setCompositingFilter:", v8);

        -[UIView layer](self, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "shadowPath");
        -[_UIShapeView shapeLayer](self->_shadowMaskView, "shapeLayer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setPath:", v11);

        shadowMaskView = self->_shadowMaskView;
      }
      -[UIView addSubview:](self, "addSubview:", shadowMaskView);
    }
    else
    {
      -[UIView removeFromSuperview](self->_shadowMaskView, "removeFromSuperview");
    }
  }
}

- (void)setShadowColor:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "CGColor");
  -[UIView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowColor:", v4);

}

- (UIColor)shadowColor
{
  void *v2;
  void *v3;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v2, "shadowColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setShadowRadius:(double)a3
{
  void *v5;

  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowRadius:", a3);

  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (double)shadowRadius
{
  void *v2;
  double v3;
  double v4;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowRadius");
  v4 = v3;

  return v4;
}

- (void)setShadowOpacity:(double)a3
{
  float v3;
  double v4;
  id v5;

  v3 = a3;
  -[UIView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setShadowOpacity:", v4);

}

- (double)shadowOpacity
{
  void *v2;
  float v3;
  double v4;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOpacity");
  v4 = v3;

  return v4;
}

- (void)setShadowOffset:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[UIView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowOffset:", width, height);

}

- (CGSize)shadowOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIBezierPath)shadowPath
{
  void *v2;
  void *v3;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", objc_msgSend(v2, "shadowPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBezierPath *)v3;
}

- (void)setShadowPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "CGPath");
  -[UIView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowPath:", v5);

  v7 = objc_retainAutorelease(v4);
  v8 = objc_msgSend(v7, "CGPath");

  -[_UIPlatterShadowView shadowMaskView](self, "shadowMaskView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shapeLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPath:", v8);

}

- (BOOL)punchOut
{
  return self->_punchOut;
}

- (_UIShapeView)shadowMaskView
{
  return self->_shadowMaskView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowMaskView, 0);
}

@end
