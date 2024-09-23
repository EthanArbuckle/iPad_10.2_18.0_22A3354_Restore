@implementation WBSDomainAllowListSnapshotTransformer

- (id)objectFromData:(id)a3
{
  id v3;
  WBSDomainAllowListSnapshot *v4;

  v3 = a3;
  v4 = -[WBSDomainAllowListSnapshot initWithSnapshotData:error:]([WBSDomainAllowListSnapshot alloc], "initWithSnapshotData:error:", v3, 0);

  return v4;
}

@end
