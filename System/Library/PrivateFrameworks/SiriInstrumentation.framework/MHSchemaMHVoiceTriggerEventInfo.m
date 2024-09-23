@implementation MHSchemaMHVoiceTriggerEventInfo

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
  v9.super_class = (Class)MHSchemaMHVoiceTriggerEventInfo;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MHSchemaMHVoiceTriggerEventInfo audioProviderUUID](self, "audioProviderUUID", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[MHSchemaMHVoiceTriggerEventInfo deleteAudioProviderUUID](self, "deleteAudioProviderUUID");
  return v5;
}

- (void)setSecondPassAnalyerStartSampleCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_secondPassAnalyerStartSampleCount = a3;
}

- (BOOL)hasSecondPassAnalyerStartSampleCount
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasSecondPassAnalyerStartSampleCount:(BOOL)a3
{
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (void)deleteSecondPassAnalyerStartSampleCount
{
  -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAnalyerStartSampleCount:](self, "setSecondPassAnalyerStartSampleCount:", 0);
  *(_QWORD *)&self->_has &= ~1uLL;
}

- (void)setSecondPassAnalyerEndSampleCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_secondPassAnalyerEndSampleCount = a3;
}

- (BOOL)hasSecondPassAnalyerEndSampleCount
{
  return (*(_QWORD *)&self->_has >> 1) & 1;
}

- (void)setHasSecondPassAnalyerEndSampleCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (void)deleteSecondPassAnalyerEndSampleCount
{
  -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAnalyerEndSampleCount:](self, "setSecondPassAnalyerEndSampleCount:", 0);
  *(_QWORD *)&self->_has &= ~2uLL;
}

- (void)setSatScore:(float)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_satScore = a3;
}

- (BOOL)hasSatScore
{
  return (*(_QWORD *)&self->_has >> 2) & 1;
}

- (void)setHasSatScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (void)deleteSatScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setSatScore:](self, "setSatScore:", v2);
  *(_QWORD *)&self->_has &= ~4uLL;
}

- (void)setSatNumTrainingUtterances:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_satNumTrainingUtterances = a3;
}

- (BOOL)hasSatNumTrainingUtterances
{
  return (*(_QWORD *)&self->_has >> 3) & 1;
}

- (void)setHasSatNumTrainingUtterances:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (void)deleteSatNumTrainingUtterances
{
  -[MHSchemaMHVoiceTriggerEventInfo setSatNumTrainingUtterances:](self, "setSatNumTrainingUtterances:", 0);
  *(_QWORD *)&self->_has &= ~8uLL;
}

- (void)setSatThreshold:(float)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_satThreshold = a3;
}

- (BOOL)hasSatThreshold
{
  return (*(_QWORD *)&self->_has >> 4) & 1;
}

- (void)setHasSatThreshold:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (void)deleteSatThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setSatThreshold:](self, "setSatThreshold:", v2);
  *(_QWORD *)&self->_has &= ~0x10uLL;
}

- (void)setSatTriggered:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_satTriggered = a3;
}

- (BOOL)hasSatTriggered
{
  return (*(_QWORD *)&self->_has >> 5) & 1;
}

- (void)setHasSatTriggered:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (void)deleteSatTriggered
{
  -[MHSchemaMHVoiceTriggerEventInfo setSatTriggered:](self, "setSatTriggered:", 0);
  *(_QWORD *)&self->_has &= ~0x20uLL;
}

- (void)setTdSpeakerRecognizerScore:(float)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_tdSpeakerRecognizerScore = a3;
}

- (BOOL)hasTdSpeakerRecognizerScore
{
  return (*(_QWORD *)&self->_has >> 6) & 1;
}

- (void)setHasTdSpeakerRecognizerScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (void)deleteTdSpeakerRecognizerScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setTdSpeakerRecognizerScore:](self, "setTdSpeakerRecognizerScore:", v2);
  *(_QWORD *)&self->_has &= ~0x40uLL;
}

- (void)setTdSpeakerRecognizerCombinedScore:(float)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_tdSpeakerRecognizerCombinedScore = a3;
}

- (BOOL)hasTdSpeakerRecognizerCombinedScore
{
  return (*(_QWORD *)&self->_has >> 7) & 1;
}

- (void)setHasTdSpeakerRecognizerCombinedScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (void)deleteTdSpeakerRecognizerCombinedScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setTdSpeakerRecognizerCombinedScore:](self, "setTdSpeakerRecognizerCombinedScore:", v2);
  *(_QWORD *)&self->_has &= ~0x80uLL;
}

- (void)setTdSpeakerRecognizerCombinedThreshold:(float)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_tdSpeakerRecognizerCombinedThreshold = a3;
}

- (BOOL)hasTdSpeakerRecognizerCombinedThreshold
{
  return (*(_QWORD *)&self->_has >> 8) & 1;
}

- (void)setHasTdSpeakerRecognizerCombinedThreshold:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (void)deleteTdSpeakerRecognizerCombinedThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setTdSpeakerRecognizerCombinedThreshold:](self, "setTdSpeakerRecognizerCombinedThreshold:", v2);
  *(_QWORD *)&self->_has &= ~0x100uLL;
}

- (void)setTdSpeakerRecognizerCombinationWeight:(float)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_tdSpeakerRecognizerCombinationWeight = a3;
}

- (BOOL)hasTdSpeakerRecognizerCombinationWeight
{
  return (*(_QWORD *)&self->_has >> 9) & 1;
}

- (void)setHasTdSpeakerRecognizerCombinationWeight:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (void)deleteTdSpeakerRecognizerCombinationWeight
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setTdSpeakerRecognizerCombinationWeight:](self, "setTdSpeakerRecognizerCombinationWeight:", v2);
  *(_QWORD *)&self->_has &= ~0x200uLL;
}

- (void)setBiometricClue:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_biometricClue = a3;
}

- (BOOL)hasBiometricClue
{
  return (*(_QWORD *)&self->_has >> 10) & 1;
}

- (void)setHasBiometricClue:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (void)deleteBiometricClue
{
  -[MHSchemaMHVoiceTriggerEventInfo setBiometricClue:](self, "setBiometricClue:", 0);
  *(_QWORD *)&self->_has &= ~0x400uLL;
}

- (void)setSatBeingTrained:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_satBeingTrained = a3;
}

- (BOOL)hasSatBeingTrained
{
  return (*(_QWORD *)&self->_has >> 11) & 1;
}

- (void)setHasSatBeingTrained:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (void)deleteSatBeingTrained
{
  -[MHSchemaMHVoiceTriggerEventInfo setSatBeingTrained:](self, "setSatBeingTrained:", 0);
  *(_QWORD *)&self->_has &= ~0x800uLL;
}

- (void)setLastConsecutivePHSRejects:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_lastConsecutivePHSRejects = a3;
}

- (BOOL)hasLastConsecutivePHSRejects
{
  return (*(_QWORD *)&self->_has >> 12) & 1;
}

- (void)setHasLastConsecutivePHSRejects:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (void)deleteLastConsecutivePHSRejects
{
  -[MHSchemaMHVoiceTriggerEventInfo setLastConsecutivePHSRejects:](self, "setLastConsecutivePHSRejects:", 0);
  *(_QWORD *)&self->_has &= ~0x1000uLL;
}

- (void)setDeltaTimeInNsFromlastPHSReject:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_deltaTimeInNsFromlastPHSReject = a3;
}

- (BOOL)hasDeltaTimeInNsFromlastPHSReject
{
  return (*(_QWORD *)&self->_has >> 13) & 1;
}

- (void)setHasDeltaTimeInNsFromlastPHSReject:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (void)deleteDeltaTimeInNsFromlastPHSReject
{
  -[MHSchemaMHVoiceTriggerEventInfo setDeltaTimeInNsFromlastPHSReject:](self, "setDeltaTimeInNsFromlastPHSReject:", 0);
  *(_QWORD *)&self->_has &= ~0x2000uLL;
}

- (void)setTriggerExplicitSatScore:(float)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_triggerExplicitSatScore = a3;
}

- (BOOL)hasTriggerExplicitSatScore
{
  return (*(_QWORD *)&self->_has >> 14) & 1;
}

- (void)setHasTriggerExplicitSatScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (void)deleteTriggerExplicitSatScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerExplicitSatScore:](self, "setTriggerExplicitSatScore:", v2);
  *(_QWORD *)&self->_has &= ~0x4000uLL;
}

- (void)setTriggerExplicitTDSRSatScore:(float)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_triggerExplicitTDSRSatScore = a3;
}

- (BOOL)hasTriggerExplicitTDSRSatScore
{
  return (*(_QWORD *)&self->_has >> 15) & 1;
}

- (void)setHasTriggerExplicitTDSRSatScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (void)deleteTriggerExplicitTDSRSatScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerExplicitTDSRSatScore:](self, "setTriggerExplicitTDSRSatScore:", v2);
  *(_QWORD *)&self->_has &= ~0x8000uLL;
}

- (void)setShadowMicScore:(float)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_shadowMicScore = a3;
}

- (BOOL)hasShadowMicScore
{
  return (*(_QWORD *)&self->_has >> 16) & 1;
}

- (void)setHasShadowMicScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (void)deleteShadowMicScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setShadowMicScore:](self, "setShadowMicScore:", v2);
  *(_QWORD *)&self->_has &= ~0x10000uLL;
}

- (void)setShadowMicScoreThresholdForVAD:(float)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_shadowMicScoreThresholdForVAD = a3;
}

- (BOOL)hasShadowMicScoreThresholdForVAD
{
  return (*(_QWORD *)&self->_has >> 17) & 1;
}

- (void)setHasShadowMicScoreThresholdForVAD:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (void)deleteShadowMicScoreThresholdForVAD
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setShadowMicScoreThresholdForVAD:](self, "setShadowMicScoreThresholdForVAD:", v2);
  *(_QWORD *)&self->_has &= ~0x20000uLL;
}

- (void)setRemoteMicVADScore:(float)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_remoteMicVADScore = a3;
}

- (BOOL)hasRemoteMicVADScore
{
  return (*(_QWORD *)&self->_has >> 18) & 1;
}

- (void)setHasRemoteMicVADScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (void)deleteRemoteMicVADScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setRemoteMicVADScore:](self, "setRemoteMicVADScore:", v2);
  *(_QWORD *)&self->_has &= ~0x40000uLL;
}

- (void)setRemoteMicVADThreshold:(float)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_remoteMicVADThreshold = a3;
}

- (BOOL)hasRemoteMicVADThreshold
{
  return (*(_QWORD *)&self->_has >> 19) & 1;
}

- (void)setHasRemoteMicVADThreshold:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (void)deleteRemoteMicVADThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setRemoteMicVADThreshold:](self, "setRemoteMicVADThreshold:", v2);
  *(_QWORD *)&self->_has &= ~0x80000uLL;
}

- (void)setRemoteMicVADMyriadThreshold:(float)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_remoteMicVADMyriadThreshold = a3;
}

- (BOOL)hasRemoteMicVADMyriadThreshold
{
  return (*(_QWORD *)&self->_has >> 20) & 1;
}

- (void)setHasRemoteMicVADMyriadThreshold:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (void)deleteRemoteMicVADMyriadThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setRemoteMicVADMyriadThreshold:](self, "setRemoteMicVADMyriadThreshold:", v2);
  *(_QWORD *)&self->_has &= ~0x100000uLL;
}

- (void)setEnhancedCarplayTriggerMode:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_enhancedCarplayTriggerMode = a3;
}

- (BOOL)hasEnhancedCarplayTriggerMode
{
  return (*(_QWORD *)&self->_has >> 21) & 1;
}

- (void)setHasEnhancedCarplayTriggerMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (void)deleteEnhancedCarplayTriggerMode
{
  -[MHSchemaMHVoiceTriggerEventInfo setEnhancedCarplayTriggerMode:](self, "setEnhancedCarplayTriggerMode:", 0);
  *(_QWORD *)&self->_has &= ~0x200000uLL;
}

- (void)setTriggerStartSampleCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_triggerStartSampleCount = a3;
}

- (BOOL)hasTriggerStartSampleCount
{
  return (*(_QWORD *)&self->_has >> 22) & 1;
}

- (void)setHasTriggerStartSampleCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (void)deleteTriggerStartSampleCount
{
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerStartSampleCount:](self, "setTriggerStartSampleCount:", 0);
  *(_QWORD *)&self->_has &= ~0x400000uLL;
}

- (void)setClientStartSampleCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_clientStartSampleCount = a3;
}

- (BOOL)hasClientStartSampleCount
{
  return (*(_QWORD *)&self->_has >> 23) & 1;
}

- (void)setHasClientStartSampleCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (void)deleteClientStartSampleCount
{
  -[MHSchemaMHVoiceTriggerEventInfo setClientStartSampleCount:](self, "setClientStartSampleCount:", 0);
  *(_QWORD *)&self->_has &= ~0x800000uLL;
}

- (void)setTriggerEndSampleCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_triggerEndSampleCount = a3;
}

- (BOOL)hasTriggerEndSampleCount
{
  return (*(_QWORD *)&self->_has >> 24) & 1;
}

- (void)setHasTriggerEndSampleCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (void)deleteTriggerEndSampleCount
{
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerEndSampleCount:](self, "setTriggerEndSampleCount:", 0);
  *(_QWORD *)&self->_has &= ~0x1000000uLL;
}

- (void)setTriggerFireSampleCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_triggerFireSampleCount = a3;
}

- (BOOL)hasTriggerFireSampleCount
{
  return (*(_QWORD *)&self->_has >> 25) & 1;
}

- (void)setHasTriggerFireSampleCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (void)deleteTriggerFireSampleCount
{
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerFireSampleCount:](self, "setTriggerFireSampleCount:", 0);
  *(_QWORD *)&self->_has &= ~0x2000000uLL;
}

- (void)setTriggerStartNs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_triggerStartNs = a3;
}

- (BOOL)hasTriggerStartNs
{
  return (*(_QWORD *)&self->_has >> 26) & 1;
}

- (void)setHasTriggerStartNs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (void)deleteTriggerStartNs
{
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerStartNs:](self, "setTriggerStartNs:", 0);
  *(_QWORD *)&self->_has &= ~0x4000000uLL;
}

- (void)setTriggerEndNs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_triggerEndNs = a3;
}

- (BOOL)hasTriggerEndNs
{
  return (*(_QWORD *)&self->_has >> 27) & 1;
}

- (void)setHasTriggerEndNs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (void)deleteTriggerEndNs
{
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerEndNs:](self, "setTriggerEndNs:", 0);
  *(_QWORD *)&self->_has &= ~0x8000000uLL;
}

- (void)setTriggerFireNs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_triggerFireNs = a3;
}

- (BOOL)hasTriggerFireNs
{
  return (*(_QWORD *)&self->_has >> 28) & 1;
}

- (void)setHasTriggerFireNs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (void)deleteTriggerFireNs
{
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerFireNs:](self, "setTriggerFireNs:", 0);
  *(_QWORD *)&self->_has &= ~0x10000000uLL;
}

- (void)setExtraSamplesAtStart:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_extraSamplesAtStart = a3;
}

- (BOOL)hasExtraSamplesAtStart
{
  return (*(_QWORD *)&self->_has >> 29) & 1;
}

- (void)setHasExtraSamplesAtStart:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (void)deleteExtraSamplesAtStart
{
  -[MHSchemaMHVoiceTriggerEventInfo setExtraSamplesAtStart:](self, "setExtraSamplesAtStart:", 0);
  *(_QWORD *)&self->_has &= ~0x20000000uLL;
}

- (void)setAnalyzerPrependingSamples:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_analyzerPrependingSamples = a3;
}

- (BOOL)hasAnalyzerPrependingSamples
{
  return (*(_QWORD *)&self->_has >> 30) & 1;
}

- (void)setHasAnalyzerPrependingSamples:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (void)deleteAnalyzerPrependingSamples
{
  -[MHSchemaMHVoiceTriggerEventInfo setAnalyzerPrependingSamples:](self, "setAnalyzerPrependingSamples:", 0);
  *(_QWORD *)&self->_has &= ~0x40000000uLL;
}

- (void)setAnalyzerTrailingSamples:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_analyzerTrailingSamples = a3;
}

- (BOOL)hasAnalyzerTrailingSamples
{
  return (*(_QWORD *)&self->_has >> 31) & 1;
}

- (void)setHasAnalyzerTrailingSamples:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (void)deleteAnalyzerTrailingSamples
{
  -[MHSchemaMHVoiceTriggerEventInfo setAnalyzerTrailingSamples:](self, "setAnalyzerTrailingSamples:", 0);
  *(_QWORD *)&self->_has &= ~0x80000000uLL;
}

- (void)setIsTriggerEvent:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_isTriggerEvent = a3;
}

- (BOOL)hasIsTriggerEvent
{
  return HIDWORD(*(_QWORD *)&self->_has) & 1;
}

- (void)setHasIsTriggerEvent:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (void)deleteIsTriggerEvent
{
  -[MHSchemaMHVoiceTriggerEventInfo setIsTriggerEvent:](self, "setIsTriggerEvent:", 0);
  *(_QWORD *)&self->_has &= ~0x100000000uLL;
}

- (void)setTotalSampleCount:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_totalSampleCount = a3;
}

- (BOOL)hasTotalSampleCount
{
  return (*(_QWORD *)&self->_has >> 33) & 1;
}

- (void)setHasTotalSampleCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (void)deleteTotalSampleCount
{
  -[MHSchemaMHVoiceTriggerEventInfo setTotalSampleCount:](self, "setTotalSampleCount:", 0);
  *(_QWORD *)&self->_has &= ~0x200000000uLL;
}

- (void)setTriggerScore:(float)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_triggerScore = a3;
}

- (BOOL)hasTriggerScore
{
  return (*(_QWORD *)&self->_has >> 34) & 1;
}

- (void)setHasTriggerScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (void)deleteTriggerScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerScore:](self, "setTriggerScore:", v2);
  *(_QWORD *)&self->_has &= ~0x400000000uLL;
}

- (void)setIsMaximized:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_isMaximized = a3;
}

- (BOOL)hasIsMaximized
{
  return (*(_QWORD *)&self->_has >> 35) & 1;
}

- (void)setHasIsMaximized:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (void)deleteIsMaximized
{
  -[MHSchemaMHVoiceTriggerEventInfo setIsMaximized:](self, "setIsMaximized:", 0);
  *(_QWORD *)&self->_has &= ~0x800000000uLL;
}

- (void)setEffectiveThreshold:(float)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_effectiveThreshold = a3;
}

- (BOOL)hasEffectiveThreshold
{
  return (*(_QWORD *)&self->_has >> 36) & 1;
}

- (void)setHasEffectiveThreshold:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (void)deleteEffectiveThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setEffectiveThreshold:](self, "setEffectiveThreshold:", v2);
  *(_QWORD *)&self->_has &= ~0x1000000000uLL;
}

- (void)setRecognizerScore:(float)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_recognizerScore = a3;
}

- (BOOL)hasRecognizerScore
{
  return (*(_QWORD *)&self->_has >> 37) & 1;
}

- (void)setHasRecognizerScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (void)deleteRecognizerScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setRecognizerScore:](self, "setRecognizerScore:", v2);
  *(_QWORD *)&self->_has &= ~0x2000000000uLL;
}

- (void)setRecognizerThresholdOffset:(float)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_recognizerThresholdOffset = a3;
}

- (BOOL)hasRecognizerThresholdOffset
{
  return (*(_QWORD *)&self->_has >> 38) & 1;
}

- (void)setHasRecognizerThresholdOffset:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (void)deleteRecognizerThresholdOffset
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setRecognizerThresholdOffset:](self, "setRecognizerThresholdOffset:", v2);
  *(_QWORD *)&self->_has &= ~0x4000000000uLL;
}

- (void)setRecognizerWaitTimeInNs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_recognizerWaitTimeInNs = a3;
}

- (BOOL)hasRecognizerWaitTimeInNs
{
  return (*(_QWORD *)&self->_has >> 39) & 1;
}

- (void)setHasRecognizerWaitTimeInNs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (void)deleteRecognizerWaitTimeInNs
{
  -[MHSchemaMHVoiceTriggerEventInfo setRecognizerWaitTimeInNs:](self, "setRecognizerWaitTimeInNs:", 0);
  *(_QWORD *)&self->_has &= ~0x8000000000uLL;
}

- (void)setRecognizerScaleFactor:(float)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_recognizerScaleFactor = a3;
}

- (BOOL)hasRecognizerScaleFactor
{
  return (*(_QWORD *)&self->_has >> 40) & 1;
}

- (void)setHasRecognizerScaleFactor:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (void)deleteRecognizerScaleFactor
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setRecognizerScaleFactor:](self, "setRecognizerScaleFactor:", v2);
  *(_QWORD *)&self->_has &= ~0x10000000000uLL;
}

- (void)setThreshold:(float)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_threshold = a3;
}

- (BOOL)hasThreshold
{
  return (*(_QWORD *)&self->_has >> 41) & 1;
}

- (void)setHasThreshold:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (void)deleteThreshold
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setThreshold:](self, "setThreshold:", v2);
  *(_QWORD *)&self->_has &= ~0x20000000000uLL;
}

- (void)setTriggerStartTimeOffsetInNs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_triggerStartTimeOffsetInNs = a3;
}

- (BOOL)hasTriggerStartTimeOffsetInNs
{
  return (*(_QWORD *)&self->_has >> 42) & 1;
}

- (void)setHasTriggerStartTimeOffsetInNs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (void)deleteTriggerStartTimeOffsetInNs
{
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerStartTimeOffsetInNs:](self, "setTriggerStartTimeOffsetInNs:", 0);
  *(_QWORD *)&self->_has &= ~0x40000000000uLL;
}

- (void)setTriggerEndTimeOffsetInNs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_triggerEndTimeOffsetInNs = a3;
}

- (BOOL)hasTriggerEndTimeOffsetInNs
{
  return (*(_QWORD *)&self->_has >> 43) & 1;
}

- (void)setHasTriggerEndTimeOffsetInNs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (void)deleteTriggerEndTimeOffsetInNs
{
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerEndTimeOffsetInNs:](self, "setTriggerEndTimeOffsetInNs:", 0);
  *(_QWORD *)&self->_has &= ~0x80000000000uLL;
}

- (void)setTriggerFireTimeOffsetInNs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_triggerFireTimeOffsetInNs = a3;
}

- (BOOL)hasTriggerFireTimeOffsetInNs
{
  return (*(_QWORD *)&self->_has >> 44) & 1;
}

- (void)setHasTriggerFireTimeOffsetInNs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (void)deleteTriggerFireTimeOffsetInNs
{
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerFireTimeOffsetInNs:](self, "setTriggerFireTimeOffsetInNs:", 0);
  *(_QWORD *)&self->_has &= ~0x100000000000uLL;
}

- (void)setTriggerStartTime:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_triggerStartTime = a3;
}

- (BOOL)hasTriggerStartTime
{
  return (*(_QWORD *)&self->_has >> 45) & 1;
}

- (void)setHasTriggerStartTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (void)deleteTriggerStartTime
{
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerStartTime:](self, "setTriggerStartTime:", 0.0);
  *(_QWORD *)&self->_has &= ~0x200000000000uLL;
}

- (void)setTriggerEndTime:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_triggerEndTime = a3;
}

- (BOOL)hasTriggerEndTime
{
  return (*(_QWORD *)&self->_has >> 46) & 1;
}

- (void)setHasTriggerEndTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (void)deleteTriggerEndTime
{
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerEndTime:](self, "setTriggerEndTime:", 0.0);
  *(_QWORD *)&self->_has &= ~0x400000000000uLL;
}

- (void)setTriggerFiredTime:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_triggerFiredTime = a3;
}

- (BOOL)hasTriggerFiredTime
{
  return (*(_QWORD *)&self->_has >> 47) & 1;
}

- (void)setHasTriggerFiredTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (void)deleteTriggerFiredTime
{
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerFiredTime:](self, "setTriggerFiredTime:", 0.0);
  *(_QWORD *)&self->_has &= ~0x800000000000uLL;
}

- (void)setHardwareSamplerate:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_hardwareSamplerate = a3;
}

- (BOOL)hasHardwareSamplerate
{
  return HIWORD(*(_QWORD *)&self->_has) & 1;
}

- (void)setHasHardwareSamplerate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (void)deleteHardwareSamplerate
{
  -[MHSchemaMHVoiceTriggerEventInfo setHardwareSamplerate:](self, "setHardwareSamplerate:", 0);
  *(_QWORD *)&self->_has &= ~0x1000000000000uLL;
}

- (void)setIsContinuous:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_isContinuous = a3;
}

- (BOOL)hasIsContinuous
{
  return (*(_QWORD *)&self->_has >> 49) & 1;
}

- (void)setHasIsContinuous:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (void)deleteIsContinuous
{
  -[MHSchemaMHVoiceTriggerEventInfo setIsContinuous:](self, "setIsContinuous:", 0);
  *(_QWORD *)&self->_has &= ~0x2000000000000uLL;
}

- (void)setTriggerDurationInNs:(float)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_triggerDurationInNs = a3;
}

- (BOOL)hasTriggerDurationInNs
{
  return (*(_QWORD *)&self->_has >> 50) & 1;
}

- (void)setHasTriggerDurationInNs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (void)deleteTriggerDurationInNs
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerDurationInNs:](self, "setTriggerDurationInNs:", v2);
  *(_QWORD *)&self->_has &= ~0x4000000000000uLL;
}

- (void)setTotalSamplesAtTriggerStart:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_totalSamplesAtTriggerStart = a3;
}

- (BOOL)hasTotalSamplesAtTriggerStart
{
  return (*(_QWORD *)&self->_has >> 51) & 1;
}

- (void)setHasTotalSamplesAtTriggerStart:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (void)deleteTotalSamplesAtTriggerStart
{
  -[MHSchemaMHVoiceTriggerEventInfo setTotalSamplesAtTriggerStart:](self, "setTotalSamplesAtTriggerStart:", 0);
  *(_QWORD *)&self->_has &= ~0x8000000000000uLL;
}

- (void)setTotalSamplesAtTriggerEnd:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_totalSamplesAtTriggerEnd = a3;
}

- (BOOL)hasTotalSamplesAtTriggerEnd
{
  return (*(_QWORD *)&self->_has >> 52) & 1;
}

- (void)setHasTotalSamplesAtTriggerEnd:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (void)deleteTotalSamplesAtTriggerEnd
{
  -[MHSchemaMHVoiceTriggerEventInfo setTotalSamplesAtTriggerEnd:](self, "setTotalSamplesAtTriggerEnd:", 0);
  *(_QWORD *)&self->_has &= ~0x10000000000000uLL;
}

- (void)setTotalSamplesAtEndOfCapture:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_totalSamplesAtEndOfCapture = a3;
}

- (BOOL)hasTotalSamplesAtEndOfCapture
{
  return (*(_QWORD *)&self->_has >> 53) & 1;
}

- (void)setHasTotalSamplesAtEndOfCapture:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (void)deleteTotalSamplesAtEndOfCapture
{
  -[MHSchemaMHVoiceTriggerEventInfo setTotalSamplesAtEndOfCapture:](self, "setTotalSamplesAtEndOfCapture:", 0);
  *(_QWORD *)&self->_has &= ~0x20000000000000uLL;
}

- (BOOL)hasConfigVersion
{
  return self->_configVersion != 0;
}

- (void)deleteConfigVersion
{
  -[MHSchemaMHVoiceTriggerEventInfo setConfigVersion:](self, "setConfigVersion:", 0);
}

- (BOOL)hasConfigPath
{
  return self->_configPath != 0;
}

- (void)deleteConfigPath
{
  -[MHSchemaMHVoiceTriggerEventInfo setConfigPath:](self, "setConfigPath:", 0);
}

- (void)setIsSecondChance:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_isSecondChance = a3;
}

- (BOOL)hasIsSecondChance
{
  return (*(_QWORD *)&self->_has >> 54) & 1;
}

- (void)setHasIsSecondChance:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (void)deleteIsSecondChance
{
  -[MHSchemaMHVoiceTriggerEventInfo setIsSecondChance:](self, "setIsSecondChance:", 0);
  *(_QWORD *)&self->_has &= ~0x40000000000000uLL;
}

- (void)setDeviceHandheld:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_deviceHandheld = a3;
}

- (BOOL)hasDeviceHandheld
{
  return (*(_QWORD *)&self->_has >> 55) & 1;
}

- (void)setHasDeviceHandheld:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (void)deleteDeviceHandheld
{
  -[MHSchemaMHVoiceTriggerEventInfo setDeviceHandheld:](self, "setDeviceHandheld:", 0);
  *(_QWORD *)&self->_has &= ~0x80000000000000uLL;
}

- (void)setActiveChannel:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_activeChannel = a3;
}

- (BOOL)hasActiveChannel
{
  return HIBYTE(*(_QWORD *)&self->_has) & 1;
}

- (void)setHasActiveChannel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (void)deleteActiveChannel
{
  -[MHSchemaMHVoiceTriggerEventInfo setActiveChannel:](self, "setActiveChannel:", 0);
  *(_QWORD *)&self->_has &= ~0x100000000000000uLL;
}

- (void)setTwoShotAudibleFeedbackDelayInNs:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_twoShotAudibleFeedbackDelayInNs = a3;
}

- (BOOL)hasTwoShotAudibleFeedbackDelayInNs
{
  return (*(_QWORD *)&self->_has >> 57) & 1;
}

- (void)setHasTwoShotAudibleFeedbackDelayInNs:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (void)deleteTwoShotAudibleFeedbackDelayInNs
{
  -[MHSchemaMHVoiceTriggerEventInfo setTwoShotAudibleFeedbackDelayInNs:](self, "setTwoShotAudibleFeedbackDelayInNs:", 0);
  *(_QWORD *)&self->_has &= ~0x200000000000000uLL;
}

- (void)setCumulativeUptimeInSec:(float)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_cumulativeUptimeInSec = a3;
}

- (BOOL)hasCumulativeUptimeInSec
{
  return (*(_QWORD *)&self->_has >> 58) & 1;
}

- (void)setHasCumulativeUptimeInSec:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (void)deleteCumulativeUptimeInSec
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setCumulativeUptimeInSec:](self, "setCumulativeUptimeInSec:", v2);
  *(_QWORD *)&self->_has &= ~0x400000000000000uLL;
}

- (void)setCumulativeDowntimeInSec:(float)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_cumulativeDowntimeInSec = a3;
}

- (BOOL)hasCumulativeDowntimeInSec
{
  return (*(_QWORD *)&self->_has >> 59) & 1;
}

- (void)setHasCumulativeDowntimeInSec:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (void)deleteCumulativeDowntimeInSec
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setCumulativeDowntimeInSec:](self, "setCumulativeDowntimeInSec:", v2);
  *(_QWORD *)&self->_has &= ~0x800000000000000uLL;
}

- (void)setHostPowerStateAtTrigger:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_hostPowerStateAtTrigger = a3;
}

- (BOOL)hasHostPowerStateAtTrigger
{
  return (*(_QWORD *)&self->_has >> 60) & 1;
}

