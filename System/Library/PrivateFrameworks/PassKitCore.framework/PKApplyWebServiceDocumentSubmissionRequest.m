@implementation PKApplyWebServiceDocumentSubmissionRequest

- (PKApplyWebServiceDocumentSubmissionRequest)initWithCoder:(id)a3
{
  id v4;
  PKApplyWebServiceDocumentSubmissionRequest *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  uint64_t v8;
  NSURL *baseURL;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *certificates;
  uint64_t v15;
  NSString *documentCountryCode;
  uint64_t v17;
  NSData *frontImageData;
  uint64_t v19;
  NSData *backImageData;
  uint64_t v21;
  NSData *uploadedDocumentData;
  uint64_t v23;
  NSString *odiAssessment;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKApplyWebServiceDocumentSubmissionRequest;
  v5 = -[PKApplyWebServiceRequest initWithCoder:](&v26, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("certificates"));
    v13 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v13;

    v5->_featureIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("featureIdentifier"));
    v5->_documentType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("documentType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v15 = objc_claimAutoreleasedReturnValue();
    documentCountryCode = v5->_documentCountryCode;
    v5->_documentCountryCode = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frontImageData"));
    v17 = objc_claimAutoreleasedReturnValue();
    frontImageData = v5->_frontImageData;
    v5->_frontImageData = (NSData *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backImageData"));
    v19 = objc_claimAutoreleasedReturnValue();
    backImageData = v5->_backImageData;
    v5->_backImageData = (NSData *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uploadedDocumentData"));
    v21 = objc_claimAutoreleasedReturnValue();
    uploadedDocumentData = v5->_uploadedDocumentData;
    v5->_uploadedDocumentData = (NSData *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("odiAssessment"));
    v23 = objc_claimAutoreleasedReturnValue();
    odiAssessment = v5->_odiAssessment;
    v5->_odiAssessment = (NSString *)v23;

    v5->_channel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("channel"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceDocumentSubmissionRequest;
  v4 = a3;
  -[PKApplyWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("applicationIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_baseURL, CFSTR("baseURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_certificates, CFSTR("certificates"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_featureIdentifier, CFSTR("featureIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_documentType, CFSTR("documentType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_documentCountryCode, CFSTR("countryCode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_frontImageData, CFSTR("frontImageData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_backImageData, CFSTR("backImageData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_uploadedDocumentData, CFSTR("uploadedDocumentData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_odiAssessment, CFSTR("odiAssessment"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_channel, CFSTR("channel"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  NSURL *baseURL;
  NSString *applicationIdentifier;
  void *v7;
  NSObject *v8;
  id v9;
  NSData *uploadedDocumentData;
  void *v11;
  const __CFString *v12;
  objc_class *v13;
  NSObject *v14;
  const char *v15;
  objc_class *v16;
  objc_class *v17;
  NSObject *v18;
  uint32_t v19;
  id v20;
  NSData *frontImageData;
  void *v23;
  NSData *backImageData;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSArray *certificates;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  NSString *odiAssessment;
  int64_t channel;
  void *v40;
  void *v41;
  const __CFString *v42;
  id v43;
  _QWORD v44[4];
  uint8_t buf[4];
  NSObject *v46;
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v14;
    v47 = 2082;
    v48 = "appleAccountInformation";
    v15 = "Request %{public}@ missing parameter '%{public}s'.";
LABEL_13:
    v18 = v8;
    v19 = 22;
    goto LABEL_14;
  }
  if (!self->_documentCountryCode)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v14 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v14;
    v47 = 2082;
    v48 = "_documentCountryCode";
    v15 = "Request %{public}@ missing parameter '%{public}s'.";
    goto LABEL_13;
  }
  if (!self->_documentType)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v14 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v14;
      v47 = 2082;
      v48 = "_documentType";
      v15 = "Request %{public}@ missing parameter '%{public}s'.";
      goto LABEL_13;
    }
LABEL_16:
    v20 = 0;
    goto LABEL_17;
  }
  baseURL = self->_baseURL;
  applicationIdentifier = self->_applicationIdentifier;
  v44[0] = CFSTR("applications");
  v44[1] = applicationIdentifier;
  v44[2] = CFSTR("documents");
  v44[3] = CFSTR("submit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v7, 0, v4);
  v8 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v8, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  if (!-[NSArray count](self->_certificates, "count"))
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v15 = "Error: Tried to submit document without certificates";
    v18 = v14;
    v19 = 2;
LABEL_14:
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, v15, buf, v19);
LABEL_15:

    goto LABEL_16;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  uploadedDocumentData = self->_uploadedDocumentData;
  if (uploadedDocumentData)
  {
    -[NSData base64EncodedStringWithOptions:](uploadedDocumentData, "base64EncodedStringWithOptions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("documentData"));
    v12 = CFSTR("uploadedDocumentData");
  }
  else
  {
    frontImageData = self->_frontImageData;
    if (frontImageData)
    {
      -[NSData base64EncodedStringWithOptions:](frontImageData, "base64EncodedStringWithOptions:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v23, CFSTR("documentFrontImage"));

    }
    backImageData = self->_backImageData;
    if (!backImageData)
    {
      v12 = CFSTR("encryptedDocumentData");
      goto LABEL_25;
    }
    -[NSData base64EncodedStringWithOptions:](backImageData, "base64EncodedStringWithOptions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("documentBackImage"));
    v12 = CFSTR("encryptedDocumentData");
  }

LABEL_25:
  objc_msgSend(v9, "setObject:forKey:", self->_documentCountryCode, CFSTR("documentCountryCode"));
  PKPaymentDocumentTypeToString(self->_documentType);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v25, CFSTR("documentType"));

  v26 = (void *)MEMORY[0x19400CFE8]();
  if (objc_msgSend(v9, "count"))
  {
    v42 = v12;
    PKLogFacilityTypeGetObject(0xDuLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "allKeys");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("Encrypted document data: %@"), v29);
      v30 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v46 = v30;
      _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);

    }
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    certificates = self->_certificates;
    v43 = 0;
    PKFeatureEncryptDataWithCertChain(v31, certificates, &v43, self->_featureIdentifier);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v43;

    if (v33)
    {
      v12 = v42;
    }
    else
    {
      v12 = v42;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate apply document submission request encryptedDocumentData. This is bad!", buf, 2u);
      }

      v33 = 0;
    }
  }
  else
  {
    v33 = 0;
    v34 = 0;
  }
  objc_autoreleasePoolPop(v26);
  -[PKApplyWebServiceRequest _createMutableBody](self, "_createMutableBody");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v33, 4);
    objc_msgSend(v35, "setObject:forKey:", CFSTR("EV_ECC_v1-ASN.1"), CFSTR("encryptionVersion"));
    objc_msgSend(v35, "setObject:forKey:", v36, v12);
    objc_msgSend(v34, "hexEncoding");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKey:", v37, CFSTR("publicKeyHash"));

  }
  odiAssessment = self->_odiAssessment;
  if (odiAssessment)
    objc_msgSend(v35, "setObject:forKey:", odiAssessment, CFSTR("odiAssessment"));
  channel = self->_channel;
  if (channel)
  {
    PKFeatureApplicationChannelToString(channel);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v40, CFSTR("channel"));

  }
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v35);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v8, "setHTTPBody:", v41);

  v20 = -[NSObject copy](v8, "copy");
LABEL_17:

  return v20;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (NSData)frontImageData
{
  return self->_frontImageData;
}

- (void)setFrontImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSData)backImageData
{
  return self->_backImageData;
}

- (void)setBackImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSData)uploadedDocumentData
{
  return self->_uploadedDocumentData;
}

- (void)setUploadedDocumentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)documentCountryCode
{
  return self->_documentCountryCode;
}

- (void)setDocumentCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_documentCountryCode, 0);
  objc_storeStrong((id *)&self->_uploadedDocumentData, 0);
  objc_storeStrong((id *)&self->_backImageData, 0);
  objc_storeStrong((id *)&self->_frontImageData, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
