@implementation PKCurrencyAmountSelectorOptionProvider

- (PKCurrencyAmountSelectorOptionProvider)initWithType:(int64_t)a3 accountUser:(id)a4 currencyCode:(id)a5
{
  id v9;
  id v10;
  PKCurrencyAmountSelectorOptionProvider *v11;
  PKCurrencyAmountSelectorOptionProvider *v12;
  uint64_t v13;
  NSString *currencyCode;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *defaultAmounts;
  uint64_t v21;
  NSArray *customAmounts;
  int64_t type;
  void *v24;
  uint64_t v25;
  NSDecimalNumber *amount;
  objc_super v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PKCurrencyAmountSelectorOptionProvider;
  v11 = -[PKCurrencyAmountSelectorOptionProvider init](&v28, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_accountUser, a4);
    v13 = objc_msgSend(v10, "copy");
    currencyCode = v12->_currencyCode;
    v12->_currencyCode = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("25"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("50"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v16;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("100"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v17;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("250"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
    v19 = objc_claimAutoreleasedReturnValue();

    defaultAmounts = v12->_defaultAmounts;
    v12->_defaultAmounts = (NSArray *)v19;

    PKSharedCacheGetCustomOptions();
    v21 = objc_claimAutoreleasedReturnValue();
    customAmounts = v12->_customAmounts;
    v12->_customAmounts = (NSArray *)v21;

    type = v12->_type;
    if (type == 2)
    {
      -[PKAccountUser notificationSettings](v12->_accountUser, "notificationSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "transactionNotificationThreshold");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else if (type == 1)
    {
      -[PKAccountUser notificationSettings](v12->_accountUser, "notificationSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "monthlySpendNotificationThreshold");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (type)
      {
LABEL_11:
        -[PKCurrencyAmountSelectorOptionProvider _updateOptions](v12, "_updateOptions");
        goto LABEL_12;
      }
      -[PKAccountUser preferences](v12->_accountUser, "preferences");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v24, "transactionSpendLimitEnabled"))
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(v24, "transactionSpendLimitAmount");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    amount = v12->_amount;
    v12->_amount = (NSDecimalNumber *)v25;

    goto LABEL_10;
  }
LABEL_12:

  return v12;
}

- (void)insertCustomAmount:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSArray *v9;
  NSArray *customAmounts;
  id v11;

  v5 = a3;
  if (v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_amount, a3);
    v6 = v11;
    PKSharedCacheGetCustomOptions();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
      v7 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    objc_msgSend(v7, "arrayByAddingObject:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    PKSharedCacheSetCustomOptions(v8);
    PKSharedCacheGetCustomOptions();
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    customAmounts = self->_customAmounts;
    self->_customAmounts = v9;

    -[PKCurrencyAmountSelectorOptionProvider _updateOptions](self, "_updateOptions");
    v5 = v11;
  }

}

- (void)removeCustomAmount:(id)a3
{
  id v4;
  NSDecimalNumber *amount;
  id v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *customAmounts;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    if (PKEqualObjects())
    {
      amount = self->_amount;
      self->_amount = 0;

    }
    v6 = v11;
    PKSharedCacheGetCustomOptions();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pk_arrayByRemovingObject:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    PKSharedCacheSetCustomOptions(v8);
    PKSharedCacheGetCustomOptions();
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    customAmounts = self->_customAmounts;
    self->_customAmounts = v9;

    -[PKCurrencyAmountSelectorOptionProvider _updateOptions](self, "_updateOptions");
    v4 = v11;
  }

}

- (void)selectAmount:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amount, a3);
    -[PKCurrencyAmountSelectorOptionProvider _updateOptions](self, "_updateOptions");
  }

}

