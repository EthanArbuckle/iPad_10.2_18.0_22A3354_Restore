@implementation PKPaymentMarket

- (PKPaymentMarket)initWithDictionary:(id)a3 forDeviceClass:(id)a4 version:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPaymentMarket *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *identifier;
  void *v22;
  uint64_t v23;
  NSString *region;
  void *v25;
  uint64_t v26;
  NSDictionary *localizedNames;
  void *v28;
  uint64_t v29;
  NSString *notificationAssetIdentifier;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSString *v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  int v40;
  NSObject *v41;
  const __CFString *v42;
  NSString *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSDictionary *renotifyCampaigns;
  uint64_t v48;
  id v49;
  NSObject *v50;
  NSString *v51;
  NSObject *v52;
  NSString *v53;
  uint64_t v54;
  NSDictionary *v55;
  void *v56;
  id v57;
  uint64_t v58;
  PKPaymentMarket *v59;
  id v60;
  uint64_t v61;
  NSSet *geoFences;
  id v63;
  void (**v64)(void *, const __CFString *, id, id);
  id v65;
  id v66;
  uint64_t v67;
  NSSet *supportedCredentialTypes;
  uint64_t v69;
  NSSet *supportedTransitNetworks;
  id v71;
  id v72;
  uint64_t v73;
  NSSet *expressCredentialTypes;
  uint64_t v75;
  NSSet *expressTransitNetworks;
  void *v77;
  void *v78;
  char v79;
  void *v80;
  char v81;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  uint64_t v89;
  void *v90;
  _QWORD aBlock[4];
  id v92;
  id v93;
  id v94;
  _QWORD v95[4];
  PKPaymentMarket *v96;
  id v97;
  objc_super v98;
  uint8_t buf[4];
  uint64_t v100;
  __int16 v101;
  NSString *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v98.receiver = self;
  v98.super_class = (Class)PKPaymentMarket;
  v11 = -[PKPaymentMarket init](&v98, sel_init);
  if (!v11)
    goto LABEL_55;
  objc_msgSend(v8, "PKStringForKey:", CFSTR("Type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((objc_msgSend(v12, "isEqual:", CFSTR("transit")) & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      v15 = objc_msgSend(v13, "isEqual:", CFSTR("access"));
      v14 = 2;
      if (!v15)
        v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }
  v11->_type = v14;

  objc_msgSend(v8, "PKStringForKey:", CFSTR("Classification"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((objc_msgSend(v16, "isEqual:", CFSTR("locality")) & 1) != 0)
    {
      v18 = 1;
    }
    else if ((objc_msgSend(v17, "isEqual:", CFSTR("country")) & 1) != 0)
    {
      v18 = 2;
    }
    else if (objc_msgSend(v17, "isEqual:", CFSTR("administrativeArea")))
    {
      v18 = 3;
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  v11->_classification = v18;
  objc_msgSend(v8, "PKStringForKey:", CFSTR("Identifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "copy");
  identifier = v11->_identifier;
  v11->_identifier = (NSString *)v20;

  objc_msgSend(v8, "PKStringForKey:", CFSTR("Region"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "copy");
  region = v11->_region;
  v11->_region = (NSString *)v23;

  objc_msgSend(v8, "PKDictionaryForKey:", CFSTR("LocalizedName"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "copy");
  localizedNames = v11->_localizedNames;
  v11->_localizedNames = (NSDictionary *)v26;

  objc_msgSend(v8, "PKStringForKey:", CFSTR("NotificationAssetIdentifier"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "copy");
  notificationAssetIdentifier = v11->_notificationAssetIdentifier;
  v11->_notificationAssetIdentifier = (NSString *)v29;

  v11->_expressUpgradeHideDisableAction = 0;
  v11->_expressUpgradePromoteDuration = 604800.0;
  objc_msgSend(v8, "PKDictionaryForKey:", CFSTR("OpenLoopExpressUpgrade"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  PKOverrideMarketGeoExpressUpgradePromotionDuration();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  PKOverrideMarketGeoExpressUpgradeHideDisableExpressModeAction();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    PKLogFacilityTypeGetObject(0xCuLL);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v11->_identifier;
      *(_DWORD *)buf = 138412546;
      v100 = (uint64_t)v32;
      v101 = 2112;
      v102 = v35;
      _os_log_impl(&dword_18FC92000, v34, OS_LOG_TYPE_DEFAULT, "PKPaymentMarket: Overriding open loop express upgrade promoted duration with %@ for market %@ due to internal settings", buf, 0x16u);
    }

    objc_msgSend(v32, "doubleValue");
    v11->_expressUpgradePromoteDuration = v36;
  }
  else if (v31)
  {
    objc_msgSend(v31, "PKNumberForKey:", CFSTR("PromoteDuration"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      objc_msgSend(v37, "doubleValue");
      v11->_expressUpgradePromoteDuration = v39;
    }

  }
  if (v33)
  {
    v40 = objc_msgSend(v33, "BOOLValue");
    PKLogFacilityTypeGetObject(0xCuLL);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = CFSTR("NO");
      v43 = v11->_identifier;
      if (v40)
        v42 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v100 = (uint64_t)v42;
      v101 = 2112;
      v102 = v43;
      _os_log_impl(&dword_18FC92000, v41, OS_LOG_TYPE_DEFAULT, "PKPaymentMarket: Overriding open loop express upgrade hide disable express mode action to %@ for market %@ due to internal settings", buf, 0x16u);
    }

    goto LABEL_33;
  }
  objc_msgSend(v31, "objectForKey:", CFSTR("HideDisableExpressAction"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v40 = objc_msgSend(v31, "PKBoolForKey:", CFSTR("HideDisableExpressAction"));
LABEL_33:
    v45 = 1;
    if (!v40)
      v45 = 2;
    v11->_expressUpgradeHideDisableAction = v45;
  }
  objc_msgSend(v8, "PKDictionaryForKey:", CFSTR("RenotifyCampaigns"));
  v46 = objc_claimAutoreleasedReturnValue();
  renotifyCampaigns = v11->_renotifyCampaigns;
  v11->_renotifyCampaigns = (NSDictionary *)v46;

  PKOverrideMarketGeoRenotifyDCICampaignIdentifier();
  v48 = objc_claimAutoreleasedReturnValue();
  PKOverrideMarketGeoExpressOpenLoopNotificationIdentifier();
  v89 = objc_claimAutoreleasedReturnValue();
  v90 = (void *)v48;
  if (v48 | v89)
  {
    v49 = (id)-[NSDictionary mutableCopy](v11->_renotifyCampaigns, "mutableCopy");
    if (!v49)
      v49 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v90)
    {
      PKLogFacilityTypeGetObject(0xCuLL);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = v11->_identifier;
        *(_DWORD *)buf = 138412546;
        v100 = (uint64_t)v90;
        v101 = 2112;
        v102 = v51;
        _os_log_impl(&dword_18FC92000, v50, OS_LOG_TYPE_DEFAULT, "PKPaymentMarket: Overriding DCI renotify campaign identifier to %@ for market %@ due to internal settings", buf, 0x16u);
      }

      objc_msgSend(v49, "setObject:forKeyedSubscript:", v90, CFSTR("DCI"));
    }
    if (v89)
    {
      PKLogFacilityTypeGetObject(0xCuLL);
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = v11->_identifier;
        *(_DWORD *)buf = 138412546;
        v100 = v89;
        v101 = 2112;
        v102 = v53;
        _os_log_impl(&dword_18FC92000, v52, OS_LOG_TYPE_DEFAULT, "PKPaymentMarket: Overriding open loop renotify campaign identifier to %@ for market %@ due to internal settings", buf, 0x16u);
      }

      objc_msgSend(v49, "setObject:forKeyedSubscript:", v89, CFSTR("OpenLoop"));
    }
    v54 = objc_msgSend(v49, "copy");
    v55 = v11->_renotifyCampaigns;
    v11->_renotifyCampaigns = (NSDictionary *)v54;

  }
  v84 = v33;
  v85 = v32;
  v86 = v31;
  objc_msgSend(v8, "PKArrayForKey:", CFSTR("GeoFences"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v58 = MEMORY[0x1E0C809B0];
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __61__PKPaymentMarket_initWithDictionary_forDeviceClass_version___block_invoke;
  v95[3] = &unk_1E2AC2D50;
  v59 = v11;
  v96 = v59;
  v60 = v57;
  v97 = v60;
  v83 = v56;
  objc_msgSend(v56, "enumerateObjectsUsingBlock:", v95);
  v61 = objc_msgSend(v60, "copy");
  geoFences = v59->_geoFences;
  v59->_geoFences = (NSSet *)v61;

  aBlock[0] = v58;
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PKPaymentMarket_initWithDictionary_forDeviceClass_version___block_invoke_2;
  aBlock[3] = &unk_1E2AC2DA0;
  v63 = v8;
  v92 = v63;
  v87 = v10;
  v93 = v10;
  v88 = v9;
  v94 = v9;
  v64 = (void (**)(void *, const __CFString *, id, id))_Block_copy(aBlock);
  v65 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v66 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v64[2](v64, CFSTR("SupportedCredentials"), v65, v66);
  v67 = objc_msgSend(v65, "copy");
  supportedCredentialTypes = v59->_supportedCredentialTypes;
  v59->_supportedCredentialTypes = (NSSet *)v67;

  v69 = objc_msgSend(v66, "copy");
  supportedTransitNetworks = v59->_supportedTransitNetworks;
  v59->_supportedTransitNetworks = (NSSet *)v69;

  v71 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v72 = objc_alloc_init(MEMORY[0x1E0C99E20]);

  v64[2](v64, CFSTR("ExpressEnabledCredentials"), v71, v72);
  v73 = objc_msgSend(v71, "copy");
  expressCredentialTypes = v59->_expressCredentialTypes;
  v59->_expressCredentialTypes = (NSSet *)v73;

  v75 = objc_msgSend(v72, "copy");
  expressTransitNetworks = v59->_expressTransitNetworks;
  v59->_expressTransitNetworks = (NSSet *)v75;

  objc_msgSend(v63, "objectForKey:", CFSTR("productsRequiredForRegion"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v77;
  if (v77)
    v79 = objc_msgSend(v77, "BOOLValue");
  else
    v79 = 1;
  v59->_productsRequiredForRegion = v79;
  objc_msgSend(v63, "objectForKey:", CFSTR("shouldConsiderCellularRegion"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80
    || (objc_msgSend(v63, "objectForKey:", CFSTR("shouldConsiderCelluarRegion")),
        (v80 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v81 = objc_msgSend(v80, "BOOLValue");

  }
  else
  {
    v81 = 1;
  }
  v59->_shouldConsiderCellularRegion = v81;

  v10 = v87;
  v9 = v88;
LABEL_55:

  return v11;
}

void __61__PKPaymentMarket_initWithDictionary_forDeviceClass_version___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_geoFenceWithDictionary:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

void __61__PKPaymentMarket_initWithDictionary_forDeviceClass_version___block_invoke_2(id *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a1[4], "PKArrayForKey:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__PKPaymentMarket_initWithDictionary_forDeviceClass_version___block_invoke_3;
  v12[3] = &unk_1E2AC2D78;
  v13 = a1[5];
  v14 = a1[6];
  v15 = v7;
  v16 = v8;
  v9 = v8;
  v10 = v7;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

}

void __61__PKPaymentMarket_initWithDictionary_forDeviceClass_version___block_invoke_3(uint64_t a1, void *a2)
{
  PKOSVersionRequirementRange *v3;
  void *v4;
  PKOSVersionRequirementRange *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = [PKOSVersionRequirementRange alloc];
  objc_msgSend(v8, "PKDictionaryForKey:", CFSTR("OSVersions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKOSVersionRequirementRange initWithDictionary:](v3, "initWithDictionary:", v4);

  if (-[PKOSVersionRequirementRange versionMeetsRequirements:deviceClass:](v5, "versionMeetsRequirements:deviceClass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v8, "PKNumberForKey:", CFSTR("CardType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    objc_msgSend(v8, "PKStringForKey:", CFSTR("TransitNetworkIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);

  }
}

- (PKPaymentMarket)initWithCoder:(id)a3
{
  id v4;
  PKPaymentMarket *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *region;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *localizedNames;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSSet *geoFences;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSSet *supportedCredentialTypes;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSSet *expressCredentialTypes;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSSet *supportedTransitNetworks;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSSet *expressTransitNetworks;
  uint64_t v40;
  NSString *notificationAssetIdentifier;
  uint64_t v42;
  NSDictionary *renotifyCampaigns;
  double v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKPaymentMarket;
  v5 = -[PKPaymentMarket init](&v46, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_classification = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("classification"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
    v8 = objc_claimAutoreleasedReturnValue();
    region = v5->_region;
    v5->_region = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("localizedNames"));
    v13 = objc_claimAutoreleasedReturnValue();
    localizedNames = v5->_localizedNames;
    v5->_localizedNames = (NSDictionary *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("geoFences"));
    v18 = objc_claimAutoreleasedReturnValue();
    geoFences = v5->_geoFences;
    v5->_geoFences = (NSSet *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("supportedCredentialTypes"));
    v23 = objc_claimAutoreleasedReturnValue();
    supportedCredentialTypes = v5->_supportedCredentialTypes;
    v5->_supportedCredentialTypes = (NSSet *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("expressCredentialTypes"));
    v28 = objc_claimAutoreleasedReturnValue();
    expressCredentialTypes = v5->_expressCredentialTypes;
    v5->_expressCredentialTypes = (NSSet *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("supportedTransitNetworks"));
    v33 = objc_claimAutoreleasedReturnValue();
    supportedTransitNetworks = v5->_supportedTransitNetworks;
    v5->_supportedTransitNetworks = (NSSet *)v33;

    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("expressTransitNetworks"));
    v38 = objc_claimAutoreleasedReturnValue();
    expressTransitNetworks = v5->_expressTransitNetworks;
    v5->_expressTransitNetworks = (NSSet *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationAssetIdentifier"));
    v40 = objc_claimAutoreleasedReturnValue();
    notificationAssetIdentifier = v5->_notificationAssetIdentifier;
    v5->_notificationAssetIdentifier = (NSString *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("renotifyCampaigns"));
    v42 = objc_claimAutoreleasedReturnValue();
    renotifyCampaigns = v5->_renotifyCampaigns;
    v5->_renotifyCampaigns = (NSDictionary *)v42;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("expressUpgradePromotionDuration"));
    v5->_expressUpgradePromoteDuration = v44;
    v5->_expressUpgradeHideDisableAction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("expressUpgradeHideDisableAction"));
    v5->_productsRequiredForRegion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("productsRequiredForRegion"));
    v5->_shouldConsiderCellularRegion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldConsiderCellularRegion"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_classification, CFSTR("classification"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_region, CFSTR("region"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedNames, CFSTR("localizedNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_geoFences, CFSTR("geoFences"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedCredentialTypes, CFSTR("supportedCredentialTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expressCredentialTypes, CFSTR("expressCredentialTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedTransitNetworks, CFSTR("supportedTransitNetworks"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expressTransitNetworks, CFSTR("expressTransitNetworks"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notificationAssetIdentifier, CFSTR("notificationAssetIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_renotifyCampaigns, CFSTR("renotifyCampaigns"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("expressUpgradePromotionDuration"), self->_expressUpgradePromoteDuration);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_expressUpgradeHideDisableAction, CFSTR("expressUpgradeHideDisableAction"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_productsRequiredForRegion, CFSTR("productsRequiredForRegion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldConsiderCellularRegion, CFSTR("shouldConsiderCellularRegion"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *identifier;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentMarket;
  -[PKPaymentMarket description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  -[PKPaymentMarket notificationAssetIdentifier](self, "notificationAssetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMarket englishName](self, "englishName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { Identifier: %@, NotificationAssetIdentifier: %@, Name: %@, RenotifyCampaigns: %@ }"), v4, identifier, v6, v7, self->_renotifyCampaigns);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)englishName
{
  return -[NSDictionary PKStringForKey:](self->_localizedNames, "PKStringForKey:", CFSTR("en"));
}

- (id)analyticsReportingNameValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *identifier;
  void *v9;

  -[PKPaymentMarket englishName](self, "englishName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    -[PKPaymentMarket name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  if (objc_msgSend(v6, "length"))
  {
    v7 = v6;
  }
  else
  {
    identifier = (const __CFString *)self->_identifier;
    if (!identifier)
      identifier = CFSTR("unknown");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Market ID: %@"), identifier);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  return v9;
}

- (NSString)name
{
  NSDictionary *localizedNames;
  void *v3;
  void *v4;

  localizedNames = self->_localizedNames;
  objc_msgSend(MEMORY[0x1E0C99DC8], "pk_deviceLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary PKStringForKey:](localizedNames, "PKStringForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)renotifyOpenLoopCampaignIdentifier
{
  return (NSString *)-[NSDictionary PKStringForKey:](self->_renotifyCampaigns, "PKStringForKey:", CFSTR("OpenLoop"));
}

- (NSString)renotifyDCICampaignIdentifier
{
  return (NSString *)-[NSDictionary PKStringForKey:](self->_renotifyCampaigns, "PKStringForKey:", CFSTR("DCI"));
}

- (NSString)notificationAssetIdentifier
{
  NSString *notificationAssetIdentifier;

  notificationAssetIdentifier = self->_notificationAssetIdentifier;
  if (!notificationAssetIdentifier)
    notificationAssetIdentifier = self->_identifier;
  return notificationAssetIdentifier;
}

- (BOOL)containsLocation:(id)a3
{
  id v4;
  NSSet *geoFences;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  geoFences = self->_geoFences;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__PKPaymentMarket_containsLocation___block_invoke;
  v8[3] = &unk_1E2AC2DC8;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[NSSet enumerateObjectsUsingBlock:](geoFences, "enumerateObjectsUsingBlock:", v8);
  LOBYTE(geoFences) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)geoFences;
}

uint64_t __36__PKPaymentMarket_containsLocation___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsLocation:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (double)shortestDistanceFromLocation:(id)a3
{
  id v4;
  uint64_t v5;
  NSSet *geoFences;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = (double *)&v13;
  v5 = *MEMORY[0x1E0C9E318];
  v15 = 0x2020000000;
  v16 = v5;
  geoFences = self->_geoFences;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__PKPaymentMarket_shortestDistanceFromLocation___block_invoke;
  v10[3] = &unk_1E2AC2DC8;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  -[NSSet enumerateObjectsUsingBlock:](geoFences, "enumerateObjectsUsingBlock:", v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __48__PKPaymentMarket_shortestDistanceFromLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  double v4;
  uint64_t v5;

  result = objc_msgSend(a2, "distanceFromLocation:", *(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v4 < *(double *)(v5 + 24))
    *(double *)(v5 + 24) = v4;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char isKindOfClass;
  char v6;
  NSString *identifier;
  NSString *v8;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    identifier = self->_identifier;
    v8 = (NSString *)v4[10];
    if (identifier && v8)
      v6 = -[NSString isEqual:](identifier, "isEqual:");
    else
      v6 = identifier == v8;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (id)_geoFenceWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  PKPaymentMarketCircularGeoFence *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "PKStringForKey:", CFSTR("Type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isEqual:", CFSTR("circle")))
  {
    v6 = -[PKPaymentMarketCircularGeoFence initWithDictionary:]([PKPaymentMarketCircularGeoFence alloc], "initWithDictionary:", v3);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "unsupported geo fence type %@", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)classification
{
  return self->_classification;
}

- (unint64_t)expressUpgradeHideDisableAction
{
  return self->_expressUpgradeHideDisableAction;
}

- (double)expressUpgradePromoteDuration
{
  return self->_expressUpgradePromoteDuration;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)region
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSSet)supportedCredentialTypes
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (NSSet)expressCredentialTypes
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (NSSet)supportedTransitNetworks
{
  return (NSSet *)objc_getProperty(self, a2, 112, 1);
}

- (NSSet)expressTransitNetworks
{
  return (NSSet *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)productsRequiredForRegion
{
  return self->_productsRequiredForRegion;
}

- (BOOL)shouldConsiderCellularRegion
{
  return self->_shouldConsiderCellularRegion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressTransitNetworks, 0);
  objc_storeStrong((id *)&self->_supportedTransitNetworks, 0);
  objc_storeStrong((id *)&self->_expressCredentialTypes, 0);
  objc_storeStrong((id *)&self->_supportedCredentialTypes, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_geoFences, 0);
  objc_storeStrong((id *)&self->_renotifyCampaigns, 0);
  objc_storeStrong((id *)&self->_notificationAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedNames, 0);
}

@end
