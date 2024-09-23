@implementation _UIButtonMaskAnimationView

- (_UIButtonMaskAnimationView)init
{
  _UIButtonMaskAnimationView *v2;
  UIView *v3;
  uint64_t v4;
  UIView *hardEdgeLine;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIButtonMaskAnimationView;
  v2 = -[UIView init](&v7, sel_init);
  if (v2)
  {
    v3 = [UIView alloc];
    v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    hardEdgeLine = v2->_hardEdgeLine;
    v2->_hardEdgeLine = (UIView *)v4;

    -[UIView addSubview:](v2, "addSubview:", v2->_hardEdgeLine);
  }
  return v2;
}

- (CGRect)_frameForLine
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  void *v8;
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

  v4 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v7 = -[_UIButtonMaskAnimationView hardEdge](self, "hardEdge");
  -[UIView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cornerRadius");
  v10 = v9;

  if (v7)
  {
    -[_UIButtonMaskAnimationView borderWidth](self, "borderWidth");
    v12 = v11;
    switch(v7)
    {
      case 1uLL:
        goto LABEL_4;
      case 2uLL:
        goto LABEL_6;
      case 4uLL:
        -[UIView bounds](self, "bounds");
        v10 = v13 - v12 - v10;
LABEL_4:
        -[UIView bounds](self, "bounds");
        v6 = v14 - (v12 + v12);
        v5 = v12;
        v3 = v10;
        v4 = v12;
        break;
      case 8uLL:
        -[UIView bounds](self, "bounds");
        v10 = v15 - v12 - v10;
LABEL_6:
        -[UIView bounds](self, "bounds");
        v5 = v16 - (v12 + v12);
        v6 = v12;
        v3 = v12;
        v4 = v10;
        break;
      default:
        break;
    }
  }
  v17 = v4;
  v18 = v3;
  v19 = v6;
  v20 = v5;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)layoutSubviews
{
  UIView *hardEdgeLine;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIButtonMaskAnimationView;
  -[UIView layoutSubviews](&v4, sel_layoutSubviews);
  hardEdgeLine = self->_hardEdgeLine;
  -[_UIButtonMaskAnimationView _frameForLine](self, "_frameForLine");
  -[UIView setFrame:](hardEdgeLine, "setFrame:");
}

- (double)borderWidth
{
  void *v2;
  double v3;
  double v4;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "borderWidth");
  v4 = v3;

  return v4;
}

- (void)setBorderWidth:(double)a3
{
  void *v5;

  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderWidth:", a3);

  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (UIColor)borderColor
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "borderColor");

  if (v4)
  {
    -[UIView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v5, "borderColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (UIColor *)v6;
}

- (void)setBorderColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

  -[UIView setBackgroundColor:](self->_hardEdgeLine, "setBackgroundColor:", v6);
}

- (unint64_t)hardEdge
{
  return self->_hardEdge;
}

- (void)setHardEdge:(unint64_t)a3
{
  self->_hardEdge = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIButtonMaskAnimationView;
  if (-[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("borderColor"));

  return v5;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "keyPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("opacity"));

    if (v6)
    {
      -[UIView layer](self, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeAnimationForKey:", CFSTR("borderWidth"));

    }
  }
  -[_UIButtonMaskAnimationViewDelegate _updateMaskState](self->_delegate, "_updateMaskState");

}

- (_UIButtonMaskAnimationViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UIButtonMaskAnimationViewDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardEdgeLine, 0);
}

@end
