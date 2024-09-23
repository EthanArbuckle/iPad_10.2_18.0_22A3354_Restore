@implementation PKPaymentProvisioningRequest

- (PKPaymentProvisioningRequest)init
{
  return -[PKPaymentProvisioningRequest initWithEligibilityResponse:](self, "initWithEligibilityResponse:", 0);
}

- (PKPaymentProvisioningRequest)initWithEligibilityResponse:(id)a3
{
  return -[PKPaymentProvisioningRequest initWithEligibilityResponse:style:](self, "initWithEligibilityResponse:style:", a3, 0);
}

- (PKPaymentProvisioningRequest)initWithEligibilityResponse:(id)a3 style:(int64_t)a4
{
  id v7;
  PKPaymentProvisioningRequest *v8;
  PKPaymentProvisioningRequest *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentProvisioningRequest;
  v8 = -[PKOverlayableWebServiceRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_style = a4;
    objc_storeStrong((id *)&v8->_eligibilityResponse, a3);
  }

  return v9;
}

- (PKPaymentProvisioningRequest)initWithEligibilityResponse:(id)a3 addRequestConfiguration:(id)a4 addRequest:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a4, "style");
  if (v10 <= 1)
    self = -[PKPaymentProvisioningRequest initWithEligibilityResponse:style:](self, "initWithEligibilityResponse:style:", v8, v10);
  if (self)
  {
    objc_msgSend(v9, "activationData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentProvisioningRequest setActivationData:](self, "setActivationData:", v11);

  }
  return self;
}

