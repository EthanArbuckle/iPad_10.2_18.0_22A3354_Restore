@implementation PKAppletSubcredential

- (PKAppletSubcredential)initWithDictionary:(id)a3
{
  id v4;
  PKAppletSubcredential *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSObject *v9;
  PKPassEntitlement *v10;
  PKPassEntitlement *entitlement;
  void *v12;
  PKAppletSubcredentialSharingConfirguration *v13;
  PKAppletSubcredentialSharingConfirguration *sharingConfiguration;
  uint64_t v15;
  NSString *invitationIdentifier;
  uint64_t v17;
  NSString *partnerIdentifier;
  uint64_t v19;
  NSString *pairedReaderIdentifier;
  uint64_t v21;
  NSString *brandIdentifier;
  uint64_t v23;
  NSString *endpointIdentifier;
  void *v25;
  uint64_t v26;
  NSUUID *sharingSessionIdentifier;
  uint64_t v28;
  NSString *originatorIDSHandle;
  uint64_t v30;
  uint64_t allSupportedRadioTechnologies;
  uint64_t v32;
  NSString *isoFormat;
  void *v34;
  uint64_t v35;
  NSData *readerIdentifier;
  void *v37;
  uint64_t v38;
  NSSet *aliroGroupResolvingKeys;
  PKAppletSubcredential *v40;
  NSObject *v41;
  NSObject *v42;
  int v44;
  const __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKAppletSubcredential init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    if (v5->_identifier)
    {
      v8 = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("state"));
      v5->_state = v8;
      if (v8)
      {
        objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("entitlement"));
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9
          || (v10 = -[PKPassEntitlement initWithSubcredentialDictionary:active:subcredentialIdentifier:]([PKPassEntitlement alloc], "initWithSubcredentialDictionary:active:subcredentialIdentifier:", v9, 1, v5->_identifier), entitlement = v5->_entitlement, v5->_entitlement = v10, entitlement, v5->_entitlement))
        {
          objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("sharing"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = -[PKAppletSubcredentialSharingConfirguration initWithDictionary:]([PKAppletSubcredentialSharingConfirguration alloc], "initWithDictionary:", v12);
            sharingConfiguration = v5->_sharingConfiguration;
            v5->_sharingConfiguration = v13;

          }
          objc_msgSend(v4, "PKStringForKey:", CFSTR("invitationIdentifier"));
          v15 = objc_claimAutoreleasedReturnValue();
          invitationIdentifier = v5->_invitationIdentifier;
          v5->_invitationIdentifier = (NSString *)v15;

          objc_msgSend(v4, "PKStringForKey:", CFSTR("partnerIdentifier"));
          v17 = objc_claimAutoreleasedReturnValue();
          partnerIdentifier = v5->_partnerIdentifier;
          v5->_partnerIdentifier = (NSString *)v17;

          objc_msgSend(v4, "PKStringForKey:", CFSTR("pairedReaderIdentifier"));
          v19 = objc_claimAutoreleasedReturnValue();
          pairedReaderIdentifier = v5->_pairedReaderIdentifier;
          v5->_pairedReaderIdentifier = (NSString *)v19;

          objc_msgSend(v4, "PKStringForKey:", CFSTR("brandIdentifier"));
          v21 = objc_claimAutoreleasedReturnValue();
          brandIdentifier = v5->_brandIdentifier;
          v5->_brandIdentifier = (NSString *)v21;

          objc_msgSend(v4, "PKStringForKey:", CFSTR("endpointIdentifier"));
          v23 = objc_claimAutoreleasedReturnValue();
          endpointIdentifier = v5->_endpointIdentifier;
          v5->_endpointIdentifier = (NSString *)v23;

          v5->_isOnlineImmobilizerToken = objc_msgSend(v4, "PKBoolForKey:", CFSTR("onlineImmobilizerToken"));
          objc_msgSend(v4, "PKStringForKey:", CFSTR("sharingSessionIdentifier"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v25);
            sharingSessionIdentifier = v5->_sharingSessionIdentifier;
            v5->_sharingSessionIdentifier = (NSUUID *)v26;

          }
          objc_msgSend(v4, "PKStringForKey:", CFSTR("originatorIDSHandle"));
          v28 = objc_claimAutoreleasedReturnValue();
          originatorIDSHandle = v5->_originatorIDSHandle;
          v5->_originatorIDSHandle = (NSString *)v28;

          v5->_allSupportedRadioTechnologies = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("allSupportedRadioTechnologies"));
          v30 = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("supportedRadioTechnologies"));
          v5->_supportedRadioTechnologies = v30;
          if (!v30)
          {
            allSupportedRadioTechnologies = v5->_allSupportedRadioTechnologies;
            if (allSupportedRadioTechnologies)
              v5->_supportedRadioTechnologies = PKRadioTechnologyForConfigurationTechnology(allSupportedRadioTechnologies);
          }
          objc_msgSend(v4, "PKStringForKey:", CFSTR("isoFormat"));
          v32 = objc_claimAutoreleasedReturnValue();
          isoFormat = v5->_isoFormat;
          v5->_isoFormat = (NSString *)v32;

          v5->_credentialType = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("paymentNetwork"));
          objc_msgSend(v4, "PKStringForKey:", CFSTR("readerIdentifier"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "pk_decodeHexadecimal");
          v35 = objc_claimAutoreleasedReturnValue();
          readerIdentifier = v5->_readerIdentifier;
          v5->_readerIdentifier = (NSData *)v35;

          objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("aliroGroupResolvingKeys"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "pk_setBySafelyApplyingBlock:", &__block_literal_global_158);
          v38 = objc_claimAutoreleasedReturnValue();
          aliroGroupResolvingKeys = v5->_aliroGroupResolvingKeys;
          v5->_aliroGroupResolvingKeys = (NSSet *)v38;

          goto LABEL_14;
        }
        PKLogFacilityTypeGetObject(0x16uLL);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v44 = 138412290;
          v45 = (const __CFString *)v9;
          _os_log_impl(&dword_18FC92000, v42, OS_LOG_TYPE_DEFAULT, "Invalid credential, invalid dict: %@", (uint8_t *)&v44, 0xCu);
        }

      }
      else
      {
        PKLogFacilityTypeGetObject(0x16uLL);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v44 = 138412290;
          v45 = CFSTR("state");
          _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Invalid credential, missing key: %@", (uint8_t *)&v44, 0xCu);
        }
      }

    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v44 = 138412290;
        v45 = CFSTR("identifier");
        _os_log_impl(&dword_18FC92000, v41, OS_LOG_TYPE_DEFAULT, "Invalid credential, missing key: %@", (uint8_t *)&v44, 0xCu);
      }

    }
    v40 = 0;
    goto LABEL_25;
  }
