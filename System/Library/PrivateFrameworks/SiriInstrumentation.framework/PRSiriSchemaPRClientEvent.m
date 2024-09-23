@implementation PRSiriSchemaPRClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[PRSiriSchemaPRClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ifRequestId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  objc_msgSend(v3, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v4 = v3;
      goto LABEL_6;
    }
LABEL_5:
    v4 = 0;
  }
LABEL_6:

  return v4;
}

- (int)componentName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[PRSiriSchemaPRClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ifRequestId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");

      if (v6)
        LODWORD(v4) = 45;
      else
        LODWORD(v4) = 0;
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }

  return (int)v4;
}

+ (int)joinability
{
  return 2;
}

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
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PRSiriSchemaPRClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSiriSchemaPRClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PRSiriSchemaPRClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[PRSiriSchemaPRClientEvent requestContext](self, "requestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PRSiriSchemaPRClientEvent deleteRequestContext](self, "deleteRequestContext");
  -[PRSiriSchemaPRClientEvent rgRequestContext](self, "rgRequestContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PRSiriSchemaPRClientEvent deleteRgRequestContext](self, "deleteRgRequestContext");
  -[PRSiriSchemaPRClientEvent jrCallContext](self, "jrCallContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PRSiriSchemaPRClientEvent deleteJrCallContext](self, "deleteJrCallContext");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[PRSiriSchemaPRClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 10 > 2)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E562AA18[v3 - 10]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 10 > 2)
    return 0;
  else
    return off_1E562AA30[a3 - 10];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[PRSiriSchemaPRClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 10 > 2)
    return CFSTR("com.apple.aiml.siri.pr.PRClientEvent");
  else
    return off_1E563D8F0[v2 - 10];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[PRSiriSchemaPRClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setRequestContext:(id)a3
{
  PRSiriSchemaPRRequestContext *v4;
  PRSiriSchemaPRResponseGenerationRequestContext *rgRequestContext;
  PRSiriSchemaPRJointResolverCallContext *jrCallContext;
  unint64_t v7;
  PRSiriSchemaPRRequestContext *requestContext;

  v4 = (PRSiriSchemaPRRequestContext *)a3;
  rgRequestContext = self->_rgRequestContext;
  self->_rgRequestContext = 0;

  jrCallContext = self->_jrCallContext;
  self->_jrCallContext = 0;

  v7 = 10;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  requestContext = self->_requestContext;
  self->_requestContext = v4;

}

- (PRSiriSchemaPRRequestContext)requestContext
{
  if (self->_whichEvent_Type == 10)
    return self->_requestContext;
  else
    return (PRSiriSchemaPRRequestContext *)0;
}

- (void)deleteRequestContext
{
  PRSiriSchemaPRRequestContext *requestContext;

  if (self->_whichEvent_Type == 10)
  {
    self->_whichEvent_Type = 0;
    requestContext = self->_requestContext;
    self->_requestContext = 0;

  }
}

- (void)setRgRequestContext:(id)a3
{
  PRSiriSchemaPRResponseGenerationRequestContext *v4;
  PRSiriSchemaPRRequestContext *requestContext;
  PRSiriSchemaPRJointResolverCallContext *jrCallContext;
  unint64_t v7;
  PRSiriSchemaPRResponseGenerationRequestContext *rgRequestContext;

  v4 = (PRSiriSchemaPRResponseGenerationRequestContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  jrCallContext = self->_jrCallContext;
  self->_jrCallContext = 0;

  v7 = 11;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  rgRequestContext = self->_rgRequestContext;
  self->_rgRequestContext = v4;

}

- (PRSiriSchemaPRResponseGenerationRequestContext)rgRequestContext
{
  if (self->_whichEvent_Type == 11)
    return self->_rgRequestContext;
  else
    return (PRSiriSchemaPRResponseGenerationRequestContext *)0;
}

- (void)deleteRgRequestContext
{
  PRSiriSchemaPRResponseGenerationRequestContext *rgRequestContext;

  if (self->_whichEvent_Type == 11)
  {
    self->_whichEvent_Type = 0;
    rgRequestContext = self->_rgRequestContext;
    self->_rgRequestContext = 0;

  }
}

- (void)setJrCallContext:(id)a3
{
  PRSiriSchemaPRJointResolverCallContext *v4;
  PRSiriSchemaPRRequestContext *requestContext;
  PRSiriSchemaPRResponseGenerationRequestContext *rgRequestContext;
  unint64_t v7;
  PRSiriSchemaPRJointResolverCallContext *jrCallContext;

  v4 = (PRSiriSchemaPRJointResolverCallContext *)a3;
  requestContext = self->_requestContext;
  self->_requestContext = 0;

  rgRequestContext = self->_rgRequestContext;
  self->_rgRequestContext = 0;

  v7 = 12;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  jrCallContext = self->_jrCallContext;
  self->_jrCallContext = v4;

}

- (PRSiriSchemaPRJointResolverCallContext)jrCallContext
{
  if (self->_whichEvent_Type == 12)
    return self->_jrCallContext;
  else
    return (PRSiriSchemaPRJointResolverCallContext *)0;
}

- (void)deleteJrCallContext
{
  PRSiriSchemaPRJointResolverCallContext *jrCallContext;

  if (self->_whichEvent_Type == 12)
  {
    self->_whichEvent_Type = 0;
    jrCallContext = self->_jrCallContext;
    self->_jrCallContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return PRSiriSchemaPRClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[PRSiriSchemaPRClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PRSiriSchemaPRClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PRSiriSchemaPRClientEvent requestContext](self, "requestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PRSiriSchemaPRClientEvent requestContext](self, "requestContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PRSiriSchemaPRClientEvent rgRequestContext](self, "rgRequestContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PRSiriSchemaPRClientEvent rgRequestContext](self, "rgRequestContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PRSiriSchemaPRClientEvent jrCallContext](self, "jrCallContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PRSiriSchemaPRClientEvent jrCallContext](self, "jrCallContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichEvent_Type;
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
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_23;
  -[PRSiriSchemaPRClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[PRSiriSchemaPRClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PRSiriSchemaPRClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_23;
  }
  else
  {

  }
  -[PRSiriSchemaPRClientEvent requestContext](self, "requestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[PRSiriSchemaPRClientEvent requestContext](self, "requestContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PRSiriSchemaPRClientEvent requestContext](self, "requestContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[PRSiriSchemaPRClientEvent rgRequestContext](self, "rgRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rgRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[PRSiriSchemaPRClientEvent rgRequestContext](self, "rgRequestContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[PRSiriSchemaPRClientEvent rgRequestContext](self, "rgRequestContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rgRequestContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[PRSiriSchemaPRClientEvent jrCallContext](self, "jrCallContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jrCallContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[PRSiriSchemaPRClientEvent jrCallContext](self, "jrCallContext");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_26:
      v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    -[PRSiriSchemaPRClientEvent jrCallContext](self, "jrCallContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jrCallContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_26;
  }
  else
  {
LABEL_22:

  }
LABEL_23:
  v28 = 0;
LABEL_24:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[PRSiriSchemaPRClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[PRSiriSchemaPRRequestContext hash](self->_requestContext, "hash") ^ v3;
  v5 = -[PRSiriSchemaPRResponseGenerationRequestContext hash](self->_rgRequestContext, "hash");
  return v4 ^ v5 ^ -[PRSiriSchemaPRJointResolverCallContext hash](self->_jrCallContext, "hash");
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventMetadata)
  {
    -[PRSiriSchemaPRClientEvent eventMetadata](self, "eventMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventMetadata"));

    }
  }
  if (self->_jrCallContext)
  {
    -[PRSiriSchemaPRClientEvent jrCallContext](self, "jrCallContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("jrCallContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("jrCallContext"));

    }
  }
  if (self->_requestContext)
  {
    -[PRSiriSchemaPRClientEvent requestContext](self, "requestContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("requestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("requestContext"));

    }
  }
  if (self->_rgRequestContext)
  {
    -[PRSiriSchemaPRClientEvent rgRequestContext](self, "rgRequestContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("rgRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("rgRequestContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PRSiriSchemaPRClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PRSiriSchemaPRClientEvent)initWithJSON:(id)a3
{
  void *v4;
  PRSiriSchemaPRClientEvent *v5;
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
    self = -[PRSiriSchemaPRClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PRSiriSchemaPRClientEvent)initWithDictionary:(id)a3
{
  id v4;
  PRSiriSchemaPRClientEvent *v5;
  void *v6;
  PRSiriSchemaPRClientEventMetadata *v7;
  void *v8;
  PRSiriSchemaPRRequestContext *v9;
  void *v10;
  PRSiriSchemaPRResponseGenerationRequestContext *v11;
  void *v12;
  PRSiriSchemaPRJointResolverCallContext *v13;
  PRSiriSchemaPRClientEvent *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PRSiriSchemaPRClientEvent;
  v5 = -[PRSiriSchemaPRClientEvent init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PRSiriSchemaPRClientEventMetadata initWithDictionary:]([PRSiriSchemaPRClientEventMetadata alloc], "initWithDictionary:", v6);
      -[PRSiriSchemaPRClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PRSiriSchemaPRRequestContext initWithDictionary:]([PRSiriSchemaPRRequestContext alloc], "initWithDictionary:", v8);
      -[PRSiriSchemaPRClientEvent setRequestContext:](v5, "setRequestContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rgRequestContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PRSiriSchemaPRResponseGenerationRequestContext initWithDictionary:]([PRSiriSchemaPRResponseGenerationRequestContext alloc], "initWithDictionary:", v10);
      -[PRSiriSchemaPRClientEvent setRgRequestContext:](v5, "setRgRequestContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jrCallContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[PRSiriSchemaPRJointResolverCallContext initWithDictionary:]([PRSiriSchemaPRJointResolverCallContext alloc], "initWithDictionary:", v12);
      -[PRSiriSchemaPRClientEvent setJrCallContext:](v5, "setJrCallContext:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (PRSiriSchemaPRClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (void)setEventMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetadata, a3);
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (BOOL)hasRequestContext
{
  return self->_hasRequestContext;
}

- (void)setHasRequestContext:(BOOL)a3
{
  self->_hasRequestContext = a3;
}

- (BOOL)hasRgRequestContext
{
  return self->_hasRgRequestContext;
}

- (void)setHasRgRequestContext:(BOOL)a3
{
  self->_hasRgRequestContext = a3;
}

- (BOOL)hasJrCallContext
{
  return self->_hasJrCallContext;
}

- (void)setHasJrCallContext:(BOOL)a3
{
  self->_hasJrCallContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jrCallContext, 0);
  objc_storeStrong((id *)&self->_rgRequestContext, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 94;
}

@end
