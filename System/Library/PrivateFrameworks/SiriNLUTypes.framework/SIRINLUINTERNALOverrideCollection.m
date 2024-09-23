@implementation SIRINLUINTERNALOverrideCollection

- (void)setCreationTimestampMsSinceUnixEpoch:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationTimestampMsSinceUnixEpoch = a3;
}

- (void)setHasCreationTimestampMsSinceUnixEpoch:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationTimestampMsSinceUnixEpoch
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAssetId
{
  return self->_assetId != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (void)clearParseOverrides
{
  -[NSMutableArray removeAllObjects](self->_parseOverrides, "removeAllObjects");
}

- (void)addParseOverrides:(id)a3
{
  id v4;
  NSMutableArray *parseOverrides;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  parseOverrides = self->_parseOverrides;
  v8 = v4;
  if (!parseOverrides)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_parseOverrides;
    self->_parseOverrides = v6;

    v4 = v8;
    parseOverrides = self->_parseOverrides;
  }
  -[NSMutableArray addObject:](parseOverrides, "addObject:", v4);

}

- (unint64_t)parseOverridesCount
{
  return -[NSMutableArray count](self->_parseOverrides, "count");
}

- (id)parseOverridesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_parseOverrides, "objectAtIndex:", a3);
}

- (void)clearComponentOverrides
{
  -[NSMutableArray removeAllObjects](self->_componentOverrides, "removeAllObjects");
}

- (void)addComponentOverrides:(id)a3
{
  id v4;
  NSMutableArray *componentOverrides;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  componentOverrides = self->_componentOverrides;
  v8 = v4;
  if (!componentOverrides)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_componentOverrides;
    self->_componentOverrides = v6;

    v4 = v8;
    componentOverrides = self->_componentOverrides;
  }
  -[NSMutableArray addObject:](componentOverrides, "addObject:", v4);

}

- (unint64_t)componentOverridesCount
{
  return -[NSMutableArray count](self->_componentOverrides, "count");
}

- (id)componentOverridesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_componentOverrides, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUINTERNALOverrideCollection;
  -[SIRINLUINTERNALOverrideCollection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALOverrideCollection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *assetId;
  NSString *version;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_creationTimestampMsSinceUnixEpoch);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("creation_timestamp_ms_since_unix_epoch"));

  }
  assetId = self->_assetId;
  if (assetId)
    objc_msgSend(v3, "setObject:forKey:", assetId, CFSTR("asset_id"));
  version = self->_version;
  if (version)
    objc_msgSend(v3, "setObject:forKey:", version, CFSTR("version"));
  if (-[NSMutableArray count](self->_parseOverrides, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_parseOverrides, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = self->_parseOverrides;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("parse_overrides"));
  }
  if (-[NSMutableArray count](self->_componentOverrides, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_componentOverrides, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = self->_componentOverrides;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("component_overrides"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALOverrideCollectionReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_assetId)
    PBDataWriterWriteStringField();
  if (self->_version)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_parseOverrides;
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
        PBDataWriterWriteSubmessage();
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
  v10 = self->_componentOverrides;
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
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id v13;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_creationTimestampMsSinceUnixEpoch;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v13 = v4;
  if (self->_assetId)
    objc_msgSend(v4, "setAssetId:");
  if (self->_version)
    objc_msgSend(v13, "setVersion:");
  if (-[SIRINLUINTERNALOverrideCollection parseOverridesCount](self, "parseOverridesCount"))
  {
    objc_msgSend(v13, "clearParseOverrides");
    v5 = -[SIRINLUINTERNALOverrideCollection parseOverridesCount](self, "parseOverridesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[SIRINLUINTERNALOverrideCollection parseOverridesAtIndex:](self, "parseOverridesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addParseOverrides:", v8);

      }
    }
  }
  if (-[SIRINLUINTERNALOverrideCollection componentOverridesCount](self, "componentOverridesCount"))
  {
    objc_msgSend(v13, "clearComponentOverrides");
    v9 = -[SIRINLUINTERNALOverrideCollection componentOverridesCount](self, "componentOverridesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[SIRINLUINTERNALOverrideCollection componentOverridesAtIndex:](self, "componentOverridesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addComponentOverrides:", v12);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
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
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_creationTimestampMsSinceUnixEpoch;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_assetId, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_version, "copyWithZone:", a3);
  v10 = (void *)v6[5];
  v6[5] = v9;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = self->_parseOverrides;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v15), "copyWithZone:", a3);
        objc_msgSend(v6, "addParseOverrides:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v13);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_componentOverrides;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend(v6, "addComponentOverrides:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v19);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *assetId;
  NSString *version;
  NSMutableArray *parseOverrides;
  NSMutableArray *componentOverrides;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_creationTimestampMsSinceUnixEpoch != *((_QWORD *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  assetId = self->_assetId;
  if ((unint64_t)assetId | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](assetId, "isEqual:"))
    goto LABEL_15;
  version = self->_version;
  if ((unint64_t)version | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](version, "isEqual:"))
      goto LABEL_15;
  }
  parseOverrides = self->_parseOverrides;
  if ((unint64_t)parseOverrides | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](parseOverrides, "isEqual:"))
      goto LABEL_15;
  }
  componentOverrides = self->_componentOverrides;
  if ((unint64_t)componentOverrides | *((_QWORD *)v4 + 3))
    v9 = -[NSMutableArray isEqual:](componentOverrides, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_creationTimestampMsSinceUnixEpoch;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_assetId, "hash") ^ v3;
  v5 = -[NSString hash](self->_version, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_parseOverrides, "hash");
  return v6 ^ -[NSMutableArray hash](self->_componentOverrides, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[6] & 1) != 0)
  {
    self->_creationTimestampMsSinceUnixEpoch = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[2])
    -[SIRINLUINTERNALOverrideCollection setAssetId:](self, "setAssetId:");
  if (*((_QWORD *)v5 + 5))
    -[SIRINLUINTERNALOverrideCollection setVersion:](self, "setVersion:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = *((id *)v5 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        -[SIRINLUINTERNALOverrideCollection addParseOverrides:](self, "addParseOverrides:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *((id *)v5 + 3);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[SIRINLUINTERNALOverrideCollection addComponentOverrides:](self, "addComponentOverrides:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (unint64_t)creationTimestampMsSinceUnixEpoch
{
  return self->_creationTimestampMsSinceUnixEpoch;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (void)setAssetId:(id)a3
{
  objc_storeStrong((id *)&self->_assetId, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSMutableArray)parseOverrides
{
  return self->_parseOverrides;
}

- (void)setParseOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_parseOverrides, a3);
}

- (NSMutableArray)componentOverrides
{
  return self->_componentOverrides;
}

- (void)setComponentOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_componentOverrides, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_parseOverrides, 0);
  objc_storeStrong((id *)&self->_componentOverrides, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
}

+ (Class)parseOverridesType
{
  return (Class)objc_opt_class();
}

+ (Class)componentOverridesType
{
  return (Class)objc_opt_class();
}

@end
