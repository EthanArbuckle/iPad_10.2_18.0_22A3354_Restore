@implementation BRCSharingAcceptFlowOperation

- (BRCSharingAcceptFlowOperation)initWithShareMetadata:(id)a3 client:(id)a4 session:(id)a5 userNotifier:(id)a6 userActionsNavigator:(id)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  BRCSharingAcceptFlowOperation *v17;
  void *v18;
  uint64_t v19;
  NSURL *shareURL;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  void *v24;
  void *v25;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v13 = a3;
  v29 = a4;
  v14 = a5;
  v28 = a6;
  v27 = a7;
  objc_msgSend(v14, "syncContextProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sharedMetadataSyncContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30.receiver = self;
  v30.super_class = (Class)BRCSharingAcceptFlowOperation;
  v17 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v30, sel_initWithName_syncContext_sessionContext_, CFSTR("sharing/accept-flow"), v16, v14);

  if (v17)
  {
    objc_msgSend(v13, "share");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URL");
    v19 = objc_claimAutoreleasedReturnValue();
    shareURL = v17->_shareURL;
    v17->_shareURL = (NSURL *)v19;

    objc_storeStrong((id *)&v17->_shareMetadata, a3);
    objc_storeStrong((id *)&v17->_session, a5);
    -[_BRCOperation setNonDiscretionary:](v17, "setNonDiscretionary:", 1);
    -[BRCSharingAcceptFlowOperation setQueuePriority:](v17, "setQueuePriority:", 8);
    objc_storeStrong((id *)&v17->_xpcClient, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("accept-flow-next-step", v21);

    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v22;

    objc_msgSend(MEMORY[0x24BDB9190], "br_sharingMisc");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v17, "setGroup:", v24);

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_allowsDirectoryFaults = objc_msgSend(v25, "forceDeltaInitialSync") ^ 1;

    objc_storeStrong((id *)&v17->_userNotification, a6);
    objc_storeStrong((id *)&v17->_userActionsNavigator, a7);
    v17->_hadProcessedCompletionError = 0;
  }

  return v17;
}

- (void)moveDialogToFront
{
  -[BRCUserNotifier moveToFront](self->_userNotification, "moveToFront");
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sharing/accept-flow", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.clouddocs.accept-shared-url");
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (id)_stepNameAtIndex:(unint64_t)a3 withPrefix:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;

  v6 = a4;
  if (-[NSArray count](self->_acceptationFlow, "count"))
  {
    if (-[NSArray count](self->_acceptationFlow, "count") <= a3)
    {
      v10 = CFSTR("complete");
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_acceptationFlow, "objectAtIndexedSubscript:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), &stru_24FE4A790);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v6, v8);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = v8;
      }
      v10 = v9;

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)subclassableDescriptionWithContext:(id)a3
{
  unint64_t stepIndex;
  BOOL v4;
  unint64_t v5;
  unint64_t v6;

  stepIndex = self->_stepIndex;
  v4 = stepIndex != 0;
  v5 = stepIndex - 1;
  if (v4)
    v6 = v5;
  else
    v6 = 0;
  return -[BRCSharingAcceptFlowOperation _stepNameAtIndex:withPrefix:](self, "_stepNameAtIndex:withPrefix:", v6, CFSTR("step:"));
}

- (void)_completeWithError:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  int v8;
  uint64_t v9;
  const __CFString *v10;
  BRCUserNotifier *v11;
  CKShareMetadata *v12;
  void *v13;
  void *v14;
  int v15;
  BRCUserNotifier *userNotification;
  CKShareMetadata *shareMetadata;
  BRCUserNotifier *v18;
  CKShareMetadata *v19;
  void *v20;
  int v21;
  uint64_t v22;
  BRCUserNotifier *v23;
  CKShareMetadata *v24;
  BRCUserNotifier *v25;
  CKShareMetadata *v26;
  BRCUserNotifier *v27;
  CKShareMetadata *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  char v39;
  BRCUserNotifier *v40;
  CKShareMetadata *v41;
  BRCUserNotifier *v42;
  CKShareMetadata *v43;
  BRCUserNotifier *v44;
  CKShareMetadata *v45;
  BRCUserNotifier *v46;
  CKShareMetadata *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[5];
  id v60;
  void (**v61)(_QWORD, _QWORD);
  _QWORD v62[5];
  id v63;
  _QWORD v64[5];
  id v65;
  void (**v66)(_QWORD, _QWORD);
  _QWORD v67[5];
  id v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  id v72;
  void (**v73)(_QWORD, _QWORD);
  _QWORD v74[5];
  id v75;
  void (**v76)(_QWORD, _QWORD);
  _QWORD v77[5];
  id v78;
  void (**v79)(_QWORD, _QWORD);
  _QWORD v80[5];
  id v81;
  _QWORD v82[5];

  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.5();

  }
  self->_hadProcessedCompletionError = 1;
  v5 = MEMORY[0x24BDAC760];
  v82[0] = MEMORY[0x24BDAC760];
  v82[1] = 3221225472;
  v82[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke;
  v82[3] = &unk_24FE40AF8;
  v82[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348BA0DC](v82);
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE17300]);

  if (!v8)
  {
    objc_msgSend(v4, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDB8EA8]);

    if (v15)
    {
      if (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 3))
      {
        userNotification = self->_userNotification;
        shareMetadata = self->_shareMetadata;
        v69[0] = v5;
        v69[1] = 3221225472;
        v69[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_36;
        v69[3] = &unk_24FE3FA40;
        v69[4] = self;
        v70 = v4;
        -[BRCUserNotifier showErrorDeviceOfflineForShareMetadata:reply:](userNotification, "showErrorDeviceOfflineForShareMetadata:reply:", shareMetadata, v69);
        v13 = v70;
        goto LABEL_41;
      }
      if (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 4))
      {
        v27 = self->_userNotification;
        v28 = self->_shareMetadata;
        v67[0] = v5;
        v67[1] = 3221225472;
        v67[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_37;
        v67[3] = &unk_24FE3FA40;
        v67[4] = self;
        v68 = v4;
        -[BRCUserNotifier showErrorServerNotReachableForShareMetadata:reply:](v27, "showErrorServerNotReachableForShareMetadata:reply:", v28, v67);
        v13 = v68;
        goto LABEL_41;
      }
      if (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 29))
      {
        v42 = self->_userNotification;
        v43 = self->_shareMetadata;
        v64[0] = v5;
        v64[1] = 3221225472;
        v64[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_3;
        v64[3] = &unk_24FE47AD0;
        v66 = v6;
        v64[4] = self;
        v65 = v4;
        -[BRCUserNotifier showErrorParticipantLimitReachedForShareMetadata:reply:](v42, "showErrorParticipantLimitReachedForShareMetadata:reply:", v43, v64);

        v13 = v66;
        goto LABEL_41;
      }
      if ((objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 32) & 1) != 0
        || (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 11) & 1) != 0
        || objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 10))
      {
        v46 = self->_userNotification;
        v47 = self->_shareMetadata;
        v62[0] = v5;
        v62[1] = 3221225472;
        v62[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_4;
        v62[3] = &unk_24FE3FA40;
        v62[4] = self;
        v63 = v4;
        -[BRCUserNotifier showErrorItemUnavailableOrAccessRestrictedForShareMetadata:reply:](v46, "showErrorItemUnavailableOrAccessRestrictedForShareMetadata:reply:", v47, v62);
        v13 = v63;
        goto LABEL_41;
      }
    }
    else
    {
      objc_msgSend(v4, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x24BDD1128]);

      if (v21)
      {
        v22 = objc_msgSend(v4, "code");
        if (v22 == 35)
        {
          v44 = self->_userNotification;
          v45 = self->_shareMetadata;
          v57[0] = v5;
          v57[1] = 3221225472;
          v57[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_6;
          v57[3] = &unk_24FE3FA40;
          v57[4] = self;
          v58 = v4;
          -[BRCUserNotifier showErrorReasonUnknownForShareMetadata:reply:](v44, "showErrorReasonUnknownForShareMetadata:reply:", v45, v57);
          v13 = v58;
          goto LABEL_41;
        }
        if (v22 == 1)
        {
          v23 = self->_userNotification;
          v24 = self->_shareMetadata;
          v59[0] = v5;
          v59[1] = 3221225472;
          v59[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_5;
          v59[3] = &unk_24FE47AF8;
          v61 = v6;
          v59[4] = self;
          v60 = v4;
          -[BRCUserNotifier showErrorNativeAppDisabledByProfileForShareMetadata:reply:](v23, "showErrorNativeAppDisabledByProfileForShareMetadata:reply:", v24, v59);

          v13 = v61;
          goto LABEL_41;
        }
      }
    }
    goto LABEL_42;
  }
  v9 = objc_msgSend(v4, "code");
  v10 = CFSTR("appMissing");
  if (v9 <= 32)
  {
    if (v9 <= 22)
    {
      if (v9 != 1)
      {
        if (v9 == 2)
        {
          v11 = self->_userNotification;
          v12 = self->_shareMetadata;
          v74[0] = v5;
          v74[1] = 3221225472;
          v74[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_34;
          v74[3] = &unk_24FE47AA8;
          v74[4] = self;
          v76 = v6;
          v75 = v4;
          -[BRCUserNotifier showErrorSignInToiCloudForShareMetadata:reply:](v11, "showErrorSignInToiCloudForShareMetadata:reply:", v12, v74);

          v13 = v76;
LABEL_41:

          goto LABEL_45;
        }
        goto LABEL_42;
      }
LABEL_43:
      ((void (**)(_QWORD, const __CFString *))v6)[2](v6, v10);
      goto LABEL_44;
    }
    if (v9 != 23)
    {
      if (v9 == 29)
      {
        v25 = self->_userNotification;
        v26 = self->_shareMetadata;
        v77[0] = v5;
        v77[1] = 3221225472;
        v77[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2;
        v77[3] = &unk_24FE47AA8;
        v77[4] = self;
        v79 = v6;
        v78 = v4;
        -[BRCUserNotifier showErrorInstallNativeAppForShareMetadata:reply:](v25, "showErrorInstallNativeAppForShareMetadata:reply:", v26, v77);

        v13 = v79;
        goto LABEL_41;
      }
      goto LABEL_42;
    }
LABEL_44:
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v4);
    goto LABEL_45;
  }
  if (v9 <= 129)
  {
    if (v9 != 33)
    {
      if (v9 == 35)
      {
        v18 = self->_userNotification;
        v19 = self->_shareMetadata;
        v71[0] = v5;
        v71[1] = 3221225472;
        v71[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_35;
        v71[3] = &unk_24FE47AA8;
        v71[4] = self;
        v73 = v6;
        v72 = v4;
        -[BRCUserNotifier showErrorTurnOniCloudDriveForShareMetadata:reply:](v18, "showErrorTurnOniCloudDriveForShareMetadata:reply:", v19, v71);

        v13 = v73;
        goto LABEL_41;
      }
      goto LABEL_42;
    }
    goto LABEL_44;
  }
  if (v9 == 138)
    goto LABEL_43;
  if (v9 != 130)
  {
LABEL_42:
    v10 = CFSTR("other");
    goto LABEL_43;
  }
  v29 = v4;
  objc_msgSend(v29, "underlyingErrors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v31 != 1)
  {
    brc_bread_crumbs();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.4();

  }
  objc_msgSend(v29, "underlyingErrors");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33 == 1)
  {
    objc_msgSend(v29, "underlyingErrors");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
    v35 = objc_claimAutoreleasedReturnValue();

    v29 = (id)v35;
  }
  if (!self->_shareMetadata)
  {
    brc_bread_crumbs();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.3();

  }
  brc_bread_crumbs();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, (os_log_type_t)0x90u))
    -[BRCSharingAcceptFlowOperation _completeWithError:].cold.2((uint64_t)v29);

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isNetworkReachable");

  if ((v39 & 1) != 0)
  {
    v40 = self->_userNotification;
    v41 = self->_shareMetadata;
    v80[0] = v5;
    v80[1] = 3221225472;
    v80[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_31;
    v80[3] = &unk_24FE3FA40;
    v80[4] = self;
    v81 = v29;
    -[BRCUserNotifier showErrorReasonUnknownForShareMetadata:reply:](v40, "showErrorReasonUnknownForShareMetadata:reply:", v41, v80);

  }
  else
  {
    brc_bread_crumbs();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB8EA8], 3, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v50);

  }
