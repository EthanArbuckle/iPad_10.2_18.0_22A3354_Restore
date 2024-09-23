@implementation PKAppletSubcredentialSharingInvitation

- (PKAppletSubcredentialSharingInvitation)initWithPartnerIdentifier:(id)a3 brandIdentifier:(id)a4 pairedReaderIdentifier:(id)a5 recipientName:(id)a6 entitlement:(unint64_t)a7 supportedRadioTechnologies:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  PKAppletSubcredentialSharingInvitation *v19;
  PKAppletSubcredentialSharingInvitation *v20;
  PKAppletSubcredentialSharingInvitation *v21;
  NSObject *v22;
  void *v23;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = v17;
  if (v14 && v16 && v17)
  {
    v27.receiver = self;
    v27.super_class = (Class)PKAppletSubcredentialSharingInvitation;
    v19 = -[PKAppletSubcredentialSharingInvitation init](&v27, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_partnerIdentifier, a3);
      objc_storeStrong((id *)&v20->_brandIdentifier, a4);
      objc_storeStrong((id *)&v20->_pairedReaderIdentifier, a5);
      objc_storeStrong((id *)&v20->_recipientName, a6);
      v20->_entitlement = a7;
      v20->_supportedRadioTechnologies = a8;
      v20->_type = 0;
    }
    self = v20;
    v21 = self;
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v23;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Invalid parameters in %@", buf, 0xCu);

    }
    v21 = 0;
  }

  return v21;
}

- (PKAppletSubcredentialSharingInvitation)initWithIdentifier:(id)a3 sharingSessionIdentifier:(id)a4 originatorIDSHandle:(id)a5 invitationData:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  PKProtobufAppletSubcredentialSharingInvitation *v16;
  PKAppletSubcredentialSharingInvitation *v17;
  void **p_sharingSessionIdentifier;
  NSString *v19;
  NSString *partnerIdentifier;
  NSString *v21;
  NSString *brandIdentifier;
  NSString *v23;
  NSString *pairedReaderIdentifier;
  NSString *v25;
  NSString *recipientName;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSString *v31;
  NSString *issuer;
  NSString *v33;
  NSString *deviceModel;
  unint64_t v35;
  NSObject *v36;
  const char *v37;
  NSObject *p_super;
  PKAppletSubcredentialSharingInvitation *v39;
  objc_super v41;
  uint8_t buf[4];
  PKProtobufAppletSubcredentialSharingInvitation *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v12)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v16 = (PKProtobufAppletSubcredentialSharingInvitation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v16->super.super, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v36 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = (PKProtobufAppletSubcredentialSharingInvitation *)v36;
      v37 = "Invalid parameters in %@ - bad identifier";
      p_super = &v16->super.super;
      goto LABEL_25;
    }
