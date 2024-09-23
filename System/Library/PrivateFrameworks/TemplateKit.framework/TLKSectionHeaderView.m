@implementation TLKSectionHeaderView

- (id)setupContentView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  +[TLKProminenceView viewWithProminence:](TLKProminenceView, "viewWithProminence:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSectionHeaderView setBackgroundView:](self, "setBackgroundView:", v3);
  v4 = (void *)objc_opt_new();
  +[TLKFontUtilities subheadFont](TLKFontUtilities, "subheadFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, 8.0);
  v7 = -v6;
  +[TLKUtilities standardTableCellContentInset](TLKUtilities, "standardTableCellContentInset");
  v9 = -v8;
  +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, 8.0);
  v11 = -v10;
  +[TLKUtilities standardTableCellContentInset](TLKUtilities, "standardTableCellContentInset");
  objc_msgSend(v4, "setCustomAlignmentRectInsets:", v7, v9, v11, -v12);
  -[TLKSectionHeaderView setHeaderTextLabel:](self, "setHeaderTextLabel:", v4);
  v13 = objc_alloc(MEMORY[0x1E0CFAA98]);
  v17[0] = v3;
  v17[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithArrangedSubviews:", v14);

  objc_msgSend(v15, "setHorizontalAlignment:", 1);
  objc_msgSend(v15, "setAlignment:forView:inAxis:", 0, v3, 0);
  objc_msgSend(v15, "setAlignment:forView:inAxis:", 0, v3, 1);
  objc_msgSend(v15, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
  -[TLKSectionHeaderView setMinimumLayoutSize:](self, "setMinimumLayoutSize:", 0.0, 8.0);

  return v15;
}

- (BOOL)usesDefaultLayoutMargins
{
  return 0;
}

- (void)setHeaderText:(id)a3
{
  id v5;
  TLKMultilineText **p_headerText;
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
  p_headerText = &self->_headerText;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_headerText, "setObserver:", 0);
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
      v7 = *p_headerText;
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
  objc_storeStrong((id *)&self->_headerText, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_headerText, "setObserver:", self);
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
      v13 = *p_headerText;
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

- (void)observedPropertiesChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[TLKSectionHeaderView headerText](self, "headerText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSectionHeaderView headerTextLabel](self, "headerTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMultilineText:", v3);

  -[TLKSectionHeaderView headerText](self, "headerText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  -[TLKSectionHeaderView headerTextLabel](self, "headerTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "isHidden");

  if ((v7 == 0) != (_DWORD)v6)
  {
    -[TLKSectionHeaderView headerTextLabel](self, "headerTextLabel");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v7 == 0);

  }
}

- (id)headerLabelText
{
  void *v2;
  void *v3;

  -[TLKSectionHeaderView headerTextLabel](self, "headerTextLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TLKMultilineText)headerText
{
  return self->_headerText;
}

- (TLKLabel)headerTextLabel
{
  return self->_headerTextLabel;
}

- (void)setHeaderTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerTextLabel, a3);
}

- (TLKProminenceView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_headerTextLabel, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
}

@end
