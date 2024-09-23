@implementation BYBackupMetadata

- (BOOL)hasNanoRegistryData
{
  return self->_nanoRegistryData != 0;
}

- (void)setHomeButtonHapticKind:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_homeButtonHapticKind = a3;
}

- (void)setHasHomeButtonHapticKind:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHomeButtonHapticKind
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setDeviceAnalyticsOptIn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_deviceAnalyticsOptIn = a3;
}

- (void)setHasDeviceAnalyticsOptIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDeviceAnalyticsOptIn
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAppAnalyticsOptIn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_appAnalyticsOptIn = a3;
}

- (void)setHasAppAnalyticsOptIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAppAnalyticsOptIn
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLocationServicesOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_locationServicesOptIn = a3;
}

- (void)setHasLocationServicesOptIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasLocationServicesOptIn
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setFindMyiPhoneOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_findMyiPhoneOptIn = a3;
}

- (void)setHasFindMyiPhoneOptIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasFindMyiPhoneOptIn
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSiriOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_siriOptIn = a3;
}

- (void)setHasSiriOptIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasSiriOptIn
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setScreenTimeEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_screenTimeEnabled = a3;
}

- (void)setHasScreenTimeEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasScreenTimeEnabled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_autoUpdateEnabled = a3;
}

- (void)setHasAutoUpdateEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAutoUpdateEnabled
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDidSeeTrueTonePane:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_didSeeTrueTonePane = a3;
}

- (void)setHasDidSeeTrueTonePane:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDidSeeTrueTonePane
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setUserInterfaceStyleMode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_userInterfaceStyleMode = a3;
}

- (void)setHasUserInterfaceStyleMode:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasUserInterfaceStyleMode
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasWalletData
{
  return self->_walletData != 0;
}

- (void)setAutoDownloadEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_autoDownloadEnabled = a3;
}

- (void)setHasAutoDownloadEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAutoDownloadEnabled
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSiriDataSharingOptIn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_siriDataSharingOptIn = a3;
}

- (void)setHasSiriDataSharingOptIn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSiriDataSharingOptIn
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasUniversalData
{
  return self->_universalData != 0;
}

- (BOOL)hasSeedEnrollmentProgram
{
  return self->_seedEnrollmentProgram != 0;
}

- (BOOL)hasSeedEnrollmentAssetAudience
{
  return self->_seedEnrollmentAssetAudience != 0;
}

- (void)setMessagesContactsPresented:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_messagesContactsPresented = a3;
}

- (void)setHasMessagesContactsPresented:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasMessagesContactsPresented
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSettingsContactsPresented:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_settingsContactsPresented = a3;
}

- (void)setHasSettingsContactsPresented:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSettingsContactsPresented
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSettingsDataUsagePresented:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_settingsDataUsagePresented = a3;
}

- (void)setHasSettingsDataUsagePresented:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSettingsDataUsagePresented
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasSeedEnrollmentCatalogID
{
  return self->_seedEnrollmentCatalogID != 0;
}

- (BOOL)hasActionButtonData
{
  return self->_actionButtonData != 0;
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
  v8.super_class = (Class)BYBackupMetadata;
  -[BYBackupMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYBackupMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *nanoRegistryData;
  __int16 has;
  void *v7;
  NSData *walletData;
  __int16 v9;
  void *v10;
  void *v11;
  NSData *universalData;
  NSString *seedEnrollmentProgram;
  NSString *seedEnrollmentAssetAudience;
  __int16 v15;
  void *v16;
  NSString *seedEnrollmentCatalogID;
  NSData *actionButtonData;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  nanoRegistryData = self->_nanoRegistryData;
  if (nanoRegistryData)
    objc_msgSend(v3, "setObject:forKey:", nanoRegistryData, CFSTR("nanoRegistryData"));
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_homeButtonHapticKind);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("homeButtonHapticKind"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_37;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_deviceAnalyticsOptIn);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("deviceAnalyticsOptIn"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_appAnalyticsOptIn);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("appAnalyticsOptIn"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_locationServicesOptIn);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("locationServicesOptIn"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_findMyiPhoneOptIn);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("findMyiPhoneOptIn"));

  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_siriOptIn);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("siriOptIn"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_screenTimeEnabled);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("screenTimeEnabled"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autoUpdateEnabled);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("autoUpdateEnabled"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didSeeTrueTonePane);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("didSeeTrueTonePane"));

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_userInterfaceStyleMode);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("userInterfaceStyleMode"));

  }
