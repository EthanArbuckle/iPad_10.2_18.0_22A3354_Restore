@implementation _UIAlertControllerShadowedScrollView

- (CGRect)_boundsForPinningToBottomWithNewBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  if (v10 != width || v9 != height)
  {
    v12 = v8;
    v13 = v9;
    -[UIScrollView contentSize](self, "contentSize");
    if (v14 - v12 - v13 <= 0.0)
    {
      y = v14 - height;
      if (v14 - height < 0.0)
        y = 0.0;
    }
  }
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[_UIAlertControllerShadowedScrollView shouldPinToBottomOnResize](self, "shouldPinToBottomOnResize"))
  {
    -[_UIAlertControllerShadowedScrollView _boundsForPinningToBottomWithNewBounds:](self, "_boundsForPinningToBottomWithNewBounds:", x, y, width, height);
    x = v8;
    y = v9;
    width = v10;
    height = v11;
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIAlertControllerShadowedScrollView;
  -[UIScrollView setBounds:](&v12, sel_setBounds_, x, y, width, height);
  -[_UIAlertControllerShadowedScrollView _updateScrollabilityAndShadow](self, "_updateScrollabilityAndShadow");
}

- (void)setContentSize:(CGSize)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIAlertControllerShadowedScrollView;
  -[UIScrollView setContentSize:](&v4, sel_setContentSize_, a3.width, a3.height);
  -[_UIAlertControllerShadowedScrollView _updateScrollabilityAndShadow](self, "_updateScrollabilityAndShadow");
}

- (void)_updateScrollabilityAndShadow
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  _UIAlertControllerGradientView *shadowView;
  _UIAlertControllerGradientView *v16;
  _UIAlertControllerGradientView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _UIAlertControllerGradientView *v23;
  double v24;
  double v25;
  CGFloat MinX;
  CGFloat v27;
  CGFloat Width;
  double v29;
  CGFloat v30;
  _UIAlertControllerGradientView *v31;
  _QWORD v32[3];
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v32[2] = *MEMORY[0x1E0C80C00];
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIScrollView contentSize](self, "contentSize");
  v12 = v11;
  v13 = -[UIScrollView isScrollEnabled](self, "isScrollEnabled");
  if (v12 > v10)
  {
    if (!v13)
      -[UIScrollView setScrollEnabled:](self, "setScrollEnabled:", 1);
    v14 = v12 - v6 - v10;
    shadowView = self->_shadowView;
    if (v14 > 0.0)
    {
      if (!shadowView)
      {
        v16 = [_UIAlertControllerGradientView alloc];
        v17 = -[UIView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        +[UIColor blackColor](UIColor, "blackColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "colorWithAlphaComponent:", 0.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v19;
        +[UIColor blackColor](UIColor, "blackColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "colorWithAlphaComponent:", 0.045);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIAlertControllerGradientView setGradientColors:](v17, "setGradientColors:", v22);

        -[UIView addSubview:](self, "addSubview:", v17);
        v23 = self->_shadowView;
        self->_shadowView = v17;

        shadowView = self->_shadowView;
      }
      if (v14 >= 6.0)
        v24 = 1.0;
      else
        v24 = v14 / 6.0;
      -[UIView alpha](shadowView, "alpha");
      if (v25 != v24)
        -[UIView setAlpha:](self->_shadowView, "setAlpha:", v24);
      v33.origin.x = v4;
      v33.origin.y = v6;
      v33.size.width = v8;
      v33.size.height = v10;
      MinX = CGRectGetMinX(v33);
      v34.origin.x = v4;
      v34.origin.y = v6;
      v34.size.width = v8;
      v34.size.height = v10;
      v27 = CGRectGetMaxY(v34) + -2.0;
      v35.origin.x = v4;
      v35.origin.y = v6;
      v35.size.width = v8;
      v35.size.height = v10;
      Width = CGRectGetWidth(v35);
      -[UIView frame](self->_shadowView, "frame");
      v40.size.height = 2.0;
      v40.origin.x = MinX;
      v40.origin.y = v27;
      v40.size.width = Width;
      if (!CGRectEqualToRect(v36, v40))
      {
        v37.origin.x = v4;
        v37.origin.y = v6;
        v37.size.width = v8;
        v37.size.height = v10;
        v29 = CGRectGetMinX(v37);
        v38.origin.x = v4;
        v38.origin.y = v6;
        v38.size.width = v8;
        v38.size.height = v10;
        v30 = CGRectGetMaxY(v38) + -2.0;
        v39.origin.x = v4;
        v39.origin.y = v6;
        v39.size.width = v8;
        v39.size.height = v10;
        -[UIView setFrame:](self->_shadowView, "setFrame:", v29, v30, CGRectGetWidth(v39), 2.0);
      }
      if (-[UIView isHidden](self->_shadowView, "isHidden"))
        -[UIView setHidden:](self->_shadowView, "setHidden:", 0);
      return;
    }
    if (-[UIView isHidden](shadowView, "isHidden"))
      return;
LABEL_23:
    -[UIView setFrame:](self->_shadowView, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setHidden:](self->_shadowView, "setHidden:", 1);
    return;
  }
  if (v13)
    -[UIScrollView setScrollEnabled:](self, "setScrollEnabled:", 0);
  v31 = self->_shadowView;
  if (v31 && !-[UIView isHidden](v31, "isHidden"))
    goto LABEL_23;
}

- (BOOL)shouldPinToBottomOnResize
{
  return self->_shouldPinToBottomOnResize;
}

- (void)setShouldPinToBottomOnResize:(BOOL)a3
{
  self->_shouldPinToBottomOnResize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end
