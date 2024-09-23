@implementation SASProximityInformation

- (void)encodeWithCoder:(id)a3
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
  id v38;

  v38 = a3;
  -[SASProximityInformation keyboards](self, "keyboards");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v4, CFSTR("keyboards"));

  -[SASProximityInformation appleID](self, "appleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v5, CFSTR("appleID"));

  objc_msgSend(v38, "encodeBool:forKey:", -[SASProximityInformation usesSameAccountForiTunes](self, "usesSameAccountForiTunes"), CFSTR("usesSameAccountForiTunes"));
  -[SASProximityInformation networks](self, "networks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v6, CFSTR("networks"));

  -[SASProximityInformation networkPasswords](self, "networkPasswords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v7, CFSTR("networkPasswords"));

  -[SASProximityInformation connectedToWiFi](self, "connectedToWiFi");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v8, CFSTR("connectedToWiFi"));

  -[SASProximityInformation localePreferences](self, "localePreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v9, CFSTR("localePreferences"));

  objc_msgSend(v38, "encodeBool:forKey:", -[SASProximityInformation automaticTimeZoneEnabled](self, "automaticTimeZoneEnabled"), CFSTR("automaticTimeZoneEnabled"));
  -[SASProximityInformation timeZone](self, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v10, CFSTR("timeZone"));

  -[SASProximityInformation accessibilitySettings](self, "accessibilitySettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v11, CFSTR("accessibilitySettings"));

  -[SASProximityInformation firstName](self, "firstName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v12, CFSTR("firstName"));

  -[SASProximityInformation deviceModel](self, "deviceModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v13, CFSTR("deviceModel"));

  -[SASProximityInformation deviceClass](self, "deviceClass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v14, CFSTR("deviceClass"));

  objc_msgSend(v38, "encodeBool:forKey:", -[SASProximityInformation isRestoring](self, "isRestoring"), CFSTR("restoring"));
  -[SASProximityInformation deviceName](self, "deviceName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v15, CFSTR("deviceName"));

  -[SASProximityInformation backupUUID](self, "backupUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v16, CFSTR("backupUUID"));

  objc_msgSend(v38, "encodeBool:forKey:", -[SASProximityInformation isBackupEnabled](self, "isBackupEnabled"), CFSTR("backupEnabled"));
  -[SASProximityInformation dateOfLastBackup](self, "dateOfLastBackup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v17, CFSTR("dateOfLastBackup"));

  -[SASProximityInformation supportsCellularBackup](self, "supportsCellularBackup");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v18, CFSTR("supportsCellularBackup"));

  -[SASProximityInformation hasMegaBackup](self, "hasMegaBackup");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v19, CFSTR("hasMegaBackup"));

  -[SASProximityInformation expressSettings](self, "expressSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v20, CFSTR("expressSettingsKey"));

  -[SASProximityInformation backupMetadata](self, "backupMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v21, CFSTR("backupMetadataKey"));

  objc_msgSend(v38, "encodeBool:forKey:", -[SASProximityInformation locationServicesOptIn](self, "locationServicesOptIn"), CFSTR("locationServicesOptIn"));
  -[SASProximityInformation locationServicesData](self, "locationServicesData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v22, CFSTR("locationServicesData"));

  -[SASProximityInformation findMyDeviceOptIn](self, "findMyDeviceOptIn");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v23, CFSTR("findMyDeviceOptIn"));

  -[SASProximityInformation deviceAnalyticsOptIn](self, "deviceAnalyticsOptIn");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v24, CFSTR("deviceAnalyticsOptIn"));

  -[SASProximityInformation appAnalyticsOptIn](self, "appAnalyticsOptIn");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v25, CFSTR("appAnalyticsOptIn"));

  -[SASProximityInformation siriOptIn](self, "siriOptIn");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v26, CFSTR("siriOptIn"));

  -[SASProximityInformation siriVoiceProfileAvailabilityMetadata](self, "siriVoiceProfileAvailabilityMetadata");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v27, CFSTR("siriVoiceProfileAvailabilityMetadata"));

  -[SASProximityInformation deviceTermsIdentifier](self, "deviceTermsIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v28, CFSTR("deviceTermsIdentifier"));

  -[SASProximityInformation productVersion](self, "productVersion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v29, CFSTR("productVersion"));

  -[SASProximityInformation supportsDeviceToDeviceMigration](self, "supportsDeviceToDeviceMigration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v30, CFSTR("supportsDeviceToDeviceMigration"));

  -[SASProximityInformation deviceToDeviceMigrationVersion](self, "deviceToDeviceMigrationVersion");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v31, CFSTR("deviceToDeviceMigrationVersion"));

  -[SASProximityInformation storageAvailable](self, "storageAvailable");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v32, CFSTR("storageAvailable"));

  -[SASProximityInformation storageCapacity](self, "storageCapacity");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v33, CFSTR("storageCapacity"));

  -[SASProximityInformation preventSoftwareUpdateDeviceMigration](self, "preventSoftwareUpdateDeviceMigration");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v34, CFSTR("preventSoftwareUpdateDeviceMigration"));

  -[SASProximityInformation hasTransferrableTelephonyPlan](self, "hasTransferrableTelephonyPlan");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v35, CFSTR("hasTransferrableTelephonyPlan"));

  -[SASProximityInformation hasInexpensiveCellularNetwork](self, "hasInexpensiveCellularNetwork");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v36, CFSTR("hasInexpensiveCellularNetwork"));

  -[SASProximityInformation allowMoreOn5G](self, "allowMoreOn5G");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "encodeObject:forKey:", v37, CFSTR("allowMoreOn5G"));

  objc_msgSend(v38, "encodeBool:forKey:", -[SASProximityInformation hasHomeButton](self, "hasHomeButton"), CFSTR("hasHomeButton"));
}

- (SASProximityInformation)initWithCoder:(id)a3
{
  id v4;
  SASProximityInformation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  objc_super v62;

  v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)SASProximityInformation;
  v5 = -[SASProximityInformation init](&v62, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("keyboards"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setKeyboards:](v5, "setKeyboards:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setAppleID:](v5, "setAppleID:", v10);

    -[SASProximityInformation setUsesSameAccountForiTunes:](v5, "setUsesSameAccountForiTunes:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesSameAccountForiTunes")));
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("networks"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setNetworks:](v5, "setNetworks:", v18);

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, v21, v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("networkPasswords"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setNetworkPasswords:](v5, "setNetworkPasswords:", v24);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectedToWiFi"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setConnectedToWiFi:](v5, "setConnectedToWiFi:", v25);

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, v28, v29, v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("localePreferences"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setLocalePreferences:](v5, "setLocalePreferences:", v32);

    -[SASProximityInformation setAutomaticTimeZoneEnabled:](v5, "setAutomaticTimeZoneEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("automaticTimeZoneEnabled")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setTimeZone:](v5, "setTimeZone:", v33);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilitySettings"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setAccessibilitySettings:](v5, "setAccessibilitySettings:", v34);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setFirstName:](v5, "setFirstName:", v35);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceModel"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setDeviceModel:](v5, "setDeviceModel:", v36);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceClass"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setDeviceClass:](v5, "setDeviceClass:", v37);

    -[SASProximityInformation setRestoring:](v5, "setRestoring:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restoring")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setDeviceName:](v5, "setDeviceName:", v38);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupUUID"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setBackupUUID:](v5, "setBackupUUID:", v39);

    -[SASProximityInformation setBackupEnabled:](v5, "setBackupEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("backupEnabled")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateOfLastBackup"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setDateOfLastBackup:](v5, "setDateOfLastBackup:", v40);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsCellularBackup"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setSupportsCellularBackup:](v5, "setSupportsCellularBackup:", v41);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasMegaBackup"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setHasMegaBackup:](v5, "setHasMegaBackup:", v42);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expressSettingsKey"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setExpressSettings:](v5, "setExpressSettings:", v43);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupMetadataKey"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setBackupMetadata:](v5, "setBackupMetadata:", v44);

    -[SASProximityInformation setLocationServicesOptIn:](v5, "setLocationServicesOptIn:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("locationServicesOptIn")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationServicesData"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setLocationServicesData:](v5, "setLocationServicesData:", v45);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("findMyDeviceOptIn"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setFindMyDeviceOptIn:](v5, "setFindMyDeviceOptIn:", v46);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceAnalyticsOptIn"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setDeviceAnalyticsOptIn:](v5, "setDeviceAnalyticsOptIn:", v47);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appAnalyticsOptIn"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setAppAnalyticsOptIn:](v5, "setAppAnalyticsOptIn:", v48);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("siriOptIn"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setSiriOptIn:](v5, "setSiriOptIn:", v49);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("siriVoiceProfileAvailabilityMetadata"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setSiriVoiceProfileAvailabilityMetadata:](v5, "setSiriVoiceProfileAvailabilityMetadata:", v50);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceTermsIdentifier"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setDeviceTermsIdentifier:](v5, "setDeviceTermsIdentifier:", v51);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productVersion"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setProductVersion:](v5, "setProductVersion:", v52);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsDeviceToDeviceMigration"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setSupportsDeviceToDeviceMigration:](v5, "setSupportsDeviceToDeviceMigration:", v53);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceToDeviceMigrationVersion"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setDeviceToDeviceMigrationVersion:](v5, "setDeviceToDeviceMigrationVersion:", v54);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storageAvailable"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setStorageAvailable:](v5, "setStorageAvailable:", v55);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storageCapacity"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setStorageCapacity:](v5, "setStorageCapacity:", v56);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preventSoftwareUpdateDeviceMigration"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setPreventSoftwareUpdateDeviceMigration:](v5, "setPreventSoftwareUpdateDeviceMigration:", v57);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasTransferrableTelephonyPlan"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setHasTransferrableTelephonyPlan:](v5, "setHasTransferrableTelephonyPlan:", v58);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasInexpensiveCellularNetwork"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setHasInexpensiveCellularNetwork:](v5, "setHasInexpensiveCellularNetwork:", v59);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowMoreOn5G"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setAllowMoreOn5G:](v5, "setAllowMoreOn5G:", v60);

    -[SASProximityInformation setHasHomeButton:](v5, "setHasHomeButton:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasHomeButton")));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_getFindMyDeviceOptIn
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[8];
  uint64_t v25;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  v2 = dispatch_semaphore_create(0);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v3 = (void *)getFMDFMIPManagerClass_softClass_0;
  v32 = getFMDFMIPManagerClass_softClass_0;
  v4 = MEMORY[0x1E0C809B0];
  if (!getFMDFMIPManagerClass_softClass_0)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getFMDFMIPManagerClass_block_invoke_0;
    v27 = &unk_1E97DC4E8;
    v28 = &v29;
    __getFMDFMIPManagerClass_block_invoke_0((uint64_t)buf);
    v3 = (void *)v30[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v29, 8);
  objc_msgSend(v5, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  v13 = 3221225472;
  v14 = __48__SASProximityInformation__getFindMyDeviceOptIn__block_invoke;
  v15 = &unk_1E97DC498;
  v17 = &v18;
  v7 = v2;
  v16 = v7;
  objc_msgSend(v6, "fmipStateWithCompletion:", &v12);

  v8 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    +[SASLogging facility](SASLogging, "facility", v12, v13, v14, v15);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D45FD000, v9, OS_LOG_TYPE_DEFAULT, "Timed out fetching Find My Device state", buf, 2u);
    }

  }
  v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __48__SASProximityInformation__getFindMyDeviceOptIn__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[SASLogging facility](SASLogging, "facility");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1D45FD000, v6, OS_LOG_TYPE_DEFAULT, "Could not determine Find My Device if is enabled: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2 == 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)loadInformation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D45FD000, v0, v1, "Failed to check if backup is supported on cellular: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__SASProximityInformation_loadInformation__block_invoke(uint64_t a1)
{
  id v2;

  +[SASExpressCloudSettings createExpressSettingsWithQueue:](SASExpressCloudSettings, "createExpressSettingsWithQueue:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setExpressSettings:", v2);

}

