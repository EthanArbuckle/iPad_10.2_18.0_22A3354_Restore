@implementation PKFeatureApplication

- (PKFeatureApplication)initWithDictionary:(id)a3
{
  id v4;
  PKFeatureApplication *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  uint64_t v8;
  NSURL *applicationBaseURL;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unint64_t applicationState;
  NSObject *v18;
  const char *v19;
  PKFeatureApplication *v20;
  void *v21;
  PKFeatureApplicationOfferDetails *v22;
  PKFeatureApplicationOfferDetails *applicationOfferDetails;
  void *v24;
  PKFeatureApplicationDeclineDetails *v25;
  PKFeatureApplicationDeclineDetails *declineDetails;
  uint64_t v27;
  NSString *applicationTermsIdentifier;
  uint64_t v29;
  NSDate *lastUpdated;
  uint64_t v31;
  NSString *businessChatIdentifier;
  uint64_t v33;
  NSString *coreIDVServiceProviderName;
  void *v35;
  uint64_t v36;
  NSString *accountIdentifier;
  uint64_t v38;
  NSString *referenceIdentifier;
  void *v40;
  PKFeatureApplicationInvitationDetails *v41;
  PKFeatureApplicationInvitationDetails *invitationDetails;
  uint64_t v43;
  NSString *preliminaryAssessmentIdentifier;
  objc_super v46;
  uint8_t buf[4];
  NSObject *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKFeatureApplication;
  v5 = -[PKFeatureApplication init](&v46, sel_init);
  if (!v5)
    goto LABEL_36;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("applicationIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  applicationIdentifier = v5->_applicationIdentifier;
  v5->_applicationIdentifier = (NSString *)v6;

  if (-[NSString length](v5->_applicationIdentifier, "length"))
  {
    objc_msgSend(v4, "PKURLForKey:", CFSTR("applicationBaseURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    applicationBaseURL = v5->_applicationBaseURL;
    v5->_applicationBaseURL = (NSURL *)v8;

    if (v5->_applicationBaseURL)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("featureIdentifier"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = PKFeatureIdentifierFromString(v10);
      v5->_feature = v11;
      if (!v11)
      {
        PKLogFacilityTypeGetObject(0xDuLL);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v10;
          _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Error: Feature identifier: %@ unknown", buf, 0xCu);
        }
        goto LABEL_21;
      }
      objc_msgSend(v4, "PKStringForKey:", CFSTR("applicationType"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = PKFeatureApplicationTypeFromString(v12);
      v5->_applicationType = v13;
      if (!v13)
      {
        PKLogFacilityTypeGetObject(0xDuLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v12;
          _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Error: Application type: %@ unknown", buf, 0xCu);
        }
        goto LABEL_20;
      }
      objc_msgSend(v4, "PKStringForKey:", CFSTR("updateUserInfoSubType"));
      v14 = objc_claimAutoreleasedReturnValue();
      v5->_updateUserInfoSubType = PKFeatureApplicationUpdateUserInfoSubTypeFromString(v14);
      objc_msgSend(v4, "PKStringForKey:", CFSTR("applicationState"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_applicationState = PKFeatureApplicationStateFromString(v15);
      objc_msgSend(v4, "PKStringForKey:", CFSTR("applicationStateReason"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_applicationStateReason = PKFeatureApplicationStateReasonFromString(v16);
      applicationState = v5->_applicationState;
      switch(applicationState)
      {
        case 6uLL:
          objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("offerDetails"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21
            || (objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("offer")),
                (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            v22 = -[PKFeatureApplicationOfferDetails initWithDictionary:]([PKFeatureApplicationOfferDetails alloc], "initWithDictionary:", v21);
            applicationOfferDetails = v5->_applicationOfferDetails;
            v5->_applicationOfferDetails = v22;

          }
          applicationState = v5->_applicationState;
          break;
        case 0uLL:
          PKLogFacilityTypeGetObject(0xDuLL);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Error: Application state unknown", buf, 2u);
          }

LABEL_20:
LABEL_21:

          goto LABEL_22;
        case 7uLL:
          objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("declineDetails"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v25 = -[PKFeatureApplicationDeclineDetails initWithDictionary:]([PKFeatureApplicationDeclineDetails alloc], "initWithDictionary:", v24);
            declineDetails = v5->_declineDetails;
            v5->_declineDetails = v25;

          }
          break;
      }
      objc_msgSend(v4, "PKStringForKey:", CFSTR("applicationTermsIdentifier"));
      v27 = objc_claimAutoreleasedReturnValue();
      applicationTermsIdentifier = v5->_applicationTermsIdentifier;
      v5->_applicationTermsIdentifier = (NSString *)v27;

      objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdated"));
      v29 = objc_claimAutoreleasedReturnValue();
      lastUpdated = v5->_lastUpdated;
      v5->_lastUpdated = (NSDate *)v29;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("businessChatIdentifier"));
      v31 = objc_claimAutoreleasedReturnValue();
      businessChatIdentifier = v5->_businessChatIdentifier;
      v5->_businessChatIdentifier = (NSString *)v31;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("coreIDVServiceProviderName"));
      v33 = objc_claimAutoreleasedReturnValue();
      coreIDVServiceProviderName = v5->_coreIDVServiceProviderName;
      v5->_coreIDVServiceProviderName = (NSString *)v33;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("productType"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_featureProduct = PKFeatureProductFromString(v35);

      objc_msgSend(v4, "PKStringForKey:", CFSTR("accountIdentifier"));
      v36 = objc_claimAutoreleasedReturnValue();
      accountIdentifier = v5->_accountIdentifier;
      v5->_accountIdentifier = (NSString *)v36;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("referenceIdentifier"));
      v38 = objc_claimAutoreleasedReturnValue();
      referenceIdentifier = v5->_referenceIdentifier;
      v5->_referenceIdentifier = (NSString *)v38;

      if (v5->_applicationType == 2)
      {
        objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("invitationDetails"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          v41 = -[PKFeatureApplicationInvitationDetails initWithDictionary:]([PKFeatureApplicationInvitationDetails alloc], "initWithDictionary:", v40);
          invitationDetails = v5->_invitationDetails;
          v5->_invitationDetails = v41;

        }
      }
      objc_msgSend(v4, "PKStringForKey:", CFSTR("preliminaryAssessmentIdentifier"));
      v43 = objc_claimAutoreleasedReturnValue();
      preliminaryAssessmentIdentifier = v5->_preliminaryAssessmentIdentifier;
      v5->_preliminaryAssessmentIdentifier = (NSString *)v43;

LABEL_36:
      v20 = v5;
      goto LABEL_37;
    }
    PKLogFacilityTypeGetObject(0xDuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "Error: Application baseURL missing";
      goto LABEL_15;
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "Error: Application identifier missing";
LABEL_15:
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
    }
  }
LABEL_22:

  v20 = 0;
LABEL_37:

  return v20;
}

- (BOOL)isActive
{
  return (self->_applicationState < 0x11) & (0x101FEu >> self->_applicationState);
}

- (BOOL)hasSufficientOTBForInstallmentConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(a3, "openToBuyThresholdAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFeatureApplicationOfferDetails creditLimit](self->_applicationOfferDetails, "creditLimit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
    v7 = objc_msgSend(v5, "compare:", v4) != -1;

  return v7;
}

- (BOOL)supportsAuthentication
{
  return (unint64_t)(self->_applicationType - 1) <= 2 && self->_feature == 2;
}

- (NSData)authenticationSignaturePayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_applicationType == 2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    -[PKFeatureApplicationInvitationDetails accountUserAltDSID](self->_invitationDetails, "accountUserAltDSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v4);

    PKAccountAccessLevelToString(-[PKFeatureApplicationInvitationDetails accountUserAccessLevel](self->_invitationDetails, "accountUserAccessLevel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v5);

    if (-[NSString length](self->_accountIdentifier, "length"))
      objc_msgSend(v3, "appendString:", self->_accountIdentifier);
    objc_msgSend(v3, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SHA256Hash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSData *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureApplication)initWithCoder:(id)a3
{
  id v4;
  PKFeatureApplication *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  uint64_t v8;
  NSURL *applicationBaseURL;
  uint64_t v10;
  NSString *applicationTermsIdentifier;
  uint64_t v12;
  PKFeatureApplicationOfferDetails *applicationOfferDetails;
  uint64_t v14;
  PKFeatureApplicationDeclineDetails *declineDetails;
  uint64_t v16;
  NSDate *lastUpdated;
  uint64_t v18;
  NSString *businessChatIdentifier;
  uint64_t v20;
  NSString *coreIDVServiceProviderName;
  uint64_t v22;
  NSString *accountIdentifier;
  uint64_t v24;
  NSString *referenceIdentifier;
  uint64_t v26;
  PKFeatureApplicationInvitationDetails *invitationDetails;
  uint64_t v28;
  NSString *preliminaryAssessmentIdentifier;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKFeatureApplication;
  v5 = -[PKFeatureApplication init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationBaseURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    applicationBaseURL = v5->_applicationBaseURL;
    v5->_applicationBaseURL = (NSURL *)v8;

    v5->_feature = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("feature"));
    v5->_featureProduct = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("featureProduct"));
    v5->_applicationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("applicationType"));
    v5->_updateUserInfoSubType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("updateUserInfoSubType"));
    v5->_applicationState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("applicationState"));
    v5->_applicationStateReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("applicationStateReason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationTermsIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    applicationTermsIdentifier = v5->_applicationTermsIdentifier;
    v5->_applicationTermsIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationOfferDetails"));
    v12 = objc_claimAutoreleasedReturnValue();
    applicationOfferDetails = v5->_applicationOfferDetails;
    v5->_applicationOfferDetails = (PKFeatureApplicationOfferDetails *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("declineDetails"));
    v14 = objc_claimAutoreleasedReturnValue();
    declineDetails = v5->_declineDetails;
    v5->_declineDetails = (PKFeatureApplicationDeclineDetails *)v14;

    v5->_applicationStateDirty = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("applicationStateDirty"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
    v16 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("businessChatIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    businessChatIdentifier = v5->_businessChatIdentifier;
    v5->_businessChatIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coreIDVServiceProviderName"));
    v20 = objc_claimAutoreleasedReturnValue();
    coreIDVServiceProviderName = v5->_coreIDVServiceProviderName;
    v5->_coreIDVServiceProviderName = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitationDetails"));
    v26 = objc_claimAutoreleasedReturnValue();
    invitationDetails = v5->_invitationDetails;
    v5->_invitationDetails = (PKFeatureApplicationInvitationDetails *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preliminaryAssessmentIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    preliminaryAssessmentIdentifier = v5->_preliminaryAssessmentIdentifier;
    v5->_preliminaryAssessmentIdentifier = (NSString *)v28;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *applicationIdentifier;
  id v5;

  applicationIdentifier = self->_applicationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", applicationIdentifier, CFSTR("applicationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationBaseURL, CFSTR("applicationBaseURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_applicationState, CFSTR("applicationState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_applicationType, CFSTR("applicationType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_updateUserInfoSubType, CFSTR("updateUserInfoSubType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_feature, CFSTR("feature"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_featureProduct, CFSTR("featureProduct"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_applicationStateReason, CFSTR("applicationStateReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationTermsIdentifier, CFSTR("applicationTermsIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationOfferDetails, CFSTR("applicationOfferDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_declineDetails, CFSTR("declineDetails"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_applicationStateDirty, CFSTR("applicationStateDirty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdated, CFSTR("lastUpdated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_businessChatIdentifier, CFSTR("businessChatIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_coreIDVServiceProviderName, CFSTR("coreIDVServiceProviderName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referenceIdentifier, CFSTR("referenceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invitationDetails, CFSTR("invitationDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preliminaryAssessmentIdentifier, CFSTR("preliminaryAssessmentIdentifier"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("applicationIdentifier: '%@'; "), self->_applicationIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("applicationBaseURL: '%@'; "), self->_applicationBaseURL);
  PKFeatureApplicationStateToString(self->_applicationState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v4);

  PKFeatureApplicationStateReasonToString(self->_applicationStateReason);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("applicationStateReason: '%@'; "), v5);

  PKFeatureIdentifierToString(self->_feature);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("feature: '%@'; "), v6);

  PKFeatureProductToString(self->_featureProduct);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("featureProduct: '%@'; "), v7);

  v8 = self->_applicationType - 1;
  if (v8 > 5)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E2AD99C8[v8];
  objc_msgSend(v3, "appendFormat:", CFSTR("applicationType: '%@'; "), v9);
  v10 = self->_updateUserInfoSubType - 1;
  if (v10 > 3)
    v11 = CFSTR("unknown");
  else
    v11 = off_1E2AD99F8[v10];
  objc_msgSend(v3, "appendFormat:", CFSTR("updateUserInfoSubType: '%@'; "), v11);
  objc_msgSend(v3, "appendFormat:", CFSTR("applicationTermsIdentifier: '%@'; "), self->_applicationTermsIdentifier);
  -[PKFeatureApplicationOfferDetails description](self->_applicationOfferDetails, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("offerDetails: %@; "), v12);

  -[PKFeatureApplicationDeclineDetails description](self->_declineDetails, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("declineDetails: %@; "), v13);

  if (self->_applicationStateDirty)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("applicationStateDirty: %@; "), v14);
  -[NSDate description](self->_lastUpdated, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdated: %@; "), v15);

  objc_msgSend(v3, "appendFormat:", CFSTR("businessChatIdentifier: %@; "), self->_businessChatIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("coreIDVServiceProviderName: %@; "), self->_coreIDVServiceProviderName);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountIdentifier: '%@'; "), self->_accountIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("referenceIdentifier: '%@'; "), self->_referenceIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("invitationDetails: '%@'; "), self->_invitationDetails);
  objc_msgSend(v3, "appendFormat:", CFSTR("preliminaryAssessmentIdentifier: '%@'; "),
    self->_preliminaryAssessmentIdentifier);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *applicationIdentifier;
  NSString *v6;
  NSURL *applicationBaseURL;
  NSURL *v8;
  PKFeatureApplicationOfferDetails *applicationOfferDetails;
  PKFeatureApplicationOfferDetails *v10;
  PKFeatureApplicationDeclineDetails *declineDetails;
  PKFeatureApplicationDeclineDetails *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  _BOOL4 v17;
  NSDate *lastUpdated;
  NSDate *v19;
  BOOL v20;
  void *v22;
  NSString *v23;
  _BOOL4 v24;
  NSString *coreIDVServiceProviderName;
  NSString *v26;
  NSString *accountIdentifier;
  NSString *v28;
  NSString *referenceIdentifier;
  NSString *v30;
  PKFeatureApplicationInvitationDetails *invitationDetails;
  PKFeatureApplicationInvitationDetails *v32;
  NSString *preliminaryAssessmentIdentifier;
  void *v34;
  NSString *v35;
  char v36;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_40;
  applicationIdentifier = self->_applicationIdentifier;
  v6 = (NSString *)v4[2];
  if (applicationIdentifier && v6)
  {
    if ((-[NSString isEqual:](applicationIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_40;
  }
  else if (applicationIdentifier != v6)
  {
    goto LABEL_40;
  }
  applicationBaseURL = self->_applicationBaseURL;
  v8 = (NSURL *)v4[3];
  if (applicationBaseURL && v8)
  {
    if ((-[NSURL isEqual:](applicationBaseURL, "isEqual:") & 1) == 0)
      goto LABEL_40;
  }
  else if (applicationBaseURL != v8)
  {
    goto LABEL_40;
  }
  if (self->_feature != v4[4] || self->_featureProduct != v4[5])
    goto LABEL_40;
  applicationOfferDetails = self->_applicationOfferDetails;
  v10 = (PKFeatureApplicationOfferDetails *)v4[11];
  if (applicationOfferDetails && v10)
  {
    if (!-[PKFeatureApplicationOfferDetails isEqual:](applicationOfferDetails, "isEqual:"))
      goto LABEL_40;
  }
  else if (applicationOfferDetails != v10)
  {
    goto LABEL_40;
  }
  declineDetails = self->_declineDetails;
  v12 = (PKFeatureApplicationDeclineDetails *)v4[12];
  if (declineDetails && v12)
  {
    if (!-[PKFeatureApplicationDeclineDetails isEqual:](declineDetails, "isEqual:"))
      goto LABEL_40;
  }
  else if (declineDetails != v12)
  {
    goto LABEL_40;
  }
  if (self->_applicationState != v4[9]
    || self->_applicationType != v4[6]
    || self->_updateUserInfoSubType != v4[8]
    || self->_applicationStateReason != v4[10])
  {
    goto LABEL_40;
  }
  v13 = (void *)v4[13];
  v14 = self->_applicationTermsIdentifier;
  v15 = v13;
  if (v14 == v15)
  {

  }
  else
  {
    v16 = v15;
    v36 = 0;
    if (!v14 || !v15)
      goto LABEL_73;
    v17 = -[NSString isEqualToString:](v14, "isEqualToString:", v15);

    if (!v17)
      goto LABEL_40;
  }
  if (self->_applicationStateDirty != *((unsigned __int8 *)v4 + 8))
    goto LABEL_40;
  lastUpdated = self->_lastUpdated;
  v19 = (NSDate *)v4[14];
  if (lastUpdated && v19)
  {
    if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) == 0)
      goto LABEL_40;
  }
  else if (lastUpdated != v19)
  {
    goto LABEL_40;
  }
  v22 = (void *)v4[15];
  v14 = self->_businessChatIdentifier;
  v23 = v22;
  if (v14 != v23)
  {
    v16 = v23;
    v36 = 0;
    if (v14 && v23)
    {
      v24 = -[NSString isEqualToString:](v14, "isEqualToString:", v23);

      if (!v24)
        goto LABEL_40;
      goto LABEL_48;
    }
LABEL_73:

    v20 = v36;
    goto LABEL_41;
  }

LABEL_48:
  coreIDVServiceProviderName = self->_coreIDVServiceProviderName;
  v26 = (NSString *)v4[16];
  if (coreIDVServiceProviderName && v26)
  {
    if ((-[NSString isEqual:](coreIDVServiceProviderName, "isEqual:") & 1) == 0)
      goto LABEL_40;
  }
  else if (coreIDVServiceProviderName != v26)
  {
    goto LABEL_40;
  }
  accountIdentifier = self->_accountIdentifier;
  v28 = (NSString *)v4[17];
  if (accountIdentifier && v28)
  {
    if ((-[NSString isEqual:](accountIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_40;
  }
  else if (accountIdentifier != v28)
  {
    goto LABEL_40;
  }
  referenceIdentifier = self->_referenceIdentifier;
  v30 = (NSString *)v4[7];
  if (referenceIdentifier && v30)
  {
    if ((-[NSString isEqual:](referenceIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_40;
  }
  else if (referenceIdentifier != v30)
  {
    goto LABEL_40;
  }
  invitationDetails = self->_invitationDetails;
  v32 = (PKFeatureApplicationInvitationDetails *)v4[18];
  if (invitationDetails && v32)
  {
    if (-[PKFeatureApplicationInvitationDetails isEqual:](invitationDetails, "isEqual:"))
    {
LABEL_68:
      preliminaryAssessmentIdentifier = self->_preliminaryAssessmentIdentifier;
      v34 = (void *)v4[19];
      v14 = preliminaryAssessmentIdentifier;
      v35 = v34;
      if (v14 == v35)
      {
        v36 = 1;
        v16 = v14;
      }
      else
      {
        v16 = v35;
        v36 = 0;
        if (v14 && v35)
          v36 = -[NSString isEqualToString:](v14, "isEqualToString:", v35);
      }
      goto LABEL_73;
    }
  }
  else if (invitationDetails == v32)
  {
    goto LABEL_68;
  }
LABEL_40:
  v20 = 0;
LABEL_41:

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_applicationIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_applicationOfferDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_declineDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_applicationBaseURL);
  objc_msgSend(v3, "safelyAddObject:", self->_applicationTermsIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdated);
  objc_msgSend(v3, "safelyAddObject:", self->_businessChatIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_coreIDVServiceProviderName);
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_referenceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_invitationDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_preliminaryAssessmentIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_applicationState - v4 + 32 * v4;
  v6 = self->_applicationStateReason - v5 + 32 * v5;
  v7 = self->_feature - v6 + 32 * v6;
  v8 = self->_featureProduct - v7 + 32 * v7;
  v9 = self->_applicationType - v8 + 32 * v8;
  v10 = self->_updateUserInfoSubType - v9 + 32 * v9;
  v11 = self->_applicationStateDirty - v10 + 32 * v10;

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKFeatureApplication *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  PKFeatureApplicationOfferDetails *v8;
  PKFeatureApplicationOfferDetails *applicationOfferDetails;
  PKFeatureApplicationDeclineDetails *v10;
  PKFeatureApplicationDeclineDetails *declineDetails;
  uint64_t v12;
  NSURL *applicationBaseURL;
  uint64_t v14;
  NSString *applicationTermsIdentifier;
  uint64_t v16;
  NSDate *lastUpdated;
  uint64_t v18;
  NSString *accountIdentifier;
  uint64_t v20;
  NSString *referenceIdentifier;
  PKFeatureApplicationInvitationDetails *v22;
  PKFeatureApplicationInvitationDetails *invitationDetails;
  uint64_t v24;
  NSString *preliminaryAssessmentIdentifier;

  v5 = -[PKFeatureApplication init](+[PKFeatureApplication allocWithZone:](PKFeatureApplication, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_applicationIdentifier, "copyWithZone:", a3);
  applicationIdentifier = v5->_applicationIdentifier;
  v5->_applicationIdentifier = (NSString *)v6;

  v8 = -[PKFeatureApplicationOfferDetails copyWithZone:](self->_applicationOfferDetails, "copyWithZone:", a3);
  applicationOfferDetails = v5->_applicationOfferDetails;
  v5->_applicationOfferDetails = v8;

  v10 = -[PKFeatureApplicationDeclineDetails copyWithZone:](self->_declineDetails, "copyWithZone:", a3);
  declineDetails = v5->_declineDetails;
  v5->_declineDetails = v10;

  v12 = -[NSURL copyWithZone:](self->_applicationBaseURL, "copyWithZone:", a3);
  applicationBaseURL = v5->_applicationBaseURL;
  v5->_applicationBaseURL = (NSURL *)v12;

  v14 = -[NSString copyWithZone:](self->_applicationTermsIdentifier, "copyWithZone:", a3);
  applicationTermsIdentifier = v5->_applicationTermsIdentifier;
  v5->_applicationTermsIdentifier = (NSString *)v14;

  v16 = -[NSDate copyWithZone:](self->_lastUpdated, "copyWithZone:", a3);
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v16;

  v5->_applicationState = self->_applicationState;
  v5->_applicationStateReason = self->_applicationStateReason;
  v5->_feature = self->_feature;
  v5->_featureProduct = self->_featureProduct;
  v5->_applicationStateReason = self->_applicationStateReason;
  objc_storeStrong((id *)&v5->_businessChatIdentifier, self->_businessChatIdentifier);
  objc_storeStrong((id *)&v5->_coreIDVServiceProviderName, self->_coreIDVServiceProviderName);
  v5->_updateUserInfoSubType = self->_updateUserInfoSubType;
  v5->_applicationType = self->_applicationType;
  v18 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_referenceIdentifier, "copyWithZone:", a3);
  referenceIdentifier = v5->_referenceIdentifier;
  v5->_referenceIdentifier = (NSString *)v20;

  v22 = -[PKFeatureApplicationInvitationDetails copyWithZone:](self->_invitationDetails, "copyWithZone:", a3);
  invitationDetails = v5->_invitationDetails;
  v5->_invitationDetails = v22;

  v24 = -[NSString copyWithZone:](self->_preliminaryAssessmentIdentifier, "copyWithZone:", a3);
  preliminaryAssessmentIdentifier = v5->_preliminaryAssessmentIdentifier;
  v5->_preliminaryAssessmentIdentifier = (NSString *)v24;

  return v5;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)applicationBaseURL
{
  return self->_applicationBaseURL;
}

- (void)setApplicationBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)feature
{
  return self->_feature;
}

- (void)setFeature:(unint64_t)a3
{
  self->_feature = a3;
}

- (unint64_t)featureProduct
{
  return self->_featureProduct;
}

- (void)setFeatureProduct:(unint64_t)a3
{
  self->_featureProduct = a3;
}

- (int64_t)applicationType
{
  return self->_applicationType;
}

- (void)setApplicationType:(int64_t)a3
{
  self->_applicationType = a3;
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void)setReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)updateUserInfoSubType
{
  return self->_updateUserInfoSubType;
}

- (void)setUpdateUserInfoSubType:(int64_t)a3
{
  self->_updateUserInfoSubType = a3;
}

- (unint64_t)applicationState
{
  return self->_applicationState;
}

- (void)setApplicationState:(unint64_t)a3
{
  self->_applicationState = a3;
}

- (unint64_t)applicationStateReason
{
  return self->_applicationStateReason;
}

- (void)setApplicationStateReason:(unint64_t)a3
{
  self->_applicationStateReason = a3;
}

- (PKFeatureApplicationOfferDetails)applicationOfferDetails
{
  return self->_applicationOfferDetails;
}

- (void)setApplicationOfferDetails:(id)a3
{
  objc_storeStrong((id *)&self->_applicationOfferDetails, a3);
}

- (PKFeatureApplicationDeclineDetails)declineDetails
{
  return self->_declineDetails;
}

- (void)setDeclineDetails:(id)a3
{
  objc_storeStrong((id *)&self->_declineDetails, a3);
}

- (NSString)applicationTermsIdentifier
{
  return self->_applicationTermsIdentifier;
}

- (void)setApplicationTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)applicationStateDirty
{
  return self->_applicationStateDirty;
}

- (void)setApplicationStateDirty:(BOOL)a3
{
  self->_applicationStateDirty = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdated, a3);
}

- (NSString)businessChatIdentifier
{
  return self->_businessChatIdentifier;
}

- (void)setBusinessChatIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)coreIDVServiceProviderName
{
  return self->_coreIDVServiceProviderName;
}

- (void)setCoreIDVServiceProviderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preliminaryAssessmentIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationDetails, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_coreIDVServiceProviderName, 0);
  objc_storeStrong((id *)&self->_businessChatIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_applicationTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_declineDetails, 0);
  objc_storeStrong((id *)&self->_applicationOfferDetails, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBaseURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
