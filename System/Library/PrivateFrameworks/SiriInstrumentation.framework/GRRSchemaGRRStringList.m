@implementation GRRSchemaGRRStringList

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (void)clearStringName
{
  -[NSArray removeAllObjects](self->_stringNames, "removeAllObjects");
}

- (void)addStringName:(id)a3
{
  id v4;
  NSArray *stringNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  stringNames = self->_stringNames;
  v8 = v4;
  if (!stringNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_stringNames;
    self->_stringNames = v6;

    v4 = v8;
    stringNames = self->_stringNames;
  }
  -[NSArray addObject:](stringNames, "addObject:", v4);

}

- (unint64_t)stringNameCount
{
  return -[NSArray count](self->_stringNames, "count");
}

- (id)stringNameAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_stringNames, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return GRRSchemaGRRStringListReadFrom(self, (uint64_t)a3);
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_stringNames;
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
        PBDataWriterWriteStringField();
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
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[GRRSchemaGRRStringList stringNames](self, "stringNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[GRRSchemaGRRStringList stringNames](self, "stringNames");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[GRRSchemaGRRStringList stringNames](self, "stringNames");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringNames");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_stringNames, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_stringNames)
  {
    -[GRRSchemaGRRStringList stringNames](self, "stringNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("stringName"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[GRRSchemaGRRStringList dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (GRRSchemaGRRStringList)initWithJSON:(id)a3
{
  void *v4;
  GRRSchemaGRRStringList *v5;
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
    self = -[GRRSchemaGRRStringList initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (GRRSchemaGRRStringList)initWithDictionary:(id)a3
{
  id v4;
  GRRSchemaGRRStringList *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  GRRSchemaGRRStringList *v14;
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
  v20.super_class = (Class)GRRSchemaGRRStringList;
  v5 = -[GRRSchemaGRRStringList init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stringName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = (void *)objc_msgSend(v12, "copy", (_QWORD)v16);
              -[GRRSchemaGRRStringList addStringName:](v5, "addStringName:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v9);
      }

    }
    v14 = v5;

  }
  return v5;
}

- (NSArray)stringNames
{
  return self->_stringNames;
}

- (void)setStringNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringNames, 0);
}

@end
