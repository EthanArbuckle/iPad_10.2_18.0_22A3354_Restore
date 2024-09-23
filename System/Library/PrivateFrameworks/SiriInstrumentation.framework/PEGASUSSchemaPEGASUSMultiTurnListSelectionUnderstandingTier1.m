@implementation PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1

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
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 deleteFollowupQuery](self, "deleteFollowupQuery");
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 deleteResults](self, "deleteResults");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 deleteFollowupQuery](self, "deleteFollowupQuery");
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 deleteResults](self, "deleteResults");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 deleteFollowupQuery](self, "deleteFollowupQuery");
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 deleteResults](self, "deleteResults");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 deleteFollowupQuery](self, "deleteFollowupQuery");
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 deleteResults](self, "deleteResults");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 deleteFollowupQuery](self, "deleteFollowupQuery");
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 deleteResults](self, "deleteResults");
  }

  return v5;
}

- (BOOL)hasFollowupQuery
{
  return self->_followupQuery != 0;
}

- (void)deleteFollowupQuery
{
  -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 setFollowupQuery:](self, "setFollowupQuery:", 0);
}

- (void)clearResults
{
  -[NSArray removeAllObjects](self->_results, "removeAllObjects");
}

- (void)addResults:(id)a3
{
  id v4;
  NSArray *results;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  results = self->_results;
  v8 = v4;
  if (!results)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_results;
    self->_results = v6;

    v4 = v8;
    results = self->_results;
  }
  -[NSArray addObject:](results, "addObject:", v4);

}

- (unint64_t)resultsCount
{
  return -[NSArray count](self->_results, "count");
}

- (id)resultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_results, "objectAtIndexedSubscript:", a3);
}

- (void)clearRecommendations
{
  -[NSArray removeAllObjects](self->_recommendations, "removeAllObjects");
}

- (void)addRecommendations:(int)a3
{
  uint64_t v3;
  NSArray *recommendations;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  recommendations = self->_recommendations;
  if (!recommendations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_recommendations;
    self->_recommendations = v6;

    recommendations = self->_recommendations;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](recommendations, "addObject:", v8);

}

- (unint64_t)recommendationsCount
{
  return -[NSArray count](self->_recommendations, "count");
}

- (int)recommendationsAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_recommendations, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 followupQuery](self, "followupQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_results;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_recommendations;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15), "intValue", (_QWORD)v16);
        PBDataWriterWriteInt32Field();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
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
  -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 followupQuery](self, "followupQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "followupQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 followupQuery](self, "followupQuery");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 followupQuery](self, "followupQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "followupQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 results](self, "results");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 results](self, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 recommendations](self, "recommendations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recommendations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 recommendations](self, "recommendations");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 recommendations](self, "recommendations");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recommendations");
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
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_followupQuery, "hash");
  v4 = -[NSArray hash](self->_results, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_recommendations, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_followupQuery)
  {
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 followupQuery](self, "followupQuery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("followupQuery"));

  }
  if (-[NSArray count](self->_recommendations, "count"))
  {
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 recommendations](self, "recommendations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("recommendations"));

  }
  if (self->_results)
  {
    -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 results](self, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("results"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1;
  v5 = -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followupQuery"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 setFollowupQuery:](v5, "setFollowupQuery:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("results"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v31;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v31 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = (void *)objc_msgSend(v14, "copy");
              -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 addResults:](v5, "addResults:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        }
        while (v11);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recommendations"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v6;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v27;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v27 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v21);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[PEGASUSSchemaPEGASUSMultiTurnListSelectionUnderstandingTier1 addRecommendations:](v5, "addRecommendations:", objc_msgSend(v22, "intValue"));
            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        }
        while (v19);
      }

      v6 = v25;
    }
    v23 = v5;

  }
  return v5;
}

- (NSString)followupQuery
{
  return self->_followupQuery;
}

- (void)setFollowupQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)recommendations
{
  return self->_recommendations;
}

- (void)setRecommendations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasFollowupQuery:(BOOL)a3
{
  self->_hasFollowupQuery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendations, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_followupQuery, 0);
}

@end
