@implementation SISchemaDailyDeviceStatus

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
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SISchemaDailyDeviceStatus;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v29, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 8))
  {
    -[SISchemaDailyDeviceStatus deleteSiriDeviceID](self, "deleteSiriDeviceID");
    -[SISchemaDailyDeviceStatus deleteSiriSpeechID](self, "deleteSiriSpeechID");
    -[SISchemaDailyDeviceStatus deleteSharedUserId](self, "deleteSharedUserId");
  }
  -[SISchemaDailyDeviceStatus enabledStatus](self, "enabledStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaDailyDeviceStatus deleteEnabledStatus](self, "deleteEnabledStatus");
  -[SISchemaDailyDeviceStatus activeStatus](self, "activeStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaDailyDeviceStatus deleteActiveStatus](self, "deleteActiveStatus");
  -[SISchemaDailyDeviceStatus personalization](self, "personalization");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SISchemaDailyDeviceStatus deletePersonalization](self, "deletePersonalization");
  -[SISchemaDailyDeviceStatus multiUserState](self, "multiUserState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[SISchemaDailyDeviceStatus deleteMultiUserState](self, "deleteMultiUserState");
  -[SISchemaDailyDeviceStatus aggregatedMetrics](self, "aggregatedMetrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[SISchemaDailyDeviceStatus deleteAggregatedMetrics](self, "deleteAggregatedMetrics");
  -[SISchemaDailyDeviceStatus linkedAccessoryStates](self, "linkedAccessoryStates");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v21, v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaDailyDeviceStatus setLinkedAccessoryStates:](self, "setLinkedAccessoryStates:", v22);

  -[SISchemaDailyDeviceStatus multiUserSetup](self, "multiUserSetup");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "applySensitiveConditionsPolicy:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "suppressMessage");

  if (v25)
    -[SISchemaDailyDeviceStatus deleteMultiUserSetup](self, "deleteMultiUserSetup");
  -[SISchemaDailyDeviceStatus enabledDictationLocales](self, "enabledDictationLocales");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v26, v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaDailyDeviceStatus setEnabledDictationLocales:](self, "setEnabledDictationLocales:", v27);

  return v5;
}

- (id)qualifiedMessageName
{
  return CFSTR("com.apple.aiml.siri.heartbeat.DailyDeviceStatus");
}

- (BOOL)hasSiriDeviceID
{
  return self->_siriDeviceID != 0;
}

- (void)deleteSiriDeviceID
{
  -[SISchemaDailyDeviceStatus setSiriDeviceID:](self, "setSiriDeviceID:", 0);
}

- (BOOL)hasSiriSpeechID
{
  return self->_siriSpeechID != 0;
}

- (void)deleteSiriSpeechID
{
  -[SISchemaDailyDeviceStatus setSiriSpeechID:](self, "setSiriSpeechID:", 0);
}

- (BOOL)hasSharedUserId
{
  return self->_sharedUserId != 0;
}

- (void)deleteSharedUserId
{
  -[SISchemaDailyDeviceStatus setSharedUserId:](self, "setSharedUserId:", 0);
}

- (void)setClientDeviceSamplingTimestampMs:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_clientDeviceSamplingTimestampMs = a3;
}