- (void)_loadTelephonyInformation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D45FD000, v0, v1, "Failed to get telephony plan transfer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (BOOL)isNetworkTransferrable:(__WiFiNetwork *)a3
{
  if (!a3)
    return 0;
  if (WiFiNetworkIsEAP()
    || WiFiNetworkIsProfileBased()
    || WiFiNetworkIsExpirable()
    || WiFiNetworkIsCaptive())
  {
    return 0;
  }
  return WiFiNetworkGetType() != 1;
}

- (void)wirelessScanComplete:(id)a3 error:(int)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SASProximityInformation nearbyNetworks](self, "nearbyNetworks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (a4)
    {
      +[SASLogging facility](SASLogging, "facility");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 67109120;
        v11[1] = a4;
        _os_log_impl(&dword_1D45FD000, v8, OS_LOG_TYPE_DEFAULT, "Failed to perform Wi-Fi scan to get nearby networks: %d", (uint8_t *)v11, 8u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASProximityInformation setNearbyNetworks:](self, "setNearbyNetworks:", v9);

    -[SASProximityInformation nearbyNetworksSemaphore](self, "nearbyNetworksSemaphore");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v10);

  }
}

- (id)numberFromMCUserBoolSetting:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v4 = (void *)getMCProfileConnectionClass_softClass;
  v15 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getMCProfileConnectionClass_block_invoke;
    v11[3] = &unk_1E97DC4E8;
    v11[4] = &v12;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v11);
    v4 = (void *)v13[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v5, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userBoolValueForSetting:", v3);

  v8 = (void *)MEMORY[0x1E0C9AAA0];
  if (v7 != 2)
    v8 = 0;
  if (v7 == 1)
    v9 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v9 = v8;

  return v9;
}

