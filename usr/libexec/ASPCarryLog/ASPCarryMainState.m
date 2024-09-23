@implementation ASPCarryMainState

- (void)registerIOLoggingXPCforInternalBuild:(BOOL)a3
{
  sub_100002DC4(a3, 1);
}

- (void)unregisterIOLoggingXPC
{
  xpc_activity_unregister("com.apple.nand.aspcarry_iolog");
}

@end
