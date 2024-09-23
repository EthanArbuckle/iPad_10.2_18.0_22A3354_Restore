@implementation PKPaymentSetupBankAppDisambiguationController

- (PKPaymentSetupBankAppDisambiguationController)initWithPaymentSetupProduct:(id)a3
{
  id v5;
  PKPaymentSetupBankAppDisambiguationController *v6;
  PKPaymentSetupBankAppDisambiguationController *v7;
  id *p_paymentSetupProduct;
  NSMutableArray *v9;
  NSMutableArray *inAppItemIdentifierToItemMapping;
  NSMutableArray *v11;
  NSMutableArray *cameraItemIdentifierToItemMapping;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSMutableArray *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  NSMutableArray *v30;
  void *v31;
  void *v32;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  void *v44;
  _BYTE v45[128];
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKPaymentSetupBankAppDisambiguationController;
  v6 = -[PKPaymentSetupListSectionController init](&v43, sel_init);
  v7 = v6;
  if (v6)
  {
    v34 = v5;
    p_paymentSetupProduct = (id *)&v6->_paymentSetupProduct;
    objc_storeStrong((id *)&v6->_paymentSetupProduct, a3);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    inAppItemIdentifierToItemMapping = v7->_inAppItemIdentifierToItemMapping;
    v7->_inAppItemIdentifierToItemMapping = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    cameraItemIdentifierToItemMapping = v7->_cameraItemIdentifierToItemMapping;
    v7->_cameraItemIdentifierToItemMapping = v11;

    objc_msgSend(*p_paymentSetupProduct, "supportedInAppTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_paymentSetupProduct, "supportedCameraCaptureTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(v15);
          -[PKPaymentSetupBankAppDisambiguationController _listItemWithName:](v7, "_listItemWithName:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v7->_inAppItemIdentifierToItemMapping, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v17);
    }

    v21 = v7->_inAppItemIdentifierToItemMapping;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("title"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray sortUsingDescriptors:](v21, "sortUsingDescriptors:", v23);

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v24 = v14;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v36 != v27)
            objc_enumerationMutation(v24);
          -[PKPaymentSetupBankAppDisambiguationController _listItemWithName:](v7, "_listItemWithName:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v7->_cameraItemIdentifierToItemMapping, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v26);
    }

    v30 = v7->_cameraItemIdentifierToItemMapping;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("title"), 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray sortUsingDescriptors:](v30, "sortUsingDescriptors:", v32);

    v5 = v34;
  }

  return v7;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "addObjectsFromArray:", self->_inAppItemIdentifierToItemMapping);
  objc_msgSend(v6, "addObjectsFromArray:", self->_cameraItemIdentifierToItemMapping);
  objc_msgSend(v5, "appendItems:", v6);

  return v5;
}

- (id)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PKPaymentSetupBankAppDisambiguationControllerSectionIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didSelectItem:(id)a3
{
  void *v4;
  NSMutableArray *inAppItemIdentifierToItemMapping;
  uint64_t v6;
  id v7;
  int v8;
  id WeakRetained;
  id *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupBankAppDisambiguationController _updateItemWithIdentifier:loadingIndicatorVisibility:](self, "_updateItemWithIdentifier:loadingIndicatorVisibility:", v4, 1);
  inAppItemIdentifierToItemMapping = self->_inAppItemIdentifierToItemMapping;
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__PKPaymentSetupBankAppDisambiguationController_didSelectItem___block_invoke;
  v17[3] = &unk_1E3E6ECA0;
  v7 = v4;
  v18 = v7;
  v8 = -[NSMutableArray pk_containsObjectPassingTest:](inAppItemIdentifierToItemMapping, "pk_containsObjectPassingTest:", v17);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v8)
  {
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __63__PKPaymentSetupBankAppDisambiguationController_didSelectItem___block_invoke_2;
    v15[3] = &unk_1E3E61388;
    v10 = &v16;
    v15[4] = self;
    v16 = v7;
    v11 = v7;
    objc_msgSend(WeakRetained, "didSelectInAppWithCompletion:", v15);
  }
  else
  {
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __63__PKPaymentSetupBankAppDisambiguationController_didSelectItem___block_invoke_3;
    v13[3] = &unk_1E3E61388;
    v10 = &v14;
    v13[4] = self;
    v14 = v7;
    v12 = v7;
    objc_msgSend(WeakRetained, "didSelectCameraWithCompletion:", v13);
  }

}

uint64_t __63__PKPaymentSetupBankAppDisambiguationController_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __63__PKPaymentSetupBankAppDisambiguationController_didSelectItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateItemWithIdentifier:loadingIndicatorVisibility:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __63__PKPaymentSetupBankAppDisambiguationController_didSelectItem___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateItemWithIdentifier:loadingIndicatorVisibility:", *(_QWORD *)(a1 + 40), 0);
}

- (id)_listItemWithName:(id)a3
{
  id v3;
  PKPaymentSetupListItem *v4;
  void *v5;
  PKPaymentSetupListItem *v6;

  v3 = a3;
  v4 = [PKPaymentSetupListItem alloc];
  PKUIImageNamed(CFSTR("PlaceholderCardArt_Small"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPaymentSetupListItem initWithTitle:subtitle:icon:](v4, "initWithTitle:subtitle:icon:", v3, 0, v5);

  -[PKPaymentSetupListItem setDisplayChevron:](v6, "setDisplayChevron:", 1);
  return v6;
}

- (void)_updateItemWithIdentifier:(id)a3 loadingIndicatorVisibility:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a4;
  v6 = a3;
  v7 = self->_inAppItemIdentifierToItemMapping;
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __102__PKPaymentSetupBankAppDisambiguationController__updateItemWithIdentifier_loadingIndicatorVisibility___block_invoke;
  v19[3] = &unk_1E3E6ECC8;
  v16 = v6;
  v20 = v16;
  v9 = -[NSMutableArray indexOfObjectPassingTest:](v7, "indexOfObjectPassingTest:", v19);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = self->_cameraItemIdentifierToItemMapping;

    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __102__PKPaymentSetupBankAppDisambiguationController__updateItemWithIdentifier_loadingIndicatorVisibility___block_invoke_2;
    v17[3] = &unk_1E3E6ECC8;
    v18 = v16;
    v11 = -[NSMutableArray indexOfObjectPassingTest:](v10, "indexOfObjectPassingTest:", v17);

    v7 = v10;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_9;
  }
  else
  {
    v11 = v9;
  }
  -[NSMutableArray objectAtIndex:](v7, "objectAtIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && objc_msgSend(v12, "loadingIndicatorVisible") != v4)
  {
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v14, "setLoadingIndicatorVisible:", v4);
    -[NSMutableArray replaceObjectAtIndex:withObject:](v7, "replaceObjectAtIndex:withObject:", v11, v14);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "reloadItem:animated:", v14, 1);

  }
LABEL_9:

}

uint64_t __102__PKPaymentSetupBankAppDisambiguationController__updateItemWithIdentifier_loadingIndicatorVisibility___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __102__PKPaymentSetupBankAppDisambiguationController__updateItemWithIdentifier_loadingIndicatorVisibility___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (PKPaymentSetupBankAppDisambiguationControllerDelegate)delegate
{
  return (PKPaymentSetupBankAppDisambiguationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cameraItemIdentifierToItemMapping, 0);
  objc_storeStrong((id *)&self->_inAppItemIdentifierToItemMapping, 0);
  objc_storeStrong((id *)&self->_paymentSetupProduct, 0);
}

@end
