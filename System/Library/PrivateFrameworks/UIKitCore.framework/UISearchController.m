@implementation UISearchController

- (BOOL)_hidesNavigationBarDuringPresentationRespectingInlineSearch
{
  return -[UISearchController searchBarPlacement](self, "searchBarPlacement") == UINavigationItemSearchBarPlacementStacked
      && -[UISearchController hidesNavigationBarDuringPresentation](self, "hidesNavigationBarDuringPresentation");
}

- (UINavigationItemSearchBarPlacement)searchBarPlacement
{
  id WeakRetained;
  UINavigationItemSearchBarPlacement v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
  if (objc_msgSend(WeakRetained, "_hasInlineSearchBar"))
    v3 = UINavigationItemSearchBarPlacementInline;
  else
    v3 = UINavigationItemSearchBarPlacementStacked;

  return v3;
}

- (BOOL)hidesNavigationBarDuringPresentation
{
  return (*((unsigned __int8 *)&self->_controllerFlags + 1) >> 2) & 1;
}

- (UINavigationItem)_navigationItemCurrentlyDisplayingSearchController
{
  return (UINavigationItem *)objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
}

- (BOOL)automaticallyShowsCancelButton
{
  return (*(_BYTE *)&self->_controllerFlags >> 4) & 1;
}

- (UIViewController)_currentActiveChildViewController
{
  _DWORD *v3;
  _UISearchSuggestionsListViewController *v4;
  _UISearchSuggestionsListViewController *v5;
  id WeakRetained;
  void *v7;
  void *v8;

  if (-[UISearchController isActive](self, "isActive"))
  {
    -[UISearchController searchResultsController](self, "searchResultsController");
    v3 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v3 && -[UISearchController showsSearchResultsController](self, "showsSearchResultsController"))
    {
      if (((v3[92] >> 1) & 3u) - 1 <= 1)
      {
        v4 = v3;
LABEL_16:
        v5 = v4;
        goto LABEL_18;
      }
      if (objc_msgSend(v3, "_appearState") == 3)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
        objc_msgSend(WeakRetained, "_navigationBar");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v8 && objc_msgSend(v8, "_appearState") == 3)
          {
            v5 = v3;

LABEL_18:
            return (UIViewController *)v5;
          }
        }
        else
        {

          v8 = 0;
        }

      }
    }
    if (!-[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self))
    {
      v5 = 0;
      goto LABEL_18;
    }
    v4 = self->_suggestionsListViewController;
    goto LABEL_16;
  }
  v5 = 0;
  return (UIViewController *)v5;
}

- (BOOL)isActive
{
  if (self)
  {
    if (self->super._parentModalViewController)
      LOBYTE(self) = !-[UISearchController isBeingDismissed](self, "isBeingDismissed");
    else
      LOBYTE(self) = 0;
  }
  return (char)self;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)_setNavigationItemCurrentlyDisplayingSearchController:(id)a3
{
  objc_storeWeak((id *)&self->__navigationItemCurrentlyDisplayingSearchController, a3);
}

- (UISearchController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  UISearchController *v4;
  UISearchController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISearchController;
  v4 = -[UIViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
    -[UISearchController _commonInit](v4, "_commonInit");
  return v5;
}

- (UISearchController)initWithSearchResultsController:(UIViewController *)searchResultsController
{
  UIViewController *v5;
  UISearchController *v6;
  UISearchController *v7;
  objc_super v9;
  objc_super v10;

  v5 = searchResultsController;
  if (dyld_program_sdk_at_least())
  {
    v10.receiver = self;
    v10.super_class = (Class)UISearchController;
    v6 = -[UIViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UISearchController;
    v6 = -[UIViewController init](&v9, sel_init);
  }
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchResultsController, searchResultsController);
    -[UISearchController _commonInit](v7, "_commonInit");
  }

  return v7;
}

- (void)_commonInit
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags;
  UISearchBar *v8;
  UISearchBar *v9;
  void *v10;
  void *v11;
  void *v12;
  id windowWillAnimateToken;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id location;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[UISearchController setModalPresentationStyle:](self, "setModalPresentationStyle:", 4);
  -[UIViewController setModalTransitionStyle:](self, "setModalTransitionStyle:", 2);
  -[UIViewController setTransitioningDelegate:](self, "setTransitioningDelegate:", self);
  -[UIViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 6)
    self->_obscuresBackgroundDuringPresentation = 1;
  else
    self->_obscuresBackgroundDuringPresentation = _UIBarsApplyChromelessEverywhere() ^ 1;
  *(_DWORD *)&self->_controllerFlags |= 0x400u;
  self->__previousSearchBarPosition = -1;
  self->__showResultsForEmptySearch = 0;
  *(_DWORD *)&self->_controllerFlags |= 0x80u;
  -[UIViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  controllerFlags = self->_controllerFlags;
  if (v6 != 6)
  {
    controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&controllerFlags | 0x10);
    self->_controllerFlags = controllerFlags;
  }
  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&controllerFlags | 0x1600000);
  -[UISearchController searchBar](self, "searchBar");
  v8 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = [UISearchBar alloc];
    v8 = -[UISearchBar initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    _UINSLocalizedStringWithDefaultValue(CFSTR("Search"), CFSTR("Search"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchBar setPlaceholder:](v8, "setPlaceholder:", v10);

  }
  -[UISearchController _connectSearchBar:](self, "_connectSearchBar:", v8);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __33__UISearchController__commonInit__block_invoke;
  v23 = &unk_1E16B22E0;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("UIWindowWillAnimateRotationNotification"), 0, 0, &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  windowWillAnimateToken = self->_windowWillAnimateToken;
  self->_windowWillAnimateToken = v12;

  v26[0] = 0x1E1A99498;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1, v20, v21, v22, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[UIViewController _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v14, self, sel__setupForCurrentTraitCollection);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_applicationWillEnterForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObserver:selector:name:object:", self, sel_applicationWillResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)setModalPresentationStyle:(int64_t)a3
{
  BOOL v6;
  objc_super v7;

  if (self->_searchResultsController)
  {
    if (!a3)
      return;
  }
  else
  {
    if (!a3)
      return;
    if (a3 == 7 || a3 == 2)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Presenting UISearchController in a popover or form sheet while reusing the search origin as the search results destination makes little sense. Initialize UISearchController with a proper search results controller to present as a popover or in a form sheet."));
  }
  if ((unint64_t)a3 > 7 || ((1 << a3) & 0x94) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("UISearchController currently only supports UIModalPresentationCustom, UIModalPresentationPopover and UIModalPresentationFormSheet presentation styles"));
  v6 = a3 == 7 || a3 == 2;
  self->__showResultsForEmptySearch = v6;
  v7.receiver = self;
  v7.super_class = (Class)UISearchController;
  -[UIViewController setModalPresentationStyle:](&v7, sel_setModalPresentationStyle_, a3);
}

- (void)_connectSearchBar:(id)a3
{
  UISearchBar *v5;
  UISearchBar **p_searchBar;
  UISearchBar *searchBar;
  void *v8;
  _UISearchSuggestionController *v9;
  _UISearchSuggestionController *suggestionController;
  UISearchBar *v11;
  CGRect v12;

  v5 = (UISearchBar *)a3;
  p_searchBar = &self->_searchBar;
  searchBar = self->_searchBar;
  if (searchBar != v5)
  {
    v11 = v5;
    -[UISearchBar _setSearchController:](searchBar, "_setSearchController:", 0);
    objc_storeStrong((id *)&self->_searchBar, a3);
    -[UISearchBar _setSearchController:](*p_searchBar, "_setSearchController:", self);
    -[UISearchBar _setAutoDisableCancelButton:](*p_searchBar, "_setAutoDisableCancelButton:", 0);
    -[UIView frame](*p_searchBar, "frame");
    if (CGRectEqualToRect(v12, *MEMORY[0x1E0C9D648]))
      -[UIView sizeToFit](*p_searchBar, "sizeToFit");
    -[UISearchBar searchTextField](*p_searchBar, "searchTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_suggestionController");
    v9 = (_UISearchSuggestionController *)objc_claimAutoreleasedReturnValue();
    suggestionController = self->_suggestionController;
    self->_suggestionController = v9;

    v5 = v11;
  }

}

- (void)setObscuresBackgroundDuringPresentation:(BOOL)obscuresBackgroundDuringPresentation
{
  self->_obscuresBackgroundDuringPresentation = obscuresBackgroundDuringPresentation;
}

- (void)setSearchResultsUpdater:(id)searchResultsUpdater
{
  objc_storeWeak((id *)&self->_searchResultsUpdater, searchResultsUpdater);
}

- (void)applicationDidBecomeActive:(id)a3
{
  *(_DWORD *)&self->_controllerFlags |= 0x200000u;
}

- (void)_searchBarSuperviewChanged
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;

  -[UISearchController searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UISearchController searchBar](self, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "tableHeaderView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchController searchBar](self, "searchBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      *(_DWORD *)&self->_controllerFlags |= 1u;
      -[UISearchController searchBar](self, "searchBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setShowsSeparator:", 0);

      -[UISearchController searchBar](self, "searchBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_updateInsetsForTableView:", v7);

      if ((objc_msgSend(v7, "_usingCustomBackgroundView") & 1) == 0)
      {
        +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.937254902, 0.937254902, 0.956862745, 1.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTableHeaderBackgroundColor:", v12);

      }
      -[UISearchController _updateTableHeaderBackgroundViewInTableView:amountScrolledUnder:](self, "_updateTableHeaderBackgroundViewInTableView:amountScrolledUnder:", v7, 0.0);
      -[UISearchController _watchScrollView:forScrolling:](self, "_watchScrollView:forScrolling:", v7, 1);
    }

  }
  else if ((*(_BYTE *)&self->_controllerFlags & 1) != 0)
  {
    if (!-[UIViewController isBeingPresented](self, "isBeingPresented"))
    {
      -[UISearchController searchBar](self, "searchBar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_setShowsSeparator:", 0);

      -[UISearchController searchBar](self, "searchBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_updateInsetsForTableView:", 0);

    }
    -[UISearchController _watchScrollView:forScrolling:](self, "_watchScrollView:forScrolling:", 0, 0);
  }
  -[UIViewController traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16 == 3)
  {
    -[UISearchController searchBar](self, "searchBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "searchField");
    v21 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "window");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      -[UISystemInputViewController persistentDelegate](self->_systemInputViewController, "persistentDelegate");
      v20 = (id)objc_claimAutoreleasedReturnValue();

      if (v21 == v20)
        -[UISystemInputViewController reloadInputViewsForPersistentDelegate](self->_systemInputViewController, "reloadInputViewsForPersistentDelegate");
    }

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  UISystemInputViewController *systemInputViewController;
  UIView *leftDividerView;
  UIView *rightDividerView;
  UIFocusContainerGuide *scopeBarFocusContainerGuide;
  _UISearchSuggestionController *suggestionController;
  UIView *suggestionContainerView;
  _UISearchControllerTVKeyboardContainerView *tvKeyboardContainerView;
  _UISearchControllerDidScrollDelegate *didScrollDelegate;
  void *v14;
  objc_super v15;
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_windowWillAnimateToken);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("UIApplicationWillEnterForegroundNotification");
  v16[1] = CFSTR("UIApplicationDidBecomeActiveNotification");
  v16[2] = CFSTR("UIApplicationWillResignActiveNotification");
  v16[3] = CFSTR("UIApplicationDidEnterBackgroundNotification");
  v16[4] = 0x1E1712780;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  -[UISearchController _uninstallBackGestureRecognizer](self, "_uninstallBackGestureRecognizer");
  -[UISearchController _uninstallDoneGestureRecognizer](self, "_uninstallDoneGestureRecognizer");
  -[UISystemInputViewController prepareForRelease](self->_systemInputViewController, "prepareForRelease");
  -[UISystemInputViewController resetContainingResponder](self->_systemInputViewController, "resetContainingResponder");
  systemInputViewController = self->_systemInputViewController;
  self->_systemInputViewController = 0;

  -[UISearchBar _setSearchController:](self->_searchBar, "_setSearchController:", 0);
  -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", 0);
  leftDividerView = self->__leftDividerView;
  self->__leftDividerView = 0;

  rightDividerView = self->__rightDividerView;
  self->__rightDividerView = 0;

  scopeBarFocusContainerGuide = self->__scopeBarFocusContainerGuide;
  self->__scopeBarFocusContainerGuide = 0;

  suggestionController = self->_suggestionController;
  self->_suggestionController = 0;

  suggestionContainerView = self->__suggestionContainerView;
  self->__suggestionContainerView = 0;

  tvKeyboardContainerView = self->__tvKeyboardContainerView;
  self->__tvKeyboardContainerView = 0;

  didScrollDelegate = self->_didScrollDelegate;
  if (didScrollDelegate)
  {
    -[_UISearchControllerDidScrollDelegate scrollView](didScrollDelegate, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_removeScrollViewScrollObserver:", self->_didScrollDelegate);

  }
  -[UISearchController _removeCarPlayLimitedUIObserver](self, "_removeCarPlayLimitedUIObserver");
  v15.receiver = self;
  v15.super_class = (Class)UISearchController;
  -[UIViewController dealloc](&v15, sel_dealloc);
}

- (void)_uninstallDoneGestureRecognizer
{
  void *v3;
  UITapGestureRecognizer *doneButtonGestureRecognizer;

  -[UIViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_doneButtonGestureRecognizer);

  doneButtonGestureRecognizer = self->_doneButtonGestureRecognizer;
  self->_doneButtonGestureRecognizer = 0;

}

- (void)_uninstallBackGestureRecognizer
{
  void *v3;
  UITapGestureRecognizer *backButtonDismissGestureRecognizer;

  -[UIViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_backButtonDismissGestureRecognizer);

  backButtonDismissGestureRecognizer = self->_backButtonDismissGestureRecognizer;
  self->_backButtonDismissGestureRecognizer = 0;

}

- (void)_removeCarPlayLimitedUIObserver
{
  void *v3;
  id v4;

  -[UISearchController _carPlayLimitedUIToken](self, "_carPlayLimitedUIToken");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", v4);

    -[UISearchController _setCarPlayLimitedUIToken:](self, "_setCarPlayLimitedUIToken:", 0);
  }

}

- (id)_carPlayLimitedUIToken
{
  return objc_getAssociatedObject(self, &kCarPlayLimitedUIWillAnimateTokenKey);
}

- (void)setHidesNavigationBarDuringPresentation:(BOOL)hidesNavigationBarDuringPresentation
{
  int v3;

  if (hidesNavigationBarDuringPresentation)
    v3 = 1024;
  else
    v3 = 0;
  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFBFF | v3);
}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  int v5;
  id obj;

  obj = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 8;
    else
      v5 = 0;
    self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFFF7 | v5);
    objc_storeWeak((id *)&self->_delegate, obj);
  }

}

- (void)setAutomaticallyShowsSearchResultsController:(BOOL)automaticallyShowsSearchResultsController
{
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags;
  int v5;
  _BOOL4 v6;
  int v7;

  if (automaticallyShowsSearchResultsController)
  {
    controllerFlags = self->_controllerFlags;
    v5 = 128;
  }
  else
  {
    v6 = -[UISearchController showsSearchResultsController](self, "showsSearchResultsController");
    v5 = 0;
    if (v6)
      v7 = 256;
    else
      v7 = 0;
    controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFEFF | v7);
    self->_controllerFlags = controllerFlags;
  }
  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&controllerFlags & 0xFFFFFF7F | v5);
  -[UISearchController _updateVisibilityOfSearchResultsForSearchBar:](self, "_updateVisibilityOfSearchResultsForSearchBar:", self->_searchBar);
}

