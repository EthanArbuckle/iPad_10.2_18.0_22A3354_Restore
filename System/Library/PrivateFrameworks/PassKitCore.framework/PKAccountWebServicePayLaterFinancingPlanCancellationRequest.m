@implementation PKAccountWebServicePayLaterFinancingPlanCancellationRequest

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
  id v12;
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
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    v21 = 2082;
    v22 = "_baseURL";
LABEL_11:
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_12;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
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
  planIdentifier = self->_planIdentifier;
  if (!planIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
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
  v18[0] = CFSTR("accounts");
  v18[1] = accountIdentifier;
  v18[2] = CFSTR("financingPlans");
  v18[3] = planIdentifier;
  v18[4] = CFSTR("cancel");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v8, 0, v4);
  v9 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v9, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "safelySetObject:forKey:", self->_cancellationReasonIdentifier, CFSTR("cancellationReasonIdentifier"));
  objc_msgSend(v10, "safelySetObject:forKey:", self->_cancellationReasonDescription, CFSTR("cancellationReasonDescription"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v9, "setHTTPBody:", v11);

  v12 = -[NSObject copy](v9, "copy");
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

- (NSString)cancellationReasonIdentifier
{
  return self->_cancellationReasonIdentifier;
}

- (void)setCancellationReasonIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)cancellationReasonDescription
{
  return self->_cancellationReasonDescription;
}

- (void)setCancellationReasonDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationReasonDescription, 0);
  objc_storeStrong((id *)&self->_cancellationReasonIdentifier, 0);
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
