@implementation PKPass

- (PKPaymentPass)paymentPass
{
  PKPass *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (PKPaymentPass *)v3;
}

- (void)setSharingURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (void)setSharingText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void)setRelevantDate:(id)a3
{
  id v4;
  PKPassRelevantDate *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[PKPassRelevantDate initWithRelevantDate:]([PKPassRelevantDate alloc], "initWithRelevantDate:", v4);
    v7[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPass setRelevantDates:](self, "setRelevantDates:", v6);

  }
  else
  {
    -[PKPass setRelevantDates:](self, "setRelevantDates:", MEMORY[0x1E0C9AA60]);
  }

}

- (void)setPassLibraryMachServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (BOOL)isVoided
{
  return self->_voided;
}

- (unint64_t)liveRenderType
{
  return self->_liveRenderType;
}

- (BOOL)liveRenderingRequiresEnablement
{
  return self->_liveRenderingRequiresEnablement;
}

- (void)setRevoked:(BOOL)a3
{
  self->_revoked = a3;
}

- (void)setRemotePass:(BOOL)a3
{
  self->_remotePass = a3;
}

- (void)setIsCloudKitSecurelyArchived:(BOOL)a3
{
  self->_isCloudKitSecurelyArchived = a3;
}

- (void)setIsCloudKitArchived:(BOOL)a3
{
  self->_isCloudKitArchived = a3;
}

- (BOOL)supportsCategoryVisualization
{
  return self->_supportsCategoryVisualization;
}

- (void)setModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedDate, a3);
}

- (void)setIngestedDate:(id)a3
{
  objc_storeStrong((id *)&self->_ingestedDate, a3);
}

- (void)setCloudKitSecureMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitSecureMetadata, a3);
}

- (void)setCloudKitMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitMetadata, a3);
}

- (PKPass)initWithCoder:(id)a3
{
  id v4;
  PKPass *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString *passLibraryMachServiceName;
  uint64_t v14;
  NSString *deviceName;
  uint64_t v16;
  NSString *provisioningCredentialHash;
  uint64_t v18;
  NSString *passTypeIdentifier;
  uint64_t v20;
  NSString *teamID;
  uint64_t v22;
  NSString *serialNumber;
  uint64_t v24;
  NSNumber *sequenceCounter;
  uint64_t v26;
  NSString *organizationName;
  uint64_t v28;
  NSDate *expirationDate;
  uint64_t v30;
  NSDictionary *userInfo;
  uint64_t v32;
  NSString *groupingID;
  void *v34;
  uint64_t v35;
  NSArray *relevantDates;
  uint64_t v37;
  NSString *sharingText;
  uint64_t v39;
  NSURL *sharingURL;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSArray *embeddedLocations;
  void *v46;
  uint64_t v47;
  NSSet *embeddedBeacons;
  uint64_t v49;
  PKNFCPayload *nfcPayload;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  unsigned int v55;
  uint64_t v56;
  NSDate *ingestedDate;
  uint64_t v58;
  NSDate *modifiedDate;
  void *v60;
  uint64_t v61;
  NSSet *associatedPassTypeIdentifiers;
  uint64_t v63;
  NSURL *transferURL;
  uint64_t v65;
  NSURL *sellURL;
  uint64_t v67;
  NSURL *bagPolicyURL;
  uint64_t v69;
  NSURL *orderFoodURL;
  uint64_t v71;
  NSURL *transitInformationURL;
  uint64_t v73;
  NSURL *parkingInformationURL;
  uint64_t v75;
  NSURL *directionsInformationURL;
  uint64_t v77;
  NSURL *merchandiseURL;
  uint64_t v79;
  NSURL *accessibilityURL;
  uint64_t v81;
  NSURL *purchaseParkingURL;
  uint64_t v83;
  NSURL *partnerAddOnURL;
  uint64_t v85;
  NSURL *contactVenuePhoneNumber;
  uint64_t v87;
  NSURL *contactVenueEmail;
  uint64_t v89;
  NSURL *contactVenueWebsite;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *context;
  objc_super v98;

  v4 = a3;
  v98.receiver = self;
  v98.super_class = (Class)PKPass;
  v5 = -[PKObject initWithCoder:](&v98, sel_initWithCoder_, v4);
  if (v5)
  {
    context = (void *)MEMORY[0x19400CFE8]();
    v6 = objc_opt_class();
    v93 = objc_opt_class();
    v95 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v92 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("passLibraryMachServiceName"));
    v12 = objc_claimAutoreleasedReturnValue();
    passLibraryMachServiceName = v5->_passLibraryMachServiceName;
    v5->_passLibraryMachServiceName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("deviceName"));
    v14 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v14;

    v5->_remotePass = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("remotePass"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("provisioningCredentialHash"));
    v16 = objc_claimAutoreleasedReturnValue();
    provisioningCredentialHash = v5->_provisioningCredentialHash;
    v5->_provisioningCredentialHash = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("passTypeID"));
    v18 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("teamID"));
    v20 = objc_claimAutoreleasedReturnValue();
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("serialNumber"));
    v22 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("sequenceCounter"));
    v24 = objc_claimAutoreleasedReturnValue();
    sequenceCounter = v5->_sequenceCounter;
    v5->_sequenceCounter = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("organizationName"));
    v26 = objc_claimAutoreleasedReturnValue();
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("expirationDate"));
    v28 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v28;

    v5->_voided = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("voided"));
    v94 = v8;
    v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v95, v6, v7, v92, v10, v8, v11, 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:");
    v30 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("groupingID"));
    v32 = objc_claimAutoreleasedReturnValue();
    groupingID = v5->_groupingID;
    v5->_groupingID = (NSString *)v32;

    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v6, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("relevantDates"));
    v35 = objc_claimAutoreleasedReturnValue();
    relevantDates = v5->_relevantDates;
    v5->_relevantDates = (NSArray *)v35;

    v5->_sharingMethod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sharingMethod"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("sharingText"));
    v37 = objc_claimAutoreleasedReturnValue();
    sharingText = v5->_sharingText;
    v5->_sharingText = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("sharingURL"));
    v39 = objc_claimAutoreleasedReturnValue();
    sharingURL = v5->_sharingURL;
    v5->_sharingURL = (NSURL *)v39;

    v41 = (void *)MEMORY[0x19400CFE8]();
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v6, v93, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("embeddedLocations"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = objc_msgSend(v43, "copy");
    }
    else
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_7;
      v44 = objc_msgSend(v43, "pk_arrayCopy");
    }
    embeddedLocations = v5->_embeddedLocations;
    v5->_embeddedLocations = (NSArray *)v44;

LABEL_7:
    objc_autoreleasePoolPop(v41);
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v93, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v46, CFSTR("embeddedBeacons"));
    v47 = objc_claimAutoreleasedReturnValue();
    embeddedBeacons = v5->_embeddedBeacons;
    v5->_embeddedBeacons = (NSSet *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nfcPayload"));
    v49 = objc_claimAutoreleasedReturnValue();
    nfcPayload = v5->_nfcPayload;
    v5->_nfcPayload = (PKNFCPayload *)v49;

    v5->_hasStoredValue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasStoredValue"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("liveRenderType"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v51)
    {
      v53 = PKPassLiveRenderTypeFromString(v51);
      v5->_liveRenderType = v53;
      v5->_liveRenderedBackground = v53 != 0;
      if (v5->_liveRenderType == 2)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeKeyLiveRenderType"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_homeKeyLiveRenderType = PKPassHomeKeyLiveRenderTypeFromString(v54);

LABEL_12:
        v5->_supportsCategoryVisualization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsCategoryVisualization"));
        v5->_liveRenderingRequiresEnablement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("liveRenderingRequiresEnablement"));
        v5->_passType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("passType"));
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v94, CFSTR("ingestedDate"));
        v56 = objc_claimAutoreleasedReturnValue();
        ingestedDate = v5->_ingestedDate;
        v5->_ingestedDate = (NSDate *)v56;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v94, CFSTR("modifiedDate"));
        v58 = objc_claimAutoreleasedReturnValue();
        modifiedDate = v5->_modifiedDate;
        v5->_modifiedDate = (NSDate *)v58;

        v5->_revoked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("revoked"));
        v5->_muteReadyForUseNotification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("muteReadyForUseNotification"));
        v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v93, v7, 0);
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v60, CFSTR("associatedPassTypeIdentifiers"));
        v61 = objc_claimAutoreleasedReturnValue();
        associatedPassTypeIdentifiers = v5->_associatedPassTypeIdentifiers;
        v5->_associatedPassTypeIdentifiers = (NSSet *)v61;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("transferURL"));
        v63 = objc_claimAutoreleasedReturnValue();
        transferURL = v5->_transferURL;
        v5->_transferURL = (NSURL *)v63;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("sellURL"));
        v65 = objc_claimAutoreleasedReturnValue();
        sellURL = v5->_sellURL;
        v5->_sellURL = (NSURL *)v65;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("bagPolicyURL"));
        v67 = objc_claimAutoreleasedReturnValue();
        bagPolicyURL = v5->_bagPolicyURL;
        v5->_bagPolicyURL = (NSURL *)v67;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("orderFoodURL"));
        v69 = objc_claimAutoreleasedReturnValue();
        orderFoodURL = v5->_orderFoodURL;
        v5->_orderFoodURL = (NSURL *)v69;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("transitInformationURL"));
        v71 = objc_claimAutoreleasedReturnValue();
        transitInformationURL = v5->_transitInformationURL;
        v5->_transitInformationURL = (NSURL *)v71;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("parkingInformationURL"));
        v73 = objc_claimAutoreleasedReturnValue();
        parkingInformationURL = v5->_parkingInformationURL;
        v5->_parkingInformationURL = (NSURL *)v73;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("directionsInformationURL"));
        v75 = objc_claimAutoreleasedReturnValue();
        directionsInformationURL = v5->_directionsInformationURL;
        v5->_directionsInformationURL = (NSURL *)v75;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("merchandiseURL"));
        v77 = objc_claimAutoreleasedReturnValue();
        merchandiseURL = v5->_merchandiseURL;
        v5->_merchandiseURL = (NSURL *)v77;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("accessibilityURL"));
        v79 = objc_claimAutoreleasedReturnValue();
        accessibilityURL = v5->_accessibilityURL;
        v5->_accessibilityURL = (NSURL *)v79;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("purchaseParkingURL"));
        v81 = objc_claimAutoreleasedReturnValue();
        purchaseParkingURL = v5->_purchaseParkingURL;
        v5->_purchaseParkingURL = (NSURL *)v81;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("addOnURL"));
        v83 = objc_claimAutoreleasedReturnValue();
        partnerAddOnURL = v5->_partnerAddOnURL;
        v5->_partnerAddOnURL = (NSURL *)v83;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("contactVenuePhoneNumber"));
        v85 = objc_claimAutoreleasedReturnValue();
        contactVenuePhoneNumber = v5->_contactVenuePhoneNumber;
        v5->_contactVenuePhoneNumber = (NSURL *)v85;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("contactVenueEmail"));
        v87 = objc_claimAutoreleasedReturnValue();
        contactVenueEmail = v5->_contactVenueEmail;
        v5->_contactVenueEmail = (NSURL *)v87;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("contactVenueWebsite"));
        v89 = objc_claimAutoreleasedReturnValue();
        contactVenueWebsite = v5->_contactVenueWebsite;
        v5->_contactVenueWebsite = (NSURL *)v89;

        objc_autoreleasePoolPop(context);
        goto LABEL_13;
      }
    }
    else
    {
      v55 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("liveRendered"));
      v5->_liveRenderedBackground = v55;
      v5->_liveRenderType = v55;
    }
    v5->_homeKeyLiveRenderType = 0;
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (int64_t)style
{
  void *v2;
  int64_t v3;

  -[PKObject displayProfile](self, "displayProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "passStyle");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_ingestedDate, 0);
  objc_storeStrong((id *)&self->_cardholderInfoSectionTitle, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialHash, 0);
  objc_storeStrong((id *)&self->_contactVenueWebsite, 0);
  objc_storeStrong((id *)&self->_contactVenueEmail, 0);
  objc_storeStrong((id *)&self->_contactVenuePhoneNumber, 0);
  objc_storeStrong((id *)&self->_partnerAddOnURL, 0);
  objc_storeStrong((id *)&self->_purchaseParkingURL, 0);
  objc_storeStrong((id *)&self->_accessibilityURL, 0);
  objc_storeStrong((id *)&self->_merchandiseURL, 0);
  objc_storeStrong((id *)&self->_directionsInformationURL, 0);
  objc_storeStrong((id *)&self->_parkingInformationURL, 0);
  objc_storeStrong((id *)&self->_transitInformationURL, 0);
  objc_storeStrong((id *)&self->_orderFoodURL, 0);
  objc_storeStrong((id *)&self->_bagPolicyURL, 0);
  objc_storeStrong((id *)&self->_sellURL, 0);
  objc_storeStrong((id *)&self->_transferURL, 0);
  objc_storeStrong((id *)&self->_nfcPayload, 0);
  objc_storeStrong((id *)&self->_associatedPassTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_sharingText, 0);
  objc_storeStrong((id *)&self->_sharingURL, 0);
  objc_storeStrong((id *)&self->_localLocationsURL, 0);
  objc_storeStrong((id *)&self->_webLocationsURL, 0);
  objc_storeStrong((id *)&self->_embeddedBeacons, 0);
  objc_storeStrong((id *)&self->_groupingID, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_cloudKitSecureMetadata, 0);
  objc_storeStrong((id *)&self->_cloudKitMetadata, 0);
  objc_storeStrong((id *)&self->_sequenceCounter, 0);
  objc_storeStrong((id *)&self->_passLibraryMachServiceName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_relevantDates, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_embeddedLocations, 0);
  objc_storeStrong((id *)&self->_liveRenderedShaderSet, 0);
}

- (BOOL)linksToApp
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PKPass storeIdentifiers](self, "storeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[PKPass systemAppBundleIdentifiers](self, "systemAppBundleIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (NSArray)systemAppBundleIdentifiers
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemAppBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)storeIdentifiers
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)supportsIssuerBinding
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[PKPass passType](self, "passType"))
    return 0;
  -[PKPass nfcPayload](self, "nfcPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[PKPass issuerBindingInformation](self, "issuerBindingInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v3 = 1;
  }
  else
  {
    -[PKPass fidoProfile](self, "fidoProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v6 != 0;

  }
  return v3;
}