- (void)_updateVisibilityOfSearchResultsForSearchBar:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int isSearchResultsControllerView;
  int isSuggestionsListViewControllerView;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  -[UIViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom") == 2)
    goto LABEL_4;
  -[UIViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceIdiom") == 8)
  {

LABEL_4:
LABEL_5:
    -[UIViewController view](self->_searchResultsController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 0);

    goto LABEL_6;
  }
  -[UIViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 3)
    goto LABEL_5;
  if (-[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationCustom)
  {
    isSearchResultsControllerView = -[UISearchController _isSearchResultsControllerViewUnhidden]((uint64_t)self);
    isSuggestionsListViewControllerView = -[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self);
    v11 = -[UISearchController _showsSearchResultsController](self, "_showsSearchResultsController") ^ 1;
    -[UIViewController view](self->_searchResultsController, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", v11);

    -[UISearchController _updateSearchSuggestionsListVisibilityShouldRequestNavigationControllerObservingUpdate:](self, "_updateSearchSuggestionsListVisibilityShouldRequestNavigationControllerObservingUpdate:", 0);
    v13 = isSuggestionsListViewControllerView ^ -[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self);
    v14 = -[UISearchController _isSearchResultsControllerViewUnhidden]((uint64_t)self);
    -[UISearchController _requestNavigationControllerObservingUpdateForSearchBar:visibilityChangedForSearchSuggestionsList:forSearchResultsController:](self, v20, v13, isSearchResultsControllerView ^ v14);
  }
  else
  {
    v15 = -[UISearchController _showsSearchResultsController](self, "_showsSearchResultsController") ^ 1;
    -[UIViewController view](self->_searchResultsController, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", v15);

    -[UISearchController _updateSearchSuggestionsListVisibilityShouldRequestNavigationControllerObservingUpdate:](self, "_updateSearchSuggestionsListVisibilityShouldRequestNavigationControllerObservingUpdate:", 0);
    -[UISearchController _searchPresentationController](self, "_searchPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentedView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      if (-[UISearchController _showsSearchResultsController](self, "_showsSearchResultsController"))
        v19 = 1;
      else
        v19 = -[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self);
      objc_msgSend(v17, "setContentVisible:", v19);
    }

  }
LABEL_6:

}

- (uint64_t)_isSuggestionsListViewControllerViewUnhidden
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1128), "_existingView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(*(id *)(v1 + 1128), "_existingView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = objc_msgSend(v3, "isHidden") ^ 1;

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (uint64_t)_isSearchResultsControllerViewUnhidden
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1160), "_existingView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(*(id *)(v1 + 1160), "_existingView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = objc_msgSend(v3, "isHidden") ^ 1;

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (void)_updateSearchSuggestionsListVisibilityShouldRequestNavigationControllerObservingUpdate:(BOOL)a3
{
  _BOOL4 v3;
  int isSuggestionsListViewControllerView;
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  UISearchBar *searchBar;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  isSuggestionsListViewControllerView = -[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self);
  controllerFlags = self->_controllerFlags;
  if ((*(_WORD *)&controllerFlags & 0xC000) != 0
    || (*(_WORD *)&controllerFlags & 0x1000) != 0
    || (WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController)) == 0
    || (v8 = WeakRetained,
        v9 = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController),
        v10 = objc_msgSend(v9, "_hasInlineSearchBar"),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    -[UISearchController _hideSearchSuggestionsList]((uint64_t)self);
    if (v3)
    {
LABEL_6:
      searchBar = self->_searchBar;
      v12 = isSuggestionsListViewControllerView ^ -[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self);
      -[UISearchController _requestNavigationControllerObservingUpdateForSearchBar:visibilityChangedForSearchSuggestionsList:forSearchResultsController:](self, searchBar, v12, 0);
    }
  }
  else
  {
    -[UISearchController _suggestionController](self, "_suggestionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "suggestions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (!v15
      || (-[UISearchController _isSearchResultsControllerViewUnhidden]((uint64_t)self) & 1) != 0
      || (*((_BYTE *)&self->_controllerFlags + 2) & 0xA) != 0)
    {
      -[UISearchController _hideSearchSuggestionsList]((uint64_t)self);
    }
    else
    {
      -[UISearchController _showSearchSuggestionsListIfApplicable]((uint64_t)self);
      -[_UISearchSuggestionsListViewController updateList](self->_suggestionsListViewController, "updateList");
    }
    *(_DWORD *)&self->_controllerFlags &= ~0x20000u;
    if (v3)
      goto LABEL_6;
  }
}

- (void)_hideSearchSuggestionsList
{
  id v1;

  objc_msgSend(*(id *)(a1 + 1128), "_existingView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (void)_requestNavigationControllerObservingUpdateForSearchBar:(int)a3 visibilityChangedForSearchSuggestionsList:(int)a4 forSearchResultsController:
{
  id v7;
  void *v8;
  int isSearchResultsControllerView;
  int isSuggestionsListViewControllerView;
  int v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  NSObject *v24;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a1 && a3 | a4)
  {
    objc_msgSend(a1, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && _UIBarsApplyChromelessEverywhere()
      && objc_msgSend(v7, "_isHostedByNavigationBar"))
    {
      isSearchResultsControllerView = -[UISearchController _isSearchResultsControllerViewUnhidden]((uint64_t)a1);
      isSuggestionsListViewControllerView = -[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)a1);
      v11 = isSearchResultsControllerView ^ a4;
      v12 = isSuggestionsListViewControllerView ^ a3;
      objc_msgSend(v8, "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_outermostNavigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __147__UISearchController__requestNavigationControllerObservingUpdateForSearchBar_visibilityChangedForSearchSuggestionsList_forSearchResultsController___block_invoke;
      v35[3] = &unk_1E16DECC0;
      v16 = v14;
      v35[4] = v16;
      v36 = v8;
      v33[0] = v15;
      v33[1] = 3221225472;
      v33[2] = __147__UISearchController__requestNavigationControllerObservingUpdateForSearchBar_visibilityChangedForSearchSuggestionsList_forSearchResultsController___block_invoke_2;
      v33[3] = &unk_1E16DECE8;
      v33[4] = a1;
      v17 = v36;
      v34 = v17;
      if (isSearchResultsControllerView && isSuggestionsListViewControllerView)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v38 = a1;
            _os_log_fault_impl(&dword_185066000, v27, OS_LOG_TYPE_FAULT, "UISearchController should not be showing the search results controller and the search suggestions list at the same time. Internal UIKit logic error. searchController = %@", buf, 0xCu);
          }

        }
        else
        {
          v23 = _MergedGlobals_23_4;
          if (!_MergedGlobals_23_4)
          {
            v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v23, (unint64_t *)&_MergedGlobals_23_4);
          }
          v24 = *(NSObject **)(v23 + 8);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v38 = a1;
            _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "UISearchController should not be showing the search results controller and the search suggestions list at the same time. Internal UIKit logic error. searchController = %@", buf, 0xCu);
          }
        }
      }
      v31 = 0;
      v32 = 0;
      __147__UISearchController__requestNavigationControllerObservingUpdateForSearchBar_visibilityChangedForSearchSuggestionsList_forSearchResultsController___block_invoke_2((uint64_t)v33, isSearchResultsControllerView, isSuggestionsListViewControllerView, &v32, &v31);
      v18 = v32;
      v19 = v31;
      if ((v11 & v12) == 1)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v38 = a1;
            _os_log_fault_impl(&dword_185066000, v28, OS_LOG_TYPE_FAULT, "UISearchController should not have been showing the search results controller and the search suggestions list at the same time. Internal UIKit logic error. searchController = %@", buf, 0xCu);
          }

        }
        else
        {
          v25 = qword_1ECD7B7A8;
          if (!qword_1ECD7B7A8)
          {
            v25 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v25, (unint64_t *)&qword_1ECD7B7A8);
          }
          v26 = *(NSObject **)(v25 + 8);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v38 = a1;
            _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "UISearchController should not have been showing the search results controller and the search suggestions list at the same time. Internal UIKit logic error. searchController = %@", buf, 0xCu);
          }
        }
      }
      v29 = 0;
      v30 = 0;
      __147__UISearchController__requestNavigationControllerObservingUpdateForSearchBar_visibilityChangedForSearchSuggestionsList_forSearchResultsController___block_invoke_2((uint64_t)v33, v11, v12, &v30, &v29);
      v20 = v30;
      v21 = v29;
      v22 = v21;
      if (v18 != v20 || v19 != v21)
      {
        if (v18 != v20)
          objc_msgSend(v16, "_stopObservingContentScrollView:", v20);
        if (v19 != v22)
          objc_msgSend(v16, "_stopObservingContentScrollView:", v22);
        __147__UISearchController__requestNavigationControllerObservingUpdateForSearchBar_visibilityChangedForSearchSuggestionsList_forSearchResultsController___block_invoke((uint64_t)v35, v18, v19);
      }

    }
  }

}

- (BOOL)showsSearchResultsController
{
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags;
  _BOOL4 v3;
  void *v5;
  _BOOL4 showResultsForEmptySearch;
  void *v7;

  controllerFlags = self->_controllerFlags;
  if ((*(_BYTE *)&controllerFlags & 0x80) != 0)
  {
    -[UISearchBar text](self->_searchBar, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {

    }
    else
    {
      showResultsForEmptySearch = self->__showResultsForEmptySearch;

      if (!showResultsForEmptySearch)
      {
        LOBYTE(v3) = 0;
        return v3;
      }
    }
    -[UISearchController _dci_searchSuggestions](self, "_dci_searchSuggestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
      v3 = (*((unsigned __int8 *)&self->_controllerFlags + 1) >> 4) & 1;
    else
      LOBYTE(v3) = 1;

  }
  else
  {
    return (*(unsigned int *)&controllerFlags >> 8) & 1;
  }
  return v3;
}

- (_UISearchSuggestionController)_suggestionController
{
  return self->_suggestionController;
}

- (void)setAutomaticallyShowsCancelButton:(BOOL)automaticallyShowsCancelButton
{
  int v3;

  if (automaticallyShowsCancelButton)
    v3 = 16;
  else
    v3 = 0;
  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFFEF | v3);
}

- (void)_dci_setAutomaticScopeBarShowsOnPresentation:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 3;
  else
    v3 = 2;
  -[UISearchController setScopeBarActivation:](self, "setScopeBarActivation:", v3);
}

- (void)applicationWillEnterForeground:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[UIViewController traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 3)
  {
    -[UISearchController searchBar](self, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeFirstResponder");

    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didMoveToWindow");

  }
  *(_DWORD *)&self->_controllerFlags |= 0x200000u;
}

- (void)setIgnoresSearchSuggestionsForSearchBarPlacementStacked:(BOOL)ignoresSearchSuggestionsForSearchBarPlacementStacked
{
  int v3;

  if (((((*(_DWORD *)&self->_controllerFlags & 0x4000) == 0) ^ ignoresSearchSuggestionsForSearchBarPlacementStacked) & 1) == 0)
  {
    if (ignoresSearchSuggestionsForSearchBarPlacementStacked)
      v3 = 0x4000;
    else
      v3 = 0;
    self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFBFFF | v3);
    -[UISearchController _updateSearchSuggestionsListVisibilityShouldRequestNavigationControllerObservingUpdate:](self, "_updateSearchSuggestionsListVisibilityShouldRequestNavigationControllerObservingUpdate:", 1);
  }
}

- (void)setShowsSearchResultsController:(BOOL)showsSearchResultsController
{
  int v3;

  if (showsSearchResultsController)
    v3 = 256;
  else
    v3 = 0;
  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFE7F | v3);
  -[UISearchController _updateVisibilityOfSearchResultsForSearchBar:](self, "_updateVisibilityOfSearchResultsForSearchBar:", self->_searchBar);
}

- (void)setScopeBarActivation:(UISearchControllerScopeBarActivation)scopeBarActivation
{
  uint64_t v4;
  int v5;

  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFF9F | (32 * (scopeBarActivation & 3)));
  if ((scopeBarActivation & 3) != 0)
  {
    v4 = scopeBarActivation & 3;
  }
  else
  {
    v5 = dyld_program_sdk_at_least();
    v4 = 2;
    if (!v5)
      v4 = 3;
  }
  -[UISearchBar _setActiveSearchDeferringScopeBar:](self->_searchBar, "_setActiveSearchDeferringScopeBar:", v4 == 2);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchResultsUpdaterPrivate);
  objc_storeStrong((id *)&self->_searchHints, 0);
  objc_storeStrong((id *)&self->__suggestionContainerView, 0);
  objc_storeStrong((id *)&self->_searchResultsToHiddenKeyboardFocusGuide, 0);
  objc_storeStrong((id *)&self->_keyboardToSearchResultsFocusGuide, 0);
  objc_storeStrong((id *)&self->__scopeBarConstraints, 0);
  objc_storeStrong((id *)&self->__scopeBarFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->__rightDividerView, 0);
  objc_storeStrong((id *)&self->__leftDividerView, 0);
  objc_storeStrong((id *)&self->__suggestionView, 0);
  objc_storeStrong((id *)&self->__tvKeyboardContainerView, 0);
  objc_destroyWeak((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
  objc_storeStrong((id *)&self->__systemInputMarginView, 0);
  objc_storeStrong((id *)&self->_searchControllerObservedScrollView, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_searchResultsUpdater);
  objc_storeStrong((id *)&self->_managedPalette, 0);
  objc_storeStrong((id *)&self->_suggestionsListViewController, 0);
  objc_storeStrong((id *)&self->_suggestionController, 0);
  objc_storeStrong((id *)&self->_resultsControllerViewContainer, 0);
  objc_destroyWeak((id *)&self->_tvObservingScrollView);
  objc_storeStrong(&self->_deferredActivationOrDismissal, 0);
  objc_storeStrong((id *)&self->_doneButtonGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_backButtonDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_systemInputViewController, 0);
  objc_storeStrong((id *)&self->_didScrollDelegate, 0);
  objc_storeStrong(&self->_windowWillAnimateToken, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
}

- (id)_tvSuggestionController
{
  return 0;
}

- (UISearchSuggestion)selectedSuggestion
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "UIKit issue: selectedSuggestion property not supported on this platform", buf, 2u);
    }

  }
  else
  {
    v2 = selectedSuggestion___s_category;
    if (!selectedSuggestion___s_category)
    {
      v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&selectedSuggestion___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "UIKit issue: selectedSuggestion property not supported on this platform", v6, 2u);
    }
  }
  return 0;
}

- (void)setSelectedSuggestion:(id)a3
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "UIKit issue: selectedSuggestion property not supported on this platform", buf, 2u);
    }

  }
  else
  {
    v3 = setSelectedSuggestion____s_category;
    if (!setSelectedSuggestion____s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&setSelectedSuggestion____s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "UIKit issue: selectedSuggestion property not supported on this platform", v6, 2u);
    }
  }
}

- (BOOL)_delegateWantsInsertSearchFieldTextSuggestion
{
  return (*(_BYTE *)&self->_controllerFlags >> 3) & 1;
}

- (void)_sendDelegateInsertSearchFieldTextSuggestion:(id)a3
{
  id v4;
  id v5;

  if ((*(_BYTE *)&self->_controllerFlags & 8) != 0)
  {
    v4 = a3;
    -[UISearchController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_searchController:insertSearchFieldTextSuggestion:", self, v4);

  }
}

- (void)_setTransitioningOutWithoutDisappearing:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFFFB | v3);
}

- (BOOL)_transitioningOutWithoutDisappearing
{
  return (*(_BYTE *)&self->_controllerFlags >> 2) & 1;
}

void __33__UISearchController__commonInit__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v8)
  {
    v9 = objc_loadWeakRetained(v5);
    if (v9)
    {
      v10 = v9[15];

      if (v10)
        goto LABEL_6;
    }
    else
    {

    }
    objc_msgSend(v14, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("UIWindowNewOrientationUserInfoKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    v4 = objc_loadWeakRetained(v5);
    objc_msgSend(v4, "_adjustSearchBarSizeForOrientation:", v13);
  }
  else
  {

  }
LABEL_6:

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  UIViewController *searchResultsController;
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UISearchController;
  -[UIViewController encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  searchResultsController = self->_searchResultsController;
  if (searchResultsController)
    objc_msgSend(v4, "encodeObject:forKey:", searchResultsController, CFSTR("UISearchControllerResultsController"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_obscuresBackgroundDuringPresentation, CFSTR("UISearchControllerDimsBackgroundDuringPresentation"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_obscuresBackgroundDuringPresentation, CFSTR("UISearchControllerObscuresBackgroundDuringPresentation"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(_DWORD *)&self->_controllerFlags >> 10) & 1, CFSTR("UISearchControllerHidesNavigationBarDuringPresentation"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(_DWORD *)&self->_controllerFlags >> 7) & 1, CFSTR("UISearchControllerAutomaticallyShowsSearchResultsController"));
  controllerFlags = self->_controllerFlags;
  if ((*(_BYTE *)&controllerFlags & 0x80) == 0)
  {
    objc_msgSend(v4, "encodeBool:forKey:", (*(unsigned int *)&controllerFlags >> 8) & 1, CFSTR("UISearchControllerShowsSearchResultsController"));
    controllerFlags = self->_controllerFlags;
  }
  objc_msgSend(v4, "encodeBool:forKey:", (*(unsigned int *)&controllerFlags >> 4) & 1, CFSTR("UISearchControllerAutomaticallyShowsCancelButton"));
  objc_msgSend(v4, "encodeInteger:forKey:", ((unint64_t)self->_controllerFlags >> 5) & 3, CFSTR("UISearchControllerScopeBarActivation"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(_DWORD *)&self->_controllerFlags >> 14) & 1, CFSTR("UISearchControllerIgnoresSearchSuggestionsForStackedSearch"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIViewController modalPresentationStyle](self, "modalPresentationStyle"), CFSTR("UISearchControllerModalPresentationStyle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchBar, CFSTR("UISearchControllerSearchBar"));

}

- (UISearchController)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UISearchController *v5;
  uint64_t v6;
  UISearchBar *searchBar;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  UIViewController *searchResultsController;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  objc_super v19;

  v4 = coder;
  v19.receiver = self;
  v19.super_class = (Class)UISearchController;
  v5 = -[UIViewController initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_38;
  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISearchControllerSearchBar"));
  v6 = objc_claimAutoreleasedReturnValue();
  searchBar = v5->_searchBar;
  v5->_searchBar = (UISearchBar *)v6;

  -[UISearchController _commonInit](v5, "_commonInit");
  -[UISearchController setModalPresentationStyle:](v5, "setModalPresentationStyle:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UISearchControllerModalPresentationStyle")));
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISearchControllerObscuresBackgroundDuringPresentation")))
  {
    v8 = CFSTR("UISearchControllerObscuresBackgroundDuringPresentation");
  }
  else
  {
    v8 = CFSTR("UISearchControllerDimsBackgroundDuringPresentation");
  }
  v5->_obscuresBackgroundDuringPresentation = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", v8);
  if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISearchControllerHidesNavigationBarDuringPresentation")))
  {
    v9 = 1024;
  }
  else
  {
    v9 = 0;
  }
  v5->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&v5->_controllerFlags & 0xFFFFFBFF | v9);
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISearchControllerResultsController")))
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISearchControllerResultsController"));
    v10 = objc_claimAutoreleasedReturnValue();
    searchResultsController = v5->_searchResultsController;
    v5->_searchResultsController = (UIViewController *)v10;

  }
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISearchControllerAutomaticallyShowsSearchResultsController")))
  {
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISearchControllerAutomaticallyShowsSearchResultsController")))
    {
      v12 = 128;
    }
    else
    {
      v12 = 0;
    }
    v5->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&v5->_controllerFlags & 0xFFFFFF7F | v12);
    if (v12)
      goto LABEL_22;
  }
  else if ((*(_DWORD *)&v5->_controllerFlags & 0x80) != 0)
  {
    goto LABEL_22;
  }
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISearchControllerShowsSearchResultsController")))
  {
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISearchControllerShowsSearchResultsController")))
      v13 = 256;
    else
      v13 = 0;
    v5->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&v5->_controllerFlags & 0xFFFFFEFF | v13);
  }
LABEL_22:
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISearchControllerAutomaticallyShowsCancelButton")))
  {
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISearchControllerAutomaticallyShowsCancelButton")))
    {
      v14 = 16;
    }
    else
    {
      v14 = 0;
    }
    v5->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&v5->_controllerFlags & 0xFFFFFFEF | v14);
  }
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISearchControllerScopeBarActivation")))
  {
    v15 = 32
        * (-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UISearchControllerScopeBarActivation")) & 3);
    v16 = *(_DWORD *)&v5->_controllerFlags & 0xFFFFFF9F;
LABEL_32:
    v5->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(v15 | v16);
    goto LABEL_33;
  }
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISearchControllerAutomaticallyShowsScopeBar"))&& !-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISearchControllerAutomaticallyShowsScopeBar")))
  {
    v15 = *(_DWORD *)&v5->_controllerFlags & 0xFFFFFF9F;
    v16 = 32;
    goto LABEL_32;
  }
LABEL_33:
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISearchControllerIgnoresSearchSuggestionsForStackedSearch")))
  {
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISearchControllerIgnoresSearchSuggestionsForStackedSearch")))
    {
      v17 = 0x4000;
    }
    else
    {
      v17 = 0;
    }
    v5->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&v5->_controllerFlags & 0xFFFFBFFF | v17);
  }
LABEL_38:

  return v5;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
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
  double v16;
  double v17;
  _UISearchControllerView *v18;

  -[UIViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    -[UIViewController _defaultInitialViewFrame](self, "_defaultInitialViewFrame");
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }

  v18 = -[UIView initWithFrame:]([_UISearchControllerView alloc], "initWithFrame:", v7, v9, v11, v13);
  -[UIView setAutoresizingMask:](v18, "setAutoresizingMask:", 18);
  -[UIViewController setView:](self, "setView:", v18);

}

