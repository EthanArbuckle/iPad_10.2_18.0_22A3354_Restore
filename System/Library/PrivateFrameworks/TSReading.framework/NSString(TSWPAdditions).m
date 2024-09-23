@implementation NSString(TSWPAdditions)

- (__CFString)stringByNormalizingParagraphBreaks
{
  __CFString *v1;
  uint64_t v2;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UniChar v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFRange v19;
  uint64_t v20;
  uint64_t v21;
  UniChar *v22;
  UniChar v23;
  uint64_t v24;
  const UniChar *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  __int16 v30;
  UniChar buffer[64];
  __CFString *v32;
  const UniChar *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CFRange v39;

  v1 = a1;
  v2 = -[__CFString length](a1, "length");
  v32 = v1;
  v35 = 0;
  v36 = v2;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  v33 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  v34 = CStringPtr;
  v37 = 0;
  v38 = 0;
  if (v2 >= 1)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 64;
    while (1)
    {
      v11 = (unint64_t)v9 >= 3 ? 3 : v9;
      v12 = (unint64_t)v9 >= 4 ? 4 : v9;
      if (v36 > v9)
      {
        if (v33)
        {
          v13 = v33[v9 + v35];
        }
        else if (v34)
        {
          v13 = v34[v35 + v9];
        }
        else
        {
          if (v38 <= v9 || v6 > v9)
          {
            v14 = -v12;
            v15 = v12 + v5;
            v16 = v10 - v12;
            v17 = v9 + v14;
            v18 = v17 + 64;
            if (v17 + 64 >= v36)
              v18 = v36;
            v37 = v17;
            v38 = v18;
            v19.location = v17 + v35;
            if (v36 >= v16)
              v20 = v16;
            else
              v20 = v36;
            v19.length = v20 + v15;
            CFStringGetCharacters(v32, v19, buffer);
            v6 = v37;
          }
          v13 = buffer[v9 - v6];
        }
        if (v13 == 8233)
          goto LABEL_32;
        if (v13 == 13)
          break;
      }
LABEL_37:
      ++v9;
      --v5;
      ++v10;
      if (v9 >= v2)
        goto LABEL_57;
    }
    v21 = v9 + 1;
    if (v9 + 1 >= v2 || v36 <= v21)
    {
LABEL_32:
      v24 = 1;
      if (!v8)
        goto LABEL_45;
      goto LABEL_33;
    }
    if (v33)
    {
      v22 = (UniChar *)&v33[v9 + v35];
    }
    else
    {
      if (v34)
      {
        v23 = v34[v35 + 1 + v9];
LABEL_41:
        if (v23 == 10)
          v24 = 2;
        else
          v24 = 1;
        if (!v8)
        {
LABEL_45:
          v8 = (__CFString *)(id)-[__CFString mutableCopyWithZone:](v1, "mutableCopyWithZone:", 0);
          v1 = v8;
          if (!v7)
            goto LABEL_46;
          goto LABEL_34;
        }
LABEL_33:
        if (!v7)
        {
LABEL_46:
          v30 = 10;
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharactersNoCopy:length:freeWhenDone:", &v30, 1, 0);
        }
LABEL_34:
        -[__CFString replaceCharactersInRange:withString:](v8, "replaceCharactersInRange:withString:", v9, v24, v7);
        v2 = -[__CFString length](v1, "length");
        v32 = v1;
        v35 = 0;
        v36 = v2;
        v25 = CFStringGetCharactersPtr(v1);
        v26 = 0;
        v33 = v25;
        if (!v25)
          v26 = CFStringGetCStringPtr(v1, 0x600u);
        v6 = 0;
        v34 = v26;
        v37 = 0;
        v38 = 0;
        goto LABEL_37;
      }
      if (v38 <= v21 || v6 > v21)
      {
        v27 = v9 - v11 + 64;
        if (v27 >= v36)
          v27 = v36;
        v37 = v9 - v11;
        v38 = v27;
        if (v36 >= v10 - v11)
          v28 = v10 - v11;
        else
          v28 = v36;
        v39.length = v28 + v11 + v5;
        v39.location = v9 - v11 + v35;
        CFStringGetCharacters(v32, v39, buffer);
        v6 = v37;
      }
      v22 = &buffer[v9 - v6];
    }
    v23 = v22[1];
    goto LABEL_41;
  }
  v7 = 0;
