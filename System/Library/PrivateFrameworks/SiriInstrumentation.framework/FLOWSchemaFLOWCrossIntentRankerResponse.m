@implementation FLOWSchemaFLOWCrossIntentRankerResponse

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)clearCrossDomainRankerScoreKeeper
{
  -[NSArray removeAllObjects](self->_crossDomainRankerScoreKeepers, "removeAllObjects");
}

- (void)addCrossDomainRankerScoreKeeper:(id)a3
{
  id v4;
  NSArray *crossDomainRankerScoreKeepers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  crossDomainRankerScoreKeepers = self->_crossDomainRankerScoreKeepers;
  v8 = v4;
  if (!crossDomainRankerScoreKeepers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_crossDomainRankerScoreKeepers;
    self->_crossDomainRankerScoreKeepers = v6;

    v4 = v8;
    crossDomainRankerScoreKeepers = self->_crossDomainRankerScoreKeepers;
  }
  -[NSArray addObject:](crossDomainRankerScoreKeepers, "addObject:", v4);

}

- (unint64_t)crossDomainRankerScoreKeeperCount
{
  return -[NSArray count](self->_crossDomainRankerScoreKeepers, "count");
}

- (id)crossDomainRankerScoreKeeperAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_crossDomainRankerScoreKeepers, "objectAtIndexedSubscript:", a3);
}

- (void)clearCrossIntentRankerScoreKeeper
{
  -[NSArray removeAllObjects](self->_crossIntentRankerScoreKeepers, "removeAllObjects");
}

- (void)addCrossIntentRankerScoreKeeper:(id)a3
{
  id v4;
  NSArray *crossIntentRankerScoreKeepers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  crossIntentRankerScoreKeepers = self->_crossIntentRankerScoreKeepers;
  v8 = v4;
  if (!crossIntentRankerScoreKeepers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_crossIntentRankerScoreKeepers;
    self->_crossIntentRankerScoreKeepers = v6;

    v4 = v8;
    crossIntentRankerScoreKeepers = self->_crossIntentRankerScoreKeepers;
  }
  -[NSArray addObject:](crossIntentRankerScoreKeepers, "addObject:", v4);

}

- (unint64_t)crossIntentRankerScoreKeeperCount
{
  return -[NSArray count](self->_crossIntentRankerScoreKeepers, "count");
}

- (id)crossIntentRankerScoreKeeperAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_crossIntentRankerScoreKeepers, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWCrossIntentRankerResponseReadFrom(self, (uint64_t)a3);
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_crossDomainRankerScoreKeepers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_crossIntentRankerScoreKeepers;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
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
  -[FLOWSchemaFLOWCrossIntentRankerResponse crossDomainRankerScoreKeepers](self, "crossDomainRankerScoreKeepers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crossDomainRankerScoreKeepers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[FLOWSchemaFLOWCrossIntentRankerResponse crossDomainRankerScoreKeepers](self, "crossDomainRankerScoreKeepers");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWCrossIntentRankerResponse crossDomainRankerScoreKeepers](self, "crossDomainRankerScoreKeepers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "crossDomainRankerScoreKeepers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[FLOWSchemaFLOWCrossIntentRankerResponse crossIntentRankerScoreKeepers](self, "crossIntentRankerScoreKeepers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crossIntentRankerScoreKeepers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[FLOWSchemaFLOWCrossIntentRankerResponse crossIntentRankerScoreKeepers](self, "crossIntentRankerScoreKeepers");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[FLOWSchemaFLOWCrossIntentRankerResponse crossIntentRankerScoreKeepers](self, "crossIntentRankerScoreKeepers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "crossIntentRankerScoreKeepers");
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
  uint64_t v3;

  v3 = -[NSArray hash](self->_crossDomainRankerScoreKeepers, "hash");
  return -[NSArray hash](self->_crossIntentRankerScoreKeepers, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_crossDomainRankerScoreKeepers)
  {
    -[FLOWSchemaFLOWCrossIntentRankerResponse crossDomainRankerScoreKeepers](self, "crossDomainRankerScoreKeepers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("crossDomainRankerScoreKeeper"));

  }
  if (self->_crossIntentRankerScoreKeepers)
  {
    -[FLOWSchemaFLOWCrossIntentRankerResponse crossIntentRankerScoreKeepers](self, "crossIntentRankerScoreKeepers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("crossIntentRankerScoreKeeper"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWCrossIntentRankerResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWCrossIntentRankerResponse)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWCrossIntentRankerResponse *v5;
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
    self = -[FLOWSchemaFLOWCrossIntentRankerResponse initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWCrossIntentRankerResponse)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWCrossIntentRankerResponse *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  FLOWSchemaFLOWCrossIntentRankerResponse *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)FLOWSchemaFLOWCrossIntentRankerResponse;
  v5 = -[FLOWSchemaFLOWCrossIntentRankerResponse init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crossDomainRankerScoreKeeper"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v29;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v29 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = (void *)objc_msgSend(v12, "copy");
              -[FLOWSchemaFLOWCrossIntentRankerResponse addCrossDomainRankerScoreKeeper:](v5, "addCrossDomainRankerScoreKeeper:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crossIntentRankerScoreKeeper"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v25;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v25 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v19);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = (void *)objc_msgSend(v20, "copy", (_QWORD)v24);
              -[FLOWSchemaFLOWCrossIntentRankerResponse addCrossIntentRankerScoreKeeper:](v5, "addCrossIntentRankerScoreKeeper:", v21);

            }
            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        }
        while (v17);
      }

    }
    v22 = v5;

  }
  return v5;
}

- (NSArray)crossDomainRankerScoreKeepers
{
  return self->_crossDomainRankerScoreKeepers;
}

- (void)setCrossDomainRankerScoreKeepers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)crossIntentRankerScoreKeepers
{
  return self->_crossIntentRankerScoreKeepers;
}

- (void)setCrossIntentRankerScoreKeepers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossIntentRankerScoreKeepers, 0);
  objc_storeStrong((id *)&self->_crossDomainRankerScoreKeepers, 0);
}

@end
