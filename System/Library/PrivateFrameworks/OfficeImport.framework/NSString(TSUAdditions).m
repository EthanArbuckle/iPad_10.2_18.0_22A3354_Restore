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
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:arguments:", v6, a4);

  return v7;
}

+ (id)tsu_stringByIndentingString:()TSUAdditions times:
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (a4 && v6)
  {
    do
    {
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n  "));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "hasSuffix:", CFSTR("\n  ")))
      {
        objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 2);
        v8 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v8;
      }
      objc_msgSend(CFSTR("  "), "stringByAppendingString:", v7);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      --a4;
    }
    while (a4);
  }
  v9 = v5;

  return v9;
}

+ (uint64_t)tsu_stringByIndentingString:()TSUAdditions
{
  return objc_msgSend(a1, "tsu_stringByIndentingString:times:", a3, 1);
}

- (id)tsu_stringByExpandingTableFormatting
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  unsigned int v21;
  __CFString *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  int v37;
  void *v38;
  unint64_t v39;
  int v40;
  unint64_t v41;
  unsigned int v42;
  __CFString *v43;
  void *v44;
  __CFString *v45;
  void *v46;
  unint64_t v48;
  id v50;
  void *v51;
  int v52;
  int v53;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  int v58;
  _QWORD *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22E2DDB58]();
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("$"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v65 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("|"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);
        v12 = objc_msgSend(v11, "count");
        if ((unint64_t)v8 <= v12)
          v8 = (id)v12;

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v4, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v4, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (!v16)
      objc_msgSend(v4, "removeLastObject");
  }
  else
  {

  }
  if (v8)
  {
    v50 = v5;
    v51 = v2;
    v17 = malloc_type_calloc(8uLL, (size_t)v8, 0x96F136E8uLL);
    v59 = malloc_type_calloc(8uLL, objc_msgSend(v4, "count"), 0xA3BDF298uLL);
    v54 = v4;
    if (objc_msgSend(v4, "count"))
    {
      v18 = 0;
      v19 = 0;
      do
      {
        v52 = v19;
        objc_msgSend(v4, "objectAtIndexedSubscript:", v18);
        v55 = v18;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v21 = 0;
        do
        {
          v22 = &stru_24F3BFFF8;
          if (objc_msgSend(v57, "count") > v20)
          {
            objc_msgSend(v57, "objectAtIndexedSubscript:", v20);
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          -[__CFString componentsSeparatedByString:](v22, "componentsSeparatedByString:", CFSTR("\n"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v59[v18];
          v25 = objc_msgSend(v23, "count");
          if (v24 <= v25)
            v26 = v25;
          else
            v26 = v24;
          v59[v18] = v26;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v27 = v23;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v61;
            do
            {
              for (j = 0; j != v29; ++j)
              {
                if (*(_QWORD *)v61 != v30)
                  objc_enumerationMutation(v27);
                v32 = v17[v20];
                v33 = objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "length");
                if (v32 <= v33)
                  v34 = v33;
                else
                  v34 = v32;
                v17[v20] = v34;
              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
            }
            while (v29);
          }

          v20 = ++v21;
          v18 = v55;
        }
        while ((unint64_t)v8 > v21);

        v18 = (v52 + 1);
        v4 = v54;
        v35 = objc_msgSend(v54, "count");
        v19 = v52 + 1;
      }
      while (v35 > v18);
    }
    v8 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    if (objc_msgSend(v4, "count"))
    {
      v36 = 0;
      v37 = 0;
      do
      {
        v53 = v37;
        objc_msgSend(v4, "objectAtIndexedSubscript:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v59[v36])
        {
          v39 = 0;
          v40 = 0;
          v56 = v36;
          do
          {
            v58 = v40;
            if (objc_msgSend(v38, "count"))
            {
              v41 = 0;
              v42 = 1;
              do
              {
                v43 = &stru_24F3BFFF8;
                if (objc_msgSend(v38, "count") > v41)
                {
                  objc_msgSend(v38, "objectAtIndexedSubscript:", v41);
                  v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                -[__CFString componentsSeparatedByString:](v43, "componentsSeparatedByString:", CFSTR("\n"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = &stru_24F3BFFF8;
                if (objc_msgSend(v44, "count") > v39)
                {
                  objc_msgSend(v44, "objectAtIndexedSubscript:", v39);
                  v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                -[__CFString stringByPaddingToLength:withString:startingAtIndex:](v45, "stringByPaddingToLength:withString:startingAtIndex:", v17[v41] + 1, CFSTR(" "), 0);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "appendString:", v46);

                v41 = v42;
              }
              while (objc_msgSend(v38, "count") > (unint64_t)v42++);
            }
            objc_msgSend(v8, "appendString:", CFSTR("\n"));
            v39 = (v58 + 1);
            v40 = v58 + 1;
          }
          while (v59[v56] > v39);
        }

        v36 = (v53 + 1);
        v4 = v54;
        v48 = objc_msgSend(v54, "count");
        v37 = v53 + 1;
      }
      while (v48 > v36);
    }
    free(v59);
    free(v17);
    v5 = v50;
    v2 = v51;
  }

  objc_autoreleasePoolPop(v2);
  return v8;
}

- (id)tsu_stringQuotedIfContainsCharacterSet:()TSUAdditions
{
  id v4;
  void *v5;

  v4 = a1;
  if (objc_msgSend(v4, "rangeOfCharacterFromSet:", a3) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\"\"), 0, 0, objc_msgSend(v4, "length"));
    objc_msgSend(v5, "appendString:", CFSTR("\"));
    objc_msgSend(v5, "insertString:atIndex:", CFSTR("\"), 0);

    v4 = v5;
  }
  return v4;
}

- (id)tsu_stringByAppendingSeparator:()TSUAdditions format:
{
  id v11;
  void *v12;
  uint64_t v13;

  v11 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "tsu_stringWithFormat:arguments:", a4, &a9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(a1, "stringByAppendingFormat:", CFSTR("%@%@"), v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }

  return v12;
}

- (id)tsu_stringByAddingCSVEscapesForLocale:()TSUAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "localeSpecificStorageForKey:", CFSTR("stringByAddingCSVEscapes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invertedSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formIntersectionWithCharacterSet:", v9);

    objc_msgSend(v7, "addCharactersInString:", CFSTR("\"));
    objc_msgSend(v4, "listSeparator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length") != 1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUAdditions) tsu_stringByAddingCSVEscapesForLocale:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSString_TSUAdditions.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 191, 0, "The list separator is not a 1-char string");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    objc_msgSend(v7, "addCharactersInString:", v10);
    v5 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setLocaleSpecificStorage:forKey:", v5, CFSTR("stringByAddingCSVEscapes"));

  }
  objc_msgSend(a1, "tsu_stringQuotedIfContainsCharacterSet:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (uint64_t)tsu_stringByUniquingPathInsideDirectory:()TSUAdditions
{
  return objc_msgSend(a1, "tsu_stringByUniquingPathInsideDirectory:withFormat:", a3, CFSTR("%@-%d%@"));
}

- (id)tsu_stringByUniquingPathInsideDirectory:()TSUAdditions withFormat:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *context;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUAdditions) tsu_stringByUniquingPathInsideDirectory:withFormat:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSString_TSUAdditions.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 205, 0, "invalid nil value for '%{public}s'", "directoryPath");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v10 = a1;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

  if (v13)
  {
    v14 = MEMORY[0x22E2DDB58]();
    objc_msgSend(v10, "pathExtension");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    context = (void *)v14;
    if (v15)
    {
      v16 = v15;
      if (-[__CFString length](v15, "length"))
      {
        objc_msgSend(CFSTR("."), "stringByAppendingString:", v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v16 = (__CFString *)v17;
      }
    }
    else
    {
      v16 = &stru_24F3BFFF8;
    }
    objc_msgSend(v10, "stringByDeletingPathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 2;
    do
    {
      v20 = v10;
      v21 = (v19 + 1);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v7, v18, v19, v16);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "stringByAppendingPathComponent:", v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v11, "fileExistsAtPath:", v22);

      v19 = v21;
    }
    while ((v23 & 1) != 0);

    objc_autoreleasePoolPop(context);
  }

  return v10;
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
  v2 = -[__CFString length](v1, "length");
  theString = v1;
  v30 = 0;
  v31 = v2;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  v28 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v32 = 0;
  v33 = 0;
  v29 = CStringPtr;
  if (v2 >= 1)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
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
      if (++v7 >= v2)
      {

        return v1;
      }
    }
  }
  return v1;
}

- (id)tsu_stringByRemovingCharactersInSet:()TSUAdditions options:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v6 = a3;
  if (v6)
  {
    v7 = a1;
    if (objc_msgSend(v7, "rangeOfCharacterFromSet:", v6) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "length");
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = a4 & 0xFFFFFFFB;
        v15 = v11;
        do
        {
          v16 = objc_msgSend(v7, "rangeOfCharacterFromSet:options:range:", v6, v14, v13, v15);
          if (v16 == 0x7FFFFFFFFFFFFFFFLL)
            v18 = 0;
          else
            v18 = v17;
          if (v16 == 0x7FFFFFFFFFFFFFFFLL)
            v19 = v12;
          else
            v19 = v16;
          objc_msgSend(v7, "substringWithRange:", v13, v19 - v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendString:", v20);

          v13 = v18 + v19;
          v15 = v12 - (v18 + v19);
        }
        while (v12 != v18 + v19);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSUAdditions) tsu_stringByRemovingCharactersInSet:options:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSString_TSUAdditions.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 283, 0, "invalid nil value for '%{public}s'", "charSet");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v8 = a1;
  }

  return v8;
}

- (uint64_t)tsu_stringByRemovingCharactersInSet:()TSUAdditions
{
  return objc_msgSend(a1, "tsu_stringByRemovingCharactersInSet:options:", a3, 0);
}

- (id)tsu_stringByReplacingInstancesOfCharactersInSet:()TSUAdditions withString:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  uint64_t i;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v6, 2) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(a1, "length"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCharactersToBeSkipped:", 0);
    if ((objc_msgSend(v10, "isAtEnd") & 1) == 0)
    {
      v11 = 0;
      while (1)
      {
        v17 = v11;
        v12 = objc_msgSend(v10, "scanUpToCharactersFromSet:intoString:", v6, &v17);
        v13 = v17;

        if (v12)
          objc_msgSend(v9, "appendString:", v13);
        if ((objc_msgSend(v10, "isAtEnd") & 1) != 0)
          break;
        v16 = v13;
        objc_msgSend(v10, "scanCharactersFromSet:intoString:", v6, &v16);
        v11 = v16;

        for (i = objc_msgSend(v11, "length"); i; --i)
          objc_msgSend(v9, "appendString:", v7);
        if ((objc_msgSend(v10, "isAtEnd") & 1) != 0)
          goto LABEL_13;
      }
      v11 = v13;
LABEL_13:

    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (uint64_t)tsu_countInstancesOfString:()TSUAdditions options:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a3;
  v7 = objc_msgSend(a1, "length");
  v8 = objc_msgSend(v6, "length");
  v9 = objc_msgSend(a1, "rangeOfString:options:range:", v6, a4, 0, v7);
  v10 = 0;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
    v10 = 0;
    do
    {
      ++v10;
      v12 = v9 + v8;
      v7 = v7 - (v9 + v8) + v11;
      v9 = objc_msgSend(a1, "rangeOfString:options:range:", v6, a4, v9 + v8, v7);
      v11 = v12;
    }
    while (v9 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v10;
}

- (id)tsu_escapeForIcuRegex
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;

  if (tsu_escapeForIcuRegex_icuRegexCharSetToken != -1)
    dispatch_once(&tsu_escapeForIcuRegex_icuRegexCharSetToken, &__block_literal_global_6);
  v2 = a1;
  v3 = objc_msgSend(v2, "length");
  *(_QWORD *)&v12 = objc_msgSend(v2, "rangeOfCharacterFromSet:", tsu_escapeForIcuRegex_icuRegexCharSet);
  if ((_QWORD)v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v2;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD16A8]);
    objc_msgSend(v2, "substringToIndex:", (_QWORD)v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "initWithString:", v6);

    if (v3 != (_QWORD)v12)
    {
      do
      {
        objc_msgSend(v4, "appendFormat:", CFSTR("\\%C"), objc_msgSend(v2, "characterAtIndex:", (_QWORD)v12));
        *(_QWORD *)&v12 = v12 + 1;
        *((_QWORD *)&v12 + 1) = v3 - v12;
        v7 = v12;
        if (v3 != (_QWORD)v12)
        {
          *(_QWORD *)&v11 = objc_msgSend(v2, "rangeOfCharacterFromSet:options:range:", tsu_escapeForIcuRegex_icuRegexCharSet, 0, (_QWORD)v12);
          *((_QWORD *)&v11 + 1) = v8;
          v12 = v11;
          if ((_QWORD)v11 == 0x7FFFFFFFFFFFFFFFLL)
            v12 = (unint64_t)v3;
          if ((_QWORD)v12 != v7)
          {
            objc_msgSend(v2, "substringWithRange:", v7, (_QWORD)v12 - v7);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "appendString:", v9);

          }
        }
      }
      while (*((_QWORD *)&v12 + 1));
    }

  }
  return v4;
}

