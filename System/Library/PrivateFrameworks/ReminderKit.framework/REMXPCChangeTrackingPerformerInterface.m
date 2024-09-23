@implementation REMXPCChangeTrackingPerformerInterface

+ (id)interface
{
  if (interface_onceToken_1 != -1)
    dispatch_once(&interface_onceToken_1, &__block_literal_global_13);
  return (id)interface_result_1;
}

void __51__REMXPCChangeTrackingPerformerInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF10E2C8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interface_result_1;
  interface_result_1 = v0;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)interface_result_1, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_getTrackingStateWithClientID_completion_, 0, 0);
  objc_msgSend((id)interface_result_1, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_saveTrackingState_withClientID_completionHandler_, 1, 0);
  v2 = (void *)interface_result_1;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_fetchAuxiliaryChangeInfos_completionHandler_, 0, 0);

  v7 = (void *)interface_result_1;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_fetchAuxiliaryChangeInfos_completionHandler_, 0, 1);

}

@end
