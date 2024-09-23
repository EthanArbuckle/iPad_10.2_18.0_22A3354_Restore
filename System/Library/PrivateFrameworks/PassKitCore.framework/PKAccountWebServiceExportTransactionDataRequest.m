@implementation PKAccountWebServiceExportTransactionDataRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSURL *baseURL;
  NSString *accountIdentifier;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *v23;
  objc_class *v24;
  id v25;
  void *v27;
  _QWORD v28[3];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    v31 = 2082;
    v32 = "_baseURL";
LABEL_27:
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_28;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    v31 = 2082;
    v32 = "appleAccountInformation";
    goto LABEL_27;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    v31 = 2082;
    v32 = "_accountIdentifier";
    goto LABEL_27;
  }
  if (!self->_fileFormat)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    v31 = 2082;
    v32 = "_fileFormat";
    goto LABEL_27;
  }
  if (!self->_beginDate)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    v31 = 2082;
    v32 = "_beginDate";
    goto LABEL_27;
  }
  if (!self->_endDate)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    v31 = 2082;
    v32 = "_endDate";
    goto LABEL_27;
  }
  if (!self->_productTimeZone)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      v31 = 2082;
      v32 = "_productTimeZone";
      goto LABEL_27;
    }
LABEL_28:
    v25 = 0;
    goto LABEL_29;
  }
  v28[0] = CFSTR("accounts");
  v28[1] = accountIdentifier;
  v28[2] = CFSTR("exportTransactionData");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v8, 0, v5);
  v9 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v9, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_fileFormat, CFSTR("fileFormat"));
  v11 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocale:", v12);

  objc_msgSend(v11, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZ"));
  objc_msgSend(v11, "setTimeZone:", self->_productTimeZone);
  objc_msgSend(v11, "stringFromDate:", self->_beginDate);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("beginDate"));

  objc_msgSend(v11, "stringFromDate:", self->_endDate);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("endDate"));

  if (self->_type)
    v15 = CFSTR("transactionMetadata");
  else
    v15 = CFSTR("default");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("type"));
  objc_msgSend(v10, "safelySetObject:forKey:", self->_statementIdentifier, CFSTR("statementIdentifier"));
  switch(self->_trigger)
  {
    case 0uLL:
      goto LABEL_34;
    case 1uLL:
      v16 = CFSTR("manual");
      goto LABEL_33;
    case 2uLL:
      v16 = CFSTR("statementChanged");
      goto LABEL_33;
    case 3uLL:
      v16 = CFSTR("scheduledActivity");
      goto LABEL_33;
    default:
      v16 = CFSTR("unknown");
LABEL_33:
      objc_msgSend(v10, "safelySetObject:forKey:", v16, CFSTR("trigger"));
LABEL_34:
      if (v10)
      {
        objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setHTTPBody:](v9, "setHTTPBody:", v27);

      }
      v25 = -[NSObject copy](v9, "copy");

      break;
  }
LABEL_29:

  return v25;
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

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(unint64_t)a3
{
  self->_trigger = a3;
}

- (NSString)fileFormat
{
  return self->_fileFormat;
}

- (void)setFileFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (void)setBeginDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (void)setStatementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (void)setProductTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_statementIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_fileFormat, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