- (uint64_t)tsu_isDescendantOfPath:()TSUAdditions
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(a1, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    do
    {
      v8 = v7 - 1;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7 - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("/"));

      if (!v10)
        break;
      --v7;
    }
    while (v8);
  }
  v11 = objc_msgSend(v5, "count");
  v12 = v7 <= v11;
  if (v7 - 1 < v11)
  {
    v13 = 0;
    v14 = 1;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "isEqualToString:", v16);

      if (v7 <= v14)
        break;
      v13 = v14++;
    }
    while ((v12 & 1) != 0);
  }

  return v12;
}

- (uint64_t)tsu_isChildOfPath:()TSUAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(a1, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    do
    {
      objc_msgSend(v6, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("/"));

      if (!v10)
        break;
      objc_msgSend(v6, "removeObjectAtIndex:", objc_msgSend(v6, "count") - 1);
    }
    while ((unint64_t)objc_msgSend(v6, "count") > 1);
  }
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    do
    {
      objc_msgSend(v8, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("/"));

      if (!v12)
        break;
      objc_msgSend(v8, "removeObjectAtIndex:", objc_msgSend(v8, "count") - 1);
    }
    while ((unint64_t)objc_msgSend(v8, "count") > 1);
  }
  v13 = objc_msgSend(v8, "count") + 1;
  v14 = objc_msgSend(v6, "count");
  v15 = v13 == v14;
  v16 = objc_msgSend(v8, "count");
  if (v16 && v13 == v14)
  {
    v17 = v16;
    v18 = 0;
    v19 = 1;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v20, "isEqualToString:", v21);

      if (v17 <= v19)
        break;
      v18 = v19++;
    }
    while ((v15 & 1) != 0);
  }

  return v15;
}