- (void)viewDidLoad
{
  UIView *v3;
  void *v4;
  UIView *v5;
  UIView *resultsControllerViewContainer;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UISearchController;
  -[UIViewController viewDidLoad](&v9, sel_viewDidLoad);
  if (self->_searchResultsController)
  {
    v3 = [UIView alloc];
    -[UIViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v5 = -[UIView initWithFrame:](v3, "initWithFrame:");
    resultsControllerViewContainer = self->_resultsControllerViewContainer;
    self->_resultsControllerViewContainer = v5;

    -[UIView setAutoresizingMask:](self->_resultsControllerViewContainer, "setAutoresizingMask:", 18);
    -[UIViewController view](self->_searchResultsController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self->_resultsControllerViewContainer, "bounds");
    objc_msgSend(v7, "setFrame:");
    -[UIView addSubview:](self->_resultsControllerViewContainer, "addSubview:", v7);
    objc_msgSend(v7, "setAutoresizingMask:", 18);
    -[UIViewController addChildViewController:](self, "addChildViewController:", self->_searchResultsController);
    -[UIViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_resultsControllerViewContainer);

    -[UIViewController didMoveToParentViewController:](self->_searchResultsController, "didMoveToParentViewController:", self);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISearchController;
  -[UIViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[UIViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 3)
    -[UISearchController _limitedUIDidChangeAnimated:](self, "_limitedUIDidChangeAnimated:", 0);
  if (-[UISearchController _shouldLogAppearance](self, "_shouldLogAppearance"))
    AnalyticsSendEventLazy();
  -[UISearchController set_shouldLogAppearance:](self, "set_shouldLogAppearance:", 1);
}

id __36__UISearchController_viewDidAppear___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  _UIPrivateMainBundleIdentifier();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
  {
    v4 = CFSTR("bundle_id");
    v5[0] = v0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchController;
  -[UIViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
  AnalyticsSendEventLazy();
}

id __39__UISearchController_viewDidDisappear___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  _UIPrivateMainBundleIdentifier();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
  {
    v4 = CFSTR("bundle_id");
    v5[0] = v0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)applicationWillResignActive:(id)a3
{
  *(_DWORD *)&self->_controllerFlags &= ~0x200000u;
}

- (void)applicationDidEnterBackground:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  -[UIViewController traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 3)
  {
    -[UISearchController searchBar](self, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

  }
  *(_DWORD *)&self->_controllerFlags &= ~0x200000u;
}

- (id)_createAnimationCoordinator
{
  _UIAnimationCoordinator *v3;
  void *v4;

  v3 = objc_alloc_init(_UIAnimationCoordinator);
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAnimationCoordinator setContainerView:](v3, "setContainerView:", v4);

  return v3;
}

- (void)_resizeResultsControllerWithDelta:(CGSize)a3
{
  double height;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  _QWORD v14[9];

  height = a3.height;
  -[UIView frame](self->_resultsControllerViewContainer, "frame", a3.width);
  v6 = v5;
  v8 = v7;
  v10 = height + v9;
  v12 = v11 - height;
  -[UISearchController _createAnimationCoordinator](self, "_createAnimationCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self->_resultsControllerViewContainer, "frame");
  objc_msgSend(v13, "setStartFrame:");
  objc_msgSend(v13, "setEndFrame:", v6, v10, v8, v12);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__UISearchController__resizeResultsControllerWithDelta___block_invoke;
  v14[3] = &unk_1E16DEC98;
  v14[4] = self;
  *(double *)&v14[5] = v6;
  *(double *)&v14[6] = v10;
  *(double *)&v14[7] = v8;
  *(double *)&v14[8] = v12;
  objc_msgSend(v13, "setAnimator:", v14);
  objc_msgSend(v13, "animate");

}

uint64_t __56__UISearchController__resizeResultsControllerWithDelta___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)_resultsControllerWillLayoutVisibleUnderContainerView
{
  UIViewController *searchResultsController;
  int v4;
  void *v5;
  char v6;

  searchResultsController = self->_searchResultsController;
  if (searchResultsController)
    v4 = -[UIViewController edgesForExtendedLayout](searchResultsController, "edgesForExtendedLayout") & 1;
  else
    LOBYTE(v4) = 1;
  -[UIViewController presentationController](self, "presentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "resultsUnderlapsSearchBar");

  return v6 & v4;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return self->_barPresentationStyle == 5;
}

- (id)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  void *v7;
  UIViewController *searchResultsController;
  void *v9;
  int v10;
  void *v11;
  int v12;
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags;
  void *v15;
  UISystemInputViewController **p_systemInputViewController;
  uint64_t v18;
  uint64_t v19;
  UIViewController *v20;
  UISystemInputViewController *systemInputViewController;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (self->_barPresentationStyle != 5)
  {
    searchResultsController = self->_searchResultsController;
    if (searchResultsController)
    {
      -[UIViewController view](searchResultsController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isHidden") ^ 1;

    }
    else
    {
      v10 = 0;
    }
    if (self->_systemInputViewController)
    {
      -[UISearchController _tvKeyboardContainerView](self, "_tvKeyboardContainerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isUserInteractionEnabled");

      controllerFlags = self->_controllerFlags;
      if (v12)
      {
        if ((v10 & (*(unsigned int *)&controllerFlags >> 23)) != 1 || (*(_DWORD *)&controllerFlags & 0x2000000) != 0)
          goto LABEL_19;
LABEL_16:
        if (!v10)
        {
          -[UISearchController searchBar](self, "searchBar");
          v18 = objc_claimAutoreleasedReturnValue();
          v4 = (void *)v18;
          if (v18)
          {
            v19 = v18;
            v5 = (void *)MEMORY[0x1E0C99D20];
            v6 = &v19;
            goto LABEL_4;
          }
LABEL_23:
          v7 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_24;
        }
        v20 = self->_searchResultsController;
        v15 = (void *)MEMORY[0x1E0C99D20];
        p_systemInputViewController = (UISystemInputViewController **)&v20;
LABEL_20:
        objc_msgSend(v15, "arrayWithObjects:count:", p_systemInputViewController, 1);
        return (id)objc_claimAutoreleasedReturnValue();
      }
      if ((*(_DWORD *)&controllerFlags & 0x2000000) == 0)
        goto LABEL_16;
    }
    else if ((*((_BYTE *)&self->_controllerFlags + 3) & 2) == 0)
    {
      goto LABEL_16;
    }
LABEL_19:
    systemInputViewController = self->_systemInputViewController;
    v15 = (void *)MEMORY[0x1E0C99D20];
    p_systemInputViewController = &systemInputViewController;
    goto LABEL_20;
  }
  -[UISearchController searchBar](self, "searchBar");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
    goto LABEL_23;
  v22[0] = v3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = v22;
LABEL_4:
  objc_msgSend(v5, "arrayWithObjects:count:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v7;
}

- (void)set_systemInputMarginView:(id)a3
{
  UIView **p_systemInputMarginView;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  p_systemInputMarginView = &self->__systemInputMarginView;
  objc_storeStrong((id *)&self->__systemInputMarginView, a3);
  -[UIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", self->__systemInputMarginView);

  if ((v8 & 1) == 0)
  {
    -[UIViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", *p_systemInputMarginView);

  }
}

- (void)_setRequestedInteractionModel:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  UISystemInputViewController *v9;
  UISystemInputViewController *systemInputViewController;
  UISystemInputViewController *v11;

  if (UIKeyboardCarPlayRequiresTouch())
    v5 = 1;
  else
    v5 = a3;
  if (self->__requestedInteractionModel != v5)
  {
    self->__requestedInteractionModel = v5;
    if (self->_systemInputViewController)
    {
      LODWORD(v6) = 0;
    }
    else
    {
      -[UIViewController _window](self, "_window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[UISearchController searchBar](self, "searchBar");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "searchField");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[UISystemInputViewController systemInputViewControllerForResponder:editorView:containingResponder:](UISystemInputViewController, "systemInputViewControllerForResponder:editorView:containingResponder:", v8, 0, self);
        v9 = (UISystemInputViewController *)objc_claimAutoreleasedReturnValue();
        systemInputViewController = self->_systemInputViewController;
        self->_systemInputViewController = v9;

        LODWORD(v6) = 1;
      }
    }
    +[UISystemInputViewController setKeyboardInteractionModel:](UISystemInputViewController, "setKeyboardInteractionModel:", self->__requestedInteractionModel);
    v11 = self->_systemInputViewController;
    if (v11)
      -[UISystemInputViewController setRequestedInteractionModel:](v11, "setRequestedInteractionModel:", self->__requestedInteractionModel);
    if ((_DWORD)v6)
      -[UISearchController _didCreateSystemInputViewController](self, "_didCreateSystemInputViewController");
  }
}

- (void)_createSystemInputViewControllerIfNeededForTraitEnvironment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UISystemInputViewController *systemInputViewController;
  void *v10;
  void *v11;
  UISystemInputViewController *v12;
  UISystemInputViewController *v13;
  UISystemInputViewController *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;

  v33 = a3;
  objc_msgSend(v33, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom") != 2)
  {
    objc_msgSend(v33, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceIdiom") != 8)
    {
      objc_msgSend(v33, "traitCollection");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "userInterfaceIdiom");

      if (v32 != 3)
        goto LABEL_18;
      goto LABEL_5;
    }

  }
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v33, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_carPlaySceneComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      UIKeyboardCarPlayFiveRowKeyboardEnabled = objc_msgSend(v8, "disableFiveRowKeyboards") ^ 1;

  }
  systemInputViewController = self->_systemInputViewController;
  if (!systemInputViewController)
  {
    -[UISearchController searchBar](self, "searchBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISystemInputViewController systemInputViewControllerForResponder:editorView:containingResponder:](UISystemInputViewController, "systemInputViewControllerForResponder:editorView:containingResponder:", v11, 0, self);
    v12 = (UISystemInputViewController *)objc_claimAutoreleasedReturnValue();
    v13 = self->_systemInputViewController;
    self->_systemInputViewController = v12;

  }
  +[UISystemInputViewController setKeyboardInteractionModel:](UISystemInputViewController, "setKeyboardInteractionModel:", -[UISearchController _requestedInteractionModel](self, "_requestedInteractionModel"));
  if (self->_systemInputViewController)
  {
    -[UISearchBar _setShowsDeleteButton:](self->_searchBar, "_setShowsDeleteButton:", (-[UISearchController _requestedInteractionModel](self, "_requestedInteractionModel") & 1) == 0);
    -[UISystemInputViewController setRequestedInteractionModel:](self->_systemInputViewController, "setRequestedInteractionModel:", -[UISearchController _requestedInteractionModel](self, "_requestedInteractionModel"));
    v14 = self->_systemInputViewController;
    -[UISearchController searchBar](self, "searchBar");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15, "searchField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController setPersistentDelegate:](v14, "setPersistentDelegate:", v16);

    -[UIViewController childViewControllers](self, "childViewControllers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_msgSend(v17, "containsObject:", self->_systemInputViewController);

    if ((v15 & 1) == 0)
    {
      -[UIViewController addChildViewController:](self, "addChildViewController:", self->_systemInputViewController);
      -[UIViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self->_systemInputViewController, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSubview:", v19);

      v20 = *MEMORY[0x1E0C9D648];
      v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      -[UIViewController view](self->_systemInputViewController, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v24 = v23;

      -[UIViewController view](self, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "safeAreaLayoutGuide");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "layoutFrame");
      v28 = v27;

      -[UIViewController view](self->_systemInputViewController, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFrame:", v20, v21, v28, v24);

      -[UIViewController didMoveToParentViewController:](self->_systemInputViewController, "didMoveToParentViewController:", self);
    }
    -[UISystemInputViewController reloadInputViewsForPersistentDelegate](self->_systemInputViewController, "reloadInputViewsForPersistentDelegate");
  }
  -[UIViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "set_ensureSystemInputViewAboveSearchBarContainerView:", 1);

  if (!systemInputViewController)
    -[UISearchController _didCreateSystemInputViewController](self, "_didCreateSystemInputViewController");
LABEL_18:

}

- (id)_viewToInsertSearchBarContainerViewUnder
{
  void *v3;
  int v4;
  void *v5;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_ensureSystemInputViewAboveSearchBarContainerView");

  if (v4)
  {
    -[UIViewController view](self->_systemInputViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_updateSystemInputViewController
{
  -[UISystemInputViewController _restoreKeyboardIfNecessary](self->_systemInputViewController, "_restoreKeyboardIfNecessary");
}

- (UISystemInputViewController)_systemInputViewController
{
  -[UISearchController _createSystemInputViewControllerIfNeededForTraitEnvironment:](self, "_createSystemInputViewControllerIfNeededForTraitEnvironment:", self);
  return self->_systemInputViewController;
}

- (id)_systemInputViewControllerAfterUpdate:(BOOL)a3
{
  UISystemInputViewController *systemInputViewController;

  systemInputViewController = self->_systemInputViewController;
  if (systemInputViewController && !a3)
    return systemInputViewController;
  -[UISearchController _systemInputViewController](self, "_systemInputViewController", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  int v31;
  void *v32;
  char isKindOfClass;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  UISearchController *v44;
  UISearchController *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  BOOL v52;
  int v53;
  void *v54;
  void *v55;
  int v56;
  UISearchController *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  char v70;

  v6 = a3;
  v7 = a4;
  if (self->_barPresentationStyle && !-[UISearchController isBeingDismissed](self, "isBeingDismissed"))
  {
    -[UISearchController _animatorForBarPresentationStyle:dismissing:](self, "_animatorForBarPresentationStyle:dismissing:", self->_barPresentationStyle, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchController _updateKeyboardFocusGuidesForAnimator:](self, "_updateKeyboardFocusGuidesForAnimator:", v8);
    objc_msgSend(v6, "previouslyFocusedView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextFocusedView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      -[UIViewController _focusSystem](self, "_focusSystem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_focusedView");
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v9)
    {
      -[UISearchController searchBar](self, "searchBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isDescendantOfView:", v14) & 1) != 0)
      {
        v15 = 1;
      }
      else
      {
        -[UIViewController view](self->_systemInputViewController, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v9, "isDescendantOfView:", v16);

      }
      objc_msgSend(v9, "isDescendantOfView:", self->_resultsControllerViewContainer);
    }
    else
    {
      v15 = 0;
    }
    -[UISearchController searchBar](self, "searchBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isDescendantOfView:", v17) & 1) != 0)
    {
      v18 = 1;
    }
    else
    {
      -[UIViewController view](self->_systemInputViewController, "view");
      v19 = v8;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v12, "isDescendantOfView:", v20);

      v8 = v19;
    }

    if (((v18 ^ 1 | v15) & 1) == 0)
    {
      objc_msgSend(v8, "didFocusSearchBarForController:", self);
      goto LABEL_34;
    }
    if (((v18 | v15 ^ 1) & 1) != 0)
    {
      if (!v12)
      {
        -[UISearchController _systemInputViewControllerAfterUpdate:](self, "_systemInputViewControllerAfterUpdate:", 0);
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)v21;
          -[UISearchController _systemInputViewControllerAfterUpdate:](self, "_systemInputViewControllerAfterUpdate:", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v8;
          v24 = objc_msgSend(v23, "resolvedKeyboardStyle");

          v52 = v24 == 2;
          v8 = v59;
          if (!v52)
          {
            -[UIViewController presentingViewController](self, "presentingViewController");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "navigationController");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            -[UIViewController presentedViewController](self, "presentedViewController");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v56 = 1;
            }
            else
            {
              v38 = v26;
              -[UISearchController searchResultsController](self, "searchResultsController");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "presentedViewController");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              if (v40)
              {
                v56 = 1;
              }
              else
              {
                objc_msgSend(v38, "presentedViewController");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = v41 != 0;

              }
              v26 = v38;
            }

            v70 = 0;
            v64 = 0;
            v65 = &v64;
            v66 = 0x3032000000;
            v67 = __Block_byref_object_copy__166;
            v68 = __Block_byref_object_dispose__166;
            v69 = 0;
            -[UIViewController presentingViewController](self, "presentingViewController");
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = (void *)v42;
            if (v42)
              v44 = (UISearchController *)v42;
            else
              v44 = self;
            v45 = v44;

            v61[0] = MEMORY[0x1E0C809B0];
            v61[1] = 3221225472;
            v61[2] = __71__UISearchController_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
            v61[3] = &unk_1E16C1BB8;
            v46 = v26;
            v62 = v46;
            v63 = &v64;
            v57 = v45;
            -[UIViewController _enumerateAncestorViewControllersUntilStop:usingBlock:](v45, "_enumerateAncestorViewControllersUntilStop:usingBlock:", &v70, v61);
            objc_msgSend(v46, "viewControllers");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v47, "indexOfObject:", v65[5]);

            v58 = v46;
            objc_msgSend(v46, "viewControllers");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "topViewController");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v49, "indexOfObject:", v50);

            if (v65[5])
              v52 = v48 == v51;
            else
              v52 = 1;
            v53 = v52;
            -[UIViewController view](self, "view");
            v8 = v59;
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "window");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (v55)
            {

              if ((v53 & ~v56) == 1)
              {
                objc_msgSend(v59, "willFocusOffscreenViewForController:withHeading:", self, 1);
                objc_msgSend(v59, "didFocusSearchBarForController:", self);
              }
            }
            else
            {

            }
            _Block_object_dispose(&v64, 8);

          }
        }
      }
LABEL_34:
      if (v18)
        v31 = 0;
      else
        v31 = 0x800000;
      self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFF7FFFFF | v31);
      objc_msgSend(v6, "nextFocusedItem");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v6, "previouslyFocusedItem");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "nextFocusedItem");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34 == v35)
        {
LABEL_42:

          goto LABEL_43;
        }
        -[UISearchController searchBar](self, "searchBar");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "_hideOrResetHelperPlaceHolder:", 0);

        -[UISearchController _displayDefaultHelperPlaceholderMessage](self, "_displayDefaultHelperPlaceholderMessage");
        +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "updateHelperMessageDisplayIfNeeded");
      }
      else
      {
        -[UISearchController searchBar](self, "searchBar");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "_hideOrResetHelperPlaceHolder:", 1);
      }

      goto LABEL_42;
    }
    v60 = v8;
    objc_msgSend(v12, "_scroller");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_scroller");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "isDescendantOfView:", self->_resultsControllerViewContainer))
    {
      do
      {
        v30 = v29;

        objc_msgSend(v30, "_scroller");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = v30;
      }
      while ((objc_msgSend(v29, "isDescendantOfView:", self->_resultsControllerViewContainer) & 1) != 0);
    }
    else
    {
      v30 = v28;
    }
    v8 = v60;
    if (v30)
    {
      if (-[UISystemInputViewController resolvedKeyboardStyle](self->_systemInputViewController, "resolvedKeyboardStyle") == 1)
      {
        if ((objc_msgSend(v30, "_canScrollY") & 1) == 0)
          goto LABEL_33;
        goto LABEL_32;
      }
      if (objc_msgSend(v30, "_canScrollX"))
LABEL_32:
        objc_msgSend(v60, "didUnfocusSearchBarForController:", self);
    }
LABEL_33:

    goto LABEL_34;
  }
LABEL_43:

}

void __71__UISearchController_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    *a3 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (void)_updateKeyboardFocusGuidesForAnimator:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (objc_msgSend(a3, "collapesKeyboardWhenNotFocused"))
  {
    -[UISearchController _createOrUpdateKeyboardToSearchResultsFocusGuide](self, "_createOrUpdateKeyboardToSearchResultsFocusGuide");
    -[UISearchController _createOrUpdateSearchResultsToHiddenKeyboardFocusGuide](self, "_createOrUpdateSearchResultsToHiddenKeyboardFocusGuide");
    -[UISystemInputViewController setKeyboardCanBecomeFocusedWithZeroAlpha:](self->_systemInputViewController, "setKeyboardCanBecomeFocusedWithZeroAlpha:", 1);
  }
  else
  {
    -[UISearchController keyboardToSearchResultsFocusGuide](self, "keyboardToSearchResultsFocusGuide");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UISearchController keyboardToSearchResultsFocusGuide](self, "keyboardToSearchResultsFocusGuide");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "owningView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchController keyboardToSearchResultsFocusGuide](self, "keyboardToSearchResultsFocusGuide");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeLayoutGuide:", v7);

      -[UISearchController setKeyboardToSearchResultsFocusGuide:](self, "setKeyboardToSearchResultsFocusGuide:", 0);
    }
    -[UISearchController searchResultsToHiddenKeyboardFocusGuide](self, "searchResultsToHiddenKeyboardFocusGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[UISearchController searchResultsToHiddenKeyboardFocusGuide](self, "searchResultsToHiddenKeyboardFocusGuide");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "owningView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchController searchResultsToHiddenKeyboardFocusGuide](self, "searchResultsToHiddenKeyboardFocusGuide");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeLayoutGuide:", v11);

      -[UISearchController setSearchResultsToHiddenKeyboardFocusGuide:](self, "setSearchResultsToHiddenKeyboardFocusGuide:", 0);
    }
    -[UISystemInputViewController setKeyboardCanBecomeFocusedWithZeroAlpha:](self->_systemInputViewController, "setKeyboardCanBecomeFocusedWithZeroAlpha:", 0);
    -[UIViewController view](self->_systemInputViewController, "view");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", 1.0);

  }
}

