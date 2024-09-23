@implementation WBSCyclerCloudKitMigrationTestSuite

- (WBSCyclerCloudKitMigrationTestSuite)init
{
  WBSCyclerCloudKitMigrationTestSuite *v2;
  WBSCyclerTestSuiteBookmarkAuxiliary *v3;
  WBSCyclerTestSuiteBookmarkAuxiliary *bookmarkAuxiliary;
  WBSCyclerCloudKitMigrationTestSuite *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSCyclerCloudKitMigrationTestSuite;
  v2 = -[WBSCyclerCloudKitMigrationTestSuite init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(WBSCyclerTestSuiteBookmarkAuxiliary);
    bookmarkAuxiliary = v2->_bookmarkAuxiliary;
    v2->_bookmarkAuxiliary = v3;

    v5 = v2;
  }

  return v2;
}

- (void)runWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WBSCyclerTestSuiteBookmarkAuxiliary *v8;
  uint64_t v9;
  WBSCyclerTestSuiteBookmarkAuxiliary *v10;
  BOOL v11;
  WBSCyclerTestSuiteBookmarkAuxiliary *v12;
  void *v13;
  void *v14;
  WBSCyclerTestSuiteBookmarkAuxiliary *bookmarkAuxiliary;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!shouldMigrateExistingBookmarks
    && !-[WBSCyclerTestSuiteBookmarkAuxiliary hasPerformedOperation:](self->_bookmarkAuxiliary, "hasPerformedOperation:", 0))
  {
    v23 = CFSTR("forCloudKitTest");
    v24[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    bookmarkAuxiliary = self->_bookmarkAuxiliary;
    v16 = 0;
    goto LABEL_20;
  }
  if (!-[WBSCyclerTestSuiteBookmarkAuxiliary hasPerformedOperation:](self->_bookmarkAuxiliary, "hasPerformedOperation:", 1))
  {
    v8 = self->_bookmarkAuxiliary;
    v9 = 1;
    goto LABEL_8;
  }
  if (shouldMigrateExistingBookmarks || self->_bookmarksGeneratedPriorToMigration > 0x63)
  {
    if (!-[WBSCyclerTestSuiteBookmarkAuxiliary hasPerformedOperation:](self->_bookmarkAuxiliary, "hasPerformedOperation:", 2))
    {
      -[WBSCyclerCloudKitMigrationTestSuite _generateDAVServerIDsForExistingBookmarksWithTarget:completionHandler:](self, "_generateDAVServerIDsForExistingBookmarksWithTarget:completionHandler:", v6, v7);
      goto LABEL_21;
    }
    v10 = self->_bookmarkAuxiliary;
    if (!self->_hasValidatedResultsOfPrimaryMigration)
    {
      if (!-[WBSCyclerTestSuiteBookmarkAuxiliary hasPerformedOperation:](v10, "hasPerformedOperation:", 3))
      {
        -[WBSCyclerCloudKitMigrationTestSuite _migrateToCloudKitWithTarget:completionHandler:](self, "_migrateToCloudKitWithTarget:completionHandler:", v6, v7);
        goto LABEL_21;
      }
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __71__WBSCyclerCloudKitMigrationTestSuite_runWithTarget_completionHandler___block_invoke;
      v19[3] = &unk_1E4B2B768;
      v19[4] = self;
      v20 = v7;
      -[WBSCyclerCloudKitMigrationTestSuite _validateResultsOfMigrationWithTarget:completionHandler:](self, "_validateResultsOfMigrationWithTarget:completionHandler:", v6, v19);
      v13 = v20;
      goto LABEL_18;
    }
    v11 = -[WBSCyclerTestSuiteBookmarkAuxiliary hasPerformedOperation:](v10, "hasPerformedOperation:", 4);
    v12 = self->_bookmarkAuxiliary;
    if (v11)
    {
      if (-[WBSCyclerTestSuiteBookmarkAuxiliary hasPerformedOperation:](v12, "hasPerformedOperation:", 3))
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __71__WBSCyclerCloudKitMigrationTestSuite_runWithTarget_completionHandler___block_invoke_2;
        v17[3] = &unk_1E4B2B768;
        v17[4] = self;
        v18 = v7;
        -[WBSCyclerCloudKitMigrationTestSuite _validateResultsOfMigrationWithTarget:completionHandler:](self, "_validateResultsOfMigrationWithTarget:completionHandler:", v6, v17);
        v13 = v18;
LABEL_18:

        goto LABEL_21;
      }
      v8 = self->_bookmarkAuxiliary;
      v9 = 3;
LABEL_8:
      -[WBSCyclerTestSuiteBookmarkAuxiliary performOperation:withTarget:completionHandler:](v8, "performOperation:withTarget:completionHandler:", v9, v6, v7);
      goto LABEL_21;
    }
    -[WBSCyclerTestSuiteBookmarkAuxiliary resetOperation:](v12, "resetOperation:", 3);
    v21 = CFSTR("includeMigrationState");
    v22 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    bookmarkAuxiliary = self->_bookmarkAuxiliary;
    v16 = 4;
LABEL_20:
    -[WBSCyclerTestSuiteBookmarkAuxiliary performOperation:withTarget:options:completionHandler:](bookmarkAuxiliary, "performOperation:withTarget:options:completionHandler:", v16, v6, v14, v7);

    goto LABEL_21;
  }
  -[WBSCyclerCloudKitMigrationTestSuite _createRandomBookmarkWithTarget:completionHandler:](self, "_createRandomBookmarkWithTarget:completionHandler:", v6, v7);
