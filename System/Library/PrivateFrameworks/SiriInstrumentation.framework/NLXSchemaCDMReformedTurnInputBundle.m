@implementation NLXSchemaCDMReformedTurnInputBundle

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaCDMReformedTurnInputBundle;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaCDMReformedTurnInputBundle currentTurn](self, "currentTurn", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[NLXSchemaCDMReformedTurnInputBundle deleteCurrentTurn](self, "deleteCurrentTurn");
  return v5;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteType
{
  -[NLXSchemaCDMReformedTurnInputBundle setType:](self, "setType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasCurrentTurn
{
  return self->_currentTurn != 0;
}

- (void)deleteCurrentTurn
{
  -[NLXSchemaCDMReformedTurnInputBundle setCurrentTurn:](self, "setCurrentTurn:", 0);
}

- (void)setPreviousTurnsSkip:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_previousTurnsSkip = a3;
}

- (BOOL)hasPreviousTurnsSkip
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPreviousTurnsSkip:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deletePreviousTurnsSkip
{
  -[NLXSchemaCDMReformedTurnInputBundle setPreviousTurnsSkip:](self, "setPreviousTurnsSkip:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMReformedTurnInputBundleReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[NLXSchemaCDMReformedTurnInputBundle currentTurn](self, "currentTurn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLXSchemaCDMReformedTurnInputBundle currentTurn](self, "currentTurn");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int type;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  unsigned int previousTurnsSkip;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[28] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    type = self->_type;
    if (type != objc_msgSend(v4, "type"))
      goto LABEL_15;
  }
  -[NLXSchemaCDMReformedTurnInputBundle currentTurn](self, "currentTurn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTurn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  -[NLXSchemaCDMReformedTurnInputBundle currentTurn](self, "currentTurn");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[NLXSchemaCDMReformedTurnInputBundle currentTurn](self, "currentTurn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentTurn");
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
    previousTurnsSkip = self->_previousTurnsSkip;
    if (previousTurnsSkip != objc_msgSend(v4, "previousTurnsSkip"))
      goto LABEL_15;
  }
  v16 = 1;
LABEL_16:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NLXSchemaCDMTurnInput hash](self->_currentTurn, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_previousTurnsSkip;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  unsigned int v9;
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_currentTurn)
  {
    -[NLXSchemaCDMReformedTurnInputBundle currentTurn](self, "currentTurn");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("currentTurn"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("currentTurn"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMReformedTurnInputBundle previousTurnsSkip](self, "previousTurnsSkip"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("previousTurnsSkip"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v9 = -[NLXSchemaCDMReformedTurnInputBundle type](self, "type") - 1;
    if (v9 > 3)
      v10 = CFSTR("CDMREFORMTYPE_UNKNOWN");
    else
      v10 = off_1E5631AB8[v9];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("type"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMReformedTurnInputBundle dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMReformedTurnInputBundle)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMReformedTurnInputBundle *v5;
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
    self = -[NLXSchemaCDMReformedTurnInputBundle initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMReformedTurnInputBundle)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMReformedTurnInputBundle *v5;
  void *v6;
  void *v7;
  NLXSchemaCDMTurnInput *v8;
  void *v9;
  NLXSchemaCDMReformedTurnInputBundle *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaCDMReformedTurnInputBundle;
  v5 = -[NLXSchemaCDMReformedTurnInputBundle init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMReformedTurnInputBundle setType:](v5, "setType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentTurn"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[NLXSchemaCDMTurnInput initWithDictionary:]([NLXSchemaCDMTurnInput alloc], "initWithDictionary:", v7);
      -[NLXSchemaCDMReformedTurnInputBundle setCurrentTurn:](v5, "setCurrentTurn:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previousTurnsSkip"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMReformedTurnInputBundle setPreviousTurnsSkip:](v5, "setPreviousTurnsSkip:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = v5;

  }
  return v5;
}

- (int)type
{
  return self->_type;
}

- (NLXSchemaCDMTurnInput)currentTurn
{
  return self->_currentTurn;
}

- (void)setCurrentTurn:(id)a3
{
  objc_storeStrong((id *)&self->_currentTurn, a3);
}

- (unsigned)previousTurnsSkip
{
  return self->_previousTurnsSkip;
}

- (void)setHasCurrentTurn:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTurn, 0);
}

@end