- (void)setHasHostPowerStateAtTrigger:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (void)deleteHostPowerStateAtTrigger
{
  -[MHSchemaMHVoiceTriggerEventInfo setHostPowerStateAtTrigger:](self, "setHostPowerStateAtTrigger:", 0);
  *(_QWORD *)&self->_has &= ~0x1000000000000000uLL;
}

- (void)setIsMediaPlaying:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  self->_isMediaPlaying = a3;
}

- (BOOL)hasIsMediaPlaying
{
  return (*(_QWORD *)&self->_has >> 61) & 1;
}

- (void)setHasIsMediaPlaying:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (void)deleteIsMediaPlaying
{
  -[MHSchemaMHVoiceTriggerEventInfo setIsMediaPlaying:](self, "setIsMediaPlaying:", 0);
  *(_QWORD *)&self->_has &= ~0x2000000000000000uLL;
}

- (void)setMediaVolume:(float)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  self->_mediaVolume = a3;
}

- (BOOL)hasMediaVolume
{
  return (*(_QWORD *)&self->_has >> 62) & 1;
}

- (void)setHasMediaVolume:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (void)deleteMediaVolume
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setMediaVolume:](self, "setMediaVolume:", v2);
  *(_QWORD *)&self->_has &= ~0x4000000000000000uLL;
}

- (BOOL)hasAudioProviderUUID
{
  return self->_audioProviderUUID != 0;
}

- (void)deleteAudioProviderUUID
{
  -[MHSchemaMHVoiceTriggerEventInfo setAudioProviderUUID:](self, "setAudioProviderUUID:", 0);
}

- (void)setOnBatteryPower:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  self->_onBatteryPower = a3;
}

- (BOOL)hasOnBatteryPower
{
  return *(_QWORD *)&self->_has >> 63;
}

- (void)setHasOnBatteryPower:(BOOL)a3
{
  unint64_t v3;

  v3 = 0x8000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = v3 & 0x8000000000000000 | *(_QWORD *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (void)deleteOnBatteryPower
{
  -[MHSchemaMHVoiceTriggerEventInfo setOnBatteryPower:](self, "setOnBatteryPower:", 0);
  *(_QWORD *)&self->_has &= ~0x8000000000000000;
}

- (void)setDidWakeAP:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 1u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_didWakeAP = a3;
}

- (BOOL)hasDidWakeAP
{
  return *((_WORD *)&self->_has + 4) & 1;
}

- (void)setHasDidWakeAP:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFE | a3;
}

- (void)deleteDidWakeAP
{
  -[MHSchemaMHVoiceTriggerEventInfo setDidWakeAP:](self, "setDidWakeAP:", 0);
  *((_WORD *)&self->_has + 4) &= ~1u;
}

- (void)setUptimeInSec:(float)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 2u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_uptimeInSec = a3;
}

- (BOOL)hasUptimeInSec
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 1) & 1;
}

- (void)setHasUptimeInSec:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFFD | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 2;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFD | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteUptimeInSec
{
  double v2;
  int v4;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setUptimeInSec:](self, "setUptimeInSec:", v2);
  v4 = *((_WORD *)&self->_has + 4) & 0xFFFD | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~2u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v4);
}

- (void)setDowntimeInSec:(float)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 4u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_downtimeInSec = a3;
}

- (BOOL)hasDowntimeInSec
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 2) & 1;
}

- (void)setHasDowntimeInSec:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFFB | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 4;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFB | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteDowntimeInSec
{
  double v2;
  int v4;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setDowntimeInSec:](self, "setDowntimeInSec:", v2);
  v4 = *((_WORD *)&self->_has + 4) & 0xFFFB | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~4u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v4);
}

- (void)setLastConsecutiveVTRejects:(unsigned int)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 8u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_lastConsecutiveVTRejects = a3;
}

- (BOOL)hasLastConsecutiveVTRejects
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 3) & 1;
}

- (void)setHasLastConsecutiveVTRejects:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 8;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFF7 | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteLastConsecutiveVTRejects
{
  int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setLastConsecutiveVTRejects:](self, "setLastConsecutiveVTRejects:", 0);
  v3 = *((_WORD *)&self->_has + 4) & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~8u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasCaptureFilePath
{
  return self->_captureFilePath != 0;
}

- (void)deleteCaptureFilePath
{
  -[MHSchemaMHVoiceTriggerEventInfo setCaptureFilePath:](self, "setCaptureFilePath:", 0);
}

- (BOOL)hasConfigDataHash
{
  return self->_configDataHash != 0;
}

- (void)deleteConfigDataHash
{
  -[MHSchemaMHVoiceTriggerEventInfo setConfigDataHash:](self, "setConfigDataHash:", 0);
}

- (void)setSiriIsActiveOrOtherAssertion:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x10u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_siriIsActiveOrOtherAssertion = a3;
}

- (BOOL)hasSiriIsActiveOrOtherAssertion
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 4) & 1;
}

- (void)setHasSiriIsActiveOrOtherAssertion:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFEF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 16;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFEF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteSiriIsActiveOrOtherAssertion
{
  int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setSiriIsActiveOrOtherAssertion:](self, "setSiriIsActiveOrOtherAssertion:", 0);
  v3 = *((_WORD *)&self->_has + 4) & 0xFFEF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x10u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setDidAudioStall:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x20u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_didAudioStall = a3;
}

- (BOOL)hasDidAudioStall
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 5) & 1;
}

- (void)setHasDidAudioStall:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFDF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 32;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFDF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteDidAudioStall
{
  int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setDidAudioStall:](self, "setDidAudioStall:", 0);
  v3 = *((_WORD *)&self->_has + 4) & 0xFFDF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x20u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setIsBargeIn:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x40u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isBargeIn = a3;
}

- (BOOL)hasIsBargeIn
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 6) & 1;
}

- (void)setHasIsBargeIn:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFBF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 64;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFBF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteIsBargeIn
{
  int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setIsBargeIn:](self, "setIsBargeIn:", 0);
  v3 = *((_WORD *)&self->_has + 4) & 0xFFBF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x40u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setIsWakeFromSleep:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x80u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isWakeFromSleep = a3;
}

- (BOOL)hasIsWakeFromSleep
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 7) & 1;
}

- (void)setHasIsWakeFromSleep:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFF7F | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 128;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFF7F | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteIsWakeFromSleep
{
  int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setIsWakeFromSleep:](self, "setIsWakeFromSleep:", 0);
  v3 = *((_WORD *)&self->_has + 4) & 0xFF7F | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x80u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setSecondPassAssetQueryStartTimeInNs:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x100u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_secondPassAssetQueryStartTimeInNs = a3;
}

- (BOOL)hasSecondPassAssetQueryStartTimeInNs
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 8) & 1;
}

- (void)setHasSecondPassAssetQueryStartTimeInNs:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFEFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 256;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFEFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteSecondPassAssetQueryStartTimeInNs
{
  int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAssetQueryStartTimeInNs:](self, "setSecondPassAssetQueryStartTimeInNs:", 0);
  v3 = *((_WORD *)&self->_has + 4) & 0xFEFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x100u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setSecondPassAssetQueryCompleteTimeInNs:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x200u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_secondPassAssetQueryCompleteTimeInNs = a3;
}

- (BOOL)hasSecondPassAssetQueryCompleteTimeInNs
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 9) & 1;
}

- (void)setHasSecondPassAssetQueryCompleteTimeInNs:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFDFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 512;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFDFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteSecondPassAssetQueryCompleteTimeInNs
{
  int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAssetQueryCompleteTimeInNs:](self, "setSecondPassAssetQueryCompleteTimeInNs:", 0);
  v3 = *((_WORD *)&self->_has + 4) & 0xFDFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x200u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setSecondPassAssetLoadStartTimeInNs:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x400u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_secondPassAssetLoadStartTimeInNs = a3;
}

- (BOOL)hasSecondPassAssetLoadStartTimeInNs
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 10) & 1;
}

- (void)setHasSecondPassAssetLoadStartTimeInNs:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFBFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 1024;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFBFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteSecondPassAssetLoadStartTimeInNs
{
  int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAssetLoadStartTimeInNs:](self, "setSecondPassAssetLoadStartTimeInNs:", 0);
  v3 = *((_WORD *)&self->_has + 4) & 0xFBFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x400u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setSecondPassAssetLoadCompleteTimeInNs:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x800u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_secondPassAssetLoadCompleteTimeInNs = a3;
}

- (BOOL)hasSecondPassAssetLoadCompleteTimeInNs
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 11) & 1;
}

- (void)setHasSecondPassAssetLoadCompleteTimeInNs:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xF7FF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 2048;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xF7FF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteSecondPassAssetLoadCompleteTimeInNs
{
  int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAssetLoadCompleteTimeInNs:](self, "setSecondPassAssetLoadCompleteTimeInNs:", 0);
  v3 = *((_WORD *)&self->_has + 4) & 0xF7FF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x800u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setSecondPassAudioStreamStartTimeInNs:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x1000u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_secondPassAudioStreamStartTimeInNs = a3;
}

- (BOOL)hasSecondPassAudioStreamStartTimeInNs
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 12) & 1;
}

- (void)setHasSecondPassAudioStreamStartTimeInNs:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xEFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 4096;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xEFFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteSecondPassAudioStreamStartTimeInNs
{
  int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAudioStreamStartTimeInNs:](self, "setSecondPassAudioStreamStartTimeInNs:", 0);
  v3 = *((_WORD *)&self->_has + 4) & 0xEFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x1000u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setSecondPassAudioStreamReadyTimeInNs:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x2000u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_secondPassAudioStreamReadyTimeInNs = a3;
}

- (BOOL)hasSecondPassAudioStreamReadyTimeInNs
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 13) & 1;
}

- (void)setHasSecondPassAudioStreamReadyTimeInNs:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xDFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 0x2000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xDFFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteSecondPassAudioStreamReadyTimeInNs
{
  int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAudioStreamReadyTimeInNs:](self, "setSecondPassAudioStreamReadyTimeInNs:", 0);
  v3 = *((_WORD *)&self->_has + 4) & 0xDFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x2000u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setSecondPassFirstAudioPacketReceptionTimeInNs:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x4000u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_secondPassFirstAudioPacketReceptionTimeInNs = a3;
}

- (BOOL)hasSecondPassFirstAudioPacketReceptionTimeInNs
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 14) & 1;
}

- (void)setHasSecondPassFirstAudioPacketReceptionTimeInNs:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xBFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 0x4000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xBFFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteSecondPassFirstAudioPacketReceptionTimeInNs
{
  int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setSecondPassFirstAudioPacketReceptionTimeInNs:](self, "setSecondPassFirstAudioPacketReceptionTimeInNs:", 0);
  v3 = *((_WORD *)&self->_has + 4) & 0xBFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x4000u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setSecondPassLastAudioPacketReceptionTimeInNs:(unint64_t)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x8000u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_secondPassLastAudioPacketReceptionTimeInNs = a3;
}

- (BOOL)hasSecondPassLastAudioPacketReceptionTimeInNs
{
  return (unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 15;
}

- (void)setHasSecondPassLastAudioPacketReceptionTimeInNs:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0x7FFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 0x8000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0x7FFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)deleteSecondPassLastAudioPacketReceptionTimeInNs
{
  int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setSecondPassLastAudioPacketReceptionTimeInNs:](self, "setSecondPassLastAudioPacketReceptionTimeInNs:", 0);
  v3 = *((_WORD *)&self->_has + 4) & 0x7FFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  *((_WORD *)&self->_has + 4) &= ~0x8000u;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setSecondPassCheckerModelKeywordDetectionStartTimeInNs:(unint64_t)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x10000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_secondPassCheckerModelKeywordDetectionStartTimeInNs = a3;
}

- (BOOL)hasSecondPassCheckerModelKeywordDetectionStartTimeInNs
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 16) & 1;
}

- (void)setHasSecondPassCheckerModelKeywordDetectionStartTimeInNs:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFEFFFF;
  if (a3)
    v4 = 0x10000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (void)deleteSecondPassCheckerModelKeywordDetectionStartTimeInNs
{
  unsigned int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setSecondPassCheckerModelKeywordDetectionStartTimeInNs:](self, "setSecondPassCheckerModelKeywordDetectionStartTimeInNs:", 0);
  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFEFFFF;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setSecondPassCheckerModelKeywordDetectionEndTimeInNs:(unint64_t)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x20000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_secondPassCheckerModelKeywordDetectionEndTimeInNs = a3;
}

- (BOOL)hasSecondPassCheckerModelKeywordDetectionEndTimeInNs
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 17) & 1;
}

- (void)setHasSecondPassCheckerModelKeywordDetectionEndTimeInNs:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFDFFFF;
  if (a3)
    v4 = 0x20000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (void)deleteSecondPassCheckerModelKeywordDetectionEndTimeInNs
{
  unsigned int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setSecondPassCheckerModelKeywordDetectionEndTimeInNs:](self, "setSecondPassCheckerModelKeywordDetectionEndTimeInNs:", 0);
  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFDFFFF;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasTriggerPhrase
{
  return self->_triggerPhrase != 0;
}

- (void)deleteTriggerPhrase
{
  -[MHSchemaMHVoiceTriggerEventInfo setTriggerPhrase:](self, "setTriggerPhrase:", 0);
}

- (void)setLastDisplayWakeTimeOffsetInNs:(double)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x40000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_lastDisplayWakeTimeOffsetInNs = a3;
}

- (BOOL)hasLastDisplayWakeTimeOffsetInNs
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 18) & 1;
}

- (void)setHasLastDisplayWakeTimeOffsetInNs:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFBFFFF;
  if (a3)
    v4 = 0x40000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (void)deleteLastDisplayWakeTimeOffsetInNs
{
  unsigned int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setLastDisplayWakeTimeOffsetInNs:](self, "setLastDisplayWakeTimeOffsetInNs:", 0.0);
  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFBFFFF;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setIsHSJSTriggerFromAlwaysOnMicBuffer:(BOOL)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x80000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_isHSJSTriggerFromAlwaysOnMicBuffer = a3;
}

- (BOOL)hasIsHSJSTriggerFromAlwaysOnMicBuffer
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 19) & 1;
}

- (void)setHasIsHSJSTriggerFromAlwaysOnMicBuffer:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFF7FFFF;
  if (a3)
    v4 = 0x80000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (void)deleteIsHSJSTriggerFromAlwaysOnMicBuffer
{
  unsigned int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setIsHSJSTriggerFromAlwaysOnMicBuffer:](self, "setIsHSJSTriggerFromAlwaysOnMicBuffer:", 0);
  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFF7FFFF;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setDisplayWakeTimeOffsetInNs:(unint64_t)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x100000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_displayWakeTimeOffsetInNs = a3;
}

- (BOOL)hasDisplayWakeTimeOffsetInNs
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 20) & 1;
}

- (void)setHasDisplayWakeTimeOffsetInNs:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFEFFFFF;
  if (a3)
    v4 = 0x100000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (void)deleteDisplayWakeTimeOffsetInNs
{
  unsigned int v3;

  -[MHSchemaMHVoiceTriggerEventInfo setDisplayWakeTimeOffsetInNs:](self, "setDisplayWakeTimeOffsetInNs:", 0);
  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFEFFFFF;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (void)setNeptuneDetectionApiScore:(float)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x200000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_neptuneDetectionApiScore = a3;
}

- (BOOL)hasNeptuneDetectionApiScore
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 21) & 1;
}

- (void)setHasNeptuneDetectionApiScore:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFDFFFFF;
  if (a3)
    v4 = 0x200000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (void)deleteNeptuneDetectionApiScore
{
  double v2;
  unsigned int v4;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerEventInfo setNeptuneDetectionApiScore:](self, "setNeptuneDetectionApiScore:", v2);
  v4 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFDFFFFF;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = BYTE2(v4);
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaMHVoiceTriggerEventInfoReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  $C31C01E161EA92E87F150FC44992F13F *p_has;
  uint64_t has;
  void *v6;
  void *v7;
  $C31C01E161EA92E87F150FC44992F13F *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int16 v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  int v19;
  id v20;

  v20 = a3;
  p_has = &self->_has;
  has = (uint64_t)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_108;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteUint32Field();
  has = (uint64_t)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteUint32Field();
  has = (uint64_t)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_16:
    if ((has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_17:
    if ((has & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_18:
    if ((has & 0x20000) == 0)
      goto LABEL_19;
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x20000) == 0)
  {
LABEL_19:
    if ((has & 0x40000) == 0)
      goto LABEL_20;
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x40000) == 0)
  {
LABEL_20:
    if ((has & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x80000) == 0)
  {
LABEL_21:
    if ((has & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x100000) == 0)
  {
LABEL_22:
    if ((has & 0x200000) == 0)
      goto LABEL_23;
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_23:
    if ((has & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteInt32Field();
  has = (uint64_t)self->_has;
  if ((has & 0x400000) == 0)
  {
LABEL_24:
    if ((has & 0x800000) == 0)
      goto LABEL_25;
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x800000) == 0)
  {
LABEL_25:
    if ((has & 0x1000000) == 0)
      goto LABEL_26;
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x1000000) == 0)
  {
LABEL_26:
    if ((has & 0x2000000) == 0)
      goto LABEL_27;
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x2000000) == 0)
  {
LABEL_27:
    if ((has & 0x4000000) == 0)
      goto LABEL_28;
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x4000000) == 0)
  {
LABEL_28:
    if ((has & 0x8000000) == 0)
      goto LABEL_29;
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x8000000) == 0)
  {
LABEL_29:
    if ((has & 0x10000000) == 0)
      goto LABEL_30;
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x10000000) == 0)
  {
LABEL_30:
    if ((has & 0x20000000) == 0)
      goto LABEL_31;
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_31:
    if ((has & 0x40000000) == 0)
      goto LABEL_32;
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x40000000) == 0)
  {
LABEL_32:
    if ((has & 0x80000000) == 0)
      goto LABEL_33;
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x80000000) == 0)
  {
LABEL_33:
    if ((has & 0x100000000) == 0)
      goto LABEL_34;
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x100000000) == 0)
  {
LABEL_34:
    if ((has & 0x200000000) == 0)
      goto LABEL_35;
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  if ((has & 0x200000000) == 0)
  {
LABEL_35:
    if ((has & 0x400000000) == 0)
      goto LABEL_36;
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x400000000) == 0)
  {
LABEL_36:
    if ((has & 0x800000000) == 0)
      goto LABEL_37;
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x800000000) == 0)
  {
LABEL_37:
    if ((has & 0x1000000000) == 0)
      goto LABEL_38;
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  if ((has & 0x1000000000) == 0)
  {
LABEL_38:
    if ((has & 0x2000000000) == 0)
      goto LABEL_39;
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x2000000000) == 0)
  {
LABEL_39:
    if ((has & 0x4000000000) == 0)
      goto LABEL_40;
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x4000000000) == 0)
  {
LABEL_40:
    if ((has & 0x8000000000) == 0)
      goto LABEL_41;
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x8000000000) == 0)
  {
LABEL_41:
    if ((has & 0x10000000000) == 0)
      goto LABEL_42;
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x10000000000) == 0)
  {
LABEL_42:
    if ((has & 0x20000000000) == 0)
      goto LABEL_43;
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x20000000000) == 0)
  {
LABEL_43:
    if ((has & 0x40000000000) == 0)
      goto LABEL_44;
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_44:
    if ((has & 0x80000000000) == 0)
      goto LABEL_45;
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x80000000000) == 0)
  {
LABEL_45:
    if ((has & 0x100000000000) == 0)
      goto LABEL_46;
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x100000000000) == 0)
  {
LABEL_46:
    if ((has & 0x200000000000) == 0)
      goto LABEL_47;
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x200000000000) == 0)
  {
LABEL_47:
    if ((has & 0x400000000000) == 0)
      goto LABEL_48;
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteDoubleField();
  has = (uint64_t)self->_has;
  if ((has & 0x400000000000) == 0)
  {
LABEL_48:
    if ((has & 0x800000000000) == 0)
      goto LABEL_49;
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteDoubleField();
  has = (uint64_t)self->_has;
  if ((has & 0x800000000000) == 0)
  {
LABEL_49:
    if ((has & 0x1000000000000) == 0)
      goto LABEL_50;
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteDoubleField();
  has = (uint64_t)self->_has;
  if ((has & 0x1000000000000) == 0)
  {
LABEL_50:
    if ((has & 0x2000000000000) == 0)
      goto LABEL_51;
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteUint32Field();
  has = (uint64_t)self->_has;
  if ((has & 0x2000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x4000000000000) == 0)
      goto LABEL_52;
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  if ((has & 0x4000000000000) == 0)
  {
LABEL_52:
    if ((has & 0x8000000000000) == 0)
      goto LABEL_53;
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteFloatField();
  has = (uint64_t)self->_has;
  if ((has & 0x8000000000000) == 0)
  {
LABEL_53:
    if ((has & 0x10000000000000) == 0)
      goto LABEL_54;
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteUint64Field();
  has = (uint64_t)self->_has;
  if ((has & 0x10000000000000) == 0)
  {
LABEL_54:
    if ((has & 0x20000000000000) == 0)
      goto LABEL_56;
    goto LABEL_55;
  }
LABEL_158:
  PBDataWriterWriteUint64Field();
  if ((*(_QWORD *)&self->_has & 0x20000000000000) != 0)
LABEL_55:
    PBDataWriterWriteUint64Field();
LABEL_56:
  -[MHSchemaMHVoiceTriggerEventInfo configVersion](self, "configVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[MHSchemaMHVoiceTriggerEventInfo configPath](self, "configPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  v8 = &self->_has;
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x40000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v9 = *(_QWORD *)v8;
    if ((*(_QWORD *)v8 & 0x80000000000000) == 0)
    {
LABEL_62:
      if ((v9 & 0x100000000000000) == 0)
        goto LABEL_63;
      goto LABEL_162;
    }
  }
  else if ((v9 & 0x80000000000000) == 0)
  {
    goto LABEL_62;
  }
  PBDataWriterWriteBOOLField();
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x100000000000000) == 0)
  {
LABEL_63:
    if ((v9 & 0x200000000000000) == 0)
      goto LABEL_64;
    goto LABEL_163;
  }
LABEL_162:
  PBDataWriterWriteUint32Field();
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x200000000000000) == 0)
  {
LABEL_64:
    if ((v9 & 0x400000000000000) == 0)
      goto LABEL_65;
    goto LABEL_164;
  }
LABEL_163:
  PBDataWriterWriteUint64Field();
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x400000000000000) == 0)
  {
LABEL_65:
    if ((v9 & 0x800000000000000) == 0)
      goto LABEL_66;
    goto LABEL_165;
  }
LABEL_164:
  PBDataWriterWriteFloatField();
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x800000000000000) == 0)
  {
LABEL_66:
    if ((v9 & 0x1000000000000000) == 0)
      goto LABEL_67;
    goto LABEL_166;
  }
LABEL_165:
  PBDataWriterWriteFloatField();
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x1000000000000000) == 0)
  {
LABEL_67:
    if ((v9 & 0x2000000000000000) == 0)
      goto LABEL_68;
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteInt32Field();
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x2000000000000000) == 0)
  {
LABEL_68:
    if ((v9 & 0x4000000000000000) == 0)
      goto LABEL_70;
    goto LABEL_69;
  }
LABEL_167:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x4000000000000000) != 0)
LABEL_69:
    PBDataWriterWriteFloatField();
LABEL_70:
  -[MHSchemaMHVoiceTriggerEventInfo audioProviderUUID](self, "audioProviderUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MHSchemaMHVoiceTriggerEventInfo audioProviderUUID](self, "audioProviderUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_QWORD *)&self->_has & 0x8000000000000000) != 0)
    PBDataWriterWriteBOOLField();
  LOBYTE(v12) = *((_WORD *)&self->_has + 4);
  if ((*((_WORD *)&self->_has + 4) & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v12 = *((_WORD *)&self->_has + 4);
    if ((v12 & 2) == 0)
    {
LABEL_76:
      if ((v12 & 4) == 0)
        goto LABEL_77;
      goto LABEL_171;
    }
  }
  else if ((*((_WORD *)&self->_has + 4) & 2) == 0)
  {
    goto LABEL_76;
  }
  PBDataWriterWriteFloatField();
  v12 = *((_WORD *)&self->_has + 4);
  if ((v12 & 4) == 0)
  {
LABEL_77:
    if ((v12 & 8) == 0)
      goto LABEL_79;
    goto LABEL_78;
  }
LABEL_171:
  PBDataWriterWriteFloatField();
  if ((*((_WORD *)&self->_has + 4) & 8) != 0)
LABEL_78:
    PBDataWriterWriteUint32Field();
LABEL_79:
  -[MHSchemaMHVoiceTriggerEventInfo captureFilePath](self, "captureFilePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    PBDataWriterWriteStringField();
  -[MHSchemaMHVoiceTriggerEventInfo configDataHash](self, "configDataHash");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    PBDataWriterWriteStringField();
  v15 = *((unsigned __int16 *)&self->_has + 4);
  v16 = v15 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v15 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v19 = *((unsigned __int16 *)&self->_has + 4);
    v16 = v19 | (*((unsigned __int8 *)&self->_has + 10) << 16);
    if ((v19 & 0x20) == 0)
    {
LABEL_85:
      if ((v16 & 0x40) == 0)
        goto LABEL_86;
      goto LABEL_175;
    }
  }
  else if ((v15 & 0x20) == 0)
  {
    goto LABEL_85;
  }
  PBDataWriterWriteBOOLField();
  v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x40) == 0)
  {
LABEL_86:
    if ((v16 & 0x80) == 0)
      goto LABEL_87;
    goto LABEL_176;
  }
LABEL_175:
  PBDataWriterWriteBOOLField();
  v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
  {
LABEL_87:
    if ((v16 & 0x100) == 0)
      goto LABEL_88;
    goto LABEL_177;
  }
LABEL_176:
  PBDataWriterWriteBOOLField();
  v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x100) == 0)
  {
LABEL_88:
    if ((v16 & 0x200) == 0)
      goto LABEL_89;
    goto LABEL_178;
  }
LABEL_177:
  PBDataWriterWriteUint64Field();
  v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x200) == 0)
  {
LABEL_89:
    if ((v16 & 0x400) == 0)
      goto LABEL_90;
    goto LABEL_179;
  }
LABEL_178:
  PBDataWriterWriteUint64Field();
  v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x400) == 0)
  {
LABEL_90:
    if ((v16 & 0x800) == 0)
      goto LABEL_91;
    goto LABEL_180;
  }
LABEL_179:
  PBDataWriterWriteUint64Field();
  v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x800) == 0)
  {
LABEL_91:
    if ((v16 & 0x1000) == 0)
      goto LABEL_92;
    goto LABEL_181;
  }
LABEL_180:
  PBDataWriterWriteUint64Field();
  v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x1000) == 0)
  {
LABEL_92:
    if ((v16 & 0x2000) == 0)
      goto LABEL_93;
    goto LABEL_182;
  }
LABEL_181:
  PBDataWriterWriteUint64Field();
  v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x2000) == 0)
  {
LABEL_93:
    if ((v16 & 0x4000) == 0)
      goto LABEL_94;
    goto LABEL_183;
  }
LABEL_182:
  PBDataWriterWriteUint64Field();
  v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x4000) == 0)
  {
LABEL_94:
    if ((v16 & 0x8000) == 0)
      goto LABEL_95;
    goto LABEL_184;
  }
LABEL_183:
  PBDataWriterWriteUint64Field();
  v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x8000) == 0)
  {
LABEL_95:
    if ((v16 & 0x10000) == 0)
      goto LABEL_96;
    goto LABEL_185;
  }
LABEL_184:
  PBDataWriterWriteUint64Field();
  v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v16 & 0x10000) == 0)
  {
LABEL_96:
    if ((v16 & 0x20000) == 0)
      goto LABEL_98;
    goto LABEL_97;
  }
LABEL_185:
  PBDataWriterWriteUint64Field();
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x20000) != 0)
LABEL_97:
    PBDataWriterWriteUint64Field();
LABEL_98:
  -[MHSchemaMHVoiceTriggerEventInfo triggerPhrase](self, "triggerPhrase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteStringField();
  v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v18 & 0x40000) != 0)
  {
    PBDataWriterWriteDoubleField();
    v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    if ((v18 & 0x80000) == 0)
    {
LABEL_102:
      if ((v18 & 0x100000) == 0)
        goto LABEL_103;
LABEL_189:
      PBDataWriterWriteUint64Field();
      if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x200000) == 0)
        goto LABEL_105;
      goto LABEL_104;
    }
  }
  else if ((v18 & 0x80000) == 0)
  {
    goto LABEL_102;
  }
  PBDataWriterWriteBOOLField();
  v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v18 & 0x100000) != 0)
    goto LABEL_189;
LABEL_103:
  if ((v18 & 0x200000) != 0)
LABEL_104:
    PBDataWriterWriteFloatField();
