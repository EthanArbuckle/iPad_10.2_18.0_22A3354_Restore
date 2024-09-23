@implementation _SFPBCoreSpotlightCopyItem

- (_SFPBCoreSpotlightCopyItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBCoreSpotlightCopyItem *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _SFPBCoreSpotlightCopyItem *v24;
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
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBCoreSpotlightCopyItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "dataProviderTypeIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "dataProviderTypeIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          if (*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i))
            objc_msgSend(v7, "addObject:");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v10);
    }

    -[_SFPBCoreSpotlightCopyItem setDataProviderTypeIdentifiers:](v5, "setDataProviderTypeIdentifiers:", v7);
    objc_msgSend(v4, "fileProviderTypeIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v14 = 0;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v4, "fileProviderTypeIdentifiers", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          if (*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j))
            objc_msgSend(v14, "addObject:");
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v17);
    }

    -[_SFPBCoreSpotlightCopyItem setFileProviderTypeIdentifiers:](v5, "setFileProviderTypeIdentifiers:", v14);
    objc_msgSend(v4, "applicationBundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCoreSpotlightCopyItem setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v21);

    }
    objc_msgSend(v4, "coreSpotlightIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "coreSpotlightIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCoreSpotlightCopyItem setCoreSpotlightIdentifier:](v5, "setCoreSpotlightIdentifier:", v23);

    }
    v24 = v5;

  }
  return v5;
}

- (void)setDataProviderTypeIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *dataProviderTypeIdentifiers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  dataProviderTypeIdentifiers = self->_dataProviderTypeIdentifiers;
  self->_dataProviderTypeIdentifiers = v4;

}

- (void)clearDataProviderTypeIdentifiers
{
  -[NSArray removeAllObjects](self->_dataProviderTypeIdentifiers, "removeAllObjects");
}

- (void)addDataProviderTypeIdentifiers:(id)a3
{
  id v4;
  NSArray *dataProviderTypeIdentifiers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  dataProviderTypeIdentifiers = self->_dataProviderTypeIdentifiers;
  v8 = v4;
  if (!dataProviderTypeIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_dataProviderTypeIdentifiers;
    self->_dataProviderTypeIdentifiers = v6;

    v4 = v8;
    dataProviderTypeIdentifiers = self->_dataProviderTypeIdentifiers;
  }
  -[NSArray addObject:](dataProviderTypeIdentifiers, "addObject:", v4);

}

- (unint64_t)dataProviderTypeIdentifiersCount
{
  return -[NSArray count](self->_dataProviderTypeIdentifiers, "count");
}

- (id)dataProviderTypeIdentifiersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_dataProviderTypeIdentifiers, "objectAtIndexedSubscript:", a3);
}

- (void)setFileProviderTypeIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *fileProviderTypeIdentifiers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  fileProviderTypeIdentifiers = self->_fileProviderTypeIdentifiers;
  self->_fileProviderTypeIdentifiers = v4;

}

- (void)clearFileProviderTypeIdentifiers
{
  -[NSArray removeAllObjects](self->_fileProviderTypeIdentifiers, "removeAllObjects");
}

- (void)addFileProviderTypeIdentifiers:(id)a3
{
  id v4;
  NSArray *fileProviderTypeIdentifiers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  fileProviderTypeIdentifiers = self->_fileProviderTypeIdentifiers;
  v8 = v4;
  if (!fileProviderTypeIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_fileProviderTypeIdentifiers;
    self->_fileProviderTypeIdentifiers = v6;

    v4 = v8;
    fileProviderTypeIdentifiers = self->_fileProviderTypeIdentifiers;
  }
  -[NSArray addObject:](fileProviderTypeIdentifiers, "addObject:", v4);

}

- (unint64_t)fileProviderTypeIdentifiersCount
{
  return -[NSArray count](self->_fileProviderTypeIdentifiers, "count");
}

- (id)fileProviderTypeIdentifiersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_fileProviderTypeIdentifiers, "objectAtIndexedSubscript:", a3);
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *applicationBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  self->_applicationBundleIdentifier = v4;

}

