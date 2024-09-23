@implementation UIInterfaceActionSeparatorAttributes

- (UIInterfaceActionSeparatorAttributes)init
{
  UIInterfaceActionSeparatorAttributes *v2;
  UIInterfaceActionSeparatorAttributes *v3;
  NSArray *filters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIInterfaceActionSeparatorAttributes;
  v2 = -[UIInterfaceActionSeparatorAttributes init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_opacity = -1.0;
    filters = v2->_filters;
    v2->_filters = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[UIInterfaceActionSeparatorAttributes opacity](self, "opacity");
  objc_msgSend(v4, "setOpacity:");
  -[UIInterfaceActionSeparatorAttributes filters](self, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilters:", v5);

  -[UIInterfaceActionSeparatorAttributes backgroundColor](self, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[UIInterfaceActionSeparatorAttributes opacity](self, "opacity");
    v9 = v8;
    objc_msgSend(v7, "opacity");
    if (v9 != v10)
    {
      v13 = 0;
LABEL_11:

      goto LABEL_12;
    }
    -[UIInterfaceActionSeparatorAttributes backgroundColor](self, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12
      || (-[UIInterfaceActionSeparatorAttributes backgroundColor](self, "backgroundColor"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "backgroundColor"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      -[UIInterfaceActionSeparatorAttributes filters](self, "filters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "filters");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "isEqual:", v15);

      if (v11 == v12)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_10;
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (double)opacity
{
  double result;
  _BOOL4 v3;

  result = self->_opacity;
  if (result < 0.0)
  {
    v3 = -[UIInterfaceActionSeparatorAttributes _hasNonClearBackgroundColor](self, "_hasNonClearBackgroundColor");
    result = 0.0;
    if (v3)
      return 1.0;
  }
  return result;
}

- (id)newSeparatorView
{
  _UIInterfaceActionBlendingSeparatorView *v3;
  void *v4;
  _UIInterfaceActionBlendingSeparatorView *v5;
  void *v6;
  void *v7;

  v3 = [_UIInterfaceActionBlendingSeparatorView alloc];
  -[UIInterfaceActionSeparatorAttributes filters](self, "filters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIInterfaceActionBlendingSeparatorView initWithTopLevelFilters:compositingColors:compositingFilterModes:](v3, "initWithTopLevelFilters:compositingColors:compositingFilterModes:", v4, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);

  -[UIInterfaceActionSeparatorAttributes backgroundColor](self, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIInterfaceActionSeparatorAttributes backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v7);

  }
  -[UIInterfaceActionSeparatorAttributes opacity](self, "opacity");
  -[UIView setAlpha:](v5, "setAlpha:");
  return v5;
}

- (BOOL)_hasNonClearBackgroundColor
{
  UIColor *backgroundColor;
  void *v3;

  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(backgroundColor) = !-[UIColor isEqual:](backgroundColor, "isEqual:", v3);

  }
  return (char)backgroundColor;
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_filters, 0);
}

@end
