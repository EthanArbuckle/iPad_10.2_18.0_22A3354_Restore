@implementation PKPeerPaymentRecurringPaymentDetailAmountSectionController

- (PKPeerPaymentRecurringPaymentDetailAmountSectionController)initWithAmount:(id)a3 currency:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPeerPaymentRecurringPaymentDetailAmountSectionController *v11;
  PKPeerPaymentRecurringPaymentAmountDetailRowItem *v12;
  PKPeerPaymentRecurringPaymentAmountDetailRowItem *item;
  PKPeerPaymentRecurringPaymentAmountDetailRowItem *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPeerPaymentRecurringPaymentDetailAmountSectionController;
  v11 = -[PKPeerPaymentRecurringPaymentDetailAmountSectionController init](&v17, sel_init);
  if (v11)
  {
    v12 = -[PKPeerPaymentRecurringPaymentDetailRowItem initWithIdentifier:isEditable:titleColor:]([PKPeerPaymentRecurringPaymentAmountDetailRowItem alloc], "initWithIdentifier:isEditable:titleColor:", CFSTR("chiseledAmount"), 0, 0);
    item = v11->_item;
    v11->_item = v12;

    v14 = v11->_item;
    PKCurrencyAmountMake();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentAmountDetailRowItem setCurrencyAmount:](v14, "setCurrencyAmount:", v15);

    objc_storeWeak((id *)&v11->_delegate, v10);
  }

  return v11;
}

- (id)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("chiseledAmount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v8[0] = self->_item;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendItems:", v6);

  return v5;
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
  v9[2] = __86__PKPeerPaymentRecurringPaymentDetailAmountSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E3E64DE8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "registrationWithCellClass:configurationHandler:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __86__PKPeerPaymentRecurringPaymentDetailAmountSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_decorateListCell:forItem:", v7, v6);

}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0DC35A8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithAppearance:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)didSelectItem:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didSelectAmountSection");

}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 1;
}

- (void)_decorateListCell:(id)a3 forItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "defaultBackgroundConfiguration");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v7);

  objc_msgSend(v6, "setBackgroundConfiguration:", v16);
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currencyAmount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "minimalFormattedStringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  if (objc_msgSend(v6, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    v11 = 100.0;
  else
    v11 = 80.0;
  objc_msgSend(v8, "textProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "pk_peerPaymentChiseledCashFontOfSize:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pk_fixedWidthFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v14);

  +[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setColor:", v15);

  objc_msgSend(v12, "setAlignment:", 1);
  objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v6, "setContentConfiguration:", v8);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
