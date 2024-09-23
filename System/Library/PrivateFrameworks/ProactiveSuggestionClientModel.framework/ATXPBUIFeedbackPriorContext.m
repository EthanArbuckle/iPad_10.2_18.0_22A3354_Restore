@implementation ATXPBUIFeedbackPriorContext

- (BOOL)readFrom:(id)a3
{
  return ATXPBUIFeedbackPriorContextReadFrom((char *)self, (uint64_t)a3);
}

- (void)addCacheUpdateOrdering:(id)a3
{
  id v4;
  NSMutableArray *cacheUpdateOrderings;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  cacheUpdateOrderings = self->_cacheUpdateOrderings;
  v8 = v4;
  if (!cacheUpdateOrderings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_cacheUpdateOrderings;
    self->_cacheUpdateOrderings = v6;

    v4 = v8;
    cacheUpdateOrderings = self->_cacheUpdateOrderings;
  }
  -[NSMutableArray addObject:](cacheUpdateOrderings, "addObject:", v4);

}

- (void)addClientModelCacheUpdates:(id)a3
{
  id v4;
  NSMutableArray *clientModelCacheUpdates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  clientModelCacheUpdates = self->_clientModelCacheUpdates;
  v8 = v4;
  if (!clientModelCacheUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_clientModelCacheUpdates;
    self->_clientModelCacheUpdates = v6;

    v4 = v8;
    clientModelCacheUpdates = self->_clientModelCacheUpdates;
  }
  -[NSMutableArray addObject:](clientModelCacheUpdates, "addObject:", v4);

}

- (void)addBlendingModelCacheUpdates:(id)a3
{
  id v4;
  NSMutableArray *blendingModelCacheUpdates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  blendingModelCacheUpdates = self->_blendingModelCacheUpdates;
  v8 = v4;
  if (!blendingModelCacheUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_blendingModelCacheUpdates;
    self->_blendingModelCacheUpdates = v6;

    v4 = v8;
    blendingModelCacheUpdates = self->_blendingModelCacheUpdates;
  }
  -[NSMutableArray addObject:](blendingModelCacheUpdates, "addObject:", v4);

}

- (BOOL)hasPinnedBlendingModelUICacheUpdateUUID
{
  return self->_pinnedBlendingModelUICacheUpdateUUID != 0;
}

- (NSData)context
{
  return self->_context;
}

- (NSString)contextClassString
{
  return self->_contextClassString;
}

- (NSMutableArray)clientModelCacheUpdates
{
  return self->_clientModelCacheUpdates;
}

- (unint64_t)clientModelCacheUpdatesCount
{
  return -[NSMutableArray count](self->_clientModelCacheUpdates, "count");
}

- (NSMutableArray)cacheUpdateOrderings
{
  return self->_cacheUpdateOrderings;
}

- (unint64_t)cacheUpdateOrderingsCount
{
  return -[NSMutableArray count](self->_cacheUpdateOrderings, "count");
}

- (NSMutableArray)blendingModelCacheUpdates
{
  return self->_blendingModelCacheUpdates;
}

- (unint64_t)blendingModelCacheUpdatesCount
{
  return -[NSMutableArray count](self->_blendingModelCacheUpdates, "count");
}

- (void)setContextClassString:(id)a3
{
  objc_storeStrong((id *)&self->_contextClassString, a3);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setClientModelCacheUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelCacheUpdates, a3);
}

- (void)setCacheUpdateOrderings:(id)a3
{
  objc_storeStrong((id *)&self->_cacheUpdateOrderings, a3);
}

- (void)setBlendingModelCacheUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_blendingModelCacheUpdates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedBlendingModelUICacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_contextClassString, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_clientModelCacheUpdates, 0);
  objc_storeStrong((id *)&self->_cacheUpdateOrderings, 0);
  objc_storeStrong((id *)&self->_blendingModelCacheUpdates, 0);
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
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
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
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_cacheUpdateOrderings;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_blendingModelCacheUpdates;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_clientModelCacheUpdates;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

  if (self->_context)
    PBDataWriterWriteDataField();
  if (self->_contextClassString)
    PBDataWriterWriteStringField();
  if (self->_pinnedBlendingModelUICacheUpdateUUID)
    PBDataWriterWriteStringField();

}

- (void)clearCacheUpdateOrderings
{
  -[NSMutableArray removeAllObjects](self->_cacheUpdateOrderings, "removeAllObjects");
}

