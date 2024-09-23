@implementation _UISearchBarVisualProviderLegacy

- (int)visualProviderType
{
  return 1;
}

- (void)setBarStyle:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  BOOL v8;
  int v9;
  UIImageView *separator;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((*(_BYTE *)&searchBarVisualProviderFlags & 7) != a3)
    {
      v15 = (void *)v5;
      if (a3)
        v8 = (*(_DWORD *)&self->_searchBarVisualProviderFlags & 7) == 0;
      else
        v8 = 1;
      self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&searchBarVisualProviderFlags & 0xFFFFFFF8 | a3 & 7);
      v9 = v8;
      -[UISearchBarBackground setBarStyle:](self->_searchBarBackground, "setBarStyle:", a3);
      if (!self->_barTintColor)
      {
        if (self->_cancelButton)
        {
          -[_UISearchBarVisualProviderLegacy setUpCancelButtonWithAppearance:](self, "setUpCancelButtonWithAppearance:", 0);
          objc_msgSend(v15, "setNeedsLayout");
        }
        if (self->_promptLabel)
        {
          -[_UISearchBarVisualProviderLegacy setUpPromptLabel](self, "setUpPromptLabel");
          objc_msgSend(v15, "setNeedsLayout");
        }
        if (v9)
          -[_UISearchBarVisualProviderLegacy updateSearchFieldArt](self, "updateSearchFieldArt");
        separator = self->_separator;
        if (separator)
        {
          -[_UISearchBarVisualProviderLegacy currentSeparatorImage](self, "currentSeparatorImage");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageView setImage:](separator, "setImage:", v11);

        }
        -[UISegmentedControl setBarStyle:](self->_scopeBar, "setBarStyle:", a3);
        -[_UISearchBarVisualProviderLegacy updateScopeBarBackground](self, "updateScopeBarBackground");
        -[_UISearchBarVisualProviderLegacy updateSearchBarOpacity](self, "updateSearchBarOpacity");
      }
      v6 = v15;
      if (v9)
      {
        -[_UISearchBarVisualProviderLegacy updatePlaceholderColor](self, "updatePlaceholderColor");
        -[_UISearchBarVisualProviderLegacy updateRightView](self, "updateRightView");
        -[_UISearchBarVisualProviderLegacy updateMagnifyingGlassView](self, "updateMagnifyingGlassView");
        v12 = -[UISearchBarBackground _hasCustomBackgroundImage](self->_searchBarBackground, "_hasCustomBackgroundImage");
        v6 = v15;
        if (!v12 && !self->_backdropStyle)
        {
          objc_msgSend(v15, "_searchBarTextField");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UISearchBarVisualProviderLegacy textColor](self, "textColor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setTextColor:", v14);

          v6 = v15;
        }
      }
    }
  }

}

- (void)_setBarStyle:(int64_t)a3
{
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFF8 | a3 & 7);
}

- (int64_t)barStyle
{
  return *(_DWORD *)&self->_searchBarVisualProviderFlags & 7;
}

- (void)setSearchBarStyle:(unint64_t)a3
{
  unint64_t searchBarVisualProviderFlags;
  uint64_t v4;

  if (!self->_backdropStyle)
  {
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    v4 = (searchBarVisualProviderFlags >> 3) & 7;
    if (v4 != a3)
    {
      if (a3 != 2 || (_DWORD)v4 == 2)
      {
        self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(searchBarVisualProviderFlags & 0xFFFFFFC7 | (8 * (a3 & 7)));
        if (a3 == 2 || (_DWORD)v4 != 2)
          return;
      }
      else
      {
        self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(searchBarVisualProviderFlags & 0xFFFFFFC7 | 0x10);
      }
      if (self->_searchField)
        -[_UISearchBarVisualProviderLegacy applySearchBarStyle](self, "applySearchBarStyle");
    }
  }
}

- (unint64_t)searchBarStyle
{
  return ((unint64_t)self->_searchBarVisualProviderFlags >> 3) & 7;
}

- (BOOL)isTranslucent
{
  return (*(_DWORD *)&self->_searchBarVisualProviderFlags & 0x1C0) == 64;
}

- (void)setBarTranslucence:(int64_t)a3
{
  unint64_t searchBarVisualProviderFlags;

  searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((searchBarVisualProviderFlags >> 6) & 7) != a3)
  {
    self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(searchBarVisualProviderFlags & 0xFFFFFE3F | ((a3 & 7) << 6));
    -[UISearchBarBackground setTranslucent:](self->_searchBarBackground, "setTranslucent:", -[_UISearchBarVisualProviderLegacy isTranslucent](self, "isTranslucent"));
    -[_UISearchBarVisualProviderLegacy updateSearchBarOpacity](self, "updateSearchBarOpacity");
  }
}

- (void)_setBarTranslucence:(int64_t)a3
{
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFE3F | ((a3 & 7) << 6));
}

- (int64_t)barTranslucence
{
  return ((unint64_t)self->_searchBarVisualProviderFlags >> 6) & 7;
}

- (void)setSearchFieldLeftViewMode:(int64_t)a3
{
  UISearchBarTextField *searchField;

  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFF9FF | ((a3 & 3) << 9));
  searchField = self->_searchField;
  if (searchField)
    -[UITextField setLeftViewMode:](searchField, "setLeftViewMode:", a3 & 3);
}

- (int64_t)searchFieldLeftViewMode
{
  return ((unint64_t)self->_searchBarVisualProviderFlags >> 9) & 3;
}

- (void)setCenterPlaceholder:(BOOL)a3
{
  _BOOL4 v3;
  void *WeakRetained;
  void *v5;
  int v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v3 = a3;
  WeakRetained = self;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && ((((*((_DWORD *)WeakRetained + 26) & 0x800) == 0) ^ v3) & 1) == 0)
  {
    if (v3)
      v6 = 2048;
    else
      v6 = 0;
    *((_DWORD *)WeakRetained + 26) = *((_DWORD *)WeakRetained + 26) & 0xFFFFF7FF | v6;
    v9 = v5;
    if (v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)WeakRetained + 12);
      v7 = WeakRetained == 0;
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v9, "textInputTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDeferBecomingResponder:", v7);

    v5 = v9;
    if (v3)
    {

      v5 = v9;
    }
  }

}

- (BOOL)centerPlaceholder
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 1) >> 3) & 1;
}

- (void)setEnabled:(BOOL)a3
{
  -[_UISearchBarVisualProviderLegacy setEnabled:animated:](self, "setEnabled:animated:", a3, 0);
}

- (BOOL)isEnabled
{
  return (*((_BYTE *)&self->_searchBarVisualProviderFlags + 1) & 0x10) == 0;
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  BOOL v14;

  v4 = a4;
  v5 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && v5 == (*(_DWORD *)&self->_searchBarVisualProviderFlags & 0x1000u) >> 12)
  {
    if (v5)
      v9 = 0;
    else
      v9 = 4096;
    self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFEFFF | v9);
    objc_msgSend(v7, "setUserInteractionEnabled:", v5);
    objc_msgSend(v8, "_searchBarTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setEnabled:animated:", v5, v4);

    -[UIButton setEnabled:](self->_cancelButton, "setEnabled:", v5);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56___UISearchBarVisualProviderLegacy_setEnabled_animated___block_invoke;
    v13[3] = &unk_1E16B1B78;
    v13[4] = self;
    v14 = v5;
    v11 = _Block_copy(v13);
    v12 = v11;
    if (v4)
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, 0.35);
    else
      (*((void (**)(void *))v11 + 2))(v11);

  }
}

- (void)setReliesOnNavigationBarBackdrop:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFDFFF | v3);
}

- (BOOL)reliesOnNavigationBarBackdrop
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 1) >> 5) & 1;
}

- (void)setDrawsBackgroundInPalette:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFBFFF | v3);
  -[_UISearchBarVisualProviderLegacy updateForDrawsBackgroundInPalette](self, "updateForDrawsBackgroundInPalette");
}

- (BOOL)drawsBackgroundInPalette
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 1) >> 6) & 1;
}

- (void)setDrawsBackground:(BOOL)a3
{
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  int v4;

  searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if ((((*(unsigned int *)&searchBarVisualProviderFlags >> 15) & 1) == 0) != a3)
  {
    if (a3)
      v4 = 0;
    else
      v4 = 0x8000;
    self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&searchBarVisualProviderFlags & 0xFFFF7FFF | v4);
    -[UIImageView setHidden:](self->_searchBarBackground, "setHidden:", !a3);
  }
}

- (void)_setHideBackground:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFF7FFF | v3);
}

- (BOOL)drawsBackground
{
  _BOOL4 v2;

  if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 1) & 0x80) != 0)
  {
    v2 = -[_UISearchBarVisualProviderLegacy isInNavigationPalette](self, "isInNavigationPalette");
    if (v2)
      LOBYTE(v2) = -[_UISearchBarVisualProviderLegacy drawsBackgroundInPalette](self, "drawsBackgroundInPalette");
  }
  else
  {
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (void)setUsesEmbeddedAppearance:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  int v7;
  UIColor *barTintColor;
  id v9;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if (((*(_DWORD *)&searchBarVisualProviderFlags & 0x20000) == 0) == v3)
    {
      v9 = v5;
      if (v3)
        v7 = 0x20000;
      else
        v7 = 0;
      self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&searchBarVisualProviderFlags & 0xFFFDFFFF | v7);
      -[UISearchBarBackground setUsesEmbeddedAppearance:](self->_searchBarBackground, "setUsesEmbeddedAppearance:", v3);
      barTintColor = self->_barTintColor;
      if (barTintColor)
        -[_UISearchBarVisualProviderLegacy setBarTintColor:forceUpdate:](self, "setBarTintColor:forceUpdate:", barTintColor, 1);
      objc_msgSend(v9, "setNeedsLayout");
      v5 = v9;
    }
  }

}

- (BOOL)usesEmbeddedAppearance
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 1) & 1;
}

- (void)setShowsCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  int v14;
  id WeakRetained;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[5];
  id v22;
  BOOL v23;
  BOOL v24;

  v4 = a4;
  v5 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && ((((*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 4) == 0) ^ v5) & 1) == 0)
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66___UISearchBarVisualProviderLegacy_setShowsCancelButton_animated___block_invoke;
    aBlock[3] = &unk_1E16B4E20;
    v23 = v5;
    aBlock[4] = self;
    v24 = v4;
    v10 = v7;
    v22 = v10;
    v11 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v10, "_searchController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_managedPalette");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v11[2](v11);
    else
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
    if (v5)
      v14 = 0x40000;
    else
      v14 = 0;
    self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFBFFFF | v14);
    objc_msgSend(v10, "setNeedsLayout");
    if (-[_UISearchBarVisualProviderLegacy centerPlaceholder](self, "centerPlaceholder"))
    {
      WeakRetained = objc_loadWeakRetained(&self->_searchDisplayController);

      if (!WeakRetained && v4 && (*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 4) != 0)
      {
        -[_UISearchBarVisualProviderLegacy allowCursorToAppear:](self, "allowCursorToAppear:", 0);
        objc_msgSend(v10, "textInputTraits");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setDeferBecomingResponder:", 0);

      }
    }
    if (v4)
    {
      v19[0] = v9;
      v19[1] = 3221225472;
      v19[2] = __66___UISearchBarVisualProviderLegacy_setShowsCancelButton_animated___block_invoke_2;
      v19[3] = &unk_1E16B1B28;
      v20 = v10;
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __66___UISearchBarVisualProviderLegacy_setShowsCancelButton_animated___block_invoke_3;
      v17[3] = &unk_1E16B2218;
      v17[4] = self;
      v18 = v20;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v19, v17, 0.25, 0.0);

    }
    else if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 4) == 0)
    {
      -[_UISearchBarVisualProviderLegacy destroyCancelButton](self, "destroyCancelButton");
    }
    if (-[_UISearchBarVisualProviderLegacy isInBarButNotHosted](self, "isInBarButNotHosted"))
      -[_UISearchBarVisualProviderLegacy displayNavBarCancelButton:animated:](self, "displayNavBarCancelButton:animated:", (*(_DWORD *)&self->_searchBarVisualProviderFlags >> 18) & 1, v4);

  }
}

- (void)setShowsCancelButton:(BOOL)a3
{
  -[_UISearchBarVisualProviderLegacy setShowsCancelButton:animated:](self, "setShowsCancelButton:animated:", a3, 0);
}

- (void)_setShowsCancelButton:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFBFFFF | v3);
}

- (BOOL)showsCancelButton
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 2) & 1;
}

- (void)setAutoDisableCancelButton:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFF7FFFF | v3);
  if (!a3)
    -[UIButton setEnabled:](self->_cancelButton, "setEnabled:", 1);
}

- (void)_setAutoDisableCancelButton:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFF7FFFF | v3);
}

- (BOOL)autoDisableCancelButton
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 3) & 1;
}

- (void)setShowsSearchResultsButton:(BOOL)a3
{
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  int v4;

  searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((((*(_DWORD *)&searchBarVisualProviderFlags & 0x200000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 0x200000;
    else
      v4 = 0;
    self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&searchBarVisualProviderFlags & 0xFFDFFFFF | v4);
    -[_UISearchBarVisualProviderLegacy updateRightView](self, "updateRightView");
  }
}

- (void)_setShowsSearchResultsButton:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFDFFFFF | v3);
}

- (BOOL)showsSearchResultsButton
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 5) & 1;
}

- (void)setSearchResultsButtonSelected:(BOOL)a3
{
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  int v4;

  searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((((*(_DWORD *)&searchBarVisualProviderFlags & 0x400000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 0x400000;
    else
      v4 = 0;
    self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&searchBarVisualProviderFlags & 0xFFBFFFFF | v4);
    -[_UISearchBarVisualProviderLegacy updateRightView](self, "updateRightView");
  }
}

- (void)_setSearchResultsButtonSelected:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFBFFFFF | v3);
}

- (BOOL)isSearchResultsButtonSelected
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 6) & 1;
}

- (void)setShowsBookmarkButton:(BOOL)a3
{
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  int v4;

  searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if (((((*(_DWORD *)&searchBarVisualProviderFlags & 0x800000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 0x800000;
    else
      v4 = 0;
    self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&searchBarVisualProviderFlags & 0xFF7FFFFF | v4);
    -[_UISearchBarVisualProviderLegacy updateRightView](self, "updateRightView");
  }
}

- (void)_setShowsBookmarkButton:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFF7FFFFF | v3);
}

- (BOOL)showsBookmarkButton
{
  return *((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 2) >> 7;
}

- (void)setShowsScopeBar:(BOOL)a3 animateOpacity:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v5;
  void *v7;
  void *v8;
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  int v10;
  int v11;
  unsigned int v12;
  int v13;
  double v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];
  char v18;

  v4 = a4;
  v5 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if (((((*(_DWORD *)&searchBarVisualProviderFlags & 0x10000000) == 0) ^ v5) & 1) == 0)
    {
      if ((v5 & v4) != 0)
        v10 = 0x40000000;
      else
        v10 = 0;
      v11 = *(_DWORD *)&searchBarVisualProviderFlags & 0x2FFFFFFF;
      if ((v4 & ~v5) != 0)
        v12 = 0x80000000;
      else
        v12 = 0;
      if (v5)
        v13 = 0x10000000;
      else
        v13 = 0;
      self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(v10 | v13 | v12 | v11);
      objc_msgSend(v7, "invalidateIntrinsicContentSize");
      objc_msgSend(v8, "setNeedsLayout");
      if (v4)
      {
        v14 = 1.0;
        if (v5)
          v14 = 0.0;
        -[UIView setAlpha:](self->_scopeBarContainerView, "setAlpha:", v14);
        v16[4] = self;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke;
        v17[3] = &unk_1E16B1B78;
        v18 = v5;
        v17[4] = self;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __68___UISearchBarVisualProviderLegacy_setShowsScopeBar_animateOpacity___block_invoke_4;
        v16[3] = &unk_1E16B3FD8;
        +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v17, v16, 0.0, 0.0);
      }
      if (self->_scopeBarContainerView)
        v15 = v5;
      else
        v15 = 0;
      -[UISearchBarBackground setUsesContiguousBarBackground:](self->_searchBarBackground, "setUsesContiguousBarBackground:", v15);
    }
  }

}

- (void)setShowsScopeBar:(BOOL)a3
{
  -[_UISearchBarVisualProviderLegacy setShowsScopeBar:animateOpacity:](self, "setShowsScopeBar:animateOpacity:", a3, 0);
}

- (void)_setShowsScopeBar:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xEFFFFFFF | v3);
}

- (BOOL)showsScopeBar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 4) & 1;
}

- (void)setAllowsInlineScopeBar:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xDFFFFFFF | v3);
}

- (BOOL)allowsInlineScopeBar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 5) & 1;
}

- (BOOL)backgroundLayoutNeedsUpdate
{
  return *((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 1;
}

- (void)setPlacedInNavigationBar:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFEFFFFFF | v3);
}

- (BOOL)isPlacedInNavigationBar
{
  return *((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 1;
}

- (void)setPlacedInToolbar:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFDFFFFFF | v3);
}

- (BOOL)isPlacedInToolbar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 1) & 1;
}

- (void)setInNavigationPalette:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFBFFFFFF | v3);
}

- (BOOL)isInNavigationPalette
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 2) & 1;
}

- (void)setHostedByNavigationBar:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xF7FFFFFF | v3);
}

- (BOOL)isHostedByNavigationBar
{
  return (*((unsigned __int8 *)&self->_searchBarVisualProviderFlags + 3) >> 3) & 1;
}

- (void)setCancelButton:(id)a3
{
  UIButton *v5;
  UIButton **p_cancelButton;
  UIButton *v7;

  v5 = (UIButton *)a3;
  p_cancelButton = &self->_cancelButton;
  if (*p_cancelButton != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](*p_cancelButton, "removeFromSuperview");
    objc_storeStrong((id *)p_cancelButton, a3);
    v5 = v7;
  }

}

- (void)setScopeTitles:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *scopeTitles;
  UISegmentedControl *scopeBar;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t selectedScope;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_scopeTitles, "isEqualToArray:", v4) || v4 && !self->_scopeTitles)
  {
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    scopeTitles = self->_scopeTitles;
    self->_scopeTitles = v5;

    -[_UISearchBarVisualProviderLegacy setUpScopeBar](self, "setUpScopeBar");
    scopeBar = self->_scopeBar;
    if (scopeBar)
    {
      -[UISegmentedControl removeAllSegments](scopeBar, "removeAllSegments");
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
        v12 = *(_QWORD *)v17;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v8);
            -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_scopeBar, "insertSegmentWithTitle:atIndex:animated:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v11 + v13, 0, (_QWORD)v16);
            ++v13;
          }
          while (v10 != v13);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          v11 += v13;
        }
        while (v10);
      }

      selectedScope = self->_selectedScope;
      if (selectedScope >= objc_msgSend(v8, "count"))
      {
        v15 = objc_msgSend(v8, "count") - 1;
        self->_selectedScope = v15;
      }
      else
      {
        v15 = self->_selectedScope;
      }
      -[UISegmentedControl setSelectedSegmentIndex:](self->_scopeBar, "setSelectedSegmentIndex:", v15, (_QWORD)v16);
    }
  }

}

- (void)setMinimumContentInset:(UIEdgeInsets)a3
{
  if (self->_minimumContentInsetPrivate.left != a3.left
    || self->_minimumContentInsetPrivate.top != a3.top
    || self->_minimumContentInsetPrivate.right != a3.right
    || self->_minimumContentInsetPrivate.bottom != a3.bottom)
  {
    self->_minimumContentInsetPrivate = a3;
    -[_UISearchBarVisualProviderLegacy updateEffectiveContentInset](self, "updateEffectiveContentInset");
  }
}

- (void)setBackdropStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && self->_backdropStyle != a3)
  {
    self->_backdropStyle = a3;
    self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFFFFFC7 | 0x10);
    v12 = v5;
    -[_UISearchBarVisualProviderLegacy updateNeedForBackdrop](self, "updateNeedForBackdrop");
    -[UISearchBarBackground setSearchBarStyle:](self->_searchBarBackground, "setSearchBarStyle:", ((unint64_t)self->_searchBarVisualProviderFlags >> 3) & 7);
    objc_msgSend(v12, "_searchBarTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_systemBackgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupBlending:", 0);

    objc_msgSend(v12, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

    objc_msgSend(v7, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupBlending:", 0);

    objc_msgSend(v7, "setBackgroundContainer:", 1);
    objc_msgSend(v6, "updateForBackdropStyle:", self->_backdropStyle);
    -[_UISearchBarVisualProviderLegacy colorForComponent:disabled:](self, "colorForComponent:disabled:", 4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v11);

    -[_UISearchBarVisualProviderLegacy updatePlaceholderColor](self, "updatePlaceholderColor");
    -[_UISearchBarVisualProviderLegacy updateMagnifyingGlassView](self, "updateMagnifyingGlassView");
    -[_UISearchBarVisualProviderLegacy updateRightView](self, "updateRightView");
    objc_msgSend(v12, "setNeedsLayout");

    v5 = v12;
  }

}

