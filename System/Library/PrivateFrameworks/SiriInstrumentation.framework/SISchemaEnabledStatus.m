@implementation SISchemaEnabledStatus

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
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SISchemaEnabledStatus;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v21, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaEnabledStatus announceEnabledStatus](self, "announceEnabledStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaEnabledStatus deleteAnnounceEnabledStatus](self, "deleteAnnounceEnabledStatus");
  -[SISchemaEnabledStatus adaptiveVolumeUserPreferences](self, "adaptiveVolumeUserPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaEnabledStatus deleteAdaptiveVolumeUserPreferences](self, "deleteAdaptiveVolumeUserPreferences");
  -[SISchemaEnabledStatus gradingOptInStateChanges](self, "gradingOptInStateChanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaEnabledStatus setGradingOptInStateChanges:](self, "setGradingOptInStateChanges:", v13);

  -[SISchemaEnabledStatus sendWithoutConfirmation](self, "sendWithoutConfirmation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applySensitiveConditionsPolicy:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "suppressMessage");

  if (v16)
    -[SISchemaEnabledStatus deleteSendWithoutConfirmation](self, "deleteSendWithoutConfirmation");
  -[SISchemaEnabledStatus siriVoiceTriggerSettings](self, "siriVoiceTriggerSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "applySensitiveConditionsPolicy:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "suppressMessage");

  if (v19)
    -[SISchemaEnabledStatus deleteSiriVoiceTriggerSettings](self, "deleteSiriVoiceTriggerSettings");

  return v5;
}

- (void)setAssistantEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_assistantEnabled = a3;
}

- (BOOL)hasAssistantEnabled
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasAssistantEnabled:(BOOL)a3
{
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (void)deleteAssistantEnabled
{
  -[SISchemaEnabledStatus setAssistantEnabled:](self, "setAssistantEnabled:", 0);
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setDictationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_dictationEnabled = a3;
}

- (BOOL)hasDictationEnabled
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDictationEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (void)deleteDictationEnabled
{
  -[SISchemaEnabledStatus setDictationEnabled:](self, "setDictationEnabled:", 0);
  *(_DWORD *)&self->_has &= ~2u;
}

- (void)setHardwareButtonEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_hardwareButtonEnabled = a3;
}

- (BOOL)hasHardwareButtonEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasHardwareButtonEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (void)deleteHardwareButtonEnabled
{
  -[SISchemaEnabledStatus setHardwareButtonEnabled:](self, "setHardwareButtonEnabled:", 0);
  *(_DWORD *)&self->_has &= ~4u;
}

- (void)setHeySiriEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_heySiriEnabled = a3;
}

- (BOOL)hasHeySiriEnabled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasHeySiriEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (void)deleteHeySiriEnabled
{
  -[SISchemaEnabledStatus setHeySiriEnabled:](self, "setHeySiriEnabled:", 0);
  *(_DWORD *)&self->_has &= ~8u;
}

- (void)setAssistantOnLockscreen:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_assistantOnLockscreen = a3;
}

- (BOOL)hasAssistantOnLockscreen
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasAssistantOnLockscreen:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (void)deleteAssistantOnLockscreen
{
  -[SISchemaEnabledStatus setAssistantOnLockscreen:](self, "setAssistantOnLockscreen:", 0);
  *(_DWORD *)&self->_has &= ~0x10u;
}

- (void)setRaiseToSpeakEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_raiseToSpeakEnabled = a3;
}

- (BOOL)hasRaiseToSpeakEnabled
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasRaiseToSpeakEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (void)deleteRaiseToSpeakEnabled
{
  -[SISchemaEnabledStatus setRaiseToSpeakEnabled:](self, "setRaiseToSpeakEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x20u;
}

- (void)setSpokenNotificationsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_spokenNotificationsEnabled = a3;
}

- (BOOL)hasSpokenNotificationsEnabled
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasSpokenNotificationsEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (void)deleteSpokenNotificationsEnabled
{
  -[SISchemaEnabledStatus setSpokenNotificationsEnabled:](self, "setSpokenNotificationsEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x40u;
}

- (void)setHasHomekitHome:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_hasHomekitHome = a3;
}

- (BOOL)hasHasHomekitHome
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasHasHomekitHome:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (void)deleteHasHomekitHome
{
  -[SISchemaEnabledStatus setHasHomekitHome:](self, "setHasHomekitHome:", 0);
  *(_DWORD *)&self->_has &= ~0x80u;
}

- (void)setShortcutsAvailable:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_shortcutsAvailable = a3;
}

- (BOOL)hasShortcutsAvailable
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHasShortcutsAvailable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (void)deleteShortcutsAvailable
{
  -[SISchemaEnabledStatus setShortcutsAvailable:](self, "setShortcutsAvailable:", 0);
  *(_DWORD *)&self->_has &= ~0x100u;
}

- (void)setDataSharingOptInStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_dataSharingOptInStatus = a3;
}

- (BOOL)hasDataSharingOptInStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasDataSharingOptInStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (void)deleteDataSharingOptInStatus
{
  -[SISchemaEnabledStatus setDataSharingOptInStatus:](self, "setDataSharingOptInStatus:", 0);
  *(_DWORD *)&self->_has &= ~0x200u;
}

- (void)setTypeToSiriEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_typeToSiriEnabled = a3;
}

- (BOOL)hasTypeToSiriEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasTypeToSiriEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (void)deleteTypeToSiriEnabled
{
  -[SISchemaEnabledStatus setTypeToSiriEnabled:](self, "setTypeToSiriEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x400u;
}

- (void)setIsPreciseLocationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_isPreciseLocationEnabled = a3;
}

- (BOOL)hasIsPreciseLocationEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasIsPreciseLocationEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (void)deleteIsPreciseLocationEnabled
{
  -[SISchemaEnabledStatus setIsPreciseLocationEnabled:](self, "setIsPreciseLocationEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x800u;
}

- (void)setVoiceFeedback:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_voiceFeedback = a3;
}

- (BOOL)hasVoiceFeedback
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasVoiceFeedback:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (void)deleteVoiceFeedback
{
  -[SISchemaEnabledStatus setVoiceFeedback:](self, "setVoiceFeedback:", 0);
  *(_DWORD *)&self->_has &= ~0x1000u;
}

- (BOOL)hasAnnounceEnabledStatus
{
  return self->_announceEnabledStatus != 0;
}

- (void)deleteAnnounceEnabledStatus
{
  -[SISchemaEnabledStatus setAnnounceEnabledStatus:](self, "setAnnounceEnabledStatus:", 0);
}

- (void)setIsAdaptiveVolumeEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isAdaptiveVolumeEnabled = a3;
}

- (BOOL)hasIsAdaptiveVolumeEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasIsAdaptiveVolumeEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (void)deleteIsAdaptiveVolumeEnabled
{
  -[SISchemaEnabledStatus setIsAdaptiveVolumeEnabled:](self, "setIsAdaptiveVolumeEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x2000u;
}

- (BOOL)hasAdaptiveVolumeUserPreferences
{
  return self->_adaptiveVolumeUserPreferences != 0;
}

- (void)deleteAdaptiveVolumeUserPreferences
{
  -[SISchemaEnabledStatus setAdaptiveVolumeUserPreferences:](self, "setAdaptiveVolumeUserPreferences:", 0);
}

- (void)setIsRemoteDarwinHeySiriEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isRemoteDarwinHeySiriEnabled = a3;
}

- (BOOL)hasIsRemoteDarwinHeySiriEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasIsRemoteDarwinHeySiriEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (void)deleteIsRemoteDarwinHeySiriEnabled
{
  -[SISchemaEnabledStatus setIsRemoteDarwinHeySiriEnabled:](self, "setIsRemoteDarwinHeySiriEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x4000u;
}

- (void)clearGradingOptInStateChanges
{
  -[NSArray removeAllObjects](self->_gradingOptInStateChanges, "removeAllObjects");
}

- (void)addGradingOptInStateChanges:(id)a3
{
  id v4;
  NSArray *gradingOptInStateChanges;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  gradingOptInStateChanges = self->_gradingOptInStateChanges;
  v8 = v4;
  if (!gradingOptInStateChanges)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_gradingOptInStateChanges;
    self->_gradingOptInStateChanges = v6;

    v4 = v8;
    gradingOptInStateChanges = self->_gradingOptInStateChanges;
  }
  -[NSArray addObject:](gradingOptInStateChanges, "addObject:", v4);

}

- (unint64_t)gradingOptInStateChangesCount
{
  return -[NSArray count](self->_gradingOptInStateChanges, "count");
}