LABEL_105:

}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  unint64_t has;
  unint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t secondPassAnalyerStartSampleCount;
  unsigned int v10;
  unint64_t secondPassAnalyerEndSampleCount;
  unsigned int v12;
  float satScore;
  float v14;
  unsigned int v15;
  unsigned int satNumTrainingUtterances;
  unsigned int v17;
  float satThreshold;
  float v19;
  unsigned int v20;
  int satTriggered;
  unsigned int v22;
  float tdSpeakerRecognizerScore;
  float v24;
  unsigned int v25;
  float tdSpeakerRecognizerCombinedScore;
  float v27;
  unsigned int v28;
  float tdSpeakerRecognizerCombinedThreshold;
  float v30;
  unsigned int v31;
  float tdSpeakerRecognizerCombinationWeight;
  float v33;
  unsigned int v34;
  int biometricClue;
  unsigned int v36;
  int satBeingTrained;
  unsigned int v38;
  unsigned int lastConsecutivePHSRejects;
  unsigned int v40;
  unint64_t deltaTimeInNsFromlastPHSReject;
  unsigned int v42;
  float triggerExplicitSatScore;
  float v44;
  unsigned int v45;
  float triggerExplicitTDSRSatScore;
  float v47;
  unsigned int v48;
  float shadowMicScore;
  float v50;
  unsigned int v51;
  float shadowMicScoreThresholdForVAD;
  float v53;
  unsigned int v54;
  float remoteMicVADScore;
  float v56;
  unsigned int v57;
  float remoteMicVADThreshold;
  float v59;
  unsigned int v60;
  float remoteMicVADMyriadThreshold;
  float v62;
  unsigned int v63;
  int enhancedCarplayTriggerMode;
  unsigned int v65;
  unint64_t triggerStartSampleCount;
  unsigned int v67;
  unint64_t clientStartSampleCount;
  unsigned int v69;
  unint64_t triggerEndSampleCount;
  unsigned int v71;
  unint64_t triggerFireSampleCount;
  unsigned int v73;
  unint64_t triggerStartNs;
  unsigned int v75;
  unint64_t triggerEndNs;
  unsigned int v77;
  unint64_t triggerFireNs;
  unsigned int v79;
  unint64_t extraSamplesAtStart;
  unsigned int v81;
  unint64_t analyzerPrependingSamples;
  unint64_t v83;
  unint64_t v84;
  char v85;
  char v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  char v93;
  char v94;
  char v95;
  char v96;
  char v97;
  char v98;
  char v99;
  char v100;
  char v101;
  char v102;
  char v103;
  char v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t analyzerTrailingSamples;
  int v108;
  int v109;
  unint64_t v110;
  unint64_t v111;
  int v112;
  int isTriggerEvent;
  int v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t totalSampleCount;
  int v118;
  unint64_t v119;
  unint64_t v120;
  float triggerScore;
  float v122;
  int v123;
  unint64_t v124;
  unint64_t v125;
  int isMaximized;
  unint64_t v127;
  unint64_t v128;
  float effectiveThreshold;
  float v130;
  unint64_t v131;
  unint64_t v132;
  float recognizerScore;
  float v134;
  unint64_t v135;
  float recognizerThresholdOffset;
  float v137;
  unint64_t v138;
  unint64_t recognizerWaitTimeInNs;
  unint64_t v140;
  float recognizerScaleFactor;
  float v142;
  unint64_t v143;
  float threshold;
  float v145;
  unint64_t v146;
  int v147;
  unint64_t triggerStartTimeOffsetInNs;
  unint64_t v149;
  unint64_t v150;
  unint64_t triggerEndTimeOffsetInNs;
  unint64_t v152;
  unint64_t v153;
  unint64_t triggerFireTimeOffsetInNs;
  unint64_t v155;
  unint64_t v156;
  double triggerStartTime;
  double v158;
  unint64_t v159;
  unint64_t v160;
  double triggerEndTime;
  double v162;
  unint64_t v163;
  double triggerFiredTime;
  double v165;
  unint64_t v166;
  unint64_t v167;
  unsigned int hardwareSamplerate;
  unint64_t v169;
  unint64_t v170;
  int isContinuous;
  unint64_t v172;
  unint64_t v173;
  float triggerDurationInNs;
  float v175;
  unint64_t v176;
  unint64_t v177;
  unint64_t totalSamplesAtTriggerStart;
  unint64_t v179;
  unint64_t v180;
  unint64_t totalSamplesAtTriggerEnd;
  unint64_t totalSamplesAtEndOfCapture;
  void *v183;
  void *v184;
  uint64_t v185;
  void *v186;
  void *v187;
  void *v188;
  int v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  int v194;
  unint64_t v195;
  uint64_t v196;
  unint64_t v197;
  __int16 v198;
  char v199;
  char v200;
  char v201;
  char v202;
  char v203;
  char v204;
  char v205;
  char v206;
  unint64_t v207;
  unint64_t v208;
  __int16 v209;
  char v210;
  char v211;
  char v212;
  char v213;
  int isSecondChance;
  unint64_t v215;
  unint64_t v216;
  int v217;
  int deviceHandheld;
  unint64_t v219;
  unint64_t v220;
  unsigned int activeChannel;
  unint64_t v222;
  unint64_t v223;
  unint64_t twoShotAudibleFeedbackDelayInNs;
  unint64_t v225;
  float cumulativeUptimeInSec;
  float v227;
  __int16 v228;
  unint64_t v229;
  float cumulativeDowntimeInSec;
  float v231;
  __int16 v232;
  unint64_t v233;
  unint64_t v234;
  int hostPowerStateAtTrigger;
  __int16 v236;
  unint64_t v237;
  unint64_t v238;
  int isMediaPlaying;
  float mediaVolume;
  float v241;
  uint64_t v242;
  void *v243;
  void *v244;
  void *v245;
  int v246;
  unint64_t v247;
  unint64_t v248;
  unint64_t v249;
  unint64_t v250;
  unint64_t v251;
  unint64_t v252;
  unint64_t v253;
  unint64_t v254;
  unint64_t v255;
  unint64_t v256;
  int onBatteryPower;
  int v258;
  int didWakeAP;
  unint64_t v260;
  unint64_t v261;
  int v262;
  float uptimeInSec;
  float v264;
  unint64_t v265;
  unint64_t v266;
  float downtimeInSec;
  float v268;
  unsigned int lastConsecutiveVTRejects;
  uint64_t v270;
  void *v271;
  void *v272;
  void *v273;
  int v274;
  uint64_t v275;
  void *v276;
  void *v277;
  void *v278;
  int v279;
  uint64_t v280;
  unsigned int v281;
  uint64_t v282;
  unint64_t v283;
  unint64_t v284;
  unint64_t v285;
  unint64_t v286;
  unint64_t v287;
  unint64_t v288;
  unint64_t v289;
  unint64_t v290;
  unint64_t v291;
  unint64_t v292;
  unint64_t v293;
  unint64_t v294;
  unint64_t v295;
  unint64_t v296;
  unint64_t v297;
  unint64_t v298;
  unint64_t v299;
  unint64_t v300;
  unint64_t v301;
  unint64_t v302;
  unint64_t v303;
  unint64_t v304;
  unint64_t v305;
  unint64_t v306;
  unint64_t v307;
  unint64_t v308;
  unint64_t v309;
  unint64_t v310;
  int siriIsActiveOrOtherAssertion;
  unint64_t v312;
  unint64_t v313;
  int v314;
  int didAudioStall;
  unint64_t v316;
  unint64_t v317;
  int v318;
  int isBargeIn;
  unint64_t v320;
  unint64_t v321;
  int v322;
  int isWakeFromSleep;
  unint64_t v324;
  unint64_t v325;
  unint64_t secondPassAssetQueryStartTimeInNs;
  unint64_t v327;
  unint64_t v328;
  unint64_t secondPassAssetQueryCompleteTimeInNs;
  unint64_t v330;
  unint64_t v331;
  uint64_t v332;
  unint64_t secondPassAssetLoadStartTimeInNs;
  unint64_t v334;
  unint64_t v335;
  unint64_t secondPassAssetLoadCompleteTimeInNs;
  unint64_t v337;
  unint64_t v338;
  unint64_t secondPassAudioStreamStartTimeInNs;
  unint64_t v340;
  unint64_t v341;
  unint64_t secondPassAudioStreamReadyTimeInNs;
  unint64_t v343;
  unint64_t v344;
  unint64_t secondPassFirstAudioPacketReceptionTimeInNs;
  unint64_t v346;
  unint64_t secondPassLastAudioPacketReceptionTimeInNs;
  unint64_t secondPassCheckerModelKeywordDetectionStartTimeInNs;
  unint64_t secondPassCheckerModelKeywordDetectionEndTimeInNs;
  uint64_t v350;
  void *v351;
  void *v352;
  void *v353;
  int v354;
  int v355;
  unint64_t v356;
  unint64_t v357;
  unint64_t v358;
  unint64_t v359;
  unint64_t v360;
  unint64_t v361;
  unint64_t v362;
  unint64_t v363;
  double lastDisplayWakeTimeOffsetInNs;
  double v365;
  unint64_t v366;
  unint64_t v367;
  int v368;
  int isHSJSTriggerFromAlwaysOnMicBuffer;
  unint64_t v370;
  unint64_t v371;
  int v372;
  unint64_t displayWakeTimeOffsetInNs;
  float neptuneDetectionApiScore;
  float v375;
  BOOL v376;
  char v378;
  char v379;
  char v380;
  char v381;
  char v382;
  char v383;
  char v384;
  char v385;
  char v386;
  char v387;
  char v388;
  char v389;
  char v390;
  char v391;
  char v392;
  __int16 v393;
  char v394;
  char v395;
  char v396;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_378;
  has = (unint64_t)self->_has;
  v6 = *(_QWORD *)(v4 + 556);
  if ((has & 1) != (*((_DWORD *)v4 + 139) & 1))
    goto LABEL_378;
  if ((has & 1) != 0)
  {
    secondPassAnalyerStartSampleCount = self->_secondPassAnalyerStartSampleCount;
    if (secondPassAnalyerStartSampleCount != objc_msgSend(v4, "secondPassAnalyerStartSampleCount"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  else
  {
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
  }
  v10 = (has >> 1) & 1;
  if (v10 != ((v6 >> 1) & 1))
    goto LABEL_378;
  if (v10)
  {
    secondPassAnalyerEndSampleCount = self->_secondPassAnalyerEndSampleCount;
    if (secondPassAnalyerEndSampleCount != objc_msgSend(v4, "secondPassAnalyerEndSampleCount"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v12 = (has >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1))
    goto LABEL_378;
  if (v12)
  {
    satScore = self->_satScore;
    objc_msgSend(v4, "satScore");
    if (satScore != v14)
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v15 = (has >> 3) & 1;
  if (v15 != ((v6 >> 3) & 1))
    goto LABEL_378;
  if (v15)
  {
    satNumTrainingUtterances = self->_satNumTrainingUtterances;
    if (satNumTrainingUtterances != objc_msgSend(v4, "satNumTrainingUtterances"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v17 = (has >> 4) & 1;
  if (v17 != ((v6 >> 4) & 1))
    goto LABEL_378;
  if (v17)
  {
    satThreshold = self->_satThreshold;
    objc_msgSend(v4, "satThreshold");
    if (satThreshold != v19)
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v20 = (has >> 5) & 1;
  if (v20 != ((v6 >> 5) & 1))
    goto LABEL_378;
  if (v20)
  {
    satTriggered = self->_satTriggered;
    if (satTriggered != objc_msgSend(v4, "satTriggered"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v22 = (has >> 6) & 1;
  if (v22 != ((v6 >> 6) & 1))
    goto LABEL_378;
  if (v22)
  {
    tdSpeakerRecognizerScore = self->_tdSpeakerRecognizerScore;
    objc_msgSend(v4, "tdSpeakerRecognizerScore");
    if (tdSpeakerRecognizerScore != v24)
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v25 = (has >> 7) & 1;
  if (v25 != ((v6 >> 7) & 1))
    goto LABEL_378;
  if (v25)
  {
    tdSpeakerRecognizerCombinedScore = self->_tdSpeakerRecognizerCombinedScore;
    objc_msgSend(v4, "tdSpeakerRecognizerCombinedScore");
    if (tdSpeakerRecognizerCombinedScore != v27)
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v28 = (has >> 8) & 1;
  if (v28 != ((v6 >> 8) & 1))
    goto LABEL_378;
  if (v28)
  {
    tdSpeakerRecognizerCombinedThreshold = self->_tdSpeakerRecognizerCombinedThreshold;
    objc_msgSend(v4, "tdSpeakerRecognizerCombinedThreshold");
    if (tdSpeakerRecognizerCombinedThreshold != v30)
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v31 = (has >> 9) & 1;
  if (v31 != ((v6 >> 9) & 1))
    goto LABEL_378;
  if (v31)
  {
    tdSpeakerRecognizerCombinationWeight = self->_tdSpeakerRecognizerCombinationWeight;
    objc_msgSend(v4, "tdSpeakerRecognizerCombinationWeight");
    if (tdSpeakerRecognizerCombinationWeight != v33)
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v34 = (has >> 10) & 1;
  if (v34 != ((v6 >> 10) & 1))
    goto LABEL_378;
  if (v34)
  {
    biometricClue = self->_biometricClue;
    if (biometricClue != objc_msgSend(v4, "biometricClue"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v36 = (has >> 11) & 1;
  if (v36 != ((v6 >> 11) & 1))
    goto LABEL_378;
  if (v36)
  {
    satBeingTrained = self->_satBeingTrained;
    if (satBeingTrained != objc_msgSend(v4, "satBeingTrained"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v38 = (has >> 12) & 1;
  if (v38 != ((v6 >> 12) & 1))
    goto LABEL_378;
  if (v38)
  {
    lastConsecutivePHSRejects = self->_lastConsecutivePHSRejects;
    if (lastConsecutivePHSRejects != objc_msgSend(v4, "lastConsecutivePHSRejects"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v40 = (has >> 13) & 1;
  if (v40 != ((v6 >> 13) & 1))
    goto LABEL_378;
  if (v40)
  {
    deltaTimeInNsFromlastPHSReject = self->_deltaTimeInNsFromlastPHSReject;
    if (deltaTimeInNsFromlastPHSReject != objc_msgSend(v4, "deltaTimeInNsFromlastPHSReject"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v42 = (has >> 14) & 1;
  if (v42 != ((v6 >> 14) & 1))
    goto LABEL_378;
  if (v42)
  {
    triggerExplicitSatScore = self->_triggerExplicitSatScore;
    objc_msgSend(v4, "triggerExplicitSatScore");
    if (triggerExplicitSatScore != v44)
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v45 = (has >> 15) & 1;
  if (v45 != ((v6 >> 15) & 1))
    goto LABEL_378;
  if (v45)
  {
    triggerExplicitTDSRSatScore = self->_triggerExplicitTDSRSatScore;
    objc_msgSend(v4, "triggerExplicitTDSRSatScore");
    if (triggerExplicitTDSRSatScore != v47)
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v48 = WORD1(has) & 1;
  if (v48 != (WORD1(v6) & 1))
    goto LABEL_378;
  if (v48)
  {
    shadowMicScore = self->_shadowMicScore;
    objc_msgSend(v4, "shadowMicScore");
    if (shadowMicScore != v50)
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v51 = (has >> 17) & 1;
  if (v51 != ((v6 >> 17) & 1))
    goto LABEL_378;
  if (v51)
  {
    shadowMicScoreThresholdForVAD = self->_shadowMicScoreThresholdForVAD;
    objc_msgSend(v4, "shadowMicScoreThresholdForVAD");
    if (shadowMicScoreThresholdForVAD != v53)
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v54 = (has >> 18) & 1;
  if (v54 != ((v6 >> 18) & 1))
    goto LABEL_378;
  if (v54)
  {
    remoteMicVADScore = self->_remoteMicVADScore;
    objc_msgSend(v4, "remoteMicVADScore");
    if (remoteMicVADScore != v56)
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v57 = (has >> 19) & 1;
  if (v57 != ((v6 >> 19) & 1))
    goto LABEL_378;
  if (v57)
  {
    remoteMicVADThreshold = self->_remoteMicVADThreshold;
    objc_msgSend(v4, "remoteMicVADThreshold");
    if (remoteMicVADThreshold != v59)
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v60 = (has >> 20) & 1;
  if (v60 != ((v6 >> 20) & 1))
    goto LABEL_378;
  if (v60)
  {
    remoteMicVADMyriadThreshold = self->_remoteMicVADMyriadThreshold;
    objc_msgSend(v4, "remoteMicVADMyriadThreshold");
    if (remoteMicVADMyriadThreshold != v62)
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v63 = (has >> 21) & 1;
  if (v63 != ((v6 >> 21) & 1))
    goto LABEL_378;
  if (v63)
  {
    enhancedCarplayTriggerMode = self->_enhancedCarplayTriggerMode;
    if (enhancedCarplayTriggerMode != objc_msgSend(v4, "enhancedCarplayTriggerMode"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v65 = (has >> 22) & 1;
  if (v65 != ((v6 >> 22) & 1))
    goto LABEL_378;
  if (v65)
  {
    triggerStartSampleCount = self->_triggerStartSampleCount;
    if (triggerStartSampleCount != objc_msgSend(v4, "triggerStartSampleCount"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v67 = (has >> 23) & 1;
  if (v67 != ((v6 >> 23) & 1))
    goto LABEL_378;
  if (v67)
  {
    clientStartSampleCount = self->_clientStartSampleCount;
    if (clientStartSampleCount != objc_msgSend(v4, "clientStartSampleCount"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v69 = BYTE3(has) & 1;
  if (v69 != (BYTE3(v6) & 1))
    goto LABEL_378;
  if (v69)
  {
    triggerEndSampleCount = self->_triggerEndSampleCount;
    if (triggerEndSampleCount != objc_msgSend(v4, "triggerEndSampleCount"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v71 = (has >> 25) & 1;
  if (v71 != ((v6 >> 25) & 1))
    goto LABEL_378;
  if (v71)
  {
    triggerFireSampleCount = self->_triggerFireSampleCount;
    if (triggerFireSampleCount != objc_msgSend(v4, "triggerFireSampleCount"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v73 = (has >> 26) & 1;
  if (v73 != ((v6 >> 26) & 1))
    goto LABEL_378;
  if (v73)
  {
    triggerStartNs = self->_triggerStartNs;
    if (triggerStartNs != objc_msgSend(v4, "triggerStartNs"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v75 = (has >> 27) & 1;
  if (v75 != ((v6 >> 27) & 1))
    goto LABEL_378;
  if (v75)
  {
    triggerEndNs = self->_triggerEndNs;
    if (triggerEndNs != objc_msgSend(v4, "triggerEndNs"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v77 = (has >> 28) & 1;
  if (v77 != ((v6 >> 28) & 1))
    goto LABEL_378;
  if (v77)
  {
    triggerFireNs = self->_triggerFireNs;
    if (triggerFireNs != objc_msgSend(v4, "triggerFireNs"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v79 = (has >> 29) & 1;
  if (v79 != ((v6 >> 29) & 1))
    goto LABEL_378;
  if (v79)
  {
    extraSamplesAtStart = self->_extraSamplesAtStart;
    if (extraSamplesAtStart != objc_msgSend(v4, "extraSamplesAtStart"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  v81 = (has >> 30) & 1;
  if (v81 != ((v6 >> 30) & 1))
    goto LABEL_378;
  if (v81)
  {
    analyzerPrependingSamples = self->_analyzerPrependingSamples;
    if (analyzerPrependingSamples != objc_msgSend(v4, "analyzerPrependingSamples"))
      goto LABEL_378;
    LODWORD(v7) = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    has = (unint64_t)self->_has;
    v8 = *((unsigned __int16 *)v4 + 282) | (v4[566] << 16);
    v6 = *(_QWORD *)(v4 + 556);
  }
  if (((v6 ^ has) & 0x80000000) != 0)
    goto LABEL_378;
  if ((has & 0x80000000) != 0)
  {
    analyzerTrailingSamples = self->_analyzerTrailingSamples;
    if (analyzerTrailingSamples != objc_msgSend(v4, "analyzerTrailingSamples"))
      goto LABEL_378;
    v108 = *((unsigned __int16 *)&self->_has + 4);
    v109 = *((unsigned __int16 *)v4 + 282);
    v110 = *(_QWORD *)(v4 + 556);
    v111 = (unint64_t)self->_has;
    v83 = (v110 >> 33) | (v109 << 31);
    v84 = (v110 >> 34) | (v109 << 30);
    v85 = v110 >> 35;
    v86 = v110 >> 36;
    v87 = v110 >> 37;
    v395 = v110 >> 39;
    v396 = v110 >> 38;
    v394 = BYTE5(v110);
    v378 = v110 >> 42;
    v379 = v110 >> 43;
    v380 = v110 >> 44;
    v381 = v110 >> 45;
    v383 = v110 >> 41;
    v384 = v110 >> 46;
    v386 = v110 >> 47;
    v388 = BYTE6(v110);
    v389 = v110 >> 49;
    v390 = v110 >> 50;
    v391 = v110 >> 51;
    v392 = v110 >> 52;
    LOBYTE(v393) = v110 >> 53;
    v88 = (v111 >> 33) | (v108 << 31);
    v89 = (v111 >> 34) | (v108 << 30);
    v90 = (v111 >> 35) | (v108 << 29);
    v91 = (v111 >> 36) | (v108 << 28);
    v92 = v111 >> 37;
    v93 = v111 >> 38;
    v94 = v111 >> 39;
    v95 = BYTE5(v111);
    v96 = v111 >> 41;
    v97 = v111 >> 42;
    v98 = v111 >> 43;
    v99 = v111 >> 44;
    v100 = v111 >> 45;
    v382 = v111 >> 46;
    v385 = v111 >> 47;
    v387 = BYTE6(v111);
    v101 = v111 >> 49;
    v102 = v111 >> 50;
    v103 = v111 >> 51;
    v104 = v111 >> 52;
    LOBYTE(v7) = v111 >> 53;
    v105 = HIDWORD(v110);
    v106 = HIDWORD(v111);
  }
  else
  {
    v83 = (v6 >> 33) | (v8 << 31);
    v84 = (v6 >> 34) | (v8 << 30);
    v85 = v6 >> 35;
    v86 = v6 >> 36;
    v87 = v6 >> 37;
    v396 = v6 >> 38;
    v395 = v6 >> 39;
    v394 = BYTE5(v6);
    v383 = v6 >> 41;
    v378 = v6 >> 42;
    v379 = v6 >> 43;
    v380 = v6 >> 44;
    v381 = v6 >> 45;
    v384 = v6 >> 46;
    v386 = v6 >> 47;
    v388 = BYTE6(v6);
    v389 = v6 >> 49;
    v390 = v6 >> 50;
    v391 = v6 >> 51;
    v392 = v6 >> 52;
    LOBYTE(v393) = v6 >> 53;
    v88 = (has >> 33) | ((_DWORD)v7 << 31);
    v89 = (has >> 34) | ((_DWORD)v7 << 30);
    v90 = (has >> 35) | ((_DWORD)v7 << 29);
    v91 = (has >> 36) | ((_DWORD)v7 << 28);
    v92 = has >> 37;
    v93 = has >> 38;
    v94 = has >> 39;
    v95 = BYTE5(has);
    v96 = has >> 41;
    v97 = has >> 42;
    v98 = has >> 43;
    v99 = has >> 44;
    v100 = has >> 45;
    v382 = has >> 46;
    v385 = has >> 47;
    v387 = BYTE6(has);
    v101 = has >> 49;
    v102 = has >> 50;
    v103 = has >> 51;
    v104 = has >> 52;
    LOBYTE(v7) = has >> 53;
    v105 = HIDWORD(v6);
    v106 = HIDWORD(has);
  }
  v112 = v106 & 1;
  if (v112 != (v105 & 1))
    goto LABEL_378;
  if (v112)
  {
    isTriggerEvent = self->_isTriggerEvent;
    if (isTriggerEvent != objc_msgSend(v4, "isTriggerEvent", v91, v84, v90, v83, v89, v88))
      goto LABEL_378;
    v114 = *((unsigned __int16 *)&self->_has + 4);
    v115 = *(_QWORD *)(v4 + 556);
    v116 = (unint64_t)self->_has;
    LOBYTE(v83) = v115 >> 33;
    v84 = (v115 >> 34) | (*((unsigned __int16 *)v4 + 282) << 30);
    v85 = v115 >> 35;
    v86 = v115 >> 36;
    v87 = v115 >> 37;
    v396 = v115 >> 38;
    v395 = v115 >> 39;
    v394 = BYTE5(v115);
    v383 = v115 >> 41;
    v378 = v115 >> 42;
    v379 = v115 >> 43;
    v380 = v115 >> 44;
    v381 = v115 >> 45;
    v384 = v115 >> 46;
    v386 = v115 >> 47;
    v388 = BYTE6(v115);
    v389 = v115 >> 49;
    v390 = v115 >> 50;
    v391 = v115 >> 51;
    v392 = v115 >> 52;
    LOBYTE(v393) = v115 >> 53;
    LOBYTE(v88) = v116 >> 33;
    LOBYTE(v89) = v116 >> 34;
    v90 = (v116 >> 35) | (v114 << 29);
    v91 = (v116 >> 36) | (v114 << 28);
    v92 = v116 >> 37;
    v93 = v116 >> 38;
    v94 = v116 >> 39;
    v95 = BYTE5(v116);
    v96 = v116 >> 41;
    v97 = v116 >> 42;
    v98 = v116 >> 43;
    v99 = v116 >> 44;
    v100 = v116 >> 45;
    v382 = v116 >> 46;
    v385 = v116 >> 47;
    v387 = BYTE6(v116);
    v101 = v116 >> 49;
    v102 = v116 >> 50;
    v103 = v116 >> 51;
    v104 = v116 >> 52;
    LOBYTE(v7) = v116 >> 53;
  }
  if ((v88 & 1) != (v83 & 1))
    goto LABEL_378;
  if ((v88 & 1) != 0)
  {
    totalSampleCount = self->_totalSampleCount;
    if (totalSampleCount != objc_msgSend(v4, "totalSampleCount", v91, v84, v90))
      goto LABEL_378;
    v118 = *((unsigned __int16 *)&self->_has + 4);
    v119 = *(_QWORD *)(v4 + 556);
    v120 = (unint64_t)self->_has;
    v84 = (v119 >> 34) | (*((unsigned __int16 *)v4 + 282) << 30);
    v85 = v119 >> 35;
    v86 = v119 >> 36;
    v87 = v119 >> 37;
    v396 = v119 >> 38;
    v395 = v119 >> 39;
    v394 = BYTE5(v119);
    v383 = v119 >> 41;
    v378 = v119 >> 42;
    v379 = v119 >> 43;
    v380 = v119 >> 44;
    v381 = v119 >> 45;
    v384 = v119 >> 46;
    v386 = v119 >> 47;
    v388 = BYTE6(v119);
    v389 = v119 >> 49;
    v390 = v119 >> 50;
    v391 = v119 >> 51;
    v392 = v119 >> 52;
    LOBYTE(v393) = v119 >> 53;
    LOBYTE(v89) = v120 >> 34;
    v90 = (v120 >> 35) | (v118 << 29);
    v91 = (v120 >> 36) | (v118 << 28);
    v92 = v120 >> 37;
    v93 = v120 >> 38;
    v94 = v120 >> 39;
    v95 = BYTE5(v120);
    v96 = v120 >> 41;
    v97 = v120 >> 42;
    v98 = v120 >> 43;
    v99 = v120 >> 44;
    v100 = v120 >> 45;
    v382 = v120 >> 46;
    v385 = v120 >> 47;
    v387 = BYTE6(v120);
    v101 = v120 >> 49;
    v102 = v120 >> 50;
    v103 = v120 >> 51;
    v104 = v120 >> 52;
    LOBYTE(v7) = v120 >> 53;
  }
  if ((v89 & 1) != (v84 & 1))
    goto LABEL_378;
  if ((v89 & 1) != 0)
  {
    triggerScore = self->_triggerScore;
    objc_msgSend(v4, "triggerScore", v91);
    if (triggerScore != v122)
      goto LABEL_378;
    v123 = *((unsigned __int16 *)&self->_has + 4);
    v124 = *(_QWORD *)(v4 + 556);
    v125 = (unint64_t)self->_has;
    v85 = v124 >> 35;
    v86 = v124 >> 36;
    v87 = v124 >> 37;
    v396 = v124 >> 38;
    v395 = v124 >> 39;
    v394 = BYTE5(v124);
    v383 = v124 >> 41;
    v378 = v124 >> 42;
    v379 = v124 >> 43;
    v380 = v124 >> 44;
    v381 = v124 >> 45;
    v384 = v124 >> 46;
    v386 = v124 >> 47;
    v388 = BYTE6(v124);
    v389 = v124 >> 49;
    v390 = v124 >> 50;
    v391 = v124 >> 51;
    v392 = v124 >> 52;
    LOBYTE(v393) = v124 >> 53;
    v90 = (v125 >> 35) | (v123 << 29);
    v91 = (v125 >> 36) | (v123 << 28);
    v92 = v125 >> 37;
    v93 = v125 >> 38;
    v94 = v125 >> 39;
    v95 = BYTE5(v125);
    v96 = v125 >> 41;
    v97 = v125 >> 42;
    v98 = v125 >> 43;
    v99 = v125 >> 44;
    v100 = v125 >> 45;
    v382 = v125 >> 46;
    v385 = v125 >> 47;
    v84 = HIWORD(v125);
    v387 = BYTE6(v125);
    v101 = v125 >> 49;
    v102 = v125 >> 50;
    v103 = v125 >> 51;
    v104 = v125 >> 52;
    LOBYTE(v7) = v125 >> 53;
  }
  if ((v90 & 1) != (v85 & 1))
    goto LABEL_378;
  if ((v90 & 1) != 0)
  {
    isMaximized = self->_isMaximized;
    if (isMaximized != objc_msgSend(v4, "isMaximized", v91, v84, v90))
      goto LABEL_378;
    v127 = *(_QWORD *)(v4 + 556);
    v128 = (unint64_t)self->_has;
    v86 = v127 >> 36;
    v87 = v127 >> 37;
    v396 = v127 >> 38;
    v395 = v127 >> 39;
    v394 = BYTE5(v127);
    v383 = v127 >> 41;
    v378 = v127 >> 42;
    v379 = v127 >> 43;
    v380 = v127 >> 44;
    v381 = v127 >> 45;
    v384 = v127 >> 46;
    v386 = v127 >> 47;
    v388 = BYTE6(v127);
    v389 = v127 >> 49;
    v390 = v127 >> 50;
    v391 = v127 >> 51;
    v392 = v127 >> 52;
    LOBYTE(v393) = v127 >> 53;
    LOWORD(v91) = v128 >> 36;
    v92 = v128 >> 37;
    v93 = v128 >> 38;
    v94 = v128 >> 39;
    v95 = BYTE5(v128);
    v96 = v128 >> 41;
    v97 = v128 >> 42;
    v98 = v128 >> 43;
    v99 = v128 >> 44;
    v100 = v128 >> 45;
    v382 = v128 >> 46;
    v385 = v128 >> 47;
    v387 = BYTE6(v128);
    v101 = v128 >> 49;
    v102 = v128 >> 50;
    v103 = v128 >> 51;
    v104 = v128 >> 52;
    LOBYTE(v7) = v128 >> 53;
  }
  if ((v91 & 1) != (v86 & 1))
    goto LABEL_378;
  if ((v91 & 1) != 0)
  {
    effectiveThreshold = self->_effectiveThreshold;
    objc_msgSend(v4, "effectiveThreshold");
    if (effectiveThreshold != v130)
      goto LABEL_378;
    v131 = *(_QWORD *)(v4 + 556);
    v132 = (unint64_t)self->_has;
    v87 = v131 >> 37;
    v396 = v131 >> 38;
    v395 = v131 >> 39;
    v394 = BYTE5(v131);
    v383 = v131 >> 41;
    v378 = v131 >> 42;
    v379 = v131 >> 43;
    v380 = v131 >> 44;
    v381 = v131 >> 45;
    v384 = v131 >> 46;
    v386 = v131 >> 47;
    v388 = BYTE6(v131);
    v389 = v131 >> 49;
    v390 = v131 >> 50;
    v391 = v131 >> 51;
    v392 = v131 >> 52;
    LOBYTE(v393) = v131 >> 53;
    v92 = v132 >> 37;
    v93 = v132 >> 38;
    v94 = v132 >> 39;
    v95 = BYTE5(v132);
    v96 = v132 >> 41;
    v97 = v132 >> 42;
    v98 = v132 >> 43;
    v99 = v132 >> 44;
    v100 = v132 >> 45;
    v382 = v132 >> 46;
    v385 = v132 >> 47;
    v387 = BYTE6(v132);
    v101 = v132 >> 49;
    v102 = v132 >> 50;
    v103 = v132 >> 51;
    v104 = v132 >> 52;
    LOBYTE(v7) = v132 >> 53;
  }
  if ((v92 & 1) != (v87 & 1))
    goto LABEL_378;
  if ((v92 & 1) != 0)
  {
    recognizerScore = self->_recognizerScore;
    objc_msgSend(v4, "recognizerScore");
    if (recognizerScore != v134)
      goto LABEL_378;
    v135 = *(_QWORD *)(v4 + 556);
    v7 = (unint64_t)self->_has;
    v395 = v135 >> 39;
    v396 = v135 >> 38;
    v394 = BYTE5(v135);
    v378 = v135 >> 42;
    v379 = v135 >> 43;
    v380 = v135 >> 44;
    v381 = v135 >> 45;
    v383 = v135 >> 41;
    v384 = v135 >> 46;
    v386 = v135 >> 47;
    v388 = BYTE6(v135);
    v389 = v135 >> 49;
    v390 = v135 >> 50;
    v391 = v135 >> 51;
    v392 = v135 >> 52;
    LOBYTE(v393) = v135 >> 53;
    v93 = v7 >> 38;
    v94 = v7 >> 39;
    v95 = BYTE5(v7);
    v96 = v7 >> 41;
    v97 = v7 >> 42;
    v98 = v7 >> 43;
    v99 = v7 >> 44;
    v100 = v7 >> 45;
    v382 = v7 >> 46;
    v385 = v7 >> 47;
    v387 = BYTE6(v7);
    v101 = v7 >> 49;
    v102 = v7 >> 50;
    v103 = v7 >> 51;
    v104 = v7 >> 52;
    LOBYTE(v7) = v7 >> 53;
  }
  if ((v93 & 1) != (v396 & 1))
    goto LABEL_378;
  if ((v93 & 1) != 0)
  {
    recognizerThresholdOffset = self->_recognizerThresholdOffset;
    objc_msgSend(v4, "recognizerThresholdOffset");
    if (recognizerThresholdOffset != v137)
      goto LABEL_378;
    v138 = *(_QWORD *)(v4 + 556);
    v7 = (unint64_t)self->_has;
    v394 = BYTE5(v138);
    v395 = v138 >> 39;
    v378 = v138 >> 42;
    v379 = v138 >> 43;
    v380 = v138 >> 44;
    v381 = v138 >> 45;
    v383 = v138 >> 41;
    v384 = v138 >> 46;
    v386 = v138 >> 47;
    v388 = BYTE6(v138);
    v389 = v138 >> 49;
    v390 = v138 >> 50;
    v391 = v138 >> 51;
    v392 = v138 >> 52;
    LOBYTE(v393) = v138 >> 53;
    v94 = v7 >> 39;
    v95 = BYTE5(v7);
    v96 = v7 >> 41;
    v97 = v7 >> 42;
    v98 = v7 >> 43;
    v99 = v7 >> 44;
    v100 = v7 >> 45;
    v382 = v7 >> 46;
    v385 = v7 >> 47;
    v387 = BYTE6(v7);
    v101 = v7 >> 49;
    v102 = v7 >> 50;
    v103 = v7 >> 51;
    v104 = v7 >> 52;
    LOBYTE(v7) = v7 >> 53;
  }
  if ((v94 & 1) != (v395 & 1))
    goto LABEL_378;
  if ((v94 & 1) != 0)
  {
    recognizerWaitTimeInNs = self->_recognizerWaitTimeInNs;
    if (recognizerWaitTimeInNs != objc_msgSend(v4, "recognizerWaitTimeInNs"))
      goto LABEL_378;
    v140 = *(_QWORD *)(v4 + 556);
    v7 = (unint64_t)self->_has;
    v394 = BYTE5(v140);
    v378 = v140 >> 42;
    v379 = v140 >> 43;
    v380 = v140 >> 44;
    v381 = v140 >> 45;
    v383 = v140 >> 41;
    v384 = v140 >> 46;
    v386 = v140 >> 47;
    v388 = BYTE6(v140);
    v389 = v140 >> 49;
    v390 = v140 >> 50;
    v391 = v140 >> 51;
    v392 = v140 >> 52;
    LOBYTE(v393) = v140 >> 53;
    v95 = BYTE5(v7);
    v96 = v7 >> 41;
    v97 = v7 >> 42;
    v98 = v7 >> 43;
    v99 = v7 >> 44;
    v100 = v7 >> 45;
    v382 = v7 >> 46;
    v385 = v7 >> 47;
    v387 = BYTE6(v7);
    v101 = v7 >> 49;
    v102 = v7 >> 50;
    v103 = v7 >> 51;
    v104 = v7 >> 52;
    LOBYTE(v7) = v7 >> 53;
  }
  if ((v95 & 1) != (v394 & 1))
    goto LABEL_378;
  if ((v95 & 1) != 0)
  {
    recognizerScaleFactor = self->_recognizerScaleFactor;
    objc_msgSend(v4, "recognizerScaleFactor");
    if (recognizerScaleFactor != v142)
      goto LABEL_378;
    v143 = *(_QWORD *)(v4 + 556);
    v7 = (unint64_t)self->_has;
    v378 = v143 >> 42;
    v379 = v143 >> 43;
    v380 = v143 >> 44;
    v381 = v143 >> 45;
    v383 = v143 >> 41;
    v384 = v143 >> 46;
    v386 = v143 >> 47;
    v388 = BYTE6(v143);
    v389 = v143 >> 49;
    v390 = v143 >> 50;
    v391 = v143 >> 51;
    v392 = v143 >> 52;
    LOBYTE(v393) = v143 >> 53;
    v96 = v7 >> 41;
    v97 = v7 >> 42;
    v98 = v7 >> 43;
    v99 = v7 >> 44;
    v100 = v7 >> 45;
    v382 = v7 >> 46;
    v385 = v7 >> 47;
    v387 = BYTE6(v7);
    v101 = v7 >> 49;
    v102 = v7 >> 50;
    v103 = v7 >> 51;
    v104 = v7 >> 52;
    LOBYTE(v7) = v7 >> 53;
  }
  if ((v96 & 1) != (v383 & 1))
    goto LABEL_378;
  if ((v96 & 1) != 0)
  {
    threshold = self->_threshold;
    objc_msgSend(v4, "threshold");
    if (threshold != v145)
      goto LABEL_378;
    v146 = *(_QWORD *)(v4 + 556);
    v7 = (unint64_t)self->_has;
    v378 = v146 >> 42;
    v379 = v146 >> 43;
    v380 = v146 >> 44;
    v381 = v146 >> 45;
    v384 = v146 >> 46;
    v386 = v146 >> 47;
    v388 = BYTE6(v146);
    v389 = v146 >> 49;
    v390 = v146 >> 50;
    v391 = v146 >> 51;
    v392 = v146 >> 52;
    LOBYTE(v393) = v146 >> 53;
    v97 = v7 >> 42;
    v98 = v7 >> 43;
    v99 = v7 >> 44;
    v100 = v7 >> 45;
    v382 = v7 >> 46;
    v385 = v7 >> 47;
    v387 = BYTE6(v7);
    v101 = v7 >> 49;
    v102 = v7 >> 50;
    v103 = v7 >> 51;
    v104 = v7 >> 52;
    LOBYTE(v7) = v7 >> 53;
  }
  v147 = v97 & 1;
  if (v147 != (v378 & 1))
    goto LABEL_378;
  if (v147)
  {
    triggerStartTimeOffsetInNs = self->_triggerStartTimeOffsetInNs;
    if (triggerStartTimeOffsetInNs != objc_msgSend(v4, "triggerStartTimeOffsetInNs"))
      goto LABEL_378;
    v149 = *(_QWORD *)(v4 + 556);
    v150 = (unint64_t)self->_has;
    v379 = v149 >> 43;
    v380 = v149 >> 44;
    v381 = v149 >> 45;
    v384 = v149 >> 46;
    v386 = v149 >> 47;
    v388 = BYTE6(v149);
    v389 = v149 >> 49;
    v390 = v149 >> 50;
    v391 = v149 >> 51;
    v392 = v149 >> 52;
    LOBYTE(v393) = v149 >> 53;
    v98 = v150 >> 43;
    v99 = v150 >> 44;
    v100 = v150 >> 45;
    v382 = v150 >> 46;
    v385 = v150 >> 47;
    v387 = BYTE6(v150);
    v101 = v150 >> 49;
    v102 = v150 >> 50;
    v103 = v150 >> 51;
    v104 = v150 >> 52;
    LOBYTE(v7) = v150 >> 53;
  }
  if ((v98 & 1) != (v379 & 1))
    goto LABEL_378;
  if ((v98 & 1) != 0)
  {
    triggerEndTimeOffsetInNs = self->_triggerEndTimeOffsetInNs;
    if (triggerEndTimeOffsetInNs != objc_msgSend(v4, "triggerEndTimeOffsetInNs"))
      goto LABEL_378;
    v152 = *(_QWORD *)(v4 + 556);
    v153 = (unint64_t)self->_has;
    v380 = v152 >> 44;
    v381 = v152 >> 45;
    v384 = v152 >> 46;
    v386 = v152 >> 47;
    v388 = BYTE6(v152);
    v389 = v152 >> 49;
    v390 = v152 >> 50;
    v391 = v152 >> 51;
    v392 = v152 >> 52;
    LOBYTE(v393) = v152 >> 53;
    v99 = v153 >> 44;
    v100 = v153 >> 45;
    v382 = v153 >> 46;
    v385 = v153 >> 47;
    v387 = BYTE6(v153);
    v101 = v153 >> 49;
    v102 = v153 >> 50;
    v103 = v153 >> 51;
    v104 = v153 >> 52;
    LOBYTE(v7) = v153 >> 53;
  }
  if ((v99 & 1) != (v380 & 1))
    goto LABEL_378;
  if ((v99 & 1) != 0)
  {
    triggerFireTimeOffsetInNs = self->_triggerFireTimeOffsetInNs;
    if (triggerFireTimeOffsetInNs != objc_msgSend(v4, "triggerFireTimeOffsetInNs"))
      goto LABEL_378;
    v155 = *(_QWORD *)(v4 + 556);
    v156 = (unint64_t)self->_has;
    v381 = v155 >> 45;
    v384 = v155 >> 46;
    v386 = v155 >> 47;
    v388 = BYTE6(v155);
    v389 = v155 >> 49;
    v390 = v155 >> 50;
    v391 = v155 >> 51;
    v392 = v155 >> 52;
    LOBYTE(v393) = v155 >> 53;
    v100 = v156 >> 45;
    v382 = v156 >> 46;
    v385 = v156 >> 47;
    v387 = BYTE6(v156);
    v101 = v156 >> 49;
    v102 = v156 >> 50;
    v103 = v156 >> 51;
    v104 = v156 >> 52;
    LOBYTE(v7) = v156 >> 53;
  }
  if ((v100 & 1) != (v381 & 1))
    goto LABEL_378;
  if ((v100 & 1) != 0)
  {
    triggerStartTime = self->_triggerStartTime;
    objc_msgSend(v4, "triggerStartTime");
    if (triggerStartTime != v158)
      goto LABEL_378;
    v159 = *(_QWORD *)(v4 + 556);
    v160 = (unint64_t)self->_has;
    v384 = v159 >> 46;
    v386 = v159 >> 47;
    v388 = BYTE6(v159);
    v389 = v159 >> 49;
    v390 = v159 >> 50;
    v391 = v159 >> 51;
    v392 = v159 >> 52;
    LOBYTE(v393) = v159 >> 53;
    v382 = v160 >> 46;
    v385 = v160 >> 47;
    v387 = BYTE6(v160);
    v101 = v160 >> 49;
    v102 = v160 >> 50;
    v103 = v160 >> 51;
    v104 = v160 >> 52;
    LOBYTE(v7) = v160 >> 53;
  }
  if ((v382 & 1) != (v384 & 1))
    goto LABEL_378;
  if ((v382 & 1) != 0)
  {
    triggerEndTime = self->_triggerEndTime;
    objc_msgSend(v4, "triggerEndTime");
    if (triggerEndTime != v162)
      goto LABEL_378;
    v163 = *(_QWORD *)(v4 + 556);
    v7 = (unint64_t)self->_has;
    v386 = v163 >> 47;
    v388 = BYTE6(v163);
    v389 = v163 >> 49;
    v390 = v163 >> 50;
    v391 = v163 >> 51;
    v392 = v163 >> 52;
    LOBYTE(v393) = v163 >> 53;
    v385 = v7 >> 47;
    v387 = BYTE6(v7);
    v101 = v7 >> 49;
    v102 = v7 >> 50;
    v103 = v7 >> 51;
    v104 = v7 >> 52;
    LOBYTE(v7) = v7 >> 53;
  }
  if ((v385 & 1) != (v386 & 1))
    goto LABEL_378;
  if ((v385 & 1) != 0)
  {
    triggerFiredTime = self->_triggerFiredTime;
    objc_msgSend(v4, "triggerFiredTime");
    if (triggerFiredTime != v165)
      goto LABEL_378;
    v166 = *(_QWORD *)(v4 + 556);
    v167 = (unint64_t)self->_has;
    v388 = BYTE6(v166);
    v389 = v166 >> 49;
    v390 = v166 >> 50;
    v391 = v166 >> 51;
    v392 = v166 >> 52;
    LOBYTE(v393) = v166 >> 53;
    v387 = BYTE6(v167);
    v101 = v167 >> 49;
    v102 = v167 >> 50;
    v103 = v167 >> 51;
    v104 = v167 >> 52;
    LOBYTE(v7) = v167 >> 53;
  }
  if ((v387 & 1) != (v388 & 1))
    goto LABEL_378;
  if ((v387 & 1) != 0)
  {
    hardwareSamplerate = self->_hardwareSamplerate;
    if (hardwareSamplerate != objc_msgSend(v4, "hardwareSamplerate"))
      goto LABEL_378;
    v169 = *(_QWORD *)(v4 + 556);
    v170 = (unint64_t)self->_has;
    v389 = v169 >> 49;
    v390 = v169 >> 50;
    v391 = v169 >> 51;
    v392 = v169 >> 52;
    LOBYTE(v393) = v169 >> 53;
    v101 = v170 >> 49;
    v102 = v170 >> 50;
    v103 = v170 >> 51;
    v104 = v170 >> 52;
    LOBYTE(v7) = v170 >> 53;
  }
  if ((v101 & 1) != (v389 & 1))
    goto LABEL_378;
  if ((v101 & 1) != 0)
  {
    isContinuous = self->_isContinuous;
    if (isContinuous != objc_msgSend(v4, "isContinuous"))
      goto LABEL_378;
    v172 = *(_QWORD *)(v4 + 556);
    v173 = (unint64_t)self->_has;
    v390 = v172 >> 50;
    v391 = v172 >> 51;
    v392 = v172 >> 52;
    LOBYTE(v393) = v172 >> 53;
    v102 = v173 >> 50;
    v103 = v173 >> 51;
    v104 = v173 >> 52;
    LOBYTE(v7) = v173 >> 53;
  }
  if ((v102 & 1) != (v390 & 1))
    goto LABEL_378;
  if ((v102 & 1) != 0)
  {
    triggerDurationInNs = self->_triggerDurationInNs;
    objc_msgSend(v4, "triggerDurationInNs");
    if (triggerDurationInNs != v175)
      goto LABEL_378;
    v176 = *(_QWORD *)(v4 + 556);
    v177 = (unint64_t)self->_has;
    v391 = v176 >> 51;
    v392 = v176 >> 52;
    LOBYTE(v393) = v176 >> 53;
    v103 = v177 >> 51;
    v104 = v177 >> 52;
    LOBYTE(v7) = v177 >> 53;
  }
  if ((v103 & 1) != (v391 & 1))
    goto LABEL_378;
  if ((v103 & 1) != 0)
  {
    totalSamplesAtTriggerStart = self->_totalSamplesAtTriggerStart;
    if (totalSamplesAtTriggerStart != objc_msgSend(v4, "totalSamplesAtTriggerStart"))
      goto LABEL_378;
    v179 = *(_QWORD *)(v4 + 556);
    v180 = (unint64_t)self->_has;
    v392 = v179 >> 52;
    LOBYTE(v393) = v179 >> 53;
    v104 = v180 >> 52;
    LOBYTE(v7) = v180 >> 53;
  }
  if ((v104 & 1) != (v392 & 1))
    goto LABEL_378;
  if ((v104 & 1) != 0)
  {
    totalSamplesAtTriggerEnd = self->_totalSamplesAtTriggerEnd;
    if (totalSamplesAtTriggerEnd != objc_msgSend(v4, "totalSamplesAtTriggerEnd"))
      goto LABEL_378;
    v393 = (*(_QWORD *)(v4 + 556) >> 53) | (*((_WORD *)v4 + 282) << 11);
    LOWORD(v7) = (*(_QWORD *)&self->_has >> 53) | (*((_WORD *)&self->_has + 4) << 11);
  }
  if ((v7 & 1) != (v393 & 1))
    goto LABEL_378;
  if ((v7 & 1) != 0)
  {
    totalSamplesAtEndOfCapture = self->_totalSamplesAtEndOfCapture;
    if (totalSamplesAtEndOfCapture != objc_msgSend(v4, "totalSamplesAtEndOfCapture"))
      goto LABEL_378;
  }
  -[MHSchemaMHVoiceTriggerEventInfo configVersion](self, "configVersion");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configVersion");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v183 == 0) == (v184 != 0))
    goto LABEL_360;
  -[MHSchemaMHVoiceTriggerEventInfo configVersion](self, "configVersion");
  v185 = objc_claimAutoreleasedReturnValue();
  if (v185)
  {
    v186 = (void *)v185;
    -[MHSchemaMHVoiceTriggerEventInfo configVersion](self, "configVersion");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configVersion");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = objc_msgSend(v187, "isEqual:", v188);

    if (!v189)
      goto LABEL_378;
  }
  else
  {

  }
  -[MHSchemaMHVoiceTriggerEventInfo configPath](self, "configPath");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configPath");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v183 == 0) == (v184 != 0))
    goto LABEL_360;
  -[MHSchemaMHVoiceTriggerEventInfo configPath](self, "configPath");
  v190 = objc_claimAutoreleasedReturnValue();
  if (v190)
  {
    v191 = (void *)v190;
    -[MHSchemaMHVoiceTriggerEventInfo configPath](self, "configPath");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configPath");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v194 = objc_msgSend(v192, "isEqual:", v193);

    if (!v194)
      goto LABEL_378;
  }
  else
  {

  }
  v195 = (unint64_t)self->_has;
  v196 = (v195 >> 54) & 1;
  v197 = *(_QWORD *)(v4 + 556);
  if ((_DWORD)v196 != ((v197 >> 54) & 1))
    goto LABEL_378;
  if ((_DWORD)v196)
  {
    isSecondChance = self->_isSecondChance;
    if (isSecondChance != objc_msgSend(v4, "isSecondChance"))
      goto LABEL_378;
    LOWORD(v197) = *((_WORD *)v4 + 282);
    v215 = *(_QWORD *)(v4 + 556);
    v216 = (unint64_t)self->_has;
    v199 = v215 >> 55;
    v200 = HIBYTE(v215);
    v201 = (v215 >> 57) | ((_BYTE)v197 << 7);
    v202 = (v215 >> 58) | ((_BYTE)v197 << 6);
    v203 = (v215 >> 59) | (32 * v197);
    v204 = (v215 >> 60) | (16 * v197);
    v205 = (v215 >> 61) | (8 * v197);
    LOBYTE(v197) = (v215 >> 62) | (4 * v197);
    v206 = v216 >> 55;
    v213 = HIBYTE(v216);
    v208 = (v216 >> 57) | ((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) << 7);
    LOBYTE(v209) = (v216 >> 58) | (*((_WORD *)&self->_has + 4) << 6);
    v210 = (v216 >> 59) | (32 * *((_WORD *)&self->_has + 4));
    v211 = (v216 >> 60) | (16 * *((_WORD *)&self->_has + 4));
    v212 = (v216 >> 61) | (8 * *((_WORD *)&self->_has + 4));
    LOBYTE(v195) = (v216 >> 62) | (4 * *((_WORD *)&self->_has + 4));
  }
  else
  {
    v198 = *((_WORD *)v4 + 282);
    v199 = v197 >> 55;
    v200 = HIBYTE(*(_QWORD *)(v4 + 556));
    v201 = (v197 >> 57) & 0x7F | ((_BYTE)v198 << 7);
    v202 = (v197 >> 58) & 0x3F | ((_BYTE)v198 << 6);
    v203 = (v197 >> 59) & 0x1F | (32 * v198);
    v204 = (v197 >> 60) & 0xF | (16 * v198);
    v205 = (v197 >> 61) & 7 | (8 * v198);
    LOBYTE(v197) = (v197 >> 62) & 3 | (4 * v198);
    v206 = v195 >> 55;
    v207 = HIBYTE(v195);
    v208 = (v195 >> 57) & 0x7F | (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFFFFu) << 7);
    LOBYTE(v209) = (v195 >> 58) & 0x3F | (*((_WORD *)&self->_has + 4) << 6);
    v210 = (v195 >> 59) & 0x1F | (32 * *((_WORD *)&self->_has + 4));
    v211 = (v195 >> 60) & 0xF | (16 * *((_WORD *)&self->_has + 4));
    v212 = (v195 >> 61) & 7 | (8 * *((_WORD *)&self->_has + 4));
    LOBYTE(v195) = (v195 >> 62) & 3 | (4 * *((_WORD *)&self->_has + 4));
    v213 = v207;
  }
  v217 = v206 & 1;
  if (v217 != (v199 & 1))
    goto LABEL_378;
  if (v217)
  {
    deviceHandheld = self->_deviceHandheld;
    if (deviceHandheld != objc_msgSend(v4, "deviceHandheld", v208))
      goto LABEL_378;
    LOWORD(v197) = *((_WORD *)v4 + 282);
    v219 = *(_QWORD *)(v4 + 556);
    v220 = (unint64_t)self->_has;
    v200 = HIBYTE(v219);
    v201 = (v219 >> 57) | ((_BYTE)v197 << 7);
    v202 = (v219 >> 58) | ((_BYTE)v197 << 6);
    v203 = (v219 >> 59) | (32 * v197);
    v204 = (v219 >> 60) | (16 * v197);
    v205 = (v219 >> 61) | (8 * v197);
    LOBYTE(v197) = (v219 >> 62) | (4 * v197);
    v213 = HIBYTE(v220);
    v208 = (v220 >> 57) | ((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) << 7);
    LOBYTE(v209) = (v220 >> 58) | (*((_WORD *)&self->_has + 4) << 6);
    v210 = (v220 >> 59) | (32 * *((_WORD *)&self->_has + 4));
    v211 = (v220 >> 60) | (16 * *((_WORD *)&self->_has + 4));
    v212 = (v220 >> 61) | (8 * *((_WORD *)&self->_has + 4));
    LOBYTE(v195) = (v220 >> 62) | (4 * *((_WORD *)&self->_has + 4));
  }
  if ((v213 & 1) != (v200 & 1))
    goto LABEL_378;
  if ((v213 & 1) != 0)
  {
    activeChannel = self->_activeChannel;
    if (activeChannel != objc_msgSend(v4, "activeChannel", v208))
      goto LABEL_378;
    LOWORD(v195) = *((_WORD *)&self->_has + 4);
    LOWORD(v197) = *((_WORD *)v4 + 282);
    v222 = *(_QWORD *)(v4 + 556);
    v223 = (unint64_t)self->_has;
    v201 = (v222 >> 57) | ((_BYTE)v197 << 7);
    v202 = (v222 >> 58) | ((_BYTE)v197 << 6);
    v203 = (v222 >> 59) | (32 * v197);
    v204 = (v222 >> 60) | (16 * v197);
    v205 = (v222 >> 61) | (8 * v197);
    LOBYTE(v197) = (v222 >> 62) | (4 * v197);
    LOBYTE(v208) = (v223 >> 57) | ((_BYTE)v195 << 7);
    LOBYTE(v209) = (v223 >> 58) | ((_BYTE)v195 << 6);
    v210 = (v223 >> 59) | (32 * v195);
    v211 = (v223 >> 60) | (16 * v195);
    v212 = (v223 >> 61) | (8 * v195);
    LOBYTE(v195) = (v223 >> 62) | (4 * v195);
  }
  if ((v208 & 1) != (v201 & 1))
    goto LABEL_378;
  if ((v208 & 1) != 0)
  {
    twoShotAudibleFeedbackDelayInNs = self->_twoShotAudibleFeedbackDelayInNs;
    if (twoShotAudibleFeedbackDelayInNs != objc_msgSend(v4, "twoShotAudibleFeedbackDelayInNs"))
      goto LABEL_378;
    LOWORD(v197) = *((_WORD *)v4 + 282);
    v225 = *(_QWORD *)(v4 + 556);
    v195 = (unint64_t)self->_has;
    v202 = (v225 >> 58) | ((_BYTE)v197 << 6);
    v203 = (v225 >> 59) | (32 * v197);
    v204 = (v225 >> 60) | (16 * v197);
    v205 = (v225 >> 61) | (8 * v197);
    LOBYTE(v197) = (v225 >> 62) | (4 * v197);
    v209 = (v195 >> 58) | (*((_WORD *)&self->_has + 4) << 6);
    v210 = (v195 >> 59) | (32 * *((_WORD *)&self->_has + 4));
    v211 = (v195 >> 60) | (16 * *((_WORD *)&self->_has + 4));
    v212 = (v195 >> 61) | (8 * *((_WORD *)&self->_has + 4));
    LOBYTE(v195) = (v195 >> 62) | (4 * *((_WORD *)&self->_has + 4));
  }
  if ((v209 & 1) != (v202 & 1))
    goto LABEL_378;
  if ((v209 & 1) != 0)
  {
    cumulativeUptimeInSec = self->_cumulativeUptimeInSec;
    objc_msgSend(v4, "cumulativeUptimeInSec");
    if (cumulativeUptimeInSec != v227)
      goto LABEL_378;
    v228 = *((_WORD *)&self->_has + 4);
    LOWORD(v197) = *((_WORD *)v4 + 282);
    v229 = *(_QWORD *)(v4 + 556);
    v195 = (unint64_t)self->_has;
    v203 = (v229 >> 59) | (32 * v197);
    v204 = (v229 >> 60) | (16 * v197);
    v205 = (v229 >> 61) | (8 * v197);
    LOBYTE(v197) = (v229 >> 62) | (4 * v197);
    v210 = (v195 >> 59) | (32 * v228);
    v211 = (v195 >> 60) | (16 * v228);
    v212 = (v195 >> 61) | (8 * v228);
    LOBYTE(v195) = (v195 >> 62) | (4 * v228);
  }
  if ((v210 & 1) != (v203 & 1))
    goto LABEL_378;
  if ((v210 & 1) != 0)
  {
    cumulativeDowntimeInSec = self->_cumulativeDowntimeInSec;
    objc_msgSend(v4, "cumulativeDowntimeInSec");
    if (cumulativeDowntimeInSec != v231)
      goto LABEL_378;
    v232 = *((_WORD *)&self->_has + 4);
    LOWORD(v197) = *((_WORD *)v4 + 282);
    v233 = *(_QWORD *)(v4 + 556);
    v234 = (unint64_t)self->_has;
    v204 = (v233 >> 60) | (16 * v197);
    v205 = (v233 >> 61) | (8 * v197);
    LOBYTE(v197) = (v233 >> 62) | (4 * v197);
    v211 = (v234 >> 60) | (16 * v232);
    v212 = (v234 >> 61) | (8 * v232);
    LOBYTE(v195) = (v234 >> 62) | (4 * v232);
  }
  if ((v211 & 1) != (v204 & 1))
    goto LABEL_378;
  if ((v211 & 1) != 0)
  {
    hostPowerStateAtTrigger = self->_hostPowerStateAtTrigger;
    if (hostPowerStateAtTrigger != objc_msgSend(v4, "hostPowerStateAtTrigger"))
      goto LABEL_378;
    v236 = *((_WORD *)&self->_has + 4);
    LOWORD(v197) = *((_WORD *)v4 + 282);
    v237 = *(_QWORD *)(v4 + 556);
    v238 = (unint64_t)self->_has;
    v205 = (v237 >> 61) | (8 * v197);
    LOBYTE(v197) = (v237 >> 62) | (4 * v197);
    v212 = (v238 >> 61) | (8 * v236);
    LOBYTE(v195) = (v238 >> 62) | (4 * v236);
  }
  if ((v212 & 1) != (v205 & 1))
    goto LABEL_378;
  if ((v212 & 1) != 0)
  {
    isMediaPlaying = self->_isMediaPlaying;
    if (isMediaPlaying != objc_msgSend(v4, "isMediaPlaying"))
      goto LABEL_378;
    LOWORD(v197) = (*(_QWORD *)(v4 + 556) >> 62) | (4 * *((_WORD *)v4 + 282));
    LOWORD(v195) = (*(_QWORD *)&self->_has >> 62) | (4 * *((_WORD *)&self->_has + 4));
  }
  if ((v195 & 1) != (v197 & 1))
    goto LABEL_378;
  if ((v195 & 1) != 0)
  {
    mediaVolume = self->_mediaVolume;
    objc_msgSend(v4, "mediaVolume");
    if (mediaVolume != v241)
      goto LABEL_378;
  }
  -[MHSchemaMHVoiceTriggerEventInfo audioProviderUUID](self, "audioProviderUUID");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioProviderUUID");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v183 == 0) == (v184 != 0))
    goto LABEL_360;
  -[MHSchemaMHVoiceTriggerEventInfo audioProviderUUID](self, "audioProviderUUID");
  v242 = objc_claimAutoreleasedReturnValue();
  if (v242)
  {
    v243 = (void *)v242;
    -[MHSchemaMHVoiceTriggerEventInfo audioProviderUUID](self, "audioProviderUUID");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioProviderUUID");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    v246 = objc_msgSend(v244, "isEqual:", v245);

    if (!v246)
      goto LABEL_378;
  }
  else
  {

  }
  if (*(_QWORD *)&self->_has >> 63 != *(_QWORD *)(v4 + 556) >> 63)
    goto LABEL_378;
  if (*(_QWORD *)&self->_has < 0)
  {
    onBatteryPower = self->_onBatteryPower;
    if (onBatteryPower != objc_msgSend(v4, "onBatteryPower"))
      goto LABEL_378;
    v253 = *((unsigned __int16 *)&self->_has + 4) | ((unint64_t)*((unsigned __int8 *)&self->_has + 10) << 16);
    v249 = *((unsigned __int16 *)v4 + 282) | ((unint64_t)v4[566] << 16);
    v250 = v249 >> 1;
    v251 = v249 >> 2;
    v252 = v249 >> 3;
    v254 = v253 >> 1;
    v255 = v253 >> 2;
    v256 = v253 >> 3;
  }
  else
  {
    v247 = *((unsigned __int16 *)&self->_has + 4) | ((unint64_t)*((unsigned __int8 *)&self->_has + 10) << 16);
    v248 = *((unsigned __int16 *)v4 + 282) | ((unint64_t)v4[566] << 16);
    LOBYTE(v249) = *((_WORD *)v4 + 282);
    v250 = (v248 >> 1) & 0x7FFFFF;
    v251 = (v248 >> 2) & 0x3FFFFF;
    v252 = (v248 >> 3) & 0x1FFFFF;
    LOBYTE(v253) = *((_WORD *)&self->_has + 4);
    v254 = (v247 >> 1) & 0x7FFFFF;
    v255 = (v247 >> 2) & 0x3FFFFF;
    v256 = (v247 >> 3) & 0x1FFFFF;
  }
  v258 = v253 & 1;
  if (v258 != (v249 & 1))
    goto LABEL_378;
  if (v258)
  {
    didWakeAP = self->_didWakeAP;
    if (didWakeAP != objc_msgSend(v4, "didWakeAP"))
      goto LABEL_378;
    v251 = *((unsigned __int16 *)&self->_has + 4) | ((unint64_t)*((unsigned __int8 *)&self->_has + 10) << 16);
    v260 = *((unsigned __int16 *)v4 + 282) | ((unint64_t)v4[566] << 16);
    v250 = v260 >> 1;
    v256 = v260 >> 2;
    v252 = v260 >> 3;
    v254 = v251 >> 1;
    v255 = v251 >> 2;
    v261 = v251 >> 3;
    LOBYTE(v251) = v256;
    LOBYTE(v256) = v261;
  }
  v262 = v254 & 1;
  if (v262 != (v250 & 1))
    goto LABEL_378;
  if (v262)
  {
    uptimeInSec = self->_uptimeInSec;
    objc_msgSend(v4, "uptimeInSec");
    if (uptimeInSec != v264)
      goto LABEL_378;
    v251 = *((unsigned __int16 *)&self->_has + 4) | ((unint64_t)*((unsigned __int8 *)&self->_has + 10) << 16);
    v265 = *((unsigned __int16 *)v4 + 282) | ((unint64_t)v4[566] << 16);
    v256 = v265 >> 2;
    v252 = v265 >> 3;
    v255 = v251 >> 2;
    v266 = v251 >> 3;
    LOBYTE(v251) = v256;
    LOBYTE(v256) = v266;
  }
  if ((v255 & 1) != (v251 & 1))
    goto LABEL_378;
  if ((v255 & 1) != 0)
  {
    downtimeInSec = self->_downtimeInSec;
    objc_msgSend(v4, "downtimeInSec");
    if (downtimeInSec != v268)
      goto LABEL_378;
    v252 = (*((unsigned __int16 *)v4 + 282) | ((unint64_t)v4[566] << 16)) >> 3;
    v256 = (*((unsigned __int16 *)&self->_has + 4) | ((unint64_t)*((unsigned __int8 *)&self->_has + 10) << 16)) >> 3;
  }
  if ((v256 & 1) != (v252 & 1))
    goto LABEL_378;
  if ((v256 & 1) != 0)
  {
    lastConsecutiveVTRejects = self->_lastConsecutiveVTRejects;
    if (lastConsecutiveVTRejects != objc_msgSend(v4, "lastConsecutiveVTRejects"))
      goto LABEL_378;
  }
  -[MHSchemaMHVoiceTriggerEventInfo captureFilePath](self, "captureFilePath");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captureFilePath");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v183 == 0) == (v184 != 0))
    goto LABEL_360;
  -[MHSchemaMHVoiceTriggerEventInfo captureFilePath](self, "captureFilePath");
  v270 = objc_claimAutoreleasedReturnValue();
  if (v270)
  {
    v271 = (void *)v270;
    -[MHSchemaMHVoiceTriggerEventInfo captureFilePath](self, "captureFilePath");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "captureFilePath");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    v274 = objc_msgSend(v272, "isEqual:", v273);

    if (!v274)
      goto LABEL_378;
  }
  else
  {

  }
  -[MHSchemaMHVoiceTriggerEventInfo configDataHash](self, "configDataHash");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configDataHash");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v183 == 0) == (v184 != 0))
    goto LABEL_360;
  -[MHSchemaMHVoiceTriggerEventInfo configDataHash](self, "configDataHash");
  v275 = objc_claimAutoreleasedReturnValue();
  if (v275)
  {
    v276 = (void *)v275;
    -[MHSchemaMHVoiceTriggerEventInfo configDataHash](self, "configDataHash");
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configDataHash");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    v279 = objc_msgSend(v277, "isEqual:", v278);

    if (!v279)
      goto LABEL_378;
  }
  else
  {

  }
  v280 = *((unsigned __int16 *)&self->_has + 4);
  v281 = (v280 >> 4) & 1;
  v282 = *((unsigned __int16 *)v4 + 282);
  if (v281 != ((v282 >> 4) & 1))
    goto LABEL_378;
  if (v281)
  {
    siriIsActiveOrOtherAssertion = self->_siriIsActiveOrOtherAssertion;
    if (siriIsActiveOrOtherAssertion != objc_msgSend(v4, "siriIsActiveOrOtherAssertion"))
      goto LABEL_378;
    v309 = *((unsigned __int8 *)&self->_has + 10);
    v312 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    v296 = v4[566];
    v313 = *((unsigned __int16 *)v4 + 282) | (v296 << 16);
    v285 = v313 >> 5;
    v286 = v313 >> 6;
    v287 = v313 >> 7;
    v288 = v313 >> 8;
    v289 = v313 >> 9;
    v290 = v313 >> 10;
    v291 = v313 >> 11;
    v292 = v313 >> 12;
    v293 = v313 >> 13;
    v294 = v313 >> 14;
    v295 = v313 >> 15;
    v297 = v296 >> 1;
    v298 = v312 >> 5;
    v299 = v312 >> 6;
    v300 = v312 >> 7;
    v301 = v312 >> 8;
    v302 = v312 >> 9;
    v303 = v312 >> 10;
    v304 = v312 >> 11;
    v305 = v312 >> 12;
    v306 = v312 >> 13;
    v307 = v312 >> 14;
    v308 = v312 >> 15;
    v310 = v309 >> 1;
  }
  else
  {
    v283 = v280 | ((unint64_t)*((unsigned __int8 *)&self->_has + 10) << 16);
    v284 = v282 | ((unint64_t)v4[566] << 16);
    v285 = v284 >> 5;
    v286 = v284 >> 6;
    v287 = v284 >> 7;
    v288 = v284 >> 8;
    v289 = v284 >> 9;
    v290 = v284 >> 10;
    v291 = v284 >> 11;
    v292 = v284 >> 12;
    v293 = v284 >> 13;
    v294 = v284 >> 14;
    v295 = v284 >> 15;
    v296 = v284 >> 16;
    v297 = v284 >> 17;
    v298 = v283 >> 5;
    v299 = v283 >> 6;
    v300 = v283 >> 7;
    v301 = v283 >> 8;
    v302 = v283 >> 9;
    v303 = v283 >> 10;
    v304 = v283 >> 11;
    v305 = v283 >> 12;
    v306 = v283 >> 13;
    v307 = v283 >> 14;
    v308 = v283 >> 15;
    v309 = v283 >> 16;
    v310 = v283 >> 17;
  }
  v314 = v298 & 1;
  if (v314 != (v285 & 1))
    goto LABEL_378;
  if (v314)
  {
    didAudioStall = self->_didAudioStall;
    if (didAudioStall != objc_msgSend(v4, "didAudioStall", v306, v305, v289, v304, v303, v288))
      goto LABEL_378;
    v309 = *((unsigned __int8 *)&self->_has + 10);
    v316 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    v296 = v4[566];
    v317 = *((unsigned __int16 *)v4 + 282) | (v296 << 16);
    v286 = v317 >> 6;
    v287 = v317 >> 7;
    v288 = v317 >> 8;
    v289 = v317 >> 9;
    v290 = v317 >> 10;
    v291 = v317 >> 11;
    v292 = v317 >> 12;
    v293 = v317 >> 13;
    v294 = v317 >> 14;
    v295 = v317 >> 15;
    v297 = v296 >> 1;
    v299 = v316 >> 6;
    v300 = v316 >> 7;
    v301 = v316 >> 8;
    v302 = v316 >> 9;
    v303 = v316 >> 10;
    v304 = v316 >> 11;
    v305 = v316 >> 12;
    v306 = v316 >> 13;
    v307 = v316 >> 14;
    v308 = v316 >> 15;
    v310 = v309 >> 1;
  }
  v318 = v299 & 1;
  if (v318 != (v286 & 1))
    goto LABEL_378;
  if (v318)
  {
    isBargeIn = self->_isBargeIn;
    if (isBargeIn != objc_msgSend(v4, "isBargeIn", v306, v305, v289, v304, v303, v288))
      goto LABEL_378;
    v309 = *((unsigned __int8 *)&self->_has + 10);
    v320 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    v296 = v4[566];
    v321 = *((unsigned __int16 *)v4 + 282) | (v296 << 16);
    v287 = v321 >> 7;
    v288 = v321 >> 8;
    v289 = v321 >> 9;
    v290 = v321 >> 10;
    v291 = v321 >> 11;
    v292 = v321 >> 12;
    v293 = v321 >> 13;
    v294 = v321 >> 14;
    v295 = v321 >> 15;
    v297 = v296 >> 1;
    v300 = v320 >> 7;
    v301 = v320 >> 8;
    v302 = v320 >> 9;
    v303 = v320 >> 10;
    v304 = v320 >> 11;
    v305 = v320 >> 12;
    v306 = v320 >> 13;
    v307 = v320 >> 14;
    v308 = v320 >> 15;
    v310 = v309 >> 1;
  }
  v322 = v300 & 1;
  if (v322 != (v287 & 1))
    goto LABEL_378;
  if (v322)
  {
    isWakeFromSleep = self->_isWakeFromSleep;
    if (isWakeFromSleep != objc_msgSend(v4, "isWakeFromSleep", v306, v305, v289, v304, v303, v288))
      goto LABEL_378;
    v309 = *((unsigned __int8 *)&self->_has + 10);
    v324 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    v296 = v4[566];
    v325 = *((unsigned __int16 *)v4 + 282) | (v296 << 16);
    v288 = v325 >> 8;
    v289 = v325 >> 9;
    v290 = v325 >> 10;
    v291 = v325 >> 11;
    v292 = v325 >> 12;
    v293 = v325 >> 13;
    v294 = v325 >> 14;
    v295 = v325 >> 15;
    v297 = v296 >> 1;
    v301 = v324 >> 8;
    v302 = v324 >> 9;
    v303 = v324 >> 10;
    v304 = v324 >> 11;
    v305 = v324 >> 12;
    v306 = v324 >> 13;
    v307 = v324 >> 14;
    v308 = v324 >> 15;
    v310 = v309 >> 1;
  }
  if ((v301 & 1) != (v288 & 1))
    goto LABEL_378;
  if ((v301 & 1) != 0)
  {
    secondPassAssetQueryStartTimeInNs = self->_secondPassAssetQueryStartTimeInNs;
    if (secondPassAssetQueryStartTimeInNs != objc_msgSend(v4, "secondPassAssetQueryStartTimeInNs", v306, v305, v289, v304, v303))goto LABEL_378;
    v309 = *((unsigned __int8 *)&self->_has + 10);
    v327 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    v296 = v4[566];
    v328 = *((unsigned __int16 *)v4 + 282) | (v296 << 16);
    v289 = v328 >> 9;
    v290 = v328 >> 10;
    v291 = v328 >> 11;
    v292 = v328 >> 12;
    v293 = v328 >> 13;
    v294 = v328 >> 14;
    v295 = v328 >> 15;
    v297 = v296 >> 1;
    v302 = v327 >> 9;
    v303 = v327 >> 10;
    v304 = v327 >> 11;
    v305 = v327 >> 12;
    v306 = v327 >> 13;
    v307 = v327 >> 14;
    v308 = v327 >> 15;
    v310 = v309 >> 1;
  }
  if ((v302 & 1) != (v289 & 1))
    goto LABEL_378;
  if ((v302 & 1) != 0)
  {
    secondPassAssetQueryCompleteTimeInNs = self->_secondPassAssetQueryCompleteTimeInNs;
    if (secondPassAssetQueryCompleteTimeInNs != objc_msgSend(v4, "secondPassAssetQueryCompleteTimeInNs", v306, v305))
      goto LABEL_378;
    v309 = *((unsigned __int8 *)&self->_has + 10);
    v296 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    v330 = v4[566];
    v331 = *((unsigned __int16 *)v4 + 282) | (v330 << 16);
    v290 = v331 >> 10;
    v291 = v331 >> 11;
    v292 = v331 >> 12;
    v293 = v331 >> 13;
    v294 = v331 >> 14;
    v295 = v331 >> 15;
    v297 = v330 >> 1;
    v303 = v296 >> 10;
    v304 = v296 >> 11;
    v305 = v296 >> 12;
    v306 = v296 >> 13;
    v307 = v296 >> 14;
    v308 = v296 >> 15;
    LOBYTE(v296) = v4[566];
    v310 = v309 >> 1;
  }
  v332 = v303 & 1;
  if ((_DWORD)v332 != (v290 & 1))
    goto LABEL_378;
  if ((v303 & 1) != 0)
  {
    secondPassAssetLoadStartTimeInNs = self->_secondPassAssetLoadStartTimeInNs;
    if (secondPassAssetLoadStartTimeInNs != objc_msgSend(v4, "secondPassAssetLoadStartTimeInNs", v306, v305, v332, v304))goto LABEL_378;
    v309 = *((unsigned __int8 *)&self->_has + 10);
    v296 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    v334 = v4[566];
    v335 = *((unsigned __int16 *)v4 + 282) | (v334 << 16);
    v291 = v335 >> 11;
    v292 = v335 >> 12;
    v293 = v335 >> 13;
    v294 = v335 >> 14;
    v295 = v335 >> 15;
    v297 = v334 >> 1;
    v304 = v296 >> 11;
    v305 = v296 >> 12;
    v306 = v296 >> 13;
    v307 = v296 >> 14;
    v308 = v296 >> 15;
    LOBYTE(v296) = v4[566];
    v310 = v309 >> 1;
  }
  if ((v304 & 1) != (v291 & 1))
    goto LABEL_378;
  if ((v304 & 1) != 0)
  {
    secondPassAssetLoadCompleteTimeInNs = self->_secondPassAssetLoadCompleteTimeInNs;
    if (secondPassAssetLoadCompleteTimeInNs != objc_msgSend(v4, "secondPassAssetLoadCompleteTimeInNs", v306, v305))
      goto LABEL_378;
    v309 = *((unsigned __int8 *)&self->_has + 10);
    v296 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    v337 = v4[566];
    v338 = *((unsigned __int16 *)v4 + 282) | (v337 << 16);
    v292 = v338 >> 12;
    v293 = v338 >> 13;
    v294 = v338 >> 14;
    v295 = v338 >> 15;
    v297 = v337 >> 1;
    v305 = v296 >> 12;
    v306 = v296 >> 13;
    v307 = v296 >> 14;
    v308 = v296 >> 15;
    v310 = v309 >> 1;
    LOBYTE(v296) = v4[566];
  }
  if ((v305 & 1) != (v292 & 1))
    goto LABEL_378;
  if ((v305 & 1) != 0)
  {
    secondPassAudioStreamStartTimeInNs = self->_secondPassAudioStreamStartTimeInNs;
    if (secondPassAudioStreamStartTimeInNs != objc_msgSend(v4, "secondPassAudioStreamStartTimeInNs", v306))
      goto LABEL_378;
    v309 = *((unsigned __int8 *)&self->_has + 10);
    v296 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    v340 = v4[566];
    v341 = *((unsigned __int16 *)v4 + 282) | (v340 << 16);
    v293 = v341 >> 13;
    v294 = v341 >> 14;
    v295 = v341 >> 15;
    v297 = v340 >> 1;
    v306 = v296 >> 13;
    v307 = v296 >> 14;
    v308 = v296 >> 15;
    v310 = v309 >> 1;
    LOBYTE(v296) = v4[566];
  }
  if ((v306 & 1) != (v293 & 1))
    goto LABEL_378;
  if ((v306 & 1) != 0)
  {
    secondPassAudioStreamReadyTimeInNs = self->_secondPassAudioStreamReadyTimeInNs;
    if (secondPassAudioStreamReadyTimeInNs != objc_msgSend(v4, "secondPassAudioStreamReadyTimeInNs"))
      goto LABEL_378;
    v309 = *((unsigned __int8 *)&self->_has + 10);
    v296 = *((unsigned __int16 *)&self->_has + 4) | (v309 << 16);
    v343 = v4[566];
    v344 = *((unsigned __int16 *)v4 + 282) | (v343 << 16);
    v294 = v344 >> 14;
    v295 = v344 >> 15;
    v297 = v343 >> 1;
    v307 = v296 >> 14;
    v308 = v296 >> 15;
    v310 = v309 >> 1;
    LOBYTE(v296) = v4[566];
  }
  if ((v307 & 1) != (v294 & 1))
    goto LABEL_378;
  if ((v307 & 1) != 0)
  {
    secondPassFirstAudioPacketReceptionTimeInNs = self->_secondPassFirstAudioPacketReceptionTimeInNs;
    if (secondPassFirstAudioPacketReceptionTimeInNs != objc_msgSend(v4, "secondPassFirstAudioPacketReceptionTimeInNs"))
      goto LABEL_378;
    v309 = *((unsigned __int8 *)&self->_has + 10);
    v346 = v4[566];
    v295 = (*((unsigned __int16 *)v4 + 282) | (v346 << 16)) >> 15;
    v297 = v346 >> 1;
    v308 = (*((unsigned __int16 *)&self->_has + 4) | (v309 << 16)) >> 15;
    v310 = v309 >> 1;
    LOBYTE(v296) = v4[566];
  }
  if ((v308 & 1) != (v295 & 1))
    goto LABEL_378;
  if ((v308 & 1) != 0)
  {
    secondPassLastAudioPacketReceptionTimeInNs = self->_secondPassLastAudioPacketReceptionTimeInNs;
    if (secondPassLastAudioPacketReceptionTimeInNs != objc_msgSend(v4, "secondPassLastAudioPacketReceptionTimeInNs"))
      goto LABEL_378;
    v309 = *((unsigned __int8 *)&self->_has + 10);
    v296 = v4[566];
    v297 = v296 >> 1;
    v310 = v309 >> 1;
  }
  if ((v309 & 1) != (v296 & 1))
    goto LABEL_378;
  if ((v309 & 1) != 0)
  {
    secondPassCheckerModelKeywordDetectionStartTimeInNs = self->_secondPassCheckerModelKeywordDetectionStartTimeInNs;
    if (secondPassCheckerModelKeywordDetectionStartTimeInNs != objc_msgSend(v4, "secondPassCheckerModelKeywordDetectionStartTimeInNs"))goto LABEL_378;
    v297 = (unint64_t)v4[566] >> 1;
    v310 = (unint64_t)*((unsigned __int8 *)&self->_has + 10) >> 1;
  }
  if ((v310 & 1) != (v297 & 1))
    goto LABEL_378;
  if ((v310 & 1) != 0)
  {
    secondPassCheckerModelKeywordDetectionEndTimeInNs = self->_secondPassCheckerModelKeywordDetectionEndTimeInNs;
    if (secondPassCheckerModelKeywordDetectionEndTimeInNs != objc_msgSend(v4, "secondPassCheckerModelKeywordDetectionEndTimeInNs"))goto LABEL_378;
  }
  -[MHSchemaMHVoiceTriggerEventInfo triggerPhrase](self, "triggerPhrase");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerPhrase");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v183 == 0) == (v184 != 0))
  {
LABEL_360:

    goto LABEL_378;
  }
  -[MHSchemaMHVoiceTriggerEventInfo triggerPhrase](self, "triggerPhrase");
  v350 = objc_claimAutoreleasedReturnValue();
  if (v350)
  {
    v351 = (void *)v350;
    -[MHSchemaMHVoiceTriggerEventInfo triggerPhrase](self, "triggerPhrase");
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "triggerPhrase");
    v353 = (void *)objc_claimAutoreleasedReturnValue();
    v354 = objc_msgSend(v352, "isEqual:", v353);

    if (!v354)
      goto LABEL_378;
  }
  else
  {

  }
  v355 = (*((unsigned __int8 *)&self->_has + 10) >> 2) & 1;
  if (v355 == ((v4[566] >> 2) & 1))
  {
    if (v355)
    {
      lastDisplayWakeTimeOffsetInNs = self->_lastDisplayWakeTimeOffsetInNs;
      objc_msgSend(v4, "lastDisplayWakeTimeOffsetInNs");
      if (lastDisplayWakeTimeOffsetInNs != v365)
        goto LABEL_378;
      v366 = v4[566];
      v358 = v366 >> 3;
      v363 = v366 >> 4;
      v360 = v366 >> 5;
      v359 = *((unsigned __int8 *)&self->_has + 10);
      v361 = v359 >> 3;
      v362 = v359 >> 4;
      v367 = v359 >> 5;
      LOBYTE(v359) = v363;
      LOBYTE(v363) = v367;
    }
    else
    {
      v356 = *((unsigned __int16 *)&self->_has + 4) | ((unint64_t)*((unsigned __int8 *)&self->_has + 10) << 16);
      v357 = *((unsigned __int16 *)v4 + 282) | ((unint64_t)v4[566] << 16);
      v358 = v357 >> 19;
      v359 = v357 >> 20;
      v360 = v357 >> 21;
      v361 = v356 >> 19;
      v362 = v356 >> 20;
      v363 = v356 >> 21;
    }
    v368 = v361 & 1;
    if (v368 == (v358 & 1))
    {
      if (v368)
      {
        isHSJSTriggerFromAlwaysOnMicBuffer = self->_isHSJSTriggerFromAlwaysOnMicBuffer;
        if (isHSJSTriggerFromAlwaysOnMicBuffer != objc_msgSend(v4, "isHSJSTriggerFromAlwaysOnMicBuffer"))
          goto LABEL_378;
        v359 = *((unsigned __int8 *)&self->_has + 10);
        v370 = v4[566];
        v363 = v370 >> 4;
        v360 = v370 >> 5;
        v362 = v359 >> 4;
        v371 = v359 >> 5;
        LOBYTE(v359) = v363;
        LOBYTE(v363) = v371;
      }
      v372 = v362 & 1;
      if (v372 == (v359 & 1))
      {
        if (v372)
        {
          displayWakeTimeOffsetInNs = self->_displayWakeTimeOffsetInNs;
          if (displayWakeTimeOffsetInNs != objc_msgSend(v4, "displayWakeTimeOffsetInNs"))
            goto LABEL_378;
          v363 = (unint64_t)*((unsigned __int8 *)&self->_has + 10) >> 5;
          v360 = (unint64_t)v4[566] >> 5;
        }
        if ((v363 & 1) == (v360 & 1))
        {
          if ((v363 & 1) == 0
            || (neptuneDetectionApiScore = self->_neptuneDetectionApiScore,
                objc_msgSend(v4, "neptuneDetectionApiScore"),
                neptuneDetectionApiScore == v375))
          {
            v376 = 1;
            goto LABEL_379;
          }
        }
      }
    }
  }
LABEL_378:
  v376 = 0;
LABEL_379:

  return v376;
}

- (unint64_t)hash
{
  uint64_t has;
  float satScore;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  float satThreshold;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  float tdSpeakerRecognizerScore;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  float tdSpeakerRecognizerCombinedScore;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  float tdSpeakerRecognizerCombinedThreshold;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  float tdSpeakerRecognizerCombinationWeight;
  double v31;
  long double v32;
  double v33;
  float triggerExplicitSatScore;
  double v35;
  long double v36;
  double v37;
  double v38;
  unint64_t v39;
  float triggerExplicitTDSRSatScore;
  double v41;
  long double v42;
  double v43;
  double v44;
  unint64_t v45;
  float shadowMicScore;
  double v47;
  long double v48;
  double v49;
  double v50;
  unint64_t v51;
  float shadowMicScoreThresholdForVAD;
  double v53;
  long double v54;
  double v55;
  double v56;
  unint64_t v57;
  float remoteMicVADScore;
  double v59;
  long double v60;
  double v61;
  double v62;
  unint64_t v63;
  float remoteMicVADThreshold;
  double v65;
  long double v66;
  double v67;
  double v68;
  unint64_t v69;
  unint64_t v70;
  float remoteMicVADMyriadThreshold;
  double v72;
  long double v73;
  double v74;
  float triggerScore;
  double v76;
  long double v77;
  double v78;
  unint64_t v79;
  float effectiveThreshold;
  double v81;
  long double v82;
  double v83;
  double v84;
  unint64_t v85;
  float recognizerScore;
  double v87;
  long double v88;
  double v89;
  double v90;
  unint64_t v91;
  unint64_t v92;
  float recognizerThresholdOffset;
  double v94;
  long double v95;
  double v96;
  float recognizerScaleFactor;
  double v98;
  long double v99;
  double v100;
  double v101;
  unint64_t v102;
  unint64_t v103;
  float threshold;
  double v105;
  long double v106;
  double v107;
  double triggerStartTime;
  double v109;
  long double v110;
  double v111;
  double v112;
  unint64_t v113;
  double triggerEndTime;
  double v115;
  long double v116;
  double v117;
  double v118;
  unint64_t v119;
  unint64_t v120;
  double triggerFiredTime;
  double v122;
  long double v123;
  double v124;
  float triggerDurationInNs;
  double v126;
  long double v127;
  double v128;
  unint64_t v129;
  uint64_t v130;
  float cumulativeUptimeInSec;
  double v132;
  long double v133;
  double v134;
  double v135;
  unint64_t v136;
  unint64_t v137;
  float cumulativeDowntimeInSec;
  double v139;
  long double v140;
  double v141;
  unint64_t v142;
  float mediaVolume;
  double v144;
  long double v145;
  double v146;
  __int16 v147;
  float uptimeInSec;
  double v149;
  long double v150;
  double v151;
  double v152;
  unint64_t v153;
  unint64_t v154;
  float downtimeInSec;
  double v156;
  long double v157;
  double v158;
  int v159;
  unint64_t v160;
  unint64_t v161;
  int v162;
  unint64_t v163;
  double lastDisplayWakeTimeOffsetInNs;
  double v165;
  long double v166;
  double v167;
  uint64_t v168;
  unint64_t v169;
  uint64_t v170;
  float neptuneDetectionApiScore;
  double v172;
  long double v173;
  double v174;
  unint64_t v175;
  unint64_t v176;
  unint64_t v177;
  unint64_t v178;
  unint64_t v179;
  unint64_t v180;
  unint64_t v181;
  unint64_t v182;
  unint64_t v183;
  unint64_t v184;
  unint64_t v185;
  unint64_t v186;
  unint64_t v187;
  unint64_t v188;
  NSUInteger v190;
  unint64_t v191;
  unint64_t v192;
  unint64_t v193;
  unint64_t v194;
  unint64_t v195;
  unint64_t v196;
  unint64_t v197;
  unint64_t v198;
  unint64_t v199;
  unint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  NSUInteger v205;
  NSUInteger v206;
  uint64_t v207;
  unint64_t v208;
  uint64_t v209;
  uint64_t v210;
  unint64_t v211;
  unint64_t v212;
  uint64_t v213;
  uint64_t v214;
  unint64_t v215;
  unint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  NSUInteger v220;
  NSUInteger v221;
  unint64_t v222;
  unint64_t v223;
  unint64_t v224;
  unint64_t v225;
  uint64_t v226;
  uint64_t v227;
  unint64_t v228;
  unint64_t v229;
  unint64_t v230;
  unint64_t v231;
  unint64_t v232;
  unint64_t v233;
  unint64_t v234;
  uint64_t v235;
  unint64_t v236;
  unint64_t v237;
  uint64_t v238;
  unint64_t v239;
  unint64_t v240;
  unint64_t v241;
  unint64_t v242;
  unint64_t v243;
  unint64_t v244;
  unint64_t v245;
  unint64_t v246;
  unint64_t v247;
  unint64_t v248;
  uint64_t v249;
  unint64_t v250;
  unint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  unint64_t v255;
  uint64_t v256;
  uint64_t v257;
  unint64_t v258;
  unint64_t v259;
  unint64_t v260;
  unint64_t v261;
  unint64_t v262;
  unint64_t v263;
  unint64_t v264;
  unint64_t v265;
  unint64_t v266;
  unint64_t v267;
  unint64_t v268;
  unint64_t v269;
  unint64_t v270;
  unint64_t v271;
  unint64_t v272;

  has = (uint64_t)self->_has;
  if ((has & 1) == 0)
  {
    v259 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v258 = 0;
    if ((has & 4) != 0)
      goto LABEL_4;
LABEL_10:
    v8 = 0;
    goto LABEL_13;
  }
  v259 = 2654435761u * self->_secondPassAnalyerStartSampleCount;
  if ((has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v258 = 2654435761u * self->_secondPassAnalyerEndSampleCount;
  if ((has & 4) == 0)
    goto LABEL_10;
LABEL_4:
  satScore = self->_satScore;
  v5 = satScore;
  if (satScore < 0.0)
    v5 = -satScore;
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
LABEL_13:
  if ((has & 8) != 0)
  {
    v257 = 2654435761 * self->_satNumTrainingUtterances;
    if ((has & 0x10) != 0)
      goto LABEL_15;
LABEL_20:
    v13 = 0;
    goto LABEL_23;
  }
  v257 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_20;
LABEL_15:
  satThreshold = self->_satThreshold;
  v10 = satThreshold;
  if (satThreshold < 0.0)
    v10 = -satThreshold;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_23:
  if ((has & 0x20) != 0)
  {
    v256 = 2654435761 * self->_satTriggered;
    if ((has & 0x40) != 0)
      goto LABEL_25;
LABEL_30:
    v18 = 0;
    goto LABEL_33;
  }
  v256 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_30;
LABEL_25:
  tdSpeakerRecognizerScore = self->_tdSpeakerRecognizerScore;
  v15 = tdSpeakerRecognizerScore;
  if (tdSpeakerRecognizerScore < 0.0)
    v15 = -tdSpeakerRecognizerScore;
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
LABEL_33:
  if ((has & 0x80) != 0)
  {
    tdSpeakerRecognizerCombinedScore = self->_tdSpeakerRecognizerCombinedScore;
    v21 = tdSpeakerRecognizerCombinedScore;
    if (tdSpeakerRecognizerCombinedScore < 0.0)
      v21 = -tdSpeakerRecognizerCombinedScore;
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
  if ((has & 0x100) != 0)
  {
    tdSpeakerRecognizerCombinedThreshold = self->_tdSpeakerRecognizerCombinedThreshold;
    v26 = tdSpeakerRecognizerCombinedThreshold;
    if (tdSpeakerRecognizerCombinedThreshold < 0.0)
      v26 = -tdSpeakerRecognizerCombinedThreshold;
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
  if ((has & 0x200) != 0)
  {
    tdSpeakerRecognizerCombinationWeight = self->_tdSpeakerRecognizerCombinationWeight;
    v31 = tdSpeakerRecognizerCombinationWeight;
    if (tdSpeakerRecognizerCombinationWeight < 0.0)
      v31 = -tdSpeakerRecognizerCombinationWeight;
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
  if ((has & 0x400) != 0)
  {
    v254 = 2654435761 * self->_biometricClue;
    if ((has & 0x800) != 0)
    {
LABEL_59:
      v253 = 2654435761 * self->_satBeingTrained;
      if ((has & 0x1000) != 0)
        goto LABEL_60;
      goto LABEL_68;
    }
  }
  else
  {
    v254 = 0;
    if ((has & 0x800) != 0)
      goto LABEL_59;
  }
  v253 = 0;
  if ((has & 0x1000) != 0)
  {
LABEL_60:
    v252 = 2654435761 * self->_lastConsecutivePHSRejects;
    if ((has & 0x2000) != 0)
      goto LABEL_61;
    goto LABEL_69;
  }
LABEL_68:
  v252 = 0;
  if ((has & 0x2000) != 0)
  {
LABEL_61:
    v251 = 2654435761u * self->_deltaTimeInNsFromlastPHSReject;
    if ((has & 0x4000) != 0)
      goto LABEL_62;
LABEL_70:
    v272 = 0;
    goto LABEL_74;
  }
LABEL_69:
  v251 = 0;
  if ((has & 0x4000) == 0)
    goto LABEL_70;
LABEL_62:
  triggerExplicitSatScore = self->_triggerExplicitSatScore;
  v35 = triggerExplicitSatScore;
  if (triggerExplicitSatScore < 0.0)
    v35 = -triggerExplicitSatScore;
  v36 = floor(v35 + 0.5);
  v37 = (v35 - v36) * 1.84467441e19;
  v38 = fmod(v36, 1.84467441e19);
  if (v37 >= 0.0)
  {
    v272 = 2654435761u * (unint64_t)v38;
    if (v37 <= 0.0)
      goto LABEL_74;
    v39 = v272 + (unint64_t)v37;
  }
  else
  {
    v39 = 2654435761u * (unint64_t)v38 - (unint64_t)fabs(v37);
  }
  v272 = v39;
LABEL_74:
  if ((has & 0x8000) == 0)
  {
    v271 = 0;
    goto LABEL_83;
  }
  triggerExplicitTDSRSatScore = self->_triggerExplicitTDSRSatScore;
  v41 = triggerExplicitTDSRSatScore;
  if (triggerExplicitTDSRSatScore < 0.0)
    v41 = -triggerExplicitTDSRSatScore;
  v42 = floor(v41 + 0.5);
  v43 = (v41 - v42) * 1.84467441e19;
  v44 = fmod(v42, 1.84467441e19);
  if (v43 >= 0.0)
  {
    v271 = 2654435761u * (unint64_t)v44;
    if (v43 <= 0.0)
      goto LABEL_83;
    v45 = v271 + (unint64_t)v43;
  }
  else
  {
    v45 = 2654435761u * (unint64_t)v44 - (unint64_t)fabs(v43);
  }
  v271 = v45;
LABEL_83:
  if ((has & 0x10000) == 0)
  {
    v270 = 0;
    goto LABEL_92;
  }
  shadowMicScore = self->_shadowMicScore;
  v47 = shadowMicScore;
  if (shadowMicScore < 0.0)
    v47 = -shadowMicScore;
  v48 = floor(v47 + 0.5);
  v49 = (v47 - v48) * 1.84467441e19;
  v50 = fmod(v48, 1.84467441e19);
  if (v49 >= 0.0)
  {
    v270 = 2654435761u * (unint64_t)v50;
    if (v49 <= 0.0)
      goto LABEL_92;
    v51 = v270 + (unint64_t)v49;
  }
  else
  {
    v51 = 2654435761u * (unint64_t)v50 - (unint64_t)fabs(v49);
  }
  v270 = v51;
LABEL_92:
  if ((has & 0x20000) == 0)
  {
    v269 = 0;
    goto LABEL_101;
  }
  shadowMicScoreThresholdForVAD = self->_shadowMicScoreThresholdForVAD;
  v53 = shadowMicScoreThresholdForVAD;
  if (shadowMicScoreThresholdForVAD < 0.0)
    v53 = -shadowMicScoreThresholdForVAD;
  v54 = floor(v53 + 0.5);
  v55 = (v53 - v54) * 1.84467441e19;
  v56 = fmod(v54, 1.84467441e19);
  if (v55 >= 0.0)
  {
    v269 = 2654435761u * (unint64_t)v56;
    if (v55 <= 0.0)
      goto LABEL_101;
    v57 = v269 + (unint64_t)v55;
  }
  else
  {
    v57 = 2654435761u * (unint64_t)v56 - (unint64_t)fabs(v55);
  }
  v269 = v57;
LABEL_101:
  if ((has & 0x40000) == 0)
  {
    v268 = 0;
    goto LABEL_110;
  }
  remoteMicVADScore = self->_remoteMicVADScore;
  v59 = remoteMicVADScore;
  if (remoteMicVADScore < 0.0)
    v59 = -remoteMicVADScore;
  v60 = floor(v59 + 0.5);
  v61 = (v59 - v60) * 1.84467441e19;
  v62 = fmod(v60, 1.84467441e19);
  if (v61 >= 0.0)
  {
    v268 = 2654435761u * (unint64_t)v62;
    if (v61 <= 0.0)
      goto LABEL_110;
    v63 = v268 + (unint64_t)v61;
  }
  else
  {
    v63 = 2654435761u * (unint64_t)v62 - (unint64_t)fabs(v61);
  }
  v268 = v63;
LABEL_110:
  if ((has & 0x80000) == 0)
  {
    v267 = 0;
    goto LABEL_119;
  }
  remoteMicVADThreshold = self->_remoteMicVADThreshold;
  v65 = remoteMicVADThreshold;
  if (remoteMicVADThreshold < 0.0)
    v65 = -remoteMicVADThreshold;
  v66 = floor(v65 + 0.5);
  v67 = (v65 - v66) * 1.84467441e19;
  v68 = fmod(v66, 1.84467441e19);
  if (v67 >= 0.0)
  {
    v267 = 2654435761u * (unint64_t)v68;
    if (v67 <= 0.0)
      goto LABEL_119;
    v69 = v267 + (unint64_t)v67;
  }
  else
  {
    v69 = 2654435761u * (unint64_t)v68 - (unint64_t)fabs(v67);
  }
  v267 = v69;
LABEL_119:
  if ((has & 0x100000) != 0)
  {
    remoteMicVADMyriadThreshold = self->_remoteMicVADMyriadThreshold;
    v72 = remoteMicVADMyriadThreshold;
    if (remoteMicVADMyriadThreshold < 0.0)
      v72 = -remoteMicVADMyriadThreshold;
    v73 = floor(v72 + 0.5);
    v74 = (v72 - v73) * 1.84467441e19;
    v70 = 2654435761u * (unint64_t)fmod(v73, 1.84467441e19);
    if (v74 >= 0.0)
    {
      if (v74 > 0.0)
        v70 += (unint64_t)v74;
    }
    else
    {
      v70 -= (unint64_t)fabs(v74);
    }
  }
  else
  {
    v70 = 0;
  }
  v250 = v70;
  if ((has & 0x200000) != 0)
  {
    v249 = 2654435761 * self->_enhancedCarplayTriggerMode;
    if ((has & 0x400000) != 0)
    {
LABEL_129:
      v248 = 2654435761u * self->_triggerStartSampleCount;
      if ((has & 0x800000) != 0)
        goto LABEL_130;
      goto LABEL_147;
    }
  }
  else
  {
    v249 = 0;
    if ((has & 0x400000) != 0)
      goto LABEL_129;
  }
  v248 = 0;
  if ((has & 0x800000) != 0)
  {
LABEL_130:
    v247 = 2654435761u * self->_clientStartSampleCount;
    if ((has & 0x1000000) != 0)
      goto LABEL_131;
    goto LABEL_148;
  }
LABEL_147:
  v247 = 0;
  if ((has & 0x1000000) != 0)
  {
LABEL_131:
    v246 = 2654435761u * self->_triggerEndSampleCount;
    if ((has & 0x2000000) != 0)
      goto LABEL_132;
    goto LABEL_149;
  }
LABEL_148:
  v246 = 0;
  if ((has & 0x2000000) != 0)
  {
LABEL_132:
    v245 = 2654435761u * self->_triggerFireSampleCount;
    if ((has & 0x4000000) != 0)
      goto LABEL_133;
    goto LABEL_150;
  }
LABEL_149:
  v245 = 0;
  if ((has & 0x4000000) != 0)
  {
LABEL_133:
    v244 = 2654435761u * self->_triggerStartNs;
    if ((has & 0x8000000) != 0)
      goto LABEL_134;
    goto LABEL_151;
  }
LABEL_150:
  v244 = 0;
  if ((has & 0x8000000) != 0)
  {
LABEL_134:
    v243 = 2654435761u * self->_triggerEndNs;
    if ((has & 0x10000000) != 0)
      goto LABEL_135;
    goto LABEL_152;
  }
LABEL_151:
  v243 = 0;
  if ((has & 0x10000000) != 0)
  {
LABEL_135:
    v242 = 2654435761u * self->_triggerFireNs;
    if ((has & 0x20000000) != 0)
      goto LABEL_136;
    goto LABEL_153;
  }
LABEL_152:
  v242 = 0;
  if ((has & 0x20000000) != 0)
  {
LABEL_136:
    v241 = 2654435761u * self->_extraSamplesAtStart;
    if ((has & 0x40000000) != 0)
      goto LABEL_137;
    goto LABEL_154;
  }
LABEL_153:
  v241 = 0;
  if ((has & 0x40000000) != 0)
  {
LABEL_137:
    v240 = 2654435761u * self->_analyzerPrependingSamples;
    if ((has & 0x80000000) != 0)
      goto LABEL_138;
    goto LABEL_155;
  }
LABEL_154:
  v240 = 0;
  if ((has & 0x80000000) != 0)
  {
LABEL_138:
    v239 = 2654435761u * self->_analyzerTrailingSamples;
    if ((has & 0x100000000) != 0)
      goto LABEL_139;
    goto LABEL_156;
  }
LABEL_155:
  v239 = 0;
  if ((has & 0x100000000) != 0)
  {
LABEL_139:
    v238 = 2654435761 * self->_isTriggerEvent;
    if ((has & 0x200000000) != 0)
      goto LABEL_140;
LABEL_157:
    v237 = 0;
    if ((has & 0x400000000) != 0)
      goto LABEL_141;
LABEL_158:
    v79 = 0;
    goto LABEL_161;
  }
LABEL_156:
  v238 = 0;
  if ((has & 0x200000000) == 0)
    goto LABEL_157;
LABEL_140:
  v237 = 2654435761u * self->_totalSampleCount;
  if ((has & 0x400000000) == 0)
    goto LABEL_158;
LABEL_141:
  triggerScore = self->_triggerScore;
  v76 = triggerScore;
  if (triggerScore < 0.0)
    v76 = -triggerScore;
  v77 = floor(v76 + 0.5);
  v78 = (v76 - v77) * 1.84467441e19;
  v79 = 2654435761u * (unint64_t)fmod(v77, 1.84467441e19);
  if (v78 >= 0.0)
  {
    if (v78 > 0.0)
      v79 += (unint64_t)v78;
  }
  else
  {
    v79 -= (unint64_t)fabs(v78);
  }
LABEL_161:
  v236 = v79;
  if ((has & 0x800000000) == 0)
  {
    v235 = 0;
    if ((has & 0x1000000000) != 0)
      goto LABEL_163;
LABEL_168:
    v266 = 0;
    goto LABEL_172;
  }
  v235 = 2654435761 * self->_isMaximized;
  if ((has & 0x1000000000) == 0)
    goto LABEL_168;
LABEL_163:
  effectiveThreshold = self->_effectiveThreshold;
  v81 = effectiveThreshold;
  if (effectiveThreshold < 0.0)
    v81 = -effectiveThreshold;
  v82 = floor(v81 + 0.5);
  v83 = (v81 - v82) * 1.84467441e19;
  v84 = fmod(v82, 1.84467441e19);
  if (v83 >= 0.0)
  {
    v266 = 2654435761u * (unint64_t)v84;
    if (v83 <= 0.0)
      goto LABEL_172;
    v85 = v266 + (unint64_t)v83;
  }
  else
  {
    v85 = 2654435761u * (unint64_t)v84 - (unint64_t)fabs(v83);
  }
  v266 = v85;
LABEL_172:
  if ((has & 0x2000000000) == 0)
  {
    v265 = 0;
    goto LABEL_181;
  }
  recognizerScore = self->_recognizerScore;
  v87 = recognizerScore;
  if (recognizerScore < 0.0)
    v87 = -recognizerScore;
  v88 = floor(v87 + 0.5);
  v89 = (v87 - v88) * 1.84467441e19;
  v90 = fmod(v88, 1.84467441e19);
  if (v89 >= 0.0)
  {
    v265 = 2654435761u * (unint64_t)v90;
    if (v89 <= 0.0)
      goto LABEL_181;
    v91 = v265 + (unint64_t)v89;
  }
  else
  {
    v91 = 2654435761u * (unint64_t)v90 - (unint64_t)fabs(v89);
  }
  v265 = v91;
LABEL_181:
  if ((has & 0x4000000000) != 0)
  {
    recognizerThresholdOffset = self->_recognizerThresholdOffset;
    v94 = recognizerThresholdOffset;
    if (recognizerThresholdOffset < 0.0)
      v94 = -recognizerThresholdOffset;
    v95 = floor(v94 + 0.5);
    v96 = (v94 - v95) * 1.84467441e19;
    v92 = 2654435761u * (unint64_t)fmod(v95, 1.84467441e19);
    if (v96 >= 0.0)
    {
      if (v96 > 0.0)
        v92 += (unint64_t)v96;
    }
    else
    {
      v92 -= (unint64_t)fabs(v96);
    }
  }
  else
  {
    v92 = 0;
  }
  v234 = v92;
  if ((has & 0x8000000000) == 0)
  {
    v233 = 0;
    if ((has & 0x10000000000) != 0)
      goto LABEL_191;
LABEL_196:
    v264 = 0;
    goto LABEL_200;
  }
  v233 = 2654435761u * self->_recognizerWaitTimeInNs;
  if ((has & 0x10000000000) == 0)
    goto LABEL_196;
LABEL_191:
  recognizerScaleFactor = self->_recognizerScaleFactor;
  v98 = recognizerScaleFactor;
  if (recognizerScaleFactor < 0.0)
    v98 = -recognizerScaleFactor;
  v99 = floor(v98 + 0.5);
  v100 = (v98 - v99) * 1.84467441e19;
  v101 = fmod(v99, 1.84467441e19);
  if (v100 >= 0.0)
  {
    v264 = 2654435761u * (unint64_t)v101;
    if (v100 <= 0.0)
      goto LABEL_200;
    v102 = v264 + (unint64_t)v100;
  }
  else
  {
    v102 = 2654435761u * (unint64_t)v101 - (unint64_t)fabs(v100);
  }
  v264 = v102;
LABEL_200:
  if ((has & 0x20000000000) != 0)
  {
    threshold = self->_threshold;
    v105 = threshold;
    if (threshold < 0.0)
      v105 = -threshold;
    v106 = floor(v105 + 0.5);
    v107 = (v105 - v106) * 1.84467441e19;
    v103 = 2654435761u * (unint64_t)fmod(v106, 1.84467441e19);
    if (v107 >= 0.0)
    {
      if (v107 > 0.0)
        v103 += (unint64_t)v107;
    }
    else
    {
      v103 -= (unint64_t)fabs(v107);
    }
  }
  else
  {
    v103 = 0;
  }
  v232 = v103;
  if ((has & 0x40000000000) != 0)
  {
    v231 = 2654435761u * self->_triggerStartTimeOffsetInNs;
    if ((has & 0x80000000000) != 0)
    {
LABEL_210:
      v230 = 2654435761u * self->_triggerEndTimeOffsetInNs;
      if ((has & 0x100000000000) != 0)
        goto LABEL_211;
      goto LABEL_218;
    }
  }
  else
  {
    v231 = 0;
    if ((has & 0x80000000000) != 0)
      goto LABEL_210;
  }
  v230 = 0;
  if ((has & 0x100000000000) != 0)
  {
LABEL_211:
    v229 = 2654435761u * self->_triggerFireTimeOffsetInNs;
    if ((has & 0x200000000000) != 0)
      goto LABEL_212;
LABEL_219:
    v263 = 0;
    goto LABEL_223;
  }
LABEL_218:
  v229 = 0;
  if ((has & 0x200000000000) == 0)
    goto LABEL_219;
LABEL_212:
  triggerStartTime = self->_triggerStartTime;
  v109 = -triggerStartTime;
  if (triggerStartTime >= 0.0)
    v109 = self->_triggerStartTime;
  v110 = floor(v109 + 0.5);
  v111 = (v109 - v110) * 1.84467441e19;
  v112 = fmod(v110, 1.84467441e19);
  if (v111 >= 0.0)
  {
    v263 = 2654435761u * (unint64_t)v112;
    if (v111 <= 0.0)
      goto LABEL_223;
    v113 = v263 + (unint64_t)v111;
  }
  else
  {
    v113 = 2654435761u * (unint64_t)v112 - (unint64_t)fabs(v111);
  }
  v263 = v113;
LABEL_223:
  if ((has & 0x400000000000) == 0)
  {
    v262 = 0;
    goto LABEL_232;
  }
  triggerEndTime = self->_triggerEndTime;
  v115 = -triggerEndTime;
  if (triggerEndTime >= 0.0)
    v115 = self->_triggerEndTime;
  v116 = floor(v115 + 0.5);
  v117 = (v115 - v116) * 1.84467441e19;
  v118 = fmod(v116, 1.84467441e19);
  if (v117 >= 0.0)
  {
    v262 = 2654435761u * (unint64_t)v118;
    if (v117 <= 0.0)
      goto LABEL_232;
    v119 = v262 + (unint64_t)v117;
  }
  else
  {
    v119 = 2654435761u * (unint64_t)v118 - (unint64_t)fabs(v117);
  }
  v262 = v119;
LABEL_232:
  if ((has & 0x800000000000) != 0)
  {
    triggerFiredTime = self->_triggerFiredTime;
    v122 = -triggerFiredTime;
    if (triggerFiredTime >= 0.0)
      v122 = self->_triggerFiredTime;
    v123 = floor(v122 + 0.5);
    v124 = (v122 - v123) * 1.84467441e19;
    v120 = 2654435761u * (unint64_t)fmod(v123, 1.84467441e19);
    if (v124 >= 0.0)
    {
      if (v124 > 0.0)
        v120 += (unint64_t)v124;
    }
    else
    {
      v120 -= (unint64_t)fabs(v124);
    }
  }
  else
  {
    v120 = 0;
  }
  v228 = v120;
  if ((has & 0x1000000000000) == 0)
  {
    v227 = 0;
    if ((has & 0x2000000000000) != 0)
      goto LABEL_242;
LABEL_248:
    v226 = 0;
    if ((has & 0x4000000000000) != 0)
      goto LABEL_243;
LABEL_249:
    v129 = 0;
    goto LABEL_252;
  }
  v227 = 2654435761 * self->_hardwareSamplerate;
  if ((has & 0x2000000000000) == 0)
    goto LABEL_248;
LABEL_242:
  v226 = 2654435761 * self->_isContinuous;
  if ((has & 0x4000000000000) == 0)
    goto LABEL_249;
LABEL_243:
  triggerDurationInNs = self->_triggerDurationInNs;
  v126 = triggerDurationInNs;
  if (triggerDurationInNs < 0.0)
    v126 = -triggerDurationInNs;
  v127 = floor(v126 + 0.5);
  v128 = (v126 - v127) * 1.84467441e19;
  v129 = 2654435761u * (unint64_t)fmod(v127, 1.84467441e19);
  if (v128 >= 0.0)
  {
    if (v128 > 0.0)
      v129 += (unint64_t)v128;
  }
  else
  {
    v129 -= (unint64_t)fabs(v128);
  }
LABEL_252:
  if ((has & 0x8000000000000) != 0)
  {
    v224 = 2654435761u * self->_totalSamplesAtTriggerStart;
    if ((has & 0x10000000000000) != 0)
      goto LABEL_254;
  }
  else
  {
    v224 = 0;
    if ((has & 0x10000000000000) != 0)
    {
LABEL_254:
      v223 = 2654435761u * self->_totalSamplesAtTriggerEnd;
      goto LABEL_257;
    }
  }
  v223 = 0;
LABEL_257:
  v225 = v129;
  if ((has & 0x20000000000000) != 0)
    v222 = 2654435761u * self->_totalSamplesAtEndOfCapture;
  else
    v222 = 0;
  v221 = -[NSString hash](self->_configVersion, "hash");
  v220 = -[NSString hash](self->_configPath, "hash");
  v130 = (uint64_t)self->_has;
  if ((v130 & 0x40000000000000) != 0)
  {
    v219 = 2654435761 * self->_isSecondChance;
    if ((v130 & 0x80000000000000) != 0)
    {
LABEL_262:
      v218 = 2654435761 * self->_deviceHandheld;
      if ((v130 & 0x100000000000000) != 0)
        goto LABEL_263;
      goto LABEL_271;
    }
  }
  else
  {
    v219 = 0;
    if ((v130 & 0x80000000000000) != 0)
      goto LABEL_262;
  }
  v218 = 0;
  if ((v130 & 0x100000000000000) != 0)
  {
LABEL_263:
    v217 = 2654435761 * self->_activeChannel;
    if ((v130 & 0x200000000000000) != 0)
      goto LABEL_264;
    goto LABEL_272;
  }
LABEL_271:
  v217 = 0;
  if ((v130 & 0x200000000000000) != 0)
  {
LABEL_264:
    v216 = 2654435761u * self->_twoShotAudibleFeedbackDelayInNs;
    if ((v130 & 0x400000000000000) != 0)
      goto LABEL_265;
LABEL_273:
    v261 = 0;
    goto LABEL_277;
  }
LABEL_272:
  v216 = 0;
  if ((v130 & 0x400000000000000) == 0)
    goto LABEL_273;
LABEL_265:
  cumulativeUptimeInSec = self->_cumulativeUptimeInSec;
  v132 = cumulativeUptimeInSec;
  if (cumulativeUptimeInSec < 0.0)
    v132 = -cumulativeUptimeInSec;
  v133 = floor(v132 + 0.5);
  v134 = (v132 - v133) * 1.84467441e19;
  v135 = fmod(v133, 1.84467441e19);
  if (v134 >= 0.0)
  {
    v261 = 2654435761u * (unint64_t)v135;
    if (v134 <= 0.0)
      goto LABEL_277;
    v136 = v261 + (unint64_t)v134;
  }
  else
  {
    v136 = 2654435761u * (unint64_t)v135 - (unint64_t)fabs(v134);
  }
  v261 = v136;
LABEL_277:
  if ((v130 & 0x800000000000000) != 0)
  {
    cumulativeDowntimeInSec = self->_cumulativeDowntimeInSec;
    v139 = cumulativeDowntimeInSec;
    if (cumulativeDowntimeInSec < 0.0)
      v139 = -cumulativeDowntimeInSec;
    v140 = floor(v139 + 0.5);
    v141 = (v139 - v140) * 1.84467441e19;
    v137 = 2654435761u * (unint64_t)fmod(v140, 1.84467441e19);
    if (v141 >= 0.0)
    {
      if (v141 > 0.0)
        v137 += (unint64_t)v141;
    }
    else
    {
      v137 -= (unint64_t)fabs(v141);
    }
  }
  else
  {
    v137 = 0;
  }
  if ((v130 & 0x1000000000000000) != 0)
  {
    v214 = 2654435761 * self->_hostPowerStateAtTrigger;
    if ((v130 & 0x2000000000000000) != 0)
      goto LABEL_287;
  }
  else
  {
    v214 = 0;
    if ((v130 & 0x2000000000000000) != 0)
    {
LABEL_287:
      v213 = 2654435761 * self->_isMediaPlaying;
      goto LABEL_290;
    }
  }
  v213 = 0;
LABEL_290:
  v215 = v137;
  if ((v130 & 0x4000000000000000) != 0)
  {
    mediaVolume = self->_mediaVolume;
    v144 = mediaVolume;
    if (mediaVolume < 0.0)
      v144 = -mediaVolume;
    v145 = floor(v144 + 0.5);
    v146 = (v144 - v145) * 1.84467441e19;
    v142 = 2654435761u * (unint64_t)fmod(v145, 1.84467441e19);
    if (v146 >= 0.0)
    {
      if (v146 > 0.0)
        v142 += (unint64_t)v146;
    }
    else
    {
      v142 -= (unint64_t)fabs(v146);
    }
  }
  else
  {
    v142 = 0;
  }
  v212 = v142;
  v211 = -[SISchemaUUID hash](self->_audioProviderUUID, "hash");
  v147 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x8000000000000000) != 0)
  {
    v210 = 2654435761 * self->_onBatteryPower;
    if ((v147 & 1) != 0)
    {
LABEL_300:
      v209 = 2654435761 * self->_didWakeAP;
      if ((v147 & 2) != 0)
        goto LABEL_301;
LABEL_307:
      v260 = 0;
      goto LABEL_311;
    }
  }
  else
  {
    v210 = 0;
    if ((v147 & 1) != 0)
      goto LABEL_300;
  }
  v209 = 0;
  if ((v147 & 2) == 0)
    goto LABEL_307;
LABEL_301:
  uptimeInSec = self->_uptimeInSec;
  v149 = uptimeInSec;
  if (uptimeInSec < 0.0)
    v149 = -uptimeInSec;
  v150 = floor(v149 + 0.5);
  v151 = (v149 - v150) * 1.84467441e19;
  v152 = fmod(v150, 1.84467441e19);
  if (v151 >= 0.0)
  {
    v260 = 2654435761u * (unint64_t)v152;
    if (v151 <= 0.0)
      goto LABEL_311;
    v153 = v260 + (unint64_t)v151;
  }
  else
  {
    v153 = 2654435761u * (unint64_t)v152 - (unint64_t)fabs(v151);
  }
  v260 = v153;
LABEL_311:
  if ((v147 & 4) != 0)
  {
    downtimeInSec = self->_downtimeInSec;
    v156 = downtimeInSec;
    if (downtimeInSec < 0.0)
      v156 = -downtimeInSec;
    v157 = floor(v156 + 0.5);
    v158 = (v156 - v157) * 1.84467441e19;
    v154 = 2654435761u * (unint64_t)fmod(v157, 1.84467441e19);
    if (v158 >= 0.0)
    {
      if (v158 > 0.0)
        v154 += (unint64_t)v158;
    }
    else
    {
      v154 -= (unint64_t)fabs(v158);
    }
  }
  else
  {
    v154 = 0;
  }
  v208 = v154;
  if ((v147 & 8) != 0)
    v207 = 2654435761 * self->_lastConsecutiveVTRejects;
  else
    v207 = 0;
  v206 = -[NSString hash](self->_captureFilePath, "hash");
  v205 = -[NSString hash](self->_configDataHash, "hash");
  v159 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*((_WORD *)&self->_has + 4) & 0x10) != 0)
  {
    v204 = 2654435761 * self->_siriIsActiveOrOtherAssertion;
    if ((*((_WORD *)&self->_has + 4) & 0x20) != 0)
    {
LABEL_324:
      v203 = 2654435761 * self->_didAudioStall;
      if ((*((_WORD *)&self->_has + 4) & 0x40) != 0)
        goto LABEL_325;
      goto LABEL_338;
    }
  }
  else
  {
    v204 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x20) != 0)
      goto LABEL_324;
  }
  v203 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x40) != 0)
  {
LABEL_325:
    v202 = 2654435761 * self->_isBargeIn;
    if ((*((_WORD *)&self->_has + 4) & 0x80) != 0)
      goto LABEL_326;
    goto LABEL_339;
  }
LABEL_338:
  v202 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x80) != 0)
  {
LABEL_326:
    v201 = 2654435761 * self->_isWakeFromSleep;
    if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
      goto LABEL_327;
    goto LABEL_340;
  }
LABEL_339:
  v201 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_327:
    v200 = 2654435761u * self->_secondPassAssetQueryStartTimeInNs;
    if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
      goto LABEL_328;
    goto LABEL_341;
  }
LABEL_340:
  v200 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
  {
LABEL_328:
    v199 = 2654435761u * self->_secondPassAssetQueryCompleteTimeInNs;
    if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
      goto LABEL_329;
    goto LABEL_342;
  }
LABEL_341:
  v199 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
  {
LABEL_329:
    v198 = 2654435761u * self->_secondPassAssetLoadStartTimeInNs;
    if ((*((_WORD *)&self->_has + 4) & 0x800) != 0)
      goto LABEL_330;
    goto LABEL_343;
  }
LABEL_342:
  v198 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x800) != 0)
  {
LABEL_330:
    v197 = 2654435761u * self->_secondPassAssetLoadCompleteTimeInNs;
    if ((*((_WORD *)&self->_has + 4) & 0x1000) != 0)
      goto LABEL_331;
    goto LABEL_344;
  }
LABEL_343:
  v197 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x1000) != 0)
  {
LABEL_331:
    v196 = 2654435761u * self->_secondPassAudioStreamStartTimeInNs;
    if ((*((_WORD *)&self->_has + 4) & 0x2000) != 0)
      goto LABEL_332;
    goto LABEL_345;
  }
LABEL_344:
  v196 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x2000) != 0)
  {
LABEL_332:
    v195 = 2654435761u * self->_secondPassAudioStreamReadyTimeInNs;
    if ((*((_WORD *)&self->_has + 4) & 0x4000) != 0)
      goto LABEL_333;
    goto LABEL_346;
  }
LABEL_345:
  v195 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x4000) != 0)
  {
LABEL_333:
    v194 = 2654435761u * self->_secondPassFirstAudioPacketReceptionTimeInNs;
    if ((*((_WORD *)&self->_has + 4) & 0x8000) != 0)
      goto LABEL_334;
LABEL_347:
    v193 = 0;
    if ((v159 & 0x10000) != 0)
      goto LABEL_335;
    goto LABEL_348;
  }
LABEL_346:
  v194 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x8000) == 0)
    goto LABEL_347;
LABEL_334:
  v193 = 2654435761u * self->_secondPassLastAudioPacketReceptionTimeInNs;
  if ((v159 & 0x10000) != 0)
  {
LABEL_335:
    v192 = 2654435761u * self->_secondPassCheckerModelKeywordDetectionStartTimeInNs;
    goto LABEL_349;
  }
LABEL_348:
  v192 = 0;
LABEL_349:
  v255 = v19;
  v160 = v18;
  if ((v159 & 0x20000) != 0)
    v191 = 2654435761u * self->_secondPassCheckerModelKeywordDetectionEndTimeInNs;
  else
    v191 = 0;
  v161 = v29;
  v190 = -[NSString hash](self->_triggerPhrase, "hash");
  v162 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v162 & 0x40000) != 0)
  {
    lastDisplayWakeTimeOffsetInNs = self->_lastDisplayWakeTimeOffsetInNs;
    v165 = -lastDisplayWakeTimeOffsetInNs;
    if (lastDisplayWakeTimeOffsetInNs >= 0.0)
      v165 = self->_lastDisplayWakeTimeOffsetInNs;
    v166 = floor(v165 + 0.5);
    v167 = (v165 - v166) * 1.84467441e19;
    v163 = 2654435761u * (unint64_t)fmod(v166, 1.84467441e19);
    if (v167 >= 0.0)
    {
      if (v167 > 0.0)
        v163 += (unint64_t)v167;
    }
    else
    {
      v163 -= (unint64_t)fabs(v167);
    }
  }
  else
  {
    v163 = 0;
  }
  if ((v162 & 0x80000) == 0)
  {
    v168 = 0;
    if ((v162 & 0x100000) != 0)
      goto LABEL_362;
LABEL_368:
    v169 = 0;
    if ((v162 & 0x200000) != 0)
      goto LABEL_363;
LABEL_369:
    v175 = 0;
    v177 = v271;
    v176 = v272;
    v179 = v269;
    v178 = v270;
    v181 = v267;
    v180 = v268;
    v183 = v265;
    v182 = v266;
    v185 = v263;
    v184 = v264;
    v187 = v261;
    v186 = v262;
    v188 = v260;
    return v258 ^ v259 ^ v8 ^ v257 ^ v13 ^ v256 ^ v160 ^ v255 ^ v24 ^ v161 ^ v254 ^ v253 ^ v252 ^ v251 ^ v176 ^ v177 ^ v178 ^ v179 ^ v180 ^ v181 ^ v250 ^ v249 ^ v248 ^ v247 ^ v246 ^ v245 ^ v244 ^ v243 ^ v242 ^ v241 ^ v240 ^ v239 ^ v238 ^ v237 ^ v236 ^ v235 ^ v182 ^ v183 ^ v234 ^ v233 ^ v184 ^ v232 ^ v231 ^ v230 ^ v229 ^ v185 ^ v186 ^ v228 ^ v227 ^ v226 ^ v225 ^ v224 ^ v223 ^ v222 ^ v221 ^ v220 ^ v219 ^ v218 ^ v217 ^ v216 ^ v187 ^ v215 ^ v214 ^ v213 ^ v212 ^ v211 ^ v210 ^ v209 ^ v188 ^ v208 ^ v207 ^ v206 ^ v205 ^ v204 ^ v203 ^ v202 ^ v201 ^ v200 ^ v199 ^ v198 ^ v197 ^ v196 ^ v195 ^ v194 ^ v193 ^ v192 ^ v191 ^ v190 ^ v163 ^ v168 ^ v169 ^ v175;
  }
  v168 = 2654435761 * self->_isHSJSTriggerFromAlwaysOnMicBuffer;
  if ((v162 & 0x100000) == 0)
    goto LABEL_368;
LABEL_362:
  v169 = 2654435761u * self->_displayWakeTimeOffsetInNs;
  if ((v162 & 0x200000) == 0)
    goto LABEL_369;
LABEL_363:
  v170 = v168;
  neptuneDetectionApiScore = self->_neptuneDetectionApiScore;
  v172 = neptuneDetectionApiScore;
  if (neptuneDetectionApiScore < 0.0)
    v172 = -neptuneDetectionApiScore;
  v173 = floor(v172 + 0.5);
  v174 = (v172 - v173) * 1.84467441e19;
  v175 = 2654435761u * (unint64_t)fmod(v173, 1.84467441e19);
  if (v174 >= 0.0)
  {
    v177 = v271;
    v176 = v272;
    v179 = v269;
    v178 = v270;
    v181 = v267;
    v180 = v268;
    v183 = v265;
    v182 = v266;
    v185 = v263;
    v184 = v264;
    v187 = v261;
    v186 = v262;
    v188 = v260;
    v168 = v170;
    if (v174 > 0.0)
      v175 += (unint64_t)v174;
  }
  else
  {
    v175 -= (unint64_t)fabs(v174);
    v177 = v271;
    v176 = v272;
    v179 = v269;
    v178 = v270;
    v181 = v267;
    v180 = v268;
    v183 = v265;
    v182 = v266;
    v185 = v263;
    v184 = v264;
    v187 = v261;
    v186 = v262;
    v188 = v260;
    v168 = v170;
  }
  return v258 ^ v259 ^ v8 ^ v257 ^ v13 ^ v256 ^ v160 ^ v255 ^ v24 ^ v161 ^ v254 ^ v253 ^ v252 ^ v251 ^ v176 ^ v177 ^ v178 ^ v179 ^ v180 ^ v181 ^ v250 ^ v249 ^ v248 ^ v247 ^ v246 ^ v245 ^ v244 ^ v243 ^ v242 ^ v241 ^ v240 ^ v239 ^ v238 ^ v237 ^ v236 ^ v235 ^ v182 ^ v183 ^ v234 ^ v233 ^ v184 ^ v232 ^ v231 ^ v230 ^ v229 ^ v185 ^ v186 ^ v228 ^ v227 ^ v226 ^ v225 ^ v224 ^ v223 ^ v222 ^ v221 ^ v220 ^ v219 ^ v218 ^ v217 ^ v216 ^ v187 ^ v215 ^ v214 ^ v213 ^ v212 ^ v211 ^ v210 ^ v209 ^ v188 ^ v208 ^ v207 ^ v206 ^ v205 ^ v204 ^ v203 ^ v202 ^ v201 ^ v200 ^ v199 ^ v198 ^ v197 ^ v196 ^ v195 ^ v194 ^ v193 ^ v192 ^ v191 ^ v190 ^ v163 ^ v168 ^ v169 ^ v175;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $C31C01E161EA92E87F150FC44992F13F *p_has;
  uint64_t has;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  $C31C01E161EA92E87F150FC44992F13F *v23;
  uint64_t v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  $C31C01E161EA92E87F150FC44992F13F *v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned int v65;
  const __CFString *v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  int v78;
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
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  void *v110;
  int v111;
  void *v112;
  int v113;
  void *v114;
  int v115;
  void *v116;
  int v117;
  void *v118;
  int v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_has = &self->_has;
  has = (uint64_t)self->_has;
  if ((has & 0x100000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerEventInfo activeChannel](self, "activeChannel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("activeChannel"));

    has = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x40000000) == 0)
    {
LABEL_3:
      if ((has & 0x80000000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 0x40000000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo analyzerPrependingSamples](self, "analyzerPrependingSamples"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("analyzerPrependingSamples"));

  if ((*(_QWORD *)&self->_has & 0x80000000) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo analyzerTrailingSamples](self, "analyzerTrailingSamples"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("analyzerTrailingSamples"));

  }
LABEL_5:
  if (self->_audioProviderUUID)
  {
    -[MHSchemaMHVoiceTriggerEventInfo audioProviderUUID](self, "audioProviderUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("audioProviderUUID"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("audioProviderUUID"));

    }
  }
  if ((*(_QWORD *)&self->_has & 0x400) != 0)
  {
    v12 = -[MHSchemaMHVoiceTriggerEventInfo biometricClue](self, "biometricClue") - 1;
    if (v12 > 3)
      v13 = CFSTR("MHBIOMETRICMATCHRESULT_UNKOWN");
    else
      v13 = off_1E5630688[v12];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("biometricClue"));
  }
  if (self->_captureFilePath)
  {
    -[MHSchemaMHVoiceTriggerEventInfo captureFilePath](self, "captureFilePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("captureFilePath"));

  }
  if ((*(_QWORD *)&self->_has & 0x800000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo clientStartSampleCount](self, "clientStartSampleCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("clientStartSampleCount"));

  }
  if (self->_configDataHash)
  {
    -[MHSchemaMHVoiceTriggerEventInfo configDataHash](self, "configDataHash");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("configDataHash"));

  }
  if (self->_configPath)
  {
    -[MHSchemaMHVoiceTriggerEventInfo configPath](self, "configPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("configPath"));

  }
  if (self->_configVersion)
  {
    -[MHSchemaMHVoiceTriggerEventInfo configVersion](self, "configVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("configVersion"));

  }
  v23 = &self->_has;
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x800000000000000) != 0)
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHVoiceTriggerEventInfo cumulativeDowntimeInSec](self, "cumulativeDowntimeInSec");
    objc_msgSend(v26, "numberWithFloat:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("cumulativeDowntimeInSec"));

    v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v24 = *(_QWORD *)v23;
    if ((*(_QWORD *)v23 & 0x400000000000000) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v24 & 0x400000000000000) != 0)
  {
LABEL_32:
    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHVoiceTriggerEventInfo cumulativeUptimeInSec](self, "cumulativeUptimeInSec");
    objc_msgSend(v28, "numberWithFloat:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("cumulativeUptimeInSec"));

    v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v24 = (uint64_t)self->_has;
  }
LABEL_33:
  if ((v24 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo deltaTimeInNsFromlastPHSReject](self, "deltaTimeInNsFromlastPHSReject"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("deltaTimeInNsFromlastPHSReject"));

    v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v24 = (uint64_t)self->_has;
    if ((v24 & 0x80000000000000) == 0)
    {
LABEL_35:
      if ((v25 & 0x20) == 0)
        goto LABEL_36;
      goto LABEL_113;
    }
  }
  else if ((v24 & 0x80000000000000) == 0)
  {
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo deviceHandheld](self, "deviceHandheld"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("deviceHandheld"));

  v39 = *((unsigned __int16 *)&self->_has + 4);
  v25 = v39 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v39 & 0x20) == 0)
  {
LABEL_36:
    if ((v25 & 1) == 0)
      goto LABEL_37;
    goto LABEL_114;
  }
LABEL_113:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo didAudioStall](self, "didAudioStall"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("didAudioStall"));

  v41 = *((unsigned __int16 *)&self->_has + 4);
  v25 = v41 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v41 & 1) == 0)
  {
LABEL_37:
    if ((v25 & 0x100000) == 0)
      goto LABEL_38;
    goto LABEL_115;
  }
LABEL_114:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo didWakeAP](self, "didWakeAP"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("didWakeAP"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v25 & 0x100000) == 0)
  {
LABEL_38:
    if ((v25 & 4) == 0)
      goto LABEL_39;
    goto LABEL_116;
  }
LABEL_115:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo displayWakeTimeOffsetInNs](self, "displayWakeTimeOffsetInNs"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("displayWakeTimeOffsetInNs"));

  v44 = *((unsigned __int16 *)&self->_has + 4);
  v25 = v44 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v44 & 4) == 0)
  {
LABEL_39:
    if ((v24 & 0x1000000000) == 0)
      goto LABEL_40;
    goto LABEL_117;
  }
LABEL_116:
  v45 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo downtimeInSec](self, "downtimeInSec");
  objc_msgSend(v45, "numberWithFloat:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("downtimeInSec"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x1000000000) == 0)
  {
LABEL_40:
    if ((v24 & 0x200000) == 0)
      goto LABEL_41;
    goto LABEL_118;
  }
LABEL_117:
  v47 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo effectiveThreshold](self, "effectiveThreshold");
  objc_msgSend(v47, "numberWithFloat:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("effectiveThreshold"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x200000) == 0)
  {
LABEL_41:
    if ((v24 & 0x20000000) == 0)
      goto LABEL_42;
    goto LABEL_136;
  }
LABEL_118:
  v49 = -[MHSchemaMHVoiceTriggerEventInfo enhancedCarplayTriggerMode](self, "enhancedCarplayTriggerMode") - 1;
  if (v49 > 2)
    v50 = CFSTR("MHFIRSTPASSENHANCEDCARPLAYTRIGGERMODE_UNKNOWN");
  else
    v50 = off_1E56306A8[v49];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("enhancedCarplayTriggerMode"));
  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x20000000) == 0)
  {
LABEL_42:
    if ((v24 & 0x1000000000000) == 0)
      goto LABEL_43;
    goto LABEL_137;
  }
LABEL_136:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo extraSamplesAtStart](self, "extraSamplesAtStart"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("extraSamplesAtStart"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x1000000000000) == 0)
  {
LABEL_43:
    if ((v24 & 0x1000000000000000) == 0)
      goto LABEL_44;
    goto LABEL_138;
  }
LABEL_137:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerEventInfo hardwareSamplerate](self, "hardwareSamplerate"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("hardwareSamplerate"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x1000000000000000) == 0)
  {
LABEL_44:
    if ((v25 & 0x40) == 0)
      goto LABEL_45;
    goto LABEL_142;
  }
LABEL_138:
  v65 = -[MHSchemaMHVoiceTriggerEventInfo hostPowerStateAtTrigger](self, "hostPowerStateAtTrigger") - 1;
  if (v65 > 3)
    v66 = CFSTR("MHHOSTPOWERSTATE_UNKNOWN");
  else
    v66 = off_1E56306C0[v65];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("hostPowerStateAtTrigger"));
  v67 = *((unsigned __int16 *)&self->_has + 4);
  v25 = v67 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v67 & 0x40) == 0)
  {
LABEL_45:
    if ((v24 & 0x2000000000000) == 0)
      goto LABEL_46;
    goto LABEL_143;
  }
LABEL_142:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isBargeIn](self, "isBargeIn"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("isBargeIn"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x2000000000000) == 0)
  {
LABEL_46:
    if ((v25 & 0x80000) == 0)
      goto LABEL_47;
    goto LABEL_144;
  }
LABEL_143:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isContinuous](self, "isContinuous"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("isContinuous"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v25 & 0x80000) == 0)
  {
LABEL_47:
    if ((v24 & 0x800000000) == 0)
      goto LABEL_48;
    goto LABEL_145;
  }
LABEL_144:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isHSJSTriggerFromAlwaysOnMicBuffer](self, "isHSJSTriggerFromAlwaysOnMicBuffer"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("isHSJSTriggerFromAlwaysOnMicBuffer"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x800000000) == 0)
  {
LABEL_48:
    if ((v24 & 0x2000000000000000) == 0)
      goto LABEL_49;
    goto LABEL_146;
  }
LABEL_145:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isMaximized](self, "isMaximized"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("isMaximized"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x2000000000000000) == 0)
  {
LABEL_49:
    if ((v24 & 0x40000000000000) == 0)
      goto LABEL_50;
    goto LABEL_147;
  }
LABEL_146:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isMediaPlaying](self, "isMediaPlaying"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("isMediaPlaying"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x40000000000000) == 0)
  {
LABEL_50:
    if ((v24 & 0x100000000) == 0)
      goto LABEL_51;
    goto LABEL_148;
  }
LABEL_147:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isSecondChance](self, "isSecondChance"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("isSecondChance"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x100000000) == 0)
  {
LABEL_51:
    if ((v25 & 0x80) == 0)
      goto LABEL_52;
    goto LABEL_149;
  }
LABEL_148:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isTriggerEvent](self, "isTriggerEvent"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("isTriggerEvent"));

  v75 = *((unsigned __int16 *)&self->_has + 4);
  v25 = v75 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v75 & 0x80) == 0)
  {
LABEL_52:
    if ((v24 & 0x1000) == 0)
      goto LABEL_53;
    goto LABEL_150;
  }
LABEL_149:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo isWakeFromSleep](self, "isWakeFromSleep"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("isWakeFromSleep"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x1000) == 0)
  {
LABEL_53:
    if ((v25 & 8) == 0)
      goto LABEL_54;
    goto LABEL_151;
  }
LABEL_150:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerEventInfo lastConsecutivePHSRejects](self, "lastConsecutivePHSRejects"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("lastConsecutivePHSRejects"));

  v78 = *((unsigned __int16 *)&self->_has + 4);
  v25 = v78 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v78 & 8) == 0)
  {
LABEL_54:
    if ((v25 & 0x40000) == 0)
      goto LABEL_55;
    goto LABEL_152;
  }
LABEL_151:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerEventInfo lastConsecutiveVTRejects](self, "lastConsecutiveVTRejects"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, CFSTR("lastConsecutiveVTRejects"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v25 & 0x40000) == 0)
  {
LABEL_55:
    if ((v24 & 0x4000000000000000) == 0)
      goto LABEL_56;
    goto LABEL_153;
  }
LABEL_152:
  v80 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo lastDisplayWakeTimeOffsetInNs](self, "lastDisplayWakeTimeOffsetInNs");
  objc_msgSend(v80, "numberWithDouble:");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("lastDisplayWakeTimeOffsetInNs"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x4000000000000000) == 0)
  {
LABEL_56:
    if ((v25 & 0x200000) == 0)
      goto LABEL_57;
    goto LABEL_154;
  }
LABEL_153:
  v82 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo mediaVolume](self, "mediaVolume");
  objc_msgSend(v82, "numberWithFloat:");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("mediaVolume"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v25 & 0x200000) == 0)
  {
LABEL_57:
    if ((v24 & 0x8000000000000000) == 0)
      goto LABEL_58;
    goto LABEL_155;
  }
LABEL_154:
  v84 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo neptuneDetectionApiScore](self, "neptuneDetectionApiScore");
  objc_msgSend(v84, "numberWithFloat:");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v85, CFSTR("neptuneDetectionApiScore"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x8000000000000000) == 0)
  {
LABEL_58:
    if ((v24 & 0x10000000000) == 0)
      goto LABEL_59;
    goto LABEL_156;
  }
LABEL_155:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo onBatteryPower](self, "onBatteryPower"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("onBatteryPower"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x10000000000) == 0)
  {
LABEL_59:
    if ((v24 & 0x2000000000) == 0)
      goto LABEL_60;
    goto LABEL_157;
  }
LABEL_156:
  v87 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo recognizerScaleFactor](self, "recognizerScaleFactor");
  objc_msgSend(v87, "numberWithFloat:");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v88, CFSTR("recognizerScaleFactor"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x2000000000) == 0)
  {
LABEL_60:
    if ((v24 & 0x4000000000) == 0)
      goto LABEL_61;
    goto LABEL_158;
  }
LABEL_157:
  v89 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo recognizerScore](self, "recognizerScore");
  objc_msgSend(v89, "numberWithFloat:");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("recognizerScore"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x4000000000) == 0)
  {
LABEL_61:
    if ((v24 & 0x8000000000) == 0)
      goto LABEL_62;
    goto LABEL_159;
  }
