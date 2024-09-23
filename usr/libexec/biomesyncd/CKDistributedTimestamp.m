@implementation CKDistributedTimestamp

- (id)bm_description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKDistributedTimestamp siteIdentifierObject](self, "siteIdentifierObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_alloc((Class)NSString);
  if (v5)
    v7 = objc_msgSend(v6, "initWithFormat:", CFSTR("%.8s:%lu"), objc_msgSend(v4, "bytes"), -[CKDistributedTimestamp clockValue](self, "clockValue"));
  else
    v7 = objc_msgSend(v6, "initWithFormat:", CFSTR("(null):%lu"), -[CKDistributedTimestamp clockValue](self, "clockValue"), v10);
  v8 = v7;

  return v8;
}

@end
