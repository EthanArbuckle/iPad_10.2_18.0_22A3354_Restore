@implementation PKRecurringPaymentSummaryItemValidator

+ (id)validatorWithObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRecurringPaymentSummaryItem:", v3);

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKRecurringPaymentSummaryItemValidator)initWithRecurringPaymentSummaryItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKRecurringPaymentSummaryItemValidator;
  return -[PKPaymentSummaryItemValidator initWithPaymentSummaryItem:](&v4, sel_initWithPaymentSummaryItem_, a3);
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKRecurringPaymentSummaryItemValidator isValidWithAPIType:withError:](self, "isValidWithAPIType:withError:", 0, a3);
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  void (**v7)(void *, const __CFString *);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  objc_super v25;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKRecurringPaymentSummaryItemValidator_isValidWithAPIType_withError___block_invoke;
  aBlock[3] = &__block_descriptor_40_e27___NSError_16__0__NSString_8l;
  aBlock[4] = a3;
  v7 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
  v25.receiver = self;
  v25.super_class = (Class)PKRecurringPaymentSummaryItemValidator;
  if (-[PKPaymentSummaryItemValidator isValidWithAPIType:withError:](&v25, sel_isValidWithAPIType_withError_, a3, a4))
  {
    -[PKPaymentSummaryItemValidator item](self, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
LABEL_21:

      goto LABEL_22;
    }
    -[PKPaymentSummaryItemValidator item](self, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    if (!_PKPaymentValidateProperty(v9, CFSTR("startDate"), v10, 0, a3, (uint64_t)a4))
      goto LABEL_19;
    -[PKPaymentSummaryItemValidator item](self, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    v13 = _PKPaymentValidateProperty(v11, CFSTR("endDate"), v12, 0, a3, (uint64_t)a4);

    v14 = 0;
    if (v13)
    {
      -[PKPaymentSummaryItemValidator item](self, "item");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E2C3F118, &unk_1E2C3F130, &unk_1E2C3F148, &unk_1E2C3F160, &unk_1E2C3F178, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "intervalCount") > 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "intervalUnit"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v9, "containsObject:", v15);

        if ((v16 & 1) == 0)
        {
          if (a4)
          {
            v7[2](v7, CFSTR("must have a valid intervalUnit: year, month, day, hour or minute"));
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        objc_msgSend(v8, "startDate");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          objc_msgSend(v8, "endDate");
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = (void *)v19;
            objc_msgSend(v8, "startDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "endDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v21, "compare:", v22);

            if (v23 == 1)
            {
              if (a4)
              {
                v7[2](v7, CFSTR("must have a startDate earlier than or equal to endDate"));
LABEL_18:
                v14 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

                goto LABEL_21;
              }
              goto LABEL_19;
            }
          }
          else
          {

          }
        }
        v14 = 1;
        goto LABEL_20;
      }
      if (a4)
      {
        v7[2](v7, CFSTR("must have a intervalCount >= 1"));
        goto LABEL_18;
      }
LABEL_19:
      v14 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_22:

  return v14;
}

id __71__PKRecurringPaymentSummaryItemValidator_isValidWithAPIType_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(*(_QWORD *)(a1 + 32) - 1) >= 2)
    v2 = CFSTR("PKRecurringPaymentSummaryItem");
  else
    v2 = CFSTR("Recurring line item");
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v2, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
