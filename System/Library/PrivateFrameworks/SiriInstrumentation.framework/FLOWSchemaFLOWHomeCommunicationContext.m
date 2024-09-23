@implementation FLOWSchemaFLOWHomeCommunicationContext

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
  v13.super_class = (Class)FLOWSchemaFLOWHomeCommunicationContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWHomeCommunicationContext homeContext](self, "homeContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWHomeCommunicationContext deleteHomeContext](self, "deleteHomeContext");
  -[FLOWSchemaFLOWHomeCommunicationContext sendOrReplyContext](self, "sendOrReplyContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWSchemaFLOWHomeCommunicationContext deleteSendOrReplyContext](self, "deleteSendOrReplyContext");

  return v5;
}

- (BOOL)hasHomeContext
{
  return self->_homeContext != 0;
}

- (void)deleteHomeContext
{
  -[FLOWSchemaFLOWHomeCommunicationContext setHomeContext:](self, "setHomeContext:", 0);
}

- (void)setTaskType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_taskType = a3;
}

- (BOOL)hasTaskType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTaskType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTaskType
{
  -[FLOWSchemaFLOWHomeCommunicationContext setTaskType:](self, "setTaskType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSendOrReplyContext:(id)a3
{
  unint64_t v3;

  v3 = 3;
  if (!a3)
    v3 = 0;
  self->_whichTaskcontext = v3;
  objc_storeStrong((id *)&self->_sendOrReplyContext, a3);
}

- (FLOWSchemaFLOWHomeCommunicationSendOrReply)sendOrReplyContext
{
  if (self->_whichTaskcontext == 3)
    return self->_sendOrReplyContext;
  else
    return (FLOWSchemaFLOWHomeCommunicationSendOrReply *)0;
}

- (void)deleteSendOrReplyContext
{
  FLOWSchemaFLOWHomeCommunicationSendOrReply *sendOrReplyContext;

  if (self->_whichTaskcontext == 3)
  {
    self->_whichTaskcontext = 0;
    sendOrReplyContext = self->_sendOrReplyContext;
    self->_sendOrReplyContext = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWHomeCommunicationContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[FLOWSchemaFLOWHomeCommunicationContext homeContext](self, "homeContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FLOWSchemaFLOWHomeCommunicationContext homeContext](self, "homeContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[FLOWSchemaFLOWHomeCommunicationContext sendOrReplyContext](self, "sendOrReplyContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[FLOWSchemaFLOWHomeCommunicationContext sendOrReplyContext](self, "sendOrReplyContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unint64_t whichTaskcontext;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int taskType;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  whichTaskcontext = self->_whichTaskcontext;
  if (whichTaskcontext != objc_msgSend(v4, "whichTaskcontext"))
    goto LABEL_16;
  -[FLOWSchemaFLOWHomeCommunicationContext homeContext](self, "homeContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_15;
  -[FLOWSchemaFLOWHomeCommunicationContext homeContext](self, "homeContext");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[FLOWSchemaFLOWHomeCommunicationContext homeContext](self, "homeContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_16;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    taskType = self->_taskType;
    if (taskType != objc_msgSend(v4, "taskType"))
      goto LABEL_16;
  }
  -[FLOWSchemaFLOWHomeCommunicationContext sendOrReplyContext](self, "sendOrReplyContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendOrReplyContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[FLOWSchemaFLOWHomeCommunicationContext sendOrReplyContext](self, "sendOrReplyContext");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_19:
      v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    -[FLOWSchemaFLOWHomeCommunicationContext sendOrReplyContext](self, "sendOrReplyContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendOrReplyContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_19;
  }
  else
  {
LABEL_15:

  }
LABEL_16:
  v19 = 0;
LABEL_17:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[FLOWSchemaFLOWHomeContext hash](self->_homeContext, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_taskType;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[FLOWSchemaFLOWHomeCommunicationSendOrReply hash](self->_sendOrReplyContext, "hash");
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
  unsigned int v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_homeContext)
  {
    -[FLOWSchemaFLOWHomeCommunicationContext homeContext](self, "homeContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("homeContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("homeContext"));

    }
  }
  if (self->_sendOrReplyContext)
  {
    -[FLOWSchemaFLOWHomeCommunicationContext sendOrReplyContext](self, "sendOrReplyContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sendOrReplyContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sendOrReplyContext"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v10 = -[FLOWSchemaFLOWHomeCommunicationContext taskType](self, "taskType") - 1;
    if (v10 > 3)
      v11 = CFSTR("FLOWHOMECOMMUNICATIONTASKTYPE_UNKNOWN");
    else
      v11 = off_1E562DB28[v10];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("taskType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWHomeCommunicationContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWHomeCommunicationContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWHomeCommunicationContext *v5;
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
    self = -[FLOWSchemaFLOWHomeCommunicationContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWHomeCommunicationContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWHomeCommunicationContext *v5;
  void *v6;
  FLOWSchemaFLOWHomeContext *v7;
  void *v8;
  void *v9;
  FLOWSchemaFLOWHomeCommunicationSendOrReply *v10;
  FLOWSchemaFLOWHomeCommunicationContext *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FLOWSchemaFLOWHomeCommunicationContext;
  v5 = -[FLOWSchemaFLOWHomeCommunicationContext init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[FLOWSchemaFLOWHomeContext initWithDictionary:]([FLOWSchemaFLOWHomeContext alloc], "initWithDictionary:", v6);
      -[FLOWSchemaFLOWHomeCommunicationContext setHomeContext:](v5, "setHomeContext:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWHomeCommunicationContext setTaskType:](v5, "setTaskType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sendOrReplyContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[FLOWSchemaFLOWHomeCommunicationSendOrReply initWithDictionary:]([FLOWSchemaFLOWHomeCommunicationSendOrReply alloc], "initWithDictionary:", v9);
      -[FLOWSchemaFLOWHomeCommunicationContext setSendOrReplyContext:](v5, "setSendOrReplyContext:", v10);

    }
    v11 = v5;

  }
  return v5;
}

- (unint64_t)whichTaskcontext
{
  return self->_whichTaskcontext;
}

- (FLOWSchemaFLOWHomeContext)homeContext
{
  return self->_homeContext;
}

- (void)setHomeContext:(id)a3
{
  objc_storeStrong((id *)&self->_homeContext, a3);
}

- (int)taskType
{
  return self->_taskType;
}

- (void)setHasHomeContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (BOOL)hasSendOrReplyContext
{
  return *((_BYTE *)&self->_has + 2);
}

- (void)setHasSendOrReplyContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendOrReplyContext, 0);
  objc_storeStrong((id *)&self->_homeContext, 0);
}

@end
