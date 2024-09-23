@implementation PKPaymentTokenContextValidator

+ (id)validatorWithObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPaymentTokenContext:", v3);

  return v4;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKPaymentTokenContextValidator)initWithPaymentTokenContext:(id)a3
{
  id v5;
  PKPaymentTokenContextValidator *v6;
  PKPaymentTokenContextValidator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTokenContextValidator;
  v6 = -[PKPaymentTokenContextValidator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKPaymentTokenContextValidator isValidWithAPIType:withError:](self, "isValidWithAPIType:withError:", 0, a3);
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  PKPaymentTokenContext *context;
  uint64_t v8;
  int v9;
  id v10;
  PKPaymentTokenContext *v11;
  uint64_t v12;
  id v13;
  PKPaymentTokenContext *v14;
  uint64_t v15;
  PKPaymentTokenContext *v16;
  uint64_t v17;
  int v18;
  PKPaymentTokenContext *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  const __CFString *v24;
  id v25;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    context = self->_context;
    v8 = objc_opt_class();
    v36 = 0;
    v9 = _PKPaymentValidateProperty(context, CFSTR("merchantIdentifier"), v8, 1, a3, (uint64_t)&v36);
    v10 = v36;
    if (!v9)
      goto LABEL_14;
    v11 = self->_context;
    v12 = objc_opt_class();
    v35 = v10;
    v9 = _PKPaymentValidateProperty(v11, CFSTR("externalIdentifier"), v12, 1, a3, (uint64_t)&v35);
    v13 = v35;

    if (v9)
    {
      v14 = self->_context;
      v15 = objc_opt_class();
      v34 = v13;
      v9 = _PKPaymentValidateProperty(v14, CFSTR("merchantName"), v15, 1, a3, (uint64_t)&v34);
      v10 = v34;

      if (!v9)
        goto LABEL_14;
      v16 = self->_context;
      v17 = objc_opt_class();
      v33 = v10;
      v18 = _PKPaymentValidateProperty(v16, CFSTR("merchantDomain"), v17, 0, a3, (uint64_t)&v33);
      v13 = v33;

      if (v18)
      {
        v19 = self->_context;
        v20 = objc_opt_class();
        v32 = v13;
        v9 = _PKPaymentValidateProperty(v19, CFSTR("amount"), v20, 1, a3, (uint64_t)&v32);
        v10 = v32;

        if (v9)
        {
          -[PKPaymentTokenContext amount](self->_context, "amount");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqualToNumber:", v22);

          if ((v23 & 1) != 0)
          {
            LOBYTE(v9) = 0;
            if (!a4)
              goto LABEL_20;
          }
          else
          {
            -[PKPaymentTokenContextValidator currencyCode](self, "currencyCode");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v27)
            {
              LOBYTE(v9) = 1;
              goto LABEL_20;
            }
            -[PKPaymentTokenContext amount](self->_context, "amount");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentTokenContextValidator currencyCode](self, "currencyCode");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v10;
            LOBYTE(v9) = _PKPaymentIsValidCurrencyAmount(v28, v29, &v31);
            v30 = v31;

            v10 = v30;
            if (!a4)
              goto LABEL_20;
          }
          goto LABEL_15;
        }
LABEL_14:
        if (!a4)
          goto LABEL_20;
        goto LABEL_15;
      }
      LOBYTE(v9) = 0;
    }
    v10 = v13;
    goto LABEL_14;
  }
  LOBYTE(v9) = 0;
  v10 = 0;
  if (!a4)
    goto LABEL_20;
LABEL_15:
  if ((v9 & 1) == 0)
  {
    if ((unint64_t)(a3 - 1) >= 2)
      v24 = CFSTR("PKPaymentTokenContext invalid");
    else
      v24 = CFSTR("Payment token context invalid");
    v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v25);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(v9) = 0;
  }
LABEL_20:

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

- (PKPaymentTokenContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end
