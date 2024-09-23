@implementation SISchemaABClientEvent

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
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SISchemaABClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaABClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaABClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[SISchemaABClientEvent allocationChanged](self, "allocationChanged");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SISchemaABClientEvent deleteAllocationChanged](self, "deleteAllocationChanged");
  -[SISchemaABClientEvent assetRetrievalStatusChanged](self, "assetRetrievalStatusChanged");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SISchemaABClientEvent deleteAssetRetrievalStatusChanged](self, "deleteAssetRetrievalStatusChanged");
  -[SISchemaABClientEvent clientFeatureTriggered](self, "clientFeatureTriggered");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[SISchemaABClientEvent deleteClientFeatureTriggered](self, "deleteClientFeatureTriggered");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[SISchemaABClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 2)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5628C40[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 2)
    return 0;
  else
    return off_1E5628C58[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[SISchemaABClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 2)
    return CFSTR("com.apple.aiml.siri.abe.ABClientEvent");
  else
    return off_1E5633E60[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[SISchemaABClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setAllocationChanged:(id)a3
{
  SISchemaABExperimentAllocationChanged *v4;
  SISchemaABExperimentAssetRetrievalStatusChanged *assetRetrievalStatusChanged;
  SISchemaABExperimentClientFeatureTriggered *clientFeatureTriggered;
  unint64_t v7;
  SISchemaABExperimentAllocationChanged *allocationChanged;

  v4 = (SISchemaABExperimentAllocationChanged *)a3;
  assetRetrievalStatusChanged = self->_assetRetrievalStatusChanged;
  self->_assetRetrievalStatusChanged = 0;

  clientFeatureTriggered = self->_clientFeatureTriggered;
  self->_clientFeatureTriggered = 0;

  v7 = 101;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  allocationChanged = self->_allocationChanged;
  self->_allocationChanged = v4;

}

- (SISchemaABExperimentAllocationChanged)allocationChanged
{
  if (self->_whichEvent_Type == 101)
    return self->_allocationChanged;
  else
    return (SISchemaABExperimentAllocationChanged *)0;
}

- (void)deleteAllocationChanged
{
  SISchemaABExperimentAllocationChanged *allocationChanged;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    allocationChanged = self->_allocationChanged;
    self->_allocationChanged = 0;

  }
}

- (void)setAssetRetrievalStatusChanged:(id)a3
{
  SISchemaABExperimentAssetRetrievalStatusChanged *v4;
  SISchemaABExperimentAllocationChanged *allocationChanged;
  SISchemaABExperimentClientFeatureTriggered *clientFeatureTriggered;
  unint64_t v7;
  SISchemaABExperimentAssetRetrievalStatusChanged *assetRetrievalStatusChanged;

  v4 = (SISchemaABExperimentAssetRetrievalStatusChanged *)a3;
  allocationChanged = self->_allocationChanged;
  self->_allocationChanged = 0;

  clientFeatureTriggered = self->_clientFeatureTriggered;
  self->_clientFeatureTriggered = 0;

  v7 = 102;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  assetRetrievalStatusChanged = self->_assetRetrievalStatusChanged;
  self->_assetRetrievalStatusChanged = v4;

}

- (SISchemaABExperimentAssetRetrievalStatusChanged)assetRetrievalStatusChanged
{
  if (self->_whichEvent_Type == 102)
    return self->_assetRetrievalStatusChanged;
  else
    return (SISchemaABExperimentAssetRetrievalStatusChanged *)0;
}

- (void)deleteAssetRetrievalStatusChanged
{
  SISchemaABExperimentAssetRetrievalStatusChanged *assetRetrievalStatusChanged;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    assetRetrievalStatusChanged = self->_assetRetrievalStatusChanged;
    self->_assetRetrievalStatusChanged = 0;

  }
}

- (void)setClientFeatureTriggered:(id)a3
{
  SISchemaABExperimentClientFeatureTriggered *v4;
  SISchemaABExperimentAllocationChanged *allocationChanged;
  SISchemaABExperimentAssetRetrievalStatusChanged *assetRetrievalStatusChanged;
  unint64_t v7;
  SISchemaABExperimentClientFeatureTriggered *clientFeatureTriggered;

  v4 = (SISchemaABExperimentClientFeatureTriggered *)a3;
  allocationChanged = self->_allocationChanged;
  self->_allocationChanged = 0;

  assetRetrievalStatusChanged = self->_assetRetrievalStatusChanged;
  self->_assetRetrievalStatusChanged = 0;

  v7 = 103;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  clientFeatureTriggered = self->_clientFeatureTriggered;
  self->_clientFeatureTriggered = v4;

}

- (SISchemaABExperimentClientFeatureTriggered)clientFeatureTriggered
{
  if (self->_whichEvent_Type == 103)
    return self->_clientFeatureTriggered;
  else
    return (SISchemaABExperimentClientFeatureTriggered *)0;
}

- (void)deleteClientFeatureTriggered
{
  SISchemaABExperimentClientFeatureTriggered *clientFeatureTriggered;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    clientFeatureTriggered = self->_clientFeatureTriggered;
    self->_clientFeatureTriggered = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaABClientEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[SISchemaABClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SISchemaABClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaABClientEvent allocationChanged](self, "allocationChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SISchemaABClientEvent allocationChanged](self, "allocationChanged");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaABClientEvent assetRetrievalStatusChanged](self, "assetRetrievalStatusChanged");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SISchemaABClientEvent assetRetrievalStatusChanged](self, "assetRetrievalStatusChanged");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SISchemaABClientEvent clientFeatureTriggered](self, "clientFeatureTriggered");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SISchemaABClientEvent clientFeatureTriggered](self, "clientFeatureTriggered");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type"))
    goto LABEL_23;
  -[SISchemaABClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[SISchemaABClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SISchemaABClientEvent eventMetadata](self, "eventMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_23;
  }
  else
  {

  }
  -[SISchemaABClientEvent allocationChanged](self, "allocationChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allocationChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[SISchemaABClientEvent allocationChanged](self, "allocationChanged");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SISchemaABClientEvent allocationChanged](self, "allocationChanged");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allocationChanged");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[SISchemaABClientEvent assetRetrievalStatusChanged](self, "assetRetrievalStatusChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetRetrievalStatusChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[SISchemaABClientEvent assetRetrievalStatusChanged](self, "assetRetrievalStatusChanged");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[SISchemaABClientEvent assetRetrievalStatusChanged](self, "assetRetrievalStatusChanged");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetRetrievalStatusChanged");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[SISchemaABClientEvent clientFeatureTriggered](self, "clientFeatureTriggered");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientFeatureTriggered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SISchemaABClientEvent clientFeatureTriggered](self, "clientFeatureTriggered");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_26:
      v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    -[SISchemaABClientEvent clientFeatureTriggered](self, "clientFeatureTriggered");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientFeatureTriggered");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_26;
  }
  else
  {
LABEL_22:

  }
