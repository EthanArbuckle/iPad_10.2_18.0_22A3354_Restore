@implementation PXSettingsSearchViewController

- (PXSettingsSearchViewController)initWithStyle:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsSearchViewController.m"), 44, CFSTR("%s is not available as initializer"), "-[PXSettingsSearchViewController initWithStyle:]");

  abort();
}

- (PXSettingsSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsSearchViewController.m"), 48, CFSTR("%s is not available as initializer"), "-[PXSettingsSearchViewController initWithNibName:bundle:]");

  abort();
}

- (PXSettingsSearchViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsSearchViewController.m"), 52, CFSTR("%s is not available as initializer"), "-[PXSettingsSearchViewController initWithCoder:]");

  abort();
}

- (PXSettingsSearchViewController)initWithSettingsController:(id)a3
{
  id v5;
  PXSettingsSearchViewController *v6;
  PXSettingsSearchViewController *v7;
  PXSettingsIndexer *v8;
  void *v9;
  uint64_t v10;
  PXSettingsIndexer *indexer;
  PXInfoUpdater *v12;
  PXInfoUpdater *resultsInfoUpdater;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXSettingsSearchViewController;
  v6 = -[PXSettingsSearchViewController initWithStyle:](&v15, sel_initWithStyle_, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settingsController, a3);
    v8 = [PXSettingsIndexer alloc];
    objc_msgSend(v5, "rootSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXSettingsIndexer initWithRootSettings:](v8, "initWithRootSettings:", v9);
    indexer = v7->_indexer;
    v7->_indexer = (PXSettingsIndexer *)v10;

    v12 = -[PXInfoUpdater initWithInfoProvider:infoKind:]([PXInfoUpdater alloc], "initWithInfoProvider:infoKind:", v7, CFSTR("PXSettingsSearchResultsInfoKind"));
    resultsInfoUpdater = v7->_resultsInfoUpdater;
    v7->_resultsInfoUpdater = v12;

    -[PXInfoUpdater setObserver:](v7->_resultsInfoUpdater, "setObserver:", v7);
  }

  return v7;
}