- (id)tsu_stringWithRealpath
{
  char *v1;
  char *v2;
  void *v3;

  v1 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), 0);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v1, 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    free(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)tsu_substringWithComposedCharacterSequencesTruncatedToLength:()TSUAdditions
{
  id v5;

  if (objc_msgSend(a1, "length") <= a3)
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", a3));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)tsu_substringWithComposedCharacterSequencesToFileSystemLength:()TSUAdditions
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  id v13;

  v5 = objc_msgSend(a1, "length");
  v6 = 0;
  if (v5)
  {
    v7 = 0;
    do
    {
      v8 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", v6);
      v10 = v9;
      objc_msgSend(a1, "substringWithRange:", v8, v9);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");

      v7 += strlen(v12);
      if (v7 > a3)
        break;
      v6 += v10;
    }
    while (v6 < v5);
  }
  if (v6 == v5)
  {
    v13 = a1;
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (__CFString)tsu_stringWithPathRelativeTo:()TSUAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;
  char v17;
  __CFString *v19;
  void *v21;
  void *v22;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x22E2DDB58]();
    objc_msgSend(a1, "stringByStandardizingPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByStandardizingPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v7, "count");
    v11 = objc_msgSend(v9, "count");
    if (v10 < v11)
      goto LABEL_10;
    v12 = v11;
    if (!v11)
      goto LABEL_8;
    v22 = v5;
    v13 = 0;
    v14 = 1;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if ((v17 & 1) == 0)
        break;
      v13 = v14;
    }
    while (v12 > v14++);
    v5 = v22;
    if (v12 != v13)
    {
LABEL_10:
      v19 = 0;
    }
    else
    {
LABEL_8:
      if (v10 == v12)
      {
        v19 = &stru_24F3BFFF8;
      }
      else
      {
        objc_msgSend(v7, "subarrayWithRange:", v12, v10 - v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v21);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (__CFString)tsu_stringWithPathRelativeTo:()TSUAdditions allowBacktracking:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  int v19;
  __CFString *v20;
  unint64_t v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;

  v6 = a3;
  if ((a4 & 1) != 0)
  {
    objc_msgSend(a1, "stringByStandardizingPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByStandardizingPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v8, "count");
    v12 = objc_msgSend(v10, "count");
    v13 = v12;
    if (v12 >= v11)
      v14 = v11;
    else
      v14 = v12;
    if (v14)
    {
      v15 = 0;
      v16 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqualToString:", v18);

        if (!v19)
          break;
        v15 = ++v16;
      }
      while (v14 > v16);
    }
    else
    {
      v16 = 0;
    }
    v21 = v13 - v16;
    if (v13 <= v16)
    {
      v23 = &stru_24F3BFFF8;
    }
    else
    {
      v22 = &stru_24F3BFFF8;
      do
      {
        -[__CFString stringByAppendingPathComponent:](v22, "stringByAppendingPathComponent:", CFSTR(".."));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v22 = v23;
        --v21;
      }
      while (v21);
    }
    if (v16 >= v11)
    {
      v20 = v23;
    }
    else
    {
      do
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingPathComponent:](v23, "stringByAppendingPathComponent:", v24);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v16;
        v23 = v20;
      }
      while (v11 != v16);
    }

  }
  else
  {
    objc_msgSend(a1, "tsu_stringWithPathRelativeTo:", v6);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (__CFString)tsu_stringByTrimmingCharactersInSetFromFront:()TSUAdditions
{
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;

  v4 = a1;
  v5 = -[__CFString rangeOfCharacterFromSet:options:](v4, "rangeOfCharacterFromSet:options:", a3, 8);
  v7 = v6;
  if (v6 == -[__CFString length](v4, "length"))
  {
    v8 = &stru_24F3BFFF8;
LABEL_5:

    v4 = (__CFString *)v8;
    return v4;
  }
  if (!v5)
  {
    -[__CFString substringFromIndex:](v4, "substringFromIndex:", v7);
    v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v4;
}

+ (id)tsu_stringWithHexFromBytes:()TSUAdditions length:
{
  uint64_t v4;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  unsigned int v9;

  v4 = a4;
  v6 = 2 * a4;
  v7 = malloc_type_malloc(2 * a4, 0x99C091F4uLL);
  if (v4)
  {
    v8 = v7;
    do
    {
      v9 = *a3++;
      *v8 = a0123456789abcd[(unint64_t)v9 >> 4];
      v8[1] = a0123456789abcd[v9 & 0xF];
      v8 += 2;
      --v4;
    }
    while (v4);
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, v6, 1, 1);
}

+ (uint64_t)tsu_stringByBase64EncodingBytes:()TSUAdditions length:
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "tsu_stringByBase64EncodingBytes:length:breakLines:", a3, a4, 0);
}

+ (id)tsu_stringByBase64EncodingBytes:()TSUAdditions length:breakLines:
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
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 4 * a4 / 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
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

  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  return objc_msgSend(MEMORY[0x24BDD17C8], "tsu_stringByBase64EncodingBytes:length:", v1, strlen(v1));
}

