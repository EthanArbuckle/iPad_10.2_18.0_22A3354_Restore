@implementation TLKRichTextField

- (TLKRichTextField)init
{
  TLKRichTextField *v2;
  TLKRichTextField *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TLKRichTextField;
  v2 = -[TLKRichTextField init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TLKStackView setAxis:](v2, "setAxis:", 0);
    -[TLKStackView setAlignment:](v3, "setAlignment:", 5);
    v4 = (void *)objc_opt_new();
    -[TLKRichTextField setTextLabel:](v3, "setTextLabel:", v4);

    -[TLKRichTextField textLabel](v3, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSupportsColorGlyphs:", 1);

    +[TLKFontUtilities shortFootnoteFont](TLKFontUtilities, "shortFootnoteFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKRichTextField setFont:](v3, "setFont:", v6);

    -[TLKRichTextField textLabel](v3, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKStackView addArrangedSubview:](v3, "addArrangedSubview:", v7);

    -[TLKRichTextField setDelegate:](v3, "setDelegate:", v3);
    -[TLKRichTextField setObserver:](v3, "setObserver:", v3);
  }
  return v3;
}

- (void)setRichText:(id)a3
{
  id v5;
  TLKRichText **p_richText;
  TLKRichText *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  TLKRichText *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_richText = &self->_richText;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_richText, "setObserver:", 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v5;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v7 = *p_richText;
      v8 = -[TLKRichText countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v30;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v30 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v12, "setObserver:", 0);
            ++v11;
          }
          while (v9 != v11);
          v9 = -[TLKRichText countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v9);
      }

      v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_richText, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_richText, "setObserver:", self);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v13 = *p_richText;
      v14 = -[TLKRichText countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v18, "setObserver:", self);
            ++v17;
          }
          while (v15 != v17);
          v15 = -[TLKRichText countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v15);
      }

    }
  }
  -[TLKRichTextField observer](self, "observer");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[TLKRichTextField observer](self, "observer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "batchUpdateCount");

    if (!v22)
    {
      -[TLKRichTextField observer](self, "observer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "propertiesDidChange");

    }
  }

}

- (void)propertiesDidChange
{
  id v3;

  -[TLKRichTextField richText](self, "richText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TLKRichTextField updateWithRichText:](self, "updateWithRichText:", v3);

}

- (void)updateWithRichText:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__TLKRichTextField_updateWithRichText___block_invoke;
  v6[3] = &unk_1E5C06D50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TLKRichTextField performBatchUpdates:](self, "performBatchUpdates:", v6);

}

void __39__TLKRichTextField_updateWithRichText___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRichText:", v2);

  v4 = objc_msgSend(*(id *)(a1 + 40), "hasContent") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "stars");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateStarRating:", v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "icons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateIcons:", v9);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "inlineRoundedText");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateRoundedCornerLabels:", v11);

}

