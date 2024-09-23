@implementation QDSchemaQDEntitiesRanked

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
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)QDSchemaQDEntitiesRanked;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QDSchemaQDEntitiesRanked retrievedTools](self, "retrievedTools", v13.receiver, v13.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[QDSchemaQDEntitiesRanked setRetrievedTools:](self, "setRetrievedTools:", v7);

  -[QDSchemaQDEntitiesRanked spanMatchedEntities](self, "spanMatchedEntities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[QDSchemaQDEntitiesRanked setSpanMatchedEntities:](self, "setSpanMatchedEntities:", v9);

  -[QDSchemaQDEntitiesRanked utteranceContexts](self, "utteranceContexts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[QDSchemaQDEntitiesRanked setUtteranceContexts:](self, "setUtteranceContexts:", v11);
  return v5;
}

- (void)clearRetrievedTools
{
  -[NSArray removeAllObjects](self->_retrievedTools, "removeAllObjects");
}

- (void)addRetrievedTools:(id)a3
{
  id v4;
  NSArray *retrievedTools;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  retrievedTools = self->_retrievedTools;
  v8 = v4;
  if (!retrievedTools)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_retrievedTools;
    self->_retrievedTools = v6;

    v4 = v8;
    retrievedTools = self->_retrievedTools;
  }
  -[NSArray addObject:](retrievedTools, "addObject:", v4);

}

- (unint64_t)retrievedToolsCount
{
  return -[NSArray count](self->_retrievedTools, "count");
}

- (id)retrievedToolsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_retrievedTools, "objectAtIndexedSubscript:", a3);
}

- (void)clearSpanMatchedEntities
{
  -[NSArray removeAllObjects](self->_spanMatchedEntities, "removeAllObjects");
}

- (void)addSpanMatchedEntities:(id)a3
{
  id v4;
  NSArray *spanMatchedEntities;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  spanMatchedEntities = self->_spanMatchedEntities;
  v8 = v4;
  if (!spanMatchedEntities)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_spanMatchedEntities;
    self->_spanMatchedEntities = v6;

    v4 = v8;
    spanMatchedEntities = self->_spanMatchedEntities;
  }
  -[NSArray addObject:](spanMatchedEntities, "addObject:", v4);

}

- (unint64_t)spanMatchedEntitiesCount
{
  return -[NSArray count](self->_spanMatchedEntities, "count");
}

- (id)spanMatchedEntitiesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_spanMatchedEntities, "objectAtIndexedSubscript:", a3);
}

- (void)clearUtteranceContext
{
  -[NSArray removeAllObjects](self->_utteranceContexts, "removeAllObjects");
}

- (void)addUtteranceContext:(id)a3
{
  id v4;
  NSArray *utteranceContexts;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  utteranceContexts = self->_utteranceContexts;
  v8 = v4;
  if (!utteranceContexts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_utteranceContexts;
    self->_utteranceContexts = v6;

    v4 = v8;
    utteranceContexts = self->_utteranceContexts;
  }
  -[NSArray addObject:](utteranceContexts, "addObject:", v4);

}

- (unint64_t)utteranceContextCount
{
  return -[NSArray count](self->_utteranceContexts, "count");
}

