@implementation PDPassLibraryExtendedInterface

void __PDPassLibraryExtendedInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
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
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  _QWORD v115[4];
  _QWORD v116[3];
  _QWORD v117[4];

  v117[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE296688);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF221A0;
  qword_1ECF221A0 = v0;

  _PDPassLibraryApplyBaseInterface((void *)qword_1ECF221A0);
  _PDPassLibraryApplyInAppInterface((void *)qword_1ECF221A0);
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  v9 = objc_opt_class();
  v114 = (void *)objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_usingSynchronousProxy_getPassesOfStyles_handler_, 0, 1);
  v10 = (void *)qword_1ECF221A0;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_usingSynchronousProxy_addUnsignedPassesWithDataFileDescriptors_completionHandler_, 1, 0);

  v14 = (void *)qword_1ECF221A0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_usingSynchronousProxy_replaceUnsignedPassWithDataFileDescriptor_completionHandler_, 1, 0);

  v16 = (void *)qword_1ECF221A0;
  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_usingSynchronousProxy_provisionHomeKeyPassForSerialNumbers_completionHandler_, 0, 1);

  v20 = (void *)qword_1ECF221A0;
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_usingSynchronousProxy_availableHomeKeyPassesWithCompletionHandler_, 0, 1);

  v24 = (void *)qword_1ECF221A0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_usingSynchronousProxy_fetchAppletSubCredentialForPassTypeIdentifier_serialNumber_completionHandler_, 0, 1);

  v26 = (void *)qword_1ECF221A0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_usingSynchronousProxy_canAddSecureElementPassWithConfiguration_completion_, 0, 1);

  v28 = (void *)qword_1ECF221A0;
  v29 = (void *)MEMORY[0x1E0C99E60];
  v30 = objc_opt_class();
  v31 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_usingSynchronousProxy_addISO18013Blobs_cardType_completion_, 1, 0);

  v33 = (void *)qword_1ECF221A0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_signData_signatureEntanglementMode_withCompletionHandler_, 1, 1);

  v35 = (void *)qword_1ECF221A0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_personalizePassWithUniqueIdentifier_contact_personalizationToken_requiredPersonalizationFields_personalizationSource_handler_, 1, 0);

  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_getPassesWithUniqueIdentifiers_handler_, 0, 1);
  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_unexpiredPassesOrderedByGroup_, 0, 1);
  v113 = (void *)v4;
  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_getPassesWithSearchableTransactions_, 0, 1);
  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_usingSynchronousProxy_getPassesAndCatalogOfPassTypes_limitResults_withHandler_, 0, 1);
  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_usingSynchronousProxy_getPassesAndCatalogOfPassTypes_limitResults_withHandler_, 0, 1);
  v37 = (void *)qword_1ECF221A0;
  v38 = objc_alloc(MEMORY[0x1E0C99E60]);
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  v42 = objc_opt_class();
  v43 = (void *)objc_msgSend(v38, "initWithObjects:", v39, v40, v41, v42, objc_opt_class(), 0);
  objc_msgSend(v37, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_usingSynchronousProxy_canAddCarKeyPassWithConfiguration_completion_, 1, 1);

  v44 = (void *)qword_1ECF221A0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_usingSynchronousProxy_getGroupsControllerSnapshotWithOptions_handler_, 1, 0);

  v46 = (void *)qword_1ECF221A0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_usingSynchronousProxy_getGroupsControllerSnapshotWithOptions_handler_, 0, 1);

  v48 = (void *)qword_1ECF221A0;
  v49 = (void *)MEMORY[0x1E0C99E60];
  v50 = objc_opt_class();
  objc_msgSend(v49, "setWithObjects:", v50, objc_opt_class(), 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_usingSynchronousProxy_getPaymentPassesPendingActivationWithHandler_, 0, 1);

  v110 = (void *)v7;
  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_enabledValueAddedServicePassesWithHandler_, 0, 1);
  v52 = (void *)qword_1ECF221A0;
  v53 = (void *)MEMORY[0x1E0C99E60];
  v54 = objc_opt_class();
  objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setClasses:forSelector:argumentIndex:ofReply:", v55, sel_pushProvisioningNoncesWithCredentialCount_completion_, 0, 1);

  v56 = (void *)qword_1ECF221A0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setClasses:forSelector:argumentIndex:ofReply:", v57, sel_pushProvisioningNoncesWithCredentialCount_completion_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v112, sel_usingSynchronousProxy_configurePushProvisioningConfiguration_completion_, 0, 0);
  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v112, sel_usingSynchronousProxy_configurePushProvisioningConfiguration_completion_, 0, 1);
  v58 = (void *)MEMORY[0x1E0C99E60];
  v59 = objc_opt_class();
  objc_msgSend(v58, "setWithObjects:", v59, objc_opt_class(), 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_usingSynchronousProxy_configurePushProvisioningConfigurationV2_completion_, 1, 0);
  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_usingSynchronousProxy_configurePushProvisioningConfigurationV2_completion_, 0, 1);
  v60 = (void *)qword_1ECF221A0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setClasses:forSelector:argumentIndex:ofReply:", v61, sel_defaultPaymentPassWithHandler_, 0, 1);

  v62 = (void *)qword_1ECF221A0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setClasses:forSelector:argumentIndex:ofReply:", v63, sel_expressTransitPassWithHandler_, 0, 1);

  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_sortedTransitPassesForAppletDataFormat_handler_, 0, 1);
  v64 = (void *)qword_1ECF221A0;
  v65 = (void *)MEMORY[0x1E0C99E60];
  v66 = objc_opt_class();
  v67 = objc_opt_class();
  v68 = objc_opt_class();
  objc_msgSend(v65, "setWithObjects:", v66, v67, v68, objc_opt_class(), 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_sortedTransitPassesForTransitNetworkIdentifiers_, 0, 1);

  v70 = (void *)qword_1ECF221A0;
  v71 = (void *)MEMORY[0x1E0C99E60];
  v117[0] = objc_opt_class();
  v117[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setWithArray:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setClasses:forSelector:argumentIndex:ofReply:", v73, sel_getDataForBundleResources_objectUniqueIdentifier_handler_, 0, 0);

  v74 = (void *)qword_1ECF221A0;
  v75 = (void *)MEMORY[0x1E0C99E60];
  v116[0] = objc_opt_class();
  v116[1] = objc_opt_class();
  v116[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 3);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setWithArray:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setClasses:forSelector:argumentIndex:ofReply:", v77, sel_getDataForBundleResources_objectUniqueIdentifier_handler_, 0, 1);

  v78 = (void *)MEMORY[0x1E0C99E60];
  v115[0] = objc_opt_class();
  v115[1] = objc_opt_class();
  v115[2] = objc_opt_class();
  v115[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setWithArray:", v79);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v109, sel_noteAppleAccountChanged_handler_, 0, 0);
  v80 = (void *)qword_1ECF221A0;
  v81 = (void *)MEMORY[0x1E0C99E60];
  v82 = objc_opt_class();
  objc_msgSend(v81, "setWithObjects:", v82, objc_opt_class(), 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setClasses:forSelector:argumentIndex:ofReply:", v83, sel_getPassUniqueIDsForAssociatedApplicationIdentifier_handler_, 0, 1);

  v84 = (void *)qword_1ECF221A0;
  v85 = (void *)MEMORY[0x1E0C99E60];
  v86 = objc_opt_class();
  objc_msgSend(v85, "setWithObjects:", v86, objc_opt_class(), 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setClasses:forSelector:argumentIndex:ofReply:", v87, sel_prepareForBackupRestoreWithRequiredFileURLs_destinationFileHandles_handler_, 0, 0);

  v88 = (void *)qword_1ECF221A0;
  v89 = (void *)MEMORY[0x1E0C99E60];
  v90 = objc_opt_class();
  objc_msgSend(v89, "setWithObjects:", v90, objc_opt_class(), 0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setClasses:forSelector:argumentIndex:ofReply:", v91, sel_prepareForBackupRestoreWithRequiredFileURLs_destinationFileHandles_handler_, 1, 0);

  v92 = (void *)qword_1ECF221A0;
  v93 = (void *)MEMORY[0x1E0C99E60];
  v94 = objc_opt_class();
  objc_msgSend(v93, "setWithObjects:", v94, objc_opt_class(), 0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setClasses:forSelector:argumentIndex:ofReply:", v95, sel_usingSynchronousProxy_addPassIngestionPayloads_withCompletionHandler_, 1, 0);

  v96 = (void *)qword_1ECF221A0;
  v97 = (void *)MEMORY[0x1E0C99E60];
  v98 = objc_opt_class();
  v99 = objc_opt_class();
  v100 = objc_opt_class();
  objc_msgSend(v97, "setWithObjects:", v98, v99, v100, objc_opt_class(), 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setClasses:forSelector:argumentIndex:ofReply:", v101, sel_usingSynchronousProxy_generateAuxiliaryCapabilitiesForRequirements_completion_, 1, 0);

  v102 = (void *)qword_1ECF221A0;
  v103 = (void *)MEMORY[0x1E0C99E60];
  v104 = objc_opt_class();
  v105 = objc_opt_class();
  v106 = objc_opt_class();
  v107 = objc_opt_class();
  objc_msgSend(v103, "setWithObjects:", v104, v105, v106, v107, objc_opt_class(), 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setClasses:forSelector:argumentIndex:ofReply:", v108, sel_usingSynchronousProxy_generateAuxiliaryCapabilitiesForRequirements_completion_, 0, 1);

  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v114, sel_usingSynchronousProxy_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion_, 0, 1);
  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v114, sel_usingSynchronousProxy_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion_, 1, 1);
  objc_msgSend((id)qword_1ECF221A0, "setClasses:forSelector:argumentIndex:ofReply:", v114, sel_usingSynchronousProxy_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion_, 2, 1);

}

@end
