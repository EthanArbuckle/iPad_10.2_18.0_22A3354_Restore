@implementation ODDSiriSchemaODDAssistantExperimentCounts

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
  v19.super_class = (Class)ODDSiriSchemaODDAssistantExperimentCounts;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDAssistantExperimentCounts turnCounts](self, "turnCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODDSiriSchemaODDAssistantExperimentCounts deleteTurnCounts](self, "deleteTurnCounts");
  -[ODDSiriSchemaODDAssistantExperimentCounts taskCounts](self, "taskCounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODDSiriSchemaODDAssistantExperimentCounts deleteTaskCounts](self, "deleteTaskCounts");
  -[ODDSiriSchemaODDAssistantExperimentCounts reliabilityCounts](self, "reliabilityCounts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ODDSiriSchemaODDAssistantExperimentCounts deleteReliabilityCounts](self, "deleteReliabilityCounts");
  -[ODDSiriSchemaODDAssistantExperimentCounts sessionCounts](self, "sessionCounts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[ODDSiriSchemaODDAssistantExperimentCounts deleteSessionCounts](self, "deleteSessionCounts");

  return v5;
}

- (BOOL)hasTurnCounts
{
  return self->_turnCounts != 0;
}

- (void)deleteTurnCounts
{
  -[ODDSiriSchemaODDAssistantExperimentCounts setTurnCounts:](self, "setTurnCounts:", 0);
}

- (BOOL)hasTaskCounts
{
  return self->_taskCounts != 0;
}

- (void)deleteTaskCounts
{
  -[ODDSiriSchemaODDAssistantExperimentCounts setTaskCounts:](self, "setTaskCounts:", 0);
}

- (BOOL)hasReliabilityCounts
{
  return self->_reliabilityCounts != 0;
}

- (void)deleteReliabilityCounts
{
  -[ODDSiriSchemaODDAssistantExperimentCounts setReliabilityCounts:](self, "setReliabilityCounts:", 0);
}

- (BOOL)hasSessionCounts
{
  return self->_sessionCounts != 0;
}

- (void)deleteSessionCounts
{
  -[ODDSiriSchemaODDAssistantExperimentCounts setSessionCounts:](self, "setSessionCounts:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssistantExperimentCountsReadFrom(self, (uint64_t)a3);
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
  -[ODDSiriSchemaODDAssistantExperimentCounts turnCounts](self, "turnCounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDAssistantExperimentCounts turnCounts](self, "turnCounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDAssistantExperimentCounts taskCounts](self, "taskCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ODDSiriSchemaODDAssistantExperimentCounts taskCounts](self, "taskCounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDAssistantExperimentCounts reliabilityCounts](self, "reliabilityCounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ODDSiriSchemaODDAssistantExperimentCounts reliabilityCounts](self, "reliabilityCounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDAssistantExperimentCounts sessionCounts](self, "sessionCounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ODDSiriSchemaODDAssistantExperimentCounts sessionCounts](self, "sessionCounts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[ODDSiriSchemaODDAssistantExperimentCounts turnCounts](self, "turnCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDAssistantExperimentCounts turnCounts](self, "turnCounts");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDAssistantExperimentCounts turnCounts](self, "turnCounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnCounts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantExperimentCounts taskCounts](self, "taskCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDAssistantExperimentCounts taskCounts](self, "taskCounts");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODDSiriSchemaODDAssistantExperimentCounts taskCounts](self, "taskCounts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskCounts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantExperimentCounts reliabilityCounts](self, "reliabilityCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reliabilityCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDAssistantExperimentCounts reliabilityCounts](self, "reliabilityCounts");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ODDSiriSchemaODDAssistantExperimentCounts reliabilityCounts](self, "reliabilityCounts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reliabilityCounts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantExperimentCounts sessionCounts](self, "sessionCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ODDSiriSchemaODDAssistantExperimentCounts sessionCounts](self, "sessionCounts");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[ODDSiriSchemaODDAssistantExperimentCounts sessionCounts](self, "sessionCounts");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionCounts");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[ODDSiriSchemaODDTurnCounts hash](self->_turnCounts, "hash");
  v4 = -[ODDSiriSchemaODDTaskCounts hash](self->_taskCounts, "hash") ^ v3;
  v5 = -[ODDSiriSchemaODDReliabilityCounts hash](self->_reliabilityCounts, "hash");
  return v4 ^ v5 ^ -[ODDSiriSchemaODDSessionCounts hash](self->_sessionCounts, "hash");
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
  if (self->_reliabilityCounts)
  {
    -[ODDSiriSchemaODDAssistantExperimentCounts reliabilityCounts](self, "reliabilityCounts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("reliabilityCounts"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("reliabilityCounts"));

    }
  }
  if (self->_sessionCounts)
  {
    -[ODDSiriSchemaODDAssistantExperimentCounts sessionCounts](self, "sessionCounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sessionCounts"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sessionCounts"));

    }
  }
  if (self->_taskCounts)
  {
    -[ODDSiriSchemaODDAssistantExperimentCounts taskCounts](self, "taskCounts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("taskCounts"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("taskCounts"));

    }
  }
  if (self->_turnCounts)
  {
    -[ODDSiriSchemaODDAssistantExperimentCounts turnCounts](self, "turnCounts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("turnCounts"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("turnCounts"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDAssistantExperimentCounts dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDAssistantExperimentCounts)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDAssistantExperimentCounts *v5;
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
    self = -[ODDSiriSchemaODDAssistantExperimentCounts initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDAssistantExperimentCounts)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDAssistantExperimentCounts *v5;
  void *v6;
  ODDSiriSchemaODDTurnCounts *v7;
  void *v8;
  ODDSiriSchemaODDTaskCounts *v9;
  void *v10;
  ODDSiriSchemaODDReliabilityCounts *v11;
  void *v12;
  ODDSiriSchemaODDSessionCounts *v13;
  ODDSiriSchemaODDAssistantExperimentCounts *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ODDSiriSchemaODDAssistantExperimentCounts;
  v5 = -[ODDSiriSchemaODDAssistantExperimentCounts init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("turnCounts"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODDSiriSchemaODDTurnCounts initWithDictionary:]([ODDSiriSchemaODDTurnCounts alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDAssistantExperimentCounts setTurnCounts:](v5, "setTurnCounts:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskCounts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ODDSiriSchemaODDTaskCounts initWithDictionary:]([ODDSiriSchemaODDTaskCounts alloc], "initWithDictionary:", v8);
      -[ODDSiriSchemaODDAssistantExperimentCounts setTaskCounts:](v5, "setTaskCounts:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reliabilityCounts"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ODDSiriSchemaODDReliabilityCounts initWithDictionary:]([ODDSiriSchemaODDReliabilityCounts alloc], "initWithDictionary:", v10);
      -[ODDSiriSchemaODDAssistantExperimentCounts setReliabilityCounts:](v5, "setReliabilityCounts:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionCounts"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[ODDSiriSchemaODDSessionCounts initWithDictionary:]([ODDSiriSchemaODDSessionCounts alloc], "initWithDictionary:", v12);
      -[ODDSiriSchemaODDAssistantExperimentCounts setSessionCounts:](v5, "setSessionCounts:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (ODDSiriSchemaODDTurnCounts)turnCounts
{
  return self->_turnCounts;
}

- (void)setTurnCounts:(id)a3
{
  objc_storeStrong((id *)&self->_turnCounts, a3);
}

- (ODDSiriSchemaODDTaskCounts)taskCounts
{
  return self->_taskCounts;
}

- (void)setTaskCounts:(id)a3
{
  objc_storeStrong((id *)&self->_taskCounts, a3);
}

- (ODDSiriSchemaODDReliabilityCounts)reliabilityCounts
{
  return self->_reliabilityCounts;
}

- (void)setReliabilityCounts:(id)a3
{
  objc_storeStrong((id *)&self->_reliabilityCounts, a3);
}

- (ODDSiriSchemaODDSessionCounts)sessionCounts
{
  return self->_sessionCounts;
}

- (void)setSessionCounts:(id)a3
{
  objc_storeStrong((id *)&self->_sessionCounts, a3);
}

- (void)setHasTurnCounts:(BOOL)a3
{
  self->_hasTurnCounts = a3;
}

- (void)setHasTaskCounts:(BOOL)a3
{
  self->_hasTaskCounts = a3;
}

- (void)setHasReliabilityCounts:(BOOL)a3
{
  self->_hasReliabilityCounts = a3;
}

- (void)setHasSessionCounts:(BOOL)a3
{
  self->_hasSessionCounts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionCounts, 0);
  objc_storeStrong((id *)&self->_reliabilityCounts, 0);
  objc_storeStrong((id *)&self->_taskCounts, 0);
  objc_storeStrong((id *)&self->_turnCounts, 0);
}

@end
