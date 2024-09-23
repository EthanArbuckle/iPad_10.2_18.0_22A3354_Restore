@implementation PKSearchResultsSearchController

- (PKSearchResultsSearchController)initWithPaymentDataProvider:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKSearchResultsViewController *v11;
  PKSearchResultsNavigationController *v12;
  PKSearchResultsSearchController *v13;
  PKSearchResultsSearchController *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PKSearchResultsViewController initWithPaymentDataProvider:transactionSourceCollection:familyCollection:]([PKSearchResultsViewController alloc], "initWithPaymentDataProvider:transactionSourceCollection:familyCollection:", v10, v9, v8);

  v12 = -[PKNavigationController initWithRootViewController:]([PKSearchResultsNavigationController alloc], "initWithRootViewController:", v11);
  v19.receiver = self;
  v19.super_class = (Class)PKSearchResultsSearchController;
  v13 = -[PKSearchResultsSearchController initWithSearchResultsController:](&v19, sel_initWithSearchResultsController_, v12);
  v14 = v13;
  if (v13)
  {
    v13->_showSearchBar = 1;
    objc_storeWeak((id *)&v13->_resultsVC, v11);
    objc_storeWeak((id *)&v14->_navVC, v12);
    -[PKSearchResultsNavigationController setSearchController:](v12, "setSearchController:", v14);
    -[PKSearchResultsSearchController searchBar](v14, "searchBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShowsCancelButton:", 1);
    +[PKDashboardViewController backgroundColor](PKDashboardViewController, "backgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v16);

    objc_msgSend(v15, "searchTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsCopyingTokens:", 0);

    -[PKSearchResultsSearchController setShowsSearchResultsController:](v14, "setShowsSearchResultsController:", 1);
    -[PKSearchResultsSearchController setSearchResultsUpdater:](v14, "setSearchResultsUpdater:", v11);
    -[PKSearchResultsSearchController setHidesNavigationBarDuringPresentation:](v14, "setHidesNavigationBarDuringPresentation:", 0);

  }
  return v14;
}

- (void)preflightWithCompletion:(id)a3
{
  PKSearchResultsViewController **p_resultsVC;
  id v4;
  id WeakRetained;

  p_resultsVC = &self->_resultsVC;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_resultsVC);
  objc_msgSend(WeakRetained, "preflightWithCompletion:", v4);

}

- (void)setQuery:(id)a3
{
  PKSearchResultsViewController **p_resultsVC;
  id v4;
  id WeakRetained;

  p_resultsVC = &self->_resultsVC;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_resultsVC);
  objc_msgSend(WeakRetained, "setQuery:", v4);

}

- (int64_t)preferredStatusBarStyle
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navVC);
  v3 = objc_msgSend(WeakRetained, "preferredStatusBarStyle");

  return v3;
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSearchResultsSearchController;
  -[PKSearchResultsSearchController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[PKSearchResultsSearchController _updateSearchBarFrame](self, "_updateSearchBarFrame");
}

- (void)_updateSearchBarFrame
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  int v15;
  double Width;
  double v17;
  double v18;
  id v19;
  CGRect v20;

  -[PKSearchResultsSearchController searchBar](self, "searchBar");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKSearchResultsSearchController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (self->_showSearchBar)
  {
    objc_msgSend(v11, "safeAreaInsets");
    v14 = v13;
  }
  else
  {
    v15 = objc_msgSend(v11, "_shouldReverseLayoutDirection");
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    Width = CGRectGetWidth(v20);
    objc_msgSend(v12, "safeAreaInsets");
    if (v15)
      v14 = Width + v18;
    else
      v14 = -Width - v17;
  }
  objc_msgSend(v19, "setFrame:", v14, v6, v8, v10);

}

- (void)setSearchBarVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v3 = a3;
  -[PKSearchResultsSearchController searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSearchResultsSearchController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_navVC);
  objc_msgSend(WeakRetained, "transitionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  if (v3)
  {
    self->_showSearchBar = 1;
    if (!v8)
    {
      -[PKSearchResultsSearchController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNeedsLayout");

      goto LABEL_9;
    }
    objc_msgSend(v5, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __55__PKSearchResultsSearchController_setSearchBarVisible___block_invoke;
    v19[3] = &unk_1E3E6E980;
    objc_copyWeak(&v20, &location);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __55__PKSearchResultsSearchController_setSearchBarVisible___block_invoke_2;
    v16[3] = &unk_1E3E68818;
    objc_copyWeak(&v18, &location);
    v17 = v5;
    objc_msgSend(v8, "animateAlongsideTransitionInView:animation:completion:", v9, v19, v16);

    objc_destroyWeak(&v18);
    v11 = &v20;
  }
  else
  {
    self->_searchBarWasFirstResponder = objc_msgSend(v5, "isFirstResponder");
    objc_msgSend(v5, "resignFirstResponder");
    self->_showSearchBar = 0;
    if (!v8)
    {
      objc_msgSend(v6, "setNeedsLayout");
      goto LABEL_9;
    }
    objc_msgSend(v5, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__PKSearchResultsSearchController_setSearchBarVisible___block_invoke_3;
    v14[3] = &unk_1E3E6E980;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v8, "animateAlongsideTransitionInView:animation:completion:", v12, v14, 0);

    v11 = &v15;
  }
  objc_destroyWeak(v11);
LABEL_9:
  objc_destroyWeak(&location);

}

void __55__PKSearchResultsSearchController_setSearchBarVisible___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSearchBarFrame");
    WeakRetained = v2;
  }

}

void __55__PKSearchResultsSearchController_setSearchBarVisible___block_invoke_2(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (objc_msgSend(v4, "isCancelled") & 1) == 0 && WeakRetained[1328])
    objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");

}

void __55__PKSearchResultsSearchController_setSearchBarVisible___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSearchBarFrame");
    WeakRetained = v2;
  }

}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resultsVC);
  objc_destroyWeak((id *)&self->_navVC);
}

@end
