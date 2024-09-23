@implementation USOSchemaUSOEntitySpanTier1

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

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)USOSchemaUSOEntitySpanTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v11, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[USOSchemaUSOEntitySpanTier1 deleteOriginAppId](self, "deleteOriginAppId");
    -[USOSchemaUSOEntitySpanTier1 deleteOriginEntityId](self, "deleteOriginEntityId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[USOSchemaUSOEntitySpanTier1 deleteOriginAppId](self, "deleteOriginAppId");
    -[USOSchemaUSOEntitySpanTier1 deleteOriginEntityId](self, "deleteOriginEntityId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[USOSchemaUSOEntitySpanTier1 deleteOriginAppId](self, "deleteOriginAppId");
    -[USOSchemaUSOEntitySpanTier1 deleteOriginEntityId](self, "deleteOriginEntityId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[USOSchemaUSOEntitySpanTier1 deleteOriginAppId](self, "deleteOriginAppId");
    -[USOSchemaUSOEntitySpanTier1 deleteOriginEntityId](self, "deleteOriginEntityId");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[USOSchemaUSOEntitySpanTier1 deleteOriginAppId](self, "deleteOriginAppId");
    -[USOSchemaUSOEntitySpanTier1 deleteOriginEntityId](self, "deleteOriginEntityId");
  }
  -[USOSchemaUSOEntitySpanTier1 properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[USOSchemaUSOEntitySpanTier1 setProperties:](self, "setProperties:", v7);

  -[USOSchemaUSOEntitySpanTier1 alternatives](self, "alternatives");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[USOSchemaUSOEntitySpanTier1 setAlternatives:](self, "setAlternatives:", v9);

  return v5;
}

- (void)setIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_index = a3;
}

- (BOOL)hasIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteIndex
{
  -[USOSchemaUSOEntitySpanTier1 setIndex:](self, "setIndex:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasOriginAppId
{
  return self->_originAppId != 0;
}

- (void)deleteOriginAppId
{
  -[USOSchemaUSOEntitySpanTier1 setOriginAppId:](self, "setOriginAppId:", 0);
}

- (void)clearProperties
{
  -[NSArray removeAllObjects](self->_properties, "removeAllObjects");
}

- (void)addProperties:(id)a3
{
  id v4;
  NSArray *properties;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  properties = self->_properties;
  v8 = v4;
  if (!properties)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_properties;
    self->_properties = v6;

    v4 = v8;
    properties = self->_properties;
  }
  -[NSArray addObject:](properties, "addObject:", v4);

}

- (unint64_t)propertiesCount
{
  return -[NSArray count](self->_properties, "count");
}

- (id)propertiesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_properties, "objectAtIndexedSubscript:", a3);
}

- (void)clearAlternatives
{
  -[NSArray removeAllObjects](self->_alternatives, "removeAllObjects");
}

- (void)addAlternatives:(id)a3
{
  id v4;
  NSArray *alternatives;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  alternatives = self->_alternatives;
  v8 = v4;
  if (!alternatives)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_alternatives;
    self->_alternatives = v6;

    v4 = v8;
    alternatives = self->_alternatives;
  }
  -[NSArray addObject:](alternatives, "addObject:", v4);

}

- (unint64_t)alternativesCount
{
  return -[NSArray count](self->_alternatives, "count");
}

- (id)alternativesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_alternatives, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasOriginEntityId
{
  return self->_originEntityId != 0;
}

