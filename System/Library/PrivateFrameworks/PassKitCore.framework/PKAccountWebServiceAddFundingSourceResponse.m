@implementation PKAccountWebServiceAddFundingSourceResponse

- (PKAccountWebServiceAddFundingSourceResponse)initWithData:(id)a3
{
  PKAccountWebServiceAddFundingSourceResponse *v3;
  PKAccountWebServiceAddFundingSourceResponse *v4;
  void *v5;
  id v6;
  void *v7;
  PKApplyVerificationPage *v8;
  PKApplyVerificationPage *confirmationPage;
  PKAccountPaymentFundingSource *v10;
  PKAccountPaymentFundingSource *fundingSource;
  PKAccountWebServiceAddFundingSourceResponse *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)PKAccountWebServiceAddFundingSourceResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v19, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
  {
LABEL_6:
    v12 = v4;
    goto LABEL_10;
  }
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "objectForKey:", CFSTR("confirmationPage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v8 = -[PKApplyVerificationPage initWithDictonary:]([PKApplyVerificationPage alloc], "initWithDictonary:", v7);
      confirmationPage = v4->_confirmationPage;
      v4->_confirmationPage = v8;

    }
    v10 = -[PKAccountPaymentFundingSource initWithDictionary:]([PKAccountPaymentFundingSource alloc], "initWithDictionary:", v6);

    fundingSource = v4->_fundingSource;
    v4->_fundingSource = v10;

    goto LABEL_6;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    v22 = 2114;
    v23 = v17;
    _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (PKAccountPaymentFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (PKApplyVerificationPage)confirmationPage
{
  return self->_confirmationPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationPage, 0);
  objc_storeStrong((id *)&self->_fundingSource, 0);
}

@end
