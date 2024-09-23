@implementation WBSFormAutoFillParsecFeedbackProcessor

- (WBSFormAutoFillParsecFeedbackProcessor)init
{

  return 0;
}

- (WBSFormAutoFillParsecFeedbackProcessor)initWithGlobalFeedbackDispatcher:(id)a3 domainPolicyProvider:(id)a4 autoFillVersion:(unint64_t)a5
{
  id v9;
  id v10;
  WBSFormAutoFillParsecFeedbackProcessor *v11;
  WBSFormAutoFillParsecFeedbackProcessor *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *internalQueue;
  WBSFormAutoFillParsecFeedbackProcessor *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBSFormAutoFillParsecFeedbackProcessor;
  v11 = -[WBSFormAutoFillParsecFeedbackProcessor init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_globalFeedbackDispatcher, a3);
    v12->_autoFillVersion = a5;
    objc_storeStrong((id *)&v12->_domainPolicyProvider, a4);
    v13 = dispatch_queue_create("com.apple.SafariShared.WBSFormAutoFillParsecFeedbackProcessor", 0);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v13;

    v15 = v12;
  }

  return v12;
}

- (void)sendFeedbackWithCorrectionSet:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  WBSFormAutoFillParsecFeedbackProcessor *v9;
  int64_t v10;

  v4 = a3;
  v5 = +[WBSCompletionQuery currentQueryID](WBSCompletionQuery, "currentQueryID");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__WBSFormAutoFillParsecFeedbackProcessor_sendFeedbackWithCorrectionSet___block_invoke;
  v7[3] = &unk_1E4B39610;
  v6 = v4;
  v8 = v6;
  v9 = self;
  v10 = v5;
  -[WBSFormAutoFillParsecFeedbackProcessor _getFeedbackWithCorrectionSet:completionHandler:](self, "_getFeedbackWithCorrectionSet:completionHandler:", v6, v7);

}

void __72__WBSFormAutoFillParsecFeedbackProcessor_sendFeedbackWithCorrectionSet___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  uint64_t v11;
  uint8_t buf[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__WBSFormAutoFillParsecFeedbackProcessor_sendFeedbackWithCorrectionSet___block_invoke_1;
    block[3] = &unk_1E4B2B128;
    block[4] = a1[5];
    v4 = v3;
    v5 = a1[6];
    v10 = v4;
    v11 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (void *)a1[4];
      objc_msgSend(v7, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __72__WBSFormAutoFillParsecFeedbackProcessor_sendFeedbackWithCorrectionSet___block_invoke_cold_1((uint64_t)v7, v8, buf, v6);
    }

  }
}

uint64_t __72__WBSFormAutoFillParsecFeedbackProcessor_sendFeedbackWithCorrectionSet___block_invoke_1(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "sendCrowdsourcedAutoFillFeedback:forQueryID:", a1[5], a1[6]);
}

- (void)_getFeedbackWithCorrectionSet:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  WBSFormAutoFillFeedbackDomainPolicyProvider *domainPolicyProvider;
  NSObject *internalQueue;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_domainPolicyProvider)
  {
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    domainPolicyProvider = self->_domainPolicyProvider;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __90__WBSFormAutoFillParsecFeedbackProcessor__getFeedbackWithCorrectionSet_completionHandler___block_invoke_2;
    v12[3] = &unk_1E4B39660;
    v14 = v8;
    v12[4] = self;
    v13 = v6;
    -[WBSFormAutoFillFeedbackDomainPolicyProvider autoFillFeedbackProcessor:determineWhetherToSendFeedbackForDomain:resultHandler:](domainPolicyProvider, "autoFillFeedbackProcessor:determineWhetherToSendFeedbackForDomain:resultHandler:", self, v9, v12);

  }
  else
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__WBSFormAutoFillParsecFeedbackProcessor__getFeedbackWithCorrectionSet_completionHandler___block_invoke;
    block[3] = &unk_1E4B2AFC0;
    v17 = v7;
    block[4] = self;
    v16 = v6;
    dispatch_async(internalQueue, block);

    v9 = v17;
  }

}