- (void)setBarPosition:(int64_t)a3
{
  void *v5;
  void *WeakRetained;
  int64_t barPosition;
  _BOOL8 v8;
  id v9;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && self->_barPosition != a3)
  {
    v9 = v5;
    if (!a3)
      a3 = 2;
    -[UISearchBarBackground _setBarPosition:](self->_searchBarBackground, "_setBarPosition:", a3);
    self->_barPosition = a3;
    *(_DWORD *)&self->_searchBarVisualProviderFlags |= 0x10000u;
    WeakRetained = objc_loadWeakRetained(&self->_searchDisplayController);
    if (!WeakRetained
      && (objc_msgSend(v9, "_searchController"), (WeakRetained = (void *)objc_claimAutoreleasedReturnValue()) == 0)
      || (barPosition = self->_barPosition, WeakRetained, barPosition == 3))
    {
      v8 = self->_barPosition != 3 && (*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 0xC) == 0;
      -[_UISearchBarVisualProviderLegacy setClippingViewActive:](self, "setClippingViewActive:", v8);
    }
    -[_UISearchBarVisualProviderLegacy updateEffectiveContentInset](self, "updateEffectiveContentInset");
    objc_msgSend(v9, "setNeedsLayout");
    v5 = v9;
  }

}

- (int64_t)barPosition
{
  if (self->_searchBarBackground)
    return -[UISearchBarBackground _barPosition](self->_searchBarBackground, "_barPosition");
  else
    return self->_barPosition;
}

- (void)setPrompt:(id)a3
{
  void *v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *promptLabel;
  id v8;

  v8 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = self->_promptLabel;
    v6 = v5;
    if (v8)
    {
      if (!v5)
      {
        -[_UISearchBarVisualProviderLegacy setUpPromptLabel](self, "setUpPromptLabel");
        v6 = self->_promptLabel;
        objc_msgSend(v4, "invalidateIntrinsicContentSize");
      }
      -[UILabel setText:](v6, "setText:");
      goto LABEL_8;
    }
    if (v5)
    {
      -[UIView removeFromSuperview](self->_promptLabel, "removeFromSuperview");
      promptLabel = self->_promptLabel;
      self->_promptLabel = 0;

      objc_msgSend(v4, "invalidateIntrinsicContentSize");
LABEL_8:

    }
  }

}

- (id)prompt
{
  return -[UILabel text](self->_promptLabel, "text");
}

- (id)searchField
{
  UISearchBarTextField *searchField;

  searchField = self->_searchField;
  if (!searchField)
  {
    -[_UISearchBarVisualProviderLegacy setUpSearchField](self, "setUpSearchField");
    searchField = self->_searchField;
  }
  return searchField;
}

- (id)searchFieldIfExists
{
  return self->_searchField;
}

- (id)leftButton
{
  -[_UISearchBarVisualProviderLegacy setUpLeftButton](self, "setUpLeftButton");
  return self->_leftButton;
}

- (id)cancelBarButtonItem
{
  void *v3;
  UIBarButtonItem *v4;
  NSString *cancelButtonText;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *cancelBarButtonItem;
  UIBarButtonItem *v9;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!self->_cancelBarButtonItem)
    {
      v4 = [UIBarButtonItem alloc];
      cancelButtonText = self->_cancelButtonText;
      v6 = cancelButtonText;
      if (!cancelButtonText)
      {
        _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v7 = -[UIBarButtonItem initWithTitle:style:target:action:](v4, "initWithTitle:style:target:action:", v6, 2, v3, sel__cancelButtonPressed);
      cancelBarButtonItem = self->_cancelBarButtonItem;
      self->_cancelBarButtonItem = v7;

      if (!cancelButtonText)
    }
    v9 = self->_cancelBarButtonItem;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)prepare
{
  void *v4;
  UIView *v5;
  UIView *v6;
  UIView *searchBarClippingView;
  UISearchBarBackground *v8;
  UISearchBarBackground *v9;
  UISearchBarBackground *searchBarBackground;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UISearchBarVisualProviderLegacy;
  -[_UISearchBarVisualProviderBase prepare](&v12, sel_prepare);
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarVisualProviderLegacy.m"), 789, CFSTR("visual provider can not prepare without delegate"));

  }
  self->_tableViewIndexWidth = 0.0;
  *(_OWORD *)&self->_minimumContentInsetPrivate.top = 0u;
  *(_OWORD *)&self->_minimumContentInsetPrivate.bottom = 0u;
  *(_DWORD *)&self->_searchBarVisualProviderFlags |= 0x80000u;
  -[_UISearchBarVisualProviderLegacy updateEffectiveContentInset](self, "updateEffectiveContentInset");
  v5 = [UIView alloc];
  objc_msgSend(v4, "bounds");
  v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
  searchBarClippingView = self->_searchBarClippingView;
  self->_searchBarClippingView = v6;

  -[UIView setAutoresizingMask:](self->_searchBarClippingView, "setAutoresizingMask:", 18);
  -[UIView setClipsToBounds:](self->_searchBarClippingView, "setClipsToBounds:", 1);
  objc_msgSend(v4, "addSubview:", self->_searchBarClippingView);
  *(_DWORD *)&self->_searchBarVisualProviderFlags |= 0x14E00u;
  v8 = [UISearchBarBackground alloc];
  objc_msgSend(v4, "bounds");
  v9 = -[UISearchBarBackground initWithFrame:](v8, "initWithFrame:");
  searchBarBackground = self->_searchBarBackground;
  self->_searchBarBackground = v9;

  objc_msgSend(v4, "insertSubview:atIndex:", self->_searchBarBackground, 0);
}

- (id)runtimeOnlyViews
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_searchBarClippingView)
    objc_msgSend(v3, "addObject:");
  if (self->_promptLabel)
    objc_msgSend(v4, "addObject:");
  if (self->_cancelButton)
    objc_msgSend(v4, "addObject:");
  if (self->_searchField)
    objc_msgSend(v4, "addObject:");
  if (self->_separator)
    objc_msgSend(v4, "addObject:");
  if (self->_searchBarBackground)
    objc_msgSend(v4, "addObject:");
  if (self->_scopeBarContainerView)
    objc_msgSend(v4, "addObject:");
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)teardown
{
  void *v4;
  void *v5;
  objc_super v6;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarVisualProviderLegacy.m"), 834, CFSTR("visual provider can not clean up without delegate"));

  }
  -[UIControl removeTarget:action:forControlEvents:](self->_scopeBar, "removeTarget:action:forControlEvents:", v4, 0, 0xFFFFFFFFLL);
  -[UIControl removeTarget:action:forControlEvents:](self->_searchField, "removeTarget:action:forControlEvents:", v4, 0, 0xFFFFFFFFLL);
  -[UISearchTextField setDelegate:](self->_searchField, "setDelegate:", 0);
  -[UITextField removeFromSuperview](self->_searchField, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_promptLabel, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_cancelButton, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_separator, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_searchBarBackground, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_scopeBarContainerView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_scopeBarBackgroundView, "removeFromSuperview");
  v6.receiver = self;
  v6.super_class = (Class)_UISearchBarVisualProviderLegacy;
  -[_UISearchBarVisualProviderBase teardown](&v6, sel_teardown);

}

- (void)destroyCancelButton
{
  UIButton *cancelButton;

  -[UIView removeFromSuperview](self->_cancelButton, "removeFromSuperview");
  cancelButton = self->_cancelButton;
  self->_cancelButton = 0;

}

- (void)destroyPromptLabel
{
  UILabel *promptLabel;

  -[UIView removeFromSuperview](self->_promptLabel, "removeFromSuperview");
  promptLabel = self->_promptLabel;
  self->_promptLabel = 0;

}

- (id)currentSeparatorImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;

  -[_UISearchBarAppearanceStorage separatorImage](self->_appearanceStorage, "separatorImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UISearchBarAppearanceStorage separatorImage](self->_appearanceStorage, "separatorImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((*(_BYTE *)&self->_searchBarVisualProviderFlags & 7) != 0
      || (-[_UISearchBarVisualProviderLegacy effectiveBarTintColor](self, "effectiveBarTintColor"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      -[_UISearchBarVisualProviderLegacy effectiveBarTintColor](self, "effectiveBarTintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 || (*(_DWORD *)&self->_searchBarVisualProviderFlags & 7) == 1)
        && (v7 = *(_DWORD *)&self->_searchBarVisualProviderFlags & 0x1C0, v6, v7 != 64))
      {
        v8 = CFSTR("UISearchBarBlackSeparator.png");
      }
      else
      {
        v8 = CFSTR("UISearchBarBlackTranslucentSeparator.png");
      }
    }
    else
    {
      v8 = CFSTR("UISearchBarDefaultSeparator.png");
    }
    _UIImageWithName(v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)separatorImage
{
  return -[_UISearchBarAppearanceStorage separatorImage](self->_appearanceStorage, "separatorImage");
}

- (void)setSeparatorImage:(id)a3
{
  id v4;
  _UISearchBarAppearanceStorage *appearanceStorage;
  _UISearchBarAppearanceStorage *v6;
  _UISearchBarAppearanceStorage *v7;
  id v8;
  UIImageView *separator;
  void *v10;
  id v11;

  v4 = a3;
  appearanceStorage = self->_appearanceStorage;
  v11 = v4;
  if (v4)
  {
    if (!appearanceStorage)
    {
      v6 = objc_alloc_init(_UISearchBarAppearanceStorage);
      v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_7;
  }
  -[_UISearchBarAppearanceStorage separatorImage](appearanceStorage, "separatorImage");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v11;
  if (v8 != v11)
  {
    -[_UISearchBarAppearanceStorage setSeparatorImage:](self->_appearanceStorage, "setSeparatorImage:", v11);
    separator = self->_separator;
    -[_UISearchBarVisualProviderLegacy currentSeparatorImage](self, "currentSeparatorImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](separator, "setImage:", v10);

    v4 = v11;
  }
LABEL_7:

}

- (void)setSearchFieldBackgroundImage:(id)a3 forState:(unint64_t)a4
{
  id v6;
  _UISearchBarAppearanceStorage *appearanceStorage;
  _UISearchBarAppearanceStorage *v8;
  _UISearchBarAppearanceStorage *v9;
  id v10;
  id v11;

  v6 = a3;
  appearanceStorage = self->_appearanceStorage;
  v11 = v6;
  if (v6)
  {
    if (!appearanceStorage)
    {
      v8 = objc_alloc_init(_UISearchBarAppearanceStorage);
      v9 = self->_appearanceStorage;
      self->_appearanceStorage = v8;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_7;
  }
  -[_UISearchBarAppearanceStorage searchFieldBackgroundImageForState:](appearanceStorage, "searchFieldBackgroundImageForState:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v11;
  if (v10 != v11)
  {
    -[_UISearchBarAppearanceStorage setSearchFieldBackgroundImage:forState:](self->_appearanceStorage, "setSearchFieldBackgroundImage:forState:", v11, 2 * (a4 != 0));
    -[_UISearchBarVisualProviderLegacy updateSearchFieldArt](self, "updateSearchFieldArt");
    v6 = v11;
  }
LABEL_7:

}

- (id)searchFieldBackgroundImageForState:(unint64_t)a3
{
  return -[_UISearchBarAppearanceStorage searchFieldBackgroundImageForState:](self->_appearanceStorage, "searchFieldBackgroundImageForState:", 2 * (a3 != 0));
}

- (id)internalImageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4
{
  return -[_UISearchBarVisualProviderLegacy internalImageForSearchBarIcon:state:customImage:](self, "internalImageForSearchBarIcon:state:customImage:", a3, a4, 0);
}

- (id)internalImageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4 customImage:(BOOL *)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  UIImage *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v12 = objc_alloc_init(UIImage);
LABEL_6:
    v11 = v12;
    goto LABEL_33;
  }
  -[_UISearchBarAppearanceStorage imageForIcon:state:](self->_appearanceStorage, "imageForIcon:state:", a3, a4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (a5)
      *a5 = 0;
    if (a3 == 3)
    {
      if (!internalImageForSearchBarIcon_state_customImage__searchBarIcons)
      {
        v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
        v15 = (void *)internalImageForSearchBarIcon_state_customImage__searchBarIcons;
        internalImageForSearchBarIcon_state_customImage__searchBarIcons = v14;

      }
      objc_msgSend(v9, "_searchBarTextField");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "_partsShouldBeMini");

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SearchBarResults_state:%lu_mini:%d_barStyle:%d_searchBarStyle:%lu_backdropStyle:%lu"), a4, v17, *(_DWORD *)&self->_searchBarVisualProviderFlags & 7, ((unint64_t)self->_searchBarVisualProviderFlags >> 3) & 7, self->_backdropStyle);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)internalImageForSearchBarIcon_state_customImage__searchBarIcons, "objectForKey:", v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        goto LABEL_32;
      v19 = CFSTR("UITextFieldSearchResultsListButtonMini.png");
      v20 = CFSTR("UITextFieldSearchResultsListButton.png");
    }
    else
    {
      if (a3 != 2)
      {
        if (a3)
        {
          v11 = 0;
          goto LABEL_33;
        }
        if (UISearchBarUsesModernAppearance())
          v13 = CFSTR("UISearchFieldIconLarger.png");
        else
          v13 = CFSTR("UISearchFieldIcon.png");
        _UIImageWithName(v13);
        v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
      if (!internalImageForSearchBarIcon_state_customImage__searchBarIcons)
      {
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
        v22 = (void *)internalImageForSearchBarIcon_state_customImage__searchBarIcons;
        internalImageForSearchBarIcon_state_customImage__searchBarIcons = v21;

      }
      objc_msgSend(v9, "_searchBarTextField");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v23, "_partsShouldBeMini");

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SearchBarBookmark_state:%lu_mini:%d_barStyle:%d_searchBarStyle:%lu_backdropStyle:%lu"), a4, v17, *(_DWORD *)&self->_searchBarVisualProviderFlags & 7, ((unint64_t)self->_searchBarVisualProviderFlags >> 3) & 7, self->_backdropStyle);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)internalImageForSearchBarIcon_state_customImage__searchBarIcons, "objectForKey:", v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
LABEL_32:

        goto LABEL_33;
      }
      v19 = CFSTR("UISearchBarBookmarksMini.png");
      v20 = CFSTR("UISearchBarBookmarks.png");
    }
    if (v17)
      v24 = (__CFString *)v20;
    else
      v24 = (__CFString *)v19;
    _UIImageWithName(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 1)
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.047, 0.455, 0.867, 1.0);
    else
      -[_UISearchBarVisualProviderLegacy colorForComponent:disabled:](self, "colorForComponent:disabled:", 0, a4 == 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "size");
    +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v26, 0, v25, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)internalImageForSearchBarIcon_state_customImage__searchBarIcons, "setObject:forKey:", v11, v18);

    goto LABEL_32;
  }
  v11 = (void *)v10;
  if (a5)
    *a5 = 1;
LABEL_33:

  return v11;
}

- (void)setImage:(id)a3 forSearchBarIcon:(int64_t)a4 state:(unint64_t)a5
{
  void *v8;
  _UISearchBarAppearanceStorage *appearanceStorage;
  _UISearchBarAppearanceStorage *v10;
  _UISearchBarAppearanceStorage *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    appearanceStorage = self->_appearanceStorage;
    if (v14)
    {
      if (!appearanceStorage)
      {
        v10 = objc_alloc_init(_UISearchBarAppearanceStorage);
        v11 = self->_appearanceStorage;
        self->_appearanceStorage = v10;

        appearanceStorage = self->_appearanceStorage;
      }
    }
    else if (!appearanceStorage)
    {
      goto LABEL_14;
    }
    if (a5 >= 3)
      a5 = 1;
    -[_UISearchBarAppearanceStorage imageForIcon:state:](appearanceStorage, "imageForIcon:state:", a4, a5);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 != v14)
    {
      -[_UISearchBarAppearanceStorage setImage:forIcon:state:](self->_appearanceStorage, "setImage:forIcon:state:", v14, a4, a5);
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        -[_UISearchBarVisualProviderLegacy updateRightView](self, "updateRightView");
      }
      else if (a4)
      {
        objc_msgSend(v8, "_searchBarTextField");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_setClearButtonImage:forState:", v14, a5);

      }
      else
      {
        -[_UISearchBarVisualProviderLegacy updateMagnifyingGlassView](self, "updateMagnifyingGlassView");
      }
    }
  }
LABEL_14:

}

- (id)imageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4
{
  _UISearchBarAppearanceStorage *appearanceStorage;

  appearanceStorage = self->_appearanceStorage;
  if (a4 >= 3)
    a4 = 1;
  return -[_UISearchBarAppearanceStorage imageForIcon:state:](appearanceStorage, "imageForIcon:state:", a3, a4);
}

- (void)setScopeBarBackgroundImage:(id)a3
{
  id v4;
  _UISearchBarAppearanceStorage *appearanceStorage;
  _UISearchBarAppearanceStorage *v6;
  _UISearchBarAppearanceStorage *v7;
  id v8;
  id v9;

  v4 = a3;
  if (v4 || self->_scopeBar)
  {
    v9 = v4;
    appearanceStorage = self->_appearanceStorage;
    if (!appearanceStorage)
    {
      v6 = objc_alloc_init(_UISearchBarAppearanceStorage);
      v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
    -[_UISearchBarAppearanceStorage scopeBarBackgroundImage](appearanceStorage, "scopeBarBackgroundImage");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
      -[_UISearchBarAppearanceStorage setScopeBarBackgroundImage:](self->_appearanceStorage, "setScopeBarBackgroundImage:", v9);
    -[_UISearchBarVisualProviderLegacy setUpScopeBar](self, "setUpScopeBar");
    v4 = v9;
  }

}

- (id)scopeBarBackgroundImage
{
  return -[_UISearchBarAppearanceStorage scopeBarBackgroundImage](self->_appearanceStorage, "scopeBarBackgroundImage");
}

- (void)setSearchFieldBackgroundPositionAdjustment:(UIOffset)a3
{
  double vertical;
  double horizontal;
  void *v6;
  _UISearchBarAppearanceStorage *appearanceStorage;
  _UISearchBarAppearanceStorage *v8;
  _UISearchBarAppearanceStorage *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  _UISearchBarAppearanceStorage *v15;
  void *v16;
  _QWORD v17[2];

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    appearanceStorage = self->_appearanceStorage;
    if (!appearanceStorage)
    {
      if (horizontal == 0.0 && vertical == 0.0)
        goto LABEL_15;
      v8 = objc_alloc_init(_UISearchBarAppearanceStorage);
      v9 = self->_appearanceStorage;
      self->_appearanceStorage = v8;

      appearanceStorage = self->_appearanceStorage;
    }
    -[_UISearchBarAppearanceStorage searchFieldPositionAdjustment](appearanceStorage, "searchFieldPositionAdjustment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "UIOffsetValue");
    }
    else
    {
      v12 = 0.0;
      v13 = 0.0;
    }
    if (horizontal != v12 || vertical != v13)
    {
      v15 = self->_appearanceStorage;
      *(double *)v17 = horizontal;
      *(double *)&v17[1] = vertical;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v17, "{UIOffset=dd}");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarAppearanceStorage setSearchFieldPositionAdjustment:](v15, "setSearchFieldPositionAdjustment:", v16);

      objc_msgSend(v6, "setNeedsLayout");
    }

  }
LABEL_15:

}

- (UIOffset)searchFieldBackgroundPositionAdjustment
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIOffset result;

  -[_UISearchBarAppearanceStorage searchFieldPositionAdjustment](self->_appearanceStorage, "searchFieldPositionAdjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "UIOffsetValue");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    v5 = 0.0;
    v7 = 0.0;
  }

  v8 = v5;
  v9 = v7;
  result.vertical = v9;
  result.horizontal = v8;
  return result;
}

- (void)setBackgroundImage:(id)a3 forBarPosition:(int64_t)a4 barMetrics:(int64_t)a5
{
  -[UISearchBarBackground _setBackgroundImage:forBarPosition:barMetrics:](self->_searchBarBackground, "_setBackgroundImage:forBarPosition:barMetrics:", a3, a4, a5);
  -[_UISearchBarVisualProviderLegacy updateNeedForBackdrop](self, "updateNeedForBackdrop");
}

- (id)backgroundImageForBarPosition:(int64_t)a3 barMetrics:(int64_t)a4
{
  return -[UISearchBarBackground _backgroundImageForBarPosition:barMetrics:](self->_searchBarBackground, "_backgroundImageForBarPosition:barMetrics:", a3, a4);
}

- (BOOL)hasDarkUIAppearance
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    v6 = objc_msgSend(v3, "keyboardAppearance");
    v7 = 0;
    if (v6 <= 8)
    {
      if (v6)
      {
        if (v6 != 1)
          goto LABEL_11;
        goto LABEL_9;
      }
LABEL_10:
      v7 = v5 == 2;
      goto LABEL_11;
    }
    if (v6 == 10)
      goto LABEL_10;
    if (v6 == 9)
