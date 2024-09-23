@implementation PKPaymentEligibilityRequest

- (PKPaymentEligibilityRequest)init
{
  return -[PKPaymentEligibilityRequest initWithSource:](self, "initWithSource:", 1);
}

- (PKPaymentEligibilityRequest)initWithSource:(int64_t)a3
{
  PKPaymentEligibilityRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentEligibilityRequest;
  result = -[PKOverlayableWebServiceRequest init](&v5, sel_init);
  if (result)
    result->_source = a3;
  return result;
}

- (PKPaymentEligibilityRequest)initWithPaymentCredential:(id)a3
{
  id v4;
  PKPaymentEligibilityRequest *v5;
  PKPaymentEligibilityRequest *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *region;
  uint64_t v11;
  NSString *v12;

  v4 = a3;
  v5 = -[PKPaymentEligibilityRequest init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[PKPaymentEligibilityRequest setPaymentCredential:](v5, "setPaymentCredential:", v4);
    objc_msgSend(v4, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requirementsResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "region");
      v9 = objc_claimAutoreleasedReturnValue();
      region = v6->_region;
      v6->_region = (NSString *)v9;
    }
    else
    {
      objc_msgSend(v4, "underlyingPaymentPass");
      region = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(region, "passTypeIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v6->_region;
      v6->_region = (NSString *)v11;

    }
  }

  return v6;
}

