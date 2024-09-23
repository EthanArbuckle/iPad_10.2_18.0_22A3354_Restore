@implementation NSString(LPExtras)

- (id)_lp_userVisibleHost
{
  NSString *v1;
  void *v2;

  encodeHostName(a1);
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  decodeHostName(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
