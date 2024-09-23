@implementation FLOWSchemaFLOWHomeAutomationContext

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
  v15.super_class = (Class)FLOWSchemaFLOWHomeAutomationContext;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWHomeAutomationContext homeKitServiceResponses](self, "homeKitServiceResponses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLOWSchemaFLOWHomeAutomationContext setHomeKitServiceResponses:](self, "setHomeKitServiceResponses:", v7);

  -[FLOWSchemaFLOWHomeAutomationContext homeContext](self, "homeContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySensitiveConditionsPolicy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "suppressMessage");

  if (v10)
    -[FLOWSchemaFLOWHomeAutomationContext deleteHomeContext](self, "deleteHomeContext");
  -[FLOWSchemaFLOWHomeAutomationContext homeAutomationCommand](self, "homeAutomationCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySensitiveConditionsPolicy:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "suppressMessage");

  if (v13)
    -[FLOWSchemaFLOWHomeAutomationContext deleteHomeAutomationCommand](self, "deleteHomeAutomationCommand");

  return v5;
}

- (void)clearHomeKitServiceResponse
{
  -[NSArray removeAllObjects](self->_homeKitServiceResponses, "removeAllObjects");
}

- (void)addHomeKitServiceResponse:(id)a3
{
  id v4;
  NSArray *homeKitServiceResponses;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  homeKitServiceResponses = self->_homeKitServiceResponses;
  v8 = v4;
  if (!homeKitServiceResponses)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_homeKitServiceResponses;
    self->_homeKitServiceResponses = v6;

    v4 = v8;
    homeKitServiceResponses = self->_homeKitServiceResponses;
  }
  -[NSArray addObject:](homeKitServiceResponses, "addObject:", v4);

}

- (unint64_t)homeKitServiceResponseCount
{
  return -[NSArray count](self->_homeKitServiceResponses, "count");
}

- (id)homeKitServiceResponseAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_homeKitServiceResponses, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasHomeContext
{
  return self->_homeContext != 0;
}

- (void)deleteHomeContext
{
  -[FLOWSchemaFLOWHomeAutomationContext setHomeContext:](self, "setHomeContext:", 0);
}

- (BOOL)hasHomeAutomationCommand
{
  return self->_homeAutomationCommand != 0;
}

- (void)deleteHomeAutomationCommand
{
  -[FLOWSchemaFLOWHomeAutomationContext setHomeAutomationCommand:](self, "setHomeAutomationCommand:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWHomeAutomationContextReadFrom(self, (uint64_t)a3);
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
  v5 = self->_homeKitServiceResponses;
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

  -[FLOWSchemaFLOWHomeAutomationContext homeContext](self, "homeContext", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FLOWSchemaFLOWHomeAutomationContext homeContext](self, "homeContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[FLOWSchemaFLOWHomeAutomationContext homeAutomationCommand](self, "homeAutomationCommand");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FLOWSchemaFLOWHomeAutomationContext homeAutomationCommand](self, "homeAutomationCommand");
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
  -[FLOWSchemaFLOWHomeAutomationContext homeKitServiceResponses](self, "homeKitServiceResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeKitServiceResponses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[FLOWSchemaFLOWHomeAutomationContext homeKitServiceResponses](self, "homeKitServiceResponses");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWHomeAutomationContext homeKitServiceResponses](self, "homeKitServiceResponses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeKitServiceResponses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[FLOWSchemaFLOWHomeAutomationContext homeContext](self, "homeContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[FLOWSchemaFLOWHomeAutomationContext homeContext](self, "homeContext");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[FLOWSchemaFLOWHomeAutomationContext homeContext](self, "homeContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[FLOWSchemaFLOWHomeAutomationContext homeAutomationCommand](self, "homeAutomationCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeAutomationCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[FLOWSchemaFLOWHomeAutomationContext homeAutomationCommand](self, "homeAutomationCommand");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[FLOWSchemaFLOWHomeAutomationContext homeAutomationCommand](self, "homeAutomationCommand");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeAutomationCommand");
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

  v3 = -[NSArray hash](self->_homeKitServiceResponses, "hash");
  v4 = -[FLOWSchemaFLOWHomeContext hash](self->_homeContext, "hash") ^ v3;
  return v4 ^ -[FLOWSchemaFLOWHomeAutomationCommand hash](self->_homeAutomationCommand, "hash");
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
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
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
  if (self->_homeAutomationCommand)
  {
    -[FLOWSchemaFLOWHomeAutomationContext homeAutomationCommand](self, "homeAutomationCommand");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("homeAutomationCommand"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("homeAutomationCommand"));

    }
  }
  if (self->_homeContext)
  {
    -[FLOWSchemaFLOWHomeAutomationContext homeContext](self, "homeContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("homeContext"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("homeContext"));

    }
  }
  if (-[NSArray count](self->_homeKitServiceResponses, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = self->_homeKitServiceResponses;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v10, "addObject:", v16);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v17);

          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("homeKitServiceResponse"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v19);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWHomeAutomationContext dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWHomeAutomationContext)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWHomeAutomationContext *v5;
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
    self = -[FLOWSchemaFLOWHomeAutomationContext initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWHomeAutomationContext)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWHomeAutomationContext *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  FLOWSchemaFLOWHomeKitServiceResponse *v13;
  FLOWSchemaFLOWHomeKitServiceResponse *v14;
  void *v15;
  FLOWSchemaFLOWHomeContext *v16;
  void *v17;
  FLOWSchemaFLOWHomeAutomationCommand *v18;
  FLOWSchemaFLOWHomeAutomationContext *v19;
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
  v25.super_class = (Class)FLOWSchemaFLOWHomeAutomationContext;
  v5 = -[FLOWSchemaFLOWHomeAutomationContext init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeKitServiceResponse"));
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
              v13 = [FLOWSchemaFLOWHomeKitServiceResponse alloc];
              v14 = -[FLOWSchemaFLOWHomeKitServiceResponse initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v21);
              -[FLOWSchemaFLOWHomeAutomationContext addHomeKitServiceResponse:](v5, "addHomeKitServiceResponse:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeContext"), (_QWORD)v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[FLOWSchemaFLOWHomeContext initWithDictionary:]([FLOWSchemaFLOWHomeContext alloc], "initWithDictionary:", v15);
      -[FLOWSchemaFLOWHomeAutomationContext setHomeContext:](v5, "setHomeContext:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeAutomationCommand"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[FLOWSchemaFLOWHomeAutomationCommand initWithDictionary:]([FLOWSchemaFLOWHomeAutomationCommand alloc], "initWithDictionary:", v17);
      -[FLOWSchemaFLOWHomeAutomationContext setHomeAutomationCommand:](v5, "setHomeAutomationCommand:", v18);

    }
    v19 = v5;

  }
  return v5;
}

- (NSArray)homeKitServiceResponses
{
  return self->_homeKitServiceResponses;
}

- (void)setHomeKitServiceResponses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FLOWSchemaFLOWHomeContext)homeContext
{
  return self->_homeContext;
}

- (void)setHomeContext:(id)a3
{
  objc_storeStrong((id *)&self->_homeContext, a3);
}

- (FLOWSchemaFLOWHomeAutomationCommand)homeAutomationCommand
{
  return self->_homeAutomationCommand;
}

- (void)setHomeAutomationCommand:(id)a3
{
  objc_storeStrong((id *)&self->_homeAutomationCommand, a3);
}

- (void)setHasHomeContext:(BOOL)a3
{
  self->_hasHomeContext = a3;
}

- (void)setHasHomeAutomationCommand:(BOOL)a3
{
  self->_hasHomeAutomationCommand = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAutomationCommand, 0);
  objc_storeStrong((id *)&self->_homeContext, 0);
  objc_storeStrong((id *)&self->_homeKitServiceResponses, 0);
}

@end
