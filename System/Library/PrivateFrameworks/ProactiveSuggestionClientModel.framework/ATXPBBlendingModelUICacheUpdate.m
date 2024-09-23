@implementation ATXPBBlendingModelUICacheUpdate

- (uint64_t)clientModelCacheUpdateUUIDStrings
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)addClientModelIds:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addClientModelCacheUpdateUUIDStrings:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (BOOL)hasSuggestionLayout
{
  if (result)
    return *(_QWORD *)(result + 56) != 0;
  return result;
}

- (uint64_t)homeScreenCachedSuggestion
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)uuidString
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (uint64_t)suggestionLayout
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)spotlightSuggestionLayout
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (BOOL)hasHomeScreenCachedSuggestion
{
  if (result)
    return *(_QWORD *)(result + 40) != 0;
  return result;
}

- (uint64_t)hasCacheCreationDate
{
  if (result)
    return *(_BYTE *)(result + 72) & 1;
  return result;
}

- (uint64_t)consumerSubTypeString
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)clientModelIds
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (double)cacheCreationDate
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (BOOL)hasSpotlightSuggestionLayout
{
  if (result)
    return *(_QWORD *)(result + 48) != 0;
  return result;
}

- (void)setUuidString:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)setConsumerSubTypeString:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (uint64_t)setCacheCreationDate:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 72) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (void)setClientModelIds:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setClientModelCacheUpdateUUIDStrings:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setHomeScreenCachedSuggestion:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBBlendingModelUICacheUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_suggestionLayout, 0);
  objc_storeStrong((id *)&self->_spotlightSuggestionLayout, 0);
  objc_storeStrong((id *)&self->_homeScreenCachedSuggestion, 0);
  objc_storeStrong((id *)&self->_consumerSubTypeString, 0);
  objc_storeStrong((id *)&self->_clientModelIds, 0);
  objc_storeStrong((id *)&self->_clientModelCacheUpdateUUIDStrings, 0);
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
  if (self->_uuidString)
    PBDataWriterWriteStringField();
  if (self->_consumerSubTypeString)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_clientModelIds;
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
  v10 = self->_clientModelCacheUpdateUUIDStrings;
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

  if (self->_homeScreenCachedSuggestion)
    PBDataWriterWriteSubmessage();
  if (self->_suggestionLayout)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_spotlightSuggestionLayout)
    PBDataWriterWriteSubmessage();

}

- (BOOL)hasUuidString
{
  if (result)
    return *(_QWORD *)(result + 64) != 0;
  return result;
}

- (BOOL)hasConsumerSubTypeString
{
  if (result)
    return *(_QWORD *)(result + 32) != 0;
  return result;
}

- (uint64_t)clearClientModelIds
{
  if (result)
    return objc_msgSend(*(id *)(result + 24), "removeAllObjects");
  return result;
}

- (uint64_t)clientModelIdsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 24), "count");
  return result;
}

- (id)clientModelIdsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[3], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearClientModelCacheUpdateUUIDStrings
{
  if (result)
    return objc_msgSend(*(id *)(result + 16), "removeAllObjects");
  return result;
}

- (uint64_t)clientModelCacheUpdateUUIDStringsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 16), "count");
  return result;
}

- (id)clientModelCacheUpdateUUIDStringsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[2], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)setHasCacheCreationDate:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 72) = *(_BYTE *)(result + 72) & 0xFE | a2;
  return result;
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
  v8.super_class = (Class)ATXPBBlendingModelUICacheUpdate;
  -[ATXPBBlendingModelUICacheUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBBlendingModelUICacheUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuidString;
  NSString *consumerSubTypeString;
  NSMutableArray *clientModelIds;
  NSMutableArray *clientModelCacheUpdateUUIDStrings;
  ATXPBHomeScreenCachedSuggestion *homeScreenCachedSuggestion;
  void *v10;
  ATXPBSuggestionLayout *suggestionLayout;
  void *v12;
  void *v13;
  ATXPBSpotlightSuggestionLayout *spotlightSuggestionLayout;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString)
    objc_msgSend(v3, "setObject:forKey:", uuidString, CFSTR("uuidString"));
  consumerSubTypeString = self->_consumerSubTypeString;
  if (consumerSubTypeString)
    objc_msgSend(v4, "setObject:forKey:", consumerSubTypeString, CFSTR("consumerSubTypeString"));
  clientModelIds = self->_clientModelIds;
  if (clientModelIds)
    objc_msgSend(v4, "setObject:forKey:", clientModelIds, CFSTR("clientModelIds"));
  clientModelCacheUpdateUUIDStrings = self->_clientModelCacheUpdateUUIDStrings;
  if (clientModelCacheUpdateUUIDStrings)
    objc_msgSend(v4, "setObject:forKey:", clientModelCacheUpdateUUIDStrings, CFSTR("clientModelCacheUpdateUUIDStrings"));
  homeScreenCachedSuggestion = self->_homeScreenCachedSuggestion;
  if (homeScreenCachedSuggestion)
  {
    -[ATXPBHomeScreenCachedSuggestion dictionaryRepresentation](homeScreenCachedSuggestion, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("homeScreenCachedSuggestion"));

  }
  suggestionLayout = self->_suggestionLayout;
  if (suggestionLayout)
  {
    -[ATXPBSuggestionLayout dictionaryRepresentation](suggestionLayout, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("suggestionLayout"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_cacheCreationDate);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("cacheCreationDate"));

  }
  spotlightSuggestionLayout = self->_spotlightSuggestionLayout;
  if (spotlightSuggestionLayout)
  {
    -[ATXPBSpotlightSuggestionLayout dictionaryRepresentation](spotlightSuggestionLayout, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("spotlightSuggestionLayout"));

  }
  return v4;
}

