@implementation PLATFORMProvisionalConnectedComponents

- (void)clearComponentIds
{
  -[NSArray removeAllObjects](self->_componentIds, "removeAllObjects");
}

- (void)addComponentIds:(id)a3
{
  id v4;
  NSArray *componentIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  componentIds = self->_componentIds;
  v8 = v4;
  if (!componentIds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_componentIds;
    self->_componentIds = v6;

    v4 = v8;
    componentIds = self->_componentIds;
  }
  -[NSArray addObject:](componentIds, "addObject:", v4);

}

- (unint64_t)componentIdsCount
{
  return -[NSArray count](self->_componentIds, "count");
}

- (id)componentIdsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_componentIds, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasRepresentativeId
{
  return self->_representativeId != 0;
}

- (void)deleteRepresentativeId
{
  -[PLATFORMProvisionalConnectedComponents setRepresentativeId:](self, "setRepresentativeId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PLATFORMProvisionalConnectedComponentsReadFrom(self, (uint64_t)a3);
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
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_componentIds;
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

  -[PLATFORMProvisionalConnectedComponents representativeId](self, "representativeId", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PLATFORMProvisionalConnectedComponents representativeId](self, "representativeId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[PLATFORMProvisionalConnectedComponents componentIds](self, "componentIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[PLATFORMProvisionalConnectedComponents componentIds](self, "componentIds");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PLATFORMProvisionalConnectedComponents componentIds](self, "componentIds");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentIds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[PLATFORMProvisionalConnectedComponents representativeId](self, "representativeId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "representativeId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[PLATFORMProvisionalConnectedComponents representativeId](self, "representativeId");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[PLATFORMProvisionalConnectedComponents representativeId](self, "representativeId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "representativeId");
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

  v3 = -[NSArray hash](self->_componentIds, "hash");
  return -[PLATFORMProvisionalConnectecedComponentIdentifier hash](self->_representativeId, "hash") ^ v3;
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
  if (-[NSArray count](self->_componentIds, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_componentIds;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("componentIds"));
  }
  if (self->_representativeId)
  {
    -[PLATFORMProvisionalConnectedComponents representativeId](self, "representativeId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("representativeId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("representativeId"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v16);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PLATFORMProvisionalConnectedComponents dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PLATFORMProvisionalConnectedComponents)initWithJSON:(id)a3
{
  void *v4;
  PLATFORMProvisionalConnectedComponents *v5;
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
    self = -[PLATFORMProvisionalConnectedComponents initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PLATFORMProvisionalConnectedComponents)initWithDictionary:(id)a3
{
  id v4;
  PLATFORMProvisionalConnectedComponents *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PLATFORMProvisionalConnectecedComponentIdentifier *v13;
  PLATFORMProvisionalConnectecedComponentIdentifier *v14;
  void *v15;
  PLATFORMProvisionalConnectecedComponentIdentifier *v16;
  PLATFORMProvisionalConnectedComponents *v17;
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
  v23.super_class = (Class)PLATFORMProvisionalConnectedComponents;
  v5 = -[PLATFORMProvisionalConnectedComponents init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("componentIds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v20;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [PLATFORMProvisionalConnectecedComponentIdentifier alloc];
              v14 = -[PLATFORMProvisionalConnectecedComponentIdentifier initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v19);
              -[PLATFORMProvisionalConnectedComponents addComponentIds:](v5, "addComponentIds:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("representativeId"), (_QWORD)v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[PLATFORMProvisionalConnectecedComponentIdentifier initWithDictionary:]([PLATFORMProvisionalConnectecedComponentIdentifier alloc], "initWithDictionary:", v15);
      -[PLATFORMProvisionalConnectedComponents setRepresentativeId:](v5, "setRepresentativeId:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (NSArray)componentIds
{
  return self->_componentIds;
}

- (void)setComponentIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PLATFORMProvisionalConnectecedComponentIdentifier)representativeId
{
  return self->_representativeId;
}

- (void)setRepresentativeId:(id)a3
{
  objc_storeStrong((id *)&self->_representativeId, a3);
}

- (void)setHasRepresentativeId:(BOOL)a3
{
  self->_hasRepresentativeId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representativeId, 0);
  objc_storeStrong((id *)&self->_componentIds, 0);
}

@end
