@implementation SISchemaUUFRCompletion

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SISchemaUUFRCompletion;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v11, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaUUFRCompletion homeKitAccessoryResponses](self, "homeKitAccessoryResponses", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaUUFRCompletion setHomeKitAccessoryResponses:](self, "setHomeKitAccessoryResponses:", v7);

  -[SISchemaUUFRCompletion siriResponseContext](self, "siriResponseContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v9, "suppressMessage");
  if ((_DWORD)v4)
    -[SISchemaUUFRCompletion deleteSiriResponseContext](self, "deleteSiriResponseContext");
  return v5;
}

- (void)setCompletionStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_completionStatus = a3;
}

- (BOOL)hasCompletionStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCompletionStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteCompletionStatus
{
  -[SISchemaUUFRCompletion setCompletionStatus:](self, "setCompletionStatus:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearHomeKitAccessoryResponse
{
  -[NSArray removeAllObjects](self->_homeKitAccessoryResponses, "removeAllObjects");
}

- (void)addHomeKitAccessoryResponse:(id)a3
{
  id v4;
  NSArray *homeKitAccessoryResponses;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  homeKitAccessoryResponses = self->_homeKitAccessoryResponses;
  v8 = v4;
  if (!homeKitAccessoryResponses)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_homeKitAccessoryResponses;
    self->_homeKitAccessoryResponses = v6;

    v4 = v8;
    homeKitAccessoryResponses = self->_homeKitAccessoryResponses;
  }
  -[NSArray addObject:](homeKitAccessoryResponses, "addObject:", v4);

}

- (unint64_t)homeKitAccessoryResponseCount
{
  return -[NSArray count](self->_homeKitAccessoryResponses, "count");
}

- (id)homeKitAccessoryResponseAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_homeKitAccessoryResponses, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasSiriResponseContext
{
  return self->_siriResponseContext != 0;
}

- (void)deleteSiriResponseContext
{
  -[SISchemaUUFRCompletion setSiriResponseContext:](self, "setSiriResponseContext:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUUFRCompletionReadFrom(self, (uint64_t)a3);
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
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_homeKitAccessoryResponses;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[SISchemaUUFRCompletion siriResponseContext](self, "siriResponseContext", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SISchemaUUFRCompletion siriResponseContext](self, "siriResponseContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int completionStatus;
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
    completionStatus = self->_completionStatus;
    if (completionStatus != objc_msgSend(v4, "completionStatus"))
      goto LABEL_15;
  }
  -[SISchemaUUFRCompletion homeKitAccessoryResponses](self, "homeKitAccessoryResponses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeKitAccessoryResponses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_14;
  -[SISchemaUUFRCompletion homeKitAccessoryResponses](self, "homeKitAccessoryResponses");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SISchemaUUFRCompletion homeKitAccessoryResponses](self, "homeKitAccessoryResponses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeKitAccessoryResponses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_15;
  }
  else
  {

  }
  -[SISchemaUUFRCompletion siriResponseContext](self, "siriResponseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriResponseContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[SISchemaUUFRCompletion siriResponseContext](self, "siriResponseContext");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[SISchemaUUFRCompletion siriResponseContext](self, "siriResponseContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "siriResponseContext");
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
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_completionStatus;
  else
    v3 = 0;
  v4 = -[NSArray hash](self->_homeKitAccessoryResponses, "hash") ^ v3;
  return v4 ^ -[SISchemaSiriResponseContext hash](self->_siriResponseContext, "hash");
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
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[SISchemaUUFRCompletion completionStatus](self, "completionStatus") - 2;
    if (v4 > 4)
      v5 = CFSTR("COMPLETIONSTATUS_UNKNOWN_COMPLETION_STATUS");
    else
      v5 = off_1E56378B0[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("completionStatus"));
  }
  if (-[NSArray count](self->_homeKitAccessoryResponses, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = self->_homeKitAccessoryResponses;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
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
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("homeKitAccessoryResponse"));
  }
  if (self->_siriResponseContext)
  {
    -[SISchemaUUFRCompletion siriResponseContext](self, "siriResponseContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("siriResponseContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("siriResponseContext"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v18);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SISchemaUUFRCompletion dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SISchemaUUFRCompletion)initWithJSON:(id)a3
{
  void *v4;
  SISchemaUUFRCompletion *v5;
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
    self = -[SISchemaUUFRCompletion initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SISchemaUUFRCompletion)initWithDictionary:(id)a3
{
  id v4;
  SISchemaUUFRCompletion *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SISchemaHomeKitAccessoryResponse *v14;
  void *v15;
  SISchemaSiriResponseContext *v16;
  SISchemaUUFRCompletion *v17;
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
  v24.super_class = (Class)SISchemaUUFRCompletion;
  v5 = -[SISchemaUUFRCompletion init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("completionStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SISchemaUUFRCompletion setCompletionStatus:](v5, "setCompletionStatus:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeKitAccessoryResponse"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v6;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v21;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v21 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = -[SISchemaHomeKitAccessoryResponse initWithDictionary:]([SISchemaHomeKitAccessoryResponse alloc], "initWithDictionary:", v13);
              -[SISchemaUUFRCompletion addHomeKitAccessoryResponse:](v5, "addHomeKitAccessoryResponse:", v14);

            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v10);
      }

      v6 = v19;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("siriResponseContext"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[SISchemaSiriResponseContext initWithDictionary:]([SISchemaSiriResponseContext alloc], "initWithDictionary:", v15);
      -[SISchemaUUFRCompletion setSiriResponseContext:](v5, "setSiriResponseContext:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (int)completionStatus
{
  return self->_completionStatus;
}

- (NSArray)homeKitAccessoryResponses
{
  return self->_homeKitAccessoryResponses;
}

- (void)setHomeKitAccessoryResponses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SISchemaSiriResponseContext)siriResponseContext
{
  return self->_siriResponseContext;
}

- (void)setSiriResponseContext:(id)a3
{
  objc_storeStrong((id *)&self->_siriResponseContext, a3);
}

- (void)setHasSiriResponseContext:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriResponseContext, 0);
  objc_storeStrong((id *)&self->_homeKitAccessoryResponses, 0);
}

@end
