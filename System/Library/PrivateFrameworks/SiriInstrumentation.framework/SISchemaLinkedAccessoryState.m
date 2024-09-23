@implementation SISchemaLinkedAccessoryState

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
  v12.super_class = (Class)SISchemaLinkedAccessoryState;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v12, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaLinkedAccessoryState accessoryId](self, "accessoryId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SISchemaLinkedAccessoryState deleteAccessoryId](self, "deleteAccessoryId");
  -[SISchemaLinkedAccessoryState gradingOptInStateChanges](self, "gradingOptInStateChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaLinkedAccessoryState setGradingOptInStateChanges:](self, "setGradingOptInStateChanges:", v10);

  return v5;
}

- (BOOL)hasAccessoryId
{
  return self->_accessoryId != 0;
}

- (void)deleteAccessoryId
{
  -[SISchemaLinkedAccessoryState setAccessoryId:](self, "setAccessoryId:", 0);
}

- (void)clearGradingOptInStateChanges
{
  -[NSArray removeAllObjects](self->_gradingOptInStateChanges, "removeAllObjects");
}

- (void)addGradingOptInStateChanges:(id)a3
{
  id v4;
  NSArray *gradingOptInStateChanges;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  gradingOptInStateChanges = self->_gradingOptInStateChanges;
  v8 = v4;
  if (!gradingOptInStateChanges)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_gradingOptInStateChanges;
    self->_gradingOptInStateChanges = v6;

    v4 = v8;
    gradingOptInStateChanges = self->_gradingOptInStateChanges;
  }
  -[NSArray addObject:](gradingOptInStateChanges, "addObject:", v4);

}

- (unint64_t)gradingOptInStateChangesCount
{
  return -[NSArray count](self->_gradingOptInStateChanges, "count");
}

- (id)gradingOptInStateChangesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_gradingOptInStateChanges, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaLinkedAccessoryStateReadFrom(self, (uint64_t)a3);
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
  -[SISchemaLinkedAccessoryState accessoryId](self, "accessoryId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SISchemaLinkedAccessoryState accessoryId](self, "accessoryId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_gradingOptInStateChanges;
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[SISchemaLinkedAccessoryState accessoryId](self, "accessoryId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[SISchemaLinkedAccessoryState accessoryId](self, "accessoryId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SISchemaLinkedAccessoryState accessoryId](self, "accessoryId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[SISchemaLinkedAccessoryState gradingOptInStateChanges](self, "gradingOptInStateChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gradingOptInStateChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[SISchemaLinkedAccessoryState gradingOptInStateChanges](self, "gradingOptInStateChanges");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[SISchemaLinkedAccessoryState gradingOptInStateChanges](self, "gradingOptInStateChanges");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gradingOptInStateChanges");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SISchemaUUID hash](self->_accessoryId, "hash");
  return -[NSArray hash](self->_gradingOptInStateChanges, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_accessoryId)
  {
    -[SISchemaLinkedAccessoryState accessoryId](self, "accessoryId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accessoryId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("accessoryId"));

    }
  }
  if (-[NSArray count](self->_gradingOptInStateChanges, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = self->_gradingOptInStateChanges;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
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
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("gradingOptInStateChanges"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v16);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaLinkedAccessoryState dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaLinkedAccessoryState)initWithJSON:(id)a3
{
  void *v4;
  SISchemaLinkedAccessoryState *v5;
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
    self = -[SISchemaLinkedAccessoryState initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaLinkedAccessoryState)initWithDictionary:(id)a3
{
  id v4;
  SISchemaLinkedAccessoryState *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SISchemaGradingOptInStateChange *v15;
  SISchemaLinkedAccessoryState *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SISchemaLinkedAccessoryState;
  v5 = -[SISchemaLinkedAccessoryState init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessoryId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[SISchemaLinkedAccessoryState setAccessoryId:](v5, "setAccessoryId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gradingOptInStateChanges"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v6;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[SISchemaGradingOptInStateChange initWithDictionary:]([SISchemaGradingOptInStateChange alloc], "initWithDictionary:", v14);
              -[SISchemaLinkedAccessoryState addGradingOptInStateChanges:](v5, "addGradingOptInStateChanges:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v11);
      }

      v6 = v18;
    }
    v16 = v5;

  }
  return v5;
}

- (SISchemaUUID)accessoryId
{
  return self->_accessoryId;
}

- (void)setAccessoryId:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryId, a3);
}

- (NSArray)gradingOptInStateChanges
{
  return self->_gradingOptInStateChanges;
}

- (void)setGradingOptInStateChanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasAccessoryId:(BOOL)a3
{
  self->_hasAccessoryId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradingOptInStateChanges, 0);
  objc_storeStrong((id *)&self->_accessoryId, 0);
}

@end
