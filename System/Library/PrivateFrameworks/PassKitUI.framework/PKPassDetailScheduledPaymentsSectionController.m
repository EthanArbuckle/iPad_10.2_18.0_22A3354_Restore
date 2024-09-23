@implementation PKPassDetailScheduledPaymentsSectionController

- (PKPassDetailScheduledPaymentsSectionController)initWithAccount:(id)a3 pass:(id)a4 accountService:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKPassDetailScheduledPaymentsSectionController *v15;
  PKPassDetailScheduledPaymentsSectionController *v16;
  uint64_t v17;
  NSArray *allSectionIdentifiers;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKPassDetailScheduledPaymentsSectionController;
  v15 = -[PKPaymentPassDetailSectionController init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    objc_storeStrong((id *)&v16->_pass, a4);
    objc_storeStrong((id *)&v16->_accountService, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    v21[0] = CFSTR("SchedulePaymentsSectionIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    allSectionIdentifiers = v16->_allSectionIdentifiers;
    v16->_allSectionIdentifiers = (NSArray *)v17;

    -[PKPassDetailScheduledPaymentsSectionController _updateSections](v16, "_updateSections");
    -[PKAccountService registerObserver:](v16->_accountService, "registerObserver:", v16);
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKPassDetailScheduledPaymentsSectionController;
  -[PKPassDetailScheduledPaymentsSectionController dealloc](&v3, sel_dealloc);
}

- (void)reloadScheduledPayments
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[PKPassDetailScheduledPaymentsSectionController allSectionIdentifiers](self, "allSectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reloadSectionIdentifiers:", v3);

}

- (BOOL)_updateSections
{
  NSArray *v3;
  NSArray *v4;
  NSArray *allSectionIdentifiers;
  NSArray *sectionIdentifiers;
  NSArray *v7;
  char v8;
  _QWORD v10[5];

  v3 = self->_sectionIdentifiers;
  if (-[PKPaymentPassDetailSectionController currentSegment](self, "currentSegment"))
  {
    v4 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    allSectionIdentifiers = self->_allSectionIdentifiers;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__PKPassDetailScheduledPaymentsSectionController__updateSections__block_invoke;
    v10[3] = &unk_1E3E7A9D8;
    v10[4] = self;
    -[NSArray pk_objectsPassingTest:](allSectionIdentifiers, "pk_objectsPassingTest:", v10);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  sectionIdentifiers = self->_sectionIdentifiers;
  self->_sectionIdentifiers = v4;
  v7 = v4;

  v8 = PKEqualObjects();
  return v8 ^ 1;
}

uint64_t __65__PKPassDetailScheduledPaymentsSectionController__updateSections__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldDisplaySection:", a2);
}

- (void)fetchScheduledPaymentsAndReloadSections:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;

  v4 = a3;
  if (-[PKPassDetailScheduledPaymentsSectionController _updateSections](self, "_updateSections"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "recomputeMappedSectionsAndReloadSections:", self->_sectionIdentifiers);

  }
  else
  {
    -[PKPassDetailScheduledPaymentsSectionController reloadScheduledPayments](self, "reloadScheduledPayments");
  }
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassDetailScheduledPaymentsSectionController _fetchScheduledPaymentsWithAccountIdentifier:completion:](self, "_fetchScheduledPaymentsWithAccountIdentifier:completion:", v6, v4);

}

- (void)updateWithAccount:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_account, a3);
    -[PKPassDetailScheduledPaymentsSectionController fetchScheduledPaymentsAndReloadSections:](self, "fetchScheduledPaymentsAndReloadSections:", 0);
  }

}

