@implementation TLKDescriptionView

- (id)setupContentView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  TLKDescriptionContainerBoxView *v11;
  void *v12;
  TLKDescriptionContainerBoxView *v13;
  TLKStackView *v14;
  void *v15;
  TLKStackView *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = *MEMORY[0x1E0DC4A88];
  +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4A88], TLKSnippetModernizationEnabled() ^ 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v3);
  v6 = (void *)objc_opt_new();
  if (!TLKSnippetModernizationEnabled()
    || +[TLKUtilities isIpad](TLKUtilities, "isIpad")
    || +[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
  {
    v4 = *MEMORY[0x1E0DC4B10];
  }
  +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", v4, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

  objc_msgSend(v8, "addTarget:action:", self, sel_moreButtonPressed);
  v10 = (void *)objc_opt_new();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v10);
  v11 = [TLKDescriptionContainerBoxView alloc];
  v23[0] = v10;
  v23[1] = v6;
  v23[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NUIContainerBoxView initWithArrangedSubviews:](v11, "initWithArrangedSubviews:", v12);

  -[TLKDescriptionContainerBoxView setViewForFirstAndLastBaseline:](v13, "setViewForFirstAndLastBaseline:", v6);
  -[NUIContainerBoxView setHorizontalAlignment:](v13, "setHorizontalAlignment:", 1);
  -[NUIContainerBoxView setVerticalAlignment:](v13, "setVerticalAlignment:", 1);
  -[TLKDescriptionContainerBoxView setDelegate:](v13, "setDelegate:", self);
  -[TLKDescriptionContainerBoxView setAlignment:forView:inAxis:](v13, "setAlignment:forView:inAxis:", 0, v6, 0);
  -[TLKDescriptionContainerBoxView setAlignment:forView:inAxis:](v13, "setAlignment:forView:inAxis:", 4, v8, 0);
  -[TLKDescriptionContainerBoxView setAlignment:forView:inAxis:](v13, "setAlignment:forView:inAxis:", 4, v8, 1);
  +[TLKView makeContainerShadowCompatible:](TLKView, "makeContainerShadowCompatible:", v13);
  -[TLKDescriptionView setTitleLabel:](self, "setTitleLabel:", v3);
  -[TLKDescriptionView setDetailsTextView:](self, "setDetailsTextView:", v6);
  -[TLKDescriptionView setMoreButton:](self, "setMoreButton:", v8);
  -[TLKDescriptionView setImageAndDescriptionBoxView:](self, "setImageAndDescriptionBoxView:", v13);
  -[TLKDescriptionView setImageView:](self, "setImageView:", v10);
  -[TLKDescriptionView setImageViewExclusionPath:](self, "setImageViewExclusionPath:", 0);
  -[TLKDescriptionView setMoreButtonExclusionPath:](self, "setMoreButtonExclusionPath:", 0);
  v14 = [TLKStackView alloc];
  v22[0] = v3;
  v22[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NUIContainerStackView initWithArrangedSubviews:](v14, "initWithArrangedSubviews:", v15);

  -[TLKStackView setAxis:](v16, "setAxis:", 1);
  -[NUIContainerStackView setSpacing:](v16, "setSpacing:", 1.0);
  -[TLKStackView setDelegate:](v16, "setDelegate:", self);
  -[TLKDescriptionView setStackView:](self, "setStackView:", v16);
  -[TLKDescriptionView imageAndDescriptionBoxView](self, "imageAndDescriptionBoxView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "effectiveBaselineOffsetFromBottom");
  v19 = v18;

  -[TLKDescriptionView imageView](self, "imageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCustomAlignmentRectInsets:", 0.0, 0.0, -v19, 0.0);

  return v16;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKDescriptionView;
  -[TLKDescriptionView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[TLKDescriptionView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[TLKDescriptionView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TLKDescriptionView;
  -[TLKDescriptionView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TLKDescriptionView;
  v4 = a3;
  -[UIView tlk_updateForAppearance:](&v10, sel_tlk_updateForAppearance_, v4);
  v5 = objc_msgSend(v4, "isVibrant", v10.receiver, v10.super_class);

  if (v5)
    v6 = 2;
  else
    v6 = 1;
  -[TLKDescriptionView moreButton](self, "moreButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProminence:", v6);

  -[TLKDescriptionView footnoteButton](self, "footnoteButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProminence:", 3);

  -[TLKDescriptionView trailingFootnoteButton](self, "trailingFootnoteButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProminence:", 3);

}

- (void)setText:(id)a3
{
  id v5;
  TLKMultilineText **p_text;
  TLKMultilineText *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  TLKMultilineText *v13;
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
  p_text = &self->_text;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_text, "setObserver:", 0);
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
      v7 = *p_text;
      v8 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
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
          v9 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v9);
      }

      v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_text, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_text, "setObserver:", self);
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
      v13 = *p_text;
      v14 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
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
          v15 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
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

- (void)setTitle:(id)a3
{
  id v5;
  TLKMultilineText **p_title;
  TLKMultilineText *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  TLKMultilineText *v13;
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
  p_title = &self->_title;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_title, "setObserver:", 0);
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
      v7 = *p_title;
      v8 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
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
          v9 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v9);
      }

      v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_title, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_title, "setObserver:", self);
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
      v13 = *p_title;
      v14 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
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
          v15 = -[TLKMultilineText countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
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

- (void)setMoreButtonText:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (self->_moreButtonText != v10)
  {
    objc_storeStrong((id *)&self->_moreButtonText, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setFootnoteButtonText:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (self->_footnoteButtonText != v10)
  {
    objc_storeStrong((id *)&self->_footnoteButtonText, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setTrailingFootnoteButtonText:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (self->_trailingFootnoteButtonText != v10)
  {
    objc_storeStrong((id *)&self->_trailingFootnoteButtonText, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setImage:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TLKImage *v10;

  v10 = (TLKImage *)a3;
  if (self->_image != v10)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)observedPropertiesChanged
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  TLKStackView *v15;
  void *v16;
  void *v17;
  TLKStackView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _BOOL8 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];

  v55[3] = *MEMORY[0x1E0C80C00];
  -[TLKDescriptionView text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKDescriptionView detailsTextView](self, "detailsTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMultilineText:", v6);

  -[TLKDescriptionView footnoteButtonText](self, "footnoteButtonText");
  v8 = objc_claimAutoreleasedReturnValue();
  -[TLKDescriptionView trailingFootnoteButtonText](self, "trailingFootnoteButtonText");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!(v8 | v9))
    goto LABEL_7;
  -[TLKDescriptionView footnoteButtonStackView](self, "footnoteButtonStackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[TLKFontUtilities shortFootnoteFont](TLKFontUtilities, "shortFootnoteFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setFont:", v11);
    objc_msgSend(v3, "setContentHorizontalAlignment:", 4);
    LODWORD(v12) = 1148846080;
    objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v12);
    objc_msgSend(v3, "addTarget:action:", self, sel_footnoteButtonPressed);
    -[TLKDescriptionView setFootnoteButton:](self, "setFootnoteButton:", v3);
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setFont:", v11);
    objc_msgSend(v4, "setContentHorizontalAlignment:", 5);
    LODWORD(v13) = 1148846080;
    objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 0, v13);
    objc_msgSend(v4, "addTarget:action:", self, sel_trailingFootnoteButtonPressed_);
    -[TLKDescriptionView setTrailingFootnoteButton:](self, "setTrailingFootnoteButton:", v4);
    v14 = (void *)objc_opt_new();
    -[TLKDescriptionView setFootnoteButtonStackDummyView:](self, "setFootnoteButtonStackDummyView:", v14);

    v15 = [TLKStackView alloc];
    -[TLKDescriptionView footnoteButtonStackDummyView](self, "footnoteButtonStackDummyView", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v16;
    v55[2] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NUIContainerStackView initWithArrangedSubviews:](v15, "initWithArrangedSubviews:", v17);
    -[TLKDescriptionView setFootnoteButtonStackView:](self, "setFootnoteButtonStackView:", v18);

    -[TLKDescriptionView footnoteButtonStackView](self, "footnoteButtonStackView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFlipsToVerticalAxisForAccessibilityContentSizes:", 1);

    -[TLKDescriptionView stackView](self, "stackView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKDescriptionView footnoteButtonStackView](self, "footnoteButtonStackView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addArrangedSubview:", v21);

  }
  -[TLKDescriptionView footnoteButton](self, "footnoteButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTitle:", v8);

  -[TLKDescriptionView trailingFootnoteButton](self, "trailingFootnoteButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v9);

  if (v8)
  {
    -[TLKDescriptionView delegate](self, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[TLKDescriptionView delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKDescriptionView footnoteButton](self, "footnoteButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v3, "configureMenuForFootnoteButton:", v4);
      v24 = 1;
    }
    else
    {
      v24 = 0;
      v23 = 0;
    }
  }
  else
  {
LABEL_7:
    v24 = 0;
    v23 = 0;
  }
  -[TLKDescriptionView footnoteButton](self, "footnoteButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setShowsMenuAsPrimaryAction:", v23);

  if (v24)
  {

  }
  if (v8)

  if (v9)
  {
    -[TLKDescriptionView delegate](self, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[TLKDescriptionView delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKDescriptionView trailingFootnoteButton](self, "trailingFootnoteButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v3, "configureMenuForTrailingFootnoteButton:", v4);
      v27 = 1;
    }
    else
    {
      v27 = 0;
      v26 = 0;
    }
  }
  else
  {
    v27 = 0;
    v26 = 0;
  }
  -[TLKDescriptionView trailingFootnoteButton](self, "trailingFootnoteButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setShowsMenuAsPrimaryAction:", v26);

  if (v27)
  {

  }
  if (v9)

  v29 = v8 == 0;
  -[TLKDescriptionView footnoteButtonStackView](self, "footnoteButtonStackView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setHidden:", (v8 | v9) == 0);

  -[TLKDescriptionView footnoteButtonStackView](self, "footnoteButtonStackView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "axis") == 1;
  -[TLKDescriptionView footnoteButtonStackDummyView](self, "footnoteButtonStackDummyView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setHidden:", v32);

  -[TLKDescriptionView footnoteButton](self, "footnoteButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setHidden:", v29);

  -[TLKDescriptionView trailingFootnoteButton](self, "trailingFootnoteButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setHidden:", v9 == 0);

  -[TLKDescriptionView text](self, "text");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "maxLines");
  if (v37)
  {
    -[TLKDescriptionView moreButtonText](self, "moreButtonText");
    v29 = objc_claimAutoreleasedReturnValue();
    v38 = v29 == 0;
  }
  else
  {
    v38 = 1;
  }
  -[TLKDescriptionView moreButton](self, "moreButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setHidden:", v38);

  if (v37)
  -[TLKDescriptionView moreButtonText](self, "moreButtonText");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKDescriptionView moreButton](self, "moreButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTitle:", v40);

  -[TLKDescriptionView image](self, "image");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKDescriptionView imageView](self, "imageView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setHidden:", v42 == 0);

  -[TLKDescriptionView image](self, "image");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKDescriptionView imageView](self, "imageView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setTlkImage:", v44);

  -[TLKDescriptionView title](self, "title");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKDescriptionView titleLabel](self, "titleLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setHidden:", v46 == 0);

  -[TLKDescriptionView title](self, "title");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "text");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKDescriptionView titleLabel](self, "titleLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setText:", v49);

  -[TLKDescriptionView imageViewExclusionPath](self, "imageViewExclusionPath");
  v51 = objc_claimAutoreleasedReturnValue();
  if (!v51
    || (v52 = (void *)v51,
        -[TLKDescriptionView image](self, "image"),
        v53 = (void *)objc_claimAutoreleasedReturnValue(),
        v53,
        v52,
        !v53))
  {
    -[TLKDescriptionView setImageViewExclusionPath:](self, "setImageViewExclusionPath:", 0);
  }
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKDescriptionView setMoreButtonExclusionPath:](self, "setMoreButtonExclusionPath:", v54);

  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (id)viewForFirstBaselineLayout
{
  void *v3;
  void *v4;
  void *v5;

  -[TLKDescriptionView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isHidden"))
  {
    -[TLKDescriptionView imageAndDescriptionBoxView](self, "imageAndDescriptionBoxView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewForFirstBaselineLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TLKDescriptionView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (UIEdgeInsets)defaultBaselineRelativeLayoutMargins
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
  char v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  UIEdgeInsets result;

  v23.receiver = self;
  v23.super_class = (Class)TLKDescriptionView;
  -[TLKView defaultBaselineRelativeLayoutMargins](&v23, sel_defaultBaselineRelativeLayoutMargins);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TLKDescriptionView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isHidden") & 1) != 0)
  {
    -[TLKDescriptionView imageView](self, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isHidden");

    if ((v13 & 1) == 0)
    {
      -[TLKDescriptionView detailsTextView](self, "detailsTextView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "font");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ascender");
      +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self);
      v17 = v16;

      objc_msgSend((id)objc_opt_class(), "defaultLayoutMargins");
      v4 = v17 + v18;
    }
  }
  else
  {

  }
  v19 = v4;
  v20 = v6;
  v21 = v8;
  v22 = v10;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  CGFloat height;
  double width;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[7];
  CGRect v33;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  -[TLKDescriptionView imageView](self, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __85__TLKDescriptionView_containerView_willMeasureArrangedSubviewsFittingSize_forReason___block_invoke;
  v32[3] = &unk_1E5C07128;
  v32[4] = self;
  *(double *)&v32[5] = width;
  *(CGFloat *)&v32[6] = height;
  objc_msgSend(v10, "performBatchUpdates:", v32);

  -[TLKDescriptionView imageAndDescriptionBoxView](self, "imageAndDescriptionBoxView");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!a5 && v11 == v9)
  {
    -[TLKDescriptionView image](self, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[TLKDescriptionView imageView](self, "imageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "intrinsicContentSize");
      v15 = v14;
      v17 = v16;

      -[TLKDescriptionView detailsTextView](self, "detailsTextView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "font");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = *MEMORY[0x1E0C9D648];
      v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v22 = v15 + 10.0;
      +[TLKLayoutUtilities scaledValueForValue:withFont:view:](TLKLayoutUtilities, "scaledValueForValue:withFont:view:", v19, self, 16.0);
      v24 = v17 + v23;
      objc_msgSend(v19, "capHeight");
      +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self);
      v26 = v24 - v25;
      if (!+[TLKLayoutUtilities isLTR](TLKLayoutUtilities, "isLTR"))
      {
        v33.origin.x = v21;
        v33.origin.y = v20;
        v33.size.width = v22;
        v33.size.height = v26;
        +[TLKLayoutUtilities ceilingValue:inView:](TLKLayoutUtilities, "ceilingValue:inView:", self, width - CGRectGetWidth(v33));
        v21 = v27;
      }
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v21, v20, v22, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKDescriptionView setImageViewExclusionPath:](self, "setImageViewExclusionPath:", v28);

    }
    -[TLKDescriptionView detailsTextView](self, "detailsTextView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "textContainer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKDescriptionView setExclusionPathInContainer:includeMoreButton:](self, "setExclusionPathInContainer:includeMoreButton:", v30, 0);

    -[TLKDescriptionView detailsTextView](self, "detailsTextView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "invalidateIntrinsicContentSize");

    objc_msgSend(v9, "invalidateIntrinsicContentSize");
  }

}

void __85__TLKDescriptionView_containerView_willMeasureArrangedSubviewsFittingSize_forReason___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMaximumLayoutSize:", v1, 1.79769313e308);

}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double Height;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  uint64_t rect;
  CGFloat recta;
  _QWORD v53[7];
  _QWORD v54[7];
  uint64_t v55;
  double *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double *v64;
  uint64_t v65;
  uint64_t v66;
  CGRect v67;
  CGRect v68;

  v4 = a3;
  -[TLKDescriptionView imageAndDescriptionBoxView](self, "imageAndDescriptionBoxView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[TLKDescriptionView detailsTextView](self, "detailsTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKDescriptionView moreButtonText](self, "moreButtonText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = -[TLKDescriptionView shouldHideMoreButtonForTextView:](self, "shouldHideMoreButtonForTextView:", v6);
      -[TLKDescriptionView moreButton](self, "moreButton");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v9, "setHidden:", v8);

      -[TLKDescriptionView moreButton](self, "moreButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = objc_msgSend(v10, "isHidden");

      if ((v9 & 1) != 0)
      {
        objc_msgSend(v6, "textContainer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLKDescriptionView setExclusionPathInContainer:includeMoreButton:](self, "setExclusionPathInContainer:includeMoreButton:", v11, 0);
      }
      else
      {
        objc_msgSend(v6, "layoutManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "textContainer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "glyphRangeForTextContainer:", v12);
        v15 = v14;

        v63 = 0;
        v64 = (double *)&v63;
        v65 = 0x2020000000;
        v66 = 0;
        v59 = 0;
        v60 = (double *)&v59;
        v61 = 0x2020000000;
        v62 = 0;
        v55 = 0;
        v56 = (double *)&v55;
        v57 = 0x2020000000;
        v58 = 0;
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __61__TLKDescriptionView_containerViewDidLayoutArrangedSubviews___block_invoke;
        v54[3] = &unk_1E5C07150;
        v54[4] = &v63;
        v54[5] = &v59;
        v54[6] = &v55;
        objc_msgSend(v11, "enumerateLineFragmentsForGlyphRange:usingBlock:", v13, v15, v54);
        v16 = +[TLKLayoutUtilities isLTR](TLKLayoutUtilities, "isLTR");
        -[TLKDescriptionView moreButton](self, "moreButton");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLKDescriptionView moreButton](self, "moreButton");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "titleLabel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "frame");
        objc_msgSend(v17, "convertRect:toView:", v6);
        v21 = v20;
        v23 = v22;
        v25 = v24;
        rect = v26;

        v27 = -3.0;
        if (v16)
          v27 = 3.0;
        objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v21 - v27, v64[3], v23 + 3.0, v25, rect);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLKDescriptionView setMoreButtonExclusionPath:](self, "setMoreButtonExclusionPath:", v28);

        objc_msgSend(v6, "textContainer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLKDescriptionView setExclusionPathInContainer:includeMoreButton:](self, "setExclusionPathInContainer:includeMoreButton:", v29, 1);

        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __61__TLKDescriptionView_containerViewDidLayoutArrangedSubviews___block_invoke_2;
        v53[3] = &unk_1E5C07150;
        v53[4] = &v63;
        v53[5] = &v59;
        v53[6] = &v55;
        objc_msgSend(v11, "enumerateLineFragmentsForGlyphRange:usingBlock:", v13, v15, v53);
        -[TLKDescriptionView moreButton](self, "moreButton");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "frame");
        v32 = v31;
        v34 = v33;
        v36 = v35;
        v38 = v37;

        v39 = v64[3];
        v67.origin.x = v32;
        v67.origin.y = v34;
        v67.size.width = v36;
        v67.size.height = v38;
        Height = CGRectGetHeight(v67);
        v68.origin.x = v21;
        v68.origin.y = recta;
        v68.size.width = v23;
        v68.size.height = v25;
        v41 = CGRectGetHeight(v68);
        objc_msgSend(v6, "frame");
        v43 = v42;
        if (v16)
        {
          v44 = v60[3] + v56[3];
          v45 = 3.0;
        }
        else
        {
          v44 = v56[3] - v36;
          v45 = -3.0;
        }
        +[TLKLayoutUtilities roundedValue:inView:](TLKLayoutUtilities, "roundedValue:inView:", self, v44 + v45);
        v47 = v46;
        +[TLKLayoutUtilities ceilingValue:inView:](TLKLayoutUtilities, "ceilingValue:inView:", self, v39 + (Height - v41) * -0.5 + v43);
        v49 = v48;
        -[TLKDescriptionView moreButton](self, "moreButton");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setFrame:", v47, v49, v36, v38);

        _Block_object_dispose(&v55, 8);
        _Block_object_dispose(&v59, 8);
        _Block_object_dispose(&v63, 8);
      }

    }
  }

}

