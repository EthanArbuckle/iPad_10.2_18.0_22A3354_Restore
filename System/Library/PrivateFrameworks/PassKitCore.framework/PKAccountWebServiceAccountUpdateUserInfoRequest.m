@implementation PKAccountWebServiceAccountUpdateUserInfoRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  __CFString *encryptionVersion;
  NSString *accountIdentifier;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSArray *certificates;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  void *v22;
  id v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  objc_class *v27;
  NSString *ssn;
  void *v29;
  void *v30;
  char *v31;
  NSArray *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  NSObject *v37;
  void *v38;
  void *v39;
  char *v40;
  id v41;
  id v42;
  CNContact *contact;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSString *odiAssessment;
  PKPaymentDeviceMetadata *deviceMetadata;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  const __CFString *v57;
  NSString *v58;
  _QWORD v59[3];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  const char *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v61 = v25;
    v62 = 2082;
    v63 = "_baseURL";
LABEL_30:
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_31;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v61 = v25;
    v62 = 2082;
    v63 = "appleAccountInformation";
    goto LABEL_30;
  }
  if (!self->_accountIdentifier)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v61 = v25;
    v62 = 2082;
    v63 = "_accountIdentifier";
    goto LABEL_30;
  }
  if (self->_ssn && !self->_certificates)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v25;
      v62 = 2082;
      v63 = "_certificates";
      goto LABEL_30;
    }
LABEL_31:
    v35 = 0;
    goto LABEL_32;
  }
  if (self->_encryptionVersion)
    encryptionVersion = (__CFString *)self->_encryptionVersion;
  else
    encryptionVersion = CFSTR("EV_ECC_v1-ASN.1");
  objc_storeStrong((id *)&self->_encryptionVersion, encryptionVersion);
  accountIdentifier = self->_accountIdentifier;
  v59[0] = CFSTR("accounts");
  v59[1] = accountIdentifier;
  v59[2] = CFSTR("userInfo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
  v8 = objc_claimAutoreleasedReturnValue();
  -[PKAccountWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", self->_baseURL, v8, 0, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(v9, "setCachePolicy:", 1);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKOverlayableWebServiceRequest secureOverlayParameters](self, "secureOverlayParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  certificates = self->_certificates;
  if (v12)
  {
    if (!-[NSArray count](certificates, "count"))
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v37, OS_LOG_TYPE_DEFAULT, "Error: Tried to update user info without certificates", buf, 2u);
      }
      v22 = 0;
      v53 = 0;
      v38 = v9;
      v9 = 0;
      goto LABEL_50;
    }
    v14 = (void *)MEMORY[0x19400CFE8]();
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PKOverlayableWebServiceRequest _applySecureOverlayToDictionary:](self, "_applySecureOverlayToDictionary:", v15);
    if (objc_msgSend(v15, "count"))
    {
      v52 = v14;
      PKLogFacilityTypeGetObject(0xEuLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v15, "allKeys");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("Encrypted User Info Fields: %@"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        v61 = v19;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);

      }
      objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self->_certificates;
      v56 = 0;
      PKFeatureEncryptDataWithCertChain(v20, v21, &v56, self->_featureIdentifier);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v56;

      if (v22)
      {
        v14 = v52;
LABEL_42:

        objc_autoreleasePoolPop(v14);
        goto LABEL_48;
      }
      v14 = v52;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate user indo request encryptedData. This is bad!", buf, 2u);
      }

    }
    else
    {
      v23 = 0;
    }
    v22 = 0;
    goto LABEL_42;
  }
  if (!certificates || (ssn = self->_ssn) == 0)
  {
    v22 = 0;
    v53 = 0;
    goto LABEL_51;
  }
  v57 = CFSTR("ssnFull");
  v58 = ssn;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v29, 1, &v55);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (char *)v55;
  if (!v30)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v39 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v61 = v39;
      v62 = 2112;
      v63 = v31;
      v40 = v31;
      v41 = v39;
      _os_log_impl(&dword_18FC92000, v33, OS_LOG_TYPE_DEFAULT, "Could not create data for %@: %@", buf, 0x16u);

      v31 = v40;
    }
    v23 = 0;
    goto LABEL_46;
  }
  v32 = self->_certificates;
  v54 = 0;
  PKFeatureEncryptDataWithCertChain(v30, v32, &v54, self->_featureIdentifier);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v54;
  if (!v22)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v33, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate user info request encryptedData.", buf, 2u);
    }
LABEL_46:

    v22 = 0;
  }

LABEL_48:
  v53 = v23;
  if (v22)
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v22, 4);
    objc_msgSend(v10, "setObject:forKey:", self->_encryptionVersion, CFSTR("encryptionVersion"));
    objc_msgSend(v10, "setObject:forKey:", v38, CFSTR("encryptedData"));
    objc_msgSend(v23, "hexEncoding");
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v37, CFSTR("publicKeyHash"));
LABEL_50:

  }
LABEL_51:
  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKOverlayableWebServiceRequest _applyOverlayToDictionary:](self, "_applyOverlayToDictionary:", v42);
  objc_msgSend(v10, "setObject:forKey:", v42, CFSTR("inputData"));
  contact = self->_contact;
  if (contact)
  {
    -[CNContact postalAddresses](contact, "postalAddresses");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "firstObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "value");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v46, "webServiceDictionaryRepresentation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v47, CFSTR("billingAddress"));

    }
  }
  odiAssessment = self->_odiAssessment;
  if (odiAssessment)
    objc_msgSend(v10, "setObject:forKey:", odiAssessment, CFSTR("odiAssessment"));
  deviceMetadata = self->_deviceMetadata;
  if (deviceMetadata)
  {
    -[PKPaymentDeviceMetadata dictionaryRepresentation](deviceMetadata, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v50, CFSTR("deviceMetadata"));

  }
  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v10);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHTTPBody:", v51);

  }
  v35 = (void *)objc_msgSend(v9, "copy");

LABEL_32:
  return v35;
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

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSString)ssn
{
  return self->_ssn;
}

- (void)setSsn:(id)a3
{
  objc_storeStrong((id *)&self->_ssn, a3);
}

- (NSString)encryptionVersion
{
  return self->_encryptionVersion;
}

- (void)setEncryptionVersion:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionVersion, a3);
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_ssn, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