- (PKPaymentProvisioningRequest)initWithCoder:(id)a3
{
  id v4;
  PKPaymentProvisioningRequest *v5;
  uint64_t v6;
  PKPaymentEligibilityResponse *eligibilityResponse;
  uint64_t v8;
  NSString *nonce;
  void *v10;
  uint64_t v11;
  NSString *cardholderName;
  void *v13;
  uint64_t v14;
  NSString *cardSecurityCode;
  uint64_t v16;
  NSData *activationData;
  uint64_t v18;
  PKDSPContext *context;
  uint64_t v20;
  NSData *cryptogram;
  uint64_t v22;
  NSData *challengeResponse;
  uint64_t v24;
  NSString *referrerIdentifier;
  uint64_t v26;
  NSNumber *primaryJSBLSequenceCounter;
  uint64_t v28;
  NSArray *certChain;
  uint64_t v30;
  PKPaymentDeviceMetadata *deviceData;
  uint64_t v32;
  NSString *odiAssessment;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSArray *externalDestinationDevices;
  uint64_t v39;
  NSString *transferFromDevice;
  uint64_t v41;
  NSString *applicationIdentifier;
  uint64_t v43;
  NSData *fidoAttestation;
  uint64_t v45;
  NSData *fidoKey;
  uint64_t v47;
  NSData *fidoSignedChallenge;
  uint64_t v49;
  NSData *seBlobDeviceEncryptionCertificate;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSArray *transactionKeyCertificateChain;
  uint64_t v56;
  NSData *longTermPrivacyKey;
  uint64_t v58;
  NSData *transactionKey;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSArray *isoDeviceEncryptionAttestation;
  uint64_t v65;
  NSData *isoDeviceEncryptionAuthorization;
  uint64_t v67;
  NSString *subCredentialIdentifier;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  NSArray *authorizationKeyAttestation;
  uint64_t v74;
  NSData *transactionKeyAttestation;
  uint64_t v76;
  NSData *transactionKeySignature;
  uint64_t v78;
  NSData *transactionKeyAuthorization;
  uint64_t v80;
  NSData *progenitorKeyCASDAttestation;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  NSArray *transactionKeys;
  uint64_t v87;
  NSData *serverAttestedProvisioningData;
  objc_super v90;

  v4 = a3;
  v90.receiver = self;
  v90.super_class = (Class)PKPaymentProvisioningRequest;
  v5 = -[PKOverlayableWebServiceRequest initWithCoder:](&v90, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eligibilityResponse"));
    v6 = objc_claimAutoreleasedReturnValue();
    eligibilityResponse = v5->_eligibilityResponse;
    v5->_eligibilityResponse = (PKPaymentEligibilityResponse *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
    v8 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardholderName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pk_zString");
    v11 = objc_claimAutoreleasedReturnValue();
    cardholderName = v5->_cardholderName;
    v5->_cardholderName = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardSecurityCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pk_zString");
    v14 = objc_claimAutoreleasedReturnValue();
    cardSecurityCode = v5->_cardSecurityCode;
    v5->_cardSecurityCode = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activationData"));
    v16 = objc_claimAutoreleasedReturnValue();
    activationData = v5->_activationData;
    v5->_activationData = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v18 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (PKDSPContext *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cryptogram"));
    v20 = objc_claimAutoreleasedReturnValue();
    cryptogram = v5->_cryptogram;
    v5->_cryptogram = (NSData *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("challengeResponse"));
    v22 = objc_claimAutoreleasedReturnValue();
    challengeResponse = v5->_challengeResponse;
    v5->_challengeResponse = (NSData *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrerIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    referrerIdentifier = v5->_referrerIdentifier;
    v5->_referrerIdentifier = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryJSBLSequenceCounter"));
    v26 = objc_claimAutoreleasedReturnValue();
    primaryJSBLSequenceCounter = v5->_primaryJSBLSequenceCounter;
    v5->_primaryJSBLSequenceCounter = (NSNumber *)v26;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("certChain"));
    v28 = objc_claimAutoreleasedReturnValue();
    certChain = v5->_certChain;
    v5->_certChain = (NSArray *)v28;

    v5->_devSigned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("devSigned"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceData"));
    v30 = objc_claimAutoreleasedReturnValue();
    deviceData = v5->_deviceData;
    v5->_deviceData = (PKPaymentDeviceMetadata *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("odiAssessment"));
    v32 = objc_claimAutoreleasedReturnValue();
    odiAssessment = v5->_odiAssessment;
    v5->_odiAssessment = (NSString *)v32;

    v34 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("externalDestinationDevices"));
    v37 = objc_claimAutoreleasedReturnValue();
    externalDestinationDevices = v5->_externalDestinationDevices;
    v5->_externalDestinationDevices = (NSArray *)v37;

    v5->_includeExternalDestinationDevices = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeExternalDestinationDevices"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferFromDevice"));
    v39 = objc_claimAutoreleasedReturnValue();
    transferFromDevice = v5->_transferFromDevice;
    v5->_transferFromDevice = (NSString *)v39;

    v5->_removeFromSourceDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("removeFromSourceDevice"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v41 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fidoAttestation"));
    v43 = objc_claimAutoreleasedReturnValue();
    fidoAttestation = v5->_fidoAttestation;
    v5->_fidoAttestation = (NSData *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fidoKey"));
    v45 = objc_claimAutoreleasedReturnValue();
    fidoKey = v5->_fidoKey;
    v5->_fidoKey = (NSData *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fidoSignedChallenge"));
    v47 = objc_claimAutoreleasedReturnValue();
    fidoSignedChallenge = v5->_fidoSignedChallenge;
    v5->_fidoSignedChallenge = (NSData *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seBlobDeviceEncryptionCertificate"));
    v49 = objc_claimAutoreleasedReturnValue();
    seBlobDeviceEncryptionCertificate = v5->_seBlobDeviceEncryptionCertificate;
    v5->_seBlobDeviceEncryptionCertificate = (NSData *)v49;

    v51 = (void *)MEMORY[0x1E0C99E60];
    v52 = objc_opt_class();
    objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v53, CFSTR("transactionKeyCertificateChain"));
    v54 = objc_claimAutoreleasedReturnValue();
    transactionKeyCertificateChain = v5->_transactionKeyCertificateChain;
    v5->_transactionKeyCertificateChain = (NSArray *)v54;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("longTermPrivacyKey"));
    v56 = objc_claimAutoreleasedReturnValue();
    longTermPrivacyKey = v5->_longTermPrivacyKey;
    v5->_longTermPrivacyKey = (NSData *)v56;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionKey"));
    v58 = objc_claimAutoreleasedReturnValue();
    transactionKey = v5->_transactionKey;
    v5->_transactionKey = (NSData *)v58;

    v60 = (void *)MEMORY[0x1E0C99E60];
    v61 = objc_opt_class();
    objc_msgSend(v60, "setWithObjects:", v61, objc_opt_class(), 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v62, CFSTR("isoDeviceEncryptionAttestation"));
    v63 = objc_claimAutoreleasedReturnValue();
    isoDeviceEncryptionAttestation = v5->_isoDeviceEncryptionAttestation;
    v5->_isoDeviceEncryptionAttestation = (NSArray *)v63;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isoDeviceEncryptionAuthorization"));
    v65 = objc_claimAutoreleasedReturnValue();
    isoDeviceEncryptionAuthorization = v5->_isoDeviceEncryptionAuthorization;
    v5->_isoDeviceEncryptionAuthorization = (NSData *)v65;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subCredentialIdentifier"));
    v67 = objc_claimAutoreleasedReturnValue();
    subCredentialIdentifier = v5->_subCredentialIdentifier;
    v5->_subCredentialIdentifier = (NSString *)v67;

    v69 = (void *)MEMORY[0x1E0C99E60];
    v70 = objc_opt_class();
    objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v71, CFSTR("authorizationKeyAttestation"));
    v72 = objc_claimAutoreleasedReturnValue();
    authorizationKeyAttestation = v5->_authorizationKeyAttestation;
    v5->_authorizationKeyAttestation = (NSArray *)v72;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionKeyAttestation"));
    v74 = objc_claimAutoreleasedReturnValue();
    transactionKeyAttestation = v5->_transactionKeyAttestation;
    v5->_transactionKeyAttestation = (NSData *)v74;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionKeySignature"));
    v76 = objc_claimAutoreleasedReturnValue();
    transactionKeySignature = v5->_transactionKeySignature;
    v5->_transactionKeySignature = (NSData *)v76;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionKeyAuthorization"));
    v78 = objc_claimAutoreleasedReturnValue();
    transactionKeyAuthorization = v5->_transactionKeyAuthorization;
    v5->_transactionKeyAuthorization = (NSData *)v78;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("progenitorKeyAttestation"));
    v80 = objc_claimAutoreleasedReturnValue();
    progenitorKeyCASDAttestation = v5->_progenitorKeyCASDAttestation;
    v5->_progenitorKeyCASDAttestation = (NSData *)v80;

    v82 = (void *)MEMORY[0x1E0C99E60];
    v83 = objc_opt_class();
    objc_msgSend(v82, "setWithObjects:", v83, objc_opt_class(), 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v84, CFSTR("transactionKeyData"));
    v85 = objc_claimAutoreleasedReturnValue();
    transactionKeys = v5->_transactionKeys;
    v5->_transactionKeys = (NSArray *)v85;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverAttestedProvisioningData"));
    v87 = objc_claimAutoreleasedReturnValue();
    serverAttestedProvisioningData = v5->_serverAttestedProvisioningData;
    v5->_serverAttestedProvisioningData = (NSData *)v87;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningRequest;
  v4 = a3;
  -[PKOverlayableWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, CFSTR("style"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_eligibilityResponse, CFSTR("eligibilityResponse"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_nonce, CFSTR("nonce"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardholderName, CFSTR("cardholderName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardSecurityCode, CFSTR("cardSecurityCode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_activationData, CFSTR("activationData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, CFSTR("context"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cryptogram, CFSTR("cryptogram"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_challengeResponse, CFSTR("challengeResponse"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_referrerIdentifier, CFSTR("referrerIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_primaryJSBLSequenceCounter, CFSTR("primaryJSBLSequenceCounter"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_certChain, CFSTR("certChain"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_devSigned, CFSTR("devSigned"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceData, CFSTR("deviceData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_odiAssessment, CFSTR("odiAssessment"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalDestinationDevices, CFSTR("externalDestinationDevices"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeExternalDestinationDevices, CFSTR("includeExternalDestinationDevices"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transferFromDevice, CFSTR("transferFromDevice"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_removeFromSourceDevice, CFSTR("removeFromSourceDevice"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("applicationIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fidoAttestation, CFSTR("fidoAttestation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fidoKey, CFSTR("fidoKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fidoSignedChallenge, CFSTR("fidoSignedChallenge"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_seBlobDeviceEncryptionCertificate, CFSTR("seBlobDeviceEncryptionCertificate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionKeyCertificateChain, CFSTR("transactionKeyCertificateChain"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_longTermPrivacyKey, CFSTR("longTermPrivacyKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionKey, CFSTR("transactionKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_isoDeviceEncryptionAttestation, CFSTR("isoDeviceEncryptionAttestation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_isoDeviceEncryptionAuthorization, CFSTR("isoDeviceEncryptionAuthorization"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subCredentialIdentifier, CFSTR("subCredentialIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_authorizationKeyAttestation, CFSTR("authorizationKeyAttestation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionKeyAttestation, CFSTR("transactionKeyAttestation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionKeySignature, CFSTR("transactionKeySignature"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionKeyAuthorization, CFSTR("transactionKeyAuthorization"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_progenitorKeyCASDAttestation, CFSTR("progenitorKeyAttestation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionKeys, CFSTR("transactionKeyData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_serverAttestedProvisioningData, CFSTR("serverAttestedProvisioningData"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isDeviceProvisioningDataExpected
{
  void *v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  BOOL v7;

  -[PKPaymentProvisioningRequest eligibilityResponse](self, "eligibilityResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cardType");

  if (v4 == 107 || self->_style == 1)
    v5 = 1;
  else
    v5 = PKProvisioningForceAccessStyle();
  v6 = -[PKPaymentEligibilityResponse deviceProvisioningDataExpected](self->_eligibilityResponse, "deviceProvisioningDataExpected");
  v7 = v6 == 1 && v5 == 0;
  if (v7 || v6 == 1 && ((v5 ^ 1) & 1) == 0 && self->_sendReducedDeviceData)
    return 1;
  if (v6)
    return 0;
  return v5 ^ 1;
}

- (void)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5 certChain:(id)a6 devSigned:(BOOL)a7 deviceData:(id)a8 webService:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSNumber *v22;
  NSNumber *primaryJSBLSequenceCounter;
  NSArray *v24;
  NSArray *certChain;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *referrerIdentifier;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  _QWORD v41[6];

  v41[5] = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v17 = a8;
  v35 = a9;
  v34 = a10;
  v18 = a6;
  v19 = a5;
  v20 = a3;
  v36 = v17;
  objc_msgSend(v17, "primaryJSBLSequenceCounter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (NSNumber *)objc_msgSend(v21, "copy");
  primaryJSBLSequenceCounter = self->_primaryJSBLSequenceCounter;
  self->_primaryJSBLSequenceCounter = v22;

  v24 = (NSArray *)objc_msgSend(v18, "copy");
  certChain = self->_certChain;
  self->_certChain = v24;
  v26 = v16;

  self->_devSigned = a7;
  objc_storeStrong((id *)&self->_deviceData, a8);
  v41[0] = CFSTR("devices");
  v41[1] = v16;
  v41[2] = CFSTR("cards");
  -[PKPaymentEligibilityResponse identifier](self->_eligibilityResponse, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v27;
  v41[4] = CFSTR("enable");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v20, v28, 0, v19);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v29, "setValue:forHTTPHeaderField:", CFSTR("application/binary"), CFSTR("Content-Type"));
  referrerIdentifier = self->_referrerIdentifier;
  if (referrerIdentifier)
    objc_msgSend(v29, "setValue:forHTTPHeaderField:", referrerIdentifier, CFSTR("x-apple-referrer-identifier"));
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __152__PKPaymentProvisioningRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke;
  v37[3] = &unk_1E2AD4540;
  v37[4] = self;
  v38 = v29;
  v39 = v35;
  v40 = v34;
  v31 = v34;
  v32 = v35;
  v33 = v29;
  -[PKPaymentProvisioningRequest _requestBodyWithWebService:completion:](self, "_requestBodyWithWebService:completion:", v32, v37);

}

void __152__PKPaymentProvisioningRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setOverlayParameters:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setRequiresConfigurationForRetry:", 1);
  objc_msgSend(*(id *)(a1 + 32), "archivedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(MEMORY[0x1E0C92C78], "setProperty:forKey:inRequest:", v5, CFSTR("overlayRequest"), *(_QWORD *)(a1 + 40));
  v6 = *(void **)(a1 + 40);
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setHTTPBody:", v7);
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __152__PKPaymentProvisioningRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke_2;
  v11[3] = &unk_1E2AD44F0;
  v10 = *(_QWORD *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v8, "_signRequest:webService:completion:", v9, v10, v11);

}

void __152__PKPaymentProvisioningRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "copy");
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)_updateRequestForRetry:(id)a3 retryFields:(id)a4 webService:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  PKPaymentProvisioningRequest *v20;
  id v21;
  id v22;
  uint8_t buf[16];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a4, "PKStringForKey:", CFSTR("nonce"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_storeStrong((id *)&self->_nonce, v13);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Error: Retry response data did not contain nonce", buf, 2u);
    }

  }
  -[PKPaymentProvisioningRequest setCryptogram:](self, "setCryptogram:", 0);
  -[PKPaymentProvisioningRequest setChallengeResponse:](self, "setChallengeResponse:", 0);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__PKPaymentProvisioningRequest__updateRequestForRetry_retryFields_webService_withCompletion___block_invoke;
  v18[3] = &unk_1E2AD4540;
  v19 = v10;
  v20 = self;
  v21 = v11;
  v22 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[PKPaymentProvisioningRequest _requestBodyWithWebService:completion:](self, "_requestBodyWithWebService:completion:", v16, v18);

}

void __93__PKPaymentProvisioningRequest__updateRequestForRetry_retryFields_webService_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setHTTPBody:", v5);
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__PKPaymentProvisioningRequest__updateRequestForRetry_retryFields_webService_withCompletion___block_invoke_2;
  v9[3] = &unk_1E2AD44F0;
  v8 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v6, "_signRequest:webService:completion:", v7, v8, v9);

}

uint64_t __93__PKPaymentProvisioningRequest__updateRequestForRetry_retryFields_webService_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateRequestForRedirect:(id)a3 overrides:(id)a4 webService:(id)a5 withCompletion:(id)a6
{
  id v9;
  id v10;
  objc_super v11;
  _QWORD v12[4];
  PKPaymentProvisioningRequest *v13;
  id v14;
  id v15;

  v12[1] = 3221225472;
  v12[2] = __94__PKPaymentProvisioningRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke;
  v12[3] = &unk_1E2AD4518;
  v13 = self;
  v14 = a5;
  v15 = a6;
  v11.receiver = v13;
  v11.super_class = (Class)PKPaymentProvisioningRequest;
  v12[0] = MEMORY[0x1E0C809B0];
  v9 = v15;
  v10 = v14;
  -[PKOverlayableWebServiceRequest _updateRequestForRedirect:overrides:webService:withCompletion:](&v11, sel__updateRequestForRedirect_overrides_webService_withCompletion_, a3, a4, v10, v12);

}

void __94__PKPaymentProvisioningRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__PKPaymentProvisioningRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke_2;
  v5[3] = &unk_1E2AD44F0;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_signRequest:webService:completion:", a2, v4, v5);

}

uint64_t __94__PKPaymentProvisioningRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_requestBodyWithWebService:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKPaymentProvisioningRequest__requestBodyWithWebService_completion___block_invoke;
  v8[3] = &unk_1E2ABE058;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[PKPaymentProvisioningRequest _updateContextUsingWebService:completion:](self, "_updateContextUsingWebService:completion:", a3, v8);

}

void __70__PKPaymentProvisioningRequest__requestBodyWithWebService_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__52;
  v41 = __Block_byref_object_dispose__52;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_applyOverlayToDictionary:", v38[5]);
  v2 = (void *)v38[5];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "termsID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("termsID"));

  v4 = objc_msgSend(*(id *)(a1 + 32), "isDeviceProvisioningDataExpected");
  v5 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v6 = (void *)v38[5];
    objc_msgSend(*(id *)(v5 + 112), "phoneNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("devicePhoneNumber"));

    v8 = (void *)v38[5];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "signedPhoneNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("signedDevicePhoneNumber"));

    v10 = (void *)v38[5];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "signedPhoneNumberVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("signedDevicePhoneNumberVersion"));

    v5 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v5 + 121))
    {
      v12 = (void *)v38[5];
      objc_msgSend(*(id *)(v5 + 112), "deviceName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:forKey:", v13, CFSTR("deviceName"));

      v14 = (void *)v38[5];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "extensiveLatitude");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("extensiveLatitude"));

      v16 = (void *)v38[5];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "extensiveLongitude");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setValue:forKey:", v17, CFSTR("extensiveLongitude"));

      v5 = *(_QWORD *)(a1 + 32);
    }
  }
  v18 = *(_QWORD *)(v5 + 152);
  if (v18)
  {
    objc_msgSend((id)v38[5], "setValue:forKey:", v18, CFSTR("nonce"));
    v5 = *(_QWORD *)(a1 + 32);
  }
  v19 = *(void **)(v5 + 176);
  if (v19)
  {
    v20 = (void *)v38[5];
    objc_msgSend(v19, "base64EncodedStringWithOptions:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValue:forKey:", v21, CFSTR("activationData"));

    v5 = *(_QWORD *)(a1 + 32);
  }
  v22 = *(void **)(v5 + 280);
  if (v22)
  {
    v23 = (void *)v38[5];
    objc_msgSend(v22, "base64EncodedStringWithOptions:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("longTermPrivacyKey"));

    v5 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend((id)v38[5], "setObject:forKeyedSubscript:", *(_QWORD *)(v5 + 224), CFSTR("transferFromDevice"));
  v25 = MEMORY[0x1E0C9AAB0];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 123))
    v26 = MEMORY[0x1E0C9AAB0];
  else
    v26 = 0;
  objc_msgSend((id)v38[5], "setObject:forKeyedSubscript:", v26, CFSTR("removeFromSourceDevice"));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 122))
    v27 = v25;
  else
    v27 = 0;
  objc_msgSend((id)v38[5], "setObject:forKeyedSubscript:", v27, CFSTR("includeExternalDestinationDevices"));
  objc_msgSend(*(id *)(a1 + 32), "_secureParameters");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  v30 = *(_QWORD **)(a1 + 32);
  v31 = v30[16];
  if (v31)
  {
    if (v31 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_encryptSecureDictionary:intoDictionary:", v28, v38[5]);
      v32 = *(_QWORD *)(a1 + 40);
      if (v32)
        (*(void (**)(uint64_t, uint64_t))(v32 + 16))(v32, v38[5]);
    }
  }
  else
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __70__PKPaymentProvisioningRequest__requestBodyWithWebService_completion___block_invoke_2;
    v33[3] = &unk_1E2AD4568;
    v33[4] = v30;
    v34 = v28;
    v36 = &v37;
    v35 = *(id *)(a1 + 40);
    objc_msgSend(v30, "_deviceScoreWithCompletion:", v33);

  }
  _Block_object_dispose(&v37, 8);

}

void __70__PKPaymentProvisioningRequest__requestBodyWithWebService_completion___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  const __CFString *v13;
  id *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  v5 = (void *)MEMORY[0x19400CFE8]();
  objc_msgSend(*(id *)(a1 + 32), "overlayParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("cardSecurityCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "secureOverlayParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("cardSecurityCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v10 + 168))
  {
    v11 = !*(_QWORD *)(v10 + 176) && v7 == 0;
    if (v11 && v9 == 0)
      objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:");
  }
  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v20, CFSTR("deviceScore"));
    if (a3)
      v13 = CFSTR("2");
    else
      v13 = CFSTR("1");
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, CFSTR("deviceScoreVersion"));
  }
  v14 = *(id **)(a1 + 32);
  if (v14[11])
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v14 = *(id **)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v14[11], "stringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dataUsingEncoding:", 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hexEncoding");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v18, CFSTR("jsblSequenceCounter"));

      v14 = *(id **)(a1 + 32);
    }
  }
  objc_msgSend(v14, "_encryptSecureDictionary:intoDictionary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_autoreleasePoolPop(v5);
  v19 = *(_QWORD *)(a1 + 48);
  if (v19)
    (*(void (**)(uint64_t, _QWORD))(v19 + 16))(v19, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

- (void)_encryptSecureDictionary:(id)a3 intoDictionary:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *certChain;
  _BOOL4 devSigned;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKOverlayableWebServiceRequest _applySecureOverlayToDictionary:](self, "_applySecureOverlayToDictionary:", v6);
  if (objc_msgSend(v6, "count"))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Encrypted Provisioning Fields: %@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v20 = v11;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);

    }
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    certChain = self->_certChain;
    devSigned = self->_devSigned;
    v18 = 0;
    PKPaymentEncryptDataWithCertChain(v12, certChain, devSigned, &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;

    if (!v15)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate provisioning request encryptedCardData. This is bad!", buf, 2u);
      }
      goto LABEL_10;
    }
    if (v16)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v15, 4);
      objc_msgSend(v7, "setValue:forKey:", CFSTR("EV_ECC_v1-ASN.1"), CFSTR("encryptionVersion"));
      objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("encryptedCardData"));
      objc_msgSend(v16, "hexEncoding");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v17, CFSTR("publicKeyHash"));