LABEL_45:

}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_cold_1((uint64_t)v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "openShareURLInWebBrowser:withReason:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544), v3);
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_31(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;

  v7 = a4;
  if (a2 && a3)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_2();

    goto LABEL_4;
  }
  if (a2)
  {
LABEL_4:
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 544);
    if (!v9)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_1();

      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 544);
    }
    v10 = *(void **)(v8 + 512);
    objc_msgSend(v9, "brc_applicationBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openAppStoreForBundleID:", v11);

    goto LABEL_11;
  }
  if (a3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));

}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_34(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;

  v7 = a4;
  if (a2 && a3)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_34_cold_1();

    goto LABEL_4;
  }
  if (a2)
  {
LABEL_4:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "openiCloudSettings");
    goto LABEL_10;
  }
  if (a3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));

}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_35(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;

  v7 = a4;
  if (a2 && a3)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_34_cold_1();

    goto LABEL_4;
  }
  if (a2)
  {
LABEL_4:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "openiCloudSettings");
    goto LABEL_10;
  }
  if (a3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));

}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_36(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_37(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_5(uint64_t a1, int a2)
{
  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSURL *shareURL;
  NSObject *v14;
  BRCAccountSessionFPFS *session;
  NSObject *v16;
  NSURL *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  objc_super v30;
  _QWORD block[5];
  uint8_t buf[4];
  NSURL *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[BRCSharingAcceptFlowOperation _isFolderShare](self, "_isFolderShare"))
  {
    v8 = CFSTR("folderShare-");
  }
  else if (-[BRCSharingAcceptFlowOperation _isiWorkShare](self, "_isiWorkShare"))
  {
    v8 = CFSTR("iWorkShare-");
  }
  else
  {
    v8 = CFSTR("documentShare-");
  }
  -[BRCSharingAcceptFlowOperation _stepNameAtIndex:withPrefix:](self, "_stepNameAtIndex:withPrefix:", self->_stepIndex, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_accessedSecurityScope)
  {
    -[NSURL stopAccessingSecurityScopedResource](self->_liveFileURL, "stopAccessingSecurityScopedResource");
    self->_accessedSecurityScope = 0;
  }
  if (v7)
  {
    brc_bread_crumbs();
    v11 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      shareURL = self->_shareURL;
      *(_DWORD *)buf = 138412802;
      v33 = shareURL;
      v34 = 2112;
      v35 = v7;
      v36 = 2112;
      v37 = v11;
      _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] share acceptation %@ failed with error %@%@", buf, 0x20u);
    }

    if ((-[BRCSharingAcceptFlowOperation isCancelled](self, "isCancelled") & 1) == 0
      && !self->_hadProcessedCompletionError)
    {
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        -[BRCSharingAcceptFlowOperation finishWithResult:error:].cold.2();

    }
    -[BRCSharingAcceptFlowOperation _activateSharedZoneIfNeeded](self, "_activateSharedZoneIfNeeded");
    -[BRCAccountSessionFPFS clientTruthWorkloop](self->_session, "clientTruthWorkloop");
    v14 = objc_claimAutoreleasedReturnValue();
    session = self->_session;
    if (session && !-[BRCAccountSessionFPFS isCancelled](session, "isCancelled"))
    {
      if (v14)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke;
        block[3] = &unk_24FE3FA18;
        block[4] = self;
        dispatch_async(v14, block);
      }
      else
      {
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          -[BRCSharingAcceptFlowOperation finishWithResult:error:].cold.1();

      }
    }
  }
  else
  {
    brc_bread_crumbs();
    v14 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_shareURL;
      -[NSURL path](self->_liveFileURL, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = v17;
      v34 = 2112;
      v35 = v18;
      v36 = 2112;
      v37 = v14;
      _os_log_impl(&dword_230455000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] share acceptation %@ succeed and document is now live on disk at %@%@", buf, 0x20u);

    }
  }

  +[BRCEventsAnalytics sharedAnalytics](BRCEventsAnalytics, "sharedAnalytics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone mangledID](self->_clientZone, "mangledID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[BRCClientZone enhancedDrivePrivacyEnabled](self->_clientZone, "enhancedDrivePrivacyEnabled");
  -[BRCItemID itemIDString](self->_linkItemID, "itemIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS analyticsReporter](self->_session, "analyticsReporter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerAndSendNewShareAcceptationWithLastStep:zoneMangledID:enhancedDrivePrivacyEnabled:itemIDString:error:analyticsReporter:", v10, v20, v21, v22, v7, v23);

  -[BRCAppLibrary removeForegroundClient:](self->_appLibrary, "removeForegroundClient:", self);
  if (!-[BRCSharingAcceptFlowOperation _isOwner](self, "_isOwner"))
  {
    -[BRCClientZone serverZone](self->_clientZone, "serverZone");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeForegroundClient:", self);

  }
  -[BRCUserNotifier close](self->_userNotification, "close");
  if (self->_shareID)
  {
    +[BRCSharingAcceptFlowOperation _runningShareIDs](BRCSharingAcceptFlowOperation, "_runningShareIDs");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v25);
    objc_msgSend(v25, "removeObject:", self->_shareID);
    objc_sync_exit(v25);

  }
  v30.receiver = self;
  v30.super_class = (Class)BRCSharingAcceptFlowOperation;
  -[_BRCOperation finishWithResult:error:](&v30, sel_finishWithResult_error_, v6, v7);

}

