@implementation NSString(TSUAdditions)

+ (__CFString)tsu_stringWithUUID
{
  const __CFUUID *v0;
  const __CFUUID *v1;
  __CFString *v2;

  v0 = CFUUIDCreate(0);
  if (v0)
  {
    v1 = v0;
    v2 = (__CFString *)CFUUIDCreateString(0, v0);
    CFRelease(v1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)tsu_stringWithFormat:()TSUAdditions arguments:
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a3, a4);
}

+ (id)tsu_stringByIndentingString:()TSUAdditions times:
{
  void *v5;
  uint64_t v6;
  void *v7;
  id result;

  v5 = a3;
  v6 = objc_msgSend(a3, "length");
  if (!a4 || !v6)
    return v5;
  do
  {
    v7 = (void *)objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n  "));
    if (objc_msgSend(v7, "hasSuffix:", CFSTR("\n  ")))
      v7 = (void *)objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 2);
    result = (id)objc_msgSend(CFSTR("  "), "stringByAppendingString:", v7);
    v5 = result;
    --a4;
  }
  while (a4);
  return result;
}

+ (uint64_t)tsu_stringByIndentingString:()TSUAdditions
{
  return objc_msgSend(a1, "tsu_stringByIndentingString:times:", a3, 1);
}

- (id)tsu_stringByExpandingTableFormatting
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  int v14;
  unint64_t v15;
  unsigned int v16;
  unint64_t v17;
  __CFString *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  int v35;
  unint64_t v36;
  unsigned int v37;
  unint64_t v38;
  __CFString *v39;
  void *v40;
  unint64_t v41;
  __CFString *v42;
  unint64_t v44;
  id v46;
  int v47;
  int v48;
  void *v49;
  unint64_t v50;
  unint64_t v51;
  void *v52;
  int v53;
  _QWORD *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v3 = (void *)objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("$"));
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v60 != v8)
          objc_enumerationMutation(v3);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("|"));
        objc_msgSend(v4, "addObject:", v10);
        if ((unint64_t)v7 <= objc_msgSend(v10, "count"))
          v7 = (id)objc_msgSend(v10, "count");
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(v4, "lastObject"), "count") == 1
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "lastObject"), "objectAtIndex:", 0), "length"))
  {
    objc_msgSend(v4, "removeLastObject");
  }
  if (v7)
  {
    v46 = v2;
    v11 = malloc_type_calloc(8uLL, (size_t)v7, 0x9436C304uLL);
    v12 = malloc_type_calloc(8uLL, objc_msgSend(v4, "count"), 0x8C5163FFuLL);
    v49 = v4;
    v54 = v12;
    if (objc_msgSend(v4, "count"))
    {
      v13 = 0;
      v14 = 0;
      v50 = (unint64_t)v7;
      do
      {
        v47 = v14;
        v52 = (void *)objc_msgSend(v4, "objectAtIndex:", v13, v46);
        v15 = 0;
        v16 = 0;
        do
        {
          v17 = objc_msgSend(v52, "count");
          v18 = &stru_24D61C228;
          if (v17 > v15)
            v18 = (__CFString *)objc_msgSend(v52, "objectAtIndex:", v15);
          v19 = (void *)-[__CFString componentsSeparatedByString:](v18, "componentsSeparatedByString:", CFSTR("\n"));
          v20 = v12[v13];
          if (v20 <= objc_msgSend(v19, "count"))
            v21 = objc_msgSend(v19, "count");
          else
            v21 = v12[v13];
          v12[v13] = v21;
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v56;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v56 != v24)
                  objc_enumerationMutation(v19);
                v26 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
                v27 = v11[v15];
                if (v27 <= objc_msgSend(v26, "length"))
                  v28 = objc_msgSend(v26, "length");
                else
                  v28 = v11[v15];
                v11[v15] = v28;
              }
              v23 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
            }
            while (v23);
          }
          v15 = ++v16;
          v12 = v54;
        }
        while (v50 > v16);
        v13 = (v47 + 1);
        v4 = v49;
        v29 = objc_msgSend(v49, "count");
        v14 = v47 + 1;
      }
      while (v29 > v13);
    }
    v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    if (objc_msgSend(v4, "count"))
    {
      v30 = 0;
      v31 = 0;
      do
      {
        v48 = v31;
        v32 = objc_msgSend(v4, "objectAtIndex:", v30, v46);
        if (v12[v30])
        {
          v33 = (void *)v32;
          v34 = 0;
          v35 = 0;
          v51 = v30;
          do
          {
            v53 = v35;
            if (objc_msgSend(v33, "count"))
            {
              v36 = 0;
              v37 = 1;
              do
              {
                v38 = objc_msgSend(v33, "count");
                v39 = &stru_24D61C228;
                if (v38 > v36)
                  v39 = (__CFString *)objc_msgSend(v33, "objectAtIndex:", v36);
                v40 = (void *)-[__CFString componentsSeparatedByString:](v39, "componentsSeparatedByString:", CFSTR("\n"));
                v41 = objc_msgSend(v40, "count");
                v42 = &stru_24D61C228;
                if (v41 > v34)
                  v42 = (__CFString *)objc_msgSend(v40, "objectAtIndex:", v34);
                objc_msgSend(v7, "appendString:", -[__CFString stringByPaddingToLength:withString:startingAtIndex:](v42, "stringByPaddingToLength:withString:startingAtIndex:", v11[v36] + 1, CFSTR(" "), 0));
                v36 = v37;
              }
              while (objc_msgSend(v33, "count") > (unint64_t)v37++);
            }
            objc_msgSend(v7, "appendString:", CFSTR("\n"));
            v34 = (v53 + 1);
            v12 = v54;
            v35 = v53 + 1;
          }
          while (v54[v51] > v34);
        }
        v30 = (v48 + 1);
        v4 = v49;
        v44 = objc_msgSend(v49, "count");
        v31 = v48 + 1;
      }
      while (v44 > v30);
    }
    free(v12);
    free(v11);
    v2 = v46;
  }
  objc_msgSend(v2, "drain", v46);
  return v7;
}

