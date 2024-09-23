@implementation PKAccountWebServiceFinancingPlanCancellationResponse

- (PKAccountWebServiceFinancingPlanCancellationResponse)initWithData:(id)a3
{
  PKAccountWebServiceFinancingPlanCancellationResponse *v3;
  PKAccountWebServiceFinancingPlanCancellationResponse *v4;
  void *v5;
  void *v6;
  PKPayLaterFinancingPlan *v7;
  PKPayLaterFinancingPlan *financingPlan;
  void *v9;
  PKAccount *v10;
  PKAccount *account;
  PKAccountWebServiceFinancingPlanCancellationResponse *v12;
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
  v19.super_class = (Class)PKAccountWebServiceFinancingPlanCancellationResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v19, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
  {
LABEL_8:
    v12 = v4;
    goto LABEL_12;
  }
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("financingPlan"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = -[PKPayLaterFinancingPlan initWithDictionary:]([PKPayLaterFinancingPlan alloc], "initWithDictionary:", v6);
      financingPlan = v4->_financingPlan;
      v4->_financingPlan = v7;

    }
    objc_msgSend(v5, "objectForKey:", CFSTR("account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v10 = -[PKAccount initWithDictionary:]([PKAccount alloc], "initWithDictionary:", v9);
      account = v4->_account;
      v4->_account = v10;

    }
    goto LABEL_8;
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
LABEL_12:

  return v12;
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

- (PKAccount)account
{
  return self->_account;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