LABEL_10:
    }
  }
  else
  {
    v15 = 0;
  }

}

- (id)_secureParameters
{
  id v3;
  void *v4;
  NSArray *externalDestinationDevices;
  NSString *applicationIdentifier;
  NSData *fidoAttestation;
  void *v8;
  NSData *fidoKey;
  void *v10;
  NSData *fidoSignedChallenge;
  void *v12;
  NSData *seBlobDeviceEncryptionCertificate;
  void *v14;
  NSArray *transactionKeyCertificateChain;
  void *v16;
  NSData *transactionKey;
  void *v18;
  NSArray *isoDeviceEncryptionAttestation;
  NSData *isoDeviceEncryptionAuthorization;
  void *v21;
  NSString *subCredentialIdentifier;
  NSArray *authorizationKeyAttestation;
  NSData *transactionKeyAttestation;
  void *v25;
  NSData *transactionKeySignature;
  void *v27;
  NSData *transactionKeyAuthorization;
  void *v29;
  NSData *progenitorKeyCASDAttestation;
  void *v31;
  NSArray *transactionKeys;
  void *v33;
  NSData *serverAttestedProvisioningData;
  void *v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v54;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  externalDestinationDevices = self->_externalDestinationDevices;
  if (externalDestinationDevices)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", externalDestinationDevices, CFSTR("externalDestinationDevices"));
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier)
    objc_msgSend(v4, "setObject:forKey:", applicationIdentifier, CFSTR("applicationIdentifier"));
  fidoAttestation = self->_fidoAttestation;
  if (fidoAttestation)
  {
    -[NSData base64EncodedStringWithOptions:](fidoAttestation, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("fidoAttestation"));

  }
  fidoKey = self->_fidoKey;
  if (fidoKey)
  {
    -[NSData base64EncodedStringWithOptions:](fidoKey, "base64EncodedStringWithOptions:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("fidoKey"));

  }
  fidoSignedChallenge = self->_fidoSignedChallenge;
  if (fidoSignedChallenge)
  {
    -[NSData base64EncodedStringWithOptions:](fidoSignedChallenge, "base64EncodedStringWithOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("fidoSignedChallenge"));

  }
  seBlobDeviceEncryptionCertificate = self->_seBlobDeviceEncryptionCertificate;
  if (seBlobDeviceEncryptionCertificate)
  {
    -[NSData base64EncodedStringWithOptions:](seBlobDeviceEncryptionCertificate, "base64EncodedStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("seBlobDeviceEncryptionCertificate"));

  }
  transactionKeyCertificateChain = self->_transactionKeyCertificateChain;
  if (transactionKeyCertificateChain)
  {
    -[NSArray pk_arrayByApplyingBlock:](transactionKeyCertificateChain, "pk_arrayByApplyingBlock:", &__block_literal_global_154);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("transactionKeyCertificateChain"));

  }
  transactionKey = self->_transactionKey;
  if (transactionKey)
  {
    -[NSData base64EncodedStringWithOptions:](transactionKey, "base64EncodedStringWithOptions:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("transactionKey"));

  }
  isoDeviceEncryptionAttestation = self->_isoDeviceEncryptionAttestation;
  if (isoDeviceEncryptionAttestation)
    objc_msgSend(v4, "setObject:forKey:", isoDeviceEncryptionAttestation, CFSTR("isoDeviceEncryptionAttestation"));
  isoDeviceEncryptionAuthorization = self->_isoDeviceEncryptionAuthorization;
  if (isoDeviceEncryptionAuthorization)
  {
    -[NSData base64EncodedStringWithOptions:](isoDeviceEncryptionAuthorization, "base64EncodedStringWithOptions:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("isoDeviceEncryptionAuthorization"));

  }
  subCredentialIdentifier = self->_subCredentialIdentifier;
  if (subCredentialIdentifier)
    objc_msgSend(v4, "setObject:forKey:", subCredentialIdentifier, CFSTR("subCredentialIdentifier"));
  authorizationKeyAttestation = self->_authorizationKeyAttestation;
  if (authorizationKeyAttestation)
    objc_msgSend(v4, "setObject:forKey:", authorizationKeyAttestation, CFSTR("authorizationKeyAttestation"));
  transactionKeyAttestation = self->_transactionKeyAttestation;
  if (transactionKeyAttestation)
  {
    -[NSData base64EncodedStringWithOptions:](transactionKeyAttestation, "base64EncodedStringWithOptions:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("transactionKeyAttestation"));

  }
  transactionKeySignature = self->_transactionKeySignature;
  if (transactionKeySignature)
  {
    -[NSData base64EncodedStringWithOptions:](transactionKeySignature, "base64EncodedStringWithOptions:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("transactionKeySignature"));

  }
  transactionKeyAuthorization = self->_transactionKeyAuthorization;
  if (transactionKeyAuthorization)
  {
    -[NSData base64EncodedStringWithOptions:](transactionKeyAuthorization, "base64EncodedStringWithOptions:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("transactionKeyAuthorization"));

  }
  progenitorKeyCASDAttestation = self->_progenitorKeyCASDAttestation;
  if (progenitorKeyCASDAttestation)
  {
    -[NSData base64EncodedStringWithOptions:](progenitorKeyCASDAttestation, "base64EncodedStringWithOptions:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("progenitorKeyAttestation"));

  }
  transactionKeys = self->_transactionKeys;
  if (transactionKeys)
  {
    -[NSArray pk_arrayByApplyingBlock:](transactionKeys, "pk_arrayByApplyingBlock:", &__block_literal_global_665);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("transactionKeyData"));

  }
  serverAttestedProvisioningData = self->_serverAttestedProvisioningData;
  if (serverAttestedProvisioningData)
  {
    -[NSData base64EncodedStringWithOptions:](serverAttestedProvisioningData, "base64EncodedStringWithOptions:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("serverAttestedProvisioningData"));

  }
  if (self->_auxiliaryCapabilities)
  {
    v54 = v4;
    v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMapTable keyEnumerator](self->_auxiliaryCapabilities, "keyEnumerator");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "nextObject");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v40 = (void *)v39;
      while (1)
      {
        -[NSMapTable objectForKey:](self->_auxiliaryCapabilities, "objectForKey:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v40, "role");
        v43 = v36;
        if (v42 == 1)
          goto LABEL_43;
        if (v42 == 2)
          break;
LABEL_45:

        objc_msgSend(v38, "nextObject");
        v50 = objc_claimAutoreleasedReturnValue();

        v40 = (void *)v50;
        if (!v50)
          goto LABEL_46;
      }
      v43 = v37;
LABEL_43:
      v44 = v43;
      if (v44)
      {
        v45 = v44;
        objc_msgSend(v41, "dictionaryRepresentation");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)objc_msgSend(v46, "mutableCopy");

        objc_msgSend(v40, "dictionaryRepresentation");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v48, CFSTR("requirement"));

        v49 = (void *)objc_msgSend(v47, "copy");
        objc_msgSend(v45, "addObject:", v49);

      }
      goto LABEL_45;
    }
LABEL_46:
    v4 = v54;
    if (objc_msgSend(v36, "count"))
    {
      v51 = (void *)objc_msgSend(v36, "copy");
      objc_msgSend(v54, "setObject:forKey:", v51, CFSTR("deviceDecryptions"));

    }
    if (objc_msgSend(v37, "count"))
    {
      v52 = (void *)objc_msgSend(v37, "copy");
      objc_msgSend(v54, "setObject:forKey:", v52, CFSTR("deviceSignatures"));

    }
  }
  return v4;
}

uint64_t __49__PKPaymentProvisioningRequest__secureParameters__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
}

id __49__PKPaymentProvisioningRequest__secureParameters__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("transactionKeyAttestation");
  v2 = a2;
  objc_msgSend(v2, "casdAttestation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("transactionKeyAuthorization");
  v10[0] = v4;
  objc_msgSend(v2, "authorization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_deviceScoreWithCompletion:(id)a3
{
  id v4;
  void (*v5)(void);
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    if (+[PKDeviceScorer deviceScoringSupported](PKDeviceScorer, "deviceScoringSupported")
      && -[PKPaymentProvisioningRequest isDeviceProvisioningDataExpected](self, "isDeviceProvisioningDataExpected")
      && !self->_disableDeviceScore)
    {
      v5 = (void (*)(void))*((_QWORD *)v6 + 2);
    }
    else
    {
      v5 = (void (*)(void))*((_QWORD *)v6 + 2);
    }
    v5();
    v4 = v6;
  }

}

- (void)_updateContextUsingWebService:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  void (**v14)(_QWORD);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!+[PKDeviceScorer deviceScoringSupported](PKDeviceScorer, "deviceScoringSupported")
    || (-[PKPaymentProvisioningRequest cryptogram](self, "cryptogram"), (v8 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v9 = (void *)v8,
        -[PKPaymentProvisioningRequest challengeResponse](self, "challengeResponse"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    if (v7)
      v7[2](v7);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Fetching local crypto and challenge for request", buf, 2u);
    }

    if (PKRunningInPassd())
      objc_msgSend(v6, "targetDevice");
    else
      +[PKPaymentWebServiceTargetDevice localTargetDevice](PKPaymentWebServiceTargetDevice, "localTargetDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __73__PKPaymentProvisioningRequest__updateContextUsingWebService_completion___block_invoke;
      v13[3] = &unk_1E2ABDC98;
      v13[4] = self;
      v14 = v7;
      objc_msgSend(v12, "paymentWebService:setNewAuthRandomIfNecessaryReturningPairingState:", v6, v13);

    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Error: No targetDevice to configure context with", buf, 2u);
      }

      if (v7)
        v7[2](v7);
    }

  }
}

void __73__PKPaymentProvisioningRequest__updateContextUsingWebService_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t v11[16];

  v7 = a3;
  v8 = a4;
  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Cannot fetch local crypto and challenge for request", v11, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setCryptogram:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setChallengeResponse:", v8);
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (PKPaymentEligibilityResponse)eligibilityResponse
{
  return self->_eligibilityResponse;
}

- (void)setEligibilityResponse:(id)a3
{
  objc_storeStrong((id *)&self->_eligibilityResponse, a3);
}

- (BOOL)disableDeviceScore
{
  return self->_disableDeviceScore;
}

- (void)setDisableDeviceScore:(BOOL)a3
{
  self->_disableDeviceScore = a3;
}

- (BOOL)sendReducedDeviceData
{
  return self->_sendReducedDeviceData;
}

- (void)setSendReducedDeviceData:(BOOL)a3
{
  self->_sendReducedDeviceData = a3;
}

- (NSString)odiAssessment
{
  return self->_odiAssessment;
}

- (void)setOdiAssessment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)cardholderName
{
  return self->_cardholderName;
}

