@implementation FLOWLINKSchemaFLOWLINKActionContext

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
  v19.super_class = (Class)FLOWLINKSchemaFLOWLINKActionContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWLINKSchemaFLOWLINKActionContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWLINKSchemaFLOWLINKActionContext deleteStartedOrChanged](self, "deleteStartedOrChanged");
  -[FLOWLINKSchemaFLOWLINKActionContext ended](self, "ended");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWLINKSchemaFLOWLINKActionContext deleteEnded](self, "deleteEnded");
  -[FLOWLINKSchemaFLOWLINKActionContext failed](self, "failed");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[FLOWLINKSchemaFLOWLINKActionContext deleteFailed](self, "deleteFailed");
  -[FLOWLINKSchemaFLOWLINKActionContext cancelled](self, "cancelled");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[FLOWLINKSchemaFLOWLINKActionContext deleteCancelled](self, "deleteCancelled");

  return v5;
}

- (void)setStartedOrChanged:(id)a3
{
  FLOWLINKSchemaFLOWLinkActionStarted *v4;
  FLOWLINKSchemaFLOWLinkActionEnded *ended;
  FLOWLINKSchemaFLOWLinkActionFailed *failed;
  FLOWLINKSchemaFLOWLinkActionCancelled *cancelled;
  FLOWLINKSchemaFLOWLinkActionStarted *startedOrChanged;

  v4 = (FLOWLINKSchemaFLOWLinkActionStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  self->_whichContextevent = v4 != 0;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;

}

- (FLOWLINKSchemaFLOWLinkActionStarted)startedOrChanged
{
  if (self->_whichContextevent == 1)
    return self->_startedOrChanged;
  else
    return (FLOWLINKSchemaFLOWLinkActionStarted *)0;
}

- (void)deleteStartedOrChanged
{
  FLOWLINKSchemaFLOWLinkActionStarted *startedOrChanged;

  if (self->_whichContextevent == 1)
  {
    self->_whichContextevent = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;

  }
}

- (void)setEnded:(id)a3
{
  FLOWLINKSchemaFLOWLinkActionEnded *v4;
  FLOWLINKSchemaFLOWLinkActionStarted *startedOrChanged;
  FLOWLINKSchemaFLOWLinkActionFailed *failed;
  FLOWLINKSchemaFLOWLinkActionCancelled *cancelled;
  FLOWLINKSchemaFLOWLinkActionEnded *ended;

  v4 = (FLOWLINKSchemaFLOWLinkActionEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  self->_whichContextevent = 2 * (v4 != 0);
  ended = self->_ended;
  self->_ended = v4;

}

- (FLOWLINKSchemaFLOWLinkActionEnded)ended
{
  if (self->_whichContextevent == 2)
    return self->_ended;
  else
    return (FLOWLINKSchemaFLOWLinkActionEnded *)0;
}

- (void)deleteEnded
{
  FLOWLINKSchemaFLOWLinkActionEnded *ended;

  if (self->_whichContextevent == 2)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (void)setFailed:(id)a3
{
  FLOWLINKSchemaFLOWLinkActionFailed *v4;
  FLOWLINKSchemaFLOWLinkActionStarted *startedOrChanged;
  FLOWLINKSchemaFLOWLinkActionEnded *ended;
  FLOWLINKSchemaFLOWLinkActionCancelled *cancelled;
  unint64_t v8;
  FLOWLINKSchemaFLOWLinkActionFailed *failed;

  v4 = (FLOWLINKSchemaFLOWLinkActionFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  v8 = 3;
  if (!v4)
    v8 = 0;
  self->_whichContextevent = v8;
  failed = self->_failed;
  self->_failed = v4;

}

- (FLOWLINKSchemaFLOWLinkActionFailed)failed
{
  if (self->_whichContextevent == 3)
    return self->_failed;
  else
    return (FLOWLINKSchemaFLOWLinkActionFailed *)0;
}

- (void)deleteFailed
{
  FLOWLINKSchemaFLOWLinkActionFailed *failed;

  if (self->_whichContextevent == 3)
  {
    self->_whichContextevent = 0;
    failed = self->_failed;
    self->_failed = 0;

  }
}

- (void)setCancelled:(id)a3
{
  FLOWLINKSchemaFLOWLinkActionCancelled *v4;
  FLOWLINKSchemaFLOWLinkActionStarted *startedOrChanged;
  FLOWLINKSchemaFLOWLinkActionEnded *ended;
  FLOWLINKSchemaFLOWLinkActionFailed *failed;
  FLOWLINKSchemaFLOWLinkActionCancelled *cancelled;

  v4 = (FLOWLINKSchemaFLOWLinkActionCancelled *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  self->_whichContextevent = 4 * (v4 != 0);
  cancelled = self->_cancelled;
  self->_cancelled = v4;

}

- (FLOWLINKSchemaFLOWLinkActionCancelled)cancelled
{
  if (self->_whichContextevent == 4)
    return self->_cancelled;
  else
    return (FLOWLINKSchemaFLOWLinkActionCancelled *)0;
}

- (void)deleteCancelled
{
  FLOWLINKSchemaFLOWLinkActionCancelled *cancelled;

  if (self->_whichContextevent == 4)
  {
    self->_whichContextevent = 0;
    cancelled = self->_cancelled;
    self->_cancelled = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWLINKSchemaFLOWLINKActionContextReadFrom(self, (uint64_t)a3);
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
  -[FLOWLINKSchemaFLOWLINKActionContext startedOrChanged](self, "startedOrChanged");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FLOWLINKSchemaFLOWLINKActionContext startedOrChanged](self, "startedOrChanged");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKActionContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FLOWLINKSchemaFLOWLINKActionContext ended](self, "ended");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKActionContext failed](self, "failed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FLOWLINKSchemaFLOWLINKActionContext failed](self, "failed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWLINKSchemaFLOWLINKActionContext cancelled](self, "cancelled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FLOWLINKSchemaFLOWLINKActionContext cancelled](self, "cancelled");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
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
  whichContextevent = self->_whichContextevent;
  if (whichContextevent != objc_msgSend(v4, "whichContextevent"))
    goto LABEL_23;
  -[FLOWLINKSchemaFLOWLINKActionContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedOrChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[FLOWLINKSchemaFLOWLINKActionContext startedOrChanged](self, "startedOrChanged");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[FLOWLINKSchemaFLOWLINKActionContext startedOrChanged](self, "startedOrChanged");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedOrChanged");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_23;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKActionContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[FLOWLINKSchemaFLOWLINKActionContext ended](self, "ended");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[FLOWLINKSchemaFLOWLINKActionContext ended](self, "ended");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKActionContext failed](self, "failed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[FLOWLINKSchemaFLOWLINKActionContext failed](self, "failed");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[FLOWLINKSchemaFLOWLINKActionContext failed](self, "failed");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failed");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[FLOWLINKSchemaFLOWLINKActionContext cancelled](self, "cancelled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[FLOWLINKSchemaFLOWLINKActionContext cancelled](self, "cancelled");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_26:
      v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    -[FLOWLINKSchemaFLOWLINKActionContext cancelled](self, "cancelled");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelled");
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

  v3 = -[FLOWLINKSchemaFLOWLinkActionStarted hash](self->_startedOrChanged, "hash");
  v4 = -[FLOWLINKSchemaFLOWLinkActionEnded hash](self->_ended, "hash") ^ v3;
  v5 = -[FLOWLINKSchemaFLOWLinkActionFailed hash](self->_failed, "hash");
  return v4 ^ v5 ^ -[FLOWLINKSchemaFLOWLinkActionCancelled hash](self->_cancelled, "hash");
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
  if (self->_cancelled)
  {
    -[FLOWLINKSchemaFLOWLINKActionContext cancelled](self, "cancelled");
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
    -[FLOWLINKSchemaFLOWLINKActionContext ended](self, "ended");
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
  if (self->_failed)
  {
    -[FLOWLINKSchemaFLOWLINKActionContext failed](self, "failed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("failed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("failed"));

    }
  }
  if (self->_startedOrChanged)
  {
    -[FLOWLINKSchemaFLOWLINKActionContext startedOrChanged](self, "startedOrChanged");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("startedOrChanged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("startedOrChanged"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWLINKSchemaFLOWLINKActionContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWLINKSchemaFLOWLINKActionContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWLINKSchemaFLOWLINKActionContext *v5;
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
    self = -[FLOWLINKSchemaFLOWLINKActionContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWLINKSchemaFLOWLINKActionContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWLINKSchemaFLOWLINKActionContext *v5;
  void *v6;
  FLOWLINKSchemaFLOWLinkActionStarted *v7;
  void *v8;
  FLOWLINKSchemaFLOWLinkActionEnded *v9;
  void *v10;
  FLOWLINKSchemaFLOWLinkActionFailed *v11;
  void *v12;
  FLOWLINKSchemaFLOWLinkActionCancelled *v13;
  FLOWLINKSchemaFLOWLINKActionContext *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FLOWLINKSchemaFLOWLINKActionContext;
  v5 = -[FLOWLINKSchemaFLOWLINKActionContext init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[FLOWLINKSchemaFLOWLinkActionStarted initWithDictionary:]([FLOWLINKSchemaFLOWLinkActionStarted alloc], "initWithDictionary:", v6);
      -[FLOWLINKSchemaFLOWLINKActionContext setStartedOrChanged:](v5, "setStartedOrChanged:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[FLOWLINKSchemaFLOWLinkActionEnded initWithDictionary:]([FLOWLINKSchemaFLOWLinkActionEnded alloc], "initWithDictionary:", v8);
      -[FLOWLINKSchemaFLOWLINKActionContext setEnded:](v5, "setEnded:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[FLOWLINKSchemaFLOWLinkActionFailed initWithDictionary:]([FLOWLINKSchemaFLOWLinkActionFailed alloc], "initWithDictionary:", v10);
      -[FLOWLINKSchemaFLOWLINKActionContext setFailed:](v5, "setFailed:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[FLOWLINKSchemaFLOWLinkActionCancelled initWithDictionary:]([FLOWLINKSchemaFLOWLinkActionCancelled alloc], "initWithDictionary:", v12);
      -[FLOWLINKSchemaFLOWLINKActionContext setCancelled:](v5, "setCancelled:", v13);

    }
    v14 = v5;

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

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void)setHasFailed:(BOOL)a3
{
  self->_hasFailed = a3;
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
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

@end
