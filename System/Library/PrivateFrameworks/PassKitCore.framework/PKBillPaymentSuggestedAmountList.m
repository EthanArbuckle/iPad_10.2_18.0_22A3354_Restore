@implementation PKBillPaymentSuggestedAmountList

- (PKBillPaymentSuggestedAmountList)init
{

  return 0;
}

- (PKBillPaymentSuggestedAmountList)initWithCurrencyCode:(id)a3 remainingMinimumPayment:(id)a4 remainingStatementBalance:(id)a5 currentBalance:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKBillPaymentSuggestedAmountList *v15;
  PKBillPaymentSuggestedAmountList *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *suggestionsForCategory;
  NSMutableDictionary *v19;
  NSMutableDictionary *suggestionsForAmount;
  NSMutableDictionary *v21;
  NSMutableDictionary *suggestedAmountGapMessageForAmount;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  NSDecimalNumber *minimumAmount;
  uint64_t v29;
  NSDecimalNumber *remainingStatementAmount;
  uint64_t v31;
  NSDecimalNumber *maximumAmount;
  objc_super v34;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)PKBillPaymentSuggestedAmountList;
  v15 = -[PKBillPaymentSuggestedAmountList init](&v34, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_currencyCode, a3);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    suggestionsForCategory = v16->_suggestionsForCategory;
    v16->_suggestionsForCategory = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    suggestionsForAmount = v16->_suggestionsForAmount;
    v16->_suggestionsForAmount = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    suggestedAmountGapMessageForAmount = v16->_suggestedAmountGapMessageForAmount;
    v16->_suggestedAmountGapMessageForAmount = v21;

    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && objc_msgSend(v12, "compare:", v23) != 1)
    {

      v12 = 0;
    }
    if (v13 && objc_msgSend(v13, "compare:", v23) != 1)
    {

      v13 = 0;
    }
    if (v14)
    {
      if (objc_msgSend(v14, "compare:", v23) == -1)
      {
        v24 = v23;

        v14 = v24;
      }
    }
    else
    {
      v14 = v23;
    }
    if (v12 && objc_msgSend(v12, "compare:", v14) == 1)
    {
      v25 = v12;

      v14 = v25;
    }
    if (v13 && objc_msgSend(v13, "compare:", v14) == 1)
    {
      v26 = v13;

      v14 = v26;
    }
    if (v12)
    {
      v27 = objc_msgSend(v12, "copy");
      minimumAmount = v16->_minimumAmount;
      v16->_minimumAmount = (NSDecimalNumber *)v27;

    }
    if (v13)
    {
      v29 = objc_msgSend(v13, "copy");
      remainingStatementAmount = v16->_remainingStatementAmount;
      v16->_remainingStatementAmount = (NSDecimalNumber *)v29;

    }
    v31 = objc_msgSend(v14, "copy");
    maximumAmount = v16->_maximumAmount;
    v16->_maximumAmount = (NSDecimalNumber *)v31;

    -[PKBillPaymentSuggestedAmountList _createMandatorySuggestions](v16, "_createMandatorySuggestions");
  }

  return v16;
}

- (void)_createMandatorySuggestions
{
  NSDecimalNumber *v3;
  NSDecimalNumber *v4;
  NSDecimalNumber *v5;
  BOOL v6;
  NSDecimalNumber *v7;
  BOOL v8;
  PKBillPaymentSuggestedAmount *v9;
  PKBillPaymentSuggestedAmount *v10;
  PKBillPaymentSuggestedAmount *v11;
  NSDecimalNumber *v12;
  NSDecimalNumber *v13;

  v12 = self->_minimumAmount;
  v3 = self->_remainingStatementAmount;
  v4 = self->_maximumAmount;
  v5 = v4;
  if (!v3)
    goto LABEL_7;
  if (v4 && -[NSDecimalNumber compare:](v4, "compare:", v3) == NSOrderedSame)
  {

    v5 = 0;
  }
  if (!v12)
  {
LABEL_17:
    v13 = 0;
    v6 = v5 != 0;
    goto LABEL_21;
  }
  if (-[NSDecimalNumber compare:](v12, "compare:", v3) == NSOrderedSame)
  {

    goto LABEL_17;
  }
LABEL_7:
  v6 = v5 != 0;
  v7 = v12;
  if (v12)
    v8 = v5 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    if (-[NSDecimalNumber compare:](v12, "compare:", v5) == NSOrderedSame)
    {
      v9 = (PKBillPaymentSuggestedAmount *)v12;
      v12 = 0;
      goto LABEL_19;
    }
LABEL_15:
    v9 = -[PKBillPaymentSuggestedAmount initWithAmount:category:]([PKBillPaymentSuggestedAmount alloc], "initWithAmount:category:", v12, 1);
    -[PKBillPaymentSuggestedAmountList _addSuggestedAmount:force:](self, "_addSuggestedAmount:force:", v9, 1);
LABEL_19:

    v7 = v12;
    goto LABEL_20;
  }
  if (v12)
    goto LABEL_15;
