@implementation NSData(PB)

- (id)pbToNullable
{
  void *v2;

  if (objc_msgSend(a1, "length"))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

@end
