@implementation SAMicroblogFacebookPost

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("FacebookPost");
}

+ (id)facebookPost
{
  return objc_alloc_init((Class)a1);
}

@end