LABEL_20:
  v13 = v7;
  if (!v3)
  {
    if (!v5)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_21:
  v10 = -[PKBillPaymentSuggestedAmount initWithAmount:category:]([PKBillPaymentSuggestedAmount alloc], "initWithAmount:category:", v3, 18);
  -[PKBillPaymentSuggestedAmountList _addSuggestedAmount:force:](self, "_addSuggestedAmount:force:", v10, 1);

  if (v6)
  {
LABEL_22:
    v11 = -[PKBillPaymentSuggestedAmount initWithAmount:category:]([PKBillPaymentSuggestedAmount alloc], "initWithAmount:category:", v5, 19);
    -[PKBillPaymentSuggestedAmountList _addSuggestedAmount:force:](self, "_addSuggestedAmount:force:", v11, 1);

  }
LABEL_23:

}

+ (id)boundaryAngle
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  int v9;

  v3 = (void *)MEMORY[0x1E0CB3598];
  LODWORD(v2) = 1054828264;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "decimalValue");
  }
  else
  {
    v8[0] = 0;
    v8[1] = 0;
    v9 = 0;
  }
  objc_msgSend(v3, "decimalNumberWithDecimal:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)roundingHandler
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35A0], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, 4, 0, 0, 0, 0);
}

+ (id)requiredSuggestedAmountCategories
{
  if (_MergedGlobals_253 != -1)
    dispatch_once(&_MergedGlobals_253, &__block_literal_global_153);
  return (id)qword_1ECF22928;
}

void __69__PKBillPaymentSuggestedAmountList_requiredSuggestedAmountCategories__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECF22928;
  qword_1ECF22928 = (uint64_t)&unk_1E2C3E230;

}

+ (unint64_t)maximumNumberSuggestions
{
  return 5;
}

- (BOOL)canAddAmount:(id)a3 andCategory:(unint64_t)a4
{
  _BOOL4 v6;

  v6 = -[PKBillPaymentSuggestedAmountList canAddAmount:](self, "canAddAmount:", a3);
  if (v6)
    LOBYTE(v6) = -[PKBillPaymentSuggestedAmountList canAddCategory:](self, "canAddCategory:", a4);
  return v6;
}

- (BOOL)canAddAmount:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToNumber:", v5) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_suggestionsForAmount, "objectForKey:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v7 == 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)canAddCategory:(unint64_t)a3
{
  NSMutableDictionary *suggestionsForCategory;
  void *v4;
  void *v5;

  suggestionsForCategory = self->_suggestionsForCategory;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](suggestionsForCategory, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(suggestionsForCategory) = v5 == 0;

  return (char)suggestionsForCategory;
}

- (BOOL)addSuggestedAmount:(id)a3
{
  return -[PKBillPaymentSuggestedAmountList _addSuggestedAmount:force:](self, "_addSuggestedAmount:force:", a3, 0);
}