- (id)gradingOptInStateChangesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_gradingOptInStateChanges, "objectAtIndexedSubscript:", a3);
}

- (void)setIsAutoPunctuationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isAutoPunctuationEnabled = a3;
}

- (BOOL)hasIsAutoPunctuationEnabled
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasIsAutoPunctuationEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (void)deleteIsAutoPunctuationEnabled
{
  -[SISchemaEnabledStatus setIsAutoPunctuationEnabled:](self, "setIsAutoPunctuationEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x8000u;
}

- (BOOL)hasSendWithoutConfirmation
{
  return self->_sendWithoutConfirmation != 0;
}

- (void)deleteSendWithoutConfirmation
{
  -[SISchemaEnabledStatus setSendWithoutConfirmation:](self, "setSendWithoutConfirmation:", 0);
}

- (void)setIsHSHangupEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isHSHangupEnabled = a3;
}

- (BOOL)hasIsHSHangupEnabled
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasIsHSHangupEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (void)deleteIsHSHangupEnabled
{
  -[SISchemaEnabledStatus setIsHSHangupEnabled:](self, "setIsHSHangupEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x10000u;
}

- (void)setIsSiriInCallEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isSiriInCallEnabled = a3;
}

- (BOOL)hasIsSiriInCallEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasIsSiriInCallEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (void)deleteIsSiriInCallEnabled
{
  -[SISchemaEnabledStatus setIsSiriInCallEnabled:](self, "setIsSiriInCallEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x20000u;
}

- (void)setHsHangupEnablementState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_hsHangupEnablementState = a3;
}

- (BOOL)hasHsHangupEnablementState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasHsHangupEnablementState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (void)deleteHsHangupEnablementState
{
  -[SISchemaEnabledStatus setHsHangupEnablementState:](self, "setHsHangupEnablementState:", 0);
  *(_DWORD *)&self->_has &= ~0x40000u;
}

- (void)setSiriInCallEnablementState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_siriInCallEnablementState = a3;
}

- (BOOL)hasSiriInCallEnablementState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasSiriInCallEnablementState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (void)deleteSiriInCallEnablementState
{
  -[SISchemaEnabledStatus setSiriInCallEnablementState:](self, "setSiriInCallEnablementState:", 0);
  *(_DWORD *)&self->_has &= ~0x80000u;
}

- (void)setIsAlwaysShowSiriCaptionsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isAlwaysShowSiriCaptionsEnabled = a3;
}

- (BOOL)hasIsAlwaysShowSiriCaptionsEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasIsAlwaysShowSiriCaptionsEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (void)deleteIsAlwaysShowSiriCaptionsEnabled
{
  -[SISchemaEnabledStatus setIsAlwaysShowSiriCaptionsEnabled:](self, "setIsAlwaysShowSiriCaptionsEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x100000u;
}

- (void)setIsAlwaysShowSpeechEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isAlwaysShowSpeechEnabled = a3;
}

- (BOOL)hasIsAlwaysShowSpeechEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasIsAlwaysShowSpeechEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (void)deleteIsAlwaysShowSpeechEnabled
{
  -[SISchemaEnabledStatus setIsAlwaysShowSpeechEnabled:](self, "setIsAlwaysShowSpeechEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x200000u;
}

- (void)setIsShowAppsBehindSiriEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_isShowAppsBehindSiriEnabled = a3;
}

- (BOOL)hasIsShowAppsBehindSiriEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasIsShowAppsBehindSiriEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (void)deleteIsShowAppsBehindSiriEnabled
{
  -[SISchemaEnabledStatus setIsShowAppsBehindSiriEnabled:](self, "setIsShowAppsBehindSiriEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x400000u;
}

- (void)setSiriSpeechRate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_siriSpeechRate = a3;
}

- (BOOL)hasSiriSpeechRate
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasSiriSpeechRate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (void)deleteSiriSpeechRate
{
  -[SISchemaEnabledStatus setSiriSpeechRate:](self, "setSiriSpeechRate:", 0.0);
  *(_DWORD *)&self->_has &= ~0x800000u;
}

- (void)setIsVoiceOverEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isVoiceOverEnabled = a3;
}

- (BOOL)hasIsVoiceOverEnabled
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHasIsVoiceOverEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (void)deleteIsVoiceOverEnabled
{
  -[SISchemaEnabledStatus setIsVoiceOverEnabled:](self, "setIsVoiceOverEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x1000000u;
}

- (BOOL)hasSiriVoiceTriggerSettings
{
  return self->_siriVoiceTriggerSettings != 0;
}

- (void)deleteSiriVoiceTriggerSettings
{
  -[SISchemaEnabledStatus setSiriVoiceTriggerSettings:](self, "setSiriVoiceTriggerSettings:", 0);
}

- (void)setIsShowAppsBehindSiriEnabledOnCarPlay:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_isShowAppsBehindSiriEnabledOnCarPlay = a3;
}

- (BOOL)hasIsShowAppsBehindSiriEnabledOnCarPlay
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasIsShowAppsBehindSiriEnabledOnCarPlay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (void)deleteIsShowAppsBehindSiriEnabledOnCarPlay
{
  -[SISchemaEnabledStatus setIsShowAppsBehindSiriEnabledOnCarPlay:](self, "setIsShowAppsBehindSiriEnabledOnCarPlay:", 0);
  *(_DWORD *)&self->_has &= ~0x2000000u;
}

- (void)setIsSiriCapableDigitalCarKeyAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_isSiriCapableDigitalCarKeyAvailable = a3;
}

- (BOOL)hasIsSiriCapableDigitalCarKeyAvailable
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasIsSiriCapableDigitalCarKeyAvailable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (void)deleteIsSiriCapableDigitalCarKeyAvailable
{
  -[SISchemaEnabledStatus setIsSiriCapableDigitalCarKeyAvailable:](self, "setIsSiriCapableDigitalCarKeyAvailable:", 0);
  *(_DWORD *)&self->_has &= ~0x4000000u;
}

- (void)setIsAlwaysListenForHeySiriEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_isAlwaysListenForHeySiriEnabled = a3;
}

- (BOOL)hasIsAlwaysListenForHeySiriEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasIsAlwaysListenForHeySiriEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (void)deleteIsAlwaysListenForHeySiriEnabled
{
  -[SISchemaEnabledStatus setIsAlwaysListenForHeySiriEnabled:](self, "setIsAlwaysListenForHeySiriEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x8000000u;
}

- (void)setSiriPauseTimeState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_siriPauseTimeState = a3;
}

- (BOOL)hasSiriPauseTimeState
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setHasSiriPauseTimeState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (void)deleteSiriPauseTimeState
{
  -[SISchemaEnabledStatus setSiriPauseTimeState:](self, "setSiriPauseTimeState:", 0);
  *(_DWORD *)&self->_has &= ~0x10000000u;
}

- (void)setIsMteUploadEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_isMteUploadEnabled = a3;
}

- (BOOL)hasIsMteUploadEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHasIsMteUploadEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (void)deleteIsMteUploadEnabled
{
  -[SISchemaEnabledStatus setIsMteUploadEnabled:](self, "setIsMteUploadEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x20000000u;
}

- (void)setIsServerUserDataSyncEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_isServerUserDataSyncEnabled = a3;
}

- (BOOL)hasIsServerUserDataSyncEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setHasIsServerUserDataSyncEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (void)deleteIsServerUserDataSyncEnabled
{
  -[SISchemaEnabledStatus setIsServerUserDataSyncEnabled:](self, "setIsServerUserDataSyncEnabled:", 0);
  *(_DWORD *)&self->_has &= ~0x40000000u;
}

- (void)setLocationAccessPermission:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000000;
  self->_locationAccessPermission = a3;
}

- (BOOL)hasLocationAccessPermission
{
  return *(_DWORD *)&self->_has >> 31;
}

- (void)setHasLocationAccessPermission:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = 0x80000000;
  else
    v3 = 0;
  self->_has = ($5F8FA149478B3F06D8A5175B937FFFE0)(v3 & 0x80000000 | *(_DWORD *)&self->_has & 0x7FFFFFFF);
}

