@implementation _UIViewSystemSpacingInvalidationRecorder

- (_UIViewSystemSpacingInvalidationRecorder)initWithTopView:(id)a3 bottomView:(id)a4
{
  id v6;
  id v7;
  _UIViewSystemSpacingInvalidationRecorder *v8;
  _UIViewSystemSpacingInvalidationRecorder *v9;
  _QWORD *WeakRetained;
  _QWORD *v11;
  id v12;
  id v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIViewSystemSpacingInvalidationRecorder;
  v8 = -[_UIViewSystemSpacingInvalidationRecorder init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_topView, v6);
    objc_storeWeak((id *)&v9->_bottomView, v7);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_topView);
    -[UIView _addGeometryChangeObserver:](WeakRetained, v9);

    v11 = objc_loadWeakRetained((id *)&v9->_bottomView);
    -[UIView _addGeometryChangeObserver:](v11, v9);

    v12 = objc_loadWeakRetained((id *)&v9->_topView);
    objc_msgSend(v12, "_setShouldNotifyGeometryObserversForBaselineChanges:", 1);

    v13 = objc_loadWeakRetained((id *)&v9->_bottomView);
    objc_msgSend(v13, "_setShouldNotifyGeometryObserversForBaselineChanges:", 1);

  }
  return v9;
}

- (void)dealloc
{
  _QWORD *WeakRetained;
  _QWORD *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_topView);
  -[UIView _removeGeometryChangeObserver:](WeakRetained, self);

  v4 = objc_loadWeakRetained((id *)&self->_bottomView);
  -[UIView _removeGeometryChangeObserver:](v4, self);

  v5.receiver = self;
  v5.super_class = (Class)_UIViewSystemSpacingInvalidationRecorder;
  -[_UIViewSystemSpacingInvalidationRecorder dealloc](&v5, sel_dealloc);
}

- (NSArray)observingViews
{
  NSMapTable *observingViewTable;
  void *v3;
  void *v4;

  observingViewTable = self->_observingViewTable;
  if (observingViewTable)
  {
    -[NSMapTable objectEnumerator](observingViewTable, "objectEnumerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v4;
}

- (id)_existingObservingViewTable
{
  return self->_observingViewTable;
}

- (id)_observingViewTable
{
  NSMapTable *observingViewTable;
  NSMapTable *v4;
  NSMapTable *v5;

  observingViewTable = self->_observingViewTable;
  if (!observingViewTable)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_observingViewTable;
    self->_observingViewTable = v4;

    observingViewTable = self->_observingViewTable;
  }
  return observingViewTable;
}

- (void)addObservingView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIViewSystemSpacingInvalidationRecorder _observingViewTable](self, "_observingViewTable");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (void)removeObservingView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIViewSystemSpacingInvalidationRecorder _existingObservingViewTable](self, "_existingObservingViewTable");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", v5);
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((a3->var0 & 0x800) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[_UIViewSystemSpacingInvalidationRecorder observingViews](self, "observingViews", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v6, "superview");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 == v13)
          {
            objc_msgSend(v12, "setNeedsLayout");
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (id)description
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIViewSystemSpacingInvalidationRecorder;
  -[_UIViewSystemSpacingInvalidationRecorder description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return v3;
  -[_UIViewSystemSpacingInvalidationRecorder topView](self, "topView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewSystemSpacingInvalidationRecorder bottomView](self, "bottomView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" topView=%p bottomView=%p observingViews=%p"), v5, v6, self->_observingViewTable);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIView)topView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_topView);
}

- (UIView)bottomView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_bottomView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bottomView);
  objc_destroyWeak((id *)&self->_topView);
  objc_storeStrong((id *)&self->_observingViewTable, 0);
}

@end