LABEL_14:
  walletData = self->_walletData;
  if (walletData)
    objc_msgSend(v3, "setObject:forKey:", walletData, CFSTR("walletData"));
  v9 = (__int16)self->_has;
  if ((v9 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autoDownloadEnabled);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("autoDownloadEnabled"));

    v9 = (__int16)self->_has;
  }
  if ((v9 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_siriDataSharingOptIn);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("siriDataSharingOptIn"));

  }
  universalData = self->_universalData;
  if (universalData)
    objc_msgSend(v3, "setObject:forKey:", universalData, CFSTR("universalData"));
  seedEnrollmentProgram = self->_seedEnrollmentProgram;
  if (seedEnrollmentProgram)
    objc_msgSend(v3, "setObject:forKey:", seedEnrollmentProgram, CFSTR("seedEnrollmentProgram"));
  seedEnrollmentAssetAudience = self->_seedEnrollmentAssetAudience;
  if (seedEnrollmentAssetAudience)
    objc_msgSend(v3, "setObject:forKey:", seedEnrollmentAssetAudience, CFSTR("seedEnrollmentAssetAudience"));
  v15 = (__int16)self->_has;
  if ((v15 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_messagesContactsPresented);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("messagesContactsPresented"));

    v15 = (__int16)self->_has;
    if ((v15 & 0x800) == 0)
    {
LABEL_28:
      if ((v15 & 0x1000) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_settingsContactsPresented);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("settingsContactsPresented"));

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_settingsDataUsagePresented);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("settingsDataUsagePresented"));

  }
LABEL_30:
  seedEnrollmentCatalogID = self->_seedEnrollmentCatalogID;
  if (seedEnrollmentCatalogID)
    objc_msgSend(v3, "setObject:forKey:", seedEnrollmentCatalogID, CFSTR("seedEnrollmentCatalogID"));
  actionButtonData = self->_actionButtonData;
  if (actionButtonData)
    objc_msgSend(v3, "setObject:forKey:", actionButtonData, CFSTR("actionButtonData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BYBackupMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  void *v5;
  __int16 v6;
  __int16 v7;
  id v8;

  v8 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_nanoRegistryData)
    PBDataWriterWriteDataField();
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
  }
  v5 = v8;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = v8;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x100) == 0)
        goto LABEL_8;
      goto LABEL_38;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v5 = v8;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteBOOLField();
  v5 = v8;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  v5 = v8;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteBOOLField();
  v5 = v8;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteBOOLField();
  v5 = v8;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  v5 = v8;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  v5 = v8;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_14:
    PBDataWriterWriteInt64Field();
    v5 = v8;
  }
