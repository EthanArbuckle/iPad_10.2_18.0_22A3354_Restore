@implementation NSString(TSWPAdditions)

- (__CFString)tswp_stringByNormalizingParagraphBreaks
{
  __CFString *v1;
  uint64_t v2;
  const char *CStringPtr;
  uint64_t v4;
  int64_t v5;
  void *v6;
  __CFString *v7;
  int64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  UniChar v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  CFRange v18;
  uint64_t v19;
  int64_t v20;
  UniChar *v21;
  UniChar v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  __int16 v28;
  UniChar buffer[64];
  __CFString *v30;
  const UniChar *CharactersPtr;
  const char *v32;
  uint64_t v33;
  int64_t v34;
  int64_t v35;
  int64_t v36;
  CFRange v37;

  v1 = a1;
  v2 = -[__CFString length](v1, "length");
  v30 = v1;
  v33 = 0;
  v34 = v2;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  if (CharactersPtr)
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  v32 = CStringPtr;
  v35 = 0;
  v36 = 0;
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    for (i = 64; ; ++i)
    {
      if ((unint64_t)v8 >= 3)
        v10 = 3;
      else
        v10 = v8;
      if ((unint64_t)v8 >= 4)
        v11 = 4;
      else
        v11 = v8;
      if (v34 <= v8)
        goto LABEL_48;
      if (CharactersPtr)
      {
        v12 = CharactersPtr[v8 + v33];
      }
      else if (v32)
      {
        v12 = v32[v33 + v8];
      }
      else
      {
        if (v36 <= v8 || v5 > v8)
        {
          v13 = -v11;
          v14 = v11 + v4;
          v15 = i - v11;
          v16 = v8 + v13;
          v17 = v16 + 64;
          if (v16 + 64 >= v34)
            v17 = v34;
          v35 = v16;
          v36 = v17;
          v18.location = v16 + v33;
          if (v34 >= v15)
            v19 = v15;
          else
            v19 = v34;
          v18.length = v19 + v14;
          CFStringGetCharacters(v30, v18, buffer);
          v5 = v35;
        }
        v12 = buffer[v8 - v5];
      }
      if (v12 == 8233)
        goto LABEL_33;
      if (v12 == 13)
        break;
LABEL_48:
      ++v8;
      --v4;
      if (v8 >= v2)
      {

        return v1;
      }
    }
    v20 = v8 + 1;
    if (v8 + 1 >= v2 || v34 <= v20)
    {
LABEL_33:
      v23 = 1;
      if (!v7)
        goto LABEL_42;
      goto LABEL_34;
    }
    if (CharactersPtr)
    {
      v21 = (UniChar *)&CharactersPtr[v8 + v33];
    }
    else
    {
      if (v32)
      {
        v22 = v32[v33 + 1 + v8];
LABEL_38:
        if (v22 == 10)
          v23 = 2;
        else
          v23 = 1;
        if (!v7)
        {
LABEL_42:
          v7 = (__CFString *)(id)-[__CFString mutableCopyWithZone:](v1, "mutableCopyWithZone:", 0);

          v1 = v7;
          if (!v6)
          {
LABEL_43:
            v28 = 10;
            v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &v28, 1);
          }
LABEL_44:
          -[__CFString replaceCharactersInRange:withString:](v7, "replaceCharactersInRange:withString:", v8, v23, v6);
          v2 = -[__CFString length](v1, "length");
          v30 = v1;
          v33 = 0;
          v34 = v2;
          CharactersPtr = CFStringGetCharactersPtr(v1);
          if (CharactersPtr)
            v24 = 0;
          else
            v24 = CFStringGetCStringPtr(v1, 0x600u);
          v5 = 0;
          v32 = v24;
          v35 = 0;
          v36 = 0;
          goto LABEL_48;
        }
LABEL_34:
        if (!v6)
          goto LABEL_43;
        goto LABEL_44;
      }
      if (v36 <= v20 || v5 > v20)
      {
        v25 = v8 - v10 + 64;
        if (v25 >= v34)
          v25 = v34;
        v35 = v8 - v10;
        v36 = v25;
        if (v34 >= i - v10)
          v26 = i - v10;
        else
          v26 = v34;
        v37.length = v26 + v10 + v4;
        v37.location = v8 - v10 + v33;
        CFStringGetCharacters(v30, v37, buffer);
        v5 = v35;
      }
      v21 = &buffer[v8 - v5];
    }
    v22 = v21[1];
    goto LABEL_38;
  }
  return v1;
}

- (uint64_t)tswp_findIndexOfCharacter:()TSWPAdditions range:
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

