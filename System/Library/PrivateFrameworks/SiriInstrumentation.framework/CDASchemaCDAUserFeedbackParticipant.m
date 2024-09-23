@implementation CDASchemaCDAUserFeedbackParticipant

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
  v25.super_class = (Class)CDASchemaCDAUserFeedbackParticipant;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v25, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDASchemaCDAUserFeedbackParticipant siriSpeechId](self, "siriSpeechId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CDASchemaCDAUserFeedbackParticipant deleteSiriSpeechId](self, "deleteSiriSpeechId");
  -[CDASchemaCDAUserFeedbackParticipant cdaId](self, "cdaId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CDASchemaCDAUserFeedbackParticipant deleteCdaId](self, "deleteCdaId");
  -[CDASchemaCDAUserFeedbackParticipant requestId](self, "requestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CDASchemaCDAUserFeedbackParticipant deleteRequestId](self, "deleteRequestId");
  -[CDASchemaCDAUserFeedbackParticipant halTargetSiriSpeechId](self, "halTargetSiriSpeechId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[CDASchemaCDAUserFeedbackParticipant deleteHalTargetSiriSpeechId](self, "deleteHalTargetSiriSpeechId");
  -[CDASchemaCDAUserFeedbackParticipant scoreBoosters](self, "scoreBoosters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[CDASchemaCDAUserFeedbackParticipant deleteScoreBoosters](self, "deleteScoreBoosters");
  -[CDASchemaCDAUserFeedbackParticipant advertisement](self, "advertisement");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[CDASchemaCDAUserFeedbackParticipant deleteAdvertisement](self, "deleteAdvertisement");

  return v5;
}

- (BOOL)hasSiriSpeechId
{
  return self->_siriSpeechId != 0;
}

- (void)deleteSiriSpeechId
{
  -[CDASchemaCDAUserFeedbackParticipant setSiriSpeechId:](self, "setSiriSpeechId:", 0);
}

- (BOOL)hasCdaId
{
  return self->_cdaId != 0;
}

- (void)deleteCdaId
{
  -[CDASchemaCDAUserFeedbackParticipant setCdaId:](self, "setCdaId:", 0);
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)deleteRequestId
{
  -[CDASchemaCDAUserFeedbackParticipant setRequestId:](self, "setRequestId:", 0);
}

- (BOOL)hasHalTargetSiriSpeechId
{
  return self->_halTargetSiriSpeechId != 0;
}

- (void)deleteHalTargetSiriSpeechId
{
  -[CDASchemaCDAUserFeedbackParticipant setHalTargetSiriSpeechId:](self, "setHalTargetSiriSpeechId:", 0);
}

- (void)setDecision:(int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 1u;
  self->_decision = a3;
}

- (BOOL)hasDecision
{
  return *(_WORD *)(&self->_isNearMiss + 1) & 1;
}

- (void)setHasDecision:(BOOL)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFFFE | a3;
}

- (void)deleteDecision
{
  -[CDASchemaCDAUserFeedbackParticipant setDecision:](self, "setDecision:", 0);
  *(_WORD *)(&self->_isNearMiss + 1) &= ~1u;
}

- (void)setVoiceTriggerTimeNS:(unint64_t)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 2u;
  self->_voiceTriggerTimeNS = a3;
}

- (BOOL)hasVoiceTriggerTimeNS
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 1) & 1;
}

- (void)setHasVoiceTriggerTimeNS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFFFD | v3;
}

- (void)deleteVoiceTriggerTimeNS
{
  -[CDASchemaCDAUserFeedbackParticipant setVoiceTriggerTimeNS:](self, "setVoiceTriggerTimeNS:", 0);
  *(_WORD *)(&self->_isNearMiss + 1) &= ~2u;
}

- (void)setRawGoodnessScore:(unsigned int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 4u;
  self->_rawGoodnessScore = a3;
}

- (BOOL)hasRawGoodnessScore
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 2) & 1;
}

- (void)setHasRawGoodnessScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFFFB | v3;
}

- (void)deleteRawGoodnessScore
{
  -[CDASchemaCDAUserFeedbackParticipant setRawGoodnessScore:](self, "setRawGoodnessScore:", 0);
  *(_WORD *)(&self->_isNearMiss + 1) &= ~4u;
}

- (void)setGranularBoostValue:(unsigned int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 8u;
  self->_granularBoostValue = a3;
}

- (BOOL)hasGranularBoostValue
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 3) & 1;
}

- (void)setHasGranularBoostValue:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFFF7 | v3;
}

- (void)deleteGranularBoostValue
{
  -[CDASchemaCDAUserFeedbackParticipant setGranularBoostValue:](self, "setGranularBoostValue:", 0);
  *(_WORD *)(&self->_isNearMiss + 1) &= ~8u;
}

- (void)setGranularBoostDecay:(double)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x10u;
  self->_granularBoostDecay = a3;
}

- (BOOL)hasGranularBoostDecay
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 4) & 1;
}

- (void)setHasGranularBoostDecay:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFFEF | v3;
}

- (void)deleteGranularBoostDecay
{
  -[CDASchemaCDAUserFeedbackParticipant setGranularBoostDecay:](self, "setGranularBoostDecay:", 0.0);
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x10u;
}

- (void)setTrumpReason:(int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x20u;
  self->_trumpReason = a3;
}

- (BOOL)hasTrumpReason
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 5) & 1;
}

- (void)setHasTrumpReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFFDF | v3;
}

- (void)deleteTrumpReason
{
  -[CDASchemaCDAUserFeedbackParticipant setTrumpReason:](self, "setTrumpReason:", 0);
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x20u;
}

