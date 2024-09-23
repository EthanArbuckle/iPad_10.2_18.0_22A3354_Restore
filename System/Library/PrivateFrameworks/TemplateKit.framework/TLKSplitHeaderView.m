@implementation TLKSplitHeaderView

- (id)setupContentView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;

  v3 = objc_alloc(MEMORY[0x1E0CFAAA8]);
  -[TLKSplitHeaderView grid](self, "grid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArrangedSubviewRows:", v4);

  objc_msgSend(v5, "setHorizontalAlignment:", 3);
  objc_msgSend(v5, "rowAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlignment:", 4);

  objc_msgSend(v5, "rowAtIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlignment:", 2);

  objc_msgSend(v5, "rowAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSpacingAfter:", 10.0);

  objc_msgSend(v5, "rowAtIndex:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSpacingAfter:", 1.0);

  +[TLKView defaultLayoutMargins](TLKView, "defaultLayoutMargins");
  v11 = v10;
  v13 = v12;
  -[TLKSplitHeaderView leadingSubtitleLabel](self, "leadingSubtitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "effectiveBaselineOffsetFromBottom");
  v16 = v13 - ceil(v15);

  objc_msgSend(v5, "setLayoutMargins:", v11, 16.0, v16, 16.0);
  objc_msgSend(v5, "setRowSpacing:", 0.0);
  objc_msgSend(v5, "setColumnSpacing:", 8.0);
  objc_msgSend(v5, "setDelegate:", self);
  -[TLKSplitHeaderView titleContainerView](self, "titleContainerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlignment:forView:inAxis:", 0, v17, 1);

  return v5;
}

