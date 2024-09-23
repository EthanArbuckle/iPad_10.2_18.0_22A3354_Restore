@implementation EXPSiriSchemaEXPServerExperimentTriggeredTier1

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
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EXPSiriSchemaEXPServerExperimentTriggeredTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 allocations](self, "allocations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 setAllocations:](self, "setAllocations:", v7);

  -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 codepathId](self, "codepathId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "suppressMessage");

  if (v10)
    -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 deleteCodepathId](self, "deleteCodepathId");
  -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 pegasusId](self, "pegasusId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySensitiveConditionsPolicy:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "suppressMessage");

  if (v13)
    -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 deletePegasusId](self, "deletePegasusId");

  return v5;
}

- (void)clearAllocation
{
  -[NSArray removeAllObjects](self->_allocations, "removeAllObjects");
}

- (void)addAllocation:(id)a3
{
  id v4;
  NSArray *allocations;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  allocations = self->_allocations;
  v8 = v4;
  if (!allocations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_allocations;
    self->_allocations = v6;

    v4 = v8;
    allocations = self->_allocations;
  }
  -[NSArray addObject:](allocations, "addObject:", v4);

}

- (unint64_t)allocationCount
{
  return -[NSArray count](self->_allocations, "count");
}

- (id)allocationAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_allocations, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasCodepathId
{
  return self->_codepathId != 0;
}

- (void)deleteCodepathId
{
  -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 setCodepathId:](self, "setCodepathId:", 0);
}

- (BOOL)hasPegasusId
{
  return self->_pegasusId != 0;
}

- (void)deletePegasusId
{
  -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 setPegasusId:](self, "setPegasusId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return EXPSiriSchemaEXPServerExperimentTriggeredTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_allocations;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 codepathId](self, "codepathId", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 codepathId](self, "codepathId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 pegasusId](self, "pegasusId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 pegasusId](self, "pegasusId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 allocations](self, "allocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allocations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 allocations](self, "allocations");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 allocations](self, "allocations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allocations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 codepathId](self, "codepathId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "codepathId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 codepathId](self, "codepathId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 codepathId](self, "codepathId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "codepathId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 pegasusId](self, "pegasusId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 pegasusId](self, "pegasusId");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 pegasusId](self, "pegasusId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSArray hash](self->_allocations, "hash");
  v4 = -[SISchemaUUID hash](self->_codepathId, "hash") ^ v3;
  return v4 ^ -[SISchemaUUID hash](self->_pegasusId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
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
  if (-[NSArray count](self->_allocations, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = self->_allocations;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("allocation"));
  }
  if (self->_codepathId)
  {
    -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 codepathId](self, "codepathId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("codepathId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("codepathId"));

    }
  }
  if (self->_pegasusId)
  {
    -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 pegasusId](self, "pegasusId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("pegasusId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("pegasusId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v19);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (EXPSiriSchemaEXPServerExperimentTriggeredTier1)initWithJSON:(id)a3
{
  void *v4;
  EXPSiriSchemaEXPServerExperimentTriggeredTier1 *v5;
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
    self = -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (EXPSiriSchemaEXPServerExperimentTriggeredTier1)initWithDictionary:(id)a3
{
  id v4;
  EXPSiriSchemaEXPServerExperimentTriggeredTier1 *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  EXPSchemaEXPTrialExperiment *v13;
  EXPSchemaEXPTrialExperiment *v14;
  void *v15;
  SISchemaUUID *v16;
  void *v17;
  SISchemaUUID *v18;
  EXPSiriSchemaEXPServerExperimentTriggeredTier1 *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)EXPSiriSchemaEXPServerExperimentTriggeredTier1;
  v5 = -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allocation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v22;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v22 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [EXPSchemaEXPTrialExperiment alloc];
              v14 = -[EXPSchemaEXPTrialExperiment initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v21);
              -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 addAllocation:](v5, "addAllocation:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("codepathId"), (_QWORD)v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v15);
      -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 setCodepathId:](v5, "setCodepathId:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v17);
      -[EXPSiriSchemaEXPServerExperimentTriggeredTier1 setPegasusId:](v5, "setPegasusId:", v18);

    }
    v19 = v5;

  }
  return v5;
}

- (NSArray)allocations
{
  return self->_allocations;
}

- (void)setAllocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SISchemaUUID)codepathId
{
  return self->_codepathId;
}

- (void)setCodepathId:(id)a3
{
  objc_storeStrong((id *)&self->_codepathId, a3);
}

- (SISchemaUUID)pegasusId
{
  return self->_pegasusId;
}

- (void)setPegasusId:(id)a3
{
  objc_storeStrong((id *)&self->_pegasusId, a3);
}

- (void)setHasCodepathId:(BOOL)a3
{
  self->_hasCodepathId = a3;
}

- (void)setHasPegasusId:(BOOL)a3
{
  self->_hasPegasusId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusId, 0);
  objc_storeStrong((id *)&self->_codepathId, 0);
  objc_storeStrong((id *)&self->_allocations, 0);
}

@end
