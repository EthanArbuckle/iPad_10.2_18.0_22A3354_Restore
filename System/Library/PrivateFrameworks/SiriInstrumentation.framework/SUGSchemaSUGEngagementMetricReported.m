@implementation SUGSchemaSUGEngagementMetricReported

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (void)deleteSuggestionId
{
  -[SUGSchemaSUGEngagementMetricReported setSuggestionId:](self, "setSuggestionId:", 0);
}

- (BOOL)hasLoggingActionId
{
  return self->_loggingActionId != 0;
}

- (void)deleteLoggingActionId
{
  -[SUGSchemaSUGEngagementMetricReported setLoggingActionId:](self, "setLoggingActionId:", 0);
}

- (void)setNumberSuggestionShownBefore:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberSuggestionShownBefore = a3;
}

- (BOOL)hasNumberSuggestionShownBefore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumberSuggestionShownBefore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumberSuggestionShownBefore
{
  -[SUGSchemaSUGEngagementMetricReported setNumberSuggestionShownBefore:](self, "setNumberSuggestionShownBefore:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setHasConversion:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hasConversion = a3;
}

- (BOOL)hasHasConversion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasHasConversion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteHasConversion
{
  -[SUGSchemaSUGEngagementMetricReported setHasConversion:](self, "setHasConversion:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setSecondsToConversion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_secondsToConversion = a3;
}

- (BOOL)hasSecondsToConversion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSecondsToConversion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteSecondsToConversion
{
  -[SUGSchemaSUGEngagementMetricReported setSecondsToConversion:](self, "setSecondsToConversion:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setNumberOfActionsBefore:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numberOfActionsBefore = a3;
}

- (BOOL)hasNumberOfActionsBefore
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasNumberOfActionsBefore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteNumberOfActionsBefore
{
  -[SUGSchemaSUGEngagementMetricReported setNumberOfActionsBefore:](self, "setNumberOfActionsBefore:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setNumberOfActionsAfter:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numberOfActionsAfter = a3;
}

- (BOOL)hasNumberOfActionsAfter
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasNumberOfActionsAfter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteNumberOfActionsAfter
{
  -[SUGSchemaSUGEngagementMetricReported setNumberOfActionsAfter:](self, "setNumberOfActionsAfter:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setDaysBucketType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_daysBucketType = a3;
}

- (BOOL)hasDaysBucketType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasDaysBucketType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteDaysBucketType
{
  -[SUGSchemaSUGEngagementMetricReported setDaysBucketType:](self, "setDaysBucketType:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setConversionMetricType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_conversionMetricType = a3;
}

- (BOOL)hasConversionMetricType
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasConversionMetricType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteConversionMetricType
{
  -[SUGSchemaSUGEngagementMetricReported setConversionMetricType:](self, "setConversionMetricType:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGEngagementMetricReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  id v8;

  v8 = a3;
  -[SUGSchemaSUGEngagementMetricReported suggestionId](self, "suggestionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[SUGSchemaSUGEngagementMetricReported loggingActionId](self, "loggingActionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  v7 = v8;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = v8;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
LABEL_19:
    PBDataWriterWriteInt32Field();
    v7 = v8;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  v7 = v8;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_19;
LABEL_11:
  if ((has & 0x40) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }
LABEL_13:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
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
  BOOL v17;
  $4E797B98B86DA37B362E9A0B78567BD3 has;
  unsigned int v20;
  unsigned int numberSuggestionShownBefore;
  int v22;
  int hasConversion;
  int v24;
  unsigned int secondsToConversion;
  int v26;
  unsigned int numberOfActionsBefore;
  int v28;
  unsigned int numberOfActionsAfter;
  int v30;
  int daysBucketType;
  int v32;
  int conversionMetricType;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[SUGSchemaSUGEngagementMetricReported suggestionId](self, "suggestionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[SUGSchemaSUGEngagementMetricReported suggestionId](self, "suggestionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SUGSchemaSUGEngagementMetricReported suggestionId](self, "suggestionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[SUGSchemaSUGEngagementMetricReported loggingActionId](self, "loggingActionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loggingActionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[SUGSchemaSUGEngagementMetricReported loggingActionId](self, "loggingActionId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SUGSchemaSUGEngagementMetricReported loggingActionId](self, "loggingActionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggingActionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  has = self->_has;
  v20 = v4[52];
  if ((*(_BYTE *)&has & 1) == (v20 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      numberSuggestionShownBefore = self->_numberSuggestionShownBefore;
      if (numberSuggestionShownBefore != objc_msgSend(v4, "numberSuggestionShownBefore"))
        goto LABEL_12;
      has = self->_has;
      v20 = v4[52];
    }
    v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (v22)
      {
        hasConversion = self->_hasConversion;
        if (hasConversion != objc_msgSend(v4, "hasConversion"))
          goto LABEL_12;
        has = self->_has;
        v20 = v4[52];
      }
      v24 = (*(unsigned int *)&has >> 2) & 1;
      if (v24 == ((v20 >> 2) & 1))
      {
        if (v24)
        {
          secondsToConversion = self->_secondsToConversion;
          if (secondsToConversion != objc_msgSend(v4, "secondsToConversion"))
            goto LABEL_12;
          has = self->_has;
          v20 = v4[52];
        }
        v26 = (*(unsigned int *)&has >> 3) & 1;
        if (v26 == ((v20 >> 3) & 1))
        {
          if (v26)
          {
            numberOfActionsBefore = self->_numberOfActionsBefore;
            if (numberOfActionsBefore != objc_msgSend(v4, "numberOfActionsBefore"))
              goto LABEL_12;
            has = self->_has;
            v20 = v4[52];
          }
          v28 = (*(unsigned int *)&has >> 4) & 1;
          if (v28 == ((v20 >> 4) & 1))
          {
            if (v28)
            {
              numberOfActionsAfter = self->_numberOfActionsAfter;
              if (numberOfActionsAfter != objc_msgSend(v4, "numberOfActionsAfter"))
                goto LABEL_12;
              has = self->_has;
              v20 = v4[52];
            }
            v30 = (*(unsigned int *)&has >> 5) & 1;
            if (v30 == ((v20 >> 5) & 1))
            {
              if (v30)
              {
                daysBucketType = self->_daysBucketType;
                if (daysBucketType != objc_msgSend(v4, "daysBucketType"))
                  goto LABEL_12;
                has = self->_has;
                v20 = v4[52];
              }
              v32 = (*(unsigned int *)&has >> 6) & 1;
              if (v32 == ((v20 >> 6) & 1))
              {
                if (!v32
                  || (conversionMetricType = self->_conversionMetricType,
                      conversionMetricType == objc_msgSend(v4, "conversionMetricType")))
                {
                  v17 = 1;
                  goto LABEL_13;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_suggestionId, "hash");
  v4 = -[NSString hash](self->_loggingActionId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_numberSuggestionShownBefore;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_hasConversion;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_secondsToConversion;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_numberOfActionsBefore;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v9 = 2654435761 * self->_numberOfActionsAfter;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_13:
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v10 = 2654435761 * self->_daysBucketType;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v11 = 2654435761 * self->_conversionMetricType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v5 = -[SUGSchemaSUGEngagementMetricReported conversionMetricType](self, "conversionMetricType");
    v6 = CFSTR("SUGCONVERSIONMETRICTYPE_UNKNOWN");
    if (v5 == 1)
      v6 = CFSTR("SUGCONVERSIONMETRICTYPE_CONVERTED");
    if (v5 == 2)
      v7 = CFSTR("SUGCONVERSIONMETRICTYPE_NOT_CONVERTED");
    else
      v7 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("conversionMetricType"));
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v8 = -[SUGSchemaSUGEngagementMetricReported daysBucketType](self, "daysBucketType") - 1;
    if (v8 > 3)
      v9 = CFSTR("SUGENGAGEMENTMETRICDAYSBUCKET_UNKNOWN");
    else
      v9 = off_1E563BBF0[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("daysBucketType"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SUGSchemaSUGEngagementMetricReported hasConversion](self, "hasConversion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("hasConversion"));

  }
  if (self->_loggingActionId)
  {
    -[SUGSchemaSUGEngagementMetricReported loggingActionId](self, "loggingActionId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("loggingActionId"));

  }
  v13 = (char)self->_has;
  if ((v13 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SUGSchemaSUGEngagementMetricReported numberOfActionsAfter](self, "numberOfActionsAfter"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("numberOfActionsAfter"));

    v13 = (char)self->_has;
    if ((v13 & 8) == 0)
    {
LABEL_19:
      if ((v13 & 1) == 0)
        goto LABEL_20;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SUGSchemaSUGEngagementMetricReported numberOfActionsBefore](self, "numberOfActionsBefore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("numberOfActionsBefore"));

  v13 = (char)self->_has;
  if ((v13 & 1) == 0)
  {
LABEL_20:
    if ((v13 & 4) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SUGSchemaSUGEngagementMetricReported numberSuggestionShownBefore](self, "numberSuggestionShownBefore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("numberSuggestionShownBefore"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SUGSchemaSUGEngagementMetricReported secondsToConversion](self, "secondsToConversion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("secondsToConversion"));

  }
LABEL_22:
  if (self->_suggestionId)
  {
    -[SUGSchemaSUGEngagementMetricReported suggestionId](self, "suggestionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("suggestionId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUGSchemaSUGEngagementMetricReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUGSchemaSUGEngagementMetricReported)initWithJSON:(id)a3
{
  void *v4;
  SUGSchemaSUGEngagementMetricReported *v5;
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
    self = -[SUGSchemaSUGEngagementMetricReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUGSchemaSUGEngagementMetricReported)initWithDictionary:(id)a3
{
  id v4;
  SUGSchemaSUGEngagementMetricReported *v5;
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
  SUGSchemaSUGEngagementMetricReported *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SUGSchemaSUGEngagementMetricReported;
  v5 = -[SUGSchemaSUGEngagementMetricReported init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SUGSchemaSUGEngagementMetricReported setSuggestionId:](v5, "setSuggestionId:", v7);

    }
    v20 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loggingActionId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[SUGSchemaSUGEngagementMetricReported setLoggingActionId:](v5, "setLoggingActionId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberSuggestionShownBefore"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGEngagementMetricReported setNumberSuggestionShownBefore:](v5, "setNumberSuggestionShownBefore:", objc_msgSend(v10, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasConversion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGEngagementMetricReported setHasConversion:](v5, "setHasConversion:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondsToConversion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGEngagementMetricReported setSecondsToConversion:](v5, "setSecondsToConversion:", objc_msgSend(v12, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfActionsBefore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGEngagementMetricReported setNumberOfActionsBefore:](v5, "setNumberOfActionsBefore:", objc_msgSend(v13, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfActionsAfter"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGEngagementMetricReported setNumberOfActionsAfter:](v5, "setNumberOfActionsAfter:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("daysBucketType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGEngagementMetricReported setDaysBucketType:](v5, "setDaysBucketType:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conversionMetricType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGEngagementMetricReported setConversionMetricType:](v5, "setConversionMetricType:", objc_msgSend(v16, "intValue"));
    v17 = v5;

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

- (NSString)loggingActionId
{
  return self->_loggingActionId;
}

- (void)setLoggingActionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)numberSuggestionShownBefore
{
  return self->_numberSuggestionShownBefore;
}

- (BOOL)hasConversion
{
  return self->_hasConversion;
}

- (unsigned)secondsToConversion
{
  return self->_secondsToConversion;
}

- (unsigned)numberOfActionsBefore
{
  return self->_numberOfActionsBefore;
}

- (unsigned)numberOfActionsAfter
{
  return self->_numberOfActionsAfter;
}

- (int)daysBucketType
{
  return self->_daysBucketType;
}

- (int)conversionMetricType
{
  return self->_conversionMetricType;
}

- (void)setHasSuggestionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasLoggingActionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingActionId, 0);
  objc_storeStrong((id *)&self->_suggestionId, 0);
}

@end