- (PKPassType)passType
{
  return self->_passType;
}

- (PKBarcode)barcode
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "barcode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKBarcode *)v3;
}

- (BOOL)hasValidNFCPayload
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;

  -[PKPass nfcPayload](self, "nfcPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !objc_msgSend(v2, "payloadState"))
  {
    objc_msgSend(v2, "encryptionPublicKeyData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v4 = 1;
    else
      v4 = PKNFCPassKeyOptional();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (PKNFCPayload)nfcPayload
{
  return self->_nfcPayload;
}

- (PKColor)frontFaceImageAverageColor
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[PKObject isImageSetLoaded:](self, "isImageSetLoaded:", 0)
    || !-[PKObject isImageSetLoaded:](self, "isImageSetLoaded:", 2))
  {
    -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "faceImageAverageColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeHolderImageAverageColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return (PKColor *)v5;
}

- (PKImage)frontFaceShadowImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceShadowImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKImage *)v3;
}

- (CGRect)cobrandLogoRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cobrandLogoRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)isExpired
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  -[PKPass expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4 < 0.0;

  return v5;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPass;
  v5 = -[PKObject encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  v6 = (void *)MEMORY[0x19400CFE8](v5);
  objc_msgSend(v4, "encodeObject:forKey:", self->_passLibraryMachServiceName, CFSTR("passLibraryMachServiceName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceName, CFSTR("deviceName"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_remotePass, CFSTR("remotePass"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_provisioningCredentialHash, CFSTR("provisioningCredentialHash"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_passTypeIdentifier, CFSTR("passTypeID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_teamID, CFSTR("teamID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_serialNumber, CFSTR("serialNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sequenceCounter, CFSTR("sequenceCounter"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_organizationName, CFSTR("organizationName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_voided, CFSTR("voided"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupingID, CFSTR("groupingID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_relevantDates, CFSTR("relevantDates"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_sharingMethod, CFSTR("sharingMethod"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharingText, CFSTR("sharingText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharingURL, CFSTR("sharingURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_embeddedLocations, CFSTR("embeddedLocations"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_embeddedBeacons, CFSTR("embeddedBeacons"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_nfcPayload, CFSTR("nfcPayload"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasStoredValue, CFSTR("hasStoredValue"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_liveRenderedBackground, CFSTR("liveRendered"));
  PKPassLiveRenderTypeToString(self->_liveRenderType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("liveRenderType"));

  if (self->_liveRenderType == 2)
  {
    PKPassHomeKeyLiveRenderTypeToString(self->_homeKeyLiveRenderType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("homeKeyLiveRenderType"));

  }
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsCategoryVisualization, CFSTR("supportsCategoryVisualization"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_liveRenderingRequiresEnablement, CFSTR("liveRenderingRequiresEnablement"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_passType, CFSTR("passType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_ingestedDate, CFSTR("ingestedDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_modifiedDate, CFSTR("modifiedDate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_revoked, CFSTR("revoked"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_associatedPassTypeIdentifiers, CFSTR("associatedPassTypeIdentifiers"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_muteReadyForUseNotification, CFSTR("muteReadyForUseNotification"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transferURL, CFSTR("transferURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sellURL, CFSTR("sellURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bagPolicyURL, CFSTR("bagPolicyURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_orderFoodURL, CFSTR("orderFoodURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitInformationURL, CFSTR("transitInformationURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_parkingInformationURL, CFSTR("parkingInformationURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_directionsInformationURL, CFSTR("directionsInformationURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_merchandiseURL, CFSTR("merchandiseURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accessibilityURL, CFSTR("accessibilityURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_purchaseParkingURL, CFSTR("purchaseParkingURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_partnerAddOnURL, CFSTR("addOnURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contactVenuePhoneNumber, CFSTR("contactVenuePhoneNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contactVenueEmail, CFSTR("contactVenueEmail"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contactVenueWebsite, CFSTR("contactVenueWebsite"));
  objc_autoreleasePoolPop(v6);

}

- (BOOL)isRevoked
{
  return self->_revoked;
}

- (NSString)logoText
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logoText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PKSecureElementPass)secureElementPass
{
  PKPass *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (PKSecureElementPass *)v3;
}

- (PKImage)frontFaceImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKImage *)v3;
}

- (PKImage)altImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "altImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKImage *)v3;
}

- (CGRect)thumbnailRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnailRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (PKPassLiveRenderedImageSet)liveRenderedImageSet
{
  return (PKPassLiveRenderedImageSet *)-[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 6);
}

- (PKPass)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  PKPass *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  PKPassRelevantDate *v31;
  PKPassRelevantDate *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  unint64_t v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  PKLocation *v53;
  PKLocation *v54;
  void *v55;
  NSObject *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  void *v66;
  void *v67;
  PKBeacon *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  id v76;
  void *v77;
  PKNFCPayload *v78;
  void *v79;
  uint64_t v80;
  unint64_t v81;
  id v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  void *v89;
  PKPass *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  id v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  PKPass *v147;
  void *v149;
  id v150;
  void *v151;
  void *v152;
  id v153;
  id v154;
  PKPass *v155;
  void *v156;
  objc_super v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  uint8_t v162[4];
  int v163;
  uint8_t buf[4];
  id v165;
  uint64_t v166;

  v166 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v157.receiver = self;
  v157.super_class = (Class)PKPass;
  v8 = -[PKObject initWithDictionary:bundle:](&v157, sel_initWithDictionary_bundle_, v6, v7);

  if (!v6 || !v8)
    goto LABEL_117;
  v153 = v7;
  +[PKDisplayProfile displayProfileOfType:withDictionary:bundle:](PKDisplayProfile, "displayProfileOfType:withDictionary:bundle:", 0, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue();
  -[PKObject setDisplayProfile:](v8, "setDisplayProfile:", v9);
  objc_msgSend(v6, "PKStringForKey:", CFSTR("passTypeIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setPassTypeIdentifier:](v8, "setPassTypeIdentifier:", v10);

  objc_msgSend(v6, "PKStringForKey:", CFSTR("serialNumber"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setSerialNumber:](v8, "setSerialNumber:", v11);

  objc_msgSend(v6, "PKNumberForKey:", CFSTR("sequenceCounter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setSequenceCounter:](v8, "setSequenceCounter:", v12);

  -[PKPass passTypeIdentifier](v8, "passTypeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass serialNumber](v8, "serialNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PKGeneratePassUniqueID(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKObject setUniqueID:](v8, "setUniqueID:", v15);

  objc_msgSend(v6, "PKStringForKey:", CFSTR("teamIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setTeamID:](v8, "setTeamID:", v16);

  objc_msgSend(v6, "PKStringForKey:", CFSTR("organizationName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setOrganizationName:](v8, "setOrganizationName:", v17);

  objc_msgSend(v6, "PKDateForKey:", CFSTR("expirationDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setExpirationDate:](v8, "setExpirationDate:", v18);

  -[PKPass setVoided:](v8, "setVoided:", objc_msgSend(v6, "PKBoolForKey:", CFSTR("voided")));
  v154 = v6;
  v19 = v6;
  v20 = 0x1E0C99000uLL;
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v19, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("relevantDates"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v155 = v8;
  v152 = (void *)v9;
  if (v22)
  {
    v160 = 0u;
    v161 = 0u;
    v158 = 0u;
    v159 = 0u;
    v24 = v22;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v158, buf, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v159;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v159 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v21, "count") >= 0xA)
          {
            PKLogFacilityTypeGetObject(0);
            v32 = (PKPassRelevantDate *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v32->super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v162 = 67109120;
              v163 = 10;
              _os_log_error_impl(&dword_18FC92000, &v32->super, OS_LOG_TYPE_ERROR, "Pass has more than %d dates. Capping.", v162, 8u);
            }
            v8 = v155;
            v20 = 0x1E0C99000;
            goto LABEL_20;
          }
          PKValidateRelevantDateDictionary(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v30)
          {
            v31 = -[PKPassRelevantDate initWithDictionary:]([PKPassRelevantDate alloc], "initWithDictionary:", v29);
            objc_msgSend(v21, "addObject:", v31);

          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v158, buf, 16);
        if (v26)
          continue;
        break;
      }
      v8 = v155;
      v20 = 0x1E0C99000;
    }
  }
  else
  {
    objc_msgSend(v19, "PKDateForKey:", CFSTR("relevantDate"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v32 = -[PKPassRelevantDate initWithRelevantDate:]([PKPassRelevantDate alloc], "initWithRelevantDate:", v24);
      objc_msgSend(v21, "addObject:", v32);
LABEL_20:

    }
  }

  if (objc_msgSend(v21, "count"))
    v33 = (void *)objc_msgSend(v21, "copy");
  else
    v33 = 0;

  -[PKPass setRelevantDates:](v8, "setRelevantDates:", v33);
  objc_msgSend(v19, "PKURLForKey:", CFSTR("webServiceURL"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKObject setWebServiceURL:](v8, "setWebServiceURL:", v34);

  objc_msgSend(v19, "PKStringForKey:", CFSTR("authenticationToken"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKObject setAuthenticationToken:](v8, "setAuthenticationToken:", v35);

  objc_msgSend(v19, "PKDictionaryForKey:", CFSTR("userInfo"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setUserInfo:](v8, "setUserInfo:", v36);

  objc_msgSend(v19, "PKSetForKey:", CFSTR("associatedPassTypeIdentifiers"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setAssociatedPassTypeIdentifiers:](v8, "setAssociatedPassTypeIdentifiers:", v37);

  -[PKPass setHasStoredValue:](v8, "setHasStoredValue:", objc_msgSend(v19, "PKBoolForKey:", CFSTR("hasStoredValue")));
  objc_msgSend(v19, "PKStringForKey:", CFSTR("liveRenderType"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v38;
  if (v38)
  {
    v39 = PKPassLiveRenderTypeFromString(v38);
    -[PKPass setLiveRenderType:](v8, "setLiveRenderType:", v39);
    v40 = v39 != 0;
  }
  else
  {
    v40 = objc_msgSend(v19, "PKBoolForKey:", CFSTR("liveRenderedBackground"));
    -[PKPass setLiveRenderType:](v8, "setLiveRenderType:", v40);
  }
  -[PKPass setLiveRenderedBackground:](v8, "setLiveRenderedBackground:", v40);
  if (v8->_liveRenderType == 2)
  {
    objc_msgSend(v19, "PKStringForKey:", CFSTR("homeKeyLiveType"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPass setHomeKeyLiveRenderType:](v8, "setHomeKeyLiveRenderType:", PKPassHomeKeyLiveRenderTypeFromString(v41));

  }
  else
  {
    -[PKPass setHomeKeyLiveRenderType:](v8, "setHomeKeyLiveRenderType:", 0);
  }
  -[PKPass setSupportsCategoryVisualization:](v8, "setSupportsCategoryVisualization:", objc_msgSend(v19, "PKBoolForKey:", CFSTR("supportsCategoryVisualization")));
  -[PKPass setLiveRenderingRequiresEnablement:](v8, "setLiveRenderingRequiresEnablement:", objc_msgSend(v19, "PKBoolForKey:", CFSTR("liveRenderingRequiresEnablement")));
  -[PKPass setMuteReadyForUseNotification:](v8, "setMuteReadyForUseNotification:", objc_msgSend(v19, "PKBoolForKey:", CFSTR("muteReadyForUseNotification")));
  v42 = (void *)MEMORY[0x19400CFE8](-[PKPass setSupportsLifecycleUpdates:](v8, "setSupportsLifecycleUpdates:", objc_msgSend(v19, "PKBoolForKey:", CFSTR("supportsLifecycleUpdates"))));
  v43 = v19;
  objc_msgSend(v43, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("locations"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
  {
    v46 = objc_msgSend(v44, "count");
    if (v46 >= 0x3E8)
    {
      if (PKDeveloperLoggingEnabled() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v165) = 1000;
        _os_log_error_impl(&dword_18FC92000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Pass has more than %d locations. Capping.", buf, 8u);
      }
      PKLogFacilityTypeGetObject(5uLL);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v165) = 1000;
        _os_log_impl(&dword_18FC92000, v47, OS_LOG_TYPE_DEFAULT, "Pass has more than %d locations. Capping.", buf, 8u);
      }

    }
    v156 = v42;
    if (v46 >= 0x3E8)
      v46 = 1000;
    v48 = (void *)objc_msgSend(objc_alloc(*(Class *)(v20 + 3560)), "initWithCapacity:", v46);
    if (v46)
    {
      v49 = 0;
      v50 = 0;
      do
      {
        objc_msgSend(v45, "objectAtIndexedSubscript:", v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        PKValidateLocationDictionary(v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          if (!v50)
            v50 = objc_alloc_init(MEMORY[0x1E0CB3788]);
          objc_msgSend(v50, "addIndex:", v49);
        }
        else
        {
          v53 = -[PKLocation initWithDictionary:]([PKLocation alloc], "initWithDictionary:", v51);
          if (v53)
          {
            v54 = v53;
            objc_msgSend(v48, "addObject:", v53);

          }
        }

        ++v49;
      }
      while (v46 != v49);
    }
    else
    {
      v50 = 0;
    }
    v42 = v156;
    if (objc_msgSend(v50, "count"))
    {
      if (PKDeveloperLoggingEnabled() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v165 = v50;
        _os_log_error_impl(&dword_18FC92000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Pass has invalid locations at indices %@. Ignoring.", buf, 0xCu);
      }
      PKLogFacilityTypeGetObject(5uLL);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v165 = v50;
        _os_log_impl(&dword_18FC92000, v56, OS_LOG_TYPE_DEFAULT, "Pass has invalid locations at indices %@. Ignoring.", buf, 0xCu);
      }

    }
    if (objc_msgSend(v48, "count"))
      v55 = (void *)objc_msgSend(v48, "copy");
    else
      v55 = 0;

    v8 = v155;
  }
  else
  {
    v55 = 0;
  }

  -[PKPass setEmbeddedLocationsArray:](v8, "setEmbeddedLocationsArray:", v55);
  objc_autoreleasePoolPop(v42);
  v57 = v43;
  objc_msgSend(v57, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("beacons"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v58)
  {
    v150 = v57;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v58, "count"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    v149 = v59;
    v61 = v59;
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v158, buf, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v159;
      while (2)
      {
        for (j = 0; j != v63; ++j)
        {
          if (*(_QWORD *)v159 != v64)
            objc_enumerationMutation(v61);
          v66 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * j);
          if ((unint64_t)objc_msgSend(v60, "count") >= 0xA)
          {
            PKLogFacilityTypeGetObject(0);
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v162 = 67109120;
              v163 = 10;
              _os_log_error_impl(&dword_18FC92000, v74, OS_LOG_TYPE_ERROR, "Pass has more than %d beacons. Capping.", v162, 8u);
            }

            goto LABEL_78;
          }
          PKValidateBeaconDictionary(v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v67)
          {
            v68 = objc_alloc_init(PKBeacon);
            objc_msgSend(v66, "PKUUIDForKey:", CFSTR("proximityUUID"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKBeacon setProximityUUID:](v68, "setProximityUUID:", v69);

            objc_msgSend(v66, "PKNumberForKey:", CFSTR("major"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKBeacon setMajor:](v68, "setMajor:", v70);

            objc_msgSend(v66, "PKNumberForKey:", CFSTR("minor"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKBeacon setMinor:](v68, "setMinor:", v71);

            objc_msgSend(v66, "PKStringForKey:", CFSTR("name"));
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKBeacon setName:](v68, "setName:", v72);

            objc_msgSend(v66, "PKStringForKey:", CFSTR("relevantText"));
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKBeacon setRelevantText:](v68, "setRelevantText:", v73);

            objc_msgSend(v60, "addObject:", v68);
          }
        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v158, buf, 16);
        if (v63)
          continue;
        break;
      }
    }
LABEL_78:

    v8 = v155;
    v59 = v149;
    v57 = v150;
  }
  else
  {
    v60 = 0;
  }
  if (objc_msgSend(v60, "count"))
    v75 = v60;
  else
    v75 = 0;
  v76 = v75;

  -[PKPass setEmbeddedBeacons:](v8, "setEmbeddedBeacons:", v76);
  objc_msgSend(v57, "objectForKey:", CFSTR("nfc"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77)
    v78 = -[PKNFCPayload initWithNFCDictionary:]([PKNFCPayload alloc], "initWithNFCDictionary:", v77);
  else
    v78 = 0;

  -[PKPass setNFCPayload:](v8, "setNFCPayload:", v78);
  -[PKPass passTypeIdentifier](v8, "passTypeIdentifier");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = PKPassTypeForPassTypeIdentifier(v79);

  -[PKPass setPassType:](v8, "setPassType:", v80);
  v81 = objc_msgSend(v152, "passStyle");
  v82 = v57;
  v83 = v82;
  if (v80 == 1)
  {
LABEL_96:
    objc_msgSend(v82, "PKStringForKey:", CFSTR("groupingIdentifier"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_97;
  }
  if (v81 > 0xC)
    goto LABEL_97;
  if (((1 << v81) & 0x10EB) == 0)
  {
    if (((1 << v81) & 0x314) == 0)
      goto LABEL_97;
    goto LABEL_96;
  }
  if (PKDeveloperLoggingEnabled() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18FC92000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "groupingIdentifier is only supported for boardingPass, eventTicket, and healthPass styles as well as PKPassTypeSecureElement pass type. Ignoring.", buf, 2u);
  }
  PKLogFacilityTypeGetObject(5uLL);
  v84 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v84, OS_LOG_TYPE_DEFAULT, "groupingIdentifier is only supported for boardingPass, eventTicket, and healthPass styles as well as PKPassTypeSecureElement pass type. Ignoring.", buf, 2u);
  }

  v79 = 0;
LABEL_97:

  -[PKPass setGroupingID:](v8, "setGroupingID:", v79);
  objc_msgSend(v83, "PKStringForKey:", CFSTR("provisioningCredentialHash"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setProvisioningCredentialHash:](v8, "setProvisioningCredentialHash:", v85);
  objc_msgSend(v83, "objectForKey:", CFSTR("sharingProhibited"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
    v87 = objc_msgSend(v83, "PKBoolForKey:", CFSTR("sharingProhibited"));
  else
    v87 = 0;
  objc_msgSend(v83, "PKDictionaryForKey:", CFSTR("sharing"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v88;
  if (v87)
  {
    v90 = v8;
    v91 = -1;
  }
  else
  {
    if (v88)
    {
      objc_msgSend(v88, "PKStringForKey:", CFSTR("method"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = (int)_PKEnumValueFromString(v92, v93, (uint64_t)CFSTR("PKPassSharingMethod"), CFSTR("PKPassSharingMethodDisabled, PKPassSharingMethodPass, PKPassSharingMethodURL"), v94, v95, v96, v97, 0xFFFFFFFF);

      -[PKPass setSharingMethod:](v8, "setSharingMethod:", v98);
      if (-[PKPass sharingMethod](v8, "sharingMethod") == 1)
      {
        objc_msgSend(v89, "PKURLForKey:", CFSTR("url"));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPass setSharingURL:](v8, "setSharingURL:", v99);

      }
      objc_msgSend(v89, "PKStringForKey:", CFSTR("text"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPass setSharingText:](v8, "setSharingText:", v100);

      goto LABEL_108;
    }
    v90 = v8;
    v91 = 0;
  }
  -[PKPass setSharingMethod:](v90, "setSharingMethod:", v91);
LABEL_108:
  v101 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v83, "PKStringForKey:", CFSTR("transferURL"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "URLWithString:", v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setTransferURL:](v8, "setTransferURL:", v103);

  v104 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v83, "PKStringForKey:", CFSTR("sellURL"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "URLWithString:", v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setSellURL:](v8, "setSellURL:", v106);

  v107 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v83, "PKStringForKey:", CFSTR("bagPolicyURL"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "URLWithString:", v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setBagPolicyURL:](v8, "setBagPolicyURL:", v109);

  v110 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v83, "PKStringForKey:", CFSTR("orderFoodURL"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "URLWithString:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setOrderFoodURL:](v8, "setOrderFoodURL:", v112);

  v113 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v83, "PKStringForKey:", CFSTR("transitInformationURL"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "URLWithString:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setTransitInformationURL:](v8, "setTransitInformationURL:", v115);

  v116 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v83, "PKStringForKey:", CFSTR("parkingInformationURL"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "URLWithString:", v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setParkingInformationURL:](v8, "setParkingInformationURL:", v118);

  v119 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v83, "PKStringForKey:", CFSTR("directionsInformationURL"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "URLWithString:", v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setDirectionsInformationURL:](v8, "setDirectionsInformationURL:", v121);

  v122 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v83, "PKStringForKey:", CFSTR("merchandiseURL"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "URLWithString:", v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setMerchandiseURL:](v8, "setMerchandiseURL:", v124);

  v125 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v83, "PKStringForKey:", CFSTR("accessibilityURL"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "URLWithString:", v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setAccessibilityURL:](v8, "setAccessibilityURL:", v127);

  v128 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v83, "PKStringForKey:", CFSTR("purchaseParkingURL"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "URLWithString:", v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setPurchaseParkingURL:](v8, "setPurchaseParkingURL:", v130);

  v131 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v83, "PKStringForKey:", CFSTR("addOnURL"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "URLWithString:", v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setPartnerAddOnURL:](v8, "setPartnerAddOnURL:", v133);

  objc_msgSend(v83, "PKStringForKey:", CFSTR("contactVenueEmail"));
  v134 = (id)objc_claimAutoreleasedReturnValue();
  v135 = v134;
  if (v134)
  {
    v136 = objc_msgSend(v134, "length");

    if (v136)
    {
      if ((objc_msgSend(v135, "hasPrefix:", CFSTR("mailto:")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mailto:%@"), v135);
        v137 = objc_claimAutoreleasedReturnValue();

        v135 = (void *)v137;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v135);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setContactVenueEmail:](v8, "setContactVenueEmail:", v138);

  objc_msgSend(v83, "PKStringForKey:", CFSTR("contactVenuePhoneNumber"));
  v139 = (id)objc_claimAutoreleasedReturnValue();
  v140 = v139;
  if (v139
    && (v141 = objc_msgSend(v139, "length"), v140, v141)
    && (objc_msgSend(v140, "hasPrefix:", CFSTR("tel:")) & 1) == 0)
  {
    PKTelephoneURLFromPhoneNumber(v140);
    v142 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v140);
    v142 = objc_claimAutoreleasedReturnValue();
  }
  v143 = (void *)v142;
  -[PKPass setContactVenuePhoneNumber:](v8, "setContactVenuePhoneNumber:", v142);
  v144 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v83, "PKStringForKey:", CFSTR("contactVenueWebsite"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "URLWithString:", v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass setContactVenueWebsite:](v8, "setContactVenueWebsite:", v146);

  v7 = v153;
  v6 = v154;
LABEL_117:
  v147 = v8;

  return v147;
}

- (void)setPassType:(unint64_t)a3
{
  self->_passType = a3;
}

+ (unint64_t)defaultSettings
{
  return 3;
}

- (void)setVoided:(BOOL)a3
{
  self->_voided = a3;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void)setTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void)setSupportsCategoryVisualization:(BOOL)a3
{
  self->_supportsCategoryVisualization = a3;
}

- (void)setSharingMethod:(int64_t)a3
{
  self->_sharingMethod = a3;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)setSequenceCounter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void)setRelevantDates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setProvisioningCredentialHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void)setOrganizationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setNFCPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (void)setMuteReadyForUseNotification:(BOOL)a3
{
  self->_muteReadyForUseNotification = a3;
}

- (void)setLiveRenderingRequiresEnablement:(BOOL)a3
{
  self->_liveRenderingRequiresEnablement = a3;
}

- (void)setLiveRenderType:(unint64_t)a3
{
  self->_liveRenderType = a3;
}

- (void)setHomeKeyLiveRenderType:(unint64_t)a3
{
  self->_homeKeyLiveRenderType = a3;
}

- (void)setHasStoredValue:(BOOL)a3
{
  self->_hasStoredValue = a3;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void)setEmbeddedLocationsArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setEmbeddedBeacons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (void)setAssociatedPassTypeIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setLiveRenderedBackground:(BOOL)a3
{
  self->_liveRenderedBackground = a3;
}

- (void)setGroupingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSArray)frontFieldBuckets
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frontFieldBuckets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (CGRect)logoRect
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  if (-[PKObject isImageSetLoaded:](self, "isImageSetLoaded:", 0))
    v3 = 0;
  else
    v3 = 2;
  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logoRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)resolvingClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isValidObjectWithFileDataAccessor:(id)a3 validationOptions:(unint64_t)a4 warnings:(id *)a5 error:(id *)a6 signingDate:(id *)a7 passDictionary:(id)a8
{
  char v11;
  id v13;
  void *v14;

  v11 = a4;
  v13 = a8;
  objc_msgSend(a3, "fileURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = PKValidatePassWithOptions(v14, v11, a6, a5, a7, v13);

  return (char)a7;
}

+ (id)dataTypeIdentifier
{
  return CFSTR("com.apple.pkpass");
}

+ (Class)classForDictionary:(id)a3 bundle:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "PKStringForKey:", CFSTR("passTypeIdentifier"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPass classForPassType:](PKPass, "classForPassType:", PKPassTypeForPassTypeIdentifier(v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

+ (Class)classForPassType:(unint64_t)a3
{
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (PKImage)partialFrontFaceImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeHolderImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKImage *)v3;
}

- (id)logoImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logoImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PKColor)partialFrontFaceImageAverageColor
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[PKObject isImageSetLoaded:](self, "isImageSetLoaded:", 2)
    || !-[PKObject isImageSetLoaded:](self, "isImageSetLoaded:", 0))
  {
    -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeHolderImageAverageColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "faceImageAverageColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return (PKColor *)v5;
}

- (BOOL)silenceRequested
{
  void *v2;
  char v3;

  -[PKPass numberForSemanticKey:](self, "numberForSemanticKey:", CFSTR("silenceRequested"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (int64_t)eventType
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  -[PKPass stringForSemanticKey:](self, "stringForSemanticKey:", CFSTR("eventType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (int)_PKEnumValueFromString(v2, v3, (uint64_t)CFSTR("PKEventType"), CFSTR("PKEventTypeGeneric, PKEventTypeLivePerformance, PKEventTypeMovie, PKEventTypeSports, PKEventTypeConference, PKEventTypeConvention, PKEventTypeWorkshop, PKEventTypeSocialGathering"), v4, v5, v6, v7, 0);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKPass)initWithData:(NSData *)data error:(NSError *)error
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPass;
  return -[PKObject initWithData:error:](&v5, sel_initWithData_error_, data, error);
}

+ (id)fetchSigningDateForObjectWithFileDataAccessor:(id)a3 passDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKFetchSigningDate(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4
{
  id v5;
  objc_super v6;
  _QWORD v7[4];
  PKPass *v8;
  id v9;

  v7[1] = 3221225472;
  v7[2] = __59__PKPass_downloadRemoteAssetsWithConfiguration_completion___block_invoke;
  v7[3] = &unk_1E2AD4260;
  v8 = self;
  v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)PKPass;
  v7[0] = MEMORY[0x1E0C809B0];
  v5 = v9;
  -[PKObject downloadRemoteAssetsWithConfiguration:completion:](&v6, sel_downloadRemoteAssetsWithConfiguration_completion_, a3, v7);

}

void __59__PKPass_downloadRemoteAssetsWithConfiguration_completion___block_invoke(uint64_t a1, int a2, void *a3, float a4)
{
  id v7;

  v7 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "reloadDisplayProfileOfType:", 0);
    objc_msgSend(*(id *)(a1 + 32), "flushLoadedImageSets");
  }
  (*(void (**)(float))(*(_QWORD *)(a1 + 40) + 16))(a4);

}

- (NSDate)relevantDate
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_relevantDates, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSArray)relevantDates
{
  if (self->_relevantDates)
    return self->_relevantDates;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (PKPass)initWithCloudStoreCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  PKPass *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKPass *v18;
  id v20;
  uint8_t buf[4];
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("Pass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("pkpass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D50]);
    objc_msgSend(v6, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithContentsOfURL:", v8);

    if (v9)
    {
      v20 = 0;
      v10 = -[PKPass initWithData:error:](self, "initWithData:error:", v9, &v20);
      v11 = v20;
      self = v10;
      if (v11)
      {
        PKLogFacilityTypeGetObject(9uLL);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v22 = v11;
          _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Cannot create a PKPass from data: %{public}@", buf, 0xCu);
        }

      }
      objc_msgSend(v5, "creationDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPass setIngestedDate:](self, "setIngestedDate:", v13);

      objc_msgSend(v5, "modificationDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPass setModifiedDate:](self, "setModifiedDate:", v14);

      objc_msgSend(v5, "recordID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "recordName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPass uniqueIDFromRecordName:](PKPass, "uniqueIDFromRecordName:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKObject setUniqueID:](self, "setUniqueID:", v17);

      v18 = self;
    }
    else
    {
      PKLogFacilityTypeGetObject(9uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Cannot create a PKPass with nil data", buf, 2u);
      }
      v18 = 0;
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(9uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Cannot create a PKPass with no asset data from CloudKit.", buf, 2u);
    }
    v18 = 0;
  }

  return v18;
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = (void *)MEMORY[0x19400CFE8]();
  objc_msgSend(v5, "recordsWithRecordType:", CFSTR("Pass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKObject archiveData](self, "archiveData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    NSTemporaryDirectory();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKObject uniqueID](self, "uniqueID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeItemAtPath:error:", v12, 0);

    objc_msgSend(v9, "writeToFile:atomically:", v12, 1);
    v14 = objc_alloc(MEMORY[0x1E0C94BB8]);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithFileURL:", v15);

    if (v16)
    {
      objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("pkpass"));
    }
    else
    {
      PKLogFacilityTypeGetObject(9uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Could not set CKAsset for the CKRecord because it is nil.", buf, 2u);
      }

    }
  }
  else
  {
    PKLogFacilityTypeGetObject(9uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Could not set archiveData for PKPass on CKRecord because it is nil.", v18, 2u);
    }
  }

  objc_autoreleasePoolPop(v6);
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[PKObject uniqueID](self, "uniqueID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    return 0;
  v6 = (void *)objc_opt_class();
  -[PKObject uniqueID](self, "uniqueID", CFSTR("Pass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordNameForUniqueID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)systemFieldsDataForCloudStoreWithIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  void *v13;
  NSObject *v14;
  int v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = CFSTR("com.apple.passes.sync");
  if (v5 == v4)
  {

    goto LABEL_7;
  }
  v6 = v5;
  if (!v4 || !v5)
  {

    goto LABEL_9;
  }
  v7 = -[__CFString isEqualToString:](v4, "isEqualToString:", v5);

  if (v7)
  {
LABEL_7:
    -[PKPass cloudKitMetadata](self, "cloudKitMetadata");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v13 = (void *)v8;
    goto LABEL_21;
  }
LABEL_9:
  v9 = v4;
  v10 = CFSTR("com.apple.passes.sync.secure");
  if (v10 == v9)
  {

LABEL_15:
    -[PKPass cloudKitSecureMetadata](self, "cloudKitSecureMetadata");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v11 = v10;
  if (v4 && v10)
  {
    v12 = -[__CFString isEqualToString:](v9, "isEqualToString:", v10);

    if (!v12)
      goto LABEL_18;
    goto LABEL_15;
  }

LABEL_18:
  PKLogFacilityTypeGetObject(9uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v9;
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "unknown cloud store identifier: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  v13 = 0;
LABEL_21:

  return v13;
}

- (BOOL)wasAchivedInCloudStoreWithIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  BOOL v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  int v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = CFSTR("com.apple.passes.sync");
  if (v5 == v4)
  {

    goto LABEL_7;
  }
  v6 = v5;
  if (!v4 || !v5)
  {

    goto LABEL_9;
  }
  v7 = -[__CFString isEqualToString:](v4, "isEqualToString:", v5);

  if (v7)
  {
LABEL_7:
    v8 = -[PKPass isCloudKitArchived](self, "isCloudKitArchived");
LABEL_16:
    v13 = v8;
    goto LABEL_21;
  }
LABEL_9:
  v9 = v4;
  v10 = CFSTR("com.apple.passes.sync.secure");
  if (v10 == v9)
  {

LABEL_15:
    v8 = -[PKPass isCloudKitSecurelyArchived](self, "isCloudKitSecurelyArchived");
    goto LABEL_16;
  }
  v11 = v10;
  if (v4 && v10)
  {
    v12 = -[__CFString isEqualToString:](v9, "isEqualToString:", v10);

    if (!v12)
      goto LABEL_18;
    goto LABEL_15;
  }

LABEL_18:
  PKLogFacilityTypeGetObject(9uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v9;
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "unknown cloud store identifier: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  v13 = 0;
LABEL_21:

  return v13;
}

- (void)setSystemFieldsMetata:(id)a3 forCloudStoreWithIdentifier:(id)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  NSObject *v15;
  int v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = CFSTR("com.apple.passes.sync");
  if (v8 == v7)
  {

    goto LABEL_7;
  }
  v9 = v8;
  if (!v7 || !v8)
  {

    goto LABEL_9;
  }
  v10 = -[__CFString isEqualToString:](v7, "isEqualToString:", v8);

  if (v10)
  {
LABEL_7:
    -[PKPass setIsCloudKitArchived:](self, "setIsCloudKitArchived:", 1);
    -[PKPass setCloudKitMetadata:](self, "setCloudKitMetadata:", v6);
    goto LABEL_20;
  }
LABEL_9:
  v11 = v7;
  v12 = CFSTR("com.apple.passes.sync.secure");
  if (v12 == v11)
  {

    goto LABEL_15;
  }
  v13 = v12;
  if (v7 && v12)
  {
    v14 = -[__CFString isEqualToString:](v11, "isEqualToString:", v12);

    if (!v14)
      goto LABEL_17;
LABEL_15:
    -[PKPass setIsCloudKitSecurelyArchived:](self, "setIsCloudKitSecurelyArchived:", 1);
    -[PKPass setCloudKitSecureMetadata:](self, "setCloudKitSecureMetadata:", v6);
    goto LABEL_20;
  }

LABEL_17:
  PKLogFacilityTypeGetObject(9uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v11;
    _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "unknown cloud store identifier: %{public}@", (uint8_t *)&v16, 0xCu);
  }

LABEL_20:
}

- (unint64_t)itemType
{
  return 2;
}

+ (id)recordNamePrefix
{
  return CFSTR("pass-");
}

+ (id)recordNameForUniqueID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "recordNamePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)uniqueIDFromRecordName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "recordNamePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasPrefix:", v5);

  if (v6)
  {
    objc_msgSend(a1, "recordNamePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v7, &stru_1E2ADF4C0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSSet)embeddedLocations
{
  void *v2;

  if (self->_embeddedLocations)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self->_embeddedLocations);
  else
    v2 = 0;
  return (NSSet *)v2;
}

- (void)setEmbeddedLocations:(id)a3
{
  NSArray *v4;
  NSArray *embeddedLocations;

  v4 = (NSArray *)objc_msgSend(a3, "pk_arrayCopy");
  embeddedLocations = self->_embeddedLocations;
  self->_embeddedLocations = v4;

}

- (NSString)localizedName
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[PKPass style](self, "style");
  if (v2 > 9)
    v3 = CFSTR("TEMPLATE_NAME_PASS");
  else
    v3 = off_1E2AD4298[v2];
  PKCoreLocalizedString(&v3->isa, 0);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)lowercaseLocalizedName
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[PKPass style](self, "style");
  if (v2 > 9)
    v3 = CFSTR("TEMPLATE_NAME_LOWERCASE_PASS");
  else
    v3 = off_1E2AD42E8[v2];
  PKCoreLocalizedString(&v3->isa, 0);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)pluralLocalizedName
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[PKPass style](self, "style");
  if (v2 > 9)
    v3 = CFSTR("TEMPLATE_NAME_PASSES");
  else
    v3 = off_1E2AD4338[v2];
  PKCoreLocalizedString(&v3->isa, 0);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)passURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[PKObject uniqueID](self, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !self->_remotePass)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v5, "setScheme:", CFSTR("shoebox"));
    objc_msgSend(v5, "setHost:", CFSTR("card"));
    -[PKObject uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/"), "stringByAppendingString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPath:", v7);

    objc_msgSend(v5, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

- (BOOL)hasTimeOrLocationRelevancyInfo
{
  return -[NSArray count](self->_relevantDates, "count")
      || -[PKPass hasLocationRelevancyInfo](self, "hasLocationRelevancyInfo");
}

- (BOOL)hasLocationRelevancyInfo
{
  return -[NSArray count](self->_embeddedLocations, "count") || -[NSSet count](self->_embeddedBeacons, "count") != 0;
}

- (BOOL)isPastRelevancy
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[PKPass relevantDates](self, "relevantDates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPassRelevantDate findDateFromDates:option:](PKPassRelevantDate, "findDateFromDates:option:", v2, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5 > 86400.0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isUpdatable
{
  void *v2;
  BOOL v3;

  -[PKObject webServiceURL](self, "webServiceURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isExpiredBasedOnSigningDate
{
  void *v3;
  int64_t v4;
  unint64_t v5;
  void *v6;
  double v7;
  unsigned int v9;

  -[PKObject signingDate](self, "signingDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPass style](self, "style");
  if (v3)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v3);
    if (v7 <= 31536000.0 || v5 > 9)
      LOBYTE(v9) = 0;
    else
      v9 = (0x214u >> v5) & 1;

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)supportsSyncing
{
  unint64_t passType;
  _BOOL4 v4;

  passType = self->_passType;
  if (-[PKPass style](self, "style") == 8)
    v4 = !-[NSString hasPrefix:](self->_passTypeIdentifier, "hasPrefix:", CFSTR("healthpass.com.apple.health"));
  else
    LOBYTE(v4) = 1;
  return !passType && v4;
}

- (BOOL)supportsSharing
{
  return -[PKPass passType](self, "passType") != PKPassTypeSecureElement;
}

- (id)localizedValueForFieldKey:(NSString *)key
{
  void *v3;
  void *v4;
  void *v5;

  -[PKPass fieldForKey:](self, "fieldForKey:", key);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "unformattedValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)fieldForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t k;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t m;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  uint64_t i;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  int v28;
  id v29;
  PKPass *v31;
  id obj;
  id obja;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[PKPass frontFieldBuckets](self, "frontFieldBuckets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (!v36)
  {

LABEL_21:
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[PKPass backFieldBuckets](self, "backFieldBuckets", v31);
    obja = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    v18 = 0;
    if (v37)
    {
      v35 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v43 != v35)
            objc_enumerationMutation(obja);
          v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v21 = v20;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v39;
            while (2)
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v39 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
                objc_msgSend(v26, "key");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "isEqual:", v4);

                if (v28)
                {
                  v29 = v26;

                  v18 = v29;
                  goto LABEL_36;
                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
              if (v23)
                continue;
              break;
            }
          }
LABEL_36:

        }
        v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      }
      while (v37);
    }

    v6 = v18;
    goto LABEL_39;
  }
  v31 = self;
  obj = v5;
  v6 = 0;
  v34 = *(_QWORD *)v51;
  do
  {
    for (k = 0; k != v36; ++k)
    {
      if (*(_QWORD *)v51 != v34)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v47;
        while (2)
        {
          for (m = 0; m != v11; ++m)
          {
            if (*(_QWORD *)v47 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * m);
            objc_msgSend(v14, "key", v31);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", v4);

            if (v16)
            {
              v17 = v14;

              v6 = v17;
              goto LABEL_16;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_16:

    }
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  }
  while (v36);

  self = v31;
  if (!v6)
    goto LABEL_21;
LABEL_39:

  return v6;
}

- (id)localizedDescriptionForDiff:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSString *v20;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hunkCount") != 1)
    goto LABEL_14;
  v30 = 0;
  v31 = 0;
  v28 = 0;
  v29 = 0;
  objc_msgSend(v4, "key:oldValue:newValue:message:forHunkAtIndex:", &v31, &v30, &v29, &v28, 0);
  v5 = v31;
  v6 = v30;
  v7 = v29;
  v8 = v28;
  if (!v7)
    goto LABEL_12;
  if (-[PKPass style](self, "style") != 9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "length"))
    {
      -[PKPass _changeMessageForFieldKey:](self, "_changeMessageForFieldKey:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        PKValidateChangeMessage(v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          PKStringWithValidatedFormat(v12, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v7);
          v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

          goto LABEL_13;
        }
      }
      else
      {
        v19 = 0;
      }
      PKLogFacilityTypeGetObject(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        -[PKPass passTypeIdentifier](self, "passTypeIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPass serialNumber](self, "serialNumber");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "userInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKey:", *MEMORY[0x1E0CB3388]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v26;
        v34 = 2114;
        v35 = v24;
        v36 = 2114;
        v37 = v23;
        _os_log_error_impl(&dword_18FC92000, v22, OS_LOG_TYPE_ERROR, "Change message didn't validate in pass %{public}@/%{public}@: %{public}@", buf, 0x20u);

      }
      v10 = 0;
      goto LABEL_20;
    }
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  -[PKPass allSemantics](self, "allSemantics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
    v10 = v8;
LABEL_13:

  if (!v10)
  {
LABEL_14:
    -[PKPass _localizationKeyForMultipleDiff](self, "_localizationKeyForMultipleDiff");
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCoreLocalizedString(v20, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (NSURL)localLocationsURL
{
  void *v2;
  void *v3;
  void *v4;

  -[PKObject dataAccessor](self, "dataAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (id)diff:(id)a3
{
  id v4;
  PKDiff *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  char v24;
  id v25;
  char v26;
  id v27;
  char v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  int v35;
  char v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  __CFString *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  __CFString *v74;
  __CFString *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v81;
  PKPass *v82;
  id obj;
  PKDiff *v84;
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint8_t v100[128];
  uint8_t buf[4];
  id v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(PKDiff);
  -[PKObject uniqueID](self, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiff setPassUniqueID:](v5, "setPassUniqueID:", v6);

  -[PKObject manifestHash](self, "manifestHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v5;
  -[PKDiff setPassManifestHash:](v5, "setPassManifestHash:", v7);

  v8 = 0x1E0C99000uLL;
  v81 = v4;
  if (-[PKPass style](self, "style") == 9)
  {
    -[PKPass allSemantics](self, "allSemantics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allSemantics");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v85 = v9;
    objc_msgSend(v9, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v11);

    objc_msgSend(v41, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v12);

    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    obj = v10;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
    if (!v13)
      goto LABEL_130;
    v14 = v13;
    v15 = *(_QWORD *)v96;
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v96 != v15)
          objc_enumerationMutation(obj);
        v17 = *(id *)(*((_QWORD *)&v95 + 1) + 8 * v16);
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("departureLocationDescription")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("destinationLocationDescription")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("transitProvider")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("vehicleName")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("vehicleNumber")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("vehicleType")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("boardingGroup")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("boardingSequenceNumber")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("confirmationNumber")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("transitStatus")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("transitStatusReason")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("membershipProgramName")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("membershipProgramNumber")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("priorityStatus")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("securityScreening")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("flightCode")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("airlineCode")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("departureAirportCode")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("departureAirportName")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("departureTerminal")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("departureGate")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("destinationAirportCode")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("destinationAirportName")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("destinationTerminal")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("destinationGate")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("departurePlatform")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("departureStationName")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("destinationPlatform")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("destinationStationName")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("carNumber")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("eventName")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("venueName")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("venueEntrance")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("venueRoom")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("venuePhoneNumber")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("leagueName")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("leagueAbbreviation")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("homeTeamLocation")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("homeTeamName")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("homeTeamAbbreviation")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("awayTeamLocation")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("awayTeamName")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("awayTeamAbbreviation")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("sportName")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("genre")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("eventLiveMessage")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("admissionLevel")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("admissionLevelAbbreviation")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("attendeeName")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("venueRegionName")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("entranceDescription")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("venueEntranceGate")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("venueEntranceDoor")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("venueEntrancePortal")) & 1) != 0
          || (objc_msgSend(v17, "isEqualToString:", CFSTR("additionalTicketAttributes")) & 1) != 0)
        {
          goto LABEL_96;
        }
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("eventType"));

        if ((v18 & 1) != 0)
          goto LABEL_97;
        v19 = v17;
        if ((objc_msgSend(v19, "isEqualToString:", CFSTR("originalDepartureDate")) & 1) != 0
          || (objc_msgSend(v19, "isEqualToString:", CFSTR("currentDepartureDate")) & 1) != 0
          || (objc_msgSend(v19, "isEqualToString:", CFSTR("originalArrivalDate")) & 1) != 0
          || (objc_msgSend(v19, "isEqualToString:", CFSTR("currentArrivalDate")) & 1) != 0
          || (objc_msgSend(v19, "isEqualToString:", CFSTR("originalBoardingDate")) & 1) != 0
          || (objc_msgSend(v19, "isEqualToString:", CFSTR("currentBoardingDate")) & 1) != 0
          || (objc_msgSend(v19, "isEqualToString:", CFSTR("eventStartDate")) & 1) != 0
          || (objc_msgSend(v19, "isEqualToString:", CFSTR("venueDoorsOpenDate")) & 1) != 0
          || (objc_msgSend(v19, "isEqualToString:", CFSTR("venueGatesOpenDate")) & 1) != 0
          || (objc_msgSend(v19, "isEqualToString:", CFSTR("venueParkingLotsOpenDate")) & 1) != 0
          || (objc_msgSend(v19, "isEqualToString:", CFSTR("venueBoxOfficeOpenDate")) & 1) != 0
          || (objc_msgSend(v19, "isEqualToString:", CFSTR("venueFanZoneOpenDate")) & 1) != 0
          || (objc_msgSend(v19, "isEqualToString:", CFSTR("venueOpenDate")) & 1) != 0
          || (objc_msgSend(v19, "isEqualToString:", CFSTR("venueCloseDate")) & 1) != 0)
        {
          goto LABEL_96;
        }
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("eventEndDate"));

        if ((v20 & 1) != 0 || (objc_msgSend(v19, "isEqualToString:", CFSTR("eventStartDateInfo")) & 1) != 0)
          goto LABEL_97;
        v21 = v19;
        if ((objc_msgSend(v21, "isEqualToString:", CFSTR("flightNumber")) & 1) != 0
          || (objc_msgSend(v21, "isEqualToString:", CFSTR("duration")) & 1) != 0
          || (objc_msgSend(v21, "isEqualToString:", CFSTR("tailgatingAllowed")) & 1) != 0)
        {
          goto LABEL_96;
        }
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("silenceRequested"));

        if ((v22 & 1) != 0)
          goto LABEL_97;
        v23 = v21;
        if ((objc_msgSend(v23, "isEqualToString:", CFSTR("departureLocation")) & 1) != 0
          || (objc_msgSend(v23, "isEqualToString:", CFSTR("destinationLocation")) & 1) != 0)
        {
          goto LABEL_96;
        }
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("venueLocation"));

        if ((v24 & 1) != 0)
          goto LABEL_97;
        v25 = v23;
        if ((objc_msgSend(v25, "isEqualToString:", CFSTR("balance")) & 1) != 0)
          goto LABEL_96;
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("balance"));

        if ((v26 & 1) != 0 || (objc_msgSend(v25, "isEqualToString:", CFSTR("passengerName")) & 1) != 0)
          goto LABEL_97;
        v27 = v25;
        if ((objc_msgSend(v27, "isEqualToString:", CFSTR("artistIDs")) & 1) != 0
          || (objc_msgSend(v27, "isEqualToString:", CFSTR("performerNames")) & 1) != 0
          || (objc_msgSend(v27, "isEqualToString:", CFSTR("albumIDs")) & 1) != 0)
        {
          goto LABEL_96;
        }
        v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("playlistIDs"));

        if ((v28 & 1) != 0)
          goto LABEL_97;
        v29 = v27;
        if (objc_msgSend(v29, "isEqualToString:", CFSTR("seats")))
        {
          _os_feature_enabled_impl();
LABEL_96:

LABEL_97:
LABEL_98:
          objc_msgSend(v85, "objectForKeyedSubscript:", v17);
          v30 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKeyedSubscript:", v17);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v31 && (objc_msgSend(v31, "isEqual:", v30) & 1) == 0)
          {
            -[PKPass _changeMessageForSemantic:newSemantic:](self, "_changeMessageForSemantic:newSemantic:", v30, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (v33)
              -[PKDiff addHunkWithKey:oldValue:newValue:message:](v84, "addHunkWithKey:oldValue:newValue:message:", v17, v30, v32, v33);

          }
          goto LABEL_104;
        }
        v34 = objc_msgSend(v29, "isEqualToString:", CFSTR("wifiAccess"));
        v35 = _os_feature_enabled_impl();
        if (!v35 || (v34 & 1) != 0)
          v36 = v35 | v34;
        else
          v36 = objc_msgSend(v29, "isEqualToString:", CFSTR("airPlay"));

        if ((v36 & 1) != 0)
          goto LABEL_98;
        PKLogFacilityTypeGetObject(0);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v102 = v29;
          _os_log_impl(&dword_18FC92000, v30, OS_LOG_TYPE_DEFAULT, "Ignoring semantic value in diff for unknown key %@", buf, 0xCu);
        }
LABEL_104:

        ++v16;
      }
      while (v14 != v16);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
      v14 = v37;
      if (!v37)
      {
        v8 = 0x1E0C99000;
        v4 = v81;
        goto LABEL_130;
      }
    }
  }
  -[PKPass frontFieldBuckets](self, "frontFieldBuckets");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  _FieldsByKey(v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "frontFieldBuckets");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  _FieldsByKey(v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v39;
  objc_msgSend(v39, "allKeys");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObjectsFromArray:", v43);

  objc_msgSend(v41, "allKeys");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObjectsFromArray:", v44);

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v42;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
  if (v45)
  {
    v46 = v45;
    v82 = self;
    v47 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v92 != v47)
          objc_enumerationMutation(obj);
        v49 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
        objc_msgSend(v85, "valueForKey:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "value");
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = (void *)v51;
        if (v51)
          v53 = (__CFString *)v51;
        else
          v53 = &stru_1E2ADF4C0;
        v54 = v53;

        objc_msgSend(v41, "valueForKey:", v49);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "value");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "valueForKey:", v49);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "changeMessage");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56 && (objc_msgSend(v56, "isEqual:", v54) & 1) == 0 && v58)
          -[PKDiff addHunkWithKey:oldValue:newValue:message:](v84, "addHunkWithKey:oldValue:newValue:message:", v49, v54, v56, v58);

      }
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
    }
    while (v46);
    self = v82;
    v8 = 0x1E0C99000uLL;
  }
LABEL_130:

  -[PKPass backFieldBuckets](self, "backFieldBuckets");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  _FieldsByKey(v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "backFieldBuckets");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  _FieldsByKey(v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v8 + 3616), "set");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "allKeys");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObjectsFromArray:", v64);

  objc_msgSend(v62, "allKeys");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObjectsFromArray:", v65);

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v86 = v63;
  v66 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v88;
    do
    {
      for (j = 0; j != v67; ++j)
      {
        if (*(_QWORD *)v88 != v68)
          objc_enumerationMutation(v86);
        v70 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * j);
        objc_msgSend(v60, "valueForKey:", v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "value");
        v72 = objc_claimAutoreleasedReturnValue();
        v73 = (void *)v72;
        v74 = &stru_1E2ADF4C0;
        if (v72)
          v74 = (__CFString *)v72;
        v75 = v74;

        objc_msgSend(v62, "valueForKey:", v70);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "value");
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v62, "valueForKey:", v70);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "changeMessage");
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (v77 && (objc_msgSend(v77, "isEqual:", v75) & 1) == 0 && v79)
          -[PKDiff addHunkWithKey:oldValue:newValue:message:](v84, "addHunkWithKey:oldValue:newValue:message:", v70, v75, v77, v79);

      }
      v67 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
    }
    while (v67);
  }

  return v84;
}

- (NSString)eventName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PKPass stringForSemanticKey:](self, "stringForSemanticKey:", CFSTR("eventName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PKPass localizedName](self, "localizedName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (PKLocation)eventLocation
{
  void *v3;
  void *v4;

  -[PKPass locationForSemanticKey:](self, "locationForSemanticKey:", CFSTR("venueLocation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[PKPass hasLocationRelevancyInfo](self, "hasLocationRelevancyInfo"))
    {
      -[PKPass embeddedLocationsArray](self, "embeddedLocationsArray");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  return (PKLocation *)v3;
}

- (PKSeatingInformation)seatingInformation
{
  void *v2;
  void *v3;
  id v4;

  -[PKPass allSemantics](self, "allSemantics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("seats"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[PKSeatingInformation initFromSemantic:]([PKSeatingInformation alloc], "initFromSemantic:", v3);
  return (PKSeatingInformation *)v4;
}

- (NSString)localizedDescription
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)transitType
{
  void *v2;
  int64_t v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitType");

  return v3;
}

- (NSArray)backFieldBuckets
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backFieldBuckets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)passDetailSections
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passDetailSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)auxiliaryPassInformation
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auxiliaryPassInformationSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)primaryFields
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)balanceFields
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "balanceFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)autoTopUpFields
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autoTopUpFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)additionalInfoFields
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additionalInfoFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)balances
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "balances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)auxiliaryStoreIdentifiers
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auxiliaryStoreIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSURL)appLaunchURL
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appLaunchURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (PKPassPersonalization)personalization
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personalization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPassPersonalization *)v3;
}

- (BOOL)isPersonalizable
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personalization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)semantics
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "semantics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allSemantics
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allSemantics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fidoProfile
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fidoProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)issuerBindingInformation
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "issuerBindingInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PKImage)iconImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKImage *)v3;
}

- (PKImage)rawIcon
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKImage *)v3;
}

- (PKImage)notificationIconImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationIconImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKImage *)v3;
}

- (CGRect)stripRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stripRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (PKImage)footerImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footerImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKImage *)v3;
}

- (PKImage)cardHolderPicture
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardHolderPicture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKImage *)v3;
}

- (PKImage)personalizationLogoImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logoImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKImage *)v3;
}

- (id)backgroundImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)stripImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stripImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)thumbnailImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnailImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PKImage)compactBankLogoDarkImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compactBankLogoDarkImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKImage *)v3;
}

- (PKImage)compactBankLogoLightImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compactBankLogoLightImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKImage *)v3;
}

- (id)secondaryLogoImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryLogoImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)venueMapImage
{
  void *v2;
  void *v3;

  -[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "venueMapImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)businessChatIdentifier
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "businessChatIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PKPassBarcodeSettings)barcodeSettings
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "barcodeSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPassBarcodeSettings *)v3;
}

- (BOOL)isValid
{
  if (-[PKPass isRevoked](self, "isRevoked") || -[PKPass isExpired](self, "isExpired"))
    return 0;
  else
    return !-[PKPass isVoided](self, "isVoided");
}

- (PKPassLiveRenderedArmedStateImageSet)liveRenderedArmedStateImageSet
{
  return (PKPassLiveRenderedArmedStateImageSet *)-[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 7);
}

- (PKPassFrontFaceImageSet)frontFaceImageSet
{
  return (PKPassFrontFaceImageSet *)-[PKObject imageSetLoadedIfNeeded:](self, "imageSetLoadedIfNeeded:", 0);
}

- (NSString)cardholderInfoSectionTitle
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardholderInfoSectionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PKLiveRenderedShaderSet)liveRenderedShaderSet
{
  PKLiveRenderedShaderSet *liveRenderedShaderSet;
  PKLiveRenderedShaderSet *v4;
  void *v5;
  PKLiveRenderedShaderSet *v6;
  PKLiveRenderedShaderSet *v7;

  liveRenderedShaderSet = self->_liveRenderedShaderSet;
  if (!liveRenderedShaderSet)
  {
    v4 = [PKLiveRenderedShaderSet alloc];
    -[PKObject dataAccessor](self, "dataAccessor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKLiveRenderedShaderSet initWithDataAccessor:suffix:](v4, "initWithDataAccessor:suffix:", v5, 0);
    v7 = self->_liveRenderedShaderSet;
    self->_liveRenderedShaderSet = v6;

    liveRenderedShaderSet = self->_liveRenderedShaderSet;
  }
  return liveRenderedShaderSet;
}

- (id)passLocalizedStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKObject dataAccessor](self, "dataAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passLocalizedStringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)comparePassDatesToPass:(id)a3 searchOption:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  int64_t v10;

  v6 = a3;
  +[PKPass _dateForPassComparison:searchOption:](PKPass, "_dateForPassComparison:searchOption:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPass _dateForPassComparison:searchOption:](PKPass, "_dateForPassComparison:searchOption:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v7)
      v10 = -1;
    else
      v10 = v8 != 0;
  }
  else
  {
    v10 = objc_msgSend(v7, "compare:", v8);
  }

  return v10;
}

+ (id)_dateForPassComparison:(id)a3 searchOption:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(v5, "relevantDates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPassRelevantDate findDateFromDates:option:](PKPassRelevantDate, "findDateFromDates:option:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v5, "expirationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v5, "modifiedDate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v11;

  }
  return v8;
}

