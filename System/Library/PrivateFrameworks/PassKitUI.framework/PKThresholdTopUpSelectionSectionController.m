@implementation PKThresholdTopUpSelectionSectionController

- (PKThresholdTopUpSelectionSectionController)initWithAmountSuggestions:(id)a3 selectedAmount:(id)a4 thresholdSuggestions:(id)a5 selectedThreshold:(id)a6 currencyCode:(id)a7 paymentMethodName:(id)a8 paymentMethodIdentifier:(id)a9 viewStyle:(int64_t)a10 delegate:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  PKThresholdTopUpSelectionSectionController *v25;
  PKThresholdTopUpSelectionSectionController *v26;
  NSDecimalNumber *v27;
  NSDecimalNumber *currentAmount;
  NSDecimalNumber *v29;
  NSDecimalNumber *currentThreshold;
  id obj;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v18 = a3;
  v19 = a4;
  obj = a5;
  v20 = a5;
  v21 = a6;
  v35 = a7;
  v33 = a8;
  v22 = a8;
  v23 = v21;
  v34 = a9;
  v24 = a11;
  v36.receiver = self;
  v36.super_class = (Class)PKThresholdTopUpSelectionSectionController;
  v25 = -[PKThresholdTopUpSelectionSectionController init](&v36, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_amountSuggestions, a3);
    objc_storeStrong((id *)&v26->_thresholdSuggestions, obj);
    objc_storeStrong((id *)&v26->_currencyCode, a7);
    v26->_amountIsExpanded = 1;
    *(_WORD *)&v26->_enabled = 257;
    objc_storeWeak((id *)&v26->_delegate, v24);
    if (v19)
    {
      v27 = (NSDecimalNumber *)v19;
    }
    else
    {
      objc_msgSend(v18, "firstObject");
      v27 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    currentAmount = v26->_currentAmount;
    v26->_currentAmount = v27;

    objc_storeStrong((id *)&v26->_originalAmount, v26->_currentAmount);
    if (v23)
    {
      v29 = v23;
    }
    else
    {
      objc_msgSend(v20, "firstObject");
      v29 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    currentThreshold = v26->_currentThreshold;
    v26->_currentThreshold = v29;

    objc_storeStrong((id *)&v26->_originalThreshold, v26->_currentThreshold);
    objc_storeStrong((id *)&v26->_currentPaymentMethodName, v33);
    objc_storeStrong((id *)&v26->_originalPaymentMethodName, v26->_currentPaymentMethodName);
    objc_storeStrong((id *)&v26->_currentPaymentMethodIdentifier, a9);
    objc_storeStrong((id *)&v26->_originalPaymentMethodIdentifier, v26->_currentPaymentMethodIdentifier);
    v26->_viewStyle = a10;
  }

  return v26;
}

- (void)setEditing:(BOOL)a3
{
  id WeakRetained;

  self->_editing = a3;
  if (!a3)
  {
    *(_WORD *)&self->_amountIsExpanded = 0;
    objc_storeStrong((id *)&self->_currentAmount, self->_originalAmount);
    objc_storeStrong((id *)&self->_currentThreshold, self->_originalThreshold);
    objc_storeStrong((id *)&self->_currentPaymentMethodName, self->_originalPaymentMethodName);
    objc_storeStrong((id *)&self->_currentPaymentMethodIdentifier, self->_originalPaymentMethodIdentifier);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadDataAnimated:", 1);

}

- (void)setEnabled:(BOOL)a3
{
  id WeakRetained;

  self->_enabled = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadDataAnimated:", 1);

}

- (void)applyUpdate
{
  objc_storeStrong((id *)&self->_originalAmount, self->_currentAmount);
  objc_storeStrong((id *)&self->_originalThreshold, self->_currentThreshold);
  objc_storeStrong((id *)&self->_originalPaymentMethodName, self->_currentPaymentMethodName);
  objc_storeStrong((id *)&self->_originalPaymentMethodIdentifier, self->_currentPaymentMethodIdentifier);
}

- (BOOL)valuesEdited
{
  if (PKEqualObjects() && PKEqualObjects())
    return PKEqualObjects() ^ 1;
  else
    return 1;
}

- (NSArray)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("thresholdSelection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldHighlightItem:(id)a3
{
  void *v3;
  char v4;

  if (!self->_editing)
    return 0;
  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PKEqualObjects() & 1) != 0 || (PKEqualObjects() & 1) != 0)
    v4 = 1;
  else
    v4 = PKEqualObjects();

  return v4;
}