LABEL_57:

  return v1;
}

- (uint64_t)findIndexOfCharacter:()TSWPAdditions range:
{
  NSRange v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  UniChar v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger length;
  CFRange v23;
  NSUInteger v24;
  UniChar buffer[64];
  CFStringRef theString;
  const UniChar *CharactersPtr;
  const char *v29;
  NSRange v30;
  uint64_t v31;
  int64_t v32;
  NSRange v33;
  NSRange v34;

  v34.length = -[__CFString length](a1, "length");
  v33.location = a4;
  v33.length = a5;
  v34.location = 0;
  v9 = NSIntersectionRange(v33, v34);
  if (!v9.length)
    return 0x7FFFFFFFFFFFFFFFLL;
  theString = a1;
  v30 = v9;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  v10 = CharactersPtr ? 0 : CFStringGetCStringPtr(a1, 0x600u);
  v31 = 0;
  v32 = 0;
  v29 = v10;
  if ((uint64_t)v9.length < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  for (i = 64; ; ++i)
  {
    v15 = (unint64_t)v13 >= 4 ? 4 : v13;
    if ((uint64_t)v30.length <= v13)
    {
      v16 = 0;
    }
    else if (CharactersPtr)
    {
      v16 = CharactersPtr[v13 + v30.location];
    }
    else if (v29)
    {
      v16 = v29[v30.location + v13];
    }
    else
    {
      if (v32 <= v13 || v12 > v13)
      {
        v18 = -v15;
        v19 = v15 + v11;
        v20 = i - v15;
        v21 = v13 + v18;
        length = v21 + 64;
        if (v21 + 64 >= (uint64_t)v30.length)
          length = v30.length;
        v31 = v21;
        v32 = length;
        v23.location = v21 + v30.location;
        if ((uint64_t)v30.length >= v20)
          v24 = v20;
        else
          v24 = v30.length;
        v23.length = v24 + v19;
        CFStringGetCharacters(theString, v23, buffer);
        v12 = v31;
      }
      v16 = buffer[v13 - v12];
    }
    if (a3 == v16)
      break;
    ++v13;
    --v11;
    if (v9.length == v13)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v9.location + v13;
}

- (uint64_t)rangeOfCharactersFromSet:()TSWPAdditions index:
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = objc_msgSend(a1, "length");
  v8 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", a3, 0, a4, v7 - a4);
  v10 = v9;
  if (v9)
  {
    v11 = a4 + 1;
    if (a4 + 1 < v7)
    {
      do
      {
        if (!objc_msgSend(a3, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v11)))
          break;
        ++v10;
        ++v11;
      }
      while (v7 != v11);
    }
  }
  return v8;
}

- (CFIndex)rangeOfWordAtCharacterIndex:()TSWPAdditions range:includePreviousWord:
{
  CFIndex v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t CharacterAtIndex;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  int v29;
  __CFStringTokenizer *v30;
  __CFStringTokenizer *v31;
  CFStringTokenizerTokenType v32;
  CFIndex length;
  CFIndex location;
  CFRange CurrentTokenRange;
  CFRange v36;

  v11 = *MEMORY[0x24BEB3BF0];
  v12 = -[__CFString length](a1, "length");
  v13 = a4 + a5;
  if (a3 < a4 || a3 - a4 >= a5)
  {
    if (v12 >= v13)
    {
      if (v13 == a3)
        goto LABEL_9;
    }
    else
    {
      v21 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) rangeOfWordAtCharacterIndex:range:includePreviousWord:]");
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"), 1067, CFSTR("Specified range is out of range of string"));
      if (v13 == a3)
        return v11;
    }
    v25 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) rangeOfWordAtCharacterIndex:range:includePreviousWord:]");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm");
    v17 = CFSTR("Character index out of range");
    v18 = (void *)v25;
    v19 = v26;
    v20 = 1068;
    goto LABEL_14;
  }
  if (v12 < v13)
  {
    v14 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) rangeOfWordAtCharacterIndex:range:includePreviousWord:]");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm");
    v17 = CFSTR("Specified range is out of range of string");
    v18 = (void *)v14;
    v19 = v15;
    v20 = 1067;
LABEL_14:
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, v16, v20, v17);
    return v11;
  }
