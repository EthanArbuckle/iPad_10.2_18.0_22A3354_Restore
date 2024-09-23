@implementation _UISearchBarLayout

- (BOOL)hasScopeBar
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 4) & 1;
}

- (double)naturalTotalHeight
{
  double v3;
  double v4;
  __int16 searchBarLayoutFlags;
  double v6;
  double v7;

  -[_UISearchBarLayout naturalSearchFieldContainerHeight](self, "naturalSearchFieldContainerHeight");
  v4 = v3;
  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if ((searchBarLayoutFlags & 0x210) == 0x10)
  {
    -[_UISearchBarLayout naturalScopeContainerHeight](self, "naturalScopeContainerHeight");
    v4 = v4 + v6;
    searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  }
  if ((searchBarLayoutFlags & 0x20) != 0)
  {
    -[_UISearchBarLayout naturalPromptContainerHeight](self, "naturalPromptContainerHeight");
    return v4 + v7;
  }
  return v4;
}

- (double)naturalSearchFieldContainerHeight
{
  double result;

  -[_UISearchBarLayout prepareSearchContainerLayout](self, "prepareSearchContainerLayout");
  -[_UISearchBarSearchContainerLayout naturalContainerHeight](self->_searchContainerLayout, "naturalContainerHeight");
  return result;
}

- (void)prepareScopeContainerLayout
{
  double v3;
  double v4;

  -[_UISearchBarLayout setUpScopeContainerLayout](self, "setUpScopeContainerLayout");
  -[_UISearchBarLayout prepareBaseConfigurationForSublayout:](self, "prepareBaseConfigurationForSublayout:", self->_scopeContainerLayout);
  -[_UISearchBarLayoutBase contentInset](self, "contentInset");
  -[_UISearchBarLayoutBase setContentInset:](self->_scopeContainerLayout, "setContentInset:", 0.0, v3 + 0.0, 0.0, v4 + 0.0);
  -[_UISearchBarScopeContainerLayout setHasScopeBar:](self->_scopeContainerLayout, "setHasScopeBar:", (*(_WORD *)&self->_searchBarLayoutFlags >> 4) & 1);
  -[_UISearchBarScopeContainerLayout setNumberOfScopeTitles:](self->_scopeContainerLayout, "setNumberOfScopeTitles:", self->_numberOfScopeTitles);
  -[_UISearchBarScopeContainerLayout setDefaultScopeBarInsets:](self->_scopeContainerLayout, "setDefaultScopeBarInsets:", self->_defaultScopeBarInsets.top, self->_defaultScopeBarInsets.left, self->_defaultScopeBarInsets.bottom, self->_defaultScopeBarInsets.right);
  -[_UISearchBarScopeContainerLayout setHostedScopeBarHeightForBarMetrics:](self->_scopeContainerLayout, "setHostedScopeBarHeightForBarMetrics:", self->_hostedScopeBarHeightForBarMetrics);
  -[_UISearchBarScopeContainerLayout setHostedScopeBarTopInsetForBarMetrics:](self->_scopeContainerLayout, "setHostedScopeBarTopInsetForBarMetrics:", self->_hostedScopeBarTopInsetForBarMetrics);
  if ((*(_WORD *)&self->_searchBarLayoutFlags & 0x200) != 0)
  {
    -[_UISearchBarScopeContainerLayout setNeighboringSearchLayout:](self->_scopeContainerLayout, "setNeighboringSearchLayout:", 0);
  }
  else
  {
    -[_UISearchBarScopeContainerLayout setNeighboringSearchLayout:](self->_scopeContainerLayout, "setNeighboringSearchLayout:", self->_searchContainerLayout);
    -[_UISearchBarLayoutBase setLayoutSize:](self->_scopeContainerLayout, "setLayoutSize:", self->_scopeBarContainerLayoutFrame.size.width, self->_scopeBarContainerLayoutFrame.size.height);
  }
}

- (void)prepareSearchContainerLayout
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UISearchBarLayout setUpSearchContainerLayout](self, "setUpSearchContainerLayout");
  -[_UISearchBarLayout prepareBaseConfigurationForSublayout:](self, "prepareBaseConfigurationForSublayout:", self->_searchContainerLayout);
  -[_UISearchBarLayoutBase contentInset](self, "contentInset");
  -[_UISearchBarLayoutBase setContentInset:](self->_searchContainerLayout, "setContentInset:");
  -[_UISearchBarSearchContainerLayout setSearchBarReadableWidth:](self->_searchContainerLayout, "setSearchBarReadableWidth:", self->_searchBarReadableWidth);
  if (-[_UISearchBarLayout representedLayoutState](self, "representedLayoutState") != 3
    || (*(_WORD *)&self->_searchBarLayoutFlags & 0x200) != 0)
  {
    v3 = 0;
  }
  else
  {
    if (_forceReadableWidthBehaviorPreference_onceToken != -1)
      dispatch_once(&_forceReadableWidthBehaviorPreference_onceToken, &__block_literal_global_71);
    if (_forceReadableWidthBehaviorPreference_pref < 0)
      v3 = (*(_WORD *)&self->_searchBarLayoutFlags >> 4) & 1;
    else
      v3 = _forceReadableWidthBehaviorPreference_pref != 0;
  }
  -[_UISearchBarSearchContainerLayout setSearchFieldRespectsReadableWidth:](self->_searchContainerLayout, "setSearchFieldRespectsReadableWidth:", v3);
  -[_UISearchBarSearchContainerLayout setHostedInlineByNavigationBar:](self->_searchContainerLayout, "setHostedInlineByNavigationBar:", (*(_WORD *)&self->_searchBarLayoutFlags >> 9) & 1);
  -[_UISearchBarSearchContainerLayout setTextFieldManagedInNSToolbar:](self->_searchContainerLayout, "setTextFieldManagedInNSToolbar:", (*(_WORD *)&self->_searchBarLayoutFlags >> 10) & 1);
  -[_UISearchBarSearchContainerLayout setHasCancelButton:](self->_searchContainerLayout, "setHasCancelButton:", *(_WORD *)&self->_searchBarLayoutFlags & 1);
  -[_UISearchBarSearchContainerLayout setHasDeleteButton:](self->_searchContainerLayout, "setHasDeleteButton:", (*(_WORD *)&self->_searchBarLayoutFlags >> 1) & 1);
  -[_UISearchBarSearchContainerLayout setDrawsSearchIconOnly:](self->_searchContainerLayout, "setDrawsSearchIconOnly:", -[_UISearchBarLayout representedLayoutState](self, "representedLayoutState") == 1);
  -[_UISearchBarSearchContainerLayout setHasLeftButton:](self->_searchContainerLayout, "setHasLeftButton:", (*(_WORD *)&self->_searchBarLayoutFlags >> 2) & 1);
  -[_UISearchBarSearchContainerLayout setHasFloatingSearchIconBackgroundView:](self->_searchContainerLayout, "setHasFloatingSearchIconBackgroundView:", (*(_WORD *)&self->_searchBarLayoutFlags >> 3) & 1);
  -[_UISearchBarSearchContainerLayout setAllowSearchFieldShrinkage:](self->_searchContainerLayout, "setAllowSearchFieldShrinkage:", (*(_WORD *)&self->_searchBarLayoutFlags >> 11) & 1);
  -[_UISearchBarSearchContainerLayout setSearchFieldUsesCustomBackgroundImage:](self->_searchContainerLayout, "setSearchFieldUsesCustomBackgroundImage:", (*(_WORD *)&self->_searchBarLayoutFlags >> 12) & 1);
  -[_UISearchBarSearchContainerLayout setSearchFieldEffectivelySupportsDynamicType:](self->_searchContainerLayout, "setSearchFieldEffectivelySupportsDynamicType:", (*(_WORD *)&self->_searchBarLayoutFlags >> 13) & 1);
  -[_UISearchBarSearchContainerLayout setSearchFieldBackgroundPositionAdjustment:](self->_searchContainerLayout, "setSearchFieldBackgroundPositionAdjustment:", self->_searchFieldBackgroundPositionAdjustment.horizontal, self->_searchFieldBackgroundPositionAdjustment.vertical);
  -[_UISearchBarLayoutBase setLayoutSize:](self->_searchContainerLayout, "setLayoutSize:", self->_searchFieldContainerLayoutFrame.size.width, self->_searchFieldContainerLayoutFrame.size.height);
  -[_UISearchBarSearchContainerLayout setRepresentedLayoutState:](self->_searchContainerLayout, "setRepresentedLayoutState:", self->_representedLayoutState);
  -[_UISearchBarLayout searchField](self, "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UISearchBarLayout searchField](self, "searchField");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_defaultHeightForBarMetrics:", -[_UISearchBarLayoutBase barMetrics](self, "barMetrics"));
    -[_UISearchBarSearchContainerLayout setSearchBarFieldHeight:](self->_searchContainerLayout, "setSearchBarFieldHeight:");

  }
  else
  {
    +[UITraitCollection _fallbackTraitCollection]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "visualStyleClassForStylableClass:", objc_opt_class());
    if (!v7)
      v7 = (void *)objc_opt_class();

    objc_msgSend(v7, "defaultHeightForBarMetrics:", -[_UISearchBarLayoutBase barMetrics](self, "barMetrics"));
    -[_UISearchBarSearchContainerLayout setSearchBarFieldHeight:](self->_searchContainerLayout, "setSearchBarFieldHeight:");
  }
}

