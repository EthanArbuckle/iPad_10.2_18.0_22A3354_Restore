@implementation PKPeerPaymentRecurringPaymentDetailSectionController

- (PKPeerPaymentRecurringPaymentDetailSectionController)initWithRecurringPayment:(id)a3 productTimeZone:(id)a4 mode:(unint64_t)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPeerPaymentRecurringPaymentDetailSectionController *v13;
  PKPeerPaymentRecurringPaymentDetailSectionController *v14;
  id v15;
  uint64_t v16;
  NSCalendar *productCalendar;
  uint64_t v18;
  UIColor *titleColor;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentRecurringPaymentDetailSectionController;
  v13 = -[PKPeerPaymentRecurringPaymentDetailSectionController init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_showStartDateSelector = 0;
    v15 = objc_alloc(MEMORY[0x1E0C99D48]);
    v16 = objc_msgSend(v15, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    productCalendar = v14->_productCalendar;
    v14->_productCalendar = (NSCalendar *)v16;

    -[NSCalendar setTimeZone:](v14->_productCalendar, "setTimeZone:", v11);
    v14->_mode = a5;
    objc_storeWeak((id *)&v14->_delegate, v12);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v18 = objc_claimAutoreleasedReturnValue();
    titleColor = v14->_titleColor;
    v14->_titleColor = (UIColor *)v18;

    -[PKPeerPaymentRecurringPaymentDetailSectionController updateWithRecurringPayment:](v14, "updateWithRecurringPayment:", v10);
  }

  return v14;
}

- (void)reloadItemsAnimated:(BOOL)a3
{
  id v5;
  PKPeerPaymentRecurringPaymentAmountDetailRowItem *v6;
  void *v7;
  unint64_t mode;
  PKPeerPaymentRecurringPaymentDateDetailRowItem *v9;
  PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  PKPeerPaymentRecurringPaymentFrequencyDetailRowItem *v16;
  NSArray *v17;
  NSArray *rowItems;
  _QWORD v19[5];
  BOOL v20;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!self->_hideAmount)
  {
    v6 = -[PKPeerPaymentRecurringPaymentDetailRowItem initWithIdentifier:isEditable:titleColor:]([PKPeerPaymentRecurringPaymentAmountDetailRowItem alloc], "initWithIdentifier:isEditable:titleColor:", CFSTR("amount"), self->_isEditable, self->_titleColor);
    PKLocalizedPeerPaymentRecurringString(CFSTR("DETAILS_AMOUNT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentAmountDetailRowItem setTitle:](v6, "setTitle:", v7);

    -[PKPeerPaymentRecurringPaymentAmountDetailRowItem setCurrencyAmount:](v6, "setCurrencyAmount:", self->_amount);
    objc_msgSend(v5, "addObject:", v6);

  }
  mode = self->_mode;
  if (mode == 1 || mode == 2 && (self->_status | 2) == 3)
  {
    v9 = -[PKPeerPaymentRecurringPaymentDetailRowItem initWithIdentifier:isEditable:titleColor:]([PKPeerPaymentRecurringPaymentDateDetailRowItem alloc], "initWithIdentifier:isEditable:titleColor:", CFSTR("startDate"), self->_isEditable, self->_titleColor);
    -[PKPeerPaymentRecurringPaymentDateDetailRowItem setTitle:](v9, "setTitle:", self->_startDateTitle);
    -[PKPeerPaymentRecurringPaymentDateDetailRowItem setDate:](v9, "setDate:", self->_startDate);
    -[PKPeerPaymentRecurringPaymentDateDetailRowItem setIsSelected:](v9, "setIsSelected:", self->_showStartDateSelector);
    objc_msgSend(v5, "addObject:", v9);
    if (self->_showStartDateSelector)
    {
      v10 = -[PKPeerPaymentRecurringPaymentDetailRowItem initWithIdentifier:isEditable:titleColor:]([PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem alloc], "initWithIdentifier:isEditable:titleColor:", CFSTR("startDateSelector"), self->_isEditable, self->_titleColor);
      -[PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem setDate:](v10, "setDate:", self->_startDate);
      if ((PKPeerPaymentDisableRecurringDateRestrictions() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 4, 1, v11, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (self->_mode == 2)
        {
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "dateByAddingUnit:value:toDate:options:", 16, 1, v11, 0);
          v15 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v15 = v11;
        }
        -[PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem setMinimumDate:](v10, "setMinimumDate:", v15);
        -[PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem setMaximumDate:](v10, "setMaximumDate:", v13);

      }
      objc_msgSend(v5, "addObject:", v10);

    }
  }
  v16 = -[PKPeerPaymentRecurringPaymentDetailRowItem initWithIdentifier:isEditable:titleColor:]([PKPeerPaymentRecurringPaymentFrequencyDetailRowItem alloc], "initWithIdentifier:isEditable:titleColor:", CFSTR("frequency"), self->_isEditable, self->_titleColor);
  -[PKPeerPaymentRecurringPaymentFrequencyDetailRowItem setFrequency:](v16, "setFrequency:", self->_frequency);
  -[PKPeerPaymentRecurringPaymentFrequencyDetailRowItem setDate:](v16, "setDate:", self->_startDate);
  objc_msgSend(v5, "addObject:", v16);
  v17 = (NSArray *)objc_msgSend(v5, "copy");
  rowItems = self->_rowItems;
  self->_rowItems = v17;

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __76__PKPeerPaymentRecurringPaymentDetailSectionController_reloadItemsAnimated___block_invoke;
  v19[3] = &unk_1E3E64C10;
  v19[4] = self;
  v20 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v19);

}

