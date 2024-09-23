@implementation ORCHSchemaORCHMUXBridgeContext

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
  v16.super_class = (Class)ORCHSchemaORCHMUXBridgeContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ORCHSchemaORCHMUXBridgeContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ORCHSchemaORCHMUXBridgeContext deleteStartedOrChanged](self, "deleteStartedOrChanged");
  -[ORCHSchemaORCHMUXBridgeContext ended](self, "ended");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ORCHSchemaORCHMUXBridgeContext deleteEnded](self, "deleteEnded");
  -[ORCHSchemaORCHMUXBridgeContext ephemeralToAggregationIdentifierMap](self, "ephemeralToAggregationIdentifierMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ORCHSchemaORCHMUXBridgeContext deleteEphemeralToAggregationIdentifierMap](self, "deleteEphemeralToAggregationIdentifierMap");

  return v5;
}

- (void)setStartedOrChanged:(id)a3
{
  ORCHSchemaORCHMUXRequestStarted *v4;
  ORCHSchemaORCHMUXRequestEnded *ended;
  ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *ephemeralToAggregationIdentifierMap;
  ORCHSchemaORCHMUXRequestStarted *startedOrChanged;

  v4 = (ORCHSchemaORCHMUXRequestStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  self->_whichContextevent = v4 != 0;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;

}

- (ORCHSchemaORCHMUXRequestStarted)startedOrChanged
{
  if (self->_whichContextevent == 1)
    return self->_startedOrChanged;
  else
    return (ORCHSchemaORCHMUXRequestStarted *)0;
}

- (void)deleteStartedOrChanged
{
  ORCHSchemaORCHMUXRequestStarted *startedOrChanged;

  if (self->_whichContextevent == 1)
  {
    self->_whichContextevent = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;

  }
}

- (void)setEnded:(id)a3
{
  ORCHSchemaORCHMUXRequestEnded *v4;
  ORCHSchemaORCHMUXRequestStarted *startedOrChanged;
  ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *ephemeralToAggregationIdentifierMap;
  ORCHSchemaORCHMUXRequestEnded *ended;

  v4 = (ORCHSchemaORCHMUXRequestEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = 0;

  self->_whichContextevent = 2 * (v4 != 0);
  ended = self->_ended;
  self->_ended = v4;

}

- (ORCHSchemaORCHMUXRequestEnded)ended
{
  if (self->_whichContextevent == 2)
    return self->_ended;
  else
    return (ORCHSchemaORCHMUXRequestEnded *)0;
}

- (void)deleteEnded
{
  ORCHSchemaORCHMUXRequestEnded *ended;

  if (self->_whichContextevent == 2)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (void)setEphemeralToAggregationIdentifierMap:(id)a3
{
  ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *v4;
  ORCHSchemaORCHMUXRequestStarted *startedOrChanged;
  ORCHSchemaORCHMUXRequestEnded *ended;
  unint64_t v7;
  ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *ephemeralToAggregationIdentifierMap;

  v4 = (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  v7 = 3;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
  self->_ephemeralToAggregationIdentifierMap = v4;

}

- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext)ephemeralToAggregationIdentifierMap
{
  if (self->_whichContextevent == 3)
    return self->_ephemeralToAggregationIdentifierMap;
  else
    return (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)0;
}

- (void)deleteEphemeralToAggregationIdentifierMap
{
  ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *ephemeralToAggregationIdentifierMap;

  if (self->_whichContextevent == 3)
  {
    self->_whichContextevent = 0;
    ephemeralToAggregationIdentifierMap = self->_ephemeralToAggregationIdentifierMap;
    self->_ephemeralToAggregationIdentifierMap = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHMUXBridgeContextReadFrom(self, (uint64_t)a3);
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
  -[ORCHSchemaORCHMUXBridgeContext startedOrChanged](self, "startedOrChanged");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ORCHSchemaORCHMUXBridgeContext startedOrChanged](self, "startedOrChanged");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHMUXBridgeContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ORCHSchemaORCHMUXBridgeContext ended](self, "ended");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHMUXBridgeContext ephemeralToAggregationIdentifierMap](self, "ephemeralToAggregationIdentifierMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ORCHSchemaORCHMUXBridgeContext ephemeralToAggregationIdentifierMap](self, "ephemeralToAggregationIdentifierMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichContextevent;
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
  whichContextevent = self->_whichContextevent;
  if (whichContextevent != objc_msgSend(v4, "whichContextevent"))
    goto LABEL_18;
  -[ORCHSchemaORCHMUXBridgeContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedOrChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[ORCHSchemaORCHMUXBridgeContext startedOrChanged](self, "startedOrChanged");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ORCHSchemaORCHMUXBridgeContext startedOrChanged](self, "startedOrChanged");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedOrChanged");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[ORCHSchemaORCHMUXBridgeContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[ORCHSchemaORCHMUXBridgeContext ended](self, "ended");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ORCHSchemaORCHMUXBridgeContext ended](self, "ended");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[ORCHSchemaORCHMUXBridgeContext ephemeralToAggregationIdentifierMap](self, "ephemeralToAggregationIdentifierMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ephemeralToAggregationIdentifierMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ORCHSchemaORCHMUXBridgeContext ephemeralToAggregationIdentifierMap](self, "ephemeralToAggregationIdentifierMap");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[ORCHSchemaORCHMUXBridgeContext ephemeralToAggregationIdentifierMap](self, "ephemeralToAggregationIdentifierMap");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ephemeralToAggregationIdentifierMap");
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

  v3 = -[ORCHSchemaORCHMUXRequestStarted hash](self->_startedOrChanged, "hash");
  v4 = -[ORCHSchemaORCHMUXRequestEnded hash](self->_ended, "hash") ^ v3;
  return v4 ^ -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext hash](self->_ephemeralToAggregationIdentifierMap, "hash");
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
  if (self->_ended)
  {
    -[ORCHSchemaORCHMUXBridgeContext ended](self, "ended");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ended"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ended"));

    }
  }
  if (self->_ephemeralToAggregationIdentifierMap)
  {
    -[ORCHSchemaORCHMUXBridgeContext ephemeralToAggregationIdentifierMap](self, "ephemeralToAggregationIdentifierMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ephemeralToAggregationIdentifierMap"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ephemeralToAggregationIdentifierMap"));

    }
  }
  if (self->_startedOrChanged)
  {
    -[ORCHSchemaORCHMUXBridgeContext startedOrChanged](self, "startedOrChanged");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("startedOrChanged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("startedOrChanged"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHMUXBridgeContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHMUXBridgeContext)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHMUXBridgeContext *v5;
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
    self = -[ORCHSchemaORCHMUXBridgeContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHMUXBridgeContext)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHMUXBridgeContext *v5;
  void *v6;
  ORCHSchemaORCHMUXRequestStarted *v7;
  void *v8;
  ORCHSchemaORCHMUXRequestEnded *v9;
  void *v10;
  ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *v11;
  ORCHSchemaORCHMUXBridgeContext *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ORCHSchemaORCHMUXBridgeContext;
  v5 = -[ORCHSchemaORCHMUXBridgeContext init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ORCHSchemaORCHMUXRequestStarted initWithDictionary:]([ORCHSchemaORCHMUXRequestStarted alloc], "initWithDictionary:", v6);
      -[ORCHSchemaORCHMUXBridgeContext setStartedOrChanged:](v5, "setStartedOrChanged:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ORCHSchemaORCHMUXRequestEnded initWithDictionary:]([ORCHSchemaORCHMUXRequestEnded alloc], "initWithDictionary:", v8);
      -[ORCHSchemaORCHMUXBridgeContext setEnded:](v5, "setEnded:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ephemeralToAggregationIdentifierMap"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext initWithDictionary:]([ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext alloc], "initWithDictionary:", v10);
      -[ORCHSchemaORCHMUXBridgeContext setEphemeralToAggregationIdentifierMap:](v5, "setEphemeralToAggregationIdentifierMap:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (BOOL)hasStartedOrChanged
{
  return self->_hasStartedOrChanged;
}

- (void)setHasStartedOrChanged:(BOOL)a3
{
  self->_hasStartedOrChanged = a3;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (BOOL)hasEphemeralToAggregationIdentifierMap
{
  return self->_hasEphemeralToAggregationIdentifierMap;
}

- (void)setHasEphemeralToAggregationIdentifierMap:(BOOL)a3
{
  self->_hasEphemeralToAggregationIdentifierMap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralToAggregationIdentifierMap, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

@end
