@implementation UIInputSwitcherTableCellBackgroundView

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD *ContextStack;
  CGContext *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t SafeDeviceIdiom;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  UIColor *v32;
  void *v33;
  UIColor *v34;
  void *v35;
  UIColor *v36;
  void *v37;
  _BOOL4 v38;
  uint64_t v39;

  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v13 = 0;
  else
    v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v13);
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = v15;

  v17 = 1.0 / v16;
  v18 = -[UIInputSwitcherTableCellBackgroundView roundedCorners](self, "roundedCorners");
  v19 = 0.0;
  if (!v18)
    v19 = v17;
  v20 = v11 - v19;
  v21 = -0.0;
  if (!v18)
    v21 = v17;
  v22 = v7 + v21;
  SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
  if (-[UIInputSwitcherTableCellBackgroundView roundedCorners](self, "roundedCorners"))
  {
    if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v24 = 6.0;
    else
      v24 = 8.0;
    UIKBAddRoundedRect(v13, -[UIInputSwitcherTableCellBackgroundView roundedCorners](self, "roundedCorners"), v5, v22, v9, v20, v24);
    CGContextClip(v13);
  }
  if (!_MergedGlobals_17_1[0])
  {
    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)_MergedGlobals_17_1[0];
    _MergedGlobals_17_1[0] = v25;

  }
  if (-[UIInputSwitcherTableCellBackgroundView isSelected](self, "isSelected"))
  {
    objc_msgSend((id)_MergedGlobals_17_1[0], "set");
  }
  else
  {
    if (!-[UIInputSwitcherTableCellBackgroundView drawsOpaque](self, "drawsOpaque"))
      goto LABEL_20;
    +[UIColor whiteColor](UIColor, "whiteColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "set");

  }
  UIRectFillUsingOperation(1, v5, v22, v9, v20);
LABEL_20:
  if (!qword_1ECD7AC68)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.839215686, 1.0);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)qword_1ECD7AC68;
    qword_1ECD7AC68 = v28;

  }
  if (!qword_1ECD7AC70)
    objc_storeStrong((id *)&qword_1ECD7AC70, (id)_MergedGlobals_17_1[0]);
  if (!qword_1ECD7AC78)
    objc_storeStrong((id *)&qword_1ECD7AC78, (id)_MergedGlobals_17_1[0]);
  if (!qword_1ECD7AC80)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.839215686, 1.0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)qword_1ECD7AC80;
    qword_1ECD7AC80 = v30;

  }
  if (!qword_1ECD7AC88)
    objc_storeStrong((id *)&qword_1ECD7AC88, (id)_MergedGlobals_17_1[0]);
  if (!qword_1ECD7AC90)
  {
    v32 = -[UIColor initWithWhite:alpha:]([UIColor alloc], "initWithWhite:alpha:", 0.8, 0.5);
    v33 = (void *)qword_1ECD7AC90;
    qword_1ECD7AC90 = (uint64_t)v32;

  }
  if (-[UIInputSwitcherTableCellBackgroundView usesDarkTheme](self, "usesDarkTheme"))
  {
    if (qword_1ECD7AC98)
      goto LABEL_38;
    v34 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.15);
    v35 = (void *)qword_1ECD7AC98;
    qword_1ECD7AC98 = (uint64_t)v34;
  }
  else
  {
    if (qword_1ECD7ACA0)
      goto LABEL_38;
    v36 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.15);
    v35 = (void *)qword_1ECD7ACA0;
    qword_1ECD7ACA0 = (uint64_t)v36;
  }

LABEL_38:
  if (-[UIInputSwitcherTableCellBackgroundView drawsBorder](self, "drawsBorder"))
  {
    if (-[UIInputSwitcherTableCellBackgroundView isSelected](self, "isSelected"))
    {
      v37 = (void *)qword_1ECD7AC70;
    }
    else
    {
      v38 = -[UIInputSwitcherTableCellBackgroundView usesDarkTheme](self, "usesDarkTheme");
      v39 = 8;
      if (v38)
        v39 = 7;
      v37 = (void *)_MergedGlobals_17_1[v39];
    }
    objc_msgSend(v37, "set");
    UIRectFillUsingOperation(1, v5, 0.0, v9, v17);
  }
  CGContextRestoreGState(v13);
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)drawsOpaque
{
  return self->_drawsOpaque;
}

- (void)setDrawsOpaque:(BOOL)a3
{
  self->_drawsOpaque = a3;
}

- (BOOL)drawsBorder
{
  return self->_drawsBorder;
}

- (void)setDrawsBorder:(BOOL)a3
{
  self->_drawsBorder = a3;
}

- (BOOL)usesDarkTheme
{
  return self->_usesDarkTheme;
}

- (void)setUsesDarkTheme:(BOOL)a3
{
  self->_usesDarkTheme = a3;
}

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (void)setRoundedCorners:(unint64_t)a3
{
  self->_roundedCorners = a3;
}

@end
