@implementation UAFSchemaUAFAssetSetStatus

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
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UAFSchemaUAFAssetSetStatus;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFSchemaUAFAssetSetStatus uafAssetSets](self, "uafAssetSets", v13.receiver, v13.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFSchemaUAFAssetSetStatus setUafAssetSets:](self, "setUafAssetSets:", v7);

  -[UAFSchemaUAFAssetSetStatus uafAssetSubscriptions](self, "uafAssetSubscriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFSchemaUAFAssetSetStatus setUafAssetSubscriptions:](self, "setUafAssetSubscriptions:", v9);

  -[UAFSchemaUAFAssetSetStatus allAssets](self, "allAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UAFSchemaUAFAssetSetStatus setAllAssets:](self, "setAllAssets:", v11);
  return v5;
}

- (void)clearUafAssetSets
{
  -[NSArray removeAllObjects](self->_uafAssetSets, "removeAllObjects");
}

- (void)addUafAssetSets:(id)a3
{
  id v4;
  NSArray *uafAssetSets;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  uafAssetSets = self->_uafAssetSets;
  v8 = v4;
  if (!uafAssetSets)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_uafAssetSets;
    self->_uafAssetSets = v6;

    v4 = v8;
    uafAssetSets = self->_uafAssetSets;
  }
  -[NSArray addObject:](uafAssetSets, "addObject:", v4);

}

- (unint64_t)uafAssetSetsCount
{
  return -[NSArray count](self->_uafAssetSets, "count");
}

- (id)uafAssetSetsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_uafAssetSets, "objectAtIndexedSubscript:", a3);
}

- (void)clearUafAssetSubscriptions
{
  -[NSArray removeAllObjects](self->_uafAssetSubscriptions, "removeAllObjects");
}

- (void)addUafAssetSubscriptions:(id)a3
{
  id v4;
  NSArray *uafAssetSubscriptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  uafAssetSubscriptions = self->_uafAssetSubscriptions;
  v8 = v4;
  if (!uafAssetSubscriptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_uafAssetSubscriptions;
    self->_uafAssetSubscriptions = v6;

    v4 = v8;
    uafAssetSubscriptions = self->_uafAssetSubscriptions;
  }
  -[NSArray addObject:](uafAssetSubscriptions, "addObject:", v4);

}

- (unint64_t)uafAssetSubscriptionsCount
{
  return -[NSArray count](self->_uafAssetSubscriptions, "count");
}

- (id)uafAssetSubscriptionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_uafAssetSubscriptions, "objectAtIndexedSubscript:", a3);
}

- (void)clearAllAssets
{
  -[NSArray removeAllObjects](self->_allAssets, "removeAllObjects");
}

- (void)addAllAssets:(id)a3
{
  id v4;
  NSArray *allAssets;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  allAssets = self->_allAssets;
  v8 = v4;
  if (!allAssets)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_allAssets;
    self->_allAssets = v6;

    v4 = v8;
    allAssets = self->_allAssets;
  }
  -[NSArray addObject:](allAssets, "addObject:", v4);

}

- (unint64_t)allAssetsCount
{
  return -[NSArray count](self->_allAssets, "count");
}

