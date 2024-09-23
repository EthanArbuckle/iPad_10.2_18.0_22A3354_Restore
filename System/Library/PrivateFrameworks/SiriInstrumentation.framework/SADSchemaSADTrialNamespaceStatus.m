@implementation SADSchemaSADTrialNamespaceStatus

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
  int v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SADSchemaSADTrialNamespaceStatus;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SADSchemaSADTrialNamespaceStatus namespaceCompatabilityVersion](self, "namespaceCompatabilityVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[SADSchemaSADTrialNamespaceStatus deleteNamespaceCompatabilityVersion](self, "deleteNamespaceCompatabilityVersion");
  -[SADSchemaSADTrialNamespaceStatus rollout](self, "rollout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[SADSchemaSADTrialNamespaceStatus deleteRollout](self, "deleteRollout");
  -[SADSchemaSADTrialNamespaceStatus assets](self, "assets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SADSchemaSADTrialNamespaceStatus setAssets:](self, "setAssets:", v13);

  return v5;
}

- (BOOL)hasNamespaceCompatabilityVersion
{
  return self->_namespaceCompatabilityVersion != 0;
}

- (void)deleteNamespaceCompatabilityVersion
{
  -[SADSchemaSADTrialNamespaceStatus setNamespaceCompatabilityVersion:](self, "setNamespaceCompatabilityVersion:", 0);
}

- (BOOL)hasRollout
{
  return self->_rollout != 0;
}

- (void)deleteRollout
{
  -[SADSchemaSADTrialNamespaceStatus setRollout:](self, "setRollout:", 0);
}

- (void)clearAssets
{
  -[NSArray removeAllObjects](self->_assets, "removeAllObjects");
}

- (void)addAssets:(id)a3
{
  id v4;
  NSArray *assets;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  assets = self->_assets;
  v8 = v4;
  if (!assets)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_assets;
    self->_assets = v6;

    v4 = v8;
    assets = self->_assets;
  }
  -[NSArray addObject:](assets, "addObject:", v4);

}

- (unint64_t)assetsCount
{
  return -[NSArray count](self->_assets, "count");
}

- (id)assetsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_assets, "objectAtIndexedSubscript:", a3);
}

- (void)setTrialNamespace:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_trialNamespace = a3;
}

