@implementation NSString(TIExtras)

- (__CFString)_isNaturallyRTL
{
  __CFString *v1;
  unint64_t v2;
  int BaseDirection;
  char *v4;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = -[__CFString length](result, "length");
    if (CFStringGetCharactersPtr(v1))
    {
      BaseDirection = ubidi_getBaseDirection();
    }
    else
    {
      if (v2 < 0x81)
        v4 = &v5;
      else
        v4 = (char *)malloc_type_malloc(2 * v2, 0x1000040BDFB0063uLL);
      -[__CFString getCharacters:](v1, "getCharacters:", v4);
      BaseDirection = ubidi_getBaseDirection();
      if (v2 >= 0x81)
        free(v4);
    }
    return (__CFString *)(BaseDirection == 1);
  }
  return result;
}

- (BOOL)_containsSubstring:()TIExtras
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 2) != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)_stringWithUnichar:()TIExtras
{
  int v3;
  uint64_t v4;
  _WORD v6[2];

  if ((a3 - 0x10000) >> 20)
  {
    v4 = 1;
    LOWORD(v3) = a3;
  }
  else
  {
    v3 = (a3 >> 10) - 10304;
    v6[1] = a3 & 0x3FF | 0xDC00;
    v4 = 2;
  }
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v6, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isIdeographicGlyphs
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  UChar32 v7;
  UChar32 v8;
  _BOOL8 result;

  v2 = objc_msgSend(a1, "length");
  if (!v2)
    return 1;
  v3 = v2;
  v4 = 0;
  v5 = 0;
  v6 = v2 - 1;
  while (1)
  {
    v7 = objc_msgSend(a1, "characterAtIndex:", v4);
    v8 = v7;
    if (v6 > v4 && (v7 & 0xFC00) == 0xD800)
      v8 = objc_msgSend(a1, "characterAtIndex:", ++v5) + (v7 << 10) - 56613888;
    if (!u_hasBinaryProperty(v8, UCHAR_IDEOGRAPHIC) && u_getIntPropertyValue(v8, UCHAR_EAST_ASIAN_WIDTH) != 3)
    {
      result = TICharIsJapaneseScript();
      if (!result)
        break;
    }
    v4 = ++v5;
    if (v3 <= v5)
      return 1;
  }
  return result;
}

+ (uint64_t)_ti_string:()TIExtras matchesStringIgnoringNullity:
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") || objc_msgSend(v6, "length"))
  {
    if (v6)
      v7 = objc_msgSend(v5, "isEqualToString:", v6);
    else
      v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (uint64_t)_string:()TIExtras matchesString:
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend((id)v5, "isEqualToString:", v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)_containsEmojiOnly
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  if (!objc_msgSend(a1, "length"))
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v2 = objc_msgSend(a1, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__NSString_TIExtras___containsEmojiOnly__block_invoke;
  v6[3] = &unk_1E2438DE0;
  v6[4] = &v7;
  objc_msgSend(a1, "_enumerateEmojiTokensInRange:block:", 0, v2, v6);
  v3 = v8[3];
  v4 = v3 == objc_msgSend(a1, "length");
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (uint64_t)_containsIdeographicCharacters
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonIdeographicCharacterSet")) ^ 1;
}

- (BOOL)_contentsExclusivelyInCharacterSet:()TIExtras
{
  unint64_t v2;
  id v3;
  _BOOL8 result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  _QWORD v12[126];

  v12[125] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  v3 = objc_retainAutorelease(a1);
  if (objc_msgSend(v3, "_fastCharacterContents"))
    return uset_containsAllCodePoints() != 0;
  if (v2 > 0x1F3)
  {
    v6 = v2;
    v7 = 500;
    do
    {
      v8 = v6 - 500;
      if (v6 >= 0x1F4)
        v9 = 500;
      else
        v9 = v6;
      objc_msgSend(v3, "getCharacters:range:", v12, v7 - 500, v9);
      v10 = uset_containsAllCodePoints();
      result = v10 != 0;
      if (!v10)
        break;
      v6 = v8;
      v11 = v7 >= v2;
      v7 += 500;
    }
    while (!v11);
  }
  else
  {
    MEMORY[0x1E0C80A78]();
    objc_msgSend(v3, "getCharacters:range:", (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), 0, v2);
    return uset_containsAllCodePoints() != 0;
  }
  return result;
}

+ (uint64_t)_nonIdeographicCharacterSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__NSString_TIExtras___nonIdeographicCharacterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonIdeographicCharacterSet___onceToken != -1)
    dispatch_once(&_nonIdeographicCharacterSet___onceToken, block);
  return _nonIdeographicCharacterSet___nonIdeographicCharacterSet;
}

