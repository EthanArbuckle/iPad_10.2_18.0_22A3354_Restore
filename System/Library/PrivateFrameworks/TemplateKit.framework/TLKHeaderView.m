@implementation TLKHeaderView

- (id)setupContentView
{
  void *v3;
  TLKStackView *v4;
  void *v5;
  TLKStackView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TLKStackView *v14;
  void *v15;
  TLKStackView *v16;
  TLKStackView *v17;
  void *v18;
  TLKStackView *v19;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v22 = (void *)objc_opt_new();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v22);
  -[TLKHeaderView setImageView:](self, "setImageView:", v22);
  v21 = (void *)objc_opt_new();
  -[TLKHeaderView setTitleLabel:](self, "setTitleLabel:", v21);
  v3 = (void *)objc_opt_new();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v3);
  -[TLKHeaderView setSubtitleImageView:](self, "setSubtitleImageView:", v3);
  +[TLKLabel secondaryLabel](TLKLabel, "secondaryLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKHeaderView setSubtitleLabel:](self, "setSubtitleLabel:");
  v4 = [TLKStackView alloc];
  v26[0] = v3;
  v26[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NUIContainerStackView initWithArrangedSubviews:](v4, "initWithArrangedSubviews:", v5);

  -[TLKStackView setAlignment:](v6, "setAlignment:", 3);
  -[NUIContainerStackView setSpacing:](v6, "setSpacing:", 8.0);
  +[TLKView makeContainerShadowCompatible:](TLKView, "makeContainerShadowCompatible:", v6);
  -[TLKHeaderView setSubtitleStackView:](self, "setSubtitleStackView:", v6);
  -[TLKHeaderView setAxis:](self, "setAxis:", 1);
  +[TLKLabel tertiaryLabel](TLKLabel, "tertiaryLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKFontUtilities shortFootnoteFont](TLKFontUtilities, "shortFootnoteFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  -[TLKHeaderView setFootnoteLabel:](self, "setFootnoteLabel:", v7);
  v9 = (void *)objc_opt_new();
  -[TLKHeaderView setTrailingTextLabel:](self, "setTrailingTextLabel:", v9);
  -[TLKHeaderView trailingTextLabel](self, "trailingTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 2);

  objc_msgSend(MEMORY[0x1E0DC37E8], "_thinSystemFontOfSize:", 60.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKHeaderView trailingTextLabel](self, "trailingTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  -[TLKHeaderView trailingTextLabel](self, "trailingTextLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v13);

  v14 = [TLKStackView alloc];
  v25[0] = v21;
  v25[1] = v6;
  v25[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NUIContainerStackView initWithArrangedSubviews:](v14, "initWithArrangedSubviews:", v15);

  -[TLKStackView setAxis:](v16, "setAxis:", 1);
  -[NUIContainerStackView setCustomSpacing:afterView:](v16, "setCustomSpacing:afterView:", v6, 2.0);
  +[TLKView makeContainerShadowCompatible:](TLKView, "makeContainerShadowCompatible:", v16);
  -[TLKHeaderView setInnerStackView:](self, "setInnerStackView:", v16);
  v17 = [TLKStackView alloc];
  v24[0] = v22;
  v24[1] = v16;
  v24[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NUIContainerStackView initWithArrangedSubviews:](v17, "initWithArrangedSubviews:", v18);

  -[TLKStackView setDelegate:](v19, "setDelegate:", self);
  -[TLKStackView setAlignment:](v19, "setAlignment:", 3);
  -[NUIContainerStackView setSpacing:](v19, "setSpacing:", 12.0);

  return v19;
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

- (void)setSubtitle:(id)a3
{
  id v5;
  TLKRichText **p_subtitle;
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
  p_subtitle = &self->_subtitle;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_subtitle, "setObserver:", 0);
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
      v7 = *p_subtitle;
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
  objc_storeStrong((id *)&self->_subtitle, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_subtitle, "setObserver:", self);
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
      v13 = *p_subtitle;
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

- (void)setFootnote:(id)a3
{
  id v5;
  TLKMultilineText **p_footnote;
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
  p_footnote = &self->_footnote;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_footnote, "setObserver:", 0);
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
      v7 = *p_footnote;
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
  objc_storeStrong((id *)&self->_footnote, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_footnote, "setObserver:", self);
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
      v13 = *p_footnote;
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

- (void)setTrailingText:(id)a3
{
  id v5;
  TLKMultilineText **p_trailingText;
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
  p_trailingText = &self->_trailingText;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_trailingText, "setObserver:", 0);
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
      v7 = *p_trailingText;
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
  objc_storeStrong((id *)&self->_trailingText, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_trailingText, "setObserver:", self);
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
      v13 = *p_trailingText;
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

- (void)setSubtitleImage:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TLKImage *v10;

  v10 = (TLKImage *)a3;
  if (self->_subtitleImage != v10)
  {
    objc_storeStrong((id *)&self->_subtitleImage, a3);
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

- (void)setRoundedBorderText:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (self->_roundedBorderText != v10)
  {
    objc_storeStrong((id *)&self->_roundedBorderText, a3);
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

- (void)setAxis:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_axis != a3)
  {
    self->_axis = a3;
    -[TLKView observer](self, "observer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TLKView observer](self, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "batchUpdateCount");

      if (!v7)
      {
        -[TLKView observer](self, "observer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertiesDidChange");

      }
    }
  }
}

- (void)observedPropertiesChanged
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  int v41;
  _BOOL8 v42;
  id *v43;
  id *v44;
  int v45;
  id v46;
  id *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  TLKRoundedCornerLabel *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _BOOL8 v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  char v101;
  double v102;
  double v103;
  _BOOL4 v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  BOOL v115;
  void *v116;
  BOOL v117;
  _QWORD v118[5];
  BOOL v119;
  _QWORD v120[5];
  BOOL v121;
  _QWORD v122[5];
  id v123;
  id v124;
  _QWORD v125[5];
  _QWORD v126[5];
  id v127;
  id v128;
  _QWORD v129[5];
  char v130;

  v3 = -[TLKHeaderView axis](self, "axis");
  if (v3 == 1)
  {
    v115 = 1;
    v4 = 1;
  }
  else
  {
    -[TLKHeaderView trailingText](self, "trailingText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v6 == 0;

    v4 = 4;
  }
  -[TLKHeaderView footnote](self, "footnote");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  -[TLKHeaderView innerStackView](self, "innerStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v117 = v8;
  if (v3 != 1)
  {
    objc_msgSend(v9, "setAlignment:", 1);

    -[TLKHeaderView innerStackView](self, "innerStackView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "arrangedSubviews");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKHeaderView imageView](self, "imageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "containsObject:", v25);

    if (v26)
    {
      -[TLKHeaderView innerStackView](self, "innerStackView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKHeaderView imageView](self, "imageView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeArrangedSubview:", v28);

    }
    -[TLKView contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "arrangedSubviews");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKHeaderView imageView](self, "imageView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "containsObject:", v31);

    if ((v32 & 1) == 0)
    {
      -[TLKView contentView](self, "contentView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKHeaderView imageView](self, "imageView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "insertArrangedSubview:atIndex:", v34, 0);

    }
    -[TLKView contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKHeaderView imageView](self, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAlignment:forView:inAxis:", 1, v22, 1);
    goto LABEL_14;
  }
  objc_msgSend(v9, "setAlignment:", 3);

  -[TLKView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrangedSubviews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKHeaderView imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if (v14)
  {
    -[TLKView contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKHeaderView imageView](self, "imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeArrangedSubview:", v16);

  }
  -[TLKHeaderView innerStackView](self, "innerStackView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrangedSubviews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKHeaderView imageView](self, "imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "containsObject:", v19);

  if ((v20 & 1) == 0)
  {
    -[TLKHeaderView innerStackView](self, "innerStackView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKHeaderView imageView](self, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "insertArrangedSubview:atIndex:", v22, 0);
LABEL_14:

  }
  -[TLKHeaderView footnoteLabel](self, "footnoteLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTextAlignment:", v4);

  -[TLKHeaderView subtitleLabel](self, "subtitleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTextAlignment:", v4);

  -[TLKHeaderView titleLabel](self, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTextAlignment:", v4);

  -[TLKHeaderView image](self, "image");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v37) = v38 == 0;

  -[TLKHeaderView imageView](self, "imageView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = MEMORY[0x1E0C809B0];
  v129[0] = MEMORY[0x1E0C809B0];
  v129[1] = 3221225472;
  v129[2] = __42__TLKHeaderView_observedPropertiesChanged__block_invoke;
  v129[3] = &unk_1E5C06FC8;
  v129[4] = self;
  v130 = (char)v37;
  objc_msgSend(v39, "performBatchUpdates:", v129);

  v41 = TLKSnippetModernizationEnabled();
  if (v41)
    v42 = +[TLKUtilities isMacOS](TLKUtilities, "isMacOS");
  else
    v42 = 0;
  v43 = (id *)MEMORY[0x1E0DC4B58];
  v44 = (id *)MEMORY[0x1E0DC4AE8];
  v45 = v3 == 1 || v42;
  if (!v41)
    v44 = (id *)MEMORY[0x1E0DC4B60];
  if (!v45)
    v43 = v44;
  v46 = *v43;
  if (v3 == 1)
  {
    v47 = (id *)MEMORY[0x1E0DC4AD0];
  }
  else if (v41 && +[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
  {
    v47 = (id *)MEMORY[0x1E0DC4A90];
  }
  else
  {
    v47 = (id *)MEMORY[0x1E0DC4B10];
  }
  v48 = *v47;
  v116 = v46;
  +[TLKFontUtilities cachedFontForTextStyle:isBold:isMacStyle:](TLKFontUtilities, "cachedFontForTextStyle:isBold:isMacStyle:", v46);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v48;
  +[TLKFontUtilities cachedFontForTextStyle:isBold:isMacStyle:](TLKFontUtilities, "cachedFontForTextStyle:isBold:isMacStyle:", v48, 0, v42);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKHeaderView titleLabel](self, "titleLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v126[0] = v40;
  v126[1] = 3221225472;
  v126[2] = __42__TLKHeaderView_observedPropertiesChanged__block_invoke_2;
  v126[3] = &unk_1E5C06FF0;
  v126[4] = self;
  v52 = v50;
  v127 = v52;
  v53 = v49;
  v128 = v53;
  objc_msgSend(v51, "performBatchUpdates:", v126);

  -[TLKHeaderView subtitleImageView](self, "subtitleImageView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v125[0] = v40;
  v125[1] = 3221225472;
  v125[2] = __42__TLKHeaderView_observedPropertiesChanged__block_invoke_3;
  v125[3] = &unk_1E5C06E18;
  v125[4] = self;
  objc_msgSend(v54, "performBatchUpdates:", v125);

  -[TLKHeaderView subtitleLabel](self, "subtitleLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v40;
  v122[1] = 3221225472;
  v122[2] = __42__TLKHeaderView_observedPropertiesChanged__block_invoke_4;
  v122[3] = &unk_1E5C06FF0;
  v122[4] = self;
  v56 = v53;
  v123 = v56;
  v57 = v52;
  v124 = v57;
  objc_msgSend(v55, "performBatchUpdates:", v122);

  v58 = 4.0;
  if (v42)
    v58 = 2.5;
  if (!v41)
    v58 = 0.5;
  if (v3 == 1)
    v58 = 1.5;
  +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, v58);
  v60 = v59;
  -[TLKHeaderView innerStackView](self, "innerStackView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setSpacing:", v60);

  -[TLKHeaderView roundedBorderText](self, "roundedBorderText");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKHeaderView roundedCornerLabel](self, "roundedCornerLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setHidden:", v62 == 0);

  -[TLKHeaderView roundedBorderText](self, "roundedBorderText");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    -[TLKHeaderView roundedCornerLabel](self, "roundedCornerLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v65)
    {
      v66 = -[TLKRoundedCornerLabel initWithProminence:]([TLKRoundedCornerLabel alloc], "initWithProminence:", 1);
      -[TLKHeaderView setRoundedCornerLabel:](self, "setRoundedCornerLabel:", v66);

      -[TLKHeaderView roundedCornerLabel](self, "roundedCornerLabel");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setSizeConfiguration:", 1);

      -[TLKHeaderView roundedCornerLabel](self, "roundedCornerLabel");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v68);

      -[TLKHeaderView subtitleStackView](self, "subtitleStackView");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKHeaderView roundedCornerLabel](self, "roundedCornerLabel");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addArrangedSubview:", v70);

    }
    -[TLKHeaderView roundedBorderText](self, "roundedBorderText");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKHeaderView roundedCornerLabel](self, "roundedCornerLabel");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "label");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setText:", v71);

  }
  -[TLKHeaderView subtitle](self, "subtitle");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = 0;
  }
  else
  {
    -[TLKHeaderView subtitleImage](self, "subtitleImage");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v63 == 0;
  }
  -[TLKHeaderView subtitleStackView](self, "subtitleStackView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setHidden:", v74);

  if (!v73)
  -[TLKHeaderView footnoteLabel](self, "footnoteLabel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v40;
  v120[1] = 3221225472;
  v120[2] = __42__TLKHeaderView_observedPropertiesChanged__block_invoke_5;
  v120[3] = &unk_1E5C06FC8;
  v120[4] = self;
  v121 = v117;
  objc_msgSend(v76, "performBatchUpdates:", v120);

  -[TLKHeaderView trailingTextLabel](self, "trailingTextLabel");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v40;
  v118[1] = 3221225472;
  v118[2] = __42__TLKHeaderView_observedPropertiesChanged__block_invoke_6;
  v118[3] = &unk_1E5C06FC8;
  v118[4] = self;
  v119 = v115;
  objc_msgSend(v77, "performBatchUpdates:", v118);

  -[TLKHeaderView innerStackView](self, "innerStackView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "viewForFirstBaselineLayout");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKHeaderView titleLabel](self, "titleLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v56;
  if (v79 == v80)
  {
    -[TLKHeaderView titleLabel](self, "titleLabel");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "font");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v82 = 0;
  }

  -[TLKHeaderView innerStackView](self, "innerStackView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "viewForLastBaselineLayout");
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  -[TLKHeaderView subtitleLabel](self, "subtitleLabel");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "font");
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v85, "font");
    v88 = objc_claimAutoreleasedReturnValue();

    v87 = (void *)v88;
  }
  objc_msgSend(v82, "ascender");
  v90 = v89;
  objc_msgSend(v82, "capHeight");
  v92 = v90 - v91;
  objc_msgSend(v87, "descender");
  +[TLKLayoutUtilities deviceScaledFlooredValue:forView:](TLKLayoutUtilities, "deviceScaledFlooredValue:forView:", self);
  v94 = -v93;
  -[TLKHeaderView innerStackView](self, "innerStackView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setCustomAlignmentRectInsets:", v92, 0.0, v94, 0.0);

  objc_msgSend((id)objc_opt_class(), "defaultLayoutMargins");
  v98 = v97;
  v100 = v99;
  v101 = v41 ^ 1;
  if (v3 == 1)
  {
    v101 = 1;
    v102 = 25.0;
  }
  else
  {
    v102 = v96;
  }
  if ((v101 & 1) == 0)
  {
    if (+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
      v102 = 13.0;
    else
      v102 = 22.5;
  }
  v103 = v102;
  if (v41)
  {
    v104 = +[TLKUtilities isMacOS](TLKUtilities, "isMacOS", v102);
    v103 = 19.5;
    if (v104)
      v103 = 14.0;
  }
  +[TLKLayoutUtilities deviceScaledRoundedInsets:forView:](TLKLayoutUtilities, "deviceScaledRoundedInsets:forView:", self, v103, v98, v102, v100);
  v106 = v105;
  v108 = v107;
  v110 = v109;
  v112 = v111;
  -[TLKView contentView](self, "contentView");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setLayoutMargins:", v106, v108, v110, v112);

  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

void __42__TLKHeaderView_observedPropertiesChanged__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTlkImage:", v2);

  v4 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

}

void __42__TLKHeaderView_observedPropertiesChanged__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", v2 == 0);

  objc_msgSend(*(id *)(a1 + 32), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMultilineText:", v4);

  v6 = objc_msgSend(*(id *)(a1 + 32), "subtitleIsEmphasized");
  v7 = 48;
  if (v6)
    v7 = 40;
  v8 = *(_QWORD *)(a1 + v7);
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  v10 = objc_msgSend(*(id *)(a1 + 32), "subtitleIsEmphasized");
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProminence:", v10);

}

void __42__TLKHeaderView_observedPropertiesChanged__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "subtitleImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subtitleImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", v2 == 0);

  objc_msgSend(*(id *)(a1 + 32), "subtitleImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subtitleImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTlkImage:", v5);

}

void __42__TLKHeaderView_observedPropertiesChanged__block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;
  objc_msgSend(*(id *)(a1 + 32), "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  objc_msgSend(*(id *)(a1 + 32), "roundedBorderText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 0;
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "subtitleImage");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = 0;
      v7 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "subtitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "maxLines");
      v6 = 1;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMaxLines:", v7);

  if (v6)
  if (!v5)

  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRichText:", v9);

  v11 = objc_msgSend(*(id *)(a1 + 32), "subtitleIsEmphasized");
  v12 = 48;
  if (v11)
    v12 = 40;
  v13 = *(_QWORD *)(a1 + v12);
  objc_msgSend(*(id *)(a1 + 32), "subtitleLabel");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v13);

}

void __42__TLKHeaderView_observedPropertiesChanged__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "footnoteLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", v2);

  objc_msgSend(*(id *)(a1 + 32), "footnote");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "footnoteLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMultilineText:", v5);

}