void __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 576))
  {
    objc_msgSend(*(id *)(v2 + 608), "itemByItemID:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && objc_msgSend(v3, "isShareAcceptationFault"))
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke_cold_1();

      objc_msgSend(v4, "asShareAcceptationFault");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deleteShareAcceptationFault");

    }
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (objc_msgSend((id)v2, "_isLinkInsideFolderShare"))
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v8 + 584))
    {
      objc_msgSend(*(id *)(v8 + 608), "itemByItemID:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && objc_msgSend(v9, "isShareAcceptationFault"))
      {
        brc_bread_crumbs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke_cold_1();

        objc_msgSend(v10, "asShareAcceptationFault");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "deleteShareAcceptationFault");

      }
    }
  }
}

- (void)main
{
  void *v3;
  NSObject *v4;
  NSURL *shareURL;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *acceptationFlow;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[18];
  _QWORD v36[21];
  _QWORD v37[21];
  uint8_t buf[4];
  NSURL *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    shareURL = self->_shareURL;
    *(_DWORD *)buf = 138412546;
    v39 = shareURL;
    v40 = 2112;
    v41 = v3;
    _os_log_impl(&dword_230455000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] User clicked on share link %@%@", buf, 0x16u);
  }

  if (-[BRCSharingAcceptFlowOperation _isFolderShare](self, "_isFolderShare"))
  {
    NSStringFromSelector(sel__isAppInstalled_step);
    v24 = objc_claimAutoreleasedReturnValue();
    v37[0] = v24;
    NSStringFromSelector(sel__isFolderSharingSupported_step);
    v22 = objc_claimAutoreleasedReturnValue();
    v37[1] = v22;
    NSStringFromSelector(sel__isUserSignedInToiCloudDrive_step);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v34;
    NSStringFromSelector(sel__showSharingJoinDialog_step);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v33;
    NSStringFromSelector(sel__parseShareMetadata_step);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = v32;
    NSStringFromSelector(sel__startShareAccept_step);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[5] = v31;
    NSStringFromSelector(sel__openiWorkAppPreemptively_step);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v37[6] = v30;
    NSStringFromSelector(sel__locateSharedItemOnOwner_step);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[7] = v29;
    NSStringFromSelector(sel__waitForSharedItemToSyncDownOnOwner_step);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37[8] = v28;
    NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnOwner_step);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37[9] = v27;
    NSStringFromSelector(sel__createSideFaultOnDisk_step);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[10] = v26;
    NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnRecipient_step);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[11] = v25;
    NSStringFromSelector(sel__checkIfShouldWaitUntilDownloadCompletion_step);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37[12] = v6;
    NSStringFromSelector(sel__openSharedSideFaultFile_step);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37[13] = v7;
    NSStringFromSelector(sel__finishShareAccept_step);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37[14] = v8;
    NSStringFromSelector(sel__locateSharedItemOnRecipient_step);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[15] = v9;
    NSStringFromSelector(sel__waitForSharedItemToSyncDownOnRecipient_step);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37[16] = v10;
    NSStringFromSelector(sel__locateSharedItemOnDisk_step);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37[17] = v11;
    NSStringFromSelector(sel__setSpotlightAttribute_step);
    acceptationFlow = (void *)objc_claimAutoreleasedReturnValue();
    v37[18] = acceptationFlow;
    NSStringFromSelector(sel__openSharedItemIfStillNeeded_step);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37[19] = v13;
    NSStringFromSelector(sel__endAcceptationFlow_step);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37[20] = v14;
    v15 = (void *)MEMORY[0x24BDBCE30];
    v16 = v37;
  }
  else
  {
    if (!-[BRCSharingAcceptFlowOperation _isiWorkShare](self, "_isiWorkShare"))
    {
      NSStringFromSelector(sel__isUserSignedInToiCloudDrive_step);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v20;
      NSStringFromSelector(sel__showSharingJoinDialog_step);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v19;
      NSStringFromSelector(sel__parseShareMetadata_step);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v34;
      NSStringFromSelector(sel__startShareAccept_step);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35[3] = v33;
      NSStringFromSelector(sel__locateSharedItemOnOwner_step);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35[4] = v32;
      NSStringFromSelector(sel__waitForSharedItemToSyncDownOnOwner_step);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35[5] = v31;
      NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnOwner_step);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35[6] = v30;
      NSStringFromSelector(sel__createSideFaultOnDisk_step);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v35[7] = v29;
      NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnRecipient_step);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35[8] = v28;
      NSStringFromSelector(sel__checkIfShouldWaitUntilDownloadCompletion_step);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35[9] = v27;
      NSStringFromSelector(sel__openSharedSideFaultFile_step);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35[10] = v26;
      NSStringFromSelector(sel__finishShareAccept_step);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v35[11] = v25;
      NSStringFromSelector(sel__locateSharedItemOnRecipient_step);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v35[12] = v6;
      NSStringFromSelector(sel__waitForSharedItemToSyncDownOnRecipient_step);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v35[13] = v7;
      NSStringFromSelector(sel__prepareToDownloadSharedDocument_step);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v35[14] = v8;
      NSStringFromSelector(sel__setSpotlightAttribute_step);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v35[15] = v9;
      NSStringFromSelector(sel__openSharedItemIfStillNeeded_step);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35[16] = v10;
      NSStringFromSelector(sel__endAcceptationFlow_step);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v35[17] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 18);
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
      acceptationFlow = self->_acceptationFlow;
      self->_acceptationFlow = v21;
      goto LABEL_9;
    }
    NSStringFromSelector(sel__isAppInstalled_step);
    v24 = objc_claimAutoreleasedReturnValue();
    v36[0] = v24;
    NSStringFromSelector(sel__isUserSignedInToiCloudDrive_step);
    v22 = objc_claimAutoreleasedReturnValue();
    v36[1] = v22;
    NSStringFromSelector(sel__isAccountRestricted_step);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v34;
    NSStringFromSelector(sel__showSharingJoinDialog_step);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v33;
    NSStringFromSelector(sel__parseShareMetadata_step);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[4] = v32;
    NSStringFromSelector(sel__startShareAccept_step);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[5] = v31;
    NSStringFromSelector(sel__openiWorkAppPreemptively_step);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36[6] = v30;
    NSStringFromSelector(sel__locateSharedItemOnOwner_step);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[7] = v29;
    NSStringFromSelector(sel__waitForSharedItemToSyncDownOnOwner_step);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[8] = v28;
    NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnOwner_step);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36[9] = v27;
    NSStringFromSelector(sel__createSideFaultOnDisk_step);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[10] = v26;
    NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnRecipient_step);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[11] = v25;
    NSStringFromSelector(sel__checkIfShouldWaitUntilDownloadCompletion_step);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v36[12] = v6;
    NSStringFromSelector(sel__openSharedSideFaultFile_step);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v36[13] = v7;
    NSStringFromSelector(sel__finishShareAccept_step);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36[14] = v8;
    NSStringFromSelector(sel__locateSharedItemOnRecipient_step);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[15] = v9;
    NSStringFromSelector(sel__waitForSharedItemToSyncDownOnRecipient_step);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[16] = v10;
    NSStringFromSelector(sel__prepareToDownloadSharedDocument_step);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[17] = v11;
    NSStringFromSelector(sel__setSpotlightAttribute_step);
    acceptationFlow = (void *)objc_claimAutoreleasedReturnValue();
    v36[18] = acceptationFlow;
    NSStringFromSelector(sel__openSharedItemIfStillNeeded_step);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36[19] = v13;
    NSStringFromSelector(sel__endAcceptationFlow_step);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[20] = v14;
    v15 = (void *)MEMORY[0x24BDBCE30];
    v16 = v36;
  }
  objc_msgSend(v15, "arrayWithObjects:count:", v16, 21, v22);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v18 = self->_acceptationFlow;
  self->_acceptationFlow = v17;

  v19 = v23;
  v20 = (void *)v24;
LABEL_9:

  self->_stepIndex = 0;
  -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
}