- (BOOL)hasClientDeviceSamplingTimestampMs
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasClientDeviceSamplingTimestampMs:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteClientDeviceSamplingTimestampMs
{
  -[SISchemaDailyDeviceStatus setClientDeviceSamplingTimestampMs:](self, "setClientDeviceSamplingTimestampMs:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setAssistantRecordPublishTimestampMs:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_assistantRecordPublishTimestampMs = a3;
}

- (BOOL)hasAssistantRecordPublishTimestampMs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasAssistantRecordPublishTimestampMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteAssistantRecordPublishTimestampMs
{
  -[SISchemaDailyDeviceStatus setAssistantRecordPublishTimestampMs:](self, "setAssistantRecordPublishTimestampMs:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)deleteLocale
{
  -[SISchemaDailyDeviceStatus setLocale:](self, "setLocale:", 0);
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (void)deleteDeviceType
{
  -[SISchemaDailyDeviceStatus setDeviceType:](self, "setDeviceType:", 0);
}

- (BOOL)hasDeviceOs
{
  return self->_deviceOs != 0;
}

- (void)deleteDeviceOs
{
  -[SISchemaDailyDeviceStatus setDeviceOs:](self, "setDeviceOs:", 0);
}

- (BOOL)hasDeviceBuild
{
  return self->_deviceBuild != 0;
}

- (void)deleteDeviceBuild
{
  -[SISchemaDailyDeviceStatus setDeviceBuild:](self, "setDeviceBuild:", 0);
}

- (BOOL)hasEnabledStatus
{
  return self->_enabledStatus != 0;
}

- (void)deleteEnabledStatus
{
  -[SISchemaDailyDeviceStatus setEnabledStatus:](self, "setEnabledStatus:", 0);
}

- (BOOL)hasActiveStatus
{
  return self->_activeStatus != 0;
}

- (void)deleteActiveStatus
{
  -[SISchemaDailyDeviceStatus setActiveStatus:](self, "setActiveStatus:", 0);
}

- (BOOL)hasPersonalization
{
  return self->_personalization != 0;
}

- (void)deletePersonalization
{
  -[SISchemaDailyDeviceStatus setPersonalization:](self, "setPersonalization:", 0);
}

- (BOOL)hasMultiUserState
{
  return self->_multiUserState != 0;
}

- (void)deleteMultiUserState
{
  -[SISchemaDailyDeviceStatus setMultiUserState:](self, "setMultiUserState:", 0);
}

- (void)setSpokenNotificationsproxCardSeen:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_spokenNotificationsproxCardSeen = a3;
}

- (BOOL)hasSpokenNotificationsproxCardSeen
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasSpokenNotificationsproxCardSeen:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteSpokenNotificationsproxCardSeen
{
  -[SISchemaDailyDeviceStatus setSpokenNotificationsproxCardSeen:](self, "setSpokenNotificationsproxCardSeen:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setSpokenNotificationsControlCenterModuleEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_spokenNotificationsControlCenterModuleEnabled = a3;
}

- (BOOL)hasSpokenNotificationsControlCenterModuleEnabled
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasSpokenNotificationsControlCenterModuleEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteSpokenNotificationsControlCenterModuleEnabled
{
  -[SISchemaDailyDeviceStatus setSpokenNotificationsControlCenterModuleEnabled:](self, "setSpokenNotificationsControlCenterModuleEnabled:", 0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setSpokenNotificationsWhitelistSettings:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_spokenNotificationsWhitelistSettings = a3;
}

- (BOOL)hasSpokenNotificationsWhitelistSettings
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasSpokenNotificationsWhitelistSettings:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteSpokenNotificationsWhitelistSettings
{
  -[SISchemaDailyDeviceStatus setSpokenNotificationsWhitelistSettings:](self, "setSpokenNotificationsWhitelistSettings:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (BOOL)hasAggregatedMetrics
{
  return self->_aggregatedMetrics != 0;
}

- (void)deleteAggregatedMetrics
{
  -[SISchemaDailyDeviceStatus setAggregatedMetrics:](self, "setAggregatedMetrics:", 0);
}

- (void)clearLinkedAccessoryState
{
  -[NSArray removeAllObjects](self->_linkedAccessoryStates, "removeAllObjects");
}

- (void)addLinkedAccessoryState:(id)a3
{
  id v4;
  NSArray *linkedAccessoryStates;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  linkedAccessoryStates = self->_linkedAccessoryStates;
  v8 = v4;
  if (!linkedAccessoryStates)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_linkedAccessoryStates;
    self->_linkedAccessoryStates = v6;

    v4 = v8;
    linkedAccessoryStates = self->_linkedAccessoryStates;
  }
  -[NSArray addObject:](linkedAccessoryStates, "addObject:", v4);

}

- (unint64_t)linkedAccessoryStateCount
{
  return -[NSArray count](self->_linkedAccessoryStates, "count");
}

- (id)linkedAccessoryStateAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_linkedAccessoryStates, "objectAtIndexedSubscript:", a3);
}

- (void)setSiriInputLocale:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_siriInputLocale = a3;
}

- (BOOL)hasSiriInputLocale
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasSiriInputLocale:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteSiriInputLocale
{
  -[SISchemaDailyDeviceStatus setSiriInputLocale:](self, "setSiriInputLocale:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (BOOL)hasMultiUserSetup
{
  return self->_multiUserSetup != 0;
}

- (void)deleteMultiUserSetup
{
  -[SISchemaDailyDeviceStatus setMultiUserSetup:](self, "setMultiUserSetup:", 0);
}

- (void)setQueuedAtTimestampHourInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_queuedAtTimestampHourInMs = a3;
}

- (BOOL)hasQueuedAtTimestampHourInMs
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasQueuedAtTimestampHourInMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteQueuedAtTimestampHourInMs
{
  -[SISchemaDailyDeviceStatus setQueuedAtTimestampHourInMs:](self, "setQueuedAtTimestampHourInMs:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setStoreCountryCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_storeCountryCode = a3;
}

- (BOOL)hasStoreCountryCode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasStoreCountryCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteStoreCountryCode
{
  -[SISchemaDailyDeviceStatus setStoreCountryCode:](self, "setStoreCountryCode:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)clearEnabledDictationLocales
{
  -[NSArray removeAllObjects](self->_enabledDictationLocales, "removeAllObjects");
}

- (void)addEnabledDictationLocales:(id)a3
{
  id v4;
  NSArray *enabledDictationLocales;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  enabledDictationLocales = self->_enabledDictationLocales;
  v8 = v4;
  if (!enabledDictationLocales)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_enabledDictationLocales;
    self->_enabledDictationLocales = v6;

    v4 = v8;
    enabledDictationLocales = self->_enabledDictationLocales;
  }
  -[NSArray addObject:](enabledDictationLocales, "addObject:", v4);

}

- (unint64_t)enabledDictationLocalesCount
{
  return -[NSArray count](self->_enabledDictationLocales, "count");
}

- (id)enabledDictationLocalesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_enabledDictationLocales, "objectAtIndexedSubscript:", a3);
}

- (void)setDeviceCapacityInGB:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_deviceCapacityInGB = a3;
}

- (BOOL)hasDeviceCapacityInGB
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasDeviceCapacityInGB:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteDeviceCapacityInGB
{
  -[SISchemaDailyDeviceStatus setDeviceCapacityInGB:](self, "setDeviceCapacityInGB:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setAvailableDeviceStorageInMB:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_availableDeviceStorageInMB = a3;
}

- (BOOL)hasAvailableDeviceStorageInMB
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasAvailableDeviceStorageInMB:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteAvailableDeviceStorageInMB
{
  -[SISchemaDailyDeviceStatus setAvailableDeviceStorageInMB:](self, "setAvailableDeviceStorageInMB:", 0.0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (BOOL)hasModelNumber
{
  return self->_modelNumber != 0;
}

- (void)deleteModelNumber
{
  -[SISchemaDailyDeviceStatus setModelNumber:](self, "setModelNumber:", 0);
}

- (BOOL)hasRegionInfo
{
  return self->_regionInfo != 0;
}

- (void)deleteRegionInfo
{
  -[SISchemaDailyDeviceStatus setRegionInfo:](self, "setRegionInfo:", 0);
}

- (BOOL)hasStorefrontId
{
  return self->_storefrontId != 0;
}

- (void)deleteStorefrontId
{
  -[SISchemaDailyDeviceStatus setStorefrontId:](self, "setStorefrontId:", 0);
}

- (void)clearInstalledVoices
{
  -[NSArray removeAllObjects](self->_installedVoices, "removeAllObjects");
}

- (void)addInstalledVoices:(int)a3
{
  uint64_t v3;
  NSArray *installedVoices;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  installedVoices = self->_installedVoices;
  if (!installedVoices)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_installedVoices;
    self->_installedVoices = v6;

    installedVoices = self->_installedVoices;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](installedVoices, "addObject:", v8);

}

- (unint64_t)installedVoicesCount
{
  return -[NSArray count](self->_installedVoices, "count");
}

- (int)installedVoicesAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_installedVoices, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDailyDeviceStatusReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __int16 has;
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
  __int16 v21;
  void *v22;
  void *v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  __int16 v31;
  NSArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  __int16 v37;
  void *v38;
  void *v39;
  void *v40;
  NSArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SISchemaDailyDeviceStatus siriDeviceID](self, "siriDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[SISchemaDailyDeviceStatus siriSpeechID](self, "siriSpeechID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[SISchemaDailyDeviceStatus sharedUserId](self, "sharedUserId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt64Field();
  -[SISchemaDailyDeviceStatus locale](self, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  -[SISchemaDailyDeviceStatus deviceType](self, "deviceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[SISchemaDailyDeviceStatus deviceOs](self, "deviceOs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  -[SISchemaDailyDeviceStatus deviceBuild](self, "deviceBuild");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  -[SISchemaDailyDeviceStatus enabledStatus](self, "enabledStatus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SISchemaDailyDeviceStatus enabledStatus](self, "enabledStatus");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaDailyDeviceStatus activeStatus](self, "activeStatus");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SISchemaDailyDeviceStatus activeStatus](self, "activeStatus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaDailyDeviceStatus personalization](self, "personalization");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[SISchemaDailyDeviceStatus personalization](self, "personalization");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaDailyDeviceStatus multiUserState](self, "multiUserState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[SISchemaDailyDeviceStatus multiUserState](self, "multiUserState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v21 = (__int16)self->_has;
  if ((v21 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v21 = (__int16)self->_has;
    if ((v21 & 8) == 0)
    {
LABEL_29:
      if ((v21 & 0x10) == 0)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  else if ((v21 & 8) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_30:
    PBDataWriterWriteInt32Field();
LABEL_31:
  -[SISchemaDailyDeviceStatus aggregatedMetrics](self, "aggregatedMetrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[SISchemaDailyDeviceStatus aggregatedMetrics](self, "aggregatedMetrics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v24 = self->_linkedAccessoryStates;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v55 != v27)
          objc_enumerationMutation(v24);
        PBDataWriterWriteSubmessage();
      }
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v26);
  }

  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  -[SISchemaDailyDeviceStatus multiUserSetup](self, "multiUserSetup");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[SISchemaDailyDeviceStatus multiUserSetup](self, "multiUserSetup");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v31 = (__int16)self->_has;
  if ((v31 & 0x40) != 0)
  {
    PBDataWriterWriteUint64Field();
    v31 = (__int16)self->_has;
  }
  if ((v31 & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v32 = self->_enabledDictationLocales;
  v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v51 != v35)
          objc_enumerationMutation(v32);
        PBDataWriterWriteSubmessage();
      }
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v34);
  }

  v37 = (__int16)self->_has;
  if ((v37 & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    v37 = (__int16)self->_has;
  }
  if ((v37 & 0x200) != 0)
    PBDataWriterWriteDoubleField();
  -[SISchemaDailyDeviceStatus modelNumber](self, "modelNumber");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
    PBDataWriterWriteStringField();
  -[SISchemaDailyDeviceStatus regionInfo](self, "regionInfo");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
    PBDataWriterWriteStringField();
  -[SISchemaDailyDeviceStatus storefrontId](self, "storefrontId");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
    PBDataWriterWriteStringField();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v41 = self->_installedVoices;
  v42 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v43; ++k)
      {
        if (*(_QWORD *)v47 != v44)
          objc_enumerationMutation(v41);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "intValue", (_QWORD)v46);
        PBDataWriterWriteInt32Field();
      }
      v43 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v43);
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  $F1C35457E9BE1BAE233CB224F3BB2FB1 has;
  unsigned int v23;
  int64_t clientDeviceSamplingTimestampMs;
  int v25;
  int64_t assistantRecordPublishTimestampMs;
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
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  $F1C35457E9BE1BAE233CB224F3BB2FB1 v67;
  int v68;
  unsigned int v69;
  int spokenNotificationsproxCardSeen;
  int v71;
  int spokenNotificationsControlCenterModuleEnabled;
  int v73;
  int spokenNotificationsWhitelistSettings;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  int v85;
  int siriInputLocale;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  $F1C35457E9BE1BAE233CB224F3BB2FB1 v92;
  int v93;
  unsigned int v94;
  unint64_t queuedAtTimestampHourInMs;
  int v96;
  int storeCountryCode;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  $F1C35457E9BE1BAE233CB224F3BB2FB1 v103;
  int v104;
  unsigned int v105;
  unsigned int deviceCapacityInGB;
  int v107;
  double availableDeviceStorageInMB;
  double v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  int v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  int v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  char v129;
  BOOL v130;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_132;
  -[SISchemaDailyDeviceStatus siriDeviceID](self, "siriDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus siriDeviceID](self, "siriDeviceID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaDailyDeviceStatus siriDeviceID](self, "siriDeviceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriDeviceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_132;
  }
  else
  {

  }
  -[SISchemaDailyDeviceStatus siriSpeechID](self, "siriSpeechID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriSpeechID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus siriSpeechID](self, "siriSpeechID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SISchemaDailyDeviceStatus siriSpeechID](self, "siriSpeechID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriSpeechID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_132;
  }
  else
  {

  }
  -[SISchemaDailyDeviceStatus sharedUserId](self, "sharedUserId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedUserId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus sharedUserId](self, "sharedUserId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[SISchemaDailyDeviceStatus sharedUserId](self, "sharedUserId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedUserId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_132;
  }
  else
  {

  }
  has = self->_has;
  v23 = v4[112];
  if ((*(_BYTE *)&has & 1) != (v23 & 1))
    goto LABEL_132;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    clientDeviceSamplingTimestampMs = self->_clientDeviceSamplingTimestampMs;
    if (clientDeviceSamplingTimestampMs != objc_msgSend(v4, "clientDeviceSamplingTimestampMs"))
      goto LABEL_132;
    has = self->_has;
    v23 = v4[112];
  }
  v25 = (*(unsigned int *)&has >> 1) & 1;
  if (v25 != ((v23 >> 1) & 1))
    goto LABEL_132;
  if (v25)
  {
    assistantRecordPublishTimestampMs = self->_assistantRecordPublishTimestampMs;
    if (assistantRecordPublishTimestampMs != objc_msgSend(v4, "assistantRecordPublishTimestampMs"))
      goto LABEL_132;
  }
  -[SISchemaDailyDeviceStatus locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus locale](self, "locale");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[SISchemaDailyDeviceStatus locale](self, "locale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locale");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_132;
  }
  else
  {

  }
  -[SISchemaDailyDeviceStatus deviceType](self, "deviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus deviceType](self, "deviceType");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[SISchemaDailyDeviceStatus deviceType](self, "deviceType");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_132;
  }
  else
  {

  }
  -[SISchemaDailyDeviceStatus deviceOs](self, "deviceOs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceOs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus deviceOs](self, "deviceOs");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[SISchemaDailyDeviceStatus deviceOs](self, "deviceOs");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceOs");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_132;
  }
  else
  {

  }
  -[SISchemaDailyDeviceStatus deviceBuild](self, "deviceBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus deviceBuild](self, "deviceBuild");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[SISchemaDailyDeviceStatus deviceBuild](self, "deviceBuild");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceBuild");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_132;
  }
  else
  {

  }
  -[SISchemaDailyDeviceStatus enabledStatus](self, "enabledStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enabledStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus enabledStatus](self, "enabledStatus");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[SISchemaDailyDeviceStatus enabledStatus](self, "enabledStatus");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enabledStatus");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_132;
  }
  else
  {

  }
  -[SISchemaDailyDeviceStatus activeStatus](self, "activeStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus activeStatus](self, "activeStatus");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[SISchemaDailyDeviceStatus activeStatus](self, "activeStatus");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeStatus");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_132;
  }
  else
  {

  }
  -[SISchemaDailyDeviceStatus personalization](self, "personalization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personalization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus personalization](self, "personalization");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[SISchemaDailyDeviceStatus personalization](self, "personalization");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personalization");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_132;
  }
  else
  {

  }
  -[SISchemaDailyDeviceStatus multiUserState](self, "multiUserState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiUserState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus multiUserState](self, "multiUserState");
  v62 = objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v63 = (void *)v62;
    -[SISchemaDailyDeviceStatus multiUserState](self, "multiUserState");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multiUserState");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isEqual:", v65);

    if (!v66)
      goto LABEL_132;
  }
  else
  {

  }
  v67 = self->_has;
  v68 = (*(unsigned int *)&v67 >> 2) & 1;
  v69 = v4[112];
  if (v68 != ((v69 >> 2) & 1))
    goto LABEL_132;
  if (v68)
  {
    spokenNotificationsproxCardSeen = self->_spokenNotificationsproxCardSeen;
    if (spokenNotificationsproxCardSeen != objc_msgSend(v4, "spokenNotificationsproxCardSeen"))
      goto LABEL_132;
    v67 = self->_has;
    v69 = v4[112];
  }
  v71 = (*(unsigned int *)&v67 >> 3) & 1;
  if (v71 != ((v69 >> 3) & 1))
    goto LABEL_132;
  if (v71)
  {
    spokenNotificationsControlCenterModuleEnabled = self->_spokenNotificationsControlCenterModuleEnabled;
    if (spokenNotificationsControlCenterModuleEnabled != objc_msgSend(v4, "spokenNotificationsControlCenterModuleEnabled"))goto LABEL_132;
    v67 = self->_has;
    v69 = v4[112];
  }
  v73 = (*(unsigned int *)&v67 >> 4) & 1;
  if (v73 != ((v69 >> 4) & 1))
    goto LABEL_132;
  if (v73)
  {
    spokenNotificationsWhitelistSettings = self->_spokenNotificationsWhitelistSettings;
    if (spokenNotificationsWhitelistSettings != objc_msgSend(v4, "spokenNotificationsWhitelistSettings"))
      goto LABEL_132;
  }
  -[SISchemaDailyDeviceStatus aggregatedMetrics](self, "aggregatedMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aggregatedMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus aggregatedMetrics](self, "aggregatedMetrics");
  v75 = objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    v76 = (void *)v75;
    -[SISchemaDailyDeviceStatus aggregatedMetrics](self, "aggregatedMetrics");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aggregatedMetrics");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v77, "isEqual:", v78);

    if (!v79)
      goto LABEL_132;
  }
  else
  {

  }
  -[SISchemaDailyDeviceStatus linkedAccessoryStates](self, "linkedAccessoryStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkedAccessoryStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus linkedAccessoryStates](self, "linkedAccessoryStates");
  v80 = objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    v81 = (void *)v80;
    -[SISchemaDailyDeviceStatus linkedAccessoryStates](self, "linkedAccessoryStates");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkedAccessoryStates");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v82, "isEqual:", v83);

    if (!v84)
      goto LABEL_132;
  }
  else
  {

  }
  v85 = (*(_WORD *)&self->_has >> 5) & 1;
  if (v85 != ((v4[112] >> 5) & 1))
    goto LABEL_132;
  if (v85)
  {
    siriInputLocale = self->_siriInputLocale;
    if (siriInputLocale != objc_msgSend(v4, "siriInputLocale"))
      goto LABEL_132;
  }
  -[SISchemaDailyDeviceStatus multiUserSetup](self, "multiUserSetup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiUserSetup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus multiUserSetup](self, "multiUserSetup");
  v87 = objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    v88 = (void *)v87;
    -[SISchemaDailyDeviceStatus multiUserSetup](self, "multiUserSetup");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multiUserSetup");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v89, "isEqual:", v90);

    if (!v91)
      goto LABEL_132;
  }
  else
  {

  }
  v92 = self->_has;
  v93 = (*(unsigned int *)&v92 >> 6) & 1;
  v94 = v4[112];
  if (v93 != ((v94 >> 6) & 1))
    goto LABEL_132;
  if (v93)
  {
    queuedAtTimestampHourInMs = self->_queuedAtTimestampHourInMs;
    if (queuedAtTimestampHourInMs != objc_msgSend(v4, "queuedAtTimestampHourInMs"))
      goto LABEL_132;
    v92 = self->_has;
    v94 = v4[112];
  }
  v96 = (*(unsigned int *)&v92 >> 7) & 1;
  if (v96 != ((v94 >> 7) & 1))
    goto LABEL_132;
  if (v96)
  {
    storeCountryCode = self->_storeCountryCode;
    if (storeCountryCode != objc_msgSend(v4, "storeCountryCode"))
      goto LABEL_132;
  }
  -[SISchemaDailyDeviceStatus enabledDictationLocales](self, "enabledDictationLocales");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enabledDictationLocales");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus enabledDictationLocales](self, "enabledDictationLocales");
  v98 = objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    v99 = (void *)v98;
    -[SISchemaDailyDeviceStatus enabledDictationLocales](self, "enabledDictationLocales");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enabledDictationLocales");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v100, "isEqual:", v101);

    if (!v102)
      goto LABEL_132;
  }
  else
  {

  }
  v103 = self->_has;
  v104 = (*(unsigned int *)&v103 >> 8) & 1;
  v105 = v4[112];
  if (v104 != ((v105 >> 8) & 1))
    goto LABEL_132;
  if (v104)
  {
    deviceCapacityInGB = self->_deviceCapacityInGB;
    if (deviceCapacityInGB != objc_msgSend(v4, "deviceCapacityInGB"))
      goto LABEL_132;
    v103 = self->_has;
    v105 = v4[112];
  }
  v107 = (*(unsigned int *)&v103 >> 9) & 1;
  if (v107 != ((v105 >> 9) & 1))
    goto LABEL_132;
  if (v107)
  {
    availableDeviceStorageInMB = self->_availableDeviceStorageInMB;
    objc_msgSend(v4, "availableDeviceStorageInMB");
    if (availableDeviceStorageInMB != v109)
      goto LABEL_132;
  }
  -[SISchemaDailyDeviceStatus modelNumber](self, "modelNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus modelNumber](self, "modelNumber");
  v110 = objc_claimAutoreleasedReturnValue();
  if (v110)
  {
    v111 = (void *)v110;
    -[SISchemaDailyDeviceStatus modelNumber](self, "modelNumber");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelNumber");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v112, "isEqual:", v113);

    if (!v114)
      goto LABEL_132;
  }
  else
  {

  }
  -[SISchemaDailyDeviceStatus regionInfo](self, "regionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus regionInfo](self, "regionInfo");
  v115 = objc_claimAutoreleasedReturnValue();
  if (v115)
  {
    v116 = (void *)v115;
    -[SISchemaDailyDeviceStatus regionInfo](self, "regionInfo");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "regionInfo");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v117, "isEqual:", v118);

    if (!v119)
      goto LABEL_132;
  }
  else
  {

  }
  -[SISchemaDailyDeviceStatus storefrontId](self, "storefrontId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storefrontId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_131;
  -[SISchemaDailyDeviceStatus storefrontId](self, "storefrontId");
  v120 = objc_claimAutoreleasedReturnValue();
  if (v120)
  {
    v121 = (void *)v120;
    -[SISchemaDailyDeviceStatus storefrontId](self, "storefrontId");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storefrontId");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(v122, "isEqual:", v123);

    if (!v124)
      goto LABEL_132;
  }
  else
  {

  }
  -[SISchemaDailyDeviceStatus installedVoices](self, "installedVoices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installedVoices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_131:

    goto LABEL_132;
  }
  -[SISchemaDailyDeviceStatus installedVoices](self, "installedVoices");
  v125 = objc_claimAutoreleasedReturnValue();
  if (!v125)
  {

LABEL_135:
    v130 = 1;
    goto LABEL_133;
  }
  v126 = (void *)v125;
  -[SISchemaDailyDeviceStatus installedVoices](self, "installedVoices");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installedVoices");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend(v127, "isEqual:", v128);

  if ((v129 & 1) != 0)
    goto LABEL_135;
LABEL_132:
  v130 = 0;
LABEL_133:

  return v130;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double availableDeviceStorageInMB;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  uint64_t v35;
  uint64_t v36;
  NSUInteger v37;
  NSUInteger v38;
  NSUInteger v39;

  v39 = -[NSString hash](self->_siriDeviceID, "hash");
  v38 = -[NSString hash](self->_siriSpeechID, "hash");
  v37 = -[NSString hash](self->_sharedUserId, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v36 = 2654435761 * self->_clientDeviceSamplingTimestampMs;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v36 = 0;
    if ((has & 2) != 0)
    {
LABEL_3:
      v35 = 2654435761 * self->_assistantRecordPublishTimestampMs;
      goto LABEL_6;
    }
  }
  v35 = 0;
LABEL_6:
  v34 = -[NSString hash](self->_locale, "hash");
  v33 = -[NSString hash](self->_deviceType, "hash");
  v32 = -[NSString hash](self->_deviceOs, "hash");
  v31 = -[NSString hash](self->_deviceBuild, "hash");
  v30 = -[SISchemaEnabledStatus hash](self->_enabledStatus, "hash");
  v29 = -[SISchemaActiveStatus hash](self->_activeStatus, "hash");
  v28 = -[SISchemaPersonalization hash](self->_personalization, "hash");
  v27 = -[SISchemaMultiUserState hash](self->_multiUserState, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 4) == 0)
  {
    v26 = 0;
    if ((v4 & 8) != 0)
      goto LABEL_8;
LABEL_11:
    v25 = 0;
    if ((v4 & 0x10) != 0)
      goto LABEL_9;
    goto LABEL_12;
  }
  v26 = 2654435761 * self->_spokenNotificationsproxCardSeen;
  if ((v4 & 8) == 0)
    goto LABEL_11;