- (BOOL)isEqualToPassIncludingMetadata:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  unint64_t v22;
  BOOL v23;
  _BOOL4 v24;
  int v25;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  -[PKObject manifestHash](self, "manifestHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manifestHash");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
    {
LABEL_4:
      -[PKPass ingestedDate](self, "ingestedDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ingestedDate");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v8 && v9)
      {
        if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
        {
LABEL_7:
          -[PKPass modifiedDate](self, "modifiedDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "modifiedDate");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v11 && v12)
          {
            if ((objc_msgSend(v11, "isEqual:", v12) & 1) != 0)
            {
LABEL_10:
              -[PKObject signingDate](self, "signingDate");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "signingDate");
              v15 = objc_claimAutoreleasedReturnValue();
              v16 = (void *)v15;
              if (v14 && v15)
              {
                if ((objc_msgSend(v14, "isEqual:", v15) & 1) != 0)
                {
LABEL_13:
                  v28 = v14;
                  -[PKPass nfcPayload](self, "nfcPayload");
                  v17 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "nfcPayload");
                  v18 = objc_claimAutoreleasedReturnValue();
                  v19 = (void *)v18;
                  v29 = (void *)v17;
                  if (v17 && v18)
                  {
                    v20 = (void *)v18;
                    v21 = objc_msgSend(v29, "isEqual:", v18);
                    v19 = v20;
                    if ((v21 & 1) != 0)
                    {
LABEL_16:
                      v27 = v19;
                      v22 = -[PKObject settings](self, "settings");
                      v23 = v22 == objc_msgSend(v4, "settings");
                      v14 = v28;
                      if (v23)
                      {
                        v24 = -[PKPass isRevoked](self, "isRevoked");
                        v25 = v24 ^ objc_msgSend(v4, "isRevoked") ^ 1;
                      }
                      else
                      {
                        LOBYTE(v25) = 0;
                      }
                      v19 = v27;
                      goto LABEL_30;
                    }
                  }
                  else if (v17 == v18)
                  {
                    goto LABEL_16;
                  }
                  LOBYTE(v25) = 0;
                  v14 = v28;
LABEL_30:

                  goto LABEL_31;
                }
              }
              else if (v14 == (void *)v15)
              {
                goto LABEL_13;
              }
              LOBYTE(v25) = 0;
LABEL_31:

              goto LABEL_32;
            }
          }
          else if (v11 == (void *)v12)
          {
            goto LABEL_10;
          }
          LOBYTE(v25) = 0;
LABEL_32:

          goto LABEL_33;
        }
      }
      else if (v8 == (void *)v9)
      {
        goto LABEL_7;
      }
      LOBYTE(v25) = 0;
