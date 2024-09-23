@implementation SASExpressSettings

- (BOOL)hasWatchMigrationData
{
  return self->_watchMigrationData != 0;
}

- (BOOL)hasWalletData
{
  return self->_walletData != 0;
}

- (void)setDeviceAnalyticsOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_deviceAnalyticsOptIn = a3;
}

- (void)setHasDeviceAnalyticsOptIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDeviceAnalyticsOptIn
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAppAnalyticsOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_appAnalyticsOptIn = a3;
}

- (void)setHasAppAnalyticsOptIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAppAnalyticsOptIn
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setLocationServicesOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_locationServicesOptIn = a3;
}

- (void)setHasLocationServicesOptIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLocationServicesOptIn
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setFindMyOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_findMyOptIn = a3;
}

- (void)setHasFindMyOptIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFindMyOptIn
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSiriOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_siriOptIn = a3;
}

- (void)setHasSiriOptIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSiriOptIn
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setScreenTimeEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_screenTimeEnabled = a3;
}

- (void)setHasScreenTimeEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasScreenTimeEnabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSoftwareUpdateAutoUpdateEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_softwareUpdateAutoUpdateEnabled = a3;
}

- (void)setHasSoftwareUpdateAutoUpdateEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSoftwareUpdateAutoUpdateEnabled
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSoftwareUpdateAutoDownloadEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_softwareUpdateAutoDownloadEnabled = a3;
}

- (void)setHasSoftwareUpdateAutoDownloadEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSoftwareUpdateAutoDownloadEnabled
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSiriDataSharingOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_siriDataSharingOptIn = a3;
}

- (void)setHasSiriDataSharingOptIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSiriDataSharingOptIn
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (int)appearanceMode
{
  if ((*(_WORD *)&self->_has & 1) != 0)
    return self->_appearanceMode;
  else
    return 1;
}

- (void)setAppearanceMode:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_appearanceMode = a3;
}

- (void)setHasAppearanceMode:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAppearanceMode
{
  return *(_WORD *)&self->_has & 1;
}

- (id)appearanceModeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return *(&off_1E97DC858 + a3 - 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAppearanceMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIGHT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DARK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUTO")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasDeviceAnalyticsPrivacyBundle
{
  return self->_deviceAnalyticsPrivacyBundle != 0;
}

- (BOOL)hasAppAnalyticsPrivacyBundle
{
  return self->_appAnalyticsPrivacyBundle != 0;
}

- (BOOL)hasLocationServicesPrivacyBundle
{
  return self->_locationServicesPrivacyBundle != 0;
}

- (BOOL)hasFindMyPrivacyBundle
{
  return self->_findMyPrivacyBundle != 0;
}

- (BOOL)hasSiriPrivacyBundle
{
  return self->_siriPrivacyBundle != 0;
}

- (int)displayZoomOption
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_displayZoomOption;
  else
    return 1;
}

- (void)setDisplayZoomOption:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_displayZoomOption = a3;
}

- (void)setHasDisplayZoomOption:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDisplayZoomOption
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)displayZoomOptionAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("STANDARD");
  if (a3 == 2)
  {
    v3 = CFSTR("ZOOMED");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDisplayZoomOption:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STANDARD")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("ZOOMED")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setUnlockWithWatchEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_unlockWithWatchEnabled = a3;
}

- (void)setHasUnlockWithWatchEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasUnlockWithWatchEnabled
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setFileVaultEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_fileVaultEnabled = a3;
}

- (void)setHasFileVaultEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFileVaultEnabled
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSiriVoiceTriggerEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_siriVoiceTriggerEnabled = a3;
}

- (void)setHasSiriVoiceTriggerEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSiriVoiceTriggerEnabled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasProductVersion
{
  return self->_productVersion != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SASExpressSettings;
  -[SASExpressSettings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASExpressSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *watchMigrationData;
  NSData *walletData;
  __int16 has;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  SASExpressSettingsPrivacyBundle *deviceAnalyticsPrivacyBundle;
  void *v20;
  SASExpressSettingsPrivacyBundle *appAnalyticsPrivacyBundle;
  void *v22;
  SASExpressSettingsPrivacyBundle *locationServicesPrivacyBundle;
  void *v24;
  SASExpressSettingsPrivacyBundle *findMyPrivacyBundle;
  void *v26;
  SASExpressSettingsPrivacyBundle *siriPrivacyBundle;
  void *v28;
  NSString *productType;
  NSString *deviceClass;
  __int16 v31;
  void *v32;
  NSString *productVersion;
  int displayZoomOption;
  __CFString *v36;
  void *v37;
  void *v38;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  watchMigrationData = self->_watchMigrationData;
  if (watchMigrationData)
    objc_msgSend(v3, "setObject:forKey:", watchMigrationData, CFSTR("watchMigrationData"));
  walletData = self->_walletData;
  if (walletData)
    objc_msgSend(v3, "setObject:forKey:", walletData, CFSTR("walletData"));
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deviceAnalyticsOptIn);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("deviceAnalyticsOptIn"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x40) == 0)
        goto LABEL_8;
      goto LABEL_18;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appAnalyticsOptIn);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("appAnalyticsOptIn"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_locationServicesOptIn);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("locationServicesOptIn"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_findMyOptIn);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("findMyOptIn"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_siriOptIn);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("siriOptIn"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_screenTimeEnabled);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("screenTimeEnabled"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_softwareUpdateAutoUpdateEnabled);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("softwareUpdateAutoUpdateEnabled"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_softwareUpdateAutoDownloadEnabled);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("softwareUpdateAutoDownloadEnabled"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 1) == 0)
      goto LABEL_29;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_siriDataSharingOptIn);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("siriDataSharingOptIn"));

  if ((*(_WORD *)&self->_has & 1) == 0)
    goto LABEL_29;
