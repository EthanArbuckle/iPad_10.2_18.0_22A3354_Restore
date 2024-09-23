@implementation PKPassShareSelectDateSectionController

- (PKPassShareSelectDateSectionController)initWithDate:(id)a3 minimumDate:(id)a4 maximumDate:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKPassShareSelectDateSectionController *v15;
  PKPassShareSelectDateSectionController *v16;
  NSDate **p_date;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PKPassShareSelectDateSectionController;
  v15 = -[PKPassShareSectionController initWithIdentifiers:](&v19, sel_initWithIdentifiers_, &unk_1E3FAE788);
  v16 = v15;
  if (v15)
  {
    p_date = &v15->_date;
    objc_storeStrong((id *)&v15->_date, a3);
    objc_storeStrong((id *)&v16->_minimumDate, a4);
    objc_storeStrong((id *)&v16->_maximumDate, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    v16->_selected = *p_date != 0;
    -[PKPassShareSelectDateSectionController reloadItemsAnimated:](v16, "reloadItemsAnimated:", 0);
  }

  return v16;
}

- (void)reloadItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSDate *date;
  PKPassShareScheduleRowItem *v6;
  void *v7;
  PKPassShareScheduleRowItem *v8;
  PKPassShareScheduleRowItem *v9;
  void *v10;
  PKPassShareScheduleRowItem *v11;
  PKPassShareScheduleRowItem *v12;
  id WeakRetained;
  id v14;

  v3 = a3;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  date = self->_date;
  v6 = [PKPassShareScheduleRowItem alloc];
  PKLocalizedShareableCredentialString(CFSTR("SHARE_SCHEDULE_DATE_NEVER"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKPassShareScheduleRowItem initWithTitle:icon:](v6, "initWithTitle:icon:", v7, 0);

  -[PKPassShareScheduleRowItem setIdentifier:](v8, "setIdentifier:", CFSTR("StartDateRow"));
  -[PKPassShareScheduleRowItem setIsOn:](v8, "setIsOn:", date == 0);
  objc_msgSend(v14, "addObject:", v8);
  v9 = [PKPassShareScheduleRowItem alloc];
  PKLocalizedShareableCredentialString(CFSTR("SHARE_SCHEDULE_ON_DATE_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKPassShareScheduleRowItem initWithTitle:icon:](v9, "initWithTitle:icon:", v10, 0);

  -[PKPassShareScheduleRowItem setIdentifier:](v11, "setIdentifier:", CFSTR("EndDateRow"));
  -[PKPassShareScheduleRowItem setIsOn:](v11, "setIsOn:", date != 0);
  objc_msgSend(v14, "addObject:", v11);
  if (date)
  {
    v12 = -[PKPassShareScheduleRowItem initWithTitle:icon:]([PKPassShareScheduleRowItem alloc], "initWithTitle:icon:", 0, 0);
    -[PKPassShareScheduleRowItem setIdentifier:](v12, "setIdentifier:", CFSTR("CalendarRow"));
    objc_msgSend(v14, "addObject:", v12);

  }
  -[PKPaymentSetupListSectionController setItems:](self, "setItems:", v14);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadDataAnimated:", v3);

}

- (void)_setDate:(id)a3
{
  NSDate **p_date;
  id WeakRetained;
  id v7;

  p_date = &self->_date;
  v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_date, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didUpdateDate:", *p_date);

  }
}

- (void)_setSelected:(id)a3
{
  __CFString *v4;
  int v5;
  void *v6;
  __CFString *v7;

  objc_msgSend(a3, "identifier");
  v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4 == CFSTR("StartDateRow")
    || v4 && (v5 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("StartDateRow")), v7, v5))
  {
    -[PKPassShareSelectDateSectionController _setDate:](self, "_setDate:", 0);
  }
  else if (PKEqualObjects() && !self->_date)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareSelectDateSectionController _setDate:](self, "_setDate:", v6);

  }
  -[PKPassShareSelectDateSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 1);

}

- (id)cellRegistrationForItem:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  void *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "identifier");
  v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v5 == CFSTR("CalendarRow")
    || (v6 = v5) != 0
    && (v7 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("CalendarRow")),
        v6,
        v6,
        v7))
  {
    v8 = (void *)MEMORY[0x1E0DC35C8];
    v9 = objc_opt_class();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __66__PKPassShareSelectDateSectionController_cellRegistrationForItem___block_invoke;
    v18[3] = &unk_1E3E6C058;
    v10 = &v19;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v8, "registrationWithCellClass:configurationHandler:", v9, v18);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0DC35C8];
    v13 = objc_opt_class();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __66__PKPassShareSelectDateSectionController_cellRegistrationForItem___block_invoke_2;
    v16[3] = &unk_1E3E62748;
    v10 = &v17;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v12, "registrationWithCellClass:configurationHandler:", v13, v16);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return v14;
}

void __66__PKPassShareSelectDateSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v4, "setDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "decorateCalendarCell:", v4);
  }

}

void __66__PKPassShareSelectDateSectionController_cellRegistrationForItem___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a2;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = (id)objc_msgSend(WeakRetained, "decorateListCell:forScheduleRowItem:", v9, v6);

  }
}

- (void)didSelectItem:(id)a3
{
  id WeakRetained;

  -[PKPassShareSelectDateSectionController _setSelected:](self, "_setSelected:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "deselectCells");

}

- (void)decorateCalendarCell:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v6 = a3;
  objc_msgSend(v4, "secondarySystemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  objc_msgSend(v6, "setDate:", self->_date);
  objc_msgSend(v6, "setMinimumDate:", self->_minimumDate);
  objc_msgSend(v6, "setMaximumDate:", self->_maximumDate);

}

- (BOOL)shouldHighlightItem:(id)a3
{
  return objc_msgSend(a3, "isOn") ^ 1;
}

- (id)decorateListCell:(id)a3 forScheduleRowItem:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0DC39A8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "subtitleCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  v10 = objc_alloc_init(MEMORY[0x1E0DC3548]);
  objc_msgSend(v10, "setReservedLayoutWidth:", *MEMORY[0x1E0DC4890]);
  v11 = objc_msgSend(v6, "isOn");

  if ((v11 & 1) == 0)
    objc_msgSend(v10, "setHidden:", 1);
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessories:", v12);

  objc_msgSend(v7, "setConfigurationUpdateHandler:", &__block_literal_global_99);
  objc_msgSend(v7, "setContentConfiguration:", v8);

  return v8;
}

void __78__PKPassShareSelectDateSectionController_decorateListCell_forScheduleRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)dateSelectorCollectionViewCell:(id)a3 didUpdateDate:(id)a4
{
  -[PKPassShareSelectDateSectionController _setDate:](self, "_setDate:", a4);
}

- (PKPassShareSelectDateSectionControllerDelegate)delegate
{
  return (PKPassShareSelectDateSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_minimumDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
