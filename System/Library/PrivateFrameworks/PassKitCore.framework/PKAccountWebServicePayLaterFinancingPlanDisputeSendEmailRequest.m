@implementation PKAccountWebServicePayLaterFinancingPlanDisputeSendEmailRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  NSURL *baseURL;
  NSString *accountIdentifier;
  NSString *planIdentifier;
  NSString *disputeIdentifier;
  void *v9;
  NSObject *v10;
  id v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  _QWORD v18[7];
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
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    v21 = 2082;
    v22 = "_baseURL";
LABEL_14:
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_15;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    v21 = 2082;
    v22 = "_accountIdentifier";
    goto LABEL_14;
  }
  planIdentifier = self->_planIdentifier;
  if (!planIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    v21 = 2082;
    v22 = "_planIdentifier";
    goto LABEL_14;
  }
  disputeIdentifier = self->_disputeIdentifier;
  if (!disputeIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2082;
      v22 = "_disputeIdentifier";
      goto LABEL_14;
    }
LABEL_15:
    v11 = 0;
    goto LABEL_16;
  }
  v18[0] = CFSTR("accounts");
  v18[1] = accountIdentifier;
  v18[2] = CFSTR("financingPlans");
  v18[3] = planIdentifier;
  v18[4] = CFSTR("disputes");
  v18[5] = disputeIdentifier;
  v18[6] = CFSTR("sendEmail");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v9, 0, v4);
  v10 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v10, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v10, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v11 = -[NSObject copy](v10, "copy");
LABEL_16:

  return v11;
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

- (NSString)disputeIdentifier
{
  return self->_disputeIdentifier;
}

- (void)setDisputeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disputeIdentifier, 0);
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
