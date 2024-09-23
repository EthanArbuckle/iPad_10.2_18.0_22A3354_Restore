@implementation SRSTSchemaSRSTClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[SRSTSchemaSRSTClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "srstId");
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

  -[SRSTSchemaSRSTClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "srstId");
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
        LODWORD(v4) = 20;
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
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SRSTSchemaSRSTClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRSTSchemaSRSTClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SRSTSchemaSRSTClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[SRSTSchemaSRSTClientEvent stateTransitionEvent](self, "stateTransitionEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SRSTSchemaSRSTClientEvent deleteStateTransitionEvent](self, "deleteStateTransitionEvent");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  SRSTSchemaSRSTStateTransitionEvent *v3;

  if (-[SRSTSchemaSRSTClientEvent whichEvent_Type](self, "whichEvent_Type") == 101)
    v3 = self->_stateTransitionEvent;
  else
    v3 = 0;
  return (SISchemaInstrumentationMessage *)v3;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 == 101)
    return CFSTR("stateTransitionEvent");
  else
    return 0;
}

- (id)qualifiedMessageName
{
  if (-[SRSTSchemaSRSTClientEvent whichEvent_Type](self, "whichEvent_Type") == 101)
    return CFSTR("com.apple.aiml.siri.srst.SRSTClientEvent.SRSTStateTransitionEvent");
  else
    return CFSTR("com.apple.aiml.siri.srst.SRSTClientEvent");
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[SRSTSchemaSRSTClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setStateTransitionEvent:(id)a3
{
  unint64_t v3;

  v3 = 101;
  if (!a3)
    v3 = 0;
  self->_whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_stateTransitionEvent, a3);
}

- (SRSTSchemaSRSTStateTransitionEvent)stateTransitionEvent
{
  if (self->_whichEvent_Type == 101)
    return self->_stateTransitionEvent;
  else
    return (SRSTSchemaSRSTStateTransitionEvent *)0;
}

- (void)deleteStateTransitionEvent
{
  SRSTSchemaSRSTStateTransitionEvent *stateTransitionEvent;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    stateTransitionEvent = self->_stateTransitionEvent;
    self->_stateTransitionEvent = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SRSTSchemaSRSTClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SRSTSchemaSRSTClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SRSTSchemaSRSTClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SRSTSchemaSRSTClientEvent stateTransitionEvent](self, "stateTransitionEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SRSTSchemaSRSTClientEvent stateTransitionEvent](self, "stateTransitionEvent");
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
  -[SRSTSchemaSRSTClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[SRSTSchemaSRSTClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SRSTSchemaSRSTClientEvent eventMetadata](self, "eventMetadata");
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
  -[SRSTSchemaSRSTClientEvent stateTransitionEvent](self, "stateTransitionEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stateTransitionEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SRSTSchemaSRSTClientEvent stateTransitionEvent](self, "stateTransitionEvent");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[SRSTSchemaSRSTClientEvent stateTransitionEvent](self, "stateTransitionEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stateTransitionEvent");
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

  v3 = -[SRSTSchemaSRSTClientEventMetadata hash](self->_eventMetadata, "hash");
  return -[SRSTSchemaSRSTStateTransitionEvent hash](self->_stateTransitionEvent, "hash") ^ v3;
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
  if (self->_eventMetadata)
  {
    -[SRSTSchemaSRSTClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_stateTransitionEvent)
  {
    -[SRSTSchemaSRSTClientEvent stateTransitionEvent](self, "stateTransitionEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("stateTransitionEvent"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("stateTransitionEvent"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SRSTSchemaSRSTClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SRSTSchemaSRSTClientEvent)initWithJSON:(id)a3
{
  void *v4;
  SRSTSchemaSRSTClientEvent *v5;
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
    self = -[SRSTSchemaSRSTClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SRSTSchemaSRSTClientEvent)initWithDictionary:(id)a3
{
  id v4;
  SRSTSchemaSRSTClientEvent *v5;
  void *v6;
  SRSTSchemaSRSTClientEventMetadata *v7;
  void *v8;
  SRSTSchemaSRSTStateTransitionEvent *v9;
  SRSTSchemaSRSTClientEvent *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRSTSchemaSRSTClientEvent;
  v5 = -[SRSTSchemaSRSTClientEvent init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SRSTSchemaSRSTClientEventMetadata initWithDictionary:]([SRSTSchemaSRSTClientEventMetadata alloc], "initWithDictionary:", v6);
      -[SRSTSchemaSRSTClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stateTransitionEvent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SRSTSchemaSRSTStateTransitionEvent initWithDictionary:]([SRSTSchemaSRSTStateTransitionEvent alloc], "initWithDictionary:", v8);
      -[SRSTSchemaSRSTClientEvent setStateTransitionEvent:](v5, "setStateTransitionEvent:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SRSTSchemaSRSTClientEventMetadata)eventMetadata
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

- (BOOL)hasStateTransitionEvent
{
  return self->_hasStateTransitionEvent;
}

- (void)setHasStateTransitionEvent:(BOOL)a3
{
  self->_hasStateTransitionEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateTransitionEvent, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 41;
}

@end