- (void)addSuggestedAmountList:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[PKBillPaymentSuggestedAmountList addSuggestedAmount:](self, "addSuggestedAmount:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)_addSuggestedAmount:(id)a3 force:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSMutableDictionary *suggestionsForCategory;
  void *v13;
  NSMutableDictionary *suggestionsForAmount;
  void *v15;
  BOOL v16;

  v6 = a3;
  objc_msgSend(v6, "amount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "roundingHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decimalNumberByRoundingAccordingToBehavior:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAmount:", v9);
  if (a4
    || (objc_msgSend(v6, "amount"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[PKBillPaymentSuggestedAmountList canAddAmount:andCategory:](self, "canAddAmount:andCategory:", v10, objc_msgSend(v6, "category")), v10, v11))
  {
    suggestionsForCategory = self->_suggestionsForCategory;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "category"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](suggestionsForCategory, "setObject:forKey:", v6, v13);

    suggestionsForAmount = self->_suggestionsForAmount;
    objc_msgSend(v6, "amount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](suggestionsForAmount, "setObject:forKey:", v6, v15);

    -[PKBillPaymentSuggestedAmountList _updateValues](self, "_updateValues");
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)suggestedAmountWithCategory:(unint64_t)a3
{
  NSMutableDictionary *suggestionsForCategory;
  void *v4;
  void *v5;

  suggestionsForCategory = self->_suggestionsForCategory;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](suggestionsForCategory, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)maximumSuggestedAmount
{
  return -[NSArray lastObject](self->_sortedSuggestedAmounts, "lastObject");
}

- (id)minimumSuggestedAmount
{
  return -[NSArray firstObject](self->_sortedSuggestedAmounts, "firstObject");
}

- (id)maximumSuggestedAmountFromCategories:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self, "suggestedAmountWithCategory:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "integerValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (!v7 || v10 && objc_msgSend(v10, "compare:", v7) == 1)
        {
          v12 = v11;

          v7 = v12;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)minimumSuggestedAmountFromCategories:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self, "suggestedAmountWithCategory:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "integerValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (!v7 || v10 && objc_msgSend(v10, "compare:", v7) == -1)
        {
          v12 = v11;

          v7 = v12;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)suggestedAmount:(id)a3 isAdjoiningSuggestedAmount:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[PKBillPaymentSuggestedAmountList suggestedAmountBeforeSuggestedAmount:](self, "suggestedAmountBeforeSuggestedAmount:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqual:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[PKBillPaymentSuggestedAmountList suggestedAmountAfterSuggestedAmount:](self, "suggestedAmountAfterSuggestedAmount:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqual:", v7);

    }
  }

  return v8;
}

- (id)suggestedAmountBeforeSuggestedAmount:(id)a3
{
  NSUInteger v4;
  BOOL v5;
  void *v6;

  v4 = -[NSArray indexOfObject:](self->_sortedSuggestedAmounts, "indexOfObject:", a3);
  if (v4)
    v5 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = 1;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_sortedSuggestedAmounts, "objectAtIndex:", v4 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)suggestedAmountAfterSuggestedAmount:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v4 = -[NSArray indexOfObject:](self->_sortedSuggestedAmounts, "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (v5 = v4, v4 >= -[NSArray count](self->_sortedSuggestedAmounts, "count") - 1))
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_sortedSuggestedAmounts, "objectAtIndex:", v5 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)suggestedAmountGapMessageForStartSuggestedAmount:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "amount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_suggestedAmountGapMessageForAmount, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)addSuggestedAmountGapMessage:(id)a3 forStartSuggestedAmount:(id)a4
{
  NSMutableDictionary *suggestedAmountGapMessageForAmount;
  id v6;
  id v7;

  suggestedAmountGapMessageForAmount = self->_suggestedAmountGapMessageForAmount;
  v6 = a3;
  objc_msgSend(a4, "amount");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](suggestedAmountGapMessageForAmount, "setObject:forKey:", v6, v7);

}

