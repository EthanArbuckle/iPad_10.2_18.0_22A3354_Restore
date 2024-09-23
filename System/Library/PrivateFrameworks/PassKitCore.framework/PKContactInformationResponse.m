@implementation PKContactInformationResponse

- (PKContactInformationResponse)initWithData:(id)a3
{
  PKContactInformationResponse *v3;
  PKContactInformationResponse *v4;
  void *v5;
  id v6;
  PKContactInformation *v7;
  void *contactInformation;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PKContactInformationResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v15, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = -[PKContactInformation initWithDictionary:]([PKContactInformation alloc], "initWithDictionary:", v6);

      contactInformation = v4->_contactInformation;
      v4->_contactInformation = v7;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v17 = v11;
        v18 = 2112;
        v19 = v12;
        v13 = v12;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      contactInformation = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (PKContactInformation)contactInformation
{
  return self->_contactInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactInformation, 0);
}

@end
