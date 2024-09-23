@implementation TTSSchemaTTSClientSynthesisContext

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
  void *v18;
  void *v19;
  int v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TTSSchemaTTSClientSynthesisContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTSSchemaTTSClientSynthesisContext contextId](self, "contextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[TTSSchemaTTSClientSynthesisContext deleteContextId](self, "deleteContextId");
  -[TTSSchemaTTSClientSynthesisContext startedOrChanged](self, "startedOrChanged");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[TTSSchemaTTSClientSynthesisContext deleteStartedOrChanged](self, "deleteStartedOrChanged");
  -[TTSSchemaTTSClientSynthesisContext ended](self, "ended");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[TTSSchemaTTSClientSynthesisContext deleteEnded](self, "deleteEnded");
  -[TTSSchemaTTSClientSynthesisContext failed](self, "failed");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[TTSSchemaTTSClientSynthesisContext deleteFailed](self, "deleteFailed");
  -[TTSSchemaTTSClientSynthesisContext cancelled](self, "cancelled");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[TTSSchemaTTSClientSynthesisContext deleteCancelled](self, "deleteCancelled");

  return v5;
}

- (BOOL)hasContextId
{
  return self->_contextId != 0;
}

- (void)deleteContextId
{
  -[TTSSchemaTTSClientSynthesisContext setContextId:](self, "setContextId:", 0);
}

