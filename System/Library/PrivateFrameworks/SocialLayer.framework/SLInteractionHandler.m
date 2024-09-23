@implementation SLInteractionHandler

- (SLInteractionHandler)initWithAppIdentifier:(id)a3
{
  id v5;
  SLInteractionHandler *v6;
  NSObject *v7;
  NSObject *v9;
  uint64_t v10;
  NSObject *appIdentifier;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SLInteractionHandler;
  v6 = -[SLInteractionHandler init](&v12, sel_init);
  if (v6)
  {
    if (objc_msgSend(v5, "length"))
      objc_storeStrong((id *)&v6->_appIdentifier, a3);
    if ((SLIsRunningInDaemon() & 1) != 0
      || (SLIsRunningInSLTester() & 1) != 0
      || (SLIsRunningInGelatoTester() & 1) != 0
      || objc_msgSend(v5, "length"))
    {
      SLDaemonLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[SLInteractionHandler initWithAppIdentifier:].cold.1((uint64_t)v6, v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
      v9 = objc_claimAutoreleasedReturnValue();
      v7 = v9;
      if (v9)
      {
        -[NSObject applicationIdentifier](v9, "applicationIdentifier");
        v10 = objc_claimAutoreleasedReturnValue();
        appIdentifier = v6->_appIdentifier;
        v6->_appIdentifier = (NSString *)v10;
      }
      else
      {
        SLFrameworkLogHandle();
        appIdentifier = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(appIdentifier, OS_LOG_TYPE_ERROR))
          -[SLInteractionHandler initWithAppIdentifier:].cold.2(appIdentifier);
      }

    }
  }

  return v6;
}

- (id)fetchInteractionsWithLimit:(unint64_t)a3 variant:(id)a4 error:(id *)a5
{
  return -[SLInteractionHandler fetchInteractionsWithLimit:reason:variant:error:](self, "fetchInteractionsWithLimit:reason:variant:error:", a3, 0, a4, a5);
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (SLInteractionHandler)init
{
  return -[SLInteractionHandler initWithAppIdentifier:](self, "initWithAppIdentifier:", &stru_1E3797070);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SLInteractionHandler;
  -[SLInteractionHandler dealloc](&v2, sel_dealloc);
}

- (id)fetchInteractionsWithLimit:(unint64_t)a3 reason:(id)a4 variant:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  NSString *appIdentifier;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  NSString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  SLFrameworkLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    appIdentifier = self->_appIdentifier;
    *(_DWORD *)buf = 134218242;
    v25 = a3;
    v26 = 2112;
    v27 = appIdentifier;
    _os_log_impl(&dword_199EFF000, v12, OS_LOG_TYPE_INFO, "Fetching %lu interactions for application Identifier: %@", buf, 0x16u);
  }

  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  if (self->_appIdentifier)
    v16 = (const __CFString *)self->_appIdentifier;
  else
    v16 = &stru_1E3797070;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72__SLInteractionHandler_fetchInteractionsWithLimit_reason_variant_error___block_invoke;
  v22[3] = &unk_1E3795C20;
  v17 = v14;
  v23 = v17;
  objc_msgSend(v15, "iterRankedHighlightsWithLimit:client:variant:reason:error:block:", a3, v16, v10, v11, a6, v22);

  SLFrameworkLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134217984;
    v25 = v19;
    _os_log_impl(&dword_199EFF000, v18, OS_LOG_TYPE_INFO, "Obtained %lu results from PersonalizationPortrait", buf, 0xCu);
  }

  if (!objc_msgSend(v17, "count"))
  {
    SLFrameworkLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SLInteractionHandler fetchInteractionsWithLimit:reason:variant:error:].cold.1(a6);

  }
  return v17;
}