- (void)deleteOriginEntityId
{
  -[USOSchemaUSOEntitySpanTier1 setOriginEntityId:](self, "setOriginEntityId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOEntitySpanTier1ReadFrom(self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[USOSchemaUSOEntitySpanTier1 originAppId](self, "originAppId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_properties;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_alternatives;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  -[USOSchemaUSOEntitySpanTier1 originEntityId](self, "originEntityId", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unsigned int index;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != (v4[48] & 1))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    index = self->_index;
    if (index != objc_msgSend(v4, "index"))
      goto LABEL_25;
  }
  -[USOSchemaUSOEntitySpanTier1 originAppId](self, "originAppId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originAppId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_24;
  -[USOSchemaUSOEntitySpanTier1 originAppId](self, "originAppId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[USOSchemaUSOEntitySpanTier1 originAppId](self, "originAppId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originAppId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_25;
  }
  else
  {

  }
  -[USOSchemaUSOEntitySpanTier1 properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_24;
  -[USOSchemaUSOEntitySpanTier1 properties](self, "properties");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[USOSchemaUSOEntitySpanTier1 properties](self, "properties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "properties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_25;
  }
  else
  {

  }
  -[USOSchemaUSOEntitySpanTier1 alternatives](self, "alternatives");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternatives");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_24;
  -[USOSchemaUSOEntitySpanTier1 alternatives](self, "alternatives");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[USOSchemaUSOEntitySpanTier1 alternatives](self, "alternatives");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternatives");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_25;
  }
  else
  {

  }
  -[USOSchemaUSOEntitySpanTier1 originEntityId](self, "originEntityId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originEntityId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[USOSchemaUSOEntitySpanTier1 originEntityId](self, "originEntityId");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_28:
      v28 = 1;
      goto LABEL_26;
    }
    v24 = (void *)v23;
    -[USOSchemaUSOEntitySpanTier1 originEntityId](self, "originEntityId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originEntityId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_28;
  }
  else
  {
LABEL_24:

  }
LABEL_25:
  v28 = 0;
LABEL_26:

  return v28;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_index;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_originAppId, "hash") ^ v3;
  v5 = -[NSArray hash](self->_properties, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_alternatives, "hash");
  return v6 ^ -[NSString hash](self->_originEntityId, "hash");
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
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_alternatives, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v5 = self->_alternatives;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "dictionaryRepresentation");
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("alternatives"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOEntitySpanTier1 index](self, "index"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("index"));

  }
  if (self->_originAppId)
  {
    -[USOSchemaUSOEntitySpanTier1 originAppId](self, "originAppId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("originAppId"));

  }
  if (self->_originEntityId)
  {
    -[USOSchemaUSOEntitySpanTier1 originEntityId](self, "originEntityId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("originEntityId"));

  }
  if (-[NSArray count](self->_properties, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = self->_properties;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v26);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v17, "addObject:", v23);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v24);

          }
        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("properties"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v26);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USOSchemaUSOEntitySpanTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USOSchemaUSOEntitySpanTier1)initWithJSON:(id)a3
{
  void *v4;
  USOSchemaUSOEntitySpanTier1 *v5;
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
    self = -[USOSchemaUSOEntitySpanTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USOSchemaUSOEntitySpanTier1)initWithDictionary:(id)a3
{
  id v4;
  USOSchemaUSOEntitySpanTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  USOSchemaUSOSpanPropertyTier1 *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  USOSchemaUSOAsrAlternativeTier1 *v25;
  void *v26;
  void *v27;
  USOSchemaUSOEntitySpanTier1 *v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)USOSchemaUSOEntitySpanTier1;
  v5 = -[USOSchemaUSOEntitySpanTier1 init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("index"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOEntitySpanTier1 setIndex:](v5, "setIndex:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originAppId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[USOSchemaUSOEntitySpanTier1 setOriginAppId:](v5, "setOriginAppId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("properties"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v10 = v9;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v36 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[USOSchemaUSOSpanPropertyTier1 initWithDictionary:]([USOSchemaUSOSpanPropertyTier1 alloc], "initWithDictionary:", v16);
              -[USOSchemaUSOEntitySpanTier1 addProperties:](v5, "addProperties:", v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v13);
      }

      v9 = v10;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternatives"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = v9;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v32 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v25 = -[USOSchemaUSOAsrAlternativeTier1 initWithDictionary:]([USOSchemaUSOAsrAlternativeTier1 alloc], "initWithDictionary:", v24);
              -[USOSchemaUSOEntitySpanTier1 addAlternatives:](v5, "addAlternatives:", v25);

            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        }
        while (v21);
      }

      v9 = v30;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originEntityId"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (void *)objc_msgSend(v26, "copy");
      -[USOSchemaUSOEntitySpanTier1 setOriginEntityId:](v5, "setOriginEntityId:", v27);

    }
    v28 = v5;

  }
  return v5;
}

- (unsigned)index
{
  return self->_index;
}

- (NSString)originAppId
{
  return self->_originAppId;
}

- (void)setOriginAppId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (void)setAlternatives:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)originEntityId
{
  return self->_originEntityId;
}

- (void)setOriginEntityId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setHasOriginAppId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasOriginEntityId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originEntityId, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_originAppId, 0);
}

@end
