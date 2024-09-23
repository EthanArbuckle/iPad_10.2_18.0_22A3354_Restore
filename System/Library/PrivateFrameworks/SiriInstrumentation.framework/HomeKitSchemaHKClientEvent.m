@implementation HomeKitSchemaHKClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[HomeKitSchemaHKClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hkId");
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

  -[HomeKitSchemaHKClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hkId");
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
        LODWORD(v4) = 39;
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
  v16.super_class = (Class)HomeKitSchemaHKClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HomeKitSchemaHKClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[HomeKitSchemaHKClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[HomeKitSchemaHKClientEvent homeKitAccessoryOperationReported](self, "homeKitAccessoryOperationReported");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[HomeKitSchemaHKClientEvent deleteHomeKitAccessoryOperationReported](self, "deleteHomeKitAccessoryOperationReported");
  -[HomeKitSchemaHKClientEvent audioTopologyReported](self, "audioTopologyReported");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[HomeKitSchemaHKClientEvent deleteAudioTopologyReported](self, "deleteAudioTopologyReported");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  int *v4;
  id v5;

  v3 = -[HomeKitSchemaHKClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 == 100)
  {
    v4 = &OBJC_IVAR___HomeKitSchemaHKClientEvent__homeKitAccessoryOperationReported;
  }
  else
  {
    if (v3 != 101)
    {
      v5 = 0;
      return (SISchemaInstrumentationMessage *)v5;
    }
    v4 = &OBJC_IVAR___HomeKitSchemaHKClientEvent__audioTopologyReported;
  }
  v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("audioTopologyReported");
  if (a3 != 101)
    v3 = 0;
  if (a3 == 100)
    return CFSTR("homeKitAccessoryOperationReported");
  else
    return (id)v3;
}

- (id)qualifiedMessageName
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[HomeKitSchemaHKClientEvent whichEvent_Type](self, "whichEvent_Type");
  v3 = CFSTR("com.apple.aiml.siri.homekit.HKClientEvent");
  if (v2 == 101)
    v3 = CFSTR("com.apple.aiml.siri.homekit.HKClientEvent.HKAudioTopologyReported");
  if (v2 == 100)
    return CFSTR("com.apple.aiml.siri.homekit.HKClientEvent.HKAccessoryOperationReported");
  else
    return (id)v3;
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[HomeKitSchemaHKClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setHomeKitAccessoryOperationReported:(id)a3
{
  HomeKitSchemaHKAccessoryOperationReported *v4;
  HomeKitSchemaHKAudioTopologyReported *audioTopologyReported;
  unint64_t v6;
  HomeKitSchemaHKAccessoryOperationReported *homeKitAccessoryOperationReported;

  v4 = (HomeKitSchemaHKAccessoryOperationReported *)a3;
  audioTopologyReported = self->_audioTopologyReported;
  self->_audioTopologyReported = 0;

  v6 = 100;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  homeKitAccessoryOperationReported = self->_homeKitAccessoryOperationReported;
  self->_homeKitAccessoryOperationReported = v4;

}

- (HomeKitSchemaHKAccessoryOperationReported)homeKitAccessoryOperationReported
{
  if (self->_whichEvent_Type == 100)
    return self->_homeKitAccessoryOperationReported;
  else
    return (HomeKitSchemaHKAccessoryOperationReported *)0;
}

- (void)deleteHomeKitAccessoryOperationReported
{
  HomeKitSchemaHKAccessoryOperationReported *homeKitAccessoryOperationReported;

  if (self->_whichEvent_Type == 100)
  {
    self->_whichEvent_Type = 0;
    homeKitAccessoryOperationReported = self->_homeKitAccessoryOperationReported;
    self->_homeKitAccessoryOperationReported = 0;

  }
}

- (void)setAudioTopologyReported:(id)a3
{
  HomeKitSchemaHKAudioTopologyReported *v4;
  HomeKitSchemaHKAccessoryOperationReported *homeKitAccessoryOperationReported;
  unint64_t v6;
  HomeKitSchemaHKAudioTopologyReported *audioTopologyReported;

  v4 = (HomeKitSchemaHKAudioTopologyReported *)a3;
  homeKitAccessoryOperationReported = self->_homeKitAccessoryOperationReported;
  self->_homeKitAccessoryOperationReported = 0;

  v6 = 101;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  audioTopologyReported = self->_audioTopologyReported;
  self->_audioTopologyReported = v4;

}

- (HomeKitSchemaHKAudioTopologyReported)audioTopologyReported
{
  if (self->_whichEvent_Type == 101)
    return self->_audioTopologyReported;
  else
    return (HomeKitSchemaHKAudioTopologyReported *)0;
}

- (void)deleteAudioTopologyReported
{
  HomeKitSchemaHKAudioTopologyReported *audioTopologyReported;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    audioTopologyReported = self->_audioTopologyReported;
    self->_audioTopologyReported = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return HomeKitSchemaHKClientEventReadFrom(self, (uint64_t)a3);
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
  -[HomeKitSchemaHKClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HomeKitSchemaHKClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HomeKitSchemaHKClientEvent homeKitAccessoryOperationReported](self, "homeKitAccessoryOperationReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HomeKitSchemaHKClientEvent homeKitAccessoryOperationReported](self, "homeKitAccessoryOperationReported");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[HomeKitSchemaHKClientEvent audioTopologyReported](self, "audioTopologyReported");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HomeKitSchemaHKClientEvent audioTopologyReported](self, "audioTopologyReported");
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
  -[HomeKitSchemaHKClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[HomeKitSchemaHKClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[HomeKitSchemaHKClientEvent eventMetadata](self, "eventMetadata");
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
  -[HomeKitSchemaHKClientEvent homeKitAccessoryOperationReported](self, "homeKitAccessoryOperationReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeKitAccessoryOperationReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[HomeKitSchemaHKClientEvent homeKitAccessoryOperationReported](self, "homeKitAccessoryOperationReported");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[HomeKitSchemaHKClientEvent homeKitAccessoryOperationReported](self, "homeKitAccessoryOperationReported");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeKitAccessoryOperationReported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[HomeKitSchemaHKClientEvent audioTopologyReported](self, "audioTopologyReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioTopologyReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[HomeKitSchemaHKClientEvent audioTopologyReported](self, "audioTopologyReported");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[HomeKitSchemaHKClientEvent audioTopologyReported](self, "audioTopologyReported");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioTopologyReported");
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

  v3 = -[HomeKitSchemaHomeKitEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[HomeKitSchemaHKAccessoryOperationReported hash](self->_homeKitAccessoryOperationReported, "hash") ^ v3;
  return v4 ^ -[HomeKitSchemaHKAudioTopologyReported hash](self->_audioTopologyReported, "hash");
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
  if (self->_audioTopologyReported)
  {
    -[HomeKitSchemaHKClientEvent audioTopologyReported](self, "audioTopologyReported");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioTopologyReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("audioTopologyReported"));

    }
  }
  if (self->_eventMetadata)
  {
    -[HomeKitSchemaHKClientEvent eventMetadata](self, "eventMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("eventMetadata"));

    }
  }
  if (self->_homeKitAccessoryOperationReported)
  {
    -[HomeKitSchemaHKClientEvent homeKitAccessoryOperationReported](self, "homeKitAccessoryOperationReported");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("homeKitAccessoryOperationReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("homeKitAccessoryOperationReported"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[HomeKitSchemaHKClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (HomeKitSchemaHKClientEvent)initWithJSON:(id)a3
{
  void *v4;
  HomeKitSchemaHKClientEvent *v5;
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
    self = -[HomeKitSchemaHKClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (HomeKitSchemaHKClientEvent)initWithDictionary:(id)a3
{
  id v4;
  HomeKitSchemaHKClientEvent *v5;
  void *v6;
  HomeKitSchemaHomeKitEventMetadata *v7;
  void *v8;
  HomeKitSchemaHKAccessoryOperationReported *v9;
  void *v10;
  HomeKitSchemaHKAudioTopologyReported *v11;
  HomeKitSchemaHKClientEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HomeKitSchemaHKClientEvent;
  v5 = -[HomeKitSchemaHKClientEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[HomeKitSchemaHomeKitEventMetadata initWithDictionary:]([HomeKitSchemaHomeKitEventMetadata alloc], "initWithDictionary:", v6);
      -[HomeKitSchemaHKClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeKitAccessoryOperationReported"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[HomeKitSchemaHKAccessoryOperationReported initWithDictionary:]([HomeKitSchemaHKAccessoryOperationReported alloc], "initWithDictionary:", v8);
      -[HomeKitSchemaHKClientEvent setHomeKitAccessoryOperationReported:](v5, "setHomeKitAccessoryOperationReported:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioTopologyReported"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[HomeKitSchemaHKAudioTopologyReported initWithDictionary:]([HomeKitSchemaHKAudioTopologyReported alloc], "initWithDictionary:", v10);
      -[HomeKitSchemaHKClientEvent setAudioTopologyReported:](v5, "setAudioTopologyReported:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (HomeKitSchemaHomeKitEventMetadata)eventMetadata
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

- (BOOL)hasHomeKitAccessoryOperationReported
{
  return self->_hasHomeKitAccessoryOperationReported;
}

- (void)setHasHomeKitAccessoryOperationReported:(BOOL)a3
{
  self->_hasHomeKitAccessoryOperationReported = a3;
}

- (BOOL)hasAudioTopologyReported
{
  return self->_hasAudioTopologyReported;
}

- (void)setHasAudioTopologyReported:(BOOL)a3
{
  self->_hasAudioTopologyReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioTopologyReported, 0);
  objc_storeStrong((id *)&self->_homeKitAccessoryOperationReported, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 74;
}

@end
