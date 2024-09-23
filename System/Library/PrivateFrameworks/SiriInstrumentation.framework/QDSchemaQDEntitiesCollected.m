@implementation QDSchemaQDEntitiesCollected

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
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)QDSchemaQDEntitiesCollected;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QDSchemaQDEntitiesCollected retrievedTools](self, "retrievedTools", v15.receiver, v15.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[QDSchemaQDEntitiesCollected setRetrievedTools:](self, "setRetrievedTools:", v7);

  -[QDSchemaQDEntitiesCollected spanMatchedEntities](self, "spanMatchedEntities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[QDSchemaQDEntitiesCollected setSpanMatchedEntities:](self, "setSpanMatchedEntities:", v9);

  -[QDSchemaQDEntitiesCollected utteranceContexts](self, "utteranceContexts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[QDSchemaQDEntitiesCollected setUtteranceContexts:](self, "setUtteranceContexts:", v11);

  -[QDSchemaQDEntitiesCollected requiredContexts](self, "requiredContexts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[QDSchemaQDEntitiesCollected setRequiredContexts:](self, "setRequiredContexts:", v13);
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

- (void)clearRequiredContext
{
  -[NSArray removeAllObjects](self->_requiredContexts, "removeAllObjects");
}

- (void)addRequiredContext:(id)a3
{
  id v4;
  NSArray *requiredContexts;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  requiredContexts = self->_requiredContexts;
  v8 = v4;
  if (!requiredContexts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_requiredContexts;
    self->_requiredContexts = v6;

    v4 = v8;
    requiredContexts = self->_requiredContexts;
  }
  -[NSArray addObject:](requiredContexts, "addObject:", v4);

}

- (unint64_t)requiredContextCount
{
  return -[NSArray count](self->_requiredContexts, "count");
}

- (id)requiredContextAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_requiredContexts, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return QDSchemaQDEntitiesCollectedReadFrom(self, (uint64_t)a3);
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
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
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
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = self->_retrievedTools;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_spanMatchedEntities;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_utteranceContexts;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_requiredContexts;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
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
  -[QDSchemaQDEntitiesCollected retrievedTools](self, "retrievedTools");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "retrievedTools");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[QDSchemaQDEntitiesCollected retrievedTools](self, "retrievedTools");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[QDSchemaQDEntitiesCollected retrievedTools](self, "retrievedTools");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "retrievedTools");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[QDSchemaQDEntitiesCollected spanMatchedEntities](self, "spanMatchedEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spanMatchedEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[QDSchemaQDEntitiesCollected spanMatchedEntities](self, "spanMatchedEntities");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[QDSchemaQDEntitiesCollected spanMatchedEntities](self, "spanMatchedEntities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spanMatchedEntities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[QDSchemaQDEntitiesCollected utteranceContexts](self, "utteranceContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "utteranceContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[QDSchemaQDEntitiesCollected utteranceContexts](self, "utteranceContexts");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[QDSchemaQDEntitiesCollected utteranceContexts](self, "utteranceContexts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "utteranceContexts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[QDSchemaQDEntitiesCollected requiredContexts](self, "requiredContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requiredContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[QDSchemaQDEntitiesCollected requiredContexts](self, "requiredContexts");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[QDSchemaQDEntitiesCollected requiredContexts](self, "requiredContexts");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requiredContexts");
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
  uint64_t v5;

  v3 = -[NSArray hash](self->_retrievedTools, "hash");
  v4 = -[NSArray hash](self->_spanMatchedEntities, "hash") ^ v3;
  v5 = -[NSArray hash](self->_utteranceContexts, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_requiredContexts, "hash");
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
  void *v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  void *v35;
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
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_requiredContexts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v5 = self->_requiredContexts;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v50 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "dictionaryRepresentation");
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("requiredContext"));
  }
  if (-[NSArray count](self->_retrievedTools, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v13 = self->_retrievedTools;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v46 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "dictionaryRepresentation");
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
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("retrievedTools"));
  }
  if (-[NSArray count](self->_spanMatchedEntities, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v21 = self->_spanMatchedEntities;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v42 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * k), "dictionaryRepresentation");
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
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("spanMatchedEntities"));
  }
  if (-[NSArray count](self->_utteranceContexts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v29 = self->_utteranceContexts;
    v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v38;
      do
      {
        for (m = 0; m != v31; ++m)
        {
          if (*(_QWORD *)v38 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * m), "dictionaryRepresentation", (_QWORD)v37);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            objc_msgSend(v28, "addObject:", v34);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v35);

          }
        }
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      }
      while (v31);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("utteranceContext"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v37);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[QDSchemaQDEntitiesCollected dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (QDSchemaQDEntitiesCollected)initWithJSON:(id)a3
{
  void *v4;
  QDSchemaQDEntitiesCollected *v5;
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
    self = -[QDSchemaQDEntitiesCollected initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (QDSchemaQDEntitiesCollected)initWithDictionary:(id)a3
{
  id v4;
  QDSchemaQDEntitiesCollected *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  SISchemaUUID *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  SISchemaUUID *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  SISchemaUUID *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  uint64_t v37;
  QDSchemaQDRetrievedContextStatement *v38;
  QDSchemaQDEntitiesCollected *v39;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)QDSchemaQDEntitiesCollected;
  v5 = -[QDSchemaQDEntitiesCollected init](&v59, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("retrievedTools"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v42 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v56 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v12);
              -[QDSchemaQDEntitiesCollected addRetrievedTools:](v5, "addRetrievedTools:", v13);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spanMatchedEntities"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v15 = v14;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v52;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v52 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v21);
              -[QDSchemaQDEntitiesCollected addSpanMatchedEntities:](v5, "addSpanMatchedEntities:", v22);

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
        }
        while (v18);
      }

      v14 = v15;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utteranceContext"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v48;
        do
        {
          for (k = 0; k != v26; ++k)
          {
            if (*(_QWORD *)v48 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v29);
              -[QDSchemaQDEntitiesCollected addUtteranceContext:](v5, "addUtteranceContext:", v30);

            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
        }
        while (v26);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requiredContext"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = v14;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v32 = v31;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v44;
        do
        {
          for (m = 0; m != v34; ++m)
          {
            if (*(_QWORD *)v44 != v35)
              objc_enumerationMutation(v32);
            v37 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v38 = -[QDSchemaQDRetrievedContextStatement initWithDictionary:]([QDSchemaQDRetrievedContextStatement alloc], "initWithDictionary:", v37);
              -[QDSchemaQDEntitiesCollected addRequiredContext:](v5, "addRequiredContext:", v38);

            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
        }
        while (v34);
      }

      v14 = v41;
    }
    v39 = v5;

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

- (NSArray)requiredContexts
{
  return self->_requiredContexts;
}

- (void)setRequiredContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredContexts, 0);
  objc_storeStrong((id *)&self->_utteranceContexts, 0);
  objc_storeStrong((id *)&self->_spanMatchedEntities, 0);
  objc_storeStrong((id *)&self->_retrievedTools, 0);
}

@end