- (void)deleteLocationAccessPermission
{
  -[SISchemaEnabledStatus setLocationAccessPermission:](self, "setLocationAccessPermission:", 0);
  *(_DWORD *)&self->_has &= ~0x80000000;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaEnabledStatusReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $5F8FA149478B3F06D8A5175B937FFFE0 has;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  $5F8FA149478B3F06D8A5175B937FFFE0 v17;
  void *v18;
  void *v19;
  $5F8FA149478B3F06D8A5175B937FFFE0 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_56;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_5;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_65:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_14:
    PBDataWriterWriteInt32Field();
LABEL_15:
  -[SISchemaEnabledStatus announceEnabledStatus](self, "announceEnabledStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SISchemaEnabledStatus announceEnabledStatus](self, "announceEnabledStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  -[SISchemaEnabledStatus adaptiveVolumeUserPreferences](self, "adaptiveVolumeUserPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SISchemaEnabledStatus adaptiveVolumeUserPreferences](self, "adaptiveVolumeUserPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = self->_gradingOptInStateChanges;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    PBDataWriterWriteBOOLField();
  -[SISchemaEnabledStatus sendWithoutConfirmation](self, "sendWithoutConfirmation", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SISchemaEnabledStatus sendWithoutConfirmation](self, "sendWithoutConfirmation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x20000) == 0)
    {
LABEL_36:
      if ((*(_DWORD *)&v17 & 0x40000) == 0)
        goto LABEL_37;
      goto LABEL_69;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x20000) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteBOOLField();
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x40000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v17 & 0x80000) == 0)
      goto LABEL_38;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x80000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v17 & 0x100000) == 0)
      goto LABEL_39;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x100000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v17 & 0x200000) == 0)
      goto LABEL_40;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteBOOLField();
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x200000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v17 & 0x400000) == 0)
      goto LABEL_41;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteBOOLField();
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x400000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v17 & 0x800000) == 0)
      goto LABEL_42;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x800000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v17 & 0x1000000) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_74:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_has & 0x1000000) != 0)
LABEL_43:
    PBDataWriterWriteBOOLField();
LABEL_44:
  -[SISchemaEnabledStatus siriVoiceTriggerSettings](self, "siriVoiceTriggerSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SISchemaEnabledStatus siriVoiceTriggerSettings](self, "siriVoiceTriggerSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v20 = self->_has;
    if ((*(_DWORD *)&v20 & 0x4000000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v20 & 0x8000000) == 0)
        goto LABEL_49;
      goto LABEL_78;
    }
  }
  else if ((*(_DWORD *)&v20 & 0x4000000) == 0)
  {
    goto LABEL_48;
  }
  PBDataWriterWriteBOOLField();
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x8000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v20 & 0x10000000) == 0)
      goto LABEL_50;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v20 & 0x20000000) == 0)
      goto LABEL_51;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteInt32Field();
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x20000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v20 & 0x40000000) == 0)
      goto LABEL_52;
LABEL_81:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_has & 0x80000000) == 0)
      goto LABEL_53;
LABEL_82:
    PBDataWriterWriteInt32Field();
    goto LABEL_53;
  }
LABEL_80:
  PBDataWriterWriteBOOLField();
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x40000000) != 0)
    goto LABEL_81;
LABEL_52:
  if ((*(_DWORD *)&v20 & 0x80000000) != 0)
    goto LABEL_82;
