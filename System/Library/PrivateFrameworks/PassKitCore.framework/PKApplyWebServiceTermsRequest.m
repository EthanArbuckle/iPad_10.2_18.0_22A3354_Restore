@implementation PKApplyWebServiceTermsRequest

- (PKApplyWebServiceTermsRequest)initWithCoder:(id)a3
{
  id v4;
  PKApplyWebServiceTermsRequest *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  uint64_t v8;
  NSURL *baseURL;
  uint64_t v10;
  NSString *applicationTermsIdentifier;
  uint64_t v12;
  NSString *offerTermsIdentifier;
  uint64_t v14;
  NSString *pathTermsIdentifier;
  uint64_t v16;
  NSString *pathIdentifier;
  uint64_t v18;
  PKPaymentDeviceMetadata *deviceMetadata;
  uint64_t v20;
  PKPaymentInstallmentConfiguration *installmentConfiguration;
  uint64_t v22;
  NSString *odiAssessment;
  uint64_t v24;
  PKApplyWebServiceRequestAuthenticationContext *authenticationContext;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKApplyWebServiceTermsRequest;
  v5 = -[PKApplyWebServiceRequest initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    v5->_termsAccepted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("termsAccepted"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationTermsIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    applicationTermsIdentifier = v5->_applicationTermsIdentifier;
    v5->_applicationTermsIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offerTermsIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    offerTermsIdentifier = v5->_offerTermsIdentifier;
    v5->_offerTermsIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pathTermsIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    pathTermsIdentifier = v5->_pathTermsIdentifier;
    v5->_pathTermsIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pathIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    pathIdentifier = v5->_pathIdentifier;
    v5->_pathIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceMetadata"));
    v18 = objc_claimAutoreleasedReturnValue();
    deviceMetadata = v5->_deviceMetadata;
    v5->_deviceMetadata = (PKPaymentDeviceMetadata *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentConfiguration"));
    v20 = objc_claimAutoreleasedReturnValue();
    installmentConfiguration = v5->_installmentConfiguration;
    v5->_installmentConfiguration = (PKPaymentInstallmentConfiguration *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("odiAssessment"));
    v22 = objc_claimAutoreleasedReturnValue();
    odiAssessment = v5->_odiAssessment;
    v5->_odiAssessment = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationContext"));
    v24 = objc_claimAutoreleasedReturnValue();
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (PKApplyWebServiceRequestAuthenticationContext *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceTermsRequest;
  v4 = a3;
  -[PKApplyWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("applicationIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_termsAccepted, CFSTR("termsAccepted"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_baseURL, CFSTR("baseURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationTermsIdentifier, CFSTR("applicationTermsIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_offerTermsIdentifier, CFSTR("offerTermsIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pathTermsIdentifier, CFSTR("pathTermsIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pathIdentifier, CFSTR("pathIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceMetadata, CFSTR("deviceMetadata"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_installmentConfiguration, CFSTR("installmentConfiguration"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_odiAssessment, CFSTR("odiAssessment"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_authenticationContext, CFSTR("authenticationContext"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  id v4;
  void *v5;
  NSURL *baseURL;
  NSString *applicationIdentifier;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  objc_class *v15;
  id v16;
  NSString *pathTermsIdentifier;
  NSString *pathIdentifier;
  void *v19;
  void *v20;
  PKPaymentInstallmentConfiguration *installmentConfiguration;
  NSString *odiAssessment;
  PKApplyWebServiceRequestAuthenticationContext *authenticationContext;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[3];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v13;
    v34 = 2082;
    v35 = "_baseURL";
LABEL_12:
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_13;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v13;
    v34 = 2082;
    v35 = "appleAccountInformation";
    goto LABEL_12;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier)
  {
    v31[0] = CFSTR("applications");
    v31[1] = applicationIdentifier;
    v31[2] = CFSTR("terms");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v8, 0, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    -[NSObject setHTTPMethod:](v9, "setHTTPMethod:", CFSTR("POST"));
    -[NSObject setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    -[PKApplyWebServiceRequest _createMutableBody](self, "_createMutableBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (self->_applicationTermsIdentifier || self->_offerTermsIdentifier)
      objc_msgSend(v10, "setObject:forKey:");
    pathTermsIdentifier = self->_pathTermsIdentifier;
    if (pathTermsIdentifier)
      objc_msgSend(v11, "setObject:forKey:", pathTermsIdentifier, CFSTR("pathTermsIdentifier"));
    pathIdentifier = self->_pathIdentifier;
    if (pathIdentifier)
      objc_msgSend(v11, "setObject:forKey:", pathIdentifier, CFSTR("pathIdentifier"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_termsAccepted);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v19, CFSTR("termsAccepted"));

    -[PKPaymentDeviceMetadata dictionaryRepresentation](self->_deviceMetadata, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v11, "setObject:forKey:", v20, CFSTR("deviceMetadata"));
    installmentConfiguration = self->_installmentConfiguration;
    if (installmentConfiguration)
      -[PKPaymentInstallmentConfiguration encodeToBodyDictionary:](installmentConfiguration, "encodeToBodyDictionary:", v11);
    odiAssessment = self->_odiAssessment;
    if (odiAssessment)
      objc_msgSend(v11, "setObject:forKey:", odiAssessment, CFSTR("odiAssessment"));
    authenticationContext = self->_authenticationContext;
    if (!authenticationContext)
      goto LABEL_31;
    -[PKApplyWebServiceRequestAuthenticationContext certificates](authenticationContext, "certificates");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
    {
      -[PKApplyWebServiceRequestAuthenticationContext signature](self->_authenticationContext, "signature");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
LABEL_31:
        objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v11);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setHTTPBody:](v9, "setHTTPBody:", v29);

        v16 = -[NSObject copy](v9, "copy");
        goto LABEL_32;
      }
      -[PKApplyWebServiceRequestAuthenticationContext certificates](self->_authenticationContext, "certificates");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pk_arrayByApplyingBlock:", &__block_literal_global_457);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, CFSTR("certificates"));
      -[PKApplyWebServiceRequestAuthenticationContext signature](self->_authenticationContext, "signature");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "base64EncodedStringWithOptions:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, CFSTR("signature"));

    }
    goto LABEL_31;
  }
  PKLogFacilityTypeGetObject(0xDuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v13;
    v34 = 2082;
    v35 = "_applicationIdentifier";
    goto LABEL_12;
  }
LABEL_13:
  v16 = 0;
LABEL_32:

  return v16;
}

uint64_t __72__PKApplyWebServiceTermsRequest__urlRequestWithAppleAccountInformation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)applicationTermsIdentifier
{
  return self->_applicationTermsIdentifier;
}

- (void)setApplicationTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)offerTermsIdentifier
{
  return self->_offerTermsIdentifier;
}

- (void)setOfferTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)pathTermsIdentifier
{
  return self->_pathTermsIdentifier;
}

- (void)setPathTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)pathIdentifier
{
  return self->_pathIdentifier;
}

- (void)setPathIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)termsAccepted
{
  return self->_termsAccepted;
}

- (void)setTermsAccepted:(BOOL)a3
{
  self->_termsAccepted = a3;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMetadata, a3);
}

- (PKPaymentInstallmentConfiguration)installmentConfiguration
{
  return self->_installmentConfiguration;
}

- (void)setInstallmentConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_installmentConfiguration, a3);
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (PKApplyWebServiceRequestAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_pathIdentifier, 0);
  objc_storeStrong((id *)&self->_pathTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_offerTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