LABEL_8:
  v25 = 2654435761 * self->_spokenNotificationsControlCenterModuleEnabled;
  if ((v4 & 0x10) != 0)
  {
LABEL_9:
    v5 = -[SISchemaAggregatedMetrics hash](self->_aggregatedMetrics, "hash", 2654435761 * self->_spokenNotificationsWhitelistSettings);
    goto LABEL_13;
  }
LABEL_12:
  v5 = -[SISchemaAggregatedMetrics hash](self->_aggregatedMetrics, "hash", 0);
LABEL_13:
  v6 = v5;
  v7 = -[NSArray hash](self->_linkedAccessoryStates, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v8 = 2654435761 * self->_siriInputLocale;
  else
    v8 = 0;
  v9 = -[SISchemaMultiUserSetup hash](self->_multiUserSetup, "hash");
  v10 = (__int16)self->_has;
  if ((v10 & 0x40) != 0)
  {
    v11 = 2654435761u * self->_queuedAtTimestampHourInMs;
    if ((v10 & 0x80) != 0)
      goto LABEL_18;
  }
  else
  {
    v11 = 0;
    if ((v10 & 0x80) != 0)
    {
LABEL_18:
      v12 = 2654435761 * self->_storeCountryCode;
      goto LABEL_21;
    }
  }
  v12 = 0;
LABEL_21:
  v13 = -[NSArray hash](self->_enabledDictationLocales, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v14 = 2654435761 * self->_deviceCapacityInGB;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_23;
LABEL_28:
    v19 = 0;
    goto LABEL_31;
  }
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_28;
LABEL_23:
  availableDeviceStorageInMB = self->_availableDeviceStorageInMB;
  v16 = -availableDeviceStorageInMB;
  if (availableDeviceStorageInMB >= 0.0)
    v16 = self->_availableDeviceStorageInMB;
  v17 = floor(v16 + 0.5);
  v18 = (v16 - v17) * 1.84467441e19;
  v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0)
      v19 += (unint64_t)v18;
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_31:
  v20 = v13 ^ v14 ^ v19 ^ -[NSString hash](self->_modelNumber, "hash");
  v21 = v20 ^ -[NSString hash](self->_regionInfo, "hash");
  v22 = v21 ^ -[NSString hash](self->_storefrontId, "hash");
  return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v22 ^ -[NSArray hash](self->_installedVoices, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int16 has;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
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
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
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
  void *v61;
  void *v62;
  void *v63;
  unsigned int v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  __int16 v68;
  void *v69;
  unsigned int v70;
  const __CFString *v71;
  void *v72;
  unsigned int v73;
  const __CFString *v74;
  void *v75;
  void *v76;
  id v77;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_activeStatus)
  {
    -[SISchemaDailyDeviceStatus activeStatus](self, "activeStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("activeStatus"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("activeStatus"));

    }
  }
  if (self->_aggregatedMetrics)
  {
    -[SISchemaDailyDeviceStatus aggregatedMetrics](self, "aggregatedMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("aggregatedMetrics"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("aggregatedMetrics"));

    }
  }
  has = (__int16)self->_has;
  v11 = 0x1E0CB3000uLL;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SISchemaDailyDeviceStatus assistantRecordPublishTimestampMs](self, "assistantRecordPublishTimestampMs"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("assistantRecordPublishTimestampMs"));

    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_13:
      if ((has & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_13;
  }
  v31 = (void *)MEMORY[0x1E0CB37E8];
  -[SISchemaDailyDeviceStatus availableDeviceStorageInMB](self, "availableDeviceStorageInMB");
  objc_msgSend(v31, "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("availableDeviceStorageInMB"));

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SISchemaDailyDeviceStatus clientDeviceSamplingTimestampMs](self, "clientDeviceSamplingTimestampMs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("clientDeviceSamplingTimestampMs"));

  }
LABEL_15:
  if (self->_deviceBuild)
  {
    -[SISchemaDailyDeviceStatus deviceBuild](self, "deviceBuild");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("deviceBuild"));

  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SISchemaDailyDeviceStatus deviceCapacityInGB](self, "deviceCapacityInGB"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("deviceCapacityInGB"));

  }
  if (self->_deviceOs)
  {
    -[SISchemaDailyDeviceStatus deviceOs](self, "deviceOs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("deviceOs"));

  }
  if (self->_deviceType)
  {
    -[SISchemaDailyDeviceStatus deviceType](self, "deviceType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("deviceType"));

  }
  if (-[NSArray count](self->_enabledDictationLocales, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v21 = self->_enabledDictationLocales;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v84 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * i), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v20, "addObject:", v26);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v27);

          }
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("enabledDictationLocales"));
    v11 = 0x1E0CB3000;
  }
  if (self->_enabledStatus)
  {
    -[SISchemaDailyDeviceStatus enabledStatus](self, "enabledStatus");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("enabledStatus"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("enabledStatus"));

    }
  }
  if (-[NSArray count](self->_installedVoices, "count"))
  {
    -[SISchemaDailyDeviceStatus installedVoices](self, "installedVoices");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("installedVoices"));

  }
  if (-[NSArray count](self->_linkedAccessoryStates, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v37 = self->_linkedAccessoryStates;
    v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v80 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * j), "dictionaryRepresentation");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            objc_msgSend(v36, "addObject:", v42);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObject:", v43);

          }
        }
        v39 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
      }
      while (v39);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("linkedAccessoryState"));
    v11 = 0x1E0CB3000uLL;
  }
  if (self->_locale)
  {
    -[SISchemaDailyDeviceStatus locale](self, "locale");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v44, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("locale"));

  }
  if (self->_modelNumber)
  {
    -[SISchemaDailyDeviceStatus modelNumber](self, "modelNumber");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("modelNumber"));

  }
  if (self->_multiUserSetup)
  {
    -[SISchemaDailyDeviceStatus multiUserSetup](self, "multiUserSetup");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("multiUserSetup"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("multiUserSetup"));

    }
  }
  if (self->_multiUserState)
  {
    -[SISchemaDailyDeviceStatus multiUserState](self, "multiUserState");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "dictionaryRepresentation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("multiUserState"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("multiUserState"));

    }
  }
  if (self->_personalization)
  {
    -[SISchemaDailyDeviceStatus personalization](self, "personalization");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "dictionaryRepresentation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("personalization"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("personalization"));

    }
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(*(id *)(v11 + 2024), "numberWithUnsignedLongLong:", -[SISchemaDailyDeviceStatus queuedAtTimestampHourInMs](self, "queuedAtTimestampHourInMs"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("queuedAtTimestampHourInMs"));

  }
  if (self->_regionInfo)
  {
    -[SISchemaDailyDeviceStatus regionInfo](self, "regionInfo");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(v58, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("regionInfo"));

  }
  if (self->_sharedUserId)
  {
    -[SISchemaDailyDeviceStatus sharedUserId](self, "sharedUserId");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v60, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("sharedUserId"));

  }
  if (self->_siriDeviceID)
  {
    -[SISchemaDailyDeviceStatus siriDeviceID](self, "siriDeviceID");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v62, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("siriDeviceID"));

  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v64 = -[SISchemaDailyDeviceStatus siriInputLocale](self, "siriInputLocale") - 1;
    if (v64 > 0x3D)
      v65 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v65 = off_1E5634C20[v64];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("siriInputLocale"));
  }
  if (self->_siriSpeechID)
  {
    -[SISchemaDailyDeviceStatus siriSpeechID](self, "siriSpeechID");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(v66, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("siriSpeechID"));

  }
  v68 = (__int16)self->_has;
  if ((v68 & 8) != 0)
  {
    objc_msgSend(*(id *)(v11 + 2024), "numberWithBool:", -[SISchemaDailyDeviceStatus spokenNotificationsControlCenterModuleEnabled](self, "spokenNotificationsControlCenterModuleEnabled"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("spokenNotificationsControlCenterModuleEnabled"));

    v68 = (__int16)self->_has;
    if ((v68 & 0x10) == 0)
    {
LABEL_93:
      if ((v68 & 4) == 0)
        goto LABEL_94;
LABEL_101:
      objc_msgSend(*(id *)(v11 + 2024), "numberWithBool:", -[SISchemaDailyDeviceStatus spokenNotificationsproxCardSeen](self, "spokenNotificationsproxCardSeen"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("spokenNotificationsproxCardSeen"));

      if ((*(_WORD *)&self->_has & 0x80) == 0)
        goto LABEL_106;
LABEL_102:
      v73 = -[SISchemaDailyDeviceStatus storeCountryCode](self, "storeCountryCode") - 1;
      if (v73 > 0xF9)
        v74 = CFSTR("COUNTRYCODE_UNKNOWN");
      else
        v74 = off_1E5634E30[v73];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("storeCountryCode"));
      goto LABEL_106;
    }
  }
  else if ((v68 & 0x10) == 0)
  {
    goto LABEL_93;
  }
  v70 = -[SISchemaDailyDeviceStatus spokenNotificationsWhitelistSettings](self, "spokenNotificationsWhitelistSettings")
      - 1;
  if (v70 > 3)
    v71 = CFSTR("NONE");
  else
    v71 = off_1E5634E10[v70];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("spokenNotificationsWhitelistSettings"));
  v68 = (__int16)self->_has;
  if ((v68 & 4) != 0)
    goto LABEL_101;