LABEL_158:
  v91 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo recognizerThresholdOffset](self, "recognizerThresholdOffset");
  objc_msgSend(v91, "numberWithFloat:");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("recognizerThresholdOffset"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x8000000000) == 0)
  {
LABEL_62:
    if ((v24 & 0x100000) == 0)
      goto LABEL_63;
    goto LABEL_160;
  }
LABEL_159:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo recognizerWaitTimeInNs](self, "recognizerWaitTimeInNs"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v93, CFSTR("recognizerWaitTimeInNs"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x100000) == 0)
  {
LABEL_63:
    if ((v24 & 0x40000) == 0)
      goto LABEL_64;
    goto LABEL_161;
  }
LABEL_160:
  v94 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo remoteMicVADMyriadThreshold](self, "remoteMicVADMyriadThreshold");
  objc_msgSend(v94, "numberWithFloat:");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("remoteMicVADMyriadThreshold"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x40000) == 0)
  {
LABEL_64:
    if ((v24 & 0x80000) == 0)
      goto LABEL_65;
    goto LABEL_162;
  }
LABEL_161:
  v96 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo remoteMicVADScore](self, "remoteMicVADScore");
  objc_msgSend(v96, "numberWithFloat:");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v97, CFSTR("remoteMicVADScore"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x80000) == 0)
  {
LABEL_65:
    if ((v24 & 0x800) == 0)
      goto LABEL_66;
    goto LABEL_163;
  }
