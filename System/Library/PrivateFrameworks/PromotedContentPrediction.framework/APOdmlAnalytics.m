@implementation APOdmlAnalytics

+ (void)sendTimedEvent:(id)a3 statusSuccess:(BOOL)a4 additionalDetails:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  double v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint8_t buf[4];
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_eventName(a1, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v16, v20, (uint64_t)CFSTR("%@.%@"), CFSTR("com.apple.ap.SearchAdsODML"), v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0.0;
  if (v14)
  {
    if (v15)
    {
      objc_msgSend_timeIntervalSinceDate_(v15, v22, (uint64_t)v14);
      v24 = v25;
      if (v25 < 0.0)
      {
        OdmlLogForCategory(8uLL);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v43 = "+[APOdmlAnalytics sendTimedEvent:statusSuccess:additionalDetails:startDate:endDate:]";
          _os_log_impl(&dword_1B69D6000, v26, OS_LOG_TYPE_ERROR, "%s Start date is prior to end date", buf, 0xCu);
        }

      }
    }
  }
  objc_msgSend__versionAndIdentifiers(a1, v22, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v27, v28, (uint64_t)CFSTR("1"), CFSTR("statusCode"));
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v29, v30, v24);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v27, v32, (uint64_t)v31, CFSTR("processingTime"));

  if (v12)
  {
    if (!a4)
      objc_msgSend_setValue_forKey_(v27, v33, (uint64_t)CFSTR("2"), CFSTR("statusCode"));
    v35 = (void *)MEMORY[0x1E0CB3940];
    v36 = objc_msgSend_code(v12, v33, v34);
    objc_msgSend_stringWithFormat_(v35, v37, (uint64_t)CFSTR("%ld"), v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v27, v39, (uint64_t)v38, CFSTR("statusDetails"));

  }
  if (v13)
    objc_msgSend_addEntriesFromDictionary_(v27, v33, (uint64_t)v13);
  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v33, (uint64_t)v27);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__analyticsSendEvent_eventPayload_(a1, v41, (uint64_t)v21, v40);

}

+ (void)sendEvent:(id)a3 additionalDetails:(id)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  id v27;

  v27 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_eventName(a1, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v7, v11, (uint64_t)CFSTR("%@.%@"), CFSTR("com.apple.ap.SearchAdsODML"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__versionAndIdentifiers(a1, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    objc_msgSend_setValue_forKey_(v16, v15, (uint64_t)CFSTR("1"), CFSTR("statusCode"));
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend_setValue_forKey_(v16, v15, (uint64_t)CFSTR("2"), CFSTR("statusCode"));
  v17 = (void *)MEMORY[0x1E0CB3940];
  v20 = objc_msgSend_code(v27, v18, v19);
  objc_msgSend_stringWithFormat_(v17, v21, (uint64_t)CFSTR("%ld"), v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v16, v23, (uint64_t)v22, CFSTR("statusDetails"));

  if (v6)
LABEL_3:
    objc_msgSend_addEntriesFromDictionary_(v16, v24, (uint64_t)v6);
LABEL_4:
  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v24, (uint64_t)v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__analyticsSendEvent_eventPayload_(a1, v26, (uint64_t)v12, v25);

}

+ (id)_versionAndIdentifiers
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientWithIdentifier_(MEMORY[0x1E0DC09C8], v4, 238);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_experimentIdentifiersWithNamespaceName_(v5, v6, (uint64_t)CFSTR("AD_PLATFORMS_ODML"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("%d"), 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v3, v10, (uint64_t)v9, CFSTR("ODMLVersion"));

  objc_msgSend_treatmentId(v7, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v3, v14, (uint64_t)v13, CFSTR("trialTreatmentID"));

  objc_msgSend_experimentId(v7, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v3, v18, (uint64_t)v17, CFSTR("trialExperimentID"));

  v19 = (void *)MEMORY[0x1E0CB3940];
  v22 = objc_msgSend_deploymentId(v7, v20, v21);
  objc_msgSend_stringWithFormat_(v19, v23, (uint64_t)CFSTR("%d"), v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v3, v25, (uint64_t)v24, CFSTR("trialDeploymentID"));

  return v3;
}

+ (void)_analyticsSendEvent:(id)a3 eventPayload:(id)a4
{
  AnalyticsSendEvent();
}

+ (id)eventName
{
  return CFSTR("eventName");
}

@end