LABEL_94:
  if ((v68 & 0x80) != 0)
    goto LABEL_102;
LABEL_106:
  if (self->_storefrontId)
  {
    -[SISchemaDailyDeviceStatus storefrontId](self, "storefrontId");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (void *)objc_msgSend(v75, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("storefrontId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v77 = v3;

  return v77;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaDailyDeviceStatus dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaDailyDeviceStatus)initWithJSON:(id)a3
{
  void *v4;
  SISchemaDailyDeviceStatus *v5;
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
    self = -[SISchemaDailyDeviceStatus initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaDailyDeviceStatus)initWithDictionary:(id)a3
{
  id v4;
  SISchemaDailyDeviceStatus *v5;
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
  uint64_t v22;
  SISchemaEnabledStatus *v23;
  uint64_t v24;
  SISchemaActiveStatus *v25;
  uint64_t v26;
  SISchemaPersonalization *v27;
  uint64_t v28;
  SISchemaMultiUserState *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  SISchemaAggregatedMetrics *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  SISchemaLinkedAccessoryState *v42;
  void *v43;
  void *v44;
  SISchemaMultiUserSetup *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  uint64_t v55;
  SISchemaLocaleIdentifier *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  void *v71;
  SISchemaDailyDeviceStatus *v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  objc_super v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v112.receiver = self;
  v112.super_class = (Class)SISchemaDailyDeviceStatus;
  v5 = -[SISchemaDailyDeviceStatus init](&v112, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriDeviceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SISchemaDailyDeviceStatus setSiriDeviceID:](v5, "setSiriDeviceID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriSpeechID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SISchemaDailyDeviceStatus setSiriSpeechID:](v5, "setSiriSpeechID:", v9);

    }
    v83 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharedUserId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[SISchemaDailyDeviceStatus setSharedUserId:](v5, "setSharedUserId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientDeviceSamplingTimestampMs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDailyDeviceStatus setClientDeviceSamplingTimestampMs:](v5, "setClientDeviceSamplingTimestampMs:", objc_msgSend(v12, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantRecordPublishTimestampMs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v98 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDailyDeviceStatus setAssistantRecordPublishTimestampMs:](v5, "setAssistantRecordPublishTimestampMs:", objc_msgSend(v13, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v97 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[SISchemaDailyDeviceStatus setLocale:](v5, "setLocale:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v96 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[SISchemaDailyDeviceStatus setDeviceType:](v5, "setDeviceType:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceOs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v95 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[SISchemaDailyDeviceStatus setDeviceOs:](v5, "setDeviceOs:", v19);

    }
    v81 = v12;
    v82 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceBuild"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = (void *)objc_msgSend(v20, "copy");
      -[SISchemaDailyDeviceStatus setDeviceBuild:](v5, "setDeviceBuild:", v21);

    }
    v80 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enabledStatus"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v94 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[SISchemaEnabledStatus initWithDictionary:]([SISchemaEnabledStatus alloc], "initWithDictionary:", v22);
      -[SISchemaDailyDeviceStatus setEnabledStatus:](v5, "setEnabledStatus:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeStatus"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v93 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[SISchemaActiveStatus initWithDictionary:]([SISchemaActiveStatus alloc], "initWithDictionary:", v24);
      -[SISchemaDailyDeviceStatus setActiveStatus:](v5, "setActiveStatus:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personalization"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v92 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[SISchemaPersonalization initWithDictionary:]([SISchemaPersonalization alloc], "initWithDictionary:", v26);
      -[SISchemaDailyDeviceStatus setPersonalization:](v5, "setPersonalization:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multiUserState"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v91 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[SISchemaMultiUserState initWithDictionary:]([SISchemaMultiUserState alloc], "initWithDictionary:", v28);
      -[SISchemaDailyDeviceStatus setMultiUserState:](v5, "setMultiUserState:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spokenNotificationsproxCardSeen"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v90 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDailyDeviceStatus setSpokenNotificationsproxCardSeen:](v5, "setSpokenNotificationsproxCardSeen:", objc_msgSend(v30, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spokenNotificationsControlCenterModuleEnabled"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v89 = v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDailyDeviceStatus setSpokenNotificationsControlCenterModuleEnabled:](v5, "setSpokenNotificationsControlCenterModuleEnabled:", objc_msgSend(v31, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spokenNotificationsWhitelistSettings"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v88 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDailyDeviceStatus setSpokenNotificationsWhitelistSettings:](v5, "setSpokenNotificationsWhitelistSettings:", objc_msgSend(v32, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aggregatedMetrics"));
    v33 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v87 = (void *)v33;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = -[SISchemaAggregatedMetrics initWithDictionary:]([SISchemaAggregatedMetrics alloc], "initWithDictionary:", v33);
      -[SISchemaDailyDeviceStatus setAggregatedMetrics:](v5, "setAggregatedMetrics:", v34);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkedAccessoryState"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v86 = v35;
    v99 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v36 = v35;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v108, v115, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v109;
        do
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v109 != v39)
              objc_enumerationMutation(v36);
            v41 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v42 = -[SISchemaLinkedAccessoryState initWithDictionary:]([SISchemaLinkedAccessoryState alloc], "initWithDictionary:", v41);
              -[SISchemaDailyDeviceStatus addLinkedAccessoryState:](v5, "addLinkedAccessoryState:", v42);

            }
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v108, v115, 16);
        }
        while (v38);
      }

      v4 = v99;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriInputLocale"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDailyDeviceStatus setSiriInputLocale:](v5, "setSiriInputLocale:", objc_msgSend(v43, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multiUserSetup"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[SISchemaMultiUserSetup initWithDictionary:]([SISchemaMultiUserSetup alloc], "initWithDictionary:", v44);
      -[SISchemaDailyDeviceStatus setMultiUserSetup:](v5, "setMultiUserSetup:", v45);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queuedAtTimestampHourInMs"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDailyDeviceStatus setQueuedAtTimestampHourInMs:](v5, "setQueuedAtTimestampHourInMs:", objc_msgSend(v46, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeCountryCode"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v85 = v47;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDailyDeviceStatus setStoreCountryCode:](v5, "setStoreCountryCode:", objc_msgSend(v47, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enabledDictationLocales"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v84 = v48;
    v78 = v46;
    v79 = v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = v43;
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v50 = v48;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v105;
        do
        {
          for (j = 0; j != v52; ++j)
          {
            if (*(_QWORD *)v105 != v53)
              objc_enumerationMutation(v50);
            v55 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v56 = -[SISchemaLocaleIdentifier initWithDictionary:]([SISchemaLocaleIdentifier alloc], "initWithDictionary:", v55);
              -[SISchemaDailyDeviceStatus addEnabledDictationLocales:](v5, "addEnabledDictationLocales:", v56);

            }
          }
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
        }
        while (v52);
      }

      v4 = v99;
      v43 = v49;
      v46 = v78;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceCapacityInGB"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDailyDeviceStatus setDeviceCapacityInGB:](v5, "setDeviceCapacityInGB:", objc_msgSend(v57, "unsignedIntValue"));
    v77 = v57;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("availableDeviceStorageInMB"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v58, "doubleValue");
      -[SISchemaDailyDeviceStatus setAvailableDeviceStorageInMB:](v5, "setAvailableDeviceStorageInMB:");
    }
    v76 = v58;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelNumber"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v60 = (void *)objc_msgSend(v59, "copy");
      -[SISchemaDailyDeviceStatus setModelNumber:](v5, "setModelNumber:", v60);

    }
    v75 = v59;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("regionInfo"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v62 = (void *)objc_msgSend(v61, "copy");
      -[SISchemaDailyDeviceStatus setRegionInfo:](v5, "setRegionInfo:", v62);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storefrontId"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v64 = (void *)objc_msgSend(v63, "copy");
      -[SISchemaDailyDeviceStatus setStorefrontId:](v5, "setStorefrontId:", v64);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("installedVoices"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v74 = v43;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v66 = v65;
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
      if (v67)
      {
        v68 = v67;
        v69 = *(_QWORD *)v101;
        do
        {
          for (k = 0; k != v68; ++k)
          {
            if (*(_QWORD *)v101 != v69)
              objc_enumerationMutation(v66);
            v71 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[SISchemaDailyDeviceStatus addInstalledVoices:](v5, "addInstalledVoices:", objc_msgSend(v71, "intValue"));
          }
          v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
        }
        while (v68);
      }

      v4 = v99;
      v43 = v74;
      v46 = v78;
      v44 = v79;
    }
    v72 = v5;

  }
  return v5;
}

- (NSString)siriDeviceID
{
  return self->_siriDeviceID;
}

- (void)setSiriDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)siriSpeechID
{
  return self->_siriSpeechID;
}