LABEL_15:
  if (self->_walletData)
  {
    PBDataWriterWriteDataField();
    v5 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v8;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v8;
  }
  if (self->_universalData)
  {
    PBDataWriterWriteDataField();
    v5 = v8;
  }
  if (self->_seedEnrollmentProgram)
  {
    PBDataWriterWriteStringField();
    v5 = v8;
  }
  if (self->_seedEnrollmentAssetAudience)
  {
    PBDataWriterWriteStringField();
    v5 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v8;
    v7 = (__int16)self->_has;
    if ((v7 & 0x800) == 0)
    {
LABEL_29:
      if ((v7 & 0x1000) == 0)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteBOOLField();
  v5 = v8;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_30:
    PBDataWriterWriteBOOLField();
    v5 = v8;
  }
LABEL_31:
  if (self->_seedEnrollmentCatalogID)
  {
    PBDataWriterWriteStringField();
    v5 = v8;
  }
  if (self->_actionButtonData)
  {
    PBDataWriterWriteDataField();
    v5 = v8;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  _DWORD *v8;

  v4 = a3;
  v4[20] = self->_version;
  v8 = v4;
  if (self->_nanoRegistryData)
  {
    objc_msgSend(v4, "setNanoRegistryData:");
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v4[8] = self->_homeButtonHapticKind;
    *((_WORD *)v4 + 54) |= 8u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
      goto LABEL_37;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  v4[7] = self->_deviceAnalyticsOptIn;
  *((_WORD *)v4 + 54) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  v4[6] = self->_appAnalyticsOptIn;
  *((_WORD *)v4 + 54) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  *((_BYTE *)v4 + 100) = self->_locationServicesOptIn;
  *((_WORD *)v4 + 54) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  *((_BYTE *)v4 + 99) = self->_findMyiPhoneOptIn;
  *((_WORD *)v4 + 54) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  *((_BYTE *)v4 + 106) = self->_siriOptIn;
  *((_WORD *)v4 + 54) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  *((_BYTE *)v4 + 102) = self->_screenTimeEnabled;
  *((_WORD *)v4 + 54) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  *((_BYTE *)v4 + 97) = self->_autoUpdateEnabled;
  *((_WORD *)v4 + 54) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_43:
  *((_BYTE *)v4 + 98) = self->_didSeeTrueTonePane;
  *((_WORD *)v4 + 54) |= 0x40u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_13:
    *((_QWORD *)v4 + 1) = self->_userInterfaceStyleMode;
    *((_WORD *)v4 + 54) |= 1u;
  }
LABEL_14:
  if (self->_walletData)
  {
    objc_msgSend(v8, "setWalletData:");
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_BYTE *)v4 + 96) = self->_autoDownloadEnabled;
    *((_WORD *)v4 + 54) |= 0x10u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x2000) != 0)
  {
    *((_BYTE *)v4 + 105) = self->_siriDataSharingOptIn;
    *((_WORD *)v4 + 54) |= 0x2000u;
  }
  if (self->_universalData)
  {
    objc_msgSend(v8, "setUniversalData:");
    v4 = v8;
  }
  if (self->_seedEnrollmentProgram)
  {
    objc_msgSend(v8, "setSeedEnrollmentProgram:");
    v4 = v8;
  }
  if (self->_seedEnrollmentAssetAudience)
  {
    objc_msgSend(v8, "setSeedEnrollmentAssetAudience:");
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0)
  {
    *((_BYTE *)v4 + 101) = self->_messagesContactsPresented;
    *((_WORD *)v4 + 54) |= 0x200u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x800) == 0)
    {
LABEL_28:
      if ((v7 & 0x1000) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_28;
  }
  *((_BYTE *)v4 + 103) = self->_settingsContactsPresented;
  *((_WORD *)v4 + 54) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_29:
    *((_BYTE *)v4 + 104) = self->_settingsDataUsagePresented;
    *((_WORD *)v4 + 54) |= 0x1000u;
  }
LABEL_30:
  if (self->_seedEnrollmentCatalogID)
  {
    objc_msgSend(v8, "setSeedEnrollmentCatalogID:");
    v4 = v8;
  }
  if (self->_actionButtonData)
  {
    objc_msgSend(v8, "setActionButtonData:");
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int16 has;
  uint64_t v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 80) = self->_version;
  v6 = -[NSData copyWithZone:](self->_nanoRegistryData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_homeButtonHapticKind;
    *(_WORD *)(v5 + 108) |= 8u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_deviceAnalyticsOptIn;
  *(_WORD *)(v5 + 108) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 24) = self->_appAnalyticsOptIn;
  *(_WORD *)(v5 + 108) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  *(_BYTE *)(v5 + 100) = self->_locationServicesOptIn;
  *(_WORD *)(v5 + 108) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  *(_BYTE *)(v5 + 99) = self->_findMyiPhoneOptIn;
  *(_WORD *)(v5 + 108) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  *(_BYTE *)(v5 + 106) = self->_siriOptIn;
  *(_WORD *)(v5 + 108) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  *(_BYTE *)(v5 + 102) = self->_screenTimeEnabled;
  *(_WORD *)(v5 + 108) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  *(_BYTE *)(v5 + 97) = self->_autoUpdateEnabled;
  *(_WORD *)(v5 + 108) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_29:
  *(_BYTE *)(v5 + 98) = self->_didSeeTrueTonePane;
  *(_WORD *)(v5 + 108) |= 0x40u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_11:
    *(_QWORD *)(v5 + 8) = self->_userInterfaceStyleMode;
    *(_WORD *)(v5 + 108) |= 1u;
  }
