@implementation MHSchemaMHVoiceTriggerSecondPassStarted

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
  v9.super_class = (Class)MHSchemaMHVoiceTriggerSecondPassStarted;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MHSchemaMHVoiceTriggerSecondPassStarted channelSelectionScores](self, "channelSelectionScores", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MHSchemaMHVoiceTriggerSecondPassStarted setChannelSelectionScores:](self, "setChannelSelectionScores:", v7);
  return v5;
}

- (void)setFirstPassDetectedChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_firstPassDetectedChannel = a3;
}

- (BOOL)hasFirstPassDetectedChannel
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasFirstPassDetectedChannel:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteFirstPassDetectedChannel
{
  -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassDetectedChannel:](self, "setFirstPassDetectedChannel:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setFirstPassScore:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_firstPassScore = a3;
}

- (BOOL)hasFirstPassScore
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasFirstPassScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteFirstPassScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassScore:](self, "setFirstPassScore:", v2);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setFirstPassOnsetChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_firstPassOnsetChannel = a3;
}

- (BOOL)hasFirstPassOnsetChannel
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasFirstPassOnsetChannel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteFirstPassOnsetChannel
{
  -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassOnsetChannel:](self, "setFirstPassOnsetChannel:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setFirstPassOnsetScore:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_firstPassOnsetScore = a3;
}

- (BOOL)hasFirstPassOnsetScore
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasFirstPassOnsetScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteFirstPassOnsetScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassOnsetScore:](self, "setFirstPassOnsetScore:", v2);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)clearChannelSelectionScores
{
  -[NSArray removeAllObjects](self->_channelSelectionScores, "removeAllObjects");
}

- (void)addChannelSelectionScores:(id)a3
{
  id v4;
  NSArray *channelSelectionScores;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  channelSelectionScores = self->_channelSelectionScores;
  v8 = v4;
  if (!channelSelectionScores)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_channelSelectionScores;
    self->_channelSelectionScores = v6;

    v4 = v8;
    channelSelectionScores = self->_channelSelectionScores;
  }
  -[NSArray addObject:](channelSelectionScores, "addObject:", v4);

}

- (unint64_t)channelSelectionScoresCount
{
  return -[NSArray count](self->_channelSelectionScores, "count");
}

- (id)channelSelectionScoresAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_channelSelectionScores, "objectAtIndexedSubscript:", a3);
}

- (void)setFirstPassChannelSelectionDelayNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_firstPassChannelSelectionDelayNs = a3;
}

- (BOOL)hasFirstPassChannelSelectionDelayNs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasFirstPassChannelSelectionDelayNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteFirstPassChannelSelectionDelayNs
{
  -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassChannelSelectionDelayNs:](self, "setFirstPassChannelSelectionDelayNs:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setFirstPassMasterChannelScoreBoost:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_firstPassMasterChannelScoreBoost = a3;
}

- (BOOL)hasFirstPassMasterChannelScoreBoost
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasFirstPassMasterChannelScoreBoost:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteFirstPassMasterChannelScoreBoost
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassMasterChannelScoreBoost:](self, "setFirstPassMasterChannelScoreBoost:", v2);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setFirstPassStartSampleCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_firstPassStartSampleCount = a3;
}

- (BOOL)hasFirstPassStartSampleCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasFirstPassStartSampleCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteFirstPassStartSampleCount
{
  -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassStartSampleCount:](self, "setFirstPassStartSampleCount:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setFirstPassEndSampleCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_firstPassEndSampleCount = a3;
}

- (BOOL)hasFirstPassEndSampleCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasFirstPassEndSampleCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteFirstPassEndSampleCount
{
  -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassEndSampleCount:](self, "setFirstPassEndSampleCount:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setFirstPassFireSampleCount:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_firstPassFireSampleCount = a3;
}

- (BOOL)hasFirstPassFireSampleCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasFirstPassFireSampleCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteFirstPassFireSampleCount
{
  -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassFireSampleCount:](self, "setFirstPassFireSampleCount:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setFirstPassTriggerSource:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_firstPassTriggerSource = a3;
}

