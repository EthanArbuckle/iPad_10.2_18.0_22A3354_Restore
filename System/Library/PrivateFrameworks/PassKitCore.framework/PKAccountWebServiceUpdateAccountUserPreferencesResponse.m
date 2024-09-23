@implementation PKAccountWebServiceUpdateAccountUserPreferencesResponse

- (PKAccountWebServiceUpdateAccountUserPreferencesResponse)initWithData:(id)a3
{
  PKAccountWebServiceUpdateAccountUserPreferencesResponse *v3;
  PKAccountWebServiceUpdateAccountUserPreferencesResponse *v4;
  void *v5;
  PKAccountUser *v6;
  PKAccountUser *accountUser;
  PKAccountWebServiceUpdateAccountUserPreferencesResponse *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PKAccountWebServiceUpdateAccountUserPreferencesResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v15, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[PKAccountUser initWithDictionary:]([PKAccountUser alloc], "initWithDictionary:", v5);
    accountUser = v4->_accountUser;
    v4->_accountUser = v6;

LABEL_4:
    v8 = v4;
    goto LABEL_8;
  }
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
    v17 = v11;
    v18 = 2114;
    v19 = v13;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUser, 0);
}

@end