_QWORD *__61__TLKDescriptionView_containerViewDidLayoutArrangedSubviews___block_invoke(_QWORD *result, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  *(double *)(*(_QWORD *)(result[4] + 8) + 24) = a3;
  *(double *)(*(_QWORD *)(result[5] + 8) + 24) = a8;
  *(double *)(*(_QWORD *)(result[6] + 8) + 24) = a6;
  return result;
}

_QWORD *__61__TLKDescriptionView_containerViewDidLayoutArrangedSubviews___block_invoke_2(_QWORD *result, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (floor(a8) > 1.0)
  {
    *(double *)(*(_QWORD *)(result[4] + 8) + 24) = a3;
    *(double *)(*(_QWORD *)(result[5] + 8) + 24) = a8;
    *(double *)(*(_QWORD *)(result[6] + 8) + 24) = a6;
  }
  return result;
}

- (void)setExclusionPathInContainer:(id)a3 includeMoreButton:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = a4;
  v12 = a3;
  -[TLKDescriptionView imageViewExclusionPath](self, "imageViewExclusionPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TLKDescriptionView moreButtonExclusionPath](self, "moreButtonExclusionPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_alloc(MEMORY[0x1E0C99D20]);
  if (v6)
    v9 = objc_msgSend(v8, "initWithObjects:", v6, v7, 0);
  else
    v9 = objc_msgSend(v8, "initWithObjects:", v7, 0, v11);
  v10 = (void *)v9;
  objc_msgSend(v12, "setExclusionPaths:", v9);

}

