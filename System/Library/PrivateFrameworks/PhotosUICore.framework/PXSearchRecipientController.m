@implementation PXSearchRecipientController

- (PXSearchRecipientController)initWithSearchDataSourceManager:(id)a3
{
  id v5;
  PXSearchRecipientController *v6;
  PXSearchRecipientController *v7;
  CNAutocompleteResultsTableViewController *v8;
  CNAutocompleteResultsTableViewController *searchResultsTableViewController;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXSearchRecipientController;
  v6 = -[PXSearchRecipientController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchDataSourceManager, a3);
    -[PXSectionedDataSourceManager registerChangeObserver:context:](v7->_searchDataSourceManager, "registerChangeObserver:context:", v7, PXSearchDataSourceManagerContext);
    v8 = (CNAutocompleteResultsTableViewController *)objc_alloc_init(MEMORY[0x1E0D13640]);
    searchResultsTableViewController = v7->__searchResultsTableViewController;
    v7->__searchResultsTableViewController = v8;

    -[CNAutocompleteResultsTableViewController setDelegate:](v7->__searchResultsTableViewController, "setDelegate:", v7);
  }

  return v7;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.didSelectRecipient = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.numberOfSearchRecipientsDidChange = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.searchStateDidChange = objc_opt_respondsToSelector() & 1;
  }

}

- (UIView)searchResultsView
{
  void *v2;
  void *v3;

  -[CNAutocompleteResultsTableViewController tableView](self->__searchResultsTableViewController, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyboardDismissMode:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return (UIView *)v2;
}

- (BOOL)_searchHasNoResultsFound
{
  void *v3;
  BOOL v4;

  if (-[PXRecipientSearchDataSourceManager searchState](self->_searchDataSourceManager, "searchState") != 2)
    return 0;
  -[PXSectionedDataSourceManager dataSource](self->_searchDataSourceManager, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0) == 0;

  return v4;
}

- (void)_setSearchDataSource:(id)a3
{
  PXRecipientSearchDataSource *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  PXRecipientSearchDataSource *v11;
  PXRecipientSearchDataSource *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD *, void *);
  void *v16;
  PXSearchRecipientController *v17;
  id v18;
  SEL v19;

  v6 = (PXRecipientSearchDataSource *)a3;
  if (self->__searchDataSource != v6)
  {
    v11 = v6;
    objc_storeStrong((id *)&self->__searchDataSource, a3);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PXRecipientSearchDataSource recipientSearchResultsInSection:](v11, "recipientSearchResultsInSection:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __52__PXSearchRecipientController__setSearchDataSource___block_invoke;
    v16 = &unk_1E51183B8;
    v19 = a2;
    v17 = self;
    v9 = v7;
    v18 = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v13);
    -[CNAutocompleteResultsTableViewController setRecipients:](self->__searchResultsTableViewController, "setRecipients:", v9);
    if (-[PXRecipientSearchDataSource numberOfSections](self->__searchDataSource, "numberOfSections") < 1)
      v10 = 0;
    else
      v10 = -[PXRecipientSearchDataSource numberOfItemsInSection:](self->__searchDataSource, "numberOfItemsInSection:", 0);
    -[PXSearchRecipientController setNumberOfSearchRecipients:](self, "setNumberOfSearchRecipients:", v10, v11, v13, v14, v15, v16, v17);

    v6 = v12;
  }

}

- (void)setSearchState:(int64_t)a3
{
  id v5;

  if (self->_searchState != a3)
  {
    self->_searchState = a3;
    if (self->_delegateRespondsTo.searchStateDidChange)
    {
      -[PXSearchRecipientController delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchRecipientController:searchStateDidChange:", self, a3);

    }
  }
}

- (void)setNumberOfSearchRecipients:(unint64_t)a3
{
  id v5;

  if (self->_numberOfSearchRecipients != a3)
  {
    self->_numberOfSearchRecipients = a3;
    if (self->_delegateRespondsTo.numberOfSearchRecipientsDidChange)
    {
      -[PXSearchRecipientController delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchRecipientController:numberOfSearchRecipientsDidChange:", self, a3);

    }
  }
}

- (void)disambiguateRecipient:(id)a3
{
  id v5;
  void *v6;
  CNAutocompleteResultsTableViewController *searchResultsTableViewController;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchRecipientController.m"), 132, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("recipient"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchRecipientController.m"), 132, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("recipient"), v11, v13);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v5, "recipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  searchResultsTableViewController = self->__searchResultsTableViewController;
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultsTableViewController updateRecipients:disambiguatingRecipient:](searchResultsTableViewController, "updateRecipients:disambiguatingRecipient:", v8, v6);

}

