@implementation IASchemaIAVoiceTriggerEventSummary

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IASchemaIAVoiceTriggerEventSummary;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IASchemaIAVoiceTriggerEventSummary nextTurnId](self, "nextTurnId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[IASchemaIAVoiceTriggerEventSummary deleteNextTurnId](self, "deleteNextTurnId");
  return v5;
}

- (void)setFirstPassDetectionTimestampInSec:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_firstPassDetectionTimestampInSec = a3;
}

- (BOOL)hasFirstPassDetectionTimestampInSec
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasFirstPassDetectionTimestampInSec:(BOOL)a3
{
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (void)deleteFirstPassDetectionTimestampInSec
{
  -[IASchemaIAVoiceTriggerEventSummary setFirstPassDetectionTimestampInSec:](self, "setFirstPassDetectionTimestampInSec:", 0);
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setFirstPassPeakScoreHS:(float)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_firstPassPeakScoreHS = a3;
}

- (BOOL)hasFirstPassPeakScoreHS
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasFirstPassPeakScoreHS:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (void)deleteFirstPassPeakScoreHS
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setFirstPassPeakScoreHS:](self, "setFirstPassPeakScoreHS:", v2);
  *(_DWORD *)&self->_has &= ~2u;
}

- (void)setFirstPassPeakScoreJS:(float)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_firstPassPeakScoreJS = a3;
}

- (BOOL)hasFirstPassPeakScoreJS
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasFirstPassPeakScoreJS:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (void)deleteFirstPassPeakScoreJS
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setFirstPassPeakScoreJS:](self, "setFirstPassPeakScoreJS:", v2);
  *(_DWORD *)&self->_has &= ~4u;
}

- (void)setInvocationTypeId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_invocationTypeId = a3;
}

- (BOOL)hasInvocationTypeId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasInvocationTypeId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (void)deleteInvocationTypeId
{
  -[IASchemaIAVoiceTriggerEventSummary setInvocationTypeId:](self, "setInvocationTypeId:", 0);
  *(_DWORD *)&self->_has &= ~8u;
}

- (void)setTriggerScoreHS:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_triggerScoreHS = a3;
}

- (BOOL)hasTriggerScoreHS
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasTriggerScoreHS:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (void)deleteTriggerScoreHS
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setTriggerScoreHS:](self, "setTriggerScoreHS:", v2);
  *(_DWORD *)&self->_has &= ~0x10u;
}

- (void)setTriggerScoreJS:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_triggerScoreJS = a3;
}

- (BOOL)hasTriggerScoreJS
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasTriggerScoreJS:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (void)deleteTriggerScoreJS
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setTriggerScoreJS:](self, "setTriggerScoreJS:", v2);
  *(_DWORD *)&self->_has &= ~0x20u;
}

- (void)setMitigationScore:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_mitigationScore = a3;
}

- (BOOL)hasMitigationScore
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasMitigationScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (void)deleteMitigationScore
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setMitigationScore:](self, "setMitigationScore:", v2);
  *(_DWORD *)&self->_has &= ~0x40u;
}

- (void)setTdSpeakerRecognizerCombinedScore:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_tdSpeakerRecognizerCombinedScore = a3;
}

- (BOOL)hasTdSpeakerRecognizerCombinedScore
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasTdSpeakerRecognizerCombinedScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (void)deleteTdSpeakerRecognizerCombinedScore
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setTdSpeakerRecognizerCombinedScore:](self, "setTdSpeakerRecognizerCombinedScore:", v2);
  *(_DWORD *)&self->_has &= ~0x80u;
}

- (void)setTriggerScoreHSThreshold:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_triggerScoreHSThreshold = a3;
}

- (BOOL)hasTriggerScoreHSThreshold
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHasTriggerScoreHSThreshold:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (void)deleteTriggerScoreHSThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setTriggerScoreHSThreshold:](self, "setTriggerScoreHSThreshold:", v2);
  *(_DWORD *)&self->_has &= ~0x100u;
}

- (void)setTriggerScoreJSThreshold:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_triggerScoreJSThreshold = a3;
}

- (BOOL)hasTriggerScoreJSThreshold
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasTriggerScoreJSThreshold:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (void)deleteTriggerScoreJSThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setTriggerScoreJSThreshold:](self, "setTriggerScoreJSThreshold:", v2);
  *(_DWORD *)&self->_has &= ~0x200u;
}

- (void)setMitigationScoreThreshold:(float)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_mitigationScoreThreshold = a3;
}

- (BOOL)hasMitigationScoreThreshold
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasMitigationScoreThreshold:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (void)deleteMitigationScoreThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setMitigationScoreThreshold:](self, "setMitigationScoreThreshold:", v2);
  *(_DWORD *)&self->_has &= ~0x400u;
}

- (void)setTdSpeakerRecognizerCombinedThreshold:(float)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_tdSpeakerRecognizerCombinedThreshold = a3;
}

- (BOOL)hasTdSpeakerRecognizerCombinedThreshold
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasTdSpeakerRecognizerCombinedThreshold:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (void)deleteTdSpeakerRecognizerCombinedThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setTdSpeakerRecognizerCombinedThreshold:](self, "setTdSpeakerRecognizerCombinedThreshold:", v2);
  *(_DWORD *)&self->_has &= ~0x800u;
}

- (BOOL)hasVoiceTriggerConfigVersion
{
  return self->_voiceTriggerConfigVersion != 0;
}

- (void)deleteVoiceTriggerConfigVersion
{
  -[IASchemaIAVoiceTriggerEventSummary setVoiceTriggerConfigVersion:](self, "setVoiceTriggerConfigVersion:", 0);
}

- (void)setUserActionTimeThreshold:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_userActionTimeThreshold = a3;
}

- (BOOL)hasUserActionTimeThreshold
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasUserActionTimeThreshold:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (void)deleteUserActionTimeThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setUserActionTimeThreshold:](self, "setUserActionTimeThreshold:", v2);
  *(_DWORD *)&self->_has &= ~0x1000u;
}

- (void)setHasNextTurn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_hasNextTurn = a3;
}

- (BOOL)hasHasNextTurn
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasHasNextTurn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (void)deleteHasNextTurn
{
  -[IASchemaIAVoiceTriggerEventSummary setHasNextTurn:](self, "setHasNextTurn:", 0);
  *(_DWORD *)&self->_has &= ~0x2000u;
}

- (void)setTimeDeltaToNextTurnInSec:(float)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_timeDeltaToNextTurnInSec = a3;
}

- (BOOL)hasTimeDeltaToNextTurnInSec
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasTimeDeltaToNextTurnInSec:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (void)deleteTimeDeltaToNextTurnInSec
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToNextTurnInSec:](self, "setTimeDeltaToNextTurnInSec:", v2);
  *(_DWORD *)&self->_has &= ~0x4000u;
}

- (BOOL)hasNextTurnId
{
  return self->_nextTurnId != 0;
}

- (void)deleteNextTurnId
{
  -[IASchemaIAVoiceTriggerEventSummary setNextTurnId:](self, "setNextTurnId:", 0);
}

- (void)setNextTurnInvocationSource:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_nextTurnInvocationSource = a3;
}

- (BOOL)hasNextTurnInvocationSource
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasNextTurnInvocationSource:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (void)deleteNextTurnInvocationSource
{
  -[IASchemaIAVoiceTriggerEventSummary setNextTurnInvocationSource:](self, "setNextTurnInvocationSource:", 0);
  *(_DWORD *)&self->_has &= ~0x8000u;
}

- (void)setIsNextTurnValid:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isNextTurnValid = a3;
}

- (BOOL)hasIsNextTurnValid
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasIsNextTurnValid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (void)deleteIsNextTurnValid
{
  -[IASchemaIAVoiceTriggerEventSummary setIsNextTurnValid:](self, "setIsNextTurnValid:", 0);
  *(_DWORD *)&self->_has &= ~0x10000u;
}