- (id)tsu_stringByMakingFirstCharacterLowercase
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(v1, "substringToIndex:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lowercaseString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isEqualToString:", v3) & 1) == 0)
    {
      objc_msgSend(v1, "substringFromIndex:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByAppendingString:", v4);
      v5 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v5;
    }

  }
  return v1;
}

- (id)tsu_stringByMakingFirstCharacterUppercase
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(a1, "substringToIndex:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uppercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "replaceCharactersInRange:withString:", 0, 1, v4);

  }
  return v2;
}

+ (uint64_t)tsu_stringWithXMLString:()TSUAdditions
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a3, 4);
}

- (id)tsu_escapeXML
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
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
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
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
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "invertedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v4);

  return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)tsu_tolerantStringByAppendingPathExtension:()TSUAdditions
{
  id v4;
  id v5;
  void *v6;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if ((objc_msgSend(a1, "isEqualToString:", &stru_24F3BFFF8) & 1) == 0
    && !objc_msgSend(v4, "isEqualToString:", &stru_24F3BFFF8))
  {
    if (objc_msgSend(a1, "isEqualToString:", CFSTR("\\\\")))
    {
      objc_msgSend(CFSTR("\\"), "stringByAppendingPathExtension:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("\\"), "stringByAppendingString:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(a1, "length") || objc_msgSend(a1, "characterAtIndex:", 0) != 126)
      {
        objc_msgSend(a1, "stringByAppendingPathExtension:", v4);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
      objc_msgSend(CFSTR("X"), "stringByAppendingString:", a1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingPathExtension:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "substringFromIndex:", 1);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v9;

    goto LABEL_5;
  }
  v5 = a1;
LABEL_4:
  v6 = v5;
LABEL_5:

  return v6;
}

+ (id)tsu_stringByHexEncodingData:()TSUAdditions
{
  id v3;
  void *v4;
  id v5;
  unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  v6 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  if (v7)
  {
    v8 = v7;
    do
    {
      v9 = *v6++;
      objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), v9);
      --v8;
    }
    while (v8);
  }
  v10 = (void *)objc_msgSend(v4, "copy");

  return v10;
}

