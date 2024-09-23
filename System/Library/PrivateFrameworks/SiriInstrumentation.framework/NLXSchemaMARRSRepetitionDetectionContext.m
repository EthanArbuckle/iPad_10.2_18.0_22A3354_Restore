@implementation NLXSchemaMARRSRepetitionDetectionContext

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
  v22.super_class = (Class)NLXSchemaMARRSRepetitionDetectionContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaMARRSRepetitionDetectionContext started](self, "started");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLXSchemaMARRSRepetitionDetectionContext deleteStarted](self, "deleteStarted");
  -[NLXSchemaMARRSRepetitionDetectionContext evaluated](self, "evaluated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NLXSchemaMARRSRepetitionDetectionContext deleteEvaluated](self, "deleteEvaluated");
  -[NLXSchemaMARRSRepetitionDetectionContext failed](self, "failed");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[NLXSchemaMARRSRepetitionDetectionContext deleteFailed](self, "deleteFailed");
  -[NLXSchemaMARRSRepetitionDetectionContext startedOrChanged](self, "startedOrChanged");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[NLXSchemaMARRSRepetitionDetectionContext deleteStartedOrChanged](self, "deleteStartedOrChanged");
  -[NLXSchemaMARRSRepetitionDetectionContext ended](self, "ended");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[NLXSchemaMARRSRepetitionDetectionContext deleteEnded](self, "deleteEnded");

  return v5;
}

- (void)setStarted:(id)a3
{
  NLXSchemaMARRSRepetitionDetectionStarted *v4;
  NLXSchemaMARRSRepetitionDetectionEvaluated *evaluated;
  NLXSchemaMARRSRepetitionDetectionFailed *failed;
  NLXSchemaMARRSRepetitionDetectionStarted *startedOrChanged;
  NLXSchemaMARRSRepetitionDetectionEvaluated *ended;
  NLXSchemaMARRSRepetitionDetectionStarted *started;

  v4 = (NLXSchemaMARRSRepetitionDetectionStarted *)a3;
  evaluated = self->_evaluated;
  self->_evaluated = 0;

  failed = self->_failed;
  self->_failed = 0;

  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  self->_whichContextevent = v4 != 0;
  started = self->_started;
  self->_started = v4;

}

- (NLXSchemaMARRSRepetitionDetectionStarted)started
{
  if (self->_whichContextevent == 1)
    return self->_started;
  else
    return (NLXSchemaMARRSRepetitionDetectionStarted *)0;
}

- (void)deleteStarted
{
  NLXSchemaMARRSRepetitionDetectionStarted *started;

  if (self->_whichContextevent == 1)
  {
    self->_whichContextevent = 0;
    started = self->_started;
    self->_started = 0;

  }
}

- (void)setEvaluated:(id)a3
{
  NLXSchemaMARRSRepetitionDetectionEvaluated *v4;
  NLXSchemaMARRSRepetitionDetectionStarted *started;
  NLXSchemaMARRSRepetitionDetectionFailed *failed;
  NLXSchemaMARRSRepetitionDetectionStarted *startedOrChanged;
  NLXSchemaMARRSRepetitionDetectionEvaluated *ended;
  NLXSchemaMARRSRepetitionDetectionEvaluated *evaluated;

  v4 = (NLXSchemaMARRSRepetitionDetectionEvaluated *)a3;
  started = self->_started;
  self->_started = 0;

  failed = self->_failed;
  self->_failed = 0;

  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  self->_whichContextevent = 2 * (v4 != 0);
  evaluated = self->_evaluated;
  self->_evaluated = v4;

}

- (NLXSchemaMARRSRepetitionDetectionEvaluated)evaluated
{
  if (self->_whichContextevent == 2)
    return self->_evaluated;
  else
    return (NLXSchemaMARRSRepetitionDetectionEvaluated *)0;
}

- (void)deleteEvaluated
{
  NLXSchemaMARRSRepetitionDetectionEvaluated *evaluated;

  if (self->_whichContextevent == 2)
  {
    self->_whichContextevent = 0;
    evaluated = self->_evaluated;
    self->_evaluated = 0;

  }
}

- (void)setFailed:(id)a3
{
  NLXSchemaMARRSRepetitionDetectionFailed *v4;
  NLXSchemaMARRSRepetitionDetectionStarted *started;
  NLXSchemaMARRSRepetitionDetectionEvaluated *evaluated;
  NLXSchemaMARRSRepetitionDetectionStarted *startedOrChanged;
  NLXSchemaMARRSRepetitionDetectionEvaluated *ended;
  unint64_t v9;
  NLXSchemaMARRSRepetitionDetectionFailed *failed;

  v4 = (NLXSchemaMARRSRepetitionDetectionFailed *)a3;
  started = self->_started;
  self->_started = 0;

  evaluated = self->_evaluated;
  self->_evaluated = 0;

  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  v9 = 3;
  if (!v4)
    v9 = 0;
  self->_whichContextevent = v9;
  failed = self->_failed;
  self->_failed = v4;

}

