@implementation DIMSchemaDIMDeviceFixedContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DIMSchemaDIMDeviceFixedContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v25, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIMSchemaDIMDeviceFixedContext siriVoiceSettings](self, "siriVoiceSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[DIMSchemaDIMDeviceFixedContext deleteSiriVoiceSettings](self, "deleteSiriVoiceSettings");
  -[DIMSchemaDIMDeviceFixedContext watchDeviceAttributes](self, "watchDeviceAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[DIMSchemaDIMDeviceFixedContext deleteWatchDeviceAttributes](self, "deleteWatchDeviceAttributes");
  -[DIMSchemaDIMDeviceFixedContext systemLocaleV2](self, "systemLocaleV2");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[DIMSchemaDIMDeviceFixedContext deleteSystemLocaleV2](self, "deleteSystemLocaleV2");
  -[DIMSchemaDIMDeviceFixedContext siriInputLocaleV2](self, "siriInputLocaleV2");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[DIMSchemaDIMDeviceFixedContext deleteSiriInputLocaleV2](self, "deleteSiriInputLocaleV2");
  -[DIMSchemaDIMDeviceFixedContext entitySyncSettings](self, "entitySyncSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[DIMSchemaDIMDeviceFixedContext deleteEntitySyncSettings](self, "deleteEntitySyncSettings");
  -[DIMSchemaDIMDeviceFixedContext dataSharingSettings](self, "dataSharingSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[DIMSchemaDIMDeviceFixedContext deleteDataSharingSettings](self, "deleteDataSharingSettings");

  return v5;
}

- (void)setSystemLocale:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_systemLocale = a3;
}

- (BOOL)hasSystemLocale
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasSystemLocale:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteSystemLocale
{
  -[DIMSchemaDIMDeviceFixedContext setSystemLocale:](self, "setSystemLocale:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setSiriInputLocale:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_siriInputLocale = a3;
}

- (BOOL)hasSiriInputLocale
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasSiriInputLocale:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteSiriInputLocale
{
  -[DIMSchemaDIMDeviceFixedContext setSiriInputLocale:](self, "setSiriInputLocale:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (BOOL)hasSiriVoiceSettings
{
  return self->_siriVoiceSettings != 0;
}

- (void)deleteSiriVoiceSettings
{
  -[DIMSchemaDIMDeviceFixedContext setSiriVoiceSettings:](self, "setSiriVoiceSettings:", 0);
}

- (void)setDataSharingOptInState:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_dataSharingOptInState = a3;
}

- (BOOL)hasDataSharingOptInState
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasDataSharingOptInState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteDataSharingOptInState
{
  -[DIMSchemaDIMDeviceFixedContext setDataSharingOptInState:](self, "setDataSharingOptInState:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (BOOL)hasTimezoneOffset
{
  return self->_timezoneOffset != 0;
}

- (void)deleteTimezoneOffset
{
  -[DIMSchemaDIMDeviceFixedContext setTimezoneOffset:](self, "setTimezoneOffset:", 0);
}

- (void)setCountryCode:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_countryCode = a3;
}

- (BOOL)hasCountryCode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasCountryCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteCountryCode
{
  -[DIMSchemaDIMDeviceFixedContext setCountryCode:](self, "setCountryCode:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (void)deleteDeviceType
{
  -[DIMSchemaDIMDeviceFixedContext setDeviceType:](self, "setDeviceType:", 0);
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteSystemBuild
{
  -[DIMSchemaDIMDeviceFixedContext setSystemBuild:](self, "setSystemBuild:", 0);
}

- (void)setIsStoreDemoMode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isStoreDemoMode = a3;
}

- (BOOL)hasIsStoreDemoMode
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasIsStoreDemoMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteIsStoreDemoMode
{
  -[DIMSchemaDIMDeviceFixedContext setIsStoreDemoMode:](self, "setIsStoreDemoMode:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_timeIntervalSince1970 = a3;
}

- (BOOL)hasTimeIntervalSince1970
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasTimeIntervalSince1970:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteTimeIntervalSince1970
{
  -[DIMSchemaDIMDeviceFixedContext setTimeIntervalSince1970:](self, "setTimeIntervalSince1970:", 0.0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setWatchDeviceAttributes:(id)a3
{
  unint64_t v3;

  v3 = 100;
  if (!a3)
    v3 = 0;
  self->_whichDeviceattributes = v3;
  objc_storeStrong((id *)&self->_watchDeviceAttributes, a3);
}

- (DIMSchemaDIMWatchDeviceAttributes)watchDeviceAttributes
{
  if (self->_whichDeviceattributes == 100)
    return self->_watchDeviceAttributes;
  else
    return (DIMSchemaDIMWatchDeviceAttributes *)0;
}

- (void)deleteWatchDeviceAttributes
{
  DIMSchemaDIMWatchDeviceAttributes *watchDeviceAttributes;

  if (self->_whichDeviceattributes == 100)
  {
    self->_whichDeviceattributes = 0;
    watchDeviceAttributes = self->_watchDeviceAttributes;
    self->_watchDeviceAttributes = 0;

  }
}

- (void)setIsLowPowerModeEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isLowPowerModeEnabled = a3;
}

- (BOOL)hasIsLowPowerModeEnabled
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasIsLowPowerModeEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteIsLowPowerModeEnabled
{
  -[DIMSchemaDIMDeviceFixedContext setIsLowPowerModeEnabled:](self, "setIsLowPowerModeEnabled:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (BOOL)hasSystemLocaleV2
{
  return self->_systemLocaleV2 != 0;
}

- (void)deleteSystemLocaleV2
{
  -[DIMSchemaDIMDeviceFixedContext setSystemLocaleV2:](self, "setSystemLocaleV2:", 0);
}

- (BOOL)hasSiriInputLocaleV2
{
  return self->_siriInputLocaleV2 != 0;
}

- (void)deleteSiriInputLocaleV2
{
  -[DIMSchemaDIMDeviceFixedContext setSiriInputLocaleV2:](self, "setSiriInputLocaleV2:", 0);
}

- (void)setProgramCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_programCode = a3;
}

- (BOOL)hasProgramCode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasProgramCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteProgramCode
{
  -[DIMSchemaDIMDeviceFixedContext setProgramCode:](self, "setProgramCode:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (BOOL)hasDataCollectionId
{
  return self->_dataCollectionId != 0;
}

- (void)deleteDataCollectionId
{
  -[DIMSchemaDIMDeviceFixedContext setDataCollectionId:](self, "setDataCollectionId:", 0);
}

- (BOOL)hasEffectiveSystemLanguage
{
  return self->_effectiveSystemLanguage != 0;
}

- (void)deleteEffectiveSystemLanguage
{
  -[DIMSchemaDIMDeviceFixedContext setEffectiveSystemLanguage:](self, "setEffectiveSystemLanguage:", 0);
}

- (void)clearPreferredLanguages
{
  -[NSArray removeAllObjects](self->_preferredLanguages, "removeAllObjects");
}

- (void)addPreferredLanguages:(id)a3
{
  id v4;
  NSArray *preferredLanguages;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  preferredLanguages = self->_preferredLanguages;
  v8 = v4;
  if (!preferredLanguages)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_preferredLanguages;
    self->_preferredLanguages = v6;

    v4 = v8;
    preferredLanguages = self->_preferredLanguages;
  }
  -[NSArray addObject:](preferredLanguages, "addObject:", v4);

}

- (unint64_t)preferredLanguagesCount
{
  return -[NSArray count](self->_preferredLanguages, "count");
}

- (id)preferredLanguagesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_preferredLanguages, "objectAtIndexedSubscript:", a3);
}

- (void)setHomeKitConfiguration:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_homeKitConfiguration = a3;
}

- (BOOL)hasHomeKitConfiguration
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasHomeKitConfiguration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteHomeKitConfiguration
{
  -[DIMSchemaDIMDeviceFixedContext setHomeKitConfiguration:](self, "setHomeKitConfiguration:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (BOOL)hasEntitySyncSettings
{
  return self->_entitySyncSettings != 0;
}

- (void)deleteEntitySyncSettings
{
  -[DIMSchemaDIMDeviceFixedContext setEntitySyncSettings:](self, "setEntitySyncSettings:", 0);
}

- (BOOL)hasDataSharingSettings
{
  return self->_dataSharingSettings != 0;
}

- (void)deleteDataSharingSettings
{
  -[DIMSchemaDIMDeviceFixedContext setDataSharingSettings:](self, "setDataSharingSettings:", 0);
}

- (void)setAvailableDictationKeyboards:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_availableDictationKeyboards = a3;
}

- (BOOL)hasAvailableDictationKeyboards
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasAvailableDictationKeyboards:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteAvailableDictationKeyboards
{
  -[DIMSchemaDIMDeviceFixedContext setAvailableDictationKeyboards:](self, "setAvailableDictationKeyboards:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setSearchDataOptOutState:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_searchDataOptOutState = a3;
}

- (BOOL)hasSearchDataOptOutState
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasSearchDataOptOutState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteSearchDataOptOutState
{
  -[DIMSchemaDIMDeviceFixedContext setSearchDataOptOutState:](self, "setSearchDataOptOutState:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (BOOL)readFrom:(id)a3
{
  return DIMSchemaDIMDeviceFixedContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int16 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int16 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[DIMSchemaDIMDeviceFixedContext siriVoiceSettings](self, "siriVoiceSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DIMSchemaDIMDeviceFixedContext siriVoiceSettings](self, "siriVoiceSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_WORD *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  -[DIMSchemaDIMDeviceFixedContext timezoneOffset](self, "timezoneOffset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field();
  -[DIMSchemaDIMDeviceFixedContext deviceType](self, "deviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  -[DIMSchemaDIMDeviceFixedContext systemBuild](self, "systemBuild");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  v11 = (__int16)self->_has;
  if ((v11 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x20) != 0)
    PBDataWriterWriteDoubleField();
  -[DIMSchemaDIMDeviceFixedContext watchDeviceAttributes](self, "watchDeviceAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DIMSchemaDIMDeviceFixedContext watchDeviceAttributes](self, "watchDeviceAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  -[DIMSchemaDIMDeviceFixedContext systemLocaleV2](self, "systemLocaleV2");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[DIMSchemaDIMDeviceFixedContext systemLocaleV2](self, "systemLocaleV2");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DIMSchemaDIMDeviceFixedContext siriInputLocaleV2](self, "siriInputLocaleV2");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[DIMSchemaDIMDeviceFixedContext siriInputLocaleV2](self, "siriInputLocaleV2");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  -[DIMSchemaDIMDeviceFixedContext dataCollectionId](self, "dataCollectionId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    PBDataWriterWriteStringField();
  -[DIMSchemaDIMDeviceFixedContext effectiveSystemLanguage](self, "effectiveSystemLanguage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    PBDataWriterWriteStringField();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = self->_preferredLanguages;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteStringField();
      }
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v22);
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
    PBDataWriterWriteInt32Field();
  -[DIMSchemaDIMDeviceFixedContext entitySyncSettings](self, "entitySyncSettings", v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[DIMSchemaDIMDeviceFixedContext entitySyncSettings](self, "entitySyncSettings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[DIMSchemaDIMDeviceFixedContext dataSharingSettings](self, "dataSharingSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[DIMSchemaDIMDeviceFixedContext dataSharingSettings](self, "dataSharingSettings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v29 = (__int16)self->_has;
  if ((v29 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    v29 = (__int16)self->_has;
  }
  if ((v29 & 0x400) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  unint64_t whichDeviceattributes;
  $DEE1C978DEBF0C656FD98E8056DDEAEC has;
  unsigned int v7;
  int systemLocale;
  int v9;
  int siriInputLocale;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int dataSharingOptInState;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int countryCode;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  $DEE1C978DEBF0C656FD98E8056DDEAEC v37;
  int v38;
  unsigned int v39;
  int isStoreDemoMode;
  int v41;
  double timeIntervalSince1970;
  double v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  int v49;
  int isLowPowerModeEnabled;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  int v61;
  int programCode;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  int v78;
  int homeKitConfiguration;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  BOOL v90;
  $DEE1C978DEBF0C656FD98E8056DDEAEC v92;
  int v93;
  unsigned int v94;
  unsigned int availableDictationKeyboards;
  int v96;
  int searchDataOptOutState;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_92;
  whichDeviceattributes = self->_whichDeviceattributes;
  if (whichDeviceattributes != objc_msgSend(v4, "whichDeviceattributes"))
    goto LABEL_92;
  has = self->_has;
  v7 = v4[88];
  if ((*(_BYTE *)&has & 1) != (v7 & 1))
    goto LABEL_92;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    systemLocale = self->_systemLocale;
    if (systemLocale != objc_msgSend(v4, "systemLocale"))
      goto LABEL_92;
    has = self->_has;
    v7 = v4[88];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v7 >> 1) & 1))
    goto LABEL_92;
  if (v9)
  {
    siriInputLocale = self->_siriInputLocale;
    if (siriInputLocale != objc_msgSend(v4, "siriInputLocale"))
      goto LABEL_92;
  }
  -[DIMSchemaDIMDeviceFixedContext siriVoiceSettings](self, "siriVoiceSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriVoiceSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_91;
  -[DIMSchemaDIMDeviceFixedContext siriVoiceSettings](self, "siriVoiceSettings");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[DIMSchemaDIMDeviceFixedContext siriVoiceSettings](self, "siriVoiceSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriVoiceSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_92;
  }
  else
  {

  }
  v18 = (*(_WORD *)&self->_has >> 2) & 1;
  if (v18 != ((v4[88] >> 2) & 1))
    goto LABEL_92;
  if (v18)
  {
    dataSharingOptInState = self->_dataSharingOptInState;
    if (dataSharingOptInState != objc_msgSend(v4, "dataSharingOptInState"))
      goto LABEL_92;
  }
  -[DIMSchemaDIMDeviceFixedContext timezoneOffset](self, "timezoneOffset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timezoneOffset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_91;
  -[DIMSchemaDIMDeviceFixedContext timezoneOffset](self, "timezoneOffset");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[DIMSchemaDIMDeviceFixedContext timezoneOffset](self, "timezoneOffset");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timezoneOffset");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if (!v24)
      goto LABEL_92;
  }
  else
  {

  }
  v25 = (*(_WORD *)&self->_has >> 3) & 1;
  if (v25 != ((v4[88] >> 3) & 1))
    goto LABEL_92;
  if (v25)
  {
    countryCode = self->_countryCode;
    if (countryCode != objc_msgSend(v4, "countryCode"))
      goto LABEL_92;
  }
  -[DIMSchemaDIMDeviceFixedContext deviceType](self, "deviceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_91;
  -[DIMSchemaDIMDeviceFixedContext deviceType](self, "deviceType");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[DIMSchemaDIMDeviceFixedContext deviceType](self, "deviceType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_92;
  }
  else
  {

  }
  -[DIMSchemaDIMDeviceFixedContext systemBuild](self, "systemBuild");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemBuild");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_91;
  -[DIMSchemaDIMDeviceFixedContext systemBuild](self, "systemBuild");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[DIMSchemaDIMDeviceFixedContext systemBuild](self, "systemBuild");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemBuild");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_92;
  }
  else
  {

  }
  v37 = self->_has;
  v38 = (*(unsigned int *)&v37 >> 4) & 1;
  v39 = v4[88];
  if (v38 != ((v39 >> 4) & 1))
    goto LABEL_92;
  if (v38)
  {
    isStoreDemoMode = self->_isStoreDemoMode;
    if (isStoreDemoMode != objc_msgSend(v4, "isStoreDemoMode"))
      goto LABEL_92;
    v37 = self->_has;
    v39 = v4[88];
  }
  v41 = (*(unsigned int *)&v37 >> 5) & 1;
  if (v41 != ((v39 >> 5) & 1))
    goto LABEL_92;
  if (v41)
  {
    timeIntervalSince1970 = self->_timeIntervalSince1970;
    objc_msgSend(v4, "timeIntervalSince1970");
    if (timeIntervalSince1970 != v43)
      goto LABEL_92;
  }
  -[DIMSchemaDIMDeviceFixedContext watchDeviceAttributes](self, "watchDeviceAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "watchDeviceAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_91;
  -[DIMSchemaDIMDeviceFixedContext watchDeviceAttributes](self, "watchDeviceAttributes");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    -[DIMSchemaDIMDeviceFixedContext watchDeviceAttributes](self, "watchDeviceAttributes");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchDeviceAttributes");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqual:", v47);

    if (!v48)
      goto LABEL_92;
  }
  else
  {

  }
  v49 = (*(_WORD *)&self->_has >> 6) & 1;
  if (v49 != ((v4[88] >> 6) & 1))
    goto LABEL_92;
  if (v49)
  {
    isLowPowerModeEnabled = self->_isLowPowerModeEnabled;
    if (isLowPowerModeEnabled != objc_msgSend(v4, "isLowPowerModeEnabled"))
      goto LABEL_92;
  }
  -[DIMSchemaDIMDeviceFixedContext systemLocaleV2](self, "systemLocaleV2");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemLocaleV2");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_91;
  -[DIMSchemaDIMDeviceFixedContext systemLocaleV2](self, "systemLocaleV2");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[DIMSchemaDIMDeviceFixedContext systemLocaleV2](self, "systemLocaleV2");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemLocaleV2");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqual:", v54);

    if (!v55)
      goto LABEL_92;
  }
  else
  {

  }
  -[DIMSchemaDIMDeviceFixedContext siriInputLocaleV2](self, "siriInputLocaleV2");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriInputLocaleV2");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_91;
  -[DIMSchemaDIMDeviceFixedContext siriInputLocaleV2](self, "siriInputLocaleV2");
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    v57 = (void *)v56;
    -[DIMSchemaDIMDeviceFixedContext siriInputLocaleV2](self, "siriInputLocaleV2");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriInputLocaleV2");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "isEqual:", v59);

    if (!v60)
      goto LABEL_92;
  }
  else
  {

  }
  v61 = (*(_WORD *)&self->_has >> 7) & 1;
  if (v61 != ((v4[88] >> 7) & 1))
    goto LABEL_92;
  if (v61)
  {
    programCode = self->_programCode;
    if (programCode != objc_msgSend(v4, "programCode"))
      goto LABEL_92;
  }
  -[DIMSchemaDIMDeviceFixedContext dataCollectionId](self, "dataCollectionId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataCollectionId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_91;
  -[DIMSchemaDIMDeviceFixedContext dataCollectionId](self, "dataCollectionId");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[DIMSchemaDIMDeviceFixedContext dataCollectionId](self, "dataCollectionId");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataCollectionId");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_92;
  }
  else
  {

  }
  -[DIMSchemaDIMDeviceFixedContext effectiveSystemLanguage](self, "effectiveSystemLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectiveSystemLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_91;
  -[DIMSchemaDIMDeviceFixedContext effectiveSystemLanguage](self, "effectiveSystemLanguage");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[DIMSchemaDIMDeviceFixedContext effectiveSystemLanguage](self, "effectiveSystemLanguage");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectiveSystemLanguage");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_92;
  }
  else
  {

  }
  -[DIMSchemaDIMDeviceFixedContext preferredLanguages](self, "preferredLanguages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredLanguages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_91;
  -[DIMSchemaDIMDeviceFixedContext preferredLanguages](self, "preferredLanguages");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[DIMSchemaDIMDeviceFixedContext preferredLanguages](self, "preferredLanguages");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredLanguages");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_92;
  }
  else
  {

  }
  v78 = HIBYTE(*(_WORD *)&self->_has) & 1;
  if (v78 != (HIBYTE(v4[88]) & 1))
    goto LABEL_92;
  if (v78)
  {
    homeKitConfiguration = self->_homeKitConfiguration;
    if (homeKitConfiguration != objc_msgSend(v4, "homeKitConfiguration"))
      goto LABEL_92;
  }
  -[DIMSchemaDIMDeviceFixedContext entitySyncSettings](self, "entitySyncSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitySyncSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
    goto LABEL_91;
  -[DIMSchemaDIMDeviceFixedContext entitySyncSettings](self, "entitySyncSettings");
  v80 = objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    v81 = (void *)v80;
    -[DIMSchemaDIMDeviceFixedContext entitySyncSettings](self, "entitySyncSettings");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitySyncSettings");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v82, "isEqual:", v83);

    if (!v84)
      goto LABEL_92;
  }
  else
  {

  }
  -[DIMSchemaDIMDeviceFixedContext dataSharingSettings](self, "dataSharingSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSharingSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 == 0) == (v12 != 0))
  {
LABEL_91:

    goto LABEL_92;
  }
  -[DIMSchemaDIMDeviceFixedContext dataSharingSettings](self, "dataSharingSettings");
  v85 = objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    v86 = (void *)v85;
    -[DIMSchemaDIMDeviceFixedContext dataSharingSettings](self, "dataSharingSettings");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSharingSettings");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v87, "isEqual:", v88);

    if (!v89)
      goto LABEL_92;
  }
  else
  {

  }
  v92 = self->_has;
  v93 = (*(unsigned int *)&v92 >> 9) & 1;
  v94 = v4[88];
  if (v93 == ((v94 >> 9) & 1))
  {
    if (v93)
    {
      availableDictationKeyboards = self->_availableDictationKeyboards;
      if (availableDictationKeyboards != objc_msgSend(v4, "availableDictationKeyboards"))
        goto LABEL_92;
      v92 = self->_has;
      v94 = v4[88];
    }
    v96 = (*(unsigned int *)&v92 >> 10) & 1;
    if (v96 == ((v94 >> 10) & 1))
    {
      if (!v96
        || (searchDataOptOutState = self->_searchDataOptOutState,
            searchDataOptOutState == objc_msgSend(v4, "searchDataOptOutState")))
      {
        v90 = 1;
        goto LABEL_93;
      }
    }
  }
LABEL_92:
  v90 = 0;
LABEL_93:

  return v90;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  double timeIntervalSince1970;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v27;
  uint64_t v28;
  NSUInteger v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v33 = 2654435761 * self->_systemLocale;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v33 = 0;
    if ((has & 2) != 0)
    {
LABEL_3:
      v32 = 2654435761 * self->_siriInputLocale;
      goto LABEL_6;
    }
  }
  v32 = 0;
LABEL_6:
  v31 = -[SISchemaVoiceSettings hash](self->_siriVoiceSettings, "hash");
  if ((*(_WORD *)&self->_has & 4) != 0)
    v30 = 2654435761 * self->_dataSharingOptInState;
  else
    v30 = 0;
  v29 = -[NSString hash](self->_timezoneOffset, "hash");
  if ((*(_WORD *)&self->_has & 8) != 0)
    v28 = 2654435761 * self->_countryCode;
  else
    v28 = 0;
  v27 = -[NSString hash](self->_deviceType, "hash");
  v26 = -[NSString hash](self->_systemBuild, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x10) != 0)
  {
    v25 = 2654435761 * self->_isStoreDemoMode;
    if ((v4 & 0x20) != 0)
      goto LABEL_14;
LABEL_19:
    v9 = 0;
    goto LABEL_22;
  }
  v25 = 0;
  if ((v4 & 0x20) == 0)
    goto LABEL_19;
LABEL_14:
  timeIntervalSince1970 = self->_timeIntervalSince1970;
  v6 = -timeIntervalSince1970;
  if (timeIntervalSince1970 >= 0.0)
    v6 = self->_timeIntervalSince1970;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_22:
  v24 = v9;
  v23 = -[DIMSchemaDIMWatchDeviceAttributes hash](self->_watchDeviceAttributes, "hash");
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    v22 = 2654435761 * self->_isLowPowerModeEnabled;
  else
    v22 = 0;
  v21 = -[SISchemaISOLocale hash](self->_systemLocaleV2, "hash");
  v10 = -[SISchemaISOLocale hash](self->_siriInputLocaleV2, "hash");
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    v11 = 2654435761 * self->_programCode;
  else
    v11 = 0;
  v12 = -[NSString hash](self->_dataCollectionId, "hash");
  v13 = -[NSString hash](self->_effectiveSystemLanguage, "hash");
  v14 = -[NSArray hash](self->_preferredLanguages, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v15 = 2654435761 * self->_homeKitConfiguration;
  else
    v15 = 0;
  v16 = -[DIMSchemaEntitySyncSettings hash](self->_entitySyncSettings, "hash");
  v17 = -[DIMSchemaDIMDataSharingSettings hash](self->_dataSharingSettings, "hash");
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v18 = 2654435761 * self->_availableDictationKeyboards;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_33;
LABEL_35:
    v19 = 0;
    return v32 ^ v33 ^ v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
  v18 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_35;
LABEL_33:
  v19 = 2654435761 * self->_searchDataOptOutState;
  return v32 ^ v33 ^ v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
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
  __int16 v22;
  void *v23;
  void *v24;
  void *v25;
  __int16 v26;
  int v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  unsigned int v31;
  const __CFString *v32;
  int v33;
  const __CFString *v34;
  const __CFString *v35;
  unsigned int v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  const __CFString *v47;
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
  id v58;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DIMSchemaDIMDeviceFixedContext availableDictationKeyboards](self, "availableDictationKeyboards"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("availableDictationKeyboards"));

    has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    v6 = -[DIMSchemaDIMDeviceFixedContext countryCode](self, "countryCode") - 1;
    if (v6 > 0xF9)
      v7 = CFSTR("COUNTRYCODE_UNKNOWN");
    else
      v7 = off_1E562C788[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("countryCode"));
  }
  if (self->_dataCollectionId)
  {
    -[DIMSchemaDIMDeviceFixedContext dataCollectionId](self, "dataCollectionId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dataCollectionId"));

  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v10 = -[DIMSchemaDIMDeviceFixedContext dataSharingOptInState](self, "dataSharingOptInState") - 1;
    if (v10 > 2)
      v11 = CFSTR("UNKNOWN");
    else
      v11 = off_1E562CF58[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("dataSharingOptInState"));
  }
  if (self->_dataSharingSettings)
  {
    -[DIMSchemaDIMDeviceFixedContext dataSharingSettings](self, "dataSharingSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("dataSharingSettings"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("dataSharingSettings"));

    }
  }
  if (self->_deviceType)
  {
    -[DIMSchemaDIMDeviceFixedContext deviceType](self, "deviceType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("deviceType"));

  }
  if (self->_effectiveSystemLanguage)
  {
    -[DIMSchemaDIMDeviceFixedContext effectiveSystemLanguage](self, "effectiveSystemLanguage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("effectiveSystemLanguage"));

  }
  if (self->_entitySyncSettings)
  {
    -[DIMSchemaDIMDeviceFixedContext entitySyncSettings](self, "entitySyncSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("entitySyncSettings"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("entitySyncSettings"));

    }
  }
  v22 = (__int16)self->_has;
  if ((v22 & 0x100) != 0)
  {
    v27 = -[DIMSchemaDIMDeviceFixedContext homeKitConfiguration](self, "homeKitConfiguration");
    v28 = CFSTR("HOMEKITCONFIGURATION_UNKNOWN");
    if (v27 == 1)
      v28 = CFSTR("HOMEKITCONFIGURATION_HH1");
    if (v27 == 2)
      v29 = CFSTR("HOMEKITCONFIGURATION_HH2");
    else
      v29 = v28;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("homeKitConfiguration"));
    v22 = (__int16)self->_has;
    if ((v22 & 0x40) == 0)
    {
LABEL_31:
      if ((v22 & 0x10) == 0)
        goto LABEL_33;
      goto LABEL_32;
    }
  }
  else if ((v22 & 0x40) == 0)
  {
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DIMSchemaDIMDeviceFixedContext isLowPowerModeEnabled](self, "isLowPowerModeEnabled"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("isLowPowerModeEnabled"));

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_32:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DIMSchemaDIMDeviceFixedContext isStoreDemoMode](self, "isStoreDemoMode"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("isStoreDemoMode"));

  }
LABEL_33:
  if (self->_preferredLanguages)
  {
    -[DIMSchemaDIMDeviceFixedContext preferredLanguages](self, "preferredLanguages");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("preferredLanguages"));

  }
  v26 = (__int16)self->_has;
  if ((v26 & 0x80) != 0)
  {
    v31 = -[DIMSchemaDIMDeviceFixedContext programCode](self, "programCode") - 1;
    if (v31 > 4)
      v32 = CFSTR("PROGRAMCODE_UNKNOWN");
    else
      v32 = off_1E562CF70[v31];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("programCode"));
    v26 = (__int16)self->_has;
    if ((v26 & 0x400) == 0)
    {
LABEL_37:
      if ((v26 & 2) == 0)
        goto LABEL_61;
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_37;
  }
  v33 = -[DIMSchemaDIMDeviceFixedContext searchDataOptOutState](self, "searchDataOptOutState");
  v34 = CFSTR("SEARCHDATAOPTOUTSTATE_UNKNOWN");
  if (v33 == 1)
    v34 = CFSTR("SEARCHDATAOPTOUTSTATE_OPTED_IN");
  if (v33 == 2)
    v35 = CFSTR("SEARCHDATAOPTOUTSTATE_OPTED_OUT");
  else
    v35 = v34;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("searchDataOptOutState"));
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_57:
    v36 = -[DIMSchemaDIMDeviceFixedContext siriInputLocale](self, "siriInputLocale") - 1;
    if (v36 > 0x3D)
      v37 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v37 = off_1E562CF98[v36];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("siriInputLocale"));
  }
LABEL_61:
  if (self->_siriInputLocaleV2)
  {
    -[DIMSchemaDIMDeviceFixedContext siriInputLocaleV2](self, "siriInputLocaleV2");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("siriInputLocaleV2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("siriInputLocaleV2"));

    }
  }
  if (self->_siriVoiceSettings)
  {
    -[DIMSchemaDIMDeviceFixedContext siriVoiceSettings](self, "siriVoiceSettings");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "dictionaryRepresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("siriVoiceSettings"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("siriVoiceSettings"));

    }
  }
  if (self->_systemBuild)
  {
    -[DIMSchemaDIMDeviceFixedContext systemBuild](self, "systemBuild");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v44, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("systemBuild"));

  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    v46 = -[DIMSchemaDIMDeviceFixedContext systemLocale](self, "systemLocale") - 1;
    if (v46 > 0x3D)
      v47 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v47 = off_1E562CF98[v46];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("systemLocale"));
  }
  if (self->_systemLocaleV2)
  {
    -[DIMSchemaDIMDeviceFixedContext systemLocaleV2](self, "systemLocaleV2");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("systemLocaleV2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("systemLocaleV2"));

    }
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v51 = (void *)MEMORY[0x1E0CB37E8];
    -[DIMSchemaDIMDeviceFixedContext timeIntervalSince1970](self, "timeIntervalSince1970");
    objc_msgSend(v51, "numberWithDouble:");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("timeIntervalSince1970"));

  }
  if (self->_timezoneOffset)
  {
    -[DIMSchemaDIMDeviceFixedContext timezoneOffset](self, "timezoneOffset");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v53, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("timezoneOffset"));

  }
  if (self->_watchDeviceAttributes)
  {
    -[DIMSchemaDIMDeviceFixedContext watchDeviceAttributes](self, "watchDeviceAttributes");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("watchDeviceAttributes"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("watchDeviceAttributes"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v58 = v3;

  return v58;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[DIMSchemaDIMDeviceFixedContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (DIMSchemaDIMDeviceFixedContext)initWithJSON:(id)a3
{
  void *v4;
  DIMSchemaDIMDeviceFixedContext *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[DIMSchemaDIMDeviceFixedContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (DIMSchemaDIMDeviceFixedContext)initWithDictionary:(id)a3
{
  id v4;
  DIMSchemaDIMDeviceFixedContext *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SISchemaVoiceSettings *v9;
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
  uint64_t v20;
  DIMSchemaDIMWatchDeviceAttributes *v21;
  void *v22;
  uint64_t v23;
  SISchemaISOLocale *v24;
  uint64_t v25;
  SISchemaISOLocale *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  DIMSchemaEntitySyncSettings *v42;
  void *v43;
  DIMSchemaDIMDataSharingSettings *v44;
  void *v45;
  void *v46;
  DIMSchemaDIMDeviceFixedContext *v47;
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
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)DIMSchemaDIMDeviceFixedContext;
  v5 = -[DIMSchemaDIMDeviceFixedContext init](&v69, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemLocale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMDeviceFixedContext setSystemLocale:](v5, "setSystemLocale:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriInputLocale"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMDeviceFixedContext setSiriInputLocale:](v5, "setSiriInputLocale:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriVoiceSettings"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaVoiceSettings initWithDictionary:]([SISchemaVoiceSettings alloc], "initWithDictionary:", v8);
      -[DIMSchemaDIMDeviceFixedContext setSiriVoiceSettings:](v5, "setSiriVoiceSettings:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataSharingOptInState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMDeviceFixedContext setDataSharingOptInState:](v5, "setDataSharingOptInState:", objc_msgSend(v10, "intValue"));
    v54 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timezoneOffset"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[DIMSchemaDIMDeviceFixedContext setTimezoneOffset:](v5, "setTimezoneOffset:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countryCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMDeviceFixedContext setCountryCode:](v5, "setCountryCode:", objc_msgSend(v13, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[DIMSchemaDIMDeviceFixedContext setDeviceType:](v5, "setDeviceType:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemBuild"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v63 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[DIMSchemaDIMDeviceFixedContext setSystemBuild:](v5, "setSystemBuild:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isStoreDemoMode"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v62 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMDeviceFixedContext setIsStoreDemoMode:](v5, "setIsStoreDemoMode:", objc_msgSend(v18, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeIntervalSince1970"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v61 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "doubleValue");
      -[DIMSchemaDIMDeviceFixedContext setTimeIntervalSince1970:](v5, "setTimeIntervalSince1970:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("watchDeviceAttributes"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[DIMSchemaDIMWatchDeviceAttributes initWithDictionary:]([DIMSchemaDIMWatchDeviceAttributes alloc], "initWithDictionary:", v20);
      -[DIMSchemaDIMDeviceFixedContext setWatchDeviceAttributes:](v5, "setWatchDeviceAttributes:", v21);

    }
    v56 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLowPowerModeEnabled"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMDeviceFixedContext setIsLowPowerModeEnabled:](v5, "setIsLowPowerModeEnabled:", objc_msgSend(v22, "BOOLValue"));
    v51 = v22;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemLocaleV2"));
    v23 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = (void *)v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v23);
      -[DIMSchemaDIMDeviceFixedContext setSystemLocaleV2:](v5, "setSystemLocaleV2:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriInputLocaleV2"));
    v25 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = (void *)v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[SISchemaISOLocale initWithDictionary:]([SISchemaISOLocale alloc], "initWithDictionary:", v25);
      -[DIMSchemaDIMDeviceFixedContext setSiriInputLocaleV2:](v5, "setSiriInputLocaleV2:", v26);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("programCode"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMDeviceFixedContext setProgramCode:](v5, "setProgramCode:", objc_msgSend(v27, "intValue"));
    v50 = v27;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataCollectionId"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = (void *)objc_msgSend(v28, "copy");
      -[DIMSchemaDIMDeviceFixedContext setDataCollectionId:](v5, "setDataCollectionId:", v29);

    }
    v52 = v13;
    v53 = v11;
    v55 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("effectiveSystemLanguage"), v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = (void *)objc_msgSend(v30, "copy");
      -[DIMSchemaDIMDeviceFixedContext setEffectiveSystemLanguage:](v5, "setEffectiveSystemLanguage:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preferredLanguages"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v33 = v32;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v66 != v36)
              objc_enumerationMutation(v33);
            v38 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v39 = (void *)objc_msgSend(v38, "copy");
              -[DIMSchemaDIMDeviceFixedContext addPreferredLanguages:](v5, "addPreferredLanguages:", v39);

            }
          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
        }
        while (v35);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeKitConfiguration"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMDeviceFixedContext setHomeKitConfiguration:](v5, "setHomeKitConfiguration:", objc_msgSend(v40, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitySyncSettings"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = -[DIMSchemaEntitySyncSettings initWithDictionary:]([DIMSchemaEntitySyncSettings alloc], "initWithDictionary:", v41);
      -[DIMSchemaDIMDeviceFixedContext setEntitySyncSettings:](v5, "setEntitySyncSettings:", v42);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataSharingSettings"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = -[DIMSchemaDIMDataSharingSettings initWithDictionary:]([DIMSchemaDIMDataSharingSettings alloc], "initWithDictionary:", v43);
      -[DIMSchemaDIMDeviceFixedContext setDataSharingSettings:](v5, "setDataSharingSettings:", v44);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("availableDictationKeyboards"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMDeviceFixedContext setAvailableDictationKeyboards:](v5, "setAvailableDictationKeyboards:", objc_msgSend(v45, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchDataOptOutState"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[DIMSchemaDIMDeviceFixedContext setSearchDataOptOutState:](v5, "setSearchDataOptOutState:", objc_msgSend(v46, "intValue"));
    v47 = v5;

  }
  return v5;
}

- (unint64_t)whichDeviceattributes
{
  return self->_whichDeviceattributes;
}

- (int)systemLocale
{
  return self->_systemLocale;
}

- (int)siriInputLocale
{
  return self->_siriInputLocale;
}

- (SISchemaVoiceSettings)siriVoiceSettings
{
  return self->_siriVoiceSettings;
}

- (void)setSiriVoiceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_siriVoiceSettings, a3);
}

- (int)dataSharingOptInState
{
  return self->_dataSharingOptInState;
}

- (NSString)timezoneOffset
{
  return self->_timezoneOffset;
}

- (void)setTimezoneOffset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)countryCode
{
  return self->_countryCode;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setSystemBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isStoreDemoMode
{
  return self->_isStoreDemoMode;
}

- (double)timeIntervalSince1970
{
  return self->_timeIntervalSince1970;
}

- (BOOL)isLowPowerModeEnabled
{
  return self->_isLowPowerModeEnabled;
}

- (SISchemaISOLocale)systemLocaleV2
{
  return self->_systemLocaleV2;
}

- (void)setSystemLocaleV2:(id)a3
{
  objc_storeStrong((id *)&self->_systemLocaleV2, a3);
}

- (SISchemaISOLocale)siriInputLocaleV2
{
  return self->_siriInputLocaleV2;
}

- (void)setSiriInputLocaleV2:(id)a3
{
  objc_storeStrong((id *)&self->_siriInputLocaleV2, a3);
}

- (int)programCode
{
  return self->_programCode;
}

- (NSString)dataCollectionId
{
  return self->_dataCollectionId;
}

- (void)setDataCollectionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)effectiveSystemLanguage
{
  return self->_effectiveSystemLanguage;
}

- (void)setEffectiveSystemLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (void)setPreferredLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int)homeKitConfiguration
{
  return self->_homeKitConfiguration;
}

- (DIMSchemaEntitySyncSettings)entitySyncSettings
{
  return self->_entitySyncSettings;
}

- (void)setEntitySyncSettings:(id)a3
{
  objc_storeStrong((id *)&self->_entitySyncSettings, a3);
}

- (DIMSchemaDIMDataSharingSettings)dataSharingSettings
{
  return self->_dataSharingSettings;
}

- (void)setDataSharingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dataSharingSettings, a3);
}

- (unsigned)availableDictationKeyboards
{
  return self->_availableDictationKeyboards;
}

- (int)searchDataOptOutState
{
  return self->_searchDataOptOutState;
}

- (void)setHasSiriVoiceSettings:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasTimezoneOffset:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  self->_hasSiriVoiceSettings = a3;
}