LABEL_14:
  v40 = v5;
LABEL_25:

  return v40;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

- (NSString)pairedReaderIdentifier
{
  return self->_pairedReaderIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionKeyCertificateChain, 0);
  objc_storeStrong((id *)&self->_transactionKey, 0);
  objc_storeStrong((id *)&self->_trackingRequest, 0);
  objc_storeStrong((id *)&self->_aliroGroupResolvingKeys, 0);
  objc_storeStrong((id *)&self->_isoFormat, 0);
  objc_storeStrong((id *)&self->_originatorIDSHandle, 0);
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_brandIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingConfiguration, 0);
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (PKAppletSubcredential)initWithKeyInformation:(id)a3
{
  id v4;
  PKAppletSubcredential *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  NSArray *transactionKeyCertificateChain;
  uint64_t v15;
  NSData *transactionKey;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *appletIdentifier;
  unint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  NSString *v24;
  uint64_t v25;
  NSData *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *v30;
  uint64_t v31;
  NSData *readerIdentifier;
  uint64_t v33;
  NSString *pairedReaderIdentifier;
  PKAppletSubcredential *v35;
  void *v37;
  PKSubcredentialEncryptedContainer *v38;
  PKSubcredentialEncryptedContainer *trackingRequest;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSString *invitationIdentifier;
  void *v45;
  uint64_t v46;
  NSString *partnerIdentifier;
  uint64_t v48;
  NSString *endpointIdentifier;
  void *v50;
  uint64_t v51;
  NSString *originatorIDSHandle;
  uint64_t v53;
  NSUUID *sharingSessionIdentifier;
  PKAppletSubcredentialSharingConfirguration *v55;
  PKAppletSubcredentialSharingConfirguration *sharingConfiguration;
  PKPassShareActivationOptions *v57;
  void *v58;
  void *v59;
  PKPassShareActivationOptions *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  id obj;
  id v69;
  void *v70;
  uint8_t buf[4];
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKAppletSubcredential init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "publicKeyIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = objc_msgSend(v4, "keyType");
    switch(v8)
    {
      case 1:
        objc_msgSend(v4, "alishaKeyInformation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "trackingRequest");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v38 = -[PKSubcredentialEncryptedContainer initWithRequest:]([PKSubcredentialEncryptedContainer alloc], "initWithRequest:", v37);
          trackingRequest = v5->_trackingRequest;
          v5->_trackingRequest = v38;

        }
        v5->_credentialState = 21;
        objc_msgSend(v12, "revocationAttestation");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          v41 = 129;
        }
        else
        {
          objc_msgSend(v12, "trackingReceipt");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v42)
            goto LABEL_16;
          v41 = 15;
        }
        v5->_credentialState = v41;
