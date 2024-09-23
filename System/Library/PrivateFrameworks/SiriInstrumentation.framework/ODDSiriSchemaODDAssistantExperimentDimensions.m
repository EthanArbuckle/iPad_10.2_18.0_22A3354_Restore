@implementation ODDSiriSchemaODDAssistantExperimentDimensions

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
  v13.super_class = (Class)ODDSiriSchemaODDAssistantExperimentDimensions;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDAssistantExperimentDimensions assistantDimensions](self, "assistantDimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODDSiriSchemaODDAssistantExperimentDimensions deleteAssistantDimensions](self, "deleteAssistantDimensions");
  -[ODDSiriSchemaODDAssistantExperimentDimensions codePathId](self, "codePathId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODDSiriSchemaODDAssistantExperimentDimensions deleteCodePathId](self, "deleteCodePathId");

  return v5;
}

- (BOOL)hasAssistantDimensions
{
  return self->_assistantDimensions != 0;
}

- (void)deleteAssistantDimensions
{
  -[ODDSiriSchemaODDAssistantExperimentDimensions setAssistantDimensions:](self, "setAssistantDimensions:", 0);
}

- (void)setExperimentAllocationStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_experimentAllocationStatus = a3;
}

- (BOOL)hasExperimentAllocationStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExperimentAllocationStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteExperimentAllocationStatus
{
  -[ODDSiriSchemaODDAssistantExperimentDimensions setExperimentAllocationStatus:](self, "setExperimentAllocationStatus:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setIsTriggered:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isTriggered = a3;
}

- (BOOL)hasIsTriggered
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsTriggered:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIsTriggered
{
  -[ODDSiriSchemaODDAssistantExperimentDimensions setIsTriggered:](self, "setIsTriggered:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setIsFirstTriggerOrAfterFirstTrigger:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isFirstTriggerOrAfterFirstTrigger = a3;
}

- (BOOL)hasIsFirstTriggerOrAfterFirstTrigger
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsFirstTriggerOrAfterFirstTrigger:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteIsFirstTriggerOrAfterFirstTrigger
{
  -[ODDSiriSchemaODDAssistantExperimentDimensions setIsFirstTriggerOrAfterFirstTrigger:](self, "setIsFirstTriggerOrAfterFirstTrigger:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)hasCodePathId
{
  return self->_codePathId != 0;
}

- (void)deleteCodePathId
{
  -[ODDSiriSchemaODDAssistantExperimentDimensions setCodePathId:](self, "setCodePathId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssistantExperimentDimensionsReadFrom(self, (uint64_t)a3);
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
  -[ODDSiriSchemaODDAssistantExperimentDimensions assistantDimensions](self, "assistantDimensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ODDSiriSchemaODDAssistantExperimentDimensions assistantDimensions](self, "assistantDimensions");
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
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:
  -[ODDSiriSchemaODDAssistantExperimentDimensions codePathId](self, "codePathId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7)
  {
    -[ODDSiriSchemaODDAssistantExperimentDimensions codePathId](self, "codePathId");
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
  $79B7638AD8FB2C9E0041D045F682F301 has;
  unsigned int v13;
  int experimentAllocationStatus;
  int v15;
  int isTriggered;
  int v17;
  int isFirstTriggerOrAfterFirstTrigger;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[ODDSiriSchemaODDAssistantExperimentDimensions assistantDimensions](self, "assistantDimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantDimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_22;
  -[ODDSiriSchemaODDAssistantExperimentDimensions assistantDimensions](self, "assistantDimensions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDAssistantExperimentDimensions assistantDimensions](self, "assistantDimensions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assistantDimensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_23;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[32];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_23;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    experimentAllocationStatus = self->_experimentAllocationStatus;
    if (experimentAllocationStatus != objc_msgSend(v4, "experimentAllocationStatus"))
      goto LABEL_23;
    has = self->_has;
    v13 = v4[32];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_23;
  if (v15)
  {
    isTriggered = self->_isTriggered;
    if (isTriggered != objc_msgSend(v4, "isTriggered"))
      goto LABEL_23;
    has = self->_has;
    v13 = v4[32];
  }
  v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1))
    goto LABEL_23;
  if (v17)
  {
    isFirstTriggerOrAfterFirstTrigger = self->_isFirstTriggerOrAfterFirstTrigger;
    if (isFirstTriggerOrAfterFirstTrigger != objc_msgSend(v4, "isFirstTriggerOrAfterFirstTrigger"))
      goto LABEL_23;
  }
  -[ODDSiriSchemaODDAssistantExperimentDimensions codePathId](self, "codePathId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "codePathId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_22:

    goto LABEL_23;
  }
  -[ODDSiriSchemaODDAssistantExperimentDimensions codePathId](self, "codePathId");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
  {

LABEL_26:
    v24 = 1;
    goto LABEL_24;
  }
  v20 = (void *)v19;
  -[ODDSiriSchemaODDAssistantExperimentDimensions codePathId](self, "codePathId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "codePathId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "isEqual:", v22);

  if ((v23 & 1) != 0)
    goto LABEL_26;
LABEL_23:
  v24 = 0;
LABEL_24:

  return v24;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[ODDSiriSchemaODDAssistantDimensions hash](self->_assistantDimensions, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[SISchemaUUID hash](self->_codePathId, "hash");
  }
  v4 = 2654435761 * self->_experimentAllocationStatus;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_isTriggered;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_isFirstTriggerOrAfterFirstTrigger;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[SISchemaUUID hash](self->_codePathId, "hash");
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
  char has;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_assistantDimensions)
  {
    -[ODDSiriSchemaODDAssistantExperimentDimensions assistantDimensions](self, "assistantDimensions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assistantDimensions"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("assistantDimensions"));

    }
  }
  if (self->_codePathId)
  {
    -[ODDSiriSchemaODDAssistantExperimentDimensions codePathId](self, "codePathId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("codePathId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("codePathId"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v11 = -[ODDSiriSchemaODDAssistantExperimentDimensions experimentAllocationStatus](self, "experimentAllocationStatus")- 1;
    if (v11 > 2)
      v12 = CFSTR("EXPTREATMENTALLOCATIONSTATUS_UNKNOWN");
    else
      v12 = off_1E563BC38[v11];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("experimentAllocationStatus"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDAssistantExperimentDimensions isFirstTriggerOrAfterFirstTrigger](self, "isFirstTriggerOrAfterFirstTrigger"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("isFirstTriggerOrAfterFirstTrigger"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ODDSiriSchemaODDAssistantExperimentDimensions isTriggered](self, "isTriggered"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isTriggered"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDAssistantExperimentDimensions dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDAssistantExperimentDimensions)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDAssistantExperimentDimensions *v5;
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
    self = -[ODDSiriSchemaODDAssistantExperimentDimensions initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDAssistantExperimentDimensions)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDAssistantExperimentDimensions *v5;
  void *v6;
  ODDSiriSchemaODDAssistantDimensions *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SISchemaUUID *v12;
  ODDSiriSchemaODDAssistantExperimentDimensions *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ODDSiriSchemaODDAssistantExperimentDimensions;
  v5 = -[ODDSiriSchemaODDAssistantExperimentDimensions init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantDimensions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODDSiriSchemaODDAssistantDimensions initWithDictionary:]([ODDSiriSchemaODDAssistantDimensions alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDAssistantExperimentDimensions setAssistantDimensions:](v5, "setAssistantDimensions:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("experimentAllocationStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantExperimentDimensions setExperimentAllocationStatus:](v5, "setExperimentAllocationStatus:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTriggered"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantExperimentDimensions setIsTriggered:](v5, "setIsTriggered:", objc_msgSend(v9, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFirstTriggerOrAfterFirstTrigger"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ODDSiriSchemaODDAssistantExperimentDimensions setIsFirstTriggerOrAfterFirstTrigger:](v5, "setIsFirstTriggerOrAfterFirstTrigger:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("codePathId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v11);
      -[ODDSiriSchemaODDAssistantExperimentDimensions setCodePathId:](v5, "setCodePathId:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (ODDSiriSchemaODDAssistantDimensions)assistantDimensions
{
  return self->_assistantDimensions;
}

- (void)setAssistantDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_assistantDimensions, a3);
}

- (int)experimentAllocationStatus
{
  return self->_experimentAllocationStatus;
}

- (BOOL)isTriggered
{
  return self->_isTriggered;
}

- (BOOL)isFirstTriggerOrAfterFirstTrigger
{
  return self->_isFirstTriggerOrAfterFirstTrigger;
}

- (SISchemaUUID)codePathId
{
  return self->_codePathId;
}

- (void)setCodePathId:(id)a3
{
  objc_storeStrong((id *)&self->_codePathId, a3);
}

- (void)setHasAssistantDimensions:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasCodePathId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codePathId, 0);
  objc_storeStrong((id *)&self->_assistantDimensions, 0);
}

@end
