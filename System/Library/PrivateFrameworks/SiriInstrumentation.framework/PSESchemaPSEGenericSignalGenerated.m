@implementation PSESchemaPSEGenericSignalGenerated

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
  v9.super_class = (Class)PSESchemaPSEGenericSignalGenerated;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSESchemaPSEGenericSignalGenerated commonSignal](self, "commonSignal", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PSESchemaPSEGenericSignalGenerated deleteCommonSignal](self, "deleteCommonSignal");
  return v5;
}

- (BOOL)hasCommonSignal
{
  return self->_commonSignal != 0;
}

- (void)deleteCommonSignal
{
  -[PSESchemaPSEGenericSignalGenerated setCommonSignal:](self, "setCommonSignal:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSEGenericSignalGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PSESchemaPSEGenericSignalGenerated commonSignal](self, "commonSignal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PSESchemaPSEGenericSignalGenerated commonSignal](self, "commonSignal");
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
    -[PSESchemaPSEGenericSignalGenerated commonSignal](self, "commonSignal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commonSignal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[PSESchemaPSEGenericSignalGenerated commonSignal](self, "commonSignal");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[PSESchemaPSEGenericSignalGenerated commonSignal](self, "commonSignal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "commonSignal");
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
  return -[PSESchemaPSECommonSignal hash](self->_commonSignal, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_commonSignal)
  {
    -[PSESchemaPSEGenericSignalGenerated commonSignal](self, "commonSignal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("commonSignal"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("commonSignal"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSEGenericSignalGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSEGenericSignalGenerated)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSEGenericSignalGenerated *v5;
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
    self = -[PSESchemaPSEGenericSignalGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSEGenericSignalGenerated)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSEGenericSignalGenerated *v5;
  void *v6;
  PSESchemaPSECommonSignal *v7;
  PSESchemaPSEGenericSignalGenerated *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSESchemaPSEGenericSignalGenerated;
  v5 = -[PSESchemaPSEGenericSignalGenerated init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commonSignal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PSESchemaPSECommonSignal initWithDictionary:]([PSESchemaPSECommonSignal alloc], "initWithDictionary:", v6);
      -[PSESchemaPSEGenericSignalGenerated setCommonSignal:](v5, "setCommonSignal:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (PSESchemaPSECommonSignal)commonSignal
{
  return self->_commonSignal;
}

- (void)setCommonSignal:(id)a3
{
  objc_storeStrong((id *)&self->_commonSignal, a3);
}

- (void)setHasCommonSignal:(BOOL)a3
{
  self->_hasCommonSignal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonSignal, 0);
}

@end
