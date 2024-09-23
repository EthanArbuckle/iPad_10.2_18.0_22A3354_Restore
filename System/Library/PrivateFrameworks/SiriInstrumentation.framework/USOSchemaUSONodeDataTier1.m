@implementation USOSchemaUSONodeDataTier1

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
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)USOSchemaUSONodeDataTier1;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v7, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isConditionSet:", 2))
  {
    -[USOSchemaUSONodeDataTier1 deleteStringPayload](self, "deleteStringPayload");
    -[USOSchemaUSONodeDataTier1 deleteIntegerPayload](self, "deleteIntegerPayload");
    -[USOSchemaUSONodeDataTier1 deleteNormalizedStringPayloads](self, "deleteNormalizedStringPayloads");
  }
  if (objc_msgSend(v4, "isConditionSet:", 4))
  {
    -[USOSchemaUSONodeDataTier1 deleteStringPayload](self, "deleteStringPayload");
    -[USOSchemaUSONodeDataTier1 deleteIntegerPayload](self, "deleteIntegerPayload");
    -[USOSchemaUSONodeDataTier1 deleteNormalizedStringPayloads](self, "deleteNormalizedStringPayloads");
  }
  if (objc_msgSend(v4, "isConditionSet:", 5))
  {
    -[USOSchemaUSONodeDataTier1 deleteStringPayload](self, "deleteStringPayload");
    -[USOSchemaUSONodeDataTier1 deleteIntegerPayload](self, "deleteIntegerPayload");
    -[USOSchemaUSONodeDataTier1 deleteNormalizedStringPayloads](self, "deleteNormalizedStringPayloads");
  }
  if (objc_msgSend(v4, "isConditionSet:", 6))
  {
    -[USOSchemaUSONodeDataTier1 deleteStringPayload](self, "deleteStringPayload");
    -[USOSchemaUSONodeDataTier1 deleteIntegerPayload](self, "deleteIntegerPayload");
    -[USOSchemaUSONodeDataTier1 deleteNormalizedStringPayloads](self, "deleteNormalizedStringPayloads");
  }
  if (objc_msgSend(v4, "isConditionSet:", 7))
  {
    -[USOSchemaUSONodeDataTier1 deleteStringPayload](self, "deleteStringPayload");
    -[USOSchemaUSONodeDataTier1 deleteIntegerPayload](self, "deleteIntegerPayload");
    -[USOSchemaUSONodeDataTier1 deleteNormalizedStringPayloads](self, "deleteNormalizedStringPayloads");
  }

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
  -[USOSchemaUSONodeDataTier1 setIndex:](self, "setIndex:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasStringPayload
{
  return self->_stringPayload != 0;
}

- (void)deleteStringPayload
{
  -[USOSchemaUSONodeDataTier1 setStringPayload:](self, "setStringPayload:", 0);
}

- (void)setIntegerPayload:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_integerPayload = a3;
}

