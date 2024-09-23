@implementation NSXPCConnection(NFWhitelistChecker)

- (id)NF_whitelistChecker
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "NF_userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ServiceWhitelist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