- (UISearchBarTextField)searchField
{
  return -[_UISearchBarSearchContainerLayout searchField](self->_searchContainerLayout, "searchField");
}

- (int64_t)representedLayoutState
{
  return self->_representedLayoutState;
}

- (void)prepareBaseConfigurationForSublayout:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setBarMetrics:", -[_UISearchBarLayoutBase barMetrics](self, "barMetrics"));
  objc_msgSend(v4, "setLayoutRTL:", -[_UISearchBarLayoutBase isLayoutRTL](self, "isLayoutRTL"));
  objc_msgSend(v4, "setHostedByNavigationBar:", -[_UISearchBarLayoutBase isHostedByNavigationBar](self, "isHostedByNavigationBar"));

}

- (void)setHasSearchBarBackground:(BOOL)a3
{
  __int16 searchBarLayoutFlags;
  __int16 v4;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 64;
    else
      v4 = 0;
    *(_WORD *)&self->_searchBarLayoutFlags = searchBarLayoutFlags & 0xFFBF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setTextFieldManagedInNSToolbar:(BOOL)a3
{
  __int16 searchBarLayoutFlags;
  __int16 v4;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x400) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 1024;
    else
      v4 = 0;
    *(_WORD *)&self->_searchBarLayoutFlags = searchBarLayoutFlags & 0xFBFF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (void)setSearchIconBarButtonItem:(id)a3
{
  id v4;

  v4 = a3;
  -[_UISearchBarLayout setUpSearchContainerLayout](self, "setUpSearchContainerLayout");
  -[_UISearchBarSearchContainerLayout setSearchIconBarButtonItem:](self->_searchContainerLayout, "setSearchIconBarButtonItem:", v4);

}

- (void)setSearchFieldUsesCustomBackgroundImage:(BOOL)a3
{
  __int16 searchBarLayoutFlags;
  __int16 v4;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x1000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 4096;
    else
      v4 = 0;
    *(_WORD *)&self->_searchBarLayoutFlags = searchBarLayoutFlags & 0xEFFF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setSearchFieldFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_searchFieldFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_searchFieldFont, a3);
    v5 = v6;
    self->_cachedFontValueBeforeScaling = 0.0;
    self->_cachedFontValueAfterScaling = 0.0;
  }

}

- (void)setSearchFieldEffectivelySupportsDynamicType:(BOOL)a3
{
  __int16 searchBarLayoutFlags;
  __int16 v4;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x2000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 0x2000;
    else
      v4 = 0;
    *(_WORD *)&self->_searchBarLayoutFlags = searchBarLayoutFlags & 0xDFFF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setSearchFieldContainer:(id)a3
{
  objc_storeStrong((id *)&self->_searchFieldContainer, a3);
}

- (void)setSearchField:(id)a3
{
  id v4;

  v4 = a3;
  -[_UISearchBarLayout setUpSearchContainerLayout](self, "setUpSearchContainerLayout");
  -[_UISearchBarSearchContainerLayout setSearchField:](self->_searchContainerLayout, "setSearchField:", v4);

}

- (void)setSearchBarReadableWidth:(double)a3
{
  self->_searchBarReadableWidth = a3;
}

- (void)setSearchBarBackground:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarBackground, a3);
}

- (void)setSearchBarBackdrop:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarBackdrop, a3);
}

- (void)setScopeBarContainer:(id)a3
{
  objc_storeStrong((id *)&self->_scopeBarContainer, a3);
}

- (void)setScopeBar:(id)a3
{
  id v4;

  v4 = a3;
  -[_UISearchBarLayout setUpScopeContainerLayout](self, "setUpScopeContainerLayout");
  -[_UISearchBarScopeContainerLayout setScopeBar:](self->_scopeContainerLayout, "setScopeBar:", v4);

}

- (void)setRepresentedLayoutState:(int64_t)a3
{
  self->_representedLayoutState = a3;
}

- (void)setPromptContainer:(id)a3
{
  objc_storeStrong((id *)&self->_promptContainer, a3);
}

- (void)setOverrideInactiveWidth:(double)a3
{
  -[_UISearchBarSearchContainerLayout setOverrideInactiveWidth:](self->_searchContainerLayout, "setOverrideInactiveWidth:", a3);
}

- (void)setOverrideActiveWidth:(double)a3
{
  -[_UISearchBarSearchContainerLayout setOverrideActiveWidth:](self->_searchContainerLayout, "setOverrideActiveWidth:", a3);
}

- (void)setNumberOfScopeTitles:(unint64_t)a3
{
  self->_numberOfScopeTitles = a3;
}

- (void)setLeftButton:(id)a3
{
  id v4;

  v4 = a3;
  -[_UISearchBarLayout setUpSearchContainerLayout](self, "setUpSearchContainerLayout");
  -[_UISearchBarSearchContainerLayout setLeftButton:](self->_searchContainerLayout, "setLeftButton:", v4);

}

