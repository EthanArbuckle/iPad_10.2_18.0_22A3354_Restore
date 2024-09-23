@implementation _SFPBInfoTuple

- (_SFPBInfoTuple)initWithFacade:(id)a3
{
  id v4;
  _SFPBInfoTuple *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _SFPBCommandButtonItem *v15;
  void *v16;
  void *v17;
  _SFPBInfoTuple *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBInfoTuple init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBInfoTuple setKey:](v5, "setKey:", v7);

    }
    objc_msgSend(v4, "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v9 = 0;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "values", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = -[_SFPBCommandButtonItem initWithFacade:]([_SFPBCommandButtonItem alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    -[_SFPBInfoTuple setValues:](v5, "setValues:", v9);
    if (objc_msgSend(v4, "hasInitiallyVisibleValues"))
      -[_SFPBInfoTuple setInitiallyVisibleValues:](v5, "setInitiallyVisibleValues:", objc_msgSend(v4, "initiallyVisibleValues"));
    objc_msgSend(v4, "showMoreString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "showMoreString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBInfoTuple setShowMoreString:](v5, "setShowMoreString:", v17);

    }
    v18 = v5;

  }
  return v5;
}

- (void)setKey:(id)a3
{
  NSString *v4;
  NSString *key;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  key = self->_key;
  self->_key = v4;

}

- (void)setValues:(id)a3
{
  NSArray *v4;
  NSArray *values;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  values = self->_values;
  self->_values = v4;

}

- (void)clearValues
{
  -[NSArray removeAllObjects](self->_values, "removeAllObjects");
}

- (void)addValues:(id)a3
{
  id v4;
  NSArray *values;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  values = self->_values;
  v8 = v4;
  if (!values)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_values;
    self->_values = v6;

    v4 = v8;
    values = self->_values;
  }
  -[NSArray addObject:](values, "addObject:", v4);

}

- (unint64_t)valuesCount
{
  return -[NSArray count](self->_values, "count");
}

- (id)valuesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", a3);
}

- (void)setInitiallyVisibleValues:(unsigned int)a3
{
  self->_initiallyVisibleValues = a3;
}

- (void)setShowMoreString:(id)a3
{
  NSString *v4;
  NSString *showMoreString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  showMoreString = self->_showMoreString;
  self->_showMoreString = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBInfoTupleReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBInfoTuple key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBInfoTuple values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (-[_SFPBInfoTuple initiallyVisibleValues](self, "initiallyVisibleValues"))
    PBDataWriterWriteUint32Field();
  -[_SFPBInfoTuple showMoreString](self, "showMoreString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

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
  unsigned int initiallyVisibleValues;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[_SFPBInfoTuple key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_17;
  -[_SFPBInfoTuple key](self, "key");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBInfoTuple key](self, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_18;
  }
  else
  {

  }
  -[_SFPBInfoTuple values](self, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_17;
  -[_SFPBInfoTuple values](self, "values");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBInfoTuple values](self, "values");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "values");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_18;
  }
  else
  {

  }
  initiallyVisibleValues = self->_initiallyVisibleValues;
  if (initiallyVisibleValues != objc_msgSend(v4, "initiallyVisibleValues"))
    goto LABEL_18;
  -[_SFPBInfoTuple showMoreString](self, "showMoreString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showMoreString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  -[_SFPBInfoTuple showMoreString](self, "showMoreString");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

LABEL_21:
    v23 = 1;
    goto LABEL_19;
  }
  v19 = (void *)v18;
  -[_SFPBInfoTuple showMoreString](self, "showMoreString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showMoreString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if ((v22 & 1) != 0)
    goto LABEL_21;
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSArray hash](self->_values, "hash");
  v5 = 2654435761 * self->_initiallyVisibleValues;
  return v4 ^ v3 ^ -[NSString hash](self->_showMoreString, "hash") ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_initiallyVisibleValues)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_SFPBInfoTuple initiallyVisibleValues](self, "initiallyVisibleValues"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("initiallyVisibleValues"));

  }
  if (self->_key)
  {
    -[_SFPBInfoTuple key](self, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("key"));

  }
  if (self->_showMoreString)
  {
    -[_SFPBInfoTuple showMoreString](self, "showMoreString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("showMoreString"));

  }
  if (-[NSArray count](self->_values, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = self->_values;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v9, "addObject:", v15);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v16);

          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("values"));
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBInfoTuple dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBInfoTuple)initWithJSON:(id)a3
{
  void *v4;
  _SFPBInfoTuple *v5;
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
    self = -[_SFPBInfoTuple initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBInfoTuple)initWithDictionary:(id)a3
{
  id v4;
  _SFPBInfoTuple *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _SFPBCommandButtonItem *v15;
  void *v16;
  void *v17;
  void *v18;
  _SFPBInfoTuple *v19;
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
  v26.super_class = (Class)_SFPBInfoTuple;
  v5 = -[_SFPBInfoTuple init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBInfoTuple setKey:](v5, "setKey:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("values"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v6;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v23;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[_SFPBCommandButtonItem initWithDictionary:]([_SFPBCommandButtonItem alloc], "initWithDictionary:", v14);
              -[_SFPBInfoTuple addValues:](v5, "addValues:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v11);
      }

      v6 = v21;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("initiallyVisibleValues"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBInfoTuple setInitiallyVisibleValues:](v5, "setInitiallyVisibleValues:", objc_msgSend(v16, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showMoreString"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(v17, "copy");
      -[_SFPBInfoTuple setShowMoreString:](v5, "setShowMoreString:", v18);

    }
    v19 = v5;

  }
  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (NSArray)values
{
  return self->_values;
}

- (unsigned)initiallyVisibleValues
{
  return self->_initiallyVisibleValues;
}

- (NSString)showMoreString
{
  return self->_showMoreString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showMoreString, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