LABEL_16:
        obj = 0;
        v69 = 0;
        objc_msgSend(v12, "invitationIdentifier");
        v43 = objc_claimAutoreleasedReturnValue();
        invitationIdentifier = v5->_invitationIdentifier;
        v5->_invitationIdentifier = (NSString *)v43;

        objc_msgSend(v12, "pairedEntityIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        PKCredentialRoutingInformationFromPairedEntityIdentifer(v45, &v69, &obj);
        v46 = objc_claimAutoreleasedReturnValue();
        partnerIdentifier = v5->_partnerIdentifier;
        v5->_partnerIdentifier = (NSString *)v46;

        objc_storeStrong((id *)&v5->_brandIdentifier, obj);
        objc_storeStrong((id *)&v5->_pairedReaderIdentifier, v69);
        objc_msgSend(v12, "localIdentifier");
        v48 = objc_claimAutoreleasedReturnValue();
        endpointIdentifier = v5->_endpointIdentifier;
        v5->_endpointIdentifier = (NSString *)v48;

        v5->_isOnlineImmobilizerToken = objc_msgSend(v12, "onlineImmobilizerToken");
        objc_msgSend(v12, "supportedTransports");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_allSupportedRadioTechnologies = PKRadioTechnologyFromNumbers(v50);

        v5->_supportedRadioTechnologies = PKRadioTechnologyForConfigurationTechnology(v5->_allSupportedRadioTechnologies);
        if (!v5->_partnerIdentifier || !v5->_pairedReaderIdentifier || !v5->_brandIdentifier)
        {
          PKLogFacilityTypeGetObject(0x16uLL);
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "pairedEntityIdentifier");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v72 = v67;
            _os_log_impl(&dword_18FC92000, v66, OS_LOG_TYPE_DEFAULT, "Unable to parse paired entity identifier: %@", buf, 0xCu);

          }
          v35 = 0;
          goto LABEL_8;
        }
        v5->_credentialType = 301;
        objc_msgSend(v12, "ownerIDSIdentifier");
        v51 = objc_claimAutoreleasedReturnValue();
        originatorIDSHandle = v5->_originatorIDSHandle;
        v5->_originatorIDSHandle = (NSString *)v51;

        objc_msgSend(v12, "sharingSessionUUID");
        v53 = objc_claimAutoreleasedReturnValue();
        sharingSessionIdentifier = v5->_sharingSessionIdentifier;
        v5->_sharingSessionIdentifier = (NSUUID *)v53;

        if (objc_msgSend(v12, "vehicleSupportsSharingPassword"))
        {
          v55 = objc_alloc_init(PKAppletSubcredentialSharingConfirguration);
          sharingConfiguration = v5->_sharingConfiguration;
          v5->_sharingConfiguration = v55;

          v57 = [PKPassShareActivationOptions alloc];
          +[PKPassShareActivationOption vehicleEnteredPin](PKPassShareActivationOption, "vehicleEnteredPin");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v58;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = -[PKPassShareActivationOptions initWithOptions:](v57, "initWithOptions:", v59);

          -[PKAppletSubcredentialSharingConfirguration setActivationOptions:](v5->_sharingConfiguration, "setActivationOptions:", v60);
        }
        v61 = objc_msgSend(v12, "agreedFrameworkVersion");
        if (v61 == 257)
          v62 = 2;
        else
          v62 = 1;
        if (v61 == 768)
          v62 = 3;
        v5->_carKeyVehicleVersion = v62;
        if (objc_msgSend(v12, "agreedVehicleServerVersion") == 768)
          v63 = 2;
        else
          v63 = 1;
        v5->_carKeyServerVersion = v63;
        if (objc_msgSend(v12, "fleetVehicle"))
          v64 = 2;
        else
          v64 = 1;
        v5->_keyClass = v64;
        if (objc_msgSend(v12, "serverIssued"))
          v65 = 2;
        else
          v65 = 1;
        v5->_credentialAuthorityType = v65;

