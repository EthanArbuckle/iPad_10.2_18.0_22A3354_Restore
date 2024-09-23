@implementation SISchemaDictationAlternativesPresent

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
  v9.super_class = (Class)SISchemaDictationAlternativesPresent;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaDictationAlternativesPresent alternativesLocale](self, "alternativesLocale", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaDictationAlternativesPresent deleteAlternativesLocale](self, "deleteAlternativesLocale");
  return v5;
}

- (void)setNumberOfUnderlines:(int)a3
{
  *(&self->_multilingualIsLowConfidence + 1) |= 1u;
  self->_numberOfUnderlines = a3;
}

- (BOOL)hasNumberOfUnderlines
{
  return *(&self->_multilingualIsLowConfidence + 1);
}

- (void)setHasNumberOfUnderlines:(BOOL)a3
{
  *(&self->_multilingualIsLowConfidence + 1) = *(&self->_multilingualIsLowConfidence + 1) & 0xFE | a3;
}

- (void)deleteNumberOfUnderlines
{
  -[SISchemaDictationAlternativesPresent setNumberOfUnderlines:](self, "setNumberOfUnderlines:", 0);
  *(&self->_multilingualIsLowConfidence + 1) &= ~1u;
}

- (void)setCountOfWordsUnderlined:(int)a3
{
  *(&self->_multilingualIsLowConfidence + 1) |= 2u;
  self->_countOfWordsUnderlined = a3;
}

- (BOOL)hasCountOfWordsUnderlined
{
  return (*((unsigned __int8 *)&self->_multilingualIsLowConfidence + 1) >> 1) & 1;
}

- (void)setHasCountOfWordsUnderlined:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_multilingualIsLowConfidence + 1) = *(&self->_multilingualIsLowConfidence + 1) & 0xFD | v3;
}

- (void)deleteCountOfWordsUnderlined
{
  -[SISchemaDictationAlternativesPresent setCountOfWordsUnderlined:](self, "setCountOfWordsUnderlined:", 0);
  *(&self->_multilingualIsLowConfidence + 1) &= ~2u;
}

- (BOOL)hasAlternativesLocale
{
  return self->_alternativesLocale != 0;
}

- (void)deleteAlternativesLocale
{
  -[SISchemaDictationAlternativesPresent setAlternativesLocale:](self, "setAlternativesLocale:", 0);
}

- (void)setMultilingualIsLowConfidence:(BOOL)a3
{
  *(&self->_multilingualIsLowConfidence + 1) |= 4u;
  self->_multilingualIsLowConfidence = a3;
}

- (BOOL)hasMultilingualIsLowConfidence
{
  return (*((unsigned __int8 *)&self->_multilingualIsLowConfidence + 1) >> 2) & 1;
}

- (void)setHasMultilingualIsLowConfidence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_multilingualIsLowConfidence + 1) = *(&self->_multilingualIsLowConfidence + 1) & 0xFB | v3;
}

