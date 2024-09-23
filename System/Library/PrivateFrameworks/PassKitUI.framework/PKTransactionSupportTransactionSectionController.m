@implementation PKTransactionSupportTransactionSectionController

- (PKTransactionSupportTransactionSectionController)initWithTransactionItem:(id)a3 transactionItemPresenter:(id)a4 collectionView:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKTransactionSupportTransactionSectionController *v12;
  PKTransactionSupportTransactionSectionController *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *, void *);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PKTransactionSupportTransactionSectionController;
  v12 = -[PKPaymentSetupListSectionController init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_transactionItem, a3);
    objc_storeStrong((id *)&v13->_transactionItemPresenter, a4);
    objc_storeStrong((id *)&v13->_collectionView, a5);
    objc_initWeak(&location, v13);
    v14 = (void *)MEMORY[0x1E0DC35C8];
    v15 = objc_opt_class();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __116__PKTransactionSupportTransactionSectionController_initWithTransactionItem_transactionItemPresenter_collectionView___block_invoke;
    v21 = &unk_1E3E670A8;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v14, "registrationWithCellClass:configurationHandler:", v15, &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupListSectionController setCellRegistration:](v13, "setCellRegistration:", v16, v18, v19, v20, v21);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __116__PKTransactionSupportTransactionSectionController_initWithTransactionItem_transactionItemPresenter_collectionView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_decorateCell:forRowItem:atIndexPath:", v10, v8, v7);

  }
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKTransactionSupportTransactionSectionController;
  -[PKPaymentSetupListSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v6, sel_layoutWithLayoutEnvironment_sectionIdentifier_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentInsets");
  objc_msgSend(v4, "setContentInsets:", 16.0);
  return v4;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v8[0] = self->_transactionItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendItems:", v6);

  return v5;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (void)_decorateCell:(id)a3 forRowItem:(id)a4 atIndexPath:(id)a5
{
  -[PKDashboardPaymentTransactionItemPresenter updateCell:forItem:inCollectionView:atIndexPath:](self->_transactionItemPresenter, "updateCell:forItem:inCollectionView:atIndexPath:", a3, a4, self->_collectionView, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_transactionItemPresenter, 0);
  objc_storeStrong((id *)&self->_transactionItem, 0);
}

@end
