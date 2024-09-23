@implementation PRSiriSchemaPRRequestContext

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
  v19.super_class = (Class)PRSiriSchemaPRRequestContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSiriSchemaPRRequestContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PRSiriSchemaPRRequestContext deleteStartedOrChanged](self, "deleteStartedOrChanged");
  -[PRSiriSchemaPRRequestContext ended](self, "ended");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PRSiriSchemaPRRequestContext deleteEnded](self, "deleteEnded");
  -[PRSiriSchemaPRRequestContext failed](self, "failed");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PRSiriSchemaPRRequestContext deleteFailed](self, "deleteFailed");
  -[PRSiriSchemaPRRequestContext planEventId](self, "planEventId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PRSiriSchemaPRRequestContext deletePlanEventId](self, "deletePlanEventId");

  return v5;
}

- (void)setStartedOrChanged:(id)a3
{
  PRSiriSchemaPRRequestStarted *v4;
  PRSiriSchemaPRRequestEnded *ended;
  PRSiriSchemaPRRequestFailed *failed;
  PRSiriSchemaPRRequestStarted *startedOrChanged;

  v4 = (PRSiriSchemaPRRequestStarted *)a3;
  ended = self->_ended;
  self->_ended = 0;

  failed = self->_failed;
  self->_failed = 0;

  self->_whichContextevent = v4 != 0;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = v4;

}

- (PRSiriSchemaPRRequestStarted)startedOrChanged
{
  if (self->_whichContextevent == 1)
    return self->_startedOrChanged;
  else
    return (PRSiriSchemaPRRequestStarted *)0;
}

- (void)deleteStartedOrChanged
{
  PRSiriSchemaPRRequestStarted *startedOrChanged;

  if (self->_whichContextevent == 1)
  {
    self->_whichContextevent = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;

  }
}

- (void)setEnded:(id)a3
{
  PRSiriSchemaPRRequestEnded *v4;
  PRSiriSchemaPRRequestStarted *startedOrChanged;
  PRSiriSchemaPRRequestFailed *failed;
  PRSiriSchemaPRRequestEnded *ended;

  v4 = (PRSiriSchemaPRRequestEnded *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  failed = self->_failed;
  self->_failed = 0;

  self->_whichContextevent = 2 * (v4 != 0);
  ended = self->_ended;
  self->_ended = v4;

}

- (PRSiriSchemaPRRequestEnded)ended
{
  if (self->_whichContextevent == 2)
    return self->_ended;
  else
    return (PRSiriSchemaPRRequestEnded *)0;
}

- (void)deleteEnded
{
  PRSiriSchemaPRRequestEnded *ended;

  if (self->_whichContextevent == 2)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (void)setFailed:(id)a3
{
  PRSiriSchemaPRRequestFailed *v4;
  PRSiriSchemaPRRequestStarted *startedOrChanged;
  PRSiriSchemaPRRequestEnded *ended;
  unint64_t v7;
  PRSiriSchemaPRRequestFailed *failed;

  v4 = (PRSiriSchemaPRRequestFailed *)a3;
  startedOrChanged = self->_startedOrChanged;
  self->_startedOrChanged = 0;

  ended = self->_ended;
  self->_ended = 0;

  v7 = 3;
  if (!v4)
    v7 = 0;
  self->_whichContextevent = v7;
  failed = self->_failed;
  self->_failed = v4;

}

- (PRSiriSchemaPRRequestFailed)failed
{
  if (self->_whichContextevent == 3)
    return self->_failed;
  else
    return (PRSiriSchemaPRRequestFailed *)0;
}

- (void)deleteFailed
{
  PRSiriSchemaPRRequestFailed *failed;

  if (self->_whichContextevent == 3)
  {
    self->_whichContextevent = 0;
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
  -[PRSiriSchemaPRRequestContext setPlanEventId:](self, "setPlanEventId:", 0);
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
  -[PRSiriSchemaPRRequestContext setActionStatementId:](self, "setActionStatementId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return PRSiriSchemaPRRequestContextReadFrom(self, (uint64_t)a3);
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
  -[PRSiriSchemaPRRequestContext startedOrChanged](self, "startedOrChanged");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PRSiriSchemaPRRequestContext startedOrChanged](self, "startedOrChanged");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PRSiriSchemaPRRequestContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PRSiriSchemaPRRequestContext ended](self, "ended");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PRSiriSchemaPRRequestContext failed](self, "failed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PRSiriSchemaPRRequestContext failed](self, "failed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PRSiriSchemaPRRequestContext planEventId](self, "planEventId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PRSiriSchemaPRRequestContext planEventId](self, "planEventId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
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
  BOOL v28;
  unsigned int actionStatementId;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  whichContextevent = self->_whichContextevent;
  if (whichContextevent != objc_msgSend(v4, "whichContextevent"))
    goto LABEL_23;
  -[PRSiriSchemaPRRequestContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedOrChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[PRSiriSchemaPRRequestContext startedOrChanged](self, "startedOrChanged");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PRSiriSchemaPRRequestContext startedOrChanged](self, "startedOrChanged");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedOrChanged");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_23;
  }
  else
  {

  }
  -[PRSiriSchemaPRRequestContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[PRSiriSchemaPRRequestContext ended](self, "ended");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[PRSiriSchemaPRRequestContext ended](self, "ended");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_23;
  }
  else
  {

  }
  -[PRSiriSchemaPRRequestContext failed](self, "failed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_22;
  -[PRSiriSchemaPRRequestContext failed](self, "failed");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[PRSiriSchemaPRRequestContext failed](self, "failed");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failed");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_23;
  }
  else
  {

  }
  -[PRSiriSchemaPRRequestContext planEventId](self, "planEventId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planEventId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_22:

    goto LABEL_23;
  }
  -[PRSiriSchemaPRRequestContext planEventId](self, "planEventId");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[PRSiriSchemaPRRequestContext planEventId](self, "planEventId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planEventId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_23;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[44] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (actionStatementId = self->_actionStatementId,
          actionStatementId == objc_msgSend(v4, "actionStatementId")))
    {
      v28 = 1;
      goto LABEL_24;
    }
  }
