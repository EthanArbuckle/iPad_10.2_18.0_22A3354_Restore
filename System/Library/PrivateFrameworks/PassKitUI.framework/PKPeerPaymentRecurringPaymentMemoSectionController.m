@implementation PKPeerPaymentRecurringPaymentMemoSectionController

- (PKPeerPaymentRecurringPaymentMemoSectionController)initWithRecurringPaymentMemo:(id)a3 contact:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPeerPaymentRecurringPaymentMemoSectionController *v11;
  PKPeerPaymentRecurringPaymentMemoSectionController *v12;
  uint64_t v13;
  UIColor *memoTextColor;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PKPeerPaymentRecurringPaymentMemoSectionController;
  v11 = -[PKPeerPaymentRecurringPaymentMemoSectionController init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = objc_claimAutoreleasedReturnValue();
    memoTextColor = v12->_memoTextColor;
    v12->_memoTextColor = (UIColor *)v13;

    PKLocalizedPeerPaymentRecurringString(CFSTR("DETAILS_MEMO_SECTION_HEADER"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicListSectionController setHeaderText:](v12, "setHeaderText:", v15);

    objc_msgSend(v9, "givenName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      PKLocalizedPeerPaymentRecurringString(CFSTR("DETAILS_MEMO_SECTION_FOOTER"), CFSTR("%@"), v16);
    else
      PKLocalizedPeerPaymentRecurringString(CFSTR("DETAILS_MEMO_SECTION_FOOTER_NO_NAME"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicListSectionController setFooterText:](v12, "setFooterText:", v17);

    if (!v8)
      v8 = objc_alloc_init(MEMORY[0x1E0D67458]);
    v18 = (void *)objc_msgSend(v8, "copy");
    -[PKPeerPaymentRecurringPaymentMemoSectionController _reloadItemWithMemo:animated:](v12, "_reloadItemWithMemo:animated:", v18, 0);

  }
  return v12;
}

- (void)_reloadItemWithMemo:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  PKPeerPaymentRecurringPaymentMemoRowItem *v7;
  PKPeerPaymentRecurringPaymentMemoRowItem *item;
  id WeakRetained;

  v4 = a4;
  v6 = a3;
  v7 = -[PKPeerPaymentRecurringPaymentMemoRowItem initWithIdentifier:isEditable:titleColor:]([PKPeerPaymentRecurringPaymentMemoRowItem alloc], "initWithIdentifier:isEditable:titleColor:", CFSTR("memo"), self->_isEditable, self->_memoTextColor);
  item = self->_item;
  self->_item = v7;

  -[PKPeerPaymentRecurringPaymentMemoRowItem setMemo:](self->_item, "setMemo:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadDataAnimated:", v4);

}

- (void)setRecurringPaymentMemo:(id)a3
{
  id v4;
  PKPeerPaymentRecurringPaymentMemoRowItem *v5;
  void *v6;
  PKPeerPaymentRecurringPaymentMemoRowItem *item;
  id v8;

  v4 = a3;
  v5 = -[PKPeerPaymentRecurringPaymentMemoRowItem initWithIdentifier:isEditable:titleColor:]([PKPeerPaymentRecurringPaymentMemoRowItem alloc], "initWithIdentifier:isEditable:titleColor:", CFSTR("memo"), self->_isEditable, self->_memoTextColor);
  v8 = (id)objc_msgSend(v4, "copy");

  objc_msgSend(v8, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v6);

  -[PKPeerPaymentRecurringPaymentMemoRowItem setMemo:](v5, "setMemo:", v8);
  item = self->_item;
  self->_item = v5;

}

- (void)setRecurringPaymentMemoWithTextSuggestion:(id)a3
{
  id v4;
  PKPeerPaymentRecurringPaymentMemoRowItem *v5;
  void *v6;
  void *v7;
  void *v8;
  PKPeerPaymentRecurringPaymentMemoRowItem *item;
  id v10;

  v4 = a3;
  v5 = -[PKPeerPaymentRecurringPaymentMemoRowItem initWithIdentifier:isEditable:titleColor:]([PKPeerPaymentRecurringPaymentMemoRowItem alloc], "initWithIdentifier:isEditable:titleColor:", CFSTR("memo"), self->_isEditable, self->_memoTextColor);
  v10 = (id)objc_msgSend(v4, "copy");

  objc_msgSend(v10, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentRecurringPaymentMemoRowItem setSuggestedText:](v5, "setSuggestedText:", v6);

  -[PKPeerPaymentRecurringPaymentMemoRowItem memo](self->_item, "memo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v8);

  -[PKPeerPaymentRecurringPaymentMemoRowItem setMemo:](v5, "setMemo:", v10);
  item = self->_item;
  self->_item = v5;

}

- (PKPeerPaymentRecurringPaymentMemo)recurringPaymentMemo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[PKPeerPaymentRecurringPaymentMemoRowItem memo](self->_item, "memo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[PKPeerPaymentRecurringPaymentMemoRowItem suggestedText](self->_item, "suggestedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {

  }
  else
  {
    v7 = objc_msgSend(v5, "length");

    if (v7)
      objc_msgSend(v4, "setText:", v5);
  }

  return (PKPeerPaymentRecurringPaymentMemo *)v4;
}

- (void)setIsEditable:(BOOL)a3
{
  id v4;

  if (self->_isEditable != a3)
  {
    self->_isEditable = a3;
    -[PKPeerPaymentRecurringPaymentMemoSectionController recurringPaymentMemo](self, "recurringPaymentMemo");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentMemoSectionController _reloadItemWithMemo:animated:](self, "_reloadItemWithMemo:animated:", v4, 1);

  }
}

- (void)setMemoTextColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UIColor isEqual:](self->_memoTextColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_memoTextColor, a3);
    -[PKPeerPaymentRecurringPaymentMemoSectionController recurringPaymentMemo](self, "recurringPaymentMemo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentMemoSectionController _reloadItemWithMemo:animated:](self, "_reloadItemWithMemo:animated:", v5, 1);

  }
}

- (void)requestBecomeFirstResponder
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "makeCellFirstResponderWithItem:", self->_item);

}

- (id)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("memo");
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
  void *v4;
  uint64_t v5;
  _QWORD v7[5];

  v4 = (void *)MEMORY[0x1E0DC35C8];
  v5 = objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__PKPeerPaymentRecurringPaymentMemoSectionController_cellRegistrationForItem___block_invoke;
  v7[3] = &unk_1E3E63B38;
  v7[4] = self;
  objc_msgSend(v4, "registrationWithCellClass:configurationHandler:", v5, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __78__PKPeerPaymentRecurringPaymentMemoSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setItem:", a4);
  objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));

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
  return 0;
}

- (void)memoIconWasTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "memoIconWasTapped");

}

- (void)memoTextWasUpdated:(id)a3
{
  PKPeerPaymentRecurringPaymentMemoRowItem *item;
  id v4;
  id v5;

  item = self->_item;
  v4 = a3;
  -[PKPeerPaymentRecurringPaymentMemoRowItem memo](item, "memo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (UIColor)memoTextColor
{
  return self->_memoTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoTextColor, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
