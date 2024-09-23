@implementation ODBATCHSiriSchemaODBATCHClientEvent

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
  v13.super_class = (Class)ODBATCHSiriSchemaODBATCHClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODBATCHSiriSchemaODBATCHClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODBATCHSiriSchemaODBATCHClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[ODBATCHSiriSchemaODBATCHClientEvent odbatchDataReported](self, "odbatchDataReported");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODBATCHSiriSchemaODBATCHClientEvent deleteOdbatchDataReported](self, "deleteOdbatchDataReported");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  ODBATCHSiriSchemaODBATCHDataReported *v3;

  if (-[ODBATCHSiriSchemaODBATCHClientEvent whichEvent_Type](self, "whichEvent_Type") == 10)
    v3 = self->_odbatchDataReported;
  else
    v3 = 0;
  return (SISchemaInstrumentationMessage *)v3;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 == 10)
    return CFSTR("odbatchDataReported");
  else
    return 0;
}

- (int)clockIsolationLevel
{
  if (-[ODBATCHSiriSchemaODBATCHClientEvent whichEvent_Type](self, "whichEvent_Type") == 10)
    return 2;
  else
    return 1;
}

- (id)qualifiedMessageName
{
  if (-[ODBATCHSiriSchemaODBATCHClientEvent whichEvent_Type](self, "whichEvent_Type") == 10)
    return CFSTR("com.apple.aiml.siri.odbatch.ODBATCHClientEvent.ODBATCHDataReported");
  else
    return CFSTR("com.apple.aiml.siri.odbatch.ODBATCHClientEvent");
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[ODBATCHSiriSchemaODBATCHClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setOdbatchDataReported:(id)a3
{
  unint64_t v3;

  v3 = 10;
  if (!a3)
    v3 = 0;
  self->_whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_odbatchDataReported, a3);
}

- (ODBATCHSiriSchemaODBATCHDataReported)odbatchDataReported
{
  if (self->_whichEvent_Type == 10)
    return self->_odbatchDataReported;
  else
    return (ODBATCHSiriSchemaODBATCHDataReported *)0;
}

- (void)deleteOdbatchDataReported
{
  ODBATCHSiriSchemaODBATCHDataReported *odbatchDataReported;

  if (self->_whichEvent_Type == 10)
  {
    self->_whichEvent_Type = 0;
    odbatchDataReported = self->_odbatchDataReported;
    self->_odbatchDataReported = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return ODBATCHSiriSchemaODBATCHClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ODBATCHSiriSchemaODBATCHClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODBATCHSiriSchemaODBATCHClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODBATCHSiriSchemaODBATCHClientEvent odbatchDataReported](self, "odbatchDataReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ODBATCHSiriSchemaODBATCHClientEvent odbatchDataReported](self, "odbatchDataReported");
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
  -[ODBATCHSiriSchemaODBATCHClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[ODBATCHSiriSchemaODBATCHClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ODBATCHSiriSchemaODBATCHClientEvent eventMetadata](self, "eventMetadata");
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
  -[ODBATCHSiriSchemaODBATCHClientEvent odbatchDataReported](self, "odbatchDataReported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "odbatchDataReported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ODBATCHSiriSchemaODBATCHClientEvent odbatchDataReported](self, "odbatchDataReported");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[ODBATCHSiriSchemaODBATCHClientEvent odbatchDataReported](self, "odbatchDataReported");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "odbatchDataReported");
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

  v3 = -[ODBATCHSiriSchemaODBATCHClientEventMetadata hash](self->_eventMetadata, "hash");
  return -[ODBATCHSiriSchemaODBATCHDataReported hash](self->_odbatchDataReported, "hash") ^ v3;
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
    -[ODBATCHSiriSchemaODBATCHClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_odbatchDataReported)
  {
    -[ODBATCHSiriSchemaODBATCHClientEvent odbatchDataReported](self, "odbatchDataReported");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("odbatchDataReported"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("odbatchDataReported"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODBATCHSiriSchemaODBATCHClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODBATCHSiriSchemaODBATCHClientEvent)initWithJSON:(id)a3
{
  void *v4;
  ODBATCHSiriSchemaODBATCHClientEvent *v5;
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
    self = -[ODBATCHSiriSchemaODBATCHClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODBATCHSiriSchemaODBATCHClientEvent)initWithDictionary:(id)a3
{
  id v4;
  ODBATCHSiriSchemaODBATCHClientEvent *v5;
  void *v6;
  ODBATCHSiriSchemaODBATCHClientEventMetadata *v7;
  void *v8;
  ODBATCHSiriSchemaODBATCHDataReported *v9;
  ODBATCHSiriSchemaODBATCHClientEvent *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ODBATCHSiriSchemaODBATCHClientEvent;
  v5 = -[ODBATCHSiriSchemaODBATCHClientEvent init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODBATCHSiriSchemaODBATCHClientEventMetadata initWithDictionary:]([ODBATCHSiriSchemaODBATCHClientEventMetadata alloc], "initWithDictionary:", v6);
      -[ODBATCHSiriSchemaODBATCHClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("odbatchDataReported"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ODBATCHSiriSchemaODBATCHDataReported initWithDictionary:]([ODBATCHSiriSchemaODBATCHDataReported alloc], "initWithDictionary:", v8);
      -[ODBATCHSiriSchemaODBATCHClientEvent setOdbatchDataReported:](v5, "setOdbatchDataReported:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (ODBATCHSiriSchemaODBATCHClientEventMetadata)eventMetadata
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

- (BOOL)hasOdbatchDataReported
{
  return self->_hasOdbatchDataReported;
}

- (void)setHasOdbatchDataReported:(BOOL)a3
{
  self->_hasOdbatchDataReported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odbatchDataReported, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 84;
}

@end
