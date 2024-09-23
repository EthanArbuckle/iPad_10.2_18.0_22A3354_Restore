@implementation UISearchBar

- (BOOL)isFirstResponder
{
  void *v2;
  char v3;

  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

+ (void)_initializeForIdiom:(int64_t)a3
{
  id v5;
  void *v6;
  id v7;

  if ((_initializeForIdiom__didInitializeForCarPlay & 1) == 0)
  {
    v5 = (id)objc_opt_class();
    if (a3 == 3 && v5 == a1)
    {
      _initializeForIdiom__didInitializeForCarPlay = 1;
      +[UITraitCollection traitCollectionWithUserInterfaceIdiom:](UITraitCollection, "traitCollectionWithUserInterfaceIdiom:", 3);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      +[UIView appearanceForTraitCollection:](UISearchBarTextField, "appearanceForTraitCollection:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBorderStyle:", 3);

    }
  }
}

- (void)didMoveToWindow
{
  void *v3;
  id v4;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UISearchBarVisualProviderBase searchDisplayController](self->_visualProvider, "searchDisplayController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateSearchBarMaskIfNecessary");

  }
}

- (void)_updateNavigationBarLayoutInsertDataForSearchBar:(id)a3 collapsibleScopeBar:(id)a4 forLayoutState:(int64_t)a5
{
  -[_UISearchBarVisualProviderBase updateNavigationBarLayoutInsertDataForSearchBar:collapsibleScopeBar:forLayoutState:](self->_visualProvider, "updateNavigationBarLayoutInsertDataForSearchBar:collapsibleScopeBar:forLayoutState:", a3, a4, a5);
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchBar;
  -[UIView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  if (-[_UISearchBarVisualProviderBase alwaysUsesLayoutMarginsForHorizontalContentInset](self->_visualProvider, "alwaysUsesLayoutMarginsForHorizontalContentInset")|| -[UISearchBar _containedInNavigationPalette](self, "_containedInNavigationPalette"))
  {
    -[UISearchBar _updateEffectiveContentInset](self, "_updateEffectiveContentInset");
  }
}

- (UISearchBar)initWithFrame:(CGRect)frame
{
  UISearchBar *v3;
  UISearchBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISearchBar;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v4 = v3;
  if (v3)
  {
    -[UISearchBar _commonInit](v3, "_commonInit");
    -[UISearchBar setNeedsLayout](v4, "setNeedsLayout");
  }
  return v4;
}

- (void)setNeedsLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchBar;
  -[UIView setNeedsLayout](&v3, sel_setNeedsLayout);
  -[_UISearchBarVisualProviderBase invalidateLayout](self->_visualProvider, "invalidateLayout");
}

- (UISearchController)_searchController
{
  return self->__searchController;
}

- (BOOL)_effectivelySupportsDynamicType
{
  return dyld_program_sdk_at_least();
}

- (int64_t)_expectedInterfaceOrientation
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  UISearchController *searchController;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  searchController = self->__searchController;
  if (!searchController)
  {
    v3 = 0;
LABEL_9:
    v5 = 1;
    goto LABEL_10;
  }
  -[UIViewController _window](searchController, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_9;
LABEL_2:
  v4 = objc_msgSend(v3, "_windowInterfaceOrientation");
  if (!v4)
    v4 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v3);
  v5 = v4;
LABEL_10:

  return v5;
}

- (int64_t)_barPosition
{
  return -[_UISearchBarVisualProviderBase barPosition](self->_visualProvider, "barPosition");
}

- (void)setTintColor:(UIColor *)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchBar;
  -[UIView setTintColor:](&v3, sel_setTintColor_, tintColor);
}

- (void)traitCollectionDidChange:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UISearchBar;
  -[UIView traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[UIView traitCollection](self, "traitCollection");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
  {

  }
  else
  {
    v8 = -[UISearchBar _effectivelySupportsDynamicType](self, "_effectivelySupportsDynamicType");

    if (v8)
    {
      -[_UISearchBarVisualProviderBase updateForDynamicType](self->_visualProvider, "updateForDynamicType");
      -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
  }
  if (v4)
  {
    _UIRecordTraitUsage((unint64_t)v4, 0x13uLL);
    v9 = v4[16];
    if (v5)
    {
LABEL_7:
      _UIRecordTraitUsage((unint64_t)v5, 0x13uLL);
      v10 = v5[16];
      goto LABEL_8;
    }
  }
  else
  {
    v9 = 0;
    if (v5)
      goto LABEL_7;
  }
  v10 = 0;
LABEL_8:
  if (v9 != v10)
    -[_UISearchBarVisualProviderBase updateForSemanticContext](self->_visualProvider, "updateForSemanticContext");

}

- (BOOL)showsSearchResultsButton
{
  return -[_UISearchBarVisualProviderBase showsSearchResultsButton](self->_visualProvider, "showsSearchResultsButton");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[_UISearchBarVisualProviderBase sizeThatFits:](self->_visualProvider, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)textInputTraits
{
  UITextInputTraits *textInputTraits;
  UITextInputTraits *v4;
  UITextInputTraits *v5;

  textInputTraits = self->_textInputTraits;
  if (!textInputTraits)
  {
    v4 = objc_alloc_init(UITextInputTraits);
    v5 = self->_textInputTraits;
    self->_textInputTraits = v4;

    -[UITextInputTraits setIsSingleLineDocument:](self->_textInputTraits, "setIsSingleLineDocument:", 1);
    textInputTraits = self->_textInputTraits;
  }
  return textInputTraits;
}

- (BOOL)_isHostedInlineByNavigationBar
{
  return -[_UISearchBarVisualProviderBase isHostedInlineByNavigationBar](self->_visualProvider, "isHostedInlineByNavigationBar");
}

- (BOOL)centerPlaceholder
{
  return -[_UISearchBarVisualProviderBase centerPlaceholder](self->_visualProvider, "centerPlaceholder");
}

- (UISearchBarTextField)_searchBarTextField
{
  void *v3;
  UIScribbleInteraction *v4;

  -[_UISearchBarVisualProviderBase searchField](self->_visualProvider, "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_didAddScribbleInteraction)
  {
    self->_didAddScribbleInteraction = 1;
    v4 = -[UIScribbleInteraction initWithDelegate:]([UIScribbleInteraction alloc], "initWithDelegate:", self);
    -[UIScribbleInteraction _setDefaultSystemInteraction:](v4, "_setDefaultSystemInteraction:", 1);
    objc_msgSend(v3, "addInteraction:", v4);

  }
  return (UISearchBarTextField *)v3;
}

- (UIView)_viewStackedInNavigationBar
{
  return -[_UISearchBarVisualProviderBase viewStackedInNavigationBar](self->_visualProvider, "viewStackedInNavigationBar");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[_UISearchBarVisualProviderBase isFrozenForDismissalCrossfade](self->_visualProvider, "isFrozenForDismissalCrossfade"))
  {
    -[UIView bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v12.receiver = self;
    v12.super_class = (Class)UISearchBar;
    -[UIView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    -[_UISearchBarVisualProviderBase updateIfNecessaryForOldSize:](self->_visualProvider, "updateIfNecessaryForOldSize:", v9, v11);
  }
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISearchBar;
  -[UIView _didChangeFromIdiom:onScreen:traverseHierarchy:](&v6, sel__didChangeFromIdiom_onScreen_traverseHierarchy_, a3, a4, a5);
  -[_UISearchBarVisualProviderBase updatePlaceholderColor](self->_visualProvider, "updatePlaceholderColor");
  -[_UISearchBarVisualProviderBase updateDictationButton](self->_visualProvider, "updateDictationButton");
  -[_UISearchBarVisualProviderBase updateRightView](self->_visualProvider, "updateRightView");
  -[_UISearchBarVisualProviderBase updateMagnifyingGlassView](self->_visualProvider, "updateMagnifyingGlassView");
  -[_UISearchBarVisualProviderBase applySearchBarStyle](self->_visualProvider, "applySearchBarStyle");
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISearchBar;
  if (-[UISearchBar respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[UISearchBar textInputTraits](self, "textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (Class)_classForSearchTextField
{
  void *classForSearchTextField;

  classForSearchTextField = self->_classForSearchTextField;
  if (!classForSearchTextField)
    classForSearchTextField = (void *)objc_opt_class();
  return (Class)classForSearchTextField;
}

- (id)_colorForComponent:(unint64_t)a3 disabled:(BOOL)a4
{
  return -[_UISearchBarVisualProviderBase colorForComponent:disabled:](self->_visualProvider, "colorForComponent:disabled:", a3, a4);
}

- (UIBarButtonItem)_existingSearchIconBarButtonItem
{
  return -[_UISearchBarVisualProviderBase existingSearchIconBarButtonItem](self->_visualProvider, "existingSearchIconBarButtonItem");
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  id v8;
  UISearchBar *v9;
  UISearchBar *v10;
  UISearchBar *v11;
  objc_super v12;

  v8 = a5;
  v9 = (UISearchBar *)a3;
  -[UISearchBar _viewForChildViews](self, "_viewForChildViews");
  v10 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 == self || v10 == v9)
  {
    v12.receiver = self;
    v12.super_class = (Class)UISearchBar;
    -[UIView _addSubview:positioned:relativeTo:](&v12, sel__addSubview_positioned_relativeTo_, v9, a4, v8);
  }
  else
  {
    -[UISearchBar _addSubview:positioned:relativeTo:](v10, "_addSubview:positioned:relativeTo:", v9, a4, v8);
  }

}

- (id)_viewForChildViews
{
  void *v3;
  void *v4;
  id v5;

  -[_UISearchBarVisualProviderBase searchBarClippingView](self->_visualProvider, "searchBarClippingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = v3;

  return v5;
}

- (void)_updateEffectiveContentInset
{
  -[_UISearchBarVisualProviderBase updateEffectiveContentInset](self->_visualProvider, "updateEffectiveContentInset");
}

- (void)setPlaceholder:(NSString *)placeholder
{
  NSString *v4;
  id v5;

  v4 = placeholder;
  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholder:", v4);

}

- (void)_setSearchController:(id)a3
{
  UISearchController *searchController;
  unint64_t v5;
  int v6;
  _BOOL8 v7;
  UISearchController *v8;

  v8 = (UISearchController *)a3;
  if (!v8 && self->__searchController && -[UISearchBar _isHostedByNavigationBar](self, "_isHostedByNavigationBar"))
    -[UIView removeFromSuperview](self, "removeFromSuperview");
  self->__searchController = v8;
  if (!-[UISearchBar _usesLegacyVisualProvider](self, "_usesLegacyVisualProvider"))
    -[_UISearchBarVisualProviderBase resetLayoutState](self->_visualProvider, "resetLayoutState");
  searchController = self->__searchController;
  if (searchController)
  {
    v5 = ((unint64_t)searchController->_controllerFlags >> 5) & 3;
    if (!(_DWORD)v5)
    {
      v6 = dyld_program_sdk_at_least();
      v5 = 2;
      if (!v6)
        v5 = 3;
    }
    v7 = v5 == 2;
  }
  else
  {
    v7 = 0;
  }
  -[_UISearchBarVisualProviderBase setActiveSearchDeferringScopeBar:](self->_visualProvider, "setActiveSearchDeferringScopeBar:", v7);

}

- (void)_setAutoDisableCancelButton:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setAutoDisableCancelButton:](self->_visualProvider, "setAutoDisableCancelButton:", a3);
}

- (void)setDelegate:(id)delegate
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  char v8;
  id v9;
  _UISearchBarVisualProviderBase *visualProvider;
  _QWORD v11[4];
  id v12;
  id v13;
  id from;
  id to;
  id location;

  objc_initWeak(&location, delegate);
  if (-[UISearchBar _usesLegacyVisualProvider](self, "_usesLegacyVisualProvider"))
  {
    v4 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&self->_delegate, v4);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    v7 = objc_loadWeakRetained(&location);
    v8 = objc_opt_respondsToSelector();

    v9 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&self->_delegate, v9);

    if ((v8 & 1) != 0)
    {
      objc_copyWeak(&to, &location);
      objc_initWeak(&from, self);
      visualProvider = self->_visualProvider;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __27__UISearchBar_setDelegate___block_invoke;
      v11[3] = &unk_1E16B67A0;
      objc_copyWeak(&v12, &to);
      objc_copyWeak(&v13, &from);
      -[_UISearchBarVisualProviderBase setDelegateSearchFieldFrameManipulationBlock:](visualProvider, "setDelegateSearchFieldFrameManipulationBlock:", v11);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&from);
      objc_destroyWeak(&to);
    }
    else if ((v6 & 1) != 0)
    {
      -[_UISearchBarVisualProviderBase setDelegateSearchFieldFrameManipulationBlock:](self->_visualProvider, "setDelegateSearchFieldFrameManipulationBlock:", 0);
    }
  }
  objc_destroyWeak(&location);
}

- (BOOL)_usesLegacyVisualProvider
{
  int v3;

  v3 = -[_UISearchBarVisualProviderBase visualProviderType](self->_visualProvider, "visualProviderType");
  if (v3 != 1)
    LOBYTE(v3) = -[_UISearchBarVisualProviderBase visualProviderType](self->_visualProvider, "visualProviderType") == 3;
  return v3;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", a3))
  {
    -[UISearchBar textInputTraits](self, "textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UISearchBar;
    -[UISearchBar forwardingTargetForSelector:](&v7, sel_forwardingTargetForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)setSearchBarStyle:(UISearchBarStyle)searchBarStyle
{
  -[_UISearchBarVisualProviderBase setSearchBarStyle:](self->_visualProvider, "setSearchBarStyle:", searchBarStyle);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classForSearchTextField, 0);
  objc_destroyWeak((id *)&self->_searchFieldContainerLayoutCustomizationDelegate);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_cancelKeyCommand, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_tapToActivateGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTranslucent:(BOOL)translucent
{
  uint64_t v3;

  if (translucent)
    v3 = 1;
  else
    v3 = 2;
  -[_UISearchBarVisualProviderBase setBarTranslucence:](self->_visualProvider, "setBarTranslucence:", v3);
}

- (BOOL)showsCancelButton
{
  return -[_UISearchBarVisualProviderBase showsCancelButton](self->_visualProvider, "showsCancelButton");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchBar;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UISearchBarVisualProviderBase layoutSubviews](self->_visualProvider, "layoutSubviews");
}

- (void)_setHostedInlineByNavigationBar:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  UISearchController *v9;
  NSObject *v10;
  UISearchController *searchController;
  int v12;
  UISearchBar *v13;
  __int16 v14;
  UISearchController *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (a3 && !-[UISearchBar _isHostedByNavigationBar](self, "_isHostedByNavigationBar"))
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        searchController = self->__searchController;
        v12 = 138412546;
        v13 = self;
        v14 = 2112;
        v15 = searchController;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Inline hosting of search bar ignored because navigation bar hosting is not enabled. This is a UIKit bug. search bar: %@, searchController: %@", (uint8_t *)&v12, 0x16u);
      }

    }
    else
    {
      v7 = _setHostedInlineByNavigationBar____s_category;
      if (!_setHostedInlineByNavigationBar____s_category)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&_setHostedInlineByNavigationBar____s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = self->__searchController;
        v12 = 138412546;
        v13 = self;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Inline hosting of search bar ignored because navigation bar hosting is not enabled. This is a UIKit bug. search bar: %@, searchController: %@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  v5 = -[_UISearchBarVisualProviderBase isHostedInlineByNavigationBar](self->_visualProvider, "isHostedInlineByNavigationBar");
  v6 = -[UISearchBar _isHostedByNavigationBar](self, "_isHostedByNavigationBar") & v3;
  -[_UISearchBarVisualProviderBase setHostedInlineByNavigationBar:](self->_visualProvider, "setHostedInlineByNavigationBar:", v6);
  if (v5 != (_DWORD)v6)
  {
    -[UISearchController _updateHasPendingSuggestionMenuRefreshFlagForReason:](self->__searchController, "_updateHasPendingSuggestionMenuRefreshFlagForReason:", v6 ^ 1);
    -[UISearchController _updateSearchSuggestionsListVisibility](self->__searchController, "_updateSearchSuggestionsListVisibility");
  }
}

- (BOOL)_isHostedByNavigationBar
{
  return -[_UISearchBarVisualProviderBase isHostedByNavigationBar](self->_visualProvider, "isHostedByNavigationBar");
}

- (void)_setBackdropStyle:(int64_t)a3
{
  -[_UISearchBarVisualProviderBase setBackdropStyle:](self->_visualProvider, "setBackdropStyle:", a3);
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UISearchBar;
  -[UIView _didMoveFromWindow:toWindow:](&v10, sel__didMoveFromWindow_toWindow_, v6, v7);
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UISearchBar _setBarPosition:](self, "_setBarPosition:", objc_msgSend(WeakRetained, "positionForBar:", self));
    if (-[_UISearchBarVisualProviderBase backgroundLayoutNeedsUpdate](self->_visualProvider, "backgroundLayoutNeedsUpdate"))
    {
      -[UISearchBar setNeedsLayout](self, "setNeedsLayout");
    }
    -[UISearchBar _identifyBarContainer](self, "_identifyBarContainer");
    -[_UISearchBarVisualProviderBase updateScopeBarBackground](self->_visualProvider, "updateScopeBarBackground");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

  }
  if (v7 != v6)
  {
    -[_UISearchBarVisualProviderBase searchDisplayController](self->_visualProvider, "searchDisplayController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_updateSearchBarMaskIfNecessary");

  }
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  void *v5;

  -[UISearchBar _identifyBarContainer](self, "_identifyBarContainer");
  if (-[_UISearchBarVisualProviderBase isInNavigationPalette](self->_visualProvider, "isInNavigationPalette")
    || -[_UISearchBarVisualProviderBase isHostedByNavigationBar](self->_visualProvider, "isHostedByNavigationBar"))
  {
    if (-[_UISearchBarVisualProviderBase isInNavigationPalette](self->_visualProvider, "isInNavigationPalette"))
      -[_UISearchBarVisualProviderBase updateForDrawsBackgroundInPalette](self->_visualProvider, "updateForDrawsBackgroundInPalette");
    -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setAnimatesBackgroundCornerRadius:", 1);

    if (UISearchBarUsesModernAppearance())
      -[UIView setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 1);
    -[UISearchBar _setMaskActive:](self, "_setMaskActive:", 0);
  }
  else
  {
    -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setAnimatesBackgroundCornerRadius:", 0);

  }
  -[UISearchBar _updateEffectiveContentInset](self, "_updateEffectiveContentInset");
  -[_UISearchBarVisualProviderBase updateScopeBarBackground](self->_visualProvider, "updateScopeBarBackground");
  -[_UISearchBarVisualProviderBase searchDisplayController](self->_visualProvider, "searchDisplayController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_searchBarSuperviewChanged");

  -[UISearchController _searchBarSuperviewChanged](self->__searchController, "_searchBarSuperviewChanged");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_identifyBarContainer
{
  _BOOL4 v3;
  _UISearchBarVisualProviderBase *visualProvider;
  BOOL v5;
  BOOL v6;
  _BOOL8 v7;
  _BOOL8 v8;

  v3 = -[_UISearchBarVisualProviderBase isHostedByNavigationBar](self->_visualProvider, "isHostedByNavigationBar");
  visualProvider = self->_visualProvider;
  if (v3)
  {
    -[_UISearchBarVisualProviderBase setInNavigationPalette:](visualProvider, "setInNavigationPalette:", 0);
    -[_UISearchBarVisualProviderBase setPlacedInNavigationBar:](self->_visualProvider, "setPlacedInNavigationBar:", 0);
    -[_UISearchBarVisualProviderBase setPlacedInToolbar:](self->_visualProvider, "setPlacedInToolbar:", 0);
  }
  else
  {
    v5 = -[_UISearchBarVisualProviderBase isPlacedInNavigationBar](visualProvider, "isPlacedInNavigationBar");
    v6 = -[_UISearchBarVisualProviderBase isPlacedInToolbar](self->_visualProvider, "isPlacedInToolbar");
    objc_opt_class();
    -[_UISearchBarVisualProviderBase setInNavigationPalette:](self->_visualProvider, "setInNavigationPalette:", _containedInViewOfClass(self));
    if (-[_UISearchBarVisualProviderBase isInNavigationPalette](self->_visualProvider, "isInNavigationPalette"))
    {
      v7 = 0;
    }
    else
    {
      objc_opt_class();
      v7 = _containedInViewOfClass(self);
    }
    -[_UISearchBarVisualProviderBase setPlacedInNavigationBar:](self->_visualProvider, "setPlacedInNavigationBar:", v7);
    if (-[_UISearchBarVisualProviderBase isInNavigationPalette](self->_visualProvider, "isInNavigationPalette")
      || -[_UISearchBarVisualProviderBase isPlacedInNavigationBar](self->_visualProvider, "isPlacedInNavigationBar"))
    {
      v8 = 0;
    }
    else
    {
      objc_opt_class();
      v8 = _containedInViewOfClass(self);
    }
    -[_UISearchBarVisualProviderBase setPlacedInToolbar:](self->_visualProvider, "setPlacedInToolbar:", v8);
    if (!v5
      && -[_UISearchBarVisualProviderBase isPlacedInNavigationBar](self->_visualProvider, "isPlacedInNavigationBar")
      || !v6 && -[_UISearchBarVisualProviderBase isPlacedInToolbar](self->_visualProvider, "isPlacedInToolbar"))
    {
      -[UISearchBar setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)_resetIfNecessaryForNavigationBarHosting:(BOOL)a3
{
  _BOOL8 v3;
  UISearchController *searchController;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;

  v3 = a3;
  if (-[_UISearchBarVisualProviderBase isHostedByNavigationBar](self->_visualProvider, "isHostedByNavigationBar") != a3)
  {
    -[UISearchBar _setReliesOnNavigationBarBackdrop:](self, "_setReliesOnNavigationBarBackdrop:", v3);
    -[UISearchBar _setHostedByNavigationBar:](self, "_setHostedByNavigationBar:", v3);
    if (v3)
    {
      searchController = self->__searchController;
      if (searchController
        && -[UISearchController hidesNavigationBarDuringPresentation](searchController, "hidesNavigationBarDuringPresentation"))
      {
        if (-[UISearchController isActive](self->__searchController, "isActive"))
          v6 = 3;
        else
          v6 = 2;
      }
      else
      {
        v6 = 2;
      }
      -[UISearchBar _setBarPosition:](self, "_setBarPosition:", v6);
      v8 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_SearchBarUsesAutomaticBackdropStyle, (uint64_t)CFSTR("SearchBarUsesAutomaticBackdropStyle"));
      if (byte_1ECD75E6C)
        v9 = 1;
      else
        v9 = v8;
      if (v9)
        v7 = 2005;
      else
        v7 = 2010;
    }
    else
    {
      -[UISearchBar _setHostedInlineByNavigationBar:](self, "_setHostedInlineByNavigationBar:", 0);
      -[UISearchBar _setBarPosition:](self, "_setBarPosition:", 2);
      v7 = 0;
    }
    -[UISearchBar _setBackdropStyle:](self, "_setBackdropStyle:", v7);
  }
}

- (void)_setBarPosition:(int64_t)a3
{
  -[_UISearchBarVisualProviderBase setBarPosition:](self->_visualProvider, "setBarPosition:", a3);
}

- (void)willMoveToSuperview:(id)a3
{
  void *v5;

  -[_UISearchBarVisualProviderBase searchDisplayController](self->_visualProvider, "searchDisplayController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_searchBarSuperviewWillChange");

  if (a3)
  {
    if (self->__transplanting)
      self->__transplanting = 0;
  }
}

- (void)_setReliesOnNavigationBarBackdrop:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setReliesOnNavigationBarBackdrop:](self->_visualProvider, "setReliesOnNavigationBarBackdrop:", a3);
}

- (void)_setHostedByNavigationBar:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setHostedByNavigationBar:](self->_visualProvider, "setHostedByNavigationBar:", a3);
  -[UISearchBar _identifyBarContainer](self, "_identifyBarContainer");
}

