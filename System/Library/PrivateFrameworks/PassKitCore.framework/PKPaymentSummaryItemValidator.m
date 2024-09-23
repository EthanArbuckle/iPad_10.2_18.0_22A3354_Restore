@implementation PKPaymentSummaryItemValidator

+ (id)validatorWithObject:(id)a3
{
  id v3;
  __objc2_class *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = PKRecurringPaymentSummaryItemValidator;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = PKDeferredPaymentSummaryItemValidator;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = PKAutomaticReloadPaymentSummaryItemValidator;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = PKDisbursementSummaryItemValidator;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPaymentSummaryItem:", v3);
            goto LABEL_12;
          }
          v4 = PKInstantFundsOutFeeSummaryItemValidator;
        }
      }
    }
  }
  -[__objc2_class validatorWithObject:](v4, "validatorWithObject:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v6 = (void *)v5;

  return v6;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKPaymentSummaryItemValidator)initWithPaymentSummaryItem:(id)a3
{
  id v5;
  PKPaymentSummaryItemValidator *v6;
  PKPaymentSummaryItemValidator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSummaryItemValidator;
  v6 = -[PKPaymentSummaryItemValidator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKPaymentSummaryItemValidator isValidWithAPIType:withError:](self, "isValidWithAPIType:withError:", 0, a3);
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  char isKindOfClass;
  void *v8;
  void *v9;
  int v10;
  PKPaymentSummaryItem *item;
  uint64_t v12;
  int v13;
  id v14;
  char IsValidCurrencyAmount;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  PKPaymentSummaryItem *v25;
  uint64_t v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[PKPaymentSummaryItem amount](self->_item, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToNumber:", v9);

  if ((isKindOfClass & 1) == 0)
  {
    if (!a4)
    {
      IsValidCurrencyAmount = 0;
      v14 = 0;
      goto LABEL_24;
    }
    if ((unint64_t)(a3 - 1) >= 2)
      v16 = CFSTR("PKPaymentSummaryItem has an invalid label or amount property");
    else
      v16 = CFSTR("Line item has an invalid label or amount");
    goto LABEL_15;
  }
  item = self->_item;
  v12 = objc_opt_class();
  v34 = 0;
  v13 = _PKPaymentValidateProperty(item, CFSTR("label"), v12, 1, a3, (uint64_t)&v34);
  v14 = v34;
  if (((v13 ^ 1 | v10) & 1) != 0)
  {
    IsValidCurrencyAmount = 0;
  }
  else
  {
    if (-[PKPaymentSummaryItem type](self->_item, "type"))
    {
      IsValidCurrencyAmount = 1;
      goto LABEL_24;
    }
    v25 = self->_item;
    v26 = objc_opt_class();
    v33 = v14;
    v27 = _PKPaymentValidateProperty(v25, CFSTR("amount"), v26, 1, a3, (uint64_t)&v33);
    v28 = v33;

    if (v27)
    {
      -[PKPaymentSummaryItemValidator currencyCode](self, "currencyCode");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        IsValidCurrencyAmount = 1;
        v14 = v28;
        goto LABEL_24;
      }
      -[PKPaymentSummaryItem amount](self->_item, "amount");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSummaryItemValidator currencyCode](self, "currencyCode");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v28;
      IsValidCurrencyAmount = _PKPaymentIsValidCurrencyAmount(v30, v31, &v32);
      v14 = v32;

    }
    else
    {
      IsValidCurrencyAmount = 0;
      v14 = v28;
    }
  }
  if (a4 && (IsValidCurrencyAmount & 1) == 0)
  {
    if ((unint64_t)(a3 - 1) >= 2)
      v16 = CFSTR("PKPaymentSummaryItem has an invalid label or amount property");
    else
      v16 = CFSTR("Line item has an invalid label or amount");
    if (v14)
    {
      v17 = *MEMORY[0x1E0CB2D50];
LABEL_20:
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB3388];
      v35[0] = v17;
      v35[1] = v22;
      v36[0] = v16;
      v36[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v23);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      IsValidCurrencyAmount = 0;
      goto LABEL_24;
    }
LABEL_15:
    v18 = CFSTR("Unknown error occurred");
    if (v10)
      v18 = CFSTR("Item's amount is not a valid decimal number");
    if ((isKindOfClass & 1) == 0)
      v18 = CFSTR("Item is not a kind of PKPaymentSymmaryItem");
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    v37 = *MEMORY[0x1E0CB2D50];
    v38[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v20);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
LABEL_24:

  return IsValidCurrencyAmount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PKPaymentSummaryItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end
