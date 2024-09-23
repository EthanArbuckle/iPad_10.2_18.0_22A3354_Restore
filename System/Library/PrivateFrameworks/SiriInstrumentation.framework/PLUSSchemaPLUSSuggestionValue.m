@implementation PLUSSchemaPLUSSuggestionValue

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLUSSchemaPLUSSuggestionValue;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSSuggestionValue universalSuggestion](self, "universalSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSSuggestionValue deleteUniversalSuggestion](self, "deleteUniversalSuggestion");
  -[PLUSSchemaPLUSSuggestionValue mediaSuggestion](self, "mediaSuggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PLUSSchemaPLUSSuggestionValue deleteMediaSuggestion](self, "deleteMediaSuggestion");

  return v5;
}

- (void)setUniversalSuggestion:(id)a3
{
  PLUSSchemaPLUSUniversalSuggestion *v4;
  PLUSSchemaPLUSMediaSuggestion *mediaSuggestion;
  unint64_t v6;
  PLUSSchemaPLUSUniversalSuggestion *universalSuggestion;

  v4 = (PLUSSchemaPLUSUniversalSuggestion *)a3;
  mediaSuggestion = self->_mediaSuggestion;
  self->_mediaSuggestion = 0;

  v6 = 100;
  if (!v4)
    v6 = 0;
  self->_whichSuggestion = v6;
  universalSuggestion = self->_universalSuggestion;
  self->_universalSuggestion = v4;

}

- (PLUSSchemaPLUSUniversalSuggestion)universalSuggestion
{
  if (self->_whichSuggestion == 100)
    return self->_universalSuggestion;
  else
    return (PLUSSchemaPLUSUniversalSuggestion *)0;
}

- (void)deleteUniversalSuggestion
{
  PLUSSchemaPLUSUniversalSuggestion *universalSuggestion;

  if (self->_whichSuggestion == 100)
  {
    self->_whichSuggestion = 0;
    universalSuggestion = self->_universalSuggestion;
    self->_universalSuggestion = 0;

  }
}

- (void)setMediaSuggestion:(id)a3
{
  PLUSSchemaPLUSMediaSuggestion *v4;
  PLUSSchemaPLUSUniversalSuggestion *universalSuggestion;
  unint64_t v6;
  PLUSSchemaPLUSMediaSuggestion *mediaSuggestion;

  v4 = (PLUSSchemaPLUSMediaSuggestion *)a3;
  universalSuggestion = self->_universalSuggestion;
  self->_universalSuggestion = 0;

  v6 = 101;
  if (!v4)
    v6 = 0;
  self->_whichSuggestion = v6;
  mediaSuggestion = self->_mediaSuggestion;
  self->_mediaSuggestion = v4;

}

- (PLUSSchemaPLUSMediaSuggestion)mediaSuggestion
{
  if (self->_whichSuggestion == 101)
    return self->_mediaSuggestion;
  else
    return (PLUSSchemaPLUSMediaSuggestion *)0;
}

- (void)deleteMediaSuggestion
{
  PLUSSchemaPLUSMediaSuggestion *mediaSuggestion;

  if (self->_whichSuggestion == 101)
  {
    self->_whichSuggestion = 0;
    mediaSuggestion = self->_mediaSuggestion;
    self->_mediaSuggestion = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggestionValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PLUSSchemaPLUSSuggestionValue universalSuggestion](self, "universalSuggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSSuggestionValue universalSuggestion](self, "universalSuggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PLUSSchemaPLUSSuggestionValue mediaSuggestion](self, "mediaSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLUSSchemaPLUSSuggestionValue mediaSuggestion](self, "mediaSuggestion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichSuggestion;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  whichSuggestion = self->_whichSuggestion;
  if (whichSuggestion != objc_msgSend(v4, "whichSuggestion"))
    goto LABEL_13;
  -[PLUSSchemaPLUSSuggestionValue universalSuggestion](self, "universalSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalSuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[PLUSSchemaPLUSSuggestionValue universalSuggestion](self, "universalSuggestion");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PLUSSchemaPLUSSuggestionValue universalSuggestion](self, "universalSuggestion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "universalSuggestion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[PLUSSchemaPLUSSuggestionValue mediaSuggestion](self, "mediaSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaSuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[PLUSSchemaPLUSSuggestionValue mediaSuggestion](self, "mediaSuggestion");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[PLUSSchemaPLUSSuggestionValue mediaSuggestion](self, "mediaSuggestion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaSuggestion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
LABEL_12:

  }
LABEL_13:
  v18 = 0;
LABEL_14:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[PLUSSchemaPLUSUniversalSuggestion hash](self->_universalSuggestion, "hash");
  return -[PLUSSchemaPLUSMediaSuggestion hash](self->_mediaSuggestion, "hash") ^ v3;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_mediaSuggestion)
  {
    -[PLUSSchemaPLUSSuggestionValue mediaSuggestion](self, "mediaSuggestion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("mediaSuggestion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("mediaSuggestion"));

    }
  }
  if (self->_universalSuggestion)
  {
    -[PLUSSchemaPLUSSuggestionValue universalSuggestion](self, "universalSuggestion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("universalSuggestion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("universalSuggestion"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSSuggestionValue dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSSuggestionValue)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSSuggestionValue *v5;
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
    self = -[PLUSSchemaPLUSSuggestionValue initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSSuggestionValue)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSSuggestionValue *v5;
  void *v6;
  PLUSSchemaPLUSUniversalSuggestion *v7;
  void *v8;
  PLUSSchemaPLUSMediaSuggestion *v9;
  PLUSSchemaPLUSSuggestionValue *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSSuggestionValue;
  v5 = -[PLUSSchemaPLUSSuggestionValue init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("universalSuggestion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PLUSSchemaPLUSUniversalSuggestion initWithDictionary:]([PLUSSchemaPLUSUniversalSuggestion alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSSuggestionValue setUniversalSuggestion:](v5, "setUniversalSuggestion:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaSuggestion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PLUSSchemaPLUSMediaSuggestion initWithDictionary:]([PLUSSchemaPLUSMediaSuggestion alloc], "initWithDictionary:", v8);
      -[PLUSSchemaPLUSSuggestionValue setMediaSuggestion:](v5, "setMediaSuggestion:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichSuggestion
{
  return self->_whichSuggestion;
}

- (BOOL)hasUniversalSuggestion
{
  return self->_hasUniversalSuggestion;
}

- (void)setHasUniversalSuggestion:(BOOL)a3
{
  self->_hasUniversalSuggestion = a3;
}

- (BOOL)hasMediaSuggestion
{
  return self->_hasMediaSuggestion;
}

- (void)setHasMediaSuggestion:(BOOL)a3
{
  self->_hasMediaSuggestion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSuggestion, 0);
  objc_storeStrong((id *)&self->_universalSuggestion, 0);
}

@end
