@implementation PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported

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
  v18.super_class = (Class)PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v18, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepGatingExecution](self, "multistepGatingExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported deleteMultistepGatingExecution](self, "deleteMultistepGatingExecution");
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepSubSearchExecution](self, "multistepSubSearchExecution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported deleteMultistepSubSearchExecution](self, "deleteMultistepSubSearchExecution");
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multiturnExecution](self, "multiturnExecution");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported deleteMultiturnExecution](self, "deleteMultiturnExecution");
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepSubSearchExecutions](self, "multistepSubSearchExecutions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v15, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported setMultistepSubSearchExecutions:](self, "setMultistepSubSearchExecutions:", v16);

  return v5;
}

- (BOOL)hasMultistepGatingExecution
{
  return self->_multistepGatingExecution != 0;
}

- (void)deleteMultistepGatingExecution
{
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported setMultistepGatingExecution:](self, "setMultistepGatingExecution:", 0);
}

- (BOOL)hasMultistepSubSearchExecution
{
  return self->_multistepSubSearchExecution != 0;
}

- (void)deleteMultistepSubSearchExecution
{
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported setMultistepSubSearchExecution:](self, "setMultistepSubSearchExecution:", 0);
}

- (BOOL)hasMultiturnExecution
{
  return self->_multiturnExecution != 0;
}

- (void)deleteMultiturnExecution
{
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported setMultiturnExecution:](self, "setMultiturnExecution:", 0);
}

- (void)clearMultistepSubSearchExecutions
{
  -[NSArray removeAllObjects](self->_multistepSubSearchExecutions, "removeAllObjects");
}

- (void)addMultistepSubSearchExecutions:(id)a3
{
  id v4;
  NSArray *multistepSubSearchExecutions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  multistepSubSearchExecutions = self->_multistepSubSearchExecutions;
  v8 = v4;
  if (!multistepSubSearchExecutions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_multistepSubSearchExecutions;
    self->_multistepSubSearchExecutions = v6;

    v4 = v8;
    multistepSubSearchExecutions = self->_multistepSubSearchExecutions;
  }
  -[NSArray addObject:](multistepSubSearchExecutions, "addObject:", v4);

}

- (unint64_t)multistepSubSearchExecutionsCount
{
  return -[NSArray count](self->_multistepSubSearchExecutions, "count");
}