void __72__SLInteractionHandler_fetchInteractionsWithLimit_reason_variant_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SLCollaborationHighlight *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;

  v3 = a2;
  NSClassFromString(CFSTR("PPSocialCollaboration"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 0;
    v4 = -[SLCollaborationHighlight initWithPortraitCollaborationHighlight:error:]([SLCollaborationHighlight alloc], "initWithPortraitCollaborationHighlight:error:", v3, &v8);
    v5 = v8;
    if (!v4)
    {
      SLFrameworkLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __72__SLInteractionHandler_fetchInteractionsWithLimit_reason_variant_error___block_invoke_cold_1(v5);
LABEL_9:

      goto LABEL_10;
    }
  }
  else
  {
    v7 = 0;
    v4 = -[SLHighlight initWithPortraitHighlight:error:]([SLHighlight alloc], "initWithPortraitHighlight:error:", v3, &v7);
    v5 = v7;
    if (!v4)
    {
      SLFrameworkLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __72__SLInteractionHandler_fetchInteractionsWithLimit_reason_variant_error___block_invoke_cold_2(v5);
      goto LABEL_9;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
LABEL_10:

}

- (id)fetchAttributionForAttributionIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  SLAttribution *v8;
  id v9;
  NSObject *v10;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  SLFrameworkLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_INFO, "Fetching Attribution info for Attribution with Identifier %@ ", buf, 0xCu);
  }

  v5 = (void *)objc_opt_new();
  v13 = 0;
  objc_msgSend(v5, "attributionForIdentifier:error:", v3, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (!v6)
  {
    SLFrameworkLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SLInteractionHandler fetchAttributionForAttributionIdentifier:].cold.1(v7);
    goto LABEL_10;
  }
  v12 = v7;
  v8 = -[SLAttribution initWithPortraitAttribution:error:]([SLAttribution alloc], "initWithPortraitAttribution:error:", v6, &v12);
  v9 = v12;

  if (!v8)
  {
    SLFrameworkLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SLInteractionHandler fetchAttributionForAttributionIdentifier:].cold.2(v9, v10);
    v7 = v9;
LABEL_10:

    v8 = 0;
    v9 = v7;
  }

  return v8;
}

- (void)feedbackForHighlightIdentifier:(id)a3 withType:(unint64_t)a4 variant:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSString *appIdentifier;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  SLFrameworkLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    appIdentifier = self->_appIdentifier;
    v16 = 138413058;
    v17 = v10;
    v18 = 2048;
    v19 = a4;
    v20 = 2112;
    v21 = appIdentifier;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_199EFF000, v13, OS_LOG_TYPE_INFO, "Feedback for highlight with identifier %@ of type %lu for application identifier: %@ variant: %@", (uint8_t *)&v16, 0x2Au);
  }

  if (a4 - 1 >= 6)
    a4 = 0;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "feedbackForHighlightIdentifier:type:client:variant:completion:", v10, a4, self->_appIdentifier, v11, v12);

}

- (void)setAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

- (void)initWithAppIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 8);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_199EFF000, a2, OS_LOG_TYPE_DEBUG, "SLInteractionHandler init from daemon with app ID: %@", (uint8_t *)&v3, 0xCu);
}

- (void)initWithAppIdentifier:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_199EFF000, log, OS_LOG_TYPE_ERROR, "SLInteractionHandler failed to generate a bundle record for the current process.", v1, 2u);
}

- (void)fetchInteractionsWithLimit:(id *)a1 reason:variant:error:.cold.1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_199EFF000, v2, v3, "Failed to get any results from PersonalizationPortrait. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

void __72__SLInteractionHandler_fetchInteractionsWithLimit_reason_variant_error___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_199EFF000, v2, v3, "Failed to initialize SLCollaborationHighlight due to. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

void __72__SLInteractionHandler_fetchInteractionsWithLimit_reason_variant_error___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_199EFF000, v2, v3, "Failed to initialize SLHighlight due to. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)fetchAttributionForAttributionIdentifier:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_199EFF000, v2, v3, "Failed to get a result from PersonalizationPortrait. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)fetchAttributionForAttributionIdentifier:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedFailureReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "Failed to get a create SLAttribution from PPSocialAttribution. Localized description: %@. Localized failure reason: %@", (uint8_t *)&v6, 0x16u);

}

@end