- (NLXSchemaMARRSRepetitionDetectionFailed)failed
{
  if (self->_whichContextevent == 3)
    return self->_failed;
  else
    return (NLXSchemaMARRSRepetitionDetectionFailed *)0;
}

- (void)deleteFailed
{
  NLXSchemaMARRSRepetitionDetectionFailed *failed;

  if (self->_whichContextevent == 3)
  {
    self->_whichContextevent = 0;
    failed = self->_failed;
    self->_failed = 0;

  }
}

- (void)setStartedOrChanged:(id)a3
{
  NLXSchemaMARRSRepetitionDetectionStarted *v4;
  NLXSchemaMARRSRepetitionDetectionStarted *started;
  NLXSchemaMARRSRepetitionDetectionEvaluated *evaluated;
  NLXSchemaMARRSRepetitionDetectionFailed *failed;
  NLXSchemaMARRSRepetitionDetectionEvaluated *ended;
  NLXSchemaMARRSRepetitionDetectionStarted *startedOrChanged;

  v4 = (NLXSchemaMARRSRepetitionDetectionStarted *)a3;
  started = self->_started;
  self->_started = 0;

  evaluated = self->_evaluated;
  self->_evaluated = 0;

  failed = self->_failed;
  self->_failed = 0;

  ended = self->_ended;
  self->_ended = 0;

  self->_whichContextevent = 4 * (v4 != 0);
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;

}

- (NLXSchemaMARRSRepetitionDetectionStarted)startedOrChanged
{
  if (self->_whichContextevent == 4)
    return self->_startedOrChanged;
  else
    return (NLXSchemaMARRSRepetitionDetectionStarted *)0;
}

- (void)deleteStartedOrChanged
{
  NLXSchemaMARRSRepetitionDetectionStarted *startedOrChanged;

  if (self->_whichContextevent == 4)
  {
    self->_whichContextevent = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;

  }
}

- (void)setEnded:(id)a3
{
  NLXSchemaMARRSRepetitionDetectionEvaluated *v4;
  NLXSchemaMARRSRepetitionDetectionStarted *started;
  NLXSchemaMARRSRepetitionDetectionEvaluated *evaluated;
  NLXSchemaMARRSRepetitionDetectionFailed *failed;
  NLXSchemaMARRSRepetitionDetectionStarted *startedOrChanged;
  unint64_t v9;
  NLXSchemaMARRSRepetitionDetectionEvaluated *ended;

  v4 = (NLXSchemaMARRSRepetitionDetectionEvaluated *)a3;
  started = self->_started;
  self->_started = 0;

  evaluated = self->_evaluated;
  self->_evaluated = 0;

  failed = self->_failed;
  self->_failed = 0;

  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  v9 = 5;
  if (!v4)
    v9 = 0;
  self->_whichContextevent = v9;
  ended = self->_ended;
  self->_ended = v4;

}

- (NLXSchemaMARRSRepetitionDetectionEvaluated)ended
{
  if (self->_whichContextevent == 5)
    return self->_ended;
  else
    return (NLXSchemaMARRSRepetitionDetectionEvaluated *)0;
}

