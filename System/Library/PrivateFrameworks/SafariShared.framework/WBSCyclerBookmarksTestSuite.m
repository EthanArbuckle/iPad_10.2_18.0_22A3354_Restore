@implementation WBSCyclerBookmarksTestSuite

- (WBSCyclerBookmarksTestSuite)init
{
  WBSCyclerBookmarksTestSuite *v2;
  WBSCyclerOperationContext *v3;
  WBSCyclerOperationContext *operationContext;
  WBSCyclerTestSuiteBookmarkAuxiliary *v5;
  WBSCyclerTestSuiteBookmarkAuxiliary *bookmarkAuxiliary;
  WBSCyclerBookmarksTestSuite *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSCyclerBookmarksTestSuite;
  v2 = -[WBSCyclerBookmarksTestSuite init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(WBSCyclerOperationContext);
    operationContext = v2->_operationContext;
    v2->_operationContext = v3;

    v5 = objc_alloc_init(WBSCyclerTestSuiteBookmarkAuxiliary);
    bookmarkAuxiliary = v2->_bookmarkAuxiliary;
    v2->_bookmarkAuxiliary = v5;

    v7 = v2;
  }

  return v2;
}

- (NSArray)operations
{
  if (operations_onceToken != -1)
    dispatch_once(&operations_onceToken, &__block_literal_global_33);
  return (NSArray *)(id)operations_operations;
}

void __41__WBSCyclerBookmarksTestSuite_operations__block_invoke()
{
  WBSCyclerCreateBookmarkOperation *v0;
  WBSCyclerDeleteBookmarkOperation *v1;
  WBSCyclerMoveBookmarkOperation *v2;
  WBSCyclerModifyBookmarkOperation *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(WBSCyclerCreateBookmarkOperation);
  v6[0] = v0;
  v1 = objc_alloc_init(WBSCyclerDeleteBookmarkOperation);
  v6[1] = v1;
  v2 = objc_alloc_init(WBSCyclerMoveBookmarkOperation);
  v6[2] = v2;
  v3 = objc_alloc_init(WBSCyclerModifyBookmarkOperation);
  v6[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)operations_operations;
  operations_operations = v4;

}

- (id)relativeProbabilitiesForOperationsWithTopLevelItem:(id)a3
{
  if (relativeProbabilitiesForOperationsWithTopLevelItem__onceToken != -1)
    dispatch_once(&relativeProbabilitiesForOperationsWithTopLevelItem__onceToken, &__block_literal_global_8_0);
  return (id)relativeProbabilitiesForOperationsWithTopLevelItem__relativeProbabilitiesForOperations;
}

void __82__WBSCyclerBookmarksTestSuite_relativeProbabilitiesForOperationsWithTopLevelItem___block_invoke()
{
  void *v0;

  v0 = (void *)relativeProbabilitiesForOperationsWithTopLevelItem__relativeProbabilitiesForOperations;
  relativeProbabilitiesForOperationsWithTopLevelItem__relativeProbabilitiesForOperations = (uint64_t)&unk_1E4B87628;

}

- (void)setUp
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, "Blocking automatic migration in the sync agent", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_cloudBookmarksDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBool:forKey:", 1, *MEMORY[0x1E0D89FB8]);

}

- (void)tearDown
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, "Unblocking automatic migration in the sync agent", v4, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_cloudBookmarksDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBool:forKey:", 0, *MEMORY[0x1E0D89FB8]);

}

