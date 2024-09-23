@implementation NSString(LPPrivate)

- (BOOL)_lp_hasCaseInsensitivePrefix:()LPPrivate
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  if (v4)
    v5 = objc_msgSend(a1, "rangeOfString:options:", v4, 9) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = 0;

  return v5;
}

- (uint64_t)_lp_stringForcingLeftToRightDirection
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("⁦\u202A%@\u202C⁩"), a1);
}

- (id)_lp_hostByStrippingTopLevelDomain
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!objc_msgSend(a1, "length"))
    return 0;
  if (objc_msgSend(a1, "_web_looksLikeIPAddress"))
    return a1;
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(a1, "_lp_highLevelDomainFromComponents:indexOfFirstHighLevelDomainComponent:indexOfFirstTopLevelDomainComponent:", v3, 0, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "subarrayWithRange:", 0, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_lp_stringByDeletingTrailingSlash
{
  id v2;

  if (objc_msgSend(a1, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)_lp_stringByDeletingUsernameAndPassword
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setUser:", 0);
    objc_msgSend(v3, "setPassword:", 0);
    objc_msgSend(v3, "string");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = a1;
  }
  v5 = v4;

  return v5;
}

- (__CFString)_lp_stringByTrimmingWhitespace
{
  __CFString *v1;

  v1 = (__CFString *)objc_msgSend(a1, "mutableCopy");
  CFStringTrimWhitespace(v1);
  return v1;
}

- (id)_lp_highLevelDomainFromHost
{
  id v2;
  void *v3;

  if (objc_msgSend(a1, "length"))
  {
    if (objc_msgSend(a1, "_web_looksLikeIPAddress"))
    {
      v2 = a1;
    }
    else
    {
      objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_lp_highLevelDomainFromComponents:indexOfFirstHighLevelDomainComponent:indexOfFirstTopLevelDomainComponent:", v3, 0, 0);
      v2 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (float)_lp_similarityToString:()LPPrivate
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  float v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  v6 = objc_msgSend(v4, "length");
  if (v5 <= v6)
    v5 = v6;
  if (v5)
    v7 = (float)(v5 - damerauLevenshteinDistance((NSString *)a1, (NSString *)v4)) / (float)v5;
  else
    v7 = 1.0;

  return v7;
}

@end
