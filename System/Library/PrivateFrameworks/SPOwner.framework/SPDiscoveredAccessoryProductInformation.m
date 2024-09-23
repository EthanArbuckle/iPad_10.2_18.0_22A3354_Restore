@implementation SPDiscoveredAccessoryProductInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setBeaconGroupVersion:", -[SPDiscoveredAccessoryProductInformation beaconGroupVersion](self, "beaconGroupVersion"));
  objc_msgSend(v4, "setEligibleForPairing:", -[SPDiscoveredAccessoryProductInformation eligibleForPairing](self, "eligibleForPairing"));
  objc_msgSend(v4, "setHidden:", -[SPDiscoveredAccessoryProductInformation hidden](self, "hidden"));
  objc_msgSend(v4, "setIsHELEAccessory:", -[SPDiscoveredAccessoryProductInformation isHELEAccessory](self, "isHELEAccessory"));
  objc_msgSend(v4, "setIsManagedAccessory:", -[SPDiscoveredAccessoryProductInformation isManagedAccessory](self, "isManagedAccessory"));
  objc_msgSend(v4, "setSupportBeaconGroupInfo:", -[SPDiscoveredAccessoryProductInformation supportBeaconGroupInfo](self, "supportBeaconGroupInfo"));
  -[SPDiscoveredAccessoryProductInformation findmyProductId](self, "findmyProductId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setFindmyProductId:", v6);

  -[SPDiscoveredAccessoryProductInformation modelName](self, "modelName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setModelName:", v8);

  -[SPDiscoveredAccessoryProductInformation manufacturerName](self, "manufacturerName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setManufacturerName:", v10);

  -[SPDiscoveredAccessoryProductInformation defaultRole](self, "defaultRole");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setDefaultRole:", v12);

  -[SPDiscoveredAccessoryProductInformation appBundleIdentifier](self, "appBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setAppBundleIdentifier:", v14);

  -[SPDiscoveredAccessoryProductInformation lowBatteryInfoURL](self, "lowBatteryInfoURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setLowBatteryInfoURL:", v16);

  -[SPDiscoveredAccessoryProductInformation disableURL](self, "disableURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setDisableURL:", v18);

  -[SPDiscoveredAccessoryProductInformation version](self, "version");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setVersion:", v20);

  -[SPDiscoveredAccessoryProductInformation encryptionKeyE1](self, "encryptionKeyE1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setEncryptionKeyE1:", v22);

  -[SPDiscoveredAccessoryProductInformation encryptionKeyE2](self, "encryptionKeyE2");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setEncryptionKeyE2:", v24);

  -[SPDiscoveredAccessoryProductInformation verificationKeyS2](self, "verificationKeyS2");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setVerificationKeyS2:", v26);

  -[SPDiscoveredAccessoryProductInformation txPower](self, "txPower");
  objc_msgSend(v4, "setTxPower:");
  objc_msgSend(v4, "setIsAirTag:", -[SPDiscoveredAccessoryProductInformation isAirTag](self, "isAirTag"));
  objc_msgSend(v4, "setIsAppleAudioAccessory:", -[SPDiscoveredAccessoryProductInformation isAppleAudioAccessory](self, "isAppleAudioAccessory"));
  objc_msgSend(v4, "setCapabilities:", -[SPDiscoveredAccessoryProductInformation capabilities](self, "capabilities"));
  -[SPDiscoveredAccessoryProductInformation layoutTemplate](self, "layoutTemplate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setLayoutTemplate:", v28);

  -[SPDiscoveredAccessoryProductInformation defaultHeroIcon](self, "defaultHeroIcon");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setDefaultHeroIcon:", v30);

  -[SPDiscoveredAccessoryProductInformation defaultListIcon](self, "defaultListIcon");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setDefaultListIcon:", v32);

  -[SPDiscoveredAccessoryProductInformation defaultHeroIcon2x](self, "defaultHeroIcon2x");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v4, "setDefaultHeroIcon2x:", v34);

  -[SPDiscoveredAccessoryProductInformation defaultListIcon2x](self, "defaultListIcon2x");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v4, "setDefaultListIcon2x:", v36);

  -[SPDiscoveredAccessoryProductInformation defaultHeroIcon3x](self, "defaultHeroIcon3x");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  objc_msgSend(v4, "setDefaultHeroIcon3x:", v38);

  -[SPDiscoveredAccessoryProductInformation defaultListIcon3x](self, "defaultListIcon3x");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");
  objc_msgSend(v4, "setDefaultListIcon3x:", v40);

  -[SPDiscoveredAccessoryProductInformation learnModeMetadata](self, "learnModeMetadata");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");
  objc_msgSend(v4, "setLearnModeMetadata:", v42);

  -[SPDiscoveredAccessoryProductInformation disableMetadata](self, "disableMetadata");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copy");
  objc_msgSend(v4, "setDisableMetadata:", v44);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t beaconGroupVersion;
  void *v5;
  id v6;

  beaconGroupVersion = self->_beaconGroupVersion;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", beaconGroupVersion, CFSTR("beaconGroupVersion"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_eligibleForPairing, CFSTR("eligibleForPairing"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_hidden, CFSTR("hidden"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isHELEAccessory, CFSTR("isHELEAccessory"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isManagedAccessory, CFSTR("isManagedAccessory"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_supportBeaconGroupInfo, CFSTR("supportBeaconGroupInfo"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_findmyProductId, CFSTR("findmyProductId"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_modelName, CFSTR("modelName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_manufacturerName, CFSTR("manufacturerName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_defaultRole, CFSTR("defaultRole"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_appBundleIdentifier, CFSTR("appBundleIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_lowBatteryInfoURL, CFSTR("lowBatteryInfoURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_disableURL, CFSTR("disableURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_encryptionKeyE1, CFSTR("encryptionKeyE1"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_encryptionKeyE2, CFSTR("encryptionKeyE2"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_verificationKeyS2, CFSTR("verificationKeyS2"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("txPower"), self->_txPower);
  objc_msgSend(v6, "encodeBool:forKey:", self->_isAirTag, CFSTR("isAirTag"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isAppleAudioAccessory, CFSTR("isAppleAudioAccessory"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_capabilities);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("capabilities"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_layoutTemplate, CFSTR("layoutTemplate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_defaultHeroIcon, CFSTR("defaultHeroIcon"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_defaultListIcon, CFSTR("defaultListIcon"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_defaultHeroIcon2x, CFSTR("defaultHeroIcon2x"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_defaultListIcon2x, CFSTR("defaultListIcon2x"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_defaultHeroIcon3x, CFSTR("defaultHeroIcon3x"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_defaultListIcon3x, CFSTR("defaultListIcon3x"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_learnModeMetadata, CFSTR("learnModeMetadata"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_disableMetadata, CFSTR("disableMetadata"));

}

- (SPDiscoveredAccessoryProductInformation)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *findmyProductId;
  NSString *v7;
  NSString *modelName;
  NSString *v9;
  NSString *manufacturerName;
  SPBeaconRole *v11;
  SPBeaconRole *defaultRole;
  NSString *v13;
  NSString *appBundleIdentifier;
  NSURL *v15;
  NSURL *lowBatteryInfoURL;
  NSURL *v17;
  NSURL *disableURL;
  NSString *v19;
  NSString *version;
  NSData *v21;
  NSData *encryptionKeyE1;
  NSData *v23;
  NSData *encryptionKeyE2;
  NSData *v25;
  NSData *verificationKeyS2;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  NSArray *layoutTemplate;
  NSURL *v34;
  NSURL *defaultHeroIcon;
  NSURL *v36;
  NSURL *defaultListIcon;
  NSURL *v38;
  NSURL *defaultHeroIcon2x;
  NSURL *v40;
  NSURL *defaultListIcon2x;
  NSURL *v42;
  NSURL *defaultHeroIcon3x;
  NSURL *v44;
  NSURL *defaultListIcon3x;
  SPUnknownProductMetadata *v46;
  SPUnknownProductMetadata *learnModeMetadata;
  SPUnknownProductMetadata *v48;
  SPUnknownProductMetadata *disableMetadata;
  _QWORD v51[3];

  v51[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_beaconGroupVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("beaconGroupVersion"));
  self->_eligibleForPairing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("eligibleForPairing"));
  self->_hidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hidden"));
  self->_isHELEAccessory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHELEAccessory"));
  self->_isManagedAccessory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isManagedAccessory"));
  self->_supportBeaconGroupInfo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportBeaconGroupInfo"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("findmyProductId"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  findmyProductId = self->_findmyProductId;
  self->_findmyProductId = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelName"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  modelName = self->_modelName;
  self->_modelName = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manufacturerName"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  manufacturerName = self->_manufacturerName;
  self->_manufacturerName = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultRole"));
  v11 = (SPBeaconRole *)objc_claimAutoreleasedReturnValue();
  defaultRole = self->_defaultRole;
  self->_defaultRole = v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleIdentifier"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  appBundleIdentifier = self->_appBundleIdentifier;
  self->_appBundleIdentifier = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lowBatteryInfoURL"));
  v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
  lowBatteryInfoURL = self->_lowBatteryInfoURL;
  self->_lowBatteryInfoURL = v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disableURL"));
  v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
  disableURL = self->_disableURL;
  self->_disableURL = v17;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  version = self->_version;
  self->_version = v19;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptionKeyE1"));
  v21 = (NSData *)objc_claimAutoreleasedReturnValue();
  encryptionKeyE1 = self->_encryptionKeyE1;
  self->_encryptionKeyE1 = v21;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptionKeyE2"));
  v23 = (NSData *)objc_claimAutoreleasedReturnValue();
  encryptionKeyE2 = self->_encryptionKeyE2;
  self->_encryptionKeyE2 = v23;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("verificationKeyS2"));
  v25 = (NSData *)objc_claimAutoreleasedReturnValue();
  verificationKeyS2 = self->_verificationKeyS2;
  self->_verificationKeyS2 = v25;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("txPower"));
  self->_txPower = v27;
  self->_isAirTag = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAirTag"));
  self->_isAppleAudioAccessory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAppleAudioAccessory"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capabilities"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  self->_capabilities = objc_msgSend(v28, "unsignedIntegerValue");

  v29 = (void *)MEMORY[0x1E0C99E60];
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setWithArray:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("layoutTemplate"));
  v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
  layoutTemplate = self->_layoutTemplate;
  self->_layoutTemplate = v32;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultHeroIcon"));
  v34 = (NSURL *)objc_claimAutoreleasedReturnValue();
  defaultHeroIcon = self->_defaultHeroIcon;
  self->_defaultHeroIcon = v34;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultListIcon"));
  v36 = (NSURL *)objc_claimAutoreleasedReturnValue();
  defaultListIcon = self->_defaultListIcon;
  self->_defaultListIcon = v36;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultHeroIcon2x"));
  v38 = (NSURL *)objc_claimAutoreleasedReturnValue();
  defaultHeroIcon2x = self->_defaultHeroIcon2x;
  self->_defaultHeroIcon2x = v38;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultListIcon2x"));
  v40 = (NSURL *)objc_claimAutoreleasedReturnValue();
  defaultListIcon2x = self->_defaultListIcon2x;
  self->_defaultListIcon2x = v40;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultHeroIcon3x"));
  v42 = (NSURL *)objc_claimAutoreleasedReturnValue();
  defaultHeroIcon3x = self->_defaultHeroIcon3x;
  self->_defaultHeroIcon3x = v42;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultListIcon3x"));
  v44 = (NSURL *)objc_claimAutoreleasedReturnValue();
  defaultListIcon3x = self->_defaultListIcon3x;
  self->_defaultListIcon3x = v44;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("learnModeMetadata"));
  v46 = (SPUnknownProductMetadata *)objc_claimAutoreleasedReturnValue();
  learnModeMetadata = self->_learnModeMetadata;
  self->_learnModeMetadata = v46;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disableMetadata"));
  v48 = (SPUnknownProductMetadata *)objc_claimAutoreleasedReturnValue();

  disableMetadata = self->_disableMetadata;
  self->_disableMetadata = v48;

  return self;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPDiscoveredAccessoryProductInformation manufacturerName](self, "manufacturerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPDiscoveredAccessoryProductInformation modelName](self, "modelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPDiscoveredAccessoryProductInformation findmyProductId](self, "findmyProductId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p manufacturer: %@ model: %@ productId: %@ isAirTag: %d isAppleAudioAccessory: %d>"), v4, self, v5, v6, v7, -[SPDiscoveredAccessoryProductInformation isAirTag](self, "isAirTag"), -[SPDiscoveredAccessoryProductInformation isAppleAudioAccessory](self, "isAppleAudioAccessory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)beaconGroupVersion
{
  return self->_beaconGroupVersion;
}

- (void)setBeaconGroupVersion:(int64_t)a3
{
  self->_beaconGroupVersion = a3;
}

- (BOOL)eligibleForPairing
{
  return self->_eligibleForPairing;
}

- (void)setEligibleForPairing:(BOOL)a3
{
  self->_eligibleForPairing = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isHELEAccessory
{
  return self->_isHELEAccessory;
}

- (void)setIsHELEAccessory:(BOOL)a3
{
  self->_isHELEAccessory = a3;
}

- (BOOL)isManagedAccessory
{
  return self->_isManagedAccessory;
}

- (void)setIsManagedAccessory:(BOOL)a3
{
  self->_isManagedAccessory = a3;
}

- (BOOL)supportBeaconGroupInfo
{
  return self->_supportBeaconGroupInfo;
}

- (void)setSupportBeaconGroupInfo:(BOOL)a3
{
  self->_supportBeaconGroupInfo = a3;
}

- (NSString)findmyProductId
{
  return self->_findmyProductId;
}

- (void)setFindmyProductId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SPBeaconRole)defaultRole
{
  return self->_defaultRole;
}

- (void)setDefaultRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)lowBatteryInfoURL
{
  return self->_lowBatteryInfoURL;
}

- (void)setLowBatteryInfoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)disableURL
{
  return self->_disableURL;
}