LABEL_53:

}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  $5F8FA149478B3F06D8A5175B937FFFE0 has;
  unsigned int v6;
  int assistantEnabled;
  int v8;
  int dictationEnabled;
  int v10;
  int hardwareButtonEnabled;
  int v12;
  int heySiriEnabled;
  int v14;
  int assistantOnLockscreen;
  int v16;
  int raiseToSpeakEnabled;
  int v18;
  int spokenNotificationsEnabled;
  int v20;
  int hasHomekitHome;
  int v22;
  int shortcutsAvailable;
  int v24;
  int dataSharingOptInStatus;
  int v26;
  int typeToSiriEnabled;
  int v28;
  int isPreciseLocationEnabled;
  int v30;
  int voiceFeedback;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  int isAdaptiveVolumeEnabled;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  int isRemoteDarwinHeySiriEnabled;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  int v53;
  int isAutoPunctuationEnabled;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  $5F8FA149478B3F06D8A5175B937FFFE0 v60;
  int v61;
  unsigned int v62;
  int isHSHangupEnabled;
  int v64;
  int isSiriInCallEnabled;
  int v66;
  int hsHangupEnablementState;
  int v68;
  int siriInCallEnablementState;
  int v70;
  int isAlwaysShowSiriCaptionsEnabled;
  int v72;
  int isAlwaysShowSpeechEnabled;
  int v74;
  int isShowAppsBehindSiriEnabled;
  int v76;
  double siriSpeechRate;
  double v78;
  int v79;
  int isVoiceOverEnabled;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  BOOL v86;
  $5F8FA149478B3F06D8A5175B937FFFE0 v88;
  int v89;
  unsigned int v90;
  int isShowAppsBehindSiriEnabledOnCarPlay;
  int v92;
  int isSiriCapableDigitalCarKeyAvailable;
  int v94;
  int isAlwaysListenForHeySiriEnabled;
  int v96;
  int siriPauseTimeState;
  int v98;
  int isMteUploadEnabled;
  int v100;
  int isServerUserDataSyncEnabled;
  int locationAccessPermission;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_122;
  has = self->_has;
  v6 = v4[36];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_122;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    assistantEnabled = self->_assistantEnabled;
    if (assistantEnabled != objc_msgSend(v4, "assistantEnabled"))
      goto LABEL_122;
    has = self->_has;
    v6 = v4[36];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_122;
  if (v8)
  {
    dictationEnabled = self->_dictationEnabled;
    if (dictationEnabled != objc_msgSend(v4, "dictationEnabled"))
      goto LABEL_122;
    has = self->_has;
    v6 = v4[36];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_122;
  if (v10)
  {
    hardwareButtonEnabled = self->_hardwareButtonEnabled;
    if (hardwareButtonEnabled != objc_msgSend(v4, "hardwareButtonEnabled"))
      goto LABEL_122;
    has = self->_has;
    v6 = v4[36];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_122;
  if (v12)
  {
    heySiriEnabled = self->_heySiriEnabled;
    if (heySiriEnabled != objc_msgSend(v4, "heySiriEnabled"))
      goto LABEL_122;
    has = self->_has;
    v6 = v4[36];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_122;
  if (v14)
  {
    assistantOnLockscreen = self->_assistantOnLockscreen;
    if (assistantOnLockscreen != objc_msgSend(v4, "assistantOnLockscreen"))
      goto LABEL_122;
    has = self->_has;
    v6 = v4[36];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_122;
  if (v16)
  {
    raiseToSpeakEnabled = self->_raiseToSpeakEnabled;
    if (raiseToSpeakEnabled != objc_msgSend(v4, "raiseToSpeakEnabled"))
      goto LABEL_122;
    has = self->_has;
    v6 = v4[36];
  }
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_122;
  if (v18)
  {
    spokenNotificationsEnabled = self->_spokenNotificationsEnabled;
    if (spokenNotificationsEnabled != objc_msgSend(v4, "spokenNotificationsEnabled"))
      goto LABEL_122;
    has = self->_has;
    v6 = v4[36];
  }
  v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1))
    goto LABEL_122;
  if (v20)
  {
    hasHomekitHome = self->_hasHomekitHome;
    if (hasHomekitHome != objc_msgSend(v4, "hasHomekitHome"))
      goto LABEL_122;
    has = self->_has;
    v6 = v4[36];
  }
  v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1))
    goto LABEL_122;
  if (v22)
  {
    shortcutsAvailable = self->_shortcutsAvailable;
    if (shortcutsAvailable != objc_msgSend(v4, "shortcutsAvailable"))
      goto LABEL_122;
    has = self->_has;
    v6 = v4[36];
  }
  v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1))
    goto LABEL_122;
  if (v24)
  {
    dataSharingOptInStatus = self->_dataSharingOptInStatus;
    if (dataSharingOptInStatus != objc_msgSend(v4, "dataSharingOptInStatus"))
      goto LABEL_122;
    has = self->_has;
    v6 = v4[36];
  }
  v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1))
    goto LABEL_122;
  if (v26)
  {
    typeToSiriEnabled = self->_typeToSiriEnabled;
    if (typeToSiriEnabled != objc_msgSend(v4, "typeToSiriEnabled"))
      goto LABEL_122;
    has = self->_has;
    v6 = v4[36];
  }
  v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1))
    goto LABEL_122;
  if (v28)
  {
    isPreciseLocationEnabled = self->_isPreciseLocationEnabled;
    if (isPreciseLocationEnabled != objc_msgSend(v4, "isPreciseLocationEnabled"))
      goto LABEL_122;
    has = self->_has;
    v6 = v4[36];
  }
  v30 = (*(unsigned int *)&has >> 12) & 1;
  if (v30 != ((v6 >> 12) & 1))
    goto LABEL_122;
  if (v30)
  {
    voiceFeedback = self->_voiceFeedback;
    if (voiceFeedback != objc_msgSend(v4, "voiceFeedback"))
      goto LABEL_122;
  }
  -[SISchemaEnabledStatus announceEnabledStatus](self, "announceEnabledStatus");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "announceEnabledStatus");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v32 == 0) == (v33 != 0))
    goto LABEL_121;
  -[SISchemaEnabledStatus announceEnabledStatus](self, "announceEnabledStatus");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[SISchemaEnabledStatus announceEnabledStatus](self, "announceEnabledStatus");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "announceEnabledStatus");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_122;
  }
  else
  {

  }
  v39 = (*(_DWORD *)&self->_has >> 13) & 1;
  if (v39 != ((v4[36] >> 13) & 1))
    goto LABEL_122;
  if (v39)
  {
    isAdaptiveVolumeEnabled = self->_isAdaptiveVolumeEnabled;
    if (isAdaptiveVolumeEnabled != objc_msgSend(v4, "isAdaptiveVolumeEnabled"))
      goto LABEL_122;
  }
  -[SISchemaEnabledStatus adaptiveVolumeUserPreferences](self, "adaptiveVolumeUserPreferences");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adaptiveVolumeUserPreferences");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v32 == 0) == (v33 != 0))
    goto LABEL_121;
  -[SISchemaEnabledStatus adaptiveVolumeUserPreferences](self, "adaptiveVolumeUserPreferences");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[SISchemaEnabledStatus adaptiveVolumeUserPreferences](self, "adaptiveVolumeUserPreferences");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "adaptiveVolumeUserPreferences");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_122;
  }
  else
  {

  }
  v46 = (*(_DWORD *)&self->_has >> 14) & 1;
  if (v46 != ((v4[36] >> 14) & 1))
    goto LABEL_122;
  if (v46)
  {
    isRemoteDarwinHeySiriEnabled = self->_isRemoteDarwinHeySiriEnabled;
    if (isRemoteDarwinHeySiriEnabled != objc_msgSend(v4, "isRemoteDarwinHeySiriEnabled"))
      goto LABEL_122;
  }
  -[SISchemaEnabledStatus gradingOptInStateChanges](self, "gradingOptInStateChanges");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gradingOptInStateChanges");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v32 == 0) == (v33 != 0))
    goto LABEL_121;
  -[SISchemaEnabledStatus gradingOptInStateChanges](self, "gradingOptInStateChanges");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[SISchemaEnabledStatus gradingOptInStateChanges](self, "gradingOptInStateChanges");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gradingOptInStateChanges");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_122;
  }
  else
  {

  }
  v53 = (*(_DWORD *)&self->_has >> 15) & 1;
  if (v53 != ((v4[36] >> 15) & 1))
    goto LABEL_122;
  if (v53)
  {
    isAutoPunctuationEnabled = self->_isAutoPunctuationEnabled;
    if (isAutoPunctuationEnabled != objc_msgSend(v4, "isAutoPunctuationEnabled"))
      goto LABEL_122;
  }
  -[SISchemaEnabledStatus sendWithoutConfirmation](self, "sendWithoutConfirmation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendWithoutConfirmation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v32 == 0) == (v33 != 0))
    goto LABEL_121;
  -[SISchemaEnabledStatus sendWithoutConfirmation](self, "sendWithoutConfirmation");
  v55 = objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    v56 = (void *)v55;
    -[SISchemaEnabledStatus sendWithoutConfirmation](self, "sendWithoutConfirmation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendWithoutConfirmation");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v57, "isEqual:", v58);

    if (!v59)
      goto LABEL_122;
  }
  else
  {

  }
  v60 = self->_has;
  v61 = HIWORD(*(unsigned int *)&v60) & 1;
  v62 = v4[36];
  if (v61 != (HIWORD(v62) & 1))
    goto LABEL_122;
  if (v61)
  {
    isHSHangupEnabled = self->_isHSHangupEnabled;
    if (isHSHangupEnabled != objc_msgSend(v4, "isHSHangupEnabled"))
      goto LABEL_122;
    v60 = self->_has;
    v62 = v4[36];
  }
  v64 = (*(unsigned int *)&v60 >> 17) & 1;
  if (v64 != ((v62 >> 17) & 1))
    goto LABEL_122;
  if (v64)
  {
    isSiriInCallEnabled = self->_isSiriInCallEnabled;
    if (isSiriInCallEnabled != objc_msgSend(v4, "isSiriInCallEnabled"))
      goto LABEL_122;
    v60 = self->_has;
    v62 = v4[36];
  }
  v66 = (*(unsigned int *)&v60 >> 18) & 1;
  if (v66 != ((v62 >> 18) & 1))
    goto LABEL_122;
  if (v66)
  {
    hsHangupEnablementState = self->_hsHangupEnablementState;
    if (hsHangupEnablementState != objc_msgSend(v4, "hsHangupEnablementState"))
      goto LABEL_122;
    v60 = self->_has;
    v62 = v4[36];
  }
  v68 = (*(unsigned int *)&v60 >> 19) & 1;
  if (v68 != ((v62 >> 19) & 1))
    goto LABEL_122;
  if (v68)
  {
    siriInCallEnablementState = self->_siriInCallEnablementState;
    if (siriInCallEnablementState != objc_msgSend(v4, "siriInCallEnablementState"))
      goto LABEL_122;
    v60 = self->_has;
    v62 = v4[36];
  }
  v70 = (*(unsigned int *)&v60 >> 20) & 1;
  if (v70 != ((v62 >> 20) & 1))
    goto LABEL_122;
  if (v70)
  {
    isAlwaysShowSiriCaptionsEnabled = self->_isAlwaysShowSiriCaptionsEnabled;
    if (isAlwaysShowSiriCaptionsEnabled != objc_msgSend(v4, "isAlwaysShowSiriCaptionsEnabled"))
      goto LABEL_122;
    v60 = self->_has;
    v62 = v4[36];
  }
  v72 = (*(unsigned int *)&v60 >> 21) & 1;
  if (v72 != ((v62 >> 21) & 1))
    goto LABEL_122;
  if (v72)
  {
    isAlwaysShowSpeechEnabled = self->_isAlwaysShowSpeechEnabled;
    if (isAlwaysShowSpeechEnabled != objc_msgSend(v4, "isAlwaysShowSpeechEnabled"))
      goto LABEL_122;
    v60 = self->_has;
    v62 = v4[36];
  }
  v74 = (*(unsigned int *)&v60 >> 22) & 1;
  if (v74 != ((v62 >> 22) & 1))
    goto LABEL_122;
  if (v74)
  {
    isShowAppsBehindSiriEnabled = self->_isShowAppsBehindSiriEnabled;
    if (isShowAppsBehindSiriEnabled != objc_msgSend(v4, "isShowAppsBehindSiriEnabled"))
      goto LABEL_122;
    v60 = self->_has;
    v62 = v4[36];
  }
  v76 = (*(unsigned int *)&v60 >> 23) & 1;
  if (v76 != ((v62 >> 23) & 1))
    goto LABEL_122;
  if (v76)
  {
    siriSpeechRate = self->_siriSpeechRate;
    objc_msgSend(v4, "siriSpeechRate");
    if (siriSpeechRate != v78)
      goto LABEL_122;
    v60 = self->_has;
    v62 = v4[36];
  }
  v79 = HIBYTE(*(unsigned int *)&v60) & 1;
  if (v79 != (HIBYTE(v62) & 1))
    goto LABEL_122;
  if (v79)
  {
    isVoiceOverEnabled = self->_isVoiceOverEnabled;
    if (isVoiceOverEnabled != objc_msgSend(v4, "isVoiceOverEnabled"))
      goto LABEL_122;
  }
  -[SISchemaEnabledStatus siriVoiceTriggerSettings](self, "siriVoiceTriggerSettings");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriVoiceTriggerSettings");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v32 == 0) == (v33 != 0))
  {
LABEL_121:

    goto LABEL_122;
  }
  -[SISchemaEnabledStatus siriVoiceTriggerSettings](self, "siriVoiceTriggerSettings");
  v81 = objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    v82 = (void *)v81;
    -[SISchemaEnabledStatus siriVoiceTriggerSettings](self, "siriVoiceTriggerSettings");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriVoiceTriggerSettings");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v83, "isEqual:", v84);

    if (!v85)
      goto LABEL_122;
  }
  else
  {

  }
  v88 = self->_has;
  v89 = (*(unsigned int *)&v88 >> 25) & 1;
  v90 = v4[36];
  if (v89 == ((v90 >> 25) & 1))
  {
    if (v89)
    {
      isShowAppsBehindSiriEnabledOnCarPlay = self->_isShowAppsBehindSiriEnabledOnCarPlay;
      if (isShowAppsBehindSiriEnabledOnCarPlay != objc_msgSend(v4, "isShowAppsBehindSiriEnabledOnCarPlay"))goto LABEL_122;
      v88 = self->_has;
      v90 = v4[36];
    }
    v92 = (*(unsigned int *)&v88 >> 26) & 1;
    if (v92 == ((v90 >> 26) & 1))
    {
      if (v92)
      {
        isSiriCapableDigitalCarKeyAvailable = self->_isSiriCapableDigitalCarKeyAvailable;
        if (isSiriCapableDigitalCarKeyAvailable != objc_msgSend(v4, "isSiriCapableDigitalCarKeyAvailable"))goto LABEL_122;
        v88 = self->_has;
        v90 = v4[36];
      }
      v94 = (*(unsigned int *)&v88 >> 27) & 1;
      if (v94 == ((v90 >> 27) & 1))
      {
        if (v94)
        {
          isAlwaysListenForHeySiriEnabled = self->_isAlwaysListenForHeySiriEnabled;
          if (isAlwaysListenForHeySiriEnabled != objc_msgSend(v4, "isAlwaysListenForHeySiriEnabled"))
            goto LABEL_122;
          v88 = self->_has;
          v90 = v4[36];
        }
        v96 = (*(unsigned int *)&v88 >> 28) & 1;
        if (v96 == ((v90 >> 28) & 1))
        {
          if (v96)
          {
            siriPauseTimeState = self->_siriPauseTimeState;
            if (siriPauseTimeState != objc_msgSend(v4, "siriPauseTimeState"))
              goto LABEL_122;
            v88 = self->_has;
            v90 = v4[36];
          }
          v98 = (*(unsigned int *)&v88 >> 29) & 1;
          if (v98 == ((v90 >> 29) & 1))
          {
            if (v98)
            {
              isMteUploadEnabled = self->_isMteUploadEnabled;
              if (isMteUploadEnabled != objc_msgSend(v4, "isMteUploadEnabled"))
                goto LABEL_122;
              v88 = self->_has;
              v90 = v4[36];
            }
            v100 = (*(unsigned int *)&v88 >> 30) & 1;
            if (v100 == ((v90 >> 30) & 1))
            {
              if (v100)
              {
                isServerUserDataSyncEnabled = self->_isServerUserDataSyncEnabled;
                if (isServerUserDataSyncEnabled != objc_msgSend(v4, "isServerUserDataSyncEnabled"))
                  goto LABEL_122;
                v88 = self->_has;
                v90 = v4[36];
              }
              if (((v90 ^ *(_DWORD *)&v88) & 0x80000000) == 0)
              {
                if ((*(_DWORD *)&v88 & 0x80000000) == 0
                  || (locationAccessPermission = self->_locationAccessPermission,
                      locationAccessPermission == objc_msgSend(v4, "locationAccessPermission")))
                {
                  v86 = 1;
                  goto LABEL_123;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_122:
  v86 = 0;
LABEL_123:

  return v86;
}

- (unint64_t)hash
{
  $5F8FA149478B3F06D8A5175B937FFFE0 has;
  $5F8FA149478B3F06D8A5175B937FFFE0 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double siriSpeechRate;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  $5F8FA149478B3F06D8A5175B937FFFE0 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v47 = 2654435761 * self->_assistantEnabled;
    if ((*(_BYTE *)&has & 2) != 0)
    {
LABEL_3:
      v46 = 2654435761 * self->_dictationEnabled;
      if ((*(_BYTE *)&has & 4) != 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else
  {
    v47 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_3;
  }
  v46 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_4:
    v45 = 2654435761 * self->_hardwareButtonEnabled;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v45 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_5:
    v44 = 2654435761 * self->_heySiriEnabled;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v44 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_6:
    v43 = 2654435761 * self->_assistantOnLockscreen;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  v43 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_7:
    v42 = 2654435761 * self->_raiseToSpeakEnabled;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v42 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_8:
    v41 = 2654435761 * self->_spokenNotificationsEnabled;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v41 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_9:
    v40 = 2654435761 * self->_hasHomekitHome;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v40 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    v39 = 2654435761 * self->_shortcutsAvailable;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v39 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    v38 = 2654435761 * self->_dataSharingOptInStatus;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v38 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    v37 = 2654435761 * self->_typeToSiriEnabled;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_13;
LABEL_26:
    v36 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_14;
    goto LABEL_27;
  }
LABEL_25:
  v37 = 0;
  if ((*(_WORD *)&has & 0x800) == 0)
    goto LABEL_26;
LABEL_13:
  v36 = 2654435761 * self->_isPreciseLocationEnabled;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_14:
    v35 = 2654435761 * self->_voiceFeedback;
    goto LABEL_28;
  }
LABEL_27:
  v35 = 0;
LABEL_28:
  v34 = -[SISchemaAnnounceEnabledStatus hash](self->_announceEnabledStatus, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    v33 = 2654435761 * self->_isAdaptiveVolumeEnabled;
  else
    v33 = 0;
  v32 = -[SISchemaAdaptiveVolumeUserPreferences hash](self->_adaptiveVolumeUserPreferences, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    v31 = 2654435761 * self->_isRemoteDarwinHeySiriEnabled;
  else
    v31 = 0;
  v30 = -[NSArray hash](self->_gradingOptInStateChanges, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    v29 = 2654435761 * self->_isAutoPunctuationEnabled;
  else
    v29 = 0;
  v28 = -[SISchemaSendWithoutConfirmation hash](self->_sendWithoutConfirmation, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
    v27 = 2654435761 * self->_isHSHangupEnabled;
    if ((*(_DWORD *)&v4 & 0x20000) != 0)
    {
LABEL_39:
      v26 = 2654435761 * self->_isSiriInCallEnabled;
      if ((*(_DWORD *)&v4 & 0x40000) != 0)
        goto LABEL_40;
      goto LABEL_51;
    }
  }
  else
  {
    v27 = 0;
    if ((*(_DWORD *)&v4 & 0x20000) != 0)
      goto LABEL_39;
  }
  v26 = 0;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_40:
    v5 = 2654435761 * self->_hsHangupEnablementState;
    if ((*(_DWORD *)&v4 & 0x80000) != 0)
      goto LABEL_41;
    goto LABEL_52;
  }
LABEL_51:
  v5 = 0;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
LABEL_41:
    v6 = 2654435761 * self->_siriInCallEnablementState;
    if ((*(_DWORD *)&v4 & 0x100000) != 0)
      goto LABEL_42;
    goto LABEL_53;
  }
LABEL_52:
  v6 = 0;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_42:
    v7 = 2654435761 * self->_isAlwaysShowSiriCaptionsEnabled;
    if ((*(_DWORD *)&v4 & 0x200000) != 0)
      goto LABEL_43;
    goto LABEL_54;
  }
LABEL_53:
  v7 = 0;
  if ((*(_DWORD *)&v4 & 0x200000) != 0)
  {
LABEL_43:
    v8 = 2654435761 * self->_isAlwaysShowSpeechEnabled;
    if ((*(_DWORD *)&v4 & 0x400000) != 0)
      goto LABEL_44;
LABEL_55:
    v9 = 0;
    if ((*(_DWORD *)&v4 & 0x800000) != 0)
      goto LABEL_45;
LABEL_56:
    v14 = 0;
    goto LABEL_59;
  }
LABEL_54:
  v8 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) == 0)
    goto LABEL_55;
LABEL_44:
  v9 = 2654435761 * self->_isShowAppsBehindSiriEnabled;
  if ((*(_DWORD *)&v4 & 0x800000) == 0)
    goto LABEL_56;
LABEL_45:
  siriSpeechRate = self->_siriSpeechRate;
  v11 = -siriSpeechRate;
  if (siriSpeechRate >= 0.0)
    v11 = self->_siriSpeechRate;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_59:
  if ((*(_DWORD *)&v4 & 0x1000000) != 0)
    v15 = 2654435761 * self->_isVoiceOverEnabled;
  else
    v15 = 0;
  v16 = -[SISchemaSiriVoiceTriggerSettings hash](self->_siriVoiceTriggerSettings, "hash");
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x2000000) != 0)
  {
    v18 = 2654435761 * self->_isShowAppsBehindSiriEnabledOnCarPlay;
    if ((*(_DWORD *)&v17 & 0x4000000) != 0)
    {
LABEL_64:
      v19 = 2654435761 * self->_isSiriCapableDigitalCarKeyAvailable;
      if ((*(_DWORD *)&v17 & 0x8000000) != 0)
        goto LABEL_65;
      goto LABEL_72;
    }
  }
  else
  {
    v18 = 0;
    if ((*(_DWORD *)&v17 & 0x4000000) != 0)
      goto LABEL_64;
  }
  v19 = 0;
  if ((*(_DWORD *)&v17 & 0x8000000) != 0)
  {
LABEL_65:
    v20 = 2654435761 * self->_isAlwaysListenForHeySiriEnabled;
    if ((*(_DWORD *)&v17 & 0x10000000) != 0)
      goto LABEL_66;
    goto LABEL_73;
  }
LABEL_72:
  v20 = 0;
  if ((*(_DWORD *)&v17 & 0x10000000) != 0)
  {
LABEL_66:
    v21 = 2654435761 * self->_siriPauseTimeState;
    if ((*(_DWORD *)&v17 & 0x20000000) != 0)
      goto LABEL_67;
    goto LABEL_74;
  }
LABEL_73:
  v21 = 0;
  if ((*(_DWORD *)&v17 & 0x20000000) != 0)
  {
LABEL_67:
    v22 = 2654435761 * self->_isMteUploadEnabled;
    if ((*(_DWORD *)&v17 & 0x40000000) != 0)
      goto LABEL_68;
LABEL_75:
    v23 = 0;
    if ((*(_DWORD *)&v17 & 0x80000000) != 0)
      goto LABEL_69;
LABEL_76:
    v24 = 0;
    return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
  }
LABEL_74:
  v22 = 0;
  if ((*(_DWORD *)&v17 & 0x40000000) == 0)
    goto LABEL_75;
LABEL_68:
  v23 = 2654435761 * self->_isServerUserDataSyncEnabled;
  if ((*(_DWORD *)&v17 & 0x80000000) == 0)
    goto LABEL_76;
LABEL_69:
  v24 = 2654435761 * self->_locationAccessPermission;
  return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
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
  $5F8FA149478B3F06D8A5175B937FFFE0 has;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  $5F8FA149478B3F06D8A5175B937FFFE0 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  const __CFString *v32;
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
  unsigned int v48;
  const __CFString *v49;
  void *v50;
  $5F8FA149478B3F06D8A5175B937FFFE0 v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  const __CFString *v58;
  unsigned int v59;
  const __CFString *v60;
  void *v61;
  $5F8FA149478B3F06D8A5175B937FFFE0 v62;
  void *v63;
  void *v64;
  unsigned int v65;
  const __CFString *v66;
  id v67;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_adaptiveVolumeUserPreferences)
  {
    -[SISchemaEnabledStatus adaptiveVolumeUserPreferences](self, "adaptiveVolumeUserPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("adaptiveVolumeUserPreferences"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("adaptiveVolumeUserPreferences"));

    }
  }
  if (self->_announceEnabledStatus)
  {
    -[SISchemaEnabledStatus announceEnabledStatus](self, "announceEnabledStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("announceEnabledStatus"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("announceEnabledStatus"));

    }
  }
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus assistantEnabled](self, "assistantEnabled"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("assistantEnabled"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&has & 0x200) == 0)
        goto LABEL_14;
      goto LABEL_55;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus assistantOnLockscreen](self, "assistantOnLockscreen"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("assistantOnLockscreen"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_55:
  v26 = -[SISchemaEnabledStatus dataSharingOptInStatus](self, "dataSharingOptInStatus") - 1;
  if (v26 > 2)
    v27 = CFSTR("UNKNOWN");
  else
    v27 = off_1E5635770[v26];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("dataSharingOptInStatus"));
  if ((*(_DWORD *)&self->_has & 2) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus dictationEnabled](self, "dictationEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("dictationEnabled"));

  }
LABEL_16:
  if (-[NSArray count](self->_gradingOptInStateChanges, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v13 = self->_gradingOptInStateChanges;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v70 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v12, "addObject:", v18);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v19);

          }
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("gradingOptInStateChanges"));
  }
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus hardwareButtonEnabled](self, "hardwareButtonEnabled"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("hardwareButtonEnabled"));

    v20 = self->_has;
    if ((*(_BYTE *)&v20 & 0x80) == 0)
    {
LABEL_30:
      if ((*(_BYTE *)&v20 & 8) == 0)
        goto LABEL_31;
      goto LABEL_59;
    }
  }
  else if ((*(_BYTE *)&v20 & 0x80) == 0)
  {
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus hasHomekitHome](self, "hasHomekitHome"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("hasHomekitHome"));

  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 8) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v20 & 0x40000) == 0)
      goto LABEL_32;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus heySiriEnabled](self, "heySiriEnabled"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("heySiriEnabled"));

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x40000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v20 & 0x2000) == 0)
      goto LABEL_33;
    goto LABEL_67;
  }