LABEL_162:
  v98 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo remoteMicVADThreshold](self, "remoteMicVADThreshold");
  objc_msgSend(v98, "numberWithFloat:");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v99, CFSTR("remoteMicVADThreshold"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x800) == 0)
  {
LABEL_66:
    if ((v24 & 8) == 0)
      goto LABEL_67;
    goto LABEL_164;
  }
LABEL_163:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo satBeingTrained](self, "satBeingTrained"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v100, CFSTR("satBeingTrained"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 8) == 0)
  {
LABEL_67:
    if ((v24 & 4) == 0)
      goto LABEL_68;
    goto LABEL_165;
  }
LABEL_164:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerEventInfo satNumTrainingUtterances](self, "satNumTrainingUtterances"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v101, CFSTR("satNumTrainingUtterances"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 4) == 0)
  {
LABEL_68:
    if ((v24 & 0x10) == 0)
      goto LABEL_69;
    goto LABEL_166;
  }
LABEL_165:
  v102 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo satScore](self, "satScore");
  objc_msgSend(v102, "numberWithFloat:");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v103, CFSTR("satScore"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x10) == 0)
  {
LABEL_69:
    if ((v24 & 0x20) == 0)
      goto LABEL_70;
    goto LABEL_167;
  }
LABEL_166:
  v104 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo satThreshold](self, "satThreshold");
  objc_msgSend(v104, "numberWithFloat:");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v105, CFSTR("satThreshold"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x20) == 0)
  {
LABEL_70:
    if ((v24 & 2) == 0)
      goto LABEL_71;
    goto LABEL_168;
  }
