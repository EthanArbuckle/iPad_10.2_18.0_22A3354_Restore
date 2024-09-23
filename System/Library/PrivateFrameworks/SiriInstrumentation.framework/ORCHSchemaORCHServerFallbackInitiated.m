@implementation ORCHSchemaORCHServerFallbackInitiated

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)setFallbackReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fallbackReason = a3;
}

- (BOOL)hasFallbackReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasFallbackReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteFallbackReason
{
  -[ORCHSchemaORCHServerFallbackInitiated setFallbackReason:](self, "setFallbackReason:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)clearMissingAsset
{
  -[NSArray removeAllObjects](self->_missingAssets, "removeAllObjects");
}

- (void)addMissingAsset:(int)a3
{
  uint64_t v3;
  NSArray *missingAssets;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  missingAssets = self->_missingAssets;
  if (!missingAssets)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_missingAssets;
    self->_missingAssets = v6;

    missingAssets = self->_missingAssets;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](missingAssets, "addObject:", v8);

}

- (unint64_t)missingAssetCount
{
  return -[NSArray count](self->_missingAssets, "count");
}

- (int)missingAssetAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_missingAssets, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHServerFallbackInitiatedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_missingAssets;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "intValue", (_QWORD)v10);
        PBDataWriterWriteInt32Field();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  int fallbackReason;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if ((*(_BYTE *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(_BYTE *)&self->_has & 1) == 0
        || (fallbackReason = self->_fallbackReason, fallbackReason == objc_msgSend(v4, "fallbackReason")))
      {
        -[ORCHSchemaORCHServerFallbackInitiated missingAssets](self, "missingAssets");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "missingAssets");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          -[ORCHSchemaORCHServerFallbackInitiated missingAssets](self, "missingAssets");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {

LABEL_13:
            v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          -[ORCHSchemaORCHServerFallbackInitiated missingAssets](self, "missingAssets");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "missingAssets");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if ((v13 & 1) != 0)
            goto LABEL_13;
        }
        else
        {

        }
      }
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_fallbackReason;
  else
    v2 = 0;
  return -[NSArray hash](self->_missingAssets, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = -[ORCHSchemaORCHServerFallbackInitiated fallbackReason](self, "fallbackReason") - 1;
    if (v4 > 5)
      v5 = CFSTR("ORCHSERVERFALLBACKREASON_UNKNOWN");
    else
      v5 = off_1E5632898[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("fallbackReason"));
  }
  if (-[NSArray count](self->_missingAssets, "count"))
  {
    -[ORCHSchemaORCHServerFallbackInitiated missingAssets](self, "missingAssets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("missingAsset"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ORCHSchemaORCHServerFallbackInitiated dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (ORCHSchemaORCHServerFallbackInitiated)initWithJSON:(id)a3
{
  void *v4;
  ORCHSchemaORCHServerFallbackInitiated *v5;
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
    self = -[ORCHSchemaORCHServerFallbackInitiated initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ORCHSchemaORCHServerFallbackInitiated)initWithDictionary:(id)a3
{
  id v4;
  ORCHSchemaORCHServerFallbackInitiated *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  ORCHSchemaORCHServerFallbackInitiated *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ORCHSchemaORCHServerFallbackInitiated;
  v5 = -[ORCHSchemaORCHServerFallbackInitiated init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fallbackReason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ORCHSchemaORCHServerFallbackInitiated setFallbackReason:](v5, "setFallbackReason:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("missingAsset"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[ORCHSchemaORCHServerFallbackInitiated addMissingAsset:](v5, "addMissingAsset:", objc_msgSend(v13, "intValue", (_QWORD)v16));
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v10);
      }

    }
    v14 = v5;

  }
  return v5;
}

- (int)fallbackReason
{
  return self->_fallbackReason;
}

- (NSArray)missingAssets
{
  return self->_missingAssets;
}

- (void)setMissingAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingAssets, 0);
}

@end
