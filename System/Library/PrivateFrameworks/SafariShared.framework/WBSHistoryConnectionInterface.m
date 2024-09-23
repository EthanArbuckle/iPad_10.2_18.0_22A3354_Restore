@implementation WBSHistoryConnectionInterface

void __WBSHistoryConnectionInterface_block_invoke()
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
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7172B8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WBSHistoryConnectionInterface_interface;
  WBSHistoryConnectionInterface_interface = v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE71C550);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v45[0] = objc_opt_class();
  v45[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v2;
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler_, 1, 1);

  objc_msgSend((id)WBSHistoryConnectionInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_beginURLCompletionSession_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE716FF8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_getHistoryItemsVisitedAfterDate_beforeDate_completionHandler_, 0, 1);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_getHistoryVisitsAfterDate_beforeDate_completionHandler_, 0, 1);

  objc_msgSend((id)WBSHistoryConnectionInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_beginHistoryAccessSession_, 0, 1);
  v16 = (void *)WBSHistoryConnectionInterface_interface;
  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, v19, v20, v21, v22, v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_connectWithOptions_delegate_completionHandler_, 0, 0);

  v25 = (void *)WBSHistoryConnectionInterface_interface;
  WBSHistoryServiceDatabaseDelegateInterface();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setInterface:forSelector:argumentIndex:ofReply:", v26, sel_connectWithOptions_delegate_completionHandler_, 1, 0);

  v27 = (void *)WBSHistoryConnectionInterface_interface;
  WBSHistoryServiceDatabaseInterface();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setInterface:forSelector:argumentIndex:ofReply:", v28, sel_connectWithOptions_delegate_completionHandler_, 0, 1);

  v29 = (void *)WBSHistoryConnectionInterface_interface;
  v30 = (void *)MEMORY[0x1E0C99E60];
  v31 = objc_opt_class();
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  v34 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, v32, v33, v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_connectWithOptions_delegate_completionHandler_, 3, 1);

  v36 = (void *)WBSHistoryConnectionInterface_interface;
  WBSCloudHistoryServiceInterface();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setInterface:forSelector:argumentIndex:ofReply:", v37, sel_initializeCloudHistoryWithConfiguration_completionHandler_, 0, 1);

  v38 = (void *)WBSHistoryConnectionInterface_interface;
  v39 = (void *)MEMORY[0x1E0C99E60];
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  objc_msgSend(v39, "setWithObjects:", v40, v41, objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_listDatabaseURLsWithCompletionHandler_, 0, 1);

}

@end
