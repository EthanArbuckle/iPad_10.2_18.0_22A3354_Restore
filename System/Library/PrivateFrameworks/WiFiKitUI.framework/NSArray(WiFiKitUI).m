@implementation NSArray(WiFiKitUI)

- (uint64_t)stringFromContentsOfArray
{
  return objc_msgSend(a1, "stringFromContentsOfArrayWithDelimiter:", CFSTR(","));
}

- (id)stringFromContentsOfArrayWithDelimiter:()WiFiKitUI
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = objc_msgSend(a1, "count");
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = a1;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "appendString:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          if (v5 - 1 - v10 != i)
            objc_msgSend(v6, "appendFormat:", CFSTR("%@ "), v4);
        }
        v10 += v9;
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)arrayAfterFilteringOutEmptyStrings
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "removeObject:", &stru_24DB39F78);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