- (void)_setMaskActive:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setClippingViewActive:](self->_visualProvider, "setClippingViewActive:", a3);
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  id v5;

  if (-[UISearchBar keyboardAppearance](self, "keyboardAppearance") != a3)
  {
    -[UISearchBar textInputTraits](self, "textInputTraits");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setKeyboardAppearance:", a3);

  }
}

- (void)_commonInit
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *tapToActivateGestureRecognizer;

  v3 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel_tappedSearchBar_);
  tapToActivateGestureRecognizer = self->_tapToActivateGestureRecognizer;
  self->_tapToActivateGestureRecognizer = v3;

  -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapToActivateGestureRecognizer);
  -[UISearchBar setEnablesReturnKeyAutomatically:](self, "setEnablesReturnKeyAutomatically:", 1);
  -[UISearchBar setReturnKeyType:](self, "setReturnKeyType:", 6);
  -[UISearchBar setAutocorrectionType:](self, "setAutocorrectionType:", 1);
  -[UISearchBar _setUpVisualProvider](self, "_setUpVisualProvider");
}

- (void)dealloc
{
  objc_super v3;

  -[_UISearchBarVisualProviderBase teardown](self->_visualProvider, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)UISearchBar;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)setText:(NSString *)text
{
  void *v4;
  NSString *v5;

  v5 = text;
  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  if ((dyld_program_sdk_at_least() & 1) == 0)
    -[UISearchBar _updateForNewSearchFieldText:](self, "_updateForNewSearchFieldText:", v5);

}

- (void)_updateForNewSearchFieldText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UISearchBar searchField](self, "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UISearchBar searchField](self, "searchField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length") != 0;

  }
  else
  {
    v8 = 0;
  }

  -[UISearchBar _hideOrResetHelperPlaceHolder:](self, "_hideOrResetHelperPlaceHolder:", v8);
  -[_UISearchBarVisualProviderBase searchDisplayController](self->_visualProvider, "searchDisplayController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchBar:textDidChange:", self, v10);

  -[UISearchController _searchBar:textDidChange:programatically:](self->__searchController, "_searchBar:textDidChange:programatically:", self, v10, 1);
}

- (void)_setOverrideContentInsets:(UIEdgeInsets)a3 forRectEdges:(unint64_t)a4
{
  -[_UISearchBarVisualProviderBase setOverrideContentInsets:forRectEdges:](self->_visualProvider, "setOverrideContentInsets:forRectEdges:", a4, a3.top, a3.left, a3.bottom, a3.right);
}

- (void)_setUpVisualProvider
{
  objc_class *v3;
  _UISearchBarVisualProviderBase *v4;
  _UISearchBarVisualProviderBase *visualProvider;

  if (!self->_visualProvider)
  {
    if (_searchBarShouldSeparateLayouts())
      v3 = (objc_class *)objc_opt_class();
    else
      v3 = (objc_class *)_UISearchBarVisualProviderLegacy;
    v4 = (_UISearchBarVisualProviderBase *)objc_msgSend([v3 alloc], "initWithDelegate:", self);
    visualProvider = self->_visualProvider;
    self->_visualProvider = v4;

    -[_UISearchBarVisualProviderBase prepare](self->_visualProvider, "prepare");
  }
}

- (void)_setEnabled:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setEnabled:animated:](self->_visualProvider, "setEnabled:animated:", a3, 0);
}

- (UISearchBar)init
{
  return -[UISearchBar initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)setDrawsBackground:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setDrawsBackground:](self->_visualProvider, "setDrawsBackground:", a3);
}

- (NSString)text
{
  void *v2;
  void *v3;
  __CFString *v4;
  uint64_t v5;

  -[_UISearchBarVisualProviderBase searchField](self->_visualProvider, "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = &stru_1E16EDF20;
  if (v2)
  {
    objc_msgSend(v2, "text");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
      v4 = (__CFString *)v5;
  }

  return (NSString *)v4;
}

- (void)_setActiveSearchDeferringScopeBar:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setActiveSearchDeferringScopeBar:](self->_visualProvider, "setActiveSearchDeferringScopeBar:", a3);
}

- (void)setCenterPlaceholder:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setCenterPlaceholder:](self->_visualProvider, "setCenterPlaceholder:", a3);
}