void __76__PKPeerPaymentRecurringPaymentDetailSectionController_reloadItemsAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 152));
  objc_msgSend(WeakRetained, "updateFooterForSectionIdentifier:", CFSTR("detail"));

  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 152));
  objc_msgSend(v3, "reloadDataAnimated:", *(unsigned __int8 *)(a1 + 40));

}

- (id)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("detail");
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

- (id)cellRegistrationForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0DC35C8];
    v6 = objc_opt_class();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke;
    v23[3] = &unk_1E3E74A58;
    v7 = &v24;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v5, "registrationWithCellClass:configurationHandler:", v6, v23);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)MEMORY[0x1E0DC35C8];
      v10 = objc_opt_class();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_2;
      v21[3] = &unk_1E3E74A80;
      v7 = &v22;
      objc_copyWeak(&v22, &location);
      objc_msgSend(v9, "registrationWithCellClass:configurationHandler:", v10, v21);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)MEMORY[0x1E0DC35C8];
        v12 = objc_opt_class();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_3;
        v19[3] = &unk_1E3E74AA8;
        v7 = &v20;
        objc_copyWeak(&v20, &location);
        objc_msgSend(v11, "registrationWithCellClass:configurationHandler:", v12, v19);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = 0;
          goto LABEL_10;
        }
        v13 = (void *)MEMORY[0x1E0DC35C8];
        v14 = objc_opt_class();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_4;
        v17[3] = &unk_1E3E74AD0;
        v7 = &v18;
        objc_copyWeak(&v18, &location);
        v17[4] = self;
        objc_msgSend(v13, "registrationWithCellClass:configurationHandler:", v14, v17);
        v8 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v15 = (void *)v8;
  objc_destroyWeak(v7);
LABEL_10:
  objc_destroyWeak(&location);

  return v15;
}

void __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_decorateAmountListCell:forItem:", v7, v6);

}

void __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_decorateDateListCell:forItem:", v7, v6);

}

void __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_decorateDateSelectorListCell:forItem:", v7, v6);

}

void __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *WeakRetained;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v9, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v16 = WeakRetained[15];
      v12 = objc_msgSend(v9, "frequency");
      objc_msgSend(v9, "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v9, "isEditable");
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_5;
      v17[3] = &unk_1E3E6F7D8;
      objc_copyWeak(&v18, (id *)(a1 + 40));
      objc_msgSend(v7, "configureWithOptions:selectedFrequency:selectedDate:isEditable:titleColor:changeHandler:", v16, v12, v13, v14, v15, v17);

      objc_destroyWeak(&v18);
    }
  }

}

void __80__PKPeerPaymentRecurringPaymentDetailSectionController_cellRegistrationForItem___block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  uint64_t v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = PKPeerPaymentRecurringPaymentFrequencyFromString();

  objc_msgSend(WeakRetained, "_handleFrequencyChanged:", v4);
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

