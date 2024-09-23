@implementation PKPaymentWebServiceProxyObjectInterface

void __PKPaymentWebServiceProxyObjectInterface_block_invoke()
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
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1E5C50);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_189;
  _MergedGlobals_189 = v0;

  v2 = (void *)_MergedGlobals_189;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_passesOfType_completion_, 0, 1);

  v6 = (void *)_MergedGlobals_189;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_cachedFeatureApplicationsForProvisioningWithCompletion_, 0, 1);

  v10 = (void *)_MergedGlobals_189;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_featureApplicationsForProvisioningWithCompletion_, 0, 1);

  v14 = (void *)_MergedGlobals_189;
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_updatedAccountsForProvisioningWithCompletion_, 0, 1);

  v18 = (void *)_MergedGlobals_189;
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_updatedAccountsForProvisioningWithCompletion_, 1, 1);

  v22 = (void *)_MergedGlobals_189;
  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_provisionHomeKeyPassForSerialNumbers_completionHandler_, 0, 1);

  v26 = (void *)_MergedGlobals_189;
  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_availableHomeKeyPassesWithCompletionHandler_, 0, 1);

  v30 = (void *)_MergedGlobals_189;
  v31 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_familyMembersWithCompletion_, 0, 1);

  v34 = (void *)_MergedGlobals_189;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_triggerCloudStoreZoneCreationForAccount_withCompletion_, 0, 0);

  objc_msgSend((id)_MergedGlobals_189, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_currentSecureElementSnapshot_, 0, 1);
  v36 = (void *)_MergedGlobals_189;
  v37 = (void *)MEMORY[0x1E0C99E60];
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  objc_msgSend(v37, "setWithObjects:", v38, v39, v40, v41, objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_reserveStorageForAppletTypes_metadata_completion_, 1, 0);

  v43 = (void *)_MergedGlobals_189;
  v44 = (void *)MEMORY[0x1E0C99E60];
  v45 = objc_opt_class();
  objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_reserveStorageForAppletTypes_metadata_completion_, 0, 1);

  v47 = (void *)_MergedGlobals_189;
  v48 = (void *)MEMORY[0x1E0C99E60];
  v49 = objc_opt_class();
  objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_deleteReservation_completion_, 0, 0);

  v51 = objc_alloc(MEMORY[0x1E0C99E60]);
  v52 = objc_opt_class();
  v53 = objc_opt_class();
  v54 = objc_opt_class();
  v55 = objc_opt_class();
  v56 = objc_opt_class();
  v57 = objc_opt_class();
  v58 = objc_opt_class();
  v59 = objc_opt_class();
  v73 = (id)objc_msgSend(v51, "initWithObjects:", v52, v53, v54, v55, v56, v57, v58, v59, objc_opt_class(), 0);
  objc_msgSend((id)_MergedGlobals_189, "setClasses:forSelector:argumentIndex:ofReply:", v73, sel_addPendingProvisionings_completion_, 0, 0);
  v60 = (void *)_MergedGlobals_189;
  v61 = (void *)MEMORY[0x1E0C99E60];
  v62 = objc_opt_class();
  v63 = objc_opt_class();
  v64 = objc_opt_class();
  objc_msgSend(v61, "setWithObjects:", v62, v63, v64, objc_opt_class(), 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setClasses:forSelector:argumentIndex:ofReply:", v65, sel_generateAuxiliaryCapabilitiesForRequirements_completion_, 0, 0);

  v66 = (void *)_MergedGlobals_189;
  v67 = (void *)MEMORY[0x1E0C99E60];
  v68 = objc_opt_class();
  v69 = objc_opt_class();
  v70 = objc_opt_class();
  v71 = objc_opt_class();
  objc_msgSend(v67, "setWithObjects:", v68, v69, v70, v71, objc_opt_class(), 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_generateAuxiliaryCapabilitiesForRequirements_completion_, 0, 1);

}

@end