- (void)setSiriSpeechID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- (void)setSharedUserId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)clientDeviceSamplingTimestampMs
{
  return self->_clientDeviceSamplingTimestampMs;
}

- (int64_t)assistantRecordPublishTimestampMs
{
  return self->_assistantRecordPublishTimestampMs;
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)deviceOs
{
  return self->_deviceOs;
}

- (void)setDeviceOs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)deviceBuild
{
  return self->_deviceBuild;
}

- (void)setDeviceBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SISchemaEnabledStatus)enabledStatus
{
  return self->_enabledStatus;
}

- (void)setEnabledStatus:(id)a3
{
  objc_storeStrong((id *)&self->_enabledStatus, a3);
}

- (SISchemaActiveStatus)activeStatus
{
  return self->_activeStatus;
}

- (void)setActiveStatus:(id)a3
{
  objc_storeStrong((id *)&self->_activeStatus, a3);
}

- (SISchemaPersonalization)personalization
{
  return self->_personalization;
}

- (void)setPersonalization:(id)a3
{
  objc_storeStrong((id *)&self->_personalization, a3);
}

- (SISchemaMultiUserState)multiUserState
{
  return self->_multiUserState;
}

- (void)setMultiUserState:(id)a3
{
  objc_storeStrong((id *)&self->_multiUserState, a3);
}

