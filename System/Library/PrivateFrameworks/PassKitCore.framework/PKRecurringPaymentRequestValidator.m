@implementation PKRecurringPaymentRequestValidator

+ (id)validatorWithObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRecurringPaymentRequest:", v3);

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKRecurringPaymentRequestValidator)initWithRecurringPaymentRequest:(id)a3
{
  id v5;
  PKRecurringPaymentRequestValidator *v6;
  PKRecurringPaymentRequestValidator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKRecurringPaymentRequestValidator;
  v6 = -[PKRecurringPaymentRequestValidator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_recurringPaymentRequest, a3);

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKRecurringPaymentRequestValidator isValidWithAPIType:withError:](self, "isValidWithAPIType:withError:", 0, a3);
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  PKRecurringPaymentRequest *recurringPaymentRequest;
  uint64_t v8;
  int v9;
  id v10;
  PKRecurringPaymentRequest *v11;
  uint64_t v12;
  int v13;
  id v14;
  PKRecurringPaymentRequest *v15;
  uint64_t v16;
  PKRecurringPaymentRequest *v17;
  uint64_t v18;
  int v19;
  PKRecurringPaymentRequest *v20;
  uint64_t v21;
  PKRecurringPaymentRequest *v22;
  uint64_t v23;
  int v24;
  void *v25;
  PKRecurringPaymentSummaryItemValidator *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  PKRecurringPaymentSummaryItemValidator *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    v10 = 0;
    goto LABEL_11;
  }
  recurringPaymentRequest = self->_recurringPaymentRequest;
  v8 = objc_opt_class();
  v44 = 0;
  v9 = _PKPaymentValidateProperty(recurringPaymentRequest, CFSTR("paymentDescription"), v8, 1, a3, (uint64_t)&v44);
  v10 = v44;
  if (v9)
  {
    v11 = self->_recurringPaymentRequest;
    v12 = objc_opt_class();
    v43 = v10;
    v13 = _PKPaymentValidateProperty(v11, CFSTR("billingAgreement"), v12, 0, a3, (uint64_t)&v43);
    v14 = v43;

    if (!v13)
      goto LABEL_10;
    v15 = self->_recurringPaymentRequest;
    v16 = objc_opt_class();
    v42 = v14;
    v9 = _PKPaymentValidateProperty(v15, CFSTR("managementURL"), v16, 1, a3, (uint64_t)&v42);
    v10 = v42;

    if (v9)
    {
      v17 = self->_recurringPaymentRequest;
      v18 = objc_opt_class();
      v41 = v10;
      v19 = _PKPaymentValidateProperty(v17, CFSTR("tokenNotificationURL"), v18, 0, a3, (uint64_t)&v41);
      v14 = v41;

      if (!v19)
        goto LABEL_10;
      v20 = self->_recurringPaymentRequest;
      v21 = objc_opt_class();
      v40 = v14;
      v9 = _PKPaymentValidateProperty(v20, CFSTR("regularBilling"), v21, 1, a3, (uint64_t)&v40);
      v10 = v40;

      if (v9)
      {
        v22 = self->_recurringPaymentRequest;
        v23 = objc_opt_class();
        v39 = v10;
        v24 = _PKPaymentValidateProperty(v22, CFSTR("trialBilling"), v23, 0, a3, (uint64_t)&v39);
        v14 = v39;

        if (v24)
        {
          -[PKRecurringPaymentRequest regularBilling](self->_recurringPaymentRequest, "regularBilling");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[PKPaymentSummaryItemValidator initWithPaymentSummaryItem:]([PKRecurringPaymentSummaryItemValidator alloc], "initWithPaymentSummaryItem:", v25);
          -[PKRecurringPaymentRequestValidator currencyCode](self, "currencyCode");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentSummaryItemValidator setCurrencyCode:](v26, "setCurrencyCode:", v27);

          v38 = v14;
          v9 = -[PKRecurringPaymentSummaryItemValidator isValidWithAPIType:withError:](v26, "isValidWithAPIType:withError:", a3, &v38);
          v10 = v38;

          goto LABEL_11;
        }
LABEL_10:
        v9 = 0;
        v10 = v14;
      }
    }
  }
LABEL_11:
  -[PKRecurringPaymentRequest trialBilling](self->_recurringPaymentRequest, "trialBilling");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v9 && v28)
  {
    v30 = -[PKPaymentSummaryItemValidator initWithPaymentSummaryItem:]([PKRecurringPaymentSummaryItemValidator alloc], "initWithPaymentSummaryItem:", v28);
    -[PKRecurringPaymentRequestValidator currencyCode](self, "currencyCode");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSummaryItemValidator setCurrencyCode:](v30, "setCurrencyCode:", v31);

    v37 = v10;
    LOBYTE(v9) = -[PKRecurringPaymentSummaryItemValidator isValidWithAPIType:withError:](v30, "isValidWithAPIType:withError:", a3, &v37);
    v32 = v37;

    v10 = v32;
  }
  if (a4 && (v9 & 1) == 0)
  {
    v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v33, "setObject:forKeyedSubscript:", CFSTR("Invalid recurring payment request."), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB3388]);
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = (void *)objc_msgSend(v33, "copy");
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v35);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PKRecurringPaymentRequest)recurringPaymentRequest
{
  return self->_recurringPaymentRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurringPaymentRequest, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end