- (id)billPaymentSelectedSuggestedAmountDataEventForAmount:(id)a3 accountIdentifier:(id)a4 statementIdentifier:(id)a5
{
  id v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __objc2_class **v18;
  void *v19;
  PKBillPaymentSelectedSuggestedAmountData *v20;
  void *v21;
  void *v22;
  PKBillPaymentSelectedSuggestedAmountData *v23;
  id v24;
  void *v25;
  PKAccountEvent *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32 = a5;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = self->_sortedSuggestedAmounts;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
      objc_msgSend(v15, "amount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToNumber:", v16) & 1) != 0)
        break;

      if (v12 == ++v14)
      {
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v17 = v9;
    v18 = off_1E2A9E000;
    v20 = [PKBillPaymentSelectedSuggestedAmountData alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "amount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PKBillPaymentSelectedSuggestedAmountData initWithStatementIdentifier:transactionDate:transactionAmount:suggestedAmountCategory:](v20, "initWithStatementIdentifier:transactionDate:transactionAmount:suggestedAmountCategory:", v32, v21, v22, objc_msgSend(v15, "category"));

    v19 = v32;
    if (v23)
      goto LABEL_12;
  }
  else
  {
LABEL_9:
    v17 = v9;

    v18 = off_1E2A9E000;
    v19 = v32;
  }
  v24 = objc_alloc(v18[217]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (PKBillPaymentSelectedSuggestedAmountData *)objc_msgSend(v24, "initWithStatementIdentifier:transactionDate:transactionAmount:suggestedAmountCategory:", v19, v25, v8, 0);

LABEL_12:
  v26 = objc_alloc_init(PKAccountEvent);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountEvent setItems:](v26, "setItems:", v27);

  -[PKAccountEvent setType:](v26, "setType:", 14);
  -[PKAccountEvent setAccountIdentifier:](v26, "setAccountIdentifier:", v17);
  -[PKBillPaymentSelectedSuggestedAmountData transactionDate](v23, "transactionDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountEvent setDate:](v26, "setDate:", v28);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "UUIDString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountEvent setIdentifier:](v26, "setIdentifier:", v30);

  return v26;
}

- (BOOL)isValidWithUnableReason:(unint64_t *)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  _BOOL4 v18;
  unint64_t v19;
  void *v21;
  unint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xEuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Validating the Bill Payment Suggested Amount List.", buf, 2u);
  }

  -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self, "suggestedAmountWithCategory:", 18);
  v6 = objc_claimAutoreleasedReturnValue();
  -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self, "suggestedAmountWithCategory:", 19);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6 | v7)
  {
    -[PKBillPaymentSuggestedAmountList maximumSuggestedAmount](self, "maximumSuggestedAmount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "category") == 18 || objc_msgSend(v9, "category") == 19)
    {
      v22 = a3;
      v23 = v7;
      v24 = v6;
      -[PKBillPaymentSuggestedAmountList _boundaryAmount](self, "_boundaryAmount", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSArray count](self->_sortedSuggestedAmounts, "count") != 1)
      {
        v11 = 0;
        do
        {
          -[NSArray objectAtIndex:](self->_sortedSuggestedAmounts, "objectAtIndex:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndex:](self->_sortedSuggestedAmounts, "objectAtIndex:", ++v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "amount");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "amount");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "decimalNumberBySubtracting:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "compare:", v10) == -1)
          {
            v17 = -[PKBillPaymentSuggestedAmountList _suggestedAmountIsRequiredCategory:](self, "_suggestedAmountIsRequiredCategory:", v12);
            v18 = -[PKBillPaymentSuggestedAmountList _suggestedAmountIsRequiredCategory:](self, "_suggestedAmountIsRequiredCategory:", v13);
            if (!v17 || !v18)
            {
              if (v22)
                *v22 = 3;

LABEL_32:
              v8 = 0;
              goto LABEL_33;
            }
            if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Bill payment suggestions are overlapping. The suggestions that are overlapping are both required, so they cannot be removed from the bill payment suggestion list", buf, 2u);
            }

            if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v12;
              _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Overlapping suggestion 1: %@", buf, 0xCu);
            }

            if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v13;
              _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Overlapping suggestion 2: %@", buf, 0xCu);
            }

          }
        }
        while (v11 < -[NSArray count](self->_sortedSuggestedAmounts, "count") - 1);
      }
      v19 = -[NSArray count](self->_sortedSuggestedAmounts, "count");
      if (v19 <= objc_msgSend((id)objc_opt_class(), "maximumNumberSuggestions"))
      {
        if (v22)
          *v22 = 0;
        v8 = 1;
      }
      else
      {
        if (!v22)
          goto LABEL_32;
        v8 = 0;
        *v22 = 4;
      }
