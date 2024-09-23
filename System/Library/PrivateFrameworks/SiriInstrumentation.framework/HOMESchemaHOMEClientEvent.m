@implementation HOMESchemaHOMEClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[HOMESchemaHOMEClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeComponentId");
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

+ (int)joinability
{
  return 1;
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
  v16.super_class = (Class)HOMESchemaHOMEClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HOMESchemaHOMEClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[HOMESchemaHOMEClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[HOMESchemaHOMEClientEvent assistantInfoReported](self, "assistantInfoReported");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[HOMESchemaHOMEClientEvent deleteAssistantInfoReported](self, "deleteAssistantInfoReported");
  -[HOMESchemaHOMEClientEvent assistantDeviceBirthday](self, "assistantDeviceBirthday");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[HOMESchemaHOMEClientEvent deleteAssistantDeviceBirthday](self, "deleteAssistantDeviceBirthday");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  int *v4;
  id v5;

  v3 = -[HOMESchemaHOMEClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 == 101)
  {
    v4 = &OBJC_IVAR___HOMESchemaHOMEClientEvent__assistantInfoReported;
  }
  else
  {
    if (v3 != 102)
    {
      v5 = 0;
      return (SISchemaInstrumentationMessage *)v5;
    }
    v4 = &OBJC_IVAR___HOMESchemaHOMEClientEvent__assistantDeviceBirthday;
  }
  v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("assistantDeviceBirthday");
  if (a3 != 102)
    v3 = 0;
  if (a3 == 101)
    return CFSTR("assistantInfoReported");
  else
    return (id)v3;
}

- (id)qualifiedMessageName
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[HOMESchemaHOMEClientEvent whichEvent_Type](self, "whichEvent_Type");
  v3 = CFSTR("com.apple.aiml.siri.home.HOMEClientEvent");
  if (v2 == 102)
    v3 = CFSTR("com.apple.aiml.siri.home.HOMEClientEvent.HOMEAssistantDeviceBirthday");
  if (v2 == 101)
    return CFSTR("com.apple.aiml.siri.home.HOMEClientEvent.HOMEAssistantInfoReported");
  else
    return (id)v3;
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[HOMESchemaHOMEClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setAssistantInfoReported:(id)a3
{
  HOMESchemaHOMEAssistantInfoReported *v4;
  HOMESchemaHOMEAssistantDeviceBirthday *assistantDeviceBirthday;
  unint64_t v6;
  HOMESchemaHOMEAssistantInfoReported *assistantInfoReported;

  v4 = (HOMESchemaHOMEAssistantInfoReported *)a3;
  assistantDeviceBirthday = self->_assistantDeviceBirthday;
  self->_assistantDeviceBirthday = 0;

  v6 = 101;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  assistantInfoReported = self->_assistantInfoReported;
  self->_assistantInfoReported = v4;

}

- (HOMESchemaHOMEAssistantInfoReported)assistantInfoReported
{
  if (self->_whichEvent_Type == 101)
    return self->_assistantInfoReported;
  else
    return (HOMESchemaHOMEAssistantInfoReported *)0;
}

- (void)deleteAssistantInfoReported
{
  HOMESchemaHOMEAssistantInfoReported *assistantInfoReported;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    assistantInfoReported = self->_assistantInfoReported;
    self->_assistantInfoReported = 0;

  }
}

- (void)setAssistantDeviceBirthday:(id)a3
{
  HOMESchemaHOMEAssistantDeviceBirthday *v4;
  HOMESchemaHOMEAssistantInfoReported *assistantInfoReported;
  unint64_t v6;
  HOMESchemaHOMEAssistantDeviceBirthday *assistantDeviceBirthday;

  v4 = (HOMESchemaHOMEAssistantDeviceBirthday *)a3;
  assistantInfoReported = self->_assistantInfoReported;
  self->_assistantInfoReported = 0;

  v6 = 102;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  assistantDeviceBirthday = self->_assistantDeviceBirthday;
  self->_assistantDeviceBirthday = v4;

}

- (HOMESchemaHOMEAssistantDeviceBirthday)assistantDeviceBirthday
{
  if (self->_whichEvent_Type == 102)
    return self->_assistantDeviceBirthday;
  else
    return (HOMESchemaHOMEAssistantDeviceBirthday *)0;
}

- (void)deleteAssistantDeviceBirthday
{
  HOMESchemaHOMEAssistantDeviceBirthday *assistantDeviceBirthday;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    assistantDeviceBirthday = self->_assistantDeviceBirthday;
    self->_assistantDeviceBirthday = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return HOMESchemaHOMEClientEventReadFrom(self, (uint64_t)a3);
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
  -[HOMESchemaHOMEClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HOMESchemaHOMEClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HOMESchemaHOMEClientEvent assistantInfoReported](self, "assistantInfoReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HOMESchemaHOMEClientEvent assistantInfoReported](self, "assistantInfoReported");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HOMESchemaHOMEClientEvent assistantDeviceBirthday](self, "assistantDeviceBirthday");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HOMESchemaHOMEClientEvent assistantDeviceBirthday](self, "assistantDeviceBirthday");
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
  -[HOMESchemaHOMEClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[HOMESchemaHOMEClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[HOMESchemaHOMEClientEvent eventMetadata](self, "eventMetadata");
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
  -[HOMESchemaHOMEClientEvent assistantInfoReported](self, "assistantInfoReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantInfoReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[HOMESchemaHOMEClientEvent assistantInfoReported](self, "assistantInfoReported");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[HOMESchemaHOMEClientEvent assistantInfoReported](self, "assistantInfoReported");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantInfoReported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[HOMESchemaHOMEClientEvent assistantDeviceBirthday](self, "assistantDeviceBirthday");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDeviceBirthday");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[HOMESchemaHOMEClientEvent assistantDeviceBirthday](self, "assistantDeviceBirthday");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[HOMESchemaHOMEClientEvent assistantDeviceBirthday](self, "assistantDeviceBirthday");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDeviceBirthday");
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

  v3 = -[HOMESchemaHOMEClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[HOMESchemaHOMEAssistantInfoReported hash](self->_assistantInfoReported, "hash") ^ v3;
  return v4 ^ -[HOMESchemaHOMEAssistantDeviceBirthday hash](self->_assistantDeviceBirthday, "hash");
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
  if (self->_assistantDeviceBirthday)
  {
    -[HOMESchemaHOMEClientEvent assistantDeviceBirthday](self, "assistantDeviceBirthday");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assistantDeviceBirthday"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("assistantDeviceBirthday"));

    }
  }
  if (self->_assistantInfoReported)
  {
    -[HOMESchemaHOMEClientEvent assistantInfoReported](self, "assistantInfoReported");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("assistantInfoReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("assistantInfoReported"));

    }
  }
  if (self->_eventMetadata)
  {
    -[HOMESchemaHOMEClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("eventMetadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[HOMESchemaHOMEClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (HOMESchemaHOMEClientEvent)initWithJSON:(id)a3
{
  void *v4;
  HOMESchemaHOMEClientEvent *v5;
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
    self = -[HOMESchemaHOMEClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (HOMESchemaHOMEClientEvent)initWithDictionary:(id)a3
{
  id v4;
  HOMESchemaHOMEClientEvent *v5;
  void *v6;
  HOMESchemaHOMEClientEventMetadata *v7;
  void *v8;
  HOMESchemaHOMEAssistantInfoReported *v9;
  void *v10;
  HOMESchemaHOMEAssistantDeviceBirthday *v11;
  HOMESchemaHOMEClientEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HOMESchemaHOMEClientEvent;
  v5 = -[HOMESchemaHOMEClientEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[HOMESchemaHOMEClientEventMetadata initWithDictionary:]([HOMESchemaHOMEClientEventMetadata alloc], "initWithDictionary:", v6);
      -[HOMESchemaHOMEClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantInfoReported"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[HOMESchemaHOMEAssistantInfoReported initWithDictionary:]([HOMESchemaHOMEAssistantInfoReported alloc], "initWithDictionary:", v8);
      -[HOMESchemaHOMEClientEvent setAssistantInfoReported:](v5, "setAssistantInfoReported:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDeviceBirthday"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[HOMESchemaHOMEAssistantDeviceBirthday initWithDictionary:]([HOMESchemaHOMEAssistantDeviceBirthday alloc], "initWithDictionary:", v10);
      -[HOMESchemaHOMEClientEvent setAssistantDeviceBirthday:](v5, "setAssistantDeviceBirthday:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (HOMESchemaHOMEClientEventMetadata)eventMetadata
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

- (BOOL)hasAssistantInfoReported
{
  return self->_hasAssistantInfoReported;
}

- (void)setHasAssistantInfoReported:(BOOL)a3
{
  self->_hasAssistantInfoReported = a3;
}

- (BOOL)hasAssistantDeviceBirthday
{
  return self->_hasAssistantDeviceBirthday;
}

- (void)setHasAssistantDeviceBirthday:(BOOL)a3
{
  self->_hasAssistantDeviceBirthday = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantDeviceBirthday, 0);
  objc_storeStrong((id *)&self->_assistantInfoReported, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 46;
}

@end