- (BOOL)spokenNotificationsproxCardSeen
{
  return self->_spokenNotificationsproxCardSeen;
}

- (BOOL)spokenNotificationsControlCenterModuleEnabled
{
  return self->_spokenNotificationsControlCenterModuleEnabled;
}

- (int)spokenNotificationsWhitelistSettings
{
  return self->_spokenNotificationsWhitelistSettings;
}

- (SISchemaAggregatedMetrics)aggregatedMetrics
{
  return self->_aggregatedMetrics;
}

- (void)setAggregatedMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_aggregatedMetrics, a3);
}

- (NSArray)linkedAccessoryStates
{
  return self->_linkedAccessoryStates;
}

- (void)setLinkedAccessoryStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int)siriInputLocale
{
  return self->_siriInputLocale;
}

- (SISchemaMultiUserSetup)multiUserSetup
{
  return self->_multiUserSetup;
}

- (void)setMultiUserSetup:(id)a3
{
  objc_storeStrong((id *)&self->_multiUserSetup, a3);
}

- (unint64_t)queuedAtTimestampHourInMs
{
  return self->_queuedAtTimestampHourInMs;
}

- (int)storeCountryCode
{
  return self->_storeCountryCode;
}

- (NSArray)enabledDictationLocales
{
  return self->_enabledDictationLocales;
}

