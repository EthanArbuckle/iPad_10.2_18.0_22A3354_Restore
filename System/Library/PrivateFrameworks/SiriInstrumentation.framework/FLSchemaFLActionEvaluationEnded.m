@implementation FLSchemaFLActionEvaluationEnded

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
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FLSchemaFLActionEvaluationEnded;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLSchemaFLActionEvaluationEnded ifSessionId](self, "ifSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLSchemaFLActionEvaluationEnded deleteIfSessionId](self, "deleteIfSessionId");
  -[FLSchemaFLActionEvaluationEnded taskEvaluation](self, "taskEvaluation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[FLSchemaFLActionEvaluationEnded deleteTaskEvaluation](self, "deleteTaskEvaluation");
  -[FLSchemaFLActionEvaluationEnded candidateEvaluations](self, "candidateEvaluations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLSchemaFLActionEvaluationEnded setCandidateEvaluations:](self, "setCandidateEvaluations:", v13);

  return v5;
}

- (BOOL)hasIfSessionId
{
  return self->_ifSessionId != 0;
}

- (void)deleteIfSessionId
{
  -[FLSchemaFLActionEvaluationEnded setIfSessionId:](self, "setIfSessionId:", 0);
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
  -[FLSchemaFLActionEvaluationEnded setActionStatementId:](self, "setActionStatementId:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasTaskEvaluation
{
  return self->_taskEvaluation != 0;
}

- (void)deleteTaskEvaluation
{
  -[FLSchemaFLActionEvaluationEnded setTaskEvaluation:](self, "setTaskEvaluation:", 0);
}

- (void)clearCandidateEvaluations
{
  -[NSArray removeAllObjects](self->_candidateEvaluations, "removeAllObjects");
}

- (void)addCandidateEvaluations:(id)a3
{
  id v4;
  NSArray *candidateEvaluations;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  candidateEvaluations = self->_candidateEvaluations;
  v8 = v4;
  if (!candidateEvaluations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_candidateEvaluations;
    self->_candidateEvaluations = v6;

    v4 = v8;
    candidateEvaluations = self->_candidateEvaluations;
  }
  -[NSArray addObject:](candidateEvaluations, "addObject:", v4);

}

- (unint64_t)candidateEvaluationsCount
{
  return -[NSArray count](self->_candidateEvaluations, "count");
}

- (id)candidateEvaluationsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_candidateEvaluations, "objectAtIndexedSubscript:", a3);
}

- (void)setEvaluationType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_evaluationType = a3;
}

- (BOOL)hasEvaluationType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEvaluationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteEvaluationType
{
  -[FLSchemaFLActionEvaluationEnded setEvaluationType:](self, "setEvaluationType:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLActionEvaluationEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FLSchemaFLActionEvaluationEnded ifSessionId](self, "ifSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FLSchemaFLActionEvaluationEnded ifSessionId](self, "ifSessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[FLSchemaFLActionEvaluationEnded taskEvaluation](self, "taskEvaluation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FLSchemaFLActionEvaluationEnded taskEvaluation](self, "taskEvaluation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_candidateEvaluations;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();

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
  unsigned int actionStatementId;
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
  BOOL v23;
  int v25;
  int evaluationType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[FLSchemaFLActionEvaluationEnded ifSessionId](self, "ifSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ifSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[FLSchemaFLActionEvaluationEnded ifSessionId](self, "ifSessionId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLSchemaFLActionEvaluationEnded ifSessionId](self, "ifSessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ifSessionId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[44] & 1))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    actionStatementId = self->_actionStatementId;
    if (actionStatementId != objc_msgSend(v4, "actionStatementId"))
      goto LABEL_20;
  }
  -[FLSchemaFLActionEvaluationEnded taskEvaluation](self, "taskEvaluation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskEvaluation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[FLSchemaFLActionEvaluationEnded taskEvaluation](self, "taskEvaluation");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[FLSchemaFLActionEvaluationEnded taskEvaluation](self, "taskEvaluation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskEvaluation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_20;
  }
  else
  {

  }
  -[FLSchemaFLActionEvaluationEnded candidateEvaluations](self, "candidateEvaluations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateEvaluations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  -[FLSchemaFLActionEvaluationEnded candidateEvaluations](self, "candidateEvaluations");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[FLSchemaFLActionEvaluationEnded candidateEvaluations](self, "candidateEvaluations");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidateEvaluations");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_20;
  }
  else
  {

  }
  v25 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v25 == ((v4[44] >> 1) & 1))
  {
    if (!v25
      || (evaluationType = self->_evaluationType, evaluationType == objc_msgSend(v4, "evaluationType")))
    {
      v23 = 1;
      goto LABEL_21;
    }
  }
LABEL_20:
  v23 = 0;
LABEL_21:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_ifSessionId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_actionStatementId;
  else
    v4 = 0;
  v5 = -[FLSchemaFLTaskEvaluation hash](self->_taskEvaluation, "hash");
  v6 = -[NSArray hash](self->_candidateEvaluations, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_evaluationType;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[FLSchemaFLActionEvaluationEnded actionStatementId](self, "actionStatementId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("actionStatementId"));

  }
  if (-[NSArray count](self->_candidateEvaluations, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = self->_candidateEvaluations;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v5, "addObject:", v11);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);

          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("candidateEvaluations"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v13 = -[FLSchemaFLActionEvaluationEnded evaluationType](self, "evaluationType");
    v14 = CFSTR("FLEVALUATIONTYPE_UNKNOWN");
    if (v13 == 1)
      v14 = CFSTR("FLEVALUATIONTYPE_FAST_EVALUATOR");
    if (v13 == 2)
      v15 = CFSTR("FLEVALUATIONTYPE_FULL_EVALUATOR");
    else
      v15 = v14;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("evaluationType"));
  }
  if (self->_ifSessionId)
  {
    -[FLSchemaFLActionEvaluationEnded ifSessionId](self, "ifSessionId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("ifSessionId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("ifSessionId"));

    }
  }
  if (self->_taskEvaluation)
  {
    -[FLSchemaFLActionEvaluationEnded taskEvaluation](self, "taskEvaluation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("taskEvaluation"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("taskEvaluation"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLSchemaFLActionEvaluationEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLSchemaFLActionEvaluationEnded)initWithJSON:(id)a3
{
  void *v4;
  FLSchemaFLActionEvaluationEnded *v5;
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
    self = -[FLSchemaFLActionEvaluationEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLSchemaFLActionEvaluationEnded)initWithDictionary:(id)a3
{
  id v4;
  FLSchemaFLActionEvaluationEnded *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  FLSchemaFLTaskEvaluation *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  FLSchemaFLCandidateEvaluation *v18;
  void *v19;
  FLSchemaFLActionEvaluationEnded *v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)FLSchemaFLActionEvaluationEnded;
  v5 = -[FLSchemaFLActionEvaluationEnded init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ifSessionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[FLSchemaFLActionEvaluationEnded setIfSessionId:](v5, "setIfSessionId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionStatementId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLSchemaFLActionEvaluationEnded setActionStatementId:](v5, "setActionStatementId:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskEvaluation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[FLSchemaFLTaskEvaluation initWithDictionary:]([FLSchemaFLTaskEvaluation alloc], "initWithDictionary:", v9);
      -[FLSchemaFLActionEvaluationEnded setTaskEvaluation:](v5, "setTaskEvaluation:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("candidateEvaluations"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v9;
      v23 = v6;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = -[FLSchemaFLCandidateEvaluation initWithDictionary:]([FLSchemaFLCandidateEvaluation alloc], "initWithDictionary:", v17);
              -[FLSchemaFLActionEvaluationEnded addCandidateEvaluations:](v5, "addCandidateEvaluations:", v18);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v14);
      }

      v6 = v23;
      v9 = v22;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evaluationType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLSchemaFLActionEvaluationEnded setEvaluationType:](v5, "setEvaluationType:", objc_msgSend(v19, "intValue"));
    v20 = v5;

  }
  return v5;
}

- (SISchemaUUID)ifSessionId
{
  return self->_ifSessionId;
}

- (void)setIfSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_ifSessionId, a3);
}

- (unsigned)actionStatementId
{
  return self->_actionStatementId;
}

- (FLSchemaFLTaskEvaluation)taskEvaluation
{
  return self->_taskEvaluation;
}

- (void)setTaskEvaluation:(id)a3
{
  objc_storeStrong((id *)&self->_taskEvaluation, a3);
}

- (NSArray)candidateEvaluations
{
  return self->_candidateEvaluations;
}

- (void)setCandidateEvaluations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)evaluationType
{
  return self->_evaluationType;
}

- (void)setHasIfSessionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasTaskEvaluation:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateEvaluations, 0);
  objc_storeStrong((id *)&self->_taskEvaluation, 0);
  objc_storeStrong((id *)&self->_ifSessionId, 0);
}

@end
