@implementation SXSubscribeAction

- (NSString)type
{
  return (NSString *)CFSTR("subscribe");
}

- (SXAction)postPurchaseAction
{
  return self->postPurchaseAction;
}

- (SXJSONDictionary)analytics
{
  return self->analytics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->analytics, 0);
  objc_storeStrong((id *)&self->postPurchaseAction, 0);
}

@end
