@implementation PKPaymentDataItem

+ (int64_t)dataType
{
  return -1;
}

- (int64_t)context
{
  return 0;
}

+ (BOOL)supportsMultipleItems
{
  return 0;
}

- (PKPaymentDataItem)initWithModel:(id)a3
{
  id v4;
  PKPaymentDataItem *v5;
  PKPaymentDataItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentDataItem;
  v5 = -[PKPaymentDataItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_model, v4);
    v6->_type = objc_msgSend((id)objc_opt_class(), "dataType");
    v6->_status = 0;
  }

  return v6;
}

- (NSArray)errors
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)paymentContactFormatErrors
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)isRejected
{
  return -[PKPaymentDataItem status](self, "status") == 1;
}

- (BOOL)isValidWithError:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (BOOL)validateBillingAddressForItem:(id)a3 billingAddress:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "errors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v8)
      goto LABEL_3;
LABEL_8:
    v13 = 0;
    if (!v10)
    {
LABEL_14:
      v14 = CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_REQUIRED_REASON");
      v15 = CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_REQUIRED");
      goto LABEL_15;
    }
LABEL_9:
    v15 = CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_INVALID");
    if (objc_msgSend(v10, "code") == 2)
    {
      objc_msgSend(v10, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "PKStringForKey:", CFSTR("PKPaymentErrorPostalAddress"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        v15 = CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_INCOMPLETE");
    }
    v14 = CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_INCOMPLETE_REASON");
    goto LABEL_15;
  }
  objc_msgSend(v7, "paymentContactFormatErrors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_8;
LABEL_3:
  objc_msgSend(v8, "postalAddresses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  v13 = v12 != 0;

  if (v10)
    goto LABEL_9;
  if (!v12)
  {
    v13 = 0;
    goto LABEL_14;
  }
  v13 = 1;
  if (!objc_msgSend(v7, "isRejected"))
  {
    v21 = 0;
    v19 = 0;
    goto LABEL_18;
  }
  v14 = CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_INCOMPLETE_REASON");
  v15 = CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_INVALID");
LABEL_15:
  PKLocalizedPaymentString(&v15->isa, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(&v14->isa, 0);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (a5)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D68];
    v27[0] = *MEMORY[0x1E0CB2D50];
    v27[1] = v23;
    v28[0] = v19;
    v28[1] = v20;
    v27[2] = CFSTR("PKPaymentErrorIsFieldEmpty");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3002, v25);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  LOBYTE(v13) = 0;
LABEL_18:

  return v13;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (PKPaymentAuthorizationDataModel)model
{
  return (PKPaymentAuthorizationDataModel *)objc_loadWeakRetained((id *)&self->_model);
}

- (void)setModel:(id)a3
{
  objc_storeWeak((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_model);
}

@end
