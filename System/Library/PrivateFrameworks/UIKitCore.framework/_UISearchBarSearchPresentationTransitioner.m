@implementation _UISearchBarSearchPresentationTransitioner

- (void)prepare
{
  void *v3;
  void *v4;
  void *v5;
  int has_internal_diagnostics;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)_UISearchBarSearchPresentationTransitioner;
  -[_UISearchBarTransitionerBase prepare](&v18, sel_prepare);
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
    if ((unint64_t)(v7 - 1) > 1 || objc_msgSend(v5, "representedLayoutState") != 3)
    {
      __UIFaultDebugAssertLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v4;
        v21 = 2112;
        v22 = v5;
        _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Incorrect transition object for transitioning from layout, %@, to layout, %@. This is a UIKit bug.", buf, 0x16u);
      }

    }
  }
  else if ((unint64_t)(v7 - 1) > 1 || objc_msgSend(v5, "representedLayoutState") != 3)
  {
    v12 = _MergedGlobals_970;
    if (!_MergedGlobals_970)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&_MergedGlobals_970);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v4;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Incorrect transition object for transitioning from layout, %@, to layout, %@. This is a UIKit bug.", buf, 0x16u);
    }
  }
  -[_UISearchBarTransitionerBase searchBar](self, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

  v9 = objc_msgSend(v4, "hasScopeBar");
  v10 = objc_msgSend(v5, "hasScopeBar");
  if (os_variant_has_internal_diagnostics())
  {
    if (((v9 ^ 1 | v10) & 1) == 0)
    {
      __UIFaultDebugAssertLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Unexpectedly transitioning from visible scope bar to hidden scope bar on search presentation. This is a UIKit bug.", buf, 2u);
      }

    }
  }
  else if (((v9 ^ 1 | v10) & 1) == 0)
  {
    v16 = qword_1ECD7CE08;
    if (!qword_1ECD7CE08)
    {
      v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, (unint64_t *)&qword_1ECD7CE08);
    }
    v17 = *(NSObject **)(v16 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Unexpectedly transitioning from visible scope bar to hidden scope bar on search presentation. This is a UIKit bug.", buf, 2u);
    }
  }
  if (((objc_msgSend(v4, "isHostedInlineByNavigationBar") | v9 | v10 ^ 1) & 1) == 0)
  {
    objc_msgSend(v5, "scopeBarContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", 0.0);
    objc_msgSend(v11, "setHidden:", 0);
    objc_msgSend(v5, "applyScopeContainerSublayout");

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
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_UISearchBarSearchPresentationTransitioner;
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
  v10 = v6 ^ v7;
  v11 = v8 ^ v9;
  if ((v10 & 1) != 0 || v11)
  {
    -[_UISearchBarTransitionerBase searchBar](self, "searchBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsLayout");

    if (v10)
    {
      objc_msgSend(v5, "searchFieldContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNeedsLayout");

    }
    if (v11)
    {
      objc_msgSend(v5, "scopeBarContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNeedsLayout");

    }
  }
  -[_UISearchBarTransitionerBase searchBar](self, "searchBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_updateEffectiveContentInset");
  objc_msgSend(v15, "_effectiveContentInset");
  objc_msgSend(v5, "setContentInset:");
  objc_msgSend(v15, "layoutIfNeeded");
  if ((v9 & ~(objc_msgSend(v4, "isHostedInlineByNavigationBar") | v8)) == 1)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __53___UISearchBarSearchPresentationTransitioner_animate__block_invoke;
    v16[3] = &unk_1E16B1B28;
    v17 = v5;
    +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v16, 0, 0.0, 0.0);

  }
}

- (void)cancel
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UISearchBarSearchPresentationTransitioner;
  -[_UISearchBarTransitionerBase cancel](&v12, sel_cancel);
  -[_UISearchBarTransitionerBase transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fromLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHostedInlineByNavigationBar");

  if ((v5 & 1) == 0)
  {
    -[_UISearchBarTransitionerBase transitionContext](self, "transitionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fromLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasScopeBar");
    objc_msgSend(v6, "toLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasScopeBar");

    if (v10)
    {
      if ((v8 & 1) == 0)
      {
        objc_msgSend(v7, "scopeBarContainer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAlpha:", 0.0);

      }
    }

  }
}

@end
