@implementation NSString(IMAdditions)

- (uint64_t)hasHTML
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)hasHTML_htmlPatterns;
  if (!hasHTML_htmlPatterns)
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(<[^>\\n]+>)"), 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v3;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(&#\\d+;)"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = (void *)hasHTML_htmlPatterns;
    hasHTML_htmlPatterns = v6;

    v2 = (void *)hasHTML_htmlPatterns;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v2;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length", (_QWORD)v15));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {

          return 1;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (hasHTML_onceToken != -1)
    dispatch_once(&hasHTML_onceToken, &__block_literal_global_11);
  return objc_msgSend(a1, "containsMatchIn:", hasHTML_trie, (_QWORD)v15);
}

- (__CFString)im_stringByMemoryEfficientTrimmingCharactersInSet:()IMAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  __CFString *v8;
  uint64_t v9;
  unint64_t v10;
  __CFString *v11;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  if (!v5)
    goto LABEL_17;
  v6 = v5;
  v7 = 0;
  v8 = &stru_1E5500770;
  while (objc_msgSend(v4, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v7)))
  {
    if (v6 == ++v7)
      goto LABEL_19;
  }
  if (v6 != v7)
  {
    v9 = v6 - 1;
    if (v6 - 1 <= v7)
    {
      v10 = 0;
    }
    else
    {
      v10 = 0;
      while (objc_msgSend(v4, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v9)))
      {
        ++v10;
        --v9;
        if (~v7 + v6 == v10)
        {
          v10 = ~v7 + v6;
          break;
        }
      }
    }
    if (v6 - v10 != v7)
    {
      if (v7 | v10)
      {
        objc_msgSend(a1, "substringWithRange:", v7, v6 - v10 - v7);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_18:
        v8 = v11;
        goto LABEL_19;
      }
LABEL_17:
      v11 = a1;
      goto LABEL_18;
    }
  }
  v8 = &stru_1E5500770;
LABEL_19:

  return v8;
}

+ (id)durationFormatter
{
  void *v0;
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "threadDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectForKey:", CFSTR("kIMDurationNumberFormatterKey"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setLocale:", v3);

    objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("kIMDurationNumberFormatterKey"));
  }

  return v2;
}

+ (id)UUID
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)URLFragmentString
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "rangeOfString:", CFSTR("#"));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "substringFromIndex:", v2 + 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)stringByRemovingURLFragment
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("#"));
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v1, "substringToIndex:", v2);
    v3 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v3;
  }
  return v1;
}

- (id)stringByConvertingControlCharactersToSpace
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v2);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = a1;
  }
  else
  {
    v6 = v3;
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v6 + v7;
    v9 = objc_msgSend(v5, "length") - (v6 + v7);
    do
    {
      objc_msgSend(v5, "replaceCharactersInRange:withString:", v6, v7, CFSTR(" "));
      v10 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v2, 0, v8, v9);
      v12 = v11 - (v6 + v7) + v10;
      v8 += v12;
      v9 -= v12;
      v7 = v11;
      v6 = v10;
    }
    while (v10 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v5;
}

- (id)stringByConvertingNewlineCharacterSetToSpace
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v2);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = a1;
  }
  else
  {
    v6 = v3;
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v6 + v7;
    v9 = objc_msgSend(v5, "length") - (v6 + v7);
    do
    {
      objc_msgSend(v5, "replaceCharactersInRange:withString:", v6, v7, CFSTR(" "));
      v10 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v2, 0, v8, v9);
      v12 = v11 - (v6 + v7) + v10;
      v8 += v12;
      v9 -= v12;
      v7 = v11;
      v6 = v10;
    }
    while (v10 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v5;
}

- (CFStringRef)pf_stringWithPercentEscape
{
  return objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes(0, originalString, 0, CFSTR("\uFFFC!$&'()+,/:;=?@"),
                                           0x8000100u));
}

- (CFStringRef)stringByRemovingPercentEscapes
{
  return (id)CFURLCreateStringByReplacingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], originalString, &stru_1E5500770);
}

- (id)stringByStrippingHTML
{
  id v2;
  xmlDoc *Memory;
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(a1, "length"))
  {
    v2 = objc_retainAutorelease(a1);
    Memory = htmlReadMemory((const char *)objc_msgSend(v2, "UTF8String"), objc_msgSend(v2, "lengthOfBytesUsingEncoding:", 4), 0, "utf8", 2401);
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    appendTextFromNodeRecursively((uint64_t)Memory, v4);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    xmlFreeDoc(Memory);
  }
  else
  {
    v6 = a1;
  }
  return v6;
}

- (BOOL)containsSubstring:()IMAdditions
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 2) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isWhitespace
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

- (uint64_t)isNotWhitespace
{
  return objc_msgSend(a1, "isWhitespace") ^ 1;
}

- (id)iTunesSortString
{
  return (id)objc_msgSend(a1, "copyWithoutInsignificantPrefixAndCharacters");
}

