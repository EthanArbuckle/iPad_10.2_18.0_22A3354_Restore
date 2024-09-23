@implementation APOdmlAnalyticsModelTraining

+ (id)eventName
{
  return CFSTR("ModelTraining");
}

+ (void)sendEvent:(id)a3 additionalDetails:(id)a4 info:(id)a5 isCounterfactual:(BOOL)a6 numOfRows:(unint64_t)a7 normDelta:(double)a8
{
  _BOOL8 v10;
  id v14;
  void *v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  id v42;

  v10 = a6;
  v42 = a3;
  v14 = a4;
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = a5;
  objc_msgSend_stringWithFormat_(v15, v17, (uint64_t)CFSTR("%@.%@"), CFSTR("com.apple.ap.SearchAdsODML"), CFSTR("ModelTraining"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__versionAndIdentifiersFromRecordInfo_isCounterfactual_(a1, v19, (uint64_t)v16, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend_setValue_forKey_(v20, v21, (uint64_t)CFSTR("2"), CFSTR("statusCode"));
    v22 = (void *)MEMORY[0x1E0CB3940];
    v25 = objc_msgSend_code(v42, v23, v24);
    objc_msgSend_stringWithFormat_(v22, v26, (uint64_t)CFSTR("%ld"), v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v20, v28, (uint64_t)v27, CFSTR("statusDetails"));

    objc_msgSend_userInfo(v42, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)CFSTR("errorSource"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v20, v34, (uint64_t)v33, CFSTR("errorSource"));

  }
  else
  {
    objc_msgSend_setValue_forKey_(v20, v21, (uint64_t)CFSTR("1"), CFSTR("statusCode"));
  }
  if (a8 != 9.22337204e18)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v35, (uint64_t)CFSTR("%f"), *(_QWORD *)&a8);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v20, v37, (uint64_t)v36, CFSTR("normDelta"));

  }
  if (a7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v35, (uint64_t)CFSTR("%lu"), a7);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v20, v39, (uint64_t)v38, CFSTR("numTrainingRows"));

  }
  if (v14)
    objc_msgSend_addEntriesFromDictionary_(v20, v35, (uint64_t)v14);
  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v35, (uint64_t)v20);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__analyticsSendEvent_eventPayload_(a1, v41, (uint64_t)v18, v40);

}

+ (void)_analyticsSendEvent:(id)a3 eventPayload:(id)a4
{
  AnalyticsSendEvent();
}

+ (id)_versionAndIdentifiersFromRecordInfo:(id)a3 isCounterfactual:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  _BOOL8 v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;

  v4 = a4;
  v5 = a3;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v9, (uint64_t)CFSTR("%d"), 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v8, v11, (uint64_t)v10, CFSTR("ODMLVersion"));

  if (v5)
  {
    objc_msgSend_objectForKey_(v5, v12, (uint64_t)CFSTR("PlacementType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v4;
    v17 = objc_msgSend_unsignedIntegerValue(v13, v15, v16);
    objc_msgSend_keyForTypes_placementType_assetManagerType_(APOdmlPFLUtilities, v18, (uint64_t)CFSTR("TuriTrialTreatmentID"), v17, v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v5, v20, (uint64_t)v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setValue_forKey_(v8, v22, (uint64_t)v21, CFSTR("trialTreatmentID"));
    v25 = objc_msgSend_unsignedIntegerValue(v13, v23, v24);
    objc_msgSend_keyForTypes_placementType_assetManagerType_(APOdmlPFLUtilities, v26, (uint64_t)CFSTR("TuriTrialExperimentID"), v25, v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v5, v28, (uint64_t)v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setValue_forKey_(v8, v30, (uint64_t)v29, CFSTR("trialExperimentID"));
    v33 = objc_msgSend_unsignedIntegerValue(v13, v31, v32);
    objc_msgSend_keyForTypes_placementType_assetManagerType_(APOdmlPFLUtilities, v34, (uint64_t)CFSTR("TuriTrialDeploymentID"), v33, v14);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v5, v36, (uint64_t)v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringValue(v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v8, v41, (uint64_t)v40, CFSTR("trialDeploymentID"));

  }
  return v8;
}

@end
