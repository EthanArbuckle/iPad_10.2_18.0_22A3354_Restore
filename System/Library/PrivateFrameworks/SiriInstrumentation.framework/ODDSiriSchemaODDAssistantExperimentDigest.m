@implementation ODDSiriSchemaODDAssistantExperimentDigest

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
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ODDSiriSchemaODDAssistantExperimentDigest;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v18, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 8))
    -[ODDSiriSchemaODDAssistantExperimentDigest deleteTurnIds](self, "deleteTurnIds");
  -[ODDSiriSchemaODDAssistantExperimentDigest dimensions](self, "dimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[ODDSiriSchemaODDAssistantExperimentDigest deleteDimensions](self, "deleteDimensions");
  -[ODDSiriSchemaODDAssistantExperimentDigest counts](self, "counts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[ODDSiriSchemaODDAssistantExperimentDigest deleteCounts](self, "deleteCounts");
  -[ODDSiriSchemaODDAssistantExperimentDigest tuples](self, "tuples");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[ODDSiriSchemaODDAssistantExperimentDigest deleteTuples](self, "deleteTuples");
  -[ODDSiriSchemaODDAssistantExperimentDigest turnIds](self, "turnIds");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v15, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDSiriSchemaODDAssistantExperimentDigest setTurnIds:](self, "setTurnIds:", v16);

  return v5;
}

- (BOOL)hasDimensions
{
  return self->_dimensions != 0;
}

- (void)deleteDimensions
{
  -[ODDSiriSchemaODDAssistantExperimentDigest setDimensions:](self, "setDimensions:", 0);
}

- (BOOL)hasCounts
{
  return self->_counts != 0;
}

- (void)deleteCounts
{
  -[ODDSiriSchemaODDAssistantExperimentDigest setCounts:](self, "setCounts:", 0);
}

- (BOOL)hasTuples
{
  return self->_tuples != 0;
}

- (void)deleteTuples
{
  -[ODDSiriSchemaODDAssistantExperimentDigest setTuples:](self, "setTuples:", 0);
}

- (void)clearTurnIds
{
  -[NSArray removeAllObjects](self->_turnIds, "removeAllObjects");
}

- (void)addTurnIds:(id)a3
{
  id v4;
  NSArray *turnIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  turnIds = self->_turnIds;
  v8 = v4;
  if (!turnIds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_turnIds;
    self->_turnIds = v6;

    v4 = v8;
    turnIds = self->_turnIds;
  }
  -[NSArray addObject:](turnIds, "addObject:", v4);

}

- (unint64_t)turnIdsCount
{
  return -[NSArray count](self->_turnIds, "count");
}