LABEL_33:

      goto LABEL_34;
    }
  }
  else if (v5 == (void *)v6)
  {
    goto LABEL_4;
  }
  LOBYTE(v25) = 0;
LABEL_34:

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)PKPass;
  v5 = -[PKObject copyWithZone:](&v39, sel_copyWithZone_);
  v6 = -[NSString copyWithZone:](self->_passLibraryMachServiceName, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 37);
  *((_QWORD *)v5 + 37) = v6;

  v8 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 36);
  *((_QWORD *)v5 + 36) = v8;

  *((_BYTE *)v5 + 208) = self->_remotePass;
  v10 = -[NSString copyWithZone:](self->_passTypeIdentifier, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v5 + 31);
  *((_QWORD *)v5 + 31) = v10;

  v12 = -[NSString copyWithZone:](self->_teamID, "copyWithZone:", a3);
  v13 = (void *)*((_QWORD *)v5 + 41);
  *((_QWORD *)v5 + 41) = v12;

  v14 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v15 = (void *)*((_QWORD *)v5 + 30);
  *((_QWORD *)v5 + 30) = v14;

  v16 = -[NSString copyWithZone:](self->_provisioningCredentialHash, "copyWithZone:", a3);
  v17 = (void *)*((_QWORD *)v5 + 69);
  *((_QWORD *)v5 + 69) = v16;

  v18 = -[NSNumber copyWithZone:](self->_sequenceCounter, "copyWithZone:", a3);
  v19 = (void *)*((_QWORD *)v5 + 38);
  *((_QWORD *)v5 + 38) = v18;

  v20 = -[NSString copyWithZone:](self->_organizationName, "copyWithZone:", a3);
  v21 = (void *)*((_QWORD *)v5 + 32);
  *((_QWORD *)v5 + 32) = v20;

  v22 = -[NSArray copyWithZone:](self->_relevantDates, "copyWithZone:", a3);
  v23 = (void *)*((_QWORD *)v5 + 33);
  *((_QWORD *)v5 + 33) = v22;

  v24 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  v25 = (void *)*((_QWORD *)v5 + 42);
  *((_QWORD *)v5 + 42) = v24;

  *((_BYTE *)v5 + 211) = self->_voided;
  v26 = -[NSDictionary copyWithZone:](self->_userInfo, "copyWithZone:", a3);
  v27 = (void *)*((_QWORD *)v5 + 34);
  *((_QWORD *)v5 + 34) = v26;

  v28 = -[NSString copyWithZone:](self->_groupingID, "copyWithZone:", a3);
  v29 = (void *)*((_QWORD *)v5 + 43);
  *((_QWORD *)v5 + 43) = v28;

  v30 = -[NSArray copyWithZone:](self->_embeddedLocations, "copyWithZone:", a3);
  v31 = (void *)*((_QWORD *)v5 + 28);
  *((_QWORD *)v5 + 28) = v30;

  v32 = -[NSSet copyWithZone:](self->_embeddedBeacons, "copyWithZone:", a3);
  v33 = (void *)*((_QWORD *)v5 + 44);
  *((_QWORD *)v5 + 44) = v32;

  v34 = -[PKNFCPayload copyWithZone:](self->_nfcPayload, "copyWithZone:", a3);
  v35 = (void *)*((_QWORD *)v5 + 51);
  *((_QWORD *)v5 + 51) = v34;

  *((_BYTE *)v5 + 212) = self->_hasStoredValue;
  *((_BYTE *)v5 + 213) = self->_liveRenderedBackground;
  *((_QWORD *)v5 + 67) = self->_liveRenderType;
  *((_QWORD *)v5 + 68) = self->_homeKeyLiveRenderType;
  *((_BYTE *)v5 + 214) = self->_supportsCategoryVisualization;
  *((_BYTE *)v5 + 215) = self->_liveRenderingRequiresEnablement;
  *((_QWORD *)v5 + 29) = self->_passType;
  *((_QWORD *)v5 + 47) = self->_sharingMethod;
  objc_storeStrong((id *)v5 + 49, self->_sharingText);
  objc_storeStrong((id *)v5 + 48, self->_sharingURL);
  objc_storeStrong((id *)v5 + 71, self->_ingestedDate);
  objc_storeStrong((id *)v5 + 72, self->_modifiedDate);
  *((_BYTE *)v5 + 218) = self->_revoked;
  v36 = -[NSSet copyWithZone:](self->_associatedPassTypeIdentifiers, "copyWithZone:", a3);
  v37 = (void *)*((_QWORD *)v5 + 50);
  *((_QWORD *)v5 + 50) = v36;

  *((_BYTE *)v5 + 216) = self->_muteReadyForUseNotification;
  objc_storeStrong((id *)v5 + 52, self->_transferURL);
  objc_storeStrong((id *)v5 + 53, self->_sellURL);
  objc_storeStrong((id *)v5 + 54, self->_bagPolicyURL);
  objc_storeStrong((id *)v5 + 55, self->_orderFoodURL);
  objc_storeStrong((id *)v5 + 56, self->_transitInformationURL);
  objc_storeStrong((id *)v5 + 57, self->_parkingInformationURL);
  objc_storeStrong((id *)v5 + 58, self->_directionsInformationURL);
  objc_storeStrong((id *)v5 + 59, self->_merchandiseURL);
  objc_storeStrong((id *)v5 + 60, self->_accessibilityURL);
  objc_storeStrong((id *)v5 + 61, self->_purchaseParkingURL);
  objc_storeStrong((id *)v5 + 62, self->_partnerAddOnURL);
  objc_storeStrong((id *)v5 + 63, self->_contactVenuePhoneNumber);
  objc_storeStrong((id *)v5 + 64, self->_contactVenueEmail);
  objc_storeStrong((id *)v5 + 65, self->_contactVenueWebsite);
  return v5;
}

