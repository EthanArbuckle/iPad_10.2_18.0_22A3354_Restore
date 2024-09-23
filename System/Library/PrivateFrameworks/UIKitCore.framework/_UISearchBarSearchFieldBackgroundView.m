@implementation _UISearchBarSearchFieldBackgroundView

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  double MidX;
  double MidY;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;
  CGRect v25;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)_UISearchBarSearchFieldBackgroundView;
  -[_UITextFieldRoundedRectBackgroundViewNeue layoutSubviews](&v21, sel_layoutSubviews);
  if (self->_backgroundContainer)
  {
    -[UIView bounds](self, "bounds");
    x = v24.origin.x;
    y = v24.origin.y;
    width = v24.size.width;
    height = v24.size.height;
    MidX = CGRectGetMidX(v24);
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    MidY = CGRectGetMidY(v25);
    -[UIView subviews](self, "subviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v16, "setCenter:", MidX, MidY, (_QWORD)v17);
          objc_msgSend(v16, "setBounds:", x, y, width, height);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v13);
    }

  }
}

- (void)setCornerRadius:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)_UISearchBarSearchFieldBackgroundView;
  -[_UITextFieldRoundedRectBackgroundViewNeue setCornerRadius:](&v15, sel_setCornerRadius_);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UIView subviews](self, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v10, "setCornerRadius:", a3);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (id)_automaticFillColorForActive:(BOOL)a3
{
  void *v4;

  if (a3)
  {
    if (-[_UISearchBarSearchFieldBackgroundView showingTouch](self, "showingTouch"))
    {
      +[UIColor systemFillColor](UIColor, "systemFillColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[_UISearchBarSearchFieldBackgroundView showingCursor](self, "showingCursor"))
        +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
      else
        +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[UIColor _searchFieldDisabledBackgroundColor](UIColor, "_searchFieldDisabledBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_strokeColor:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v6;

  v3 = a3;
  if (-[_UISearchBarSearchFieldBackgroundView barStyle](self, "barStyle"))
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)_UISearchBarSearchFieldBackgroundView;
  -[_UITextFieldRoundedRectBackgroundViewNeue _strokeColor:](&v6, sel__strokeColor_, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)barStyle
{
  return self->_barStyle;
}

- (id)_fillColor:(BOOL)a3
{
  void *v3;
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  double v24;
  BOOL v25;
  double v26;
  double v27;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  int v32;
  double v33;

  if (self->_backgroundContainer)
    goto LABEL_2;
  v4 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 3)
  {
    +[UIColor _carSystemQuaternaryColor](UIColor, "_carSystemQuaternaryColor");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_35:
    v3 = (void *)v8;
    return v3;
  }
  v9 = -[_UISearchBarSearchFieldBackgroundView searchBarStyle](self, "searchBarStyle");
  if (v9 > 2009)
  {
    switch(v9)
    {
      case 2010:
        -[UIView layer](self, "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "compositingFilter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "type");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = *MEMORY[0x1E0CD2E80];
        goto LABEL_17;
      case 2020:
        v10 = !v4;
        v11 = 0.063;
        v12 = 0.18;
        goto LABEL_19;
      case 2030:
        -[UIView layer](self, "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "compositingFilter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "type");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CD2E80]);

        if (v16)
        {
          v17 = 0.182;
          v12 = 0.52;
        }
        else
        {
          v17 = 0.014;
          v12 = 0.04;
        }
        if (!v4)
          v12 = v17;
        v24 = 1.0;
        goto LABEL_34;
    }
LABEL_23:
    if (-[_UISearchBarSearchFieldBackgroundView barStyle](self, "barStyle"))
    {
      if (-[_UISearchBarSearchFieldBackgroundView barStyle](self, "barStyle") == 4)
      {
LABEL_2:
        v3 = 0;
        return v3;
      }
      v25 = !v4;
      v26 = 0.105;
      v27 = 0.3;
      goto LABEL_47;
    }
    v29 = UISearchBarUsesModernAppearance();
    -[UIView layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "compositingFilter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "type");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v29)
    {
      v32 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CD2BC0]);

      v25 = !v4;
      if (v32)
      {
        v12 = 1.0;
        if (!v4)
          v12 = 0.35;
        v24 = 0.48;
        goto LABEL_34;
      }
      v26 = 0.035;
      v27 = 0.1;
LABEL_47:
      if (v25)
        v33 = v26;
      else
        v33 = v27;
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.203921569, 0.223529412, 0.31372549, v33);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    v22 = *MEMORY[0x1E0CD2E80];
LABEL_17:
    v23 = objc_msgSend(v20, "isEqualToString:", v22);

    -[_UISearchBarSearchFieldBackgroundView _ultralightFillColorForOverlayFilter:active:](self, "_ultralightFillColorForOverlayFilter:active:", v23 != 0, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  if ((unint64_t)v9 >= 2)
  {
    if (v9 == 2005)
    {
      -[_UISearchBarSearchFieldBackgroundView _automaticFillColorForActive:](self, "_automaticFillColorForActive:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    goto LABEL_23;
  }
  if (-[_UISearchBarSearchFieldBackgroundView barStyle](self, "barStyle"))
  {
    v10 = !v4;
    v11 = 0.105;
    v12 = 0.3;
LABEL_19:
    if (v10)
      v12 = v11;
    v24 = 0.0;
LABEL_34:
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v24, v12);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  if (dyld_program_sdk_at_least())
  {
    if (v4)
      +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
    else
      +[UIColor _searchFieldDisabledBackgroundColor](UIColor, "_searchFieldDisabledBackgroundColor");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  +[UIColor _textFieldBackgroundColor](UIColor, "_textFieldBackgroundColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v30;
  if (!v4)
  {
    objc_msgSend(v30, "colorWithAlphaComponent:", 0.35);
    v31 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v31;
  }
  return v3;
}

- (unint64_t)searchBarStyle
{
  return self->_searchBarStyle;
}

- (BOOL)showingTouch
{
  return self->_showingTouch;
}

- (BOOL)showingCursor
{
  return self->_showingCursor;
}

- (void)setBarStyle:(int64_t)a3
{
  if (self->_barStyle != a3)
  {
    self->_barStyle = a3;
    -[_UITextFieldRoundedRectBackgroundViewNeue updateView](self, "updateView");
  }
}

- (_UISearchBarSearchFieldBackgroundView)initWithFrame:(CGRect)a3 active:(BOOL)a4 updateView:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISearchBarSearchFieldBackgroundView;
  return (_UISearchBarSearchFieldBackgroundView *)-[_UITextFieldRoundedRectBackgroundViewNeue _initWithFrame:active:usesSinglePixelLineWidth:updateView:](&v6, sel__initWithFrame_active_usesSinglePixelLineWidth_updateView_, a4, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UISearchBarSearchFieldBackgroundView)initWithFrame:(CGRect)a3 active:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISearchBarSearchFieldBackgroundView;
  return (_UISearchBarSearchFieldBackgroundView *)-[_UITextFieldRoundedRectBackgroundViewNeue _initWithFrame:active:usesSinglePixelLineWidth:](&v5, sel__initWithFrame_active_usesSinglePixelLineWidth_, a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setSearchBarStyle:(unint64_t)a3
{
  if (self->_searchBarStyle != a3)
  {
    self->_searchBarStyle = a3;
    -[_UITextFieldRoundedRectBackgroundViewNeue updateView](self, "updateView");
  }
}

- (void)setBackgroundContainer:(BOOL)a3
{
  if (self->_backgroundContainer != a3)
  {
    self->_backgroundContainer = a3;
    -[_UITextFieldRoundedRectBackgroundViewNeue updateView](self, "updateView");
  }
}

- (void)setShowingTouch:(BOOL)a3
{
  if (self->_showingTouch != a3)
  {
    self->_showingTouch = a3;
    -[_UITextFieldRoundedRectBackgroundViewNeue updateView](self, "updateView");
  }
}

- (void)setShowingCursor:(BOOL)a3
{
  if (self->_showingCursor != a3)
  {
    self->_showingCursor = a3;
    -[_UITextFieldRoundedRectBackgroundViewNeue updateView](self, "updateView");
  }
}

- (id)_ultralightFillColorForOverlayFilter:(BOOL)a3 active:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;

  v4 = a4;
  v5 = a3;
  v6 = -[_UISearchBarSearchFieldBackgroundView showingTouch](self, "showingTouch");
  v7 = 0.72;
  if (v6)
    v7 = 0.8;
  v8 = 0.05;
  if (v6)
    v8 = 0.16;
  if (!v5)
    v7 = v8;
  v9 = 0.35;
  if (v4)
    v9 = 1.0;
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0274509804, 0.0980392157, v9 * v7);
}

- (BOOL)backgroundContainer
{
  return self->_backgroundContainer;
}

@end
