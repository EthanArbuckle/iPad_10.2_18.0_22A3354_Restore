@implementation SICSchemaSICInvocationContext

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
  v16.super_class = (Class)SICSchemaSICInvocationContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SICSchemaSICInvocationContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SICSchemaSICInvocationContext deleteStartedOrChanged](self, "deleteStartedOrChanged");
  -[SICSchemaSICInvocationContext ended](self, "ended");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SICSchemaSICInvocationContext deleteEnded](self, "deleteEnded");
  -[SICSchemaSICInvocationContext cancelled](self, "cancelled");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[SICSchemaSICInvocationContext deleteCancelled](self, "deleteCancelled");

  return v5;
}

- (void)setStartedOrChanged:(id)a3
{
  SICSchemaSICInvocationStarted *v4;
  SICSchemaSICInvocationEnded *ended;
  SICSchemaSICInvocationCancelled *cancelled;
  unint64_t v7;
  SICSchemaSICInvocationStarted *startedOrChanged;

  v4 = (SICSchemaSICInvocationStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  v7 = 101;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;

}

- (SICSchemaSICInvocationStarted)startedOrChanged
{
  if (self->_whichContextevent == 101)
    return self->_startedOrChanged;
  else
    return (SICSchemaSICInvocationStarted *)0;
}

- (void)deleteStartedOrChanged
{
  SICSchemaSICInvocationStarted *startedOrChanged;

  if (self->_whichContextevent == 101)
  {
    self->_whichContextevent = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;

  }
}

- (void)setEnded:(id)a3
{
  SICSchemaSICInvocationEnded *v4;
  SICSchemaSICInvocationStarted *startedOrChanged;
  SICSchemaSICInvocationCancelled *cancelled;
  unint64_t v7;
  SICSchemaSICInvocationEnded *ended;

  v4 = (SICSchemaSICInvocationEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  v7 = 102;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  ended = self->_ended;
  self->_ended = v4;

}

- (SICSchemaSICInvocationEnded)ended
{
  if (self->_whichContextevent == 102)
    return self->_ended;
  else
    return (SICSchemaSICInvocationEnded *)0;
}

- (void)deleteEnded
{
  SICSchemaSICInvocationEnded *ended;

  if (self->_whichContextevent == 102)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (void)setCancelled:(id)a3
{
  SICSchemaSICInvocationCancelled *v4;
  SICSchemaSICInvocationStarted *startedOrChanged;
  SICSchemaSICInvocationEnded *ended;
  unint64_t v7;
  SICSchemaSICInvocationCancelled *cancelled;

  v4 = (SICSchemaSICInvocationCancelled *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  v7 = 103;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  cancelled = self->_cancelled;
  self->_cancelled = v4;

}

- (SICSchemaSICInvocationCancelled)cancelled
{
  if (self->_whichContextevent == 103)
    return self->_cancelled;
  else
    return (SICSchemaSICInvocationCancelled *)0;
}

- (void)deleteCancelled
{
  SICSchemaSICInvocationCancelled *cancelled;

  if (self->_whichContextevent == 103)
  {
    self->_whichContextevent = 0;
    cancelled = self->_cancelled;
    self->_cancelled = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return SICSchemaSICInvocationContextReadFrom(self, (uint64_t)a3);
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
  -[SICSchemaSICInvocationContext startedOrChanged](self, "startedOrChanged");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SICSchemaSICInvocationContext startedOrChanged](self, "startedOrChanged");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SICSchemaSICInvocationContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SICSchemaSICInvocationContext ended](self, "ended");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SICSchemaSICInvocationContext cancelled](self, "cancelled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SICSchemaSICInvocationContext cancelled](self, "cancelled");
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
  -[SICSchemaSICInvocationContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedOrChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[SICSchemaSICInvocationContext startedOrChanged](self, "startedOrChanged");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SICSchemaSICInvocationContext startedOrChanged](self, "startedOrChanged");
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
  -[SICSchemaSICInvocationContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[SICSchemaSICInvocationContext ended](self, "ended");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[SICSchemaSICInvocationContext ended](self, "ended");
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
  -[SICSchemaSICInvocationContext cancelled](self, "cancelled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SICSchemaSICInvocationContext cancelled](self, "cancelled");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[SICSchemaSICInvocationContext cancelled](self, "cancelled");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelled");
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

  v3 = -[SICSchemaSICInvocationStarted hash](self->_startedOrChanged, "hash");
  v4 = -[SICSchemaSICInvocationEnded hash](self->_ended, "hash") ^ v3;
  return v4 ^ -[SICSchemaSICInvocationCancelled hash](self->_cancelled, "hash");
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
  if (self->_cancelled)
  {
    -[SICSchemaSICInvocationContext cancelled](self, "cancelled");
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
  if (self->_ended)
  {
    -[SICSchemaSICInvocationContext ended](self, "ended");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ended"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ended"));

    }
  }
  if (self->_startedOrChanged)
  {
    -[SICSchemaSICInvocationContext startedOrChanged](self, "startedOrChanged");
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

  -[SICSchemaSICInvocationContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SICSchemaSICInvocationContext)initWithJSON:(id)a3
{
  void *v4;
  SICSchemaSICInvocationContext *v5;
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
    self = -[SICSchemaSICInvocationContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SICSchemaSICInvocationContext)initWithDictionary:(id)a3
{
  id v4;
  SICSchemaSICInvocationContext *v5;
  void *v6;
  SICSchemaSICInvocationStarted *v7;
  void *v8;
  SICSchemaSICInvocationEnded *v9;
  void *v10;
  SICSchemaSICInvocationCancelled *v11;
  SICSchemaSICInvocationContext *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SICSchemaSICInvocationContext;
  v5 = -[SICSchemaSICInvocationContext init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SICSchemaSICInvocationStarted initWithDictionary:]([SICSchemaSICInvocationStarted alloc], "initWithDictionary:", v6);
      -[SICSchemaSICInvocationContext setStartedOrChanged:](v5, "setStartedOrChanged:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SICSchemaSICInvocationEnded initWithDictionary:]([SICSchemaSICInvocationEnded alloc], "initWithDictionary:", v8);
      -[SICSchemaSICInvocationContext setEnded:](v5, "setEnded:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SICSchemaSICInvocationCancelled initWithDictionary:]([SICSchemaSICInvocationCancelled alloc], "initWithDictionary:", v10);
      -[SICSchemaSICInvocationContext setCancelled:](v5, "setCancelled:", v11);

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
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

@end
