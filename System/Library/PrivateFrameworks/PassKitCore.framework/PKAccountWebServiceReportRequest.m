@implementation PKAccountWebServiceReportRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSString *accountIdentifier;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  void *v17;
  void *v19;
  _QWORD v20[3];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    v23 = 2082;
    v24 = "_baseURL";
LABEL_15:
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_16;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    v23 = 2082;
    v24 = "appleAccountInformation";
    goto LABEL_15;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    v23 = 2082;
    v24 = "_accountIdentifier";
    goto LABEL_15;
  }
  if (!self->_report)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      v23 = 2082;
      v24 = "_report";
      goto LABEL_15;
    }
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  v20[0] = CFSTR("accounts");
  v20[1] = accountIdentifier;
  v20[2] = CFSTR("reporting");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v7 = objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", self->_baseURL, v7, 0, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKAccountReport dictionaryRepresentation](self->_report, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v10);

  switch(self->_trigger)
  {
    case 0uLL:
      goto LABEL_22;
    case 1uLL:
      v11 = CFSTR("manual");
      goto LABEL_21;
    case 2uLL:
      v11 = CFSTR("statementChanged");
      goto LABEL_21;
    case 3uLL:
      v11 = CFSTR("scheduledActivity");
      goto LABEL_21;
    default:
      v11 = CFSTR("unknown");
LABEL_21:
      objc_msgSend(v9, "safelySetObject:forKey:", v11, CFSTR("trigger"));
LABEL_22:
      objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHTTPBody:", v19);

      v17 = (void *)objc_msgSend(v8, "copy");
      break;
  }
LABEL_17:

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

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (PKAccountReport)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
  objc_storeStrong((id *)&self->_report, a3);
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(unint64_t)a3
{
  self->_trigger = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