- (BOOL)_containsEmoji
{
  if (__TIEmojiCharacterSet___onceToken != -1)
    dispatch_once(&__TIEmojiCharacterSet___onceToken, &__block_literal_global_287);
  return __TIEmojiCharacterSet___emojiCharacterSet
      && objc_msgSend(a1, "rangeOfCharacterFromSet:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)_containsCJKSymbolsAndPunctuation
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__NSString_TIExtras___containsCJKSymbolsAndPunctuation__block_invoke;
  block[3] = &unk_1E243B440;
  block[4] = a1;
  if (_containsCJKSymbolsAndPunctuation___onceToken != -1)
    dispatch_once(&_containsCJKSymbolsAndPunctuation___onceToken, block);
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", _containsCJKSymbolsAndPunctuation___nonCJKSymbolsSet) ^ 1;
}

- (uint64_t)_firstChar
{
  uint64_t result;

  result = objc_msgSend(a1, "length");
  if (result)
    return objc_msgSend(a1, "characterAtIndex:", 0);
  return result;
}

- (uint64_t)_ti_supplementalPrefixOfLastToken:()TIExtras
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFCharacterSet *v9;
  _BOOL4 v10;
  uint64_t v11;
  const __CFCharacterSet *Predefined;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  if (v5)
  {
    v6 = v5 - 1;
    if (v5 != 1)
    {
      while (v6)
      {
        v7 = v6 - 1;
        v8 = objc_msgSend(a1, "characterAtIndex:");
        if (objc_msgSend(v4, "characterIsMember:", v8))
        {
          v11 = objc_msgSend(a1, "characterAtIndex:", v7);
          if ((objc_msgSend(v4, "characterIsMember:", v11) & 1) == 0)
          {
            if (u_hasBinaryProperty(v11, UCHAR_IDEOGRAPHIC))
              goto LABEL_13;
            if (__56__NSString_TIExtras___ti_supplementalPrefixOfLastToken___block_invoke(v11))
              goto LABEL_13;
            Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
            if (CFCharacterSetIsLongCharacterMember(Predefined, v11))
              goto LABEL_13;
          }
          goto LABEL_12;
        }
        v9 = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
        if (!CFCharacterSetIsLongCharacterMember(v9, v8))
        {
          v10 = __56__NSString_TIExtras___ti_supplementalPrefixOfLastToken___block_invoke(v8);
          v6 = v7;
          if (!v10)
            continue;
        }
        goto LABEL_12;
      }
    }
    v8 = objc_msgSend(a1, "characterAtIndex:", v6);
    if (objc_msgSend(v4, "characterIsMember:", v8))
      v8 = v8;
    else
      v8 = 0;
  }
  else
  {
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (uint64_t)_firstLongCharacter
{
  uint64_t v2;
  int v3;

  if (!objc_msgSend(a1, "length"))
    return 0;
  v2 = objc_msgSend(a1, "characterAtIndex:", 0);
  if ((v2 & 0xFC00) == 0xD800 && (unint64_t)objc_msgSend(a1, "length") >= 2)
  {
    v3 = objc_msgSend(a1, "characterAtIndex:", 1);
    if ((v3 & 0xFC00) == 0xDC00)
      return (v3 + ((_DWORD)v2 << 10) - 56613888);
  }
  return v2;
}

- (uint64_t)_lastLongCharacter
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v2 = objc_msgSend(a1, "length");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = objc_msgSend(a1, "characterAtIndex:", v2 - 1);
  if ((v4 & 0xFC00) == 0xDC00 && (unint64_t)objc_msgSend(a1, "length") >= 2)
  {
    v5 = objc_msgSend(a1, "characterAtIndex:", v3 - 2);
    if ((v5 & 0xFC00) == 0xD800)
      return (v4 + (v5 << 10) - 56613888);
  }
  return v4;
}

- (uint64_t)_rangeOfLongCharacterAtIndex:()TIExtras
{
  __int16 v5;

  v5 = objc_msgSend(a1, "characterAtIndex:");
  if ((v5 & 0xF800) == 0xD800)
  {
    if ((v5 & 0xFC00) == 0xDC00)
    {
      if (a3)
        --a3;
      else
        return 0;
    }
    else if ((v5 & 0xFC00) == 0xD800)
    {
      objc_msgSend(a1, "length");
    }
  }
  return a3;
}

- (void)_enumerateLongCharactersInRange:()TIExtras usingBlock:
{
  void (**v8)(id, uint64_t, _BYTE *);
  unint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v8 = a5;
  v13 = 0;
  v9 = a3 + a4;
  if (a3 < v9)
  {
    v10 = 0;
    while (1)
    {
      v11 = objc_msgSend(a1, "characterAtIndex:", a3);
      v12 = v11;
      if ((v11 & 0xF800) != 0xD800)
        goto LABEL_7;
      if ((v11 & 0xFC00) == 0xD800)
        goto LABEL_9;
      if (v10)
        break;
LABEL_8:
      LODWORD(v12) = 0;
LABEL_9:
      if (!v13)
      {
        ++a3;
        v10 = v12;
        if (a3 < v9)
          continue;
      }
      goto LABEL_11;
    }
    v12 = (v11 + (v10 << 10) - 56613888);
LABEL_7:
    v8[2](v8, v12, &v13);
    goto LABEL_8;
  }
LABEL_11:

}

- (void)_reverseEnumerateLongCharactersInRange:()TIExtras usingBlock:
{
  void (**v8)(id, uint64_t, _BYTE *);
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;

  v8 = a5;
  v14 = 0;
  if (a3 + a4 - 1 >= a3)
  {
    v9 = 0;
    v10 = a3 + a4 - 2;
    while (1)
    {
      v11 = objc_msgSend(a1, "characterAtIndex:", v10 + 1);
      v12 = v11;
      if ((v11 & 0xF800) != 0xD800)
        goto LABEL_7;
      if ((v11 & 0xFC00) == 0xDC00)
        goto LABEL_9;
      if (v9)
        break;
LABEL_8:
      LODWORD(v12) = 0;
LABEL_9:
      if (!v14)
      {
        v9 = v12;
        if (v10-- >= a3)
          continue;
      }
      goto LABEL_12;
    }
    v12 = (v9 + ((_DWORD)v11 << 10) - 56613888);
LABEL_7:
    v8[2](v8, v12, &v14);
    goto LABEL_8;
  }
LABEL_12:

}

- (uint64_t)_contentsExclusivelyInScript:()TIExtras
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v5 = objc_msgSend(a1, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__NSString_TIExtras___contentsExclusivelyInScript___block_invoke;
  v8[3] = &unk_1E2438D70;
  v9 = a3;
  v8[4] = &v10;
  objc_msgSend(a1, "_enumerateLongCharactersInRange:usingBlock:", 0, v5, v8);
  v6 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (id)_stringByTrimmingCharactersInCFCharacterSet:()TIExtras
{
  id v3;

  if (a3)
  {
    objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = a1;
  }
  return v3;
}

- (id)_stringByTrimmingLastCharacter
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  id v7;

  v2 = objc_msgSend(a1, "length");
  v3 = v2 - 2;
  if (v2 < 2)
  {
    if (!v2)
    {
      v7 = a1;
      return v7;
    }
    v4 = 0;
    goto LABEL_7;
  }
  v4 = v2 - 1;
  if ((objc_msgSend(a1, "characterAtIndex:", v2 - 1) & 0xFC00) != 0xDC00
    || (objc_msgSend(a1, "characterAtIndex:", v3) & 0xFC00) != 0xD800)
  {
LABEL_7:
    v5 = a1;
    v6 = v4;
    goto LABEL_8;
  }
  v5 = a1;
  v6 = v3;
LABEL_8:
  objc_msgSend(v5, "substringToIndex:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)_stringByReplacingCharactersInSet:()TIExtras withString:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v6 = a4;
  if (a3)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v8 = objc_msgSend(a1, "length");
    v9 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", a3, 0, 0, v8);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 0;
    }
    else
    {
      v13 = v9;
      v14 = v10;
      v11 = 0;
      do
      {
        objc_msgSend(a1, "substringWithRange:", v11, v13 - v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v15);

        objc_msgSend(v7, "appendString:", v6);
        v11 = v13 + v14;
        v8 = objc_msgSend(a1, "length") - (v13 + v14);
        v13 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", a3, 0, v13 + v14, v8);
        v14 = v16;
      }
      while (v13 != 0x7FFFFFFFFFFFFFFFLL);
    }
    objc_msgSend(a1, "substringWithRange:", v11, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v17);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = a1;
  }

  return v12;
}

