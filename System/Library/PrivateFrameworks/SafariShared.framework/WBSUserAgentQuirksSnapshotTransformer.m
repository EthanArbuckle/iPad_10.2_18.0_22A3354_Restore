@implementation WBSUserAgentQuirksSnapshotTransformer

- (id)objectFromData:(id)a3
{
  id v3;
  WBSUserAgentQuirksSnapshot *v4;

  v3 = a3;
  v4 = -[WBSUserAgentQuirksSnapshot initWithSnapshotData:error:]([WBSUserAgentQuirksSnapshot alloc], "initWithSnapshotData:error:", v3, 0);

  return v4;
}

@end
