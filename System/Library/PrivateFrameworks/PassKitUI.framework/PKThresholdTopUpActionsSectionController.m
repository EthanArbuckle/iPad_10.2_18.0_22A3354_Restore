@implementation PKThresholdTopUpActionsSectionController

- (PKThresholdTopUpActionsSectionController)initWithExistingThresholdTopUp:(BOOL)a3 delegate:(id)a4
{
  id v6;
  PKThresholdTopUpActionsSectionController *v7;
  PKThresholdTopUpActionsSectionController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PKThresholdTopUpActionsSectionController;
  v7 = -[PKThresholdTopUpActionsSectionController init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_existingThresholdTopUp = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (void)setCancelTitle:(id)a3
{
  id WeakRetained;

  objc_storeStrong((id *)&self->_cancelTitle, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadDataAnimated:", 1);

}

- (NSArray)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("thresholdActions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
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
  v7 = v4 != CFSTR("cancel")
    && (!v4 || (v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("cancel")), v5, !v6))
    || !self->_cancelInProgress;

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
  if (v5 == CFSTR("cancel")
    || v5 && (v7 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("cancel")), v6, v7))
  {
    self->_cancelInProgress = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "deselectCells");

    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "reloadDataAnimated:", 1);

    objc_initWeak(&location, self);
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__PKThresholdTopUpActionsSectionController_didSelectItem___block_invoke;
    v11[3] = &unk_1E3E61C58;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v10, "performedCancelWithCompletion:", v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __58__PKThresholdTopUpActionsSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PKThresholdTopUpActionsSectionController_didSelectItem___block_invoke_2;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __58__PKThresholdTopUpActionsSectionController_didSelectItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 24) = 0;
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained((id *)WeakRetained + 2);
    objc_msgSend(v2, "reloadDataAnimated:", 1);

    WeakRetained = v3;
  }

}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  id v10;
  PKThresholdTopUpActionItem *v11;
  void *v12;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == CFSTR("thresholdActions")
    || v7
    && (v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("thresholdActions")), v8, v9))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (self->_existingThresholdTopUp && -[NSString length](self->_cancelTitle, "length"))
    {
      v11 = -[PKThresholdTopUpActionItem initWithIdentifier:]([PKThresholdTopUpActionItem alloc], "initWithIdentifier:", CFSTR("cancel"));
      objc_msgSend(v10, "addObject:", v11);

    }
    v12 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v6, "appendItems:", v12);

  }
  return v6;
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
  v9[2] = __68__PKThresholdTopUpActionsSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E3E748D8;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend(v6, "registrationWithCellClass:configurationHandler:", v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __68__PKThresholdTopUpActionsSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v7, "identifier");
    v9 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 == CFSTR("cancel")
      || v9 && (v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("cancel")), v10, v11))
    {
      objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
      objc_msgSend(v12, "textProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setColor:", v14);

      objc_msgSend(v6, "setContentConfiguration:", v12);
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
      {
        +[PKCellAccessoryLoadingIndicator accessory](PKCellAccessoryLoadingIndicator, "accessory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setAccessories:", v16);

      }
      else
      {
        objc_msgSend(v6, "setAccessories:", MEMORY[0x1E0C9AA60]);
      }

    }
  }

}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0DC35A8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithAppearance:", 2);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)cancelTitle
{
  return self->_cancelTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
