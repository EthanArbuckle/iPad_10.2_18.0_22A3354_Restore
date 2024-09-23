@implementation IFPlatformRequestSchemaIFPlatformRequestClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent eventMetadata](self, "eventMetadata");
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

  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent eventMetadata](self, "eventMetadata");
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
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IFPlatformRequestSchemaIFPlatformRequestClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFPlatformRequestSchemaIFPlatformRequestClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent ifPlatformRequestContext](self, "ifPlatformRequestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFPlatformRequestSchemaIFPlatformRequestClientEvent deleteIfPlatformRequestContext](self, "deleteIfPlatformRequestContext");
  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent ifPlatformRequestInvoked](self, "ifPlatformRequestInvoked");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[IFPlatformRequestSchemaIFPlatformRequestClientEvent deleteIfPlatformRequestInvoked](self, "deleteIfPlatformRequestInvoked");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  int *v4;
  id v5;

  v3 = -[IFPlatformRequestSchemaIFPlatformRequestClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 == 101)
  {
    v4 = &OBJC_IVAR___IFPlatformRequestSchemaIFPlatformRequestClientEvent__ifPlatformRequestContext;
  }
  else
  {
    if (v3 != 102)
    {
      v5 = 0;
      return (SISchemaInstrumentationMessage *)v5;
    }
    v4 = &OBJC_IVAR___IFPlatformRequestSchemaIFPlatformRequestClientEvent__ifPlatformRequestInvoked;
  }
  v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("ifPlatformRequestInvoked");
  if (a3 != 102)
    v3 = 0;
  if (a3 == 101)
    return CFSTR("ifPlatformRequestContext");
  else
    return (id)v3;
}

- (id)qualifiedMessageName
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[IFPlatformRequestSchemaIFPlatformRequestClientEvent whichEvent_Type](self, "whichEvent_Type");
  v3 = CFSTR("com.apple.aiml.siri.ifPlatformRequest.IFPlatformRequestClientEvent");
  if (v2 == 102)
    v3 = CFSTR("com.apple.aiml.siri.ifPlatformRequest.IFPlatformRequestClientEvent.IFPlatformRequestInvoked");
  if (v2 == 101)
    return CFSTR("com.apple.aiml.siri.ifPlatformRequest.IFPlatformRequestClientEvent.IFPlatformRequestContext");
  else
    return (id)v3;
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setIfPlatformRequestContext:(id)a3
{
  IFPlatformRequestSchemaIFPlatformRequestContext *v4;
  IFPlatformRequestSchemaIFPlatformRequestInvoked *ifPlatformRequestInvoked;
  unint64_t v6;
  IFPlatformRequestSchemaIFPlatformRequestContext *ifPlatformRequestContext;

  v4 = (IFPlatformRequestSchemaIFPlatformRequestContext *)a3;
  ifPlatformRequestInvoked = self->_ifPlatformRequestInvoked;
  self->_ifPlatformRequestInvoked = 0;

  v6 = 101;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  ifPlatformRequestContext = self->_ifPlatformRequestContext;
  self->_ifPlatformRequestContext = v4;

}

- (IFPlatformRequestSchemaIFPlatformRequestContext)ifPlatformRequestContext
{
  if (self->_whichEvent_Type == 101)
    return self->_ifPlatformRequestContext;
  else
    return (IFPlatformRequestSchemaIFPlatformRequestContext *)0;
}

- (void)deleteIfPlatformRequestContext
{
  IFPlatformRequestSchemaIFPlatformRequestContext *ifPlatformRequestContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    ifPlatformRequestContext = self->_ifPlatformRequestContext;
    self->_ifPlatformRequestContext = 0;

  }
}

- (void)setIfPlatformRequestInvoked:(id)a3
{
  IFPlatformRequestSchemaIFPlatformRequestInvoked *v4;
  IFPlatformRequestSchemaIFPlatformRequestContext *ifPlatformRequestContext;
  unint64_t v6;
  IFPlatformRequestSchemaIFPlatformRequestInvoked *ifPlatformRequestInvoked;

  v4 = (IFPlatformRequestSchemaIFPlatformRequestInvoked *)a3;
  ifPlatformRequestContext = self->_ifPlatformRequestContext;
  self->_ifPlatformRequestContext = 0;

  v6 = 102;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  ifPlatformRequestInvoked = self->_ifPlatformRequestInvoked;
  self->_ifPlatformRequestInvoked = v4;

}

- (IFPlatformRequestSchemaIFPlatformRequestInvoked)ifPlatformRequestInvoked
{
  if (self->_whichEvent_Type == 102)
    return self->_ifPlatformRequestInvoked;
  else
    return (IFPlatformRequestSchemaIFPlatformRequestInvoked *)0;
}

