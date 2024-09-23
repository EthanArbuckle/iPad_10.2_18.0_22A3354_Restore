@implementation _UISearchBarTransitionerBase

- (_UISearchBarTransitionerBase)initWithTransitionContext:(id)a3 forSearchBar:(id)a4
{
  id v7;
  id v8;
  _UISearchBarTransitionerBase *v9;
  int has_internal_diagnostics;
  BOOL v11;
  int v12;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  uint8_t v17[16];
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_UISearchBarTransitionerBase;
  v9 = -[_UISearchBarTransitionerBase init](&v18, sel_init);
  if (v9)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (v7)
      v11 = v8 == 0;
    else
      v11 = 1;
    v12 = v11;
    if (has_internal_diagnostics)
    {
      if (v12)
      {
        __UIFaultDebugAssertLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "_UISearchBarTransitioner is useless without a transitionContext and a search bar", v17, 2u);
        }

      }
    }
    else if (v12)
    {
      v15 = initWithTransitionContext_forSearchBar____s_category;
      if (!initWithTransitionContext_forSearchBar____s_category)
      {
        v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&initWithTransitionContext_forSearchBar____s_category);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "_UISearchBarTransitioner is useless without a transitionContext and a search bar", v17, 2u);
      }
    }
    objc_storeStrong((id *)&v9->_transitionContext, a3);
    objc_storeWeak((id *)&v9->_searchBar, v8);
  }

  return v9;
}

- (_UISearchBarTransitionerBase)init
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "init not allowed on a _UISearchBarTransitioner", buf, 2u);
    }

  }
  else
  {
    v3 = init___s_category;
    if (!init___s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&init___s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "init not allowed on a _UISearchBarTransitioner", v7, 2u);
    }
  }

  return 0;
}

- (_UISearchBarTransitionerBase)initWithNewTransitionContextForSearchBar:(id)a3
{
  id v4;
  _UISearchBarTransitionContext *v5;
  _UISearchBarTransitionerBase *v6;

  v4 = a3;
  v5 = objc_alloc_init(_UISearchBarTransitionContext);
  v6 = -[_UISearchBarTransitionerBase initWithTransitionContext:forSearchBar:](self, "initWithTransitionContext:forSearchBar:", v5, v4);

  return v6;
}

- (void)prepare
{
  _UISearchBarLayout *v3;
  _UISearchBarLayout *activeLayout;

  -[_UISearchBarTransitionContext fromLayout](self->_transitionContext, "fromLayout");
  v3 = (_UISearchBarLayout *)objc_claimAutoreleasedReturnValue();
  activeLayout = self->_activeLayout;
  self->_activeLayout = v3;

}

- (void)animate
{
  _UISearchBarLayout *v3;
  _UISearchBarLayout *activeLayout;

  -[_UISearchBarTransitionContext toLayout](self->_transitionContext, "toLayout");
  v3 = (_UISearchBarLayout *)objc_claimAutoreleasedReturnValue();
  activeLayout = self->_activeLayout;
  self->_activeLayout = v3;

}

- (void)cancel
{
  _UISearchBarLayout *v3;
  _UISearchBarLayout *activeLayout;

  -[_UISearchBarTransitionContext fromLayout](self->_transitionContext, "fromLayout");
  v3 = (_UISearchBarLayout *)objc_claimAutoreleasedReturnValue();
  activeLayout = self->_activeLayout;
  self->_activeLayout = v3;

}

- (_UISearchBarLayout)activeLayout
{
  return self->_activeLayout;
}

- (UIView)searchBar
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_searchBar);
}

- (_UISearchBarTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_storeStrong((id *)&self->_activeLayout, 0);
}

@end