LABEL_21:

}

uint64_t __71__WBSCyclerCloudKitMigrationTestSuite_runWithTarget_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = a2 == 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __71__WBSCyclerCloudKitMigrationTestSuite_runWithTarget_completionHandler___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (BOOL)setValue:(id)a3 forConfigurationKey:(id)a4
{
  id v5;
  int v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  uint8_t *v11;
  __int16 v13;
  __int16 v14;

  v5 = a3;
  v6 = objc_msgSend(a4, "isEqualToString:", CFSTR("migrate-existing-bookmarks"));
  if (v6)
  {
    v7 = objc_msgSend(v5, "BOOLValue");
    shouldMigrateExistingBookmarks = v7;
    v8 = WBS_LOG_CHANNEL_PREFIXCycler();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        v14 = 0;
        v10 = "Migration test will migrate existing bookmarks at ~/Library/Safari/Bookmarks.plist";
        v11 = (uint8_t *)&v14;
LABEL_7:
        _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, v10, v11, 2u);
      }
    }
    else if (v9)
    {
      v13 = 0;
      v10 = "Migration test will wipe all existing bookmarks and generate random ones prior to migration";
      v11 = (uint8_t *)&v13;
      goto LABEL_7;
    }
  }

  return v6;
}

- (void)_createRandomBookmarkWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  WBSCyclerCloudKitMigrationTestSuite *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__WBSCyclerCloudKitMigrationTestSuite__createRandomBookmarkWithTarget_completionHandler___block_invoke;
  v10[3] = &unk_1E4B38690;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v9, "fetchTopLevelBookmarkList:", v10);

}

void __89__WBSCyclerCloudKitMigrationTestSuite__createRandomBookmarkWithTarget_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  WBSCyclerOperationContext *v4;
  WBSCyclerCreateBookmarkOperation *v5;
  void *v6;
  WBSCyclerOperationContext *v7;
  _QWORD v8[5];
  WBSCyclerOperationContext *v9;
  id v10;

  v3 = a2;
  v4 = objc_alloc_init(WBSCyclerOperationContext);
  -[WBSCyclerOperationContext setTestTarget:](v4, "setTestTarget:", a1[4]);
  -[WBSCyclerOperationContext setTopLevelItem:](v4, "setTopLevelItem:", v3);

  v5 = objc_alloc_init(WBSCyclerCreateBookmarkOperation);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__WBSCyclerCloudKitMigrationTestSuite__createRandomBookmarkWithTarget_completionHandler___block_invoke_2;
  v8[3] = &unk_1E4B38690;
  v6 = (void *)a1[6];
  v8[4] = a1[5];
  v9 = v4;
  v10 = v6;
  v7 = v4;
  -[WBSCyclerCreateBookmarkOperation executeWithContext:completionHandler:](v5, "executeWithContext:completionHandler:", v7, v8);

}

void __89__WBSCyclerCloudKitMigrationTestSuite__createRandomBookmarkWithTarget_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v3 + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__WBSCyclerCloudKitMigrationTestSuite__createRandomBookmarkWithTarget_completionHandler___block_invoke_3;
  v6[3] = &unk_1E4B2B768;
  v6[4] = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v5, "fetchAndValidateBookmarksWithExpectedBookmarks:context:completionHandler:", a2, v4, v6);

}

uint64_t __89__WBSCyclerCloudKitMigrationTestSuite__createRandomBookmarkWithTarget_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!a2)
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_generateDAVServerIDsForExistingBookmarksWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  WBSCyclerTestSuiteBookmarkAuxiliary *bookmarkAuxiliary;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "Generating DAV server IDs for new bookmarks", buf, 2u);
  }
  bookmarkAuxiliary = self->_bookmarkAuxiliary;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __109__WBSCyclerCloudKitMigrationTestSuite__generateDAVServerIDsForExistingBookmarksWithTarget_completionHandler___block_invoke;
  v11[3] = &unk_1E4B2B8A0;
  v12 = v6;
  v10 = v6;
  -[WBSCyclerTestSuiteBookmarkAuxiliary performOperation:withTarget:completionHandler:](bookmarkAuxiliary, "performOperation:withTarget:completionHandler:", 2, v7, v11);

}

