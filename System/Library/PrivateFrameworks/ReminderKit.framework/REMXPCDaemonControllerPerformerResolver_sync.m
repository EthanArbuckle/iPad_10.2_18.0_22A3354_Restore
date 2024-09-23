@implementation REMXPCDaemonControllerPerformerResolver_sync

- (id)name
{
  return CFSTR("sync");
}

- (void)resolveWithDaemon:(id)a3 reason:(id)a4 completion:(id)a5
{
  objc_msgSend(a3, "syncInterfacePerformerWithReason:completion:", a4, a5);
}

@end
