@implementation REMXPCDebugPerformerInterface

+ (id)interface
{
  if (interface_onceToken_4 != -1)
    dispatch_once(&interface_onceToken_4, &__block_literal_global_31);
  return (id)interface_result_3;
}

void __42__REMXPCDebugPerformerInterface_interface__block_invoke()
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF10E4C8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interface_result_3;
  interface_result_3 = v0;

  v2 = (void *)interface_result_3;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_validateHashtagLabelsWithoutHashtagWithRepair_completion_, 0, 1);

  v6 = (void *)interface_result_3;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_validateHashtagLabelsWithConcealedHashtagsWithRepair_completion_, 0, 1);

  v10 = (void *)interface_result_3;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_fetchAllSharedEntitySyncActivities_, 0, 1);

  v14 = (void *)interface_result_3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_addSharedEntitySyncActivityWithActivity_completion_, 0, 0);

  v16 = (void *)interface_result_3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_purgeCKRecordWithRecordType_identifier_completion_, 1, 0);

  v18 = (void *)interface_result_3;
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_fetchAllDueDateDeltaAlertsIncludingUnsupported_completion_, 0, 1);

}

@end
