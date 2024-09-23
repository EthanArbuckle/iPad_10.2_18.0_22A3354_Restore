@implementation VUIBaseCollectionViewCell

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIBaseCollectionViewCell;
  -[VUIBaseCollectionViewCell layoutSubviews](&v6, sel_layoutSubviews);
  -[VUIBaseCollectionViewCell bounds](self, "bounds");
  -[VUIBaseCollectionViewCell vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 0, v3, v4);
  -[VUIBaseCollectionViewCell preview](self, "preview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIBaseCollectionViewCell bounds](self, "bounds");
  objc_msgSend(v5, "setFrame:");

}

- (void)willBeDisplayed
{
  -[VUIBaseCollectionViewCell setBeingDisplayed:](self, "setBeingDisplayed:", 1);
  -[VUIBaseCollectionViewCell vui_cellWillBeDisplayed](self, "vui_cellWillBeDisplayed");
}

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUIBaseCollectionViewCell vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)vui_setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (-[VUIBaseCollectionViewCell shouldAppearSelected](self, "shouldAppearSelected"))
    v3 = -[VUIBaseCollectionViewCell shouldAppearSelected](self, "shouldAppearSelected");
  -[VUIBaseCollectionViewCell highlightedBackgroundColor](self, "highlightedBackgroundColor");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[VUIBaseCollectionViewCell backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[VUIBaseCollectionViewCell vuiContentView](self, "vuiContentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[VUIBaseCollectionViewCell isSelected](self, "isSelected") | v3)
        -[VUIBaseCollectionViewCell highlightedBackgroundColor](self, "highlightedBackgroundColor");
      else
        -[VUIBaseCollectionViewCell backgroundColor](self, "backgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setVuiBackgroundColor:", v9);

    }
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[VUIBaseCollectionViewCell vuiContentView](self, "vuiContentView", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "vui_setHighlighted:", v3);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)vui_prepareForReuse
{
  -[VUIBaseCollectionViewCell setBeingDisplayed:](self, "setBeingDisplayed:", 0);
  -[VUIBaseCollectionViewCell setShouldAppearSelected:](self, "setShouldAppearSelected:", 0);
  if (-[VUIBaseCollectionViewCell vui_highlighted](self, "vui_highlighted"))
    -[VUIBaseCollectionViewCell vui_setHighlighted:](self, "vui_setHighlighted:", 0);
  if (-[VUIBaseCollectionViewCell vui_selected](self, "vui_selected"))
    -[VUIBaseCollectionViewCell vui_setSelected:](self, "vui_setSelected:", 0);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUIBaseCollectionViewCell vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)shouldAppearSelected
{
  return self->_shouldAppearSelected;
}

- (void)setupPreview
{
  UIView *v3;
  UIView *preview;
  id v5;

  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  preview = self->_preview;
  self->_preview = v3;

  -[UIView setAlpha:](self->_preview, "setAlpha:", 0.0);
  -[VUIBaseCollectionViewCell preview](self, "preview");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIBaseCollectionViewCell addSubview:](self, "addSubview:", v5);

}

- (void)setVuiCollectionViewCellInteractor:(id)a3
{
  objc_storeWeak((id *)&self->_vuiCollectionViewCellInteractor, a3);
}

- (void)setShouldAppearSelected:(BOOL)a3
{
  if (self->_shouldAppearSelected != a3)
  {
    self->_shouldAppearSelected = a3;
    -[VUIBaseCollectionViewCell vui_setSelected:](self, "vui_setSelected:");
  }
}

- (void)setHighlightedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, a3);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIBaseCollectionViewCell;
  -[VUIBaseCollectionViewCell setHighlighted:](&v5, sel_setHighlighted_);
  -[VUIBaseCollectionViewCell vui_setHighlighted:](self, "vui_setHighlighted:", v3);
}

- (void)setBeingDisplayed:(BOOL)a3
{
  self->_beingDisplayed = a3;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIView)preview
{
  return self->_preview;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIBaseCollectionViewCell;
  -[VUIBaseCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[VUIBaseCollectionViewCell vui_prepareForReuse](self, "vui_prepareForReuse");
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "forcedSize"))
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VUIBaseCollectionViewCell;
    -[VUIBaseCollectionViewCell preferredLayoutAttributesFittingAttributes:](&v8, sel_preferredLayoutAttributesFittingAttributes_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (VUIBaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  VUIBaseCollectionViewCell *v3;
  VUIBaseCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIBaseCollectionViewCell;
  v3 = -[VUIBaseCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[VUIBaseCollectionViewCell setupPreview](v3, "setupPreview");
  return v4;
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)vui_addSubview:(id)a3 oldView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[VUIBaseCollectionViewCell vuiContentView](self, "vuiContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "vui_addSubview:oldView:", v7, v6);

  return v9;
}

- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a4;
  v6 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[VUIBaseCollectionViewCell highlightedBackgroundColor](self, "highlightedBackgroundColor");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[VUIBaseCollectionViewCell backgroundColor](self, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[VUIBaseCollectionViewCell vuiContentView](self, "vuiContentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        -[VUIBaseCollectionViewCell highlightedBackgroundColor](self, "highlightedBackgroundColor");
      else
        -[VUIBaseCollectionViewCell backgroundColor](self, "backgroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setVuiBackgroundColor:", v13);

    }
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[VUIBaseCollectionViewCell vuiContentView](self, "vuiContentView", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subviews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "vui_setSelected:animated:withAnimationCoordinator:", v6, v5, v8);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v17);
  }

}

- (void)vui_setSelected:(BOOL)a3
{
  -[VUIBaseCollectionViewCell vui_setSelected:animated:withAnimationCoordinator:](self, "vui_setSelected:animated:withAnimationCoordinator:", a3, 0, 0);
}

- (void)didEndDisplaying
{
  -[VUIBaseCollectionViewCell setBeingDisplayed:](self, "setBeingDisplayed:", 0);
  -[VUIBaseCollectionViewCell vui_cellDidEndDisplaying](self, "vui_cellDidEndDisplaying");
}

- (BOOL)isBeingDisplayed
{
  return self->_beingDisplayed;
}

- (void)setPreview:(id)a3
{
  objc_storeStrong((id *)&self->_preview, a3);
}

- (VUICollectionViewCellInteractor)vuiCollectionViewCellInteractor
{
  return (VUICollectionViewCellInteractor *)objc_loadWeakRetained((id *)&self->_vuiCollectionViewCellInteractor);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_vuiCollectionViewCellInteractor);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
