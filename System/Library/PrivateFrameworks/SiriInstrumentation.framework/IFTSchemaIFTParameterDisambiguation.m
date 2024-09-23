@implementation IFTSchemaIFTParameterDisambiguation

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTParameterDisambiguation;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFTSchemaIFTParameterDisambiguation items](self, "items", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IFTSchemaIFTParameterDisambiguation setItems:](self, "setItems:", v7);
  return v5;
}

- (void)setExists:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_exists = a3;
}

- (BOOL)hasExists
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasExists:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteExists
{
  -[IFTSchemaIFTParameterDisambiguation setExists:](self, "setExists:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasParameterId
{
  return self->_parameterId != 0;
}

- (void)deleteParameterId
{
  -[IFTSchemaIFTParameterDisambiguation setParameterId:](self, "setParameterId:", 0);
}

- (void)setParameterIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_parameterIndex = a3;
}

- (BOOL)hasParameterIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasParameterIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteParameterIndex
{
  -[IFTSchemaIFTParameterDisambiguation setParameterIndex:](self, "setParameterIndex:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)clearItems
{
  -[NSArray removeAllObjects](self->_items, "removeAllObjects");
}

- (void)addItems:(id)a3
{
  id v4;
  NSArray *items;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  items = self->_items;
  v8 = v4;
  if (!items)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_items;
    self->_items = v6;

    v4 = v8;
    items = self->_items;
  }
  -[NSArray addObject:](items, "addObject:", v4);

}

- (unint64_t)itemsCount
{
  return -[NSArray count](self->_items, "count");
}

- (id)itemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTParameterDisambiguationReadFrom(self, (uint64_t)a3);
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
    PBDataWriterWriteBOOLField();
  -[IFTSchemaIFTParameterDisambiguation parameterId](self, "parameterId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt64Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_items;
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
        PBDataWriterWriteSubmessage();
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
  int exists;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int64_t parameterIndex;
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
    exists = self->_exists;
    if (exists != objc_msgSend(v4, "exists"))
      goto LABEL_18;
  }
  -[IFTSchemaIFTParameterDisambiguation parameterId](self, "parameterId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[IFTSchemaIFTParameterDisambiguation parameterId](self, "parameterId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[IFTSchemaIFTParameterDisambiguation parameterId](self, "parameterId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterId");
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
    parameterIndex = self->_parameterIndex;
    if (parameterIndex != objc_msgSend(v4, "parameterIndex"))
      goto LABEL_18;
  }
  -[IFTSchemaIFTParameterDisambiguation items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[IFTSchemaIFTParameterDisambiguation items](self, "items");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {

LABEL_21:
      v20 = 1;
      goto LABEL_19;
    }
    v16 = (void *)v15;
    -[IFTSchemaIFTParameterDisambiguation items](self, "items");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "items");
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
    v3 = 2654435761 * self->_exists;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_parameterId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_parameterIndex;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSArray hash](self->_items, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IFTSchemaIFTParameterDisambiguation exists](self, "exists"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("exists"));

  }
  if (-[NSArray count](self->_items, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = self->_items;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v5, "addObject:", v11);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);

          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("items"));
  }
  if (self->_parameterId)
  {
    -[IFTSchemaIFTParameterDisambiguation parameterId](self, "parameterId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("parameterId"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[IFTSchemaIFTParameterDisambiguation parameterIndex](self, "parameterIndex"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("parameterIndex"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[IFTSchemaIFTParameterDisambiguation dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (IFTSchemaIFTParameterDisambiguation)initWithJSON:(id)a3
{
  void *v4;
  IFTSchemaIFTParameterDisambiguation *v5;
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
    self = -[IFTSchemaIFTParameterDisambiguation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (IFTSchemaIFTParameterDisambiguation)initWithDictionary:(id)a3
{
  id v4;
  IFTSchemaIFTParameterDisambiguation *v5;
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
  IFTSchemaIFTTypedValue *v17;
  IFTSchemaIFTParameterDisambiguation *v18;
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
  v26.super_class = (Class)IFTSchemaIFTParameterDisambiguation;
  v5 = -[IFTSchemaIFTParameterDisambiguation init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTParameterDisambiguation setExists:](v5, "setExists:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameterId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[IFTSchemaIFTParameterDisambiguation setParameterId:](v5, "setParameterId:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parameterIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[IFTSchemaIFTParameterDisambiguation setParameterIndex:](v5, "setParameterIndex:", objc_msgSend(v9, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("items"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v9;
      v21 = v7;
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
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[IFTSchemaIFTTypedValue initWithDictionary:]([IFTSchemaIFTTypedValue alloc], "initWithDictionary:", v16);
              -[IFTSchemaIFTParameterDisambiguation addItems:](v5, "addItems:", v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v13);
      }

      v7 = v21;
      v9 = v20;
    }
    v18 = v5;

  }
  return v5;
}

- (BOOL)exists
{
  return self->_exists;
}

- (NSString)parameterId
{
  return self->_parameterId;
}

- (void)setParameterId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)parameterIndex
{
  return self->_parameterIndex;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasParameterId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_parameterId, 0);
}

@end
