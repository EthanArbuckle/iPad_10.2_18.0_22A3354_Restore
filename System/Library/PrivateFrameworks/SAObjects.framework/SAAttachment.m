@implementation SAAttachment

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("Attachment");
}

+ (id)attachment
{
  return objc_alloc_init((Class)a1);
}

@end
