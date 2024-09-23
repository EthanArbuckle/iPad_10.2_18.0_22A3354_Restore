@implementation NSString

- (id)camelCase
{
  if (a1)
  {
    objc_msgSend(a1, "_pb_fixCase:", 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

@end