- (void)setPsdScore:(unsigned int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x40u;
  self->_psdScore = a3;
}

- (BOOL)hasPsdScore
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 6) & 1;
}

- (void)setHasPsdScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFFBF | v3;
}

- (void)deletePsdScore
{
  -[CDASchemaCDAUserFeedbackParticipant setPsdScore:](self, "setPsdScore:", 0);
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x40u;
}

- (void)setMediaState:(int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x80u;
  self->_mediaState = a3;
}

- (BOOL)hasMediaState
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 7) & 1;
}

- (void)setHasMediaState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFF7F | v3;
}

- (void)deleteMediaState
{
  -[CDASchemaCDAUserFeedbackParticipant setMediaState:](self, "setMediaState:", 0);
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x80u;
}

- (void)setAlarmState:(int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x100u;
  self->_alarmState = a3;
}

- (BOOL)hasAlarmState
{
  return HIBYTE(*(unsigned __int16 *)(&self->_isNearMiss + 1)) & 1;
}

- (void)setHasAlarmState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFEFF | v3;
}

- (void)deleteAlarmState
{
  -[CDASchemaCDAUserFeedbackParticipant setAlarmState:](self, "setAlarmState:", 0);
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x100u;
}

- (void)setTimerState:(int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x200u;
  self->_timerState = a3;
}

- (BOOL)hasTimerState
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 9) & 1;
}

- (void)setHasTimerState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFDFF | v3;
}

- (void)deleteTimerState
{
  -[CDASchemaCDAUserFeedbackParticipant setTimerState:](self, "setTimerState:", 0);
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x200u;
}

- (void)setTimeSinceLastWinInMilliseconds:(unint64_t)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x400u;
  self->_timeSinceLastWinInMilliseconds = a3;
}

- (BOOL)hasTimeSinceLastWinInMilliseconds
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 10) & 1;
}

- (void)setHasTimeSinceLastWinInMilliseconds:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xFBFF | v3;
}

- (void)deleteTimeSinceLastWinInMilliseconds
{
  -[CDASchemaCDAUserFeedbackParticipant setTimeSinceLastWinInMilliseconds:](self, "setTimeSinceLastWinInMilliseconds:", 0);
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x400u;
}

- (void)setTriggerType:(int)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x800u;
  self->_triggerType = a3;
}

- (BOOL)hasTriggerType
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 11) & 1;
}

- (void)setHasTriggerType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xF7FF | v3;
}

- (void)deleteTriggerType
{
  -[CDASchemaCDAUserFeedbackParticipant setTriggerType:](self, "setTriggerType:", 0);
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x800u;
}

- (BOOL)hasRoomNameHash
{
  return self->_roomNameHash != 0;
}

- (void)deleteRoomNameHash
{
  -[CDASchemaCDAUserFeedbackParticipant setRoomNameHash:](self, "setRoomNameHash:", 0);
}

- (void)setTimeSinceTriggerInMilliseconds:(unint64_t)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x1000u;
  self->_timeSinceTriggerInMilliseconds = a3;
}

- (BOOL)hasTimeSinceTriggerInMilliseconds
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 12) & 1;
}

- (void)setHasTimeSinceTriggerInMilliseconds:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xEFFF | v3;
}

- (void)deleteTimeSinceTriggerInMilliseconds
{
  -[CDASchemaCDAUserFeedbackParticipant setTimeSinceTriggerInMilliseconds:](self, "setTimeSinceTriggerInMilliseconds:", 0);
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x1000u;
}

- (BOOL)hasScoreBoosters
{
  return self->_scoreBoosters != 0;
}

- (void)deleteScoreBoosters
{
  -[CDASchemaCDAUserFeedbackParticipant setScoreBoosters:](self, "setScoreBoosters:", 0);
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (void)deleteBuild
{
  -[CDASchemaCDAUserFeedbackParticipant setBuild:](self, "setBuild:", 0);
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)deleteLocale
{
  -[CDASchemaCDAUserFeedbackParticipant setLocale:](self, "setLocale:", 0);
}

- (BOOL)hasAdvertisement
{
  return self->_advertisement != 0;
}

- (void)deleteAdvertisement
{
  -[CDASchemaCDAUserFeedbackParticipant setAdvertisement:](self, "setAdvertisement:", 0);
}

- (void)clearProductTypes
{
  -[NSArray removeAllObjects](self->_productTypes, "removeAllObjects");
}

- (void)addProductTypes:(id)a3
{
  id v4;
  NSArray *productTypes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  productTypes = self->_productTypes;
  v8 = v4;
  if (!productTypes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_productTypes;
    self->_productTypes = v6;

    v4 = v8;
    productTypes = self->_productTypes;
  }
  -[NSArray addObject:](productTypes, "addObject:", v4);

}

- (unint64_t)productTypesCount
{
  return -[NSArray count](self->_productTypes, "count");
}

- (id)productTypesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_productTypes, "objectAtIndexedSubscript:", a3);
}

- (void)setIsNearMiss:(BOOL)a3
{
  *(_WORD *)(&self->_isNearMiss + 1) |= 0x2000u;
  self->_isNearMiss = a3;
}

- (BOOL)hasIsNearMiss
{
  return (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 13) & 1;
}

- (void)setHasIsNearMiss:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)(&self->_isNearMiss + 1) = *(_WORD *)(&self->_isNearMiss + 1) & 0xDFFF | v3;
}

- (void)deleteIsNearMiss
{
  -[CDASchemaCDAUserFeedbackParticipant setIsNearMiss:](self, "setIsNearMiss:", 0);
  *(_WORD *)(&self->_isNearMiss + 1) &= ~0x2000u;
}

