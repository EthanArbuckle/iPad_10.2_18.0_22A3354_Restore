@implementation NSURL(SCRCURL)

- (id)absoluteStringWithoutQueryParameters
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(CFSTR("?"), "stringByAppendingString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", v4, &stru_24CB26880);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasSuffix:", CFSTR("/")) & 1) == 0 && v6 && objc_msgSend(v5, "hasSuffix:", v6))
    {
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("/"));
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v7;
    }

  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (id)baseDomainURL
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(a1, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%@://%@/"), v3, v4);

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
