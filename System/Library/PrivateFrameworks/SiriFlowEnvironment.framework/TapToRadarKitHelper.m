@implementation TapToRadarKitHelper

+ (id)getLogger
{
  if (getLogger_onceToken != -1)
    dispatch_once(&getLogger_onceToken, &__block_literal_global);
  return (id)getLogger__logger;
}

void __32__TapToRadarKitHelper_getLogger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.siri.sirikit", "TapToRadarKitHelper");
  v1 = (void *)getLogger__logger;
  getLogger__logger = (uint64_t)v0;

}

+ (BOOL)createProblem:(id)a3 componentVersion:(id)a4 componentID:(id)a5 title:(id)a6 description:(id)a7 attachmentURLs:(id)a8 extensionIDs:(id)a9 deviceIDs:(id)a10 displayReason:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  dispatch_semaphore_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  dispatch_time_t v37;
  intptr_t v38;
  BOOL v39;
  BOOL v40;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  NSObject *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v46 = a6;
  v45 = a7;
  v44 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v22 = dispatch_semaphore_create(0);
  +[TapToRadarKitHelper getLogger](TapToRadarKitHelper, "getLogger");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    +[TapToRadarKitHelper createProblem:componentVersion:componentID:title:description:attachmentURLs:extensionIDs:deviceIDs:displayReason:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

  v31 = 0;
  if (v16 && v17 && v18)
    v31 = (void *)objc_msgSend(objc_alloc((Class)getRadarComponentClass[0]()), "initWithName:version:identifier:", v16, v17, objc_msgSend(v18, "integerValue"));
  v42 = v16;
  v32 = v17;
  v33 = v18;
  +[TapToRadarKitHelper createDraft:description:attachmentURLs:extensionIDs:deviceIDs:component:](TapToRadarKitHelper, "createDraft:description:attachmentURLs:extensionIDs:deviceIDs:component:", v46, v45, v44, v19, v20, v31, v42);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setRemoteDeviceSelections:", 6);
  objc_msgSend((Class)getTapToRadarServiceClass[0](), "shared");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __136__TapToRadarKitHelper_createProblem_componentVersion_componentID_title_description_attachmentURLs_extensionIDs_deviceIDs_displayReason___block_invoke;
  v47[3] = &unk_24CF82378;
  v49 = &v50;
  v36 = v22;
  v48 = v36;
  objc_msgSend(v35, "createDraft:forProcessNamed:withDisplayReason:completionHandler:", v34, CFSTR("Siri"), v21, v47);

  v37 = dispatch_time(0, 1000000000 * TapToRadarCreateDraftTimeoutSeconds);
  v38 = dispatch_semaphore_wait(v36, v37);
  if (*((_BYTE *)v51 + 24))
    v39 = v38 == 0;
  else
    v39 = 0;
  v40 = v39;

  _Block_object_dispose(&v50, 8);
  return v40;
}

void __136__TapToRadarKitHelper_createProblem_componentVersion_componentID_title_description_attachmentURLs_extensionIDs_deviceIDs_displayReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    +[TapToRadarKitHelper getLogger](TapToRadarKitHelper, "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __136__TapToRadarKitHelper_createProblem_componentVersion_componentID_title_description_attachmentURLs_extensionIDs_deviceIDs_displayReason___block_invoke_cold_1(v3, v4);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)createDraft:(id)a3 description:(id)a4 attachmentURLs:(id)a5 extensionIDs:(id)a6 deviceIDs:(id)a7 component:(id)a8
{
  Class (__cdecl *v13)();
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v13 = (Class (__cdecl *)())getRadarDraftClass;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc_init(v13());
  objc_msgSend(v20, "setTitle:", v19);

  objc_msgSend(v20, "setProblemDescription:", v18);
  objc_msgSend(v20, "setClassification:", 7);
  objc_msgSend(v20, "setReproducibility:", 5);
  objc_msgSend(v20, "setDiagnosticExtensionIDs:", v16);

  objc_msgSend(v20, "setAttachments:", v17);
  objc_msgSend(v20, "setDeviceIDs:", v15);

  objc_msgSend(v20, "setComponent:", v14);
  objc_msgSend(v20, "setDeleteOnAttach:", 1);
  +[TapToRadarKitHelper getLogger](TapToRadarKitHelper, "getLogger");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    +[TapToRadarKitHelper createDraft:description:attachmentURLs:extensionIDs:deviceIDs:component:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);

  return v20;
}

+ (void)createProblem:(uint64_t)a3 componentVersion:(uint64_t)a4 componentID:(uint64_t)a5 title:(uint64_t)a6 description:(uint64_t)a7 attachmentURLs:(uint64_t)a8 extensionIDs:deviceIDs:displayReason:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2132A2000, a1, a3, "TapToRadarKitHelper#createProblem...", a5, a6, a7, a8, 0);
}

void __136__TapToRadarKitHelper_createProblem_componentVersion_componentID_title_description_attachmentURLs_extensionIDs_deviceIDs_displayReason___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_2132A2000, a2, OS_LOG_TYPE_ERROR, "TapToRadarKitHelper#createProblem error: %@", (uint8_t *)&v4, 0xCu);

}

+ (void)createDraft:(uint64_t)a3 description:(uint64_t)a4 attachmentURLs:(uint64_t)a5 extensionIDs:(uint64_t)a6 deviceIDs:(uint64_t)a7 component:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2132A2000, a1, a3, "TapToRadarKitHelper#createDraft", a5, a6, a7, a8, 0);
}

@end
