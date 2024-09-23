@implementation _UITextFieldRoundedRectBackgroundViewNeue

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[_UITextFieldRoundedRectBackgroundViewNeue updateView](self, "updateView");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  -[_UITextFieldRoundedRectBackgroundViewNeue updateView](self, "updateView");
  v3.receiver = self;
  v3.super_class = (Class)_UITextFieldRoundedRectBackgroundViewNeue;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)updateView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double lineWidth;
  UIColor *strokeColor;
  UIColor *v10;
  UIColor *v11;
  UIColor *fillColor;
  UIColor *v13;
  UIColor *v14;
  void *v15;
  UIColor *v16;
  double cornerRadius;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  __int16 v21[8];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      __UIFaultDebugAssertLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }

    }
  }
  else if (!self)
  {
    v19 = updateView___s_category;
    if (!updateView___s_category)
    {
      v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v19, (unint64_t *)&updateView___s_category);
    }
    v20 = *(NSObject **)(v19 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21[0] = 0;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", (uint8_t *)v21, 2u);
    }
  }
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v4);

  v5 = (void *)_UISetCurrentFallbackEnvironment(self);
  if (-[_UITextFieldRoundedRectBackgroundViewNeue usesSinglePixelLineWidth](self, "usesSinglePixelLineWidth"))
  {
    -[UIView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    lineWidth = 1.0 / v7;

  }
  else
  {
    lineWidth = self->_lineWidth;
  }
  strokeColor = self->_strokeColor;
  if (strokeColor)
  {
    v10 = strokeColor;
  }
  else
  {
    -[_UITextFieldRoundedRectBackgroundViewNeue _strokeColor:](self, "_strokeColor:", *(_BYTE *)&self->_flags & 1);
    v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  fillColor = self->_fillColor;
  if (fillColor)
  {
    v13 = fillColor;
  }
  else
  {
    -[_UITextFieldRoundedRectBackgroundViewNeue _fillColor:](self, "_fillColor:", *(_BYTE *)&self->_flags & 1);
    v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", v13);
  -[UIView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_retainAutorelease(v11);
  objc_msgSend(v15, "setBorderColor:", -[UIColor CGColor](v16, "CGColor"));
  objc_msgSend(v15, "setBorderWidth:", lineWidth);
  if (-[_UITextFieldRoundedRectBackgroundViewNeue hasFlexibleCornerRadius](self, "hasFlexibleCornerRadius"))
    -[_UITextFieldRoundedRectBackgroundViewNeue _cornerRadiusAdjustedForBoundsHeight](self, "_cornerRadiusAdjustedForBoundsHeight");
  else
    cornerRadius = self->_cornerRadius;
  objc_msgSend(v15, "setCornerRadius:", cornerRadius);
  objc_msgSend(v15, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  _UIRestorePreviousFallbackEnvironment(v5);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v3);

}

- (BOOL)usesSinglePixelLineWidth
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)hasFlexibleCornerRadius
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)_strokeColor:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  unint64_t v5;
  void *v7;

  v3 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 > 8 || ((1 << v5) & 0x144) == 0)
  {
    if (v3)
      +[UIColor _textFieldBorderColor](UIColor, "_textFieldBorderColor");
    else
      +[UIColor _textFieldDisabledBorderColor](UIColor, "_textFieldDisabledBorderColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (double)_cornerRadiusAdjustedForBoundsHeight
{
  double v3;
  double v4;
  double v5;
  double result;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  -[_UITextFieldRoundedRectBackgroundViewNeue _screenScale](self, "_screenScale");
  result = floor(v5 * (v4 * 0.5)) / v5;
  if (result > self->_cornerRadius)
    return self->_cornerRadius;
  return result;
}

- (double)_screenScale
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;

  -[UIView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "scale");
  v8 = v7;

  return v8;
}

- (id)_fillColor:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 8)
    goto LABEL_4;
  if (v5 != 6)
  {
    if (v5 != 2)
    {
      if (v3)
        +[UIColor _textFieldBackgroundColor](UIColor, "_textFieldBackgroundColor");
      else
        +[UIColor _textFieldDisabledBackgroundColor](UIColor, "_textFieldDisabledBackgroundColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_4:
    +[UIColor clearColor](UIColor, "clearColor");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v8 = (void *)v6;
    return v8;
  }
  +[UIColor blackColor](UIColor, "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithAlphaComponent:", 0.15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  id v5;
  UIColor *v6;
  UIColor *v7;
  BOOL v8;
  UIColor *v9;

  v5 = a3;
  v6 = self->_fillColor;
  v7 = (UIColor *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[UIColor isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_fillColor, a3);
    -[_UITextFieldRoundedRectBackgroundViewNeue updateView](self, "updateView");
  }
LABEL_9:

}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (id)_initWithFrame:(CGRect)a3 active:(BOOL)a4 usesSinglePixelLineWidth:(BOOL)a5 updateView:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _UITextFieldRoundedRectBackgroundViewNeue *v8;
  _UITextFieldRoundedRectBackgroundViewNeue *v9;
  char v10;
  objc_super v12;

  v6 = a6;
  v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)_UITextFieldRoundedRectBackgroundViewNeue;
  v8 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  if (v8)
  {
    -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    -[UIView setOpaque:](v9, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
    if (v7)
      v10 = 5;
    else
      v10 = 1;
    *(_BYTE *)&v9->_flags = *(_BYTE *)&v9->_flags & 0xF8 | v10;
    v9->_cornerRadius = 5.0;
    if (v6)
      -[_UITextFieldRoundedRectBackgroundViewNeue updateView](v9, "updateView");
  }
  return v9;
}

- (id)_initWithFrame:(CGRect)a3 active:(BOOL)a4 usesSinglePixelLineWidth:(BOOL)a5
{
  return -[_UITextFieldRoundedRectBackgroundViewNeue _initWithFrame:active:usesSinglePixelLineWidth:updateView:](self, "_initWithFrame:active:usesSinglePixelLineWidth:updateView:", a4, a5, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UITextFieldRoundedRectBackgroundViewNeue)initWithFrame:(CGRect)a3 active:(BOOL)a4
{
  return (_UITextFieldRoundedRectBackgroundViewNeue *)-[_UITextFieldRoundedRectBackgroundViewNeue _initWithFrame:active:usesSinglePixelLineWidth:](self, "_initWithFrame:active:usesSinglePixelLineWidth:", a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setHasFlexibleCornerRadius:(BOOL)a3
{
  char flags;
  char v4;

  flags = (char)self->_flags;
  if (((((flags & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 2;
    else
      v4 = 0;
    *(_BYTE *)&self->_flags = flags & 0xFD | v4;
    -[_UITextFieldRoundedRectBackgroundViewNeue updateView](self, "updateView");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

- (_UITextFieldRoundedRectBackgroundViewNeue)initWithFrame:(CGRect)a3
{
  return -[_UITextFieldRoundedRectBackgroundViewNeue initWithFrame:active:](self, "initWithFrame:active:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setStrokeColor:(id)a3
{
  id v5;
  UIColor *v6;
  UIColor *v7;
  BOOL v8;
  UIColor *v9;

  v5 = a3;
  v6 = self->_strokeColor;
  v7 = (UIColor *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[UIColor isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_strokeColor, a3);
    -[_UITextFieldRoundedRectBackgroundViewNeue updateView](self, "updateView");
  }
LABEL_9:

}

- (void)setLineWidth:(double)a3
{
  -[_UITextFieldRoundedRectBackgroundViewNeue setUsesSinglePixelLineWidth:](self, "setUsesSinglePixelLineWidth:", 0);
  if (self->_lineWidth != a3)
  {
    self->_lineWidth = a3;
    -[_UITextFieldRoundedRectBackgroundViewNeue updateView](self, "updateView");
  }
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  char flags;

  flags = (char)self->_flags;
  if (((((flags & 1) == 0) ^ a3) & 1) == 0)
  {
    *(_BYTE *)&self->_flags = flags & 0xFE | a3;
    -[_UITextFieldRoundedRectBackgroundViewNeue updateView](self, "updateView");
  }
}

- (void)setUsesSinglePixelLineWidth:(BOOL)a3
{
  char flags;
  char v4;

  flags = (char)self->_flags;
  if (((((flags & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 4;
    else
      v4 = 0;
    *(_BYTE *)&self->_flags = flags & 0xFB | v4;
    -[_UITextFieldRoundedRectBackgroundViewNeue updateView](self, "updateView");
  }
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

@end
