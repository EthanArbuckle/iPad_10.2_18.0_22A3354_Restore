@implementation PDDiscoveryServiceInterface

void __PDDiscoveryServiceInterface_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  v11 = objc_alloc(MEMORY[0x1E0C99E60]);
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  v28[3] = objc_opt_class();
  v28[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2967A8);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)_MergedGlobals_217;
  _MergedGlobals_217 = v14;

  v16 = (void *)v2;
  objc_msgSend((id)_MergedGlobals_217, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_discoveryArticleLayoutsWithCompletion_, 0, 1);
  v17 = (void *)_MergedGlobals_217;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_discoveryArticleLayoutForItemWithIdentifier_completion_, 0, 1);

  v19 = (void *)_MergedGlobals_217;
  v20 = objc_alloc(MEMORY[0x1E0C99E60]);
  v21 = objc_opt_class();
  v22 = (void *)objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
  objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_dialogRequestsForPlacement_completion_, 0, 1);

  v23 = (void *)_MergedGlobals_217;
  v24 = objc_alloc(MEMORY[0x1E0C99E60]);
  v25 = objc_opt_class();
  v26 = (void *)objc_msgSend(v24, "initWithObjects:", v25, objc_opt_class(), 0);
  objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_dismissedDiscoveryItems_, 0, 1);

  objc_msgSend((id)_MergedGlobals_217, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_discoveryItemsWithCompletion_, 0, 1);
  objc_msgSend((id)_MergedGlobals_217, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_insertDiscoveryItems_discoveryArticleLayouts_completion_, 0, 0);
  objc_msgSend((id)_MergedGlobals_217, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_insertDiscoveryItems_discoveryArticleLayouts_completion_, 1, 0);
  objc_msgSend((id)_MergedGlobals_217, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_discoveryEngagementMessagesForPassUniqueIdentifier_active_completion_, 0, 1);
  objc_msgSend((id)_MergedGlobals_217, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_insertDiscoveryEngagementMessages_completion_, 0, 0);
  objc_msgSend((id)_MergedGlobals_217, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_rulesWithCompletion_, 0, 1);
  objc_msgSend((id)_MergedGlobals_217, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_insertRule_completion_, 0, 0);
  objc_msgSend((id)_MergedGlobals_217, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_fetchUserProperties_withParameters_completion_, 0, 1);

}

@end