LABEL_33:
      v7 = v23;
      v6 = v24;
      v9 = v21;

    }
    else
    {
      v8 = 0;
      if (a3)
        *a3 = 2;
    }

  }
  else
  {
    v8 = 0;
    if (a3)
      *a3 = 1;
  }

  return v8;
}

- (void)attemptToPurgeInvalidSuggestedAmounts
{
  id v3;
  unint64_t v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  NSUInteger v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  NSUInteger v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  BOOL v32;
  _BOOL4 v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  int v37;
  NSUInteger v38;
  void *v39;
  uint64_t v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0;
  v4 = 0x1E0CB3000uLL;
  v36 = v3;
  do
  {
    -[PKBillPaymentSuggestedAmountList isValidWithUnableReason:](self, "isValidWithUnableReason:", &v40, v36);
    objc_msgSend(*(id *)(v4 + 2024), "numberWithUnsignedInteger:", v40);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "containsObject:", v5);
    if (v40)
      v7 = v6;
    else
      v7 = 1;

    objc_msgSend(*(id *)(v4 + 2024), "numberWithUnsignedInteger:", v40);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

    if (v40 == 2)
    {
      v37 = v7;
      v27 = -[NSArray count](self->_sortedSuggestedAmounts, "count");
      -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self, "suggestedAmountWithCategory:", 18);
      v13 = objc_claimAutoreleasedReturnValue();
      -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self, "suggestedAmountWithCategory:", 19);
      v28 = objc_claimAutoreleasedReturnValue();
      if (v13 | v28)
      {
        v14 = (void *)v28;
        -[PKBillPaymentSuggestedAmountList maximumSuggestedAmount](self, "maximumSuggestedAmount");
        v29 = objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v30 = (void *)v29;
          do
          {
            if (objc_msgSend(v30, "category") == 18)
              break;
            v31 = objc_msgSend(v30, "category");
            v32 = v27-- != 0;
            v33 = v32;
            if (v31 == 19 || !v33)
              break;
            PKLogFacilityTypeGetObject(0xEuLL);
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v42 = (uint64_t)v30;
              _os_log_impl(&dword_18FC92000, v34, OS_LOG_TYPE_DEFAULT, "Removing maximum suggestion that has the wrong category from list %@", buf, 0xCu);
            }

            -[PKBillPaymentSuggestedAmountList _removeSuggestedAmount:](self, "_removeSuggestedAmount:", v30);
            -[PKBillPaymentSuggestedAmountList maximumSuggestedAmount](self, "maximumSuggestedAmount");
            v35 = objc_claimAutoreleasedReturnValue();

            v30 = (void *)v35;
          }
          while (v35);

        }
      }
      else
      {
        v14 = 0;
        v13 = 0;
      }
    }
    else
    {
      if (v40 != 3)
      {
        if (v40 == 4)
        {
          while (1)
          {
            v9 = -[NSArray count](self->_sortedSuggestedAmounts, "count");
            if (v9 <= objc_msgSend((id)objc_opt_class(), "maximumNumberSuggestions"))
              break;
            -[PKBillPaymentSuggestedAmountList _lastSuggestedAmountThatIsNotRequred](self, "_lastSuggestedAmountThatIsNotRequred");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            PKLogFacilityTypeGetObject(0xEuLL);
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v42 = (uint64_t)v10;
              _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Removing extra suggested amount from bill payment suggested amount list %@", buf, 0xCu);
            }

            -[PKBillPaymentSuggestedAmountList _removeSuggestedAmount:](self, "_removeSuggestedAmount:", v10);
          }
        }
        continue;
      }
      v37 = v7;
      v12 = -[NSArray count](self->_sortedSuggestedAmounts, "count");
      v13 = 0;
      while (1)
      {
        v38 = v12;

        -[PKBillPaymentSuggestedAmountList _boundaryAmount](self, "_boundaryAmount");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        v13 = 0;
        v39 = v14;
        do
        {
          if (v15 >= -[NSArray count](self->_sortedSuggestedAmounts, "count") - 1)
            break;
          -[NSArray objectAtIndex:](self->_sortedSuggestedAmounts, "objectAtIndex:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndex:](self->_sortedSuggestedAmounts, "objectAtIndex:", ++v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "amount");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "amount");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "decimalNumberBySubtracting:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "compare:", v14);
          if (v21 == -1)
          {
            v22 = (void *)v13;
            v23 = objc_msgSend(v16, "priority");
            if (v23 == objc_msgSend(v17, "priority"))
            {
              -[PKBillPaymentSuggestedAmountList _suggestedAmountThatIsNotRequired:suggestedAmount2:](self, "_suggestedAmountThatIsNotRequired:suggestedAmount2:", v16, v17);
              v24 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v25 = objc_msgSend(v16, "priority");
              if (v25 <= objc_msgSend(v17, "priority"))
                v24 = v16;
              else
                v24 = v17;
            }
            v13 = (uint64_t)v24;

            v14 = v39;
          }

        }
        while (v21 != -1);
        if (!v13)
          break;
        PKLogFacilityTypeGetObject(0xEuLL);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v13;
          _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Removing overlapping suggested amount from bill payment suggested amount list %@", buf, 0xCu);
        }

        -[PKBillPaymentSuggestedAmountList _removeSuggestedAmount:](self, "_removeSuggestedAmount:", v13);
        v12 = v38 - 1;

        if (v38 == 1)
          goto LABEL_43;
      }
    }