LABEL_25:
  v17 = self->_appearanceMode - 1;
  if (v17 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_appearanceMode);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = *(&off_1E97DC858 + v17);
  }
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("appearanceMode"));

LABEL_29:
  deviceAnalyticsPrivacyBundle = self->_deviceAnalyticsPrivacyBundle;
  if (deviceAnalyticsPrivacyBundle)
  {
    -[SASExpressSettingsPrivacyBundle dictionaryRepresentation](deviceAnalyticsPrivacyBundle, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("deviceAnalyticsPrivacyBundle"));

  }
  appAnalyticsPrivacyBundle = self->_appAnalyticsPrivacyBundle;
  if (appAnalyticsPrivacyBundle)
  {
    -[SASExpressSettingsPrivacyBundle dictionaryRepresentation](appAnalyticsPrivacyBundle, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("appAnalyticsPrivacyBundle"));

  }
  locationServicesPrivacyBundle = self->_locationServicesPrivacyBundle;
  if (locationServicesPrivacyBundle)
  {
    -[SASExpressSettingsPrivacyBundle dictionaryRepresentation](locationServicesPrivacyBundle, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("locationServicesPrivacyBundle"));

  }
  findMyPrivacyBundle = self->_findMyPrivacyBundle;
  if (findMyPrivacyBundle)
  {
    -[SASExpressSettingsPrivacyBundle dictionaryRepresentation](findMyPrivacyBundle, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("findMyPrivacyBundle"));

  }
  siriPrivacyBundle = self->_siriPrivacyBundle;
  if (siriPrivacyBundle)
  {
    -[SASExpressSettingsPrivacyBundle dictionaryRepresentation](siriPrivacyBundle, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("siriPrivacyBundle"));

  }
  productType = self->_productType;
  if (productType)
    objc_msgSend(v3, "setObject:forKey:", productType, CFSTR("productType"));
  deviceClass = self->_deviceClass;
  if (deviceClass)
    objc_msgSend(v3, "setObject:forKey:", deviceClass, CFSTR("deviceClass"));
  v31 = (__int16)self->_has;
  if ((v31 & 2) != 0)
  {
    displayZoomOption = self->_displayZoomOption;
    if (displayZoomOption == 1)
    {
      v36 = CFSTR("STANDARD");
    }
    else if (displayZoomOption == 2)
    {
      v36 = CFSTR("ZOOMED");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_displayZoomOption);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("displayZoomOption"));

    v31 = (__int16)self->_has;
    if ((v31 & 0x2000) == 0)
    {
LABEL_45:
      if ((v31 & 0x10) == 0)
        goto LABEL_46;
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_unlockWithWatchEnabled);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("unlockWithWatchEnabled"));

  v31 = (__int16)self->_has;
  if ((v31 & 0x10) == 0)
  {
LABEL_46:
    if ((v31 & 0x400) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fileVaultEnabled);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("fileVaultEnabled"));

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_47:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_siriVoiceTriggerEnabled);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("siriVoiceTriggerEnabled"));

  }
LABEL_48:
  productVersion = self->_productVersion;
  if (productVersion)
    objc_msgSend(v3, "setObject:forKey:", productVersion, CFSTR("productVersion"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SASExpressSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  void *v6;
  id v7;

  v7 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_watchMigrationData)
    PBDataWriterWriteDataField();
  if (self->_walletData)
    PBDataWriterWriteDataField();
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x40) == 0)
        goto LABEL_8;
      goto LABEL_41;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 1) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 1) != 0)
LABEL_15:
    PBDataWriterWriteInt32Field();
