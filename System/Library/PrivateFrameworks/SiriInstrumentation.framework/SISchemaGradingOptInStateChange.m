@implementation SISchemaGradingOptInStateChange

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)qualifiedMessageName
{
  return CFSTR("com.apple.aiml.siri.common.GradingOptInStateChange");
}

- (void)setPrevOptInState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_prevOptInState = a3;
}

- (BOOL)hasPrevOptInState
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasPrevOptInState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deletePrevOptInState
{
  -[SISchemaGradingOptInStateChange setPrevOptInState:](self, "setPrevOptInState:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNewOptInState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_newOptInState = a3;
}

- (BOOL)hasNewOptInState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNewOptInState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNewOptInState
{
  -[SISchemaGradingOptInStateChange setNewOptInState:](self, "setNewOptInState:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_source = a3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteSource
{
  -[SISchemaGradingOptInStateChange setSource:](self, "setSource:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (void)deleteReason
{
  -[SISchemaGradingOptInStateChange setReason:](self, "setReason:", 0);
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteSystemBuild
{
  -[SISchemaGradingOptInStateChange setSystemBuild:](self, "setSystemBuild:", 0);
}

- (void)setEpochEventTimestampInSeconds:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_epochEventTimestampInSeconds = a3;
}

- (BOOL)hasEpochEventTimestampInSeconds
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasEpochEventTimestampInSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteEpochEventTimestampInSeconds
{
  -[SISchemaGradingOptInStateChange setEpochEventTimestampInSeconds:](self, "setEpochEventTimestampInSeconds:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaGradingOptInStateChangeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  -[SISchemaGradingOptInStateChange reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[SISchemaGradingOptInStateChange systemBuild](self, "systemBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteUint64Field();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $7B07D830EE19D6A3F3B9660BBAA9E966 has;
  unsigned int v6;
  int prevOptInState;
  int v8;
  int newOptInState;
  int v10;
  int source;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  int v26;
  unint64_t epochEventTimestampInSeconds;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  has = self->_has;
  v6 = v4[48];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_23;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    prevOptInState = self->_prevOptInState;
    if (prevOptInState != objc_msgSend(v4, "prevOptInState"))
      goto LABEL_23;
    has = self->_has;
    v6 = v4[48];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      newOptInState = self->_newOptInState;
      if (newOptInState != objc_msgSend(v4, "newOptInState"))
        goto LABEL_23;
      has = self->_has;
      v6 = v4[48];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 != ((v6 >> 2) & 1))
      goto LABEL_23;
    if (v10)
    {
      source = self->_source;
      if (source != objc_msgSend(v4, "source"))
        goto LABEL_23;
    }
    -[SISchemaGradingOptInStateChange reason](self, "reason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 == 0) == (v13 != 0))
      goto LABEL_22;
    -[SISchemaGradingOptInStateChange reason](self, "reason");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[SISchemaGradingOptInStateChange reason](self, "reason");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reason");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_23;
    }
    else
    {

    }
    -[SISchemaGradingOptInStateChange systemBuild](self, "systemBuild");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemBuild");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v12 == 0) == (v13 != 0))
    {
LABEL_22:

      goto LABEL_23;
    }
    -[SISchemaGradingOptInStateChange systemBuild](self, "systemBuild");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[SISchemaGradingOptInStateChange systemBuild](self, "systemBuild");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "systemBuild");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      if (!v23)
        goto LABEL_23;
    }
    else
    {

    }
    v26 = (*(_BYTE *)&self->_has >> 3) & 1;
    if (v26 == ((v4[48] >> 3) & 1))
    {
      if (!v26
        || (epochEventTimestampInSeconds = self->_epochEventTimestampInSeconds,
            epochEventTimestampInSeconds == objc_msgSend(v4, "epochEventTimestampInSeconds")))
      {
        v24 = 1;
        goto LABEL_24;
      }
    }
  }
LABEL_23:
  v24 = 0;
LABEL_24:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_prevOptInState;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_newOptInState;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_source;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSString hash](self->_reason, "hash");
  v7 = -[NSString hash](self->_systemBuild, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v8 = 2654435761u * self->_epochEventTimestampInSeconds;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SISchemaGradingOptInStateChange epochEventTimestampInSeconds](self, "epochEventTimestampInSeconds"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("epochEventTimestampInSeconds"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_14;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v6 = -[SISchemaGradingOptInStateChange newOptInState](self, "newOptInState") - 1;
  if (v6 > 2)
    v7 = CFSTR("UNKNOWN");
  else
    v7 = off_1E5635970[v6];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("newOptInState"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_10:
    v8 = -[SISchemaGradingOptInStateChange prevOptInState](self, "prevOptInState") - 1;
    if (v8 > 2)
      v9 = CFSTR("UNKNOWN");
    else
      v9 = off_1E5635970[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("prevOptInState"));
  }
LABEL_14:
  if (self->_reason)
  {
    -[SISchemaGradingOptInStateChange reason](self, "reason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("reason"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v12 = -[SISchemaGradingOptInStateChange source](self, "source") - 1;
    if (v12 > 0xB)
      v13 = CFSTR("GRADINGOPTINSTATECHANGESOURCE_UNKNOWN");
    else
      v13 = off_1E5635988[v12];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("source"));
  }
  if (self->_systemBuild)
  {
    -[SISchemaGradingOptInStateChange systemBuild](self, "systemBuild");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("systemBuild"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaGradingOptInStateChange dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaGradingOptInStateChange)initWithJSON:(id)a3
{
  void *v4;
  SISchemaGradingOptInStateChange *v5;
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
    self = -[SISchemaGradingOptInStateChange initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaGradingOptInStateChange)initWithDictionary:(id)a3
{
  id v4;
  SISchemaGradingOptInStateChange *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SISchemaGradingOptInStateChange *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SISchemaGradingOptInStateChange;
  v5 = -[SISchemaGradingOptInStateChange init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("prevOptInState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaGradingOptInStateChange setPrevOptInState:](v5, "setPrevOptInState:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("newOptInState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaGradingOptInStateChange setNewOptInState:](v5, "setNewOptInState:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("source"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaGradingOptInStateChange setSource:](v5, "setSource:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[SISchemaGradingOptInStateChange setReason:](v5, "setReason:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemBuild"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[SISchemaGradingOptInStateChange setSystemBuild:](v5, "setSystemBuild:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("epochEventTimestampInSeconds"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaGradingOptInStateChange setEpochEventTimestampInSeconds:](v5, "setEpochEventTimestampInSeconds:", objc_msgSend(v13, "unsignedLongLongValue"));
    v14 = v5;

  }
  return v5;
}

- (int)prevOptInState
{
  return self->_prevOptInState;
}

- (int)newOptInState
{
  return self->_newOptInState;
}

- (int)source
{
  return self->_source;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setSystemBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)epochEventTimestampInSeconds
{
  return self->_epochEventTimestampInSeconds;
}

- (void)setHasReason:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (int)getAnyEventType
{
  return 47;
}

@end
