@implementation REMXPCDaemonControllerPerformerResolver_indexing

- (id)name
{
  return CFSTR("indexing");
}

- (void)resolveWithDaemon:(id)a3 reason:(id)a4 completion:(id)a5
{
  objc_msgSend(a3, "indexingPerformerWithReason:completion:", a4, a5);
}

@end
