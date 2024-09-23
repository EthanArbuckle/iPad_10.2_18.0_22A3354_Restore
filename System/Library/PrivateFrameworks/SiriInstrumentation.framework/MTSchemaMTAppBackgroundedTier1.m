@implementation MTSchemaMTAppBackgroundedTier1

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
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTSchemaMTAppBackgroundedTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[MTSchemaMTAppBackgroundedTier1 deleteTranslationPayload](self, "deleteTranslationPayload");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[MTSchemaMTAppBackgroundedTier1 deleteTranslationPayload](self, "deleteTranslationPayload");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[MTSchemaMTAppBackgroundedTier1 deleteTranslationPayload](self, "deleteTranslationPayload");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[MTSchemaMTAppBackgroundedTier1 deleteTranslationPayload](self, "deleteTranslationPayload");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[MTSchemaMTAppBackgroundedTier1 deleteTranslationPayload](self, "deleteTranslationPayload");
  -[MTSchemaMTAppBackgroundedTier1 localePair](self, "localePair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[MTSchemaMTAppBackgroundedTier1 deleteLocalePair](self, "deleteLocalePair");

  return v5;
}

- (BOOL)hasTranslationPayload
{
  return self->_translationPayload != 0;
}

- (void)deleteTranslationPayload
{
  -[MTSchemaMTAppBackgroundedTier1 setTranslationPayload:](self, "setTranslationPayload:", 0);
}

- (BOOL)hasLocalePair
{
  return self->_localePair != 0;
}

- (void)deleteLocalePair
{
  -[MTSchemaMTAppBackgroundedTier1 setLocalePair:](self, "setLocalePair:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTAppBackgroundedTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MTSchemaMTAppBackgroundedTier1 translationPayload](self, "translationPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[MTSchemaMTAppBackgroundedTier1 localePair](self, "localePair");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MTSchemaMTAppBackgroundedTier1 localePair](self, "localePair");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
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
  -[MTSchemaMTAppBackgroundedTier1 translationPayload](self, "translationPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[MTSchemaMTAppBackgroundedTier1 translationPayload](self, "translationPayload");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[MTSchemaMTAppBackgroundedTier1 translationPayload](self, "translationPayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translationPayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[MTSchemaMTAppBackgroundedTier1 localePair](self, "localePair");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localePair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[MTSchemaMTAppBackgroundedTier1 localePair](self, "localePair");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[MTSchemaMTAppBackgroundedTier1 localePair](self, "localePair");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localePair");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_translationPayload, "hash");
  return -[MTSchemaMTLocalePair hash](self->_localePair, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_localePair)
  {
    -[MTSchemaMTAppBackgroundedTier1 localePair](self, "localePair");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("localePair"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("localePair"));

    }
  }
  if (self->_translationPayload)
  {
    -[MTSchemaMTAppBackgroundedTier1 translationPayload](self, "translationPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("translationPayload"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MTSchemaMTAppBackgroundedTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MTSchemaMTAppBackgroundedTier1)initWithJSON:(id)a3
{
  void *v4;
  MTSchemaMTAppBackgroundedTier1 *v5;
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
    self = -[MTSchemaMTAppBackgroundedTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MTSchemaMTAppBackgroundedTier1)initWithDictionary:(id)a3
{
  id v4;
  MTSchemaMTAppBackgroundedTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  MTSchemaMTLocalePair *v9;
  MTSchemaMTAppBackgroundedTier1 *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTSchemaMTAppBackgroundedTier1;
  v5 = -[MTSchemaMTAppBackgroundedTier1 init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("translationPayload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[MTSchemaMTAppBackgroundedTier1 setTranslationPayload:](v5, "setTranslationPayload:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localePair"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[MTSchemaMTLocalePair initWithDictionary:]([MTSchemaMTLocalePair alloc], "initWithDictionary:", v8);
      -[MTSchemaMTAppBackgroundedTier1 setLocalePair:](v5, "setLocalePair:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (NSString)translationPayload
{
  return self->_translationPayload;
}

- (void)setTranslationPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MTSchemaMTLocalePair)localePair
{
  return self->_localePair;
}

- (void)setLocalePair:(id)a3
{
  objc_storeStrong((id *)&self->_localePair, a3);
}

- (void)setHasTranslationPayload:(BOOL)a3
{
  self->_hasTranslationPayload = a3;
}

- (void)setHasLocalePair:(BOOL)a3
{
  self->_hasLocalePair = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_translationPayload, 0);
}

@end