LABEL_12:
  v9 = -[NSData copyWithZone:](self->_walletData, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v9;

  v11 = (__int16)self->_has;
  if ((v11 & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 96) = self->_autoDownloadEnabled;
    *(_WORD *)(v5 + 108) |= 0x10u;
    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x2000) != 0)
  {
    *(_BYTE *)(v5 + 105) = self->_siriDataSharingOptIn;
    *(_WORD *)(v5 + 108) |= 0x2000u;
  }
  v12 = -[NSData copyWithZone:](self->_universalData, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v12;

  v14 = -[NSString copyWithZone:](self->_seedEnrollmentProgram, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[NSString copyWithZone:](self->_seedEnrollmentAssetAudience, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  v18 = (__int16)self->_has;
  if ((v18 & 0x200) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      goto LABEL_18;
LABEL_32:
    *(_BYTE *)(v5 + 103) = self->_settingsContactsPresented;
    *(_WORD *)(v5 + 108) |= 0x800u;
    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  *(_BYTE *)(v5 + 101) = self->_messagesContactsPresented;
  *(_WORD *)(v5 + 108) |= 0x200u;
  v18 = (__int16)self->_has;
  if ((v18 & 0x800) != 0)
    goto LABEL_32;
LABEL_18:
  if ((v18 & 0x1000) != 0)
  {
LABEL_19:
    *(_BYTE *)(v5 + 104) = self->_settingsDataUsagePresented;
    *(_WORD *)(v5 + 108) |= 0x1000u;
  }
LABEL_20:
  v19 = -[NSString copyWithZone:](self->_seedEnrollmentCatalogID, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v19;

  v21 = -[NSData copyWithZone:](self->_actionButtonData, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *nanoRegistryData;
  __int16 has;
  __int16 v7;
  NSData *walletData;
  __int16 v9;
  NSData *universalData;
  NSString *seedEnrollmentProgram;
  NSString *seedEnrollmentAssetAudience;
  NSString *seedEnrollmentCatalogID;
  NSData *actionButtonData;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_126;
  if (self->_version != *((_DWORD *)v4 + 20))
    goto LABEL_126;
  nanoRegistryData = self->_nanoRegistryData;
  if ((unint64_t)nanoRegistryData | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](nanoRegistryData, "isEqual:"))
      goto LABEL_126;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 54);
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_homeButtonHapticKind != *((_DWORD *)v4 + 8))
      goto LABEL_126;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_deviceAnalyticsOptIn != *((_DWORD *)v4 + 7))
      goto LABEL_126;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_appAnalyticsOptIn != *((_DWORD *)v4 + 6))
      goto LABEL_126;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x100) == 0)
      goto LABEL_126;
    if (self->_locationServicesOptIn)
    {
      if (!*((_BYTE *)v4 + 100))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 100))
    {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x100) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_126;
    if (self->_findMyiPhoneOptIn)
    {
      if (!*((_BYTE *)v4 + 99))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 99))
    {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x4000) == 0)
      goto LABEL_126;
    if (self->_siriOptIn)
    {
      if (!*((_BYTE *)v4 + 106))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 106))
    {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x4000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x400) == 0)
      goto LABEL_126;
    if (self->_screenTimeEnabled)
    {
      if (!*((_BYTE *)v4 + 102))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 102))
    {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x400) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0)
      goto LABEL_126;
    if (self->_autoUpdateEnabled)
    {
      if (!*((_BYTE *)v4 + 97))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 97))
    {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0)
      goto LABEL_126;
    if (self->_didSeeTrueTonePane)
    {
      if (!*((_BYTE *)v4 + 98))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 98))
    {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_userInterfaceStyleMode != *((_QWORD *)v4 + 1))
      goto LABEL_126;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_126;
  }
  walletData = self->_walletData;
  if ((unint64_t)walletData | *((_QWORD *)v4 + 11))
  {
    if (!-[NSData isEqual:](walletData, "isEqual:"))
      goto LABEL_126;
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)v4 + 54);
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0)
      goto LABEL_126;
    if (self->_autoDownloadEnabled)
    {
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 96))
    {
      goto LABEL_126;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_126;
  }
  if ((has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x2000) == 0)
      goto LABEL_126;
    if (self->_siriDataSharingOptIn)
    {
      if (!*((_BYTE *)v4 + 105))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 105))
    {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x2000) != 0)
  {
    goto LABEL_126;
  }
  universalData = self->_universalData;
  if ((unint64_t)universalData | *((_QWORD *)v4 + 9)
    && !-[NSData isEqual:](universalData, "isEqual:"))
  {
    goto LABEL_126;
  }
  seedEnrollmentProgram = self->_seedEnrollmentProgram;
  if ((unint64_t)seedEnrollmentProgram | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](seedEnrollmentProgram, "isEqual:"))
      goto LABEL_126;
  }
  seedEnrollmentAssetAudience = self->_seedEnrollmentAssetAudience;
  if ((unint64_t)seedEnrollmentAssetAudience | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](seedEnrollmentAssetAudience, "isEqual:"))
      goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x200) == 0)
      goto LABEL_126;
    if (self->_messagesContactsPresented)
    {
      if (!*((_BYTE *)v4 + 101))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 101))
    {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x200) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x800) == 0)
      goto LABEL_126;
    if (self->_settingsContactsPresented)
    {
      if (!*((_BYTE *)v4 + 103))
        goto LABEL_126;
    }
    else if (*((_BYTE *)v4 + 103))
    {
      goto LABEL_126;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x800) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x1000) != 0)
    {
      if (self->_settingsDataUsagePresented)
      {
        if (!*((_BYTE *)v4 + 104))
          goto LABEL_126;
        goto LABEL_122;
      }
      if (!*((_BYTE *)v4 + 104))
        goto LABEL_122;
    }