- (id)tsu_stringQuotedIfContainsCharacterSet:()TSUAdditions
{
  void *v1;
  id v2;

  v1 = a1;
  if (objc_msgSend(a1, "rangeOfCharacterFromSet:") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = (id)objc_msgSend(v1, "mutableCopy");
    objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\"\"), 0, 0, objc_msgSend(v1, "length"));
    objc_msgSend(v2, "appendString:", CFSTR("\"));
    objc_msgSend(v2, "insertString:atIndex:", CFSTR("\"), 0);
    return v2;
  }
  return v1;
}

+ (uint64_t)tsu_listSeparator
{
  uint64_t result;
  const __CFLocale *v1;
  void *Value;
  const __CFString *v3;

  result = tsu_listSeparator_listSeparator;
  if (!tsu_listSeparator_listSeparator)
  {
    v1 = CFLocaleCopyCurrent();
    Value = (void *)CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x24BDBD3F8]);
    v3 = CFSTR(";");
    if ((objc_msgSend(Value, "isEqualToString:", CFSTR(",")) & 1) == 0
      && !objc_msgSend(Value, "isEqualToString:", CFSTR("٫")))
    {
      v3 = CFSTR(",");
    }
    tsu_listSeparator_listSeparator = (uint64_t)v3;
    CFRelease(v1);
    return tsu_listSeparator_listSeparator;
  }
  return result;
}

- (uint64_t)tsu_stringByAppendingSeparator:()TSUAdditions format:
{
  uint64_t v11;

  v11 = objc_msgSend(MEMORY[0x24BDD17C8], "tsu_stringWithFormat:arguments:", a4, &a9);
  if (objc_msgSend(a1, "length"))
    return objc_msgSend(a1, "stringByAppendingFormat:", CFSTR("%@%@"), a3, v11);
  return v11;
}

- (uint64_t)tsu_stringByAddingCSVEscapes
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  if (!tsu_stringByAddingCSVEscapes_characterSet)
  {
    v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"), "mutableCopy");
    objc_msgSend(v2, "formIntersectionWithCharacterSet:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet"), "invertedSet"));
    objc_msgSend(v2, "addCharactersInString:", CFSTR("\"));
    v3 = (void *)objc_msgSend((id)objc_opt_class(), "tsu_listSeparator");
    if (objc_msgSend(v3, "length") != 1)
    {
      v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUAdditions) tsu_stringByAddingCSVEscapes]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSString_TSUAdditions.m"), 225, CFSTR("The list separator is not a 1-char string"));
    }
    objc_msgSend(v2, "addCharactersInString:", v3);
    tsu_stringByAddingCSVEscapes_characterSet = objc_msgSend(v2, "copy");

  }
  return objc_msgSend(a1, "tsu_stringQuotedIfContainsCharacterSet:");
}

