@implementation NSError(PersonaKit)

+ (uint64_t)pr_errorWithCode:()PersonaKit
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PRPersonaDomain"), a3, 0);
}

- (BOOL)pr_isNetworkAvailabilityError
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v6;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x24BDD1308]);

  if (!v3)
  {
    objc_msgSend(a1, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", CFSTR("PRPersonaDomain"));

    if (!v6)
      return 0;
    if (objc_msgSend(a1, "code") != -9002)
    {
      v4 = -9006;
      return objc_msgSend(a1, "code") == v4;
    }
    return 1;
  }
  if (objc_msgSend(a1, "code") == -1009
    || objc_msgSend(a1, "code") == -1001
    || objc_msgSend(a1, "code") == -1003
    || objc_msgSend(a1, "code") == -1004
    || objc_msgSend(a1, "code") == -1020
    || objc_msgSend(a1, "code") == -1006)
  {
    return 1;
  }
  v4 = -1005;
  return objc_msgSend(a1, "code") == v4;
}

- (uint64_t)pr_isInPersonaDomain
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqual:", CFSTR("PRPersonaDomain"));

  return v2;
}

@end
