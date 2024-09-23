@implementation SXJSONDataTableSelector

- (SXJSONDataTableSelector)initWithJSONData:(id)a3 andVersion:(id)a4
{
  SXJSONDataTableSelector *v4;
  SXJSONDataTableSelector *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXJSONDataTableSelector;
  v4 = -[SXJSONObject initWithJSONData:andVersion:](&v7, sel_initWithJSONData_andVersion_, a3, a4);
  v5 = v4;
  if (v4)
    -[SXJSONDataTableSelector commonInit](v4, "commonInit");
  return v5;
}

- (SXJSONDataTableSelector)initWithJSONObject:(id)a3 andVersion:(id)a4
{
  SXJSONDataTableSelector *v4;
  SXJSONDataTableSelector *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXJSONDataTableSelector;
  v4 = -[SXJSONObject initWithJSONObject:andVersion:](&v7, sel_initWithJSONObject_andVersion_, a3, a4);
  v5 = v4;
  if (v4)
    -[SXJSONDataTableSelector commonInit](v4, "commonInit");
  return v5;
}

- (void)commonInit
{
  self->_numberOfConditions = -1;
  self->_selectorWeight = -1;
}

- (unint64_t)selectorBooleanForValue:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v3, "BOOLValue"))
      v4 = 1;
    else
      v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)numberOfConditions
{
  unint64_t numberOfConditions;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  numberOfConditions = self->_numberOfConditions;
  if (numberOfConditions == -1)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[SXJSONDataTableSelector propertyList](self, "propertyList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      numberOfConditions = 0;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend((id)objc_opt_class(), "jsonPropertyNameForObjCPropertyName:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXJSONObject jsonDictionary](self, "jsonDictionary");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            v13 = v11 == v12;
          else
            v13 = 1;
          if (!v13)
            ++numberOfConditions;

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }
    else
    {
      numberOfConditions = 0;
    }

    self->_numberOfConditions = numberOfConditions;
  }
  return numberOfConditions;
}

- (unint64_t)weightForSelectorKey:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rowIndex")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("columnIndex")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("descriptor")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)selectorWeight
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  result = self->_selectorWeight;
  if (result == -1)
  {
    -[SXJSONDataTableSelector propertyList](self, "propertyList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          -[SXJSONObject jsonDictionary](self, "jsonDictionary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "valueForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12 != v13)
              v7 += -[SXJSONDataTableSelector weightForSelectorKey:](self, "weightForSelectorKey:", v10);
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
    self->_selectorWeight = v7;

    return self->_selectorWeight;
  }
  return result;
}

- (id)propertyList
{
  objc_class *v2;
  void *v3;
  void *i;
  void *v5;
  objc_property_t *v6;
  unint64_t j;
  void *v8;
  void *v9;
  void *v10;
  unsigned int outCount;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__propertyList, "objectForKey:", v3);
  i = (void *)objc_claimAutoreleasedReturnValue();
  if (!i)
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    for (i = (void *)objc_claimAutoreleasedReturnValue();
          v5 != (void *)objc_opt_class();
          v5 = (void *)objc_msgSend(v5, "superclass"))
    {
      outCount = 0;
      v6 = class_copyPropertyList((Class)v5, &outCount);
      if (outCount)
      {
        for (j = 0; j < outCount; ++j)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), property_getName(v6[j]));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(i, "addObject:", v8);

        }
      }
      free(v6);
    }
    v9 = (void *)objc_msgSend((id)__propertyList, "mutableCopy");
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "setObject:forKey:", i, v3);
    v10 = (void *)__propertyList;
    __propertyList = (uint64_t)v9;

  }
  return i;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[SXJSONDataTableSelector propertyList](self, "propertyList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    v7 = &stru_24D68E0F8;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[SXJSONObject jsonDictionary](self, "jsonDictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "valueForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 != v12)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("; %@: %@"), v9, v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v13);
            v14 = objc_claimAutoreleasedReturnValue();

            v7 = (__CFString *)v14;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }
  else
  {
    v7 = &stru_24D68E0F8;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v7, "length"))
  {
    objc_msgSend(v15, "stringByAppendingString:", v7);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("; weight: %d"),
    -[SXJSONDataTableSelector selectorWeight](self, "selectorWeight"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "stringByAppendingString:", CFSTR(">"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

- (void)setSelectorWeight:(unint64_t)a3
{
  self->_selectorWeight = a3;
}

- (void)setNumberOfConditions:(unint64_t)a3
{
  self->_numberOfConditions = a3;
}

@end
