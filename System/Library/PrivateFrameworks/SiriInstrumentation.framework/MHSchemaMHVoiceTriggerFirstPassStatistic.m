@implementation MHSchemaMHVoiceTriggerFirstPassStatistic

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setFirstPassPeakScoreHS:(float)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_firstPassPeakScoreHS = a3;
}

- (BOOL)hasFirstPassPeakScoreHS
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasFirstPassPeakScoreHS:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteFirstPassPeakScoreHS
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setFirstPassPeakScoreHS:](self, "setFirstPassPeakScoreHS:", v2);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setFirstPassPeakScoreJS:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_firstPassPeakScoreJS = a3;
}

- (BOOL)hasFirstPassPeakScoreJS
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasFirstPassPeakScoreJS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteFirstPassPeakScoreJS
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setFirstPassPeakScoreJS:](self, "setFirstPassPeakScoreJS:", v2);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setFirstPassTriggerSource:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_firstPassTriggerSource = a3;
}

- (BOOL)hasFirstPassTriggerSource
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasFirstPassTriggerSource:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteFirstPassTriggerSource
{
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setFirstPassTriggerSource:](self, "setFirstPassTriggerSource:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setRecognizerScoreHS:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_recognizerScoreHS = a3;
}

- (BOOL)hasRecognizerScoreHS
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasRecognizerScoreHS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteRecognizerScoreHS
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setRecognizerScoreHS:](self, "setRecognizerScoreHS:", v2);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setRecognizerScoreJS:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_recognizerScoreJS = a3;
}

- (BOOL)hasRecognizerScoreJS
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasRecognizerScoreJS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteRecognizerScoreJS
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setRecognizerScoreJS:](self, "setRecognizerScoreJS:", v2);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setTriggerScoreHS:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_triggerScoreHS = a3;
}

- (BOOL)hasTriggerScoreHS
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasTriggerScoreHS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteTriggerScoreHS
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setTriggerScoreHS:](self, "setTriggerScoreHS:", v2);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setTriggerScoreJS:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_triggerScoreJS = a3;
}

- (BOOL)hasTriggerScoreJS
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasTriggerScoreJS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteTriggerScoreJS
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setTriggerScoreJS:](self, "setTriggerScoreJS:", v2);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setMitigationScore:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_mitigationScore = a3;
}

- (BOOL)hasMitigationScore
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasMitigationScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteMitigationScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setMitigationScore:](self, "setMitigationScore:", v2);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setInvocationTypeId:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_invocationTypeId = a3;
}

- (BOOL)hasInvocationTypeId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasInvocationTypeId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteInvocationTypeId
{
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setInvocationTypeId:](self, "setInvocationTypeId:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setSecondsSinceEpoch:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_secondsSinceEpoch = a3;
}

- (BOOL)hasSecondsSinceEpoch
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasSecondsSinceEpoch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteSecondsSinceEpoch
{
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setSecondsSinceEpoch:](self, "setSecondsSinceEpoch:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setRepetitionSimilarityScore:(float)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_repetitionSimilarityScore = a3;
}

- (BOOL)hasRepetitionSimilarityScore
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasRepetitionSimilarityScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteRepetitionSimilarityScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setRepetitionSimilarityScore:](self, "setRepetitionSimilarityScore:", v2);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setTdSpeakerRecognizerCombinedScore:(float)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_tdSpeakerRecognizerCombinedScore = a3;
}

- (BOOL)hasTdSpeakerRecognizerCombinedScore
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasTdSpeakerRecognizerCombinedScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)deleteTdSpeakerRecognizerCombinedScore
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setTdSpeakerRecognizerCombinedScore:](self, "setTdSpeakerRecognizerCombinedScore:", v2);
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setKeywordThresholdHS:(float)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_keywordThresholdHS = a3;
}

