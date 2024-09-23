@implementation NLXSchemaSSUBackgroundUpdateAppInfo

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

  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaSSUBackgroundUpdateAppInfo;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaSSUBackgroundUpdateAppInfo categoryInfos](self, "categoryInfos", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NLXSchemaSSUBackgroundUpdateAppInfo setCategoryInfos:](self, "setCategoryInfos:", v7);
  return v5;
}

- (BOOL)hasAppBundleIdSaltedHash
{
  return self->_appBundleIdSaltedHash != 0;
}

- (void)deleteAppBundleIdSaltedHash
{
  -[NLXSchemaSSUBackgroundUpdateAppInfo setAppBundleIdSaltedHash:](self, "setAppBundleIdSaltedHash:", 0);
}

- (void)setNumCacheFilesRemoved:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numCacheFilesRemoved = a3;
}

- (BOOL)hasNumCacheFilesRemoved
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumCacheFilesRemoved:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumCacheFilesRemoved
{
  -[NLXSchemaSSUBackgroundUpdateAppInfo setNumCacheFilesRemoved:](self, "setNumCacheFilesRemoved:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearCategoryInfos
{
  -[NSArray removeAllObjects](self->_categoryInfos, "removeAllObjects");
}

- (void)addCategoryInfos:(id)a3
{
  id v4;
  NSArray *categoryInfos;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  categoryInfos = self->_categoryInfos;
  v8 = v4;
  if (!categoryInfos)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_categoryInfos;
    self->_categoryInfos = v6;

    v4 = v8;
    categoryInfos = self->_categoryInfos;
  }
  -[NSArray addObject:](categoryInfos, "addObject:", v4);

}

- (unint64_t)categoryInfosCount
{
  return -[NSArray count](self->_categoryInfos, "count");
}

- (id)categoryInfosAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_categoryInfos, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaSSUBackgroundUpdateAppInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NLXSchemaSSUBackgroundUpdateAppInfo appBundleIdSaltedHash](self, "appBundleIdSaltedHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_categoryInfos;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unsigned int numCacheFilesRemoved;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[NLXSchemaSSUBackgroundUpdateAppInfo appBundleIdSaltedHash](self, "appBundleIdSaltedHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appBundleIdSaltedHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_14;
  -[NLXSchemaSSUBackgroundUpdateAppInfo appBundleIdSaltedHash](self, "appBundleIdSaltedHash");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NLXSchemaSSUBackgroundUpdateAppInfo appBundleIdSaltedHash](self, "appBundleIdSaltedHash");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appBundleIdSaltedHash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_15;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) != (v4[32] & 1))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    numCacheFilesRemoved = self->_numCacheFilesRemoved;
    if (numCacheFilesRemoved != objc_msgSend(v4, "numCacheFilesRemoved"))
      goto LABEL_15;
  }
  -[NLXSchemaSSUBackgroundUpdateAppInfo categoryInfos](self, "categoryInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[NLXSchemaSSUBackgroundUpdateAppInfo categoryInfos](self, "categoryInfos");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {

LABEL_18:
      v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    -[NLXSchemaSSUBackgroundUpdateAppInfo categoryInfos](self, "categoryInfos");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "categoryInfos");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
LABEL_14:

  }
LABEL_15:
  v18 = 0;
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_appBundleIdSaltedHash, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_numCacheFilesRemoved;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSArray hash](self->_categoryInfos, "hash");
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appBundleIdSaltedHash)
  {
    -[NLXSchemaSSUBackgroundUpdateAppInfo appBundleIdSaltedHash](self, "appBundleIdSaltedHash");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appBundleIdSaltedHash"));

  }
  if (-[NSArray count](self->_categoryInfos, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = self->_categoryInfos;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
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
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("categoryInfos"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NLXSchemaSSUBackgroundUpdateAppInfo numCacheFilesRemoved](self, "numCacheFilesRemoved"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("numCacheFilesRemoved"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v16);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaSSUBackgroundUpdateAppInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NLXSchemaSSUBackgroundUpdateAppInfo)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaSSUBackgroundUpdateAppInfo *v5;
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
    self = -[NLXSchemaSSUBackgroundUpdateAppInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaSSUBackgroundUpdateAppInfo)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaSSUBackgroundUpdateAppInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NLXSchemaSSUBackgroundUpdateAppCategoryInfo *v16;
  NLXSchemaSSUBackgroundUpdateAppInfo *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NLXSchemaSSUBackgroundUpdateAppInfo;
  v5 = -[NLXSchemaSSUBackgroundUpdateAppInfo init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appBundleIdSaltedHash"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[NLXSchemaSSUBackgroundUpdateAppInfo setAppBundleIdSaltedHash:](v5, "setAppBundleIdSaltedHash:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numCacheFilesRemoved"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NLXSchemaSSUBackgroundUpdateAppInfo setNumCacheFilesRemoved:](v5, "setNumCacheFilesRemoved:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("categoryInfos"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v8;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo initWithDictionary:]([NLXSchemaSSUBackgroundUpdateAppCategoryInfo alloc], "initWithDictionary:", v15);
              -[NLXSchemaSSUBackgroundUpdateAppInfo addCategoryInfos:](v5, "addCategoryInfos:", v16);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v12);
      }

      v8 = v19;
    }
    v17 = v5;

  }
  return v5;
}

- (NSString)appBundleIdSaltedHash
{
  return self->_appBundleIdSaltedHash;
}

- (void)setAppBundleIdSaltedHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unsigned)numCacheFilesRemoved
{
  return self->_numCacheFilesRemoved;
}

- (NSArray)categoryInfos
{
  return self->_categoryInfos;
}

- (void)setCategoryInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHasAppBundleIdSaltedHash:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryInfos, 0);
  objc_storeStrong((id *)&self->_appBundleIdSaltedHash, 0);
}

@end
