@implementation SWTransparencyXPCInterface

+ (id)interface
{
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

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550DC2A8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_triggerMilestoneRefreshWithCompletion_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_triggerPublicKeybagRefreshWithCompletion_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_triggerConsistencyVerificationWithCompletion_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_verifyProofs_forObject_completion_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_verifyProofs_forObject_completion_, 1, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_sysdiagnoseInfoWithCompletion_, 1, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_postCFU_completion_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_clearAllCFUWithCompletion_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_waitStateMachineReadyWithCompletion_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_dailyWithCompletion_, 0, 1);

  return v2;
}

@end
