@implementation PKSearchResultsNavigationController

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  id WeakRetained;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKSearchResultsNavigationController;
  -[PKNavigationController navigationController:willShowViewController:animated:](&v18, sel_navigationController_willShowViewController_animated_, v8, v9, v5);
  -[PKSearchResultsNavigationController viewControllers](self, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "count") <= 2)
  {
    v11 = objc_msgSend(v10, "indexOfObject:", v9) == 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);
    objc_msgSend(WeakRetained, "setSearchBarVisible:", v11);

  }
  objc_msgSend(v8, "topViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transitionCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__PKSearchResultsNavigationController_navigationController_willShowViewController_animated___block_invoke;
  v15[3] = &unk_1E3E6E980;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v14, "notifyWhenInteractionChangesUsingBlock:", v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __92__PKSearchResultsNavigationController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;

  if (objc_msgSend(a2, "isCancelled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "searchController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSearchBarVisible:", 0);

  }
}

- (PKSearchResultsSearchController)searchController
{
  return (PKSearchResultsSearchController *)objc_loadWeakRetained((id *)&self->_searchController);
}

- (void)setSearchController:(id)a3
{
  objc_storeWeak((id *)&self->_searchController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchController);
}

@end
