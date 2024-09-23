@implementation PLUSSchemaPLUSMediaSuggestionEvaluation

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

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSMediaSuggestionEvaluation;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deletePommesAlternativeEntityIds](self, "deletePommesAlternativeEntityIds");
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deletePommesSelectedMediaEntityAdamId](self, "deletePommesSelectedMediaEntityAdamId");
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deleteInferredMediaEntityAdamId](self, "deleteInferredMediaEntityAdamId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deletePommesAlternativeEntityIds](self, "deletePommesAlternativeEntityIds");
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deletePommesSelectedMediaEntityAdamId](self, "deletePommesSelectedMediaEntityAdamId");
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deleteInferredMediaEntityAdamId](self, "deleteInferredMediaEntityAdamId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deletePommesAlternativeEntityIds](self, "deletePommesAlternativeEntityIds");
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deletePommesSelectedMediaEntityAdamId](self, "deletePommesSelectedMediaEntityAdamId");
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deleteInferredMediaEntityAdamId](self, "deleteInferredMediaEntityAdamId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deletePommesAlternativeEntityIds](self, "deletePommesAlternativeEntityIds");
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deletePommesSelectedMediaEntityAdamId](self, "deletePommesSelectedMediaEntityAdamId");
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deleteInferredMediaEntityAdamId](self, "deleteInferredMediaEntityAdamId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deletePommesAlternativeEntityIds](self, "deletePommesAlternativeEntityIds");
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deletePommesSelectedMediaEntityAdamId](self, "deletePommesSelectedMediaEntityAdamId");
    -[PLUSSchemaPLUSMediaSuggestionEvaluation deleteInferredMediaEntityAdamId](self, "deleteInferredMediaEntityAdamId");
  }
  -[PLUSSchemaPLUSMediaSuggestionEvaluation entitySummaries](self, "entitySummaries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUSSchemaPLUSMediaSuggestionEvaluation setEntitySummaries:](self, "setEntitySummaries:", v7);

  return v5;
}

- (void)clearEntitySummaries
{
  -[NSArray removeAllObjects](self->_entitySummaries, "removeAllObjects");
}

- (void)addEntitySummaries:(id)a3
{
  id v4;
  NSArray *entitySummaries;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  entitySummaries = self->_entitySummaries;
  v8 = v4;
  if (!entitySummaries)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_entitySummaries;
    self->_entitySummaries = v6;

    v4 = v8;
    entitySummaries = self->_entitySummaries;
  }
  -[NSArray addObject:](entitySummaries, "addObject:", v4);

}

- (unint64_t)entitySummariesCount
{
  return -[NSArray count](self->_entitySummaries, "count");
}

- (id)entitySummariesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_entitySummaries, "objectAtIndexedSubscript:", a3);
}

- (void)clearPommesAlternativeEntityIds
{
  -[NSArray removeAllObjects](self->_pommesAlternativeEntityIds, "removeAllObjects");
}

- (void)addPommesAlternativeEntityIds:(id)a3
{
  id v4;
  NSArray *pommesAlternativeEntityIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  pommesAlternativeEntityIds = self->_pommesAlternativeEntityIds;
  v8 = v4;
  if (!pommesAlternativeEntityIds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pommesAlternativeEntityIds;
    self->_pommesAlternativeEntityIds = v6;

    v4 = v8;
    pommesAlternativeEntityIds = self->_pommesAlternativeEntityIds;
  }
  -[NSArray addObject:](pommesAlternativeEntityIds, "addObject:", v4);

}

- (unint64_t)pommesAlternativeEntityIdsCount
{
  return -[NSArray count](self->_pommesAlternativeEntityIds, "count");
}

- (id)pommesAlternativeEntityIdsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_pommesAlternativeEntityIds, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasPommesSelectedMediaEntityAdamId
{
  return self->_pommesSelectedMediaEntityAdamId != 0;
}

- (void)deletePommesSelectedMediaEntityAdamId
{
  -[PLUSSchemaPLUSMediaSuggestionEvaluation setPommesSelectedMediaEntityAdamId:](self, "setPommesSelectedMediaEntityAdamId:", 0);
}

- (BOOL)hasInferredMediaEntityAdamId
{
  return self->_inferredMediaEntityAdamId != 0;
}

