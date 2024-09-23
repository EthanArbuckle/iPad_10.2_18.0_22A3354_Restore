@implementation WBSPasswordBreachConfigurationBagSnapshotTransformer

- (id)objectFromData:(id)a3
{
  id v3;
  WBSPasswordBreachConfigurationBag *v4;

  v3 = a3;
  v4 = -[WBSPasswordBreachConfigurationBag initWithSnapshotData:error:]([WBSPasswordBreachConfigurationBag alloc], "initWithSnapshotData:error:", v3, 0);

  return v4;
}

@end