- (void)setRepetitionSimilarityScore:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_repetitionSimilarityScore = a3;
}

- (BOOL)hasRepetitionSimilarityScore
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasRepetitionSimilarityScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (void)deleteRepetitionSimilarityScore
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setRepetitionSimilarityScore:](self, "setRepetitionSimilarityScore:", v2);
  *(_DWORD *)&self->_has &= ~0x20000u;
}

- (void)setHasNextRejection:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_hasNextRejection = a3;
}

- (BOOL)hasHasNextRejection
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasHasNextRejection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (void)deleteHasNextRejection
{
  -[IASchemaIAVoiceTriggerEventSummary setHasNextRejection:](self, "setHasNextRejection:", 0);
  *(_DWORD *)&self->_has &= ~0x40000u;
}

- (void)setTimeDeltaToNextRejectionInSec:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_timeDeltaToNextRejectionInSec = a3;
}

- (BOOL)hasTimeDeltaToNextRejectionInSec
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasTimeDeltaToNextRejectionInSec:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (void)deleteTimeDeltaToNextRejectionInSec
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToNextRejectionInSec:](self, "setTimeDeltaToNextRejectionInSec:", v2);
  *(_DWORD *)&self->_has &= ~0x80000u;
}

- (void)setHasAppLaunchEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_hasAppLaunchEvent = a3;
}

- (BOOL)hasHasAppLaunchEvent
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasHasAppLaunchEvent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (void)deleteHasAppLaunchEvent
{
  -[IASchemaIAVoiceTriggerEventSummary setHasAppLaunchEvent:](self, "setHasAppLaunchEvent:", 0);
  *(_DWORD *)&self->_has &= ~0x100000u;
}

- (void)setTimeDeltaToAppLaunchInSec:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_timeDeltaToAppLaunchInSec = a3;
}

- (BOOL)hasTimeDeltaToAppLaunchInSec
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasTimeDeltaToAppLaunchInSec:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (void)deleteTimeDeltaToAppLaunchInSec
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToAppLaunchInSec:](self, "setTimeDeltaToAppLaunchInSec:", v2);
  *(_DWORD *)&self->_has &= ~0x200000u;
}

- (void)setHasAppIntentEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_hasAppIntentEvent = a3;
}

- (BOOL)hasHasAppIntentEvent
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasHasAppIntentEvent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (void)deleteHasAppIntentEvent
{
  -[IASchemaIAVoiceTriggerEventSummary setHasAppIntentEvent:](self, "setHasAppIntentEvent:", 0);
  *(_DWORD *)&self->_has &= ~0x400000u;
}

- (void)setTimeDeltaToAppIntentEventInSec:(float)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_timeDeltaToAppIntentEventInSec = a3;
}

- (BOOL)hasTimeDeltaToAppIntentEventInSec
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasTimeDeltaToAppIntentEventInSec:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (void)deleteTimeDeltaToAppIntentEventInSec
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToAppIntentEventInSec:](self, "setTimeDeltaToAppIntentEventInSec:", v2);
  *(_DWORD *)&self->_has &= ~0x800000u;
}

- (void)setHasTextInputEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_hasTextInputEvent = a3;
}

- (BOOL)hasHasTextInputEvent
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHasHasTextInputEvent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (void)deleteHasTextInputEvent
{
  -[IASchemaIAVoiceTriggerEventSummary setHasTextInputEvent:](self, "setHasTextInputEvent:", 0);
  *(_DWORD *)&self->_has &= ~0x1000000u;
}

- (void)setTimeDeltaToTextInputInSec:(float)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_timeDeltaToTextInputInSec = a3;
}

- (BOOL)hasTimeDeltaToTextInputInSec
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasTimeDeltaToTextInputInSec:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (void)deleteTimeDeltaToTextInputInSec
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToTextInputInSec:](self, "setTimeDeltaToTextInputInSec:", v2);
  *(_DWORD *)&self->_has &= ~0x2000000u;
}

- (void)setHasDeviceUnlockEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_hasDeviceUnlockEvent = a3;
}

- (BOOL)hasHasDeviceUnlockEvent
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasHasDeviceUnlockEvent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (void)deleteHasDeviceUnlockEvent
{
  -[IASchemaIAVoiceTriggerEventSummary setHasDeviceUnlockEvent:](self, "setHasDeviceUnlockEvent:", 0);
  *(_DWORD *)&self->_has &= ~0x4000000u;
}

- (void)setTimeDeltaToDeviceUnlockInSec:(float)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_timeDeltaToDeviceUnlockInSec = a3;
}

- (BOOL)hasTimeDeltaToDeviceUnlockInSec
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasTimeDeltaToDeviceUnlockInSec:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($C40809A43C7E90BBA9878EFFED84D921)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (void)deleteTimeDeltaToDeviceUnlockInSec
{
  double v2;

  LODWORD(v2) = 0;
  -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToDeviceUnlockInSec:](self, "setTimeDeltaToDeviceUnlockInSec:", v2);
  *(_DWORD *)&self->_has &= ~0x8000000u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return IASchemaIAVoiceTriggerEventSummaryReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  $C40809A43C7E90BBA9878EFFED84D921 has;
  void *v5;
  $C40809A43C7E90BBA9878EFFED84D921 v6;
  void *v7;
  void *v8;
  $C40809A43C7E90BBA9878EFFED84D921 v9;
  id v10;

  v10 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_5;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_47:
  PBDataWriterWriteFloatField();
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
LABEL_13:
    PBDataWriterWriteFloatField();
LABEL_14:
  -[IASchemaIAVoiceTriggerEventSummary voiceTriggerConfigVersion](self, "voiceTriggerConfigVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    PBDataWriterWriteFloatField();
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x2000) == 0)
    {
LABEL_18:
      if ((*(_WORD *)&v6 & 0x4000) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
LABEL_19:
    PBDataWriterWriteFloatField();
LABEL_20:
  -[IASchemaIAVoiceTriggerEventSummary nextTurnId](self, "nextTurnId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IASchemaIAVoiceTriggerEventSummary nextTurnId](self, "nextTurnId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x10000) == 0)
    {
LABEL_24:
      if ((*(_DWORD *)&v9 & 0x20000) == 0)
        goto LABEL_25;
      goto LABEL_54;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v9 & 0x40000) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteFloatField();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v9 & 0x80000) == 0)
      goto LABEL_27;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v9 & 0x100000) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteFloatField();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x100000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v9 & 0x200000) == 0)
      goto LABEL_29;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x200000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v9 & 0x400000) == 0)
      goto LABEL_30;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteFloatField();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v9 & 0x800000) == 0)
      goto LABEL_31;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v9 & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteFloatField();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v9 & 0x2000000) == 0)
      goto LABEL_33;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v9 & 0x4000000) == 0)
      goto LABEL_34;
LABEL_63:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_has & 0x8000000) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_62:
  PBDataWriterWriteFloatField();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x4000000) != 0)
    goto LABEL_63;
LABEL_34:
  if ((*(_DWORD *)&v9 & 0x8000000) != 0)
LABEL_35:
    PBDataWriterWriteFloatField();