- (BOOL)readFrom:(id)a3
{
  return CDASchemaCDAUserFeedbackParticipantReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
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
  __int16 v13;
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
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CDASchemaCDAUserFeedbackParticipant siriSpeechId](self, "siriSpeechId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CDASchemaCDAUserFeedbackParticipant siriSpeechId](self, "siriSpeechId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAUserFeedbackParticipant cdaId](self, "cdaId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CDASchemaCDAUserFeedbackParticipant cdaId](self, "cdaId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAUserFeedbackParticipant requestId](self, "requestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CDASchemaCDAUserFeedbackParticipant requestId](self, "requestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAUserFeedbackParticipant halTargetSiriSpeechId](self, "halTargetSiriSpeechId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CDASchemaCDAUserFeedbackParticipant halTargetSiriSpeechId](self, "halTargetSiriSpeechId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v13 = *(_WORD *)(&self->_isNearMiss + 1);
    if ((v13 & 2) == 0)
    {
LABEL_11:
      if ((v13 & 4) == 0)
        goto LABEL_12;
      goto LABEL_46;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field();
  v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 4) == 0)
  {
LABEL_12:
    if ((v13 & 8) == 0)
      goto LABEL_13;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 8) == 0)
  {
LABEL_13:
    if ((v13 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 0x10) == 0)
  {
LABEL_14:
    if ((v13 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 0x20) == 0)
  {
LABEL_15:
    if ((v13 & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 0x40) == 0)
  {
LABEL_16:
    if ((v13 & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 0x80) == 0)
  {
LABEL_17:
    if ((v13 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt32Field();
  v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 0x100) == 0)
  {
LABEL_18:
    if ((v13 & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt32Field();
  v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 0x200) == 0)
  {
LABEL_19:
    if ((v13 & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt32Field();
  v13 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v13 & 0x400) == 0)
  {
LABEL_20:
    if ((v13 & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_54:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x800) != 0)
LABEL_21:
    PBDataWriterWriteInt32Field();
LABEL_22:
  -[CDASchemaCDAUserFeedbackParticipant roomNameHash](self, "roomNameHash");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x1000) != 0)
    PBDataWriterWriteUint64Field();
  -[CDASchemaCDAUserFeedbackParticipant scoreBoosters](self, "scoreBoosters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CDASchemaCDAUserFeedbackParticipant scoreBoosters](self, "scoreBoosters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CDASchemaCDAUserFeedbackParticipant build](self, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteStringField();
  -[CDASchemaCDAUserFeedbackParticipant locale](self, "locale");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    PBDataWriterWriteStringField();
  -[CDASchemaCDAUserFeedbackParticipant advertisement](self, "advertisement");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[CDASchemaCDAUserFeedbackParticipant advertisement](self, "advertisement");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = self->_productTypes;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteStringField();
      }
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v23);
  }

  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x2000) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  char *v4;
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  int decision;
  int v30;
  unint64_t voiceTriggerTimeNS;
  int v32;
  unsigned int rawGoodnessScore;
  int v34;
  unsigned int granularBoostValue;
  int v36;
  double granularBoostDecay;
  double v38;
  int v39;
  int trumpReason;
  int v41;
  unsigned int psdScore;
  int v43;
  int mediaState;
  int v45;
  int alarmState;
  int v47;
  int timerState;
  int v49;
  unint64_t timeSinceLastWinInMilliseconds;
  int v51;
  int triggerType;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  int v58;
  unint64_t timeSinceTriggerInMilliseconds;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
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
  BOOL v85;
  int v87;
  int isNearMiss;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_102;
  -[CDASchemaCDAUserFeedbackParticipant siriSpeechId](self, "siriSpeechId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriSpeechId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_101;
  -[CDASchemaCDAUserFeedbackParticipant siriSpeechId](self, "siriSpeechId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CDASchemaCDAUserFeedbackParticipant siriSpeechId](self, "siriSpeechId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriSpeechId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_102;
  }
  else
  {

  }
  -[CDASchemaCDAUserFeedbackParticipant cdaId](self, "cdaId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdaId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_101;
  -[CDASchemaCDAUserFeedbackParticipant cdaId](self, "cdaId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[CDASchemaCDAUserFeedbackParticipant cdaId](self, "cdaId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdaId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_102;
  }
  else
  {

  }
  -[CDASchemaCDAUserFeedbackParticipant requestId](self, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_101;
  -[CDASchemaCDAUserFeedbackParticipant requestId](self, "requestId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[CDASchemaCDAUserFeedbackParticipant requestId](self, "requestId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_102;
  }
  else
  {

  }
  -[CDASchemaCDAUserFeedbackParticipant halTargetSiriSpeechId](self, "halTargetSiriSpeechId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "halTargetSiriSpeechId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_101;
  -[CDASchemaCDAUserFeedbackParticipant halTargetSiriSpeechId](self, "halTargetSiriSpeechId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[CDASchemaCDAUserFeedbackParticipant halTargetSiriSpeechId](self, "halTargetSiriSpeechId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "halTargetSiriSpeechId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_102;
  }
  else
  {

  }
  v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
  v28 = *(unsigned __int16 *)(v4 + 169);
  if ((v27 & 1) != (v28 & 1))
    goto LABEL_102;
  if ((v27 & 1) != 0)
  {
    decision = self->_decision;
    if (decision != objc_msgSend(v4, "decision"))
      goto LABEL_102;
    v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    v28 = *(unsigned __int16 *)(v4 + 169);
  }
  v30 = (v27 >> 1) & 1;
  if (v30 != ((v28 >> 1) & 1))
    goto LABEL_102;
  if (v30)
  {
    voiceTriggerTimeNS = self->_voiceTriggerTimeNS;
    if (voiceTriggerTimeNS != objc_msgSend(v4, "voiceTriggerTimeNS"))
      goto LABEL_102;
    v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    v28 = *(unsigned __int16 *)(v4 + 169);
  }
  v32 = (v27 >> 2) & 1;
  if (v32 != ((v28 >> 2) & 1))
    goto LABEL_102;
  if (v32)
  {
    rawGoodnessScore = self->_rawGoodnessScore;
    if (rawGoodnessScore != objc_msgSend(v4, "rawGoodnessScore"))
      goto LABEL_102;
    v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    v28 = *(unsigned __int16 *)(v4 + 169);
  }
  v34 = (v27 >> 3) & 1;
  if (v34 != ((v28 >> 3) & 1))
    goto LABEL_102;
  if (v34)
  {
    granularBoostValue = self->_granularBoostValue;
    if (granularBoostValue != objc_msgSend(v4, "granularBoostValue"))
      goto LABEL_102;
    v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    v28 = *(unsigned __int16 *)(v4 + 169);
  }
  v36 = (v27 >> 4) & 1;
  if (v36 != ((v28 >> 4) & 1))
    goto LABEL_102;
  if (v36)
  {
    granularBoostDecay = self->_granularBoostDecay;
    objc_msgSend(v4, "granularBoostDecay");
    if (granularBoostDecay != v38)
      goto LABEL_102;
    v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    v28 = *(unsigned __int16 *)(v4 + 169);
  }
  v39 = (v27 >> 5) & 1;
  if (v39 != ((v28 >> 5) & 1))
    goto LABEL_102;
  if (v39)
  {
    trumpReason = self->_trumpReason;
    if (trumpReason != objc_msgSend(v4, "trumpReason"))
      goto LABEL_102;
    v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    v28 = *(unsigned __int16 *)(v4 + 169);
  }
  v41 = (v27 >> 6) & 1;
  if (v41 != ((v28 >> 6) & 1))
    goto LABEL_102;
  if (v41)
  {
    psdScore = self->_psdScore;
    if (psdScore != objc_msgSend(v4, "psdScore"))
      goto LABEL_102;
    v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    v28 = *(unsigned __int16 *)(v4 + 169);
  }
  v43 = (v27 >> 7) & 1;
  if (v43 != ((v28 >> 7) & 1))
    goto LABEL_102;
  if (v43)
  {
    mediaState = self->_mediaState;
    if (mediaState != objc_msgSend(v4, "mediaState"))
      goto LABEL_102;
    v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    v28 = *(unsigned __int16 *)(v4 + 169);
  }
  v45 = (v27 >> 8) & 1;
  if (v45 != ((v28 >> 8) & 1))
    goto LABEL_102;
  if (v45)
  {
    alarmState = self->_alarmState;
    if (alarmState != objc_msgSend(v4, "alarmState"))
      goto LABEL_102;
    v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    v28 = *(unsigned __int16 *)(v4 + 169);
  }
  v47 = (v27 >> 9) & 1;
  if (v47 != ((v28 >> 9) & 1))
    goto LABEL_102;
  if (v47)
  {
    timerState = self->_timerState;
    if (timerState != objc_msgSend(v4, "timerState"))
      goto LABEL_102;
    v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    v28 = *(unsigned __int16 *)(v4 + 169);
  }
  v49 = (v27 >> 10) & 1;
  if (v49 != ((v28 >> 10) & 1))
    goto LABEL_102;
  if (v49)
  {
    timeSinceLastWinInMilliseconds = self->_timeSinceLastWinInMilliseconds;
    if (timeSinceLastWinInMilliseconds != objc_msgSend(v4, "timeSinceLastWinInMilliseconds"))
      goto LABEL_102;
    v27 = *(unsigned __int16 *)(&self->_isNearMiss + 1);
    v28 = *(unsigned __int16 *)(v4 + 169);
  }
  v51 = (v27 >> 11) & 1;
  if (v51 != ((v28 >> 11) & 1))
    goto LABEL_102;
  if (v51)
  {
    triggerType = self->_triggerType;
    if (triggerType != objc_msgSend(v4, "triggerType"))
      goto LABEL_102;
  }
  -[CDASchemaCDAUserFeedbackParticipant roomNameHash](self, "roomNameHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "roomNameHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_101;
  -[CDASchemaCDAUserFeedbackParticipant roomNameHash](self, "roomNameHash");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[CDASchemaCDAUserFeedbackParticipant roomNameHash](self, "roomNameHash");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "roomNameHash");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_102;
  }
  else
  {

  }
  v58 = (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 12) & 1;
  if (v58 != ((*(unsigned __int16 *)(v4 + 169) >> 12) & 1))
    goto LABEL_102;
  if (v58)
  {
    timeSinceTriggerInMilliseconds = self->_timeSinceTriggerInMilliseconds;
    if (timeSinceTriggerInMilliseconds != objc_msgSend(v4, "timeSinceTriggerInMilliseconds"))
      goto LABEL_102;
  }
  -[CDASchemaCDAUserFeedbackParticipant scoreBoosters](self, "scoreBoosters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scoreBoosters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_101;
  -[CDASchemaCDAUserFeedbackParticipant scoreBoosters](self, "scoreBoosters");
  v60 = objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v61 = (void *)v60;
    -[CDASchemaCDAUserFeedbackParticipant scoreBoosters](self, "scoreBoosters");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scoreBoosters");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v62, "isEqual:", v63);

    if (!v64)
      goto LABEL_102;
  }
  else
  {

  }
  -[CDASchemaCDAUserFeedbackParticipant build](self, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_101;
  -[CDASchemaCDAUserFeedbackParticipant build](self, "build");
  v65 = objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    v66 = (void *)v65;
    -[CDASchemaCDAUserFeedbackParticipant build](self, "build");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "build");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v67, "isEqual:", v68);

    if (!v69)
      goto LABEL_102;
  }
  else
  {

  }
  -[CDASchemaCDAUserFeedbackParticipant locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_101;
  -[CDASchemaCDAUserFeedbackParticipant locale](self, "locale");
  v70 = objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    v71 = (void *)v70;
    -[CDASchemaCDAUserFeedbackParticipant locale](self, "locale");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locale");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v72, "isEqual:", v73);

    if (!v74)
      goto LABEL_102;
  }
  else
  {

  }
  -[CDASchemaCDAUserFeedbackParticipant advertisement](self, "advertisement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "advertisement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_101;
  -[CDASchemaCDAUserFeedbackParticipant advertisement](self, "advertisement");
  v75 = objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    v76 = (void *)v75;
    -[CDASchemaCDAUserFeedbackParticipant advertisement](self, "advertisement");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "advertisement");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v77, "isEqual:", v78);

    if (!v79)
      goto LABEL_102;
  }
  else
  {

  }
  -[CDASchemaCDAUserFeedbackParticipant productTypes](self, "productTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_101:

    goto LABEL_102;
  }
  -[CDASchemaCDAUserFeedbackParticipant productTypes](self, "productTypes");
  v80 = objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    v81 = (void *)v80;
    -[CDASchemaCDAUserFeedbackParticipant productTypes](self, "productTypes");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "productTypes");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v82, "isEqual:", v83);

    if (!v84)
      goto LABEL_102;
  }
  else
  {

  }
  v87 = (*(unsigned __int16 *)(&self->_isNearMiss + 1) >> 13) & 1;
  if (v87 == ((*(unsigned __int16 *)(v4 + 169) >> 13) & 1))
  {
    if (!v87 || (isNearMiss = self->_isNearMiss, isNearMiss == objc_msgSend(v4, "isNearMiss")))
    {
      v85 = 1;
      goto LABEL_103;
    }
  }