- (BOOL)hasFirstPassTriggerSource
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasFirstPassTriggerSource:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteFirstPassTriggerSource
{
  -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassTriggerSource:](self, "setFirstPassTriggerSource:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setEarlyDetectFiredTimeOffsetInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_earlyDetectFiredTimeOffsetInNs = a3;
}

- (BOOL)hasEarlyDetectFiredTimeOffsetInNs
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasEarlyDetectFiredTimeOffsetInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteEarlyDetectFiredTimeOffsetInNs
{
  -[MHSchemaMHVoiceTriggerSecondPassStarted setEarlyDetectFiredTimeOffsetInNs:](self, "setEarlyDetectFiredTimeOffsetInNs:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setEarlyDetectFiredTime:(float)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_earlyDetectFiredTime = a3;
}

- (BOOL)hasEarlyDetectFiredTime
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasEarlyDetectFiredTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)deleteEarlyDetectFiredTime
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerSecondPassStarted setEarlyDetectFiredTime:](self, "setEarlyDetectFiredTime:", v2);
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setFirstPassPrimaryChannelScoreBoost:(float)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_firstPassPrimaryChannelScoreBoost = a3;
}

- (BOOL)hasFirstPassPrimaryChannelScoreBoost
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasFirstPassPrimaryChannelScoreBoost:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)deleteFirstPassPrimaryChannelScoreBoost
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassPrimaryChannelScoreBoost:](self, "setFirstPassPrimaryChannelScoreBoost:", v2);
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setFirstPassInfoDispatchTimeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_firstPassInfoDispatchTimeInNs = a3;
}

- (BOOL)hasFirstPassInfoDispatchTimeInNs
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasFirstPassInfoDispatchTimeInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)deleteFirstPassInfoDispatchTimeInNs
{
  -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassInfoDispatchTimeInNs:](self, "setFirstPassInfoDispatchTimeInNs:", 0);
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (void)setFirstPassInfoReceptionTimeInNs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_firstPassInfoReceptionTimeInNs = a3;
}

- (BOOL)hasFirstPassInfoReceptionTimeInNs
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setHasFirstPassInfoReceptionTimeInNs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (void)deleteFirstPassInfoReceptionTimeInNs
{
  -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassInfoReceptionTimeInNs:](self, "setFirstPassInfoReceptionTimeInNs:", 0);
  *(_WORD *)&self->_has &= ~0x4000u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaMHVoiceTriggerSecondPassStartedReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteFloatField();
