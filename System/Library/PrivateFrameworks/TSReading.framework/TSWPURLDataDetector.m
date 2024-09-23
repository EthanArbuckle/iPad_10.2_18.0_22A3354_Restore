@implementation TSWPURLDataDetector

+ (void)setInvalidURLSchemes:(id)a3
{

  gInvalidSchemes = (uint64_t)a3;
}

+ (id)detectorIdentifier
{
  return (id)kURLDataDetectorType;
}

+ (void)initURLCharacterSets
{
  id v2;

  if (!sValidURLCharacters)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
    objc_msgSend(v2, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet"));
    objc_msgSend(v2, "addCharactersInString:", CFSTR(";/?:@=&"));
    objc_msgSend(v2, "addCharactersInString:", CFSTR("$-_.+!*'(),"));
    objc_msgSend(v2, "addCharactersInString:", CFSTR("%~"));
    objc_msgSend(v2, "addCharactersInString:", CFSTR("#"));
    sValidURLCharacters = objc_msgSend(v2, "copy");
    sInvalidURLCharacters = (uint64_t)(id)objc_msgSend((id)sValidURLCharacters, "invertedSet");

  }
}

+ (_NSRange)expandValidRange:(_NSRange)a3 inString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  NSRange v7;
  NSUInteger v8;
  NSUInteger v9;
  NSRange v10;
  _NSRange result;
  NSRange v12;

  length = a3.length;
  location = a3.location;
  objc_msgSend((id)objc_opt_class(), "initURLCharacterSets");
  v7.location = objc_msgSend(a4, "rangeOfCharacterFromSet:options:range:", sInvalidURLCharacters, 6, 0, location);
  if (v7.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7.location = 0;
    v7.length = location;
  }
  v12.location = location;
  v12.length = length;
  v10 = NSUnionRange(v7, v12);
  v9 = v10.length;
  v8 = v10.location;
  result.length = v9;
  result.location = v8;
  return result;
}

+ (_NSRange)calculateScanRangeForString:(id)a3 changedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  length = a4.length;
  location = a4.location;
  if ((unint64_t)objc_msgSend(a3, "length") >= 3)
  {
    location = objc_msgSend((id)objc_opt_class(), "expandValidRange:inString:", location, length, a3);
    length = v7;
  }
  for (; length; --length)
  {
    v8 = objc_msgSend(a3, "characterAtIndex:", location);
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"), "characterIsMember:", v8) & 1) == 0&& (IsParagraphBreakingCharacter(v8) & 1) == 0&& !IsSpecialCharacter(v8))
    {
      break;
    }
    ++location;
  }
  v9 = location;
  v10 = length;
  result.length = v10;
  result.location = v9;
  return result;
}

+ (id)scanString:(id)a3 scanRange:(_NSRange)a4
{
  return (id)objc_msgSend(a1, "newArrayByScanningString:scanRange:", a3, a4.location, a4.length);
}

