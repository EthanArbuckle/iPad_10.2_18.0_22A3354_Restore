@implementation PKNumericSuggestionsEnterValueAlgorithm

- (PKNumericSuggestionsEnterValueAlgorithm)initWithLastInput:(id)a3
{
  id v5;
  PKNumericSuggestionsEnterValueAlgorithm *v6;
  PKNumericSuggestionsEnterValueAlgorithm *v7;
  uint64_t v8;
  NSDecimalNumber *cardBalance;
  uint64_t v10;
  NSDecimalNumberHandler *roundingBehavior;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKNumericSuggestionsEnterValueAlgorithm;
  v6 = -[PKNumericSuggestionsEnterValueAlgorithm init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lastInput, a3);
    v7->_decimalPrecision = 0;
    v7->_powerOfTenFactor = 1;
    v7->_hasValidDefaultSuggestions = 0;
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v8 = objc_claimAutoreleasedReturnValue();
    cardBalance = v7->_cardBalance;
    v7->_cardBalance = (NSDecimalNumber *)v8;

    objc_msgSend(MEMORY[0x1E0CB35A0], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, SLOWORD(v7->_decimalPrecision), 0, 0, 0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    roundingBehavior = v7->_roundingBehavior;
    v7->_roundingBehavior = (NSDecimalNumberHandler *)v10;

    -[PKNumericSuggestionsEnterValueAlgorithm _generateCalculatedSuggestions](v7, "_generateCalculatedSuggestions");
  }

  return v7;
}

- (PKNumericSuggestionsEnterValueAlgorithm)init
{
  return -[PKNumericSuggestionsEnterValueAlgorithm initWithLastInput:](self, "initWithLastInput:", 0);
}

- (BOOL)_lastInputExistsInGeneratedSuggestions:(id)a3 withLastInput:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PKNumericSuggestionLastInput value](self->_lastInput, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKNumericSuggestion suggestionWithValue:currencyCode:](PKNumericSuggestion, "suggestionWithValue:currencyCode:", v6, self->_currencyCode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "isEqual:", v7, (_QWORD)v13) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)suggestionsWithAmount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  PKNumericSuggestionLastInput *lastInput;
  void *v12;
  BOOL v13;
  id v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  NSArray *defaultSuggestions;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  NSArray *valuesToDefaults;
  void *v28;
  void *v29;
  NSUInteger v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(_QWORD *, void *);
  void *v46;
  id v47;
  id v48;
  PKNumericSuggestionsEnterValueAlgorithm *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  PKNumericSuggestionsEnterValueAlgorithm *v53;
  uint8_t buf[4];
  int v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(MEMORY[0x1E0CB3598], "notANumber"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v4, "isEqualToNumber:", v6),
        v6,
        v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "isEqualToNumber:", v9);

  if (v10)
  {
    objc_msgSend(v5, "addObjectsFromArray:", self->_defaultSuggestions);
    lastInput = self->_lastInput;
    if (!lastInput)
      goto LABEL_33;
    -[PKNumericSuggestionLastInput value](lastInput, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12 && !-[PKNumericSuggestionLastInput wentToMax](self->_lastInput, "wentToMax"))
      goto LABEL_33;
    v13 = -[PKNumericSuggestionsEnterValueAlgorithm _lastInputExistsInGeneratedSuggestions:withLastInput:](self, "_lastInputExistsInGeneratedSuggestions:withLastInput:", v5, self->_lastInput);

    if (v13)
      goto LABEL_33;
    objc_msgSend(v5, "removeLastObject");
    -[PKNumericSuggestionsEnterValueAlgorithm _maxAmountSuggestion](self, "_maxAmountSuggestion");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (-[PKNumericSuggestionLastInput wentToMax](self->_lastInput, "wentToMax") && self->_maxBalance && v14)
    {
      objc_msgSend(v5, "addObject:", v14);
    }
    else
    {
      -[PKNumericSuggestionLastInput value](self->_lastInput, "value");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKNumericSuggestion suggestionWithValue:currencyCode:](PKNumericSuggestion, "suggestionWithValue:currencyCode:", v34, self->_currencyCode);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v35);

    }
LABEL_32:

LABEL_33:
    v15 = 0;
    goto LABEL_34;
  }
  if (!-[PKNumericSuggestionsEnterValueAlgorithm _useMaximumAmountSuggestionWithAmount:](self, "_useMaximumAmountSuggestionWithAmount:", v4))
  {
    -[PKNumericSuggestionsEnterValueAlgorithm _possibleValueForAmount:](self, "_possibleValueForAmount:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", v4);
    if ((v17 & 1) == 0)
    {
      +[PKNumericSuggestion suggestionWithValue:currencyCode:](PKNumericSuggestion, "suggestionWithValue:currencyCode:", v16, self->_currencyCode);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v18);

    }
    defaultSuggestions = self->_defaultSuggestions;
    v20 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __65__PKNumericSuggestionsEnterValueAlgorithm_suggestionsWithAmount___block_invoke;
    v50[3] = &unk_1E2AC76F0;
    v21 = v4;
    v51 = v21;
    v22 = v16;
    v52 = v22;
    v53 = self;
    -[NSArray pk_objectsPassingTest:](defaultSuggestions, "pk_objectsPassingTest:", v50);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v23);

    if ((unint64_t)objc_msgSend(v5, "count") >= 4)
    {
      objc_msgSend(v5, "subarrayWithRange:", 0, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v17;
      v26 = objc_msgSend(v24, "mutableCopy");

      v5 = (void *)v26;
      v17 = v25;
      v20 = MEMORY[0x1E0C809B0];
    }
    valuesToDefaults = self->_valuesToDefaults;
    v43 = v20;
    v44 = 3221225472;
    v45 = __65__PKNumericSuggestionsEnterValueAlgorithm_suggestionsWithAmount___block_invoke_2;
    v46 = &unk_1E2AC76F0;
    v47 = v21;
    v14 = v22;
    v48 = v14;
    v49 = self;
    -[NSArray pk_objectsPassingTest:](valuesToDefaults, "pk_objectsPassingTest:", &v43);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count", v43, v44, v45, v46))
    {
      if (objc_msgSend(v5, "count") == 3)
        objc_msgSend(v5, "removeLastObject");
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v29);

    }
    if ((unint64_t)objc_msgSend(v5, "count") <= 2)
    {
      v30 = -[NSArray count](self->_defaultSuggestions, "count");
      if ((uint64_t)(v30 - 1) >= 0)
      {
        v31 = v30;
        v32 = v17 ^ 1u;
        do
        {
          if ((unint64_t)objc_msgSend(v5, "count") > 2)
            break;
          -[NSArray objectAtIndex:](self->_defaultSuggestions, "objectAtIndex:", --v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v5, "containsObject:", v33) & 1) == 0)
            objc_msgSend(v5, "insertObject:atIndex:", v33, v32);

        }
        while (v31 > 0);
      }
    }

    goto LABEL_32;
  }
  v15 = 1;
LABEL_34:
  -[PKNumericSuggestionsEnterValueAlgorithm _useMaxAmountSuggestion](self, "_useMaxAmountSuggestion");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v36;
  if (v15 && v36)
  {
    objc_msgSend(v5, "removeAllObjects");
    objc_msgSend(v5, "addObject:", v37);
  }
  else if ((unint64_t)objc_msgSend(v5, "count") < 4)
  {
    if ((unint64_t)objc_msgSend(v5, "count") <= 2)
    {
      PKLogFacilityTypeGetObject(0);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v55 = 3;
        v56 = 2112;
        v57 = v5;
        _os_log_impl(&dword_18FC92000, v41, OS_LOG_TYPE_DEFAULT, "Something went wrong with the suggestions. There should be %d suggestions. But the suggestions were actually %@", buf, 0x12u);
      }

      objc_msgSend(v5, "removeAllObjects");
      objc_msgSend(v5, "addObjectsFromArray:", self->_defaultSuggestions);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v55 = 3;
      v56 = 2112;
      v57 = v5;
      _os_log_impl(&dword_18FC92000, v38, OS_LOG_TYPE_DEFAULT, "Something went wrong with the suggestions. There should be %d suggestions. But the suggestions were actually %@", buf, 0x12u);
    }

    objc_msgSend(v5, "subarrayWithRange:", 0, 3);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "mutableCopy");

    v5 = (void *)v40;
  }

  return v5;
}