LABEL_6:
        break;
      case 2:
      case 4:
        v5->_credentialState = 21;
        v9 = v8 == 2;
        v5->_supportedRadioTechnologies = v9;
        v5->_allSupportedRadioTechnologies = v9;
        objc_msgSend(v4, "publicKeyIdentifier");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v5->_endpointIdentifier;
        v5->_endpointIdentifier = (NSString *)v10;

        objc_msgSend(v4, "hydraKeyInformation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "certificateChain");
        v13 = objc_claimAutoreleasedReturnValue();
        transactionKeyCertificateChain = v5->_transactionKeyCertificateChain;
        v5->_transactionKeyCertificateChain = (NSArray *)v13;

        -[NSArray lastObject](v5->_transactionKeyCertificateChain, "lastObject");
        v15 = objc_claimAutoreleasedReturnValue();
        transactionKey = v5->_transactionKey;
        v5->_transactionKey = (NSData *)v15;

        objc_msgSend(v12, "appletIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "hexEncoding");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uppercaseString");
        v19 = objc_claimAutoreleasedReturnValue();
        appletIdentifier = v5->_appletIdentifier;
        v5->_appletIdentifier = (NSString *)v19;

        v5->_credentialType = 130;
        v21 = 2;
        goto LABEL_5;
      case 3:
      case 5:
        v5->_credentialState = 21;
        v22 = v8 == 3;
        v5->_supportedRadioTechnologies = v22;
        v5->_allSupportedRadioTechnologies = v22;
        objc_msgSend(v4, "publicKeyIdentifier");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v5->_endpointIdentifier;
        v5->_endpointIdentifier = (NSString *)v23;

        objc_msgSend(v4, "homeKeyInformation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "publicKey");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v5->_transactionKey;
        v5->_transactionKey = (NSData *)v25;

        objc_msgSend(v12, "appletIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "hexEncoding");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "uppercaseString");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v5->_appletIdentifier;
        v5->_appletIdentifier = (NSString *)v29;

        objc_msgSend(v12, "readerIdentifier");
        v31 = objc_claimAutoreleasedReturnValue();
        readerIdentifier = v5->_readerIdentifier;
        v5->_readerIdentifier = (NSData *)v31;

        -[NSData hexEncoding](v5->_readerIdentifier, "hexEncoding");
        v33 = objc_claimAutoreleasedReturnValue();
        pairedReaderIdentifier = v5->_pairedReaderIdentifier;
        v5->_pairedReaderIdentifier = (NSString *)v33;

        v5->_credentialType = 133;
        v21 = 1;
LABEL_5:
        *(int64x2_t *)&v5->_keyClass = vdupq_n_s64(v21);
        goto LABEL_6;
      default:
        break;
    }
  }
  v35 = v5;
LABEL_8:

  return v35;
}