- (PKPaymentEligibilityRequest)initWithAddRequestConfiguration:(id)a3 addRequest:(id)a4
{
  id v7;
  id v8;
  PKPaymentEligibilityRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  v9 = -[PKPaymentEligibilityRequest initWithSource:](self, "initWithSource:", 2);
  if (v9)
  {
    objc_msgSend(v8, "encryptionVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentEligibilityRequest setEncryptionVersion:](v9, "setEncryptionVersion:", v10);

    objc_msgSend(v8, "encryptedPassData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentEligibilityRequest setEncryptedCardData:](v9, "setEncryptedCardData:", v11);

    objc_msgSend(v8, "publicKeyHash");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentEligibilityRequest setPublicKeyHash:](v9, "setPublicKeyHash:", v12);

    objc_msgSend(v8, "ephemeralPublicKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentEligibilityRequest setEphemeralPublicKey:](v9, "setEphemeralPublicKey:", v13);

    objc_msgSend(v8, "wrappedKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentEligibilityRequest setWrappedKey:](v9, "setWrappedKey:", v14);

    objc_msgSend(v8, "issuerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentEligibilityRequest setIssuerIdentifier:](v9, "setIssuerIdentifier:", v15);

    objc_msgSend(v8, "hostApplicationIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentEligibilityRequest setHostApplicationIdentifier:](v9, "setHostApplicationIdentifier:", v16);

    objc_msgSend(v8, "hostApplicationVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentEligibilityRequest setHostApplicationVersion:](v9, "setHostApplicationVersion:", v17);

    objc_msgSend(v8, "FPInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentEligibilityRequest setFPInfo:](v9, "setFPInfo:", v18);

    objc_msgSend(v8, "nonce");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hexEncoding");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentEligibilityRequest setNonce:](v9, "setNonce:", v20);

    objc_storeStrong((id *)&v9->_addPaymentPassRequestConfiguration, a3);
  }

  return v9;
}

- (PKPaymentEligibilityRequest)initWithCoder:(id)a3
{
  id v4;
  PKPaymentEligibilityRequest *v5;
  uint64_t v6;
  PKPaymentCredential *paymentCredential;
  uint64_t v8;
  NSString *productIdentifier;
  uint64_t v10;
  NSString *issuerIdentifier;
  uint64_t v12;
  NSString *hostApplicationIdentifier;
  uint64_t v14;
  NSString *hostApplicationVersion;
  uint64_t v16;
  NSData *FPInfo;
  uint64_t v18;
  NSString *encryptionVersion;
  void *v20;
  uint64_t v21;
  NSString *cardholderName;
  void *v23;
  uint64_t v24;
  NSString *primaryAccountNumber;
  void *v26;
  uint64_t v27;
  NSString *expiration;
  uint64_t v29;
  NSData *encryptedCardData;
  uint64_t v31;
  NSData *publicKeyHash;
  uint64_t v33;
  NSData *ephemeralPublicKey;
  uint64_t v35;
  NSData *wrappedKey;
  uint64_t v37;
  NSString *nonce;
  uint64_t v39;
  NSString *referrerIdentifier;
  uint64_t v41;
  PKAddPaymentPassRequestConfiguration *addPaymentPassRequestConfiguration;
  uint64_t v43;
  PKPaymentTapToProvisionData *tapToProvisionData;
  uint64_t v45;
  NSString *odiAssessment;
  uint64_t v47;
  NSString *odiAssessmentVersion;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PKPaymentEligibilityRequest;
  v5 = -[PKOverlayableWebServiceRequest initWithCoder:](&v50, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PKPaymentCredential"));
    v6 = objc_claimAutoreleasedReturnValue();
    paymentCredential = v5->_paymentCredential;
    v5->_paymentCredential = (PKPaymentCredential *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v8;

    v5->_cardholderNameInputMethod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cardholderNameInputMethod"));
    v5->_primaryAccountNumberInputMethod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("primaryAccountNumberInputMethod"));
    v5->_expirationInputMethod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("expirationInputMethod"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("issuerIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    issuerIdentifier = v5->_issuerIdentifier;
    v5->_issuerIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostApplicationIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    hostApplicationIdentifier = v5->_hostApplicationIdentifier;
    v5->_hostApplicationIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostApplicationVersion"));
    v14 = objc_claimAutoreleasedReturnValue();
    hostApplicationVersion = v5->_hostApplicationVersion;
    v5->_hostApplicationVersion = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FPInfo"));
    v16 = objc_claimAutoreleasedReturnValue();
    FPInfo = v5->_FPInfo;
    v5->_FPInfo = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptionVersion"));
    v18 = objc_claimAutoreleasedReturnValue();
    encryptionVersion = v5->_encryptionVersion;
    v5->_encryptionVersion = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardholderName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pk_zString");
    v21 = objc_claimAutoreleasedReturnValue();
    cardholderName = v5->_cardholderName;
    v5->_cardholderName = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAccountNumber"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pk_zString");
    v24 = objc_claimAutoreleasedReturnValue();
    primaryAccountNumber = v5->_primaryAccountNumber;
    v5->_primaryAccountNumber = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiration"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pk_zString");
    v27 = objc_claimAutoreleasedReturnValue();
    expiration = v5->_expiration;
    v5->_expiration = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptedCardData"));
    v29 = objc_claimAutoreleasedReturnValue();
    encryptedCardData = v5->_encryptedCardData;
    v5->_encryptedCardData = (NSData *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyHash"));
    v31 = objc_claimAutoreleasedReturnValue();
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ephemeralPublicKey"));
    v33 = objc_claimAutoreleasedReturnValue();
    ephemeralPublicKey = v5->_ephemeralPublicKey;
    v5->_ephemeralPublicKey = (NSData *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wrappedKey"));
    v35 = objc_claimAutoreleasedReturnValue();
    wrappedKey = v5->_wrappedKey;
    v5->_wrappedKey = (NSData *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
    v37 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v37;

    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrerIdentifier"));
    v39 = objc_claimAutoreleasedReturnValue();
    referrerIdentifier = v5->_referrerIdentifier;
    v5->_referrerIdentifier = (NSString *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("addPaymentPassRequestConfiguration"));
    v41 = objc_claimAutoreleasedReturnValue();
    addPaymentPassRequestConfiguration = v5->_addPaymentPassRequestConfiguration;
    v5->_addPaymentPassRequestConfiguration = (PKAddPaymentPassRequestConfiguration *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tapToProvisionData"));
    v43 = objc_claimAutoreleasedReturnValue();
    tapToProvisionData = v5->_tapToProvisionData;
    v5->_tapToProvisionData = (PKPaymentTapToProvisionData *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("odiAssessment"));
    v45 = objc_claimAutoreleasedReturnValue();
    odiAssessment = v5->_odiAssessment;
    v5->_odiAssessment = (NSString *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("odiAssessmentVersion"));
    v47 = objc_claimAutoreleasedReturnValue();
    odiAssessmentVersion = v5->_odiAssessmentVersion;
    v5->_odiAssessmentVersion = (NSString *)v47;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentEligibilityRequest;
  v4 = a3;
  -[PKOverlayableWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_paymentCredential, CFSTR("paymentCredential"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_productIdentifier, CFSTR("productIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_cardholderNameInputMethod, CFSTR("cardholderNameInputMethod"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_primaryAccountNumberInputMethod, CFSTR("primaryAccountNumberInputMethod"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_expirationInputMethod, CFSTR("expirationInputMethod"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_issuerIdentifier, CFSTR("issuerIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_hostApplicationIdentifier, CFSTR("hostApplicationIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_hostApplicationVersion, CFSTR("hostApplicationVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_FPInfo, CFSTR("FPInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_encryptionVersion, CFSTR("encryptionVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardholderName, CFSTR("cardholderName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_primaryAccountNumber, CFSTR("primaryAccountNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_expiration, CFSTR("expiration"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_encryptedCardData, CFSTR("encryptedCardData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_publicKeyHash, CFSTR("publicKeyHash"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_ephemeralPublicKey, CFSTR("ephemeralPublicKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_wrappedKey, CFSTR("wrappedKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_nonce, CFSTR("nonce"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_referrerIdentifier, CFSTR("referrerIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_addPaymentPassRequestConfiguration, CFSTR("addPaymentPassRequestConfiguration"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tapToProvisionData, CFSTR("tapToProvisionData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_odiAssessment, CFSTR("odiAssessment"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_odiAssessmentVersion, CFSTR("odiAssessmentVersion"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPaymentCredential:(id)a3
{
  int64_t v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_paymentCredential, a3);
  if (objc_msgSend(v10, "isContactlessProductCredential"))
  {
    v5 = 3;
LABEL_13:
    self->_source = v5;
    goto LABEL_14;
  }
  if (objc_msgSend(v10, "isIdentityCredential"))
  {
    v5 = 6;
    goto LABEL_13;
  }
  if (!objc_msgSend(v10, "isShareableCredential"))
  {
    if ((objc_msgSend(v10, "isDigitalIssuanceProductCredential") & 1) != 0
      || objc_msgSend(v10, "isPurchasedProductCredential"))
    {
      v5 = 4;
    }
    else if (objc_msgSend(v10, "isSafariCredential"))
    {
      v5 = 8;
    }
    else
    {
      if (objc_msgSend(v10, "isAppleBalanceCredential"))
      {
        objc_msgSend(v10, "appleBalanceCredential");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        self->_source = objc_msgSend(v9, "eligibilitySource");

        goto LABEL_14;
      }
      v5 = 1;
    }
    goto LABEL_13;
  }
  objc_msgSend(v10, "shareableCredential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "source");

  if ((unint64_t)(v7 - 1) >= 0xB)
    v8 = 1;
  else
    v8 = v7;
  self->_source = v8;
LABEL_14:

}

- (unint64_t)_requestHTTPMethod
{
  PKPaymentCredential *paymentCredential;
  void *v4;
  char v5;

  paymentCredential = self->_paymentCredential;
  if (!paymentCredential)
    return 2;
  if (-[PKPaymentCredential isIdentityCredential](paymentCredential, "isIdentityCredential"))
  {
    -[PKPaymentCredential identityCredential](self->_paymentCredential, "identityCredential");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasExistingPassInformation");

    if ((v5 & 1) != 0)
      return 2;
  }
  if (-[PKPaymentCredential isContactlessProductCredential](self->_paymentCredential, "isContactlessProductCredential")
    || -[PKPaymentCredential isDigitalIssuanceProductCredential](self->_paymentCredential, "isDigitalIssuanceProductCredential")|| -[PKPaymentCredential isPurchasedProductCredential](self->_paymentCredential, "isPurchasedProductCredential")|| -[PKPaymentCredential isShareableCredential](self->_paymentCredential, "isShareableCredential")|| -[PKPaymentCredential isSafariCredential](self->_paymentCredential, "isSafariCredential")|| -[PKPaymentCredential isAppleBalanceCredential](self->_paymentCredential, "isAppleBalanceCredential")|| -[PKPaymentCredential isIdentityCredential](self->_paymentCredential, "isIdentityCredential"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)requiresNonce
{
  return -[PKPaymentEligibilityRequest _requestHTTPMethod](self, "_requestHTTPMethod") == 2;
}

- (void)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5 certChain:(id)a6 devSigned:(BOOL)a7 deviceData:(id)a8 webService:(id)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PKPaymentCredential *v21;
  _BOOL4 v22;
  PKPaymentCredential *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *referrerIdentifier;
  NSData *encryptedCardData;
  void *v32;
  id v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  PKPaymentCredential *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  NSString *v43;
  NSString *v44;
  id v45;
  void *v46;
  const __CFString *v47;
  _BOOL4 v48;
  PKPaymentCredential *v49;
  void *v50;
  void *v51;
  _QWORD *v52;
  uint64_t v53;
  _BOOL4 v54;
  PKPaymentCredential *v55;
  void *v56;
  NSString *v57;
  NSString *passOwnershipToken;
  void *v59;
  _BOOL4 v60;
  void *v61;
  NSObject *v62;
  objc_class *v63;
  void *v64;
  objc_class *v65;
  void *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  NSString *v70;
  NSString *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  const __CFString *encryptionVersion;
  NSString *productIdentifier;
  const __CFString *v92;
  const __CFString *v93;
  const __CFString *v94;
  NSString *issuerIdentifier;
  void *v96;
  void *v97;
  void *v98;
  NSString *hostApplicationIdentifier;
  NSString *hostApplicationVersion;
  NSData *FPInfo;
  void *v102;
  NSData *ephemeralPublicKey;
  void *v104;
  NSData *wrappedKey;
  void *v106;
  NSData *publicKeyHash;
  NSData *v108;
  void *v109;
  NSString *nonce;
  PKPaymentCredential *paymentCredential;
  _BOOL4 v112;
  PKPaymentCredential *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  PKEncryptedPushProvisioningTarget *encryptedProvisioningTarget;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  PKPaymentCredential *v128;
  void *v129;
  NSString *v130;
  NSString *v131;
  int64_t v132;
  id v133;
  NSString *primaryAccountNumber;
  NSString *expiration;
  NSString *cardholderName;
  void *v137;
  void *v138;
  id v139;
  id v140;
  id v141;
  id v142;
  _BOOL4 v143;
  void *v144;
  id v145;
  void *v146;
  _QWORD v147[4];
  id v148;
  id v149;
  void *v150;
  _QWORD v151[3];
  uint8_t buf[4];
  id v153;
  __int16 v154;
  void *v155;
  _QWORD v156[5];
  _QWORD v157[6];
  _QWORD v158[5];
  _QWORD v159[7];

  v143 = a7;
  v159[5] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v145 = a9;
  v20 = a10;
  v146 = v19;
  if (-[PKPaymentEligibilityRequest _requestHTTPMethod](self, "_requestHTTPMethod") != 1)
  {
    v151[0] = CFSTR("devices");
    v151[1] = v16;
    v140 = v16;
    v151[2] = CFSTR("cards");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 3);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v29, "setValue:forHTTPHeaderField:", CFSTR("application/binary"), CFSTR("Content-Type"));
    referrerIdentifier = self->_referrerIdentifier;
    if (referrerIdentifier)
      objc_msgSend(v29, "setValue:forHTTPHeaderField:", referrerIdentifier, CFSTR("x-apple-referrer-identifier"));
    encryptedCardData = self->_encryptedCardData;
    v141 = v15;
    v138 = v20;
    v139 = v17;
    if (encryptedCardData)
    {
      -[NSData base64EncodedDataWithOptions:](encryptedCardData, "base64EncodedDataWithOptions:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = 0;
      v33 = 0;
LABEL_67:
      v87 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_source);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setObject:forKeyedSubscript:", v88, CFSTR("source"));

      if (v32)
      {
        v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v32, 4);
        objc_msgSend(v87, "setObject:forKeyedSubscript:", v89, CFSTR("encryptedCardData"));
        if (self->_encryptionVersion)
          encryptionVersion = (const __CFString *)self->_encryptionVersion;
        else
          encryptionVersion = CFSTR("EV_ECC_v1-ASN.1");
        objc_msgSend(v87, "setObject:forKeyedSubscript:", encryptionVersion, CFSTR("encryptionVersion"));

      }
      productIdentifier = self->_productIdentifier;
      if (productIdentifier)
        objc_msgSend(v87, "setObject:forKeyedSubscript:", productIdentifier, CFSTR("productIdentifier"));
      switch(self->_primaryAccountNumberInputMethod)
      {
        case 0:
          goto LABEL_80;
        case 1:
          v92 = CFSTR("manual");
          goto LABEL_79;
        case 2:
          v92 = CFSTR("camera");
          goto LABEL_79;
        case 3:
          v92 = CFSTR("tapToProvision");
          goto LABEL_79;
        default:
          v92 = CFSTR("unknown");
LABEL_79:
          objc_msgSend(v87, "setObject:forKeyedSubscript:", v92, CFSTR("panInputMethod"));
LABEL_80:
          switch(self->_expirationInputMethod)
          {
            case 0:
              goto LABEL_86;
            case 1:
              v93 = CFSTR("manual");
              goto LABEL_85;
            case 2:
              v93 = CFSTR("camera");
              goto LABEL_85;
            case 3:
              v93 = CFSTR("tapToProvision");
              goto LABEL_85;
            default:
              v93 = CFSTR("unknown");
LABEL_85:
              objc_msgSend(v87, "setObject:forKeyedSubscript:", v93, CFSTR("expirationInputMethod"));
LABEL_86:
              switch(self->_cardholderNameInputMethod)
              {
                case 0:
                  goto LABEL_92;
                case 1:
                  v94 = CFSTR("manual");
                  goto LABEL_91;
                case 2:
                  v94 = CFSTR("camera");
                  goto LABEL_91;
                case 3:
                  v94 = CFSTR("tapToProvision");
                  goto LABEL_91;
                default:
                  v94 = CFSTR("unknown");
LABEL_91:
                  objc_msgSend(v87, "setObject:forKeyedSubscript:", v94, CFSTR("nameInputMethod"));
LABEL_92:
                  v37 = v18;
                  issuerIdentifier = self->_issuerIdentifier;
                  if (issuerIdentifier)
                    objc_msgSend(v87, "setObject:forKeyedSubscript:", issuerIdentifier, CFSTR("issuerIdentifier"));
                  -[PKPaymentTapToProvisionData dictionaryRepresentation](self->_tapToProvisionData, "dictionaryRepresentation");
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v87, "setObject:forKeyedSubscript:", v96, CFSTR("tapToProvisionCardData"));

                  if (self->_hostApplicationIdentifier || self->_hostApplicationVersion)
                  {
                    v97 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
                    v98 = v97;
                    hostApplicationIdentifier = self->_hostApplicationIdentifier;
                    if (hostApplicationIdentifier)
                      objc_msgSend(v97, "setObject:forKeyedSubscript:", hostApplicationIdentifier, CFSTR("identifier"));
                    hostApplicationVersion = self->_hostApplicationVersion;
                    if (hostApplicationVersion)
                      objc_msgSend(v98, "setObject:forKeyedSubscript:", hostApplicationVersion, CFSTR("version"));
                    objc_msgSend(v87, "setObject:forKeyedSubscript:", v98, CFSTR("hostApplication"));

                  }
                  FPInfo = self->_FPInfo;
                  if (FPInfo)
                  {
                    -[NSData base64EncodedStringWithOptions:](FPInfo, "base64EncodedStringWithOptions:", 0);
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "setObject:forKeyedSubscript:", v102, CFSTR("fpai"));

                  }
                  ephemeralPublicKey = self->_ephemeralPublicKey;
                  if (ephemeralPublicKey)
                  {
                    -[NSData base64EncodedStringWithOptions:](ephemeralPublicKey, "base64EncodedStringWithOptions:", 0);
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "setObject:forKeyedSubscript:", v104, CFSTR("ephemeralPublicKey"));

                  }
                  wrappedKey = self->_wrappedKey;
                  if (wrappedKey)
                  {
                    -[NSData base64EncodedStringWithOptions:](wrappedKey, "base64EncodedStringWithOptions:", 0);
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "setObject:forKeyedSubscript:", v106, CFSTR("wrappedKey"));

                  }
                  publicKeyHash = self->_publicKeyHash;
                  if ((unint64_t)publicKeyHash | (unint64_t)v33)
                  {
                    if (publicKeyHash)
                      v108 = self->_publicKeyHash;
                    else
                      v108 = (NSData *)v33;
                    -[NSData hexEncoding](v108, "hexEncoding");
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "setObject:forKeyedSubscript:", v109, CFSTR("publicKeyHash"));

                  }
                  nonce = self->_nonce;
                  if (nonce)
                    objc_msgSend(v87, "setValue:forKey:", nonce, CFSTR("nonce"));
                  paymentCredential = self->_paymentCredential;
                  if (!paymentCredential)
                    goto LABEL_128;
                  v112 = -[PKPaymentCredential isShareableCredential](paymentCredential, "isShareableCredential");
                  v113 = self->_paymentCredential;
                  if (v112)
                  {
                    -[PKPaymentCredential shareableCredential](v113, "shareableCredential");
                    v114 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v114, "encryptedProvisioningTarget");
                    v115 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v115)
                    {
                      objc_msgSend(v114, "encryptedProvisioningTarget");
                      v116 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v116, "asWebServiceDictionary");
                      v117 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v87, "addEntriesFromDictionary:", v117);

                    }
                    else
                    {
                      objc_msgSend(v114, "sharingInstanceIdentifier");
                      v116 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v87, "setObject:forKeyedSubscript:", v116, CFSTR("sharingInstanceIdentifier"));
                    }

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v114, "isBackgroundProvisioning"));
                    v122 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "setObject:forKeyedSubscript:", v122, CFSTR("backgroundProvisioning"));

                    if ((self->_source | 4) == 5)
                    {
                      PKPairedOrPairingDevice();
                      v123 = (void *)objc_claimAutoreleasedReturnValue();
                      PKSerialNumberFromNRDevice(v123);
                      v124 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v124)
                      {
                        v150 = v124;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v150, 1);
                        v125 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v87, "setObject:forKeyedSubscript:", v125, CFSTR("companionDeviceSerialNumbers"));

                      }
                    }
                  }
                  else
                  {
                    if (!-[PKPaymentCredential isIdentityCredential](v113, "isIdentityCredential"))
                      goto LABEL_128;
                    -[PKPaymentCredential identityCredential](self->_paymentCredential, "identityCredential");
                    v114 = (void *)objc_claimAutoreleasedReturnValue();
                    encryptedProvisioningTarget = self->_encryptedProvisioningTarget;
                    if (encryptedProvisioningTarget)
                    {
                      -[PKEncryptedPushProvisioningTarget asWebServiceDictionary](encryptedProvisioningTarget, "asWebServiceDictionary");
                      v119 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v87, "addEntriesFromDictionary:", v119);

                    }
                    objc_msgSend(v114, "passSerialNumber");
                    v120 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "setObject:forKeyedSubscript:", v120, CFSTR("passSerial"));

                    objc_msgSend(v114, "passTypeIdentifier");
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "setObject:forKeyedSubscript:", v121, CFSTR("passTypeIdentifier"));

                    objc_msgSend(v87, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("backgroundProvisioning"));
                  }

LABEL_128:
                  -[PKOverlayableWebServiceRequest _applyOverlayToDictionary:](self, "_applyOverlayToDictionary:", v87);
                  -[PKOverlayableWebServiceRequest setOverlayParameters:](self, "setOverlayParameters:", v87);
                  -[PKOverlayableWebServiceRequest _setOverriddenKeys:](self, "_setOverriddenKeys:", &unk_1E2C3E260);
                  -[PKOverlayableWebServiceRequest setRequiresConfigurationForRetry:](self, "setRequiresConfigurationForRetry:", 1);
                  -[PKOverlayableWebServiceRequest setRequiresConfigurationForRedirect:](self, "setRequiresConfigurationForRedirect:", 1);
                  -[PKOverlayableWebServiceRequest archivedData](self, "archivedData");
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v126)
                    objc_msgSend(MEMORY[0x1E0C92C78], "setProperty:forKey:inRequest:", v126, CFSTR("overlayRequest"), v29);
                  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v87);
                  v127 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "setHTTPBody:", v127);

                  v147[0] = MEMORY[0x1E0C809B0];
                  v147[1] = 3221225472;
                  v147[2] = __151__PKPaymentEligibilityRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke;
                  v147[3] = &unk_1E2AD44F0;
                  v148 = v138;
                  v38 = v145;
                  -[PKPaymentWebServiceRequest _signRequest:webService:completion:](self, "_signRequest:webService:completion:", v29, v145, v147);

                  v20 = v138;
                  v16 = v140;
                  v15 = v141;
                  v17 = v139;
                  break;
              }
              break;
          }
          break;
      }
      goto LABEL_131;
    }
    v39 = self->_paymentCredential;
    if (v39)
    {
      v40 = -[PKPaymentCredential isContactlessProductCredential](v39, "isContactlessProductCredential");
      v39 = self->_paymentCredential;
      if (v40)
      {
        -[PKPaymentCredential contactlessProductCredential](v39, "contactlessProductCredential");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "productIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          objc_msgSend(v41, "productIdentifier");
          v43 = (NSString *)objc_claimAutoreleasedReturnValue();
          v44 = self->_productIdentifier;
          self->_productIdentifier = v43;

        }
        v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v41, "cardSessionToken");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v46)
          goto LABEL_53;
        v47 = CFSTR("cardSessionToken");
        goto LABEL_52;
      }
      if (v39)
      {
        v60 = -[PKPaymentCredential isDigitalIssuanceProductCredential](v39, "isDigitalIssuanceProductCredential");
        v39 = self->_paymentCredential;
        if (v60)
        {
          v142 = v18;
          -[PKPaymentCredential digitalIssuanceProductCredential](v39, "digitalIssuanceProductCredential");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:
          v68 = v61;
          objc_msgSend(v61, "productIdentifier");
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          if (v69)
          {
            objc_msgSend(v68, "productIdentifier");
            v70 = (NSString *)objc_claimAutoreleasedReturnValue();
            v71 = self->_productIdentifier;
            self->_productIdentifier = v70;

          }
          v72 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v68, "purchase");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "identifier");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "partnerMetadata");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          if (v74)
            objc_msgSend(v72, "setObject:forKeyedSubscript:", v74, CFSTR("provisioningToken"));
          v45 = v72;
          if (v75)
            objc_msgSend(v72, "setObject:forKeyedSubscript:", v75, CFSTR("metadata"));

          v18 = v142;
          goto LABEL_55;
        }
        if (v39)
        {
          v67 = -[PKPaymentCredential isPurchasedProductCredential](v39, "isPurchasedProductCredential");
          v39 = self->_paymentCredential;
          if (v67)
          {
            v142 = v18;
            -[PKPaymentCredential purchasedProductCredential](v39, "purchasedProductCredential");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_43;
          }
        }
      }
    }
    if (!-[PKPaymentCredential isSafariCredential](v39, "isSafariCredential"))
    {
      v128 = self->_paymentCredential;
      if (v128)
      {
        if (-[PKPaymentCredential isAppleBalanceCredential](v128, "isAppleBalanceCredential"))
        {
          v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          -[PKPaymentCredential appleBalanceCredential](self->_paymentCredential, "appleBalanceCredential");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "product");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "productIdentifier");
          v130 = (NSString *)objc_claimAutoreleasedReturnValue();
          v131 = self->_productIdentifier;
          self->_productIdentifier = v130;

          v132 = -[PKPaymentCredential credentialType](self->_paymentCredential, "credentialType");
          if (!v132)
            goto LABEL_54;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v132);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = CFSTR("cardTypeCode");
          goto LABEL_52;
        }
        v128 = self->_paymentCredential;
      }
      if (-[PKPaymentCredential isShareableCredential](v128, "isShareableCredential")
        || -[PKPaymentCredential isIdentityCredential](self->_paymentCredential, "isIdentityCredential"))
      {
        v144 = 0;
        v33 = 0;
        v32 = 0;
        goto LABEL_67;
      }
      v133 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v45 = v133;
      primaryAccountNumber = self->_primaryAccountNumber;
      if (primaryAccountNumber)
        objc_msgSend(v133, "setObject:forKeyedSubscript:", primaryAccountNumber, CFSTR("primaryAccountNumber"));
      expiration = self->_expiration;
      if (expiration)
        objc_msgSend(v45, "setObject:forKeyedSubscript:", expiration, CFSTR("expiration"));
      cardholderName = self->_cardholderName;
      if (cardholderName)
        objc_msgSend(v45, "setObject:forKeyedSubscript:", cardholderName, CFSTR("name"));