uint64_t __65__PKNumericSuggestionsEnterValueAlgorithm_suggestionsWithAmount___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToNumber:", a1[4]) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToNumber:", a1[5]) & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      v7 = (void *)a1[6];
      objc_msgSend(v3, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "_possibleAmountIsValidWithDefaultValue:amount:", v8, a1[4]);

    }
  }

  return v5;
}

uint64_t __65__PKNumericSuggestionsEnterValueAlgorithm_suggestionsWithAmount___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToNumber:", a1[4]) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToNumber:", a1[5]) & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      v7 = (void *)a1[6];
      objc_msgSend(v3, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "_possibleAmountIsValidWithDefaultValue:amount:", v8, a1[4]);

    }
  }

  return v5;
}

- (void)setDefaultValues:(id)a3
{
  NSArray *v4;
  NSArray *defaultValues;

  if (self->_defaultValues != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    defaultValues = self->_defaultValues;
    self->_defaultValues = v4;

    -[PKNumericSuggestionsEnterValueAlgorithm _generateCalculatedSuggestions](self, "_generateCalculatedSuggestions");
  }
}

- (void)setPowerOfTenFactor:(unint64_t)a3
{
  if (self->_powerOfTenFactor != a3)
  {
    self->_powerOfTenFactor = (unint64_t)fmax((double)a3, 1.0);
    -[PKNumericSuggestionsEnterValueAlgorithm _generateCalculatedSuggestions](self, "_generateCalculatedSuggestions");
  }
}

- (void)setMinBalance:(id)a3
{
  NSDecimalNumber *v4;
  void *v5;
  char v6;
  NSDecimalNumber *v7;
  NSDecimalNumber *minBalance;
  NSDecimalNumber *v9;

  v4 = (NSDecimalNumber *)a3;
  if (self->_minBalance != v4)
  {
    v9 = v4;
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSDecimalNumber isEqualToNumber:](v9, "isEqualToNumber:", v5);

    if ((v6 & 1) != 0)
      v7 = 0;
    else
      v7 = (NSDecimalNumber *)-[NSDecimalNumber copy](v9, "copy");
    minBalance = self->_minBalance;
    self->_minBalance = v7;

    -[PKNumericSuggestionsEnterValueAlgorithm _generateCalculatedSuggestions](self, "_generateCalculatedSuggestions");
    v4 = v9;
  }

}

- (void)setMaxBalance:(id)a3
{
  NSDecimalNumber *v4;
  void *v5;
  void *v6;
  char v7;
  NSDecimalNumber *v8;
  NSDecimalNumber *maxBalance;
  NSDecimalNumber *v10;

  v4 = (NSDecimalNumber *)a3;
  if (self->_maxBalance != v4)
  {
    v10 = v4;
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDecimalNumber isEqualToNumber:](v10, "isEqualToNumber:", v5))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSDecimalNumber isEqualToNumber:](v10, "isEqualToNumber:", v6);

      if ((v7 & 1) == 0)
      {
        v8 = (NSDecimalNumber *)-[NSDecimalNumber copy](v10, "copy");
        goto LABEL_7;
      }
    }
    v8 = 0;
LABEL_7:
    maxBalance = self->_maxBalance;
    self->_maxBalance = v8;

    -[PKNumericSuggestionsEnterValueAlgorithm _generateCalculatedSuggestions](self, "_generateCalculatedSuggestions");
    v4 = v10;
  }

}

- (void)setMinLoadAmount:(id)a3
{
  NSDecimalNumber *v4;
  void *v5;
  void *v6;
  char v7;
  NSDecimalNumber *v8;
  NSDecimalNumber *minLoadAmount;
  NSDecimalNumber *v10;

  v4 = (NSDecimalNumber *)a3;
  if (self->_minLoadAmount != v4)
  {
    v10 = v4;
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDecimalNumber isEqualToNumber:](v10, "isEqualToNumber:", v5))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSDecimalNumber isEqualToNumber:](v10, "isEqualToNumber:", v6);

      if ((v7 & 1) == 0)
      {
        v8 = (NSDecimalNumber *)-[NSDecimalNumber copy](v10, "copy");
        goto LABEL_7;
      }
    }
    v8 = 0;
LABEL_7:
    minLoadAmount = self->_minLoadAmount;
    self->_minLoadAmount = v8;

    -[PKNumericSuggestionsEnterValueAlgorithm _generateCalculatedSuggestions](self, "_generateCalculatedSuggestions");
    v4 = v10;
  }

}

