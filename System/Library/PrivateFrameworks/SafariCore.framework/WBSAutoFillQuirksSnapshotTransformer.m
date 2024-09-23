@implementation WBSAutoFillQuirksSnapshotTransformer

- (id)objectFromData:(id)a3
{
  id v3;
  WBSAutoFillQuirksSnapshot *v4;

  v3 = a3;
  v4 = -[WBSAutoFillQuirksSnapshot initWithSnapshotData:error:]([WBSAutoFillQuirksSnapshot alloc], "initWithSnapshotData:error:", v3, 0);

  return v4;
}

@end