LABEL_27:
    v39 = 0;
    goto LABEL_28;
  }
  v16 = -[PKProtobufAppletSubcredentialSharingInvitation initWithData:]([PKProtobufAppletSubcredentialSharingInvitation alloc], "initWithData:", v15);
  if (!v16)
    goto LABEL_27;
  v41.receiver = self;
  v41.super_class = (Class)PKAppletSubcredentialSharingInvitation;
  v17 = -[PKAppletSubcredentialSharingInvitation init](&v41, sel_init);
  self = v17;
  if (v17)
  {
    p_sharingSessionIdentifier = (void **)&v17->_sharingSessionIdentifier;
    objc_storeStrong((id *)&v17->_sharingSessionIdentifier, a4);
    objc_storeStrong((id *)&self->_originatorIDSHandle, a5);
    -[PKProtobufAppletSubcredentialSharingInvitation version](v16, "version");
    objc_storeStrong((id *)&self->_identifier, a3);
    -[PKProtobufAppletSubcredentialSharingInvitation partnerIdentifier](v16, "partnerIdentifier");
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    partnerIdentifier = self->_partnerIdentifier;
    self->_partnerIdentifier = v19;

    -[PKProtobufAppletSubcredentialSharingInvitation brandIdentifier](v16, "brandIdentifier");
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    brandIdentifier = self->_brandIdentifier;
    self->_brandIdentifier = v21;

    -[PKProtobufAppletSubcredentialSharingInvitation pairedReaderIdentifier](v16, "pairedReaderIdentifier");
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    pairedReaderIdentifier = self->_pairedReaderIdentifier;
    self->_pairedReaderIdentifier = v23;

    -[PKProtobufAppletSubcredentialSharingInvitation recipientName](v16, "recipientName");
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    recipientName = self->_recipientName;
    self->_recipientName = v25;

    if (-[PKProtobufAppletSubcredentialSharingInvitation hasSharingSessionIdentifier](v16, "hasSharingSessionIdentifier"))
    {
      -[PKProtobufAppletSubcredentialSharingInvitation sharingSessionIdentifier](v16, "sharingSessionIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "length") == 16)
      {
        v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v27), "bytes"));
        v29 = *p_sharingSessionIdentifier;
        *p_sharingSessionIdentifier = (void *)v28;

      }
      if (!*p_sharingSessionIdentifier)
      {
        PKLogFacilityTypeGetObject(0x16uLL);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v30, OS_LOG_TYPE_DEFAULT, "Received malformed sharing session identifier on invitation!", buf, 2u);
        }

      }
    }
    self->_entitlement = -[PKProtobufAppletSubcredentialSharingInvitation entitlement](v16, "entitlement");
    self->_forWatch = -[PKProtobufAppletSubcredentialSharingInvitation deviceType](v16, "deviceType") == 1;
    -[PKProtobufAppletSubcredentialSharingInvitation issuer](v16, "issuer");
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    issuer = self->_issuer;
    self->_issuer = v31;

    -[PKProtobufAppletSubcredentialSharingInvitation deviceModel](v16, "deviceModel");
    v33 = (NSString *)objc_claimAutoreleasedReturnValue();
    deviceModel = self->_deviceModel;
    self->_deviceModel = v33;

    if (-[PKProtobufAppletSubcredentialSharingInvitation supportedRadioTechnologies](v16, "supportedRadioTechnologies"))
      v35 = -[PKProtobufAppletSubcredentialSharingInvitation supportedRadioTechnologies](v16, "supportedRadioTechnologies");
    else
      v35 = 1;
    self->_supportedRadioTechnologies = v35;
    if (self->_partnerIdentifier && self->_pairedReaderIdentifier && self->_issuer && self->_deviceModel)
    {
      self->_type = 0;
      goto LABEL_22;
    }
    PKLogFacilityTypeGetObject(0x16uLL);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    *(_DWORD *)buf = 138412290;
    v43 = v16;
    v37 = "Invalid invitation data to deserialize the invitation from: %@";
    p_super = v36;
LABEL_25:
    _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, v37, buf, 0xCu);
LABEL_26:

    goto LABEL_27;
  }
LABEL_22:
  self = self;
  v39 = self;
LABEL_28:

  return v39;
}

+ (id)invitationFromShare:(id)a3 entitlement:(id)a4 withCredential:(id)a5 pass:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v12, "partnerIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pairedReaderIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recipientNickname");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (!v14)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_DWORD *)buf = 138412290;
    v41 = v10;
    v34 = "Invalid state of credential (%@) to create invitation from: missing partnerIdentifier";
LABEL_19:
    _os_log_impl(&dword_18FC92000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);
    goto LABEL_20;
  }
  if (!v15)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_DWORD *)buf = 138412290;
    v41 = v10;
    v34 = "Invalid state of credential (%@) to create invitation from: missing pairedReaderIdentifier";
    goto LABEL_19;
  }
  if (!v16)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_DWORD *)buf = 138412290;
    v41 = v10;
    v34 = "Invalid state of shared credential (%@) to create invitation from: missing recipientName";
    goto LABEL_19;
  }
  if (!v11)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v10;
      v34 = "Invalid state of shared credential (%@) to create invitation from: missing entitlement";
      goto LABEL_19;
    }
