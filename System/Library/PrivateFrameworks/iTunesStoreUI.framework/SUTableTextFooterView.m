@implementation SUTableTextFooterView

- (void)dealloc
{
  objc_super v3;

  self->_font = 0;
  self->_shadowColor = 0;

  self->_textColor = 0;
  self->_textLines = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTableTextFooterView;
  -[SUTableTextFooterView dealloc](&v3, sel_dealloc);
}

- (void)drawRect:(CGRect)a3
{
  double x;
  double y;
  double width;
  double height;
  NSArray *textLines;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  UIColor *shadowColor;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGRect v25;
  CGRect v26;

  v24 = *MEMORY[0x24BDAC8D0];
  -[SUTableTextFooterView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v26 = CGRectInset(v25, 10.0, 0.0);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  textLines = self->_textLines;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](textLines, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = height + -26.0;
    v12 = y + 6.0;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(textLines);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        shadowColor = self->_shadowColor;
        if (shadowColor)
        {
          -[UIColor set](shadowColor, "set");
          v17 = v12 + 1.0;
          objc_msgSend(v15, "_legacy_drawInRect:withFont:lineBreakMode:alignment:", self->_font, 4, self->_textAlignment, x, v17, width, v11);
          v12 = v17 + -1.0;
        }
        -[UIColor set](self->_textColor, "set");
        objc_msgSend(v15, "_legacy_drawInRect:withFont:lineBreakMode:alignment:", self->_font, 4, self->_textAlignment, x, v12, width, v11);
        v12 = v12 + v18 + 0.0;
        v11 = v11 - (v18 + 0.0);
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](textLines, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSArray *textLines;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[SUTableTextFooterView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = 26.0;
  if (-[NSArray count](self->_textLines, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    textLines = self->_textLines;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](textLines, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(textLines);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", self->_font, 4, v8 + -20.0, 1.79769313e308);
          v9 = v9 + v15;
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](textLines, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }
  }
  -[SUTableTextFooterView setFrame:](self, "setFrame:", v4, v6, v8, v9);
}

- (void)setFont:(id)a3
{
  UIFont *font;

  font = self->_font;
  if (font != a3)
  {

    self->_font = (UIFont *)a3;
    -[SUTableTextFooterView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setShadowColor:(id)a3
{
  UIColor *shadowColor;

  shadowColor = self->_shadowColor;
  if (shadowColor != a3)
  {

    self->_shadowColor = (UIColor *)a3;
    -[SUTableTextFooterView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[SUTableTextFooterView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setTextColor:(id)a3
{
  UIColor *textColor;

  textColor = self->_textColor;
  if (textColor != a3)
  {

    self->_textColor = (UIColor *)a3;
    -[SUTableTextFooterView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setTextLines:(id)a3
{
  NSArray *textLines;

  textLines = self->_textLines;
  if (textLines != a3)
  {

    self->_textLines = (NSArray *)a3;
    -[SUTableTextFooterView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (UIFont)font
{
  return self->_font;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (NSArray)textLines
{
  return self->_textLines;
}

@end
