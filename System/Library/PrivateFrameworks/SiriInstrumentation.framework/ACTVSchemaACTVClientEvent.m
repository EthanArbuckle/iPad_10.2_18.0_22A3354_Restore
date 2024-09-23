@implementation ACTVSchemaACTVClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[ACTVSchemaACTVClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activationEventId");
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

  -[ACTVSchemaACTVClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activationEventId");
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
        LODWORD(v4) = 34;
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
  v16.super_class = (Class)ACTVSchemaACTVClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTVSchemaACTVClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ACTVSchemaACTVClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[ACTVSchemaACTVClientEvent buttonInteractionDetected](self, "buttonInteractionDetected");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ACTVSchemaACTVClientEvent deleteButtonInteractionDetected](self, "deleteButtonInteractionDetected");
  -[ACTVSchemaACTVClientEvent turnActivated](self, "turnActivated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ACTVSchemaACTVClientEvent deleteTurnActivated](self, "deleteTurnActivated");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  int *v4;
  id v5;

  v3 = -[ACTVSchemaACTVClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 == 101)
  {
    v4 = &OBJC_IVAR___ACTVSchemaACTVClientEvent__buttonInteractionDetected;
  }
  else
  {
    if (v3 != 102)
    {
      v5 = 0;
      return (SISchemaInstrumentationMessage *)v5;
    }
    v4 = &OBJC_IVAR___ACTVSchemaACTVClientEvent__turnActivated;
  }
  v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("turnActivated");
  if (a3 != 102)
    v3 = 0;
  if (a3 == 101)
    return CFSTR("buttonInteractionDetected");
  else
    return (id)v3;
}

- (id)qualifiedMessageName
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[ACTVSchemaACTVClientEvent whichEvent_Type](self, "whichEvent_Type");
  v3 = CFSTR("com.apple.aiml.siri.activation.ACTVClientEvent");
  if (v2 == 102)
    v3 = CFSTR("com.apple.aiml.siri.activation.ACTVClientEvent.ACTVTurnActivated");
  if (v2 == 101)
    return CFSTR("com.apple.aiml.siri.activation.ACTVClientEvent.ACTVButtonInteractionDetected");
  else
    return (id)v3;
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[ACTVSchemaACTVClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setButtonInteractionDetected:(id)a3
{
  ACTVSchemaACTVButtonInteractionDetected *v4;
  ACTVSchemaACTVTurnActivated *turnActivated;
  unint64_t v6;
  ACTVSchemaACTVButtonInteractionDetected *buttonInteractionDetected;

  v4 = (ACTVSchemaACTVButtonInteractionDetected *)a3;
  turnActivated = self->_turnActivated;
  self->_turnActivated = 0;

  v6 = 101;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  buttonInteractionDetected = self->_buttonInteractionDetected;
  self->_buttonInteractionDetected = v4;

}

- (ACTVSchemaACTVButtonInteractionDetected)buttonInteractionDetected
{
  if (self->_whichEvent_Type == 101)
    return self->_buttonInteractionDetected;
  else
    return (ACTVSchemaACTVButtonInteractionDetected *)0;
}

- (void)deleteButtonInteractionDetected
{
  ACTVSchemaACTVButtonInteractionDetected *buttonInteractionDetected;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    buttonInteractionDetected = self->_buttonInteractionDetected;
    self->_buttonInteractionDetected = 0;

  }
}

- (void)setTurnActivated:(id)a3
{
  ACTVSchemaACTVTurnActivated *v4;
  ACTVSchemaACTVButtonInteractionDetected *buttonInteractionDetected;
  unint64_t v6;
  ACTVSchemaACTVTurnActivated *turnActivated;

  v4 = (ACTVSchemaACTVTurnActivated *)a3;
  buttonInteractionDetected = self->_buttonInteractionDetected;
  self->_buttonInteractionDetected = 0;

  v6 = 102;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  turnActivated = self->_turnActivated;
  self->_turnActivated = v4;

}

- (ACTVSchemaACTVTurnActivated)turnActivated
{
  if (self->_whichEvent_Type == 102)
    return self->_turnActivated;
  else
    return (ACTVSchemaACTVTurnActivated *)0;
}

- (void)deleteTurnActivated
{
  ACTVSchemaACTVTurnActivated *turnActivated;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    turnActivated = self->_turnActivated;
    self->_turnActivated = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return ACTVSchemaACTVClientEventReadFrom(self, (uint64_t)a3);
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
  -[ACTVSchemaACTVClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ACTVSchemaACTVClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ACTVSchemaACTVClientEvent buttonInteractionDetected](self, "buttonInteractionDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ACTVSchemaACTVClientEvent buttonInteractionDetected](self, "buttonInteractionDetected");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ACTVSchemaACTVClientEvent turnActivated](self, "turnActivated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ACTVSchemaACTVClientEvent turnActivated](self, "turnActivated");
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
  -[ACTVSchemaACTVClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[ACTVSchemaACTVClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ACTVSchemaACTVClientEvent eventMetadata](self, "eventMetadata");
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
  -[ACTVSchemaACTVClientEvent buttonInteractionDetected](self, "buttonInteractionDetected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonInteractionDetected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[ACTVSchemaACTVClientEvent buttonInteractionDetected](self, "buttonInteractionDetected");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ACTVSchemaACTVClientEvent buttonInteractionDetected](self, "buttonInteractionDetected");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buttonInteractionDetected");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[ACTVSchemaACTVClientEvent turnActivated](self, "turnActivated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnActivated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ACTVSchemaACTVClientEvent turnActivated](self, "turnActivated");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[ACTVSchemaACTVClientEvent turnActivated](self, "turnActivated");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnActivated");
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

  v3 = -[ACTVSchemaACTVClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[ACTVSchemaACTVButtonInteractionDetected hash](self->_buttonInteractionDetected, "hash") ^ v3;
  return v4 ^ -[ACTVSchemaACTVTurnActivated hash](self->_turnActivated, "hash");
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
  if (self->_buttonInteractionDetected)
  {
    -[ACTVSchemaACTVClientEvent buttonInteractionDetected](self, "buttonInteractionDetected");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("buttonInteractionDetected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("buttonInteractionDetected"));

    }
  }
  if (self->_eventMetadata)
  {
    -[ACTVSchemaACTVClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_turnActivated)
  {
    -[ACTVSchemaACTVClientEvent turnActivated](self, "turnActivated");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("turnActivated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("turnActivated"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ACTVSchemaACTVClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ACTVSchemaACTVClientEvent)initWithJSON:(id)a3
{
  void *v4;
  ACTVSchemaACTVClientEvent *v5;
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
    self = -[ACTVSchemaACTVClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ACTVSchemaACTVClientEvent)initWithDictionary:(id)a3
{
  id v4;
  ACTVSchemaACTVClientEvent *v5;
  void *v6;
  ACTVSchemaACTVClientEventMetadata *v7;
  void *v8;
  ACTVSchemaACTVButtonInteractionDetected *v9;
  void *v10;
  ACTVSchemaACTVTurnActivated *v11;
  ACTVSchemaACTVClientEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACTVSchemaACTVClientEvent;
  v5 = -[ACTVSchemaACTVClientEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ACTVSchemaACTVClientEventMetadata initWithDictionary:]([ACTVSchemaACTVClientEventMetadata alloc], "initWithDictionary:", v6);
      -[ACTVSchemaACTVClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buttonInteractionDetected"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ACTVSchemaACTVButtonInteractionDetected initWithDictionary:]([ACTVSchemaACTVButtonInteractionDetected alloc], "initWithDictionary:", v8);
      -[ACTVSchemaACTVClientEvent setButtonInteractionDetected:](v5, "setButtonInteractionDetected:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("turnActivated"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ACTVSchemaACTVTurnActivated initWithDictionary:]([ACTVSchemaACTVTurnActivated alloc], "initWithDictionary:", v10);
      -[ACTVSchemaACTVClientEvent setTurnActivated:](v5, "setTurnActivated:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ACTVSchemaACTVClientEventMetadata)eventMetadata
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

- (BOOL)hasButtonInteractionDetected
{
  return self->_hasButtonInteractionDetected;
}

- (void)setHasButtonInteractionDetected:(BOOL)a3
{
  self->_hasButtonInteractionDetected = a3;
}

- (BOOL)hasTurnActivated
{
  return self->_hasTurnActivated;
}

- (void)setHasTurnActivated:(BOOL)a3
{
  self->_hasTurnActivated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnActivated, 0);
  objc_storeStrong((id *)&self->_buttonInteractionDetected, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 67;
}

@end
