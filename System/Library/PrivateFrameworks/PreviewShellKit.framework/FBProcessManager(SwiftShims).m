@implementation FBProcessManager(SwiftShims)

- (id)uv_registerProcessForAuditToken:()SwiftShims
{
  __int128 v3;
  _OWORD v5[2];

  v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  objc_msgSend(a1, "registerProcessForAuditToken:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
