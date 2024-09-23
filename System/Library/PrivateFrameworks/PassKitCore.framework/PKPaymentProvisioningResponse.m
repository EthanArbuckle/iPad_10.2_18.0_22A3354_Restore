@implementation PKPaymentProvisioningResponse

- (PKPaymentProvisioningResponse)initWithData:(id)a3
{
  PKPaymentProvisioningResponse *v3;
  PKPaymentProvisioningResponse *v4;
  void *v5;
  id v6;
  id v7;
  PKPaymentProvisioningResponse *v8;
  uint64_t (**v9)(void *, void *);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  NSArray *downloadablePasses;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  NSArray *moreInfoURLs;
  uint64_t v26;
  PKContactInformation *v27;
  PKContactInformation *idmsContactInformation;
  PKProvisioningJPKISupportData *v29;
  PKProvisioningSupportData *encryptedProvisioningSupportData;
  uint64_t v31;
  NSString *nonce;
  PKExternalProvisioningOptions *v33;
  void *v34;
  uint64_t v35;
  PKExternalProvisioningOptions *externalProvisioningOptions;
  char v37;
  PKPaymentProvisioningResponse *v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  id v43;
  PKPaymentProvisioningResponse *v44;
  uint64_t (**v46)(void *, void *);
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD aBlock[4];
  id v53;
  PKPaymentProvisioningResponse *v54;
  objc_super v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v55.receiver = self;
  v55.super_class = (Class)PKPaymentProvisioningResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v55, sel_initWithData_, a3);
  if (v3)
  {
    v4 = v3;
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v57 = v41;
        v58 = 2112;
        v59 = v42;
        v43 = v42;
        _os_log_impl(&dword_18FC92000, v39, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v38 = 0;
LABEL_34:

      goto LABEL_35;
    }
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__PKPaymentProvisioningResponse_initWithData___block_invoke;
    aBlock[3] = &unk_1E2ADD678;
    v7 = v6;
    v53 = v7;
    v8 = v4;
    v54 = v8;
    v9 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
    if ((v9[2](v9, v5) & 1) == 0)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Unexpected response: expected root json to contain provisioning pass data. Attempting with \"passes\", buf, 2u);
      }

      objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("passes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v5;
          _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Unexpected response: \"passes\" dictionary array did not exist or did not contain expected dictionary of provisioning pass data.\nJSON: %@", buf, 0xCu);
        }
        v37 = 0;
        v26 = (uint64_t)v8;
        v8 = 0;
        goto LABEL_32;
      }
      objc_msgSend(v11, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v9[2](v9, v13);

      if ((v14 & 1) == 0)
      {
        v37 = 0;
        v38 = 0;
LABEL_33:

        if ((v37 & 1) == 0)
        {

          v44 = 0;
          goto LABEL_36;
        }
        goto LABEL_34;
      }

    }
    v15 = objc_msgSend(v7, "copy");
    downloadablePasses = v8->_downloadablePasses;
    v8->_downloadablePasses = (NSArray *)v15;

    objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("moreInfoURLs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      v46 = v9;
      v47 = v7;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v18 = v12;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v49 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
              objc_msgSend(v17, "addObject:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        }
        while (v20);
      }

      v24 = objc_msgSend(v17, "copy");
      moreInfoURLs = v8->_moreInfoURLs;
      v8->_moreInfoURLs = (NSArray *)v24;

      v9 = v46;
      v7 = v47;
    }
    objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("contactInformation"));
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = -[PKContactInformation initWithDictionary:]([PKContactInformation alloc], "initWithDictionary:", v26);
      idmsContactInformation = v8->_idmsContactInformation;
      v8->_idmsContactInformation = v27;

    }
    objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("encryptedProvisioningSupportData"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v29 = -[PKProvisioningJPKISupportData initWithEncryptedSupportDataDictionary:sid:]([PKProvisioningJPKISupportData alloc], "initWithEncryptedSupportDataDictionary:sid:", v10, 0);
      encryptedProvisioningSupportData = v8->_encryptedProvisioningSupportData;
      v8->_encryptedProvisioningSupportData = &v29->super;

    }
    objc_msgSend(v5, "PKStringForKey:", CFSTR("nonce"));
    v31 = objc_claimAutoreleasedReturnValue();
    nonce = v8->_nonce;
    v8->_nonce = (NSString *)v31;

    v33 = [PKExternalProvisioningOptions alloc];
    objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("externalDestinationOptions"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[PKExternalProvisioningOptions initWithDictionary:](v33, "initWithDictionary:", v34);
    externalProvisioningOptions = v8->_externalProvisioningOptions;
    v8->_externalProvisioningOptions = (PKExternalProvisioningOptions *)v35;

    v37 = 1;
LABEL_32:
    v38 = v8;

    v8 = (PKPaymentProvisioningResponse *)v26;
    goto LABEL_33;
  }
  v38 = 0;
