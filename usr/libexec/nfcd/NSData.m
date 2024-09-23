@implementation NSData

- ($BE749665CD263385F3F5ED554982D87D)DERItem
{
  NSData *v2;
  id v3;
  NSUInteger v4;
  char *v5;
  $BE749665CD263385F3F5ED554982D87D result;

  v2 = objc_retainAutorelease(self);
  v3 = -[NSData bytes](v2, "bytes");
  v4 = -[NSData length](v2, "length");
  v5 = (char *)v3;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

@end
