@implementation IDENTITYSchemaIDENTITYScoreCardsGenerated

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
  v13.super_class = (Class)IDENTITYSchemaIDENTITYScoreCardsGenerated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDENTITYSchemaIDENTITYScoreCardsGenerated voiceScoreCard](self, "voiceScoreCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IDENTITYSchemaIDENTITYScoreCardsGenerated deleteVoiceScoreCard](self, "deleteVoiceScoreCard");
  -[IDENTITYSchemaIDENTITYScoreCardsGenerated identityScoreCard](self, "identityScoreCard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IDENTITYSchemaIDENTITYScoreCardsGenerated deleteIdentityScoreCard](self, "deleteIdentityScoreCard");

  return v5;
}

- (BOOL)hasVoiceScoreCard
{
  return self->_voiceScoreCard != 0;
}

- (void)deleteVoiceScoreCard
{
  -[IDENTITYSchemaIDENTITYScoreCardsGenerated setVoiceScoreCard:](self, "setVoiceScoreCard:", 0);
}

- (BOOL)hasIdentityScoreCard
{
  return self->_identityScoreCard != 0;
}

- (void)deleteIdentityScoreCard
{
  -[IDENTITYSchemaIDENTITYScoreCardsGenerated setIdentityScoreCard:](self, "setIdentityScoreCard:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return IDENTITYSchemaIDENTITYScoreCardsGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[IDENTITYSchemaIDENTITYScoreCardsGenerated voiceScoreCard](self, "voiceScoreCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IDENTITYSchemaIDENTITYScoreCardsGenerated voiceScoreCard](self, "voiceScoreCard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IDENTITYSchemaIDENTITYScoreCardsGenerated identityScoreCard](self, "identityScoreCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IDENTITYSchemaIDENTITYScoreCardsGenerated identityScoreCard](self, "identityScoreCard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[IDENTITYSchemaIDENTITYScoreCardsGenerated voiceScoreCard](self, "voiceScoreCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceScoreCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[IDENTITYSchemaIDENTITYScoreCardsGenerated voiceScoreCard](self, "voiceScoreCard");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[IDENTITYSchemaIDENTITYScoreCardsGenerated voiceScoreCard](self, "voiceScoreCard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceScoreCard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[IDENTITYSchemaIDENTITYScoreCardsGenerated identityScoreCard](self, "identityScoreCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityScoreCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[IDENTITYSchemaIDENTITYScoreCardsGenerated identityScoreCard](self, "identityScoreCard");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[IDENTITYSchemaIDENTITYScoreCardsGenerated identityScoreCard](self, "identityScoreCard");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identityScoreCard");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[IDENTITYSchemaIDENTITYVoiceScoreCard hash](self->_voiceScoreCard, "hash");
  return -[IDENTITYSchemaIDENTITYIDScoreCard hash](self->_identityScoreCard, "hash") ^ v3;
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
  if (self->_identityScoreCard)
  {
    -[IDENTITYSchemaIDENTITYScoreCardsGenerated identityScoreCard](self, "identityScoreCard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identityScoreCard"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("identityScoreCard"));

    }
  }
  if (self->_voiceScoreCard)
  {
    -[IDENTITYSchemaIDENTITYScoreCardsGenerated voiceScoreCard](self, "voiceScoreCard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("voiceScoreCard"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("voiceScoreCard"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IDENTITYSchemaIDENTITYScoreCardsGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IDENTITYSchemaIDENTITYScoreCardsGenerated)initWithJSON:(id)a3
{
  void *v4;
  IDENTITYSchemaIDENTITYScoreCardsGenerated *v5;
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
    self = -[IDENTITYSchemaIDENTITYScoreCardsGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IDENTITYSchemaIDENTITYScoreCardsGenerated)initWithDictionary:(id)a3
{
  id v4;
  IDENTITYSchemaIDENTITYScoreCardsGenerated *v5;
  void *v6;
  IDENTITYSchemaIDENTITYVoiceScoreCard *v7;
  void *v8;
  IDENTITYSchemaIDENTITYIDScoreCard *v9;
  IDENTITYSchemaIDENTITYScoreCardsGenerated *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDENTITYSchemaIDENTITYScoreCardsGenerated;
  v5 = -[IDENTITYSchemaIDENTITYScoreCardsGenerated init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceScoreCard"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IDENTITYSchemaIDENTITYVoiceScoreCard initWithDictionary:]([IDENTITYSchemaIDENTITYVoiceScoreCard alloc], "initWithDictionary:", v6);
      -[IDENTITYSchemaIDENTITYScoreCardsGenerated setVoiceScoreCard:](v5, "setVoiceScoreCard:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identityScoreCard"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IDENTITYSchemaIDENTITYIDScoreCard initWithDictionary:]([IDENTITYSchemaIDENTITYIDScoreCard alloc], "initWithDictionary:", v8);
      -[IDENTITYSchemaIDENTITYScoreCardsGenerated setIdentityScoreCard:](v5, "setIdentityScoreCard:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (IDENTITYSchemaIDENTITYVoiceScoreCard)voiceScoreCard
{
  return self->_voiceScoreCard;
}

- (void)setVoiceScoreCard:(id)a3
{
  objc_storeStrong((id *)&self->_voiceScoreCard, a3);
}

- (IDENTITYSchemaIDENTITYIDScoreCard)identityScoreCard
{
  return self->_identityScoreCard;
}

- (void)setIdentityScoreCard:(id)a3
{
  objc_storeStrong((id *)&self->_identityScoreCard, a3);
}

- (void)setHasVoiceScoreCard:(BOOL)a3
{
  self->_hasVoiceScoreCard = a3;
}

- (void)setHasIdentityScoreCard:(BOOL)a3
{
  self->_hasIdentityScoreCard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityScoreCard, 0);
  objc_storeStrong((id *)&self->_voiceScoreCard, 0);
}

@end