- (void)updatePaymentMethod:(id)a3
{
  id v4;
  NSString *v5;
  NSString *currentPaymentMethodName;
  NSString *v7;
  NSString *currentPaymentMethodIdentifier;
  PKThresholdTopUpSelectionItem *v9;
  id WeakRetained;

  v4 = a3;
  objc_msgSend(v4, "localizedDescription");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  currentPaymentMethodName = self->_currentPaymentMethodName;
  self->_currentPaymentMethodName = v5;

  objc_msgSend(v4, "primaryAccountIdentifier");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  currentPaymentMethodIdentifier = self->_currentPaymentMethodIdentifier;
  self->_currentPaymentMethodIdentifier = v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = -[PKThresholdTopUpSelectionItem initWithIdentifier:]([PKThresholdTopUpSelectionItem alloc], "initWithIdentifier:", CFSTR("paymentMethodIdentifier"));
  objc_msgSend(WeakRetained, "reloadItem:animated:", v9, 1);

}

- (void)didSelectItem:(id)a3
{
  id WeakRetained;
  __int16 v5;
  id v6;
  id v7;

  objc_msgSend(a3, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (PKEqualObjects() && !self->_amountIsExpanded)
  {
    v5 = 1;
LABEL_9:
    *(_WORD *)&self->_amountIsExpanded = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "reloadDataAnimated:", 1);
    goto LABEL_10;
  }
  if (PKEqualObjects() && !self->_thresholdIsExpanded)
  {
    v5 = 256;
    goto LABEL_9;
  }
  if (PKEqualObjects())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didSelectPaymentMethod");
LABEL_10:

  }
  v6 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "deselectCells");

}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  id v10;
  PKThresholdTopUpSelectionItem *v11;
  PKThresholdTopUpSelectionItem *v12;
  PKThresholdTopUpSelectionItem *v13;
  PKThresholdTopUpSelectionItem *v14;
  PKThresholdTopUpSelectionItem *v15;
  void *v16;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == CFSTR("thresholdSelection")
    || v7
    && (v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("thresholdSelection")), v8, v9))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = -[PKThresholdTopUpSelectionItem initWithIdentifier:]([PKThresholdTopUpSelectionItem alloc], "initWithIdentifier:", CFSTR("amountIdentifier"));
    objc_msgSend(v10, "addObject:", v11);

    if (self->_amountIsExpanded)
    {
      v12 = -[PKThresholdTopUpSelectionItem initWithIdentifier:]([PKThresholdTopUpSelectionItem alloc], "initWithIdentifier:", CFSTR("amountPickerIdentifier"));
      objc_msgSend(v10, "addObject:", v12);

    }
    v13 = -[PKThresholdTopUpSelectionItem initWithIdentifier:]([PKThresholdTopUpSelectionItem alloc], "initWithIdentifier:", CFSTR("thresholdIdentifier"));
    objc_msgSend(v10, "addObject:", v13);

    if (self->_thresholdIsExpanded)
    {
      v14 = -[PKThresholdTopUpSelectionItem initWithIdentifier:]([PKThresholdTopUpSelectionItem alloc], "initWithIdentifier:", CFSTR("thresholdPickerIdentifier"));
      objc_msgSend(v10, "addObject:", v14);

    }
    if (-[NSString length](self->_currentPaymentMethodName, "length"))
    {
      v15 = -[PKThresholdTopUpSelectionItem initWithIdentifier:]([PKThresholdTopUpSelectionItem alloc], "initWithIdentifier:", CFSTR("paymentMethodIdentifier"));
      objc_msgSend(v10, "addObject:", v15);

    }
    v16 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v6, "appendItems:", v16);

  }
  return v6;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  uint64_t v9;
  void *v10;
  char v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id location;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PKEqualObjects() & 1) != 0 || (PKEqualObjects() & 1) != 0)
  {
    objc_initWeak(&location, self);
  }
  else
  {
    v12 = PKEqualObjects();
    objc_initWeak(&location, self);
    if ((v12 & 1) == 0)
    {
      v13 = objc_opt_class();
      v14 = (void *)MEMORY[0x1E0DC35C8];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke_2;
      v15[3] = &unk_1E3E71B58;
      v8 = &v16;
      objc_copyWeak(&v16, &location);
      v15[4] = self;
      objc_msgSend(v14, "registrationWithCellClass:configurationHandler:", v13, v15);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
  }
  v6 = objc_opt_class();
  v7 = (void *)MEMORY[0x1E0DC35C8];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke;
  v17[3] = &unk_1E3E71B30;
  v8 = &v18;
  objc_copyWeak(&v18, &location);
  v17[4] = self;
  objc_msgSend(v7, "registrationWithCellClass:configurationHandler:", v6, v17);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v10 = (void *)v9;
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

  return v10;
}