LABEL_60:
  v31 = -[SISchemaEnabledStatus hsHangupEnablementState](self, "hsHangupEnablementState") - 1;
  if (v31 > 2)
    v32 = CFSTR("HSHANGUPENABLEMENTSTATE_UNKNOWN");
  else
    v32 = off_1E5635788[v31];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("hsHangupEnablementState"));
  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x2000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v20 & 0x8000000) == 0)
      goto LABEL_34;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isAdaptiveVolumeEnabled](self, "isAdaptiveVolumeEnabled"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("isAdaptiveVolumeEnabled"));

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x8000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v20 & 0x100000) == 0)
      goto LABEL_35;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isAlwaysListenForHeySiriEnabled](self, "isAlwaysListenForHeySiriEnabled"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("isAlwaysListenForHeySiriEnabled"));

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x100000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v20 & 0x200000) == 0)
      goto LABEL_36;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isAlwaysShowSiriCaptionsEnabled](self, "isAlwaysShowSiriCaptionsEnabled"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("isAlwaysShowSiriCaptionsEnabled"));

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x200000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v20 & 0x8000) == 0)
      goto LABEL_37;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isAlwaysShowSpeechEnabled](self, "isAlwaysShowSpeechEnabled"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("isAlwaysShowSpeechEnabled"));

  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x8000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v20 & 0x10000) == 0)
      goto LABEL_38;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isAutoPunctuationEnabled](self, "isAutoPunctuationEnabled"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("isAutoPunctuationEnabled"));

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x10000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v20 & 0x20000000) == 0)
      goto LABEL_39;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isHSHangupEnabled](self, "isHSHangupEnabled"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("isHSHangupEnabled"));

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x20000000) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v20 & 0x800) == 0)
      goto LABEL_40;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isMteUploadEnabled](self, "isMteUploadEnabled"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("isMteUploadEnabled"));

  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v20 & 0x4000) == 0)
      goto LABEL_41;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isPreciseLocationEnabled](self, "isPreciseLocationEnabled"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("isPreciseLocationEnabled"));

  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x4000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v20 & 0x40000000) == 0)
      goto LABEL_42;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isRemoteDarwinHeySiriEnabled](self, "isRemoteDarwinHeySiriEnabled"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("isRemoteDarwinHeySiriEnabled"));

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x40000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v20 & 0x400000) == 0)
      goto LABEL_43;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isServerUserDataSyncEnabled](self, "isServerUserDataSyncEnabled"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("isServerUserDataSyncEnabled"));

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x400000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v20 & 0x2000000) == 0)
      goto LABEL_44;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isShowAppsBehindSiriEnabled](self, "isShowAppsBehindSiriEnabled"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("isShowAppsBehindSiriEnabled"));

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x2000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v20 & 0x4000000) == 0)
      goto LABEL_45;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isShowAppsBehindSiriEnabledOnCarPlay](self, "isShowAppsBehindSiriEnabledOnCarPlay"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("isShowAppsBehindSiriEnabledOnCarPlay"));

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x4000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v20 & 0x20000) == 0)
      goto LABEL_46;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isSiriCapableDigitalCarKeyAvailable](self, "isSiriCapableDigitalCarKeyAvailable"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("isSiriCapableDigitalCarKeyAvailable"));

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x20000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v20 & 0x1000000) == 0)
      goto LABEL_47;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isSiriInCallEnabled](self, "isSiriInCallEnabled"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("isSiriInCallEnabled"));

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x1000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v20 & 0x80000000) == 0)
      goto LABEL_48;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus isVoiceOverEnabled](self, "isVoiceOverEnabled"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("isVoiceOverEnabled"));

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x80000000) == 0)
  {
LABEL_48:
    if ((*(_BYTE *)&v20 & 0x20) == 0)
      goto LABEL_50;
    goto LABEL_49;
  }