- (id)_stringByReplacingCharactersInSet:()TIExtras withCharacter:
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_stringByReplacingCharactersInSet:withString:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_stringByReplacingCharacter:()TIExtras withCharacter:
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, v7, 2, 0, objc_msgSend(a1, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (__CFString)_stringWithLongestWhitespaceDelimitedSuffixOfMaxLength:()TIExtras
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (objc_msgSend(a1, "length") <= a3)
    return (__CFString *)a1;
  v5 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(a1, "length") + ~a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return &stru_1E243B990;
  v6 = v5;
  v7 = objc_msgSend(a1, "length") - v5;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v8, 0, v6, v7);
  v11 = v10;

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    return &stru_1E243B990;
  objc_msgSend(a1, "substringWithRange:", v9 + v11, objc_msgSend(a1, "length") - (v9 + v11));
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)_rangeOfBackwardDeletionClusterAtIndex:()TIExtras
{
  return CFStringGetRangeOfCharacterClusterAtIndex();
}

- (uint64_t)_rangeOfCharacterClusterAtIndex:()TIExtras withClusterOffset:
{
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!a4)
    return a3;
  v5 = a4;
  if (a4 > 0)
  {
    v7 = objc_msgSend(a1, "length");
    v8 = 0;
    do
    {
      if (v8 + a3 >= v7)
        break;
      objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:");
      v8 += v9;
      --v5;
    }
    while (v5);
    return a3;
  }
  v12 = 0;
  if (!a3)
    return 0;
  v13 = -1;
  v10 = a3;
  do
  {
    objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", ~v12 + a3);
    v10 -= v14;
    v12 += v14;
    if (v13 <= v5)
      break;
    --v13;
  }
  while (v12 != a3);
  return v10;
}

- (uint64_t)_rangeOfString:()TIExtras fromLocation:
{
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
    a4 = objc_msgSend(a1, "rangeOfString:options:range:", v6, 2, a4, objc_msgSend(a1, "length") - a4);

  return a4;
}

- (uint64_t)_UTF8SizeOfRange:()TIExtras
{
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = 4 * a4;
  if ((unint64_t)(4 * a4) < 0x401)
    v8 = 0;
  else
    v8 = (char *)malloc_type_malloc(4 * a4, 0xE8F9939EuLL);
  if (v8)
    v9 = v8;
  else
    v9 = &v12;
  v11 = 0;
  objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v9, v7, &v11, 4, 0, a3, a4, 0);
  free(v8);
  return v11;
}

