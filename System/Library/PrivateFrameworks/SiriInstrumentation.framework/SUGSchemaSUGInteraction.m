@implementation SUGSchemaSUGInteraction

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasRelatedSuggestionId
{
  return self->_relatedSuggestionId != 0;
}

- (void)deleteRelatedSuggestionId
{
  -[SUGSchemaSUGInteraction setRelatedSuggestionId:](self, "setRelatedSuggestionId:", 0);
}

- (void)setRelatedSuggestionEventSequenceNum:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_relatedSuggestionEventSequenceNum = a3;
}

- (BOOL)hasRelatedSuggestionEventSequenceNum
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRelatedSuggestionEventSequenceNum:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteRelatedSuggestionEventSequenceNum
{
  -[SUGSchemaSUGInteraction setRelatedSuggestionEventSequenceNum:](self, "setRelatedSuggestionEventSequenceNum:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setRelatedSuggestionsShownCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_relatedSuggestionsShownCount = a3;
}

- (BOOL)hasRelatedSuggestionsShownCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRelatedSuggestionsShownCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteRelatedSuggestionsShownCount
{
  -[SUGSchemaSUGInteraction setRelatedSuggestionsShownCount:](self, "setRelatedSuggestionsShownCount:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setHasOccurredWithinHour:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_hasOccurredWithinHour = a3;
}

- (BOOL)hasHasOccurredWithinHour
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasHasOccurredWithinHour:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteHasOccurredWithinHour
{
  -[SUGSchemaSUGInteraction setHasOccurredWithinHour:](self, "setHasOccurredWithinHour:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setTriggerType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_triggerType = a3;
}

- (BOOL)hasTriggerType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasTriggerType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteTriggerType
{
  -[SUGSchemaSUGInteraction setTriggerType:](self, "setTriggerType:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGInteractionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  id v7;

  v7 = a3;
  -[SUGSchemaSUGInteraction relatedSuggestionId](self, "relatedSuggestionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) == 0)
  {
    if ((has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteBOOLField();
    v6 = v7;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteUint32Field();
  v6 = v7;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }
LABEL_9:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $75835F0F9B5E13ACB81079993A3297F6 has;
  unsigned int v14;
  unsigned int relatedSuggestionEventSequenceNum;
  int v16;
  unsigned int relatedSuggestionsShownCount;
  int v18;
  int hasOccurredWithinHour;
  int v20;
  int triggerType;
  BOOL v22;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[SUGSchemaSUGInteraction relatedSuggestionId](self, "relatedSuggestionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relatedSuggestionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  -[SUGSchemaSUGInteraction relatedSuggestionId](self, "relatedSuggestionId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SUGSchemaSUGInteraction relatedSuggestionId](self, "relatedSuggestionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relatedSuggestionId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_24;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    relatedSuggestionEventSequenceNum = self->_relatedSuggestionEventSequenceNum;
    if (relatedSuggestionEventSequenceNum != objc_msgSend(v4, "relatedSuggestionEventSequenceNum"))
      goto LABEL_24;
    has = self->_has;
    v14 = v4[32];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_24;
  if (v16)
  {
    relatedSuggestionsShownCount = self->_relatedSuggestionsShownCount;
    if (relatedSuggestionsShownCount != objc_msgSend(v4, "relatedSuggestionsShownCount"))
      goto LABEL_24;
    has = self->_has;
    v14 = v4[32];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_24;
  if (v18)
  {
    hasOccurredWithinHour = self->_hasOccurredWithinHour;
    if (hasOccurredWithinHour == objc_msgSend(v4, "hasOccurredWithinHour"))
    {
      has = self->_has;
      v14 = v4[32];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1))
    goto LABEL_24;
  if (v20)
  {
    triggerType = self->_triggerType;
    if (triggerType != objc_msgSend(v4, "triggerType"))
      goto LABEL_24;
  }
  v22 = 1;
LABEL_25:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_relatedSuggestionId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_relatedSuggestionEventSequenceNum;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_relatedSuggestionsShownCount;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_hasOccurredWithinHour;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_triggerType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  const __CFString *v12;
  const __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SUGSchemaSUGInteraction hasOccurredWithinHour](self, "hasOccurredWithinHour"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("hasOccurredWithinHour"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SUGSchemaSUGInteraction relatedSuggestionEventSequenceNum](self, "relatedSuggestionEventSequenceNum"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("relatedSuggestionEventSequenceNum"));

  }
  if (self->_relatedSuggestionId)
  {
    -[SUGSchemaSUGInteraction relatedSuggestionId](self, "relatedSuggestionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("relatedSuggestionId"));

  }
  v9 = (char)self->_has;
  if ((v9 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SUGSchemaSUGInteraction relatedSuggestionsShownCount](self, "relatedSuggestionsShownCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("relatedSuggestionsShownCount"));

    v9 = (char)self->_has;
  }
  if ((v9 & 8) != 0)
  {
    v11 = -[SUGSchemaSUGInteraction triggerType](self, "triggerType");
    v12 = CFSTR("SUGTRIGGERTYPE_UNKNOWN");
    if (v11 == 1)
      v12 = CFSTR("SUGTRIGGERTYPE_HS");
    if (v11 == 2)
      v13 = CFSTR("SUGTRIGGERTYPE_BUTTON");
    else
      v13 = v12;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("triggerType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUGSchemaSUGInteraction dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUGSchemaSUGInteraction)initWithJSON:(id)a3
{
  void *v4;
  SUGSchemaSUGInteraction *v5;
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
    self = -[SUGSchemaSUGInteraction initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUGSchemaSUGInteraction)initWithDictionary:(id)a3
{
  id v4;
  SUGSchemaSUGInteraction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SUGSchemaSUGInteraction *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUGSchemaSUGInteraction;
  v5 = -[SUGSchemaSUGInteraction init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relatedSuggestionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[SUGSchemaSUGInteraction setRelatedSuggestionId:](v5, "setRelatedSuggestionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relatedSuggestionEventSequenceNum"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGInteraction setRelatedSuggestionEventSequenceNum:](v5, "setRelatedSuggestionEventSequenceNum:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relatedSuggestionsShownCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGInteraction setRelatedSuggestionsShownCount:](v5, "setRelatedSuggestionsShownCount:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasOccurredWithinHour"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGInteraction setHasOccurredWithinHour:](v5, "setHasOccurredWithinHour:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGInteraction setTriggerType:](v5, "setTriggerType:", objc_msgSend(v11, "intValue"));
    v12 = v5;

  }
  return v5;
}

- (NSString)relatedSuggestionId
{
  return self->_relatedSuggestionId;
}

- (void)setRelatedSuggestionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unsigned)relatedSuggestionEventSequenceNum
{
  return self->_relatedSuggestionEventSequenceNum;
}

- (unsigned)relatedSuggestionsShownCount
{
  return self->_relatedSuggestionsShownCount;
}

- (BOOL)hasOccurredWithinHour
{
  return self->_hasOccurredWithinHour;
}

- (int)triggerType
{
  return self->_triggerType;
}

- (void)setHasRelatedSuggestionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedSuggestionId, 0);
}

@end
