@implementation SAMicroblogFacebookCredential

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("FacebookCredential");
}

+ (id)facebookCredential
{
  return objc_alloc_init((Class)a1);
}

@end
