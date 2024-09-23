@implementation TRISystemDimensions

- (BOOL)hasDeviceClass
{
  return self->_deviceClass != 0;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isInternalBuild = a3;
}

- (void)setHasIsInternalBuild:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsInternalBuild
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsBetaUser:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isBetaUser = a3;
}

- (void)setHasIsBetaUser:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsBetaUser
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasVersionTag
{
  return self->_versionTag != 0;
}

- (BOOL)hasOsBuild
{
  return self->_osBuild != 0;
}

- (BOOL)hasUserSettingsLanguageCode
{
  return self->_userSettingsLanguageCode != 0;
}

- (BOOL)hasUserSettingsRegionCode
{
  return self->_userSettingsRegionCode != 0;
}

- (void)clearUserKeyboardEnabledInputModeIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_userKeyboardEnabledInputModeIdentifiers, "removeAllObjects");
}

- (void)addUserKeyboardEnabledInputModeIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *userKeyboardEnabledInputModeIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  userKeyboardEnabledInputModeIdentifiers = self->_userKeyboardEnabledInputModeIdentifiers;
  v8 = v4;
  if (!userKeyboardEnabledInputModeIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_userKeyboardEnabledInputModeIdentifiers;
    self->_userKeyboardEnabledInputModeIdentifiers = v6;

    v4 = v8;
    userKeyboardEnabledInputModeIdentifiers = self->_userKeyboardEnabledInputModeIdentifiers;
  }
  -[NSMutableArray addObject:](userKeyboardEnabledInputModeIdentifiers, "addObject:", v4);

}

- (unint64_t)userKeyboardEnabledInputModeIdentifiersCount
{
  return -[NSMutableArray count](self->_userKeyboardEnabledInputModeIdentifiers, "count");
}

- (id)userKeyboardEnabledInputModeIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_userKeyboardEnabledInputModeIdentifiers, "objectAtIndex:", a3);
}

+ (Class)userKeyboardEnabledInputModeIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUserSettingsBcp47DeviceLocale
{
  return self->_userSettingsBcp47DeviceLocale != 0;
}

- (int)targetedPopulation
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_targetedPopulation;
  else
    return 0;
}

- (void)setTargetedPopulation:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_targetedPopulation = a3;
}

- (void)setHasTargetedPopulation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTargetedPopulation
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)targetedPopulationAsString:(int)a3
{
  if (a3 < 6)
    return off_1E2E9C170[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTargetedPopulation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POPULATION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIMITED_CARRY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ORGANIZATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERNAL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BETA_PROGRAM")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GENERAL_PUBLIC")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCarrierCountryIsoCode
{
  return self->_carrierCountryIsoCode != 0;
}

- (BOOL)hasCarrierBundleIdentifier
{
  return self->_carrierBundleIdentifier != 0;
}

- (void)setExperimentOptOutStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_experimentOptOutStatus = a3;
}

- (void)setHasExperimentOptOutStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExperimentOptOutStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAneVersion
{
  return self->_aneVersion != 0;
}

- (void)setIsAutomatedTestDevice:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isAutomatedTestDevice = a3;
}

- (void)setHasIsAutomatedTestDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsAutomatedTestDevice
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)TRISystemDimensions;
  -[TRISystemDimensions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRISystemDimensions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *deviceClass;
  char has;
  void *v7;
  void *v8;
  NSString *versionTag;
  NSString *osBuild;
  NSString *userSettingsLanguageCode;
  NSString *userSettingsRegionCode;
  NSMutableArray *userKeyboardEnabledInputModeIdentifiers;
  NSString *userSettingsBcp47DeviceLocale;
  uint64_t targetedPopulation;
  __CFString *v16;
  NSString *carrierCountryIsoCode;
  NSString *carrierBundleIdentifier;
  void *v19;
  NSString *aneVersion;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  deviceClass = self->_deviceClass;
  if (deviceClass)
    objc_msgSend(v3, "setObject:forKey:", deviceClass, CFSTR("device_class"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInternalBuild);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("is_internal_build"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isBetaUser);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("is_beta_user"));

  }
  versionTag = self->_versionTag;
  if (versionTag)
    objc_msgSend(v4, "setObject:forKey:", versionTag, CFSTR("version_tag"));
  osBuild = self->_osBuild;
  if (osBuild)
    objc_msgSend(v4, "setObject:forKey:", osBuild, CFSTR("os_build"));
  userSettingsLanguageCode = self->_userSettingsLanguageCode;
  if (userSettingsLanguageCode)
    objc_msgSend(v4, "setObject:forKey:", userSettingsLanguageCode, CFSTR("user_settings_language_code"));
  userSettingsRegionCode = self->_userSettingsRegionCode;
  if (userSettingsRegionCode)
    objc_msgSend(v4, "setObject:forKey:", userSettingsRegionCode, CFSTR("user_settings_region_code"));
  userKeyboardEnabledInputModeIdentifiers = self->_userKeyboardEnabledInputModeIdentifiers;
  if (userKeyboardEnabledInputModeIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", userKeyboardEnabledInputModeIdentifiers, CFSTR("user_keyboard_enabled_input_mode_identifiers"));
  userSettingsBcp47DeviceLocale = self->_userSettingsBcp47DeviceLocale;
  if (userSettingsBcp47DeviceLocale)
    objc_msgSend(v4, "setObject:forKey:", userSettingsBcp47DeviceLocale, CFSTR("user_settings_bcp47_device_locale"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    targetedPopulation = self->_targetedPopulation;
    if (targetedPopulation >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_targetedPopulation);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E2E9C170[targetedPopulation];
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("targeted_population"));

  }
  carrierCountryIsoCode = self->_carrierCountryIsoCode;
  if (carrierCountryIsoCode)
    objc_msgSend(v4, "setObject:forKey:", carrierCountryIsoCode, CFSTR("carrier_country_iso_code"));
  carrierBundleIdentifier = self->_carrierBundleIdentifier;
  if (carrierBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", carrierBundleIdentifier, CFSTR("carrier_bundle_identifier"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_experimentOptOutStatus);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("experiment_opt_out_status"));

  }
  aneVersion = self->_aneVersion;
  if (aneVersion)
    objc_msgSend(v4, "setObject:forKey:", aneVersion, CFSTR("ane_version"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAutomatedTestDevice);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("is_automated_test_device"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRISystemDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_deviceClass)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_versionTag)
    PBDataWriterWriteStringField();
  if (self->_osBuild)
    PBDataWriterWriteStringField();
  if (self->_userSettingsLanguageCode)
    PBDataWriterWriteStringField();
  if (self->_userSettingsRegionCode)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_userKeyboardEnabledInputModeIdentifiers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_userSettingsBcp47DeviceLocale)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_carrierCountryIsoCode)
    PBDataWriterWriteStringField();
  if (self->_carrierBundleIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_aneVersion)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _BYTE *v10;
  _BYTE *v11;

  v4 = a3;
  v11 = v4;
  if (self->_deviceClass)
  {
    objc_msgSend(v4, "setDeviceClass:");
    v4 = v11;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[99] = self->_isInternalBuild;
    v4[100] |= 0x10u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[98] = self->_isBetaUser;
    v4[100] |= 8u;
  }
  if (self->_versionTag)
    objc_msgSend(v11, "setVersionTag:");
  if (self->_osBuild)
    objc_msgSend(v11, "setOsBuild:");
  if (self->_userSettingsLanguageCode)
    objc_msgSend(v11, "setUserSettingsLanguageCode:");
  if (self->_userSettingsRegionCode)
    objc_msgSend(v11, "setUserSettingsRegionCode:");
  if (-[TRISystemDimensions userKeyboardEnabledInputModeIdentifiersCount](self, "userKeyboardEnabledInputModeIdentifiersCount"))
  {
    objc_msgSend(v11, "clearUserKeyboardEnabledInputModeIdentifiers");
    v6 = -[TRISystemDimensions userKeyboardEnabledInputModeIdentifiersCount](self, "userKeyboardEnabledInputModeIdentifiersCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[TRISystemDimensions userKeyboardEnabledInputModeIdentifiersAtIndex:](self, "userKeyboardEnabledInputModeIdentifiersAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addUserKeyboardEnabledInputModeIdentifiers:", v9);

      }
    }
  }
  if (self->_userSettingsBcp47DeviceLocale)
    objc_msgSend(v11, "setUserSettingsBcp47DeviceLocale:");
  v10 = v11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v11 + 12) = self->_targetedPopulation;
    v11[100] |= 1u;
  }
  if (self->_carrierCountryIsoCode)
  {
    objc_msgSend(v11, "setCarrierCountryIsoCode:");
    v10 = v11;
  }
  if (self->_carrierBundleIdentifier)
  {
    objc_msgSend(v11, "setCarrierBundleIdentifier:");
    v10 = v11;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10[96] = self->_experimentOptOutStatus;
    v10[100] |= 2u;
  }
  if (self->_aneVersion)
  {
    objc_msgSend(v11, "setAneVersion:");
    v10 = v11;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v10[97] = self->_isAutomatedTestDevice;
    v10[100] |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_deviceClass, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 99) = self->_isInternalBuild;
    *(_BYTE *)(v5 + 100) |= 0x10u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v5 + 98) = self->_isBetaUser;
    *(_BYTE *)(v5 + 100) |= 8u;
  }
  v9 = -[NSString copyWithZone:](self->_versionTag, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v9;

  v11 = -[NSString copyWithZone:](self->_osBuild, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = -[NSString copyWithZone:](self->_userSettingsLanguageCode, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v13;

  v15 = -[NSString copyWithZone:](self->_userSettingsRegionCode, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v15;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v17 = self->_userKeyboardEnabledInputModeIdentifiers;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend((id)v5, "addUserKeyboardEnabledInputModeIdentifiers:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v19);
  }

  v23 = -[NSString copyWithZone:](self->_userSettingsBcp47DeviceLocale, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v23;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_targetedPopulation;
    *(_BYTE *)(v5 + 100) |= 1u;
  }
  v25 = -[NSString copyWithZone:](self->_carrierCountryIsoCode, "copyWithZone:", a3, (_QWORD)v32);
  v26 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v25;

  v27 = -[NSString copyWithZone:](self->_carrierBundleIdentifier, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v27;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 96) = self->_experimentOptOutStatus;
    *(_BYTE *)(v5 + 100) |= 2u;
  }
  v29 = -[NSString copyWithZone:](self->_aneVersion, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v29;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v5 + 97) = self->_isAutomatedTestDevice;
    *(_BYTE *)(v5 + 100) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *deviceClass;
  NSString *versionTag;
  NSString *osBuild;
  NSString *userSettingsLanguageCode;
  NSString *userSettingsRegionCode;
  NSMutableArray *userKeyboardEnabledInputModeIdentifiers;
  NSString *userSettingsBcp47DeviceLocale;
  NSString *carrierCountryIsoCode;
  NSString *carrierBundleIdentifier;
  char has;
  char v15;
  NSString *aneVersion;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_54;
  deviceClass = self->_deviceClass;
  if ((unint64_t)deviceClass | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](deviceClass, "isEqual:"))
      goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x10) == 0)
      goto LABEL_54;
    if (self->_isInternalBuild)
    {
      if (!*((_BYTE *)v4 + 99))
        goto LABEL_54;
    }
    else if (*((_BYTE *)v4 + 99))
    {
      goto LABEL_54;
    }
  }
  else if ((*((_BYTE *)v4 + 100) & 0x10) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 8) == 0)
      goto LABEL_54;
    if (self->_isBetaUser)
    {
      if (!*((_BYTE *)v4 + 98))
        goto LABEL_54;
    }
    else if (*((_BYTE *)v4 + 98))
    {
      goto LABEL_54;
    }
  }
  else if ((*((_BYTE *)v4 + 100) & 8) != 0)
  {
    goto LABEL_54;
  }
  versionTag = self->_versionTag;
  if ((unint64_t)versionTag | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](versionTag, "isEqual:"))
  {
    goto LABEL_54;
  }
  osBuild = self->_osBuild;
  if ((unint64_t)osBuild | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](osBuild, "isEqual:"))
      goto LABEL_54;
  }
  userSettingsLanguageCode = self->_userSettingsLanguageCode;
  if ((unint64_t)userSettingsLanguageCode | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](userSettingsLanguageCode, "isEqual:"))
      goto LABEL_54;
  }
  userSettingsRegionCode = self->_userSettingsRegionCode;
  if ((unint64_t)userSettingsRegionCode | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](userSettingsRegionCode, "isEqual:"))
      goto LABEL_54;
  }
  userKeyboardEnabledInputModeIdentifiers = self->_userKeyboardEnabledInputModeIdentifiers;
  if ((unint64_t)userKeyboardEnabledInputModeIdentifiers | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](userKeyboardEnabledInputModeIdentifiers, "isEqual:"))
      goto LABEL_54;
  }
  userSettingsBcp47DeviceLocale = self->_userSettingsBcp47DeviceLocale;
  if ((unint64_t)userSettingsBcp47DeviceLocale | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](userSettingsBcp47DeviceLocale, "isEqual:"))
      goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 1) == 0 || self->_targetedPopulation != *((_DWORD *)v4 + 12))
      goto LABEL_54;
  }
  else if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
    goto LABEL_54;
  }
  carrierCountryIsoCode = self->_carrierCountryIsoCode;
  if ((unint64_t)carrierCountryIsoCode | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](carrierCountryIsoCode, "isEqual:"))
  {
    goto LABEL_54;
  }
  carrierBundleIdentifier = self->_carrierBundleIdentifier;
  if ((unint64_t)carrierBundleIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](carrierBundleIdentifier, "isEqual:"))
      goto LABEL_54;
  }
  has = (char)self->_has;
  v15 = *((_BYTE *)v4 + 100);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 2) == 0)
      goto LABEL_54;
    if (self->_experimentOptOutStatus)
    {
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_54;
    }
    else if (*((_BYTE *)v4 + 96))
    {
      goto LABEL_54;
    }
  }
  else if ((*((_BYTE *)v4 + 100) & 2) != 0)
  {
    goto LABEL_54;
  }
  aneVersion = self->_aneVersion;
  if ((unint64_t)aneVersion | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](aneVersion, "isEqual:"))
      goto LABEL_54;
    has = (char)self->_has;
    v15 = *((_BYTE *)v4 + 100);
  }
  v17 = (v15 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v15 & 4) != 0)
    {
      if (self->_isAutomatedTestDevice)
      {
        if (!*((_BYTE *)v4 + 97))
          goto LABEL_54;
      }
      else if (*((_BYTE *)v4 + 97))
      {
        goto LABEL_54;
      }
      v17 = 1;
      goto LABEL_55;
    }
