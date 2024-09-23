@implementation SUDescriptor

- (BOOL)isRelevantToDeclaration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "buildVersionString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "buildVersionString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUDescriptor splatComboBuildVersion](self, "splatComboBuildVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend(v5, "buildVersionString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUDescriptor productBuildVersion](self, "productBuildVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v11, "isEqualToString:", v12);

      }
      goto LABEL_9;
    }
    objc_msgSend(v5, "versionString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "versionString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUDescriptor productVersion](self, "productVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);
LABEL_9:

      goto LABEL_10;
    }
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)releasedBefore:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[SUDescriptor releaseDate](self, "releaseDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = -v5;

  return v6 >= a3;
}

- (SUDescriptor)init
{
  SUDescriptor *v2;
  SUDescriptor *v3;
  NSString *setupCritical;
  NSString *criticalDownloadPolicy;
  NSString *prerequisiteBuild;
  NSString *prerequisiteOS;
  NSString *assetID;
  NSString *humanReadableUpdateName;
  NSString *mandatoryUpdateVersionMin;
  NSString *mandatoryUpdateVersionMax;
  NSString *splatComboBuildVersion;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SUDescriptor;
  v2 = -[SUDescriptor init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_autoDownloadAllowableForCellular = 1;
    v2->_downloadableOverCellular = 1;
    v2->_downloadable = 1;
    *(_WORD *)&v2->_disableIntallTonight = 0;
    v2->_granularlyRamped = 0;
    setupCritical = v2->_setupCritical;
    v2->_setupCritical = 0;

    criticalDownloadPolicy = v3->_criticalDownloadPolicy;
    v3->_criticalDownloadPolicy = 0;

    *(_WORD *)&v3->_criticalOutOfBoxOnly = 1;
    prerequisiteBuild = v3->_prerequisiteBuild;
    v3->_prerequisiteBuild = 0;

    prerequisiteOS = v3->_prerequisiteOS;
    v3->_prerequisiteOS = 0;

    assetID = v3->_assetID;
    v3->_assetID = 0;

    v3->_hideInstallAlert = 0;
    v3->_preferenceType = 0;
    v3->_upgradeType = 0;
    v3->_audienceType = 0;
    *(_WORD *)&v3->_promoteAlternateUpdate = 0;
    humanReadableUpdateName = v3->_humanReadableUpdateName;
    v3->_humanReadableUpdateName = 0;

    v3->_mandatoryUpdateEligible = 0;
    mandatoryUpdateVersionMin = v3->_mandatoryUpdateVersionMin;
    v3->_mandatoryUpdateVersionMin = 0;

    mandatoryUpdateVersionMax = v3->_mandatoryUpdateVersionMax;
    v3->_mandatoryUpdateVersionMax = 0;

    v3->_allowAutoDownloadOnBattery = 0;
    *(_QWORD *)&v3->_autoDownloadOnBatteryDelay = 0x3E7000003E7;
    *(_DWORD *)&v3->_mandatoryUpdateOptional = 0;
    splatComboBuildVersion = v3->_splatComboBuildVersion;
    v3->_splatComboBuildVersion = 0;

  }
  return v3;
}

- (NSString)publisher
{
  if (self->_publisher)
    return self->_publisher;
  else
    return (NSString *)CFSTR("Apple, Inc.");
}

- (NSString)productSystemName
{
  if (self->_productSystemName)
    return self->_productSystemName;
  else
    return (NSString *)CFSTR("iOS");
}