- (unint64_t)_endsSentence
{
  unint64_t v2;
  unsigned int v4;

  v2 = objc_msgSend(a1, "length");
  if (v2 >= 3)
    return objc_msgSend(a1, "_isTripledPunctuation");
  if (v2 != 1)
    return 0;
  v4 = objc_msgSend(a1, "characterAtIndex:", 0);
  if (v4 <= 0x3F)
    return (0x8800400200000400 >> v4) & 1;
  else
    return 0;
}

- (uint64_t)_isModifierSymbol
{
  uint64_t result;

  result = objc_msgSend(a1, "length");
  if (result)
    return u_charType(objc_msgSend(a1, "_firstLongCharacter")) == 26;
  return result;
}

- (unint64_t)_isLeftAssociative
{
  unint64_t v2;
  unsigned int v4;

  v2 = objc_msgSend(a1, "length");
  if (v2 >= 3)
    return objc_msgSend(a1, "_isTripledPunctuation");
  if (v2 != 1)
    return 0;
  v4 = objc_msgSend(a1, "characterAtIndex:", 0);
  if (v4 <= 0x3F)
    return (0x8000400200000000 >> v4) & 1;
  else
    return 0;
}

- (uint64_t)_isTripledPunctuation
{
  if ((objc_msgSend(a1, "hasPrefix:", CFSTR("!!!")) & 1) != 0
    || (objc_msgSend(a1, "hasPrefix:", CFSTR("...")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "hasPrefix:", CFSTR("???"));
  }
}

- (BOOL)_isSpaceOrReturn
{
  UTF32Char v2;
  const __CFCharacterSet *Predefined;

  if (objc_msgSend(a1, "length") != 1)
    return 0;
  v2 = objc_msgSend(a1, "characterAtIndex:", 0);
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  return CFCharacterSetIsLongCharacterMember(Predefined, v2) != 0;
}

- (BOOL)_isPlainSpace
{
  return objc_msgSend(a1, "length") == 1 && objc_msgSend(a1, "characterAtIndex:", 0) == 32;
}

- (BOOL)_isSpace
{
  UTF32Char v2;
  const __CFCharacterSet *Predefined;

  if (objc_msgSend(a1, "length") != 1)
    return 0;
  v2 = objc_msgSend(a1, "characterAtIndex:", 0);
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  return CFCharacterSetIsLongCharacterMember(Predefined, v2) != 0;
}

- (BOOL)_isDelete
{
  int v2;

  if (objc_msgSend(a1, "length") != 1)
    return 0;
  v2 = objc_msgSend(a1, "characterAtIndex:", 0);
  return v2 == 127 || v2 == 8;
}

- (BOOL)_isNewlineOrReturn
{
  int v2;

  if (objc_msgSend(a1, "length") != 1)
    return 0;
  v2 = objc_msgSend(a1, "characterAtIndex:", 0);
  return v2 == 13 || v2 == 10;
}

- (uint64_t)_isBasicLatin
{
  uint64_t result;

  result = objc_msgSend(a1, "length");
  if (result)
    return ublock_getCode(objc_msgSend(a1, "_firstLongCharacter")) == UBLOCK_BASIC_LATIN;
  return result;
}

- (BOOL)_looksLikeEmailAddress
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "rangeOfString:options:", CFSTR("@"), 2);
  return v1 != 0x7FFFFFFFFFFFFFFFLL && v1 != 0;
}

- (BOOL)_looksLikeNumberInput
{
  if (_looksLikeNumberInput_onceToken != -1)
    dispatch_once(&_looksLikeNumberInput_onceToken, &__block_literal_global_51);
  return objc_msgSend(a1, "rangeOfCharacterFromSet:", _looksLikeNumberInput___nonNumberInputSet) == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_looksLikeURL
{
  void *v2;
  char v3;
  uint64_t v5;

  objc_msgSend(a1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("www"));

  if ((v3 & 1) != 0)
    return 1;
  v5 = objc_msgSend(a1, "rangeOfString:options:", CFSTR("://"), 2);
  return v5 != 0x7FFFFFFFFFFFFFFFLL && v5 != 0;
}

- (BOOL)_containsCJScripts
{
  unint64_t v2;
  _BOOL8 IsCJScript;

  if (!objc_msgSend(a1, "length"))
    return 0;
  v2 = 0;
  do
  {
    objc_msgSend(a1, "characterAtIndex:", v2);
    IsCJScript = TICharIsCJScript();
    if (IsCJScript)
      break;
    ++v2;
  }
  while (objc_msgSend(a1, "length") > v2);
  return IsCJScript;
}

- (uint64_t)_isOnlyIdeographs
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_ideographSet"));
}

- (BOOL)_endsWithHalfwidth
{
  int32_t IntPropertyValue;

  IntPropertyValue = u_getIntPropertyValue(objc_msgSend(a1, "_lastLongCharacter"), UCHAR_EAST_ASIAN_WIDTH);
  return IntPropertyValue != 3 && IntPropertyValue != 5;
}

