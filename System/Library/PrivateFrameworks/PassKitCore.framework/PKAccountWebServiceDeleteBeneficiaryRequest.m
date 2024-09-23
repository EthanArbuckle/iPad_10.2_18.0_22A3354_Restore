@implementation PKAccountWebServiceDeleteBeneficiaryRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSString *accountIdentifier;
  NSString *beneficiaryIdentifier;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    v20 = 2082;
    v21 = "_baseURL";
LABEL_14:
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_15;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    v20 = 2082;
    v21 = "appleAccountInformation";
    goto LABEL_14;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    v20 = 2082;
    v21 = "_accountIdentifier";
    goto LABEL_14;
  }
  beneficiaryIdentifier = self->_beneficiaryIdentifier;
  if (!beneficiaryIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v12;
      v20 = 2082;
      v21 = "_beneficiaryIdentifier";
      goto LABEL_14;
    }
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  v17[0] = CFSTR("accounts");
  v17[1] = accountIdentifier;
  v17[2] = CFSTR("userInfo");
  v17[3] = CFSTR("beneficiaries");
  v17[4] = beneficiaryIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v8 = objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", self->_baseURL, v8, 0, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("DELETE"));
  v10 = (void *)objc_msgSend(v9, "copy");

LABEL_16:
  return v10;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)beneficiaryIdentifier
{
  return self->_beneficiaryIdentifier;
}

- (void)setBeneficiaryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_beneficiaryIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
