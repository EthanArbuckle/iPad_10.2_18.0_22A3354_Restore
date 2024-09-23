@implementation REMXPCDaemonControllerPerformerResolver_debug

- (REMXPCDaemonControllerPerformerResolver_debug)initWithStoreContainerToken:(id)a3
{
  id v5;
  REMXPCDaemonControllerPerformerResolver_debug *v6;
  REMXPCDaemonControllerPerformerResolver_debug *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMXPCDaemonControllerPerformerResolver_debug;
  v6 = -[REMXPCDaemonControllerPerformerResolver_debug init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storeContainerToken, a3);

  return v7;
}

- (id)name
{
  return CFSTR("debug");
}

- (void)resolveWithDaemon:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[REMXPCDaemonControllerPerformerResolver_debug storeContainerToken](self, "storeContainerToken");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "debugPerformerWithStoreContainerToken:reason:completion:", v11, v9, v8);

}

- (REMStoreContainerToken)storeContainerToken
{
  return self->_storeContainerToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeContainerToken, 0);
}

@end
