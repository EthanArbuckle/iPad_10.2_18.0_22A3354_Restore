@implementation PSESchemaPSECallSignalGenerated

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
  v13.super_class = (Class)PSESchemaPSECallSignalGenerated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSESchemaPSECallSignalGenerated commonSignal](self, "commonSignal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PSESchemaPSECallSignalGenerated deleteCommonSignal](self, "deleteCommonSignal");
  -[PSESchemaPSECallSignalGenerated callSignal](self, "callSignal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PSESchemaPSECallSignalGenerated deleteCallSignal](self, "deleteCallSignal");

  return v5;
}

- (BOOL)hasCommonSignal
{
  return self->_commonSignal != 0;
}

- (void)deleteCommonSignal
{
  -[PSESchemaPSECallSignalGenerated setCommonSignal:](self, "setCommonSignal:", 0);
}

- (BOOL)hasCallSignal
{
  return self->_callSignal != 0;
}

- (void)deleteCallSignal
{
  -[PSESchemaPSECallSignalGenerated setCallSignal:](self, "setCallSignal:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PSESchemaPSECallSignalGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PSESchemaPSECallSignalGenerated commonSignal](self, "commonSignal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PSESchemaPSECallSignalGenerated commonSignal](self, "commonSignal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PSESchemaPSECallSignalGenerated callSignal](self, "callSignal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PSESchemaPSECallSignalGenerated callSignal](self, "callSignal");
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
  -[PSESchemaPSECallSignalGenerated commonSignal](self, "commonSignal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonSignal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[PSESchemaPSECallSignalGenerated commonSignal](self, "commonSignal");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PSESchemaPSECallSignalGenerated commonSignal](self, "commonSignal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commonSignal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[PSESchemaPSECallSignalGenerated callSignal](self, "callSignal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callSignal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PSESchemaPSECallSignalGenerated callSignal](self, "callSignal");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[PSESchemaPSECallSignalGenerated callSignal](self, "callSignal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callSignal");
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

  v3 = -[PSESchemaPSECommonSignal hash](self->_commonSignal, "hash");
  return -[PSESchemaPSECall hash](self->_callSignal, "hash") ^ v3;
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
  if (self->_callSignal)
  {
    -[PSESchemaPSECallSignalGenerated callSignal](self, "callSignal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("callSignal"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("callSignal"));

    }
  }
  if (self->_commonSignal)
  {
    -[PSESchemaPSECallSignalGenerated commonSignal](self, "commonSignal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("commonSignal"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("commonSignal"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PSESchemaPSECallSignalGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PSESchemaPSECallSignalGenerated)initWithJSON:(id)a3
{
  void *v4;
  PSESchemaPSECallSignalGenerated *v5;
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
    self = -[PSESchemaPSECallSignalGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PSESchemaPSECallSignalGenerated)initWithDictionary:(id)a3
{
  id v4;
  PSESchemaPSECallSignalGenerated *v5;
  void *v6;
  PSESchemaPSECommonSignal *v7;
  void *v8;
  PSESchemaPSECall *v9;
  PSESchemaPSECallSignalGenerated *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSESchemaPSECallSignalGenerated;
  v5 = -[PSESchemaPSECallSignalGenerated init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commonSignal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PSESchemaPSECommonSignal initWithDictionary:]([PSESchemaPSECommonSignal alloc], "initWithDictionary:", v6);
      -[PSESchemaPSECallSignalGenerated setCommonSignal:](v5, "setCommonSignal:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("callSignal"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PSESchemaPSECall initWithDictionary:]([PSESchemaPSECall alloc], "initWithDictionary:", v8);
      -[PSESchemaPSECallSignalGenerated setCallSignal:](v5, "setCallSignal:", v9);

    }
    v10 = v5;

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

- (PSESchemaPSECall)callSignal
{
  return self->_callSignal;
}

- (void)setCallSignal:(id)a3
{
  objc_storeStrong((id *)&self->_callSignal, a3);
}

- (void)setHasCommonSignal:(BOOL)a3
{
  self->_hasCommonSignal = a3;
}

- (void)setHasCallSignal:(BOOL)a3
{
  self->_hasCallSignal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callSignal, 0);
  objc_storeStrong((id *)&self->_commonSignal, 0);
}

@end