- (void)_createOrUpdateKeyboardToSearchResultsFocusGuide
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  UIFocusGuide *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  -[UISearchController _systemInputViewControllerAfterUpdate:](self, "_systemInputViewControllerAfterUpdate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UISearchController keyboardToSearchResultsFocusGuide](self, "keyboardToSearchResultsFocusGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0x1E0C99000;
    if (!v5)
    {
      v7 = objc_alloc_init(UIFocusGuide);
      -[UIFocusGuide setEnabled:](v7, "setEnabled:", 0);
      objc_msgSend(v3, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addLayoutGuide:", v7);

      v27 = (void *)MEMORY[0x1E0D156E0];
      -[UILayoutGuide heightAnchor](v7, "heightAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToConstant:", 1.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v32;
      -[UILayoutGuide topAnchor](v7, "topAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v29);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v28;
      -[UILayoutGuide leadingAnchor](v7, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "leadingAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = v10;
      objc_msgSend(v3, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide trailingAnchor](v7, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v36[3] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "activateConstraints:", v15);

      v6 = 0x1E0C99000uLL;
      -[UISearchController setKeyboardToSearchResultsFocusGuide:](self, "setKeyboardToSearchResultsFocusGuide:", v7);

    }
    -[UISearchController searchResultsController](self, "searchResultsController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[UISearchController searchResultsController](self, "searchResultsController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v17;
      objc_msgSend(*(id *)(v6 + 3360), "arrayWithObjects:count:", &v35, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }

    -[UISearchController searchBar](self, "searchBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "showsScopeBar"))
    {
      -[UISearchController searchBar](self, "searchBar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_scopeBar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
LABEL_11:
        -[UISearchController keyboardToSearchResultsFocusGuide](self, "keyboardToSearchResultsFocusGuide");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setPreferredFocusEnvironments:", v18);

        goto LABEL_12;
      }
      -[UISearchController searchBar](self, "searchBar");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_scopeBar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v22;
      objc_msgSend(*(id *)(v6 + 3360), "arrayWithObjects:count:", &v34, 1);
      v23 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v23;
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (void)_createOrUpdateSearchResultsToHiddenKeyboardFocusGuide
{
  void *v3;
  void *v4;
  unint64_t v5;
  UIFocusGuide *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  -[UISearchController _systemInputViewControllerAfterUpdate:](self, "_systemInputViewControllerAfterUpdate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 0x1E0C99000;
    if (!self->_searchResultsToHiddenKeyboardFocusGuide)
    {
      v6 = objc_alloc_init(UIFocusGuide);
      -[UIFocusGuide setEnabled:](v6, "setEnabled:", 0);
      -[UIViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addLayoutGuide:", v6);

      v19 = (void *)MEMORY[0x1E0D156E0];
      -[UILayoutGuide heightAnchor](v6, "heightAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToConstant:", 1.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v24;
      -[UILayoutGuide leadingAnchor](v6, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v20;
      -[UILayoutGuide topAnchor](v6, "topAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bottomAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v9;
      -[UIViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide trailingAnchor](v6, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27[3] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "activateConstraints:", v14);

      -[UISearchController setSearchResultsToHiddenKeyboardFocusGuide:](self, "setSearchResultsToHiddenKeyboardFocusGuide:", v6);
      v5 = 0x1E0C99000uLL;
    }
    v26 = v3;
    objc_msgSend(*(id *)(v5 + 3360), "arrayWithObjects:count:", &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchController searchResultsToHiddenKeyboardFocusGuide](self, "searchResultsToHiddenKeyboardFocusGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPreferredFocusEnvironments:", v15);

  }
}

- (void)_willUpdateFocusInContext:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MaxY;
  void *v18;
  double v19;
  uint64_t v20;
  double MinY;
  void *v22;
  double v23;
  void *v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v25 = a3;
  dyld_program_sdk_at_least();
  objc_msgSend(v25, "previouslyFocusedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "nextFocusedItem");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 == (void *)v5)
  {
    v6 = v4;
    goto LABEL_12;
  }
  v6 = (void *)v5;
  if (!self->_barPresentationStyle)
  {
LABEL_12:

    goto LABEL_13;
  }
  v7 = -[UISearchController isBeingDismissed](self, "isBeingDismissed");

  if (!v7)
  {
    objc_msgSend(v25, "nextFocusedView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v8, "convertRect:fromView:", v4);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    -[UISearchController _animatorForBarPresentationStyle:dismissing:](self, "_animatorForBarPresentationStyle:dismissing:", self->_barPresentationStyle, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchController _updateKeyboardFocusGuidesForAnimator:](self, "_updateKeyboardFocusGuidesForAnimator:", v6);
    v26.origin.x = v10;
    v26.origin.y = v12;
    v26.size.width = v14;
    v26.size.height = v16;
    MaxY = CGRectGetMaxY(v26);
    -[UIViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v19 = CGRectGetMaxY(v27);

    if (MaxY > v19)
    {
      v20 = 2;
LABEL_9:
      objc_msgSend(v6, "willFocusOffscreenViewForController:withHeading:", self, v20);
      objc_msgSend(v4, "_scroller");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(v4, "bounds");
        objc_msgSend(v24, "convertRect:fromView:", v4);
        objc_msgSend(v24, "scrollRectToVisible:animated:", 1);
      }

      goto LABEL_12;
    }
    v28.origin.x = v10;
    v28.origin.y = v12;
    v28.size.width = v14;
    v28.size.height = v16;
    MinY = CGRectGetMinY(v28);
    -[UIViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v23 = CGRectGetMinY(v29);

    if (MinY < v23)
    {
      v20 = 1;
      goto LABEL_9;
    }
    goto LABEL_12;
  }
LABEL_13:

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  UIViewController *searchResultsController;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  BOOL v26;
  double v27;
  double MaxY;
  double v29;
  objc_super v30;
  CGRect v31;

  v30.receiver = self;
  v30.super_class = (Class)UISearchController;
  -[UIViewController viewWillAppear:](&v30, sel_viewWillAppear_, a3);
  -[UISearchController _searchPresentationController](self, "_searchPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UISearchController _resultsControllerWillLayoutVisibleUnderContainerView](self, "_resultsControllerWillLayoutVisibleUnderContainerView"))
  {
    -[UIViewController _contentOrObservableScrollViewForEdge:](self->_searchResultsController, "_contentOrObservableScrollViewForEdge:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (objc_msgSend(v5, "_compatibleContentInsetAdjustmentBehavior") == 101)
      {
        searchResultsController = self->_searchResultsController;
        if (searchResultsController)
        {
          if (-[UIViewController automaticallyAdjustsScrollViewInsets](searchResultsController, "automaticallyAdjustsScrollViewInsets"))
          {
            objc_msgSend(v4, "presentingViewController");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "navigationController");
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {
              objc_msgSend(v6, "contentInset");
              v11 = v10;
              v13 = v12;
              v15 = v14;
              objc_msgSend(v9, "_scrollViewBottomContentInsetForViewController:", self->_searchResultsController);
              objc_msgSend(v6, "setContentInset:", v11, v13, v16, v15);
            }

          }
        }
      }
    }

  }
  else if ((objc_msgSend(v4, "animatorShouldLayoutPresentationViews") & 1) == 0)
  {
    objc_msgSend(v4, "finalFrameForContainerView");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[UISearchBar scopeButtonTitles](self->_searchBar, "scopeButtonTitles");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
    {
      v26 = -[UISearchBar _wouldCombineLandscapeBarsForSize:](self->_searchBar, "_wouldCombineLandscapeBarsForSize:", v22, v24);

      if (!v26)
      {
        -[UISearchBar _scopeBarHeight](self->_searchBar, "_scopeBarHeight");
        v24 = v24 + v27;
      }
    }
    else
    {

    }
    v31.origin.x = v18;
    v31.origin.y = v20;
    v31.size.width = v22;
    v31.size.height = v24;
    MaxY = CGRectGetMaxY(v31);
    -[UIView frame](self->_resultsControllerViewContainer, "frame");
    -[UISearchController _resizeResultsControllerWithDelta:](self, "_resizeResultsControllerWithDelta:", 0.0, MaxY - v29);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchController;
  -[UIViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)_willPresentFromViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;

  -[UISearchController _startDeferringSettingSearchSuggestions](self, "_startDeferringSettingSearchSuggestions", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "willPresentSearchController:", self);
      v5 = v7;
    }
  }

}

- (void)_didPresentFromViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;

  -[UISearchController _stopDeferringAndShowDeferredSearchSuggestions](self, "_stopDeferringAndShowDeferredSearchSuggestions", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "didPresentSearchController:", self);
      v5 = v7;
    }
  }

}

- (void)_willDismissSearchController
{
  void *v3;
  id WeakRetained;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  UISearchController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[UIViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    *(_DWORD *)&self->_controllerFlags |= 0x80000u;
  }
  else if (dyld_program_sdk_at_least())
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v8 = 138412290;
        v9 = self;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "-_willDismissSearchController unexpectedly received with nil presentingViewController on iOS16.4 or later. self = %@", (uint8_t *)&v8, 0xCu);
      }

    }
    else
    {
      v5 = _willDismissSearchController___s_category;
      if (!_willDismissSearchController___s_category)
      {
        v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&_willDismissSearchController___s_category);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = 138412290;
        v9 = self;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "-_willDismissSearchController unexpectedly received with nil presentingViewController on iOS16.4 or later. self = %@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "willDismissSearchController:", self);

}

- (void)_didDismissSearchController
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;

  *(_DWORD *)&self->_controllerFlags &= ~0x80000u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "didDismissSearchController:", self);
      v4 = v6;
    }
  }

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIViewController preferredContentSize](self->_searchResultsController, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UISearchController;
  v4 = a3;
  -[UIViewController _preferredContentSizeDidChangeForChildViewController:](&v9, sel__preferredContentSizeDidChangeForChildViewController_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)setActive:(BOOL)active
{
  if (active)
    -[UISearchController _performAutomaticPresentationFromTextField:](self, "_performAutomaticPresentationFromTextField:", 0);
  else
    -[UISearchController _dismissPresentation:](self, "_dismissPresentation:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
}

- (BOOL)automaticallyShowsSearchResultsController
{
  return *(_BYTE *)&self->_controllerFlags >> 7;
}

- (void)_setShowResultsForEmptySearch:(BOOL)a3
{
  self->__showResultsForEmptySearch = a3;
  -[UISearchController _updateVisibilityOfSearchResultsForSearchBar:](self, "_updateVisibilityOfSearchResultsForSearchBar:", self->_searchBar);
}

- (void)setAutomaticallyShowsScopeBar:(BOOL)automaticallyShowsScopeBar
{
  int v3;

  if (automaticallyShowsScopeBar)
    v3 = 0;
  else
    v3 = 32;
  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFF9F | v3);
}

- (BOOL)automaticallyShowsScopeBar
{
  return (*(_DWORD *)&self->_controllerFlags & 0x60) != 32;
}

- (UISearchControllerScopeBarActivation)scopeBarActivation
{
  return ((unint64_t)self->_controllerFlags >> 5) & 3;
}

- (void)_scopeBarWillShowOrHide
{
  id WeakRetained;
  id v3;
  id v4;

  if (a1 && (*(_DWORD *)(a1 + 1044) & 0x60) == 0x20)
  {
    if (objc_msgSend(*(id *)(a1 + 968), "_isHostedByNavigationBar"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
      objc_msgSend(WeakRetained, "_navigationBar");
      v4 = (id)objc_claimAutoreleasedReturnValue();

      v3 = objc_loadWeakRetained((id *)(a1 + 1200));
      objc_msgSend(v4, "_searchScopeBarWillManuallyShowOrHideForNavigationItem:", v3);

    }
  }
}

- (BOOL)_dci_automaticScopeBarShowsOnPresentation
{
  unint64_t v2;
  int v3;

  if (self)
  {
    v2 = ((unint64_t)self->_controllerFlags >> 5) & 3;
    if (!(_DWORD)v2)
    {
      v3 = dyld_program_sdk_at_least();
      v2 = 2;
      if (!v3)
        v2 = 3;
    }
  }
  else
  {
    v2 = 0;
  }
  return v2 == 3;
}

- (void)_sizeSearchViewToPresentingViewController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__UISearchController__sizeSearchViewToPresentingViewController___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);

}

void __64__UISearchController__sizeSearchViewToPresentingViewController___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 40), "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

}

- (BOOL)_searchFieldIsBeginningEditing
{
  return (*((unsigned __int8 *)&self->_controllerFlags + 1) >> 1) & 1;
}

- (BOOL)_searchBarShouldFinalizeBecomingFirstResponder
{
  UISearchController *v3;
  uint64_t v4;
  void *v5;
  BOOL v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  char v13;

  -[UISearchController _locatePresentingViewController](self, "_locatePresentingViewController");
  v3 = (UISearchController *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _transitionCoordinator](v3, "_transitionCoordinator");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v7 = v3 == self || v4 == 0;
  -[UIViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "userInterfaceIdiom") == 2)
    goto LABEL_10;
  -[UIViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "userInterfaceIdiom") == 8)
  {

LABEL_10:
    goto LABEL_11;
  }
  -[UIViewController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = v12 == 3 || v7;
  if ((v13 & 1) != 0 || !v5)
  {
    if ((v13 & 1) == 0)
    {
LABEL_23:
      v10 = 0;
      goto LABEL_24;
    }
  }
  else if (!-[UIViewController isBeingPresented](self, "isBeingPresented")
         || !-[UISearchBar _isHostedByNavigationBar](self->_searchBar, "_isHostedByNavigationBar"))
  {
    goto LABEL_23;
  }
LABEL_11:
  if (-[UIViewController _appearState](v3, "_appearState") == 3
    || !-[UIViewController _appearState](v3, "_appearState"))
  {
    goto LABEL_23;
  }
  v10 = 1;
LABEL_24:

  return v10;
}

- (void)_clearSearchSuggestionsIfNecessary
{
  void *v2;
  int v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 1045) & 0x20) != 0)
    {
      objc_msgSend((id)a1, "_suggestionController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "hasVisibleMenu");

      if (v3)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
          {
            v7 = 138412290;
            v8 = a1;
            _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "UIKit inconsistency: Menu became visible with clear-search-suggestions still pending. Search suggestions will not be cleared. %@", (uint8_t *)&v7, 0xCu);
          }

        }
        else
        {
          v4 = _clearSearchSuggestionsIfNecessary___s_category_0;
          if (!_clearSearchSuggestionsIfNecessary___s_category_0)
          {
            v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v4, (unint64_t *)&_clearSearchSuggestionsIfNecessary___s_category_0);
          }
          v5 = *(NSObject **)(v4 + 8);
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            v7 = 138412290;
            v8 = a1;
            _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "UIKit inconsistency: Menu became visible with clear-search-suggestions still pending. Search suggestions will not be cleared. %@", (uint8_t *)&v7, 0xCu);
          }
        }
      }
      else
      {
        objc_msgSend((id)a1, "setSearchSuggestions:", 0);
      }
    }
    *(_DWORD *)(a1 + 1044) &= ~0x2000u;
  }
}

- (void)_searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  id v5;

  if (dyld_program_sdk_at_least())
  {
    -[UISearchController _clearSearchSuggestionsIfNecessary]((uint64_t)self);
    -[UISearchController searchResultsUpdater](self, "searchResultsUpdater");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateSearchResultsForSearchController:", self);

  }
}

- (void)_tvos_searchBar:(id)a3 textDidChange:(id)a4 programatically:(BOOL)a5
{
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      goto LABEL_7;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "UIKit issue: dedicated tvOS method not executed on this platform: %@", (uint8_t *)&v10, 0xCu);
LABEL_6:

LABEL_7:
    return;
  }
  v6 = _tvos_searchBar_textDidChange_programatically____s_category;
  if (!_tvos_searchBar_textDidChange_programatically____s_category)
  {
    v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&_tvos_searchBar_textDidChange_programatically____s_category);
  }
  v7 = *(NSObject **)(v6 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = v7;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "UIKit issue: dedicated tvOS method not executed on this platform: %@", (uint8_t *)&v10, 0xCu);
    goto LABEL_6;
  }
}

- (void)__searchBar:(int)a3 changedSearchTextFieldContentProgramatically:
{
  void *v3;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (a1)
  {
    if (a3)
    {
      if ((objc_msgSend((id)a1, "isBeingDismissed") & 1) != 0)
        goto LABEL_16;
      objc_msgSend(v13, "_searchBarTextField");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "_hasContent"))
      {
LABEL_15:

        goto LABEL_16;
      }
    }
    v6 = (*(_DWORD *)(a1 + 1044) >> 5) & 3;
    if (v6 != 2 && (v6 || !dyld_program_sdk_at_least())
      || objc_msgSend(*(id *)(a1 + 968), "showsScopeBar"))
    {
      if ((a3 & 1) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
    objc_msgSend(*(id *)(a1 + 968), "scopeButtonTitles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (a3)
    if (v8)
    {
      v9 = *(void **)(a1 + 968);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
      objc_msgSend(WeakRetained, "_navigationBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_searchBarTextField");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setDeferredAutomaticShowsScopeBarInNavigationBar:hasContent:", v11, objc_msgSend(v12, "_hasContent"));

      v3 = objc_loadWeakRetained((id *)(a1 + 1200));
      objc_msgSend(v3, "_searchControllerReadyForDeferredAutomaticShowsScopeBar");
      goto LABEL_15;
    }
  }
LABEL_16:

}

- (void)__searchTextFieldDidSetOrInsertTokens:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    v5 = v3;
    objc_msgSend(*(id *)(a1 + 968), "_searchBarTextField");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v3 = v5;
    if (v4 == v5)
    {
      -[UISearchController __searchBar:changedSearchTextFieldContentProgramatically:](a1, *(void **)(a1 + 968), 1);
      v3 = v5;
    }
  }

}

- (void)_ios_searchBar:(id)a3 textDidChange:(id)a4 programatically:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a3;
  v8 = a4;
  if (!v5)
  {
    objc_msgSend(v12, "_searchBarTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_needsDelayedSearchControllerPresentation");

    if (v10)
      -[UISearchController _performDidBeginEditingForSearchBar:](self, "_performDidBeginEditingForSearchBar:", v12);
    else
      -[UISearchController _clearSearchSuggestionsIfNecessary]((uint64_t)self);
  }
  -[UISearchController __searchBar:changedSearchTextFieldContentProgramatically:]((uint64_t)self, v12, v5);
  -[UISearchController _updateVisibilityOfSearchResultsForSearchBar:](self, "_updateVisibilityOfSearchResultsForSearchBar:", v12);
  -[UISearchController searchResultsUpdater](self, "searchResultsUpdater");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateSearchResultsForSearchController:", self);

}

- (void)_searchBarTokensDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISearchController _clearSearchSuggestionsIfNecessary]((uint64_t)self);
  -[UISearchController _updateVisibilityOfSearchResultsForSearchBar:](self, "_updateVisibilityOfSearchResultsForSearchBar:", v4);

  -[UISearchController searchResultsUpdater](self, "searchResultsUpdater");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSearchResultsForSearchController:", self);

}

- (void)_performDidBeginEditingForSearchBar:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "_searchBarTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_resetNeedsDelayedSearchControllerPresentation");

  -[UISearchController _performAutomaticPresentationFromTextField:](self, "_performAutomaticPresentationFromTextField:", 1);
  -[UIViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 3)
  {
    -[UIViewController _focusSystem](self, "_focusSystem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_focusedView");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isDescendantOfView:", self->_resultsControllerViewContainer))
    {
      -[UISearchController _animatorForBarPresentationStyle:dismissing:](self, "_animatorForBarPresentationStyle:dismissing:", self->_barPresentationStyle, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didFocusSearchBarForController:", self);

    }
  }
}

- (void)_searchBarTextDidBeginEditing:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "_searchBarTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_needsDelayedSearchControllerPresentation");

  if ((v5 & 1) == 0)
    -[UISearchController _performDidBeginEditingForSearchBar:](self, "_performDidBeginEditingForSearchBar:", v6);

}

- (void)_searchBarSearchButtonClicked:(id)a3
{
  +[UISearchController _resignSearchBarAsFirstResponder:](UISearchController, "_resignSearchBarAsFirstResponder:", a3);
}

