@implementation _TVSearchTemplateController

- (_TVSearchTemplateController)init
{
  _TVSearchTemplateController *v2;
  _TVStackCollectionViewController *v3;
  _TVStackCollectionViewController *resultsViewController;
  uint64_t v5;
  UISearchController *searchController;
  void *v7;
  void *v8;
  uint64_t v9;
  UIActivityIndicatorView *spinner;
  double v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_TVSearchTemplateController;
  v2 = -[_TVSearchTemplateController init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TVStackCollectionViewController);
    resultsViewController = v2->_resultsViewController;
    v2->_resultsViewController = v3;

    -[_TVStackCollectionViewController setDelegate:](v2->_resultsViewController, "setDelegate:", v2);
    -[_TVStackCollectionViewController setDefinesPresentationContext:](v2->_resultsViewController, "setDefinesPresentationContext:", 1);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6D68]), "initWithSearchResultsController:", 0);
    searchController = v2->_searchController;
    v2->_searchController = (UISearchController *)v5;

    -[UISearchController setObscuresBackgroundDuringPresentation:](v2->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
    -[UISearchController setSearchResultsUpdater:](v2->_searchController, "setSearchResultsUpdater:", v2);
    -[UISearchController searchBar](v2->_searchController, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setKeyboardType:", 0);
    objc_msgSend(v7, "setSearchBarStyle:", 2);
    objc_msgSend(v7, "setEnablesReturnKeyAutomatically:", 0);
    objc_msgSend(v7, "setCenterPlaceholder:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__keyboardDidChangeFrame_, *MEMORY[0x24BDF79F0], 0);

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    spinner = v2->_spinner;
    v2->_spinner = (UIActivityIndicatorView *)v9;

    objc_msgSend(MEMORY[0x24BDF67D0], "defaultSizeForStyle:", 100);
    -[UIActivityIndicatorView setFrame:](v2->_spinner, "setFrame:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v11, v12);
    -[UIActivityIndicatorView startAnimating](v2->_spinner, "startAnimating");

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateKeyboardText, 0);
  v4.receiver = self;
  v4.super_class = (Class)_TVSearchTemplateController;
  -[_TVBgImageLoadingViewController dealloc](&v4, sel_dealloc);
}

- (void)updateWithViewElement:(id)a3
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  IKTextFieldElement **p_searchFieldElement;
  IKViewElement **p_collectionListElement;
  IKViewElement **p_nonResultsElement;
  IKAppKeyboard *ikKeyboard;
  IKAppKeyboard *v24;
  IKAppKeyboard *v25;
  IKAppKeyboard *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  UIActivityIndicatorView *v45;
  UIActivityIndicatorView *spinner;
  void *v47;
  UIView *v48;
  UIView *originalSearchFieldRightView;
  void *v50;
  void *v51;
  UIActivityIndicatorView **p_spinner;
  UIView *v53;
  UIView *v54;
  uint64_t v55;
  void *v56;
  UIActivityIndicatorView *v57;
  UIActivityIndicatorView *v58;
  void *v59;
  UIView *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v69.receiver = self;
  v69.super_class = (Class)_TVSearchTemplateController;
  -[_TVBgImageLoadingViewController updateWithViewElement:](&v69, sel_updateWithViewElement_, v5);
  objc_storeStrong((id *)&self->_viewElement, a3);
  objc_msgSend(v5, "appDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "impressionThreshold");
  self->_impressionThreshold = v7;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v64 = v5;
  objc_msgSend(v5, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v66 != v14)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "tv_elementType");
        if (v17 == 10)
        {
          v19 = v16;

          v12 = v19;
        }
        else if (v17 == 45)
        {
          v18 = v16;

          v13 = v18;
        }
        else if (v13 && !v12 && !v11)
        {
          v11 = v16;
          v12 = 0;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }

  p_searchFieldElement = &self->_searchFieldElement;
  objc_storeStrong((id *)&self->_searchFieldElement, v13);
  p_collectionListElement = &self->_collectionListElement;
  objc_storeStrong((id *)&self->_collectionListElement, v12);
  p_nonResultsElement = &self->_nonResultsElement;
  objc_storeStrong((id *)&self->_nonResultsElement, v11);
  ikKeyboard = self->_ikKeyboard;
  -[IKTextFieldElement keyboard](self->_searchFieldElement, "keyboard");
  v24 = (IKAppKeyboard *)objc_claimAutoreleasedReturnValue();

  if (ikKeyboard != v24)
  {
    -[IKAppKeyboard setDelegate:](self->_ikKeyboard, "setDelegate:", 0);
    -[IKTextFieldElement keyboard](*p_searchFieldElement, "keyboard");
    v25 = (IKAppKeyboard *)objc_claimAutoreleasedReturnValue();
    v26 = self->_ikKeyboard;
    self->_ikKeyboard = v25;

    -[IKAppKeyboard setDelegate:](self->_ikKeyboard, "setDelegate:", self);
  }
  if (*p_nonResultsElement)
  {
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_viewFromElement:existingView:", *p_nonResultsElement, self->_nonResultsView);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVSearchTemplateController _setNonResultsView:](self, "_setNonResultsView:", v28);

  }
  else
  {
    -[_TVSearchTemplateController _setNonResultsView:](self, "_setNonResultsView:", 0);
  }
  if (-[_TVSearchTemplateController _searchBarContainsFocus](self, "_searchBarContainsFocus")
    && -[IKViewElement updateType](*p_collectionListElement, "updateType") != 2)
  {
    -[_TVStackCollectionViewController resetLastFocusedIndexPath](self->_resultsViewController, "resetLastFocusedIndexPath");
  }
  -[_TVStackCollectionViewController updateWithViewElement:](self->_resultsViewController, "updateWithViewElement:", *p_collectionListElement);
  -[UISearchController searchBar](self->_searchController, "searchBar");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKTextFieldElement text](*p_searchFieldElement, "text");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "string");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPlaceholder:", v31);

  -[IKTextFieldElement style](*p_searchFieldElement, "style");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "tv_padding");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;

  objc_msgSend(v29, "setContentInset:", v34, v36, v38, v40);
  -[IKTextFieldElement attributes](*p_searchFieldElement, "attributes");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("showSpinner"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "BOOLValue");

  if (v43)
  {
    if (!self->_originalSearchFieldRightView)
    {
      objc_msgSend(v29, "searchField");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "rightView");
      v45 = (UIActivityIndicatorView *)objc_claimAutoreleasedReturnValue();
      spinner = self->_spinner;

      if (v45 != spinner)
      {
        objc_msgSend(v29, "searchField");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "rightView");
        v48 = (UIView *)objc_claimAutoreleasedReturnValue();
        originalSearchFieldRightView = self->_originalSearchFieldRightView;
        self->_originalSearchFieldRightView = v48;

        objc_msgSend(v29, "searchField");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        self->_originalSearchFieldRightViewMode = objc_msgSend(v50, "rightViewMode");

      }
    }
    objc_msgSend(v29, "searchField");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    p_spinner = &self->_spinner;
    objc_msgSend(v51, "setRightView:", self->_spinner);

    objc_msgSend(v29, "searchField");
    v53 = (UIView *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    v55 = 3;
    goto LABEL_31;
  }
  objc_msgSend(v29, "searchField");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "rightView");
  v57 = (UIActivityIndicatorView *)objc_claimAutoreleasedReturnValue();
  p_spinner = &self->_spinner;
  v58 = self->_spinner;

  if (v57 == v58)
  {
    v60 = self->_originalSearchFieldRightView;
    objc_msgSend(v29, "searchField");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (v60)
    {
      objc_msgSend(v61, "setRightView:", self->_originalSearchFieldRightView);

      objc_msgSend(v29, "searchField");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setRightViewMode:", self->_originalSearchFieldRightViewMode);

      v54 = self->_originalSearchFieldRightView;
      self->_originalSearchFieldRightView = 0;
      goto LABEL_32;
    }
    objc_msgSend(v61, "setRightView:", 0);

    objc_msgSend(v29, "searchField");
    v53 = (UIView *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    v55 = 0;
LABEL_31:
    -[UIView setRightViewMode:](v53, "setRightViewMode:", v55);
LABEL_32:

    -[UIActivityIndicatorView setHidden:](*p_spinner, "setHidden:", v43 ^ 1u);
  }
  if (-[_TVSearchTemplateController isViewLoaded](self, "isViewLoaded"))
  {
    -[_TVSearchTemplateController view](self, "view");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setNeedsLayout");

  }
  -[_TVSearchTemplateController _updateImpressions](self, "_updateImpressions");

}