- (NSInteger)selectedScopeButtonIndex
{
  return -[_UISearchBarVisualProviderBase selectedScope](self->_visualProvider, "selectedScope");
}

- (NSArray)scopeButtonTitles
{
  return -[_UISearchBarVisualProviderBase scopeTitles](self->_visualProvider, "scopeTitles");
}

- (void)setBarStyle:(UIBarStyle)barStyle
{
  -[_UISearchBarVisualProviderBase setBarStyle:](self->_visualProvider, "setBarStyle:", barStyle);
}

- (void)setPositionAdjustment:(UIOffset)adjustment forSearchBarIcon:(UISearchBarIcon)icon
{
  CGFloat vertical;
  CGFloat horizontal;
  void *v7;
  void *v8;
  _QWORD v9[2];

  vertical = adjustment.vertical;
  horizontal = adjustment.horizontal;
  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(CGFloat *)v9 = horizontal;
  *(CGFloat *)&v9[1] = vertical;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v9, "{UIOffset=dd}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setOffsetValue:forIcon:", v8, icon);

}

double __27__UISearchBar_setDelegate___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id WeakRetained;
  id v11;
  double v12;
  double v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_searchBar:proposedSearchFieldFrame:", v11, a2, a3, a4, a5);
  v13 = v12;

  return v13;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

- (void)_setRequiresLegacyVisualProvider
{
  _UISearchBarVisualProviderLegacy *v3;
  _UISearchBarVisualProviderBase *visualProvider;
  _UISearchBarVisualProviderBase *v5;

  if (!-[UISearchBar _usesLegacyVisualProvider](self, "_usesLegacyVisualProvider"))
  {
    v5 = self->_visualProvider;
    v3 = -[_UISearchBarVisualProviderBase initWithDelegate:]([_UISearchBarVisualProviderLegacy alloc], "initWithDelegate:", self);
    -[_UISearchBarVisualProviderLegacy prepareFromAbandonedVisualProvider:](v3, "prepareFromAbandonedVisualProvider:", v5);
    visualProvider = self->_visualProvider;
    self->_visualProvider = &v3->super;

  }
}

- (BOOL)_supportsLayoutStates
{
  return -[_UISearchBarVisualProviderBase layoutState](self->_visualProvider, "layoutState") != -1;
}

- (void)_setMaskBounds:(CGRect)a3
{
  -[_UISearchBarVisualProviderBase setClippingViewBounds:](self->_visualProvider, "setClippingViewBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISearchBar;
  -[UIView setSemanticContentAttribute:](&v6, sel_setSemanticContentAttribute_);
  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSemanticContentAttribute:", a3);

}

- (NSString)description
{
  void *v3;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISearchBar;
  -[UIView description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!dyld_program_sdk_at_least() || !os_variant_has_internal_diagnostics())
    return (NSString *)v3;
  if (self->__searchController)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" searchController=%p"), self->__searchController);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" visualProvider=%p"), self->_visualProvider);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)_setSearchFieldContainerLayoutCustomizationDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  _UISearchBarVisualProviderBase *visualProvider;
  _QWORD v9[4];
  id v10;
  id v11;
  id from;
  id to;
  id location;

  objc_initWeak(&location, a3);
  if (!-[UISearchBar _usesLegacyVisualProvider](self, "_usesLegacyVisualProvider"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_searchFieldContainerLayoutCustomizationDelegate);
    v5 = objc_loadWeakRetained(&location);

    if (WeakRetained != v5)
    {
      v6 = objc_loadWeakRetained(&location);
      objc_storeWeak((id *)&self->_searchFieldContainerLayoutCustomizationDelegate, v6);

      v7 = objc_loadWeakRetained((id *)&self->_searchFieldContainerLayoutCustomizationDelegate);
      if (v7)
      {
        objc_copyWeak(&to, &location);
        objc_initWeak(&from, self);
        visualProvider = self->_visualProvider;
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __67__UISearchBar__setSearchFieldContainerLayoutCustomizationDelegate___block_invoke;
        v9[3] = &unk_1E16B67C8;
        objc_copyWeak(&v10, &to);
        objc_copyWeak(&v11, &from);
        -[_UISearchBarVisualProviderBase setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:](visualProvider, "setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:", v9);
        objc_destroyWeak(&v11);
        objc_destroyWeak(&v10);
        objc_destroyWeak(&from);
        objc_destroyWeak(&to);
      }
      else
      {
        -[_UISearchBarVisualProviderBase setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:](self->_visualProvider, "setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:", 0);
      }
    }
  }
  objc_destroyWeak(&location);
}

void __67__UISearchBar__setSearchFieldContainerLayoutCustomizationDelegate___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  id *v19;
  id v20;
  id v21;
  id WeakRetained;

  v19 = (id *)(a1 + 32);
  v20 = a2;
  WeakRetained = objc_loadWeakRetained(v19);
  v21 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_searchBarWillLayoutSubviews:inSearchFieldContainer:searchTextFieldFrame:cancelButtonFrame:", v21, v20, a3, a4, a5, a6, a7, a8, a9, a10);

}

- (void)_setAdditionalPaddingForCancelButtonAtLeadingEdge:(double)a3
{
  if (!-[UISearchBar _usesLegacyVisualProvider](self, "_usesLegacyVisualProvider"))
    -[_UISearchBarVisualProviderBase setAdditionalPaddingForCancelButtonAtLeadingEdge:](self->_visualProvider, "setAdditionalPaddingForCancelButtonAtLeadingEdge:", a3);
}

- (double)_additionalPaddingForCancelButtonAtLeadingEdge
{
  double result;

  if (-[UISearchBar _usesLegacyVisualProvider](self, "_usesLegacyVisualProvider"))
    return 0.0;
  -[_UISearchBarVisualProviderBase additionalPaddingForCancelButtonAtLeadingEdge](self->_visualProvider, "additionalPaddingForCancelButtonAtLeadingEdge");
  return result;
}

- (void)_setAdditionalPaddingForSearchFieldAtLeadingEdge:(double)a3
{
  if (!-[UISearchBar _usesLegacyVisualProvider](self, "_usesLegacyVisualProvider"))
    -[_UISearchBarVisualProviderBase setAdditionalPaddingForSearchFieldAtLeadingEdge:](self->_visualProvider, "setAdditionalPaddingForSearchFieldAtLeadingEdge:", a3);
}

- (double)_additionalPaddingForSearchFieldAtLeadingEdge
{
  double result;

  if (-[UISearchBar _usesLegacyVisualProvider](self, "_usesLegacyVisualProvider"))
    return 0.0;
  -[_UISearchBarVisualProviderBase additionalPaddingForSearchFieldAtLeadingEdge](self->_visualProvider, "additionalPaddingForSearchFieldAtLeadingEdge");
  return result;
}

- (UISearchBar)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UISearchBar *v5;
  UISearchBar *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UISearchBarVisualProviderBase *visualProvider;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v4 = coder;
  v27.receiver = self;
  v27.super_class = (Class)UISearchBar;
  v5 = -[UIView initWithCoder:](&v27, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[UISearchBar _commonInit](v5, "_commonInit");
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_delegate, v7);

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIPrompt"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIPlaceholder"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    visualProvider = v6->_visualProvider;
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIBarTintColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchBarVisualProviderBase _setBarTintColor:](visualProvider, "_setBarTintColor:", v12);

    -[_UISearchBarVisualProviderBase _setBarStyle:](v6->_visualProvider, "_setBarStyle:", 0);
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIBarStyle")))
      -[_UISearchBarVisualProviderBase _setBarStyle:](v6->_visualProvider, "_setBarStyle:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIBarStyle")));
    -[_UISearchBarVisualProviderBase searchBarBackground](v6->_visualProvider, "searchBarBackground");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchBarVisualProviderBase effectiveBarTintColor](v6->_visualProvider, "effectiveBarTintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBarTintColor:", v14);

    objc_msgSend(v13, "setBarStyle:", -[_UISearchBarVisualProviderBase barStyle](v6->_visualProvider, "barStyle"));
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIBackgroundImage"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchBar setBackgroundImage:](v6, "setBackgroundImage:", v15);

    -[_UISearchBarVisualProviderBase _setShowsScopeBar:](v6->_visualProvider, "_setShowsScopeBar:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIShowsScopeBar")));
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIScopeButtonTitles"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchBar setScopeButtonTitles:](v6, "setScopeButtonTitles:", v16);

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIScopeBarBackgroundImage"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchBar setScopeBarBackgroundImage:](v6, "setScopeBarBackgroundImage:", v17);

    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIAutoDisableCancelButton")))
      -[_UISearchBarVisualProviderBase _setAutoDisableCancelButton:](v6->_visualProvider, "_setAutoDisableCancelButton:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIAutoDisableCancelButton")));
    -[_UISearchBarVisualProviderBase _setShowsCancelButton:](v6->_visualProvider, "_setShowsCancelButton:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIShowsCancelButton")));
    -[_UISearchBarVisualProviderBase _setShowsBookmarkButton:](v6->_visualProvider, "_setShowsBookmarkButton:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIShowsBookmarkButton")));
    -[_UISearchBarVisualProviderBase _setShowsSearchResultsButton:](v6->_visualProvider, "_setShowsSearchResultsButton:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIShowSearchResultsButton")));
    -[_UISearchBarVisualProviderBase _setSearchResultsButtonSelected:](v6->_visualProvider, "_setSearchResultsButtonSelected:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISearchResultsButtonSelected")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UICombinesLandscapeBars")))
      v18 = CFSTR("UICombinesLandscapeBars");
    else
      v18 = CFSTR("UIAllowsInlineScopeBar");
    -[_UISearchBarVisualProviderBase setAllowsInlineScopeBar:](v6->_visualProvider, "setAllowsInlineScopeBar:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", v18));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISearchBarTranslucence")))
    {
      -[_UISearchBarVisualProviderBase _setBarTranslucence:](v6->_visualProvider, "_setBarTranslucence:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UISearchBarTranslucence")));
    }
    else if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISearchBarIsTranslucent")))
    {
      -[UISearchBar setTranslucent:](v6, "setTranslucent:", 1);
    }
    v19 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIHidesBackground"));
    -[_UISearchBarVisualProviderBase _setHideBackground:](v6->_visualProvider, "_setHideBackground:", v19);
    -[_UISearchBarVisualProviderBase searchBarBackground](v6->_visualProvider, "searchBarBackground");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidden:", v19);

    -[UISearchBar setUsesEmbeddedAppearance:](v6, "setUsesEmbeddedAppearance:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIUsesEmbeddedAppearance")));
    -[_UISearchBarVisualProviderBase updateSearchBarOpacity](v6->_visualProvider, "updateSearchBarOpacity");
    -[_UISearchBarVisualProviderBase searchField](v6->_visualProvider, "searchField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", v9);

    -[_UISearchBarVisualProviderBase searchField](v6->_visualProvider, "searchField");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPlaceholder:", v10);

    if (-[_UISearchBarVisualProviderBase centerPlaceholder](v6->_visualProvider, "centerPlaceholder"))
    {
      -[UISearchBar textInputTraits](v6, "textInputTraits");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDeferBecomingResponder:", 1);

    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISearchBarStyle")))
      -[UISearchBar setSearchBarStyle:](v6, "setSearchBarStyle:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UISearchBarStyle")));
    if (v8)
    {
      -[_UISearchBarVisualProviderBase setUpPromptLabel](v6->_visualProvider, "setUpPromptLabel");
      -[_UISearchBarVisualProviderBase promptLabel](v6->_visualProvider, "promptLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", v8);

    }
    if (-[_UISearchBarVisualProviderBase showsCancelButton](v6->_visualProvider, "showsCancelButton"))
      -[_UISearchBarVisualProviderBase setUpCancelButtonWithAppearance:](v6->_visualProvider, "setUpCancelButtonWithAppearance:", 0);
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIShowsSeparator")))
      -[UISearchBar _setShowsSeparator:](v6, "_setShowsSeparator:", 1);
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIKeyboardType")))
      -[UISearchBar setKeyboardType:](v6, "setKeyboardType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIKeyboardType")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISpellCheckingType")))
      -[UISearchBar setSpellCheckingType:](v6, "setSpellCheckingType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UISpellCheckingType")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIAutocorrectionType")))
      -[UISearchBar setAutocorrectionType:](v6, "setAutocorrectionType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIAutocorrectionType")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIAutocapitalizationType")))
      -[UISearchBar setAutocapitalizationType:](v6, "setAutocapitalizationType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIAutocapitalizationType")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIKeyboardAppearance")))
      -[UISearchBar setKeyboardAppearance:](v6, "setKeyboardAppearance:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIKeyboardAppearance")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIReturnKeyType")))
      -[UISearchBar setReturnKeyType:](v6, "setReturnKeyType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIReturnKeyType")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIEnablesReturnKeyAutomatically")))
      -[UISearchBar setEnablesReturnKeyAutomatically:](v6, "setEnablesReturnKeyAutomatically:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIEnablesReturnKeyAutomatically")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UITextContentType")))
    {
      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UITextContentType"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchBar setTextContentType:](v6, "setTextContentType:", v25);

    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UITextSmartInsertDeleteType")))
      -[UISearchBar setSmartInsertDeleteType:](v6, "setSmartInsertDeleteType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITextSmartInsertDeleteType")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UITextSmartQuotesType")))
      -[UISearchBar setSmartQuotesType:](v6, "setSmartQuotesType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITextSmartQuotesType")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UITextSmartDashesType")))
      -[UISearchBar setSmartDashesType:](v6, "setSmartDashesType:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITextSmartDashesType")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISecureTextEntry")))
      -[UISearchBar setSecureTextEntry:](v6, "setSecureTextEntry:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISecureTextEntry")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISearchTextPositionAdjustment")))
    {
      -[NSCoder decodeUIOffsetForKey:](v4, "decodeUIOffsetForKey:", CFSTR("UISearchTextPositionAdjustment"));
      -[UISearchBar setSearchTextPositionAdjustment:](v6, "setSearchTextPositionAdjustment:");
    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISearchFieldBackgroundPositionAdjustment")))
    {
      -[NSCoder decodeUIOffsetForKey:](v4, "decodeUIOffsetForKey:", CFSTR("UISearchFieldBackgroundPositionAdjustment"));
      -[UISearchBar setSearchFieldBackgroundPositionAdjustment:](v6, "setSearchFieldBackgroundPositionAdjustment:");
    }
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISearchBarDisabled")))
      -[_UISearchBarVisualProviderBase setEnabled:](v6->_visualProvider, "setEnabled:", 0);
    -[UISearchBar setNeedsLayout](v6, "setNeedsLayout");

  }
  return v6;
}

