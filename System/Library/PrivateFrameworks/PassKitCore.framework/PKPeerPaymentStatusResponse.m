@implementation PKPeerPaymentStatusResponse

- (PKPeerPaymentStatusResponse)initWithData:(id)a3
{
  PKPeerPaymentStatusResponse *v3;
  PKPeerPaymentStatusResponse *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *paymentIdentifier;
  uint64_t v12;
  NSString *transactionIdentifier;
  uint64_t v14;
  NSString *recurringPaymentIdentifier;
  uint64_t v16;
  NSArray *actions;
  void *v18;
  uint64_t v19;
  NSData *amountHash;
  uint64_t v21;
  NSObject *signature;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)PKPeerPaymentStatusResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v28, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(v6, "PKStringForKey:", CFSTR("status"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = PKPaymentTransactionStatusFromString(v7);
      if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 2)
        v9 = -1;
      else
        v9 = v8;
      v4->_status = v9;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("paymentIdentifier"));
      v10 = objc_claimAutoreleasedReturnValue();
      paymentIdentifier = v4->_paymentIdentifier;
      v4->_paymentIdentifier = (NSString *)v10;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("transactionIdentifier"));
      v12 = objc_claimAutoreleasedReturnValue();
      transactionIdentifier = v4->_transactionIdentifier;
      v4->_transactionIdentifier = (NSString *)v12;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("recurringPaymentIdentifier"));
      v14 = objc_claimAutoreleasedReturnValue();
      recurringPaymentIdentifier = v4->_recurringPaymentIdentifier;
      v4->_recurringPaymentIdentifier = (NSString *)v14;

      objc_msgSend(v6, "PKArrayForKey:", CFSTR("actions"));
      v16 = objc_claimAutoreleasedReturnValue();
      actions = v4->_actions;
      v4->_actions = (NSArray *)v16;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("amountHash"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pk_decodeHexadecimal");
      v19 = objc_claimAutoreleasedReturnValue();
      amountHash = v4->_amountHash;
      v4->_amountHash = (NSData *)v19;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("signature"));
      v21 = objc_claimAutoreleasedReturnValue();

      signature = v4->_signature;
      v4->_signature = (NSString *)v21;
    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      signature = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(signature, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v24;
        v31 = 2114;
        v32 = v26;
        _os_log_impl(&dword_18FC92000, signature, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }

  }
  return v4;
}

- (BOOL)amountHashIsValidForAmount:(id)a3 andCurrency:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  if (!self->_amountHash)
    return 1;
  v6 = a4;
  v7 = a3;
  PKMutableNumberFormatterForCurrencyCodeExcludingCurrencySymbols(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocale:", v9);

  objc_msgSend(v8, "stringFromNumber:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), self->_transactionIdentifier, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "SHA256Hash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = -[NSData isEqualToData:](self->_amountHash, "isEqualToData:", v13);
  else
    v14 = 0;

  return v14;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)paymentIdentifier
{
  return self->_paymentIdentifier;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSString)recurringPaymentIdentifier
{
  return self->_recurringPaymentIdentifier;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSData)amountHash
{
  return self->_amountHash;
}

- (NSString)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_amountHash, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_recurringPaymentIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentIdentifier, 0);
}

@end