- (void)_searchBarCancelButtonClicked:(id)a3
{
  -[UISearchController _clearSearchSuggestionsIfNecessary]((uint64_t)self);
  -[UISearchController _dismissPresentation:](self, "_dismissPresentation:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
}

- (void)_searchBarSearchTextFieldRequirementDidChange:(id)a3
{
  UINavigationItem **p_navigationItemCurrentlyDisplayingSearchController;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  p_navigationItemCurrentlyDisplayingSearchController = &self->__navigationItemCurrentlyDisplayingSearchController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_navigationItemCurrentlyDisplayingSearchController);
  objc_msgSend(WeakRetained, "_updateSearchBarItemGroup");

  LODWORD(WeakRetained) = objc_msgSend(v4, "_requiresSearchTextField");
  objc_msgSend(v4, "_searchBarTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "window");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if ((_DWORD)WeakRetained && !v10)
  {
    v8 = objc_loadWeakRetained((id *)p_navigationItemCurrentlyDisplayingSearchController);
    objc_msgSend(v8, "_navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutIfNeeded");

    v7 = 0;
  }

}

- (id)_locatePresentingViewControllerIfInManagedPaletteOrHostedByNavigationBar
{
  UISearchBar *searchBar;
  void *v4;
  id WeakRetained;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  UISearchController *v14;

  searchBar = self->_searchBar;
  if (searchBar)
  {
    -[UIView _viewControllerForAncestor](searchBar, "_viewControllerForAncestor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_10;
    WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
    if (objc_msgSend(WeakRetained, "_hasInlineSearchBar"))
    {
      v6 = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
      objc_msgSend(v6, "_inlineSearchBarItemGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isHidden");

      if ((v8 & 1) != 0)
      {
        v4 = 0;
        goto LABEL_10;
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
      objc_msgSend(WeakRetained, "_navigationBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_effectiveDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

LABEL_10:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "topViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      if (self->_managedPalette)
        goto LABEL_17;
      if (objc_msgSend(v11, "_isNestedNavigationController"))
      {
        objc_msgSend(v9, "topViewController");
        v12 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v12;
      }
      objc_msgSend(v9, "navigationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_searchControllerIfAllowed");
      v14 = (UISearchController *)objc_claimAutoreleasedReturnValue();

      if (v14 == self)
        goto LABEL_17;

    }
    v9 = 0;
LABEL_17:

    return v9;
  }
  v9 = 0;
  return v9;
}

- (id)_locatePresentingViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UISearchController _locatePresentingViewControllerIfInManagedPaletteOrHostedByNavigationBar](self, "_locatePresentingViewControllerIfInManagedPaletteOrHostedByNavigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UISearchController searchBar](self, "searchBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_viewControllerForAncestor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[UIViewController _window](self, "_window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rootViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  _firstChildViewControllerDefiningPresentationContext(v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = v3;

  return v6;
}

- (void)_contentScrollViewDidFinishContentOffsetAnimation
{
  void (**deferredActivationOrDismissal)(id, SEL);
  id v4;

  if (self)
  {
    deferredActivationOrDismissal = (void (**)(id, SEL))self->_deferredActivationOrDismissal;
    if (deferredActivationOrDismissal)
    {
      deferredActivationOrDismissal[2](deferredActivationOrDismissal, a2);
      v4 = self->_deferredActivationOrDismissal;
      self->_deferredActivationOrDismissal = 0;

      *(_DWORD *)&self->_controllerFlags &= ~0x100000u;
    }
  }
}

- (void)_performAutomaticPresentationFromTextField:(BOOL)a3
{
  UINavigationItem **p_navigationItemCurrentlyDisplayingSearchController;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  id deferredActivationOrDismissal;
  void *v13;
  BOOL v14;
  uint64_t v15;
  id v16;
  void (**v17)(_QWORD);
  void *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(_QWORD);
  _QWORD v22[5];
  id v23;
  BOOL v24;
  BOOL v25;
  _QWORD aBlock[4];
  id v27;
  BOOL v28;
  id location;

  p_navigationItemCurrentlyDisplayingSearchController = &self->__navigationItemCurrentlyDisplayingSearchController;
  WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)p_navigationItemCurrentlyDisplayingSearchController);
    if (objc_msgSend(v8, "searchBarPlacement") == 2)
    {
      v9 = objc_loadWeakRetained((id *)p_navigationItemCurrentlyDisplayingSearchController);
      v10 = objc_msgSend(v9, "_shouldSearchControllerDeferPresentationTransition:", self);

      if (v10)
      {
        if ((*((_BYTE *)&self->_controllerFlags + 2) & 0x10) != 0 || !self->_deferredActivationOrDismissal)
        {
          objc_initWeak(&location, self);
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke;
          aBlock[3] = &unk_1E16BFC68;
          objc_copyWeak(&v27, &location);
          v28 = a3;
          v11 = _Block_copy(aBlock);
          deferredActivationOrDismissal = self->_deferredActivationOrDismissal;
          self->_deferredActivationOrDismissal = v11;

          *(_DWORD *)&self->_controllerFlags |= 0x100000u;
          objc_destroyWeak(&v27);
          objc_destroyWeak(&location);
        }
        return;
      }
    }
    else
    {

    }
  }
  -[UISearchController _locatePresentingViewController](self, "_locatePresentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isBeingDismissed") & 1) == 0)
  {
    if (self)
      v14 = self->super._parentModalViewController != 0;
    else
      v14 = 0;
    v15 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke_2;
    v22[3] = &unk_1E16B4E20;
    v22[4] = self;
    v16 = v13;
    v23 = v16;
    v24 = v14;
    v25 = a3;
    v17 = (void (**)(_QWORD))_Block_copy(v22);
    objc_msgSend(v16, "transitionCoordinator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v16, "transitionCoordinator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v15;
      v20[1] = 3221225472;
      v20[2] = __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke_4;
      v20[3] = &unk_1E16B1CC8;
      v21 = v17;
      objc_msgSend(v19, "animateAlongsideTransition:completion:", 0, v20);

    }
    else
    {
      v17[2](v17);
    }

  }
}

void __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performAutomaticPresentationFromTextField:", *(unsigned __int8 *)(a1 + 40));

}

void __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_createSystemInputViewControllerIfNeededForTraitEnvironment:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48) || v2 && *(_QWORD *)(v2 + 120))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 1152));
    goto LABEL_5;
  }
  v7 = objc_loadWeakRetained((id *)(v2 + 1200));
  if ((objc_msgSend(v7, "_hasInlineSearchBar") & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "_searchBarTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v21 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1200));
      objc_msgSend(v21, "_inlineSearchBarItemGroup");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isHidden");

      if ((v23 & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "_shrinkToButtonIfNecessary");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "_setRequiresSearchTextField:", 1);
      }
      goto LABEL_10;
    }

  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "_sizeSearchViewToPresentingViewController:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1152));
  if (!WeakRetained
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(WeakRetained, "presentSearchController:", *(_QWORD *)(a1 + 32)), (v10 = *(_QWORD *)(a1 + 32)) == 0)
    || !*(_QWORD *)(v10 + 120))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1044) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1044) & 0xFFFFFDFF | (*(unsigned __int8 *)(a1 + 49) << 9);
      objc_msgSend(*(id *)(a1 + 32), "_willPresentFromViewController:", *(_QWORD *)(a1 + 40));
      v12 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(a1 + 40);
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke_3;
      v27 = &unk_1E16B1B50;
      v28 = v12;
      v29 = v11;
      objc_msgSend(v29, "presentViewController:animated:completion:", v12, 1, &v24);
      if (objc_msgSend(*(id *)(a1 + 32), "modalPresentationStyle", v24, v25, v26, v27, v28) == 7)
      {
        objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPermittedArrowDirections:", 15);
        objc_msgSend(*(id *)(a1 + 32), "searchBar");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "searchField");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSourceView:", v15);

        if ((dyld_program_sdk_at_least() & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "searchBar");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "searchField");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "bounds");
          objc_msgSend(v13, "setSourceRect:");

        }
        objc_msgSend(*(id *)(a1 + 32), "searchBar");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "searchField");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPassthroughViews:", v20);

      }
    }
  }
LABEL_5:
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateVisibilityOfSearchResultsForSearchBar:", v5);

  objc_msgSend(*(id *)(a1 + 32), "searchResultsUpdater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateSearchResultsForSearchController:", *(_QWORD *)(a1 + 32));

}

uint64_t __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_didPresentFromViewController:", *(_QWORD *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1044) &= ~0x200u;
  return result;
}

uint64_t __65__UISearchController__performAutomaticPresentationFromTextField___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_dismissPresentation:(BOOL)a3
{
  UINavigationItem **p_navigationItemCurrentlyDisplayingSearchController;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  id deferredActivationOrDismissal;
  void *v13;
  void *v14;
  _BOOL8 v15;
  _QWORD v16[5];
  _QWORD aBlock[4];
  id v18;
  BOOL v19;
  id location;

  p_navigationItemCurrentlyDisplayingSearchController = &self->__navigationItemCurrentlyDisplayingSearchController;
  WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)p_navigationItemCurrentlyDisplayingSearchController);
    if (objc_msgSend(v8, "searchBarPlacement") == 2)
    {
      v9 = objc_loadWeakRetained((id *)p_navigationItemCurrentlyDisplayingSearchController);
      v10 = objc_msgSend(v9, "_shouldSearchControllerDeferPresentationTransition:", self);

      if (v10)
      {
        if ((*((_BYTE *)&self->_controllerFlags + 2) & 0x10) == 0 || !self->_deferredActivationOrDismissal)
        {
          objc_initWeak(&location, self);
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __43__UISearchController__dismissPresentation___block_invoke;
          aBlock[3] = &unk_1E16BFC68;
          objc_copyWeak(&v18, &location);
          v19 = a3;
          v11 = _Block_copy(aBlock);
          deferredActivationOrDismissal = self->_deferredActivationOrDismissal;
          self->_deferredActivationOrDismissal = v11;

          objc_destroyWeak(&v18);
          objc_destroyWeak(&location);
        }
        return;
      }
    }
    else
    {

    }
  }
  -[UIViewController presentingViewController](self, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 || (dyld_program_sdk_at_least() & 1) == 0)
    -[UISearchController _willDismissSearchController](self, "_willDismissSearchController");
  -[UISearchBar searchTextField](self->_searchBar, "searchTextField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", 0);
  objc_msgSend(v14, "setTokens:", MEMORY[0x1E0C9AA60]);
  +[UISearchController _resignSearchBarAsFirstResponder:](UISearchController, "_resignSearchBarAsFirstResponder:", self->_searchBar);
  v15 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __43__UISearchController__dismissPresentation___block_invoke_2;
  v16[3] = &unk_1E16B1B28;
  v16[4] = self;
  objc_msgSend(v13, "dismissViewControllerAnimated:completion:", v15, v16);

}

void __43__UISearchController__dismissPresentation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissPresentation:", *(unsigned __int8 *)(a1 + 40));

}

uint64_t __43__UISearchController__dismissPresentation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didDismissSearchController");
}

- (void)_showSearchSuggestionsListIfApplicable
{
  id WeakRetained;
  void *v3;
  id v4;
  char v5;
  void *v6;
  _UISearchSuggestionsListViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v4 = objc_loadWeakRetained((id *)(a1 + 1200));
    v5 = objc_msgSend(v4, "_hasInlineSearchBar");

    if ((v5 & 1) == 0)
    {
      v6 = *(void **)(a1 + 1128);
      if (!v6)
      {
        v7 = -[_UISearchSuggestionsListViewController initWithSearchController:]([_UISearchSuggestionsListViewController alloc], "initWithSearchController:", a1);
        v8 = *(void **)(a1 + 1128);
        *(_QWORD *)(a1 + 1128) = v7;

        objc_msgSend((id)a1, "addChildViewController:", *(_QWORD *)(a1 + 1128));
        objc_msgSend(*(id *)(a1 + 1128), "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAutoresizingMask:", 18);
        if (*(_QWORD *)(a1 + 1160))
        {
          objc_msgSend((id)a1, "loadViewIfRequired");
          objc_msgSend(*(id *)(a1 + 1112), "bounds");
          objc_msgSend(v9, "setFrame:");
          v10 = *(void **)(a1 + 1112);
          objc_msgSend(*(id *)(a1 + 1128), "view");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v10;
          v13 = v11;
        }
        else
        {
          objc_msgSend((id)a1, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "bounds");
          objc_msgSend(v9, "setFrame:");

          objc_msgSend((id)a1, "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v12;
          v13 = v9;
        }
        objc_msgSend(v12, "addSubview:", v13);

        objc_msgSend(*(id *)(a1 + 1128), "didMoveToParentViewController:", a1);
        v6 = *(void **)(a1 + 1128);
      }
      objc_msgSend(v6, "view");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 0);

    }
  }
}

- (void)_updateSearchSuggestionsListVisibility
{
  -[UISearchController _updateSearchSuggestionsListVisibilityShouldRequestNavigationControllerObservingUpdate:](self, "_updateSearchSuggestionsListVisibilityShouldRequestNavigationControllerObservingUpdate:", 1);
}

- (void)_updateHasPendingSuggestionMenuRefreshFlagForReason:(int64_t)a3
{
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  $D69225ED9BA803AE184F8CEF6B0C1DE3 v14;
  int v15;
  int v16;
  $D69225ED9BA803AE184F8CEF6B0C1DE3 v17;
  char isSuggestionsListViewControllerView;
  $D69225ED9BA803AE184F8CEF6B0C1DE3 v19;
  int v20;
  void *v21;
  int v22;
  unsigned int v23;
  void *v24;
  uint64_t v25;
  $D69225ED9BA803AE184F8CEF6B0C1DE3 v26;
  int v27;
  unsigned int v28;
  int v29;
  $D69225ED9BA803AE184F8CEF6B0C1DE3 v30;
  int v31;
  int v32;
  id v33;

  controllerFlags = self->_controllerFlags;
  if ((*(_DWORD *)&controllerFlags & 0x10000) == 0)
  {
    switch(a3)
    {
      case 0:
      case 2:
      case 4:
        WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
        objc_msgSend(WeakRetained, "_navigationBar");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_viewControllerForAncestor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "_splitViewControllerEnforcingClass:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (a3)
        {
          -[UISearchController _suggestionController](self, "_suggestionController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "hasVisibleMenu");

          v13 = objc_msgSend(v10, "_isExpanding");
          v14 = self->_controllerFlags;
          if (v13 | ((unsigned __int16)(*(_WORD *)&v14 & 0x8000) >> 15))
            v15 = 0x40000;
          else
            v15 = 0x10000;
          if (v13 | ((unsigned __int16)(*(_WORD *)&v14 & 0x8000) >> 15))
            v16 = -262145;
          else
            v16 = -65537;
          if (!v12)
            v15 = 0;
          v17 = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(v16 & *(_DWORD *)&v14 | v15);
          goto LABEL_13;
        }
        if (objc_msgSend(v9, "_isExpanding"))
        {
          isSuggestionsListViewControllerView = -[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self);
          v19 = self->_controllerFlags;
          if ((isSuggestionsListViewControllerView & 1) != 0)
          {
            v20 = 0x40000;
LABEL_32:
            v17 = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(v20 | *(_DWORD *)&v19 & 0xFFFBFFFF);
LABEL_13:
            self->_controllerFlags = v17;
            goto LABEL_14;
          }
          if ((*(_WORD *)&v19 & 0x8000) == 0)
          {
            v20 = 0;
            goto LABEL_32;
          }
          -[UISearchController _suggestionController](self, "_suggestionController");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "hasVisibleMenu"))
            v32 = 0x40000;
          else
            v32 = 0;
          v30 = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFBFFFF | v32);
          goto LABEL_45;
        }
        v29 = *(_DWORD *)&self->_controllerFlags & 0xC000;
        if (v29)
        {
          -[UISearchController searchSuggestions](self, "searchSuggestions");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "count"))
          {
            v30 = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags | 0x10000);
LABEL_45:
            self->_controllerFlags = v30;
LABEL_46:

            goto LABEL_14;
          }
        }
        if (-[UISearchController _isSuggestionsListViewControllerViewUnhidden]((uint64_t)self))
          v31 = 0x10000;
        else
          v31 = 0;
        self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFEFFFF | v31);
        if (v29)
          goto LABEL_46;
LABEL_14:

        break;
      case 1:
        goto LABEL_17;
      case 3:
        -[UISearchController searchBar](self, "searchBar");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isFirstResponder");

        v23 = self->_controllerFlags;
        if (v22)
        {
          if ((v23 & 0xC000) != 0)
          {
            -[UISearchController searchSuggestions](self, "searchSuggestions");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "count");
            v26 = self->_controllerFlags;
            v27 = *(_DWORD *)&v26 | 0x10000;
            v28 = *(_DWORD *)&v26 & 0xFFFEFFFF | (((*(unsigned int *)&v26 >> 18) & 1) << 16);
            if (v25)
              v28 = v27;
            self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)v28;

            v23 = self->_controllerFlags;
          }
          else
          {
            v23 = v23 & 0xFFFEFFFF | (((v23 >> 18) & 1) << 16);
          }
        }
        self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(v23 & 0xFFFBFFFF);
        if ((v23 & 0x10000) != 0)
        {
          -[UIView superview](self->_searchBar, "superview");
          v33 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setNeedsLayout");

        }
        return;
      default:
        return;
    }
  }
  if (a3 == 1)
  {
    controllerFlags = self->_controllerFlags;
LABEL_17:
    self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&controllerFlags & 0xFFFAFFFF);
  }
}

- (void)_requestPendingSuggestionMenuRefresh
{
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;

  if ((*((_BYTE *)&self->_controllerFlags + 2) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
    v4 = objc_msgSend(WeakRetained, "_hasInlineSearchBar");

    if (v4)
    {
      -[UISearchController _suggestionController](self, "_suggestionController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchController _searchSuggestionGroups](self, "_searchSuggestionGroups");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateSuggestionGroups:userInitiated:", v6, 0);

    }
  }
  *(_DWORD *)&self->_controllerFlags &= ~0x10000u;
}

void __147__UISearchController__requestNavigationControllerObservingUpdateForSearchBar_visibilityChangedForSearchSuggestionsList_forSearchResultsController___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v8 = a2;
  if (a2 == v5)
  {
    v9 = 5;
  }
  else
  {
    objc_msgSend(v6, "_updateAndObserveScrollView:viewController:forEdges:", a2, v7, 1);
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = v10;
    v9 = 4;
  }
  objc_msgSend(v6, "_updateAndObserveScrollView:viewController:forEdges:", v8, v7, v9);

}

id __147__UISearchController__requestNavigationControllerObservingUpdateForSearchBar_visibilityChangedForSearchSuggestionsList_forSearchResultsController___block_invoke_2(uint64_t a1, int a2, int a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  id *v10;
  id result;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "_contentOrObservableScrollViewForEdge:", 1);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 1160;
  }
  else
  {
    if (!a3)
    {
      v10 = (id *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 40), "_contentOrObservableScrollViewForEdge:", 1);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "_contentOrObservableScrollViewForEdge:", 1);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 1128;
  }
  v10 = (id *)(v8 + v9);
LABEL_7:
  objc_msgSend(*v10, "_contentOrObservableScrollViewForEdge:", 4);
  result = (id)objc_claimAutoreleasedReturnValue();
  *a5 = result;
  return result;
}

