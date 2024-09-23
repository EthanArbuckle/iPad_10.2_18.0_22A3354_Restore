@implementation _UISearchBarSearchDismissalTransitioner

- (void)prepare
{
  void *v3;
  void *v4;
  void *v5;
  int has_internal_diagnostics;
  uint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)_UISearchBarSearchDismissalTransitioner;
  -[_UISearchBarTransitionerBase prepare](&v16, sel_prepare);
  -[_UISearchBarTransitionerBase transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fromLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v7 = objc_msgSend(v4, "representedLayoutState");
  if (has_internal_diagnostics)
  {
    if (v7 != 3 || (unint64_t)(objc_msgSend(v5, "representedLayoutState") - 1) >= 2)
    {
      __UIFaultDebugAssertLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v4;
        v19 = 2112;
        v20 = v5;
        _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Incorrect transition object for transitioning from layout, %@, to layout, %@. This is a UIKit bug.", buf, 0x16u);
      }

    }
  }
  else if (v7 != 3 || (unint64_t)(objc_msgSend(v5, "representedLayoutState") - 1) >= 2)
  {
    v10 = _MergedGlobals_969;
    if (!_MergedGlobals_969)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_MergedGlobals_969);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v4;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Incorrect transition object for transitioning from layout, %@, to layout, %@. This is a UIKit bug.", buf, 0x16u);
    }
  }
  v8 = os_variant_has_internal_diagnostics();
  v9 = objc_msgSend(v5, "hasScopeBar");
  if (v8)
  {
    if (v9 && (objc_msgSend(v4, "hasScopeBar") & 1) == 0)
    {
      __UIFaultDebugAssertLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "Unexpectedly transitioning from hidden scope bar to visible scope bar on search dismissal. This is a UIKit bug.", buf, 2u);
      }

    }
  }
  else if (v9 && (objc_msgSend(v4, "hasScopeBar") & 1) == 0)
  {
    v14 = qword_1ECD7CDF8;
    if (!qword_1ECD7CDF8)
    {
      v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&qword_1ECD7CDF8);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Unexpectedly transitioning from hidden scope bar to visible scope bar on search dismissal. This is a UIKit bug.", buf, 2u);
    }
  }

}

- (void)animate
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_UISearchBarSearchDismissalTransitioner;
  -[_UISearchBarTransitionerBase animate](&v18, sel_animate);
  -[_UISearchBarTransitionerBase transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fromLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasCancelButton");
  v7 = objc_msgSend(v5, "hasCancelButton");
  v8 = objc_msgSend(v4, "hasScopeBar");
  v9 = objc_msgSend(v5, "hasScopeBar");
  v10 = (v8 ^ v9) & ~objc_msgSend(v4, "isHostedInlineByNavigationBar");
  v11 = v6 ^ v7;
  if ((v11 & 1) != 0 || v10)
  {
    -[_UISearchBarTransitionerBase searchBar](self, "searchBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsLayout");

    if (v11)
    {
      objc_msgSend(v5, "searchFieldContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNeedsLayout");

    }
    if (v8 != v9)
    {
      objc_msgSend(v5, "scopeBarContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNeedsLayout");

    }
  }
  -[_UISearchBarTransitionerBase searchBar](self, "searchBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

  if (((v10 & v8 ^ 1 | v9) & 1) == 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50___UISearchBarSearchDismissalTransitioner_animate__block_invoke;
    v16[3] = &unk_1E16B1B28;
    v17 = v5;
    +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v16, 0, 0.0, 0.0);

  }
}

- (void)complete
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UISearchBarSearchDismissalTransitioner;
  -[_UISearchBarTransitionerBase complete](&v13, sel_complete);
  -[_UISearchBarTransitionerBase transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHostedInlineByNavigationBar");

  if ((v5 & 1) == 0)
  {
    -[_UISearchBarTransitionerBase transitionContext](self, "transitionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasScopeBar");
    objc_msgSend(v6, "fromLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasScopeBar");

    if (v10)
    {
      if ((v8 & 1) == 0)
      {
        -[_UISearchBarTransitionerBase searchBar](self, "searchBar");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setNeedsLayout");

        objc_msgSend(v7, "scopeBarContainer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setNeedsLayout");

      }
    }

  }
}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_UISearchBarSearchDismissalTransitioner;
  -[_UISearchBarTransitionerBase cancel](&v17, sel_cancel);
  -[_UISearchBarTransitionerBase transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fromLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasCancelButton");
  v7 = objc_msgSend(v4, "hasCancelButton");
  objc_msgSend(v3, "toLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasScopeBar");

  v10 = objc_msgSend(v4, "hasScopeBar");
  v11 = (v9 ^ v10) & ~objc_msgSend(v4, "isHostedInlineByNavigationBar");
  v12 = v6 ^ v7;
  if ((v12 & 1) != 0 || v11)
  {
    -[_UISearchBarTransitionerBase searchBar](self, "searchBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");

    if (v12)
    {
      objc_msgSend(v5, "searchFieldContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNeedsLayout");

    }
    if (v11)
    {
      objc_msgSend(v5, "scopeBarContainer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setNeedsLayout");

      if (((v10 ^ 1 | v9) & 1) == 0)
      {
        objc_msgSend(v4, "scopeBarContainer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAlpha:", 1.0);

      }
    }
  }

}

@end
