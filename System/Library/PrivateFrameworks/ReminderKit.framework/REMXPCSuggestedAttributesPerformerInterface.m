@implementation REMXPCSuggestedAttributesPerformerInterface

void __56__REMXPCSuggestedAttributesPerformerInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF10E528);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interface_result_4;
  interface_result_4 = v0;

  v2 = (void *)interface_result_4;
  +[REMXPCStorageClasses remStorageClasses](REMXPCStorageClasses, "remStorageClasses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_performSwiftInvocation_withParametersData_storages_completion_, 2, 0);

}

+ (id)interface
{
  if (interface_onceToken_5 != -1)
    dispatch_once(&interface_onceToken_5, &__block_literal_global_32);
  return (id)interface_result_4;
}

@end
