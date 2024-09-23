@implementation TLKSelectableGridView

- (id)setupContentView
{
  void *v3;
  void *v4;

  -[TLKSelectableGridView setSelectedIndex:](self, "setSelectedIndex:", -1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFAAA8]), "initWithArrangedSubviewRows:", 0);
  objc_msgSend(v3, "setHorizontalDistribution:", 1);
  objc_msgSend(v3, "setHorizontalAlignment:", 3);
  objc_msgSend(v3, "setVerticalAlignment:", 1);
  objc_msgSend(v3, "setRowSpacing:", 14.0);
  objc_msgSend(v3, "setColumnSpacing:", 12.0);
  objc_msgSend(v3, "setDelegate:", self);
  v4 = (void *)objc_opt_new();
  -[TLKSelectableGridView setButtons:](self, "setButtons:", v4);

  return v3;
}

- (void)setTuples:(id)a3
{
  id v5;
  NSArray **p_tuples;
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
  p_tuples = &self->_tuples;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSArray setObserver:](*p_tuples, "setObserver:", 0);
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
      v7 = *p_tuples;
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
  objc_storeStrong((id *)&self->_tuples, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSArray setObserver:](*p_tuples, "setObserver:", self);
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
      v13 = *p_tuples;
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

- (void)observedPropertiesChanged
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  -[TLKSelectableGridView tuples](self, "tuples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[TLKSelectableGridView buttons](self, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 > v6)
  {
    -[TLKSelectableGridView buttons](self, "buttons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    while (1)
    {
      -[TLKSelectableGridView tuples](self, "tuples");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      v11 = objc_msgSend((id)objc_opt_class(), "maxColumns") + v10;

      if (v8 >= v11)
        break;
      -[TLKSelectableGridView buttons](self, "buttons");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKSelectableGridView _createButton](self, "_createButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);

      ++v8;
    }
  }
  -[TLKView contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invalidateIntrinsicContentSize");

  -[TLKSelectableGridView setNeedsLayout](self, "setNeedsLayout");
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  double height;
  double width;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  unint64_t v52;
  id v53;

  height = a4.height;
  width = a4.width;
  v53 = a3;
  if (!a5)
  {
    v9 = (void *)objc_opt_class();
    -[TLKSelectableGridView tuples](self, "tuples");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "idealNumberOfColumnsForTitles:fittingSize:containerView:", v10, v53, width, height);

    -[TLKSelectableGridView tuples](self, "tuples");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count") / v11;

    -[TLKSelectableGridView tuples](self, "tuples");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count") % v11;

    if (v15)
      v16 = v13 + 1;
    else
      v16 = v13;
    if (objc_msgSend(v53, "numberOfRows"))
    {
      v17 = objc_msgSend(v53, "numberOfRows");
      if (v17)
      {
        v18 = v17;
        do
        {
          objc_msgSend(v53, "removeRowAtIndex:", 0);
          --v18;
        }
        while (v18);
      }
    }
    if (v16)
    {
      v19 = 0;
      v20 = 0;
      do
      {
        -[TLKSelectableGridView buttons](self, "buttons");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLKSelectableGridView buttons](self, "buttons");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count") + v19;

        if (v11 >= v23)
          v24 = v23;
        else
          v24 = v11;
        objc_msgSend(v21, "subarrayWithRange:", v20, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (id)objc_msgSend(v53, "addRowWithArrangedSubviews:", v25);

        v20 += v11;
        v19 -= v11;
        --v16;
      }
      while (v16);
    }
    -[TLKSelectableGridView buttons](self, "buttons");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v28)
    {
      v29 = 0;
      v30 = 0;
      do
      {
        -[TLKSelectableGridView buttons](self, "buttons");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        -[TLKSelectableGridView tuples](self, "tuples");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

        if (v29 >= v34)
        {
          objc_msgSend(v32, "setHidden:", 1);
        }
        else
        {
          objc_msgSend(v32, "setHidden:", 0);
          objc_msgSend(v32, "setCustomHighlight:", v29 == -[TLKSelectableGridView selectedIndex](self, "selectedIndex"));
          -[TLKSelectableGridView tuples](self, "tuples");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectAtIndexedSubscript:", v29);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "subtitle");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          -[TLKSelectableGridView tuples](self, "tuples");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectAtIndexedSubscript:", v29);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "title");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setTitle:subtitle:", v40, v37);

          v30 |= objc_msgSend(v37, "length") != 0;
        }

        ++v29;
        -[TLKSelectableGridView buttons](self, "buttons");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "count");

      }
      while (v29 < v42);
    }
    else
    {
      v30 = 0;
    }
    -[TLKSelectableGridView buttons](self, "buttons");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "count");

    if (v44)
    {
      v45 = 0;
      do
      {
        -[TLKSelectableGridView buttons](self, "buttons");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectAtIndexedSubscript:", v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        -[TLKSelectableGridView tuples](self, "tuples");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "count");

        if (v45 < v49)
        {
          objc_msgSend(v47, "bottomLabel");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setHidden:", (v30 ^ 1) & 1);

        }
        ++v45;
        -[TLKSelectableGridView buttons](self, "buttons");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "count");

      }
      while (v45 < v52);
    }
  }

}

