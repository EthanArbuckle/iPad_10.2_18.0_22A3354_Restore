@implementation UIKeyboardEmojiFamilyConfigurationView

+ (id)_selectionAndSeparatorColorForDarkMode:(BOOL)a3
{
  if (a3)
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.18);
  else
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.934, 0.934, 0.938, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIKeyboardEmojiFamilyConfigurationView)initWithFrame:(CGRect)a3
{
  UIKeyboardEmojiFamilyConfigurationView *v3;
  void *v4;
  void *v5;
  UIView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  void *v12;
  void *v13;
  void *v14;
  UIKeyboardEmojiWellView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIKeyboardEmojiWellView *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UIStackView *v26;
  void *v27;
  void *v28;
  void *v29;
  UIStackView *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)UIKeyboardEmojiFamilyConfigurationView;
  v3 = -[UIView initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiFamilyConfigurationView setFamilyMemberStackViews:](v3, "setFamilyMemberStackViews:", v5);

    v6 = [UIView alloc];
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = -[UIView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    -[UIKeyboardEmojiFamilyConfigurationView setSeparatorView:](v3, "setSeparatorView:", v11);

    objc_msgSend((id)objc_opt_class(), "_selectionAndSeparatorColorForDarkMode:", -[UIKeyboardEmojiFamilyConfigurationView usesDarkStyle](v3, "usesDarkStyle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiFamilyConfigurationView separatorView](v3, "separatorView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

    -[UIKeyboardEmojiFamilyConfigurationView separatorView](v3, "separatorView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v3, "addSubview:", v14);

    v15 = -[UIKeyboardEmojiWellView initWithFrame:]([UIKeyboardEmojiWellView alloc], "initWithFrame:", v7, v8, v9, v10);
    -[UIKeyboardEmojiFamilyConfigurationView setNeutralWellView:](v3, "setNeutralWellView:", v15);

    objc_msgSend(off_1E167A828, "systemFontOfSize:", 48.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiFamilyConfigurationView neutralWellView](v3, "neutralWellView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLabelFont:", v16);

    -[UIView interactionTintColor](v3, "interactionTintColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiFamilyConfigurationView neutralWellView](v3, "neutralWellView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSelectionBackgroundColor:", v18);

    v20 = -[UIKeyboardEmojiWellView initWithFrame:]([UIKeyboardEmojiWellView alloc], "initWithFrame:", v7, v8, v9, v10);
    -[UIKeyboardEmojiFamilyConfigurationView setConfiguredWellView:](v3, "setConfiguredWellView:", v20);

    objc_msgSend(off_1E167A828, "systemFontOfSize:", 48.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiFamilyConfigurationView configuredWellView](v3, "configuredWellView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLabelFont:", v21);

    -[UIKeyboardEmojiFamilyConfigurationView configuredWellView](v3, "configuredWellView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCompositeImageSize:", 48.0, 48.0);

    -[UIView interactionTintColor](v3, "interactionTintColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiFamilyConfigurationView configuredWellView](v3, "configuredWellView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSelectionBackgroundColor:", v24);

    v26 = [UIStackView alloc];
    -[UIKeyboardEmojiFamilyConfigurationView neutralWellView](v3, "neutralWellView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v27;
    -[UIKeyboardEmojiFamilyConfigurationView configuredWellView](v3, "configuredWellView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[UIStackView initWithArrangedSubviews:](v26, "initWithArrangedSubviews:", v29);
    -[UIKeyboardEmojiFamilyConfigurationView setPreviewWellStackView:](v3, "setPreviewWellStackView:", v30);

    -[UIKeyboardEmojiFamilyConfigurationView previewWellStackView](v3, "previewWellStackView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAxis:", 0);

    -[UIKeyboardEmojiFamilyConfigurationView previewWellStackView](v3, "previewWellStackView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDistribution:", 1);

    -[UIKeyboardEmojiFamilyConfigurationView previewWellStackView](v3, "previewWellStackView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", 70.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[UIKeyboardEmojiFamilyConfigurationView previewWellStackView](v3, "previewWellStackView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v3, "addSubview:", v36);

    getEMFStringUtilitiesClass_1();
    -[UIKeyboardEmojiFamilyConfigurationView setHasSplitFontSupport:](v3, "setHasSplitFontSupport:", objc_opt_respondsToSelector() & 1);
  }
  return v3;
}

- (void)_colorConfigurationDidChange
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_selectionAndSeparatorColorForDarkMode:", -[UIKeyboardEmojiFamilyConfigurationView usesDarkStyle](self, "usesDarkStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiFamilyConfigurationView separatorView](self, "separatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[UIKeyboardEmojiFamilyConfigurationView familyMemberStackViews](self, "familyMemberStackViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v10, "arrangedSubviews", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v17;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v17 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "setSelectionBackgroundColor:", v3);
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

}

- (void)_configureSkinToneVariantSpecifiersForBaseString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableArray *v21;
  unint64_t v22;
  NSMutableArray *selectedVariantIndices;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getEMFSkinToneSpecifierTypeFitzpatrickSilhouette_0();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v3;
  objc_msgSend(getEMFStringUtilitiesClass_1(), "_skinToneChooserVariantsForString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v7 = 0;
    v25 = v5;
    v26 = v4;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (!v10)
        goto LABEL_20;
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(getEMFStringUtilitiesClass_1(), "_skinToneSpecifiersForString:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[UIKeyboardEmojiFamilyConfigurationView hasSplitFontSupport](self, "hasSplitFontSupport"))
          {
            objc_msgSend(v14, "firstObject");
            v15 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
          if (v7 == 1)
          {
            v15 = v27;
LABEL_14:
            v16 = v15;
            objc_msgSend(v14, "firstObject");
            v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
            v18 = v17;
            goto LABEL_16;
          }
          if (!v7)
          {
            objc_msgSend(v14, "firstObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v27;
            goto LABEL_15;
          }
          v16 = 0;
          v18 = 0;
LABEL_16:
          v33[0] = v16;
          v33[1] = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v19);

          ++v13;
        }
        while (v11 != v13);
        v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        v11 = v20;
      }
      while (v20);
LABEL_20:

      v4 = v26;
      objc_msgSend(v26, "addObject:", v8);

      v5 = v25;
      v6 = ++v7;
    }
    while (objc_msgSend(v25, "count") > (unint64_t)v7);
  }
  -[UIKeyboardEmojiFamilyConfigurationView setBaseEmojiString:](self, "setBaseEmojiString:", v24);
  -[UIKeyboardEmojiFamilyConfigurationView setSkinToneVariantRows:](self, "setSkinToneVariantRows:", v4);
  if (-[UIKeyboardEmojiFamilyConfigurationView hasSplitFontSupport](self, "hasSplitFontSupport"))
    -[UIKeyboardEmojiFamilyConfigurationView setVariantDisplayRows:](self, "setVariantDisplayRows:", objc_msgSend(getEMFStringUtilitiesClass_1(), "performSelector:withObject:", sel__coupleSkinToneChooserVariantsForString_, v24));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v22 = 0;
    do
    {
      -[NSMutableArray addObject:](v21, "addObject:", &unk_1E1A9AF68);
      ++v22;
    }
    while (v22 < objc_msgSend(v4, "count"));
  }
  selectedVariantIndices = self->_selectedVariantIndices;
  self->_selectedVariantIndices = v21;

  -[UIKeyboardEmojiFamilyConfigurationView _configureFamilyMemberWellStackViews](self, "_configureFamilyMemberWellStackViews");
}

- (void)_configureFamilyMemberWellStackViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  UIStackView *v9;
  UIStackView *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  -[UIKeyboardEmojiFamilyConfigurationView baseEmojiString](self, "baseEmojiString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[UIKeyboardEmojiFamilyConfigurationView hasSplitFontSupport](self, "hasSplitFontSupport"))
    {
      -[UIKeyboardEmojiFamilyConfigurationView variantDisplayRows](self, "variantDisplayRows");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (v5)
      {
        v6 = 0;
        do
        {
          -[UIKeyboardEmojiFamilyConfigurationView variantDisplayRows](self, "variantDisplayRows");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectAtIndex:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = 0;
          v25 = &v24;
          v26 = 0x3032000000;
          v27 = __Block_byref_object_copy__239;
          v28 = __Block_byref_object_dispose__239;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v29 = (id)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __78__UIKeyboardEmojiFamilyConfigurationView__configureFamilyMemberWellStackViews__block_invoke;
          v23[3] = &unk_1E16BD498;
          v23[5] = &v24;
          v23[6] = v6;
          v23[4] = self;
          objc_msgSend(v8, "enumerateObjectsUsingBlock:", v23);
          v9 = [UIStackView alloc];
          v10 = -[UIStackView initWithArrangedSubviews:](v9, "initWithArrangedSubviews:", v25[5]);
          -[UIView heightAnchor](v10, "heightAnchor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "constraintEqualToConstant:", 50.0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setActive:", 1);

          LODWORD(v13) = 1148829696;
          -[UIView setContentCompressionResistancePriority:forAxis:](v10, "setContentCompressionResistancePriority:forAxis:", 1, v13);
          -[UIStackView setAxis:](v10, "setAxis:", 0);
          -[UIStackView setDistribution:](v10, "setDistribution:", 1);
          -[UIKeyboardEmojiFamilyConfigurationView familyMemberStackViews](self, "familyMemberStackViews");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v10);

          -[UIView addSubview:](self, "addSubview:", v10);
          _Block_object_dispose(&v24, 8);

          ++v6;
          -[UIKeyboardEmojiFamilyConfigurationView variantDisplayRows](self, "variantDisplayRows");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

        }
        while (v6 < v16);
      }
    }
    else
    {
      -[UIKeyboardEmojiFamilyConfigurationView skinToneVariantRows](self, "skinToneVariantRows");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __78__UIKeyboardEmojiFamilyConfigurationView__configureFamilyMemberWellStackViews__block_invoke_2;
      v22[3] = &unk_1E16EC300;
      v22[4] = self;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", v22);

    }
    -[UIKeyboardEmojiFamilyConfigurationView baseEmojiString](self, "baseEmojiString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiFamilyConfigurationView neutralWellView](self, "neutralWellView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setStringRepresentation:", v18);

    -[UIKeyboardEmojiFamilyConfigurationView baseEmojiString](self, "baseEmojiString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = +[UIKeyboardEmoji shouldHighlightEmoji:](UIKeyboardEmoji, "shouldHighlightEmoji:", v20);

    if ((_DWORD)v18)
    {
      -[UIKeyboardEmojiFamilyConfigurationView neutralWellView](self, "neutralWellView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setUnreleasedHighlight:", 1);

    }
    -[UIKeyboardEmojiFamilyConfigurationView _updatePreviewWellForCurrentSelection](self, "_updatePreviewWellForCurrentSelection");
  }
}

void __78__UIKeyboardEmojiFamilyConfigurationView__configureFamilyMemberWellStackViews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  UIKeyboardEmojiWellView *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  UIKeyboardEmojiWellView *v10;

  v5 = a2;
  v6 = [UIKeyboardEmojiWellView alloc];
  v10 = -[UIKeyboardEmojiWellView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend((id)objc_opt_class(), "_selectionAndSeparatorColorForDarkMode:", objc_msgSend(*(id *)(a1 + 32), "usesDarkStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiWellView setSelectionBackgroundColor:](v10, "setSelectionBackgroundColor:", v7);

  if (*(_QWORD *)(a1 + 48))
    v8 = 1;
  else
    v8 = 2;
  -[UIKeyboardEmojiWellView setStringRepresentation:silhouette:](v10, "setStringRepresentation:silhouette:", v5, v8);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v10);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiWellView setAssociatedIndexPath:](v10, "setAssociatedIndexPath:", v9);

}

void __78__UIKeyboardEmojiFamilyConfigurationView__configureFamilyMemberWellStackViews__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  UIStackView *v6;
  UIStackView *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__239;
  v17 = __Block_byref_object_dispose__239;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__UIKeyboardEmojiFamilyConfigurationView__configureFamilyMemberWellStackViews__block_invoke_3;
  v12[3] = &unk_1E16EC2D8;
  v12[4] = *(_QWORD *)(a1 + 32);
  v12[5] = &v13;
  v12[6] = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);
  v6 = [UIStackView alloc];
  v7 = -[UIStackView initWithArrangedSubviews:](v6, "initWithArrangedSubviews:", v14[5]);
  -[UIView heightAnchor](v7, "heightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToConstant:", 50.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  LODWORD(v10) = 1148846080;
  -[UIView setContentCompressionResistancePriority:forAxis:](v7, "setContentCompressionResistancePriority:forAxis:", 1, v10);
  -[UIStackView setAxis:](v7, "setAxis:", 0);
  -[UIStackView setDistribution:](v7, "setDistribution:", 1);
  objc_msgSend(*(id *)(a1 + 32), "familyMemberStackViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v7);
  _Block_object_dispose(&v13, 8);

}

void __78__UIKeyboardEmojiFamilyConfigurationView__configureFamilyMemberWellStackViews__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  UIKeyboardEmojiWellView *v10;
  UIKeyboardEmojiWellView *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "baseEmojiString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  UIKBImageSetForCoupleCharacter(v7, v8, v9);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v10 = [UIKeyboardEmojiWellView alloc];
  v11 = -[UIKeyboardEmojiWellView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend((id)objc_opt_class(), "_selectionAndSeparatorColorForDarkMode:", objc_msgSend(*(id *)(a1 + 32), "usesDarkStyle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiWellView setSelectionBackgroundColor:](v11, "setSelectionBackgroundColor:", v12);

  objc_msgSend(v15, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiWellView setCompositeImageRepresentation:](v11, "setCompositeImageRepresentation:", v13);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v11);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, *(_QWORD *)(a1 + 48));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiWellView setAssociatedIndexPath:](v11, "setAssociatedIndexPath:", v14);

}

- (id)_wellViewForSection:(int64_t)a3 item:(int64_t)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[UIKeyboardEmojiFamilyConfigurationView familyMemberStackViews](self, "familyMemberStackViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 < a3)
    goto LABEL_3;
  -[UIKeyboardEmojiFamilyConfigurationView familyMemberStackViews](self, "familyMemberStackViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrangedSubviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 >= a4)
  {
    -[UIKeyboardEmojiFamilyConfigurationView familyMemberStackViews](self, "familyMemberStackViews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrangedSubviews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_3:
    v13 = 0;
  }
  return v13;
}

- (unint64_t)_silhouetteFromCurrentSelections
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  -[UIKeyboardEmojiFamilyConfigurationView selectedVariantIndices](self, "selectedVariantIndices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  -[UIKeyboardEmojiFamilyConfigurationView selectedVariantIndices](self, "selectedVariantIndices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = 2;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = 3;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return v9;
  else
    return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_currentlySelectedSkinToneConfiguration
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  getEMFSkinToneSpecifierTypeFitzpatrickSilhouette_0();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__239;
  v12 = __Block_byref_object_dispose__239;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiFamilyConfigurationView selectedVariantIndices](self, "selectedVariantIndices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__UIKeyboardEmojiFamilyConfigurationView__currentlySelectedSkinToneConfiguration__block_invoke;
  v7[3] = &unk_1E16EC328;
  v7[5] = v3;
  v7[6] = &v8;
  v7[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __81__UIKeyboardEmojiFamilyConfigurationView__currentlySelectedSkinToneConfiguration__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = objc_msgSend(a2, "integerValue");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "skinToneVariantRows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v10);
  }
}

- (void)_setCurrentlySelectedSkinToneConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[UIKeyboardEmojiFamilyConfigurationView selectedVariantIndices](self, "selectedVariantIndices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__UIKeyboardEmojiFamilyConfigurationView__setCurrentlySelectedSkinToneConfiguration___block_invoke;
  v8[3] = &unk_1E16BD3E8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  -[UIKeyboardEmojiFamilyConfigurationView setSelectedVariantIndices:](self, "setSelectedVariantIndices:", v7);
}

void __85__UIKeyboardEmojiFamilyConfigurationView__setCurrentlySelectedSkinToneConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "skinToneVariantRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__UIKeyboardEmojiFamilyConfigurationView__setCurrentlySelectedSkinToneConfiguration___block_invoke_2;
  v9[3] = &unk_1E16EC350;
  v12 = a3;
  v10 = v5;
  v11 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

void __85__UIKeyboardEmojiFamilyConfigurationView__setCurrentlySelectedSkinToneConfiguration___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  void *v9;

  objc_msgSend(a2, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v9, *(_QWORD *)(a1 + 48));

    *a4 = 1;
  }
}

- (void)setSelectedVariantIndices:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  void (**v9)(void *, NSMutableArray *, _QWORD);
  NSMutableArray *v10;
  NSMutableArray *selectedVariantIndices;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, char);
  void *v23;
  UIKeyboardEmojiFamilyConfigurationView *v24;
  NSMutableArray *v25;

  v4 = a3;
  v5 = self->_selectedVariantIndices;
  v6 = objc_msgSend(v4, "count");
  v7 = -[NSMutableArray count](v5, "count");
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __68__UIKeyboardEmojiFamilyConfigurationView_setSelectedVariantIndices___block_invoke;
  v23 = &unk_1E16EC3A0;
  v24 = self;
  v8 = (NSMutableArray *)v4;
  v25 = v8;
  v9 = (void (**)(void *, NSMutableArray *, _QWORD))_Block_copy(&v20);
  v9[2](v9, v5, 0);
  if (v6 == v7)
  {
    v9[2](v9, v8, 1);
    v10 = v8;
    selectedVariantIndices = self->_selectedVariantIndices;
    self->_selectedVariantIndices = v10;
  }
  else
  {
    v12 = -[NSMutableArray count](v8, "count", v20, v21, v22, v23, v24);
    if ((unint64_t)(v12 - -[NSMutableArray count](v5, "count")) >= 2)
    {
      do
      {
        -[NSMutableArray removeLastObject](v8, "removeLastObject");
        v13 = -[NSMutableArray count](v8, "count");
      }
      while ((unint64_t)(v13 - -[NSMutableArray count](v5, "count")) > 1);
    }
    -[UIKeyboardEmojiFamilyConfigurationView _updateBottomRowForSelections:](self, "_updateBottomRowForSelections:", v8);
    -[NSMutableArray subarrayWithRange:](v8, "subarrayWithRange:", 0, -[NSMutableArray count](v8, "count") - 1);
    selectedVariantIndices = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, selectedVariantIndices, 1);
    v14 = (NSMutableArray *)-[NSMutableArray mutableCopy](selectedVariantIndices, "mutableCopy");
    v15 = self->_selectedVariantIndices;
    self->_selectedVariantIndices = v14;

  }
  -[UIKeyboardEmojiFamilyConfigurationView _updatePreviewWellForCurrentSelection](self, "_updatePreviewWellForCurrentSelection");
  -[UIKeyboardEmojiFamilyConfigurationView representedKey](self, "representedKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "selectedVariantIndices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    -[UIKeyboardEmojiFamilyConfigurationView representedKey](self, "representedKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSelectedVariantIndices:", v8);

  }
}