LABEL_23:
  v28 = 0;
LABEL_24:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[PRSiriSchemaPRRequestStarted hash](self->_startedOrChanged, "hash");
  v4 = -[PRSiriSchemaPRRequestEnded hash](self->_ended, "hash");
  v5 = -[PRSiriSchemaPRRequestFailed hash](self->_failed, "hash");
  v6 = -[SISchemaUUID hash](self->_planEventId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_actionStatementId;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PRSiriSchemaPRRequestContext actionStatementId](self, "actionStatementId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("actionStatementId"));

  }
  if (self->_ended)
  {
    -[PRSiriSchemaPRRequestContext ended](self, "ended");
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
    -[PRSiriSchemaPRRequestContext failed](self, "failed");
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
    -[PRSiriSchemaPRRequestContext planEventId](self, "planEventId");
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
    -[PRSiriSchemaPRRequestContext startedOrChanged](self, "startedOrChanged");
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
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PRSiriSchemaPRRequestContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PRSiriSchemaPRRequestContext)initWithJSON:(id)a3
{
  void *v4;
  PRSiriSchemaPRRequestContext *v5;
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
    self = -[PRSiriSchemaPRRequestContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PRSiriSchemaPRRequestContext)initWithDictionary:(id)a3
{
  id v4;
  PRSiriSchemaPRRequestContext *v5;
  void *v6;
  PRSiriSchemaPRRequestStarted *v7;
  void *v8;
  PRSiriSchemaPRRequestEnded *v9;
  void *v10;
  PRSiriSchemaPRRequestFailed *v11;
  void *v12;
  SISchemaUUID *v13;
  void *v14;
  PRSiriSchemaPRRequestContext *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PRSiriSchemaPRRequestContext;
  v5 = -[PRSiriSchemaPRRequestContext init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PRSiriSchemaPRRequestStarted initWithDictionary:]([PRSiriSchemaPRRequestStarted alloc], "initWithDictionary:", v6);
      -[PRSiriSchemaPRRequestContext setStartedOrChanged:](v5, "setStartedOrChanged:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PRSiriSchemaPRRequestEnded initWithDictionary:]([PRSiriSchemaPRRequestEnded alloc], "initWithDictionary:", v8);
      -[PRSiriSchemaPRRequestContext setEnded:](v5, "setEnded:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PRSiriSchemaPRRequestFailed initWithDictionary:]([PRSiriSchemaPRRequestFailed alloc], "initWithDictionary:", v10);
      -[PRSiriSchemaPRRequestContext setFailed:](v5, "setFailed:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planEventId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[PRSiriSchemaPRRequestContext setPlanEventId:](v5, "setPlanEventId:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionStatementId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PRSiriSchemaPRRequestContext setActionStatementId:](v5, "setActionStatementId:", objc_msgSend(v14, "unsignedIntValue"));
    v15 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planEventId, 0);
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

@end