LABEL_9:
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (id)colorForComponent:(unint64_t)a3 disabled:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  int64_t backdropStyle;
  uint64_t v9;
  double v10;
  double v11;
  int64_t v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v4 = a4;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v15 = (void *)v9;
    goto LABEL_25;
  }
  backdropStyle = self->_backdropStyle;
  if (backdropStyle == 2030)
  {
    if (v4)
    {
LABEL_8:
      v10 = 0.35;
      v11 = 1.0;
LABEL_23:
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v11, v10);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    v11 = 1.0;
    if (a3 != 4)
    {
      v10 = 0.5;
      goto LABEL_23;
    }
LABEL_22:
    v10 = 1.0;
    goto LABEL_23;
  }
  if (backdropStyle == 2020)
  {
    if (!v4)
      goto LABEL_20;
    goto LABEL_8;
  }
  if (-[_UISearchBarVisualProviderLegacy barStyle](self, "barStyle"))
  {
    if (v4)
    {
      v11 = 0.47;
      v10 = 0.35;
      goto LABEL_23;
    }
    if (a3 == 4)
    {
LABEL_20:
      +[UIColor whiteColor](UIColor, "whiteColor");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    v11 = 0.47;
    goto LABEL_22;
  }
  v12 = self->_backdropStyle;
  if ((v12 == 2010 || v12 == 2005) && ((v13 = UISearchBarUsesModernAppearance(), a3 == 4) || !v13))
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor systemGrayColor](UIColor, "systemGrayColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  if (v4)
  {
    objc_msgSend(v14, "colorWithAlphaComponent:", 0.35);
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v17;
  }
LABEL_25:

  return v15;
}

- (id)textColor
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  void *v8;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (self->_backdropStyle)
    {
      -[_UISearchBarVisualProviderLegacy colorForComponent:disabled:](self, "colorForComponent:disabled:", 4, 0);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[_UISearchBarVisualProviderLegacy barStyle](self, "barStyle"))
      {
        objc_msgSend(v3, "_searchBarTextField");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "visualStyle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "defaultTextColor");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.47, 1.0);
      v4 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_8:

  return v5;
}

- (void)_setBarTintColor:(id)a3
{
  int v4;
  void *v5;
  id obj;

  obj = a3;
  v4 = dyld_program_sdk_at_least();
  v5 = obj;
  if (v4)
  {
    objc_msgSend(obj, "colorWithAlphaComponent:", 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_barTintColor, v5);
  if (v4)

}

- (void)setBarTintColor:(id)a3 forceUpdate:(BOOL)a4
{
  if (self->_barTintColor != a3 || a4)
  {
    -[_UISearchBarVisualProviderLegacy _setBarTintColor:](self, "_setBarTintColor:");
    -[_UISearchBarVisualProviderLegacy effectiveBarTintColorDidChange:](self, "effectiveBarTintColorDidChange:", 1);
  }
}

- (void)effectiveBarTintColorDidChange:(BOOL)a3
{
  _BOOL4 v3;
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  void *v6;
  void *v7;
  void *v8;
  UIImageView *separator;
  void *v10;
  id v11;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    -[_UISearchBarVisualProviderLegacy effectiveBarTintColor](self, "effectiveBarTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x20000) != 0)
    {
      _GetLightenedTintColor(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchBarBackground setBarTintColor:](self->_searchBarBackground, "setBarTintColor:", v8);

    }
    else
    {
      -[UISearchBarBackground setBarTintColor:](self->_searchBarBackground, "setBarTintColor:", v6);
    }

    if (self->_cancelButton)
    {
      -[_UISearchBarVisualProviderLegacy setUpCancelButtonWithAppearance:](self, "setUpCancelButtonWithAppearance:", 0);
      objc_msgSend(v11, "setNeedsLayout");
    }
    if (self->_promptLabel)
    {
      -[_UISearchBarVisualProviderLegacy setUpPromptLabel](self, "setUpPromptLabel");
      objc_msgSend(v11, "setNeedsLayout");
    }
    if (v3)
    {
      -[_UISearchBarVisualProviderLegacy updateSearchFieldArt](self, "updateSearchFieldArt");
      -[_UISearchBarVisualProviderLegacy updateMagnifyingGlassView](self, "updateMagnifyingGlassView");
      separator = self->_separator;
      if (separator)
      {
        -[_UISearchBarVisualProviderLegacy currentSeparatorImage](self, "currentSeparatorImage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setImage:](separator, "setImage:", v10);

      }
    }
    -[_UISearchBarVisualProviderLegacy updateScopeBarBackground](self, "updateScopeBarBackground");
  }

}

- (id)effectiveBarTintColor
{
  return self->_barTintColor;
}

- (void)applySearchBarStyle
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t backdropStyle;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v15 = v3;
    objc_msgSend(v3, "_searchBarTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_systemBackgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_DWORD *)&self->_searchBarVisualProviderFlags & 0x38;
    objc_msgSend(v15, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 == 16)
    {
      objc_msgSend(v7, "setAllowsGroupBlending:", 0);

      objc_msgSend(v15, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

      objc_msgSend(v5, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAllowsGroupBlending:", 0);

      objc_msgSend(v5, "setBackgroundContainer:", 1);
      if (dyld_program_sdk_at_least())
        backdropStyle = self->_backdropStyle;
      else
        backdropStyle = 2;
      objc_msgSend(v4, "updateForBackdropStyle:", backdropStyle);
    }
    else
    {
      objc_msgSend(v7, "setAllowsGroupBlending:", 1);

      objc_msgSend(v15, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAllowsGroupOpacity:", 1);

      objc_msgSend(v5, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAllowsGroupBlending:", 1);

      objc_msgSend(v5, "setBackgroundContainer:", 0);
      objc_msgSend(v4, "_removeEffectsBackgroundViews");
      objc_msgSend(v5, "updateView");
    }
    -[_UISearchBarVisualProviderLegacy updateNeedForBackdrop](self, "updateNeedForBackdrop");
    if (self->_backdropStyle)
      v14 = 2;
    else
      v14 = ((unint64_t)self->_searchBarVisualProviderFlags >> 3) & 7;
    -[UISearchBarBackground setSearchBarStyle:](self->_searchBarBackground, "setSearchBarStyle:", v14);
    -[_UISearchBarVisualProviderLegacy updatePlaceholderColor](self, "updatePlaceholderColor");
    -[_UISearchBarVisualProviderLegacy updateMagnifyingGlassView](self, "updateMagnifyingGlassView");
    -[_UISearchBarVisualProviderLegacy updateRightView](self, "updateRightView");
    objc_msgSend(v15, "setNeedsLayout");

    v3 = v15;
  }

}

- (void)updateForDrawsBackgroundInPalette
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && -[_UISearchBarVisualProviderLegacy isInNavigationPalette](self, "isInNavigationPalette"))
  {
    -[_UISearchBarVisualProviderLegacy setDrawsBackground:](self, "setDrawsBackground:", (*(_DWORD *)&self->_searchBarVisualProviderFlags >> 14) & 1);
    objc_msgSend(v7, "_containingNavigationPalette");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (*(_DWORD *)&self->_searchBarVisualProviderFlags >> 14) & 1;
    objc_msgSend(v3, "_backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v4);

    objc_msgSend(v3, "_backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v6, "isHidden");

    if ((_DWORD)v5)
      -[UISearchBarBackground _updateBackgroundImage](self->_searchBarBackground, "_updateBackgroundImage");

  }
}

- (void)updateIfNecessaryForOldSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  id v10;

  height = a3.height;
  width = a3.width;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = v6;
    objc_msgSend(v6, "bounds");
    v6 = v10;
    if (width != v8 || height != v7)
    {
      -[_UISearchBarVisualProviderLegacy layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:](self, "layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:", v7 != height);
      v6 = v10;
    }
  }

}

- (void)updateMagnifyingGlassView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  unint64_t searchBarVisualProviderFlags;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  UIImageView *v16;
  char v17;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      objc_msgSend(v3, "_searchBarTextField");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "leftView");
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        objc_msgSend(v4, "leftView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          goto LABEL_14;
      }
      else
      {

      }
    }
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((searchBarVisualProviderFlags & 0x600) != 0)
    {
      v17 = 0;
      -[_UISearchBarVisualProviderLegacy internalImageForSearchBarIcon:state:customImage:](self, "internalImageForSearchBarIcon:state:customImage:", 0, (searchBarVisualProviderFlags >> 11) & 2, &v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        -[_UISearchBarVisualProviderLegacy colorForComponent:disabled:](self, "colorForComponent:disabled:", 2, (*(_DWORD *)&self->_searchBarVisualProviderFlags >> 12) & 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "size");
        +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v11, 0, v10, 0);
        v12 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v12;
      }
      objc_msgSend(v3, "_searchBarTextField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "leftView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v13, "leftView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setImage:", v10);

        objc_msgSend(v13, "leftView");
        v16 = (UIImageView *)objc_claimAutoreleasedReturnValue();
        -[UIView sizeToFit](v16, "sizeToFit");
      }
      else
      {
        v16 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v10);
        objc_msgSend(v13, "setLeftView:", v16);
      }

      objc_msgSend(v3, "setNeedsLayout");
    }
  }
LABEL_14:

}

- (void)_removeLegacyBackdropView
{
  _UIBackdropView *backdrop;

  -[UIView removeFromSuperview](self->_backdrop, "removeFromSuperview");
  backdrop = self->_backdrop;
  self->_backdrop = 0;

}

- (void)_removeBackdropVisualEffectView
{
  UIVisualEffectView *backdropVisualEffectView;

  -[UIView removeFromSuperview](self->_backdropVisualEffectView, "removeFromSuperview");
  backdropVisualEffectView = self->_backdropVisualEffectView;
  self->_backdropVisualEffectView = 0;

}

- (void)updateNeedForBackdrop
{
  UIVisualEffectView *v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *backdropVisualEffectView;
  _UIBackdropView *backdrop;
  int64_t backdropStyle;
  int64_t v9;
  _UIBackdropView *v10;
  _UIBackdropView *v11;
  id v12;

  -[UISearchBarBackground backgroundImage](self->_searchBarBackground, "backgroundImage");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 || (*(_DWORD *)&self->_searchBarVisualProviderFlags & 0x2038) != 0x10)
  {
    -[_UISearchBarVisualProviderLegacy _removeLegacyBackdropView](self, "_removeLegacyBackdropView");
    -[_UISearchBarVisualProviderLegacy _removeBackdropVisualEffectView](self, "_removeBackdropVisualEffectView");
  }
  else if (self->_backdropStyle == 2005)
  {
    -[_UISearchBarVisualProviderLegacy _removeLegacyBackdropView](self, "_removeLegacyBackdropView");
    if (!self->_backdropVisualEffectView)
    {
      v3 = [UIVisualEffectView alloc];
      +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[UIVisualEffectView initWithEffect:](v3, "initWithEffect:", v4);
      backdropVisualEffectView = self->_backdropVisualEffectView;
      self->_backdropVisualEffectView = v5;

      -[UIView addSubview:](self->_searchBarBackground, "addSubview:", self->_backdropVisualEffectView);
      -[UIView setUserInteractionEnabled:](self->_backdropVisualEffectView, "setUserInteractionEnabled:", 1);
    }
  }
  else
  {
    -[_UISearchBarVisualProviderLegacy _removeBackdropVisualEffectView](self, "_removeBackdropVisualEffectView");
    backdrop = self->_backdrop;
    backdropStyle = self->_backdropStyle;
    if (backdrop)
    {
      -[_UIBackdropView transitionToPrivateStyle:](backdrop, "transitionToPrivateStyle:", backdropStyle);
    }
    else
    {
      if (backdropStyle)
        v9 = self->_backdropStyle;
      else
        v9 = -2;
      v10 = -[_UIBackdropView initWithPrivateStyle:]([_UIBackdropView alloc], "initWithPrivateStyle:", v9);
      v11 = self->_backdrop;
      self->_backdrop = v10;

      -[UIView addSubview:](self->_searchBarBackground, "addSubview:", self->_backdrop);
      -[UIView setUserInteractionEnabled:](self->_backdrop, "setUserInteractionEnabled:", 1);
    }
    -[UIView setHidden:](self->_backdrop, "setHidden:", self->_backdropStyle == 0);
  }

}

- (void)updatePlaceholderColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_UISearchBarVisualProviderLegacy colorForComponent:disabled:](self, "colorForComponent:disabled:", 3, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_searchBarTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_placeholderLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v3);

  }
}

- (void)updateRightView
{
  void *v3;
  void *v4;
  void *v5;
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  uint64_t v7;
  $B0CEE0411BC9260FB4C6BC24420153D9 v8;
  void *v9;
  void *v10;
  void *v11;
  UIButton *v12;
  id *v13;
  id *v14;
  id v15;
  UIButton *v16;
  UIButton *v17;
  id v18;
  double v19;
  id v20;
  _QWORD v21[4];
  UIButton *v22;
  id v23;
  _QWORD v24[4];
  UIButton *v25;
  id v26;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v20 = v3;
    objc_msgSend(v3, "_searchBarTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x200000) != 0)
      v7 = 2;
    else
      v7 = (*(unsigned int *)&searchBarVisualProviderFlags >> 22) & 2;
    objc_msgSend(v4, "setRightViewMode:", v7);
    v8 = self->_searchBarVisualProviderFlags;
    if ((*(_DWORD *)&v8 & 0x200000) != 0)
    {
      -[_UISearchBarVisualProviderLegacy internalImageForSearchBarIcon:state:](self, "internalImageForSearchBarIcon:state:", 3, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarVisualProviderLegacy internalImageForSearchBarIcon:state:](self, "internalImageForSearchBarIcon:state:", 3, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarVisualProviderLegacy internalImageForSearchBarIcon:state:](self, "internalImageForSearchBarIcon:state:", 3, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(UIButton);
      -[UIControl addTarget:action:forControlEvents:](v17, "addTarget:action:forControlEvents:", v20, sel__resultsListButtonPressed, 64);
      -[UIButton setImage:forStates:](v17, "setImage:forStates:", v9, 0);
      -[UIButton setImage:forStates:](v17, "setImage:forStates:", v10, 1);
      -[UIButton setImage:forStates:](v17, "setImage:forStates:", v10, 4);
      -[UIButton setImage:forStates:](v17, "setImage:forStates:", v11, 2);
      -[UIButton setSelected:](v17, "setSelected:", (*(_DWORD *)&self->_searchBarVisualProviderFlags >> 22) & 1);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __51___UISearchBarVisualProviderLegacy_updateRightView__block_invoke;
      v24[3] = &unk_1E16B1B50;
      v13 = (id *)&v25;
      v25 = v17;
      v14 = &v26;
      v18 = v5;
      v26 = v18;
      v16 = v17;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v24);
      LODWORD(v19) = -0.5;
      -[UIView setCharge:](v16, "setCharge:", v19);
      objc_msgSend(v18, "setRightView:", v16);
      objc_msgSend(v18, "_setRightViewOffset:", -1.0, -1.0);
    }
    else
    {
      if ((*(_DWORD *)&v8 & 0x800000) == 0)
      {
LABEL_10:

        v3 = v20;
        goto LABEL_11;
      }
      -[_UISearchBarVisualProviderLegacy internalImageForSearchBarIcon:state:](self, "internalImageForSearchBarIcon:state:", 2, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarVisualProviderLegacy internalImageForSearchBarIcon:state:](self, "internalImageForSearchBarIcon:state:", 2, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarVisualProviderLegacy internalImageForSearchBarIcon:state:](self, "internalImageForSearchBarIcon:state:", 2, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc_init(UIButton);
      -[UIControl addTarget:action:forControlEvents:](v12, "addTarget:action:forControlEvents:", v20, sel__bookmarkButtonPressed, 64);
      -[UIButton setImage:forStates:](v12, "setImage:forStates:", v9, 0);
      -[UIButton setImage:forStates:](v12, "setImage:forStates:", v10, 1);
      -[UIButton setImage:forStates:](v12, "setImage:forStates:", v11, 2);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __51___UISearchBarVisualProviderLegacy_updateRightView__block_invoke_2;
      v21[3] = &unk_1E16B1B50;
      v13 = (id *)&v22;
      v22 = v12;
      v14 = &v23;
      v15 = v5;
      v23 = v15;
      v16 = v12;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v21);
      objc_msgSend(v15, "setRightView:", v16);
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (void)updateScopeBarBackground
{
  void *v3;
  void *v4;
  _UISearchBarScopeBarBackground *scopeBarBackgroundView;
  void *v6;
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  double v13;
  id v14;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && self->_scopeBarContainerView)
  {
    v14 = v3;
    -[_UISearchBarVisualProviderLegacy scopeBarBackgroundImage](self, "scopeBarBackgroundImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      scopeBarBackgroundView = self->_scopeBarBackgroundView;
      -[_UISearchBarVisualProviderLegacy scopeBarBackgroundImage](self, "scopeBarBackgroundImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](scopeBarBackgroundView, "setImage:", v6);

      -[UIImageView setBackgroundColor:](self->_scopeBarBackgroundView, "setBackgroundColor:", 0);
    }
    else if (-[_UISearchBarVisualProviderLegacy isInNavigationPalette](self, "isInNavigationPalette")
           && (*((_BYTE *)&self->_searchBarVisualProviderFlags + 1) & 0x40) == 0
           || -[_UISearchBarVisualProviderLegacy isHostedByNavigationBar](self, "isHostedByNavigationBar"))
    {
      -[UIImageView setHidden:](self->_scopeBarBackgroundView, "setHidden:", 1);
    }
    else
    {
      -[UIImageView setHidden:](self->_scopeBarBackgroundView, "setHidden:", 0);
      searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
      -[_UISearchBarVisualProviderLegacy effectiveBarTintColor](self, "effectiveBarTintColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = v8;
      if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x20000) != 0)
      {
        _GetLightenedTintColor(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      _UISearchBarBackgroundFillColor(*(_BYTE *)&searchBarVisualProviderFlags & 7, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](self->_scopeBarBackgroundView, "setBackgroundColor:", v11);

      if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x20000) != 0)
      -[UIImageView setImage:](self->_scopeBarBackgroundView, "setImage:", 0);
    }
    v12 = -[_UISearchBarVisualProviderLegacy isTranslucent](self, "isTranslucent");
    v13 = 0.96;
    if (!v12)
      v13 = 1.0;
    -[UIView setAlpha:](self->_scopeBarBackgroundView, "setAlpha:", v13);
    v3 = v14;
  }

}

- (void)updateScopeBarForSelectedScope
{
  -[UISegmentedControl setSelectedSegmentIndex:](self->_scopeBar, "setSelectedSegmentIndex:", self->_selectedScope);
}

- (void)updateSearchBarOpacity
{
  id v3;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v3, "setOpaque:", -[_UISearchBarVisualProviderLegacy isTranslucent](self, "isTranslucent") ^ 1);

}

- (void)updateScopeBarFrame
{
  uint64_t v3;
  _DWORD *v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UISegmentedControl *scopeBar;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  double MinX;
  double v36;
  double v37;
  double v38;
  _QWORD v39[9];
  double v40;
  double v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (_DWORD *)v3;
  if (self->_scopeBar)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v40 = 0.0;
    v41 = 0.0;
    -[_UISearchBarVisualProviderLegacy getScopeBarHeight:containerHeight:](self, "getScopeBarHeight:containerHeight:", &v41, &v40);
    objc_msgSend(v4, "bounds");
    -[UIView setFrame:](self->_scopeBarContainerView, "setFrame:", 0.0, v6 - v40);
    -[_UISearchBarVisualProviderLegacy scopeBarInsets](self, "scopeBarInsets");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[UIView bounds](self->_scopeBarContainerView, "bounds");
    v14 = v13 - v10 - v12;
    v15 = v41;
    if (-[_UISearchBarVisualProviderLegacy useRelaxedScopeLayout](self, "useRelaxedScopeLayout")
      && -[NSArray count](self->_scopeTitles, "count"))
    {
      v38 = v8;
      scopeBar = self->_scopeBar;
      -[UIView bounds](self->_scopeBarContainerView, "bounds");
      -[UISegmentedControl sizeThatFits:](scopeBar, "sizeThatFits:", v17, v18);
      v20 = v19 + (double)-[NSArray count](self->_scopeTitles, "count") * 78.0;
      -[UIView frame](self->_searchField, "frame");
      x = v42.origin.x;
      y = v42.origin.y;
      width = v42.size.width;
      height = v42.size.height;
      v37 = v20;
      if (v20 >= CGRectGetWidth(v42))
      {
        v8 = v38;
      }
      else
      {
        objc_msgSend(v4, "bounds");
        v8 = v38;
        v25 = round(CGRectGetMidX(v43) + v37 * -0.5);
        v36 = v25;
        v26 = v38;
        v27 = v37;
        v28 = v15;
        if ((v4[30] & 0x80000) != 0)
        {
          MinX = CGRectGetMinX(*(CGRect *)&v25);
          v45.origin.x = x;
          v45.origin.y = y;
          v45.size.width = width;
          v45.size.height = height;
          v29 = MinX >= CGRectGetMinX(v45) + 20.0;
        }
        else
        {
          MinX = CGRectGetMaxX(*(CGRect *)&v25);
          v44.origin.x = x;
          v44.origin.y = y;
          v44.size.width = width;
          v44.size.height = height;
          v29 = MinX <= CGRectGetMaxX(v44) + -20.0;
        }
        if (v29)
        {
          v14 = v37;
          v10 = v36;
        }
      }
    }
    -[UISegmentedControl frame](self->_scopeBar, "frame", *(_QWORD *)&MinX);
    v47.origin.x = v30;
    v47.origin.y = v31;
    v47.size.width = v32;
    v47.size.height = v33;
    v46.origin.x = v10;
    v46.origin.y = v8;
    v46.size.width = v14;
    v46.size.height = v15;
    if (!CGRectEqualToRect(v46, v47))
    {
      searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
      if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x40000000) != 0)
      {
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __55___UISearchBarVisualProviderLegacy_updateScopeBarFrame__block_invoke;
        v39[3] = &unk_1E16B20D8;
        v39[4] = self;
        *(double *)&v39[5] = v10;
        *(double *)&v39[6] = v8;
        *(double *)&v39[7] = v14;
        *(double *)&v39[8] = v15;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v39);
      }
      else if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x80000000) == 0)
      {
        -[UISegmentedControl setFrame:](self->_scopeBar, "setFrame:", v10, v8, v14, v15);
      }
    }
  }

}

