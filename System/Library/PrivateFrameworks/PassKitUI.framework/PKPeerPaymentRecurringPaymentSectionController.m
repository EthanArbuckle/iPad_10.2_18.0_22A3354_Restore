@implementation PKPeerPaymentRecurringPaymentSectionController

- (PKPeerPaymentRecurringPaymentSectionController)init
{
  PKPeerPaymentRecurringPaymentSectionController *v2;
  PKDashboardPaymentTransactionItemPresenter *v3;
  PKDashboardPaymentTransactionItemPresenter *presenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentRecurringPaymentSectionController;
  v2 = -[PKPeerPaymentRecurringPaymentSectionController init](&v6, sel_init);
  if (v2)
  {
    v3 = -[PKDashboardPaymentTransactionItemPresenter initWithContext:detailViewStyle:avatarViewDelegate:]([PKDashboardPaymentTransactionItemPresenter alloc], "initWithContext:detailViewStyle:avatarViewDelegate:", 0, 0, 0);
    presenter = v2->_presenter;
    v2->_presenter = v3;

  }
  return v2;
}

- (id)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("recurringPayments");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didSelectItem:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PKPeerPaymentRecurringPaymentDetailViewController *v10;
  void *v11;
  PKPeerPaymentRecurringPaymentDetailViewController *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  id v17;

  v4 = (objc_class *)MEMORY[0x1E0D673F8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v6, "initWithPeerPaymentWebService:", v7);

  objc_msgSend(v17, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recurringPaymentsFeatureDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [PKPeerPaymentRecurringPaymentDetailViewController alloc];
  objc_msgSend(v5, "recipientAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKPeerPaymentRecurringPaymentDetailViewController initWithRecurringPayment:recipientAddress:mode:context:peerPaymentController:remoteMessagesComposer:](v10, "initWithRecurringPayment:recipientAddress:mode:context:peerPaymentController:remoteMessagesComposer:", v5, v11, 2, 0, v17, 0);

  objc_msgSend(v9, "minimumAmount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentRecurringPaymentDetailViewController setMinimumAmount:](v12, "setMinimumAmount:", v13);

  objc_msgSend(v9, "maximumAmount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentRecurringPaymentDetailViewController setMaximumAmount:](v12, "setMaximumAmount:", v14);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pushViewController:animated:", v12, 1);

}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 1;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  objc_msgSend(v5, "appendItems:", self->_payments);
  return v5;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0DC35C8];
    v7 = objc_opt_class();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__PKPeerPaymentRecurringPaymentSectionController_cellRegistrationForItem___block_invoke;
    v10[3] = &unk_1E3E77800;
    v10[4] = self;
    objc_msgSend(v6, "registrationWithCellClass:configurationHandler:", v7, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

void __74__PKPeerPaymentRecurringPaymentSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  id v14;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v6, "row"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD **)(a1 + 32);
  v9 = (void *)v8[8];
  objc_msgSend(v8, "paymentTransactionItemForPayment:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateCell:forItem:inCollectionView:atIndexPath:", v7, v10, v7, v6);

  v11 = *(void **)(a1 + 32);
  v12 = objc_msgSend(v6, "row") == 0;
  v13 = objc_msgSend(v6, "row");

  objc_msgSend(v11, "_applyMaskToCell:firstInSection:lastInSection:", v7, v12, v13 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count") - 1);
}

- (void)_applyMaskToCell:(id)a3 firstInSection:(BOOL)a4 lastInSection:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v11 = v7;
  v8 = 3;
  if (!v6 || !v5)
    v8 = 1;
  v9 = 2;
  if (!v5)
    v9 = 0;
  if (v6)
    v10 = v8;
  else
    v10 = v9;
  objc_msgSend(v7, "setMaskType:", v10);
  objc_msgSend(v11, "setShowsBottomSeparator:", !v5);

}

- (id)paymentTransactionItemForPayment:(id)a3
{
  id v4;
  PKDashboardPaymentTransactionItem *v5;
  PKTransactionSourceCollection *sourceCollection;
  PKFamilyMemberCollection *familyCollection;
  void *v8;
  PKDashboardPaymentTransactionItem *v9;

  v4 = a3;
  v5 = [PKDashboardPaymentTransactionItem alloc];
  sourceCollection = self->_sourceCollection;
  familyCollection = self->_familyCollection;
  PKPeerPaymentTransactionForRecurringPayment();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PKDashboardPaymentTransactionItem initWithTransactionSourceCollection:familyCollection:transaction:account:accountUserCollection:bankConnectInstitution:](v5, "initWithTransactionSourceCollection:familyCollection:transaction:account:accountUserCollection:bankConnectInstitution:", sourceCollection, familyCollection, v8, 0, 0, 0);
  return v9;
}

- (NSArray)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
  objc_storeStrong((id *)&self->_payments, a3);
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
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

@end
