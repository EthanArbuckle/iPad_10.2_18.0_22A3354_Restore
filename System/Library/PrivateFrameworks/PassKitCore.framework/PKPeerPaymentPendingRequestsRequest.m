@implementation PKPeerPaymentPendingRequestsRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *requestTokens;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  objc_class *v19;
  int v21;
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v17;
    v23 = 2082;
    v24 = "url";
LABEL_13:
    _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v21, 0x16u);

    goto LABEL_14;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v17;
    v23 = 2082;
    v24 = "appleAccountInformation";
    goto LABEL_13;
  }
  if (!self->_requestTokens)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v17;
      v23 = 2082;
      v24 = "_requestTokens";
      goto LABEL_13;
    }
LABEL_14:

    v14 = 0;
    goto LABEL_15;
  }
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, &unk_1E2C3E668, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  requestTokens = self->_requestTokens;
  if (requestTokens)
    objc_msgSend(v10, "setObject:forKey:", requestTokens, CFSTR("requestTokens"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPBody:", v13);

  v14 = (void *)objc_msgSend(v9, "copy");
LABEL_15:

  return v14;
}

- (NSArray)requestTokens
{
  return self->_requestTokens;
}

- (void)setRequestTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTokens, 0);
}

@end