- (BOOL)hasKeywordThresholdHS
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasKeywordThresholdHS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)deleteKeywordThresholdHS
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setKeywordThresholdHS:](self, "setKeywordThresholdHS:", v2);
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setKeywordThresholdJS:(float)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_keywordThresholdJS = a3;
}

- (BOOL)hasKeywordThresholdJS
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasKeywordThresholdJS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)deleteKeywordThresholdJS
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setKeywordThresholdJS:](self, "setKeywordThresholdJS:", v2);
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (void)setTdSpeakerRecognizerCombinedThresholdHS:(float)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_tdSpeakerRecognizerCombinedThresholdHS = a3;
}

- (BOOL)hasTdSpeakerRecognizerCombinedThresholdHS
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setHasTdSpeakerRecognizerCombinedThresholdHS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (void)deleteTdSpeakerRecognizerCombinedThresholdHS
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setTdSpeakerRecognizerCombinedThresholdHS:](self, "setTdSpeakerRecognizerCombinedThresholdHS:", v2);
  *(_WORD *)&self->_has &= ~0x4000u;
}

- (void)setTdSpeakerRecognizerCombinedThresholdJS:(float)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_tdSpeakerRecognizerCombinedThresholdJS = a3;
}

- (BOOL)hasTdSpeakerRecognizerCombinedThresholdJS
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setHasTdSpeakerRecognizerCombinedThresholdJS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (void)deleteTdSpeakerRecognizerCombinedThresholdJS
{
  double v2;

  LODWORD(v2) = 0;
  -[MHSchemaMHVoiceTriggerFirstPassStatistic setTdSpeakerRecognizerCombinedThresholdJS:](self, "setTdSpeakerRecognizerCombinedThresholdJS:", v2);
  *(_WORD *)&self->_has &= ~0x8000u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return MHSchemaMHVoiceTriggerFirstPassStatisticReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
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
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x4000) == 0)
      goto LABEL_16;
LABEL_32:
    PBDataWriterWriteFloatField();
    if ((*(_WORD *)&self->_has & 0x8000) == 0)
      goto LABEL_17;
LABEL_33:
    PBDataWriterWriteFloatField();
    goto LABEL_17;
  }
LABEL_31:
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x4000) != 0)
    goto LABEL_32;
LABEL_16:
  if (has < 0)
    goto LABEL_33;
