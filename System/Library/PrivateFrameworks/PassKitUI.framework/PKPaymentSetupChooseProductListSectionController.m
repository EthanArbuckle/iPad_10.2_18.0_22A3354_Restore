@implementation PKPaymentSetupChooseProductListSectionController

- (PKPaymentSetupChooseProductListSectionController)initWithImage:(id)a3 digitalIssuanceMetadata:(id)a4
{
  id v7;
  id v8;
  PKPaymentSetupChooseProductListSectionController *v9;
  PKPaymentSetupChooseProductListSectionController *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSetupChooseProductListSectionController;
  v9 = -[PKPaymentSetupChooseProductListSectionController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_digitalIssuanceMetadata, a4);
    objc_storeStrong((id *)&v10->_cardImage, a3);
    -[PKPaymentSetupChooseProductListSectionController _generateItems](v10, "_generateItems");
    objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_215);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupChooseProductListSectionController setCellRegistration:](v10, "setCellRegistration:", v11);

  }
  return v10;
}

void __90__PKPaymentSetupChooseProductListSectionController_initWithImage_digitalIssuanceMetadata___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1E0DC39A8];
  v7 = a4;
  objc_msgSend(v6, "subtitleCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(v7, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondaryText:", v10);

  objc_msgSend(v8, "secondaryTextProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColor:", v12);

  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 10.0, 10.0, 10.0);
  objc_msgSend(v5, "setContentConfiguration:", v8);
  objc_msgSend(v5, "setConfigurationUpdateHandler:", &__block_literal_global_113);
  LODWORD(v11) = objc_msgSend(v7, "loadingIndicatorVisible");

  if ((_DWORD)v11)
  {
    +[PKCellAccessoryLoadingIndicator accessory](PKCellAccessoryLoadingIndicator, "accessory");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    v14 = (id *)v17;
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x1E0DC3568]);
    v16 = v13;
    v14 = &v16;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessories:", v15);

}

void __90__PKPaymentSetupChooseProductListSectionController_initWithImage_digitalIssuanceMetadata___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)MEMORY[0x1E0DC34D8];
  v5 = a2;
  objc_msgSend(v4, "listGroupedCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isHighlighted") & 1) != 0 || (objc_msgSend(v9, "isSelected") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v5, "setBackgroundConfiguration:", v6);
}

- (void)_generateItems
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  PKPaymentSetupChooseProductListItem *v15;
  PKPaymentSetupChooseProductListItem *autoTopUpItem;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  PKPaymentSetupChooseProductListItem *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  PKPaymentSetupChooseProductListItem *v35;
  NSArray *v36;
  NSArray *balanceAndCommutePlansItems;
  void *v38;
  id v39;

  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPaymentDigitalIssuanceMetadata autoTopUpProduct](self->_digitalIssuanceMetadata, "autoTopUpProduct");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDigitalIssuanceMetadata serviceProviderProducts](self->_digitalIssuanceMetadata, "serviceProviderProducts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4)
  {
    objc_msgSend(v4, "localizedDisplayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      PKLocalizedPaymentString(CFSTR("AUTO_TOP_UP_TRANSIT_PRODUCT_DEFAULT_TITLE"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    objc_msgSend(v4, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      PKLocalizedPaymentString(CFSTR("AUTO_TOP_UP_TRANSIT_PRODUCT_DEFAULT_DESCRIPTION"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    v15 = -[PKPaymentSetupChooseProductListItem initWithIdentifier:type:title:subtitle:]([PKPaymentSetupChooseProductListItem alloc], "initWithIdentifier:type:title:subtitle:", CFSTR("AutoTopUpItemIdentifier"), 0, v10, v14);
    autoTopUpItem = self->_autoTopUpItem;
    self->_autoTopUpItem = v15;

    objc_msgSend(v3, "addObject:", CFSTR("AutoTopUpSectionIdentifier"));
  }
  -[PKPaymentDigitalIssuanceMetadata balanceIdentifier](self->_digitalIssuanceMetadata, "balanceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PKPaymentDigitalIssuanceMetadata balanceLocalizedDisplayName](self->_digitalIssuanceMetadata, "balanceLocalizedDisplayName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      PKLocalizedPaymentString(CFSTR("TICKET_PLATFORM_STORED_VALUE_DEFAULT_TITLE"));
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;

    -[PKPaymentDigitalIssuanceMetadata balanceLocalizedDescription](self->_digitalIssuanceMetadata, "balanceLocalizedDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      PKLocalizedPaymentString(CFSTR("TICKET_PLATFORM_STORED_VALUE_DEFAULT_DESCRIPTION"));
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;

    v26 = -[PKPaymentSetupChooseProductListItem initWithIdentifier:type:title:subtitle:]([PKPaymentSetupChooseProductListItem alloc], "initWithIdentifier:type:title:subtitle:", CFSTR("BalanceItemIdentifier"), 0, v21, v25);
    objc_msgSend(v39, "addObject:", v26);

  }
  if (v6)
  {
    -[PKPaymentDigitalIssuanceMetadata serviceProviderProductsLocalizedDisplayName](self->_digitalIssuanceMetadata, "serviceProviderProductsLocalizedDisplayName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v29 = v27;
    }
    else
    {
      PKLocalizedPaymentString(CFSTR("TICKET_PLATFORM_COMMUTE_PLANS_DEFAULT_TITLE"));
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v29;

    -[PKPaymentDigitalIssuanceMetadata serviceProviderProductsLocalizedDescription](self->_digitalIssuanceMetadata, "serviceProviderProductsLocalizedDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      v33 = v31;
    }
    else
    {
      PKLocalizedPaymentString(CFSTR("TICKET_PLATFORM_COMMUTE_PLANS_DEFAULT_DESCRIPTION"));
      v33 = (id)objc_claimAutoreleasedReturnValue();
    }
    v34 = v33;

    v35 = -[PKPaymentSetupChooseProductListItem initWithIdentifier:type:title:subtitle:]([PKPaymentSetupChooseProductListItem alloc], "initWithIdentifier:type:title:subtitle:", CFSTR("CommutePlansItemIdentifier"), 1, v30, v34);
    objc_msgSend(v39, "addObject:", v35);

  }
  if (objc_msgSend(v39, "count"))
  {
    v36 = (NSArray *)objc_msgSend(v39, "copy");
    balanceAndCommutePlansItems = self->_balanceAndCommutePlansItems;
    self->_balanceAndCommutePlansItems = v36;

    objc_msgSend(v3, "addObject:", CFSTR("BalanceAndCommutePlansSectionIdentifier"));
  }
  v38 = (void *)objc_msgSend(v3, "copy");
  -[PKDynamicListSectionController setIdentifiers:](self, "setIdentifiers:", v38);

}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("AutoTopUpSectionIdentifier")))
  {
    v9[0] = self->_autoTopUpItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItems:", v7);

  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("BalanceAndCommutePlansSectionIdentifier")))
  {
    objc_msgSend(v6, "appendItems:", self->_balanceAndCommutePlansItems);
  }

  return v6;
}

