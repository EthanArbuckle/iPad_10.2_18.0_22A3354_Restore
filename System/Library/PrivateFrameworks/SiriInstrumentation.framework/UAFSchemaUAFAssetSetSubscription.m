@implementation UAFSchemaUAFAssetSetSubscription

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

  v11.receiver = self;
  v11.super_class = (Class)UAFSchemaUAFAssetSetSubscription;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v11, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFSchemaUAFAssetSetSubscription assetSetUsages](self, "assetSetUsages", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFSchemaUAFAssetSetSubscription setAssetSetUsages:](self, "setAssetSetUsages:", v7);

  -[UAFSchemaUAFAssetSetSubscription usageAliases](self, "usageAliases");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UAFSchemaUAFAssetSetSubscription setUsageAliases:](self, "setUsageAliases:", v9);
  return v5;
}

- (BOOL)hasSubscriptionName
{
  return self->_subscriptionName != 0;
}

- (void)deleteSubscriptionName
{
  -[UAFSchemaUAFAssetSetSubscription setSubscriptionName:](self, "setSubscriptionName:", 0);
}

- (void)clearAssetSetIndices
{
  -[NSArray removeAllObjects](self->_assetSetIndices, "removeAllObjects");
}

- (void)addAssetSetIndices:(unsigned int)a3
{
  uint64_t v3;
  NSArray *assetSetIndices;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  assetSetIndices = self->_assetSetIndices;
  if (!assetSetIndices)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_assetSetIndices;
    self->_assetSetIndices = v6;

    assetSetIndices = self->_assetSetIndices;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](assetSetIndices, "addObject:", v8);

}

- (unint64_t)assetSetIndicesCount
{
  return -[NSArray count](self->_assetSetIndices, "count");
}

- (unsigned)assetSetIndicesAtIndex:(unint64_t)a3
{
  void *v3;
  unsigned int v4;

  -[NSArray objectAtIndexedSubscript:](self->_assetSetIndices, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (void)clearAssetSetUsages
{
  -[NSArray removeAllObjects](self->_assetSetUsages, "removeAllObjects");
}

- (void)addAssetSetUsages:(id)a3
{
  id v4;
  NSArray *assetSetUsages;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  assetSetUsages = self->_assetSetUsages;
  v8 = v4;
  if (!assetSetUsages)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_assetSetUsages;
    self->_assetSetUsages = v6;

    v4 = v8;
    assetSetUsages = self->_assetSetUsages;
  }
  -[NSArray addObject:](assetSetUsages, "addObject:", v4);

}

- (unint64_t)assetSetUsagesCount
{
  return -[NSArray count](self->_assetSetUsages, "count");
}

- (id)assetSetUsagesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_assetSetUsages, "objectAtIndexedSubscript:", a3);
}

- (void)clearUsageAliases
{
  -[NSArray removeAllObjects](self->_usageAliases, "removeAllObjects");
}

- (void)addUsageAliases:(id)a3
{
  id v4;
  NSArray *usageAliases;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  usageAliases = self->_usageAliases;
  v8 = v4;
  if (!usageAliases)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_usageAliases;
    self->_usageAliases = v6;

    v4 = v8;
    usageAliases = self->_usageAliases;
  }
  -[NSArray addObject:](usageAliases, "addObject:", v4);

}

- (unint64_t)usageAliasesCount
{
  return -[NSArray count](self->_usageAliases, "count");
}

