@implementation UIInputSwitcherShadowView

- (UIInputSwitcherShadowView)initWithFrame:(CGRect)a3
{
  UIInputSwitcherShadowView *v3;
  UIInputSwitcherShadowView *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *m_gradientColors;
  _UIBackdropView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIInputSwitcherShadowView *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)UIInputSwitcherShadowView;
  v3 = -[UIView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setOpaque:](v3, "setOpaque:", 0);
    v5 = (void *)MEMORY[0x1E0C99D20];
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.999, 0.999, 0.999, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.999, 0.999, 0.999, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithObjects:", v6, v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    m_gradientColors = v4->m_gradientColors;
    v4->m_gradientColors = (NSArray *)v8;

    v10 = -[_UIBackdropView initWithStyle:]([_UIBackdropView alloc], "initWithStyle:", 2050);
    -[UIInputSwitcherShadowView setBlurView:](v4, "setBlurView:", v10);
    -[UIInputSwitcherShadowView blurView](v4, "blurView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFilterMaskAlpha:", 1.0);

    -[UIInputSwitcherShadowView blurView](v4, "blurView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inputSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBlurRadius:", 2.0);

    -[UIInputSwitcherShadowView blurView](v4, "blurView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inputSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setGrayscaleTintLevel:", 0.17);

    -[UIInputSwitcherShadowView blurView](v4, "blurView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inputSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setGrayscaleTintAlpha:", 0.87);

    v19 = v4;
  }

  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  uint64_t v9;
  double v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIInputSwitcherShadowView menu](self, "menu");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mode");

  if (v9)
  {
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    v13 = CGRectInset(v12, -6.0, -6.0);
    x = v13.origin.x;
    y = v13.origin.y;
    width = v13.size.width;
    height = v13.size.height;
  }
  if (-[UIInputSwitcherShadowView mode](self, "mode") == 1)
    v10 = height + 10.0;
  else
    v10 = height;
  v11.receiver = self;
  v11.super_class = (Class)UIInputSwitcherShadowView;
  -[UIView setFrame:](&v11, sel_setFrame_, x, y, width, v10);
}