- (void)didSelectItem:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;
  id WeakRetained;

  objc_msgSend(a3, "identifier");
  v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v4 == CFSTR("startDate")
    || (v5 = v4) != 0
    && (v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("startDate")),
        v5,
        v5,
        v6))
  {
    -[PKPeerPaymentRecurringPaymentDetailSectionController _toggleShowStartDateSelector](self, "_toggleShowStartDateSelector");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "deselectCells");

}

- (BOOL)shouldHighlightItem:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  int v5;

  if (self->_isEditable)
  {
    objc_msgSend(a3, "identifier");
    v3 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 == CFSTR("frequency"))
    {
      LOBYTE(v5) = 0;
    }
    else if (v3)
    {
      v5 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("frequency")) ^ 1;
    }
    else
    {
      LOBYTE(v5) = 1;
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setIsEditable:(BOOL)a3
{
  if (self->_isEditable != a3)
  {
    self->_isEditable = a3;
    if (!a3)
      self->_showStartDateSelector = 0;
    -[PKPeerPaymentRecurringPaymentDetailSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 1);
  }
}

- (void)setStatus:(unint64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    -[PKPeerPaymentRecurringPaymentDetailSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 1);
  }
}

- (void)setHideAmount:(BOOL)a3
{
  if (self->_hideAmount != a3)
  {
    self->_hideAmount = a3;
    -[PKPeerPaymentRecurringPaymentDetailSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 1);
  }
}

- (void)setTitleColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_titleColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, a3);
    -[PKPeerPaymentRecurringPaymentDetailSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 1);
  }

}

- (void)updateWithRecurringPayment:(id)a3
{
  void *v4;
  void *v5;
  PKCurrencyAmount *v6;
  PKCurrencyAmount *amount;
  NSDate *v8;
  NSDate *startDate;
  __CFString *v10;
  NSString *v11;
  NSString *startDateTitle;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountMake();
  v6 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
  amount = self->_amount;
  self->_amount = v6;

  objc_msgSend(v15, "startDate");
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  self->_startDate = v8;

  self->_frequency = objc_msgSend(v15, "frequency");
  self->_status = objc_msgSend(v15, "status");
  if (self->_mode == 2)
    v10 = CFSTR("DETAILS_NEXT_PAYMENT");
  else
    v10 = CFSTR("DETAILS_START_DATE");
  PKLocalizedPeerPaymentRecurringString(&v10->isa);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  startDateTitle = self->_startDateTitle;
  self->_startDateTitle = v11;

  objc_msgSend(v15, "upcomingPaymentDates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_storeStrong((id *)&self->_startDate, v14);
  -[PKPeerPaymentRecurringPaymentDetailSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 1);

}

- (void)_decorateAmountListCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v8);

  objc_msgSend(v6, "currencyAmount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrencyAmount:", v9);

  objc_msgSend(v7, "setIsEditable:", objc_msgSend(v6, "isEditable"));
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v6, "titleColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTitleColor:", v10);
}

- (void)_decorateDateListCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKContinuousButton *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int64x2_t v24;
  int64x2_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(v8, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColor:", v11);

  objc_msgSend(v7, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEditable"))
  {
    v23 = 0x401C000000000000;
    v24 = vdupq_n_s64(1uLL);
    v25 = vdupq_n_s64(2uLL);
    v13 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v23);
    v14 = v12;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    PKMediumDateString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContinuousButton setTitle:forState:](v13, "setTitle:forState:", v15, 0);

    if (v12)
    {
      if (-[NSCalendar isDateInToday:](self->_productCalendar, "isDateInToday:", v12))
        PKLocalizedPeerPaymentRecurringString(CFSTR("DETAILS_START_DATE_VALUE_TODAY"));
      else
        PKMediumDateString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKContinuousButton setTitle:forState:](v13, "setTitle:forState:", v16, 0);
    }
    else
    {

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PKMediumDateString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKContinuousButton setTitle:forState:](v13, "setTitle:forState:", v17, 0);

    }
    if ((objc_msgSend(v7, "isSelected") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContinuousButton updateTitleColorWithColor:](v13, "updateTitleColorWithColor:", v18);

    v19 = (void *)objc_msgSend(MEMORY[0x1E0DC3520], "pkui_createPlainButtonConfiguration");
    objc_msgSend(v19, "setContentInsets:", 6.0, 12.0, 6.0, 12.0);
    objc_msgSend(v19, "setTitleAlignment:", 2);
    -[PKContinuousButton setConfiguration:](v13, "setConfiguration:", v19);
    -[PKContinuousButton addTarget:action:forControlEvents:](v13, "addTarget:action:forControlEvents:", self, sel__didTapDateButton_, 64);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v13, 1);
    v26[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessories:", v21);

  }
  else if (v12)
  {
    if (-[NSCalendar isDateInToday:](self->_productCalendar, "isDateInToday:", v12))
      PKLocalizedPeerPaymentRecurringString(CFSTR("DETAILS_START_DATE_VALUE_TODAY"));
    else
      PKMediumDateString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSecondaryText:", v22);
    objc_msgSend(v6, "setAccessories:", MEMORY[0x1E0C9AA60]);

  }
  objc_msgSend(v6, "setContentConfiguration:", v8);

}