- (id)cacheUpdateOrderingAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_cacheUpdateOrderings, "objectAtIndex:", a3);
}

+ (Class)cacheUpdateOrderingType
{
  return (Class)objc_opt_class();
}

- (void)clearBlendingModelCacheUpdates
{
  -[NSMutableArray removeAllObjects](self->_blendingModelCacheUpdates, "removeAllObjects");
}

- (id)blendingModelCacheUpdatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_blendingModelCacheUpdates, "objectAtIndex:", a3);
}

+ (Class)blendingModelCacheUpdatesType
{
  return (Class)objc_opt_class();
}

- (void)clearClientModelCacheUpdates
{
  -[NSMutableArray removeAllObjects](self->_clientModelCacheUpdates, "removeAllObjects");
}

- (id)clientModelCacheUpdatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_clientModelCacheUpdates, "objectAtIndex:", a3);
}

+ (Class)clientModelCacheUpdatesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasContextClassString
{
  return self->_contextClassString != 0;
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
  v8.super_class = (Class)ATXPBUIFeedbackPriorContext;
  -[ATXPBUIFeedbackPriorContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBUIFeedbackPriorContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *cacheUpdateOrderings;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSData *context;
  NSString *contextClassString;
  NSString *pinnedBlendingModelUICacheUpdateUUID;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  cacheUpdateOrderings = self->_cacheUpdateOrderings;
  if (cacheUpdateOrderings)
    objc_msgSend(v3, "setObject:forKey:", cacheUpdateOrderings, CFSTR("cacheUpdateOrdering"));
  if (-[NSMutableArray count](self->_blendingModelCacheUpdates, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_blendingModelCacheUpdates, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = self->_blendingModelCacheUpdates;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("blendingModelCacheUpdates"));
  }
  if (-[NSMutableArray count](self->_clientModelCacheUpdates, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_clientModelCacheUpdates, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = self->_clientModelCacheUpdates;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v24);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("clientModelCacheUpdates"));
  }
  context = self->_context;
  if (context)
    objc_msgSend(v4, "setObject:forKey:", context, CFSTR("context"));
  contextClassString = self->_contextClassString;
  if (contextClassString)
    objc_msgSend(v4, "setObject:forKey:", contextClassString, CFSTR("contextClassString"));
  pinnedBlendingModelUICacheUpdateUUID = self->_pinnedBlendingModelUICacheUpdateUUID;
  if (pinnedBlendingModelUICacheUpdateUUID)
    objc_msgSend(v4, "setObject:forKey:", pinnedBlendingModelUICacheUpdateUUID, CFSTR("pinnedBlendingModelUICacheUpdateUUID"));
  return v4;
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
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (-[ATXPBUIFeedbackPriorContext cacheUpdateOrderingsCount](self, "cacheUpdateOrderingsCount"))
  {
    objc_msgSend(v17, "clearCacheUpdateOrderings");
    v4 = -[ATXPBUIFeedbackPriorContext cacheUpdateOrderingsCount](self, "cacheUpdateOrderingsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ATXPBUIFeedbackPriorContext cacheUpdateOrderingAtIndex:](self, "cacheUpdateOrderingAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addCacheUpdateOrdering:", v7);

      }
    }
  }
  if (-[ATXPBUIFeedbackPriorContext blendingModelCacheUpdatesCount](self, "blendingModelCacheUpdatesCount"))
  {
    objc_msgSend(v17, "clearBlendingModelCacheUpdates");
    v8 = -[ATXPBUIFeedbackPriorContext blendingModelCacheUpdatesCount](self, "blendingModelCacheUpdatesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[ATXPBUIFeedbackPriorContext blendingModelCacheUpdatesAtIndex:](self, "blendingModelCacheUpdatesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addBlendingModelCacheUpdates:", v11);

      }
    }
  }
  if (-[ATXPBUIFeedbackPriorContext clientModelCacheUpdatesCount](self, "clientModelCacheUpdatesCount"))
  {
    objc_msgSend(v17, "clearClientModelCacheUpdates");
    v12 = -[ATXPBUIFeedbackPriorContext clientModelCacheUpdatesCount](self, "clientModelCacheUpdatesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[ATXPBUIFeedbackPriorContext clientModelCacheUpdatesAtIndex:](self, "clientModelCacheUpdatesAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addClientModelCacheUpdates:", v15);

      }
    }
  }
  if (self->_context)
    objc_msgSend(v17, "setContext:");
  v16 = v17;
  if (self->_contextClassString)
  {
    objc_msgSend(v17, "setContextClassString:");
    v16 = v17;
  }
  if (self->_pinnedBlendingModelUICacheUpdateUUID)
  {
    objc_msgSend(v17, "setPinnedBlendingModelUICacheUpdateUUID:");
    v16 = v17;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
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
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = self->_cacheUpdateOrderings;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addCacheUpdateOrdering:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v8);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = self->_blendingModelCacheUpdates;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addBlendingModelCacheUpdates:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v14);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v18 = self->_clientModelCacheUpdates;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v22), "copyWithZone:", a3, (_QWORD)v31);
        objc_msgSend(v5, "addClientModelCacheUpdates:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v20);
  }

  v24 = -[NSData copyWithZone:](self->_context, "copyWithZone:", a3);
  v25 = (void *)v5[4];
  v5[4] = v24;

  v26 = -[NSString copyWithZone:](self->_contextClassString, "copyWithZone:", a3);
  v27 = (void *)v5[5];
  v5[5] = v26;

  v28 = -[NSString copyWithZone:](self->_pinnedBlendingModelUICacheUpdateUUID, "copyWithZone:", a3);
  v29 = (void *)v5[6];
  v5[6] = v28;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *cacheUpdateOrderings;
  NSMutableArray *blendingModelCacheUpdates;
  NSMutableArray *clientModelCacheUpdates;
  NSData *context;
  NSString *contextClassString;
  NSString *pinnedBlendingModelUICacheUpdateUUID;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((cacheUpdateOrderings = self->_cacheUpdateOrderings, !((unint64_t)cacheUpdateOrderings | v4[2]))
     || -[NSMutableArray isEqual:](cacheUpdateOrderings, "isEqual:"))
    && ((blendingModelCacheUpdates = self->_blendingModelCacheUpdates,
         !((unint64_t)blendingModelCacheUpdates | v4[1]))
     || -[NSMutableArray isEqual:](blendingModelCacheUpdates, "isEqual:"))
    && ((clientModelCacheUpdates = self->_clientModelCacheUpdates, !((unint64_t)clientModelCacheUpdates | v4[3]))
     || -[NSMutableArray isEqual:](clientModelCacheUpdates, "isEqual:"))
    && ((context = self->_context, !((unint64_t)context | v4[4]))
     || -[NSData isEqual:](context, "isEqual:"))
    && ((contextClassString = self->_contextClassString, !((unint64_t)contextClassString | v4[5]))
     || -[NSString isEqual:](contextClassString, "isEqual:")))
  {
    pinnedBlendingModelUICacheUpdateUUID = self->_pinnedBlendingModelUICacheUpdateUUID;
    if ((unint64_t)pinnedBlendingModelUICacheUpdateUUID | v4[6])
      v11 = -[NSString isEqual:](pinnedBlendingModelUICacheUpdateUUID, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;

  v3 = -[NSMutableArray hash](self->_cacheUpdateOrderings, "hash");
  v4 = -[NSMutableArray hash](self->_blendingModelCacheUpdates, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_clientModelCacheUpdates, "hash");
  v6 = v4 ^ v5 ^ -[NSData hash](self->_context, "hash");
  v7 = -[NSString hash](self->_contextClassString, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_pinnedBlendingModelUICacheUpdateUUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  __int128 v20;
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
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v4[2];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        -[ATXPBUIFeedbackPriorContext addCacheUpdateOrdering:](self, "addCacheUpdateOrdering:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v4[1];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[ATXPBUIFeedbackPriorContext addBlendingModelCacheUpdates:](self, "addBlendingModelCacheUpdates:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v4[3];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[ATXPBUIFeedbackPriorContext addClientModelCacheUpdates:](self, "addClientModelCacheUpdates:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

  if (v4[4])
    -[ATXPBUIFeedbackPriorContext setContext:](self, "setContext:");
  if (v4[5])
    -[ATXPBUIFeedbackPriorContext setContextClassString:](self, "setContextClassString:");
  if (v4[6])
    -[ATXPBUIFeedbackPriorContext setPinnedBlendingModelUICacheUpdateUUID:](self, "setPinnedBlendingModelUICacheUpdateUUID:");

}

- (NSString)pinnedBlendingModelUICacheUpdateUUID
{
  return self->_pinnedBlendingModelUICacheUpdateUUID;
}

- (void)setPinnedBlendingModelUICacheUpdateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedBlendingModelUICacheUpdateUUID, a3);
}

@end