LABEL_82:
  v48 = -[SISchemaEnabledStatus locationAccessPermission](self, "locationAccessPermission") - 1;
  if (v48 > 5)
    v49 = CFSTR("LOCATIONACCESSPERMISSION_UNKNOWN");
  else
    v49 = off_1E56357A0[v48];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("locationAccessPermission"));
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_49:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus raiseToSpeakEnabled](self, "raiseToSpeakEnabled"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("raiseToSpeakEnabled"));

  }
LABEL_50:
  if (self->_sendWithoutConfirmation)
  {
    -[SISchemaEnabledStatus sendWithoutConfirmation](self, "sendWithoutConfirmation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("sendWithoutConfirmation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("sendWithoutConfirmation"));

    }
  }
  v51 = self->_has;
  if ((*(_WORD *)&v51 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaEnabledStatus shortcutsAvailable](self, "shortcutsAvailable"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("shortcutsAvailable"));

    v51 = self->_has;
    if ((*(_DWORD *)&v51 & 0x80000) == 0)
    {
LABEL_88:
      if ((*(_DWORD *)&v51 & 0x10000000) == 0)
        goto LABEL_89;
      goto LABEL_99;
    }
  }
  else if ((*(_DWORD *)&v51 & 0x80000) == 0)
  {
    goto LABEL_88;
  }
  v57 = -[SISchemaEnabledStatus siriInCallEnablementState](self, "siriInCallEnablementState") - 1;
  if (v57 > 2)
    v58 = CFSTR("SIRIINCALLENABLEMENTSTATE_UNKNOWN");
  else
    v58 = off_1E56357D0[v57];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("siriInCallEnablementState"));
  v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x10000000) == 0)
  {
LABEL_89:
    if ((*(_DWORD *)&v51 & 0x800000) == 0)
      goto LABEL_91;
    goto LABEL_90;
  }