- (id)_validationTextColorForSearchResult:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "validationType");
  if (!v3 || v3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v6;
  PXCNRecipientSearchResult *v7;
  PXCNRecipientSearchResult *v8;
  void *v9;
  PXCNRecipientSearchResult *v10;

  v6 = a4;
  v7 = -[PXCNComposeRecipient initWithRecipient:]([PXCNRecipientSearchResult alloc], "initWithRecipient:", v6);

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;

    v8 = v10;
    if (v10)
    {
      if (self->_delegateRespondsTo.didSelectRecipient)
      {
        -[PXSearchRecipientController delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "searchRecipientController:didSelectRecipient:", self, v10);

      }
      -[PXRecipientSearchDataSourceManager setQueryString:](self->_searchDataSourceManager, "setQueryString:", &stru_1E5149688);
      v8 = v10;
    }
  }
  else
  {

    v8 = 0;
  }

}

- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *);
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  PXSearchRecipientController *v19;
  id v20;
  uint64_t *v21;
  SEL v22;
  _OWORD v23[2];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *))a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__12999;
  v28 = __Block_byref_object_dispose__13000;
  v29 = 0;
  -[PXSearchRecipientController _searchDataSource](self, "_searchDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "firstItemIndexPath");
  else
    memset(v23, 0, sizeof(v23));
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__PXSearchRecipientController_autocompleteResultsController_tintColorForRecipient_completion___block_invoke;
  v17[3] = &unk_1E51183E0;
  v14 = v13;
  v22 = a2;
  v18 = v14;
  v19 = self;
  v15 = v10;
  v20 = v15;
  v21 = &v24;
  objc_msgSend(v14, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v23, 0, v17);
  if (v25[5])
  {
    -[PXSearchRecipientController _validationTextColorForSearchResult:](self, "_validationTextColorForSearchResult:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v16);

  }
  _Block_object_dispose(&v24, 8);

}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  -[PXSearchRecipientController _contactViewControllerForRecipient:](self, "_contactViewControllerForRecipient:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isRemovableFromSearchResults"))
  {
    objc_msgSend(v5, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("PXComposeRecipientRemoveRecentSuggestionButtonTitle"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardFooterGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addActionWithTitle:target:selector:inGroup:destructive:", v7, self, sel__removeRecent, v8, 1);

  }
  -[PXSearchRecipientController setSuggestedRecipientBeingViewed:](self, "setSuggestedRecipientBeingViewed:", v13);
  -[PXSearchRecipientController set_contactViewController:](self, "set_contactViewController:", v5);
  -[PXSearchRecipientController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewControllerForPresentingContactViewControllerBySearchRecipientController:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v11, "pushViewController:animated:", v5, 1);
  else
    objc_msgSend(v10, "presentViewController:animated:completion:", v5, 1, 0);

}

- (id)_contactViewControllerForRecipient:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v3, "uncommentedAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", *MEMORY[0x1E0C97000], v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEmailAddresses:", v8);

    v4 = (void *)objc_msgSend(v5, "copy");
  }
  if (objc_msgSend(v4, "isUnknown"))
    objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForUnknownContact:", v4);
  else
    objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForContact:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C966A8];
  v15[0] = *MEMORY[0x1E0C967C0];
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDisplayedPropertyKeys:", v11);

  objc_msgSend(v9, "setAllowsActions:", 0);
  objc_msgSend(v9, "setAllowsEditing:", 0);
  v12 = objc_alloc_init(MEMORY[0x1E0C972A0]);
  objc_msgSend(v12, "setIncludeLocalContacts:", 1);
  objc_msgSend(v12, "setIncludeSuggestedContacts:", 1);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v12);
  objc_msgSend(v9, "setContactStore:", v13);

  return v9;
}

- (void)_removeRecent
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
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  PXRecipientSearchDataSourceManager *v18;

  -[PXSearchRecipientController _searchResultsTableViewController](self, "_searchResultsTableViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchRecipientController suggestedRecipientBeingViewed](self, "suggestedRecipientBeingViewed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateSearchResultRecipient:", v5);

  v18 = self->_searchDataSourceManager;
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXRecipientSearchDataSourceManager px_descriptionForAssertionMessage](v18, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchRecipientController.m"), 241, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("_searchDataSourceManager"), v15, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchRecipientController.m"), 241, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("_searchDataSourceManager"), v15);
  }