- (BOOL)hasIntegerPayload
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIntegerPayload:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteIntegerPayload
{
  -[USOSchemaUSONodeDataTier1 setIntegerPayload:](self, "setIntegerPayload:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearNormalizedStringPayloads
{
  -[NSArray removeAllObjects](self->_normalizedStringPayloads, "removeAllObjects");
}

- (void)addNormalizedStringPayloads:(id)a3
{
  id v4;
  NSArray *normalizedStringPayloads;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  normalizedStringPayloads = self->_normalizedStringPayloads;
  v8 = v4;
  if (!normalizedStringPayloads)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_normalizedStringPayloads;
    self->_normalizedStringPayloads = v6;

    v4 = v8;
    normalizedStringPayloads = self->_normalizedStringPayloads;
  }
  -[NSArray addObject:](normalizedStringPayloads, "addObject:", v4);

}

- (unint64_t)normalizedStringPayloadsCount
{
  return -[NSArray count](self->_normalizedStringPayloads, "count");
}

- (id)normalizedStringPayloadsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_normalizedStringPayloads, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSONodeDataTier1ReadFrom(self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[USOSchemaUSONodeDataTier1 stringPayload](self, "stringPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_normalizedStringPayloads;
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
        PBDataWriterWriteStringField();
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
  unsigned int index;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int integerPayload;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 1) != (v4[40] & 1))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    index = self->_index;
    if (index != objc_msgSend(v4, "index"))
      goto LABEL_18;
  }
  -[USOSchemaUSONodeDataTier1 stringPayload](self, "stringPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[USOSchemaUSONodeDataTier1 stringPayload](self, "stringPayload");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[USOSchemaUSONodeDataTier1 stringPayload](self, "stringPayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringPayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  v13 = (*(_BYTE *)&self->_has >> 1) & 1;
  if (v13 != ((v4[40] >> 1) & 1))
    goto LABEL_18;
  if (v13)
  {
    integerPayload = self->_integerPayload;
    if (integerPayload != objc_msgSend(v4, "integerPayload"))
      goto LABEL_18;
  }
  -[USOSchemaUSONodeDataTier1 normalizedStringPayloads](self, "normalizedStringPayloads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedStringPayloads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[USOSchemaUSONodeDataTier1 normalizedStringPayloads](self, "normalizedStringPayloads");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {

LABEL_21:
      v20 = 1;
      goto LABEL_19;
    }
    v16 = (void *)v15;
    -[USOSchemaUSONodeDataTier1 normalizedStringPayloads](self, "normalizedStringPayloads");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "normalizedStringPayloads");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if ((v19 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
LABEL_17:

  }
LABEL_18:
  v20 = 0;
LABEL_19:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_index;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_stringPayload, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_integerPayload;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSArray hash](self->_normalizedStringPayloads, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSONodeDataTier1 index](self, "index"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("index"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[USOSchemaUSONodeDataTier1 integerPayload](self, "integerPayload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("integerPayload"));

  }
  if (self->_normalizedStringPayloads)
  {
    -[USOSchemaUSONodeDataTier1 normalizedStringPayloads](self, "normalizedStringPayloads");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("normalizedStringPayloads"));

  }
  if (self->_stringPayload)
  {
    -[USOSchemaUSONodeDataTier1 stringPayload](self, "stringPayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("stringPayload"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USOSchemaUSONodeDataTier1 dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USOSchemaUSONodeDataTier1)initWithJSON:(id)a3
{
  void *v4;
  USOSchemaUSONodeDataTier1 *v5;
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
    self = -[USOSchemaUSONodeDataTier1 initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USOSchemaUSONodeDataTier1)initWithDictionary:(id)a3
{
  id v4;
  USOSchemaUSONodeDataTier1 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  USOSchemaUSONodeDataTier1 *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)USOSchemaUSONodeDataTier1;
  v5 = -[USOSchemaUSONodeDataTier1 init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("index"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSONodeDataTier1 setIndex:](v5, "setIndex:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stringPayload"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[USOSchemaUSONodeDataTier1 setStringPayload:](v5, "setStringPayload:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("integerPayload"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSONodeDataTier1 setIntegerPayload:](v5, "setIntegerPayload:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("normalizedStringPayloads"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v7;
      v21 = v6;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v23;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = (void *)objc_msgSend(v16, "copy");
              -[USOSchemaUSONodeDataTier1 addNormalizedStringPayloads:](v5, "addNormalizedStringPayloads:", v17);

            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v13);
      }

      v7 = v20;
      v6 = v21;
    }
    v18 = v5;

  }
  return v5;
}

- (unsigned)index
{
  return self->_index;
}

- (NSString)stringPayload
{
  return self->_stringPayload;
}

- (void)setStringPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)integerPayload
{
  return self->_integerPayload;
}

- (NSArray)normalizedStringPayloads
{
  return self->_normalizedStringPayloads;
}

- (void)setNormalizedStringPayloads:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasStringPayload:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedStringPayloads, 0);
  objc_storeStrong((id *)&self->_stringPayload, 0);
}

@end