- (id)_firstGrapheme
{
  unint64_t v2;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v2 = objc_msgSend(a1, "length");
  if (v2 == 1)
    return a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  if (v2 >= 2)
    v4 = 2;
  else
    v4 = v2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__NSString_TIExtras___firstGrapheme__block_invoke;
  v6[3] = &unk_1E24391B0;
  v6[4] = &v7;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 2, v6);
  v5 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v5;
}

- (id)_lastGrapheme
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)objc_msgSend(a1, "length") > 1)
  {
    v3 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(a1, "length") - 1);
    objc_msgSend(a1, "substringWithRange:", v3, v4);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)_graphemeAtIndex:()TIExtras
{
  uint64_t v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[4];

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v5 = objc_msgSend(a1, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__NSString_TIExtras___graphemeAtIndex___block_invoke;
  v8[3] = &unk_1E2438DB8;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = v15;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(v15, 8);
  return v6;
}

- (uint64_t)_graphemeCount
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = objc_msgSend(a1, "length");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__NSString_TIExtras___graphemeCount__block_invoke;
  v5[3] = &unk_1E24391B0;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 514, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)_containsKorean
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonKoreanCharacterSet")) ^ 1;
}

- (uint64_t)_containsJapanese
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonJapaneseLetterSet")) ^ 1;
}

- (uint64_t)_containsJapaneseOnly
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_japaneseLetterSet"));
}

- (uint64_t)_containsHiraganaOnly
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_hiraganaSet"));
}

- (uint64_t)_containsHiraganaOrKatakana
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonHiraganaOrKatakanaSet")) ^ 1;
}

- (uint64_t)_containsKatakanaOrKanji
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonKatakanaOrKanjiSet")) ^ 1;
}

- (uint64_t)_containsHiraganaKatakanaOrBopomofo
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonHiraganaKatakanaOrBopomofoSet")) ^ 1;
}

- (BOOL)_ti_isKeyEquivalentMirroringCandidate
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  __TIKeyEquivalentMirroringCandidatesMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_ti_keyEquivalentMirroring
{
  void *v2;
  void *v3;

  __TIKeyEquivalentMirroringCandidatesMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)_containsBopomofoOnly
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_bopomofoSet"));
}

- (uint64_t)_containsBopomofoToneOnly
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_bopomofoToneSet"));
}

- (uint64_t)_containsBopomofoWithoutToneOnly
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_bopomofoWithoutToneSet"));
}

- (uint64_t)_containsIdeographsOrBopomofoOnly
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__NSString_TIExtras___containsIdeographsOrBopomofoOnly__block_invoke;
  block[3] = &unk_1E243B440;
  block[4] = a1;
  if (_containsIdeographsOrBopomofoOnly___onceToken != -1)
    dispatch_once(&_containsIdeographsOrBopomofoOnly___onceToken, block);
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", _containsIdeographsOrBopomofoOnly___KanijChineseBopomofoSet);
}

- (uint64_t)_containsCJScriptsOnly
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__NSString_TIExtras___containsCJScriptsOnly__block_invoke;
  block[3] = &unk_1E243B440;
  block[4] = a1;
  if (_containsCJScriptsOnly___onceToken != -1)
    dispatch_once(&_containsCJScriptsOnly___onceToken, block);
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", _containsCJScriptsOnly___CJSet);
}

- (uint64_t)_containsCJKScriptsOnly
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NSString_TIExtras___containsCJKScriptsOnly__block_invoke;
  block[3] = &unk_1E243B440;
  block[4] = a1;
  if (_containsCJKScriptsOnly___onceToken != -1)
    dispatch_once(&_containsCJKScriptsOnly___onceToken, block);
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", _containsCJKScriptsOnly___CJKSet);
}

- (uint64_t)_containsSymbolsAndPunctuationOnly
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__NSString_TIExtras___containsSymbolsAndPunctuationOnly__block_invoke;
  block[3] = &unk_1E243B440;
  block[4] = a1;
  if (_containsSymbolsAndPunctuationOnly___onceToken != -1)
    dispatch_once(&_containsSymbolsAndPunctuationOnly___onceToken, block);
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", _containsSymbolsAndPunctuationOnly___SymbolsSet);
}

- (uint64_t)_containsFullwidthLettersAndNumbersOnly
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_fullwidthLettersAndNumbersSet"));
}

- (uint64_t)_containsFullwidthLettersAndNumbers
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_nonFullwidthLettersAndNumbersSet")) ^ 1;
}

- (uint64_t)_containsFullwidthLettersAndSymbolsOnly
{
  return objc_msgSend(a1, "_contentsExclusivelyInCharacterSet:", objc_msgSend((id)objc_opt_class(), "_fullwidthLettersAndSymbolsSet"));
}

- (uint64_t)_shouldBePaddedWithSpaces
{
  return objc_msgSend(a1, "_containsCJKScriptsOnly") ^ 1;
}

- (__CFString)_stringByConvertingFromHalfWidthToFullWidth
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (CFStringTransform(v2, 0, (CFStringRef)*MEMORY[0x1E0C9B340], 1u))
    v3 = v2;
  else
    v3 = a1;
  v4 = v3;

  return v4;
}

