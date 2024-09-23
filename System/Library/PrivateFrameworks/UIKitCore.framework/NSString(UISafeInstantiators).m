@implementation NSString(UISafeInstantiators)

- (uint64_t)_initWithUTF8String:()UISafeInstantiators maxLength:
{
  _BYTE *v7;
  size_t v8;

  v7 = memchr(__s, 0, __n);
  if (v7)
    v8 = v7 - (_BYTE *)__s;
  else
    v8 = __n;
  return objc_msgSend(a1, "initWithBytes:length:encoding:", __s, v8, 4);
}

@end