- (void)copyTo:(uint64_t)a1
{
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v17 = v3;
    if (v4)
      -[ATXPBBlendingModelUICacheUpdate setUuidString:]((uint64_t)v3, v4);
    v5 = *(void **)(a1 + 32);
    if (v5)
      -[ATXPBBlendingModelUICacheUpdate setConsumerSubTypeString:]((uint64_t)v17, v5);
    if (objc_msgSend(*(id *)(a1 + 24), "count"))
    {
      if (v17)
        objc_msgSend(v17[3], "removeAllObjects");
      v6 = objc_msgSend(*(id *)(a1 + 24), "count");
      if (v6)
      {
        v7 = v6;
        for (i = 0; i != v7; ++i)
        {
          objc_msgSend(*(id *)(a1 + 24), "objectAtIndex:", i);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBBlendingModelUICacheUpdate addClientModelIds:]((uint64_t)v17, v9);

        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 16), "count"))
    {
      if (v17)
        objc_msgSend(v17[2], "removeAllObjects");
      v10 = objc_msgSend(*(id *)(a1 + 16), "count");
      if (v10)
      {
        v11 = v10;
        for (j = 0; j != v11; ++j)
        {
          objc_msgSend(*(id *)(a1 + 16), "objectAtIndex:", j);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBBlendingModelUICacheUpdate addClientModelCacheUpdateUUIDStrings:]((uint64_t)v17, v13);

        }
      }
    }
    v14 = *(void **)(a1 + 40);
    if (v14)
      -[ATXPBBlendingModelUICacheUpdate setHomeScreenCachedSuggestion:]((uint64_t)v17, v14);
    v15 = *(void **)(a1 + 56);
    v3 = v17;
    if (v15)
    {
      -[ATXPBBlendingModelUICacheUpdate setSuggestionLayout:]((uint64_t)v17, v15);
      v3 = v17;
    }
    if ((*(_BYTE *)(a1 + 72) & 1) != 0)
    {
      v3[1] = *(id *)(a1 + 8);
      *((_BYTE *)v3 + 72) |= 1u;
    }
    v16 = *(void **)(a1 + 48);
    if (v16)
    {
      -[ATXPBBlendingModelUICacheUpdate setSpotlightSuggestionLayout:]((uint64_t)v17, v16);
      v3 = v17;
    }
  }

}

