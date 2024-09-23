@implementation PKApplyWebServiceApplyRequest

- (PKApplyWebServiceApplyRequest)initWithCoder:(id)a3
{
  id v4;
  PKApplyWebServiceApplyRequest *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  uint64_t v8;
  NSURL *baseURL;
  uint64_t v10;
  NSString *coreIDVNextStepToken;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *certificates;
  uint64_t v17;
  NSString *previousContextIdentifier;
  uint64_t v19;
  NSString *actionIdentifier;
  uint64_t v21;
  PKPaymentInstallmentConfiguration *installmentConfiguration;
  uint64_t v23;
  NSString *accountIdentifier;
  uint64_t v25;
  NSString *referenceIdentifier;
  uint64_t v27;
  PKFeatureApplicationInvitationDetails *invitationDetails;
  uint64_t v29;
  NSString *preliminaryAssessmentIdentifier;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSSet *termsIdentifiers;
  uint64_t v36;
  PKPaymentDeviceMetadata *deviceMetadata;
  uint64_t v38;
  PKApplyWebServiceRequestAuthenticationContext *authenticationContext;
  uint64_t v40;
  NSString *odiAssessment;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKApplyWebServiceApplyRequest;
  v5 = -[PKApplyWebServiceRequest initWithCoder:](&v43, sel_initWithCoder_, v4);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coreIDVNextStepToken"));
    v10 = objc_claimAutoreleasedReturnValue();
    coreIDVNextStepToken = v5->_coreIDVNextStepToken;
    v5->_coreIDVNextStepToken = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("certificates"));
    v15 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v15;

    v5->_featureIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("featureIdentifier"));
    v5->_featureProduct = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("featureProduct"));
    v5->_updateUserInfoSubType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("updateUserInfoSubType"));
    v5->_channel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("channel"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousContextIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    previousContextIdentifier = v5->_previousContextIdentifier;
    v5->_previousContextIdentifier = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentConfiguration"));
    v21 = objc_claimAutoreleasedReturnValue();
    installmentConfiguration = v5->_installmentConfiguration;
    v5->_installmentConfiguration = (PKPaymentInstallmentConfiguration *)v21;

    v5->_applicationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("applicationType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v23 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitationDetails"));
    v27 = objc_claimAutoreleasedReturnValue();
    invitationDetails = v5->_invitationDetails;
    v5->_invitationDetails = (PKFeatureApplicationInvitationDetails *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preliminaryAssessmentIdentifier"));
    v29 = objc_claimAutoreleasedReturnValue();
    preliminaryAssessmentIdentifier = v5->_preliminaryAssessmentIdentifier;
    v5->_preliminaryAssessmentIdentifier = (NSString *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("termsIdentifiers"));
    v34 = objc_claimAutoreleasedReturnValue();
    termsIdentifiers = v5->_termsIdentifiers;
    v5->_termsIdentifiers = (NSSet *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceMetadata"));
    v36 = objc_claimAutoreleasedReturnValue();
    deviceMetadata = v5->_deviceMetadata;
    v5->_deviceMetadata = (PKPaymentDeviceMetadata *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationContext"));
    v38 = objc_claimAutoreleasedReturnValue();
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (PKApplyWebServiceRequestAuthenticationContext *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("odiAssessment"));
    v40 = objc_claimAutoreleasedReturnValue();
    odiAssessment = v5->_odiAssessment;
    v5->_odiAssessment = (NSString *)v40;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceApplyRequest;
  v4 = a3;
  -[PKApplyWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("applicationIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_baseURL, CFSTR("baseURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_coreIDVNextStepToken, CFSTR("coreIDVNextStepToken"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_certificates, CFSTR("certificates"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_featureIdentifier, CFSTR("featureIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_featureProduct, CFSTR("featureProduct"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_updateUserInfoSubType, CFSTR("updateUserInfoSubType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_channel, CFSTR("channel"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_previousContextIdentifier, CFSTR("previousContextIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionIdentifier, CFSTR("actionIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_installmentConfiguration, CFSTR("installmentConfiguration"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_applicationType, CFSTR("applicationType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_referenceIdentifier, CFSTR("referenceIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_invitationDetails, CFSTR("invitationDetails"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_preliminaryAssessmentIdentifier, CFSTR("preliminaryAssessmentIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_termsIdentifiers, CFSTR("termsIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceMetadata, CFSTR("deviceMetadata"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_authenticationContext, CFSTR("authenticationContext"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_odiAssessment, CFSTR("odiAssessment"));

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
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *certificates;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  objc_class *v30;
  id v31;
  NSObject *v32;
  os_signpost_id_t v33;
  os_signpost_id_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSString *coreIDVNextStepToken;
  NSString *previousContextIdentifier;
  NSString *actionIdentifier;
  PKPaymentInstallmentConfiguration *installmentConfiguration;
  unint64_t featureProduct;
  void *v43;
  int64_t applicationType;
  void *v45;
  void *v46;
  NSString *preliminaryAssessmentIdentifier;
  void *v48;
  int64_t updateUserInfoSubType;
  void *v50;
  int64_t channel;
  void *v52;
  void *v53;
  PKApplyWebServiceRequestAuthenticationContext *authenticationContext;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSString *odiAssessment;
  void *v61;
  void *v63;
  id v64;
  _QWORD v65[3];
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  const char *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v67 = v28;
    v68 = 2082;
    v69 = "_baseURL";
LABEL_20:
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_21;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v67 = v28;
    v68 = 2082;
    v69 = "appleAccountInformation";
    goto LABEL_20;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (!applicationIdentifier)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v67 = v28;
      v68 = 2082;
      v69 = "_applicationIdentifier";
      goto LABEL_20;
    }
LABEL_21:
    v31 = 0;
    goto LABEL_66;
  }
  v65[0] = CFSTR("applications");
  v65[1] = applicationIdentifier;
  v65[2] = CFSTR("apply");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", baseURL, v8, 0, v5);
  v9 = objc_claimAutoreleasedReturnValue();

  -[NSObject setHTTPMethod:](v9, "setHTTPMethod:", CFSTR("POST"));
  -[NSObject setValue:forHTTPHeaderField:](v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  -[NSObject setCachePolicy:](v9, "setCachePolicy:", 1);
  -[PKApplyWebServiceRequest _createMutableBody](self, "_createMutableBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKOverlayableWebServiceRequest secureOverlayParameters](self, "secureOverlayParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  v13 = 0x1E0C99000uLL;
  if (v12)
  {
    if (-[NSArray count](self->_certificates, "count"))
    {
      PKLogFacilityTypeGetObject(0x22uLL);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = os_signpost_id_make_with_pointer(v14, self);
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v16 = v15;
        if (os_signpost_enabled(v14))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18FC92000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "request:applyRequest:encryption", ", buf, 2u);
        }
      }

      v17 = (void *)MEMORY[0x19400CFE8]();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKOverlayableWebServiceRequest _applySecureOverlayToDictionary:](self, "_applySecureOverlayToDictionary:", v18);
      if (objc_msgSend(v18, "count"))
      {
        v63 = v17;
        PKLogFacilityTypeGetObject(0xDuLL);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v18, "allKeys");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("Encrypted Apply Fields: %@"), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138477827;
          v67 = v22;
          _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);

        }
        objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        certificates = self->_certificates;
        v64 = 0;
        PKFeatureEncryptDataWithCertChain(v23, certificates, &v64, self->_featureIdentifier);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v64;

        if (v25)
        {
          v13 = 0x1E0C99000;
          v17 = v63;
        }
        else
        {
          v17 = v63;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate apply request encryptedCardData. This is bad!", buf, 2u);
          }

          v25 = 0;
          v13 = 0x1E0C99000uLL;
        }
      }
      else
      {
        v26 = 0;
        v25 = 0;
      }

      objc_autoreleasePoolPop(v17);
      v32 = v14;
      v33 = os_signpost_id_make_with_pointer(v32, self);
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v34 = v33;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18FC92000, v32, OS_SIGNPOST_INTERVAL_END, v34, "request:applyRequest:encryption", ", buf, 2u);
        }
      }

      if (v25)
      {
        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v25, 4);
        objc_msgSend(v10, "setObject:forKey:", CFSTR("EV_ECC_v1-ASN.1"), CFSTR("encryptionVersion"));
        objc_msgSend(v10, "setObject:forKey:", v35, CFSTR("encryptedInputData"));
        -[NSObject hexEncoding](v26, "hexEncoding");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v36, CFSTR("publicKeyHash"));

      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0xDuLL);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Error: Tried to apply without certificates", buf, 2u);
      }
      v25 = v9;
      v9 = 0;
    }

  }
  objc_msgSend(*(id *)(v13 + 3592), "dictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKOverlayableWebServiceRequest _applyOverlayToDictionary:](self, "_applyOverlayToDictionary:", v37);
  objc_msgSend(v10, "setObject:forKey:", v37, CFSTR("inputData"));
  coreIDVNextStepToken = self->_coreIDVNextStepToken;
  if (coreIDVNextStepToken)
    objc_msgSend(v10, "setObject:forKey:", coreIDVNextStepToken, CFSTR("coreIDVNextStepToken"));
  previousContextIdentifier = self->_previousContextIdentifier;
  if (previousContextIdentifier)
    objc_msgSend(v10, "setObject:forKey:", previousContextIdentifier, CFSTR("previousContextIdentifier"));
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier)
    objc_msgSend(v10, "setObject:forKey:", actionIdentifier, CFSTR("actionIdentifier"));
  installmentConfiguration = self->_installmentConfiguration;
  if (installmentConfiguration)
    -[PKPaymentInstallmentConfiguration encodeToBodyDictionary:](installmentConfiguration, "encodeToBodyDictionary:", v10);
  featureProduct = self->_featureProduct;
  if (featureProduct)
  {
    PKFeatureProductToString(featureProduct);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v43, CFSTR("productType"));

  }
  applicationType = self->_applicationType;
  if (applicationType)
  {
    PKFeatureApplicationTypeToString(applicationType);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v45, CFSTR("applicationType"));

    objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_referenceIdentifier, CFSTR("referenceIdentifier"));
    if (self->_applicationType == 2)
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_accountIdentifier, CFSTR("accountIdentifier"));
      -[PKFeatureApplicationInvitationDetails jsonRepresentation](self->_invitationDetails, "jsonRepresentation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v46, CFSTR("invitationDetails"));

    }
  }
  preliminaryAssessmentIdentifier = self->_preliminaryAssessmentIdentifier;
  if (preliminaryAssessmentIdentifier)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", preliminaryAssessmentIdentifier, CFSTR("preliminaryAssessmentIdentifier"));
  if (-[NSSet count](self->_termsIdentifiers, "count"))
  {
    -[NSSet allObjects](self->_termsIdentifiers, "allObjects");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v48, CFSTR("termsIdentifiers"));

  }
  updateUserInfoSubType = self->_updateUserInfoSubType;
  if (updateUserInfoSubType)
  {
    PKFeatureApplicationUpdateUserInfoSubTypeToString(updateUserInfoSubType);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v50, CFSTR("updateUserInfoSubType"));

  }
  channel = self->_channel;
  if (channel)
  {
    PKFeatureApplicationChannelToString(channel);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v52, CFSTR("channel"));

  }
  -[PKPaymentDeviceMetadata dictionaryRepresentation](self->_deviceMetadata, "dictionaryRepresentation");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
    objc_msgSend(v10, "setObject:forKey:", v53, CFSTR("deviceMetadata"));
  authenticationContext = self->_authenticationContext;
  if (!authenticationContext)
    goto LABEL_63;
  -[PKApplyWebServiceRequestAuthenticationContext certificates](authenticationContext, "certificates");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v55, "count"))
    goto LABEL_62;
  -[PKApplyWebServiceRequestAuthenticationContext signature](self->_authenticationContext, "signature");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[PKApplyWebServiceRequestAuthenticationContext certificates](self->_authenticationContext, "certificates");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "pk_arrayByApplyingBlock:", &__block_literal_global_314);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v55, CFSTR("certificates"));
    -[PKApplyWebServiceRequestAuthenticationContext signature](self->_authenticationContext, "signature");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "base64EncodedStringWithOptions:", 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v59, CFSTR("signature"));