- (uint64_t)tswp_rangeOfCharactersFromSet:()TSWPAdditions index:
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a3;
  v7 = objc_msgSend(a1, "length");
  v8 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v6, 0, a4, v7 - a4);
  v10 = v9;
  if (v9)
  {
    v11 = a4 + 1;
    if (a4 + 1 < v7)
    {
      do
      {
        if (!objc_msgSend(v6, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v11)))
          break;
        ++v10;
        ++v11;
      }
      while (v7 != v11);
    }
  }

  return v8;
}

- (__CFString)tswp_replaceOccurrencesOfCharactersInSet:()TSWPAdditions minimumConsecutiveLength:replaceString:
{
  const __CFCharacterSet *v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  const char *CStringPtr;
  UniChar v14;
  BOOL v15;
  UniChar v16;
  int IsCharacterMember;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t *v23;
  unint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  unint64_t *v30;
  unint64_t *v31;
  int64_t v32;
  CFIndex v33;
  UniChar *v34;
  CFIndex v35;
  UniChar v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  __CFString *v40;
  unint64_t *i;
  uint64_t v42;
  uint64_t v43;
  CFRange v45;
  uint64_t v46;
  CFRange v47;
  __CFString *v48;
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

  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) tswp_replaceOccurrencesOfCharactersInSet:minimumConsecutiveLength:replaceString:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 968, 0, "invalid nil value for '%{public}s'", "replaceString");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v56 = 0;
  v57 = 0;
  v58 = 0;
  v12 = -[__CFString length](a1, "length");
  theString = a1;
  range.location = 0;
  range.length = v12;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  if (CharactersPtr)
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v54 = 0;
  length = 0;
  v52 = CStringPtr;
  v48 = a1;
  if (v12 && range.length >= 1)
  {
    if (CharactersPtr)
    {
      v14 = CharactersPtr[range.location];
    }
    else if (CStringPtr)
    {
      v14 = CStringPtr[range.location];
    }
    else
    {
      if (range.length >= 0x40uLL)
        v45.length = 64;
      else
        v45.length = range.length;
      length = v45.length;
      v45.location = range.location;
      CFStringGetCharacters(theString, v45, buffer);
      v14 = buffer[-v54];
    }
  }
  else
  {
    v14 = 0;
  }
  v15 = CFCharacterSetIsCharacterMember(v8, v14) != 0;
  if (v12 < 2 || range.length < 2)
  {
    v16 = 0;
  }
  else if (CharactersPtr)
  {
    v16 = CharactersPtr[range.location + 1];
  }
  else if (v52)
  {
    v16 = v52[range.location + 1];
  }
  else
  {
    if (length < 2 || (v46 = v54, v54 >= 2))
    {
      if (range.length >= 0x40uLL)
        v47.length = 64;
      else
        v47.length = range.length;
      v54 = 0;
      length = v47.length;
      v47.location = range.location;
      CFStringGetCharacters(theString, v47, buffer);
      v46 = v54;
    }
    v16 = buffer[1 - v46];
  }
  IsCharacterMember = CFCharacterSetIsCharacterMember(v8, v16);
  if (v12)
  {
    v18 = 0;
    v19 = 0;
    v20 = IsCharacterMember != 0;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if (v15)
      {
        if (v18 < v21)
          v21 = v18;
        ++v19;
        if (!v20)
        {
          if (v19 >= a4)
          {
            v22 = v57;
            if (v57 >= v58)
            {
              v24 = v56;
              v25 = ((char *)v57 - (char *)v56) >> 4;
              v26 = v25 + 1;
              if ((unint64_t)(v25 + 1) >> 60)
                std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
              v27 = (char *)v58 - (char *)v56;
              if (v58 - v56 > v26)
                v26 = v27 >> 3;
              if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0)
                v28 = 0xFFFFFFFFFFFFFFFLL;
              else
                v28 = v26;
              if (v28)
              {
                v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)&v58, v28);
                v24 = v56;
                v22 = v57;
              }
              else
              {
                v29 = 0;
              }
              v30 = (unint64_t *)&v29[16 * v25];
              *v30 = v21;
              v30[1] = v19;
              v31 = v30;
              if (v22 != v24)
              {
                do
                {
                  *((_OWORD *)v31 - 1) = *((_OWORD *)v22 - 1);
                  v31 -= 2;
                  v22 -= 2;
                }
                while (v22 != v24);
                v24 = v56;
              }
              v23 = v30 + 2;
              v56 = v31;
              v57 = v30 + 2;
              v58 = (unint64_t *)&v29[16 * v28];
              if (v24)
                operator delete(v24);
            }
            else
            {
              *v57 = v21;
              v22[1] = v19;
              v23 = v22 + 2;
            }
            v19 = 0;
            v57 = v23;
          }
          else
          {
            v19 = 0;
          }
          v21 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      if (v18 < v12 - 2)
        break;
      v37 = 0;
