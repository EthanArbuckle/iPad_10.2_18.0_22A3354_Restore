@implementation PKPeerPaymentRecurringPaymentDetailActionSectionController

- (PKPeerPaymentRecurringPaymentDetailActionSectionController)initWithAction:(unint64_t)a3 delegate:(id)a4
{
  id v6;
  PKPeerPaymentRecurringPaymentDetailActionSectionController *v7;
  PKPeerPaymentRecurringPaymentDetailActionSectionController *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, void *);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKPeerPaymentRecurringPaymentDetailActionSectionController;
  v7 = -[PKPeerPaymentRecurringPaymentDetailActionSectionController init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_action = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    objc_initWeak(&location, v8);
    v9 = (void *)MEMORY[0x1E0DC35C8];
    v10 = objc_opt_class();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __86__PKPeerPaymentRecurringPaymentDetailActionSectionController_initWithAction_delegate___block_invoke;
    v16 = &unk_1E3E62748;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v9, "registrationWithCellClass:configurationHandler:", v10, &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentDetailActionSectionController setCellRegistration:](v8, "setCellRegistration:", v11, v13, v14, v15, v16);

    -[PKPeerPaymentRecurringPaymentDetailActionSectionController reloadItemsAnimated:](v8, "reloadItemsAnimated:", 0);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __86__PKPeerPaymentRecurringPaymentDetailActionSectionController_initWithAction_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a2;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_decorateListCell:forItem:", v8, v6);

  }
}

- (void)reloadItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t action;
  PKPeerPaymentRecurringPaymentActionRowItem *v6;
  unint64_t v7;
  void *v8;
  PKPeerPaymentRecurringPaymentActionRowItem *v9;
  void *v10;
  NSArray *v11;
  NSArray *rowItems;
  PKPeerPaymentRecurringPaymentDetailActionSectionControllerDelegate **p_delegate;
  id WeakRetained;
  void *v15;
  id v16;
  id v17;

  v3 = a3;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  action = self->_action;
  if ((action & 1) != 0)
  {
    v6 = -[PKPeerPaymentRecurringPaymentDetailRowItem initWithIdentifier:isEditable:titleColor:]([PKPeerPaymentRecurringPaymentActionRowItem alloc], "initWithIdentifier:isEditable:titleColor:", CFSTR("pause"), 0, 0);
    v7 = self->_status - 1;
    if (v7 <= 3)
    {
      PKLocalizedPeerPaymentRecurringString(&off_1E3E68238[v7]->isa);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentRecurringPaymentActionRowItem setTitle:](v6, "setTitle:", v8);

    }
    -[PKPeerPaymentRecurringPaymentActionRowItem setAction:](v6, "setAction:", 1);
    -[PKPeerPaymentRecurringPaymentActionRowItem setActionInProgress:](v6, "setActionInProgress:", self->_actionInProgress);
    objc_msgSend(v17, "addObject:", v6);

    action = self->_action;
  }
  if ((action & 2) != 0)
  {
    v9 = -[PKPeerPaymentRecurringPaymentDetailRowItem initWithIdentifier:isEditable:titleColor:]([PKPeerPaymentRecurringPaymentActionRowItem alloc], "initWithIdentifier:isEditable:titleColor:", CFSTR("cancel"), 0, 0);
    PKLocalizedPeerPaymentRecurringString(CFSTR("ACTION_CANCEL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentActionRowItem setTitle:](v9, "setTitle:", v10);

    -[PKPeerPaymentRecurringPaymentActionRowItem setAction:](v9, "setAction:", 2);
    -[PKPeerPaymentRecurringPaymentActionRowItem setActionInProgress:](v9, "setActionInProgress:", self->_actionInProgress);
    objc_msgSend(v17, "addObject:", v9);

  }
  v11 = (NSArray *)objc_msgSend(v17, "copy");
  rowItems = self->_rowItems;
  self->_rowItems = v11;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[PKPeerPaymentRecurringPaymentDetailActionSectionController _actionSectionIdentifier](self, "_actionSectionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "updateFooterForSectionIdentifier:", v15);

  v16 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v16, "reloadDataAnimated:", v3);

}

- (id)identifiers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[PKPeerPaymentRecurringPaymentDetailActionSectionController _actionSectionIdentifier](self, "_actionSectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_actionSectionIdentifier
{
  unint64_t action;
  __CFString *v3;
  uint64_t v5;

  action = self->_action;
  if ((action & 1) == 0)
  {
    v3 = CFSTR("action");
    if ((action & 2) == 0)
      return v3;
    goto LABEL_5;
  }
  objc_msgSend(CFSTR("action"), "stringByAppendingFormat:", CFSTR("-%@"), CFSTR("pause"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((self->_action & 2) != 0)
  {
LABEL_5:
    -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR("-%@"), CFSTR("cancel"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v5;
  }
  return v3;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  objc_msgSend(v5, "appendItems:", self->_rowItems);
  return v5;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  -[PKDynamicListSectionController headerText](self, "headerText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    -[PKDynamicListSectionController attributedHeaderText](self, "attributedHeaderText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_5;
  }
  objc_msgSend(v6, "setHeaderMode:", 1);
LABEL_5:
  -[PKDynamicListSectionController footerText](self, "footerText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_8:
    objc_msgSend(v6, "setFooterMode:", 1);
    goto LABEL_9;
  }
  -[PKDynamicListSectionController attributedFooterText](self, "attributedFooterText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_8;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v6, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return !self->_actionInProgress;
}

- (void)didSelectItem:(id)a3
{
  PKPeerPaymentRecurringPaymentDetailActionSectionControllerDelegate **p_delegate;
  id WeakRetained;
  unint64_t action;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  action = self->_action;
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke;
  v9[3] = &unk_1E3E612E8;
  v9[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke_3;
  v8[3] = &unk_1E3E612E8;
  objc_msgSend(WeakRetained, "performAction:startHandler:completion:", action, v9, v8);

  v7 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v7, "deselectCells");

}

void __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke_2;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "reloadItemsAnimated:", 1);
}

void __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke_4;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __76__PKPeerPaymentRecurringPaymentDetailActionSectionController_didSelectItem___block_invoke_4(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "reloadItemsAnimated:", 1);
}

- (void)setStatus:(unint64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    -[PKPeerPaymentRecurringPaymentDetailActionSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 1);
  }
}

- (void)_decorateListCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC39A8];
  v8 = a3;
  objc_msgSend(v7, "valueCellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("cancel"));

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  objc_msgSend(v6, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v14);

  objc_msgSend(v9, "textProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setColor:", v10);

  if (objc_msgSend(v6, "actionInProgress"))
  {
    -[PKPeerPaymentRecurringPaymentDetailActionSectionController _spinnerAccessory](self, "_spinnerAccessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessories:", v17);

  }
  else
  {
    objc_msgSend(v8, "setAccessories:", MEMORY[0x1E0C9AA60]);
  }
  objc_msgSend(v8, "setContentConfiguration:", v9);

}

- (id)_spinnerAccessory
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3438]);
  objc_msgSend(v2, "startAnimating");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v2, 1);

  return v3;
}

- (id)cellRegistration
{
  return self->cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
  objc_storeStrong((id *)&self->cellRegistration, a3);
}

- (unint64_t)status
{
  return self->_status;
}

- (PKPeerPaymentRecurringPaymentDetailActionSectionControllerDelegate)delegate
{
  return (PKPeerPaymentRecurringPaymentDetailActionSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->cellRegistration, 0);
  objc_storeStrong((id *)&self->_rowItems, 0);
}

@end