- (void)setEnabledDictationLocales:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (unsigned)deviceCapacityInGB
{
  return self->_deviceCapacityInGB;
}

- (double)availableDeviceStorageInMB
{
  return self->_availableDeviceStorageInMB;
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)regionInfo
{
  return self->_regionInfo;
}

- (void)setRegionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)storefrontId
{
  return self->_storefrontId;
}

- (void)setStorefrontId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSArray)installedVoices
{
  return self->_installedVoices;
}

- (void)setInstalledVoices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setHasSiriDeviceID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasSiriSpeechID:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasSharedUserId:(BOOL)a3
{
  self->_hasSiriDeviceID = a3;
}

- (void)setHasLocale:(BOOL)a3
{
  self->_hasSiriSpeechID = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  self->_hasSharedUserId = a3;
}

- (void)setHasDeviceOs:(BOOL)a3
{
  self->_hasLocale = a3;
}

- (void)setHasDeviceBuild:(BOOL)a3
{
  self->_hasDeviceType = a3;
}

- (void)setHasEnabledStatus:(BOOL)a3
{
  self->_hasDeviceOs = a3;
}

- (void)setHasActiveStatus:(BOOL)a3
{
  self->_hasDeviceBuild = a3;
}

- (void)setHasPersonalization:(BOOL)a3
{
  self->_hasEnabledStatus = a3;
}

