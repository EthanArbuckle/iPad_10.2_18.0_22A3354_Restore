@implementation NSString(SCRCStringExtras)

- (uint64_t)character32AtIndex:()SCRCStringExtras returningNumberOfComposedChars:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;

  v7 = objc_msgSend(a1, "characterAtIndex:");
  v8 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", a3);
  v9 = v8;
  v11 = v10;
  v12 = v7 & 0xFC00;
  if (v10 == 2 && v8 == a3 && v12 == 55296 && (objc_msgSend(a1, "characterAtIndex:", a3 + 1) & 0xFC00) == 0xDC00)
  {
    v13 = objc_msgSend(a1, "characterAtIndex:", a3 + 1) + ((_DWORD)v7 << 10);
LABEL_12:
    v7 = (v13 - 56613888);
    goto LABEL_19;
  }
  if (a3 && v11 == 2)
  {
    if (v9 == a3 - 1 && (objc_msgSend(a1, "characterAtIndex:", v9) & 0xFC00) == 0xD800 && v12 == 56320)
    {
      v13 = v7 + (objc_msgSend(a1, "characterAtIndex:", v9) << 10);
      goto LABEL_12;
    }
  }
  else if (v11 != 2)
  {
    goto LABEL_19;
  }
  if (v9 == a3)
  {
    v7 = objc_msgSend(a1, "characterAtIndex:", a3 + 1) | ((_DWORD)v7 << 16);
  }
  else if (a3 && v9 == a3 - 1)
  {
    v7 = v7 | (objc_msgSend(a1, "characterAtIndex:", v9) << 16);
  }
LABEL_19:
  if (a4)
    *a4 = v11;
  return v7;
}

- (id)stringByTruncatingToWordAtIndex:()SCRCStringExtras addElipses:
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  if (objc_msgSend(a1, "length") <= (unint64_t)(a3 + 1))
  {
    v15 = a1;
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", a3 + 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "rangeOfString:options:", CFSTR(" "), 4);
    if (v9)
    {
      objc_msgSend(v7, "substringToIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "length"))
      {
        v13 = v12;

        v7 = v13;
      }

    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%C"), v7, 8230);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v7;
    }
    v15 = v14;

  }
  return v15;
}

- (id)stringByReplacingCharactersInSet:()SCRCStringExtras withString:
{
  id v6;
  __CFString *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  int v14;
  id v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v6, 2) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = a1;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", a1);
    if ((objc_msgSend(v10, "isAtEnd") & 1) == 0)
    {
      v11 = 0;
      if (v7)
        v12 = v7;
      else
        v12 = &stru_24CB26880;
      while (1)
      {
        v13 = v11;
        v16 = v11;
        v14 = objc_msgSend(v10, "scanUpToCharactersFromSet:intoString:", v6, &v16);
        v11 = v16;

        if (v14)
          objc_msgSend(v9, "appendString:", v11);
        if ((objc_msgSend(v10, "isAtEnd") & 1) != 0)
          break;
        objc_msgSend(v10, "scanCharactersFromSet:intoString:", v6, 0);
        if ((objc_msgSend(v10, "isAtEnd") & 1) != 0)
          break;
        objc_msgSend(v9, "appendString:", v12);
      }

    }
    v8 = (id)objc_msgSend(v9, "copy");

  }
  return v8;
}

- (id)scrStringByTrimmingTrailingNewlines
{
  void *v1;
  uint64_t v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  int v10;
  void *v12;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  v2 = objc_msgSend(v1, "length");
  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 >= 1)
  {
    v4 = 0;
    do
    {
      v5 = objc_msgSend(v1, "rangeOfCharacterFromSet:options:", v3, 4);
      v7 = v5 == v2 - 1 && v6 == 1;
      v8 = v7;
      if (v7)
        objc_msgSend(v1, "replaceCharactersInRange:withString:", v5, v6, &stru_24CB26880);
      v9 = objc_msgSend(v1, "length");
      if (v9 > 0)
        v10 = v8;
      else
        v10 = 0;
      if (v10 != 1)
        break;
      v2 = v9;
    }
    while (v4++ < 0x64);
  }
  v12 = (void *)objc_msgSend(v1, "copy");

  return v12;
}