- (void)presentSchedulePayments:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void (**v10)(void *, uint64_t);
  void *v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  PKAccountAutomaticPaymentsController *v16;
  PKAccountAutomaticPaymentsController *v17;
  id v18;
  _QWORD v19[4];
  PKAccountAutomaticPaymentsController *v20;
  id v21;
  void (**v22)(void *, uint64_t);
  id v23;
  id v24[3];
  _QWORD aBlock[5];
  id v26;
  id location[2];

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_presentationSceneIdentifier, a3);
  objc_initWeak(location, self);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke;
  aBlock[3] = &unk_1E3E62FA0;
  objc_copyWeak(&v26, location);
  aBlock[4] = self;
  v10 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (!self->_loadingAutomaticPayments)
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKPaymentPassDetailSectionController detailViewStyle](self, "detailViewStyle");
    v13 = (void *)v12;
    v14 = 3;
    if (v12 != 1)
      v14 = 0;
    if (v12 == 2)
      v15 = 4;
    else
      v15 = v14;
    v16 = -[PKAccountAutomaticPaymentsController initWithAccountService:paymentWebService:account:context:]([PKAccountAutomaticPaymentsController alloc], "initWithAccountService:paymentWebService:account:context:", self->_accountService, v11, self->_account, v15);
    -[PKAccountAutomaticPaymentsController setDelegate:](v16, "setDelegate:", self);
    -[PKAccountAutomaticPaymentsController setAutomaticPayments:](v16, "setAutomaticPayments:", self->_recurringPayments);
    v10[2](v10, 1);
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke_2;
    v19[3] = &unk_1E3E7AA50;
    objc_copyWeak(v24, location);
    v17 = v16;
    v20 = v17;
    v22 = v10;
    v18 = v11;
    v21 = v18;
    v24[1] = v13;
    v24[2] = (id)v15;
    v23 = v8;
    -[PKAccountAutomaticPaymentsController preflightWithCompletion:](v17, "preflightWithCompletion:", v19);

    objc_destroyWeak(v24);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(location);

}

void __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id *v16;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 105) = a2;
    v16 = WeakRetained;
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "count");
    v5 = v16;
    if (!v6)
    {
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "count");
      v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 152));
      objc_msgSend(v8, "cellForRow:inSection:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "count"), CFSTR("SchedulePaymentsSectionIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v9, "detailTextLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (!v12)
        {
          objc_msgSend(v9, "textLabel");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "textColor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "showSpinner:inCell:overrideTextColor:", a2, v9, v15);
          if ((a2 & 1) != 0)
            goto LABEL_7;
          goto LABEL_6;
        }
        objc_msgSend(v16, "showSpinner:inCell:detailText:", a2, v9, 0);
        if ((a2 & 1) == 0)
        {
LABEL_6:
          v13 = objc_loadWeakRetained(v16 + 19);
          objc_msgSend(v13, "reloadRow:inSectionWithSectionIdentifier:", v7, CFSTR("SchedulePaymentsSectionIdentifier"));

        }
      }
LABEL_7:

      v5 = v16;
    }
  }

}

void __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  char v15;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke_3;
  block[3] = &unk_1E3E7AA28;
  objc_copyWeak(&v13, (id *)(a1 + 64));
  v15 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  v14 = *(_OWORD *)(a1 + 72);
  v12 = *(id *)(a1 + 56);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v13);
}

void __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  PKCreditAccountPaymentDetailsViewController *v4;
  PKCreditAccountPaymentDetailsViewController *v5;
  id v6;
  void *v7;
  PKNavigationController *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 96) && !*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "automaticPayments");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "count"))
      {
        v9 = *(void **)(a1 + 40);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke_4;
        v10[3] = &unk_1E3E7AA00;
        v11 = *(id *)(a1 + 56);
        v12 = *(id *)(a1 + 64);
        objc_msgSend(v9, "nextViewControllerFromViewController:withCompletion:", 0, v10);

        goto LABEL_6;
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      v5 = [PKCreditAccountPaymentDetailsViewController alloc];
      v6 = WeakRetained[8];
      objc_msgSend(v3, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[PKCreditAccountPaymentDetailsViewController initWithAccount:payment:paymentWebService:detailViewStyle:](v5, "initWithAccount:payment:paymentWebService:detailViewStyle:", v6, v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80));

      v8 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v4);
      PKPaymentSetupApplyContextAppearance(*(_QWORD *)(a1 + 88), v8);
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(_QWORD *)(a1 + 32), objc_msgSend(WeakRetained[8], "feature"), 0, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (PKCreditAccountPaymentDetailsViewController *)PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

LABEL_6:
  }

}

void __85__PKPassDetailScheduledPaymentsSectionController_presentSchedulePayments_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, _QWORD);
  id v5;
  PKNavigationController *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t, _QWORD))(v3 + 16);
  v5 = a2;
  v4(v3, 0);
  v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);

  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v6, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKNavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 2);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)scheduledPaymentsChangedForAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  _QWORD block[5];

  v4 = a3;
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (v7 == v6)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

      goto LABEL_9;
    }
    v9 = objc_msgSend(v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_9;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__PKPassDetailScheduledPaymentsSectionController_scheduledPaymentsChangedForAccountIdentifier___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
LABEL_9:

}