LABEL_126:
    v15 = 0;
    goto LABEL_127;
  }
  if ((*((_WORD *)v4 + 54) & 0x1000) != 0)
    goto LABEL_126;
LABEL_122:
  seedEnrollmentCatalogID = self->_seedEnrollmentCatalogID;
  if ((unint64_t)seedEnrollmentCatalogID | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](seedEnrollmentCatalogID, "isEqual:"))
  {
    goto LABEL_126;
  }
  actionButtonData = self->_actionButtonData;
  if ((unint64_t)actionButtonData | *((_QWORD *)v4 + 2))
    v15 = -[NSData isEqual:](actionButtonData, "isEqual:");
  else
    v15 = 1;
LABEL_127:

  return v15;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int version;

  version = self->_version;
  v26 = -[NSData hash](self->_nanoRegistryData, "hash");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v25 = 2654435761 * self->_homeButtonHapticKind;
    if ((has & 4) != 0)
    {
LABEL_3:
      v24 = 2654435761 * self->_deviceAnalyticsOptIn;
      if ((has & 2) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v25 = 0;
    if ((has & 4) != 0)
      goto LABEL_3;
  }
  v24 = 0;
  if ((has & 2) != 0)
  {
LABEL_4:
    v23 = 2654435761 * self->_appAnalyticsOptIn;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v23 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v22 = 2654435761 * self->_locationServicesOptIn;
    if ((has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v22 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    v21 = 2654435761 * self->_findMyiPhoneOptIn;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v21 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_7:
    v20 = 2654435761 * self->_siriOptIn;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v20 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    v19 = 2654435761 * self->_screenTimeEnabled;
    if ((has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v19 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    v17 = 2654435761 * self->_autoUpdateEnabled;
    if ((has & 0x40) != 0)
      goto LABEL_10;
LABEL_20:
    v4 = 0;
    if ((has & 1) != 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_19:
  v17 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_20;
LABEL_10:
  v4 = 2654435761 * self->_didSeeTrueTonePane;
  if ((has & 1) != 0)
  {
LABEL_11:
    v5 = 2654435761 * self->_userInterfaceStyleMode;
    goto LABEL_22;
  }
LABEL_21:
  v5 = 0;
LABEL_22:
  v6 = -[NSData hash](self->_walletData, "hash", v17);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v7 = 2654435761 * self->_autoDownloadEnabled;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_24;
  }
  else
  {
    v7 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_24:
      v8 = 2654435761 * self->_siriDataSharingOptIn;
      goto LABEL_27;
    }
  }
  v8 = 0;
LABEL_27:
  v9 = -[NSData hash](self->_universalData, "hash");
  v10 = -[NSString hash](self->_seedEnrollmentProgram, "hash");
  v11 = -[NSString hash](self->_seedEnrollmentAssetAudience, "hash");
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    v12 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_29;
LABEL_32:
    v13 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_30;
LABEL_33:
    v14 = 0;
    goto LABEL_34;
  }
  v12 = 2654435761 * self->_messagesContactsPresented;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_32;
LABEL_29:
  v13 = 2654435761 * self->_settingsContactsPresented;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_33;
LABEL_30:
  v14 = 2654435761 * self->_settingsDataUsagePresented;
LABEL_34:
  v15 = v26 ^ v25 ^ v24 ^ v23 ^ (2654435761 * version) ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ -[NSString hash](self->_seedEnrollmentCatalogID, "hash");
  return v15 ^ -[NSData hash](self->_actionButtonData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  self->_version = *((_DWORD *)v4 + 20);
  v8 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[BYBackupMetadata setNanoRegistryData:](self, "setNanoRegistryData:");
    v4 = v8;
  }
  v5 = *((_WORD *)v4 + 54);
  if ((v5 & 8) != 0)
  {
    self->_homeButtonHapticKind = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 8u;
    v5 = *((_WORD *)v4 + 54);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        goto LABEL_6;
      goto LABEL_37;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_deviceAnalyticsOptIn = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 54);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  self->_appAnalyticsOptIn = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  self->_locationServicesOptIn = *((_BYTE *)v4 + 100);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x4000) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  self->_findMyiPhoneOptIn = *((_BYTE *)v4 + 99);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x4000) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  self->_siriOptIn = *((_BYTE *)v4 + 106);
  *(_WORD *)&self->_has |= 0x4000u;
  v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  self->_screenTimeEnabled = *((_BYTE *)v4 + 102);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  self->_autoUpdateEnabled = *((_BYTE *)v4 + 97);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x40) == 0)
  {
LABEL_12:
    if ((v5 & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_43:
  self->_didSeeTrueTonePane = *((_BYTE *)v4 + 98);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 54) & 1) != 0)
  {
LABEL_13:
    self->_userInterfaceStyleMode = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 11))
  {
    -[BYBackupMetadata setWalletData:](self, "setWalletData:");
    v4 = v8;
  }
  v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x10) != 0)
  {
    self->_autoDownloadEnabled = *((_BYTE *)v4 + 96);
    *(_WORD *)&self->_has |= 0x10u;
    v6 = *((_WORD *)v4 + 54);
  }
  if ((v6 & 0x2000) != 0)
  {
    self->_siriDataSharingOptIn = *((_BYTE *)v4 + 105);
    *(_WORD *)&self->_has |= 0x2000u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[BYBackupMetadata setUniversalData:](self, "setUniversalData:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[BYBackupMetadata setSeedEnrollmentProgram:](self, "setSeedEnrollmentProgram:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[BYBackupMetadata setSeedEnrollmentAssetAudience:](self, "setSeedEnrollmentAssetAudience:");
    v4 = v8;
  }
  v7 = *((_WORD *)v4 + 54);
  if ((v7 & 0x200) != 0)
  {
    self->_messagesContactsPresented = *((_BYTE *)v4 + 101);
    *(_WORD *)&self->_has |= 0x200u;
    v7 = *((_WORD *)v4 + 54);
    if ((v7 & 0x800) == 0)
    {
LABEL_28:
      if ((v7 & 0x1000) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x800) == 0)
  {
    goto LABEL_28;
  }
  self->_settingsContactsPresented = *((_BYTE *)v4 + 103);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)v4 + 54) & 0x1000) != 0)
  {
LABEL_29:
    self->_settingsDataUsagePresented = *((_BYTE *)v4 + 104);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_30:
  if (*((_QWORD *)v4 + 7))
  {
    -[BYBackupMetadata setSeedEnrollmentCatalogID:](self, "setSeedEnrollmentCatalogID:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[BYBackupMetadata setActionButtonData:](self, "setActionButtonData:");
    v4 = v8;
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

- (NSData)nanoRegistryData
{
  return self->_nanoRegistryData;
}

- (void)setNanoRegistryData:(id)a3
{
  objc_storeStrong((id *)&self->_nanoRegistryData, a3);
}

- (unsigned)homeButtonHapticKind
{
  return self->_homeButtonHapticKind;
}

- (unsigned)deviceAnalyticsOptIn
{
  return self->_deviceAnalyticsOptIn;
}

- (unsigned)appAnalyticsOptIn
{
  return self->_appAnalyticsOptIn;
}

- (BOOL)locationServicesOptIn
{
  return self->_locationServicesOptIn;
}

- (BOOL)findMyiPhoneOptIn
{
  return self->_findMyiPhoneOptIn;
}

- (BOOL)siriOptIn
{
  return self->_siriOptIn;
}

- (BOOL)screenTimeEnabled
{
  return self->_screenTimeEnabled;
}

- (BOOL)autoUpdateEnabled
{
  return self->_autoUpdateEnabled;
}

- (BOOL)didSeeTrueTonePane
{
  return self->_didSeeTrueTonePane;
}

- (int64_t)userInterfaceStyleMode
{
  return self->_userInterfaceStyleMode;
}

- (NSData)walletData
{
  return self->_walletData;
}

- (void)setWalletData:(id)a3
{
  objc_storeStrong((id *)&self->_walletData, a3);
}

- (BOOL)autoDownloadEnabled
{
  return self->_autoDownloadEnabled;
}

- (BOOL)siriDataSharingOptIn
{
  return self->_siriDataSharingOptIn;
}

- (NSData)universalData
{
  return self->_universalData;
}

- (void)setUniversalData:(id)a3
{
  objc_storeStrong((id *)&self->_universalData, a3);
}

- (NSString)seedEnrollmentProgram
{
  return self->_seedEnrollmentProgram;
}

- (void)setSeedEnrollmentProgram:(id)a3
{
  objc_storeStrong((id *)&self->_seedEnrollmentProgram, a3);
}

- (NSString)seedEnrollmentAssetAudience
{
  return self->_seedEnrollmentAssetAudience;
}

- (void)setSeedEnrollmentAssetAudience:(id)a3
{
  objc_storeStrong((id *)&self->_seedEnrollmentAssetAudience, a3);
}

- (BOOL)messagesContactsPresented
{
  return self->_messagesContactsPresented;
}

- (BOOL)settingsContactsPresented
{
  return self->_settingsContactsPresented;
}

- (BOOL)settingsDataUsagePresented
{
  return self->_settingsDataUsagePresented;
}

- (NSString)seedEnrollmentCatalogID
{
  return self->_seedEnrollmentCatalogID;
}

- (void)setSeedEnrollmentCatalogID:(id)a3
{
  objc_storeStrong((id *)&self->_seedEnrollmentCatalogID, a3);
}

- (NSData)actionButtonData
{
  return self->_actionButtonData;
}

- (void)setActionButtonData:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletData, 0);
  objc_storeStrong((id *)&self->_universalData, 0);
  objc_storeStrong((id *)&self->_seedEnrollmentProgram, 0);
  objc_storeStrong((id *)&self->_seedEnrollmentCatalogID, 0);
  objc_storeStrong((id *)&self->_seedEnrollmentAssetAudience, 0);
  objc_storeStrong((id *)&self->_nanoRegistryData, 0);
  objc_storeStrong((id *)&self->_actionButtonData, 0);
}

- (id)expressSettings
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0D8D728]);
  v4 = objc_alloc(MEMORY[0x1E0D82B90]);
  -[BYBackupMetadata universalData](self, "universalData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithData:", v5);

  if (SASExpressSettingsReadFrom())
  {
    v7 = v3;
  }
  else
  {
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BYBackupMetadata(SetupAssistantSupport) expressSettings].cold.1(v8);

    v7 = 0;
  }

  return v7;
}

@end