- (void)_populateArchivedSubviews:(id)a3
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
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UISearchBar;
  -[UIView _populateArchivedSubviews:](&v14, sel__populateArchivedSubviews_, v4);
  -[_UISearchBarVisualProviderBase runtimeOnlyViews](self->_visualProvider, "runtimeOnlyViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
        objc_msgSend(v4, "removeObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UISearchBarStyle v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)UISearchBar;
  -[UIView encodeWithCoder:](&v31, sel_encodeWithCoder_, v4);
  if (-[_UISearchBarVisualProviderBase barStyle](self->_visualProvider, "barStyle"))
    objc_msgSend(v4, "encodeInteger:forKey:", -[_UISearchBarVisualProviderBase barStyle](self->_visualProvider, "barStyle"), CFSTR("UIBarStyle"));
  if (-[_UISearchBarVisualProviderBase showsCancelButton](self->_visualProvider, "showsCancelButton"))
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase showsCancelButton](self->_visualProvider, "showsCancelButton"), CFSTR("UIShowsCancelButton"));
  if (-[_UISearchBarVisualProviderBase showsBookmarkButton](self->_visualProvider, "showsBookmarkButton"))
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase showsBookmarkButton](self->_visualProvider, "showsBookmarkButton"), CFSTR("UIShowsBookmarkButton"));
  if (-[_UISearchBarVisualProviderBase showsScopeBar](self->_visualProvider, "showsScopeBar"))
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase showsScopeBar](self->_visualProvider, "showsScopeBar"), CFSTR("UIShowsScopeBar"));
  if (-[_UISearchBarVisualProviderBase showsSearchResultsButton](self->_visualProvider, "showsSearchResultsButton"))
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase showsSearchResultsButton](self->_visualProvider, "showsSearchResultsButton"), CFSTR("UIShowSearchResultsButton"));
  if (-[_UISearchBarVisualProviderBase isSearchResultsButtonSelected](self->_visualProvider, "isSearchResultsButtonSelected"))
  {
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase isSearchResultsButtonSelected](self->_visualProvider, "isSearchResultsButtonSelected"), CFSTR("UISearchResultsButtonSelected"));
  }
  if (!-[_UISearchBarVisualProviderBase autoDisableCancelButton](self->_visualProvider, "autoDisableCancelButton"))
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase autoDisableCancelButton](self->_visualProvider, "autoDisableCancelButton"), CFSTR("UIAutoDisableCancelButton"));
  if (-[_UISearchBarVisualProviderBase allowsInlineScopeBar](self->_visualProvider, "allowsInlineScopeBar"))
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase allowsInlineScopeBar](self->_visualProvider, "allowsInlineScopeBar"), CFSTR("UIAllowsInlineScopeBar"));
  if (-[_UISearchBarVisualProviderBase barTranslucence](self->_visualProvider, "barTranslucence"))
    objc_msgSend(v4, "encodeInteger:forKey:", -[_UISearchBarVisualProviderBase barTranslucence](self->_visualProvider, "barTranslucence"), CFSTR("UISearchBarTranslucence"));
  if (!-[_UISearchBarVisualProviderBase drawsBackground](self->_visualProvider, "drawsBackground"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIHidesBackground"));
  if (-[_UISearchBarVisualProviderBase usesEmbeddedAppearance](self->_visualProvider, "usesEmbeddedAppearance"))
    objc_msgSend(v4, "encodeBool:forKey:", -[_UISearchBarVisualProviderBase usesEmbeddedAppearance](self->_visualProvider, "usesEmbeddedAppearance"), CFSTR("UIUsesEmbeddedAppearance"));
  -[UISearchBar scopeButtonTitles](self, "scopeButtonTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[UISearchBar scopeButtonTitles](self, "scopeButtonTitles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("UIScopeButtonTitles"));

  }
  -[_UISearchBarVisualProviderBase separator](self->_visualProvider, "separator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIShowsSeparator"));
  -[UISearchBar prompt](self, "prompt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UISearchBar prompt](self, "prompt");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("UIPrompt"));

  }
  -[UISearchBar text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UISearchBar text](self, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("UIText"));

  }
  -[UISearchBar placeholder](self, "placeholder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UISearchBar placeholder](self, "placeholder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("UIPlaceholder"));

  }
  -[UISearchBar barTintColor](self, "barTintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[UISearchBar barTintColor](self, "barTintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("UIBarTintColor"));

  }
  if (-[UISearchBar keyboardType](self, "keyboardType"))
    objc_msgSend(v4, "encodeInteger:forKey:", -[UISearchBar keyboardType](self, "keyboardType"), CFSTR("UIKeyboardType"));
  if (-[UISearchBar spellCheckingType](self, "spellCheckingType"))
    objc_msgSend(v4, "encodeInteger:forKey:", -[UISearchBar spellCheckingType](self, "spellCheckingType"), CFSTR("UISpellCheckingType"));
  if (-[UISearchBar autocorrectionType](self, "autocorrectionType"))
    objc_msgSend(v4, "encodeInteger:forKey:", -[UISearchBar autocorrectionType](self, "autocorrectionType"), CFSTR("UIAutocorrectionType"));
  if (-[UISearchBar autocapitalizationType](self, "autocapitalizationType"))
    objc_msgSend(v4, "encodeInteger:forKey:", -[UISearchBar autocapitalizationType](self, "autocapitalizationType"), CFSTR("UIAutocapitalizationType"));
  v17 = -[UISearchBar keyboardAppearance](self, "keyboardAppearance");
  if (v17)
    objc_msgSend(v4, "encodeInteger:forKey:", v17, CFSTR("UIKeyboardAppearance"));
  v18 = -[UISearchBar returnKeyType](self, "returnKeyType");
  if (v18)
    objc_msgSend(v4, "encodeInteger:forKey:", v18, CFSTR("UIReturnKeyType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UISearchBar enablesReturnKeyAutomatically](self, "enablesReturnKeyAutomatically"), CFSTR("UIEnablesReturnKeyAutomatically"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UISearchBar isSecureTextEntry](self, "isSecureTextEntry"), CFSTR("UISecureTextEntry"));
  -[UISearchBar textContentType](self, "textContentType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("UITextContentType"));
  v20 = -[UISearchBar smartInsertDeleteType](self, "smartInsertDeleteType");
  if (v20)
    objc_msgSend(v4, "encodeInteger:forKey:", v20, CFSTR("UITextSmartInsertDeleteType"));
  v21 = -[UISearchBar smartQuotesType](self, "smartQuotesType");
  if (v21)
    objc_msgSend(v4, "encodeInteger:forKey:", v21, CFSTR("UITextSmartQuotesType"));
  v22 = -[UISearchBar smartDashesType](self, "smartDashesType");
  if (v22)
    objc_msgSend(v4, "encodeInteger:forKey:", v22, CFSTR("UITextSmartDashesType"));
  -[UISearchBar delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v4, "encodeConditionalObject:forKey:", v23, CFSTR("UIDelegate"));
  -[UISearchBar backgroundImage](self, "backgroundImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("UIBackgroundImage"));
  -[UISearchBar scopeBarBackgroundImage](self, "scopeBarBackgroundImage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("UIScopeBarBackgroundImage"));
  -[UISearchBar searchTextPositionAdjustment](self, "searchTextPositionAdjustment");
  if (v27 != 0.0 || v26 != 0.0)
    objc_msgSend(v4, "encodeUIOffset:forKey:", CFSTR("UISearchTextPositionAdjustment"));
  -[UISearchBar searchFieldBackgroundPositionAdjustment](self, "searchFieldBackgroundPositionAdjustment");
  if (v29 != 0.0 || v28 != 0.0)
    objc_msgSend(v4, "encodeUIOffset:forKey:", CFSTR("UISearchFieldBackgroundPositionAdjustment"));
  v30 = -[UISearchBar searchBarStyle](self, "searchBarStyle");
  if (v30)
    objc_msgSend(v4, "encodeInteger:forKey:", v30, CFSTR("UISearchBarStyle"));
  if (!-[UISearchBar isEnabled](self, "isEnabled"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UISearchBarDisabled"));

}

- (void)setController:(id)a3
{
  -[_UISearchBarVisualProviderBase setSearchDisplayController:](self->_visualProvider, "setSearchDisplayController:", a3);
}

- (id)controller
{
  return -[_UISearchBarVisualProviderBase searchDisplayController](self->_visualProvider, "searchDisplayController");
}

- (id)_searchField
{
  void *v3;

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIKVCAccessProhibited((uint64_t)v3, (uint64_t)CFSTR("UISearchBar"));

  return -[_UISearchBarVisualProviderBase searchField](self->_visualProvider, "searchField");
}

- (id)_cancelButton
{
  void *v3;

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIKVCAccessProhibited((uint64_t)v3, (uint64_t)CFSTR("UISearchBar"));

  return -[_UISearchBarVisualProviderBase cancelButton](self->_visualProvider, "cancelButton");
}

- (void)set_cancelButtonText:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIKVCAccessProhibited((uint64_t)v5, (uint64_t)CFSTR("UISearchBar"));

  -[UISearchBar _setCancelButtonText:](self, "_setCancelButtonText:", v6);
}

- (id)_cancelButtonText
{
  void *v3;

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIKVCAccessProhibited((uint64_t)v3, (uint64_t)CFSTR("UISearchBar"));

  return -[_UISearchBarVisualProviderBase cancelButtonText](self->_visualProvider, "cancelButtonText");
}

- (id)keyCommands
{
  UIKeyCommand *cancelKeyCommand;
  UIKeyCommand *v4;
  UIKeyCommand *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[UISearchBar showsCancelButton](self, "showsCancelButton"))
  {
    cancelKeyCommand = self->_cancelKeyCommand;
    if (!cancelKeyCommand)
    {
      +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputEscape"), 0, sel__cancelButtonPressed);
      v4 = (UIKeyCommand *)objc_claimAutoreleasedReturnValue();
      v5 = self->_cancelKeyCommand;
      self->_cancelKeyCommand = v4;

      cancelKeyCommand = self->_cancelKeyCommand;
    }
    v8[0] = cancelKeyCommand;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_scopeBar
{
  return -[_UISearchBarVisualProviderBase scopeBar](self->_visualProvider, "scopeBar");
}

- (id)_containingNavigationPalette
{
  objc_opt_class();
  return _enclosingViewOfClass(self);
}

- (UIBarStyle)barStyle
{
  return -[_UISearchBarVisualProviderBase barStyle](self->_visualProvider, "barStyle");
}

- (BOOL)isTranslucent
{
  void *v3;
  char v4;
  void *v6;
  void *v7;

  if (-[_UISearchBarVisualProviderBase isHostedByNavigationBar](self->_visualProvider, "isHostedByNavigationBar")
    || -[_UISearchBarVisualProviderBase isInNavigationPalette](self->_visualProvider, "isInNavigationPalette")
    || !-[_UISearchBarVisualProviderBase drawsBackground](self->_visualProvider, "drawsBackground"))
  {
    return 1;
  }
  -[_UISearchBarVisualProviderBase searchDisplayController](self->_visualProvider, "searchDisplayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "displaysSearchBarInNavigationBar") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[_UISearchBarVisualProviderBase searchBarBackground](self->_visualProvider, "searchBarBackground");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[_UISearchBarVisualProviderBase searchBarBackground](self->_visualProvider, "searchBarBackground");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "isTranslucent");

    }
    else
    {
      v4 = 1;
    }

  }
  return v4;
}

- (void)_setClassForSearchTextField:(Class)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  if (!a3)
    v6 = (void *)objc_opt_class();
  if (v6 != -[UISearchBar _classForSearchTextField](self, "_classForSearchTextField"))
  {
    if ((_searchBarShouldSeparateLayouts() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchBar.m"), 842, CFSTR("Can't change _classForSearchTextField in old-style UISearchBar"));

    }
    if ((objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchBar.m"), 843, CFSTR("_classForSearchTextField must be a subclass of UISearchTextField"));

    }
    -[UIView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchBar.m"), 844, CFSTR("Can't change _classForSearchTextField when UISearchBar is in a window"));

    }
    objc_storeStrong((id *)&self->_classForSearchTextField, a3);
    -[_UISearchBarVisualProviderBase searchFieldIfExists](self->_visualProvider, "searchFieldIfExists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[_UISearchBarVisualProviderBase setSearchField:](self->_visualProvider, "setSearchField:", 0);
    -[UISearchBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEnabled:(BOOL)enabled
{
  -[_UISearchBarVisualProviderBase setEnabled:](self->_visualProvider, "setEnabled:", enabled);
}

- (BOOL)isEnabled
{
  return -[_UISearchBarVisualProviderBase isEnabled](self->_visualProvider, "isEnabled");
}

- (void)setPrompt:(NSString *)prompt
{
  -[_UISearchBarVisualProviderBase setPrompt:](self->_visualProvider, "setPrompt:", prompt);
}

- (NSString)prompt
{
  return -[_UISearchBarVisualProviderBase prompt](self->_visualProvider, "prompt");
}

- (NSString)placeholder
{
  void *v2;
  void *v3;

  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setShowsSearchResultsButton:(BOOL)showsSearchResultsButton
{
  -[_UISearchBarVisualProviderBase setShowsSearchResultsButton:](self->_visualProvider, "setShowsSearchResultsButton:", showsSearchResultsButton);
}

- (void)setSearchResultsButtonSelected:(BOOL)searchResultsButtonSelected
{
  -[_UISearchBarVisualProviderBase setSearchResultsButtonSelected:](self->_visualProvider, "setSearchResultsButtonSelected:", searchResultsButtonSelected);
}

- (BOOL)isSearchResultsButtonSelected
{
  return -[_UISearchBarVisualProviderBase isSearchResultsButtonSelected](self->_visualProvider, "isSearchResultsButtonSelected");
}

- (void)setShowsBookmarkButton:(BOOL)showsBookmarkButton
{
  -[_UISearchBarVisualProviderBase setShowsBookmarkButton:](self->_visualProvider, "setShowsBookmarkButton:", showsBookmarkButton);
}

- (BOOL)showsBookmarkButton
{
  return -[_UISearchBarVisualProviderBase showsBookmarkButton](self->_visualProvider, "showsBookmarkButton");
}

- (void)setShowsCancelButton:(BOOL)showsCancelButton
{
  -[UISearchBar setShowsCancelButton:animated:](self, "setShowsCancelButton:animated:", showsCancelButton, 0);
}

- (void)setShowsCancelButton:(BOOL)showsCancelButton animated:(BOOL)animated
{
  -[_UISearchBarVisualProviderBase setShowsCancelButton:animated:](self->_visualProvider, "setShowsCancelButton:animated:", showsCancelButton, animated);
}

- (void)_setDisableDictationButton:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setDisableDictationButton:](self->_visualProvider, "setDisableDictationButton:", a3);
}

- (BOOL)_showingDictationButton
{
  return -[_UISearchBarVisualProviderBase wantsDictationButton](self->_visualProvider, "wantsDictationButton");
}

- (void)_setShowsCancelButton:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setSearchDisplayControllerShowsCancelButton:](self->_visualProvider, "setSearchDisplayControllerShowsCancelButton:", a3);
}

- (BOOL)drawsBackground
{
  return -[_UISearchBarVisualProviderBase drawsBackground](self->_visualProvider, "drawsBackground");
}

- (void)setDrawsBackgroundInPalette:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setDrawsBackgroundInPalette:](self->_visualProvider, "setDrawsBackgroundInPalette:", a3);
}

- (BOOL)drawsBackgroundInPalette
{
  return -[_UISearchBarVisualProviderBase drawsBackgroundInPalette](self->_visualProvider, "drawsBackgroundInPalette");
}

- (BOOL)_reliesOnNavigationBarBackdrop
{
  return -[_UISearchBarVisualProviderBase reliesOnNavigationBarBackdrop](self->_visualProvider, "reliesOnNavigationBarBackdrop");
}

- (void)_setTextFieldManagedInNSToolbar:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setTextFieldManagedInNSToolbar:](self->_visualProvider, "setTextFieldManagedInNSToolbar:", a3);
}

- (BOOL)_isTextFieldManagedInNSToolbar
{
  return -[_UISearchBarVisualProviderBase isTextFieldManagedInNSToolbar](self->_visualProvider, "isTextFieldManagedInNSToolbar");
}

- (void)_setProvidesRestingMeasurementValues:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setProvidesRestingMeasurementValues:](self->_visualProvider, "setProvidesRestingMeasurementValues:", a3);
}

- (BOOL)_providesRestingMeasurementValues
{
  return -[_UISearchBarVisualProviderBase providesRestingMeasurementValues](self->_visualProvider, "providesRestingMeasurementValues");
}

- (double)_widthForButtonBarItemLayout
{
  uint64_t v3;
  double result;

  if (-[_UISearchBarVisualProviderBase providesRestingMeasurementValues](self->_visualProvider, "providesRestingMeasurementValues"))
  {
    v3 = 2;
  }
  else if (-[UISearchBar _layoutState](self, "_layoutState") == 3)
  {
    v3 = 3;
  }
  else
  {
    v3 = 2;
  }
  -[UISearchBar _idealInlineWidthForLayoutState:](self, "_idealInlineWidthForLayoutState:", v3);
  return result;
}

- (void)_setAllowsInlineScopeBar:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setAllowsInlineScopeBar:](self->_visualProvider, "setAllowsInlineScopeBar:", a3);
}