LABEL_55:
      if (v45)
      {
        objc_msgSend(v19, "primaryJSBLSequenceCounter");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        if (v78)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v78, "stringValue");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "dataUsingEncoding:", 4);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "hexEncoding");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v81, CFSTR("jsblSequenceCounter"));

          }
        }
        objc_msgSend(v45, "setObject:forKeyedSubscript:", self->_odiAssessment, CFSTR("deviceScore"));
        objc_msgSend(v45, "setObject:forKeyedSubscript:", self->_odiAssessmentVersion, CFSTR("deviceScoreVersion"));
        -[PKOverlayableWebServiceRequest _applySecureOverlayToDictionary:](self, "_applySecureOverlayToDictionary:", v45);
        objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v45);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        PKLogFacilityTypeGetObject(6uLL);
        v83 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          v84 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v45, "allKeys");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "stringWithFormat:", CFSTR("Encrypted Eligibility Fields: %@"), v85);
          v86 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138477827;
          v153 = v86;
          _os_log_impl(&dword_18FC92000, v83, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);

        }
        v149 = 0;
        PKPaymentEncryptDataWithCertChain(v82, v18, v143, &v149);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v149;
        if (!v32)
        {
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v83, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate eligibility request encryptedCardData. This is bad!", buf, 2u);
          }

        }
        v144 = v45;

      }
      else
      {
        v144 = 0;
        v33 = 0;
        v32 = 0;
      }
      goto LABEL_67;
    }
    v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PKPaymentCredential safariCredential](self->_paymentCredential, "safariCredential");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "cardNumber");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v76, CFSTR("primaryAccountNumber"));

    objc_msgSend(v41, "expiration");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v77, CFSTR("expiration"));

    objc_msgSend(v41, "cardholderName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = CFSTR("name");
LABEL_52:
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v46, v47);
LABEL_53:

