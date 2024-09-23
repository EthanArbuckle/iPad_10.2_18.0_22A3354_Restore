@implementation PDSXPCInterface

+ (id)handShakeInterfaceFromVendor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "interfaceWithProtocol:", &unk_254B9EC30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_standardInterfaceFromVendor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:forSelector:argumentIndex:ofReply:", v6, sel_connectWithClientID_completion_, 0, 1);

  objc_msgSend(a1, "_internalInterfaceFromVendor:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_connectInternalWithCompletion_, 0, 1);
  return v5;
}

+ (id)_internalInterfaceFromVendor:(id)a3
{
  return (id)objc_msgSend(a3, "interfaceWithProtocol:", &unk_254B9ECF0);
}

+ (id)_standardInterfaceFromVendor:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;

  objc_msgSend(a3, "interfaceWithProtocol:", &unk_254B9EC90);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_activeUsersWithClientID_withCompletion_, 0, 1);

  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_usersWithClientID_withCompletion_, 0, 1);

  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_entriesForUser_clientID_withCompletion_, 0, 1);

  v13 = (void *)MEMORY[0x24BDBCF20];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_entriesForClientID_withCompletion_, 0, 1);

  v16 = (void *)MEMORY[0x24BDBCF20];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_storeEntries_deleteEntries_withCompletion_, 0, 0);

  v19 = (void *)MEMORY[0x24BDBCF20];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_storeEntries_deleteEntries_withCompletion_, 1, 0);

  v22 = (void *)MEMORY[0x24BDBCF20];
  v23 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_batchUpdateEntries_forClientID_withCompletion_, 0, 0);

  return v3;
}

@end
