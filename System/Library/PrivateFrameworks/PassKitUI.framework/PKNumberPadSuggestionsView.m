@implementation PKNumberPadSuggestionsView

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3938], "defaultSizeForInterfaceOrientation:", 1);
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (PKNumberPadSuggestionsView)initWithFrame:(CGRect)a3
{
  PKNumberPadSuggestionsView *v3;
  PKNumberPadSuggestionsView *v4;
  PKNumberPadSuggestionsView *v5;
  _QWORD v7[4];
  PKNumberPadSuggestionsView *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKNumberPadSuggestionsView;
  v3 = -[PKNumberPadSuggestionsView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKNumberPadSuggestionsView setAxis:](v3, "setAxis:", 0);
    -[PKNumberPadSuggestionsView setDistribution:](v4, "setDistribution:", 1);
    -[PKNumberPadSuggestionsView setAlignment:](v4, "setAlignment:", 0);
    -[PKNumberPadSuggestionsView setSpacing:](v4, "setSpacing:", 0.0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__PKNumberPadSuggestionsView_initWithFrame___block_invoke;
    v7[3] = &unk_1E3E652B0;
    v5 = v4;
    v8 = v5;
    -[PKNumberPadSuggestionsView performBatchUpdates:](v5, "performBatchUpdates:", v7);
    -[PKNumberPadSuggestionsView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680D8]);

  }
  return v4;
}

void __44__PKNumberPadSuggestionsView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 457) = 1;
  v2 = (void *)MEMORY[0x1E0DC3658];
  v3 = a2;
  objc_msgSend(v2, "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setButtonTextColor:", v4);

  PKProvisioningBackgroundColor();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setButtonBackgroundColor:", v5);

}

- (PKNumberPadSuggestionsView)initWithDefaultFrame
{
  double v3;

  objc_msgSend((id)objc_opt_class(), "defaultSize");
  return -[PKNumberPadSuggestionsView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v3, 44.0);
}

- (void)performBatchUpdates:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    ++self->_batchedUpdateCount;
    v6 = v4;
    (*((void (**)(id, PKNumberPadSuggestionsView *))v4 + 2))(v4, self);
    v5 = self->_batchedUpdateCount - 1;
    self->_batchedUpdateCount = v5;
    if (!v5)
    {
      if (self->_needsReload)
        -[PKNumberPadSuggestionsView _reloadSubviews](self, "_reloadSubviews");
      if (self->_needsUpdate)
        -[PKNumberPadSuggestionsView _updateButtons](self, "_updateButtons");
    }

  }
  else
  {
    __break(1u);
  }
}

- (void)setSuggestions:(id)a3
{
  NSArray *v4;
  NSArray *suggestions;

  if (self->_suggestions != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    suggestions = self->_suggestions;
    self->_suggestions = v4;

    -[PKNumberPadSuggestionsView _reloadSubviews](self, "_reloadSubviews");
  }
}

- (void)setButtonTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_buttonTextColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_buttonTextColor, a3);
    -[PKNumberPadSuggestionsView _updateButtons](self, "_updateButtons");
    v5 = v6;
  }

}

- (void)setButtonBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_buttonBackgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_buttonBackgroundColor, a3);
    -[PKNumberPadSuggestionsView _updateButtons](self, "_updateButtons");
    v5 = v6;
  }

}

- (void)_reloadSubviews
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSArray *suggestionButtons;
  char v9;
  void *v10;
  void *v11;
  NSArray *suggestions;
  id v13;
  NSArray *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  PKNumberPadSuggestionsView *v20;
  id v21;
  id v22[2];
  char v23;
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_batchedUpdateCount)
  {
    self->_needsReload = 1;
  }
  else
  {
    v3 = (void *)MEMORY[0x1A1AE621C]();
    self->_needsReload = 0;
    self->_needsUpdate = 0;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v4 = self->_suggestionButtons;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v26 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "removeFromSuperview");
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v5);
    }

    suggestionButtons = self->_suggestionButtons;
    self->_suggestionButtons = 0;

    v9 = -[PKNumberPadSuggestionsView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v10 = -[NSArray count](self->_suggestions, "count");
    objc_initWeak(&location, self);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
    suggestions = self->_suggestions;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __45__PKNumberPadSuggestionsView__reloadSubviews__block_invoke;
    v19 = &unk_1E3E6BA60;
    v23 = v9;
    v22[1] = v10;
    v20 = self;
    objc_copyWeak(v22, &location);
    v13 = v11;
    v21 = v13;
    -[NSArray enumerateObjectsUsingBlock:](suggestions, "enumerateObjectsUsingBlock:", &v16);
    v14 = (NSArray *)objc_msgSend(v13, "copy", v16, v17, v18, v19, v20);
    v15 = self->_suggestionButtons;
    self->_suggestionButtons = v14;

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
    objc_autoreleasePoolPop(v3);
  }
}