- (BOOL)hasTrialNamespace
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasTrialNamespace:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteTrialNamespace
{
  -[SADSchemaSADTrialNamespaceStatus setTrialNamespace:](self, "setTrialNamespace:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SADSchemaSADTrialNamespaceStatusReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SADSchemaSADTrialNamespaceStatus namespaceCompatabilityVersion](self, "namespaceCompatabilityVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SADSchemaSADTrialNamespaceStatus namespaceCompatabilityVersion](self, "namespaceCompatabilityVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[SADSchemaSADTrialNamespaceStatus rollout](self, "rollout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SADSchemaSADTrialNamespaceStatus rollout](self, "rollout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_assets;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

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
  BOOL v22;
  int trialNamespace;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[SADSchemaSADTrialNamespaceStatus namespaceCompatabilityVersion](self, "namespaceCompatabilityVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namespaceCompatabilityVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SADSchemaSADTrialNamespaceStatus namespaceCompatabilityVersion](self, "namespaceCompatabilityVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SADSchemaSADTrialNamespaceStatus namespaceCompatabilityVersion](self, "namespaceCompatabilityVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "namespaceCompatabilityVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[SADSchemaSADTrialNamespaceStatus rollout](self, "rollout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rollout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[SADSchemaSADTrialNamespaceStatus rollout](self, "rollout");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[SADSchemaSADTrialNamespaceStatus rollout](self, "rollout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rollout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[SADSchemaSADTrialNamespaceStatus assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[SADSchemaSADTrialNamespaceStatus assets](self, "assets");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[SADSchemaSADTrialNamespaceStatus assets](self, "assets");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  if ((*(_BYTE *)&self->_has & 1) == (v4[36] & 1))
  {
    if ((*(_BYTE *)&self->_has & 1) == 0
      || (trialNamespace = self->_trialNamespace, trialNamespace == objc_msgSend(v4, "trialNamespace")))
    {
      v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[SISchemaVersion hash](self->_namespaceCompatabilityVersion, "hash");
  v4 = -[SADSchemaSADTrialRollout hash](self->_rollout, "hash");
  v5 = -[NSArray hash](self->_assets, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_trialNamespace;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  const __CFString *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_assets, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = self->_assets;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v21);
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("assets"));
  }
  if (self->_namespaceCompatabilityVersion)
  {
    -[SADSchemaSADTrialNamespaceStatus namespaceCompatabilityVersion](self, "namespaceCompatabilityVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("namespaceCompatabilityVersion"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("namespaceCompatabilityVersion"));

    }
  }
  if (self->_rollout)
  {
    -[SADSchemaSADTrialNamespaceStatus rollout](self, "rollout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("rollout"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("rollout"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v18 = -[SADSchemaSADTrialNamespaceStatus trialNamespace](self, "trialNamespace") - 1;
    if (v18 > 0xC)
      v19 = CFSTR("SADNAMESPACE_UNKNOWN");
    else
      v19 = off_1E5633B68[v18];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("trialNamespace"), (_QWORD)v21);
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v21);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[SADSchemaSADTrialNamespaceStatus dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (SADSchemaSADTrialNamespaceStatus)initWithJSON:(id)a3
{
  void *v4;
  SADSchemaSADTrialNamespaceStatus *v5;
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
    self = -[SADSchemaSADTrialNamespaceStatus initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (SADSchemaSADTrialNamespaceStatus)initWithDictionary:(id)a3
{
  id v4;
  SADSchemaSADTrialNamespaceStatus *v5;
  void *v6;
  SISchemaVersion *v7;
  void *v8;
  SADSchemaSADTrialRollout *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  SISchemaAsset *v17;
  void *v18;
  SADSchemaSADTrialNamespaceStatus *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SADSchemaSADTrialNamespaceStatus;
  v5 = -[SADSchemaSADTrialNamespaceStatus init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("namespaceCompatabilityVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaVersion initWithDictionary:]([SISchemaVersion alloc], "initWithDictionary:", v6);
      -[SADSchemaSADTrialNamespaceStatus setNamespaceCompatabilityVersion:](v5, "setNamespaceCompatabilityVersion:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rollout"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[SADSchemaSADTrialRollout initWithDictionary:]([SADSchemaSADTrialRollout alloc], "initWithDictionary:", v8);
      -[SADSchemaSADTrialNamespaceStatus setRollout:](v5, "setRollout:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assets"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v8;
      v22 = v6;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[SISchemaAsset initWithDictionary:]([SISchemaAsset alloc], "initWithDictionary:", v16);
              -[SADSchemaSADTrialNamespaceStatus addAssets:](v5, "addAssets:", v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v13);
      }

      v8 = v21;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trialNamespace"), v21, v22, (_QWORD)v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SADSchemaSADTrialNamespaceStatus setTrialNamespace:](v5, "setTrialNamespace:", objc_msgSend(v18, "intValue"));
    v19 = v5;

  }
  return v5;
}

- (SISchemaVersion)namespaceCompatabilityVersion
{
  return self->_namespaceCompatabilityVersion;
}

- (void)setNamespaceCompatabilityVersion:(id)a3
{
  objc_storeStrong((id *)&self->_namespaceCompatabilityVersion, a3);
}

- (SADSchemaSADTrialRollout)rollout
{
  return self->_rollout;
}

- (void)setRollout:(id)a3
{
  objc_storeStrong((id *)&self->_rollout, a3);
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)trialNamespace
{
  return self->_trialNamespace;
}

- (void)setHasNamespaceCompatabilityVersion:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasRollout:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_rollout, 0);
  objc_storeStrong((id *)&self->_namespaceCompatabilityVersion, 0);
}

@end