- (void)_performNextStepInQueue
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Accept flow completed successfully.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_performNextStep
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__BRCSharingAcceptFlowOperation__performNextStep__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__BRCSharingAcceptFlowOperation__performNextStep__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextStepInQueue");
}

- (void)_jumpToSelectorInQueue:(SEL)a3
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  NSStringFromSelector(a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray indexOfObject:](self->_acceptationFlow, "indexOfObject:");
  if (v5 >= -[NSArray count](self->_acceptationFlow, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:description:", 84, CFSTR("can't fast forward to download step (currentIndex: %lu, downloadIndex: %lu, stepCount: %lu)"), self->_stepIndex, v5, -[NSArray count](self->_acceptationFlow, "count"));
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = (void *)v6;
    -[BRCSharingAcceptFlowOperation _completeWithError:](self, "_completeWithError:", v6);

    goto LABEL_7;
  }
  if (self->_stepIndex >= v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17300], 10, CFSTR("can't fast forward to download step from current position (currentIndex: %lu)"), self->_stepIndex);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  self->_stepIndex = v5;
  -[BRCSharingAcceptFlowOperation _performNextStepInQueue](self, "_performNextStepInQueue");
LABEL_7:

}

- (void)_jumpToSelector:(SEL)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__BRCSharingAcceptFlowOperation__jumpToSelector___block_invoke;
  v4[3] = &unk_24FE41740;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __49__BRCSharingAcceptFlowOperation__jumpToSelector___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_jumpToSelectorInQueue:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_isOwner
{
  CKShareMetadata *shareMetadata;
  void *v5;
  NSObject *v6;

  shareMetadata = self->_shareMetadata;
  if (!shareMetadata)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.3();

    shareMetadata = self->_shareMetadata;
  }
  return -[CKShareMetadata participantRole](shareMetadata, "participantRole") == CKShareParticipantRoleOwner;
}

- (BOOL)_isOwnerOrShareAlreadyAccepted
{
  CKShareMetadata *shareMetadata;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  shareMetadata = self->_shareMetadata;
  if (!shareMetadata)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.3();

    shareMetadata = self->_shareMetadata;
  }
  v4 = -[CKShareMetadata participantRole](shareMetadata, "participantRole");
  if (v4 != 1)
    LOBYTE(v4) = -[CKShareMetadata participantStatus](self->_shareMetadata, "participantStatus") == CKShareParticipantAcceptanceStatusAccepted;
  return v4;
}

- (BOOL)_isFolderShare
{
  void *v2;
  char v3;

  -[CKShareMetadata share](self->_shareMetadata, "share");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFolderShare");

  return v3;
}

- (BOOL)_isLinkInsideFolderShare
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  if (-[BRCSharingAcceptFlowOperation _isFolderShare](self, "_isFolderShare"))
  {
    -[CKShareMetadata sharedItemHierarchyIDs](self->_shareMetadata, "sharedItemHierarchyIDs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "brc_itemIDWithSession:", self->_session);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKRecordID brc_shareItemID](self->_shareID, "brc_shareItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v7 = objc_msgSend(v5, "isEqualToItemID:", v6) ^ 1;
    else
      LOBYTE(v7) = 0;

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)_isDocumentLinkInsideFolderShare
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = -[BRCSharingAcceptFlowOperation _isLinkInsideFolderShare](self, "_isLinkInsideFolderShare");
  if (v3)
  {
    -[CKShareMetadata sharedItemHierarchyIDs](self->_shareMetadata, "sharedItemHierarchyIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("documentContent/"));

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (BOOL)_isDirectoryLinkInsideFolderShare
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  if (!-[BRCSharingAcceptFlowOperation _isFolderShare](self, "_isFolderShare"))
    return 0;
  -[CKShareMetadata sharedItemHierarchyIDs](self->_shareMetadata, "sharedItemHierarchyIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "brc_itemIDWithSession:", self->_session);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecordID brc_shareItemID](self->_shareID, "brc_shareItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToItemID:", v6))
  {
    objc_msgSend(v4, "recordName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("directory/"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isiWorkLinkInsideFolderShare
{
  void *v3;
  BOOL v4;

  if (!-[BRCSharingAcceptFlowOperation _isDocumentLinkInsideFolderShare](self, "_isDocumentLinkInsideFolderShare"))
    return 0;
  -[NSURL brc_applicationContainerID](self->_shareURL, "brc_applicationContainerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_isiWorkShare
{
  CKShareMetadata *shareMetadata;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSURL *shareURL;
  void *v16;
  void *v18;
  NSObject *v19;

  shareMetadata = self->_shareMetadata;
  if (shareMetadata)
  {
    -[CKShareMetadata share](shareMetadata, "share");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFolderShare");

    if ((v5 & 1) != 0)
      return 0;
    -[CKShareMetadata share](self->_shareMetadata, "share");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "brc_applicationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      return 0;
    }
    else
    {
      -[CKShareMetadata share](self->_shareMetadata, "share");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "brc_sharedRootExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(MEMORY[0x24BE176A0], "iWorkShareableExtensions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setWithArray:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "containsObject:", v10);
      }
      else
      {
        v14 = 1;
      }

    }
  }
  else
  {
    shareURL = self->_shareURL;
    if (!shareURL)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[BRCSharingAcceptFlowOperation _isiWorkShare].cold.1();

      shareURL = self->_shareURL;
    }
    -[NSURL brc_applicationContainerID](shareURL, "brc_applicationContainerID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16 != 0;

  }
  return v14;
}

- (void)_fetchOpenInfoOnFileObjectID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BRCSharingAcceptFlowOperation *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDC83F0], "br_sharedProviderManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__BRCSharingAcceptFlowOperation__fetchOpenInfoOnFileObjectID_completion___block_invoke;
  v12[3] = &unk_24FE42730;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "getUserVisibleURLForItemIdentifier:completionHandler:", v9, v12);

}

void __73__BRCSharingAcceptFlowOperation__fetchOpenInfoOnFileObjectID_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v12 = a1[4];
      v13 = 138412802;
      v14 = v12;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_error_impl(&dword_230455000, v8, (os_log_type_t)0x90u, "[ERROR] Can't find the user visible URL for %@ - %@%@", (uint8_t *)&v13, 0x20u);
    }

  }
  v9 = a1[5];
  v10 = *(void **)(v9 + 648);
  *(_QWORD *)(v9 + 648) = v5;
  v11 = v5;

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_activateSharedZoneIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx activating shared zone%@");
  OUTLINED_FUNCTION_0();
}

uint64_t __60__BRCSharingAcceptFlowOperation__activateSharedZoneIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "resume");
}

- (void)openResourceOperationDidComplete:(id)a3
{
  void *v4;
  NSObject *v5;

  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRCSharingAcceptFlowOperation openResourceOperationDidComplete:].cold.1();

  -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a4;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    -[BRCSharingAcceptFlowOperation openResourceOperation:didFailWithError:].cold.1((uint64_t)v5);

  objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAcceptShareFailedWithUnderlyingError:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSharingAcceptFlowOperation _completeWithError:](self, "_completeWithError:", v8);

}

- (void)_isFolderSharingSupported_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx checking if document sharing is supported%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isAppInstalled_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx Check if app is installed%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isUserSignedInToiCloudDrive_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx Check if a user is signed in to iCloud and iCloud Drive is turned on%@");
  OUTLINED_FUNCTION_0();
}

- (void)_isAccountRestricted_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx Check if app is profile disabled%@");
  OUTLINED_FUNCTION_0();
}

- (void)_showSharingJoinDialog_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx Show sharing join dialog%@");
  OUTLINED_FUNCTION_0();
}

void __60__BRCSharingAcceptFlowOperation__showSharingJoinDialog_step__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v5);
  }
  else
  {
    if ((a2 & 1) != 0)
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544);
        *(_DWORD *)buf = 138412546;
        v16 = v8;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] User has accepted to open shared document at %@%@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__BRCSharingAcceptFlowOperation__showSharingJoinDialog_step__block_invoke_119;
      block[3] = &unk_24FE3FA18;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v9, block);
    }
    else
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544);
        *(_DWORD *)buf = 138412546;
        v16 = v12;
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] User has refused to open shared document at %@%@", buf, 0x16u);
      }

      v13 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorOperationCancelled");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_completeWithError:", v9);
    }

  }
}

uint64_t __60__BRCSharingAcceptFlowOperation__showSharingJoinDialog_step__block_invoke_119(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
}

- (void)_parseShareMetadata_step
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Pre-creating accept operation to block next sync down %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __57__BRCSharingAcceptFlowOperation__parseShareMetadata_step__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 520);
  objc_msgSend(*(id *)(v1 + 560), "share");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "learnParticipantIdentitiesForShare:forceUpdate:", v3, 1);

}

