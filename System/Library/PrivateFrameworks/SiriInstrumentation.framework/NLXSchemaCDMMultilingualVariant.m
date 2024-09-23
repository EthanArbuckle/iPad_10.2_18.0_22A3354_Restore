@implementation NLXSchemaCDMMultilingualVariant

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasLanguageVariantName
{
  return self->_languageVariantName != 0;
}

- (void)deleteLanguageVariantName
{
  -[NLXSchemaCDMMultilingualVariant setLanguageVariantName:](self, "setLanguageVariantName:", 0);
}

- (void)setLanguageVariantConfidenceScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_languageVariantConfidenceScore = a3;
}

- (BOOL)hasLanguageVariantConfidenceScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasLanguageVariantConfidenceScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteLanguageVariantConfidenceScore
{
  -[NLXSchemaCDMMultilingualVariant setLanguageVariantConfidenceScore:](self, "setLanguageVariantConfidenceScore:", 0.0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMMultilingualVariantReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NLXSchemaCDMMultilingualVariant languageVariantName](self, "languageVariantName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  double languageVariantConfidenceScore;
  double v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[NLXSchemaCDMMultilingualVariant languageVariantName](self, "languageVariantName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageVariantName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[NLXSchemaCDMMultilingualVariant languageVariantName](self, "languageVariantName");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[NLXSchemaCDMMultilingualVariant languageVariantName](self, "languageVariantName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "languageVariantName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_11;
    }
    else
    {

    }
    if ((*(_BYTE *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (languageVariantConfidenceScore = self->_languageVariantConfidenceScore,
            objc_msgSend(v4, "languageVariantConfidenceScore"),
            languageVariantConfidenceScore == v14))
      {
        v15 = 1;
        goto LABEL_12;
      }
    }
  }
  else
  {

  }
LABEL_11:
  v15 = 0;
LABEL_12:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  double languageVariantConfidenceScore;
  double v6;
  long double v7;
  double v8;

  v3 = -[NSString hash](self->_languageVariantName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    languageVariantConfidenceScore = self->_languageVariantConfidenceScore;
    v6 = -languageVariantConfidenceScore;
    if (languageVariantConfidenceScore >= 0.0)
      v6 = self->_languageVariantConfidenceScore;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[NLXSchemaCDMMultilingualVariant languageVariantConfidenceScore](self, "languageVariantConfidenceScore");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("languageVariantConfidenceScore"));

  }
  if (self->_languageVariantName)
  {
    -[NLXSchemaCDMMultilingualVariant languageVariantName](self, "languageVariantName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("languageVariantName"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMMultilingualVariant dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMMultilingualVariant)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMMultilingualVariant *v5;
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
    self = -[NLXSchemaCDMMultilingualVariant initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMMultilingualVariant)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMMultilingualVariant *v5;
  void *v6;
  void *v7;
  void *v8;
  NLXSchemaCDMMultilingualVariant *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NLXSchemaCDMMultilingualVariant;
  v5 = -[NLXSchemaCDMMultilingualVariant init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("languageVariantName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[NLXSchemaCDMMultilingualVariant setLanguageVariantName:](v5, "setLanguageVariantName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("languageVariantConfidenceScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      -[NLXSchemaCDMMultilingualVariant setLanguageVariantConfidenceScore:](v5, "setLanguageVariantConfidenceScore:");
    }
    v9 = v5;

  }
  return v5;
}

- (NSString)languageVariantName
{
  return self->_languageVariantName;
}

- (void)setLanguageVariantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)languageVariantConfidenceScore
{
  return self->_languageVariantConfidenceScore;
}

- (void)setHasLanguageVariantName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageVariantName, 0);
}

@end
