@implementation WBSAuthenticationServicesAgentInterface

void __WBSAuthenticationServicesAgentInterface_block_invoke()
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
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEFEAD48);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WBSAuthenticationServicesAgentInterface_interface;
  WBSAuthenticationServicesAgentInterface_interface = v0;

  v2 = (void *)WBSAuthenticationServicesAgentInterface_interface;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getPasskeysForRunningAssertionWithApplicationIdentifier_withCompletionHandler_, 0, 1);

  v7 = (void *)WBSAuthenticationServicesAgentInterface_interface;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_getPasskeysForRunningAssertionWithWebFrameIdentifier_completionHandler_, 0, 1);

  v12 = (void *)WBSAuthenticationServicesAgentInterface_interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_userSelectedAutoFillNearbyDevice_completionHandler_, 0, 0);

}

@end