- (void)runWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  WBSCyclerTestSuiteBookmarkAuxiliary *bookmarkAuxiliary;
  NSObject *v10;
  WBSCyclerIterationCounter *iterationCounter;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[WBSCyclerTestSuiteBookmarkAuxiliary hasPerformedOperation:](self->_bookmarkAuxiliary, "hasPerformedOperation:", 0))
  {
    if (shouldRunInCloudKitMode)
    {
      v22 = CFSTR("forCloudKitTest");
      v23[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    -[WBSCyclerTestSuiteBookmarkAuxiliary performOperation:withTarget:options:completionHandler:](self->_bookmarkAuxiliary, "performOperation:withTarget:options:completionHandler:", 0, v6, v13, v7);

    goto LABEL_17;
  }
  if (shouldRunInCloudKitMode)
  {
    v8 = -[WBSCyclerTestSuiteBookmarkAuxiliary hasPerformedOperation:](self->_bookmarkAuxiliary, "hasPerformedOperation:", 1);
    bookmarkAuxiliary = self->_bookmarkAuxiliary;
    if (v8)
    {
      if (-[WBSCyclerTestSuiteBookmarkAuxiliary hasPerformedOperation:](bookmarkAuxiliary, "hasPerformedOperation:", 3))
      {
        goto LABEL_5;
      }
      bookmarkAuxiliary = self->_bookmarkAuxiliary;
      v14 = 3;
    }
    else
    {
      v14 = 1;
    }
    -[WBSCyclerTestSuiteBookmarkAuxiliary performOperation:withTarget:completionHandler:](bookmarkAuxiliary, "performOperation:withTarget:completionHandler:", v14, v6, v7);
    goto LABEL_17;
  }
LABEL_5:
  -[WBSCyclerIterationCounter incrementIterationCount](self->_iterationCounter, "incrementIterationCount");
  v10 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    iterationCounter = self->_iterationCounter;
    v12 = v10;
    *(_DWORD *)buf = 134218240;
    v19 = -[WBSCyclerIterationCounter iterationCount](iterationCounter, "iterationCount");
    v20 = 2048;
    v21 = +[WBSCyclerRandomnessUtilities seed](WBSCyclerRandomnessUtilities, "seed");
    _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_DEFAULT, "Beginning iteration %lu with seed %lu", buf, 0x16u);

  }
  if (__ROR8__(0x8F5C28F5C28F5C29 * -[WBSCyclerIterationCounter iterationCount](self->_iterationCounter, "iterationCount"), 2) <= 0x28F5C28F5C28F5CuLL)
  {
    -[WBSCyclerBookmarksTestSuite _validateServerBookmarksWithTarget:completionHandler:](self, "_validateServerBookmarksWithTarget:completionHandler:", v6, v7);
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke;
    v15[3] = &unk_1E4B38690;
    v15[4] = self;
    v16 = v6;
    v17 = v7;
    objc_msgSend(v16, "fetchTopLevelBookmarkList:", v15);

  }
LABEL_17:

}

void __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setTestTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setTopLevelItem:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setTitlePrefix:", bookmarkTitlePrefix);
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
LABEL_10:
    objc_msgSend(v3, "randomProfileDescendant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setTabGroupsParent:", v5);
    objc_msgSend(*(id *)(a1 + 32), "operations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "relativeProbabilitiesForOperationsWithTopLevelItem:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSCyclerRandomnessUtilities randomElementOfArray:relativeProbabilities:](WBSCyclerRandomnessUtilities, "randomElementOfArray:relativeProbabilities:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(v10 + 8);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_14;
    v12[3] = &unk_1E4B38668;
    v12[4] = v10;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v9, "executeWithContext:completionHandler:", v11, v12);

    goto LABEL_11;
  }
  v4 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_cold_3();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "validateBookmarks:expectingBookmarks:context:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_cold_1();
    goto LABEL_10;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_cold_2();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_11:

}

void __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v4;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(v7 + 8);
  v9 = *(void **)(v7 + 16);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_2;
  v11[3] = &unk_1E4B2B8A0;
  v12 = v8;
  objc_msgSend(v9, "fetchAndValidateBookmarksWithExpectedBookmarks:context:completionHandler:", v3, v10, v11);

}

uint64_t __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)canHandleRequest:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("validate-server"));
}

- (void)handleRequest:(id)a3 withTarget:(id)a4 completionHandler:(id)a5
{
  -[WBSCyclerBookmarksTestSuite _validateServerBookmarksWithTarget:completionHandler:](self, "_validateServerBookmarksWithTarget:completionHandler:", a4, a5);
}

+ (BOOL)setValue:(id)a3 forConfigurationKey:(id)a4
{
  __CFString *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  const __CFString *v11;
  const char *v12;
  const __CFString *v13;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("bookmark-prefix")))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v15 = 138543362;
      v16 = v6;
      _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "Bookmark prefix set to %{public}@", (uint8_t *)&v15, 0xCu);
    }
    objc_storeStrong((id *)&bookmarkTitlePrefix, a3);
    v9 = 1;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("enable-cloudkit")))
  {
    shouldRunInCloudKitMode = -[__CFString BOOLValue](v6, "BOOLValue");
    v10 = WBS_LOG_CHANNEL_PREFIXCycler();
    v9 = 1;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    if (shouldRunInCloudKitMode)
      v11 = CFSTR("enabled");
    else
      v11 = CFSTR("disabled");
    v15 = 138543362;
    v16 = v11;
    v12 = "CloudKit mode %{public}@";
LABEL_17:
    _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v15, 0xCu);
    goto LABEL_19;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("enable-secondary-migration")))
  {
    v9 = 0;
    goto LABEL_19;
  }
  shouldSyncDownUsingSecondaryMigration = -[__CFString BOOLValue](v6, "BOOLValue");
  v10 = WBS_LOG_CHANNEL_PREFIXCycler();
  v9 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (shouldSyncDownUsingSecondaryMigration)
      v13 = CFSTR("enabled");
    else
      v13 = CFSTR("disabled");
    v15 = 138543362;
    v16 = v13;
    v12 = "CloudKit secondary migration sync down %{public}@";
    goto LABEL_17;
  }