- (void)_setupForCurrentTraitCollection
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  UISearchController *v9;
  UISearchController *v10;
  UISearchController *v11;
  void *v12;
  void *v13;
  UISearchController *v14;
  UISearchController *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;

  -[UIViewController traitCollection](self, "traitCollection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[UIViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    -[UISearchController _uninstallBackGestureRecognizer](self, "_uninstallBackGestureRecognizer");
    -[UISearchController _uninstallDoneGestureRecognizer](self, "_uninstallDoneGestureRecognizer");
    if ((v6 == 8 || v6 == 2)
      && dyld_program_sdk_at_least()
      && (-[UISearchController _systemInputViewControllerAfterUpdate:](self, "_systemInputViewControllerAfterUpdate:", 0), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "resolvedKeyboardStyle"), v7, v8 == 2))
    {
      -[UISearchController _installBackGestureRecognizer](self, "_installBackGestureRecognizer");
      -[UISearchController _installDoneGestureRecognizer](self, "_installDoneGestureRecognizer");
      -[UISearchController _removeCarPlayLimitedUIObserver](self, "_removeCarPlayLimitedUIObserver");
    }
    else if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v9 = self;
      v10 = v9;
      if (v9)
      {
        v11 = v9;
        while (-[UIViewController _transitionsChildViewControllers](v11, "_transitionsChildViewControllers"))
        {
          -[UIViewController parentViewController](v11, "parentViewController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            v14 = v12;
          }
          else
          {
            -[UIViewController presentingViewController](v11, "presentingViewController");
            v14 = (UISearchController *)objc_claimAutoreleasedReturnValue();
          }
          v15 = v14;

          v11 = v15;
          if (!v15)
            goto LABEL_15;
        }
      }
      else
      {
LABEL_15:
        -[UISearchController _installBackGestureRecognizer](v10, "_installBackGestureRecognizer");
        v11 = 0;
      }
      -[UISearchController _installDoneGestureRecognizer](v10, "_installDoneGestureRecognizer");
      -[UISearchController _carPlayLimitedUIToken](v10, "_carPlayLimitedUIToken");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController traitCollection](v10, "traitCollection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "userInterfaceIdiom");

      if (v18 != 3 || v16)
      {
        -[UIViewController traitCollection](v10, "traitCollection");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "userInterfaceIdiom");

        if (v22 != 3)
        {
          if (v16)
            -[UISearchController _removeCarPlayLimitedUIObserver](v10, "_removeCarPlayLimitedUIObserver");
        }
      }
      else
      {
        objc_initWeak(&location, v10);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = MEMORY[0x1E0C809B0];
        v24 = 3221225472;
        v25 = __53__UISearchController__setupForCurrentTraitCollection__block_invoke;
        v26 = &unk_1E16B22E0;
        objc_copyWeak(&v27, &location);
        objc_msgSend(v19, "addObserverForName:object:queue:usingBlock:", CFSTR("UIScreenCarScreenLimitedUIDidChangeNotification"), 0, v20, &v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[UISearchController _setCarPlayLimitedUIToken:](v10, "_setCarPlayLimitedUIToken:", v16, v23, v24, v25, v26);
        -[UISearchController _limitedUIDidChangeAnimated:](v10, "_limitedUIDidChangeAnimated:", 0);
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }

    }
  }
  else
  {
    -[UISearchController _uninstallBackGestureRecognizer](self, "_uninstallBackGestureRecognizer");
    -[UISearchController _uninstallDoneGestureRecognizer](self, "_uninstallDoneGestureRecognizer");
  }
}

void __53__UISearchController__setupForCurrentTraitCollection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_limitedUIDidChangeAnimated:", 1);

}

- (void)_installBackGestureRecognizer
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *backButtonDismissGestureRecognizer;
  id v5;

  if (!self->_backButtonDismissGestureRecognizer)
  {
    v3 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleBackButtonGesture_);
    backButtonDismissGestureRecognizer = self->_backButtonDismissGestureRecognizer;
    self->_backButtonDismissGestureRecognizer = v3;

    -[UITapGestureRecognizer setAllowedPressTypes:](self->_backButtonDismissGestureRecognizer, "setAllowedPressTypes:", &unk_1E1A94748);
    -[UIGestureRecognizer setDelegate:](self->_backButtonDismissGestureRecognizer, "setDelegate:", self);
  }
  -[UIViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", self->_backButtonDismissGestureRecognizer);

}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)_handleBackButtonGesture:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[UISearchController _dismissPresentation:](self, "_dismissPresentation:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
}

- (void)_installDoneGestureRecognizer
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *doneButtonGestureRecognizer;
  id v5;

  if (!self->_doneButtonGestureRecognizer)
  {
    v3 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__updateFocusFromDoneButton_);
    doneButtonGestureRecognizer = self->_doneButtonGestureRecognizer;
    self->_doneButtonGestureRecognizer = v3;

    -[UITapGestureRecognizer setAllowedPressTypes:](self->_doneButtonGestureRecognizer, "setAllowedPressTypes:", &unk_1E1A94760);
  }
  -[UIViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", self->_doneButtonGestureRecognizer);

}

- (void)_updateFocusFromDoneButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[UIViewController _focusSystem](self, "_focusSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_focusedView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_systemInputViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isDescendantOfView:", v6);

    if (v7)
    {
      *(_DWORD *)&self->_controllerFlags |= 0x800000u;
      -[UIViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    }
  }
}

- (void)_setCarPlayLimitedUIToken:(id)a3
{
  objc_setAssociatedObject(self, &kCarPlayLimitedUIWillAnimateTokenKey, a3, (void *)1);
}

- (id)_carPlayLimitedUIViewController
{
  return objc_getAssociatedObject(self, &kCarPlayLimitedUIViewControllerKey);
}

- (void)_setCarPlayLimitedUIViewController:(id)a3
{
  objc_setAssociatedObject(self, &kCarPlayLimitedUIViewControllerKey, a3, (void *)1);
}

- (void)_limitedUIDidChangeAnimated:(BOOL)a3
{
  _UISearchControllerLimitedUIShieldViewController *v4;
  void *v5;
  int v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  _QWORD v47[4];
  _UISearchControllerLimitedUIShieldViewController *v48;
  UISearchController *v49;
  _QWORD v50[5];
  _UISearchControllerLimitedUIShieldViewController *v51;
  _QWORD v52[4];
  _UISearchControllerLimitedUIShieldViewController *v53;
  UISearchController *v54;
  _QWORD aBlock[5];
  _QWORD v56[5];
  id v57;
  id location;
  _QWORD v59[6];

  v46 = a3;
  v59[4] = *MEMORY[0x1E0C80C00];
  -[UISearchController _carPlayLimitedUIViewController](self, "_carPlayLimitedUIViewController");
  v4 = (_UISearchControllerLimitedUIShieldViewController *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[UIViewController _screen](self, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isSoftKeyboardLimited");

  -[UIViewController view](self->_systemInputViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", v6 ^ 1u);

  -[UISearchController searchBar](self, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", v6 ^ 1u);

  if (v6)
  {
    if (!v4)
    {
      v4 = objc_alloc_init(_UISearchControllerLimitedUIShieldViewController);
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __50__UISearchController__limitedUIDidChangeAnimated___block_invoke;
      v56[3] = &unk_1E16B1500;
      objc_copyWeak(&v57, &location);
      v56[4] = self;
      -[_UISearchControllerLimitedUIShieldViewController setDismissAction:](v4, "setDismissAction:", v56);
      -[UISearchController _setCarPlayLimitedUIViewController:](self, "_setCarPlayLimitedUIViewController:", v4);
      -[UIViewController addChildViewController:](self, "addChildViewController:", v4);
      -[UIViewController view](v4, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      objc_msgSend(v10, "setFrame:");

      -[UIViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](v4, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", v13);

      -[UIViewController didMoveToParentViewController:](v4, "didMoveToParentViewController:", self);
      -[UIViewController view](v4, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v32 = (void *)MEMORY[0x1E0D156E0];
      -[UIViewController view](v4, "view");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "topAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "topAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToAnchor:", v42);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v41;
      -[UIViewController view](v4, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "bottomAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "bottomAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v37);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v59[1] = v36;
      -[UIViewController view](v4, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "leadingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "leadingAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v59[2] = v16;
      -[UIViewController view](v4, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "trailingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v59[3] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "activateConstraints:", v22);

      -[UISearchController searchBar](self, "searchBar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "cancelButton");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setEnabled:", 0);

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_2;
      aBlock[3] = &unk_1E16B3FD8;
      aBlock[4] = self;
      v25 = _Block_copy(aBlock);
      v26 = v25;
      if (v46)
      {
        -[UIViewController view](v4, "view");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setAlpha:", 0.0);

        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_3;
        v52[3] = &unk_1E16B1B50;
        v53 = v4;
        v54 = self;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v52, v26, 0.4);

      }
      else
      {
        (*((void (**)(void *, uint64_t))v25 + 2))(v25, 1);
      }

      objc_destroyWeak(&v57);
    }
  }
  else if (v4)
  {
    -[UISearchController searchBar](self, "searchBar");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHidden:", 0);

    -[UISearchController searchBar](self, "searchBar");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "cancelButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setEnabled:", 1);

    v31 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_4;
    v50[3] = &unk_1E16B1B50;
    v50[4] = self;
    v51 = v4;
    v47[0] = v31;
    v47[1] = 3221225472;
    v47[2] = __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_5;
    v47[3] = &unk_1E16B2218;
    v4 = v51;
    v48 = v4;
    v49 = self;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v50, v47, 0.4);
    -[UISearchController _setCarPlayLimitedUIViewController:](self, "_setCarPlayLimitedUIViewController:", 0);
    -[UIViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");

  }
  objc_destroyWeak(&location);

}

void __50__UISearchController__limitedUIDidChangeAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_willDismissSearchController");
    objc_msgSend(WeakRetained, "searchBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", 0);

    objc_msgSend(WeakRetained, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISearchController _resignSearchBarAsFirstResponder:](UISearchController, "_resignSearchBarAsFirstResponder:", v6);

    objc_msgSend(WeakRetained, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

    objc_msgSend(*(id *)(a1 + 32), "_didDismissSearchController");
  }
  else
  {
    objc_msgSend(WeakRetained, "setActive:", 0);
  }

}

void __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_firstCommonAncestorToView:givenCommonAncestor:", v4, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsFocusUpdate");

    v7 = *(void **)(a1 + 32);
  }
  objc_msgSend(v7, "setNeedsFocusUpdate");

}

void __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 40), "searchBar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

void __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

void __50__UISearchController__limitedUIDidChangeAnimated___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  objc_msgSend(*(id *)(a1 + 40), "searchBar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (id)focusItemContainer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[UISearchController _carPlayLimitedUIViewController](self, "_carPlayLimitedUIViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UISearchController;
    -[UIViewController focusItemContainer](&v9, sel_focusItemContainer);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (BOOL)_allowFormSheetStylePresentation
{
  return (self->_barPresentationStyle & 0xFFFFFFFE) == 2;
}

- (void)_updateBarPresentationStyleForPresentingViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  int v8;
  id v9;

  v9 = a3;
  -[UISearchController searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UISearchController searchBar](self, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[_UISearchPresentationController shouldExciseSearchBar:duringPresentationWithPresenter:](_UISearchPresentationController, "shouldExciseSearchBar:duringPresentationWithPresenter:", v6, v9);

    if (v7)
      v8 = 1;
    else
      v8 = 2;
  }
  else
  {
    v8 = 3;
  }
  self->_barPresentationStyle = v8;

}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v9;
  id v10;
  id v11;
  UIModalPresentationStyle v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _UISearchATVPresentationController *v16;
  int v17;
  void *v18;
  void *v20;
  uint64_t v21;
  __objc2_class *v22;
  void *v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[UISearchController _updateBarPresentationStyleForPresentingViewController:](self, "_updateBarPresentationStyleForPresentingViewController:", v10);
  v12 = -[UIViewController modalPresentationStyle](self, "modalPresentationStyle");
  if (v12 == UIModalPresentationFormSheet)
  {
    if (-[UISearchController _allowFormSheetStylePresentation](self, "_allowFormSheetStylePresentation"))
      v12 = UIModalPresentationFormSheet;
    else
      v12 = UIModalPresentationCustom;
  }
  objc_msgSend(v11, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "userInterfaceIdiom") == 2)
  {

LABEL_8:
    v16 = -[_UISearchPresentationController initWithPresentedViewController:presentingViewController:]([_UISearchATVPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v9, v10);
    v17 = 4;
LABEL_9:
    self->_barPresentationStyle = v17;
    goto LABEL_10;
  }
  objc_msgSend(v11, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (v15 == 8)
    goto LABEL_8;
  objc_msgSend(v11, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceIdiom");

  if (v21 == 3)
  {
    v16 = -[_UISearchPresentationController initWithPresentedViewController:presentingViewController:]([_UISearchCarPlayPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v9, v10);
    v17 = 5;
    goto LABEL_9;
  }
  switch(v12)
  {
    case UIModalPresentationFormSheet:
      v22 = _UISearchFormSheetPresentationController;
      break;
    case UIModalPresentationPopover:
      v22 = _UISearchPopoverPresentationController;
      break;
    case UIModalPresentationCustom:
      v22 = _UISearchPresentationController;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchController.m"), 2402, CFSTR("UISearchController only supports modal presentation styles UIModalPresentationPopover, UIModalPresentationFormSheet and UIModalPresentationCustom"));

      v16 = 0;
      goto LABEL_10;
  }
  v16 = (_UISearchATVPresentationController *)objc_msgSend([v22 alloc], "initWithPresentedViewController:presentingViewController:", v9, v10);
LABEL_10:
  -[UISearchController searchBar](self, "searchBar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchController _updateVisibilityOfSearchResultsForSearchBar:](self, "_updateVisibilityOfSearchResultsForSearchBar:", v18);

  return v16;
}

- (id)_searchPresentationController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[UIViewController _parentModalViewController](self, "_parentModalViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIViewController _parentModalViewController](self, "_parentModalViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_originalPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "adaptivePresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "adaptivePresentationController");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v5 = 0;
        }
      }
    }
  }
  return v5;
}

- (id)_animatorForBarPresentationStyle:(int)a3 dismissing:(BOOL)a4
{
  _BOOL4 v4;
  UISearchController *v7;
  void *v8;
  UISearchController *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __objc2_class *v15;
  void *v16;
  id result;
  NSObject *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  UISearchController *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = self;
  -[UISearchController searchBar](v7, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_searchController");
  v9 = (UISearchController *)objc_claimAutoreleasedReturnValue();

  if (v9 != v7)
  {
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Custom searchBar not correctly configured for UISearchController. The searchBar property getter override must always return the same searchBar instance, and never return nil. The getter may be called very early! searchBar = %@, searchController = %@"), v8, v7);
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v20 = v8;
          v21 = 2112;
          v22 = v7;
          _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Custom searchBar not correctly configured for UISearchController. The searchBar property getter override must always return the same searchBar instance, and never return nil. The getter may be called very early! searchBar = %@, searchController = %@", buf, 0x16u);
        }

      }
      else
      {
        v10 = _handleOrThrowForDisconnectedSearchBarAsAppropriate___s_category;
        if (!_handleOrThrowForDisconnectedSearchBarAsAppropriate___s_category)
        {
          v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v10, (unint64_t *)&_handleOrThrowForDisconnectedSearchBarAsAppropriate___s_category);
        }
        v11 = *(NSObject **)(v10 + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v20 = v8;
          v21 = 2112;
          v22 = v7;
          _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Custom searchBar not correctly configured for UISearchController. The searchBar property getter override must always return the same searchBar instance, and never return nil. The getter may be called very early! searchBar = %@, searchController = %@", buf, 0x16u);
        }
      }
      objc_msgSend(v8, "_setRequiresLegacyVisualProvider");
      _UIMainBundleIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.spotify.client"));

      if (v13)
      {
        objc_msgSend(v8, "backgroundImageForBarPosition:barMetrics:", 2, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setBackgroundImage:forBarPosition:barMetrics:", v14, 2, 101);

      }
    }
  }

  switch(a3)
  {
    case 1:
      v15 = _UISearchControllerTransplantSearchBarAnimator;
      goto LABEL_20;
    case 2:
      v15 = _UISearchControllerInPlaceSearchBarAnimator;
      goto LABEL_20;
    case 3:
      v15 = _UISearchControllerOffscreenSearchBarAnimator;
      goto LABEL_20;
    case 4:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("presentationStyle is _UISearchBarPresentationStyleATV, but we're not on tvOS. This is not supported."));
      goto LABEL_18;
    case 5:
      v15 = _UISearchControllerCarPlaySearchBarAnimator;
LABEL_20:
      result = objc_alloc_init(v15);
      break;
    default:
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("UISearchController.m"), 2491, CFSTR("How did we get here? Was state restoration involved?"));

      }
LABEL_18:
      result = 0;
      break;
  }
  return result;
}

- (id)_defaultAnimationController
{
  uint64_t barPresentationStyle;
  void *v4;
  objc_super v6;

  if (dyld_program_sdk_at_least())
  {
    barPresentationStyle = self->_barPresentationStyle;
    if (!(_DWORD)barPresentationStyle)
    {
      -[UISearchController _updateBarPresentationStyleForPresentingViewController:](self, "_updateBarPresentationStyleForPresentingViewController:", 0);
      barPresentationStyle = self->_barPresentationStyle;
    }
    -[UISearchController _animatorForBarPresentationStyle:dismissing:](self, "_animatorForBarPresentationStyle:dismissing:", barPresentationStyle, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UISearchController;
    -[UIViewController _defaultAnimationController](&v6, sel__defaultAnimationController);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)animationControllerForDismissedController:(id)a3
{
  UIViewControllerAnimatedTransitioning *v4;
  UIViewControllerAnimatedTransitioning *animator;

  -[UISearchController _animatorForBarPresentationStyle:dismissing:](self, "_animatorForBarPresentationStyle:dismissing:", self->_barPresentationStyle, 1);
  v4 = (UIViewControllerAnimatedTransitioning *)objc_claimAutoreleasedReturnValue();
  animator = self->_animator;
  self->_animator = v4;

  return self;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  UIViewControllerAnimatedTransitioning *v6;
  UIViewControllerAnimatedTransitioning *animator;

  -[UISearchController _animatorForBarPresentationStyle:dismissing:](self, "_animatorForBarPresentationStyle:dismissing:", self->_barPresentationStyle, 0, a5);
  v6 = (UIViewControllerAnimatedTransitioning *)objc_claimAutoreleasedReturnValue();
  animator = self->_animator;
  self->_animator = v6;

  return self;
}

- (double)transitionDuration:(id)a3
{
  double result;

  -[UIViewControllerAnimatedTransitioning transitionDuration:](self->_animator, "transitionDuration:", a3);
  return result;
}

- (void)animateTransition:(id)a3
{
  -[UIViewControllerAnimatedTransitioning animateTransition:](self->_animator, "animateTransition:", a3);
}

- (BOOL)_requiresCustomPresentationController
{
  return 1;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int64_t v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISearchController;
  -[UIViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v9, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (v6 && !v4)
  {
    if (-[UIViewController _appearState](self, "_appearState") == 2)
    {
      objc_msgSend(v6, "windowScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "interfaceOrientation");

      if (self->_lastKnownInterfaceOrientation != v8)
      {
        if (self->_managedPalette)
          -[UISearchController _adjustSearchBarSizeForOrientation:](self, "_adjustSearchBarSizeForOrientation:", v8);
        self->_lastKnownInterfaceOrientation = v8;
      }
    }
    goto LABEL_9;
  }
  if (v6)
LABEL_9:
    -[UISearchController _setupForCurrentTraitCollection](self, "_setupForCurrentTraitCollection");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISearchController;
  -[UIViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[UISearchController _animatorForBarPresentationStyle:dismissing:](self, "_animatorForBarPresentationStyle:dismissing:", self->_barPresentationStyle, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchController _updateKeyboardFocusGuidesForAnimator:](self, "_updateKeyboardFocusGuidesForAnimator:", v3);
  objc_msgSend(v3, "didRelayoutSearchBarForController:", self);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD v15[5];
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UISearchController;
  -[UIViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v16, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, v7);
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
    if ((objc_msgSend(WeakRetained, "_hasInlineSearchBar") & 1) != 0)
    {
      v9 = objc_msgSend(v6, "horizontalSizeClass");
      -[UIViewController traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "horizontalSizeClass");

      if (v9 != v11)
      {
        -[UISearchController _dci_searchSuggestions](self, "_dci_searchSuggestions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {
          -[UISearchController _suggestionController](self, "_suggestionController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "hasVisibleMenu"))
            v14 = 0;
          else
            v14 = 0x20000;
          self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFDFFFF | v14);

        }
        else
        {
          *(_DWORD *)&self->_controllerFlags &= ~0x20000u;
        }

        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __80__UISearchController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
        v15[3] = &unk_1E16B2150;
        v15[4] = self;
        objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v15);
      }
    }
    else
    {

    }
  }

}

uint64_t __80__UISearchController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 1044) &= ~0x20000u;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  _QWORD v17[10];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_toWindowOrientation");

  -[UISearchController _managedPalette](self, "_managedPalette");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && -[UISearchController isActive](self, "isActive"))
  {
    objc_msgSend(v11, "frame");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73__UISearchController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v17[3] = &unk_1E16DED10;
    v17[4] = self;
    v17[5] = v10;
    v17[6] = v12;
    v17[7] = v13;
    v17[8] = v14;
    v17[9] = v15;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v17, 0);
    if (!v10)
      goto LABEL_7;
    goto LABEL_6;
  }
  -[UISearchController _adjustSearchBarSizeForOrientation:](self, "_adjustSearchBarSizeForOrientation:", v10);
  if (v10)
