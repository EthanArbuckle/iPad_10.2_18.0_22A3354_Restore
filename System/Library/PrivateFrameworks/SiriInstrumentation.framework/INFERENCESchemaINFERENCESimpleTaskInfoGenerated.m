@implementation INFERENCESchemaINFERENCESimpleTaskInfoGenerated

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
  v13.super_class = (Class)INFERENCESchemaINFERENCESimpleTaskInfoGenerated;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated deleteOriginalResolutionContextId](self, "deleteOriginalResolutionContextId");
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated taskSpecificInfo](self, "taskSpecificInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated deleteTaskSpecificInfo](self, "deleteTaskSpecificInfo");

  return v5;
}

- (BOOL)hasOriginalResolutionContextId
{
  return self->_originalResolutionContextId != 0;
}

- (void)deleteOriginalResolutionContextId
{
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setOriginalResolutionContextId:](self, "setOriginalResolutionContextId:", 0);
}

- (void)setTaskSuccessType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_taskSuccessType = a3;
}

- (BOOL)hasTaskSuccessType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTaskSuccessType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTaskSuccessType
{
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setTaskSuccessType:](self, "setTaskSuccessType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isSuccess = a3;
}

- (BOOL)hasIsSuccess
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsSuccess
{
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setIsSuccess:](self, "setIsSuccess:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setIsExecuted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isExecuted = a3;
}

- (BOOL)hasIsExecuted
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsExecuted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsExecuted
{
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setIsExecuted:](self, "setIsExecuted:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setIsSuccessfulDirectExecution:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isSuccessfulDirectExecution = a3;
}