- (void)deleteMultilingualIsLowConfidence
{
  -[SISchemaDictationAlternativesPresent setMultilingualIsLowConfidence:](self, "setMultilingualIsLowConfidence:", 0);
  *(&self->_multilingualIsLowConfidence + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDictationAlternativesPresentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = *(&self->_multilingualIsLowConfidence + 1);
  if ((v4 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = *(&self->_multilingualIsLowConfidence + 1);
  }
  if ((v4 & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[SISchemaDictationAlternativesPresent alternativesLocale](self, "alternativesLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SISchemaDictationAlternativesPresent alternativesLocale](self, "alternativesLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(&self->_multilingualIsLowConfidence + 1) & 4) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  int numberOfUnderlines;
  int v8;
  int countOfWordsUnderlined;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int multilingualIsLowConfidence;
  BOOL v20;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  v5 = *((unsigned __int8 *)&self->_multilingualIsLowConfidence + 1);
  v6 = v4[25];
  if ((v5 & 1) != (v6 & 1))
    goto LABEL_19;
  if ((v5 & 1) != 0)
  {
    numberOfUnderlines = self->_numberOfUnderlines;
    if (numberOfUnderlines != objc_msgSend(v4, "numberOfUnderlines"))
    {
LABEL_19:
      v20 = 0;
      goto LABEL_20;
    }
    v5 = *((unsigned __int8 *)&self->_multilingualIsLowConfidence + 1);
    v6 = v4[25];
  }
  v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_19;
  if (v8)
  {
    countOfWordsUnderlined = self->_countOfWordsUnderlined;
    if (countOfWordsUnderlined != objc_msgSend(v4, "countOfWordsUnderlined"))
      goto LABEL_19;
  }
  -[SISchemaDictationAlternativesPresent alternativesLocale](self, "alternativesLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternativesLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_19;
  }
  -[SISchemaDictationAlternativesPresent alternativesLocale](self, "alternativesLocale");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SISchemaDictationAlternativesPresent alternativesLocale](self, "alternativesLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternativesLocale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_19;
  }
  else
  {

  }
  v18 = (*((unsigned __int8 *)&self->_multilingualIsLowConfidence + 1) >> 2) & 1;
  if (v18 != ((v4[25] >> 2) & 1))
    goto LABEL_19;
  if (v18)
  {
    multilingualIsLowConfidence = self->_multilingualIsLowConfidence;
    if (multilingualIsLowConfidence != objc_msgSend(v4, "multilingualIsLowConfidence"))
      goto LABEL_19;
  }
  v20 = 1;
LABEL_20:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (*(&self->_multilingualIsLowConfidence + 1))
  {
    v3 = 2654435761 * self->_numberOfUnderlines;
    if ((*(&self->_multilingualIsLowConfidence + 1) & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(&self->_multilingualIsLowConfidence + 1) & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_countOfWordsUnderlined;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[SISchemaLocaleIdentifier hash](self->_alternativesLocale, "hash");
  if ((*(&self->_multilingualIsLowConfidence + 1) & 4) != 0)
    v6 = 2654435761 * self->_multilingualIsLowConfidence;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_alternativesLocale)
  {
    -[SISchemaDictationAlternativesPresent alternativesLocale](self, "alternativesLocale");
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
  v7 = *(&self->_multilingualIsLowConfidence + 1);
  if ((v7 & 2) == 0)
  {
    if ((*(&self->_multilingualIsLowConfidence + 1) & 4) == 0)
      goto LABEL_8;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SISchemaDictationAlternativesPresent multilingualIsLowConfidence](self, "multilingualIsLowConfidence"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("multilingualIsLowConfidence"));

    if (!*(&self->_multilingualIsLowConfidence + 1))
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaDictationAlternativesPresent countOfWordsUnderlined](self, "countOfWordsUnderlined"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("countOfWordsUnderlined"));

  v7 = *(&self->_multilingualIsLowConfidence + 1);
  if ((v7 & 4) != 0)
    goto LABEL_12;
LABEL_8:
  if ((v7 & 1) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SISchemaDictationAlternativesPresent numberOfUnderlines](self, "numberOfUnderlines"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numberOfUnderlines"));

  }
LABEL_10:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaDictationAlternativesPresent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaDictationAlternativesPresent)initWithJSON:(id)a3
{
  void *v4;
  SISchemaDictationAlternativesPresent *v5;
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
    self = -[SISchemaDictationAlternativesPresent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaDictationAlternativesPresent)initWithDictionary:(id)a3
{
  id v4;
  SISchemaDictationAlternativesPresent *v5;
  void *v6;
  void *v7;
  void *v8;
  SISchemaLocaleIdentifier *v9;
  void *v10;
  SISchemaDictationAlternativesPresent *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaDictationAlternativesPresent;
  v5 = -[SISchemaDictationAlternativesPresent init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfUnderlines"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDictationAlternativesPresent setNumberOfUnderlines:](v5, "setNumberOfUnderlines:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countOfWordsUnderlined"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDictationAlternativesPresent setCountOfWordsUnderlined:](v5, "setCountOfWordsUnderlined:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternativesLocale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaLocaleIdentifier initWithDictionary:]([SISchemaLocaleIdentifier alloc], "initWithDictionary:", v8);
      -[SISchemaDictationAlternativesPresent setAlternativesLocale:](v5, "setAlternativesLocale:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multilingualIsLowConfidence"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaDictationAlternativesPresent setMultilingualIsLowConfidence:](v5, "setMultilingualIsLowConfidence:", objc_msgSend(v10, "BOOLValue"));
    v11 = v5;

  }
  return v5;
}

- (int)numberOfUnderlines
{
  return self->_numberOfUnderlines;
}

- (int)countOfWordsUnderlined
{
  return self->_countOfWordsUnderlined;
}

- (SISchemaLocaleIdentifier)alternativesLocale
{
  return self->_alternativesLocale;
}

- (void)setAlternativesLocale:(id)a3
{
  objc_storeStrong((id *)&self->_alternativesLocale, a3);
}

- (BOOL)multilingualIsLowConfidence
{
  return self->_multilingualIsLowConfidence;
}

- (void)setHasAlternativesLocale:(BOOL)a3
{
  *(&self->_multilingualIsLowConfidence + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativesLocale, 0);
}

@end
