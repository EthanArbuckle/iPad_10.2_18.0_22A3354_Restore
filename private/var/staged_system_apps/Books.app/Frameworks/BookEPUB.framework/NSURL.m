@implementation NSURL

- (id)_be_urlWithoutFragment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteURL](self, "absoluteURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "standardizedURL"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL fragment](self, "fragment"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("#"), "stringByAppendingString:", v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v7, &stru_38FF08));

    v9 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
    v4 = (void *)v9;
  }

  return v4;
}

- (BOOL)be_isEquivalentToURL:(id)a3 ignoringFragment:(BOOL)a4
{
  return _BEAreEquivalentURLsIgnoringFragment(self, a3, a4);
}

- (id)be_unescapedPath
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self, "path"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "be_stringByRemovingPercentEscapes"));

  if (objc_msgSend(v3, "hasPrefix:", CFSTR("/")))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", 1));

    v3 = (void *)v4;
  }
  return v3;
}

- (id)be_URLByReplacingWithScheme:(id)a3
{
  id v4;
  NSURL *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  v5 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](v5, "scheme"));
  v7 = objc_msgSend(v6, "be_isNotWhitespace");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](v5, "absoluteString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL scheme](v5, "scheme"));
    v10 = objc_msgSend(v8, "rangeOfString:", v9);
    v12 = v11;

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingCharactersInRange:withString:", v10, v12, v4));
      v14 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));

      v5 = (NSURL *)v14;
    }

  }
  return v5;
}

@end