LABEL_51:
      ++v18;
      v15 = v20;
      v20 = v37;
      if (v18 == v12)
        goto LABEL_63;
    }
    v32 = v18 + 2;
    if ((uint64_t)(v18 + 2) < 0 || (v33 = range.length, range.length <= v32))
    {
      v36 = 0;
    }
    else
    {
      v34 = (UniChar *)CharactersPtr;
      if (CharactersPtr)
      {
        v35 = range.location + v32;
      }
      else
      {
        if (v52)
        {
          v36 = v52[range.location + v32];
          goto LABEL_50;
        }
        if (length <= v32 || (v38 = v54, v54 > v32))
        {
          v39 = v18 - 2;
          if ((unint64_t)v32 < 4)
            v39 = 0;
          if (v39 + 64 < range.length)
            v33 = v39 + 64;
          v54 = v39;
          length = v33;
          v59.location = range.location + v39;
          v59.length = v33 - v39;
          CFStringGetCharacters(theString, v59, buffer);
          v38 = v54;
        }
        v35 = v32 - v38;
        v34 = buffer;
      }
      v36 = v34[v35];
    }
LABEL_50:
    v37 = CFCharacterSetIsCharacterMember(v8, v36) != 0;
    goto LABEL_51;
  }
LABEL_63:
  if (v57 == v56)
  {
    v40 = v48;
  }
  else
  {
    v40 = (__CFString *)-[__CFString mutableCopy](v48, "mutableCopy");
    for (i = v57; i != v56; i -= 2)
    {
      v42 = *(i - 2);
      v43 = *(i - 1);
      -[__CFString replaceCharactersInRange:withString:](v40, "replaceCharactersInRange:withString:", v42, v43, v9);
    }
  }
  if (v56)
  {
    v57 = v56;
    operator delete(v56);
  }

  return v40;
}

+ (uint64_t)tswp_numberForString:()TSWPAdditions withListNumberFormat:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  void *v18;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!+[NSString(TSWPAdditions) tswp_numberForString:withListNumberFormat:]::sformattingCharacterSet)
    {
      v8 = objc_alloc_init(MEMORY[0x24BDD1690]);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &+[NSString(TSWPAdditions) tswp_numberForString:withListNumberFormat:]::sFormattingChars, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addCharactersInString:", v9);

      v10 = (void *)+[NSString(TSWPAdditions) tswp_numberForString:withListNumberFormat:]::sformattingCharacterSet;
      +[NSString(TSWPAdditions) tswp_numberForString:withListNumberFormat:]::sformattingCharacterSet = (uint64_t)v8;

    }
    if (a4 >= 3)
    {
      objc_msgSend(v7, "tsu_stringByRemovingCharactersInSet:", +[NSString(TSWPAdditions) tswp_numberForString:withListNumberFormat:]::sformattingCharacterSet);
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v11;
    }
    if ((unint64_t)objc_msgSend(v7, "length") >= 0x65)
    {
      objc_msgSend(v7, "substringWithRange:", 0, 100);
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v13;
    }
    switch(a4)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
        goto LABEL_15;
      case 3uLL:
      case 4uLL:
      case 5uLL:
        goto LABEL_15;
      case 6uLL:
      case 7uLL:
      case 8uLL:
        goto LABEL_15;
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
        goto LABEL_15;
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
LABEL_15:
        v15 = v14;
        break;
      default:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSString(TSWPAdditions) tswp_numberForString:withListNumberFormat:]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 1087, 0, "Label format (%lu) not recognized.", a4);

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
        v15 = 0x7FFFFFFFFFFFFFFFLL;
        break;
    }

  }
  else
  {
    v15 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v15;
}

+ (uint64_t)tswp_numberForString:()TSWPAdditions withPageNumberFormat:
{
  id v5;
  void *v6;
  void *v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v7, "length") >= 0x65)
    {
      objc_msgSend(v7, "substringWithRange:", 0, 100);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
    switch((int)a4)
    {
      case 0:
        goto LABEL_12;
      case 1:
        goto LABEL_12;
      case 2:
        goto LABEL_12;
      case 3:
        goto LABEL_12;
      case 4:
LABEL_12:
        v11 = v10;
        break;
      default:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSString(TSWPAdditions) tswp_numberForString:withPageNumberFormat:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1128, 0, "Number format (%d) not recognized.", a4);

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
        v11 = 0x7FFFFFFFFFFFFFFFLL;
        break;
    }

  }
  else
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

