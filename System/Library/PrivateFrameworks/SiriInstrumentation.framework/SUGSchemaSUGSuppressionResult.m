@implementation SUGSchemaSUGSuppressionResult

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setWasSuppressed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_wasSuppressed = a3;
}

- (BOOL)hasWasSuppressed
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasWasSuppressed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteWasSuppressed
{
  -[SUGSchemaSUGSuppressionResult setWasSuppressed:](self, "setWasSuppressed:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSuppressionReason:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_suppressionReason = a3;
}

- (BOOL)hasSuppressionReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSuppressionReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSuppressionReason
{
  -[SUGSchemaSUGSuppressionResult setSuppressionReason:](self, "setSuppressionReason:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGSuppressionResultReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $CB8788A50CCDFBB5927227C680FE78CF has;
  unsigned int v6;
  int wasSuppressed;
  int v8;
  int suppressionReason;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[16];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    wasSuppressed = self->_wasSuppressed;
    if (wasSuppressed != objc_msgSend(v4, "wasSuppressed"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[16];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    suppressionReason = self->_suppressionReason;
    if (suppressionReason != objc_msgSend(v4, "suppressionReason"))
      goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_wasSuppressed;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_suppressionReason;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[SUGSchemaSUGSuppressionResult suppressionReason](self, "suppressionReason") - 1;
    if (v5 > 0xB)
      v6 = CFSTR("SUGSUPPRESSIONREASON_UNKNOWN");
    else
      v6 = off_1E5639B58[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("suppressionReason"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SUGSchemaSUGSuppressionResult wasSuppressed](self, "wasSuppressed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("wasSuppressed"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUGSchemaSUGSuppressionResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUGSchemaSUGSuppressionResult)initWithJSON:(id)a3
{
  void *v4;
  SUGSchemaSUGSuppressionResult *v5;
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
    self = -[SUGSchemaSUGSuppressionResult initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUGSchemaSUGSuppressionResult)initWithDictionary:(id)a3
{
  id v4;
  SUGSchemaSUGSuppressionResult *v5;
  void *v6;
  void *v7;
  SUGSchemaSUGSuppressionResult *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUGSchemaSUGSuppressionResult;
  v5 = -[SUGSchemaSUGSuppressionResult init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wasSuppressed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGSuppressionResult setWasSuppressed:](v5, "setWasSuppressed:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suppressionReason"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGSuppressionResult setSuppressionReason:](v5, "setSuppressionReason:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (BOOL)wasSuppressed
{
  return self->_wasSuppressed;
}

- (int)suppressionReason
{
  return self->_suppressionReason;
}

@end