LABEL_16:
  if (self->_deviceAnalyticsPrivacyBundle)
    PBDataWriterWriteSubmessage();
  if (self->_appAnalyticsPrivacyBundle)
    PBDataWriterWriteSubmessage();
  if (self->_locationServicesPrivacyBundle)
    PBDataWriterWriteSubmessage();
  if (self->_findMyPrivacyBundle)
    PBDataWriterWriteSubmessage();
  if (self->_siriPrivacyBundle)
    PBDataWriterWriteSubmessage();
  if (!self->_productType)
    -[SASExpressSettings writeTo:].cold.1();
  PBDataWriterWriteStringField();
  if (!self->_deviceClass)
    -[SASExpressSettings writeTo:].cold.2();
  PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = (__int16)self->_has;
  }
  if ((v5 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (__int16)self->_has;
  }
  v6 = v7;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v7;
    v5 = (__int16)self->_has;
  }
  if ((v5 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v7;
  }
  if (self->_productVersion)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  void *v6;
  __int16 v7;
  _DWORD *v8;

  v4 = a3;
  v4[22] = self->_version;
  v8 = v4;
  if (self->_watchMigrationData)
  {
    objc_msgSend(v4, "setWatchMigrationData:");
    v4 = v8;
  }
  if (self->_walletData)
  {
    objc_msgSend(v8, "setWalletData:");
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_BYTE *)v4 + 113) = self->_deviceAnalyticsOptIn;
    *((_WORD *)v4 + 62) |= 8u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x40) == 0)
        goto LABEL_8;
      goto LABEL_36;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_BYTE *)v4 + 112) = self->_appAnalyticsOptIn;
  *((_WORD *)v4 + 62) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  *((_BYTE *)v4 + 116) = self->_locationServicesOptIn;
  *((_WORD *)v4 + 62) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  *((_BYTE *)v4 + 115) = self->_findMyOptIn;
  *((_WORD *)v4 + 62) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  *((_BYTE *)v4 + 119) = self->_siriOptIn;
  *((_WORD *)v4 + 62) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  *((_BYTE *)v4 + 117) = self->_screenTimeEnabled;
  *((_WORD *)v4 + 62) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  *((_BYTE *)v4 + 122) = self->_softwareUpdateAutoUpdateEnabled;
  *((_WORD *)v4 + 62) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  *((_BYTE *)v4 + 121) = self->_softwareUpdateAutoDownloadEnabled;
  *((_WORD *)v4 + 62) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 1) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_42:
  *((_BYTE *)v4 + 118) = self->_siriDataSharingOptIn;
  *((_WORD *)v4 + 62) |= 0x100u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_15:
    v4[4] = self->_appearanceMode;
    *((_WORD *)v4 + 62) |= 1u;
  }
LABEL_16:
  if (self->_deviceAnalyticsPrivacyBundle)
    objc_msgSend(v8, "setDeviceAnalyticsPrivacyBundle:");
  if (self->_appAnalyticsPrivacyBundle)
    objc_msgSend(v8, "setAppAnalyticsPrivacyBundle:");
  if (self->_locationServicesPrivacyBundle)
    objc_msgSend(v8, "setLocationServicesPrivacyBundle:");
  if (self->_findMyPrivacyBundle)
    objc_msgSend(v8, "setFindMyPrivacyBundle:");
  if (self->_siriPrivacyBundle)
    objc_msgSend(v8, "setSiriPrivacyBundle:");
  objc_msgSend(v8, "setProductType:", self->_productType);
  objc_msgSend(v8, "setDeviceClass:", self->_deviceClass);
  v6 = v8;
  v7 = (__int16)self->_has;
  if ((v7 & 2) != 0)
  {
    v8[10] = self->_displayZoomOption;
    *((_WORD *)v8 + 62) |= 2u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x2000) == 0)
    {
LABEL_28:
      if ((v7 & 0x10) == 0)
        goto LABEL_29;
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_28;
  }
  *((_BYTE *)v8 + 123) = self->_unlockWithWatchEnabled;
  *((_WORD *)v8 + 62) |= 0x2000u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x10) == 0)
  {
LABEL_29:
    if ((v7 & 0x400) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_46:
  *((_BYTE *)v8 + 114) = self->_fileVaultEnabled;
  *((_WORD *)v8 + 62) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_30:
    *((_BYTE *)v8 + 120) = self->_siriVoiceTriggerEnabled;
    *((_WORD *)v8 + 62) |= 0x400u;
  }
LABEL_31:
  if (self->_productVersion)
  {
    objc_msgSend(v8, "setProductVersion:");
    v6 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int16 has;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  void *v27;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 88) = self->_version;
  v6 = -[NSData copyWithZone:](self->_watchMigrationData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v6;

  v8 = -[NSData copyWithZone:](self->_walletData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v8;

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v5 + 113) = self->_deviceAnalyticsOptIn;
    *(_WORD *)(v5 + 124) |= 8u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 112) = self->_appAnalyticsOptIn;
  *(_WORD *)(v5 + 124) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  *(_BYTE *)(v5 + 116) = self->_locationServicesOptIn;
  *(_WORD *)(v5 + 124) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  *(_BYTE *)(v5 + 115) = self->_findMyOptIn;
  *(_WORD *)(v5 + 124) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  *(_BYTE *)(v5 + 119) = self->_siriOptIn;
  *(_WORD *)(v5 + 124) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  *(_BYTE *)(v5 + 117) = self->_screenTimeEnabled;
  *(_WORD *)(v5 + 124) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  *(_BYTE *)(v5 + 122) = self->_softwareUpdateAutoUpdateEnabled;
  *(_WORD *)(v5 + 124) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  *(_BYTE *)(v5 + 121) = self->_softwareUpdateAutoDownloadEnabled;
  *(_WORD *)(v5 + 124) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_26:
  *(_BYTE *)(v5 + 118) = self->_siriDataSharingOptIn;
  *(_WORD *)(v5 + 124) |= 0x100u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 16) = self->_appearanceMode;
    *(_WORD *)(v5 + 124) |= 1u;
  }