- (id)updateTypeName
{
  uint64_t updateType;

  updateType = self->_updateType;
  if (updateType > 3)
    return CFSTR("unknown");
  else
    return off_24CE3CE00[updateType];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUDescriptor)initWithCoder:(id)a3
{
  id v4;
  SUDescriptor *v5;
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
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SUDescriptor init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publisher"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setPublisher:](v5, "setPublisher:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productSystemName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setProductSystemName:](v5, "setProductSystemName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setProductVersion:](v5, "setProductVersion:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productVersionExtra"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setProductVersionExtra:](v5, "setProductVersionExtra:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productBuildVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setProductBuildVersion:](v5, "setProductBuildVersion:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prerequisiteBuild"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setPrerequisiteBuild:](v5, "setPrerequisiteBuild:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prerequisiteOS"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setPrerequisiteOS:](v5, "setPrerequisiteOS:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setReleaseType:](v5, "setReleaseType:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadSize"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setDownloadSize:](v5, "setDownloadSize:", objc_msgSend(v14, "unsignedLongLongValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unarchiveSize"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor _setUnarchiveSize:](v5, "_setUnarchiveSize:", objc_msgSend(v15, "unsignedLongLongValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("msuPrepareSize"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor _setMsuPrepareSize:](v5, "_setMsuPrepareSize:", objc_msgSend(v16, "unsignedLongLongValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installationSize"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setInstallationSize:](v5, "setInstallationSize:", objc_msgSend(v17, "unsignedLongLongValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumSystemPartitionsize"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setMinimumSystemPartitionSize:](v5, "setMinimumSystemPartitionSize:", objc_msgSend(v18, "unsignedLongLongValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preparationSize"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setPreparationSize:](v5, "setPreparationSize:", objc_msgSend(v19, "unsignedLongLongValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalRequiredFreeSpace"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setTotalRequiredFreeSpace:](v5, "setTotalRequiredFreeSpace:", objc_msgSend(v20, "unsignedLongLongValue"));

    -[SUDescriptor setUpdateType:](v5, "setUpdateType:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("updateType")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentation"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setDocumentation:](v5, "setDocumentation:", v21);

    -[SUDescriptor setAutoDownloadAllowableForCellular:](v5, "setAutoDownloadAllowableForCellular:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autoDownloadAllowableForCellular")));
    -[SUDescriptor setDownloadableOverCellular:](v5, "setDownloadableOverCellular:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadableOverCellular")));
    -[SUDescriptor setDownloadable:](v5, "setDownloadable:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadable")));
    -[SUDescriptor _setStreamingZipCapable:](v5, "_setStreamingZipCapable:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("streamingZipCapable")));
    -[SUDescriptor _setDisableSiriVoiceDeletion:](v5, "_setDisableSiriVoiceDeletion:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableSiriVoiceDeletion")));
    -[SUDescriptor _setDisableCDLevel4:](v5, "_setDisableCDLevel4:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableCDLevel4")));
    -[SUDescriptor _setDisableAppDemotion:](v5, "_setDisableAppDemotion:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableAppDemotion")));
    -[SUDescriptor _setDisableInstallTonight:](v5, "_setDisableInstallTonight:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableInstallTonight")));
    -[SUDescriptor setRampEnabled:](v5, "setRampEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("rampEnabled")));
    -[SUDescriptor setGranularlyRamped:](v5, "setGranularlyRamped:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("granularlyRamped")));
    -[SUDescriptor setCriticalOutOfBoxOnly:](v5, "setCriticalOutOfBoxOnly:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("criticalOutOfBoxOnly")));
    -[SUDescriptor setAutoUpdateEnabled:](v5, "setAutoUpdateEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autoUpdateEnabled")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setupCritical"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setSetupCritical:](v5, "setSetupCritical:", v22);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("criticalDownloadPolicy"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setCriticalDownloadPolicy:](v5, "setCriticalDownloadPolicy:", v23);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SEPDigest"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setSEPDigest:](v5, "setSEPDigest:", v24);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RSEPDigest"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setRSEPDigest:](v5, "setRSEPDigest:", v25);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SEPTBMDigest"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setSEPTBMDigest:](v5, "setSEPTBMDigest:", v26);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RSEPTBMDigest"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setRSEPTBMDigest:](v5, "setRSEPTBMDigest:", v27);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseDate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setReleaseDate:](v5, "setReleaseDate:", v28);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MDMDelayInterval"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setMdmDelayInterval:](v5, "setMdmDelayInterval:", objc_msgSend(v29, "unsignedLongLongValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setAssetID:](v5, "setAssetID:", v30);

    -[SUDescriptor setHideInstallAlert:](v5, "setHideInstallAlert:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hideInstallAlert")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audienceType"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setAudienceType:](v5, "setAudienceType:", objc_msgSend(v31, "unsignedLongLongValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferenceType"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setPreferenceType:](v5, "setPreferenceType:", objc_msgSend(v32, "unsignedLongLongValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("upgradeType"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setUpgradeType:](v5, "setUpgradeType:", objc_msgSend(v33, "unsignedLongLongValue"));

    -[SUDescriptor setPromoteAlternateUpdate:](v5, "setPromoteAlternateUpdate:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("promoteAlternateUpdate")));
    -[SUDescriptor setIsSplatOnly:](v5, "setIsSplatOnly:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSplatOnly")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("humanReadableUpdateName"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setHumanReadableUpdateName:](v5, "setHumanReadableUpdateName:", v34);

    -[SUDescriptor setMandatoryUpdateEligible:](v5, "setMandatoryUpdateEligible:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MandatoryUpdateEligible")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MandatoryUpdateVersionMin"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setMandatoryUpdateVersionMin:](v5, "setMandatoryUpdateVersionMin:", v35);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MandatoryUpdateVersionMax"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setMandatoryUpdateVersionMax:](v5, "setMandatoryUpdateVersionMax:", v36);

    -[SUDescriptor setMandatoryUpdateOptional:](v5, "setMandatoryUpdateOptional:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MandatoryUpdateOptional")));
    -[SUDescriptor setMandatoryUpdateRestrictedToOutOfTheBox:](v5, "setMandatoryUpdateRestrictedToOutOfTheBox:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MandatoryUpdateRestrictedToOutOfTheBox")));
    -[SUDescriptor setForcePasscodeRequired:](v5, "setForcePasscodeRequired:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ForcePasscodeRequired")));
    -[SUDescriptor setAllowAutoDownloadOnBattery:](v5, "setAllowAutoDownloadOnBattery:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllowAutoDownloadOnBattery")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AutoDownloadOnBatteryDelay"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setAutoDownloadOnBatteryDelay:](v5, "setAutoDownloadOnBatteryDelay:", objc_msgSend(v37, "unsignedIntValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AutoDownloadOnBatteryMinBattery"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setAutoDownloadOnBatteryMinBattery:](v5, "setAutoDownloadOnBatteryMinBattery:", objc_msgSend(v38, "unsignedIntValue"));

    -[SUDescriptor setIsSplombo:](v5, "setIsSplombo:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSplombo")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("splatComboBuildVersion"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setSplatComboBuildVersion:](v5, "setSplatComboBuildVersion:", v39);

    v40 = (void *)MEMORY[0x24BDBCF20];
    v45 = objc_opt_class();
    v46 = objc_opt_class();
    v47 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setWithArray:", v41, v45, v46);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("systemPartitionPadding"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor setSystemPartitionPadding:](v5, "setSystemPartitionPadding:", v43);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  id v39;

  v4 = a3;
  -[SUDescriptor publisher](self, "publisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("publisher"));

  -[SUDescriptor productSystemName](self, "productSystemName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("productSystemName"));

  -[SUDescriptor productVersion](self, "productVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("productVersion"));

  -[SUDescriptor productVersionExtra](self, "productVersionExtra");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("productVersionExtra"));

  -[SUDescriptor productBuildVersion](self, "productBuildVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("productBuildVersion"));

  -[SUDescriptor prerequisiteBuild](self, "prerequisiteBuild");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("prerequisiteBuild"));

  -[SUDescriptor prerequisiteOS](self, "prerequisiteOS");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("prerequisiteOS"));

  -[SUDescriptor releaseType](self, "releaseType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("releaseType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor downloadSize](self, "downloadSize"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("downloadSize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor _unarchiveSize](self, "_unarchiveSize"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("unarchiveSize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor _msuPrepareSize](self, "_msuPrepareSize"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("msuPrepareSize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor installationSize](self, "installationSize"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("installationSize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor minimumSystemPartitionSize](self, "minimumSystemPartitionSize"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("minimumSystemPartitionsize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor preparationSize](self, "preparationSize"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("preparationSize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor totalRequiredFreeSpace](self, "totalRequiredFreeSpace"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("totalRequiredFreeSpace"));

  objc_msgSend(v4, "encodeInt:forKey:", -[SUDescriptor updateType](self, "updateType"), CFSTR("updateType"));
  -[SUDescriptor documentation](self, "documentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("documentation"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor autoDownloadAllowableForCellular](self, "autoDownloadAllowableForCellular"), CFSTR("autoDownloadAllowableForCellular"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor isDownloadableOverCellular](self, "isDownloadableOverCellular"), CFSTR("downloadableOverCellular"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor isDownloadable](self, "isDownloadable"), CFSTR("downloadable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor _isStreamingZipCapable](self, "_isStreamingZipCapable"), CFSTR("streamingZipCapable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor siriVoiceDeletionDisabled](self, "siriVoiceDeletionDisabled"), CFSTR("disableSiriVoiceDeletion"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor cdLevel4Disabled](self, "cdLevel4Disabled"), CFSTR("disableCDLevel4"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor appDemotionDisabled](self, "appDemotionDisabled"), CFSTR("disableAppDemotion"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor installTonightDisabled](self, "installTonightDisabled"), CFSTR("disableInstallTonight"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor rampEnabled](self, "rampEnabled"), CFSTR("rampEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor granularlyRamped](self, "granularlyRamped"), CFSTR("granularlyRamped"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor criticalOutOfBoxOnly](self, "criticalOutOfBoxOnly"), CFSTR("criticalOutOfBoxOnly"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor autoUpdateEnabled](self, "autoUpdateEnabled"), CFSTR("autoUpdateEnabled"));
  -[SUDescriptor setupCritical](self, "setupCritical");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("setupCritical"));

  -[SUDescriptor criticalDownloadPolicy](self, "criticalDownloadPolicy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("criticalDownloadPolicy"));

  -[SUDescriptor systemPartitionPadding](self, "systemPartitionPadding");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("systemPartitionPadding"));

  -[SUDescriptor sepDigest](self, "sepDigest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("SEPDigest"));

  -[SUDescriptor rsepDigest](self, "rsepDigest");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("RSEPDigest"));

  -[SUDescriptor sepTBMDigest](self, "sepTBMDigest");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("SEPTBMDigest"));

  -[SUDescriptor rsepTBMDigest](self, "rsepTBMDigest");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("RSEPTBMDigest"));

  -[SUDescriptor releaseDate](self, "releaseDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("releaseDate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor mdmDelayInterval](self, "mdmDelayInterval"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("MDMDelayInterval"));

  -[SUDescriptor assetID](self, "assetID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("assetID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor hideInstallAlert](self, "hideInstallAlert"), CFSTR("hideInstallAlert"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor audienceType](self, "audienceType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("audienceType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor preferenceType](self, "preferenceType"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("preferenceType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor upgradeType](self, "upgradeType"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("upgradeType"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor promoteAlternateUpdate](self, "promoteAlternateUpdate"), CFSTR("promoteAlternateUpdate"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor isSplatOnly](self, "isSplatOnly"), CFSTR("isSplatOnly"));
  -[SUDescriptor humanReadableUpdateName](self, "humanReadableUpdateName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v34, CFSTR("humanReadableUpdateName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor mandatoryUpdateEligible](self, "mandatoryUpdateEligible"), CFSTR("MandatoryUpdateEligible"));
  -[SUDescriptor mandatoryUpdateVersionMin](self, "mandatoryUpdateVersionMin");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, CFSTR("MandatoryUpdateVersionMin"));

  -[SUDescriptor mandatoryUpdateVersionMax](self, "mandatoryUpdateVersionMax");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v36, CFSTR("MandatoryUpdateVersionMax"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor mandatoryUpdateOptional](self, "mandatoryUpdateOptional"), CFSTR("MandatoryUpdateOptional"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor mandatoryUpdateRestrictedToOutOfTheBox](self, "mandatoryUpdateRestrictedToOutOfTheBox"), CFSTR("MandatoryUpdateRestrictedToOutOfTheBox"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor forcePasscodeRequired](self, "forcePasscodeRequired"), CFSTR("ForcePasscodeRequired"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor allowAutoDownloadOnBattery](self, "allowAutoDownloadOnBattery"), CFSTR("AllowAutoDownloadOnBattery"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[SUDescriptor autoDownloadOnBatteryDelay](self, "autoDownloadOnBatteryDelay"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, CFSTR("AutoDownloadOnBatteryDelay"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[SUDescriptor autoDownloadOnBatteryMinBattery](self, "autoDownloadOnBatteryMinBattery"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v38, CFSTR("AutoDownloadOnBatteryMinBattery"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SUDescriptor isSplombo](self, "isSplombo"), CFSTR("isSplombo"));
  -[SUDescriptor splatComboBuildVersion](self, "splatComboBuildVersion");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, CFSTR("splatComboBuildVersion"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setPublisher:", self->_publisher);
  objc_msgSend(v4, "setProductSystemName:", self->_productSystemName);
  objc_msgSend(v4, "setProductVersion:", self->_productVersion);
  objc_msgSend(v4, "setProductVersionExtra:", self->_productVersionExtra);
  objc_msgSend(v4, "setProductBuildVersion:", self->_productBuildVersion);
  objc_msgSend(v4, "setPrerequisiteBuild:", self->_prerequisiteBuild);
  objc_msgSend(v4, "setPrerequisiteOS:", self->_prerequisiteOS);
  objc_msgSend(v4, "setReleaseType:", self->_releaseType);
  objc_msgSend(v4, "setDownloadSize:", self->_downloadSize);
  objc_msgSend(v4, "_setUnarchiveSize:", self->_unarchiveSize);
  objc_msgSend(v4, "_setMsuPrepareSize:", self->_msuPrepareSize);
  objc_msgSend(v4, "setInstallationSize:", self->_installationSize);
  objc_msgSend(v4, "setPreparationSize:", self->_preparationSize);
  objc_msgSend(v4, "setTotalRequiredFreeSpace:", self->_totalRequiredFreeSpace);
  objc_msgSend(v4, "setUpdateType:", self->_updateType);
  v5 = (void *)-[SUDocumentation copy](self->_documentation, "copy");
  objc_msgSend(v4, "setDocumentation:", v5);

  objc_msgSend(v4, "setAutoDownloadAllowableForCellular:", self->_autoDownloadAllowableForCellular);
  objc_msgSend(v4, "setDownloadableOverCellular:", self->_downloadableOverCellular);
  objc_msgSend(v4, "setDownloadable:", self->_downloadable);
  objc_msgSend(v4, "_setStreamingZipCapable:", self->_streamingZipCapable);
  objc_msgSend(v4, "_setDisableSiriVoiceDeletion:", self->_disableSiriVoiceDeletion);
  objc_msgSend(v4, "_setDisableCDLevel4:", self->_disableCDLevel4);
  objc_msgSend(v4, "_setDisableAppDemotion:", self->_disableAppDemotion);
  objc_msgSend(v4, "_setDisableInstallTonight:", self->_disableIntallTonight);
  objc_msgSend(v4, "setRampEnabled:", self->_rampEnabled);
  objc_msgSend(v4, "setGranularlyRamped:", self->_granularlyRamped);
  objc_msgSend(v4, "setSetupCritical:", self->_setupCritical);
  objc_msgSend(v4, "setCriticalOutOfBoxOnly:", self->_criticalOutOfBoxOnly);
  objc_msgSend(v4, "setAutoUpdateEnabled:", self->_autoUpdateEnabled);
  objc_msgSend(v4, "setCriticalDownloadPolicy:", self->_criticalDownloadPolicy);
  objc_msgSend(v4, "setMinimumSystemPartitionSize:", self->_minimumSystemPartitionSize);
  v6 = (void *)-[NSDictionary copy](self->_systemPartitionPadding, "copy");
  objc_msgSend(v4, "setSystemPartitionPadding:", v6);

  objc_msgSend(v4, "setSEPDigest:", self->_sepDigest);
  objc_msgSend(v4, "setRSEPDigest:", self->_rsepDigest);
  objc_msgSend(v4, "setSEPTBMDigest:", self->_sepTBMDigest);
  objc_msgSend(v4, "setRSEPTBMDigest:", self->_rsepTBMDigest);
  objc_msgSend(v4, "setReleaseDate:", self->_releaseDate);
  objc_msgSend(v4, "setMdmDelayInterval:", self->_mdmDelayInterval);
  objc_msgSend(v4, "setAssetID:", self->_assetID);
  objc_msgSend(v4, "setHideInstallAlert:", self->_hideInstallAlert);
  objc_msgSend(v4, "setAudienceType:", self->_audienceType);
  objc_msgSend(v4, "setPreferenceType:", self->_preferenceType);
  objc_msgSend(v4, "setUpgradeType:", self->_upgradeType);
  objc_msgSend(v4, "setPromoteAlternateUpdate:", self->_promoteAlternateUpdate);
  objc_msgSend(v4, "setIsSplatOnly:", self->_isSplatOnly);
  objc_msgSend(v4, "setHumanReadableUpdateName:", self->_humanReadableUpdateName);
  objc_msgSend(v4, "setMandatoryUpdateEligible:", self->_mandatoryUpdateEligible);
  objc_msgSend(v4, "setMandatoryUpdateVersionMin:", self->_mandatoryUpdateVersionMin);
  objc_msgSend(v4, "setMandatoryUpdateVersionMax:", self->_mandatoryUpdateVersionMax);
  objc_msgSend(v4, "setMandatoryUpdateOptional:", self->_mandatoryUpdateOptional);
  objc_msgSend(v4, "setMandatoryUpdateRestrictedToOutOfTheBox:", self->_mandatoryUpdateRestrictedToOutOfTheBox);
  objc_msgSend(v4, "setForcePasscodeRequired:", self->_forcePasscodeRequired);
  objc_msgSend(v4, "setAllowAutoDownloadOnBattery:", self->_allowAutoDownloadOnBattery);
  objc_msgSend(v4, "setAutoDownloadOnBatteryDelay:", self->_autoDownloadOnBatteryDelay);
  objc_msgSend(v4, "setAutoDownloadOnBatteryMinBattery:", self->_autoDownloadOnBatteryMinBattery);
  objc_msgSend(v4, "setIsSplombo:", self->_isSplombo);
  objc_msgSend(v4, "setSplatComboBuildVersion:", self->_splatComboBuildVersion);
  return v4;
}

- (BOOL)rampEnabled
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "overrideRamping");

  if (!v4)
    return self->_rampEnabled;
  SULogDebug(CFSTR("Default set to override ramping to YES"), v5, v6, v7, v8, v9, v10, v11, v13);
  return 1;
}

- (BOOL)granularlyRamped
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "overrideGranularRamping");

  if (!v4)
    return self->_granularlyRamped;
  SULogDebug(CFSTR("Default set to override granular ramping to YES"), v5, v6, v7, v8, v9, v10, v11, v13);
  return 1;
}