- (CGSize)textSizeForTextView:(id)a3 width:(double)a4 lineCount:(unint64_t)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  v8 = (objc_class *)MEMORY[0x1E0DC33E0];
  v9 = a3;
  v10 = [v8 alloc];
  objc_msgSend(v9, "attributedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithAttributedString:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC33D8]), "initWithSize:", a4, 3.40282347e38);
  v14 = objc_alloc_init(MEMORY[0x1E0DC33A8]);
  objc_msgSend(v14, "addTextContainer:", v13);
  objc_msgSend(v12, "addLayoutManager:", v14);
  objc_msgSend(v13, "setMaximumNumberOfLines:", a5);
  objc_msgSend(v9, "textContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lineFragmentPadding");
  objc_msgSend(v13, "setLineFragmentPadding:");

  objc_msgSend(v9, "textContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineBreakMode:", objc_msgSend(v16, "lineBreakMode"));

  -[TLKDescriptionView setExclusionPathInContainer:includeMoreButton:](self, "setExclusionPathInContainer:includeMoreButton:", v13, 0);
  objc_msgSend(v14, "ensureLayoutForTextContainer:", v13);
  objc_msgSend(v14, "usedRectForTextContainer:", v13);
  v18 = v17;
  +[TLKLayoutUtilities flooredValue:inView:](TLKLayoutUtilities, "flooredValue:inView:", v9, v19);
  v21 = v20;

  v22 = v18;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (BOOL)shouldHideMoreButtonForTextView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  objc_msgSend(v4, "textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "maximumNumberOfLines");

  if (v6 && (objc_msgSend(v4, "frame"), v8 != 0.0))
  {
    -[TLKDescriptionView textSizeForTextView:width:lineCount:](self, "textSizeForTextView:width:lineCount:", v4, 0, v7);
    v11 = v10;
    objc_msgSend(v4, "frame");
    v9 = v11 <= v12;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)moreButtonPressed
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[TLKDescriptionView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[TLKDescriptionView detailsTextView](self, "detailsTextView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKDescriptionView setExclusionPathInContainer:includeMoreButton:](self, "setExclusionPathInContainer:includeMoreButton:", v6, 0);

    -[TLKDescriptionView text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaxLines:", 0);

    -[TLKDescriptionView detailsTextView](self, "detailsTextView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateIntrinsicContentSize");

    -[TLKDescriptionView delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didPressMoreButton");

  }
}

- (void)footnoteButtonPressed
{
  void *v3;
  char v4;
  id v5;

  -[TLKDescriptionView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[TLKDescriptionView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didPressFootnoteButton");

  }
}

- (void)trailingFootnoteButtonPressed:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TLKDescriptionView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[TLKDescriptionView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didPressTrailingFootnoteButton:", v7);

  }
}

- (id)detailTextViewText
{
  void *v2;
  void *v3;

  -[TLKDescriptionView detailsTextView](self, "detailsTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)numberOfLines
{
  void *v2;
  void *v3;
  int64_t v4;

  -[TLKDescriptionView detailsTextView](self, "detailsTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maximumNumberOfLines");

  return v4;
}

- (BOOL)moreButtonIsHidden
{
  void *v2;
  char v3;

  -[TLKDescriptionView moreButton](self, "moreButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (id)exclusionPathsForTextView
{
  void *v2;
  void *v3;
  void *v4;

  -[TLKDescriptionView detailsTextView](self, "detailsTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exclusionPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (TLKImage)image
{
  return self->_image;
}

- (TLKMultilineText)text
{
  return self->_text;
}

- (TLKMultilineText)title
{
  return self->_title;
}

- (NSString)footnoteButtonText
{
  return self->_footnoteButtonText;
}

- (NSString)trailingFootnoteButtonText
{
  return self->_trailingFootnoteButtonText;
}

- (NSString)moreButtonText
{
  return self->_moreButtonText;
}

- (TLKDescriptionViewDelegate)delegate
{
  return (TLKDescriptionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TLKStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (TLKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (TLKTextView)detailsTextView
{
  return self->_detailsTextView;
}

- (void)setDetailsTextView:(id)a3
{
  objc_storeStrong((id *)&self->_detailsTextView, a3);
}

- (TLKTextButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_moreButton, a3);
}

- (TLKImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (NUIContainerBoxView)imageAndDescriptionBoxView
{
  return self->_imageAndDescriptionBoxView;
}

- (void)setImageAndDescriptionBoxView:(id)a3
{
  objc_storeStrong((id *)&self->_imageAndDescriptionBoxView, a3);
}

- (UIBezierPath)imageViewExclusionPath
{
  return self->_imageViewExclusionPath;
}

- (void)setImageViewExclusionPath:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewExclusionPath, a3);
}

- (UIBezierPath)moreButtonExclusionPath
{
  return self->_moreButtonExclusionPath;
}

- (void)setMoreButtonExclusionPath:(id)a3
{
  objc_storeStrong((id *)&self->_moreButtonExclusionPath, a3);
}

- (TLKTextButton)footnoteButton
{
  return self->_footnoteButton;
}

- (void)setFootnoteButton:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteButton, a3);
}

- (TLKTextButton)trailingFootnoteButton
{
  return self->_trailingFootnoteButton;
}

- (void)setTrailingFootnoteButton:(id)a3
{
  objc_storeStrong((id *)&self->_trailingFootnoteButton, a3);
}

- (TLKStackView)footnoteButtonStackView
{
  return self->_footnoteButtonStackView;
}

- (void)setFootnoteButtonStackView:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteButtonStackView, a3);
}

- (UIView)footnoteButtonStackDummyView
{
  return self->_footnoteButtonStackDummyView;
}

- (void)setFootnoteButtonStackDummyView:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteButtonStackDummyView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnoteButtonStackDummyView, 0);
  objc_storeStrong((id *)&self->_footnoteButtonStackView, 0);
  objc_storeStrong((id *)&self->_trailingFootnoteButton, 0);
  objc_storeStrong((id *)&self->_footnoteButton, 0);
  objc_storeStrong((id *)&self->_moreButtonExclusionPath, 0);
  objc_storeStrong((id *)&self->_imageViewExclusionPath, 0);
  objc_storeStrong((id *)&self->_imageAndDescriptionBoxView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_detailsTextView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_moreButtonText, 0);
  objc_storeStrong((id *)&self->_trailingFootnoteButtonText, 0);
  objc_storeStrong((id *)&self->_footnoteButtonText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
