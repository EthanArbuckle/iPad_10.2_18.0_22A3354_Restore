@implementation SidecarDebugRequest

- (SidecarDebugRequest)initWithMessage:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SidecarDebugRequest;
  return -[SidecarRequest initWithSession:message:](&v4, sel_initWithSession_message_, 0, a3);
}

- (void)sendItems:(id)a3
{
  -[SidecarRequest sendItems:complete:](self, "sendItems:complete:", MEMORY[0x24BDBD1A8], 1);
}

@end
