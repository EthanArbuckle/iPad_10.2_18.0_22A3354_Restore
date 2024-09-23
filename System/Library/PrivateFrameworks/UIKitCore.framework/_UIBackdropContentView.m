@implementation _UIBackdropContentView

- (_UIBackdropContentView)initWithFrame:(CGRect)a3
{
  _UIBackdropContentView *v3;
  _UIBackdropContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIBackdropContentView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView _setMonitorsSubtree:](v3, "_setMonitorsSubtree:", 1);
    v4->_isForcingLayout = 0;
  }
  return v4;
}

- (void)backdropView:(id)a3 recursivelyUpdateMaskViewsForView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!self->_isForcingLayout)
  {
    self->_isForcingLayout = 1;
    objc_msgSend(v7, "layoutBelowIfNeeded");
    objc_msgSend(v6, "updateMaskViewsForView:", v8);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v8, "subviews", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          -[_UIBackdropContentView backdropView:recursivelyUpdateMaskViewsForView:](self, "backdropView:recursivelyUpdateMaskViewsForView:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

    self->_isForcingLayout = 0;
  }

}

- (void)recursivelyRemoveBackdropMaskViewsForView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_removeBackdropMaskViews");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v4, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[_UIBackdropContentView recursivelyRemoveBackdropMaskViewsForView:](self, "recursivelyRemoveBackdropMaskViewsForView:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_monitoredView:(id)a3 didMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIBackdropContentView;
  v9 = a4;
  -[UIView _monitoredView:didMoveFromSuperview:toSuperview:](&v11, sel__monitoredView_didMoveFromSuperview_toSuperview_, v8, v9, a5);
  LOBYTE(a5) = objc_msgSend(v9, "isDescendantOfView:", self, v11.receiver, v11.super_class);

  if ((a5 & 1) == 0)
  {
    -[UIView superview](self, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropContentView backdropView:recursivelyUpdateMaskViewsForView:](self, "backdropView:recursivelyUpdateMaskViewsForView:", v10, v8);

  }
}

- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v8;
  id v9;
  objc_super v10;

  v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIBackdropContentView;
  v9 = a5;
  -[UIView _monitoredView:willMoveFromSuperview:toSuperview:](&v10, sel__monitoredView_willMoveFromSuperview_toSuperview_, v8, a4, v9);
  LOBYTE(a4) = objc_msgSend(v9, "isDescendantOfView:", self, v10.receiver, v10.super_class);

  if ((a4 & 1) == 0)
    -[_UIBackdropContentView recursivelyRemoveBackdropMaskViewsForView:](self, "recursivelyRemoveBackdropMaskViewsForView:", v8);

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v21 = 0uLL;
    v22 = 0uLL;
    v19 = 0uLL;
    v20 = 0uLL;
    -[UIView subviews](self, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[UIView superview](self, "superview");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIBackdropContentView backdropView:recursivelyUpdateMaskViewsForView:](self, "backdropView:recursivelyUpdateMaskViewsForView:", v10, v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v6);
    }
  }
  else
  {
    v17 = 0uLL;
    v18 = 0uLL;
    *((_QWORD *)&v15 + 1) = 0;
    v16 = 0uLL;
    -[UIView subviews](self, "subviews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v4);
          -[_UIBackdropContentView recursivelyRemoveBackdropMaskViewsForView:](self, "recursivelyRemoveBackdropMaskViewsForView:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j));
        }
        v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v12);
    }
  }

}

@end
