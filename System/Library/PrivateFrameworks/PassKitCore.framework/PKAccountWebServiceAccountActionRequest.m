@implementation PKAccountWebServiceAccountActionRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  PKAccountAction *action;
  NSURL *baseURL;
  NSString *accountIdentifier;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSString *accountUserAltDSID;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  objc_class *v26;
  objc_class *v27;
  void *v29;
  void *v30;
  objc_class *v31;
  objc_class *v32;
  _QWORD v33[2];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    v36 = 2082;
    v37 = "_baseURL";
LABEL_23:
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_24;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    v36 = 2082;
    v37 = "appleAccountInformation";
    goto LABEL_23;
  }
  if (!self->_accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    v36 = 2082;
    v37 = "_accountIdentifier";
    goto LABEL_23;
  }
  action = self->_action;
  if (!action)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    v36 = 2082;
    v37 = "_action";
    goto LABEL_23;
  }
  if (!-[PKAccountAction actionType](action, "actionType"))
  {
    -[PKAccountAction amount](self->_action, "amount");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v24;
      v36 = 2082;
      v37 = "[_action amount]";
      goto LABEL_23;
    }
    -[PKAccountAction currencyCode](self->_action, "currencyCode");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      goto LABEL_6;
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v24;
      v36 = 2082;
      v37 = "[_action currencyCode]";
      goto LABEL_23;
    }
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
LABEL_6:
  baseURL = self->_baseURL;
  accountIdentifier = self->_accountIdentifier;
  v33[0] = CFSTR("accounts");
  v33[1] = accountIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v9, 0, v5);
  v10 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v10, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v10, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKAccountActionTypeToString(-[PKAccountAction actionType](self->_action, "actionType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("action"));

  accountUserAltDSID = self->_accountUserAltDSID;
  if (accountUserAltDSID)
    objc_msgSend(v11, "setObject:forKey:", accountUserAltDSID, CFSTR("accountUserAltDSID"));
  if (!-[PKAccountAction actionType](self->_action, "actionType"))
  {
    -[PKAccountAction amount](self->_action, "amount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("amount"));

    -[PKAccountAction currencyCode](self->_action, "currencyCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("currencyCode"));

    -[PKAccountAction identifier](self->_action, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("identifier"));

    PKAccountRewardRedemptionTypeToString(-[PKAccountAction redemptionType](self->_action, "redemptionType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v18, CFSTR("rewardRedemptionType"));

  }
  if (-[PKAccountAction actionType](self->_action, "actionType") == 2)
  {
    PKAccountRewardRedemptionTypeToString(-[PKAccountAction redemptionType](self->_action, "redemptionType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v19, CFSTR("rewardRedemptionType"));

    -[PKAccountAction identifier](self->_action, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length"))
      objc_msgSend(v11, "setObject:forKey:", v20, CFSTR("identifier"));

  }
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v10, "setHTTPBody:", v21);

  v22 = -[NSObject copy](v10, "copy");
LABEL_25:

  return v22;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)accountUserAltDSID
{
  return self->_accountUserAltDSID;
}

- (void)setAccountUserAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (PKAccountAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