- (id)_optionWithAmount:(id)a3 isCustom:(BOOL)a4 selected:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  int64_t type;
  void *v12;
  unint64_t v13;
  void *v14;
  PKCurrencyAmountSelectorOption *v15;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v8)
  {
    PKCurrencyAmountMake();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    type = self->_type;
    if (type == 2 || type == 1)
    {
      objc_msgSend(v9, "formattedStringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_SPEND_NOTIFICATIONS_AMOUNT_FORMAT"), CFSTR("%@"), v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (type)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v9, "formattedStringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = -[PKCurrencyAmountSelectorOption initWithCurrencyAmount:displayValue:customOption:selected:]([PKCurrencyAmountSelectorOption alloc], "initWithCurrencyAmount:displayValue:customOption:selected:", v10, v12, v6, v5);

  }
  else
  {
    v13 = self->_type;
    if (v13 > 2)
    {
      v10 = 0;
    }
    else
    {
      PKLocalizedMadisonString(&off_1E3E70D28[v13]->isa);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = -[PKCurrencyAmountSelectorOption initWithCurrencyAmount:displayValue:customOption:selected:]([PKCurrencyAmountSelectorOption alloc], "initWithCurrencyAmount:displayValue:customOption:selected:", 0, v10, v6, v5);
  }

  return v15;
}

- (void)_updateOptions
{
  uint64_t v3;
  NSArray *defaultAmounts;
  void *v5;
  NSArray *customAmounts;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *options;
  PKCurrencyAmountSelectorOption *v14;
  PKCurrencyAmountSelectorOption *selectedOption;
  void (**optionsUpdateHandler)(id, NSArray *);
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = MEMORY[0x1E0C809B0];
  defaultAmounts = self->_defaultAmounts;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__PKCurrencyAmountSelectorOptionProvider__updateOptions__block_invoke;
  v19[3] = &unk_1E3E70B80;
  v19[4] = self;
  -[NSArray pk_arrayByApplyingBlock:](defaultAmounts, "pk_arrayByApplyingBlock:", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObjectsFromArray:", v5);

  customAmounts = self->_customAmounts;
  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = __56__PKCurrencyAmountSelectorOptionProvider__updateOptions__block_invoke_2;
  v18[3] = &unk_1E3E70B80;
  v18[4] = self;
  -[NSArray pk_arrayByApplyingBlock:](customAmounts, "pk_arrayByApplyingBlock:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObjectsFromArray:", v7);

  -[PKCurrencyAmountSelectorOptionProvider _optionWithAmount:isCustom:selected:](self, "_optionWithAmount:isCustom:selected:", 0, 0, PKEqualObjects());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v8);

  objc_msgSend(v17, "pk_anyObjectPassingTest:", &__block_literal_global_139);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[PKCurrencyAmountSelectorOptionProvider _optionWithAmount:isCustom:selected:](self, "_optionWithAmount:isCustom:selected:", self->_amount, 1, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v10);

  }
  objc_msgSend(v17, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  options = self->_options;
  self->_options = v12;

  objc_msgSend(v17, "pk_anyObjectPassingTest:", &__block_literal_global_179);
  v14 = (PKCurrencyAmountSelectorOption *)objc_claimAutoreleasedReturnValue();
  selectedOption = self->_selectedOption;
  self->_selectedOption = v14;

  optionsUpdateHandler = (void (**)(id, NSArray *))self->_optionsUpdateHandler;
  if (optionsUpdateHandler)
    optionsUpdateHandler[2](optionsUpdateHandler, self->_options);

}

id __56__PKCurrencyAmountSelectorOptionProvider__updateOptions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_optionWithAmount:isCustom:selected:", v3, 0, PKEqualObjects());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __56__PKCurrencyAmountSelectorOptionProvider__updateOptions__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_optionWithAmount:isCustom:selected:", v3, 1, PKEqualObjects());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __56__PKCurrencyAmountSelectorOptionProvider__updateOptions__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selected");
}

uint64_t __56__PKCurrencyAmountSelectorOptionProvider__updateOptions__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selected");
}

- (int64_t)type
{
  return self->_type;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSArray)options
{
  return self->_options;
}

- (PKCurrencyAmountSelectorOption)selectedOption
{
  return self->_selectedOption;
}

- (id)optionsUpdateHandler
{
  return self->_optionsUpdateHandler;
}

- (void)setOptionsUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_optionsUpdateHandler, 0);
  objc_storeStrong((id *)&self->_selectedOption, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_customAmounts, 0);
  objc_storeStrong((id *)&self->_defaultAmounts, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
}

@end