void __68__UIKeyboardEmojiFamilyConfigurationView_setSelectedVariantIndices___block_invoke(uint64_t a1, void *a2, char a3)
{
  void *v5;
  _QWORD v6[5];
  id v7;
  char v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__UIKeyboardEmojiFamilyConfigurationView_setSelectedVariantIndices___block_invoke_2;
  v6[3] = &unk_1E16EC378;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  v8 = a3;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v6);

}

void __68__UIKeyboardEmojiFamilyConfigurationView_setSelectedVariantIndices___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = objc_msgSend(a2, "integerValue");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "skinToneVariantRows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") - 1;

    if (v6 > v9)
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", a3, v11);

      v6 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_wellViewForSection:item:", a3, v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSelected:", *(unsigned __int8 *)(a1 + 48));

  }
}

- (void)_updateBottomRowForSelections:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_msgSend(v31, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  -[UIKeyboardEmojiFamilyConfigurationView lastSelectedIndexPath](self, "lastSelectedIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "section");
  v8 = objc_msgSend(v31, "count") - 1;

  if (v7 != v8)
  {
    -[UIKeyboardEmojiFamilyConfigurationView neutralWellView](self, "neutralWellView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v5 >= 0)
      v19 = v5 & 1;
    else
      v19 = -(v5 & 1);
    objc_msgSend(v17, "setActiveSelection:", v5 == 0);

    -[UIKeyboardEmojiFamilyConfigurationView configuredWellView](self, "configuredWellView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActiveSelection:", v5 == 1);

    v21 = (void *)MEMORY[0x1E0CB36B0];
    v22 = objc_msgSend(v31, "count") - 1;
    v23 = v21;
    v24 = v19;
LABEL_17:
    objc_msgSend(v23, "indexPathForRow:inSection:", v24, v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardEmojiFamilyConfigurationView setLastSelectedIndexPath:](self, "setLastSelectedIndexPath:", v11);
    goto LABEL_18;
  }
  -[UIKeyboardEmojiFamilyConfigurationView lastSelectedIndexPath](self, "lastSelectedIndexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "item");

  if (v5 != v10)
  {
    v25 = v5 & 1;
    if (v5 < 0)
      v25 = -v25;
    if (v25 == 1)
      v26 = 1;
    else
      v26 = v5;
    if (v25)
      v27 = v26;
    else
      v27 = 0;
    -[UIKeyboardEmojiFamilyConfigurationView neutralWellView](self, "neutralWellView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActiveSelection:", v27 == 0);

    -[UIKeyboardEmojiFamilyConfigurationView configuredWellView](self, "configuredWellView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActiveSelection:", v27 == 1);

    v30 = (void *)MEMORY[0x1E0CB36B0];
    v22 = objc_msgSend(v31, "count") - 1;
    v23 = v30;
    v24 = v27;
    goto LABEL_17;
  }
  objc_msgSend(v31, "subarrayWithRange:", 0, objc_msgSend(v31, "count") - 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB36B0];
  objc_msgSend(v11, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "indexPathForRow:inSection:", objc_msgSend(v13, "integerValue"), objc_msgSend(v11, "count") - 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiFamilyConfigurationView setLastSelectedIndexPath:](self, "setLastSelectedIndexPath:", v14);

  -[UIKeyboardEmojiFamilyConfigurationView neutralWellView](self, "neutralWellView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActiveSelection:", 0);

  -[UIKeyboardEmojiFamilyConfigurationView configuredWellView](self, "configuredWellView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActiveSelection:", 0);

LABEL_18:
}

- (void)_updatePreviewWellForCurrentSelection
{
  unint64_t v3;
  id EMFStringUtilitiesClass_1;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[UIKeyboardEmojiFamilyConfigurationView _currentlySelectedSkinToneConfiguration](self, "_currentlySelectedSkinToneConfiguration");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[UIKeyboardEmojiFamilyConfigurationView hasSplitFontSupport](self, "hasSplitFontSupport"))
  {
    -[UIKeyboardEmojiFamilyConfigurationView baseEmojiString](self, "baseEmojiString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UIKBImageSetForCoupleCharacter(v9, v10, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardEmojiFamilyConfigurationView configuredWellView](self, "configuredWellView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompositeImageRepresentation:", v12);

    goto LABEL_6;
  }
  v3 = -[UIKeyboardEmojiFamilyConfigurationView _silhouetteFromCurrentSelections](self, "_silhouetteFromCurrentSelections");
  EMFStringUtilitiesClass_1 = getEMFStringUtilitiesClass_1();
  -[UIKeyboardEmojiFamilyConfigurationView baseEmojiString](self, "baseEmojiString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(EMFStringUtilitiesClass_1, "_multiPersonStringForString:skinToneVariantSpecifier:", v5, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardEmojiFamilyConfigurationView configuredWellView](self, "configuredWellView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStringRepresentation:silhouette:", v6, v3);

  if (!v3 && +[UIKeyboardEmoji shouldHighlightEmoji:](UIKeyboardEmoji, "shouldHighlightEmoji:", v6))
  {
    -[UIKeyboardEmojiFamilyConfigurationView configuredWellView](self, "configuredWellView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUnreleasedHighlight:", 1);
LABEL_6:

  }
}

- (BOOL)_hasCompletelyConfiguredSkinToneConfiguration
{
  void *v3;
  void *v4;
  char v5;

  getEMFSkinToneSpecifierTypeFitzpatrickSilhouette_0();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardEmojiFamilyConfigurationView _currentlySelectedSkinToneConfiguration](self, "_currentlySelectedSkinToneConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3) ^ 1;

  return v5;
}

- (void)_updateReferencedKeySelectedVariantIndexBasedOnCurrentConfiguration
{
  void *v3;
  id EMFStringUtilitiesClass_1;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, _BYTE *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (-[UIKeyboardEmojiFamilyConfigurationView _hasCompletelyConfiguredSkinToneConfiguration](self, "_hasCompletelyConfiguredSkinToneConfiguration"))
  {
    -[UIKeyboardEmojiFamilyConfigurationView _currentlySelectedSkinToneConfiguration](self, "_currentlySelectedSkinToneConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    EMFStringUtilitiesClass_1 = getEMFStringUtilitiesClass_1();
    -[UIKeyboardEmojiFamilyConfigurationView baseEmojiString](self, "baseEmojiString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(EMFStringUtilitiesClass_1, "_multiPersonStringForString:skinToneVariantSpecifier:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    -[UIKeyboardEmojiFamilyConfigurationView representedKey](self, "representedKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subtrees");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __109__UIKeyboardEmojiFamilyConfigurationView__updateReferencedKeySelectedVariantIndexBasedOnCurrentConfiguration__block_invoke;
    v15 = &unk_1E16CEFB0;
    v9 = v6;
    v16 = v9;
    v17 = &v18;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v12);

    v10 = v19[3];
    -[UIKeyboardEmojiFamilyConfigurationView representedKey](self, "representedKey", v12, v13, v14, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSelectedVariantIndex:", v10);

    _Block_object_dispose(&v18, 8);
  }
}

void __109__UIKeyboardEmojiFamilyConfigurationView__updateReferencedKeySelectedVariantIndexBasedOnCurrentConfiguration__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;

  objc_msgSend(a2, "representedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)_beginFamilyMetachronalRhythmAnimation
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  UIKeyboardEmojiFamilyConfigurationView *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  _QWORD v31[5];
  _QWORD aBlock[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  getEMFSkinToneSpecifierTypeFitzpatrickSilhouette_0();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4;
  if (v4 - self->_metachronalRhythmAnimationStartTime >= 0.25)
  {
    -[UIKeyboardEmojiFamilyConfigurationView _currentlySelectedSkinToneConfiguration](self, "_currentlySelectedSkinToneConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    -[UIKeyboardEmojiFamilyConfigurationView familyMemberStackViews](self, "familyMemberStackViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v7 == v9)
    {
      if (objc_msgSend(v6, "count"))
      {
        v10 = 0;
        v11 = 0.0;
        v12 = MEMORY[0x1E0C809B0];
        v26 = self;
        v27 = v3;
        v25 = v6;
        do
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", v3))
          {
            v29 = v13;
            -[UIKeyboardEmojiFamilyConfigurationView familyMemberStackViews](self, "familyMemberStackViews");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v10;
            objc_msgSend(v14, "objectAtIndexedSubscript:", v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = 0u;
            v36 = 0u;
            v33 = 0u;
            v34 = 0u;
            v28 = v15;
            objc_msgSend(v15, "arrangedSubviews");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v34;
              v20 = v11;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v34 != v19)
                    objc_enumerationMutation(v16);
                  v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
                  aBlock[0] = v12;
                  aBlock[1] = 3221225472;
                  aBlock[2] = __80__UIKeyboardEmojiFamilyConfigurationView__beginFamilyMetachronalRhythmAnimation__block_invoke;
                  aBlock[3] = &unk_1E16B1B28;
                  aBlock[4] = v22;
                  v23 = _Block_copy(aBlock);
                  v31[0] = v12;
                  v31[1] = 3221225472;
                  v31[2] = __80__UIKeyboardEmojiFamilyConfigurationView__beginFamilyMetachronalRhythmAnimation__block_invoke_2;
                  v31[3] = &unk_1E16B1B28;
                  v31[4] = v22;
                  v24 = _Block_copy(v31);
                  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v23, 0, 0.25, v20);
                  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v24, 0, 1.25, v20 + 0.25, 0.4, 0.5);
                  v20 = v20 + 0.05;

                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
              }
              while (v18);
            }

            v11 = v11 + 0.0825;
            self = v26;
            v3 = v27;
            v6 = v25;
            v13 = v29;
            v10 = v30;
          }

          ++v10;
        }
        while (v10 < objc_msgSend(v6, "count"));
      }
      self->_metachronalRhythmAnimationStartTime = v5;
    }

  }
}

uint64_t __80__UIKeyboardEmojiFamilyConfigurationView__beginFamilyMetachronalRhythmAnimation__block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 1.2, 1.2);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __80__UIKeyboardEmojiFamilyConfigurationView__beginFamilyMetachronalRhythmAnimation__block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (void)layoutSubviews
{
  double x;
  double width;
  double height;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double MaxY;
  uint64_t i;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)UIKeyboardEmojiFamilyConfigurationView;
  -[UIView layoutSubviews](&v20, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v24 = CGRectInset(v23, 16.0, 0.0);
  x = v24.origin.x;
  width = v24.size.width;
  height = v24.size.height;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UIKeyboardEmojiFamilyConfigurationView familyMemberStackViews](self, "familyMemberStackViews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    MaxY = 6.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "setFrame:", x, MaxY, width, 50.0);
        objc_msgSend(v12, "frame");
        MaxY = CGRectGetMaxY(v25);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v8);
    v13 = MaxY + 8.0;
  }
  else
  {
    v13 = 14.0;
  }

  -[UIKeyboardEmojiFamilyConfigurationView separatorView](self, "separatorView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", x, v13, width, 1.0);

  -[UIKeyboardEmojiFamilyConfigurationView previewWellStackView](self, "previewWellStackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", x, v13 + 9.0, width, height - (v13 + 9.0) + -6.0);

}

