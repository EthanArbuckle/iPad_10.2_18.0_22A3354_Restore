@implementation UICellHighlightingSupport

- (void)highlightView:(id)a3
{
  id v4;
  id *p_cell;
  id WeakRetained;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  UICellHighlightingSupport *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = self;
  p_cell = &self->_cell;
  WeakRetained = objc_loadWeakRetained(&self->_cell);
  if (objc_msgSend(WeakRetained, "_shouldSaveOpaqueStateForView:", v4)
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      objc_msgSend(v4, "setHighlighted:", 1);
  }
  else
  {

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v14 = objc_loadWeakRetained(p_cell);
          objc_msgSend(v14, "selectedBackgroundView");
          v15 = (id)objc_claimAutoreleasedReturnValue();

          if (v15 != v4)
            -[UICellHighlightingSupport highlightView:](v16, "highlightView:", v13);
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (void)cacheState:(unint64_t)a3 forView:(id)a4
{
  id v6;
  id WeakRetained;
  int v8;
  __CFDictionary *unhighlightedStates;
  id v10;
  UITableViewCellUnhighlightedState *v11;
  id v12;
  char v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained(&self->_cell);
    v8 = objc_msgSend(WeakRetained, "_shouldSaveOpaqueStateForView:", v6);

    if (v8)
    {
      unhighlightedStates = self->_unhighlightedStates;
      if (!unhighlightedStates)
      {
        self->_unhighlightedStates = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
        v10 = objc_loadWeakRetained(&self->_cell);
        objc_msgSend(v10, "_setMonitorsSubtree:", 1);

        unhighlightedStates = self->_unhighlightedStates;
      }
      CFDictionaryGetValue(unhighlightedStates, v6);
      v11 = (UITableViewCellUnhighlightedState *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        v11 = objc_alloc_init(UITableViewCellUnhighlightedState);
      if ((a3 & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v12 = objc_loadWeakRetained(&self->_cell);
          v13 = objc_msgSend(v12, "_isUsingOldStyleMultiselection");

          if ((v13 & 1) == 0)
            -[UITableViewCellUnhighlightedState setHighlighted:](v11, "setHighlighted:", objc_msgSend(v6, "isHighlighted"));
        }
      }
      if ((a3 & 2) != 0)
        -[UITableViewCellUnhighlightedState setOpaque:](v11, "setOpaque:", objc_msgSend(v6, "isOpaque"));
      if ((a3 & 4) != 0)
      {
        objc_msgSend(v6, "backgroundColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableViewCellUnhighlightedState setBackgroundColor:](v11, "setBackgroundColor:", v14);

      }
      CFDictionaryAddValue(self->_unhighlightedStates, v6, v11);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = objc_loadWeakRetained(&self->_cell);
      objc_msgSend(v15, "selectedBackgroundView");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16 != v6)
      {
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v6, "subviews", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v23;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v23 != v20)
                objc_enumerationMutation(v17);
              -[UICellHighlightingSupport cacheState:forView:](self, "cacheState:forView:", a3, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21++));
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v19);
        }

      }
    }
  }

}

- (UICellHighlightingSupport)initWithCell:(id)a3
{
  id v4;
  UICellHighlightingSupport *v5;
  UICellHighlightingSupport *v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("attempt to initialize a UICellHighlightingSupport instance for a view (%@) that isn't a cell"), v4);
  }
  v8.receiver = self;
  v8.super_class = (Class)UICellHighlightingSupport;
  v5 = -[UICellHighlightingSupport init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_cell, v4);
    v6->_unhighlightedStates = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  }

  return v6;
}

- (void)dealloc
{
  __CFDictionary *unhighlightedStates;
  objc_super v4;

  unhighlightedStates = self->_unhighlightedStates;
  if (unhighlightedStates)
    CFRelease(unhighlightedStates);
  v4.receiver = self;
  v4.super_class = (Class)UICellHighlightingSupport;
  -[UICellHighlightingSupport dealloc](&v4, sel_dealloc);
}

- (void)applyState:(unint64_t)a3 toView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    CFDictionaryGetValue(self->_unhighlightedStates, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if ((a3 & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v6, "_isUsingOldStyleMultiselection") & 1) == 0)
            objc_msgSend(v6, "setHighlighted:", objc_msgSend(v7, "highlighted"));
        }
      }
      if ((a3 & 2) != 0)
        objc_msgSend(v6, "setOpaque:", objc_msgSend(v7, "opaque"));
      if ((a3 & 4) != 0)
      {
        objc_msgSend(v7, "backgroundColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setBackgroundColor:", v8);

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained(&self->_cell);
      objc_msgSend(WeakRetained, "selectedBackgroundView");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10 != v6)
      {
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        objc_msgSend(v6, "subviews", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v17;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v17 != v14)
                objc_enumerationMutation(v11);
              -[UICellHighlightingSupport applyState:toView:](self, "applyState:toView:", a3, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++));
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          }
          while (v13);
        }

      }
    }

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_cell);
}

@end