LABEL_36:

}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  $C40809A43C7E90BBA9878EFFED84D921 has;
  unsigned int v6;
  unint64_t firstPassDetectionTimestampInSec;
  int v8;
  float firstPassPeakScoreHS;
  float v10;
  int v11;
  float firstPassPeakScoreJS;
  float v13;
  int v14;
  unsigned int invocationTypeId;
  int v16;
  float triggerScoreHS;
  float v18;
  int v19;
  float triggerScoreJS;
  float v21;
  int v22;
  float mitigationScore;
  float v24;
  int v25;
  float tdSpeakerRecognizerCombinedScore;
  float v27;
  int v28;
  float triggerScoreHSThreshold;
  float v30;
  int v31;
  float triggerScoreJSThreshold;
  float v33;
  int v34;
  float mitigationScoreThreshold;
  float v36;
  int v37;
  float tdSpeakerRecognizerCombinedThreshold;
  float v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  $C40809A43C7E90BBA9878EFFED84D921 v47;
  int v48;
  unsigned int v49;
  float userActionTimeThreshold;
  float v51;
  int v52;
  int hasNextTurn;
  int v54;
  float timeDeltaToNextTurnInSec;
  float v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  BOOL v62;
  $C40809A43C7E90BBA9878EFFED84D921 v64;
  int v65;
  unsigned int v66;
  unsigned int nextTurnInvocationSource;
  int v68;
  int isNextTurnValid;
  int v70;
  float repetitionSimilarityScore;
  float v72;
  int v73;
  int hasNextRejection;
  int v75;
  float timeDeltaToNextRejectionInSec;
  float v77;
  int v78;
  int hasAppLaunchEvent;
  int v80;
  float timeDeltaToAppLaunchInSec;
  float v82;
  int v83;
  int hasAppIntentEvent;
  int v85;
  float timeDeltaToAppIntentEventInSec;
  float v87;
  int v88;
  int hasTextInputEvent;
  int v90;
  float timeDeltaToTextInputInSec;
  float v92;
  int v93;
  int hasDeviceUnlockEvent;
  int v95;
  float timeDeltaToDeviceUnlockInSec;
  float v97;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_70;
  has = self->_has;
  v6 = v4[37];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_70;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    firstPassDetectionTimestampInSec = self->_firstPassDetectionTimestampInSec;
    if (firstPassDetectionTimestampInSec != objc_msgSend(v4, "firstPassDetectionTimestampInSec"))
      goto LABEL_70;
    has = self->_has;
    v6 = v4[37];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_70;
  if (v8)
  {
    firstPassPeakScoreHS = self->_firstPassPeakScoreHS;
    objc_msgSend(v4, "firstPassPeakScoreHS");
    if (firstPassPeakScoreHS != v10)
      goto LABEL_70;
    has = self->_has;
    v6 = v4[37];
  }
  v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1))
    goto LABEL_70;
  if (v11)
  {
    firstPassPeakScoreJS = self->_firstPassPeakScoreJS;
    objc_msgSend(v4, "firstPassPeakScoreJS");
    if (firstPassPeakScoreJS != v13)
      goto LABEL_70;
    has = self->_has;
    v6 = v4[37];
  }
  v14 = (*(unsigned int *)&has >> 3) & 1;
  if (v14 != ((v6 >> 3) & 1))
    goto LABEL_70;
  if (v14)
  {
    invocationTypeId = self->_invocationTypeId;
    if (invocationTypeId != objc_msgSend(v4, "invocationTypeId"))
      goto LABEL_70;
    has = self->_has;
    v6 = v4[37];
  }
  v16 = (*(unsigned int *)&has >> 4) & 1;
  if (v16 != ((v6 >> 4) & 1))
    goto LABEL_70;
  if (v16)
  {
    triggerScoreHS = self->_triggerScoreHS;
    objc_msgSend(v4, "triggerScoreHS");
    if (triggerScoreHS != v18)
      goto LABEL_70;
    has = self->_has;
    v6 = v4[37];
  }
  v19 = (*(unsigned int *)&has >> 5) & 1;
  if (v19 != ((v6 >> 5) & 1))
    goto LABEL_70;
  if (v19)
  {
    triggerScoreJS = self->_triggerScoreJS;
    objc_msgSend(v4, "triggerScoreJS");
    if (triggerScoreJS != v21)
      goto LABEL_70;
    has = self->_has;
    v6 = v4[37];
  }
  v22 = (*(unsigned int *)&has >> 6) & 1;
  if (v22 != ((v6 >> 6) & 1))
    goto LABEL_70;
  if (v22)
  {
    mitigationScore = self->_mitigationScore;
    objc_msgSend(v4, "mitigationScore");
    if (mitigationScore != v24)
      goto LABEL_70;
    has = self->_has;
    v6 = v4[37];
  }
  v25 = (*(unsigned int *)&has >> 7) & 1;
  if (v25 != ((v6 >> 7) & 1))
    goto LABEL_70;
  if (v25)
  {
    tdSpeakerRecognizerCombinedScore = self->_tdSpeakerRecognizerCombinedScore;
    objc_msgSend(v4, "tdSpeakerRecognizerCombinedScore");
    if (tdSpeakerRecognizerCombinedScore != v27)
      goto LABEL_70;
    has = self->_has;
    v6 = v4[37];
  }
  v28 = (*(unsigned int *)&has >> 8) & 1;
  if (v28 != ((v6 >> 8) & 1))
    goto LABEL_70;
  if (v28)
  {
    triggerScoreHSThreshold = self->_triggerScoreHSThreshold;
    objc_msgSend(v4, "triggerScoreHSThreshold");
    if (triggerScoreHSThreshold != v30)
      goto LABEL_70;
    has = self->_has;
    v6 = v4[37];
  }
  v31 = (*(unsigned int *)&has >> 9) & 1;
  if (v31 != ((v6 >> 9) & 1))
    goto LABEL_70;
  if (v31)
  {
    triggerScoreJSThreshold = self->_triggerScoreJSThreshold;
    objc_msgSend(v4, "triggerScoreJSThreshold");
    if (triggerScoreJSThreshold != v33)
      goto LABEL_70;
    has = self->_has;
    v6 = v4[37];
  }
  v34 = (*(unsigned int *)&has >> 10) & 1;
  if (v34 != ((v6 >> 10) & 1))
    goto LABEL_70;
  if (v34)
  {
    mitigationScoreThreshold = self->_mitigationScoreThreshold;
    objc_msgSend(v4, "mitigationScoreThreshold");
    if (mitigationScoreThreshold != v36)
      goto LABEL_70;
    has = self->_has;
    v6 = v4[37];
  }
  v37 = (*(unsigned int *)&has >> 11) & 1;
  if (v37 != ((v6 >> 11) & 1))
    goto LABEL_70;
  if (v37)
  {
    tdSpeakerRecognizerCombinedThreshold = self->_tdSpeakerRecognizerCombinedThreshold;
    objc_msgSend(v4, "tdSpeakerRecognizerCombinedThreshold");
    if (tdSpeakerRecognizerCombinedThreshold != v39)
      goto LABEL_70;
  }
  -[IASchemaIAVoiceTriggerEventSummary voiceTriggerConfigVersion](self, "voiceTriggerConfigVersion");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceTriggerConfigVersion");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v40 == 0) == (v41 != 0))
    goto LABEL_69;
  -[IASchemaIAVoiceTriggerEventSummary voiceTriggerConfigVersion](self, "voiceTriggerConfigVersion");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[IASchemaIAVoiceTriggerEventSummary voiceTriggerConfigVersion](self, "voiceTriggerConfigVersion");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceTriggerConfigVersion");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_70;
  }
  else
  {

  }
  v47 = self->_has;
  v48 = (*(unsigned int *)&v47 >> 12) & 1;
  v49 = v4[37];
  if (v48 != ((v49 >> 12) & 1))
    goto LABEL_70;
  if (v48)
  {
    userActionTimeThreshold = self->_userActionTimeThreshold;
    objc_msgSend(v4, "userActionTimeThreshold");
    if (userActionTimeThreshold != v51)
      goto LABEL_70;
    v47 = self->_has;
    v49 = v4[37];
  }
  v52 = (*(unsigned int *)&v47 >> 13) & 1;
  if (v52 != ((v49 >> 13) & 1))
    goto LABEL_70;
  if (v52)
  {
    hasNextTurn = self->_hasNextTurn;
    if (hasNextTurn != objc_msgSend(v4, "hasNextTurn"))
      goto LABEL_70;
    v47 = self->_has;
    v49 = v4[37];
  }
  v54 = (*(unsigned int *)&v47 >> 14) & 1;
  if (v54 != ((v49 >> 14) & 1))
    goto LABEL_70;
  if (v54)
  {
    timeDeltaToNextTurnInSec = self->_timeDeltaToNextTurnInSec;
    objc_msgSend(v4, "timeDeltaToNextTurnInSec");
    if (timeDeltaToNextTurnInSec != v56)
      goto LABEL_70;
  }
  -[IASchemaIAVoiceTriggerEventSummary nextTurnId](self, "nextTurnId");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextTurnId");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v40 == 0) == (v41 != 0))
  {
LABEL_69:

    goto LABEL_70;
  }
  -[IASchemaIAVoiceTriggerEventSummary nextTurnId](self, "nextTurnId");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[IASchemaIAVoiceTriggerEventSummary nextTurnId](self, "nextTurnId");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextTurnId");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_70;
  }
  else
  {

  }
  v64 = self->_has;
  v65 = (*(unsigned int *)&v64 >> 15) & 1;
  v66 = v4[37];
  if (v65 == ((v66 >> 15) & 1))
  {
    if (v65)
    {
      nextTurnInvocationSource = self->_nextTurnInvocationSource;
      if (nextTurnInvocationSource != objc_msgSend(v4, "nextTurnInvocationSource"))
        goto LABEL_70;
      v64 = self->_has;
      v66 = v4[37];
    }
    v68 = HIWORD(*(unsigned int *)&v64) & 1;
    if (v68 == (HIWORD(v66) & 1))
    {
      if (v68)
      {
        isNextTurnValid = self->_isNextTurnValid;
        if (isNextTurnValid != objc_msgSend(v4, "isNextTurnValid"))
          goto LABEL_70;
        v64 = self->_has;
        v66 = v4[37];
      }
      v70 = (*(unsigned int *)&v64 >> 17) & 1;
      if (v70 == ((v66 >> 17) & 1))
      {
        if (v70)
        {
          repetitionSimilarityScore = self->_repetitionSimilarityScore;
          objc_msgSend(v4, "repetitionSimilarityScore");
          if (repetitionSimilarityScore != v72)
            goto LABEL_70;
          v64 = self->_has;
          v66 = v4[37];
        }
        v73 = (*(unsigned int *)&v64 >> 18) & 1;
        if (v73 == ((v66 >> 18) & 1))
        {
          if (v73)
          {
            hasNextRejection = self->_hasNextRejection;
            if (hasNextRejection != objc_msgSend(v4, "hasNextRejection"))
              goto LABEL_70;
            v64 = self->_has;
            v66 = v4[37];
          }
          v75 = (*(unsigned int *)&v64 >> 19) & 1;
          if (v75 == ((v66 >> 19) & 1))
          {
            if (v75)
            {
              timeDeltaToNextRejectionInSec = self->_timeDeltaToNextRejectionInSec;
              objc_msgSend(v4, "timeDeltaToNextRejectionInSec");
              if (timeDeltaToNextRejectionInSec != v77)
                goto LABEL_70;
              v64 = self->_has;
              v66 = v4[37];
            }
            v78 = (*(unsigned int *)&v64 >> 20) & 1;
            if (v78 == ((v66 >> 20) & 1))
            {
              if (v78)
              {
                hasAppLaunchEvent = self->_hasAppLaunchEvent;
                if (hasAppLaunchEvent != objc_msgSend(v4, "hasAppLaunchEvent"))
                  goto LABEL_70;
                v64 = self->_has;
                v66 = v4[37];
              }
              v80 = (*(unsigned int *)&v64 >> 21) & 1;
              if (v80 == ((v66 >> 21) & 1))
              {
                if (v80)
                {
                  timeDeltaToAppLaunchInSec = self->_timeDeltaToAppLaunchInSec;
                  objc_msgSend(v4, "timeDeltaToAppLaunchInSec");
                  if (timeDeltaToAppLaunchInSec != v82)
                    goto LABEL_70;
                  v64 = self->_has;
                  v66 = v4[37];
                }
                v83 = (*(unsigned int *)&v64 >> 22) & 1;
                if (v83 == ((v66 >> 22) & 1))
                {
                  if (v83)
                  {
                    hasAppIntentEvent = self->_hasAppIntentEvent;
                    if (hasAppIntentEvent != objc_msgSend(v4, "hasAppIntentEvent"))
                      goto LABEL_70;
                    v64 = self->_has;
                    v66 = v4[37];
                  }
                  v85 = (*(unsigned int *)&v64 >> 23) & 1;
                  if (v85 == ((v66 >> 23) & 1))
                  {
                    if (v85)
                    {
                      timeDeltaToAppIntentEventInSec = self->_timeDeltaToAppIntentEventInSec;
                      objc_msgSend(v4, "timeDeltaToAppIntentEventInSec");
                      if (timeDeltaToAppIntentEventInSec != v87)
                        goto LABEL_70;
                      v64 = self->_has;
                      v66 = v4[37];
                    }
                    v88 = HIBYTE(*(unsigned int *)&v64) & 1;
                    if (v88 == (HIBYTE(v66) & 1))
                    {
                      if (v88)
                      {
                        hasTextInputEvent = self->_hasTextInputEvent;
                        if (hasTextInputEvent != objc_msgSend(v4, "hasTextInputEvent"))
                          goto LABEL_70;
                        v64 = self->_has;
                        v66 = v4[37];
                      }
                      v90 = (*(unsigned int *)&v64 >> 25) & 1;
                      if (v90 == ((v66 >> 25) & 1))
                      {
                        if (v90)
                        {
                          timeDeltaToTextInputInSec = self->_timeDeltaToTextInputInSec;
                          objc_msgSend(v4, "timeDeltaToTextInputInSec");
                          if (timeDeltaToTextInputInSec != v92)
                            goto LABEL_70;
                          v64 = self->_has;
                          v66 = v4[37];
                        }
                        v93 = (*(unsigned int *)&v64 >> 26) & 1;
                        if (v93 == ((v66 >> 26) & 1))
                        {
                          if (v93)
                          {
                            hasDeviceUnlockEvent = self->_hasDeviceUnlockEvent;
                            if (hasDeviceUnlockEvent != objc_msgSend(v4, "hasDeviceUnlockEvent"))
                              goto LABEL_70;
                            v64 = self->_has;
                            v66 = v4[37];
                          }
                          v95 = (*(unsigned int *)&v64 >> 27) & 1;
                          if (v95 == ((v66 >> 27) & 1))
                          {
                            if (!v95
                              || (timeDeltaToDeviceUnlockInSec = self->_timeDeltaToDeviceUnlockInSec,
                                  objc_msgSend(v4, "timeDeltaToDeviceUnlockInSec"),
                                  timeDeltaToDeviceUnlockInSec == v97))
                            {
                              v62 = 1;
                              goto LABEL_71;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_70:
  v62 = 0;
LABEL_71:

  return v62;
}

- (unint64_t)hash
{
  $C40809A43C7E90BBA9878EFFED84D921 has;
  float firstPassPeakScoreHS;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  float firstPassPeakScoreJS;
  double v11;
  long double v12;
  double v13;
  float triggerScoreHS;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  float triggerScoreJS;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  float mitigationScore;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  float tdSpeakerRecognizerCombinedScore;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  float triggerScoreHSThreshold;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  float triggerScoreJSThreshold;
  double v41;
  long double v42;
  double v43;
  unint64_t v44;
  float mitigationScoreThreshold;
  double v46;
  long double v47;
  double v48;
  unint64_t v49;
  float tdSpeakerRecognizerCombinedThreshold;
  double v51;
  long double v52;
  double v53;
  $C40809A43C7E90BBA9878EFFED84D921 v54;
  unint64_t v55;
  float userActionTimeThreshold;
  double v57;
  long double v58;
  double v59;
  unint64_t v60;
  float timeDeltaToNextTurnInSec;
  double v62;
  long double v63;
  double v64;
  $C40809A43C7E90BBA9878EFFED84D921 v65;
  float repetitionSimilarityScore;
  double v67;
  long double v68;
  double v69;
  unint64_t v70;
  float timeDeltaToNextRejectionInSec;
  double v72;
  long double v73;
  double v74;
  unint64_t v75;
  float timeDeltaToAppLaunchInSec;
  double v77;
  long double v78;
  double v79;
  unint64_t v80;
  unint64_t v81;
  float timeDeltaToAppIntentEventInSec;
  double v83;
  long double v84;
  double v85;
  float timeDeltaToTextInputInSec;
  double v87;
  long double v88;
  double v89;
  unint64_t v90;
  uint64_t v91;
  float timeDeltaToDeviceUnlockInSec;
  double v93;
  long double v94;
  double v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108;
  unint64_t v109;
  NSUInteger v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v119 = 2654435761u * self->_firstPassDetectionTimestampInSec;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v119 = 0;
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  firstPassPeakScoreHS = self->_firstPassPeakScoreHS;
  v5 = firstPassPeakScoreHS;
  if (firstPassPeakScoreHS < 0.0)
    v5 = -firstPassPeakScoreHS;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((*(_BYTE *)&has & 4) != 0)
  {
    firstPassPeakScoreJS = self->_firstPassPeakScoreJS;
    v11 = firstPassPeakScoreJS;
    if (firstPassPeakScoreJS < 0.0)
      v11 = -firstPassPeakScoreJS;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    v118 = 2654435761 * self->_invocationTypeId;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_21;
LABEL_26:
    v18 = 0;
    goto LABEL_29;
  }
  v118 = 0;
  if ((*(_BYTE *)&has & 0x10) == 0)
    goto LABEL_26;
LABEL_21:
  triggerScoreHS = self->_triggerScoreHS;
  v15 = triggerScoreHS;
  if (triggerScoreHS < 0.0)
    v15 = -triggerScoreHS;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0)
      v18 += (unint64_t)v17;
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_29:
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    triggerScoreJS = self->_triggerScoreJS;
    v21 = triggerScoreJS;
    if (triggerScoreJS < 0.0)
      v21 = -triggerScoreJS;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    mitigationScore = self->_mitigationScore;
    v26 = mitigationScore;
    if (mitigationScore < 0.0)
      v26 = -mitigationScore;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    tdSpeakerRecognizerCombinedScore = self->_tdSpeakerRecognizerCombinedScore;
    v31 = tdSpeakerRecognizerCombinedScore;
    if (tdSpeakerRecognizerCombinedScore < 0.0)
      v31 = -tdSpeakerRecognizerCombinedScore;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    triggerScoreHSThreshold = self->_triggerScoreHSThreshold;
    v36 = triggerScoreHSThreshold;
    if (triggerScoreHSThreshold < 0.0)
      v36 = -triggerScoreHSThreshold;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  v114 = v34;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    triggerScoreJSThreshold = self->_triggerScoreJSThreshold;
    v41 = triggerScoreJSThreshold;
    if (triggerScoreJSThreshold < 0.0)
      v41 = -triggerScoreJSThreshold;
    v42 = floor(v41 + 0.5);
    v43 = (v41 - v42) * 1.84467441e19;
    v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  v113 = v39;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    mitigationScoreThreshold = self->_mitigationScoreThreshold;
    v46 = mitigationScoreThreshold;
    if (mitigationScoreThreshold < 0.0)
      v46 = -mitigationScoreThreshold;
    v47 = floor(v46 + 0.5);
    v48 = (v46 - v47) * 1.84467441e19;
    v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0)
        v44 += (unint64_t)v48;
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    v44 = 0;
  }
  v112 = v44;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    tdSpeakerRecognizerCombinedThreshold = self->_tdSpeakerRecognizerCombinedThreshold;
    v51 = tdSpeakerRecognizerCombinedThreshold;
    if (tdSpeakerRecognizerCombinedThreshold < 0.0)
      v51 = -tdSpeakerRecognizerCombinedThreshold;
    v52 = floor(v51 + 0.5);
    v53 = (v51 - v52) * 1.84467441e19;
    v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0)
        v49 += (unint64_t)v53;
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
    }
  }
  else
  {
    v49 = 0;
  }
  v111 = v49;
  v110 = -[NSString hash](self->_voiceTriggerConfigVersion, "hash");
  v54 = self->_has;
  if ((*(_WORD *)&v54 & 0x1000) != 0)
  {
    userActionTimeThreshold = self->_userActionTimeThreshold;
    v57 = userActionTimeThreshold;
    if (userActionTimeThreshold < 0.0)
      v57 = -userActionTimeThreshold;
    v58 = floor(v57 + 0.5);
    v59 = (v57 - v58) * 1.84467441e19;
    v55 = 2654435761u * (unint64_t)fmod(v58, 1.84467441e19);
    if (v59 >= 0.0)
    {
      if (v59 > 0.0)
        v55 += (unint64_t)v59;
    }
    else
    {
      v55 -= (unint64_t)fabs(v59);
    }
  }
  else
  {
    v55 = 0;
  }
  if ((*(_WORD *)&v54 & 0x2000) != 0)
    v108 = 2654435761 * self->_hasNextTurn;
  else
    v108 = 0;
  v109 = v55;
  v115 = v29;
  if ((*(_WORD *)&v54 & 0x4000) != 0)
  {
    timeDeltaToNextTurnInSec = self->_timeDeltaToNextTurnInSec;
    v62 = timeDeltaToNextTurnInSec;
    if (timeDeltaToNextTurnInSec < 0.0)
      v62 = -timeDeltaToNextTurnInSec;
    v63 = floor(v62 + 0.5);
    v64 = (v62 - v63) * 1.84467441e19;
    v60 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
    if (v64 >= 0.0)
    {
      if (v64 > 0.0)
        v60 += (unint64_t)v64;
    }
    else
    {
      v60 -= (unint64_t)fabs(v64);
    }
  }
  else
  {
    v60 = 0;
  }
  v107 = v60;
  v106 = -[SISchemaUUID hash](self->_nextTurnId, "hash");
  v65 = self->_has;
  if ((*(_WORD *)&v65 & 0x8000) == 0)
  {
    v105 = 0;
    if ((*(_DWORD *)&v65 & 0x10000) != 0)
      goto LABEL_106;
LABEL_112:
    v104 = 0;
    if ((*(_DWORD *)&v65 & 0x20000) != 0)
      goto LABEL_107;
LABEL_113:
    v70 = 0;
    goto LABEL_116;
  }
  v105 = 2654435761 * self->_nextTurnInvocationSource;
  if ((*(_DWORD *)&v65 & 0x10000) == 0)
    goto LABEL_112;
LABEL_106:
  v104 = 2654435761 * self->_isNextTurnValid;
  if ((*(_DWORD *)&v65 & 0x20000) == 0)
    goto LABEL_113;
LABEL_107:
  repetitionSimilarityScore = self->_repetitionSimilarityScore;
  v67 = repetitionSimilarityScore;
  if (repetitionSimilarityScore < 0.0)
    v67 = -repetitionSimilarityScore;
  v68 = floor(v67 + 0.5);
  v69 = (v67 - v68) * 1.84467441e19;
  v70 = 2654435761u * (unint64_t)fmod(v68, 1.84467441e19);
  if (v69 >= 0.0)
  {
    if (v69 > 0.0)
      v70 += (unint64_t)v69;
  }
  else
  {
    v70 -= (unint64_t)fabs(v69);
  }
LABEL_116:
  if ((*(_DWORD *)&v65 & 0x40000) != 0)
  {
    v103 = 2654435761 * self->_hasNextRejection;
    if ((*(_DWORD *)&v65 & 0x80000) != 0)
      goto LABEL_118;
LABEL_123:
    v75 = 0;
    goto LABEL_126;
  }
  v103 = 0;
  if ((*(_DWORD *)&v65 & 0x80000) == 0)
    goto LABEL_123;
LABEL_118:
  timeDeltaToNextRejectionInSec = self->_timeDeltaToNextRejectionInSec;
  v72 = timeDeltaToNextRejectionInSec;
  if (timeDeltaToNextRejectionInSec < 0.0)
    v72 = -timeDeltaToNextRejectionInSec;
  v73 = floor(v72 + 0.5);
  v74 = (v72 - v73) * 1.84467441e19;
  v75 = 2654435761u * (unint64_t)fmod(v73, 1.84467441e19);
  if (v74 >= 0.0)
  {
    if (v74 > 0.0)
      v75 += (unint64_t)v74;
  }
  else
  {
    v75 -= (unint64_t)fabs(v74);
  }
LABEL_126:
  if ((*(_DWORD *)&v65 & 0x100000) != 0)
  {
    v102 = 2654435761 * self->_hasAppLaunchEvent;
    if ((*(_DWORD *)&v65 & 0x200000) != 0)
      goto LABEL_128;
LABEL_133:
    v80 = 0;
    goto LABEL_136;
  }
  v102 = 0;
  if ((*(_DWORD *)&v65 & 0x200000) == 0)
    goto LABEL_133;
LABEL_128:
  timeDeltaToAppLaunchInSec = self->_timeDeltaToAppLaunchInSec;
  v77 = timeDeltaToAppLaunchInSec;
  if (timeDeltaToAppLaunchInSec < 0.0)
    v77 = -timeDeltaToAppLaunchInSec;
  v78 = floor(v77 + 0.5);
  v79 = (v77 - v78) * 1.84467441e19;
  v80 = 2654435761u * (unint64_t)fmod(v78, 1.84467441e19);
  if (v79 >= 0.0)
  {
    if (v79 > 0.0)
      v80 += (unint64_t)v79;
  }
  else
  {
    v80 -= (unint64_t)fabs(v79);
  }
LABEL_136:
  v117 = v9;
  v101 = v80;
  if ((*(_DWORD *)&v65 & 0x400000) != 0)
    v100 = 2654435761 * self->_hasAppIntentEvent;
  else
    v100 = 0;
  v116 = v8;
  if ((*(_DWORD *)&v65 & 0x800000) != 0)
  {
    timeDeltaToAppIntentEventInSec = self->_timeDeltaToAppIntentEventInSec;
    v83 = timeDeltaToAppIntentEventInSec;
    if (timeDeltaToAppIntentEventInSec < 0.0)
      v83 = -timeDeltaToAppIntentEventInSec;
    v84 = floor(v83 + 0.5);
    v85 = (v83 - v84) * 1.84467441e19;
    v81 = 2654435761u * (unint64_t)fmod(v84, 1.84467441e19);
    if (v85 >= 0.0)
    {
      if (v85 > 0.0)
        v81 += (unint64_t)v85;
    }
    else
    {
      v81 -= (unint64_t)fabs(v85);
    }
  }
  else
  {
    v81 = 0;
  }
  if ((*(_DWORD *)&v65 & 0x1000000) != 0)
  {
    v99 = 2654435761 * self->_hasTextInputEvent;
    if ((*(_DWORD *)&v65 & 0x2000000) != 0)
      goto LABEL_149;
LABEL_154:
    v90 = 0;
    goto LABEL_157;
  }
  v99 = 0;
  if ((*(_DWORD *)&v65 & 0x2000000) == 0)
    goto LABEL_154;
LABEL_149:
  timeDeltaToTextInputInSec = self->_timeDeltaToTextInputInSec;
  v87 = timeDeltaToTextInputInSec;
  if (timeDeltaToTextInputInSec < 0.0)
    v87 = -timeDeltaToTextInputInSec;
  v88 = floor(v87 + 0.5);
  v89 = (v87 - v88) * 1.84467441e19;
  v90 = 2654435761u * (unint64_t)fmod(v88, 1.84467441e19);
  if (v89 >= 0.0)
  {
    if (v89 > 0.0)
      v90 += (unint64_t)v89;
  }
  else
  {
    v90 -= (unint64_t)fabs(v89);
  }
LABEL_157:
  if ((*(_DWORD *)&v65 & 0x4000000) == 0)
  {
    v91 = 0;
    if ((*(_DWORD *)&v65 & 0x8000000) != 0)
      goto LABEL_159;
LABEL_164:
    v96 = 0;
    goto LABEL_165;
  }
  v91 = 2654435761 * self->_hasDeviceUnlockEvent;
  if ((*(_DWORD *)&v65 & 0x8000000) == 0)
    goto LABEL_164;
LABEL_159:
  timeDeltaToDeviceUnlockInSec = self->_timeDeltaToDeviceUnlockInSec;
  v93 = timeDeltaToDeviceUnlockInSec;
  if (timeDeltaToDeviceUnlockInSec < 0.0)
    v93 = -timeDeltaToDeviceUnlockInSec;
  v94 = floor(v93 + 0.5);
  v95 = (v93 - v94) * 1.84467441e19;
  v96 = 2654435761u * (unint64_t)fmod(v94, 1.84467441e19);
  if (v95 < 0.0)
  {
    v96 -= (unint64_t)fabs(v95);
LABEL_165:
    v97 = v115;
    return v116 ^ v119 ^ v117 ^ v118 ^ v18 ^ v19 ^ v24 ^ v97 ^ v114 ^ v113 ^ v112 ^ v111 ^ v109 ^ v108 ^ v107 ^ v110 ^ v106 ^ v105 ^ v104 ^ v70 ^ v103 ^ v75 ^ v102 ^ v101 ^ v100 ^ v81 ^ v99 ^ v90 ^ v91 ^ v96;
  }
  v97 = v115;
  if (v95 > 0.0)
    v96 += (unint64_t)v95;
  return v116 ^ v119 ^ v117 ^ v118 ^ v18 ^ v19 ^ v24 ^ v97 ^ v114 ^ v113 ^ v112 ^ v111 ^ v109 ^ v108 ^ v107 ^ v110 ^ v106 ^ v105 ^ v104 ^ v70 ^ v103 ^ v75 ^ v102 ^ v101 ^ v100 ^ v81 ^ v99 ^ v90 ^ v91 ^ v96;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $C40809A43C7E90BBA9878EFFED84D921 has;
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
  $C40809A43C7E90BBA9878EFFED84D921 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[IASchemaIAVoiceTriggerEventSummary firstPassDetectionTimestampInSec](self, "firstPassDetectionTimestampInSec"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("firstPassDetectionTimestampInSec"));

    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary firstPassPeakScoreHS](self, "firstPassPeakScoreHS");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("firstPassPeakScoreHS"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary firstPassPeakScoreJS](self, "firstPassPeakScoreJS");
  objc_msgSend(v12, "numberWithFloat:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("firstPassPeakScoreJS"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IASchemaIAVoiceTriggerEventSummary hasAppIntentEvent](self, "hasAppIntentEvent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hasAppIntentEvent"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IASchemaIAVoiceTriggerEventSummary hasAppLaunchEvent](self, "hasAppLaunchEvent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("hasAppLaunchEvent"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IASchemaIAVoiceTriggerEventSummary hasDeviceUnlockEvent](self, "hasDeviceUnlockEvent"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("hasDeviceUnlockEvent"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IASchemaIAVoiceTriggerEventSummary hasNextRejection](self, "hasNextRejection"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("hasNextRejection"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IASchemaIAVoiceTriggerEventSummary hasNextTurn](self, "hasNextTurn"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("hasNextTurn"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IASchemaIAVoiceTriggerEventSummary hasTextInputEvent](self, "hasTextInputEvent"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("hasTextInputEvent"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[IASchemaIAVoiceTriggerEventSummary invocationTypeId](self, "invocationTypeId"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("invocationTypeId"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IASchemaIAVoiceTriggerEventSummary isNextTurnValid](self, "isNextTurnValid"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("isNextTurnValid"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_29:
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary mitigationScore](self, "mitigationScore");
  objc_msgSend(v22, "numberWithFloat:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("mitigationScore"));

  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_14:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[IASchemaIAVoiceTriggerEventSummary mitigationScoreThreshold](self, "mitigationScoreThreshold");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("mitigationScoreThreshold"));

  }
LABEL_15:
  if (self->_nextTurnId)
  {
    -[IASchemaIAVoiceTriggerEventSummary nextTurnId](self, "nextTurnId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("nextTurnId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("nextTurnId"));

    }
  }
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x8000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[IASchemaIAVoiceTriggerEventSummary nextTurnInvocationSource](self, "nextTurnInvocationSource"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("nextTurnInvocationSource"));

    v25 = self->_has;
    if ((*(_DWORD *)&v25 & 0x20000) == 0)
    {
LABEL_35:
      if ((*(_BYTE *)&v25 & 0x80) == 0)
        goto LABEL_36;
      goto LABEL_54;
    }
  }
  else if ((*(_DWORD *)&v25 & 0x20000) == 0)
  {
    goto LABEL_35;
  }
  v32 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary repetitionSimilarityScore](self, "repetitionSimilarityScore");
  objc_msgSend(v32, "numberWithFloat:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("repetitionSimilarityScore"));

  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 0x80) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v25 & 0x800) == 0)
      goto LABEL_37;
    goto LABEL_55;
  }
LABEL_54:
  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary tdSpeakerRecognizerCombinedScore](self, "tdSpeakerRecognizerCombinedScore");
  objc_msgSend(v34, "numberWithFloat:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("tdSpeakerRecognizerCombinedScore"));

  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x800) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v25 & 0x800000) == 0)
      goto LABEL_38;
    goto LABEL_56;
  }
LABEL_55:
  v36 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary tdSpeakerRecognizerCombinedThreshold](self, "tdSpeakerRecognizerCombinedThreshold");
  objc_msgSend(v36, "numberWithFloat:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("tdSpeakerRecognizerCombinedThreshold"));

  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x800000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v25 & 0x200000) == 0)
      goto LABEL_39;
    goto LABEL_57;
  }
LABEL_56:
  v38 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary timeDeltaToAppIntentEventInSec](self, "timeDeltaToAppIntentEventInSec");
  objc_msgSend(v38, "numberWithFloat:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("timeDeltaToAppIntentEventInSec"));

  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x200000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v25 & 0x8000000) == 0)
      goto LABEL_40;
    goto LABEL_58;
  }
