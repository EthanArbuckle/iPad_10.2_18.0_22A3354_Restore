@implementation WPDXPCInterfaces

+ (id)serverInterface
{
  if (serverInterface_onceToken != -1)
    dispatch_once(&serverInterface_onceToken, &__block_literal_global_6);
  return (id)serverInterface_serverInterface;
}

void __35__WPDXPCInterfaces_serverInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254F00040);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serverInterface_serverInterface;
  serverInterface_serverInterface = v0;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  v5[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)serverInterface_serverInterface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_discoverCharacteristicsAndServices_forPeripheral_, 0, 0);
}

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1)
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_193_0);
  return (id)clientInterface_clientInterface;
}

void __35__WPDXPCInterfaces_clientInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254F06B10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface_clientInterface;
  clientInterface_clientInterface = v0;

}

@end
