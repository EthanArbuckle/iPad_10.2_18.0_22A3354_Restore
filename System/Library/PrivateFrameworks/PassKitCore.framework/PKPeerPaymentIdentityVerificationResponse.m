@implementation PKPeerPaymentIdentityVerificationResponse

- (PKPeerPaymentIdentityVerificationResponse)initWithData:(id)a3
{
  PKPeerPaymentIdentityVerificationResponse *v3;
  PKPeerPaymentIdentityVerificationResponse *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  PKPeerPaymentAccount *v8;
  void *v9;
  uint64_t v10;
  PKPeerPaymentAccount *account;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *subtitle;
  uint64_t v16;
  NSString *localizedTitle;
  uint64_t v18;
  NSString *localizedDescription;
  void *v20;
  PKDynamicProvisioningPageLearnMoreContent *v21;
  PKDynamicProvisioningPageLearnMoreContent *learnMore;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  PKPeerPaymentRequiredFieldsPage *v36;
  uint64_t v37;
  NSArray *requiredFieldsByPage;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  uint64_t v45;
  NSArray *encryptionCertificates;
  uint64_t v47;
  NSString *encryptionVersion;
  void *v49;
  id v50;
  uint64_t k;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t m;
  uint64_t v60;
  PKDocumentRequest *v61;
  uint64_t v62;
  NSArray *acceptableDocuments;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  PKPeerPaymentIdentityVerificationResponse *v70;
  id v71;
  id obj;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  objc_super v94;
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  void *v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  const __CFString *v103;
  uint64_t v104;
  _QWORD v105[4];

  v105[1] = *MEMORY[0x1E0C80C00];
  v94.receiver = self;
  v94.super_class = (Class)PKPeerPaymentIdentityVerificationResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v94, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v4->_complete = -[NSObject PKBoolForKey:](v6, "PKBoolForKey:", CFSTR("complete"));
      -[NSObject PKDictionaryForKey:](v6, "PKDictionaryForKey:", CFSTR("account"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        v8 = [PKPeerPaymentAccount alloc];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PKPeerPaymentAccount initWithDictionary:lastUpdated:](v8, "initWithDictionary:lastUpdated:", v7, v9);
        account = v4->_account;
        v4->_account = (PKPeerPaymentAccount *)v10;

      }
      v67 = v7;
      -[NSObject PKStringForKey:](v6, "PKStringForKey:", CFSTR("title"));
      v12 = objc_claimAutoreleasedReturnValue();
      title = v4->_title;
      v4->_title = (NSString *)v12;

      -[NSObject PKStringForKey:](v6, "PKStringForKey:", CFSTR("subtitle"));
      v14 = objc_claimAutoreleasedReturnValue();
      subtitle = v4->_subtitle;
      v4->_subtitle = (NSString *)v14;

      -[NSObject PKStringForKey:](v6, "PKStringForKey:", CFSTR("localizedTitle"));
      v16 = objc_claimAutoreleasedReturnValue();
      localizedTitle = v4->_localizedTitle;
      v4->_localizedTitle = (NSString *)v16;

      -[NSObject PKStringForKey:](v6, "PKStringForKey:", CFSTR("localizedDescription"));
      v18 = objc_claimAutoreleasedReturnValue();
      localizedDescription = v4->_localizedDescription;
      v4->_localizedDescription = (NSString *)v18;

      -[NSObject PKDictionaryForKey:](v6, "PKDictionaryForKey:", CFSTR("learnMore"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "count"))
      {
        v21 = -[PKDynamicProvisioningPageLearnMoreContent initWithDictionary:]([PKDynamicProvisioningPageLearnMoreContent alloc], "initWithDictionary:", v20);
        learnMore = v4->_learnMore;
        v4->_learnMore = v21;

      }
      v65 = v20;
      -[NSObject PKArrayContaining:forKey:](v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredFieldsByPage"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        -[NSObject PKArrayContaining:forKey:](v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredFields"), v65);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v24)
        {
          v103 = CFSTR("requiredFields");
          v104 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v105[0] = v26;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v23 = 0;
        }

      }
      v69 = v5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array", v65);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject PKDictionaryForKey:](v6, "PKDictionaryForKey:", CFSTR("requiredFieldOptions"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      obj = v23;
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v91;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v91 != v34)
              objc_enumerationMutation(obj);
            v36 = -[PKPeerPaymentRequiredFieldsPage initWithDictionary:fieldOptions:]([PKPeerPaymentRequiredFieldsPage alloc], "initWithDictionary:fieldOptions:", *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i), v74);
            objc_msgSend(v76, "safelyAddObject:", v36);

          }
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
        }
        while (v33);
      }

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v76);
      v37 = objc_claimAutoreleasedReturnValue();
      requiredFieldsByPage = v4->_requiredFieldsByPage;
      v4->_requiredFieldsByPage = (NSArray *)v37;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      -[NSObject PKArrayContaining:forKey:](v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("encryptionCertificates"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v87;
        do
        {
          for (j = 0; j != v41; ++j)
          {
            if (*(_QWORD *)v87 != v42)
              objc_enumerationMutation(v39);
            v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j), 0);
            objc_msgSend(v75, "safelyAddObject:", v44);

          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
        }
        while (v41);
      }

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v75);
      v45 = objc_claimAutoreleasedReturnValue();
      encryptionCertificates = v4->_encryptionCertificates;
      v4->_encryptionCertificates = (NSArray *)v45;

      -[NSObject PKStringForKey:](v6, "PKStringForKey:", CFSTR("encryptionVersion"));
      v47 = objc_claimAutoreleasedReturnValue();
      encryptionVersion = v4->_encryptionVersion;
      v70 = v4;
      v4->_encryptionVersion = (NSString *)v47;

      v68 = v6;
      -[NSObject objectForKey:](v6, "objectForKey:", CFSTR("acceptableDocuments"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v71 = v49;
      v77 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
      if (v77)
      {
        v73 = *(_QWORD *)v83;
        do
        {
          for (k = 0; k != v77; ++k)
          {
            if (*(_QWORD *)v83 != v73)
              objc_enumerationMutation(v71);
            v52 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * k);
            objc_msgSend(v52, "objectForKey:", CFSTR("documentType"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = PKPaymentDocumentTypeFromString(v53);

            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            objc_msgSend(v52, "PKArrayForKey:", CFSTR("countryCodes"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
            if (v56)
            {
              v57 = v56;
              v58 = *(_QWORD *)v79;
              do
              {
                for (m = 0; m != v57; ++m)
                {
                  if (*(_QWORD *)v79 != v58)
                    objc_enumerationMutation(v55);
                  v60 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * m);
                  v61 = objc_alloc_init(PKDocumentRequest);
                  -[PKDocumentRequest setDocumentType:](v61, "setDocumentType:", v54);
                  -[PKDocumentRequest setCountryCode:](v61, "setCountryCode:", v60);
                  objc_msgSend(v50, "safelyAddObject:", v61);

                }
                v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v78, v99, 16);
              }
              while (v57);
            }

          }
          v77 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
        }
        while (v77);
      }

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v50);
      v62 = objc_claimAutoreleasedReturnValue();
      v4 = v70;
      acceptableDocuments = v70->_acceptableDocuments;
      v70->_acceptableDocuments = (NSArray *)v62;

      v27 = v68;
      v70->_useDeviceValidation = -[NSObject PKBoolForKey:](v68, "PKBoolForKey:", CFSTR("useDeviceValidation"));

      v5 = v69;
    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v96 = v29;
        v97 = 2114;
        v98 = v31;
        _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }

  }
  return v4;
}

- (BOOL)complete
{
  return self->_complete;
}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (PKDynamicProvisioningPageLearnMoreContent)learnMore
{
  return self->_learnMore;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSArray)requiredFieldsByPage
{
  return self->_requiredFieldsByPage;
}

- (NSArray)acceptableDocuments
{
  return self->_acceptableDocuments;
}

- (BOOL)useDeviceValidation
{
  return self->_useDeviceValidation;
}

- (NSArray)encryptionCertificates
{
  return self->_encryptionCertificates;
}

- (NSString)encryptionVersion
{
  return self->_encryptionVersion;
}

- (int64_t)verificationContext
{
  return self->_verificationContext;
}

- (void)setVerificationContext:(int64_t)a3
{
  self->_verificationContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_encryptionCertificates, 0);
  objc_storeStrong((id *)&self->_acceptableDocuments, 0);
  objc_storeStrong((id *)&self->_requiredFieldsByPage, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_learnMore, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
