@implementation LTSchemaSafariFeedbackEvent

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LTSchemaSafariFeedbackEvent;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LTSchemaSafariFeedbackEvent task](self, "task", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[LTSchemaSafariFeedbackEvent deleteTask](self, "deleteTask");
  return v5;
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (void)deleteTask
{
  -[LTSchemaSafariFeedbackEvent setTask:](self, "setTask:", 0);
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (void)deleteSessionID
{
  -[LTSchemaSafariFeedbackEvent setSessionID:](self, "setSessionID:", 0);
}

- (BOOL)hasUserFeedbackContentSource
{
  return self->_userFeedbackContentSource != 0;
}

- (void)deleteUserFeedbackContentSource
{
  -[LTSchemaSafariFeedbackEvent setUserFeedbackContentSource:](self, "setUserFeedbackContentSource:", 0);
}

- (BOOL)hasUserFeedbackContentTarget
{
  return self->_userFeedbackContentTarget != 0;
}

- (void)deleteUserFeedbackContentTarget
{
  -[LTSchemaSafariFeedbackEvent setUserFeedbackContentTarget:](self, "setUserFeedbackContentTarget:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return LTSchemaSafariFeedbackEventReadFrom(self, (uint64_t)a3);
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
  -[LTSchemaSafariFeedbackEvent task](self, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LTSchemaSafariFeedbackEvent task](self, "task");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[LTSchemaSafariFeedbackEvent sessionID](self, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[LTSchemaSafariFeedbackEvent userFeedbackContentSource](self, "userFeedbackContentSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[LTSchemaSafariFeedbackEvent userFeedbackContentTarget](self, "userFeedbackContentTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
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
  -[LTSchemaSafariFeedbackEvent task](self, "task");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[LTSchemaSafariFeedbackEvent task](self, "task");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[LTSchemaSafariFeedbackEvent task](self, "task");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "task");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[LTSchemaSafariFeedbackEvent sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[LTSchemaSafariFeedbackEvent sessionID](self, "sessionID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[LTSchemaSafariFeedbackEvent sessionID](self, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[LTSchemaSafariFeedbackEvent userFeedbackContentSource](self, "userFeedbackContentSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userFeedbackContentSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[LTSchemaSafariFeedbackEvent userFeedbackContentSource](self, "userFeedbackContentSource");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[LTSchemaSafariFeedbackEvent userFeedbackContentSource](self, "userFeedbackContentSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userFeedbackContentSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[LTSchemaSafariFeedbackEvent userFeedbackContentTarget](self, "userFeedbackContentTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userFeedbackContentTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[LTSchemaSafariFeedbackEvent userFeedbackContentTarget](self, "userFeedbackContentTarget");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[LTSchemaSafariFeedbackEvent userFeedbackContentTarget](self, "userFeedbackContentTarget");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userFeedbackContentTarget");
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
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[LTSchemaTask hash](self->_task, "hash");
  v4 = -[NSString hash](self->_sessionID, "hash") ^ v3;
  v5 = -[NSString hash](self->_userFeedbackContentSource, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_userFeedbackContentTarget, "hash");
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
  if (self->_sessionID)
  {
    -[LTSchemaSafariFeedbackEvent sessionID](self, "sessionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sessionID"));

  }
  if (self->_task)
  {
    -[LTSchemaSafariFeedbackEvent task](self, "task");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("task"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("task"));

    }
  }
  if (self->_userFeedbackContentSource)
  {
    -[LTSchemaSafariFeedbackEvent userFeedbackContentSource](self, "userFeedbackContentSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("userFeedbackContentSource"));

  }
  if (self->_userFeedbackContentTarget)
  {
    -[LTSchemaSafariFeedbackEvent userFeedbackContentTarget](self, "userFeedbackContentTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("userFeedbackContentTarget"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LTSchemaSafariFeedbackEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LTSchemaSafariFeedbackEvent)initWithJSON:(id)a3
{
  void *v4;
  LTSchemaSafariFeedbackEvent *v5;
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
    self = -[LTSchemaSafariFeedbackEvent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LTSchemaSafariFeedbackEvent)initWithDictionary:(id)a3
{
  id v4;
  LTSchemaSafariFeedbackEvent *v5;
  void *v6;
  LTSchemaTask *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  LTSchemaSafariFeedbackEvent *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LTSchemaSafariFeedbackEvent;
  v5 = -[LTSchemaSafariFeedbackEvent init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("task"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[LTSchemaTask initWithDictionary:]([LTSchemaTask alloc], "initWithDictionary:", v6);
      -[LTSchemaSafariFeedbackEvent setTask:](v5, "setTask:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[LTSchemaSafariFeedbackEvent setSessionID:](v5, "setSessionID:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userFeedbackContentSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[LTSchemaSafariFeedbackEvent setUserFeedbackContentSource:](v5, "setUserFeedbackContentSource:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userFeedbackContentTarget"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[LTSchemaSafariFeedbackEvent setUserFeedbackContentTarget:](v5, "setUserFeedbackContentTarget:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (LTSchemaTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)userFeedbackContentSource
{
  return self->_userFeedbackContentSource;
}

- (void)setUserFeedbackContentSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)userFeedbackContentTarget
{
  return self->_userFeedbackContentTarget;
}

- (void)setUserFeedbackContentTarget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasTask:(BOOL)a3
{
  self->_hasTask = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  self->_hasSessionID = a3;
}

- (void)setHasUserFeedbackContentSource:(BOOL)a3
{
  self->_hasUserFeedbackContentSource = a3;
}

- (void)setHasUserFeedbackContentTarget:(BOOL)a3
{
  self->_hasUserFeedbackContentTarget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFeedbackContentTarget, 0);
  objc_storeStrong((id *)&self->_userFeedbackContentSource, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