LABEL_6:
    self->_lastKnownInterfaceOrientation = v10;
LABEL_7:
  v16.receiver = self;
  v16.super_class = (Class)UISearchController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

  -[UISearchController _updateHasPendingSuggestionMenuRefreshFlagForReason:](self, "_updateHasPendingSuggestionMenuRefreshFlagForReason:", 2);
}

uint64_t __73__UISearchController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustSearchBarSizeForOrientation:oldPaletteFrame:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (BOOL)_containedInNavigationPaletteAndNotHidden
{
  return 0;
}

- (void)_adjustSearchBarSizeForOrientation:(int64_t)a3
{
  -[UISearchController _adjustSearchBarSizeForOrientation:oldPaletteFrame:](self, "_adjustSearchBarSizeForOrientation:oldPaletteFrame:", a3, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (void)_adjustSearchBarSizeForOrientation:(int64_t)a3 oldPaletteFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  _BOOL4 IsNull;
  CGFloat v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  double v38;
  double v39;
  double v40;
  _BOOL4 v41;
  double MaxY;
  double v43;
  double v44;
  id v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (-[UISearchController _containedInNavigationPaletteAndNotHidden](self, "_containedInNavigationPaletteAndNotHidden"))
  {
    -[UISearchController searchBar](self, "searchBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prompt");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      -[UISearchController searchBar](self, "searchBar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "_scopeBarIsVisible");

      if ((v14 & 1) != 0)
        return;
    }
    else
    {

    }
    -[UISearchController searchBar](self, "searchBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (v15)
    {
      v16 = v15;
      do
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        v16 = (void *)objc_msgSend(v16, "superview");
      }
      while (v16);
    }
    else
    {
      v16 = 0;
    }
    v45 = v16;

    -[UISearchController searchBar](self, "searchBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_defaultHeightForOrientation:", a3);
    v19 = v18;

    -[UISearchController searchBar](self, "searchBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "size");
    v22 = v21;

    v23 = v45;
    if (v22 == v19)
      goto LABEL_28;
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    IsNull = CGRectIsNull(v46);
    if (IsNull)
    {
      objc_msgSend(v45, "frame");
      v25 = CGRectGetHeight(v47);
      v26 = v45;
      v43 = v19 - v25;
      v44 = 0.0;
    }
    else
    {
      v43 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v44 = *MEMORY[0x1E0C9D820];
      v26 = v45;
    }
    objc_msgSend(v26, "frame");
    v28 = v27;
    v30 = v29;
    objc_msgSend(v45, "superview");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bounds");
    v33 = v32;

    objc_msgSend(v45, "setFrame:", v28, v30, v33, v19);
    -[UISearchController searchBar](self, "searchBar");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bounds");
    objc_msgSend(v34, "setFrame:");

    -[UISearchController searchBar](self, "searchBar");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setNeedsLayout");

    -[UISearchController searchBar](self, "searchBar");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layoutIfNeeded");

    v37 = -[UISearchController isActive](self, "isActive");
    v23 = v45;
    if (!v37)
    {
LABEL_28:

      return;
    }
    if (IsNull)
    {
      if (-[UISearchController _resultsControllerWillLayoutVisibleUnderContainerView](self, "_resultsControllerWillLayoutVisibleUnderContainerView"))
      {
        v39 = v43;
        v38 = v44;
LABEL_21:
        -[UISearchController _updateSearchResultsContentScrollViewWithDelta:](self, "_updateSearchResultsContentScrollViewWithDelta:", v38, v39);
LABEL_27:
        -[UIViewController _updateContentOverlayInsetsFromParentIfNecessary](self, "_updateContentOverlayInsetsFromParentIfNecessary");
        -[UIViewController _updateContentOverlayInsetsForSelfAndChildren](self, "_updateContentOverlayInsetsForSelfAndChildren");
        v23 = v45;
        goto LABEL_28;
      }
      if (self->_managedPalette)
      {
        v50.origin.x = v28;
        v50.origin.y = v30;
        v50.size.width = v33;
        v50.size.height = v19;
        MaxY = CGRectGetMaxY(v50);
        -[UIView frame](self->_resultsControllerViewContainer, "frame");
        v39 = MaxY - CGRectGetMinY(v51);
      }
      else
      {
        v39 = v43;
      }
      v38 = v44;
    }
    else
    {
      v48.origin.x = v28;
      v48.origin.y = v30;
      v48.size.width = v33;
      v48.size.height = v19;
      v40 = CGRectGetMaxY(v48);
      v49.origin.x = x;
      v49.origin.y = y;
      v49.size.width = width;
      v49.size.height = height;
      v39 = v40 - CGRectGetMaxY(v49);
      v41 = -[UISearchController _resultsControllerWillLayoutVisibleUnderContainerView](self, "_resultsControllerWillLayoutVisibleUnderContainerView");
      v38 = 0.0;
      if (v41)
        goto LABEL_21;
    }
    -[UISearchController _resizeResultsControllerWithDelta:](self, "_resizeResultsControllerWithDelta:", v38, v39);
    goto LABEL_27;
  }
}

- (void)_updateSearchResultsContentScrollViewWithDelta:(CGSize)a3
{
  double height;
  void *v5;
  void *v6;
  uint64_t v7;
  UIViewController *searchResultsController;
  _BOOL4 v9;
  char v10;
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
  double v23;
  void *v24;

  height = a3.height;
  -[UIViewController _contentOrObservableScrollViewForEdge:](self->_searchResultsController, "_contentOrObservableScrollViewForEdge:", 1, a3.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v24 = v5;
    v7 = objc_msgSend(v5, "_compatibleContentInsetAdjustmentBehavior");
    v6 = v24;
    if (v7 == 101)
    {
      searchResultsController = self->_searchResultsController;
      if (searchResultsController)
      {
        v9 = -[UIViewController automaticallyAdjustsScrollViewInsets](searchResultsController, "automaticallyAdjustsScrollViewInsets");
        v6 = v24;
        if (v9)
        {
          v10 = -[UIViewController edgesForExtendedLayout](self->_searchResultsController, "edgesForExtendedLayout");
          v6 = v24;
          if ((v10 & 1) != 0)
          {
            objc_msgSend(v24, "contentOffset");
            v12 = v11;
            v14 = v13;
            objc_msgSend(v24, "contentInset");
            v16 = v15;
            v18 = v17;
            v20 = v19;
            v21 = v14 - height;
            v23 = height + v22;
            objc_msgSend(v24, "setContentOffset:", v12, v21);
            objc_msgSend(v24, "setContentInset:", v23, v16, v18, v20);
            v6 = v24;
          }
        }
      }
    }
  }

}

- (void)_updateSearchResultsPositionWithDelta:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  if (!-[UISearchController _resultsControllerWillLayoutVisibleUnderContainerView](self, "_resultsControllerWillLayoutVisibleUnderContainerView"))-[UISearchController _resizeResultsControllerWithDelta:](self, "_resizeResultsControllerWithDelta:", width, height);
}

- (void)_updateSearchResultsControllerWithDelta:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  -[UISearchController _updateSearchResultsContentScrollViewWithDelta:](self, "_updateSearchResultsContentScrollViewWithDelta:");
  -[UISearchController _updateSearchResultsPositionWithDelta:](self, "_updateSearchResultsPositionWithDelta:", width, height);
}

- (BOOL)isBeingDismissed
{
  objc_super v4;

  if (dyld_program_sdk_at_least() && (*((_BYTE *)&self->_controllerFlags + 2) & 8) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)UISearchController;
  return -[UIViewController isBeingDismissed](&v4, sel_isBeingDismissed);
}

- (void)_presentingViewControllerWillChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  id *v18;
  id *v19;
  uint64_t v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  UISearchController *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UISearchController;
  -[UIViewController _presentingViewControllerWillChange:](&v25, sel__presentingViewControllerWillChange_, v4);
  if (!-[UIViewController isBeingPresented](self, "isBeingPresented"))
    goto LABEL_23;
  -[UISearchController _sizeSearchViewToPresentingViewController:](self, "_sizeSearchViewToPresentingViewController:", v4);
  -[UISearchController _beginWatchingPresentingController](self, "_beginWatchingPresentingController");
  -[UISearchController _locatePresentingViewControllerIfInManagedPaletteOrHostedByNavigationBar](self, "_locatePresentingViewControllerIfInManagedPaletteOrHostedByNavigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "definesPresentationContext") & 1) == 0)
  {
    v7 = _presentingViewControllerWillChange____s_category;
    if (!_presentingViewControllerWillChange____s_category)
    {
      v7 = __UILogCategoryGetNode("Search", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_presentingViewControllerWillChange____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      v28 = 2112;
      v29 = self;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "The topViewController (%@) of the navigation controller containing the presented search controller (%@) must have definesPresentationContext set to YES.", buf, 0x16u);
    }
  }
  -[UISearchController searchResultsController](self, "searchResultsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  -[UISearchController searchResultsController](self, "searchResultsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_existingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[UISearchController searchResultsController](self, "searchResultsController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutSubviews");

LABEL_11:
  }
  -[UISearchController searchBar](self, "searchBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setScopeBarPosition:", 0);

  objc_msgSend(v4, "_splitViewControllerEnforcingClass:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((objc_msgSend(v15, "isCollapsed") & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(v16, "masterViewController");
      v18 = (id *)objc_claimAutoreleasedReturnValue();
      -[UIViewController _parentViewController]((id *)v4);
      v19 = (id *)objc_claimAutoreleasedReturnValue();
      while (1)
      {
        v17 = v19 != v18;
        if (v19 == v18)
          break;
        -[UIViewController _parentViewController](v19);
        v20 = objc_claimAutoreleasedReturnValue();

        v19 = (id *)v20;
        if (!v20)
        {
          v21 = 0;
          goto LABEL_21;
        }
      }
      v21 = v18;
LABEL_21:

    }
  }
  else
  {
    v17 = 1;
  }
  -[UISearchController searchBar](self, "searchBar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_setAllowsInlineScopeBar:", v17);

LABEL_23:
  if (-[UISearchController isBeingDismissed](self, "isBeingDismissed"))
  {
    -[UISearchController _endWatchingPresentingController](self, "_endWatchingPresentingController");
    -[UISearchController searchResultsUpdater](self, "searchResultsUpdater");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateSearchResultsForSearchController:", self);

    if (-[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationPopover)
    {
      -[UISearchController searchBar](self, "searchBar");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[UISearchController _resignSearchBarAsFirstResponder:](UISearchController, "_resignSearchBarAsFirstResponder:", v24);

    }
  }

}

- (void)_presentingViewControllerDidChange:(id)a3
{
  UIViewControllerAnimatedTransitioning *animator;
  id v5;
  objc_super v6;

  animator = self->_animator;
  self->_animator = 0;
  v5 = a3;

  if (!v5)
    self->_barPresentationStyle = 0;
  v6.receiver = self;
  v6.super_class = (Class)UISearchController;
  -[UIViewController _presentingViewControllerDidChange:](&v6, sel__presentingViewControllerDidChange_, v5);

}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id v6;
  UISearchController *v7;
  double v8;
  double Height;
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
  void *v20;
  void *v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  UIEdgeInsets result;

  v6 = a3;
  if (-[UISearchController isActive](self, "isActive")
    && (objc_msgSend(v6, "presentedViewController"),
        v7 = (UISearchController *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == self))
  {
    v15 = 0.0;
    Height = 0.0;
    if ((*(_BYTE *)&self->_controllerFlags & 1) != 0)
    {
      -[UIView frame](self->_searchBar, "frame");
      Height = CGRectGetHeight(v23);
      objc_msgSend(v6, "_contentOrObservableScrollViewForEdge:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v20, "tableHeaderView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "frame");
        Height = Height - CGRectGetHeight(v24);

      }
    }
    if (a4)
      *a4 = 0;
    v13 = 0.0;
    v11 = 0.0;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)UISearchController;
    -[UIViewController _edgeInsetsForChildViewController:insetsAreAbsolute:](&v22, sel__edgeInsetsForChildViewController_insetsAreAbsolute_, v6, a4);
    Height = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }

  v16 = Height;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (BOOL)_searchbarWasTableHeaderView
{
  return *(_DWORD *)&self->_controllerFlags & 1;
}

+ (void)_resignSearchBarAsFirstResponder:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "resignFirstResponder");
  objc_msgSend(v3, "keyboardSceneDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_clearPreservedInputViewsWithRestorableResponder:", v4);
}

- (void)_updateTableHeaderBackgroundViewInTableView:(id)a3 amountScrolledUnder:(double)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "_tableHeaderBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(v10, "_usingCustomBackgroundView"))
    {
      objc_msgSend(v10, "setTableHeaderBackgroundColor:", 0);
    }
    else
    {
      v6 = objc_msgSend(v5, "isHidden");
      if (a4 >= 0.0)
      {
        if ((v6 & 1) == 0)
          objc_msgSend(v5, "setHidden:", 1);
      }
      else
      {
        if (v6)
          objc_msgSend(v5, "setHidden:", 0);
        objc_msgSend(v10, "bounds");
        objc_msgSend(v5, "setFrame:");
        objc_msgSend(v10, "_refreshControl");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "backgroundColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v7, "backgroundColor");
        else
          objc_msgSend(v10, "tableHeaderBackgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setBackgroundColor:", v9);

      }
    }
  }

}

- (void)_updateSearchBarMaskIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double Height;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double Width;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[UISearchController searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UISearchController searchBar](self, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_containingScrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = v6;
      objc_msgSend(v35, "_refreshControl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_16;
    }
    else
    {
      v7 = 0;
      v35 = 0;
      if (!v6)
      {
LABEL_16:

        return;
      }
    }
    -[UISearchController searchBar](self, "searchBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    Height = CGRectGetHeight(v36);

    objc_msgSend(v6, "_effectiveContentInset");
    v11 = v10;
    objc_msgSend(v6, "contentOffset");
    v13 = v11 + v12;
    -[UISearchController searchBar](self, "searchBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v13 - v15;

    if (v7 && (objc_msgSend(v7, "refreshControlState") == 2 || objc_msgSend(v7, "refreshControlState") == 3))
    {
      objc_msgSend(v7, "_refreshControlHeight");
      v16 = v16 - v17;
    }
    -[UISearchController searchBar](self, "searchBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_currentScreenScale");
    v20 = 1.0 / v19;

    v21 = v16 + v20;
    -[UISearchController searchBar](self, "searchBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;
    v26 = v25;
    Width = v27;
    v30 = v29;

    if (v21 <= Height)
    {
      if (v21 > 0.0)
      {
        v38.origin.x = v24;
        v38.origin.y = v26;
        v38.size.width = Width;
        v38.size.height = v30;
        Width = CGRectGetWidth(v38);
        v30 = Height - v21;
        v24 = 0.0;
        v26 = v21;
      }
    }
    else
    {
      v31 = *MEMORY[0x1E0C9D648];
      v32 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v33 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v37.origin.x = v24;
      v37.origin.y = v26;
      v37.size.width = Width;
      v37.size.height = v30;
      Width = CGRectGetWidth(v37);
      v24 = v31;
      v26 = v32;
      v30 = v33;
    }
    -[UISearchController searchBar](self, "searchBar");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_setMaskBounds:", v24, v26, Width, v30);

    -[UISearchController _updateTableHeaderBackgroundViewInTableView:amountScrolledUnder:](self, "_updateTableHeaderBackgroundViewInTableView:amountScrolledUnder:", v35, v21);
    goto LABEL_16;
  }
}

- (void)_watchScrollView:(id)a3 forScrolling:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _UISearchControllerDidScrollDelegate *didScrollDelegate;
  void *v8;
  _UISearchControllerDidScrollDelegate *v9;
  _UISearchControllerDidScrollDelegate *v10;
  _UISearchControllerDidScrollDelegate *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  didScrollDelegate = self->_didScrollDelegate;
  v12 = v6;
  if (!v4)
  {
    -[_UISearchControllerDidScrollDelegate scrollView](didScrollDelegate, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_removeScrollViewScrollObserver:", self->_didScrollDelegate);

    v9 = self->_didScrollDelegate;
    self->_didScrollDelegate = 0;

LABEL_8:
    v6 = v12;
    goto LABEL_9;
  }
  if (didScrollDelegate)
  {
    if (!v6)
      goto LABEL_9;
    goto LABEL_7;
  }
  v10 = objc_alloc_init(_UISearchControllerDidScrollDelegate);
  v11 = self->_didScrollDelegate;
  self->_didScrollDelegate = v10;

  -[_UISearchControllerDidScrollDelegate setController:](self->_didScrollDelegate, "setController:", self);
  v6 = v12;
  if (v12)
  {
LABEL_7:
    -[_UISearchControllerDidScrollDelegate setScrollView:](self->_didScrollDelegate, "setScrollView:", v12);
    objc_msgSend(v12, "_addScrollViewScrollObserver:", self->_didScrollDelegate);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_beginWatchingPresentingController
{
  void *v3;
  void *v4;
  id v5;

  -[UIViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__navigationControllerWillShowViewController_, 0x1E1712780, v5);

  }
}

- (void)_endWatchingPresentingController
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E1712780, 0);

}

- (void)_navigationControllerWillShowViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UISearchController *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  UISearchController *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", 0x1E17127E0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", 0x1E1712800);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "presentedViewController");
  v10 = (UISearchController *)objc_claimAutoreleasedReturnValue();

  if (v10 == self)
  {
    if (-[UISearchController _hidesNavigationBarDuringPresentationRespectingInlineSearch](self, "_hidesNavigationBarDuringPresentationRespectingInlineSearch")&& objc_msgSend(v5, "isNavigationBarHidden"))
    {
      if (-[UISearchController isActive](self, "isActive") && v9)
      {
        -[UISearchController _managedPalette](self, "_managedPalette");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setIgnoreGeometryChanges:", 1);

      }
      objc_msgSend(v5, "setNavigationBarHidden:animated:", 0, 1);
      objc_msgSend(v5, "_setSearchHidNavigationBar:", 0);
      -[UISearchController _managedPalette](self, "_managedPalette");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setIgnoreGeometryChanges:", 0);

    }
    -[UIViewController traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    if (v14 == 3)
    {
      *(_DWORD *)&self->_controllerFlags |= 2u;
    }
    else
    {
      -[UISearchController searchBar](self, "searchBar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isFirstResponder"))
        v16 = 2;
      else
        v16 = 0;
      self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFFFFD | v16);

    }
    -[UISearchController searchBar](self, "searchBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISearchController _resignSearchBarAsFirstResponder:](UISearchController, "_resignSearchBarAsFirstResponder:", v17);

  }
  objc_msgSend(v9, "presentedViewController");
  v18 = (UISearchController *)objc_claimAutoreleasedReturnValue();

  if (v18 == self)
  {
    -[UISearchController searchBar](self, "searchBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "_containedInNavigationPalette");

    if (v20)
    {
      objc_msgSend(v5, "existingPaletteForEdge:", 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setVisibleWhenPinningBarIsHidden:", 1);

    }
    objc_msgSend(v9, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_searchControllerIfAllowed");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      if (-[UISearchController _hidesNavigationBarDuringPresentationRespectingInlineSearch](self, "_hidesNavigationBarDuringPresentationRespectingInlineSearch"))
      {
        if ((objc_msgSend(v5, "isNavigationBarHidden") & 1) == 0)
        {
          if (!objc_msgSend(v5, "isInteractiveTransition")
            || (_UIMainBundleIdentifier(),
                v24 = (void *)objc_claimAutoreleasedReturnValue(),
                v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.mobileslideshow")),
                v24,
                (v25 & 1) == 0))
          {
            objc_msgSend(v5, "setNavigationBarHidden:animated:", 1, 1);
            objc_msgSend(v5, "_setSearchHidNavigationBar:", 1);
          }
        }
      }
    }
    controllerFlags = self->_controllerFlags;
    if ((*(_BYTE *)&controllerFlags & 2) != 0)
    {
      self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&controllerFlags & 0xFFFFFFFD);
      -[UIViewController transitionCoordinator](self, "transitionCoordinator");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __66__UISearchController__navigationControllerWillShowViewController___block_invoke;
        v30[3] = &unk_1E16B2150;
        v30[4] = self;
        objc_msgSend(v27, "animateAlongsideTransition:completion:", 0, v30);
      }
      else
      {
        -[UISearchController searchBar](self, "searchBar");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "becomeFirstResponder");

      }
    }
  }

}