LABEL_54:
    goto LABEL_55;
  }
  v21 = self->_paymentCredential;
  if (v21)
  {
    v22 = -[PKPaymentCredential isRemoteCredential](v21, "isRemoteCredential");
    v23 = self->_paymentCredential;
    if (v22)
    {
      v24 = v20;
      v25 = v17;
      -[PKPaymentCredential remoteCredential](v23, "remoteCredential");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v159[0] = CFSTR("devices");
      v159[1] = v16;
      v159[2] = CFSTR("cards");
      objc_msgSend(v26, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v159[3] = v27;
      v159[4] = CFSTR("eligibility");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    v48 = -[PKPaymentCredential isAccountCredential](v23, "isAccountCredential");
    v49 = self->_paymentCredential;
    if (v48)
    {
      v24 = v20;
      v25 = v17;
      -[PKPaymentCredential accountCredential](v49, "accountCredential");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v158[0] = CFSTR("devices");
      v158[1] = v16;
      v158[2] = CFSTR("cards");
      objc_msgSend(v26, "passDetailsResponse");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "provisioningIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v158[3] = v50;
      v158[4] = CFSTR("eligibility");
      v51 = (void *)MEMORY[0x1E0C99D20];
      v52 = v158;
    }
    else
    {
      v54 = -[PKPaymentCredential isLocalPassCredential](v49, "isLocalPassCredential");
      v55 = self->_paymentCredential;
      if (v54)
      {
        v24 = v20;
        v25 = v17;
        -[PKPaymentCredential localPassCredential](v55, "localPassCredential");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v157[0] = CFSTR("devices");
        v157[1] = v16;
        v157[2] = CFSTR("passes");
        objc_msgSend(v26, "passTypeIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v157[3] = v27;
        objc_msgSend(v26, "serialNumber");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v157[4] = v50;
        v157[5] = CFSTR("eligibility");
        v51 = (void *)MEMORY[0x1E0C99D20];
        v52 = v157;
        v53 = 6;
        goto LABEL_23;
      }
      if (!-[PKPaymentCredential isPeerPaymentCredential](v55, "isPeerPaymentCredential"))
        goto LABEL_36;
      v24 = v20;
      v25 = v17;
      -[PKPaymentCredential peerPaymentCredential](self->_paymentCredential, "peerPaymentCredential");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "passDetailsResponse");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v156[0] = CFSTR("devices");
      v156[1] = v16;
      v156[2] = CFSTR("cards");
      objc_msgSend(v27, "provisioningIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v156[3] = v50;
      v156[4] = CFSTR("eligibility");
      v51 = (void *)MEMORY[0x1E0C99D20];
      v52 = v156;
    }
    v53 = 5;
LABEL_23:
    objc_msgSend(v51, "arrayWithObjects:count:", v52, v53);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
    v17 = v25;
    v20 = v24;
    if (v28)
    {
      -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v15, v28, 0, v17);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setHTTPMethod:", CFSTR("GET"));
      v57 = self->_referrerIdentifier;
      if (v57)
        objc_msgSend(v56, "setValue:forHTTPHeaderField:", v57, CFSTR("x-apple-referrer-identifier"));
      passOwnershipToken = self->_passOwnershipToken;
      v37 = v18;
      v38 = v145;
      if (passOwnershipToken)
        objc_msgSend(v56, "setValue:forHTTPHeaderField:", passOwnershipToken, CFSTR("X-Apple-Ownership-Token"));
      if (v20)
      {
        v59 = (void *)objc_msgSend(v56, "copy");
        (*((void (**)(id, void *))v20 + 2))(v20, v59);

      }
LABEL_39:

      goto LABEL_131;
    }
LABEL_36:
    PKLogFacilityTypeGetObject(6uLL);
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = (objc_class *)objc_opt_class();
      NSStringFromClass(v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v153 = v64;
      v154 = 2112;
      v155 = v66;
      _os_log_impl(&dword_18FC92000, v62, OS_LOG_TYPE_DEFAULT, "Error: Not able to create a %@ for credential type: %@", buf, 0x16u);

    }
    (*((void (**)(id, _QWORD))v20 + 2))(v20, 0);
    v28 = 0;
    v56 = 0;
    v37 = v18;
    v38 = v145;
    goto LABEL_39;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v153 = v36;
    _os_log_impl(&dword_18FC92000, v34, OS_LOG_TYPE_DEFAULT, "Error: Not able to create a %@ with nil credential", buf, 0xCu);

  }
  (*((void (**)(id, _QWORD))v20 + 2))(v20, 0);
  v37 = v18;
  v38 = v145;
LABEL_131:

}

void __151__PKPaymentEligibilityRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (id)objc_msgSend(a2, "copy");
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void)_updateRequestForRetry:(id)a3 retryFields:(id)a4 webService:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(a4, "PKStringForKey:", CFSTR("nonce"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_storeStrong((id *)&self->_nonce, v13);
    -[PKOverlayableWebServiceRequest setOverlayValue:forKey:](self, "setOverlayValue:forKey:", v13, CFSTR("nonce"));
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
  v15 = (void *)objc_opt_class();
  -[PKOverlayableWebServiceRequest overlayParameters](self, "overlayParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_HTTPBodyWithDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHTTPBody:", v17);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__PKPaymentEligibilityRequest__updateRequestForRetry_retryFields_webService_withCompletion___block_invoke;
  v19[3] = &unk_1E2AD44F0;
  v20 = v10;
  v18 = v10;
  -[PKPaymentWebServiceRequest _signRequest:webService:completion:](self, "_signRequest:webService:completion:", v12, v11, v19);

}

uint64_t __92__PKPaymentEligibilityRequest__updateRequestForRetry_retryFields_webService_withCompletion___block_invoke(uint64_t a1)
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
  PKPaymentEligibilityRequest *v13;
  id v14;
  id v15;

  v12[1] = 3221225472;
  v12[2] = __93__PKPaymentEligibilityRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke;
  v12[3] = &unk_1E2AD4518;
  v13 = self;
  v14 = a5;
  v15 = a6;
  v11.receiver = v13;
  v11.super_class = (Class)PKPaymentEligibilityRequest;
  v12[0] = MEMORY[0x1E0C809B0];
  v9 = v15;
  v10 = v14;
  -[PKOverlayableWebServiceRequest _updateRequestForRedirect:overrides:webService:withCompletion:](&v11, sel__updateRequestForRedirect_overrides_webService_withCompletion_, a3, a4, v10, v12);

}