- (void)setCardholderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)cardSecurityCode
{
  return self->_cardSecurityCode;
}

- (void)setCardSecurityCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSData)activationData
{
  return self->_activationData;
}

- (void)setActivationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (PKDSPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSData)cryptogram
{
  return self->_cryptogram;
}

- (void)setCryptogram:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSData)challengeResponse
{
  return self->_challengeResponse;
}

- (void)setChallengeResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)includeExternalDestinationDevices
{
  return self->_includeExternalDestinationDevices;
}

- (void)setIncludeExternalDestinationDevices:(BOOL)a3
{
  self->_includeExternalDestinationDevices = a3;
}

- (NSArray)externalDestinationDevices
{
  return self->_externalDestinationDevices;
}

- (void)setExternalDestinationDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)transferFromDevice
{
  return self->_transferFromDevice;
}

- (void)setTransferFromDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BOOL)removeFromSourceDevice
{
  return self->_removeFromSourceDevice;
}

- (void)setRemoveFromSourceDevice:(BOOL)a3
{
  self->_removeFromSourceDevice = a3;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSData)fidoAttestation
{
  return self->_fidoAttestation;
}

- (void)setFidoAttestation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSData)fidoKey
{
  return self->_fidoKey;
}

- (void)setFidoKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSData)fidoSignedChallenge
{
  return self->_fidoSignedChallenge;
}

