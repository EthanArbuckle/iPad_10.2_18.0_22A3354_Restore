@implementation NSString(WebBookmarksExtras)

- (BOOL)_webBookmarks_hasCaseInsensitivePrefix:()WebBookmarksExtras
{
  return a3 && objc_msgSend(a1, "rangeOfString:options:", a3, 9) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_wb_stringByStandardizingDAVServerID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = a1;
  objc_msgSend(v4, "_wb_stringByDeletingTrailingSlash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_wb_stringByDeletingTrailingSlash
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

- (id)wb_bestURLForUserTypedString
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "safari_bestURLForUserTypedString");
  else
    objc_msgSend(a1, "_web_bestURLForUserTypedString");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