- (void)deleteIfPlatformRequestInvoked
{
  IFPlatformRequestSchemaIFPlatformRequestInvoked *ifPlatformRequestInvoked;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    ifPlatformRequestInvoked = self->_ifPlatformRequestInvoked;
    self->_ifPlatformRequestInvoked = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return IFPlatformRequestSchemaIFPlatformRequestClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFPlatformRequestSchemaIFPlatformRequestClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent ifPlatformRequestContext](self, "ifPlatformRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFPlatformRequestSchemaIFPlatformRequestClientEvent ifPlatformRequestContext](self, "ifPlatformRequestContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent ifPlatformRequestInvoked](self, "ifPlatformRequestInvoked");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IFPlatformRequestSchemaIFPlatformRequestClientEvent ifPlatformRequestInvoked](self, "ifPlatformRequestInvoked");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_18;
  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IFPlatformRequestSchemaIFPlatformRequestClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent ifPlatformRequestContext](self, "ifPlatformRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ifPlatformRequestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent ifPlatformRequestContext](self, "ifPlatformRequestContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[IFPlatformRequestSchemaIFPlatformRequestClientEvent ifPlatformRequestContext](self, "ifPlatformRequestContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ifPlatformRequestContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent ifPlatformRequestInvoked](self, "ifPlatformRequestInvoked");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ifPlatformRequestInvoked");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[IFPlatformRequestSchemaIFPlatformRequestClientEvent ifPlatformRequestInvoked](self, "ifPlatformRequestInvoked");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[IFPlatformRequestSchemaIFPlatformRequestClientEvent ifPlatformRequestInvoked](self, "ifPlatformRequestInvoked");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ifPlatformRequestInvoked");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
LABEL_17:

  }
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[IFPlatformRequestSchemaIFPlatformRequestClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[IFPlatformRequestSchemaIFPlatformRequestContext hash](self->_ifPlatformRequestContext, "hash") ^ v3;
  return v4 ^ -[IFPlatformRequestSchemaIFPlatformRequestInvoked hash](self->_ifPlatformRequestInvoked, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventMetadata)
  {
    -[IFPlatformRequestSchemaIFPlatformRequestClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_ifPlatformRequestContext)
  {
    -[IFPlatformRequestSchemaIFPlatformRequestClientEvent ifPlatformRequestContext](self, "ifPlatformRequestContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ifPlatformRequestContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ifPlatformRequestContext"));

    }
  }
  if (self->_ifPlatformRequestInvoked)
  {
    -[IFPlatformRequestSchemaIFPlatformRequestClientEvent ifPlatformRequestInvoked](self, "ifPlatformRequestInvoked");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ifPlatformRequestInvoked"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ifPlatformRequestInvoked"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFPlatformRequestSchemaIFPlatformRequestClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFPlatformRequestSchemaIFPlatformRequestClientEvent)initWithJSON:(id)a3
{
  void *v4;
  IFPlatformRequestSchemaIFPlatformRequestClientEvent *v5;
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
    self = -[IFPlatformRequestSchemaIFPlatformRequestClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFPlatformRequestSchemaIFPlatformRequestClientEvent)initWithDictionary:(id)a3
{
  id v4;
  IFPlatformRequestSchemaIFPlatformRequestClientEvent *v5;
  void *v6;
  IFPlatformRequestSchemaIFPlatformRequestClientEventMetadata *v7;
  void *v8;
  IFPlatformRequestSchemaIFPlatformRequestContext *v9;
  void *v10;
  IFPlatformRequestSchemaIFPlatformRequestInvoked *v11;
  IFPlatformRequestSchemaIFPlatformRequestClientEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IFPlatformRequestSchemaIFPlatformRequestClientEvent;
  v5 = -[IFPlatformRequestSchemaIFPlatformRequestClientEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[IFPlatformRequestSchemaIFPlatformRequestClientEventMetadata initWithDictionary:]([IFPlatformRequestSchemaIFPlatformRequestClientEventMetadata alloc], "initWithDictionary:", v6);
      -[IFPlatformRequestSchemaIFPlatformRequestClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ifPlatformRequestContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[IFPlatformRequestSchemaIFPlatformRequestContext initWithDictionary:]([IFPlatformRequestSchemaIFPlatformRequestContext alloc], "initWithDictionary:", v8);
      -[IFPlatformRequestSchemaIFPlatformRequestClientEvent setIfPlatformRequestContext:](v5, "setIfPlatformRequestContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ifPlatformRequestInvoked"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[IFPlatformRequestSchemaIFPlatformRequestInvoked initWithDictionary:]([IFPlatformRequestSchemaIFPlatformRequestInvoked alloc], "initWithDictionary:", v10);
      -[IFPlatformRequestSchemaIFPlatformRequestClientEvent setIfPlatformRequestInvoked:](v5, "setIfPlatformRequestInvoked:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (IFPlatformRequestSchemaIFPlatformRequestClientEventMetadata)eventMetadata
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

- (BOOL)hasIfPlatformRequestContext
{
  return self->_hasIfPlatformRequestContext;
}

- (void)setHasIfPlatformRequestContext:(BOOL)a3
{
  self->_hasIfPlatformRequestContext = a3;
}

- (BOOL)hasIfPlatformRequestInvoked
{
  return self->_hasIfPlatformRequestInvoked;
}

- (void)setHasIfPlatformRequestInvoked:(BOOL)a3
{
  self->_hasIfPlatformRequestInvoked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ifPlatformRequestInvoked, 0);
  objc_storeStrong((id *)&self->_ifPlatformRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 100;
}

@end