- (void)setDisableURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)encryptionKeyE1
{
  return self->_encryptionKeyE1;
}

- (void)setEncryptionKeyE1:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)encryptionKeyE2
{
  return self->_encryptionKeyE2;
}

- (void)setEncryptionKeyE2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)verificationKeyS2
{
  return self->_verificationKeyS2;
}

- (void)setVerificationKeyS2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (double)txPower
{
  return self->_txPower;
}

- (void)setTxPower:(double)a3
{
  self->_txPower = a3;
}

- (BOOL)isAirTag
{
  return self->_isAirTag;
}

- (void)setIsAirTag:(BOOL)a3
{
  self->_isAirTag = a3;
}

- (BOOL)isAppleAudioAccessory
{
  return self->_isAppleAudioAccessory;
}

- (void)setIsAppleAudioAccessory:(BOOL)a3
{
  self->_isAppleAudioAccessory = a3;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (NSArray)layoutTemplate
{
  return self->_layoutTemplate;
}

- (void)setLayoutTemplate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSURL)defaultHeroIcon
{
  return self->_defaultHeroIcon;
}

- (void)setDefaultHeroIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSURL)defaultListIcon
{
  return self->_defaultListIcon;
}

- (void)setDefaultListIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSURL)defaultHeroIcon2x
{
  return self->_defaultHeroIcon2x;
}

