@implementation WBSPasswordWarningTopFraudTargetsTransformer

- (id)objectFromData:(id)a3
{
  id v3;
  WBSPasswordWarningTopFraudTargets *v4;

  v3 = a3;
  v4 = -[WBSPasswordWarningTopFraudTargets initWithSnapshotData:error:]([WBSPasswordWarningTopFraudTargets alloc], "initWithSnapshotData:error:", v3, 0);

  return v4;
}

@end
