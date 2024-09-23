@implementation RMStoreXPCProxy

+ (id)newConnectionWithScope:(int64_t)a3
{
  if (a3 == 1)
    return +[RMStoreXPCProxy newDaemonConnection](RMStoreXPCProxy, "newDaemonConnection");
  else
    return +[RMStoreXPCProxy newAgentConnection](RMStoreXPCProxy, "newAgentConnection");
}

+ (id)newAgentConnection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.RemoteManagementAgent.store"), 0);
  v4 = (void *)objc_msgSend(a1, "newInterface");
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  return v3;
}

+ (id)newDaemonConnection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.remotemanagementd.store"), 4096);
  v4 = (void *)objc_msgSend(a1, "newInterface");
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  return v3;
}

+ (id)newConnectionWithListenerEndpoint:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BDD1988];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithListenerEndpoint:", v5);

  v7 = (void *)objc_msgSend(a1, "newInterface");
  objc_msgSend(v6, "setRemoteObjectInterface:", v7);

  return v6;
}

+ (id)newInterface
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[2];
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_257455618);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_observerStoresWithCompletionHandler_, 0, 1);

  v56 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_declarationsForStoreIdentifier_completionHandler_, 0, 1);

  v55 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_declarationsWithTypes_storeIdentifier_completionHandler_, 0, 1);

  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_declarationManifestForStoreIdentifier_completionHandler_, 0, 1);

  v53 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_configurationUIsForStoreIdentifier_completionHandler_, 0, 1);

  v52 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_displayableProfileConfigurationsForStoreIdentifier_completionHandler_, 0, 1);

  v51 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_providerStoresWithCompletionHandler_, 0, 1);

  v50 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_subscriberStoresWithCompletionHandler_, 0, 1);

  v49 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_subscribedStoreDeclarationsWithTypes_completionHandler_, 0, 1);

  v48 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_subscribedStoreDeclarationsWithTypes_completionHandler_, 1, 1);

  v47 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_subscribedDeclarationsWithTypes_storeIdentifier_completionHandler_, 0, 1);

  v46 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_subscribedStoreConfigurationsVisibleUIWithTypes_completionHandler_, 0, 1);

  v45 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_subscribedStoreConfigurationsVisibleUIWithTypes_completionHandler_, 1, 1);

  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_writeStatusWithStoreIdentifier_declarationType_declarationIdentifier_declarationServerToken_sourceIdentifier_validity_reasons_completionHandler_, 6, 0);

  v43 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_publishStatusWithStoreIdentifier_status_completionHandler_, 1, 0);

  v42 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel_certificateStatusWithStoreIdentifier_completionHandler_, 0, 1);

  return v8;
}

@end
