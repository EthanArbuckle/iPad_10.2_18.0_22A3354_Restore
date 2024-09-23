@implementation PHAWorker

+ (void)configureInterface:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
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
  void *v66;
  void *v67;
  void *v68;
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
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  _QWORD v90[4];
  _QWORD v91[5];
  _QWORD v92[2];
  _QWORD v93[3];
  _QWORD v94[3];
  _QWORD v95[4];
  uint64_t v96;
  _QWORD v97[3];

  v97[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = a3;
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_generateMemoriesWithOptions_context_reply_, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v97[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_generateMemoriesWithOptions_context_reply_, 0, 0);
  v8 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_generateSuggestionsWithOptions_context_reply_, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_generateSuggestionsWithOptions_context_reply_, 0, 0);
  v12 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestGenerateQuestionsWithOptions_context_reply_, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_requestGenerateQuestionsWithOptions_context_reply_, 0, 0);
  v15 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestSyndicationProcessingWithOptions_context_reply_, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_requestSyndicationProcessingWithOptions_context_reply_, 0, 0);
  v18 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestRevGeocodingSyndicationLibraryWithContext_reply_, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithSet:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_requestRevGeocodingSyndicationLibraryWithContext_reply_, 0, 0);
  v21 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestMusicCurationForAssetCollectionLocalIdentifier_options_context_reply_, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithSet:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_requestMusicCurationForAssetCollectionLocalIdentifier_options_context_reply_, 0, 0);
  v24 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestMusicCurationForAssetLocalIdentifiers_options_context_reply_, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithSet:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_requestMusicCurationForAssetLocalIdentifiers_options_context_reply_, 0, 0);
  v27 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestFlexMusicCurationForAssetCollectionLocalIdentifier_options_context_reply_, 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithSet:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_requestFlexMusicCurationForAssetCollectionLocalIdentifier_options_context_reply_, 0, 0);
  v30 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestFlexMusicCurationForAssetLocalIdentifiers_options_context_reply_, 0, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWithSet:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_requestFlexMusicCurationForAssetLocalIdentifiers_options_context_reply_, 0, 0);
  v33 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestSongsForAdamIDs_options_context_reply_, 0, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setWithSet:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_requestSongsForAdamIDs_options_context_reply_, 0, 0);
  v36 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestMusicCacheStatusWithContext_reply_, 0, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWithSet:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_requestMusicCacheStatusWithContext_reply_, 0, 0);
  v39 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestPrecachingOfAudioDataForAdamIDs_context_reply_, 0, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setWithSet:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_requestPrecachingOfAudioDataForAdamIDs_context_reply_, 0, 0);
  v42 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestMusicCurationDebugInformationForSongWithAdamID_context_reply_, 0, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setWithSet:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_requestMusicCurationDebugInformationForSongWithAdamID_context_reply_, 0, 0);
  v45 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_context_reply_, 0, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setWithSet:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_context_reply_, 0, 0);
  v48 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestFlexMusicCurationDebugInformationForSongWithUID_context_reply_, 0, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setWithSet:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_requestFlexMusicCurationDebugInformationForSongWithUID_context_reply_, 0, 0);
  v51 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_context_reply_, 0, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setWithSet:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_context_reply_, 0, 0);
  v54 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestClearMusicCacheWithOptions_context_reply_, 0, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setWithSet:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v56, sel_requestClearMusicCacheWithOptions_context_reply_, 0, 0);
  v95[0] = objc_opt_class();
  v95[1] = objc_opt_class();
  v95[2] = objc_opt_class();
  v95[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 4);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestAssetCollectionsRelatedToAssetWithLocalIdentifier_options_context_reply_, 1, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setWithSet:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v60, "addObjectsFromArray:", v57);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v60, sel_requestAssetCollectionsRelatedToAssetWithLocalIdentifier_options_context_reply_, 1, 0);
  v61 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestAssetCollectionsRelatedToMomentWithLocalIdentifier_options_context_reply_, 1, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setWithSet:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v63, "addObjectsFromArray:", v57);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v63, sel_requestAssetCollectionsRelatedToMomentWithLocalIdentifier_options_context_reply_, 1, 0);
  v64 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier_options_context_reply_, 1, 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setWithSet:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v66, "addObjectsFromArray:", v57);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v66, sel_requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier_options_context_reply_, 1, 0);
  v67 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestAssetCollectionsRelatedToPersonLocalIdentifiers_options_context_reply_, 1, 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setWithSet:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "addObjectsFromArray:", v57);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_requestAssetCollectionsRelatedToPersonLocalIdentifiers_options_context_reply_, 1, 0);
  v70 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestAvailableSuggestionTypeInfosWithOptions_context_reply_, 0, 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setWithSet:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v94[0] = objc_opt_class();
  v94[1] = objc_opt_class();
  v94[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 3);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "addObjectsFromArray:", v73);

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_requestAvailableSuggestionTypeInfosWithOptions_context_reply_, 0, 0);
  v74 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestSuggestionInfosWithOptions_context_reply_, 0, 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setWithSet:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v93[0] = objc_opt_class();
  v93[1] = objc_opt_class();
  v93[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 3);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObjectsFromArray:", v77);

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v76, sel_requestSuggestionInfosWithOptions_context_reply_, 0, 0);
  v78 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_reportMetricsWithOptions_context_reply_, 0, 0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setWithSet:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  v92[0] = objc_opt_class();
  v92[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "addObjectsFromArray:", v81);

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v80, sel_reportMetricsWithOptions_context_reply_, 0, 0);
  v82 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestRunPFLWithAttachments_recipeUserInfo_context_resultBlock_, 0, 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setWithSet:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  v91[0] = objc_opt_class();
  v91[1] = objc_opt_class();
  v91[2] = objc_opt_class();
  v91[3] = objc_opt_class();
  v91[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 5);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObjectsFromArray:", v85);

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_requestRunPFLWithAttachments_recipeUserInfo_context_resultBlock_, 0, 0);
  v86 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "classesForSelector:argumentIndex:ofReply:", sel_requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs_context_reply_, 0, 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setWithSet:", v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  v90[0] = objc_opt_class();
  v90[1] = objc_opt_class();
  v90[2] = objc_opt_class();
  v90[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 4);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "addObjectsFromArray:", v89);

  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v88, sel_requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs_context_reply_, 0, 0);
}

@end