- (__CFString)_stringByConvertingFromFullWidthToHalfWidth
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (CFStringTransform(v2, 0, (CFStringRef)*MEMORY[0x1E0C9B340], 0))
    v3 = v2;
  else
    v3 = a1;
  v4 = v3;

  return v4;
}

- (id)_stringByTranscribingFromLanguage:()TIExtras
{
  objc_class *v4;
  id v5;
  const __CFLocale *v6;
  CFStringTokenizerRef v7;
  void *v8;
  CFRange v10;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99DC8];
    v5 = a3;
    v6 = (const __CFLocale *)objc_msgSend([v4 alloc], "initWithLocaleIdentifier:", v5);

    v10.location = 0;
    v10.length = 0;
    v7 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v10, 4uLL, v6);
    objc_msgSend(a1, "_stringByTranscribingUsingTokenizer:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v7);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_stringByTranscribingUsingTokenizer:()TIExtras
{
  id v5;
  void *v6;
  uint64_t v7;
  CFRange v9;

  if (a3)
  {
    v9.length = -[__CFString length](a1, "length");
    v9.location = 0;
    CFStringTokenizerSetString(a3, a1, v9);
    v5 = 0;
    while (CFStringTokenizerAdvanceToNextToken(a3))
    {
      v6 = (void *)CFStringTokenizerCopyCurrentTokenAttribute(a3, 0x400000uLL);
      if (objc_msgSend(v6, "length"))
      {
        if (v5)
        {
          objc_msgSend(v5, "stringByAppendingString:", v6);
          v7 = objc_claimAutoreleasedReturnValue();

          v5 = (id)v7;
        }
        else
        {
          v5 = v6;
        }
      }

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_stringByApplyingTransform:()TIExtras
{
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;

  v4 = a1;
  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CB37A0];
    v6 = a3;
    objc_msgSend(v5, "stringWithString:", v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = CFStringTransform(v7, 0, v6, 0);

    if ((_DWORD)v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v8;
    }

  }
  return v4;
}

- (id)_stringByTransliteratingToPinyin:()TIExtras
{
  int v5;
  const __CFString *v6;
  const __CFString *v7;

  v5 = objc_msgSend(a1, "_isOnlyIdeographs");
  v6 = CFSTR("Han-Latin; [:Space_Separator:] Remove; Any-Title; NFD");
  if (a3)
    v6 = CFSTR("Han-Latin/Names; [:Space_Separator:] Remove; Any-Title; NFD");
  if (v5)
    v7 = v6;
  else
    v7 = CFSTR("Any-Latin; [:Space_Separator:] Remove; Any-Title; NFD");
  objc_msgSend(a1, "_stringByApplyingTransform:", v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)_stringByTransliteratingToPinyin
{
  return objc_msgSend(a1, "_stringByTransliteratingToPinyin:", 0);
}

- (uint64_t)_stringByTransliteratingToPinyinAsFamilyName
{
  return objc_msgSend(a1, "_stringByTransliteratingToPinyin:", 1);
}

- (id)_stringByTransliteratingToZhuyin:()TIExtras
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3)
    v3 = CFSTR("Han-Latin/Names; Latin-Bopomofo");
  else
    v3 = CFSTR("Han-Latin; Latin-Bopomofo");
  objc_msgSend(a1, "_stringByApplyingTransform:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v11, "length") - 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(CFSTR("ˉˊˇˋ˙"), "rangeOfString:", v12);

          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v11, "stringByAppendingString:", CFSTR("ˉ"));
            v14 = objc_claimAutoreleasedReturnValue();

            v11 = (id)v14;
          }
          objc_msgSend(v5, "addObject:", v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "componentsJoinedByString:", &stru_1E243B990);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (uint64_t)_stringByTransliteratingToZhuyin
{
  return objc_msgSend(a1, "_stringByTransliteratingToZhuyin:", 0);
}

- (uint64_t)_stringByTransliteratingToZhuyinAsFamilyName
{
  return objc_msgSend(a1, "_stringByTransliteratingToZhuyin:", 1);
}

- (uint64_t)_editDistanceFrom:()TIExtras
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  unsigned __int16 *v10;
  size_t v11;
  _WORD *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  char *v19;
  void *v20;
  _WORD *v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  int v27;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  v6 = 65534;
  if (v5 >= 0xFFFE)
    v7 = 65534;
  else
    v7 = v5;
  v8 = objc_msgSend(v4, "length");
  if (v8 < 0xFFFE)
    v6 = v8;
  if (v7)
  {
    if (v6)
    {
      v9 = (char *)malloc_type_malloc(2 * v7, 0x1000040BDFB0063uLL);
      v10 = (unsigned __int16 *)malloc_type_malloc(2 * v6, 0x1000040BDFB0063uLL);
      objc_msgSend(a1, "getCharacters:range:", v9, 0, v7);
      objc_msgSend(v4, "getCharacters:range:", v10, 0, v6);
      v11 = (unsigned __int16)(2 * v7 + 2) & 0xFFFE;
      v12 = malloc_type_malloc(v11, 0x71FCD9D5uLL);
      v13 = (char *)malloc_type_malloc(v11, 0x880EB00AuLL);
      v14 = (char *)malloc_type_malloc(v11, 0xD078401CuLL);
      v15 = v14;
      v16 = 0;
      do
      {
        *(_WORD *)&v14[2 * v16] = v16;
        ++v16;
      }
      while (v7 + 1 != v16);
      for (i = 0; i != v6; ++i)
      {
        v18 = 0;
        v19 = v15;
        v20 = v13;
        v15 = (char *)v12;
        *v12 = *(_WORD *)v19 + 1;
        v21 = v12 + 1;
        v22 = 0xFFFFFFFF00000000;
        v23 = -1;
        do
        {
          v24 = (unsigned __int16)(*(_WORD *)&v19[v18 * 2 + 2] + 1);
          LOWORD(v25) = *(_WORD *)&v19[v18 * 2];
          if (*(unsigned __int16 *)&v9[v18 * 2] != v10[i])
            LOWORD(v25) = v25 + 1;
          v25 = (unsigned __int16)v25;
          if (v24 >= (unsigned __int16)(v12[v18] + 1))
            v24 = (unsigned __int16)(v12[v18] + 1);
          if ((unsigned __int16)v25 >= v24)
            v25 = v24;
          v21[v18] = v25;
          if (i)
          {
            if (v18 * 2)
            {
              v26 = *(unsigned __int16 *)&v9[v18 * 2];
              if (v26 == v10[(i - 1)])
              {
                v27 = v10[i];
                if (*(unsigned __int16 *)&v9[2 * v23] == v27 && v26 != v27)
                {
                  if (v25 >= (unsigned __int16)(*(_WORD *)&v13[v22 >> 31] + 1))
                    LOWORD(v25) = *(_WORD *)&v13[v22 >> 31] + 1;
                  v21[v18] = v25;
                }
              }
            }
          }
          ++v23;
          v22 += 0x100000000;
          ++v18;
        }
        while (v7 != v18);
        v12 = v13;
        v13 = v19;
      }
      LOWORD(v6) = *(_WORD *)&v15[2 * v7];
      free(v20);
      free(v19);
      free(v15);
      free(v9);
      free(v10);
    }
    else
    {
      LOWORD(v6) = v7;
    }
  }

  return (unsigned __int16)v6;
}

- (id)_stringByComposingDiacriticsLogicalOrder:()TIExtras allowedCharacters:
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  char v18;
  _QWORD v19[3];
  int v20;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(a1, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v8 = objc_msgSend(a1, "length");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__NSString_TIExtras___stringByComposingDiacriticsLogicalOrder_allowedCharacters___block_invoke;
  v14[3] = &unk_1E2438E08;
  v18 = a3;
  v16 = v6;
  v17 = v19;
  v9 = v7;
  v15 = v9;
  v10 = v6;
  objc_msgSend(a1, "_enumerateLongCharactersInRange:usingBlock:", 0, v8, v14);
  v11 = v15;
  v12 = v9;

  _Block_object_dispose(v19, 8);
  return v12;
}

- (uint64_t)_indexFromStartingIndex:()TIExtras byIncrementingComposedCharacterSequenceCount:
{
  uint64_t v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];

  if (!objc_msgSend(a1, "length") || objc_msgSend(a1, "length") <= a3)
    return objc_msgSend(a1, "length");
  if (a4)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v13 = objc_msgSend(a1, "length");
    v7 = objc_msgSend(a1, "length");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __91__NSString_TIExtras___indexFromStartingIndex_byIncrementingComposedCharacterSequenceCount___block_invoke;
    v9[3] = &unk_1E2438DB8;
    v9[5] = &v10;
    v9[6] = a4;
    v9[4] = v14;
    objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", a3, v7 - a3, 514, v9);
    a3 = v11[3];
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(v14, 8);
  }
  return a3;
}

