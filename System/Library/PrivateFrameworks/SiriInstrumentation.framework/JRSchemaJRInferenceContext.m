@implementation JRSchemaJRInferenceContext

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
  v16.super_class = (Class)JRSchemaJRInferenceContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JRSchemaJRInferenceContext started](self, "started");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[JRSchemaJRInferenceContext deleteStarted](self, "deleteStarted");
  -[JRSchemaJRInferenceContext failed](self, "failed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[JRSchemaJRInferenceContext deleteFailed](self, "deleteFailed");
  -[JRSchemaJRInferenceContext ended](self, "ended");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[JRSchemaJRInferenceContext deleteEnded](self, "deleteEnded");

  return v5;
}

- (void)setStarted:(id)a3
{
  JRSchemaJRInferenceStarted *v4;
  JRSchemaJRInferenceFailed *failed;
  JRSchemaJRInferenceEnded *ended;
  unint64_t v7;
  JRSchemaJRInferenceStarted *started;

  v4 = (JRSchemaJRInferenceStarted *)a3;
  failed = self->_failed;
  self->_failed = 0;

  ended = self->_ended;
  self->_ended = 0;

  v7 = 101;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  started = self->_started;
  self->_started = v4;

}

- (JRSchemaJRInferenceStarted)started
{
  if (self->_whichContextevent == 101)
    return self->_started;
  else
    return (JRSchemaJRInferenceStarted *)0;
}

- (void)deleteStarted
{
  JRSchemaJRInferenceStarted *started;

  if (self->_whichContextevent == 101)
  {
    self->_whichContextevent = 0;
    started = self->_started;
    self->_started = 0;

  }
}

- (void)setFailed:(id)a3
{
  JRSchemaJRInferenceFailed *v4;
  JRSchemaJRInferenceStarted *started;
  JRSchemaJRInferenceEnded *ended;
  unint64_t v7;
  JRSchemaJRInferenceFailed *failed;

  v4 = (JRSchemaJRInferenceFailed *)a3;
  started = self->_started;
  self->_started = 0;

  ended = self->_ended;
  self->_ended = 0;

  v7 = 102;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  failed = self->_failed;
  self->_failed = v4;

}

- (JRSchemaJRInferenceFailed)failed
{
  if (self->_whichContextevent == 102)
    return self->_failed;
  else
    return (JRSchemaJRInferenceFailed *)0;
}

- (void)deleteFailed
{
  JRSchemaJRInferenceFailed *failed;

  if (self->_whichContextevent == 102)
  {
    self->_whichContextevent = 0;
    failed = self->_failed;
    self->_failed = 0;

  }
}

- (void)setEnded:(id)a3
{
  JRSchemaJRInferenceEnded *v4;
  JRSchemaJRInferenceStarted *started;
  JRSchemaJRInferenceFailed *failed;
  unint64_t v7;
  JRSchemaJRInferenceEnded *ended;

  v4 = (JRSchemaJRInferenceEnded *)a3;
  started = self->_started;
  self->_started = 0;

  failed = self->_failed;
  self->_failed = 0;

  v7 = 103;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  ended = self->_ended;
  self->_ended = v4;

}

- (JRSchemaJRInferenceEnded)ended
{
  if (self->_whichContextevent == 103)
    return self->_ended;
  else
    return (JRSchemaJRInferenceEnded *)0;
}

- (void)deleteEnded
{
  JRSchemaJRInferenceEnded *ended;

  if (self->_whichContextevent == 103)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return JRSchemaJRInferenceContextReadFrom(self, (uint64_t)a3);
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
  -[JRSchemaJRInferenceContext started](self, "started");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[JRSchemaJRInferenceContext started](self, "started");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[JRSchemaJRInferenceContext failed](self, "failed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[JRSchemaJRInferenceContext failed](self, "failed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[JRSchemaJRInferenceContext ended](self, "ended");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[JRSchemaJRInferenceContext ended](self, "ended");
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
  -[JRSchemaJRInferenceContext started](self, "started");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "started");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[JRSchemaJRInferenceContext started](self, "started");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[JRSchemaJRInferenceContext started](self, "started");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "started");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[JRSchemaJRInferenceContext failed](self, "failed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[JRSchemaJRInferenceContext failed](self, "failed");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[JRSchemaJRInferenceContext failed](self, "failed");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failed");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[JRSchemaJRInferenceContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[JRSchemaJRInferenceContext ended](self, "ended");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[JRSchemaJRInferenceContext ended](self, "ended");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
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

  v3 = -[JRSchemaJRInferenceStarted hash](self->_started, "hash");
  v4 = -[JRSchemaJRInferenceFailed hash](self->_failed, "hash") ^ v3;
  return v4 ^ -[JRSchemaJRInferenceEnded hash](self->_ended, "hash");
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
    -[JRSchemaJRInferenceContext ended](self, "ended");
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
  if (self->_failed)
  {
    -[JRSchemaJRInferenceContext failed](self, "failed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("failed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("failed"));

    }
  }
  if (self->_started)
  {
    -[JRSchemaJRInferenceContext started](self, "started");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("started"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("started"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[JRSchemaJRInferenceContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (JRSchemaJRInferenceContext)initWithJSON:(id)a3
{
  void *v4;
  JRSchemaJRInferenceContext *v5;
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
    self = -[JRSchemaJRInferenceContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (JRSchemaJRInferenceContext)initWithDictionary:(id)a3
{
  id v4;
  JRSchemaJRInferenceContext *v5;
  void *v6;
  JRSchemaJRInferenceStarted *v7;
  void *v8;
  JRSchemaJRInferenceFailed *v9;
  void *v10;
  JRSchemaJRInferenceEnded *v11;
  JRSchemaJRInferenceContext *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)JRSchemaJRInferenceContext;
  v5 = -[JRSchemaJRInferenceContext init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("started"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[JRSchemaJRInferenceStarted initWithDictionary:]([JRSchemaJRInferenceStarted alloc], "initWithDictionary:", v6);
      -[JRSchemaJRInferenceContext setStarted:](v5, "setStarted:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[JRSchemaJRInferenceFailed initWithDictionary:]([JRSchemaJRInferenceFailed alloc], "initWithDictionary:", v8);
      -[JRSchemaJRInferenceContext setFailed:](v5, "setFailed:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[JRSchemaJRInferenceEnded initWithDictionary:]([JRSchemaJRInferenceEnded alloc], "initWithDictionary:", v10);
      -[JRSchemaJRInferenceContext setEnded:](v5, "setEnded:", v11);

    }
    v12 = v5;

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

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void)setHasFailed:(BOOL)a3
{
  self->_hasFailed = a3;
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
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_started, 0);
}

@end
