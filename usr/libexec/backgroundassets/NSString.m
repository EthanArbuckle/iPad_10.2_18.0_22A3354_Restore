@implementation NSString

- (id)_baassets_stringByRemovingLastIdentifierComponent
{
  id v3;
  __CFString *v4;

  v3 = -[NSString rangeOfString:options:](self, "rangeOfString:options:", CFSTR("."), 4);
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
    v4 = &stru_100059EF8;
  else
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self, "substringToIndex:", v3));
  return v4;
}

- (id)_baassets_validUTI
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-.")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "invertedSet"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByTrimmingCharactersInSet:](self, "stringByTrimmingCharactersInSet:", v4));
  return v5;
}

- (id)_baassets_validUTIWithWildcard
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-.*")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "invertedSet"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByTrimmingCharactersInSet:](self, "stringByTrimmingCharactersInSet:", v4));
  return v5;
}

@end
