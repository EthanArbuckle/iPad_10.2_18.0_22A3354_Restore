@implementation BRCTapToRadarManager

- (BRCTapToRadarManager)initWithNamedThrottleManager:(id)a3
{
  id v5;
  BRCTapToRadarManager *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *executionQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCTapToRadarManager;
  v6 = -[BRCTapToRadarManager init](&v12, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.clouddocs.ttr-queue", v8);

    executionQueue = v6->_executionQueue;
    v6->_executionQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_namedThrottleManager, a3);
  }

  return v6;
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 sendFullLog:(BOOL)a7 displayReason:(id)a8 triggerRootCause:(id)a9
{
  -[BRCTapToRadarManager requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:](self, "requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 sendFullLog:(BOOL)a7 displayReason:(id)a8 triggerRootCause:(id)a9 completionHandler:(id)a10
{
  uint64_t v10;

  LOBYTE(v10) = a7;
  -[BRCTapToRadarManager requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:](self, "requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:", a3, a4, CFSTR("CloudDocs"), CFSTR("All"), 554159, a5, a6, v10, a8, a9, a10);
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 sendFullLog:(BOOL)a10 displayReason:(id)a11 triggerRootCause:(id)a12
{
  uint64_t v12;

  LOBYTE(v12) = a10;
  -[BRCTapToRadarManager requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:](self, "requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:", a3, a4, a5, a6, a7, a8, a9, v12, a11, a12, 0);
}

- (id)_ttrThrottlingRulesForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "weeklyThrottledErrorsForTTR");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  if (v6)
    objc_msgSend(v4, "tapToRadarWeeklyThrottleRules");
  else
    objc_msgSend(v4, "tapToRadarDailyThrottleRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 sendFullLog:(BOOL)a10 displayReason:(id)a11 triggerRootCause:(id)a12 completionHandler:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD, _QWORD);
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  OS_dispatch_queue *executionQueue;
  BRCNamedThrottleManager *namedThrottleManager;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void (**v48)(_QWORD, _QWORD);
  int64_t v49;
  BOOL v50;

  v18 = a3;
  v38 = a4;
  v37 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v22 = a11;
  v23 = a12;
  if (a13)
    v24 = a13;
  else
    v24 = &__block_literal_global_27;
  v25 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348BA0DC](v24);
  if ((objc_msgSend(MEMORY[0x24BE17688], "isInternalBuild") & 1) != 0)
  {
    +[BRCUserDefaults generateThrottleTTRIdentifiersForTriggerRootCause:](BRCUserDefaults, "generateThrottleTTRIdentifiersForTriggerRootCause:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    namedThrottleManager = self->_namedThrottleManager;
    objc_msgSend((id)objc_opt_class(), "description");
    v36 = v19;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCTapToRadarManager _ttrThrottlingRulesForIdentifier:](self, "_ttrThrottlingRulesForIdentifier:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    executionQueue = self->_executionQueue;
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_11;
    v39[3] = &unk_24FE43B50;
    v48 = v25;
    v40 = v37;
    v41 = v26;
    v42 = v18;
    v43 = v38;
    v44 = v36;
    v49 = a7;
    v50 = a10;
    v45 = v20;
    v46 = v21;
    v47 = v22;
    v29 = v26;
    -[BRCNamedThrottleManager throttle:subCategory:withRules:onQueue:block:](namedThrottleManager, "throttle:subCategory:withRules:onQueue:block:", v27, v29, v28, executionQueue, v39);

    v19 = v36;
    v30 = v20;
  }
  else
  {
    v30 = v20;
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      -[BRCTapToRadarManager requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorNotSupportedInCustomerBuild");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v25)[2](v25, v29);
  }

}

void __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, char, void *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  char v24;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_11_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_13;
    v14 = &unk_24FE43B28;
    v22 = *(id *)(a1 + 96);
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v17 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 104);
    v18 = v8;
    v23 = v9;
    v24 = *(_BYTE *)(a1 + 112);
    v19 = *(id *)(a1 + 72);
    v20 = *(id *)(a1 + 80);
    v21 = *(id *)(a1 + 88);
    +[BRCloudTelemetryTTRDecisionRequest requestWithSenderID:ruleID:completionHandler:](BRCloudTelemetryTTRDecisionRequest, "requestWithSenderID:ruleID:completionHandler:", v7, v6, &v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resume", v11, v12, v13, v14);

  }
}

void __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_13(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    if ((a2 & 1) != 0)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_13_cold_1();

      if (getRadarDraftClass() && getRadarComponentClass() && getTapToRadarServiceClass())
      {
        getRadarDraftClass();
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setTitle:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v10, "setProblemDescription:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v10, "setClassification:", 2);
        objc_msgSend(v10, "setReproducibility:", 6);
        v11 = (void *)objc_msgSend(objc_alloc(getRadarComponentClass()), "initWithName:version:identifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 96));
        objc_msgSend(v10, "setComponent:", v11);

        if (*(_BYTE *)(a1 + 104))
          v12 = 6;
        else
          v12 = 0;
        objc_msgSend(v10, "setAutoDiagnostics:", v12);
        objc_msgSend(v10, "setIsUserInitiated:", 0);
        objc_msgSend(v10, "setKeywords:", *(_QWORD *)(a1 + 64));
        objc_msgSend(v10, "setAttachments:", *(_QWORD *)(a1 + 72));
        objc_msgSend(v10, "setDeleteOnAttach:", 1);
        -[objc_class shared](getTapToRadarServiceClass(), "shared");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_18;
        v19[3] = &unk_24FE438B0;
        v14 = *(_QWORD *)(a1 + 80);
        v20 = *(id *)(a1 + 88);
        objc_msgSend(v13, "createDraft:forProcessNamed:withDisplayReason:completionHandler:", v10, CFSTR("iCloud Drive"), v14, v19);

        goto LABEL_20;
      }
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v17;
        _os_log_impl(&dword_230455000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed gathering TapToRadarKit%@", buf, 0xCu);
      }

      v15 = *(_QWORD *)(a1 + 88);
      objc_msgSend(MEMORY[0x24BDD1540], "brc_unkownErrorWithDescription:", CFSTR("Failed gathering TapToRadarKit"));
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = *(_QWORD *)(a1 + 88);
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorThrottled");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v16;
    (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, v16);
LABEL_20:

    goto LABEL_21;
  }
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_13_cold_2();

  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
LABEL_21:

}

void __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = v3;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Tap to radar returned error: (%@)%@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_18_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedThrottleManager, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
}

- (void)requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Not internal build, ignoring tap to radar request%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_11_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Tap To Radar was throttled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_13_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Creating a radar draft request%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_13_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] TTR Server Decision failed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Tap to radar returned successfuly%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
