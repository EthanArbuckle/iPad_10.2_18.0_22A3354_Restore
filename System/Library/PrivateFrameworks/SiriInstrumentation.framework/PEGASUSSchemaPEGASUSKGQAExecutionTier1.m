@implementation PEGASUSSchemaPEGASUSKGQAExecutionTier1

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

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PEGASUSSchemaPEGASUSKGQAExecutionTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deletePrimaryEntities](self, "deletePrimaryEntities");
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deleteSecondaryEntities](self, "deleteSecondaryEntities");
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deletePrimaryEntities](self, "deletePrimaryEntities");
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deleteSecondaryEntities](self, "deleteSecondaryEntities");
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deletePrimaryEntities](self, "deletePrimaryEntities");
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deleteSecondaryEntities](self, "deleteSecondaryEntities");
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deletePrimaryEntities](self, "deletePrimaryEntities");
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deleteSecondaryEntities](self, "deleteSecondaryEntities");
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deletePrimaryEntities](self, "deletePrimaryEntities");
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deleteSecondaryEntities](self, "deleteSecondaryEntities");
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 deleteAnswerId](self, "deleteAnswerId");
  }
  -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 claims](self, "claims");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 setClaims:](self, "setClaims:", v7);

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
  -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 setAnswerId:](self, "setAnswerId:", 0);
}

- (void)clearClaims
{
  -[NSArray removeAllObjects](self->_claims, "removeAllObjects");
}

- (void)addClaims:(id)a3
{
  id v4;
  NSArray *claims;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  claims = self->_claims;
  v8 = v4;
  if (!claims)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_claims;
    self->_claims = v6;

    v4 = v8;
    claims = self->_claims;
  }
  -[NSArray addObject:](claims, "addObject:", v4);

}

- (unint64_t)claimsCount
{
  return -[NSArray count](self->_claims, "count");
}

- (id)claimsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_claims, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSKGQAExecutionTier1ReadFrom(self, (uint64_t)a3);
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
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = self->_primaryEntities;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = self->_secondaryEntities;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v12);
  }

  -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 answerId](self, "answerId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_claims;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
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
  -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 primaryEntities](self, "primaryEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 primaryEntities](self, "primaryEntities");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 primaryEntities](self, "primaryEntities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryEntities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 secondaryEntities](self, "secondaryEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 secondaryEntities](self, "secondaryEntities");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 secondaryEntities](self, "secondaryEntities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondaryEntities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 answerId](self, "answerId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "answerId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 answerId](self, "answerId");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 answerId](self, "answerId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "answerId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 claims](self, "claims");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "claims");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 claims](self, "claims");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 claims](self, "claims");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "claims");
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
  NSUInteger v5;

  v3 = -[NSArray hash](self->_primaryEntities, "hash");
  v4 = -[NSArray hash](self->_secondaryEntities, "hash") ^ v3;
  v5 = -[NSString hash](self->_answerId, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_claims, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
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
  if (self->_answerId)
  {
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 answerId](self, "answerId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("answerId"));

  }
  if (-[NSArray count](self->_claims, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_claims;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
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
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("claims"));
  }
  if (self->_primaryEntities)
  {
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 primaryEntities](self, "primaryEntities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("primaryEntities"));

  }
  if (self->_secondaryEntities)
  {
    -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 secondaryEntities](self, "secondaryEntities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("secondaryEntities"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v19);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSKGQAExecutionTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSKGQAExecutionTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSKGQAExecutionTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSKGQAExecutionTier1 *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  PEGASUSSchemaPEGASUSKGQAClaimTier1 *v33;
  PEGASUSSchemaPEGASUSKGQAExecutionTier1 *v34;
  void *v36;
  id v37;
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
  objc_super v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PEGASUSSchemaPEGASUSKGQAExecutionTier1;
  v5 = -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryEntities"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v7 = v6;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v47 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = (void *)objc_msgSend(v13, "copy");
              -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 addPrimaryEntities:](v5, "addPrimaryEntities:", v14);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
        }
        while (v10);
      }

      v6 = v7;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondaryEntities"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v16 = v15;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v43 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = (void *)objc_msgSend(v22, "copy");
              -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 addSecondaryEntities:](v5, "addSecondaryEntities:", v23);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        }
        while (v19);
      }

      v15 = v16;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("answerId"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(v24, "copy");
      -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 setAnswerId:](v5, "setAnswerId:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("claims"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = v15;
      v37 = v4;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v27 = v26;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v39;
        do
        {
          for (k = 0; k != v29; ++k)
          {
            if (*(_QWORD *)v39 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v33 = -[PEGASUSSchemaPEGASUSKGQAClaimTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSKGQAClaimTier1 alloc], "initWithDictionary:", v32);
              -[PEGASUSSchemaPEGASUSKGQAExecutionTier1 addClaims:](v5, "addClaims:", v33);

            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
        }
        while (v29);
      }

      v4 = v37;
      v15 = v36;
    }
    v34 = v5;

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

- (NSArray)claims
{
  return self->_claims;
}

- (void)setClaims:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasAnswerId:(BOOL)a3
{
  self->_hasAnswerId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_claims, 0);
  objc_storeStrong((id *)&self->_answerId, 0);
  objc_storeStrong((id *)&self->_secondaryEntities, 0);
  objc_storeStrong((id *)&self->_primaryEntities, 0);
}

@end
