@implementation PKAccountWebServiceFinancingPlanChangeAutoPaymentRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  NSURL *baseURL;
  NSString *accountIdentifier;
  NSString *planIdentifier;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  objc_class *v17;
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    v22 = 2082;
    v23 = "_baseURL";
LABEL_13:
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_14;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    v22 = 2082;
    v23 = "_accountIdentifier";
    goto LABEL_13;
  }
  planIdentifier = self->_planIdentifier;
  if (!planIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      v22 = 2082;
      v23 = "_planIdentifier";
      goto LABEL_13;
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v19[0] = CFSTR("accounts");
  v19[1] = accountIdentifier;
  v19[2] = CFSTR("financingPlans");
  v19[3] = planIdentifier;
  v19[4] = CFSTR("autoPayment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v8, 0, v4);
  v9 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v9, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autoPayment);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("autoPayment"));

  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPBody:](v9, "setHTTPBody:", v12);

  }
  v13 = -[NSObject copy](v9, "copy");

LABEL_15:
  return v13;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (NSString)planIdentifier
{
  return self->_planIdentifier;
}

- (void)setPlanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)autoPayment
{
  return self->_autoPayment;
}

- (void)setAutoPayment:(BOOL)a3
{
  self->_autoPayment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
