@implementation GRRSchemaGRRClientEvent

- (id)getComponentId
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  -[GRRSchemaGRRClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "grrId");
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

  -[GRRSchemaGRRClientEvent eventMetadata](self, "eventMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "grrId");
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
        LODWORD(v4) = 5;
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
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GRRSchemaGRRClientEvent;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GRRSchemaGRRClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[GRRSchemaGRRClientEvent deleteEventMetadata](self, "deleteEventMetadata");
  -[GRRSchemaGRRClientEvent featureExtractionContext](self, "featureExtractionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[GRRSchemaGRRClientEvent deleteFeatureExtractionContext](self, "deleteFeatureExtractionContext");
  -[GRRSchemaGRRClientEvent hypothesisRankingContext](self, "hypothesisRankingContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[GRRSchemaGRRClientEvent deleteHypothesisRankingContext](self, "deleteHypothesisRankingContext");
  -[GRRSchemaGRRClientEvent systemErrorOccurred](self, "systemErrorOccurred");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[GRRSchemaGRRClientEvent deleteSystemErrorOccurred](self, "deleteSystemErrorOccurred");

  return v5;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3;
  id v4;

  v3 = -[GRRSchemaGRRClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v3 - 101 > 2)
    v4 = 0;
  else
    v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5629648[v3 - 101]);
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 2)
    return 0;
  else
    return off_1E5629660[a3 - 101];
}