- (void)setSuggestionLayout:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setSpotlightSuggestionLayout:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuidString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v8 = -[NSString copyWithZone:](self->_consumerSubTypeString, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_clientModelIds;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v14), "copyWithZone:", a3);
        -[ATXPBBlendingModelUICacheUpdate addClientModelIds:](v5, v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = self->_clientModelCacheUpdateUUIDStrings;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v20), "copyWithZone:", a3, (_QWORD)v29);
        -[ATXPBBlendingModelUICacheUpdate addClientModelCacheUpdateUUIDStrings:](v5, v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v18);
  }

  v22 = -[ATXPBHomeScreenCachedSuggestion copyWithZone:](self->_homeScreenCachedSuggestion, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v22;

  v24 = -[ATXPBSuggestionLayout copyWithZone:](self->_suggestionLayout, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v24;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_cacheCreationDate;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v26 = -[ATXPBSpotlightSuggestionLayout copyWithZone:](self->_spotlightSuggestionLayout, "copyWithZone:", a3, (_QWORD)v29);
  v27 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v26;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uuidString;
  NSString *consumerSubTypeString;
  NSMutableArray *clientModelIds;
  NSMutableArray *clientModelCacheUpdateUUIDStrings;
  ATXPBHomeScreenCachedSuggestion *homeScreenCachedSuggestion;
  ATXPBSuggestionLayout *suggestionLayout;
  ATXPBSpotlightSuggestionLayout *spotlightSuggestionLayout;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:"))
      goto LABEL_21;
  }
  consumerSubTypeString = self->_consumerSubTypeString;
  if ((unint64_t)consumerSubTypeString | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](consumerSubTypeString, "isEqual:"))
      goto LABEL_21;
  }
  clientModelIds = self->_clientModelIds;
  if ((unint64_t)clientModelIds | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](clientModelIds, "isEqual:"))
      goto LABEL_21;
  }
  clientModelCacheUpdateUUIDStrings = self->_clientModelCacheUpdateUUIDStrings;
  if ((unint64_t)clientModelCacheUpdateUUIDStrings | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](clientModelCacheUpdateUUIDStrings, "isEqual:"))
      goto LABEL_21;
  }
  homeScreenCachedSuggestion = self->_homeScreenCachedSuggestion;
  if ((unint64_t)homeScreenCachedSuggestion | *((_QWORD *)v4 + 5))
  {
    if (!-[ATXPBHomeScreenCachedSuggestion isEqual:](homeScreenCachedSuggestion, "isEqual:"))
      goto LABEL_21;
  }
  suggestionLayout = self->_suggestionLayout;
  if ((unint64_t)suggestionLayout | *((_QWORD *)v4 + 7))
  {
    if (!-[ATXPBSuggestionLayout isEqual:](suggestionLayout, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_cacheCreationDate != *((double *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  spotlightSuggestionLayout = self->_spotlightSuggestionLayout;
  if ((unint64_t)spotlightSuggestionLayout | *((_QWORD *)v4 + 6))
    v12 = -[ATXPBSpotlightSuggestionLayout isEqual:](spotlightSuggestionLayout, "isEqual:");
  else
    v12 = 1;
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  double cacheCreationDate;
  double v11;
  long double v12;
  double v13;

  v3 = -[NSString hash](self->_uuidString, "hash");
  v4 = -[NSString hash](self->_consumerSubTypeString, "hash");
  v5 = -[NSMutableArray hash](self->_clientModelIds, "hash");
  v6 = -[NSMutableArray hash](self->_clientModelCacheUpdateUUIDStrings, "hash");
  v7 = -[ATXPBHomeScreenCachedSuggestion hash](self->_homeScreenCachedSuggestion, "hash");
  v8 = -[ATXPBSuggestionLayout hash](self->_suggestionLayout, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    cacheCreationDate = self->_cacheCreationDate;
    v11 = -cacheCreationDate;
    if (cacheCreationDate >= 0.0)
      v11 = self->_cacheCreationDate;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[ATXPBSpotlightSuggestionLayout hash](self->_spotlightSuggestionLayout, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  id v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = (void *)v3[8];
    if (v5)
      objc_storeStrong((id *)(a1 + 64), v5);
    v6 = (void *)*((_QWORD *)v4 + 4);
    if (v6)
      objc_storeStrong((id *)(a1 + 32), v6);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = *((id *)v4 + 3);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          -[ATXPBBlendingModelUICacheUpdate addClientModelIds:](a1, *(void **)(*((_QWORD *)&v24 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = *((id *)v4 + 2);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          -[ATXPBBlendingModelUICacheUpdate addClientModelCacheUpdateUUIDStrings:](a1, *(void **)(*((_QWORD *)&v20 + 1) + 8 * j));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v14);
    }

    v17 = (void *)*((_QWORD *)v4 + 5);
    if (*(_QWORD *)(a1 + 40))
    {
      if (v17)
        -[ATXPBHomeScreenCachedSuggestion mergeFrom:](*(_QWORD *)(a1 + 40), v17);
    }
    else if (v17)
    {
      objc_storeStrong((id *)(a1 + 40), v17);
    }
    v18 = (void *)*((_QWORD *)v4 + 7);
    if (*(_QWORD *)(a1 + 56))
    {
      if (v18)
        -[ATXPBSuggestionLayout mergeFrom:](*(_QWORD *)(a1 + 56), v18);
    }
    else if (v18)
    {
      objc_storeStrong((id *)(a1 + 56), v18);
    }
    if ((*((_BYTE *)v4 + 72) & 1) != 0)
    {
      *(_QWORD *)(a1 + 8) = *((_QWORD *)v4 + 1);
      *(_BYTE *)(a1 + 72) |= 1u;
    }
    v19 = *((_QWORD *)v4 + 6);
    if (*(_QWORD *)(a1 + 48))
    {
      if (v19)
        objc_msgSend(*(id *)(a1 + 48), "mergeFrom:", (_QWORD)v20);
    }
    else if (v19)
    {
      objc_storeStrong((id *)(a1 + 48), *((id *)v4 + 6));
    }
  }

}

@end