+ (unint64_t)maxColumns
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
    v3 = 6;
  else
    v3 = 4;

  return v3;
}

+ (unint64_t)idealNumberOfColumnsForTitles:(id)a3 fittingSize:(CGSize)a4 containerView:(id)a5
{
  CGFloat height;
  double width;
  id v8;
  id v9;
  NSObject *v10;
  size_t v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD block[4];
  id v33;
  double v34;
  CGFloat v35;
  _BYTE v36[128];
  uint64_t v37;

  height = a4.height;
  width = a4.width;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INTERACTIVE, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "count");
  v12 = dispatch_queue_create("concurrent", v10);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__TLKSelectableGridView_idealNumberOfColumnsForTitles_fittingSize_containerView___block_invoke;
  block[3] = &unk_1E5C070B0;
  v13 = v8;
  v33 = v13;
  v34 = width;
  v35 = height;
  dispatch_apply(v11, v12, block);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    v18 = 0.0;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "size", (_QWORD)v28);
        if (v18 < v20)
          v18 = v20;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v16);
    v21 = v18 + 10.0;
  }
  else
  {
    v21 = 10.0;
  }

  objc_msgSend(v9, "layoutMargins");
  v23 = width + v22 * -2.0;
  objc_msgSend(v9, "columnSpacing");
  v25 = floor(v23 / (v21 + v24));
  v26 = objc_msgSend((id)objc_opt_class(), "maxColumns");
  if (v25 >= (double)v26)
    v25 = (double)v26;

  return (unint64_t)v25;
}

void __81__TLKSelectableGridView_idealNumberOfColumnsForTitles_fittingSize_containerView___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0DC32A0];
  v6 = v24;
  +[TLKFontUtilities subheadFont](TLKFontUtilities, "subheadFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSize:", v10);

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v6;
  +[TLKFontUtilities footnoteFont](TLKFontUtilities, "footnoteFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "boundingRectWithSize:options:attributes:context:", 1, v18, 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v20 = v19;

  if (v14 < v20)
    v14 = v20;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSize:", v14);

}

- (id)_createButton
{
  void *v3;

  +[TLKSelectableGridButton selectableGridButton](TLKSelectableGridButton, "selectableGridButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_selectableGridButtonPressed_, 64);
  return v3;
}

- (void)setSelectedIndex:(int64_t)a3
{
  TLKSelectableGridViewDelegate **p_delegate;
  id WeakRetained;
  id v6;
  id v7;

  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v6, "selectableGridView:didChangeSelectedIndex:", self, self->_selectedIndex);

    }
    -[TLKView observer](self, "observer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "propertiesDidChange");

  }
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)selectableGridButtonPressed:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TLKView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfRows");

  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      -[TLKView contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rowAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrangedSubviews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v15 = *(_QWORD *)v21;
        while (2)
        {
          v16 = 0;
          v17 = v14 + v13;
          do
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v11);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "isEqual:", v4))
            {
              -[TLKView contentView](self, "contentView");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v14 + objc_msgSend(v18, "numberOfColumns") * i + v16;

              -[TLKSelectableGridView setSelectedIndex:](self, "setSelectedIndex:", v19);
              goto LABEL_14;
            }
            ++v16;
          }
          while (v13 != v16);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          v14 = v17;
          if (v13)
            continue;
          break;
        }
      }

    }
  }
LABEL_14:

}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(a5, "systemLayoutSizeFittingSize:", a3, a4.width, a4.height);
  if (v5 < 58.0)
    v5 = 58.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)arrangedEntrySubviews
{
  void *v2;
  void *v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)tuples
{
  return self->_tuples;
}

- (TLKSelectableGridViewDelegate)delegate
{
  return (TLKSelectableGridViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tuples, 0);
}

@end