- (BOOL)availableForAutomaticPresentationUsingBeaconContext
{
  void *v2;
  BOOL v3;

  -[PKPass embeddedBeacons](self, "embeddedBeacons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)stringForSemanticKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PKPass allSemantics](self, "allSemantics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dateForSemanticKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PKPass allSemantics](self, "allSemantics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dateValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)eventDateInfoForSemanticKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PKPass allSemantics](self, "allSemantics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "eventDateInfoValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)numberForSemanticKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PKPass allSemantics](self, "allSemantics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "numberValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)locationForSemanticKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PKPass allSemantics](self, "allSemantics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "locationValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)currencyAmountForSemanticKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PKPass allSemantics](self, "allSemantics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currencyAmountValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)personNameComponentsForSemanticKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PKPass allSemantics](self, "allSemantics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "personNameComponentsValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)stringsForSemanticKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PKPass allSemantics](self, "allSemantics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringsValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dictionariesForSemanticKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PKPass allSemantics](self, "allSemantics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dictionariesValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)supportsFeatureForCurrentDevice:(unint64_t)a3
{
  void *v5;
  void *v6;

  PKDeviceClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKOSVersionRequirement fromDeviceVersion](PKOSVersionRequirement, "fromDeviceVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[PKPass supportsFeature:forDevice:version:](self, "supportsFeature:forDevice:version:", a3, v5, v6);

  return a3;
}

