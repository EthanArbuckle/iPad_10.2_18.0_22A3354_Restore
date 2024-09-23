@implementation PKPeerPaymentRecurringPaymentActionSectionController

- (id)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("actions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didSelectItem:(id)a3
{
  PKPeerPaymentRecurringPaymentSectionControllerDelegate **p_delegate;
  id WeakRetained;
  _BOOL4 v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "deselectCells");

  v12 = 0;
  v13 = 0;
  v6 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:account:unableReason:displayableError:](PKPeerPaymentActionController, "canPerformPeerPaymentAction:account:unableReason:displayableError:", 3, self->_account, &v13, &v12);
  v7 = v12;
  if (v6)
  {
    -[PKPeerPaymentRecurringPaymentActionSectionController _beginSetupFlow](self, "_beginSetupFlow");
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__PKPeerPaymentRecurringPaymentActionSectionController_didSelectItem___block_invoke;
    v11[3] = &unk_1E3E612E8;
    v11[4] = self;
    +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:](PKPeerPaymentActionController, "alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:", v13, v7, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

uint64_t __70__PKPeerPaymentRecurringPaymentActionSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openPaymentSetupWithNetworkWhitelist:paymentSetupMode:", 0, 0);
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 1;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  objc_msgSend(v4, "appendItems:", &unk_1E3FAE980);
  return v4;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC35C8];
  v6 = objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__PKPeerPaymentRecurringPaymentActionSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E3E62748;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "registrationWithCellClass:configurationHandler:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __80__PKPeerPaymentRecurringPaymentActionSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = (id)objc_msgSend(WeakRetained, "_decorateListCell:forRowItem:", v9, v6);

}

- (void)_beginSetupFlow
{
  PKNavigationController *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  PKRecipientPickerViewController *v7;

  v7 = -[PKRecipientPickerViewController initWithTransactionSourceCollection:familyCollection:peerPaymentSendFlowType:]([PKRecipientPickerViewController alloc], "initWithTransactionSourceCollection:familyCollection:peerPaymentSendFlowType:", self->_sourceCollection, self->_familyCollection, 2);
  v3 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v7);
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v3, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }
  -[PKNavigationController setModalPresentationStyle:](v3, "setModalPresentationStyle:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0D67230]);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithWebService:", v8);

  objc_msgSend(v9, "setAllowedPaymentNetworks:", v6);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v9, "setAllowedFeatureIdentifiers:", v10);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __111__PKPeerPaymentRecurringPaymentActionSectionController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke;
  v12[3] = &unk_1E3E61A30;
  objc_copyWeak(v14, &location);
  v11 = v9;
  v13 = v11;
  v14[1] = (id)a4;
  objc_msgSend(v11, "preflightWithCompletion:", v12);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

void __111__PKPeerPaymentRecurringPaymentActionSectionController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11[2];
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__PKPeerPaymentRecurringPaymentActionSectionController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2;
  block[3] = &unk_1E3E61A08;
  objc_copyWeak(v11, a1 + 5);
  v12 = a2;
  v6 = a1[4];
  v11[1] = a1[6];
  v9 = v6;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v11);
}

void __111__PKPeerPaymentRecurringPaymentActionSectionController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(WeakRetained, "_paymentSetupNavigationControllerForProvisioningController:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPaymentSetupMode:", *(_QWORD *)(a1 + 56));
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __111__PKPeerPaymentRecurringPaymentActionSectionController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3;
      v11[3] = &unk_1E3E619E0;
      v11[4] = v3;
      v12 = v4;
      v5 = v4;
      objc_msgSend(v5, "preflightWithCompletion:", v11);

    }
    else
    {
      v6 = *(void **)(a1 + 40);
      if (v6)
      {
        v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v7;
      +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained(v3 + 11);
      objc_msgSend(v9, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentViewController:animated:completion:", v8, 1, 0);

    }
  }

}

void __111__PKPeerPaymentRecurringPaymentActionSectionController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(WeakRetained, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4;
  PKPaymentSetupNavigationController *v5;

  v4 = a3;
  v5 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", v4, 0);

  -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v5, "setCustomFormSheetPresentationStyleForiPad");
  -[PKPaymentSetupNavigationController setSetupDelegate:](v5, "setSetupDelegate:", self);
  -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](v5, "setShowsWelcomeViewController:", 0);
  return v5;
}

- (id)_decorateListCell:(id)a3 forRowItem:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0DC39A8];
  v5 = a3;
  objc_msgSend(v4, "cellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_LIST_ACTION_SET_UP"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  objc_msgSend(v6, "textProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v9);

  objc_msgSend(v6, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 8.0);
  objc_msgSend(v5, "setContentConfiguration:", v6);
  objc_msgSend(v5, "setConfigurationUpdateHandler:", &__block_literal_global_201);

  return v6;
}

void __85__PKPeerPaymentRecurringPaymentActionSectionController__decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isHighlighted") & 1) != 0 || objc_msgSend(v4, "isSelected"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

  }
  objc_msgSend(v7, "setBackgroundConfiguration:", v5);

}

- (void)paymentSetupDidFinish:(id)a3
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_frontMostViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (PKTransactionSourceCollection)sourceCollection
{
  return self->_sourceCollection;
}

- (void)setSourceCollection:(id)a3
{
  objc_storeStrong((id *)&self->_sourceCollection, a3);
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (void)setFamilyCollection:(id)a3
{
  objc_storeStrong((id *)&self->_familyCollection, a3);
}

- (PKPeerPaymentRecurringPaymentSectionControllerDelegate)delegate
{
  return (PKPeerPaymentRecurringPaymentSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_sourceCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
