@implementation SUGSchemaSUGSiriHelpSignal

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setDepthFromActiveSignal:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_depthFromActiveSignal = a3;
}

- (BOOL)hasDepthFromActiveSignal
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDepthFromActiveSignal:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteDepthFromActiveSignal
{
  -[SUGSchemaSUGSiriHelpSignal setDepthFromActiveSignal:](self, "setDepthFromActiveSignal:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasSignalValue
{
  return self->_signalValue != 0;
}

- (void)deleteSignalValue
{
  -[SUGSchemaSUGSiriHelpSignal setSignalValue:](self, "setSignalValue:", 0);
}

- (void)setSignalType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_signalType = a3;
}

- (BOOL)hasSignalType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSignalType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSignalType
{
  -[SUGSchemaSUGSiriHelpSignal setSignalType:](self, "setSignalType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGSiriHelpSignalReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[SUGSchemaSUGSiriHelpSignal signalValue](self, "signalValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unsigned int depthFromActiveSignal;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int signalType;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[28] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    depthFromActiveSignal = self->_depthFromActiveSignal;
    if (depthFromActiveSignal != objc_msgSend(v4, "depthFromActiveSignal"))
      goto LABEL_15;
  }
  -[SUGSchemaSUGSiriHelpSignal signalValue](self, "signalValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signalValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  -[SUGSchemaSUGSiriHelpSignal signalValue](self, "signalValue");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[SUGSchemaSUGSiriHelpSignal signalValue](self, "signalValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "signalValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_15;
  }
  else
  {

  }
  v14 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v14 != ((v4[28] >> 1) & 1))
    goto LABEL_15;
  if (v14)
  {
    signalType = self->_signalType;
    if (signalType != objc_msgSend(v4, "signalType"))
      goto LABEL_15;
  }
  v16 = 1;
LABEL_16:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_depthFromActiveSignal;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_signalValue, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_signalType;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SUGSchemaSUGSiriHelpSignal depthFromActiveSignal](self, "depthFromActiveSignal"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("depthFromActiveSignal"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = -[SUGSchemaSUGSiriHelpSignal signalType](self, "signalType") - 1;
    if (v6 > 5)
      v7 = CFSTR("SUGSIGNALTYPE_UNKNOWN");
    else
      v7 = off_1E5638250[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("signalType"));
  }
  if (self->_signalValue)
  {
    -[SUGSchemaSUGSiriHelpSignal signalValue](self, "signalValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("signalValue"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUGSchemaSUGSiriHelpSignal dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUGSchemaSUGSiriHelpSignal)initWithJSON:(id)a3
{
  void *v4;
  SUGSchemaSUGSiriHelpSignal *v5;
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
    self = -[SUGSchemaSUGSiriHelpSignal initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUGSchemaSUGSiriHelpSignal)initWithDictionary:(id)a3
{
  id v4;
  SUGSchemaSUGSiriHelpSignal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SUGSchemaSUGSiriHelpSignal *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUGSchemaSUGSiriHelpSignal;
  v5 = -[SUGSchemaSUGSiriHelpSignal init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("depthFromActiveSignal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGSiriHelpSignal setDepthFromActiveSignal:](v5, "setDepthFromActiveSignal:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("signalValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[SUGSchemaSUGSiriHelpSignal setSignalValue:](v5, "setSignalValue:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("signalType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGSiriHelpSignal setSignalType:](v5, "setSignalType:", objc_msgSend(v9, "intValue"));
    v10 = v5;

  }
  return v5;
}

- (unsigned)depthFromActiveSignal
{
  return self->_depthFromActiveSignal;
}

- (NSString)signalValue
{
  return self->_signalValue;
}

- (void)setSignalValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)signalType
{
  return self->_signalType;
}

- (void)setHasSignalValue:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalValue, 0);
}

@end
