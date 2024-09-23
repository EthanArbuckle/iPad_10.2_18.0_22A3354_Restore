@implementation PRSiriSchemaPRJointResolverCallContext

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
  v22.super_class = (Class)PRSiriSchemaPRJointResolverCallContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSiriSchemaPRJointResolverCallContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PRSiriSchemaPRJointResolverCallContext deleteStartedOrChanged](self, "deleteStartedOrChanged");
  -[PRSiriSchemaPRJointResolverCallContext ended](self, "ended");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PRSiriSchemaPRJointResolverCallContext deleteEnded](self, "deleteEnded");
  -[PRSiriSchemaPRJointResolverCallContext failed](self, "failed");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PRSiriSchemaPRJointResolverCallContext deleteFailed](self, "deleteFailed");
  -[PRSiriSchemaPRJointResolverCallContext planEventId](self, "planEventId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PRSiriSchemaPRJointResolverCallContext deletePlanEventId](self, "deletePlanEventId");
  -[PRSiriSchemaPRJointResolverCallContext traceId](self, "traceId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PRSiriSchemaPRJointResolverCallContext deleteTraceId](self, "deleteTraceId");

  return v5;
}

- (void)setStartedOrChanged:(id)a3
{
  PRSiriSchemaPRJointResolverCallStarted *v4;
  PRSiriSchemaPRJointResolverCallEnded *ended;
  PRSiriSchemaPRJointResolverCallFailed *failed;
  PRSiriSchemaPRJointResolverCallStarted *startedOrChanged;

  v4 = (PRSiriSchemaPRJointResolverCallStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  *(_QWORD *)&self->_hasTraceId = v4 != 0;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;

}

- (PRSiriSchemaPRJointResolverCallStarted)startedOrChanged
{
  if (*(_QWORD *)&self->_hasTraceId == 1)
    return self->_startedOrChanged;
  else
    return (PRSiriSchemaPRJointResolverCallStarted *)0;
}

- (void)deleteStartedOrChanged
{
  PRSiriSchemaPRJointResolverCallStarted *startedOrChanged;

  if (*(_QWORD *)&self->_hasTraceId == 1)
  {
    *(_QWORD *)&self->_hasTraceId = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;

  }
}

- (void)setEnded:(id)a3
{
  PRSiriSchemaPRJointResolverCallEnded *v4;
  PRSiriSchemaPRJointResolverCallStarted *startedOrChanged;
  PRSiriSchemaPRJointResolverCallFailed *failed;
  PRSiriSchemaPRJointResolverCallEnded *ended;

  v4 = (PRSiriSchemaPRJointResolverCallEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  *(_QWORD *)&self->_hasTraceId = 2 * (v4 != 0);
  ended = self->_ended;
  self->_ended = v4;

}

- (PRSiriSchemaPRJointResolverCallEnded)ended
{
  if (*(_QWORD *)&self->_hasTraceId == 2)
    return self->_ended;
  else
    return (PRSiriSchemaPRJointResolverCallEnded *)0;
}

- (void)deleteEnded
{
  PRSiriSchemaPRJointResolverCallEnded *ended;

  if (*(_QWORD *)&self->_hasTraceId == 2)
  {
    *(_QWORD *)&self->_hasTraceId = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (void)setFailed:(id)a3
{
  PRSiriSchemaPRJointResolverCallFailed *v4;
  PRSiriSchemaPRJointResolverCallStarted *startedOrChanged;
  PRSiriSchemaPRJointResolverCallEnded *ended;
  uint64_t v7;
  PRSiriSchemaPRJointResolverCallFailed *failed;

  v4 = (PRSiriSchemaPRJointResolverCallFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  v7 = 3;
  if (!v4)
    v7 = 0;
  *(_QWORD *)&self->_hasTraceId = v7;
  failed = self->_failed;
  self->_failed = v4;

}

- (PRSiriSchemaPRJointResolverCallFailed)failed
{
  if (*(_QWORD *)&self->_hasTraceId == 3)
    return self->_failed;
  else
    return (PRSiriSchemaPRJointResolverCallFailed *)0;
}

- (void)deleteFailed
{
  PRSiriSchemaPRJointResolverCallFailed *failed;

  if (*(_QWORD *)&self->_hasTraceId == 3)
  {
    *(_QWORD *)&self->_hasTraceId = 0;
    failed = self->_failed;
    self->_failed = 0;

  }
}

- (BOOL)hasPlanEventId
{
  return self->_planEventId != 0;
}

- (void)deletePlanEventId
{
  -[PRSiriSchemaPRJointResolverCallContext setPlanEventId:](self, "setPlanEventId:", 0);
}

- (void)setActionStatementId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_actionStatementId = a3;
}

- (BOOL)hasActionStatementId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasActionStatementId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteActionStatementId
{
  -[PRSiriSchemaPRJointResolverCallContext setActionStatementId:](self, "setActionStatementId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasTraceId
{
  return self->_traceId != 0;
}

- (void)deleteTraceId
{
  -[PRSiriSchemaPRJointResolverCallContext setTraceId:](self, "setTraceId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PRSiriSchemaPRJointResolverCallContextReadFrom(self, (uint64_t)a3);
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
  void *v14;
  id v15;

  v15 = a3;
  -[PRSiriSchemaPRJointResolverCallContext startedOrChanged](self, "startedOrChanged");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PRSiriSchemaPRJointResolverCallContext startedOrChanged](self, "startedOrChanged");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PRSiriSchemaPRJointResolverCallContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PRSiriSchemaPRJointResolverCallContext ended](self, "ended");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PRSiriSchemaPRJointResolverCallContext failed](self, "failed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PRSiriSchemaPRJointResolverCallContext failed](self, "failed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PRSiriSchemaPRJointResolverCallContext planEventId](self, "planEventId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PRSiriSchemaPRJointResolverCallContext planEventId](self, "planEventId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[PRSiriSchemaPRJointResolverCallContext traceId](self, "traceId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v15;
  if (v12)
  {
    -[PRSiriSchemaPRJointResolverCallContext traceId](self, "traceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v13 = v15;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  uint64_t v5;
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
  unsigned int actionStatementId;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  BOOL v34;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  v5 = *(_QWORD *)&self->_hasTraceId;
  if (v5 != objc_msgSend(v4, "whichContextevent"))
    goto LABEL_31;
  -[PRSiriSchemaPRJointResolverCallContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedOrChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_30;
  -[PRSiriSchemaPRJointResolverCallContext startedOrChanged](self, "startedOrChanged");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PRSiriSchemaPRJointResolverCallContext startedOrChanged](self, "startedOrChanged");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedOrChanged");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_31;
  }
  else
  {

  }
  -[PRSiriSchemaPRJointResolverCallContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_30;
  -[PRSiriSchemaPRJointResolverCallContext ended](self, "ended");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PRSiriSchemaPRJointResolverCallContext ended](self, "ended");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_31;
  }
  else
  {

  }
  -[PRSiriSchemaPRJointResolverCallContext failed](self, "failed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_30;
  -[PRSiriSchemaPRJointResolverCallContext failed](self, "failed");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[PRSiriSchemaPRJointResolverCallContext failed](self, "failed");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failed");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_31;
  }
  else
  {

  }
  -[PRSiriSchemaPRJointResolverCallContext planEventId](self, "planEventId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planEventId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_30;
  -[PRSiriSchemaPRJointResolverCallContext planEventId](self, "planEventId");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[PRSiriSchemaPRJointResolverCallContext planEventId](self, "planEventId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planEventId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_31;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    actionStatementId = self->_actionStatementId;
    if (actionStatementId != objc_msgSend(v4, "actionStatementId"))
      goto LABEL_31;
  }
  -[PRSiriSchemaPRJointResolverCallContext traceId](self, "traceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[PRSiriSchemaPRJointResolverCallContext traceId](self, "traceId");
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {

LABEL_34:
      v34 = 1;
      goto LABEL_32;
    }
    v30 = (void *)v29;
    -[PRSiriSchemaPRJointResolverCallContext traceId](self, "traceId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traceId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if ((v33 & 1) != 0)
      goto LABEL_34;
  }
  else
  {
LABEL_30:

  }
LABEL_31:
  v34 = 0;
LABEL_32:

  return v34;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[PRSiriSchemaPRJointResolverCallStarted hash](self->_startedOrChanged, "hash");
  v4 = -[PRSiriSchemaPRJointResolverCallEnded hash](self->_ended, "hash");
  v5 = -[PRSiriSchemaPRJointResolverCallFailed hash](self->_failed, "hash");
  v6 = -[SISchemaUUID hash](self->_planEventId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_actionStatementId;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[SISchemaUUID hash](self->_traceId, "hash");
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
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PRSiriSchemaPRJointResolverCallContext actionStatementId](self, "actionStatementId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("actionStatementId"));

  }
  if (self->_ended)
  {
    -[PRSiriSchemaPRJointResolverCallContext ended](self, "ended");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ended"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ended"));

    }
  }
  if (self->_failed)
  {
    -[PRSiriSchemaPRJointResolverCallContext failed](self, "failed");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("failed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("failed"));

    }
  }
  if (self->_planEventId)
  {
    -[PRSiriSchemaPRJointResolverCallContext planEventId](self, "planEventId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("planEventId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("planEventId"));

    }
  }
  if (self->_startedOrChanged)
  {
    -[PRSiriSchemaPRJointResolverCallContext startedOrChanged](self, "startedOrChanged");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("startedOrChanged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("startedOrChanged"));

    }
  }
  if (self->_traceId)
  {
    -[PRSiriSchemaPRJointResolverCallContext traceId](self, "traceId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("traceId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("traceId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PRSiriSchemaPRJointResolverCallContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PRSiriSchemaPRJointResolverCallContext)initWithJSON:(id)a3
{
  void *v4;
  PRSiriSchemaPRJointResolverCallContext *v5;
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
    self = -[PRSiriSchemaPRJointResolverCallContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PRSiriSchemaPRJointResolverCallContext)initWithDictionary:(id)a3
{
  id v4;
  PRSiriSchemaPRJointResolverCallContext *v5;
  void *v6;
  PRSiriSchemaPRJointResolverCallStarted *v7;
  void *v8;
  PRSiriSchemaPRJointResolverCallEnded *v9;
  void *v10;
  PRSiriSchemaPRJointResolverCallFailed *v11;
  void *v12;
  SISchemaUUID *v13;
  void *v14;
  void *v15;
  SISchemaUUID *v16;
  PRSiriSchemaPRJointResolverCallContext *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PRSiriSchemaPRJointResolverCallContext;
  v5 = -[PRSiriSchemaPRJointResolverCallContext init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PRSiriSchemaPRJointResolverCallStarted initWithDictionary:]([PRSiriSchemaPRJointResolverCallStarted alloc], "initWithDictionary:", v6);
      -[PRSiriSchemaPRJointResolverCallContext setStartedOrChanged:](v5, "setStartedOrChanged:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PRSiriSchemaPRJointResolverCallEnded initWithDictionary:]([PRSiriSchemaPRJointResolverCallEnded alloc], "initWithDictionary:", v8);
      -[PRSiriSchemaPRJointResolverCallContext setEnded:](v5, "setEnded:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PRSiriSchemaPRJointResolverCallFailed initWithDictionary:]([PRSiriSchemaPRJointResolverCallFailed alloc], "initWithDictionary:", v10);
      -[PRSiriSchemaPRJointResolverCallContext setFailed:](v5, "setFailed:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planEventId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[PRSiriSchemaPRJointResolverCallContext setPlanEventId:](v5, "setPlanEventId:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionStatementId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PRSiriSchemaPRJointResolverCallContext setActionStatementId:](v5, "setActionStatementId:", objc_msgSend(v14, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("traceId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v15);
      -[PRSiriSchemaPRJointResolverCallContext setTraceId:](v5, "setTraceId:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return *(_QWORD *)&self->_hasTraceId;
}

- (SISchemaUUID)planEventId
{
  return self->_planEventId;
}

- (void)setPlanEventId:(id)a3
{
  objc_storeStrong((id *)&self->_planEventId, a3);
}

- (unsigned)actionStatementId
{
  return self->_actionStatementId;
}

- (SISchemaUUID)traceId
{
  return self->_traceId;
}

- (void)setTraceId:(id)a3
{
  objc_storeStrong((id *)&self->_traceId, a3);
}

- (BOOL)hasStartedOrChanged
{
  return *((_BYTE *)&self->_has + 1);
}

- (void)setHasStartedOrChanged:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (BOOL)hasEnded
{
  return *((_BYTE *)&self->_has + 2);
}

- (void)setHasEnded:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (BOOL)hasFailed
{
  return *((_BYTE *)&self->_has + 3);
}

- (void)setHasFailed:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasPlanEventId:(BOOL)a3
{
  self->_hasStartedOrChanged = a3;
}

- (void)setHasTraceId:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceId, 0);
  objc_storeStrong((id *)&self->_planEventId, 0);
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

@end
