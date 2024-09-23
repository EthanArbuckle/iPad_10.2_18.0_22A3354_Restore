@implementation PKAccountWebServiceBalanceHistoryRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSDate *beginDate;
  void *v8;
  NSDate *endDate;
  void *v10;
  unint64_t type;
  const __CFString *v12;
  const __CFString *v13;
  NSString *accountIdentifier;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  objc_class *v21;
  _QWORD v23[3];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 2082;
    v27 = "_baseURL";
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
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_22;
  }
  if (!self->_accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2082;
      v27 = "_accountIdentifier";
      goto LABEL_22;
    }
LABEL_23:
    v17 = 0;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = objc_claimAutoreleasedReturnValue();
  beginDate = self->_beginDate;
  if (beginDate)
  {
    PKISO8601DateStringFromDate(beginDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v6, "setObject:forKey:", v8, CFSTR("beginDate"));

  }
  endDate = self->_endDate;
  if (endDate)
  {
    PKISO8601DateStringFromDate(endDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v6, "setObject:forKey:", v10, CFSTR("endDate"));

  }
  type = self->_type;
  if (type)
  {
    v12 = CFSTR("day");
    if (type != 1)
      v12 = 0;
    if (type == 2)
      v13 = CFSTR("tenMinutes");
    else
      v13 = v12;
    -[NSObject setObject:forKey:](v6, "setObject:forKey:", v13, CFSTR("type"));
  }
  accountIdentifier = self->_accountIdentifier;
  v23[0] = CFSTR("accounts");
  v23[1] = accountIdentifier;
  v23[2] = CFSTR("balanceHistory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", self->_baseURL, v15, v6, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v17 = (void *)objc_msgSend(v16, "copy");

LABEL_24:
  return v17;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (void)setBeginDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
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
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
