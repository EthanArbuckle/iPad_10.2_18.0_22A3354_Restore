@implementation REMXPCDaemonInterface

void __34__REMXPCDaemonInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF10E468);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interface_sInterface;
  interface_sInterface = v0;

  v2 = (void *)interface_sInterface;
  +[REMXPCChangeTrackingPerformerInterface interface](REMXPCChangeTrackingPerformerInterface, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_changeTrackingPerformerWithStoreContainerToken_reason_completion_, 0, 1);

  v4 = (void *)interface_sInterface;
  +[REMXPCDebugPerformerInterface interface](REMXPCDebugPerformerInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_debugPerformerWithStoreContainerToken_reason_completion_, 0, 1);

  v6 = (void *)interface_sInterface;
  +[REMXPCStorePerformerInterface interface](REMXPCStorePerformerInterface, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_storePerformerWithProcessName_storeContainerToken_reason_completion_, 0, 1);

  v8 = (void *)interface_sInterface;
  +[REMXPCSyncInterfacePerformerInterface interface](REMXPCSyncInterfacePerformerInterface, "interface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_syncInterfacePerformerWithReason_completion_, 0, 1);

  v10 = (void *)interface_sInterface;
  +[REMXPCIndexingPerformerInterface interface](REMXPCIndexingPerformerInterface, "interface");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInterface:forSelector:argumentIndex:ofReply:", v11, sel_indexingPerformerWithReason_completion_, 0, 1);

}

+ (NSXPCInterface)interface
{
  if (interface_onceToken_3 != -1)
    dispatch_once(&interface_onceToken_3, &__block_literal_global_29);
  return (NSXPCInterface *)(id)interface_sInterface;
}

@end
