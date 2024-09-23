@implementation PKApplyWebServiceAugmentedProductRequest

- (PKApplyWebServiceAugmentedProductRequest)initWithCoder:(id)a3
{
  id v4;
  PKApplyWebServiceAugmentedProductRequest *v5;
  uint64_t v6;
  PKPaymentInstallmentConfiguration *installmentConfiguration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplyWebServiceAugmentedProductRequest;
  v5 = -[PKApplyWebServiceRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentConfiguration"));
    v6 = objc_claimAutoreleasedReturnValue();
    installmentConfiguration = v5->_installmentConfiguration;
    v5->_installmentConfiguration = (PKPaymentInstallmentConfiguration *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceAugmentedProductRequest;
  v4 = a3;
  -[PKApplyWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_installmentConfiguration, CFSTR("installmentConfiguration"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v15;
      v22 = 2082;
      v23 = "url";
LABEL_9:
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v20, 0x16u);

    }
LABEL_10:

    v17 = 0;
    goto LABEL_13;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v15;
      v22 = 2082;
      v23 = "appleAccountInformation";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  -[PKApplyWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, &unk_1E2C3DD68, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  -[PKApplyWebServiceRequest _createMutableBody](self, "_createMutableBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (self->_installmentConfiguration)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isInstallment"));
    PKInstallmentRetailChannelToString(-[PKPaymentInstallmentConfiguration retailChannel](self->_installmentConfiguration, "retailChannel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("installmentChannel"));

  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("isInstallment"));
  }
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPBody:", v18);

  v17 = (void *)objc_msgSend(v9, "copy");
LABEL_13:

  return v17;
}

- (PKPaymentInstallmentConfiguration)installmentConfiguration
{
  return self->_installmentConfiguration;
}

- (void)setInstallmentConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_installmentConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
}

@end