- (void)setIsLeadingButtonEnabled:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_isLeadingButtonEnabled != a3)
  {
    self->_isLeadingButtonEnabled = a3;
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

- (void)setIsTrailingButtonEnabled:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_isTrailingButtonEnabled != a3)
  {
    self->_isTrailingButtonEnabled = a3;
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

- (void)setShouldBadgeSubtitle:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_shouldBadgeSubtitle != a3)
  {
    self->_shouldBadgeSubtitle = a3;
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

- (void)setUseLargeTitle:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_useLargeTitle != a3)
  {
    self->_useLargeTitle = a3;
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

- (void)setLeadingTitle:(id)a3
{
  id v5;
  TLKMultilineText **p_leadingTitle;
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

- (void)setTrailingTitle:(id)a3
{
  id v5;
  TLKMultilineText **p_trailingTitle;
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

- (void)setLeadingSubtitle:(id)a3
{
  id v5;
  TLKMultilineText **p_leadingSubtitle;
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

- (void)setCenterLeadingTitle:(id)a3
{
  id v5;
  TLKMultilineText **p_centerLeadingTitle;
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
  p_centerLeadingTitle = &self->_centerLeadingTitle;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_centerLeadingTitle, "setObserver:", 0);
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
      v7 = *p_centerLeadingTitle;
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
  objc_storeStrong((id *)&self->_centerLeadingTitle, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_centerLeadingTitle, "setObserver:", self);
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
      v13 = *p_centerLeadingTitle;
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

- (void)setCenterTrailingTitle:(id)a3
{
  id v5;
  TLKMultilineText **p_centerTrailingTitle;
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
  p_centerTrailingTitle = &self->_centerTrailingTitle;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_centerTrailingTitle, "setObserver:", 0);
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
      v7 = *p_centerTrailingTitle;
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
  objc_storeStrong((id *)&self->_centerTrailingTitle, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_centerTrailingTitle, "setObserver:", self);
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
      v13 = *p_centerTrailingTitle;
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

- (void)setSubtitle1:(id)a3
{
  id v5;
  TLKMultilineText **p_subtitle1;
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
  p_subtitle1 = &self->_subtitle1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_subtitle1, "setObserver:", 0);
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
      v7 = *p_subtitle1;
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
  objc_storeStrong((id *)&self->_subtitle1, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_subtitle1, "setObserver:", self);
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
      v13 = *p_subtitle1;
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

- (void)setSubtitle2:(id)a3
{
  id v5;
  TLKMultilineText **p_subtitle2;
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
  p_subtitle2 = &self->_subtitle2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_subtitle2, "setObserver:", 0);
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
      v7 = *p_subtitle2;
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
  objc_storeStrong((id *)&self->_subtitle2, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TLKObject setObserver:](*p_subtitle2, "setObserver:", self);
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
      v13 = *p_subtitle2;
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

- (id)grid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  -[TLKSplitHeaderView firstRowOfViews](self, "firstRowOfViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView secondRowOfViews](self, "secondRowOfViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView thirdRowOfViews](self, "thirdRowOfViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = v4;
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)firstRowOfViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v3);
  objc_msgSend(v3, "setCustomAlignmentRectInsets:", 0.0, -17.0, 0.0, -17.0);
  objc_msgSend(v3, "addTarget:action:", self, sel_performLeadingButtonSelector);
  -[TLKSplitHeaderView setLeadingButton:](self, "setLeadingButton:", v3);
  v4 = (void *)objc_opt_new();
  -[TLKSplitHeaderView setTitleContainerView:](self, "setTitleContainerView:", v4);

  v5 = (void *)objc_opt_new();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v5);
  objc_msgSend(v5, "setCustomAlignmentRectInsets:", 0.0, -17.0, 0.0, -17.0);
  objc_msgSend(v5, "addTarget:action:", self, sel_performTrailingButtonSelector);
  -[TLKSplitHeaderView setTrailingButton:](self, "setTrailingButton:", v5);
  -[TLKSplitHeaderView titleContainerView](self, "titleContainerView", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)secondRowOfViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4B10], 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView subtitleLabel](self, "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);
  -[TLKSplitHeaderView setLeadingTitleLabel:](self, "setLeadingTitleLabel:", v4);
  -[TLKSplitHeaderView subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v3);
  -[TLKSplitHeaderView setTrailingTitleLabel:](self, "setTrailingTitleLabel:", v5);
  -[TLKSplitHeaderView subtitleLabel](self, "subtitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProminence:", 1);
  LODWORD(v7) = 1132068864;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v7);
  -[TLKSplitHeaderView setSubtitle1Label:](self, "setSubtitle1Label:", v6);
  v8 = (void *)objc_opt_new();
  -[TLKSplitHeaderView setSubtitle2Label:](self, "setSubtitle2Label:", v8);
  v9 = objc_alloc(MEMORY[0x1E0CFAAB0]);
  v15[0] = v6;
  v15[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArrangedSubviews:", v10);

  objc_msgSend(v11, "setSpacing:", 2.0);
  objc_msgSend(v11, "setAlignment:", 3);
  objc_msgSend(v11, "setAxis:", 1);
  -[TLKSplitHeaderView setSubtitleStackView:](self, "setSubtitleStackView:", v11);
  v14[0] = v4;
  v14[1] = v11;
  v14[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)thirdRowOfViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  -[TLKSplitHeaderView subtitleLabel](self, "subtitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProminence:", 1);
  -[TLKSplitHeaderView setLeadingSubtitleLabel:](self, "setLeadingSubtitleLabel:", v3);
  -[TLKSplitHeaderView subtitleLabel](self, "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProminence:", 1);
  -[TLKSplitHeaderView setTrailingSubtitleLabel:](self, "setTrailingSubtitleLabel:", v4);
  -[TLKSplitHeaderView subtitleStackView](self, "subtitleStackView", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)subtitleLabel
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_opt_new();
  +[TLKFontUtilities footnoteFont](TLKFontUtilities, "footnoteFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  objc_msgSend(v2, "setTextAlignment:", 1);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v2, "setContentHuggingPriority:forAxis:", 0, v4);
  LODWORD(v5) = 1132068864;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  return v2;
}

- (id)centerLeadingTitleLabel
{
  void *v2;
  void *v3;

  -[TLKSplitHeaderView titleContainerView](self, "titleContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "centerLeadingTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)centerTrailingTitleLabel
{
  void *v2;
  void *v3;

  -[TLKSplitHeaderView titleContainerView](self, "titleContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "centerTrailingTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)titleLabel
{
  void *v2;
  void *v3;

  -[TLKSplitHeaderView titleContainerView](self, "titleContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)observedPropertiesChanged
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
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
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  _BOOL8 v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  _BOOL8 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL8 v47;
  _QWORD *v48;
  void *v49;
  _BOOL4 v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _BOOL8 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _BOOL8 v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[5];
  id v81;
  unint64_t v82;

  v3 = -[TLKSplitHeaderView useLargeTitle](self, "useLargeTitle");
  -[TLKSplitHeaderView titleContainerView](self, "titleContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseLargeTitle:", v3);

  -[TLKSplitHeaderView titleContainerView](self, "titleContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TLKSplitHeaderView centerLeadingTitle](self, "centerLeadingTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView centerLeadingTitleLabel](self, "centerLeadingTitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v7 == 0);

  -[TLKSplitHeaderView centerLeadingTitleLabel](self, "centerLeadingTitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v6);

  -[TLKSplitHeaderView centerLeadingTitle](self, "centerLeadingTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView centerLeadingTitleLabel](self, "centerLeadingTitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMultilineText:", v10);

  -[TLKSplitHeaderView centerTrailingTitle](self, "centerTrailingTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView centerTrailingTitleLabel](self, "centerTrailingTitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", v12 == 0);

  -[TLKSplitHeaderView centerTrailingTitleLabel](self, "centerTrailingTitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v6);

  -[TLKSplitHeaderView centerTrailingTitle](self, "centerTrailingTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView centerTrailingTitleLabel](self, "centerTrailingTitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMultilineText:", v15);

  -[TLKSplitHeaderView centerLeadingTitle](self, "centerLeadingTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");
  -[TLKSplitHeaderView centerTrailingTitle](self, "centerTrailingTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length") + v19;

  -[TLKSplitHeaderView titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __47__TLKSplitHeaderView_observedPropertiesChanged__block_invoke;
  v80[3] = &unk_1E5C06E68;
  v80[4] = self;
  v24 = v6;
  v81 = v24;
  v82 = v22;
  objc_msgSend(v23, "performBatchUpdates:", v80);

  -[TLKSplitHeaderView title](self, "title");
  v25 = objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView titleContainerView](self, "titleContainerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "titleStackView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHidden:", (v25 | v22) == 0);

  if (v22 <= 4)
    v28 = 7.0;
  else
    v28 = 0.0;
  -[TLKSplitHeaderView titleContainerView](self, "titleContainerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "titleStackView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSpacing:", v28);

  -[TLKSplitHeaderView leadingTitle](self, "leadingTitle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = 0;
    v33 = 0;
  }
  else
  {
    -[TLKSplitHeaderView trailingTitle](self, "trailingTitle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v32 = 0;
      v33 = 0;
    }
    else
    {
      -[TLKSplitHeaderView subtitle1](self, "subtitle1");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v26 == 0;
      v32 = 1;
    }
  }
  -[TLKView contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rowAtIndex:", 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setHidden:", v33);

  if (v32)
  if (!v31)

  -[TLKSplitHeaderView leadingSubtitle](self, "leadingSubtitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = 0;
    v38 = 0;
  }
  else
  {
    -[TLKSplitHeaderView trailingSubtitle](self, "trailingSubtitle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v37 = 0;
      v38 = 0;
    }
    else
    {
      -[TLKSplitHeaderView subtitle2](self, "subtitle2");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v26 == 0;
      v37 = 1;
    }
  }
  -[TLKView contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rowAtIndex:", 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setHidden:", v38);

  if (v37)
  if (!v36)

  -[TLKSplitHeaderView subtitle1](self, "subtitle1");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView subtitle1Label](self, "subtitle1Label");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setHidden:", v41 == 0);

  -[TLKSplitHeaderView subtitle1](self, "subtitle1");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView subtitle1Label](self, "subtitle1Label");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setMultilineText:", v43);

  -[TLKSplitHeaderView subtitle2Label](self, "subtitle2Label");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView subtitle2](self, "subtitle2");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[TLKSplitHeaderView shouldBadgeSubtitle](self, "shouldBadgeSubtitle");
  v48 = (_QWORD *)MEMORY[0x1E0DC4AB8];
  if (v47)
    v48 = (_QWORD *)MEMORY[0x1E0DC4AA0];
  +[TLKFontUtilities cachedFontForTextStyle:isShort:isBold:](TLKFontUtilities, "cachedFontForTextStyle:isShort:isBold:", *v48, TLKSnippetModernizationEnabled() ^ 1, v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[TLKSplitHeaderView shouldBadgeSubtitle](self, "shouldBadgeSubtitle");
  if (v50)
    v51 = 2.25;
  else
    v51 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v50)
    v52 = 7.0;
  else
    v52 = *MEMORY[0x1E0C9D820];
  objc_msgSend(v45, "setText:font:customInsetSize:badge:", v46, v49, -[TLKSplitHeaderView shouldBadgeSubtitle](self, "shouldBadgeSubtitle", *MEMORY[0x1E0C9D820]), v52, v51);

  -[TLKSplitHeaderView subtitle2](self, "subtitle2");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView subtitle2Label](self, "subtitle2Label");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setHidden:", v53 == 0);

  -[TLKSplitHeaderView leadingImage](self, "leadingImage");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView leadingButton](self, "leadingButton");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setTlkImage:", v55);

  v57 = -[TLKSplitHeaderView isLeadingButtonEnabled](self, "isLeadingButtonEnabled");
  -[TLKSplitHeaderView leadingButton](self, "leadingButton");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setEnabled:", v57);

  -[TLKSplitHeaderView leadingTitle](self, "leadingTitle");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView leadingTitleLabel](self, "leadingTitleLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setHidden:", v59 == 0);

  -[TLKSplitHeaderView leadingTitle](self, "leadingTitle");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView leadingTitleLabel](self, "leadingTitleLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setMultilineText:", v61);

  -[TLKSplitHeaderView leadingSubtitle](self, "leadingSubtitle");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView leadingSubtitleLabel](self, "leadingSubtitleLabel");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setHidden:", v63 == 0);

  -[TLKSplitHeaderView leadingSubtitle](self, "leadingSubtitle");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView leadingSubtitleLabel](self, "leadingSubtitleLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setMultilineText:", v65);

  -[TLKSplitHeaderView trailingImage](self, "trailingImage");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView trailingButton](self, "trailingButton");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setTlkImage:", v67);

  v69 = -[TLKSplitHeaderView isTrailingButtonEnabled](self, "isTrailingButtonEnabled");
  -[TLKSplitHeaderView trailingButton](self, "trailingButton");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setEnabled:", v69);

  -[TLKSplitHeaderView trailingTitle](self, "trailingTitle");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView trailingTitleLabel](self, "trailingTitleLabel");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setHidden:", v71 == 0);

  -[TLKSplitHeaderView trailingTitle](self, "trailingTitle");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView trailingTitleLabel](self, "trailingTitleLabel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setMultilineText:", v73);

  -[TLKSplitHeaderView trailingSubtitle](self, "trailingSubtitle");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView trailingSubtitleLabel](self, "trailingSubtitleLabel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setHidden:", v75 == 0);

  -[TLKSplitHeaderView trailingSubtitle](self, "trailingSubtitle");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSplitHeaderView trailingSubtitleLabel](self, "trailingSubtitleLabel");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setMultilineText:", v77);

  -[TLKSplitHeaderView titleContainerView](self, "titleContainerView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setNeedsLayout");

}

