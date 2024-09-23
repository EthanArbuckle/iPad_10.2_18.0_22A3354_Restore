@implementation WBSAutoplayQuirkWhitelistSnapshotTransformer

- (id)objectFromData:(id)a3
{
  id v3;
  WBSAutoplayQuirkWhitelistSnapshot *v4;

  v3 = a3;
  v4 = -[WBSAutoplayQuirkWhitelistSnapshot initWithSnapshotData:error:]([WBSAutoplayQuirkWhitelistSnapshot alloc], "initWithSnapshotData:error:", v3, 0);

  return v4;
}

@end
