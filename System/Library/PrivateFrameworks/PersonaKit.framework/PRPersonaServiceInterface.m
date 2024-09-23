@implementation PRPersonaServiceInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken != -1)
    dispatch_once(&XPCInterface_onceToken, &__block_literal_global_0);
  return (id)XPCInterface_interface;
}

void __41__PRPersonaServiceInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545A4A88);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface;
  XPCInterface_interface = v0;

  v2 = (void *)XPCInterface_interface;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_allLikenessesForPrimaryiCloudAccountWithCompletion_, 0, 1);

  v6 = (void *)XPCInterface_interface;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_likenessesWithExternalIdentifier_completion_, 0, 1);

}

@end