LABEL_54:
    v17 = 0;
  }
LABEL_55:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;

  v18 = -[NSString hash](self->_deviceClass, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v17 = 2654435761 * self->_isInternalBuild;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v17 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v16 = 2654435761 * self->_isBetaUser;
      goto LABEL_6;
    }
  }
  v16 = 0;
LABEL_6:
  v15 = -[NSString hash](self->_versionTag, "hash");
  v14 = -[NSString hash](self->_osBuild, "hash");
  v13 = -[NSString hash](self->_userSettingsLanguageCode, "hash");
  v3 = -[NSString hash](self->_userSettingsRegionCode, "hash");
  v4 = -[NSMutableArray hash](self->_userKeyboardEnabledInputModeIdentifiers, "hash");
  v5 = -[NSString hash](self->_userSettingsBcp47DeviceLocale, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_targetedPopulation;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_carrierCountryIsoCode, "hash");
  v8 = -[NSString hash](self->_carrierBundleIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v9 = 2654435761 * self->_experimentOptOutStatus;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_aneVersion, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761 * self->_isAutomatedTestDevice;
  else
    v11 = 0;
  return v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[TRISystemDimensions setDeviceClass:](self, "setDeviceClass:");
  v5 = *((_BYTE *)v4 + 100);
  if ((v5 & 0x10) != 0)
  {
    self->_isInternalBuild = *((_BYTE *)v4 + 99);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 100);
  }
  if ((v5 & 8) != 0)
  {
    self->_isBetaUser = *((_BYTE *)v4 + 98);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 11))
    -[TRISystemDimensions setVersionTag:](self, "setVersionTag:");
  if (*((_QWORD *)v4 + 5))
    -[TRISystemDimensions setOsBuild:](self, "setOsBuild:");
  if (*((_QWORD *)v4 + 9))
    -[TRISystemDimensions setUserSettingsLanguageCode:](self, "setUserSettingsLanguageCode:");
  if (*((_QWORD *)v4 + 10))
    -[TRISystemDimensions setUserSettingsRegionCode:](self, "setUserSettingsRegionCode:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 7);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[TRISystemDimensions addUserKeyboardEnabledInputModeIdentifiers:](self, "addUserKeyboardEnabledInputModeIdentifiers:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v4 + 8))
    -[TRISystemDimensions setUserSettingsBcp47DeviceLocale:](self, "setUserSettingsBcp47DeviceLocale:");
  if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
    self->_targetedPopulation = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
    -[TRISystemDimensions setCarrierCountryIsoCode:](self, "setCarrierCountryIsoCode:");
  if (*((_QWORD *)v4 + 2))
    -[TRISystemDimensions setCarrierBundleIdentifier:](self, "setCarrierBundleIdentifier:");
  if ((*((_BYTE *)v4 + 100) & 2) != 0)
  {
    self->_experimentOptOutStatus = *((_BYTE *)v4 + 96);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 1))
    -[TRISystemDimensions setAneVersion:](self, "setAneVersion:");
  if ((*((_BYTE *)v4 + 100) & 4) != 0)
  {
    self->_isAutomatedTestDevice = *((_BYTE *)v4 + 97);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_storeStrong((id *)&self->_deviceClass, a3);
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (BOOL)isBetaUser
{
  return self->_isBetaUser;
}

- (NSString)versionTag
{
  return self->_versionTag;
}

- (void)setVersionTag:(id)a3
{
  objc_storeStrong((id *)&self->_versionTag, a3);
}

- (NSString)osBuild
{
  return self->_osBuild;
}

- (void)setOsBuild:(id)a3
{
  objc_storeStrong((id *)&self->_osBuild, a3);
}

- (NSString)userSettingsLanguageCode
{
  return self->_userSettingsLanguageCode;
}

- (void)setUserSettingsLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_userSettingsLanguageCode, a3);
}

