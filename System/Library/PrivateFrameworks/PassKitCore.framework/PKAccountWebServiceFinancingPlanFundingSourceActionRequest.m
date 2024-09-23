@implementation PKAccountWebServiceFinancingPlanFundingSourceActionRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 rewrapData:(id)a5 appleAccountInformation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSURL *baseURL;
  NSString *accountIdentifier;
  NSString *planIdentifier;
  const __CFString *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  objc_class *v33;
  _QWORD v35[5];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v20;
    v38 = 2082;
    v39 = "_baseURL";
LABEL_22:
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_23;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v20;
    v38 = 2082;
    v39 = "_accountIdentifier";
    goto LABEL_22;
  }
  planIdentifier = self->_planIdentifier;
  if (!planIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v20;
      v38 = 2082;
      v39 = "_planIdentifier";
      goto LABEL_22;
    }
LABEL_23:
    v32 = 0;
    goto LABEL_24;
  }
  v17 = CFSTR("payment");
  switch(self->_intent)
  {
    case 0uLL:
      PKLogFacilityTypeGetObject(0xEuLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v20;
      v38 = 2082;
      v39 = "_intent";
      goto LABEL_22;
    case 1uLL:
      break;
    case 2uLL:
      v17 = CFSTR("fundingSource");
      break;
    case 3uLL:
      v17 = CFSTR("autoPayment");
      break;
    default:
      PKLogFacilityTypeGetObject(0xEuLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v20;
      v38 = 2082;
      v39 = "endpoint";
      goto LABEL_22;
  }
  v35[0] = CFSTR("accounts");
  v35[1] = accountIdentifier;
  v35[2] = CFSTR("financingPlans");
  v35[3] = planIdentifier;
  v35[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceFinancingPlanFundingSourceActionRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v24, 0, v13);
  v18 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v18, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v18, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v12)
  {
    objc_msgSend(v12, "platformData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hexEncoding");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v27, CFSTR("pairedSEP"));

    objc_msgSend(v12, "platformDataSignature");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "hexEncoding");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v29, CFSTR("pairedSEPSignature"));

  }
  -[PKPaymentRewrapRequest bodyDictionary](self, "bodyDictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addEntriesFromDictionary:", v30);

  if (v25)
  {
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPBody:](v18, "setHTTPBody:", v31);

  }
  v32 = -[NSObject copy](v18, "copy");

LABEL_24:
  return v32;
}

- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6
{
  return -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:", a3, CFSTR("1"), a4, a5, a6);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
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