LABEL_99:
  v59 = -[SISchemaEnabledStatus siriPauseTimeState](self, "siriPauseTimeState") - 1;
  if (v59 > 2)
    v60 = CFSTR("SIRIPAUSETIMESTATE_UNKNOWN");
  else
    v60 = off_1E56357E8[v59];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("siriPauseTimeState"));
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_90:
    v52 = (void *)MEMORY[0x1E0CB37E8];
    -[SISchemaEnabledStatus siriSpeechRate](self, "siriSpeechRate");
    objc_msgSend(v52, "numberWithDouble:");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("siriSpeechRate"));

  }
LABEL_91:
  if (self->_siriVoiceTriggerSettings)
  {
    -[SISchemaEnabledStatus siriVoiceTriggerSettings](self, "siriVoiceTriggerSettings");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "dictionaryRepresentation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("siriVoiceTriggerSettings"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("siriVoiceTriggerSettings"));

    }
  }
  v62 = self->_has;
  if ((*(_BYTE *)&v62 & 0x40) == 0)
  {
    if ((*(_WORD *)&v62 & 0x400) == 0)
      goto LABEL_108;
LABEL_111:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus typeToSiriEnabled](self, "typeToSiriEnabled"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("typeToSiriEnabled"));

    if ((*(_DWORD *)&self->_has & 0x1000) == 0)
      goto LABEL_116;
    goto LABEL_112;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaEnabledStatus spokenNotificationsEnabled](self, "spokenNotificationsEnabled"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("spokenNotificationsEnabled"));

  v62 = self->_has;
  if ((*(_WORD *)&v62 & 0x400) != 0)
    goto LABEL_111;
LABEL_108:
  if ((*(_WORD *)&v62 & 0x1000) == 0)
    goto LABEL_116;
LABEL_112:
  v65 = -[SISchemaEnabledStatus voiceFeedback](self, "voiceFeedback") - 1;
  if (v65 > 5)
    v66 = CFSTR("VOICEFEEDBACK_UNKNOWN_VOICE_FEEDBACK");
  else
    v66 = off_1E5635800[v65];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("voiceFeedback"));
