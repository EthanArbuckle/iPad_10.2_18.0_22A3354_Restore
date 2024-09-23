@implementation PDPaymentServiceExtendedInterface

void __PDPaymentServiceExtendedInterface_block_invoke()
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
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  _QWORD v96[4];
  _QWORD v97[6];

  v97[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE296C28);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF22D18;
  qword_1ECF22D18 = v0;

  _ConfigurePDPaymentServiceInterface((void *)qword_1ECF22D18);
  v2 = (void *)qword_1ECF22D18;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_messagesForPaymentPassWithUniqueIdentifier_handler_, 0, 1);

  v6 = (void *)qword_1ECF22D18;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_handler_, 0, 1);

  v10 = (void *)qword_1ECF22D18;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_valueAddedServiceTransactionsForPaymentTransaction_handler_, 0, 1);

  v14 = (void *)qword_1ECF22D18;
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_balancesForPaymentPassWithUniqueIdentifier_handler_, 0, 1);

  v18 = (void *)qword_1ECF22D18;
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_plansForPaymentPassWithUniqueIdentifier_handler_, 0, 1);

  v23 = (void *)qword_1ECF22D18;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_displayTapToRadarAlertForRequest_completion_, 0, 0);

  v25 = (void *)qword_1ECF22D18;
  v26 = (void *)MEMORY[0x1E0C99E60];
  v27 = objc_opt_class();
  objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_familyMembersIgnoringCache_completion_, 0, 1);

  v29 = (void *)qword_1ECF22D18;
  v30 = (void *)MEMORY[0x1E0C99E60];
  v31 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_pendingFamilyMembersIgnoringCache_completion_, 0, 1);

  v33 = (void *)qword_1ECF22D18;
  v34 = (void *)MEMORY[0x1E0C99E60];
  v35 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_photosForFamilyMembersWithDSIDs_completion_, 0, 0);

  v37 = (void *)qword_1ECF22D18;
  v38 = (void *)MEMORY[0x1E0C99E60];
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  objc_msgSend(v38, "setWithObjects:", v39, v40, objc_opt_class(), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_photosForFamilyMembersWithDSIDs_completion_, 0, 1);

  v42 = (void *)qword_1ECF22D18;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_processTransitTransactionEventWithHistory_transactionDate_forPaymentApplication_withPassUniqueIdentifier_expressTransactionState_, 0, 0);

  v44 = (void *)qword_1ECF22D18;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_processTransitTransactionEventWithHistory_transactionDate_forPaymentApplication_withPassUniqueIdentifier_expressTransactionState_, 1, 0);

  v46 = (void *)qword_1ECF22D18;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_processTransitTransactionEventWithHistory_transactionDate_forPaymentApplication_withPassUniqueIdentifier_expressTransactionState_, 2, 0);

  v48 = (void *)qword_1ECF22D18;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setClasses:forSelector:argumentIndex:ofReply:", v49, sel_processTransitTransactionEventWithHistory_transactionDate_forPaymentApplication_withPassUniqueIdentifier_expressTransactionState_, 3, 0);

  v50 = (void *)qword_1ECF22D18;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_processTransitTransactionEventWithHistory_transactionDate_forPaymentApplication_withPassUniqueIdentifier_expressTransactionState_, 4, 0);

  v52 = (void *)qword_1ECF22D18;
  v53 = (void *)MEMORY[0x1E0C99E60];
  v54 = objc_opt_class();
  objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setClasses:forSelector:argumentIndex:ofReply:", v55, sel_allPaymentApplicationUsageSummariesWithCompletion_, 0, 1);

  v95 = objc_alloc(MEMORY[0x1E0C99E20]);
  v94 = objc_opt_class();
  v93 = objc_opt_class();
  v92 = objc_opt_class();
  v91 = objc_opt_class();
  v90 = objc_opt_class();
  v89 = objc_opt_class();
  v56 = objc_opt_class();
  v57 = objc_opt_class();
  v58 = objc_opt_class();
  v59 = objc_opt_class();
  v60 = objc_opt_class();
  v61 = objc_opt_class();
  v62 = objc_opt_class();
  v63 = objc_opt_class();
  v64 = objc_opt_class();
  v65 = objc_opt_class();
  v66 = (void *)objc_msgSend(v95, "initWithObjects:", v94, v93, v92, v91, v90, v89, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, objc_opt_class(),
                  0);
  v97[0] = objc_opt_class();
  v97[1] = objc_opt_class();
  v97[2] = objc_opt_class();
  v97[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addObjectsFromArray:", v67);

  objc_msgSend(v66, "addObject:", objc_opt_class());
  v96[0] = objc_opt_class();
  v96[1] = objc_opt_class();
  v96[2] = objc_opt_class();
  v96[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 4);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addObjectsFromArray:", v68);

  v69 = (void *)qword_1ECF22D18;
  v70 = (void *)objc_msgSend(v66, "copy");
  objc_msgSend(v69, "setClasses:forSelector:argumentIndex:ofReply:", v70, sel_simulateNotificationOfType_userInfo_handler_, 1, 0);

  v71 = (void *)qword_1ECF22D18;
  v72 = objc_alloc(MEMORY[0x1E0C99E60]);
  v73 = objc_opt_class();
  v74 = (void *)objc_msgSend(v72, "initWithObjects:", v73, objc_opt_class(), 0);
  objc_msgSend(v71, "setClasses:forSelector:argumentIndex:ofReply:", v74, sel_usingSynchronousProxy_applicationMessagesWithCompletion_, 0, 1);

  v75 = (void *)qword_1ECF22D18;
  v76 = objc_alloc(MEMORY[0x1E0C99E60]);
  v77 = objc_opt_class();
  v78 = (void *)objc_msgSend(v76, "initWithObjects:", v77, objc_opt_class(), 0);
  objc_msgSend(v75, "setClasses:forSelector:argumentIndex:ofReply:", v78, sel_usingSynchronousProxy_removeApplicationMessagesWithKeys_completion_, 1, 0);

  v79 = (void *)qword_1ECF22D18;
  v80 = objc_alloc(MEMORY[0x1E0C99E60]);
  v81 = objc_opt_class();
  v82 = (void *)objc_msgSend(v80, "initWithObjects:", v81, objc_opt_class(), 0);
  objc_msgSend(v79, "setClasses:forSelector:argumentIndex:ofReply:", v82, sel_usingSynchronousProxy_tilesForPassWithUniqueIdentifer_context_completion_, 0, 1);

  v83 = (void *)qword_1ECF22D18;
  v84 = objc_alloc(MEMORY[0x1E0C99E60]);
  v85 = objc_opt_class();
  v86 = (void *)objc_msgSend(v84, "initWithObjects:", v85, objc_opt_class(), 0);
  objc_msgSend(v83, "setClasses:forSelector:argumentIndex:ofReply:", v86, sel_issuerInstallmentTransactionsForPassUniqueID_completion_, 0, 1);

  v87 = (void *)qword_1ECF22D18;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setClasses:forSelector:argumentIndex:ofReply:", v88, sel_issuerInstallmentTransactionsForPassUniqueID_completion_, 1, 1);

}

@end