- (void)layoutSubviews
{
  int m_mode;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIInputSwitcherShadowView;
  -[UIView layoutSubviews](&v11, sel_layoutSubviews);
  m_mode = self->m_mode;
  -[UIInputSwitcherShadowView blurView](self, "blurView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (m_mode)
  {
    objc_msgSend(v4, "removeFromSuperview");
  }
  else
  {
    -[UIView addSubview:](self, "addSubview:", v4);

    -[UIInputSwitcherShadowView menu](self, "menu");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "maskForShadowViewBlurredBackground");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIInputSwitcherShadowView blurView](self, "blurView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilterMaskImage:", v5);

    -[UIInputSwitcherShadowView blurView](self, "blurView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inputSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setGrayscaleTintMaskImage:", v5);

  }
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  _QWORD *ContextStack;
  CGContext *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  void *v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  double v26;
  void *v27;
  int v28;
  CGFloat v29;
  CGFloat v30;
  const CGPath *PopupPath;
  id v32;
  CGColor *v33;
  id v34;
  CGColor *v35;
  double v36;
  void *v37;
  const CGPath *v38;
  id v39;
  CGColor *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  CGGradient *v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  id v53;
  id v54;
  CGSize v55;
  CGSize v56;
  CGSize v57;
  CGPoint v58;

  v4 = -[UIView _keyboardOrientation](self, "_keyboardOrientation", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v14 = 0;
  else
    v14 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  if (-[UIInputSwitcherShadowView mode](self, "mode") == 1)
  {
    -[UIInputSwitcherShadowView menu](self, "menu");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputSwitcherShadowView keyRect](self, "keyRect");
    objc_msgSend(v16, "convertRect:toView:", self);
    v18 = v17;
    v20 = *(double *)&v19;
    v52 = v6;
    v53 = v19;
    v22 = v21;
    v24 = v23;

    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scale");
    v51 = v26;

    CGContextSaveGState(v14);
    -[UIInputSwitcherShadowView menu](self, "menu");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "usesStraightLeftEdge");
    v29 = v6;
    v30 = v24;
    PopupPath = UIInputSwitcherCreatePopupPath(v28, 0, -1, v4, v29, v8, v10, v12 + -16.0, v18, v20, v22, v24);

    CGContextAddPath(v14, PopupPath);
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3);
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = (CGColor *)objc_msgSend(v32, "CGColor");

    CGContextSetFillColorWithColor(v14, v33);
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.2);
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35 = (CGColor *)objc_msgSend(v34, "CGColor");

    if (v51 <= 1.0)
      v36 = 3.0;
    else
      v36 = 1.5;
    v55.width = -v36;
    v55.height = 0.0;
    CGContextSetShadowWithColor(v14, v55, v36, v35);
    CGContextFillPath(v14);
    CGContextRestoreGState(v14);
    CGContextSaveGState(v14);
    CGContextAddPath(v14, PopupPath);
    CGContextSetFillColorWithColor(v14, v33);
    v56.height = 0.0;
    v56.width = v36;
    CGContextSetShadowWithColor(v14, v56, v36, v35);
    CGContextFillPath(v14);
    CGContextRestoreGState(v14);
    CGContextSaveGState(v14);
    CGContextAddPath(v14, PopupPath);
    CGContextSetFillColorWithColor(v14, v33);
    v57.width = 0.0;
    v57.height = v36;
    CGContextSetShadowWithColor(v14, v57, v36, v35);
    CGContextFillPath(v14);
    CGContextRestoreGState(v14);
    CGContextSaveGState(v14);
    -[UIInputSwitcherShadowView menu](self, "menu");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = UIInputSwitcherCreatePopupPath(objc_msgSend(v37, "usesStraightLeftEdge"), 0, -1, v4, v52, v8, v10, v12 + -16.0, v18, *(CGFloat *)&v53, v22, v30);

    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.2);
    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v40 = (CGColor *)objc_msgSend(v39, "CGColor");

    CGContextAddPath(v14, v38);
    CGContextSetStrokeColorWithColor(v14, v40);
    CGContextSetLineWidth(v14, 0.5);
    CGContextStrokePath(v14);
    CGPathRelease(v38);
    CGContextRestoreGState(v14);
    CGContextSaveGState(v14);
    CGContextAddPath(v14, PopupPath);
    CGContextClip(v14);
    -[UIInputSwitcherShadowView gradientColors](self, "gradientColors");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndex:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIInputSwitcherShadowView gradientColors](self, "gradientColors");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectAtIndex:", 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = objc_retainAutorelease(v42);
    v45 = objc_msgSend(v54, "CGColor");
    v46 = objc_retainAutorelease(v44);
    v47 = UIKBCreateTwoColorLinearGradient(v45, objc_msgSend(v46, "CGColor"));
    -[UIView bounds](self, "bounds");
    if (v47)
    {
      v58.y = v49 + v50;
      v58.x = v48;
      CGContextDrawLinearGradient(v14, v47, *(CGPoint *)&v48, v58, 0);
    }
    CGGradientRelease(v47);
    CGContextRestoreGState(v14);
    CGPathRelease(PopupPath);

  }
}

- (int)mode
{
  return self->m_mode;
}

- (void)setMode:(int)a3
{
  self->m_mode = a3;
}

- (double)pointerOffset
{
  return self->m_pointerOffset;
}

- (void)setPointerOffset:(double)a3
{
  self->m_pointerOffset = a3;
}

- (NSArray)gradientColors
{
  return self->m_gradientColors;
}

- (void)setGradientColors:(id)a3
{
  objc_storeStrong((id *)&self->m_gradientColors, a3);
}

- (CGRect)keyRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyRect.origin.x;
  y = self->_keyRect.origin.y;
  width = self->_keyRect.size.width;
  height = self->_keyRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setKeyRect:(CGRect)a3
{
  self->_keyRect = a3;
}

- (UIKeyboardMenuView)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  self->_menu = (UIKeyboardMenuView *)a3;
}

- (_UIBackdropView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->m_gradientColors, 0);
}

@end