- (void)_startShareAccept_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx Start accepting share URL%@");
  OUTLINED_FUNCTION_0();
}

void __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v19 = *(_OWORD *)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 56);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v22 = (id)v19;
    v23 = 2112;
    v24 = v5;
    v25 = 2112;
    v26 = v6;
    v27 = 2112;
    v28 = v7;
    _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx received share access completion - metadata %@, operationError - %@%@", buf, 0x2Au);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
      goto LABEL_5;
    objc_msgSend(v5, "share");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordID");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)WeakRetained + 69);
    *((_QWORD *)WeakRetained + 69) = v14;

    if (*((_QWORD *)WeakRetained + 69))
      goto LABEL_9;
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_2();

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: No operation error and no share id"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_5:
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v6;
        v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to accept share - %@%@", buf, 0x16u);
      }

      v6 = v6;
      v12 = (void *)*((_QWORD *)WeakRetained + 88);
      *((_QWORD *)WeakRetained + 88) = v6;
    }
    else
    {
LABEL_9:
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_1();

      v6 = 0;
    }

    dispatch_group_leave(*((dispatch_group_t *)WeakRetained + 83));
  }

  __brc_leave_section((uint64_t *)&v19);
}

- (void)_openiWorkAppPreemptively_step
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _linkItemID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __63__BRCSharingAcceptFlowOperation__openiWorkAppPreemptively_step__block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "itemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isLive") & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(v3, "isLost") ^ 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;

}

- (void)_locateSharedItemOnOwner_step
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  BRCAccountSessionFPFS *v8;
  BRCItemID *v9;
  BRCClientZone *v10;
  BRCItemID *v11;
  BRCClientZone *v12;
  BRCAccountSessionFPFS *v13;
  _QWORD v14[5];
  BRCAccountSessionFPFS *v15;
  BRCClientZone *v16;
  BRCItemID *v17;

  if (!-[BRCSharingAcceptFlowOperation _isOwner](self, "_isOwner"))
    goto LABEL_3;
  -[BRCClientZone serverZone](self->_clientZone, "serverZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");
  -[BRCAppLibrary defaultClientZone](self->_appLibrary, "defaultClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 & objc_msgSend(v6, "state");

  if ((v7 & 4) == 0)
  {
    v8 = self->_session;
    v9 = self->_linkItemID;
    v10 = self->_clientZone;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke;
    v14[3] = &unk_24FE47B70;
    v14[4] = self;
    v15 = v8;
    v16 = v10;
    v17 = v9;
    v11 = v9;
    v12 = v10;
    v13 = v8;
    -[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:](self, "_createServerFaultIfPossibleWithCompletion:", v14);

  }
  else
  {
LABEL_3:
    -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
  }
}

void __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAcceptShareFailedWithUnderlyingError:", a2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_completeWithError:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "clientDB");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_2;
    block[3] = &unk_24FE3FAD8;
    v11 = *(id *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v12 = v6;
    v13 = v7;
    v14 = v8;
    dispatch_async(v5, block);

  }
}

void __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  objc_msgSend(a1[4], "itemByItemID:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "st");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;

  }
  else
  {
    objc_msgSend(a1[4], "serverItemByItemID:", a1[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentItemIDOnServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
LABEL_5:
      objc_msgSend(a1[6], "_performNextStep");
      goto LABEL_10;
    }
  }
  if ((objc_msgSend(v2, "isOnDisk") & 1) != 0)
    goto LABEL_5;
  objc_msgSend(a1[4], "fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_3;
    v10[3] = &unk_24FE47B70;
    v11 = a1[7];
    v12 = a1[4];
    v8 = a1[5];
    v9 = a1[6];
    v13 = v8;
    v14 = v9;
    objc_msgSend(v7, "addFetchParentChainCompletionBlock:", v10);

  }
  else
  {
    objc_msgSend(a1[6], "_performNextStep");
  }

LABEL_10:
}

void __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_4;
  block[3] = &unk_24FE47B48;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = v3;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 56);
  v13 = v6;
  v14 = v7;
  v8 = v3;
  dispatch_sync(v5, block);

}

void __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "insertParentChainForItem:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_230455000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't insert parent chain for %@ after fetch - %@%@", buf, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 56), "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_126;
  v8[3] = &unk_24FE3FA18;
  v8[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v7, "scheduleFlushWithCheckpoint:whenFlushed:", 0, v8);

}

uint64_t __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_126(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
}

- (void)_waitForSharedItemToSyncDownOnOwner_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx Wait for shared item to sync down%@");
  OUTLINED_FUNCTION_0();
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  _QWORD v5[5];
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2;
  v5[3] = &unk_24FE41910;
  v6 = a2;
  v5[4] = *(_QWORD *)(a1 + 32);
  dispatch_async_with_logs_10(v4, v5);

}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientTruthWorkloop");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_128;
    v14[3] = &unk_24FE3FA18;
    v14[4] = *(_QWORD *)(a1 + 32);
    dispatch_async_with_logs_10(v2, v14);

  }
  else
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2_cold_1();

    v5 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "share");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "brc_sharedRootDisplayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "brc_errorItemNotFound:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "itemIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "brc_errorItemNotFound:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAcceptShareFailedWithUnderlyingError:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_completeWithError:", v11);

    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 592);
    *(_QWORD *)(v12 + 592) = 0;

  }
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_128(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "itemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileObjectID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 592);
  *(_QWORD *)(v4 + 592) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2_129;
  v7[3] = &unk_24FE3FA18;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "scheduleFlushWithCheckpoint:whenFlushed:", 0, v7);

}

uint64_t __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2_129(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
}

- (void)_waitForSharedItemToBeOnDiskOnOwner_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx Wait for item to be on disk%@");
  OUTLINED_FUNCTION_0();
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 592);
      *(_DWORD *)buf = 138412802;
      v18 = v9;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't get user visible file on %@ - %@%@", buf, 0x20u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientDB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serialQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_130;
  v14[3] = &unk_24FE3FA40;
  v12 = *(_QWORD *)(a1 + 32);
  v15 = v5;
  v16 = v12;
  v13 = v5;
  dispatch_async_with_logs_10(v11, v14);

}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_130(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 648), v2);
    objc_msgSend(*(id *)(a1 + 40), "callbackQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_2;
    v11[3] = &unk_24FE3FA18;
    v11[4] = *(_QWORD *)(a1 + 40);
    dispatch_async_with_logs_10(v3, v11);

  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 560), "share");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "brc_sharedRootDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "brc_errorItemNotFound:", v6);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 576), "itemIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "brc_errorItemNotFound:", v7);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v8 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAcceptShareFailedWithUnderlyingError:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_completeWithError:", v9);

  }
}

uint64_t __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
}

