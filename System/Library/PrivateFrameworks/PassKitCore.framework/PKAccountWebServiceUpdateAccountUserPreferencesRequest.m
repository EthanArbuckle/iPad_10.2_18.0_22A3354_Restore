@implementation PKAccountWebServiceUpdateAccountUserPreferencesRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSURL *baseURL;
  NSString *accountIdentifier;
  NSString *accountUserAltDSID;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  objc_class *v19;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    v24 = 2082;
    v25 = "_baseURL";
LABEL_19:
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_20;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    v24 = 2082;
    v25 = "_accountIdentifier";
    goto LABEL_19;
  }
  accountUserAltDSID = self->_accountUserAltDSID;
  if (!accountUserAltDSID)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    v24 = 2082;
    v25 = "_accountUserAltDSID";
    goto LABEL_19;
  }
  if (!self->_accountUserPreferences)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    v24 = 2082;
    v25 = "_accountUserPreferences";
    goto LABEL_19;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v15;
      v24 = 2082;
      v25 = "appleAccountInformation";
      goto LABEL_19;
    }
LABEL_20:
    v13 = 0;
    goto LABEL_21;
  }
  v21[0] = CFSTR("accounts");
  v21[1] = accountIdentifier;
  v21[2] = CFSTR("users");
  v21[3] = accountUserAltDSID;
  v21[4] = CFSTR("preferences");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v9, 0, v5);
  v10 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v10, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v10, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  -[PKAccountUserPreferences jsonRepresentationForAccountUserAccessLevel:](self->_accountUserPreferences, "jsonRepresentationForAccountUserAccessLevel:", self->_accountUserAccessLevel);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPBody:](v10, "setHTTPBody:", v12);

  }
  v13 = -[NSObject copy](v10, "copy");

LABEL_21:
  return v13;
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

- (PKAccountUserPreferences)accountUserPreferences
{
  return self->_accountUserPreferences;
}

- (void)setAccountUserPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_accountUserPreferences, a3);
}

- (unint64_t)accountUserAccessLevel
{
  return self->_accountUserAccessLevel;
}

- (void)setAccountUserAccessLevel:(unint64_t)a3
{
  self->_accountUserAccessLevel = a3;
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
  objc_storeStrong((id *)&self->_accountUserPreferences, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
