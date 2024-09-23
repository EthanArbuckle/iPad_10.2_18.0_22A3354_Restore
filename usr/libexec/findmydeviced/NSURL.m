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

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self, "absoluteString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL objectType](NSURL, "objectType"));
  objc_msgSend(v5, "encodeString:forKey:", v6, v7);

  return 1;
}

- (NSURL)initWithFMDCoder:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL objectType](NSURL, "objectType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeStringForKey:", v7));

  if (v8)
  {
    self = -[NSURL initWithString:](self, "initWithString:", v8);
    p_isa = (id *)&self->super.isa;
  }
  else if (p_isa)
  {
    v11 = NSLocalizedFailureReasonErrorKey;
    v12 = CFSTR("Key \"FM.url\" not found.");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    *p_isa = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMURLErrorDomain"), 0, v9));

    p_isa = 0;
  }

  return (NSURL *)p_isa;
}

+ (id)objectType
{
  return CFSTR("FM.url");
}

+ (id)objectTypeKey
{
  return CFSTR("urlType");
}

@end