- (BOOL)_allowsInlineScopeBar
{
  return -[_UISearchBarVisualProviderBase allowsInlineScopeBar](self->_visualProvider, "allowsInlineScopeBar");
}

- (BOOL)_shouldCombineLandscapeBars
{
  return -[_UISearchBarVisualProviderBase shouldCombineLandscapeBarsForOrientation:](self->_visualProvider, "shouldCombineLandscapeBarsForOrientation:", -[UISearchBar _expectedInterfaceOrientation](self, "_expectedInterfaceOrientation"));
}

- (BOOL)_shouldCombineLandscapeBarsForOrientation:(int64_t)a3
{
  return -[_UISearchBarVisualProviderBase shouldCombineLandscapeBarsForOrientation:](self->_visualProvider, "shouldCombineLandscapeBarsForOrientation:", a3);
}

- (BOOL)_wouldCombineLandscapeBarsForSize:(CGSize)a3
{
  return -[_UISearchBarVisualProviderBase wouldCombineLandscapeBarsForSize:](self->_visualProvider, "wouldCombineLandscapeBarsForSize:", a3.width, a3.height);
}

- (void)setUsesEmbeddedAppearance:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setUsesEmbeddedAppearance:](self->_visualProvider, "setUsesEmbeddedAppearance:", a3);
}

- (BOOL)usesEmbeddedAppearance
{
  return -[_UISearchBarVisualProviderBase usesEmbeddedAppearance](self->_visualProvider, "usesEmbeddedAppearance");
}

- (void)setCancelButton:(id)a3
{
  -[_UISearchBarVisualProviderBase setCancelButton:](self->_visualProvider, "setCancelButton:", a3);
}

- (id)cancelButton
{
  return -[_UISearchBarVisualProviderBase cancelButton](self->_visualProvider, "cancelButton");
}

- (UIButton)_leftButton
{
  return (UIButton *)-[_UISearchBarVisualProviderBase leftButton](self->_visualProvider, "leftButton");
}

- (void)_setOverrideInlineInactiveWidth:(double)a3
{
  -[_UISearchBarVisualProviderBase setOverrideInlineInactiveWidth:](self->_visualProvider, "setOverrideInlineInactiveWidth:", a3);
}

- (double)_overrideInlineInactiveWidth
{
  double result;

  -[_UISearchBarVisualProviderBase overrideInlineInactiveWidth](self->_visualProvider, "overrideInlineInactiveWidth");
  return result;
}

- (void)_setOverrideInlineActiveWidth:(double)a3
{
  -[_UISearchBarVisualProviderBase setOverrideInlineActiveWidth:](self->_visualProvider, "setOverrideInlineActiveWidth:", a3);
}

- (double)_overrideInlineAactiveWidth
{
  double result;

  -[_UISearchBarVisualProviderBase overrideInlineActiveWidth](self->_visualProvider, "overrideInlineActiveWidth");
  return result;
}

- (void)takeTraitsFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISearchBar textInputTraits](self, "textInputTraits");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "takeTraitsFrom:", v4);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (BOOL)_searchBarTextFieldShouldBeginEditing
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "searchBarShouldBeginEditing:", self);
  else
    v4 = 1;

  return v4;
}

- (BOOL)_searchBarTextFieldShouldEndEditing
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "searchBarShouldEndEditing:", self);
  else
    v4 = 1;

  return v4;
}

- (BOOL)_searchBarTextFieldShouldScrollToVisibleWhenBecomingFirstResponder
{
  void *v3;
  void *v4;
  char v5;

  -[_UISearchBarVisualProviderBase searchDisplayController](self->_visualProvider, "searchDisplayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "_searchBarShouldScrollToVisible:", self);
  else
    v5 = 1;

  return v5;
}

- (BOOL)_searchBarTextFieldShouldClear
{
  void *v3;
  uint64_t v4;
  char v5;
  id WeakRetained;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 6)
  {
    -[UISearchBar _cancelButtonPressed](self, "_cancelButtonPressed");
    return 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(WeakRetained, "searchBarShouldClear:", self);
    else
      v5 = 1;

  }
  return v5;
}

- (BOOL)_searchBarTextFieldShouldChangeCharactersInRange:(_NSRange)a3 replacementString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id WeakRetained;
  char v9;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(WeakRetained, "searchBar:shouldChangeTextInRange:replacementText:", self, location, length, v7);
  else
    v9 = 1;

  return v9;
}

- (int64_t)_preferredAlignment
{
  return 2;
}

- (void)_setDataSource:(id)a3 navigationItem:(id)a4 titleLocation:(int64_t)a5
{
  -[_UISearchBarVisualProviderBase setNavBarTitleViewDataSource:](self->_visualProvider, "setNavBarTitleViewDataSource:", a3, a4);
  -[_UISearchBarVisualProviderBase setNavBarTitleViewLocation:](self->_visualProvider, "setNavBarTitleViewLocation:", a5);
}

- (BOOL)_navigationBarHeightShouldBeIncreasedByTabBarHeight
{
  return 0;
}

- (NSArray)_navigationBarContentOverlayRects
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (double)_navigationBarContentHeight
{
  double result;

  -[_UISearchBarVisualProviderBase navigationBarContentHeight](self->_visualProvider, "navigationBarContentHeight");
  return result;
}

- (double)_navigationBarContentHeightExtension
{
  return 0.0;
}

- (double)_navigationBarBackButtonMaximumWidth
{
  return 0.0;
}

- (BOOL)_hideNavigationBarBackButton
{
  return 0;
}

- (BOOL)_hideNavigationBarLeadingBarButtons
{
  return 0;
}

- (BOOL)_hideNavigationBarStandardTitle
{
  return 1;
}

- (BOOL)_hideNavigationBarCenterBarButtons
{
  return 1;
}

- (BOOL)_hideNavigationBarTrailingBarButtons
{
  return 0;
}

- (double)_navigationBarBackButtonAlpha
{
  return 1.0;
}

- (double)_navigationBarLeadingBarButtonsAlpha
{
  return 1.0;
}

- (double)_navigationBarTrailingBarButtonsAlpha
{
  return 1.0;
}

- (int64_t)_preferredContentSizeForSize:(int64_t)a3
{
  return a3;
}

- (BOOL)_wantsTwoPartTransition
{
  return 1;
}

- (void)_navigationBarTransitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  -[_UISearchBarVisualProviderBase navigationBarTransitionWillBegin:willBeDisplayed:](self->_visualProvider, "navigationBarTransitionWillBegin:willBeDisplayed:", a3, a4);
}

- (void)_performNavigationBarTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  double v4;

  v4 = 0.0;
  if (a4)
    v4 = 1.0;
  -[UIView setAlpha:](self, "setAlpha:", a3, v4);
}

- (void)_navigationBarTransitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  -[_UISearchBarVisualProviderBase navigationBarTransitionCompleted:willBeDisplayed:](self->_visualProvider, "navigationBarTransitionCompleted:willBeDisplayed:", a3, a4);
}

- (id)_traitCollectionOverridesForNavigationBarTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[UISearchBar _effectivelySupportsDynamicType](self, "_effectivelySupportsDynamicType"))
  {
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_driveTransitionToSearchLayoutState:(int64_t)a3
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  -[_UISearchBarVisualProviderBase driveTransitionToSearchLayoutState:](self->_visualProvider, "driveTransitionToSearchLayoutState:", a3);
}

- (void)_prepareForTransitionToSearchLayoutState:(int64_t)a3
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  -[_UISearchBarVisualProviderBase prepareForTransitionToSearchLayoutState:](self->_visualProvider, "prepareForTransitionToSearchLayoutState:", a3);
}

- (void)_freezeForAnimatedTransitionToSearchLayoutState:(int64_t)a3
{
  if (a3 == 2)
  {
    _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
    -[_UISearchBarVisualProviderBase freezeForAnimatedTransitionToSearchLayoutState:](self->_visualProvider, "freezeForAnimatedTransitionToSearchLayoutState:", 2);
  }
}

- (void)_animateTransitionToSearchLayoutState:(int64_t)a3
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  -[_UISearchBarVisualProviderBase animateTransitionToSearchLayoutState:](self->_visualProvider, "animateTransitionToSearchLayoutState:", a3);
}

- (void)_completeTransitionToSearchLayoutState:(int64_t)a3
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  -[_UISearchBarVisualProviderBase completeTransitionToSearchLayoutState:](self->_visualProvider, "completeTransitionToSearchLayoutState:", a3);
}

- (void)_cancelTransitionToSearchLayoutState:(int64_t)a3
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  -[_UISearchBarVisualProviderBase cancelTransitionToSearchLayoutState:](self->_visualProvider, "cancelTransitionToSearchLayoutState:", a3);
}

- (void)_growToSearchFieldIfNecessary
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  -[_UISearchBarVisualProviderBase growToSearchFieldIfNecessary](self->_visualProvider, "growToSearchFieldIfNecessary");
}

- (void)_shrinkToButtonIfNecessary
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  -[_UISearchBarVisualProviderBase shrinkToButtonIfNecessary](self->_visualProvider, "shrinkToButtonIfNecessary");
}

- (void)_searchButtonAction:(id)a3
{
  void *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  -[UISearchBar _searchController](self, "_searchController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UISearchBar _shrinkToButtonIfNecessary](self, "_shrinkToButtonIfNecessary");
    -[_UISearchBarVisualProviderBase setRequiresSearchTextField:](self->_visualProvider, "setRequiresSearchTextField:", 1);
    -[UISearchBar becomeFirstResponder](self, "becomeFirstResponder");
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "searchButtonAction not properly implemented when there's no search controller", buf, 2u);
      }

    }
    else
    {
      v5 = _searchButtonAction____s_category;
      if (!_searchButtonAction____s_category)
      {
        v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&_searchButtonAction____s_category);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "searchButtonAction not properly implemented when there's no search controller", v8, 2u);
      }
    }
    -[UISearchBar _growToSearchFieldIfNecessary](self, "_growToSearchFieldIfNecessary");
  }
}

- (void)_navigationBarSlideTransitionWillBegin
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  -[_UISearchBarVisualProviderBase navigationBarSlideTransitionWillBegin](self->_visualProvider, "navigationBarSlideTransitionWillBegin");
}

- (void)_navigationBarSlideTransitionDidEnd
{
  _confirmIOSorVisionOSVisualProvider(self->_visualProvider);
  -[_UISearchBarVisualProviderBase navigationBarSlideTransitionDidEnd](self->_visualProvider, "navigationBarSlideTransitionDidEnd");
}

- (double)_barHeightForBarMetrics:(int64_t)a3
{
  double result;

  -[_UISearchBarVisualProviderBase barHeightForBarMetrics:](self->_visualProvider, "barHeightForBarMetrics:", a3);
  return result;
}