- (void)updateSearchFieldArt
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  id v19;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v19 = v3;
    objc_msgSend(v3, "_searchBarTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchBarAppearanceStorage searchFieldBackgroundImageForState:](self->_appearanceStorage, "searchFieldBackgroundImageForState:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v4, "setBorderStyle:", 3);
      objc_msgSend(v4, "_systemBackgroundView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBarStyle:", -[_UISearchBarVisualProviderLegacy barStyle](self, "barStyle"));
LABEL_16:

      v3 = v19;
      goto LABEL_17;
    }
    -[_UISearchBarAppearanceStorage searchFieldBackgroundImageForState:](self->_appearanceStorage, "searchFieldBackgroundImageForState:", 2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v5;
    v9 = v8;

    if (objc_msgSend(v5, "_isResizable"))
    {
      objc_msgSend(v4, "setBackground:", v5);
      if (!objc_msgSend(v9, "_isResizable"))
      {
        v10 = objc_msgSend(v5, "leftCapWidth");
        v11 = objc_msgSend(v5, "topCapHeight");
        v12 = v9;
        v13 = v10;
LABEL_13:
        objc_msgSend(v12, "stretchableImageWithLeftCapWidth:topCapHeight:", v13, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setDisabledBackground:", v17);

LABEL_14:
        objc_msgSend(v4, "setBorderStyle:", 0);
        objc_msgSend(v5, "size");
        if (v18 != 28.0)
          objc_msgSend(v19, "setNeedsLayout");
        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(v5, "size");
      v15 = (uint64_t)((v14 + -1.0) * 0.5);
      objc_msgSend(v5, "stretchableImageWithLeftCapWidth:topCapHeight:", v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBackground:", v16);

      if (!objc_msgSend(v9, "_isResizable"))
      {
        v12 = v9;
        v13 = v15;
        v11 = 0;
        goto LABEL_13;
      }
    }
    objc_msgSend(v4, "setDisabledBackground:", v9);
    goto LABEL_14;
  }
LABEL_17:

}

- (void)setUpCancelButton
{
  -[_UISearchBarVisualProviderLegacy setUpCancelButtonWithAppearance:](self, "setUpCancelButtonWithAppearance:", 0);
}

- (void)setUpCancelButtonWithAppearance:(id)a3
{
  void *v4;
  UIButton *cancelButton;
  NSString *v6;
  UINavigationButton *v7;
  void *v8;
  UIButton *v9;
  UIButton *v10;
  _BOOL8 v11;
  id v12;

  v12 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    cancelButton = self->_cancelButton;
    if (cancelButton)
    {
      -[UIButton setBarStyle:](cancelButton, "setBarStyle:", *(_DWORD *)&self->_searchBarVisualProviderFlags & 7);
      -[_UISearchBarVisualProviderLegacy effectiveBarTintColor](self, "effectiveBarTintColor");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[UIButton _setTintColor:](self->_cancelButton, "_setTintColor:", v6);
    }
    else
    {
      v6 = self->_cancelButtonText;
      if (!v6)
      {
        _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel"));
        v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      v7 = [UINavigationButton alloc];
      -[_UISearchBarVisualProviderLegacy effectiveBarTintColor](self, "effectiveBarTintColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[UINavigationButton initWithValue:width:style:barStyle:possibleTitles:tintColor:](v7, "initWithValue:width:style:barStyle:possibleTitles:tintColor:", v6, 3, 0, 0, v8, 0.0);
      v10 = self->_cancelButton;
      self->_cancelButton = v9;

      -[UIButton _setAppearanceGuideClass:](self->_cancelButton, "_setAppearanceGuideClass:", objc_opt_class());
      -[UIControl addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", v4, sel__cancelButtonPressed, 64);
      objc_msgSend(v4, "addSubview:", self->_cancelButton);
      v11 = (objc_msgSend(v4, "isFirstResponder") & 1) != 0
         || (*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 8) == 0;
      -[UIButton setEnabled:](self->_cancelButton, "setEnabled:", v11);
      objc_msgSend(v4, "setNeedsLayout");
    }

    if (v12)
      -[UIButton _applyBarButtonAppearanceStorage:withTaggedSelectors:](self->_cancelButton, "_applyBarButtonAppearanceStorage:withTaggedSelectors:", v12, 0);
  }

}

- (void)setUpLeftButton
{
  void *v3;
  void *v4;
  UINavigationButton *v5;
  void *v6;
  UINavigationButton *v7;
  UINavigationButton *leftButton;
  id v9;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    if (self->_leftButton)
    {
      -[_UISearchBarVisualProviderLegacy effectiveBarTintColor](self, "effectiveBarTintColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationButton _setTintColor:](self->_leftButton, "_setTintColor:", v4);

    }
    else
    {
      v5 = [UINavigationButton alloc];
      -[_UISearchBarVisualProviderLegacy effectiveBarTintColor](self, "effectiveBarTintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[UINavigationButton initWithValue:width:style:barStyle:possibleTitles:tintColor:](v5, "initWithValue:width:style:barStyle:possibleTitles:tintColor:", CFSTR("<configure>"), 3, 0, 0, v6, 0.0);
      leftButton = self->_leftButton;
      self->_leftButton = v7;

      -[UINavigationButton _setAppearanceGuideClass:](self->_leftButton, "_setAppearanceGuideClass:", objc_opt_class());
      objc_msgSend(v9, "addSubview:", self->_leftButton);
      objc_msgSend(v9, "setNeedsLayout");
    }
    v3 = v9;
  }

}

- (void)setUpPromptLabel
{
  void *v3;
  UIColor *v4;
  void *v5;
  UIColor *v6;
  void *v7;
  UIColor *v8;
  void *v9;
  UIColor *v10;
  void *v11;
  UILabel *v12;
  UILabel *promptLabel;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  void *v22;
  uint64_t v23;
  id v24;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v24 = v3;
    if (!_MergedGlobals_35)
    {
      v4 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.168, 0.243, 0.353, 1.0);
      v5 = (void *)_MergedGlobals_35;
      _MergedGlobals_35 = (uint64_t)v4;

    }
    if (!qword_1ECD79638)
    {
      v6 = -[UIColor initWithWhite:alpha:]([UIColor alloc], "initWithWhite:alpha:", 1.0, 0.44);
      v7 = (void *)qword_1ECD79638;
      qword_1ECD79638 = (uint64_t)v6;

    }
    if (!qword_1ECD79640)
    {
      v8 = -[UIColor initWithWhite:alpha:]([UIColor alloc], "initWithWhite:alpha:", 1.0, 0.6);
      v9 = (void *)qword_1ECD79640;
      qword_1ECD79640 = (uint64_t)v8;

    }
    if (!qword_1ECD79648)
    {
      v10 = -[UIColor initWithWhite:alpha:]([UIColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
      v11 = (void *)qword_1ECD79648;
      qword_1ECD79648 = (uint64_t)v10;

    }
    if (!self->_promptLabel)
    {
      v12 = objc_alloc_init(UILabel);
      promptLabel = self->_promptLabel;
      self->_promptLabel = v12;

      objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_promptLabel, "setFont:", v14);

      -[UILabel setNumberOfLines:](self->_promptLabel, "setNumberOfLines:", 1);
      -[UILabel setTextAlignment:](self->_promptLabel, "setTextAlignment:", 1);
      -[UIView setBackgroundColor:](self->_promptLabel, "setBackgroundColor:", 0);
      -[UIView setOpaque:](self->_promptLabel, "setOpaque:", 0);
      objc_msgSend(v24, "addSubview:", self->_promptLabel);
    }
    v15 = (id)_MergedGlobals_35;
    v16 = (id)qword_1ECD79638;
    -[_UISearchBarVisualProviderLegacy effectiveBarTintColor](self, "effectiveBarTintColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[_UISearchBarVisualProviderLegacy effectiveBarTintColor](self, "effectiveBarTintColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _GetLightenedTintColor(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      GetTintedPromptTextColor(v19);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      v21 = 1.0;
    }
    else
    {
      if ((*(_BYTE *)&self->_searchBarVisualProviderFlags & 7) == 0)
      {
        objc_msgSend(v24, "traitCollection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "userInterfaceStyle");

        if (v23 != 2)
        {
          v21 = 1.0;
          goto LABEL_18;
        }
      }
      v20 = (id)qword_1ECD79640;

      v18 = v16;
      v21 = -1.0;
      v16 = (id)qword_1ECD79648;
    }

    v15 = v20;
LABEL_18:
    -[UILabel setTextColor:](self->_promptLabel, "setTextColor:", v15);
    -[UILabel setShadowColor:](self->_promptLabel, "setShadowColor:", v16);
    -[UILabel setShadowOffset:](self->_promptLabel, "setShadowOffset:", 0.0, v21);

    v3 = v24;
  }

}

- (void)setUpScopeBar
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  UISegmentedControl *v10;
  double v11;
  UIView *v12;
  UIView *scopeBarContainerView;
  _UISearchBarScopeBarBackground *v14;
  _UISearchBarScopeBarBackground *v15;
  _UISearchBarScopeBarBackground *scopeBarBackgroundView;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[5];

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v18 = v3;
    if (!self->_scopeBar)
    {
      objc_msgSend(v3, "sizeToFit");
      objc_msgSend(v18, "bounds");
      v5 = v4;
      v7 = v6;
      +[UISegmentedControl defaultHeightForStyle:size:](UISegmentedControl, "defaultHeightForStyle:size:", 7, 0);
      v9 = v8;
      v10 = -[UISegmentedControl initWithFrame:withStyle:withItems:]([UISegmentedControl alloc], "initWithFrame:withStyle:withItems:", 7, self->_scopeTitles, 0.0, v7 - v9, v5);
      objc_storeStrong((id *)&self->_scopeBar, v10);
      -[UISegmentedControl setSelectedSegmentIndex:](v10, "setSelectedSegmentIndex:", self->_selectedScope);
      -[UIControl addTarget:action:forControlEvents:](v10, "addTarget:action:forControlEvents:", v18, sel__scopeChanged_, 4096);
      -[UISegmentedControl setBarStyle:](v10, "setBarStyle:", *(_DWORD *)&self->_searchBarVisualProviderFlags & 7);
      -[_UISearchBarVisualProviderLegacy scopeBarHeight](self, "scopeBarHeight");
      v12 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, v7 - v11, v5, v11);
      scopeBarContainerView = self->_scopeBarContainerView;
      self->_scopeBarContainerView = v12;

      v14 = [_UISearchBarScopeBarBackground alloc];
      -[UIView bounds](self->_scopeBarContainerView, "bounds");
      v15 = -[UIImageView initWithFrame:](v14, "initWithFrame:");
      scopeBarBackgroundView = self->_scopeBarBackgroundView;
      self->_scopeBarBackgroundView = v15;

      -[UIView setAutoresizingMask:](self->_scopeBarBackgroundView, "setAutoresizingMask:", 18);
      -[UIView addSubview:](self->_scopeBarContainerView, "addSubview:", self->_scopeBarBackgroundView);
      -[_UISearchBarVisualProviderLegacy updateScopeBarBackground](self, "updateScopeBarBackground");
      -[_UISearchBarVisualProviderLegacy updateScopeBarFrame](self, "updateScopeBarFrame");
      if (UISearchBarUsesModernAppearance())
        v17 = 34;
      else
        v17 = 18;
      -[UIView setAutoresizingMask:](v10, "setAutoresizingMask:", v17, v18);
      -[UIView addSubview:](self->_scopeBarContainerView, "addSubview:", v10);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __49___UISearchBarVisualProviderLegacy_setUpScopeBar__block_invoke;
      v20[3] = &unk_1E16B1B28;
      v20[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v20);
      objc_msgSend(v18, "insertSubview:atIndex:", self->_scopeBarContainerView, 0);

    }
    -[_UISearchBarVisualProviderLegacy updateScopeBarBackground](self, "updateScopeBarBackground", v18);
    v3 = v19;
  }

}

- (void)setUpSearchField
{
  void *v3;
  UISearchBarTextField *v4;
  UISearchBarTextField *searchField;
  _BOOL4 v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD v15[5];

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[UISearchTextField _initWithDeferredSearchIconImageConfiguration]([UISearchBarTextField alloc], "_initWithDeferredSearchIconImageConfiguration");
    searchField = self->_searchField;
    self->_searchField = v4;

    -[UISearchTextField _setSearchBar:](self->_searchField, "_setSearchBar:", v3);
    -[UIView setOpaque:](self->_searchField, "setOpaque:", 0);
    -[UITextField setSemanticContentAttribute:](self->_searchField, "setSemanticContentAttribute:", objc_msgSend(v3, "semanticContentAttribute"));
    v6 = UISearchBarUsesModernAppearance();
    v7 = 14.0;
    if (v6)
      objc_msgSend(off_1E167A828, "defaultFontSize", 14.0);
    objc_msgSend(off_1E167A828, "systemFontOfSize:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](self->_searchField, "setFont:", v8);

    -[_UISearchBarVisualProviderLegacy updateMagnifyingGlassView](self, "updateMagnifyingGlassView");
    -[UITextField setLeftViewMode:](self->_searchField, "setLeftViewMode:", ((unint64_t)self->_searchBarVisualProviderFlags >> 9) & 3);
    -[_UISearchBarVisualProviderLegacy updateRightView](self, "updateRightView");
    -[UITextField setClearButtonMode:](self->_searchField, "setClearButtonMode:", 3);
    -[UITextField setBorderStyle:](self->_searchField, "setBorderStyle:", 3);
    -[UISearchTextField _setIgnoresDynamicType:](self->_searchField, "_setIgnoresDynamicType:", 1);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52___UISearchBarVisualProviderLegacy_setUpSearchField__block_invoke;
    v15[3] = &unk_1E16B1B28;
    v15[4] = self;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v15);
    if (-[_UISearchBarVisualProviderLegacy centerPlaceholder](self, "centerPlaceholder"))
    {
      objc_msgSend(v3, "textInputTraits");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDeferBecomingResponder:", 1);

    }
    v14 = 0;
    -[_UISearchBarVisualProviderLegacy internalImageForSearchBarIcon:state:customImage:](self, "internalImageForSearchBarIcon:state:customImage:", 1, 0, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && v14)
      -[UISearchTextField _setClearButtonImage:forState:](self->_searchField, "_setClearButtonImage:forState:", v10, 0);
    -[_UISearchBarVisualProviderLegacy internalImageForSearchBarIcon:state:customImage:](self, "internalImageForSearchBarIcon:state:customImage:", 1, 1, &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && v14)
      -[UISearchTextField _setClearButtonImage:forState:](self->_searchField, "_setClearButtonImage:forState:", v11, 1);
    -[_UISearchBarVisualProviderLegacy internalImageForSearchBarIcon:state:customImage:](self, "internalImageForSearchBarIcon:state:customImage:", 1, 2, &v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && v14)
      -[UISearchTextField _setClearButtonImage:forState:](self->_searchField, "_setClearButtonImage:forState:", v12, 2);
    -[_UISearchBarVisualProviderLegacy updateSearchFieldArt](self, "updateSearchFieldArt");
    -[UIControl addTarget:action:forControlEvents:](self->_searchField, "addTarget:action:forControlEvents:", v3, sel__searchFieldBeginEditing, 0x10000);
    -[UIControl addTarget:action:forControlEvents:](self->_searchField, "addTarget:action:forControlEvents:", v3, sel__searchFieldEditingChanged, 0x20000);
    -[UIControl addTarget:action:forControlEvents:](self->_searchField, "addTarget:action:forControlEvents:", v3, sel__searchFieldEndEditing, 0x40000);
    -[UIControl addTarget:action:forControlEvents:](self->_searchField, "addTarget:action:forControlEvents:", v3, sel__searchFieldReturnPressed, 0x80000);
    objc_msgSend(v3, "addSubview:", self->_searchField);
    if (UISearchBarUsesModernAppearance())
    {
      -[UITextField _setRoundedRectBackgroundCornerRadius:](self->_searchField, "_setRoundedRectBackgroundCornerRadius:", 10.0);
      -[UIView layer](self->_searchField, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAllowsGroupOpacity:", 0);

    }
    if ((*(_DWORD *)&self->_searchBarVisualProviderFlags & 0x38) == 0x10)
      -[_UISearchBarVisualProviderLegacy applySearchBarStyle](self, "applySearchBarStyle");

  }
}

- (BOOL)isFrozenForDismissalCrossfade
{
  return 0;
}

- (void)setShowsSeparator:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIImageView *separator;
  UIImageView *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *v10;
  UIImageView *v11;
  void *v12;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    separator = self->_separator;
    if (v3)
    {
      if (!separator)
      {
        v12 = v5;
        v7 = [UIImageView alloc];
        -[_UISearchBarVisualProviderLegacy currentSeparatorImage](self, "currentSeparatorImage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[UIImageView initWithImage:](v7, "initWithImage:", v8);
        v10 = self->_separator;
        self->_separator = v9;

        objc_msgSend(v12, "addSubview:", self->_separator);
        objc_msgSend(v12, "setNeedsLayout");
LABEL_7:
        v5 = v12;
      }
    }
    else if (separator)
    {
      v12 = v5;
      -[UIView removeFromSuperview](separator, "removeFromSuperview");
      v11 = self->_separator;
      self->_separator = 0;

      goto LABEL_7;
    }
  }

}

- (void)setShowsDeleteButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  UINavigationButton *v7;
  void *v8;
  void *v9;
  UIButton *v10;
  UIButton *cancelButton;
  _BOOL8 v12;
  id v13;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v3)
      v6 = 0x100000;
    else
      v6 = 0;
    self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xFFEFFFFF | v6);
    v13 = v5;
    if (v3)
    {
      -[_UISearchBarVisualProviderLegacy destroyCancelButton](self, "destroyCancelButton");
      v7 = [UINavigationButton alloc];
      objc_msgSend(v13, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _UIImageWithNameAndTraitCollection(CFSTR("delete-on"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[UINavigationButton initWithImage:style:](v7, "initWithImage:style:", v9, 3);
      cancelButton = self->_cancelButton;
      self->_cancelButton = v10;

      -[UIButton _setAppearanceGuideClass:](self->_cancelButton, "_setAppearanceGuideClass:", objc_opt_class());
      -[UIControl addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", v13, sel__deleteButtonPressed, 64);
      objc_msgSend(v13, "addSubview:", self->_cancelButton);
      v12 = (objc_msgSend(v13, "isFirstResponder") & 1) != 0
         || (*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 8) == 0;
      -[UIButton setEnabled:](self->_cancelButton, "setEnabled:", v12);
      objc_msgSend(v13, "setNeedsLayout");
    }
    else
    {
      -[_UISearchBarVisualProviderLegacy setUpCancelButton](self, "setUpCancelButton");
    }
    v5 = v13;
  }

}

- (void)setClippingViewActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[UIView setClipsToBounds:](self->_searchBarClippingView, "setClipsToBounds:", v3);
    v5 = v6;
    if (!v3)
    {
      objc_msgSend(v6, "bounds");
      -[_UISearchBarVisualProviderLegacy setClippingViewBounds:](self, "setClippingViewBounds:");
      v5 = v6;
    }
  }

}

- (void)setClippingViewBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  UIView *searchBarClippingView;
  BOOL v10;
  void *v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    searchBarClippingView = self->_searchBarClippingView;
    if (searchBarClippingView)
    {
      v11 = v8;
      -[UIView frame](searchBarClippingView, "frame");
      v13.origin.x = x;
      v13.origin.y = y;
      v13.size.width = width;
      v13.size.height = height;
      v10 = CGRectEqualToRect(v12, v13);
      v8 = v11;
      if (!v10)
      {
        objc_msgSend(v11, "frame");
        -[UIView setBounds:](self->_searchBarClippingView, "setBounds:", x, y);
        -[UIView setFrame:](self->_searchBarClippingView, "setFrame:", x, y, width, height);
        v8 = v11;
      }
    }
  }

}

- (BOOL)isInBarButNotHosted
{
  _BOOL4 v3;
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;

  if (-[_UISearchBarVisualProviderLegacy isHostedByNavigationBar](self, "isHostedByNavigationBar"))
  {
    LOBYTE(v3) = 0;
  }
  else if (self->_navBarTitleViewLocation
         || (searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags,
             (*(_DWORD *)&searchBarVisualProviderFlags & 0x1000000) != 0))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    return (*(unsigned int *)&searchBarVisualProviderFlags >> 25) & 1;
  }
  return v3;
}