- (void)setMaxLoadAmount:(id)a3
{
  NSDecimalNumber *v4;
  void *v5;
  void *v6;
  char v7;
  NSDecimalNumber *v8;
  NSDecimalNumber *maxLoadAmount;
  NSDecimalNumber *v10;

  v4 = (NSDecimalNumber *)a3;
  if (self->_maxLoadAmount != v4)
  {
    v10 = v4;
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDecimalNumber isEqualToNumber:](v10, "isEqualToNumber:", v5))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSDecimalNumber isEqualToNumber:](v10, "isEqualToNumber:", v6);

      if ((v7 & 1) == 0)
      {
        v8 = (NSDecimalNumber *)-[NSDecimalNumber copy](v10, "copy");
        goto LABEL_7;
      }
    }
    v8 = 0;
LABEL_7:
    maxLoadAmount = self->_maxLoadAmount;
    self->_maxLoadAmount = v8;

    -[PKNumericSuggestionsEnterValueAlgorithm _generateCalculatedSuggestions](self, "_generateCalculatedSuggestions");
    v4 = v10;
  }

}

- (void)setDecimalPrecision:(int64_t)a3
{
  NSDecimalNumberHandler *v4;
  NSDecimalNumberHandler *roundingBehavior;

  if (self->_decimalPrecision != a3)
  {
    self->_decimalPrecision = a3;
    objc_msgSend(MEMORY[0x1E0CB35A0], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, (__int16)a3, 0, 0, 0, 0);
    v4 = (NSDecimalNumberHandler *)objc_claimAutoreleasedReturnValue();
    roundingBehavior = self->_roundingBehavior;
    self->_roundingBehavior = v4;

    -[PKNumericSuggestionsEnterValueAlgorithm _generateCalculatedSuggestions](self, "_generateCalculatedSuggestions");
  }
}

- (void)setCardBalance:(id)a3
{
  NSDecimalNumber *v4;
  NSDecimalNumber *cardBalance;

  if (self->_cardBalance != a3)
  {
    v4 = (NSDecimalNumber *)objc_msgSend(a3, "copy");
    cardBalance = self->_cardBalance;
    self->_cardBalance = v4;

    -[PKNumericSuggestionsEnterValueAlgorithm _generateCalculatedSuggestions](self, "_generateCalculatedSuggestions");
  }
}

- (void)setUseBuiltInDefaults:(BOOL)a3
{
  if (self->_useBuiltInDefaults != a3)
  {
    self->_useBuiltInDefaults = a3;
    -[PKNumericSuggestionsEnterValueAlgorithm _generateCalculatedSuggestions](self, "_generateCalculatedSuggestions");
  }
}

- (BOOL)_amountIsValid:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v9;
  void *v10;

  v4 = a3;
  if (!v4
    || (objc_msgSend(MEMORY[0x1E0CB3598], "notANumber"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "isEqualToNumber:", v5),
        v5,
        (v6 & 1) != 0)
    || self->_minLoadAmount && objc_msgSend(v4, "compare:") == -1
    || self->_maxLoadAmount && objc_msgSend(v4, "compare:") == 1)
  {
    v7 = 0;
  }
  else
  {
    -[NSDecimalNumber decimalNumberByAdding:](self->_cardBalance, "decimalNumberByAdding:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v7 = (!self->_minBalance || objc_msgSend(v9, "compare:") != -1)
      && (!self->_maxBalance || objc_msgSend(v10, "compare:") != 1);

  }
  return v7;
}