- (void)_createSideFaultOnDisk_step
{
  NSObject *v3;
  _QWORD block[5];

  -[BRCAccountSessionFPFS clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_async(v3, block);

}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  dispatch_group_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  _QWORD v15[5];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22[3];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 544))
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_1();

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v2 + 560))
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_2();

  }
  memset(v22, 0, sizeof(v22));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _createSideFaultOnDisk_step]_block_invoke", 1385, v22);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_1();

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v5 = dispatch_group_create();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131;
  v15[3] = &unk_24FE47BC0;
  v15[4] = *(_QWORD *)(a1 + 32);
  v17 = &v18;
  v8 = v5;
  v16 = v8;
  objc_msgSend(v6, "groupInBatch:", v15);

  if (!*((_BYTE *)v19 + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientTruthWorkloop");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_144;
    block[3] = &unk_24FE3FA18;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_group_notify(v8, v9, block);

  }
  _Block_object_dispose(&v18, 8);
  __brc_leave_section(v22);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  id *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  BRCShareAcceptationDocumentFault *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  BRCShareAcceptationDocumentFault *v37;
  void *v38;
  BRCShareAcceptationDirectoryFault *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  __objc2_class *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  BRCShareAcceptationDirectoryFault *v76;
  id v77;
  _QWORD block[5];

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 576);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 584);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "itemByItemID:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "_isLinkInsideFolderShare") & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "itemByItemID:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 672);
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 680);
  v9 = v8;
  if (v4)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131_cold_7((uint64_t)v4);

    if (objc_msgSend(v4, "isLive"))
    {
      objc_msgSend(v4, "fileObjectID");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 592);
      *(_QWORD *)(v13 + 592) = v12;

    }
    else
    {
      if (objc_msgSend(v4, "isAlmostDead"))
      {
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131_cold_5((uint64_t)v4);

        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BDD1128], 35, CFSTR("Share %@ can not be accepted right now."), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v22);
      }
      else
      {
        v27 = v9;
        v28 = *(void **)(a1 + 32);
        brc_bread_crumbs();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
          __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131_cold_6((uint64_t)v4);

        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: item is in an unknown state: %@:"), v4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_completeWithError:", v22);
        v9 = v27;
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    goto LABEL_57;
  }
  v77 = v8;
  v15 = objc_msgSend(*(id *)(a1 + 32), "_isOwner");
  v16 = *(id **)(a1 + 32);
  if (!v15)
  {
    v74 = v6;
    v75 = v7;
    objc_msgSend(v16[77], "recreateDocumentsFolderIfNeededInDB");
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "participantPermission") == 2)
      v23 = 100;
    else
      v23 = 68;
    v73 = v3;
    if (objc_msgSend(*(id *)(a1 + 32), "_isFolderShare"))
    {
      v9 = v77;
      if ((objc_msgSend(*(id *)(a1 + 32), "_isLinkInsideFolderShare") & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v3, 1, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "beginObservingChangesWithDelegate:", 0);

      }
      v25 = *(NSObject **)(a1 + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "serverTruthWorkloop");
      v26 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_138;
      block[3] = &unk_24FE3FA18;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_group_async(v25, v26, block);

      if (v6)
      {
        v76 = 0;
      }
      else
      {
        v39 = [BRCShareAcceptationDirectoryFault alloc];
        v40 = *(_QWORD *)(a1 + 32);
        v41 = *(_QWORD *)(v40 + 616);
        objc_msgSend(*(id *)(v40 + 608), "asSharedClientZone");
        v42 = v3;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = -[BRCShareAcceptationDirectoryFault initWithFilename:itemID:parentIDWhenSubitem:appLibrary:clientZone:sharingOptions:](v39, "initWithFilename:itemID:parentIDWhenSubitem:appLibrary:clientZone:sharingOptions:", v75, v42, 0, v41, v43, v23);

        v3 = v42;
        v9 = v77;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "_isLinkInsideFolderShare"))
      {
        v44 = v23 & 0x60;
        if (objc_msgSend(*(id *)(a1 + 32), "_isDocumentLinkInsideFolderShare"))
        {
          v45 = BRCShareAcceptationDocumentFault;
        }
        else
        {
          if (!objc_msgSend(*(id *)(a1 + 32), "_isDirectoryLinkInsideFolderShare"))
          {
            v69 = *(void **)(a1 + 32);
            brc_bread_crumbs();
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
              __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131_cold_4();

            objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: item isn't a document or directory"));
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "_completeWithError:", v72);

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_56;
          }
          v45 = BRCShareAcceptationDirectoryFault;
        }
        v46 = [v45 alloc];
        v47 = *(_QWORD *)(a1 + 32);
        v48 = *(_QWORD *)(v47 + 616);
        objc_msgSend(*(id *)(v47 + 608), "asSharedClientZone");
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v3;
        v51 = (void *)v49;
        v38 = (void *)objc_msgSend(v46, "initWithFilename:itemID:parentIDWhenSubitem:appLibrary:clientZone:sharingOptions:", v9, v2, v50, v48, v49, v44);

      }
      else
      {
        v38 = 0;
      }
      v37 = (BRCShareAcceptationDocumentFault *)v76;
    }
    else
    {
      v31 = [BRCShareAcceptationDocumentFault alloc];
      v32 = *(_QWORD *)(a1 + 32);
      v33 = *(_QWORD *)(v32 + 616);
      objc_msgSend(*(id *)(v32 + 608), "asSharedClientZone");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v3;
      v36 = (void *)v34;
      v37 = -[BRCShareAcceptationDocumentFault initWithFilename:itemID:parentIDWhenSubitem:appLibrary:clientZone:sharingOptions:](v31, "initWithFilename:itemID:parentIDWhenSubitem:appLibrary:clientZone:sharingOptions:", v75, v35, 0, v33, v34, v23);

      v38 = 0;
    }
    v76 = (BRCShareAcceptationDirectoryFault *)v37;
    -[BRCLocalItem parentClientZone](v37, "parentClientZone");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem st](v37, "st");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "parentID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem st](v37, "st");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "logicalName");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "itemByParentID:andLogicalName:", v54, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v57, "itemID");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalItem itemID](v76, "itemID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqualToItemID:", v59);

      if ((v60 & 1) == 0)
      {
        if ((objc_msgSend(v57, "isDead") & 1) != 0 || -[BRCLocalItem isOwnedByMe](v76, "isOwnedByMe"))
        {
          objc_msgSend(v57, "markBouncedToNextAvailableBounceNumber:", 506);
          objc_msgSend(v57, "saveToDB");
        }
        else
        {
          -[BRCLocalItem markBouncedToNextAvailableBounceNumber:](v76, "markBouncedToNextAvailableBounceNumber:", 507);
        }
      }
    }
    -[BRCLocalItem saveToDBForServerEdit:keepAliases:](v76, "saveToDBForServerEdit:keepAliases:", 1, 0);
    objc_msgSend(v38, "saveToDBForServerEdit:keepAliases:", 1, 0);
    objc_msgSend(v38, "fileObjectID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (!v61)
    {
      -[BRCLocalItem fileObjectID](v76, "fileObjectID");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 592), v62);
    v9 = v77;
    if (!v61)

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientDB");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "flush");

    brc_bread_crumbs();
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131_cold_3((uint64_t)v76);

    if (v38)
    {
      brc_bread_crumbs();
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131_cold_2((uint64_t)v38);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientDB");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "flushToMakeEditsVisibleToIPCReaders");

    v3 = v73;
LABEL_56:
    v6 = v74;

    v7 = v75;
    goto LABEL_57;
  }
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131_cold_1();

  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: document doesn't exists anymore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_completeWithError:", v19);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v9 = v77;
LABEL_57:

}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_138(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "serverZone");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clearStateBits:", 4);

}

uint64_t __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_144(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
}

- (void)_checkIfShouldWaitUntilDownloadCompletion_step
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] _checkIfShouldWaitUntilDownloadCompletion is not relevant in FPFS.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_openSharedSideFaultFileWithAppID:(id)a3
{
  id v4;
  void *v5;
  NSURL *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  NSURL *v12;
  id v13;
  id v14;

  v4 = a3;
  -[CKRecordID recordName](self->_shareID, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_liveFileURL;
  v7 = -[NSURL startAccessingSecurityScopedResource](self->_liveFileURL, "startAccessingSecurityScopedResource");
  if (self->_skipOpenInApp)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCSharingAcceptFlowOperation _openSharedSideFaultFileWithAppID:].cold.1();

    -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
  }
  else
  {
    v10 = v7;
    v11 = MEMORY[0x24BDAC760];
    v12 = v6;
    v13 = v4;
    v14 = v5;
    FPExtendBookmarkForDocumentURL();
    if (v10)
      -[NSURL stopAccessingSecurityScopedResource](self->_liveFileURL, "stopAccessingSecurityScopedResource", v11, 3221225472, __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke, &unk_24FE47BE8, v12, self, v13, v14);

  }
}

void __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v5;
      v25 = 2112;
      v26 = v20;
      v27 = 2112;
      v28 = v6;
      _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] Got bookmark string %@ for URL %@%@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDC1500];
    v21[0] = *MEMORY[0x24BDC14D8];
    v21[1] = v9;
    v22[0] = v5;
    v22[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_2(a1, (uint64_t)v11, v12);

    objc_msgSend(v8, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), BRCurrentPersonaIsDataSeparated(), 0, v10, 0, *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addSubOperation:", v13);

  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BE17300];
    if (a3)
    {
      v29 = *MEMORY[0x24BDD1398];
      v30[0] = a3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = (void *)MEMORY[0x24BDBD1B8];
    }
    objc_msgSend(*(id *)(a1 + 32), "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "br_errorWithDomain:code:userInfo:description:", v15, 10, v16, CFSTR("Can't get bookmark string at %@"), v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_1((id *)(a1 + 32), (uint64_t)v18, v19);

    objc_msgSend(*(id *)(a1 + 40), "_completeWithError:", v8);
  }

}