- (void)navigationBarTransitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  UIView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v4 = a4;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 1.0;
    if (v4)
      v8 = 0.0;
    v21 = v7;
    objc_msgSend(v7, "setAlpha:", v8);
    v7 = v21;
    if (a3 == 2)
    {
      v9 = self->_searchBarClippingView;
      objc_msgSend(v21, "bounds");
      v11 = v10;
      if (_UIBarsUseNewPadHeights())
        v12 = 50.0;
      else
        v12 = 56.0;
      -[UIView setFrame:](v9, "setFrame:", 0.0, 0.0, v11, v12);
      -[UIView setAutoresizingMask:](v9, "setAutoresizingMask:", 0);
      -[UIView bounds](v9, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

      -[_UISearchBarVisualProviderLegacy layoutSubviewsInBounds:](self, "layoutSubviewsInBounds:", v14, v16, v18, v20);
      v7 = v21;
    }
  }

}

- (void)navigationBarTransitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  void *v6;
  id v7;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setAlpha:", 1.0);
    v6 = v7;
    if (a3 == 2)
    {
      objc_msgSend(v7, "bounds");
      -[UIView setFrame:](self->_searchBarClippingView, "setFrame:");
      -[UIView setAutoresizingMask:](self->_searchBarClippingView, "setAutoresizingMask:", 18);
      objc_msgSend(v7, "layoutSubviews");
      v6 = v7;
    }
  }

}

- (BOOL)_getNavigationTitleLeadingInset:(double *)a3 trailingInset:(double *)a4 isRTL:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double (**v23)(_QWORD, double, double, double, double);
  double (**v24)(_QWORD, double, double, double, double);
  double v25;
  double x;
  double v27;
  double y;
  double v29;
  double width;
  double v31;
  double height;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  BOOL v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v51;
  double v52;
  double v53;
  _QWORD v54[8];
  BOOL v55;
  _QWORD aBlock[8];
  BOOL v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v5 = a5;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && self->_navBarTitleViewLocation && self->_navBarTitleViewOverlayRects)
  {
    objc_msgSend(v9, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v10, "_contentMargin");
    v53 = v19;
    objc_msgSend(v10, "safeAreaInsets");
    v51 = v21;
    v52 = v20;
    v22 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88___UISearchBarVisualProviderLegacy__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke;
    aBlock[3] = &__block_descriptor_65_e39_d40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    v57 = v5;
    aBlock[4] = v12;
    aBlock[5] = v14;
    aBlock[6] = v16;
    aBlock[7] = v18;
    v23 = (double (**)(_QWORD, double, double, double, double))_Block_copy(aBlock);
    v54[0] = v22;
    v54[1] = 3221225472;
    v54[2] = __88___UISearchBarVisualProviderLegacy__getNavigationTitleLeadingInset_trailingInset_isRTL___block_invoke_2;
    v54[3] = &__block_descriptor_65_e39_d40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    v55 = v5;
    v54[4] = v12;
    v54[5] = v14;
    v54[6] = v16;
    v54[7] = v18;
    v24 = (double (**)(_QWORD, double, double, double, double))_Block_copy(v54);
    -[_UINavigationBarTitleViewOverlayRects backButtonRect](self->_navBarTitleViewOverlayRects, "backButtonRect");
    x = v25;
    y = v27;
    width = v29;
    height = v31;
    -[_UINavigationBarTitleViewOverlayRects leadingItemsRect](self->_navBarTitleViewOverlayRects, "leadingItemsRect");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    if (CGRectIsNull(v58)
      && (v59.origin.x = v34, v59.origin.y = v36, v59.size.width = v38, v59.size.height = v40, CGRectIsNull(v59)))
    {
      v41 = v52;
      if (v5)
        v41 = v51;
      v42 = v53 + v41;
    }
    else
    {
      v60.origin.x = v34;
      v60.origin.y = v36;
      v60.size.width = v38;
      v60.size.height = v40;
      if (!CGRectIsNull(v60))
      {
        v61.origin.x = x;
        v61.origin.y = y;
        v61.size.width = width;
        v61.size.height = height;
        if (CGRectIsNull(v61))
        {
          x = v34;
          y = v36;
          width = v38;
          height = v40;
        }
        else
        {
          v62.origin.x = v34;
          v62.origin.y = v36;
          v62.size.width = v38;
          v62.size.height = v40;
          v65.origin.x = x;
          v65.origin.y = y;
          v65.size.width = width;
          v65.size.height = height;
          v63 = CGRectUnion(v62, v65);
          x = v63.origin.x;
          y = v63.origin.y;
          width = v63.size.width;
          height = v63.size.height;
        }
      }
      v42 = v23[2](v23, x, y, width, height) + 8.0;
    }
    *a3 = v42;
    -[_UINavigationBarTitleViewOverlayRects trailingItemsRect](self->_navBarTitleViewOverlayRects, "trailingItemsRect");
    v44 = v64.origin.x;
    v45 = v64.origin.y;
    v46 = v64.size.width;
    v47 = v64.size.height;
    if (CGRectIsNull(v64))
    {
      v48 = v52;
      if (!v5)
        v48 = v51;
      v49 = v53 + v48;
    }
    else
    {
      v49 = v24[2](v24, v44, v45, v46, v47) + 8.0;
    }
    *a4 = v49;

    v43 = 1;
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (void)getTopInset:(double *)a3 bottomInset:(double *)a4 forBarMetrics:(int64_t)a5 barPosition:(int64_t)a6
{
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v16 = v11;
    if (!UISearchBarUsesModernAppearance())
    {
      *a3 = 0.0;
      *a4 = 0.0;
LABEL_16:
      v11 = v16;
      goto LABEL_17;
    }
    if (a6 == 3)
    {
      if (a5 != 102 && a5 != 1 && !_UIBarsUseNewPadHeights())
      {
        *a3 = 4.0;
        objc_msgSend(v16, "_screen");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "_isEmbeddedScreen")
          || (objc_msgSend(v13, "_peripheryInsets"), v14 = 15.0, v15 <= 0.0))
        {
          v14 = 10.0;
        }
        *a4 = v14;

        goto LABEL_16;
      }
      v12 = 0x401C000000000000;
    }
    else
    {
      if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 0xC) != 0)
      {
        if (a5 == 102 || a5 == 1)
        {
          *a3 = 0.0;
          v12 = 0x4020000000000000;
        }
        else
        {
          _UIBarsUseNewPadHeights();
          *a3 = 1.0;
          v12 = 0x402E000000000000;
        }
        goto LABEL_15;
      }
      v12 = 0x4024000000000000;
    }
    *(_QWORD *)a3 = v12;
LABEL_15:
    *(_QWORD *)a4 = v12;
    goto LABEL_16;
  }
LABEL_17:

}

- (BOOL)alwaysUsesLayoutMarginsForHorizontalContentInset
{
  return 0;
}

- (void)setOverrideContentInsets:(UIEdgeInsets)a3 forRectEdges:(unint64_t)a4
{
  unint64_t v4;
  NSObject *v5;
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
      _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "overrideContentInsets SPI is not supported in the legacy visual provider", buf, 2u);
    }

  }
  else
  {
    v4 = setOverrideContentInsets_forRectEdges____s_category;
    if (!setOverrideContentInsets_forRectEdges____s_category)
    {
      v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&setOverrideContentInsets_forRectEdges____s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "overrideContentInsets SPI is not supported in the legacy visual provider", v7, 2u);
    }
  }
}

- (void)getOverrideContentInsets:(UIEdgeInsets *)a3 overriddenEdges:(unint64_t *)a4
{
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "overrideContentInsets SPI is not supported in the legacy visual provider", buf, 2u);
    }

    if (a3)
      goto LABEL_7;
  }
  else
  {
    v6 = getOverrideContentInsets_overriddenEdges____s_category;
    if (!getOverrideContentInsets_overriddenEdges____s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&getOverrideContentInsets_overriddenEdges____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "overrideContentInsets SPI is not supported in the legacy visual provider", v9, 2u);
    }
    if (a3)
    {
LABEL_7:
      *(_OWORD *)&a3->top = 0u;
      *(_OWORD *)&a3->bottom = 0u;
    }
  }
  if (a4)
    *a4 = 0;
}

- (void)updateEffectiveContentInset
{
  void *v3;
  void *v4;
  uint64_t v5;
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  double tableViewIndexWidth;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v26;
  double v27;
  double v28;
  double v29;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v28 = 0.0;
    v29 = 0.0;
    v5 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection");
    if (!-[_UISearchBarVisualProviderLegacy _getNavigationTitleLeadingInset:trailingInset:isRTL:](self, "_getNavigationTitleLeadingInset:trailingInset:isRTL:", &v29, &v28, v5 == 1))
    {
      searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
      if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x3000000) == 0)
      {
        if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) != 0)
        {
          objc_msgSend(v4, "directionalLayoutMargins");
          v29 = v9;
        }
        else if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x8000000) != 0)
        {
          objc_msgSend(v4, "superview");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && v10)
            objc_msgSend(v10, "_resolvedLayoutMargins");
          else
            objc_msgSend(v4, "directionalLayoutMargins");
          v28 = v12;
          v29 = v11;

          v8 = v28;
        }
        else
        {
          tableViewIndexWidth = self->_tableViewIndexWidth;
          if (tableViewIndexWidth <= 0.0)
          {
            objc_msgSend(v4, "safeAreaInsets");
            if (v5 == 1)
              v14 = v8;
            else
              v14 = v13;
            v29 = v14;
            if (v5 == 1)
              v8 = v13;
          }
          else
          {
            v8 = tableViewIndexWidth + 8.0;
          }
        }
        if (v29 >= 8.0)
          v15 = v29;
        else
          v15 = 8.0;
        if (v8 >= 8.0)
          v16 = v8;
        else
          v16 = 8.0;
        v28 = v16;
        v29 = v15;
      }
    }
    -[_UISearchBarVisualProviderLegacy getTopInset:bottomInset:forBarMetrics:barPosition:](self, "getTopInset:bottomInset:forBarMetrics:barPosition:", &v27, &v26, -[_UISearchBarVisualProviderLegacy barMetricsForOrientation:](self, "barMetricsForOrientation:", objc_msgSend(v4, "_expectedInterfaceOrientation", 0, 0)), self->_barPosition);
    if (v5 == 1)
      v17 = v28;
    else
      v17 = v29;
    if (v5 == 1)
      v18 = v29;
    else
      v18 = v28;
    v19 = fmax(v27, self->_minimumContentInsetPrivate.top);
    v20 = fmax(v17, self->_minimumContentInsetPrivate.left);
    v21 = fmax(v26, self->_minimumContentInsetPrivate.bottom);
    v22 = fmax(v18, self->_minimumContentInsetPrivate.right);
    if (v20 != self->_effectiveContentInset.left
      || v19 != self->_effectiveContentInset.top
      || v22 != self->_effectiveContentInset.right
      || v21 != self->_effectiveContentInset.bottom)
    {
      self->_effectiveContentInset.top = v19;
      self->_effectiveContentInset.left = v20;
      self->_effectiveContentInset.bottom = v21;
      self->_effectiveContentInset.right = v22;
      objc_msgSend(v4, "setNeedsLayout");
    }
  }

}

- (UIEdgeInsets)scopeBarInsets
{
  double v3;
  CGFloat bottom;
  CGFloat left;
  CGFloat right;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  v3 = 7.0;
  bottom = 8.0;
  if (UISearchBarUsesModernAppearance())
  {
    left = self->_effectiveContentInset.left;
    right = self->_effectiveContentInset.right;
    if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 4) != 0)
    {
      bottom = self->_effectiveContentInset.bottom;
      -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchBarVisualProviderLegacy barMetricsForOrientation:](self, "barMetricsForOrientation:", objc_msgSend(v7, "_expectedInterfaceOrientation"));

      v3 = 2.0;
    }
  }
  else
  {
    right = 8.0;
    left = 8.0;
  }
  v8 = v3;
  v9 = left;
  v10 = bottom;
  v11 = right;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (double)scopeBarHeight
{
  double v3;

  v3 = 0.0;
  -[_UISearchBarVisualProviderLegacy getScopeBarHeight:containerHeight:](self, "getScopeBarHeight:containerHeight:", 0, &v3);
  return v3;
}

- (void)getScopeBarHeight:(double *)a3 containerHeight:(double *)a4
{
  int64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;

  if (UISearchBarUsesModernAppearance()
    && (-[_UISearchBarVisualProviderLegacy isInNavigationPalette](self, "isInNavigationPalette")
     || -[_UISearchBarVisualProviderLegacy isHostedByNavigationBar](self, "isHostedByNavigationBar")))
  {
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v7 = -[_UISearchBarVisualProviderLegacy barMetricsForOrientation:](self, "barMetricsForOrientation:", objc_msgSend(v16, "_expectedInterfaceOrientation"));
    if (v7 == 102 || v7 == 1)
    {
      if (a3)
      {
        +[UISegmentedControl defaultHeightForStyle:size:](UISegmentedControl, "defaultHeightForStyle:size:", 7, 1);
        *(_QWORD *)a3 = v8;
      }
      v9 = v16;
      if (!a4)
        goto LABEL_20;
      v10 = 0x4040000000000000;
    }
    else
    {
      if (a3)
      {
        +[UISegmentedControl defaultHeightForStyle:size:](UISegmentedControl, "defaultHeightForStyle:size:", 7, 0);
        *(_QWORD *)a3 = v15;
      }
      v9 = v16;
      if (!a4)
        goto LABEL_20;
      v10 = 0x4046000000000000;
    }
    *(_QWORD *)a4 = v10;
LABEL_20:

    return;
  }
  +[UISegmentedControl defaultHeightForStyle:size:](UISegmentedControl, "defaultHeightForStyle:size:", 7, 0);
  v12 = v11;
  -[_UISearchBarVisualProviderLegacy scopeBarInsets](self, "scopeBarInsets");
  if (a4)
    *a4 = v14 + v12 + v13;
  if (a3)
    *a3 = v12;
}

- (BOOL)useRelaxedScopeLayout
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && UISearchBarUsesModernAppearance()
    && (self->_scopeBarPosition == 1
     || (objc_msgSend(v3, "bounds"),
         -[_UISearchBarVisualProviderLegacy wouldCombineLandscapeBarsForSize:](self, "wouldCombineLandscapeBarsForSize:", v4, v5))))
  {
    objc_msgSend(v3, "_searchController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "_searchController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v9 = objc_msgSend(v8, "verticalSizeClass") == 2;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)containsScopeBar
{
  void *v3;
  BOOL v4;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[UIView isDescendantOfView:](self->_scopeBarContainerView, "isDescendantOfView:", v3);
  else
    v4 = 0;

  return v4;
}

- (BOOL)scopeBarIsVisible
{
  void *v3;
  uint64_t v4;

  if (self->_scopeBar
    && (*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 0x10) != 0
    && -[NSArray count](self->_scopeTitles, "count") >= 2
    && (!-[_UISearchBarVisualProviderLegacy isInBarButNotHosted](self, "isInBarButNotHosted")
     || (+[UIDevice currentDevice](UIDevice, "currentDevice"),
         v3 = (void *)objc_claimAutoreleasedReturnValue(),
         v4 = objc_msgSend(v3, "userInterfaceIdiom"),
         v3,
         (v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)))
  {
    return -[_UISearchBarVisualProviderLegacy containsScopeBar](self, "containsScopeBar");
  }
  else
  {
    return 0;
  }
}

- (double)barHeightForBarMetrics:(int64_t)a3 withEffectiveInsets:(UIEdgeInsets)a4
{
  double bottom;
  double top;
  int v7;
  BOOL v8;
  double v9;
  double v10;
  double result;

  bottom = a4.bottom;
  top = a4.top;
  if (UISearchBarUsesModernAppearance())
  {
    v7 = _UIBarsUseNewPadHeights();
    v8 = a3 == 102 || a3 == 1;
    v9 = 36.0;
    v10 = 30.0;
    if (!v8)
      v10 = 36.0;
    if (!v7)
      v9 = v10;
    result = top + bottom + v9;
    if (a3 == 102)
    {
      return result + 22.0;
    }
    else if (a3 == 101)
    {
      return result + 34.0;
    }
  }
  else
  {
    result = 44.0;
    if (a3 == 101)
      result = 75.0;
    if (a3 == 1)
      result = 32.0;
    if (a3 == 102)
      return 54.0;
  }
  return result;
}

- (double)searchFieldHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  int64_t v8;
  void *v9;
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  int v11;

  -[_UISearchBarAppearanceStorage searchFieldBackgroundImageForState:](self->_appearanceStorage, "searchFieldBackgroundImageForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "size");
    v6 = v5;
  }
  else
  {
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (dyld_program_sdk_at_least())
    {
      v8 = -[_UISearchBarVisualProviderLegacy barMetricsForOrientation:](self, "barMetricsForOrientation:", objc_msgSend(v7, "_expectedInterfaceOrientation"));
      if (v8 == 102 || v8 == 1)
      {
        if (UISearchBarUsesModernAppearance())
          v6 = 30.0;
        else
          v6 = 24.0;
      }
      else if ((_UIBarsUseNewPadHeights() & 1) != 0)
      {
        v6 = 36.0;
      }
      else if (UISearchBarUsesModernAppearance())
      {
        v6 = 36.0;
      }
      else
      {
        v6 = 28.0;
      }
    }
    else
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 28.0;
      if (!objc_msgSend(v9, "userInterfaceIdiom")
        && (unint64_t)(objc_msgSend(v7, "_expectedInterfaceOrientation") - 3) <= 1)
      {
        v6 = 24.0;
        if (!self->_searchNavigationItem)
        {
          searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
          if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) == 0)
          {
            if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x8000000) != 0)
              v11 = 24;
            else
              v11 = 28;
            v6 = (double)v11;
          }
        }
      }

    }
  }

  return v6;
}

- (double)barHeightForBarMetrics:(int64_t)a3 barPosition:(int64_t)a4
{
  CGFloat top;
  double left;
  double right;
  double result;
  double bottom;
  double v11;

  top = self->_effectiveContentInset.top;
  left = self->_effectiveContentInset.left;
  right = self->_effectiveContentInset.right;
  bottom = self->_effectiveContentInset.bottom;
  v11 = top;
  -[_UISearchBarVisualProviderLegacy getTopInset:bottomInset:forBarMetrics:barPosition:](self, "getTopInset:bottomInset:forBarMetrics:barPosition:", &v11, &bottom, a3, a4);
  -[_UISearchBarVisualProviderLegacy barHeightForBarMetrics:withEffectiveInsets:](self, "barHeightForBarMetrics:withEffectiveInsets:", a3, v11, left, bottom, right);
  return result;
}

- (double)barHeightForBarMetrics:(int64_t)a3
{
  double result;

  -[_UISearchBarVisualProviderLegacy barHeightForBarMetrics:withEffectiveInsets:](self, "barHeightForBarMetrics:withEffectiveInsets:", a3, self->_effectiveContentInset.top, self->_effectiveContentInset.left, self->_effectiveContentInset.bottom, self->_effectiveContentInset.right);
  return result;
}

- (double)defaultHeight
{
  void *v3;
  double v4;
  double v5;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISearchBarVisualProviderLegacy defaultHeightForOrientation:](self, "defaultHeightForOrientation:", objc_msgSend(v3, "_expectedInterfaceOrientation"));
  v5 = v4;

  return v5;
}

- (double)_defaultWidth
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 2)
      v6 = 600.0;
    else
      v6 = 0.0;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (double)defaultHeightForOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v10 = 0.0;
    goto LABEL_18;
  }
  objc_msgSend(v5, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 2)
  {
    *(double *)&v9 = 60.0;
LABEL_4:
    v10 = *(double *)&v9;
    goto LABEL_18;
  }
  if (dyld_program_sdk_at_least())
  {
    -[_UISearchBarVisualProviderLegacy barHeightForBarMetrics:](self, "barHeightForBarMetrics:", -[_UISearchBarVisualProviderLegacy barMetricsForOrientation:](self, "barMetricsForOrientation:", a3));
    v10 = v11;
  }
  else
  {
    if (-[_UISearchBarVisualProviderLegacy isInBarButNotHosted](self, "isInBarButNotHosted"))
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "userInterfaceIdiom");

      if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        *(double *)&v9 = 44.0;
        goto LABEL_4;
      }
    }
    -[UILabel text](self->_promptLabel, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
      v10 = 75.0;
    else
      v10 = 44.0;
  }
  if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 0x10) != 0
    && -[NSArray count](self->_scopeTitles, "count") >= 2
    && !-[_UISearchBarVisualProviderLegacy shouldCombineLandscapeBarsForOrientation:](self, "shouldCombineLandscapeBarsForOrientation:", a3))
  {
    -[_UISearchBarVisualProviderLegacy scopeBarHeight](self, "scopeBarHeight");
    v10 = v10 + v16;
  }
LABEL_18:

  return v10;
}

- (double)navigationBarContentHeight
{
  int v2;
  double result;

  v2 = _UIBarsUseNewPadHeights();
  result = 50.0;
  if (!v2)
    return 0.0;
  return result;
}