- (uint64_t)tsu_stringByUniquingPathInsideDirectory:()TSUAdditions
{
  return objc_msgSend(a1, "tsu_stringByUniquingPathInsideDirectory:withFormat:", a3, CFSTR("%@-%d%@"));
}

- (void)tsu_stringByUniquingPathInsideDirectory:()TSUAdditions withFormat:
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;
  id v18;

  if (!a3)
  {
    v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUAdditions) tsu_stringByUniquingPathInsideDirectory:withFormat:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSString_TSUAdditions.m"), 240, CFSTR("invalid nil value for '%s'"), "directoryPath");
  }
  v9 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  if (objc_msgSend(v9, "fileExistsAtPath:", objc_msgSend(a3, "stringByAppendingPathComponent:", a1)))
  {
    v10 = (void *)objc_opt_new();
    v11 = (__CFString *)objc_msgSend(a1, "pathExtension");
    if (v11)
    {
      v12 = v11;
      if (-[__CFString length](v11, "length"))
        v12 = (const __CFString *)objc_msgSend(CFSTR("."), "stringByAppendingString:", v12);
    }
    else
    {
      v12 = &stru_24D61C228;
    }
    v13 = objc_msgSend(a1, "stringByDeletingPathExtension");
    v14 = 2;
    do
    {
      v15 = (v14 + 1);
      a1 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", a4, v13, v14, v12);
      v16 = objc_msgSend(v9, "fileExistsAtPath:", objc_msgSend(a3, "stringByAppendingPathComponent:", a1));
      v14 = v15;
    }
    while ((v16 & 1) != 0);
    v17 = a1;
    objc_msgSend(v10, "drain");
    v18 = a1;
  }
  return a1;
}