- (void)setHasSystemBuild:(BOOL)a3
{
  self->_hasTimezoneOffset = a3;
}

- (BOOL)hasWatchDeviceAttributes
{
  return self->_hasDeviceType;
}

- (void)setHasWatchDeviceAttributes:(BOOL)a3
{
  self->_hasDeviceType = a3;
}

- (void)setHasSystemLocaleV2:(BOOL)a3
{
  self->_hasSystemBuild = a3;
}

- (void)setHasSiriInputLocaleV2:(BOOL)a3
{
  self->_hasWatchDeviceAttributes = a3;
}

- (void)setHasDataCollectionId:(BOOL)a3
{
  self->_hasSystemLocaleV2 = a3;
}

- (void)setHasEffectiveSystemLanguage:(BOOL)a3
{
  self->_hasSiriInputLocaleV2 = a3;
}

- (void)setHasEntitySyncSettings:(BOOL)a3
{
  self->_hasDataCollectionId = a3;
}

- (void)setHasDataSharingSettings:(BOOL)a3
{
  self->_hasEffectiveSystemLanguage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSharingSettings, 0);
  objc_storeStrong((id *)&self->_entitySyncSettings, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_effectiveSystemLanguage, 0);
  objc_storeStrong((id *)&self->_dataCollectionId, 0);
  objc_storeStrong((id *)&self->_siriInputLocaleV2, 0);
  objc_storeStrong((id *)&self->_systemLocaleV2, 0);
  objc_storeStrong((id *)&self->_watchDeviceAttributes, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_timezoneOffset, 0);
  objc_storeStrong((id *)&self->_siriVoiceSettings, 0);
}

@end
