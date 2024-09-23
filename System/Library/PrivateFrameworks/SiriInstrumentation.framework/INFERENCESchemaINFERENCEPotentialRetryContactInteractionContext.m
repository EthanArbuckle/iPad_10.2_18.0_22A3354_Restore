@implementation INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setIsExactMatchPriorSiriContactGivenName:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isExactMatchPriorSiriContactGivenName = a3;
}

- (BOOL)hasIsExactMatchPriorSiriContactGivenName
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsExactMatchPriorSiriContactGivenName:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIsExactMatchPriorSiriContactGivenName
{
  -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactGivenName:](self, "setIsExactMatchPriorSiriContactGivenName:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsExactMatchPriorSiriContactFamilyName:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isExactMatchPriorSiriContactFamilyName = a3;
}

- (BOOL)hasIsExactMatchPriorSiriContactFamilyName
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsExactMatchPriorSiriContactFamilyName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsExactMatchPriorSiriContactFamilyName
{
  -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactFamilyName:](self, "setIsExactMatchPriorSiriContactFamilyName:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setIsExactMatchPriorSiriContactDisplayName:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isExactMatchPriorSiriContactDisplayName = a3;
}

- (BOOL)hasIsExactMatchPriorSiriContactDisplayName
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsExactMatchPriorSiriContactDisplayName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsExactMatchPriorSiriContactDisplayName
{
  -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactDisplayName:](self, "setIsExactMatchPriorSiriContactDisplayName:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsExactMatchPriorSiriContactId:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isExactMatchPriorSiriContactId = a3;
}

- (BOOL)hasIsExactMatchPriorSiriContactId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsExactMatchPriorSiriContactId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsExactMatchPriorSiriContactId
{
  -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactId:](self, "setIsExactMatchPriorSiriContactId:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setIsExactMatchPriorSiriContactHandleValue:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isExactMatchPriorSiriContactHandleValue = a3;
}

- (BOOL)hasIsExactMatchPriorSiriContactHandleValue
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasIsExactMatchPriorSiriContactHandleValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteIsExactMatchPriorSiriContactHandleValue
{
  -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactHandleValue:](self, "setIsExactMatchPriorSiriContactHandleValue:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setInteractionDurationInSecBucket:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_interactionDurationInSecBucket = a3;
}

- (BOOL)hasInteractionDurationInSecBucket
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasInteractionDurationInSecBucket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteInteractionDurationInSecBucket
{
  -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setInteractionDurationInSecBucket:](self, "setInteractionDurationInSecBucket:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setPotentialRetryIntervalInSecBucket:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_potentialRetryIntervalInSecBucket = a3;
}

- (BOOL)hasPotentialRetryIntervalInSecBucket
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasPotentialRetryIntervalInSecBucket:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deletePotentialRetryIntervalInSecBucket
{
  -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setPotentialRetryIntervalInSecBucket:](self, "setPotentialRetryIntervalInSecBucket:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEPotentialRetryContactInteractionContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteUint32Field();
LABEL_9:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $1DDC0A022069D6190EEA24EBC7F6B3B0 has;
  unsigned int v6;
  int isExactMatchPriorSiriContactGivenName;
  int v8;
  int isExactMatchPriorSiriContactFamilyName;
  int v10;
  int isExactMatchPriorSiriContactDisplayName;
  int v12;
  int isExactMatchPriorSiriContactId;
  int v14;
  int isExactMatchPriorSiriContactHandleValue;
  int v16;
  unsigned int interactionDurationInSecBucket;
  int v18;
  unsigned int potentialRetryIntervalInSecBucket;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    isExactMatchPriorSiriContactGivenName = self->_isExactMatchPriorSiriContactGivenName;
    if (isExactMatchPriorSiriContactGivenName != objc_msgSend(v4, "isExactMatchPriorSiriContactGivenName"))goto LABEL_30;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_30;
  if (v8)
  {
    isExactMatchPriorSiriContactFamilyName = self->_isExactMatchPriorSiriContactFamilyName;
    if (isExactMatchPriorSiriContactFamilyName != objc_msgSend(v4, "isExactMatchPriorSiriContactFamilyName"))goto LABEL_30;
    has = self->_has;
    v6 = v4[24];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_30;
  if (v10)
  {
    isExactMatchPriorSiriContactDisplayName = self->_isExactMatchPriorSiriContactDisplayName;
    if (isExactMatchPriorSiriContactDisplayName != objc_msgSend(v4, "isExactMatchPriorSiriContactDisplayName"))goto LABEL_30;
    has = self->_has;
    v6 = v4[24];
  }
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_30;
  if (v12)
  {
    isExactMatchPriorSiriContactId = self->_isExactMatchPriorSiriContactId;
    if (isExactMatchPriorSiriContactId != objc_msgSend(v4, "isExactMatchPriorSiriContactId"))
      goto LABEL_30;
    has = self->_has;
    v6 = v4[24];
  }
  v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1))
    goto LABEL_30;
  if (v14)
  {
    isExactMatchPriorSiriContactHandleValue = self->_isExactMatchPriorSiriContactHandleValue;
    if (isExactMatchPriorSiriContactHandleValue != objc_msgSend(v4, "isExactMatchPriorSiriContactHandleValue"))goto LABEL_30;
    has = self->_has;
    v6 = v4[24];
  }
  v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1))
    goto LABEL_30;
  if (v16)
  {
    interactionDurationInSecBucket = self->_interactionDurationInSecBucket;
    if (interactionDurationInSecBucket == objc_msgSend(v4, "interactionDurationInSecBucket"))
    {
      has = self->_has;
      v6 = v4[24];
      goto LABEL_26;
    }
LABEL_30:
    v20 = 0;
    goto LABEL_31;
  }
