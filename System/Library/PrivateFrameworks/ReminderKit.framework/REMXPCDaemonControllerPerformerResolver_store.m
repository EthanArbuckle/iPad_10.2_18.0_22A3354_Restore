@implementation REMXPCDaemonControllerPerformerResolver_store

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeContainerToken, 0);
}

- (void)resolveWithDaemon:(id)a3 reason:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v8 = (void *)MEMORY[0x1E0CB3898];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "processName");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[REMXPCDaemonControllerPerformerResolver_store storeContainerToken](self, "storeContainerToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storePerformerWithProcessName:storeContainerToken:reason:completion:", v14, v13, v10, v9);

}

- (REMXPCDaemonControllerPerformerResolver_store)initWithStoreContainerToken:(id)a3
{
  id v5;
  REMXPCDaemonControllerPerformerResolver_store *v6;
  REMXPCDaemonControllerPerformerResolver_store *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMXPCDaemonControllerPerformerResolver_store;
  v6 = -[REMXPCDaemonControllerPerformerResolver_store init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storeContainerToken, a3);

  return v7;
}

- (id)name
{
  return CFSTR("store");
}

- (REMStoreContainerToken)storeContainerToken
{
  return self->_storeContainerToken;
}

@end