- (__CFString)tsu_stringByFixingBrokenSurrogatePairs
{
  __CFString *v1;
  uint64_t v2;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t v5;
  __CFString *v6;
  int64_t v7;
  int64_t v8;
  UniChar v9;
  int64_t v10;
  int v11;
  int64_t v12;
  int64_t v13;
  UniChar v14;
  int64_t v15;
  const UniChar *v16;
  const char *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CFStringRef theString;
  const UniChar *v28;
  const char *v29;
  uint64_t v30;
  int64_t v31;
  int64_t v32;
  int64_t v33;
  CFRange v34;
  CFRange v35;

  v1 = a1;
  v2 = -[__CFString length](a1, "length");
  theString = v1;
  v30 = 0;
  v31 = v2;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  v28 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  v32 = 0;
  v33 = 0;
  v29 = CStringPtr;
  if (v2 >= 1)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    do
    {
      if ((v7 & 0x8000000000000000) == 0)
      {
        v8 = v31;
        if (v31 > v7)
        {
          if (v28)
          {
            v9 = v28[v30 + v7];
          }
          else if (v29)
          {
            v9 = v29[v30 + v7];
          }
          else
          {
            if (v33 <= v7 || v5 > v7)
            {
              v10 = v7 - 4;
              if ((unint64_t)v7 < 4)
                v10 = 0;
              if (v10 + 64 < v31)
                v8 = v10 + 64;
              v32 = v10;
              v33 = v8;
              v34.location = v30 + v10;
              v34.length = v8 - v10;
              CFStringGetCharacters(theString, v34, (UniChar *)&v19);
              v5 = v32;
            }
            v9 = *((_WORD *)&v19 + v7 - v5);
          }
          v11 = v9 & 0xFC00;
          if (v11 == 56320)
          {
LABEL_37:
            if (!v6)
            {
              v6 = (__CFString *)(id)-[__CFString mutableCopyWithZone:](v1, "mutableCopyWithZone:", 0, v19, v20, v21, v22, v23, v24, v25, v26);
              v1 = v6;
            }
            -[__CFString replaceCharactersInRange:withString:](v6, "replaceCharactersInRange:withString:", v7, 1, CFSTR("\uFFFD"), v19, v20, v21, v22, v23, v24, v25, v26);
            v2 = -[__CFString length](v1, "length");
            theString = v1;
            v30 = 0;
            v31 = v2;
            v16 = CFStringGetCharactersPtr(v1);
            v17 = 0;
            v28 = v16;
            if (!v16)
              v17 = CFStringGetCStringPtr(v1, 0x600u);
            v5 = 0;
            v29 = v17;
            v32 = 0;
            v33 = 0;
            goto LABEL_42;
          }
          if (v11 == 55296)
          {
            v12 = v7 + 1;
            if (v7 + 1 >= v2)
              goto LABEL_37;
            v13 = v31;
            if (v31 <= v12)
              goto LABEL_37;
            if (v28)
            {
              v14 = v28[v30 + v12];
            }
            else if (v29)
            {
              v14 = v29[v30 + v12];
            }
            else
            {
              if (v33 <= v12 || v5 > v12)
              {
                v15 = v7 - 3;
                if ((unint64_t)v7 < 3)
                  v15 = 0;
                if (v15 + 64 < v31)
                  v13 = v15 + 64;
                v32 = v15;
                v33 = v13;
                v35.location = v30 + v15;
                v35.length = v13 - v15;
                CFStringGetCharacters(theString, v35, (UniChar *)&v19);
                v5 = v32;
              }
              v14 = *((_WORD *)&v19 + v12 - v5);
            }
            if (v14 >> 10 != 55)
              goto LABEL_37;
            ++v7;
          }
        }
      }
LABEL_42:
      ++v7;
    }
    while (v7 < v2);
  }
  return v1;
}

- (uint64_t)tsu_md5Hash
{
  void *v1;
  unint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  CC_MD5_CTX c;
  unsigned __int8 md[16];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)objc_msgSend(a1, "dataUsingEncoding:", 2483028224);
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  v2 = objc_msgSend(v1, "length");
  v3 = objc_msgSend(v1, "bytes");
  if (v2)
  {
    v4 = (char *)v3;
    do
    {
      if (v2 >= 0xFFFFFFFF)
        v5 = 0xFFFFFFFFLL;
      else
        v5 = v2;
      CC_MD5_Update(&c, v4, v5);
      v4 += v5;
      v2 -= v5;
    }
    while (v2);
  }
  CC_MD5_Final(md, &c);
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x"), md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], md[8], md[9], md[10], md[11], md[12], md[13], md[14], md[15]);
}

- (void)tsu_stringByRemovingCharactersInSet:()TSUAdditions options:
{
  void *v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v4 = a1;
  if (a3)
  {
    if (objc_msgSend(a1, "rangeOfCharacterFromSet:") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v8 = objc_msgSend(v4, "length");
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        v11 = a4 & 0xFFFFFFFB;
        v12 = v8;
        do
        {
          v13 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", a3, v11, v10, v12);
          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
            v15 = 0;
          else
            v15 = v14;
          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
            v16 = v9;
          else
            v16 = v13;
          objc_msgSend(v7, "appendString:", objc_msgSend(v4, "substringWithRange:", v10, v16 - v10));
          v10 = v15 + v16;
          v12 = v9 - (v15 + v16);
        }
        while (v9 != v15 + v16);
      }
      return v7;
    }
  }
  else
  {
    v17 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUAdditions) tsu_stringByRemovingCharactersInSet:options:]");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSString_TSUAdditions.m"), 369, CFSTR("invalid nil value for '%s'"), "charSet");
  }
  return v4;
}