void __90__WBSFormAutoFillParsecFeedbackProcessor__getFeedbackWithCorrectionSet_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_feedbackWithCorrectionSet:includeOrigin:", *(_QWORD *)(a1 + 40), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __90__WBSFormAutoFillParsecFeedbackProcessor__getFeedbackWithCorrectionSet_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  BOOL v11;

  if (a2)
  {
    v3 = a2 == 1;
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __90__WBSFormAutoFillParsecFeedbackProcessor__getFeedbackWithCorrectionSet_completionHandler___block_invoke_3;
    v8[3] = &unk_1E4B39638;
    v5 = *(id *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v10 = v5;
    v8[4] = v6;
    v9 = v7;
    v11 = v3;
    dispatch_async(v4, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __90__WBSFormAutoFillParsecFeedbackProcessor__getFeedbackWithCorrectionSet_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_feedbackWithCorrectionSet:includeOrigin:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (id)_feedbackWithCorrectionSet:(id)a3 includeOrigin:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  WBSCrowdsourcedFeedbackDomainNormalizer *domainNormalizer;
  WBSCrowdsourcedFeedbackDomainNormalizer *v14;
  WBSCrowdsourcedFeedbackDomainNormalizer *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  _BOOL4 v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "fingerprintsToCorrections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("autofill"), CFSTR("type"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_autoFillVersion);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("version"));

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __83__WBSFormAutoFillParsecFeedbackProcessor__feedbackWithCorrectionSet_includeOrigin___block_invoke;
      v35[3] = &unk_1E4B39688;
      v12 = v11;
      v36 = v12;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v35);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("correctionsForOrigin"));
      if (v4)
      {
        domainNormalizer = self->_domainNormalizer;
        if (!domainNormalizer)
        {
          v14 = objc_alloc_init(WBSCrowdsourcedFeedbackDomainNormalizer);
          v15 = self->_domainNormalizer;
          self->_domainNormalizer = v14;

          domainNormalizer = self->_domainNormalizer;
        }
        -[WBSCrowdsourcedFeedbackDomainNormalizer transformedValue:](domainNormalizer, "transformedValue:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("origin"));

      }
      v17 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v38 = v7;
        v39 = 2112;
        v40 = v12;
        v41 = 1024;
        v42 = v4;
        _os_log_debug_impl(&dword_1A3D90000, v17, OS_LOG_TYPE_DEBUG, "Generating AutoFill feedback for %@: %@; submitting origin: %d",
          buf,
          0x1Cu);
      }

    }
    else
    {
      v26 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[WBSFormAutoFillParsecFeedbackProcessor _feedbackWithCorrectionSet:includeOrigin:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);
      v9 = 0;
    }

  }
  else
  {
    v18 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[WBSFormAutoFillParsecFeedbackProcessor _feedbackWithCorrectionSet:includeOrigin:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    v9 = 0;
  }

  return v9;
}

void __83__WBSFormAutoFillParsecFeedbackProcessor__feedbackWithCorrectionSet_includeOrigin___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("fingerprint"));
  v7 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 == 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("correct"));

  if (v7)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("corrections"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (WBSFormAutoFillFeedbackDomainPolicyProvider)domainPolicyProvider
{
  return self->_domainPolicyProvider;
}

- (void)setDomainPolicyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_domainPolicyProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainPolicyProvider, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_domainNormalizer, 0);
  objc_storeStrong((id *)&self->_globalFeedbackDispatcher, 0);
}

void __72__WBSFormAutoFillParsecFeedbackProcessor_sendFeedbackWithCorrectionSet___block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1A3D90000, log, OS_LOG_TYPE_DEBUG, "Not sending AutoFill correctionSet %@ on %@ since generated feedback was nil", buf, 0x16u);

}

- (void)_feedbackWithCorrectionSet:(uint64_t)a3 includeOrigin:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, a1, a3, "Skipping AutoFill feedback generation due to missing domain", a5, a6, a7, a8, 0);
}

- (void)_feedbackWithCorrectionSet:(uint64_t)a3 includeOrigin:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, a1, a3, "Skipping AutoFill feedback generation due to missing fingerprintsToCorrections", a5, a6, a7, a8, 0);
}

@end
