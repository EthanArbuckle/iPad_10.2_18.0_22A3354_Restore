@implementation _TVLabel

- (_TVLabel)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TVLabel *result;
  CGSize v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)_TVLabel;
  result = -[_TVLabel initWithFrame:](&v9, sel_initWithFrame_);
  if (result)
  {
    result->_cachedTextRectForBounds.origin.x = x;
    result->_cachedTextRectForBounds.origin.y = y;
    result->_cachedTextRectForBounds.size.width = width;
    result->_cachedTextRectForBounds.size.height = height;
    v8 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    result->_previousBounds.origin = (CGPoint)*MEMORY[0x24BDBF090];
    result->_previousBounds.size = v8;
    result->_previousNumberOfLines = 0;
    result->_cachedSizeThatFits.width = width;
    result->_cachedSizeThatFits.height = height;
    result->_previousTargetSize = (CGSize)*MEMORY[0x24BDBF148];
  }
  return result;
}

- (void)setAttributedText:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_msgSend(v4, "length");
  v6 = *MEMORY[0x24BDF65C0];
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __30___TVLabel_setAttributedText___block_invoke;
  v19[3] = &unk_24EB860B8;
  v19[4] = self;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0, v19);
  v8 = (void *)objc_msgSend(v4, "mutableCopy");
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    v9 = objc_msgSend(v4, "length");
    v10 = *MEMORY[0x24BDF6600];
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __30___TVLabel_setAttributedText___block_invoke_3;
    v16[3] = &unk_24EB856F8;
    objc_copyWeak(&v18, &location);
    v17 = v8;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v10, 0, v9, 0, v16);

    objc_destroyWeak(&v18);
  }
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BDF6628], 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      if (-[_TVLabel textAlignment](self, "textAlignment") == 1)
      {
        objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "mutableCopy");

        objc_msgSend(v13, "setAlignment:", -[_TVLabel textAlignment](self, "textAlignment"));
        objc_msgSend(v13, "setLineBreakMode:", -[_TVLabel lineBreakMode](self, "lineBreakMode"));
        v11 = (void *)objc_msgSend(v13, "copy");

      }
      else
      {
        v11 = 0;
      }
    }
    objc_msgSend(v8, "tv_addLanguageAwareness:", v11);

  }
  v14 = (void *)objc_msgSend(v8, "copy");

  v15.receiver = self;
  v15.super_class = (Class)_TVLabel;
  -[_TVLabel setAttributedText:](&v15, sel_setAttributedText_, v14);
  -[_TVLabel _clearCachedValues](self, "_clearCachedValues");

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)setTextColor:(id)a3
{
  void *v4;
  objc_super v5;

  -[_TVLabel _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)_TVLabel;
  -[_TVLabel setTextColor:](&v5, sel_setTextColor_, v4);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;
  id location;

  v3 = a3;
  -[_TVLabel attributedText](self, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_initWeak(&location, self);
    -[_TVLabel attributedText](self, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVLabel attributedText](self, "attributedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");
    v9 = *MEMORY[0x24BDF65C0];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __27___TVLabel_setHighlighted___block_invoke;
    v11[3] = &unk_24EB87998;
    v11[4] = self;
    v13 = v3;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v10.receiver = self;
  v10.super_class = (Class)_TVLabel;
  -[UIView setHighlighted:](&v10, sel_setHighlighted_, v3);
}

- (void)setPadding:(UIEdgeInsets)a3
{
  if (self->_padding.left != a3.left
    || self->_padding.top != a3.top
    || self->_padding.right != a3.right
    || self->_padding.bottom != a3.bottom)
  {
    self->_padding = a3;
    -[_TVLabel _clearCachedValues](self, "_clearCachedValues");
  }
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVLabel;
  -[_TVLabel setText:](&v4, sel_setText_, a3);
  -[_TVLabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)setFont:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVLabel;
  -[_TVLabel setFont:](&v4, sel_setFont_, a3);
  -[_TVLabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)setLineBreakMode:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVLabel;
  -[_TVLabel setLineBreakMode:](&v4, sel_setLineBreakMode_, a3);
  -[_TVLabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)setNumberOfLines:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVLabel;
  -[_TVLabel setNumberOfLines:](&v4, sel_setNumberOfLines_, a3);
  -[_TVLabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVLabel;
  -[_TVLabel setAdjustsFontSizeToFitWidth:](&v4, sel_setAdjustsFontSizeToFitWidth_, a3);
  -[_TVLabel _clearCachedValues](self, "_clearCachedValues");
}

- (void)setBaselineAdjustment:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVLabel;
  -[_TVLabel setBaselineAdjustment:](&v4, sel_setBaselineAdjustment_, a3);
  -[_TVLabel _clearCachedValues](self, "_clearCachedValues");
}

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect result;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_TVLabel previousBounds](self, "previousBounds");
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  if (!CGRectEqualToRect(v15, v18)
    || -[_TVLabel previousNumberOfLines](self, "previousNumberOfLines") != a4
    || (-[_TVLabel cachedTextRectForBounds](self, "cachedTextRectForBounds"),
        CGRectEqualToRect(v16, *MEMORY[0x24BDBF090])))
  {
    v14.receiver = self;
    v14.super_class = (Class)_TVLabel;
    -[_TVLabel textRectForBounds:limitedToNumberOfLines:](&v14, sel_textRectForBounds_limitedToNumberOfLines_, a4, x, y, width, height);
    -[_TVLabel setCachedTextRectForBounds:](self, "setCachedTextRectForBounds:");
    -[_TVLabel setPreviousBounds:](self, "setPreviousBounds:", x, y, width, height);
    -[_TVLabel setPreviousNumberOfLines:](self, "setPreviousNumberOfLines:", a4);
  }
  -[_TVLabel cachedTextRectForBounds](self, "cachedTextRectForBounds");
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_TVLabel padding](self, "padding");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = fmax(width - (v8 + v12), 0.0);
  v15 = fmax(height - (v6 + v10), 0.0);
  -[_TVLabel cachedSizeThatFits](self, "cachedSizeThatFits");
  v17 = v16;
  v19 = v18;
  -[_TVLabel previousTargetSize](self, "previousTargetSize");
  if (-[UIView tv_shouldReuseCachedSizeThatFits:previousTargetSize:newTargetSize:](self, "tv_shouldReuseCachedSizeThatFits:previousTargetSize:newTargetSize:", v17, v19, v20, v21, v14, v15))
  {
    v31.receiver = self;
    v31.super_class = (Class)_TVLabel;
    -[_TVLabel sizeThatFits:](&v31, sel_sizeThatFits_, v14, v15);
    v23 = v22;
    *(float *)&v22 = v22;
    *(float *)&v24 = v24;
    -[_TVLabel setCachedSizeThatFits:](self, "setCachedSizeThatFits:", ceilf(*(float *)&v22), ceilf(*(float *)&v24));
    if (v14 <= 0.0)
      v25 = v14;
    else
      v25 = v23;
    -[_TVLabel setPreviousTargetSize:](self, "setPreviousTargetSize:", v25, v15);
  }
  -[_TVLabel cachedSizeThatFits](self, "cachedSizeThatFits");
  v27 = v13 + v9 + v26;
  -[_TVLabel cachedSizeThatFits](self, "cachedSizeThatFits");
  v29 = v11 + v7 + v28;
  v30 = v27;
  result.height = v29;
  result.width = v30;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
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
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_TVLabel bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[_TVLabel padding](self, "padding");
  v23.origin.x = v9 + v16;
  v23.origin.y = v11 + v17;
  v23.size.width = v13 - (v16 + v18);
  v23.size.height = v15 - (v17 + v19);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v22 = CGRectIntersection(v21, v23);
  v20.receiver = self;
  v20.super_class = (Class)_TVLabel;
  -[_TVLabel drawTextInRect:](&v20, sel_drawTextInRect_, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
}