- (void)setHostedScopeBarTopInsetForBarMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setHostedScopeBarHeightForBarMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setHostedInlineByNavigationBar:(BOOL)a3
{
  __int16 searchBarLayoutFlags;
  __int16 v4;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x200) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 512;
    else
      v4 = 0;
    *(_WORD *)&self->_searchBarLayoutFlags = searchBarLayoutFlags & 0xFDFF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setHasSeparator:(BOOL)a3
{
  __int16 searchBarLayoutFlags;
  __int16 v4;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 256;
    else
      v4 = 0;
    *(_WORD *)&self->_searchBarLayoutFlags = searchBarLayoutFlags & 0xFEFF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setHasSearchBarBackdrop:(BOOL)a3
{
  __int16 searchBarLayoutFlags;
  __int16 v4;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x80) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 128;
    else
      v4 = 0;
    *(_WORD *)&self->_searchBarLayoutFlags = searchBarLayoutFlags & 0xFF7F | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setHasScopeBar:(BOOL)a3
{
  __int16 searchBarLayoutFlags;
  __int16 v4;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 16;
    else
      v4 = 0;
    *(_WORD *)&self->_searchBarLayoutFlags = searchBarLayoutFlags & 0xFFEF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setHasPromptLabel:(BOOL)a3
{
  __int16 searchBarLayoutFlags;
  __int16 v4;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 32;
    else
      v4 = 0;
    *(_WORD *)&self->_searchBarLayoutFlags = searchBarLayoutFlags & 0xFFDF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setHasLeftButton:(BOOL)a3
{
  __int16 searchBarLayoutFlags;
  __int16 v4;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 4;
    else
      v4 = 0;
    *(_WORD *)&self->_searchBarLayoutFlags = searchBarLayoutFlags & 0xFFFB | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setHasDeleteButton:(BOOL)a3
{
  __int16 searchBarLayoutFlags;
  __int16 v4;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 2;
    else
      v4 = 0;
    *(_WORD *)&self->_searchBarLayoutFlags = searchBarLayoutFlags & 0xFFFD | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setHasCancelButton:(BOOL)a3
{
  __int16 searchBarLayoutFlags;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 1) == 0) ^ a3) & 1) == 0)
  {
    *(_WORD *)&self->_searchBarLayoutFlags = searchBarLayoutFlags & 0xFFFE | a3;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setFloatingSearchIconView:(id)a3
{
  id v4;

  v4 = a3;
  -[_UISearchBarLayout setUpSearchContainerLayout](self, "setUpSearchContainerLayout");
  -[_UISearchBarSearchContainerLayout setFloatingSearchIconView:](self->_searchContainerLayout, "setFloatingSearchIconView:", v4);

}

- (void)setDeleteButton:(id)a3
{
  id v4;

  v4 = a3;
  -[_UISearchBarLayout setUpSearchContainerLayout](self, "setUpSearchContainerLayout");
  -[_UISearchBarSearchContainerLayout setDeleteButton:](self->_searchContainerLayout, "setDeleteButton:", v4);

}

- (void)setDefaultScopeBarInsets:(UIEdgeInsets)a3
{
  self->_defaultScopeBarInsets = a3;
}

- (void)setDefaultInactiveWidth:(double)a3
{
  -[_UISearchBarSearchContainerLayout setDefaultInactiveWidth:](self->_searchContainerLayout, "setDefaultInactiveWidth:", a3);
}

- (void)setDefaultActiveWidth:(double)a3
{
  -[_UISearchBarSearchContainerLayout setDefaultActiveWidth:](self->_searchContainerLayout, "setDefaultActiveWidth:", a3);
}

- (void)setCancelButton:(id)a3
{
  id v4;

  v4 = a3;
  -[_UISearchBarLayout setUpSearchContainerLayout](self, "setUpSearchContainerLayout");
  -[_UISearchBarSearchContainerLayout setCancelButton:](self->_searchContainerLayout, "setCancelButton:", v4);

}

- (void)setBackgroundExtension:(double)a3
{
  if (self->_backgroundExtension != a3)
  {
    self->_backgroundExtension = a3;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setAllowSearchFieldShrinkage:(BOOL)a3
{
  __int16 searchBarLayoutFlags;
  __int16 v4;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 0x800) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 2048;
    else
      v4 = 0;
    *(_WORD *)&self->_searchBarLayoutFlags = searchBarLayoutFlags & 0xF7FF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (double)rightContentInsetForInlineSearch
{
  return self->_rightContentInsetForInlineSearch;
}

- (double)leftContentInsetForInlineSearch
{
  return self->_leftContentInsetForInlineSearch;
}

- (void)setUpScopeContainerLayout
{
  _UISearchBarScopeContainerLayout *v3;
  _UISearchBarScopeContainerLayout *scopeContainerLayout;

  if (!self->_scopeContainerLayout)
  {
    v3 = objc_alloc_init(_UISearchBarScopeContainerLayout);
    scopeContainerLayout = self->_scopeContainerLayout;
    self->_scopeContainerLayout = v3;

    -[_UISearchBarScopeContainerLayout setDelegate:](self->_scopeContainerLayout, "setDelegate:", self);
  }
  if (!-[_UISearchBarLayout isProspective](self, "isProspective"))
    -[_UISearchBarScopeContainerView setLayout:](self->_scopeBarContainer, "setLayout:", self->_scopeContainerLayout);
}

- (void)setUpSearchContainerLayout
{
  _UISearchBarSearchContainerLayout *searchContainerLayout;
  _UISearchBarSearchContainerLayout *v4;
  _UISearchBarSearchContainerLayout *v5;
  double v6;
  void *v7;
  void *v8;

  searchContainerLayout = self->_searchContainerLayout;
  if (!searchContainerLayout)
  {
    v4 = objc_alloc_init(_UISearchBarSearchContainerLayout);
    v5 = self->_searchContainerLayout;
    self->_searchContainerLayout = v4;

    -[_UISearchBarSearchContainerLayout setDelegate:](self->_searchContainerLayout, "setDelegate:", self);
    searchContainerLayout = self->_searchContainerLayout;
  }
  -[_UISearchBarSearchContainerLayout searchBarFieldHeight](searchContainerLayout, "searchBarFieldHeight");
  if (v6 == 0.0)
  {
    -[_UISearchBarLayout searchField](self, "searchField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_UISearchBarLayout searchField](self, "searchField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_defaultHeightForBarMetrics:", -[_UISearchBarLayoutBase barMetrics](self, "barMetrics"));
      -[_UISearchBarSearchContainerLayout setSearchBarFieldHeight:](self->_searchContainerLayout, "setSearchBarFieldHeight:");

    }
  }
  if (!-[_UISearchBarLayout isProspective](self, "isProspective"))
    -[_UISearchBarSearchContainerView setLayout:](self->_searchFieldContainer, "setLayout:", self->_searchContainerLayout);
}

- (BOOL)isProspective
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 14) & 1;
}

- (double)layout:(id)a3 fontScaledValueForValue:(double)a4
{
  double v4;
  void *v6;
  UIFont *searchFieldFont;
  BOOL v8;
  double v9;

  v4 = a4;
  if (self->_cachedFontValueBeforeScaling == a4)
    return self->_cachedFontValueAfterScaling;
  self->_cachedFontValueBeforeScaling = a4;
  -[_UISearchBarLayout searchField](self, "searchField", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  searchFieldFont = self->_searchFieldFont;
  if (searchFieldFont)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    -[UIFont _scaledValueForValue:](searchFieldFont, "_scaledValueForValue:", v4);
    UIRoundToViewScale(v6);
    v4 = v9;
  }
  self->_cachedFontValueAfterScaling = v4;

  return v4;
}

- (double)naturalScopeContainerHeight
{
  double result;

  -[_UISearchBarLayout prepareScopeContainerLayout](self, "prepareScopeContainerLayout");
  -[_UISearchBarScopeContainerLayout naturalContainerHeight](self->_scopeContainerLayout, "naturalContainerHeight");
  return result;
}

- (void)containerLayoutWillUpdateLayout:(id)a3
{
  _UISearchBarSearchContainerLayout *v4;
  _UISearchBarSearchContainerLayout *v5;

  v5 = (_UISearchBarSearchContainerLayout *)a3;
  -[_UISearchBarLayoutBase updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  v4 = v5;
  if (self->_searchContainerLayout == v5)
  {
    -[_UISearchBarLayout prepareSearchContainerLayout](self, "prepareSearchContainerLayout");
    goto LABEL_5;
  }
  if ((_UISearchBarSearchContainerLayout *)self->_scopeContainerLayout == v5)
  {
    -[_UISearchBarLayout prepareScopeContainerLayout](self, "prepareScopeContainerLayout");
LABEL_5:
    v4 = v5;
  }

}

- (void)applyLayout
{
  int64_t representedLayoutState;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  _UISearchBarPromptContainerView *v7;
  __int16 searchBarLayoutFlags;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  _UISearchBarScopeContainerView *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  UIView *v16;
  __int16 v17;
  UIView *v18;
  UIView *v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  UIView *v23;
  unint64_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  _UISearchBarPromptContainerView *promptContainer;
  UIView *searchBarBackground;
  UIView *separator;
  _UISearchBarScopeContainerView *scopeBarContainer;
  NSObject *v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[_UISearchBarLayoutBase layoutSize](self, "layoutSize");
  representedLayoutState = self->_representedLayoutState;
  -[_UISearchBarLayout searchFieldContainerLayoutFrame](self, "searchFieldContainerLayoutFrame");
  -[UIView setFrame:](self->_searchFieldContainer, "setFrame:");
  if (representedLayoutState != 1)
  {
    if ((*(_WORD *)&self->_searchBarLayoutFlags & 0x20) != 0)
    {
      -[UIView superview](self->_promptContainer, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        if ((dyld_program_sdk_at_least() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy."), self->_promptContainer);
        }
        else if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          {
            promptContainer = self->_promptContainer;
            *(_DWORD *)buf = 138412290;
            v36 = promptContainer;
            _os_log_fault_impl(&dword_185066000, v26, OS_LOG_TYPE_FAULT, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
          }

        }
        else
        {
          v5 = _MergedGlobals_7_0;
          if (!_MergedGlobals_7_0)
          {
            v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v5, (unint64_t *)&_MergedGlobals_7_0);
          }
          v6 = *(NSObject **)(v5 + 8);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            v7 = self->_promptContainer;
            *(_DWORD *)buf = 138412290;
            v36 = v7;
            _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
          }
        }
      }
    }
    -[_UISearchBarLayout promptContainerLayoutFrame](self, "promptContainerLayoutFrame");
    -[UIView setFrame:](self->_promptContainer, "setFrame:");
    searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
    if ((searchBarLayoutFlags & 0x200) == 0)
    {
      if ((searchBarLayoutFlags & 0x10) != 0)
      {
        -[UIView superview](self->_scopeBarContainer, "superview");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          if ((dyld_program_sdk_at_least() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy."), self->_scopeBarContainer);
          }
          else if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              scopeBarContainer = self->_scopeBarContainer;
              *(_DWORD *)buf = 138412290;
              v36 = scopeBarContainer;
              _os_log_fault_impl(&dword_185066000, v29, OS_LOG_TYPE_FAULT, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
            }

          }
          else
          {
            v10 = qword_1ECD7B0B0;
            if (!qword_1ECD7B0B0)
            {
              v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v10, (unint64_t *)&qword_1ECD7B0B0);
            }
            v11 = *(NSObject **)(v10 + 8);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v12 = self->_scopeBarContainer;
              *(_DWORD *)buf = 138412290;
              v36 = v12;
              _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
            }
          }
        }
      }
      -[_UISearchBarLayout scopeBarContainerLayoutFrame](self, "scopeBarContainerLayoutFrame");
      -[UIView setFrame:](self->_scopeBarContainer, "setFrame:");
      searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
    }
    if ((searchBarLayoutFlags & 0x40) != 0)
    {
      -[UIView superview](self->_searchBarBackground, "superview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        if ((dyld_program_sdk_at_least() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy."), self->_searchBarBackground);
        }
        else if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          {
            searchBarBackground = self->_searchBarBackground;
            *(_DWORD *)buf = 138412290;
            v36 = searchBarBackground;
            _os_log_fault_impl(&dword_185066000, v27, OS_LOG_TYPE_FAULT, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
          }

        }
        else
        {
          v14 = qword_1ECD7B0B8;
          if (!qword_1ECD7B0B8)
          {
            v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v14, (unint64_t *)&qword_1ECD7B0B8);
          }
          v15 = *(NSObject **)(v14 + 8);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = self->_searchBarBackground;
            *(_DWORD *)buf = 138412290;
            v36 = v16;
            _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
          }
        }
      }
    }
    -[_UISearchBarLayout searchBarBackgroundLayoutFrame](self, "searchBarBackgroundLayoutFrame");
    -[UIView setFrame:](self->_searchBarBackground, "setFrame:");
    v17 = (__int16)self->_searchBarLayoutFlags;
    if ((v17 & 0x80) != 0)
    {
      -[UIView superview](self->_searchBarBackdrop, "superview");
      v18 = (UIView *)objc_claimAutoreleasedReturnValue();
      v19 = self->_searchBarBackground;

      if (v18 != v19)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_185066000, v34, OS_LOG_TYPE_FAULT, "Missing _searchBarBackdrop from search bar hierarchy for layout. This is a UIKit bug.", buf, 2u);
          }

        }
        else
        {
          v24 = qword_1ECD7B0C0;
          if (!qword_1ECD7B0C0)
          {
            v24 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v24, (unint64_t *)&qword_1ECD7B0C0);
          }
          v25 = *(NSObject **)(v24 + 8);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Missing _searchBarBackdrop from search bar hierarchy for layout. This is a UIKit bug.", buf, 2u);
          }
        }
      }
      -[UIView bounds](self->_searchBarBackground, "bounds");
      -[UIView setFrame:](self->_searchBarBackdrop, "setFrame:");
      v17 = (__int16)self->_searchBarLayoutFlags;
    }
    if ((v17 & 0x100) != 0)
    {
      -[UIView superview](self->_separator, "superview");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        if ((dyld_program_sdk_at_least() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy."), self->_separator);
        }
        else if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            separator = self->_separator;
            *(_DWORD *)buf = 138412290;
            v36 = separator;
            _os_log_fault_impl(&dword_185066000, v28, OS_LOG_TYPE_FAULT, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
          }

        }
        else
        {
          v21 = qword_1ECD7B0C8;
          if (!qword_1ECD7B0C8)
          {
            v21 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v21, (unint64_t *)&qword_1ECD7B0C8);
          }
          v22 = *(NSObject **)(v21 + 8);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v23 = self->_separator;
            *(_DWORD *)buf = 138412290;
            v36 = v23;
            _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "Missing or detached view for search bar layout. The application must not remove %@ from the hierarchy. This will become a hard crash in a future release.", buf, 0xCu);
          }
        }
      }
    }
    -[_UISearchBarLayout separatorLayoutFrame](self, "separatorLayoutFrame");
    -[UIView setFrame:](self->_separator, "setFrame:");
    -[_UISearchBarLayout ensureCorrectContainerViewOrdering](self, "ensureCorrectContainerViewOrdering");
    -[_UISearchBarLayout prepareSublayouts](self, "prepareSublayouts");
  }
}

