@implementation NSString(TSKSearch)

+ (uint64_t)regexStringForSearchString:()TSKSearch options:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v6 = (void *)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("*?+[(){}^$|\\./"));
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\"“”"));
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("'‘’"));
  v9 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (objc_msgSend(a3, "length"))
  {
    v10 = 0;
    while (1)
    {
      v11 = objc_msgSend(a3, "characterAtIndex:", v10);
      if (!objc_msgSend(v6, "characterIsMember:", v11))
        break;
      objc_msgSend(v9, "appendFormat:", CFSTR("\\%C"), v11);
LABEL_12:
      if (++v10 >= (unint64_t)objc_msgSend(a3, "length"))
        goto LABEL_13;
    }
    if ((a4 & 0x10) != 0)
    {
      if (objc_msgSend(v7, "characterIsMember:", v11))
      {
        v12 = v9;
        v13 = CFSTR("[\"“”]");
LABEL_11:
        objc_msgSend(v12, "appendFormat:", v13, v25);
        goto LABEL_12;
      }
      if (objc_msgSend(v8, "characterIsMember:", v11))
      {
        v12 = v9;
        v13 = CFSTR("['‘’]");
        goto LABEL_11;
      }
    }
    v25 = v11;
    v12 = v9;
    v13 = CFSTR("%C");
    goto LABEL_11;
  }
  if ((a4 & 8) == 0)
    return (uint64_t)v9;
  v14 = objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\b"), 0, 0);
  if (!v14)
    return (uint64_t)v9;
LABEL_13:
  v15 = (void *)v14;
  v16 = objc_msgSend(a3, "tsu_range");
  v18 = (void *)objc_msgSend(v15, "matchesInString:options:range:", a3, 0, v16, v17);
  if (objc_msgSend(v18, "count"))
  {
    v19 = objc_msgSend((id)objc_msgSend(v18, "objectAtIndex:", 0), "range");
    if (!(v19 | v20))
      v9 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("\\b%@"), v9);
  }
  if (objc_msgSend(v18, "count")
    && (v21 = objc_msgSend((id)objc_msgSend(v18, "lastObject"), "range"), v23 = v22, v21 == objc_msgSend(a3, "length"))
    && !v23)
  {
    return objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@\\b"), v9);
  }
  else
  {
    return (uint64_t)v9;
  }
}

- (uint64_t)rangeOfString:()TSKSearch searchOptions:updatingSearchRange:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = a1;
  v7 = a4 & 1;
  if ((a4 & 4) != 0)
  {
    v9 = v7 | 4;
  }
  else
  {
    v8 = v7 | 0x400;
    a3 = objc_msgSend((id)objc_opt_class(), "regexStringForSearchString:options:", a3, a4);
    a1 = v6;
    v9 = v8;
  }
  return objc_msgSend(a1, "tsu_rangeOfString:options:updatingSearchRange:", a3, v9, a5);
}

- (id)stringByCapitalizingToMatchString:()TSKSearch range:searchOptions:
{
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v11 = a1;
  v12 = objc_msgSend(a1, "length");
  if ((a6 & 1) != 0 && v12 >= 2 && a5 >= 2)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BDD14A8], "lowercaseLetterCharacterSet");
    v14 = (void *)objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
    v15 = objc_msgSend(a1, "characterAtIndex:", 0);
    v16 = objc_msgSend(a3, "characterAtIndex:", a4);
    if (objc_msgSend(v13, "characterIsMember:", v15))
    {
      if (objc_msgSend(v14, "characterIsMember:", v16))
      {
        v17 = (void *)objc_msgSend((id)objc_msgSend(a1, "substringWithRange:", 0, 1), "capitalizedString");
        if (objc_msgSend(v17, "length"))
        {
          v11 = (id)objc_msgSend(a1, "mutableCopy");
          objc_msgSend(v11, "replaceCharactersInRange:withString:", 0, 1, v17);
        }
      }
    }
  }
  return v11;
}

- (id)stringByReplacingOccurrencesOfString:()TSKSearch withString:searchOptions:range:replacementCount:
{
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v24;
  void *v25;

  v13 = a1;
  v14 = v13;
  v24 = a6;
  v25 = a7;
  v15 = 0;
  if (a7)
  {
    a7 = 0;
    v16 = v13;
    do
    {
      v17 = objc_msgSend(v16, "rangeOfString:searchOptions:updatingSearchRange:", a3, a5, &v24);
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = v17;
        v20 = v18;
        if (!a7)
        {
          v16 = (id)objc_msgSend(v16, "mutableCopy");
          a7 = v16;
        }
        objc_msgSend(a7, "replaceCharactersInRange:withString:", v19, v20, objc_msgSend(a4, "stringByCapitalizingToMatchString:range:searchOptions:", v16, v19, v20, a5));
        ++v15;
        v21 = objc_msgSend(a4, "length");
        v24 += v21 - v20;
      }
    }
    while (v25);
  }
  if (a8)
    *a8 = v15;
  if (a7)
    return a7;
  else
    return v14;
}

@end