void __42__TLKHeaderView_observedPropertiesChanged__block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "trailingTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", v2);

  objc_msgSend(*(id *)(a1 + 32), "trailingText");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "trailingTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMultilineText:", v5);

}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  void *v6;
  _QWORD v7[4];
  id v8;

  if (!+[TLKUtilities isMacOS](TLKUtilities, "isMacOS", a3, a5, a4.width, a4.height))
  {
    -[TLKHeaderView imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TLKHeaderView axis](self, "axis") == 1)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __80__TLKHeaderView_containerView_willMeasureArrangedSubviewsFittingSize_forReason___block_invoke;
      v7[3] = &unk_1E5C06E18;
      v8 = v6;
      objc_msgSend(v8, "performBatchUpdates:", v7);

    }
    else
    {
      +[TLKLayoutUtilities applyRowBoundedSizingToImageView:isCompactWidth:](TLKLayoutUtilities, "applyRowBoundedSizingToImageView:isCompactWidth:", v6, -[TLKHeaderView useCompactWidth](self, "useCompactWidth"));
    }

  }
}

uint64_t __80__TLKHeaderView_containerView_willMeasureArrangedSubviewsFittingSize_forReason___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setMinimumLayoutSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  return objc_msgSend(*(id *)(a1 + 32), "setMaximumLayoutSize:", *MEMORY[0x1E0CFAA80], *(double *)(MEMORY[0x1E0CFAA80] + 8));
}

