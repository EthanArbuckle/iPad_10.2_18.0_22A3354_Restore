@implementation PXActionRowTile

- (PXActionRowTile)initWithFrame:(CGRect)a3
{
  PXActionRowTile *v3;
  PXActionRowTile *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXActionRowTile;
  v3 = -[PXActionRowTile initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXActionRowTile _setupButton](v3, "_setupButton");
  return v4;
}

- (void)setIdiom:(int64_t)a3
{
  if (self->_idiom != a3)
  {
    self->_idiom = a3;
    if (a3 == 3)
      -[PXActionRowTile _setupDecoratedButton](self, "_setupDecoratedButton");
    else
      -[PXActionRowTile _setupButton](self, "_setupButton");
  }
}

- (void)_setupButton
{
  UIButton *button;
  id v4;
  UIButton *v5;
  UIButton *v6;
  uint64_t v7;

  -[PXUIWidgetFooterView removeFromSuperview](self->__footer, "removeFromSuperview");
  button = self->__button;
  if (!button)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3518]);
    -[PXActionRowTile bounds](self, "bounds");
    v5 = (UIButton *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->__button;
    self->__button = v5;

    -[UIButton setAutoresizingMask:](self->__button, "setAutoresizingMask:", 18);
    button = self->__button;
  }
  if (objc_msgSend(MEMORY[0x1E0C99DC8], "px_currentCharacterDirection") == 2)
    v7 = 2;
  else
    v7 = 1;
  -[UIButton setContentHorizontalAlignment:](button, "setContentHorizontalAlignment:", v7);
  -[UIButton addTarget:action:forControlEvents:](self->__button, "addTarget:action:forControlEvents:", self, sel_handleButtonTap_forEvent_, 0x2000);
  -[PXActionRowTile addSubview:](self, "addSubview:", self->__button);
  -[PXActionRowTile _updateButtonTitle](self, "_updateButtonTitle");
}

