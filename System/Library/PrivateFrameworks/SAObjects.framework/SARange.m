@implementation SARange

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("Range");
}

+ (id)range
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)length
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("length"));
}

- (void)setLength:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("length"), a3);
}

- (int64_t)start
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("start"));
}

- (void)setStart:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("start"), a3);
}

@end
