@implementation SearchUIThumbnailViewController

+ (BOOL)supportsRowModel:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "leadingImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "fallbackImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v5 = 1;
    else
      v5 = +[SearchUIThumbnailViewController rowModelHasSuggestionThumbnail:](SearchUIThumbnailViewController, "rowModelHasSuggestionThumbnail:", v3);

  }
  return v5;
}

+ (BOOL)rowModelHasSuggestionThumbnail:(id)a3
{
  void *v3;
  char isKindOfClass;

  objc_msgSend(a3, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (void)applyImageConstraintsToImageView:(id)a3 isCompact:(BOOL)a4 preventThumbnailScaling:(BOOL)a5 usesCompactWidth:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  id v10;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = v9;
  if (v8)
  {
    +[SearchUISuggestionImageUtilities maximumSize](SearchUISuggestionImageUtilities, "maximumSize");
    objc_msgSend(v10, "setMaximumLayoutSize:");
    +[SearchUISuggestionImageUtilities maximumSize](SearchUISuggestionImageUtilities, "maximumSize");
    objc_msgSend(v10, "setMinimumLayoutSize:");
  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DBD9B0], "maxThumbnailSizeIsCompactWidth:", v6);
    objc_msgSend(v10, "setMinimumLayoutSize:");
    objc_msgSend(v10, "setMaximumLayoutSize:", *MEMORY[0x1E0CFAA80], *(double *)(MEMORY[0x1E0CFAA80] + 8));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBD9B0], "applyRowBoundedSizingToImageView:isCompactWidth:", v9, v6);
  }

}

- (id)setupView
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIgnoreImageAlignmentRectInsets:", 1);
  return v2;
}

