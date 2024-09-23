@implementation PKPeerPaymentUpdatePreferencesRequest

- (PKPeerPaymentUpdatePreferencesRequest)initWithPeerPaymentPreferences:(id)a3
{
  id v5;
  PKPeerPaymentUpdatePreferencesRequest *v6;
  PKPeerPaymentUpdatePreferencesRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentUpdatePreferencesRequest;
  v6 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_peerPaymentPreferences, a3);

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  objc_class *v18;
  int v20;
  void *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v16;
    v22 = 2082;
    v23 = "url";
LABEL_11:
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v20, 0x16u);

    goto LABEL_12;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v16;
    v22 = 2082;
    v23 = "appleAccountInformation";
    goto LABEL_11;
  }
  if (!self->_peerPaymentPreferences)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v16;
      v22 = 2082;
      v23 = "_peerPaymentPreferences";
      goto LABEL_11;
    }
LABEL_12:

    v13 = 0;
    goto LABEL_13;
  }
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, &unk_1E2C3E710, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v10 = (void *)objc_opt_class();
  -[PKPeerPaymentPreferences dictionaryRepresentation](self->_peerPaymentPreferences, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_HTTPBodyWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPBody:", v12);

  v13 = (void *)objc_msgSend(v9, "copy");
LABEL_13:

  return v13;
}

- (PKPeerPaymentPreferences)peerPaymentPreferences
{
  return self->_peerPaymentPreferences;
}

- (void)setPeerPaymentPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentPreferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentPreferences, 0);
}

@end
