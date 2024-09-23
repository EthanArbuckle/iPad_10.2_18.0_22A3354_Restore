@implementation PKPeerPaymentRecurringPaymentPassDetailsSectionController

- (PKPeerPaymentRecurringPaymentPassDetailsSectionController)initWithDelegate:(id)a3 pass:(id)a4 context:(int64_t)a5 passLibraryDataProvider:(id)a6
{
  id v8;
  PKPeerPaymentRecurringPaymentPassDetailsSectionController *v9;
  PKPeerPaymentRecurringPaymentPassDetailsSectionController *v10;
  void *v11;
  uint64_t v12;
  PKPeerPaymentAccount *account;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentRecurringPaymentPassDetailsSectionController;
  v9 = -[PKPaymentPassDetailSectionController init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_context = a5;
    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "account");
    v12 = objc_claimAutoreleasedReturnValue();
    account = v10->_account;
    v10->_account = (PKPeerPaymentAccount *)v12;

    objc_msgSend(v11, "registerObserver:", v10);
  }

  return v10;
}

- (id)allSectionIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PeerPaymentRecurringPaymentsSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sectionIdentifiers
{
  void *v3;

  if (-[PKPaymentPassDetailSectionController currentSegment](self, "currentSegment")
    || !-[PKPeerPaymentRecurringPaymentPassDetailsSectionController _sectionAvailable](self, "_sectionAvailable"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PKPeerPaymentRecurringPaymentPassDetailsSectionController allSectionIdentifiers](self, "allSectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hasAssociatedPeerPaymentAccount") && !objc_msgSend(v3, "passActivationState"))
    v6 = objc_msgSend(v5, "supportsRecurringPayments");
  else
    v6 = 0;

  return v6;
}

- (void)preflight:(id)a3
{
  void *v4;
  void *v5;
  PKPeerPaymentAccount *v6;
  PKPeerPaymentAccount *account;
  id v8;

  v4 = (void *)MEMORY[0x1E0D67470];
  v8 = a3;
  objc_msgSend(v4, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (PKPeerPaymentAccount *)objc_claimAutoreleasedReturnValue();
  account = self->_account;
  self->_account = v6;

  -[PKPeerPaymentRecurringPaymentPassDetailsSectionController _updateRecurringPaymentsWithCompletion:](self, "_updateRecurringPaymentsWithCompletion:", v8);
}

- (BOOL)_sectionAvailable
{
  PKPeerPaymentAccount *account;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;

  if (-[PKPeerPaymentAccount supportsRecurringPayments](self->_account, "supportsRecurringPayments"))
  {
    account = self->_account;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "familyCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKPeerPaymentAccount isEligibleForRecurringPaymentsForUser:](account, "isEligibleForRecurringPaymentsForUser:", v6))v7 = PKIsVision() ^ 1;
    else
      LOBYTE(v7) = 0;

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)_updateRecurringPaymentsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__PKPeerPaymentRecurringPaymentPassDetailsSectionController__updateRecurringPaymentsWithCompletion___block_invoke;
  v7[3] = &unk_1E3E63110;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "recurringPaymentsWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __100__PKPeerPaymentRecurringPaymentPassDetailsSectionController__updateRecurringPaymentsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a2, "pk_objectsPassingTest:", &__block_literal_global_74);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PKPeerPaymentRecurringPaymentPassDetailsSectionController__updateRecurringPaymentsWithCompletion___block_invoke_3;
  block[3] = &unk_1E3E61B90;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

uint64_t __100__PKPeerPaymentRecurringPaymentPassDetailsSectionController__updateRecurringPaymentsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 1)
    v3 = objc_msgSend(v2, "sentByMe");
  else
    v3 = 0;

  return v3;
}

