@implementation TLKSimpleRowView

- (id)setupContentView
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = objc_alloc(MEMORY[0x1E0CFAAA8]);
  -[TLKSimpleRowView gridOfAllViews](self, "gridOfAllViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArrangedSubviewRows:", v4);

  objc_msgSend(v5, "setColumnSpacing:", 10.0);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setBaselineRelativeArrangement:", 1);
  objc_msgSend((id)objc_opt_class(), "defaultLayoutMargins");
  v7 = v6;
  objc_msgSend((id)objc_opt_class(), "defaultLayoutMargins");
  objc_msgSend(v5, "setLayoutMargins:", 0.0, v7, 0.0);
  return v5;
}

- (BOOL)usesDefaultLayoutMargins
{
  return 0;
}

- (id)gridOfAllViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[TLKSimpleRowView setLeadingImageView:](self, "setLeadingImageView:", v3);

  -[TLKSimpleRowView leadingImageView](self, "leadingImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomAlignmentRectInsets:", -10.0, 0.0, -10.0, 0.0);

  -[TLKSimpleRowView leadingImageView](self, "leadingImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v5);

  v6 = (void *)objc_opt_new();
  -[TLKSimpleRowView setLeadingTitleLabel:](self, "setLeadingTitleLabel:", v6);

  -[TLKSimpleRowView leadingTitleLabel](self, "leadingTitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1144750080;
  objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 1, v8);

  -[TLKSimpleRowView leadingTitleLabel](self, "leadingTitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1144750080;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 0, v10);

  v11 = (void *)objc_opt_new();
  -[TLKSimpleRowView setLeadingSubtitleLabel:](self, "setLeadingSubtitleLabel:", v11);

  if (+[TLKLayoutUtilities isLTR](TLKLayoutUtilities, "isLTR"))
    v12 = 2;
  else
    v12 = 0;
  v13 = (void *)objc_opt_new();
  -[TLKSimpleRowView setTrailingTitleLabel:](self, "setTrailingTitleLabel:", v13);

  -[TLKSimpleRowView trailingTitleLabel](self, "trailingTitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextAlignment:", v12);

  -[TLKSimpleRowView trailingTitleLabel](self, "trailingTitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 1144750080;
  objc_msgSend(v15, "setContentHuggingPriority:forAxis:", 0, v16);

  -[TLKSimpleRowView trailingTitleLabel](self, "trailingTitleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 1144750080;
  objc_msgSend(v17, "setContentHuggingPriority:forAxis:", 1, v18);

  +[TLKLabel secondaryLabel](TLKLabel, "secondaryLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSimpleRowView setTrailingSubtitleLabel:](self, "setTrailingSubtitleLabel:", v19);

  -[TLKSimpleRowView trailingSubtitleLabel](self, "trailingSubtitleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextAlignment:", v12);

  -[TLKSimpleRowView trailingSubtitleLabel](self, "trailingSubtitleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 1144750080;
  objc_msgSend(v21, "setContentHuggingPriority:forAxis:", 0, v22);

  -[TLKSimpleRowView trailingSubtitleLabel](self, "trailingSubtitleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = 1144750080;
  objc_msgSend(v23, "setContentCompressionResistancePriority:forAxis:", 0, v24);

  v25 = (void *)objc_opt_new();
  -[TLKSimpleRowView setTrailingImageView:](self, "setTrailingImageView:", v25);

  -[TLKSimpleRowView trailingImageView](self, "trailingImageView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v26);

  -[TLKSimpleRowView leadingImageView](self, "leadingImageView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v38;
  -[TLKSimpleRowView leadingTitleLabel](self, "leadingTitleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v37;
  -[TLKSimpleRowView trailingTitleLabel](self, "trailingTitleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v27;
  -[TLKSimpleRowView trailingImageView](self, "trailingImageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v29;
  -[TLKSimpleRowView leadingImageView](self, "leadingImageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v30;
  -[TLKSimpleRowView leadingSubtitleLabel](self, "leadingSubtitleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v31;
  -[TLKSimpleRowView trailingSubtitleLabel](self, "trailingSubtitleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v32;
  -[TLKSimpleRowView trailingImageView](self, "trailingImageView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (void)setLeadingTitle:(id)a3
{
  id v5;
  TLKRichText **p_leadingTitle;
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
  p_leadingTitle = &self->_leadingTitle;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_leadingTitle, "setObserver:", 0);
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
      v7 = *p_leadingTitle;
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
  objc_storeStrong((id *)&self->_leadingTitle, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_leadingTitle, "setObserver:", self);
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
      v13 = *p_leadingTitle;
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

- (void)setLeadingSubtitle:(id)a3
{
  id v5;
  TLKRichText **p_leadingSubtitle;
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
  p_leadingSubtitle = &self->_leadingSubtitle;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_leadingSubtitle, "setObserver:", 0);
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
      v7 = *p_leadingSubtitle;
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
  objc_storeStrong((id *)&self->_leadingSubtitle, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_leadingSubtitle, "setObserver:", self);
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
      v13 = *p_leadingSubtitle;
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

- (void)setTrailingTitle:(id)a3
{
  id v5;
  TLKRichText **p_trailingTitle;
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
  p_trailingTitle = &self->_trailingTitle;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_trailingTitle, "setObserver:", 0);
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
      v7 = *p_trailingTitle;
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
  objc_storeStrong((id *)&self->_trailingTitle, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_trailingTitle, "setObserver:", self);
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
      v13 = *p_trailingTitle;
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

- (void)setTrailingSubtitle:(id)a3
{
  id v5;
  TLKRichText **p_trailingSubtitle;
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
  p_trailingSubtitle = &self->_trailingSubtitle;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_trailingSubtitle, "setObserver:", 0);
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
      v7 = *p_trailingSubtitle;
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
  objc_storeStrong((id *)&self->_trailingSubtitle, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_trailingSubtitle, "setObserver:", self);
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
      v13 = *p_trailingSubtitle;
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

- (void)setTrailingImage:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TLKImage *v10;

  v10 = (TLKImage *)a3;
  if (self->_trailingImage != v10)
  {
    objc_storeStrong((id *)&self->_trailingImage, a3);
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

- (void)setLeadingImage:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TLKImage *v10;

  v10 = (TLKImage *)a3;
  if (self->_leadingImage != v10)
  {
    objc_storeStrong((id *)&self->_leadingImage, a3);
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
  void *v3;
  _QWORD v4[5];

  -[TLKView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__TLKSimpleRowView_observedPropertiesChanged__block_invoke;
  v4[3] = &unk_1E5C06E18;
  v4[4] = self;
  objc_msgSend(v3, "performBatchUpdates:", v4);

}

void __45__TLKSimpleRowView_observedPropertiesChanged__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  double v3;
  double v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  char v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  _BOOL4 v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  void *v86;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  _BOOL4 v99;
  void *v100;
  _QWORD *v101;
  _QWORD *v102;
  void **v103;
  _QWORD *v104;
  _QWORD *v105;
  _QWORD *v106;
  void *v107;
  int v108;
  void **v109;
  void *v110;
  void *v111;
  double *v112;
  void *v113;
  void *v114;
  _QWORD *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  void *v128;
  void *v129;
  double v130;
  void *v131;
  double v132;
  void *v133;
  void *v134;
  void *v135;
  double v136;
  double v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  double v143;
  double v144;
  void *v145;
  void *v146;
  double v147;
  void *v148;
  double v149;
  double v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  _BOOL4 v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  int v171;
  _QWORD v172[2];
  _QWORD v173[4];

  v173[2] = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "leadingImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v5 = v3 <= 18.0;

  if ((objc_msgSend(*v1, "hasSubtitles") & v5) != 0)
    v6 = 1;
  else
    v6 = 3;
  objc_msgSend(*v1, "leadingImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "leadingImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTlkImage:", v7);

  objc_msgSend(*v1, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "columnAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*v1, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "columnAtIndex:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*v1, "leadingImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = v10;
  objc_msgSend(v10, "setHidden:", v13 == 0);

  objc_msgSend(*v1, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "leadingImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlignment:forView:inAxis:", v6, v15, 1);

  objc_msgSend(*v1, "trailingImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "trailingImageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTlkImage:", v16);

  objc_msgSend(*v1, "trailingImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v12;
  objc_msgSend(v12, "setHidden:", v18 == 0);

  objc_msgSend(*v1, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "trailingImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAlignment:forView:inAxis:", v6, v20, 1);

  v21 = objc_msgSend(*v1, "hasSubtitles") ^ 1;
  objc_msgSend(*v1, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowAtIndex:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHidden:", v21);

  objc_msgSend(*v1, "leadingSubtitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *v1;
  if (v24)
    objc_msgSend(v25, "leadingSubtitleLabel");
  else
    objc_msgSend(v25, "leadingTitleLabel");
  v26 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*v1, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeColumnAtIndex:", 1);

  objc_msgSend(*v1, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "leadingTitleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v173[0] = v29;
  v173[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v173, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "insertColumnAtIndex:withArrangedSubviews:", 1, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v166 = v31;
  objc_msgSend(v31, "setSpacingAfter:", 16.0);
  objc_msgSend(*v1, "trailingSubtitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *v1;
  if (v32)
  {
    objc_msgSend(v33, "trailingSubtitle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "hasContent");
    v36 = *v1;
    if ((v35 & 1) != 0)
      objc_msgSend(v36, "trailingSubtitleLabel");
    else
      objc_msgSend(v36, "leadingSubtitleLabel");
    v37 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v33, "trailingTitleLabel");
    v37 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(*v1, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "removeColumnAtIndex:", 2);

  objc_msgSend(*v1, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "trailingTitleLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v172[0] = v40;
  v172[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "insertColumnAtIndex:withArrangedSubviews:", 2, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "setAlignment:", 4);
  objc_msgSend(*v1, "leadingImage");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    goto LABEL_14;
  objc_msgSend(*v1, "leadingTitle");
  v47 = objc_claimAutoreleasedReturnValue();
  if (!v47)
    goto LABEL_15;
  v43 = (void *)v47;
  objc_msgSend(*v1, "trailingTitle");
  v48 = objc_claimAutoreleasedReturnValue();
  if (!v48)
    goto LABEL_14;
  v49 = (void *)v48;
  objc_msgSend(*v1, "trailingImage");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {

LABEL_14:
    goto LABEL_15;
  }
  v71 = objc_msgSend(*v1, "hasSubtitles");

  if ((v71 & 1) == 0)
  {
    v46 = 1;
    goto LABEL_26;
  }
LABEL_15:
  objc_msgSend(*v1, "leadingTitle");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    objc_msgSend(*v1, "leadingSubtitle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
      v46 = 1;
    else
      v46 = 3;

  }
  else
  {
    v46 = 3;
  }

LABEL_26:
  objc_msgSend(*v1, "contentView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "leadingTitleLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setAlignment:forView:inAxis:", v46, v52, 1);

  objc_msgSend(*v1, "leadingSubtitleLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if ((void *)v26 == v53)
  {
    objc_msgSend(*v1, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "leadingSubtitleLabel");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setAlignment:forView:inAxis:", v46, v55, 1);

  }
  objc_msgSend(*v1, "trailingTitle");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    objc_msgSend(*v1, "trailingSubtitle");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
      v58 = 1;
    else
      v58 = 3;

  }
  else
  {
    v58 = 3;
  }

  objc_msgSend(*v1, "contentView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "trailingTitleLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setAlignment:forView:inAxis:", v58, v60, 1);

  objc_msgSend(*v1, "trailingSubtitleLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if ((void *)v37 == v61)
  {
    objc_msgSend(*v1, "contentView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "trailingSubtitleLabel");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setAlignment:forView:inAxis:", v58, v63, 1);

  }
  objc_msgSend(*v1, "trailingTitle");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    objc_msgSend(v42, "setHidden:", 0);
  }
  else
  {
    objc_msgSend(*v1, "trailingSubtitle");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setHidden:", v65 == 0);

  }
  objc_msgSend(*v1, "leadingImage");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = v42;
  if (v66)
  {
    v67 = 0;
  }
  else
  {
    objc_msgSend(*v1, "leadingTitle");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_msgSend(*v1, "trailingTitle");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (v69)
      {
        v67 = 0;
      }
      else
      {
        objc_msgSend(*v1, "trailingSubtitle");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (v70)
        {
          v67 = 0;
        }
        else
        {
          objc_msgSend(*v1, "trailingImage");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "size");
          if (v74 == 29.0 && v73 == 29.0)
          {
            v67 = 1;
          }
          else
          {
            objc_msgSend(*v1, "trailingImage");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v75, "isTemplate"))
            {
              objc_msgSend(*v1, "trailingImage");
              v170 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v170, "size");
              if (v76 <= 29.0)
              {
                v67 = 1;
              }
              else
              {
                objc_msgSend(*v1, "trailingImage");
                v162 = v75;
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "size");
                v67 = v78 <= 29.0;

                v75 = v162;
              }

            }
            else
            {
              v67 = 0;
            }

          }
        }

      }
    }
    else
    {
      v67 = 0;
    }

  }
  objc_msgSend(*v1, "leadingTitle");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = (void *)v37;
  if (v79)
  {
    objc_msgSend(*v1, "leadingSubtitle");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      objc_msgSend(*v1, "trailingTitle");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (v81)
      {
        v82 = 0;
      }
      else
      {
        objc_msgSend(*v1, "trailingSubtitle");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        if (v84)
        {
          v82 = 0;
        }
        else
        {
          objc_msgSend(*v1, "leadingImage");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          if (v85)
          {
            objc_msgSend(*v1, "trailingImage");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = v4 <= 18.0 && v86 == 0;

          }
          else
          {
            v82 = 0;
          }

        }
      }

      v83 = v82;
    }
    else
    {
      v83 = 0;
    }

  }
  else
  {
    v83 = 0;
  }

  if (v67)
  {
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", *v1, -7.5);
    v89 = v88;
    v90 = 0.0;
    v91 = -7.0;
    v92 = 0.0;
  }
  else
  {
    objc_msgSend(*v1, "leadingImageView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "customAlignmentRectInsets");
    v89 = v93;
    v90 = v94;
    v91 = v95;
    v92 = v96;
  }
  objc_msgSend(*v1, "trailingImageView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setCustomAlignmentRectInsets:", v89, v90, v91, v92);

  if (!v67)
  v171 = v83 || v67;
  objc_msgSend(*v1, "leadingImage");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = (void *)v26;
  if (v98)
  {
    v99 = 1;
  }
  else
  {
    objc_msgSend(*v1, "trailingImage");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v100 != 0;

  }
  v101 = (_QWORD *)MEMORY[0x1E0DC4A88];
  v102 = (_QWORD *)MEMORY[0x1E0DC4B10];
  v103 = (void **)MEMORY[0x1E0DC4AB8];
  v161 = v83;
  if (v67)
  {
    v104 = (_QWORD *)MEMORY[0x1E0DC4A88];
    v105 = (_QWORD *)MEMORY[0x1E0DC4AB8];
    v106 = (_QWORD *)MEMORY[0x1E0DC4B10];
    v107 = (void *)*MEMORY[0x1E0DC4B10];
  }
  else
  {
    if (v83)
    {
      v106 = (_QWORD *)MEMORY[0x1E0DC4B10];
      v104 = (_QWORD *)MEMORY[0x1E0DC4A88];
      v105 = (_QWORD *)MEMORY[0x1E0DC4AB8];
    }
    else
    {
      v105 = (_QWORD *)MEMORY[0x1E0DC4AB8];
      v108 = objc_msgSend(*v1, "hasSubtitles");
      v103 = (void **)MEMORY[0x1E0DC4AD0];
      v104 = v101;
      v106 = v102;
      if (v99)
        v109 = (void **)v101;
      else
        v109 = (void **)v102;
      if (!v108)
        v103 = v109;
    }
    v107 = *v103;
  }
  v163 = v107;
  +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", v163, TLKSnippetModernizationEnabled() ^ 1, 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "leadingTitleLabel");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setFont:", v110);

  v112 = (double *)MEMORY[0x1E0DC4B88];
  if (v171)
    +[TLKFontUtilities captionFont](TLKFontUtilities, "captionFont");
  else
    +[TLKFontUtilities cachedFontForTextStyle:isShort:fontWeight:](TLKFontUtilities, "cachedFontForTextStyle:isShort:fontWeight:", *v105, TLKSnippetModernizationEnabled() ^ 1, *MEMORY[0x1E0DC4B88]);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "leadingSubtitleLabel");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setFont:", v113);

  if (objc_msgSend(*v1, "hasSubtitles") | v99)
    v115 = v104;
  else
    v115 = v106;
  +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", *v115, TLKSnippetModernizationEnabled() ^ 1, 0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "trailingTitleLabel");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setFont:", v116);

  +[TLKFontUtilities cachedFontForTextStyle:isShort:fontWeight:](TLKFontUtilities, "cachedFontForTextStyle:isShort:fontWeight:", *v105, TLKSnippetModernizationEnabled() ^ 1, *v112);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "trailingSubtitleLabel");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setFont:", v118);

  v120 = 28.0;
  if (v67)
  {
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", *v1, 26.5);
    v120 = v121;
  }
  v122 = v120 + -4.5;
  if (v67)
    v122 = 19.5;
  +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", *v1, v122);
  v124 = v123;
  if (v67)
  {
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", *v1, 16.5);
    v126 = v125;
    v127 = 16.0;
  }
  else
  {
    v126 = 16.0;
    v127 = 18.0;
  }
  objc_msgSend(*v1, "leadingTitleLabel");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "leadingSubtitle");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  if (v129)
    v130 = v124;
  else
    v130 = v120;
  objc_msgSend(*v1, "leadingSubtitle");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  if (v131)
    v132 = 0.0;
  else
    v132 = v126;
  +[TLKLayoutUtilities setDynamicBaselineAlignmentsForLabel:top:bottom:view:](TLKLayoutUtilities, "setDynamicBaselineAlignmentsForLabel:top:bottom:view:", v128, *v1, v130, v132);

  objc_msgSend(*v1, "trailingTitleLabel");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "trailingSubtitle");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  if (v134)
    v120 = v124;
  objc_msgSend(*v1, "trailingSubtitle");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  if (v135)
    v136 = 0.0;
  else
    v136 = v126;
  +[TLKLayoutUtilities setDynamicBaselineAlignmentsForLabel:top:bottom:view:](TLKLayoutUtilities, "setDynamicBaselineAlignmentsForLabel:top:bottom:view:", v133, *v1, v120, v136);

  if (v171)
    v137 = 14.0;
  else
    v137 = 10.0;
  objc_msgSend(*v1, "leadingSubtitleLabel");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v137 = 8.0;
    v139 = 2;
  }
  else
  {
    v139 = !v161;
  }
  +[TLKLayoutUtilities setDynamicBaselineAlignmentsForLabel:top:bottom:view:](TLKLayoutUtilities, "setDynamicBaselineAlignmentsForLabel:top:bottom:view:", v138, *v1, 0.0, v137);

  objc_msgSend(*v1, "trailingSubtitleLabel");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKLayoutUtilities setDynamicBaselineAlignmentsForLabel:top:bottom:view:](TLKLayoutUtilities, "setDynamicBaselineAlignmentsForLabel:top:bottom:view:", v140, *v1, 0.0, v137);

  objc_msgSend(*v1, "leadingSubtitleLabel");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "font");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKLayoutUtilities scaledValueForValue:withFont:view:](TLKLayoutUtilities, "scaledValueForValue:withFont:view:", v142, *v1, v127);
  v144 = v143;
  objc_msgSend(*v1, "contentView");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "setRowSpacing:", v144);

  objc_msgSend(*v1, "leadingTitleLabel");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v147) = 1144750080;
  objc_msgSend(v146, "setContentCompressionResistancePriority:forAxis:", 0, v147);

  objc_msgSend(*v1, "trailingTitleLabel");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v149) = 1144750080;
  objc_msgSend(v148, "setContentCompressionResistancePriority:forAxis:", 0, v149);

  v150 = *MEMORY[0x1E0CFAA78];
  objc_msgSend(v166, "setLength:", *MEMORY[0x1E0CFAA78]);
  objc_msgSend(v164, "setLength:", v150);
  objc_msgSend(*v1, "leadingTitleLabel");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "setProminence:", v67);

  objc_msgSend(*v1, "leadingSubtitleLabel");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "setProminence:", v139);

  objc_msgSend(*v1, "leadingTitle");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "leadingTitleLabel");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKSimpleRowView applyText:toLabel:](TLKSimpleRowView, "applyText:toLabel:", v153, v154);

  objc_msgSend(*v1, "leadingSubtitle");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "leadingSubtitleLabel");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKSimpleRowView applyText:toLabel:](TLKSimpleRowView, "applyText:toLabel:", v155, v156);

  objc_msgSend(*v1, "trailingTitle");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "trailingTitleLabel");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKSimpleRowView applyText:toLabel:](TLKSimpleRowView, "applyText:toLabel:", v157, v158);

  objc_msgSend(*v1, "trailingSubtitle");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "trailingSubtitleLabel");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKSimpleRowView applyText:toLabel:](TLKSimpleRowView, "applyText:toLabel:", v159, v160);

}

- (BOOL)hasSubtitles
{
  void *v3;
  BOOL v4;
  void *v5;

  -[TLKSimpleRowView leadingSubtitle](self, "leadingSubtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[TLKSimpleRowView trailingSubtitle](self, "trailingSubtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  -[TLKSimpleRowView leadingImageView](self, "leadingImageView");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v12)
  {
    -[TLKSimpleRowView leadingImageView](self, "leadingImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "alignmentForView:inAxis:", v14, 1) != 1)
    {
LABEL_5:

      goto LABEL_6;
    }
    -[TLKSimpleRowView leadingTitleLabel](self, "leadingTitleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "font");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ascender");
    v18 = v17;
    -[TLKSimpleRowView leadingTitleLabel](self, "leadingTitleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "font");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "descender");
    v22 = v18 - v21;

    if (height < v22)
    {
      -[TLKSimpleRowView leadingTitleLabel](self, "leadingTitleLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "customAlignmentRectInsets");
      v24 = v23;
      -[TLKSimpleRowView leadingTitleLabel](self, "leadingTitleLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "font");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "ascender");
      v28 = v27 - v24;
      -[TLKSimpleRowView leadingTitleLabel](self, "leadingTitleLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "font");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "capHeight");
      y = ceil(v28 + (height + v31) * -0.5);

      goto LABEL_5;
    }
  }
LABEL_6:

  v32 = x;
  v33 = y;
  v34 = width;
  v35 = height;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  CGFloat height;
  double width;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  TLKSimpleRowView *v23;
  double v24;
  CGFloat v25;

  height = a4.height;
  width = a4.width;
  v20 = a3;
  -[TLKSimpleRowView leadingImageView](self, "leadingImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaximumLayoutSize:", width * 0.4, 1.79769313e308);

  -[TLKSimpleRowView leadingImageView](self, "leadingImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "maximumLayoutSize");
  v12 = v11;
  v14 = v13;
  -[TLKSimpleRowView trailingImageView](self, "trailingImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMaximumLayoutSize:", v12, v14);

  if (!a5)
  {
    -[TLKSimpleRowView leadingTitle](self, "leadingTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      || (-[TLKSimpleRowView leadingSubtitle](self, "leadingSubtitle"),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[TLKSimpleRowView trailingTitle](self, "trailingTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {

        if (v16)
          v18 = v16;
        else
          v18 = v10;

      }
      else
      {
        -[TLKSimpleRowView trailingSubtitle](self, "trailingSubtitle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {

          if (!v19)
            goto LABEL_10;
        }
        else
        {

          if (!v19)
            goto LABEL_10;
        }
      }
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __83__TLKSimpleRowView_containerView_willMeasureArrangedSubviewsFittingSize_forReason___block_invoke;
      v21[3] = &unk_1E5C06E40;
      v22 = v20;
      v23 = self;
      v24 = width;
      v25 = height;
      objc_msgSend(v22, "performBatchUpdates:", v21);

    }
  }
LABEL_10:

}

void __83__TLKSimpleRowView_containerView_willMeasureArrangedSubviewsFittingSize_forReason___block_invoke(uint64_t a1)
{
  void *v1;
  double v3;
  double v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v48;
  double v49;
  double v50;
  void *v51;
  float v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  float v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  id v64;

  objc_msgSend(*(id *)(a1 + 32), "columnSpacing");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columnAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHidden");
  if ((v7 & 1) != 0)
  {
    v8 = 0.0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "leadingImageView");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "intrinsicContentSize");
    v8 = v4 + v9;
  }
  objc_msgSend(*(id *)(a1 + 40), "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "columnAtIndex:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isHidden"))
  {
    v12 = v8 + 0.0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "trailingImageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "intrinsicContentSize");
    v12 = v8 + v4 + v14;

  }
  if ((v7 & 1) == 0)

  v15 = *(double *)(a1 + 48) - v12;
  objc_msgSend(*(id *)(a1 + 40), "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "columnAtIndex:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "spacingAfter");
  v19 = v15 - v18;
  objc_msgSend(*(id *)(a1 + 32), "layoutMargins");
  v21 = v19 - v20;
  objc_msgSend(*(id *)(a1 + 32), "layoutMargins");
  v23 = v21 - v22;

  v24 = 0.0;
  v25 = fmax(v23, 0.0);
  v26 = fmax(*(double *)(a1 + 56), 0.0);
  objc_msgSend(*(id *)(a1 + 40), "leadingTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "leadingTitleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "naturalWidthOfLabel:inFittingSize:", v29, v25, v26);
    v24 = v30;

  }
  objc_msgSend(*(id *)(a1 + 40), "leadingSubtitle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "leadingSubtitleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "naturalWidthOfLabel:inFittingSize:", v33, v25, v26);
    v35 = v34;

    if (v24 < v35)
      v24 = v35;
  }
  objc_msgSend(*(id *)(a1 + 40), "trailingTitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "trailingTitleLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "naturalWidthOfLabel:inFittingSize:", v38, v25, v26);
    v40 = v39;

  }
  else
  {
    v40 = 0.0;
  }

  objc_msgSend(*(id *)(a1 + 40), "trailingSubtitle");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    v42 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "trailingSubtitleLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "naturalWidthOfLabel:inFittingSize:", v43, v25, v26);
    v45 = v44;

    if (v40 < v45)
      v40 = v45;
  }
  v46 = v25 * 0.5;
  if (v24 <= v25 * 0.5 || v40 <= v46)
  {
    if (v24 <= v46)
    {
      v50 = 750.0;
      if (v40 <= v46)
        v49 = 750.0;
      else
        v49 = 999.0;
    }
    else
    {
      v50 = 999.0;
      v49 = 750.0;
    }
  }
  else
  {
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", *(_QWORD *)(a1 + 40));
    v24 = v48;
    v49 = 750.0;
    v40 = v48;
    v50 = 750.0;
  }
  objc_msgSend(*(id *)(a1 + 40), "leadingTitleLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "contentCompressionResistancePriorityForAxis:", 0);
  v53 = v52;

  if (v49 != v53)
  {
    objc_msgSend(*(id *)(a1 + 40), "leadingTitleLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v55 = v49;
    objc_msgSend(v54, "setContentCompressionResistancePriority:forAxis:", 0, v55);

  }
  objc_msgSend(*(id *)(a1 + 40), "trailingTitleLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "contentCompressionResistancePriorityForAxis:", 0);
  v58 = v57;

  if (v50 != v58)
  {
    objc_msgSend(*(id *)(a1 + 40), "trailingTitleLabel");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v60 = v50;
    objc_msgSend(v59, "setContentCompressionResistancePriority:forAxis:", 0, v60);

  }
  objc_msgSend(*(id *)(a1 + 32), "columnAtIndex:", 1);
  v64 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "length");
  if (v61 != v24)
    objc_msgSend(v64, "setLength:", v24);
  objc_msgSend(*(id *)(a1 + 32), "columnAtIndex:", 2);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "length");
  if (v63 != v40)
    objc_msgSend(v62, "setLength:", v40);

}

- (id)leadingTextView
{
  void *v3;
  void *v4;
  void *v5;

  -[TLKSimpleRowView leadingTitleLabel](self, "leadingTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isHidden"))
  {
    -[TLKSimpleRowView leadingSubtitleLabel](self, "leadingSubtitleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isHidden") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[TLKSimpleRowView leadingSubtitleLabel](self, "leadingSubtitleLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[TLKSimpleRowView leadingTitleLabel](self, "leadingTitleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (double)naturalWidthOfLabel:(id)a3 inFittingSize:(CGSize)a4
{
  double result;

  objc_msgSend(a3, "systemLayoutSizeFittingSize:", a4.width, a4.height);
  return result;
}

+ (void)applyText:(id)a3 toLabel:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_msgSend(v5, "setHidden:", objc_msgSend(v6, "hasContent") ^ 1);
  if ((objc_msgSend(v5, "isHidden") & 1) == 0)
    objc_msgSend(v5, "setRichText:", v6);

}

- (id)stringForLabel:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)leadingTitleLabelString
{
  void *v3;
  void *v4;

  -[TLKSimpleRowView leadingTitleLabel](self, "leadingTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSimpleRowView stringForLabel:](self, "stringForLabel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)leadingSubtitleLabelString
{
  void *v3;
  void *v4;

  -[TLKSimpleRowView leadingSubtitleLabel](self, "leadingSubtitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSimpleRowView stringForLabel:](self, "stringForLabel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)trailingTitleLabelString
{
  void *v3;
  void *v4;

  -[TLKSimpleRowView trailingTitleLabel](self, "trailingTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSimpleRowView stringForLabel:](self, "stringForLabel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)trailingSubtitleLabelString
{
  void *v3;
  void *v4;

  -[TLKSimpleRowView trailingSubtitleLabel](self, "trailingSubtitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSimpleRowView stringForLabel:](self, "stringForLabel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)leadingTitleLabelFont
{
  void *v3;
  void *v4;

  -[TLKSimpleRowView leadingTitleLabel](self, "leadingTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSimpleRowView fontForTextInLabel:](self, "fontForTextInLabel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)trailingTitleLabelFont
{
  void *v3;
  void *v4;

  -[TLKSimpleRowView trailingTitleLabel](self, "trailingTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSimpleRowView fontForTextInLabel:](self, "fontForTextInLabel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)trailingSubtitleLabelFont
{
  void *v3;
  void *v4;

  -[TLKSimpleRowView trailingSubtitleLabel](self, "trailingSubtitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSimpleRowView fontForTextInLabel:](self, "fontForTextInLabel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fontForTextInLabel:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC32A0], 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)widthOfColumnAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[TLKView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columnAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "length");
  v7 = v6;

  return v7;
}

- (id)topRowViews
{
  void *v2;
  void *v3;
  void *v4;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)bottomRowViews
{
  void *v2;
  void *v3;
  void *v4;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowAtIndex:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (TLKImage)leadingImage
{
  return self->_leadingImage;
}

- (TLKRichText)leadingTitle
{
  return self->_leadingTitle;
}

- (TLKRichText)leadingSubtitle
{
  return self->_leadingSubtitle;
}

- (TLKImage)trailingImage
{
  return self->_trailingImage;
}

- (TLKRichText)trailingTitle
{
  return self->_trailingTitle;
}

- (TLKRichText)trailingSubtitle
{
  return self->_trailingSubtitle;
}

- (TLKImageView)leadingImageView
{
  return self->_leadingImageView;
}

- (void)setLeadingImageView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingImageView, a3);
}

- (TLKLabel)leadingTitleLabel
{
  return self->_leadingTitleLabel;
}

- (void)setLeadingTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_leadingTitleLabel, a3);
}

- (TLKLabel)leadingSubtitleLabel
{
  return self->_leadingSubtitleLabel;
}

- (void)setLeadingSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_leadingSubtitleLabel, a3);
}

- (TLKLabel)trailingTitleLabel
{
  return self->_trailingTitleLabel;
}

- (void)setTrailingTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTitleLabel, a3);
}

- (TLKLabel)trailingSubtitleLabel
{
  return self->_trailingSubtitleLabel;
}

- (void)setTrailingSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSubtitleLabel, a3);
}

- (TLKImageView)trailingImageView
{
  return self->_trailingImageView;
}

- (void)setTrailingImageView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingImageView, 0);
  objc_storeStrong((id *)&self->_trailingSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_trailingTitleLabel, 0);
  objc_storeStrong((id *)&self->_leadingSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_leadingTitleLabel, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
  objc_storeStrong((id *)&self->_trailingSubtitle, 0);
  objc_storeStrong((id *)&self->_trailingTitle, 0);
  objc_storeStrong((id *)&self->_trailingImage, 0);
  objc_storeStrong((id *)&self->_leadingSubtitle, 0);
  objc_storeStrong((id *)&self->_leadingTitle, 0);
  objc_storeStrong((id *)&self->_leadingImage, 0);
}

@end