- (id)allAssetsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_allAssets, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFAssetSetStatusReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
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
  v5 = self->_uafAssetSets;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_uafAssetSubscriptions;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
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
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_allAssets;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
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
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[UAFSchemaUAFAssetSetStatus uafAssetSets](self, "uafAssetSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uafAssetSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[UAFSchemaUAFAssetSetStatus uafAssetSets](self, "uafAssetSets");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[UAFSchemaUAFAssetSetStatus uafAssetSets](self, "uafAssetSets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uafAssetSets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[UAFSchemaUAFAssetSetStatus uafAssetSubscriptions](self, "uafAssetSubscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uafAssetSubscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[UAFSchemaUAFAssetSetStatus uafAssetSubscriptions](self, "uafAssetSubscriptions");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[UAFSchemaUAFAssetSetStatus uafAssetSubscriptions](self, "uafAssetSubscriptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uafAssetSubscriptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[UAFSchemaUAFAssetSetStatus allAssets](self, "allAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[UAFSchemaUAFAssetSetStatus allAssets](self, "allAssets");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[UAFSchemaUAFAssetSetStatus allAssets](self, "allAssets");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allAssets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSArray hash](self->_uafAssetSets, "hash");
  v4 = -[NSArray hash](self->_uafAssetSubscriptions, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_allAssets, "hash");
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
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
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
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_allAssets, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v5 = self->_allAssets;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v38 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "dictionaryRepresentation");
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("allAssets"));
  }
  if (-[NSArray count](self->_uafAssetSets, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v13 = self->_uafAssetSets;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v12, "addObject:", v18);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v19);

          }
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("uafAssetSets"));
  }
  if (-[NSArray count](self->_uafAssetSubscriptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = self->_uafAssetSubscriptions;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v30;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v29);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v20, "addObject:", v26);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v27);

          }
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("uafAssetSubscriptions"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v29);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[UAFSchemaUAFAssetSetStatus dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (UAFSchemaUAFAssetSetStatus)initWithJSON:(id)a3
{
  void *v4;
  UAFSchemaUAFAssetSetStatus *v5;
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
    self = -[UAFSchemaUAFAssetSetStatus initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (UAFSchemaUAFAssetSetStatus)initWithDictionary:(id)a3
{
  id v4;
  UAFSchemaUAFAssetSetStatus *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UAFSchemaUAFAssetSet *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  UAFSchemaUAFAssetSubscriberSubscriptions *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  UAFSchemaUAFAssetMetadata *v30;
  UAFSchemaUAFAssetSetStatus *v31;
  void *v33;
  void *v34;
  __int128 v35;
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
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)UAFSchemaUAFAssetSetStatus;
  v5 = -[UAFSchemaUAFAssetSetStatus init](&v47, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uafAssetSets"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v7 = v6;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v44;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v44 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = -[UAFSchemaUAFAssetSet initWithDictionary:]([UAFSchemaUAFAssetSet alloc], "initWithDictionary:", v13);
              -[UAFSchemaUAFAssetSetStatus addUafAssetSets:](v5, "addUafAssetSets:", v14);

            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        }
        while (v10);
      }

      v6 = v7;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uafAssetSubscriptions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v34 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v40;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v40 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v20);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = -[UAFSchemaUAFAssetSubscriberSubscriptions initWithDictionary:]([UAFSchemaUAFAssetSubscriberSubscriptions alloc], "initWithDictionary:", v21);
              -[UAFSchemaUAFAssetSetStatus addUafAssetSubscriptions:](v5, "addUafAssetSubscriptions:", v22);

            }
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
        }
        while (v18);
      }

      v15 = v34;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allAssets"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = v6;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v36;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v36 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v28);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = -[UAFSchemaUAFAssetMetadata initWithDictionary:]([UAFSchemaUAFAssetMetadata alloc], "initWithDictionary:", v29);
              -[UAFSchemaUAFAssetSetStatus addAllAssets:](v5, "addAllAssets:", v30);

            }
            ++v28;
          }
          while (v26 != v28);
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
        }
        while (v26);
      }

      v6 = v33;
      v15 = v34;
    }
    v31 = v5;

  }
  return v5;
}

- (NSArray)uafAssetSets
{
  return self->_uafAssetSets;
}

- (void)setUafAssetSets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)uafAssetSubscriptions
{
  return self->_uafAssetSubscriptions;
}

- (void)setUafAssetSubscriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)allAssets
{
  return self->_allAssets;
}

- (void)setAllAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAssets, 0);
  objc_storeStrong((id *)&self->_uafAssetSubscriptions, 0);
  objc_storeStrong((id *)&self->_uafAssetSets, 0);
}

@end
