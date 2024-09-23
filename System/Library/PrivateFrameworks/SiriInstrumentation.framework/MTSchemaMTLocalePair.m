@implementation MTSchemaMTLocalePair

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setSourceLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sourceLocale = a3;
}

- (BOOL)hasSourceLocale
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSourceLocale:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteSourceLocale
{
  -[MTSchemaMTLocalePair setSourceLocale:](self, "setSourceLocale:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setTargetLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_targetLocale = a3;
}

- (BOOL)hasTargetLocale
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTargetLocale:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteTargetLocale
{
  -[MTSchemaMTLocalePair setTargetLocale:](self, "setTargetLocale:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTLocalePairReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
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
  $6F478D73B3806558BB2990DBB0E654F2 has;
  unsigned int v6;
  int sourceLocale;
  int v8;
  int targetLocale;
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
    sourceLocale = self->_sourceLocale;
    if (sourceLocale != objc_msgSend(v4, "sourceLocale"))
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
    targetLocale = self->_targetLocale;
    if (targetLocale != objc_msgSend(v4, "targetLocale"))
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
    v2 = 2654435761 * self->_sourceLocale;
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
  v3 = 2654435761 * self->_targetLocale;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = -[MTSchemaMTLocalePair sourceLocale](self, "sourceLocale") - 1;
    if (v5 > 0x3D)
      v6 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v6 = off_1E56309B8[v5];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sourceLocale"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = -[MTSchemaMTLocalePair targetLocale](self, "targetLocale") - 1;
    if (v7 > 0x3D)
      v8 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v8 = off_1E56309B8[v7];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("targetLocale"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MTSchemaMTLocalePair dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MTSchemaMTLocalePair)initWithJSON:(id)a3
{
  void *v4;
  MTSchemaMTLocalePair *v5;
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
    self = -[MTSchemaMTLocalePair initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MTSchemaMTLocalePair)initWithDictionary:(id)a3
{
  id v4;
  MTSchemaMTLocalePair *v5;
  void *v6;
  void *v7;
  MTSchemaMTLocalePair *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTSchemaMTLocalePair;
  v5 = -[MTSchemaMTLocalePair init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceLocale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTLocalePair setSourceLocale:](v5, "setSourceLocale:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("targetLocale"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTLocalePair setTargetLocale:](v5, "setTargetLocale:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (int)sourceLocale
{
  return self->_sourceLocale;
}

- (int)targetLocale
{
  return self->_targetLocale;
}

@end