- (uint64_t)tsu_stringByRemovingCharactersInSet:()TSUAdditions
{
  return objc_msgSend(a1, "tsu_stringByRemovingCharactersInSet:options:", a3, 0);
}

- (void)tsu_stringByReplacingCharactersInSet:()TSUAdditions withCharacter:
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;

  v14 = a4;
  if (a3)
  {
    v6 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", a3, 4, 0, objc_msgSend(a1, "length"));
    v8 = 0;
    v9 = 0;
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_3:

      goto LABEL_5;
    }
    v11 = v6;
    v12 = v7;
    v9 = 0;
    v8 = 0;
    while (1)
    {
      if (v9)
      {
        if (!v8)
          goto LABEL_14;
      }
      else
      {
        v9 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a1);
        if (!v8)
LABEL_14:
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &v14, 1);
      }
      objc_msgSend(v9, "replaceCharactersInRange:withString:", v11, v12, v8);
      v11 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", a3, 4, 0, v11);
      v12 = v13;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_3;
    }
  }
  v9 = 0;
LABEL_5:
  if (v9)
    return v9;
  else
    return a1;
}

- (uint64_t)tsu_stringByReplacingInstancesOfCharactersInSet:()TSUAdditions withString:
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  id v11;

  v6 = a1;
  if (objc_msgSend(a1, "rangeOfCharacterFromSet:options:", a3, 2) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(v6, "length"));
    v8 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v6);
    objc_msgSend(v8, "setCharactersToBeSkipped:", 0);
    v11 = 0;
    while ((objc_msgSend(v8, "isAtEnd") & 1) == 0)
    {
      if (objc_msgSend(v8, "scanUpToCharactersFromSet:intoString:", a3, &v11))
        objc_msgSend(v7, "appendString:", v11);
      if ((objc_msgSend(v8, "isAtEnd") & 1) != 0)
        break;
      objc_msgSend(v8, "scanCharactersFromSet:intoString:", a3, &v11);
      for (i = objc_msgSend(v11, "length"); i; --i)
        objc_msgSend(v7, "appendString:", a4);
    }
    return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
  }
  return (uint64_t)v6;
}

- (id)tsu_escapeForIcuRegex
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  if (!tsu_escapeForIcuRegex_icuRegexCharSet)
  {
    objc_sync_enter(obj);
    if (!tsu_escapeForIcuRegex_icuRegexCharSet)
    {
      v2 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("*?+[(){}^$|\\./"));
      __dmb(0xBu);
      tsu_escapeForIcuRegex_icuRegexCharSet = (uint64_t)v2;
      if (!v2)
      {
        v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUAdditions) tsu_escapeForIcuRegex]");
        objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSString_TSUAdditions.m"), 483, CFSTR("Couldn't initialize lazy variable %s"), "icuRegexCharSet");
      }
    }
    objc_sync_exit(obj);
  }
  v5 = objc_msgSend(obj, "length");
  *(_QWORD *)&v11 = objc_msgSend(obj, "rangeOfCharacterFromSet:", tsu_escapeForIcuRegex_icuRegexCharSet);
  if ((_QWORD)v11 == 0x7FFFFFFFFFFFFFFFLL)
    return obj;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", objc_msgSend(obj, "substringToIndex:", (_QWORD)v11));
  if (v5 != (_QWORD)v11)
  {
    do
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("\\%C"), objc_msgSend(obj, "characterAtIndex:", (_QWORD)v11));
      *(_QWORD *)&v11 = v11 + 1;
      *((_QWORD *)&v11 + 1) = v5 - v11;
      v8 = v11;
      if (v5 != (_QWORD)v11)
      {
        *(_QWORD *)&v10 = objc_msgSend(obj, "rangeOfCharacterFromSet:options:range:", tsu_escapeForIcuRegex_icuRegexCharSet, 0, (_QWORD)v11);
        *((_QWORD *)&v10 + 1) = v9;
        v11 = v10;
        if ((_QWORD)v10 == 0x7FFFFFFFFFFFFFFFLL)
          v11 = (unint64_t)v5;
        if ((_QWORD)v11 != v8)
          objc_msgSend(v7, "appendString:", objc_msgSend(obj, "substringWithRange:", v8, (_QWORD)v11 - v8));
      }
    }
    while (*((_QWORD *)&v11 + 1));
  }
  return v7;
}