+ (uint64_t)tswp_stringForValue:()TSWPAdditions withListNumberFormat:
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "tswp_stringForValue:withListNumberFormat:includeFormatting:", a3, a4, 1);
}

+ (id)tswp_stringForValue:()TSWPAdditions withListNumberFormat:includeFormatting:
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  switch(a4)
  {
    case 0:
      v7 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 1:
      v10 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 2:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 3:
      v12 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 4:
      v13 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 5:
      v14 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 6:
      v15 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 7:
      v16 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 8:
      v17 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 9:
      v18 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 10:
      v19 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 11:
      v20 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 12:
      v21 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 13:
      v22 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 14:
      v23 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 15:
      v24 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 16:
      v25 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 17:
      v26 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 18:
      v27 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 19:
      v28 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 20:
      v29 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 21:
      v30 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 22:
      v31 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 23:
      v32 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 24:
      v33 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 25:
      v34 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 26:
      v35 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 27:
      v36 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 28:
      v37 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 29:
      v38 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 30:
      v39 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 31:
      v40 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 32:
      v41 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 33:
      v42 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 34:
      v43 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 35:
      v44 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 36:
      v45 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 37:
      v46 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 38:
      v47 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 39:
      v48 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 40:
      v49 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 41:
      v50 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 42:
      v51 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 43:
      v52 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 44:
      v53 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 45:
      v54 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 46:
      v55 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 47:
      v56 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 48:
      v57 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "stringWithFormat:", CFSTR("%@"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 49:
      v58 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 50:
      v59 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 51:
      v60 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 52:
      v61 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 53:
      v62 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 54:
      v63 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 55:
      v64 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 56:
      v65 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 57:
      v66 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 58:
      v67 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 59:
      v68 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 60:
      v69 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 61:
      v70 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "stringWithFormat:", CFSTR("%@"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 62:
      v71 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "stringWithFormat:", CFSTR("%@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 63:
      v72 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "stringWithFormat:", CFSTR("(%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    case 64:
      v73 = (void *)MEMORY[0x24BDD17C8];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "stringWithFormat:", CFSTR("%@)"), v8);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_67:
      v74 = (void *)v9;

      goto LABEL_68;
    case 66:
      v77 = objc_claimAutoreleasedReturnValue();
      goto LABEL_75;
    case 67:
      v77 = objc_claimAutoreleasedReturnValue();
LABEL_75:
      v74 = (void *)v77;
LABEL_68:
      if ((a5 & 1) == 0)
      {
        if (+[NSString(TSWPAdditions) tswp_stringForValue:withListNumberFormat:includeFormatting:]::s_predicate != -1)
          dispatch_once(&+[NSString(TSWPAdditions) tswp_stringForValue:withListNumberFormat:includeFormatting:]::s_predicate, &__block_literal_global_40);
        objc_msgSend(v74, "tsu_stringByRemovingCharactersInSet:", +[NSString(TSWPAdditions) tswp_stringForValue:withListNumberFormat:includeFormatting:]::_formattingCharacterSet);
        v75 = objc_claimAutoreleasedReturnValue();

        v74 = (void *)v75;
      }
      return v74;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSString(TSWPAdditions) tswp_stringForValue:withListNumberFormat:includeFormatting:]");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v78, v79, 1346, 1, "Label format (%lu) invalid for numeric list.", a4);

      TSUCrash((uint64_t)"Label format (%lu) invalid for numeric list.", v80, v81, v82, v83, v84, v85, v86, a4);
  }
}

- (uint64_t)tswp_NSDetectorMatchStringIsStrictPhoneNumber
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v2);

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v4);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(a1, "length") && !u_charDigitValue(objc_msgSend(a1, "tswp_utf32CharacterAtIndex:", 0)))
  {
    return 1;
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v14 = 0;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v13, "length", (_QWORD)v16) > 3)
          {
            v14 = 1;
            goto LABEL_22;
          }
          if ((unint64_t)objc_msgSend(v13, "length") <= 2)
          {
            v14 = 1;
            if (v10)
              goto LABEL_22;
            v10 = 1;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_22:

  }
  return v14;
}

