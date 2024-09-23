@implementation _UIVisualEffectBackingFakeView

- (_UIVisualEffectBackingFakeView)initWithClientView:(id)a3
{
  id v4;
  _UIVisualEffectBackingFakeView *v5;
  _UIVisualEffectBackingFakeView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIVisualEffectBackingFakeView;
  v5 = -[UIView init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_clientView, v4);

  return v6;
}

- (uint64_t)_clientViewShouldBeOptedOutOfViewEffects
{
  id WeakRetained;
  void *v2;
  char isKindOfClass;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 448));
    objc_opt_self();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)setViewEffects:(id)a3
{
  id v4;
  NSArray *viewEffects;
  void *v6;
  NSArray *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  NSArray *v26;
  NSArray *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  viewEffects = self->_viewEffects;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (!viewEffects)
    viewEffects = (NSArray *)MEMORY[0x1E0C9AA60];
  v7 = viewEffects;
  if (v4)
    v8 = v4;
  else
    v8 = v6;
  v9 = v8;
  if (-[_UIVisualEffectBackingFakeView _clientViewShouldBeOptedOutOfViewEffects]((uint64_t)self))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_266);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  if (!-[NSArray isEqualToArray:](v7, "isEqualToArray:", v9))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v12 = v7;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          -[_UIVisualEffectBackingFakeView clientView](self, "clientView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeEffectFromView:", v18);

        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v14);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = v9;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          -[_UIVisualEffectBackingFakeView clientView](self, "clientView");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addEffectToView:", v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v21);
    }

    v26 = (NSArray *)objc_msgSend(v19, "copy");
    v27 = self->_viewEffects;
    self->_viewEffects = v26;

  }
}

- (void)setFilters:(id)a3
{
  void *v5;
  _QWORD *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSArray isEqualToArray:](self->_filters, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_filters, a3);
    _UIVisualEffectSubviewConvertToCAFilterArray(v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVisualEffectBackingFakeView clientView](self, "clientView");
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[UIView _backing_outermostLayer](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v5);

  }
}

- (void)applyIdentityFilterEffects
{
  _QWORD *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[_UIVisualEffectBackingFakeView clientView](self, "clientView");
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[UIView _backing_outermostLayer](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_filters;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "filterName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("filters.%@."), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "valueAsRequested:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        _UIVisualEffectSubviewApplyFilterValues(v4, v14, v13);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)applyRequestedFilterEffects
{
  _QWORD *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[_UIVisualEffectBackingFakeView clientView](self, "clientView");
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[UIView _backing_outermostLayer](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_filters;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "filterName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("filters.%@."), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "valueAsRequested:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        _UIVisualEffectSubviewApplyFilterValues(v4, v14, v13);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)applyIdentityViewEffects
{
  id v3;

  if ((-[_UIVisualEffectBackingFakeView _clientViewShouldBeOptedOutOfViewEffects]((uint64_t)self) & 1) == 0)
  {
    -[_UIVisualEffectBackingFakeView clientView](self, "clientView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    _UIVisualEffectSubviewApplyViewEffects(v3, self->_viewEffects, 0);

  }
}

- (void)applyRequestedViewEffects
{
  id v3;

  if ((-[_UIVisualEffectBackingFakeView _clientViewShouldBeOptedOutOfViewEffects]((uint64_t)self) & 1) == 0)
  {
    -[_UIVisualEffectBackingFakeView clientView](self, "clientView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    _UIVisualEffectSubviewApplyViewEffects(v3, self->_viewEffects, 1);

  }
}

- (void)_receiveVisitor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIVisualEffectBackingFakeView clientView](self, "clientView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIViewVisitor _startTraversalOfVisitor:withView:](_UIViewVisitor, "_startTraversalOfVisitor:withView:", v4, v5);

}

- (_UIVisualEffectViewParticipating)containedView
{
  return self->_containedView;
}

- (void)setContainedView:(id)a3
{
  objc_storeStrong((id *)&self->_containedView, a3);
}

- (NSArray)filters
{
  return self->_filters;
}

- (_UIVisualEffectViewBackdropCaptureGroup)primaryCaptureGroup
{
  return self->_primaryCaptureGroup;
}

- (void)setPrimaryCaptureGroup:(id)a3
{
  objc_storeStrong((id *)&self->_primaryCaptureGroup, a3);
}

- (NSArray)viewEffects
{
  return self->_viewEffects;
}

- (UIView)clientView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_clientView);
}

- (void)setClientView:(id)a3
{
  objc_storeWeak((id *)&self->_clientView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientView);
  objc_storeStrong((id *)&self->_viewEffects, 0);
  objc_storeStrong((id *)&self->_primaryCaptureGroup, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_containedView, 0);
}

@end
