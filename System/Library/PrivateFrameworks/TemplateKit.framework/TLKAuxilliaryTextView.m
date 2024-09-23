@implementation TLKAuxilliaryTextView

- (id)setupContentView
{
  void *v3;
  int v4;
  void *v5;
  NSString *v6;
  int IsAccessibilityCategory;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setAxis:", 1);
  v4 = +[TLKLayoutUtilities isLTR](TLKLayoutUtilities, "isLTR");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  -[TLKAuxilliaryTextView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  if (v4 != IsAccessibilityCategory)
    v8 = 2;
  else
    v8 = 0;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setSupportsColorGlyphs:", 1);
  objc_msgSend(v9, "setTextAlignment:", v8);
  -[TLKAuxilliaryTextView setTopLabel:](self, "setTopLabel:", v9);
  objc_msgSend(v3, "addArrangedSubview:", v9);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setTextAlignment:", v8);
  -[TLKAuxilliaryTextView setMiddleLabel:](self, "setMiddleLabel:", v10);
  objc_msgSend(v3, "addArrangedSubview:", v10);
  +[TLKLabel secondaryLabel](TLKLabel, "secondaryLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextAlignment:", v8);
  -[TLKAuxilliaryTextView setBottomLabel:](self, "setBottomLabel:", v11);
  objc_msgSend(v3, "addArrangedSubview:", v11);

  return v3;
}

- (void)setTopText:(id)a3
{
  id v5;
  TLKRichText **p_topText;
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
  p_topText = &self->_topText;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_topText, "setObserver:", 0);
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
      v7 = *p_topText;
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
  objc_storeStrong((id *)&self->_topText, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_topText, "setObserver:", self);
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
      v13 = *p_topText;
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
  -[TLKView observer](self, "observer");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[TLKView observer](self, "observer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "batchUpdateCount");

    if (!v22)
    {
      -[TLKView observer](self, "observer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "propertiesDidChange");

    }
  }

}

- (void)setMiddleText:(id)a3
{
  id v5;
  TLKRichText **p_middleText;
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
  p_middleText = &self->_middleText;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_middleText, "setObserver:", 0);
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
      v7 = *p_middleText;
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
  objc_storeStrong((id *)&self->_middleText, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_middleText, "setObserver:", self);
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
      v13 = *p_middleText;
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
  -[TLKView observer](self, "observer");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[TLKView observer](self, "observer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "batchUpdateCount");

    if (!v22)
    {
      -[TLKView observer](self, "observer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "propertiesDidChange");

    }
  }

}

- (void)setBottomText:(id)a3
{
  id v5;
  TLKRichText **p_bottomText;
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
  p_bottomText = &self->_bottomText;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_bottomText, "setObserver:", 0);
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
      v7 = *p_bottomText;
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
  objc_storeStrong((id *)&self->_bottomText, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_bottomText, "setObserver:", self);
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
      v13 = *p_bottomText;
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
  -[TLKView observer](self, "observer");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[TLKView observer](self, "observer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "batchUpdateCount");

    if (!v22)
    {
      -[TLKView observer](self, "observer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "propertiesDidChange");

    }
  }

}

- (void)observedPropertiesChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  id v33;
  _BOOL8 v34;
  _BOOL8 v35;
  void **v36;
  void *v37;
  id *v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  id *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  double v57;
  double v58;
  int v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  _BOOL4 v65;
  double v66;
  double v67;
  id v68;

  -[TLKAuxilliaryTextView topText](self, "topText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKAuxilliaryTextView topLabel](self, "topLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRichText:", v3);

  -[TLKAuxilliaryTextView middleText](self, "middleText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKAuxilliaryTextView middleLabel](self, "middleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRichText:", v5);

  -[TLKAuxilliaryTextView bottomText](self, "bottomText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKAuxilliaryTextView bottomLabel](self, "bottomLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRichText:", v7);

  -[TLKAuxilliaryTextView topText](self, "topText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasContent") ^ 1;
  -[TLKAuxilliaryTextView topLabel](self, "topLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v10);

  -[TLKAuxilliaryTextView middleText](self, "middleText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasContent") ^ 1;
  -[TLKAuxilliaryTextView middleLabel](self, "middleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", v13);

  -[TLKAuxilliaryTextView bottomText](self, "bottomText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hasContent") ^ 1;
  -[TLKAuxilliaryTextView bottomLabel](self, "bottomLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", v16);

  -[TLKAuxilliaryTextView middleLabel](self, "middleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isHidden") & 1) != 0)
  {
    -[TLKAuxilliaryTextView bottomLabel](self, "bottomLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v19, "isHidden");

    if ((_DWORD)v17)
      v20 = 1;
    else
      v20 = 2;
  }
  else
  {

    v20 = 2;
  }
  -[TLKAuxilliaryTextView topLabel](self, "topLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setProminence:", v20);

  -[TLKAuxilliaryTextView topLabel](self, "topLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isHidden");
  if ((v23 & 1) != 0)
  {
    v24 = 1;
  }
  else
  {
    -[TLKAuxilliaryTextView bottomLabel](self, "bottomLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v17, "isHidden");
  }
  v25 = v24 ^ 1u;
  -[TLKAuxilliaryTextView middleLabel](self, "middleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setProminence:", v25);

  if ((v23 & 1) == 0)
  -[TLKAuxilliaryTextView topLabel](self, "topLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "isHidden"))
  {
    -[TLKAuxilliaryTextView bottomLabel](self, "bottomLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isHidden");

  }
  else
  {
    v29 = 0;
  }

  -[TLKAuxilliaryTextView topLabel](self, "topLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "isHidden"))
  {
    -[TLKAuxilliaryTextView middleLabel](self, "middleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isHidden");

  }
  else
  {
    v32 = 0;
  }

  +[TLKFontUtilities footnoteFont](TLKFontUtilities, "footnoteFont");
  v68 = (id)objc_claimAutoreleasedReturnValue();
  if (-[TLKAuxilliaryTextView useCompactMode](self, "useCompactMode"))
  {
    if (TLKBiggerSuggestionsLayoutEnabled())
    {
      v33 = (id)*MEMORY[0x1E0DC4B60];
    }
    else
    {
      -[TLKAuxilliaryTextView topLabel](self, "topLabel");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "isHidden"))
      {
        -[TLKAuxilliaryTextView bottomLabel](self, "bottomLabel");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "isHidden");
        v48 = (id *)MEMORY[0x1E0DC4A88];
        if (v47)
          v48 = (id *)MEMORY[0x1E0DC4B50];
        v33 = *v48;

      }
      else
      {
        v33 = (id)*MEMORY[0x1E0DC4A88];
      }

    }
    +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", v33, TLKSnippetModernizationEnabled() ^ 1, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4AA0], TLKSnippetModernizationEnabled() ^ 1, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (TLKSnippetModernizationEnabled())
  {
    v34 = +[TLKUtilities isMacOS](TLKUtilities, "isMacOS");
    v35 = v34;
    v36 = (void **)MEMORY[0x1E0DC4A90];
    if (!v34)
      v36 = (void **)MEMORY[0x1E0DC4B10];
    v37 = *v36;
    if (v34)
      v38 = (id *)MEMORY[0x1E0DC4B58];
    else
      v38 = (id *)MEMORY[0x1E0DC4B60];
    v39 = v37;
    +[TLKFontUtilities cachedFontForTextStyle:isBold:isMacStyle:](TLKFontUtilities, "cachedFontForTextStyle:isBold:isMacStyle:", v39, 1, v35);
    v40 = objc_claimAutoreleasedReturnValue();

    -[TLKAuxilliaryTextView topLabel](self, "topLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "isHidden"))
      v42 = *v38;
    else
      v42 = v39;
    +[TLKFontUtilities cachedFontForTextStyle:isBold:isMacStyle:](TLKFontUtilities, "cachedFontForTextStyle:isBold:isMacStyle:", v42, 0, v35);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    +[TLKFontUtilities cachedFontForTextStyle:isBold:isMacStyle:](TLKFontUtilities, "cachedFontForTextStyle:isBold:isMacStyle:", v39, 0, v35);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = (id)v40;
  }
  else
  {
    +[TLKFontUtilities cachedFontForTextStyle:isShort:fontWeight:](TLKFontUtilities, "cachedFontForTextStyle:isShort:fontWeight:", *MEMORY[0x1E0DC4AE8], 0, *MEMORY[0x1E0DC4B88]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v32 & 1) != 0)
      +[TLKFontUtilities shortBodyFont](TLKFontUtilities, "shortBodyFont");
    else
      +[TLKFontUtilities footnoteFont](TLKFontUtilities, "footnoteFont");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TLKAuxilliaryTextView topLabel](self, "topLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFont:", v68);

  -[TLKAuxilliaryTextView middleLabel](self, "middleLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFont:", v43);

  -[TLKAuxilliaryTextView bottomLabel](self, "bottomLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setFont:", v44);

  -[TLKAuxilliaryTextView bottomLabel](self, "bottomLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v52, "isHidden") & 1) != 0)
  {
    v53 = 0;
  }
  else
  {
    -[TLKAuxilliaryTextView middleLabel](self, "middleLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v54, "isHidden") & 1) != 0)
    {
      v53 = 0;
    }
    else
    {
      -[TLKAuxilliaryTextView topLabel](self, "topLabel");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v55, "isHidden") ^ 1;

    }
  }

  v56 = +[TLKUtilities isMacOS](TLKUtilities, "isMacOS");
  v57 = 0.0;
  v58 = 0.0;
  if (!-[TLKAuxilliaryTextView useCompactMode](self, "useCompactMode"))
  {
    if (v56)
      v58 = 0.0;
    else
      v58 = 2.0;
    v59 = TLKSnippetModernizationEnabled();
    if (!v59)
      v58 = -3.0;
    if (((v59 ^ 1 | v53) & 1) == 0)
    {
      +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, 0.5);
      v58 = v60;
    }
  }
  -[TLKView contentView](self, "contentView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setSpacing:", v58);

  -[TLKView contentView](self, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if ((TLKSnippetModernizationEnabled() & v53) != 0)
    v63 = 2.0;
  else
    v63 = *MEMORY[0x1E0CFAA78];
  -[TLKAuxilliaryTextView topLabel](self, "topLabel");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setCustomSpacing:afterView:", v64, v63);

  if (TLKSnippetModernizationEnabled())
  {
    if (v53)
    {
      if (+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
        v57 = 1.0;
      else
        v57 = 2.0;
    }
    else if ((v29 & 1) == 0)
    {
      v65 = +[TLKUtilities isMacOS](TLKUtilities, "isMacOS");
      v66 = -2.5;
      if (v65)
        v66 = -3.0;
      +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, v66);
      v57 = v67;
    }
  }
  -[TLKAuxilliaryTextView setLayoutMargins:](self, "setLayoutMargins:", v57, 0.0, 0.0, 0.0);

}

- (id)middleLabelFont
{
  void *v2;
  void *v3;

  -[TLKAuxilliaryTextView middleLabel](self, "middleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bottomLabelFont
{
  void *v2;
  void *v3;

  -[TLKAuxilliaryTextView bottomLabel](self, "bottomLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)topLabelString
{
  void *v2;
  void *v3;

  -[TLKAuxilliaryTextView topLabel](self, "topLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)middleLabelString
{
  void *v2;
  void *v3;

  -[TLKAuxilliaryTextView middleLabel](self, "middleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bottomLabelString
{
  void *v2;
  void *v3;

  -[TLKAuxilliaryTextView bottomLabel](self, "bottomLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TLKRichText)topText
{
  return self->_topText;
}

- (TLKRichText)middleText
{
  return self->_middleText;
}

- (TLKRichText)bottomText
{
  return self->_bottomText;
}

- (TLKLabel)topLabel
{
  return self->_topLabel;
}

- (void)setTopLabel:(id)a3
{
  objc_storeStrong((id *)&self->_topLabel, a3);
}

- (TLKLabel)middleLabel
{
  return self->_middleLabel;
}

- (void)setMiddleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_middleLabel, a3);
}

- (TLKLabel)bottomLabel
{
  return self->_bottomLabel;
}

- (void)setBottomLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLabel, a3);
}

- (BOOL)useCompactMode
{
  return self->_useCompactMode;
}

- (void)setUseCompactMode:(BOOL)a3
{
  self->_useCompactMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_middleLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);
  objc_storeStrong((id *)&self->_bottomText, 0);
  objc_storeStrong((id *)&self->_middleText, 0);
  objc_storeStrong((id *)&self->_topText, 0);
}

@end