- (BOOL)shouldVerticallyCenter
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  char v14;

  +[SearchUIAppIconImage sizeForVariant:](SearchUIAppIconImage, "sizeForVariant:", 2);
  v4 = v3;
  v6 = v5;
  -[SearchUILeadingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicContentSize");
  v9 = v8;
  v11 = v10;

  if (v9 <= v4 && v11 <= v6)
    return 1;
  -[SearchUILeadingViewController rowModel](self, "rowModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "useCompactVersionOfUI");

  return v14;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SearchUIThumbnailViewController;
  -[SearchUILeadingViewController updateWithRowModel:](&v14, sel_updateWithRowModel_, v4);
  if (TLKSnippetModernizationEnabled())
  {
    if ((objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForMacTextStyle:", *MEMORY[0x1E0DC4B58]);
    else
      objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:", *MEMORY[0x1E0DC4AE8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "useCompactVersionOfUI");
    v7 = v5;
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "compactSymbolFont");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SearchUILeadingViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSymbolFont:", v7);

    if (v6)
    if (objc_msgSend(v4, "useCompactVersionOfUI"))
      v9 = objc_msgSend((id)objc_opt_class(), "compactSymbolScale");
    else
      v9 = 2;
    -[SearchUILeadingViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSymbolScale:", v9);

  }
  v11 = (void *)MEMORY[0x1E0DBD910];
  -[SearchUILeadingViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bestAppearanceForView:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIThumbnailViewController tlk_updateForAppearance:](self, "tlk_updateForAppearance:", v13);

}

+ (id)compactSymbolFont
{
  void *v2;
  void *v3;
  int v4;
  _QWORD *v5;

  if (TLKSnippetModernizationEnabled() && (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:isBold:isMacStyle:", *MEMORY[0x1E0DC4B58], 0, 1, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0DBD940];
    v4 = TLKBiggerSuggestionsLayoutEnabled();
    v5 = (_QWORD *)MEMORY[0x1E0DC4B50];
    if (!v4)
      v5 = (_QWORD *)MEMORY[0x1E0DC4B60];
    objc_msgSend(v3, "cachedFontForTextStyle:", *v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (int64_t)compactSymbolScale
{
  int v2;

  if (TLKSnippetModernizationEnabled())
    v2 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  else
    v2 = 0;
  if ((objc_msgSend(MEMORY[0x1E0DBD9B0], "isSuperLargeAccessibilitySize") & 1) != 0
    || (TLKBiggerSuggestionsLayoutEnabled() | v2) == 1)
  {
    return 1;
  }
  else
  {
    return 3;
  }
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIThumbnailViewController;
  -[SearchUILeadingViewController tlk_updateForAppearance:](&v12, sel_tlk_updateForAppearance_, v4);
  -[SearchUILeadingViewController rowModel](self, "rowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUILeadingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SearchUIThumbnailViewController_tlk_updateForAppearance___block_invoke;
  v9[3] = &unk_1EA1F6518;
  v9[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "performBatchUpdates:", v9);

}

void __59__SearchUIThumbnailViewController_tlk_updateForAppearance___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id location;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  objc_msgSend(*(id *)(a1 + 32), "imageForRowModel:appearance:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DBD910];
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disableAppearanceOverrideForView:", v4);

  objc_msgSend(*(id *)(a1 + 32), "rowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "backgroundColor"))
    {
      v7 = (void *)objc_msgSend(v2, "copy");
      objc_msgSend(v7, "setBackgroundColor:", 0);
      objc_msgSend(v7, "setCornerRoundingStyle:", 0);
      objc_msgSend(v7, "setPrimaryColor:", 7);
      objc_msgSend(v7, "setSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

      v2 = v7;
    }
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__3;
    v28 = __Block_byref_object_dispose__3;
    v29 = (id)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "rowModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v25[5], "setSfColor:", v9);

    objc_msgSend((id)v25[5], "setAppearance:", *(_QWORD *)(a1 + 48));
    objc_initWeak(&location, *(id *)(a1 + 32));
    v10 = v25[5];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __59__SearchUIThumbnailViewController_tlk_updateForAppearance___block_invoke_16;
    v21[3] = &unk_1EA1F7A70;
    v21[4] = &v24;
    objc_copyWeak(&v22, &location);
    +[SearchUIBackgroundColorUtilities resolvedColoringForColorRequest:completionHandler:](SearchUIBackgroundColorUtilities, "resolvedColoringForColorRequest:completionHandler:", v10, v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v24, 8);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "useCompactVersionOfUI"))
  {
    +[SearchUISuggestionImageUtilities maximumSize](SearchUISuggestionImageUtilities, "maximumSize");
    v11 = +[SearchUIAppIconImage bestVariantForSize:](SearchUIAppIconImage, "bestVariantForSize:");
  }
  else
  {
    v11 = 4;
  }
  +[SearchUIImage imageWithSFImage:variantForAppIcon:](SearchUIImage, "imageWithSFImage:variantForAppIcon:", v2, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fallbackImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "action");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateWithImage:fallbackImage:needsOverlayButton:", v12, v14, objc_msgSend(v15, "isOverlay"));

  v16 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rowModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "useCompactVersionOfUI");
  objc_msgSend(*(id *)(a1 + 32), "rowModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "applyImageConstraintsToImageView:isCompact:preventThumbnailScaling:usesCompactWidth:", v17, v19, objc_msgSend(v20, "preventThumbnailImageScaling"), objc_msgSend(*(id *)(a1 + 32), "usesCompactWidth"));

}

void __59__SearchUIThumbnailViewController_tlk_updateForAppearance___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  if (objc_msgSend(v3, "preferKeylineForShadowBasedViews"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "sfColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sfColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqual:", v6);

    if (v7)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __59__SearchUIThumbnailViewController_tlk_updateForAppearance___block_invoke_2;
      v8[3] = &unk_1EA1F7A48;
      v10 = *(_QWORD *)(a1 + 32);
      v9 = v3;
      objc_copyWeak(&v11, (id *)(a1 + 40));
      +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v8);
      objc_destroyWeak(&v11);

    }
  }

}

void __59__SearchUIThumbnailViewController_tlk_updateForAppearance___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "sfColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "colorRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sfColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqual:", v4);

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0DBD910], "appearanceWithStyle:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "overrideAppearanceForView:", v7);

  }
}

- (id)imageForRowModel:(id)a3 appearance:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "leadingImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || !+[SearchUIThumbnailViewController rowModelHasSuggestionThumbnail:](SearchUIThumbnailViewController, "rowModelHasSuggestionThumbnail:", v4))
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "cardSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUISuggestionImageUtilities imageForSuggestionCardSection:](SearchUISuggestionImageUtilities, "imageForSuggestionCardSection:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)setUsesCompactWidth:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  if (-[SearchUILeadingViewController usesCompactWidth](self, "usesCompactWidth") != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUIThumbnailViewController;
    -[SearchUILeadingViewController setUsesCompactWidth:](&v10, sel_setUsesCompactWidth_, v3);
    v5 = (void *)objc_opt_class();
    -[SearchUILeadingViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUILeadingViewController rowModel](self, "rowModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "useCompactVersionOfUI");
    -[SearchUILeadingViewController rowModel](self, "rowModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applyImageConstraintsToImageView:isCompact:preventThumbnailScaling:usesCompactWidth:", v6, v8, objc_msgSend(v9, "preventThumbnailImageScaling"), -[SearchUILeadingViewController usesCompactWidth](self, "usesCompactWidth"));

  }
}

- (unint64_t)type
{
  return 1;
}

@end