- (void)viewDidLoad
{
  UISearchBar *v3;
  UISearchBar *searchBar;
  void *v5;
  void *v6;
  void *v7;
  PXSettingsIndexer *indexer;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXSettingsSearchViewController;
  -[PXSettingsSearchViewController viewDidLoad](&v16, sel_viewDidLoad);
  v3 = (UISearchBar *)objc_alloc_init(MEMORY[0x1E0DC3C38]);
  searchBar = self->_searchBar;
  self->_searchBar = v3;

  -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
  -[UISearchBar setShowsCancelButton:](self->_searchBar, "setShowsCancelButton:", 0);
  -[PXSettingsSearchViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsSearchViewController searchBar](self, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleView:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__handleCancelItem_);
  objc_msgSend(v5, "setRightBarButtonItem:", v7);

  objc_initWeak(&location, self);
  indexer = self->_indexer;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __45__PXSettingsSearchViewController_viewDidLoad__block_invoke;
  v13 = &unk_1E5148D30;
  objc_copyWeak(&v14, &location);
  -[PXSettingsIndexer startIndexingWithCompletionHandler:](indexer, "startIndexingWithCompletionHandler:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsSearchViewController setIndexingProgress:](self, "setIndexingProgress:", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSettingsSearchViewController;
  -[PXSettingsSearchViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PXSettingsSearchViewController searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)_indexerDidComplete
{
  void *v3;
  void *v4;
  id v5;

  -[PXSettingsSearchViewController setIndexingProgress:](self, "setIndexingProgress:", 0);
  -[PXSettingsSearchViewController indexer](self, "indexer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "index");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsSearchViewController setIndex:](self, "setIndex:", v4);

  -[PXSettingsSearchViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)setIndex:(id)a3
{
  PXSettingsIndex *v5;
  void *v6;
  PXSettingsIndex *v7;

  v5 = (PXSettingsIndex *)a3;
  if (self->_index != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_index, a3);
    -[PXSettingsSearchViewController resultsInfoUpdater](self, "resultsInfoUpdater");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateInfo");

    v5 = v7;
  }

}

- (void)setSearchResults:(id)a3
{
  NSArray *v4;
  void *v5;
  char v6;
  NSArray *v7;
  NSArray *searchResults;
  NSArray *v9;

  v9 = (NSArray *)a3;
  v4 = self->_searchResults;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSArray isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSArray *)-[NSArray copy](v9, "copy");
    searchResults = self->_searchResults;
    self->_searchResults = v7;

    -[PXSettingsSearchViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");
LABEL_4:

  }
}

- (void)_handleCancelItem:(id)a3
{
  id v4;

  -[PXSettingsSearchViewController searchBar](self, "searchBar", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSettingsSearchViewController searchBarCancelButtonClicked:](self, "searchBarCancelButtonClicked:", v4);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v4;

  -[PXSettingsSearchViewController resultsInfoUpdater](self, "resultsInfoUpdater", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateInfo");

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  -[PXSettingsSearchViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v7 = a3;
  -[PXSettingsSearchViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "snapshotViewAfterScreenUpdates:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);
  -[PXSettingsSearchViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 0);

  -[PXSettingsSearchViewController searchResults](self, "searchResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "row");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSettingsSearchViewController settingsController](self, "settingsController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__PXSettingsSearchViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v16[3] = &unk_1E5149198;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v13, "revealInSettingsController:withCompletionHandler:", v14, v16);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3;

  -[PXSettingsSearchViewController searchBar](self, "searchBar", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v7;
  int64_t v8;

  -[PXSettingsSearchViewController indexingProgress](self, "indexingProgress", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 1;
  -[PXSettingsSearchViewController searchResults](self, "searchResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  -[PXSettingsSearchViewController indexingProgress](self, "indexingProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = 0;
    v10 = CFSTR("Indexing…");
  }
  else
  {
    -[PXSettingsSearchViewController searchResults](self, "searchResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "title");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("cellReuseIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("cellReuseIdentifier"));
  v14 = v8 == 0;
  objc_msgSend(v13, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v10);

  objc_msgSend(v13, "detailTextLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v9);

  objc_msgSend(v13, "setUserInteractionEnabled:", v14);
  objc_msgSend(v13, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEnabled:", v14);

  return v13;
}

- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  -[PXSettingsSearchViewController searchBar](self, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSettingsSearchViewController index](self, "index");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v7, "length"))
  {
    -[PXSettingsSearchViewController searchBar](self, "searchBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__PXSettingsSearchViewController_requestInfoOfKind_withResultHandler___block_invoke;
    v13[3] = &unk_1E5127350;
    v14 = v5;
    objc_msgSend(v8, "searchForText:resultHandler:", v10, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, MEMORY[0x1E0C9AA60]);
    v11 = 0;
  }

  return v11;
}

- (int64_t)priorityForInfoRequestOfKind:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[PXSettingsSearchViewController searchBar](self, "searchBar", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v5 = 0;
  else
    v5 = 100;

  return v5;
}

- (void)infoUpdaterDidUpdate:(id)a3
{
  void *v4;
  id v5;

  -[PXSettingsSearchViewController resultsInfoUpdater](self, "resultsInfoUpdater", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsSearchViewController setSearchResults:](self, "setSearchResults:", v4);

}

- (PTUISettingsController)settingsController
{
  return self->_settingsController;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (PXSettingsIndexer)indexer
{
  return self->_indexer;
}

- (void)setIndexer:(id)a3
{
  objc_storeStrong((id *)&self->_indexer, a3);
}

- (NSProgress)indexingProgress
{
  return self->_indexingProgress;
}

- (void)setIndexingProgress:(id)a3
{
  objc_storeStrong((id *)&self->_indexingProgress, a3);
}

- (PXSettingsIndex)index
{
  return self->_index;
}

- (PXInfoUpdater)resultsInfoUpdater
{
  return self->_resultsInfoUpdater;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_resultsInfoUpdater, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_indexingProgress, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
}

uint64_t __70__PXSettingsSearchViewController_requestInfoOfKind_withResultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__PXSettingsSearchViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __45__PXSettingsSearchViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_indexerDidComplete");

}

@end