LABEL_102:
  v85 = 0;
LABEL_103:

  return v85;
}

- (unint64_t)hash
{
  __int16 v3;
  double granularBoostDecay;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;

  v32 = -[SISchemaUUID hash](self->_siriSpeechId, "hash");
  v31 = -[SISchemaUUID hash](self->_cdaId, "hash");
  v30 = -[SISchemaUUID hash](self->_requestId, "hash");
  v29 = -[SISchemaUUID hash](self->_halTargetSiriSpeechId, "hash");
  v3 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v3 & 1) != 0)
  {
    v28 = 2654435761 * self->_decision;
    if ((v3 & 2) != 0)
    {
LABEL_3:
      v27 = 2654435761u * self->_voiceTriggerTimeNS;
      if ((v3 & 4) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v28 = 0;
    if ((v3 & 2) != 0)
      goto LABEL_3;
  }
  v27 = 0;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    v26 = 2654435761 * self->_rawGoodnessScore;
    if ((v3 & 8) != 0)
      goto LABEL_5;
LABEL_13:
    v25 = 0;
    if ((v3 & 0x10) != 0)
      goto LABEL_6;
LABEL_14:
    v8 = 0;
    goto LABEL_17;
  }
LABEL_12:
  v26 = 0;
  if ((v3 & 8) == 0)
    goto LABEL_13;
LABEL_5:
  v25 = 2654435761 * self->_granularBoostValue;
  if ((v3 & 0x10) == 0)
    goto LABEL_14;
LABEL_6:
  granularBoostDecay = self->_granularBoostDecay;
  v5 = -granularBoostDecay;
  if (granularBoostDecay >= 0.0)
    v5 = self->_granularBoostDecay;
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
LABEL_17:
  if ((v3 & 0x20) != 0)
  {
    v24 = 2654435761 * self->_trumpReason;
    if ((v3 & 0x40) != 0)
    {
LABEL_19:
      v23 = 2654435761 * self->_psdScore;
      if ((v3 & 0x80) != 0)
        goto LABEL_20;
      goto LABEL_27;
    }
  }
  else
  {
    v24 = 0;
    if ((v3 & 0x40) != 0)
      goto LABEL_19;
  }
  v23 = 0;
  if ((v3 & 0x80) != 0)
  {
LABEL_20:
    v22 = 2654435761 * self->_mediaState;
    if ((v3 & 0x100) != 0)
      goto LABEL_21;
    goto LABEL_28;
  }
LABEL_27:
  v22 = 0;
  if ((v3 & 0x100) != 0)
  {
LABEL_21:
    v21 = 2654435761 * self->_alarmState;
    if ((v3 & 0x200) != 0)
      goto LABEL_22;
    goto LABEL_29;
  }
LABEL_28:
  v21 = 0;
  if ((v3 & 0x200) != 0)
  {
LABEL_22:
    v20 = 2654435761 * self->_timerState;
    if ((v3 & 0x400) != 0)
      goto LABEL_23;
LABEL_30:
    v19 = 0;
    if ((v3 & 0x800) != 0)
      goto LABEL_24;
    goto LABEL_31;
  }
LABEL_29:
  v20 = 0;
  if ((v3 & 0x400) == 0)
    goto LABEL_30;
LABEL_23:
  v19 = 2654435761u * self->_timeSinceLastWinInMilliseconds;
  if ((v3 & 0x800) != 0)
  {
LABEL_24:
    v18 = 2654435761 * self->_triggerType;
    goto LABEL_32;
  }
LABEL_31:
  v18 = 0;
LABEL_32:
  v9 = -[NSString hash](self->_roomNameHash, "hash");
  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x1000) != 0)
    v10 = 2654435761u * self->_timeSinceTriggerInMilliseconds;
  else
    v10 = 0;
  v11 = -[CDASchemaCDAScoreBoosters hash](self->_scoreBoosters, "hash");
  v12 = -[NSString hash](self->_build, "hash");
  v13 = -[NSString hash](self->_locale, "hash");
  v14 = -[CDASchemaCDAAdvertisementData hash](self->_advertisement, "hash");
  v15 = -[NSArray hash](self->_productTypes, "hash");
  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x2000) != 0)
    v16 = 2654435761 * self->_isNearMiss;
  else
    v16 = 0;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v8 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int16 v14;
  int v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  __int16 v31;
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
  __int16 v45;
  void *v46;
  id v47;
  void *v49;
  void *v50;
  unsigned int v51;
  const __CFString *v52;
  unsigned int v53;
  const __CFString *v54;
  unsigned int v55;
  const __CFString *v56;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_advertisement)
  {
    -[CDASchemaCDAUserFeedbackParticipant advertisement](self, "advertisement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("advertisement"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("advertisement"));

    }
  }
  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x100) != 0)
  {
    v7 = -[CDASchemaCDAUserFeedbackParticipant alarmState](self, "alarmState") - 1;
    if (v7 > 2)
      v8 = CFSTR("CDATEMPORALUTILITYSTATE_UNKNOWN");
    else
      v8 = off_1E56399E0[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("alarmState"));
  }
  if (self->_build)
  {
    -[CDASchemaCDAUserFeedbackParticipant build](self, "build");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("build"));

  }
  if (self->_cdaId)
  {
    -[CDASchemaCDAUserFeedbackParticipant cdaId](self, "cdaId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("cdaId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("cdaId"));

    }
  }
  v14 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v14 & 1) != 0)
  {
    v15 = -[CDASchemaCDAUserFeedbackParticipant decision](self, "decision");
    v16 = CFSTR("CDADECISION_UNKNOWN");
    if (v15 == 1)
      v16 = CFSTR("CDADECISION_WIN");
    if (v15 == 2)
      v17 = CFSTR("CDADECISION_LOSS");
    else
      v17 = v16;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("decision"));
    v14 = *(_WORD *)(&self->_isNearMiss + 1);
  }
  if ((v14 & 0x10) != 0)
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[CDASchemaCDAUserFeedbackParticipant granularBoostDecay](self, "granularBoostDecay");
    objc_msgSend(v18, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("granularBoostDecay"));

    v14 = *(_WORD *)(&self->_isNearMiss + 1);
  }
  if ((v14 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAUserFeedbackParticipant granularBoostValue](self, "granularBoostValue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("granularBoostValue"));

  }
  if (self->_halTargetSiriSpeechId)
  {
    -[CDASchemaCDAUserFeedbackParticipant halTargetSiriSpeechId](self, "halTargetSiriSpeechId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("halTargetSiriSpeechId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("halTargetSiriSpeechId"));

    }
  }
  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CDASchemaCDAUserFeedbackParticipant isNearMiss](self, "isNearMiss"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("isNearMiss"));

  }
  if (self->_locale)
  {
    -[CDASchemaCDAUserFeedbackParticipant locale](self, "locale");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("locale"));

  }
  if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x80) != 0)
  {
    v27 = -[CDASchemaCDAUserFeedbackParticipant mediaState](self, "mediaState") - 1;
    if (v27 > 5)
      v28 = CFSTR("MEDIAPLAYBACKSTATE_UNKNOWN");
    else
      v28 = off_1E56399B0[v27];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("mediaState"));
  }
  if (self->_productTypes)
  {
    -[CDASchemaCDAUserFeedbackParticipant productTypes](self, "productTypes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("productTypes"));

  }
  v31 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v31 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAUserFeedbackParticipant psdScore](self, "psdScore"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("psdScore"));

    v31 = *(_WORD *)(&self->_isNearMiss + 1);
  }
  if ((v31 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[CDASchemaCDAUserFeedbackParticipant rawGoodnessScore](self, "rawGoodnessScore"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("rawGoodnessScore"));

  }
  if (self->_requestId)
  {
    -[CDASchemaCDAUserFeedbackParticipant requestId](self, "requestId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("requestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("requestId"));

    }
  }
  if (self->_roomNameHash)
  {
    -[CDASchemaCDAUserFeedbackParticipant roomNameHash](self, "roomNameHash");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("roomNameHash"));

  }
  if (self->_scoreBoosters)
  {
    -[CDASchemaCDAUserFeedbackParticipant scoreBoosters](self, "scoreBoosters");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("scoreBoosters"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("scoreBoosters"));

    }
  }
  if (self->_siriSpeechId)
  {
    -[CDASchemaCDAUserFeedbackParticipant siriSpeechId](self, "siriSpeechId");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "dictionaryRepresentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("siriSpeechId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("siriSpeechId"));

    }
  }
  v45 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v45 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[CDASchemaCDAUserFeedbackParticipant timeSinceLastWinInMilliseconds](self, "timeSinceLastWinInMilliseconds"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("timeSinceLastWinInMilliseconds"));

    v45 = *(_WORD *)(&self->_isNearMiss + 1);
    if ((v45 & 0x1000) == 0)
    {
LABEL_68:
      if ((v45 & 0x200) == 0)
        goto LABEL_69;
      goto LABEL_76;
    }
  }
  else if ((*(_WORD *)(&self->_isNearMiss + 1) & 0x1000) == 0)
  {
    goto LABEL_68;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[CDASchemaCDAUserFeedbackParticipant timeSinceTriggerInMilliseconds](self, "timeSinceTriggerInMilliseconds"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("timeSinceTriggerInMilliseconds"));

  v45 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v45 & 0x200) == 0)
  {
LABEL_69:
    if ((v45 & 0x800) == 0)
      goto LABEL_70;
    goto LABEL_80;
  }
