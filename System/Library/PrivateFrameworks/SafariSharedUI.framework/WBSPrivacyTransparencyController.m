@implementation WBSPrivacyTransparencyController

+ (BOOL)removeHostnames:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[3];
  _QWORD v35[3];
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (SymptomAnalyticsLibraryCore_once != -1)
    dispatch_once(&SymptomAnalyticsLibraryCore_once, &__block_literal_global_4_0);
  if (!SymptomAnalyticsLibraryCore_library)
    goto LABEL_24;
  if (SymptomPresentationFeedLibraryCore_once != -1)
    dispatch_once(&SymptomPresentationFeedLibraryCore_once, &__block_literal_global_6_0);
  if (!SymptomPresentationFeedLibraryCore_library)
    goto LABEL_24;
  if (SymptomPresentationLiteLibraryCore_once != -1)
    dispatch_once(&SymptomPresentationLiteLibraryCore_once, &__block_literal_global_8_0);
  if (!SymptomPresentationLiteLibraryCore_library)
    goto LABEL_24;
  if (!getAnalyticsWorkspaceClass())
    goto LABEL_24;
  if (!getUsageFeedClass())
    goto LABEL_24;
  getkSymptomAnalyticsServiceEndpoint();
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_24;
  v5 = (void *)v4;
  getkSymptomAnalyticsServiceDomainTrackingClearHistoryKey();
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_23;
  v7 = (void *)v6;
  getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDs();
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  v9 = (void *)v8;
  getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDate();
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    goto LABEL_22;
  }
  v11 = (void *)v10;
  getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDate();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc((Class)getAnalyticsWorkspaceClass());
    getkSymptomAnalyticsServiceEndpoint();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWorkspaceWithService:", v14);

    v31 = (void *)v15;
    v29 = (void *)objc_msgSend(objc_alloc((Class)getUsageFeedClass()), "initWithWorkspace:", v15);
    getkSymptomAnalyticsServiceDomainTrackingClearHistoryKey();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v30;
    getkSymptomAnalyticsServiceDomainTrackingClearHistoryBundleIDs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariApplicationPlatformBundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v17;
    v33 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v18;
    getkSymptomAnalyticsServiceDomainTrackingClearHistoryStartDate();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v20;
    getkSymptomAnalyticsServiceDomainTrackingClearHistoryEndDate();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v29, "performNetworkDomainsActionWithOptions:reply:", v24, &__block_literal_global_35);
    if ((v25 & 1) == 0)
    {
      v26 = WBS_LOG_CHANNEL_PREFIXPrivacyTransparency();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        +[WBSPrivacyTransparencyController removeHostnames:].cold.2(v26);
    }

    goto LABEL_27;
  }
LABEL_24:
  v27 = WBS_LOG_CHANNEL_PREFIXPrivacyTransparency();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    +[WBSPrivacyTransparencyController removeHostnames:].cold.1(v27);
  v25 = 0;
LABEL_27:

  return v25;
}

void __52__WBSPrivacyTransparencyController_removeHostnames___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXPrivacyTransparency();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__WBSPrivacyTransparencyController_removeHostnames___block_invoke_cold_1(v4, v3);
  }

}

+ (void)removeHostnames:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A840B000, log, OS_LOG_TYPE_FAULT, "Failed to load Symptom frameworks", v1, 2u);
}

+ (void)removeHostnames:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A840B000, log, OS_LOG_TYPE_ERROR, "Unable to perform network domains actions", v1, 2u);
}

void __52__WBSPrivacyTransparencyController_removeHostnames___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Error deleting network domain data %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
