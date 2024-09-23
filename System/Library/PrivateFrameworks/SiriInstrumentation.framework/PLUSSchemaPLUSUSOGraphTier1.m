@implementation PLUSSchemaPLUSUSOGraphTier1

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
  v10.super_class = (Class)PLUSSchemaPLUSUSOGraphTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v10, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[PLUSSchemaPLUSUSOGraphTier1 deleteUsoGraphTier1](self, "deleteUsoGraphTier1");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[PLUSSchemaPLUSUSOGraphTier1 deleteUsoGraphTier1](self, "deleteUsoGraphTier1");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[PLUSSchemaPLUSUSOGraphTier1 deleteUsoGraphTier1](self, "deleteUsoGraphTier1");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[PLUSSchemaPLUSUSOGraphTier1 deleteUsoGraphTier1](self, "deleteUsoGraphTier1");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[PLUSSchemaPLUSUSOGraphTier1 deleteUsoGraphTier1](self, "deleteUsoGraphTier1");
  -[PLUSSchemaPLUSUSOGraphTier1 usoGraphTier1](self, "usoGraphTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PLUSSchemaPLUSUSOGraphTier1 deleteUsoGraphTier1](self, "deleteUsoGraphTier1");

  return v5;
}

- (BOOL)hasUsoGraphTier1
{
  return self->_usoGraphTier1 != 0;
}

- (void)deleteUsoGraphTier1
{
  -[PLUSSchemaPLUSUSOGraphTier1 setUsoGraphTier1:](self, "setUsoGraphTier1:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSUSOGraphTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PLUSSchemaPLUSUSOGraphTier1 usoGraphTier1](self, "usoGraphTier1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLUSSchemaPLUSUSOGraphTier1 usoGraphTier1](self, "usoGraphTier1");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[PLUSSchemaPLUSUSOGraphTier1 usoGraphTier1](self, "usoGraphTier1");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "usoGraphTier1");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[PLUSSchemaPLUSUSOGraphTier1 usoGraphTier1](self, "usoGraphTier1");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[PLUSSchemaPLUSUSOGraphTier1 usoGraphTier1](self, "usoGraphTier1");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "usoGraphTier1");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[USOSchemaUSOGraphTier1 hash](self->_usoGraphTier1, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_usoGraphTier1)
  {
    -[PLUSSchemaPLUSUSOGraphTier1 usoGraphTier1](self, "usoGraphTier1");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("usoGraphTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("usoGraphTier1"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSUSOGraphTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSUSOGraphTier1)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSUSOGraphTier1 *v5;
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
    self = -[PLUSSchemaPLUSUSOGraphTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSUSOGraphTier1)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSUSOGraphTier1 *v5;
  void *v6;
  USOSchemaUSOGraphTier1 *v7;
  PLUSSchemaPLUSUSOGraphTier1 *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLUSSchemaPLUSUSOGraphTier1;
  v5 = -[PLUSSchemaPLUSUSOGraphTier1 init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usoGraphTier1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[USOSchemaUSOGraphTier1 initWithDictionary:]([USOSchemaUSOGraphTier1 alloc], "initWithDictionary:", v6);
      -[PLUSSchemaPLUSUSOGraphTier1 setUsoGraphTier1:](v5, "setUsoGraphTier1:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (USOSchemaUSOGraphTier1)usoGraphTier1
{
  return self->_usoGraphTier1;
}

- (void)setUsoGraphTier1:(id)a3
{
  objc_storeStrong((id *)&self->_usoGraphTier1, a3);
}

- (void)setHasUsoGraphTier1:(BOOL)a3
{
  self->_hasUsoGraphTier1 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoGraphTier1, 0);
}

@end