LABEL_9:
  if (CFStringGetLength(a1) <= a3)
  {
    v24 = 0;
  }
  else
  {
    CharacterAtIndex = CFStringGetCharacterAtIndex(a1, a3);
    v24 = 0;
    if ((_DWORD)CharacterAtIndex && v13 > a3)
      v24 = IsWhitespaceCharacter(CharacterAtIndex) ^ 1;
  }
  if (a6)
  {
    if (a3 > a4)
    {
      v28 = CFStringGetCharacterAtIndex(a1, a3 - 1);
      v29 = IsWhitespaceCharacter(v28);
      v24 |= v29 ^ 1;
      if (!v29)
        --a3;
    }
  }
  if (v24)
  {
    if (a5)
    {
      v36.location = a4;
      v36.length = a5;
      v30 = CFStringTokenizerCreate(0, a1, v36, 4uLL, 0);
      if (v30)
      {
        v31 = v30;
        v32 = CFStringTokenizerGoToTokenAtIndex(v30, a3);
        length = 0;
        location = -1;
        if (v32 && (v32 & 0x10) == 0)
        {
          CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v31);
          length = CurrentTokenRange.length;
          location = CurrentTokenRange.location;
        }
        if (location != -1 && length != 0)
          v11 = location;
        CFRelease(v31);
      }
    }
  }
  return v11;
}

- (BOOL)isAllWhitespaceInRange:()TSWPAdditions
{
  NSRange v7;
  const char *CStringPtr;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger length;
  UniChar v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  UniChar buffer[64];
  CFStringRef theString;
  const UniChar *CharactersPtr;
  const char *v27;
  NSRange v28;
  uint64_t v29;
  int64_t v30;
  NSRange v31;
  CFRange v32;
  NSRange v33;

  v33.length = -[__CFString length](a1, "length");
  v31.location = a3;
  v31.length = a4;
  v33.location = 0;
  v7 = NSIntersectionRange(v31, v33);
  if (v7.length)
  {
    theString = a1;
    v28 = v7;
    CharactersPtr = CFStringGetCharactersPtr(a1);
    if (CharactersPtr)
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
    v29 = 0;
    v30 = 0;
    v27 = CStringPtr;
    if ((uint64_t)v7.length < 1)
    {
      return 1;
    }
    else
    {
      v10 = 0;
      v9 = 0;
      v11 = 0;
      v12 = 64;
      do
      {
        if ((unint64_t)v11 >= 4)
          v13 = 4;
        else
          v13 = v11;
        length = v28.length;
        if ((uint64_t)v28.length <= v11)
        {
          v15 = 0;
        }
        else if (CharactersPtr)
        {
          v15 = CharactersPtr[v11 + v28.location];
        }
        else if (v27)
        {
          v15 = v27[v28.location + v11];
        }
        else
        {
          v16 = v29;
          if (v30 <= v11 || v29 > v11)
          {
            v18 = -v13;
            v19 = v13 + v10;
            v20 = v12 - v13;
            v21 = v11 + v18;
            v22 = v21 + 64;
            if (v21 + 64 >= (uint64_t)v28.length)
              v22 = v28.length;
            v29 = v21;
            v30 = v22;
            if ((uint64_t)v28.length >= v20)
              length = v20;
            v32.length = length + v19;
            v32.location = v21 + v28.location;
            CFStringGetCharacters(theString, v32, buffer);
            v16 = v29;
          }
          v15 = buffer[v11 - v16];
        }
        if ((IsWhitespaceCharacter(v15) & 1) == 0)
          break;
        v9 = ++v11 >= (int64_t)v7.length;
        --v10;
        ++v12;
      }
      while (v7.length != v11);
    }
  }
  else
  {
    return 0;
  }
  return v9;
}

