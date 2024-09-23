@implementation SKUIChartColumnHeaderView

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_buttons;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SKUIChartColumnHeaderView;
  -[SKUIChartColumnHeaderView dealloc](&v8, sel_dealloc);
}

- (void)setSelectedTitleIndex:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIChartColumnHeaderView setSelectedTitleIndex:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_selectedTitleIndex != a3)
  {
    self->_selectedTitleIndex = a3;
    -[SKUIChartColumnHeaderView _reloadSelectedButton](self, "_reloadSelectedButton");
  }
}

- (void)setTitles:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  NSArray *v31;
  NSArray *buttons;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIChartColumnHeaderView setTitles:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SKUIChartColumnHeaderView tintColor](self, "tintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v4;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        v20 = objc_alloc_init(MEMORY[0x1E0DC3518]);
        objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel__buttonAction_, 64);
        -[SKUIChartColumnHeaderView backgroundColor](self, "backgroundColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setBackgroundColor:", v21);

        objc_msgSend(v20, "setTitle:forState:", v19, 0);
        objc_msgSend(v20, "setTitleColor:forState:", v14, 1);
        objc_msgSend(v20, "setTitleColor:forState:", v14, 4);
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTitleColor:forState:", v22, 0);

        objc_msgSend(v20, "titleLabel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setFont:", v24);

        objc_msgSend(v20, "sizeToFit");
        objc_msgSend(v13, "addObject:", v20);
        -[SKUIChartColumnHeaderView addSubview:](self, "addSubview:", v20);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v16);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v25 = self->_buttons;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v30, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
        objc_msgSend(v30, "removeFromSuperview");
      }
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v27);
  }

  v31 = (NSArray *)objc_msgSend(v13, "copy");
  buttons = self->_buttons;
  self->_buttons = v31;

  -[SKUIChartColumnHeaderView _reloadSelectedButton](self, "_reloadSelectedButton");
}

- (NSArray)titles
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIChartColumnHeaderView titles].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = self->_buttons;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "titleForState:", 0, (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return (NSArray *)v11;
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

CGFloat __43__SKUIChartColumnHeaderView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  CGFloat v8;
  uint64_t v9;
  CGFloat v10;
  double v11;
  float v12;
  double v13;
  double v14;
  _BOOL8 v15;
  CGFloat result;
  CGRect v17;

  v5 = a2;
  objc_msgSend(v5, "frame");
  v8 = v7;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(double *)(v9 + 24);
  v11 = *(double *)(a1 + 72);
  v12 = (v11 - v7) * 0.5;
  v13 = floorf(v12);
  if (v6 >= *(double *)(a1 + 80))
    v14 = *(double *)(a1 + 80);
  else
    v14 = v6;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(*(CGFloat *)(v9 + 24), v13, v14, v7, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), v11);
  objc_msgSend(v5, "setFrame:");
  v15 = *(uint64_t *)(a1 + 88) >= 2 && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472) == a3;
  objc_msgSend(v5, "setSelected:", v15);

  v17.origin.x = v10;
  v17.origin.y = v13;
  v17.size.width = v14;
  v17.size.height = v8;
  result = CGRectGetMaxX(v17) + 25.0;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIChartColumnHeaderView setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[NSArray makeObjectsPerformSelector:withObject:](self->_buttons, "makeObjectsPerformSelector:withObject:", sel_setBackgroundColor_, v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUIChartColumnHeaderView;
  -[SKUIChartColumnHeaderView setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  uint64_t v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[SKUIChartColumnHeaderView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[SKUIChartColumnHeaderView edgePadding](self, "edgePadding");
  v8 = v7 + v7;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = self->_buttons;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "sizeToFit", (_QWORD)v18);
        objc_msgSend(v14, "frame");
        v8 = v8 + v15;
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = -[NSArray count](self->_buttons, "count");
  v17 = (float)((float)v16 * 25.0);
  if (v16 <= 1)
    v17 = -0.0;
  -[SKUIChartColumnHeaderView setFrame:](self, "setFrame:", v4, v6, v8 + v17, 44.0, (_QWORD)v18);
}

- (void)_buttonAction:(id)a3
{
  int64_t v4;

  v4 = -[NSArray indexOfObjectIdenticalTo:](self->_buttons, "indexOfObjectIdenticalTo:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_selectedTitleIndex = v4;
    -[SKUIChartColumnHeaderView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
    -[SKUIChartColumnHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)edgePadding
{
  double v2;
  BOOL v3;
  double result;

  -[SKUIChartColumnHeaderView size](self, "size");
  v3 = v2 <= 341.0;
  result = 15.0;
  if (!v3)
    return 20.0;
  return result;
}

- (void)_reloadSelectedButton
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v3 = -[NSArray count](self->_buttons, "count");
  if (v3 >= 1)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[NSArray objectAtIndex:](self->_buttons, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = v4 != 1 && i == self->_selectedTitleIndex;
      objc_msgSend(v6, "setSelected:", v8);

    }
  }
}

- (int64_t)selectedTitleIndex
{
  return self->_selectedTitleIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
}

- (void)setSelectedTitleIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setTitles:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)titles
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
