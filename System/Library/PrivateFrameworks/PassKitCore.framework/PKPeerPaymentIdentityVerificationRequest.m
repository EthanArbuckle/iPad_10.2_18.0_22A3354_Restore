@implementation PKPeerPaymentIdentityVerificationRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5 deviceScore:(id)a6 odiAssessment:(id)a7 deviceMetadata:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSArray *certificates;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  objc_class *v34;
  void *v35;
  objc_class *v36;
  objc_class *v37;
  objc_class *v38;
  id v39;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSString *prerequisiteIdentifier;
  void *v48;
  void *v49;
  NSObject *oslog;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  const char *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = v19;
  if (!v14)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v61 = v35;
    v62 = 2082;
    v63 = "url";
LABEL_22:
    _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_23;
  }
  if (!v15)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v61 = v35;
    v62 = 2082;
    v63 = "appleAccountInformation";
    goto LABEL_22;
  }
  if (!v16)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v61 = v35;
    v62 = 2082;
    v63 = "deviceIdentifier";
    goto LABEL_22;
  }
  if (!v19)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v35;
      v62 = 2082;
      v63 = "deviceMetadata";
      goto LABEL_22;
    }
LABEL_23:
    v39 = 0;
    goto LABEL_24;
  }
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v14, &unk_1E2C3E6B0, 0, v15);
  v21 = objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPMethod:](v21, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v21, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKOverlayableWebServiceRequest secureOverlayParameters](self, "secureOverlayParameters");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    if (!-[NSArray count](self->_certificates, "count"))
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v41, OS_LOG_TYPE_DEFAULT, "Error: Tried to verify identity without certificates", buf, 2u);
      }
      v42 = v21;
      v21 = 0;
      goto LABEL_36;
    }
    v24 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKOverlayableWebServiceRequest _applySecureOverlayToDictionary:](self, "_applySecureOverlayToDictionary:", v25);
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("addressLine2"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v52, "length"))
      objc_msgSend(v25, "removeObjectForKey:", CFSTR("addressLine2"));
    v55 = v25;
    if (objc_msgSend(v25, "count"))
    {
      v51 = v24;
      PKLogFacilityTypeGetObject(0xBuLL);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v55, "allKeys");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("Encrypted Identity Verification Fields: %@"), v53);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        v61 = v28;
        _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);

      }
      oslog = v26;

      objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v55);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      certificates = self->_certificates;
      v59 = 0;
      PKPeerPaymentEncryptDataWithCertChain(v29, certificates, &v59);
      v31 = objc_claimAutoreleasedReturnValue();
      v54 = v59;

      if (v31)
      {
        v32 = v31;
        v24 = v51;
        v33 = v55;
        v57 = v32;
LABEL_33:

        objc_autoreleasePoolPop(v24);
        if (v57)
        {
          v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v57, 4);
          objc_msgSend(v58, "setObject:forKey:", CFSTR("EV_ECC_v1-ASN.1"), CFSTR("encryptionVersion"));
          objc_msgSend(v58, "setObject:forKey:", v56, CFSTR("encryptedInputData"));
          -[NSObject hexEncoding](v54, "hexEncoding");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setObject:forKey:", v43, CFSTR("publicKeyHash"));

        }
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKOverlayableWebServiceRequest _applyOverlayToDictionary:](self, "_applyOverlayToDictionary:", v44);
        objc_msgSend(v58, "setObject:forKey:", v44, CFSTR("inputData"));

        v41 = v54;
        v42 = v57;
LABEL_36:

        goto LABEL_37;
      }
      v24 = v51;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, oslog, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate peer payment identity verification request encryptedCardData. This is bad!", buf, 2u);
      }

      v57 = 0;
    }
    else
    {
      v57 = 0;
      v54 = 0;
    }
    v33 = v55;
    goto LABEL_33;
  }
LABEL_37:
  if (v17)
  {
    objc_msgSend(v17, "hexEncoding");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setObject:forKey:", v45, CFSTR("deviceScore"));

  }
  if (v18)
    objc_msgSend(v58, "setObject:forKey:", v18, CFSTR("odiAssessment"));
  objc_msgSend(v20, "dictionaryRepresentation");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setObject:forKey:", v46, CFSTR("deviceMetadata"));

  prerequisiteIdentifier = self->_prerequisiteIdentifier;
  if (prerequisiteIdentifier)
    objc_msgSend(v58, "setObject:forKey:", prerequisiteIdentifier, CFSTR("prerequisiteIdentifier"));
  PKPeerPaymentIdentityVerificationContextToString(self->_verificationContext);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setObject:forKey:", v48, CFSTR("verificationContext"));

  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v58);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v21, "setHTTPBody:", v49);

  v39 = -[NSObject copy](v21, "copy");
LABEL_24:

  return v39;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)devSigned
{
  return self->_devSigned;
}

- (void)setDevSigned:(BOOL)a3
{
  self->_devSigned = a3;
}

- (NSString)prerequisiteIdentifier
{
  return self->_prerequisiteIdentifier;
}

- (void)setPrerequisiteIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
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
  objc_storeStrong((id *)&self->_prerequisiteIdentifier, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end
