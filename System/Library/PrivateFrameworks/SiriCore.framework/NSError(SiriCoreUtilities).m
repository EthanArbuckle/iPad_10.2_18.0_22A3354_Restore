@implementation NSError(SiriCoreUtilities)

- (uint64_t)siriCore_isNetworkDownError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDD1398]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (void *)v3;
  else
    v5 = a1;
  v6 = v5;

  if (objc_msgSend(v6, "code") == 50)
  {
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDE08F8]) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v6, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD1128]);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