LABEL_167:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo satTriggered](self, "satTriggered"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v106, CFSTR("satTriggered"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 2) == 0)
  {
LABEL_71:
    if ((v24 & 1) == 0)
      goto LABEL_72;
    goto LABEL_169;
  }
LABEL_168:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAnalyerEndSampleCount](self, "secondPassAnalyerEndSampleCount"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v107, CFSTR("secondPassAnalyerEndSampleCount"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v24 & 1) == 0)
  {
LABEL_72:
    if ((v25 & 0x800) == 0)
      goto LABEL_73;
    goto LABEL_170;
  }
LABEL_169:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAnalyerStartSampleCount](self, "secondPassAnalyerStartSampleCount"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v108, CFSTR("secondPassAnalyerStartSampleCount"));

  v109 = *((unsigned __int16 *)&self->_has + 4);
  v25 = v109 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v109 & 0x800) == 0)
  {
LABEL_73:
    if ((v25 & 0x400) == 0)
      goto LABEL_74;
    goto LABEL_171;
  }
LABEL_170:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAssetLoadCompleteTimeInNs](self, "secondPassAssetLoadCompleteTimeInNs"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v110, CFSTR("secondPassAssetLoadCompleteTimeInNs"));

  v111 = *((unsigned __int16 *)&self->_has + 4);
  v25 = v111 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v111 & 0x400) == 0)
  {
LABEL_74:
    if ((v25 & 0x200) == 0)
      goto LABEL_75;
    goto LABEL_172;
  }