LABEL_23:
  v28 = 0;
LABEL_24:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[SISchemaABClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[SISchemaABExperimentAllocationChanged hash](self->_allocationChanged, "hash") ^ v3;
  v5 = -[SISchemaABExperimentAssetRetrievalStatusChanged hash](self->_assetRetrievalStatusChanged, "hash");
  return v4 ^ v5 ^ -[SISchemaABExperimentClientFeatureTriggered hash](self->_clientFeatureTriggered, "hash");
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
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_allocationChanged)
  {
    -[SISchemaABClientEvent allocationChanged](self, "allocationChanged");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("allocationChanged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("allocationChanged"));

    }
  }
  if (self->_assetRetrievalStatusChanged)
  {
    -[SISchemaABClientEvent assetRetrievalStatusChanged](self, "assetRetrievalStatusChanged");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("assetRetrievalStatusChanged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("assetRetrievalStatusChanged"));

    }
  }
  if (self->_clientFeatureTriggered)
  {
    -[SISchemaABClientEvent clientFeatureTriggered](self, "clientFeatureTriggered");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("clientFeatureTriggered"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("clientFeatureTriggered"));

    }
  }
  if (self->_eventMetadata)
  {
    -[SISchemaABClientEvent eventMetadata](self, "eventMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("eventMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("eventMetadata"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaABClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaABClientEvent)initWithJSON:(id)a3
{
  void *v4;
  SISchemaABClientEvent *v5;
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
    self = -[SISchemaABClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaABClientEvent)initWithDictionary:(id)a3
{
  id v4;
  SISchemaABClientEvent *v5;
  void *v6;
  SISchemaABClientEventMetadata *v7;
  void *v8;
  SISchemaABExperimentAllocationChanged *v9;
  void *v10;
  SISchemaABExperimentAssetRetrievalStatusChanged *v11;
  void *v12;
  SISchemaABExperimentClientFeatureTriggered *v13;
  SISchemaABClientEvent *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SISchemaABClientEvent;
  v5 = -[SISchemaABClientEvent init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaABClientEventMetadata initWithDictionary:]([SISchemaABClientEventMetadata alloc], "initWithDictionary:", v6);
      -[SISchemaABClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allocationChanged"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SISchemaABExperimentAllocationChanged initWithDictionary:]([SISchemaABExperimentAllocationChanged alloc], "initWithDictionary:", v8);
      -[SISchemaABClientEvent setAllocationChanged:](v5, "setAllocationChanged:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetRetrievalStatusChanged"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaABExperimentAssetRetrievalStatusChanged initWithDictionary:]([SISchemaABExperimentAssetRetrievalStatusChanged alloc], "initWithDictionary:", v10);
      -[SISchemaABClientEvent setAssetRetrievalStatusChanged:](v5, "setAssetRetrievalStatusChanged:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientFeatureTriggered"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaABExperimentClientFeatureTriggered initWithDictionary:]([SISchemaABExperimentClientFeatureTriggered alloc], "initWithDictionary:", v12);
      -[SISchemaABClientEvent setClientFeatureTriggered:](v5, "setClientFeatureTriggered:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (SISchemaABClientEventMetadata)eventMetadata
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

- (BOOL)hasAllocationChanged
{
  return self->_hasAllocationChanged;
}

- (void)setHasAllocationChanged:(BOOL)a3
{
  self->_hasAllocationChanged = a3;
}

- (BOOL)hasAssetRetrievalStatusChanged
{
  return self->_hasAssetRetrievalStatusChanged;
}

- (void)setHasAssetRetrievalStatusChanged:(BOOL)a3
{
  self->_hasAssetRetrievalStatusChanged = a3;
}

- (BOOL)hasClientFeatureTriggered
{
  return self->_hasClientFeatureTriggered;
}

- (void)setHasClientFeatureTriggered:(BOOL)a3
{
  self->_hasClientFeatureTriggered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientFeatureTriggered, 0);
  objc_storeStrong((id *)&self->_assetRetrievalStatusChanged, 0);
  objc_storeStrong((id *)&self->_allocationChanged, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 10;
}

@end