- (void)updateNavigationBarLayoutInsertDataForSearchBar:(id)a3 collapsibleScopeBar:(id)a4 forLayoutState:(int64_t)a5
{
  double *v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v7 = (double *)a4;
  v8 = (double *)a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_UISearchBarVisualProviderLegacy barHeightForBarMetrics:](self, "barHeightForBarMetrics:", -[_UISearchBarVisualProviderLegacy barMetricsForOrientation:](self, "barMetricsForOrientation:", objc_msgSend(v13, "_expectedInterfaceOrientation")));
  v10 = v9;
  -[_UISearchBarVisualProviderLegacy defaultHeight](self, "defaultHeight");
  v12 = v11;
  if (v8)
  {
    v8[4] = v10;
    v8[5] = v10;
  }

  if (v7)
  {
    v7[4] = v12 - v10;
    v7[5] = v12 - v10;
    *((_BYTE *)v7 + 8) &= ~1u;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v6;
  double v7;
  CGFloat v8;
  int v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize v24;
  CGSize result;

  width = a3.width;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar", a3.width, a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_UISearchBarVisualProviderLegacy defaultHeight](self, "defaultHeight");
    v8 = v7;
    v9 = dyld_program_sdk_at_least();
    v10 = fabs(width);
    if (v9)
    {
      if (v10 >= INFINITY && v10 <= INFINITY)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24.width = width;
        v24.height = v8;
        NSStringFromCGSize(v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarVisualProviderLegacy.m"), 2370, CFSTR("-[UISearchBar sizeThatFits:] does not support passing non-finite values (%@)"), v12);

      }
    }
    else
    {
      if (v10 == INFINITY)
        v13 = 0.0;
      else
        v13 = width;
      width = v13;
    }
    if (!-[_UISearchBarVisualProviderLegacy isInBarButNotHosted](self, "isInBarButNotHosted")
      || (+[UIDevice currentDevice](UIDevice, "currentDevice"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "userInterfaceIdiom"),
          v14,
          (v15 & 0xFFFFFFFFFFFFFFFBLL) != 1))
    {
      if (width == 0.0)
      {
        objc_msgSend(v6, "superview");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "bounds");
          width = v18;
        }
        else if (fabs(width) < 2.22044605e-16)
        {
          objc_msgSend(v6, "_screen");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "bounds");
          width = v20;

        }
      }
    }
    -[_UISearchBarVisualProviderLegacy _defaultWidth](self, "_defaultWidth");
    if (v21 > 0.0)
      width = v21;
  }
  else
  {
    width = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v22 = width;
  v23 = v8;
  result.height = v23;
  result.width = v22;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UISearchBarVisualProviderLegacy _defaultWidth](self, "_defaultWidth");
    v5 = v4;
    -[_UISearchBarVisualProviderLegacy defaultHeight](self, "defaultHeight");
    if (v5 == 0.0)
      v7 = -1.0;
    else
      v7 = v5;
    if (v6 == 0.0)
      v8 = -1.0;
    else
      v8 = v6;
  }
  else
  {
    v8 = -1.0;
    v7 = -1.0;
  }

  v9 = v7;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)displayNavBarCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *cancelBarButtonItem;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v5 = a3;
  -[_UISearchBarVisualProviderLegacy searchNavigationItem](self, "searchNavigationItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UISearchBarVisualProviderLegacy cancelBarButtonItem](self, "cancelBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v13, "rightBarButtonItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithArray:", v9);
    cancelBarButtonItem = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(cancelBarButtonItem, "addObject:", v7);
    objc_msgSend(v13, "setRightBarButtonItems:animated:", cancelBarButtonItem, v4);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v13, "rightBarButtonItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithArray:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeObjectIdenticalTo:", self->_cancelBarButtonItem);
    objc_msgSend(v13, "setRightBarButtonItems:animated:", v7, v4);
    cancelBarButtonItem = self->_cancelBarButtonItem;
    self->_cancelBarButtonItem = 0;
  }

}

- (BOOL)searchFieldWidthShouldBeFlexible
{
  id *p_searchDisplayController;
  id WeakRetained;
  id v4;
  id v5;
  id v6;
  BOOL v7;

  p_searchDisplayController = &self->_searchDisplayController;
  WeakRetained = objc_loadWeakRetained(&self->_searchDisplayController);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(p_searchDisplayController);
    if (objc_msgSend(v4, "displaysSearchBarInNavigationBar"))
    {
      v5 = objc_loadWeakRetained(p_searchDisplayController);
      if (objc_msgSend(v5, "displaysSearchBarInNavigationBar"))
      {
        v6 = objc_loadWeakRetained(p_searchDisplayController);
        v7 = objc_msgSend(v6, "navigationBarSearchFieldSizing") == 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (double)availableBoundsWidth
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "bounds");
    -[_UISearchBarVisualProviderLegacy availableBoundsWidthForSize:](self, "availableBoundsWidthForSize:", v5, v6);
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (double)landscapeSearchFieldWidth
{
  double v3;
  CGRect v5;

  if (-[_UISearchBarVisualProviderLegacy searchFieldWidthShouldBeFlexible](self, "searchFieldWidthShouldBeFlexible"))
  {
    -[_UISearchBarVisualProviderLegacy availableBoundsWidth](self, "availableBoundsWidth");
    return round(v3 * 0.4);
  }
  else
  {
    -[UIView frame](self->_searchField, "frame");
    return CGRectGetWidth(v5);
  }
}

- (double)landscapeScopeBarWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[_UISearchBarVisualProviderLegacy scopeBarInsets](self, "scopeBarInsets");
  v4 = v3;
  v6 = v5;
  -[_UISearchBarVisualProviderLegacy availableBoundsWidth](self, "availableBoundsWidth");
  v8 = v7;
  -[_UISearchBarVisualProviderLegacy landscapeSearchFieldWidth](self, "landscapeSearchFieldWidth");
  return v8 - v9 + -13.0 - v4 - v6;
}

- (double)availableBoundsWidthForSize:(CGSize)a3
{
  double width;
  double v5;
  UINavigationButton *leftButton;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double right;
  double v18;
  BOOL v19;
  double v20;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  width = a3.width;
  if (-[_UISearchBarVisualProviderLegacy searchFieldWidthShouldBeFlexible](self, "searchFieldWidthShouldBeFlexible", a3.width, a3.height))
  {
    v5 = width - self->_effectiveContentInset.left - self->_effectiveContentInset.right;
    leftButton = self->_leftButton;
    if (leftButton)
    {
      -[UINavigationButton _pathTitleEdgeInsets](leftButton, "_pathTitleEdgeInsets");
      v9 = v7 + v8;
      -[UIView frame](self->_leftButton, "frame");
      v5 = v5 - (CGRectGetWidth(v22) + 11.0 - v9);
    }
    if (self->_cancelButton)
    {
      if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 4) != 0)
      {
        if (!-[_UISearchBarVisualProviderLegacy isInBarButNotHosted](self, "isInBarButNotHosted")
          || (+[UIDevice currentDevice](UIDevice, "currentDevice"),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              v11 = objc_msgSend(v10, "userInterfaceIdiom"),
              v10,
              (v11 & 0xFFFFFFFFFFFFFFFBLL) != 1))
        {
          -[UIButton _pathTitleEdgeInsets](self->_cancelButton, "_pathTitleEdgeInsets");
          v13 = v12;
          v15 = v14;
          -[UIView frame](self->_cancelButton, "frame");
          v16 = v5 - (CGRectGetWidth(v23) + 11.0 - v15 - v13);
          right = self->_effectiveContentInset.right;
          v18 = 8.0 - right;
          v19 = right < 8.0;
          v20 = 0.0;
          if (v19)
            v20 = v18;
          return v16 - v20;
        }
      }
    }
    return v5;
  }
  else
  {
    -[UIView frame](self->_searchField, "frame");
    return CGRectGetWidth(v24);
  }
}

- (BOOL)shouldCombineLandscapeBarsForOrientation:(int64_t)a3
{
  BOOL result;
  unint64_t scopeBarPosition;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;

  if (-[_UISearchBarVisualProviderLegacy useRelaxedScopeLayout](self, "useRelaxedScopeLayout"))
    return 0;
  scopeBarPosition = self->_scopeBarPosition;
  if (scopeBarPosition)
    return scopeBarPosition == 1;
  result = 0;
  if ((unint64_t)(a3 - 1) >= 2 && (*(_DWORD *)&self->_searchBarVisualProviderFlags & 0x20000000) != 0)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8)
    {
      if (self->_scopeBarContainerView)
      {
        -[UISegmentedControl sizeThatFits:](self->_scopeBar, "sizeThatFits:", 10000.0, 10000.0);
        v10 = v9;
      }
      else
      {
        v10 = 0.0;
      }
      -[_UISearchBarVisualProviderLegacy landscapeScopeBarWidth](self, "landscapeScopeBarWidth");
      return v10 <= v11;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)wouldCombineLandscapeBarsForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v18;

  height = a3.height;
  width = a3.width;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (self->_scopeBarContainerView)
    {
      -[UISegmentedControl sizeThatFits:](self->_scopeBar, "sizeThatFits:", 10000.0, 10000.0);
      v8 = v7;
    }
    else
    {
      v8 = 0.0;
    }
    -[_UISearchBarVisualProviderLegacy scopeBarInsets](self, "scopeBarInsets");
    v11 = v10;
    v13 = v12;
    -[_UISearchBarVisualProviderLegacy availableBoundsWidthForSize:](self, "availableBoundsWidthForSize:", width, height);
    v15 = v14;
    if (-[_UISearchBarVisualProviderLegacy searchFieldWidthShouldBeFlexible](self, "searchFieldWidthShouldBeFlexible"))
    {
      v16 = round(v15 * 0.4);
    }
    else
    {
      -[UIView frame](self->_searchField, "frame");
      v16 = CGRectGetWidth(v18);
    }
    v9 = v8 <= v15 - v16 + -13.0 - v11 - v13;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)layoutSubviews
{
  void *v3;
  id v4;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "bounds");
    -[_UISearchBarVisualProviderLegacy layoutSubviewsInBounds:](self, "layoutSubviewsInBounds:");
    v3 = v4;
  }

}

- (void)layoutSubviewsInBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _DWORD *v8;
  _DWORD *v9;
  UISearchBarTextField *v10;
  UISearchBarTextField *searchField;
  id WeakRetained;
  void *v13;
  _UINavigationBarTitleViewOverlayRects *navBarTitleViewOverlayRects;
  _BOOL4 v15;
  _UINavigationBarTitleViewOverlayRects *v16;
  _UINavigationBarTitleViewOverlayRects *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  _BOOL4 v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  _DWORD *v30;
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  double v32;
  uint64_t v33;
  int v34;
  void *v35;
  uint64_t v36;
  UIView *v37;
  UIView *v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double top;
  double left;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  char v59;
  int v60;
  int64_t v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  CGFloat v85;
  CGFloat v86;
  double MaxX;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  double v103;
  void *v104;
  uint64_t v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  uint64_t v110;
  double v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  int v117;
  double v118;
  double v119;
  BOOL v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double MinX;
  void *v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  void (**v139)(void);
  char v140;
  double v141;
  double v142;
  double v143;
  double v144;
  void *v145;
  uint64_t v146;
  void *v147;
  UIButton *cancelButton;
  void *v149;
  void *v150;
  UIButton *v151;
  double v152;
  double v153;
  double v154;
  double v155;
  UIView *v156;
  _BOOL4 v157;
  double v158;
  double v159;
  UIView *scopeBarContainerView;
  _BOOL4 v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  UIButton *v167;
  void *v168;
  uint64_t v169;
  double v170;
  UIImageView *separator;
  double v172;
  double v173;
  double v174;
  double v175;
  id v176;
  _BOOL4 v177;
  int v178;
  double v179;
  int v180;
  double rect;
  _BOOL4 v182;
  _QWORD v183[9];
  _QWORD aBlock[5];
  _DWORD *v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  _QWORD v195[4];
  UIView *v196;
  uint64_t v197;
  uint64_t v198;
  double v199;
  double v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v8 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_153;
  if (!self->_searchField)
  {
    objc_msgSend(v8, "_searchBarTextField");
    v10 = (UISearchBarTextField *)objc_claimAutoreleasedReturnValue();
    searchField = self->_searchField;
    self->_searchField = v10;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_navBarTitleViewDataSource);
  v176 = WeakRetained;
  if (WeakRetained)
  {
    v13 = WeakRetained;
    navBarTitleViewOverlayRects = self->_navBarTitleViewOverlayRects;
    if (navBarTitleViewOverlayRects)
    {
      -[_UINavigationBarTitleViewOverlayRects reset](navBarTitleViewOverlayRects, "reset");
    }
    else
    {
      v16 = objc_alloc_init(_UINavigationBarTitleViewOverlayRects);
      v17 = self->_navBarTitleViewOverlayRects;
      self->_navBarTitleViewOverlayRects = v16;

    }
    objc_msgSend(v13, "titleView:needsUpdatedContentOverlayRects:", v9, self->_navBarTitleViewOverlayRects);
    -[_UISearchBarVisualProviderLegacy updateEffectiveContentInset](self, "updateEffectiveContentInset");
    v15 = 1;
  }
  else
  {
    v15 = -[_UISearchBarVisualProviderLegacy isInBarButNotHosted](self, "isInBarButNotHosted");
  }
  objc_msgSend(v9, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "windowScene");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "interfaceOrientation");

  v21 = -[_UISearchBarVisualProviderLegacy shouldCombineLandscapeBarsForOrientation:](self, "shouldCombineLandscapeBarsForOrientation:", v20);
  if (v21 && v15)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "userInterfaceIdiom");

    v21 = (v23 & 0xFFFFFFFFFFFFFFFBLL) != 1;
  }
  v177 = -[_UISearchBarVisualProviderLegacy useRelaxedScopeLayout](self, "useRelaxedScopeLayout");
  v24 = -[_UISearchBarVisualProviderLegacy scopeBarIsVisible](self, "scopeBarIsVisible");
  v25 = -[_UISearchBarVisualProviderLegacy containsScopeBar](self, "containsScopeBar");
  -[_UISearchBarVisualProviderLegacy scopeBarHeight](self, "scopeBarHeight");
  v27 = v26;
  v180 = v9[30];
  v182 = v15;
  if (v15)
  {
    objc_msgSend(v9, "superview");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v28, "topItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "titleView");
      v30 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      if (v30 == v9)
      {

      }
      else
      {
        searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;

        if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x8000000) == 0)
        {
          objc_msgSend(v28, "frame");
          height = v32;
          objc_msgSend(v9, "setBounds:", x, y, width);
        }
      }

    }
    v34 = 1;
    -[UIImageView setHidden:](self->_searchBarBackground, "setHidden:", 1);
    -[_UISearchBarVisualProviderLegacy updateSearchBarOpacity](self, "updateSearchBarOpacity");

    if (!v25)
      goto LABEL_25;
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "userInterfaceIdiom");

    if ((v36 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[UIView removeFromSuperview](self->_scopeBarContainerView, "removeFromSuperview");
      v34 = 0;
LABEL_25:
      v33 = 0;
      goto LABEL_44;
    }
  }
  else
  {
    -[UIImageView setHidden:](self->_searchBarBackground, "setHidden:", -[_UISearchBarVisualProviderLegacy drawsBackground](self, "drawsBackground") ^ 1);
    -[_UISearchBarVisualProviderLegacy updateSearchBarOpacity](self, "updateSearchBarOpacity");
    if (!v25)
    {
      v33 = 0;
      v34 = 1;
      goto LABEL_44;
    }
  }
  v37 = self->_scopeBarContainerView;
  v38 = v37;
  if (v24)
  {
    if (v21)
    {
      objc_msgSend(v9, "bringSubviewToFront:", v37);
      -[UIView setAlpha:](self->_scopeBarBackgroundView, "setAlpha:", 0.0);
    }
    else
    {
      objc_msgSend(v9, "sendSubviewToBack:", v37);
      -[UIView setAlpha:](self->_scopeBarBackgroundView, "setAlpha:", 1.0);
      -[UIView frame](v38, "frame");
      v40 = v39;
      objc_msgSend(v9, "bounds");
      if (v40 >= CGRectGetMaxX(v202))
      {
        -[UIView frame](v38, "frame");
        v42 = v41;
        v195[0] = MEMORY[0x1E0C809B0];
        v195[1] = 3221225472;
        v195[2] = __59___UISearchBarVisualProviderLegacy_layoutSubviewsInBounds___block_invoke;
        v195[3] = &unk_1E16B20D8;
        v196 = v38;
        v197 = 0;
        v198 = v42;
        v199 = width;
        v200 = v27;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v195);

      }
      -[_UISearchBarVisualProviderLegacy updateScopeBarFrame](self, "updateScopeBarFrame");
    }
    if (UISearchBarUsesModernAppearance())
    {
      -[_UISearchBarVisualProviderLegacy barHeightForBarMetrics:](self, "barHeightForBarMetrics:", -[_UISearchBarVisualProviderLegacy barMetricsForOrientation:](self, "barMetricsForOrientation:", v20));
      v44 = v43;
    }
    else
    {
      v44 = 44.0;
    }
    -[UIView frame](v38, "frame");
    if (v44 < height - v45)
      v44 = height - v45;
    if (v44 == height)
    {
      v33 = 0;
    }
    else
    {
      *(_DWORD *)&self->_searchBarVisualProviderFlags |= 0x10000u;
      v33 = 1;
    }
  }
  else
  {
    if (!-[UIView isHidden](v37, "isHidden") && !v21)
    {
      v201.origin.x = x;
      v201.origin.y = y;
      v201.size.width = width;
      v201.size.height = height;
      -[UIView setFrame:](v38, "setFrame:", 0.0, CGRectGetMaxY(v201), width, v27);
    }
    v33 = 0;
  }
  -[UISearchBarBackground setUsesContiguousBarBackground:](self->_searchBarBackground, "setUsesContiguousBarBackground:", v24 && !v21);

  v34 = 0;