LABEL_3:
  -[PXSearchRecipientController suggestedRecipientBeingViewed](self, "suggestedRecipientBeingViewed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRecipientSearchDataSourceManager removeRecipientResult:](v18, "removeRecipientResult:", v6);

  -[PXSearchRecipientController setSuggestedRecipientBeingViewed:](self, "setSuggestedRecipientBeingViewed:", 0);
  -[PXSearchRecipientController _contactViewController](self, "_contactViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSearchRecipientController _contactViewController](self, "_contactViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "popViewControllerAnimated:", 1);
  }
  else
  {
    objc_msgSend(v9, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);
  }

  -[PXSearchRecipientController set_contactViewController:](self, "set_contactViewController:", 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSearchDataSourceManagerContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchRecipientController.m"), 267, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v12 = v9;
  if ((v6 & 1) != 0)
  {
    -[PXSectionedDataSourceManager dataSource](self->_searchDataSourceManager, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchRecipientController _setSearchDataSource:](self, "_setSearchDataSource:", v10);

    v9 = v12;
  }
  if ((v6 & 2) != 0)
  {
    -[PXSearchRecipientController setSearchState:](self, "setSearchState:", -[PXRecipientSearchDataSourceManager searchState](self->_searchDataSourceManager, "searchState") == 1);
    v9 = v12;
  }

}

- (PXSearchRecipientControllerDelegate)delegate
{
  return (PXSearchRecipientControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXRecipientSearchDataSourceManager)searchDataSourceManager
{
  return self->_searchDataSourceManager;
}

- (int64_t)searchState
{
  return self->_searchState;
}

- (unint64_t)numberOfSearchRecipients
{
  return self->_numberOfSearchRecipients;
}

- (PXRecipientSearchDataSource)_searchDataSource
{
  return self->__searchDataSource;
}

- (CNAutocompleteResultsTableViewController)_searchResultsTableViewController
{
  return self->__searchResultsTableViewController;
}

- (CNComposeRecipient)suggestedRecipientBeingViewed
{
  return self->_suggestedRecipientBeingViewed;
}

- (void)setSuggestedRecipientBeingViewed:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedRecipientBeingViewed, a3);
}

- (CNContactViewController)_contactViewController
{
  return (CNContactViewController *)objc_loadWeakRetained((id *)&self->__contactViewController);
}

- (void)set_contactViewController:(id)a3
{
  objc_storeWeak((id *)&self->__contactViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__contactViewController);
  objc_storeStrong((id *)&self->_suggestedRecipientBeingViewed, 0);
  objc_storeStrong((id *)&self->__searchResultsTableViewController, 0);
  objc_storeStrong((id *)&self->__searchDataSource, 0);
  objc_storeStrong((id *)&self->_searchDataSourceManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __94__PXSearchRecipientController_autocompleteResultsController_tintColorForRecipient_completion___block_invoke(uint64_t a1, _OWORD *a2, _BYTE *a3)
{
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  _OWORD v19[2];

  v5 = *(void **)(a1 + 32);
  v6 = a2[1];
  v19[0] = *a2;
  v19[1] = v6;
  objc_msgSend(v5, "recipientSearchResultAtSimpleIndexPath:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 64);
    v16 = *(_QWORD *)(a1 + 40);
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v15, v16, CFSTR("PXSearchRecipientController.m"), 171, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[searchDataSource recipientSearchResultAtSimpleIndexPath:indexPath]"), v14, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("PXSearchRecipientController.m"), 171, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[searchDataSource recipientSearchResultAtSimpleIndexPath:indexPath]"), v14);
  }

LABEL_3:
  objc_msgSend(v7, "recipient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = PXComposeRecipientEqualToComposeRecipient(v8, *(void **)(a1 + 48));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7);
    *a3 = 1;
  }

}

void __52__PXSearchRecipientController__setSearchDataSource___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  id v14;

  v14 = a2;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[6];
    v7 = a1[4];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("PXSearchRecipientController.m"), 100, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("searchResult"), v9);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[6];
    v11 = a1[4];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("PXSearchRecipientController.m"), 100, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("searchResult"), v9, v13);

    goto LABEL_6;
  }
LABEL_3:
  v3 = (void *)a1[5];
  objc_msgSend(v14, "recipient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

@end