- (double)_barHeightForBarMetrics:(int64_t)a3 barPosition:(int64_t)a4
{
  double result;

  -[_UISearchBarVisualProviderBase barHeightForBarMetrics:barPosition:](self->_visualProvider, "barHeightForBarMetrics:barPosition:", a3, a4);
  return result;
}

- (double)_defaultHeight
{
  double result;

  -[UISearchBar _defaultHeightForOrientation:](self, "_defaultHeightForOrientation:", -[UISearchBar _expectedInterfaceOrientation](self, "_expectedInterfaceOrientation"));
  return result;
}

- (double)_defaultHeightForOrientation:(int64_t)a3
{
  double result;

  -[_UISearchBarVisualProviderBase defaultHeightForOrientation:](self->_visualProvider, "defaultHeightForOrientation:", a3);
  return result;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UISearchBarVisualProviderBase intrinsicContentSize](self->_visualProvider, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_setShowsSeparator:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setShowsSeparator:](self->_visualProvider, "setShowsSeparator:", a3);
}

- (void)bringSubviewToFront:(id)a3
{
  UISearchBar *v4;
  UISearchBar *v5;
  UISearchBar *v6;
  objc_super v7;

  v4 = (UISearchBar *)a3;
  -[UISearchBar _viewForChildViews](self, "_viewForChildViews");
  v5 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self || v5 == v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)UISearchBar;
    -[UIView bringSubviewToFront:](&v7, sel_bringSubviewToFront_, v4);
  }
  else
  {
    -[UISearchBar bringSubviewToFront:](v5, "bringSubviewToFront:", v4);
  }

}

- (void)sendSubviewToBack:(id)a3
{
  UISearchBar *v4;
  UISearchBar *v5;
  UISearchBar *v6;
  objc_super v7;

  v4 = (UISearchBar *)a3;
  -[UISearchBar _viewForChildViews](self, "_viewForChildViews");
  v5 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self || v5 == v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)UISearchBar;
    -[UIView sendSubviewToBack:](&v7, sel_sendSubviewToBack_, v4);
  }
  else
  {
    -[UISearchBar sendSubviewToBack:](v5, "sendSubviewToBack:", v4);
  }

}

- (double)_scopeBarHeight
{
  double result;

  -[_UISearchBarVisualProviderBase scopeBarHeight](self->_visualProvider, "scopeBarHeight");
  return result;
}

- (BOOL)isLookToDictateEnabled
{
  return 0;
}

- (id)_makeShadowView
{
  void *v3;

  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("No UISearchDisplayController support methods should run on this version of iOS"));
    v3 = 0;
  }
  else
  {
    -[_UISearchBarVisualProviderBase makeShadowView](self->_visualProvider, "makeShadowView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_setShadowVisibleIfNecessary:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setShadowVisibleIfNecessary:](self->_visualProvider, "setShadowVisibleIfNecessary:", a3);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[8];
  uint64_t v13;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v13 = 0;
  -[_UISearchBarVisualProviderBase getOverrideContentInsets:overriddenEdges:](self->_visualProvider, "getOverrideContentInsets:overriddenEdges:", 0, &v13);
  if (!v13)
    goto LABEL_2;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Setting SPI contentInset after using overrideContentInsets SPI is not allowed. This is an app bug. Use one or the other, not both.", buf, 2u);
    }

  }
  else
  {
    v8 = setContentInset____s_category;
    if (!setContentInset____s_category)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&setContentInset____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Setting SPI contentInset after using overrideContentInsets SPI is not allowed. This is an app bug. Use one or the other, not both.", v11, 2u);
    }
  }
  if (!v13)
LABEL_2:
    -[_UISearchBarVisualProviderBase setMinimumContentInset:](self->_visualProvider, "setMinimumContentInset:", top, left, bottom, right);
}

- (UIEdgeInsets)contentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[_UISearchBarVisualProviderBase minimumContentInset](self->_visualProvider, "minimumContentInset");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_getOverrideContentInsets:(UIEdgeInsets *)a3 overriddenEdges:(unint64_t *)a4
{
  -[_UISearchBarVisualProviderBase getOverrideContentInsets:overriddenEdges:](self->_visualProvider, "getOverrideContentInsets:overriddenEdges:", a3, a4);
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchBar;
  -[UIView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[UISearchBar _updateEffectiveContentInset](self, "_updateEffectiveContentInset");
}

- (void)_containerSafeAreaInsetsDidChange:(id)a3
{
  _UISearchBarVisualProviderBase *visualProvider;
  id v5;

  v5 = a3;
  if (!-[UISearchBar _usesLegacyVisualProvider](self, "_usesLegacyVisualProvider")
    && -[_UISearchBarVisualProviderBase barPosition](self->_visualProvider, "barPosition") == 3)
  {
    visualProvider = self->_visualProvider;
    objc_msgSend(v5, "safeAreaInsets");
    -[_UISearchBarVisualProviderBase setBackgroundExtension:](visualProvider, "setBackgroundExtension:");
  }

}

- (UIEdgeInsets)_effectiveContentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[_UISearchBarVisualProviderBase effectiveContentInset](self->_visualProvider, "effectiveContentInset");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_scopeBarIsVisible
{
  return -[_UISearchBarVisualProviderBase scopeBarIsVisible](self->_visualProvider, "scopeBarIsVisible");
}

- (UIEdgeInsets)_scopeBarInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[_UISearchBarVisualProviderBase scopeBarInsets](self->_visualProvider, "scopeBarInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setScopeButtonTitles:(NSArray *)scopeButtonTitles
{
  -[_UISearchBarVisualProviderBase setScopeTitles:](self->_visualProvider, "setScopeTitles:", scopeButtonTitles);
}

- (void)setSelectedScopeButtonIndex:(NSInteger)selectedScopeButtonIndex
{
  int64_t v5;

  v5 = -[_UISearchBarVisualProviderBase selectedScope](self->_visualProvider, "selectedScope");
  -[_UISearchBarVisualProviderBase setSelectedScope:](self->_visualProvider, "setSelectedScope:", selectedScopeButtonIndex);
  if (v5 != selectedScopeButtonIndex)
    -[_UISearchBarVisualProviderBase updateScopeBarForSelectedScope](self->_visualProvider, "updateScopeBarForSelectedScope");
}

- (void)_setScopeBarHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[_UISearchBarVisualProviderBase scopeBarContainerView](self->_visualProvider, "scopeBarContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  -[UISearchBar _searchController](self, "_searchController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_searchBarDidUpdateScopeBar:", self);

}

- (void)_setScopeBarPosition:(unint64_t)a3
{
  id v4;

  -[_UISearchBarVisualProviderBase setScopeBarPosition:](self->_visualProvider, "setScopeBarPosition:", a3);
  -[UISearchBar _searchController](self, "_searchController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_searchBarDidUpdateScopeBar:", self);

}

- (unint64_t)_scopeBarPosition
{
  return -[_UISearchBarVisualProviderBase scopeBarPosition](self->_visualProvider, "scopeBarPosition");
}

- (void)_presentScopeBarIfNecessary
{
  void *v3;
  uint64_t v4;
  int has_internal_diagnostics;
  BOOL v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  -[_UISearchBarVisualProviderBase scopeTitles](self->_visualProvider, "scopeTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v6 = -[UISearchBar _usesLegacyVisualProvider](self, "_usesLegacyVisualProvider");
    if (has_internal_diagnostics)
    {
      if (!v6)
      {
        __UIFaultDebugAssertLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Legacy search bar path only. This is a UIKit bug.", buf, 2u);
        }

      }
    }
    else if (!v6)
    {
      v8 = _presentScopeBarIfNecessary___s_category;
      if (!_presentScopeBarIfNecessary___s_category)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&_presentScopeBarIfNecessary___s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Legacy search bar path only. This is a UIKit bug.", v10, 2u);
      }
    }
    -[UISearchBar _setShowsScopeBar:animateOpacity:](self, "_setShowsScopeBar:animateOpacity:", 1, +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"));
  }
}

- (void)_dismissScopeBarIfNecessary
{
  void *v3;
  uint64_t v4;
  int has_internal_diagnostics;
  BOOL v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  -[_UISearchBarVisualProviderBase scopeTitles](self->_visualProvider, "scopeTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v6 = -[UISearchBar _usesLegacyVisualProvider](self, "_usesLegacyVisualProvider");
    if (has_internal_diagnostics)
    {
      if (!v6)
      {
        __UIFaultDebugAssertLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Legacy search bar path only. This is a UIKit bug.", buf, 2u);
        }

      }
    }
    else if (!v6)
    {
      v8 = _dismissScopeBarIfNecessary___s_category;
      if (!_dismissScopeBarIfNecessary___s_category)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&_dismissScopeBarIfNecessary___s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Legacy search bar path only. This is a UIKit bug.", v10, 2u);
      }
    }
    -[UISearchBar _setShowsScopeBar:animateOpacity:](self, "_setShowsScopeBar:animateOpacity:", 0, +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"));
  }
}

- (void)_setShowsScopeBar:(BOOL)a3 animateOpacity:(BOOL)a4
{
  -[_UISearchBarVisualProviderBase setShowsScopeBar:animateOpacity:](self->_visualProvider, "setShowsScopeBar:animateOpacity:", a3, a4);
}

- (void)setShowsScopeBar:(BOOL)showsScopeBar
{
  -[UISearchBar _setShowsScopeBar:animateOpacity:](self, "_setShowsScopeBar:animateOpacity:", showsScopeBar, 0);
}

- (BOOL)showsScopeBar
{
  return -[_UISearchBarVisualProviderBase showsScopeBar](self->_visualProvider, "showsScopeBar");
}

- (void)_setDeferredAutomaticShowsScopeBarInNavigationBar:(id)a3 hasContent:(BOOL)a4
{
  -[_UISearchBarVisualProviderBase setDeferredAutomaticShowsScopeBarInNavigationBar:hasContent:](self->_visualProvider, "setDeferredAutomaticShowsScopeBarInNavigationBar:hasContent:", a3, a4);
}

- (void)_scopeChanged:(id)a3
{
  -[UISearchBar _scopeIndexChanged:](self, "_scopeIndexChanged:", objc_msgSend(a3, "selectedSegmentIndex"));
}

- (void)_scopeIndexChanged:(int64_t)a3
{
  void *v5;
  _BYTE *v6;
  id WeakRetained;

  if (-[_UISearchBarVisualProviderBase selectedScope](self->_visualProvider, "selectedScope") != a3)
  {
    -[_UISearchBarVisualProviderBase setSelectedScope:](self->_visualProvider, "setSelectedScope:", a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "searchBar:selectedScopeButtonIndexDidChange:", self, a3);
    -[_UISearchBarVisualProviderBase searchDisplayController](self->_visualProvider, "searchDisplayController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchBar:selectedScopeButtonIndexDidChange:", self, a3);

    -[UISearchController _searchBar:selectedScopeButtonIndexDidChange:](self->__searchController, "_searchBar:selectedScopeButtonIndexDidChange:", self, a3);
    if (!self->__searchController)
    {
      -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
      v6 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      -[UISearchTextField _clearSearchSuggestionsIfNecessary](v6);

    }
  }
}

- (id)_scopeBarContainerView
{
  return -[_UISearchBarVisualProviderBase scopeBarContainerView](self->_visualProvider, "scopeBarContainerView");
}

- (void)_updateBackgroundToBackdropStyle:(int64_t)a3
{
  -[_UISearchBarVisualProviderBase updateBackgroundToBackdropStyle:](self->_visualProvider, "updateBackgroundToBackdropStyle:", a3);
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[_UISearchBarVisualProviderBase searchField](self->_visualProvider, "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "canBecomeFocused")
    && (-[UIView traitCollection](self, "traitCollection"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "userInterfaceIdiom"),
        v4,
        v5 == 3))
  {
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)preferredFocusedView
{
  return -[_UISearchBarVisualProviderBase searchField](self->_visualProvider, "searchField");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UISearchBar;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v19, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 3)
  {
    -[_UISearchBarVisualProviderBase searchField](self->_visualProvider, "searchField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextFocusedView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 == v9)
    {
      objc_msgSend(v11, "setCornerRadius:", 6.0);

      objc_msgSend(v9, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor externalSystemTealColor](UIColor, "externalSystemTealColor");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v17, "setBorderColor:", objc_msgSend(v18, "CGColor"));

      objc_msgSend(v9, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = 1.0;
    }
    else
    {
      objc_msgSend(v11, "setCornerRadius:", 0.0);

      objc_msgSend(v9, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBorderColor:", 0);

      objc_msgSend(v9, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = 0.0;
    }
    objc_msgSend(v14, "setBorderWidth:", v16);

  }
}

- (void)_setDisableFocus:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchField](self->_visualProvider, "searchField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setDisableFocus:", v3);

}

- (void)setFocusGroupIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFocusGroupIdentifier:", v4);

}

- (id)focusGroupIdentifier
{
  void *v2;
  void *v3;

  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
  -[_UISearchBarVisualProviderBase setBarTintColor:forceUpdate:](self->_visualProvider, "setBarTintColor:forceUpdate:", barTintColor, 0);
}

- (UIColor)barTintColor
{
  return -[_UISearchBarVisualProviderBase barTintColor](self->_visualProvider, "barTintColor");
}