LABEL_19:

  return v9;
}

- (void)_validateServerBookmarksWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_DEFAULT, "Validating server bookmarks", buf, 2u);
  }
  v9 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_INFO, "Performing initial sync before syncing down server bookmarks", buf, 2u);
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_completionHandler___block_invoke;
  v12[3] = &unk_1E4B386B8;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v10, "syncBookmarksWithCompletionHandler:", v12);

}

void __84__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  switch(a2)
  {
    case 2:
      v6 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Bookmark sync is disabled; skipping validation of server bookmarks",
          v7,
          2u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "_validateServerBookmarksAfterInitialSyncWithTarget:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      break;
    case 0:
      v3 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __84__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_completionHandler___block_invoke_cold_1();
      v4 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "_errorWithCode:userInfo:", 1, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

      break;
  }
}

- (void)_validateServerBookmarksAfterInitialSyncWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "Saving off initial bookmarks before server bookmark validation", buf, 2u);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __100__WBSCyclerBookmarksTestSuite__validateServerBookmarksAfterInitialSyncWithTarget_completionHandler___block_invoke;
  v11[3] = &unk_1E4B38690;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v10, "fetchTopLevelBookmarkList:", v11);

}

uint64_t __100__WBSCyclerBookmarksTestSuite__validateServerBookmarksAfterInitialSyncWithTarget_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_validateServerBookmarksWithTarget:initialBookmarks:completionHandler:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

- (void)_validateServerBookmarksWithTarget:(id)a3 initialBookmarks:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  WBSCyclerTestSuiteBookmarkAuxiliary *bookmarkAuxiliary;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[8];
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_INFO, "Clearing local bookmarks for server bookmark validation", buf, 2u);
  }
  if (shouldRunInCloudKitMode)
  {
    if (shouldSyncDownUsingSecondaryMigration)
    {
      v26 = CFSTR("includeMigrationState");
      v27[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    -[WBSCyclerTestSuiteBookmarkAuxiliary resetOperation:](self->_bookmarkAuxiliary, "resetOperation:", 4);
    bookmarkAuxiliary = self->_bookmarkAuxiliary;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke;
    v21[3] = &unk_1E4B386E0;
    v21[4] = self;
    v22 = v8;
    v23 = v9;
    v24 = v10;
    v15 = v9;
    v13 = v8;
    v14 = v10;
    -[WBSCyclerTestSuiteBookmarkAuxiliary performOperation:withTarget:options:completionHandler:](bookmarkAuxiliary, "performOperation:withTarget:options:completionHandler:", 4, v13, v12, v21);

  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_30;
    v17[3] = &unk_1E4B38708;
    v17[4] = self;
    v18 = v8;
    v19 = v9;
    v20 = v10;
    v13 = v9;
    v14 = v8;
    v12 = v10;
    objc_msgSend(v14, "clearBookmarksWithOptions:completionHandler:", 0, v17);

    v15 = v20;
  }

}

void __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_validateServerBookmarksAfterClearingLocallyWithTarget:initialBookmarks:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

void __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_30(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_validateServerBookmarksAfterClearingLocallyWithTarget:initialBookmarks:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_30_cold_1();
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "_errorWithCode:userInfo:", 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)_validateServerBookmarksAfterClearingLocallyWithTarget:(id)a3 initialBookmarks:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_INFO, "Cleared local bookmarks for server bookmark validation. Performing sync.", buf, 2u);
  }
  if (shouldRunInCloudKitMode && shouldSyncDownUsingSecondaryMigration)
  {
    -[WBSCyclerBookmarksTestSuite _performCloudKitSecondaryMigrationAfterClearingBookmarksWithTarget:initialBookmarks:completionHandler:](self, "_performCloudKitSecondaryMigrationAfterClearingBookmarksWithTarget:initialBookmarks:completionHandler:", v8, v9, v10);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __121__WBSCyclerBookmarksTestSuite__validateServerBookmarksAfterClearingLocallyWithTarget_initialBookmarks_completionHandler___block_invoke;
    v12[3] = &unk_1E4B386B8;
    v14 = v10;
    v12[4] = self;
    v13 = v9;
    objc_msgSend(v8, "syncBookmarksWithCompletionHandler:", v12);

  }
}

