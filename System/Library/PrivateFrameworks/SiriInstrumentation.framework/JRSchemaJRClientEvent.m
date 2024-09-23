@implementation JRSchemaJRClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[JRSchemaJRClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jrId");
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

  -[JRSchemaJRClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jrId");
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
        LODWORD(v4) = 49;
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
  v16.super_class = (Class)JRSchemaJRClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JRSchemaJRClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[JRSchemaJRClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[JRSchemaJRClientEvent jrInferenceContext](self, "jrInferenceContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[JRSchemaJRClientEvent deleteJrInferenceContext](self, "deleteJrInferenceContext");
  -[JRSchemaJRClientEvent jrExperimentTriggered](self, "jrExperimentTriggered");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[JRSchemaJRClientEvent deleteJrExperimentTriggered](self, "deleteJrExperimentTriggered");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  int *v4;
  id v5;

  v3 = -[JRSchemaJRClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 == 101)
  {
    v4 = &OBJC_IVAR___JRSchemaJRClientEvent__jrInferenceContext;
  }
  else
  {
    if (v3 != 102)
    {
      v5 = 0;
      return (SISchemaInstrumentationMessage *)v5;
    }
    v4 = &OBJC_IVAR___JRSchemaJRClientEvent__jrExperimentTriggered;
  }
  v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("jrExperimentTriggered");
  if (a3 != 102)
    v3 = 0;
  if (a3 == 101)
    return CFSTR("jrInferenceContext");
  else
    return (id)v3;
}

- (id)qualifiedMessageName
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[JRSchemaJRClientEvent whichEvent_Type](self, "whichEvent_Type");
  v3 = CFSTR("com.apple.aiml.siri.jr.JRClientEvent");
  if (v2 == 102)
    v3 = CFSTR("com.apple.aiml.siri.jr.JRClientEvent.JRExperimentTriggered");
  if (v2 == 101)
    return CFSTR("com.apple.aiml.siri.jr.JRClientEvent.JRInferenceContext");
  else
    return (id)v3;
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[JRSchemaJRClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setJrInferenceContext:(id)a3
{
  JRSchemaJRInferenceContext *v4;
  JRSchemaJRExperimentTriggered *jrExperimentTriggered;
  unint64_t v6;
  JRSchemaJRInferenceContext *jrInferenceContext;

  v4 = (JRSchemaJRInferenceContext *)a3;
  jrExperimentTriggered = self->_jrExperimentTriggered;
  self->_jrExperimentTriggered = 0;

  v6 = 101;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  jrInferenceContext = self->_jrInferenceContext;
  self->_jrInferenceContext = v4;

}

- (JRSchemaJRInferenceContext)jrInferenceContext
{
  if (self->_whichEvent_Type == 101)
    return self->_jrInferenceContext;
  else
    return (JRSchemaJRInferenceContext *)0;
}

- (void)deleteJrInferenceContext
{
  JRSchemaJRInferenceContext *jrInferenceContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    jrInferenceContext = self->_jrInferenceContext;
    self->_jrInferenceContext = 0;

  }
}

- (void)setJrExperimentTriggered:(id)a3
{
  JRSchemaJRExperimentTriggered *v4;
  JRSchemaJRInferenceContext *jrInferenceContext;
  unint64_t v6;
  JRSchemaJRExperimentTriggered *jrExperimentTriggered;

  v4 = (JRSchemaJRExperimentTriggered *)a3;
  jrInferenceContext = self->_jrInferenceContext;
  self->_jrInferenceContext = 0;

  v6 = 102;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  jrExperimentTriggered = self->_jrExperimentTriggered;
  self->_jrExperimentTriggered = v4;

}

- (JRSchemaJRExperimentTriggered)jrExperimentTriggered
{
  if (self->_whichEvent_Type == 102)
    return self->_jrExperimentTriggered;
  else
    return (JRSchemaJRExperimentTriggered *)0;
}

- (void)deleteJrExperimentTriggered
{
  JRSchemaJRExperimentTriggered *jrExperimentTriggered;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    jrExperimentTriggered = self->_jrExperimentTriggered;
    self->_jrExperimentTriggered = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return JRSchemaJRClientEventReadFrom(self, (uint64_t)a3);
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
  -[JRSchemaJRClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[JRSchemaJRClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[JRSchemaJRClientEvent jrInferenceContext](self, "jrInferenceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[JRSchemaJRClientEvent jrInferenceContext](self, "jrInferenceContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[JRSchemaJRClientEvent jrExperimentTriggered](self, "jrExperimentTriggered");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[JRSchemaJRClientEvent jrExperimentTriggered](self, "jrExperimentTriggered");
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
  -[JRSchemaJRClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[JRSchemaJRClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[JRSchemaJRClientEvent eventMetadata](self, "eventMetadata");
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
  -[JRSchemaJRClientEvent jrInferenceContext](self, "jrInferenceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jrInferenceContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[JRSchemaJRClientEvent jrInferenceContext](self, "jrInferenceContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[JRSchemaJRClientEvent jrInferenceContext](self, "jrInferenceContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jrInferenceContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[JRSchemaJRClientEvent jrExperimentTriggered](self, "jrExperimentTriggered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jrExperimentTriggered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[JRSchemaJRClientEvent jrExperimentTriggered](self, "jrExperimentTriggered");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[JRSchemaJRClientEvent jrExperimentTriggered](self, "jrExperimentTriggered");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jrExperimentTriggered");
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

  v3 = -[JRSchemaJRClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[JRSchemaJRInferenceContext hash](self->_jrInferenceContext, "hash") ^ v3;
  return v4 ^ -[JRSchemaJRExperimentTriggered hash](self->_jrExperimentTriggered, "hash");
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
    -[JRSchemaJRClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_jrExperimentTriggered)
  {
    -[JRSchemaJRClientEvent jrExperimentTriggered](self, "jrExperimentTriggered");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("jrExperimentTriggered"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("jrExperimentTriggered"));

    }
  }
  if (self->_jrInferenceContext)
  {
    -[JRSchemaJRClientEvent jrInferenceContext](self, "jrInferenceContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("jrInferenceContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("jrInferenceContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[JRSchemaJRClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (JRSchemaJRClientEvent)initWithJSON:(id)a3
{
  void *v4;
  JRSchemaJRClientEvent *v5;
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
    self = -[JRSchemaJRClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (JRSchemaJRClientEvent)initWithDictionary:(id)a3
{
  id v4;
  JRSchemaJRClientEvent *v5;
  void *v6;
  JRSchemaJRClientEventMetadata *v7;
  void *v8;
  JRSchemaJRInferenceContext *v9;
  void *v10;
  JRSchemaJRExperimentTriggered *v11;
  JRSchemaJRClientEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)JRSchemaJRClientEvent;
  v5 = -[JRSchemaJRClientEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[JRSchemaJRClientEventMetadata initWithDictionary:]([JRSchemaJRClientEventMetadata alloc], "initWithDictionary:", v6);
      -[JRSchemaJRClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jrInferenceContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[JRSchemaJRInferenceContext initWithDictionary:]([JRSchemaJRInferenceContext alloc], "initWithDictionary:", v8);
      -[JRSchemaJRClientEvent setJrInferenceContext:](v5, "setJrInferenceContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jrExperimentTriggered"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[JRSchemaJRExperimentTriggered initWithDictionary:]([JRSchemaJRExperimentTriggered alloc], "initWithDictionary:", v10);
      -[JRSchemaJRClientEvent setJrExperimentTriggered:](v5, "setJrExperimentTriggered:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (JRSchemaJRClientEventMetadata)eventMetadata
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

- (BOOL)hasJrInferenceContext
{
  return self->_hasJrInferenceContext;
}

- (void)setHasJrInferenceContext:(BOOL)a3
{
  self->_hasJrInferenceContext = a3;
}

- (BOOL)hasJrExperimentTriggered
{
  return self->_hasJrExperimentTriggered;
}

- (void)setHasJrExperimentTriggered:(BOOL)a3
{
  self->_hasJrExperimentTriggered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jrExperimentTriggered, 0);
  objc_storeStrong((id *)&self->_jrInferenceContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 92;
}

@end
