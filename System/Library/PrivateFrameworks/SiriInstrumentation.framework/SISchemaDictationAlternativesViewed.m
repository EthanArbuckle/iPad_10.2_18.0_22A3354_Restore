@implementation SISchemaDictationAlternativesViewed

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
  v9.super_class = (Class)SISchemaDictationAlternativesViewed;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaDictationAlternativesViewed alternativesLocale](self, "alternativesLocale", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaDictationAlternativesViewed deleteAlternativesLocale](self, "deleteAlternativesLocale");
  return v5;
}

- (void)setCountOfWordsUnderlined:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_countOfWordsUnderlined = a3;
}

- (BOOL)hasCountOfWordsUnderlined
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCountOfWordsUnderlined:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCountOfWordsUnderlined
{
  -[SISchemaDictationAlternativesViewed setCountOfWordsUnderlined:](self, "setCountOfWordsUnderlined:", 0);
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
  -[SISchemaDictationAlternativesViewed setCountOfAlternativesAvailable:](self, "setCountOfAlternativesAvailable:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasAlternativesLocale
{
  return self->_alternativesLocale != 0;
}

- (void)deleteAlternativesLocale
{
  -[SISchemaDictationAlternativesViewed setAlternativesLocale:](self, "setAlternativesLocale:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDictationAlternativesViewedReadFrom(self, (uint64_t)a3);
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
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[SISchemaDictationAlternativesViewed alternativesLocale](self, "alternativesLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[SISchemaDictationAlternativesViewed alternativesLocale](self, "alternativesLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $83FBF892034EF53FBEC5E7540CE8ED7D has;
  unsigned int v6;
  int countOfWordsUnderlined;
  int v8;
  int countOfAlternativesAvailable;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = self->_has;
  v6 = v4[24];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_14;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    countOfWordsUnderlined = self->_countOfWordsUnderlined;
    if (countOfWordsUnderlined != objc_msgSend(v4, "countOfWordsUnderlined"))
      goto LABEL_14;
    has = self->_has;
    v6 = v4[24];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (countOfAlternativesAvailable = self->_countOfAlternativesAvailable,
          countOfAlternativesAvailable == objc_msgSend(v4, "countOfAlternativesAvailable")))
    {
      -[SISchemaDictationAlternativesViewed alternativesLocale](self, "alternativesLocale");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "alternativesLocale");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        -[SISchemaDictationAlternativesViewed alternativesLocale](self, "alternativesLocale");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_17:
          v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        -[SISchemaDictationAlternativesViewed alternativesLocale](self, "alternativesLocale");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "alternativesLocale");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_countOfWordsUnderlined;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[SISchemaLocaleIdentifier hash](self->_alternativesLocale, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_countOfAlternativesAvailable;
  return v3 ^ v2 ^ -[SISchemaLocaleIdentifier hash](self->_alternativesLocale, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_alternativesLocale)
  {
    -[SISchemaDictationAlternativesViewed alternativesLocale](self, "alternativesLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alternativesLocale"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("alternativesLocale"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaDictationAlternativesViewed countOfAlternativesAvailable](self, "countOfAlternativesAvailable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("countOfAlternativesAvailable"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaDictationAlternativesViewed countOfWordsUnderlined](self, "countOfWordsUnderlined"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("countOfWordsUnderlined"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaDictationAlternativesViewed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaDictationAlternativesViewed)initWithJSON:(id)a3
{
  void *v4;
  SISchemaDictationAlternativesViewed *v5;
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
    self = -[SISchemaDictationAlternativesViewed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaDictationAlternativesViewed)initWithDictionary:(id)a3
{
  id v4;
  SISchemaDictationAlternativesViewed *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaLocaleIdentifier *v9;
  SISchemaDictationAlternativesViewed *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaDictationAlternativesViewed;
  v5 = -[SISchemaDictationAlternativesViewed init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countOfWordsUnderlined"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDictationAlternativesViewed setCountOfWordsUnderlined:](v5, "setCountOfWordsUnderlined:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countOfAlternativesAvailable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDictationAlternativesViewed setCountOfAlternativesAvailable:](v5, "setCountOfAlternativesAvailable:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternativesLocale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaLocaleIdentifier initWithDictionary:]([SISchemaLocaleIdentifier alloc], "initWithDictionary:", v8);
      -[SISchemaDictationAlternativesViewed setAlternativesLocale:](v5, "setAlternativesLocale:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (int)countOfWordsUnderlined
{
  return self->_countOfWordsUnderlined;
}

- (int)countOfAlternativesAvailable
{
  return self->_countOfAlternativesAvailable;
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