- (uint64_t)tsu_rangeOfString:()TSUAdditions options:updatingSearchRange:
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a3;
  v9 = v8;
  if (a5)
  {
    v10 = *a5;
    v11 = a5[1];
    v12 = objc_msgSend(a1, "rangeOfString:options:range:", v8, a4, *a5, v11);
    v14 = v12;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_OWORD *)a5 = NSInvalidRange;
    }
    else if ((a4 & 4) != 0)
    {
      *a5 = v10;
      a5[1] = v12 - v10;
    }
    else
    {
      *a5 = v12 + v13;
      a5[1] = v11 + v10 - (v12 + v13);
    }
  }
  else
  {
    v14 = objc_msgSend(a1, "rangeOfString:options:range:", v8, a4, 0, objc_msgSend(v8, "length"));
  }

  return v14;
}

- (uint64_t)tsu_range
{
  objc_msgSend(a1, "length");
  return 0;
}

- (void)tsu_enumerateRangesOfCharactersInSet:()TSUAdditions usingBlock:
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t, _BYTE *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", a1);
  objc_msgSend(v8, "setCaseSensitive:", 1);
  objc_msgSend(v8, "setCharactersToBeSkipped:", 0);
  if ((objc_msgSend(v8, "isAtEnd") & 1) == 0)
  {
    do
    {
      v9 = objc_msgSend(v8, "scanLocation");
      if (objc_msgSend(v8, "scanCharactersFromSet:intoString:", v6, 0))
      {
        v10 = objc_msgSend(v8, "scanLocation");
        v11 = 0;
        v7[2](v7, v9, v10 - v9, &v11);
        if (v11)
          break;
      }
      if ((objc_msgSend(v8, "isAtEnd") & 1) == 0)
        objc_msgSend(v8, "scanUpToCharactersFromSet:intoString:", v6, 0);
    }
    while (!objc_msgSend(v8, "isAtEnd"));
  }

}

