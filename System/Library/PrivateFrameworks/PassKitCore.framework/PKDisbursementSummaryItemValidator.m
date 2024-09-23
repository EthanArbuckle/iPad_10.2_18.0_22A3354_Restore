@implementation PKDisbursementSummaryItemValidator

+ (id)validatorWithObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDisbursementSummaryItem:", v3);

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKDisbursementSummaryItemValidator)initWithDisbursementSummaryItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDisbursementSummaryItemValidator;
  return -[PKPaymentSummaryItemValidator initWithPaymentSummaryItem:](&v4, sel_initWithPaymentSummaryItem_, a3);
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKDisbursementSummaryItemValidator isValidWithAPIType:withError:](self, "isValidWithAPIType:withError:", 0, a3);
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKDisbursementSummaryItemValidator;
  v6 = -[PKPaymentSummaryItemValidator isValidWithAPIType:withError:](&v16, sel_isValidWithAPIType_withError_, a3);
  -[PKPaymentSummaryItemValidator item](self, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "amount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "pk_isNegativeNumber");

    if (!v10)
    {
      v13 = 0;
      LOBYTE(a4) = 1;
      goto LABEL_8;
    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("PKDisbursementSummaryItem amount must be non-negative");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
      goto LABEL_8;
    goto LABEL_6;
  }
  v13 = 0;
  if (a4)
  {
LABEL_6:
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("PKDisbursementSummaryItem has an invalid amount"), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }
LABEL_8:

  return (char)a4;
}

@end
