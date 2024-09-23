@implementation SESSessionManagerInterface

+ (id)interface
{
  if (interface_onceToken != -1)
    dispatch_once(&interface_onceToken, &__block_literal_global_0);
  return (id)interface_interface;
}

void __39__SESSessionManagerInterface_interface__block_invoke()
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545E0C30);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interface_interface;
  interface_interface = v0;

  v2 = (void *)interface_interface;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545DB838);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_startSESACWGSession_completion_, 0, 0);

  v4 = (void *)interface_interface;
  +[SESACWGSessionInterface interface](SESACWGSessionInterface, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_startSESACWGSession_completion_, 0, 1);

  v6 = (void *)interface_interface;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545DBD40);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_startSESDCKSession_completion_, 0, 0);

  v8 = (void *)interface_interface;
  +[SESDCKSessionInterface interface](SESDCKSessionInterface, "interface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_startSESDCKSession_completion_, 0, 1);

  v10 = (void *)interface_interface;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545DCA30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInterface:forSelector:argumentIndex:ofReply:", v11, sel_startSESRKESession_options_completion_, 0, 0);

  v12 = (void *)interface_interface;
  +[SESRKESessionInterface interface](SESRKESessionInterface, "interface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInterface:forSelector:argumentIndex:ofReply:", v13, sel_startSESRKESession_options_completion_, 0, 1);

  v14 = (void *)interface_interface;
  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_getVehicleReports_, 0, 1);

  v23 = (void *)interface_interface;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545D8980);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setInterface:forSelector:argumentIndex:ofReply:", v24, sel_startSESAssertion_withKeyIdentifier_withAppletIdentifier_withOptions_completion_, 0, 0);

  v25 = (void *)interface_interface;
  +[SESAssertionInterface interface](SESAssertionInterface, "interface");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setInterface:forSelector:argumentIndex:ofReply:", v26, sel_startSESAssertion_withKeyIdentifier_withAppletIdentifier_withOptions_completion_, 0, 1);

}

@end
