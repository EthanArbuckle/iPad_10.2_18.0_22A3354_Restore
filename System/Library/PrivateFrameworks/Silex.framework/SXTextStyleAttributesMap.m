@implementation SXTextStyleAttributesMap

- (SXTextStyleAttributesMap)initWithString:(id)a3
{
  id v5;
  SXTextStyleAttributesMap *v6;
  SXTextStyleAttributesMap *v7;
  uint64_t v8;
  NSMutableArray *attributes;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXTextStyleAttributesMap;
  v6 = -[SXTextStyleAttributesMap init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_string, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    attributes = v7->_attributes;
    v7->_attributes = (NSMutableArray *)v8;

  }
  return v7;
}

- (void)addAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXTextStyleAttributesMap attributes](self, "attributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)attributedString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD1688]);
  -[SXTextStyleAttributesMap string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SXTextStyleAttributesMap attributes](self, "attributes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "attributes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "range");
        objc_msgSend(v5, "addAttributes:range:", v12, v13, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (SXTextStyleAttributesMap)attributesMapWithAttributesForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  SXTextStyleAttributesMap *v6;
  void *v7;
  SXTextStyleAttributesMap *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  length = a3.length;
  location = a3.location;
  v25 = *MEMORY[0x24BDAC8D0];
  v6 = [SXTextStyleAttributesMap alloc];
  -[SXTextStyleAttributesMap string](self, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SXTextStyleAttributesMap initWithString:](v6, "initWithString:", v7);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SXTextStyleAttributesMap attributes](self, "attributes", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    v13 = location + length;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v15, "range") <= location)
        {
          v16 = objc_msgSend(v15, "range");
          if (v16 + v17 >= v13)
          {
            v18 = (void *)objc_msgSend(v15, "copy");
            -[SXTextStyleAttributesMap addAttributes:](v8, "addAttributes:", v18);

          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = objc_opt_class();
  -[SXTextStyleAttributesMap attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; string: %@;"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SXTextStyleAttributesMap attributes](self, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v12);

        objc_msgSend(v6, "appendString:", CFSTR("\n"));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (NSString)string
{
  return self->_string;
}

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