- (PKAppletSubcredential)initWithIdentifier:(id)a3
{
  id v5;
  PKAppletSubcredential *v6;
  PKAppletSubcredential *v7;

  v5 = a3;
  v6 = -[PKAppletSubcredential init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

uint64_t __44__PKAppletSubcredential_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pk_decodeHexadecimal");
}

- (id)asDictionary
{
  id v3;
  void *v4;
  NSString *identifier;
  void *v6;
  void *v7;
  PKPassEntitlement *entitlement;
  void *v9;
  PKAppletSubcredentialSharingConfirguration *sharingConfiguration;
  void *v11;
  NSString *invitationIdentifier;
  NSString *partnerIdentifier;
  NSString *pairedReaderIdentifier;
  NSString *brandIdentifier;
  NSString *endpointIdentifier;
  NSUUID *sharingSessionIdentifier;
  NSString *originatorIDSHandle;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isOnlineImmobilizerToken);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("onlineImmobilizerToken"));

  entitlement = self->_entitlement;
  if (entitlement)
  {
    -[PKPassEntitlement subcredentialDictionaryRepresentation](entitlement, "subcredentialDictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("entitlement"));

  }
  sharingConfiguration = self->_sharingConfiguration;
  if (sharingConfiguration)
  {
    -[PKAppletSubcredentialSharingConfirguration asDictionary](sharingConfiguration, "asDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("sharing"));

  }
  invitationIdentifier = self->_invitationIdentifier;
  if (invitationIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", invitationIdentifier, CFSTR("invitationIdentifier"));
  partnerIdentifier = self->_partnerIdentifier;
  if (partnerIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", partnerIdentifier, CFSTR("partnerIdentifier"));
  pairedReaderIdentifier = self->_pairedReaderIdentifier;
  if (pairedReaderIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", pairedReaderIdentifier, CFSTR("pairedReaderIdentifier"));
  brandIdentifier = self->_brandIdentifier;
  if (brandIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", brandIdentifier, CFSTR("brandIdentifier"));
  endpointIdentifier = self->_endpointIdentifier;
  if (endpointIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", endpointIdentifier, CFSTR("endpointIdentifier"));
  sharingSessionIdentifier = self->_sharingSessionIdentifier;
  if (sharingSessionIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", sharingSessionIdentifier, CFSTR("sharingSessionIdentifier"));
  originatorIDSHandle = self->_originatorIDSHandle;
  if (originatorIDSHandle)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", originatorIDSHandle, CFSTR("originatorIDSHandle"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_allSupportedRadioTechnologies);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("allSupportedRadioTechnologies"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_supportedRadioTechnologies);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("supportedRadioTechnologies"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_isoFormat, CFSTR("isoFormat"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_credentialType);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("paymentNetwork"));

  -[NSData hexEncoding](self->_readerIdentifier, "hexEncoding");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("readerIdentifier"));

  -[NSSet pk_setByApplyingBlock:](self->_aliroGroupResolvingKeys, "pk_setByApplyingBlock:", &__block_literal_global_80_0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("aliroGroupResolvingKeys"));

  v24 = (void *)objc_msgSend(v4, "copy");
  return v24;
}

uint64_t __37__PKAppletSubcredential_asDictionary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hexEncoding");
}

- (BOOL)canShare
{
  _BOOL4 v3;

  v3 = -[PKAppletSubcredential isShareable](self, "isShareable");
  if (v3)
    LOBYTE(v3) = -[PKAppletSubcredentialSharingConfirguration numberOfShareableCredentials](self->_sharingConfiguration, "numberOfShareableCredentials") != 0;
  return v3;
}

- (BOOL)isShareable
{
  int64_t state;

  state = self->_state;
  return (state == 15 || state == 1)
      && -[PKAppletSubcredentialSharingConfirguration maxNumberOfSharedCredentials](self->_sharingConfiguration, "maxNumberOfSharedCredentials") != 0;
}

- (BOOL)isSharedCredential
{
  NSObject *v4;
  NSString *endpointIdentifier;
  int v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!-[NSString hasPrefix:](self->_endpointIdentifier, "hasPrefix:", CFSTR("DIGK.OWNR")))
  {
    if (-[NSString hasPrefix:](self->_endpointIdentifier, "hasPrefix:", CFSTR("DIGK.FRND")))
      return 1;
    PKLogFacilityTypeGetObject(0x16uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      endpointIdentifier = self->_endpointIdentifier;
      v6 = 138412290;
      v7 = endpointIdentifier;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Unexpected endpoint ID (%@), assuming key is not shared", (uint8_t *)&v6, 0xCu);
    }

  }
  return 0;
}

- (NSString)manufacturerIdentifier
{
  void *v2;
  void *v3;

  -[NSString componentsSeparatedByString:](self->_partnerIdentifier, "componentsSeparatedByString:", CFSTR("."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  void *v6;
  unint64_t keyClass;
  const __CFString *v8;
  const __CFString *v9;
  unint64_t credentialAuthorityType;
  const __CFString *v11;
  const __CFString *v12;
  id v13;

  identifier = self->_identifier;
  v13 = a3;
  objc_msgSend(v13, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v13, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_entitlement, CFSTR("entitlement"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_sharingConfiguration, CFSTR("sharing"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_invitationIdentifier, CFSTR("invitationIdentifier"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_partnerIdentifier, CFSTR("partnerIdentifier"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_pairedReaderIdentifier, CFSTR("pairedReaderIdentifier"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_brandIdentifier, CFSTR("brandIdentifier"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_endpointIdentifier, CFSTR("endpointIdentifier"));
  objc_msgSend(v13, "encodeBool:forKey:", self->_isOnlineImmobilizerToken, CFSTR("onlineImmobilizerToken"));
  objc_msgSend(v13, "encodeInteger:forKey:", self->_credentialState, CFSTR("credentialState"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_trackingRequest, CFSTR("trackingRequest"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_sharingSessionIdentifier, CFSTR("sharingSessionIdentifier"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_originatorIDSHandle, CFSTR("originatorIDSHandle"));
  objc_msgSend(v13, "encodeInteger:forKey:", self->_allSupportedRadioTechnologies, CFSTR("allSupportedRadioTechnologies"));
  objc_msgSend(v13, "encodeInteger:forKey:", self->_supportedRadioTechnologies, CFSTR("supportedRadioTechnologies"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_transactionKeyCertificateChain, CFSTR("transactionKeyCertificateChain"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_transactionKey, CFSTR("transactionKey"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_appletIdentifier, CFSTR("appletIdentifier"));
  objc_msgSend(v13, "encodeInteger:forKey:", self->_credentialType, CFSTR("paymentNetwork"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_readerIdentifier, CFSTR("readerIdentifier"));
  PKAppletSubcredentialCarKeyVehicleVersionToString(self->_carKeyVehicleVersion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("vehicleVersion"));

  PKAppletSubcredentialCarKeyServerVersionToString(self->_carKeyServerVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("serverVersion"));

  keyClass = self->_keyClass;
  v8 = CFSTR("private");
  if (keyClass != 1)
    v8 = 0;
  if (keyClass == 2)
    v9 = CFSTR("fleet");
  else
    v9 = v8;
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("keyClass"));
  credentialAuthorityType = self->_credentialAuthorityType;
  v11 = CFSTR("secure-element");
  if (credentialAuthorityType != 1)
    v11 = 0;
  if (credentialAuthorityType == 2)
    v12 = CFSTR("server");
  else
    v12 = v11;
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("credentialAuthority"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_isoFormat, CFSTR("isoFormat"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_aliroGroupResolvingKeys, CFSTR("aliroGroupResolvingKeys"));

}

- (PKAppletSubcredential)initWithCoder:(id)a3
{
  id v4;
  PKAppletSubcredential *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  PKPassEntitlement *entitlement;
  uint64_t v10;
  PKAppletSubcredentialSharingConfirguration *sharingConfiguration;
  uint64_t v12;
  NSString *invitationIdentifier;
  uint64_t v14;
  NSString *partnerIdentifier;
  uint64_t v16;
  NSString *brandIdentifier;
  uint64_t v18;
  NSString *pairedReaderIdentifier;
  uint64_t v20;
  NSString *endpointIdentifier;
  uint64_t v22;
  PKSubcredentialEncryptedContainer *trackingRequest;
  uint64_t v24;
  NSUUID *sharingSessionIdentifier;
  uint64_t v26;
  NSString *originatorIDSHandle;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *transactionKeyCertificateChain;
  uint64_t v33;
  NSData *transactionKey;
  uint64_t v35;
  NSString *appletIdentifier;
  uint64_t v37;
  NSData *readerIdentifier;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSString *isoFormat;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSSet *aliroGroupResolvingKeys;

  v4 = a3;
  v5 = -[PKAppletSubcredential init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entitlement"));
    v8 = objc_claimAutoreleasedReturnValue();
    entitlement = v5->_entitlement;
    v5->_entitlement = (PKPassEntitlement *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharing"));
    v10 = objc_claimAutoreleasedReturnValue();
    sharingConfiguration = v5->_sharingConfiguration;
    v5->_sharingConfiguration = (PKAppletSubcredentialSharingConfirguration *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitationIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    invitationIdentifier = v5->_invitationIdentifier;
    v5->_invitationIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partnerIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    partnerIdentifier = v5->_partnerIdentifier;
    v5->_partnerIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brandIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    brandIdentifier = v5->_brandIdentifier;
    v5->_brandIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairedReaderIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    pairedReaderIdentifier = v5->_pairedReaderIdentifier;
    v5->_pairedReaderIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpointIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    endpointIdentifier = v5->_endpointIdentifier;
    v5->_endpointIdentifier = (NSString *)v20;

    v5->_isOnlineImmobilizerToken = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onlineImmobilizerToken"));
    v5->_credentialState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("credentialState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingRequest"));
    v22 = objc_claimAutoreleasedReturnValue();
    trackingRequest = v5->_trackingRequest;
    v5->_trackingRequest = (PKSubcredentialEncryptedContainer *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingSessionIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    sharingSessionIdentifier = v5->_sharingSessionIdentifier;
    v5->_sharingSessionIdentifier = (NSUUID *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatorIDSHandle"));
    v26 = objc_claimAutoreleasedReturnValue();
    originatorIDSHandle = v5->_originatorIDSHandle;
    v5->_originatorIDSHandle = (NSString *)v26;

    v5->_allSupportedRadioTechnologies = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("allSupportedRadioTechnologies"));
    v5->_supportedRadioTechnologies = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supportedRadioTechnologies"));
    v28 = objc_alloc(MEMORY[0x1E0C99E60]);
    v29 = objc_opt_class();
    v30 = (void *)objc_msgSend(v28, "initWithObjects:", v29, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("transactionKeyCertificateChain"));
    v31 = objc_claimAutoreleasedReturnValue();
    transactionKeyCertificateChain = v5->_transactionKeyCertificateChain;
    v5->_transactionKeyCertificateChain = (NSArray *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionKey"));
    v33 = objc_claimAutoreleasedReturnValue();
    transactionKey = v5->_transactionKey;
    v5->_transactionKey = (NSData *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletIdentifier"));
    v35 = objc_claimAutoreleasedReturnValue();
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v35;

    v5->_credentialType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentNetwork"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerIdentifier"));
    v37 = objc_claimAutoreleasedReturnValue();
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicleVersion"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_carKeyVehicleVersion = PKAppletSubcredentialCarKeyVehicleVersionFromString(v39);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverVersion"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_carKeyServerVersion = PKAppletSubcredentialCarKeyServerVersionFromString(v40);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyClass"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_keyClass = PKAppletSubcredentialKeyClassFromString(v41);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialAuthority"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_credentialAuthorityType = PKAppletSubcredentialCredentialAuthorityTypeFromString(v42);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isoFormat"));
    v43 = objc_claimAutoreleasedReturnValue();
    isoFormat = v5->_isoFormat;
    v5->_isoFormat = (NSString *)v43;

    v45 = (void *)MEMORY[0x1E0C99E60];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("aliroGroupResolvingKeys"));
    v48 = objc_claimAutoreleasedReturnValue();
    aliroGroupResolvingKeys = v5->_aliroGroupResolvingKeys;
    v5->_aliroGroupResolvingKeys = (NSSet *)v48;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  int64_t credentialType;
  NSUUID *sharingSessionIdentifier;
  NSData *readerIdentifier;
  NSString *appletIdentifier;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  unint64_t keyClass;
  unint64_t credentialAuthorityType;
  const __CFString *v18;
  void *v19;
  NSString *brandIdentifier;
  NSString *originatorIDSHandle;
  PKAppletSubcredentialSharingConfirguration *sharingConfiguration;
  NSString *endpointIdentifier;
  _BOOL8 isOnlineImmobilizerToken;
  PKPassEntitlement *entitlement;
  NSString *invitationIdentifier;
  NSString *pairedReaderIdentifier;
  NSString *partnerIdentifier;
  unint64_t credentialState;
  __int128 v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;

  -[NSSet allObjects](self->_aliroGroupResolvingKeys, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v35 = v3;
  if (v4 < 4)
  {
    objc_msgSend(v3, "pk_arrayByApplyingBlock:", &__block_literal_global_89_1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("..%lu keys.."), v4);
  }
  v33 = (void *)MEMORY[0x1E0CB3940];
  v32 = objc_opt_class();
  v31 = *(_OWORD *)&self->_identifier;
  partnerIdentifier = self->_partnerIdentifier;
  credentialState = self->_credentialState;
  isOnlineImmobilizerToken = self->_isOnlineImmobilizerToken;
  invitationIdentifier = self->_invitationIdentifier;
  pairedReaderIdentifier = self->_pairedReaderIdentifier;
  credentialType = self->_credentialType;
  sharingConfiguration = self->_sharingConfiguration;
  sharingSessionIdentifier = self->_sharingSessionIdentifier;
  originatorIDSHandle = self->_originatorIDSHandle;
  endpointIdentifier = self->_endpointIdentifier;
  entitlement = self->_entitlement;
  readerIdentifier = self->_readerIdentifier;
  appletIdentifier = self->_appletIdentifier;
  brandIdentifier = self->_brandIdentifier;
  PKRadioTechnologiesToString(self->_supportedRadioTechnologies);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKRadioTechnologiesToString(self->_allSupportedRadioTechnologies);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKAppletSubcredentialCarKeyVehicleVersionToString(self->_carKeyVehicleVersion);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKAppletSubcredentialCarKeyServerVersionToString(self->_carKeyServerVersion);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = CFSTR("private");
  keyClass = self->_keyClass;
  credentialAuthorityType = self->_credentialAuthorityType;
  if (keyClass != 1)
    v15 = 0;
  if (keyClass == 2)
    v15 = CFSTR("fleet");
  v18 = CFSTR("secure-element");
  if (credentialAuthorityType != 1)
    v18 = 0;
  if (credentialAuthorityType == 2)
    v18 = CFSTR("server");
  objc_msgSend(v33, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@; state %ld (%ld); entitlement: %@; invitationIdentifier: %@; partnerIdentifier: %@; pairedReaderIdentifier: %@; brandIdentifier: %@; endpointIdentifier: %@; isOnlineImmobilizerToken: %d; sharing config: %@; shared info: %@ (%@); appletIdentifier: %@; paymentNetwork: %lu; readerIdentifier: %@; key supports: %@; vehicle supports: %@; vehicle version: %@; server version: %@; key class: %@; CA type: %@; aliroGroupResolvingKeys: [%@];>"),
    v32,
    self,
    v31,
    credentialState,
    entitlement,
    invitationIdentifier,
    partnerIdentifier,
    pairedReaderIdentifier,
    brandIdentifier,
    endpointIdentifier,
    isOnlineImmobilizerToken,
    sharingConfiguration,
    originatorIDSHandle,
    sharingSessionIdentifier,
    appletIdentifier,
    credentialType,
    readerIdentifier,
    v10,
    v11,
    v12,
    v13,
    v15,
    v18,
    v34);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __36__PKAppletSubcredential_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hexEncoding");
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    v6 = (NSString *)v4[2];
    if (identifier && v6)
      v7 = -[NSString isEqual:](identifier, "isEqual:");
    else
      v7 = identifier == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (PKPassEntitlement)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(id)a3
{
  objc_storeStrong((id *)&self->_entitlement, a3);
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (PKAppletSubcredentialSharingConfirguration)sharingConfiguration
{
  return self->_sharingConfiguration;
}

- (void)setSharingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_sharingConfiguration, a3);
}

- (NSString)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (void)setInvitationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)partnerIdentifier
{
  return self->_partnerIdentifier;
}

- (void)setPartnerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setPairedReaderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)brandIdentifier
{
  return self->_brandIdentifier;
}

- (void)setBrandIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isOnlineImmobilizerToken
{
  return self->_isOnlineImmobilizerToken;
}

- (void)setIsOnlineImmobilizerToken:(BOOL)a3
{
  self->_isOnlineImmobilizerToken = a3;
}

- (unint64_t)supportedRadioTechnologies
{
  return self->_supportedRadioTechnologies;
}

- (void)setSupportedRadioTechnologies:(unint64_t)a3
{
  self->_supportedRadioTechnologies = a3;
}

- (unint64_t)allSupportedRadioTechnologies
{
  return self->_allSupportedRadioTechnologies;
}

- (void)setAllSupportedRadioTechnologies:(unint64_t)a3
{
  self->_allSupportedRadioTechnologies = a3;
}

- (NSString)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (void)setEndpointIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSUUID)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (void)setSharingSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, a3);
}

- (NSString)originatorIDSHandle
{
  return self->_originatorIDSHandle;
}

- (void)setOriginatorIDSHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)isoFormat
{
  return self->_isoFormat;
}

- (void)setIsoFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSSet)aliroGroupResolvingKeys
{
  return self->_aliroGroupResolvingKeys;
}

- (void)setAliroGroupResolvingKeys:(id)a3
{
  objc_storeStrong((id *)&self->_aliroGroupResolvingKeys, a3);
}

- (unint64_t)credentialState
{
  return self->_credentialState;
}

- (void)setCredentialState:(unint64_t)a3
{
  self->_credentialState = a3;
}

- (PKSubcredentialEncryptedContainer)trackingRequest
{
  return self->_trackingRequest;
}

- (void)setTrackingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_trackingRequest, a3);
}

- (NSData)transactionKey
{
  return self->_transactionKey;
}

- (void)setTransactionKey:(id)a3
{
  objc_storeStrong((id *)&self->_transactionKey, a3);
}

- (NSArray)transactionKeyCertificateChain
{
  return self->_transactionKeyCertificateChain;
}

- (void)setTransactionKeyCertificateChain:(id)a3
{
  objc_storeStrong((id *)&self->_transactionKeyCertificateChain, a3);
}

- (void)setReaderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_readerIdentifier, a3);
}

- (NSString)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)setAppletIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appletIdentifier, a3);
}

- (unint64_t)carKeyVehicleVersion
{
  return self->_carKeyVehicleVersion;
}

- (void)setCarKeyVehicleVersion:(unint64_t)a3
{
  self->_carKeyVehicleVersion = a3;
}

- (unint64_t)carKeyServerVersion
{
  return self->_carKeyServerVersion;
}

- (void)setCarKeyServerVersion:(unint64_t)a3
{
  self->_carKeyServerVersion = a3;
}

- (unint64_t)keyClass
{
  return self->_keyClass;
}

- (void)setKeyClass:(unint64_t)a3
{
  self->_keyClass = a3;
}

- (unint64_t)credentialAuthorityType
{
  return self->_credentialAuthorityType;
}

- (void)setCredentialAuthorityType:(unint64_t)a3
{
  self->_credentialAuthorityType = a3;
}

@end
