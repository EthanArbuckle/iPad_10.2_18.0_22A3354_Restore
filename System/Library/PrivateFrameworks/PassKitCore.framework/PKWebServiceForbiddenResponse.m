@implementation PKWebServiceForbiddenResponse

- (PKWebServiceForbiddenResponse)initWithData:(id)a3
{
  PKWebServiceForbiddenResponse *v3;
  PKWebServiceForbiddenResponse *v4;
  void *v5;
  PKWebServiceForbiddenResponse *v6;
  PKWebServiceForbiddenResponse *v7;
  NSObject *localizedDescription;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSString *localizedTitle;
  uint64_t v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PKWebServiceForbiddenResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v18, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKStringForKey:", CFSTR("errorCode"));
      v6 = (PKWebServiceForbiddenResponse *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKWebServiceForbiddenResponse integerValue](v6, "integerValue"));
      else
        objc_msgSend(v5, "PKNumberForKey:", CFSTR("errorCode"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v4->_errorCode, v13);

      objc_msgSend(v5, "PKStringForKey:", CFSTR("localizedTitle"));
      v14 = objc_claimAutoreleasedReturnValue();
      localizedTitle = v4->_localizedTitle;
      v4->_localizedTitle = (NSString *)v14;

      objc_msgSend(v5, "PKStringForKey:", CFSTR("localizedDescription"));
      v16 = objc_claimAutoreleasedReturnValue();
      localizedDescription = v4->_localizedDescription;
      v4->_localizedDescription = (NSString *)v16;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      localizedDescription = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(localizedDescription, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v20 = v10;
        v21 = 2112;
        v22 = v11;
        v12 = v11;
        _os_log_impl(&dword_18FC92000, localizedDescription, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v7 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end
