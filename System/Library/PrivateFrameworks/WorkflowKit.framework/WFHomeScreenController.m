@implementation WFHomeScreenController

- (void)startListeningForDatabaseChanges
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[WFHomeScreenController database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    getWFHomescreenLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFHomeScreenController startListeningForDatabaseChanges]";
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Attempted to start database listening, but we are already listening", buf, 0xCu);
    }
  }
  else
  {
    +[WFDatabase defaultDatabase](WFDatabase, "defaultDatabase");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = v5;
      objc_storeStrong((id *)&self->_database, v5);
      getWFHomescreenLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[WFHomeScreenController startListeningForDatabaseChanges]";
        _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEFAULT, "%s Starting to observe database changes", buf, 0xCu);
      }

      -[WFHomeScreenController queue](self, "queue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__WFHomeScreenController_startListeningForDatabaseChanges__block_invoke;
      block[3] = &unk_1E7AF94B0;
      block[4] = self;
      dispatch_async(v7, block);

      -[WFHomeScreenController database](self, "database");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectObserver:", self);

    }
    else
    {
      getWFHomescreenLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[WFHomeScreenController startListeningForDatabaseChanges]";
        _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Trying to start observing changes with on a process with no default database", buf, 0xCu);
      }

      v4 = 0;
    }
  }

}

- (WFDatabase)database
{
  return self->_database;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (WFHomeScreenController)sharedInstance
{
  if (sharedInstance_onceToken_50974 != -1)
    dispatch_once(&sharedInstance_onceToken_50974, &__block_literal_global_50975);
  return (WFHomeScreenController *)(id)sharedInstance_controller;
}

void __40__WFHomeScreenController_sharedInstance__block_invoke()
{
  WFHomeScreenController *v0;
  void *v1;

  v0 = objc_alloc_init(WFHomeScreenController);
  v1 = (void *)sharedInstance_controller;
  sharedInstance_controller = (uint64_t)v0;

}

- (WFHomeScreenController)init
{
  WFHomeScreenController *v2;
  uint64_t v3;
  NSMutableSet *homeScreenShortcutIDs;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  WFHomeScreenController *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFHomeScreenController;
  v2 = -[WFHomeScreenController init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    homeScreenShortcutIDs = v2->_homeScreenShortcutIDs;
    v2->_homeScreenShortcutIDs = (NSMutableSet *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = dispatch_queue_create("com.apple.shortcuts.WFHomeScreenController", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = v2;
  }

  return v2;
}

void __58__WFHomeScreenController_startListeningForDatabaseChanges__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[objc_class webClips](getUIWebClipClass(), "webClips");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v31, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        getWFHomescreenLogObject();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "title");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "shortcutIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "pageURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "applicationBundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316418;
          v20 = "-[WFHomeScreenController startListeningForDatabaseChanges]_block_invoke";
          v21 = 2112;
          v22 = v6;
          v23 = 2112;
          v24 = v8;
          v25 = 2114;
          v26 = v9;
          v27 = 2112;
          v28 = v10;
          v29 = 2112;
          v30 = v11;
          _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Considering web clip: %@, title: %@, shortcutIdentifier: %{public}@, pageURL: %@, applicationBundleID: %@", buf, 0x3Eu);

        }
        objc_msgSend(v6, "shortcutIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(*(id *)(a1 + 32), "updateWebClipIfNeeded:", v6);
          objc_msgSend(*(id *)(a1 + 32), "homeScreenShortcutIDs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v12);

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v31, 16);
    }
    while (v3);
  }

}

- (BOOL)addWorkflowToHomeScreen:(id)a3 withName:(id)a4 icon:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "iconImageForIcon:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a6) = -[WFHomeScreenController createHomeScreenShortcutForWorkflow:name:image:darkImage:tintableImage:error:](self, "createHomeScreenShortcutForWorkflow:name:image:darkImage:tintableImage:error:", v12, v11, v13, 0, 0, a6);
  return (char)a6;
}