uint64_t __95__PKPassDetailScheduledPaymentsSectionController_scheduledPaymentsChangedForAccountIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchScheduledPaymentsAndReloadSections:", 0);
}

- (id)presentationSceneIdentifierForAccountAutomaticPaymentsController:(id)a3
{
  return self->_presentationSceneIdentifier;
}

- (id)allSectionIdentifiers
{
  return self->_allSectionIdentifiers;
}

- (void)setCurrentSegment:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassDetailScheduledPaymentsSectionController;
  -[PKPaymentPassDetailSectionController setCurrentSegment:](&v4, sel_setCurrentSegment_, a3);
  -[PKPassDetailScheduledPaymentsSectionController _updateSections](self, "_updateSections");
}

- (id)sectionIdentifiers
{
  return self->_sectionIdentifiers;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  return objc_msgSend(a3, "isAppleCardPass");
}

- (void)preflight:(id)a3
{
  self->_loadingPayments = 1;
  -[PKPassDetailScheduledPaymentsSectionController fetchScheduledPaymentsAndReloadSections:](self, "fetchScheduledPaymentsAndReloadSections:", a3);
}

- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  unint64_t v7;

  v6 = a4;
  v7 = -[PKPassDetailScheduledPaymentsSectionController _accountServiceScheduledPaymentsRowTypeForRowIndex:sectionIdentifier:](self, "_accountServiceScheduledPaymentsRowTypeForRowIndex:sectionIdentifier:", objc_msgSend(a3, "row"), v6);

  return !self->_loadingPayments || v7 == 3;
}

- (id)titleForHeaderInSectionIdentifier:(id)a3
{
  void *v4;

  if (PKEqualObjects())
  {
    -[PKPassDetailScheduledPaymentsSectionController _titleForScheduledPaymentsSection](self, "_titleForScheduledPaymentsSection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  int IsSingular;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (!PKEqualObjects())
    goto LABEL_13;
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "remainingStatementBalance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paymentDueDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentStatement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount feature](self->_account, "feature");
  v10 = 1;
  if (PKUserInterfaceIdiomSupportsLargeLayouts())
  {
    v11 = !v8 || v9 == 0;
    if (!v11
      && !-[NSArray count](self->_recurringPayments, "count")
      && objc_msgSend(v7, "pk_isPositiveNumber"))
    {
      IsSingular = PKHourOfDateIsSingular();
      v13 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_PAYMENT_DUE_BY");
      if (IsSingular)
        v13 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_PAYMENT_DUE_BY_HOUR_ONE");
      v14 = v13;
      -[PKPassDetailScheduledPaymentsSectionController _dueDateFormatter](self, "_dueDateFormatter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringFromDate:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPassDetailScheduledPaymentsSectionController _dueTimeFormatter](self, "_dueTimeFormatter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringFromDate:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedFeatureString();
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = 0;
    }
  }

  if (v10)
LABEL_13:
    v3 = 0;
  return v3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  NSUInteger v12;
  int64_t v13;

  v5 = a4;
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "adjustedBalance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9) == 1;

  }
  else
  {
    v10 = 0;
  }
  if (PKEqualObjects())
  {
    v11 = -[NSArray count](self->_recurringPayments, "count");
    v12 = -[NSArray count](self->_scheduledPayments, "count");
    if (v11 <= 0)
      v11 = !self->_loadingPayments;
    v13 = v12 + v10 + v11;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[PKPassDetailScheduledPaymentsSectionController _accountServiceScheduledPaymentsCellForRowIndex:sectionIdentifier:tableView:](self, "_accountServiceScheduledPaymentsCellForRowIndex:sectionIdentifier:tableView:", objc_msgSend(a4, "row"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  void *WeakRetained;
  uint64_t v10;
  id *v11;
  id v12;
  id v13;
  id v14;
  id *v15;
  id v16;
  id v17;

  v17 = a4;
  v8 = a5;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v17, 1);
  if (PKStoreDemoModeEnabled())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didSelectInDemoMode");
  }
  else
  {
    v10 = objc_msgSend(v17, "row");
    switch(-[PKPassDetailScheduledPaymentsSectionController _accountServiceScheduledPaymentsRowTypeForRowIndex:sectionIdentifier:](self, "_accountServiceScheduledPaymentsRowTypeForRowIndex:sectionIdentifier:", v10, v8))
    {
      case 0uLL:
        -[NSArray objectAtIndexedSubscript:](self->_recurringPayments, "objectAtIndexedSubscript:", v10);
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (id *)MEMORY[0x1E0D69450];
        goto LABEL_7;
      case 1uLL:
        -[NSArray objectAtIndexedSubscript:](self->_scheduledPayments, "objectAtIndexedSubscript:", v10 - -[NSArray count](self->_recurringPayments, "count"));
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (id *)MEMORY[0x1E0D69458];
LABEL_7:
        v12 = *v11;
        if (WeakRetained)
        {
          v13 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v13, "didSelectPayment:", WeakRetained);

        }
        goto LABEL_12;
      case 2uLL:
        v14 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v14, "didSelectSchedulePayments");

        v15 = (id *)MEMORY[0x1E0D69460];
        goto LABEL_11;
      case 3uLL:
        v16 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v16, "didSelectMakePayment");

        v15 = (id *)MEMORY[0x1E0D69468];
LABEL_11:
        v12 = *v15;
        WeakRetained = 0;
LABEL_12:
        if (v12)
        {
          -[PKPaymentPassDetailSectionController reportPassDetailsAnalyticsForTappedRowTag:additionalAnalytics:pass:](self, "reportPassDetailsAnalyticsForTappedRowTag:additionalAnalytics:pass:", v12, 0, self->_pass);

        }
        break;
      default:
        WeakRetained = 0;
        break;
    }
  }

}

