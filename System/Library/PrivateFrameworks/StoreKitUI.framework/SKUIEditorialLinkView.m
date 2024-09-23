@implementation SKUIEditorialLinkView

- (SKUIEditorialLinkView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIEditorialLinkView *v8;
  NSMutableArray *v9;
  NSMutableArray *buttons;
  id v11;
  id v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditorialLinkView initWithFrame:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIEditorialLinkView;
  v8 = -[SKUIEditorialLinkView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    buttons = v8->_buttons;
    v8->_buttons = v9;

    v11 = -[SKUIEditorialLinkView _newButton](v8, "_newButton");
    -[SKUIEditorialLinkView addSubview:](v8, "addSubview:", v11);
    -[NSMutableArray addObject:](v8->_buttons, "addObject:", v11);

    v12 = -[SKUIEditorialLinkView _newButton](v8, "_newButton");
    -[SKUIEditorialLinkView addSubview:](v8, "addSubview:", v12);
    -[NSMutableArray addObject:](v8->_buttons, "addObject:", v12);

  }
  return v8;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_buttons;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SKUIEditorialLinkView;
  -[SKUIEditorialLinkView dealloc](&v8, sel_dealloc);
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIColor **p_highlightedTextColor;
  void *v8;
  UIColor **p_textColor;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "highlightedTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  p_highlightedTextColor = &self->_highlightedTextColor;
  objc_storeStrong((id *)&self->_highlightedTextColor, v6);
  if (v5)
  {

    objc_msgSend(v5, "secondaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  p_textColor = &self->_textColor;
  objc_storeStrong((id *)&self->_textColor, v8);
  if (v5)

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_buttons;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (*p_textColor)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "setTitleColor:forState:", *p_textColor, 0);
        }
        else
        {
          -[SKUIEditorialLinkView tintColor](self, "tintColor", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setTitleColor:forState:", v16, 0);

        }
        if (*p_highlightedTextColor)
        {
          objc_msgSend(v15, "setTitleColor:forState:", *p_highlightedTextColor, 1);
        }
        else
        {
          -[SKUIEditorialLinkView tintColor](self, "tintColor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setTitleColor:forState:", v17, 1);

        }
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

}

- (void)setHorizontalAlignment:(int64_t)a3
{
  if (self->_horizontalAlignment != a3)
    self->_horizontalAlignment = a3;
}

- (void)setLinkLayout:(id)a3
{
  SKUIEditorialLinkLayout *v5;
  SKUIEditorialLinkLayout *v6;

  v5 = (SKUIEditorialLinkLayout *)a3;
  if (self->_layout != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_layout, a3);
    -[SKUIEditorialLinkView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  SKUIEditorialLinkLayout *layout;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];

  if (self->_layout)
  {
    -[SKUIEditorialLinkView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[SKUIEditorialLinkLayout links](self->_layout, "links");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0;
    layout = self->_layout;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __39__SKUIEditorialLinkView_layoutSubviews__block_invoke;
    v17[3] = &unk_1E73A3EC0;
    v20 = v4;
    v21 = v6;
    v22 = v8;
    v23 = v10;
    v17[4] = self;
    v19 = v24;
    v13 = v11;
    v18 = v13;
    -[SKUIEditorialLinkLayout enumerateLinesUsingBlock:](layout, "enumerateLinesUsingBlock:", v17);
    v14 = -[NSMutableArray count](self->_buttons, "count");
    v15 = objc_msgSend(v13, "count");
    if (v15 < v14)
    {
      do
      {
        -[NSMutableArray objectAtIndex:](self->_buttons, "objectAtIndex:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setHidden:", 1);

        ++v15;
      }
      while (v14 != v15);
    }

    _Block_object_dispose(v24, 8);
  }
}

double __39__SKUIEditorialLinkView_layoutSubviews__block_invoke(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  float v14;
  unint64_t v15;
  unint64_t v16;
  id *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  uint64_t v27;
  double result;
  CGRect v29;

  v3 = a3;
  v6 = a2 + a3;
  v7 = 0.0;
  if (a2 < a2 + a3)
  {
    v8 = a3;
    v9 = a2;
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "sizeForLinkAtIndex:", v9);
      v7 = v7 + v10;
      ++v9;
      --v8;
    }
    while (v8);
  }
  if (v3 > 1)
    v7 = v7 + (float)((float)(v3 - 1) * 15.0);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(v11 + 440);
  if (v12 == 3)
  {
    v13 = *(double *)(a1 + 72) - v7;
  }
  else
  {
    v13 = 0.0;
    if (v12 == 2)
    {
      v14 = (*(double *)(a1 + 72) - v7) * 0.5;
      v13 = floorf(v14);
    }
  }
  if (a2 < v6)
  {
    v15 = a2;
    do
    {
      v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "count");
      v17 = *(id **)(a1 + 32);
      if (v15 >= v16)
      {
        v18 = (void *)objc_msgSend(v17, "_newButton");
        objc_msgSend(*(id *)(a1 + 32), "addSubview:", v18);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "addObject:", v18);
      }
      else
      {
        objc_msgSend(v17[52], "objectAtIndex:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v18, "frame");
      v19 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "sizeForLinkAtIndex:", v15);
      v22 = v21;
      if (v20 >= *(double *)(a1 + 72))
        v23 = *(double *)(a1 + 72);
      else
        v23 = v20;
      objc_msgSend(v18, "setFrame:", v13, v19, v23, v21);
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "title");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:forState:", v25, 0);

      objc_msgSend(v18, "setHidden:", 0);
      v29.origin.x = v13;
      v29.origin.y = v19;
      v29.size.width = v23;
      v29.size.height = v22;
      v13 = CGRectGetMaxX(v29) + 15.0;

      ++v15;
      --v3;
    }
    while (v3);
    v11 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v11 + 448), "sizeForLinkAtIndex:", a2);
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  result = v26 + 8.0 + *(double *)(v27 + 24);
  *(double *)(v27 + 24) = result;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  NSMutableArray *buttons;
  id v5;
  objc_super v6;

  buttons = self->_buttons;
  v5 = a3;
  -[NSMutableArray makeObjectsPerformSelector:withObject:](buttons, "makeObjectsPerformSelector:withObject:", sel_setBackgroundColor_, v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIEditorialLinkView;
  -[SKUIEditorialLinkView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)result
{
  SKUIEditorialLinkLayout *layout;

  layout = self->_layout;
  if (layout)
    -[SKUIEditorialLinkLayout totalSize](layout, "totalSize", result.width, result.height);
  return result;
}

- (void)tintColorDidChange
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  UIColor *textColor;
  void *v10;
  UIColor *highlightedTextColor;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)SKUIEditorialLinkView;
  -[SKUIEditorialLinkView tintColorDidChange](&v17, sel_tintColorDidChange);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_buttons;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        textColor = self->_textColor;
        if (textColor)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "setTitleColor:forState:", textColor, 0);
        }
        else
        {
          -[SKUIEditorialLinkView tintColor](self, "tintColor", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setTitleColor:forState:", v10, 0);

        }
        highlightedTextColor = self->_highlightedTextColor;
        if (highlightedTextColor)
        {
          objc_msgSend(v8, "setTitleColor:forState:", highlightedTextColor, 1);
        }
        else
        {
          -[SKUIEditorialLinkView tintColor](self, "tintColor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setTitleColor:forState:", v12, 1);

        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v5);
  }

}

