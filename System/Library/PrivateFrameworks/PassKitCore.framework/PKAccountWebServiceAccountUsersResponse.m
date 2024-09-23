@implementation PKAccountWebServiceAccountUsersResponse

- (PKAccountWebServiceAccountUsersResponse)initWithData:(id)a3
{
  PKAccountWebServiceAccountUsersResponse *v3;
  PKAccountWebServiceAccountUsersResponse *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSSet *users;
  uint64_t v9;
  NSDate *lastUpdated;
  PKAccountWebServiceAccountUsersResponse *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PKAccountWebServiceAccountUsersResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v18, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("users"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_setByApplyingBlock:", &__block_literal_global_518);
    v7 = objc_claimAutoreleasedReturnValue();
    users = v4->_users;
    v4->_users = (NSSet *)v7;

    objc_msgSend(v5, "PKDateForKey:", CFSTR("lastUpdated"));
    v9 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v4->_lastUpdated;
    v4->_lastUpdated = (NSDate *)v9;

LABEL_4:
    v11 = v4;
    goto LABEL_8;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    v21 = 2114;
    v22 = v16;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v11 = 0;
LABEL_8:

  return v11;
}

PKAccountUser *__56__PKAccountWebServiceAccountUsersResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKAccountUser *v3;

  v2 = a2;
  v3 = -[PKAccountUser initWithDictionary:]([PKAccountUser alloc], "initWithDictionary:", v2);

  return v3;
}

- (NSSet)users
{
  return self->_users;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_users, 0);
}

@end