- (BOOL)_shouldDisplaySection:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;

  v4 = a3;
  v5 = -[PKPaymentPassDetailSectionController detailViewStyle](self, "detailViewStyle") != 2
    && +[PKCreditAccountController shouldDisplayScheduledPaymentsWithAccount:andPass:](PKCreditAccountController, "shouldDisplayScheduledPaymentsWithAccount:andPass:", self->_account, self->_pass);
  v6 = PKEqualObjects() & v5;

  return v6;
}

- (id)_dueDateFormatter
{
  NSDateFormatter *dueDateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  NSDateFormatter *v6;
  void *v7;

  dueDateFormatter = self->_dueDateFormatter;
  if (!dueDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_dueDateFormatter;
    self->_dueDateFormatter = v4;

    v6 = self->_dueDateFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v6, "setLocale:", v7);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_dueDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM d"));
    -[NSDateFormatter setFormattingContext:](self->_dueDateFormatter, "setFormattingContext:", 1);
    dueDateFormatter = self->_dueDateFormatter;
  }
  return dueDateFormatter;
}

- (id)_dueTimeFormatter
{
  NSDateFormatter *dueTimeFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  NSDateFormatter *v6;
  void *v7;

  dueTimeFormatter = self->_dueTimeFormatter;
  if (!dueTimeFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_dueTimeFormatter;
    self->_dueTimeFormatter = v4;

    v6 = self->_dueTimeFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v6, "setLocale:", v7);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_dueTimeFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("j:mm a"));
    -[NSDateFormatter setFormattingContext:](self->_dueTimeFormatter, "setFormattingContext:", 1);
    dueTimeFormatter = self->_dueTimeFormatter;
  }
  return dueTimeFormatter;
}

- (id)_titleForScheduledPaymentsSection
{
  -[PKAccount feature](self->_account, "feature");
  return (id)PKLocalizedFeatureString();
}

