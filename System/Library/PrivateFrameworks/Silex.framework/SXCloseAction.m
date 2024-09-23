@implementation SXCloseAction

- (NSString)type
{
  return (NSString *)CFSTR("close");
}

- (SXJSONDictionary)analytics
{
  return self->analytics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->analytics, 0);
}

@end