- (id)stringByTrimmingEmptySpaceEdges
{
  __CFString *v2;
  id v3;

  if (objc_msgSend(a1, "length"))
  {
    v2 = (__CFString *)objc_msgSend(a1, "mutableCopy");
    CFStringTrimWhitespace(v2);
    v3 = (id)-[__CFString copy](v2, "copy");

  }
  else
  {
    v3 = a1;
  }
  return v3;
}

- (uint64_t)hasMultipleWordsWithLocaleName:()SCRCStringExtras ignorePunctuation:
{
  id v6;
  const char *v7;
  size_t v8;
  UChar *v9;
  UChar *v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  int v17;
  int v18;

  if ((unint64_t)objc_msgSend(a1, "length") > 0x18)
    return 1;
  objc_msgSend(a1, "stringByTrimmingEmptySpaceEdges");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  if (!v7)
    return 0;
  v8 = strlen(v7);
  v9 = (UChar *)malloc_type_malloc(2 * v8 + 2, 0x1000040BDFB0063uLL);
  if (!v9)
    return 0;
  v10 = v9;
  u_uastrcpy(v9, v7);
  u_strlen(v10);
  v11 = 0;
  if (ubrk_open())
  {
    ubrk_first();
    if (ubrk_next() == -1)
    {
      v11 = 0;
    }
    else
    {
      v12 = ubrk_next();
      v13 = v12;
      v14 = 1;
      if (a4)
      {
        v15 = v12 - 1;
        if (v12 >= 1)
        {
          objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "characterIsMember:", (unsigned __int16)v7[v15]);

          v14 = v17 ^ 1;
        }
      }
      if (v13 == -1)
        v18 = 0;
      else
        v18 = a4;
      v11 = v18 & v14;
    }
    ubrk_close();
  }
  free(v10);
  return v11;
}

- (uint64_t)enclosingSentenceRangeForRange:()SCRCStringExtras
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  unint64_t v14;
  unint64_t v15;

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedNameOfStringEncoding:", 1);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "UTF8String");

  v8 = objc_msgSend(a1, "length");
  if (SCRCIsInt32BitSafe(v8))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ScreenReaderCore"), CFSTR("64-bit percision error"));
    return 0;
  }
  v10 = malloc_type_malloc(2 * v8, 0x1000040BDFB0063uLL);
  if (!v10)
  {
    if (SCRCLogMaskError)
      NSLog(CFSTR("malloc failed"));
    return 0;
  }
  v11 = v10;
  objc_msgSend(a1, "getCharacters:", v10);
  if (ubrk_open())
  {
    v12 = ubrk_first();
    v13 = ubrk_next();
    v14 = a3 + a4;
    v15 = v13;
    if (v13 != -1 && v14 > v13)
    {
      do
      {
        if (a3 > v15)
          v12 = v13;
        v13 = ubrk_next();
        if (v13 == -1)
          break;
        v15 = v13;
      }
      while (v14 > v13);
    }
    v9 = v12;
    ubrk_close();
  }
  else
  {
    if (SCRCLogMaskError)
      NSLog(CFSTR("no sentence boundary found"));
    v9 = 0;
  }
  free(v11);
  return v9;
}