LABEL_57:
  v40 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary timeDeltaToAppLaunchInSec](self, "timeDeltaToAppLaunchInSec");
  objc_msgSend(v40, "numberWithFloat:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("timeDeltaToAppLaunchInSec"));

  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v25 & 0x80000) == 0)
      goto LABEL_41;
    goto LABEL_59;
  }
LABEL_58:
  v42 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary timeDeltaToDeviceUnlockInSec](self, "timeDeltaToDeviceUnlockInSec");
  objc_msgSend(v42, "numberWithFloat:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("timeDeltaToDeviceUnlockInSec"));

  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x80000) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v25 & 0x4000) == 0)
      goto LABEL_42;
    goto LABEL_60;
  }
LABEL_59:
  v44 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary timeDeltaToNextRejectionInSec](self, "timeDeltaToNextRejectionInSec");
  objc_msgSend(v44, "numberWithFloat:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("timeDeltaToNextRejectionInSec"));

  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x4000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v25 & 0x2000000) == 0)
      goto LABEL_43;
    goto LABEL_61;
  }
LABEL_60:
  v46 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary timeDeltaToNextTurnInSec](self, "timeDeltaToNextTurnInSec");
  objc_msgSend(v46, "numberWithFloat:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("timeDeltaToNextTurnInSec"));

  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x2000000) == 0)
  {
LABEL_43:
    if ((*(_BYTE *)&v25 & 0x10) == 0)
      goto LABEL_44;
    goto LABEL_62;
  }