- (void)setStartedOrChanged:(id)a3
{
  TTSSchemaTTSSynthesisStarted *v4;
  TTSSchemaTTSSynthesisEnded *ended;
  TTSSchemaTTSSynthesisFailed *failed;
  TTSSchemaTTSSynthesisCancelled *cancelled;
  unint64_t v8;
  TTSSchemaTTSSynthesisStarted *startedOrChanged;

  v4 = (TTSSchemaTTSSynthesisStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  v8 = 101;
  if (!v4)
    v8 = 0;
  self->_whichContextevent = v8;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;

}

- (TTSSchemaTTSSynthesisStarted)startedOrChanged
{
  if (self->_whichContextevent == 101)
    return self->_startedOrChanged;
  else
    return (TTSSchemaTTSSynthesisStarted *)0;
}

- (void)deleteStartedOrChanged
{
  TTSSchemaTTSSynthesisStarted *startedOrChanged;

  if (self->_whichContextevent == 101)
  {
    self->_whichContextevent = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;

  }
}

- (void)setEnded:(id)a3
{
  TTSSchemaTTSSynthesisEnded *v4;
  TTSSchemaTTSSynthesisStarted *startedOrChanged;
  TTSSchemaTTSSynthesisFailed *failed;
  TTSSchemaTTSSynthesisCancelled *cancelled;
  unint64_t v8;
  TTSSchemaTTSSynthesisEnded *ended;

  v4 = (TTSSchemaTTSSynthesisEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  v8 = 102;
  if (!v4)
    v8 = 0;
  self->_whichContextevent = v8;
  ended = self->_ended;
  self->_ended = v4;

}

- (TTSSchemaTTSSynthesisEnded)ended
{
  if (self->_whichContextevent == 102)
    return self->_ended;
  else
    return (TTSSchemaTTSSynthesisEnded *)0;
}

- (void)deleteEnded
{
  TTSSchemaTTSSynthesisEnded *ended;

  if (self->_whichContextevent == 102)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (void)setFailed:(id)a3
{
  TTSSchemaTTSSynthesisFailed *v4;
  TTSSchemaTTSSynthesisStarted *startedOrChanged;
  TTSSchemaTTSSynthesisEnded *ended;
  TTSSchemaTTSSynthesisCancelled *cancelled;
  unint64_t v8;
  TTSSchemaTTSSynthesisFailed *failed;

  v4 = (TTSSchemaTTSSynthesisFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  v8 = 103;
  if (!v4)
    v8 = 0;
  self->_whichContextevent = v8;
  failed = self->_failed;
  self->_failed = v4;

}

- (TTSSchemaTTSSynthesisFailed)failed
{
  if (self->_whichContextevent == 103)
    return self->_failed;
  else
    return (TTSSchemaTTSSynthesisFailed *)0;
}

- (void)deleteFailed
{
  TTSSchemaTTSSynthesisFailed *failed;

  if (self->_whichContextevent == 103)
  {
    self->_whichContextevent = 0;
    failed = self->_failed;
    self->_failed = 0;

  }
}

- (void)setCancelled:(id)a3
{
  TTSSchemaTTSSynthesisCancelled *v4;
  TTSSchemaTTSSynthesisStarted *startedOrChanged;
  TTSSchemaTTSSynthesisEnded *ended;
  TTSSchemaTTSSynthesisFailed *failed;
  unint64_t v8;
  TTSSchemaTTSSynthesisCancelled *cancelled;

  v4 = (TTSSchemaTTSSynthesisCancelled *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  v8 = 104;
  if (!v4)
    v8 = 0;
  self->_whichContextevent = v8;
  cancelled = self->_cancelled;
  self->_cancelled = v4;

}

- (TTSSchemaTTSSynthesisCancelled)cancelled
{
  if (self->_whichContextevent == 104)
    return self->_cancelled;
  else
    return (TTSSchemaTTSSynthesisCancelled *)0;
}

- (void)deleteCancelled
{
  TTSSchemaTTSSynthesisCancelled *cancelled;

  if (self->_whichContextevent == 104)
  {
    self->_whichContextevent = 0;
    cancelled = self->_cancelled;
    self->_cancelled = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSClientSynthesisContextReadFrom(self, (uint64_t)a3);
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
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[TTSSchemaTTSClientSynthesisContext contextId](self, "contextId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TTSSchemaTTSClientSynthesisContext contextId](self, "contextId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[TTSSchemaTTSClientSynthesisContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TTSSchemaTTSClientSynthesisContext startedOrChanged](self, "startedOrChanged");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[TTSSchemaTTSClientSynthesisContext ended](self, "ended");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TTSSchemaTTSClientSynthesisContext ended](self, "ended");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[TTSSchemaTTSClientSynthesisContext failed](self, "failed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TTSSchemaTTSClientSynthesisContext failed](self, "failed");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[TTSSchemaTTSClientSynthesisContext cancelled](self, "cancelled");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TTSSchemaTTSClientSynthesisContext cancelled](self, "cancelled");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  whichContextevent = self->_whichContextevent;
  if (whichContextevent != objc_msgSend(v4, "whichContextevent"))
    goto LABEL_28;
  -[TTSSchemaTTSClientSynthesisContext contextId](self, "contextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[TTSSchemaTTSClientSynthesisContext contextId](self, "contextId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[TTSSchemaTTSClientSynthesisContext contextId](self, "contextId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  else
  {

  }
  -[TTSSchemaTTSClientSynthesisContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedOrChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[TTSSchemaTTSClientSynthesisContext startedOrChanged](self, "startedOrChanged");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[TTSSchemaTTSClientSynthesisContext startedOrChanged](self, "startedOrChanged");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedOrChanged");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  else
  {

  }
  -[TTSSchemaTTSClientSynthesisContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[TTSSchemaTTSClientSynthesisContext ended](self, "ended");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[TTSSchemaTTSClientSynthesisContext ended](self, "ended");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_28;
  }
  else
  {

  }
  -[TTSSchemaTTSClientSynthesisContext failed](self, "failed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[TTSSchemaTTSClientSynthesisContext failed](self, "failed");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[TTSSchemaTTSClientSynthesisContext failed](self, "failed");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failed");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[TTSSchemaTTSClientSynthesisContext cancelled](self, "cancelled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[TTSSchemaTTSClientSynthesisContext cancelled](self, "cancelled");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_31:
      v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    -[TTSSchemaTTSClientSynthesisContext cancelled](self, "cancelled");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelled");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_31;
  }
  else
  {
LABEL_27:

  }
LABEL_28:
  v33 = 0;
LABEL_29:

  return v33;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[SISchemaUUID hash](self->_contextId, "hash");
  v4 = -[TTSSchemaTTSSynthesisStarted hash](self->_startedOrChanged, "hash") ^ v3;
  v5 = -[TTSSchemaTTSSynthesisEnded hash](self->_ended, "hash");
  v6 = v4 ^ v5 ^ -[TTSSchemaTTSSynthesisFailed hash](self->_failed, "hash");
  return v6 ^ -[TTSSchemaTTSSynthesisCancelled hash](self->_cancelled, "hash");
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
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cancelled)
  {
    -[TTSSchemaTTSClientSynthesisContext cancelled](self, "cancelled");
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
  if (self->_contextId)
  {
    -[TTSSchemaTTSClientSynthesisContext contextId](self, "contextId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("contextId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("contextId"));

    }
  }
  if (self->_ended)
  {
    -[TTSSchemaTTSClientSynthesisContext ended](self, "ended");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ended"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ended"));

    }
  }
  if (self->_failed)
  {
    -[TTSSchemaTTSClientSynthesisContext failed](self, "failed");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("failed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("failed"));

    }
  }
  if (self->_startedOrChanged)
  {
    -[TTSSchemaTTSClientSynthesisContext startedOrChanged](self, "startedOrChanged");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("startedOrChanged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("startedOrChanged"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[TTSSchemaTTSClientSynthesisContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (TTSSchemaTTSClientSynthesisContext)initWithJSON:(id)a3
{
  void *v4;
  TTSSchemaTTSClientSynthesisContext *v5;
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
    self = -[TTSSchemaTTSClientSynthesisContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (TTSSchemaTTSClientSynthesisContext)initWithDictionary:(id)a3
{
  id v4;
  TTSSchemaTTSClientSynthesisContext *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  TTSSchemaTTSSynthesisStarted *v9;
  void *v10;
  TTSSchemaTTSSynthesisEnded *v11;
  void *v12;
  TTSSchemaTTSSynthesisFailed *v13;
  void *v14;
  TTSSchemaTTSSynthesisCancelled *v15;
  TTSSchemaTTSClientSynthesisContext *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TTSSchemaTTSClientSynthesisContext;
  v5 = -[TTSSchemaTTSClientSynthesisContext init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contextId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[TTSSchemaTTSClientSynthesisContext setContextId:](v5, "setContextId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[TTSSchemaTTSSynthesisStarted initWithDictionary:]([TTSSchemaTTSSynthesisStarted alloc], "initWithDictionary:", v8);
      -[TTSSchemaTTSClientSynthesisContext setStartedOrChanged:](v5, "setStartedOrChanged:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[TTSSchemaTTSSynthesisEnded initWithDictionary:]([TTSSchemaTTSSynthesisEnded alloc], "initWithDictionary:", v10);
      -[TTSSchemaTTSClientSynthesisContext setEnded:](v5, "setEnded:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[TTSSchemaTTSSynthesisFailed initWithDictionary:]([TTSSchemaTTSSynthesisFailed alloc], "initWithDictionary:", v12);
      -[TTSSchemaTTSClientSynthesisContext setFailed:](v5, "setFailed:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[TTSSchemaTTSSynthesisCancelled initWithDictionary:]([TTSSchemaTTSSynthesisCancelled alloc], "initWithDictionary:", v14);
      -[TTSSchemaTTSClientSynthesisContext setCancelled:](v5, "setCancelled:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (SISchemaUUID)contextId
{
  return self->_contextId;
}

- (void)setContextId:(id)a3
{
  objc_storeStrong((id *)&self->_contextId, a3);
}

- (void)setHasContextId:(BOOL)a3
{
  self->_hasContextId = a3;
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
  objc_storeStrong((id *)&self->_contextId, 0);
}

@end