LABEL_20:

    v21 = 0;
    goto LABEL_21;
  }
  v18 = objc_alloc((Class)a1);
  objc_msgSend(v12, "brandIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v11;
  objc_msgSend(v11, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (_QWORD *)objc_msgSend(v18, "initWithPartnerIdentifier:brandIdentifier:pairedReaderIdentifier:recipientName:entitlement:supportedRadioTechnologies:", v14, v19, v15, v17, objc_msgSend(v20, "unsignedIntegerValue"), objc_msgSend(v12, "supportedRadioTechnologies"));

  objc_msgSend(v10, "uuidIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSharingSessionIdentifier:", v22);

  objc_msgSend(v13, "organizationName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v26 = objc_msgSend(v24, "length");
    v27 = objc_msgSend(v23, "length");
    v28 = v23;
    if (v26 > v27 + 1)
    {
      v29 = v27;
      v37 = v27 + 1;
      v38 = v28;
      if (objc_msgSend(v25, "hasPrefix:"))
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "characterIsMember:", objc_msgSend(v25, "characterAtIndex:", v29));

        if (v31)
        {
          objc_msgSend(v25, "substringFromIndex:", v37);
          v32 = objc_claimAutoreleasedReturnValue();

          v25 = (void *)v32;
        }
      }
      v23 = v38;
    }
  }
  objc_msgSend(v13, "organizationName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setIssuer:", v36);

  objc_msgSend(v21, "setDeviceModel:", v25);
  v21[13] = 0;

  v11 = v39;
LABEL_21:

  return v21;
}