LABEL_61:
  v48 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary timeDeltaToTextInputInSec](self, "timeDeltaToTextInputInSec");
  objc_msgSend(v48, "numberWithFloat:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("timeDeltaToTextInputInSec"));

  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 0x10) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v25 & 0x100) == 0)
      goto LABEL_45;
    goto LABEL_63;
  }
LABEL_62:
  v50 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary triggerScoreHS](self, "triggerScoreHS");
  objc_msgSend(v50, "numberWithFloat:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("triggerScoreHS"));

  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x100) == 0)
  {
LABEL_45:
    if ((*(_BYTE *)&v25 & 0x20) == 0)
      goto LABEL_46;
    goto LABEL_64;
  }
LABEL_63:
  v52 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary triggerScoreHSThreshold](self, "triggerScoreHSThreshold");
  objc_msgSend(v52, "numberWithFloat:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("triggerScoreHSThreshold"));

  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 0x20) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v25 & 0x200) == 0)
      goto LABEL_47;
    goto LABEL_65;
  }
LABEL_64:
  v54 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary triggerScoreJS](self, "triggerScoreJS");
  objc_msgSend(v54, "numberWithFloat:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("triggerScoreJS"));

  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x200) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v25 & 0x1000) == 0)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_65:
  v56 = (void *)MEMORY[0x1E0CB37E8];
  -[IASchemaIAVoiceTriggerEventSummary triggerScoreJSThreshold](self, "triggerScoreJSThreshold");
  objc_msgSend(v56, "numberWithFloat:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("triggerScoreJSThreshold"));

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_48:
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[IASchemaIAVoiceTriggerEventSummary userActionTimeThreshold](self, "userActionTimeThreshold");
    objc_msgSend(v26, "numberWithFloat:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("userActionTimeThreshold"));

  }
LABEL_49:
  if (self->_voiceTriggerConfigVersion)
  {
    -[IASchemaIAVoiceTriggerEventSummary voiceTriggerConfigVersion](self, "voiceTriggerConfigVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("voiceTriggerConfigVersion"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IASchemaIAVoiceTriggerEventSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IASchemaIAVoiceTriggerEventSummary)initWithJSON:(id)a3
{
  void *v4;
  IASchemaIAVoiceTriggerEventSummary *v5;
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
    self = -[IASchemaIAVoiceTriggerEventSummary initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IASchemaIAVoiceTriggerEventSummary)initWithDictionary:(id)a3
{
  id v4;
  IASchemaIAVoiceTriggerEventSummary *v5;
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
  uint64_t v23;
  SISchemaUUID *v24;
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
  IASchemaIAVoiceTriggerEventSummary *v40;
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
  void *v64;
  objc_super v65;

  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)IASchemaIAVoiceTriggerEventSummary;
  v5 = -[IASchemaIAVoiceTriggerEventSummary init](&v65, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassDetectionTimestampInSec"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IASchemaIAVoiceTriggerEventSummary setFirstPassDetectionTimestampInSec:](v5, "setFirstPassDetectionTimestampInSec:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassPeakScoreHS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setFirstPassPeakScoreHS:](v5, "setFirstPassPeakScoreHS:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassPeakScoreJS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setFirstPassPeakScoreJS:](v5, "setFirstPassPeakScoreJS:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invocationTypeId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IASchemaIAVoiceTriggerEventSummary setInvocationTypeId:](v5, "setInvocationTypeId:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerScoreHS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setTriggerScoreHS:](v5, "setTriggerScoreHS:");
    }
    v50 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerScoreJS"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setTriggerScoreJS:](v5, "setTriggerScoreJS:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mitigationScore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setMitigationScore:](v5, "setMitigationScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerCombinedScore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v63 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setTdSpeakerRecognizerCombinedScore:](v5, "setTdSpeakerRecognizerCombinedScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerScoreHSThreshold"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v62 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setTriggerScoreHSThreshold:](v5, "setTriggerScoreHSThreshold:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerScoreJSThreshold"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v61 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setTriggerScoreJSThreshold:](v5, "setTriggerScoreJSThreshold:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mitigationScoreThreshold"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setMitigationScoreThreshold:](v5, "setMitigationScoreThreshold:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerCombinedThreshold"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setTdSpeakerRecognizerCombinedThreshold:](v5, "setTdSpeakerRecognizerCombinedThreshold:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceTriggerConfigVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[IASchemaIAVoiceTriggerEventSummary setVoiceTriggerConfigVersion:](v5, "setVoiceTriggerConfigVersion:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userActionTimeThreshold"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v20, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setUserActionTimeThreshold:](v5, "setUserActionTimeThreshold:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasNextTurn"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v56 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IASchemaIAVoiceTriggerEventSummary setHasNextTurn:](v5, "setHasNextTurn:", objc_msgSend(v21, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeDeltaToNextTurnInSec"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToNextTurnInSec:](v5, "setTimeDeltaToNextTurnInSec:");
    }
    v47 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nextTurnId"));
    v23 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = (void *)v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v23);
      -[IASchemaIAVoiceTriggerEventSummary setNextTurnId:](v5, "setNextTurnId:", v24);

    }
    v25 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nextTurnInvocationSource"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IASchemaIAVoiceTriggerEventSummary setNextTurnInvocationSource:](v5, "setNextTurnInvocationSource:", objc_msgSend(v26, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNextTurnValid"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v53 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IASchemaIAVoiceTriggerEventSummary setIsNextTurnValid:](v5, "setIsNextTurnValid:", objc_msgSend(v27, "BOOLValue"));
    v28 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("repetitionSimilarityScore"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v29, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setRepetitionSimilarityScore:](v5, "setRepetitionSimilarityScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasNextRejection"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v52 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IASchemaIAVoiceTriggerEventSummary setHasNextRejection:](v5, "setHasNextRejection:", objc_msgSend(v30, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeDeltaToNextRejectionInSec"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v51 = v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v31, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToNextRejectionInSec:](v5, "setTimeDeltaToNextRejectionInSec:");
    }
    v45 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasAppLaunchEvent"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IASchemaIAVoiceTriggerEventSummary setHasAppLaunchEvent:](v5, "setHasAppLaunchEvent:", objc_msgSend(v32, "BOOLValue"));
    v44 = v26;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeDeltaToAppLaunchInSec"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v33, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToAppLaunchInSec:](v5, "setTimeDeltaToAppLaunchInSec:");
    }
    v43 = v29;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasAppIntentEvent"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IASchemaIAVoiceTriggerEventSummary setHasAppIntentEvent:](v5, "setHasAppIntentEvent:", objc_msgSend(v34, "BOOLValue"));
    v49 = v25;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeDeltaToAppIntentEventInSec"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v35, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToAppIntentEventInSec:](v5, "setTimeDeltaToAppIntentEventInSec:");
    }
    v48 = v28;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTextInputEvent"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IASchemaIAVoiceTriggerEventSummary setHasTextInputEvent:](v5, "setHasTextInputEvent:", objc_msgSend(v36, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeDeltaToTextInputInSec"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v37, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToTextInputInSec:](v5, "setTimeDeltaToTextInputInSec:");
    }
    v46 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasDeviceUnlockEvent"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IASchemaIAVoiceTriggerEventSummary setHasDeviceUnlockEvent:](v5, "setHasDeviceUnlockEvent:", objc_msgSend(v38, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeDeltaToDeviceUnlockInSec"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v39, "floatValue");
      -[IASchemaIAVoiceTriggerEventSummary setTimeDeltaToDeviceUnlockInSec:](v5, "setTimeDeltaToDeviceUnlockInSec:");
    }
    v40 = v5;

  }
  return v5;
}