- (CGRect)separatorLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UISearchBarLayoutBase updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  x = self->_separatorLayoutFrame.origin.x;
  y = self->_separatorLayoutFrame.origin.y;
  width = self->_separatorLayoutFrame.size.width;
  height = self->_separatorLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)searchFieldContainerLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UISearchBarLayoutBase updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  x = self->_searchFieldContainerLayoutFrame.origin.x;
  y = self->_searchFieldContainerLayoutFrame.origin.y;
  width = self->_searchFieldContainerLayoutFrame.size.width;
  height = self->_searchFieldContainerLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)searchBarBackgroundLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UISearchBarLayoutBase updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  x = self->_searchBarBackgroundLayoutFrame.origin.x;
  y = self->_searchBarBackgroundLayoutFrame.origin.y;
  width = self->_searchBarBackgroundLayoutFrame.size.width;
  height = self->_searchBarBackgroundLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)scopeBarContainerLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UISearchBarLayoutBase updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  x = self->_scopeBarContainerLayoutFrame.origin.x;
  y = self->_scopeBarContainerLayoutFrame.origin.y;
  width = self->_scopeBarContainerLayoutFrame.size.width;
  height = self->_scopeBarContainerLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)updateLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect *p_searchFieldContainerLayoutFrame;
  __int16 searchBarLayoutFlags;
  double MaxY;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double backgroundExtension;
  CGFloat v33;
  CGFloat MinX;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[_UISearchBarLayoutBase layoutSize](self, "layoutSize");
  v4 = v3;
  v6 = v5;
  if (self->_representedLayoutState == 1)
  {
    p_searchFieldContainerLayoutFrame = &self->_searchFieldContainerLayoutFrame;
    self->_searchFieldContainerLayoutFrame.origin = (CGPoint)*MEMORY[0x1E0C9D538];
  }
  else
  {
    searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
    MaxY = 0.0;
    if ((searchBarLayoutFlags & 0x20) != 0)
    {
      -[_UISearchBarPromptContainerView setBarMetrics:](self->_promptContainer, "setBarMetrics:", -[_UISearchBarLayoutBase barMetrics](self, "barMetrics"));
      -[_UISearchBarLayoutBase contentInset](self, "contentInset");
      -[_UISearchBarPromptContainerView setContentInset:](self->_promptContainer, "setContentInset:", 0.0, v10 + 0.0, 0.0, v11 + 0.0);
      -[UIView frame](self->_promptContainer, "frame");
      v13 = v12;
      v15 = v14;
      -[_UISearchBarLayout naturalPromptContainerHeight](self, "naturalPromptContainerHeight");
      v17 = v16;
      v35.origin.y = 0.0;
      v35.origin.x = v13;
      v35.size.width = v15;
      v35.size.height = v17;
      MaxY = CGRectGetMaxY(v35);
      self->_promptContainerLayoutFrame.origin.x = v13;
      self->_promptContainerLayoutFrame.origin.y = 0.0;
      self->_promptContainerLayoutFrame.size.width = v15;
      self->_promptContainerLayoutFrame.size.height = v17;
    }
    -[UIView frame](self->_searchFieldContainer, "frame");
    x = v36.origin.x;
    y = v36.origin.y;
    width = v36.size.width;
    height = v36.size.height;
    MinX = CGRectGetMinX(v36);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v22 = CGRectGetWidth(v37);
    v23 = v6 - MaxY;
    if ((searchBarLayoutFlags & 0x10) != 0)
    {
      -[_UISearchBarScopeContainerView sizeThatFits:](self->_scopeBarContainer, "sizeThatFits:", v4, v6);
      v24 = v25;
    }
    else
    {
      v24 = 0.0;
    }
    -[_UISearchBarSearchContainerView sizeThatFits:](self->_searchFieldContainer, "sizeThatFits:", v4, v6);
    if (v26 >= v23 - v24)
      v27 = v26;
    else
      v27 = v23 - v24;
    if (((*(_WORD *)&self->_searchBarLayoutFlags & 0x800) != 0
       || !-[_UISearchBarLayoutBase isHostedByNavigationBar](self, "isHostedByNavigationBar"))
      && v23 < v27)
    {
      v27 = v6 - MaxY;
    }
    v28 = 0.0;
    v29 = 0.0;
    v30 = MaxY;
    if ((*(_WORD *)&self->_searchBarLayoutFlags & 0x200) == 0)
    {
      v38.origin.x = x;
      v38.origin.y = MaxY;
      v38.size.width = width;
      v38.size.height = v27;
      v28 = CGRectGetMaxY(v38);
      if (v23 - v27 >= v24)
        v29 = v24;
      else
        v29 = v23 - v27;
      v30 = v28;
    }
    self->_searchFieldContainerLayoutFrame.origin.x = x;
    self->_searchFieldContainerLayoutFrame.origin.y = MaxY;
    self->_searchFieldContainerLayoutFrame.size.width = width;
    self->_searchFieldContainerLayoutFrame.size.height = v27;
    self->_scopeBarContainerLayoutFrame.origin.x = MinX;
    self->_scopeBarContainerLayoutFrame.origin.y = v28;
    self->_scopeBarContainerLayoutFrame.size.width = v22;
    self->_scopeBarContainerLayoutFrame.size.height = v29;
    -[UIView frame](self->_searchBarBackground, "frame");
    v4 = v31;
    backgroundExtension = self->_backgroundExtension;
    v6 = v30 + backgroundExtension;
    p_searchFieldContainerLayoutFrame = &self->_searchBarBackgroundLayoutFrame;
    self->_searchBarBackgroundLayoutFrame.origin.x = v33;
    self->_searchBarBackgroundLayoutFrame.origin.y = -backgroundExtension;
  }
  p_searchFieldContainerLayoutFrame->size.width = v4;
  p_searchFieldContainerLayoutFrame->size.height = v6;
}