LABEL_6:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_channelSelectionScores;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = (__int16)self->_has;
  if ((v11 & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    v11 = (__int16)self->_has;
    if ((v11 & 0x20) == 0)
    {
LABEL_15:
      if ((v11 & 0x40) == 0)
        goto LABEL_16;
      goto LABEL_32;
    }
  }
  else if ((v11 & 0x20) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteFloatField();
  v11 = (__int16)self->_has;
  if ((v11 & 0x40) == 0)
  {
LABEL_16:
    if ((v11 & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  v11 = (__int16)self->_has;
  if ((v11 & 0x80) == 0)
  {
LABEL_17:
    if ((v11 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  v11 = (__int16)self->_has;
  if ((v11 & 0x100) == 0)
  {
LABEL_18:
    if ((v11 & 0x200) == 0)
      goto LABEL_19;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  v11 = (__int16)self->_has;
  if ((v11 & 0x200) == 0)
  {
LABEL_19:
    if ((v11 & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  v11 = (__int16)self->_has;
  if ((v11 & 0x400) == 0)
  {
LABEL_20:
    if ((v11 & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  v11 = (__int16)self->_has;
  if ((v11 & 0x800) == 0)
  {
LABEL_21:
    if ((v11 & 0x1000) == 0)
      goto LABEL_22;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteFloatField();
  v11 = (__int16)self->_has;
  if ((v11 & 0x1000) == 0)
  {
LABEL_22:
    if ((v11 & 0x2000) == 0)
      goto LABEL_23;
LABEL_39:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 0x4000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_38:
  PBDataWriterWriteFloatField();
  v11 = (__int16)self->_has;
  if ((v11 & 0x2000) != 0)
    goto LABEL_39;
LABEL_23:
  if ((v11 & 0x4000) != 0)
LABEL_24:
    PBDataWriterWriteUint64Field();
LABEL_25:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $8B16D0F1F75DD2D04DE0B85616608E80 has;
  unsigned int v6;
  unsigned int firstPassDetectedChannel;
  int v8;
  float firstPassScore;
  float v10;
  int v11;
  unsigned int firstPassOnsetChannel;
  int v13;
  float firstPassOnsetScore;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  $8B16D0F1F75DD2D04DE0B85616608E80 v24;
  int v25;
  unsigned int v26;
  unint64_t firstPassChannelSelectionDelayNs;
  int v28;
  float firstPassMasterChannelScoreBoost;
  float v30;
  int v31;
  unint64_t firstPassStartSampleCount;
  int v33;
  unint64_t firstPassEndSampleCount;
  int v35;
  unint64_t firstPassFireSampleCount;
  int v37;
  int firstPassTriggerSource;
  int v39;
  unint64_t earlyDetectFiredTimeOffsetInNs;
  int v41;
  float earlyDetectFiredTime;
  float v43;
  int v44;
  float firstPassPrimaryChannelScoreBoost;
  float v46;
  int v47;
  unint64_t firstPassInfoDispatchTimeInNs;
  int v49;
  unint64_t firstPassInfoReceptionTimeInNs;
  BOOL v51;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_67;
  has = self->_has;
  v6 = v4[56];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_67;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    firstPassDetectedChannel = self->_firstPassDetectedChannel;
    if (firstPassDetectedChannel != objc_msgSend(v4, "firstPassDetectedChannel"))
      goto LABEL_67;
    has = self->_has;
    v6 = v4[56];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_67;
  if (v8)
  {
    firstPassScore = self->_firstPassScore;
    objc_msgSend(v4, "firstPassScore");
    if (firstPassScore != v10)
      goto LABEL_67;
    has = self->_has;
    v6 = v4[56];
  }
  v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v6 >> 2) & 1))
    goto LABEL_67;
  if (v11)
  {
    firstPassOnsetChannel = self->_firstPassOnsetChannel;
    if (firstPassOnsetChannel != objc_msgSend(v4, "firstPassOnsetChannel"))
      goto LABEL_67;
    has = self->_has;
    v6 = v4[56];
  }
  v13 = (*(unsigned int *)&has >> 3) & 1;
  if (v13 != ((v6 >> 3) & 1))
    goto LABEL_67;
  if (v13)
  {
    firstPassOnsetScore = self->_firstPassOnsetScore;
    objc_msgSend(v4, "firstPassOnsetScore");
    if (firstPassOnsetScore != v15)
      goto LABEL_67;
  }
  -[MHSchemaMHVoiceTriggerSecondPassStarted channelSelectionScores](self, "channelSelectionScores");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "channelSelectionScores");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v16 == 0) == (v17 != 0))
  {

    goto LABEL_67;
  }
  -[MHSchemaMHVoiceTriggerSecondPassStarted channelSelectionScores](self, "channelSelectionScores");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[MHSchemaMHVoiceTriggerSecondPassStarted channelSelectionScores](self, "channelSelectionScores");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "channelSelectionScores");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_67;
  }
  else
  {

  }
  v24 = self->_has;
  v25 = (*(unsigned int *)&v24 >> 4) & 1;
  v26 = v4[56];
  if (v25 != ((v26 >> 4) & 1))
  {
LABEL_67:
    v51 = 0;
    goto LABEL_68;
  }
  if (v25)
  {
    firstPassChannelSelectionDelayNs = self->_firstPassChannelSelectionDelayNs;
    if (firstPassChannelSelectionDelayNs != objc_msgSend(v4, "firstPassChannelSelectionDelayNs"))
      goto LABEL_67;
    v24 = self->_has;
    v26 = v4[56];
  }
  v28 = (*(unsigned int *)&v24 >> 5) & 1;
  if (v28 != ((v26 >> 5) & 1))
    goto LABEL_67;
  if (v28)
  {
    firstPassMasterChannelScoreBoost = self->_firstPassMasterChannelScoreBoost;
    objc_msgSend(v4, "firstPassMasterChannelScoreBoost");
    if (firstPassMasterChannelScoreBoost != v30)
      goto LABEL_67;
    v24 = self->_has;
    v26 = v4[56];
  }
  v31 = (*(unsigned int *)&v24 >> 6) & 1;
  if (v31 != ((v26 >> 6) & 1))
    goto LABEL_67;
  if (v31)
  {
    firstPassStartSampleCount = self->_firstPassStartSampleCount;
    if (firstPassStartSampleCount != objc_msgSend(v4, "firstPassStartSampleCount"))
      goto LABEL_67;
    v24 = self->_has;
    v26 = v4[56];
  }
  v33 = (*(unsigned int *)&v24 >> 7) & 1;
  if (v33 != ((v26 >> 7) & 1))
    goto LABEL_67;
  if (v33)
  {
    firstPassEndSampleCount = self->_firstPassEndSampleCount;
    if (firstPassEndSampleCount != objc_msgSend(v4, "firstPassEndSampleCount"))
      goto LABEL_67;
    v24 = self->_has;
    v26 = v4[56];
  }
  v35 = (*(unsigned int *)&v24 >> 8) & 1;
  if (v35 != ((v26 >> 8) & 1))
    goto LABEL_67;
  if (v35)
  {
    firstPassFireSampleCount = self->_firstPassFireSampleCount;
    if (firstPassFireSampleCount != objc_msgSend(v4, "firstPassFireSampleCount"))
      goto LABEL_67;
    v24 = self->_has;
    v26 = v4[56];
  }
  v37 = (*(unsigned int *)&v24 >> 9) & 1;
  if (v37 != ((v26 >> 9) & 1))
    goto LABEL_67;
  if (v37)
  {
    firstPassTriggerSource = self->_firstPassTriggerSource;
    if (firstPassTriggerSource != objc_msgSend(v4, "firstPassTriggerSource"))
      goto LABEL_67;
    v24 = self->_has;
    v26 = v4[56];
  }
  v39 = (*(unsigned int *)&v24 >> 10) & 1;
  if (v39 != ((v26 >> 10) & 1))
    goto LABEL_67;
  if (v39)
  {
    earlyDetectFiredTimeOffsetInNs = self->_earlyDetectFiredTimeOffsetInNs;
    if (earlyDetectFiredTimeOffsetInNs != objc_msgSend(v4, "earlyDetectFiredTimeOffsetInNs"))
      goto LABEL_67;
    v24 = self->_has;
    v26 = v4[56];
  }
  v41 = (*(unsigned int *)&v24 >> 11) & 1;
  if (v41 != ((v26 >> 11) & 1))
    goto LABEL_67;
  if (v41)
  {
    earlyDetectFiredTime = self->_earlyDetectFiredTime;
    objc_msgSend(v4, "earlyDetectFiredTime");
    if (earlyDetectFiredTime != v43)
      goto LABEL_67;
    v24 = self->_has;
    v26 = v4[56];
  }
  v44 = (*(unsigned int *)&v24 >> 12) & 1;
  if (v44 != ((v26 >> 12) & 1))
    goto LABEL_67;
  if (v44)
  {
    firstPassPrimaryChannelScoreBoost = self->_firstPassPrimaryChannelScoreBoost;
    objc_msgSend(v4, "firstPassPrimaryChannelScoreBoost");
    if (firstPassPrimaryChannelScoreBoost != v46)
      goto LABEL_67;
    v24 = self->_has;
    v26 = v4[56];
  }
  v47 = (*(unsigned int *)&v24 >> 13) & 1;
  if (v47 != ((v26 >> 13) & 1))
    goto LABEL_67;
  if (v47)
  {
    firstPassInfoDispatchTimeInNs = self->_firstPassInfoDispatchTimeInNs;
    if (firstPassInfoDispatchTimeInNs == objc_msgSend(v4, "firstPassInfoDispatchTimeInNs"))
    {
      v24 = self->_has;
      v26 = v4[56];
      goto LABEL_63;
    }
    goto LABEL_67;
  }
LABEL_63:
  v49 = (*(unsigned int *)&v24 >> 14) & 1;
  if (v49 != ((v26 >> 14) & 1))
    goto LABEL_67;
  if (v49)
  {
    firstPassInfoReceptionTimeInNs = self->_firstPassInfoReceptionTimeInNs;
    if (firstPassInfoReceptionTimeInNs != objc_msgSend(v4, "firstPassInfoReceptionTimeInNs"))
      goto LABEL_67;
  }
  v51 = 1;
LABEL_68:

  return v51;
}

- (unint64_t)hash
{
  __int16 has;
  float firstPassScore;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  float firstPassOnsetScore;
  double v11;
  long double v12;
  double v13;
  __int16 v14;
  float firstPassMasterChannelScoreBoost;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  float earlyDetectFiredTime;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  float firstPassPrimaryChannelScoreBoost;
  double v32;
  long double v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v43 = 2654435761 * self->_firstPassDetectedChannel;
    if ((has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v43 = 0;
  if ((has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  firstPassScore = self->_firstPassScore;
  v5 = firstPassScore;
  if (firstPassScore < 0.0)
    v5 = -firstPassScore;
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
  if ((has & 4) != 0)
    v41 = 2654435761 * self->_firstPassOnsetChannel;
  else
    v41 = 0;
  v42 = v8;
  if ((has & 8) != 0)
  {
    firstPassOnsetScore = self->_firstPassOnsetScore;
    v11 = firstPassOnsetScore;
    if (firstPassOnsetScore < 0.0)
      v11 = -firstPassOnsetScore;
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
  v40 = v9;
  v39 = -[NSArray hash](self->_channelSelectionScores, "hash");
  v14 = (__int16)self->_has;
  if ((v14 & 0x10) != 0)
  {
    v38 = 2654435761u * self->_firstPassChannelSelectionDelayNs;
    if ((v14 & 0x20) != 0)
      goto LABEL_24;
LABEL_29:
    v19 = 0;
    goto LABEL_32;
  }
  v38 = 0;
  if ((v14 & 0x20) == 0)
    goto LABEL_29;
LABEL_24:
  firstPassMasterChannelScoreBoost = self->_firstPassMasterChannelScoreBoost;
  v16 = firstPassMasterChannelScoreBoost;
  if (firstPassMasterChannelScoreBoost < 0.0)
    v16 = -firstPassMasterChannelScoreBoost;
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
LABEL_32:
  if ((v14 & 0x40) != 0)
  {
    v20 = 2654435761u * self->_firstPassStartSampleCount;
    if ((v14 & 0x80) != 0)
    {
LABEL_34:
      v21 = 2654435761u * self->_firstPassEndSampleCount;
      if ((v14 & 0x100) != 0)
        goto LABEL_35;
      goto LABEL_44;
    }
  }
  else
  {
    v20 = 0;
    if ((v14 & 0x80) != 0)
      goto LABEL_34;
  }
  v21 = 0;
  if ((v14 & 0x100) != 0)
  {
LABEL_35:
    v22 = 2654435761u * self->_firstPassFireSampleCount;
    if ((v14 & 0x200) != 0)
      goto LABEL_36;
    goto LABEL_45;
  }
LABEL_44:
  v22 = 0;
  if ((v14 & 0x200) != 0)
  {
LABEL_36:
    v23 = 2654435761 * self->_firstPassTriggerSource;
    if ((v14 & 0x400) != 0)
      goto LABEL_37;
LABEL_46:
    v24 = 0;
    if ((v14 & 0x800) != 0)
      goto LABEL_38;
LABEL_47:
    v29 = 0;
    goto LABEL_50;
  }
LABEL_45:
  v23 = 0;
  if ((v14 & 0x400) == 0)
    goto LABEL_46;
LABEL_37:
  v24 = 2654435761u * self->_earlyDetectFiredTimeOffsetInNs;
  if ((v14 & 0x800) == 0)
    goto LABEL_47;
LABEL_38:
  earlyDetectFiredTime = self->_earlyDetectFiredTime;
  v26 = earlyDetectFiredTime;
  if (earlyDetectFiredTime < 0.0)
    v26 = -earlyDetectFiredTime;
  v27 = floor(v26 + 0.5);
  v28 = (v26 - v27) * 1.84467441e19;
  v29 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
  if (v28 >= 0.0)
  {
    if (v28 > 0.0)
      v29 += (unint64_t)v28;
  }
  else
  {
    v29 -= (unint64_t)fabs(v28);
  }
LABEL_50:
  if ((v14 & 0x1000) != 0)
  {
    firstPassPrimaryChannelScoreBoost = self->_firstPassPrimaryChannelScoreBoost;
    v32 = firstPassPrimaryChannelScoreBoost;
    if (firstPassPrimaryChannelScoreBoost < 0.0)
      v32 = -firstPassPrimaryChannelScoreBoost;
    v33 = floor(v32 + 0.5);
    v34 = (v32 - v33) * 1.84467441e19;
    v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0)
        v30 += (unint64_t)v34;
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    v30 = 0;
  }
  if ((v14 & 0x2000) != 0)
  {
    v35 = 2654435761u * self->_firstPassInfoDispatchTimeInNs;
    if ((v14 & 0x4000) != 0)
      goto LABEL_60;
LABEL_62:
    v36 = 0;
    return v42 ^ v43 ^ v41 ^ v40 ^ v38 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v29 ^ v30 ^ v39 ^ v35 ^ v36;
  }
  v35 = 0;
  if ((v14 & 0x4000) == 0)
    goto LABEL_62;
LABEL_60:
  v36 = 2654435761u * self->_firstPassInfoReceptionTimeInNs;
  return v42 ^ v43 ^ v41 ^ v40 ^ v38 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v29 ^ v30 ^ v39 ^ v35 ^ v36;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int16 has;
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
  unsigned int v32;
  const __CFString *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_channelSelectionScores, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v5 = self->_channelSelectionScores;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v36 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v35);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("channelSelectionScores"));
  }
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHVoiceTriggerSecondPassStarted earlyDetectFiredTime](self, "earlyDetectFiredTime");
    objc_msgSend(v13, "numberWithFloat:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("earlyDetectFiredTime"));

    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_15:
      if ((has & 0x10) == 0)
        goto LABEL_16;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerSecondPassStarted earlyDetectFiredTimeOffsetInNs](self, "earlyDetectFiredTimeOffsetInNs", (_QWORD)v35));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("earlyDetectFiredTimeOffsetInNs"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 1) == 0)
      goto LABEL_17;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassChannelSelectionDelayNs](self, "firstPassChannelSelectionDelayNs", (_QWORD)v35));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("firstPassChannelSelectionDelayNs"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_17:
    if ((has & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassDetectedChannel](self, "firstPassDetectedChannel", (_QWORD)v35));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("firstPassDetectedChannel"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_18:
    if ((has & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassEndSampleCount](self, "firstPassEndSampleCount", (_QWORD)v35));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("firstPassEndSampleCount"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_19:
    if ((has & 0x2000) == 0)
      goto LABEL_20;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassFireSampleCount](self, "firstPassFireSampleCount", (_QWORD)v35));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("firstPassFireSampleCount"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_20:
    if ((has & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassInfoDispatchTimeInNs](self, "firstPassInfoDispatchTimeInNs", (_QWORD)v35));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("firstPassInfoDispatchTimeInNs"));

  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_21:
    if ((has & 0x20) == 0)
      goto LABEL_22;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassInfoReceptionTimeInNs](self, "firstPassInfoReceptionTimeInNs", (_QWORD)v35));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("firstPassInfoReceptionTimeInNs"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_22:
    if ((has & 4) == 0)
      goto LABEL_23;
    goto LABEL_38;
  }
LABEL_37:
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassMasterChannelScoreBoost](self, "firstPassMasterChannelScoreBoost", (_QWORD)v35);
  objc_msgSend(v22, "numberWithFloat:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("firstPassMasterChannelScoreBoost"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_23:
    if ((has & 8) == 0)
      goto LABEL_24;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassOnsetChannel](self, "firstPassOnsetChannel", (_QWORD)v35));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("firstPassOnsetChannel"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_24:
    if ((has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_40;
  }
LABEL_39:
  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassOnsetScore](self, "firstPassOnsetScore", (_QWORD)v35);
  objc_msgSend(v25, "numberWithFloat:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("firstPassOnsetScore"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_25:
    if ((has & 2) == 0)
      goto LABEL_26;
    goto LABEL_41;
  }
LABEL_40:
  v27 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassPrimaryChannelScoreBoost](self, "firstPassPrimaryChannelScoreBoost", (_QWORD)v35);
  objc_msgSend(v27, "numberWithFloat:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("firstPassPrimaryChannelScoreBoost"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_26:
    if ((has & 0x40) == 0)
      goto LABEL_27;
LABEL_42:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassStartSampleCount](self, "firstPassStartSampleCount", (_QWORD)v35));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("firstPassStartSampleCount"));

    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_47;
    goto LABEL_43;
  }