LABEL_62:
  }
LABEL_63:
  odiAssessment = self->_odiAssessment;
  if (odiAssessment)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", odiAssessment, CFSTR("odiAssessment"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v10);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setHTTPBody:](v9, "setHTTPBody:", v61);

  v31 = -[NSObject copy](v9, "copy");
LABEL_66:

  return v31;
}

uint64_t __72__PKApplyWebServiceApplyRequest__urlRequestWithAppleAccountInformation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
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

- (unint64_t)featureProduct
{
  return self->_featureProduct;
}

- (void)setFeatureProduct:(unint64_t)a3
{
  self->_featureProduct = a3;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (NSString)coreIDVNextStepToken
{
  return self->_coreIDVNextStepToken;
}

- (void)setCoreIDVNextStepToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)previousContextIdentifier
{
  return self->_previousContextIdentifier;
}

- (void)setPreviousContextIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (PKPaymentInstallmentConfiguration)installmentConfiguration
{
  return self->_installmentConfiguration;
}

- (void)setInstallmentConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_installmentConfiguration, a3);
}

- (int64_t)updateUserInfoSubType
{
  return self->_updateUserInfoSubType;
}

- (void)setUpdateUserInfoSubType:(int64_t)a3
{
  self->_updateUserInfoSubType = a3;
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

- (int64_t)applicationType
{
  return self->_applicationType;
}

- (void)setApplicationType:(int64_t)a3
{
  self->_applicationType = a3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void)setReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (PKFeatureApplicationInvitationDetails)invitationDetails
{
  return self->_invitationDetails;
}

- (void)setInvitationDetails:(id)a3
{
  objc_storeStrong((id *)&self->_invitationDetails, a3);
}

- (NSString)preliminaryAssessmentIdentifier
{
  return self->_preliminaryAssessmentIdentifier;
}

- (void)setPreliminaryAssessmentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSSet)termsIdentifiers
{
  return self->_termsIdentifiers;
}

- (void)setTermsIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMetadata, a3);
}

- (PKApplyWebServiceRequestAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationContext, a3);
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_termsIdentifiers, 0);
  objc_storeStrong((id *)&self->_preliminaryAssessmentIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationDetails, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_previousContextIdentifier, 0);
  objc_storeStrong((id *)&self->_coreIDVNextStepToken, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