- (uint64_t)tsu_isDescendantOfPath:()TSUAdditions
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  unsigned int v11;

  v4 = (void *)objc_msgSend(a1, "pathComponents");
  v5 = (void *)objc_msgSend(a3, "pathComponents");
  v6 = objc_msgSend(v5, "count");
  do
  {
    v7 = v6;
    if (!v6)
      break;
    --v6;
  }
  while ((objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v7 - 1), "isEqualToString:", CFSTR("/")) & 1) != 0);
  v8 = objc_msgSend(v4, "count");
  result = v7 <= v8;
  if (v7 - 1 < v8)
  {
    v10 = 0;
    v11 = 1;
    do
    {
      result = objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v10), "isEqualToString:", objc_msgSend(v5, "objectAtIndex:", v10));
      if (v7 <= v11)
        break;
      v10 = v11++;
    }
    while ((result & 1) != 0);
  }
  return result;
}

- (BOOL)tsu_isChildOfPath:()TSUAdditions
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  v4 = (void *)objc_msgSend((id)objc_msgSend(a1, "pathComponents"), "mutableCopy");
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "pathComponents"), "mutableCopy");
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    do
    {
      if (!objc_msgSend((id)objc_msgSend(v4, "lastObject"), "isEqualToString:", CFSTR("/")))
        break;
      objc_msgSend(v4, "removeObjectAtIndex:", objc_msgSend(v4, "count") - 1);
    }
    while ((unint64_t)objc_msgSend(v4, "count") > 1);
  }
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    do
    {
      if (!objc_msgSend((id)objc_msgSend(v5, "lastObject"), "isEqualToString:", CFSTR("/")))
        break;
      objc_msgSend(v5, "removeObjectAtIndex:", objc_msgSend(v5, "count") - 1);
    }
    while ((unint64_t)objc_msgSend(v5, "count") > 1);
  }
  v6 = objc_msgSend(v5, "count") + 1;
  v7 = objc_msgSend(v4, "count");
  v8 = v6 == v7;
  v9 = objc_msgSend(v5, "count");
  if (v9 && v6 == v7)
  {
    v10 = v9;
    v11 = 0;
    v12 = 1;
    do
    {
      v13 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v11), "isEqualToString:", objc_msgSend(v5, "objectAtIndex:", v11));
      v8 = v13;
      if (v10 <= v12)
        break;
      v11 = v12++;
    }
    while ((v13 & 1) != 0);
  }

  return v8;
}

- (char)tsu_stringWithRealpath
{
  char *result;
  char *v2;
  uint64_t v3;

  result = realpath_DARWIN_EXTSN((const char *)objc_msgSend(a1, "fileSystemRepresentation"), 0);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", result, 4);
    free(v2);
    return (char *)v3;
  }
  return result;
}

- (uint64_t)tsu_substringWithComposedCharacterSequencesToIndex:()TSUAdditions
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v5 = objc_msgSend(a1, "length");
  v6 = 0;
  do
  {
    v7 = v6;
    if (v6 >= v5)
      break;
    objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", v6);
    v6 = v8 + v7;
  }
  while (v8 + v7 <= a3);
  result = (uint64_t)a1;
  if (v7 != v5)
    return objc_msgSend(a1, "substringToIndex:", v7);
  return result;
}