- (BOOL)supportsFeature:(unint64_t)a3 forDevice:(id)a4 version:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v8 = a4;
  v9 = a5;
  PKPassFeatureTypeToString(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "features");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && objc_msgSend(v13, "enabled"))
    {
      objc_msgSend(v13, "versionRange");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
        v16 = objc_msgSend(v14, "versionMeetsRequirements:deviceClass:", v9, v8);
      else
        v16 = 1;

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_localizationKeyForMultipleDiff
{
  unint64_t v2;

  v2 = -[PKPass style](self, "style");
  if (v2 > 9)
    return CFSTR("PASS_MULTIPLE_CHANGES_BULLETIN_PASS");
  else
    return off_1E2AD4388[v2];
}

- (id)_changeMessageForFieldKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _QWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[PKPass frontFieldBuckets](self, "frontFieldBuckets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v5;
  -[PKPass backFieldBuckets](self, "backFieldBuckets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v41;
    v29 = v7;
    v27 = *(_QWORD *)v41;
    do
    {
      v10 = 0;
      v26 = v8;
      do
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v10);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v12 = v11;
        v30 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        if (v30)
        {
          v13 = *(_QWORD *)v37;
          v31 = v12;
          v28 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v37 != v13)
                objc_enumerationMutation(v12);
              v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              v32 = 0u;
              v33 = 0u;
              v34 = 0u;
              v35 = 0u;
              v16 = v15;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v33;
                while (2)
                {
                  for (j = 0; j != v18; ++j)
                  {
                    if (*(_QWORD *)v33 != v19)
                      objc_enumerationMutation(v16);
                    v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
                    objc_msgSend(v21, "key", v26);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = objc_msgSend(v22, "isEqual:", v4);

                    if ((v23 & 1) != 0)
                    {
                      objc_msgSend(v21, "changeMessage");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();

                      v7 = v29;
                      goto LABEL_26;
                    }
                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
                  if (v18)
                    continue;
                  break;
                }
              }

              v12 = v31;
              v13 = v28;
            }
            v7 = v29;
            v30 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          }
          while (v30);
        }

        ++v10;
        v9 = v27;
      }
      while (v10 != v26);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      v9 = v27;
      v24 = 0;
    }
    while (v8);
  }
  else
  {
    v24 = 0;
  }
