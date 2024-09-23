@implementation NSString(WFExtension)

+ (uint64_t)WF_ignorableCharacterSet
{
  uint64_t result;
  NSObject *v1;
  _BOOL4 v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  result = ignorableCharacterSet_NSString;
  if (!ignorableCharacterSet_NSString)
  {
    ignorableCharacterSet_NSString = objc_opt_new();
    objc_msgSend((id)ignorableCharacterSet_NSString, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"));
    objc_msgSend((id)ignorableCharacterSet_NSString, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x24BDD14A8], "symbolCharacterSet"));
    objc_msgSend((id)ignorableCharacterSet_NSString, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(".,-_!?*&")));
    v1 = __WFDefaultLog();
    v2 = os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG);
    result = ignorableCharacterSet_NSString;
    if (v2)
    {
      v3 = 138412290;
      v4 = ignorableCharacterSet_NSString;
      _os_log_debug_impl(&dword_20CD6C000, v1, OS_LOG_TYPE_DEBUG, "ignorableCharacterSet_NSString %@", (uint8_t *)&v3, 0xCu);
      return ignorableCharacterSet_NSString;
    }
  }
  return result;
}

+ (id)WF_stringFromArray:()WFExtension
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v4;
}

- (uint64_t)WF_containsString:()WFExtension
{
  return objc_msgSend(a1, "WF_containsString:options:", a3, 2);
}

- (BOOL)WF_containsString:()WFExtension options:
{
  return objc_msgSend(a1, "rangeOfString:options:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)WF_containsWord:()WFExtension
{
  return objc_msgSend(a1, "WF_rangeOfWord:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)WF_rangeOfWord:()WFExtension
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v5 = objc_msgSend(a3, "length");
  v6 = objc_msgSend(a1, "length");
  v7 = objc_msgSend(a1, "length");
  v8 = 0;
  while (1)
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v7 < v5)
      break;
    v10 = objc_msgSend(a1, "rangeOfString:options:range:", a3, 1, v8, v7);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    v12 = v10;
    v8 = v10 + v5;
    if (v10)
      v13 = v10 - 1;
    else
      v13 = 0;
    if (v10)
      v14 = v11 + 1;
    else
      v14 = v11;
    v7 = v6 - v8;
    if (v6 <= v8)
      v15 = v14;
    else
      v15 = v14 + 1;
    v16 = (void *)objc_msgSend(a1, "substringWithRange:", v13, v15);
    if (!objc_msgSend((id)objc_msgSend(v16, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD17C8], "WF_ignorableCharacterSet")), "caseInsensitiveCompare:", a3))return v12;
  }
  return v9;
}

- (void)WF_stringByRemovingWord:()WFExtension
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;

  v4 = a1;
  v5 = objc_msgSend(a1, "WF_rangeOfWord:");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v5; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v4, "WF_rangeOfWord:", a3))
    {
      v8 = i + v6;
      v9 = objc_msgSend(v4, "length") - (i + v6);
      v4 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), objc_msgSend(v4, "substringWithRange:", 0, i), objc_msgSend(v4, "substringWithRange:", v8, v9));
    }
  }
  return v4;
}

- (uint64_t)WF_stringByEscapingPrintfArguments
{
  return objc_msgSend(a1, "WF_stringByReplacingString:withString:", CFSTR("%"), CFSTR("%%"));
}

- (void)WF_stringByReplacingString:()WFExtension withString:
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24C583DA8);
  v8 = (void *)objc_msgSend(a1, "componentsSeparatedByString:", a3);
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = v9 - 1;
    do
    {
      objc_msgSend(v7, "appendString:", objc_msgSend(v8, "objectAtIndex:", v11));
      if (v12 != v11)
        objc_msgSend(v7, "appendString:", a4);
      ++v11;
    }
    while (v10 != v11);
  }
  return v7;
}

- (uint64_t)WF_stringByConvertingSpacesInHTMLSpaces
{
  return objc_msgSend(a1, "WF_stringByReplacingString:withString:", CFSTR(" "), CFSTR("&nbsp;"));
}

- (id)WF_fuzzyStringWithWordLength:()WFExtension
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = (void *)objc_opt_new();
  v6 = 0;
  v7 = objc_msgSend(a1, "length") - a3 + 1;
  do
  {
    objc_msgSend(v5, "appendString:", objc_msgSend(a1, "substringWithRange:", v6, a3));
    objc_msgSend(v5, "appendString:", CFSTR(" "));
    ++v6;
  }
  while (v7 != v6);
  return v5;
}

- (uint64_t)WF_numericCompare:()WFExtension
{
  return objc_msgSend(a1, "compare:options:range:", a3, 64, 0, objc_msgSend(a1, "length"));
}

- (uint64_t)WF_stringByProperlyFixingPercentEscapesUsingEncoding:()WFExtension
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "stringByReplacingPercentEscapesUsingEncoding:", 4);
  if (!v2)
    v2 = a1;
  return objc_msgSend(v2, "stringByAddingPercentEscapesUsingEncoding:", 4);
}

- (uint64_t)_isIPv4DomainAddress
{
  void *v2;
  uint64_t v3;
  id v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", a1);
  v5 = 0;
  if (objc_msgSend(v2, "scanCharactersFromSet:intoString:", objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(".0123456789")), &v5))v3 = objc_msgSend(v5, "isEqualToString:", a1);
  else
    v3 = 0;

  return v3;
}

- (uint64_t)WF_stringWithMostSignificatDomainPart
{
  void *v2;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(".")));
  if ((unint64_t)objc_msgSend(v2, "count") < 3 || (objc_msgSend(a1, "_isIPv4DomainAddress") & 1) != 0)
    return (uint64_t)a1;
  v4 = objc_msgSend(v2, "lastObject");
  objc_msgSend(v2, "removeLastObject");
  v5 = objc_msgSend(v2, "lastObject");
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v5, v4);
}

@end
