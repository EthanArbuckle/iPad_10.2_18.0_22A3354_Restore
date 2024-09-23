@implementation THSimpleCFIIndirection

+ (id)indirection
{
  return objc_alloc_init(THSimpleCFIIndirection);
}

- (id)cfiString
{
  return CFSTR("!");
}

@end