LABEL_17:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  $BDD9DD6230064E189ACABF0793086A9C has;
  unsigned int v6;
  float firstPassPeakScoreHS;
  float v8;
  int v9;
  float firstPassPeakScoreJS;
  float v11;
  int v12;
  int firstPassTriggerSource;
  int v14;
  float recognizerScoreHS;
  float v16;
  int v17;
  float recognizerScoreJS;
  float v19;
  int v20;
  float triggerScoreHS;
  float v22;
  int v23;
  float triggerScoreJS;
  float v25;
  int v26;
  float mitigationScore;
  float v28;
  int v29;
  int invocationTypeId;
  int v31;
  int64_t secondsSinceEpoch;
  int v33;
  float repetitionSimilarityScore;
  float v35;
  int v36;
  float tdSpeakerRecognizerCombinedScore;
  float v38;
  int v39;
  float keywordThresholdHS;
  float v41;
  int v42;
  float keywordThresholdJS;
  float v44;
  int v45;
  float tdSpeakerRecognizerCombinedThresholdHS;
  float v47;
  float tdSpeakerRecognizerCombinedThresholdJS;
  float v49;
  BOOL v50;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_65;
  has = self->_has;
  v6 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_65;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    firstPassPeakScoreHS = self->_firstPassPeakScoreHS;
    objc_msgSend(v4, "firstPassPeakScoreHS");
    if (firstPassPeakScoreHS != v8)
      goto LABEL_65;
    has = self->_has;
    v6 = v4[40];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      firstPassPeakScoreJS = self->_firstPassPeakScoreJS;
      objc_msgSend(v4, "firstPassPeakScoreJS");
      if (firstPassPeakScoreJS != v11)
        goto LABEL_65;
      has = self->_has;
      v6 = v4[40];
    }
    v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (v12)
      {
        firstPassTriggerSource = self->_firstPassTriggerSource;
        if (firstPassTriggerSource != objc_msgSend(v4, "firstPassTriggerSource"))
          goto LABEL_65;
        has = self->_has;
        v6 = v4[40];
      }
      v14 = (*(unsigned int *)&has >> 3) & 1;
      if (v14 == ((v6 >> 3) & 1))
      {
        if (v14)
        {
          recognizerScoreHS = self->_recognizerScoreHS;
          objc_msgSend(v4, "recognizerScoreHS");
          if (recognizerScoreHS != v16)
            goto LABEL_65;
          has = self->_has;
          v6 = v4[40];
        }
        v17 = (*(unsigned int *)&has >> 4) & 1;
        if (v17 == ((v6 >> 4) & 1))
        {
          if (v17)
          {
            recognizerScoreJS = self->_recognizerScoreJS;
            objc_msgSend(v4, "recognizerScoreJS");
            if (recognizerScoreJS != v19)
              goto LABEL_65;
            has = self->_has;
            v6 = v4[40];
          }
          v20 = (*(unsigned int *)&has >> 5) & 1;
          if (v20 == ((v6 >> 5) & 1))
          {
            if (v20)
            {
              triggerScoreHS = self->_triggerScoreHS;
              objc_msgSend(v4, "triggerScoreHS");
              if (triggerScoreHS != v22)
                goto LABEL_65;
              has = self->_has;
              v6 = v4[40];
            }
            v23 = (*(unsigned int *)&has >> 6) & 1;
            if (v23 == ((v6 >> 6) & 1))
            {
              if (v23)
              {
                triggerScoreJS = self->_triggerScoreJS;
                objc_msgSend(v4, "triggerScoreJS");
                if (triggerScoreJS != v25)
                  goto LABEL_65;
                has = self->_has;
                v6 = v4[40];
              }
              v26 = (*(unsigned int *)&has >> 7) & 1;
              if (v26 == ((v6 >> 7) & 1))
              {
                if (v26)
                {
                  mitigationScore = self->_mitigationScore;
                  objc_msgSend(v4, "mitigationScore");
                  if (mitigationScore != v28)
                    goto LABEL_65;
                  has = self->_has;
                  v6 = v4[40];
                }
                v29 = (*(unsigned int *)&has >> 8) & 1;
                if (v29 == ((v6 >> 8) & 1))
                {
                  if (v29)
                  {
                    invocationTypeId = self->_invocationTypeId;
                    if (invocationTypeId != objc_msgSend(v4, "invocationTypeId"))
                      goto LABEL_65;
                    has = self->_has;
                    v6 = v4[40];
                  }
                  v31 = (*(unsigned int *)&has >> 9) & 1;
                  if (v31 == ((v6 >> 9) & 1))
                  {
                    if (v31)
                    {
                      secondsSinceEpoch = self->_secondsSinceEpoch;
                      if (secondsSinceEpoch != objc_msgSend(v4, "secondsSinceEpoch"))
                        goto LABEL_65;
                      has = self->_has;
                      v6 = v4[40];
                    }
                    v33 = (*(unsigned int *)&has >> 10) & 1;
                    if (v33 == ((v6 >> 10) & 1))
                    {
                      if (v33)
                      {
                        repetitionSimilarityScore = self->_repetitionSimilarityScore;
                        objc_msgSend(v4, "repetitionSimilarityScore");
                        if (repetitionSimilarityScore != v35)
                          goto LABEL_65;
                        has = self->_has;
                        v6 = v4[40];
                      }
                      v36 = (*(unsigned int *)&has >> 11) & 1;
                      if (v36 == ((v6 >> 11) & 1))
                      {
                        if (v36)
                        {
                          tdSpeakerRecognizerCombinedScore = self->_tdSpeakerRecognizerCombinedScore;
                          objc_msgSend(v4, "tdSpeakerRecognizerCombinedScore");
                          if (tdSpeakerRecognizerCombinedScore != v38)
                            goto LABEL_65;
                          has = self->_has;
                          v6 = v4[40];
                        }
                        v39 = (*(unsigned int *)&has >> 12) & 1;
                        if (v39 == ((v6 >> 12) & 1))
                        {
                          if (v39)
                          {
                            keywordThresholdHS = self->_keywordThresholdHS;
                            objc_msgSend(v4, "keywordThresholdHS");
                            if (keywordThresholdHS != v41)
                              goto LABEL_65;
                            has = self->_has;
                            v6 = v4[40];
                          }
                          v42 = (*(unsigned int *)&has >> 13) & 1;
                          if (v42 == ((v6 >> 13) & 1))
                          {
                            if (v42)
                            {
                              keywordThresholdJS = self->_keywordThresholdJS;
                              objc_msgSend(v4, "keywordThresholdJS");
                              if (keywordThresholdJS != v44)
                                goto LABEL_65;
                              has = self->_has;
                              v6 = v4[40];
                            }
                            v45 = (*(unsigned int *)&has >> 14) & 1;
                            if (v45 == ((v6 >> 14) & 1))
                            {
                              if (v45)
                              {
                                tdSpeakerRecognizerCombinedThresholdHS = self->_tdSpeakerRecognizerCombinedThresholdHS;
                                objc_msgSend(v4, "tdSpeakerRecognizerCombinedThresholdHS");
                                if (tdSpeakerRecognizerCombinedThresholdHS != v47)
                                  goto LABEL_65;
                                has = self->_has;
                                v6 = v4[40];
                              }
                              if (((v6 ^ *(_DWORD *)&has) & 0x8000) == 0)
                              {
                                if ((*(_WORD *)&has & 0x8000) == 0
                                  || (tdSpeakerRecognizerCombinedThresholdJS = self->_tdSpeakerRecognizerCombinedThresholdJS,
                                      objc_msgSend(v4, "tdSpeakerRecognizerCombinedThresholdJS"),
                                      tdSpeakerRecognizerCombinedThresholdJS == v49))
                                {
                                  v50 = 1;
                                  goto LABEL_66;
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
    }
  }
LABEL_65:
  v50 = 0;
LABEL_66:

  return v50;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  float firstPassPeakScoreHS;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float firstPassPeakScoreJS;
  double v11;
  long double v12;
  double v13;
  float recognizerScoreHS;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  float recognizerScoreJS;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  float triggerScoreHS;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  float triggerScoreJS;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  float mitigationScore;
  double v36;
  long double v37;
  double v38;
  float repetitionSimilarityScore;
  double v40;
  long double v41;
  double v42;
  double v43;
  unint64_t v44;
  float tdSpeakerRecognizerCombinedScore;
  double v46;
  long double v47;
  double v48;
  double v49;
  unint64_t v50;
  unint64_t v51;
  float keywordThresholdHS;
  double v53;
  long double v54;
  double v55;
  unint64_t v56;
  float keywordThresholdJS;
  double v58;
  long double v59;
  double v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  float tdSpeakerRecognizerCombinedThresholdHS;
  double v67;
  long double v68;
  double v69;
  unint64_t v70;
  float tdSpeakerRecognizerCombinedThresholdJS;
  double v72;
  long double v73;
  double v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  MHSchemaMHVoiceTriggerFirstPassStatistic *v85;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    firstPassPeakScoreHS = self->_firstPassPeakScoreHS;
    v6 = firstPassPeakScoreHS;
    if (firstPassPeakScoreHS < 0.0)
      v6 = -firstPassPeakScoreHS;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
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
  if ((has & 4) != 0)
  {
    v80 = 2654435761 * self->_firstPassTriggerSource;
    if ((has & 8) != 0)
      goto LABEL_19;
LABEL_24:
    v18 = 0;
    goto LABEL_25;
  }
  v80 = 0;
  if ((has & 8) == 0)
    goto LABEL_24;
LABEL_19:
  recognizerScoreHS = self->_recognizerScoreHS;
  v15 = recognizerScoreHS;
  if (recognizerScoreHS < 0.0)
    v15 = -recognizerScoreHS;
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
LABEL_25:
  if ((has & 0x10) != 0)
  {
    recognizerScoreJS = self->_recognizerScoreJS;
    v21 = recognizerScoreJS;
    if (recognizerScoreJS < 0.0)
      v21 = -recognizerScoreJS;
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
  if ((has & 0x20) != 0)
  {
    triggerScoreHS = self->_triggerScoreHS;
    v26 = triggerScoreHS;
    if (triggerScoreHS < 0.0)
      v26 = -triggerScoreHS;
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
  if ((has & 0x40) != 0)
  {
    triggerScoreJS = self->_triggerScoreJS;
    v31 = triggerScoreJS;
    if (triggerScoreJS < 0.0)
      v31 = -triggerScoreJS;
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
  if ((has & 0x80) != 0)
  {
    mitigationScore = self->_mitigationScore;
    v36 = mitigationScore;
    if (mitigationScore < 0.0)
      v36 = -mitigationScore;
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
  if ((has & 0x100) != 0)
  {
    v79 = 2654435761 * self->_invocationTypeId;
    if ((has & 0x200) != 0)
    {
LABEL_61:
      v78 = 2654435761 * self->_secondsSinceEpoch;
      if ((has & 0x400) != 0)
        goto LABEL_62;
LABEL_68:
      v84 = 0;
      goto LABEL_72;
    }
  }
  else
  {
    v79 = 0;
    if ((has & 0x200) != 0)
      goto LABEL_61;
  }
  v78 = 0;
  if ((has & 0x400) == 0)
    goto LABEL_68;
LABEL_62:
  repetitionSimilarityScore = self->_repetitionSimilarityScore;
  v40 = repetitionSimilarityScore;
  if (repetitionSimilarityScore < 0.0)
    v40 = -repetitionSimilarityScore;
  v41 = floor(v40 + 0.5);
  v42 = (v40 - v41) * 1.84467441e19;
  v43 = fmod(v41, 1.84467441e19);
  if (v42 >= 0.0)
  {
    v84 = 2654435761u * (unint64_t)v43;
    if (v42 <= 0.0)
      goto LABEL_72;
    v44 = v84 + (unint64_t)v42;
  }
  else
  {
    v44 = 2654435761u * (unint64_t)v43 - (unint64_t)fabs(v42);
  }
  v84 = v44;
LABEL_72:
  if ((has & 0x800) == 0)
  {
    v83 = 0;
    goto LABEL_81;
  }
  tdSpeakerRecognizerCombinedScore = self->_tdSpeakerRecognizerCombinedScore;
  v46 = tdSpeakerRecognizerCombinedScore;
  if (tdSpeakerRecognizerCombinedScore < 0.0)
    v46 = -tdSpeakerRecognizerCombinedScore;
  v47 = floor(v46 + 0.5);
  v48 = (v46 - v47) * 1.84467441e19;
  v49 = fmod(v47, 1.84467441e19);
  if (v48 >= 0.0)
  {
    v83 = 2654435761u * (unint64_t)v49;
    if (v48 <= 0.0)
      goto LABEL_81;
    v50 = v83 + (unint64_t)v48;
  }
  else
  {
    v50 = 2654435761u * (unint64_t)v49 - (unint64_t)fabs(v48);
  }
  v83 = v50;
LABEL_81:
  v81 = v29;
  v85 = self;
  if ((has & 0x1000) != 0)
  {
    keywordThresholdHS = self->_keywordThresholdHS;
    v53 = keywordThresholdHS;
    if (keywordThresholdHS < 0.0)
      v53 = -keywordThresholdHS;
    v54 = floor(v53 + 0.5);
    v55 = (v53 - v54) * 1.84467441e19;
    v51 = 2654435761u * (unint64_t)fmod(v54, 1.84467441e19);
    if (v55 >= 0.0)
    {
      if (v55 > 0.0)
        v51 += (unint64_t)v55;
    }
    else
    {
      v51 -= (unint64_t)fabs(v55);
    }
  }
  else
  {
    v51 = 0;
  }
  v82 = v4;
  if ((has & 0x2000) != 0)
  {
    keywordThresholdJS = v85->_keywordThresholdJS;
    v58 = keywordThresholdJS;
    if (keywordThresholdJS < 0.0)
      v58 = -keywordThresholdJS;
    v59 = floor(v58 + 0.5);
    v60 = (v58 - v59) * 1.84467441e19;
    v56 = 2654435761u * (unint64_t)fmod(v59, 1.84467441e19);
    if (v60 >= 0.0)
    {
      if (v60 > 0.0)
        v56 += (unint64_t)v60;
    }
    else
    {
      v56 -= (unint64_t)fabs(v60);
    }
  }
  else
  {
    v56 = 0;
  }
  v61 = v34;
  v62 = v19;
  v63 = v18;
  if ((has & 0x4000) != 0)
  {
    v64 = v9;
    tdSpeakerRecognizerCombinedThresholdHS = v85->_tdSpeakerRecognizerCombinedThresholdHS;
    v67 = tdSpeakerRecognizerCombinedThresholdHS;
    if (tdSpeakerRecognizerCombinedThresholdHS < 0.0)
      v67 = -tdSpeakerRecognizerCombinedThresholdHS;
    v68 = floor(v67 + 0.5);
    v69 = (v67 - v68) * 1.84467441e19;
    v65 = 2654435761u * (unint64_t)fmod(v68, 1.84467441e19);
    if (v69 >= 0.0)
    {
      if (v69 > 0.0)
        v65 += (unint64_t)v69;
    }
    else
    {
      v65 -= (unint64_t)fabs(v69);
    }
  }
  else
  {
    v64 = v9;
    v65 = 0;
  }
  if ((has & 0x8000) == 0)
  {
    v70 = 0;
LABEL_111:
    v76 = v83;
    v75 = v84;
    return v64 ^ v82 ^ v80 ^ v63 ^ v62 ^ v24 ^ v81 ^ v61 ^ v79 ^ v78 ^ v75 ^ v76 ^ v51 ^ v56 ^ v65 ^ v70;
  }
  tdSpeakerRecognizerCombinedThresholdJS = v85->_tdSpeakerRecognizerCombinedThresholdJS;
  v72 = tdSpeakerRecognizerCombinedThresholdJS;
  if (tdSpeakerRecognizerCombinedThresholdJS < 0.0)
    v72 = -tdSpeakerRecognizerCombinedThresholdJS;
  v73 = floor(v72 + 0.5);
  v74 = (v72 - v73) * 1.84467441e19;
  v70 = 2654435761u * (unint64_t)fmod(v73, 1.84467441e19);
  if (v74 < 0.0)
  {
    v70 -= (unint64_t)fabs(v74);
    goto LABEL_111;
  }
  v76 = v83;
  v75 = v84;
  if (v74 > 0.0)
    v70 += (unint64_t)v74;
  return v64 ^ v82 ^ v80 ^ v63 ^ v62 ^ v24 ^ v81 ^ v61 ^ v79 ^ v78 ^ v75 ^ v76 ^ v51 ^ v56 ^ v65 ^ v70;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHVoiceTriggerFirstPassStatistic firstPassPeakScoreHS](self, "firstPassPeakScoreHS");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("firstPassPeakScoreHS"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerFirstPassStatistic firstPassPeakScoreJS](self, "firstPassPeakScoreJS");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("firstPassPeakScoreJS"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_21:
  v12 = -[MHSchemaMHVoiceTriggerFirstPassStatistic firstPassTriggerSource](self, "firstPassTriggerSource") - 1;
  if (v12 > 9)
    v13 = CFSTR("MHVOICETRIGGERFIRSTPASSSOURCE_UNKNOWN");
  else
    v13 = off_1E56306E0[v12];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("firstPassTriggerSource"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MHSchemaMHVoiceTriggerFirstPassStatistic invocationTypeId](self, "invocationTypeId"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("invocationTypeId"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerFirstPassStatistic keywordThresholdHS](self, "keywordThresholdHS");
  objc_msgSend(v15, "numberWithFloat:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("keywordThresholdHS"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerFirstPassStatistic keywordThresholdJS](self, "keywordThresholdJS");
  objc_msgSend(v17, "numberWithFloat:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("keywordThresholdJS"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerFirstPassStatistic mitigationScore](self, "mitigationScore");
  objc_msgSend(v19, "numberWithFloat:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("mitigationScore"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerFirstPassStatistic recognizerScoreHS](self, "recognizerScoreHS");
  objc_msgSend(v21, "numberWithFloat:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("recognizerScoreHS"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerFirstPassStatistic recognizerScoreJS](self, "recognizerScoreJS");
  objc_msgSend(v23, "numberWithFloat:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("recognizerScoreJS"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerFirstPassStatistic repetitionSimilarityScore](self, "repetitionSimilarityScore");
  objc_msgSend(v25, "numberWithFloat:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("repetitionSimilarityScore"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MHSchemaMHVoiceTriggerFirstPassStatistic secondsSinceEpoch](self, "secondsSinceEpoch"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("secondsSinceEpoch"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerFirstPassStatistic tdSpeakerRecognizerCombinedScore](self, "tdSpeakerRecognizerCombinedScore");
  objc_msgSend(v28, "numberWithFloat:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("tdSpeakerRecognizerCombinedScore"));

  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_14:
    if ((has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  v30 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerFirstPassStatistic tdSpeakerRecognizerCombinedThresholdHS](self, "tdSpeakerRecognizerCombinedThresholdHS");
  objc_msgSend(v30, "numberWithFloat:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("tdSpeakerRecognizerCombinedThresholdHS"));

  has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0)
      goto LABEL_16;
LABEL_36:
    v34 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHVoiceTriggerFirstPassStatistic triggerScoreHS](self, "triggerScoreHS");
    objc_msgSend(v34, "numberWithFloat:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("triggerScoreHS"));

    if ((*(_WORD *)&self->_has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_35:
  v32 = (void *)MEMORY[0x1E0CB37E8];
  -[MHSchemaMHVoiceTriggerFirstPassStatistic tdSpeakerRecognizerCombinedThresholdJS](self, "tdSpeakerRecognizerCombinedThresholdJS");
  objc_msgSend(v32, "numberWithFloat:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("tdSpeakerRecognizerCombinedThresholdJS"));

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_36;
LABEL_16:
  if ((has & 0x40) != 0)
  {
LABEL_17:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[MHSchemaMHVoiceTriggerFirstPassStatistic triggerScoreJS](self, "triggerScoreJS");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("triggerScoreJS"));

  }
LABEL_18:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHVoiceTriggerFirstPassStatistic dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHVoiceTriggerFirstPassStatistic)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHVoiceTriggerFirstPassStatistic *v5;
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
    self = -[MHSchemaMHVoiceTriggerFirstPassStatistic initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHVoiceTriggerFirstPassStatistic)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHVoiceTriggerFirstPassStatistic *v5;
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
  MHSchemaMHVoiceTriggerFirstPassStatistic *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MHSchemaMHVoiceTriggerFirstPassStatistic;
  v5 = -[MHSchemaMHVoiceTriggerFirstPassStatistic init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassPeakScoreHS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setFirstPassPeakScoreHS:](v5, "setFirstPassPeakScoreHS:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassPeakScoreJS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setFirstPassPeakScoreJS:](v5, "setFirstPassPeakScoreJS:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassTriggerSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setFirstPassTriggerSource:](v5, "setFirstPassTriggerSource:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizerScoreHS"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setRecognizerScoreHS:](v5, "setRecognizerScoreHS:");
    }
    v32 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recognizerScoreJS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setRecognizerScoreJS:](v5, "setRecognizerScoreJS:");
    }
    v11 = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerScoreHS"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setTriggerScoreHS:](v5, "setTriggerScoreHS:");
    }
    v13 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerScoreJS"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "floatValue");
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setTriggerScoreJS:](v5, "setTriggerScoreJS:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mitigationScore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "floatValue");
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setMitigationScore:](v5, "setMitigationScore:");
    }
    v34 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("invocationTypeId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setInvocationTypeId:](v5, "setInvocationTypeId:", objc_msgSend(v16, "intValue"));
    v33 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondsSinceEpoch"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setSecondsSinceEpoch:](v5, "setSecondsSinceEpoch:", objc_msgSend(v17, "longLongValue"));
    v27 = v17;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("repetitionSimilarityScore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "floatValue");
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setRepetitionSimilarityScore:](v5, "setRepetitionSimilarityScore:");
    }
    v31 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerCombinedScore"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v19, "floatValue");
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setTdSpeakerRecognizerCombinedScore:](v5, "setTdSpeakerRecognizerCombinedScore:");
    }
    v30 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keywordThresholdHS"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v20, "floatValue");
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setKeywordThresholdHS:](v5, "setKeywordThresholdHS:");
    }
    v28 = v16;
    v29 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keywordThresholdJS"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "floatValue");
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setKeywordThresholdJS:](v5, "setKeywordThresholdJS:");
    }
    v22 = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerCombinedThresholdHS"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "floatValue");
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setTdSpeakerRecognizerCombinedThresholdHS:](v5, "setTdSpeakerRecognizerCombinedThresholdHS:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tdSpeakerRecognizerCombinedThresholdJS"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v24, "floatValue");
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setTdSpeakerRecognizerCombinedThresholdJS:](v5, "setTdSpeakerRecognizerCombinedThresholdJS:");
    }
    v25 = v5;

  }
  return v5;
}

- (float)firstPassPeakScoreHS
{
  return self->_firstPassPeakScoreHS;
}

- (float)firstPassPeakScoreJS
{
  return self->_firstPassPeakScoreJS;
}

- (int)firstPassTriggerSource
{
  return self->_firstPassTriggerSource;
}

- (float)recognizerScoreHS
{
  return self->_recognizerScoreHS;
}

- (float)recognizerScoreJS
{
  return self->_recognizerScoreJS;
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

- (int)invocationTypeId
{
  return self->_invocationTypeId;
}

- (int64_t)secondsSinceEpoch
{
  return self->_secondsSinceEpoch;
}

- (float)repetitionSimilarityScore
{
  return self->_repetitionSimilarityScore;
}

- (float)tdSpeakerRecognizerCombinedScore
{
  return self->_tdSpeakerRecognizerCombinedScore;
}

- (float)keywordThresholdHS
{
  return self->_keywordThresholdHS;
}

- (float)keywordThresholdJS
{
  return self->_keywordThresholdJS;
}

- (float)tdSpeakerRecognizerCombinedThresholdHS
{
  return self->_tdSpeakerRecognizerCombinedThresholdHS;
}

- (float)tdSpeakerRecognizerCombinedThresholdJS
{
  return self->_tdSpeakerRecognizerCombinedThresholdJS;
}

@end