- (CGRect)promptContainerLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UISearchBarLayoutBase updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  x = self->_promptContainerLayoutFrame.origin.x;
  y = self->_promptContainerLayoutFrame.origin.y;
  width = self->_promptContainerLayoutFrame.size.width;
  height = self->_promptContainerLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)prepareSublayouts
{
  -[_UISearchBarLayout prepareSearchContainerLayout](self, "prepareSearchContainerLayout");
  -[_UISearchBarLayout prepareScopeContainerLayout](self, "prepareScopeContainerLayout");
}

- (void)ensureCorrectContainerViewOrdering
{
  id v3;

  -[UIView superview](self->_searchFieldContainer, "superview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertSubview:above:", self->_searchFieldContainer, self->_searchBarBackground);
  if ((*(_WORD *)&self->_searchBarLayoutFlags & 0x210) == 0x10)
    objc_msgSend(v3, "insertSubview:above:", self->_scopeBarContainer, self->_searchBarBackground);

}

- (void)setProspective:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_searchBarLayoutFlags = *(_WORD *)&self->_searchBarLayoutFlags & 0xBFFF | v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchContainerLayout, 0);
  objc_storeStrong((id *)&self->_scopeContainerLayout, 0);
  objc_storeStrong((id *)&self->_searchFieldFont, 0);
  objc_storeStrong(&self->_hostedScopeBarTopInsetForBarMetrics, 0);
  objc_storeStrong(&self->_hostedScopeBarHeightForBarMetrics, 0);
  objc_storeStrong((id *)&self->_promptContainer, 0);
  objc_storeStrong((id *)&self->_searchFieldContainer, 0);
  objc_storeStrong((id *)&self->_scopeBarContainer, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_searchBarBackdrop, 0);
  objc_storeStrong((id *)&self->_searchBarBackground, 0);
}