- (void)_setupDecoratedButton
{
  PXUIWidgetFooterView *footer;
  PXUIWidgetFooterView *v4;
  PXUIWidgetFooterView *v5;
  PXUIWidgetFooterView *v6;
  PXUIWidgetFooterView *v7;
  void *v8;

  -[UIButton removeFromSuperview](self->__button, "removeFromSuperview");
  footer = self->__footer;
  if (!footer)
  {
    v4 = [PXUIWidgetFooterView alloc];
    -[PXActionRowTile bounds](self, "bounds");
    v5 = -[PXUIWidgetFooterView initWithFrame:](v4, "initWithFrame:");
    v6 = self->__footer;
    self->__footer = v5;

    -[PXUIWidgetFooterView setAutoresizingMask:](self->__footer, "setAutoresizingMask:", 18);
    footer = self->__footer;
  }
  -[PXUIWidgetFooterView setLayoutStyle:](footer, "setLayoutStyle:", 1);
  -[PXUIWidgetFooterView setDelegate:](self->__footer, "setDelegate:", self);
  v7 = self->__footer;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 36.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIWidgetFooterView setFont:](v7, "setFont:", v8);

  -[PXActionRowTile addSubview:](self, "addSubview:", self->__footer);
  -[PXActionRowTile _updateButtonTitle](self, "_updateButtonTitle");
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *title;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_title;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      title = self->_title;
      self->_title = v6;

      -[PXActionRowTile _updateButtonTitle](self, "_updateButtonTitle");
    }
  }

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXActionRowTile _button](self, "_button");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (BOOL)isEnabled
{
  void *v2;
  char v3;

  -[PXActionRowTile _button](self, "_button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)setShowsMenu:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[PXActionRowTile _button](self, "_button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsMenuAsPrimaryAction:", v3);

  -[PXActionRowTile _updateButtonAction](self, "_updateButtonAction");
}

- (BOOL)showsMenu
{
  void *v2;
  char v3;

  -[PXActionRowTile _button](self, "_button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsMenuAsPrimaryAction");

  return v3;
}

- (void)_updateButtonTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  if (self->_idiom == 3)
  {
    -[PXActionRowTile title](self, "title");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[PXActionRowTile _footer](self, "_footer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDisclosureTitle:", v23);

  }
  else
  {
    -[PXActionRowTile _button](self, "_button");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionRowTile tintColor](self, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    -[PXActionRowTile title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A85CC970](7, 0x8000, 7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0DC1138];
    v12 = *MEMORY[0x1E0DC1140];
    v29[0] = *MEMORY[0x1E0DC1138];
    v29[1] = v12;
    v30[0] = v10;
    v30[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v9, v13);
    else
      v14 = 0;
    objc_msgSend(v4, "setAttributedTitle:forState:", v14, 0);
    v27[1] = v12;
    v28[0] = v10;
    v27[0] = v11;
    v24 = v8;
    objc_msgSend(v8, "colorWithAlphaComponent:", 0.5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v9, v16);
    else
      v17 = 0;

    objc_msgSend(v4, "setAttributedTitle:forState:", v17, 1);
    v25[1] = v12;
    v26[0] = v10;
    v25[0] = v11;
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v9, v19);
    else
      v20 = 0;

    objc_msgSend(v4, "setAttributedTitle:forState:", v20, 2);
    objc_msgSend(v4, "setContentHorizontalAlignment:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v21);

    objc_msgSend(v4, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCornerRadius:", 8.0);

  }
}

- (void)_updateButtonAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[PXActionRowTile _button](self, "_button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "showsMenuAsPrimaryAction"))
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0DC36F8];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __38__PXActionRowTile__updateButtonAction__block_invoke;
    v12 = &unk_1E5134E50;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v4, "elementWithUncachedProvider:", &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC39D0];
    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1, v9, v10, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "menuWithChildren:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMenu:", v8);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v3, "setMenu:", 0);
  }

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXActionRowTile;
  -[PXActionRowTile tintColorDidChange](&v3, sel_tintColorDidChange);
  -[PXActionRowTile _updateButtonTitle](self, "_updateButtonTitle");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PXActionRowTile _button](self, "_button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[PXActionRowTile _footer](self, "_footer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "font");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v10)
  {
    objc_msgSend(v10, "ascender");
    v13 = v12;
    objc_msgSend(v10, "descender");
    v15 = v13 - v14;
    objc_msgSend(v10, "_scaledValueForValue:", 11.5);
    height = v15 + v16;
  }

  v17 = width;
  v18 = height;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)becomeReusable
{
  -[PXActionRowTile setHidden:](self, "setHidden:", 1);
  -[PXUIWidgetFooterView setHidden:](self->__footer, "setHidden:", 1);
}

- (void)prepareForReuse
{
  -[PXActionRowTile setHidden:](self, "setHidden:", 0);
  -[PXUIWidgetFooterView setHidden:](self->__footer, "setHidden:", 0);
  -[PXActionRowTile setTitle:](self, "setTitle:", 0);
  -[PXActionRowTile setEnabled:](self, "setEnabled:", 1);
}

- (void)handleButtonTap:(id)a3 forEvent:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  objc_msgSend(a4, "touchesForView:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[PXActionRowTile view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[PXActionRowTile delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionRowTileSelected:tapPositionInTile:", self, v8, v10);

}

- (void)widgetFooterView:(id)a3 didSelectDisclosure:(id)a4
{
  id v5;

  -[PXActionRowTile delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionRowTileSelected:tapPositionInTile:", self, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

- (NSString)title
{
  return self->_title;
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (PXActionRowTileDelegate)delegate
{
  return (PXActionRowTileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)_button
{
  return self->__button;
}

- (PXUIWidgetFooterView)_footer
{
  return self->__footer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__footer, 0);
  objc_storeStrong((id *)&self->__button, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
}

void __38__PXActionRowTile__updateButtonAction__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void (**v3)(id, id);
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "menuElementsForActionRowTile:", WeakRetained);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  v3[2](v3, v8);
}

@end
