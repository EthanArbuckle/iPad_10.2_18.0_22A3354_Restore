@implementation _UIVisualEffectContentView

- (void)willRemoveSubview:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_UIVisualEffectContentView _notifyContentViewMonitors](self, "_notifyContentViewMonitors");
  if (self->_disableGroupFiltering)
  {
    objc_msgSend(v5, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilters:", 0);

  }
}

- (void)didAddSubview:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIVisualEffectContentView _notifyContentViewMonitors](self, "_notifyContentViewMonitors");
  if (self->_disableGroupFiltering && -[NSArray count](self->super._filters, "count"))
  {
    _UIVisualEffectSubviewConvertToCAFilterArray(self->super._filters);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", v4);

    _UIVisualEffectSubviewApplyFilters(v6, self->super._filters, self->_currentlyDisplayingRequestedEffects);
  }

}

- (void)setFilters:(id)a3
{
  NSArray *v4;
  NSArray *filters;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_disableGroupFiltering)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    filters = self->super._filters;
    self->super._filters = v4;

    -[UIView subviews](self, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      _UIVisualEffectSubviewConvertToCAFilterArray(self->super._filters);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "layer", (_QWORD)v14);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setFilters:", v7);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        }
        while (v10);
      }

    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_UIVisualEffectContentView;
    -[_UIVisualEffectSubview setFilters:](&v18, sel_setFilters_, a3);
  }
}

- (void)applyRequestedFilterEffects
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_currentlyDisplayingRequestedEffects = 1;
  if (self->_disableGroupFiltering)
  {
    -[UIView subviews](self, "subviews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          _UIVisualEffectSubviewApplyFilters(*(void **)(*((_QWORD *)&v8 + 1) + 8 * i), self->super._filters, self->_currentlyDisplayingRequestedEffects);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
      }
      while (v5);
    }

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIVisualEffectContentView;
    -[_UIVisualEffectSubview applyRequestedFilterEffects](&v12, sel_applyRequestedFilterEffects);
  }
}

- (_UIVisualEffectContentView)initWithFrame:(CGRect)a3
{
  _UIVisualEffectContentView *v3;
  _UIVisualEffectContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectContentView;
  v3 = -[_UIVisualEffectSubview initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    if ((dyld_program_sdk_at_least() & 1) == 0)
      -[UIView setClipsToBounds:](v4, "setClipsToBounds:", 1);
  }
  return v4;
}

- (void)setDisableGroupFiltering:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  BOOL v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->super._filters, "count"))
  {
    if (!self->_disableGroupFiltering && v3)
    {
      -[UIView subviews](self, "subviews");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        v23 = v3;
        _UIVisualEffectSubviewConvertToCAFilterArray(self->super._filters);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v22 = v12;
        v14 = v12;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v29 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v19, "layer");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setFilters:", v13);

              _UIVisualEffectSubviewApplyFilters(v19, self->super._filters, self->_currentlyDisplayingRequestedEffects);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          }
          while (v16);
        }

        LOBYTE(v3) = v23;
        v12 = v22;
      }
      v21 = _UIVisualEffectSubviewSetFilters(self, self->super._filters, MEMORY[0x1E0C9AA60]);
LABEL_27:

      goto LABEL_28;
    }
    if (self->_disableGroupFiltering && !v3)
    {
      -[UIView subviews](self, "subviews");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v6 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v7; ++j)
          {
            if (*(_QWORD *)v25 != v8)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "layer");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setFilters:", 0);

          }
          v7 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v7);
      }
      v11 = _UIVisualEffectSubviewSetFilters(self, MEMORY[0x1E0C9AA60], self->super._filters);
      _UIVisualEffectSubviewApplyFilters(self, self->super._filters, self->_currentlyDisplayingRequestedEffects);
      goto LABEL_27;
    }
  }
LABEL_28:
  self->_disableGroupFiltering = v3;
}

- (BOOL)disableGroupFiltering
{
  return self->_disableGroupFiltering;
}

- (void)applyIdentityFilterEffects
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_currentlyDisplayingRequestedEffects = 0;
  if (self->_disableGroupFiltering)
  {
    -[UIView subviews](self, "subviews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          _UIVisualEffectSubviewApplyFilters(*(void **)(*((_QWORD *)&v8 + 1) + 8 * i), self->super._filters, self->_currentlyDisplayingRequestedEffects);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
      }
      while (v5);
    }

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIVisualEffectContentView;
    -[_UIVisualEffectSubview applyIdentityFilterEffects](&v12, sel_applyIdentityFilterEffects);
  }
}

- (void)_didInvalidateIntrinsicContentSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIVisualEffectContentView;
  -[UIView _didInvalidateIntrinsicContentSize](&v3, sel__didInvalidateIntrinsicContentSize);
  -[_UIVisualEffectContentView _notifyContentViewMonitors](self, "_notifyContentViewMonitors");
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIVisualEffectContentView;
  -[UIView _intrinsicContentSizeInvalidatedForChildView:](&v4, sel__intrinsicContentSizeInvalidatedForChildView_, a3);
  -[_UIVisualEffectContentView _notifyContentViewMonitors](self, "_notifyContentViewMonitors");
}

- (void)_notifyContentViewMonitors
{
  id v2;

  -[UIView superview](self, "superview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_didUpdateContentView");

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIVisualEffectContentView;
  -[UIView description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_disableGroupFiltering)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" disablesGroupFiltering"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

@end
