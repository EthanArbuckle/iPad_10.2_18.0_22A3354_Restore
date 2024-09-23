@implementation PKAccountWebServiceVirtualCardManageRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSString *accountIdentifier;
  NSString *virtualCardIdentifier;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  PKVirtualCardEncryptionFields *encryptionFields;
  void *v22;
  void *v23;
  _QWORD v24[4];
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
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v14;
    v27 = 2082;
    v28 = "_baseURL";
LABEL_18:
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_19;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v14;
    v27 = 2082;
    v28 = "appleAccountInformation";
    goto LABEL_18;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v14;
    v27 = 2082;
    v28 = "_accountIdentifier";
    goto LABEL_18;
  }
  virtualCardIdentifier = self->_virtualCardIdentifier;
  if (!virtualCardIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v14;
    v27 = 2082;
    v28 = "_virtualCardIdentifier";
    goto LABEL_18;
  }
  if (!self->_action)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2082;
      v28 = "_action";
      goto LABEL_18;
    }
LABEL_19:
    v19 = 0;
    goto LABEL_20;
  }
  v24[0] = CFSTR("accounts");
  v24[1] = accountIdentifier;
  v24[2] = CFSTR("virtualCards");
  v24[3] = virtualCardIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v8 = objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", self->_baseURL, v8, 0, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = CFSTR("fetch");
  switch(self->_action)
  {
    case 0:
      goto LABEL_27;
    case 2:
      v12 = CFSTR("cancel");
      goto LABEL_26;
    case 3:
      v12 = CFSTR("replace");
      goto LABEL_26;
    case 4:
      v12 = CFSTR("enable");
      goto LABEL_26;
    case 5:
      v12 = CFSTR("disable");
      goto LABEL_26;
    case 6:
      v12 = CFSTR("enableDynamicSecurityCode");
      goto LABEL_26;
    case 7:
      v12 = CFSTR("disableDynamicSecurityCode");
      goto LABEL_26;
    default:
LABEL_26:
      objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("action"));
LABEL_27:
      encryptionFields = self->_encryptionFields;
      if (encryptionFields)
      {
        -[PKVirtualCardEncryptionFields dictionaryRepresentation](encryptionFields, "dictionaryRepresentation", v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v22, CFSTR("encryptionFields"));

      }
      if (v11)
      {
        objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v11);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHTTPBody:", v23);

      }
      v19 = (void *)objc_msgSend(v9, "copy", v12);

      break;
  }
LABEL_20:

  return v19;
}

- (void)setAction:(int64_t)a3 withQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PKVirtualCardEncryptionFields *v11;
  PKVirtualCardEncryptionFields *encryptionFields;
  PKVirtualCardEncryptionFields *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  self->_action = a3;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    objc_initWeak(&location, self);
    v11 = objc_alloc_init(PKVirtualCardEncryptionFields);
    encryptionFields = self->_encryptionFields;
    self->_encryptionFields = v11;

    v13 = self->_encryptionFields;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__PKAccountWebServiceVirtualCardManageRequest_setAction_withQueue_completion___block_invoke;
    v14[3] = &unk_1E2AC33F8;
    v15 = v10;
    objc_copyWeak(&v16, &location);
    -[PKVirtualCardEncryptionFields prepareCertificateWithQueue:completion:](v13, "prepareCertificateWithQueue:completion:", v8, v14);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id, PKAccountWebServiceVirtualCardManageRequest *))v9 + 2))(v9, self);
  }

}

void __78__PKAccountWebServiceVirtualCardManageRequest_setAction_withQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);

  }
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (NSString)virtualCardIdentifier
{
  return self->_virtualCardIdentifier;
}

- (void)setVirtualCardIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualCardIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_encryptionFields, 0);
}

@end