- (id)normalizeSmartQuotedStringForLocale:()TIExtras
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  +[TISmartPunctuationOptions smartPunctuationOptionsForLocale:](TISmartPunctuationOptions, "smartPunctuationOptionsForLocale:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leftSingleQuote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v19[0] = CFSTR("'");
  objc_msgSend(v2, "rightSingleQuote");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v19[1] = CFSTR("'");
  objc_msgSend(v2, "apostrophe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v5;
  v19[2] = CFSTR("'");
  objc_msgSend(v2, "leftDoubleQuote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v6;
  v19[3] = CFSTR("\");
  objc_msgSend(v2, "rightDoubleQuote");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v7;
  v19[4] = CFSTR("\");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = a1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__NSString_TIExtras__normalizeSmartQuotedStringForLocale___block_invoke;
  v11[3] = &unk_1E2438E30;
  v11[4] = &v12;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)normalizeSmartQuotedStringOnlySingleQuote
{
  void *v2;
  unint64_t v3;
  void *v4;

  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  if (objc_msgSend(&unk_1E24B05B8, "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(&unk_1E24B05B8, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", v4, CFSTR("'"), 2, 0, objc_msgSend(a1, "length"));

      ++v3;
    }
    while (objc_msgSend(&unk_1E24B05B8, "count") > v3);
  }
  return v2;
}

- (uint64_t)smartQuoteInsensitiveStringEquivalent:()TIExtras forLocale:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "normalizeSmartQuotedStringForLocale:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "normalizeSmartQuotedStringForLocale:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "isEqualToString:", v9);
  return v10;
}

+ (uint64_t)_characterSetWithPattern:()TIExtras
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HIDWORD(v9) = 0;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  if (objc_msgSend(v5, "_fastCharacterContents"))
  {
    v6 = uset_openPattern();
  }
  else
  {
    MEMORY[0x1E0C80A78]();
    objc_msgSend(v5, "getCharacters:range:", (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), 0, v4);
    v6 = uset_openPattern();
  }
  if (SHIDWORD(v9) >= 1)
    NSLog(CFSTR("Couldn’t create USet from pattern %@"), v5);

  return v6;
}