- (id)multistepSubSearchExecutionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_multistepSubSearchExecutions, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReportedReadFrom(self, (uint64_t)a3);
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
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepGatingExecution](self, "multistepGatingExecution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepGatingExecution](self, "multistepGatingExecution");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepSubSearchExecution](self, "multistepSubSearchExecution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepSubSearchExecution](self, "multistepSubSearchExecution");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multiturnExecution](self, "multiturnExecution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multiturnExecution](self, "multiturnExecution");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_multistepSubSearchExecutions;
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
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepGatingExecution](self, "multistepGatingExecution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multistepGatingExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepGatingExecution](self, "multistepGatingExecution");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepGatingExecution](self, "multistepGatingExecution");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multistepGatingExecution");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepSubSearchExecution](self, "multistepSubSearchExecution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multistepSubSearchExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepSubSearchExecution](self, "multistepSubSearchExecution");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepSubSearchExecution](self, "multistepSubSearchExecution");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multistepSubSearchExecution");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multiturnExecution](self, "multiturnExecution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiturnExecution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multiturnExecution](self, "multiturnExecution");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multiturnExecution](self, "multiturnExecution");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multiturnExecution");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepSubSearchExecutions](self, "multistepSubSearchExecutions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multistepSubSearchExecutions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepSubSearchExecutions](self, "multistepSubSearchExecutions");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepSubSearchExecutions](self, "multistepSubSearchExecutions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multistepSubSearchExecutions");
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

  v3 = -[PEGASUSSchemaPEGASUSMultistepGatingExecution hash](self->_multistepGatingExecution, "hash");
  v4 = -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution hash](self->_multistepSubSearchExecution, "hash") ^ v3;
  v5 = -[PEGASUSSchemaPEGASUSMultiturnExecution hash](self->_multiturnExecution, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_multistepSubSearchExecutions, "hash");
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
  void *v18;
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
  if (self->_multistepGatingExecution)
  {
    -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepGatingExecution](self, "multistepGatingExecution");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("multistepGatingExecution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("multistepGatingExecution"));

    }
  }
  if (self->_multistepSubSearchExecution)
  {
    -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multistepSubSearchExecution](self, "multistepSubSearchExecution");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("multistepSubSearchExecution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("multistepSubSearchExecution"));

    }
  }
  if (-[NSArray count](self->_multistepSubSearchExecutions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = self->_multistepSubSearchExecutions;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v22);
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
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("multistepSubSearchExecutions"));
  }
  if (self->_multiturnExecution)
  {
    -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported multiturnExecution](self, "multiturnExecution");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("multiturnExecution"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("multiturnExecution"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v22);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *v5;
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
    self = -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *v5;
  void *v6;
  PEGASUSSchemaPEGASUSMultistepGatingExecution *v7;
  void *v8;
  PEGASUSSchemaPEGASUSMultistepSubSearchExecution *v9;
  void *v10;
  PEGASUSSchemaPEGASUSMultiturnExecution *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  PEGASUSSchemaPEGASUSMultistepSubSearchExecution *v19;
  PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *v20;
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
  v28.super_class = (Class)PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported;
  v5 = -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multistepGatingExecution"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[PEGASUSSchemaPEGASUSMultistepGatingExecution initWithDictionary:]([PEGASUSSchemaPEGASUSMultistepGatingExecution alloc], "initWithDictionary:", v6);
      -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported setMultistepGatingExecution:](v5, "setMultistepGatingExecution:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multistepSubSearchExecution"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution initWithDictionary:]([PEGASUSSchemaPEGASUSMultistepSubSearchExecution alloc], "initWithDictionary:", v8);
      -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported setMultistepSubSearchExecution:](v5, "setMultistepSubSearchExecution:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multiturnExecution"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[PEGASUSSchemaPEGASUSMultiturnExecution initWithDictionary:]([PEGASUSSchemaPEGASUSMultiturnExecution alloc], "initWithDictionary:", v10);
      -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported setMultiturnExecution:](v5, "setMultiturnExecution:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multistepSubSearchExecutions"));
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
              v19 = -[PEGASUSSchemaPEGASUSMultistepSubSearchExecution initWithDictionary:]([PEGASUSSchemaPEGASUSMultistepSubSearchExecution alloc], "initWithDictionary:", v18);
              -[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported addMultistepSubSearchExecutions:](v5, "addMultistepSubSearchExecutions:", v19);

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

- (PEGASUSSchemaPEGASUSMultistepGatingExecution)multistepGatingExecution
{
  return self->_multistepGatingExecution;
}

- (void)setMultistepGatingExecution:(id)a3
{
  objc_storeStrong((id *)&self->_multistepGatingExecution, a3);
}

- (PEGASUSSchemaPEGASUSMultistepSubSearchExecution)multistepSubSearchExecution
{
  return self->_multistepSubSearchExecution;
}

- (void)setMultistepSubSearchExecution:(id)a3
{
  objc_storeStrong((id *)&self->_multistepSubSearchExecution, a3);
}

- (PEGASUSSchemaPEGASUSMultiturnExecution)multiturnExecution
{
  return self->_multiturnExecution;
}

- (void)setMultiturnExecution:(id)a3
{
  objc_storeStrong((id *)&self->_multiturnExecution, a3);
}

- (NSArray)multistepSubSearchExecutions
{
  return self->_multistepSubSearchExecutions;
}

- (void)setMultistepSubSearchExecutions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasMultistepGatingExecution:(BOOL)a3
{
  self->_hasMultistepGatingExecution = a3;
}

- (void)setHasMultistepSubSearchExecution:(BOOL)a3
{
  self->_hasMultistepSubSearchExecution = a3;
}

- (void)setHasMultiturnExecution:(BOOL)a3
{
  self->_hasMultiturnExecution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multistepSubSearchExecutions, 0);
  objc_storeStrong((id *)&self->_multiturnExecution, 0);
  objc_storeStrong((id *)&self->_multistepSubSearchExecution, 0);
  objc_storeStrong((id *)&self->_multistepGatingExecution, 0);
}

@end