LABEL_171:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAssetLoadStartTimeInNs](self, "secondPassAssetLoadStartTimeInNs"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v112, CFSTR("secondPassAssetLoadStartTimeInNs"));

  v113 = *((unsigned __int16 *)&self->_has + 4);
  v25 = v113 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v113 & 0x200) == 0)
  {
LABEL_75:
    if ((v25 & 0x100) == 0)
      goto LABEL_76;
    goto LABEL_173;
  }
LABEL_172:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAssetQueryCompleteTimeInNs](self, "secondPassAssetQueryCompleteTimeInNs"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v114, CFSTR("secondPassAssetQueryCompleteTimeInNs"));

  v115 = *((unsigned __int16 *)&self->_has + 4);
  v25 = v115 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v115 & 0x100) == 0)
  {
LABEL_76:
    if ((v25 & 0x2000) == 0)
      goto LABEL_77;
    goto LABEL_174;
  }
LABEL_173:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAssetQueryStartTimeInNs](self, "secondPassAssetQueryStartTimeInNs"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v116, CFSTR("secondPassAssetQueryStartTimeInNs"));

  v117 = *((unsigned __int16 *)&self->_has + 4);
  v25 = v117 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v117 & 0x2000) == 0)
  {
LABEL_77:
    if ((v25 & 0x1000) == 0)
      goto LABEL_78;
    goto LABEL_175;
  }
LABEL_174:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAudioStreamReadyTimeInNs](self, "secondPassAudioStreamReadyTimeInNs"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v118, CFSTR("secondPassAudioStreamReadyTimeInNs"));

  v119 = *((unsigned __int16 *)&self->_has + 4);
  v25 = v119 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v119 & 0x1000) == 0)
  {
LABEL_78:
    if ((v25 & 0x20000) == 0)
      goto LABEL_79;
    goto LABEL_176;
  }
LABEL_175:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassAudioStreamStartTimeInNs](self, "secondPassAudioStreamStartTimeInNs"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v120, CFSTR("secondPassAudioStreamStartTimeInNs"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v25 & 0x20000) == 0)
  {
LABEL_79:
    if ((v25 & 0x10000) == 0)
      goto LABEL_80;
    goto LABEL_177;
  }
LABEL_176:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassCheckerModelKeywordDetectionEndTimeInNs](self, "secondPassCheckerModelKeywordDetectionEndTimeInNs"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v121, CFSTR("secondPassCheckerModelKeywordDetectionEndTimeInNs"));

  v25 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v24 = (uint64_t)self->_has;
  if ((v25 & 0x10000) == 0)
  {
LABEL_80:
    if ((v25 & 0x4000) == 0)
      goto LABEL_81;
    goto LABEL_178;
  }
LABEL_177:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassCheckerModelKeywordDetectionStartTimeInNs](self, "secondPassCheckerModelKeywordDetectionStartTimeInNs"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v122, CFSTR("secondPassCheckerModelKeywordDetectionStartTimeInNs"));

  LOWORD(v25) = *((_WORD *)&self->_has + 4);
  v24 = (uint64_t)self->_has;
  if ((v25 & 0x4000) == 0)
  {
LABEL_81:
    if ((v25 & 0x8000) == 0)
      goto LABEL_82;
    goto LABEL_179;
  }
LABEL_178:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassFirstAudioPacketReceptionTimeInNs](self, "secondPassFirstAudioPacketReceptionTimeInNs"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v123, CFSTR("secondPassFirstAudioPacketReceptionTimeInNs"));

  LOBYTE(v25) = *((_WORD *)&self->_has + 4);
  v24 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x8000) == 0)
  {
LABEL_82:
    if ((v24 & 0x10000) == 0)
      goto LABEL_83;
    goto LABEL_180;
  }
LABEL_179:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo secondPassLastAudioPacketReceptionTimeInNs](self, "secondPassLastAudioPacketReceptionTimeInNs"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v124, CFSTR("secondPassLastAudioPacketReceptionTimeInNs"));

  LOWORD(v25) = *((_WORD *)&self->_has + 4);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x10000) == 0)
  {
LABEL_83:
    if ((v24 & 0x20000) == 0)
      goto LABEL_84;
    goto LABEL_181;
  }
LABEL_180:
  v125 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo shadowMicScore](self, "shadowMicScore");
  objc_msgSend(v125, "numberWithFloat:");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v126, CFSTR("shadowMicScore"));

  LOWORD(v25) = *((_WORD *)&self->_has + 4);
  v24 = (uint64_t)self->_has;
  if ((v24 & 0x20000) == 0)
  {
LABEL_84:
    if ((v25 & 0x10) == 0)
      goto LABEL_85;
    goto LABEL_182;
  }
LABEL_181:
  v127 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo shadowMicScoreThresholdForVAD](self, "shadowMicScoreThresholdForVAD");
  objc_msgSend(v127, "numberWithFloat:");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v128, CFSTR("shadowMicScoreThresholdForVAD"));

  v24 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x10) == 0)
  {
LABEL_85:
    if ((v24 & 0x200) == 0)
      goto LABEL_86;
    goto LABEL_183;
  }
LABEL_182:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MHSchemaMHVoiceTriggerEventInfo siriIsActiveOrOtherAssertion](self, "siriIsActiveOrOtherAssertion"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v129, CFSTR("siriIsActiveOrOtherAssertion"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x200) == 0)
  {
LABEL_86:
    if ((v24 & 0x80) == 0)
      goto LABEL_87;
    goto LABEL_184;
  }
LABEL_183:
  v130 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo tdSpeakerRecognizerCombinationWeight](self, "tdSpeakerRecognizerCombinationWeight");
  objc_msgSend(v130, "numberWithFloat:");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v131, CFSTR("tdSpeakerRecognizerCombinationWeight"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x80) == 0)
  {
LABEL_87:
    if ((v24 & 0x100) == 0)
      goto LABEL_88;
    goto LABEL_185;
  }
LABEL_184:
  v132 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo tdSpeakerRecognizerCombinedScore](self, "tdSpeakerRecognizerCombinedScore");
  objc_msgSend(v132, "numberWithFloat:");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v133, CFSTR("tdSpeakerRecognizerCombinedScore"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x100) == 0)
  {
LABEL_88:
    if ((v24 & 0x40) == 0)
      goto LABEL_89;
    goto LABEL_186;
  }
LABEL_185:
  v134 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo tdSpeakerRecognizerCombinedThreshold](self, "tdSpeakerRecognizerCombinedThreshold");
  objc_msgSend(v134, "numberWithFloat:");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v135, CFSTR("tdSpeakerRecognizerCombinedThreshold"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x40) == 0)
  {
LABEL_89:
    if ((v24 & 0x20000000000) == 0)
      goto LABEL_90;
    goto LABEL_187;
  }
LABEL_186:
  v136 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo tdSpeakerRecognizerScore](self, "tdSpeakerRecognizerScore");
  objc_msgSend(v136, "numberWithFloat:");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v137, CFSTR("tdSpeakerRecognizerScore"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x20000000000) == 0)
  {
LABEL_90:
    if ((v24 & 0x200000000) == 0)
      goto LABEL_91;
    goto LABEL_188;
  }
LABEL_187:
  v138 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo threshold](self, "threshold");
  objc_msgSend(v138, "numberWithFloat:");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v139, CFSTR("threshold"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x200000000) == 0)
  {
LABEL_91:
    if ((v24 & 0x20000000000000) == 0)
      goto LABEL_92;
    goto LABEL_189;
  }
LABEL_188:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo totalSampleCount](self, "totalSampleCount"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v140, CFSTR("totalSampleCount"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x20000000000000) == 0)
  {
LABEL_92:
    if ((v24 & 0x10000000000000) == 0)
      goto LABEL_93;
    goto LABEL_190;
  }
LABEL_189:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo totalSamplesAtEndOfCapture](self, "totalSamplesAtEndOfCapture"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v141, CFSTR("totalSamplesAtEndOfCapture"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x10000000000000) == 0)
  {
LABEL_93:
    if ((v24 & 0x8000000000000) == 0)
      goto LABEL_94;
    goto LABEL_191;
  }
LABEL_190:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo totalSamplesAtTriggerEnd](self, "totalSamplesAtTriggerEnd"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v142, CFSTR("totalSamplesAtTriggerEnd"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x8000000000000) == 0)
  {
LABEL_94:
    if ((v24 & 0x4000000000000) == 0)
      goto LABEL_95;
    goto LABEL_192;
  }
LABEL_191:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo totalSamplesAtTriggerStart](self, "totalSamplesAtTriggerStart"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v143, CFSTR("totalSamplesAtTriggerStart"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x4000000000000) == 0)
  {
LABEL_95:
    if ((v24 & 0x8000000) == 0)
      goto LABEL_96;
    goto LABEL_193;
  }
LABEL_192:
  v144 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo triggerDurationInNs](self, "triggerDurationInNs");
  objc_msgSend(v144, "numberWithFloat:");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v145, CFSTR("triggerDurationInNs"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x8000000) == 0)
  {
LABEL_96:
    if ((v24 & 0x1000000) == 0)
      goto LABEL_97;
    goto LABEL_194;
  }
LABEL_193:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerEndNs](self, "triggerEndNs"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v146, CFSTR("triggerEndNs"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x1000000) == 0)
  {
LABEL_97:
    if ((v24 & 0x400000000000) == 0)
      goto LABEL_98;
    goto LABEL_195;
  }
LABEL_194:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerEndSampleCount](self, "triggerEndSampleCount"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v147, CFSTR("triggerEndSampleCount"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x400000000000) == 0)
  {
LABEL_98:
    if ((v24 & 0x80000000000) == 0)
      goto LABEL_99;
    goto LABEL_196;
  }
LABEL_195:
  v148 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo triggerEndTime](self, "triggerEndTime");
  objc_msgSend(v148, "numberWithDouble:");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v149, CFSTR("triggerEndTime"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x80000000000) == 0)
  {
LABEL_99:
    if ((v24 & 0x4000) == 0)
      goto LABEL_100;
    goto LABEL_197;
  }
LABEL_196:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerEndTimeOffsetInNs](self, "triggerEndTimeOffsetInNs"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v150, CFSTR("triggerEndTimeOffsetInNs"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x4000) == 0)
  {
LABEL_100:
    if ((v24 & 0x8000) == 0)
      goto LABEL_101;
    goto LABEL_198;
  }