- (id)_accountServiceScheduledPaymentsCellForRowIndex:(int64_t)a3 sectionIdentifier:(id)a4 tableView:(id)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  NSArray *scheduledPayments;
  int64_t v12;
  NSArray *recurringPayments;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;

  v8 = a5;
  v9 = -[PKPassDetailScheduledPaymentsSectionController _accountServiceScheduledPaymentsRowTypeForRowIndex:sectionIdentifier:](self, "_accountServiceScheduledPaymentsRowTypeForRowIndex:sectionIdentifier:", a3, a4);
  v10 = v9;
  if (v9 > 1)
  {
    -[PKAccount feature](self->_account, "feature");
    if (v10 != 2)
    {
      if (!-[NSArray count](self->_scheduledPayments, "count"))
        -[NSArray count](self->_recurringPayments, "count");
      PKLocalizedFeatureString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailSectionController linkCellWithText:forTableView:](self, "linkCellWithText:forTableView:", v22, v8);
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    PKLocalizedFeatureString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 1;
    -[PKPaymentPassDetailSectionController infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v14, v15, 1, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (self->_loadingAutomaticPayments)
    {
      objc_msgSend(v17, "detailTextLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", 0);

      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v20, "startAnimating");
      if (self->_loadingAutomaticPayments)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
LABEL_26:
        objc_msgSend(v18, "textLabel");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setTextColor:", v21);

        objc_msgSend(v18, "setAccessoryType:", v16);
        objc_msgSend(v18, "setAccessoryView:", v20);

        v24 = (_QWORD *)MEMORY[0x1E0D68030];
        goto LABEL_27;
      }
      v16 = 0;
    }
    else
    {
      v20 = 0;
    }
    -[PKPaymentPassDetailSectionController primaryTextColor](self, "primaryTextColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v29 = v27;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v29;

    goto LABEL_26;
  }
  if (v9)
  {
    scheduledPayments = self->_scheduledPayments;
    v12 = a3 - -[NSArray count](self->_recurringPayments, "count");
    recurringPayments = scheduledPayments;
  }
  else
  {
    recurringPayments = self->_recurringPayments;
    v12 = a3;
  }
  -[NSArray objectAtIndexedSubscript:](recurringPayments, "objectAtIndexedSubscript:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassDetailScheduledPaymentsSectionController _scheduledPaymentCellForPayment:tableView:](self, "_scheduledPaymentCellForPayment:tableView:", v22, v8);
  v23 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v18 = (void *)v23;

  v24 = (_QWORD *)MEMORY[0x1E0D67F48];
  v25 = (_QWORD *)MEMORY[0x1E0D67E28];
  v26 = (_QWORD *)MEMORY[0x1E0D68188];
  if (v10 == 1)
    v26 = (_QWORD *)MEMORY[0x1E0D67FD0];
  if (v10 != 3)
    v25 = v26;
  if (v10)
    v24 = v25;
LABEL_27:
  objc_msgSend(v18, "setAccessibilityIdentifier:", *v24);

  return v18;
}

