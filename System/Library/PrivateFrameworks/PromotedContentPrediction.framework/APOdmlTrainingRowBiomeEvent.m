@implementation APOdmlTrainingRowBiomeEvent

+ (void)eventWithRecordID:(id)a3 adamID:(id)a4 odmlResponse:(id)a5 appInstalled:(BOOL)a6 isDupe:(BOOL)a7 rerankingError:(id)a8
{
  const char *v8;
  __int16 v9;
  id v10;

  v9 = 0;
  objc_msgSend_makeEventWithRecordID_adamID_odmlResponse_appInstalled_isDupe_rerankingError_impressed_tapped_(APOdmlTrainingRowBiomeEvent, a2, (uint64_t)a3, a4, a5, a6, a7, a8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendEvent_(APOdmlTrainingRowBiomeEvent, v8, (uint64_t)v10);

}

+ (void)updateWithRecordID:(id)a3 adamID:(id)a4 event:(int64_t)a5
{
  const char *v5;
  __int16 v6;
  id v7;

  HIBYTE(v6) = a5 == 2;
  LOBYTE(v6) = a5 == 1;
  objc_msgSend_makeEventWithRecordID_adamID_odmlResponse_appInstalled_isDupe_rerankingError_impressed_tapped_(APOdmlTrainingRowBiomeEvent, a2, (uint64_t)a3, a4, 0, 0, 0, 0, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendEvent_(APOdmlTrainingRowBiomeEvent, v5, (uint64_t)v7);

}

+ (void)sendEvent:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  v3 = a3;
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_AdPlatforms(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ODML(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_TrainingRows(v10, v11, v12);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_source(v17, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendEvent_(v15, v16, (uint64_t)v3);

}

+ (void)removeAll
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;

  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_AdPlatforms(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ODML(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_TrainingRows(v8, v9, v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_pruner(v15, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteWithPolicy_eventsPassingTest_(v13, v14, (uint64_t)CFSTR("personalized-ads-on"), &unk_1E6A293C8);

}

+ (id)makeEventWithRecordID:(id)a3 adamID:(id)a4 odmlResponse:(id)a5 appInstalled:(BOOL)a6 isDupe:(BOOL)a7 rerankingError:(id)a8 impressed:(BOOL)a9 tapped:(BOOL)a10
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  APOdmlSettings *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  id v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  void *Vector_serverResponse_recordID;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;

  v11 = a7;
  v12 = a6;
  v62 = a3;
  v61 = a4;
  v15 = a8;
  v16 = a5;
  v17 = [APOdmlSettings alloc];
  v19 = (void *)objc_msgSend_initWithPlacementType_assetManagerType_(v17, v18, 0, 0);
  objc_msgSend_featureForKey_(APOdmlTrainingRowBiomeEvent, v20, (uint64_t)CFSTR("appUsageVector"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_featureForKey_(APOdmlTrainingRowBiomeEvent, v21, (uint64_t)CFSTR("installedAppVector"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_featureForKey_(APOdmlTrainingRowBiomeEvent, v22, (uint64_t)CFSTR("appDownloadVector"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_featureForKey_(APOdmlTrainingRowBiomeEvent, v23, (uint64_t)CFSTR("userQueryVector"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v24, (uint64_t)v16, 1, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc(MEMORY[0x1E0D01E78]);
  v26 = (void *)MEMORY[0x1E0CB3940];
  v29 = objc_msgSend_deploymentID(v19, v27, v28);
  objc_msgSend_stringWithFormat_(v26, v30, (uint64_t)CFSTR("%d"), v29);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_experimentID(v19, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_treatmentID(v19, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v37, a9);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v39, a10);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v41, v11);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v43, v12);
  v44 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v44;
  if (v15)
  {
    v48 = (void *)MEMORY[0x1E0CB37E8];
    v49 = objc_msgSend_code(v15, v45, v46);
    objc_msgSend_numberWithLong_(v48, v50, v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    Vector_serverResponse_recordID = (void *)objc_msgSend_initWithDeploymentID_experimentID_treatmentID_adamID_impressed_tapped_dupe_installed_errorCode_appUsageVector_appDownloadVector_installedAppVector_userQueryVector_serverResponse_recordID_(v25, v52, (uint64_t)v55, v33, v36, v61, v38, v40, v42, v47, v51, v60, v58, v59, v57, v56, v62);

  }
  else
  {
    Vector_serverResponse_recordID = (void *)objc_msgSend_initWithDeploymentID_experimentID_treatmentID_adamID_impressed_tapped_dupe_installed_errorCode_appUsageVector_appDownloadVector_installedAppVector_userQueryVector_serverResponse_recordID_(v25, v45, (uint64_t)v55, v33, v36, v61, v38, v40, v42, v44, 0, v60, v58, v59, v57, v56, v62);
  }

  return Vector_serverResponse_recordID;
}

+ (id)featureForKey:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetManagerForPlacementType_assetManagerType_(v6, v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_featureForName_(v8, v9, (uint64_t)v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_arrayOfNumbers(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
