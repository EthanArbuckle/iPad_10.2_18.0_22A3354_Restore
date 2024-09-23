@implementation PKAccountWebServiceCertificatesRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  const __CFString *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  NSURL *baseURL;
  void *v15;
  void *v16;
  const __CFString *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      v21 = 2082;
      v22 = "_baseURL";
LABEL_9:
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    }
LABEL_10:
    v13 = 0;
    goto LABEL_13;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      v21 = 2082;
      v22 = "appleAccountInformation";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = self->_destination - 1;
  if (v8 > 2)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E2AC3430[v8];
  -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, CFSTR("destination"));
  baseURL = self->_baseURL;
  v18 = CFSTR("certificates");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v15, v7, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v13 = (void *)objc_msgSend(v16, "copy");

LABEL_13:
  return v13;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end