- (__CFString)replaceOccurrencesOfCharactersInSet:()TSWPAdditions minimumConsecutiveLength:replaceString:
{
  void *v9;
  uint64_t v10;
  unint64_t v11;
  const char *CStringPtr;
  UniChar v13;
  BOOL v14;
  UniChar v15;
  int IsCharacterMember;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t *v22;
  unint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  unint64_t *v29;
  unint64_t *v30;
  int64_t v31;
  CFIndex v32;
  UniChar *v33;
  CFIndex v34;
  UniChar v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  unint64_t *i;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  __CFString *v44;
  CFRange v46;
  uint64_t v47;
  CFRange v48;
  UniChar buffer[64];
  CFStringRef theString;
  const UniChar *CharactersPtr;
  const char *v52;
  CFRange range;
  uint64_t v54;
  CFIndex length;
  unint64_t *v56;
  unint64_t *v57;
  unint64_t *v58;
  CFRange v59;

  if (!a5)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) replaceOccurrencesOfCharactersInSet:minimumConsecutiveLength:replaceString:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"), 1152, CFSTR("invalid nil value for '%s'"), "replaceString");
  }
  v56 = 0;
  v57 = 0;
  v58 = 0;
  v11 = -[__CFString length](a1, "length");
  theString = a1;
  range.location = 0;
  range.length = v11;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  if (CharactersPtr)
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v54 = 0;
  length = 0;
  v52 = CStringPtr;
  if (v11 && range.length >= 1)
  {
    if (CharactersPtr)
    {
      v13 = CharactersPtr[range.location];
    }
    else if (CStringPtr)
    {
      v13 = CStringPtr[range.location];
    }
    else
    {
      if (range.length >= 0x40uLL)
        v46.length = 64;
      else
        v46.length = range.length;
      length = v46.length;
      v46.location = range.location;
      CFStringGetCharacters(theString, v46, buffer);
      v13 = buffer[-v54];
    }
  }
  else
  {
    v13 = 0;
  }
  v14 = CFCharacterSetIsCharacterMember(a3, v13) != 0;
  if (v11 < 2 || range.length < 2)
  {
    v15 = 0;
  }
  else if (CharactersPtr)
  {
    v15 = CharactersPtr[range.location + 1];
  }
  else if (v52)
  {
    v15 = v52[range.location + 1];
  }
  else
  {
    if (length < 2 || (v47 = v54, v54 >= 2))
    {
      if (range.length >= 0x40uLL)
        v48.length = 64;
      else
        v48.length = range.length;
      v54 = 0;
      length = v48.length;
      v48.location = range.location;
      CFStringGetCharacters(theString, v48, buffer);
      v47 = v54;
    }
    v15 = buffer[1 - v47];
  }
  IsCharacterMember = CFCharacterSetIsCharacterMember(a3, v15);
  if (v11)
  {
    v17 = 0;
    v18 = 0;
    v19 = IsCharacterMember != 0;
    v20 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if (v14)
      {
        if (v17 < v20)
          v20 = v17;
        ++v18;
        if (!v19)
        {
          if (v18 >= a4)
          {
            v21 = v57;
            if (v57 >= v58)
            {
              v23 = v56;
              v24 = ((char *)v57 - (char *)v56) >> 4;
              v25 = v24 + 1;
              if ((unint64_t)(v24 + 1) >> 60)
                abort();
              v26 = (char *)v58 - (char *)v56;
              if (v58 - v56 > v25)
                v25 = v26 >> 3;
              if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0)
                v27 = 0xFFFFFFFFFFFFFFFLL;
              else
                v27 = v25;
              if (v27)
              {
                v28 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)&v58, v27);
                v23 = v56;
                v21 = v57;
              }
              else
              {
                v28 = 0;
              }
              v29 = (unint64_t *)&v28[16 * v24];
              *v29 = v20;
              v29[1] = v18;
              v30 = v29;
              if (v21 != v23)
              {
                do
                {
                  *((_OWORD *)v30 - 1) = *((_OWORD *)v21 - 1);
                  v30 -= 2;
                  v21 -= 2;
                }
                while (v21 != v23);
                v23 = v56;
              }
              v22 = v29 + 2;
              v56 = v30;
              v57 = v29 + 2;
              v58 = (unint64_t *)&v28[16 * v27];
              if (v23)
                operator delete(v23);
            }
            else
            {
              *v57 = v20;
              v21[1] = v18;
              v22 = v21 + 2;
            }
            v18 = 0;
            v57 = v22;
          }
          else
          {
            v18 = 0;
          }
          v20 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      if (v17 < v11 - 2)
        break;
      v36 = 0;