- (id)turnIdsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_turnIds, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssistantExperimentDigestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ODDSiriSchemaODDAssistantExperimentDigest dimensions](self, "dimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ODDSiriSchemaODDAssistantExperimentDigest dimensions](self, "dimensions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDAssistantExperimentDigest counts](self, "counts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ODDSiriSchemaODDAssistantExperimentDigest counts](self, "counts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[ODDSiriSchemaODDAssistantExperimentDigest tuples](self, "tuples");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ODDSiriSchemaODDAssistantExperimentDigest tuples](self, "tuples");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_turnIds;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
  -[ODDSiriSchemaODDAssistantExperimentDigest dimensions](self, "dimensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDAssistantExperimentDigest dimensions](self, "dimensions");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ODDSiriSchemaODDAssistantExperimentDigest dimensions](self, "dimensions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dimensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantExperimentDigest counts](self, "counts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "counts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDAssistantExperimentDigest counts](self, "counts");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[ODDSiriSchemaODDAssistantExperimentDigest counts](self, "counts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "counts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantExperimentDigest tuples](self, "tuples");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tuples");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[ODDSiriSchemaODDAssistantExperimentDigest tuples](self, "tuples");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[ODDSiriSchemaODDAssistantExperimentDigest tuples](self, "tuples");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tuples");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[ODDSiriSchemaODDAssistantExperimentDigest turnIds](self, "turnIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[ODDSiriSchemaODDAssistantExperimentDigest turnIds](self, "turnIds");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[ODDSiriSchemaODDAssistantExperimentDigest turnIds](self, "turnIds");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnIds");
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
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[ODDSiriSchemaODDAssistantExperimentDimensions hash](self->_dimensions, "hash");
  v4 = -[ODDSiriSchemaODDAssistantExperimentCounts hash](self->_counts, "hash") ^ v3;
  v5 = -[ODDSiriSchemaODDAssistantExperimentTuples hash](self->_tuples, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_turnIds, "hash");
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
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_counts)
  {
    -[ODDSiriSchemaODDAssistantExperimentDigest counts](self, "counts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("counts"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("counts"));

    }
  }
  if (self->_dimensions)
  {
    -[ODDSiriSchemaODDAssistantExperimentDigest dimensions](self, "dimensions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("dimensions"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dimensions"));

    }
  }
  if (self->_tuples)
  {
    -[ODDSiriSchemaODDAssistantExperimentDigest tuples](self, "tuples");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("tuples"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("tuples"));

    }
  }
  if (-[NSArray count](self->_turnIds, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = self->_turnIds;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v13, "addObject:", v19);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v20);

          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("turnIds"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v22);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODDSiriSchemaODDAssistantExperimentDigest dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ODDSiriSchemaODDAssistantExperimentDigest)initWithJSON:(id)a3
{
  void *v4;
  ODDSiriSchemaODDAssistantExperimentDigest *v5;
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
    self = -[ODDSiriSchemaODDAssistantExperimentDigest initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODDSiriSchemaODDAssistantExperimentDigest)initWithDictionary:(id)a3
{
  id v4;
  ODDSiriSchemaODDAssistantExperimentDigest *v5;
  void *v6;
  ODDSiriSchemaODDAssistantExperimentDimensions *v7;
  void *v8;
  ODDSiriSchemaODDAssistantExperimentCounts *v9;
  void *v10;
  ODDSiriSchemaODDAssistantExperimentTuples *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  SISchemaUUID *v19;
  ODDSiriSchemaODDAssistantExperimentDigest *v20;
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
  v28.super_class = (Class)ODDSiriSchemaODDAssistantExperimentDigest;
  v5 = -[ODDSiriSchemaODDAssistantExperimentDigest init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dimensions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[ODDSiriSchemaODDAssistantExperimentDimensions initWithDictionary:]([ODDSiriSchemaODDAssistantExperimentDimensions alloc], "initWithDictionary:", v6);
      -[ODDSiriSchemaODDAssistantExperimentDigest setDimensions:](v5, "setDimensions:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("counts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[ODDSiriSchemaODDAssistantExperimentCounts initWithDictionary:]([ODDSiriSchemaODDAssistantExperimentCounts alloc], "initWithDictionary:", v8);
      -[ODDSiriSchemaODDAssistantExperimentDigest setCounts:](v5, "setCounts:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tuples"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[ODDSiriSchemaODDAssistantExperimentTuples initWithDictionary:]([ODDSiriSchemaODDAssistantExperimentTuples alloc], "initWithDictionary:", v10);
      -[ODDSiriSchemaODDAssistantExperimentDigest setTuples:](v5, "setTuples:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("turnIds"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v10;
      v23 = v6;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v18);
              -[ODDSiriSchemaODDAssistantExperimentDigest addTurnIds:](v5, "addTurnIds:", v19);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v15);
      }

      v6 = v23;
      v10 = v22;
    }
    v20 = v5;

  }
  return v5;
}

- (ODDSiriSchemaODDAssistantExperimentDimensions)dimensions
{
  return self->_dimensions;
}

- (void)setDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_dimensions, a3);
}

- (ODDSiriSchemaODDAssistantExperimentCounts)counts
{
  return self->_counts;
}

- (void)setCounts:(id)a3
{
  objc_storeStrong((id *)&self->_counts, a3);
}

- (ODDSiriSchemaODDAssistantExperimentTuples)tuples
{
  return self->_tuples;
}

- (void)setTuples:(id)a3
{
  objc_storeStrong((id *)&self->_tuples, a3);
}

- (NSArray)turnIds
{
  return self->_turnIds;
}

- (void)setTurnIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasDimensions:(BOOL)a3
{
  self->_hasDimensions = a3;
}

- (void)setHasCounts:(BOOL)a3
{
  self->_hasCounts = a3;
}

- (void)setHasTuples:(BOOL)a3
{
  self->_hasTuples = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnIds, 0);
  objc_storeStrong((id *)&self->_tuples, 0);
  objc_storeStrong((id *)&self->_counts, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
}

@end