LABEL_76:
  v51 = -[CDASchemaCDAUserFeedbackParticipant timerState](self, "timerState") - 1;
  if (v51 > 2)
    v52 = CFSTR("CDATEMPORALUTILITYSTATE_UNKNOWN");
  else
    v52 = off_1E56399E0[v51];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("timerState"));
  v45 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v45 & 0x800) == 0)
  {
LABEL_70:
    if ((v45 & 0x20) == 0)
      goto LABEL_71;
LABEL_84:
    v55 = -[CDASchemaCDAUserFeedbackParticipant trumpReason](self, "trumpReason") - 1;
    if (v55 > 7)
      v56 = CFSTR("CDATRUMPREASON_UNKNOWN");
    else
      v56 = off_1E5639A38[v55];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("trumpReason"));
    if ((*(_WORD *)(&self->_isNearMiss + 1) & 2) != 0)
      goto LABEL_72;
    goto LABEL_73;
  }
LABEL_80:
  v53 = -[CDASchemaCDAUserFeedbackParticipant triggerType](self, "triggerType") - 1;
  if (v53 > 7)
    v54 = CFSTR("CDATRIGGER_UKNOWN");
  else
    v54 = off_1E56399F8[v53];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("triggerType"));
  v45 = *(_WORD *)(&self->_isNearMiss + 1);
  if ((v45 & 0x20) != 0)
    goto LABEL_84;