- (BOOL)addWorkflowToHomeScreen:(id)a3 withName:(id)a4 symbolName:(id)a5 backgroundColor:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend((id)objc_opt_class(), "iconImageWithSymbolName:backgroundColor:roundCorners:", v13, v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a7) = -[WFHomeScreenController createHomeScreenShortcutForWorkflow:name:image:darkImage:tintableImage:error:](self, "createHomeScreenShortcutForWorkflow:name:image:darkImage:tintableImage:error:", v15, v14, v16, 0, 0, a7);
  return (char)a7;
}

- (BOOL)addWorkflowToHomeScreen:(id)a3 withName:(id)a4 image:(id)a5 error:(id *)a6
{
  return -[WFHomeScreenController createHomeScreenShortcutForWorkflow:name:image:darkImage:tintableImage:error:](self, "createHomeScreenShortcutForWorkflow:name:image:darkImage:tintableImage:error:", a3, a4, a5, 0, 0, a6);
}

- (BOOL)createHomeScreenShortcutForWorkflow:(id)a3 name:(id)a4 image:(id)a5 darkImage:(id)a6 tintableImage:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  WFHomeScreenController *v25;
  id *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t (*v32)();
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v44;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  _QWORD block[5];
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v50 = a4;
  v15 = a5;
  v51 = a6;
  v16 = a7;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E7AFA810);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFDatabase defaultDatabase](WFDatabase, "defaultDatabase");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFWorkflow workflowWithReference:database:error:](WFWorkflow, "workflowWithReference:database:error:", v14, v20, a8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    WFFastPathBundleIdentifierIfApplicable(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc_init(getUIWebClipClass());
    objc_msgSend(v24, "setTitle:", v50);
    objc_msgSend(v24, "setIdentifier:", v19);
    v49 = (void *)v23;
    objc_msgSend(v24, "setShortcutIdentifier:", v23);
    if (v22)
    {
      objc_msgSend(v24, "setPageURL:", 0);
    }
    else
    {
      objc_msgSend(v14, "externalURLForRunningWithSource:", *MEMORY[0x1E0DC8468]);
      v25 = self;
      v26 = a8;
      v27 = v19;
      v28 = v16;
      v29 = v15;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setPageURL:", v30);

      v15 = v29;
      v16 = v28;
      v19 = v27;
      a8 = v26;
      self = v25;
    }
    if (v22)
      v31 = v22;
    else
      v31 = (void *)*MEMORY[0x1E0DC7FA0];
    objc_msgSend(v24, "setApplicationBundleIdentifier:", v31);
    objc_msgSend(v24, "setFullScreen:", 1);
    objc_msgSend(v24, "setIconImage:isPrecomposed:", v15, 0);
    if (v51)
      objc_msgSend(v24, "setDarkIconImage:", v51);
    if (v16)
      objc_msgSend(v24, "setTintableIconImage:", v16);
    if ((objc_msgSend(v24, "createOnDisk") & 1) != 0)
    {
      v47 = v15;
      v32 = softLinkSBSSpringBoardServerPort();
      v33 = objc_msgSend(objc_retainAutorelease(v19), "cStringUsingEncoding:", 4);
      if (softLinkSBAddWebClipToHomeScreen((uint64_t)v32, v33))
      {
        if (a8)
        {
          v34 = (void *)MEMORY[0x1E0CB35C8];
          v54 = *MEMORY[0x1E0CB2D50];
          WFLocalizedString(CFSTR("Unable to add Home Screen icon."));
          v46 = v16;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("WFAddToHomeScreenErrorDomain"), 2, v36);
          *a8 = (id)objc_claimAutoreleasedReturnValue();

          v16 = v46;
          LOBYTE(a8) = 0;
        }
      }
      else
      {
        -[WFHomeScreenController queue](self, "queue");
        v44 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __103__WFHomeScreenController_createHomeScreenShortcutForWorkflow_name_image_darkImage_tintableImage_error___block_invoke;
        block[3] = &unk_1E7AF92C0;
        block[4] = self;
        v53 = v49;
        dispatch_async(v44, block);

        LOBYTE(a8) = 1;
      }
      v15 = v47;
    }
    else if (a8)
    {
      v48 = v15;
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v56 = *MEMORY[0x1E0CB2D50];
      WFLocalizedString(CFSTR("Unable to save Home Screen icon."));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
      v39 = v14;
      v40 = v19;
      v41 = v16;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v37;
      v15 = v48;
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("WFAddToHomeScreenErrorDomain"), 1, v42);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      v16 = v41;
      v19 = v40;
      v14 = v39;

      LOBYTE(a8) = 0;
    }

  }
  else
  {
    LOBYTE(a8) = 0;
  }

  return (char)a8;
}

