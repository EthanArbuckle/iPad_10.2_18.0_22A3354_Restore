@implementation SXTextStyleAttributes

+ (id)attributesWithRange:(_NSRange)a3
{
  return -[SXTextStyleAttributes initWithRange:]([SXTextStyleAttributes alloc], "initWithRange:", a3.location, a3.length);
}

- (SXTextStyleAttributes)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  SXTextStyleAttributes *v5;
  SXTextStyleAttributes *v6;
  uint64_t v7;
  NSMutableDictionary *mutableAttributes;
  objc_super v10;

  length = a3.length;
  location = a3.location;
  v10.receiver = self;
  v10.super_class = (Class)SXTextStyleAttributes;
  v5 = -[SXTextStyleAttributes init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_range.location = location;
    v5->_range.length = length;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    mutableAttributes = v6->_mutableAttributes;
    v6->_mutableAttributes = (NSMutableDictionary *)v7;

  }
  return v6;
}

- (void)addAttribute:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      -[SXTextStyleAttributes mutableAttributes](self, "mutableAttributes");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v6, v7);

    }
  }
}

- (NSDictionary)attributes
{
  void *v2;
  void *v3;

  -[SXTextStyleAttributes mutableAttributes](self, "mutableAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v5[2] = -[SXTextStyleAttributes range](self, "range");
  v5[3] = v6;
  -[SXTextStyleAttributes mutableAttributes](self, "mutableAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  NSRange v24;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = objc_opt_class();
  v24.location = -[SXTextStyleAttributes range](self, "range");
  NSStringFromRange(v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p; range: %@"), v4, self, v5);

  objc_msgSend(v6, "appendString:", CFSTR(" attributes(%d)"));
  -[SXTextStyleAttributes mutableAttributes](self, "mutableAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v6, "appendString:", CFSTR(": \n"));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[SXTextStyleAttributes mutableAttributes](self, "mutableAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
          -[SXTextStyleAttributes mutableAttributes](self, "mutableAttributes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("key: %@ value: %@\n"), v14, v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSMutableDictionary)mutableAttributes
{
  return self->_mutableAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAttributes, 0);
}

@end
