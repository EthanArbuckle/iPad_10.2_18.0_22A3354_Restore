@implementation PKAccountWebserviceInstallmentBindResponse

- (PKAccountWebserviceInstallmentBindResponse)initWithData:(id)a3
{
  PKAccountWebserviceInstallmentBindResponse *v3;
  PKAccountWebserviceInstallmentBindResponse *v4;
  void *v5;
  uint64_t v6;
  NSString *bindToken;
  PKAccountWebserviceInstallmentBindResponse *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKAccountWebserviceInstallmentBindResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v16, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v11;
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

LABEL_10:
    }
LABEL_11:

    v8 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v5, "PKStringForKey:", CFSTR("bindToken"));
  v6 = objc_claimAutoreleasedReturnValue();
  bindToken = v4->_bindToken;
  v4->_bindToken = (NSString *)v6;

  if (!v4->_bindToken)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected bindToken", buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_11;
  }

LABEL_5:
  v8 = v4;
LABEL_12:

  return v8;
}

- (NSString)bindToken
{
  return self->_bindToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bindToken, 0);
}

@end