- (BOOL)addTopHitToHomeScreen:(id)a3 withName:(id)a4 symbolName:(id)a5 backgroundColor:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v20;
  const char *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (a7)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("An internal error occurred."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("WFAddToHomeScreenErrorDomain"), 2, v17);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  getWFAppIntentsLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    v20 = 136315138;
    v21 = "-[WFHomeScreenController addTopHitToHomeScreen:withName:symbolName:backgroundColor:error:]";
    _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_FAULT, "%s WFHomeScreenController does not yet support WFTopHitItemContextualAction", (uint8_t *)&v20, 0xCu);
  }

  return 0;
}

- (BOOL)addAppShortcutToHomeScreen:(id)a3 withName:(id)a4 symbolName:(id)a5 backgroundColor:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend((id)objc_opt_class(), "iconImageWithSymbolName:backgroundColor:roundCorners:", v13, v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a7) = -[WFHomeScreenController addAppShortcutToHomeScreen:withName:image:error:](self, "addAppShortcutToHomeScreen:withName:image:error:", v15, v14, v16, a7);
  return (char)a7;
}

- (BOOL)addAppShortcutToHomeScreen:(id)a3 withName:(id)a4 image:(id)a5 error:(id *)a6
{
  return -[WFHomeScreenController createHomeScreenShortcutForAppShortcut:title:image:darkImage:tintableImage:error:](self, "createHomeScreenShortcutForAppShortcut:title:image:darkImage:tintableImage:error:", a3, a4, a5, 0, 0, a6);
}

- (BOOL)createHomeScreenShortcutForAppShortcut:(id)a3 title:(id)a4 image:(id)a5 darkImage:(id)a6 tintableImage:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t (*v25)();
  uint64_t v26;
  unsigned int v27;
  id *v28;
  id *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  id v36;
  id *v37;
  void *v38;
  id v40;
  id v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(a3, "base64ArchivedData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), *MEMORY[0x1E0DC82C8], v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E7AFA810);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc_init(getUIWebClipClass());
    objc_msgSend(v22, "setTitle:", v13);
    objc_msgSend(v22, "setIdentifier:", v21);
    objc_msgSend(v22, "setShortcutIdentifier:", v18);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("shortcuts://run-app-shortcut"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPageURL:", v23);

    objc_msgSend(v22, "setApplicationBundleIdentifier:", *MEMORY[0x1E0DC7FA0]);
    objc_msgSend(v22, "setFullScreen:", 1);
    if (v14)
      objc_msgSend(v22, "setIconImage:isPrecomposed:", v14, 0);
    if (v15)
      objc_msgSend(v22, "setDarkIconImage:", v15);
    if (v16)
      objc_msgSend(v22, "setTintableIconImage:", v16);
    v41 = v15;
    v24 = v14;
    if ((objc_msgSend(v22, "createOnDisk") & 1) != 0)
    {
      v25 = softLinkSBSSpringBoardServerPort();
      v26 = objc_msgSend(objc_retainAutorelease(v21), "cStringUsingEncoding:", 4);
      v27 = softLinkSBAddWebClipToHomeScreen((uint64_t)v25, v26);
      v28 = a8;
      LOBYTE(a8) = v27 == 0;
      if (!v28 || !v27)
        goto LABEL_19;
      v29 = v28;
      v40 = v13;
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v42 = *MEMORY[0x1E0CB2D50];
      WFLocalizedString(CFSTR("Unable to add Home Screen icon."));
      a8 = (id *)objc_claimAutoreleasedReturnValue();
      v43 = a8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v30;
      v33 = 2;
    }
    else
    {
      if (!a8)
      {
LABEL_19:

        v14 = v24;
        v15 = v41;
        goto LABEL_20;
      }
      v29 = a8;
      v40 = v13;
      v38 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2D50];
      WFLocalizedString(CFSTR("Unable to save Home Screen icon."));
      a8 = (id *)objc_claimAutoreleasedReturnValue();
      v45 = a8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v38;
      v33 = 1;
    }
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("WFAddToHomeScreenErrorDomain"), v33, v31);
    *v29 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a8) = 0;
    v13 = v40;
    goto LABEL_19;
  }
  getWFHomescreenLogObject();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[WFHomeScreenController createHomeScreenShortcutForAppShortcut:title:image:darkImage:tintableImage:error:]";
    _os_log_impl(&dword_1C15B3000, v34, OS_LOG_TYPE_ERROR, "%s Could not get base64 encoding for the auto shortcut", buf, 0xCu);
  }

  if (a8)
  {
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v46 = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("Unable to add Home Screen icon."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("WFAddToHomeScreenErrorDomain"), 2, v21);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v37 = a8;
    LOBYTE(a8) = 0;
    *v37 = v36;
LABEL_20:

  }
  return (char)a8;
}

- (void)getHomeScreenShortcutIDsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[WFHomeScreenController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__WFHomeScreenController_getHomeScreenShortcutIDsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E7AF8F48;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (void)updateWebClipIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  Class SBSWebClipServiceClass;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFHomeScreenController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "shortcutIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHomeScreenController database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WFUpdateWebClipForShortcutIfNeeded(v4, v6, v7);

  if (v8)
  {
    getWFHomescreenLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[WFHomeScreenController updateWebClipIfNeeded:]";
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_INFO, "%s Updated web clip %@, pinging SpringBoard", (uint8_t *)&v13, 0x16u);

    }
    SBSWebClipServiceClass = getSBSWebClipServiceClass();
    objc_msgSend(v4, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class updateWebClipPropertiesWithIdentifier:](SBSWebClipServiceClass, "updateWebClipPropertiesWithIdentifier:", v12);

  }
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  WFHomeScreenController *v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    -[WFHomeScreenController queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__WFHomeScreenController_databaseDidChange_modified_inserted_removed___block_invoke;
    v10[3] = &unk_1E7AF92C0;
    v11 = v7;
    v12 = self;
    dispatch_async(v8, v10);

    v9 = v11;
  }
  else
  {
    getWFHomescreenLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFHomeScreenController databaseDidChange:modified:inserted:removed:]";
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s Database did change, but no shortcuts were modified", buf, 0xCu);
    }
  }

}

- (NSMutableSet)homeScreenShortcutIDs
{
  return self->_homeScreenShortcutIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenShortcutIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __70__WFHomeScreenController_databaseDidChange_modified_inserted_removed___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v1 = a1;
  v51 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v38;
    v28 = *(_QWORD *)v38;
    v29 = v2;
    do
    {
      v6 = 0;
      v30 = v4;
      do
      {
        if (*(_QWORD *)v38 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v6);
        if (!objc_msgSend(v7, "objectType", v28, v29))
        {
          objc_msgSend(*(id *)(v1 + 40), "homeScreenShortcutIDs");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "containsObject:", v9);

          if (v10)
          {
            v31 = v6;
            v35 = 0u;
            v36 = 0u;
            v33 = 0u;
            v34 = 0u;
            -[objc_class webClips](getUIWebClipClass(), "webClips");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v34;
              do
              {
                v15 = 0;
                v32 = v13;
                do
                {
                  if (*(_QWORD *)v34 != v14)
                    objc_enumerationMutation(v11);
                  v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
                  objc_msgSend(v16, "shortcutIdentifier");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "identifier");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v17, "isEqualToString:", v18);

                  if (v19)
                  {
                    getWFHomescreenLogObject();
                    v20 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v16, "title");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v16, "identifier");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v7, "identifier");
                      v23 = v14;
                      v24 = v7;
                      v25 = v11;
                      v26 = v1;
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 136315906;
                      v42 = "-[WFHomeScreenController databaseDidChange:modified:inserted:removed:]_block_invoke";
                      v43 = 2112;
                      v44 = v21;
                      v45 = 2112;
                      v46 = v22;
                      v47 = 2112;
                      v48 = v27;
                      _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_DEFAULT, "%s Found webclip (title %@, id %@) that matches shortcut %@... Assessing migration", buf, 0x2Au);

                      v1 = v26;
                      v11 = v25;
                      v7 = v24;
                      v14 = v23;
                      v13 = v32;

                    }
                    objc_msgSend(*(id *)(v1 + 40), "updateWebClipIfNeeded:", v16);
                  }
                  ++v15;
                }
                while (v13 != v15);
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
              }
              while (v13);
            }

            v5 = v28;
            v2 = v29;
            v4 = v30;
            v6 = v31;
          }
        }
        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v4);
  }

}