- (BOOL)tsu_containsSubstring:()TSUAdditions
{
  return objc_msgSend(a1, "rangeOfString:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)tsu_setOfContainedWordsIncludingPunctuationAndSymbols:()TSUAdditions
{
  void (**v5)(void *, __CFStringTokenizer *);
  CFIndex v6;
  const __CFLocale *v7;
  __CFStringTokenizer *v8;
  CFStringTokenizerTokenType v9;
  uint64_t v10;
  CFRange CurrentTokenRange;
  CFIndex location;
  CFIndex length;
  CFIndex v14;
  CFIndex v15;
  CFIndex v16;
  uint64_t v17;
  CFRange v18;
  CFIndex v19;
  CFIndex v20;
  int v21;
  CFRange v22;
  CFIndex v23;
  CFIndex v25;
  CFIndex v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v31;
  CFIndex v32;
  __CFString *v33;
  CFIndex v34;
  int v35;
  void *v36;
  _QWORD aBlock[4];
  char v38;
  CFRange v39;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__NSString_TSUAdditions__tsu_setOfContainedWordsIncludingPunctuationAndSymbols___block_invoke;
  aBlock[3] = &__block_descriptor_33_e30_Q16__0____CFStringTokenizer__8l;
  v35 = a3;
  v38 = a3;
  v5 = (void (**)(void *, __CFStringTokenizer *))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[__CFString length](a1, "length");
  v7 = CFLocaleCopyCurrent();
  v32 = v6;
  v33 = a1;
  v39.location = 0;
  v39.length = v6;
  v8 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a1, v39, 4uLL, v7);
  CFRelease(v7);
  v9 = CFStringTokenizerGoToTokenAtIndex(v8, 0);
  LODWORD(v10) = v9;
  if (!v9)
    v5[2](v5, v8);
  CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v8);
  if (CurrentTokenRange.location != -1)
  {
    location = CurrentTokenRange.location;
    length = CurrentTokenRange.length;
    v14 = 0;
    v15 = CurrentTokenRange.length;
    do
    {
      if (location >= v14)
        v16 = v14;
      else
        v16 = location;
      v34 = v16;
      v17 = ((uint64_t (*)(void *, __CFStringTokenizer *))v5[2])(v5, v8);
      v18 = CFStringTokenizerGetCurrentTokenRange(v8);
      v19 = v18.location;
      v20 = v18.length;
      if (v35)
      {
        while (1)
        {
          v21 = v10;
          v10 = v17;
          if (((v21 | v17) & 0x20) != 0)
          {
            if ((v17 & 0x10) == 0)
              goto LABEL_20;
          }
          else if ((v17 & 0x10) != 0 && v20 == 1)
          {
            if ((objc_msgSend(v36, "characterIsMember:", -[__CFString characterAtIndex:](v33, "characterAtIndex:", v19)) & 1) != 0)
            {
              v29 = 1;
              goto LABEL_21;
            }
          }
          else if (!v17 || (v17 & 0x10) != 0)
          {
            goto LABEL_20;
          }
          v17 = ((uint64_t (*)(void *, __CFStringTokenizer *))v5[2])(v5, v8);
          v22 = CFStringTokenizerGetCurrentTokenRange(v8);
          v19 = v22.location;
          v20 = v22.length;
        }
      }
      v10 = v17;
LABEL_20:
      v29 = v20;
LABEL_21:
      v23 = location + v15;
      if (location + v15 <= v32)
        v23 = v32;
      if (v19 > v32 || v10 == 0)
        v14 = v23;
      else
        v14 = v19;
      if (v35)
        v25 = v34;
      else
        v25 = location;
      if (v35)
        v26 = v14 - v34;
      else
        v26 = length;
      -[__CFString substringWithRange:](v33, "substringWithRange:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v36);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v28, "length"))
        objc_msgSend(v31, "addObject:", v28);

      location = v19;
      length = v20;
      v15 = v29;
    }
    while (v19 != -1);
  }
  if (v8)
    CFRelease(v8);

  return v31;
}

- (uint64_t)tsu_stringWithoutAttachmentCharacters
{
  if (tsu_stringWithoutAttachmentCharacters_onceToken != -1)
    dispatch_once(&tsu_stringWithoutAttachmentCharacters_onceToken, &__block_literal_global_77);
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", tsu_stringWithoutAttachmentCharacters_sAttachmentCharacter, &stru_24F3BFFF8);
}

- (id)tsu_middleTruncateToLength:()TSUAdditions
{
  id v4;
  void *v5;

  v4 = a1;
  if (objc_msgSend(v4, "length") <= a3)
  {
    v5 = v4;
  }
  else
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    do
      objc_msgSend(v5, "replaceCharactersInRange:withString:", ((unint64_t)objc_msgSend(v5, "length") >> 1) - 1, 3, CFSTR("…"));
    while (objc_msgSend(v5, "length") > a3);

  }
  return v5;
}