+ (id)tswp_stringForValue:()TSWPAdditions withPageNumberFormat:
{
  void *v4;

  switch(a4)
  {
    case 0:
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (uint64_t)tswp_utf32CharacterAtIndex:()TSWPAdditions
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  NSRange v37;
  NSRange v38;

  v5 = objc_msgSend(a1, "length");
  if (v5 <= a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) tswp_utf32CharacterAtIndex:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1493, 0, "index out of bounds");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    return 0;
  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(a1, "characterAtIndex:", a3);
    if ((v7 & 0xFC00) == 0xDC00)
    {
      if (a3)
        v8 = objc_msgSend(a1, "characterAtIndex:", a3 - 1);
      else
        v8 = 0;
      if (a3 + 1 >= objc_msgSend(a1, "length"))
        v12 = 0;
      else
        v12 = objc_msgSend(a1, "characterAtIndex:", a3 + 1);
      v13 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", a3);
      v15 = v14;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) tswp_utf32CharacterAtIndex:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37.location = v13;
      v37.length = v15;
      NSStringFromRange(v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 1502, 1, "index inside surrogate pair. characters:U+%04x U+%04x U+%04x, sequence range: %{public}@", v8, v7, v12, v18);

      v38.location = v13;
      v38.length = v15;
      NSStringFromRange(v38);
      objc_claimAutoreleasedReturnValue();
      TSUCrash((uint64_t)"index inside surrogate pair. characters:U+%04x U+%04x U+%04x, sequence range: %{public}@", v19, v20, v21, v22, v23, v24, v25, v8);
    }
    if (a3 + 1 < v6 && (v7 & 0xFC00) == 0xD800)
    {
      v11 = objc_msgSend(a1, "characterAtIndex:");
      if ((v11 & 0xFC00) != 0xDC00)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) tswp_utf32CharacterAtIndex:]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 1508, 1, "invalid surrogate pair");

        TSUCrash((uint64_t)"invalid surrogate pair", v28, v29, v30, v31, v32, v33, v34, v36);
      }
      return (v11 + ((_DWORD)v7 << 10) - 56613888);
    }
  }
  return v7;
}

- (uint64_t)tswp_utf32CharacterAtIndex:()TSWPAdditions planeClassification:
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;

  v7 = objc_msgSend(a1, "length");
  v8 = objc_msgSend(a1, "characterAtIndex:", a3);
  if ((v8 & 0xFC00) == 0xD800)
  {
    if (a4)
      *a4 = 1;
    if (v7 - 1 == a3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) tswp_utf32CharacterAtIndex:planeClassification:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1548, 0, "Invalid surrogate pair (single code point=0x%x, index=%lu)", v8, a3);
    }
    else
    {
      v13 = objc_msgSend(a1, "characterAtIndex:", a3 + 1);
      if ((v13 & 0xFC00) == 0xDC00)
      {
        v10 = v13 + ((_DWORD)v8 << 10);
        return (v10 - 56613888);
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) tswp_utf32CharacterAtIndex:planeClassification:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1556, 0, "Invalid surrogate pair (single code point=0x%x, index=%lu)", v8, a3);
    }
    goto LABEL_20;
  }
  if ((v8 & 0xFC00) == 0xDC00)
  {
    if (a4)
      *a4 = 2;
    if (!a3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) tswp_utf32CharacterAtIndex:planeClassification:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 1529, 0, "Invalid surrogate pair (single code point=0x%x, index=%lu)", v8, 0);

LABEL_21:
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      return v8;
    }
    v9 = objc_msgSend(a1, "characterAtIndex:", a3 - 1);
    if ((v9 & 0xFC00) == 0xD800)
    {
      v10 = v8 + (v9 << 10);
      return (v10 - 56613888);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) tswp_utf32CharacterAtIndex:planeClassification:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1537, 0, "Invalid surrogate pair (single code point=0x%x, index=%lu)", v8, a3);
LABEL_20:

    goto LABEL_21;
  }
  if (a4)
    *a4 = 0;
  return v8;
}

- (uint64_t)tswp_isLowerCaseFromIndex:()TSWPAdditions
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;

  v5 = objc_msgSend(a1, "length");
  v6 = v5 - a3;
  if (v5 <= a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSString(TSWPAdditions) tswp_isLowerCaseFromIndex:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1570, 0, "index is out of bounds");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    return 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v7, 2, a3, v6) == 0x7FFFFFFFFFFFFFFFLL;

  }
  return v8;
}

- (id)tswp_stringWithoutControlCharacters
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD14A8], "controlCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v4 = objc_msgSend(v1, "rangeOfCharacterFromSet:", v2);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    objc_msgSend(v1, "deleteCharactersInRange:", v4, v3);
  }
  v5 = (void *)objc_msgSend(v1, "copy");

  return v5;
}

@end