void __121__WBSCyclerBookmarksTestSuite__validateServerBookmarksAfterClearingLocallyWithTarget_initialBookmarks_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (a2 == 2)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Bookmark sync was apparently disabled between initial and final syncs for server validation; skipping validation",
        buf,
        2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else if (a2)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_INFO, "Synced bookmarks down after clearing them", v8, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __121__WBSCyclerBookmarksTestSuite__validateServerBookmarksAfterClearingLocallyWithTarget_initialBookmarks_completionHandler___block_invoke_cold_1();
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_errorWithCode:userInfo:", 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)_performCloudKitSecondaryMigrationAfterClearingBookmarksWithTarget:(id)a3 initialBookmarks:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  WBSCyclerTestSuiteBookmarkAuxiliary *bookmarkAuxiliary;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_INFO, "Cleared local bookmarks for server bookmark validation. Performing secondary migration.", buf, 2u);
  }
  -[WBSCyclerTestSuiteBookmarkAuxiliary resetOperation:](self->_bookmarkAuxiliary, "resetOperation:", 3);
  bookmarkAuxiliary = self->_bookmarkAuxiliary;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __133__WBSCyclerBookmarksTestSuite__performCloudKitSecondaryMigrationAfterClearingBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke;
  v15[3] = &unk_1E4B38730;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  -[WBSCyclerTestSuiteBookmarkAuxiliary performOperation:withTarget:completionHandler:](bookmarkAuxiliary, "performOperation:withTarget:completionHandler:", 3, v10, v15);

}

void __133__WBSCyclerBookmarksTestSuite__performCloudKitSecondaryMigrationAfterClearingBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCycler();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __133__WBSCyclerBookmarksTestSuite__performCloudKitSecondaryMigrationAfterClearingBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Secondary migration succeeded", v12, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  WBSCyclerOperationContext *operationContext;
  WBSCyclerOperationContext *v10;
  WBSCyclerOperationContext **p_operationContext;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "Performing final validation of bookmarks after clearing and syncing down from server", buf, 2u);
  }
  p_operationContext = &self->_operationContext;
  operationContext = self->_operationContext;
  v10 = p_operationContext[1];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __130__WBSCyclerBookmarksTestSuite__performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks_completionHandler___block_invoke;
  v13[3] = &unk_1E4B2B8A0;
  v14 = v6;
  v12 = v6;
  -[WBSCyclerOperationContext fetchAndValidateBookmarksWithExpectedBookmarks:context:completionHandler:](v10, "fetchAndValidateBookmarksWithExpectedBookmarks:context:completionHandler:", v7, operationContext, v13);

}

void __130__WBSCyclerBookmarksTestSuite__performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCycler();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __130__WBSCyclerBookmarksTestSuite__performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks_completionHandler___block_invoke_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEFAULT, "Validated server-side bookmarks successfully", v12, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)objc_msgSend(a4, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  -[WBSCyclerBookmarksTestSuite _descriptionForErrorCode:](self, "_descriptionForErrorCode:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB2D50]);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSCyclerBookmarksTestSuiteErrorDomain"), a3, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_descriptionForErrorCode:(int64_t)a3
{
  if (a3)
    return CFSTR("Could not sync bookmarks");
  else
    return CFSTR("Could not clear local bookmarks");
}

- (WBSCyclerIterationCounter)iterationCounter
{
  return self->_iterationCounter;
}

- (void)setIterationCounter:(id)a3
{
  objc_storeStrong((id *)&self->_iterationCounter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterationCounter, 0);
  objc_storeStrong((id *)&self->_expectedTopLevelBookmarksFromPreviousIteration, 0);
  objc_storeStrong((id *)&self->_bookmarkAuxiliary, 0);
  objc_storeStrong((id *)&self->_operationContext, 0);
}

void __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Bookmarks are still valid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Bookmarks have changed since last cycler operation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __63__WBSCyclerBookmarksTestSuite_runWithTarget_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Re-validating bookmarks before performing next operation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __84__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to perform initial sync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to clear local bookmarks for server validation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __101__WBSCyclerBookmarksTestSuite__validateServerBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to clear local bookmarks for server bookmark validation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __121__WBSCyclerBookmarksTestSuite__validateServerBookmarksAfterClearingLocallyWithTarget_initialBookmarks_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to sync bookmarks back down after clearing bookmarks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __133__WBSCyclerBookmarksTestSuite__performCloudKitSecondaryMigrationAfterClearingBookmarksWithTarget_initialBookmarks_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Secondary migration failed: %{public}@", a5, a6, a7, a8, 2u);
}

void __130__WBSCyclerBookmarksTestSuite__performFinalServerBookmarkValidationAfterClearingAndSyncingWithInitialBookmarks_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, a2, a3, "Server validation failed: %{public}@", a5, a6, a7, a8, 2u);
}

@end