- (NSString)userSettingsRegionCode
{
  return self->_userSettingsRegionCode;
}

- (void)setUserSettingsRegionCode:(id)a3
{
  objc_storeStrong((id *)&self->_userSettingsRegionCode, a3);
}

- (NSMutableArray)userKeyboardEnabledInputModeIdentifiers
{
  return self->_userKeyboardEnabledInputModeIdentifiers;
}

- (void)setUserKeyboardEnabledInputModeIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_userKeyboardEnabledInputModeIdentifiers, a3);
}

- (NSString)userSettingsBcp47DeviceLocale
{
  return self->_userSettingsBcp47DeviceLocale;
}

- (void)setUserSettingsBcp47DeviceLocale:(id)a3
{
  objc_storeStrong((id *)&self->_userSettingsBcp47DeviceLocale, a3);
}

- (NSString)carrierCountryIsoCode
{
  return self->_carrierCountryIsoCode;
}

- (void)setCarrierCountryIsoCode:(id)a3
{
  objc_storeStrong((id *)&self->_carrierCountryIsoCode, a3);
}

- (NSString)carrierBundleIdentifier
{
  return self->_carrierBundleIdentifier;
}

- (void)setCarrierBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_carrierBundleIdentifier, a3);
}

- (BOOL)experimentOptOutStatus
{
  return self->_experimentOptOutStatus;
}

- (NSString)aneVersion
{
  return self->_aneVersion;
}

- (void)setAneVersion:(id)a3
{
  objc_storeStrong((id *)&self->_aneVersion, a3);
}

- (BOOL)isAutomatedTestDevice
{
  return self->_isAutomatedTestDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionTag, 0);
  objc_storeStrong((id *)&self->_userSettingsRegionCode, 0);
  objc_storeStrong((id *)&self->_userSettingsLanguageCode, 0);
  objc_storeStrong((id *)&self->_userSettingsBcp47DeviceLocale, 0);
  objc_storeStrong((id *)&self->_userKeyboardEnabledInputModeIdentifiers, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_carrierCountryIsoCode, 0);
  objc_storeStrong((id *)&self->_carrierBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_aneVersion, 0);
}

@end
