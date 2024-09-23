@implementation PKPaymentMethodActionSectionController

- (PKPaymentMethodActionSectionController)initWithDelegate:(id)a3
{
  id v4;
  PKPaymentMethodActionSectionController *v5;
  PKPaymentMethodActionSectionController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentMethodActionSectionController;
  v5 = -[PKPaymentMethodActionSectionController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (id)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("actions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldHighlightItem:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;
  BOOL v7;

  objc_msgSend(a3, "identifier");
  v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v7 = v4 != CFSTR("addPaymentMethod")
    && (!v4
     || (v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("addPaymentMethod")), v5, !v6))
    || !self->_addInProgress;

  return v7;
}

- (void)didSelectItem:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == CFSTR("addPaymentMethod")
    || v5
    && (v7 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("addPaymentMethod")), v6, v7))
  {
    self->_addInProgress = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "deselectCells");

    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "reloadDataAnimated:", 1);

    objc_initWeak(&location, self);
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__PKPaymentMethodActionSectionController_didSelectItem___block_invoke;
    v11[3] = &unk_1E3E61310;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v10, "performedAddPaymentMethodWithCompletion:", v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __56__PKPaymentMethodActionSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKPaymentMethodActionSectionController_didSelectItem___block_invoke_2;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __56__PKPaymentMethodActionSectionController_didSelectItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 72) = 0;
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained((id *)WeakRetained + 8);
    objc_msgSend(v2, "reloadDataAnimated:", 1);

    WeakRetained = v3;
  }

}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v4;
  id v5;
  PKPaymentMethodSelectionItem *v6;
  void *v7;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = -[PKPaymentMethodSelectionItem initWithIdentifier:]([PKPaymentMethodSelectionItem alloc], "initWithIdentifier:", CFSTR("addPaymentMethod"));
  objc_msgSend(v5, "addObject:", v6);

  v7 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendItems:", v7);

  return v4;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_opt_class();
  v6 = (void *)MEMORY[0x1E0DC35C8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PKPaymentMethodActionSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E3E6EB78;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend(v6, "registrationWithCellClass:configurationHandler:", v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __66__PKPaymentMethodActionSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  __CFString *v9;
  __CFString *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v7, "identifier");
    v9 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 != CFSTR("addPaymentMethod"))
    {
      if (!v9
        || (v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("addPaymentMethod")),
            v10,
            !v11))
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("AUTO_RELOAD_ADD_PAYMENT_METHOD"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v13);

    objc_msgSend(v12, "textProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v16 + 72))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (*(_QWORD *)(v16 + 80))
      {
        objc_msgSend(v14, "setColor:");
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v17;
    objc_msgSend(v15, "setColor:", v17);

LABEL_10:
    objc_msgSend(v6, "setContentConfiguration:", v12);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 72))
    {
      +[PKCellAccessoryLoadingIndicator accessory](PKCellAccessoryLoadingIndicator, "accessory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAccessories:", v20);

    }
    else
    {
      objc_msgSend(v6, "setAccessories:", MEMORY[0x1E0C9AA60]);
    }

    goto LABEL_14;
  }
LABEL_15:

}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (void)setLinkTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_linkTextColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
