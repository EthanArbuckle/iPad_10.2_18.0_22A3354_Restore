@implementation FLOWSchemaFLOWKGQAExecutionTier1

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
  v7.super_class = (Class)FLOWSchemaFLOWKGQAExecutionTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[FLOWSchemaFLOWKGQAExecutionTier1 deletePrimaryEntities](self, "deletePrimaryEntities");
    -[FLOWSchemaFLOWKGQAExecutionTier1 deleteSecondaryEntities](self, "deleteSecondaryEntities");
    -[FLOWSchemaFLOWKGQAExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[FLOWSchemaFLOWKGQAExecutionTier1 deletePrimaryEntities](self, "deletePrimaryEntities");
    -[FLOWSchemaFLOWKGQAExecutionTier1 deleteSecondaryEntities](self, "deleteSecondaryEntities");
    -[FLOWSchemaFLOWKGQAExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[FLOWSchemaFLOWKGQAExecutionTier1 deletePrimaryEntities](self, "deletePrimaryEntities");
    -[FLOWSchemaFLOWKGQAExecutionTier1 deleteSecondaryEntities](self, "deleteSecondaryEntities");
    -[FLOWSchemaFLOWKGQAExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[FLOWSchemaFLOWKGQAExecutionTier1 deletePrimaryEntities](self, "deletePrimaryEntities");
    -[FLOWSchemaFLOWKGQAExecutionTier1 deleteSecondaryEntities](self, "deleteSecondaryEntities");
    -[FLOWSchemaFLOWKGQAExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[FLOWSchemaFLOWKGQAExecutionTier1 deletePrimaryEntities](self, "deletePrimaryEntities");
    -[FLOWSchemaFLOWKGQAExecutionTier1 deleteSecondaryEntities](self, "deleteSecondaryEntities");
    -[FLOWSchemaFLOWKGQAExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
  }

  return v5;
}

- (void)clearPrimaryEntities
{
  -[NSArray removeAllObjects](self->_primaryEntities, "removeAllObjects");
}

- (void)addPrimaryEntities:(id)a3
{
  id v4;
  NSArray *primaryEntities;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  primaryEntities = self->_primaryEntities;
  v8 = v4;
  if (!primaryEntities)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_primaryEntities;
    self->_primaryEntities = v6;

    v4 = v8;
    primaryEntities = self->_primaryEntities;
  }
  -[NSArray addObject:](primaryEntities, "addObject:", v4);

}

- (unint64_t)primaryEntitiesCount
{
  return -[NSArray count](self->_primaryEntities, "count");
}

- (id)primaryEntitiesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_primaryEntities, "objectAtIndexedSubscript:", a3);
}

- (void)clearSecondaryEntities
{
  -[NSArray removeAllObjects](self->_secondaryEntities, "removeAllObjects");
}

- (void)addSecondaryEntities:(id)a3
{
  id v4;
  NSArray *secondaryEntities;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  secondaryEntities = self->_secondaryEntities;
  v8 = v4;
  if (!secondaryEntities)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_secondaryEntities;
    self->_secondaryEntities = v6;

    v4 = v8;
    secondaryEntities = self->_secondaryEntities;
  }
  -[NSArray addObject:](secondaryEntities, "addObject:", v4);

}

- (unint64_t)secondaryEntitiesCount
{
  return -[NSArray count](self->_secondaryEntities, "count");
}

- (id)secondaryEntitiesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_secondaryEntities, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasAnswerId
{
  return self->_answerId != 0;
}