- (BOOL)_useMaximumAmountSuggestionWithAmount:(id)a3
{
  id v4;
  NSDecimalNumber *maxLoadAmount;
  void *v6;
  NSDecimalNumber *maxBalance;
  BOOL v8;

  v4 = a3;
  maxLoadAmount = self->_maxLoadAmount;
  if (maxLoadAmount && -[NSDecimalNumber compare:](maxLoadAmount, "compare:", v4) == NSOrderedAscending)
  {
    v8 = 1;
  }
  else
  {
    -[NSDecimalNumber decimalNumberByAdding:](self->_cardBalance, "decimalNumberByAdding:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    maxBalance = self->_maxBalance;
    v8 = maxBalance && -[NSDecimalNumber compare:](maxBalance, "compare:", v6) == NSOrderedAscending;

  }
  return v8;
}

- (BOOL)_possibleAmountIsValidWithDefaultValue:(id)a3 amount:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a3;
  -[PKNumericSuggestionsEnterValueAlgorithm _possibleValueForAmount:](self, "_possibleValueForAmount:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "compare:", v6);

  return (unint64_t)(v8 + 1) < 2;
}

- (id)_possibleValueForAmount:(id)a3
{
  id v4;
  unint64_t powerOfTenFactor;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v4 = a3;
  powerOfTenFactor = self->_powerOfTenFactor;
  objc_msgSend(v4, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((uint64_t)(powerOfTenFactor - objc_msgSend(v6, "length") + 1) < 0)
  {
    v9 = 0;
  }
  else
  {
    v7 = self->_powerOfTenFactor;
    objc_msgSend(v4, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 - objc_msgSend(v8, "length") + 1;

  }
  objc_msgSend(v4, "decimalNumberByMultiplyingByPowerOf10:withBehavior:", v9, self->_roundingBehavior);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_generateCalculatedSuggestions
{
  NSArray *v3;
  NSArray *defaultSuggestions;
  NSArray *v5;
  NSArray *valuesToDefaults;

  -[PKNumericSuggestionsEnterValueAlgorithm _generateDefaultSuggestions](self, "_generateDefaultSuggestions");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  defaultSuggestions = self->_defaultSuggestions;
  self->_defaultSuggestions = v3;

  -[PKNumericSuggestionsEnterValueAlgorithm _generateValuesToDefaults](self, "_generateValuesToDefaults");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  valuesToDefaults = self->_valuesToDefaults;
  self->_valuesToDefaults = v5;

}

- (id)_useMaxAmountSuggestion
{
  NSDecimalNumber *maxBalance;
  void *v4;
  NSDecimalNumber *maxLoadAmount;
  void *v6;
  void *v7;
  uint64_t v8;
  PKNumericSuggestion *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDecimalNumber *v13;
  NSDecimalNumber *v14;

  maxBalance = self->_maxBalance;
  if (maxBalance)
  {
    -[NSDecimalNumber decimalNumberBySubtracting:withBehavior:](maxBalance, "decimalNumberBySubtracting:withBehavior:", self->_cardBalance, self->_roundingBehavior);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  maxLoadAmount = self->_maxLoadAmount;
  if (maxLoadAmount && -[NSDecimalNumber compare:](maxLoadAmount, "compare:", v4) == NSOrderedAscending)
  {
    -[NSDecimalNumber decimalNumberByAdding:withBehavior:](self->_maxLoadAmount, "decimalNumberByAdding:withBehavior:", self->_cardBalance, self->_roundingBehavior);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "compare:", self->_maxBalance);

    if (v12 == 1)
    {
      -[NSDecimalNumber decimalNumberBySubtracting:withBehavior:](self->_maxBalance, "decimalNumberBySubtracting:withBehavior:", self->_cardBalance, self->_roundingBehavior);
      v13 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = self->_maxLoadAmount;
    }
    v14 = v13;

    v4 = v14;
    if (!v14)
      goto LABEL_15;
  }
  else if (!v4)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "compare:", v6))
  {

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "compare:", v7);

  if (v8 != 1)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  v9 = -[PKNumericSuggestion initWithValue:currencyCode:]([PKNumericSuggestion alloc], "initWithValue:currencyCode:", v4, self->_currencyCode);
  PKLocalizedPaymentString(CFSTR("NUMERIC_SUGGESTION_USE_MAXIMUM"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNumericSuggestion setDisplayValue:](v9, "setDisplayValue:", v10);

  -[PKNumericSuggestion setUsedMaximumSuggestion:](v9, "setUsedMaximumSuggestion:", 1);
LABEL_16:

  return v9;
}

- (id)_maxAmountSuggestion
{
  NSDecimalNumber *maxBalance;
  void *v4;
  NSDecimalNumber *maxLoadAmount;
  void *v6;
  void *v7;
  uint64_t v8;
  PKNumericSuggestion *v9;
  void *v10;
  uint64_t v11;

  maxBalance = self->_maxBalance;
  if (maxBalance)
  {
    -[NSDecimalNumber decimalNumberBySubtracting:withBehavior:](maxBalance, "decimalNumberBySubtracting:withBehavior:", self->_cardBalance, self->_roundingBehavior);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  maxLoadAmount = self->_maxLoadAmount;
  if (maxLoadAmount && -[NSDecimalNumber compare:](maxLoadAmount, "compare:", v4) == NSOrderedAscending)
  {
    -[NSDecimalNumber decimalNumberBySubtracting:withBehavior:](self->_maxLoadAmount, "decimalNumberBySubtracting:withBehavior:", self->_cardBalance, self->_roundingBehavior);
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v11;
    if (!v11)
      goto LABEL_13;
  }
  else if (!v4)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "compare:", v6))
  {

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "compare:", v7);

  if (v8 != 1)
  {
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  v9 = -[PKNumericSuggestion initWithValue:currencyCode:]([PKNumericSuggestion alloc], "initWithValue:currencyCode:", v4, self->_currencyCode);
  PKLocalizedPaymentString(CFSTR("NUMERIC_SUGGESTION_USE_MAXIMUM"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKNumericSuggestion setDisplayValue:](v9, "setDisplayValue:", v10);

  -[PKNumericSuggestion setUsedMaximumSuggestion:](v9, "setUsedMaximumSuggestion:", 1);
LABEL_14:

  return v9;
}

- (id)_generateDefaultSuggestions
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_defaultValues;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0CB3598], "zero", (_QWORD)v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "compare:", v10);

        if (v11 == 1)
        {
          +[PKNumericSuggestion suggestionWithValue:currencyCode:](PKNumericSuggestion, "suggestionWithValue:currencyCode:", v9, self->_currencyCode);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  self->_hasValidDefaultSuggestions = objc_msgSend(v15, "count") == 3;
  objc_msgSend(v15, "sortUsingComparator:", &__block_literal_global_48);
  v16 = (void *)objc_msgSend(v15, "copy");

  return v16;
}

uint64_t __70__PKNumericSuggestionsEnterValueAlgorithm__generateDefaultSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_generateValuesToDefaults
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSDecimalNumber *cardBalance;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_defaultSuggestions;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v7), "value");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        cardBalance = self->_cardBalance;
        v10 = v8;
        if (cardBalance)
        {
          objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[NSDecimalNumber isEqualToNumber:](cardBalance, "isEqualToNumber:", v11);

          v10 = v8;
          if ((v12 & 1) == 0)
          {
            objc_msgSend(v8, "decimalNumberBySubtracting:", self->_cardBalance);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v10, "compare:", v13);

        if (v14 == 1
          && (objc_msgSend(v10, "isEqualToNumber:", v8) & 1) == 0
          && -[PKNumericSuggestionsEnterValueAlgorithm _amountIsValid:](self, "_amountIsValid:", v10))
        {
          +[PKNumericSuggestion suggestionWithValue:currencyCode:](PKNumericSuggestion, "suggestionWithValue:currencyCode:", v10, self->_currencyCode);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v15);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  v16 = (void *)objc_msgSend(v18, "copy");
  return v16;
}