- (void)setBackgroundImage:(id)a3 forBarMetrics:(int64_t)a4
{
  void *v7;
  id v8;

  v8 = a3;
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Note: -[UISearchBar %@] is deprecated, please use setBackgroundImage:forBarPosition:barMetrics: instead."), v7);

  -[UISearchBar setBackgroundImage:forBarPosition:barMetrics:](self, "setBackgroundImage:forBarPosition:barMetrics:", v8, 2, a4);
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics
{
  UIImage *v8;
  __CFString *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  UIImage *v13;

  v8 = backgroundImage;
  if (barMetrics != UIBarMetricsCompactPrompt && barMetrics != UIBarMetricsCompact)
  {
    if (barPosition == 4)
    {
      if ((byte_1ECD7B47C & 1) != 0)
        goto LABEL_14;
      byte_1ECD7B47C = 1;
      v10 = "UIBarPositionBottomAttached";
    }
    else
    {
      if (barPosition != UIBarPositionBottom)
      {
        v13 = v8;
        -[_UISearchBarVisualProviderBase setBackgroundImage:forBarPosition:barMetrics:](self->_visualProvider, "setBackgroundImage:forBarPosition:barMetrics:", v8, barPosition, barMetrics);
        goto LABEL_13;
      }
      if ((byte_1ECD7B47B & 1) != 0)
        goto LABEL_14;
      byte_1ECD7B47B = 1;
      v10 = "UIBarPositionBottom";
    }
    v11 = v10;
    v9 = CFSTR("%s customization of %@ for %s is ignored.");
    goto LABEL_12;
  }
  if ((byte_1ECD7B47A & 1) == 0)
  {
    byte_1ECD7B47A = 1;
    v11 = "UIBarMetricsCompact";
    v12 = "UIBarMetricsCompactPrompt";
    v9 = CFSTR("%s customization of %@ for %s or %s is ignored.");
LABEL_12:
    v13 = v8;
    NSLog(&v9->isa, "UISearchBar", CFSTR("background image"), v11, v12);
LABEL_13:
    v8 = v13;
  }
LABEL_14:

}

- (UIImage)backgroundImageForBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics
{
  const char *v4;
  void *v5;

  if (barMetrics == UIBarMetricsCompactPrompt || barMetrics == UIBarMetricsCompact)
  {
    if ((byte_1ECD7B47D & 1) == 0)
    {
      byte_1ECD7B47D = 1;
      NSLog(CFSTR("%s customization of %@ for %s or %s is ignored."), a2, barPosition, "UISearchBar", CFSTR("background image"), "UIBarMetricsCompact", "UIBarMetricsCompactPrompt");
    }
    goto LABEL_12;
  }
  if (barPosition == 4)
  {
    if ((byte_1ECD7B47F & 1) == 0)
    {
      byte_1ECD7B47F = 1;
      v4 = "UIBarPositionBottomAttached";
      goto LABEL_11;
    }
  }
  else
  {
    if (barPosition != UIBarPositionBottom)
    {
      -[_UISearchBarVisualProviderBase backgroundImageForBarPosition:barMetrics:](self->_visualProvider, "backgroundImageForBarPosition:barMetrics:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return (UIImage *)v5;
    }
    if ((byte_1ECD7B47E & 1) == 0)
    {
      byte_1ECD7B47E = 1;
      v4 = "UIBarPositionBottom";
LABEL_11:
      NSLog(CFSTR("%s customization of %@ for %s is ignored."), a2, barPosition, "UISearchBar", CFSTR("background image"), v4);
    }
  }
LABEL_12:
  v5 = 0;
  return (UIImage *)v5;
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
  -[UISearchBar setBackgroundImage:forBarPosition:barMetrics:](self, "setBackgroundImage:forBarPosition:barMetrics:", backgroundImage, 2, 0);
}

- (UIImage)backgroundImage
{
  void *v2;
  void *v3;

  -[_UISearchBarVisualProviderBase searchBarBackground](self->_visualProvider, "searchBarBackground");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (id)_separatorImage
{
  return -[_UISearchBarVisualProviderBase separatorImage](self->_visualProvider, "separatorImage");
}

- (void)_setSeparatorImage:(id)a3
{
  -[_UISearchBarVisualProviderBase setSeparatorImage:](self->_visualProvider, "setSeparatorImage:", a3);
}

- (void)setSearchFieldBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state
{
  -[_UISearchBarVisualProviderBase setSearchFieldBackgroundImage:forState:](self->_visualProvider, "setSearchFieldBackgroundImage:forState:", backgroundImage, state);
}

- (UIImage)searchFieldBackgroundImageForState:(UIControlState)state
{
  return (UIImage *)-[_UISearchBarVisualProviderBase searchFieldBackgroundImageForState:](self->_visualProvider, "searchFieldBackgroundImageForState:", state);
}

- (void)setImage:(UIImage *)iconImage forSearchBarIcon:(UISearchBarIcon)icon state:(UIControlState)state
{
  -[_UISearchBarVisualProviderBase setImage:forSearchBarIcon:state:](self->_visualProvider, "setImage:forSearchBarIcon:state:", iconImage, icon, state);
}

- (UIImage)imageForSearchBarIcon:(UISearchBarIcon)icon state:(UIControlState)state
{
  return (UIImage *)-[_UISearchBarVisualProviderBase imageForSearchBarIcon:state:](self->_visualProvider, "imageForSearchBarIcon:state:", icon, state);
}

- (void)setScopeBarBackgroundImage:(UIImage *)scopeBarBackgroundImage
{
  -[_UISearchBarVisualProviderBase setScopeBarBackgroundImage:](self->_visualProvider, "setScopeBarBackgroundImage:", scopeBarBackgroundImage);
}

- (UIImage)scopeBarBackgroundImage
{
  return -[_UISearchBarVisualProviderBase scopeBarBackgroundImage](self->_visualProvider, "scopeBarBackgroundImage");
}

- (void)setScopeBarButtonBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state
{
  uint64_t v6;
  UIImage *v7;

  v7 = backgroundImage;
  -[_UISearchBarVisualProviderBase scopeBar](self->_visualProvider, "scopeBar");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v6)
  {
    -[_UISearchBarVisualProviderBase setUpScopeBar](self->_visualProvider, "setUpScopeBar");
    objc_msgSend((id)v6, "_setBackgroundImage:forState:barMetrics:", v7, state, 0);
  }

}

- (UIImage)scopeBarButtonBackgroundImageForState:(UIControlState)state
{
  void *v4;
  void *v5;

  -[_UISearchBarVisualProviderBase scopeBar](self->_visualProvider, "scopeBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundImageForState:barMetrics:", state, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v5;
}

- (void)setScopeBarButtonDividerImage:(UIImage *)dividerImage forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState
{
  uint64_t v8;
  UIImage *v9;

  v9 = dividerImage;
  -[_UISearchBarVisualProviderBase scopeBar](self->_visualProvider, "scopeBar");
  v8 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v9 | v8)
  {
    -[_UISearchBarVisualProviderBase setUpScopeBar](self->_visualProvider, "setUpScopeBar");
    objc_msgSend((id)v8, "_setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", v9, leftState, rightState, 0);
  }

}

- (UIImage)scopeBarButtonDividerImageForLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState
{
  void *v6;
  void *v7;

  -[_UISearchBarVisualProviderBase scopeBar](self->_visualProvider, "scopeBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dividerImageForLeftSegmentState:rightSegmentState:barMetrics:", leftState, rightState, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v7;
}

- (void)setScopeBarButtonTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state
{
  uint64_t v6;
  NSDictionary *v7;

  v7 = attributes;
  -[_UISearchBarVisualProviderBase scopeBar](self->_visualProvider, "scopeBar");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)v7 | v6)
  {
    -[_UISearchBarVisualProviderBase setUpScopeBar](self->_visualProvider, "setUpScopeBar");
    objc_msgSend((id)v6, "_setTitleTextAttributes:forState:", v7, state);
  }

}

- (NSDictionary)scopeBarButtonTitleTextAttributesForState:(UIControlState)state
{
  void *v4;
  void *v5;

  -[_UISearchBarVisualProviderBase scopeBar](self->_visualProvider, "scopeBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleTextAttributesForState:", state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (void)setSearchFieldBackgroundPositionAdjustment:(UIOffset)searchFieldBackgroundPositionAdjustment
{
  -[_UISearchBarVisualProviderBase setSearchFieldBackgroundPositionAdjustment:](self->_visualProvider, "setSearchFieldBackgroundPositionAdjustment:", searchFieldBackgroundPositionAdjustment.horizontal, searchFieldBackgroundPositionAdjustment.vertical);
}

- (UIOffset)searchFieldBackgroundPositionAdjustment
{
  double v2;
  double v3;
  UIOffset result;

  -[_UISearchBarVisualProviderBase searchFieldBackgroundPositionAdjustment](self->_visualProvider, "searchFieldBackgroundPositionAdjustment");
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (void)setSearchTextPositionAdjustment:(UIOffset)searchTextPositionAdjustment
{
  CGFloat vertical;
  CGFloat horizontal;
  void *v5;
  void *v6;
  _QWORD v7[2];

  vertical = searchTextPositionAdjustment.vertical;
  horizontal = searchTextPositionAdjustment.horizontal;
  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(CGFloat *)v7 = horizontal;
  *(CGFloat *)&v7[1] = vertical;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v7, "{UIOffset=dd}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setSearchTextOffetValue:", v6);

}

- (UIOffset)searchTextPositionAdjustment
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

  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_searchTextOffsetValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "UIOffsetValue");
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

- (UIOffset)positionAdjustmentForSearchBarIcon:(UISearchBarIcon)icon
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIOffset result;

  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_offsetValueForIcon:", icon);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "UIOffsetValue");
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v7 = 0.0;
    v9 = 0.0;
  }

  v10 = v7;
  v11 = v9;
  result.vertical = v11;
  result.horizontal = v10;
  return result;
}

- (UIView)inputAccessoryView
{
  UIView *inputAccessoryView;
  objc_super v4;

  inputAccessoryView = self->_inputAccessoryView;
  if (inputAccessoryView)
    return inputAccessoryView;
  v4.receiver = self;
  v4.super_class = (Class)UISearchBar;
  -[UIResponder inputAccessoryView](&v4, sel_inputAccessoryView);
  return (UIView *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_ownsInputAccessoryView
{
  objc_super v3;

  if (self->_inputAccessoryView)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)UISearchBar;
  return -[UIResponder _ownsInputAccessoryView](&v3, sel__ownsInputAccessoryView);
}

- (UITextInputAssistantItem)inputAssistantItem
{
  void *v2;
  void *v3;

  -[UISearchBar searchField](self, "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputAssistantItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInputAssistantItem *)v3;
}

- (id)_searchDisplayControllerNavigationItem
{
  return -[_UISearchBarVisualProviderBase searchNavigationItem](self->_visualProvider, "searchNavigationItem");
}

- (id)_animatedAppearanceBarButtonItem
{
  return -[_UISearchBarVisualProviderBase animatedAppearanceBarButtonItem](self->_visualProvider, "animatedAppearanceBarButtonItem");
}

- (UIBarButtonItem)_searchIconBarButtonItem
{
  return -[_UISearchBarVisualProviderBase searchIconBarButtonItem](self->_visualProvider, "searchIconBarButtonItem");
}

- (void)_setRequiresSearchTextField:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setRequiresSearchTextField:](self->_visualProvider, "setRequiresSearchTextField:", a3);
}

- (BOOL)_requiresSearchTextField
{
  return -[_UISearchBarVisualProviderBase requiresSearchTextField](self->_visualProvider, "requiresSearchTextField");
}

- (BOOL)_activeSearchDeferringScopeBar
{
  return -[_UISearchBarVisualProviderBase isActiveSearchDeferringScopeBar](self->_visualProvider, "isActiveSearchDeferringScopeBar");
}

- (int64_t)_layoutState
{
  return -[_UISearchBarVisualProviderBase layoutState](self->_visualProvider, "layoutState");
}

- (double)_idealInlineWidthForLayoutState:(int64_t)a3
{
  double result;

  -[_UISearchBarVisualProviderBase idealInlineWidthForLayoutState:](self->_visualProvider, "idealInlineWidthForLayoutState:", a3);
  return result;
}

- (void)_setLeftInsetForInlineSearch:(double)a3
{
  -[_UISearchBarVisualProviderBase setLeftInsetForInlineSearch:](self->_visualProvider, "setLeftInsetForInlineSearch:", a3);
}

- (double)_leftInsetForInlineSearch
{
  double result;

  -[_UISearchBarVisualProviderBase leftInsetForInlineSearch](self->_visualProvider, "leftInsetForInlineSearch");
  return result;
}

- (void)_setRightInsetForInlineSearch:(double)a3
{
  -[_UISearchBarVisualProviderBase setRightInsetForInlineSearch:](self->_visualProvider, "setRightInsetForInlineSearch:", a3);
}

- (double)_rightInsetForInlineSearch
{
  double result;

  -[_UISearchBarVisualProviderBase rightInsetForInlineSearch](self->_visualProvider, "rightInsetForInlineSearch");
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[_UISearchBarVisualProviderBase isFrozenForDismissalCrossfade](self->_visualProvider, "isFrozenForDismissalCrossfade"))
  {
    -[UIView bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v12.receiver = self;
    v12.super_class = (Class)UISearchBar;
    -[UIView setBounds:](&v12, sel_setBounds_, x, y, width, height);
    -[_UISearchBarVisualProviderBase updateIfNecessaryForOldSize:](self->_visualProvider, "updateIfNecessaryForOldSize:", v9, v11);
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  if (!-[_UISearchBarVisualProviderBase isFrozenForDismissalCrossfade](self->_visualProvider, "isFrozenForDismissalCrossfade"))
  {
    v6.receiver = self;
    v6.super_class = (Class)UISearchBar;
    -[UIView setCenter:](&v6, sel_setCenter_, x, y);
  }
}

- (BOOL)_containedInNavigationPalette
{
  return -[_UISearchBarVisualProviderBase isInNavigationPalette](self->_visualProvider, "isInNavigationPalette");
}

- (void)_setBackgroundLayoutNeedsUpdate
{
  -[_UISearchBarVisualProviderBase setBackgroundLayoutNeedsUpdate](self->_visualProvider, "setBackgroundLayoutNeedsUpdate");
}

- (UISearchBarStyle)searchBarStyle
{
  return -[_UISearchBarVisualProviderBase searchBarStyle](self->_visualProvider, "searchBarStyle");
}

- (int64_t)_backdropStyle
{
  return -[_UISearchBarVisualProviderBase backdropStyle](self->_visualProvider, "backdropStyle");
}

- (id)_presentationBackgroundBlurEffectForTraitCollection:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (-[UISearchBar keyboardAppearance](self, "keyboardAppearance")
    && -[UISearchBar keyboardAppearance](self, "keyboardAppearance") != 10)
  {
    v5 = -[UISearchBar _hasDarkUIAppearance](self, "_hasDarkUIAppearance");
  }
  else
  {
    v5 = objc_msgSend(v4, "userInterfaceStyle") == 2;
  }
  if (v5)
    v6 = 4007;
  else
    v6 = 4002;
  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_hasDarkUIAppearance
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL result;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  v5 = -[UISearchBar keyboardAppearance](self, "keyboardAppearance");
  result = 0;
  if (v5 > 8)
  {
    if (v5 != 10)
    {
      if (v5 != 9)
        return result;
      return 1;
    }
    return v4 == 2;
  }
  if (!v5)
    return v4 == 2;
  if (v5 == 1)
    return 1;
  return result;
}

