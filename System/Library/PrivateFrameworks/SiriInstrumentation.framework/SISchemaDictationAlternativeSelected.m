@implementation SISchemaDictationAlternativeSelected

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
  v9.super_class = (Class)SISchemaDictationAlternativeSelected;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaDictationAlternativeSelected alternativesLocale](self, "alternativesLocale", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaDictationAlternativeSelected deleteAlternativesLocale](self, "deleteAlternativesLocale");
  return v5;
}

- (void)setCountOfWordsReplaced:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_countOfWordsReplaced = a3;
}

- (BOOL)hasCountOfWordsReplaced
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCountOfWordsReplaced:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCountOfWordsReplaced
{
  -[SISchemaDictationAlternativeSelected setCountOfWordsReplaced:](self, "setCountOfWordsReplaced:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setCountOfAlternativesAvailable:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_countOfAlternativesAvailable = a3;
}

- (BOOL)hasCountOfAlternativesAvailable
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCountOfAlternativesAvailable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteCountOfAlternativesAvailable
{
  -[SISchemaDictationAlternativeSelected setCountOfAlternativesAvailable:](self, "setCountOfAlternativesAvailable:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setAlternativeListPosition:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_alternativeListPosition = a3;
}

- (BOOL)hasAlternativeListPosition
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasAlternativeListPosition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteAlternativeListPosition
{
  -[SISchemaDictationAlternativeSelected setAlternativeListPosition:](self, "setAlternativeListPosition:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasAlternativesLocale
{
  return self->_alternativesLocale != 0;
}

- (void)deleteAlternativesLocale
{
  -[SISchemaDictationAlternativeSelected setAlternativesLocale:](self, "setAlternativesLocale:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDictationAlternativeSelectedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  -[SISchemaDictationAlternativeSelected alternativesLocale](self, "alternativesLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[SISchemaDictationAlternativeSelected alternativesLocale](self, "alternativesLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $57E0D4034926CE1C336FC15362044B9E has;
  unsigned int v6;
  int countOfWordsReplaced;
  int v8;
  int countOfAlternativesAvailable;
  int v10;
  int alternativeListPosition;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  has = self->_has;
  v6 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    countOfWordsReplaced = self->_countOfWordsReplaced;
    if (countOfWordsReplaced != objc_msgSend(v4, "countOfWordsReplaced"))
      goto LABEL_18;
    has = self->_has;
    v6 = v4[32];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      countOfAlternativesAvailable = self->_countOfAlternativesAvailable;
      if (countOfAlternativesAvailable != objc_msgSend(v4, "countOfAlternativesAvailable"))
        goto LABEL_18;
      has = self->_has;
      v6 = v4[32];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (!v10
        || (alternativeListPosition = self->_alternativeListPosition,
            alternativeListPosition == objc_msgSend(v4, "alternativeListPosition")))
      {
        -[SISchemaDictationAlternativeSelected alternativesLocale](self, "alternativesLocale");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "alternativesLocale");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) != (v13 != 0))
        {
          -[SISchemaDictationAlternativeSelected alternativesLocale](self, "alternativesLocale");
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15)
          {

LABEL_21:
            v20 = 1;
            goto LABEL_19;
          }
          v16 = (void *)v15;
          -[SISchemaDictationAlternativeSelected alternativesLocale](self, "alternativesLocale");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "alternativesLocale");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqual:", v18);

          if ((v19 & 1) != 0)
            goto LABEL_21;
        }
        else
        {

        }
      }
    }
  }
LABEL_18:
  v20 = 0;
LABEL_19:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

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
    return v3 ^ v2 ^ v4 ^ -[SISchemaLocaleIdentifier hash](self->_alternativesLocale, "hash");
  }
  v2 = 2654435761 * self->_countOfWordsReplaced;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_countOfAlternativesAvailable;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_alternativeListPosition;
  return v3 ^ v2 ^ v4 ^ -[SISchemaLocaleIdentifier hash](self->_alternativesLocale, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaDictationAlternativeSelected alternativeListPosition](self, "alternativeListPosition"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("alternativeListPosition"));

  }
  if (self->_alternativesLocale)
  {
    -[SISchemaDictationAlternativeSelected alternativesLocale](self, "alternativesLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("alternativesLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("alternativesLocale"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaDictationAlternativeSelected countOfAlternativesAvailable](self, "countOfAlternativesAvailable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("countOfAlternativesAvailable"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaDictationAlternativeSelected countOfWordsReplaced](self, "countOfWordsReplaced"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("countOfWordsReplaced"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaDictationAlternativeSelected dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaDictationAlternativeSelected)initWithJSON:(id)a3
{
  void *v4;
  SISchemaDictationAlternativeSelected *v5;
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
    self = -[SISchemaDictationAlternativeSelected initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaDictationAlternativeSelected)initWithDictionary:(id)a3
{
  id v4;
  SISchemaDictationAlternativeSelected *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SISchemaLocaleIdentifier *v10;
  SISchemaDictationAlternativeSelected *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaDictationAlternativeSelected;
  v5 = -[SISchemaDictationAlternativeSelected init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countOfWordsReplaced"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDictationAlternativeSelected setCountOfWordsReplaced:](v5, "setCountOfWordsReplaced:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countOfAlternativesAvailable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDictationAlternativeSelected setCountOfAlternativesAvailable:](v5, "setCountOfAlternativesAvailable:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternativeListPosition"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDictationAlternativeSelected setAlternativeListPosition:](v5, "setAlternativeListPosition:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternativesLocale"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[SISchemaLocaleIdentifier initWithDictionary:]([SISchemaLocaleIdentifier alloc], "initWithDictionary:", v9);
      -[SISchemaDictationAlternativeSelected setAlternativesLocale:](v5, "setAlternativesLocale:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (int)countOfWordsReplaced
{
  return self->_countOfWordsReplaced;
}

- (int)countOfAlternativesAvailable
{
  return self->_countOfAlternativesAvailable;
}

- (int)alternativeListPosition
{
  return self->_alternativeListPosition;
}

- (SISchemaLocaleIdentifier)alternativesLocale
{
  return self->_alternativesLocale;
}

- (void)setAlternativesLocale:(id)a3
{
  objc_storeStrong((id *)&self->_alternativesLocale, a3);
}

- (void)setHasAlternativesLocale:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativesLocale, 0);
}

@end
