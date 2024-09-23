@implementation FLSchemaFLTaskEvaluation

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
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLSchemaFLTaskEvaluation;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v12, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLSchemaFLTaskEvaluation taskOutcome](self, "taskOutcome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[FLSchemaFLTaskEvaluation deleteTaskOutcome](self, "deleteTaskOutcome");
  -[FLSchemaFLTaskEvaluation evaluationNodes](self, "evaluationNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLSchemaFLTaskEvaluation setEvaluationNodes:](self, "setEvaluationNodes:", v10);

  return v5;
}

- (void)setActionResolutionState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_actionResolutionState = a3;
}

- (BOOL)hasActionResolutionState
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasActionResolutionState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteActionResolutionState
{
  -[FLSchemaFLTaskEvaluation setActionResolutionState:](self, "setActionResolutionState:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasTaskOutcome
{
  return self->_taskOutcome != 0;
}

- (void)deleteTaskOutcome
{
  -[FLSchemaFLTaskEvaluation setTaskOutcome:](self, "setTaskOutcome:", 0);
}

- (void)clearEvaluationNodes
{
  -[NSArray removeAllObjects](self->_evaluationNodes, "removeAllObjects");
}

- (void)addEvaluationNodes:(id)a3
{
  id v4;
  NSArray *evaluationNodes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  evaluationNodes = self->_evaluationNodes;
  v8 = v4;
  if (!evaluationNodes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_evaluationNodes;
    self->_evaluationNodes = v6;

    v4 = v8;
    evaluationNodes = self->_evaluationNodes;
  }
  -[NSArray addObject:](evaluationNodes, "addObject:", v4);

}

- (unint64_t)evaluationNodesCount
{
  return -[NSArray count](self->_evaluationNodes, "count");
}

- (id)evaluationNodesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_evaluationNodes, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLTaskEvaluationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[FLSchemaFLTaskEvaluation taskOutcome](self, "taskOutcome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FLSchemaFLTaskEvaluation taskOutcome](self, "taskOutcome");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_evaluationNodes;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int actionResolutionState;
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
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    actionResolutionState = self->_actionResolutionState;
    if (actionResolutionState != objc_msgSend(v4, "actionResolutionState"))
      goto LABEL_15;
  }
  -[FLSchemaFLTaskEvaluation taskOutcome](self, "taskOutcome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskOutcome");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[FLSchemaFLTaskEvaluation taskOutcome](self, "taskOutcome");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[FLSchemaFLTaskEvaluation taskOutcome](self, "taskOutcome");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskOutcome");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[FLSchemaFLTaskEvaluation evaluationNodes](self, "evaluationNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "evaluationNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[FLSchemaFLTaskEvaluation evaluationNodes](self, "evaluationNodes");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[FLSchemaFLTaskEvaluation evaluationNodes](self, "evaluationNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "evaluationNodes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_actionResolutionState;
  else
    v3 = 0;
  v4 = -[FLSchemaFLTaskOutcome hash](self->_taskOutcome, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_evaluationNodes, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[FLSchemaFLTaskEvaluation actionResolutionState](self, "actionResolutionState");
    v5 = CFSTR("FLACTIONRESOLUTIONSTATE_UNKNOWN");
    if (v4 == 1)
      v5 = CFSTR("FLACTIONRESOLUTIONSTATE_INCOMPLETE");
    if (v4 == 2)
      v6 = CFSTR("FLACTIONRESOLUTIONSTATE_COMPLETE");
    else
      v6 = v5;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionResolutionState"));
  }
  if (-[NSArray count](self->_evaluationNodes, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = self->_evaluationNodes;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v7, "addObject:", v13);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v14);

          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("evaluationNodes"));
  }
  if (self->_taskOutcome)
  {
    -[FLSchemaFLTaskEvaluation taskOutcome](self, "taskOutcome");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("taskOutcome"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("taskOutcome"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v19);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLSchemaFLTaskEvaluation dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLSchemaFLTaskEvaluation)initWithJSON:(id)a3
{
  void *v4;
  FLSchemaFLTaskEvaluation *v5;
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
    self = -[FLSchemaFLTaskEvaluation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLSchemaFLTaskEvaluation)initWithDictionary:(id)a3
{
  id v4;
  FLSchemaFLTaskEvaluation *v5;
  void *v6;
  void *v7;
  FLSchemaFLTaskOutcome *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  FLSchemaFLTaskEvaluationNode *v16;
  FLSchemaFLTaskEvaluation *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)FLSchemaFLTaskEvaluation;
  v5 = -[FLSchemaFLTaskEvaluation init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionResolutionState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[FLSchemaFLTaskEvaluation setActionResolutionState:](v5, "setActionResolutionState:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("taskOutcome"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[FLSchemaFLTaskOutcome initWithDictionary:]([FLSchemaFLTaskOutcome alloc], "initWithDictionary:", v7);
      -[FLSchemaFLTaskEvaluation setTaskOutcome:](v5, "setTaskOutcome:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evaluationNodes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v7;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[FLSchemaFLTaskEvaluationNode initWithDictionary:]([FLSchemaFLTaskEvaluationNode alloc], "initWithDictionary:", v15);
              -[FLSchemaFLTaskEvaluation addEvaluationNodes:](v5, "addEvaluationNodes:", v16);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v12);
      }

      v7 = v19;
    }
    v17 = v5;

  }
  return v5;
}

- (int)actionResolutionState
{
  return self->_actionResolutionState;
}

- (FLSchemaFLTaskOutcome)taskOutcome
{
  return self->_taskOutcome;
}

- (void)setTaskOutcome:(id)a3
{
  objc_storeStrong((id *)&self->_taskOutcome, a3);
}

- (NSArray)evaluationNodes
{
  return self->_evaluationNodes;
}

- (void)setEvaluationNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasTaskOutcome:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluationNodes, 0);
  objc_storeStrong((id *)&self->_taskOutcome, 0);
}

@end
