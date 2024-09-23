@implementation ASRSchemaASRAppLanguageModelLoadEnded

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setLoadTimeInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_loadTimeInNs = a3;
}

- (BOOL)hasLoadTimeInNs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasLoadTimeInNs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteLoadTimeInNs
{
  -[ASRSchemaASRAppLanguageModelLoadEnded setLoadTimeInNs:](self, "setLoadTimeInNs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setForegroundCheckTimeInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_foregroundCheckTimeInNs = a3;
}

- (BOOL)hasForegroundCheckTimeInNs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasForegroundCheckTimeInNs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteForegroundCheckTimeInNs
{
  -[ASRSchemaASRAppLanguageModelLoadEnded setForegroundCheckTimeInNs:](self, "setForegroundCheckTimeInNs:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRAppLanguageModelLoadEndedReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $C687C0EDAD2FAD1E293E53B41A92454B has;
  unsigned int v6;
  unint64_t loadTimeInNs;
  int v8;
  unint64_t foregroundCheckTimeInNs;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    loadTimeInNs = self->_loadTimeInNs;
    if (loadTimeInNs != objc_msgSend(v4, "loadTimeInNs"))
    {
LABEL_10:
      v10 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_10;
  if (v8)
  {
    foregroundCheckTimeInNs = self->_foregroundCheckTimeInNs;
    if (foregroundCheckTimeInNs != objc_msgSend(v4, "foregroundCheckTimeInNs"))
      goto LABEL_10;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_loadTimeInNs;
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
  v3 = 2654435761u * self->_foregroundCheckTimeInNs;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRAppLanguageModelLoadEnded foregroundCheckTimeInNs](self, "foregroundCheckTimeInNs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("foregroundCheckTimeInNs"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ASRSchemaASRAppLanguageModelLoadEnded loadTimeInNs](self, "loadTimeInNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("loadTimeInNs"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRAppLanguageModelLoadEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRAppLanguageModelLoadEnded)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRAppLanguageModelLoadEnded *v5;
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
    self = -[ASRSchemaASRAppLanguageModelLoadEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRAppLanguageModelLoadEnded)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRAppLanguageModelLoadEnded *v5;
  void *v6;
  void *v7;
  ASRSchemaASRAppLanguageModelLoadEnded *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASRSchemaASRAppLanguageModelLoadEnded;
  v5 = -[ASRSchemaASRAppLanguageModelLoadEnded init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loadTimeInNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRAppLanguageModelLoadEnded setLoadTimeInNs:](v5, "setLoadTimeInNs:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("foregroundCheckTimeInNs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRAppLanguageModelLoadEnded setForegroundCheckTimeInNs:](v5, "setForegroundCheckTimeInNs:", objc_msgSend(v7, "unsignedLongLongValue"));
    v8 = v5;

  }
  return v5;
}

- (unint64_t)loadTimeInNs
{
  return self->_loadTimeInNs;
}

- (unint64_t)foregroundCheckTimeInNs
{
  return self->_foregroundCheckTimeInNs;
}

@end