- (UIFont)font
{
  void *v2;
  void *v3;

  -[TLKRichTextField textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TLKRichTextField textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[TLKRichTextField starRatingView](self, "starRatingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v4);

  -[TLKRichTextField iconView](self, "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSymbolFont:", v4);

  -[TLKRichTextField updateIconSizing](self, "updateIconSizing");
}

- (void)setScaleIconsToFont:(BOOL)a3
{
  if (self->_scaleIconsToFont != a3)
  {
    self->_scaleIconsToFont = a3;
    -[TLKRichTextField updateIconSizing](self, "updateIconSizing");
  }
}

- (void)updateIconSizing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  id v21;

  if (!-[TLKRichTextField scaleIconsToFont](self, "scaleIconsToFont"))
    goto LABEL_7;
  -[TLKRichTextField richText](self, "richText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;
  v10 = v9;
  v11 = *MEMORY[0x1E0C9D820];
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);

  if (v8 == v11 && v10 == v12)
  {
LABEL_7:
    -[TLKRichTextField iconView](self, "iconView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMinimumLayoutSize:", 0.0, 0.0);

    -[TLKRichTextField iconView](self, "iconView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v18;
    v19 = 1.79769313e308;
  }
  else
  {
    -[TLKRichTextField font](self, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "capHeight");
    v16 = v15;

    -[TLKRichTextField iconView](self, "iconView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMinimumLayoutSize:", 0.0, v16);

    -[TLKRichTextField iconView](self, "iconView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v18;
    v19 = v16;
  }
  objc_msgSend(v18, "setMaximumLayoutSize:", 1.79769313e308, v19);

}

- (void)setRoundedCornerLabelSizeConfiguration:(unint64_t)a3
{
  id v4;

  self->_roundedCornerLabelSizeConfiguration = a3;
  -[TLKRichTextField roundedCornerLabels](self, "roundedCornerLabels");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSizeConfiguration:", a3);

}

- (unint64_t)prominence
{
  void *v2;
  unint64_t v3;

  -[TLKRichTextField textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prominence");

  return v3;
}

- (void)setProminence:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[TLKRichTextField textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProminence:", a3);

  -[TLKRichTextField iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProminence:", a3);

  -[TLKRichTextField roundedCornerLabels](self, "roundedCornerLabels");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProminence:", a3);

}

- (void)setUseCompactMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_useCompactMode = a3;
  -[TLKRichTextField starRatingView](self, "starRatingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseCompactMode:", v3);

}

- (void)updateStarRating:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  -[TLKRichTextField starRatingView](self, "starRatingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {

    if (!v4)
    {
      v5 = (void *)objc_opt_new();
      -[TLKRichTextField setStarRatingView:](self, "setStarRatingView:", v5);

      -[TLKRichTextField font](self, "font");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKRichTextField starRatingView](self, "starRatingView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFont:", v6);

      v8 = -[TLKRichTextField useCompactMode](self, "useCompactMode");
      -[TLKRichTextField starRatingView](self, "starRatingView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUseCompactMode:", v8);

      -[TLKRichTextField starRatingView](self, "starRatingView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKRichTextField insertArrangedSubview:atIndex:](self, "insertArrangedSubview:atIndex:", v10, 0);

      -[TLKRichTextField starRatingView](self, "starRatingView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKRichTextField setMinimumSpacing:adjacentToView:](self, "setMinimumSpacing:adjacentToView:", v11, 0.0, 0.0, 0.0, 5.5);

    }
    objc_msgSend(v18, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "starRating");
    v14 = v13;
    -[TLKRichTextField starRatingView](self, "starRatingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setStarRating:", v14);

    -[TLKRichTextField starRatingView](self, "starRatingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v16;
    v17 = 0;
  }
  else
  {
    v16 = v4;
    v17 = 1;
  }
  objc_msgSend(v16, "setHidden:", v17);

}

- (void)updateIcons:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  -[TLKRichTextField iconView](self, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

    if (!v4)
    {
      v5 = (void *)objc_opt_new();
      -[TLKRichTextField setIconView:](self, "setIconView:", v5);

      v6 = -[TLKRichTextField prominence](self, "prominence");
      -[TLKRichTextField iconView](self, "iconView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setProminence:", v6);

      -[TLKRichTextField font](self, "font");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKRichTextField iconView](self, "iconView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSymbolFont:", v8);

      -[TLKRichTextField iconView](self, "iconView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v10);

      -[TLKRichTextField updateIconSizing](self, "updateIconSizing");
      -[TLKRichTextField iconView](self, "iconView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKRichTextField arrangedSubviews](self, "arrangedSubviews");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKRichTextField insertArrangedSubview:atIndex:](self, "insertArrangedSubview:atIndex:", v11, objc_msgSend(v12, "count") - 1);

      -[TLKRichTextField iconView](self, "iconView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKRichTextField setMinimumSpacing:adjacentToView:](self, "setMinimumSpacing:adjacentToView:", v13, 0.0, 0.0, 0.0, 4.0);

    }
    -[TLKRichTextField iconView](self, "iconView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateIcons:", v17);

    -[TLKRichTextField iconView](self, "iconView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v15;
    v16 = 0;
  }
  else
  {
    v15 = v4;
    v16 = 1;
  }
  objc_msgSend(v15, "setHidden:", v16);

}

- (void)updateRoundedCornerLabels:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  -[TLKRichTextField roundedCornerLabels](self, "roundedCornerLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

    if (!v4)
    {
      v5 = (void *)objc_opt_new();
      -[TLKRichTextField setRoundedCornerLabels:](self, "setRoundedCornerLabels:", v5);

      v6 = -[TLKRichTextField prominence](self, "prominence");
      -[TLKRichTextField roundedCornerLabels](self, "roundedCornerLabels");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setProminence:", v6);

      v8 = -[TLKRichTextField roundedCornerLabelSizeConfiguration](self, "roundedCornerLabelSizeConfiguration");
      -[TLKRichTextField roundedCornerLabels](self, "roundedCornerLabels");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSizeConfiguration:", v8);

      -[TLKRichTextField roundedCornerLabels](self, "roundedCornerLabels");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v10);

      -[TLKRichTextField roundedCornerLabels](self, "roundedCornerLabels");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKRichTextField starRatingView](self, "starRatingView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKRichTextField insertArrangedSubview:atIndex:](self, "insertArrangedSubview:atIndex:", v11, v12 != 0);

      -[TLKRichTextField roundedCornerLabels](self, "roundedCornerLabels");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKRichTextField setMinimumSpacing:adjacentToView:](self, "setMinimumSpacing:adjacentToView:", v13, 0.0, 0.0, 0.0, 10.0);

    }
    -[TLKRichTextField roundedCornerLabels](self, "roundedCornerLabels");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateRoundedText:", v17);

    -[TLKRichTextField roundedCornerLabels](self, "roundedCornerLabels");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v15;
    v16 = 0;
  }
  else
  {
    v15 = v4;
    v16 = 1;
  }
  objc_msgSend(v15, "setHidden:", v16);

}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  -[TLKRichTextField starRatingView](self, "starRatingView");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    v19 = (double)(TLKSnippetModernizationEnabled() ^ 1);
    goto LABEL_7;
  }
  -[TLKRichTextField roundedCornerLabels](self, "roundedCornerLabels");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v10)
  {
    x = x + 1.0;
    goto LABEL_9;
  }
  -[TLKRichTextField iconView](self, "iconView");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v10)
  {
    -[TLKRichTextField iconView](self, "iconView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageViews");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "intrinsicContentSize");
    v18 = v17;

    if (v18 < 20.0)
    {
      +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, 0.5);
LABEL_7:
      y = y - v19;
    }
  }
