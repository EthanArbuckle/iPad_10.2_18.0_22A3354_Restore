@implementation PKAutomaticReloadPaymentRequestValidator

+ (id)validatorWithObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAutomaticReloadPaymentRequest:", v3);

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKAutomaticReloadPaymentRequestValidator)initWithAutomaticReloadPaymentRequest:(id)a3
{
  id v5;
  PKAutomaticReloadPaymentRequestValidator *v6;
  PKAutomaticReloadPaymentRequestValidator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAutomaticReloadPaymentRequestValidator;
  v6 = -[PKAutomaticReloadPaymentRequestValidator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_automaticReloadPaymentRequest, a3);

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKAutomaticReloadPaymentRequestValidator isValidWithAPIType:withError:](self, "isValidWithAPIType:withError:", 0, a3);
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  unint64_t v7;
  PKAutomaticReloadPaymentRequest *automaticReloadPaymentRequest;
  uint64_t v9;
  int v10;
  id v11;
  PKAutomaticReloadPaymentRequest *v12;
  uint64_t v13;
  int v14;
  id v15;
  PKAutomaticReloadPaymentRequest *v16;
  uint64_t v17;
  PKAutomaticReloadPaymentRequest *v18;
  uint64_t v19;
  int v20;
  id v21;
  PKAutomaticReloadPaymentRequest *v22;
  uint64_t v23;
  void *v24;
  PKAutomaticReloadPaymentSummaryItemValidator *v25;
  void *v26;
  id v27;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v7 = -[PKAutomaticReloadPaymentRequestValidator requestType](self, "requestType");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    automaticReloadPaymentRequest = self->_automaticReloadPaymentRequest;
    v9 = objc_opt_class();
    v35 = 0;
    v10 = _PKPaymentValidateProperty(automaticReloadPaymentRequest, CFSTR("paymentDescription"), v9, 1, a3, (uint64_t)&v35);
    v11 = v35;
    if (v10)
    {
      v12 = self->_automaticReloadPaymentRequest;
      v13 = objc_opt_class();
      v34 = v11;
      v14 = _PKPaymentValidateProperty(v12, CFSTR("billingAgreement"), v13, 0, a3, (uint64_t)&v34);
      v15 = v34;

      if (v14)
      {
        v16 = self->_automaticReloadPaymentRequest;
        v17 = objc_opt_class();
        v33 = v15;
        v10 = _PKPaymentValidateProperty(v16, CFSTR("managementURL"), v17, v7 != 8, a3, (uint64_t)&v33);
        v11 = v33;

        if (v10)
        {
          v18 = self->_automaticReloadPaymentRequest;
          v19 = objc_opt_class();
          v32 = v11;
          v20 = _PKPaymentValidateProperty(v18, CFSTR("tokenNotificationURL"), v19, 0, a3, (uint64_t)&v32);
          v21 = v32;

          if (v20)
          {
            v22 = self->_automaticReloadPaymentRequest;
            v23 = objc_opt_class();
            v31 = v21;
            v10 = _PKPaymentValidateProperty(v22, CFSTR("automaticReloadBilling"), v23, 1, a3, (uint64_t)&v31);
            v11 = v31;

            if (v10)
            {
              -[PKAutomaticReloadPaymentRequest automaticReloadBilling](self->_automaticReloadPaymentRequest, "automaticReloadBilling");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = -[PKPaymentSummaryItemValidator initWithPaymentSummaryItem:]([PKAutomaticReloadPaymentSummaryItemValidator alloc], "initWithPaymentSummaryItem:", v24);
              -[PKAutomaticReloadPaymentRequestValidator currencyCode](self, "currencyCode");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPaymentSummaryItemValidator setCurrencyCode:](v25, "setCurrencyCode:", v26);

              v30 = v11;
              LOBYTE(v10) = -[PKAutomaticReloadPaymentSummaryItemValidator isValidWithAPIType:withError:](v25, "isValidWithAPIType:withError:", a3, &v30);
              v27 = v30;

              v11 = v27;
            }
          }
          else
          {
            LOBYTE(v10) = 0;
            v11 = v21;
          }
        }
      }
      else
      {
        LOBYTE(v10) = 0;
        v11 = v15;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
    v11 = 0;
  }
  if (a4 && (v10 & 1) == 0)
  {
    v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v28, "setObject:forKey:", CFSTR("Invalid automatic reload payment request"), *MEMORY[0x1E0CB2D50]);
    if (v11)
      objc_msgSend(v28, "setObject:forKey:", v11, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v28);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PKAutomaticReloadPaymentRequest)automaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end