- (uint64_t)tsu_isEqualToString:()TSUAdditions
{
  if (a3)
    return objc_msgSend(a1, "isEqualToString:");
  else
    return 0;
}

- (id)tsu_stringWithNormalizedHyphensAndQuotationMarks
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "tsu_stringWithNormalizedHyphens");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tsu_stringWithNormalizedQuotationMarks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)tsu_stringWithNormalizedHyphens
{
  if (tsu_stringWithNormalizedHyphens_onceToken != -1)
    dispatch_once(&tsu_stringWithNormalizedHyphens_onceToken, &__block_literal_global_80);
  return objc_msgSend(a1, "tsu_stringByReplacingInstancesOfCharactersInSet:withString:", tsu_stringWithNormalizedHyphens_hyphenSet, CFSTR("-"));
}

- (uint64_t)tsu_stringWithNormalizedQuotationMarks
{
  if (tsu_stringWithNormalizedQuotationMarks_onceToken != -1)
    dispatch_once(&tsu_stringWithNormalizedQuotationMarks_onceToken, &__block_literal_global_85);
  return objc_msgSend(a1, "tsu_stringByReplacingInstancesOfCharactersInSet:withString:", tsu_stringWithNormalizedQuotationMarks_quotationSet, CFSTR("'"));
}

@end