LABEL_71:
  if ((v45 & 2) != 0)
  {
LABEL_72:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[CDASchemaCDAUserFeedbackParticipant voiceTriggerTimeNS](self, "voiceTriggerTimeNS"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("voiceTriggerTimeNS"));

  }
LABEL_73:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v47 = v3;

  return v47;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CDASchemaCDAUserFeedbackParticipant dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CDASchemaCDAUserFeedbackParticipant)initWithJSON:(id)a3
{
  void *v4;
  CDASchemaCDAUserFeedbackParticipant *v5;
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
    self = -[CDASchemaCDAUserFeedbackParticipant initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CDASchemaCDAUserFeedbackParticipant)initWithDictionary:(id)a3
{
  id v4;
  CDASchemaCDAUserFeedbackParticipant *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  uint64_t v8;
  SISchemaUUID *v9;
  uint64_t v10;
  SISchemaUUID *v11;
  uint64_t v12;
  SISchemaUUID *v13;
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
  uint64_t v32;
  void *v33;
  CDASchemaCDAScoreBoosters *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  CDASchemaCDAAdvertisementData *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  CDASchemaCDAUserFeedbackParticipant *v50;
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
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)CDASchemaCDAUserFeedbackParticipant;
  v5 = -[CDASchemaCDAUserFeedbackParticipant init](&v76, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriSpeechId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[CDASchemaCDAUserFeedbackParticipant setSiriSpeechId:](v5, "setSiriSpeechId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdaId"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v8);
      -[CDASchemaCDAUserFeedbackParticipant setCdaId:](v5, "setCdaId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestId"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v10);
      -[CDASchemaCDAUserFeedbackParticipant setRequestId:](v5, "setRequestId:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("halTargetSiriSpeechId"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[CDASchemaCDAUserFeedbackParticipant setHalTargetSiriSpeechId:](v5, "setHalTargetSiriSpeechId:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("decision"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackParticipant setDecision:](v5, "setDecision:", objc_msgSend(v14, "intValue"));
    v64 = (void *)v12;
    v15 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceTriggerTimeNS"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackParticipant setVoiceTriggerTimeNS:](v5, "setVoiceTriggerTimeNS:", objc_msgSend(v16, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawGoodnessScore"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackParticipant setRawGoodnessScore:](v5, "setRawGoodnessScore:", objc_msgSend(v17, "unsignedIntValue"));
    v61 = v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("granularBoostValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v71 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackParticipant setGranularBoostValue:](v5, "setGranularBoostValue:", objc_msgSend(v18, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("granularBoostDecay"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "doubleValue");
      -[CDASchemaCDAUserFeedbackParticipant setGranularBoostDecay:](v5, "setGranularBoostDecay:");
    }
    v60 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trumpReason"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v70 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackParticipant setTrumpReason:](v5, "setTrumpReason:", objc_msgSend(v20, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("psdScore"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v69 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackParticipant setPsdScore:](v5, "setPsdScore:", objc_msgSend(v21, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaState"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackParticipant setMediaState:](v5, "setMediaState:", objc_msgSend(v22, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alarmState"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v68 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackParticipant setAlarmState:](v5, "setAlarmState:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timerState"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackParticipant setTimerState:](v5, "setTimerState:", objc_msgSend(v24, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceLastWinInMilliseconds"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v67 = v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackParticipant setTimeSinceLastWinInMilliseconds:](v5, "setTimeSinceLastWinInMilliseconds:", objc_msgSend(v25, "unsignedLongLongValue"));
    v62 = v16;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackParticipant setTriggerType:](v5, "setTriggerType:", objc_msgSend(v26, "intValue"));
    v63 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("roomNameHash"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v66 = v27;
    v28 = (void *)v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = (void *)objc_msgSend(v27, "copy");
      -[CDASchemaCDAUserFeedbackParticipant setRoomNameHash:](v5, "setRoomNameHash:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceTriggerInMilliseconds"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v31 = (void *)v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackParticipant setTimeSinceTriggerInMilliseconds:](v5, "setTimeSinceTriggerInMilliseconds:", objc_msgSend(v30, "unsignedLongLongValue"));
    v57 = v30;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scoreBoosters"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v65 = (void *)v32;
    v33 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = -[CDASchemaCDAScoreBoosters initWithDictionary:]([CDASchemaCDAScoreBoosters alloc], "initWithDictionary:", v32);
      -[CDASchemaCDAUserFeedbackParticipant setScoreBoosters:](v5, "setScoreBoosters:", v34);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("build"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = (void *)objc_msgSend(v35, "copy");
      -[CDASchemaCDAUserFeedbackParticipant setBuild:](v5, "setBuild:", v36);

    }
    v56 = v35;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = (void *)objc_msgSend(v37, "copy");
      -[CDASchemaCDAUserFeedbackParticipant setLocale:](v5, "setLocale:", v38);

    }
    v55 = v37;
    v58 = v24;
    v59 = v22;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("advertisement"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = -[CDASchemaCDAAdvertisementData initWithDictionary:]([CDASchemaCDAAdvertisementData alloc], "initWithDictionary:", v39);
      -[CDASchemaCDAUserFeedbackParticipant setAdvertisement:](v5, "setAdvertisement:", v40);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productTypes"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = v33;
      v53 = v31;
      v54 = v28;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v42 = v41;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v73 != v45)
              objc_enumerationMutation(v42);
            v47 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v48 = (void *)objc_msgSend(v47, "copy");
              -[CDASchemaCDAUserFeedbackParticipant addProductTypes:](v5, "addProductTypes:", v48);

            }
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
        }
        while (v44);
      }

      v31 = v53;
      v28 = v54;
      v33 = v52;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNearMiss"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CDASchemaCDAUserFeedbackParticipant setIsNearMiss:](v5, "setIsNearMiss:", objc_msgSend(v49, "BOOLValue"));
    v50 = v5;

  }
  return v5;
}