- (void)deleteAnswerId
{
  -[FLOWSchemaFLOWKGQAExecutionTier1 setAnswerId:](self, "setAnswerId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWKGQAExecutionTier1ReadFrom(self, (uint64_t)a3);
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
  void *v15;
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
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_primaryEntities;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_secondaryEntities;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  -[FLOWSchemaFLOWKGQAExecutionTier1 answerId](self, "answerId", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteStringField();

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
  -[FLOWSchemaFLOWKGQAExecutionTier1 primaryEntities](self, "primaryEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[FLOWSchemaFLOWKGQAExecutionTier1 primaryEntities](self, "primaryEntities");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[FLOWSchemaFLOWKGQAExecutionTier1 primaryEntities](self, "primaryEntities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryEntities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[FLOWSchemaFLOWKGQAExecutionTier1 secondaryEntities](self, "secondaryEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[FLOWSchemaFLOWKGQAExecutionTier1 secondaryEntities](self, "secondaryEntities");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[FLOWSchemaFLOWKGQAExecutionTier1 secondaryEntities](self, "secondaryEntities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondaryEntities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[FLOWSchemaFLOWKGQAExecutionTier1 answerId](self, "answerId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "answerId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[FLOWSchemaFLOWKGQAExecutionTier1 answerId](self, "answerId");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[FLOWSchemaFLOWKGQAExecutionTier1 answerId](self, "answerId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "answerId");
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

  v3 = -[NSArray hash](self->_primaryEntities, "hash");
  v4 = -[NSArray hash](self->_secondaryEntities, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_answerId, "hash");
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
  if (self->_answerId)
  {
    -[FLOWSchemaFLOWKGQAExecutionTier1 answerId](self, "answerId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("answerId"));

  }
  if (self->_primaryEntities)
  {
    -[FLOWSchemaFLOWKGQAExecutionTier1 primaryEntities](self, "primaryEntities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("primaryEntities"));

  }
  if (self->_secondaryEntities)
  {
    -[FLOWSchemaFLOWKGQAExecutionTier1 secondaryEntities](self, "secondaryEntities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("secondaryEntities"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[FLOWSchemaFLOWKGQAExecutionTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (FLOWSchemaFLOWKGQAExecutionTier1)initWithJSON:(id)a3
{
  void *v4;
  FLOWSchemaFLOWKGQAExecutionTier1 *v5;
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
    self = -[FLOWSchemaFLOWKGQAExecutionTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (FLOWSchemaFLOWKGQAExecutionTier1)initWithDictionary:(id)a3
{
  id v4;
  FLOWSchemaFLOWKGQAExecutionTier1 *v5;
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
  void *v22;
  void *v23;
  FLOWSchemaFLOWKGQAExecutionTier1 *v24;
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
  v34.super_class = (Class)FLOWSchemaFLOWKGQAExecutionTier1;
  v5 = -[FLOWSchemaFLOWKGQAExecutionTier1 init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryEntities"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v31;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v31 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = (void *)objc_msgSend(v12, "copy");
              -[FLOWSchemaFLOWKGQAExecutionTier1 addPrimaryEntities:](v5, "addPrimaryEntities:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondaryEntities"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v27;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v27 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v19);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = (void *)objc_msgSend(v20, "copy", (_QWORD)v26);
              -[FLOWSchemaFLOWKGQAExecutionTier1 addSecondaryEntities:](v5, "addSecondaryEntities:", v21);

            }
            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        }
        while (v17);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("answerId"), (_QWORD)v26);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (void *)objc_msgSend(v22, "copy");
      -[FLOWSchemaFLOWKGQAExecutionTier1 setAnswerId:](v5, "setAnswerId:", v23);

    }
    v24 = v5;

  }
  return v5;
}

- (NSArray)primaryEntities
{
  return self->_primaryEntities;
}

- (void)setPrimaryEntities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)secondaryEntities
{
  return self->_secondaryEntities;
}

- (void)setSecondaryEntities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)answerId
{
  return self->_answerId;
}

- (void)setAnswerId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasAnswerId:(BOOL)a3
{
  self->_hasAnswerId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_answerId, 0);
  objc_storeStrong((id *)&self->_secondaryEntities, 0);
  objc_storeStrong((id *)&self->_primaryEntities, 0);
}

@end
