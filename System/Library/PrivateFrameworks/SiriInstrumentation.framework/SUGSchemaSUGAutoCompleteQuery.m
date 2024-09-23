@implementation SUGSchemaSUGAutoCompleteQuery

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setNumCharactersInQuery:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numCharactersInQuery = a3;
}

- (BOOL)hasNumCharactersInQuery
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumCharactersInQuery:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumCharactersInQuery
{
  -[SUGSchemaSUGAutoCompleteQuery setNumCharactersInQuery:](self, "setNumCharactersInQuery:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumWordsInQuery:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numWordsInQuery = a3;
}

- (BOOL)hasNumWordsInQuery
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumWordsInQuery:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumWordsInQuery
{
  -[SUGSchemaSUGAutoCompleteQuery setNumWordsInQuery:](self, "setNumWordsInQuery:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGAutoCompleteQueryReadFrom(self, (uint64_t)a3);
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
  $332E8A560DB8FF72B2120F61D9D77569 has;
  unsigned int v6;
  int numCharactersInQuery;
  int v8;
  int numWordsInQuery;
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
    numCharactersInQuery = self->_numCharactersInQuery;
    if (numCharactersInQuery != objc_msgSend(v4, "numCharactersInQuery"))
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
    numWordsInQuery = self->_numWordsInQuery;
    if (numWordsInQuery != objc_msgSend(v4, "numWordsInQuery"))
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
    v2 = 2654435761 * self->_numCharactersInQuery;
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
  v3 = 2654435761 * self->_numWordsInQuery;
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
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SUGSchemaSUGAutoCompleteQuery numCharactersInQuery](self, "numCharactersInQuery"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numCharactersInQuery"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SUGSchemaSUGAutoCompleteQuery numWordsInQuery](self, "numWordsInQuery"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("numWordsInQuery"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SUGSchemaSUGAutoCompleteQuery dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SUGSchemaSUGAutoCompleteQuery)initWithJSON:(id)a3
{
  void *v4;
  SUGSchemaSUGAutoCompleteQuery *v5;
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
    self = -[SUGSchemaSUGAutoCompleteQuery initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SUGSchemaSUGAutoCompleteQuery)initWithDictionary:(id)a3
{
  id v4;
  SUGSchemaSUGAutoCompleteQuery *v5;
  void *v6;
  void *v7;
  SUGSchemaSUGAutoCompleteQuery *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUGSchemaSUGAutoCompleteQuery;
  v5 = -[SUGSchemaSUGAutoCompleteQuery init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numCharactersInQuery"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGAutoCompleteQuery setNumCharactersInQuery:](v5, "setNumCharactersInQuery:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numWordsInQuery"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUGSchemaSUGAutoCompleteQuery setNumWordsInQuery:](v5, "setNumWordsInQuery:", objc_msgSend(v7, "intValue"));
    v8 = v5;

  }
  return v5;
}

- (int)numCharactersInQuery
{
  return self->_numCharactersInQuery;
}

- (int)numWordsInQuery
{
  return self->_numWordsInQuery;
}

@end