LABEL_26:

  return v24;
}

- (id)_changeMessageForDateSemantic:(id)a3 newSemantic:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSDate *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  char v18;
  NSString *v19;
  uint64_t v20;
  void *v21;
  id result;
  char v23;
  id v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "semanticKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("originalDepartureDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("currentDepartureDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("originalArrivalDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("currentArrivalDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("originalBoardingDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("currentBoardingDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("eventStartDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("venueDoorsOpenDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("venueGatesOpenDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("venueParkingLotsOpenDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("venueBoxOfficeOpenDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("venueFanZoneOpenDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("venueOpenDate")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("venueCloseDate")))
  {

    goto LABEL_16;
  }
  v23 = objc_msgSend(v7, "isEqualToString:", CFSTR("eventEndDate"));

  if ((v23 & 1) != 0)
  {
LABEL_16:
    objc_msgSend(v5, "dateValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateValue");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("eventStartDate"), "isEqualToString:", v7) & 1) != 0)
    {
      v10 = CFSTR("SEMANTICS_EVENT_START_");
      if (!v8)
        goto LABEL_27;
    }
    else
    {
      if (!objc_msgSend(CFSTR("eventEndDate"), "isEqualToString:", v7))
      {
        v17 = 0;
LABEL_29:

        return v17;
      }
      v10 = CFSTR("SEMANTICS_EVENT_END_");
      if (!v8)
        goto LABEL_27;
    }
    v24 = v5;
    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "components:fromDate:", 96, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "components:fromDate:", 96, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "hour");
    if (v14 == objc_msgSend(v13, "hour"))
    {
      v15 = objc_msgSend(v12, "minute");
      v16 = v15 != objc_msgSend(v13, "minute");
    }
    else
    {
      v16 = 1;
    }
    v18 = objc_msgSend(v11, "isDate:equalToDate:toUnitGranularity:", v9, v8, 16);

    v5 = v24;
    if (!v16 || (v18 & 1) != 0)
    {
      if (v16)
      {
        -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("TIME_CHANGE_MESSAGE"));
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        PKTimeStringFromDate(v9, 0);
      }
      else
      {
        -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("DATE_CHANGE_MESSAGE"));
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        PKMediumDayAndLongMonthStringFromDate(v9);
      }
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
LABEL_27:
    -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("DATE_TIME_CHANGE_MESSAGE"));
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKMediumDayLongMonthAndTimeStringFromDate(v9);
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_28:
    v21 = (void *)v20;
    PKLocalizedTicketingString(v19, CFSTR("%@"), v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  __break(1u);
  return result;
}

- (id)_changeMessageForEventDateInfoSemantic:(id)a3 newSemantic:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id result;
  void *v9;
  void *v10;
  void *v11;
  NSDate *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  id v23;
  NSString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "semanticKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  result = (id)objc_msgSend(v7, "isEqualToString:", CFSTR("eventStartDateInfo"));
  if ((result & 1) != 0)
  {
    objc_msgSend(v5, "eventDateInfoValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventDateInfoValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (v11)
      {
        v28 = v9;
        v31 = v5;
        objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "components:fromDate:", 96, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "components:fromDate:", 96, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v15;
        v30 = v14;
        if ((objc_msgSend(v10, "ignoreTimeComponents") & 1) != 0)
        {
          v16 = 0;
        }
        else
        {
          v19 = objc_msgSend(v14, "hour");
          if (v19 == objc_msgSend(v15, "hour"))
          {
            v20 = objc_msgSend(v14, "minute");
            v16 = v20 != objc_msgSend(v15, "minute");
          }
          else
          {
            v16 = 1;
          }
        }
        v9 = v28;
        if ((objc_msgSend(v10, "ignoreTimeComponents") & 1) != 0)
        {
          v21 = 0;
        }
        else
        {
          v22 = objc_msgSend(v10, "ignoreTimeComponents");
          v21 = v22 ^ objc_msgSend(v28, "ignoreTimeComponents");
        }
        v18 = v16 | v21;
        v17 = objc_msgSend(v13, "isDate:equalToDate:toUnitGranularity:", v12, v11, 16);

        if (v17)
        {
          v5 = v31;
          if (!v18)
            goto LABEL_22;
        }
        else
        {
          v5 = v31;
        }
      }
      else
      {
        v17 = 0;
        v18 = objc_msgSend(v10, "ignoreTimeComponents") ^ 1;
      }
      if (objc_msgSend(CFSTR("eventStartDateInfo"), "isEqualToString:", v7))
      {
        if (((v17 | v18 ^ 1) & 1) != 0)
        {
          v23 = v5;
          if (v18)
          {
            objc_msgSend(CFSTR("SEMANTICS_EVENT_START_"), "stringByAppendingString:", CFSTR("TIME_CHANGE_MESSAGE"));
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            PKTimeStringFromDate(v12, 0);
          }
          else
          {
            objc_msgSend(CFSTR("SEMANTICS_EVENT_START_"), "stringByAppendingString:", CFSTR("DATE_CHANGE_MESSAGE"));
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            PKMediumDayAndLongMonthStringFromDate(v12);
          }
          v25 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = v5;
          objc_msgSend(CFSTR("SEMANTICS_EVENT_START_"), "stringByAppendingString:", CFSTR("DATE_TIME_CHANGE_MESSAGE"));
          v24 = (NSString *)objc_claimAutoreleasedReturnValue();
          PKMediumDayLongMonthAndTimeStringFromDate(v12);
          v25 = objc_claimAutoreleasedReturnValue();
        }
        v27 = (void *)v25;
        PKLocalizedTicketingString(v24, CFSTR("%@"), v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v23;
        goto LABEL_26;
      }
    }
LABEL_22:
    v26 = 0;
LABEL_26:

    return v26;
  }
  __break(1u);
  return result;
}

- (id)_changeMessageForDictionariesSemantic:(id)a3 newSemantic:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  int v9;
  char v10;
  id result;
  id v12;
  id v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "semanticKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("seats")))
  {
    _os_feature_enabled_impl();

  }
  else
  {
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("wifiAccess"));
    v9 = _os_feature_enabled_impl();
    if (!v9 || (v8 & 1) != 0)
      v10 = v9 | v8;
    else
      v10 = objc_msgSend(v7, "isEqualToString:", CFSTR("airPlay"));

    if ((v10 & 1) == 0)
    {
      __break(1u);
      return result;
    }
  }
  if (objc_msgSend(CFSTR("seats"), "isEqualToString:", v7))
  {
    v12 = -[PKSeatingInformation initFromSemantic:]([PKSeatingInformation alloc], "initFromSemantic:", v5);
    v13 = -[PKSeatingInformation initFromSemantic:]([PKSeatingInformation alloc], "initFromSemantic:", v6);
    objc_msgSend(v13, "changeMessageFromInformation:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_changeMessageForSemantic:(id)a3 newSemantic:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v12;
  id v13;
  int v14;
  int v15;
  char v16;
  int v17;
  __CFString *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  NSObject *v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "semanticKey");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("originalDepartureDate")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("currentDepartureDate")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("originalArrivalDate")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("currentArrivalDate")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("originalBoardingDate")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("currentBoardingDate")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("eventStartDate")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("venueDoorsOpenDate")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("venueGatesOpenDate")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("venueParkingLotsOpenDate")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("venueBoxOfficeOpenDate")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("venueFanZoneOpenDate")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("venueOpenDate")) & 1) == 0
    && !objc_msgSend(v8, "isEqualToString:", CFSTR("venueCloseDate")))
  {
    v12 = objc_msgSend(v8, "isEqualToString:", CFSTR("eventEndDate"));

    if (v12)
      goto LABEL_16;
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("eventStartDateInfo")))
    {
      -[PKPass _changeMessageForEventDateInfoSemantic:newSemantic:](self, "_changeMessageForEventDateInfoSemantic:newSemantic:", v6, v7);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    v13 = v8;
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("seats")))
    {
      _os_feature_enabled_impl();

LABEL_24:
      -[PKPass _changeMessageForDictionariesSemantic:newSemantic:](self, "_changeMessageForDictionariesSemantic:newSemantic:", v6, v7);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("wifiAccess"));
    v15 = _os_feature_enabled_impl();
    if (!v15 || (v14 & 1) != 0)
    {
      v17 = v15 | v14;

      if (v17 == 1)
        goto LABEL_24;
    }
    else
    {
      v16 = objc_msgSend(v13, "isEqualToString:", CFSTR("airPlay"));

      if ((v16 & 1) != 0)
        goto LABEL_24;
    }
    if (objc_msgSend(CFSTR("eventName"), "isEqualToString:", v13))
    {
      v18 = CFSTR("SEMANTICS_EVENT_NAME_CHANGE_MESSAGE");
LABEL_34:
      PKLocalizedTicketingString(&v18->isa, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    if (objc_msgSend(CFSTR("performerNames"), "isEqualToString:", v13))
    {
      v18 = CFSTR("SEMANTICS_PERFORMER_NAMES_CHANGE_MESSAGE");
      goto LABEL_34;
    }
    if (objc_msgSend(CFSTR("venueEntrance"), "isEqualToString:", v13))
    {
      PKLocalizedTicketingString(CFSTR("SEMANTICS_VENUE_ENTRANCE_CHANGE_MESSAGE"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        PKValidateChangeMessage(v19);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          v21 = v13;
          if ((objc_msgSend(v21, "isEqualToString:", CFSTR("departureLocationDescription")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("destinationLocationDescription")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("transitProvider")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("vehicleName")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("vehicleNumber")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("vehicleType")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("boardingGroup")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("boardingSequenceNumber")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("confirmationNumber")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("transitStatus")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("transitStatusReason")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("membershipProgramName")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("membershipProgramNumber")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("priorityStatus")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("securityScreening")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("flightCode")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("airlineCode")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("departureAirportCode")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("departureAirportName")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("departureTerminal")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("departureGate")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("destinationAirportCode")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("destinationAirportName")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("destinationTerminal")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("destinationGate")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("departurePlatform")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("departureStationName")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("destinationPlatform")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("destinationStationName")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("carNumber")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("eventName")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("venueName")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("venueEntrance")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("venueRoom")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("venuePhoneNumber")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("leagueName")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("leagueAbbreviation")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("homeTeamLocation")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("homeTeamName")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("homeTeamAbbreviation")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("awayTeamLocation")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("awayTeamName")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("awayTeamAbbreviation")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("sportName")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("genre")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("eventLiveMessage")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("admissionLevel")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("admissionLevelAbbreviation")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("attendeeName")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("venueRegionName")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("entranceDescription")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("venueEntranceGate")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("venueEntranceDoor")) & 1) != 0
            || (objc_msgSend(v21, "isEqualToString:", CFSTR("venueEntrancePortal")) & 1) != 0
            || objc_msgSend(v21, "isEqualToString:", CFSTR("additionalTicketAttributes")))
          {

          }
          else
          {
            v30 = objc_msgSend(v21, "isEqualToString:", CFSTR("eventType"));

            if (!v30)
            {
              PKLogFacilityTypeGetObject(0);
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v33 = v21;
                _os_log_impl(&dword_18FC92000, v31, OS_LOG_TYPE_DEFAULT, "Ignoring changeMessage formatting for unknown or unsupported semantic key %@.", buf, 0xCu);
              }

              v29 = 0;
              goto LABEL_95;
            }
          }
          objc_msgSend(v7, "stringValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          PKStringWithValidatedFormat(v20, CFSTR("%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v22);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_95:
          v20 = v29;
          v19 = 0;
          v10 = v20;
LABEL_98:

          goto LABEL_18;
        }
      }
    }
    else
    {
      v20 = 0;
      v19 = 0;
    }
    v10 = 0;
    goto LABEL_98;
  }