- (id)utteranceContextAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_utteranceContexts, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDEntitiesRankedReadFrom(self, (uint64_t)a3);
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
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_retrievedTools;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_spanMatchedEntities;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_utteranceContexts;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
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
  -[QDSchemaQDEntitiesRanked retrievedTools](self, "retrievedTools");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "retrievedTools");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[QDSchemaQDEntitiesRanked retrievedTools](self, "retrievedTools");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[QDSchemaQDEntitiesRanked retrievedTools](self, "retrievedTools");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "retrievedTools");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[QDSchemaQDEntitiesRanked spanMatchedEntities](self, "spanMatchedEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spanMatchedEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[QDSchemaQDEntitiesRanked spanMatchedEntities](self, "spanMatchedEntities");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[QDSchemaQDEntitiesRanked spanMatchedEntities](self, "spanMatchedEntities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spanMatchedEntities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[QDSchemaQDEntitiesRanked utteranceContexts](self, "utteranceContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "utteranceContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[QDSchemaQDEntitiesRanked utteranceContexts](self, "utteranceContexts");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[QDSchemaQDEntitiesRanked utteranceContexts](self, "utteranceContexts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "utteranceContexts");
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
  uint64_t v4;

  v3 = -[NSArray hash](self->_retrievedTools, "hash");
  v4 = -[NSArray hash](self->_spanMatchedEntities, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_utteranceContexts, "hash");
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
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_retrievedTools, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v5 = self->_retrievedTools;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v38 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "dictionaryRepresentation");
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("retrievedTools"));
  }
  if (-[NSArray count](self->_spanMatchedEntities, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v13 = self->_spanMatchedEntities;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v12, "addObject:", v18);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v19);

          }
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("spanMatchedEntities"));
  }
  if (-[NSArray count](self->_utteranceContexts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = self->_utteranceContexts;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v30;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v29);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v20, "addObject:", v26);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v27);

          }
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("utteranceContext"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v29);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[QDSchemaQDEntitiesRanked dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (QDSchemaQDEntitiesRanked)initWithJSON:(id)a3
{
  void *v4;
  QDSchemaQDEntitiesRanked *v5;
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
    self = -[QDSchemaQDEntitiesRanked initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (QDSchemaQDEntitiesRanked)initWithDictionary:(id)a3
{
  id v4;
  QDSchemaQDEntitiesRanked *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  QDSchemaQDRetrievedTool *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  QDSchemaQDSpanMatchedEntity *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  QDSchemaQDRetrievedContextStatement *v30;
  QDSchemaQDEntitiesRanked *v31;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)QDSchemaQDEntitiesRanked;
  v5 = -[QDSchemaQDEntitiesRanked init](&v47, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("retrievedTools"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v7 = v6;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v44;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v44 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = -[QDSchemaQDRetrievedTool initWithDictionary:]([QDSchemaQDRetrievedTool alloc], "initWithDictionary:", v13);
              -[QDSchemaQDEntitiesRanked addRetrievedTools:](v5, "addRetrievedTools:", v14);

            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        }
        while (v10);
      }

      v6 = v7;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spanMatchedEntities"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v34 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v40;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v40 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v20);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = -[QDSchemaQDSpanMatchedEntity initWithDictionary:]([QDSchemaQDSpanMatchedEntity alloc], "initWithDictionary:", v21);
              -[QDSchemaQDEntitiesRanked addSpanMatchedEntities:](v5, "addSpanMatchedEntities:", v22);

            }
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
        }
        while (v18);
      }

      v15 = v34;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utteranceContext"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = v6;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v36;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v36 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v28);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = -[QDSchemaQDRetrievedContextStatement initWithDictionary:]([QDSchemaQDRetrievedContextStatement alloc], "initWithDictionary:", v29);
              -[QDSchemaQDEntitiesRanked addUtteranceContext:](v5, "addUtteranceContext:", v30);

            }
            ++v28;
          }
          while (v26 != v28);
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
        }
        while (v26);
      }

      v6 = v33;
      v15 = v34;
    }
    v31 = v5;

  }
  return v5;
}

- (NSArray)retrievedTools
{
  return self->_retrievedTools;
}

- (void)setRetrievedTools:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)spanMatchedEntities
{
  return self->_spanMatchedEntities;
}

- (void)setSpanMatchedEntities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)utteranceContexts
{
  return self->_utteranceContexts;
}

- (void)setUtteranceContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceContexts, 0);
  objc_storeStrong((id *)&self->_spanMatchedEntities, 0);
  objc_storeStrong((id *)&self->_retrievedTools, 0);
}

@end
