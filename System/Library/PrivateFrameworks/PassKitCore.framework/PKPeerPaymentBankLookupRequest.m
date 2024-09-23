@implementation PKPeerPaymentBankLookupRequest

- (PKPeerPaymentBankLookupRequest)initWithCountryCode:(id)a3 query:(id)a4
{
  id v6;
  id v7;
  PKPeerPaymentBankLookupRequest *v8;
  uint64_t v9;
  NSString *countryCode;
  uint64_t v11;
  NSString *query;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentBankLookupRequest;
  v8 = -[PKOverlayableWebServiceRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    countryCode = v8->_countryCode;
    v8->_countryCode = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    query = v8->_query;
    v8->_query = (NSString *)v11;

  }
  return v8;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *countryCode;
  NSString *query;
  void *v11;
  NSObject *v12;
  id v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    v24 = 2082;
    v25 = "url";
LABEL_14:
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_15;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    v24 = 2082;
    v25 = "appleAccountInformation";
    goto LABEL_14;
  }
  countryCode = self->_countryCode;
  if (!countryCode)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    v24 = 2082;
    v25 = "_countryCode";
    goto LABEL_14;
  }
  query = self->_query;
  if (!query)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v15;
      v24 = 2082;
      v25 = "_query";
      goto LABEL_14;
    }
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  v20[0] = CFSTR("countryCode");
  v20[1] = CFSTR("query");
  v21[0] = countryCode;
  v21[1] = query;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, &unk_1E2C3E728, v11, v8);
  v12 = objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPMethod:](v12, "setHTTPMethod:", CFSTR("GET"));

  v13 = -[NSObject copy](v12, "copy");
LABEL_16:

  return v13;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