LABEL_16:
  -[PKPass _changeMessageForDateSemantic:newSemantic:](self, "_changeMessageForDateSemantic:newSemantic:", v6, v7);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v10 = (void *)v9;
LABEL_18:

  return v10;
}

- (NSArray)embeddedLocationsArray
{
  return self->_embeddedLocations;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setPassURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (BOOL)isRemotePass
{
  return self->_remotePass;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)passLibraryMachServiceName
{
  return self->_passLibraryMachServiceName;
}

- (NSNumber)sequenceCounter
{
  return self->_sequenceCounter;
}

- (BOOL)isCloudKitArchived
{
  return self->_isCloudKitArchived;
}

- (NSData)cloudKitMetadata
{
  return self->_cloudKitMetadata;
}

- (BOOL)isCloudKitSecurelyArchived
{
  return self->_isCloudKitSecurelyArchived;
}

- (NSData)cloudKitSecureMetadata
{
  return self->_cloudKitSecureMetadata;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (NSString)groupingID
{
  return self->_groupingID;
}

- (NSSet)embeddedBeacons
{
  return self->_embeddedBeacons;
}

- (NSURL)webLocationsURL
{
  return self->_webLocationsURL;
}

- (void)setWebLocationsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void)setLocalLocationsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (int64_t)sharingMethod
{
  return self->_sharingMethod;
}

- (NSURL)sharingURL
{
  return self->_sharingURL;
}

- (NSString)sharingText
{
  return self->_sharingText;
}

- (NSSet)associatedPassTypeIdentifiers
{
  return self->_associatedPassTypeIdentifiers;
}

- (NSURL)transferURL
{
  return self->_transferURL;
}

- (void)setTransferURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSURL)sellURL
{
  return self->_sellURL;
}

- (void)setSellURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSURL)bagPolicyURL
{
  return self->_bagPolicyURL;
}

- (void)setBagPolicyURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSURL)orderFoodURL
{
  return self->_orderFoodURL;
}

- (void)setOrderFoodURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSURL)transitInformationURL
{
  return self->_transitInformationURL;
}

- (void)setTransitInformationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSURL)parkingInformationURL
{
  return self->_parkingInformationURL;
}

- (void)setParkingInformationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSURL)directionsInformationURL
{
  return self->_directionsInformationURL;
}

- (void)setDirectionsInformationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSURL)merchandiseURL
{
  return self->_merchandiseURL;
}

- (void)setMerchandiseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSURL)accessibilityURL
{
  return self->_accessibilityURL;
}

- (void)setAccessibilityURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSURL)purchaseParkingURL
{
  return self->_purchaseParkingURL;
}

- (void)setPurchaseParkingURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (NSURL)partnerAddOnURL
{
  return self->_partnerAddOnURL;
}

- (void)setPartnerAddOnURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (NSURL)contactVenuePhoneNumber
{
  return self->_contactVenuePhoneNumber;
}

- (void)setContactVenuePhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSURL)contactVenueEmail
{
  return self->_contactVenueEmail;
}

- (void)setContactVenueEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (NSURL)contactVenueWebsite
{
  return self->_contactVenueWebsite;
}

- (void)setContactVenueWebsite:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (BOOL)hasStoredValue
{
  return self->_hasStoredValue;
}

- (PKImage)partialFrontFaceImagePlaceholder
{
  return self->_partialFrontFaceImagePlaceholder;
}

- (BOOL)liveRenderedBackground
{
  return self->_liveRenderedBackground;
}

- (unint64_t)homeKeyLiveRenderType
{
  return self->_homeKeyLiveRenderType;
}

- (NSString)provisioningCredentialHash
{
  return self->_provisioningCredentialHash;
}

- (void)setCardholderInfoSectionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (BOOL)muteReadyForUseNotification
{
  return self->_muteReadyForUseNotification;
}

- (BOOL)supportsLifecycleUpdates
{
  return self->_supportsLifecycleUpdates;
}

- (void)setSupportsLifecycleUpdates:(BOOL)a3
{
  self->_supportsLifecycleUpdates = a3;
}

- (NSDate)ingestedDate
{
  return self->_ingestedDate;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (BOOL)hasFlightDetails
{
  void *v3;
  BOOL v4;

  if (-[PKPass style](self, "style") != 4
    || -[PKPass transitType](self, "transitType") != 1
    || !-[PKPass flightNumber](self, "flightNumber"))
  {
    return 0;
  }
  -[PKPass flightCode](self, "flightCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (unint64_t)flightNumber
{
  void *v2;
  unint64_t v3;

  -[PKPass numberForSemanticKey:](self, "numberForSemanticKey:", CFSTR("flightNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (NSString)airlineCode
{
  void *v2;
  void *v3;

  -[PKPass stringForSemanticKey:](self, "stringForSemanticKey:", CFSTR("airlineCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)flightCode
{
  void *v3;
  unint64_t v4;
  void *v5;

  -[PKPass airlineCode](self, "airlineCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPass flightNumber](self, "flightNumber");
  v5 = 0;
  if (objc_msgSend(v3, "length") && v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%ld"), v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v5;
}

- (void)loadFlightsWithCompletionHandler:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  Class v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  uint64_t v26;

  v4 = a3;
  v5 = -[PKPass flightNumber](self, "flightNumber");
  -[PKPass airlineCode](self, "airlineCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass dateForSemanticKey:](self, "dateForSemanticKey:", CFSTR("currentDepartureDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass dateForSemanticKey:](self, "dateForSemanticKey:", CFSTR("originalDepartureDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass dateForSemanticKey:](self, "dateForSemanticKey:", CFSTR("currentArrivalDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPass dateForSemanticKey:](self, "dateForSemanticKey:", CFSTR("originalArrivalDate"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v20 = v9;
  if (v7)
  {
    v12 = 1;
    v9 = v7;
  }
  else if (v8)
  {
    v12 = 1;
    v9 = v8;
  }
  else if (v9)
  {
    v12 = 2;
  }
  else
  {
    if (!v10)
    {
      v13 = 0;
      v12 = 3;
      goto LABEL_10;
    }
    v12 = 2;
    v9 = (void *)v10;
  }
  v13 = v9;
LABEL_10:
  v14 = _MergedGlobals_181();
  off_1ECF21BE0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)-[objc_class flightFactoryClassWithProvider:](v14, "flightFactoryClassWithProvider:", v15);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __51__PKPass_Flight__loadFlightsWithCompletionHandler___block_invoke;
  v21[3] = &unk_1E2AD6FA8;
  v22 = v6;
  v23 = v13;
  v25 = v5;
  v26 = v12;
  v24 = v4;
  v17 = v4;
  v18 = v13;
  v19 = v6;
  objc_msgSend(v16, "loadFlightsWithNumber:airlineCode:date:dateType:completionHandler:", v5, v19, v18, v12, v21);

}

void __51__PKPass_Flight__loadFlightsWithCompletionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    PKLogFacilityTypeGetObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v9 = a1[5];
      v10 = a1[7];
      v11 = a1[8];
      v12 = 134219010;
      v13 = v10;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2048;
      v19 = v11;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Could not find flights matching flightNumber: %ld, airlineCode: %@, date: %@, dateType: %ld, error: %@", (uint8_t *)&v12, 0x34u);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();

}

@end
