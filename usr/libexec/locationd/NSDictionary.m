@implementation NSDictionary

- (id)cl_deepMutableCopy
{
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSDictionary count](self, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(self);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "cl_deepCopy");
        v9 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v8), "cl_deepCopy");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  return v3;
}

- (id)cl_deepCopy
{
  id v2;
  id v3;

  v2 = -[NSDictionary cl_deepMutableCopy](self, "cl_deepMutableCopy");
  v3 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", v2);

  return v3;
}

@end
