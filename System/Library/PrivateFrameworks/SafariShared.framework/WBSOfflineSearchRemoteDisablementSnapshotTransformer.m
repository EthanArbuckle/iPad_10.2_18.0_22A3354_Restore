@implementation WBSOfflineSearchRemoteDisablementSnapshotTransformer

- (id)objectFromData:(id)a3
{
  id v3;
  WBSOfflineSearchRemoteDisablementSnapshot *v4;

  v3 = a3;
  v4 = -[WBSOfflineSearchRemoteDisablementSnapshot initWithSnapshotData:error:]([WBSOfflineSearchRemoteDisablementSnapshot alloc], "initWithSnapshotData:error:", v3, 0);

  return v4;
}

@end
