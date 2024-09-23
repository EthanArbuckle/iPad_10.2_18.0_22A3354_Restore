@implementation NLXSchemaCDMSystemReportedFailure

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
  v16.super_class = (Class)NLXSchemaCDMSystemReportedFailure;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaCDMSystemReportedFailure taskId](self, "taskId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLXSchemaCDMSystemReportedFailure deleteTaskId](self, "deleteTaskId");
  -[NLXSchemaCDMSystemReportedFailure reason](self, "reason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NLXSchemaCDMSystemReportedFailure deleteReason](self, "deleteReason");
  -[NLXSchemaCDMSystemReportedFailure task](self, "task");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[NLXSchemaCDMSystemReportedFailure deleteTask](self, "deleteTask");

  return v5;
}

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

- (void)deleteTaskId
{
  -[NLXSchemaCDMSystemReportedFailure setTaskId:](self, "setTaskId:", 0);
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (void)deleteReason
{
  -[NLXSchemaCDMSystemReportedFailure setReason:](self, "setReason:", 0);
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (void)deleteTask
{
  -[NLXSchemaCDMSystemReportedFailure setTask:](self, "setTask:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMSystemReportedFailureReadFrom(self, (uint64_t)a3);
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
  -[NLXSchemaCDMSystemReportedFailure taskId](self, "taskId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLXSchemaCDMSystemReportedFailure taskId](self, "taskId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMSystemReportedFailure reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NLXSchemaCDMSystemReportedFailure reason](self, "reason");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMSystemReportedFailure task](self, "task");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NLXSchemaCDMSystemReportedFailure task](self, "task");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[NLXSchemaCDMSystemReportedFailure taskId](self, "taskId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[NLXSchemaCDMSystemReportedFailure taskId](self, "taskId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NLXSchemaCDMSystemReportedFailure taskId](self, "taskId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[NLXSchemaCDMSystemReportedFailure reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[NLXSchemaCDMSystemReportedFailure reason](self, "reason");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[NLXSchemaCDMSystemReportedFailure reason](self, "reason");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reason");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[NLXSchemaCDMSystemReportedFailure task](self, "task");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[NLXSchemaCDMSystemReportedFailure task](self, "task");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[NLXSchemaCDMSystemReportedFailure task](self, "task");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "task");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SISchemaUUID hash](self->_taskId, "hash");
  v4 = -[USOSchemaUSOGraph hash](self->_reason, "hash") ^ v3;
  return v4 ^ -[USOSchemaUSOGraph hash](self->_task, "hash");
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
  if (self->_reason)
  {
    -[NLXSchemaCDMSystemReportedFailure reason](self, "reason");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("reason"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("reason"));

    }
  }
  if (self->_task)
  {
    -[NLXSchemaCDMSystemReportedFailure task](self, "task");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("task"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("task"));

    }
  }
  if (self->_taskId)
  {
    -[NLXSchemaCDMSystemReportedFailure taskId](self, "taskId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("taskId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("taskId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMSystemReportedFailure dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaCDMSystemReportedFailure)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMSystemReportedFailure *v5;
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
    self = -[NLXSchemaCDMSystemReportedFailure initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMSystemReportedFailure)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMSystemReportedFailure *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  USOSchemaUSOGraph *v9;
  void *v10;
  USOSchemaUSOGraph *v11;
  NLXSchemaCDMSystemReportedFailure *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NLXSchemaCDMSystemReportedFailure;
  v5 = -[NLXSchemaCDMSystemReportedFailure init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[NLXSchemaCDMSystemReportedFailure setTaskId:](v5, "setTaskId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[USOSchemaUSOGraph initWithDictionary:]([USOSchemaUSOGraph alloc], "initWithDictionary:", v8);
      -[NLXSchemaCDMSystemReportedFailure setReason:](v5, "setReason:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("task"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[USOSchemaUSOGraph initWithDictionary:]([USOSchemaUSOGraph alloc], "initWithDictionary:", v10);
      -[NLXSchemaCDMSystemReportedFailure setTask:](v5, "setTask:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (SISchemaUUID)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(id)a3
{
  objc_storeStrong((id *)&self->_taskId, a3);
}

- (USOSchemaUSOGraph)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (USOSchemaUSOGraph)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void)setHasTaskId:(BOOL)a3
{
  self->_hasTaskId = a3;
}

- (void)setHasReason:(BOOL)a3
{
  self->_hasReason = a3;
}

- (void)setHasTask:(BOOL)a3
{
  self->_hasTask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
}

@end
