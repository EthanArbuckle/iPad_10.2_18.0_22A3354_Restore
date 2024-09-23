@implementation SetupSchemaProvisionalSiriSetupEvent

- (int)getAnyEventType
{
  return 7;
}

- (BOOL)isProvisional
{
  return 1;
}

- (id)getTypeId
{
  return CFSTR("com.apple.aiml.siri.setup.SiriSetupEvent");
}

- (id)getVersion
{
  return &unk_24EFD6118;
}

- (id)qualifiedMessageName
{
  if (-[SetupSchemaProvisionalSiriSetupEvent whichEvent_Type](self, "whichEvent_Type") == 100)
    return CFSTR("com.apple.aiml.siri.setup.ProvisionalSiriSetupEvent.ProvisionalSiriSetupContext");
  else
    return CFSTR("com.apple.aiml.siri.setup.ProvisionalSiriSetupEvent");
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[SetupSchemaProvisionalSiriSetupEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setSiriSetupContext:(id)a3
{
  unint64_t v3;

  v3 = 100;
  if (!a3)
    v3 = 0;
  self->_whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_siriSetupContext, a3);
}

- (SetupSchemaProvisionalSiriSetupContext)siriSetupContext
{
  if (self->_whichEvent_Type == 100)
    return self->_siriSetupContext;
  else
    return (SetupSchemaProvisionalSiriSetupContext *)0;
}

- (void)deleteSiriSetupContext
{
  SetupSchemaProvisionalSiriSetupContext *siriSetupContext;

  if (self->_whichEvent_Type == 100)
  {
    self->_whichEvent_Type = 0;
    siriSetupContext = self->_siriSetupContext;
    self->_siriSetupContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SetupSchemaProvisionalSiriSetupEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SetupSchemaProvisionalSiriSetupEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SetupSchemaProvisionalSiriSetupEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SetupSchemaProvisionalSiriSetupEvent siriSetupContext](self, "siriSetupContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SetupSchemaProvisionalSiriSetupEvent siriSetupContext](self, "siriSetupContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_13;
  -[SetupSchemaProvisionalSiriSetupEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[SetupSchemaProvisionalSiriSetupEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SetupSchemaProvisionalSiriSetupEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[SetupSchemaProvisionalSiriSetupEvent siriSetupContext](self, "siriSetupContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriSetupContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SetupSchemaProvisionalSiriSetupEvent siriSetupContext](self, "siriSetupContext");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[SetupSchemaProvisionalSiriSetupEvent siriSetupContext](self, "siriSetupContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriSetupContext");
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

  v3 = -[SetupSchemaProvisionalSiriSetupEventMetadata hash](self->_eventMetadata, "hash");
  return -[SetupSchemaProvisionalSiriSetupContext hash](self->_siriSetupContext, "hash") ^ v3;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventMetadata)
  {
    -[SetupSchemaProvisionalSiriSetupEvent eventMetadata](self, "eventMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("eventMetadata"));

    }
  }
  if (self->_siriSetupContext)
  {
    -[SetupSchemaProvisionalSiriSetupEvent siriSetupContext](self, "siriSetupContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("siriSetupContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("siriSetupContext"));

    }
  }
  -[SetupSchemaProvisionalSiriSetupEvent willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SetupSchemaProvisionalSiriSetupEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (SetupSchemaProvisionalSiriSetupEvent)initWithJSON:(id)a3
{
  void *v4;
  SetupSchemaProvisionalSiriSetupEvent *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[SetupSchemaProvisionalSiriSetupEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SetupSchemaProvisionalSiriSetupEvent)initWithDictionary:(id)a3
{
  id v4;
  SetupSchemaProvisionalSiriSetupEvent *v5;
  void *v6;
  SetupSchemaProvisionalSiriSetupEventMetadata *v7;
  void *v8;
  SetupSchemaProvisionalSiriSetupContext *v9;
  SetupSchemaProvisionalSiriSetupEvent *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SetupSchemaProvisionalSiriSetupEvent;
  v5 = -[SetupSchemaProvisionalSiriSetupEvent init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SetupSchemaProvisionalSiriSetupEventMetadata initWithDictionary:]([SetupSchemaProvisionalSiriSetupEventMetadata alloc], "initWithDictionary:", v6);
      -[SetupSchemaProvisionalSiriSetupEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriSetupContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SetupSchemaProvisionalSiriSetupContext initWithDictionary:]([SetupSchemaProvisionalSiriSetupContext alloc], "initWithDictionary:", v8);
      -[SetupSchemaProvisionalSiriSetupEvent setSiriSetupContext:](v5, "setSiriSetupContext:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SetupSchemaProvisionalSiriSetupEventMetadata)eventMetadata
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

- (BOOL)hasSiriSetupContext
{
  return self->_hasSiriSetupContext;
}

- (void)setHasSiriSetupContext:(BOOL)a3
{
  self->_hasSiriSetupContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriSetupContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

@end