LABEL_41:
  v29 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassScore](self, "firstPassScore", (_QWORD)v35);
  objc_msgSend(v29, "numberWithFloat:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("firstPassScore"));

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_42;
LABEL_27:
  if ((has & 0x200) == 0)
    goto LABEL_47;
LABEL_43:
  v32 = -[MHSchemaMHVoiceTriggerSecondPassStarted firstPassTriggerSource](self, "firstPassTriggerSource", (_QWORD)v35)
      - 1;
  if (v32 > 9)
    v33 = CFSTR("MHVOICETRIGGERFIRSTPASSSOURCE_UNKNOWN");
  else
    v33 = off_1E5630778[v32];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("firstPassTriggerSource"));
LABEL_47:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v35);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHVoiceTriggerSecondPassStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHVoiceTriggerSecondPassStarted)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHVoiceTriggerSecondPassStarted *v5;
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
    self = -[MHSchemaMHVoiceTriggerSecondPassStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHVoiceTriggerSecondPassStarted)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHVoiceTriggerSecondPassStarted *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  MHSchemaFirstPassChannelSelectionScore *v17;
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
  MHSchemaMHVoiceTriggerSecondPassStarted *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)MHSchemaMHVoiceTriggerSecondPassStarted;
  v5 = -[MHSchemaMHVoiceTriggerSecondPassStarted init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassDetectedChannel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassDetectedChannel:](v5, "setFirstPassDetectedChannel:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassScore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassScore:](v5, "setFirstPassScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassOnsetChannel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v38 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassOnsetChannel:](v5, "setFirstPassOnsetChannel:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassOnsetScore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v37 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassOnsetScore:](v5, "setFirstPassOnsetScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("channelSelectionScores"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v41 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[MHSchemaFirstPassChannelSelectionScore initWithDictionary:]([MHSchemaFirstPassChannelSelectionScore alloc], "initWithDictionary:", v16);
              -[MHSchemaMHVoiceTriggerSecondPassStarted addChannelSelectionScores:](v5, "addChannelSelectionScores:", v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v13);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassChannelSelectionDelayNs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassChannelSelectionDelayNs:](v5, "setFirstPassChannelSelectionDelayNs:", objc_msgSend(v18, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassMasterChannelScoreBoost"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "floatValue");
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassMasterChannelScoreBoost:](v5, "setFirstPassMasterChannelScoreBoost:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassStartSampleCount"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassStartSampleCount:](v5, "setFirstPassStartSampleCount:", objc_msgSend(v20, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassEndSampleCount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassEndSampleCount:](v5, "setFirstPassEndSampleCount:", objc_msgSend(v21, "unsignedLongLongValue"));
    v34 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassFireSampleCount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassFireSampleCount:](v5, "setFirstPassFireSampleCount:", objc_msgSend(v22, "unsignedLongLongValue"));
    v32 = v22;
    v33 = v21;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassTriggerSource"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassTriggerSource:](v5, "setFirstPassTriggerSource:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("earlyDetectFiredTimeOffsetInNs"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerSecondPassStarted setEarlyDetectFiredTimeOffsetInNs:](v5, "setEarlyDetectFiredTimeOffsetInNs:", objc_msgSend(v24, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("earlyDetectFiredTime"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v25, "floatValue");
      -[MHSchemaMHVoiceTriggerSecondPassStarted setEarlyDetectFiredTime:](v5, "setEarlyDetectFiredTime:");
    }
    v35 = v18;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassPrimaryChannelScoreBoost"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v26, "floatValue");
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassPrimaryChannelScoreBoost:](v5, "setFirstPassPrimaryChannelScoreBoost:");
    }
    v27 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassInfoDispatchTimeInNs"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassInfoDispatchTimeInNs:](v5, "setFirstPassInfoDispatchTimeInNs:", objc_msgSend(v28, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassInfoReceptionTimeInNs"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerSecondPassStarted setFirstPassInfoReceptionTimeInNs:](v5, "setFirstPassInfoReceptionTimeInNs:", objc_msgSend(v29, "unsignedLongLongValue"));
    v30 = v5;

  }
  return v5;
}

