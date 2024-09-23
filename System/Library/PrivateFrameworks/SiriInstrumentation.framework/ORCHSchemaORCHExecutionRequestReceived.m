@implementation ORCHSchemaORCHExecutionRequestReceived

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setPreExecutionDecision:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_preExecutionDecision = a3;
}

- (BOOL)hasPreExecutionDecision
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPreExecutionDecision:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePreExecutionDecision
{
  -[ORCHSchemaORCHExecutionRequestReceived setPreExecutionDecision:](self, "setPreExecutionDecision:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setExecutionForRSKE:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_executionForRSKE = a3;
}

- (BOOL)hasExecutionForRSKE
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasExecutionForRSKE:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteExecutionForRSKE
{
  -[ORCHSchemaORCHExecutionRequestReceived setExecutionForRSKE:](self, "setExecutionForRSKE:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setCommandSource:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_commandSource = a3;
}

- (BOOL)hasCommandSource
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasCommandSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteCommandSource
{
  -[ORCHSchemaORCHExecutionRequestReceived setCommandSource:](self, "setCommandSource:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHExecutionRequestReceivedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $B28626E3F0729D227D6F79B851EC94A2 has;
  unsigned int v6;
  int preExecutionDecision;
  int v8;
  int executionForRSKE;
  int v10;
  int commandSource;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[20];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    preExecutionDecision = self->_preExecutionDecision;
    if (preExecutionDecision != objc_msgSend(v4, "preExecutionDecision"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[20];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    executionForRSKE = self->_executionForRSKE;
    if (executionForRSKE == objc_msgSend(v4, "executionForRSKE"))
    {
      has = self->_has;
      v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_14;
  if (v10)
  {
    commandSource = self->_commandSource;
    if (commandSource != objc_msgSend(v4, "commandSource"))
      goto LABEL_14;
  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_preExecutionDecision;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_executionForRSKE;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_commandSource;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ORCHSchemaORCHExecutionRequestReceived executionForRSKE](self, "executionForRSKE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("executionForRSKE"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_14;
    goto LABEL_10;
  }
  v5 = -[ORCHSchemaORCHExecutionRequestReceived commandSource](self, "commandSource") - 1;
  if (v5 > 2)
    v6 = CFSTR("ORCHRSKESOURCE_UNKNOWN");
  else
    v6 = off_1E5632710[v5];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("commandSource"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_3:
  if ((has & 1) == 0)
    goto LABEL_14;
LABEL_10:
  v8 = -[ORCHSchemaORCHExecutionRequestReceived preExecutionDecision](self, "preExecutionDecision") - 1;
  if (v8 > 9)
    v9 = CFSTR("ORCHPREEXECUTIONDECISION_UNKNOWN");
  else
    v9 = off_1E5632728[v8];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("preExecutionDecision"));
LABEL_14:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHExecutionRequestReceived dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHExecutionRequestReceived)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHExecutionRequestReceived *v5;
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
    self = -[ORCHSchemaORCHExecutionRequestReceived initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHExecutionRequestReceived)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHExecutionRequestReceived *v5;
  void *v6;
  void *v7;
  void *v8;
  ORCHSchemaORCHExecutionRequestReceived *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ORCHSchemaORCHExecutionRequestReceived;
  v5 = -[ORCHSchemaORCHExecutionRequestReceived init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preExecutionDecision"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHExecutionRequestReceived setPreExecutionDecision:](v5, "setPreExecutionDecision:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executionForRSKE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHExecutionRequestReceived setExecutionForRSKE:](v5, "setExecutionForRSKE:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHExecutionRequestReceived setCommandSource:](v5, "setCommandSource:", objc_msgSend(v8, "intValue"));
    v9 = v5;

  }
  return v5;
}

- (int)preExecutionDecision
{
  return self->_preExecutionDecision;
}

- (BOOL)executionForRSKE
{
  return self->_executionForRSKE;
}

- (int)commandSource
{
  return self->_commandSource;
}

@end
