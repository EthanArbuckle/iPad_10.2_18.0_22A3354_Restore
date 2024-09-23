@implementation ORCHSchemaORCHCandidateRequestContext

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
  v13.super_class = (Class)ORCHSchemaORCHCandidateRequestContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ORCHSchemaORCHCandidateRequestContext started](self, "started");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ORCHSchemaORCHCandidateRequestContext deleteStarted](self, "deleteStarted");
  -[ORCHSchemaORCHCandidateRequestContext cancelled](self, "cancelled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ORCHSchemaORCHCandidateRequestContext deleteCancelled](self, "deleteCancelled");

  return v5;
}

- (void)setStarted:(id)a3
{
  ORCHSchemaORCHCandidateRequestStarted *v4;
  ORCHSchemaORCHCandidateRequestCancelled *cancelled;
  ORCHSchemaORCHCandidateRequestStarted *started;

  v4 = (ORCHSchemaORCHCandidateRequestStarted *)a3;
  cancelled = self->_cancelled;
  self->_cancelled = 0;

  self->_whichContextevent = v4 != 0;
  started = self->_started;
  self->_started = v4;

}

- (ORCHSchemaORCHCandidateRequestStarted)started
{
  if (self->_whichContextevent == 1)
    return self->_started;
  else
    return (ORCHSchemaORCHCandidateRequestStarted *)0;
}

- (void)deleteStarted
{
  ORCHSchemaORCHCandidateRequestStarted *started;

  if (self->_whichContextevent == 1)
  {
    self->_whichContextevent = 0;
    started = self->_started;
    self->_started = 0;

  }
}

- (void)setCancelled:(id)a3
{
  ORCHSchemaORCHCandidateRequestCancelled *v4;
  ORCHSchemaORCHCandidateRequestStarted *started;
  unint64_t v6;
  ORCHSchemaORCHCandidateRequestCancelled *cancelled;

  v4 = (ORCHSchemaORCHCandidateRequestCancelled *)a3;
  started = self->_started;
  self->_started = 0;

  v6 = 3;
  if (!v4)
    v6 = 0;
  self->_whichContextevent = v6;
  cancelled = self->_cancelled;
  self->_cancelled = v4;

}

- (ORCHSchemaORCHCandidateRequestCancelled)cancelled
{
  if (self->_whichContextevent == 3)
    return self->_cancelled;
  else
    return (ORCHSchemaORCHCandidateRequestCancelled *)0;
}

- (void)deleteCancelled
{
  ORCHSchemaORCHCandidateRequestCancelled *cancelled;

  if (self->_whichContextevent == 3)
  {
    self->_whichContextevent = 0;
    cancelled = self->_cancelled;
    self->_cancelled = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHCandidateRequestContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ORCHSchemaORCHCandidateRequestContext started](self, "started");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ORCHSchemaORCHCandidateRequestContext started](self, "started");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHCandidateRequestContext cancelled](self, "cancelled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ORCHSchemaORCHCandidateRequestContext cancelled](self, "cancelled");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  whichContextevent = self->_whichContextevent;
  if (whichContextevent != objc_msgSend(v4, "whichContextevent"))
    goto LABEL_13;
  -[ORCHSchemaORCHCandidateRequestContext started](self, "started");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "started");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[ORCHSchemaORCHCandidateRequestContext started](self, "started");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ORCHSchemaORCHCandidateRequestContext started](self, "started");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "started");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[ORCHSchemaORCHCandidateRequestContext cancelled](self, "cancelled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ORCHSchemaORCHCandidateRequestContext cancelled](self, "cancelled");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[ORCHSchemaORCHCandidateRequestContext cancelled](self, "cancelled");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelled");
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

  v3 = -[ORCHSchemaORCHCandidateRequestStarted hash](self->_started, "hash");
  return -[ORCHSchemaORCHCandidateRequestCancelled hash](self->_cancelled, "hash") ^ v3;
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
  if (self->_cancelled)
  {
    -[ORCHSchemaORCHCandidateRequestContext cancelled](self, "cancelled");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("cancelled"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cancelled"));

    }
  }
  if (self->_started)
  {
    -[ORCHSchemaORCHCandidateRequestContext started](self, "started");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("started"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("started"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHCandidateRequestContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHCandidateRequestContext)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHCandidateRequestContext *v5;
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
    self = -[ORCHSchemaORCHCandidateRequestContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHCandidateRequestContext)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHCandidateRequestContext *v5;
  void *v6;
  ORCHSchemaORCHCandidateRequestStarted *v7;
  void *v8;
  ORCHSchemaORCHCandidateRequestCancelled *v9;
  ORCHSchemaORCHCandidateRequestContext *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ORCHSchemaORCHCandidateRequestContext;
  v5 = -[ORCHSchemaORCHCandidateRequestContext init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("started"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ORCHSchemaORCHCandidateRequestStarted initWithDictionary:]([ORCHSchemaORCHCandidateRequestStarted alloc], "initWithDictionary:", v6);
      -[ORCHSchemaORCHCandidateRequestContext setStarted:](v5, "setStarted:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ORCHSchemaORCHCandidateRequestCancelled initWithDictionary:]([ORCHSchemaORCHCandidateRequestCancelled alloc], "initWithDictionary:", v8);
      -[ORCHSchemaORCHCandidateRequestContext setCancelled:](v5, "setCancelled:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)hasCancelled
{
  return self->_hasCancelled;
}

- (void)setHasCancelled:(BOOL)a3
{
  self->_hasCancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelled, 0);
  objc_storeStrong((id *)&self->_started, 0);
}

@end