- (void)setDefaultHeroIcon2x:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSURL)defaultListIcon2x
{
  return self->_defaultListIcon2x;
}

- (void)setDefaultListIcon2x:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSURL)defaultHeroIcon3x
{
  return self->_defaultHeroIcon3x;
}

- (void)setDefaultHeroIcon3x:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSURL)defaultListIcon3x
{
  return self->_defaultListIcon3x;
}

- (void)setDefaultListIcon3x:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (SPUnknownProductMetadata)learnModeMetadata
{
  return self->_learnModeMetadata;
}

- (void)setLearnModeMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (SPUnknownProductMetadata)disableMetadata
{
  return self->_disableMetadata;
}

- (void)setDisableMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableMetadata, 0);
  objc_storeStrong((id *)&self->_learnModeMetadata, 0);
  objc_storeStrong((id *)&self->_defaultListIcon3x, 0);
  objc_storeStrong((id *)&self->_defaultHeroIcon3x, 0);
  objc_storeStrong((id *)&self->_defaultListIcon2x, 0);
  objc_storeStrong((id *)&self->_defaultHeroIcon2x, 0);
  objc_storeStrong((id *)&self->_defaultListIcon, 0);
  objc_storeStrong((id *)&self->_defaultHeroIcon, 0);
  objc_storeStrong((id *)&self->_layoutTemplate, 0);
  objc_storeStrong((id *)&self->_verificationKeyS2, 0);
  objc_storeStrong((id *)&self->_encryptionKeyE2, 0);
  objc_storeStrong((id *)&self->_encryptionKeyE1, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_disableURL, 0);
  objc_storeStrong((id *)&self->_lowBatteryInfoURL, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultRole, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_findmyProductId, 0);
}

@end
