@implementation PEGASUSSchemaPEGASUSKGQAClaimTier1

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

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PEGASUSSchemaPEGASUSKGQAClaimTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v11, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deleteEntityId](self, "deleteEntityId");
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deletePropId](self, "deletePropId");
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deleteValue](self, "deleteValue");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deleteEntityId](self, "deleteEntityId");
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deletePropId](self, "deletePropId");
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deleteValue](self, "deleteValue");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deleteEntityId](self, "deleteEntityId");
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deletePropId](self, "deletePropId");
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deleteValue](self, "deleteValue");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deleteEntityId](self, "deleteEntityId");
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deletePropId](self, "deletePropId");
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deleteValue](self, "deleteValue");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deleteEntityId](self, "deleteEntityId");
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deletePropId](self, "deletePropId");
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 deleteValue](self, "deleteValue");
  }
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 qualifiers](self, "qualifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 setQualifiers:](self, "setQualifiers:", v7);

  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 references](self, "references");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 setReferences:](self, "setReferences:", v9);

  return v5;
}

- (BOOL)hasEntityId
{
  return self->_entityId != 0;
}

- (void)deleteEntityId
{
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 setEntityId:](self, "setEntityId:", 0);
}

- (BOOL)hasPropId
{
  return self->_propId != 0;
}

- (void)deletePropId
{
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 setPropId:](self, "setPropId:", 0);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)deleteValue
{
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 setValue:](self, "setValue:", 0);
}

- (void)clearQualifiers
{
  -[NSArray removeAllObjects](self->_qualifiers, "removeAllObjects");
}

- (void)addQualifiers:(id)a3
{
  id v4;
  NSArray *qualifiers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  qualifiers = self->_qualifiers;
  v8 = v4;
  if (!qualifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_qualifiers;
    self->_qualifiers = v6;

    v4 = v8;
    qualifiers = self->_qualifiers;
  }
  -[NSArray addObject:](qualifiers, "addObject:", v4);

}

- (unint64_t)qualifiersCount
{
  return -[NSArray count](self->_qualifiers, "count");
}

- (id)qualifiersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_qualifiers, "objectAtIndexedSubscript:", a3);
}

- (void)clearReferences
{
  -[NSArray removeAllObjects](self->_references, "removeAllObjects");
}

- (void)addReferences:(id)a3
{
  id v4;
  NSArray *references;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  references = self->_references;
  v8 = v4;
  if (!references)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_references;
    self->_references = v6;

    v4 = v8;
    references = self->_references;
  }
  -[NSArray addObject:](references, "addObject:", v4);

}

- (unint64_t)referencesCount
{
  return -[NSArray count](self->_references, "count");
}

- (id)referencesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_references, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSKGQAClaimTier1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 entityId](self, "entityId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 propId](self, "propId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_qualifiers;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = self->_references;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
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
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 entityId](self, "entityId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 entityId](self, "entityId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 entityId](self, "entityId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 propId](self, "propId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 propId](self, "propId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 propId](self, "propId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 value](self, "value");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 value](self, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 qualifiers](self, "qualifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "qualifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 qualifiers](self, "qualifiers");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 qualifiers](self, "qualifiers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "qualifiers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 references](self, "references");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "references");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 references](self, "references");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 references](self, "references");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "references");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_entityId, "hash");
  v4 = -[NSString hash](self->_propId, "hash") ^ v3;
  v5 = -[NSString hash](self->_value, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_qualifiers, "hash");
  return v6 ^ -[NSArray hash](self->_references, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_entityId)
  {
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 entityId](self, "entityId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("entityId"));

  }
  if (self->_propId)
  {
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 propId](self, "propId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("propId"));

  }
  if (-[NSArray count](self->_qualifiers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v9 = self->_qualifiers;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v8, "addObject:", v14);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("qualifiers"));
  }
  if (-[NSArray count](self->_references, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v17 = self->_references;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v27);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v16, "addObject:", v22);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v23);

          }
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("references"));
  }
  if (self->_value)
  {
    -[PEGASUSSchemaPEGASUSKGQAClaimTier1 value](self, "value");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("value"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v27);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PEGASUSSchemaPEGASUSKGQAClaimTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PEGASUSSchemaPEGASUSKGQAClaimTier1)initWithJSON:(id)a3
{
  void *v4;
  PEGASUSSchemaPEGASUSKGQAClaimTier1 *v5;
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
    self = -[PEGASUSSchemaPEGASUSKGQAClaimTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PEGASUSSchemaPEGASUSKGQAClaimTier1)initWithDictionary:(id)a3
{
  id v4;
  PEGASUSSchemaPEGASUSKGQAClaimTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  PEGASUSSchemaPEGASUSKGQAQualifierTier1 *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  PEGASUSSchemaPEGASUSKGQAReference *v28;
  PEGASUSSchemaPEGASUSKGQAClaimTier1 *v29;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PEGASUSSchemaPEGASUSKGQAClaimTier1;
  v5 = -[PEGASUSSchemaPEGASUSKGQAClaimTier1 init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PEGASUSSchemaPEGASUSKGQAClaimTier1 setEntityId:](v5, "setEntityId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("propId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[PEGASUSSchemaPEGASUSKGQAClaimTier1 setPropId:](v5, "setPropId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v6;
      v12 = (void *)objc_msgSend(v10, "copy");
      -[PEGASUSSchemaPEGASUSKGQAClaimTier1 setValue:](v5, "setValue:", v12);

      v6 = v11;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("qualifiers"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v33 = v10;
    v32 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v39 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = -[PEGASUSSchemaPEGASUSKGQAQualifierTier1 initWithDictionary:]([PEGASUSSchemaPEGASUSKGQAQualifierTier1 alloc], "initWithDictionary:", v19);
              -[PEGASUSSchemaPEGASUSKGQAClaimTier1 addQualifiers:](v5, "addQualifiers:", v20);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        }
        while (v16);
      }

      v10 = v33;
      v13 = v32;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("references"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = v6;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v35 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = -[PEGASUSSchemaPEGASUSKGQAReference initWithDictionary:]([PEGASUSSchemaPEGASUSKGQAReference alloc], "initWithDictionary:", v27);
              -[PEGASUSSchemaPEGASUSKGQAClaimTier1 addReferences:](v5, "addReferences:", v28);

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        }
        while (v24);
      }

      v6 = v31;
      v13 = v32;
      v10 = v33;
    }
    v29 = v5;

  }
  return v5;
}

- (NSString)entityId
{
  return self->_entityId;
}

- (void)setEntityId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)propId
{
  return self->_propId;
}

- (void)setPropId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)qualifiers
{
  return self->_qualifiers;
}

- (void)setQualifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)references
{
  return self->_references;
}

- (void)setReferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setHasEntityId:(BOOL)a3
{
  self->_hasEntityId = a3;
}

- (void)setHasPropId:(BOOL)a3
{
  self->_hasPropId = a3;
}

- (void)setHasValue:(BOOL)a3
{
  self->_hasValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_references, 0);
  objc_storeStrong((id *)&self->_qualifiers, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_propId, 0);
  objc_storeStrong((id *)&self->_entityId, 0);
}

@end