LABEL_12:
  v11 = -[SASExpressSettingsPrivacyBundle copyWithZone:](self->_deviceAnalyticsPrivacyBundle, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[SASExpressSettingsPrivacyBundle copyWithZone:](self->_appAnalyticsPrivacyBundle, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v13;

  v15 = -[SASExpressSettingsPrivacyBundle copyWithZone:](self->_locationServicesPrivacyBundle, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  v17 = -[SASExpressSettingsPrivacyBundle copyWithZone:](self->_findMyPrivacyBundle, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;

  v19 = -[SASExpressSettingsPrivacyBundle copyWithZone:](self->_siriPrivacyBundle, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v19;

  v21 = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v21;

  v23 = -[NSString copyWithZone:](self->_deviceClass, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v23;

  v25 = (__int16)self->_has;
  if ((v25 & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_displayZoomOption;
    *(_WORD *)(v5 + 124) |= 2u;
    v25 = (__int16)self->_has;
    if ((v25 & 0x2000) == 0)
    {
LABEL_14:
      if ((v25 & 0x10) == 0)
        goto LABEL_15;
LABEL_30:
      *(_BYTE *)(v5 + 114) = self->_fileVaultEnabled;
      *(_WORD *)(v5 + 124) |= 0x10u;
      if ((*(_WORD *)&self->_has & 0x400) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_14;
  }
  *(_BYTE *)(v5 + 123) = self->_unlockWithWatchEnabled;
  *(_WORD *)(v5 + 124) |= 0x2000u;
  v25 = (__int16)self->_has;
  if ((v25 & 0x10) != 0)
    goto LABEL_30;
LABEL_15:
  if ((v25 & 0x400) != 0)
  {
LABEL_16:
    *(_BYTE *)(v5 + 120) = self->_siriVoiceTriggerEnabled;
    *(_WORD *)(v5 + 124) |= 0x400u;
  }
LABEL_17:
  v26 = -[NSString copyWithZone:](self->_productVersion, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v26;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *watchMigrationData;
  NSData *walletData;
  __int16 has;
  __int16 v8;
  SASExpressSettingsPrivacyBundle *deviceAnalyticsPrivacyBundle;
  SASExpressSettingsPrivacyBundle *appAnalyticsPrivacyBundle;
  SASExpressSettingsPrivacyBundle *locationServicesPrivacyBundle;
  SASExpressSettingsPrivacyBundle *findMyPrivacyBundle;
  SASExpressSettingsPrivacyBundle *siriPrivacyBundle;
  NSString *productType;
  NSString *deviceClass;
  __int16 v16;
  __int16 v17;
  char v18;
  NSString *productVersion;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_123;
  if (self->_version != *((_DWORD *)v4 + 22))
    goto LABEL_123;
  watchMigrationData = self->_watchMigrationData;
  if ((unint64_t)watchMigrationData | *((_QWORD *)v4 + 13))
  {
    if (!-[NSData isEqual:](watchMigrationData, "isEqual:"))
      goto LABEL_123;
  }
  walletData = self->_walletData;
  if ((unint64_t)walletData | *((_QWORD *)v4 + 12))
  {
    if (!-[NSData isEqual:](walletData, "isEqual:"))
      goto LABEL_123;
  }
  has = (__int16)self->_has;
  v8 = *((_WORD *)v4 + 62);
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0)
      goto LABEL_123;
    if (self->_deviceAnalyticsOptIn)
    {
      if (!*((_BYTE *)v4 + 113))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 113))
    {
      goto LABEL_123;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_123;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0)
      goto LABEL_123;
    if (self->_appAnalyticsOptIn)
    {
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 112))
    {
      goto LABEL_123;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_123;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0)
      goto LABEL_123;
    if (self->_locationServicesOptIn)
    {
      if (!*((_BYTE *)v4 + 116))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 116))
    {
      goto LABEL_123;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_123;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0)
      goto LABEL_123;
    if (self->_findMyOptIn)
    {
      if (!*((_BYTE *)v4 + 115))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 115))
    {
      goto LABEL_123;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_123;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x200) == 0)
      goto LABEL_123;
    if (self->_siriOptIn)
    {
      if (!*((_BYTE *)v4 + 119))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 119))
    {
      goto LABEL_123;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x200) != 0)
  {
    goto LABEL_123;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0)
      goto LABEL_123;
    if (self->_screenTimeEnabled)
    {
      if (!*((_BYTE *)v4 + 117))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 117))
    {
      goto LABEL_123;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_123;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x1000) == 0)
      goto LABEL_123;
    if (self->_softwareUpdateAutoUpdateEnabled)
    {
      if (!*((_BYTE *)v4 + 122))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 122))
    {
      goto LABEL_123;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x1000) != 0)
  {
    goto LABEL_123;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x800) == 0)
      goto LABEL_123;
    if (self->_softwareUpdateAutoDownloadEnabled)
    {
      if (!*((_BYTE *)v4 + 121))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 121))
    {
      goto LABEL_123;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x800) != 0)
  {
    goto LABEL_123;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x100) == 0)
      goto LABEL_123;
    if (self->_siriDataSharingOptIn)
    {
      if (!*((_BYTE *)v4 + 118))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 118))
    {
      goto LABEL_123;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) != 0)
  {
    goto LABEL_123;
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_appearanceMode != *((_DWORD *)v4 + 4))
      goto LABEL_123;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_123;
  }
  deviceAnalyticsPrivacyBundle = self->_deviceAnalyticsPrivacyBundle;
  if ((unint64_t)deviceAnalyticsPrivacyBundle | *((_QWORD *)v4 + 3)
    && !-[SASExpressSettingsPrivacyBundle isEqual:](deviceAnalyticsPrivacyBundle, "isEqual:"))
  {
    goto LABEL_123;
  }
  appAnalyticsPrivacyBundle = self->_appAnalyticsPrivacyBundle;
  if ((unint64_t)appAnalyticsPrivacyBundle | *((_QWORD *)v4 + 1))
  {
    if (!-[SASExpressSettingsPrivacyBundle isEqual:](appAnalyticsPrivacyBundle, "isEqual:"))
      goto LABEL_123;
  }
  locationServicesPrivacyBundle = self->_locationServicesPrivacyBundle;
  if ((unint64_t)locationServicesPrivacyBundle | *((_QWORD *)v4 + 7))
  {
    if (!-[SASExpressSettingsPrivacyBundle isEqual:](locationServicesPrivacyBundle, "isEqual:"))
      goto LABEL_123;
  }
  findMyPrivacyBundle = self->_findMyPrivacyBundle;
  if ((unint64_t)findMyPrivacyBundle | *((_QWORD *)v4 + 6))
  {
    if (!-[SASExpressSettingsPrivacyBundle isEqual:](findMyPrivacyBundle, "isEqual:"))
      goto LABEL_123;
  }
  siriPrivacyBundle = self->_siriPrivacyBundle;
  if ((unint64_t)siriPrivacyBundle | *((_QWORD *)v4 + 10))
  {
    if (!-[SASExpressSettingsPrivacyBundle isEqual:](siriPrivacyBundle, "isEqual:"))
      goto LABEL_123;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](productType, "isEqual:"))
      goto LABEL_123;
  }
  deviceClass = self->_deviceClass;
  if ((unint64_t)deviceClass | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](deviceClass, "isEqual:"))
      goto LABEL_123;
  }
  v16 = (__int16)self->_has;
  v17 = *((_WORD *)v4 + 62);
  if ((v16 & 2) != 0)
  {
    if ((v17 & 2) == 0 || self->_displayZoomOption != *((_DWORD *)v4 + 10))
      goto LABEL_123;
  }
  else if ((v17 & 2) != 0)
  {
    goto LABEL_123;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x2000) == 0)
      goto LABEL_123;
    if (self->_unlockWithWatchEnabled)
    {
      if (!*((_BYTE *)v4 + 123))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 123))
    {
      goto LABEL_123;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x2000) != 0)
  {
    goto LABEL_123;
  }
  if ((v16 & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0)
      goto LABEL_123;
    if (self->_fileVaultEnabled)
    {
      if (!*((_BYTE *)v4 + 114))
        goto LABEL_123;
    }
    else if (*((_BYTE *)v4 + 114))
    {
      goto LABEL_123;
    }
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_123;
  }
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x400) == 0)
      goto LABEL_129;