LABEL_51:
      ++v17;
      v14 = v19;
      v19 = v36;
      if (v17 == v11)
        goto LABEL_63;
    }
    v31 = v17 + 2;
    if ((uint64_t)(v17 + 2) < 0 || (v32 = range.length, range.length <= v31))
    {
      v35 = 0;
    }
    else
    {
      v33 = (UniChar *)CharactersPtr;
      if (CharactersPtr)
      {
        v34 = range.location + v31;
      }
      else
      {
        if (v52)
        {
          v35 = v52[range.location + v31];
          goto LABEL_50;
        }
        if (length <= v31 || (v37 = v54, v54 > v31))
        {
          v38 = v17 - 2;
          if ((unint64_t)v31 < 4)
            v38 = 0;
          if (v38 + 64 < range.length)
            v32 = v38 + 64;
          v54 = v38;
          length = v32;
          v59.location = range.location + v38;
          v59.length = v32 - v38;
          CFStringGetCharacters(theString, v59, buffer);
          v37 = v54;
        }
        v34 = v31 - v37;
        v33 = buffer;
      }
      v35 = v33[v34];
    }
LABEL_50:
    v36 = CFCharacterSetIsCharacterMember(a3, v35) != 0;
    goto LABEL_51;
  }
LABEL_63:
  if (v57 == v56)
  {
    v43 = a1;
  }
  else
  {
    v39 = (void *)-[__CFString mutableCopy](a1, "mutableCopy");
    for (i = v57; i != v56; i -= 2)
    {
      v41 = *(i - 2);
      v42 = *(i - 1);
      objc_msgSend(v39, "replaceCharactersInRange:withString:", v41, v42, a5);
    }
    v43 = v39;
  }
  v44 = v43;
  if (v56)
  {
    v57 = v56;
    operator delete(v56);
  }
  return v44;
}

+ (unint64_t)numberForString:()TSWPAdditions withListNumberFormat:
{
  void *v6;
  id v7;
  NSString *v8;
  unint64_t result;
  _anonymous_namespace_ *v10;
  _anonymous_namespace_ *v11;
  void *v12;
  uint64_t v13;

  if (!objc_msgSend(a3, "length"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = (void *)objc_msgSend(a3, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet"));
  v7 = (id)+[NSString(TSWPAdditions) numberForString:withListNumberFormat:]::sformattingCharacterSet;
  if (!+[NSString(TSWPAdditions) numberForString:withListNumberFormat:]::sformattingCharacterSet)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDD1690]);
    objc_msgSend(v7, "addCharactersInString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", +[NSString(TSWPAdditions) numberForString:withListNumberFormat:]::sFormattingChars, 3));
    +[NSString(TSWPAdditions) numberForString:withListNumberFormat:]::sformattingCharacterSet = (uint64_t)v7;
  }
  if ((int)a4 >= 3)
    v6 = (void *)objc_msgSend(v6, "tsu_stringByRemovingCharactersInSet:", v7);
  if ((unint64_t)objc_msgSend(v6, "length") >= 0x65)
    v6 = (void *)objc_msgSend(v6, "substringWithRange:", 0, 100);
  switch((int)a4)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      v10 = (_anonymous_namespace_ *)v6;
    case 6:
    case 7:
    case 8:
      v10 = (_anonymous_namespace_ *)objc_msgSend(v6, "uppercaseString");
    case 9:
    case 10:
    case 11:
      v11 = (_anonymous_namespace_ *)v6;
      goto LABEL_15;
    case 12:
    case 13:
    case 14:
      v11 = (_anonymous_namespace_ *)objc_msgSend(v6, "uppercaseString");
LABEL_15:
      break;
    default:
      v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSString(TSWPAdditions) numberForString:withListNumberFormat:]");
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"), 1288, CFSTR("Label format (%d) not recognized."), a4);
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

