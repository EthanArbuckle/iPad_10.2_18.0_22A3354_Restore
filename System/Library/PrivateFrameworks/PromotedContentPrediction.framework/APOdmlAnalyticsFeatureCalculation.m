@implementation APOdmlAnalyticsFeatureCalculation

+ (id)eventName
{
  return CFSTR("FeatureCalculation");
}

+ (void)sendEvent:(id)a3 additionalDetails:(id)a4 isCounterfactual:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  __CFString **v19;
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
  void *v30;
  const char *v31;
  id v32;

  v5 = a5;
  v32 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_eventName(a1, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v9, v13, (uint64_t)CFSTR("%@.%@"), CFSTR("com.apple.ap.SearchAdsODML"), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = kAPOdmlSearchResultsCounterfactualNamespace;
  if (!v5)
    v19 = kAPOdmlSearchResultsRuntimeNamespace;
  objc_msgSend__versionAndIdentifiersForNamespace_(a1, v17, (uint64_t)*v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    objc_msgSend_setValue_forKey_(v20, v21, (uint64_t)CFSTR("1"), CFSTR("statusCode"));
    if (!v8)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend_setValue_forKey_(v20, v21, (uint64_t)CFSTR("2"), CFSTR("statusCode"));
  v22 = (void *)MEMORY[0x1E0CB3940];
  v25 = objc_msgSend_code(v32, v23, v24);
  objc_msgSend_stringWithFormat_(v22, v26, (uint64_t)CFSTR("%ld"), v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v20, v28, (uint64_t)v27, CFSTR("statusDetails"));

  if (v8)
LABEL_5:
    objc_msgSend_addEntriesFromDictionary_(v20, v29, (uint64_t)v8);
LABEL_6:
  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v29, (uint64_t)v20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__analyticsSendEvent_eventPayload_(a1, v31, (uint64_t)v14, v30);

}

+ (void)_analyticsSendEvent:(id)a3 eventPayload:(id)a4
{
  AnalyticsSendEvent();
}

+ (id)_versionAndIdentifiersForNamespace:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend_dictionary(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientWithIdentifier_(MEMORY[0x1E0DC09C8], v8, 238);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_experimentIdentifiersWithNamespaceName_(v9, v10, (uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("%d"), 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v7, v14, (uint64_t)v13, CFSTR("ODMLVersion"));

  objc_msgSend_treatmentId(v11, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v7, v18, (uint64_t)v17, CFSTR("trialTreatmentID"));

  objc_msgSend_experimentId(v11, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v7, v22, (uint64_t)v21, CFSTR("trialExperimentID"));

  v23 = (void *)MEMORY[0x1E0CB3940];
  v26 = objc_msgSend_deploymentId(v11, v24, v25);
  objc_msgSend_stringWithFormat_(v23, v27, (uint64_t)CFSTR("%d"), v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v7, v29, (uint64_t)v28, CFSTR("trialDeploymentID"));

  return v7;
}

@end
