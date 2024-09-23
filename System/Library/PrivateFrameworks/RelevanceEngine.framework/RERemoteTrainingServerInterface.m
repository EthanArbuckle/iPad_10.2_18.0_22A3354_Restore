@implementation RERemoteTrainingServerInterface

void __RERemoteTrainingServerInterface_block_invoke()
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
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BA4F88);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)RERemoteTrainingServerInterface_ServerInterface;
  RERemoteTrainingServerInterface_ServerInterface = v0;

  v2 = (void *)RERemoteTrainingServerInterface_ServerInterface;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_performTrainingWithElements_events_interactions_completion_, 0, 0);

  v6 = (void *)RERemoteTrainingServerInterface_ServerInterface;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_performTrainingWithElements_events_interactions_completion_, 1, 0);

  v10 = (void *)RERemoteTrainingServerInterface_ServerInterface;
  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_performTrainingWithElements_events_interactions_completion_, 2, 0);

  v14 = (void *)RERemoteTrainingServerInterface_ServerInterface;
  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_updateRemoteAttribute_forKey_completion_, 0, 0);

}

@end