- (void)_clearCachedValues
{
  CGPoint v2;
  CGSize v3;
  CGSize v4;

  v2 = (CGPoint)*MEMORY[0x24BDBF090];
  v3 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->_cachedTextRectForBounds.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->_cachedTextRectForBounds.size = v3;
  self->_previousBounds.origin = v2;
  self->_previousBounds.size = v3;
  self->_previousNumberOfLines = 0;
  v4 = (CGSize)*MEMORY[0x24BDBF148];
  self->_cachedSizeThatFits = (CGSize)*MEMORY[0x24BDBF148];
  self->_previousTargetSize = v4;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGRect)cachedTextRectForBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedTextRectForBounds.origin.x;
  y = self->_cachedTextRectForBounds.origin.y;
  width = self->_cachedTextRectForBounds.size.width;
  height = self->_cachedTextRectForBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedTextRectForBounds:(CGRect)a3
{
  self->_cachedTextRectForBounds = a3;
}

- (CGRect)previousBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousBounds.origin.x;
  y = self->_previousBounds.origin.y;
  width = self->_previousBounds.size.width;
  height = self->_previousBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousBounds:(CGRect)a3
{
  self->_previousBounds = a3;
}

- (int64_t)previousNumberOfLines
{
  return self->_previousNumberOfLines;
}

- (void)setPreviousNumberOfLines:(int64_t)a3
{
  self->_previousNumberOfLines = a3;
}

- (CGSize)cachedSizeThatFits
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedSizeThatFits.width;
  height = self->_cachedSizeThatFits.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedSizeThatFits:(CGSize)a3
{
  self->_cachedSizeThatFits = a3;
}

- (CGSize)previousTargetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousTargetSize.width;
  height = self->_previousTargetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviousTargetSize:(CGSize)a3
{
  self->_previousTargetSize = a3;
}

@end