- (void)setHasMultiUserState:(BOOL)a3
{
  self->_hasActiveStatus = a3;
}

- (void)setHasAggregatedMetrics:(BOOL)a3
{
  self->_hasPersonalization = a3;
}

- (void)setHasMultiUserSetup:(BOOL)a3
{
  self->_hasMultiUserState = a3;
}

- (void)setHasModelNumber:(BOOL)a3
{
  self->_hasAggregatedMetrics = a3;
}

- (void)setHasRegionInfo:(BOOL)a3
{
  self->_hasMultiUserSetup = a3;
}

- (void)setHasStorefrontId:(BOOL)a3
{
  self->_hasModelNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedVoices, 0);
  objc_storeStrong((id *)&self->_storefrontId, 0);
  objc_storeStrong((id *)&self->_regionInfo, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_enabledDictationLocales, 0);
  objc_storeStrong((id *)&self->_multiUserSetup, 0);
  objc_storeStrong((id *)&self->_linkedAccessoryStates, 0);
  objc_storeStrong((id *)&self->_aggregatedMetrics, 0);
  objc_storeStrong((id *)&self->_multiUserState, 0);
  objc_storeStrong((id *)&self->_personalization, 0);
  objc_storeStrong((id *)&self->_activeStatus, 0);
  objc_storeStrong((id *)&self->_enabledStatus, 0);
  objc_storeStrong((id *)&self->_deviceBuild, 0);
  objc_storeStrong((id *)&self->_deviceOs, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_sharedUserId, 0);
  objc_storeStrong((id *)&self->_siriSpeechID, 0);
  objc_storeStrong((id *)&self->_siriDeviceID, 0);
}

- (int)getAnyEventType
{
  return 3;
}

@end
