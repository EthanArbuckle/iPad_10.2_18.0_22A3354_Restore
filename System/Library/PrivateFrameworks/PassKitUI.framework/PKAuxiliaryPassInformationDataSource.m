@implementation PKAuxiliaryPassInformationDataSource

- (PKAuxiliaryPassInformationDataSource)initWithItem:(id)a3 forPass:(id)a4
{
  id v7;
  id v8;
  PKAuxiliaryPassInformationDataSource *v9;
  PKAuxiliaryPassInformationDataSource *v10;
  uint64_t v11;
  NSIndexPath *headerIndexPath;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKAuxiliaryPassInformationDataSource;
  v9 = -[PKAuxiliaryPassInformationDataSource init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_item, a3);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    headerIndexPath = v10->_headerIndexPath;
    v10->_headerIndexPath = (NSIndexPath *)v11;

    v10->_contentIsLoaded = 0;
    objc_msgSend(v8, "uniqueID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAuxiliaryPassInformationDataSource _loadMerchantForPassUniqueID:](v10, "_loadMerchantForPassUniqueID:", v13);

  }
  return v10;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[PKAuxiliaryPassInformationDataSource _isDynamicSection:](self, "_isDynamicSection:"))
  {
    -[PKPassAuxiliaryPassInformationItem sections](self->_item, "sections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", (unint64_t)((double)a3 + -1.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "header");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[PKDashboardHeaderTextItem itemWithHeaderText:](PKDashboardHeaderTextItem, "itemWithHeaderText:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setStyle:", 5);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitleColor:", v9);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)footerTextItemForSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[PKAuxiliaryPassInformationDataSource _isDynamicSection:](self, "_isDynamicSection:"))
  {
    -[PKPassAuxiliaryPassInformationItem sections](self->_item, "sections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", (unint64_t)((double)a3 + -1.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "footer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[PKDashboardFooterTextItem itemWithFooterText:](PKDashboardFooterTextItem, "itemWithFooterText:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (unint64_t)numberOfSections
{
  PKMerchant *merchant;
  void *v4;
  unint64_t v5;

  merchant = self->_merchant;
  if (!self->_contentIsLoaded)
  {
    v5 = 0;
    if (merchant)
      return v5;
    goto LABEL_3;
  }
  -[PKPassAuxiliaryPassInformationItem sections](self->_item, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") + 2;

  if (!merchant)
LABEL_3:
    v5 -= self->_contentIsLoaded;
  return v5;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  if (!a3)
    return 1;
  if (!-[PKAuxiliaryPassInformationDataSource _isDynamicSection:](self, "_isDynamicSection:"))
    return self->_merchant != 0;
  if (!self->_contentIsLoaded)
    return 0;
  -[PKPassAuxiliaryPassInformationItem sections](self->_item, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", (unint64_t)((double)a3 + -1.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKDashboardTextActionItem *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5)
  {
    v6 = v5;
    if (-[PKAuxiliaryPassInformationDataSource _isDynamicSection:](self, "_isDynamicSection:", v5))
    {
      -[PKPassAuxiliaryPassInformationItem sections](self->_item, "sections");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", (unint64_t)((double)v6 + -1.0));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rows");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v4, "row"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_alloc_init(PKDashboardTextActionItem);
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      -[PKPassAuxiliaryPassInformationItem fields](self->_item, "fields");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v41;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v41 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v17, "key");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", v10);

            if (v19)
            {
              v39 = 0;
              objc_msgSend(v17, "labelImage");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              +[PKDashboardTextActionItem colorForSemanticColor:hasTintColor:](PKDashboardTextActionItem, "colorForSemanticColor:hasTintColor:", objc_msgSend(v20, "tintColor"), &v39);
              v21 = objc_claimAutoreleasedReturnValue();
              v38 = v20;
              +[PKDashboardTextActionItem imageForPassFieldImage:hasTintColor:](PKDashboardTextActionItem, "imageForPassFieldImage:hasTintColor:", v20, v39);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "value");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "valueImage");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              +[PKDashboardTextActionItem colorForSemanticColor:hasTintColor:](PKDashboardTextActionItem, "colorForSemanticColor:hasTintColor:", objc_msgSend(v23, "tintColor"), &v39);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v23;
              +[PKDashboardTextActionItem imageForPassFieldImage:hasTintColor:](PKDashboardTextActionItem, "imageForPassFieldImage:hasTintColor:", v23, v39);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "accessoryImage");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              +[PKDashboardTextActionItem colorForSemanticColor:hasTintColor:](PKDashboardTextActionItem, "colorForSemanticColor:hasTintColor:", objc_msgSend(v24, "tintColor"), &v39);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              +[PKDashboardTextActionItem imageForPassFieldImage:hasTintColor:](PKDashboardTextActionItem, "imageForPassFieldImage:hasTintColor:", v24, v39);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "label");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKDashboardTextActionItem setTitle:](v11, "setTitle:", v26);

              -[PKDashboardTextActionItem setTitleImage:](v11, "setTitleImage:", v22);
              v27 = (void *)v21;
              -[PKDashboardTextActionItem setTitleColor:](v11, "setTitleColor:", v21);
              v28 = v33;
              v29 = v28;
              if (v28)
              {
                v30 = objc_msgSend(v28, "length");

                if (v30)
                  v31 = v29;
                else
                  v31 = 0;
              }
              else
              {
                v31 = 0;
              }
              -[PKDashboardTextActionItem setSubtitle:](v11, "setSubtitle:", v31);
              -[PKDashboardTextActionItem setSubtitleImage:](v11, "setSubtitleImage:", v35);
              -[PKDashboardTextActionItem setSubtitleColor:](v11, "setSubtitleColor:", v36);
              -[PKDashboardTextActionItem setAccessoryImage:](v11, "setAccessoryImage:", v25);
              -[PKDashboardTextActionItem setAccessoryColor:](v11, "setAccessoryColor:", v34);
              -[PKDashboardTextActionItem setLayoutStyle:](v11, "setLayoutStyle:", 1);

              goto LABEL_22;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          if (v14)
            continue;
          break;
        }
      }
LABEL_22:

    }
    else if (self->_merchant)
    {
      v11 = objc_alloc_init(PKDashboardTransactionMapItem);
      -[PKDashboardTextActionItem setMerchant:](v11, "setMerchant:", self->_merchant);
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    -[PKAuxiliaryPassInformationDataSource _headerItem](self, "_headerItem");
    v11 = (PKDashboardTextActionItem *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)setDataSourceDelegate:(id)a3
{
  id v4;

  v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  if (self->_contentIsLoaded)
    objc_msgSend(v4, "contentIsLoaded");

}

- (id)navigationBarTitle
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  -[PKMerchant displayName](self->_merchant, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PKPassAuxiliaryPassInformationItem title](self->_item, "title");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if (-[PKMerchant useDisplayNameIgnoringBrand](self->_merchant, "useDisplayNameIgnoringBrand"))
  {
    -[PKMerchant displayNameIgnoringBrand](self->_merchant, "displayNameIgnoringBrand");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (NSString)footerTitle
{
  return (NSString *)-[PKPassAuxiliaryPassInformationItem detailFooterLeadingTitle](self->_item, "detailFooterLeadingTitle");
}

- (NSString)footerText
{
  return (NSString *)-[PKPassAuxiliaryPassInformationItem detailFooterLeadingText](self->_item, "detailFooterLeadingText");
}

- (NSString)footerSecondaryText
{
  return (NSString *)-[PKPassAuxiliaryPassInformationItem detailFooterTrailingText](self->_item, "detailFooterTrailingText");
}

- (NSString)footerSecondaryTitle
{
  return (NSString *)-[PKPassAuxiliaryPassInformationItem detailFooterTrailingTitle](self->_item, "detailFooterTrailingTitle");
}

- (BOOL)_isDynamicSection:(int64_t)a3
{
  double v3;
  void *v4;
  BOOL v5;

  if (a3 < 1)
    return 0;
  v3 = (double)a3;
  -[PKPassAuxiliaryPassInformationItem sections](self->_item, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)(unint64_t)objc_msgSend(v4, "count") + 1.0 > v3;

  return v5;
}

- (id)_headerItem
{
  PKTransactionHistoryHeaderItem *v3;
  PKTransactionHistoryHeaderItem *v4;
  void *v5;

  v3 = -[PKTransactionHistoryHeaderItem initWithType:]([PKTransactionHistoryHeaderItem alloc], "initWithType:", 0);
  v4 = v3;
  if (self->_merchant)
  {
    -[PKTransactionHistoryHeaderItem setMerchant:](v3, "setMerchant:");
    -[PKTransactionHistoryHeaderItem setShowDetailedPropertyLocation:](v4, "setShowDetailedPropertyLocation:", 1);
  }
  else
  {
    -[PKPassAuxiliaryPassInformationItem title](self->_item, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionHistoryHeaderItem setTitle:](v4, "setTitle:", v5);

    -[PKTransactionHistoryHeaderItem setCategory:](v4, "setCategory:", -[PKPassAuxiliaryPassInformationItem merchantCategory](self->_item, "merchantCategory"));
  }
  return v4;
}

- (void)_loadMerchantForPassUniqueID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  PKPassAuxiliaryPassInformationItem *item;
  _QWORD v8[5];

  v4 = a3;
  -[PKPassAuxiliaryPassInformationItem mapsURL](self->_item, "mapsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D672B0]);
    item = self->_item;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__PKAuxiliaryPassInformationDataSource__loadMerchantForPassUniqueID___block_invoke;
    v8[3] = &unk_1E3E6A8D8;
    v8[4] = self;
    objc_msgSend(v6, "merchantForPassUniqueIdentifier:withAuxiliaryPassInformationItem:completion:", v4, item, v8);

  }
  else if (!self->_contentIsLoaded)
  {
    -[PKAuxiliaryPassInformationDataSource _notifyContentLoadedIfNecessary](self, "_notifyContentLoadedIfNecessary");
  }

}

void __69__PKAuxiliaryPassInformationDataSource__loadMerchantForPassUniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
  v4 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__PKAuxiliaryPassInformationDataSource__loadMerchantForPassUniqueID___block_invoke_2;
  v5[3] = &unk_1E3E61310;
  objc_copyWeak(&v6, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __69__PKAuxiliaryPassInformationDataSource__loadMerchantForPassUniqueID___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[8])
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_notifyContentLoadedIfNecessary");
    WeakRetained = v2;
  }

}

- (void)_notifyContentLoadedIfNecessary
{
  id WeakRetained;

  if (!self->_contentIsLoaded)
  {
    self->_contentIsLoaded = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "contentIsLoaded");

  }
}

- (PKPassAuxiliaryPassInformationItem)item
{
  return self->_item;
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (NSIndexPath)headerIndexPath
{
  return self->_headerIndexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerIndexPath, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
