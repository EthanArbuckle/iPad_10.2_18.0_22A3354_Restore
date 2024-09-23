@implementation PKPeerPaymentDocumentSubmissionRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  NSData *frontImageData;
  void *v13;
  NSData *backImageData;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSArray *certificates;
  void *v24;
  id v25;
  objc_class *v26;
  NSObject *v27;
  const char *v28;
  objc_class *v29;
  objc_class *v30;
  objc_class *v31;
  objc_class *v32;
  NSObject *v33;
  uint32_t v34;
  id v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  NSObject *v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_29;
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v27;
    v44 = 2082;
    v45 = "url";
    v28 = "Request %{public}@ missing parameter '%{public}s'.";
LABEL_26:
    v33 = v9;
    v34 = 22;
    goto LABEL_27;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_29;
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v27 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v27;
    v44 = 2082;
    v45 = "appleAccountInformation";
    v28 = "Request %{public}@ missing parameter '%{public}s'.";
    goto LABEL_26;
  }
  if (!self->_frontImageData)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_29;
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v27 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v27;
    v44 = 2082;
    v45 = "_frontImageData";
    v28 = "Request %{public}@ missing parameter '%{public}s'.";
    goto LABEL_26;
  }
  if (!self->_documentCountryCode)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_29;
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v27 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v27;
    v44 = 2082;
    v45 = "_documentCountryCode";
    v28 = "Request %{public}@ missing parameter '%{public}s'.";
    goto LABEL_26;
  }
  if (!self->_documentType)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v27 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v27;
      v44 = 2082;
      v45 = "_documentType";
      v28 = "Request %{public}@ missing parameter '%{public}s'.";
      goto LABEL_26;
    }
LABEL_29:
    v35 = 0;
    goto LABEL_30;
  }
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, &unk_1E2C3E6E0, 0, v7);
  v9 = objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPMethod:](v9, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  if (!-[NSArray count](self->_certificates, "count"))
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v28 = "Error: Tried to submit document without certificates";
    v33 = v27;
    v34 = 2;
LABEL_27:
    _os_log_impl(&dword_18FC92000, v33, OS_LOG_TYPE_DEFAULT, v28, buf, v34);
LABEL_28:

    goto LABEL_29;
  }
  v10 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  frontImageData = self->_frontImageData;
  if (frontImageData)
  {
    -[NSData base64EncodedStringWithOptions:](frontImageData, "base64EncodedStringWithOptions:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("documentFrontImage"));

  }
  backImageData = self->_backImageData;
  if (backImageData)
  {
    -[NSData base64EncodedStringWithOptions:](backImageData, "base64EncodedStringWithOptions:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("documentBackImage"));

  }
  objc_msgSend(v11, "setObject:forKey:", self->_documentCountryCode, CFSTR("documentCountryCode"));
  PKPaymentDocumentTypeToString(self->_documentType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("documentType"));

  v17 = (void *)MEMORY[0x19400CFE8]();
  if (objc_msgSend(v11, "count"))
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v11, "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("Encrypted document data: %@"), v20);
      v21 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v43 = v21;
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);

    }
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    certificates = self->_certificates;
    v41 = 0;
    PKPeerPaymentEncryptDataWithCertChain(v22, certificates, &v41);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v41;

    if (v24)
    {
      v10 = 0x1E0C99000;
    }
    else
    {
      v10 = 0x1E0C99000uLL;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate peer payment document submission request encryptedDocumentData. This is bad!", buf, 2u);
      }

      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
    v25 = 0;
  }
  objc_autoreleasePoolPop(v17);
  objc_msgSend(*(id *)(v10 + 3592), "dictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v24, 4);
    objc_msgSend(v37, "setObject:forKey:", CFSTR("EV_ECC_v1-ASN.1"), CFSTR("encryptionVersion"));
    objc_msgSend(v37, "setObject:forKey:", v38, CFSTR("encryptedDocumentData"));
    objc_msgSend(v25, "hexEncoding");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKey:", v39, CFSTR("publicKeyHash"));

  }
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v37);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v9, "setHTTPBody:", v40);

  v35 = -[NSObject copy](v9, "copy");
LABEL_30:

  return v35;
}

- (NSData)frontImageData
{
  return self->_frontImageData;
}

- (void)setFrontImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)backImageData
{
  return self->_backImageData;
}

- (void)setBackImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)documentCountryCode
{
  return self->_documentCountryCode;
}

- (void)setDocumentCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)documentType
{
  return self->_documentType;
}

- (void)setDocumentType:(unint64_t)a3
{
  self->_documentType = a3;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)devSigned
{
  return self->_devSigned;
}

- (void)setDevSigned:(BOOL)a3
{
  self->_devSigned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_documentCountryCode, 0);
  objc_storeStrong((id *)&self->_backImageData, 0);
  objc_storeStrong((id *)&self->_frontImageData, 0);
}

@end