+ (uint64_t)_nonKoreanCharacterSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__NSString_TIExtras___nonKoreanCharacterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonKoreanCharacterSet___onceToken != -1)
    dispatch_once(&_nonKoreanCharacterSet___onceToken, block);
  return _nonKoreanCharacterSet___nonKoreanCharacterSet;
}

+ (uint64_t)_nonHiraganaOrKatakanaSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NSString_TIExtras___nonHiraganaOrKatakanaSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonHiraganaOrKatakanaSet___onceToken != -1)
    dispatch_once(&_nonHiraganaOrKatakanaSet___onceToken, block);
  return _nonHiraganaOrKatakanaSet___nonHiraganaOrKatakanaSet;
}

+ (uint64_t)_nonKatakanaOrKanjiSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__NSString_TIExtras___nonKatakanaOrKanjiSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonKatakanaOrKanjiSet___onceToken != -1)
    dispatch_once(&_nonKatakanaOrKanjiSet___onceToken, block);
  return _nonKatakanaOrKanjiSet___nonKatakanaSet;
}

+ (uint64_t)_nonHiraganaKatakanaOrBopomofoSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__NSString_TIExtras___nonHiraganaKatakanaOrBopomofoSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonHiraganaKatakanaOrBopomofoSet___onceToken != -1)
    dispatch_once(&_nonHiraganaKatakanaOrBopomofoSet___onceToken, block);
  return _nonHiraganaKatakanaOrBopomofoSet___nonHiraganaKatakanaOrBopomofoSet;
}

+ (uint64_t)_hiraganaSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__NSString_TIExtras___hiraganaSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_hiraganaSet___onceToken != -1)
    dispatch_once(&_hiraganaSet___onceToken, block);
  return _hiraganaSet___hiraganaSet;
}

+ (uint64_t)_japaneseLetterSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__NSString_TIExtras___japaneseLetterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_japaneseLetterSet___onceToken != -1)
    dispatch_once(&_japaneseLetterSet___onceToken, block);
  return _japaneseLetterSet___japaneseLetterSet;
}

+ (uint64_t)_nonJapaneseLetterSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__NSString_TIExtras___nonJapaneseLetterSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonJapaneseLetterSet___onceToken != -1)
    dispatch_once(&_nonJapaneseLetterSet___onceToken, block);
  return _nonJapaneseLetterSet___set;
}

+ (uint64_t)_ideographSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__NSString_TIExtras___ideographSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_ideographSet___onceToken != -1)
    dispatch_once(&_ideographSet___onceToken, block);
  return _ideographSet___ideographSet;
}

+ (uint64_t)_bopomofoSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__NSString_TIExtras___bopomofoSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bopomofoSet___onceToken != -1)
    dispatch_once(&_bopomofoSet___onceToken, block);
  return _bopomofoSet___bopomofoSet;
}

+ (uint64_t)_bopomofoToneSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__NSString_TIExtras___bopomofoToneSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bopomofoToneSet___onceToken != -1)
    dispatch_once(&_bopomofoToneSet___onceToken, block);
  return _bopomofoToneSet___bopomofoToneSet;
}

+ (uint64_t)_bopomofoWithoutToneSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NSString_TIExtras___bopomofoWithoutToneSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bopomofoWithoutToneSet___onceToken != -1)
    dispatch_once(&_bopomofoWithoutToneSet___onceToken, block);
  return _bopomofoWithoutToneSet___bopomofoWithoutToneSet;
}

+ (uint64_t)_fullwidthLettersAndNumbersSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NSString_TIExtras___fullwidthLettersAndNumbersSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_fullwidthLettersAndNumbersSet___onceToken != -1)
    dispatch_once(&_fullwidthLettersAndNumbersSet___onceToken, block);
  return _fullwidthLettersAndNumbersSet___fullwidthLettersAndNumbersSet;
}

+ (uint64_t)_nonFullwidthLettersAndNumbersSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__NSString_TIExtras___nonFullwidthLettersAndNumbersSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_nonFullwidthLettersAndNumbersSet___oneceToken != -1)
    dispatch_once(&_nonFullwidthLettersAndNumbersSet___oneceToken, block);
  return _nonFullwidthLettersAndNumbersSet___nonFullwidthLettersAndNumbersSet;
}

+ (uint64_t)_fullwidthLettersAndSymbolsSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NSString_TIExtras___fullwidthLettersAndSymbolsSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_fullwidthLettersAndSymbolsSet___onceToken != -1)
    dispatch_once(&_fullwidthLettersAndSymbolsSet___onceToken, block);
  return _fullwidthLettersAndSymbolsSet___fullwidthLettersAndSymbolsSet;
}

+ (uint64_t)stringWithUnichar:()TIExtras
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:");
}

@end
