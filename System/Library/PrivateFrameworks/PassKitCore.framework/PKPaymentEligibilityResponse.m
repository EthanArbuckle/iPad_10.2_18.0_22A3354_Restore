@implementation PKPaymentEligibilityResponse

- (PKPaymentEligibilityResponse)initWithData:(id)a3
{
  PKPaymentEligibilityResponse *v3;
  PKPaymentEligibilityResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *nonce;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSURL *termsURL;
  void *v19;
  uint64_t v20;
  NSString *termsID;
  void *v22;
  uint64_t v23;
  NSString *applicationIdentifier;
  void *v25;
  uint64_t v26;
  NSString *region;
  void *v28;
  void *v29;
  uint64_t v30;
  NSURL *learnMoreURL;
  void *v32;
  uint64_t v33;
  NSString *credentialAuthorityIdentifier;
  uint64_t v35;
  PKPaymentEligibilitySupplementaryData *v36;
  PKPaymentEligibilitySupplementaryData *supplementaryData;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  PKPaymentEligibilityResponse *v49;
  NSArray *requiredPaymentSetupFields;
  void *v51;
  void *v52;
  uint64_t v53;
  NSArray *auxiliaryCapabilityDecryptions;
  void *v55;
  uint64_t v56;
  NSArray *auxiliaryCapabilitySignatures;
  void *v58;
  char isKindOfClass;
  PKPaymentEligibilityFIDOProfile *v60;
  void *v61;
  uint64_t v62;
  PKPaymentEligibilityFIDOProfile *fidoProfile;
  void *v64;
  uint64_t v65;
  NSData *fidoChallenge;
  void *v67;
  char v68;
  PKPaymentEligibilityResponse *v69;
  void *v70;
  uint64_t v71;
  NSDictionary *transactionKeyInformation;
  void *v73;
  char v74;
  id v75;
  void *v76;
  uint64_t v77;
  NSSet *enableRequirements;
  void *v79;
  void *v80;
  int v81;
  uint64_t v82;
  NSObject *v83;
  objc_class *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  uint64_t v90;
  NSString *fpanIdentifier;
  void *v92;
  uint64_t v93;
  NSString *sanitizedPrimaryAccountNumber;
  void *v95;
  int v96;
  uint64_t v97;
  NSString *dpanIdentifier;
  void *v99;
  void *v100;
  void *v101;
  PKPaymentEligibilityResponse *v103;
  NSObject *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  objc_super v109;
  uint8_t buf[4];
  void *v111;
  __int16 v112;
  void *v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v109.receiver = self;
  v109.super_class = (Class)PKPaymentEligibilityResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v109, sel_initWithData_, a3);
  if (!v3)
    return 0;
  v4 = v3;
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eligibilityStatus")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    identifier = v4->_identifier;
    v4->_identifier = (NSString *)v8;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eligibilityStatus"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_eligibilityStatus = objc_msgSend(v10, "integerValue");

    objc_msgSend(v5, "PKStringForKey:", CFSTR("nonce"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    nonce = v4->_nonce;
    v4->_nonce = (NSString *)v12;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cardType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_cardType = objc_msgSend(v14, "integerValue");

    v15 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("termsURL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLWithString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    termsURL = v4->_termsURL;
    v4->_termsURL = (NSURL *)v17;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("termsID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    termsID = v4->_termsID;
    v4->_termsID = (NSString *)v20;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("applicationIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    applicationIdentifier = v4->_applicationIdentifier;
    v4->_applicationIdentifier = (NSString *)v23;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("region"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    region = v4->_region;
    v4->_region = (NSString *)v26;

    v28 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("learnMoreURL"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "URLWithString:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    learnMoreURL = v4->_learnMoreURL;
    v4->_learnMoreURL = (NSURL *)v30;

    objc_msgSend(v5, "PKStringForKey:", CFSTR("credentialAuthorityIdentifier"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "copy");
    credentialAuthorityIdentifier = v4->_credentialAuthorityIdentifier;
    v4->_credentialAuthorityIdentifier = (NSString *)v33;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("supplementaryData"));
    v35 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = -[PKPaymentEligibilitySupplementaryData initWithDictionary:accountFeatureIdentifier:]([PKPaymentEligibilitySupplementaryData alloc], "initWithDictionary:accountFeatureIdentifier:", v35, 4 * (v4->_cardType == 135));
      supplementaryData = v4->_supplementaryData;
      v4->_supplementaryData = v36;

    }
    v103 = (PKPaymentEligibilityResponse *)v35;
    v104 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredFields"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v105, v114, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v106;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v106 != v41)
            objc_enumerationMutation(v38);
          v43 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * i);
          objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("requiredFieldOptions"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "PKDictionaryForKey:", v43);
          v45 = v5;
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", v43, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject safelyAddObject:](v104, "safelyAddObject:", v47);

          v5 = v45;
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v105, v114, 16);
      }
      while (v40);
    }

    v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v104);
    v49 = v4;
    requiredPaymentSetupFields = v4->_requiredPaymentSetupFields;
    v4->_requiredPaymentSetupFields = (NSArray *)v48;

    objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("auxiliaryCapabilities"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      objc_msgSend(v51, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("deviceDecryptions"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_226);
      auxiliaryCapabilityDecryptions = v4->_auxiliaryCapabilityDecryptions;
      v4->_auxiliaryCapabilityDecryptions = (NSArray *)v53;

      objc_msgSend(v51, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("deviceSignatures"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_322);
      auxiliaryCapabilitySignatures = v4->_auxiliaryCapabilitySignatures;
      v4->_auxiliaryCapabilitySignatures = (NSArray *)v56;

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fidoProfile"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v60 = [PKPaymentEligibilityFIDOProfile alloc];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fidoProfile"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = -[PKPaymentEligibilityFIDOProfile initWithDictionary:](v60, "initWithDictionary:", v61);
      fidoProfile = v4->_fidoProfile;
      v4->_fidoProfile = (PKPaymentEligibilityFIDOProfile *)v62;

    }
    objc_msgSend(v5, "PKStringForKey:", CFSTR("fidoChallenge"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      v65 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v64, 1);
      fidoChallenge = v4->_fidoChallenge;
      v4->_fidoChallenge = (NSData *)v65;

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transactionKeyInformation"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v68 = objc_opt_isKindOfClass();

    v69 = v103;
    if ((v68 & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transactionKeyInformation"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "copy");
      transactionKeyInformation = v4->_transactionKeyInformation;
      v4->_transactionKeyInformation = (NSDictionary *)v71;

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enableRequirements"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v74 = objc_opt_isKindOfClass();

    if ((v74 & 1) != 0)
    {
      v75 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enableRequirements"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v75, "initWithArray:", v76);
      enableRequirements = v4->_enableRequirements;
      v4->_enableRequirements = (NSSet *)v77;

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceProvisioningDataExpected"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v79;
    if (v79)
    {
      v81 = objc_msgSend(v79, "BOOLValue");
      v82 = 1;
      if (!v81)
        v82 = 2;
    }
    else
    {
      v82 = 0;
    }
    v4->_deviceProvisioningDataExpected = v82;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("supportsVirtualCardNumber"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_supportsVirtualCardNumber = objc_msgSend(v88, "BOOLValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FPANIdentifier"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v89, "copy");
    fpanIdentifier = v4->_fpanIdentifier;
    v4->_fpanIdentifier = (NSString *)v90;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sanitizedPrimaryAccountNumber"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "copy");
    sanitizedPrimaryAccountNumber = v4->_sanitizedPrimaryAccountNumber;
    v4->_sanitizedPrimaryAccountNumber = (NSString *)v93;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isCardOnFile"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "BOOLValue");

    if (v96)
      v4->_supersededBy = 1;
    objc_msgSend(v5, "PKStringForKey:", CFSTR("DPANIdentifier"));
    v97 = objc_claimAutoreleasedReturnValue();
    dpanIdentifier = v4->_dpanIdentifier;
    v4->_dpanIdentifier = (NSString *)v97;

    objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("paymentApplications"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_349);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v100, "count"))
      v101 = v100;
    else
      v101 = 0;
    objc_storeStrong((id *)&v4->_paymentApplications, v101);

    v83 = v104;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      v84 = (objc_class *)objc_opt_class();
      NSStringFromClass(v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v111 = v85;
      v112 = 2112;
      v113 = v86;
      v87 = v86;
      _os_log_impl(&dword_18FC92000, v83, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

    }
    v69 = v4;
    v49 = 0;
  }

  return v49;
}

PKPassAuxiliaryRegistrationDecryptionRequirement *__45__PKPaymentEligibilityResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKPassAuxiliaryRegistrationDecryptionRequirement *v3;

  v2 = a2;
  v3 = -[PKPassAuxiliaryRegistrationDecryptionRequirement initWithDictionary:]([PKPassAuxiliaryRegistrationDecryptionRequirement alloc], "initWithDictionary:", v2);

  return v3;
}

PKPassAuxiliaryRegistrationSignatureRequirement *__45__PKPaymentEligibilityResponse_initWithData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PKPassAuxiliaryRegistrationSignatureRequirement *v3;

  v2 = a2;
  v3 = -[PKPassAuxiliaryRegistrationSignatureRequirement initWithDictionary:]([PKPassAuxiliaryRegistrationSignatureRequirement alloc], "initWithDictionary:", v2);

  return v3;
}

PKProvisioningPaymentApplication *__45__PKPaymentEligibilityResponse_initWithData___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  PKProvisioningPaymentApplication *v3;

  v2 = a2;
  v3 = -[PKProvisioningPaymentApplication initWithDictionary:]([PKProvisioningPaymentApplication alloc], "initWithDictionary:", v2);

  return v3;
}

- (BOOL)shouldGenerateFidoKey
{
  NSSet *enableRequirements;

  enableRequirements = self->_enableRequirements;
  if (enableRequirements)
    LOBYTE(enableRequirements) = -[NSSet containsObject:](enableRequirements, "containsObject:", CFSTR("GENERATE_FIDO_KEYS"));
  return (char)enableRequirements;
}

- (BOOL)shouldSignFidoChallenge
{
  NSSet *enableRequirements;

  enableRequirements = self->_enableRequirements;
  if (enableRequirements)
    LOBYTE(enableRequirements) = -[NSSet containsObject:](enableRequirements, "containsObject:", CFSTR("SIGN_FIDO_CHALLENGE"));
  return (char)enableRequirements;
}

- (BOOL)shouldGenerateISO18013EncryptionKey
{
  NSSet *enableRequirements;

  enableRequirements = self->_enableRequirements;
  if (enableRequirements)
    LOBYTE(enableRequirements) = -[NSSet containsObject:](enableRequirements, "containsObject:", CFSTR("GENERATE_ISO180135_ENCRYPTION_KEY"));
  return (char)enableRequirements;
}

- (BOOL)shouldGenerateTransactionKey
{
  NSSet *enableRequirements;

  enableRequirements = self->_enableRequirements;
  if (enableRequirements)
    LOBYTE(enableRequirements) = -[NSSet containsObject:](enableRequirements, "containsObject:", CFSTR("GENERATE_TRANSACTION_KEY"));
  return (char)enableRequirements;
}

- (BOOL)shouldGenerateLongTermPrivacyKey
{
  NSSet *enableRequirements;

  enableRequirements = self->_enableRequirements;
  if (enableRequirements)
    LOBYTE(enableRequirements) = -[NSSet containsObject:](enableRequirements, "containsObject:", CFSTR("GENERATE_LONG_TERM_PRIVACY_KEY"));
  return (char)enableRequirements;
}

- (BOOL)hasEnableRequirements
{
  NSSet *enableRequirements;

  enableRequirements = self->_enableRequirements;
  if (enableRequirements)
    LOBYTE(enableRequirements) = -[NSSet count](enableRequirements, "count") != 0;
  return (char)enableRequirements;
}

- (BOOL)shouldGenerateAuxiliaryCapabilities
{
  return -[NSArray count](self->_auxiliaryCapabilitySignatures, "count")
      || -[NSArray count](self->_auxiliaryCapabilityDecryptions, "count") != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)eligibilityStatus
{
  return self->_eligibilityStatus;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (unint64_t)deviceProvisioningDataExpected
{
  return self->_deviceProvisioningDataExpected;
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (NSString)termsID
{
  return self->_termsID;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSString)region
{
  return self->_region;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (PKPaymentEligibilitySupplementaryData)supplementaryData
{
  return self->_supplementaryData;
}

- (NSArray)requiredPaymentSetupFields
{
  return self->_requiredPaymentSetupFields;
}

- (PKPaymentEligibilityFIDOProfile)fidoProfile
{
  return self->_fidoProfile;
}

- (NSData)fidoChallenge
{
  return self->_fidoChallenge;
}

- (NSDictionary)transactionKeyInformation
{
  return self->_transactionKeyInformation;
}

- (NSArray)auxiliaryCapabilityDecryptions
{
  return self->_auxiliaryCapabilityDecryptions;
}

- (NSArray)auxiliaryCapabilitySignatures
{
  return self->_auxiliaryCapabilitySignatures;
}

- (NSString)credentialAuthorityIdentifier
{
  return self->_credentialAuthorityIdentifier;
}

- (BOOL)supportsVirtualCardNumber
{
  return self->_supportsVirtualCardNumber;
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (NSString)sanitizedPrimaryAccountNumber
{
  return self->_sanitizedPrimaryAccountNumber;
}

- (int64_t)supersededBy
{
  return self->_supersededBy;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (NSArray)paymentApplications
{
  return self->_paymentApplications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentApplications, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountNumber, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialAuthorityIdentifier, 0);
  objc_storeStrong((id *)&self->_auxiliaryCapabilitySignatures, 0);
  objc_storeStrong((id *)&self->_auxiliaryCapabilityDecryptions, 0);
  objc_storeStrong((id *)&self->_transactionKeyInformation, 0);
  objc_storeStrong((id *)&self->_fidoChallenge, 0);
  objc_storeStrong((id *)&self->_fidoProfile, 0);
  objc_storeStrong((id *)&self->_requiredPaymentSetupFields, 0);
  objc_storeStrong((id *)&self->_supplementaryData, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_termsID, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_enableRequirements, 0);
}

@end
