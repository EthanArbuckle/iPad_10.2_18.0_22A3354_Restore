@implementation NSUserDefaults

- (BOOL)filteringEnabled
{
  NSUserDefaults *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_10007BF08();

  return v3 & 1;
}

@end