- (void)loadView
{
  void *v3;
  _TVStackCollectionViewController *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVSearchTemplateController;
  -[_TVSearchTemplateController loadView](&v6, sel_loadView);
  -[_TVSearchTemplateController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_resultsViewController;
  -[_TVSearchTemplateController addChildViewController:](self, "addChildViewController:", v4);
  -[_TVStackCollectionViewController view](v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", v5);
  -[_TVStackCollectionViewController didMoveToParentViewController:](v4, "didMoveToParentViewController:", self);
  if (self->_nonResultsView)
    objc_msgSend(v3, "addSubview:");
  -[_TVSearchTemplateController _updateSearchFieldText](self, "_updateSearchFieldText");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVSearchTemplateController;
  -[_TVBgImageLoadingViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[_TVSearchTemplateController _updateImpressions](self, "_updateImpressions");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_TVSearchTemplateController;
  -[_TVBgImageLoadingViewController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  -[_TVSearchTemplateController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_TVStackCollectionViewController view](self->_resultsViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
  objc_msgSend(v12, "setHidden:", self->_nonResultsView != 0);
  objc_msgSend(v3, "safeAreaInsets");
  -[UIView setFrame:](self->_nonResultsView, "setFrame:", v5, v7 + v13, v9, v11 - (v13 + fmax(v11 - self->_keyboardFrame.origin.y, v14)));

}

- (void)updateNavigationItem:(id)a3
{
  UISearchController *searchController;
  id v4;

  searchController = self->_searchController;
  v4 = a3;
  objc_msgSend(v4, "setSearchController:", searchController);
  objc_msgSend(v4, "setHidesSearchBarWhenScrolling:", 0);

}

- (id)collectionView
{
  return (id)-[_TVStackCollectionViewController collectionView](self->_resultsViewController, "collectionView");
}

- (void)_scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[_TVStackCollectionViewController collectionView](self->_resultsViewController, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjustedContentInset");
  objc_msgSend(v8, "setContentOffset:animated:", v3, 0.0, -v5);
  objc_msgSend(v8, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v6, "invalidationContextForBoundsChange:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayoutWithContext:", v7);

  -[_TVStackCollectionViewController resetLastFocusedIndexPath](self->_resultsViewController, "resetLastFocusedIndexPath");
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateKeyboardText, 0);
  if (-[_TVSearchTemplateController _isAtWordEnd](self, "_isAtWordEnd"))
    -[_TVSearchTemplateController _updateKeyboardText](self, "_updateKeyboardText");
  else
    -[_TVSearchTemplateController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateKeyboardText, 0, 0.5);
}

- (void)_updateImpressions
{
  -[_TVSearchTemplateController _cancelImpressionsUpdate](self, "_cancelImpressionsUpdate");
  if (self->_impressionThreshold > 0.0)
    -[_TVSearchTemplateController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__recordImpressionsForVisibleView, 0);
}

- (void)_cancelImpressionsUpdate
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__recordImpressionsForVisibleView, 0);
}

- (void)_recordImpressionsForVisibleView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[_TVSearchTemplateController isViewLoaded](self, "isViewLoaded"))
  {
    -[_TVSearchTemplateController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[IKViewElement appDocument](self->_viewElement, "appDocument");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[_TVSearchTemplateController impressionableElementsContainedInDocument:](self, "impressionableElementsContainedInDocument:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
        objc_msgSend(v6, "recordImpressionsForViewElements:", v5);

    }
  }
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IKViewElement appDocument](self->_viewElement, "appDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    -[_TVStackCollectionViewController collectionView](self->_resultsViewController, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visibleCells");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_TVSearchTemplateController isViewLoaded](self, "isViewLoaded"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "viewController", (_QWORD)v19);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "tv_impressionableElementsForDocument:", v4);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObjectsFromArray:", v16);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v12);
      }

    }
    if (objc_msgSend(v9, "count", (_QWORD)v19))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_updateSearchFieldText
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateKeyboardText, 0);
  -[UISearchController searchBar](self->_searchController, "searchBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IKAppKeyboard text](self->_ikKeyboard, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

}

