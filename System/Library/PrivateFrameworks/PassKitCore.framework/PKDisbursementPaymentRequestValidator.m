@implementation PKDisbursementPaymentRequestValidator

+ (id)validatorWithObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "validatorWithObject:shouldSkipValidation:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validatorWithObject:(id)a3 shouldSkipValidation:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDisbursementPaymentRequest:shouldSkipSummaryItemValidation:", v5, v4);

  return v6;
}

+ (Class)validatedClass
{
  return (Class)objc_opt_class();
}

- (PKDisbursementPaymentRequestValidator)initWithDisbursementPaymentRequest:(id)a3
{
  return -[PKDisbursementPaymentRequestValidator initWithDisbursementPaymentRequest:shouldSkipSummaryItemValidation:](self, "initWithDisbursementPaymentRequest:shouldSkipSummaryItemValidation:", a3, 0);
}

- (PKDisbursementPaymentRequestValidator)initWithDisbursementPaymentRequest:(id)a3 shouldSkipSummaryItemValidation:(BOOL)a4
{
  id v7;
  PKDisbursementPaymentRequestValidator *v8;
  PKDisbursementPaymentRequestValidator *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDisbursementPaymentRequestValidator;
  v8 = -[PKDisbursementPaymentRequestValidator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_disbursementPaymentRequest, a3);
    v9->_shouldSkipSummaryItemValidation = a4;
  }

  return v9;
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKDisbursementPaymentRequestValidator isValidWithAPIType:withError:](self, "isValidWithAPIType:withError:", 0, a3);
}

- (BOOL)isValidWithAPIType:(int64_t)a3 withError:(id *)a4
{
  __CFString *v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  PKMerchantCapability v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  __CFString **v19;
  __CFString **v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  __CFString **v27;
  __CFString *v28;
  void *v29;
  PKDisbursementPaymentRequest *disbursementPaymentRequest;
  void *v31;
  id v32;
  _QWORD aBlock[5];
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self->_shouldSkipSummaryItemValidation)
    {
      v7 = 0;
      v8 = 0;
      v9 = 1;
      goto LABEL_20;
    }
    -[PKPaymentRequest paymentSummaryItems](self->_disbursementPaymentRequest, "paymentSummaryItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    LOBYTE(v12) = objc_msgSend((id)v12, "isEqual:", objc_opt_class());

    if ((v12 & 1) != 0)
    {
      objc_msgSend(v10, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_class();
      LOBYTE(v14) = objc_msgSend((id)v14, "isEqual:", objc_opt_class());

      if ((v14 & 1) != 0)
      {
        v15 = -[PKPaymentRequest merchantCapabilities](self->_disbursementPaymentRequest, "merchantCapabilities");
        objc_msgSend(v10, "pk_firstObjectPassingTest:", &__block_literal_global_145);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        v18 = v16 != 0;
        if ((v15 & 0x80) == 0 || v16)
        {
          v7 = 0;
          if ((v15 & 0x80) != 0 || !v16)
          {
LABEL_25:

            if (((v15 >> 7) & 1) == v18)
            {
              objc_msgSend(v10, "pk_objectsPassingTest:", &__block_literal_global_307);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(v26, "count") < 2)
              {

                objc_msgSend(v10, "pk_objectsPassingTest:", &__block_literal_global_308);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if ((unint64_t)objc_msgSend(v26, "count") < 2)
                {

                  aBlock[0] = MEMORY[0x1E0C809B0];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __70__PKDisbursementPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_4;
                  aBlock[3] = &unk_1E2AD3968;
                  aBlock[4] = self;
                  v29 = _Block_copy(aBlock);
                  disbursementPaymentRequest = self->_disbursementPaymentRequest;
                  v31 = (void *)objc_opt_class();
                  v32 = 0;
                  v9 = _PKPaymentValidatePropertyArray(disbursementPaymentRequest, CFSTR("paymentSummaryItems"), v31, v29, 1, a3, (uint64_t)&v32);
                  v8 = v32;

LABEL_15:
                  if (!a4)
                    goto LABEL_20;
                  goto LABEL_16;
                }
                v27 = &PKDisbursementRequestValidationErrorMultipleDisbursementSummaryItems;
              }
              else
              {
                v27 = PKDisbursementRequestValidationErrorMultipleIFOSummaryItems;
              }
              v28 = *v27;

              v9 = 0;
              v8 = 0;
              v7 = v28;
              goto LABEL_15;
            }
LABEL_14:
            v9 = 0;
            v8 = 0;
            goto LABEL_15;
          }
          v19 = PKDisbursementRequestValidationErrorIFOSummaryItemButNoIFOCapability;
        }
        else
        {
          v19 = PKDisbursementRequestValidationErrorIFOCapabilityButNoIFOSummaryItem;
        }
        v7 = *v19;
        goto LABEL_25;
      }
      v20 = PKDisbursementRequestValidationErrorFinalSummaryItemNotDisbursementSummaryItem;
    }
    else
    {
      v20 = PKDisbursementRequestValidationErrorFirstSummaryItemNotPaymentSummaryItem;
    }
    v7 = *v20;
    goto LABEL_14;
  }
  v9 = 0;
  v7 = 0;
  v8 = 0;
  if (!a4)
    goto LABEL_20;
LABEL_16:
  if ((v9 & 1) == 0)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("Invalid Disbursement request"), *MEMORY[0x1E0CB2D50]);
    if (!v8)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v34 = v22;
      v35[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v24);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }
LABEL_20:

  return v9;
}

uint64_t __70__PKDisbursementPaymentRequestValidator_isValidWithAPIType_withError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__PKDisbursementPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__PKDisbursementPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __70__PKDisbursementPaymentRequestValidator_isValidWithAPIType_withError___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v4 = v6;
    objc_msgSend(v3, "currencyCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCurrencyCode:", v5);

  }
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PKDisbursementPaymentRequest)disbursementPaymentRequest
{
  return self->_disbursementPaymentRequest;
}

- (BOOL)shouldSkipSummaryItemValidation
{
  return self->_shouldSkipSummaryItemValidation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disbursementPaymentRequest, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end
