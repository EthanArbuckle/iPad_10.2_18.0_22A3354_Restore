@implementation PKApplyWebServiceCreateRequest

- (PKApplyWebServiceCreateRequest)initWithCoder:(id)a3
{
  id v4;
  PKApplyWebServiceCreateRequest *v5;
  uint64_t v6;
  PKPaymentInstallmentConfiguration *installmentConfiguration;
  uint64_t v8;
  NSString *accountIdentifier;
  uint64_t v10;
  NSString *referenceIdentifier;
  uint64_t v12;
  NSString *fundingSourceIdentifier;
  uint64_t v14;
  PKFeatureApplicationInvitationDetails *invitationDetails;
  uint64_t v16;
  NSString *preliminaryAssessmentIdentifier;
  uint64_t v18;
  NSString *odiAssessment;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKApplyWebServiceCreateRequest;
  v5 = -[PKApplyWebServiceRequest initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_featureIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("featureIdentifier"));
    v5->_featureProduct = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("featureProduct"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentConfiguration"));
    v6 = objc_claimAutoreleasedReturnValue();
    installmentConfiguration = v5->_installmentConfiguration;
    v5->_installmentConfiguration = (PKPaymentInstallmentConfiguration *)v6;

    v5->_updateUserInfoSubType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("updateUserInfoSubType"));
    v5->_channel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("channel"));
    v5->_applicationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("applicationType"));
    v5->_verificationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("verificationType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fundingSourceIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    fundingSourceIdentifier = v5->_fundingSourceIdentifier;
    v5->_fundingSourceIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitationDetails"));
    v14 = objc_claimAutoreleasedReturnValue();
    invitationDetails = v5->_invitationDetails;
    v5->_invitationDetails = (PKFeatureApplicationInvitationDetails *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preliminaryAssessmentIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    preliminaryAssessmentIdentifier = v5->_preliminaryAssessmentIdentifier;
    v5->_preliminaryAssessmentIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("odiAssessment"));
    v18 = objc_claimAutoreleasedReturnValue();
    odiAssessment = v5->_odiAssessment;
    v5->_odiAssessment = (NSString *)v18;

    v5->_associatedIntent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("associatedIntent"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceCreateRequest;
  v4 = a3;
  -[PKApplyWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_featureIdentifier, CFSTR("featureIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_featureProduct, CFSTR("featureProduct"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_installmentConfiguration, CFSTR("installmentConfiguration"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_updateUserInfoSubType, CFSTR("updateUserInfoSubType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_channel, CFSTR("channel"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_applicationType, CFSTR("applicationType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_verificationType, CFSTR("verificationType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_referenceIdentifier, CFSTR("referenceIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fundingSourceIdentifier, CFSTR("fundingSourceIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_invitationDetails, CFSTR("invitationDetails"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_preliminaryAssessmentIdentifier, CFSTR("preliminaryAssessmentIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_odiAssessment, CFSTR("odiAssessment"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_associatedIntent, CFSTR("associatedIntent"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t featureIdentifier;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  PKPaymentInstallmentConfiguration *installmentConfiguration;
  unint64_t featureProduct;
  void *v16;
  int64_t applicationType;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  NSString *preliminaryAssessmentIdentifier;
  void *v23;
  void *v24;
  NSString *odiAssessment;
  int64_t updateUserInfoSubType;
  void *v27;
  int64_t channel;
  void *v29;
  int64_t associatedIntent;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  objc_class *v36;
  objc_class *v37;
  _QWORD v39[3];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_33;
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v35;
    v42 = 2082;
    v43 = "url";
LABEL_32:
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_33;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_33;
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v35;
    v42 = 2082;
    v43 = "appleAccountInformation";
    goto LABEL_32;
  }
  featureIdentifier = self->_featureIdentifier;
  if (!featureIdentifier)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v35;
      v42 = 2082;
      v43 = "_featureIdentifier";
      goto LABEL_32;
    }
LABEL_33:
    v33 = 0;
    goto LABEL_34;
  }
  PKFeatureIdentifierToString(featureIdentifier);
  v10 = objc_claimAutoreleasedReturnValue();
  v39[0] = CFSTR("applications");
  v39[1] = v10;
  v39[2] = CFSTR("create");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, v11, 0, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v12, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  -[PKApplyWebServiceRequest _createMutableBody](self, "_createMutableBody");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  installmentConfiguration = self->_installmentConfiguration;
  if (installmentConfiguration)
    -[PKPaymentInstallmentConfiguration encodeToBodyDictionary:](installmentConfiguration, "encodeToBodyDictionary:", v13);
  featureProduct = self->_featureProduct;
  if (featureProduct)
  {
    PKFeatureProductToString(featureProduct);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("productType"));

  }
  applicationType = self->_applicationType;
  if (applicationType)
  {
    PKFeatureApplicationTypeToString(applicationType);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("applicationType"));

    objc_msgSend(v13, "setObject:forKeyedSubscript:", self->_referenceIdentifier, CFSTR("referenceIdentifier"));
    v19 = self->_applicationType;
    if (v19 == 2)
    {
      -[PKFeatureApplicationInvitationDetails jsonRepresentation](self->_invitationDetails, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("invitationDetails"));

      objc_msgSend(v13, "setObject:forKeyedSubscript:", self->_accountIdentifier, CFSTR("accountIdentifier"));
      v19 = self->_applicationType;
    }
    if (v19 == 6)
    {
      PKApplyVerificationTypeToString(self->_verificationType);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("verificationType"));

    }
  }
  preliminaryAssessmentIdentifier = self->_preliminaryAssessmentIdentifier;
  if (preliminaryAssessmentIdentifier)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", preliminaryAssessmentIdentifier, CFSTR("preliminaryAssessmentIdentifier"));
  -[PKApplyWebServiceRequest experimentDetails](self, "experimentDetails");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[PKApplyWebServiceRequest experimentDetails](self, "experimentDetails");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, CFSTR("experiment"));

  }
  odiAssessment = self->_odiAssessment;
  if (odiAssessment)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", odiAssessment, CFSTR("odiAssessment"));
  updateUserInfoSubType = self->_updateUserInfoSubType;
  if (updateUserInfoSubType)
  {
    PKFeatureApplicationUpdateUserInfoSubTypeToString(updateUserInfoSubType);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, CFSTR("updateUserInfoSubType"));

  }
  channel = self->_channel;
  if (channel)
  {
    PKFeatureApplicationChannelToString(channel);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v29, CFSTR("channel"));

  }
  associatedIntent = self->_associatedIntent;
  if (associatedIntent)
  {
    PKFeatureApplicationAssociatedIntentToString(associatedIntent);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v31, CFSTR("associatedIntent"));

  }
  objc_msgSend(v13, "safelySetObject:forKey:", self->_fundingSourceIdentifier, CFSTR("fundingSourceIdentifier"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHTTPBody:", v32);

  v33 = (void *)objc_msgSend(v12, "copy");
LABEL_34:

  return v33;
}

- (NSURL)applyServiceURL
{
  return self->_applyServiceURL;
}

- (void)setApplyServiceURL:(id)a3
{
  objc_storeStrong((id *)&self->_applyServiceURL, a3);
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

- (PKPaymentInstallmentConfiguration)installmentConfiguration
{
  return self->_installmentConfiguration;
}

- (void)setInstallmentConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_installmentConfiguration, a3);
}

- (int64_t)applicationType
{
  return self->_applicationType;
}

- (void)setApplicationType:(int64_t)a3
{
  self->_applicationType = a3;
}

- (int64_t)updateUserInfoSubType
{
  return self->_updateUserInfoSubType;
}

- (void)setUpdateUserInfoSubType:(int64_t)a3
{
  self->_updateUserInfoSubType = a3;
}

- (unint64_t)verificationType
{
  return self->_verificationType;
}

- (void)setVerificationType:(unint64_t)a3
{
  self->_verificationType = a3;
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void)setReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)fundingSourceIdentifier
{
  return self->_fundingSourceIdentifier;
}

- (void)setFundingSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (int64_t)associatedIntent
{
  return self->_associatedIntent;
}

- (void)setAssociatedIntent:(int64_t)a3
{
  self->_associatedIntent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_preliminaryAssessmentIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationDetails, 0);
  objc_storeStrong((id *)&self->_fundingSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
  objc_storeStrong((id *)&self->_applyServiceURL, 0);
}

@end
