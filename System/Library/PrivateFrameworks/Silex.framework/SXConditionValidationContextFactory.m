@implementation SXConditionValidationContextFactory

- (id)createContextWithLayoutOptions:(id)a3
{
  id v3;
  SXConditionValidationContext *v4;

  v3 = a3;
  v4 = -[SXConditionValidationContext initWithLayoutOptions:]([SXConditionValidationContext alloc], "initWithLayoutOptions:", v3);

  return v4;
}

@end