+ (unint64_t)numberForString:()TSWPAdditions withPageNumberFormat:
{
  void *v6;
  NSString *v7;
  unint64_t result;
  void *v9;
  uint64_t v10;
  _anonymous_namespace_ *v11;
  _anonymous_namespace_ *v12;

  if (!objc_msgSend(a3, "length"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = (void *)objc_msgSend(a3, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet"));
  if ((unint64_t)objc_msgSend(v6, "length") >= 0x65)
    v6 = (void *)objc_msgSend(v6, "substringWithRange:", 0, 100);
  switch((int)a4)
  {
    case 0:
    case 1:
      v11 = (_anonymous_namespace_ *)v6;
    case 2:
      v11 = (_anonymous_namespace_ *)objc_msgSend(v6, "uppercaseString");
    case 3:
      v12 = (_anonymous_namespace_ *)v6;
      goto LABEL_13;
    case 4:
      v12 = (_anonymous_namespace_ *)objc_msgSend(v6, "uppercaseString");
LABEL_13:
      break;
    default:
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSString(TSWPAdditions) numberForString:withPageNumberFormat:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"), 1332, CFSTR("Number format (%d) not recognized."), a4);
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

+ (uint64_t)stringForValue:()TSWPAdditions withListNumberFormat:
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringForValue:withListNumberFormat:includeFormatting:", a3, a4, 1);
}

+ (__CFString)stringForValue:()TSWPAdditions withListNumberFormat:includeFormatting:
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _anonymous_namespace_ *v17;
  unint64_t v18;
  void *v19;
  _anonymous_namespace_ *v20;
  unint64_t v21;
  void *v22;
  _anonymous_namespace_ *v23;
  unint64_t v24;
  _anonymous_namespace_ *v25;
  unsigned int v26;
  _anonymous_namespace_ *v27;
  unsigned int v28;
  _anonymous_namespace_ *v29;
  unsigned int v30;
  void *v31;
  _anonymous_namespace_ *v32;
  unint64_t v33;
  void *v34;
  _anonymous_namespace_ *v35;
  unint64_t v36;
  void *v37;
  _anonymous_namespace_ *v38;
  unint64_t v39;
  int v40;
  int v41;
  int v42;
  void *v43;
  uint64_t v44;
  __CFString *v45;
  __CFString *v46;
  void *v48;
  uint64_t v49;

  switch((int)a4)
  {
    case 0:
      v7 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_77;
    case 1:
      v9 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_80;
    case 2:
      v11 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_83;
    case 3:
      v7 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_77;
    case 4:
      v9 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_80;
    case 5:
      v11 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_83;
    case 6:
      v7 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_15;
    case 7:
      v9 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_17;
    case 8:
      v11 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_19;
    case 9:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v17 = this;
      v18 = 26;
      goto LABEL_76;
    case 10:
      v9 = (void *)MEMORY[0x24BDD17C8];
      v20 = this;
      v21 = 26;
      goto LABEL_79;
    case 11:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v23 = this;
      v24 = 26;
      goto LABEL_82;
    case 12:
      v7 = (void *)MEMORY[0x24BDD17C8];
LABEL_15:
      v8 = objc_msgSend(v13, "lowercaseString");
      goto LABEL_77;
    case 13:
      v9 = (void *)MEMORY[0x24BDD17C8];
LABEL_17:
      v10 = objc_msgSend(v14, "lowercaseString");
      goto LABEL_80;
    case 14:
      v11 = (void *)MEMORY[0x24BDD17C8];
LABEL_19:
      v12 = objc_msgSend(v15, "lowercaseString");
      goto LABEL_83;
    case 15:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v25 = this;
      v26 = 0;
      goto LABEL_51;
    case 16:
      v9 = (void *)MEMORY[0x24BDD17C8];
      v27 = this;
      v28 = 0;
      goto LABEL_53;
    case 17:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v29 = this;
      v30 = 0;
      goto LABEL_55;
    case 18:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v32 = this;
      v33 = 46;
      goto LABEL_57;
    case 19:
      v9 = (void *)MEMORY[0x24BDD17C8];
      v35 = this;
      v36 = 46;
      goto LABEL_60;
    case 20:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v38 = this;
      v39 = 46;
      goto LABEL_63;
    case 21:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v32 = this;
      v33 = 46;
      goto LABEL_33;
    case 22:
      v9 = (void *)MEMORY[0x24BDD17C8];
      v35 = this;
      v36 = 46;
      goto LABEL_35;
    case 23:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v38 = this;
      v39 = 46;
      goto LABEL_37;
    case 24:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v32 = this;
      v33 = 47;
      goto LABEL_57;
    case 25:
      v9 = (void *)MEMORY[0x24BDD17C8];
      v35 = this;
      v36 = 47;
      goto LABEL_60;
    case 26:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v38 = this;
      v39 = 47;
      goto LABEL_63;
    case 27:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v32 = this;
      v33 = 47;
LABEL_33:
      v40 = 1;
      goto LABEL_58;
    case 28:
      v9 = (void *)MEMORY[0x24BDD17C8];
      v35 = this;
      v36 = 47;
LABEL_35:
      v41 = 1;
      goto LABEL_61;
    case 29:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v38 = this;
      v39 = 47;
LABEL_37:
      v42 = 1;
      goto LABEL_64;
    case 30:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v25 = this;
      v26 = 1;
      goto LABEL_51;
    case 31:
      v9 = (void *)MEMORY[0x24BDD17C8];
      v27 = this;
      v28 = 1;
      goto LABEL_53;
    case 32:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v29 = this;
      v30 = 1;
      goto LABEL_55;
    case 33:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v25 = this;
      v26 = 2;
      goto LABEL_51;
    case 34:
      v9 = (void *)MEMORY[0x24BDD17C8];
      v27 = this;
      v28 = 2;
      goto LABEL_53;
    case 35:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v29 = this;
      v30 = 2;
      goto LABEL_55;
    case 36:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v25 = this;
      v26 = 3;
      goto LABEL_51;
    case 37:
      v9 = (void *)MEMORY[0x24BDD17C8];
      v27 = this;
      v28 = 3;
      goto LABEL_53;
    case 38:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v29 = this;
      v30 = 3;
      goto LABEL_55;
    case 39:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v25 = this;
      v26 = 4;
      goto LABEL_51;
    case 40:
      v9 = (void *)MEMORY[0x24BDD17C8];
      v27 = this;
      v28 = 4;
      goto LABEL_53;
    case 41:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v29 = this;
      v30 = 4;
      goto LABEL_55;
    case 42:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v25 = this;
      v26 = 5;
LABEL_51:
      goto LABEL_77;
    case 43:
      v9 = (void *)MEMORY[0x24BDD17C8];
      v27 = this;
      v28 = 5;
LABEL_53:
      goto LABEL_80;
    case 44:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v29 = this;
      v30 = 5;
LABEL_55:
      goto LABEL_83;
    case 45:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v32 = this;
      v33 = 14;
LABEL_57:
      v40 = 0;
LABEL_58:
      goto LABEL_77;
    case 46:
      v9 = (void *)MEMORY[0x24BDD17C8];
      v35 = this;
      v36 = 14;
LABEL_60:
      v41 = 0;
LABEL_61:
      goto LABEL_80;
    case 47:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v38 = this;
      v39 = 14;
LABEL_63:
      v42 = 0;
LABEL_64:
      goto LABEL_83;
    case 48:
      v43 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_87;
    case 49:
      v7 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_77;
    case 50:
      v9 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_80;
    case 51:
      v11 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_83;
    case 52:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v17 = this;
      v18 = 29;
      goto LABEL_76;
    case 53:
      v9 = (void *)MEMORY[0x24BDD17C8];
      v20 = this;
      v21 = 29;
      goto LABEL_79;
    case 54:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v23 = this;
      v24 = 29;
      goto LABEL_82;
    case 55:
      v7 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_77;
    case 56:
      v9 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_80;
    case 57:
      v11 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_83;
    case 58:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v17 = this;
      v18 = 22;
LABEL_76:
LABEL_77:
      v45 = (__CFString *)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@."), v8);
      goto LABEL_84;
    case 59:
      v9 = (void *)MEMORY[0x24BDD17C8];
      v20 = this;
      v21 = 22;
LABEL_79:
LABEL_80:
      v45 = (__CFString *)objc_msgSend(v9, "stringWithFormat:", CFSTR("(%@)"), v10);
      goto LABEL_84;
    case 60:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v23 = this;
      v24 = 22;
LABEL_82:
LABEL_83:
      v45 = (__CFString *)objc_msgSend(v11, "stringWithFormat:", CFSTR("%@)"), v12);
      goto LABEL_84;
    case 61:
      v43 = (void *)MEMORY[0x24BDD17C8];
LABEL_87:
      v45 = (__CFString *)objc_msgSend(v43, "stringWithFormat:", CFSTR("%@"), v44);
      goto LABEL_84;
    case 63:
      goto LABEL_84;
    case 64:
LABEL_84:
      v46 = v45;
      if ((a5 & 1) != 0)
        return v46;
      goto LABEL_89;
    default:
      v48 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", this);
      v49 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSString(TSWPAdditions) stringForValue:withListNumberFormat:includeFormatting:]");
      objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"), 1543, CFSTR("Label format (%d) invalid for numeric list."), a4);
      v46 = &stru_24D82FEB0;
      if ((a5 & 1) != 0)
        return v46;
LABEL_89:
      if (+[NSString(TSWPAdditions) stringForValue:withListNumberFormat:includeFormatting:]::s_predicate != -1)
        dispatch_once(&+[NSString(TSWPAdditions) stringForValue:withListNumberFormat:includeFormatting:]::s_predicate, &__block_literal_global_73);
      return (__CFString *)-[__CFString tsu_stringByRemovingCharactersInSet:](v46, "tsu_stringByRemovingCharactersInSet:", +[NSString(TSWPAdditions) stringForValue:withListNumberFormat:includeFormatting:]::_formattingCharacterSet);
  }
}

- (uint64_t)contentsScript
{
  return objc_msgSend(a1, "contentsScriptInRange:", 0, objc_msgSend(a1, "length"));
}

- (uint64_t)contentsScriptInRange:()TSWPAdditions
{
  uint64_t v7;
  const char *CStringPtr;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  UniChar v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  UniChar buffer[64];
  CFStringRef theString;
  const UniChar *CharactersPtr;
  const char *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFRange v30;

  if (!a4 || a3 >= -[__CFString length](a1, "length"))
    return 0;
  v7 = TSWPScriptForCharacter(-[__CFString characterAtIndex:](a1, "characterAtIndex:", a3));
  if ((_DWORD)v7)
  {
    theString = a1;
    v26 = a3 + 1;
    v27 = a4 - 1;
    CharactersPtr = CFStringGetCharactersPtr(a1);
    if (CharactersPtr)
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
    v10 = 0;
    v11 = 0;
    v28 = 0;
    v29 = 0;
    v12 = 64;
    v25 = CStringPtr;
    while (1)
    {
      v13 = (unint64_t)v11 >= 4 ? 4 : v11;
      v14 = v27;
      if (v27 <= v11)
        break;
      if (CharactersPtr)
      {
        v15 = CharactersPtr[v11 + v26];
      }
      else if (v25)
      {
        v15 = v25[v26 + v11];
      }
      else
      {
        v16 = v28;
        if (v29 <= v11 || v28 > v11)
        {
          v18 = v11 - v13;
          v19 = v13 + v10;
          v20 = v12 - v13;
          v21 = v18 + 64;
          if (v18 + 64 >= v27)
            v21 = v27;
          v28 = v18;
          v29 = v21;
          if (v27 >= v20)
            v14 = v20;
          v30.length = v14 + v19;
          v30.location = v26 + v18;
          CFStringGetCharacters(theString, v30, buffer);
          v16 = v28;
        }
        v15 = buffer[v11 - v16];
      }
      if (!v15)
        break;
      ++v11;
      --v10;
      ++v12;
      if (TSWPScriptForCharacter(v15) != (_DWORD)v7)
        return 1;
    }
  }
  return v7;
}

+ (uint64_t)stringForValue:()TSWPAdditions withPageNumberFormat:
{
  uint64_t result;
  void *v5;

  switch(a4)
  {
    case 0:
      break;
    case 1:
      break;
    case 2:
      goto LABEL_8;
    case 3:
      break;
    case 4:
LABEL_8:
      result = objc_msgSend(v5, "lowercaseString");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (uint64_t)utf32CharacterAtIndex:()TSWPAdditions
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v5 = objc_msgSend(a1, "length");
  if (v5 <= a3)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) utf32CharacterAtIndex:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"), 1643, CFSTR("index out of bounds"));
    return 0;
  }
  v6 = v5;
  v7 = objc_msgSend(a1, "characterAtIndex:", a3);
  if ((v7 & 0xFC00) == 0xDC00)
  {
    v8 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) utf32CharacterAtIndex:]");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm");
    v11 = CFSTR("index inside surrogate pair");
    v12 = (void *)v8;
    v13 = v9;
    v14 = 1648;
LABEL_4:
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v10, v14, v11);
    return v7;
  }
  if (a3 + 1 < v6 && (v7 & 0xFC00) == 0xD800)
  {
    v18 = objc_msgSend(a1, "characterAtIndex:");
    if ((v18 & 0xFC00) == 0xDC00)
      return (v18 + ((_DWORD)v7 << 10) - 56613888);
    v19 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) utf32CharacterAtIndex:]");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm");
    v11 = CFSTR("invalid surrogate pair");
    v12 = (void *)v19;
    v13 = v20;
    v14 = 1653;
    goto LABEL_4;
  }
  return v7;
}

@end
