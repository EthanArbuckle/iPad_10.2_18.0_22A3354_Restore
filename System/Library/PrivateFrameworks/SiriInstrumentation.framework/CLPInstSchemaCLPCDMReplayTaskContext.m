@implementation CLPInstSchemaCLPCDMReplayTaskContext

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
  v13.super_class = (Class)CLPInstSchemaCLPCDMReplayTaskContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPInstSchemaCLPCDMReplayTaskContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[CLPInstSchemaCLPCDMReplayTaskContext deleteStartedOrChanged](self, "deleteStartedOrChanged");
  -[CLPInstSchemaCLPCDMReplayTaskContext ended](self, "ended");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[CLPInstSchemaCLPCDMReplayTaskContext deleteEnded](self, "deleteEnded");

  return v5;
}

- (void)setStartedOrChanged:(id)a3
{
  CLPInstSchemaCLPCDMReplayTaskStarted *v4;
  CLPInstSchemaCLPCDMReplayTaskEnded *ended;
  unint64_t v6;
  CLPInstSchemaCLPCDMReplayTaskStarted *startedOrChanged;

  v4 = (CLPInstSchemaCLPCDMReplayTaskStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  v6 = 101;
  if (!v4)
    v6 = 0;
  self->_whichContextevent = v6;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;

}

- (CLPInstSchemaCLPCDMReplayTaskStarted)startedOrChanged
{
  if (self->_whichContextevent == 101)
    return self->_startedOrChanged;
  else
    return (CLPInstSchemaCLPCDMReplayTaskStarted *)0;
}

- (void)deleteStartedOrChanged
{
  CLPInstSchemaCLPCDMReplayTaskStarted *startedOrChanged;

  if (self->_whichContextevent == 101)
  {
    self->_whichContextevent = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;

  }
}

- (void)setEnded:(id)a3
{
  CLPInstSchemaCLPCDMReplayTaskEnded *v4;
  CLPInstSchemaCLPCDMReplayTaskStarted *startedOrChanged;
  unint64_t v6;
  CLPInstSchemaCLPCDMReplayTaskEnded *ended;

  v4 = (CLPInstSchemaCLPCDMReplayTaskEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  v6 = 102;
  if (!v4)
    v6 = 0;
  self->_whichContextevent = v6;
  ended = self->_ended;
  self->_ended = v4;

}

- (CLPInstSchemaCLPCDMReplayTaskEnded)ended
{
  if (self->_whichContextevent == 102)
    return self->_ended;
  else
    return (CLPInstSchemaCLPCDMReplayTaskEnded *)0;
}

- (void)deleteEnded
{
  CLPInstSchemaCLPCDMReplayTaskEnded *ended;

  if (self->_whichContextevent == 102)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPCDMReplayTaskContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CLPInstSchemaCLPCDMReplayTaskContext startedOrChanged](self, "startedOrChanged");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CLPInstSchemaCLPCDMReplayTaskContext startedOrChanged](self, "startedOrChanged");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[CLPInstSchemaCLPCDMReplayTaskContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CLPInstSchemaCLPCDMReplayTaskContext ended](self, "ended");
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
  -[CLPInstSchemaCLPCDMReplayTaskContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedOrChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_12;
  -[CLPInstSchemaCLPCDMReplayTaskContext startedOrChanged](self, "startedOrChanged");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CLPInstSchemaCLPCDMReplayTaskContext startedOrChanged](self, "startedOrChanged");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedOrChanged");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_13;
  }
  else
  {

  }
  -[CLPInstSchemaCLPCDMReplayTaskContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[CLPInstSchemaCLPCDMReplayTaskContext ended](self, "ended");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_16:
      v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    -[CLPInstSchemaCLPCDMReplayTaskContext ended](self, "ended");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
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

  v3 = -[CLPInstSchemaCLPCDMReplayTaskStarted hash](self->_startedOrChanged, "hash");
  return -[CLPInstSchemaCLPCDMReplayTaskEnded hash](self->_ended, "hash") ^ v3;
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
  if (self->_ended)
  {
    -[CLPInstSchemaCLPCDMReplayTaskContext ended](self, "ended");
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
  if (self->_startedOrChanged)
  {
    -[CLPInstSchemaCLPCDMReplayTaskContext startedOrChanged](self, "startedOrChanged");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("startedOrChanged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("startedOrChanged"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[CLPInstSchemaCLPCDMReplayTaskContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (CLPInstSchemaCLPCDMReplayTaskContext)initWithJSON:(id)a3
{
  void *v4;
  CLPInstSchemaCLPCDMReplayTaskContext *v5;
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
    self = -[CLPInstSchemaCLPCDMReplayTaskContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (CLPInstSchemaCLPCDMReplayTaskContext)initWithDictionary:(id)a3
{
  id v4;
  CLPInstSchemaCLPCDMReplayTaskContext *v5;
  void *v6;
  CLPInstSchemaCLPCDMReplayTaskStarted *v7;
  void *v8;
  CLPInstSchemaCLPCDMReplayTaskEnded *v9;
  CLPInstSchemaCLPCDMReplayTaskContext *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLPInstSchemaCLPCDMReplayTaskContext;
  v5 = -[CLPInstSchemaCLPCDMReplayTaskContext init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[CLPInstSchemaCLPCDMReplayTaskStarted initWithDictionary:]([CLPInstSchemaCLPCDMReplayTaskStarted alloc], "initWithDictionary:", v6);
      -[CLPInstSchemaCLPCDMReplayTaskContext setStartedOrChanged:](v5, "setStartedOrChanged:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[CLPInstSchemaCLPCDMReplayTaskEnded initWithDictionary:]([CLPInstSchemaCLPCDMReplayTaskEnded alloc], "initWithDictionary:", v8);
      -[CLPInstSchemaCLPCDMReplayTaskContext setEnded:](v5, "setEnded:", v9);

    }
    v10 = v5;

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

@end
