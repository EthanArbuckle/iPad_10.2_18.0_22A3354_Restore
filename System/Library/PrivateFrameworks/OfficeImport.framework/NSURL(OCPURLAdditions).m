@implementation NSURL(OCPURLAdditions)

+ (id)URLWithPackagePart:()OCPURLAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend([a1 alloc], "initWithPackagePart:", v4);

  return v5;
}

- (uint64_t)initWithPackagePart:()OCPURLAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isAbsolutePath") & 1) == 0)
  {
    objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v6 = objc_msgSend(a1, "initWithString:", v4);

  return v6;
}

- (BOOL)isInternalToPackage
{
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 == 0;

  }
  return v3;
}

@end
