@implementation IMIgnoreRedirectURLAction

+ (id)ignoreRedirectAction
{
  return objc_alloc_init(IMIgnoreRedirectURLAction);
}

- (int64_t)actionType
{
  return 0;
}

- (id)redirectURL
{
  return 0;
}

@end