- (void)setDelegateSearchFieldFrameManipulationBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[_UISearchBarLayout setUpSearchContainerLayout](self, "setUpSearchContainerLayout");
  -[_UISearchBarSearchContainerLayout setDelegateSearchFieldFrameForProposedFrame:](self->_searchContainerLayout, "setDelegateSearchFieldFrameForProposedFrame:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  CGSize size;
  CGSize v19;
  CGSize v20;
  CGSize v21;
  CGSize v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_UISearchBarLayout;
  v4 = -[_UISearchBarLayoutBase copyWithZone:](&v24, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 12, self->_searchBarBackground);
    objc_storeStrong(v5 + 13, self->_searchBarBackdrop);
    objc_storeStrong(v5 + 14, self->_separator);
    objc_storeStrong(v5 + 15, self->_scopeBarContainer);
    objc_storeStrong(v5 + 16, self->_searchFieldContainer);
    objc_storeStrong(v5 + 17, self->_promptContainer);
    v6 = -[_UISearchBarSearchContainerLayout copy](self->_searchContainerLayout, "copy");
    v7 = v5[28];
    v5[28] = (id)v6;

    objc_msgSend(v5[28], "setDelegate:", v5);
    v8 = -[_UISearchBarScopeContainerLayout copy](self->_scopeContainerLayout, "copy");
    v9 = v5[27];
    v5[27] = (id)v8;

    objc_msgSend(v5[27], "setDelegate:", v5);
    if ((*(_WORD *)&self->_searchBarLayoutFlags & 0x200) == 0)
      objc_msgSend(v5[27], "setNeighboringSearchLayout:", v5[28]);
    v10 = *(void **)&self->_searchBarLayoutFlags;
    v5[9] = v10;
    *((_WORD *)v5 + 36) = (unsigned __int16)v10 & 0xBFFF;
    *(UIOffset *)(v5 + 29) = self->_searchFieldBackgroundPositionAdjustment;
    v5[19] = *(id *)&self->_searchBarReadableWidth;
    v5[20] = (id)self->_numberOfScopeTitles;
    v11 = *(_OWORD *)&self->_defaultScopeBarInsets.bottom;
    *(_OWORD *)(v5 + 53) = *(_OWORD *)&self->_defaultScopeBarInsets.top;
    *(_OWORD *)(v5 + 55) = v11;
    v12 = objc_msgSend(self->_hostedScopeBarHeightForBarMetrics, "copy");
    v13 = v5[21];
    v5[21] = (id)v12;

    v14 = objc_msgSend(self->_hostedScopeBarTopInsetForBarMetrics, "copy");
    v15 = v5[22];
    v5[22] = (id)v14;

    v5[26] = (id)self->_representedLayoutState;
    v16 = -[UIFont copy](self->_searchFieldFont, "copy");
    v17 = v5[23];
    v5[23] = (id)v16;

    size = self->_promptContainerLayoutFrame.size;
    *(CGPoint *)(v5 + 33) = self->_promptContainerLayoutFrame.origin;
    *(CGSize *)(v5 + 35) = size;
    v19 = self->_searchFieldContainerLayoutFrame.size;
    *(CGPoint *)(v5 + 37) = self->_searchFieldContainerLayoutFrame.origin;
    *(CGSize *)(v5 + 39) = v19;
    v20 = self->_scopeBarContainerLayoutFrame.size;
    *(CGPoint *)(v5 + 41) = self->_scopeBarContainerLayoutFrame.origin;
    *(CGSize *)(v5 + 43) = v20;
    v21 = self->_searchBarBackgroundLayoutFrame.size;
    *(CGPoint *)(v5 + 45) = self->_searchBarBackgroundLayoutFrame.origin;
    *(CGSize *)(v5 + 47) = v21;
    v22 = self->_separatorLayoutFrame.size;
    *(CGPoint *)(v5 + 49) = self->_separatorLayoutFrame.origin;
    *(CGSize *)(v5 + 51) = v22;
  }
  return v5;
}

- (BOOL)hasCancelButton
{
  return *(_WORD *)&self->_searchBarLayoutFlags & 1;
}

- (BOOL)hasDeleteButton
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 1) & 1;
}

- (BOOL)hasLeftButton
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 2) & 1;
}

- (void)setHasFloatingSearchIconBackgroundView:(BOOL)a3
{
  __int16 searchBarLayoutFlags;
  __int16 v4;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if (((((searchBarLayoutFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 8;
    else
      v4 = 0;
    *(_WORD *)&self->_searchBarLayoutFlags = searchBarLayoutFlags & 0xFFF7 | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (BOOL)hasFloatingSearchIconBackgroundView
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 3) & 1;
}

- (BOOL)hasPromptLabel
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 5) & 1;
}

- (BOOL)hasSearchBarBackground
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 6) & 1;
}

- (BOOL)hasSearchBarBackdrop
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 7) & 1;
}

- (BOOL)hasSeparator
{
  return HIBYTE(*(_WORD *)&self->_searchBarLayoutFlags) & 1;
}

- (UIView)cancelButton
{
  return -[_UISearchBarSearchContainerLayout cancelButton](self->_searchContainerLayout, "cancelButton");
}

- (UIView)deleteButton
{
  return -[_UISearchBarSearchContainerLayout deleteButton](self->_searchContainerLayout, "deleteButton");
}

- (UIView)leftButton
{
  return -[_UISearchBarSearchContainerLayout leftButton](self->_searchContainerLayout, "leftButton");
}

- (UIImageView)floatingSearchIconView
{
  return -[_UISearchBarSearchContainerLayout floatingSearchIconView](self->_searchContainerLayout, "floatingSearchIconView");
}

- (void)setFloatingSearchIconBackgroundView:(id)a3
{
  id v4;

  v4 = a3;
  -[_UISearchBarLayout setUpSearchContainerLayout](self, "setUpSearchContainerLayout");
  -[_UISearchBarSearchContainerLayout setFloatingSearchIconBackgroundView:](self->_searchContainerLayout, "setFloatingSearchIconBackgroundView:", v4);

}

- (UIView)floatingSearchIconBackgroundView
{
  return -[_UISearchBarSearchContainerLayout floatingSearchIconBackgroundView](self->_searchContainerLayout, "floatingSearchIconBackgroundView");
}

- (UIBarButtonItem)searchIconBarButtonItem
{
  return -[_UISearchBarSearchContainerLayout searchIconBarButtonItem](self->_searchContainerLayout, "searchIconBarButtonItem");
}

- (UIView)scopeBar
{
  return -[_UISearchBarScopeContainerLayout scopeBar](self->_scopeContainerLayout, "scopeBar");
}

- (BOOL)allowSearchFieldShrinkage
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 11) & 1;
}

- (BOOL)isHostedInlineByNavigationBar
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 9) & 1;
}

- (BOOL)isTextFieldManagedInNSToolbar
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 10) & 1;
}

- (BOOL)searchFieldUsesCustomBackgroundImage
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 12) & 1;
}

- (BOOL)searchFieldEffectivelySupportsDynamicType
{
  return (*(_WORD *)&self->_searchBarLayoutFlags >> 13) & 1;
}

- (void)setHostingNavBarTransitionActive:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_searchBarLayoutFlags = v3 & 0x8000 | *(_WORD *)&self->_searchBarLayoutFlags & 0x7FFF;
}

- (BOOL)isHostingNavBarTransitionActive
{
  return *(_WORD *)&self->_searchBarLayoutFlags >> 15;
}

