@implementation CNVSchemaCNVIntentFinalExecutionContext

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
  v22.super_class = (Class)CNVSchemaCNVIntentFinalExecutionContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVSchemaCNVIntentFinalExecutionContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CNVSchemaCNVIntentFinalExecutionContext deleteStartedOrChanged](self, "deleteStartedOrChanged");
  -[CNVSchemaCNVIntentFinalExecutionContext ended](self, "ended");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CNVSchemaCNVIntentFinalExecutionContext deleteEnded](self, "deleteEnded");
  -[CNVSchemaCNVIntentFinalExecutionContext failed](self, "failed");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[CNVSchemaCNVIntentFinalExecutionContext deleteFailed](self, "deleteFailed");
  -[CNVSchemaCNVIntentFinalExecutionContext cancelled](self, "cancelled");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[CNVSchemaCNVIntentFinalExecutionContext deleteCancelled](self, "deleteCancelled");
  -[CNVSchemaCNVIntentFinalExecutionContext hypothesisId](self, "hypothesisId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[CNVSchemaCNVIntentFinalExecutionContext deleteHypothesisId](self, "deleteHypothesisId");

  return v5;
}

- (void)setStartedOrChanged:(id)a3
{
  CNVSchemaCNVIntentFinalExecutionStarted *v4;
  CNVSchemaCNVIntentFinalExecutionEnded *ended;
  CNVSchemaCNVIntentFinalExecutionFailed *failed;
  CNVSchemaCNVIntentFinalExecutionCancelled *cancelled;
  CNVSchemaCNVIntentFinalExecutionStarted *startedOrChanged;

  v4 = (CNVSchemaCNVIntentFinalExecutionStarted *)a3;
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

- (CNVSchemaCNVIntentFinalExecutionStarted)startedOrChanged
{
  if (self->_whichContextevent == 1)
    return self->_startedOrChanged;
  else
    return (CNVSchemaCNVIntentFinalExecutionStarted *)0;
}

- (void)deleteStartedOrChanged
{
  CNVSchemaCNVIntentFinalExecutionStarted *startedOrChanged;

  if (self->_whichContextevent == 1)
  {
    self->_whichContextevent = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;

  }
}

- (void)setEnded:(id)a3
{
  CNVSchemaCNVIntentFinalExecutionEnded *v4;
  CNVSchemaCNVIntentFinalExecutionStarted *startedOrChanged;
  CNVSchemaCNVIntentFinalExecutionFailed *failed;
  CNVSchemaCNVIntentFinalExecutionCancelled *cancelled;
  CNVSchemaCNVIntentFinalExecutionEnded *ended;

  v4 = (CNVSchemaCNVIntentFinalExecutionEnded *)a3;
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

- (CNVSchemaCNVIntentFinalExecutionEnded)ended
{
  if (self->_whichContextevent == 2)
    return self->_ended;
  else
    return (CNVSchemaCNVIntentFinalExecutionEnded *)0;
}

- (void)deleteEnded
{
  CNVSchemaCNVIntentFinalExecutionEnded *ended;

  if (self->_whichContextevent == 2)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (void)setFailed:(id)a3
{
  CNVSchemaCNVIntentFinalExecutionFailed *v4;
  CNVSchemaCNVIntentFinalExecutionStarted *startedOrChanged;
  CNVSchemaCNVIntentFinalExecutionEnded *ended;
  CNVSchemaCNVIntentFinalExecutionCancelled *cancelled;
  unint64_t v8;
  CNVSchemaCNVIntentFinalExecutionFailed *failed;

  v4 = (CNVSchemaCNVIntentFinalExecutionFailed *)a3;
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

- (CNVSchemaCNVIntentFinalExecutionFailed)failed
{
  if (self->_whichContextevent == 3)
    return self->_failed;
  else
    return (CNVSchemaCNVIntentFinalExecutionFailed *)0;
}

- (void)deleteFailed
{
  CNVSchemaCNVIntentFinalExecutionFailed *failed;

  if (self->_whichContextevent == 3)
  {
    self->_whichContextevent = 0;
    failed = self->_failed;
    self->_failed = 0;

  }
}

- (void)setCancelled:(id)a3
{
  CNVSchemaCNVIntentFinalExecutionCancelled *v4;
  CNVSchemaCNVIntentFinalExecutionStarted *startedOrChanged;
  CNVSchemaCNVIntentFinalExecutionEnded *ended;
  CNVSchemaCNVIntentFinalExecutionFailed *failed;
  CNVSchemaCNVIntentFinalExecutionCancelled *cancelled;

  v4 = (CNVSchemaCNVIntentFinalExecutionCancelled *)a3;
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

- (CNVSchemaCNVIntentFinalExecutionCancelled)cancelled
{
  if (self->_whichContextevent == 4)
    return self->_cancelled;
  else
    return (CNVSchemaCNVIntentFinalExecutionCancelled *)0;
}

- (void)deleteCancelled
{
  CNVSchemaCNVIntentFinalExecutionCancelled *cancelled;

  if (self->_whichContextevent == 4)
  {
    self->_whichContextevent = 0;
    cancelled = self->_cancelled;
    self->_cancelled = 0;

  }
}

- (BOOL)hasHypothesisId
{
  return self->_hypothesisId != 0;
}

- (void)deleteHypothesisId
{
  -[CNVSchemaCNVIntentFinalExecutionContext setHypothesisId:](self, "setHypothesisId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVIntentFinalExecutionContextReadFrom(self, (uint64_t)a3);
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
  -[CNVSchemaCNVIntentFinalExecutionContext startedOrChanged](self, "startedOrChanged");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNVSchemaCNVIntentFinalExecutionContext startedOrChanged](self, "startedOrChanged");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVIntentFinalExecutionContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNVSchemaCNVIntentFinalExecutionContext ended](self, "ended");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVIntentFinalExecutionContext failed](self, "failed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNVSchemaCNVIntentFinalExecutionContext failed](self, "failed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVIntentFinalExecutionContext cancelled](self, "cancelled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CNVSchemaCNVIntentFinalExecutionContext cancelled](self, "cancelled");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CNVSchemaCNVIntentFinalExecutionContext hypothesisId](self, "hypothesisId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CNVSchemaCNVIntentFinalExecutionContext hypothesisId](self, "hypothesisId");
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
  -[CNVSchemaCNVIntentFinalExecutionContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedOrChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[CNVSchemaCNVIntentFinalExecutionContext startedOrChanged](self, "startedOrChanged");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CNVSchemaCNVIntentFinalExecutionContext startedOrChanged](self, "startedOrChanged");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedOrChanged");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  else
  {

  }
  -[CNVSchemaCNVIntentFinalExecutionContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[CNVSchemaCNVIntentFinalExecutionContext ended](self, "ended");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[CNVSchemaCNVIntentFinalExecutionContext ended](self, "ended");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  else
  {

  }
  -[CNVSchemaCNVIntentFinalExecutionContext failed](self, "failed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[CNVSchemaCNVIntentFinalExecutionContext failed](self, "failed");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[CNVSchemaCNVIntentFinalExecutionContext failed](self, "failed");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failed");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_28;
  }
  else
  {

  }
  -[CNVSchemaCNVIntentFinalExecutionContext cancelled](self, "cancelled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[CNVSchemaCNVIntentFinalExecutionContext cancelled](self, "cancelled");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[CNVSchemaCNVIntentFinalExecutionContext cancelled](self, "cancelled");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelled");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[CNVSchemaCNVIntentFinalExecutionContext hypothesisId](self, "hypothesisId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hypothesisId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[CNVSchemaCNVIntentFinalExecutionContext hypothesisId](self, "hypothesisId");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_31:
      v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    -[CNVSchemaCNVIntentFinalExecutionContext hypothesisId](self, "hypothesisId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hypothesisId");
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

  v3 = -[CNVSchemaCNVIntentFinalExecutionStarted hash](self->_startedOrChanged, "hash");
  v4 = -[CNVSchemaCNVIntentFinalExecutionEnded hash](self->_ended, "hash") ^ v3;
  v5 = -[CNVSchemaCNVIntentFinalExecutionFailed hash](self->_failed, "hash");
  v6 = v4 ^ v5 ^ -[CNVSchemaCNVIntentFinalExecutionCancelled hash](self->_cancelled, "hash");
  return v6 ^ -[SISchemaUUID hash](self->_hypothesisId, "hash");
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
    -[CNVSchemaCNVIntentFinalExecutionContext cancelled](self, "cancelled");
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
    -[CNVSchemaCNVIntentFinalExecutionContext ended](self, "ended");
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
    -[CNVSchemaCNVIntentFinalExecutionContext failed](self, "failed");
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
  if (self->_hypothesisId)
  {
    -[CNVSchemaCNVIntentFinalExecutionContext hypothesisId](self, "hypothesisId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hypothesisId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("hypothesisId"));

    }
  }
  if (self->_startedOrChanged)
  {
    -[CNVSchemaCNVIntentFinalExecutionContext startedOrChanged](self, "startedOrChanged");
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

  -[CNVSchemaCNVIntentFinalExecutionContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CNVSchemaCNVIntentFinalExecutionContext)initWithJSON:(id)a3
{
  void *v4;
  CNVSchemaCNVIntentFinalExecutionContext *v5;
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
    self = -[CNVSchemaCNVIntentFinalExecutionContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CNVSchemaCNVIntentFinalExecutionContext)initWithDictionary:(id)a3
{
  id v4;
  CNVSchemaCNVIntentFinalExecutionContext *v5;
  void *v6;
  CNVSchemaCNVIntentFinalExecutionStarted *v7;
  void *v8;
  CNVSchemaCNVIntentFinalExecutionEnded *v9;
  void *v10;
  CNVSchemaCNVIntentFinalExecutionFailed *v11;
  void *v12;
  CNVSchemaCNVIntentFinalExecutionCancelled *v13;
  void *v14;
  SISchemaUUID *v15;
  CNVSchemaCNVIntentFinalExecutionContext *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNVSchemaCNVIntentFinalExecutionContext;
  v5 = -[CNVSchemaCNVIntentFinalExecutionContext init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[CNVSchemaCNVIntentFinalExecutionStarted initWithDictionary:]([CNVSchemaCNVIntentFinalExecutionStarted alloc], "initWithDictionary:", v6);
      -[CNVSchemaCNVIntentFinalExecutionContext setStartedOrChanged:](v5, "setStartedOrChanged:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[CNVSchemaCNVIntentFinalExecutionEnded initWithDictionary:]([CNVSchemaCNVIntentFinalExecutionEnded alloc], "initWithDictionary:", v8);
      -[CNVSchemaCNVIntentFinalExecutionContext setEnded:](v5, "setEnded:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[CNVSchemaCNVIntentFinalExecutionFailed initWithDictionary:]([CNVSchemaCNVIntentFinalExecutionFailed alloc], "initWithDictionary:", v10);
      -[CNVSchemaCNVIntentFinalExecutionContext setFailed:](v5, "setFailed:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[CNVSchemaCNVIntentFinalExecutionCancelled initWithDictionary:]([CNVSchemaCNVIntentFinalExecutionCancelled alloc], "initWithDictionary:", v12);
      -[CNVSchemaCNVIntentFinalExecutionContext setCancelled:](v5, "setCancelled:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hypothesisId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v14);
      -[CNVSchemaCNVIntentFinalExecutionContext setHypothesisId:](v5, "setHypothesisId:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (SISchemaUUID)hypothesisId
{
  return self->_hypothesisId;
}

- (void)setHypothesisId:(id)a3
{
  objc_storeStrong((id *)&self->_hypothesisId, a3);
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

- (void)setHasHypothesisId:(BOOL)a3
{
  self->_hasHypothesisId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hypothesisId, 0);
  objc_storeStrong((id *)&self->_cancelled, 0);
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

@end
