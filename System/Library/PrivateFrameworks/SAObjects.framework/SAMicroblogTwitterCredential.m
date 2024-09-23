@implementation SAMicroblogTwitterCredential

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("TwitterCredential");
}

+ (id)twitterCredential
{
  return objc_alloc_init((Class)a1);
}

@end