LABEL_43:
    v3 = v36;
    v4 = 0x1E0CB3000;
    v7 = v37;
  }
  while (!v7);

}

- (id)description
{
  return -[NSArray description](self->_sortedSuggestedAmounts, "description");
}

- (void)_removeSuggestedAmount:(id)a3
{
  NSMutableDictionary *suggestionsForCategory;
  void *v5;
  id v6;
  void *v7;
  NSMutableDictionary *suggestionsForAmount;
  void *v9;

  suggestionsForCategory = self->_suggestionsForCategory;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "category"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](suggestionsForCategory, "removeObjectForKey:", v7);

  suggestionsForAmount = self->_suggestionsForAmount;
  objc_msgSend(v6, "amount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectForKey:](suggestionsForAmount, "removeObjectForKey:", v9);
  -[PKBillPaymentSuggestedAmountList _updateValues](self, "_updateValues");
}

- (id)_sortedAmounts
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allKeys](self->_suggestionsForAmount, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_sortedSuggestedAmounts
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PKBillPaymentSuggestedAmountList _sortedAmounts](self, "_sortedAmounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary objectForKey:](self->_suggestionsForAmount, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (id)_smalllestSuggestionAmountBelowRemainingStatementAmount
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PKBillPaymentSuggestedAmountList remainingStatementAmount](self, "remainingStatementAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKBillPaymentSuggestedAmountList minimumSuggestedAmount](self, "minimumSuggestedAmount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "amount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "compare:", v3) == -1)
      v6 = v5;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_suggestedAmountIsRequiredCategory:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  v3 = objc_msgSend(a3, "category");
  objc_msgSend((id)objc_opt_class(), "requiredSuggestedAmountCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (id)_lastSuggestedAmountThatIsNotRequred
{
  NSUInteger v3;
  uint64_t v4;
  void *v5;

  v3 = -[NSArray count](self->_sortedSuggestedAmounts, "count");
  if ((uint64_t)(v3 - 1) < 0)
  {
LABEL_5:
    v5 = 0;
  }
  else
  {
    v4 = v3;
    while (1)
    {
      -[NSArray objectAtIndex:](self->_sortedSuggestedAmounts, "objectAtIndex:", --v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[PKBillPaymentSuggestedAmountList _suggestedAmountIsRequiredCategory:](self, "_suggestedAmountIsRequiredCategory:", v5))break;

      if (v4 <= 0)
        goto LABEL_5;
    }
  }
  return v5;
}

- (id)_suggestedAmountThatIsNotRequired:(id)a3 suggestedAmount2:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  BOOL v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = -[PKBillPaymentSuggestedAmountList _suggestedAmountIsRequiredCategory:](self, "_suggestedAmountIsRequiredCategory:", v6);
  v9 = -[PKBillPaymentSuggestedAmountList _suggestedAmountIsRequiredCategory:](self, "_suggestedAmountIsRequiredCategory:", v7);
  if (v8 && v9)
  {
    v10 = 0;
  }
  else
  {
    if (v8)
      v11 = v7;
    else
      v11 = v6;
    v10 = v11;
  }

  return v10;
}

- (void)_updateValues
{
  NSArray *v3;
  NSArray *sortedSuggestedAmounts;
  NSDecimalNumber *v5;
  NSDecimalNumber *smalllestSuggestionAmountBelowRemainingStatementAmount;

  -[PKBillPaymentSuggestedAmountList _sortedSuggestedAmounts](self, "_sortedSuggestedAmounts");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedSuggestedAmounts = self->_sortedSuggestedAmounts;
  self->_sortedSuggestedAmounts = v3;

  -[PKBillPaymentSuggestedAmountList _smalllestSuggestionAmountBelowRemainingStatementAmount](self, "_smalllestSuggestionAmountBelowRemainingStatementAmount");
  v5 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  smalllestSuggestionAmountBelowRemainingStatementAmount = self->_smalllestSuggestionAmountBelowRemainingStatementAmount;
  self->_smalllestSuggestionAmountBelowRemainingStatementAmount = v5;

}

- (id)_boundaryAmount
{
  NSDecimalNumber *minimumAmount;
  NSDecimalNumber *v4;
  NSDecimalNumber *v5;
  NSDecimalNumber *maximumAmount;
  NSDecimalNumber *v7;
  NSDecimalNumber *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  int v20;

  minimumAmount = self->_minimumAmount;
  if (minimumAmount)
  {
    v4 = minimumAmount;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  maximumAmount = self->_maximumAmount;
  if (maximumAmount)
  {
    v7 = maximumAmount;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v7 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend((id)objc_opt_class(), "boundaryAngle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber decimalNumberBySubtracting:](v8, "decimalNumberBySubtracting:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3598];
  LODWORD(v12) = 1086918619;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "decimalValue");
  }
  else
  {
    v19[0] = 0;
    v19[1] = 0;
    v20 = 0;
  }
  objc_msgSend(v11, "decimalNumberWithDecimal:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "decimalNumberByDividingBy:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "decimalNumberByMultiplyingBy:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSArray)sortedSuggestedAmounts
{
  return self->_sortedSuggestedAmounts;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSDecimalNumber)minimumAmount
{
  return self->_minimumAmount;
}

- (NSDecimalNumber)remainingStatementAmount
{
  return self->_remainingStatementAmount;
}

- (NSDecimalNumber)maximumAmount
{
  return self->_maximumAmount;
}

- (NSDecimalNumber)smalllestSuggestionAmountBelowRemainingStatementAmount
{
  return self->_smalllestSuggestionAmountBelowRemainingStatementAmount;
}

- (PKBillPaymentSuggestedAmount)initialSuggestedAmount
{
  return self->_initialSuggestedAmount;
}

- (void)setInitialSuggestedAmount:(id)a3
{
  objc_storeStrong((id *)&self->_initialSuggestedAmount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSuggestedAmount, 0);
  objc_storeStrong((id *)&self->_smalllestSuggestionAmountBelowRemainingStatementAmount, 0);
  objc_storeStrong((id *)&self->_maximumAmount, 0);
  objc_storeStrong((id *)&self->_remainingStatementAmount, 0);
  objc_storeStrong((id *)&self->_minimumAmount, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_sortedSuggestedAmounts, 0);
  objc_storeStrong((id *)&self->_suggestedAmountGapMessageForAmount, 0);
  objc_storeStrong((id *)&self->_suggestionsForAmount, 0);
  objc_storeStrong((id *)&self->_suggestionsForCategory, 0);
}

@end