- (void)_decorateDateSelectorListCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v11, "setDate:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDate:", v8);

  }
  objc_msgSend(v6, "minimumDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMinimumDate:", v9);

  objc_msgSend(v6, "maximumDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setMaximumDate:", v10);
  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v11, "setContentAlignment:", *MEMORY[0x1E0D69C40]);

}

- (void)_toggleShowStartDateSelector
{
  _QWORD block[5];

  if (self->_isEditable)
  {
    self->_showStartDateSelector ^= 1u;
    -[PKPeerPaymentRecurringPaymentDetailSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 1);
    if (self->_showStartDateSelector)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __84__PKPeerPaymentRecurringPaymentDetailSectionController__toggleShowStartDateSelector__block_invoke;
      block[3] = &unk_1E3E612E8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

void __84__PKPeerPaymentRecurringPaymentDetailSectionController__toggleShowStartDateSelector__block_invoke(uint64_t a1)
{
  id WeakRetained;
  PKPeerPaymentRecurringPaymentDetailRowItem *v3;

  v3 = -[PKPeerPaymentRecurringPaymentDetailRowItem initWithIdentifier:isEditable:titleColor:]([PKPeerPaymentRecurringPaymentDetailRowItem alloc], "initWithIdentifier:isEditable:titleColor:", CFSTR("startDateSelector"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 152));
  objc_msgSend(WeakRetained, "makeCellFirstResponderWithItem:", v3);

}

- (void)_handleFrequencyChanged:(unint64_t)a3
{
  if (self->_frequency != a3)
  {
    self->_frequency = a3;
    -[PKPeerPaymentRecurringPaymentDetailSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 1);
  }
}

- (void)amountDidChange:(id)a3
{
  id v4;
  PKCurrencyAmount *amount;
  void *v6;
  char v7;
  id WeakRetained;
  id v9;

  v4 = a3;
  amount = self->_amount;
  v9 = v4;
  if (!amount)
    goto LABEL_4;
  -[PKCurrencyAmount amount](amount, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "pk_isEqualToDecimalNumber:", v9);

  if ((v7 & 1) == 0)
  {
    amount = self->_amount;
    v4 = v9;
LABEL_4:
    -[PKCurrencyAmount setAmount:](amount, "setAmount:", v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "amountDidChange");

  }
}

- (void)dateSelectorCollectionViewCell:(id)a3 didUpdateDate:(id)a4
{
  NSDate *v6;
  NSDate *v7;

  v6 = (NSDate *)a4;
  if (self->_startDate != v6)
  {
    v7 = v6;
    objc_storeStrong((id *)&self->_startDate, a4);
    -[PKPeerPaymentRecurringPaymentDetailSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 0);
    v6 = v7;
  }

}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (NSArray)frequencyOptions
{
  return self->_frequencyOptions;
}

- (void)setFrequencyOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (unint64_t)status
{
  return self->_status;
}

- (PKPeerPaymentRecurringPaymentDetailSectionControllerDelegate)delegate
{
  return (PKPeerPaymentRecurringPaymentDetailSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (BOOL)hideAmount
{
  return self->_hideAmount;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_frequencyOptions, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_productCalendar, 0);
  objc_storeStrong((id *)&self->_startDateTitle, 0);
  objc_storeStrong((id *)&self->_rowItems, 0);
}

@end