- (id)_textColor
{
  return -[_UISearchBarVisualProviderBase textColor](self->_visualProvider, "textColor");
}

- (void)_allowCursorToAppear:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase allowCursorToAppear:](self->_visualProvider, "allowCursorToAppear:", a3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UISearchBar *v4;
  UISearchBar *v5;
  void *v6;
  void *v7;
  BOOL v8;
  UISearchBar *v9;
  UISearchBar *v10;
  objc_super v12;

  v4 = self;
  v12.receiver = self;
  v12.super_class = (Class)UISearchBar;
  -[UIView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
  -[_UISearchBarVisualProviderBase searchBarClippingView](v4->_visualProvider, "searchBarClippingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v5 == 0;
  else
    v8 = 1;
  if (v8)
  {

LABEL_8:
    v4 = v5;
    goto LABEL_9;
  }
  -[_UISearchBarVisualProviderBase searchBarClippingView](v4->_visualProvider, "searchBarClippingView");
  v9 = (UISearchBar *)objc_claimAutoreleasedReturnValue();

  if (v5 != v9)
    goto LABEL_8;
LABEL_9:
  v10 = v4;

  return v10;
}

- (void)tappedSearchBar:(id)a3
{
  if (!-[UISearchBar isFirstResponder](self, "isFirstResponder", a3))
    -[UISearchBar becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)_updateInsetsForTableView:(id)a3
{
  double v4;

  if (a3)
    objc_msgSend(a3, "_indexBarExtentFromEdge");
  else
    v4 = 0.0;
  -[_UISearchBarVisualProviderBase setTableViewIndexWidth:](self->_visualProvider, "setTableViewIndexWidth:", v4);
  -[_UISearchBarVisualProviderBase updateEffectiveContentInset](self->_visualProvider, "updateEffectiveContentInset");
}

- (int64_t)searchFieldLeftViewMode
{
  return -[_UISearchBarVisualProviderBase searchFieldLeftViewMode](self->_visualProvider, "searchFieldLeftViewMode");
}

- (void)setSearchFieldLeftViewMode:(int64_t)a3
{
  -[_UISearchBarVisualProviderBase setSearchFieldLeftViewMode:](self->_visualProvider, "setSearchFieldLeftViewMode:", a3);
}

- (int64_t)_barMetricsForOrientation:(int64_t)a3
{
  return -[_UISearchBarVisualProviderBase barMetricsForOrientation:](self->_visualProvider, "barMetricsForOrientation:", a3);
}

- (BOOL)_shouldUseNavigationBarHeight
{
  return -[_UISearchBarVisualProviderBase isPlacedInNavigationBar](self->_visualProvider, "isPlacedInNavigationBar");
}

- (void)_setShowsDeleteButton:(BOOL)a3
{
  -[_UISearchBarVisualProviderBase setShowsDeleteButton:](self->_visualProvider, "setShowsDeleteButton:", a3);
}

- (id)_uiktest_placeholderLabelColor
{
  void *v2;
  void *v3;
  void *v4;

  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_placeholderLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)pretendsIsInBar
{
  return 0;
}

- (BOOL)_isInBarButNotHosted
{
  return -[_UISearchBarVisualProviderBase isInBarButNotHosted](self->_visualProvider, "isInBarButNotHosted");
}

- (void)_deleteButtonPressed
{
  id v2;

  -[_UISearchBarVisualProviderBase searchField](self->_visualProvider, "searchField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteBackward");

}

- (void)_setCancelButtonText:(id)a3
{
  -[_UISearchBarVisualProviderBase setCancelButtonText:](self->_visualProvider, "setCancelButtonText:", a3);
}

- (void)_setupCancelButton
{
  -[_UISearchBarVisualProviderBase setUpCancelButtonWithAppearance:](self->_visualProvider, "setUpCancelButtonWithAppearance:", 0);
}

- (void)_setupCancelButtonWithAppearance:(id)a3
{
  -[_UISearchBarVisualProviderBase setUpCancelButtonWithAppearance:](self->_visualProvider, "setUpCancelButtonWithAppearance:", a3);
}

- (void)_destroyCancelButton
{
  -[_UISearchBarVisualProviderBase destroyCancelButton](self->_visualProvider, "destroyCancelButton");
}

- (void)_cancelButtonPressed
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "searchBarCancelButtonClicked:", self);
  -[_UISearchBarVisualProviderBase searchDisplayController](self->_visualProvider, "searchDisplayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBarCancelButtonClicked:", self);

  -[UISearchController _searchBarCancelButtonClicked:](self->__searchController, "_searchBarCancelButtonClicked:", self);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BOOL v4;
  void *v5;
  objc_super v7;

  if (sel__cancelOperation_ == a3)
  {
    -[_UISearchBarVisualProviderBase cancelButton](self->_visualProvider, "cancelButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UISearchBar;
    return -[UIView canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
  return v4;
}

- (void)_cancelOperation:(id)a3
{
  void *v4;

  -[_UISearchBarVisualProviderBase cancelButton](self->_visualProvider, "cancelButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[UISearchBar _cancelButtonPressed](self, "_cancelButtonPressed");
}

- (void)_bookmarkButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "searchBarBookmarkButtonClicked:", self);

}

- (void)_resultsListButtonPressed
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "searchBarResultsListButtonClicked:", self);
  -[_UISearchBarVisualProviderBase searchDisplayController](self->_visualProvider, "searchDisplayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBarResultsListButtonClicked:", self);

}

- (void)_searchFieldBeginEditing
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "searchBarTextDidBeginEditing:", self);
  -[_UISearchBarVisualProviderBase searchDisplayController](self->_visualProvider, "searchDisplayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBarTextDidBeginEditing:", self);

  -[UISearchController _searchBarTextDidBeginEditing:](self->__searchController, "_searchBarTextDidBeginEditing:", self);
  -[_UISearchBarVisualProviderBase cancelButton](self->_visualProvider, "cancelButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

}

- (void)_searchFieldEndEditing
{
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "searchBarTextDidEndEditing:", self);
  v3 = -[_UISearchBarVisualProviderBase autoDisableCancelButton](self->_visualProvider, "autoDisableCancelButton") ^ 1;
  -[_UISearchBarVisualProviderBase cancelButton](self->_visualProvider, "cancelButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)_searchFieldReturnPressed
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "searchBarSearchButtonClicked:", self);
  -[_UISearchBarVisualProviderBase searchDisplayController](self->_visualProvider, "searchDisplayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBarSearchButtonClicked:", self);

  -[UISearchController _searchBarSearchButtonClicked:](self->__searchController, "_searchBarSearchButtonClicked:", self);
}

- (void)_searchFieldTextChanged:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  UISearchController *searchController;
  void *v10;
  id v11;

  v3 = a3;
  -[_UISearchBarVisualProviderBase searchField](self->_visualProvider, "searchField");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "searchText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "searchBar:textDidChange:", self, v6);

  }
  -[_UISearchBarVisualProviderBase searchDisplayController](self->_visualProvider, "searchDisplayController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchBar:textDidChange:", self, v8);

  searchController = self->__searchController;
  objc_msgSend(v11, "searchText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchController _searchBar:textDidChange:programatically:](searchController, "_searchBar:textDidChange:programatically:", self, v10, v3);

}

- (void)_searchFieldEditingChanged
{
  -[UISearchBar _searchFieldTextChanged:](self, "_searchFieldTextChanged:", 0);
}

- (void)_searchFieldSelectionChanged
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_searchBarSelectionChanged:", self);

}

- (void)_searchFieldTokensChanged
{
  -[UISearchController _searchBarTokensDidChange:](self->__searchController, "_searchBarTokensDidChange:", self);
}

- (void)insertTextSuggestion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UISearchController _delegateWantsInsertSearchFieldTextSuggestion](self->__searchController, "_delegateWantsInsertSearchFieldTextSuggestion"))
  {
    -[UISearchController _sendDelegateInsertSearchFieldTextSuggestion:](self->__searchController, "_sendDelegateInsertSearchFieldTextSuggestion:", v10);
  }
  else
  {
    -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_defaultInsertTextSuggestion:", v10);

  }
  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
    -[UISearchBar _searchFieldTextChanged:](self, "_searchFieldTextChanged:", 1);

}

- (BOOL)_disableAutomaticKeyboardUI
{
  void *v2;
  BOOL v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 3;

  return v3;
}

- (BOOL)_enableAutomaticKeyboardPressDone
{
  void *v2;
  BOOL v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 3;

  return v3;
}

- (void)reloadInputViews
{
  id v2;

  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadInputViews");

}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)canResignFirstResponder
{
  void *v2;
  char v3;

  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canResignFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v2;
  char v3;

  -[UISearchBar _searchBarTextField](self, "_searchBarTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resignFirstResponder");

  return v3;
}

- (void)_setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  -[_UISearchBarVisualProviderBase setEnabled:animated:](self->_visualProvider, "setEnabled:animated:", a3, a4);
}

- (id)_backgroundView
{
  return -[_UISearchBarVisualProviderBase searchBarBackground](self->_visualProvider, "searchBarBackground");
}

- (int64_t)_textInputSource
{
  void *v2;
  int64_t v3;

  -[_UISearchBarVisualProviderBase searchField](self->_visualProvider, "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_textInputSource");

  return v3;
}

- (double)_heightAllowanceForTopSearchBarInTitleViewLocation
{
  double result;

  -[_UISearchBarVisualProviderBase heightAllowanceForTopSearchBarInTitleViewLocation](self->_visualProvider, "heightAllowanceForTopSearchBarInTitleViewLocation");
  return result;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setInputAccessoryView:(UIView *)inputAccessoryView
{
  objc_storeStrong((id *)&self->_inputAccessoryView, inputAccessoryView);
}

- (_UISearchBarVisualProviderBase)_visualProvider
{
  return self->_visualProvider;
}

- (_UISearchBarSearchContainerLayoutCustomizationDelegate)_searchFieldContainerLayoutCustomizationDelegate
{
  return (_UISearchBarSearchContainerLayoutCustomizationDelegate *)objc_loadWeakRetained((id *)&self->_searchFieldContainerLayoutCustomizationDelegate);
}

- (BOOL)_forceCenteredPlaceholderLayout
{
  return self->__forceCenteredPlaceholderLayout;
}

- (void)set_forceCenteredPlaceholderLayout:(BOOL)a3
{
  self->__forceCenteredPlaceholderLayout = a3;
}

- (BOOL)_transplanting
{
  return self->__transplanting;
}

- (void)_setTransplanting:(BOOL)a3
{
  self->__transplanting = a3;
}

- (BOOL)_showsHelperPlaceholder
{
  return 0;
}

- (void)_setHelperPlaceholder:(id)a3
{
  -[_UISearchBarVisualProviderBase setHelperPlaceholder:](self->_visualProvider, "setHelperPlaceholder:", a3);
}

- (void)_setForceLegacyVisual:(BOOL)a3
{
  _UISearchBarVisualProviderBase *visualProvider;

  if (self->_forceLegacyVisual != a3)
  {
    self->_forceLegacyVisual = a3;
    -[_UISearchBarVisualProviderBase teardown](self->_visualProvider, "teardown");
    visualProvider = self->_visualProvider;
    self->_visualProvider = 0;

    -[UISearchBar _setUpVisualProvider](self, "_setUpVisualProvider");
  }
}

- (BOOL)_forceLegacyVisual
{
  return self->_forceLegacyVisual;
}

- (void)_setShowDictationDisplayInSearchBar:(BOOL)a3
{
  _confirmTVOSVisualProvider(self->_visualProvider);
}

- (BOOL)_showDictationDisplayInSearchBar
{
  _confirmTVOSVisualProvider(self->_visualProvider);
  return 0;
}

- (void)_setHelperPlaceholderOverride:(id)a3
{
  -[_UISearchBarVisualProviderBase setHelperPlaceholderOverride:](self->_visualProvider, "setHelperPlaceholderOverride:", a3);
}

- (id)_tokens
{
  void *v2;
  void *v3;

  -[UISearchBar searchField](self, "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_insertToken:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[UISearchBar searchField](self, "searchField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertToken:atIndex:", v6, a4);

  -[UISearchBar _searchFieldTextChanged:](self, "_searchFieldTextChanged:", 1);
}

- (void)_removeTokenAtIndex:(unint64_t)a3
{
  void *v5;

  -[UISearchBar searchField](self, "searchField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTokenAtIndex:", a3);

  -[UISearchBar _searchFieldTextChanged:](self, "_searchFieldTextChanged:", 1);
}

- (void)_replaceSearchTextWithToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[UISearchBar searchField](self, "searchField");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textualRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replaceTextualPortionOfRange:withToken:atIndex:", v5, v4, objc_msgSend(v6, "count"));

  -[UISearchBar _searchFieldTextChanged:](self, "_searchFieldTextChanged:", 1);
}

- (void)_setTokenBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISearchBar searchField](self, "searchField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTokenBackgroundColor:", v4);

}

- (id)_selectedTokens
{
  void *v2;
  void *v3;
  void *v4;

  -[UISearchBar searchField](self, "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tokensInRange:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)scribbleInteractionShouldDelayFocus:(id)a3
{
  return self->__searchController != 0;
}

- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3
{
  return 1;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6
{
  double result;
  objc_super v7;

  result = 0.0;
  if (a6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UISearchBar;
    -[UIView _autolayoutSpacingAtEdge:forAttribute:inContainer:isGuide:](&v7, sel__autolayoutSpacingAtEdge_forAttribute_inContainer_isGuide_, *(_QWORD *)&a3, a4, a5, 1, 0.0);
  }
  return result;
}

- (double)_defaultAutolayoutSpacing
{
  return 0.0;
}

@end