void __93__PKPaymentEligibilityRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__PKPaymentEligibilityRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke_2;
  v5[3] = &unk_1E2AD44F0;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_signRequest:webService:completion:", a2, v4, v5);

}

uint64_t __93__PKPaymentEligibilityRequest__updateRequestForRedirect_overrides_webService_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (PKPaymentCredential)paymentCredential
{
  return self->_paymentCredential;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)cardholderNameInputMethod
{
  return self->_cardholderNameInputMethod;
}

- (void)setCardholderNameInputMethod:(int64_t)a3
{
  self->_cardholderNameInputMethod = a3;
}

- (int64_t)primaryAccountNumberInputMethod
{
  return self->_primaryAccountNumberInputMethod;
}

- (void)setPrimaryAccountNumberInputMethod:(int64_t)a3
{
  self->_primaryAccountNumberInputMethod = a3;
}

- (int64_t)expirationInputMethod
{
  return self->_expirationInputMethod;
}

- (void)setExpirationInputMethod:(int64_t)a3
{
  self->_expirationInputMethod = a3;
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (void)setIssuerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)hostApplicationVersion
{
  return self->_hostApplicationVersion;
}

- (void)setHostApplicationVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSData)FPInfo
{
  return self->_FPInfo;
}

- (void)setFPInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)encryptionVersion
{
  return self->_encryptionVersion;
}

