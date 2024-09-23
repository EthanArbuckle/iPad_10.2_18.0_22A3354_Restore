@implementation PDPeerPaymentServiceInterface

void __PDPeerPaymentServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2965C8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_187;
  _MergedGlobals_187 = v0;

  v2 = (void *)_MergedGlobals_187;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_cloudStoreStatusWithCompletion_, 0, 1);

  v4 = (void *)_MergedGlobals_187;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_peerPaymentPendingRequestsForRequestTokens_completion_, 0, 0);

  v8 = (void *)_MergedGlobals_187;
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_peerPaymentPendingRequestsForRequestTokens_completion_, 0, 1);

  v12 = (void *)_MergedGlobals_187;
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion_, 0, 1);

  v16 = (void *)_MergedGlobals_187;
  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_insertOrUpdatePeerPaymentPendingRequests_shouldScheduleNotifications_completion_, 0, 0);

  v20 = (void *)_MergedGlobals_187;
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_deletePeerPaymentPendingRequestsForRequestTokens_completion_, 0, 0);

  v24 = (void *)_MergedGlobals_187;
  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_recurringPaymentsWithCompletion_, 0, 1);

  v28 = (void *)_MergedGlobals_187;
  v29 = (void *)MEMORY[0x1E0C99E60];
  v30 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_updateRecurringPaymentsWithCompletion_, 0, 1);

  v32 = (void *)_MergedGlobals_187;
  v33 = (void *)MEMORY[0x1E0C99E60];
  v34 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_insertOrUpdateRecurringPayments_completion_, 0, 0);

  v36 = (void *)_MergedGlobals_187;
  v37 = (void *)MEMORY[0x1E0C99E60];
  v38 = objc_opt_class();
  objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_deleteRecurringPaymentsForIdentifiers_completion_, 0, 0);

  v40 = (void *)_MergedGlobals_187;
  v41 = (void *)MEMORY[0x1E0C99E60];
  v42 = objc_opt_class();
  objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_performRecurringPaymentAction_identifier_completion_, 0, 1);

  v44 = (void *)_MergedGlobals_187;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_updateRecurringPaymentMemo_identifier_completion_, 0, 0);

  v46 = (void *)_MergedGlobals_187;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_updateRecurringPaymentMemo_identifier_completion_, 0, 1);

  v48 = (void *)_MergedGlobals_187;
  v49 = (void *)MEMORY[0x1E0C99E60];
  v50 = objc_opt_class();
  objc_msgSend(v49, "setWithObjects:", v50, objc_opt_class(), 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_updateRecurringPaymentStatus_identifier_completion_, 0, 1);

  v52 = (void *)_MergedGlobals_187;
  v53 = (void *)MEMORY[0x1E0C99E60];
  v54 = objc_opt_class();
  objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setClasses:forSelector:argumentIndex:ofReply:", v55, sel_updateAutoReloadAmount_threshold_identifier_completion_, 0, 1);

  v56 = (void *)_MergedGlobals_187;
  v57 = (void *)MEMORY[0x1E0C99E60];
  v58 = objc_opt_class();
  objc_msgSend(v57, "setWithObjects:", v58, objc_opt_class(), 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_counterpartImageDataWithCompletion_, 0, 1);

  v60 = (void *)_MergedGlobals_187;
  v61 = (void *)MEMORY[0x1E0C99E60];
  v62 = objc_opt_class();
  v63 = objc_opt_class();
  objc_msgSend(v61, "setWithObjects:", v62, v63, objc_opt_class(), 0);
  v64 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setClasses:forSelector:argumentIndex:ofReply:", v64, sel_presentSenderFlowWithHost_userInfo_completion_, 1, 0);

}

@end