+ (CGSize)preferredContentViewSizeForKey:(id)a3 withTraits:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = 262.0;
  v5 = 199.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)retestSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4 phase:(int64_t)a5
{
  double y;
  double x;
  id v9;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  if (a5 == 3)
  {
    -[UIKeyboardEmojiFamilyConfigurationView retestForTouchUpSelectedVariantIndexForKey:atPoint:](self, "retestForTouchUpSelectedVariantIndexForKey:atPoint:", v9, x, y);
  }
  else if (!a5)
  {
    -[UIKeyboardEmojiFamilyConfigurationView retestSelectedVariantIndexForKey:atPoint:](self, "retestSelectedVariantIndexForKey:atPoint:", v9, x, y);
  }

  return 0;
}

- (void)retestSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  -[UIView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a4.x, a4.y);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v6, "superview");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
      if (!v7)
        return;
    }
    v20 = v6;
    -[UIKeyboardEmojiFamilyConfigurationView configuredWellView](self, "configuredWellView");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v20 == v8)
    {
      -[UIKeyboardEmojiFamilyConfigurationView _updateReferencedKeySelectedVariantIndexBasedOnCurrentConfiguration](self, "_updateReferencedKeySelectedVariantIndexBasedOnCurrentConfiguration");
      if (!-[UIKeyboardEmojiFamilyConfigurationView _hasCompletelyConfiguredSkinToneConfiguration](self, "_hasCompletelyConfiguredSkinToneConfiguration"))goto LABEL_15;
      v14 = v20;
    }
    else
    {
      -[UIKeyboardEmojiFamilyConfigurationView neutralWellView](self, "neutralWellView");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v20 != v9)
      {
        objc_msgSend(v20, "setSelected:", 1);
        objc_msgSend(v20, "associatedIndexPath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardEmojiFamilyConfigurationView selectedVariantIndices](self, "selectedVariantIndices");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "item"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:atIndexedSubscript:", v13, objc_msgSend(v10, "section"));

        -[UIKeyboardEmojiFamilyConfigurationView setSelectedVariantIndices:](self, "setSelectedVariantIndices:", v12);
LABEL_15:

        return;
      }
      -[UIKeyboardEmojiFamilyConfigurationView representedKey](self, "representedKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSelectedVariantIndex:", 0);

      -[UIKeyboardEmojiFamilyConfigurationView representedKey](self, "representedKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "selectedVariantIndices");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        -[UIKeyboardEmojiFamilyConfigurationView representedKey](self, "representedKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setSelectedVariantIndices:", &unk_1E1A95390);

      }
      v14 = v20;
    }
    objc_msgSend(v14, "setSelected:", 1);
    goto LABEL_15;
  }
}

