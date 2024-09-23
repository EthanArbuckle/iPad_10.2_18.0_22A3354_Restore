@implementation PKPeerPaymentRecurringPaymentViewController

- (PKPeerPaymentRecurringPaymentViewController)initWithContext:(int64_t)a3 peerPaymentService:(id)a4 transactionSourceCollection:(id)a5 familyCollection:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKPeerPaymentRecurringPaymentViewController *v14;
  PKPeerPaymentRecurringPaymentViewController *v15;
  PKPeerPaymentRecurringPaymentSectionController *v16;
  PKPeerPaymentRecurringPaymentSectionController *paymentsSectionController;
  PKPeerPaymentRecurringPaymentActionSectionController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKPeerPaymentRecurringPaymentViewController;
  v14 = -[PKDynamicCollectionViewController init](&v24, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_context = a3;
    objc_storeStrong((id *)&v14->_peerPaymentService, a4);
    -[PKPeerPaymentService registerObserver:](v15->_peerPaymentService, "registerObserver:", v15);
    v16 = objc_alloc_init(PKPeerPaymentRecurringPaymentSectionController);
    paymentsSectionController = v15->_paymentsSectionController;
    v15->_paymentsSectionController = v16;

    -[PKPeerPaymentRecurringPaymentSectionController setSourceCollection:](v15->_paymentsSectionController, "setSourceCollection:", v12);
    -[PKPeerPaymentRecurringPaymentSectionController setFamilyCollection:](v15->_paymentsSectionController, "setFamilyCollection:", v13);
    -[PKPeerPaymentRecurringPaymentSectionController setDelegate:](v15->_paymentsSectionController, "setDelegate:", v15);
    v18 = objc_alloc_init(PKPeerPaymentRecurringPaymentActionSectionController);
    objc_msgSend(v11, "account");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentActionSectionController setAccount:](v18, "setAccount:", v19);

    -[PKPeerPaymentRecurringPaymentActionSectionController setSourceCollection:](v18, "setSourceCollection:", v12);
    -[PKPeerPaymentRecurringPaymentActionSectionController setFamilyCollection:](v18, "setFamilyCollection:", v13);
    -[PKPeerPaymentRecurringPaymentActionSectionController setDelegate:](v18, "setDelegate:", v15);
    v25[0] = v15->_paymentsSectionController;
    v25[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicCollectionViewController setSections:animated:](v15, "setSections:animated:", v20, 0);

    -[PKPeerPaymentRecurringPaymentViewController navigationItem](v15, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentRecurringString(CFSTR("DASHBOARD_MORE_MENU_RECURRING_PAYMENTS"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTitle:", v22);

  }
  return v15;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PKPeerPaymentRecurringPaymentViewController_preflightWithCompletion___block_invoke;
  v6[3] = &unk_1E3E61878;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKPeerPaymentRecurringPaymentViewController reloadRecurringPaymentsWithCompletion:](self, "reloadRecurringPaymentsWithCompletion:", v6);

}

void __71__PKPeerPaymentRecurringPaymentViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1064), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)showDetailsForRecurringPaymentIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_payments;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v16);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = v4;
        v13 = v12;
        if (v11 == v12)
        {

        }
        else
        {
          if (!v4 || !v11)
          {

LABEL_16:
            continue;
          }
          v14 = objc_msgSend(v11, "isEqualToString:", v12);

          if (!v14)
            goto LABEL_16;
        }
        if (objc_msgSend(v10, "type") != 1)
          goto LABEL_16;
        v15 = objc_msgSend(v10, "sentByMe");

        if (v15)
        {
          -[PKPeerPaymentRecurringPaymentSectionController didSelectItem:](self->_paymentsSectionController, "didSelectItem:", v10);
          goto LABEL_19;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
LABEL_19:

}

- (void)reloadRecurringPaymentsWithCompletion:(id)a3
{
  id v4;
  PKPeerPaymentService *peerPaymentService;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  peerPaymentService = self->_peerPaymentService;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__PKPeerPaymentRecurringPaymentViewController_reloadRecurringPaymentsWithCompletion___block_invoke;
  v7[3] = &unk_1E3E61878;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PKPeerPaymentService recurringPaymentsWithCompletion:](peerPaymentService, "recurringPaymentsWithCompletion:", v7);

}

void __85__PKPeerPaymentRecurringPaymentViewController_reloadRecurringPaymentsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKPeerPaymentRecurringPaymentViewController_reloadRecurringPaymentsWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E65388;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __85__PKPeerPaymentRecurringPaymentViewController_reloadRecurringPaymentsWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (_QWORD)v13) == 1 && objc_msgSend(v8, "sentByMe"))
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_175_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(*(_QWORD *)(a1 + 40) + 1072);
  v11 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v10, "setPayments:", v11);

  objc_msgSend(*(id *)(a1 + 40), "reloadDataAnimated:", 1);
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, *(_QWORD *)(a1 + 32));

}

uint64_t __85__PKPeerPaymentRecurringPaymentViewController_reloadRecurringPaymentsWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "createdDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createdDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)recurringPaymentsChanged
{
  -[PKPeerPaymentRecurringPaymentViewController reloadRecurringPaymentsWithCompletion:](self, "reloadRecurringPaymentsWithCompletion:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentsSectionController, 0);
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
}

@end