void __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  __CFString *v9;
  __CFString *v10;
  int v11;
  char v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BYTE *v31;
  id v32;
  void *v33;
  id *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v7, "identifier");
    v9 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v9 == CFSTR("amountIdentifier");
    if (v9 == CFSTR("amountIdentifier") || !v9)
    {

      v21 = v10;
      if (v10)
        goto LABEL_6;
    }
    else
    {
      v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("amountIdentifier"));

      if (v10 == CFSTR("thresholdIdentifier"))
        goto LABEL_14;
      if (v10)
      {
LABEL_6:
        v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("thresholdIdentifier")) | v11;

        if ((v12 & 1) == 0)
        {
          v13 = v10;
          if (v13 != CFSTR("paymentMethodIdentifier"))
          {
            v14 = v13;
            v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("paymentMethodIdentifier"));

            if (!v15)
              goto LABEL_30;
          }
          objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setText:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
          objc_msgSend(v16, "setSecondaryText:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
          v17 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 120);
          objc_msgSend(v16, "textProperties");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setColor:", v19);

            objc_msgSend(v16, "secondaryTextProperties");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setColor:", v36);

            objc_msgSend(v16, "secondaryTextProperties");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
          }
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setColor:", v37);

          if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 121))
          {
            objc_msgSend(v6, "setAccessories:", MEMORY[0x1E0C9AA60]);
            goto LABEL_29;
          }
          v32 = objc_alloc_init(MEMORY[0x1E0DC3568]);
          v39 = v32;
          v33 = (void *)MEMORY[0x1E0C99D20];
          v34 = &v39;
          goto LABEL_27;
        }
LABEL_14:
        objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v22;
        v23 = 136;
        if (v11)
        {
          v23 = 128;
          v24 = (_QWORD *)MEMORY[0x1E0D678A8];
        }
        else
        {
          v24 = (_QWORD *)MEMORY[0x1E0D68110];
        }
        objc_msgSend(v22, "setText:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + v23));
        objc_msgSend(v6, "setAccessibilityIdentifier:", *v24);
        v25 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 120);
        objc_msgSend(v16, "textProperties");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setColor:", v27);

          objc_msgSend(v16, "secondaryTextProperties");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setColor:", v29);

          objc_msgSend(v16, "secondaryTextProperties");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setColor:", v30);

        v31 = *(_BYTE **)(a1 + 32);
        if (!v31[121])
        {
          PKCurrencyAmountMake();
          v32 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "minimalFormattedStringValue");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setSecondaryText:", v35);

          objc_msgSend(v6, "setAccessories:", MEMORY[0x1E0C9AA60]);
LABEL_28:

LABEL_29:
          objc_msgSend(v6, "setContentConfiguration:", v16);