- (void)retestForTouchUpSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4
{
  char isKindOfClass;
  void *v6;
  id v7;
  id v8;
  void *v9;

  -[UIView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a4.x, a4.y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v9;
    -[UIKeyboardEmojiFamilyConfigurationView configuredWellView](self, "configuredWellView");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v8
      && !-[UIKeyboardEmojiFamilyConfigurationView _hasCompletelyConfiguredSkinToneConfiguration](self, "_hasCompletelyConfiguredSkinToneConfiguration")&& (objc_msgSend(v7, "isSelected") & 1) == 0)
    {
      -[UIKeyboardEmojiFamilyConfigurationView _beginFamilyMetachronalRhythmAnimation](self, "_beginFamilyMetachronalRhythmAnimation");
    }

    v6 = v9;
  }

}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id EMFStringUtilitiesClass_1;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  objc_msgSend(v17, "setSelectedVariantIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[UIKeyboardEmojiFamilyConfigurationView setRepresentedKey:](self, "setRepresentedKey:", v17);
  objc_msgSend(v17, "selectedVariantIndices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

    goto LABEL_5;
  }
  objc_msgSend(v17, "selectedVariantIndices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    EMFStringUtilitiesClass_1 = getEMFStringUtilitiesClass_1();
    objc_msgSend(v17, "representedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(EMFStringUtilitiesClass_1, "_baseStringForEmojiString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardEmojiFamilyConfigurationView _configureSkinToneVariantSpecifiersForBaseString:](self, "_configureSkinToneVariantSpecifiersForBaseString:", v13);
    v14 = getEMFStringUtilitiesClass_1();
    objc_msgSend(v17, "representedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_skinToneSpecifiersForString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardEmojiFamilyConfigurationView _setCurrentlySelectedSkinToneConfiguration:](self, "_setCurrentlySelectedSkinToneConfiguration:", v16);
    goto LABEL_6;
  }
  objc_msgSend(v17, "selectedVariantIndices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  -[UIKeyboardEmojiFamilyConfigurationView setSelectedVariantIndices:](self, "setSelectedVariantIndices:", v10);

  -[UIKeyboardEmojiFamilyConfigurationView _updateReferencedKeySelectedVariantIndexBasedOnCurrentConfiguration](self, "_updateReferencedKeySelectedVariantIndexBasedOnCurrentConfiguration");
LABEL_6:

}

- (void)updateRenderConfig:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;

  v4 = a3;
  v5 = -[UIKeyboardEmojiFamilyConfigurationView usesDarkStyle](self, "usesDarkStyle");
  v6 = objc_msgSend(v4, "lightKeyboard");

  -[UIKeyboardEmojiFamilyConfigurationView setUsesDarkStyle:](self, "setUsesDarkStyle:", v6 ^ 1u);
  if (v5 != -[UIKeyboardEmojiFamilyConfigurationView usesDarkStyle](self, "usesDarkStyle"))
    -[UIKeyboardEmojiFamilyConfigurationView _colorConfigurationDidChange](self, "_colorConfigurationDidChange");
}

- (id)nextResponder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[UIKeyboardEmojiFamilyConfigurationView touchForwardingView](self, "touchForwardingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKeyboardEmojiFamilyConfigurationView;
    -[UIView nextResponder](&v8, sel_nextResponder);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (UIView)touchForwardingView
{
  return self->_touchForwardingView;
}

- (void)setTouchForwardingView:(id)a3
{
  objc_storeStrong((id *)&self->_touchForwardingView, a3);
}

- (BOOL)usesDarkStyle
{
  return self->_usesDarkStyle;
}

- (void)setUsesDarkStyle:(BOOL)a3
{
  self->_usesDarkStyle = a3;
}

- (NSMutableArray)familyMemberStackViews
{
  return self->_familyMemberStackViews;
}

- (void)setFamilyMemberStackViews:(id)a3
{
  objc_storeStrong((id *)&self->_familyMemberStackViews, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (UIStackView)previewWellStackView
{
  return self->_previewWellStackView;
}

- (void)setPreviewWellStackView:(id)a3
{
  objc_storeStrong((id *)&self->_previewWellStackView, a3);
}

- (UIKeyboardEmojiWellView)neutralWellView
{
  return self->_neutralWellView;
}

- (void)setNeutralWellView:(id)a3
{
  objc_storeStrong((id *)&self->_neutralWellView, a3);
}

- (UIKeyboardEmojiWellView)configuredWellView
{
  return self->_configuredWellView;
}

- (void)setConfiguredWellView:(id)a3
{
  objc_storeStrong((id *)&self->_configuredWellView, a3);
}

- (NSIndexPath)lastSelectedIndexPath
{
  return self->_lastSelectedIndexPath;
}

- (void)setLastSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, a3);
}

- (NSString)baseEmojiString
{
  return self->_baseEmojiString;
}

- (void)setBaseEmojiString:(id)a3
{
  objc_storeStrong((id *)&self->_baseEmojiString, a3);
}

- (NSMutableArray)selectedVariantIndices
{
  return self->_selectedVariantIndices;
}

- (NSArray)skinToneVariantRows
{
  return self->_skinToneVariantRows;
}

- (void)setSkinToneVariantRows:(id)a3
{
  objc_storeStrong((id *)&self->_skinToneVariantRows, a3);
}

- (NSArray)variantDisplayRows
{
  return self->_variantDisplayRows;
}

- (void)setVariantDisplayRows:(id)a3
{
  objc_storeStrong((id *)&self->_variantDisplayRows, a3);
}

- (UIKBTree)representedKey
{
  return self->_representedKey;
}

- (void)setRepresentedKey:(id)a3
{
  objc_storeStrong((id *)&self->_representedKey, a3);
}

- (BOOL)hasSplitFontSupport
{
  return self->_hasSplitFontSupport;
}

- (void)setHasSplitFontSupport:(BOOL)a3
{
  self->_hasSplitFontSupport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedKey, 0);
  objc_storeStrong((id *)&self->_variantDisplayRows, 0);
  objc_storeStrong((id *)&self->_skinToneVariantRows, 0);
  objc_storeStrong((id *)&self->_selectedVariantIndices, 0);
  objc_storeStrong((id *)&self->_baseEmojiString, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_configuredWellView, 0);
  objc_storeStrong((id *)&self->_neutralWellView, 0);
  objc_storeStrong((id *)&self->_previewWellStackView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_familyMemberStackViews, 0);
  objc_storeStrong((id *)&self->_touchForwardingView, 0);
}

@end