- (void)deleteInferredMediaEntityAdamId
{
  -[PLUSSchemaPLUSMediaSuggestionEvaluation setInferredMediaEntityAdamId:](self, "setInferredMediaEntityAdamId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSMediaSuggestionEvaluationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_entitySummaries;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_pommesAlternativeEntityIds;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  -[PLUSSchemaPLUSMediaSuggestionEvaluation pommesSelectedMediaEntityAdamId](self, "pommesSelectedMediaEntityAdamId", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteStringField();
  -[PLUSSchemaPLUSMediaSuggestionEvaluation inferredMediaEntityAdamId](self, "inferredMediaEntityAdamId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    PBDataWriterWriteStringField();

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
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[PLUSSchemaPLUSMediaSuggestionEvaluation entitySummaries](self, "entitySummaries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitySummaries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PLUSSchemaPLUSMediaSuggestionEvaluation entitySummaries](self, "entitySummaries");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLUSSchemaPLUSMediaSuggestionEvaluation entitySummaries](self, "entitySummaries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitySummaries");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[PLUSSchemaPLUSMediaSuggestionEvaluation pommesAlternativeEntityIds](self, "pommesAlternativeEntityIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pommesAlternativeEntityIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PLUSSchemaPLUSMediaSuggestionEvaluation pommesAlternativeEntityIds](self, "pommesAlternativeEntityIds");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PLUSSchemaPLUSMediaSuggestionEvaluation pommesAlternativeEntityIds](self, "pommesAlternativeEntityIds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pommesAlternativeEntityIds");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[PLUSSchemaPLUSMediaSuggestionEvaluation pommesSelectedMediaEntityAdamId](self, "pommesSelectedMediaEntityAdamId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pommesSelectedMediaEntityAdamId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PLUSSchemaPLUSMediaSuggestionEvaluation pommesSelectedMediaEntityAdamId](self, "pommesSelectedMediaEntityAdamId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PLUSSchemaPLUSMediaSuggestionEvaluation pommesSelectedMediaEntityAdamId](self, "pommesSelectedMediaEntityAdamId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pommesSelectedMediaEntityAdamId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[PLUSSchemaPLUSMediaSuggestionEvaluation inferredMediaEntityAdamId](self, "inferredMediaEntityAdamId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inferredMediaEntityAdamId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PLUSSchemaPLUSMediaSuggestionEvaluation inferredMediaEntityAdamId](self, "inferredMediaEntityAdamId");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[PLUSSchemaPLUSMediaSuggestionEvaluation inferredMediaEntityAdamId](self, "inferredMediaEntityAdamId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inferredMediaEntityAdamId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;

  v3 = -[NSArray hash](self->_entitySummaries, "hash");
  v4 = -[NSArray hash](self->_pommesAlternativeEntityIds, "hash") ^ v3;
  v5 = -[NSString hash](self->_pommesSelectedMediaEntityAdamId, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_inferredMediaEntityAdamId, "hash");
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
  if (-[NSArray count](self->_entitySummaries, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = self->_entitySummaries;
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

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("entitySummaries"));
  }
  if (self->_inferredMediaEntityAdamId)
  {
    -[PLUSSchemaPLUSMediaSuggestionEvaluation inferredMediaEntityAdamId](self, "inferredMediaEntityAdamId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("inferredMediaEntityAdamId"));

  }
  if (self->_pommesAlternativeEntityIds)
  {
    -[PLUSSchemaPLUSMediaSuggestionEvaluation pommesAlternativeEntityIds](self, "pommesAlternativeEntityIds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("pommesAlternativeEntityIds"));

  }
  if (self->_pommesSelectedMediaEntityAdamId)
  {
    -[PLUSSchemaPLUSMediaSuggestionEvaluation pommesSelectedMediaEntityAdamId](self, "pommesSelectedMediaEntityAdamId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("pommesSelectedMediaEntityAdamId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v19);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLUSSchemaPLUSMediaSuggestionEvaluation dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLUSSchemaPLUSMediaSuggestionEvaluation)initWithJSON:(id)a3
{
  void *v4;
  PLUSSchemaPLUSMediaSuggestionEvaluation *v5;
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
    self = -[PLUSSchemaPLUSMediaSuggestionEvaluation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLUSSchemaPLUSMediaSuggestionEvaluation)initWithDictionary:(id)a3
{
  id v4;
  PLUSSchemaPLUSMediaSuggestionEvaluation *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PLUSSchemaPLUSMediaCandidateEntity *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PLUSSchemaPLUSMediaSuggestionEvaluation *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PLUSSchemaPLUSMediaSuggestionEvaluation;
  v5 = -[PLUSSchemaPLUSMediaSuggestionEvaluation init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entitySummaries"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v33;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v33 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[PLUSSchemaPLUSMediaCandidateEntity initWithDictionary:]([PLUSSchemaPLUSMediaCandidateEntity alloc], "initWithDictionary:", v12);
              -[PLUSSchemaPLUSMediaSuggestionEvaluation addEntitySummaries:](v5, "addEntitySummaries:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pommesAlternativeEntityIds"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v29;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v19);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = (void *)objc_msgSend(v20, "copy", (_QWORD)v28);
              -[PLUSSchemaPLUSMediaSuggestionEvaluation addPommesAlternativeEntityIds:](v5, "addPommesAlternativeEntityIds:", v21);

            }
            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        }
        while (v17);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pommesSelectedMediaEntityAdamId"), (_QWORD)v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (void *)objc_msgSend(v22, "copy");
      -[PLUSSchemaPLUSMediaSuggestionEvaluation setPommesSelectedMediaEntityAdamId:](v5, "setPommesSelectedMediaEntityAdamId:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inferredMediaEntityAdamId"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(v24, "copy");
      -[PLUSSchemaPLUSMediaSuggestionEvaluation setInferredMediaEntityAdamId:](v5, "setInferredMediaEntityAdamId:", v25);

    }
    v26 = v5;

  }
  return v5;
}

- (NSArray)entitySummaries
{
  return self->_entitySummaries;
}

- (void)setEntitySummaries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)pommesAlternativeEntityIds
{
  return self->_pommesAlternativeEntityIds;
}

- (void)setPommesAlternativeEntityIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)pommesSelectedMediaEntityAdamId
{
  return self->_pommesSelectedMediaEntityAdamId;
}

- (void)setPommesSelectedMediaEntityAdamId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)inferredMediaEntityAdamId
{
  return self->_inferredMediaEntityAdamId;
}

- (void)setInferredMediaEntityAdamId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasPommesSelectedMediaEntityAdamId:(BOOL)a3
{
  self->_hasPommesSelectedMediaEntityAdamId = a3;
}

- (void)setHasInferredMediaEntityAdamId:(BOOL)a3
{
  self->_hasInferredMediaEntityAdamId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferredMediaEntityAdamId, 0);
  objc_storeStrong((id *)&self->_pommesSelectedMediaEntityAdamId, 0);
  objc_storeStrong((id *)&self->_pommesAlternativeEntityIds, 0);
  objc_storeStrong((id *)&self->_entitySummaries, 0);
}

@end