- (void)_linkButtonAction:(id)a3
{
  id WeakRetained;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_buttons, "indexOfObjectIdenticalTo:", v11);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v6;
      -[SKUIEditorialLinkLayout links](self->_layout, "links");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "editorialLinkView:didSelectLink:", self, v9);

    }
  }

}

- (id)_newButton
{
  SKUILinkButton *v3;
  double v4;
  UIColor *textColor;
  void *v6;
  UIColor *highlightedTextColor;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[SKUILinkButton initWithArrowStyle:]([SKUILinkButton alloc], "initWithArrowStyle:", 1);
  -[SKUILinkButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", self, sel__linkButtonAction_, 64);
  LODWORD(v4) = -1.0;
  -[SKUILinkButton setCharge:](v3, "setCharge:", v4);
  textColor = self->_textColor;
  if (textColor)
  {
    -[SKUILinkButton setTitleColor:forState:](v3, "setTitleColor:forState:", textColor, 0);
  }
  else
  {
    -[SKUIEditorialLinkView tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUILinkButton setTitleColor:forState:](v3, "setTitleColor:forState:", v6, 0);

  }
  highlightedTextColor = self->_highlightedTextColor;
  if (highlightedTextColor)
  {
    -[SKUILinkButton setTitleColor:forState:](v3, "setTitleColor:forState:", highlightedTextColor, 1);
  }
  else
  {
    -[SKUIEditorialLinkView tintColor](self, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUILinkButton setTitleColor:forState:](v3, "setTitleColor:forState:", v8, 1);

  }
  -[SKUILinkButton titleLabel](v3, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v10);

  return v3;
}

- (SKUIEditorialLinkViewDelegate)delegate
{
  return (SKUIEditorialLinkViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (SKUIEditorialLinkLayout)linkLayout
{
  return self->_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttons, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIEditorialLinkView initWithFrame:]";
}

@end