- (void)_openDocumentInDocumentsAppIfInstalled:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  BRCUserNotifier *userNotification;
  NSURL *shareURL;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  if (self->_skipOpenInApp)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCSharingAcceptFlowOperation _openSharedSideFaultFileWithAppID:].cold.1();

    -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", CFSTR("com.apple.DocumentsApp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isInstalled");

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
      objc_msgSend(v11, "setScheme:", CFSTR("shareddocuments"));
      objc_msgSend(v11, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v10, "openSensitiveURL:withOptions:error:", v12, 0, &v18);
      v13 = v18;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAcceptShareFailedWithUnderlyingError:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCSharingAcceptFlowOperation _completeWithError:](self, "_completeWithError:", v14);

      }
      else
      {
        -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
      }

    }
    else
    {
      userNotification = self->_userNotification;
      shareURL = self->_shareURL;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __72__BRCSharingAcceptFlowOperation__openDocumentInDocumentsAppIfInstalled___block_invoke;
      v17[3] = &unk_24FE3FA18;
      v17[4] = self;
      -[BRCUserNotifier showErrorDocumentsAppNotVisibleForShareURL:reply:](userNotification, "showErrorDocumentsAppNotVisibleForShareURL:reply:", shareURL, v17);
    }

  }
}

uint64_t __72__BRCSharingAcceptFlowOperation__openDocumentInDocumentsAppIfInstalled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
}

- (void)_openSharedSideFaultFile_step
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _liveFileURL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_finishShareAccept_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx Waiting for share accept to finish%@");
  OUTLINED_FUNCTION_0();
}

void __56__BRCSharingAcceptFlowOperation__finishShareAccept_step__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 704);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __56__BRCSharingAcceptFlowOperation__finishShareAccept_step__block_invoke_cold_1((uint64_t)v2);

  if ((objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 3) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 4) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 29) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 32) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 11) & 1) != 0
    || objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 10))
  {
    objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v2);
    goto LABEL_10;
  }
  if (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 9))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorLoggedOut");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v8 = (void *)v6;
    objc_msgSend(v5, "_completeWithError:", v6);

    goto LABEL_10;
  }
  v7 = *(void **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(v7, "_performNextStep");
    goto LABEL_10;
  }
  if ((objc_msgSend(v7, "finishIfCancelled") & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAcceptShareFailedWithUnderlyingError:", v2);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
LABEL_10:

}

- (void)_createServerFaultIfPossibleWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  uint64_t v15[3];

  v4 = a3;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:]", 1844, v15);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:].cold.3();

  if (!self->_clientZone)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:].cold.2();

  }
  if (!self->_linkItemID)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _openiWorkAppPreemptively_step].cold.1();

  }
  if (self->_allowsDirectoryFaults)
  {
    -[BRCClientZone db](self->_clientZone, "db");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke;
    block[3] = &unk_24FE409B8;
    block[4] = self;
    v14 = v4;
    dispatch_async(v8, block);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }
  __brc_leave_section(v15);

}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  int v30;
  id *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *, void *);
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "serverItemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_performNextStep");
    return;
  }
  v4 = objc_msgSend(v3, "_isDocumentLinkInsideFolderShare");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "sharedItemHierarchyIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v4)
    v7 = 2;
  else
    v7 = 1;

  if (v6 <= v7)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_isOwner")
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "isEqualToItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 584)) & 1) == 0&& (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "serverItemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 584)), v33 = (void *)objc_claimAutoreleasedReturnValue(), v33, v33))
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_2();

      objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
      return;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "serverZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "rootRecordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v11 = -[BRCFetchRecordSubResourcesOperation initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:]([BRCFetchRecordSubResourcesOperation alloc], "initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:", v8, *(_QWORD *)(a1 + 32), 0, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(v10, "addObject:", v9);
  objc_msgSend(v10, "addObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552));
  objc_msgSend(v9, "recordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "hasPrefix:", CFSTR("documentContent/")))
    goto LABEL_10;
  v13 = objc_msgSend(v8, "isPrivateZone");

  if (v13)
  {
    objc_msgSend(v9, "recordName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "substringFromIndex:", objc_msgSend(CFSTR("documentContent/"), "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("documentStructure/"), "stringByAppendingString:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x24BDB91E8]);
    objc_msgSend(v9, "zoneID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithRecordName:zoneID:", v15, v17);

    objc_msgSend(v10, "addObject:", v18);
LABEL_10:

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "sharedItemHierarchyIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v45 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v21);
  }

  if (!v9)
  {
    brc_bread_crumbs();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_1();

  }
  v24 = objc_alloc(MEMORY[0x24BDB90E8]);
  objc_msgSend(v10, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithRecordIDs:", v25);

  objc_msgSend(MEMORY[0x24BDB91D8], "desiredKeysWithMask:", 185);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDesiredKeys:", v27);

  objc_msgSend(v26, "setShouldFetchAssetContent:", 0);
  objc_msgSend(v11, "callbackQueue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCallbackQueue:", v28);

  v38 = MEMORY[0x24BDAC760];
  v39 = 3221225472;
  v40 = __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_161;
  v41 = &unk_24FE439C8;
  v43 = *(id *)(a1 + 40);
  v29 = v11;
  v42 = v29;
  objc_msgSend(v26, "setFetchRecordsCompletionBlock:", &v38);
  v30 = objc_msgSend(v8, "isPrivateZone", v38, v39, v40, v41);
  v31 = *(id **)(a1 + 32);
  if (v30)
  {
    objc_msgSend(v31[77], "transferSyncContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubOperation:overrideContext:allowsCellularAccess:", v26, v32, 0);

  }
  else
  {
    objc_msgSend(v31, "addSubOperation:", v26);
  }

}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_161(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_161_cold_1((uint64_t)v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(a2, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(a1 + 32), "addRecord:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_162;
    v14[3] = &unk_24FE409B8;
    v15 = v13;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v15, "notifyWhenRecordsAreFetchedAndFinish:", v14);

  }
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_162(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_162_cold_2();

  v4 = objc_msgSend(*(id *)(a1 + 32), "saveRecordsWithQueryCursor:", 0);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
    {
      (*(void (**)(_QWORD, _QWORD))(v6 + 16))(*(_QWORD *)(a1 + 40), 0);
      return;
    }
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_162_cold_1();

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: couldn't save to server truth when creating server fault"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);

}

- (void)_locateSharedItemOnRecipient_step
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v8[5];

  if (-[BRCSharingAcceptFlowOperation _isOwner](self, "_isOwner"))
    goto LABEL_3;
  -[BRCClientZone serverZone](self->_clientZone, "serverZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");
  -[BRCAppLibrary defaultClientZone](self->_appLibrary, "defaultClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 & objc_msgSend(v6, "state");

  if ((v7 & 4) != 0)
  {
LABEL_3:
    -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke;
    v8[3] = &unk_24FE3F6A0;
    v8[4] = self;
    -[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:](self, "_createServerFaultIfPossibleWithCompletion:", v8);
  }
}

void __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientTruthWorkloop");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_2;
  block[3] = &unk_24FE3FA18;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "serverItemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "serverAliasItemForSharedItem:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(id **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v4, "_performNextStep");
    }
    else
    {
      objc_msgSend(v4[77], "defaultClientZone");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "itemGlobalID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serverZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCItemID shareAliasRecordIDFromTargetItemID:zone:hasDerivedShareAlias:](BRCItemID, "shareAliasRecordIDFromTargetItemID:zone:hasDerivedShareAlias:", v8, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "locateRecordIfNecessaryForRecordID:isUserWaiting:", v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_167;
        v14[3] = &unk_24FE406A8;
        v12 = v10;
        v13 = *(_QWORD *)(a1 + 32);
        v15 = v12;
        v16 = v13;
        objc_msgSend(v11, "addLocateRecordCompletionBlock:", v14);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
      }

    }
  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_230455000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't create a directory fault%@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
  }

}

void __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_167(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("fail");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138413058;
    if (a2)
      v8 = CFSTR("success");
    v11 = v9;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_INFO, "[INFO] Fetch share alias for share alias record ID [%@]: %@ with error %@%@", (uint8_t *)&v10, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 40), "_performNextStep");
}

- (void)_waitForSharedItemToSyncDownOnRecipient_step
{
  void *v3;
  NSObject *v4;
  BRCClientZone *clientZone;
  _QWORD v6[5];
  uint64_t v7[3];

  memset(v7, 0, sizeof(v7));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _waitForSharedItemToSyncDownOnRecipient_step]", 1964, v7);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BRCSharingAcceptFlowOperation _waitForSharedItemToSyncDownOnOwner_step].cold.1();

  if (-[BRCSharingAcceptFlowOperation _isOwner](self, "_isOwner"))
  {
    -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
  }
  else
  {
    clientZone = self->_clientZone;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke;
    v6[3] = &unk_24FE46FF8;
    v6[4] = self;
    -[BRCClientZone performBlock:whenSyncDownCompletesLookingForItemID:](clientZone, "performBlock:whenSyncDownCompletesLookingForItemID:", v6, self->_linkItemID);
    -[BRCSharingAcceptFlowOperation _activateSharedZoneIfNeeded](self, "_activateSharedZoneIfNeeded");
  }
  __brc_leave_section(v7);
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  _QWORD v5[5];
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2;
  v5[3] = &unk_24FE41910;
  v6 = a2;
  v5[4] = *(_QWORD *)(a1 + 32);
  dispatch_async_with_logs_10(v4, v5);

}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientTruthWorkloop");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_172;
    v14[3] = &unk_24FE3FA18;
    v14[4] = *(_QWORD *)(a1 + 32);
    dispatch_async_with_logs_10(v2, v14);

  }
  else
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
      __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2_cold_1();

    v5 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "share");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "brc_sharedRootDisplayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "brc_errorItemNotFound:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "itemIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "brc_errorItemNotFound:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAcceptShareFailedWithUnderlyingError:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_completeWithError:", v11);

    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 592);
    *(_QWORD *)(v12 + 592) = 0;

  }
}