- (PKAppletSubcredentialSharingInvitation)initWithCrossPlatformInvitation:(id)a3
{
  id v5;
  PKAppletSubcredentialSharingInvitation *v6;
  PKAppletSubcredentialSharingInvitation *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSString *deviceModel;
  uint64_t v12;
  NSString *issuer;
  uint64_t v14;
  NSString *pairedReaderIdentifier;
  uint64_t v16;
  NSString *brandIdentifier;
  uint64_t v18;
  NSString *partnerIdentifier;
  void *v20;
  uint64_t v21;
  NSUUID *sharingSessionIdentifier;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKAppletSubcredentialSharingInvitation;
  v6 = -[PKAppletSubcredentialSharingInvitation init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_msgSend(v5, "shareIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    objc_msgSend(v5, "vehicleModel");
    v10 = objc_claimAutoreleasedReturnValue();
    deviceModel = v7->_deviceModel;
    v7->_deviceModel = (NSString *)v10;

    objc_msgSend(v5, "vehicleIssuer");
    v12 = objc_claimAutoreleasedReturnValue();
    issuer = v7->_issuer;
    v7->_issuer = (NSString *)v12;

    v7->_supportedRadioTechnologies = objc_msgSend(v5, "radioTechnology");
    objc_msgSend(v5, "readerIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    pairedReaderIdentifier = v7->_pairedReaderIdentifier;
    v7->_pairedReaderIdentifier = (NSString *)v14;

    objc_msgSend(v5, "brandIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    brandIdentifier = v7->_brandIdentifier;
    v7->_brandIdentifier = (NSString *)v16;

    objc_msgSend(v5, "partnerIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    partnerIdentifier = v7->_partnerIdentifier;
    v7->_partnerIdentifier = (NSString *)v18;

    objc_msgSend(v5, "shareSessionIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v20);
      sharingSessionIdentifier = v7->_sharingSessionIdentifier;
      v7->_sharingSessionIdentifier = (NSUUID *)v21;

    }
    objc_storeStrong((id *)&v7->_originalInvitationMessage, a3);

  }
  return v7;
}

- (BOOL)isThirdPartyCrossPlatformInvitation
{
  void *v2;
  BOOL v3;

  if (self->_type != 1)
    return 0;
  -[PKSharingCarKeyInvitation proprietaryData](self->_originalInvitationMessage, "proprietaryData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)dataRepresentation
{
  PKProtobufAppletSubcredentialSharingInvitation *v3;
  NSUUID *sharingSessionIdentifier;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PKProtobufAppletSubcredentialSharingInvitation);
  -[PKProtobufAppletSubcredentialSharingInvitation setVersion:](v3, "setVersion:", 0);
  if (self->_identifier)
    -[PKProtobufAppletSubcredentialSharingInvitation setIdentifier:](v3, "setIdentifier:");
  if (self->_partnerIdentifier)
    -[PKProtobufAppletSubcredentialSharingInvitation setPartnerIdentifier:](v3, "setPartnerIdentifier:");
  if (self->_brandIdentifier)
    -[PKProtobufAppletSubcredentialSharingInvitation setBrandIdentifier:](v3, "setBrandIdentifier:");
  if (self->_pairedReaderIdentifier)
    -[PKProtobufAppletSubcredentialSharingInvitation setPairedReaderIdentifier:](v3, "setPairedReaderIdentifier:");
  if (self->_recipientName)
    -[PKProtobufAppletSubcredentialSharingInvitation setRecipientName:](v3, "setRecipientName:");
  -[PKProtobufAppletSubcredentialSharingInvitation setEntitlement:](v3, "setEntitlement:", LODWORD(self->_entitlement));
  sharingSessionIdentifier = self->_sharingSessionIdentifier;
  if (sharingSessionIdentifier)
  {
    v8[0] = 0;
    v8[1] = 0;
    -[NSUUID getUUIDBytes:](sharingSessionIdentifier, "getUUIDBytes:", v8);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, 16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufAppletSubcredentialSharingInvitation setSharingSessionIdentifier:](v3, "setSharingSessionIdentifier:", v5);

  }
  -[PKProtobufAppletSubcredentialSharingInvitation setDeviceType:](v3, "setDeviceType:", self->_forWatch);
  if (self->_deviceModel)
    -[PKProtobufAppletSubcredentialSharingInvitation setDeviceModel:](v3, "setDeviceModel:");
  if (self->_issuer)
    -[PKProtobufAppletSubcredentialSharingInvitation setIssuer:](v3, "setIssuer:");
  if (self->_supportedRadioTechnologies)
    -[PKProtobufAppletSubcredentialSharingInvitation setSupportedRadioTechnologies:](v3, "setSupportedRadioTechnologies:");
  -[PKProtobufAppletSubcredentialSharingInvitation data](v3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sharingConfigurationRepresentation
{
  uint64_t v3;
  id v4;
  unint64_t entitlement;
  NSString *recipientName;
  void *v7;
  void *v8;

  if (self->_forWatch)
    v3 = 2;
  else
    v3 = 1;
  v4 = objc_alloc(MEMORY[0x1E0D1D380]);
  entitlement = self->_entitlement;
  recipientName = self->_recipientName;
  -[PKAppletSubcredentialSharingInvitation dataRepresentation](self, "dataRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithProfile:displayName:metaData:targetDeviceType:", entitlement, recipientName, v7, v3);

  return v8;
}

- (id)invitationRequestRepresentation
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  __int16 v7;

  if (!self->_originatorIDSHandle)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v7 = 0;
    v4 = "Missing originator IDS handle while creating invitation request";
    v5 = (uint8_t *)&v7;
    goto LABEL_8;
  }
  if (self->_sharingSessionIdentifier)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D378]), "initWithSharingSessionIdentifier:ownerIdsIdentifier:", self->_sharingSessionIdentifier, self->_originatorIDSHandle);
  PKLogFacilityTypeGetObject(0x16uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 0;
    v4 = "Missing session handle while creating invitation request";
    v5 = (uint8_t *)&v6;
LABEL_8:
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
  }
LABEL_9:

  return 0;
}

- (BOOL)isSameInvitationAsInvitation:(id)a3
{
  id v4;
  void *v5;
  NSString *identifier;
  void *v7;
  int v8;
  NSString *pairedReaderIdentifier;
  void *v10;
  _BOOL4 v11;
  NSUUID *sharingSessionIdentifier;
  void *v13;

  v4 = a3;
  v5 = v4;
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = -[NSString isEqualToString:](identifier, "isEqualToString:", v7);

  }
  else
  {
    pairedReaderIdentifier = self->_pairedReaderIdentifier;
    if (pairedReaderIdentifier
      && (objc_msgSend(v4, "pairedReaderIdentifier"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = -[NSString isEqualToString:](pairedReaderIdentifier, "isEqualToString:", v10),
          v10,
          !v11))
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      sharingSessionIdentifier = self->_sharingSessionIdentifier;
      if (!sharingSessionIdentifier
        || (objc_msgSend(v5, "sharingSessionIdentifier"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = -[NSUUID isEqual:](sharingSessionIdentifier, "isEqual:", v13),
            v13,
            v8))
      {
        LOBYTE(v8) = 1;
      }
    }
  }

  return v8;
}

- (BOOL)canBeSent
{
  return self->_partnerIdentifier
      && self->_pairedReaderIdentifier
      && self->_recipientName
      && self->_issuer
      && self->_deviceModel != 0;
}

- (id)addCarKeyPassConfiguration
{
  PKAddCarKeyPassConfiguration *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = objc_alloc_init(PKAddCarKeyPassConfiguration);
  -[PKAddCarKeyPassConfiguration setSupportedRadioTechnologies:](v3, "setSupportedRadioTechnologies:", self->_supportedRadioTechnologies);
  v4 = self->_brandIdentifier;
  -[PKAppletSubcredentialSharingInvitation manufacturerIdentifier](self, "manufacturerIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = (uint64_t)v4;
  else
    v7 = v5;
  -[PKAddSecureElementPassConfiguration setIssuerIdentifier:](v3, "setIssuerIdentifier:", v7);

  -[PKAddCarKeyPassConfiguration setManufacturerIdentifier:](v3, "setManufacturerIdentifier:", v6);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKAppletSubcredentialSharingInvitation *v4;
  PKAppletSubcredentialSharingInvitation *v5;
  BOOL v6;

  v4 = (PKAppletSubcredentialSharingInvitation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAppletSubcredentialSharingInvitation isEqualToInvitation:](self, "isEqualToInvitation:", v5);

  return v6;
}

- (BOOL)isEqualToInvitation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[PKAppletSubcredentialSharingInvitation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v6)
    v7 = objc_msgSend(v5, "isEqual:", v6);
  else
    v7 = v5 == v6;

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKAppletSubcredentialSharingInvitation identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") + 527;

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAppletSubcredentialSharingInvitation identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("identifier: '%@'; "), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR("partner ID: '%@'; "), self->_partnerIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("brand ID: '%@'; "), self->_brandIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("reader ID: '%@'; "), self->_pairedReaderIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("session ID: '%@'; "), self->_sharingSessionIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("recipientName: '%@'; "), self->_recipientName);
  objc_msgSend(v6, "appendFormat:", CFSTR("issuer: '%@'; "), self->_issuer);
  objc_msgSend(v6, "appendFormat:", CFSTR("model: '%@'; "), self->_deviceModel);
  objc_msgSend(v6, "appendFormat:", CFSTR("managementEnabled: '%lu'; "), self->_supportedRadioTechnologies);
  objc_msgSend(v6, "appendFormat:", CFSTR("type: '%lu'; "), self->_type);
  objc_msgSend(v6, "appendFormat:", CFSTR("originalInvitationMessage: '%@'; "), self->_originalInvitationMessage);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_partnerIdentifier, CFSTR("partnerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_brandIdentifier, CFSTR("brandIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pairedReaderIdentifier, CFSTR("pairedReaderIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientName, CFSTR("recipientName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharingSessionIdentifier, CFSTR("sharingSessionIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_entitlement, CFSTR("entitlement"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_forWatch, CFSTR("forWatch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_issuer, CFSTR("issuer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceModel, CFSTR("deviceModel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatorIDSHandle, CFSTR("originatorIDSHandle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_supportedRadioTechnologies, CFSTR("supportedRadioTechnologies"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalInvitationMessage, CFSTR("invitationMessageIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activationCode, CFSTR("activationCode"));

}

- (PKAppletSubcredentialSharingInvitation)initWithCoder:(id)a3
{
  id v4;
  PKAppletSubcredentialSharingInvitation *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *partnerIdentifier;
  uint64_t v10;
  NSString *brandIdentifier;
  uint64_t v12;
  NSString *pairedReaderIdentifier;
  uint64_t v14;
  NSString *recipientName;
  uint64_t v16;
  NSUUID *sharingSessionIdentifier;
  uint64_t v18;
  NSString *issuer;
  uint64_t v20;
  NSString *deviceModel;
  uint64_t v22;
  NSString *originatorIDSHandle;
  uint64_t v24;
  PKSharingCarKeyInvitation *originalInvitationMessage;
  uint64_t v26;
  NSString *activationCode;

  v4 = a3;
  v5 = -[PKAppletSubcredentialSharingInvitation init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partnerIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    partnerIdentifier = v5->_partnerIdentifier;
    v5->_partnerIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brandIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    brandIdentifier = v5->_brandIdentifier;
    v5->_brandIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairedReaderIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    pairedReaderIdentifier = v5->_pairedReaderIdentifier;
    v5->_pairedReaderIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientName"));
    v14 = objc_claimAutoreleasedReturnValue();
    recipientName = v5->_recipientName;
    v5->_recipientName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingSessionIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    sharingSessionIdentifier = v5->_sharingSessionIdentifier;
    v5->_sharingSessionIdentifier = (NSUUID *)v16;

    v5->_entitlement = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("entitlement"));
    v5->_forWatch = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("forWatch")) != 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("issuer"));
    v18 = objc_claimAutoreleasedReturnValue();
    issuer = v5->_issuer;
    v5->_issuer = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceModel"));
    v20 = objc_claimAutoreleasedReturnValue();
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatorIDSHandle"));
    v22 = objc_claimAutoreleasedReturnValue();
    originatorIDSHandle = v5->_originatorIDSHandle;
    v5->_originatorIDSHandle = (NSString *)v22;

    v5->_supportedRadioTechnologies = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supportedRadioTechnologies"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitationMessageIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    originalInvitationMessage = v5->_originalInvitationMessage;
    v5->_originalInvitationMessage = (PKSharingCarKeyInvitation *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activationCode"));
    v26 = objc_claimAutoreleasedReturnValue();
    activationCode = v5->_activationCode;
    v5->_activationCode = (NSString *)v26;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  objc_msgSend(v4, "setPartnerIdentifier:", self->_partnerIdentifier);
  objc_msgSend(v4, "setBrandIdentifier:", self->_brandIdentifier);
  objc_msgSend(v4, "setPairedReaderIdentifier:", self->_pairedReaderIdentifier);
  objc_msgSend(v4, "setRecipientName:", self->_recipientName);
  objc_msgSend(v4, "setSharingSessionIdentifier:", self->_sharingSessionIdentifier);
  objc_msgSend(v4, "setEntitlement:", self->_entitlement);
  objc_msgSend(v4, "setIssuer:", self->_issuer);
  objc_msgSend(v4, "setDeviceModel:", self->_deviceModel);
  objc_msgSend(v4, "setForWatch:", self->_forWatch);
  objc_msgSend(v4, "setOriginatorIDSHandle:", self->_originatorIDSHandle);
  objc_msgSend(v4, "setSupportedRadioTechnologies:", self->_supportedRadioTechnologies);
  v4[13] = self->_type;
  objc_msgSend(v4, "setOriginalInvitationMessage:", self->_originalInvitationMessage);
  return v4;
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

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)originatorIDSHandle
{
  return self->_originatorIDSHandle;
}

- (void)setOriginatorIDSHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)partnerIdentifier
{
  return self->_partnerIdentifier;
}

- (void)setPartnerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)brandIdentifier
{
  return self->_brandIdentifier;
}

- (void)setBrandIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)pairedReaderIdentifier
{
  return self->_pairedReaderIdentifier;
}

- (void)setPairedReaderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)recipientName
{
  return self->_recipientName;
}

- (void)setRecipientName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSUUID)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (void)setSharingSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, a3);
}

- (unint64_t)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(unint64_t)a3
{
  self->_entitlement = a3;
}

- (NSString)issuer
{
  return self->_issuer;
}

- (void)setIssuer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isForWatch
{
  return self->_forWatch;
}

- (void)setForWatch:(BOOL)a3
{
  self->_forWatch = a3;
}

- (unint64_t)supportedRadioTechnologies
{
  return self->_supportedRadioTechnologies;
}

- (void)setSupportedRadioTechnologies:(unint64_t)a3
{
  self->_supportedRadioTechnologies = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (PKSharingCarKeyInvitation)originalInvitationMessage
{
  return self->_originalInvitationMessage;
}

- (void)setOriginalInvitationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_originalInvitationMessage, a3);
}

- (NSString)activationCode
{
  return self->_activationCode;
}

- (void)setActivationCode:(id)a3
{
  objc_storeStrong((id *)&self->_activationCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationCode, 0);
  objc_storeStrong((id *)&self->_originalInvitationMessage, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_recipientName, 0);
  objc_storeStrong((id *)&self->_pairedReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_brandIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_originatorIDSHandle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