- (void)setFidoSignedChallenge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSData)seBlobDeviceEncryptionCertificate
{
  return self->_seBlobDeviceEncryptionCertificate;
}

- (void)setSeBlobDeviceEncryptionCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSArray)transactionKeyCertificateChain
{
  return self->_transactionKeyCertificateChain;
}

- (void)setTransactionKeyCertificateChain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSData)longTermPrivacyKey
{
  return self->_longTermPrivacyKey;
}

- (void)setLongTermPrivacyKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSData)transactionKey
{
  return self->_transactionKey;
}

- (void)setTransactionKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSArray)isoDeviceEncryptionAttestation
{
  return self->_isoDeviceEncryptionAttestation;
}

- (void)setIsoDeviceEncryptionAttestation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSData)isoDeviceEncryptionAuthorization
{
  return self->_isoDeviceEncryptionAuthorization;
}

- (void)setIsoDeviceEncryptionAuthorization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSString)subCredentialIdentifier
{
  return self->_subCredentialIdentifier;
}

- (void)setSubCredentialIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSString)identityAccountKeyIdentifier
{
  return self->_identityAccountKeyIdentifier;
}

- (void)setIdentityAccountKeyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSArray)authorizationKeyAttestation
{
  return self->_authorizationKeyAttestation;
}