LABEL_26:
  v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1))
    goto LABEL_30;
  if (v18)
  {
    potentialRetryIntervalInSecBucket = self->_potentialRetryIntervalInSecBucket;
    if (potentialRetryIntervalInSecBucket != objc_msgSend(v4, "potentialRetryIntervalInSecBucket"))
      goto LABEL_30;
  }
  v20 = 1;
LABEL_31:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_isExactMatchPriorSiriContactGivenName;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_isExactMatchPriorSiriContactFamilyName;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_isExactMatchPriorSiriContactDisplayName;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_isExactMatchPriorSiriContactId;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_isExactMatchPriorSiriContactHandleValue;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_interactionDurationInSecBucket;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_potentialRetryIntervalInSecBucket;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext interactionDurationInSecBucket](self, "interactionDurationInSecBucket"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("interactionDurationInSecBucket"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext isExactMatchPriorSiriContactDisplayName](self, "isExactMatchPriorSiriContactDisplayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isExactMatchPriorSiriContactDisplayName"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext isExactMatchPriorSiriContactFamilyName](self, "isExactMatchPriorSiriContactFamilyName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isExactMatchPriorSiriContactFamilyName"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext isExactMatchPriorSiriContactGivenName](self, "isExactMatchPriorSiriContactGivenName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isExactMatchPriorSiriContactGivenName"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext isExactMatchPriorSiriContactId](self, "isExactMatchPriorSiriContactId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isExactMatchPriorSiriContactId"));

    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext isExactMatchPriorSiriContactHandleValue](self, "isExactMatchPriorSiriContactHandleValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isExactMatchPriorSiriContactHandleValue"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext potentialRetryIntervalInSecBucket](self, "potentialRetryIntervalInSecBucket"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("potentialRetryIntervalInSecBucket"));

  }
LABEL_9:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext *v5;
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
    self = -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext;
  v5 = -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isExactMatchPriorSiriContactGivenName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactGivenName:](v5, "setIsExactMatchPriorSiriContactGivenName:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isExactMatchPriorSiriContactFamilyName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactFamilyName:](v5, "setIsExactMatchPriorSiriContactFamilyName:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isExactMatchPriorSiriContactDisplayName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactDisplayName:](v5, "setIsExactMatchPriorSiriContactDisplayName:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isExactMatchPriorSiriContactId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactId:](v5, "setIsExactMatchPriorSiriContactId:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isExactMatchPriorSiriContactHandleValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setIsExactMatchPriorSiriContactHandleValue:](v5, "setIsExactMatchPriorSiriContactHandleValue:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interactionDurationInSecBucket"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setInteractionDurationInSecBucket:](v5, "setInteractionDurationInSecBucket:", objc_msgSend(v11, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("potentialRetryIntervalInSecBucket"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCEPotentialRetryContactInteractionContext setPotentialRetryIntervalInSecBucket:](v5, "setPotentialRetryIntervalInSecBucket:", objc_msgSend(v12, "unsignedIntValue"));
    v13 = v5;

  }
  return v5;
}

- (BOOL)isExactMatchPriorSiriContactGivenName
{
  return self->_isExactMatchPriorSiriContactGivenName;
}

- (BOOL)isExactMatchPriorSiriContactFamilyName
{
  return self->_isExactMatchPriorSiriContactFamilyName;
}

- (BOOL)isExactMatchPriorSiriContactDisplayName
{
  return self->_isExactMatchPriorSiriContactDisplayName;
}

- (BOOL)isExactMatchPriorSiriContactId
{
  return self->_isExactMatchPriorSiriContactId;
}

- (BOOL)isExactMatchPriorSiriContactHandleValue
{
  return self->_isExactMatchPriorSiriContactHandleValue;
}

- (unsigned)interactionDurationInSecBucket
{
  return self->_interactionDurationInSecBucket;
}

- (unsigned)potentialRetryIntervalInSecBucket
{
  return self->_potentialRetryIntervalInSecBucket;
}

@end