LABEL_30:
          goto LABEL_31;
        }
        objc_msgSend(v31, "_buttonAccessoryForItem:", v7);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v40[0] = v32;
        v33 = (void *)MEMORY[0x1E0C99D20];
        v34 = (id *)v40;
LABEL_27:
        objc_msgSend(v33, "arrayWithObjects:count:", v34, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setAccessories:", v38);

        goto LABEL_28;
      }
    }
    if (!v11)
      goto LABEL_30;
    v11 = 1;
    goto LABEL_14;
  }
LABEL_31:

}

void __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id *v20;
  __CFString *v21;
  __CFString *v22;
  int v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  __CFString *v31;
  id *from;
  id v33;
  id v34;
  id v35;
  id *WeakRetained;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v35 = a2;
  v33 = a3;
  v34 = a4;
  from = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v34, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAccessibilityIdentifier:", v7);
    v8 = v7;
    v9 = v8;
    if (v8 == CFSTR("amountPickerIdentifier"))
      goto LABEL_5;
    if (!v8)
    {
LABEL_18:

      goto LABEL_19;
    }
    v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("amountPickerIdentifier"));

    if (v10)
    {
LABEL_5:
      v31 = v9;
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v12 = WeakRetained[9];
      v13 = 0;
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v46;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v46 != v15)
              objc_enumerationMutation(v12);
            PKCurrencyAmountMake();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "minimalFormattedStringValue");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (PKEqualObjects())
            {
              v19 = v18;

              v13 = v19;
            }
            objc_msgSend(v11, "addObject:", v18);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        }
        while (v14);
      }

      objc_msgSend(v35, "setValues:", v11);
      if (v13)
        objc_msgSend(v35, "updateSelectedValue:", v13);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke_3;
      v43[3] = &unk_1E3E68760;
      v20 = &v44;
      objc_copyWeak(&v44, from);
      objc_msgSend(v35, "setSelectionChanged:", v43);
    }
    else
    {
      v21 = v9;
      if (v21 != CFSTR("thresholdPickerIdentifier"))
      {
        v22 = v21;
        v23 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("thresholdPickerIdentifier"));

        if (!v23)
          goto LABEL_18;
      }
      v31 = v9;
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v24 = WeakRetained[10];
      v13 = 0;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v40;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v40 != v26)
              objc_enumerationMutation(v24);
            PKCurrencyAmountMake();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "minimalFormattedStringValue");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (PKEqualObjects())
            {
              v30 = v29;

              v13 = v30;
            }
            objc_msgSend(v11, "addObject:", v29);

            ++v27;
          }
          while (v25 != v27);
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
        }
        while (v25);
      }

      objc_msgSend(v35, "setValues:", v11);
      if (v13)
        objc_msgSend(v35, "updateSelectedValue:", v13);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke_4;
      v37[3] = &unk_1E3E68760;
      v20 = &v38;
      objc_copyWeak(&v38, from);
      objc_msgSend(v35, "setSelectionChanged:", v37);
    }
    objc_destroyWeak(v20);

    v9 = v31;
    goto LABEL_18;
  }
LABEL_19:

}

void __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  uint64_t v4;
  id v5;
  id v6;
  PKThresholdTopUpSelectionItem *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained[9], "objectAtIndex:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v8[1];
    v8[1] = (id)v4;

    v6 = objc_loadWeakRetained(v8 + 14);
    v7 = -[PKThresholdTopUpSelectionItem initWithIdentifier:]([PKThresholdTopUpSelectionItem alloc], "initWithIdentifier:", CFSTR("amountIdentifier"));
    objc_msgSend(v6, "reloadItem:animated:", v7, 1);

    WeakRetained = v8;
  }

}

void __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  uint64_t v4;
  id v5;
  id v6;
  PKThresholdTopUpSelectionItem *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained[10], "objectAtIndex:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v8[2];
    v8[2] = (id)v4;

    v6 = objc_loadWeakRetained(v8 + 14);
    v7 = -[PKThresholdTopUpSelectionItem initWithIdentifier:]([PKThresholdTopUpSelectionItem alloc], "initWithIdentifier:", CFSTR("thresholdIdentifier"));
    objc_msgSend(v6, "reloadItem:animated:", v7, 1);

    WeakRetained = v8;
  }

}

