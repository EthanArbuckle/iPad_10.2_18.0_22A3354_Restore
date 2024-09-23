@implementation PKDeferredPaymentSummaryItemValidator

+ (id)validatorWithObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeferredPaymentSummaryItem:", v3);

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKDeferredPaymentSummaryItemValidator)initWithDeferredPaymentSummaryItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDeferredPaymentSummaryItemValidator;
  return -[PKPaymentSummaryItemValidator initWithPaymentSummaryItem:](&v4, sel_initWithPaymentSummaryItem_, a3);
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKDeferredPaymentSummaryItemValidator isValidWithAPIType:withError:](self, "isValidWithAPIType:withError:", 0, a3);
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PKDeferredPaymentSummaryItemValidator;
  if (-[PKPaymentSummaryItemValidator isValidWithAPIType:withError:](&v21, sel_isValidWithAPIType_withError_))
  {
    -[PKPaymentSummaryItemValidator item](self, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
    -[PKPaymentSummaryItemValidator item](self, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    v10 = _PKPaymentValidateProperty(v8, CFSTR("deferredDate"), v9, 1, a3, (uint64_t)a4);

    if (v10)
    {
      -[PKPaymentSummaryItemValidator item](self, "item");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deferredDate");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_13;
      v12 = (void *)v11;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deferredDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "compare:", v14);

      if (v15 != 1)
      {
LABEL_13:
        LOBYTE(a4) = 1;
        goto LABEL_14;
      }
      if (!a4)
      {
LABEL_14:

        return (char)a4;
      }
      if ((unint64_t)(a3 - 1) >= 2)
        v16 = CFSTR("PKDeferredPaymentSummaryItem");
      else
        v16 = CFSTR("Deferred line item");
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ must have a deferredDate later than current date"), v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
      LOBYTE(a4) = 0;
      goto LABEL_14;
    }
  }
  LOBYTE(a4) = 0;
  return (char)a4;
}

@end
