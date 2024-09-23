@implementation PKPaymentPrepareTransactionDetailsResponse

- (PKPaymentPrepareTransactionDetailsResponse)initWithData:(id)a3
{
  PKPaymentPrepareTransactionDetailsResponse *v3;
  PKPaymentPrepareTransactionDetailsResponse *v4;
  void *v5;
  uint64_t v6;
  NSDecimalNumber *amount;
  uint64_t v8;
  PKPaymentPrepareTransactionDetailsResponse *secureElementIdentifier;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentPrepareTransactionDetailsResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v16, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&v4->_instructionsDictionary, v5);
      -[NSDictionary PKDecimalNumberFromStringForKey:](v4->_instructionsDictionary, "PKDecimalNumberFromStringForKey:", CFSTR("amount"));
      v6 = objc_claimAutoreleasedReturnValue();
      amount = v4->_amount;
      v4->_amount = (NSDecimalNumber *)v6;

      -[NSDictionary objectForKey:](v4->_instructionsDictionary, "objectForKey:", CFSTR("seId"));
      v8 = objc_claimAutoreleasedReturnValue();
      secureElementIdentifier = (PKPaymentPrepareTransactionDetailsResponse *)v4->_secureElementIdentifier;
      v4->_secureElementIdentifier = (NSString *)v8;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        v19 = 2112;
        v20 = v13;
        v14 = v13;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      secureElementIdentifier = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (NSDictionary)instructionsDictionary
{
  return self->_instructionsDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionsDictionary, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