- (id)_buttonAccessoryForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC3428];
  v30[1] = 3221225472;
  v30[2] = __70__PKThresholdTopUpSelectionSectionController__buttonAccessoryForItem___block_invoke;
  v30[3] = &unk_1E3E659D0;
  v30[0] = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v32, &location);
  v6 = v4;
  v31 = v6;
  objc_msgSend(v5, "actionWithHandler:", v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3518];
  objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "buttonWithConfiguration:primaryAction:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v15 = v14;
  if (v14 != CFSTR("amountIdentifier"))
  {
    if (v14)
    {
      v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("amountIdentifier"));

      if (v16)
        goto LABEL_4;
      v19 = v15;
      if (v19 == CFSTR("thresholdIdentifier")
        || (v20 = v19,
            v21 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("thresholdIdentifier")),
            v20,
            v21))
      {
        PKCurrencyAmountMake();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!self->_thresholdIsExpanded)
          goto LABEL_15;
        if (self->_viewStyle == 2)
          goto LABEL_6;
        goto LABEL_14;
      }
    }
    v17 = 0;
    goto LABEL_15;
  }
LABEL_4:
  PKCurrencyAmountMake();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_amountIsExpanded)
  {
    if (self->_viewStyle == 2)
    {
LABEL_6:
      PKBridgeButtonTextColor();
LABEL_7:
      v18 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v18;

      v13 = v22;
      goto LABEL_15;
    }
LABEL_14:
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    goto LABEL_7;
  }
LABEL_15:
  v23 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v17, "minimalFormattedStringValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = *MEMORY[0x1E0DC1140];
  v35[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v23, "initWithString:attributes:", v24, v25);
  objc_msgSend(v12, "setAttributedTitle:", v26);

  objc_msgSend(v11, "setConfiguration:", v12);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v27);

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v11, 1);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v28;
}

void __70__PKThresholdTopUpSelectionSectionController__buttonAccessoryForItem___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didSelectItem:", *(_QWORD *)(a1 + 32));

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

  objc_msgSend(v7, "contentInsets");
  objc_msgSend(v7, "setContentInsets:", 11.0);

  return v7;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)editing
{
  return self->_editing;
}

- (NSString)amountTitle
{
  return self->_amountTitle;
}

- (void)setAmountTitle:(id)a3
{
  objc_storeStrong((id *)&self->_amountTitle, a3);
}

- (NSString)thresholdTitle
{
  return self->_thresholdTitle;
}

- (void)setThresholdTitle:(id)a3
{
  objc_storeStrong((id *)&self->_thresholdTitle, a3);
}

- (NSString)paymentMethodTitle
{
  return self->_paymentMethodTitle;
}

- (void)setPaymentMethodTitle:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethodTitle, a3);
}

- (NSDecimalNumber)currentAmount
{
  return self->_currentAmount;
}

- (NSDecimalNumber)currentThreshold
{
  return self->_currentThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethodTitle, 0);
  objc_storeStrong((id *)&self->_thresholdTitle, 0);
  objc_storeStrong((id *)&self->_amountTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_thresholdSuggestions, 0);
  objc_storeStrong((id *)&self->_amountSuggestions, 0);
  objc_storeStrong((id *)&self->_originalPaymentMethodIdentifier, 0);
  objc_storeStrong((id *)&self->_currentPaymentMethodIdentifier, 0);
  objc_storeStrong((id *)&self->_originalPaymentMethodName, 0);
  objc_storeStrong((id *)&self->_currentPaymentMethodName, 0);
  objc_storeStrong((id *)&self->_originalThreshold, 0);
  objc_storeStrong((id *)&self->_originalAmount, 0);
  objc_storeStrong((id *)&self->_currentThreshold, 0);
  objc_storeStrong((id *)&self->_currentAmount, 0);
}

@end
