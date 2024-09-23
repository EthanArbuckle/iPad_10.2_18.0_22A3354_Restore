@implementation ORCHSchemaORCHPommesBridgeContext

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
  void *v21;
  void *v22;
  int v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ORCHSchemaORCHPommesBridgeContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v25, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ORCHSchemaORCHPommesBridgeContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ORCHSchemaORCHPommesBridgeContext deleteStartedOrChanged](self, "deleteStartedOrChanged");
  -[ORCHSchemaORCHPommesBridgeContext ended](self, "ended");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ORCHSchemaORCHPommesBridgeContext deleteEnded](self, "deleteEnded");
  -[ORCHSchemaORCHPommesBridgeContext failed](self, "failed");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ORCHSchemaORCHPommesBridgeContext deleteFailed](self, "deleteFailed");
  -[ORCHSchemaORCHPommesBridgeContext cancelled](self, "cancelled");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[ORCHSchemaORCHPommesBridgeContext deleteCancelled](self, "deleteCancelled");
  -[ORCHSchemaORCHPommesBridgeContext trpId](self, "trpId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[ORCHSchemaORCHPommesBridgeContext deleteTrpId](self, "deleteTrpId");
  -[ORCHSchemaORCHPommesBridgeContext subRequestId](self, "subRequestId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[ORCHSchemaORCHPommesBridgeContext deleteSubRequestId](self, "deleteSubRequestId");

  return v5;
}

- (void)setStartedOrChanged:(id)a3
{
  ORCHSchemaORCHPommesRequestStarted *v4;
  ORCHSchemaORCHPommesRequestEnded *ended;
  ORCHSchemaORCHPommesRequestFailed *failed;
  ORCHSchemaORCHPommesRequestUnableToHandle *cancelled;
  ORCHSchemaORCHPommesRequestStarted *startedOrChanged;

  v4 = (ORCHSchemaORCHPommesRequestStarted *)a3;
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

- (ORCHSchemaORCHPommesRequestStarted)startedOrChanged
{
  if (self->_whichContextevent == 1)
    return self->_startedOrChanged;
  else
    return (ORCHSchemaORCHPommesRequestStarted *)0;
}

- (void)deleteStartedOrChanged
{
  ORCHSchemaORCHPommesRequestStarted *startedOrChanged;

  if (self->_whichContextevent == 1)
  {
    self->_whichContextevent = 0;
    startedOrChanged = self->_startedOrChanged;
    self->_startedOrChanged = 0;

  }
}

- (void)setEnded:(id)a3
{
  ORCHSchemaORCHPommesRequestEnded *v4;
  ORCHSchemaORCHPommesRequestStarted *startedOrChanged;
  ORCHSchemaORCHPommesRequestFailed *failed;
  ORCHSchemaORCHPommesRequestUnableToHandle *cancelled;
  ORCHSchemaORCHPommesRequestEnded *ended;

  v4 = (ORCHSchemaORCHPommesRequestEnded *)a3;
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

- (ORCHSchemaORCHPommesRequestEnded)ended
{
  if (self->_whichContextevent == 2)
    return self->_ended;
  else
    return (ORCHSchemaORCHPommesRequestEnded *)0;
}

- (void)deleteEnded
{
  ORCHSchemaORCHPommesRequestEnded *ended;

  if (self->_whichContextevent == 2)
  {
    self->_whichContextevent = 0;
    ended = self->_ended;
    self->_ended = 0;

  }
}

- (void)setFailed:(id)a3
{
  ORCHSchemaORCHPommesRequestFailed *v4;
  ORCHSchemaORCHPommesRequestStarted *startedOrChanged;
  ORCHSchemaORCHPommesRequestEnded *ended;
  ORCHSchemaORCHPommesRequestUnableToHandle *cancelled;
  unint64_t v8;
  ORCHSchemaORCHPommesRequestFailed *failed;

  v4 = (ORCHSchemaORCHPommesRequestFailed *)a3;
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

- (ORCHSchemaORCHPommesRequestFailed)failed
{
  if (self->_whichContextevent == 3)
    return self->_failed;
  else
    return (ORCHSchemaORCHPommesRequestFailed *)0;
}

- (void)deleteFailed
{
  ORCHSchemaORCHPommesRequestFailed *failed;

  if (self->_whichContextevent == 3)
  {
    self->_whichContextevent = 0;
    failed = self->_failed;
    self->_failed = 0;

  }
}

- (void)setCancelled:(id)a3
{
  ORCHSchemaORCHPommesRequestUnableToHandle *v4;
  ORCHSchemaORCHPommesRequestStarted *startedOrChanged;
  ORCHSchemaORCHPommesRequestEnded *ended;
  ORCHSchemaORCHPommesRequestFailed *failed;
  ORCHSchemaORCHPommesRequestUnableToHandle *cancelled;

  v4 = (ORCHSchemaORCHPommesRequestUnableToHandle *)a3;
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

- (ORCHSchemaORCHPommesRequestUnableToHandle)cancelled
{
  if (self->_whichContextevent == 4)
    return self->_cancelled;
  else
    return (ORCHSchemaORCHPommesRequestUnableToHandle *)0;
}

- (void)deleteCancelled
{
  ORCHSchemaORCHPommesRequestUnableToHandle *cancelled;

  if (self->_whichContextevent == 4)
  {
    self->_whichContextevent = 0;
    cancelled = self->_cancelled;
    self->_cancelled = 0;

  }
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (void)deleteTrpId
{
  -[ORCHSchemaORCHPommesBridgeContext setTrpId:](self, "setTrpId:", 0);
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteSubRequestId
{
  -[ORCHSchemaORCHPommesBridgeContext setSubRequestId:](self, "setSubRequestId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHPommesBridgeContextReadFrom(self, (uint64_t)a3);
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
  void *v15;
  id v16;

  v16 = a3;
  -[ORCHSchemaORCHPommesBridgeContext startedOrChanged](self, "startedOrChanged");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ORCHSchemaORCHPommesBridgeContext startedOrChanged](self, "startedOrChanged");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHPommesBridgeContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ORCHSchemaORCHPommesBridgeContext ended](self, "ended");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHPommesBridgeContext failed](self, "failed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ORCHSchemaORCHPommesBridgeContext failed](self, "failed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHPommesBridgeContext cancelled](self, "cancelled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ORCHSchemaORCHPommesBridgeContext cancelled](self, "cancelled");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHPommesBridgeContext trpId](self, "trpId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[ORCHSchemaORCHPommesBridgeContext trpId](self, "trpId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ORCHSchemaORCHPommesBridgeContext subRequestId](self, "subRequestId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ORCHSchemaORCHPommesBridgeContext subRequestId](self, "subRequestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  BOOL v38;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  whichContextevent = self->_whichContextevent;
  if (whichContextevent != objc_msgSend(v4, "whichContextevent"))
    goto LABEL_33;
  -[ORCHSchemaORCHPommesBridgeContext startedOrChanged](self, "startedOrChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedOrChanged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[ORCHSchemaORCHPommesBridgeContext startedOrChanged](self, "startedOrChanged");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[ORCHSchemaORCHPommesBridgeContext startedOrChanged](self, "startedOrChanged");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedOrChanged");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_33;
  }
  else
  {

  }
  -[ORCHSchemaORCHPommesBridgeContext ended](self, "ended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[ORCHSchemaORCHPommesBridgeContext ended](self, "ended");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ORCHSchemaORCHPommesBridgeContext ended](self, "ended");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ended");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_33;
  }
  else
  {

  }
  -[ORCHSchemaORCHPommesBridgeContext failed](self, "failed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[ORCHSchemaORCHPommesBridgeContext failed](self, "failed");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[ORCHSchemaORCHPommesBridgeContext failed](self, "failed");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failed");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_33;
  }
  else
  {

  }
  -[ORCHSchemaORCHPommesBridgeContext cancelled](self, "cancelled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[ORCHSchemaORCHPommesBridgeContext cancelled](self, "cancelled");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[ORCHSchemaORCHPommesBridgeContext cancelled](self, "cancelled");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelled");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_33;
  }
  else
  {

  }
  -[ORCHSchemaORCHPommesBridgeContext trpId](self, "trpId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_32;
  -[ORCHSchemaORCHPommesBridgeContext trpId](self, "trpId");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[ORCHSchemaORCHPommesBridgeContext trpId](self, "trpId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trpId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_33;
  }
  else
  {

  }
  -[ORCHSchemaORCHPommesBridgeContext subRequestId](self, "subRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subRequestId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[ORCHSchemaORCHPommesBridgeContext subRequestId](self, "subRequestId");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {

LABEL_36:
      v38 = 1;
      goto LABEL_34;
    }
    v34 = (void *)v33;
    -[ORCHSchemaORCHPommesBridgeContext subRequestId](self, "subRequestId");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subRequestId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if ((v37 & 1) != 0)
      goto LABEL_36;
  }
  else
  {
LABEL_32:

  }
LABEL_33:
  v38 = 0;
LABEL_34:

  return v38;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[ORCHSchemaORCHPommesRequestStarted hash](self->_startedOrChanged, "hash");
  v4 = -[ORCHSchemaORCHPommesRequestEnded hash](self->_ended, "hash") ^ v3;
  v5 = -[ORCHSchemaORCHPommesRequestFailed hash](self->_failed, "hash");
  v6 = v4 ^ v5 ^ -[ORCHSchemaORCHPommesRequestUnableToHandle hash](self->_cancelled, "hash");
  v7 = -[SISchemaUUID hash](self->_trpId, "hash");
  return v6 ^ v7 ^ -[SISchemaUUID hash](self->_subRequestId, "hash");
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
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cancelled)
  {
    -[ORCHSchemaORCHPommesBridgeContext cancelled](self, "cancelled");
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
    -[ORCHSchemaORCHPommesBridgeContext ended](self, "ended");
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
    -[ORCHSchemaORCHPommesBridgeContext failed](self, "failed");
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
  if (self->_startedOrChanged)
  {
    -[ORCHSchemaORCHPommesBridgeContext startedOrChanged](self, "startedOrChanged");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("startedOrChanged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("startedOrChanged"));

    }
  }
  if (self->_subRequestId)
  {
    -[ORCHSchemaORCHPommesBridgeContext subRequestId](self, "subRequestId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("subRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("subRequestId"));

    }
  }
  if (self->_trpId)
  {
    -[ORCHSchemaORCHPommesBridgeContext trpId](self, "trpId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("trpId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("trpId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHPommesBridgeContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHPommesBridgeContext)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHPommesBridgeContext *v5;
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
    self = -[ORCHSchemaORCHPommesBridgeContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHPommesBridgeContext)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHPommesBridgeContext *v5;
  void *v6;
  ORCHSchemaORCHPommesRequestStarted *v7;
  void *v8;
  ORCHSchemaORCHPommesRequestEnded *v9;
  void *v10;
  ORCHSchemaORCHPommesRequestFailed *v11;
  void *v12;
  ORCHSchemaORCHPommesRequestUnableToHandle *v13;
  void *v14;
  SISchemaUUID *v15;
  void *v16;
  SISchemaUUID *v17;
  ORCHSchemaORCHPommesBridgeContext *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ORCHSchemaORCHPommesBridgeContext;
  v5 = -[ORCHSchemaORCHPommesBridgeContext init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startedOrChanged"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ORCHSchemaORCHPommesRequestStarted initWithDictionary:]([ORCHSchemaORCHPommesRequestStarted alloc], "initWithDictionary:", v6);
      -[ORCHSchemaORCHPommesBridgeContext setStartedOrChanged:](v5, "setStartedOrChanged:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ended"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ORCHSchemaORCHPommesRequestEnded initWithDictionary:]([ORCHSchemaORCHPommesRequestEnded alloc], "initWithDictionary:", v8);
      -[ORCHSchemaORCHPommesBridgeContext setEnded:](v5, "setEnded:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ORCHSchemaORCHPommesRequestFailed initWithDictionary:]([ORCHSchemaORCHPommesRequestFailed alloc], "initWithDictionary:", v10);
      -[ORCHSchemaORCHPommesBridgeContext setFailed:](v5, "setFailed:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[ORCHSchemaORCHPommesRequestUnableToHandle initWithDictionary:]([ORCHSchemaORCHPommesRequestUnableToHandle alloc], "initWithDictionary:", v12);
      -[ORCHSchemaORCHPommesBridgeContext setCancelled:](v5, "setCancelled:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trpId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v14);
      -[ORCHSchemaORCHPommesBridgeContext setTrpId:](v5, "setTrpId:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subRequestId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v16);
      -[ORCHSchemaORCHPommesBridgeContext setSubRequestId:](v5, "setSubRequestId:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return self->_whichContextevent;
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (void)setTrpId:(id)a3
{
  objc_storeStrong((id *)&self->_trpId, a3);
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setSubRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_subRequestId, a3);
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

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasTrpId = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasSubRequestId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_cancelled, 0);
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_startedOrChanged, 0);
}

@end