void __72__WFHomeScreenController_getHomeScreenShortcutIDsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[objc_class webClips](getUIWebClipClass(), "webClips");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "shortcutIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __103__WFHomeScreenController_createHomeScreenShortcutForWorkflow_name_image_darkImage_tintableImage_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "homeScreenShortcutIDs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

+ (void)migrateWebClipsIfNeededWithDatabaseAccessor:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "migratePreYukonWebClipsIfNeeded");
  objc_msgSend(a1, "migrateOpenAppWebClipsIfNeededWithDatabaseAccessor:", v4);

}

+ (void)migratePreYukonWebClipsIfNeeded
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  NSObject *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("WFWebClipsMigratedToDirectLaunch"));

  if ((v3 & 1) == 0)
  {
    getWFHomescreenLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "%s Migrating web clips to directly launch the Shortcuts app...", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("<a id=\"jump\" href=\"(.*?)\">"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class webClips](getUIWebClipClass(), "webClips");
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v7)
    {
      v8 = v7;
      v42 = *(_QWORD *)v45;
      v43 = *MEMORY[0x1E0DC7FA0];
      v38 = v5;
      v40 = v6;
      while (2)
      {
        v9 = 0;
        v41 = v8;
        do
        {
          if (*(_QWORD *)v45 != v42)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v9);
          v11 = (void *)MEMORY[0x1C3BB3598]();
          objc_msgSend(v10, "applicationBundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v43);

          if (v13)
          {
            getWFHomescreenLogObject();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
              _os_log_impl(&dword_1C15B3000, v35, OS_LOG_TYPE_DEFAULT, "%s Web clip migration is stopping because it found an already migrated web clip.", buf, 0xCu);
            }

            objc_autoreleasePoolPop(v11);
            goto LABEL_40;
          }
          objc_msgSend(v10, "pageURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "absoluteString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v15, "hasPrefix:", CFSTR("data:text/html;base64,")) & 1) != 0)
          {
            objc_msgSend(v15, "substringFromIndex:", objc_msgSend(CFSTR("data:text/html;base64,"), "length"));
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v16, 1);
            if (v17)
            {
              v18 = (void *)v17;
              v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v17, 4);
              if ((objc_msgSend(v19, "containsString:", CFSTR("/webclips/images/")) & 1) != 0)
              {
                objc_msgSend(v5, "firstMatchInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length"));
                v20 = objc_claimAutoreleasedReturnValue();
                v21 = v20;
                if (v20)
                {
                  v22 = -[NSObject rangeAtIndex:](v20, "rangeAtIndex:", 1);
                  objc_msgSend(v19, "substringWithRange:", v22, v23);
                  v24 = objc_claimAutoreleasedReturnValue();
                  if ((-[NSObject hasPrefix:](v24, "hasPrefix:", CFSTR("shortcuts")) & 1) != 0
                    || (-[NSObject hasPrefix:](v24, "hasPrefix:", CFSTR("workflow")) & 1) != 0)
                  {
                    v39 = v21;
                    getWFHomescreenLogObject();
                    v25 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v10, "identifier");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 136315394;
                      v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
                      v50 = 2114;
                      v51 = v26;
                      _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_DEFAULT, "%s Updating page URL and bundle ID for web clip: %{public}@", buf, 0x16u);

                    }
                    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v24);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v10, "setPageURL:", v27);

                    objc_msgSend(v10, "setApplicationBundleIdentifier:", v43);
                    objc_msgSend(v10, "updateOnDisk");
                    v5 = v38;
                    v21 = v39;
                  }
                  else
                  {
                    getWFHomescreenLogObject();
                    v33 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v10, "identifier");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 136315650;
                      v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
                      v50 = 2114;
                      v51 = v34;
                      v52 = 2112;
                      v53 = v24;
                      _os_log_impl(&dword_1C15B3000, v33, OS_LOG_TYPE_DEFAULT, "%s Skipping web clip migration for web clip: %{public}@, with link: %@", buf, 0x20u);

                    }
                    v5 = v38;
                  }
                }
                else
                {
                  getWFHomescreenLogObject();
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v10, "identifier");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136315394;
                    v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
                    v50 = 2114;
                    v51 = v32;
                    _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_DEFAULT, "%s Skipping web clip migration due to no regex match for web clip: %{public}@", buf, 0x16u);

                  }
                }

              }
              else
              {
                getWFHomescreenLogObject();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v10, "identifier");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315394;
                  v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
                  v50 = 2114;
                  v51 = v31;
                  _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_DEFAULT, "%s Skipping web clip migration because it was not created by shortcuts: %{public}@", buf, 0x16u);

                }
              }

              v6 = v40;
            }
            else
            {
              getWFHomescreenLogObject();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v10, "identifier");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
                v50 = 2114;
                v51 = v30;
                _os_log_impl(&dword_1C15B3000, v29, OS_LOG_TYPE_DEFAULT, "%s Skipping web clip migration because it contained invalid base64-encoded data in its URL: %{public}@", buf, 0x16u);

              }
            }
            v8 = v41;
          }
          else
          {
            getWFHomescreenLogObject();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
              v50 = 2114;
              v51 = v28;
              _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_DEFAULT, "%s Skipping web clip migration because it isn't a base64-encoded data URL: %{public}@", buf, 0x16u);

            }
          }

          objc_autoreleasePoolPop(v11);
          ++v9;
        }
        while (v8 != v9);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_40:

    getWFHomescreenLogObject();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
      _os_log_impl(&dword_1C15B3000, v36, OS_LOG_TYPE_DEFAULT, "%s Web clip migration complete.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setBool:forKey:", 1, CFSTR("WFWebClipsMigratedToDirectLaunch"));

  }
}

