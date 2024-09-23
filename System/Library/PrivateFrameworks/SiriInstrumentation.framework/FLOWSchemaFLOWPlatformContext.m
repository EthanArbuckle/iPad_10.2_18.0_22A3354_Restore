@implementation FLOWSchemaFLOWPlatformContext

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
  v13.super_class = (Class)FLOWSchemaFLOWPlatformContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWPlatformContext entityContext](self, "entityContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWPlatformContext deleteEntityContext](self, "deleteEntityContext");
  -[FLOWSchemaFLOWPlatformContext entityContextValue](self, "entityContextValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWSchemaFLOWPlatformContext deleteEntityContextValue](self, "deleteEntityContextValue");

  return v5;
}

- (void)setEntityContext:(id)a3
{
  self->_whichPlatformcontext = a3 != 0;
  objc_storeStrong((id *)&self->_entityContext, a3);
}

- (FLOWSchemaFLOWEntityContext)entityContext
{
  if (self->_whichPlatformcontext == 1)
    return self->_entityContext;
  else
    return (FLOWSchemaFLOWEntityContext *)0;
}

- (void)deleteEntityContext
{
  FLOWSchemaFLOWEntityContext *entityContext;

  if (self->_whichPlatformcontext == 1)
  {
    self->_whichPlatformcontext = 0;
    entityContext = self->_entityContext;
    self->_entityContext = 0;

  }
}

- (BOOL)hasEntityContextValue
{
  return self->_entityContextValue != 0;
}

- (void)deleteEntityContextValue
{
  -[FLOWSchemaFLOWPlatformContext setEntityContextValue:](self, "setEntityContextValue:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWPlatformContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[FLOWSchemaFLOWPlatformContext entityContext](self, "entityContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FLOWSchemaFLOWPlatformContext entityContext](self, "entityContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWPlatformContext entityContextValue](self, "entityContextValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FLOWSchemaFLOWPlatformContext entityContextValue](self, "entityContextValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichPlatformcontext;
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
  whichPlatformcontext = self->_whichPlatformcontext;
  if (whichPlatformcontext != objc_msgSend(v4, "whichPlatformcontext"))
    goto LABEL_13;
  -[FLOWSchemaFLOWPlatformContext entityContext](self, "entityContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[FLOWSchemaFLOWPlatformContext entityContext](self, "entityContext");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[FLOWSchemaFLOWPlatformContext entityContext](self, "entityContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[FLOWSchemaFLOWPlatformContext entityContextValue](self, "entityContextValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityContextValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[FLOWSchemaFLOWPlatformContext entityContextValue](self, "entityContextValue");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[FLOWSchemaFLOWPlatformContext entityContextValue](self, "entityContextValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityContextValue");
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

  v3 = -[FLOWSchemaFLOWEntityContext hash](self->_entityContext, "hash");
  return -[FLOWSchemaFLOWEntityContext hash](self->_entityContextValue, "hash") ^ v3;
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
  if (self->_entityContext)
  {
    -[FLOWSchemaFLOWPlatformContext entityContext](self, "entityContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("entityContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("entityContext"));

    }
  }
  if (self->_entityContextValue)
  {
    -[FLOWSchemaFLOWPlatformContext entityContextValue](self, "entityContextValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("entityContextValue"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("entityContextValue"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWPlatformContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWPlatformContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWPlatformContext *v5;
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
    self = -[FLOWSchemaFLOWPlatformContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWPlatformContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWPlatformContext *v5;
  void *v6;
  FLOWSchemaFLOWEntityContext *v7;
  void *v8;
  FLOWSchemaFLOWEntityContext *v9;
  FLOWSchemaFLOWPlatformContext *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLOWSchemaFLOWPlatformContext;
  v5 = -[FLOWSchemaFLOWPlatformContext init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[FLOWSchemaFLOWEntityContext initWithDictionary:]([FLOWSchemaFLOWEntityContext alloc], "initWithDictionary:", v6);
      -[FLOWSchemaFLOWPlatformContext setEntityContext:](v5, "setEntityContext:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityContextValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[FLOWSchemaFLOWEntityContext initWithDictionary:]([FLOWSchemaFLOWEntityContext alloc], "initWithDictionary:", v8);
      -[FLOWSchemaFLOWPlatformContext setEntityContextValue:](v5, "setEntityContextValue:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichPlatformcontext
{
  return self->_whichPlatformcontext;
}

- (FLOWSchemaFLOWEntityContext)entityContextValue
{
  return self->_entityContextValue;
}

- (void)setEntityContextValue:(id)a3
{
  objc_storeStrong((id *)&self->_entityContextValue, a3);
}

- (BOOL)hasEntityContext
{
  return self->_hasEntityContext;
}

- (void)setHasEntityContext:(BOOL)a3
{
  self->_hasEntityContext = a3;
}

- (void)setHasEntityContextValue:(BOOL)a3
{
  self->_hasEntityContextValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityContextValue, 0);
  objc_storeStrong((id *)&self->_entityContext, 0);
}

@end