uint64_t __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_172(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "itemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileObjectID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 592);
  *(_QWORD *)(v4 + 592) = v3;

  return objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
}

- (void)_waitForSharedItemToBeOnDiskOnRecipient_step
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _linkFileObjectID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 592);
      *(_DWORD *)buf = 138412802;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't get user visible file on %@ - %@%@", buf, 0x20u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientTruthWorkloop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke_173;
  v8[3] = &unk_24FE3FA18;
  v8[4] = *(_QWORD *)(a1 + 32);
  dispatch_async_with_logs_10(v7, v8);

}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke_173(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 648))
  {
    objc_msgSend((id)v2, "_performNextStep");
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(*(id *)(v2 + 560), "share");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "brc_sharedRootDisplayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "brc_errorItemNotFound:", v5);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "itemIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "brc_errorItemNotFound:", v6);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAcceptShareFailedWithUnderlyingError:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_completeWithError:", v8);

  }
}

- (void)_locateSharedItemOnDisk_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx Locate shared folder on disk%@");
  OUTLINED_FUNCTION_0();
}

void __61__BRCSharingAcceptFlowOperation__locateSharedItemOnDisk_step__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "itemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isOnDisk") & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientDB");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "flushToMakeEditsVisibleToIPCReaders");

    v4 = *(void **)(a1 + 32);
    objc_msgSend(v2, "fileObjectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __61__BRCSharingAcceptFlowOperation__locateSharedItemOnDisk_step__block_invoke_174;
    v15[3] = &unk_24FE3F6A0;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "_fetchOpenInfoOnFileObjectID:completion:", v5, v15);
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576);
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ wasn't able to be found on disk.  We must have reset or be broken structure or it was deleted locally.%@", buf, 0x16u);
    }

    v9 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "share");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "brc_sharedRootDisplayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v9, "brc_errorItemNotFound:", v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "itemIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "brc_errorItemNotFound:", v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAcceptShareFailedWithUnderlyingError:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_completeWithError:", v14);

  }
}

void __61__BRCSharingAcceptFlowOperation__locateSharedItemOnDisk_step__block_invoke_174(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAcceptShareFailedWithUnderlyingError:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_completeWithError:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
  }
}

- (void)_prepareToDownloadSharedDocument_step
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Going to download a dataless item that is already accepted%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_setSpotlightAttribute_step
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] _setSpotlightAttribute is not relevant in FPFS%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_openSharedItemIfStillNeeded_step
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11[3];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!self->_liveFileURL)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _openSharedSideFaultFile_step].cold.2();

  }
  memset(v11, 0, sizeof(v11));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _openSharedItemIfStillNeeded_step]", 2223, v11);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = v11[0];
    -[NSURL path](self->_liveFileURL, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_230455000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Open shared document if still needed at %@%@", buf, 0x20u);

  }
  if (!self->_liveFileURL)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInvalidParameter:value:", CFSTR("_liveFileURL"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorAcceptShareFailedWithUnderlyingError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSharingAcceptFlowOperation _completeWithError:](self, "_completeWithError:", v6);

LABEL_11:
    goto LABEL_12;
  }
  if (-[BRCSharingAcceptFlowOperation _isFolderShare](self, "_isFolderShare"))
  {
    -[NSURL brc_applicationContainerID](self->_shareURL, "brc_applicationContainerID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[BRCSharingAcceptFlowOperation _openSharedSideFaultFileWithAppID:](self, "_openSharedSideFaultFileWithAppID:", v5);
    else
      -[BRCSharingAcceptFlowOperation _openDocumentInDocumentsAppIfInstalled:](self, "_openDocumentInDocumentsAppIfInstalled:", self->_liveFileURL);
    goto LABEL_11;
  }
  -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
LABEL_12:
  __brc_leave_section(v11);
}

- (void)_endAcceptationFlow_step
{
  -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", self->_liveFileURL, 0);
}

+ (id)_runningShareIDs
{
  if (_runningShareIDs_onceToken != -1)
    dispatch_once(&_runningShareIDs_onceToken, &__block_literal_global_50);
  return (id)_runningShareIDs_ret;
}

void __49__BRCSharingAcceptFlowOperation__runningShareIDs__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_runningShareIDs_ret;
  _runningShareIDs_ret = v0;

}

- (BOOL)skipOpenInApp
{
  return self->_skipOpenInApp;
}

- (void)setSkipOpenInApp:(BOOL)a3
{
  self->_skipOpenInApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareAcceptationError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_linkFilename, 0);
  objc_storeStrong((id *)&self->_rootFilename, 0);
  objc_storeStrong((id *)&self->_shareAcceptGroup, 0);
  objc_storeStrong((id *)&self->_liveFileURL, 0);
  objc_storeStrong((id *)&self->_acceptOperation, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_unsaltedBookmarkData, 0);
  objc_storeStrong((id *)&self->_linkFileObjectID, 0);
  objc_storeStrong((id *)&self->_rootItemID, 0);
  objc_storeStrong((id *)&self->_linkItemID, 0);
  objc_storeStrong((id *)&self->_linkItemRecordID, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_acceptationFlow, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_userActionsNavigator, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
}

- (void)_completeWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] network is unreachable, replacing error with generic network error%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_completeWithError:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_230455000, v1, v2, "[ERROR] failing share acceptation with %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_completeWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _shareMetadata%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_completeWithError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: error.underlyingErrors.count == 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_completeWithError:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: error _completeWithError must be called only in case we should complete with an error%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] fallback to iCloud Web with reason: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self->_shareURL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !(goToAppStore && openWebPreview)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_34_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !(goToSettings && openWebPreview)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)finishWithResult:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Session is not cancelled but DBs serial queue is nil!%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)finishWithResult:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.cancelled || _hadProcessedCompletionError completedWithResult:error: called with error directly. Should call _completeWithError: instead.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] delete share acceptation fault because operation failed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_isiWorkShare
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _shareURL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)openResourceOperationDidComplete:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Open application completed successfully%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)openResourceOperation:(uint64_t)a1 didFailWithError:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_230455000, v1, v2, "[ERROR] Failed to open the target app - %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] accept operation completed with success%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: No operation error and no share id%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: %@ wasn't found after syncing down on the owner%@");
  OUTLINED_FUNCTION_0();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx Preparing side fault%@");
  OUTLINED_FUNCTION_0();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self->_shareMetadata%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: document doesn't exists anymore%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] created link shared item-to-be in db: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131_cold_3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] created shared item-to-be in db: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: item isn't a document or directory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131_cold_5(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] share item %@ is in transient state, should try again later%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131_cold_6(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v1, v2, "[CRIT] UNREACHABLE: item is in an unknown state: %@:%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_131_cold_7(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] found share item %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_openSharedSideFaultFileWithAppID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Skipping open in app%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_230455000, a3, v5, "[ERROR] can't get bookmark string at %@%@", v6);

  OUTLINED_FUNCTION_6();
}

void __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  v8 = 2112;
  v9 = v6;
  v10 = 2112;
  v11 = a2;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] doing open operation on \"%@\" with \"%@\"%@", v7, 0x20u);

}

void __56__BRCSharingAcceptFlowOperation__finishShareAccept_step__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Share accept finished with error %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_createServerFaultIfPossibleWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _clientZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_createServerFaultIfPossibleWithCompletion:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx Creating server fault if possible%@");
  OUTLINED_FUNCTION_0();
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: rootRecordID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] We don't have need to fetch deeply into the folder. Letting the list directory take care of fetching%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_161_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Failed to fetch record for server fault - %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_162_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: couldn't save to server truth when creating server fault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_162_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Finished fetching records for server fault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] %@ wasn't found after syncing down%@");
  OUTLINED_FUNCTION_0();
}

@end