+ (void)migrateOpenAppWebClipsIfNeededWithDatabaseAccessor:(id)a3
{
  void (**v3)(_QWORD);
  void *v4;
  char v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  int v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  int v23;
  const char *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void (**v37)(_QWORD);
  void *v38;
  char v39;
  uint64_t v40;
  id obj;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("WFOpenAppWebClipsMigratedToFastPath"));

  if ((v5 & 1) == 0)
  {
    getWFHomescreenLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = "+[WFHomeScreenController migrateOpenAppWebClipsIfNeededWithDatabaseAccessor:]";
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "+[WFHomeScreenController migrateOpenAppWebClipsIfNeededWithDatabaseAccessor:]";
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEFAULT, "%s Migrating Open App web clips to the fast path...", buf, 0xCu);
    }

    v3[2](v3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v37 = v3;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      -[objc_class webClips](getUIWebClipClass(), "webClips");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      if (!v42)
        goto LABEL_42;
      v8 = *(_QWORD *)v44;
      v9 = (id)*MEMORY[0x1E0DC7FA0];
      v40 = *(_QWORD *)v44;
      while (1)
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v44 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1C3BB3598]();
          getWFHomescreenLogObject();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v11, "title");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "pageURL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v48 = v7;
            v49 = 2112;
            v50 = v14;
            v51 = 2112;
            v52 = v15;
            _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_INFO, "%s Considering web clip with title, URL: %@, %@", buf, 0x20u);

          }
          objc_msgSend(v11, "applicationBundleIdentifier");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16 == v9)
          {

          }
          else
          {
            if (v16)
              v18 = v9 == 0;
            else
              v18 = 1;
            if (v18)
            {

LABEL_39:
              goto LABEL_40;
            }
            v19 = objc_msgSend(v16, "isEqualToString:", v9);

            if (!v19)
              goto LABEL_39;
          }
          objc_msgSend(v11, "pageURL");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "scheme");
          v21 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21 != CFSTR("shortcuts"))
          {
            if (!v21
              || (v23 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("shortcuts")),
                  v22,
                  !v23))
            {

              goto LABEL_39;
            }
          }
          v24 = v7;
          objc_msgSend(v11, "pageURL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "host");
          v26 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          if (v26 == CFSTR("x-callback-url"))
          {

LABEL_30:
            getWFHomescreenLogObject();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v11, "title");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "pageURL");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v48 = v7;
              v49 = 2112;
              v50 = v29;
              v51 = 2112;
              v52 = v30;
              _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_INFO, "%s Web clip with title, URL is coming from shortcuts, checking if we need to migrate: %@, %@", buf, 0x20u);

            }
            objc_msgSend(v11, "pageURL");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "dc_queryDictionary");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("id"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              WFUpdateWebClipForShortcutIfNeeded(v11, v17, v38);
            }
            else
            {
              getWFHomescreenLogObject();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v11, "pageURL");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v48 = v7;
                v49 = 2112;
                v50 = v34;
                _os_log_impl(&dword_1C15B3000, v33, OS_LOG_TYPE_ERROR, "%s Can't migrate web clip with page URL %@ -- couldn't extract shortcut identifier", buf, 0x16u);

              }
              v17 = 0;
            }
            goto LABEL_38;
          }
          v27 = v26;
          if (!v26)
          {

            v7 = v24;
LABEL_38:
            v8 = v40;
            goto LABEL_39;
          }
          v39 = -[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("x-callback-url"));

          v7 = v24;
          v8 = v40;
          if ((v39 & 1) != 0)
            goto LABEL_30;
