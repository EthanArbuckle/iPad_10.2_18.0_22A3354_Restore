@implementation NSString(Extras)

- (id)stringBySubstitutingHTMLEntitiesForAmpersandAndAngleBrackets
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  id v6;

  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  v3 = objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
         0,
         0,
         objc_msgSend(v2, "length"));
  v4 = objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
         0,
         0,
         objc_msgSend(v2, "length"))
     + v3;
  if (v4
     + objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&gt;"),
                       0,
                       0,
                       objc_msgSend(v2, "length")))
  {
    v5 = v2;
  }
  else
  {
    v5 = a1;
  }
  v6 = v5;

  return v6;
}

- (id)URLScheme
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "rangeOfString:", CFSTR(":"));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
