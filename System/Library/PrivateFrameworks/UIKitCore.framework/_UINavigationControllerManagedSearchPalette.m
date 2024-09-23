@implementation _UINavigationControllerManagedSearchPalette

- (id)_initWithNavigationController:(id)a3 forEdge:(unint64_t)a4
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UINavigationControllerManagedSearchPalette;
  v4 = -[_UINavigationControllerPalette _initWithNavigationController:forEdge:](&v7, sel__initWithNavigationController_forEdge_, a3, a4);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setPreservesSuperviewLayoutMargins:", 1);
  return v5;
}

- (BOOL)_supportsSpecialSearchBarTransitions
{
  return 1;
}

- (UIView)viewForAsymmetricFade
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[_UINavigationControllerManagedSearchPalette _searchBar](self, "_searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "_searchController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isActive");

    if ((v5 & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(v2, "searchField");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

    }
  }

  return (UIView *)v3;
}

- (void)_updateLayoutForCurrentConfiguration
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationControllerManagedSearchPalette;
  -[_UINavigationControllerPalette _updateLayoutForCurrentConfiguration](&v4, sel__updateLayoutForCurrentConfiguration);
  -[_UINavigationControllerManagedSearchPalette _searchBar](self, "_searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateInsetsForCurrentContainerViewAndBarPosition");

}

- (BOOL)_shouldUpdateBackground
{
  return 1;
}

- (void)_pushDisableLayoutFlushingForTransition
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (self)
  {
    v3 = -[UIView _disableLayoutFlushingCount](self, "_disableLayoutFlushingCount");
    if (v3 >= 1)
      v4 = v3 + 1;
    else
      v4 = 1;
    -[UIView _setDisableLayoutFlushingCount:](self, "_setDisableLayoutFlushingCount:", v4);
    -[UIView _disableLayoutFlushing](self, "_disableLayoutFlushing");
  }
  -[_UINavigationControllerManagedSearchPalette _searchBar](self, "_searchBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = objc_msgSend(v7, "_disableLayoutFlushingCount");
    if (v5 >= 1)
      v6 = v5 + 1;
    else
      v6 = 1;
    objc_msgSend(v7, "_setDisableLayoutFlushingCount:", v6);
    objc_msgSend(v7, "_disableLayoutFlushing");
  }

}

- (void)_popDisableLayoutFlushingForTransition
{
  void *v3;

  -[_UINavigationControllerManagedSearchPalette _searchBar](self, "_searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _popDisableLayoutFlushing](v3);

  -[UIView _popDisableLayoutFlushing](self);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  if (!self->_ignoreGeometryChanges)
  {
    v3.receiver = self;
    v3.super_class = (Class)_UINavigationControllerManagedSearchPalette;
    -[_UINavigationControllerPalette setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
}

- (void)setBounds:(CGRect)a3
{
  objc_super v3;

  if (!self->_ignoreGeometryChanges)
  {
    v3.receiver = self;
    v3.super_class = (Class)_UINavigationControllerManagedSearchPalette;
    -[UIView setBounds:](&v3, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
}

- (void)setCenter:(CGPoint)a3
{
  objc_super v3;

  if (!self->_ignoreGeometryChanges)
  {
    v3.receiver = self;
    v3.super_class = (Class)_UINavigationControllerManagedSearchPalette;
    -[UIView setCenter:](&v3, sel_setCenter_, a3.x, a3.y);
  }
}

- (void)_setShadowAlpha:(double)a3
{
  id v4;

  -[_UINavigationControllerPalette _backgroundViewLayout](self, "_backgroundViewLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowAlpha:", a3);

}

- (double)_shadowAlpha
{
  void *v2;
  double v3;
  double v4;

  -[_UINavigationControllerPalette _backgroundViewLayout](self, "_backgroundViewLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowAlpha");
  v4 = v3;

  return v4;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  void *v6;
  void (**v7)(void);
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UINavigationControllerManagedSearchPalette;
  -[UIView _didMoveFromWindow:toWindow:](&v8, sel__didMoveFromWindow_toWindow_, a3);
  if (!a4)
  {
    -[_UINavigationControllerManagedSearchPalette resetAfterSearchFieldFade](self, "resetAfterSearchFieldFade");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_UINavigationControllerManagedSearchPalette resetAfterSearchFieldFade](self, "resetAfterSearchFieldFade");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();

      -[_UINavigationControllerManagedSearchPalette setResetAfterSearchFieldFade:](self, "setResetAfterSearchFieldFade:", 0);
    }
  }
}

- (void)_propagateBackgroundToContents
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UINavigationControllerManagedSearchPalette;
  -[_UINavigationControllerPalette _propagateBackgroundToContents](&v5, sel__propagateBackgroundToContents);
  -[_UINavigationControllerPalette navController](self, "navController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UINavigationControllerManagedSearchPalette _searchBar](self, "_searchBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setBackdropStyle:", 2005);

  }
}

- (BOOL)ignoreGeometryChanges
{
  return self->_ignoreGeometryChanges;
}

- (void)setIgnoreGeometryChanges:(BOOL)a3
{
  self->_ignoreGeometryChanges = a3;
}

- (id)resetAfterSearchFieldFade
{
  return self->_resetAfterSearchFieldFade;
}

- (void)setResetAfterSearchFieldFade:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (UISearchBar)_searchBar
{
  return (UISearchBar *)objc_loadWeakRetained((id *)&self->__searchBar);
}

- (void)_setSearchBar:(id)a3
{
  objc_storeWeak((id *)&self->__searchBar, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__searchBar);
  objc_storeStrong(&self->_resetAfterSearchFieldFade, 0);
}

@end
