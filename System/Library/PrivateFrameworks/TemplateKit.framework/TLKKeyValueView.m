@implementation TLKKeyValueView

- (id)setupContentView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDelegate:", self);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "addArrangedSubview:", v4);
  -[TLKKeyValueView setLeadingGrid:](self, "setLeadingGrid:", v4);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "addArrangedSubview:", v5);
  -[TLKKeyValueView setTrailingGrid:](self, "setTrailingGrid:", v5);
  v6 = (void *)objc_opt_new();
  +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v6);
  objc_msgSend(v3, "addArrangedSubview:", v6);
  -[TLKKeyValueView setImageView:](self, "setImageView:", v6);

  return v3;
}

- (void)setLeadingTuples:(id)a3
{
  id v5;
  NSArray **p_leadingTuples;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
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
  p_leadingTuples = &self->_leadingTuples;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSArray setObserver:](*p_leadingTuples, "setObserver:", 0);
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
      v7 = *p_leadingTuples;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
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
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v9);
      }

      v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_leadingTuples, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSArray setObserver:](*p_leadingTuples, "setObserver:", self);
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
      v13 = *p_leadingTuples;
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
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
          v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
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

- (void)setTrailingTuples:(id)a3
{
  id v5;
  NSArray **p_trailingTuples;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
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
  p_trailingTuples = &self->_trailingTuples;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSArray setObserver:](*p_trailingTuples, "setObserver:", 0);
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
      v7 = *p_trailingTuples;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
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
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v9);
      }

      v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_trailingTuples, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSArray setObserver:](*p_trailingTuples, "setObserver:", self);
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
      v13 = *p_trailingTuples;
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
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
          v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
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

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  double width;

  width = a4.width;
  if (self->_lastMeasuredWidth < a4.width)
    -[TLKKeyValueView observedPropertiesChanged](self, "observedPropertiesChanged", a3, a5);
  self->_lastMeasuredWidth = width;
}