- (void)didSelectItem:(id)a3
{
  PKPaymentSetupChooseProductListSectionControllerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "didSelectPKPaymentSetupChooseProductListItem:", v4);

}

- (id)defaultListLayout
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  PKProvisioningBackgroundColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[PKPaymentSetupChooseProductListSectionController defaultListLayout](self, "defaultListLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PostpPaidSectionIdentifier")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("AutoTopUpSectionIdentifier")) && !self->_postPaidItem
    || objc_msgSend(v7, "isEqualToString:", CFSTR("BalanceAndCommutePlansSectionIdentifier"))
    && !self->_postPaidItem
    && !self->_autoTopUpItem)
  {
    objc_msgSend(v8, "setHeaderMode:", 1);
  }
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  UIImage *cardImage;
  id v6;
  void *v7;
  void *v8;
  id v9;

  cardImage = self->_cardImage;
  v6 = a3;
  PKLocalizedPaymentString(CFSTR("TRANSIT_CHOOSE_FARE_TYPE_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("TRANSIT_CHOOSE_FARE_TYPE_DESCRIPTION"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureWithUIImage:title:subtitle:", cardImage, v7, v8);

  PKProvisioningBackgroundColor();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v9);

}

- (void)showLoadingIndicatorsForItemIdentifier:(id)a3 show:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  id v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "deselectCells");

  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("AutoTopUpItemIdentifier")))
  {
    -[PKPaymentSetupChooseProductListItem setLoadingIndicatorVisible:](self->_autoTopUpItem, "setLoadingIndicatorVisible:", v4);
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "reloadItem:animated:", self->_autoTopUpItem, 1);

  }
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
  objc_storeStrong((id *)&self->cellRegistration, a3);
}

- (PKPaymentSetupChooseProductListSectionControllerDelegate)delegate
{
  return (PKPaymentSetupChooseProductListSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImage)cardImage
{
  return self->_cardImage;
}

- (void)setCardImage:(id)a3
{
  objc_storeStrong((id *)&self->_cardImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->cellRegistration, 0);
  objc_storeStrong((id *)&self->_digitalIssuanceMetadata, 0);
  objc_storeStrong((id *)&self->_balanceAndCommutePlansItems, 0);
  objc_storeStrong((id *)&self->_autoTopUpItem, 0);
  objc_storeStrong((id *)&self->_postPaidItem, 0);
}

@end
