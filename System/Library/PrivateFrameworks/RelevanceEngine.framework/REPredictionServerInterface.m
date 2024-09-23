@implementation REPredictionServerInterface

void __REPredictionServerInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BC0DE0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)REPredictionServerInterface_interface;
  REPredictionServerInterface_interface = v0;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)REPredictionServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_requestPredictedActionsWithCompletion_, 0, 1);
  v7 = (void *)REPredictionServerInterface_interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_fetchFirstPerformedActionDate_, 0, 1);

  v9 = (void *)REPredictionServerInterface_interface;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_fetchPerformedTodayCountForActionWithBundleIdentifer_actionIdentifier_completion_, 0, 0);

}

@end