- (void)_updateKeyboardText
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateKeyboardText, 0);
  -[UISearchController searchBar](self->_searchController, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_textInputSource");

  v5 = CFSTR("dictation");
  if (v4 != 2)
    v5 = 0;
  if (v4 == 1)
    v6 = CFSTR("keyboard");
  else
    v6 = v5;
  -[IKAppKeyboard _setSource:](self->_ikKeyboard, "_setSource:", v6);
  -[_TVSearchTemplateController _sanitizedText](self, "_sanitizedText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[IKAppKeyboard setText:](self->_ikKeyboard, "setText:", v7);

}

- (BOOL)_isAtWordEnd
{
  void *v3;
  uint64_t v4;
  char v5;

  if (_isAtWordEnd_onceToken != -1)
    dispatch_once(&_isAtWordEnd_onceToken, &__block_literal_global_31);
  -[_TVSearchTemplateController _sanitizedText](self, "_sanitizedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  if (v4)
    v5 = objc_msgSend((id)_isAtWordEnd_wordDelimiters, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v4 - 1));
  else
    v5 = 1;

  return v5;
}

- (id)_sanitizedText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __int16 v7;

  v7 = -4;
  -[UISearchController searchBar](self->_searchController, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", v4, &stru_24EB8B108);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_searchBarContainsFocus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  if (-[_TVSearchTemplateController isViewLoaded](self, "isViewLoaded"))
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "focusedView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[_TVSearchTemplateController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isDescendantOfView:", v5))
    {
      -[_TVStackCollectionViewController view](self->_resultsViewController, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "isDescendantOfView:", v6) ^ 1;

    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)_setNonResultsView:(id)a3
{
  UIView **p_nonResultsView;
  void *v6;
  id v7;

  v7 = a3;
  p_nonResultsView = &self->_nonResultsView;
  -[UIView removeFromSuperview](self->_nonResultsView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_nonResultsView, a3);
  if (-[_TVSearchTemplateController isViewLoaded](self, "isViewLoaded") && *p_nonResultsView)
  {
    -[_TVSearchTemplateController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", *p_nonResultsView);

  }
}

- (void)_keyboardDidChangeFrame:(id)a3
{
  CGRect *p_keyboardFrame;
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  id v11;

  p_keyboardFrame = &self->_keyboardFrame;
  objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDF7A20]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  p_keyboardFrame->origin.x = v7;
  p_keyboardFrame->origin.y = v8;
  p_keyboardFrame->size.width = v9;
  p_keyboardFrame->size.height = v10;

  if (-[_TVSearchTemplateController isViewLoaded](self, "isViewLoaded"))
  {
    if (self->_nonResultsView)
    {
      -[_TVSearchTemplateController view](self, "view");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNeedsLayout");

    }
  }
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalSearchFieldRightView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_nonResultsView, 0);
  objc_storeStrong((id *)&self->_resultsViewController, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_nonResultsElement, 0);
  objc_storeStrong((id *)&self->_collectionListElement, 0);
  objc_storeStrong((id *)&self->_ikKeyboard, 0);
  objc_storeStrong((id *)&self->_searchFieldElement, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end
