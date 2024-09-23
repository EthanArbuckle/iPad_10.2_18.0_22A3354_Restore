@implementation PKAutomaticReloadPaymentSummaryItemValidator

+ (id)validatorWithObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAutomaticReloadPaymentSummaryItem:", v3);

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKAutomaticReloadPaymentSummaryItemValidator)initWithAutomaticReloadPaymentSummaryItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAutomaticReloadPaymentSummaryItemValidator;
  return -[PKPaymentSummaryItemValidator initWithPaymentSummaryItem:](&v4, sel_initWithPaymentSummaryItem_, a3);
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKAutomaticReloadPaymentSummaryItemValidator isValidWithAPIType:withError:](self, "isValidWithAPIType:withError:", 0, a3);
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int IsValidCurrencyAmount;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  id v24;
  id v26;
  id v27;
  objc_super v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)PKAutomaticReloadPaymentSummaryItemValidator;
  if (!-[PKPaymentSummaryItemValidator isValidWithAPIType:withError:](&v28, sel_isValidWithAPIType_withError_))
  {
    LOBYTE(v9) = 0;
    v10 = 0;
LABEL_8:
    if (!a4)
      goto LABEL_14;
    goto LABEL_9;
  }
  -[PKPaymentSummaryItemValidator item](self, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v27 = 0;
  v9 = _PKPaymentValidateProperty(v7, CFSTR("thresholdAmount"), v8, 1, a3, (uint64_t)&v27);
  v10 = v27;

  if (!v9)
    goto LABEL_8;
  -[PKPaymentSummaryItemValidator currencyCode](self, "currencyCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    LOBYTE(v9) = 1;
    goto LABEL_14;
  }
  -[PKPaymentSummaryItemValidator item](self, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "thresholdAmount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSummaryItemValidator currencyCode](self, "currencyCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v10;
  IsValidCurrencyAmount = _PKPaymentIsValidCurrencyAmount(v13, v14, &v26);
  v16 = v26;

  if (IsValidCurrencyAmount)
  {
    objc_msgSend(v12, "thresholdAmount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToNumber:", v18);

    if (v19)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      v30[0] = CFSTR("PKAutomaticReloadPaymentSummaryItem thresholdAmount value can't be NaN");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v21);
      v22 = objc_claimAutoreleasedReturnValue();

      LOBYTE(v9) = 0;
      v16 = (id)v22;
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  v10 = v16;
  if (a4)
  {
LABEL_9:
    if ((v9 & 1) == 0)
    {
      if ((unint64_t)(a3 - 1) >= 2)
        v23 = CFSTR("PKAutomaticReloadPaymentSummaryItem has an invalid amount");
      else
        v23 = CFSTR("Automatic reload item has an invalid amount");
      v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CB2D50]);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB3388]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(v9) = 0;
    }
  }
LABEL_14:

  return v9;
}

@end
