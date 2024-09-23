@implementation ASRSchemaASRAppLanguageModelLoadStarted

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setModelLocale:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_modelLocale = a3;
}

- (BOOL)hasModelLocale
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasModelLocale:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteModelLocale
{
  -[ASRSchemaASRAppLanguageModelLoadStarted setModelLocale:](self, "setModelLocale:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRAppLanguageModelLoadStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int modelLocale;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (modelLocale = self->_modelLocale, modelLocale == objc_msgSend(v4, "modelLocale")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761 * self->_modelLocale;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[ASRSchemaASRAppLanguageModelLoadStarted modelLocale](self, "modelLocale") - 1;
    if (v4 > 0x3D)
      v5 = CFSTR("LOCALE_UNKNOWN_LOCALE");
    else
      v5 = off_1E562B190[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("modelLocale"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ASRSchemaASRAppLanguageModelLoadStarted dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ASRSchemaASRAppLanguageModelLoadStarted)initWithJSON:(id)a3
{
  void *v4;
  ASRSchemaASRAppLanguageModelLoadStarted *v5;
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
    self = -[ASRSchemaASRAppLanguageModelLoadStarted initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ASRSchemaASRAppLanguageModelLoadStarted)initWithDictionary:(id)a3
{
  id v4;
  ASRSchemaASRAppLanguageModelLoadStarted *v5;
  void *v6;
  ASRSchemaASRAppLanguageModelLoadStarted *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASRSchemaASRAppLanguageModelLoadStarted;
  v5 = -[ASRSchemaASRAppLanguageModelLoadStarted init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelLocale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ASRSchemaASRAppLanguageModelLoadStarted setModelLocale:](v5, "setModelLocale:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)modelLocale
{
  return self->_modelLocale;
}

@end