- (NSArray)keyboards
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeyboards:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)appleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (BOOL)usesSameAccountForiTunes
{
  return self->_usesSameAccountForiTunes;
}

- (void)setUsesSameAccountForiTunes:(BOOL)a3
{
  self->_usesSameAccountForiTunes = a3;
}

- (NSArray)networks
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNetworks:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSArray)networkPasswords
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNetworkPasswords:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSNumber)connectedToWiFi
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConnectedToWiFi:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)localePreferences
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalePreferences:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)automaticTimeZoneEnabled
{
  return self->_automaticTimeZoneEnabled;
}

- (void)setAutomaticTimeZoneEnabled:(BOOL)a3
{
  self->_automaticTimeZoneEnabled = a3;
}

- (NSString)timeZone
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSData)accessibilitySettings
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccessibilitySettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)firstName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSString)deviceModel
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeviceModel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSString)deviceClass
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeviceClass:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (void)setHasHomeButton:(BOOL)a3
{
  self->_hasHomeButton = a3;
}

- (BOOL)isRestoring
{
  return self->_restoring;
}

- (void)setRestoring:(BOOL)a3
{
  self->_restoring = a3;
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSString)backupUUID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setBackupUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (BOOL)isBackupEnabled
{
  return self->_backupEnabled;
}