void __109__WBSCyclerCloudKitMigrationTestSuite__generateDAVServerIDsForExistingBookmarksWithTarget_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCycler();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __109__WBSCyclerCloudKitMigrationTestSuite__generateDAVServerIDsForExistingBookmarksWithTarget_completionHandler___block_invoke_cold_1((uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEFAULT, "Generated DAV server IDs for new bookmarks", v6, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_fetchBookmarksPriorToMigrationWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "Fetching bookmarks prior to CloudKit migration", buf, 2u);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__WBSCyclerCloudKitMigrationTestSuite__fetchBookmarksPriorToMigrationWithTarget_completionHandler___block_invoke;
  v10[3] = &unk_1E4B38668;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "fetchTopLevelBookmarkList:", v10);

}

void __99__WBSCyclerCloudKitMigrationTestSuite__fetchBookmarksPriorToMigrationWithTarget_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__WBSCyclerCloudKitMigrationTestSuite__fetchBookmarksPriorToMigrationWithTarget_completionHandler___block_invoke_2;
  block[3] = &unk_1E4B2A0F0;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __99__WBSCyclerCloudKitMigrationTestSuite__fetchBookmarksPriorToMigrationWithTarget_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_migrateToCloudKitWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__WBSCyclerCloudKitMigrationTestSuite__migrateToCloudKitWithTarget_completionHandler___block_invoke;
  v10[3] = &unk_1E4B2A0F0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[WBSCyclerCloudKitMigrationTestSuite _fetchBookmarksPriorToMigrationWithTarget:completionHandler:](self, "_fetchBookmarksPriorToMigrationWithTarget:completionHandler:", v9, v10);

}

uint64_t __86__WBSCyclerCloudKitMigrationTestSuite__migrateToCloudKitWithTarget_completionHandler___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "performOperation:withTarget:completionHandler:", 3, a1[5], a1[6]);
}

- (void)_validateResultsOfMigrationWithTarget:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WBSCyclerOperationContext *v8;
  WBSCyclerTestSuiteBookmarkAuxiliary *bookmarkAuxiliary;
  WBSCyclerItemListRepresentation *topLevelBookmarksPriorToMigration;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(WBSCyclerOperationContext);
  -[WBSCyclerOperationContext setTestTarget:](v8, "setTestTarget:", v7);

  bookmarkAuxiliary = self->_bookmarkAuxiliary;
  topLevelBookmarksPriorToMigration = self->_topLevelBookmarksPriorToMigration;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__WBSCyclerCloudKitMigrationTestSuite__validateResultsOfMigrationWithTarget_completionHandler___block_invoke;
  v12[3] = &unk_1E4B2B768;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[WBSCyclerTestSuiteBookmarkAuxiliary fetchAndValidateBookmarksWithExpectedBookmarks:context:completionHandler:](bookmarkAuxiliary, "fetchAndValidateBookmarksWithExpectedBookmarks:context:completionHandler:", topLevelBookmarksPriorToMigration, v8, v12);

}

void __95__WBSCyclerCloudKitMigrationTestSuite__validateResultsOfMigrationWithTarget_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
    v4 = CFSTR("secondary");
  else
    v4 = CFSTR("primary");
  v5 = v4;
  v6 = WBS_LOG_CHANNEL_PREFIXCycler();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __95__WBSCyclerCloudKitMigrationTestSuite__validateResultsOfMigrationWithTarget_completionHandler___block_invoke_cold_1((uint64_t)v5, (uint64_t)v3, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_DEFAULT, "Validated results of %{public}@ migration successfully", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_errorWithCode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  -[WBSCyclerCloudKitMigrationTestSuite _descriptionForErrorCode:](self, "_descriptionForErrorCode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("WBSCyclerCloudKitMigrationTestSuiteErrorDomain"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_descriptionForErrorCode:(int64_t)a3
{
  return CFSTR("Not implemented yet. See <rdar://problem/28898761>.");
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLevelBookmarksPriorToMigration, 0);
  objc_storeStrong((id *)&self->_bookmarkAuxiliary, 0);
}

void __109__WBSCyclerCloudKitMigrationTestSuite__generateDAVServerIDsForExistingBookmarksWithTarget_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Failed to generate DAV server IDs for new bookmarks: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __95__WBSCyclerCloudKitMigrationTestSuite__validateResultsOfMigrationWithTarget_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Failed to validate %{public}@ migration results: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
