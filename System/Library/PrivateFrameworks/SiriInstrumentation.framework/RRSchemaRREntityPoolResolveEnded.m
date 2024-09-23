@implementation RRSchemaRREntityPoolResolveEnded

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
  v9.super_class = (Class)RRSchemaRREntityPoolResolveEnded;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RRSchemaRREntityPoolResolveEnded queryResults](self, "queryResults", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RRSchemaRREntityPoolResolveEnded setQueryResults:](self, "setQueryResults:", v7);
  return v5;
}

- (void)clearQueryResults
{
  -[NSArray removeAllObjects](self->_queryResults, "removeAllObjects");
}

- (void)addQueryResults:(id)a3
{
  id v4;
  NSArray *queryResults;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  queryResults = self->_queryResults;
  v8 = v4;
  if (!queryResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_queryResults;
    self->_queryResults = v6;

    v4 = v8;
    queryResults = self->_queryResults;
  }
  -[NSArray addObject:](queryResults, "addObject:", v4);

}

- (unint64_t)queryResultsCount
{
  return -[NSArray count](self->_queryResults, "count");
}

- (id)queryResultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_queryResults, "objectAtIndexedSubscript:", a3);
}

- (void)setOutcome:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_outcome = a3;
}

- (BOOL)hasOutcome
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasOutcome:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteOutcome
{
  -[RRSchemaRREntityPoolResolveEnded setOutcome:](self, "setOutcome:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaRREntityPoolResolveEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_queryResults;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int outcome;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[RRSchemaRREntityPoolResolveEnded queryResults](self, "queryResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  -[RRSchemaRREntityPoolResolveEnded queryResults](self, "queryResults");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[RRSchemaRREntityPoolResolveEnded queryResults](self, "queryResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[20] & 1))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    outcome = self->_outcome;
    if (outcome != objc_msgSend(v4, "outcome"))
      goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSArray hash](self->_queryResults, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_outcome;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[RRSchemaRREntityPoolResolveEnded outcome](self, "outcome") - 1;
    if (v4 > 3)
      v5 = CFSTR("RRRESOLVEOUTCOME_UNKNOWN");
    else
      v5 = off_1E5633738[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("outcome"));
  }
  if (-[NSArray count](self->_queryResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_queryResults;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("queryResults"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v15);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RRSchemaRREntityPoolResolveEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (RRSchemaRREntityPoolResolveEnded)initWithJSON:(id)a3
{
  void *v4;
  RRSchemaRREntityPoolResolveEnded *v5;
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
    self = -[RRSchemaRREntityPoolResolveEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RRSchemaRREntityPoolResolveEnded)initWithDictionary:(id)a3
{
  id v4;
  RRSchemaRREntityPoolResolveEnded *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  RRSchemaRRAnnotatedEntity *v13;
  RRSchemaRRAnnotatedEntity *v14;
  void *v15;
  RRSchemaRREntityPoolResolveEnded *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RRSchemaRREntityPoolResolveEnded;
  v5 = -[RRSchemaRREntityPoolResolveEnded init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryResults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [RRSchemaRRAnnotatedEntity alloc];
              v14 = -[RRSchemaRRAnnotatedEntity initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v18);
              -[RRSchemaRREntityPoolResolveEnded addQueryResults:](v5, "addQueryResults:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outcome"), (_QWORD)v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RRSchemaRREntityPoolResolveEnded setOutcome:](v5, "setOutcome:", objc_msgSend(v15, "intValue"));
    v16 = v5;

  }
  return v5;
}

- (NSArray)queryResults
{
  return self->_queryResults;
}

- (void)setQueryResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)outcome
{
  return self->_outcome;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryResults, 0);
}

@end
