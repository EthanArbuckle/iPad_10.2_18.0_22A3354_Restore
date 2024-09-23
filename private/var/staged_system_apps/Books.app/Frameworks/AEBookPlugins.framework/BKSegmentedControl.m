@implementation BKSegmentedControl

- (BKSegmentedControl)initWithItems:(id)a3
{
  BKSegmentedControl *v3;
  BKSegmentedControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKSegmentedControl;
  v3 = -[BKSegmentedControl initWithItems:](&v6, "initWithItems:", a3);
  v4 = v3;
  if (v3)
  {
    -[BKSegmentedControl setFont:](v3, "setFont:", 0);
    -[BKSegmentedControl updateAppearance](v4, "updateAppearance");
  }
  return v4;
}

- (BOOL)useCustomButton
{
  return 1;
}

- (void)updateAppearance
{
  void *v3;
  __int128 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSegmentedControl background](self, "background"));

  if (v3)
  {
    -[BKSegmentedControl _appearanceStruct](self, "_appearanceStruct", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0);
    -[BKSegmentedControl _setSegmentedControlAppearance:](self, "_setSegmentedControlAppearance:", &v4);
  }
}

- ($46C59B5655F30DA7E82DF15A2439003D)_appearanceStruct
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  $46C59B5655F30DA7E82DF15A2439003D *result;
  id v23;

  *(_OWORD *)&retstr->var6.var4 = 0u;
  *(_OWORD *)&retstr->var6.var5.height = 0u;
  *(_OWORD *)&retstr->var6.var0 = 0u;
  *(_OWORD *)&retstr->var6.var2 = 0u;
  *(_OWORD *)&retstr->var5.var3 = 0u;
  retstr->var5.var5 = 0u;
  *(_OWORD *)&retstr->var4.var5.height = 0u;
  *(_OWORD *)&retstr->var5.var1 = 0u;
  *(_OWORD *)&retstr->var4.var2 = 0u;
  *(_OWORD *)&retstr->var4.var4 = 0u;
  retstr->var3.var5 = 0u;
  *(_OWORD *)&retstr->var4.var0 = 0u;
  *(_OWORD *)&retstr->var3.var1 = 0u;
  *(_OWORD *)&retstr->var3.var3 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSegmentedControl font](self, "font"));
  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSegmentedControl font](self, "font"));
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 12.0));
  v7 = v6;

  retstr->var0 = v7;
  retstr->var1 = 0.0;
  retstr->var2 = 0.0;
  retstr->var7 = 1;
  v23 = (id)objc_claimAutoreleasedReturnValue(-[BKSegmentedControl textColor](self, "textColor"));
  v8 = -[BKSegmentedControl controlSize](self, "controlSize");
  if (v8 == 1)
    v9 = objc_claimAutoreleasedReturnValue(-[BKSegmentedControl dividerMini](self, "dividerMini"));
  else
    v9 = objc_claimAutoreleasedReturnValue(-[BKSegmentedControl divider](self, "divider"));
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKSegmentedControl dividerLeftPressed](self, "dividerLeftPressed"));
  if (v11)
    v12 = (id)objc_claimAutoreleasedReturnValue(-[BKSegmentedControl dividerLeftPressed](self, "dividerLeftPressed"));
  else
    v12 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSegmentedControl dividerRightPressed](self, "dividerRightPressed"));
  if (v14)
    v15 = (id)objc_claimAutoreleasedReturnValue(-[BKSegmentedControl dividerRightPressed](self, "dividerRightPressed"));
  else
    v15 = v10;
  v16 = v15;

  if (v8 == 1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKSegmentedControl backgroundMini](self, "backgroundMini"));
    v18 = objc_claimAutoreleasedReturnValue(-[BKSegmentedControl backgroundSelectedMini](self, "backgroundSelectedMini"));
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKSegmentedControl background](self, "background"));
    v18 = objc_claimAutoreleasedReturnValue(-[BKSegmentedControl backgroundSelected](self, "backgroundSelected"));
  }
  v19 = (void *)v18;
  -[BKSegmentedControl textShadowOffset](self, "textShadowOffset");
  retstr->var3.var0 = v17;
  retstr->var3.var1 = v10;
  retstr->var3.var2 = v10;
  retstr->var3.var3 = v23;
  retstr->var3.var4 = 0;
  retstr->var3.var5.width = v20;
  retstr->var3.var5.height = v21;
  retstr->var4.var0 = v19;
  retstr->var4.var1 = v13;
  retstr->var4.var2 = v16;
  retstr->var4.var3 = v23;
  retstr->var4.var4 = 0;
  retstr->var4.var5.width = v20;
  retstr->var4.var5.height = v21;
  retstr->var5.var0 = v17;
  retstr->var5.var1 = v10;
  retstr->var5.var2 = v10;
  retstr->var5.var3 = v23;
  retstr->var5.var4 = 0;
  retstr->var5.var5.width = v20;
  retstr->var5.var5.height = v21;
  retstr->var6.var0 = v17;
  retstr->var6.var1 = v10;
  retstr->var6.var2 = v10;
  retstr->var6.var3 = v23;
  retstr->var6.var4 = 0;
  retstr->var6.var5.width = v20;
  retstr->var6.var5.height = v21;

  return result;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (CGSize)textShadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_textShadowOffset.width;
  height = self->_textShadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTextShadowOffset:(CGSize)a3
{
  self->_textShadowOffset = a3;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (UIImage)divider
{
  return self->_divider;
}

- (void)setDivider:(id)a3
{
  objc_storeStrong((id *)&self->_divider, a3);
}

- (UIImage)dividerMini
{
  return self->_dividerMini;
}

- (void)setDividerMini:(id)a3
{
  objc_storeStrong((id *)&self->_dividerMini, a3);
}

- (UIImage)dividerLeftPressed
{
  return self->_dividerLeftPressed;
}

- (void)setDividerLeftPressed:(id)a3
{
  objc_storeStrong((id *)&self->_dividerLeftPressed, a3);
}

- (UIImage)dividerLeftPressedMini
{
  return self->_dividerLeftPressedMini;
}

- (void)setDividerLeftPressedMini:(id)a3
{
  objc_storeStrong((id *)&self->_dividerLeftPressedMini, a3);
}

- (UIImage)dividerRightPressed
{
  return self->_dividerRightPressed;
}

- (void)setDividerRightPressed:(id)a3
{
  objc_storeStrong((id *)&self->_dividerRightPressed, a3);
}

- (UIImage)dividerRightPressedMini
{
  return self->_divideRightPressedMini;
}

- (void)setDividerRightPressedMini:(id)a3
{
  objc_storeStrong((id *)&self->_divideRightPressedMini, a3);
}

- (UIImage)background
{
  return self->_background;
}

- (void)setBackground:(id)a3
{
  objc_storeStrong((id *)&self->_background, a3);
}

- (UIImage)backgroundMini
{
  return self->_backgroundMini;
}

- (void)setBackgroundMini:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundMini, a3);
}

- (UIImage)backgroundSelected
{
  return self->_backgroundSelected;
}

- (void)setBackgroundSelected:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSelected, a3);
}

- (UIImage)backgroundSelectedMini
{
  return self->_backgroundSelectedMini;
}

- (void)setBackgroundSelectedMini:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSelectedMini, a3);
}

- (CGPoint)frameOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_frameOffset.x;
  y = self->_frameOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFrameOffset:(CGPoint)a3
{
  self->_frameOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_divideRightPressedMini, 0);
  objc_storeStrong((id *)&self->_backgroundSelectedMini, 0);
  objc_storeStrong((id *)&self->_backgroundSelected, 0);
  objc_storeStrong((id *)&self->_backgroundMini, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_dividerRightPressedMini, 0);
  objc_storeStrong((id *)&self->_dividerRightPressed, 0);
  objc_storeStrong((id *)&self->_dividerLeftPressedMini, 0);
  objc_storeStrong((id *)&self->_dividerLeftPressed, 0);
  objc_storeStrong((id *)&self->_dividerMini, 0);
  objc_storeStrong((id *)&self->_divider, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

@end