- (unint64_t)firstPassDetectionTimestampInSec
{
  return self->_firstPassDetectionTimestampInSec;
}

- (float)firstPassPeakScoreHS
{
  return self->_firstPassPeakScoreHS;
}

- (float)firstPassPeakScoreJS
{
  return self->_firstPassPeakScoreJS;
}

- (unsigned)invocationTypeId
{
  return self->_invocationTypeId;
}

- (float)triggerScoreHS
{
  return self->_triggerScoreHS;
}

- (float)triggerScoreJS
{
  return self->_triggerScoreJS;
}

- (float)mitigationScore
{
  return self->_mitigationScore;
}

- (float)tdSpeakerRecognizerCombinedScore
{
  return self->_tdSpeakerRecognizerCombinedScore;
}

- (float)triggerScoreHSThreshold
{
  return self->_triggerScoreHSThreshold;
}

- (float)triggerScoreJSThreshold
{
  return self->_triggerScoreJSThreshold;
}

- (float)mitigationScoreThreshold
{
  return self->_mitigationScoreThreshold;
}

- (float)tdSpeakerRecognizerCombinedThreshold
{
  return self->_tdSpeakerRecognizerCombinedThreshold;
}

- (NSString)voiceTriggerConfigVersion
{
  return self->_voiceTriggerConfigVersion;
}

- (void)setVoiceTriggerConfigVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (float)userActionTimeThreshold
{
  return self->_userActionTimeThreshold;
}

- (BOOL)hasNextTurn
{
  return self->_hasNextTurn;
}

- (float)timeDeltaToNextTurnInSec
{
  return self->_timeDeltaToNextTurnInSec;
}

- (SISchemaUUID)nextTurnId
{
  return self->_nextTurnId;
}

- (void)setNextTurnId:(id)a3
{
  objc_storeStrong((id *)&self->_nextTurnId, a3);
}

- (unsigned)nextTurnInvocationSource
{
  return self->_nextTurnInvocationSource;
}

- (BOOL)isNextTurnValid
{
  return self->_isNextTurnValid;
}

- (float)repetitionSimilarityScore
{
  return self->_repetitionSimilarityScore;
}

- (BOOL)hasNextRejection
{
  return self->_hasNextRejection;
}

- (float)timeDeltaToNextRejectionInSec
{
  return self->_timeDeltaToNextRejectionInSec;
}

- (BOOL)hasAppLaunchEvent
{
  return self->_hasAppLaunchEvent;
}

- (float)timeDeltaToAppLaunchInSec
{
  return self->_timeDeltaToAppLaunchInSec;
}

- (BOOL)hasAppIntentEvent
{
  return self->_hasAppIntentEvent;
}

- (float)timeDeltaToAppIntentEventInSec
{
  return self->_timeDeltaToAppIntentEventInSec;
}

- (BOOL)hasTextInputEvent
{
  return self->_hasTextInputEvent;
}

- (float)timeDeltaToTextInputInSec
{
  return self->_timeDeltaToTextInputInSec;
}

- (BOOL)hasDeviceUnlockEvent
{
  return self->_hasDeviceUnlockEvent;
}

- (float)timeDeltaToDeviceUnlockInSec
{
  return self->_timeDeltaToDeviceUnlockInSec;
}

- (void)setHasVoiceTriggerConfigVersion:(BOOL)a3
{
  self->_hasVoiceTriggerConfigVersion = a3;
}

- (void)setHasNextTurnId:(BOOL)a3
{
  self->_hasNextTurnId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextTurnId, 0);
  objc_storeStrong((id *)&self->_voiceTriggerConfigVersion, 0);
}

@end