- (SISchemaUUID)siriSpeechId
{
  return self->_siriSpeechId;
}

- (void)setSiriSpeechId:(id)a3
{
  objc_storeStrong((id *)&self->_siriSpeechId, a3);
}

- (SISchemaUUID)cdaId
{
  return self->_cdaId;
}

- (void)setCdaId:(id)a3
{
  objc_storeStrong((id *)&self->_cdaId, a3);
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (SISchemaUUID)halTargetSiriSpeechId
{
  return self->_halTargetSiriSpeechId;
}

- (void)setHalTargetSiriSpeechId:(id)a3
{
  objc_storeStrong((id *)&self->_halTargetSiriSpeechId, a3);
}

- (int)decision
{
  return self->_decision;
}

- (unint64_t)voiceTriggerTimeNS
{
  return self->_voiceTriggerTimeNS;
}

- (unsigned)rawGoodnessScore
{
  return self->_rawGoodnessScore;
}

- (unsigned)granularBoostValue
{
  return self->_granularBoostValue;
}

- (double)granularBoostDecay
{
  return self->_granularBoostDecay;
}

- (int)trumpReason
{
  return self->_trumpReason;
}

- (unsigned)psdScore
{
  return self->_psdScore;
}

- (int)mediaState
{
  return self->_mediaState;
}

- (int)alarmState
{
  return self->_alarmState;
}

- (int)timerState
{
  return self->_timerState;
}

- (unint64_t)timeSinceLastWinInMilliseconds
{
  return self->_timeSinceLastWinInMilliseconds;
}

- (int)triggerType
{
  return self->_triggerType;
}

- (NSString)roomNameHash
{
  return self->_roomNameHash;
}

- (void)setRoomNameHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)timeSinceTriggerInMilliseconds
{
  return self->_timeSinceTriggerInMilliseconds;
}

