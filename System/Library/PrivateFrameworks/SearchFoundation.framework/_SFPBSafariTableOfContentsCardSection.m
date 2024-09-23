@implementation _SFPBSafariTableOfContentsCardSection

- (_SFPBSafariTableOfContentsCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBSafariTableOfContentsCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _SFPBSafariTableOfContentsItem *v13;
  void *v14;
  void *v15;
  _SFPBSafariTableOfContentsCardSection *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBSafariTableOfContentsCardSection init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasTableOfContentsType"))
      -[_SFPBSafariTableOfContentsCardSection setTableOfContentsType:](v5, "setTableOfContentsType:", objc_msgSend(v4, "tableOfContentsType"));
    if (objc_msgSend(v4, "hasTableOfContentsSource"))
      -[_SFPBSafariTableOfContentsCardSection setTableOfContentsSource:](v5, "setTableOfContentsSource:", objc_msgSend(v4, "tableOfContentsSource"));
    objc_msgSend(v4, "tableOfContentsItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "tableOfContentsItems", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBSafariTableOfContentsItem initWithFacade:]([_SFPBSafariTableOfContentsItem alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    -[_SFPBSafariTableOfContentsCardSection setTableOfContentsItems:](v5, "setTableOfContentsItems:", v7);
    objc_msgSend(v4, "algorithmVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "algorithmVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSafariTableOfContentsCardSection setAlgorithmVersion:](v5, "setAlgorithmVersion:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (void)setTableOfContentsType:(int)a3
{
  self->_tableOfContentsType = a3;
}

- (void)setTableOfContentsSource:(int)a3
{
  self->_tableOfContentsSource = a3;
}

- (void)setTableOfContentsItems:(id)a3
{
  NSArray *v4;
  NSArray *tableOfContentsItems;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  tableOfContentsItems = self->_tableOfContentsItems;
  self->_tableOfContentsItems = v4;

}

- (void)clearTableOfContentsItems
{
  -[NSArray removeAllObjects](self->_tableOfContentsItems, "removeAllObjects");
}

- (void)addTableOfContentsItems:(id)a3
{
  id v4;
  NSArray *tableOfContentsItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  tableOfContentsItems = self->_tableOfContentsItems;
  v8 = v4;
  if (!tableOfContentsItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_tableOfContentsItems;
    self->_tableOfContentsItems = v6;

    v4 = v8;
    tableOfContentsItems = self->_tableOfContentsItems;
  }
  -[NSArray addObject:](tableOfContentsItems, "addObject:", v4);

}

- (unint64_t)tableOfContentsItemsCount
{
  return -[NSArray count](self->_tableOfContentsItems, "count");
}

- (id)tableOfContentsItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_tableOfContentsItems, "objectAtIndexedSubscript:", a3);
}

- (void)setAlgorithmVersion:(id)a3
{
  NSString *v4;
  NSString *algorithmVersion;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  algorithmVersion = self->_algorithmVersion;
  self->_algorithmVersion = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSafariTableOfContentsCardSectionReadFrom(self, (uint64_t)a3);
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
  if (-[_SFPBSafariTableOfContentsCardSection tableOfContentsType](self, "tableOfContentsType"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBSafariTableOfContentsCardSection tableOfContentsSource](self, "tableOfContentsSource"))
    PBDataWriterWriteInt32Field();
  -[_SFPBSafariTableOfContentsCardSection tableOfContentsItems](self, "tableOfContentsItems");
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

  -[_SFPBSafariTableOfContentsCardSection algorithmVersion](self, "algorithmVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int tableOfContentsType;
  int tableOfContentsSource;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  tableOfContentsType = self->_tableOfContentsType;
  if (tableOfContentsType != objc_msgSend(v4, "tableOfContentsType"))
    goto LABEL_14;
  tableOfContentsSource = self->_tableOfContentsSource;
  if (tableOfContentsSource != objc_msgSend(v4, "tableOfContentsSource"))
    goto LABEL_14;
  -[_SFPBSafariTableOfContentsCardSection tableOfContentsItems](self, "tableOfContentsItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableOfContentsItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_13;
  -[_SFPBSafariTableOfContentsCardSection tableOfContentsItems](self, "tableOfContentsItems");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_SFPBSafariTableOfContentsCardSection tableOfContentsItems](self, "tableOfContentsItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableOfContentsItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_14;
  }
  else
  {

  }
  -[_SFPBSafariTableOfContentsCardSection algorithmVersion](self, "algorithmVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "algorithmVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_SFPBSafariTableOfContentsCardSection algorithmVersion](self, "algorithmVersion");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_17:
      v19 = 1;
      goto LABEL_15;
    }
    v15 = (void *)v14;
    -[_SFPBSafariTableOfContentsCardSection algorithmVersion](self, "algorithmVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "algorithmVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_17;
  }
  else
  {
LABEL_13:

  }
LABEL_14:
  v19 = 0;
LABEL_15:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = (2654435761 * self->_tableOfContentsSource) ^ (2654435761 * self->_tableOfContentsType);
  v4 = -[NSArray hash](self->_tableOfContentsItems, "hash");
  return v3 ^ v4 ^ -[NSString hash](self->_algorithmVersion, "hash");
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
  uint64_t v14;
  void *v15;
  uint64_t v16;
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
  if (self->_algorithmVersion)
  {
    -[_SFPBSafariTableOfContentsCardSection algorithmVersion](self, "algorithmVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("algorithmVersion"));

  }
  if (-[NSArray count](self->_tableOfContentsItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_tableOfContentsItems;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation");
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

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("tableOfContentsItems"));
  }
  if (self->_tableOfContentsSource)
  {
    v14 = -[_SFPBSafariTableOfContentsCardSection tableOfContentsSource](self, "tableOfContentsSource");
    if (v14 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = *(&off_1E4042178 + v14);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("tableOfContentsSource"));

  }
  if (self->_tableOfContentsType)
  {
    v16 = -[_SFPBSafariTableOfContentsCardSection tableOfContentsType](self, "tableOfContentsType");
    if (v16 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = *(&off_1E4042178 + v16);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("tableOfContentsType"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBSafariTableOfContentsCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBSafariTableOfContentsCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBSafariTableOfContentsCardSection *v5;
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
    self = -[_SFPBSafariTableOfContentsCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBSafariTableOfContentsCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBSafariTableOfContentsCardSection *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _SFPBSafariTableOfContentsItem *v15;
  void *v16;
  void *v17;
  _SFPBSafariTableOfContentsCardSection *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_SFPBSafariTableOfContentsCardSection;
  v5 = -[_SFPBSafariTableOfContentsCardSection init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tableOfContentsType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSafariTableOfContentsCardSection setTableOfContentsType:](v5, "setTableOfContentsType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tableOfContentsSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSafariTableOfContentsCardSection setTableOfContentsSource:](v5, "setTableOfContentsSource:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tableOfContentsItems"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v7;
      v21 = v6;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v23;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[_SFPBSafariTableOfContentsItem initWithDictionary:]([_SFPBSafariTableOfContentsItem alloc], "initWithDictionary:", v14);
              -[_SFPBSafariTableOfContentsCardSection addTableOfContentsItems:](v5, "addTableOfContentsItems:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v11);
      }

      v7 = v20;
      v6 = v21;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("algorithmVersion"), v20, v21, (_QWORD)v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBSafariTableOfContentsCardSection setAlgorithmVersion:](v5, "setAlgorithmVersion:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (int)tableOfContentsType
{
  return self->_tableOfContentsType;
}

- (int)tableOfContentsSource
{
  return self->_tableOfContentsSource;
}

- (NSArray)tableOfContentsItems
{
  return self->_tableOfContentsItems;
}

- (NSString)algorithmVersion
{
  return self->_algorithmVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmVersion, 0);
  objc_storeStrong((id *)&self->_tableOfContentsItems, 0);
}

@end
