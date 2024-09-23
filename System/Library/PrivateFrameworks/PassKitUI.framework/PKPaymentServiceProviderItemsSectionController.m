@implementation PKPaymentServiceProviderItemsSectionController

- (PKPaymentServiceProviderItemsSectionController)init
{

  return 0;
}

- (PKPaymentServiceProviderItemsSectionController)initWithIdentifier:(id)a3 serviceProviderProductWithItems:(id)a4 currency:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PKPaymentServiceProviderItemsSectionController *v15;
  uint64_t v16;
  NSArray *listItems;
  _QWORD v19[4];
  id v20;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentServiceProviderItemsSectionController;
  v15 = -[PKPaymentSetupListSectionController initWithIdentifiers:](&v21, sel_initWithIdentifiers_, v14);

  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v13);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __119__PKPaymentServiceProviderItemsSectionController_initWithIdentifier_serviceProviderProductWithItems_currency_delegate___block_invoke;
    v19[3] = &unk_1E3E78D90;
    v20 = v12;
    objc_msgSend(v11, "pk_arrayByApplyingBlock:", v19);
    v16 = objc_claimAutoreleasedReturnValue();
    listItems = v15->_listItems;
    v15->_listItems = (NSArray *)v16;

  }
  return v15;
}

PKServiceProviderListItem *__119__PKPaymentServiceProviderItemsSectionController_initWithIdentifier_serviceProviderProductWithItems_currency_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  PKServiceProviderListItem *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(PKServiceProviderListItem);
  -[PKServiceProviderListItem setItemPair:](v5, "setItemPair:", v3);

  objc_msgSend(v4, "localizedDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupListItem setTitle:](v5, "setTitle:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D66C88]);
  objc_msgSend(v4, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithAmount:currency:exponent:", v8, *(_QWORD *)(a1 + 32), 0);

  objc_msgSend(v4, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formattedStringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "length");

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v11, v13);
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v15;
    }
  }
  -[PKPaymentSetupListItem setSubtitle:](v5, "setSubtitle:", v11);

  return v5;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  objc_msgSend(v5, "appendItems:", self->_listItems);
  return v5;
}

- (void)didSelectItem:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;
  PKPaymentServiceProviderItemsSectionControllerDelegate **p_delegate;
  id v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_listItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v9);
        if (v10 == v4)
        {
          objc_msgSend(v4, "setSelected:", 1, (_QWORD)v18);
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v12 = WeakRetained;
          v13 = v4;
        }
        else
        {
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "selected"))
            goto LABEL_11;
          objc_msgSend(v10, "setSelected:", 0);
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v12 = WeakRetained;
          v13 = v10;
        }
        objc_msgSend(WeakRetained, "reloadItem:animated:", v13, 1, (_QWORD)v18);

LABEL_11:
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  p_delegate = &self->_delegate;
  v15 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v4, "itemPair");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "didSelectServiceProviderItem:", v16);

  v17 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v17, "deselectCells");

}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[PKPaymentSetupListSectionController defaultListLayout](self, "defaultListLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentInsets");
  objc_msgSend(v7, "setContentInsets:", 16.0);

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_listItems, 0);
}

@end
