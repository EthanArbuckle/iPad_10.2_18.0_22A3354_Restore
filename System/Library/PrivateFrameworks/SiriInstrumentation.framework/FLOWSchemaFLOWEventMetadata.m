@implementation FLOWSchemaFLOWEventMetadata

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
  v25.super_class = (Class)FLOWSchemaFLOWEventMetadata;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v25, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWEventMetadata taskId](self, "taskId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLOWSchemaFLOWEventMetadata deleteTaskId](self, "deleteTaskId");
  -[FLOWSchemaFLOWEventMetadata version](self, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLOWSchemaFLOWEventMetadata deleteVersion](self, "deleteVersion");
  -[FLOWSchemaFLOWEventMetadata flowId](self, "flowId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[FLOWSchemaFLOWEventMetadata deleteFlowId](self, "deleteFlowId");
  -[FLOWSchemaFLOWEventMetadata requestId](self, "requestId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[FLOWSchemaFLOWEventMetadata deleteRequestId](self, "deleteRequestId");
  -[FLOWSchemaFLOWEventMetadata trpId](self, "trpId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[FLOWSchemaFLOWEventMetadata deleteTrpId](self, "deleteTrpId");
  -[FLOWSchemaFLOWEventMetadata subRequestId](self, "subRequestId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[FLOWSchemaFLOWEventMetadata deleteSubRequestId](self, "deleteSubRequestId");

  return v5;
}

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

- (void)deleteTaskId
{
  -[FLOWSchemaFLOWEventMetadata setTaskId:](self, "setTaskId:", 0);
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteResultCandidateId
{
  -[FLOWSchemaFLOWEventMetadata setResultCandidateId:](self, "setResultCandidateId:", 0);
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (void)deleteVersion
{
  -[FLOWSchemaFLOWEventMetadata setVersion:](self, "setVersion:", 0);
}

- (BOOL)hasFlowId
{
  return self->_flowId != 0;
}

- (void)deleteFlowId
{
  -[FLOWSchemaFLOWEventMetadata setFlowId:](self, "setFlowId:", 0);
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)deleteRequestId
{
  -[FLOWSchemaFLOWEventMetadata setRequestId:](self, "setRequestId:", 0);
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (void)deleteTrpId
{
  -[FLOWSchemaFLOWEventMetadata setTrpId:](self, "setTrpId:", 0);
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteSubRequestId
{
  -[FLOWSchemaFLOWEventMetadata setSubRequestId:](self, "setSubRequestId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWEventMetadataReadFrom(self, (uint64_t)a3);
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
  void *v16;
  id v17;

  v17 = a3;
  -[FLOWSchemaFLOWEventMetadata taskId](self, "taskId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FLOWSchemaFLOWEventMetadata taskId](self, "taskId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWEventMetadata resultCandidateId](self, "resultCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[FLOWSchemaFLOWEventMetadata version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FLOWSchemaFLOWEventMetadata version](self, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWEventMetadata flowId](self, "flowId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[FLOWSchemaFLOWEventMetadata flowId](self, "flowId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWEventMetadata requestId](self, "requestId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[FLOWSchemaFLOWEventMetadata requestId](self, "requestId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWEventMetadata trpId](self, "trpId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[FLOWSchemaFLOWEventMetadata trpId](self, "trpId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWEventMetadata subRequestId](self, "subRequestId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[FLOWSchemaFLOWEventMetadata subRequestId](self, "subRequestId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  BOOL v42;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[FLOWSchemaFLOWEventMetadata taskId](self, "taskId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[FLOWSchemaFLOWEventMetadata taskId](self, "taskId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWEventMetadata taskId](self, "taskId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_37;
  }
  else
  {

  }
  -[FLOWSchemaFLOWEventMetadata resultCandidateId](self, "resultCandidateId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultCandidateId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[FLOWSchemaFLOWEventMetadata resultCandidateId](self, "resultCandidateId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[FLOWSchemaFLOWEventMetadata resultCandidateId](self, "resultCandidateId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultCandidateId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_37;
  }
  else
  {

  }
  -[FLOWSchemaFLOWEventMetadata version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[FLOWSchemaFLOWEventMetadata version](self, "version");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[FLOWSchemaFLOWEventMetadata version](self, "version");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_37;
  }
  else
  {

  }
  -[FLOWSchemaFLOWEventMetadata flowId](self, "flowId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[FLOWSchemaFLOWEventMetadata flowId](self, "flowId");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[FLOWSchemaFLOWEventMetadata flowId](self, "flowId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_37;
  }
  else
  {

  }
  -[FLOWSchemaFLOWEventMetadata requestId](self, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[FLOWSchemaFLOWEventMetadata requestId](self, "requestId");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[FLOWSchemaFLOWEventMetadata requestId](self, "requestId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_37;
  }
  else
  {

  }
  -[FLOWSchemaFLOWEventMetadata trpId](self, "trpId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trpId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[FLOWSchemaFLOWEventMetadata trpId](self, "trpId");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[FLOWSchemaFLOWEventMetadata trpId](self, "trpId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trpId");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_37;
  }
  else
  {

  }
  -[FLOWSchemaFLOWEventMetadata subRequestId](self, "subRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[FLOWSchemaFLOWEventMetadata subRequestId](self, "subRequestId");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {

LABEL_40:
      v42 = 1;
      goto LABEL_38;
    }
    v38 = (void *)v37;
    -[FLOWSchemaFLOWEventMetadata subRequestId](self, "subRequestId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subRequestId");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if ((v41 & 1) != 0)
      goto LABEL_40;
  }
  else
  {
LABEL_36:

  }
LABEL_37:
  v42 = 0;
LABEL_38:

  return v42;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[SISchemaUUID hash](self->_taskId, "hash");
  v4 = -[NSString hash](self->_resultCandidateId, "hash") ^ v3;
  v5 = -[SISchemaVersion hash](self->_version, "hash");
  v6 = v4 ^ v5 ^ -[SISchemaUUID hash](self->_flowId, "hash");
  v7 = -[SISchemaUUID hash](self->_requestId, "hash");
  v8 = v7 ^ -[SISchemaUUID hash](self->_trpId, "hash");
  return v6 ^ v8 ^ -[SISchemaUUID hash](self->_subRequestId, "hash");
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
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_flowId)
  {
    -[FLOWSchemaFLOWEventMetadata flowId](self, "flowId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("flowId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("flowId"));

    }
  }
  if (self->_requestId)
  {
    -[FLOWSchemaFLOWEventMetadata requestId](self, "requestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("requestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("requestId"));

    }
  }
  if (self->_resultCandidateId)
  {
    -[FLOWSchemaFLOWEventMetadata resultCandidateId](self, "resultCandidateId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("resultCandidateId"));

  }
  if (self->_subRequestId)
  {
    -[FLOWSchemaFLOWEventMetadata subRequestId](self, "subRequestId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("subRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("subRequestId"));

    }
  }
  if (self->_taskId)
  {
    -[FLOWSchemaFLOWEventMetadata taskId](self, "taskId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("taskId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("taskId"));

    }
  }
  if (self->_trpId)
  {
    -[FLOWSchemaFLOWEventMetadata trpId](self, "trpId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("trpId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("trpId"));

    }
  }
  if (self->_version)
  {
    -[FLOWSchemaFLOWEventMetadata version](self, "version");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("version"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("version"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWEventMetadata)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWEventMetadata *v5;
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
    self = -[FLOWSchemaFLOWEventMetadata initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWEventMetadata)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWEventMetadata *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  SISchemaVersion *v11;
  void *v12;
  SISchemaUUID *v13;
  void *v14;
  SISchemaUUID *v15;
  void *v16;
  SISchemaUUID *v17;
  void *v18;
  SISchemaUUID *v19;
  FLOWSchemaFLOWEventMetadata *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FLOWSchemaFLOWEventMetadata;
  v5 = -[FLOWSchemaFLOWEventMetadata init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[FLOWSchemaFLOWEventMetadata setTaskId:](v5, "setTaskId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultCandidateId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[FLOWSchemaFLOWEventMetadata setResultCandidateId:](v5, "setResultCandidateId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[SISchemaVersion initWithDictionary:]([SISchemaVersion alloc], "initWithDictionary:", v10);
      -[FLOWSchemaFLOWEventMetadata setVersion:](v5, "setVersion:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
      -[FLOWSchemaFLOWEventMetadata setFlowId:](v5, "setFlowId:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v14);
      -[FLOWSchemaFLOWEventMetadata setRequestId:](v5, "setRequestId:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trpId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v16);
      -[FLOWSchemaFLOWEventMetadata setTrpId:](v5, "setTrpId:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subRequestId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v18);
      -[FLOWSchemaFLOWEventMetadata setSubRequestId:](v5, "setSubRequestId:", v19);

    }
    v20 = v5;

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

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setResultCandidateId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SISchemaVersion)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (SISchemaUUID)flowId
{
  return self->_flowId;
}

- (void)setFlowId:(id)a3
{
  objc_storeStrong((id *)&self->_flowId, a3);
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
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

- (void)setHasTaskId:(BOOL)a3
{
  self->_hasTaskId = a3;
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  self->_hasResultCandidateId = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (void)setHasFlowId:(BOOL)a3
{
  self->_hasFlowId = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  self->_hasRequestId = a3;
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
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_flowId, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
}

@end
