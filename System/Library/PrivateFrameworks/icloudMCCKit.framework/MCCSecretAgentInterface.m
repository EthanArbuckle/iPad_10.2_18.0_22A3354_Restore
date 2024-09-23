@implementation MCCSecretAgentInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken != -1)
    dispatch_once(&XPCInterface_onceToken, &__block_literal_global_1);
  return (id)XPCInterface_interface;
}

void __39__MCCSecretAgentInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2579AE270);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface;
  XPCInterface_interface = v0;

  v16 = (void *)MEMORY[0x24BDBCF20];
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v11 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v15, v14, v13, v12, v11, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_generateCertificateWithContext_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_listCertificatesWithCompletion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_listCertificatesForEmail_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_fetchSigningAndEncryptingStatusForEmailAddress_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_setSigningAndEncrytingStatusTo_forEmailAddress_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_setSignIsEnabled_forEmailAddress_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_setEncryptIsEnabled_forEmailAddress_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_updateCertificateDefaultsForEmailAddress_certInfo_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_refreshCertificateWithContext_certId_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_predictCommerceEmailWithContext_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_isModelReadyWithCompletion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_invokeModelDownloadWithCompletion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_syncToWeb_, 0, 0);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_registerCategoryRulesCallbackListener_completion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_sendPendingRulesWithCompletion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_createWebRule_completion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_getIABCategoryID_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_isPersonalDomain_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_getBlackPearlVersionWithCompletion_, 0, 1);

}

@end
