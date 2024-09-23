@implementation IFTSchemaIFTStatementResult

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
  v22.super_class = (Class)IFTSchemaIFTStatementResult;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v22, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 4))
    -[IFTSchemaIFTStatementResult deleteToolId](self, "deleteToolId");
  -[IFTSchemaIFTStatementResult resultStatementId](self, "resultStatementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[IFTSchemaIFTStatementResult deleteResultStatementId](self, "deleteResultStatementId");
  -[IFTSchemaIFTStatementResult originProgramStatementId](self, "originProgramStatementId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[IFTSchemaIFTStatementResult deleteOriginProgramStatementId](self, "deleteOriginProgramStatementId");
  -[IFTSchemaIFTStatementResult payload](self, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[IFTSchemaIFTStatementResult deletePayload](self, "deletePayload");
  -[IFTSchemaIFTStatementResult actionEventId](self, "actionEventId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[IFTSchemaIFTStatementResult deleteActionEventId](self, "deleteActionEventId");
  -[IFTSchemaIFTStatementResult originTaskStatementId](self, "originTaskStatementId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[IFTSchemaIFTStatementResult deleteOriginTaskStatementId](self, "deleteOriginTaskStatementId");

  return v5;
}

- (void)setExists:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_exists = a3;
}

- (BOOL)hasExists
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExists:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteExists
{
  -[IFTSchemaIFTStatementResult setExists:](self, "setExists:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasResultStatementId
{
  return self->_resultStatementId != 0;
}

- (void)deleteResultStatementId
{
  -[IFTSchemaIFTStatementResult setResultStatementId:](self, "setResultStatementId:", 0);
}

- (BOOL)hasOriginProgramStatementId
{
  return self->_originProgramStatementId != 0;
}

- (void)deleteOriginProgramStatementId
{
  -[IFTSchemaIFTStatementResult setOriginProgramStatementId:](self, "setOriginProgramStatementId:", 0);
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (void)deletePayload
{
  -[IFTSchemaIFTStatementResult setPayload:](self, "setPayload:", 0);
}

- (BOOL)hasToolId
{
  return self->_toolId != 0;
}

- (void)deleteToolId
{
  -[IFTSchemaIFTStatementResult setToolId:](self, "setToolId:", 0);
}

- (BOOL)hasActionEventId
{
  return self->_actionEventId != 0;
}

- (void)deleteActionEventId
{
  -[IFTSchemaIFTStatementResult setActionEventId:](self, "setActionEventId:", 0);
}

- (BOOL)hasOriginTaskStatementId
{
  return self->_originTaskStatementId != 0;
}

- (void)deleteOriginTaskStatementId
{
  -[IFTSchemaIFTStatementResult setOriginTaskStatementId:](self, "setOriginTaskStatementId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTStatementResultReadFrom(self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[IFTSchemaIFTStatementResult resultStatementId](self, "resultStatementId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IFTSchemaIFTStatementResult resultStatementId](self, "resultStatementId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementResult originProgramStatementId](self, "originProgramStatementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IFTSchemaIFTStatementResult originProgramStatementId](self, "originProgramStatementId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementResult payload](self, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IFTSchemaIFTStatementResult payload](self, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementResult toolId](self, "toolId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[IFTSchemaIFTStatementResult actionEventId](self, "actionEventId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[IFTSchemaIFTStatementResult actionEventId](self, "actionEventId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[IFTSchemaIFTStatementResult originTaskStatementId](self, "originTaskStatementId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v16;
  if (v13)
  {
    -[IFTSchemaIFTStatementResult originTaskStatementId](self, "originTaskStatementId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v14 = v16;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int exists;
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
    goto LABEL_35;
  if ((*(_BYTE *)&self->_has & 1) != (v4[64] & 1))
    goto LABEL_35;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    exists = self->_exists;
    if (exists != objc_msgSend(v4, "exists"))
      goto LABEL_35;
  }
  -[IFTSchemaIFTStatementResult resultStatementId](self, "resultStatementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultStatementId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_34;
  -[IFTSchemaIFTStatementResult resultStatementId](self, "resultStatementId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IFTSchemaIFTStatementResult resultStatementId](self, "resultStatementId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resultStatementId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_35;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementResult originProgramStatementId](self, "originProgramStatementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originProgramStatementId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_34;
  -[IFTSchemaIFTStatementResult originProgramStatementId](self, "originProgramStatementId");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[IFTSchemaIFTStatementResult originProgramStatementId](self, "originProgramStatementId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originProgramStatementId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_35;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementResult payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_34;
  -[IFTSchemaIFTStatementResult payload](self, "payload");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[IFTSchemaIFTStatementResult payload](self, "payload");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_35;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementResult toolId](self, "toolId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_34;
  -[IFTSchemaIFTStatementResult toolId](self, "toolId");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[IFTSchemaIFTStatementResult toolId](self, "toolId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toolId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_35;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementResult actionEventId](self, "actionEventId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionEventId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_34;
  -[IFTSchemaIFTStatementResult actionEventId](self, "actionEventId");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[IFTSchemaIFTStatementResult actionEventId](self, "actionEventId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionEventId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_35;
  }
  else
  {

  }
  -[IFTSchemaIFTStatementResult originTaskStatementId](self, "originTaskStatementId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originTaskStatementId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[IFTSchemaIFTStatementResult originTaskStatementId](self, "originTaskStatementId");
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {

LABEL_38:
      v38 = 1;
      goto LABEL_36;
    }
    v34 = (void *)v33;
    -[IFTSchemaIFTStatementResult originTaskStatementId](self, "originTaskStatementId");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originTaskStatementId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if ((v37 & 1) != 0)
      goto LABEL_38;
  }
  else
  {
LABEL_34:

  }
LABEL_35:
  v38 = 0;
LABEL_36:

  return v38;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_exists;
  else
    v3 = 0;
  v4 = -[IFTSchemaIFTStatementId hash](self->_resultStatementId, "hash") ^ v3;
  v5 = -[IFTSchemaIFTStatementId hash](self->_originProgramStatementId, "hash");
  v6 = v4 ^ v5 ^ -[IFTSchemaIFTStatementResultPayload hash](self->_payload, "hash");
  v7 = -[NSString hash](self->_toolId, "hash");
  v8 = v7 ^ -[SISchemaUUID hash](self->_actionEventId, "hash");
  return v6 ^ v8 ^ -[IFTSchemaIFTStatementId hash](self->_originTaskStatementId, "hash");
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
  if (self->_actionEventId)
  {
    -[IFTSchemaIFTStatementResult actionEventId](self, "actionEventId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionEventId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionEventId"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTStatementResult exists](self, "exists"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("exists"));

  }
  if (self->_originProgramStatementId)
  {
    -[IFTSchemaIFTStatementResult originProgramStatementId](self, "originProgramStatementId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("originProgramStatementId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("originProgramStatementId"));

    }
  }
  if (self->_originTaskStatementId)
  {
    -[IFTSchemaIFTStatementResult originTaskStatementId](self, "originTaskStatementId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("originTaskStatementId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("originTaskStatementId"));

    }
  }
  if (self->_payload)
  {
    -[IFTSchemaIFTStatementResult payload](self, "payload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("payload"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("payload"));

    }
  }
  if (self->_resultStatementId)
  {
    -[IFTSchemaIFTStatementResult resultStatementId](self, "resultStatementId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("resultStatementId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("resultStatementId"));

    }
  }
  if (self->_toolId)
  {
    -[IFTSchemaIFTStatementResult toolId](self, "toolId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("toolId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTStatementResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTStatementResult)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTStatementResult *v5;
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
    self = -[IFTSchemaIFTStatementResult initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTStatementResult)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTStatementResult *v5;
  void *v6;
  void *v7;
  IFTSchemaIFTStatementId *v8;
  void *v9;
  IFTSchemaIFTStatementId *v10;
  void *v11;
  IFTSchemaIFTStatementResultPayload *v12;
  void *v13;
  void *v14;
  void *v15;
  SISchemaUUID *v16;
  void *v17;
  IFTSchemaIFTStatementId *v18;
  IFTSchemaIFTStatementResult *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IFTSchemaIFTStatementResult;
  v5 = -[IFTSchemaIFTStatementResult init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTStatementResult setExists:](v5, "setExists:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resultStatementId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[IFTSchemaIFTStatementId initWithDictionary:]([IFTSchemaIFTStatementId alloc], "initWithDictionary:", v7);
      -[IFTSchemaIFTStatementResult setResultStatementId:](v5, "setResultStatementId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originProgramStatementId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[IFTSchemaIFTStatementId initWithDictionary:]([IFTSchemaIFTStatementId alloc], "initWithDictionary:", v9);
      -[IFTSchemaIFTStatementResult setOriginProgramStatementId:](v5, "setOriginProgramStatementId:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("payload"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[IFTSchemaIFTStatementResultPayload initWithDictionary:]([IFTSchemaIFTStatementResultPayload alloc], "initWithDictionary:", v11);
      -[IFTSchemaIFTStatementResult setPayload:](v5, "setPayload:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toolId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      -[IFTSchemaIFTStatementResult setToolId:](v5, "setToolId:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionEventId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v15);
      -[IFTSchemaIFTStatementResult setActionEventId:](v5, "setActionEventId:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originTaskStatementId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[IFTSchemaIFTStatementId initWithDictionary:]([IFTSchemaIFTStatementId alloc], "initWithDictionary:", v17);
      -[IFTSchemaIFTStatementResult setOriginTaskStatementId:](v5, "setOriginTaskStatementId:", v18);

    }
    v19 = v5;

  }
  return v5;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTStatementId)resultStatementId
{
  return self->_resultStatementId;
}

- (void)setResultStatementId:(id)a3
{
  objc_storeStrong((id *)&self->_resultStatementId, a3);
}

- (IFTSchemaIFTStatementId)originProgramStatementId
{
  return self->_originProgramStatementId;
}

- (void)setOriginProgramStatementId:(id)a3
{
  objc_storeStrong((id *)&self->_originProgramStatementId, a3);
}

- (IFTSchemaIFTStatementResultPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (NSString)toolId
{
  return self->_toolId;
}

- (void)setToolId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SISchemaUUID)actionEventId
{
  return self->_actionEventId;
}

- (void)setActionEventId:(id)a3
{
  objc_storeStrong((id *)&self->_actionEventId, a3);
}

- (IFTSchemaIFTStatementId)originTaskStatementId
{
  return self->_originTaskStatementId;
}

- (void)setOriginTaskStatementId:(id)a3
{
  objc_storeStrong((id *)&self->_originTaskStatementId, a3);
}

- (void)setHasResultStatementId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasOriginProgramStatementId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasPayload:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasToolId:(BOOL)a3
{
  self->_hasResultStatementId = a3;
}

- (void)setHasActionEventId:(BOOL)a3
{
  self->_hasOriginProgramStatementId = a3;
}

- (void)setHasOriginTaskStatementId:(BOOL)a3
{
  self->_hasPayload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originTaskStatementId, 0);
  objc_storeStrong((id *)&self->_actionEventId, 0);
  objc_storeStrong((id *)&self->_toolId, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_originProgramStatementId, 0);
  objc_storeStrong((id *)&self->_resultStatementId, 0);
}

@end