LABEL_35:
  v38 = v38;
  v44 = v38;
LABEL_36:

  return v44;
}

BOOL __46__PKPaymentProvisioningResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKPaymentProvisioningPassData *v4;
  NSObject *v5;
  id v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[PKPaymentProvisioningPassData initWithDictionary:]([PKPaymentProvisioningPassData alloc], "initWithDictionary:", v3);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = (id)objc_opt_class();
      v10 = 2112;
      v11 = v3;
      v6 = v9;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Parsing Failure: did not create pass data inside %@ using %@", (uint8_t *)&v8, 0x16u);

    }
  }

  return v4 != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentProvisioningResponse)initWithCoder:(id)a3
{
  id v4;
  PKPaymentProvisioningResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *downloadablePasses;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *moreInfoURLs;
  uint64_t v16;
  PKContactInformation *idmsContactInformation;
  uint64_t v18;
  NSString *nonce;
  uint64_t v20;
  PKExternalProvisioningOptions *externalProvisioningOptions;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentProvisioningResponse;
  v5 = -[PKWebServiceResponse initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("downloadablePasses"));
    v9 = objc_claimAutoreleasedReturnValue();
    downloadablePasses = v5->_downloadablePasses;
    v5->_downloadablePasses = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("moreInfoURLs"));
    v14 = objc_claimAutoreleasedReturnValue();
    moreInfoURLs = v5->_moreInfoURLs;
    v5->_moreInfoURLs = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idmsContactInformation"));
    v16 = objc_claimAutoreleasedReturnValue();
    idmsContactInformation = v5->_idmsContactInformation;
    v5->_idmsContactInformation = (PKContactInformation *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
    v18 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalProvisioningOptions"));
    v20 = objc_claimAutoreleasedReturnValue();
    externalProvisioningOptions = v5->_externalProvisioningOptions;
    v5->_externalProvisioningOptions = (PKExternalProvisioningOptions *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningResponse;
  v4 = a3;
  -[PKWebServiceResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_downloadablePasses, CFSTR("downloadablePasses"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_moreInfoURLs, CFSTR("moreInfoURLs"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_idmsContactInformation, CFSTR("idmsContactInformation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_nonce, CFSTR("nonce"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalProvisioningOptions, CFSTR("externalProvisioningOptions"));

}

- (NSArray)downloadablePasses
{
  return self->_downloadablePasses;
}

- (NSArray)moreInfoURLs
{
  return self->_moreInfoURLs;
}

- (PKContactInformation)idmsContactInformation
{
  return self->_idmsContactInformation;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (PKExternalProvisioningOptions)externalProvisioningOptions
{
  return self->_externalProvisioningOptions;
}

- (PKProvisioningSupportData)encryptedProvisioningSupportData
{
  return self->_encryptedProvisioningSupportData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedProvisioningSupportData, 0);
  objc_storeStrong((id *)&self->_externalProvisioningOptions, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_idmsContactInformation, 0);
  objc_storeStrong((id *)&self->_moreInfoURLs, 0);
  objc_storeStrong((id *)&self->_downloadablePasses, 0);
}

@end