LABEL_9:

  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)attributedString
{
  void *v2;
  void *v3;

  -[TLKRichTextField textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9.receiver = self;
  v9.super_class = (Class)TLKRichTextField;
  -[TLKRichTextField description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TLKRichTextField textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "appendString:", v7);

  return (NSString *)v5;
}

- (TLKObserver)observer
{
  return (TLKObserver *)objc_loadWeakRetained((id *)&self->observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->observer, a3);
}

- (int64_t)batchUpdateCount
{
  return self->batchUpdateCount;
}

- (void)setBatchUpdateCount:(int64_t)a3
{
  self->batchUpdateCount = a3;
}

- (TLKRichText)richText
{
  return self->_richText;
}

- (unint64_t)roundedCornerLabelSizeConfiguration
{
  return self->_roundedCornerLabelSizeConfiguration;
}

- (BOOL)useCompactMode
{
  return self->_useCompactMode;
}

- (BOOL)scaleIconsToFont
{
  return self->_scaleIconsToFont;
}

- (TLKLabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (TLKRoundedCornerLabels)roundedCornerLabels
{
  return self->_roundedCornerLabels;
}

- (void)setRoundedCornerLabels:(id)a3
{
  objc_storeStrong((id *)&self->_roundedCornerLabels, a3);
}

- (TLKStarsView)starRatingView
{
  return self->_starRatingView;
}

- (void)setStarRatingView:(id)a3
{
  objc_storeStrong((id *)&self->_starRatingView, a3);
}

- (TLKIconsView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_starRatingView, 0);
  objc_storeStrong((id *)&self->_roundedCornerLabels, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_richText, 0);
  objc_destroyWeak((id *)&self->observer);
}

@end