- (void)_reconfigureForCompressedState
{
  void *v3;
  unint64_t i;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[TLKKeyValueView trailingGrid](self, "trailingGrid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  v12 = (id)objc_opt_new();
  for (i = 0; ; ++i)
  {
    -[TLKKeyValueView leadingTuples](self, "leadingTuples");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    -[TLKKeyValueView trailingTuples](self, "trailingTuples");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") + v6;

    if (i >= v8)
      break;
    if ((i & 1) != 0)
      -[TLKKeyValueView trailingTuples](self, "trailingTuples");
    else
      -[TLKKeyValueView leadingTuples](self, "leadingTuples");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", i >> 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v10);

  }
  -[TLKKeyValueView leadingGrid](self, "leadingGrid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateWithTuples:valueColumnIsTrailing:truncateKey:", v12, 0, 1);

}

- (BOOL)containerView:(id)a3 shouldRestartMeasurementDueToCompressionInAxis:(int64_t)a4 forReason:(int64_t)a5
{
  void *v7;

  if (a5 | a4)
    return 0;
  -[TLKKeyValueView trailingTuples](self, "trailingTuples", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  -[TLKKeyValueView _reconfigureForCompressedState](self, "_reconfigureForCompressedState");
  return 1;
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
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  id v26;

  -[TLKKeyValueView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKKeyValueView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTlkImage:", v3);

  -[TLKKeyValueView image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKKeyValueView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5 == 0);

  -[TLKKeyValueView leadingTuples](self, "leadingTuples");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKKeyValueView leadingGrid](self, "leadingGrid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v7 == 0);

  -[TLKKeyValueView trailingTuples](self, "trailingTuples");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKKeyValueView trailingGrid](self, "trailingGrid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9 == 0);

  -[TLKKeyValueView trailingTuples](self, "trailingTuples");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 != 0;

  -[TLKKeyValueView leadingGrid](self, "leadingGrid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKKeyValueView leadingTuples](self, "leadingTuples");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateWithTuples:valueColumnIsTrailing:truncateKey:", v14, v12, v12);

  -[TLKKeyValueView trailingGrid](self, "trailingGrid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKKeyValueView trailingTuples](self, "trailingTuples");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateWithTuples:valueColumnIsTrailing:truncateKey:", v16, v12, v12);

  -[TLKKeyValueView image](self, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = 0;
  }
  else
  {
    -[TLKKeyValueView leadingTuples](self, "leadingTuples");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[TLKKeyValueView trailingTuples](self, "trailingTuples");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v20 != 0;

    }
    else
    {
      v18 = 0;
    }

  }
  -[TLKView contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDistribution:", v18);

  -[TLKView contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v18)
    v24 = 1;
  else
    v24 = 3;
  if (v18)
    v25 = 24.0;
  else
    v25 = 10.0;
  objc_msgSend(v22, "setAlignment:", v24);

  -[TLKView contentView](self, "contentView");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSpacing:", v25);

}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  -[TLKKeyValueView imageView](self, "imageView");
  v11 = objc_claimAutoreleasedReturnValue();
  if ((id)v11 == v10)
  {
    v26 = v10;
LABEL_12:

    goto LABEL_13;
  }
  v12 = (void *)v11;
  -[TLKKeyValueView trailingGrid](self, "trailingGrid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isHidden");

  if ((v14 & 1) == 0)
  {
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v15 = CGRectGetWidth(v32);
    -[TLKKeyValueView leadingGrid](self, "leadingGrid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(v16, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], v18);
    v20 = v19;

    -[TLKKeyValueView trailingGrid](self, "trailingGrid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "systemLayoutSizeFittingSize:", v17, v18);
    v23 = v22;

    if (v20 >= v23)
      v24 = v20;
    else
      v24 = v23;
    if (v15 >= v24)
      v15 = v24;
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v25 = CGRectGetWidth(v33) - v15;
    -[TLKKeyValueView trailingGrid](self, "trailingGrid");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0.0;
    if (v26 == v10)
      v27 = v25;
    x = x + v27;
    width = v15;
    goto LABEL_12;
  }
LABEL_13:

  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (int64_t)currentStackViewDistribution
{
  void *v2;
  int64_t v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "distribution");

  return v3;
}

- (BOOL)leadingGridIsHidden
{
  void *v2;
  char v3;

  -[TLKKeyValueView leadingGrid](self, "leadingGrid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (BOOL)trailingGridIsHidden
{
  void *v2;
  char v3;

  -[TLKKeyValueView trailingGrid](self, "trailingGrid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (unint64_t)numberOfVisibleRowsForLeadingGrid
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_opt_class();
  -[TLKKeyValueView leadingGrid](self, "leadingGrid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "visibleRowsInGrid:", v4);

  return v5;
}

- (unint64_t)numberOfVisibleRowsForTrailingGrid
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_opt_class();
  -[TLKKeyValueView trailingGrid](self, "trailingGrid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "visibleRowsInGrid:", v4);

  return v5;
}

- (id)leadingTextKeyLabels
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
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
  unint64_t v18;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_class();
  -[TLKKeyValueView leadingGrid](self, "leadingGrid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "visibleRowsInGrid:", v5);

  if (v6)
  {
    v7 = 0;
    do
    {
      -[TLKKeyValueView leadingGrid](self, "leadingGrid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "keyLabels");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[TLKKeyValueView leadingGrid](self, "leadingGrid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "keyLabels");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "text");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v15);

      }
      else
      {
        objc_msgSend(v3, "addObject:", &stru_1E5C079F8);
      }
      ++v7;
      v16 = (void *)objc_opt_class();
      -[TLKKeyValueView leadingGrid](self, "leadingGrid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "visibleRowsInGrid:", v17);

    }
    while (v7 < v18);
  }
  return v3;
}

+ (unint64_t)visibleRowsInGrid:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  int v7;

  v3 = a3;
  if (objc_msgSend(v3, "numberOfRows"))
  {
    v4 = 0;
    v5 = 0;
    do
    {
      objc_msgSend(v3, "rowAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isHidden");

      v5 += v7 ^ 1u;
      ++v4;
    }
    while (v4 < objc_msgSend(v3, "numberOfRows"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)leadingTuples
{
  return self->_leadingTuples;
}

- (NSArray)trailingTuples
{
  return self->_trailingTuples;
}

- (TLKImage)image
{
  return self->_image;
}

- (TLKKeyValueGridView)leadingGrid
{
  return self->_leadingGrid;
}

- (void)setLeadingGrid:(id)a3
{
  objc_storeStrong((id *)&self->_leadingGrid, a3);
}

- (TLKKeyValueGridView)trailingGrid
{
  return self->_trailingGrid;
}

- (void)setTrailingGrid:(id)a3
{
  objc_storeStrong((id *)&self->_trailingGrid, a3);
}

- (TLKImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (double)lastMeasuredWidth
{
  return self->_lastMeasuredWidth;
}

- (void)setLastMeasuredWidth:(double)a3
{
  self->_lastMeasuredWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_trailingGrid, 0);
  objc_storeStrong((id *)&self->_leadingGrid, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_trailingTuples, 0);
  objc_storeStrong((id *)&self->_leadingTuples, 0);
}

@end
