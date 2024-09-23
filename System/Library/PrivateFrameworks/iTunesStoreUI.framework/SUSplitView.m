@implementation SUSplitView

- (SUSplitView)initWithFrame:(CGRect)a3
{
  SUSplitView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUSplitView;
  result = -[SUSplitView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_minimumPaneSize = 30.0;
    result->_layoutType = 2;
    result->_vertical = 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUSplitView;
  -[SUSplitView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double splitPosition;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPath *Mutable;
  CGFloat v18;
  CGFloat v19;
  CGPath *v20;
  CGRect v21;
  CGRect v22;

  -[SUSplitView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[SUSplitView _minimumPaneSizeForLayout](self, "_minimumPaneSizeForLayout");
  splitPosition = self->_splitPosition;
  if (self->_layoutType == 1)
  {
    v9 = 0.0;
    v10 = fmax(splitPosition, 0.0);
    if (v10 > 1.0)
      v10 = 1.0;
    if (self->_vertical)
    {
      v11 = floor(v6 * v10);
      if (v11 >= v7)
        v12 = v11;
      else
        v12 = v7;
      v6 = v6 - v12;
      v13 = v12;
      v14 = v4;
    }
    else
    {
      v9 = floor(v4 * v10);
      v4 = v4 - v9;
      v12 = 0.0;
      v13 = v6;
      v14 = v9;
    }
  }
  else
  {
    v15 = fmax(floor(splitPosition), 0.0);
    if (v15 >= v7)
      v7 = v15;
    v16 = v4 - v7;
    if (self->_vertical)
      v13 = v7;
    else
      v13 = v6;
    if (self->_vertical)
    {
      v6 = v6 - v7;
      v9 = 0.0;
    }
    else
    {
      v9 = v7;
    }
    if (self->_vertical)
      v12 = v7;
    else
      v12 = 0.0;
    if (self->_vertical)
    {
      v16 = v4;
      v14 = v4;
    }
    else
    {
      v14 = v7;
    }
    v4 = v16;
  }
  -[UIView setFrame:](self->_firstView, "setFrame:", 0.0, 0.0, v14, v13);
  -[UIView setFrame:](self->_secondView, "setFrame:", v9, v12, v4, v6);
  Mutable = CGPathCreateMutable();
  v18 = *MEMORY[0x24BDBEFB0];
  v19 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v21.origin.x = *(CGFloat *)MEMORY[0x24BDBEFB0];
  v21.origin.y = v19;
  v21.size.width = v14;
  v21.size.height = v13;
  CGPathAddRect(Mutable, 0, v21);
  -[CALayer setShadowPath:](-[UIView layer](self->_firstView, "layer"), "setShadowPath:", Mutable);
  CGPathRelease(Mutable);
  v20 = CGPathCreateMutable();
  v22.origin.x = v18;
  v22.origin.y = v19;
  v22.size.width = v4;
  v22.size.height = v6;
  CGPathAddRect(v20, 0, v22);
  -[CALayer setShadowPath:](-[UIView layer](self->_secondView, "layer"), "setShadowPath:", v20);
  CGPathRelease(v20);
}

- (void)setFirstView:(id)a3
{
  UIView *firstView;
  UIView *v6;
  UIView *v7;

  firstView = self->_firstView;
  if (firstView != a3)
  {
    if (firstView)
    {
      -[UIView removeFromSuperview](firstView, "removeFromSuperview");
      v6 = self->_firstView;
    }
    else
    {
      v6 = 0;
    }

    v7 = (UIView *)a3;
    self->_firstView = v7;
    if (v7)
      -[SUSplitView addSubview:](self, "addSubview:", v7);
    -[SUSplitView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLayoutType:(int64_t)a3
{
  if (self->_layoutType != a3)
  {
    self->_layoutType = a3;
    -[SUSplitView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMinimumPaneSize:(double)a3
{
  if (self->_minimumPaneSize != a3)
  {
    self->_minimumPaneSize = a3;
    -[SUSplitView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSecondView:(id)a3
{
  UIView *secondView;
  UIView *v6;
  UIView *v7;

  secondView = self->_secondView;
  if (secondView != a3)
  {
    if (secondView)
    {
      -[UIView removeFromSuperview](secondView, "removeFromSuperview");
      v6 = self->_secondView;
    }
    else
    {
      v6 = 0;
    }

    v7 = (UIView *)a3;
    self->_secondView = v7;
    if (v7)
      -[SUSplitView addSubview:](self, "addSubview:", v7);
    -[SUSplitView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSplitPosition:(double)a3
{
  if (self->_splitPosition != a3)
  {
    self->_splitPosition = a3;
    -[SUSplitView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVertical:(BOOL)a3
{
  if (self->_vertical != a3)
  {
    self->_vertical = a3;
    -[SUSplitView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)_minimumPaneSizeForLayout
{
  double minimumPaneSize;
  double v5;
  double v6;
  double v7;

  minimumPaneSize = self->_minimumPaneSize;
  if (minimumPaneSize > 0.00000011920929 && minimumPaneSize < 1.0)
  {
    -[SUSplitView bounds](self, "bounds");
    if (self->_vertical)
      v7 = v6;
    else
      v7 = v5;
    return minimumPaneSize * v7;
  }
  return minimumPaneSize;
}

- (UIView)firstView
{
  return self->_firstView;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (double)minimumPaneSize
{
  return self->_minimumPaneSize;
}

- (UIView)secondView
{
  return self->_secondView;
}

- (double)splitPosition
{
  return self->_splitPosition;
}

- (BOOL)isVertical
{
  return self->_vertical;
}

@end