- (uint64_t)tsu_substringWithComposedCharacterSequencesToFileSystemLength:()TSUAdditions
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v5 = objc_msgSend(a1, "length");
  v6 = 0;
  if (v5)
  {
    v7 = 0;
    do
    {
      v8 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", v6);
      v10 = v9;
      v7 += strlen((const char *)objc_msgSend((id)objc_msgSend(a1, "substringWithRange:", v8, v9), "fileSystemRepresentation"));
      if (v7 > a3)
        break;
      v6 += v10;
    }
    while (v6 < v5);
  }
  result = (uint64_t)a1;
  if (v6 != v5)
    return objc_msgSend(a1, "substringToIndex:", v6);
  return result;
}

- (__CFString)tsu_stringWithPathRelativeTo:()TSUAdditions
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v18;

  if (!a3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "stringByStandardizingPath"), "pathComponents");
  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "stringByStandardizingPath"), "pathComponents");
  v8 = objc_msgSend(v6, "count");
  v9 = objc_msgSend(v7, "count");
  if (v8 < v9)
    goto LABEL_10;
  v10 = v9;
  if (!v9)
    goto LABEL_8;
  v11 = 0;
  v12 = 1;
  do
  {
    if ((objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", v11), "isEqualToString:", objc_msgSend(v6, "objectAtIndex:", v11)) & 1) == 0)break;
    v11 = v12;
  }
  while (v10 > v12++);
  if (v10 != v11)
  {
LABEL_10:
    v14 = 0;
  }
  else
  {
LABEL_8:
    if (v8 == v10)
    {
      v14 = &stru_24D61C228;
    }
    else
    {
      v18 = objc_msgSend(v6, "subarrayWithRange:", v10, v8 - v10);
      v14 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v18);
    }
  }
  v15 = v14;
  objc_msgSend(v5, "drain");
  v16 = v14;
  return v14;
}

- (uint64_t)tsu_stringWithPathRelativeTo:()TSUAdditions allowBacktracking:
{
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __CFString *v13;

  if ((a4 & 1) == 0)
    return objc_msgSend(a1, "tsu_stringWithPathRelativeTo:", a3);
  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "stringByStandardizingPath"), "pathComponents");
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "stringByStandardizingPath"), "pathComponents");
  v7 = objc_msgSend(v5, "count");
  v8 = objc_msgSend(v6, "count");
  v9 = v8;
  v10 = 0;
  if (v8 >= v7)
    v11 = v7;
  else
    v11 = v8;
  if (v11)
  {
    while (objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v10), "isEqualToString:", objc_msgSend(v5, "objectAtIndex:", v10)))
    {
      if (v11 == ++v10)
      {
        v10 = v11;
        break;
      }
    }
  }
  v12 = v9 - v10;
  if (v9 <= v10)
  {
    v13 = &stru_24D61C228;
  }
  else
  {
    v13 = &stru_24D61C228;
    do
    {
      v13 = (__CFString *)-[__CFString stringByAppendingPathComponent:](v13, "stringByAppendingPathComponent:", CFSTR(".."));
      --v12;
    }
    while (v12);
  }
  if (v10 < v7)
  {
    do
      v13 = (__CFString *)-[__CFString stringByAppendingPathComponent:](v13, "stringByAppendingPathComponent:", objc_msgSend(v5, "objectAtIndex:", v10++));
    while (v7 != v10);
  }
  return (uint64_t)v13;
}

+ (uint64_t)tsu_stringByBase64EncodingBytes:()TSUAdditions length:
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "tsu_stringByBase64EncodingBytes:length:breakLines:", a3, a4, 0);
}

