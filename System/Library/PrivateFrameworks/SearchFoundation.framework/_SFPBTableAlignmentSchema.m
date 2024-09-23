@implementation _SFPBTableAlignmentSchema

- (_SFPBTableAlignmentSchema)initWithFacade:(id)a3
{
  id v4;
  _SFPBTableAlignmentSchema *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _SFPBTableColumnAlignment *v13;
  void *v14;
  _SFPBStringDictionary *v15;
  void *v16;
  _SFPBStringDictionary *v17;
  _SFPBTableAlignmentSchema *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBTableAlignmentSchema init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "tableColumnAlignment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "tableColumnAlignment", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBTableColumnAlignment initWithFacade:]([_SFPBTableColumnAlignment alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    -[_SFPBTableAlignmentSchema setTableColumnAlignments:](v5, "setTableColumnAlignments:", v7);
    objc_msgSend(v4, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBStringDictionary alloc];
      objc_msgSend(v4, "metadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBStringDictionary initWithNSDictionary:](v15, "initWithNSDictionary:", v16);
      -[_SFPBTableAlignmentSchema setMetadata:](v5, "setMetadata:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (void)setTableColumnAlignment:(id)a3
{
  NSArray *v4;
  NSArray *tableColumnAlignments;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  tableColumnAlignments = self->_tableColumnAlignments;
  self->_tableColumnAlignments = v4;

}

- (void)clearTableColumnAlignment
{
  -[NSArray removeAllObjects](self->_tableColumnAlignments, "removeAllObjects");
}

- (void)addTableColumnAlignment:(id)a3
{
  id v4;
  NSArray *tableColumnAlignments;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  tableColumnAlignments = self->_tableColumnAlignments;
  v8 = v4;
  if (!tableColumnAlignments)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_tableColumnAlignments;
    self->_tableColumnAlignments = v6;

    v4 = v8;
    tableColumnAlignments = self->_tableColumnAlignments;
  }
  -[NSArray addObject:](tableColumnAlignments, "addObject:", v4);

}

- (unint64_t)tableColumnAlignmentCount
{
  return -[NSArray count](self->_tableColumnAlignments, "count");
}

- (id)tableColumnAlignmentAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_tableColumnAlignments, "objectAtIndexedSubscript:", a3);
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTableAlignmentSchemaReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBTableAlignmentSchema tableColumnAlignments](self, "tableColumnAlignments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[_SFPBTableAlignmentSchema metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteSubmessage();

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
  -[_SFPBTableAlignmentSchema tableColumnAlignments](self, "tableColumnAlignments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableColumnAlignments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBTableAlignmentSchema tableColumnAlignments](self, "tableColumnAlignments");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBTableAlignmentSchema tableColumnAlignments](self, "tableColumnAlignments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableColumnAlignments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBTableAlignmentSchema metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBTableAlignmentSchema metadata](self, "metadata");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBTableAlignmentSchema metadata](self, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
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

  v3 = -[NSArray hash](self->_tableColumnAlignments, "hash");
  return -[_SFPBStringDictionary hash](self->_metadata, "hash") ^ v3;
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
  if (self->_metadata)
  {
    -[_SFPBTableAlignmentSchema metadata](self, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("metadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("metadata"));

    }
  }
  if (-[NSArray count](self->_tableColumnAlignments, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = self->_tableColumnAlignments;
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

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("tableColumnAlignment"));
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBTableAlignmentSchema dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBTableAlignmentSchema)initWithJSON:(id)a3
{
  void *v4;
  _SFPBTableAlignmentSchema *v5;
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
    self = -[_SFPBTableAlignmentSchema initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBTableAlignmentSchema)initWithDictionary:(id)a3
{
  id v4;
  _SFPBTableAlignmentSchema *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _SFPBTableColumnAlignment *v13;
  _SFPBTableColumnAlignment *v14;
  void *v15;
  _SFPBStringDictionary *v16;
  _SFPBTableAlignmentSchema *v17;
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
  v23.super_class = (Class)_SFPBTableAlignmentSchema;
  v5 = -[_SFPBTableAlignmentSchema init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tableColumnAlignment"));
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
              v13 = [_SFPBTableColumnAlignment alloc];
              v14 = -[_SFPBTableColumnAlignment initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v19);
              -[_SFPBTableAlignmentSchema addTableColumnAlignment:](v5, "addTableColumnAlignment:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"), (_QWORD)v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[_SFPBStringDictionary initWithDictionary:]([_SFPBStringDictionary alloc], "initWithDictionary:", v15);
      -[_SFPBTableAlignmentSchema setMetadata:](v5, "setMetadata:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (NSArray)tableColumnAlignments
{
  return self->_tableColumnAlignments;
}

- (void)setTableColumnAlignments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_SFPBStringDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_tableColumnAlignments, 0);
}

@end
