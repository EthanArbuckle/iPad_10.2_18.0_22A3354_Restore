@implementation NSAttributedString(TSUAdditions)

- (uint64_t)tsu_RTFFromRange:()TSUAdditions documentAttributes:
{
  void *v8;

  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a5);
  objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x24BDF6638], *MEMORY[0x24BDF65F0]);
  return objc_msgSend(a1, "dataFromRange:documentAttributes:error:", a3, a4, v8, 0);
}

- (uint64_t)tsu_RTFDFromRange:()TSUAdditions documentAttributes:
{
  void *v8;

  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a5);
  objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x24BDF6630], *MEMORY[0x24BDF65F0]);
  return objc_msgSend(a1, "dataFromRange:documentAttributes:error:", a3, a4, v8, 0);
}

- (void)tsu_stringByFixingBrokenSurrogatePairs
{
  void *v1;
  const __CFString *v2;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t v6;
  id v7;
  int64_t v8;
  CFIndex v9;
  UniChar v10;
  int64_t v11;
  int v12;
  int64_t v13;
  CFIndex v14;
  UniChar v15;
  int64_t v16;
  const __CFString *v17;
  const UniChar *v18;
  const char *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CFStringRef theString;
  const UniChar *v30;
  const char *v31;
  uint64_t v32;
  CFIndex v33;
  int64_t v34;
  int64_t v35;
  CFRange v36;
  CFRange v37;

  v1 = a1;
  v2 = (const __CFString *)objc_msgSend(a1, "string");
  Length = CFStringGetLength(v2);
  theString = v2;
  v32 = 0;
  v33 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v2);
  CStringPtr = 0;
  v30 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v2, 0x600u);
  v34 = 0;
  v35 = 0;
  v31 = CStringPtr;
  if (Length >= 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    do
    {
      if ((v8 & 0x8000000000000000) == 0)
      {
        v9 = v33;
        if (v33 > v8)
        {
          if (v30)
          {
            v10 = v30[v32 + v8];
          }
          else if (v31)
          {
            v10 = v31[v32 + v8];
          }
          else
          {
            if (v35 <= v8 || v6 > v8)
            {
              v11 = v8 - 4;
              if ((unint64_t)v8 < 4)
                v11 = 0;
              if (v11 + 64 < v33)
                v9 = v11 + 64;
              v34 = v11;
              v35 = v9;
              v36.location = v32 + v11;
              v36.length = v9 - v11;
              CFStringGetCharacters(theString, v36, (UniChar *)&v21);
              v6 = v34;
            }
            v10 = *((_WORD *)&v21 + v8 - v6);
          }
          v12 = v10 & 0xFC00;
          if (v12 == 56320)
          {
LABEL_37:
            if (!v7)
            {
              v7 = (id)objc_msgSend(v1, "mutableCopyWithZone:", 0, v21, v22, v23, v24, v25, v26, v27, v28);
              v1 = v7;
            }
            objc_msgSend(v7, "replaceCharactersInRange:withString:", v8, 1, CFSTR("\uFFFD"), v21, v22, v23, v24, v25, v26, v27, v28);
            v17 = (const __CFString *)objc_msgSend(v1, "string");
            Length = CFStringGetLength(v17);
            theString = v17;
            v32 = 0;
            v33 = Length;
            v18 = CFStringGetCharactersPtr(v17);
            v19 = 0;
            v30 = v18;
            if (!v18)
              v19 = CFStringGetCStringPtr(v17, 0x600u);
            v6 = 0;
            v31 = v19;
            v34 = 0;
            v35 = 0;
            goto LABEL_42;
          }
          if (v12 == 55296)
          {
            v13 = v8 + 1;
            if (v8 + 1 >= Length)
              goto LABEL_37;
            v14 = v33;
            if (v33 <= v13)
              goto LABEL_37;
            if (v30)
            {
              v15 = v30[v32 + v13];
            }
            else if (v31)
            {
              v15 = v31[v32 + v13];
            }
            else
            {
              if (v35 <= v13 || v6 > v13)
              {
                v16 = v8 - 3;
                if ((unint64_t)v8 < 3)
                  v16 = 0;
                if (v16 + 64 < v33)
                  v14 = v16 + 64;
                v34 = v16;
                v35 = v14;
                v37.location = v32 + v16;
                v37.length = v14 - v16;
                CFStringGetCharacters(theString, v37, (UniChar *)&v21);
                v6 = v34;
              }
              v15 = *((_WORD *)&v21 + v13 - v6);
            }
            if (v15 >> 10 != 55)
              goto LABEL_37;
            ++v8;
          }
        }
      }
LABEL_42:
      ++v8;
    }
    while (v8 < Length);
  }
  return v1;
}

- (id)tsu_stringWithoutAttachments
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithAttributedString:", a1);
  v12 = 0;
  v13 = 0;
  v3 = objc_msgSend(a1, "length");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *MEMORY[0x24BDF65C0];
    do
    {
      v8 = objc_msgSend(a1, "attribute:atIndex:effectiveRange:", v7, v6, &v12);
      v10 = v12;
      v9 = v13;
      if (v8)
      {
        objc_msgSend(v2, "deleteCharactersInRange:", v12 - v5, v13);
        v5 += v13;
      }
      v6 = v9 + v10;
    }
    while (v9 + v10 < v4);
  }
  return v2;
}

- (uint64_t)tsu_nextTableStringFromIndex:()TSUAdditions tableRange:
{
  unint64_t v6;
  uint64_t v7;

  v6 = objc_msgSend(a1, "length");
  if (a4)
  {
    v7 = v6 - a3;
    if (v6 < a3)
      v7 = 0;
    *a4 = a3;
    a4[1] = v7;
  }
  return 0;
}

- (uint64_t)tsu_rangeofNextTableFromIndex:()TSUAdditions
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)tsu_numberOfTables
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  if (!objc_msgSend(a1, "length"))
    return 0;
  v2 = objc_msgSend(a1, "length");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = 0;
  v5 = 0;
  do
  {
    v7 = 0;
    v8 = 0;
    if (objc_msgSend(a1, "tsu_nextTableStringFromIndex:tableRange:", v5, &v7))
      ++v4;
    v5 = v8 + v7;
  }
  while (v8 + v7 < v3);
  return v4;
}

- (uint64_t)tsu_textTablesInRange:()TSUAdditions
{
  return objc_msgSend(MEMORY[0x24BDBCEB8], "array");
}

+ (uint64_t)tsu_carriageReturnAttributedString
{
  uint64_t result;
  void *v1;
  __int16 v2;

  result = tsu_carriageReturnAttributedString_sCarriageReturnAttributedString;
  if (!tsu_carriageReturnAttributedString_sCarriageReturnAttributedString)
  {
    v2 = 13;
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &v2, 1);
    tsu_carriageReturnAttributedString_sCarriageReturnAttributedString = objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v1);

    return tsu_carriageReturnAttributedString_sCarriageReturnAttributedString;
  }
  return result;
}

@end