+ (void)tsu_stringByBase64EncodingBytes:()TSUAdditions length:breakLines:
{
  unint64_t v6;
  void *v8;
  uint64_t v9;
  _BYTE *v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v16;

  v6 = a4;
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 4 * a4 / 3);
  if (v6 < 3)
  {
    v13 = 0;
  }
  else
  {
    v9 = 0;
    v10 = (_BYTE *)(a3 + 2);
    v11 = -4;
    v12 = 4;
    do
    {
      objc_msgSend(v8, "appendFormat:", CFSTR("%c%c%c%c"), Base64Alphabet[*(v10 - 2) >> 2], Base64Alphabet[((unint64_t)((*(v10 - 1) << 8) | (*(v10 - 2) << 16)) >> 12) & 0x3F], Base64Alphabet[((unint64_t)(*v10 | (*(v10 - 1) << 8)) >> 6) & 0x3F], Base64Alphabet[*v10 & 0x3F]);
      if (a5 && !(v11 + 76 * (v12 / 0x4C)))
        objc_msgSend(v8, "appendString:", CFSTR("\n"));
      v10 += 3;
      v11 -= 4;
      v12 += 4;
      v9 -= 3;
    }
    while (v6 + v9 > 2);
    v13 = -v9;
    v6 += v9;
  }
  if (v6 == 1)
  {
    objc_msgSend(v8, "appendFormat:", CFSTR("%c%c=="), Base64Alphabet[(unint64_t)*(unsigned __int8 *)(a3 + v13) >> 2], Base64Alphabet[16 * (*(_BYTE *)(a3 + v13) & 3)], v16);
  }
  else if (v6 == 2)
  {
    v14 = (unsigned __int8 *)(a3 + v13);
    objc_msgSend(v8, "appendFormat:", CFSTR("%c%c%c="), Base64Alphabet[*v14 >> 2], Base64Alphabet[((unint64_t)((*v14 << 16) | (v14[1] << 8)) >> 12) & 0x3F], Base64Alphabet[4 * (v14[1] & 0xF)]);
  }
  return v8;
}

- (uint64_t)tsu_encodeStringBase64
{
  const char *v1;

  v1 = (const char *)objc_msgSend(a1, "UTF8String");
  return objc_msgSend(MEMORY[0x24BDD17C8], "tsu_stringByBase64EncodingBytes:length:", v1, strlen(v1));
}

- (id)tsu_stringByMakingFirstCharacterUppercase
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  if (objc_msgSend(v2, "length"))
    objc_msgSend(v2, "replaceCharactersInRange:withString:", 0, 1, objc_msgSend((id)objc_msgSend(a1, "substringToIndex:", 1), "uppercaseString"));
  return v2;
}

+ (uint64_t)tsu_stringWithXMLString:()TSUAdditions
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a3, 4);
}

- (id)tsu_escapeXML
{
  id v1;

  v1 = (id)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&gt;"),
    0,
    0,
    objc_msgSend(v1, "length"));
  return v1;
}

- (id)tsu_unescapeXML
{
  id v1;

  v1 = (id)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&amp;"),
    CFSTR("&"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&lt;"),
    CFSTR("<"),
    0,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&gt;"),
    CFSTR(">"),
    0,
    0,
    objc_msgSend(v1, "length"));
  return v1;
}

- (BOOL)tsu_containsOnlyCharactersFromSet:()TSUAdditions
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:", objc_msgSend(a3, "invertedSet")) == 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)tsu_tolerantStringByAppendingPathExtension:()TSUAdditions
{
  if ((objc_msgSend(a1, "isEqualToString:", &stru_24D61C228) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", &stru_24D61C228) & 1) != 0)
  {
    return (uint64_t)a1;
  }
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("\\\\")))
    return objc_msgSend(CFSTR("\\"), "stringByAppendingString:", objc_msgSend(CFSTR("\\"), "stringByAppendingPathExtension:", a3));
  if (objc_msgSend(a1, "length") && objc_msgSend(a1, "characterAtIndex:", 0) == 126)
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFSTR("X"), "stringByAppendingString:", a1), "stringByAppendingPathExtension:", a3), "substringFromIndex:", 1);
  return objc_msgSend(a1, "stringByAppendingPathExtension:", a3);
}

@end