- (void)setEncryptionVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (PKEncryptedPushProvisioningTarget)encryptedProvisioningTarget
{
  return self->_encryptedProvisioningTarget;
}

- (void)setEncryptedProvisioningTarget:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedProvisioningTarget, a3);
}

- (NSString)cardholderName
{
  return self->_cardholderName;
}

- (void)setCardholderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)primaryAccountNumber
{
  return self->_primaryAccountNumber;
}

- (void)setPrimaryAccountNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
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

- (NSString)odiAssessmentVersion
{
  return self->_odiAssessmentVersion;
}

- (void)setOdiAssessmentVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSData)encryptedCardData
{
  return self->_encryptedCardData;
}

- (void)setEncryptedCardData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (void)setEphemeralPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSData)wrappedKey
{
  return self->_wrappedKey;
}

- (void)setWrappedKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (int64_t)source
{
  return self->_source;
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (PKAddPaymentPassRequestConfiguration)addPaymentPassRequestConfiguration
{
  return self->_addPaymentPassRequestConfiguration;
}

- (PKPaymentTapToProvisionData)tapToProvisionData
{
  return self->_tapToProvisionData;
}

- (void)setTapToProvisionData:(id)a3
{
  objc_storeStrong((id *)&self->_tapToProvisionData, a3);
}

- (NSString)passOwnershipToken
{
  return self->_passOwnershipToken;
}

- (void)setPassOwnershipToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passOwnershipToken, 0);
  objc_storeStrong((id *)&self->_tapToProvisionData, 0);
  objc_storeStrong((id *)&self->_addPaymentPassRequestConfiguration, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_wrappedKey, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_encryptedCardData, 0);
  objc_storeStrong((id *)&self->_odiAssessmentVersion, 0);
  objc_storeStrong((id *)&self->_odiAssessment, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumber, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
  objc_storeStrong((id *)&self->_encryptedProvisioningTarget, 0);
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_FPInfo, 0);
  objc_storeStrong((id *)&self->_hostApplicationVersion, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentCredential, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