- (id)usageAliasesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_usageAliases, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFAssetSetSubscriptionReadFrom(self, (uint64_t)a3);
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
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UAFSchemaUAFAssetSetSubscription subscriptionName](self, "subscriptionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_assetSetIndices;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v10), "unsignedIntValue");
        PBDataWriterWriteUint32Field();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_assetSetUsages;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_usageAliases;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
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
  -[UAFSchemaUAFAssetSetSubscription subscriptionName](self, "subscriptionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[UAFSchemaUAFAssetSetSubscription subscriptionName](self, "subscriptionName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[UAFSchemaUAFAssetSetSubscription subscriptionName](self, "subscriptionName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subscriptionName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[UAFSchemaUAFAssetSetSubscription assetSetIndices](self, "assetSetIndices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSetIndices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[UAFSchemaUAFAssetSetSubscription assetSetIndices](self, "assetSetIndices");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[UAFSchemaUAFAssetSetSubscription assetSetIndices](self, "assetSetIndices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetSetIndices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[UAFSchemaUAFAssetSetSubscription assetSetUsages](self, "assetSetUsages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSetUsages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[UAFSchemaUAFAssetSetSubscription assetSetUsages](self, "assetSetUsages");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[UAFSchemaUAFAssetSetSubscription assetSetUsages](self, "assetSetUsages");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetSetUsages");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[UAFSchemaUAFAssetSetSubscription usageAliases](self, "usageAliases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usageAliases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[UAFSchemaUAFAssetSetSubscription usageAliases](self, "usageAliases");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[UAFSchemaUAFAssetSetSubscription usageAliases](self, "usageAliases");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "usageAliases");
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
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_subscriptionName, "hash");
  v4 = -[NSArray hash](self->_assetSetIndices, "hash") ^ v3;
  v5 = -[NSArray hash](self->_assetSetUsages, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_usageAliases, "hash");
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
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_assetSetIndices, "count"))
  {
    -[UAFSchemaUAFAssetSetSubscription assetSetIndices](self, "assetSetIndices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetSetIndices"));

  }
  if (-[NSArray count](self->_assetSetUsages, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = self->_assetSetUsages;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dictionaryRepresentation");
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
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("assetSetUsages"));
  }
  if (self->_subscriptionName)
  {
    -[UAFSchemaUAFAssetSetSubscription subscriptionName](self, "subscriptionName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("subscriptionName"));

  }
  if (-[NSArray count](self->_usageAliases, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = self->_usageAliases;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v25);
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
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("usageAliases"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v25);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[UAFSchemaUAFAssetSetSubscription dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (UAFSchemaUAFAssetSetSubscription)initWithJSON:(id)a3
{
  void *v4;
  UAFSchemaUAFAssetSetSubscription *v5;
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
    self = -[UAFSchemaUAFAssetSetSubscription initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (UAFSchemaUAFAssetSetSubscription)initWithDictionary:(id)a3
{
  id v4;
  UAFSchemaUAFAssetSetSubscription *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  UAFSchemaUAFAssetSetUsage *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  UAFSchemaUAFAssetUsageAlias *v31;
  UAFSchemaUAFAssetSetSubscription *v32;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
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
  objc_super v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)UAFSchemaUAFAssetSetSubscription;
  v5 = -[UAFSchemaUAFAssetSetSubscription init](&v48, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subscriptionName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[UAFSchemaUAFAssetSetSubscription setSubscriptionName:](v5, "setSubscriptionName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSetIndices"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v6;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v45 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[UAFSchemaUAFAssetSetSubscription addAssetSetIndices:](v5, "addAssetSetIndices:", objc_msgSend(v15, "unsignedIntValue"));
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
        }
        while (v12);
      }

      v6 = v9;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetSetUsages"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v41 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = -[UAFSchemaUAFAssetSetUsage initWithDictionary:]([UAFSchemaUAFAssetSetUsage alloc], "initWithDictionary:", v22);
              -[UAFSchemaUAFAssetSetSubscription addAssetSetUsages:](v5, "addAssetSetUsages:", v23);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        }
        while (v19);
      }

      v8 = v35;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageAliases"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v6;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v37;
        do
        {
          for (k = 0; k != v27; ++k)
          {
            if (*(_QWORD *)v37 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v31 = -[UAFSchemaUAFAssetUsageAlias initWithDictionary:]([UAFSchemaUAFAssetUsageAlias alloc], "initWithDictionary:", v30);
              -[UAFSchemaUAFAssetSetSubscription addUsageAliases:](v5, "addUsageAliases:", v31);

            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
        }
        while (v27);
      }

      v6 = v34;
      v8 = v35;
    }
    v32 = v5;

  }
  return v5;
}

- (NSString)subscriptionName
{
  return self->_subscriptionName;
}

- (void)setSubscriptionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)assetSetIndices
{
  return self->_assetSetIndices;
}

- (void)setAssetSetIndices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)assetSetUsages
{
  return self->_assetSetUsages;
}

- (void)setAssetSetUsages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)usageAliases
{
  return self->_usageAliases;
}

- (void)setUsageAliases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasSubscriptionName:(BOOL)a3
{
  self->_hasSubscriptionName = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageAliases, 0);
  objc_storeStrong((id *)&self->_assetSetUsages, 0);
  objc_storeStrong((id *)&self->_assetSetIndices, 0);
  objc_storeStrong((id *)&self->_subscriptionName, 0);
}

@end