LABEL_40:
          objc_autoreleasePoolPop(v12);
        }
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        if (!v42)
        {
LABEL_42:

          getWFHomescreenLogObject();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v48 = v7;
            _os_log_impl(&dword_1C15B3000, v35, OS_LOG_TYPE_DEFAULT, "%s Open App web clip fast path migration complete.", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
          v36 = objc_claimAutoreleasedReturnValue();
          -[NSObject setBool:forKey:](v36, "setBool:forKey:", 1, CFSTR("WFOpenAppWebClipsMigratedToFastPath"));
          v3 = v37;
          goto LABEL_47;
        }
      }
    }
    getWFHomescreenLogObject();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "+[WFHomeScreenController migrateOpenAppWebClipsIfNeededWithDatabaseAccessor:]";
      _os_log_impl(&dword_1C15B3000, v36, OS_LOG_TYPE_ERROR, "%s Couldn't access database for Open App migration... bailing out", buf, 0xCu);
    }
LABEL_47:

  }
}

+ (id)iconImageForIcon:(id)a3
{
  Class (__cdecl *v3)();
  id v4;
  Class v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  CGAffineTransform v19;

  v3 = (Class (__cdecl *)())getISImageDescriptorClass;
  v4 = a3;
  v5 = v3();
  getkISImageDescriptorHomeScreen();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class imageDescriptorNamed:](v5, "imageDescriptorNamed:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "scale");
  CGAffineTransformMakeScale(&v19, v12, v12);
  v13 = v11 * v19.c + v19.a * v9;
  v14 = v11 * v19.d + v19.b * v9;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E40]), "initWithHomeScreenIcon:", v4);

  objc_msgSend(v15, "setRounded:", 0);
  objc_msgSend(v15, "imageWithSize:", v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UIImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)iconImageWithSymbolName:(id)a3 backgroundColor:(id)a4 roundCorners:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setRounded:", v5);
  objc_msgSend(v9, "setBackgroundColor:", v7);

  objc_msgSend(v9, "setSymbolName:", v8);
  objc_msgSend(v9, "imageWithSize:scale:", 200.0, 200.0, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UIImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
