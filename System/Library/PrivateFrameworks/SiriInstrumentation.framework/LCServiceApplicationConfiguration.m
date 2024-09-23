@implementation LCServiceApplicationConfiguration

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
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LCServiceApplicationConfiguration;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v12, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LCServiceApplicationConfiguration applicationParameters](self, "applicationParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[LCServiceApplicationConfiguration deleteApplicationParameters](self, "deleteApplicationParameters");
  -[LCServiceApplicationConfiguration categories](self, "categories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LCServiceApplicationConfiguration setCategories:](self, "setCategories:", v10);

  return v5;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (void)deleteBundleIdentifier
{
  -[LCServiceApplicationConfiguration setBundleIdentifier:](self, "setBundleIdentifier:", 0);
}

- (BOOL)hasApplicationParameters
{
  return self->_applicationParameters != 0;
}

- (void)deleteApplicationParameters
{
  -[LCServiceApplicationConfiguration setApplicationParameters:](self, "setApplicationParameters:", 0);
}

- (void)clearCategories
{
  -[NSArray removeAllObjects](self->_categories, "removeAllObjects");
}

- (void)addCategories:(id)a3
{
  id v4;
  NSArray *categories;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  categories = self->_categories;
  v8 = v4;
  if (!categories)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_categories;
    self->_categories = v6;

    v4 = v8;
    categories = self->_categories;
  }
  -[NSArray addObject:](categories, "addObject:", v4);

}

- (unint64_t)categoriesCount
{
  return -[NSArray count](self->_categories, "count");
}

- (id)categoriesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_categories, "objectAtIndexedSubscript:", a3);
}

- (void)clearBlacklistedCategories
{
  -[NSArray removeAllObjects](self->_blacklistedCategories, "removeAllObjects");
}

- (void)addBlacklistedCategories:(int)a3
{
  uint64_t v3;
  NSArray *blacklistedCategories;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  blacklistedCategories = self->_blacklistedCategories;
  if (!blacklistedCategories)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_blacklistedCategories;
    self->_blacklistedCategories = v6;

    blacklistedCategories = self->_blacklistedCategories;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](blacklistedCategories, "addObject:", v8);

}

- (unint64_t)blacklistedCategoriesCount
{
  return -[NSArray count](self->_blacklistedCategories, "count");
}

- (int)blacklistedCategoriesAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_blacklistedCategories, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return LCServiceApplicationConfigurationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[LCServiceApplicationConfiguration bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[LCServiceApplicationConfiguration applicationParameters](self, "applicationParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[LCServiceApplicationConfiguration applicationParameters](self, "applicationParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_categories;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = self->_blacklistedCategories;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17), "intValue", (_QWORD)v18);
        PBDataWriterWriteInt32Field();
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
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
  -[LCServiceApplicationConfiguration bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[LCServiceApplicationConfiguration bundleIdentifier](self, "bundleIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[LCServiceApplicationConfiguration bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[LCServiceApplicationConfiguration applicationParameters](self, "applicationParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[LCServiceApplicationConfiguration applicationParameters](self, "applicationParameters");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[LCServiceApplicationConfiguration applicationParameters](self, "applicationParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[LCServiceApplicationConfiguration categories](self, "categories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[LCServiceApplicationConfiguration categories](self, "categories");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[LCServiceApplicationConfiguration categories](self, "categories");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "categories");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[LCServiceApplicationConfiguration blacklistedCategories](self, "blacklistedCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blacklistedCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[LCServiceApplicationConfiguration blacklistedCategories](self, "blacklistedCategories");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[LCServiceApplicationConfiguration blacklistedCategories](self, "blacklistedCategories");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "blacklistedCategories");
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
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_bundleIdentifier, "hash");
  v4 = -[LCServiceLoggingParameters hash](self->_applicationParameters, "hash") ^ v3;
  v5 = -[NSArray hash](self->_categories, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_blacklistedCategories, "hash");
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
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_applicationParameters)
  {
    -[LCServiceApplicationConfiguration applicationParameters](self, "applicationParameters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("applicationParameters"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("applicationParameters"));

    }
  }
  if (-[NSArray count](self->_blacklistedCategories, "count"))
  {
    -[LCServiceApplicationConfiguration blacklistedCategories](self, "blacklistedCategories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("blacklistedCategories"));

  }
  if (self->_bundleIdentifier)
  {
    -[LCServiceApplicationConfiguration bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("bundleIdentifier"));

  }
  if (-[NSArray count](self->_categories, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = self->_categories;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v11, "addObject:", v17);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v18);

          }
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("categories"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v20);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[LCServiceApplicationConfiguration dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (LCServiceApplicationConfiguration)initWithJSON:(id)a3
{
  void *v4;
  LCServiceApplicationConfiguration *v5;
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
    self = -[LCServiceApplicationConfiguration initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (LCServiceApplicationConfiguration)initWithDictionary:(id)a3
{
  id v4;
  LCServiceApplicationConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  LCServiceLoggingParameters *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  LCServiceCategoryConfiguration *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  LCServiceApplicationConfiguration *v25;
  void *v27;
  void *v28;
  void *v29;
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
  v39.super_class = (Class)LCServiceApplicationConfiguration;
  v5 = -[LCServiceApplicationConfiguration init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[LCServiceApplicationConfiguration setBundleIdentifier:](v5, "setBundleIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationParameters"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[LCServiceLoggingParameters initWithDictionary:]([LCServiceLoggingParameters alloc], "initWithDictionary:", v8);
      -[LCServiceApplicationConfiguration setApplicationParameters:](v5, "setApplicationParameters:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("categories"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v27 = v8;
    v29 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v36;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v36 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = -[LCServiceCategoryConfiguration initWithDictionary:]([LCServiceCategoryConfiguration alloc], "initWithDictionary:", v16);
              -[LCServiceApplicationConfiguration addCategories:](v5, "addCategories:", v17);

            }
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v13);
      }

      v8 = v27;
      v6 = v29;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("blacklistedCategories"), v27, v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
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
          v23 = 0;
          do
          {
            if (*(_QWORD *)v32 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v23);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[LCServiceApplicationConfiguration addBlacklistedCategories:](v5, "addBlacklistedCategories:", objc_msgSend(v24, "intValue"));
            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        }
        while (v21);
      }

      v8 = v28;
      v6 = v30;
    }
    v25 = v5;

  }
  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (LCServiceLoggingParameters)applicationParameters
{
  return self->_applicationParameters;
}

- (void)setApplicationParameters:(id)a3
{
  objc_storeStrong((id *)&self->_applicationParameters, a3);
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)blacklistedCategories
{
  return self->_blacklistedCategories;
}

- (void)setBlacklistedCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasBundleIdentifier:(BOOL)a3
{
  self->_hasBundleIdentifier = a3;
}

- (void)setHasApplicationParameters:(BOOL)a3
{
  self->_hasApplicationParameters = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklistedCategories, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_applicationParameters, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