- (void)setAuthorizationKeyAttestation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSData)transactionKeyAttestation
{
  return self->_transactionKeyAttestation;
}

- (void)setTransactionKeyAttestation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSData)transactionKeySignature
{
  return self->_transactionKeySignature;
}

- (void)setTransactionKeySignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSData)transactionKeyAuthorization
{
  return self->_transactionKeyAuthorization;
}

- (void)setTransactionKeyAuthorization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSData)progenitorKeyCASDAttestation
{
  return self->_progenitorKeyCASDAttestation;
}

- (void)setProgenitorKeyCASDAttestation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSArray)transactionKeys
{
  return self->_transactionKeys;
}

- (void)setTransactionKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSData)serverAttestedProvisioningData
{
  return self->_serverAttestedProvisioningData;
}

- (void)setServerAttestedProvisioningData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSMapTable)auxiliaryCapabilities
{
  return self->_auxiliaryCapabilities;
}

- (void)setAuxiliaryCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryCapabilities, 0);
  objc_storeStrong((id *)&self->_serverAttestedProvisioningData, 0);
  objc_storeStrong((id *)&self->_transactionKeys, 0);
  objc_storeStrong((id *)&self->_progenitorKeyCASDAttestation, 0);
  objc_storeStrong((id *)&self->_transactionKeyAuthorization, 0);
  objc_storeStrong((id *)&self->_transactionKeySignature, 0);
  objc_storeStrong((id *)&self->_transactionKeyAttestation, 0);
  objc_storeStrong((id *)&self->_authorizationKeyAttestation, 0);
  objc_storeStrong((id *)&self->_identityAccountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_subCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_isoDeviceEncryptionAuthorization, 0);
  objc_storeStrong((id *)&self->_isoDeviceEncryptionAttestation, 0);
  objc_storeStrong((id *)&self->_transactionKey, 0);
  objc_storeStrong((id *)&self->_longTermPrivacyKey, 0);
  objc_storeStrong((id *)&self->_transactionKeyCertificateChain, 0);
  objc_storeStrong((id *)&self->_seBlobDeviceEncryptionCertificate, 0);
  objc_storeStrong((id *)&self->_fidoSignedChallenge, 0);
  objc_storeStrong((id *)&self->_fidoKey, 0);
  objc_storeStrong((id *)&self->_fidoAttestation, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_transferFromDevice, 0);
  objc_storeStrong((id *)&self->_externalDestinationDevices, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_challengeResponse, 0);
  objc_storeStrong((id *)&self->_cryptogram, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_activationData, 0);
  objc_storeStrong((id *)&self->_cardSecurityCode, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_eligibilityResponse, 0);
  objc_storeStrong((id *)&self->_deviceData, 0);
  objc_storeStrong((id *)&self->_certChain, 0);
  objc_storeStrong((id *)&self->_primaryJSBLSequenceCounter, 0);
}

@end
