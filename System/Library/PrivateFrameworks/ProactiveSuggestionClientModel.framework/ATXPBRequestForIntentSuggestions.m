@implementation ATXPBRequestForIntentSuggestions

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (void)clearBundleIds
{
  -[NSMutableArray removeAllObjects](self->_bundleIds, "removeAllObjects");
}

- (void)addBundleIds:(id)a3
{
  id v4;
  NSMutableArray *bundleIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  bundleIds = self->_bundleIds;
  v8 = v4;
  if (!bundleIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_bundleIds;
    self->_bundleIds = v6;

    v4 = v8;
    bundleIds = self->_bundleIds;
  }
  -[NSMutableArray addObject:](bundleIds, "addObject:", v4);

}

- (unint64_t)bundleIdsCount
{
  return -[NSMutableArray count](self->_bundleIds, "count");
}

- (id)bundleIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_bundleIds, "objectAtIndex:", a3);
}

+ (Class)bundleIdsType
{
  return (Class)objc_opt_class();
}

- (void)clearIntentClassNames
{
  -[NSMutableArray removeAllObjects](self->_intentClassNames, "removeAllObjects");
}

- (void)addIntentClassNames:(id)a3
{
  id v4;
  NSMutableArray *intentClassNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  intentClassNames = self->_intentClassNames;
  v8 = v4;
  if (!intentClassNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_intentClassNames;
    self->_intentClassNames = v6;

    v4 = v8;
    intentClassNames = self->_intentClassNames;
  }
  -[NSMutableArray addObject:](intentClassNames, "addObject:", v4);

}

- (unint64_t)intentClassNamesCount
{
  return -[NSMutableArray count](self->_intentClassNames, "count");
}

- (id)intentClassNamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_intentClassNames, "objectAtIndex:", a3);
}

+ (Class)intentClassNamesType
{
  return (Class)objc_opt_class();
}

- (void)setLimit:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_limit = a3;
}

- (void)setHasLimit:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLimit
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBRequestForIntentSuggestions;
  -[ATXPBRequestForIntentSuggestions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBRequestForIntentSuggestions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ATXPBRequestForSuggestions *base;
  void *v5;
  NSMutableArray *bundleIds;
  NSMutableArray *intentClassNames;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  base = self->_base;
  if (base)
  {
    -[ATXPBRequestForSuggestions dictionaryRepresentation](base, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("base"));

  }
  bundleIds = self->_bundleIds;
  if (bundleIds)
    objc_msgSend(v3, "setObject:forKey:", bundleIds, CFSTR("bundleIds"));
  intentClassNames = self->_intentClassNames;
  if (intentClassNames)
    objc_msgSend(v3, "setObject:forKey:", intentClassNames, CFSTR("intentClassNames"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_limit);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("limit"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBRequestForIntentSuggestionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
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
  if (self->_base)
    PBDataWriterWriteSubmessage();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_bundleIds;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
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
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_intentClassNames;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
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
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id v12;

  v12 = a3;
  if (self->_base)
    objc_msgSend(v12, "setBase:");
  if (-[ATXPBRequestForIntentSuggestions bundleIdsCount](self, "bundleIdsCount"))
  {
    objc_msgSend(v12, "clearBundleIds");
    v4 = -[ATXPBRequestForIntentSuggestions bundleIdsCount](self, "bundleIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ATXPBRequestForIntentSuggestions bundleIdsAtIndex:](self, "bundleIdsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addBundleIds:", v7);

      }
    }
  }
  if (-[ATXPBRequestForIntentSuggestions intentClassNamesCount](self, "intentClassNamesCount"))
  {
    objc_msgSend(v12, "clearIntentClassNames");
    v8 = -[ATXPBRequestForIntentSuggestions intentClassNamesCount](self, "intentClassNamesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[ATXPBRequestForIntentSuggestions intentClassNamesAtIndex:](self, "intentClassNamesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addIntentClassNames:", v11);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v12 + 8) = self->_limit;
    *((_BYTE *)v12 + 36) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ATXPBRequestForSuggestions copyWithZone:](self->_base, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_bundleIds;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBundleIds:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_intentClassNames;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addIntentClassNames:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_limit;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ATXPBRequestForSuggestions *base;
  NSMutableArray *bundleIds;
  NSMutableArray *intentClassNames;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  base = self->_base;
  if ((unint64_t)base | *((_QWORD *)v4 + 1))
  {
    if (!-[ATXPBRequestForSuggestions isEqual:](base, "isEqual:"))
      goto LABEL_12;
  }
  bundleIds = self->_bundleIds;
  if ((unint64_t)bundleIds | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](bundleIds, "isEqual:"))
      goto LABEL_12;
  }
  intentClassNames = self->_intentClassNames;
  if ((unint64_t)intentClassNames | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](intentClassNames, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0 && self->_limit == *((_DWORD *)v4 + 8))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[ATXPBRequestForSuggestions hash](self->_base, "hash");
  v4 = -[NSMutableArray hash](self->_bundleIds, "hash");
  v5 = -[NSMutableArray hash](self->_intentClassNames, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_limit;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ATXPBRequestForSuggestions *base;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
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
  base = self->_base;
  v6 = *((_QWORD *)v4 + 1);
  if (base)
  {
    if (v6)
      -[ATXPBRequestForSuggestions mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[ATXPBRequestForIntentSuggestions setBase:](self, "setBase:");
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[ATXPBRequestForIntentSuggestions addBundleIds:](self, "addBundleIds:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v4 + 3);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[ATXPBRequestForIntentSuggestions addIntentClassNames:](self, "addIntentClassNames:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_limit = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (ATXPBRequestForSuggestions)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
  objc_storeStrong((id *)&self->_base, a3);
}

- (NSMutableArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIds, a3);
}

- (NSMutableArray)intentClassNames
{
  return self->_intentClassNames;
}

- (void)setIntentClassNames:(id)a3
{
  objc_storeStrong((id *)&self->_intentClassNames, a3);
}

- (int)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentClassNames, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
