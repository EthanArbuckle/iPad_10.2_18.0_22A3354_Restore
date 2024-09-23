@implementation USOSchemaUSOGraphTier1

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)USOSchemaUSOGraphTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v16, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[USOSchemaUSOGraphTier1 linkId](self, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[USOSchemaUSOGraphTier1 deleteLinkId](self, "deleteLinkId");
  -[USOSchemaUSOGraphTier1 linkedUsoNodeDatas](self, "linkedUsoNodeDatas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[USOSchemaUSOGraphTier1 setLinkedUsoNodeDatas:](self, "setLinkedUsoNodeDatas:", v10);

  -[USOSchemaUSOGraphTier1 linkedUsoEntityIdentifiers](self, "linkedUsoEntityIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[USOSchemaUSOGraphTier1 setLinkedUsoEntityIdentifiers:](self, "setLinkedUsoEntityIdentifiers:", v12);

  -[USOSchemaUSOGraphTier1 linkedUsoGraphNodeDatas](self, "linkedUsoGraphNodeDatas");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[USOSchemaUSOGraphTier1 setLinkedUsoGraphNodeDatas:](self, "setLinkedUsoGraphNodeDatas:", v14);

  return v5;
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteLinkId
{
  -[USOSchemaUSOGraphTier1 setLinkId:](self, "setLinkId:", 0);
}

- (void)clearLinkedUsoNodeData
{
  -[NSArray removeAllObjects](self->_linkedUsoNodeDatas, "removeAllObjects");
}

- (void)addLinkedUsoNodeData:(id)a3
{
  id v4;
  NSArray *linkedUsoNodeDatas;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  linkedUsoNodeDatas = self->_linkedUsoNodeDatas;
  v8 = v4;
  if (!linkedUsoNodeDatas)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_linkedUsoNodeDatas;
    self->_linkedUsoNodeDatas = v6;

    v4 = v8;
    linkedUsoNodeDatas = self->_linkedUsoNodeDatas;
  }
  -[NSArray addObject:](linkedUsoNodeDatas, "addObject:", v4);

}

- (unint64_t)linkedUsoNodeDataCount
{
  return -[NSArray count](self->_linkedUsoNodeDatas, "count");
}

- (id)linkedUsoNodeDataAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_linkedUsoNodeDatas, "objectAtIndexedSubscript:", a3);
}

- (void)clearLinkedUsoEntityIdentifiers
{
  -[NSArray removeAllObjects](self->_linkedUsoEntityIdentifiers, "removeAllObjects");
}

- (void)addLinkedUsoEntityIdentifiers:(id)a3
{
  id v4;
  NSArray *linkedUsoEntityIdentifiers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  linkedUsoEntityIdentifiers = self->_linkedUsoEntityIdentifiers;
  v8 = v4;
  if (!linkedUsoEntityIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_linkedUsoEntityIdentifiers;
    self->_linkedUsoEntityIdentifiers = v6;

    v4 = v8;
    linkedUsoEntityIdentifiers = self->_linkedUsoEntityIdentifiers;
  }
  -[NSArray addObject:](linkedUsoEntityIdentifiers, "addObject:", v4);

}

- (unint64_t)linkedUsoEntityIdentifiersCount
{
  return -[NSArray count](self->_linkedUsoEntityIdentifiers, "count");
}

- (id)linkedUsoEntityIdentifiersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_linkedUsoEntityIdentifiers, "objectAtIndexedSubscript:", a3);
}

- (void)clearLinkedUsoGraphNodeData
{
  -[NSArray removeAllObjects](self->_linkedUsoGraphNodeDatas, "removeAllObjects");
}

- (void)addLinkedUsoGraphNodeData:(id)a3
{
  id v4;
  NSArray *linkedUsoGraphNodeDatas;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  linkedUsoGraphNodeDatas = self->_linkedUsoGraphNodeDatas;
  v8 = v4;
  if (!linkedUsoGraphNodeDatas)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_linkedUsoGraphNodeDatas;
    self->_linkedUsoGraphNodeDatas = v6;

    v4 = v8;
    linkedUsoGraphNodeDatas = self->_linkedUsoGraphNodeDatas;
  }
  -[NSArray addObject:](linkedUsoGraphNodeDatas, "addObject:", v4);

}

- (unint64_t)linkedUsoGraphNodeDataCount
{
  return -[NSArray count](self->_linkedUsoGraphNodeDatas, "count");
}

- (id)linkedUsoGraphNodeDataAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_linkedUsoGraphNodeDatas, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOGraphTier1ReadFrom(self, (uint64_t)a3);
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
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[USOSchemaUSOGraphTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[USOSchemaUSOGraphTier1 linkId](self, "linkId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = self->_linkedUsoNodeDatas;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
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
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v9);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = self->_linkedUsoEntityIdentifiers;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v14);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = self->_linkedUsoGraphNodeDatas;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage();
        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v19);
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
  -[USOSchemaUSOGraphTier1 linkId](self, "linkId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[USOSchemaUSOGraphTier1 linkId](self, "linkId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[USOSchemaUSOGraphTier1 linkId](self, "linkId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[USOSchemaUSOGraphTier1 linkedUsoNodeDatas](self, "linkedUsoNodeDatas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkedUsoNodeDatas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[USOSchemaUSOGraphTier1 linkedUsoNodeDatas](self, "linkedUsoNodeDatas");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[USOSchemaUSOGraphTier1 linkedUsoNodeDatas](self, "linkedUsoNodeDatas");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkedUsoNodeDatas");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[USOSchemaUSOGraphTier1 linkedUsoEntityIdentifiers](self, "linkedUsoEntityIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkedUsoEntityIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[USOSchemaUSOGraphTier1 linkedUsoEntityIdentifiers](self, "linkedUsoEntityIdentifiers");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[USOSchemaUSOGraphTier1 linkedUsoEntityIdentifiers](self, "linkedUsoEntityIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkedUsoEntityIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[USOSchemaUSOGraphTier1 linkedUsoGraphNodeDatas](self, "linkedUsoGraphNodeDatas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkedUsoGraphNodeDatas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[USOSchemaUSOGraphTier1 linkedUsoGraphNodeDatas](self, "linkedUsoGraphNodeDatas");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[USOSchemaUSOGraphTier1 linkedUsoGraphNodeDatas](self, "linkedUsoGraphNodeDatas");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkedUsoGraphNodeDatas");
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
  uint64_t v4;
  uint64_t v5;

  v3 = -[SISchemaUUID hash](self->_linkId, "hash");
  v4 = -[NSArray hash](self->_linkedUsoNodeDatas, "hash") ^ v3;
  v5 = -[NSArray hash](self->_linkedUsoEntityIdentifiers, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_linkedUsoGraphNodeDatas, "hash");
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
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_linkId)
  {
    -[USOSchemaUSOGraphTier1 linkId](self, "linkId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("linkId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("linkId"));

    }
  }
  if (-[NSArray count](self->_linkedUsoEntityIdentifiers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v8 = self->_linkedUsoEntityIdentifiers;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "dictionaryRepresentation");
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
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("linkedUsoEntityIdentifiers"));
  }
  if (-[NSArray count](self->_linkedUsoGraphNodeDatas, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v16 = self->_linkedUsoGraphNodeDatas;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v15, "addObject:", v21);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v22);

          }
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("linkedUsoGraphNodeData"));
  }
  if (-[NSArray count](self->_linkedUsoNodeDatas, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v24 = self->_linkedUsoNodeDatas;
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v33;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v33 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v32);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            objc_msgSend(v23, "addObject:", v29);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v30);

          }
        }
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      }
      while (v26);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("linkedUsoNodeData"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v32);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USOSchemaUSOGraphTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USOSchemaUSOGraphTier1)initWithJSON:(id)a3
{
  void *v4;
  USOSchemaUSOGraphTier1 *v5;
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
    self = -[USOSchemaUSOGraphTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USOSchemaUSOGraphTier1)initWithDictionary:(id)a3
{
  id v4;
  USOSchemaUSOGraphTier1 *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  USOSchemaUSONodeDataTier1 *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  USOSchemaUSOEntityIdentifierTier1 *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  USOSchemaUSOGraphNodeDataTier1 *v32;
  USOSchemaUSOGraphTier1 *v33;
  void *v35;
  void *v36;
  void *v37;
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
  v50.super_class = (Class)USOSchemaUSOGraphTier1;
  v5 = -[USOSchemaUSOGraphTier1 init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[USOSchemaUSOGraphTier1 setLinkId:](v5, "setLinkId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkedUsoNodeData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v37 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v6;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v47 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[USOSchemaUSONodeDataTier1 initWithDictionary:]([USOSchemaUSONodeDataTier1 alloc], "initWithDictionary:", v15);
              -[USOSchemaUSOGraphTier1 addLinkedUsoNodeData:](v5, "addLinkedUsoNodeData:", v16);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
        }
        while (v12);
      }

      v6 = v9;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkedUsoEntityIdentifiers"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v43 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = -[USOSchemaUSOEntityIdentifierTier1 initWithDictionary:]([USOSchemaUSOEntityIdentifierTier1 alloc], "initWithDictionary:", v23);
              -[USOSchemaUSOGraphTier1 addLinkedUsoEntityIdentifiers:](v5, "addLinkedUsoEntityIdentifiers:", v24);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        }
        while (v20);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkedUsoGraphNodeData"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = v6;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v26 = v25;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v39;
        do
        {
          for (k = 0; k != v28; ++k)
          {
            if (*(_QWORD *)v39 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v32 = -[USOSchemaUSOGraphNodeDataTier1 initWithDictionary:]([USOSchemaUSOGraphNodeDataTier1 alloc], "initWithDictionary:", v31);
              -[USOSchemaUSOGraphTier1 addLinkedUsoGraphNodeData:](v5, "addLinkedUsoGraphNodeData:", v32);

            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
        }
        while (v28);
      }

      v6 = v35;
      v17 = v36;
    }
    v33 = v5;

  }
  return v5;
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setLinkId:(id)a3
{
  objc_storeStrong((id *)&self->_linkId, a3);
}

- (NSArray)linkedUsoNodeDatas
{
  return self->_linkedUsoNodeDatas;
}

- (void)setLinkedUsoNodeDatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)linkedUsoEntityIdentifiers
{
  return self->_linkedUsoEntityIdentifiers;
}

- (void)setLinkedUsoEntityIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)linkedUsoGraphNodeDatas
{
  return self->_linkedUsoGraphNodeDatas;
}

- (void)setLinkedUsoGraphNodeDatas:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedUsoGraphNodeDatas, 0);
  objc_storeStrong((id *)&self->_linkedUsoEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_linkedUsoNodeDatas, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

@end