void __100__PKPeerPaymentRecurringPaymentPassDetailsSectionController__updateRecurringPaymentsWithCompletion___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_storeStrong(WeakRetained + 8, *(id *)(a1 + 32));
    v4 = objc_loadWeakRetained(v7 + 11);
    objc_msgSend(v7, "sectionIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadSections:", v5);

    v3 = v7;
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      (*(void (**)(void))(v6 + 16))();
      v3 = v7;
    }
  }

}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return -[PKPeerPaymentRecurringPaymentPassDetailsSectionController _sectionAvailable](self, "_sectionAvailable", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PeerPaymentRecurringPayments"), a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 2, CFSTR("PeerPaymentRecurringPayments"));
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentRecurringString(CFSTR("DASHBOARD_MORE_MENU_RECURRING_PAYMENTS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  v9 = -[NSArray count](self->_recurringPayments, "count");
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringFromNumber:numberStyle:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setSecondaryText:", v12);
  }
  objc_msgSend(v6, "setAccessoryType:", 1);
  objc_msgSend(v6, "setContentConfiguration:", v7);

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPeerPaymentRecurringPaymentEducationViewController *v11;
  int64_t context;
  PKPaymentPassDetailWrapperSectionControllerDelegate **p_delegate;
  id WeakRetained;
  void *v15;
  id v16;
  void *v17;
  PKPeerPaymentRecurringPaymentEducationViewController *v18;
  PKNavigationController *v19;
  PKNavigationController *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_context != 3
    || (PKPeerPaymentRecurringPaymentHasShownEducationMessage() & 1) != 0
    || -[NSArray count](self->_recurringPayments, "count"))
  {
    -[PKPeerPaymentRecurringPaymentPassDetailsSectionController _presentRecurringPaymentsWithIdentifier:](self, "_presentRecurringPaymentsWithIdentifier:", 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v11 = [PKPeerPaymentRecurringPaymentEducationViewController alloc];
    context = self->_context;
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "transactionSourceCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v16, "familyCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PKPeerPaymentRecurringPaymentEducationViewController initWithContext:transactionSourceCollection:familyCollection:](v11, "initWithContext:transactionSourceCollection:familyCollection:", context, v15, v17);

    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __113__PKPeerPaymentRecurringPaymentPassDetailsSectionController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke;
    v26 = &unk_1E3E61310;
    objc_copyWeak(&v27, &location);
    -[PKPeerPaymentRecurringPaymentEducationViewController setAddCardHandler:](v18, "setAddCardHandler:", &v23);
    v19 = [PKNavigationController alloc];
    v20 = -[PKNavigationController initWithRootViewController:](v19, "initWithRootViewController:", v18, v23, v24, v25, v26);
    if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v20, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      -[PKNavigationController setModalPresentationStyle:](v20, "setModalPresentationStyle:", 2);
    }
    v21 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v21, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "presentViewController:animated:completion:", v20, 1, 0);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v9, 1);

}

void __113__PKPeerPaymentRecurringPaymentPassDetailsSectionController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 11);
    objc_msgSend(v2, "presentAddCard");

    WeakRetained = v3;
  }

}

- (void)_presentRecurringPaymentsWithIdentifier:(id)a3
{
  id v4;
  PKPeerPaymentRecurringPaymentViewController *v5;
  int64_t context;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  PKPeerPaymentRecurringPaymentViewController *v12;
  PKPeerPaymentRecurringPaymentViewController *v13;
  id v14;
  _QWORD v15[4];
  PKPeerPaymentRecurringPaymentViewController *v16;
  id v17;
  id v18;
  id location;

  v4 = a3;
  v5 = [PKPeerPaymentRecurringPaymentViewController alloc];
  context = self->_context;
  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "transactionSourceCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v10, "familyCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKPeerPaymentRecurringPaymentViewController initWithContext:peerPaymentService:transactionSourceCollection:familyCollection:](v5, "initWithContext:peerPaymentService:transactionSourceCollection:familyCollection:", context, v7, v9, v11);

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __101__PKPeerPaymentRecurringPaymentPassDetailsSectionController__presentRecurringPaymentsWithIdentifier___block_invoke;
  v15[3] = &unk_1E3E63B10;
  objc_copyWeak(&v18, &location);
  v13 = v12;
  v16 = v13;
  v14 = v4;
  v17 = v14;
  -[PKPeerPaymentRecurringPaymentViewController preflightWithCompletion:](v13, "preflightWithCompletion:", v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __101__PKPeerPaymentRecurringPaymentPassDetailsSectionController__presentRecurringPaymentsWithIdentifier___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  id v5;
  void *v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2)
    {
      v7 = WeakRetained;
      v5 = objc_loadWeakRetained(WeakRetained + 11);
      objc_msgSend(v5, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

      WeakRetained = v7;
      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "showDetailsForRecurringPaymentIdentifier:");
        WeakRetained = v7;
      }
    }
  }

}

- (void)recurringPaymentsChanged
{
  -[PKPeerPaymentRecurringPaymentPassDetailsSectionController _updateRecurringPaymentsWithCompletion:](self, "_updateRecurringPaymentsWithCompletion:", 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_recurringPayments, 0);
}

@end
