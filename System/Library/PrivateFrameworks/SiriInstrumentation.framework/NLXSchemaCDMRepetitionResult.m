@implementation NLXSchemaCDMRepetitionResult

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setAsrHypothesisIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_asrHypothesisIndex = a3;
}

- (BOOL)hasAsrHypothesisIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAsrHypothesisIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteAsrHypothesisIndex
{
  -[NLXSchemaCDMRepetitionResult setAsrHypothesisIndex:](self, "setAsrHypothesisIndex:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setRepetitionType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_repetitionType = a3;
}

- (BOOL)hasRepetitionType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRepetitionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteRepetitionType
{
  -[NLXSchemaCDMRepetitionResult setRepetitionType:](self, "setRepetitionType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMRepetitionResultReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteUint32Field();
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
  $0D83E20D3B7BE47A19C309BEE287C02F has;
  unsigned int v6;
  unsigned int asrHypothesisIndex;
  int v8;
  int repetitionType;
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
    asrHypothesisIndex = self->_asrHypothesisIndex;
    if (asrHypothesisIndex != objc_msgSend(v4, "asrHypothesisIndex"))
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
    repetitionType = self->_repetitionType;
    if (repetitionType != objc_msgSend(v4, "repetitionType"))
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
    v2 = 2654435761 * self->_asrHypothesisIndex;
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
  v3 = 2654435761 * self->_repetitionType;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaCDMRepetitionResult asrHypothesisIndex](self, "asrHypothesisIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("asrHypothesisIndex"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = -[NLXSchemaCDMRepetitionResult repetitionType](self, "repetitionType") - 1;
    if (v6 > 3)
      v7 = CFSTR("CDMREPETITIONTYPE_UNKNOWN");
    else
      v7 = off_1E5631AD8[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("repetitionType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMRepetitionResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMRepetitionResult)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMRepetitionResult *v5;
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
    self = -[NLXSchemaCDMRepetitionResult initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMRepetitionResult)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMRepetitionResult *v5;
  void *v6;
  void *v7;
  NLXSchemaCDMRepetitionResult *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaCDMRepetitionResult;
  v5 = -[NLXSchemaCDMRepetitionResult init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asrHypothesisIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMRepetitionResult setAsrHypothesisIndex:](v5, "setAsrHypothesisIndex:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("repetitionType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaCDMRepetitionResult setRepetitionType:](v5, "setRepetitionType:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (unsigned)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (int)repetitionType
{
  return self->_repetitionType;
}

@end
