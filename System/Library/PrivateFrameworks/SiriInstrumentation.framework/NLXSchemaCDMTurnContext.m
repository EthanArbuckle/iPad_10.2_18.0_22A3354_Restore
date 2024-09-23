@implementation NLXSchemaCDMTurnContext

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
  v13.super_class = (Class)NLXSchemaCDMTurnContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaCDMTurnContext nlContext](self, "nlContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLXSchemaCDMTurnContext deleteNlContext](self, "deleteNlContext");
  -[NLXSchemaCDMTurnContext legacyNlContext](self, "legacyNlContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NLXSchemaCDMTurnContext deleteLegacyNlContext](self, "deleteLegacyNlContext");

  return v5;
}

- (void)setNlContext:(id)a3
{
  NLXSchemaCDMNLContext *v4;
  NLXSchemaNLXLegacyNLContext *legacyNlContext;
  NLXSchemaCDMNLContext *nlContext;

  v4 = (NLXSchemaCDMNLContext *)a3;
  legacyNlContext = self->_legacyNlContext;
  self->_legacyNlContext = 0;

  self->_whichTurncontexttype = v4 != 0;
  nlContext = self->_nlContext;
  self->_nlContext = v4;

}

- (NLXSchemaCDMNLContext)nlContext
{
  if (self->_whichTurncontexttype == 1)
    return self->_nlContext;
  else
    return (NLXSchemaCDMNLContext *)0;
}

- (void)deleteNlContext
{
  NLXSchemaCDMNLContext *nlContext;

  if (self->_whichTurncontexttype == 1)
  {
    self->_whichTurncontexttype = 0;
    nlContext = self->_nlContext;
    self->_nlContext = 0;

  }
}

- (void)setLegacyNlContext:(id)a3
{
  NLXSchemaNLXLegacyNLContext *v4;
  NLXSchemaCDMNLContext *nlContext;
  NLXSchemaNLXLegacyNLContext *legacyNlContext;

  v4 = (NLXSchemaNLXLegacyNLContext *)a3;
  nlContext = self->_nlContext;
  self->_nlContext = 0;

  self->_whichTurncontexttype = 2 * (v4 != 0);
  legacyNlContext = self->_legacyNlContext;
  self->_legacyNlContext = v4;

}

- (NLXSchemaNLXLegacyNLContext)legacyNlContext
{
  if (self->_whichTurncontexttype == 2)
    return self->_legacyNlContext;
  else
    return (NLXSchemaNLXLegacyNLContext *)0;
}

- (void)deleteLegacyNlContext
{
  NLXSchemaNLXLegacyNLContext *legacyNlContext;

  if (self->_whichTurncontexttype == 2)
  {
    self->_whichTurncontexttype = 0;
    legacyNlContext = self->_legacyNlContext;
    self->_legacyNlContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMTurnContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NLXSchemaCDMTurnContext nlContext](self, "nlContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLXSchemaCDMTurnContext nlContext](self, "nlContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMTurnContext legacyNlContext](self, "legacyNlContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NLXSchemaCDMTurnContext legacyNlContext](self, "legacyNlContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichTurncontexttype;
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
  whichTurncontexttype = self->_whichTurncontexttype;
  if (whichTurncontexttype != objc_msgSend(v4, "whichTurncontexttype"))
    goto LABEL_13;
  -[NLXSchemaCDMTurnContext nlContext](self, "nlContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[NLXSchemaCDMTurnContext nlContext](self, "nlContext");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NLXSchemaCDMTurnContext nlContext](self, "nlContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nlContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[NLXSchemaCDMTurnContext legacyNlContext](self, "legacyNlContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legacyNlContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[NLXSchemaCDMTurnContext legacyNlContext](self, "legacyNlContext");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[NLXSchemaCDMTurnContext legacyNlContext](self, "legacyNlContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "legacyNlContext");
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

  v3 = -[NLXSchemaCDMNLContext hash](self->_nlContext, "hash");
  return -[NLXSchemaNLXLegacyNLContext hash](self->_legacyNlContext, "hash") ^ v3;
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
  if (self->_legacyNlContext)
  {
    -[NLXSchemaCDMTurnContext legacyNlContext](self, "legacyNlContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("legacyNlContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("legacyNlContext"));

    }
  }
  if (self->_nlContext)
  {
    -[NLXSchemaCDMTurnContext nlContext](self, "nlContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("nlContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("nlContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMTurnContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMTurnContext)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMTurnContext *v5;
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
    self = -[NLXSchemaCDMTurnContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMTurnContext)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMTurnContext *v5;
  void *v6;
  NLXSchemaCDMNLContext *v7;
  void *v8;
  NLXSchemaNLXLegacyNLContext *v9;
  NLXSchemaCDMTurnContext *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaCDMTurnContext;
  v5 = -[NLXSchemaCDMTurnContext init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nlContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[NLXSchemaCDMNLContext initWithDictionary:]([NLXSchemaCDMNLContext alloc], "initWithDictionary:", v6);
      -[NLXSchemaCDMTurnContext setNlContext:](v5, "setNlContext:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("legacyNlContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[NLXSchemaNLXLegacyNLContext initWithDictionary:]([NLXSchemaNLXLegacyNLContext alloc], "initWithDictionary:", v8);
      -[NLXSchemaCDMTurnContext setLegacyNlContext:](v5, "setLegacyNlContext:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichTurncontexttype
{
  return self->_whichTurncontexttype;
}

- (BOOL)hasNlContext
{
  return self->_hasNlContext;
}

- (void)setHasNlContext:(BOOL)a3
{
  self->_hasNlContext = a3;
}

- (BOOL)hasLegacyNlContext
{
  return self->_hasLegacyNlContext;
}

- (void)setHasLegacyNlContext:(BOOL)a3
{
  self->_hasLegacyNlContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyNlContext, 0);
  objc_storeStrong((id *)&self->_nlContext, 0);
}

@end
