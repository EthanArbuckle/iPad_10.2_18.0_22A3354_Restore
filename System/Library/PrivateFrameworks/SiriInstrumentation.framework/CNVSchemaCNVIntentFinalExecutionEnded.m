@implementation CNVSchemaCNVIntentFinalExecutionEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setEagerStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eagerStatus = a3;
}

- (BOOL)hasEagerStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEagerStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteEagerStatus
{
  -[CNVSchemaCNVIntentFinalExecutionEnded setEagerStatus:](self, "setEagerStatus:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setBypassReason:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_bypassReason = a3;
}

- (BOOL)hasBypassReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasBypassReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteBypassReason
{
  -[CNVSchemaCNVIntentFinalExecutionEnded setBypassReason:](self, "setBypassReason:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setMaxRss:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_maxRss = a3;
}

- (BOOL)hasMaxRss
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMaxRss:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteMaxRss
{
  -[CNVSchemaCNVIntentFinalExecutionEnded setMaxRss:](self, "setMaxRss:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVIntentFinalExecutionEndedReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
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
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
LABEL_5:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $A452E09500BDD7A3C4AF49C0EB2EBA77 has;
  unsigned int v6;
  int eagerStatus;
  int v8;
  int bypassReason;
  int v10;
  unint64_t maxRss;
  BOOL v12;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    eagerStatus = self->_eagerStatus;
    if (eagerStatus != objc_msgSend(v4, "eagerStatus"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_14;
  if (v8)
  {
    bypassReason = self->_bypassReason;
    if (bypassReason == objc_msgSend(v4, "bypassReason"))
    {
      has = self->_has;
      v6 = v4[24];
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
    maxRss = self->_maxRss;
    if (maxRss != objc_msgSend(v4, "maxRss"))
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
  unint64_t v4;

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
  v2 = 2654435761 * self->_eagerStatus;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_bypassReason;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761u * self->_maxRss;
  return v3 ^ v2 ^ v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  const __CFString *v7;
  unsigned int v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_10:
    v8 = -[CNVSchemaCNVIntentFinalExecutionEnded eagerStatus](self, "eagerStatus") - 1;
    if (v8 > 2)
      v9 = CFSTR("CNVEAGERSTATUS_UNKNOWN");
    else
      v9 = off_1E562C3D8[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("eagerStatus"));
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_5;
  }
  if (-[CNVSchemaCNVIntentFinalExecutionEnded bypassReason](self, "bypassReason") == 1)
    v7 = CFSTR("CNVBYPASSREASON_EMERGENCY_CALL");
  else
    v7 = CFSTR("CNVBYPASSREASON_UNKNOWN");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("bypassReason"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_10;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[CNVSchemaCNVIntentFinalExecutionEnded maxRss](self, "maxRss"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("maxRss"));

  }
LABEL_5:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CNVSchemaCNVIntentFinalExecutionEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CNVSchemaCNVIntentFinalExecutionEnded)initWithJSON:(id)a3
{
  void *v4;
  CNVSchemaCNVIntentFinalExecutionEnded *v5;
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
    self = -[CNVSchemaCNVIntentFinalExecutionEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CNVSchemaCNVIntentFinalExecutionEnded)initWithDictionary:(id)a3
{
  id v4;
  CNVSchemaCNVIntentFinalExecutionEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  CNVSchemaCNVIntentFinalExecutionEnded *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNVSchemaCNVIntentFinalExecutionEnded;
  v5 = -[CNVSchemaCNVIntentFinalExecutionEnded init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eagerStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNVSchemaCNVIntentFinalExecutionEnded setEagerStatus:](v5, "setEagerStatus:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bypassReason"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNVSchemaCNVIntentFinalExecutionEnded setBypassReason:](v5, "setBypassReason:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxRss"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNVSchemaCNVIntentFinalExecutionEnded setMaxRss:](v5, "setMaxRss:", objc_msgSend(v8, "unsignedLongLongValue"));
    v9 = v5;

  }
  return v5;
}

- (int)eagerStatus
{
  return self->_eagerStatus;
}

- (int)bypassReason
{
  return self->_bypassReason;
}

- (unint64_t)maxRss
{
  return self->_maxRss;
}

@end