- (unsigned)firstPassDetectedChannel
{
  return self->_firstPassDetectedChannel;
}

- (float)firstPassScore
{
  return self->_firstPassScore;
}

- (unsigned)firstPassOnsetChannel
{
  return self->_firstPassOnsetChannel;
}

- (float)firstPassOnsetScore
{
  return self->_firstPassOnsetScore;
}

- (NSArray)channelSelectionScores
{
  return self->_channelSelectionScores;
}

- (void)setChannelSelectionScores:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)firstPassChannelSelectionDelayNs
{
  return self->_firstPassChannelSelectionDelayNs;
}

- (float)firstPassMasterChannelScoreBoost
{
  return self->_firstPassMasterChannelScoreBoost;
}

- (unint64_t)firstPassStartSampleCount
{
  return self->_firstPassStartSampleCount;
}

- (unint64_t)firstPassEndSampleCount
{
  return self->_firstPassEndSampleCount;
}

- (unint64_t)firstPassFireSampleCount
{
  return self->_firstPassFireSampleCount;
}

- (int)firstPassTriggerSource
{
  return self->_firstPassTriggerSource;
}

- (unint64_t)earlyDetectFiredTimeOffsetInNs
{
  return self->_earlyDetectFiredTimeOffsetInNs;
}

- (float)earlyDetectFiredTime
{
  return self->_earlyDetectFiredTime;
}

- (float)firstPassPrimaryChannelScoreBoost
{
  return self->_firstPassPrimaryChannelScoreBoost;
}

- (unint64_t)firstPassInfoDispatchTimeInNs
{
  return self->_firstPassInfoDispatchTimeInNs;
}

- (unint64_t)firstPassInfoReceptionTimeInNs
{
  return self->_firstPassInfoReceptionTimeInNs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelSelectionScores, 0);
}

@end
