@implementation NSURL

- (id)URLByReplacingHost:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NSURL host](self, "host"));
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self, "absoluteString"));
    v10 = objc_msgSend(v8, "rangeOfString:", v6);
    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingCharactersInRange:withString:", v10, v9, v4));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));

    }
  }

  return v7;
}

@end