LABEL_44:
  v178 = v34;
  if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 1) != 0)
    -[_UISearchBarVisualProviderLegacy layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:](self, "layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:", v33);
  UIRoundToViewScale(v9);
  top = self->_effectiveContentInset.top;
  left = self->_effectiveContentInset.left;
  v48 = x + left;
  v49 = y + top;
  v179 = width - (left + self->_effectiveContentInset.right);
  v51 = v50 - (top + self->_effectiveContentInset.bottom);
  -[UIView bounds](self->_cancelButton, "bounds");
  v53 = v52;
  v55 = v54;
  -[UIButton sizeThatFits:](self->_cancelButton, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[UIButton setBounds:](self->_cancelButton, "setBounds:", v53, v55, v56, v57);
  -[UILabel text](self->_promptLabel, "text");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v58, "length"))
    v59 = v182;
  else
    v59 = 1;

  v174 = v27;
  if ((v59 & 1) != 0)
  {
    -[UIView removeFromSuperview](self->_promptLabel, "removeFromSuperview");
    v60 = v180;
  }
  else
  {
    v61 = -[_UISearchBarVisualProviderLegacy barMetricsForOrientation:](self, "barMetricsForOrientation:", v20);
    objc_msgSend(v9, "addSubview:", self->_promptLabel);
    -[UIView sizeToFit](self->_promptLabel, "sizeToFit");
    -[UIView frame](self->_promptLabel, "frame");
    v63 = v62;
    v65 = v64;
    v67 = v66;
    if (UISearchBarUsesModernAppearance())
    {
      v68 = 34.0;
      if (v61 == 102)
        v68 = 22.0;
      v69 = v48 + 0.0;
      v49 = v49 + v68;
      v51 = v51 - v68;
      if (v61 == 102)
        v70 = 3.0;
      else
        v70 = 12.0;
      v203.origin.x = v48 + 0.0;
      v203.origin.y = v49;
      v203.size.width = v179;
      v203.size.height = v51;
      v71 = CGRectGetMinY(v203) - v70;
      v204.origin.x = v48;
      v204.origin.y = v63;
      v204.size.width = v65;
      v204.size.height = v67;
      v72 = CGRectGetHeight(v204);
      -[UILabel _baselineOffsetFromBottom](self->_promptLabel, "_baselineOffsetFromBottom");
      v73 = v179;
      v75 = v71 - (v72 + v74);
      v60 = v180;
    }
    else
    {
      v69 = v48 + 0.0;
      v49 = v49 + v51 + -44.0;
      v51 = v51 - (v51 + -44.0);
      v75 = 7.0;
      v60 = v180;
      v73 = v179;
    }
    v76 = v69;
    v77 = v49;
    v78 = v51;
    -[UILabel setFrame:](self->_promptLabel, "setFrame:", v48, v75, CGRectGetWidth(*(CGRect *)(&v73 - 2)), v67);
    v48 = v69;
  }
  rect = v51;
  if (self->_leftButton)
  {
    objc_msgSend(v9, "addSubview:");
    -[UIView sizeToFit](self->_leftButton, "sizeToFit");
    -[UIView frame](self->_leftButton, "frame");
    v82 = v81;
    v84 = v83;
    if ((v60 & 0x80000) != 0)
    {
      v85 = v79;
      v86 = v80;
      v205.origin.x = v48;
      v205.origin.y = v49;
      v205.size.width = v179;
      v205.size.height = v51;
      MaxX = CGRectGetMaxX(v205);
      v206.origin.x = v85;
      v206.origin.y = v86;
      v206.size.width = v82;
      v206.size.height = v84;
      v48 = MaxX - CGRectGetWidth(v206);
    }
    v88 = round(v49 + v51 * 0.5 - v84 * 0.5) + -1.0;
    v89 = 11.0;
    if ((v60 & 0x80000) == 0)
    {
      v207.origin.x = v48;
      v207.origin.y = v88;
      v207.size.width = v82;
      v207.size.height = v84;
      v89 = CGRectGetMaxX(v207) + 11.0;
    }
    -[UIButton setFrame:](self->_leftButton, "setFrame:", v48, v88, v82, v84, *(_QWORD *)&v174);
    v48 = v89;
  }
  -[_UISearchBarVisualProviderLegacy searchFieldHeight](self, "searchFieldHeight", *(_QWORD *)&v174);
  v91 = v90;
  if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 0xC) != 0)
  {
    -[_UISearchBarVisualProviderLegacy barHeightForBarMetrics:](self, "barHeightForBarMetrics:", -[_UISearchBarVisualProviderLegacy barMetricsForOrientation:](self, "barMetricsForOrientation:", v20));
    v93 = v92;
    objc_msgSend(v9, "bounds");
    v95 = fmax(v93 - v94, 0.0);
    if (v91 <= v95)
      v95 = v91;
    v96 = v95 / v91;
    v91 = v91 - v95;
    v97 = fmax(v96 / 0.2, 0.0);
    if (v97 >= 1.0)
      v98 = 0.0;
    else
      v98 = 1.0 - v97;
    objc_msgSend(v9, "_searchBarTextField");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "_setForegroundViewsAlpha:", v98);

    v100 = fmax((v96 + -0.8) / 0.15, 0.0);
    if (v100 >= 1.0)
      v101 = 0.0;
    else
      v101 = 1.0 - v100;
    objc_msgSend(v9, "_searchBarTextField");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "_setBackgroundViewsAlpha:", v101);

  }
  v103 = v48;
  if ((v60 & 0x80000) != 0)
  {
    v103 = v48;
    if (self->_cancelButton)
    {
      v103 = v48;
      if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 4) != 0)
      {
        if (!-[_UISearchBarVisualProviderLegacy isInBarButNotHosted](self, "isInBarButNotHosted")
          || (+[UIDevice currentDevice](UIDevice, "currentDevice"),
              v104 = (void *)objc_claimAutoreleasedReturnValue(),
              v105 = objc_msgSend(v104, "userInterfaceIdiom"),
              v104,
              v103 = v48,
              (v105 & 0xFFFFFFFFFFFFFFFBLL) != 1))
        {
          -[UIView frame](self->_cancelButton, "frame");
          v103 = v48 + v106 + 11.0;
        }
      }
    }
  }
  if (!UISearchBarUsesModernAppearance()
    || (v107 = v49, (*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 0xC) == 0))
  {
    v108 = v49 + (rect - v91) * 0.5;
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v109, "userInterfaceIdiom");
    v111 = ceil(v108);
    v112 = floor(v108);
    if (v110 == 1)
      v107 = v111;
    else
      v107 = v112;

  }
  if (v24 && v21)
    -[_UISearchBarVisualProviderLegacy landscapeSearchFieldWidth](self, "landscapeSearchFieldWidth");
  else
    -[_UISearchBarVisualProviderLegacy availableBoundsWidth](self, "availableBoundsWidth");
  v114 = v113;
  -[_UISearchBarAppearanceStorage searchFieldPositionAdjustment](self->_appearanceStorage, "searchFieldPositionAdjustment");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v115;
  if (v115)
  {
    v117 = v9[30];
    objc_msgSend(v115, "UIOffsetValue");
    v120 = (*(_QWORD *)&v117 & 0x80000) == 0;
    v60 = v180;
    if (!v120)
      v118 = -v118;
    v103 = v103 + v118;
    v107 = v107 + v119;
  }

  v208.origin.x = v103;
  v208.origin.y = v107;
  v208.size.width = v114;
  v208.size.height = v91;
  v121 = CGRectGetHeight(v208);
  -[UIView frame](self->_searchField, "frame");
  if (v121 != CGRectGetHeight(v209))
    -[_UISearchBarVisualProviderLegacy updateRightView](self, "updateRightView");
  if (v24 && v177)
  {
    v122 = _UIViewReadableWidthForView(v9);
    v210.origin.x = v103;
    v210.origin.y = v107;
    v210.size.width = v114;
    v210.size.height = v91;
    if (v122 < CGRectGetWidth(v210))
    {
      v211.origin.x = v48;
      v211.origin.y = v49;
      v211.size.width = v179;
      v211.size.height = rect;
      v123 = round(CGRectGetMidX(v211) + v122 * -0.5);
      v124 = v103;
      v125 = v107;
      v126 = v114;
      v127 = v91;
      if ((v60 & 0x80000) != 0)
      {
        MinX = CGRectGetMinX(*(CGRect *)&v124);
        v213.origin.x = v123;
        v213.origin.y = v107;
        v213.size.width = v122;
        v213.size.height = v91;
        v129 = fmax(MinX - CGRectGetMinX(v213), 0.0);
      }
      else
      {
        v128 = CGRectGetMaxX(*(CGRect *)&v124);
        v212.origin.x = v123;
        v212.origin.y = v107;
        v212.size.width = v122;
        v212.size.height = v91;
        v129 = v128 - CGRectGetMaxX(v212);
        if (v129 > 0.0)
          v129 = 0.0;
      }
      v103 = v123 + v129;
      v114 = v122;
    }
  }
  objc_msgSend(v9, "delegate");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  if (v131 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v131, "_searchBar:proposedSearchFieldFrame:", v9, v103, v107, v114, v91);
    v133 = v132;
    v107 = v134;
    v136 = v135;
    v91 = v137;
  }
  else
  {
    v136 = v114;
    v133 = v103;
  }
  -[UITextField setFrame:](self->_searchField, "setFrame:", v133, v107, v136, v91);
  if (((v178 | !v21) & 1) != 0)
  {
    v138 = rect;
    if (v24 && v177)
      -[_UISearchBarVisualProviderLegacy updateScopeBarFrame](self, "updateScopeBarFrame");
    goto LABEL_114;
  }
  if (v24)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59___UISearchBarVisualProviderLegacy_layoutSubviewsInBounds___block_invoke_3;
    aBlock[3] = &unk_1E16B71F8;
    aBlock[4] = self;
    v186 = v133;
    v187 = v107;
    v188 = v136;
    v189 = v91;
    v190 = v48;
    v191 = v49;
    v138 = rect;
    v192 = v179;
    v193 = rect;
    v194 = v175;
    v185 = v9;
    v139 = (void (**)(void))_Block_copy(aBlock);
    v139[2]();

LABEL_114:
    v140 = !v24;
    if ((*(_DWORD *)&self->_searchBarVisualProviderFlags & 0xC0000000) != 0)
      v140 = 1;
    if ((v140 & 1) == 0)
      -[UIView setAlpha:](self->_scopeBarContainerView, "setAlpha:", 1.0);
    goto LABEL_119;
  }
  objc_msgSend(v9, "bounds");
  v141 = CGRectGetMaxX(v214);
  v138 = rect;
  UIRoundToViewScale(v9);
  v143 = v142 + 1.0;
  -[_UISearchBarVisualProviderLegacy landscapeScopeBarWidth](self, "landscapeScopeBarWidth");
  -[UIView setFrame:](self->_scopeBarContainerView, "setFrame:", v141, v143, v144, v175);
LABEL_119:
  if (v182
    && (+[UIDevice currentDevice](UIDevice, "currentDevice"),
        v145 = (void *)objc_claimAutoreleasedReturnValue(),
        v146 = objc_msgSend(v145, "userInterfaceIdiom"),
        v145,
        (v146 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    -[UIView removeFromSuperview](self->_cancelButton, "removeFromSuperview");
    v147 = v176;
  }
  else
  {
    cancelButton = self->_cancelButton;
    if (cancelButton)
    {
      -[UIView superview](cancelButton, "superview");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_viewForChildViews");
      v150 = (void *)objc_claimAutoreleasedReturnValue();

      v151 = self->_cancelButton;
      if (v149 != v150)
      {
        objc_msgSend(v9, "addSubview:", v151);
        v151 = self->_cancelButton;
      }
    }
    else
    {
      v151 = 0;
    }
    -[UIView frame](v151, "frame");
    v153 = v152;
    v155 = v154;
    if ((v60 & 0x80000) != 0)
    {
      if (v24)
      {
        scopeBarContainerView = self->_scopeBarContainerView;
        if (scopeBarContainerView)
          v161 = v21;
        else
          v161 = 0;
        v147 = v176;
        if (v161)
        {
          -[UIView frame](scopeBarContainerView, "frame");
          v103 = v162;
        }
      }
      else
      {
        v147 = v176;
      }
      -[UIButton _pathTitleEdgeInsets](self->_cancelButton, "_pathTitleEdgeInsets");
      v164 = v103 + -11.0 + v165 - v153;
    }
    else
    {
      if (v24)
      {
        v156 = self->_scopeBarContainerView;
        if (v156)
          v157 = v21;
        else
          v157 = 0;
        v147 = v176;
        if (v157)
        {
          -[UIView frame](v156, "frame");
          v103 = v158;
          v114 = v159;
        }
      }
      else
      {
        v147 = v176;
      }
      -[UIButton _pathTitleEdgeInsets](self->_cancelButton, "_pathTitleEdgeInsets");
      v164 = v114 + v103 + 11.0 - v163;
    }
    v166 = round(v49 + v138 * 0.5 - v155 * 0.5) + -1.0;
    v167 = self->_cancelButton;
    if (v167
      && (-[UIView subviews](v167, "subviews"),
          v168 = (void *)objc_claimAutoreleasedReturnValue(),
          v169 = objc_msgSend(v168, "count"),
          v168,
          !v169)
      && +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      v183[0] = MEMORY[0x1E0C809B0];
      v183[1] = 3221225472;
      v183[2] = __59___UISearchBarVisualProviderLegacy_layoutSubviewsInBounds___block_invoke_4;
      v183[3] = &unk_1E16B20D8;
      v183[4] = self;
      *(double *)&v183[5] = v164;
      *(double *)&v183[6] = v166;
      *(double *)&v183[7] = v153;
      *(double *)&v183[8] = v155;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v183);
    }
    else
    {
      -[UIButton setFrame:](self->_cancelButton, "setFrame:", v164, v166, v153, v155);
      v170 = 1.0;
      if ((*(_DWORD *)&self->_searchBarVisualProviderFlags & 0x40000) == 0)
        v170 = 0.0;
      -[UIView setAlpha:](self->_cancelButton, "setAlpha:", v170);
    }
  }
  separator = self->_separator;
  if (separator)
  {
    -[UIView frame](separator, "frame");
    v173 = -v172;
    objc_msgSend(v9, "bounds");
    -[UIImageView setFrame:](self->_separator, "setFrame:", 0.0, v173);
  }

LABEL_153:
}

- (BOOL)isAtTop
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  char v9;
  _BOOL8 v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      && (objc_msgSend(v3, "_containingScrollView"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          !v5))
    {
      if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
      {
        v7 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v4);
        __UIStatusBarManagerForWindow(v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isStatusBarHidden");

        if ((v9 & 1) != 0)
        {
          v10 = 1;
        }
        else
        {
          __UIStatusBarManagerForWindow(v4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "defaultStatusBarHeightInOrientation:", v7);
          v22 = v21;

          v10 = v22 == 0.0;
        }
        objc_msgSend(v4, "_referenceFrameFromSceneUsingScreenBounds:", v10);
        v13 = v23;
        v15 = v24;
        v17 = v25;
        v19 = v26;
      }
      else
      {
        objc_msgSend(v3, "_screen");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_applicationFrame");
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;

      }
      objc_msgSend(v4, "convertRect:fromWindow:", 0, v13, v15, v17, v19);
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      objc_msgSend(v3, "superview");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "convertRect:fromView:", 0, v28, v30, v32, v34);
      v37 = v36;

      objc_msgSend(v3, "frame");
      v6 = v37 == v38;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)layoutBackgroundViewConsideringTopBarStatusAndChangedHeight:(BOOL)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  double v22;
  id v23;
  CGRect v24;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    *(_DWORD *)&self->_searchBarVisualProviderFlags &= ~0x10000u;
    v23 = v5;
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v23, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (self->_barPosition == 3 || -[_UISearchBarVisualProviderLegacy isAtTop](self, "isAtTop"))
      {
        __UIStatusBarManagerForWindow(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "statusBarHeight");
        v17 = v16;

        v9 = v9 - v17;
        v13 = v13 + v17;
      }
    }
    else
    {
      *(_DWORD *)&self->_searchBarVisualProviderFlags |= 0x10000u;
    }
    -[UIView frame](self->_searchBarBackground, "frame");
    if (a3
      || (v24.origin.x = v7,
          v24.origin.y = v9,
          v24.size.width = v11,
          v24.size.height = v13,
          !CGRectEqualToRect(*(CGRect *)&v18, v24)))
    {
      if (-[_UISearchBarVisualProviderLegacy scopeBarIsVisible](self, "scopeBarIsVisible")
        && !-[_UISearchBarVisualProviderLegacy shouldCombineLandscapeBarsForOrientation:](self, "shouldCombineLandscapeBarsForOrientation:", objc_msgSend(v23, "_expectedInterfaceOrientation")))
      {
        -[_UISearchBarVisualProviderLegacy scopeBarHeight](self, "scopeBarHeight");
        v13 = v13 - v22;
      }
      -[UISearchBarBackground setFrame:](self->_searchBarBackground, "setFrame:", v7, v9, v11, v13);
    }

    v5 = v23;
  }

}

- (void)updateBackgroundToBackdropStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  int64_t v14;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (a3)
    {
      v7 = MEMORY[0x1E0C809B0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke;
      v12[3] = &unk_1E16B1C28;
      v12[4] = self;
      v14 = a3;
      v13 = v5;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);
      v11[0] = v7;
      v11[1] = 3221225472;
      v11[2] = __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke_2;
      v11[3] = &unk_1E16B1B28;
      v11[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, 0.1);

    }
    else
    {
      if (!self->_backdropStyle && (*(_DWORD *)&self->_searchBarVisualProviderFlags & 0x38) == 0x10)
      {
        objc_msgSend(v5, "_searchBarTextField");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_setBottomEffectBackgroundVisible:", 0);

      }
      if (!-[UIView isHidden](self->_backdrop, "isHidden"))
      {
        v9[4] = self;
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke_3;
        v10[3] = &unk_1E16B1B28;
        v10[4] = self;
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __68___UISearchBarVisualProviderLegacy_updateBackgroundToBackdropStyle___block_invoke_4;
        v9[3] = &unk_1E16B3FD8;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, v10, v9, 0.1, 0.15);
      }
    }
  }

}

- (void)setBackgroundLayoutNeedsUpdate
{
  *(_DWORD *)&self->_searchBarVisualProviderFlags |= 0x10000u;
}

- (id)navigationBarForShadow
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "_viewControllerForAncestor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "navigationBar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
        goto LABEL_9;
    }
    else
    {
      objc_msgSend(v4, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "navigationBar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_9;
    }
    if ((objc_msgSend(v5, "isHidden") & 1) == 0 && (objc_msgSend(v5, "containsView:", v3) & 1) == 0)
    {
      v6 = v5;
      goto LABEL_10;
    }
LABEL_9:
    v6 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (BOOL)shouldDisplayShadow
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  char v7;
  BOOL v8;
  id v10;
  void *v11;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UISearchBarVisualProviderLegacy navigationBarForShadow](self, "navigationBarForShadow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4
      || (objc_msgSend(v4, "_hidesShadow") & 1) != 0
      || (WeakRetained = objc_loadWeakRetained(&self->_searchDisplayController),
          v7 = objc_msgSend(WeakRetained, "isActive"),
          WeakRetained,
          (v7 & 1) != 0))
    {
      v8 = 0;
    }
    else
    {
      v10 = v3;
      do
      {
        v11 = v10;
        objc_msgSend(v10, "superview");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        v8 = v10 == 0;
        if (!v10)
          break;
        objc_opt_class();
      }
      while ((objc_opt_isKindOfClass() & 1) == 0);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)makeShadowView
{
  void *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxY;
  double v11;
  void *v12;
  double v13;
  double v14;
  _UISearchBarShadowView *v15;
  void *v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "bounds");
    x = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
    MinX = CGRectGetMinX(v18);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    MaxY = CGRectGetMaxY(v19);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v11 = CGRectGetWidth(v20);
    objc_msgSend(v4, "_screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    v14 = 1.0 / v13;

    v15 = -[UIImageView initWithFrame:]([_UISearchBarShadowView alloc], "initWithFrame:", MinX, MaxY, v11, v14);
    _UIBarHairlineShadowColorForBarStyle(*(_DWORD *)&self->_searchBarVisualProviderFlags & 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UIView setAutoresizingMask:](v15, "setAutoresizingMask:", 10);
    -[UIView setUserInteractionEnabled:](v15, "setUserInteractionEnabled:", 0);
  }
  else
  {
    v15 = objc_alloc_init(UIImageView);
  }

  return v15;
}

- (void)setShadowVisibleIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _BOOL4 v7;
  UIImageView *shadowView;
  UIImageView *v9;
  UIImageView *v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UIImageView *v15;
  double MinX;
  double MaxY;
  double v18;
  UIImageView *v19;
  id v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v20 = v5;
    -[_UISearchBarVisualProviderLegacy navigationBarForShadow](self, "navigationBarForShadow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setDeferShadowToSearchBar:", v3);
    v7 = -[_UISearchBarVisualProviderLegacy shouldDisplayShadow](self, "shouldDisplayShadow");
    shadowView = self->_shadowView;
    if (v7 && v3)
    {
      if (!shadowView)
      {
        -[_UISearchBarVisualProviderLegacy makeShadowView](self, "makeShadowView");
        v9 = (UIImageView *)objc_claimAutoreleasedReturnValue();
        v10 = self->_shadowView;
        self->_shadowView = v9;

        objc_msgSend(v20, "addSubview:", self->_shadowView);
      }
      objc_msgSend(v20, "bounds");
      x = v21.origin.x;
      y = v21.origin.y;
      width = v21.size.width;
      height = v21.size.height;
      v15 = self->_shadowView;
      MinX = CGRectGetMinX(v21);
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      MaxY = CGRectGetMaxY(v22);
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      v18 = CGRectGetWidth(v23);
      -[UIView bounds](self->_shadowView, "bounds");
      -[UIImageView setFrame:](v15, "setFrame:", MinX, MaxY, v18, CGRectGetHeight(v24));
    }
    else
    {
      -[UIView removeFromSuperview](shadowView, "removeFromSuperview");
      v19 = self->_shadowView;
      self->_shadowView = 0;

    }
    v5 = v20;
  }

}

- (void)setSearchDisplayControllerShowsCancelButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  int v7;
  double v8;
  double v9;
  _BOOL8 v10;
  _BOOL4 v11;
  void *v12;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
    if (((((*(_DWORD *)&searchBarVisualProviderFlags & 0x40000) == 0) ^ v3) & 1) == 0)
    {
      if (v3)
        v7 = 0x40000;
      else
        v7 = 0;
      self->_searchBarVisualProviderFlags = ($B0CEE0411BC9260FB4C6BC24420153D9)(*(_DWORD *)&searchBarVisualProviderFlags & 0xFFFBFFFF | v7);
      if (v3)
        v8 = 0.0;
      else
        v8 = 1.0;
      if (v3)
        v9 = 1.0;
      else
        v9 = 0.0;
      v12 = v5;
      v10 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
      +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
      -[UIView setAlpha:](self->_cancelButton, "setAlpha:", v8);
      +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v10);
      objc_msgSend(v12, "setNeedsLayout");
      objc_msgSend(v12, "layoutBelowIfNeeded");
      -[UIView setAlpha:](self->_cancelButton, "setAlpha:", v9);
      v11 = -[_UISearchBarVisualProviderLegacy isInBarButNotHosted](self, "isInBarButNotHosted");
      v5 = v12;
      if (v11)
      {
        -[_UISearchBarVisualProviderLegacy displayNavBarCancelButton:animated:](self, "displayNavBarCancelButton:animated:", (*(_DWORD *)&self->_searchBarVisualProviderFlags >> 18) & 1, 1);
        v5 = v12;
      }
    }
  }

}

- (void)allowCursorToAppear:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = v5;
    v6 = -[_UISearchBarVisualProviderLegacy centerPlaceholder](self, "centerPlaceholder");
    v5 = v9;
    if (v6)
    {
      objc_msgSend(v9, "_searchBarTextField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v3)
      {
        objc_msgSend(v7, "_setPreventSelectionViewActivation:", 0);
        if (objc_msgSend(v8, "isFirstResponder"))
        {
          objc_msgSend(v8, "__resumeBecomeFirstResponder");
          objc_msgSend(v8, "_activateSelectionView");
        }
      }
      else
      {
        objc_msgSend(v7, "_setPreventSelectionViewActivation:", 1);
      }

      v5 = v9;
    }
  }

}

