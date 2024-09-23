@implementation SISchemaIntercomMessageRecorded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setDurationInMs:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_durationInMs = a3;
}

- (BOOL)hasDurationInMs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDurationInMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDurationInMs
{
  -[SISchemaIntercomMessageRecorded setDurationInMs:](self, "setDurationInMs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsReply:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isReply = a3;
}

- (BOOL)hasIsReply
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsReply:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsReply
{
  -[SISchemaIntercomMessageRecorded setIsReply:](self, "setIsReply:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setDisambiguationRequired:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_disambiguationRequired = a3;
}

- (BOOL)hasDisambiguationRequired
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasDisambiguationRequired:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteDisambiguationRequired
{
  -[SISchemaIntercomMessageRecorded setDisambiguationRequired:](self, "setDisambiguationRequired:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIntercomTarget:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_intercomTarget = a3;
}

- (BOOL)hasIntercomTarget
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIntercomTarget:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIntercomTarget
{
  -[SISchemaIntercomMessageRecorded setIntercomTarget:](self, "setIntercomTarget:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaIntercomMessageRecordedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $D8BE4932C0F054940469C5CF6B03147B has;
  unsigned int v6;
  int64_t durationInMs;
  int v8;
  int isReply;
  int v10;
  int disambiguationRequired;
  int v12;
  int intercomTarget;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    durationInMs = self->_durationInMs;
    if (durationInMs != objc_msgSend(v4, "durationInMs"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_18;
  if (v8)
  {
    isReply = self->_isReply;
    if (isReply != objc_msgSend(v4, "isReply"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[24];
  }
  v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1))
    goto LABEL_18;
  if (v10)
  {
    disambiguationRequired = self->_disambiguationRequired;
    if (disambiguationRequired == objc_msgSend(v4, "disambiguationRequired"))
    {
      has = self->_has;
      v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1))
    goto LABEL_18;
  if (v12)
  {
    intercomTarget = self->_intercomTarget;
    if (intercomTarget != objc_msgSend(v4, "intercomTarget"))
      goto LABEL_18;
  }
  v14 = 1;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_durationInMs;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_isReply;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_disambiguationRequired;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_intercomTarget;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaIntercomMessageRecorded disambiguationRequired](self, "disambiguationRequired"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("disambiguationRequired"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      v9 = -[SISchemaIntercomMessageRecorded intercomTarget](self, "intercomTarget") - 1;
      if (v9 > 2)
        v10 = CFSTR("INTERCOMTARGET_UNKNOWN_INTERCOM_TARGET");
      else
        v10 = off_1E56368D0[v9];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("intercomTarget"));
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_5;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SISchemaIntercomMessageRecorded durationInMs](self, "durationInMs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("durationInMs"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaIntercomMessageRecorded isReply](self, "isReply"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isReply"));

  }
LABEL_6:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaIntercomMessageRecorded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaIntercomMessageRecorded)initWithJSON:(id)a3
{
  void *v4;
  SISchemaIntercomMessageRecorded *v5;
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
    self = -[SISchemaIntercomMessageRecorded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaIntercomMessageRecorded)initWithDictionary:(id)a3
{
  id v4;
  SISchemaIntercomMessageRecorded *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SISchemaIntercomMessageRecorded *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaIntercomMessageRecorded;
  v5 = -[SISchemaIntercomMessageRecorded init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("durationInMs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaIntercomMessageRecorded setDurationInMs:](v5, "setDurationInMs:", objc_msgSend(v6, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isReply"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaIntercomMessageRecorded setIsReply:](v5, "setIsReply:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disambiguationRequired"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaIntercomMessageRecorded setDisambiguationRequired:](v5, "setDisambiguationRequired:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intercomTarget"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaIntercomMessageRecorded setIntercomTarget:](v5, "setIntercomTarget:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (int64_t)durationInMs
{
  return self->_durationInMs;
}

- (BOOL)isReply
{
  return self->_isReply;
}

- (BOOL)disambiguationRequired
{
  return self->_disambiguationRequired;
}

- (int)intercomTarget
{
  return self->_intercomTarget;
}

@end
