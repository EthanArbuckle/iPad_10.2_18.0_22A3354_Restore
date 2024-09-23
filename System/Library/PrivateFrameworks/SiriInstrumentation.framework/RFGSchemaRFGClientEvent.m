@implementation RFGSchemaRFGClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[RFGSchemaRFGClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rfId");
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
  v16.super_class = (Class)RFGSchemaRFGClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
    -[RFGSchemaRFGClientEvent deleteVisualResponseShownTier1](self, "deleteVisualResponseShownTier1");
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[RFGSchemaRFGClientEvent deleteVisualResponseShownTier1](self, "deleteVisualResponseShownTier1");
  if (objc_msgSend(v4, "isConditionSet:", 5))
    -[RFGSchemaRFGClientEvent deleteVisualResponseShownTier1](self, "deleteVisualResponseShownTier1");
  if (objc_msgSend(v4, "isConditionSet:", 6))
    -[RFGSchemaRFGClientEvent deleteVisualResponseShownTier1](self, "deleteVisualResponseShownTier1");
  if (objc_msgSend(v4, "isConditionSet:", 7))
    -[RFGSchemaRFGClientEvent deleteVisualResponseShownTier1](self, "deleteVisualResponseShownTier1");
  -[RFGSchemaRFGClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[RFGSchemaRFGClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[RFGSchemaRFGClientEvent visualResponseShownTier1](self, "visualResponseShownTier1");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[RFGSchemaRFGClientEvent deleteVisualResponseShownTier1](self, "deleteVisualResponseShownTier1");
  -[RFGSchemaRFGClientEvent visualResponseShownLink](self, "visualResponseShownLink");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[RFGSchemaRFGClientEvent deleteVisualResponseShownLink](self, "deleteVisualResponseShownLink");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  int *v4;
  id v5;

  v3 = -[RFGSchemaRFGClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 == 101)
  {
    v4 = &OBJC_IVAR___RFGSchemaRFGClientEvent__visualResponseShownTier1;
  }
  else
  {
    if (v3 != 102)
    {
      v5 = 0;
      return (SISchemaInstrumentationMessage *)v5;
    }
    v4 = &OBJC_IVAR___RFGSchemaRFGClientEvent__visualResponseShownLink;
  }
  v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
  return (SISchemaInstrumentationMessage *)v5;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("visualResponseShownLink");
  if (a3 != 102)
    v3 = 0;
  if (a3 == 101)
    return CFSTR("visualResponseShownTier1");
  else
    return (id)v3;
}

- (id)qualifiedMessageName
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[RFGSchemaRFGClientEvent whichEvent_Type](self, "whichEvent_Type");
  v3 = CFSTR("com.apple.aiml.siri.rf.RFGClientEvent");
  if (v2 == 102)
    v3 = CFSTR("com.apple.aiml.siri.rf.RFGClientEvent.RFGVisualResponseShownLink");
  if (v2 == 101)
    return CFSTR("com.apple.aiml.siri.rf.RFGClientEvent.RFGVisualResponseShownTier1");
  else
    return (id)v3;
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[RFGSchemaRFGClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setVisualResponseShownTier1:(id)a3
{
  RFSchemaRFGVisualResponseShownTier1 *v4;
  RFSchemaRFGVisualResponseShownLink *visualResponseShownLink;
  unint64_t v6;
  RFSchemaRFGVisualResponseShownTier1 *visualResponseShownTier1;

  v4 = (RFSchemaRFGVisualResponseShownTier1 *)a3;
  visualResponseShownLink = self->_visualResponseShownLink;
  self->_visualResponseShownLink = 0;

  v6 = 101;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  visualResponseShownTier1 = self->_visualResponseShownTier1;
  self->_visualResponseShownTier1 = v4;

}

- (RFSchemaRFGVisualResponseShownTier1)visualResponseShownTier1
{
  if (self->_whichEvent_Type == 101)
    return self->_visualResponseShownTier1;
  else
    return (RFSchemaRFGVisualResponseShownTier1 *)0;
}

- (void)deleteVisualResponseShownTier1
{
  RFSchemaRFGVisualResponseShownTier1 *visualResponseShownTier1;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    visualResponseShownTier1 = self->_visualResponseShownTier1;
    self->_visualResponseShownTier1 = 0;

  }
}

- (void)setVisualResponseShownLink:(id)a3
{
  RFSchemaRFGVisualResponseShownLink *v4;
  RFSchemaRFGVisualResponseShownTier1 *visualResponseShownTier1;
  unint64_t v6;
  RFSchemaRFGVisualResponseShownLink *visualResponseShownLink;

  v4 = (RFSchemaRFGVisualResponseShownLink *)a3;
  visualResponseShownTier1 = self->_visualResponseShownTier1;
  self->_visualResponseShownTier1 = 0;

  v6 = 102;
  if (!v4)
    v6 = 0;
  self->_whichEvent_Type = v6;
  visualResponseShownLink = self->_visualResponseShownLink;
  self->_visualResponseShownLink = v4;

}

- (RFSchemaRFGVisualResponseShownLink)visualResponseShownLink
{
  if (self->_whichEvent_Type == 102)
    return self->_visualResponseShownLink;
  else
    return (RFSchemaRFGVisualResponseShownLink *)0;
}

- (void)deleteVisualResponseShownLink
{
  RFSchemaRFGVisualResponseShownLink *visualResponseShownLink;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    visualResponseShownLink = self->_visualResponseShownLink;
    self->_visualResponseShownLink = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return RFGSchemaRFGClientEventReadFrom(self, (uint64_t)a3);
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
  -[RFGSchemaRFGClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RFGSchemaRFGClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RFGSchemaRFGClientEvent visualResponseShownTier1](self, "visualResponseShownTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RFGSchemaRFGClientEvent visualResponseShownTier1](self, "visualResponseShownTier1");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RFGSchemaRFGClientEvent visualResponseShownLink](self, "visualResponseShownLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RFGSchemaRFGClientEvent visualResponseShownLink](self, "visualResponseShownLink");
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
  -[RFGSchemaRFGClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[RFGSchemaRFGClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[RFGSchemaRFGClientEvent eventMetadata](self, "eventMetadata");
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
  -[RFGSchemaRFGClientEvent visualResponseShownTier1](self, "visualResponseShownTier1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visualResponseShownTier1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[RFGSchemaRFGClientEvent visualResponseShownTier1](self, "visualResponseShownTier1");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[RFGSchemaRFGClientEvent visualResponseShownTier1](self, "visualResponseShownTier1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visualResponseShownTier1");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[RFGSchemaRFGClientEvent visualResponseShownLink](self, "visualResponseShownLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visualResponseShownLink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[RFGSchemaRFGClientEvent visualResponseShownLink](self, "visualResponseShownLink");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[RFGSchemaRFGClientEvent visualResponseShownLink](self, "visualResponseShownLink");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visualResponseShownLink");
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

  v3 = -[RFSchemaRFGClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[RFSchemaRFGVisualResponseShownTier1 hash](self->_visualResponseShownTier1, "hash") ^ v3;
  return v4 ^ -[RFSchemaRFGVisualResponseShownLink hash](self->_visualResponseShownLink, "hash");
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
    -[RFGSchemaRFGClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_visualResponseShownLink)
  {
    -[RFGSchemaRFGClientEvent visualResponseShownLink](self, "visualResponseShownLink");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("visualResponseShownLink"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("visualResponseShownLink"));

    }
  }
  if (self->_visualResponseShownTier1)
  {
    -[RFGSchemaRFGClientEvent visualResponseShownTier1](self, "visualResponseShownTier1");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("visualResponseShownTier1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("visualResponseShownTier1"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RFGSchemaRFGClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RFGSchemaRFGClientEvent)initWithJSON:(id)a3
{
  void *v4;
  RFGSchemaRFGClientEvent *v5;
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
    self = -[RFGSchemaRFGClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RFGSchemaRFGClientEvent)initWithDictionary:(id)a3
{
  id v4;
  RFGSchemaRFGClientEvent *v5;
  void *v6;
  RFSchemaRFGClientEventMetadata *v7;
  void *v8;
  RFSchemaRFGVisualResponseShownTier1 *v9;
  void *v10;
  RFSchemaRFGVisualResponseShownLink *v11;
  RFGSchemaRFGClientEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RFGSchemaRFGClientEvent;
  v5 = -[RFGSchemaRFGClientEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[RFSchemaRFGClientEventMetadata initWithDictionary:]([RFSchemaRFGClientEventMetadata alloc], "initWithDictionary:", v6);
      -[RFGSchemaRFGClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("visualResponseShownTier1"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[RFSchemaRFGVisualResponseShownTier1 initWithDictionary:]([RFSchemaRFGVisualResponseShownTier1 alloc], "initWithDictionary:", v8);
      -[RFGSchemaRFGClientEvent setVisualResponseShownTier1:](v5, "setVisualResponseShownTier1:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("visualResponseShownLink"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[RFSchemaRFGVisualResponseShownLink initWithDictionary:]([RFSchemaRFGVisualResponseShownLink alloc], "initWithDictionary:", v10);
      -[RFGSchemaRFGClientEvent setVisualResponseShownLink:](v5, "setVisualResponseShownLink:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (RFSchemaRFGClientEventMetadata)eventMetadata
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

- (BOOL)hasVisualResponseShownTier1
{
  return self->_hasVisualResponseShownTier1;
}

- (void)setHasVisualResponseShownTier1:(BOOL)a3
{
  self->_hasVisualResponseShownTier1 = a3;
}

- (BOOL)hasVisualResponseShownLink
{
  return self->_hasVisualResponseShownLink;
}

- (void)setHasVisualResponseShownLink:(BOOL)a3
{
  self->_hasVisualResponseShownLink = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualResponseShownLink, 0);
  objc_storeStrong((id *)&self->_visualResponseShownTier1, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 59;
}

@end
