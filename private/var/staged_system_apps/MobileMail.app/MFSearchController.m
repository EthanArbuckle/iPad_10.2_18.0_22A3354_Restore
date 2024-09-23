@implementation MFSearchController

- (MFSearchBar)searchBar
{
  MFSearchBar *searchBar;
  MFSearchBar *v4;
  MFSearchBar *v5;

  searchBar = self->_searchBar;
  if (!searchBar)
  {
    v4 = -[MFSearchBar initWithFrame:]([MFSearchBar alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_searchBar;
    self->_searchBar = v4;

    searchBar = self->_searchBar;
  }
  return searchBar;
}

- (MFSearchController)initWithSearchResultsController:(id)a3
{
  id v4;
  MFSearchController *v5;
  MFSearchController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFSearchController;
  v5 = -[MFSearchController initWithSearchResultsController:](&v8, "initWithSearchResultsController:", v4);
  v6 = v5;
  if (v5 && (objc_opt_respondsToSelector(v5, "_dci_setAutomaticScopeBarShowsOnPresentation:") & 1) != 0)
    -[MFSearchController _dci_setAutomaticScopeBarShowsOnPresentation:](v6, "_dci_setAutomaticScopeBarShowsOnPresentation:", 0);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[MFSearchController setDelegate:](self, "setDelegate:", 0);
  -[MFSearchController setSearchResultsUpdater:](self, "setSearchResultsUpdater:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MFSearchController;
  -[MFSearchController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFSearchController;
  -[MFSearchController viewDidLoad](&v3, "viewDidLoad");
  -[MFSearchController _setShowResultsForEmptySearch:](self, "_setShowResultsForEmptySearch:", 1);
  if ((objc_opt_respondsToSelector(self, "_dci_setAutomaticScopeBarShowsOnPresentation:") & 1) != 0)
    -[MFSearchController _dci_setAutomaticScopeBarShowsOnPresentation:](self, "_dci_setAutomaticScopeBarShowsOnPresentation:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFSearchController;
  -[MFSearchController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_handleMailNavigationControllerShowViewController:", MailNavigationControllerWillShowViewControllerNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_handleMailNavigationControllerShowViewController:", MailNavigationControllerDidShowViewControllerNotification, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFSearchController;
  -[MFSearchController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, MailNavigationControllerWillShowViewControllerNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, MailNavigationControllerDidShowViewControllerNotification, 0);

}

- (void)_handleMailNavigationControllerShowViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MailNavigationControllerNewViewControllerKey));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", MailNavigationControllerPreviousViewControllerKey));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", MailNavigationControllerAnimatedKey));

  v10 = objc_msgSend(v9, "BOOLValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
  v12 = objc_msgSend(v11, "isEqual:", MailNavigationControllerWillShowViewControllerNotification);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchController presentingViewController](self, "presentingViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parentViewController"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchController presentingViewController](self, "presentingViewController"));
  if (v5 == v15 || v5 == v14)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchController searchResultsController](self, "searchResultsController"));
    if (v12)
    {
      objc_msgSend(v17, "beginAppearanceTransition:animated:", 1, v10);
      goto LABEL_10;
    }
LABEL_9:
    objc_msgSend(v17, "endAppearanceTransition");
    goto LABEL_10;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchController presentingViewController](self, "presentingViewController"));

  if (v7 == v16 || v7 == v14)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchController searchResultsController](self, "searchResultsController"));
    if (v12)
    {
      objc_msgSend(v17, "beginAppearanceTransition:animated:", 0, v10);
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_9;
  }
LABEL_11:

}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end
