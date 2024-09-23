@implementation TICryptographerMock

- (id)stringDigestForName:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR("-digest"));
}

@end