- (unint64_t)sentenceBreakInDirection:()SCRCStringExtras fromIndex:skipCurrent:
{
  id v9;
  unint64_t v10;
  UInt8 *v11;
  UInt8 *v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  unint64_t v17;
  unint64_t v18;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  unint64_t v26;
  int v27;

  v27 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedNameOfStringEncoding:", 4);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "UTF8String");

  v10 = objc_msgSend(a1, "length");
  if (SCRCIsInt32BitSafe(v10))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ScreenReaderCore"), CFSTR("64-bit percision error"));
  }
  else if (v10 > a4)
  {
    v26 = v10 - a4;
    v11 = SCRCCopyStringToUniCharArray((const __CFString *)objc_msgSend(a1, "substringFromIndex:", a4), &v26);
    if (v11)
    {
      v12 = v11;
      if (ubrk_open() && v27 <= 0)
      {
        if (a3)
        {
          v13 = ubrk_first();
          v14 = ubrk_next();
          if (v14 == -1)
          {
            v18 = 0;
          }
          else
          {
            v15 = v14;
            if ((a5 & 1) != 0)
            {
              v16 = ubrk_next();
              v17 = v15;
              if (v26 < v16)
                v17 = a4;
              if (v16 == -1)
                v18 = v15;
              else
                v18 = v17;
            }
            else
            {
              v18 = v13;
            }
          }
        }
        else
        {
          v20 = ubrk_last();
          v21 = ubrk_previous();
          v22 = v21;
          if (a5)
          {
            v23 = v20 - v21;
            if (v26 != v20 - v21)
            {
              if (v23 < 0)
                v23 = v21 - v20;
              if (v23 <= 3)
                ubrk_previous();
              v24 = ubrk_previous();
              if (v24 == -1)
                v25 = 0;
              else
                v25 = v24;
              v22 = v25;
            }
          }
          v18 = v22;
        }
        ubrk_close();
      }
      else
      {
        if (SCRCLogMaskError)
          NSLog(CFSTR("no sentence boundary found"));
        v18 = a4;
      }
      a4 += v18;
      free(v12);
    }
  }
  return a4;
}

- (uint64_t)fourCharCodeValue
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  if (objc_msgSend(a1, "length") != 4)
    return 0;
  v2 = 0;
  LODWORD(v3) = 0;
  v4 = 24;
  do
  {
    v3 = (objc_msgSend(a1, "characterAtIndex:", v2++) << v4) + (int)v3;
    v4 -= 8;
  }
  while (v2 != 4);
  return v3;
}

- (id)contentsOfEmbeddedCommand:()SCRCStringExtras
{
  __CFString *v4;
  id v5;
  id v6;
  CFIndex v7;
  CFIndex v8;
  CFIndex v9;
  CFIndex location;
  int v11;
  CFIndex v12;
  CFIndex MatchingParen;
  CFIndex v14;
  CFIndex v15;
  CFStringRef v16;
  CFStringRef v17;
  void *v18;
  void *v19;
  id v21;
  CFIndex Length;
  CFRange result;
  CFRange v24;
  CFRange v25;
  CFRange v26;

  v21 = a3;
  v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("@%@("), v21);
  Length = CFStringGetLength(v4);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = CFStringGetLength(a1);
  result.location = 0;
  result.length = 0;
  if (v7 >= 1)
  {
    v8 = v7;
    v9 = 0;
    do
    {
      v24.length = v8 - v9;
      v24.location = v9;
      if (CFStringFindWithOptions(a1, v4, v24, 1uLL, &result) != 1)
        break;
      location = result.location;
      if (result.location
        && (v25.location = result.location - 1,
            v25.length = 1,
            v11 = CFStringFindWithOptions(a1, CFSTR("\\"), v25, 1uLL, 0),
            location = result.location,
            v11))
      {
        v9 = result.length + result.location;
      }
      else
      {
        v12 = result.length + location;
        MatchingParen = _findMatchingParen(a1, 1, result.length + location, v8);
        if (MatchingParen == -1)
          break;
        v14 = MatchingParen;
        v15 = MatchingParen - v12;
        v26.location = v12;
        v26.length = MatchingParen - v12;
        v16 = CFStringCreateWithSubstring(0, a1, v26);
        if (v16)
        {
          v17 = v16;
          objc_msgSend(v5, "addObject:", v16);
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithRange:", v12 - Length, Length + 1 + v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v18);

          v9 = v14 + 1;
          CFRelease(v17);
        }
      }
    }
    while (v9 < v8);
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v5, CFSTR("commands"), v6, CFSTR("ranges"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)containsAttachmentCharSet
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (!containsAttachmentCharSet_ReservedCharSet)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithRange:", 65532, 2);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)containsAttachmentCharSet_ReservedCharSet;
    containsAttachmentCharSet_ReservedCharSet = v2;

  }
  objc_msgSend(a1, "rangeOfCharacterFromSet:");
  return v4 != 0;
}