- (id)qualifiedMessageName
{
  unint64_t v2;

  v2 = -[GRRSchemaGRRClientEvent whichEvent_Type](self, "whichEvent_Type");
  if (v2 - 101 > 2)
    return CFSTR("com.apple.aiml.siri.grr.GRRClientEvent");
  else
    return off_1E562F378[v2 - 101];
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (void)deleteEventMetadata
{
  -[GRRSchemaGRRClientEvent setEventMetadata:](self, "setEventMetadata:", 0);
}

- (void)setFeatureExtractionContext:(id)a3
{
  GRRSchemaGRRFeatureExtractionContext *v4;
  GRRSchemaGRRHypothesisRankingContext *hypothesisRankingContext;
  GRRSchemaGRRSystemErrorOccurred *systemErrorOccurred;
  unint64_t v7;
  GRRSchemaGRRFeatureExtractionContext *featureExtractionContext;

  v4 = (GRRSchemaGRRFeatureExtractionContext *)a3;
  hypothesisRankingContext = self->_hypothesisRankingContext;
  self->_hypothesisRankingContext = 0;

  systemErrorOccurred = self->_systemErrorOccurred;
  self->_systemErrorOccurred = 0;

  v7 = 101;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  featureExtractionContext = self->_featureExtractionContext;
  self->_featureExtractionContext = v4;

}

- (GRRSchemaGRRFeatureExtractionContext)featureExtractionContext
{
  if (self->_whichEvent_Type == 101)
    return self->_featureExtractionContext;
  else
    return (GRRSchemaGRRFeatureExtractionContext *)0;
}

- (void)deleteFeatureExtractionContext
{
  GRRSchemaGRRFeatureExtractionContext *featureExtractionContext;

  if (self->_whichEvent_Type == 101)
  {
    self->_whichEvent_Type = 0;
    featureExtractionContext = self->_featureExtractionContext;
    self->_featureExtractionContext = 0;

  }
}

- (void)setHypothesisRankingContext:(id)a3
{
  GRRSchemaGRRHypothesisRankingContext *v4;
  GRRSchemaGRRFeatureExtractionContext *featureExtractionContext;
  GRRSchemaGRRSystemErrorOccurred *systemErrorOccurred;
  unint64_t v7;
  GRRSchemaGRRHypothesisRankingContext *hypothesisRankingContext;

  v4 = (GRRSchemaGRRHypothesisRankingContext *)a3;
  featureExtractionContext = self->_featureExtractionContext;
  self->_featureExtractionContext = 0;

  systemErrorOccurred = self->_systemErrorOccurred;
  self->_systemErrorOccurred = 0;

  v7 = 102;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  hypothesisRankingContext = self->_hypothesisRankingContext;
  self->_hypothesisRankingContext = v4;

}

- (GRRSchemaGRRHypothesisRankingContext)hypothesisRankingContext
{
  if (self->_whichEvent_Type == 102)
    return self->_hypothesisRankingContext;
  else
    return (GRRSchemaGRRHypothesisRankingContext *)0;
}

- (void)deleteHypothesisRankingContext
{
  GRRSchemaGRRHypothesisRankingContext *hypothesisRankingContext;

  if (self->_whichEvent_Type == 102)
  {
    self->_whichEvent_Type = 0;
    hypothesisRankingContext = self->_hypothesisRankingContext;
    self->_hypothesisRankingContext = 0;

  }
}

- (void)setSystemErrorOccurred:(id)a3
{
  GRRSchemaGRRSystemErrorOccurred *v4;
  GRRSchemaGRRFeatureExtractionContext *featureExtractionContext;
  GRRSchemaGRRHypothesisRankingContext *hypothesisRankingContext;
  unint64_t v7;
  GRRSchemaGRRSystemErrorOccurred *systemErrorOccurred;

  v4 = (GRRSchemaGRRSystemErrorOccurred *)a3;
  featureExtractionContext = self->_featureExtractionContext;
  self->_featureExtractionContext = 0;

  hypothesisRankingContext = self->_hypothesisRankingContext;
  self->_hypothesisRankingContext = 0;

  v7 = 103;
  if (!v4)
    v7 = 0;
  self->_whichEvent_Type = v7;
  systemErrorOccurred = self->_systemErrorOccurred;
  self->_systemErrorOccurred = v4;

}

- (GRRSchemaGRRSystemErrorOccurred)systemErrorOccurred
{
  if (self->_whichEvent_Type == 103)
    return self->_systemErrorOccurred;
  else
    return (GRRSchemaGRRSystemErrorOccurred *)0;
}

- (void)deleteSystemErrorOccurred
{
  GRRSchemaGRRSystemErrorOccurred *systemErrorOccurred;

  if (self->_whichEvent_Type == 103)
  {
    self->_whichEvent_Type = 0;
    systemErrorOccurred = self->_systemErrorOccurred;
    self->_systemErrorOccurred = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return GRRSchemaGRRClientEventReadFrom(self, (uint64_t)a3);
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
  -[GRRSchemaGRRClientEvent eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GRRSchemaGRRClientEvent eventMetadata](self, "eventMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRRSchemaGRRClientEvent featureExtractionContext](self, "featureExtractionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[GRRSchemaGRRClientEvent featureExtractionContext](self, "featureExtractionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRRSchemaGRRClientEvent hypothesisRankingContext](self, "hypothesisRankingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[GRRSchemaGRRClientEvent hypothesisRankingContext](self, "hypothesisRankingContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[GRRSchemaGRRClientEvent systemErrorOccurred](self, "systemErrorOccurred");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[GRRSchemaGRRClientEvent systemErrorOccurred](self, "systemErrorOccurred");
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
  -[GRRSchemaGRRClientEvent eventMetadata](self, "eventMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[GRRSchemaGRRClientEvent eventMetadata](self, "eventMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[GRRSchemaGRRClientEvent eventMetadata](self, "eventMetadata");
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
  -[GRRSchemaGRRClientEvent featureExtractionContext](self, "featureExtractionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureExtractionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[GRRSchemaGRRClientEvent featureExtractionContext](self, "featureExtractionContext");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[GRRSchemaGRRClientEvent featureExtractionContext](self, "featureExtractionContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureExtractionContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[GRRSchemaGRRClientEvent hypothesisRankingContext](self, "hypothesisRankingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hypothesisRankingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[GRRSchemaGRRClientEvent hypothesisRankingContext](self, "hypothesisRankingContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[GRRSchemaGRRClientEvent hypothesisRankingContext](self, "hypothesisRankingContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hypothesisRankingContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[GRRSchemaGRRClientEvent systemErrorOccurred](self, "systemErrorOccurred");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemErrorOccurred");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[GRRSchemaGRRClientEvent systemErrorOccurred](self, "systemErrorOccurred");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_26:
      v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    -[GRRSchemaGRRClientEvent systemErrorOccurred](self, "systemErrorOccurred");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemErrorOccurred");
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

  v3 = -[GRRSchemaGRRClientEventMetadata hash](self->_eventMetadata, "hash");
  v4 = -[GRRSchemaGRRFeatureExtractionContext hash](self->_featureExtractionContext, "hash") ^ v3;
  v5 = -[GRRSchemaGRRHypothesisRankingContext hash](self->_hypothesisRankingContext, "hash");
  return v4 ^ v5 ^ -[GRRSchemaGRRSystemErrorOccurred hash](self->_systemErrorOccurred, "hash");
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
  if (self->_eventMetadata)
  {
    -[GRRSchemaGRRClientEvent eventMetadata](self, "eventMetadata");
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
  if (self->_featureExtractionContext)
  {
    -[GRRSchemaGRRClientEvent featureExtractionContext](self, "featureExtractionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("featureExtractionContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("featureExtractionContext"));

    }
  }
  if (self->_hypothesisRankingContext)
  {
    -[GRRSchemaGRRClientEvent hypothesisRankingContext](self, "hypothesisRankingContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hypothesisRankingContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hypothesisRankingContext"));

    }
  }
  if (self->_systemErrorOccurred)
  {
    -[GRRSchemaGRRClientEvent systemErrorOccurred](self, "systemErrorOccurred");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("systemErrorOccurred"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("systemErrorOccurred"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[GRRSchemaGRRClientEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (GRRSchemaGRRClientEvent)initWithJSON:(id)a3
{
  void *v4;
  GRRSchemaGRRClientEvent *v5;
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
    self = -[GRRSchemaGRRClientEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (GRRSchemaGRRClientEvent)initWithDictionary:(id)a3
{
  id v4;
  GRRSchemaGRRClientEvent *v5;
  void *v6;
  GRRSchemaGRRClientEventMetadata *v7;
  void *v8;
  GRRSchemaGRRFeatureExtractionContext *v9;
  void *v10;
  GRRSchemaGRRHypothesisRankingContext *v11;
  void *v12;
  GRRSchemaGRRSystemErrorOccurred *v13;
  GRRSchemaGRRClientEvent *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GRRSchemaGRRClientEvent;
  v5 = -[GRRSchemaGRRClientEvent init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[GRRSchemaGRRClientEventMetadata initWithDictionary:]([GRRSchemaGRRClientEventMetadata alloc], "initWithDictionary:", v6);
      -[GRRSchemaGRRClientEvent setEventMetadata:](v5, "setEventMetadata:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("featureExtractionContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[GRRSchemaGRRFeatureExtractionContext initWithDictionary:]([GRRSchemaGRRFeatureExtractionContext alloc], "initWithDictionary:", v8);
      -[GRRSchemaGRRClientEvent setFeatureExtractionContext:](v5, "setFeatureExtractionContext:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hypothesisRankingContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[GRRSchemaGRRHypothesisRankingContext initWithDictionary:]([GRRSchemaGRRHypothesisRankingContext alloc], "initWithDictionary:", v10);
      -[GRRSchemaGRRClientEvent setHypothesisRankingContext:](v5, "setHypothesisRankingContext:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemErrorOccurred"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[GRRSchemaGRRSystemErrorOccurred initWithDictionary:]([GRRSchemaGRRSystemErrorOccurred alloc], "initWithDictionary:", v12);
      -[GRRSchemaGRRClientEvent setSystemErrorOccurred:](v5, "setSystemErrorOccurred:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (GRRSchemaGRRClientEventMetadata)eventMetadata
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

- (BOOL)hasFeatureExtractionContext
{
  return self->_hasFeatureExtractionContext;
}

- (void)setHasFeatureExtractionContext:(BOOL)a3
{
  self->_hasFeatureExtractionContext = a3;
}

- (BOOL)hasHypothesisRankingContext
{
  return self->_hasHypothesisRankingContext;
}

- (void)setHasHypothesisRankingContext:(BOOL)a3
{
  self->_hasHypothesisRankingContext = a3;
}

- (BOOL)hasSystemErrorOccurred
{
  return self->_hasSystemErrorOccurred;
}

- (void)setHasSystemErrorOccurred:(BOOL)a3
{
  self->_hasSystemErrorOccurred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemErrorOccurred, 0);
  objc_storeStrong((id *)&self->_hypothesisRankingContext, 0);
  objc_storeStrong((id *)&self->_featureExtractionContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (int)getAnyEventType
{
  return 16;
}

@end