- (void)deleteEnded
{
  NLXSchemaMARRSRepetitionDetectionEvaluated *ended;

  if (self->_whichContextevent == 5)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMARRSRepetitionDetectionContextReadFrom(self, (uint64_t)a3);
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
  -[NLXSchemaMARRSRepetitionDetectionContext started](self, "started");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLXSchemaMARRSRepetitionDetectionContext started](self, "started");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaMARRSRepetitionDetectionContext evaluated](self, "evaluated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NLXSchemaMARRSRepetitionDetectionContext evaluated](self, "evaluated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaMARRSRepetitionDetectionContext failed](self, "failed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NLXSchemaMARRSRepetitionDetectionContext failed](self, "failed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaMARRSRepetitionDetectionContext startedOrChanged](self, "startedOrChanged");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NLXSchemaMARRSRepetitionDetectionContext startedOrChanged](self, "startedOrChanged");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaMARRSRepetitionDetectionContext ended](self, "ended");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NLXSchemaMARRSRepetitionDetectionContext ended](self, "ended");
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
  -[NLXSchemaMARRSRepetitionDetectionContext started](self, "started");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "started");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[NLXSchemaMARRSRepetitionDetectionContext started](self, "started");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NLXSchemaMARRSRepetitionDetectionContext started](self, "started");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "started");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_28;
  }
  else
  {

  }
  -[NLXSchemaMARRSRepetitionDetectionContext evaluated](self, "evaluated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "evaluated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[NLXSchemaMARRSRepetitionDetectionContext evaluated](self, "evaluated");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[NLXSchemaMARRSRepetitionDetectionContext evaluated](self, "evaluated");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "evaluated");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_28;
  }
  else
  {

  }
  -[NLXSchemaMARRSRepetitionDetectionContext failed](self, "failed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[NLXSchemaMARRSRepetitionDetectionContext failed](self, "failed");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[NLXSchemaMARRSRepetitionDetectionContext failed](self, "failed");
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
  -[NLXSchemaMARRSRepetitionDetectionContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedOrChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_27;
  -[NLXSchemaMARRSRepetitionDetectionContext startedOrChanged](self, "startedOrChanged");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[NLXSchemaMARRSRepetitionDetectionContext startedOrChanged](self, "startedOrChanged");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedOrChanged");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[NLXSchemaMARRSRepetitionDetectionContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[NLXSchemaMARRSRepetitionDetectionContext ended](self, "ended");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_31:
      v33 = 1;
      goto LABEL_29;
    }
    v29 = (void *)v28;
    -[NLXSchemaMARRSRepetitionDetectionContext ended](self, "ended");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
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

  v3 = -[NLXSchemaMARRSRepetitionDetectionStarted hash](self->_started, "hash");
  v4 = -[NLXSchemaMARRSRepetitionDetectionEvaluated hash](self->_evaluated, "hash") ^ v3;
  v5 = -[NLXSchemaMARRSRepetitionDetectionFailed hash](self->_failed, "hash");
  v6 = v4 ^ v5 ^ -[NLXSchemaMARRSRepetitionDetectionStarted hash](self->_startedOrChanged, "hash");
  return v6 ^ -[NLXSchemaMARRSRepetitionDetectionEvaluated hash](self->_ended, "hash");
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
  if (self->_ended)
  {
    -[NLXSchemaMARRSRepetitionDetectionContext ended](self, "ended");
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
  if (self->_evaluated)
  {
    -[NLXSchemaMARRSRepetitionDetectionContext evaluated](self, "evaluated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("evaluated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("evaluated"));

    }
  }
  if (self->_failed)
  {
    -[NLXSchemaMARRSRepetitionDetectionContext failed](self, "failed");
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
  if (self->_started)
  {
    -[NLXSchemaMARRSRepetitionDetectionContext started](self, "started");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("started"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("started"));

    }
  }
  if (self->_startedOrChanged)
  {
    -[NLXSchemaMARRSRepetitionDetectionContext startedOrChanged](self, "startedOrChanged");
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

  -[NLXSchemaMARRSRepetitionDetectionContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaMARRSRepetitionDetectionContext)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaMARRSRepetitionDetectionContext *v5;
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
    self = -[NLXSchemaMARRSRepetitionDetectionContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaMARRSRepetitionDetectionContext)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaMARRSRepetitionDetectionContext *v5;
  void *v6;
  NLXSchemaMARRSRepetitionDetectionStarted *v7;
  void *v8;
  NLXSchemaMARRSRepetitionDetectionEvaluated *v9;
  void *v10;
  NLXSchemaMARRSRepetitionDetectionFailed *v11;
  void *v12;
  NLXSchemaMARRSRepetitionDetectionStarted *v13;
  void *v14;
  NLXSchemaMARRSRepetitionDetectionEvaluated *v15;
  NLXSchemaMARRSRepetitionDetectionContext *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NLXSchemaMARRSRepetitionDetectionContext;
  v5 = -[NLXSchemaMARRSRepetitionDetectionContext init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("started"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[NLXSchemaMARRSRepetitionDetectionStarted initWithDictionary:]([NLXSchemaMARRSRepetitionDetectionStarted alloc], "initWithDictionary:", v6);
      -[NLXSchemaMARRSRepetitionDetectionContext setStarted:](v5, "setStarted:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evaluated"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[NLXSchemaMARRSRepetitionDetectionEvaluated initWithDictionary:]([NLXSchemaMARRSRepetitionDetectionEvaluated alloc], "initWithDictionary:", v8);
      -[NLXSchemaMARRSRepetitionDetectionContext setEvaluated:](v5, "setEvaluated:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[NLXSchemaMARRSRepetitionDetectionFailed initWithDictionary:]([NLXSchemaMARRSRepetitionDetectionFailed alloc], "initWithDictionary:", v10);
      -[NLXSchemaMARRSRepetitionDetectionContext setFailed:](v5, "setFailed:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[NLXSchemaMARRSRepetitionDetectionStarted initWithDictionary:]([NLXSchemaMARRSRepetitionDetectionStarted alloc], "initWithDictionary:", v12);
      -[NLXSchemaMARRSRepetitionDetectionContext setStartedOrChanged:](v5, "setStartedOrChanged:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[NLXSchemaMARRSRepetitionDetectionEvaluated initWithDictionary:]([NLXSchemaMARRSRepetitionDetectionEvaluated alloc], "initWithDictionary:", v14);
      -[NLXSchemaMARRSRepetitionDetectionContext setEnded:](v5, "setEnded:", v15);

    }
    v16 = v5;

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

- (BOOL)hasEvaluated
{
  return self->_hasEvaluated;
}

- (void)setHasEvaluated:(BOOL)a3
{
  self->_hasEvaluated = a3;
}

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void)setHasFailed:(BOOL)a3
{
  self->_hasFailed = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_evaluated, 0);
  objc_storeStrong((id *)&self->_started, 0);
}

@end