- (uint64_t)nextWordFromPosition:()SCRCStringExtras
{
  uint64_t v5;
  uint64_t result;
  void *v7;
  uint64_t v8;

  v5 = objc_msgSend(a1, "length");
  result = 0x7FFFFFFFFFFFFFFFLL;
  if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
  {
    if (v5 - 1 != a3)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "wordBreakCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      while (objc_msgSend(v7, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", a3)))
      {
        if (v5 == ++a3)
        {
          a3 = v5;
          goto LABEL_11;
        }
      }
      v8 = a3;
      if (a3 < v5)
      {
        do
        {
          if ((objc_msgSend(v7, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v8)) & 1) != 0)
            break;
          ++v8;
        }
        while (v5 != v8);
      }
LABEL_11:

    }
    return a3;
  }
  return result;
}

- (uint64_t)previousWordFromPosition:()SCRCStringExtras
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  uint64_t v9;

  v5 = objc_msgSend(a1, "length");
  if (a3 < 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (v5 <= a3)
  {
    a3 = v5 - 1;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD14A8], "wordBreakCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 < 1)
    {
      v9 = a3;
      if (a3 < 0)
      {
LABEL_19:
        v6 = v9 + 1;

        return v6;
      }
LABEL_13:
      a3 = 0;
    }
    else
    {
      while (objc_msgSend(v7, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", a3)))
      {
        v8 = a3-- <= 1;
        if (v8)
          goto LABEL_13;
      }
    }
    v9 = a3;
    while ((objc_msgSend(v7, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v9)) & 1) == 0)
    {
      v8 = v9-- <= 0;
      if (v8)
      {
        v9 = -1;
        goto LABEL_19;
      }
    }
    goto LABEL_19;
  }
  if (a3)
    goto LABEL_7;
  return 0;
}

- (id)stringByTrimmingLeadingCharactersInSet:()SCRCStringExtras
{
  id v4;
  unint64_t i;
  void *v6;

  v4 = a3;
  for (i = 0; i < objc_msgSend(a1, "length"); ++i)
  {
    if (!objc_msgSend(v4, "longCharacterIsMember:", objc_msgSend(a1, "character32AtIndex:returningNumberOfComposedChars:", i, 0)))break;
  }
  objc_msgSend(a1, "substringFromIndex:", i);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringByTrimmingTrailingCharactersInSet:()SCRCStringExtras
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  do
  {
    v6 = v5;
    if (!v5)
      break;
    --v5;
  }
  while ((objc_msgSend(v4, "longCharacterIsMember:", objc_msgSend(a1, "character32AtIndex:returningNumberOfComposedChars:", v6 - 1, 0)) & 1) != 0);
  objc_msgSend(a1, "substringToIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)enumerateCharacter32sInRange:()SCRCStringExtras block:
{
  void (**v8)(id, uint64_t, NSUInteger, uint64_t, _BYTE *);
  NSUInteger v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  char v18;
  NSRange v19;

  v8 = a5;
  if (a3 >= objc_msgSend(a1, "length") || (v9 = a3 + a4, a3 + a4 > objc_msgSend(a1, "length")))
  {
    v12 = (void *)MEMORY[0x24BDBCE88];
    v13 = (void *)MEMORY[0x24BDD17C8];
    v19.location = a3;
    v19.length = a4;
    NSStringFromRange(v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("The range, %@, extends beyond the bounds of the receiver: %lu"), v14, objc_msgSend(a1, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", CFSTR("SCRCInvalidRangeException"), v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v16);
  }
  v18 = 0;
  if (a3 < v9)
  {
    do
    {
      v17 = 1;
      v10 = objc_msgSend(a1, "character32AtIndex:returningNumberOfComposedChars:", a3, &v17);
      v8[2](v8, v10, a3, v17, &v18);
      a3 += v17;
      if (v18)
        v11 = 1;
      else
        v11 = a3 >= v9;
    }
    while (!v11);
  }

}

@end