- (double)tableView:(id)a3 heightForFooterInSectionIdentifier:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)_scheduledPaymentCellForPayment:(id)a3 tableView:(id)a4
{
  id v6;
  PKAccountScheduledPaymentCell *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("scheduledPaymentCell"));
  v7 = (PKAccountScheduledPaymentCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[PKAccountScheduledPaymentCell initWithStyle:reuseIdentifier:]([PKAccountScheduledPaymentCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("scheduledPaymentCell"));
    -[PKPaymentPassDetailSectionController primaryTextColor](self, "primaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountScheduledPaymentCell setTitleColor:](v7, "setTitleColor:", v8);

  }
  -[PKAccountScheduledPaymentCell setPayment:forAccount:](v7, "setPayment:forAccount:", v6, self->_account);

  return v7;
}

- (void)_fetchScheduledPaymentsWithAccountIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  BOOL *p_loadingPayments;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *recurringPayments;
  PKAccount *account;
  PKAccountService *accountService;
  id v27;
  _QWORD v28[4];
  void (**v29)(_QWORD);
  id v30;
  id location;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (PKStoreDemoModeEnabled())
  {
    p_loadingPayments = &self->_loadingPayments;
    self->_loadingPayments = 1;
    -[PKPassDetailScheduledPaymentsSectionController reloadScheduledPayments](self, "reloadScheduledPayments");
LABEL_4:
    v9 = objc_alloc_init(MEMORY[0x1E0D66880]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReferenceIdentifier:", v11);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClientReferenceIdentifier:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66890]), "initWithType:", 1);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIdentifier:", v16);

    objc_msgSend(v14, "setAccountSuffix:", CFSTR("2354"));
    v17 = objc_alloc_init(MEMORY[0x1E0D66888]);
    objc_msgSend(v17, "setName:", CFSTR("Bank of America"));
    objc_msgSend(v14, "setFundingDetails:", v17);
    objc_msgSend(v9, "setFundingSource:", v14);
    v18 = objc_alloc_init(MEMORY[0x1E0D66898]);
    objc_msgSend(v18, "setFrequency:", 7);
    objc_msgSend(v18, "setPreset:", 3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKEndOfMonth();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setScheduledDate:", v20);

    objc_msgSend(v9, "setScheduleDetails:", v18);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKEndOfMonth();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPaymentDate:", v22);

    objc_msgSend(v9, "setState:", 1);
    v32[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
    recurringPayments = self->_recurringPayments;
    self->_recurringPayments = v23;

    *p_loadingPayments = 0;
    -[PKPassDetailScheduledPaymentsSectionController reloadScheduledPayments](self, "reloadScheduledPayments");
    if (v6)
      v6[2](v6);

    goto LABEL_7;
  }
  v8 = PKUIOnlyDemoModeEnabled();
  p_loadingPayments = &self->_loadingPayments;
  self->_loadingPayments = 1;
  -[PKPassDetailScheduledPaymentsSectionController reloadScheduledPayments](self, "reloadScheduledPayments");
  if (v8)
    goto LABEL_4;
  account = self->_account;
  if (account && (-[PKAccount accessLevel](account, "accessLevel") | 2) != 2)
  {
    objc_initWeak(&location, self);
    accountService = self->_accountService;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __106__PKPassDetailScheduledPaymentsSectionController__fetchScheduledPaymentsWithAccountIdentifier_completion___block_invoke;
    v28[3] = &unk_1E3E61BB8;
    objc_copyWeak(&v30, &location);
    v29 = v6;
    -[PKAccountService scheduledPaymentsWithAccountIdentifier:includeFailedRecurringPayments:completion:](accountService, "scheduledPaymentsWithAccountIdentifier:includeFailedRecurringPayments:completion:", v27, 1, v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  else if (v6)
  {
    v6[2](v6);
  }
LABEL_7:

}

void __106__PKPassDetailScheduledPaymentsSectionController__fetchScheduledPaymentsWithAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __106__PKPassDetailScheduledPaymentsSectionController__fetchScheduledPaymentsWithAccountIdentifier_completion___block_invoke_2;
  v9[3] = &unk_1E3E689E0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v6;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __106__PKPassDetailScheduledPaymentsSectionController__fetchScheduledPaymentsWithAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 104) = 0;
    if (!*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v6 = *(id *)(a1 + 40);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v24 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            if (objc_msgSend(v11, "isRecurring", (_QWORD)v23))
              v12 = v4;
            else
              v12 = v5;
            objc_msgSend(v12, "addObject:", v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v8);
      }

      v13 = objc_msgSend(v4, "copy");
      v14 = (void *)v3[17];
      v3[17] = v13;

      objc_msgSend(v5, "pk_objectsPassingTest:", &__block_literal_global_237);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v3[18];
      v3[18] = v15;

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("paymentDate"), 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)v3[18];
      v27 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sortedArrayUsingDescriptors:", v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v3[18];
      v3[18] = v20;

    }
    objc_msgSend(v3, "reloadScheduledPayments", (_QWORD)v23);
    v22 = *(_QWORD *)(a1 + 48);
    if (v22)
      (*(void (**)(void))(v22 + 16))();
  }

}

BOOL __106__PKPassDetailScheduledPaymentsSectionController__fetchScheduledPaymentsWithAccountIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "scheduleDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "frequency") != 1;

  return v3;
}

- (unint64_t)_accountServiceScheduledPaymentsRowTypeForRowIndex:(int64_t)a3 sectionIdentifier:(id)a4
{
  NSArray *recurringPayments;
  id v7;
  uint64_t v8;
  int64_t v9;
  int v10;
  int64_t v11;

  recurringPayments = self->_recurringPayments;
  v7 = a4;
  v8 = -[NSArray count](recurringPayments, "count");
  v9 = -[NSArray count](self->_scheduledPayments, "count");
  v10 = PKEqualObjects();

  if (!v10)
    return 3;
  v11 = a3 - v8;
  if (a3 - v8 < v9)
    return v11 >= 0;
  if (v11 == v9 && v8 == 0 && !self->_loadingPayments)
    return 2;
  else
    return 3;
}

- (NSArray)recurringPayments
{
  return self->_recurringPayments;
}

- (NSArray)scheduledPayments
{
  return self->_scheduledPayments;
}

- (PKPassDetailScheduledPaymentsSectionControllerDelegate)delegate
{
  return (PKPassDetailScheduledPaymentsSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scheduledPayments, 0);
  objc_storeStrong((id *)&self->_recurringPayments, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_allSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_presentationSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_dueTimeFormatter, 0);
  objc_storeStrong((id *)&self->_dueDateFormatter, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