- (BOOL)hasIsSuccessfulDirectExecution
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsSuccessfulDirectExecution:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsSuccessfulDirectExecution
{
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setIsSuccessfulDirectExecution:](self, "setIsSuccessfulDirectExecution:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasTaskSpecificInfo
{
  return self->_taskSpecificInfo != 0;
}

- (void)deleteTaskSpecificInfo
{
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setTaskSpecificInfo:](self, "setTaskSpecificInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCESimpleTaskInfoGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_7:
    PBDataWriterWriteBOOLField();
LABEL_8:
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated taskSpecificInfo](self, "taskSpecificInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7)
  {
    -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated taskSpecificInfo](self, "taskSpecificInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v8 = v10;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  $D0A8AFD3306F227765B6DFDF1C2507FA has;
  unsigned int v13;
  int taskSuccessType;
  int v15;
  int isSuccess;
  int v17;
  int isExecuted;
  int v19;
  int isSuccessfulDirectExecution;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalResolutionContextId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalResolutionContextId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_27;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    taskSuccessType = self->_taskSuccessType;
    if (taskSuccessType != objc_msgSend(v4, "taskSuccessType"))
      goto LABEL_27;
    has = self->_has;
    v13 = v4[32];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_27;
  if (v15)
  {
    isSuccess = self->_isSuccess;
    if (isSuccess != objc_msgSend(v4, "isSuccess"))
      goto LABEL_27;
    has = self->_has;
    v13 = v4[32];
  }
  v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1))
    goto LABEL_27;
  if (v17)
  {
    isExecuted = self->_isExecuted;
    if (isExecuted != objc_msgSend(v4, "isExecuted"))
      goto LABEL_27;
    has = self->_has;
    v13 = v4[32];
  }
  v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1))
    goto LABEL_27;
  if (v19)
  {
    isSuccessfulDirectExecution = self->_isSuccessfulDirectExecution;
    if (isSuccessfulDirectExecution != objc_msgSend(v4, "isSuccessfulDirectExecution"))
      goto LABEL_27;
  }
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated taskSpecificInfo](self, "taskSpecificInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskSpecificInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated taskSpecificInfo](self, "taskSpecificInfo");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {

LABEL_30:
    v26 = 1;
    goto LABEL_28;
  }
  v22 = (void *)v21;
  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated taskSpecificInfo](self, "taskSpecificInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskSpecificInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "isEqual:", v24);

  if ((v25 & 1) != 0)
    goto LABEL_30;
LABEL_27:
  v26 = 0;
LABEL_28:

  return v26;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_originalResolutionContextId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_taskSuccessType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_isSuccess;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[INFERENCESchemaINFERENCETaskSpecificInfo hash](self->_taskSpecificInfo, "hash");
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_isExecuted;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_isSuccessfulDirectExecution;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[INFERENCESchemaINFERENCETaskSpecificInfo hash](self->_taskSpecificInfo, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated isExecuted](self, "isExecuted"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isExecuted"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated isSuccess](self, "isSuccess"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isSuccess"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated isSuccessfulDirectExecution](self, "isSuccessfulDirectExecution"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isSuccessfulDirectExecution"));

  }
LABEL_5:
  if (self->_originalResolutionContextId)
  {
    -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated originalResolutionContextId](self, "originalResolutionContextId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("originalResolutionContextId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("originalResolutionContextId"));

    }
  }
  if (self->_taskSpecificInfo)
  {
    -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated taskSpecificInfo](self, "taskSpecificInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("taskSpecificInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("taskSpecificInfo"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v14 = -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated taskSuccessType](self, "taskSuccessType") - 1;
    if (v14 > 3)
      v15 = CFSTR("INFERENCETASKSUCCESSTYPE_UNKNOWN");
    else
      v15 = off_1E562FD78[v14];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("taskSuccessType"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (INFERENCESchemaINFERENCESimpleTaskInfoGenerated)initWithJSON:(id)a3
{
  void *v4;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *v5;
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
    self = -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (INFERENCESchemaINFERENCESimpleTaskInfoGenerated)initWithDictionary:(id)a3
{
  id v4;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  INFERENCESchemaINFERENCETaskSpecificInfo *v13;
  INFERENCESchemaINFERENCESimpleTaskInfoGenerated *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)INFERENCESchemaINFERENCESimpleTaskInfoGenerated;
  v5 = -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originalResolutionContextId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setOriginalResolutionContextId:](v5, "setOriginalResolutionContextId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskSuccessType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setTaskSuccessType:](v5, "setTaskSuccessType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSuccess"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setIsSuccess:](v5, "setIsSuccess:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isExecuted"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setIsExecuted:](v5, "setIsExecuted:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSuccessfulDirectExecution"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setIsSuccessfulDirectExecution:](v5, "setIsSuccessfulDirectExecution:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskSpecificInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[INFERENCESchemaINFERENCETaskSpecificInfo initWithDictionary:]([INFERENCESchemaINFERENCETaskSpecificInfo alloc], "initWithDictionary:", v12);
      -[INFERENCESchemaINFERENCESimpleTaskInfoGenerated setTaskSpecificInfo:](v5, "setTaskSpecificInfo:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (SISchemaUUID)originalResolutionContextId
{
  return self->_originalResolutionContextId;
}

- (void)setOriginalResolutionContextId:(id)a3
{
  objc_storeStrong((id *)&self->_originalResolutionContextId, a3);
}

- (int)taskSuccessType
{
  return self->_taskSuccessType;
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (BOOL)isExecuted
{
  return self->_isExecuted;
}

- (BOOL)isSuccessfulDirectExecution
{
  return self->_isSuccessfulDirectExecution;
}

- (INFERENCESchemaINFERENCETaskSpecificInfo)taskSpecificInfo
{
  return self->_taskSpecificInfo;
}

- (void)setTaskSpecificInfo:(id)a3
{
  objc_storeStrong((id *)&self->_taskSpecificInfo, a3);
}

- (void)setHasOriginalResolutionContextId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasTaskSpecificInfo:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskSpecificInfo, 0);
  objc_storeStrong((id *)&self->_originalResolutionContextId, 0);
}

@end