void __45__PKNumberPadSuggestionsView__reloadSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;

  v5 = a2;
  if (*(_QWORD *)(a1 + 56) - 1 == a3)
  {
    v6 = 1;
  }
  else if (*(_BYTE *)(a1 + 64))
  {
    v6 = 9;
  }
  else
  {
    v6 = 5;
  }
  v7 = *(void **)(a1 + 32);
  v8 = (void *)MEMORY[0x1E0DC3428];
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__PKNumberPadSuggestionsView__reloadSubviews__block_invoke_2;
  v13[3] = &unk_1E3E62BD0;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  objc_msgSend(v8, "actionWithHandler:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "_createBorderedButtonForSuggestion:withBorder:primaryAction:", v5, v6, v10);

  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __45__PKNumberPadSuggestionsView__reloadSubviews__block_invoke_3;
  v12[3] = &unk_1E3E6BA38;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v11, "setConfigurationUpdateHandler:", v12);
  objc_msgSend(*(id *)(a1 + 32), "addArrangedSubview:", v11);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

  objc_destroyWeak(&v14);
}

void __45__PKNumberPadSuggestionsView__reloadSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "sender");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_selectedSuggestion:", v4);

  }
}

void __45__PKNumberPadSuggestionsView__reloadSubviews__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseForegroundColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480));
  objc_msgSend(v3, "background");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isHighlighted") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

  }
  else
  {
    objc_msgSend(v4, "setBackgroundColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 488));
  }

  objc_msgSend(v6, "setConfiguration:", v3);
}

- (void)_updateButtons
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_batchedUpdateCount)
  {
    self->_needsUpdate = 1;
  }
  else
  {
    v3 = (void *)MEMORY[0x1A1AE621C]();
    self->_needsUpdate = 0;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_suggestionButtons;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setNeedsUpdateConfiguration", (_QWORD)v9);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    objc_autoreleasePoolPop(v3);
  }
}

- (id)_createBorderedButtonForSuggestion:(id)a3 withBorder:(unint64_t)a4 primaryAction:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = a5;
  +[PKBorderedButtonConfiguration plainButtonConfiguration](PKBorderedButtonConfiguration, "plainButtonConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorder:", a4);
  objc_msgSend(v8, "background");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCornerRadius:", 0.0);
  objc_msgSend(v7, "displayValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v10, "setAlignment:", 1);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v9);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    v16 = *MEMORY[0x1E0DC1178];
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v18 = objc_msgSend(v9, "rangeOfString:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17));
        objc_msgSend(v11, "addAttribute:value:range:", v16, v10, v18, v19);
        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  objc_msgSend(v8, "setAttributedTitle:", v11);
  objc_msgSend(v8, "setTitleAlignment:", 2);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __90__PKNumberPadSuggestionsView__createBorderedButtonForSuggestion_withBorder_primaryAction___block_invoke;
  v25[3] = &unk_1E3E6BA88;
  v26 = v7;
  v20 = v7;
  objc_msgSend(v8, "setTitleTextAttributesTransformer:", v25);
  +[PKBorderedButton borderedButtonWithConfiguration:primaryAction:](PKBorderedButton, "borderedButtonWithConfiguration:primaryAction:", v8, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id __90__PKNumberPadSuggestionsView__createBorderedButtonForSuggestion_withBorder_primaryAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  v6 = 14.0;
  if (!v5)
    v6 = 17.0;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x1E0DC1138]);

  return v3;
}

- (void)_selectedSuggestion:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[NSArray objectAtIndex:](self->_suggestions, "objectAtIndex:", -[NSArray indexOfObject:](self->_suggestionButtons, "indexOfObject:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "displayValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Suggestion %@ selected", (uint8_t *)&v8, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "numberPadSuggestionsView:didSelectSuggestion:", self, v4);

}

- (PKNumberPadSuggestionsViewDelegate)delegate
{
  return (PKNumberPadSuggestionsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (UIColor)buttonTextColor
{
  return self->_buttonTextColor;
}

- (UIColor)buttonBackgroundColor
{
  return self->_buttonBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_buttonTextColor, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestionButtons, 0);
}

@end