- (void)setSearchFieldBackgroundPositionAdjustment:(UIOffset)a3
{
  if (a3.horizontal != self->_searchFieldBackgroundPositionAdjustment.horizontal
    || a3.vertical != self->_searchFieldBackgroundPositionAdjustment.vertical)
  {
    self->_searchFieldBackgroundPositionAdjustment = a3;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (double)naturalSearchFieldHeight
{
  double result;

  -[_UISearchBarLayout prepareSearchContainerLayout](self, "prepareSearchContainerLayout");
  -[_UISearchBarSearchContainerLayout naturalSearchFieldHeight](self->_searchContainerLayout, "naturalSearchFieldHeight");
  return result;
}

- (double)defaultInactiveWidth
{
  double result;

  -[_UISearchBarSearchContainerLayout defaultInactiveWidth](self->_searchContainerLayout, "defaultInactiveWidth");
  return result;
}

- (double)defaultActiveWidth
{
  double result;

  -[_UISearchBarSearchContainerLayout defaultActiveWidth](self->_searchContainerLayout, "defaultActiveWidth");
  return result;
}

- (double)overrideInactiveWidth
{
  double result;

  -[_UISearchBarSearchContainerLayout overrideInactiveWidth](self->_searchContainerLayout, "overrideInactiveWidth");
  return result;
}

- (double)overrideActiveWidth
{
  double result;

  -[_UISearchBarSearchContainerLayout overrideActiveWidth](self->_searchContainerLayout, "overrideActiveWidth");
  return result;
}

- (double)prescribedSearchContainerWidth
{
  double result;

  -[_UISearchBarLayout prepareSearchContainerLayout](self, "prepareSearchContainerLayout");
  -[_UISearchBarSearchContainerLayout prescribedWidth](self->_searchContainerLayout, "prescribedWidth");
  return result;
}

- (UIEdgeInsets)scopeContainerSpecificInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[_UISearchBarLayout prepareScopeContainerLayout](self, "prepareScopeContainerLayout");
  -[_UISearchBarScopeContainerLayout containerSpecificInsets](self->_scopeContainerLayout, "containerSpecificInsets");
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)naturalPromptContainerHeight
{
  _UISearchBarPromptContainerView *promptContainer;
  double v3;
  double v4;
  double v5;

  promptContainer = self->_promptContainer;
  -[UIView bounds](promptContainer, "bounds");
  -[_UISearchBarPromptContainerView sizeThatFits:](promptContainer, "sizeThatFits:", v3, v4);
  return v5;
}

- (double)minimumLayoutWidth
{
  double v2;
  double v3;

  -[_UISearchBarLayoutBase contentInset](self, "contentInset");
  return v2 + v3 + 100.0;
}

- (void)applyScopeContainerSublayout
{
  id v3;

  -[_UISearchBarScopeContainerLayout applyLayout](self->_scopeContainerLayout, "applyLayout");
  -[_UISearchBarScopeContainerLayout scopeBar](self->_scopeContainerLayout, "scopeBar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)cleanUpLayout
{
  __int16 searchBarLayoutFlags;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  __int16 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  __int16 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  __int16 v28;
  void *v29;
  double v30;
  __int16 v31;
  void *v32;
  double v33;
  __int16 v34;
  void *v35;
  double v36;
  __int16 v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  -[_UISearchBarSearchContainerLayout cancelButton](self->_searchContainerLayout, "cancelButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((searchBarLayoutFlags & 1) == 0)
  {
    if (!v6)
      goto LABEL_9;
    -[_UISearchBarSearchContainerLayout cancelButton](self->_searchContainerLayout, "cancelButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);
    goto LABEL_8;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarLayout.m"), 618, CFSTR("Missing or detached view for search bar layout cleanup"));

  }
  -[_UISearchBarSearchContainerLayout cancelButton](self->_searchContainerLayout, "cancelButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

  -[_UISearchBarSearchContainerLayout cancelButton](self->_searchContainerLayout, "cancelButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alpha");
  v11 = v10;

  if (v11 < 0.01)
  {
    -[_UISearchBarSearchContainerLayout cancelButton](self->_searchContainerLayout, "cancelButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);
LABEL_8:

  }
LABEL_9:
  v12 = (__int16)self->_searchBarLayoutFlags;
  -[_UISearchBarSearchContainerLayout deleteButton](self->_searchContainerLayout, "deleteButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v12 & 2) == 0)
  {
    if (!v14)
      goto LABEL_17;
    -[_UISearchBarSearchContainerLayout deleteButton](self->_searchContainerLayout, "deleteButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 1);
    goto LABEL_16;
  }
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarLayout.m"), 619, CFSTR("Missing or detached view for search bar layout cleanup"));

  }
  -[_UISearchBarSearchContainerLayout deleteButton](self->_searchContainerLayout, "deleteButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", 0);

  -[_UISearchBarSearchContainerLayout deleteButton](self->_searchContainerLayout, "deleteButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "alpha");
  v19 = v18;

  if (v19 < 0.01)
  {
    -[_UISearchBarSearchContainerLayout deleteButton](self->_searchContainerLayout, "deleteButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 1.0);
LABEL_16:

  }
LABEL_17:
  v20 = (__int16)self->_searchBarLayoutFlags;
  -[_UISearchBarScopeContainerLayout scopeBar](self->_scopeContainerLayout, "scopeBar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "superview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v20 & 0x10) == 0)
  {
    if (!v22)
      goto LABEL_25;
    -[_UISearchBarScopeContainerLayout scopeBar](self->_scopeContainerLayout, "scopeBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", 1);
    goto LABEL_24;
  }
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarLayout.m"), 620, CFSTR("Missing or detached view for search bar layout cleanup"));

  }
  -[_UISearchBarScopeContainerLayout scopeBar](self->_scopeContainerLayout, "scopeBar");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHidden:", 0);

  -[_UISearchBarScopeContainerLayout scopeBar](self->_scopeContainerLayout, "scopeBar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "alpha");
  v27 = v26;

  if (v27 < 0.01)
  {
    -[_UISearchBarScopeContainerLayout scopeBar](self->_scopeContainerLayout, "scopeBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAlpha:", 1.0);
LABEL_24:

  }
LABEL_25:
  v28 = (__int16)self->_searchBarLayoutFlags;
  -[UIView superview](self->_promptContainer, "superview");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v28 & 0x20) != 0)
  {
    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarLayout.m"), 621, CFSTR("Missing or detached view for search bar layout cleanup"));

    }
    -[UIView setHidden:](self->_promptContainer, "setHidden:", 0);
    -[UIView alpha](self->_promptContainer, "alpha");
    if (v30 < 0.01)
      -[UIView setAlpha:](self->_promptContainer, "setAlpha:", 1.0);
  }
  else if (v29)
  {
    -[UIView setHidden:](self->_promptContainer, "setHidden:", 1);
  }
  v31 = (__int16)self->_searchBarLayoutFlags;
  -[UIView superview](self->_searchBarBackground, "superview");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v31 & 0x40) != 0)
  {
    if (!v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarLayout.m"), 622, CFSTR("Missing or detached view for search bar layout cleanup"));

    }
    -[UIView setHidden:](self->_searchBarBackground, "setHidden:", 0);
    -[UIView alpha](self->_searchBarBackground, "alpha");
    if (v33 < 0.01)
      -[UIView setAlpha:](self->_searchBarBackground, "setAlpha:", 1.0);
  }
  else if (v32)
  {
    -[UIView setHidden:](self->_searchBarBackground, "setHidden:", 1);
  }
  v34 = (__int16)self->_searchBarLayoutFlags;
  -[UIView superview](self->_searchBarBackdrop, "superview");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v34 & 0x80) != 0)
  {
    if (!v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarLayout.m"), 623, CFSTR("Missing or detached view for search bar layout cleanup"));

    }
    -[UIView setHidden:](self->_searchBarBackdrop, "setHidden:", 0);
    -[UIView alpha](self->_searchBarBackdrop, "alpha");
    if (v36 < 0.01)
      -[UIView setAlpha:](self->_searchBarBackdrop, "setAlpha:", 1.0);
  }
  else if (v35)
  {
    -[UIView setHidden:](self->_searchBarBackdrop, "setHidden:", 1);
  }
  v37 = (__int16)self->_searchBarLayoutFlags;
  -[UIView superview](self->_separator, "superview");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v37 & 0x100) != 0)
  {
    if (!v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarLayout.m"), 624, CFSTR("Missing or detached view for search bar layout cleanup"));

    }
    -[UIView setHidden:](self->_separator, "setHidden:", 0);
    -[UIView alpha](self->_separator, "alpha");
    if (v39 < 0.01)
      -[UIView setAlpha:](self->_separator, "setAlpha:", 1.0);
  }
  else if (v38)
  {
    -[UIView setHidden:](self->_separator, "setHidden:", 1);
  }
}