+ (id)newArrayByScanningString:(id)a3 scanRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unsigned int v25;
  void *v26;
  NSUInteger v27;
  uint64_t v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  _QWORD v40[3];
  _QWORD v41[3];
  _BYTE v42[128];
  uint64_t v43;
  NSRange v44;
  NSRange v45;
  NSRange v46;
  NSRange v47;

  length = a4.length;
  location = a4.location;
  v43 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(a3, "length");
  v8 = 0;
  if (v7 >= 3 && length >= 3)
  {
    v44.length = v7;
    v44.location = 0;
    v46.location = location;
    v46.length = length;
    v39 = 0;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14E8], "dataDetectorWithTypes:error:", 32, &v39), "matchesInString:options:range:", a3, 0, NSIntersectionRange(v44, v46).location, v44.length);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = 0;
      v8 = 0;
      v13 = *(_QWORD *)v36;
      v32 = *(_QWORD *)v36;
      while (1)
      {
        v14 = 0;
        v33 = v10;
        do
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
          v16 = objc_msgSend(v15, "range");
          v18 = v17;
          v19 = objc_msgSend(v15, "URL");
          if (v19)
          {
            if (v11 > v16 || v12 + v11 < v16 + v18)
            {
              v21 = (void *)v19;
              v22 = objc_msgSend(v8, "count");
              if (v22)
              {
                v23 = v22;
                v24 = 0;
                v25 = 1;
                while (1)
                {
                  v26 = (void *)objc_msgSend(v8, "objectAtIndexedSubscript:", v24);
                  v45.location = objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", kTSWPDataDetectorRangeKey), "rangeValue");
                  v27 = v45.length;
                  v47.location = v16;
                  v47.length = v18;
                  if (NSIntersectionRange(v45, v47).length)
                    break;
                  v24 = v25;
                  if (v23 <= v25++)
                    goto LABEL_20;
                }
                if (v27 >= v18)
                {
LABEL_26:
                  v11 = v16;
                  v12 = v18;
                  v13 = v32;
                  v10 = v33;
                  goto LABEL_27;
                }
                objc_msgSend(v8, "removeObjectAtIndex:", v24);
              }
LABEL_20:
              v29 = objc_msgSend((id)objc_msgSend(v21, "scheme"), "lowercaseString");
              if (!v29)
                goto LABEL_26;
              v13 = v32;
              v10 = v33;
              if (!objc_msgSend((id)gInvalidSchemes, "member:", v29))
              {
                v30 = (void *)objc_msgSend((id)objc_opt_class(), "newURLFromString:", objc_msgSend(v21, "absoluteString"));
                if (!v8)
                  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
                v40[0] = kTSWPDataDetectorRangeKey;
                v41[0] = objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v16, v18);
                v41[1] = v30;
                v40[1] = kTSWPDataDetectorValueKey;
                v40[2] = kTSWPDataDetectorTypeKey;
                v41[2] = kURLDataDetectorType;
                objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 3));

              }
              v11 = v16;
              v12 = v18;
            }
          }
LABEL_27:
          ++v14;
        }
        while (v14 != v10);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        if (!v10)
          goto LABEL_31;
      }
    }
    v8 = 0;
  }
LABEL_31:
  objc_msgSend(v8, "sortUsingFunction:context:", compareHyperlinkRangeValues, 0);
  return v8;
}

+ (id)newURLFromString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;

  if (!a3)
    return 0;
  if (!objc_msgSend(a3, "compare:options:range:", CFSTR("file://"), 1, 0, objc_msgSend(CFSTR("file://"), "length")))
  {
    v12 = (__CFString *)objc_msgSend(a3, "substringFromIndex:", objc_msgSend(CFSTR("file://"), "length"));
    if (v12)
    {
      v13 = v12;
      if (-[__CFString length](v12, "length"))
      {
        v14 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, v13, &stru_24D82FEB0);
        if (v14)
        {
          v15 = v14;
          v16 = (void *)-[__CFString stringByExpandingTildeInPath](v14, "stringByExpandingTildeInPath");
          CFRelease(v15);
          if (!v16)
            goto LABEL_21;
        }
        else
        {
          v16 = (void *)-[__CFString stringByExpandingTildeInPath](v13, "stringByExpandingTildeInPath");
          if (!v16)
            goto LABEL_21;
        }
        objc_msgSend(v16, "length");
      }
    }
LABEL_21:
    JUMPOUT(0x219A13DE0);
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_msgSend(v4, "scheme");
    if (v6)
    {
      v7 = v6;
      v8 = (__CFString *)objc_msgSend(v6, "lowercaseString");
      if (objc_msgSend(v7, "isEqual:", v8))
        v9 = 0;
      else
        v9 = v8;
      if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("feed")))
        v9 = CFSTR("http");
      if (v9)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@%@"), v9, objc_msgSend(a3, "substringFromIndex:", objc_msgSend(v7, "length")));

        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v10);
      }
    }
  }
  return v5;
}

@end
