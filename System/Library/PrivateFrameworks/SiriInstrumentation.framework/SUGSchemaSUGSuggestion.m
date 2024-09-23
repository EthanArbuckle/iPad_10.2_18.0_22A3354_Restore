@implementation SUGSchemaSUGSuggestion

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
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUGSchemaSUGSuggestion;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUGSchemaSUGSuggestion subscribedSignal](self, "subscribedSignal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SUGSchemaSUGSuggestion deleteSubscribedSignal](self, "deleteSubscribedSignal");
  -[SUGSchemaSUGSuggestion suppressionResult](self, "suppressionResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SUGSchemaSUGSuggestion deleteSuppressionResult](self, "deleteSuppressionResult");
  -[SUGSchemaSUGSuggestion autoCompleteSuggestionMetaData](self, "autoCompleteSuggestionMetaData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SUGSchemaSUGSuggestion deleteAutoCompleteSuggestionMetaData](self, "deleteAutoCompleteSuggestionMetaData");
  -[SUGSchemaSUGSuggestion linkId](self, "linkId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[SUGSchemaSUGSuggestion deleteLinkId](self, "deleteLinkId");

  return v5;
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (void)deleteSuggestionId
{
  -[SUGSchemaSUGSuggestion setSuggestionId:](self, "setSuggestionId:", 0);
}

- (BOOL)hasSubscribedSignal
{
  return self->_subscribedSignal != 0;
}

- (void)deleteSubscribedSignal
{
  -[SUGSchemaSUGSuggestion setSubscribedSignal:](self, "setSubscribedSignal:", 0);
}

- (void)setDeliveryVehicle:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_deliveryVehicle = a3;
}

- (BOOL)hasDeliveryVehicle
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasDeliveryVehicle:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteDeliveryVehicle
{
  -[SUGSchemaSUGSuggestion setDeliveryVehicle:](self, "setDeliveryVehicle:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setGoal:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_goal = a3;
}

- (BOOL)hasGoal
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasGoal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteGoal
{
  -[SUGSchemaSUGSuggestion setGoal:](self, "setGoal:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setFinalRank:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_finalRank = a3;
}

- (BOOL)hasFinalRank
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasFinalRank:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteFinalRank
{
  -[SUGSchemaSUGSuggestion setFinalRank:](self, "setFinalRank:", 0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setGoalSpecificScore:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_goalSpecificScore = a3;
}

- (BOOL)hasGoalSpecificScore
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasGoalSpecificScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteGoalSpecificScore
{
  -[SUGSchemaSUGSuggestion setGoalSpecificScore:](self, "setGoalSpecificScore:", 0.0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setFinalScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_finalScore = a3;
}

- (BOOL)hasFinalScore
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasFinalScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteFinalScore
{
  -[SUGSchemaSUGSuggestion setFinalScore:](self, "setFinalScore:", 0.0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setSuggestionTier:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_suggestionTier = a3;
}

- (BOOL)hasSuggestionTier
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasSuggestionTier:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteSuggestionTier
{
  -[SUGSchemaSUGSuggestion setSuggestionTier:](self, "setSuggestionTier:", 0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (BOOL)hasSuppressionResult
{
  return self->_suppressionResult != 0;
}

- (void)deleteSuppressionResult
{
  -[SUGSchemaSUGSuggestion setSuppressionResult:](self, "setSuppressionResult:", 0);
}

- (BOOL)hasLoggingActionId
{
  return self->_loggingActionId != 0;
}

- (void)deleteLoggingActionId
{
  -[SUGSchemaSUGSuggestion setLoggingActionId:](self, "setLoggingActionId:", 0);
}

- (void)setChannel:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_channel = a3;
}

- (BOOL)hasChannel
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasChannel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteChannel
{
  -[SUGSchemaSUGSuggestion setChannel:](self, "setChannel:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setChannelScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_channelScore = a3;
}

- (BOOL)hasChannelScore
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasChannelScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteChannelScore
{
  -[SUGSchemaSUGSuggestion setChannelScore:](self, "setChannelScore:", 0.0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setSmartSuppressionScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_smartSuppressionScore = a3;
}

- (BOOL)hasSmartSuppressionScore
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasSmartSuppressionScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteSmartSuppressionScore
{
  -[SUGSchemaSUGSuggestion setSmartSuppressionScore:](self, "setSmartSuppressionScore:", 0.0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setNumWordsInSuggestion:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_numWordsInSuggestion = a3;
}

- (BOOL)hasNumWordsInSuggestion
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasNumWordsInSuggestion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)deleteNumWordsInSuggestion
{
  -[SUGSchemaSUGSuggestion setNumWordsInSuggestion:](self, "setNumWordsInSuggestion:", 0);
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setNumCharactersInSuggestion:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_numCharactersInSuggestion = a3;
}

- (BOOL)hasNumCharactersInSuggestion
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasNumCharactersInSuggestion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)deleteNumCharactersInSuggestion
{
  -[SUGSchemaSUGSuggestion setNumCharactersInSuggestion:](self, "setNumCharactersInSuggestion:", 0);
  *(_WORD *)&self->_has &= ~0x400u;
}

- (BOOL)hasAutoCompleteSuggestionMetaData
{
  return self->_autoCompleteSuggestionMetaData != 0;
}

- (void)deleteAutoCompleteSuggestionMetaData
{
  -[SUGSchemaSUGSuggestion setAutoCompleteSuggestionMetaData:](self, "setAutoCompleteSuggestionMetaData:", 0);
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[SUGSchemaSUGSuggestion setLinkId:](self, "setLinkId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGSuggestionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  __int16 has;
  void *v8;
  void *v9;
  void *v10;
  __int16 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[SUGSchemaSUGSuggestion suggestionId](self, "suggestionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SUGSchemaSUGSuggestion subscribedSignal](self, "subscribedSignal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SUGSchemaSUGSuggestion subscribedSignal](self, "subscribedSignal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_29;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field();
LABEL_12:
  -[SUGSchemaSUGSuggestion suppressionResult](self, "suppressionResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SUGSchemaSUGSuggestion suppressionResult](self, "suppressionResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGSuggestion loggingActionId](self, "loggingActionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = (__int16)self->_has;
    if ((v11 & 0x80) == 0)
    {
LABEL_18:
      if ((v11 & 0x100) == 0)
        goto LABEL_19;
      goto LABEL_35;
    }
  }
  else if ((v11 & 0x80) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteDoubleField();
  v11 = (__int16)self->_has;
  if ((v11 & 0x100) == 0)
  {
LABEL_19:
    if ((v11 & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteDoubleField();
  v11 = (__int16)self->_has;
  if ((v11 & 0x200) == 0)
  {
LABEL_20:
    if ((v11 & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_21:
    PBDataWriterWriteInt32Field();
LABEL_22:
  -[SUGSchemaSUGSuggestion autoCompleteSuggestionMetaData](self, "autoCompleteSuggestionMetaData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SUGSchemaSUGSuggestion autoCompleteSuggestionMetaData](self, "autoCompleteSuggestionMetaData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SUGSchemaSUGSuggestion linkId](self, "linkId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v17;
  if (v14)
  {
    -[SUGSchemaSUGSuggestion linkId](self, "linkId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v15 = v17;
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
  $E9F9289BA528CEB819F3239A3C07F8DC has;
  unsigned int v18;
  int deliveryVehicle;
  int v20;
  int goal;
  int v22;
  unsigned int finalRank;
  int v24;
  double goalSpecificScore;
  double v26;
  int v27;
  double finalScore;
  double v29;
  int v30;
  int suggestionTier;
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
  $E9F9289BA528CEB819F3239A3C07F8DC v42;
  int v43;
  unsigned int v44;
  int channel;
  int v46;
  double channelScore;
  double v48;
  int v49;
  double smartSuppressionScore;
  double v51;
  int v52;
  int numWordsInSuggestion;
  int v54;
  int numCharactersInSuggestion;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  BOOL v66;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_74;
  -[SUGSchemaSUGSuggestion suggestionId](self, "suggestionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_73;
  -[SUGSchemaSUGSuggestion suggestionId](self, "suggestionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SUGSchemaSUGSuggestion suggestionId](self, "suggestionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_74;
  }
  else
  {

  }
  -[SUGSchemaSUGSuggestion subscribedSignal](self, "subscribedSignal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribedSignal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_73;
  -[SUGSchemaSUGSuggestion subscribedSignal](self, "subscribedSignal");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SUGSchemaSUGSuggestion subscribedSignal](self, "subscribedSignal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subscribedSignal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_74;
  }
  else
  {

  }
  has = self->_has;
  v18 = v4[64];
  if ((*(_BYTE *)&has & 1) != (v18 & 1))
    goto LABEL_74;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    deliveryVehicle = self->_deliveryVehicle;
    if (deliveryVehicle != objc_msgSend(v4, "deliveryVehicle"))
      goto LABEL_74;
    has = self->_has;
    v18 = v4[64];
  }
  v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1))
    goto LABEL_74;
  if (v20)
  {
    goal = self->_goal;
    if (goal != objc_msgSend(v4, "goal"))
      goto LABEL_74;
    has = self->_has;
    v18 = v4[64];
  }
  v22 = (*(unsigned int *)&has >> 2) & 1;
  if (v22 != ((v18 >> 2) & 1))
    goto LABEL_74;
  if (v22)
  {
    finalRank = self->_finalRank;
    if (finalRank != objc_msgSend(v4, "finalRank"))
      goto LABEL_74;
    has = self->_has;
    v18 = v4[64];
  }
  v24 = (*(unsigned int *)&has >> 3) & 1;
  if (v24 != ((v18 >> 3) & 1))
    goto LABEL_74;
  if (v24)
  {
    goalSpecificScore = self->_goalSpecificScore;
    objc_msgSend(v4, "goalSpecificScore");
    if (goalSpecificScore != v26)
      goto LABEL_74;
    has = self->_has;
    v18 = v4[64];
  }
  v27 = (*(unsigned int *)&has >> 4) & 1;
  if (v27 != ((v18 >> 4) & 1))
    goto LABEL_74;
  if (v27)
  {
    finalScore = self->_finalScore;
    objc_msgSend(v4, "finalScore");
    if (finalScore != v29)
      goto LABEL_74;
    has = self->_has;
    v18 = v4[64];
  }
  v30 = (*(unsigned int *)&has >> 5) & 1;
  if (v30 != ((v18 >> 5) & 1))
    goto LABEL_74;
  if (v30)
  {
    suggestionTier = self->_suggestionTier;
    if (suggestionTier != objc_msgSend(v4, "suggestionTier"))
      goto LABEL_74;
  }
  -[SUGSchemaSUGSuggestion suppressionResult](self, "suppressionResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suppressionResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_73;
  -[SUGSchemaSUGSuggestion suppressionResult](self, "suppressionResult");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[SUGSchemaSUGSuggestion suppressionResult](self, "suppressionResult");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suppressionResult");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_74;
  }
  else
  {

  }
  -[SUGSchemaSUGSuggestion loggingActionId](self, "loggingActionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loggingActionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_73;
  -[SUGSchemaSUGSuggestion loggingActionId](self, "loggingActionId");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[SUGSchemaSUGSuggestion loggingActionId](self, "loggingActionId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggingActionId");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_74;
  }
  else
  {

  }
  v42 = self->_has;
  v43 = (*(unsigned int *)&v42 >> 6) & 1;
  v44 = v4[64];
  if (v43 != ((v44 >> 6) & 1))
    goto LABEL_74;
  if (v43)
  {
    channel = self->_channel;
    if (channel != objc_msgSend(v4, "channel"))
      goto LABEL_74;
    v42 = self->_has;
    v44 = v4[64];
  }
  v46 = (*(unsigned int *)&v42 >> 7) & 1;
  if (v46 != ((v44 >> 7) & 1))
    goto LABEL_74;
  if (v46)
  {
    channelScore = self->_channelScore;
    objc_msgSend(v4, "channelScore");
    if (channelScore != v48)
      goto LABEL_74;
    v42 = self->_has;
    v44 = v4[64];
  }
  v49 = (*(unsigned int *)&v42 >> 8) & 1;
  if (v49 != ((v44 >> 8) & 1))
    goto LABEL_74;
  if (v49)
  {
    smartSuppressionScore = self->_smartSuppressionScore;
    objc_msgSend(v4, "smartSuppressionScore");
    if (smartSuppressionScore != v51)
      goto LABEL_74;
    v42 = self->_has;
    v44 = v4[64];
  }
  v52 = (*(unsigned int *)&v42 >> 9) & 1;
  if (v52 != ((v44 >> 9) & 1))
    goto LABEL_74;
  if (v52)
  {
    numWordsInSuggestion = self->_numWordsInSuggestion;
    if (numWordsInSuggestion != objc_msgSend(v4, "numWordsInSuggestion"))
      goto LABEL_74;
    v42 = self->_has;
    v44 = v4[64];
  }
  v54 = (*(unsigned int *)&v42 >> 10) & 1;
  if (v54 != ((v44 >> 10) & 1))
    goto LABEL_74;
  if (v54)
  {
    numCharactersInSuggestion = self->_numCharactersInSuggestion;
    if (numCharactersInSuggestion != objc_msgSend(v4, "numCharactersInSuggestion"))
      goto LABEL_74;
  }
  -[SUGSchemaSUGSuggestion autoCompleteSuggestionMetaData](self, "autoCompleteSuggestionMetaData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoCompleteSuggestionMetaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_73;
  -[SUGSchemaSUGSuggestion autoCompleteSuggestionMetaData](self, "autoCompleteSuggestionMetaData");
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    v57 = (void *)v56;
    -[SUGSchemaSUGSuggestion autoCompleteSuggestionMetaData](self, "autoCompleteSuggestionMetaData");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "autoCompleteSuggestionMetaData");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "isEqual:", v59);

    if (!v60)
      goto LABEL_74;
  }
  else
  {

  }
  -[SUGSchemaSUGSuggestion linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_73:

    goto LABEL_74;
  }
  -[SUGSchemaSUGSuggestion linkId](self, "linkId");
  v61 = objc_claimAutoreleasedReturnValue();
  if (!v61)
  {

LABEL_77:
    v66 = 1;
    goto LABEL_75;
  }
  v62 = (void *)v61;
  -[SUGSchemaSUGSuggestion linkId](self, "linkId");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v63, "isEqual:", v64);

  if ((v65 & 1) != 0)
    goto LABEL_77;
LABEL_74:
  v66 = 0;
LABEL_75:

  return v66;
}

- (unint64_t)hash
{
  __int16 has;
  double goalSpecificScore;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double finalScore;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  __int16 v17;
  uint64_t v18;
  double channelScore;
  double v20;
  long double v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  double smartSuppressionScore;
  double v26;
  long double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  NSUInteger v38;

  v38 = -[NSString hash](self->_suggestionId, "hash");
  v37 = -[SUGSchemaSUGSiriHelpSignal hash](self->_subscribedSignal, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v36 = 2654435761 * self->_deliveryVehicle;
    if ((has & 2) != 0)
    {
LABEL_3:
      v35 = 2654435761 * self->_goal;
      if ((has & 4) != 0)
        goto LABEL_4;
LABEL_11:
      v34 = 0;
      if ((has & 8) != 0)
        goto LABEL_5;
LABEL_12:
      v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v36 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v35 = 0;
  if ((has & 4) == 0)
    goto LABEL_11;
LABEL_4:
  v34 = 2654435761 * self->_finalRank;
  if ((has & 8) == 0)
    goto LABEL_12;
LABEL_5:
  goalSpecificScore = self->_goalSpecificScore;
  v5 = -goalSpecificScore;
  if (goalSpecificScore >= 0.0)
    v5 = self->_goalSpecificScore;
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
LABEL_15:
  if ((has & 0x10) != 0)
  {
    finalScore = self->_finalScore;
    v11 = -finalScore;
    if (finalScore >= 0.0)
      v11 = self->_finalScore;
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
  if ((has & 0x20) != 0)
    v14 = 2654435761 * self->_suggestionTier;
  else
    v14 = 0;
  v15 = -[SUGSchemaSUGSuppressionResult hash](self->_suppressionResult, "hash");
  v16 = -[NSString hash](self->_loggingActionId, "hash");
  v17 = (__int16)self->_has;
  if ((v17 & 0x40) != 0)
  {
    v18 = 2654435761 * self->_channel;
    if ((v17 & 0x80) != 0)
      goto LABEL_28;
LABEL_33:
    v23 = 0;
    goto LABEL_36;
  }
  v18 = 0;
  if ((v17 & 0x80) == 0)
    goto LABEL_33;
LABEL_28:
  channelScore = self->_channelScore;
  v20 = -channelScore;
  if (channelScore >= 0.0)
    v20 = self->_channelScore;
  v21 = floor(v20 + 0.5);
  v22 = (v20 - v21) * 1.84467441e19;
  v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
  if (v22 >= 0.0)
  {
    if (v22 > 0.0)
      v23 += (unint64_t)v22;
  }
  else
  {
    v23 -= (unint64_t)fabs(v22);
  }
LABEL_36:
  if ((v17 & 0x100) != 0)
  {
    smartSuppressionScore = self->_smartSuppressionScore;
    v26 = -smartSuppressionScore;
    if (smartSuppressionScore >= 0.0)
      v26 = self->_smartSuppressionScore;
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
  if ((v17 & 0x200) != 0)
  {
    v29 = 2654435761 * self->_numWordsInSuggestion;
    if ((v17 & 0x400) != 0)
      goto LABEL_46;
LABEL_48:
    v30 = 0;
    goto LABEL_49;
  }
  v29 = 0;
  if ((v17 & 0x400) == 0)
    goto LABEL_48;
LABEL_46:
  v30 = 2654435761 * self->_numCharactersInSuggestion;
LABEL_49:
  v31 = v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v23;
  v32 = v24 ^ v29 ^ v30 ^ -[SUGSchemaSUGAutoCompleteSuggestionMetaData hash](self->_autoCompleteSuggestionMetaData, "hash");
  return v31 ^ v32 ^ -[SISchemaUUID hash](self->_linkId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int16 has;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  __int16 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_autoCompleteSuggestionMetaData)
  {
    -[SUGSchemaSUGSuggestion autoCompleteSuggestionMetaData](self, "autoCompleteSuggestionMetaData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("autoCompleteSuggestionMetaData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("autoCompleteSuggestionMetaData"));

    }
  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v8 = -[SUGSchemaSUGSuggestion channel](self, "channel") - 1;
    if (v8 > 7)
      v9 = CFSTR("SUGCHANNEL_UNKNOWN");
    else
      v9 = off_1E5638280[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("channel"));
    has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[SUGSchemaSUGSuggestion channelScore](self, "channelScore");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("channelScore"));

    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_14;
      goto LABEL_40;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_13;
  }
  v16 = -[SUGSchemaSUGSuggestion deliveryVehicle](self, "deliveryVehicle") - 1;
  if (v16 > 9)
    v17 = CFSTR("SUGDELIVERYVEHICLE_UNKNOWN");
  else
    v17 = off_1E56382C0[v16];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("deliveryVehicle"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SUGSchemaSUGSuggestion finalRank](self, "finalRank"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("finalRank"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 2) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  v29 = (void *)MEMORY[0x1E0CB37E8];
  -[SUGSchemaSUGSuggestion finalScore](self, "finalScore");
  objc_msgSend(v29, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("finalScore"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_16:
    if ((has & 8) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_42:
  v31 = -[SUGSchemaSUGSuggestion goal](self, "goal") - 1;
  if (v31 > 2)
    v32 = CFSTR("SUGGOAL_UNKNOWN");
  else
    v32 = off_1E5638310[v31];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("goal"));
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_17:
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[SUGSchemaSUGSuggestion goalSpecificScore](self, "goalSpecificScore");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("goalSpecificScore"));

  }
LABEL_18:
  if (self->_linkId)
  {
    -[SUGSchemaSUGSuggestion linkId](self, "linkId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("linkId"));

    }
  }
  if (self->_loggingActionId)
  {
    -[SUGSchemaSUGSuggestion loggingActionId](self, "loggingActionId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("loggingActionId"));

  }
  v21 = (__int16)self->_has;
  if ((v21 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SUGSchemaSUGSuggestion numCharactersInSuggestion](self, "numCharactersInSuggestion"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("numCharactersInSuggestion"));

    v21 = (__int16)self->_has;
    if ((v21 & 0x200) == 0)
    {
LABEL_30:
      if ((v21 & 0x100) == 0)
        goto LABEL_32;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SUGSchemaSUGSuggestion numWordsInSuggestion](self, "numWordsInSuggestion"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("numWordsInSuggestion"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_31:
    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[SUGSchemaSUGSuggestion smartSuppressionScore](self, "smartSuppressionScore");
    objc_msgSend(v22, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("smartSuppressionScore"));

  }
LABEL_32:
  if (self->_subscribedSignal)
  {
    -[SUGSchemaSUGSuggestion subscribedSignal](self, "subscribedSignal");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("subscribedSignal"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("subscribedSignal"));

    }
  }
  if (self->_suggestionId)
  {
    -[SUGSchemaSUGSuggestion suggestionId](self, "suggestionId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("suggestionId"));

  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v36 = -[SUGSchemaSUGSuggestion suggestionTier](self, "suggestionTier") - 1;
    if (v36 > 2)
      v37 = CFSTR("SUGTIERCATEGORY_UNKNOWN");
    else
      v37 = off_1E5638328[v36];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("suggestionTier"));
  }
  if (self->_suppressionResult)
  {
    -[SUGSchemaSUGSuggestion suppressionResult](self, "suppressionResult");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("suppressionResult"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("suppressionResult"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUGSchemaSUGSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUGSchemaSUGSuggestion)initWithJSON:(id)a3
{
  void *v4;
  SUGSchemaSUGSuggestion *v5;
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
    self = -[SUGSchemaSUGSuggestion initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUGSchemaSUGSuggestion)initWithDictionary:(id)a3
{
  id v4;
  SUGSchemaSUGSuggestion *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SUGSchemaSUGSiriHelpSignal *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  SUGSchemaSUGSuppressionResult *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SUGSchemaSUGAutoCompleteSuggestionMetaData *v26;
  void *v27;
  SISchemaUUID *v28;
  SUGSchemaSUGSuggestion *v29;
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
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SUGSchemaSUGSuggestion;
  v5 = -[SUGSchemaSUGSuggestion init](&v41, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SUGSchemaSUGSuggestion setSuggestionId:](v5, "setSuggestionId:", v7);

    }
    v35 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subscribedSignal"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SUGSchemaSUGSiriHelpSignal initWithDictionary:]([SUGSchemaSUGSiriHelpSignal alloc], "initWithDictionary:", v8);
      -[SUGSchemaSUGSuggestion setSubscribedSignal:](v5, "setSubscribedSignal:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deliveryVehicle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGSuggestion setDeliveryVehicle:](v5, "setDeliveryVehicle:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("goal"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGSuggestion setGoal:](v5, "setGoal:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalRank"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGSuggestion setFinalRank:](v5, "setFinalRank:", objc_msgSend(v12, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("goalSpecificScore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "doubleValue");
      -[SUGSchemaSUGSuggestion setGoalSpecificScore:](v5, "setGoalSpecificScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("finalScore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "doubleValue");
      -[SUGSchemaSUGSuggestion setFinalScore:](v5, "setFinalScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionTier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v38 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGSuggestion setSuggestionTier:](v5, "setSuggestionTier:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suppressionResult"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v37 = (void *)v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[SUGSchemaSUGSuppressionResult initWithDictionary:]([SUGSchemaSUGSuppressionResult alloc], "initWithDictionary:", v16);
      -[SUGSchemaSUGSuggestion setSuppressionResult:](v5, "setSuppressionResult:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loggingActionId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[SUGSchemaSUGSuggestion setLoggingActionId:](v5, "setLoggingActionId:", v19);

    }
    v34 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("channel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGSuggestion setChannel:](v5, "setChannel:", objc_msgSend(v20, "intValue"));
    v33 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("channelScore"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "doubleValue");
      -[SUGSchemaSUGSuggestion setChannelScore:](v5, "setChannelScore:");
    }
    v32 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smartSuppressionScore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "doubleValue");
      -[SUGSchemaSUGSuggestion setSmartSuppressionScore:](v5, "setSmartSuppressionScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numWordsInSuggestion"), v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGSuggestion setNumWordsInSuggestion:](v5, "setNumWordsInSuggestion:", objc_msgSend(v23, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numCharactersInSuggestion"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGSuggestion setNumCharactersInSuggestion:](v5, "setNumCharactersInSuggestion:", objc_msgSend(v24, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("autoCompleteSuggestionMetaData"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[SUGSchemaSUGAutoCompleteSuggestionMetaData initWithDictionary:]([SUGSchemaSUGAutoCompleteSuggestionMetaData alloc], "initWithDictionary:", v25);
      -[SUGSchemaSUGSuggestion setAutoCompleteSuggestionMetaData:](v5, "setAutoCompleteSuggestionMetaData:", v26);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v27);
      -[SUGSchemaSUGSuggestion setLinkId:](v5, "setLinkId:", v28);

    }
    v29 = v5;

  }
  return v5;
}

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (void)setSuggestionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SUGSchemaSUGSiriHelpSignal)subscribedSignal
{
  return self->_subscribedSignal;
}

- (void)setSubscribedSignal:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedSignal, a3);
}

- (int)deliveryVehicle
{
  return self->_deliveryVehicle;
}

- (int)goal
{
  return self->_goal;
}

- (unsigned)finalRank
{
  return self->_finalRank;
}

- (double)goalSpecificScore
{
  return self->_goalSpecificScore;
}

- (double)finalScore
{
  return self->_finalScore;
}

- (int)suggestionTier
{
  return self->_suggestionTier;
}

- (SUGSchemaSUGSuppressionResult)suppressionResult
{
  return self->_suppressionResult;
}

- (void)setSuppressionResult:(id)a3
{
  objc_storeStrong((id *)&self->_suppressionResult, a3);
}

- (NSString)loggingActionId
{
  return self->_loggingActionId;
}

- (void)setLoggingActionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int)channel
{
  return self->_channel;
}

- (double)channelScore
{
  return self->_channelScore;
}

- (double)smartSuppressionScore
{
  return self->_smartSuppressionScore;
}

- (int)numWordsInSuggestion
{
  return self->_numWordsInSuggestion;
}

- (int)numCharactersInSuggestion
{
  return self->_numCharactersInSuggestion;
}

- (SUGSchemaSUGAutoCompleteSuggestionMetaData)autoCompleteSuggestionMetaData
{
  return self->_autoCompleteSuggestionMetaData;
}

- (void)setAutoCompleteSuggestionMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_autoCompleteSuggestionMetaData, a3);
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (void)setHasSuggestionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasSubscribedSignal:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasSuppressionResult:(BOOL)a3
{
  self->_hasSuggestionId = a3;
}

- (void)setHasLoggingActionId:(BOOL)a3
{
  self->_hasSubscribedSignal = a3;
}

- (void)setHasAutoCompleteSuggestionMetaData:(BOOL)a3
{
  self->_hasSuppressionResult = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLoggingActionId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_autoCompleteSuggestionMetaData, 0);
  objc_storeStrong((id *)&self->_loggingActionId, 0);
  objc_storeStrong((id *)&self->_suppressionResult, 0);
  objc_storeStrong((id *)&self->_subscribedSignal, 0);
  objc_storeStrong((id *)&self->_suggestionId, 0);
}

@end
