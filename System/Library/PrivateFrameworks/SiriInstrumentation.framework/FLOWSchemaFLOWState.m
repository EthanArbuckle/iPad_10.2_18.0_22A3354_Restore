@implementation FLOWSchemaFLOWState

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
  v9.super_class = (Class)FLOWSchemaFLOWState;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWState flowStateReason](self, "flowStateReason", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[FLOWSchemaFLOWState deleteFlowStateReason](self, "deleteFlowStateReason");
  return v5;
}

- (BOOL)hasCurrentTaskName
{
  return self->_currentTaskName != 0;
}

- (void)deleteCurrentTaskName
{
  -[FLOWSchemaFLOWState setCurrentTaskName:](self, "setCurrentTaskName:", 0);
}

- (BOOL)hasCurrentTaskType
{
  return self->_currentTaskType != 0;
}

- (void)deleteCurrentTaskType
{
  -[FLOWSchemaFLOWState setCurrentTaskType:](self, "setCurrentTaskType:", 0);
}

- (void)setFlowStateType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_flowStateType = a3;
}

- (BOOL)hasFlowStateType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasFlowStateType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteFlowStateType
{
  -[FLOWSchemaFLOWState setFlowStateType:](self, "setFlowStateType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasFlowStateReason
{
  return self->_flowStateReason != 0;
}

- (void)deleteFlowStateReason
{
  -[FLOWSchemaFLOWState setFlowStateReason:](self, "setFlowStateReason:", 0);
}

- (BOOL)hasResolvedSlotName
{
  return self->_resolvedSlotName != 0;
}

- (void)deleteResolvedSlotName
{
  -[FLOWSchemaFLOWState setResolvedSlotName:](self, "setResolvedSlotName:", 0);
}

- (BOOL)hasFlowStateReasonDescription
{
  return self->_flowStateReasonDescription != 0;
}

- (void)deleteFlowStateReasonDescription
{
  -[FLOWSchemaFLOWState setFlowStateReasonDescription:](self, "setFlowStateReasonDescription:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWStateReadFrom(self, (uint64_t)a3);
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
  id v11;

  v11 = a3;
  -[FLOWSchemaFLOWState currentTaskName](self, "currentTaskName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[FLOWSchemaFLOWState currentTaskType](self, "currentTaskType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[FLOWSchemaFLOWState flowStateReason](self, "flowStateReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FLOWSchemaFLOWState flowStateReason](self, "flowStateReason");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWState resolvedSlotName](self, "resolvedSlotName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[FLOWSchemaFLOWState flowStateReasonDescription](self, "flowStateReasonDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
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
  int flowStateType;
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
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[FLOWSchemaFLOWState currentTaskName](self, "currentTaskName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTaskName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[FLOWSchemaFLOWState currentTaskName](self, "currentTaskName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWState currentTaskName](self, "currentTaskName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentTaskName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_30;
  }
  else
  {

  }
  -[FLOWSchemaFLOWState currentTaskType](self, "currentTaskType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTaskType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[FLOWSchemaFLOWState currentTaskType](self, "currentTaskType");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[FLOWSchemaFLOWState currentTaskType](self, "currentTaskType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentTaskType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_30;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[56] & 1))
    goto LABEL_30;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    flowStateType = self->_flowStateType;
    if (flowStateType != objc_msgSend(v4, "flowStateType"))
      goto LABEL_30;
  }
  -[FLOWSchemaFLOWState flowStateReason](self, "flowStateReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowStateReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[FLOWSchemaFLOWState flowStateReason](self, "flowStateReason");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[FLOWSchemaFLOWState flowStateReason](self, "flowStateReason");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowStateReason");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_30;
  }
  else
  {

  }
  -[FLOWSchemaFLOWState resolvedSlotName](self, "resolvedSlotName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedSlotName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[FLOWSchemaFLOWState resolvedSlotName](self, "resolvedSlotName");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[FLOWSchemaFLOWState resolvedSlotName](self, "resolvedSlotName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolvedSlotName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_30;
  }
  else
  {

  }
  -[FLOWSchemaFLOWState flowStateReasonDescription](self, "flowStateReasonDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowStateReasonDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[FLOWSchemaFLOWState flowStateReasonDescription](self, "flowStateReasonDescription");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
    {

LABEL_33:
      v33 = 1;
      goto LABEL_31;
    }
    v29 = (void *)v28;
    -[FLOWSchemaFLOWState flowStateReasonDescription](self, "flowStateReasonDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowStateReasonDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if ((v32 & 1) != 0)
      goto LABEL_33;
  }
  else
  {
LABEL_29:

  }
LABEL_30:
  v33 = 0;
LABEL_31:

  return v33;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_currentTaskName, "hash");
  v4 = -[NSString hash](self->_currentTaskType, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_flowStateType;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[FLOWSchemaFLOWStateReason hash](self->_flowStateReason, "hash");
  v7 = -[NSString hash](self->_resolvedSlotName, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_flowStateReasonDescription, "hash");
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
  unsigned int v13;
  const __CFString *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_currentTaskName)
  {
    -[FLOWSchemaFLOWState currentTaskName](self, "currentTaskName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("currentTaskName"));

  }
  if (self->_currentTaskType)
  {
    -[FLOWSchemaFLOWState currentTaskType](self, "currentTaskType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("currentTaskType"));

  }
  if (self->_flowStateReason)
  {
    -[FLOWSchemaFLOWState flowStateReason](self, "flowStateReason");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("flowStateReason"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("flowStateReason"));

    }
  }
  if (self->_flowStateReasonDescription)
  {
    -[FLOWSchemaFLOWState flowStateReasonDescription](self, "flowStateReasonDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("flowStateReasonDescription"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v13 = -[FLOWSchemaFLOWState flowStateType](self, "flowStateType") - 1;
    if (v13 > 0xCE)
      v14 = CFSTR("FLOWSTATETYPE_UNKNOWN");
    else
      v14 = off_1E562E9D0[v13];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("flowStateType"));
  }
  if (self->_resolvedSlotName)
  {
    -[FLOWSchemaFLOWState resolvedSlotName](self, "resolvedSlotName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("resolvedSlotName"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWState dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWState)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWState *v5;
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
    self = -[FLOWSchemaFLOWState initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWState)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FLOWSchemaFLOWStateReason *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  FLOWSchemaFLOWState *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FLOWSchemaFLOWState;
  v5 = -[FLOWSchemaFLOWState init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentTaskName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[FLOWSchemaFLOWState setCurrentTaskName:](v5, "setCurrentTaskName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentTaskType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[FLOWSchemaFLOWState setCurrentTaskType:](v5, "setCurrentTaskType:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowStateType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLOWSchemaFLOWState setFlowStateType:](v5, "setFlowStateType:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowStateReason"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[FLOWSchemaFLOWStateReason initWithDictionary:]([FLOWSchemaFLOWStateReason alloc], "initWithDictionary:", v11);
      -[FLOWSchemaFLOWState setFlowStateReason:](v5, "setFlowStateReason:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolvedSlotName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      -[FLOWSchemaFLOWState setResolvedSlotName:](v5, "setResolvedSlotName:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flowStateReasonDescription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (void *)objc_msgSend(v15, "copy");
      -[FLOWSchemaFLOWState setFlowStateReasonDescription:](v5, "setFlowStateReasonDescription:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (NSString)currentTaskName
{
  return self->_currentTaskName;
}

- (void)setCurrentTaskName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)currentTaskType
{
  return self->_currentTaskType;
}

- (void)setCurrentTaskType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)flowStateType
{
  return self->_flowStateType;
}

- (FLOWSchemaFLOWStateReason)flowStateReason
{
  return self->_flowStateReason;
}

- (void)setFlowStateReason:(id)a3
{
  objc_storeStrong((id *)&self->_flowStateReason, a3);
}

- (NSString)resolvedSlotName
{
  return self->_resolvedSlotName;
}

- (void)setResolvedSlotName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)flowStateReasonDescription
{
  return self->_flowStateReasonDescription;
}

- (void)setFlowStateReasonDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setHasCurrentTaskName:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasCurrentTaskType:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasFlowStateReason:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasResolvedSlotName:(BOOL)a3
{
  self->_hasCurrentTaskName = a3;
}

- (void)setHasFlowStateReasonDescription:(BOOL)a3
{
  self->_hasCurrentTaskType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowStateReasonDescription, 0);
  objc_storeStrong((id *)&self->_resolvedSlotName, 0);
  objc_storeStrong((id *)&self->_flowStateReason, 0);
  objc_storeStrong((id *)&self->_currentTaskType, 0);
  objc_storeStrong((id *)&self->_currentTaskName, 0);
}

@end