- (NSString)description
{
  void *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  double minimum;
  double maximum;
  uint64_t v10;
  __int16 searchBarLayoutFlags;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_UISearchBarLayout;
  -[_UISearchBarLayoutBase description](&v24, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return (NSString *)v3;
  _UISearchBarLayoutStateDebugDescription(self->_representedLayoutState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISearchBarLayout naturalTotalHeight](self, "naturalTotalHeight");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@ naturalHeight=%g"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  minimum = self->_heightRange.minimum;
  maximum = self->_heightRange.maximum;
  if (minimum != maximum)
  {
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" (min=%g, max=%g)"), *(_QWORD *)&self->_heightRange.minimum, *(_QWORD *)&maximum);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  searchBarLayoutFlags = (__int16)self->_searchBarLayoutFlags;
  if ((searchBarLayoutFlags & 0x20) != 0)
  {
    -[_UISearchBarLayout naturalPromptContainerHeight](self, "naturalPromptContainerHeight", minimum);
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" naturalPromptContainerHeight=%g"), v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (__int16)self->_searchBarLayoutFlags;
    v7 = (void *)v14;
  }
  else
  {
    v12 = (__int16)self->_searchBarLayoutFlags;
  }
  if ((v12 & 0x200) != 0)
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(" inline"), minimum);
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v15;
  }
  if (self->_searchContainerLayout)
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" searchContainerLayout=%p"), minimum, self->_searchContainerLayout);
  else
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(" MISSING searchContainerLayout"), minimum);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_scopeContainerLayout)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" scopeContainerLayout=%p"), self->_scopeContainerLayout);
    v16 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v16;
  }
  if ((searchBarLayoutFlags & 0x20) != 0)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" promptContainer=%p"), self->_promptContainer);
    v17 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v17;
  }
  if (!-[_UISearchBarLayoutBase isLayoutValid](self, "isLayoutValid"))
    return (NSString *)v3;
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(" layoutFrames:"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((searchBarLayoutFlags & 0x20) != 0)
  {
    objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(" promptContainer=(%g, %g; %g, %g)"),
      *(_QWORD *)&self->_promptContainerLayoutFrame.origin.x,
      *(_QWORD *)&self->_promptContainerLayoutFrame.origin.y,
      *(_QWORD *)&self->_promptContainerLayoutFrame.size.width,
      *(_QWORD *)&self->_promptContainerLayoutFrame.size.height);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(" searchContainer=(%g, %g; %g, %g)"),
    *(_QWORD *)&self->_searchFieldContainerLayoutFrame.origin.x,
    *(_QWORD *)&self->_searchFieldContainerLayoutFrame.origin.y,
    *(_QWORD *)&self->_searchFieldContainerLayoutFrame.size.width,
    *(_QWORD *)&self->_searchFieldContainerLayoutFrame.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (__int16)self->_searchBarLayoutFlags;
  if ((v20 & 0x210) == 0x10)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" scopeContainer=(%g, %g; %g, %g)"),
      *(_QWORD *)&self->_scopeBarContainerLayoutFrame.origin.x,
      *(_QWORD *)&self->_scopeBarContainerLayoutFrame.origin.y,
      *(_QWORD *)&self->_scopeBarContainerLayoutFrame.size.width,
      *(_QWORD *)&self->_scopeBarContainerLayoutFrame.size.height);
    v21 = objc_claimAutoreleasedReturnValue();

    v20 = (__int16)self->_searchBarLayoutFlags;
    v3 = (void *)v21;
    if ((v20 & 0x40) == 0)
    {
LABEL_22:
      if ((v20 & 0x100) != 0)
        goto LABEL_26;
      return (NSString *)v3;
    }
  }
  else if ((v20 & 0x40) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" searchBarBackground=(%g, %g; %g, %g)"),
    *(_QWORD *)&self->_searchBarBackgroundLayoutFrame.origin.x,
    *(_QWORD *)&self->_searchBarBackgroundLayoutFrame.origin.y,
    *(_QWORD *)&self->_searchBarBackgroundLayoutFrame.size.width,
    *(_QWORD *)&self->_searchBarBackgroundLayoutFrame.size.height);
  v22 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)v22;
  if ((*(_WORD *)&self->_searchBarLayoutFlags & 0x100) == 0)
    return (NSString *)v3;
LABEL_26:
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" separator=(%g, %g; %g, %g)"),
    *(_QWORD *)&self->_separatorLayoutFrame.origin.x,
    *(_QWORD *)&self->_separatorLayoutFrame.origin.y,
    *(_QWORD *)&self->_separatorLayoutFrame.size.width,
    *(_QWORD *)&self->_separatorLayoutFrame.size.height);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v23;
}

- (void)setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:(id)a3
{
  id v4;

  v4 = a3;
  -[_UISearchBarLayout setUpSearchContainerLayout](self, "setUpSearchContainerLayout");
  -[_UISearchBarSearchContainerLayout setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:](self->_searchContainerLayout, "setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:", v4);

}

- (void)setAdditionalPaddingForCancelButtonAtLeadingEdge:(double)a3
{
  -[_UISearchBarLayout setUpSearchContainerLayout](self, "setUpSearchContainerLayout");
  -[_UISearchBarSearchContainerLayout setAdditionalPaddingForCancelButtonAtLeadingEdge:](self->_searchContainerLayout, "setAdditionalPaddingForCancelButtonAtLeadingEdge:", a3);
}

- (double)additionalPaddingForCancelButtonAtLeadingEdge
{
  double result;

  -[_UISearchBarSearchContainerLayout additionalPaddingForCancelButtonAtLeadingEdge](self->_searchContainerLayout, "additionalPaddingForCancelButtonAtLeadingEdge");
  return result;
}

- (void)setAdditionalPaddingForSearchFieldAtLeadingEdge:(double)a3
{
  -[_UISearchBarLayout setUpSearchContainerLayout](self, "setUpSearchContainerLayout");
  -[_UISearchBarSearchContainerLayout setAdditionalPaddingForSearchFieldAtLeadingEdge:](self->_searchContainerLayout, "setAdditionalPaddingForSearchFieldAtLeadingEdge:", a3);
}

- (double)additionalPaddingForSearchFieldAtLeadingEdge
{
  double result;

  -[_UISearchBarSearchContainerLayout additionalPaddingForSearchFieldAtLeadingEdge](self->_searchContainerLayout, "additionalPaddingForSearchFieldAtLeadingEdge");
  return result;
}

- (UIView)searchBarBackground
{
  return self->_searchBarBackground;
}

- (UIView)searchBarBackdrop
{
  return self->_searchBarBackdrop;
}

- (UIView)separator
{
  return self->_separator;
}

- (_UISearchBarScopeContainerView)scopeBarContainer
{
  return self->_scopeBarContainer;
}

- (_UISearchBarSearchContainerView)searchFieldContainer
{
  return self->_searchFieldContainer;
}

- (_UISearchBarPromptContainerView)promptContainer
{
  return self->_promptContainer;
}

- (double)backgroundExtension
{
  return self->_backgroundExtension;
}

- (UIOffset)searchFieldBackgroundPositionAdjustment
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_searchFieldBackgroundPositionAdjustment.horizontal;
  vertical = self->_searchFieldBackgroundPositionAdjustment.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (double)searchBarReadableWidth
{
  return self->_searchBarReadableWidth;
}

- (unint64_t)numberOfScopeTitles
{
  return self->_numberOfScopeTitles;
}

- (UIEdgeInsets)defaultScopeBarInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_defaultScopeBarInsets.top;
  left = self->_defaultScopeBarInsets.left;
  bottom = self->_defaultScopeBarInsets.bottom;
  right = self->_defaultScopeBarInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)hostedScopeBarHeightForBarMetrics
{
  return self->_hostedScopeBarHeightForBarMetrics;
}

- (id)hostedScopeBarTopInsetForBarMetrics
{
  return self->_hostedScopeBarTopInsetForBarMetrics;
}

- (UIFont)searchFieldFont
{
  return self->_searchFieldFont;
}

- (void)setLeftContentInsetForInlineSearch:(double)a3
{
  self->_leftContentInsetForInlineSearch = a3;
}

- (void)setRightContentInsetForInlineSearch:(double)a3
{
  self->_rightContentInsetForInlineSearch = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)heightRange
{
  double minimum;
  double maximum;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  minimum = self->_heightRange.minimum;
  maximum = self->_heightRange.maximum;
  result.var1 = maximum;
  result.var0 = minimum;
  return result;
}

- (_UISearchBarScopeContainerLayout)scopeContainerLayout
{
  return self->_scopeContainerLayout;
}

- (void)setScopeContainerLayout:(id)a3
{
  objc_storeStrong((id *)&self->_scopeContainerLayout, a3);
}

- (_UISearchBarSearchContainerLayout)searchContainerLayout
{
  return self->_searchContainerLayout;
}

- (void)setSearchContainerLayout:(id)a3
{
  objc_storeStrong((id *)&self->_searchContainerLayout, a3);
}

@end
