@implementation PKAccountWebServiceDocumentRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int64_t type;
  const __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  NSDate *beginDate;
  void *v12;
  NSDate *endDate;
  void *v14;
  NSString *accountIdentifier;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  objc_class *v22;
  _QWORD v24[3];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v20;
    v27 = 2082;
    v28 = "_baseURL";
LABEL_22:
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_23;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v20;
    v27 = 2082;
    v28 = "appleAccountInformation";
    goto LABEL_22;
  }
  if (!self->_accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2082;
      v28 = "_accountIdentifier";
      goto LABEL_22;
    }
LABEL_23:
    v18 = 0;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = objc_claimAutoreleasedReturnValue();
  type = self->_type;
  v8 = CFSTR("statement");
  if (type != 1)
    v8 = 0;
  if (type == 2)
    v9 = CFSTR("taxForm");
  else
    v9 = (__CFString *)v8;
  v10 = v9;
  if (v10)
    -[NSObject setObject:forKey:](v6, "setObject:forKey:", v10, CFSTR("documentType"));
  beginDate = self->_beginDate;
  if (beginDate)
  {
    PKISO8601DateStringFromDate(beginDate);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v6, "setObject:forKey:", v12, CFSTR("beginDate"));

  }
  endDate = self->_endDate;
  if (endDate)
  {
    PKISO8601DateStringFromDate(endDate);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v6, "setObject:forKey:", v14, CFSTR("endDate"));

  }
  accountIdentifier = self->_accountIdentifier;
  v24[0] = CFSTR("accounts");
  v24[1] = accountIdentifier;
  v24[2] = CFSTR("documents");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", self->_baseURL, v16, v6, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v17, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v18 = (void *)objc_msgSend(v17, "copy");

LABEL_24:
  return v18;
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

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (void)setBeginDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