void __47__TLKSplitHeaderView_observedPropertiesChanged__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", v2 == 0);

  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(*(id *)(a1 + 32), "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMultilineText:", v6);

  v8 = *(_QWORD *)(a1 + 48) != 0;
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", v8);

  if (+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
  {
    if (*(_QWORD *)(a1 + 48))
    {
      v10 = 6.0;
      v11 = 0.0;
      v12 = 0.0;
      v13 = 6.0;
    }
    else
    {
      v11 = *MEMORY[0x1E0CFAA68];
      v10 = *(double *)(MEMORY[0x1E0CFAA68] + 8);
      v12 = *(double *)(MEMORY[0x1E0CFAA68] + 16);
      v13 = *(double *)(MEMORY[0x1E0CFAA68] + 24);
    }
    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCustomAlignmentRectInsets:", v11, v10, v12, v13);

  }
}

- (void)performLeadingButtonSelector
{
  void *v3;
  char v4;
  id v5;

  -[TLKSplitHeaderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[TLKSplitHeaderView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didPressLeadingButtonForSplitHeader:", self);

  }
}

- (void)performTrailingButtonSelector
{
  void *v3;
  char v4;
  id v5;

  -[TLKSplitHeaderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[TLKSplitHeaderView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didPressTrailingButtonForSplitHeader:", self);

  }
}

- (BOOL)usesDefaultLayoutMargins
{
  return 0;
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[TLKSplitHeaderView leadingButton](self, "leadingButton", a3, a5, a4.width, a4.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tlkImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKLayoutUtilities applyRowBoundedSizingToImageView:isCompactWidth:](TLKLayoutUtilities, "applyRowBoundedSizingToImageView:isCompactWidth:", v7, -[TLKSplitHeaderView useCompactWidth](self, "useCompactWidth"));

  -[TLKSplitHeaderView trailingButton](self, "trailingButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tlkImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKLayoutUtilities applyRowBoundedSizingToImageView:isCompactWidth:](TLKLayoutUtilities, "applyRowBoundedSizingToImageView:isCompactWidth:", v8, -[TLKSplitHeaderView useCompactWidth](self, "useCompactWidth"));

}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double height;
  double width;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v8 = a5;
  -[TLKSplitHeaderView leadingTitleLabel](self, "leadingTitleLabel");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((id)v9 == v8)
  {

    goto LABEL_6;
  }
  v10 = (void *)v9;
  -[TLKSplitHeaderView trailingTitleLabel](self, "trailingTitleLabel");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v8)
  {
LABEL_6:
    -[TLKSplitHeaderView leadingImage](self, "leadingImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v17 = v16;

    -[TLKSplitHeaderView leadingButton](self, "leadingButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "customAlignmentRectInsets");
    v20 = v17 - v19;
    -[TLKSplitHeaderView leadingButton](self, "leadingButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "customAlignmentRectInsets");
    v14 = v20 - v22;

    objc_msgSend(v8, "systemLayoutSizeFittingSize:", v14, height);
    v13 = v23;
    goto LABEL_8;
  }
  -[TLKSplitHeaderView titleContainerView](self, "titleContainerView");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v8)
  {
    -[TLKSplitHeaderView titleContainerView](self, "titleContainerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 1000.0;
    objc_msgSend(v24, "effectiveLayoutSizeFittingSize:", width, 1000.0);
    v13 = v25;

  }
  else
  {
    v14 = *MEMORY[0x1E0CFAA88];
    v13 = *(double *)(MEMORY[0x1E0CFAA88] + 8);
  }
LABEL_8:

  v26 = v14;
  v27 = v13;
  result.height = v27;
  result.width = v26;
  return result;
}

- (BOOL)secondRowIsHidden
{
  void *v2;
  void *v3;
  char v4;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowAtIndex:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  return v4;
}

- (id)leadingImageInView
{
  void *v2;
  void *v3;
  void *v4;

  -[TLKSplitHeaderView leadingButton](self, "leadingButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tlkImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uiImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)trailingImageInView
{
  void *v2;
  void *v3;
  void *v4;

  -[TLKSplitHeaderView trailingButton](self, "trailingButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tlkImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uiImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (TLKMultilineText)title
{
  return self->_title;
}

- (TLKMultilineText)centerLeadingTitle
{
  return self->_centerLeadingTitle;
}

- (TLKMultilineText)centerTrailingTitle
{
  return self->_centerTrailingTitle;
}

- (TLKMultilineText)subtitle1
{
  return self->_subtitle1;
}

- (TLKMultilineText)subtitle2
{
  return self->_subtitle2;
}

- (BOOL)useLargeTitle
{
  return self->_useLargeTitle;
}

- (BOOL)shouldBadgeSubtitle
{
  return self->_shouldBadgeSubtitle;
}

- (BOOL)useCompactWidth
{
  return self->_useCompactWidth;
}

- (void)setUseCompactWidth:(BOOL)a3
{
  self->_useCompactWidth = a3;
}

- (BOOL)isLeadingButtonEnabled
{
  return self->_isLeadingButtonEnabled;
}

- (TLKImage)leadingImage
{
  return self->_leadingImage;
}

- (TLKMultilineText)leadingTitle
{
  return self->_leadingTitle;
}

- (TLKMultilineText)leadingSubtitle
{
  return self->_leadingSubtitle;
}

- (BOOL)isTrailingButtonEnabled
{
  return self->_isTrailingButtonEnabled;
}

- (TLKImage)trailingImage
{
  return self->_trailingImage;
}

- (TLKMultilineText)trailingTitle
{
  return self->_trailingTitle;
}

- (TLKMultilineText)trailingSubtitle
{
  return self->_trailingSubtitle;
}

- (void)setTrailingSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSubtitle, a3);
}

- (TLKSplitHeaderViewDelegate)delegate
{
  return (TLKSplitHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TLKTextButton)leadingButton
{
  return self->_leadingButton;
}

- (void)setLeadingButton:(id)a3
{
  objc_storeStrong((id *)&self->_leadingButton, a3);
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

- (TLKTextButton)trailingButton
{
  return self->_trailingButton;
}

- (void)setTrailingButton:(id)a3
{
  objc_storeStrong((id *)&self->_trailingButton, a3);
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

- (TLKSplitTitleContainer)titleContainerView
{
  return self->_titleContainerView;
}

- (void)setTitleContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_titleContainerView, a3);
}

- (NUIContainerStackView)subtitleStackView
{
  return self->_subtitleStackView;
}

- (void)setSubtitleStackView:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleStackView, a3);
}

- (TLKLabel)subtitle1Label
{
  return self->_subtitle1Label;
}

- (void)setSubtitle1Label:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle1Label, a3);
}

- (TLKEmbossedLabel)subtitle2Label
{
  return self->_subtitle2Label;
}

- (void)setSubtitle2Label:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle2Label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle2Label, 0);
  objc_storeStrong((id *)&self->_subtitle1Label, 0);
  objc_storeStrong((id *)&self->_subtitleStackView, 0);
  objc_storeStrong((id *)&self->_titleContainerView, 0);
  objc_storeStrong((id *)&self->_trailingSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_trailingTitleLabel, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);
  objc_storeStrong((id *)&self->_leadingSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_leadingTitleLabel, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingSubtitle, 0);
  objc_storeStrong((id *)&self->_trailingTitle, 0);
  objc_storeStrong((id *)&self->_trailingImage, 0);
  objc_storeStrong((id *)&self->_leadingSubtitle, 0);
  objc_storeStrong((id *)&self->_leadingTitle, 0);
  objc_storeStrong((id *)&self->_leadingImage, 0);
  objc_storeStrong((id *)&self->_subtitle2, 0);
  objc_storeStrong((id *)&self->_subtitle1, 0);
  objc_storeStrong((id *)&self->_centerTrailingTitle, 0);
  objc_storeStrong((id *)&self->_centerLeadingTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
