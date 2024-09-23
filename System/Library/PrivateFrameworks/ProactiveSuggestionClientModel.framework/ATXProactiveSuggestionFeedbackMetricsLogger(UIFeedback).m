@implementation ATXProactiveSuggestionFeedbackMetricsLogger(UIFeedback)

- (void)logClientModelEngagementMetricForFeedbackResult:()UIFeedback .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "uiCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a2, "uiCache");
    a2 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v10 = 138412546;
  v11 = v6;
  v12 = 2112;
  v13 = v8;
  _os_log_fault_impl(&dword_1AA841000, a3, OS_LOG_TYPE_FAULT, "%@ Metrics - attempting to log metrics for invalid uicache class of %@", (uint8_t *)&v10, 0x16u);
  if (v7)
  {

  }
}

- (void)logClientModelEngagementMetricForFeedbackResult:()UIFeedback .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "layoutType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "consumerSubType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "clientModelId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a2, "engagementType");
  if ((v10 - 1) > 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E57CFA20[(int)v10 - 1];
  }
  v12 = objc_msgSend(a2, "numSuggestionsForClientModelInLayout");
  v13 = objc_msgSend(a2, "positionInClientModelCacheOfEngagedSuggestion");
  objc_msgSend(a2, "abGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "clientModelABGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138414338;
  v19 = v6;
  OUTLINED_FUNCTION_0_8();
  v20 = v16;
  v21 = v9;
  v22 = v16;
  v23 = v11;
  v24 = 1024;
  v25 = v12;
  v26 = 1024;
  v27 = v13;
  v28 = v16;
  v29 = v14;
  v30 = v16;
  v31 = v17;
  _os_log_debug_impl(&dword_1AA841000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingClientModelEngagementTracker with layoutType: %@ consumerSubType: %@, clientModelId: %@, and engagementType: %@ numSuggestionsForClientModelInLayout: %u positionInClientModelCacheOfEngagedSuggestion: %u abGroup: %@ clientModelABGroup: %@", buf, 0x54u);

}

- (void)logClientModelEngagementMetricForFeedbackResult:()UIFeedback .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1AA841000, a3, OS_LOG_TYPE_ERROR, "%@ Metrics - could not find ATXSuggestionLayout for widget id: %@", (uint8_t *)&v7, 0x16u);

}

- (void)logSessionEngagementMetricForFeedbackResult:()UIFeedback .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "consumerSubType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a2, "engagementType");
  if ((v8 - 1) > 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E57CFA60[(int)v8 - 1];
  }
  *(_DWORD *)buf = 138412802;
  v11 = v6;
  OUTLINED_FUNCTION_0_8();
  _os_log_debug_impl(&dword_1AA841000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingSessionEngagementTracker with consumerSubType: %@ and engagementType: %@", buf, 0x20u);

}

@end