void __66__UISearchController__navigationControllerWillShowViewController___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "searchBar");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (BOOL)_isSearchController
{
  return 1;
}

- (void)_didCreateSystemInputViewController
{
  id v3;

  -[UISearchController _animatorForBarPresentationStyle:dismissing:](self, "_animatorForBarPresentationStyle:dismissing:", self->_barPresentationStyle, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UISearchController _updateKeyboardFocusGuidesForAnimator:](self, "_updateKeyboardFocusGuidesForAnimator:", v3);

}

- (void)_setDeferredSearchSuggestionGroups:(id)a3
{
  objc_setAssociatedObject(self, &_UISearchControllerDeferredSuggestionGroups, a3, (void *)1);
}

- (id)_deferredSearchSuggestionGroups
{
  return objc_getAssociatedObject(self, &_UISearchControllerDeferredSuggestionGroups);
}

- (void)setSearchSuggestions:(NSArray *)searchSuggestions
{
  NSArray *v4;
  _UISearchSuggestionItemGroup *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = searchSuggestions;
  if (v4)
  {
    v5 = -[_UISearchSuggestionItemGroup initWithHeaderTitle:suggestionItems:]([_UISearchSuggestionItemGroup alloc], "initWithHeaderTitle:suggestionItems:", 0, v4);
    v7[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchController _setSearchSuggestionGroups:](self, "_setSearchSuggestionGroups:", v6);

  }
  else
  {
    -[UISearchController _setSearchSuggestionGroups:](self, "_setSearchSuggestionGroups:", 0);
  }

}

- (void)_setSearchSuggestionGroups:(id)a3
{
  id v4;
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  controllerFlags = self->_controllerFlags;
  v6 = *(_DWORD *)&controllerFlags & 0xFFFFDFFF;
  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&controllerFlags & 0xFFFFDFFF);
  v9 = v4;
  if (v4)
  {
    if ((*(_WORD *)&controllerFlags & 0x800) != 0 || !-[UISearchController isActive](self, "isActive"))
    {
      -[UISearchController _setDeferredSearchSuggestionGroups:](self, "_setDeferredSearchSuggestionGroups:", v9);
      goto LABEL_7;
    }
    v6 = self->_controllerFlags;
  }
  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(v6 & 0xFFFFEFFF);
  -[UISearchController _suggestionController](self, "_suggestionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateSuggestionGroups:userInitiated:", v9, 1);

  -[UISearchController searchBar](self, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchController _updateVisibilityOfSearchResultsForSearchBar:](self, "_updateVisibilityOfSearchResultsForSearchBar:", v8);

LABEL_7:
}

- (NSArray)_searchSuggestionGroups
{
  void *v2;
  void *v3;

  -[UISearchController _suggestionController](self, "_suggestionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestionGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)searchSuggestions
{
  void *v2;
  void *v3;

  -[UISearchController _suggestionController](self, "_suggestionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_shouldDisplayDefaultSuggestion
{
  void *v2;
  char v3;

  -[UISearchController _tvSuggestionController](self, "_tvSuggestionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldDisplayDefaultSuggestion");

  return v3;
}

- (void)_setClearSuggestionsOnSelection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFBFFFFF | v3);
}

- (BOOL)_clearSuggestionsOnSelection
{
  return (*((unsigned __int8 *)&self->_controllerFlags + 2) >> 6) & 1;
}

- (void)_setUpdateSearchTextOnDidSelectSuggestion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFEFFFFFF | v3);
}

- (BOOL)_updateSearchTextOnDidSelectSuggestion
{
  return *((_BYTE *)&self->_controllerFlags + 3) & 1;
}

- (void)_setShouldDisplayDefaultSuggestion:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISearchController _tvSuggestionController](self, "_tvSuggestionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldDisplayDefaultSuggestion:", v3);

}

- (BOOL)_showSearchSuggestionPreview
{
  void *v2;
  char v3;

  -[UISearchController _tvSuggestionController](self, "_tvSuggestionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showSearchSuggestionPreview");

  return v3;
}

- (void)_setShowSearchSuggestionPreview:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UISearchController _tvSuggestionController](self, "_tvSuggestionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowSearchSuggestionPreview:", v3);

}

- (NSString)_suggestionRowTitle
{
  void *v2;
  void *v3;

  -[UISearchController _tvSuggestionController](self, "_tvSuggestionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchSuggestionsTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_setSuggestionRowTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISearchController _tvSuggestionController](self, "_tvSuggestionController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchSuggestionsTitle:", v4);

}

- (BOOL)ignoresSearchSuggestionsForSearchBarPlacementStacked
{
  return (*((unsigned __int8 *)&self->_controllerFlags + 1) >> 6) & 1;
}

- (void)_setUsesSearchSuggestionsMenuForStackedSearch:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFF7FFF | v3);
}

- (BOOL)_usesSearchSuggestionsMenuForStackedSearch
{
  return *((unsigned __int8 *)&self->_controllerFlags + 1) >> 7;
}

- (NSArray)_dci_suggestionsMenuDismissalPassthroughViews
{
  return 0;
}

- (BOOL)_tvShouldScrollWithObservedScrollViewIfPossible
{
  int64_t v3;

  v3 = -[UISystemInputViewController resolvedKeyboardStyle](self->_systemInputViewController, "resolvedKeyboardStyle");
  if (v3 != 1)
    LOBYTE(v3) = -[UISearchController _shouldHideGridKeyboardUnfocused](self, "_shouldHideGridKeyboardUnfocused");
  return v3;
}

- (void)_adjustTVSearchContainerViewForContentScrollView:(id)a3
{
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  double v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  objc_msgSend(v32, "window");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[UISearchController _tvShouldScrollWithObservedScrollViewIfPossible](self, "_tvShouldScrollWithObservedScrollViewIfPossible");

    if (v6)
    {
      objc_msgSend(v32, "_focusSystemSceneComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "coordinateSpace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchController _tvKeyboardContainerView](self, "_tvKeyboardContainerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchController _tvKeyboardContainerView](self, "_tvKeyboardContainerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      objc_msgSend(v9, "convertRect:toCoordinateSpace:", v8);
      v12 = v11;

      -[UISearchController _tvKeyboardContainerView](self, "_tvKeyboardContainerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;
      v17 = v16;
      v19 = v18;

      v20 = v12 + v19;
      objc_msgSend(v32, "contentOffset");
      v22 = v21;
      objc_msgSend(v32, "adjustedContentInset");
      v24 = fmax(fmin(v22 + v23, v20), 0.0);
      -[UISearchController _systemInputViewControllerAfterUpdate:](self, "_systemInputViewControllerAfterUpdate:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "resolvedKeyboardStyle");

      if (v26 == 1)
      {
        v27 = vabdd_f64(v24, v20);
        -[UISearchController _tvKeyboardContainerView](self, "_tvKeyboardContainerView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isUserInteractionEnabled");

        if (v27 > 2.22044605e-16 != v29)
        {
          -[UISearchController _tvKeyboardContainerView](self, "_tvKeyboardContainerView", 2.22044605e-16);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setUserInteractionEnabled:", v27 > 2.22044605e-16);

        }
      }
      -[UISearchController _tvKeyboardContainerView](self, "_tvKeyboardContainerView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setBounds:", v15, v24, v17, v19);

    }
  }

}

- (void)_setGridKeyboardVisible:(BOOL)a3
{
  self->__gridKeyboardVisible = a3;
}

- (void)_searchBarTextFieldDidSelectSearchSuggestion:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UISearchController searchResultsUpdater](self, "searchResultsUpdater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "updateSearchResultsForSearchController:selectingSearchSuggestion:", self, v6);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_dci_updateSearchResultsForSearchController:selectingSearchSuggestion:", self, v6);
  }
  -[UISearchController _dci_setSearchSuggestions:](self, "_dci_setSearchSuggestions:", 0);
  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFCFFF | 0x1000);
  -[UISearchController searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchController _updateVisibilityOfSearchResultsForSearchBar:](self, "_updateVisibilityOfSearchResultsForSearchBar:", v5);

}

- (void)_startDeferringSettingSearchSuggestions
{
  int v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->__navigationItemCurrentlyDisplayingSearchController);
  if (objc_msgSend(WeakRetained, "_hasInlineSearchBar"))
    v3 = 2048;
  else
    v3 = 0;
  self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&self->_controllerFlags & 0xFFFFF7FF | v3);

}

- (void)_stopDeferringAndShowDeferredSearchSuggestions
{
  void *v3;
  void *v4;
  id v5;

  *(_DWORD *)&self->_controllerFlags &= ~0x800u;
  -[UISearchController _deferredSearchSuggestionGroups](self, "_deferredSearchSuggestionGroups");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    *(_DWORD *)&self->_controllerFlags &= 0xFFFFCFFF;
    -[UISearchController _suggestionController](self, "_suggestionController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateSuggestionGroups:userInitiated:", v5, 1);

    -[UISearchController _setDeferredSearchSuggestionGroups:](self, "_setDeferredSearchSuggestionGroups:", 0);
    -[UISearchController searchBar](self, "searchBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchController _updateVisibilityOfSearchResultsForSearchBar:](self, "_updateVisibilityOfSearchResultsForSearchBar:", v4);

  }
}

- (void)_suggestionsMenuInteractionWillEndWithAnimator:(id)a3
{
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_dci_searchController:willDismissSearchSuggestionsMenuWasSuggestionSelected:", self, (*(_DWORD *)&self->_controllerFlags >> 12) & 1);
  controllerFlags = self->_controllerFlags;
  if ((*(_DWORD *)&controllerFlags & 0x11000) == 0)
    self->_controllerFlags = ($D69225ED9BA803AE184F8CEF6B0C1DE3)(*(_DWORD *)&controllerFlags | 0x2000);

}

- (id)searchTextField
{
  void *v2;
  void *v3;

  -[UISearchController searchBar](self, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)searchTextColor
{
  void *v2;
  void *v3;
  void *v4;

  -[UISearchController searchBar](self, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)searchPlaceholderColor
{
  void *v2;
  void *v3;
  void *v4;

  -[UISearchController searchBar](self, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_placeholderColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_startManagingPalette:(id)a3
{
  _UINavigationControllerManagedSearchPalette *managedPalette;
  void *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchController.m"), 3689, CFSTR("UIKit Bug – we should not be going down this code path"));

  }
  managedPalette = self->_managedPalette;
  self->_managedPalette = 0;

}

- (void)_stopManagingPalette
{
  _UINavigationControllerManagedSearchPalette *managedPalette;

  -[UIView removeFromSuperview](self->_searchBar, "removeFromSuperview");
  managedPalette = self->_managedPalette;
  self->_managedPalette = 0;

}

- (NSString)description
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  $D69225ED9BA803AE184F8CEF6B0C1DE3 controllerFlags;
  const __CFString *v8;
  uint64_t v9;
  UISearchBar *searchBar;
  _BOOL4 v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UISearchController;
  -[UISearchController description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return (NSString *)v3;
  if (self->_obscuresBackgroundDuringPresentation)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" obscuresBackgroundDuringPresentation"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  if (self->__showResultsForEmptySearch)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" showResultsForEmptySearch"));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  controllerFlags = self->_controllerFlags;
  if ((*(_BYTE *)&controllerFlags & 0x80) == 0)
  {
    if ((*(_WORD *)&controllerFlags & 0x100) != 0)
      v8 = CFSTR("shown");
    else
      v8 = CFSTR("hidden");
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [manually shows searchResultsController—%@]"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    controllerFlags = self->_controllerFlags;
    v3 = (void *)v9;
  }
  if ((*(_BYTE *)&controllerFlags & 0x60) == 0x20)
  {
    searchBar = self->_searchBar;
    if (searchBar)
    {
      v11 = -[UISearchBar showsScopeBar](searchBar, "showsScopeBar");
      v12 = CFSTR("hidden");
      if (v11)
        v12 = CFSTR("shown");
    }
    else
    {
      v12 = CFSTR("missing searchBar");
    }
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [UISearchBar API shows scopeBar—%@]"), v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v13;
  }
  if (self->_obscuresBackgroundDuringPresentation)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" obscuresBackgroundDuringPresentation"));
    v14 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v14;
  }
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" searchBar=%p"), self->_searchBar);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (int)_barPresentationStyle
{
  return self->_barPresentationStyle;
}

- (UIView)_resultsControllerViewContainer
{
  return self->_resultsControllerViewContainer;
}

- (void)set_resultsControllerViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_resultsControllerViewContainer, a3);
}

- (void)_setSuggestionController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionController, a3);
}

- (_UISearchSuggestionsListViewController)_suggestionsListViewController
{
  return self->_suggestionsListViewController;
}

- (_UINavigationControllerManagedSearchPalette)_managedPalette
{
  return self->_managedPalette;
}

- (id)searchResultsUpdater
{
  return objc_loadWeakRetained((id *)&self->_searchResultsUpdater);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)obscuresBackgroundDuringPresentation
{
  return self->_obscuresBackgroundDuringPresentation;
}

- (UIViewController)searchResultsController
{
  return self->_searchResultsController;
}

- (UIScrollView)searchControllerObservedScrollView
{
  return self->_searchControllerObservedScrollView;
}

- (void)setSearchControllerObservedScrollView:(UIScrollView *)searchControllerObservedScrollView
{
  objc_storeStrong((id *)&self->_searchControllerObservedScrollView, searchControllerObservedScrollView);
}

- (int64_t)_previousSearchBarPosition
{
  return self->__previousSearchBarPosition;
}

- (void)set_previousSearchBarPosition:(int64_t)a3
{
  self->__previousSearchBarPosition = a3;
}

- (double)_resultsContentScrollViewPresentationOffset
{
  return self->__resultsContentScrollViewPresentationOffset;
}

- (void)set_resultsContentScrollViewPresentationOffset:(double)a3
{
  self->__resultsContentScrollViewPresentationOffset = a3;
}

- (BOOL)_tabBarHidden
{
  return self->__tabBarHidden;
}

- (void)set_tabBarHidden:(BOOL)a3
{
  self->__tabBarHidden = a3;
}

- (UIView)_systemInputMarginView
{
  return self->__systemInputMarginView;
}

- (_UISearchControllerTVKeyboardContainerView)_tvKeyboardContainerView
{
  return self->__tvKeyboardContainerView;
}

- (UICollectionView)_suggestionView
{
  return self->__suggestionView;
}

- (UIView)_leftDividerView
{
  return self->__leftDividerView;
}

- (UIView)_rightDividerView
{
  return self->__rightDividerView;
}

- (UIFocusContainerGuide)_scopeBarFocusContainerGuide
{
  return self->__scopeBarFocusContainerGuide;
}

- (NSArray)_scopeBarConstraints
{
  return self->__scopeBarConstraints;
}

- (void)set_scopeBarConstraints:(id)a3
{
  objc_storeStrong((id *)&self->__scopeBarConstraints, a3);
}

- (double)_topResultsViewEdgeInset
{
  return self->__topResultsViewEdgeInset;
}

- (void)set_topResultsViewEdgeInset:(double)a3
{
  self->__topResultsViewEdgeInset = a3;
}

- (UIFocusGuide)keyboardToSearchResultsFocusGuide
{
  return self->_keyboardToSearchResultsFocusGuide;
}

- (void)setKeyboardToSearchResultsFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardToSearchResultsFocusGuide, a3);
}

- (UIFocusGuide)searchResultsToHiddenKeyboardFocusGuide
{
  return self->_searchResultsToHiddenKeyboardFocusGuide;
}

- (void)setSearchResultsToHiddenKeyboardFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultsToHiddenKeyboardFocusGuide, a3);
}

- (BOOL)_shouldLogAppearance
{
  return self->__shouldLogAppearance;
}

- (void)set_shouldLogAppearance:(BOOL)a3
{
  self->__shouldLogAppearance = a3;
}

- (UIView)_suggestionContainerView
{
  return self->__suggestionContainerView;
}

- (void)set_suggestionContainerView:(id)a3
{
  objc_storeStrong((id *)&self->__suggestionContainerView, a3);
}

- (BOOL)_isGridKeyboardVisible
{
  return self->__gridKeyboardVisible;
}

- (BOOL)_shouldHideGridKeyboardUnfocused
{
  return self->__shouldHideGridKeyboardUnfocused;
}

- (void)_setShouldHideGridKeyboardUnfocused:(BOOL)a3
{
  self->__shouldHideGridKeyboardUnfocused = a3;
}

- (NSArray)searchHints
{
  return self->_searchHints;
}

- (void)setSearchHints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1288);
}

- (UISearchResultsUpdatingPrivate)searchResultsUpdaterPrivate
{
  return (UISearchResultsUpdatingPrivate *)objc_loadWeakRetained((id *)&self->_searchResultsUpdaterPrivate);
}

- (void)setSearchResultsUpdaterPrivate:(id)a3
{
  objc_storeWeak((id *)&self->_searchResultsUpdaterPrivate, a3);
}

- (BOOL)_showResultsForEmptySearch
{
  return self->__showResultsForEmptySearch;
}

- (unint64_t)_requestedInteractionModel
{
  return self->__requestedInteractionModel;
}

- (BOOL)_shouldRespectPreferredContentSize
{
  return self->__shouldRespectPreferredContentSize;
}

- (void)_setShouldRespectPreferredContentSize:(BOOL)a3
{
  self->__shouldRespectPreferredContentSize = a3;
}

- (BOOL)_alwaysHidesNavigationBar
{
  return self->__alwaysHidesNavigationBar;
}

- (void)_setAlwaysHidesNavigationBar:(BOOL)a3
{
  self->__alwaysHidesNavigationBar = a3;
}

@end
