@implementation PKPassSharesListViewController

- (PKPassSharesListViewController)initWithSharesController:(id)a3
{
  id v5;
  PKPassSharesListViewController *v6;
  PKPassSharesListViewController *v7;
  PKShareAuthorizationSession *v8;
  PKShareAuthorizationSession *authorizer;
  PKPassSharesListSectionController *v10;
  PKPassSharesListSectionController *sharesSectionController;
  void *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassSharesListViewController;
  v6 = -[PKDynamicCollectionViewController init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sharesController, a3);
    v8 = (PKShareAuthorizationSession *)objc_alloc_init(MEMORY[0x1E0D67668]);
    authorizer = v7->_authorizer;
    v7->_authorizer = v8;

    v10 = -[PKPassSharesListSectionController initWithMode:sharesController:rootShare:delegate:]([PKPassSharesListSectionController alloc], "initWithMode:sharesController:rootShare:delegate:", 2, v7->_sharesController, 0, v7);
    sharesSectionController = v7->_sharesSectionController;
    v7->_sharesSectionController = v10;

    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v7, "setUseItemIdentityWhenUpdating:", 1);
    v15[0] = v7->_sharesSectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicCollectionViewController setSections:animated:](v7, "setSections:animated:", v12, 0);

  }
  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassSharesListViewController;
  -[PKDynamicCollectionViewController viewWillAppear:](&v9, sel_viewWillAppear_);
  -[PKSharedPassSharesController updateSharesWithCompletion:](self->_sharesController, "updateSharesWithCompletion:", 0);
  v8.receiver = self;
  v8.super_class = (Class)PKPassSharesListViewController;
  -[PKDynamicCollectionViewController reloadDataAnimated:](&v8, sel_reloadDataAnimated_, v3);
  -[PKPassSharesListViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrefersLargeTitles:", 1);

  -[PKPassSharesListViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLargeTitleDisplayMode:", 1);

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPassSharesListViewController;
  -[PKDynamicCollectionViewController loadView](&v9, sel_loadView);
  -[PKPassSharesListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setBackgroundColor:", v4);
  -[PKPassSharesListViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedShareableCredentialString(CFSTR("SHARES_LIST_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__donePressed);
  objc_msgSend(v6, "setRightBarButtonItem:", v8);

}

- (void)_donePressed
{
  -[PKPassSharesListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_setIsLoading:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v9, "startAnimating");
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v9);
    -[PKPassSharesListViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:", v4);

    -[PKDynamicCollectionViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  }
  else
  {
    -[PKPassSharesListViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__donePressed);
    objc_msgSend(v7, "setRightBarButtonItem:", v8);

    -[PKDynamicCollectionViewController collectionView](self, "collectionView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserInteractionEnabled:", 1);
  }

}

- (void)_showDisplayableError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0DC3450];
  v5 = a3;
  PKTitleForDisplayableError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1A1AE46BC](v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v10);

  -[PKPassSharesListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

- (void)reloadDataAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[PKPassSharesListViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPassSharesListViewController;
    -[PKDynamicCollectionViewController reloadDataAnimated:](&v6, sel_reloadDataAnimated_, v3);
  }
}

- (void)passSharesListSectionController:(id)a3 didSelectShare:(id)a4
{
  id v5;
  PKShareAuthorizationSession *authorizer;
  id v7;
  _QWORD v8[4];
  id v9;
  PKPassSharesListViewController *v10;

  v5 = a4;
  authorizer = self->_authorizer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__PKPassSharesListViewController_passSharesListSectionController_didSelectShare___block_invoke;
  v8[3] = &unk_1E3E619E0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  -[PKShareAuthorizationSession authorizeDeviceOwnerWithAuthHandler:completion:](authorizer, "authorizeDeviceOwnerWithAuthHandler:completion:", 0, v8);

}

void __81__PKPassSharesListViewController_passSharesListSectionController_didSelectShare___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  PKPassShareDetailsViewController *v4;

  if (a2)
  {
    v4 = -[PKPassShareDetailsViewController initWithShare:sharesController:authorizer:]([PKPassShareDetailsViewController alloc], "initWithShare:sharesController:authorizer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1048), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1056));
    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pushViewController:animated:", v4, 1);

  }
}

- (void)passSharesListSectionControllerDidSelectAddShare:(id)a3
{
  PKSharedPassSharesController *sharesController;
  _QWORD v4[5];

  sharesController = self->_sharesController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__PKPassSharesListViewController_passSharesListSectionControllerDidSelectAddShare___block_invoke;
  v4[3] = &unk_1E3E646D0;
  v4[4] = self;
  -[PKSharedPassSharesController canSendInvitationWithCompletion:](sharesController, "canSendInvitationWithCompletion:", v4);
}

void __83__PKPassSharesListViewController_passSharesListSectionControllerDidSelectAddShare___block_invoke(uint64_t a1, void *a2)
{
  PKShareSecureElementPassViewController *v3;
  void *v4;
  uint64_t v5;
  PKShareSecureElementPassViewController *v6;
  void *v7;
  void *v8;
  PKShareSecureElementPassViewController *v9;

  if (a2)
  {
    v3 = (PKShareSecureElementPassViewController *)PKAlertForDisplayableErrorWithHandlers(a2, 0, 0, 0);
    v4 = *(void **)(a1 + 32);
    v9 = v3;
    v5 = 1;
  }
  else
  {
    v6 = [PKShareSecureElementPassViewController alloc];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "pass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKShareSecureElementPassViewController initWithSecureElementPass:environment:isFromPeopleScreen:delegate:](v6, "initWithSecureElementPass:environment:isFromPeopleScreen:delegate:", v7, 0, 1, *(_QWORD *)(a1 + 32));

    -[PKShareSecureElementPassViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 5);
    v8 = *(void **)(a1 + 32);
    v5 = -[PKShareSecureElementPassViewController shouldViewControllerBeAnimatedIn](v9, "shouldViewControllerBeAnimatedIn");
    v4 = v8;
    v3 = v9;
  }
  objc_msgSend(v4, "presentViewController:animated:completion:", v3, v5, 0);

}

- (void)passSharesListSectionController:(id)a3 setIsLoading:(BOOL)a4
{
  -[PKPassSharesListViewController _setIsLoading:](self, "_setIsLoading:", a4);
}

- (void)passSharesListSectionControllerDidFinishRevokingShares:(id)a3
{
  -[PKPassSharesListViewController reloadDataAnimated:](self, "reloadDataAnimated:", 1);
}

- (void)passSharesListSectionController:(id)a3 presentAlert:(id)a4
{
  -[PKPassSharesListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)shareSecureElementPassViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassSharesListViewController;
  -[PKDynamicCollectionViewController reloadDataAnimated:](&v5, sel_reloadDataAnimated_, 1, a4);
  -[PKPassSharesListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharesSectionController, 0);
  objc_storeStrong((id *)&self->_authorizer, 0);
  objc_storeStrong((id *)&self->_sharesController, 0);
}

@end