- (void)setCoreSpotlightIdentifier:(id)a3
{
  NSString *v4;
  NSString *coreSpotlightIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  coreSpotlightIdentifier = self->_coreSpotlightIdentifier;
  self->_coreSpotlightIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCoreSpotlightCopyItemReadFrom(self, (uint64_t)a3);
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBCoreSpotlightCopyItem dataProviderTypeIdentifiers](self, "dataProviderTypeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  -[_SFPBCoreSpotlightCopyItem fileProviderTypeIdentifiers](self, "fileProviderTypeIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  -[_SFPBCoreSpotlightCopyItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteStringField();

  -[_SFPBCoreSpotlightCopyItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
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
  -[_SFPBCoreSpotlightCopyItem dataProviderTypeIdentifiers](self, "dataProviderTypeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataProviderTypeIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBCoreSpotlightCopyItem dataProviderTypeIdentifiers](self, "dataProviderTypeIdentifiers");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBCoreSpotlightCopyItem dataProviderTypeIdentifiers](self, "dataProviderTypeIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataProviderTypeIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBCoreSpotlightCopyItem fileProviderTypeIdentifiers](self, "fileProviderTypeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileProviderTypeIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBCoreSpotlightCopyItem fileProviderTypeIdentifiers](self, "fileProviderTypeIdentifiers");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBCoreSpotlightCopyItem fileProviderTypeIdentifiers](self, "fileProviderTypeIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileProviderTypeIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBCoreSpotlightCopyItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBCoreSpotlightCopyItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBCoreSpotlightCopyItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationBundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBCoreSpotlightCopyItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreSpotlightIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBCoreSpotlightCopyItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_SFPBCoreSpotlightCopyItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coreSpotlightIdentifier");
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

  v3 = -[NSArray hash](self->_dataProviderTypeIdentifiers, "hash");
  v4 = -[NSArray hash](self->_fileProviderTypeIdentifiers, "hash") ^ v3;
  v5 = -[NSString hash](self->_applicationBundleIdentifier, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_coreSpotlightIdentifier, "hash");
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
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_applicationBundleIdentifier)
  {
    -[_SFPBCoreSpotlightCopyItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("applicationBundleIdentifier"));

  }
  if (self->_coreSpotlightIdentifier)
  {
    -[_SFPBCoreSpotlightCopyItem coreSpotlightIdentifier](self, "coreSpotlightIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("coreSpotlightIdentifier"));

  }
  if (self->_dataProviderTypeIdentifiers)
  {
    -[_SFPBCoreSpotlightCopyItem dataProviderTypeIdentifiers](self, "dataProviderTypeIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dataProviderTypeIdentifiers"));

  }
  if (self->_fileProviderTypeIdentifiers)
  {
    -[_SFPBCoreSpotlightCopyItem fileProviderTypeIdentifiers](self, "fileProviderTypeIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("fileProviderTypeIdentifiers"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCoreSpotlightCopyItem dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCoreSpotlightCopyItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCoreSpotlightCopyItem *v5;
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
    self = -[_SFPBCoreSpotlightCopyItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCoreSpotlightCopyItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCoreSpotlightCopyItem *v5;
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
  void *v24;
  void *v25;
  _SFPBCoreSpotlightCopyItem *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)_SFPBCoreSpotlightCopyItem;
  v5 = -[_SFPBCoreSpotlightCopyItem init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataProviderTypeIdentifiers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v33;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v33 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = (void *)objc_msgSend(v12, "copy");
              -[_SFPBCoreSpotlightCopyItem addDataProviderTypeIdentifiers:](v5, "addDataProviderTypeIdentifiers:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fileProviderTypeIdentifiers"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v29;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v19);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = (void *)objc_msgSend(v20, "copy", (_QWORD)v28);
              -[_SFPBCoreSpotlightCopyItem addFileProviderTypeIdentifiers:](v5, "addFileProviderTypeIdentifiers:", v21);

            }
            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        }
        while (v17);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationBundleIdentifier"), (_QWORD)v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (void *)objc_msgSend(v22, "copy");
      -[_SFPBCoreSpotlightCopyItem setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coreSpotlightIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(v24, "copy");
      -[_SFPBCoreSpotlightCopyItem setCoreSpotlightIdentifier:](v5, "setCoreSpotlightIdentifier:", v25);

    }
    v26 = v5;

  }
  return v5;
}

- (NSArray)dataProviderTypeIdentifiers
{
  return self->_dataProviderTypeIdentifiers;
}

- (NSArray)fileProviderTypeIdentifiers
{
  return self->_fileProviderTypeIdentifiers;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_fileProviderTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_dataProviderTypeIdentifiers, 0);
}

@end
