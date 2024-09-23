@implementation UIInputSwitcherSelectionExtraView

- (UIInputSwitcherSelectionExtraView)initWithFrame:(CGRect)a3
{
  UIInputSwitcherSelectionExtraView *v3;
  UIInputSwitcherSelectionExtraView *v4;
  UIInputSwitcherSelectionExtraView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIInputSwitcherSelectionExtraView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setOpaque:](v3, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v5 = v4;
  }

  return v4;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIInputSwitcherSelectionExtraView;
  -[UIView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height + 80.0);
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  _QWORD *ContextStack;
  CGContext *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v31;
  const CGPath *PopupPath;
  id v33;
  CGColor *v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v7 = 0;
  else
    v7 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v7);
  -[UIInputSwitcherSelectionExtraView menu](self, "menu");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputSwitcherSelectionExtraView keyRect](self, "keyRect");
  objc_msgSend(v9, "convertRect:toView:", self);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[UIInputSwitcherSelectionExtraView menu](self, "menu");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "table");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isScrollEnabled");

  v21 = v11 + 0.0;
  v22 = v13 + -4.0;
  if (v20)
  {
    v17 = v17 + 4.0;
    v13 = v13 + -4.0;
    v11 = v11 + 0.0;
  }
  -[UIInputSwitcherSelectionExtraView menu](self, "menu", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "table");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v26 = v25;

  v35.origin.x = v11;
  v35.origin.y = v13;
  v35.size.width = v15;
  v35.size.height = v17;
  v36.size.height = CGRectGetMaxY(v35) - v26;
  v36.origin.x = 8.0;
  v36.origin.y = v26;
  v36.size.width = v5 + -16.0;
  v37 = CGRectInset(v36, -6.0, 0.0);
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  -[UIInputSwitcherSelectionExtraView menu](self, "menu");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  PopupPath = UIInputSwitcherCreatePopupPath(objc_msgSend(v31, "usesStraightLeftEdge"), 1, -[UIInputSwitcherSelectionExtraView roundedCorners](self, "roundedCorners"), -[UIView _keyboardOrientation](self, "_keyboardOrientation"), x, y, width, height, v11, v13, v15, v17);

  CGContextAddPath(v7, PopupPath);
  +[UIColor systemBlueColor](UIColor, "systemBlueColor");
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v34 = (CGColor *)objc_msgSend(v33, "CGColor");

  CGContextSetFillColorWithColor(v7, v34);
  CGContextFillPath(v7);
  CGContextRestoreGState(v7);
  CGPathRelease(PopupPath);
}

- (double)pointerOffset
{
  return self->m_pointerOffset;
}

- (void)setPointerOffset:(double)a3
{
  self->m_pointerOffset = a3;
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

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (void)setRoundedCorners:(unint64_t)a3
{
  self->_roundedCorners = a3;
}

- (UIKeyboardMenuView)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  self->_menu = (UIKeyboardMenuView *)a3;
}

@end