- (NSDecimalNumber)cardBalance
{
  return self->_cardBalance;
}

- (NSDecimalNumber)minBalance
{
  return self->_minBalance;
}

- (NSDecimalNumber)maxBalance
{
  return self->_maxBalance;
}

- (NSDecimalNumber)minLoadAmount
{
  return self->_minLoadAmount;
}

- (NSDecimalNumber)maxLoadAmount
{
  return self->_maxLoadAmount;
}

- (NSArray)defaultValues
{
  return self->_defaultValues;
}

- (unint64_t)powerOfTenFactor
{
  return self->_powerOfTenFactor;
}

- (int64_t)decimalPrecision
{
  return self->_decimalPrecision;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)hasValidDefaultSuggestions
{
  return self->_hasValidDefaultSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_maxLoadAmount, 0);
  objc_storeStrong((id *)&self->_minLoadAmount, 0);
  objc_storeStrong((id *)&self->_maxBalance, 0);
  objc_storeStrong((id *)&self->_minBalance, 0);
  objc_storeStrong((id *)&self->_cardBalance, 0);
  objc_storeStrong((id *)&self->_lastInput, 0);
  objc_storeStrong((id *)&self->_defaultSuggestions, 0);
  objc_storeStrong((id *)&self->_valuesToDefaults, 0);
  objc_storeStrong((id *)&self->_roundingBehavior, 0);
}

@end
