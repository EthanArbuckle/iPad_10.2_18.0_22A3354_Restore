@implementation NSString(OCStringAdditions)

+ (id)tc_mapString:()OCStringAdditions
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  void *v9;
  __int16 v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v3);
  v6 = 0;
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v8 = objc_msgSend(v3, "characterAtIndex:", i);
      if (v8 == 13 || v8 == 10)
        ++v6;
      if (v8 != 13 && v8 != 10)
        break;
    }
  }
  objc_msgSend(v5, "deleteCharactersInRange:", 0, v6);
  v11 = 8232;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", v9, CFSTR("\v"), 2, 0, objc_msgSend(v5, "length"));

  return v5;
}

+ (BOOL)tc_skipString:()OCStringAdditions
{
  id v3;
  unint64_t v4;
  int v5;
  _BOOL8 v7;
  uint64_t v9;
  unsigned int v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = objc_msgSend(v3, "characterAtIndex:", 0);
    v7 = v5 == 13 || v5 == 10;
    if (v7 && v4 >= 2)
    {
      v9 = 1;
      while (1)
      {
        v10 = objc_msgSend(v3, "characterAtIndex:", v9);
        v7 = 0;
        if (v10 > 0x20 || ((1 << v10) & 0x100002600) == 0)
          break;
        if (++v9 >= v4)
          goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    v7 = 1;
  }

  return v7;
}

- (id)tc_initialsFromAuthorName
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(" "));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "length", (_QWORD)v10))
        {
          objc_msgSend(v7, "substringToIndex:", 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendString:", v8);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return v2;
}

- (uint64_t)tc_languageTypeAtIndex:()OCStringAdditions effectiveRange:
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  BOOL v14;
  BOOL v15;

  v15 = 0;
  v7 = OCLanguageTypeForCharacter(objc_msgSend(a1, "characterAtIndex:"), &v15);
  if (a4)
  {
    *a4 = a3;
    v8 = objc_msgSend(a1, "length");
    v9 = a3 + 1;
    if (v9 < v8)
    {
      v10 = v8;
      v11 = v15;
      do
      {
        v14 = 0;
        v12 = OCLanguageTypeForCharacter(objc_msgSend(a1, "characterAtIndex:", v9), &v14);
        if (!v14)
        {
          if (v11)
          {
            v11 = 0;
            v7 = v12;
          }
          else
          {
            if ((_DWORD)v7 != (_DWORD)v12)
              goto LABEL_11;
            v11 = 0;
          }
        }
        ++v9;
      }
      while (v10 != v9);
      v9 = v10;
    }
LABEL_11:
    a4[1] = v9 - *a4;
  }
  return v7;
}

- (id)tc_escapedPath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tc_escapedFragment
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "URLFragmentAllowedCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