LABEL_123:
    v18 = 0;
    goto LABEL_124;
  }
  if ((*((_WORD *)v4 + 62) & 0x400) == 0)
    goto LABEL_123;
  if (!self->_siriVoiceTriggerEnabled)
  {
    if (!*((_BYTE *)v4 + 120))
      goto LABEL_129;
    goto LABEL_123;
  }
  if (!*((_BYTE *)v4 + 120))
    goto LABEL_123;
LABEL_129:
  productVersion = self->_productVersion;
  if ((unint64_t)productVersion | *((_QWORD *)v4 + 9))
    v18 = -[NSString isEqual:](productVersion, "isEqual:");
  else
    v18 = 1;
LABEL_124:

  return v18;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int version;

  version = self->_version;
  v29 = -[NSData hash](self->_watchMigrationData, "hash");
  v28 = -[NSData hash](self->_walletData, "hash");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v27 = 2654435761 * self->_deviceAnalyticsOptIn;
    if ((has & 4) != 0)
    {
LABEL_3:
      v26 = 2654435761 * self->_appAnalyticsOptIn;
      if ((has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v27 = 0;
    if ((has & 4) != 0)
      goto LABEL_3;
  }
  v26 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    v25 = 2654435761 * self->_locationServicesOptIn;
    if ((has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v25 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    v24 = 2654435761 * self->_findMyOptIn;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v24 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_6:
    v23 = 2654435761 * self->_siriOptIn;
    if ((has & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v23 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_7:
    v22 = 2654435761 * self->_screenTimeEnabled;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v22 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_8:
    v21 = 2654435761 * self->_softwareUpdateAutoUpdateEnabled;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v21 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    v20 = 2654435761 * self->_softwareUpdateAutoDownloadEnabled;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
LABEL_20:
    v18 = 0;
    if ((has & 1) != 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_19:
  v20 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_20;
LABEL_10:
  v18 = 2654435761 * self->_siriDataSharingOptIn;
  if ((has & 1) != 0)
  {
LABEL_11:
    v4 = 2654435761 * self->_appearanceMode;
    goto LABEL_22;
  }
LABEL_21:
  v4 = 0;
LABEL_22:
  v5 = -[SASExpressSettingsPrivacyBundle hash](self->_deviceAnalyticsPrivacyBundle, "hash", v18);
  v6 = -[SASExpressSettingsPrivacyBundle hash](self->_appAnalyticsPrivacyBundle, "hash");
  v7 = -[SASExpressSettingsPrivacyBundle hash](self->_locationServicesPrivacyBundle, "hash");
  v8 = -[SASExpressSettingsPrivacyBundle hash](self->_findMyPrivacyBundle, "hash");
  v9 = -[SASExpressSettingsPrivacyBundle hash](self->_siriPrivacyBundle, "hash");
  v10 = -[NSString hash](self->_productType, "hash");
  v11 = -[NSString hash](self->_deviceClass, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 2) != 0)
  {
    v13 = 2654435761 * self->_displayZoomOption;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_24:
      v14 = 2654435761 * self->_unlockWithWatchEnabled;
      if ((v12 & 0x10) != 0)
        goto LABEL_25;
LABEL_29:
      v15 = 0;
      if ((*(_WORD *)&self->_has & 0x400) != 0)
        goto LABEL_26;
LABEL_30:
      v16 = 0;
      return v29 ^ v28 ^ v27 ^ v26 ^ (2654435761 * version) ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[NSString hash](self->_productVersion, "hash");
    }
  }
  else
  {
    v13 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_24;
  }
  v14 = 0;
  if ((v12 & 0x10) == 0)
    goto LABEL_29;
LABEL_25:
  v15 = 2654435761 * self->_fileVaultEnabled;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_30;
LABEL_26:
  v16 = 2654435761 * self->_siriVoiceTriggerEnabled;
  return v29 ^ v28 ^ v27 ^ v26 ^ (2654435761 * version) ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[NSString hash](self->_productVersion, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  SASExpressSettingsPrivacyBundle *deviceAnalyticsPrivacyBundle;
  uint64_t v7;
  SASExpressSettingsPrivacyBundle *appAnalyticsPrivacyBundle;
  uint64_t v9;
  SASExpressSettingsPrivacyBundle *locationServicesPrivacyBundle;
  uint64_t v11;
  SASExpressSettingsPrivacyBundle *findMyPrivacyBundle;
  uint64_t v13;
  SASExpressSettingsPrivacyBundle *siriPrivacyBundle;
  uint64_t v15;
  __int16 v16;
  id v17;

  v4 = a3;
  self->_version = *((_DWORD *)v4 + 22);
  v17 = v4;
  if (*((_QWORD *)v4 + 13))
  {
    -[SASExpressSettings setWatchMigrationData:](self, "setWatchMigrationData:");
    v4 = v17;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[SASExpressSettings setWalletData:](self, "setWalletData:");
    v4 = v17;
  }
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 8) != 0)
  {
    self->_deviceAnalyticsOptIn = *((_BYTE *)v4 + 113);
    *(_WORD *)&self->_has |= 8u;
    v5 = *((_WORD *)v4 + 62);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 0x40) == 0)
        goto LABEL_8;
      goto LABEL_21;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_appAnalyticsOptIn = *((_BYTE *)v4 + 112);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_locationServicesOptIn = *((_BYTE *)v4 + 116);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_findMyOptIn = *((_BYTE *)v4 + 115);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_siriOptIn = *((_BYTE *)v4 + 119);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  self->_screenTimeEnabled = *((_BYTE *)v4 + 117);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x1000) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  self->_softwareUpdateAutoUpdateEnabled = *((_BYTE *)v4 + 122);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_27;
  }
LABEL_26:
  self->_softwareUpdateAutoDownloadEnabled = *((_BYTE *)v4 + 121);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x100) == 0)
  {
LABEL_14:
    if ((v5 & 1) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_27:
  self->_siriDataSharingOptIn = *((_BYTE *)v4 + 118);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 62) & 1) != 0)
  {
LABEL_15:
    self->_appearanceMode = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_16:
  deviceAnalyticsPrivacyBundle = self->_deviceAnalyticsPrivacyBundle;
  v7 = *((_QWORD *)v4 + 3);
  if (deviceAnalyticsPrivacyBundle)
  {
    if (!v7)
      goto LABEL_32;
    -[SASExpressSettingsPrivacyBundle mergeFrom:](deviceAnalyticsPrivacyBundle, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_32;
    -[SASExpressSettings setDeviceAnalyticsPrivacyBundle:](self, "setDeviceAnalyticsPrivacyBundle:");
  }
  v4 = v17;
LABEL_32:
  appAnalyticsPrivacyBundle = self->_appAnalyticsPrivacyBundle;
  v9 = *((_QWORD *)v4 + 1);
  if (appAnalyticsPrivacyBundle)
  {
    if (!v9)
      goto LABEL_38;
    -[SASExpressSettingsPrivacyBundle mergeFrom:](appAnalyticsPrivacyBundle, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_38;
    -[SASExpressSettings setAppAnalyticsPrivacyBundle:](self, "setAppAnalyticsPrivacyBundle:");
  }
  v4 = v17;
LABEL_38:
  locationServicesPrivacyBundle = self->_locationServicesPrivacyBundle;
  v11 = *((_QWORD *)v4 + 7);
  if (locationServicesPrivacyBundle)
  {
    if (!v11)
      goto LABEL_44;
    -[SASExpressSettingsPrivacyBundle mergeFrom:](locationServicesPrivacyBundle, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_44;
    -[SASExpressSettings setLocationServicesPrivacyBundle:](self, "setLocationServicesPrivacyBundle:");
  }
  v4 = v17;
LABEL_44:
  findMyPrivacyBundle = self->_findMyPrivacyBundle;
  v13 = *((_QWORD *)v4 + 6);
  if (findMyPrivacyBundle)
  {
    if (!v13)
      goto LABEL_50;
    -[SASExpressSettingsPrivacyBundle mergeFrom:](findMyPrivacyBundle, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_50;
    -[SASExpressSettings setFindMyPrivacyBundle:](self, "setFindMyPrivacyBundle:");
  }
  v4 = v17;
LABEL_50:
  siriPrivacyBundle = self->_siriPrivacyBundle;
  v15 = *((_QWORD *)v4 + 10);
  if (siriPrivacyBundle)
  {
    if (!v15)
      goto LABEL_56;
    -[SASExpressSettingsPrivacyBundle mergeFrom:](siriPrivacyBundle, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_56;
    -[SASExpressSettings setSiriPrivacyBundle:](self, "setSiriPrivacyBundle:");
  }
  v4 = v17;
LABEL_56:
  if (*((_QWORD *)v4 + 8))
  {
    -[SASExpressSettings setProductType:](self, "setProductType:");
    v4 = v17;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[SASExpressSettings setDeviceClass:](self, "setDeviceClass:");
    v4 = v17;
  }
  v16 = *((_WORD *)v4 + 62);
  if ((v16 & 2) != 0)
  {
    self->_displayZoomOption = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 2u;
    v16 = *((_WORD *)v4 + 62);
    if ((v16 & 0x2000) == 0)
    {
LABEL_62:
      if ((v16 & 0x10) == 0)
        goto LABEL_63;
      goto LABEL_70;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x2000) == 0)
  {
    goto LABEL_62;
  }
  self->_unlockWithWatchEnabled = *((_BYTE *)v4 + 123);
  *(_WORD *)&self->_has |= 0x2000u;
  v16 = *((_WORD *)v4 + 62);
  if ((v16 & 0x10) == 0)
  {
LABEL_63:
    if ((v16 & 0x400) == 0)
      goto LABEL_65;
    goto LABEL_64;
  }
LABEL_70:
  self->_fileVaultEnabled = *((_BYTE *)v4 + 114);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 62) & 0x400) != 0)
  {
LABEL_64:
    self->_siriVoiceTriggerEnabled = *((_BYTE *)v4 + 120);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_65:
  if (*((_QWORD *)v4 + 9))
  {
    -[SASExpressSettings setProductVersion:](self, "setProductVersion:");
    v4 = v17;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (NSData)watchMigrationData
{
  return self->_watchMigrationData;
}

- (void)setWatchMigrationData:(id)a3
{
  objc_storeStrong((id *)&self->_watchMigrationData, a3);
}

- (NSData)walletData
{
  return self->_walletData;
}

- (void)setWalletData:(id)a3
{
  objc_storeStrong((id *)&self->_walletData, a3);
}

- (BOOL)deviceAnalyticsOptIn
{
  return self->_deviceAnalyticsOptIn;
}

- (BOOL)appAnalyticsOptIn
{
  return self->_appAnalyticsOptIn;
}

- (BOOL)locationServicesOptIn
{
  return self->_locationServicesOptIn;
}

- (BOOL)findMyOptIn
{
  return self->_findMyOptIn;
}

- (BOOL)siriOptIn
{
  return self->_siriOptIn;
}

- (BOOL)screenTimeEnabled
{
  return self->_screenTimeEnabled;
}

- (BOOL)softwareUpdateAutoUpdateEnabled
{
  return self->_softwareUpdateAutoUpdateEnabled;
}

- (BOOL)softwareUpdateAutoDownloadEnabled
{
  return self->_softwareUpdateAutoDownloadEnabled;
}

- (BOOL)siriDataSharingOptIn
{
  return self->_siriDataSharingOptIn;
}

- (SASExpressSettingsPrivacyBundle)deviceAnalyticsPrivacyBundle
{
  return self->_deviceAnalyticsPrivacyBundle;
}

- (void)setDeviceAnalyticsPrivacyBundle:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAnalyticsPrivacyBundle, a3);
}

- (SASExpressSettingsPrivacyBundle)appAnalyticsPrivacyBundle
{
  return self->_appAnalyticsPrivacyBundle;
}

- (void)setAppAnalyticsPrivacyBundle:(id)a3
{
  objc_storeStrong((id *)&self->_appAnalyticsPrivacyBundle, a3);
}

- (SASExpressSettingsPrivacyBundle)locationServicesPrivacyBundle
{
  return self->_locationServicesPrivacyBundle;
}

- (void)setLocationServicesPrivacyBundle:(id)a3
{
  objc_storeStrong((id *)&self->_locationServicesPrivacyBundle, a3);
}

- (SASExpressSettingsPrivacyBundle)findMyPrivacyBundle
{
  return self->_findMyPrivacyBundle;
}

- (void)setFindMyPrivacyBundle:(id)a3
{
  objc_storeStrong((id *)&self->_findMyPrivacyBundle, a3);
}

- (SASExpressSettingsPrivacyBundle)siriPrivacyBundle
{
  return self->_siriPrivacyBundle;
}

- (void)setSiriPrivacyBundle:(id)a3
{
  objc_storeStrong((id *)&self->_siriPrivacyBundle, a3);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_storeStrong((id *)&self->_deviceClass, a3);
}

- (BOOL)unlockWithWatchEnabled
{
  return self->_unlockWithWatchEnabled;
}

- (BOOL)fileVaultEnabled
{
  return self->_fileVaultEnabled;
}

- (BOOL)siriVoiceTriggerEnabled
{
  return self->_siriVoiceTriggerEnabled;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchMigrationData, 0);
  objc_storeStrong((id *)&self->_walletData, 0);
  objc_storeStrong((id *)&self->_siriPrivacyBundle, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_locationServicesPrivacyBundle, 0);
  objc_storeStrong((id *)&self->_findMyPrivacyBundle, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_deviceAnalyticsPrivacyBundle, 0);
  objc_storeStrong((id *)&self->_appAnalyticsPrivacyBundle, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SASExpressSettings writeTo:]", "SASExpressSettings.m", 755, "nil != self->_productType");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SASExpressSettings writeTo:]", "SASExpressSettings.m", 760, "nil != self->_deviceClass");
}

@end
