@implementation PKAccountWebServiceFinancingPlanPaymentIntentRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSURL *baseURL;
  NSString *accountIdentifier;
  NSString *planIdentifier;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  objc_class *v16;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    v21 = 2082;
    v22 = "_baseURL";
LABEL_11:
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_12;
  }
  if (!self->_accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    v21 = 2082;
    v22 = "_accountIdentifier";
    goto LABEL_11;
  }
  if (!self->_planIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      v21 = 2082;
      v22 = "_planIdentifier";
      goto LABEL_11;
    }
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  PKFinancingPlanPaymentIntentTypeToString(self->_intent);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKey:](v5, "setObject:forKey:", v6, CFSTR("intent"));

  baseURL = self->_baseURL;
  accountIdentifier = self->_accountIdentifier;
  v18[0] = CFSTR("accounts");
  v18[1] = accountIdentifier;
  planIdentifier = self->_planIdentifier;
  v18[2] = CFSTR("financingPlans");
  v18[3] = planIdentifier;
  v18[4] = CFSTR("paymentIntent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v10, v5, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v12 = (void *)objc_msgSend(v11, "copy");

LABEL_13:
  return v12;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
