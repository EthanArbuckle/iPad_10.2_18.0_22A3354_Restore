@implementation SISchemaDictationEndPointCancel

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setDictationEndPointType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dictationEndPointType = a3;
}

- (BOOL)hasDictationEndPointType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDictationEndPointType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDictationEndPointType
{
  -[SISchemaDictationEndPointCancel setDictationEndPointType:](self, "setDictationEndPointType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDictationEndPointCancelReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int dictationEndPointType;
  BOOL v6;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (dictationEndPointType = self->_dictationEndPointType,
            dictationEndPointType == objc_msgSend(v4, "dictationEndPointType")))
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
    return 2654435761 * self->_dictationEndPointType;
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
    v4 = -[SISchemaDictationEndPointCancel dictationEndPointType](self, "dictationEndPointType") - 1;
    if (v4 > 0x16)
      v5 = CFSTR("DICTATIONENDPOINTTYPE_UNKNOWN_DICTATION_ENDPOINT_TYPE");
    else
      v5 = off_1E5635600[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dictationEndPointType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaDictationEndPointCancel dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaDictationEndPointCancel)initWithJSON:(id)a3
{
  void *v4;
  SISchemaDictationEndPointCancel *v5;
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
    self = -[SISchemaDictationEndPointCancel initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaDictationEndPointCancel)initWithDictionary:(id)a3
{
  id v4;
  SISchemaDictationEndPointCancel *v5;
  void *v6;
  SISchemaDictationEndPointCancel *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SISchemaDictationEndPointCancel;
  v5 = -[SISchemaDictationEndPointCancel init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dictationEndPointType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDictationEndPointCancel setDictationEndPointType:](v5, "setDictationEndPointType:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)dictationEndPointType
{
  return self->_dictationEndPointType;
}

@end