- (CDASchemaCDAScoreBoosters)scoreBoosters
{
  return self->_scoreBoosters;
}

- (void)setScoreBoosters:(id)a3
{
  objc_storeStrong((id *)&self->_scoreBoosters, a3);
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (CDASchemaCDAAdvertisementData)advertisement
{
  return self->_advertisement;
}

- (void)setAdvertisement:(id)a3
{
  objc_storeStrong((id *)&self->_advertisement, a3);
}

- (NSArray)productTypes
{
  return self->_productTypes;
}

- (void)setProductTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)isNearMiss
{
  return self->_isNearMiss;
}

- (void)setHasSiriSpeechId:(BOOL)a3
{
  *(&self->_isNearMiss + 3) = a3;
}

- (void)setHasCdaId:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasHalTargetSiriSpeechId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasRoomNameHash:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasScoreBoosters:(BOOL)a3
{
  self->_hasSiriSpeechId = a3;
}

- (void)setHasBuild:(BOOL)a3
{
  self->_hasCdaId = a3;
}

- (void)setHasLocale:(BOOL)a3
{
  self->_hasRequestId = a3;
}

- (void)setHasAdvertisement:(BOOL)a3
{
  self->_hasHalTargetSiriSpeechId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productTypes, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_scoreBoosters, 0);
  objc_storeStrong((id *)&self->_roomNameHash, 0);
  objc_storeStrong((id *)&self->_halTargetSiriSpeechId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_cdaId, 0);
  objc_storeStrong((id *)&self->_siriSpeechId, 0);
}

@end
