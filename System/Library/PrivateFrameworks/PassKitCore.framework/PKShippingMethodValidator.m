@implementation PKShippingMethodValidator

+ (id)validatorWithObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithShippingMethod:", v3);

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKShippingMethodValidator)initWithShippingMethod:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKShippingMethodValidator;
  return -[PKPaymentSummaryItemValidator initWithPaymentSummaryItem:](&v4, sel_initWithPaymentSummaryItem_, a3);
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKShippingMethodValidator isValidWithAPIType:withError:](self, "isValidWithAPIType:withError:", 0, a3);
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  objc_super v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PKShippingMethodValidator;
  if (!-[PKPaymentSummaryItemValidator isValidWithAPIType:withError:](&v22, sel_isValidWithAPIType_withError_))
    goto LABEL_9;
  -[PKPaymentSummaryItemValidator item](self, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  -[PKPaymentSummaryItemValidator item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  if ((_PKPaymentValidateProperty(v8, CFSTR("identifier"), v9, 1, a3, (uint64_t)a4) & 1) == 0)
  {

LABEL_8:
    goto LABEL_9;
  }
  -[PKPaymentSummaryItemValidator item](self, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v12 = _PKPaymentValidateProperty(v10, CFSTR("detail"), v11, 0, a3, (uint64_t)a4);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSummaryItemValidator item](self, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "amount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "compare:", v15);

    if (v16 != 1)
      return 1;
  }
LABEL_9:
  if (a4)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    if ((unint64_t)(a3 - 1) >= 2)
      v19 = CFSTR("PKShippingMethod");
    else
      v19 = CFSTR("Shipping method");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ must have an identifier and an amount >= 0"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

@end
