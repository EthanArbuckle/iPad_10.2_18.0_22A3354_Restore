@implementation WBSHistoryServiceDatabaseInterface

void __WBSHistoryServiceDatabaseInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
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
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[2];
  _QWORD v67[3];

  v67[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE719080);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WBSHistoryServiceDatabaseInterface_interface;
  WBSHistoryServiceDatabaseInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObject:", objc_opt_class());
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObject:", objc_opt_class());
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)WBSHistoryServiceDatabaseInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v63, sel_fetchWithOptions_predicate_completionHandler_, 1, 0);
  objc_msgSend((id)WBSHistoryServiceDatabaseInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v65, sel_fetchMetadataForKeys_completionHandler_, 0, 0);
  objc_msgSend((id)WBSHistoryServiceDatabaseInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v64, sel_fetchMetadataForKeys_completionHandler_, 0, 1);
  objc_msgSend((id)WBSHistoryServiceDatabaseInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_setMetadataValue_forKey_completionHandler_, 0, 0);
  v11 = (void *)WBSHistoryServiceDatabaseInterface_interface;
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchEventsForListener_completionHandler_, 0, 1);

  v15 = (void *)WBSHistoryServiceDatabaseInterface_interface;
  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_dispatchEvent_listenersToIgnore_persistForDelayedDispatching_completionHandler_, 1, 0);

  v19 = (void *)WBSHistoryServiceDatabaseInterface_interface;
  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_clearHistoryItems_afterDate_beforeDate_tombstoneMode_completionHandler_, 0, 0);

  v23 = (void *)WBSHistoryServiceDatabaseInterface_interface;
  v24 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_replayAndAddTombstones_completionHandler_, 0, 0);

  v27 = (void *)WBSHistoryServiceDatabaseInterface_interface;
  v28 = (void *)MEMORY[0x1E0C99E60];
  v29 = objc_opt_class();
  objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler_, 0, 1);

  v31 = (void *)WBSHistoryServiceDatabaseInterface_interface;
  v32 = (void *)MEMORY[0x1E0C99E60];
  v33 = objc_opt_class();
  objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_visitsAndTombstonesNeedingSyncWithVisitSyncWindow_completionHandler_, 1, 1);

  v35 = (void *)WBSHistoryServiceDatabaseInterface_interface;
  v36 = (void *)MEMORY[0x1E0C99E60];
  v37 = objc_opt_class();
  objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler_, 2, 0);

  v39 = (void *)WBSHistoryServiceDatabaseInterface_interface;
  v40 = (void *)MEMORY[0x1E0C99E60];
  v41 = objc_opt_class();
  objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler_, 3, 0);

  v43 = (void *)WBSHistoryServiceDatabaseInterface_interface;
  v44 = (void *)MEMORY[0x1E0C99E60];
  v45 = objc_opt_class();
  objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler_, 0, 1);

  v47 = (void *)WBSHistoryServiceDatabaseInterface_interface;
  v48 = (void *)MEMORY[0x1E0C99E60];
  v49 = objc_opt_class();
  objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_checkIfLocalVisitExistsForDatabaseIDs_withCompletion_, 0, 0);

  v51 = (void *)WBSHistoryServiceDatabaseInterface_interface;
  v52 = (void *)MEMORY[0x1E0C99E60];
  v53 = objc_opt_class();
  objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setClasses:forSelector:argumentIndex:ofReply:", v54, sel_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler_, 0, 1);

  v55 = (void *)WBSHistoryServiceDatabaseInterface_interface;
  v56 = (void *)MEMORY[0x1E0C99E60];
  v67[0] = objc_opt_class();
  v67[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setWithArray:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setClasses:forSelector:argumentIndex:ofReply:", v58, sel_getVisitedLinksWithCompletionHandler_, 0, 1);

  v59 = (void *)WBSHistoryServiceDatabaseInterface_interface;
  v60 = (void *)MEMORY[0x1E0C99E60];
  v66[0] = objc_opt_class();
  v66[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setWithArray:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_groupVisitsIntoSessionsBetweenStartDate_endDate_completionHandler_, 0, 1);

}

@end
