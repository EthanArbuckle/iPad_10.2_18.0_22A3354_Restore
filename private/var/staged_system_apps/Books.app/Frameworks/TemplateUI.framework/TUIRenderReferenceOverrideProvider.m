@implementation TUIRenderReferenceOverrideProvider

- (void)addRenderOverride:(id)a3
{
  id v4;
  NSMutableArray *overrides;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    overrides = self->_overrides;
    v9 = v4;
    if (!overrides)
    {
      v6 = objc_opt_new(NSMutableArray);
      v7 = self->_overrides;
      self->_overrides = v6;

      overrides = self->_overrides;
    }
    v8 = -[NSMutableArray indexOfObjectIdenticalTo:](overrides, "indexOfObjectIdenticalTo:", v9);
    v4 = v9;
    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray addObject:](self->_overrides, "addObject:", v9);
      -[TUIRenderReferenceOverrideProvider _notifyRenderOverrideObservers:](self, "_notifyRenderOverrideObservers:", v9);
      v4 = v9;
    }
  }

}

- (void)removeRenderOverride:(id)a3
{
  id v4;
  NSMutableArray *overrides;
  id v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    overrides = self->_overrides;
    if (overrides)
    {
      v8 = v4;
      v6 = -[NSMutableArray indexOfObjectIdenticalTo:](overrides, "indexOfObjectIdenticalTo:", v4);
      v4 = v8;
      if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSMutableArray removeObjectIdenticalTo:](self->_overrides, "removeObjectIdenticalTo:", v8);
        if (!-[NSMutableArray count](self->_overrides, "count"))
        {
          v7 = self->_overrides;
          self->_overrides = 0;

        }
        -[TUIRenderReferenceOverrideProvider _notifyRenderOverrideObservers:](self, "_notifyRenderOverrideObservers:", v8);
        v4 = v8;
      }
    }
  }

}

- (id)renderOverrides
{
  return self->_overrides;
}

- (void)_notifyRenderOverrideObservers:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "renderReferenceOverrideObservers"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "renderReferenceOverridesChanged", (_QWORD)v13);
        objc_msgSend(v12, "invalidateRenderReferenceOverride:", v4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)scrollToItemsMatchingQuery:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5 skipVoiceOverFocus:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a6;
  v7 = a5;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "renderReferenceOverrideObservers"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v17), "scrollToItemsMatchingQuery:atScrollPosition:animated:skipVoiceOverFocus:", v10, a4, v7, v6, (_QWORD)v18);
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (TUIRenderReferenceOverrideProviderDelegate)delegate
{
  return (TUIRenderReferenceOverrideProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrides, 0);
}

@end