LABEL_116:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v67 = v3;

  return v67;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaEnabledStatus dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaEnabledStatus)initWithJSON:(id)a3
{
  void *v4;
  SISchemaEnabledStatus *v5;
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
    self = -[SISchemaEnabledStatus initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaEnabledStatus)initWithDictionary:(id)a3
{
  id v4;
  SISchemaEnabledStatus *v5;
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
  uint64_t v19;
  SISchemaAnnounceEnabledStatus *v20;
  void *v21;
  uint64_t v22;
  SISchemaAdaptiveVolumeUserPreferences *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  SISchemaGradingOptInStateChange *v32;
  void *v33;
  uint64_t v34;
  SISchemaSendWithoutConfirmation *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  SISchemaSiriVoiceTriggerSettings *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  SISchemaEnabledStatus *v55;
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
  void *v71;
  void *v72;
  void *v73;
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
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  objc_super v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)SISchemaEnabledStatus;
  v5 = -[SISchemaEnabledStatus init](&v91, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setAssistantEnabled:](v5, "setAssistantEnabled:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictationEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setDictationEnabled:](v5, "setDictationEnabled:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hardwareButtonEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setHardwareButtonEnabled:](v5, "setHardwareButtonEnabled:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("heySiriEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setHeySiriEnabled:](v5, "setHeySiriEnabled:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantOnLockscreen"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v86 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setAssistantOnLockscreen:](v5, "setAssistantOnLockscreen:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("raiseToSpeakEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v85 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setRaiseToSpeakEnabled:](v5, "setRaiseToSpeakEnabled:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spokenNotificationsEnabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v84 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setSpokenNotificationsEnabled:](v5, "setSpokenNotificationsEnabled:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasHomekitHome"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v83 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setHasHomekitHome:](v5, "setHasHomekitHome:", objc_msgSend(v13, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shortcutsAvailable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v82 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setShortcutsAvailable:](v5, "setShortcutsAvailable:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataSharingOptInStatus"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setDataSharingOptInStatus:](v5, "setDataSharingOptInStatus:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("typeToSiriEnabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v80 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setTypeToSiriEnabled:](v5, "setTypeToSiriEnabled:", objc_msgSend(v16, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPreciseLocationEnabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v79 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsPreciseLocationEnabled:](v5, "setIsPreciseLocationEnabled:", objc_msgSend(v17, "BOOLValue"));
    v63 = v9;
    v64 = v8;
    v65 = v7;
    v66 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceFeedback"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setVoiceFeedback:](v5, "setVoiceFeedback:", objc_msgSend(v18, "intValue"));
    v62 = v18;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceEnabledStatus"));
    v19 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v78 = (void *)v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[SISchemaAnnounceEnabledStatus initWithDictionary:]([SISchemaAnnounceEnabledStatus alloc], "initWithDictionary:", v19);
      -[SISchemaEnabledStatus setAnnounceEnabledStatus:](v5, "setAnnounceEnabledStatus:", v20);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAdaptiveVolumeEnabled"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v77 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsAdaptiveVolumeEnabled:](v5, "setIsAdaptiveVolumeEnabled:", objc_msgSend(v21, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adaptiveVolumeUserPreferences"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v76 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[SISchemaAdaptiveVolumeUserPreferences initWithDictionary:]([SISchemaAdaptiveVolumeUserPreferences alloc], "initWithDictionary:", v22);
      -[SISchemaEnabledStatus setAdaptiveVolumeUserPreferences:](v5, "setAdaptiveVolumeUserPreferences:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRemoteDarwinHeySiriEnabled"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v75 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsRemoteDarwinHeySiriEnabled:](v5, "setIsRemoteDarwinHeySiriEnabled:", objc_msgSend(v24, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gradingOptInStateChanges"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v74 = v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v26 = v25;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v88;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v88 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v32 = -[SISchemaGradingOptInStateChange initWithDictionary:]([SISchemaGradingOptInStateChange alloc], "initWithDictionary:", v31);
              -[SISchemaEnabledStatus addGradingOptInStateChanges:](v5, "addGradingOptInStateChanges:", v32);

            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
        }
        while (v28);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAutoPunctuationEnabled"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsAutoPunctuationEnabled:](v5, "setIsAutoPunctuationEnabled:", objc_msgSend(v33, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sendWithoutConfirmation"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[SISchemaSendWithoutConfirmation initWithDictionary:]([SISchemaSendWithoutConfirmation alloc], "initWithDictionary:", v34);
      -[SISchemaEnabledStatus setSendWithoutConfirmation:](v5, "setSendWithoutConfirmation:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHSHangupEnabled"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsHSHangupEnabled:](v5, "setIsHSHangupEnabled:", objc_msgSend(v36, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSiriInCallEnabled"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsSiriInCallEnabled:](v5, "setIsSiriInCallEnabled:", objc_msgSend(v37, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hsHangupEnablementState"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setHsHangupEnablementState:](v5, "setHsHangupEnablementState:", objc_msgSend(v38, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriInCallEnablementState"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v73 = v39;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setSiriInCallEnablementState:](v5, "setSiriInCallEnablementState:", objc_msgSend(v39, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAlwaysShowSiriCaptionsEnabled"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v72 = v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsAlwaysShowSiriCaptionsEnabled:](v5, "setIsAlwaysShowSiriCaptionsEnabled:", objc_msgSend(v40, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAlwaysShowSpeechEnabled"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v71 = v41;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsAlwaysShowSpeechEnabled:](v5, "setIsAlwaysShowSpeechEnabled:", objc_msgSend(v41, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isShowAppsBehindSiriEnabled"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v70 = v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsShowAppsBehindSiriEnabled:](v5, "setIsShowAppsBehindSiriEnabled:", objc_msgSend(v42, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriSpeechRate"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v69 = v43;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v43, "doubleValue");
      -[SISchemaEnabledStatus setSiriSpeechRate:](v5, "setSiriSpeechRate:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isVoiceOverEnabled"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v68 = v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsVoiceOverEnabled:](v5, "setIsVoiceOverEnabled:", objc_msgSend(v44, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriVoiceTriggerSettings"));
    v45 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v67 = (void *)v45;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = -[SISchemaSiriVoiceTriggerSettings initWithDictionary:]([SISchemaSiriVoiceTriggerSettings alloc], "initWithDictionary:", v45);
      -[SISchemaEnabledStatus setSiriVoiceTriggerSettings:](v5, "setSiriVoiceTriggerSettings:", v46);

    }
    v58 = v38;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isShowAppsBehindSiriEnabledOnCarPlay"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsShowAppsBehindSiriEnabledOnCarPlay:](v5, "setIsShowAppsBehindSiriEnabledOnCarPlay:", objc_msgSend(v47, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSiriCapableDigitalCarKeyAvailable"), v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsSiriCapableDigitalCarKeyAvailable:](v5, "setIsSiriCapableDigitalCarKeyAvailable:", objc_msgSend(v48, "BOOLValue"));
    v61 = v33;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAlwaysListenForHeySiriEnabled"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsAlwaysListenForHeySiriEnabled:](v5, "setIsAlwaysListenForHeySiriEnabled:", objc_msgSend(v49, "BOOLValue"));
    v60 = (void *)v34;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriPauseTimeState"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setSiriPauseTimeState:](v5, "setSiriPauseTimeState:", objc_msgSend(v50, "intValue"));
    v59 = v37;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMteUploadEnabled"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsMteUploadEnabled:](v5, "setIsMteUploadEnabled:", objc_msgSend(v51, "BOOLValue"));
    v52 = v36;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isServerUserDataSyncEnabled"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setIsServerUserDataSyncEnabled:](v5, "setIsServerUserDataSyncEnabled:", objc_msgSend(v53, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationAccessPermission"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaEnabledStatus setLocationAccessPermission:](v5, "setLocationAccessPermission:", objc_msgSend(v54, "intValue"));
    v55 = v5;

  }
  return v5;
}

- (BOOL)assistantEnabled
{
  return self->_assistantEnabled;
}

- (BOOL)dictationEnabled
{
  return self->_dictationEnabled;
}

- (BOOL)hardwareButtonEnabled
{
  return self->_hardwareButtonEnabled;
}

- (BOOL)heySiriEnabled
{
  return self->_heySiriEnabled;
}

- (BOOL)assistantOnLockscreen
{
  return self->_assistantOnLockscreen;
}

- (BOOL)raiseToSpeakEnabled
{
  return self->_raiseToSpeakEnabled;
}

- (BOOL)spokenNotificationsEnabled
{
  return self->_spokenNotificationsEnabled;
}

- (BOOL)hasHomekitHome
{
  return self->_hasHomekitHome;
}

- (int)shortcutsAvailable
{
  return self->_shortcutsAvailable;
}

- (int)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (BOOL)typeToSiriEnabled
{
  return self->_typeToSiriEnabled;
}

- (BOOL)isPreciseLocationEnabled
{
  return self->_isPreciseLocationEnabled;
}

- (int)voiceFeedback
{
  return self->_voiceFeedback;
}

- (SISchemaAnnounceEnabledStatus)announceEnabledStatus
{
  return self->_announceEnabledStatus;
}

- (void)setAnnounceEnabledStatus:(id)a3
{
  objc_storeStrong((id *)&self->_announceEnabledStatus, a3);
}

- (BOOL)isAdaptiveVolumeEnabled
{
  return self->_isAdaptiveVolumeEnabled;
}

- (SISchemaAdaptiveVolumeUserPreferences)adaptiveVolumeUserPreferences
{
  return self->_adaptiveVolumeUserPreferences;
}

- (void)setAdaptiveVolumeUserPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_adaptiveVolumeUserPreferences, a3);
}

- (BOOL)isRemoteDarwinHeySiriEnabled
{
  return self->_isRemoteDarwinHeySiriEnabled;
}

- (NSArray)gradingOptInStateChanges
{
  return self->_gradingOptInStateChanges;
}

- (void)setGradingOptInStateChanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isAutoPunctuationEnabled
{
  return self->_isAutoPunctuationEnabled;
}

- (SISchemaSendWithoutConfirmation)sendWithoutConfirmation
{
  return self->_sendWithoutConfirmation;
}

- (void)setSendWithoutConfirmation:(id)a3
{
  objc_storeStrong((id *)&self->_sendWithoutConfirmation, a3);
}

- (BOOL)isHSHangupEnabled
{
  return self->_isHSHangupEnabled;
}

- (BOOL)isSiriInCallEnabled
{
  return self->_isSiriInCallEnabled;
}

- (int)hsHangupEnablementState
{
  return self->_hsHangupEnablementState;
}

- (int)siriInCallEnablementState
{
  return self->_siriInCallEnablementState;
}

- (BOOL)isAlwaysShowSiriCaptionsEnabled
{
  return self->_isAlwaysShowSiriCaptionsEnabled;
}

- (BOOL)isAlwaysShowSpeechEnabled
{
  return self->_isAlwaysShowSpeechEnabled;
}

- (BOOL)isShowAppsBehindSiriEnabled
{
  return self->_isShowAppsBehindSiriEnabled;
}

- (double)siriSpeechRate
{
  return self->_siriSpeechRate;
}

- (BOOL)isVoiceOverEnabled
{
  return self->_isVoiceOverEnabled;
}

- (SISchemaSiriVoiceTriggerSettings)siriVoiceTriggerSettings
{
  return self->_siriVoiceTriggerSettings;
}

- (void)setSiriVoiceTriggerSettings:(id)a3
{
  objc_storeStrong((id *)&self->_siriVoiceTriggerSettings, a3);
}

- (BOOL)isShowAppsBehindSiriEnabledOnCarPlay
{
  return self->_isShowAppsBehindSiriEnabledOnCarPlay;
}

- (BOOL)isSiriCapableDigitalCarKeyAvailable
{
  return self->_isSiriCapableDigitalCarKeyAvailable;
}

- (BOOL)isAlwaysListenForHeySiriEnabled
{
  return self->_isAlwaysListenForHeySiriEnabled;
}

- (int)siriPauseTimeState
{
  return self->_siriPauseTimeState;
}

- (BOOL)isMteUploadEnabled
{
  return self->_isMteUploadEnabled;
}

- (BOOL)isServerUserDataSyncEnabled
{
  return self->_isServerUserDataSyncEnabled;
}

- (int)locationAccessPermission
{
  return self->_locationAccessPermission;
}

- (void)setHasAnnounceEnabledStatus:(BOOL)a3
{
  self->_hasAnnounceEnabledStatus = a3;
}

- (void)setHasAdaptiveVolumeUserPreferences:(BOOL)a3
{
  self->_hasAdaptiveVolumeUserPreferences = a3;
}

- (void)setHasSendWithoutConfirmation:(BOOL)a3
{
  self->_hasSendWithoutConfirmation = a3;
}

- (void)setHasSiriVoiceTriggerSettings:(BOOL)a3
{
  self->_hasSiriVoiceTriggerSettings = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriVoiceTriggerSettings, 0);
  objc_storeStrong((id *)&self->_sendWithoutConfirmation, 0);
  objc_storeStrong((id *)&self->_gradingOptInStateChanges, 0);
  objc_storeStrong((id *)&self->_adaptiveVolumeUserPreferences, 0);
  objc_storeStrong((id *)&self->_announceEnabledStatus, 0);
}

@end
