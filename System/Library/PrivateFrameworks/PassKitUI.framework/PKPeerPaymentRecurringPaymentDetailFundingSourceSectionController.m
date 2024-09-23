@implementation PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController

- (PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController)initWithFundingSource:(id)a3 useAppleCashBalance:(BOOL)a4 delegate:(id)a5
{
  id v9;
  id v10;
  PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController *v11;
  PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController *v12;
  uint64_t v13;
  UIColor *titleColor;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, void *);
  void *v22;
  id v23;
  id location;
  objc_super v25;

  v9 = a3;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController;
  v11 = -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController init](&v25, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fundingSource, a3);
    v12->_useAppleCashBalance = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = objc_claimAutoreleasedReturnValue();
    titleColor = v12->_titleColor;
    v12->_titleColor = (UIColor *)v13;

    objc_initWeak(&location, v12);
    v15 = (void *)MEMORY[0x1E0DC35C8];
    v16 = objc_opt_class();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __120__PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController_initWithFundingSource_useAppleCashBalance_delegate___block_invoke;
    v22 = &unk_1E3E62748;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v15, "registrationWithCellClass:configurationHandler:", v16, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController setCellRegistration:](v12, "setCellRegistration:", v17, v19, v20, v21, v22);

    -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController reloadItemsAnimated:](v12, "reloadItemsAnimated:", 0);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __120__PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController_initWithFundingSource_useAppleCashBalance_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
  void *v5;
  PKPeerPaymentRecurringPaymentFundingSourceDetailRowItem *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *rowItems;
  _QWORD v12[5];
  BOOL v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPeerPaymentRecurringPaymentDetailRowItem initWithIdentifier:isEditable:titleColor:]([PKPeerPaymentRecurringPaymentFundingSourceDetailRowItem alloc], "initWithIdentifier:isEditable:titleColor:", CFSTR("fundingSourceItem"), self->_isEditable, self->_titleColor);
  PKLocalizedPeerPaymentRecurringString(CFSTR("DETAILS_FUNDING_SOURCE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentRecurringPaymentFundingSourceDetailRowItem setTitle:](v6, "setTitle:", v7);

  if (self->_useAppleCashBalance)
  {
    PKLocalizedPeerPaymentRecurringString(CFSTR("DETAILS_MULTIPLE_FUNDING_SOURCES"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentFundingSourceDetailRowItem setName:](v6, "setName:", v8);

    PKLocalizedPeerPaymentRecurringString(CFSTR("DETAILS_FUNDING_SOURCE_FOOTER"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicListSectionController setFooterText:](self, "setFooterText:", v9);

  }
  else
  {
    -[PKPeerPaymentRecurringPaymentFundingSourceDetailRowItem setName:](v6, "setName:", self->_fundingSource);
    -[PKDynamicListSectionController setFooterText:](self, "setFooterText:", 0);
  }
  objc_msgSend(v5, "addObject:", v6);
  v10 = (NSArray *)objc_msgSend(v5, "copy");
  rowItems = self->_rowItems;
  self->_rowItems = v10;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89__PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController_reloadItemsAnimated___block_invoke;
  v12[3] = &unk_1E3E64C10;
  v12[4] = self;
  v13 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __89__PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController_reloadItemsAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "reloadDataAnimated:", *(unsigned __int8 *)(a1 + 40));

}

- (id)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("fundingSourceSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  objc_msgSend(v5, "appendItems:", self->_rowItems);
  return v5;
}

- (void)didSelectItem:(id)a3
{
  id WeakRetained;
  id v5;

  if (self->_isEditable)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "fundingSourceSectionSelected");

  }
  v5 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v5, "deselectCells");

}

- (BOOL)shouldHighlightItem:(id)a3
{
  return self->_isEditable;
}

- (void)setFundingSource:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_fundingSource, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_fundingSource, a3);
    -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 1);
  }

}

- (void)setUseAppleCashBalance:(BOOL)a3
{
  if (self->_useAppleCashBalance != a3)
  {
    self->_useAppleCashBalance = a3;
    -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 1);
  }
}

- (void)setIsEditable:(BOOL)a3
{
  if (self->_isEditable != a3)
  {
    self->_isEditable = a3;
    -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 1);
  }
}

- (void)setTitleColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_titleColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, a3);
    -[PKPeerPaymentRecurringPaymentDetailFundingSourceSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 1);
  }

}

- (void)_decorateListCell:(id)a3 forItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  objc_msgSend(v6, "textProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLineBreakMode:", 0);
  objc_msgSend(v5, "titleColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v9);

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v6, "setSecondaryText:", v11);
    objc_msgSend(v6, "setPrefersSideBySideTextAndSecondaryText:", 1);
    objc_msgSend(v6, "secondaryTextProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfLines:", 1);

    objc_msgSend(v6, "secondaryTextProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLineBreakMode:", 5);

  }
  objc_msgSend(v15, "setContentConfiguration:", v6);
  if (objc_msgSend(v5, "isEditable"))
  {
    v14 = objc_alloc_init(MEMORY[0x1E0DC3568]);
    objc_msgSend(v10, "addObject:", v14);

  }
  objc_msgSend(v15, "setAccessories:", v10);

}

- (id)cellRegistration
{
  return self->cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
  objc_storeStrong((id *)&self->cellRegistration, a3);
}

- (NSString)fundingSource
{
  return self->_fundingSource;
}

- (BOOL)useAppleCashBalance
{
  return self->_useAppleCashBalance;
}

- (PKPeerPaymentRecurringPaymentDetailFundingSourceSectionControllerDelegate)delegate
{
  return (PKPeerPaymentRecurringPaymentDetailFundingSourceSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->cellRegistration, 0);
  objc_storeStrong((id *)&self->_rowItems, 0);
}

@end