- (void)setBackupEnabled:(BOOL)a3
{
  self->_backupEnabled = a3;
}

- (NSDate)dateOfLastBackup
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDateOfLastBackup:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSNumber)supportsCellularBackup
{
  return self->_supportsCellularBackup;
}

- (void)setSupportsCellularBackup:(id)a3
{
  objc_storeStrong((id *)&self->_supportsCellularBackup, a3);
}

- (NSNumber)hasMegaBackup
{
  return self->_hasMegaBackup;
}

- (void)setHasMegaBackup:(id)a3
{
  objc_storeStrong((id *)&self->_hasMegaBackup, a3);
}

- (SASExpressSettings)expressSettings
{
  return (SASExpressSettings *)objc_getProperty(self, a2, 144, 1);
}

- (void)setExpressSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSData)backupMetadata
{
  return (NSData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setBackupMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (BOOL)locationServicesOptIn
{
  return self->_locationServicesOptIn;
}

- (void)setLocationServicesOptIn:(BOOL)a3
{
  self->_locationServicesOptIn = a3;
}

- (NSData)locationServicesData
{
  return (NSData *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLocationServicesData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSNumber)findMyDeviceOptIn
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFindMyDeviceOptIn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSNumber)deviceAnalyticsOptIn
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDeviceAnalyticsOptIn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSNumber)appAnalyticsOptIn
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAppAnalyticsOptIn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSNumber)siriOptIn
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setSiriOptIn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSData)siriVoiceProfileAvailabilityMetadata
{
  return (NSData *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSiriVoiceProfileAvailabilityMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSNumber)deviceTermsIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDeviceTermsIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setProductVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSNumber)supportsDeviceToDeviceMigration
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSupportsDeviceToDeviceMigration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSNumber)deviceToDeviceMigrationVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 232, 1);
}

- (void)setDeviceToDeviceMigrationVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSNumber)storageAvailable
{
  return (NSNumber *)objc_getProperty(self, a2, 240, 1);
}

- (void)setStorageAvailable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSNumber)storageCapacity
{
  return (NSNumber *)objc_getProperty(self, a2, 248, 1);
}

- (void)setStorageCapacity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSNumber)preventSoftwareUpdateDeviceMigration
{
  return (NSNumber *)objc_getProperty(self, a2, 256, 1);
}

- (void)setPreventSoftwareUpdateDeviceMigration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSNumber)hasTransferrableTelephonyPlan
{
  return self->_hasTransferrableTelephonyPlan;
}

- (void)setHasTransferrableTelephonyPlan:(id)a3
{
  self->_hasTransferrableTelephonyPlan = (NSNumber *)a3;
}

- (NSNumber)hasInexpensiveCellularNetwork
{
  return (NSNumber *)objc_getProperty(self, a2, 272, 1);
}

- (void)setHasInexpensiveCellularNetwork:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSNumber)allowMoreOn5G
{
  return self->_allowMoreOn5G;
}

- (void)setAllowMoreOn5G:(id)a3
{
  objc_storeStrong((id *)&self->_allowMoreOn5G, a3);
}

- (NSSet)nearbyNetworks
{
  return (NSSet *)objc_getProperty(self, a2, 288, 1);
}

- (void)setNearbyNetworks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (OS_dispatch_semaphore)nearbyNetworksSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 296, 1);
}

- (void)setNearbyNetworksSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyNetworksSemaphore, 0);
  objc_storeStrong((id *)&self->_nearbyNetworks, 0);
  objc_storeStrong((id *)&self->_allowMoreOn5G, 0);
  objc_storeStrong((id *)&self->_hasInexpensiveCellularNetwork, 0);
  objc_storeStrong((id *)&self->_preventSoftwareUpdateDeviceMigration, 0);
  objc_storeStrong((id *)&self->_storageCapacity, 0);
  objc_storeStrong((id *)&self->_storageAvailable, 0);
  objc_storeStrong((id *)&self->_deviceToDeviceMigrationVersion, 0);
  objc_storeStrong((id *)&self->_supportsDeviceToDeviceMigration, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_deviceTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_siriVoiceProfileAvailabilityMetadata, 0);
  objc_storeStrong((id *)&self->_siriOptIn, 0);
  objc_storeStrong((id *)&self->_appAnalyticsOptIn, 0);
  objc_storeStrong((id *)&self->_deviceAnalyticsOptIn, 0);
  objc_storeStrong((id *)&self->_findMyDeviceOptIn, 0);
  objc_storeStrong((id *)&self->_locationServicesData, 0);
  objc_storeStrong((id *)&self->_backupMetadata, 0);
  objc_storeStrong((id *)&self->_expressSettings, 0);
  objc_storeStrong((id *)&self->_hasMegaBackup, 0);
  objc_storeStrong((id *)&self->_supportsCellularBackup, 0);
  objc_storeStrong((id *)&self->_dateOfLastBackup, 0);
  objc_storeStrong((id *)&self->_backupUUID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_accessibilitySettings, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_localePreferences, 0);
  objc_storeStrong((id *)&self->_connectedToWiFi, 0);
  objc_storeStrong((id *)&self->_networkPasswords, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_keyboards, 0);
}

- (uint64_t)loadInformation
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[SASProximityInformation loadInformation].cold.4(v0);
}

@end