- (NSString)splatComboBuildVersion
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  uint64_t v15;

  if (-[SUDescriptor isSplombo](self, "isSplombo")
    && (+[SUPreferences sharedInstance](SUPreferences, "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "overrideSplatComboBuildVersion"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    SULogDebug(CFSTR("Default set to override splatComboBuildVersion"), v5, v6, v7, v8, v9, v10, v11, v15);
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "overrideSplatComboBuildVersion");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = self->_splatComboBuildVersion;
  }
  return v13;
}

- (BOOL)isValidDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[SUDescriptor productVersion](self, "productVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUDescriptor _hasValue:](self, "_hasValue:", v3))
  {
    -[SUDescriptor productBuildVersion](self, "productBuildVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SUDescriptor _hasValue:](self, "_hasValue:", v4))
    {
      -[SUDescriptor productSystemName](self, "productSystemName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SUDescriptor _hasValue:](self, "_hasValue:", v5))
        v6 = -[SUDescriptor updateType](self, "updateType") != 0;
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_hasValue:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isEqual:", &stru_24CE3EA48) ^ 1;
  else
    return 0;
}

- (id)_buildCompareKey
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v13;

  -[SUDescriptor productVersion](self, "productVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDescriptor productVersionExtra](self, "productVersionExtra");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUDescriptor productVersionExtra](self, "productVersionExtra");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[SUDescriptor productBuildVersion](self, "productBuildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SUDescriptor updateType](self, "updateType");
  v10 = -[SUDescriptor isDownloadable](self, "isDownloadable");
  v11 = -[SUDescriptor isSplombo](self, "isSplombo");
  -[SUDescriptor splatComboBuildVersion](self, "splatComboBuildVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@/%u/%u/%u/%@"), v3, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  SUDescriptor *v4;
  SUDescriptor *v5;
  SUDescriptor *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (SUDescriptor *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v9 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[SUDescriptor _buildCompareKey](self, "_buildCompareKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDescriptor _buildCompareKey](v6, "_buildCompareKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v7, "isEqualToString:", v8);
  }
  else
  {
LABEL_5:
    v9 = 0;
  }
LABEL_7:

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SUDescriptor _buildCompareKey](self, "_buildCompareKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEmergencyOrCritical
{
  return -[SUDescriptor updateType](self, "updateType") == 3;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  _BOOL8 v31;
  _BOOL8 v32;
  _BOOL8 v33;
  _BOOL8 v34;
  _BOOL8 v35;
  _BOOL8 v36;
  _BOOL8 v37;
  _BOOL8 streamingZipCapable;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString *v51;
  __CFString *v52;
  void *v53;
  void *v54;
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
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;

  v43 = (void *)MEMORY[0x24BDD17C8];
  -[SUDescriptor publisher](self, "publisher");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDescriptor humanReadableUpdateName](self, "humanReadableUpdateName");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDescriptor productSystemName](self, "productSystemName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDescriptor productVersion](self, "productVersion");
  v3 = objc_claimAutoreleasedReturnValue();
  -[SUDescriptor productVersionExtra](self, "productVersionExtra");
  v4 = objc_claimAutoreleasedReturnValue();
  -[SUDescriptor productBuildVersion](self, "productBuildVersion");
  v5 = objc_claimAutoreleasedReturnValue();
  -[SUDescriptor prerequisiteBuild](self, "prerequisiteBuild");
  v6 = objc_claimAutoreleasedReturnValue();
  -[SUDescriptor prerequisiteOS](self, "prerequisiteOS");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDescriptor releaseType](self, "releaseType");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor downloadSize](self, "downloadSize"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor _unarchiveSize](self, "_unarchiveSize"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor _msuPrepareSize](self, "_msuPrepareSize"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor preparationSize](self, "preparationSize"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor installationSize](self, "installationSize"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  SUStringFromUpdateType(-[SUDescriptor updateType](self, "updateType"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUDescriptor isDownloadable](self, "isDownloadable"))
    v7 = CFSTR("Yes");
  else
    v7 = CFSTR("No");
  v42 = v7;
  if (-[SUDescriptor isDownloadableOverCellular](self, "isDownloadableOverCellular"))
    v8 = CFSTR("Yes");
  else
    v8 = CFSTR("No");
  v41 = v8;
  if (-[SUDescriptor autoDownloadAllowableForCellular](self, "autoDownloadAllowableForCellular"))
    v9 = CFSTR("Yes");
  else
    v9 = CFSTR("No");
  v40 = v9;
  if (-[SUDescriptor autoUpdateEnabled](self, "autoUpdateEnabled"))
    v10 = CFSTR("Yes");
  else
    v10 = CFSTR("No");
  v39 = v10;
  streamingZipCapable = self->_streamingZipCapable;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor totalRequiredFreeSpace](self, "totalRequiredFreeSpace"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDescriptor documentation](self, "documentation");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[SUDescriptor siriVoiceDeletionDisabled](self, "siriVoiceDeletionDisabled");
  v36 = -[SUDescriptor cdLevel4Disabled](self, "cdLevel4Disabled");
  v35 = -[SUDescriptor appDemotionDisabled](self, "appDemotionDisabled");
  v34 = -[SUDescriptor installTonightDisabled](self, "installTonightDisabled");
  v33 = -[SUDescriptor rampEnabled](self, "rampEnabled");
  v32 = -[SUDescriptor granularlyRamped](self, "granularlyRamped");
  -[SUDescriptor setupCritical](self, "setupCritical");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[SUDescriptor criticalOutOfBoxOnly](self, "criticalOutOfBoxOnly");
  -[SUDescriptor criticalDownloadPolicy](self, "criticalDownloadPolicy");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDescriptor releaseDate](self, "releaseDate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUDescriptor mdmDelayInterval](self, "mdmDelayInterval"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDescriptor assetID](self, "assetID");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("YES");
  if (-[SUDescriptor hideInstallAlert](self, "hideInstallAlert"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v29 = v12;
  SUStringFromAudienceType(-[SUDescriptor audienceType](self, "audienceType"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  SUStringFromPreferredUpdateType(-[SUDescriptor preferenceType](self, "preferenceType"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  SUStringFromVersionUpgradeType(-[SUDescriptor upgradeType](self, "upgradeType"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUDescriptor promoteAlternateUpdate](self, "promoteAlternateUpdate"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  v28 = v13;
  if (-[SUDescriptor isSplatOnly](self, "isSplatOnly"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v27 = v14;
  if (-[SUDescriptor mandatoryUpdateEligible](self, "mandatoryUpdateEligible"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v26 = v15;
  -[SUDescriptor mandatoryUpdateVersionMin](self, "mandatoryUpdateVersionMin");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[SUDescriptor mandatoryUpdateVersionMin](self, "mandatoryUpdateVersionMin");
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = CFSTR("N/A");
  }
  -[SUDescriptor mandatoryUpdateVersionMax](self, "mandatoryUpdateVersionMax");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)v3;
  v46 = (void *)v4;
  v45 = (void *)v5;
  v44 = (void *)v6;
  if (v16)
  {
    -[SUDescriptor mandatoryUpdateVersionMax](self, "mandatoryUpdateVersionMax");
    v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v51 = CFSTR("N/A");
  }
  if (-[SUDescriptor mandatoryUpdateOptional](self, "mandatoryUpdateOptional"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  if (-[SUDescriptor mandatoryUpdateRestrictedToOutOfTheBox](self, "mandatoryUpdateRestrictedToOutOfTheBox"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  if (-[SUDescriptor forcePasscodeRequired](self, "forcePasscodeRequired"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  if (-[SUDescriptor allowAutoDownloadOnBattery](self, "allowAutoDownloadOnBattery"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  v21 = -[SUDescriptor autoDownloadOnBatteryDelay](self, "autoDownloadOnBatteryDelay");
  v22 = -[SUDescriptor autoDownloadOnBatteryMinBattery](self, "autoDownloadOnBatteryMinBattery");
  if (!-[SUDescriptor isSplombo](self, "isSplombo"))
    v11 = CFSTR("NO");
  -[SUDescriptor splatComboBuildVersion](self, "splatComboBuildVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stringWithFormat:", CFSTR("\n            Publisher: %@\n            HumanReadableUpdateName: %@\n            ProductSystemName: %@\n            ProductVersion: %@\n            ProductVersionExtra: %@\n            ProductBuildVersion: %@\n            PrerequisiteBuild: %@\n            PrerequisiteOS: %@\n            ReleaseType: %@\n            DownloadSize: %@\n            UnarchiveSize: %@\n            MSUPrepareSize: %@\n            PreparationSize: %@\n            InstallationSize: %@\n            UpdateType: %@\n            Downloadable: %@\n            DownloadableOverCellular: %@\n            AutoDownloadableOverCellular: %@\n            AutoUpdateEnabled: %@\n            StreamingZipCapable: %d\n            TotalRequiredFreeSpace: %@\n            Documentation: %@\n            SiriVoiceDeletion: %d\n            CDLevel4Deletion: %d\n            appDemotionDisabled: %d\n            installTonightDisabled: %d\n            rampEnabled: %d\n            granularlyRamped: %d\n            setupCritical: %@\n            criticalOutOfBoxOnly: %d\n            criticalDownloadPolicy: %@\n            releaseDate: %@\n            mdmDelayInterval: %@\n            assetID: %@\n            hideInstallAlert %@\n            audienceType %@\n            preferenceType %@\n            upgradeType %@\n            promoteAlternateUpdate: %@\n            isSplatOnly: %@\n            mandatoryUpdateEligible: %@\n            mandatoryUpdateVersionMin: %@\n            mandatoryUpdateVersionMax: %@\n            mandatoryUpdateOptional: %@\n            mandatoryUpdateRestrictedToOutOfTheBox: %@\n            forcePasscodeRequired: %@\n            allowAutoDownloadOnBattery: %@\n            autoDownloadOnBatteryDelay: %u\n            autoDownloadOnBatteryMinbattery: %u%%\n            isSplombo: %@\n            splatComboBuildVersion: %@"), v50, v49, v48, v47, v46, v45, v44, v70, v69, v68, v67, v66, v65, v64, v63, v42,
    v41,
    v40,
    v39,
    streamingZipCapable,
    v62,
    v61,
    v37,
    v36,
    v35,
    v34,
    v33,
    v32,
    v60,
    v31,
    v59,
    v58,
    v57,
    v56,
    v29,
    v55,
    v54,
    v53,
    v28,
    v27,
    v26,
    v52,
    v51,
    v17,
    v18,
    v19,
    v20,
    v21,
    v22,
    v11,
    v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  if (v30)

  return v24;
}

- (void)setPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (void)setProductSystemName:(id)a3
{
  objc_storeStrong((id *)&self->_productSystemName, a3);
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (NSString)productVersionExtra
{
  return self->_productVersionExtra;
}

- (void)setProductVersionExtra:(id)a3
{
  objc_storeStrong((id *)&self->_productVersionExtra, a3);
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productBuildVersion, a3);
}

- (NSString)prerequisiteBuild
{
  return self->_prerequisiteBuild;
}

- (void)setPrerequisiteBuild:(id)a3
{
  objc_storeStrong((id *)&self->_prerequisiteBuild, a3);
}

- (NSString)prerequisiteOS
{
  return self->_prerequisiteOS;
}

- (void)setPrerequisiteOS:(id)a3
{
  objc_storeStrong((id *)&self->_prerequisiteOS, a3);
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_releaseType, a3);
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (void)setDownloadSize:(unint64_t)a3
{
  self->_downloadSize = a3;
}

- (unint64_t)installationSize
{
  return self->_installationSize;
}

- (void)setInstallationSize:(unint64_t)a3
{
  self->_installationSize = a3;
}

- (unint64_t)_unarchiveSize
{
  return self->_unarchiveSize;
}

- (void)_setUnarchiveSize:(unint64_t)a3
{
  self->_unarchiveSize = a3;
}

- (unint64_t)minimumSystemPartitionSize
{
  return self->_minimumSystemPartitionSize;
}

- (void)setMinimumSystemPartitionSize:(unint64_t)a3
{
  self->_minimumSystemPartitionSize = a3;
}

- (unint64_t)_msuPrepareSize
{
  return self->_msuPrepareSize;
}

- (void)_setMsuPrepareSize:(unint64_t)a3
{
  self->_msuPrepareSize = a3;
}

- (unint64_t)preparationSize
{
  return self->_preparationSize;
}

- (void)setPreparationSize:(unint64_t)a3
{
  self->_preparationSize = a3;
}

- (unint64_t)totalRequiredFreeSpace
{
  return self->_totalRequiredFreeSpace;
}

- (void)setTotalRequiredFreeSpace:(unint64_t)a3
{
  self->_totalRequiredFreeSpace = a3;
}

- (int)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(int)a3
{
  self->_updateType = a3;
}

- (SUDocumentation)documentation
{
  return self->_documentation;
}

- (void)setDocumentation:(id)a3
{
  objc_storeStrong((id *)&self->_documentation, a3);
}

- (BOOL)autoDownloadAllowableForCellular
{
  return self->_autoDownloadAllowableForCellular;
}

- (void)setAutoDownloadAllowableForCellular:(BOOL)a3
{
  self->_autoDownloadAllowableForCellular = a3;
}

- (BOOL)isDownloadable
{
  return self->_downloadable;
}

- (void)setDownloadable:(BOOL)a3
{
  self->_downloadable = a3;
}

- (BOOL)isDownloadableOverCellular
{
  return self->_downloadableOverCellular;
}

- (void)setDownloadableOverCellular:(BOOL)a3
{
  self->_downloadableOverCellular = a3;
}

- (BOOL)_isStreamingZipCapable
{
  return self->_streamingZipCapable;
}

- (void)_setStreamingZipCapable:(BOOL)a3
{
  self->_streamingZipCapable = a3;
}

- (BOOL)siriVoiceDeletionDisabled
{
  return self->_disableSiriVoiceDeletion;
}

- (void)_setDisableSiriVoiceDeletion:(BOOL)a3
{
  self->_disableSiriVoiceDeletion = a3;
}

- (BOOL)cdLevel4Disabled
{
  return self->_disableCDLevel4;
}

- (void)_setDisableCDLevel4:(BOOL)a3
{
  self->_disableCDLevel4 = a3;
}

- (BOOL)appDemotionDisabled
{
  return self->_disableAppDemotion;
}

- (void)_setDisableAppDemotion:(BOOL)a3
{
  self->_disableAppDemotion = a3;
}

- (BOOL)installTonightDisabled
{
  return self->_disableIntallTonight;
}

- (void)_setDisableInstallTonight:(BOOL)a3
{
  self->_disableIntallTonight = a3;
}

- (void)setRampEnabled:(BOOL)a3
{
  self->_rampEnabled = a3;
}

- (void)setGranularlyRamped:(BOOL)a3
{
  self->_granularlyRamped = a3;
}

- (NSString)setupCritical
{
  return self->_setupCritical;
}

- (void)setSetupCritical:(id)a3
{
  objc_storeStrong((id *)&self->_setupCritical, a3);
}

- (BOOL)criticalOutOfBoxOnly
{
  return self->_criticalOutOfBoxOnly;
}

- (void)setCriticalOutOfBoxOnly:(BOOL)a3
{
  self->_criticalOutOfBoxOnly = a3;
}

- (BOOL)autoUpdateEnabled
{
  return self->_autoUpdateEnabled;
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  self->_autoUpdateEnabled = a3;
}

- (NSString)criticalDownloadPolicy
{
  return self->_criticalDownloadPolicy;
}

- (void)setCriticalDownloadPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_criticalDownloadPolicy, a3);
}

- (NSDictionary)systemPartitionPadding
{
  return self->_systemPartitionPadding;
}

- (void)setSystemPartitionPadding:(id)a3
{
  objc_storeStrong((id *)&self->_systemPartitionPadding, a3);
}

- (NSData)sepDigest
{
  return self->_sepDigest;
}

- (void)setSEPDigest:(id)a3
{
  objc_storeStrong((id *)&self->_sepDigest, a3);
}

- (NSData)rsepDigest
{
  return self->_rsepDigest;
}

- (void)setRSEPDigest:(id)a3
{
  objc_storeStrong((id *)&self->_rsepDigest, a3);
}

- (NSData)sepTBMDigest
{
  return self->_sepTBMDigest;
}

- (void)setSEPTBMDigest:(id)a3
{
  objc_storeStrong((id *)&self->_sepTBMDigest, a3);
}

- (NSData)rsepTBMDigest
{
  return self->_rsepTBMDigest;
}

- (void)setRSEPTBMDigest:(id)a3
{
  objc_storeStrong((id *)&self->_rsepTBMDigest, a3);
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_releaseDate, a3);
}

- (unint64_t)mdmDelayInterval
{
  return self->_mdmDelayInterval;
}

- (void)setMdmDelayInterval:(unint64_t)a3
{
  self->_mdmDelayInterval = a3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_assetID, a3);
}

- (BOOL)hideInstallAlert
{
  return self->_hideInstallAlert;
}

- (void)setHideInstallAlert:(BOOL)a3
{
  self->_hideInstallAlert = a3;
}

- (unint64_t)audienceType
{
  return self->_audienceType;
}

- (void)setAudienceType:(unint64_t)a3
{
  self->_audienceType = a3;
}

- (unint64_t)preferenceType
{
  return self->_preferenceType;
}

- (void)setPreferenceType:(unint64_t)a3
{
  self->_preferenceType = a3;
}

- (unint64_t)upgradeType
{
  return self->_upgradeType;
}

- (void)setUpgradeType:(unint64_t)a3
{
  self->_upgradeType = a3;
}

- (BOOL)promoteAlternateUpdate
{
  return self->_promoteAlternateUpdate;
}

- (void)setPromoteAlternateUpdate:(BOOL)a3
{
  self->_promoteAlternateUpdate = a3;
}

- (BOOL)isSplatOnly
{
  return self->_isSplatOnly;
}

- (void)setIsSplatOnly:(BOOL)a3
{
  self->_isSplatOnly = a3;
}

- (NSString)humanReadableUpdateName
{
  return self->_humanReadableUpdateName;
}

- (void)setHumanReadableUpdateName:(id)a3
{
  objc_storeStrong((id *)&self->_humanReadableUpdateName, a3);
}

- (BOOL)isSplombo
{
  return self->_isSplombo;
}

- (void)setIsSplombo:(BOOL)a3
{
  self->_isSplombo = a3;
}

- (void)setSplatComboBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_splatComboBuildVersion, a3);
}

- (BOOL)mandatoryUpdateEligible
{
  return self->_mandatoryUpdateEligible;
}

- (void)setMandatoryUpdateEligible:(BOOL)a3
{
  self->_mandatoryUpdateEligible = a3;
}

- (NSString)mandatoryUpdateVersionMin
{
  return self->_mandatoryUpdateVersionMin;
}

- (void)setMandatoryUpdateVersionMin:(id)a3
{
  objc_storeStrong((id *)&self->_mandatoryUpdateVersionMin, a3);
}

- (NSString)mandatoryUpdateVersionMax
{
  return self->_mandatoryUpdateVersionMax;
}

- (void)setMandatoryUpdateVersionMax:(id)a3
{
  objc_storeStrong((id *)&self->_mandatoryUpdateVersionMax, a3);
}

- (BOOL)mandatoryUpdateOptional
{
  return self->_mandatoryUpdateOptional;
}

- (void)setMandatoryUpdateOptional:(BOOL)a3
{
  self->_mandatoryUpdateOptional = a3;
}

- (BOOL)mandatoryUpdateRestrictedToOutOfTheBox
{
  return self->_mandatoryUpdateRestrictedToOutOfTheBox;
}

- (void)setMandatoryUpdateRestrictedToOutOfTheBox:(BOOL)a3
{
  self->_mandatoryUpdateRestrictedToOutOfTheBox = a3;
}

- (BOOL)forcePasscodeRequired
{
  return self->_forcePasscodeRequired;
}

- (void)setForcePasscodeRequired:(BOOL)a3
{
  self->_forcePasscodeRequired = a3;
}

- (BOOL)allowAutoDownloadOnBattery
{
  return self->_allowAutoDownloadOnBattery;
}

- (void)setAllowAutoDownloadOnBattery:(BOOL)a3
{
  self->_allowAutoDownloadOnBattery = a3;
}

- (unsigned)autoDownloadOnBatteryDelay
{
  return self->_autoDownloadOnBatteryDelay;
}

- (void)setAutoDownloadOnBatteryDelay:(unsigned int)a3
{
  self->_autoDownloadOnBatteryDelay = a3;
}

- (unsigned)autoDownloadOnBatteryMinBattery
{
  return self->_autoDownloadOnBatteryMinBattery;
}

- (void)setAutoDownloadOnBatteryMinBattery:(unsigned int)a3
{
  self->_autoDownloadOnBatteryMinBattery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criticalDownloadPolicy, 0);
  objc_storeStrong((id *)&self->_splatComboBuildVersion, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateVersionMax, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateVersionMin, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_rsepTBMDigest, 0);
  objc_storeStrong((id *)&self->_sepTBMDigest, 0);
  objc_storeStrong((id *)&self->_rsepDigest, 0);
  objc_storeStrong((id *)&self->_sepDigest, 0);
  objc_storeStrong((id *)&self->_systemPartitionPadding, 0);
  objc_storeStrong((id *)&self->_setupCritical, 0);
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_prerequisiteOS, 0);
  objc_storeStrong((id *)&self->_prerequisiteBuild, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersionExtra, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productSystemName, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_documentation, 0);
}

@end