LABEL_197:
  v151 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo triggerExplicitSatScore](self, "triggerExplicitSatScore");
  objc_msgSend(v151, "numberWithFloat:");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v152, CFSTR("triggerExplicitSatScore"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x8000) == 0)
  {
LABEL_101:
    if ((v24 & 0x10000000) == 0)
      goto LABEL_102;
    goto LABEL_199;
  }
LABEL_198:
  v153 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo triggerExplicitTDSRSatScore](self, "triggerExplicitTDSRSatScore");
  objc_msgSend(v153, "numberWithFloat:");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v154, CFSTR("triggerExplicitTDSRSatScore"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x10000000) == 0)
  {
LABEL_102:
    if ((v24 & 0x2000000) == 0)
      goto LABEL_103;
    goto LABEL_200;
  }
LABEL_199:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerFireNs](self, "triggerFireNs"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v155, CFSTR("triggerFireNs"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x2000000) == 0)
  {
LABEL_103:
    if ((v24 & 0x100000000000) == 0)
      goto LABEL_104;
    goto LABEL_201;
  }
LABEL_200:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerFireSampleCount](self, "triggerFireSampleCount"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v156, CFSTR("triggerFireSampleCount"));

  v24 = (uint64_t)self->_has;
  if ((v24 & 0x100000000000) == 0)
  {
LABEL_104:
    if ((v24 & 0x800000000000) == 0)
      goto LABEL_106;
    goto LABEL_105;
  }
LABEL_201:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerFireTimeOffsetInNs](self, "triggerFireTimeOffsetInNs"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v157, CFSTR("triggerFireTimeOffsetInNs"));

  if ((*(_QWORD *)&self->_has & 0x800000000000) != 0)
  {
LABEL_105:
    v30 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHVoiceTriggerEventInfo triggerFiredTime](self, "triggerFiredTime");
    objc_msgSend(v30, "numberWithDouble:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("triggerFiredTime"));

  }
LABEL_106:
  if (self->_triggerPhrase)
  {
    -[MHSchemaMHVoiceTriggerEventInfo triggerPhrase](self, "triggerPhrase");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("triggerPhrase"));

  }
  v34 = &self->_has;
  v35 = (uint64_t)self->_has;
  if ((v35 & 0x400000000) != 0)
  {
    v51 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHVoiceTriggerEventInfo triggerScore](self, "triggerScore");
    objc_msgSend(v51, "numberWithFloat:");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("triggerScore"));

    v36 = *((_WORD *)&self->_has + 4);
    v35 = *(_QWORD *)v34;
    if ((*(_QWORD *)v34 & 0x4000000) == 0)
      goto LABEL_122;
    goto LABEL_121;
  }
  v36 = *((_WORD *)&self->_has + 4);
  if ((v35 & 0x4000000) != 0)
  {
LABEL_121:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerStartNs](self, "triggerStartNs"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("triggerStartNs"));

    v36 = *((_WORD *)&self->_has + 4);
    v35 = (uint64_t)self->_has;
  }
LABEL_122:
  if ((v35 & 0x400000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerStartSampleCount](self, "triggerStartSampleCount"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("triggerStartSampleCount"));

    v36 = *((_WORD *)&self->_has + 4);
    v35 = (uint64_t)self->_has;
    if ((v35 & 0x200000000000) == 0)
    {
LABEL_124:
      if ((v35 & 0x40000000000) == 0)
        goto LABEL_125;
      goto LABEL_131;
    }
  }
  else if ((v35 & 0x200000000000) == 0)
  {
    goto LABEL_124;
  }
  v59 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerEventInfo triggerStartTime](self, "triggerStartTime");
  objc_msgSend(v59, "numberWithDouble:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("triggerStartTime"));

  v36 = *((_WORD *)&self->_has + 4);
  v35 = (uint64_t)self->_has;
  if ((v35 & 0x40000000000) == 0)
  {
LABEL_125:
    if ((v35 & 0x200000000000000) == 0)
      goto LABEL_126;
LABEL_132:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo twoShotAudibleFeedbackDelayInNs](self, "twoShotAudibleFeedbackDelayInNs"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("twoShotAudibleFeedbackDelayInNs"));

    if ((*((_WORD *)&self->_has + 4) & 2) == 0)
      goto LABEL_128;
    goto LABEL_127;
  }
LABEL_131:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerEventInfo triggerStartTimeOffsetInNs](self, "triggerStartTimeOffsetInNs"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("triggerStartTimeOffsetInNs"));

  v36 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x200000000000000) != 0)
    goto LABEL_132;
LABEL_126:
  if ((v36 & 2) != 0)
  {
LABEL_127:
    v54 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHVoiceTriggerEventInfo uptimeInSec](self, "uptimeInSec");
    objc_msgSend(v54, "numberWithFloat:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("uptimeInSec"));

  }
LABEL_128:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v56 = v3;

  return v56;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHVoiceTriggerEventInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHVoiceTriggerEventInfo)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHVoiceTriggerEventInfo *v5;
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
    self = -[MHSchemaMHVoiceTriggerEventInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHVoiceTriggerEventInfo)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHVoiceTriggerEventInfo *v5;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
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
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  SISchemaUUID *v77;
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
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  MHSchemaMHVoiceTriggerEventInfo *v112;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  objc_super v199;

  v4 = a3;
  v199.receiver = self;
  v199.super_class = (Class)MHSchemaMHVoiceTriggerEventInfo;
  v5 = -[MHSchemaMHVoiceTriggerEventInfo init](&v199, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondPassAnalyerStartSampleCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAnalyerStartSampleCount:](v5, "setSecondPassAnalyerStartSampleCount:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondPassAnalyerEndSampleCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAnalyerEndSampleCount:](v5, "setSecondPassAnalyerEndSampleCount:", objc_msgSend(v7, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("satScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setSatScore:](v5, "setSatScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("satNumTrainingUtterances"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSatNumTrainingUtterances:](v5, "setSatNumTrainingUtterances:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("satThreshold"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setSatThreshold:](v5, "setSatThreshold:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("satTriggered"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSatTriggered:](v5, "setSatTriggered:", objc_msgSend(v11, "BOOLValue"));
    v147 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerScore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setTdSpeakerRecognizerScore:](v5, "setTdSpeakerRecognizerScore:");
    }
    v143 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerCombinedScore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v198 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setTdSpeakerRecognizerCombinedScore:](v5, "setTdSpeakerRecognizerCombinedScore:");
    }
    v146 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerCombinedThreshold"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setTdSpeakerRecognizerCombinedThreshold:](v5, "setTdSpeakerRecognizerCombinedThreshold:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerCombinationWeight"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v197 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setTdSpeakerRecognizerCombinationWeight:](v5, "setTdSpeakerRecognizerCombinationWeight:");
    }
    v142 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("biometricClue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setBiometricClue:](v5, "setBiometricClue:", objc_msgSend(v16, "intValue"));
    v141 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("satBeingTrained"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v196 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSatBeingTrained:](v5, "setSatBeingTrained:", objc_msgSend(v17, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastConsecutivePHSRejects"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setLastConsecutivePHSRejects:](v5, "setLastConsecutivePHSRejects:", objc_msgSend(v18, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deltaTimeInNsFromlastPHSReject"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v195 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setDeltaTimeInNsFromlastPHSReject:](v5, "setDeltaTimeInNsFromlastPHSReject:", objc_msgSend(v19, "unsignedLongLongValue"));
    v145 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerExplicitSatScore"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v20, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerExplicitSatScore:](v5, "setTriggerExplicitSatScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerExplicitTDSRSatScore"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v194 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerExplicitTDSRSatScore:](v5, "setTriggerExplicitTDSRSatScore:");
    }
    v144 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shadowMicScore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setShadowMicScore:](v5, "setShadowMicScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shadowMicScoreThresholdForVAD"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v193 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setShadowMicScoreThresholdForVAD:](v5, "setShadowMicScoreThresholdForVAD:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("remoteMicVADScore"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v24, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setRemoteMicVADScore:](v5, "setRemoteMicVADScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("remoteMicVADThreshold"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v192 = v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v25, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setRemoteMicVADThreshold:](v5, "setRemoteMicVADThreshold:");
    }
    v140 = v18;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("remoteMicVADMyriadThreshold"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v26, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setRemoteMicVADMyriadThreshold:](v5, "setRemoteMicVADMyriadThreshold:");
    }
    v136 = v26;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enhancedCarplayTriggerMode"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v191 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setEnhancedCarplayTriggerMode:](v5, "setEnhancedCarplayTriggerMode:", objc_msgSend(v27, "intValue"));
    v139 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerStartSampleCount"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerStartSampleCount:](v5, "setTriggerStartSampleCount:", objc_msgSend(v28, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientStartSampleCount"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v190 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setClientStartSampleCount:](v5, "setClientStartSampleCount:", objc_msgSend(v29, "unsignedLongLongValue"));
    v138 = v22;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerEndSampleCount"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerEndSampleCount:](v5, "setTriggerEndSampleCount:", objc_msgSend(v30, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerFireSampleCount"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v189 = v31;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerFireSampleCount:](v5, "setTriggerFireSampleCount:", objc_msgSend(v31, "unsignedLongLongValue"));
    v135 = v28;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerStartNs"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerStartNs:](v5, "setTriggerStartNs:", objc_msgSend(v32, "unsignedLongLongValue"));
    v133 = v32;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerEndNs"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v188 = v33;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerEndNs:](v5, "setTriggerEndNs:", objc_msgSend(v33, "unsignedLongLongValue"));
    v137 = v24;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerFireNs"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerFireNs:](v5, "setTriggerFireNs:", objc_msgSend(v34, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("extraSamplesAtStart"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v187 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setExtraSamplesAtStart:](v5, "setExtraSamplesAtStart:", objc_msgSend(v35, "unsignedLongLongValue"));
    v134 = v30;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("analyzerPrependingSamples"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setAnalyzerPrependingSamples:](v5, "setAnalyzerPrependingSamples:", objc_msgSend(v36, "unsignedLongLongValue"));
    v131 = v36;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("analyzerTrailingSamples"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v186 = v37;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setAnalyzerTrailingSamples:](v5, "setAnalyzerTrailingSamples:", objc_msgSend(v37, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTriggerEvent"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setIsTriggerEvent:](v5, "setIsTriggerEvent:", objc_msgSend(v38, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalSampleCount"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v185 = v39;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setTotalSampleCount:](v5, "setTotalSampleCount:", objc_msgSend(v39, "unsignedLongLongValue"));
    v132 = v34;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerScore"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v40, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerScore:](v5, "setTriggerScore:");
    }
    v129 = v40;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMaximized"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v184 = v41;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setIsMaximized:](v5, "setIsMaximized:", objc_msgSend(v41, "BOOLValue"));
    v130 = v38;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("effectiveThreshold"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v42, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setEffectiveThreshold:](v5, "setEffectiveThreshold:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizerScore"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v183 = v43;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v43, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setRecognizerScore:](v5, "setRecognizerScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizerThresholdOffset"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v44, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setRecognizerThresholdOffset:](v5, "setRecognizerThresholdOffset:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizerWaitTimeInNs"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v182 = v45;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setRecognizerWaitTimeInNs:](v5, "setRecognizerWaitTimeInNs:", objc_msgSend(v45, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizerScaleFactor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v46, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setRecognizerScaleFactor:](v5, "setRecognizerScaleFactor:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("threshold"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v181 = v47;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v47, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setThreshold:](v5, "setThreshold:");
    }
    v128 = v42;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerStartTimeOffsetInNs"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerStartTimeOffsetInNs:](v5, "setTriggerStartTimeOffsetInNs:", objc_msgSend(v48, "unsignedLongLongValue"));
    v125 = v48;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerEndTimeOffsetInNs"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v180 = v49;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerEndTimeOffsetInNs:](v5, "setTriggerEndTimeOffsetInNs:", objc_msgSend(v49, "unsignedLongLongValue"));
    v50 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerFireTimeOffsetInNs"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerFireTimeOffsetInNs:](v5, "setTriggerFireTimeOffsetInNs:", objc_msgSend(v51, "unsignedLongLongValue"));
    v124 = v51;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerStartTime"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v179 = v52;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v52, "doubleValue");
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerStartTime:](v5, "setTriggerStartTime:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerEndTime"));
    v53 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v178 = (void *)v53;
    v54 = v50;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v178, "doubleValue");
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerEndTime:](v5, "setTriggerEndTime:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerFiredTime"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v177 = v55;
    v127 = v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v55, "doubleValue");
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerFiredTime:](v5, "setTriggerFiredTime:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hardwareSamplerate"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setHardwareSamplerate:](v5, "setHardwareSamplerate:", objc_msgSend(v56, "unsignedIntValue"));
    v123 = v56;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isContinuous"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v176 = v57;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setIsContinuous:](v5, "setIsContinuous:", objc_msgSend(v57, "BOOLValue"));
    v58 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerDurationInNs"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v59, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerDurationInNs:](v5, "setTriggerDurationInNs:");
    }
    v122 = v59;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalSamplesAtTriggerStart"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v175 = v60;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setTotalSamplesAtTriggerStart:](v5, "setTotalSamplesAtTriggerStart:", objc_msgSend(v60, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalSamplesAtTriggerEnd"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setTotalSamplesAtTriggerEnd:](v5, "setTotalSamplesAtTriggerEnd:", objc_msgSend(v61, "unsignedLongLongValue"));
    v121 = v61;
    v148 = v58;
    v149 = v54;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalSamplesAtEndOfCapture"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setTotalSamplesAtEndOfCapture:](v5, "setTotalSamplesAtEndOfCapture:", objc_msgSend(v62, "unsignedLongLongValue"));
    v120 = v62;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configVersion"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v64 = (void *)objc_msgSend(v63, "copy");
      -[MHSchemaMHVoiceTriggerEventInfo setConfigVersion:](v5, "setConfigVersion:", v64);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configPath"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v174 = v65;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v66 = (void *)objc_msgSend(v65, "copy");
      -[MHSchemaMHVoiceTriggerEventInfo setConfigPath:](v5, "setConfigPath:", v66);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSecondChance"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v173 = v67;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setIsSecondChance:](v5, "setIsSecondChance:", objc_msgSend(v67, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceHandheld"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v172 = v68;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setDeviceHandheld:](v5, "setDeviceHandheld:", objc_msgSend(v68, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeChannel"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v171 = v69;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setActiveChannel:](v5, "setActiveChannel:", objc_msgSend(v69, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("twoShotAudibleFeedbackDelayInNs"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v170 = v70;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setTwoShotAudibleFeedbackDelayInNs:](v5, "setTwoShotAudibleFeedbackDelayInNs:", objc_msgSend(v70, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cumulativeUptimeInSec"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v169 = v71;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v71, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setCumulativeUptimeInSec:](v5, "setCumulativeUptimeInSec:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cumulativeDowntimeInSec"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v168 = v72;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v72, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setCumulativeDowntimeInSec:](v5, "setCumulativeDowntimeInSec:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hostPowerStateAtTrigger"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v167 = v73;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setHostPowerStateAtTrigger:](v5, "setHostPowerStateAtTrigger:", objc_msgSend(v73, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMediaPlaying"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v166 = v74;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setIsMediaPlaying:](v5, "setIsMediaPlaying:", objc_msgSend(v74, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaVolume"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v165 = v75;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v75, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setMediaVolume:](v5, "setMediaVolume:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioProviderUUID"));
    v76 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v164 = (void *)v76;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v76);
      -[MHSchemaMHVoiceTriggerEventInfo setAudioProviderUUID:](v5, "setAudioProviderUUID:", v77);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("onBatteryPower"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v163 = v78;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setOnBatteryPower:](v5, "setOnBatteryPower:", objc_msgSend(v78, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("didWakeAP"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v162 = v79;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setDidWakeAP:](v5, "setDidWakeAP:", objc_msgSend(v79, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uptimeInSec"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v161 = v80;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v80, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setUptimeInSec:](v5, "setUptimeInSec:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("downtimeInSec"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v160 = v81;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v81, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setDowntimeInSec:](v5, "setDowntimeInSec:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastConsecutiveVTRejects"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v159 = v82;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setLastConsecutiveVTRejects:](v5, "setLastConsecutiveVTRejects:", objc_msgSend(v82, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("captureFilePath"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v158 = v83;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v84 = (void *)objc_msgSend(v83, "copy");
      -[MHSchemaMHVoiceTriggerEventInfo setCaptureFilePath:](v5, "setCaptureFilePath:", v84);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configDataHash"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v157 = v85;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v86 = (void *)objc_msgSend(v85, "copy");
      -[MHSchemaMHVoiceTriggerEventInfo setConfigDataHash:](v5, "setConfigDataHash:", v86);

    }
    v87 = v46;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriIsActiveOrOtherAssertion"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSiriIsActiveOrOtherAssertion:](v5, "setSiriIsActiveOrOtherAssertion:", objc_msgSend(v88, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("didAudioStall"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v156 = v89;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setDidAudioStall:](v5, "setDidAudioStall:", objc_msgSend(v89, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isBargeIn"));
    v90 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v155 = (void *)v90;
    v91 = v87;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setIsBargeIn:](v5, "setIsBargeIn:", objc_msgSend(v155, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isWakeFromSleep"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setIsWakeFromSleep:](v5, "setIsWakeFromSleep:", objc_msgSend(v92, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondPassAssetQueryStartTimeInNs"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v154 = v93;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAssetQueryStartTimeInNs:](v5, "setSecondPassAssetQueryStartTimeInNs:", objc_msgSend(v93, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondPassAssetQueryCompleteTimeInNs"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAssetQueryCompleteTimeInNs:](v5, "setSecondPassAssetQueryCompleteTimeInNs:", objc_msgSend(v94, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondPassAssetLoadStartTimeInNs"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v153 = v95;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAssetLoadStartTimeInNs:](v5, "setSecondPassAssetLoadStartTimeInNs:", objc_msgSend(v95, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondPassAssetLoadCompleteTimeInNs"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v152 = v96;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAssetLoadCompleteTimeInNs:](v5, "setSecondPassAssetLoadCompleteTimeInNs:", objc_msgSend(v96, "unsignedLongLongValue"));
    v97 = v63;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondPassAudioStreamStartTimeInNs"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAudioStreamStartTimeInNs:](v5, "setSecondPassAudioStreamStartTimeInNs:", objc_msgSend(v98, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondPassAudioStreamReadyTimeInNs"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v151 = v99;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassAudioStreamReadyTimeInNs:](v5, "setSecondPassAudioStreamReadyTimeInNs:", objc_msgSend(v99, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondPassFirstAudioPacketReceptionTimeInNs"));
    v100 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v150 = (void *)v100;
    v101 = v97;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassFirstAudioPacketReceptionTimeInNs:](v5, "setSecondPassFirstAudioPacketReceptionTimeInNs:", objc_msgSend(v150, "unsignedLongLongValue"));
    v126 = v91;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondPassLastAudioPacketReceptionTimeInNs"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassLastAudioPacketReceptionTimeInNs:](v5, "setSecondPassLastAudioPacketReceptionTimeInNs:", objc_msgSend(v102, "unsignedLongLongValue"));
    v117 = v92;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondPassCheckerModelKeywordDetectionStartTimeInNs"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassCheckerModelKeywordDetectionStartTimeInNs:](v5, "setSecondPassCheckerModelKeywordDetectionStartTimeInNs:", objc_msgSend(v103, "unsignedLongLongValue"));
    v116 = v98;
    v118 = v88;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondPassCheckerModelKeywordDetectionEndTimeInNs"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setSecondPassCheckerModelKeywordDetectionEndTimeInNs:](v5, "setSecondPassCheckerModelKeywordDetectionEndTimeInNs:", objc_msgSend(v104, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerPhrase"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v106 = (void *)objc_msgSend(v105, "copy");
      -[MHSchemaMHVoiceTriggerEventInfo setTriggerPhrase:](v5, "setTriggerPhrase:", v106);

    }
    v115 = v102;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastDisplayWakeTimeOffsetInNs"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v107, "doubleValue");
      -[MHSchemaMHVoiceTriggerEventInfo setLastDisplayWakeTimeOffsetInNs:](v5, "setLastDisplayWakeTimeOffsetInNs:");
    }
    v119 = v101;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isHSJSTriggerFromAlwaysOnMicBuffer"), v103);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setIsHSJSTriggerFromAlwaysOnMicBuffer:](v5, "setIsHSJSTriggerFromAlwaysOnMicBuffer:", objc_msgSend(v108, "BOOLValue"));
    v109 = v94;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayWakeTimeOffsetInNs"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerEventInfo setDisplayWakeTimeOffsetInNs:](v5, "setDisplayWakeTimeOffsetInNs:", objc_msgSend(v110, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("neptuneDetectionApiScore"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v111, "floatValue");
      -[MHSchemaMHVoiceTriggerEventInfo setNeptuneDetectionApiScore:](v5, "setNeptuneDetectionApiScore:");
    }
    v112 = v5;

  }
  return v5;
}

- (unint64_t)secondPassAnalyerStartSampleCount
{
  return self->_secondPassAnalyerStartSampleCount;
}

- (unint64_t)secondPassAnalyerEndSampleCount
{
  return self->_secondPassAnalyerEndSampleCount;
}

- (float)satScore
{
  return self->_satScore;
}

- (unsigned)satNumTrainingUtterances
{
  return self->_satNumTrainingUtterances;
}

- (float)satThreshold
{
  return self->_satThreshold;
}

- (BOOL)satTriggered
{
  return self->_satTriggered;
}

- (float)tdSpeakerRecognizerScore
{
  return self->_tdSpeakerRecognizerScore;
}

- (float)tdSpeakerRecognizerCombinedScore
{
  return self->_tdSpeakerRecognizerCombinedScore;
}

- (float)tdSpeakerRecognizerCombinedThreshold
{
  return self->_tdSpeakerRecognizerCombinedThreshold;
}

- (float)tdSpeakerRecognizerCombinationWeight
{
  return self->_tdSpeakerRecognizerCombinationWeight;
}

- (int)biometricClue
{
  return self->_biometricClue;
}

- (BOOL)satBeingTrained
{
  return self->_satBeingTrained;
}

- (unsigned)lastConsecutivePHSRejects
{
  return self->_lastConsecutivePHSRejects;
}

- (unint64_t)deltaTimeInNsFromlastPHSReject
{
  return self->_deltaTimeInNsFromlastPHSReject;
}

- (float)triggerExplicitSatScore
{
  return self->_triggerExplicitSatScore;
}

- (float)triggerExplicitTDSRSatScore
{
  return self->_triggerExplicitTDSRSatScore;
}

- (float)shadowMicScore
{
  return self->_shadowMicScore;
}

- (float)shadowMicScoreThresholdForVAD
{
  return self->_shadowMicScoreThresholdForVAD;
}

- (float)remoteMicVADScore
{
  return self->_remoteMicVADScore;
}

- (float)remoteMicVADThreshold
{
  return self->_remoteMicVADThreshold;
}

- (float)remoteMicVADMyriadThreshold
{
  return self->_remoteMicVADMyriadThreshold;
}

- (int)enhancedCarplayTriggerMode
{
  return self->_enhancedCarplayTriggerMode;
}

- (unint64_t)triggerStartSampleCount
{
  return self->_triggerStartSampleCount;
}

- (unint64_t)clientStartSampleCount
{
  return self->_clientStartSampleCount;
}

- (unint64_t)triggerEndSampleCount
{
  return self->_triggerEndSampleCount;
}

- (unint64_t)triggerFireSampleCount
{
  return self->_triggerFireSampleCount;
}

- (unint64_t)triggerStartNs
{
  return self->_triggerStartNs;
}

- (unint64_t)triggerEndNs
{
  return self->_triggerEndNs;
}

- (unint64_t)triggerFireNs
{
  return self->_triggerFireNs;
}

- (unint64_t)extraSamplesAtStart
{
  return self->_extraSamplesAtStart;
}

- (unint64_t)analyzerPrependingSamples
{
  return self->_analyzerPrependingSamples;
}

- (unint64_t)analyzerTrailingSamples
{
  return self->_analyzerTrailingSamples;
}

- (BOOL)isTriggerEvent
{
  return self->_isTriggerEvent;
}

- (unint64_t)totalSampleCount
{
  return self->_totalSampleCount;
}

- (float)triggerScore
{
  return self->_triggerScore;
}

- (BOOL)isMaximized
{
  return self->_isMaximized;
}

- (float)effectiveThreshold
{
  return self->_effectiveThreshold;
}

- (float)recognizerScore
{
  return self->_recognizerScore;
}

- (float)recognizerThresholdOffset
{
  return self->_recognizerThresholdOffset;
}

- (unint64_t)recognizerWaitTimeInNs
{
  return self->_recognizerWaitTimeInNs;
}

- (float)recognizerScaleFactor
{
  return self->_recognizerScaleFactor;
}

- (float)threshold
{
  return self->_threshold;
}

- (unint64_t)triggerStartTimeOffsetInNs
{
  return self->_triggerStartTimeOffsetInNs;
}

- (unint64_t)triggerEndTimeOffsetInNs
{
  return self->_triggerEndTimeOffsetInNs;
}

- (unint64_t)triggerFireTimeOffsetInNs
{
  return self->_triggerFireTimeOffsetInNs;
}

- (double)triggerStartTime
{
  return self->_triggerStartTime;
}

- (double)triggerEndTime
{
  return self->_triggerEndTime;
}

- (double)triggerFiredTime
{
  return self->_triggerFiredTime;
}

- (unsigned)hardwareSamplerate
{
  return self->_hardwareSamplerate;
}

- (BOOL)isContinuous
{
  return self->_isContinuous;
}

- (float)triggerDurationInNs
{
  return self->_triggerDurationInNs;
}

- (unint64_t)totalSamplesAtTriggerStart
{
  return self->_totalSamplesAtTriggerStart;
}

- (unint64_t)totalSamplesAtTriggerEnd
{
  return self->_totalSamplesAtTriggerEnd;
}

- (unint64_t)totalSamplesAtEndOfCapture
{
  return self->_totalSamplesAtEndOfCapture;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (void)setConfigVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)configPath
{
  return self->_configPath;
}

- (void)setConfigPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (BOOL)isSecondChance
{
  return self->_isSecondChance;
}

- (BOOL)deviceHandheld
{
  return self->_deviceHandheld;
}

- (unsigned)activeChannel
{
  return self->_activeChannel;
}

- (unint64_t)twoShotAudibleFeedbackDelayInNs
{
  return self->_twoShotAudibleFeedbackDelayInNs;
}

- (float)cumulativeUptimeInSec
{
  return self->_cumulativeUptimeInSec;
}

- (float)cumulativeDowntimeInSec
{
  return self->_cumulativeDowntimeInSec;
}

- (int)hostPowerStateAtTrigger
{
  return self->_hostPowerStateAtTrigger;
}

- (BOOL)isMediaPlaying
{
  return self->_isMediaPlaying;
}

- (float)mediaVolume
{
  return self->_mediaVolume;
}

- (SISchemaUUID)audioProviderUUID
{
  return self->_audioProviderUUID;
}

- (void)setAudioProviderUUID:(id)a3
{
  objc_storeStrong((id *)&self->_audioProviderUUID, a3);
}

- (BOOL)onBatteryPower
{
  return self->_onBatteryPower;
}

- (BOOL)didWakeAP
{
  return self->_didWakeAP;
}

- (float)uptimeInSec
{
  return self->_uptimeInSec;
}

- (float)downtimeInSec
{
  return self->_downtimeInSec;
}

- (unsigned)lastConsecutiveVTRejects
{
  return self->_lastConsecutiveVTRejects;
}

- (NSString)captureFilePath
{
  return self->_captureFilePath;
}

- (void)setCaptureFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSString)configDataHash
{
  return self->_configDataHash;
}

- (void)setConfigDataHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (BOOL)siriIsActiveOrOtherAssertion
{
  return self->_siriIsActiveOrOtherAssertion;
}

- (BOOL)didAudioStall
{
  return self->_didAudioStall;
}

- (BOOL)isBargeIn
{
  return self->_isBargeIn;
}

- (BOOL)isWakeFromSleep
{
  return self->_isWakeFromSleep;
}

- (unint64_t)secondPassAssetQueryStartTimeInNs
{
  return self->_secondPassAssetQueryStartTimeInNs;
}

- (unint64_t)secondPassAssetQueryCompleteTimeInNs
{
  return self->_secondPassAssetQueryCompleteTimeInNs;
}

- (unint64_t)secondPassAssetLoadStartTimeInNs
{
  return self->_secondPassAssetLoadStartTimeInNs;
}

- (unint64_t)secondPassAssetLoadCompleteTimeInNs
{
  return self->_secondPassAssetLoadCompleteTimeInNs;
}

- (unint64_t)secondPassAudioStreamStartTimeInNs
{
  return self->_secondPassAudioStreamStartTimeInNs;
}

- (unint64_t)secondPassAudioStreamReadyTimeInNs
{
  return self->_secondPassAudioStreamReadyTimeInNs;
}

- (unint64_t)secondPassFirstAudioPacketReceptionTimeInNs
{
  return self->_secondPassFirstAudioPacketReceptionTimeInNs;
}

- (unint64_t)secondPassLastAudioPacketReceptionTimeInNs
{
  return self->_secondPassLastAudioPacketReceptionTimeInNs;
}

- (unint64_t)secondPassCheckerModelKeywordDetectionStartTimeInNs
{
  return self->_secondPassCheckerModelKeywordDetectionStartTimeInNs;
}

- (unint64_t)secondPassCheckerModelKeywordDetectionEndTimeInNs
{
  return self->_secondPassCheckerModelKeywordDetectionEndTimeInNs;
}

- (NSString)triggerPhrase
{
  return self->_triggerPhrase;
}

- (void)setTriggerPhrase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (double)lastDisplayWakeTimeOffsetInNs
{
  return self->_lastDisplayWakeTimeOffsetInNs;
}

- (BOOL)isHSJSTriggerFromAlwaysOnMicBuffer
{
  return self->_isHSJSTriggerFromAlwaysOnMicBuffer;
}

- (unint64_t)displayWakeTimeOffsetInNs
{
  return self->_displayWakeTimeOffsetInNs;
}

- (float)neptuneDetectionApiScore
{
  return self->_neptuneDetectionApiScore;
}

- (void)setHasConfigVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 11) = a3;
}

- (void)setHasConfigPath:(BOOL)a3
{
  self->_hasConfigVersion = a3;
}

- (void)setHasAudioProviderUUID:(BOOL)a3
{
  self->_hasConfigPath = a3;
}

- (void)setHasCaptureFilePath:(BOOL)a3
{
  self->_hasAudioProviderUUID = a3;
}

- (void)setHasConfigDataHash:(BOOL)a3
{
  self->_hasCaptureFilePath = a3;
}

- (void)setHasTriggerPhrase:(BOOL)a3
{
  self->_hasConfigDataHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerPhrase, 0);
  objc_storeStrong((id *)&self->_configDataHash, 0);
  objc_storeStrong((id *)&self->_captureFilePath, 0);
  objc_storeStrong((id *)&self->_audioProviderUUID, 0);
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
}

@end