- (int64_t)barMetricsForOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  $B0CEE0411BC9260FB4C6BC24420153D9 searchBarVisualProviderFlags;
  int64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v9 = 0;
    goto LABEL_21;
  }
  -[UILabel text](self->_promptLabel, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if ((unint64_t)(a3 - 1) <= 1)
    goto LABEL_18;
  searchBarVisualProviderFlags = self->_searchBarVisualProviderFlags;
  if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) != 0)
  {
    objc_msgSend(v5, "_searchController");
    a3 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)a3, "isActive") & 1) == 0 && (*((_BYTE *)&self->_searchBarVisualProviderFlags + 3) & 1) == 0)
    {
LABEL_11:

      goto LABEL_18;
    }
  }
  else if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x1000000) == 0)
  {
LABEL_18:
    if (v7)
      v9 = 101;
    else
      v9 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v5, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "userInterfaceIdiom") == 1)
  {

    if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) == 0)
      goto LABEL_18;
    goto LABEL_11;
  }
  objc_msgSend(v5, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "horizontalSizeClass");

  if ((*(_DWORD *)&searchBarVisualProviderFlags & 0x4000000) != 0)
  if (v12 != 1)
    goto LABEL_18;
  if (v7)
    v9 = 102;
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (BOOL)wantsDictationButton
{
  return 0;
}

- (void)setSearchDisplayController:(id)a3
{
  void *v4;
  void *v5;
  id obj;

  obj = a3;
  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_storeWeak(&self->_searchDisplayController, obj);
    if (-[_UISearchBarVisualProviderLegacy centerPlaceholder](self, "centerPlaceholder"))
    {
      objc_msgSend(v4, "textInputTraits");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDeferBecomingResponder:", obj == 0);

    }
  }

}

- (id)searchDisplayController
{
  return objc_loadWeakRetained(&self->_searchDisplayController);
}

- (id)searchNavigationItem
{
  void *v3;
  id WeakRetained;
  uint64_t v5;
  _UISearchBarNavigationItem *v6;
  __CFString *v7;
  UINavigationItem *v8;
  UINavigationItem *searchNavigationItem;

  if (!self->_searchNavigationItem)
  {
    -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      WeakRetained = objc_loadWeakRetained(&self->_searchDisplayController);
      v5 = objc_msgSend(WeakRetained, "navigationBarSearchFieldSizing");
      v6 = [_UISearchBarNavigationItem alloc];
      if (v5 == 3)
      {
        v7 = &stru_1E16EDF20;
      }
      else
      {
        _UINSLocalizedStringWithDefaultValue(CFSTR("Search"), CFSTR("Search"));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v8 = -[UINavigationItem initWithTitle:](v6, "initWithTitle:", v7);
      searchNavigationItem = self->_searchNavigationItem;
      self->_searchNavigationItem = v8;

      if (v5 != 3)
      -[_UISearchBarVisualProviderLegacy setUpSearchNavigationItemWithSizingOption:](self, "setUpSearchNavigationItemWithSizingOption:", v5);

    }
  }
  return self->_searchNavigationItem;
}

- (void)setUpSearchNavigationItemWithSizingOption:(unint64_t)a3
{
  void *v5;
  id WeakRetained;
  UINavigationItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  UIView *v17;
  double v18;
  UIView *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double Width;
  double v31;
  double v32;
  UIBarButtonItem *v33;
  UIBarButtonItem *animatedAppearanceBarButtonItem;
  double v35;
  UISearchBarBackground *searchBarBackground;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  -[_UISearchBarVisualProviderBase searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v37 = v5;
    WeakRetained = objc_loadWeakRetained(&self->_searchDisplayController);
    v7 = self->_searchNavigationItem;
    objc_msgSend(v37, "_searchBarTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a3)
    {
      if (a3 > 2)
      {
        if (a3 == 3)
        {
          objc_msgSend(v37, "window");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = [UIView alloc];
          -[_UISearchBarVisualProviderLegacy searchFieldHeight](self, "searchFieldHeight");
          UIRoundToViewScale(v16);
          v19 = -[UIView initWithFrame:](v17, "initWithFrame:", 0.0, 0.0, 36.0, v18);
          -[_UISearchBarVisualProviderLegacy updateMagnifyingGlassView](self, "updateMagnifyingGlassView");
          +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          UIRoundToViewScale(v16);
          v22 = v21;
          -[_UISearchBarVisualProviderLegacy searchFieldHeight](self, "searchFieldHeight");
          objc_msgSend(v20, "setFrame:", 0.0, v22, 36.0, v23);
          objc_msgSend(v20, "setAutoresizingMask:", 4);
          objc_msgSend(v9, "leftView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "image");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setImage:forState:", v25, 0);

          objc_msgSend(v20, "addTarget:action:forControlEvents:", WeakRetained, sel__animateNavigationBarSearchBarAppearance_, 64);
          objc_msgSend(v20, "sizeToFit");
          objc_msgSend(v9, "bounds");
          objc_msgSend(v9, "leftViewRectForBounds:");
          v27 = v26;
          objc_msgSend(v20, "_pathImageEdgeInsets");
          v29 = v28 - v27;
          objc_msgSend(v37, "bounds");
          Width = CGRectGetWidth(v41);
          -[_UISearchBarVisualProviderLegacy searchFieldHeight](self, "searchFieldHeight");
          v32 = v31;
          objc_msgSend(v9, "setAutoresizingMask:", 2);
          objc_msgSend(v9, "setFrame:", v29, 0.0, Width, v32);
          objc_msgSend(v9, "setHidden:", 1);
          -[UIView addSubview:](v19, "addSubview:", v9);
          -[UIView addSubview:](v19, "addSubview:", v20);
          v33 = -[UIBarButtonItem initWithCustomView:]([UIBarButtonItem alloc], "initWithCustomView:", v19);
          animatedAppearanceBarButtonItem = self->_animatedAppearanceBarButtonItem;
          self->_animatedAppearanceBarButtonItem = v33;

          -[UIBarButtonItem setWidth:](self->_animatedAppearanceBarButtonItem, "setWidth:", 36.0);
          -[UINavigationItem setRightBarButtonItem:](v7, "setRightBarButtonItem:", self->_animatedAppearanceBarButtonItem);

LABEL_17:
          -[UIView removeFromSuperview](self->_searchBarBackground, "removeFromSuperview");
          searchBarBackground = self->_searchBarBackground;
          self->_searchBarBackground = 0;

          v5 = v37;
          goto LABEL_18;
        }
LABEL_14:
        -[UINavigationItem setTitleView:](v7, "setTitleView:", v9);
        if ((*((_BYTE *)&self->_searchBarVisualProviderFlags + 2) & 4) != 0)
          -[_UISearchBarVisualProviderLegacy displayNavBarCancelButton:animated:](self, "displayNavBarCancelButton:animated:", 1, 0);
        -[_UISearchBarVisualProviderLegacy prompt](self, "prompt");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UINavigationItem setPrompt:](v7, "setPrompt:", v16);
        goto LABEL_17;
      }
      objc_msgSend(v8, "frame");
      if (CGRectGetWidth(v38) >= 1.0)
      {
        objc_msgSend(v9, "frame");
        if (CGRectGetHeight(v39) >= 1.0)
          goto LABEL_14;
      }
      if (WeakRetained)
      {
        objc_msgSend(WeakRetained, "searchContentsController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "navigationController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "navigationBar");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "frame");
        v13 = CGRectGetWidth(v40) * 0.5;

      }
      else
      {
        v13 = 100.0;
      }
      -[_UISearchBarVisualProviderLegacy searchFieldHeight](self, "searchFieldHeight");
      v15 = v35;
    }
    else
    {
      -[_UISearchBarVisualProviderLegacy searchFieldHeight](self, "searchFieldHeight");
      v15 = v14;
      v13 = 14433663.0;
    }
    objc_msgSend(v9, "setFrame:", 0.0, 0.0, v13, v15);
    goto LABEL_14;
  }
LABEL_18:

}

- (void)prepareFromAbandonedVisualProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UISearchBarTextField *v7;
  UISearchBarTextField *searchField;
  UISearchBarBackground *v9;
  UISearchBarBackground *searchBarBackground;
  _UIBackdropView *v11;
  _UIBackdropView *backdrop;
  UIVisualEffectView *v13;
  UIVisualEffectView *backdropVisualEffectView;
  UIView *v15;
  UIView *searchBarClippingView;
  UIButton *v17;
  UIButton *cancelButton;
  UIBarButtonItem *v19;
  UIBarButtonItem *cancelBarButtonItem;
  NSString *v21;
  NSString *cancelButtonText;
  UINavigationButton *v23;
  UINavigationButton *leftButton;
  UILabel *v25;
  UILabel *promptLabel;
  UIImageView *v27;
  UIImageView *separator;
  UISegmentedControl *v29;
  UISegmentedControl *scopeBar;
  void *v31;
  UIView *v32;
  UIView *v33;
  UIView *scopeBarContainerView;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  _UISearchBarScopeBarBackground *v41;
  _UISearchBarScopeBarBackground *scopeBarBackgroundView;
  NSArray *v43;
  NSArray *scopeTitles;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  double v53;
  _UINavigationBarTitleViewOverlayRects *v54;
  _UINavigationBarTitleViewOverlayRects *navBarTitleViewOverlayRects;
  void *v56;
  UIBarButtonItem *v57;
  UIBarButtonItem *animatedAppearanceBarButtonItem;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UISearchBarVisualProviderLegacy prepare](self, "prepare");
  if (v4)
  {
    objc_msgSend(v4, "barTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchBarVisualProviderLegacy _setBarTintColor:](self, "_setBarTintColor:", v5);

    -[_UISearchBarVisualProviderLegacy _setBarStyle:](self, "_setBarStyle:", objc_msgSend(v4, "barStyle"));
    -[_UISearchBarVisualProviderLegacy _setShowsScopeBar:](self, "_setShowsScopeBar:", objc_msgSend(v4, "showsScopeBar"));
    -[_UISearchBarVisualProviderLegacy _setAutoDisableCancelButton:](self, "_setAutoDisableCancelButton:", objc_msgSend(v4, "autoDisableCancelButton"));
    -[_UISearchBarVisualProviderLegacy _setShowsCancelButton:](self, "_setShowsCancelButton:", objc_msgSend(v4, "showsCancelButton"));
    -[_UISearchBarVisualProviderLegacy _setShowsBookmarkButton:](self, "_setShowsBookmarkButton:", objc_msgSend(v4, "showsBookmarkButton"));
    -[_UISearchBarVisualProviderLegacy _setShowsSearchResultsButton:](self, "_setShowsSearchResultsButton:", objc_msgSend(v4, "showsSearchResultsButton"));
    -[_UISearchBarVisualProviderLegacy _setSearchResultsButtonSelected:](self, "_setSearchResultsButtonSelected:", objc_msgSend(v4, "isSearchResultsButtonSelected"));
    -[_UISearchBarVisualProviderLegacy setAllowsInlineScopeBar:](self, "setAllowsInlineScopeBar:", objc_msgSend(v4, "allowsInlineScopeBar"));
    -[_UISearchBarVisualProviderLegacy _setBarTranslucence:](self, "_setBarTranslucence:", objc_msgSend(v4, "barTranslucence"));
    -[_UISearchBarVisualProviderLegacy _setHideBackground:](self, "_setHideBackground:", objc_msgSend(v4, "drawsBackground") ^ 1);
    objc_msgSend(v4, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchBarVisualProviderBase setSearchBar:](self, "setSearchBar:", v6);

    objc_msgSend(v4, "searchFieldIfExists");
    v7 = (UISearchBarTextField *)objc_claimAutoreleasedReturnValue();
    searchField = self->_searchField;
    self->_searchField = v7;

    -[UIView removeFromSuperview](self->_searchBarBackground, "removeFromSuperview");
    objc_msgSend(v4, "searchBarBackground");
    v9 = (UISearchBarBackground *)objc_claimAutoreleasedReturnValue();
    searchBarBackground = self->_searchBarBackground;
    self->_searchBarBackground = v9;

    objc_msgSend(v4, "backdrop");
    v11 = (_UIBackdropView *)objc_claimAutoreleasedReturnValue();
    backdrop = self->_backdrop;
    self->_backdrop = v11;

    objc_msgSend(v4, "backdropVisualEffectView");
    v13 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
    backdropVisualEffectView = self->_backdropVisualEffectView;
    self->_backdropVisualEffectView = v13;

    objc_msgSend(v4, "searchBarClippingView");
    v15 = (UIView *)objc_claimAutoreleasedReturnValue();
    searchBarClippingView = self->_searchBarClippingView;
    self->_searchBarClippingView = v15;

    objc_msgSend(v4, "cancelButton");
    v17 = (UIButton *)objc_claimAutoreleasedReturnValue();
    cancelButton = self->_cancelButton;
    self->_cancelButton = v17;

    objc_msgSend(v4, "cancelBarButtonItemIfExists");
    v19 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    cancelBarButtonItem = self->_cancelBarButtonItem;
    self->_cancelBarButtonItem = v19;

    objc_msgSend(v4, "cancelButtonText");
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    cancelButtonText = self->_cancelButtonText;
    self->_cancelButtonText = v21;

    objc_msgSend(v4, "leftButtonIfExists");
    v23 = (UINavigationButton *)objc_claimAutoreleasedReturnValue();
    leftButton = self->_leftButton;
    self->_leftButton = v23;

    objc_msgSend(v4, "promptLabel");
    v25 = (UILabel *)objc_claimAutoreleasedReturnValue();
    promptLabel = self->_promptLabel;
    self->_promptLabel = v25;

    objc_msgSend(v4, "separator");
    v27 = (UIImageView *)objc_claimAutoreleasedReturnValue();
    separator = self->_separator;
    self->_separator = v27;

    objc_msgSend(v4, "scopeBar");
    v29 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
    scopeBar = self->_scopeBar;
    self->_scopeBar = v29;

    objc_msgSend(v4, "scopeBarContainerView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = [UIView alloc];
    objc_msgSend(v31, "frame");
    v33 = -[UIView initWithFrame:](v32, "initWithFrame:");
    scopeBarContainerView = self->_scopeBarContainerView;
    self->_scopeBarContainerView = v33;

    objc_msgSend(v31, "superview");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addSubview:", self->_scopeBarContainerView);

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v31, "subviews", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v60 != v39)
            objc_enumerationMutation(v36);
          -[UIView addSubview:](self->_scopeBarContainerView, "addSubview:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      }
      while (v38);
    }

    objc_msgSend(v31, "removeFromSuperview");
    objc_msgSend(v4, "scopeBarBackgroundView");
    v41 = (_UISearchBarScopeBarBackground *)objc_claimAutoreleasedReturnValue();
    scopeBarBackgroundView = self->_scopeBarBackgroundView;
    self->_scopeBarBackgroundView = v41;

    objc_msgSend(v4, "scopeTitles");
    v43 = (NSArray *)objc_claimAutoreleasedReturnValue();
    scopeTitles = self->_scopeTitles;
    self->_scopeTitles = v43;

    self->_selectedScope = objc_msgSend(v4, "selectedScope");
    self->_backdropStyle = objc_msgSend(v4, "backdropStyle");
    self->_barPosition = objc_msgSend(v4, "barPosition");
    self->_scopeBarPosition = objc_msgSend(v4, "scopeBarPosition");
    objc_msgSend(v4, "effectiveContentInset");
    self->_effectiveContentInset.top = v45;
    self->_effectiveContentInset.left = v46;
    self->_effectiveContentInset.bottom = v47;
    self->_effectiveContentInset.right = v48;
    objc_msgSend(v4, "minimumContentInset");
    self->_minimumContentInsetPrivate.top = v49;
    self->_minimumContentInsetPrivate.left = v50;
    self->_minimumContentInsetPrivate.bottom = v51;
    self->_minimumContentInsetPrivate.right = v52;
    objc_msgSend(v4, "tableViewIndexWidth");
    self->_tableViewIndexWidth = v53;
    self->_navBarTitleViewLocation = objc_msgSend(v4, "navBarTitleViewLocation");
    objc_msgSend(v4, "navBarTitleViewOverlayRects");
    v54 = (_UINavigationBarTitleViewOverlayRects *)objc_claimAutoreleasedReturnValue();
    navBarTitleViewOverlayRects = self->_navBarTitleViewOverlayRects;
    self->_navBarTitleViewOverlayRects = v54;

    objc_msgSend(v4, "navBarTitleViewDataSource");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_navBarTitleViewDataSource, v56);

    objc_msgSend(v4, "animatedAppearanceBarButtonItem");
    v57 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    animatedAppearanceBarButtonItem = self->_animatedAppearanceBarButtonItem;
    self->_animatedAppearanceBarButtonItem = v57;

    objc_msgSend(v4, "revertViewHierarchyIfNecessary");
  }
  -[_UISearchBarVisualProviderLegacy updateSearchBarOpacity](self, "updateSearchBarOpacity");

}

- (void)setSearchField:(id)a3
{
  objc_storeStrong((id *)&self->_searchField, a3);
}

- (id)searchBarBackground
{
  return self->_searchBarBackground;
}

- (void)setSearchBarBackground:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarBackground, a3);
}

- (id)backdrop
{
  return self->_backdrop;
}

- (void)setBackdrop:(id)a3
{
  objc_storeStrong((id *)&self->_backdrop, a3);
}

- (id)backdropVisualEffectView
{
  return self->_backdropVisualEffectView;
}

- (void)setBackdropVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropVisualEffectView, a3);
}

- (id)searchBarClippingView
{
  return self->_searchBarClippingView;
}

- (id)cancelButton
{
  return self->_cancelButton;
}

- (id)cancelButtonText
{
  return self->_cancelButtonText;
}

- (void)setCancelButtonText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)promptLabel
{
  return self->_promptLabel;
}

- (void)setPromptLabel:(id)a3
{
  objc_storeStrong((id *)&self->_promptLabel, a3);
}

- (id)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (id)scopeBar
{
  return self->_scopeBar;
}

- (void)setScopeBar:(id)a3
{
  objc_storeStrong((id *)&self->_scopeBar, a3);
}

- (id)scopeBarContainerView
{
  return self->_scopeBarContainerView;
}

- (id)scopeBarBackgroundView
{
  return self->_scopeBarBackgroundView;
}

- (void)setScopeBarBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_scopeBarBackgroundView, a3);
}

- (id)scopeTitles
{
  return self->_scopeTitles;
}

- (int64_t)selectedScope
{
  return self->_selectedScope;
}

- (void)setSelectedScope:(int64_t)a3
{
  self->_selectedScope = a3;
}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (id)barTintColor
{
  return self->_barTintColor;
}

- (void)setBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_barTintColor, a3);
}

- (unint64_t)scopeBarPosition
{
  return self->_scopeBarPosition;
}

- (void)setScopeBarPosition:(unint64_t)a3
{
  self->_scopeBarPosition = a3;
}

- (UIEdgeInsets)effectiveContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_effectiveContentInset.top;
  left = self->_effectiveContentInset.left;
  bottom = self->_effectiveContentInset.bottom;
  right = self->_effectiveContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)minimumContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_minimumContentInsetPrivate.top;
  left = self->_minimumContentInsetPrivate.left;
  bottom = self->_minimumContentInsetPrivate.bottom;
  right = self->_minimumContentInsetPrivate.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)tableViewIndexWidth
{
  return self->_tableViewIndexWidth;
}

- (void)setTableViewIndexWidth:(double)a3
{
  self->_tableViewIndexWidth = a3;
}

- (int64_t)navBarTitleViewLocation
{
  return self->_navBarTitleViewLocation;
}

- (void)setNavBarTitleViewLocation:(int64_t)a3
{
  self->_navBarTitleViewLocation = a3;
}

- (id)navBarTitleViewOverlayRects
{
  return self->_navBarTitleViewOverlayRects;
}

- (void)setNavBarTitleViewOverlayRects:(id)a3
{
  objc_storeStrong((id *)&self->_navBarTitleViewOverlayRects, a3);
}

- (id)navBarTitleViewDataSource
{
  return objc_loadWeakRetained((id *)&self->_navBarTitleViewDataSource);
}

- (void)setNavBarTitleViewDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_navBarTitleViewDataSource, a3);
}

- (id)animatedAppearanceBarButtonItem
{
  return self->_animatedAppearanceBarButtonItem;
}

- (id)shadowView
{
  return self->_shadowView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_destroyWeak((id *)&self->_navBarTitleViewDataSource);
  objc_storeStrong((id *)&self->_navBarTitleViewOverlayRects, 0);
  objc_storeStrong((id *)&self->_barTintColor, 0);
  objc_storeStrong((id *)&self->_scopeTitles, 0);
  objc_storeStrong((id *)&self->_scopeBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_scopeBarContainerView, 0);
  objc_storeStrong((id *)&self->_scopeBar, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_cancelButtonText, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_searchBarClippingView, 0);
  objc_storeStrong((id *)&self->_backdropVisualEffectView, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
  objc_storeStrong((id *)&self->_searchBarBackground, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_destroyWeak(&self->_searchDisplayController);
  objc_storeStrong((id *)&self->_searchNavigationItem, 0);
  objc_storeStrong((id *)&self->_animatedAppearanceBarButtonItem, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
}

@end
