@implementation NSString(CSVTUIEditDistance)

- (id)_stringByFixingNamePattern:()CSVTUIEditDistance
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPrefix:", v4);

  if (v6)
  {
    objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v4, "length"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = a1;
  }
  v8 = v7;

  return v8;
}

- (id)_stringByStrippingLeadingNoise:()CSVTUIEditDistance
{
  void *v4;
  void *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", a3, 1, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "replaceMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), &stru_24CC88468);

  return v5;
}

- (id)_stringByStrippingTrailingNoise:()CSVTUIEditDistance
{
  void *v4;
  void *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", a3, 1, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "replaceMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), &stru_24CC88468);

  return v5;
}

- (id)_stringByStrippingNoiseLeadingNoise:()CSVTUIEditDistance TrailingNoise:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "_stringByStrippingLeadingNoise:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_stringByStrippingTrailingNoise:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_hasSubstring:()CSVTUIEditDistance
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 1) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_matchesRegularExpression:()CSVTUIEditDistance
{
  void *v4;
  _BOOL8 v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", a3, 1, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v5 = 0;
  else
    v5 = objc_msgSend(v4, "numberOfMatchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length")) != 0;

  return v5;
}

- (uint64_t)_caseInsensitiveHasMatchInEnumeration:()CSVTUIEditDistance
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "stringValue");
        else
          objc_msgSend(v9, "description", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lowercaseString", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "lowercaseString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          v14 = 1;
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)_firstMatchesForRegularExpressions:()CSVTUIEditDistance
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "_firstMatchesForRegularExpression:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)_firstMatchesForRegularExpression:()CSVTUIEditDistance
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", a3, 1, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (!v12)
  {
    objc_msgSend(v4, "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "numberOfRanges"))
      {
        v7 = 0;
        do
        {
          if (objc_msgSend(v6, "rangeAtIndex:", v7) == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v5, "addObject:", &stru_24CC88468);
          }
          else
          {
            v8 = objc_msgSend(v6, "rangeAtIndex:", v7);
            objc_msgSend(a1, "substringWithRange:", v8, v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v10);

          }
          ++v7;
        }
        while (v7 < objc_msgSend(v6, "numberOfRanges"));
      }
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

@end
