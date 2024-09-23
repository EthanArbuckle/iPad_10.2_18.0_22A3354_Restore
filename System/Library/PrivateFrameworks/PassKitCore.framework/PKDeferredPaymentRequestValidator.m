@implementation PKDeferredPaymentRequestValidator

+ (id)validatorWithObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeferredPaymentRequest:", v3);

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKDeferredPaymentRequestValidator)initWithDeferredPaymentRequest:(id)a3
{
  id v5;
  PKDeferredPaymentRequestValidator *v6;
  PKDeferredPaymentRequestValidator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDeferredPaymentRequestValidator;
  v6 = -[PKDeferredPaymentRequestValidator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_deferredPaymentRequest, a3);

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKDeferredPaymentRequestValidator isValidWithAPIType:withError:](self, "isValidWithAPIType:withError:", 0, a3);
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  PKDeferredPaymentRequest *deferredPaymentRequest;
  uint64_t v8;
  uint64_t v9;
  id v10;
  PKDeferredPaymentRequest *v11;
  uint64_t v12;
  int v13;
  id v14;
  PKDeferredPaymentRequest *v15;
  uint64_t v16;
  PKDeferredPaymentRequest *v17;
  uint64_t v18;
  int v19;
  PKDeferredPaymentRequest *v20;
  uint64_t v21;
  void *v22;
  PKDeferredPaymentSummaryItemValidator *v23;
  void *v24;
  id v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  _BOOL4 v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v9) = 0;
    v10 = 0;
    if (!a4)
      goto LABEL_21;
    goto LABEL_17;
  }
  deferredPaymentRequest = self->_deferredPaymentRequest;
  v8 = objc_opt_class();
  v41 = 0;
  LODWORD(v9) = _PKPaymentValidateProperty(deferredPaymentRequest, CFSTR("paymentDescription"), v8, 1, a3, (uint64_t)&v41);
  v10 = v41;
  if (!(_DWORD)v9)
  {
LABEL_16:
    if (!a4)
      goto LABEL_21;
    goto LABEL_17;
  }
  v11 = self->_deferredPaymentRequest;
  v12 = objc_opt_class();
  v40 = v10;
  v13 = _PKPaymentValidateProperty(v11, CFSTR("billingAgreement"), v12, 0, a3, (uint64_t)&v40);
  v14 = v40;

  if (!v13)
    goto LABEL_15;
  v15 = self->_deferredPaymentRequest;
  v16 = objc_opt_class();
  v39 = v14;
  LODWORD(v9) = _PKPaymentValidateProperty(v15, CFSTR("managementURL"), v16, 1, a3, (uint64_t)&v39);
  v10 = v39;

  if (!(_DWORD)v9)
    goto LABEL_16;
  v17 = self->_deferredPaymentRequest;
  v18 = objc_opt_class();
  v38 = v10;
  v19 = _PKPaymentValidateProperty(v17, CFSTR("tokenNotificationURL"), v18, 0, a3, (uint64_t)&v38);
  v14 = v38;

  if (!v19)
  {
LABEL_15:
    LOBYTE(v9) = 0;
    v10 = v14;
    goto LABEL_16;
  }
  v20 = self->_deferredPaymentRequest;
  v21 = objc_opt_class();
  v37 = v14;
  LODWORD(v9) = _PKPaymentValidateProperty(v20, CFSTR("deferredBilling"), v21, 1, a3, (uint64_t)&v37);
  v10 = v37;

  if (!(_DWORD)v9)
    goto LABEL_16;
  -[PKDeferredPaymentRequest deferredBilling](self->_deferredPaymentRequest, "deferredBilling");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PKPaymentSummaryItemValidator initWithPaymentSummaryItem:]([PKDeferredPaymentSummaryItemValidator alloc], "initWithPaymentSummaryItem:", v22);
  -[PKDeferredPaymentRequestValidator currencyCode](self, "currencyCode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSummaryItemValidator setCurrencyCode:](v23, "setCurrencyCode:", v24);

  v36 = v10;
  LODWORD(v24) = -[PKDeferredPaymentSummaryItemValidator isValidWithAPIType:withError:](v23, "isValidWithAPIType:withError:", a3, &v36);
  v25 = v36;

  if ((_DWORD)v24)
  {
    -[PKDeferredPaymentRequest freeCancellationDate](self->_deferredPaymentRequest, "freeCancellationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26 == 0;

    -[PKDeferredPaymentRequest freeCancellationDateTimeZone](self->_deferredPaymentRequest, "freeCancellationDateTimeZone");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 != 0;

    if (((v27 ^ v29) & 1) != 0)
    {
      -[PKDeferredPaymentRequest deferredBilling](self->_deferredPaymentRequest, "deferredBilling");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v9, "deferredDate");
      v30 = (id)objc_claimAutoreleasedReturnValue();

      -[PKDeferredPaymentRequest freeCancellationDate](self->_deferredPaymentRequest, "freeCancellationDate");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      LOBYTE(v9) = 1;
      if (v30 && v31 && objc_msgSend(v30, "compare:", v31) == -1)
      {
        v9 = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend((id)v9, "setObject:forKey:", CFSTR("A deferred payment request's deferred billing date cannot be before its freeCancellationDate"), *MEMORY[0x1E0CB2D50]);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v9);
        v33 = objc_claimAutoreleasedReturnValue();

        LOBYTE(v9) = 0;
        v25 = (id)v33;
      }
    }
    else
    {
      v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v30);
      LOBYTE(v9) = 0;
      v32 = v25;
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }
  v10 = v25;
  if (a4)
  {
LABEL_17:
    if ((v9 & 1) == 0)
    {
      v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v34, "setObject:forKey:", CFSTR("Invalid deferred payment request"), *MEMORY[0x1E0CB2D50]);
      if (v10)
        objc_msgSend(v34, "setObject:forKey:", v10, *MEMORY[0x1E0CB3388]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v34);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_21:

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

- (PKDeferredPaymentRequest)deferredPaymentRequest
{
  return self->_deferredPaymentRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredPaymentRequest, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end