+ (id)stringWithDuration:()IMAdditions
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v2 = (int)a2;
  v3 = ((int)a2 / 60 % 60);
  objc_msgSend(a1, "durationFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumIntegerDigits:", 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v2 / 3600));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 < 3600)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromNumber:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setMaximumIntegerDigits:", 2);
    objc_msgSend(v4, "setMinimumIntegerDigits:", 2);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v2 % 60));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromNumber:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "podcastsFoundationBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DURATION_FORMAT_MINUTES"), &stru_1E5500770, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@ %@"), 0, v8, v10, v18);
  }
  else
  {
    objc_msgSend(v4, "setMaximumIntegerDigits:", 2);
    objc_msgSend(v4, "setMinimumIntegerDigits:", 2);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromNumber:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v2 % 60));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromNumber:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "podcastsFoundationBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DURATION_FORMAT_HOURS"), &stru_1E5500770, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@ %@ %@"), 0, v6, v8, v10);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (double)durationWithHMSString:()IMAdditions
{
  void *v3;
  double v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v3, "count") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");

    if ((unint64_t)objc_msgSend(v3, "count") < 2)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v3, "count") - 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "intValue");

      if ((unint64_t)objc_msgSend(v3, "count") >= 3)
      {
        objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v3, "count") - 3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "intValue");

        v4 = (double)v10 * 60.0;
      }
    }
  }
  else
  {
    v8 = 0;
    v6 = 0;
  }

  return (double)(60 * v8) + v4 * 60.0 + (double)v6;
}

+ (uint64_t)stringWithBytesize:()IMAdditions
{
  return objc_msgSend(a1, "stringWithBytesize:countStyle:", a3, 2);
}

+ (uint64_t)stringWithBytesize:()IMAdditions countStyle:
{
  return objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:");
}

- (id)dictionaryByDecomposingQueryStringWithURLDecode:()IMAdditions
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("&"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    v10 = CFSTR("=");
    do
    {
      v11 = 0;
      v22 = v8;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v11), "componentsSeparatedByString:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count") == 2)
        {
          objc_msgSend(v12, "objectAtIndex:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndex:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((_DWORD)a3)
          {
            objc_msgSend(v13, "stringByRemovingPercentEncoding");
            v15 = v9;
            v16 = v10;
            v17 = v6;
            v18 = a3;
            v19 = v5;
            v20 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v20;
            v5 = v19;
            a3 = v18;
            v6 = v17;
            v10 = v16;
            v9 = v15;
            v8 = v22;
          }
          objc_msgSend(v5, "setObject:forKey:", v14, v13);

        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)rangeOfSignificantSubstring
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  _QWORD *v10;
  _QWORD v11[3];
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("an"), CFSTR("a"), CFSTR("the"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v3 = objc_msgSend(a1, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__NSString_IMAdditions__rangeOfSignificantSubstring__block_invoke;
  v7[3] = &unk_1E54D2A20;
  v9 = &v13;
  v10 = v11;
  v4 = v2;
  v8 = v4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 3, v7);
  v5 = v14[3];
  objc_msgSend(a1, "length");

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return v5;
}

- (uint64_t)stringByRemovingInsignificantPrefix
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "rangeOfSignificantSubstring");
  return objc_msgSend(a1, "substringWithRange:", v2, v3);
}

- (uint64_t)tokenCountWithEnumerationOptions:()IMAdditions maxTokenCount:outLimitLength:
{
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
    *a5 = objc_msgSend(a1, "length");
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = objc_msgSend(a1, "length");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__NSString_IMAdditions__tokenCountWithEnumerationOptions_maxTokenCount_outLimitLength___block_invoke;
  v12[3] = &unk_1E54D2A48;
  v12[4] = &v13;
  v12[5] = a4;
  v12[6] = a5;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, a3, v12);
  v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (id)stringByTruncatingToLength:()IMAdditions options:truncationString:
{
  id v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v8 = a5;
  if (objc_msgSend(a1, "length") <= a3)
  {
    v13 = a1;
  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v9 = objc_msgSend(a1, "length");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__NSString_IMAdditions__stringByTruncatingToLength_options_truncationString___block_invoke;
    v16[3] = &unk_1E54D2A70;
    v19 = a3;
    v10 = v8;
    v17 = v10;
    v18 = &v20;
    objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, a4, v16);
    v11 = v21[3];
    if (!v11)
    {
      v21[3] = a3;
      v11 = a3;
    }
    objc_msgSend(a1, "substringToIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      objc_msgSend(v12, "stringByAppendingString:", v10);
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v14;
    }

    _Block_object_dispose(&v20, 8);
  }

  return v13;
}

- (id)stringByEnclosingInQuotes
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "stringByRemovingEnclosingQuotations");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Quoted_Text_Format"), CFSTR("“%@”"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (__CFString)im_uppercaseStringWithLocale:()IMAdditions
{
  const __CFLocale *v4;
  __CFString *v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "uppercaseStringWithLocale:", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", a1);
    CFStringUppercase(v5, v4);
  }

  return v5;
}

- (id)stringByRemovingEnclosingQuotations
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = a1;
  v2 = (void *)MEMORY[0x1E0CB3500];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Quotes_Character_Set"), CFSTR("\"“'‘’”"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "characterSetWithCharactersInString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v1, "rangeOfCharacterFromSet:options:range:", v5, 0, 0, 1);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v1, "stringByReplacingCharactersInRange:withString:", v6, v7, &stru_1E5500770);
    v8 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v8;
  }
  if ((unint64_t)objc_msgSend(v1, "length") >= 2)
  {
    v9 = objc_msgSend(v1, "rangeOfCharacterFromSet:options:range:", v5, 0, objc_msgSend(v1, "length") - 1, 1);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v1, "stringByReplacingCharactersInRange:withString:", v9, v10, &stru_1E5500770);
      v11 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v11;
    }
  }

  return v1;
}

- (unint64_t)unsignedLongLongValue
{
  return strtoull((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), 0, 0);
}

- (uint64_t)imIsDefaultWritingMode
{
  if ((objc_msgSend(a1, "imIsVerticalWritingMode") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "imIsHorizontalWritingMode") ^ 1;
}

- (uint64_t)imIsHorizontalWritingMode
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("horizontal"));
}

- (uint64_t)imIsVerticalWritingMode
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("vertical"));
}

@end
