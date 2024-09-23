@implementation _UIDynamicCaretAlternatives

- (_UIDynamicCaretAlternatives)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  _UIDynamicCaretAlternatives *v5;
  _UIDynamicCaretAlternatives *v6;
  UIView *v7;
  void *v8;
  void *v9;
  void *v10;
  UIView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  UIButton *v21;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  v23.receiver = self;
  v23.super_class = (Class)_UIDynamicCaretAlternatives;
  v5 = -[UIView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    -[UIView setOpaque:](v5, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    -[UIView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
    v7 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", width * 0.5, 0.0, 1.0, height);
    -[_UIDynamicCaretAlternatives setVerticalDivider:](v6, "setVerticalDivider:", v7);

    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDynamicCaretAlternatives verticalDivider](v6, "verticalDivider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    -[_UIDynamicCaretAlternatives verticalDivider](v6, "verticalDivider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v6, "addSubview:", v10);

    v11 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, height * 0.5, 1.0, width);
    -[_UIDynamicCaretAlternatives setHorizontalDivider:](v6, "setHorizontalDivider:", v11);

    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDynamicCaretAlternatives horizontalDivider](v6, "horizontalDivider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

    -[_UIDynamicCaretAlternatives horizontalDivider](v6, "horizontalDivider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v6, "addSubview:", v14);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0C9D648];
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v20 = 4;
    do
    {
      v21 = -[UIButton initWithFrame:]([UIButton alloc], "initWithFrame:", v16, v17, v18, v19);
      -[UIView addSubview:](v6, "addSubview:", v21);
      objc_msgSend(v15, "addObject:", v21);

      --v20;
    }
    while (v20);
    -[_UIDynamicCaretAlternatives setAlternativesButtons:](v6, "setAlternativesButtons:", v15);

  }
  return v6;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UIDynamicCaretAlternatives;
  -[UIView layoutSubviews](&v15, sel_layoutSubviews);
  -[UIView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[UIView center](self, "center");
  v8 = v7;
  v10 = v9;
  -[_UIDynamicCaretAlternatives verticalDivider](self, "verticalDivider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v8, 0.0, 1.0, v6);

  -[_UIDynamicCaretAlternatives horizontalDivider](self, "horizontalDivider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", 0.0, v10, v4, 1.0);

  -[_UIDynamicCaretAlternatives alternativesButtons](self, "alternativesButtons");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45___UIDynamicCaretAlternatives_layoutSubviews__block_invoke;
  v14[3] = &__block_descriptor_48_e25_v32__0__UIButton_8Q16_B24l;
  *(double *)&v14[4] = v8;
  *(double *)&v14[5] = v10;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

}

- (void)setButtonLabels:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[_UIDynamicCaretAlternatives alternativesButtons](self, "alternativesButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47___UIDynamicCaretAlternatives_setButtonLabels___block_invoke;
  v7[3] = &unk_1E16E5B70;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (int64_t)indexOfButtonForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a3.y;
  x = a3.x;
  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_UIDynamicCaretAlternatives alternativesButtons](self, "alternativesButtons", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      v11 = 0;
      v12 = v8 + v9;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
        if ((objc_msgSend(v13, "pointInside:withEvent:", 0) & 1) != 0)
        {
          v14 = v9 + v11;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v9 = v12;
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v14;
}

- (void)highlightButtonAtIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;

  if ((a3 & 0x8000000000000000) == 0)
  {
    -[_UIDynamicCaretAlternatives alternativesButtons](self, "alternativesButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 > a3)
    {
      -[_UIDynamicCaretAlternatives alternativesButtons](self, "alternativesButtons");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHighlighted:", 1);

    }
  }
}

- (UIView)verticalDivider
{
  return self->_verticalDivider;
}

- (void)setVerticalDivider:(id)a3
{
  objc_storeStrong((id *)&self->_verticalDivider, a3);
}

- (UIView)horizontalDivider
{
  return self->_horizontalDivider;
}

- (void)setHorizontalDivider:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalDivider, a3);
}

- (NSArray)alternativesButtons
{
  return self->_alternativesButtons;
}

- (void)setAlternativesButtons:(id)a3
{
  objc_storeStrong((id *)&self->_alternativesButtons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativesButtons, 0);
  objc_storeStrong((id *)&self->_horizontalDivider, 0);
  objc_storeStrong((id *)&self->_verticalDivider, 0);
}

@end