- (BOOL)usesDefaultLayoutMargins
{
  return 0;
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
  v9.super_class = (Class)TLKHeaderView;
  -[TLKHeaderView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[TLKHeaderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[TLKHeaderView traitCollection](self, "traitCollection");
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
  v3.super_class = (Class)TLKHeaderView;
  -[TLKHeaderView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TLKHeaderView;
  -[UIView tlk_updateForAppearance:](&v6, sel_tlk_updateForAppearance_, a3);
  if (+[TLKAppearance viewHasOverriddenAppearance:](TLKAppearance, "viewHasOverriddenAppearance:", self))
    v4 = 0;
  else
    v4 = -[TLKHeaderView subtitleIsEmphasized](self, "subtitleIsEmphasized") ^ 1;
  -[TLKHeaderView subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProminence:", v4);

}

- (id)footnoteLabelText
{
  void *v2;
  void *v3;

  -[TLKHeaderView footnoteLabel](self, "footnoteLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hasImage
{
  void *v2;
  void *v3;
  void *v4;

  -[TLKHeaderView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tlkImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uiImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)roundedCornerLabelText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TLKHeaderView roundedCornerLabel](self, "roundedCornerLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[TLKHeaderView roundedCornerLabel](self, "roundedCornerLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (TLKImage)image
{
  return self->_image;
}

- (TLKMultilineText)title
{
  return self->_title;
}

- (TLKRichText)subtitle
{
  return self->_subtitle;
}

- (BOOL)subtitleIsEmphasized
{
  return self->_subtitleIsEmphasized;
}

- (void)setSubtitleIsEmphasized:(BOOL)a3
{
  self->_subtitleIsEmphasized = a3;
}

- (TLKMultilineText)footnote
{
  return self->_footnote;
}

- (TLKMultilineText)trailingText
{
  return self->_trailingText;
}

- (TLKImage)subtitleImage
{
  return self->_subtitleImage;
}

- (NSString)roundedBorderText
{
  return self->_roundedBorderText;
}

- (int64_t)axis
{
  return self->_axis;
}

- (BOOL)useCompactWidth
{
  return self->_useCompactWidth;
}

- (void)setUseCompactWidth:(BOOL)a3
{
  self->_useCompactWidth = a3;
}

- (TLKImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (TLKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (TLKLabel)trailingTextLabel
{
  return self->_trailingTextLabel;
}

- (void)setTrailingTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTextLabel, a3);
}

- (TLKLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (TLKLabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteLabel, a3);
}

- (TLKImageView)subtitleImageView
{
  return self->_subtitleImageView;
}

- (void)setSubtitleImageView:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleImageView, a3);
}

- (TLKStackView)subtitleStackView
{
  return self->_subtitleStackView;
}

- (void)setSubtitleStackView:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleStackView, a3);
}

- (TLKStackView)innerStackView
{
  return self->_innerStackView;
}

- (void)setInnerStackView:(id)a3
{
  objc_storeStrong((id *)&self->_innerStackView, a3);
}

- (TLKRoundedCornerLabel)roundedCornerLabel
{
  return self->_roundedCornerLabel;
}

- (void)setRoundedCornerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_roundedCornerLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roundedCornerLabel, 0);
  objc_storeStrong((id *)&self->_innerStackView, 0);
  objc_storeStrong((id *)&self->_subtitleStackView, 0);
  objc_storeStrong((id *)&self->_subtitleImageView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_trailingTextLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_roundedBorderText, 0);
  objc_storeStrong((id *)&self->_subtitleImage, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
