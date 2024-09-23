@implementation NLGSchemaNLGScoredDialog

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasCatFamily
{
  return self->_catFamily != 0;
}

- (void)deleteCatFamily
{
  -[NLGSchemaNLGScoredDialog setCatFamily:](self, "setCatFamily:", 0);
}

- (BOOL)hasCatIdentifier
{
  return self->_catIdentifier != 0;
}

- (void)deleteCatIdentifier
{
  -[NLGSchemaNLGScoredDialog setCatIdentifier:](self, "setCatIdentifier:", 0);
}

- (BOOL)hasScoredDialogIdentifier
{
  return self->_scoredDialogIdentifier != 0;
}

- (void)deleteScoredDialogIdentifier
{
  -[NLGSchemaNLGScoredDialog setScoredDialogIdentifier:](self, "setScoredDialogIdentifier:", 0);
}

- (void)setScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_score = a3;
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteScore
{
  double v2;

  LODWORD(v2) = 0;
  -[NLGSchemaNLGScoredDialog setScore:](self, "setScore:", v2);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return NLGSchemaNLGScoredDialogReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NLGSchemaNLGScoredDialog catFamily](self, "catFamily");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[NLGSchemaNLGScoredDialog catIdentifier](self, "catIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[NLGSchemaNLGScoredDialog scoredDialogIdentifier](self, "scoredDialogIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  v7 = v8;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  float score;
  float v25;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[NLGSchemaNLGScoredDialog catFamily](self, "catFamily");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "catFamily");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[NLGSchemaNLGScoredDialog catFamily](self, "catFamily");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NLGSchemaNLGScoredDialog catFamily](self, "catFamily");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "catFamily");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[NLGSchemaNLGScoredDialog catIdentifier](self, "catIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "catIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[NLGSchemaNLGScoredDialog catIdentifier](self, "catIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NLGSchemaNLGScoredDialog catIdentifier](self, "catIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "catIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[NLGSchemaNLGScoredDialog scoredDialogIdentifier](self, "scoredDialogIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scoredDialogIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[NLGSchemaNLGScoredDialog scoredDialogIdentifier](self, "scoredDialogIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[NLGSchemaNLGScoredDialog scoredDialogIdentifier](self, "scoredDialogIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scoredDialogIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[36] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0 || (score = self->_score, objc_msgSend(v4, "score"), score == v25))
    {
      v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  float score;
  double v8;
  long double v9;
  double v10;

  v3 = -[NSString hash](self->_catFamily, "hash");
  v4 = -[NSString hash](self->_catIdentifier, "hash");
  v5 = -[NSString hash](self->_scoredDialogIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    score = self->_score;
    v8 = score;
    if (score < 0.0)
      v8 = -score;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_catFamily)
  {
    -[NLGSchemaNLGScoredDialog catFamily](self, "catFamily");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("catFamily"));

  }
  if (self->_catIdentifier)
  {
    -[NLGSchemaNLGScoredDialog catIdentifier](self, "catIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("catIdentifier"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[NLGSchemaNLGScoredDialog score](self, "score");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("score"));

  }
  if (self->_scoredDialogIdentifier)
  {
    -[NLGSchemaNLGScoredDialog scoredDialogIdentifier](self, "scoredDialogIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("scoredDialogIdentifier"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLGSchemaNLGScoredDialog dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLGSchemaNLGScoredDialog)initWithJSON:(id)a3
{
  void *v4;
  NLGSchemaNLGScoredDialog *v5;
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
    self = -[NLGSchemaNLGScoredDialog initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLGSchemaNLGScoredDialog)initWithDictionary:(id)a3
{
  id v4;
  NLGSchemaNLGScoredDialog *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NLGSchemaNLGScoredDialog *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NLGSchemaNLGScoredDialog;
  v5 = -[NLGSchemaNLGScoredDialog init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("catFamily"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[NLGSchemaNLGScoredDialog setCatFamily:](v5, "setCatFamily:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("catIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[NLGSchemaNLGScoredDialog setCatIdentifier:](v5, "setCatIdentifier:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scoredDialogIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[NLGSchemaNLGScoredDialog setScoredDialogIdentifier:](v5, "setScoredDialogIdentifier:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      -[NLGSchemaNLGScoredDialog setScore:](v5, "setScore:");
    }
    v13 = v5;

  }
  return v5;
}

- (NSString)catFamily
{
  return self->_catFamily;
}

- (void)setCatFamily:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)catIdentifier
{
  return self->_catIdentifier;
}

- (void)setCatIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)scoredDialogIdentifier
{
  return self->_scoredDialogIdentifier;
}

- (void)setScoredDialogIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (float)score
{
  return self->_score;
}

- (void)setHasCatFamily:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasCatIdentifier:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasScoredDialogIdentifier:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredDialogIdentifier, 0);
  objc_storeStrong((id *)&self->_catIdentifier, 0);
  objc_storeStrong((id *)&self->_catFamily, 0);
}

@end
