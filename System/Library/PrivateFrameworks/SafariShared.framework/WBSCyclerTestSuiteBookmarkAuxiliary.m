@implementation WBSCyclerTestSuiteBookmarkAuxiliary

- (WBSCyclerTestSuiteBookmarkAuxiliary)init
{
  WBSCyclerTestSuiteBookmarkAuxiliary *v2;
  WBSCyclerTestSuiteBookmarkAuxiliary *v3;
  WBSCyclerTestSuiteBookmarkAuxiliary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSCyclerTestSuiteBookmarkAuxiliary;
  v2 = -[WBSCyclerTestSuiteBookmarkAuxiliary init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_operationBackoffRatio = 2.0;
    v4 = v2;
  }

  return v3;
}

- (void)fetchAndValidateBookmarksWithExpectedBookmarks:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "testTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __112__WBSCyclerTestSuiteBookmarkAuxiliary_fetchAndValidateBookmarksWithExpectedBookmarks_context_completionHandler___block_invoke;
  v15[3] = &unk_1E4B38BB0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  objc_msgSend(v11, "fetchTopLevelBookmarkList:", v15);

}

void __112__WBSCyclerTestSuiteBookmarkAuxiliary_fetchAndValidateBookmarksWithExpectedBookmarks_context_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "validateBookmarks:expectingBookmarks:context:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)validateBookmarks:(id)a3 expectingBookmarks:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id obj;
  uint64_t v56;
  void *v57;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  const __CFString *v65;
  void *v66;
  uint8_t buf[4];
  void *v68;
  _BYTE v69[128];
  const __CFString *v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "filterOutItemsWithoutTitlePrefixInList:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterOutItemsWithoutTitlePrefixInList:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length") && !objc_msgSend(v12, "length"))
  {
    objc_msgSend(v9, "setTitle:", 0);
    objc_msgSend(v10, "setTitle:", 0);
  }
  -[WBSCyclerTestSuiteBookmarkAuxiliary _formattedStringForBookmark:indentationLevel:](self, "_formattedStringForBookmark:indentationLevel:", v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCyclerTestSuiteBookmarkAuxiliary _formattedStringForBookmark:indentationLevel:](self, "_formattedStringForBookmark:indentationLevel:", v10, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[WBSCyclerTestSuiteBookmarkAuxiliary validateBookmarks:expectingBookmarks:context:].cold.4();
  v16 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[WBSCyclerTestSuiteBookmarkAuxiliary validateBookmarks:expectingBookmarks:context:].cold.3();
  if ((objc_msgSend(v10, "isEquivalent:", v9) & 1) != 0)
  {
    v17 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[WBSCyclerTestSuiteBookmarkAuxiliary validateBookmarks:expectingBookmarks:context:].cold.2();
    objc_msgSend(v9, "pairsOfItemsWithDifferingExtraAttributesComparedTo:", v10);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      v46 = v14;
      v47 = v11;
      v51 = v13;
      v53 = v12;
      v48 = v10;
      v49 = v9;
      v50 = v7;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v18 = v18;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      if (v19)
      {
        v20 = v19;
        v56 = *(_QWORD *)v62;
        obj = v18;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v62 != v56)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v21);
            v59 = 0;
            v60 = 0;
            objc_msgSend(v22, "getFirst:second:", &v60, &v59);
            v23 = v60;
            v24 = v59;
            -[WBSCyclerTestSuiteBookmarkAuxiliary _expandedDescriptionForBookmark:](self, "_expandedDescriptionForBookmark:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBSCyclerTestSuiteBookmarkAuxiliary _expandedDescriptionForBookmark:](self, "_expandedDescriptionForBookmark:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = WBS_LOG_CHANNEL_PREFIXCycler();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v68 = v25;
              _os_log_debug_impl(&dword_1A3D90000, v27, OS_LOG_TYPE_DEBUG, "Expected bookmark attributes: %{public}@", buf, 0xCu);
            }
            v28 = WBS_LOG_CHANNEL_PREFIXCycler();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v68 = v26;
              _os_log_debug_impl(&dword_1A3D90000, v28, OS_LOG_TYPE_DEBUG, "Actual bookmark attributes: %{public}@", buf, 0xCu);
            }
            objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "componentsSeparatedByCharactersInSet:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "componentsSeparatedByCharactersInSet:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v30, "safari_diffWithArray:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = WBS_LOG_CHANNEL_PREFIXCycler();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v68 = v33;
              _os_log_error_impl(&dword_1A3D90000, v34, OS_LOG_TYPE_ERROR, "Expected and actual attributes don't match: %{public}@", buf, 0xCu);
            }
            objc_msgSend(v57, "addObject:", v33);

            ++v21;
          }
          while (v20 != v21);
          v18 = obj;
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
        }
        while (v20);
      }

      v65 = CFSTR("ExpectedAttributesVersusActualAttributes");
      v66 = v57;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSCyclerTestSuiteBookmarkAuxiliary _errorWithCode:userInfo:](self, "_errorWithCode:userInfo:", 0, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v49;
      v7 = v50;
      v11 = v47;
      v10 = v48;
      v13 = v51;
      v12 = v53;
      v14 = v46;
    }
    else
    {
      v44 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        -[WBSCyclerTestSuiteBookmarkAuxiliary validateBookmarks:expectingBookmarks:context:].cold.1();
      v36 = 0;
    }
  }
  else
  {
    v54 = v12;
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsSeparatedByCharactersInSet:", v37);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsSeparatedByCharactersInSet:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = CFSTR("ExpectedStateVersusActualState");
    objc_msgSend(v18, "safari_diffWithArray:", v39);
    v52 = v13;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
    v41 = v11;
    v42 = v14;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCyclerTestSuiteBookmarkAuxiliary _errorWithCode:userInfo:](self, "_errorWithCode:userInfo:", 0, v43);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v42;
    v11 = v41;

    v13 = v52;
    v12 = v54;
  }

  return v36;
}

- (BOOL)hasPerformedOperation:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return objc_msgSend(*((id *)&self->_initialClearOperation + a3), "isFinished");
}

- (void)performOperation:(int64_t)a3 withTarget:(id)a4 completionHandler:(id)a5
{
  -[WBSCyclerTestSuiteBookmarkAuxiliary performOperation:withTarget:options:completionHandler:](self, "performOperation:withTarget:options:completionHandler:", a3, a4, 0, a5);
}

- (void)performOperation:(int64_t)a3 withTarget:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;

  v12 = a4;
  v10 = a5;
  v11 = a6;
  switch(a3)
  {
    case 0:
      -[WBSCyclerTestSuiteBookmarkAuxiliary _attemptInitialClearWithTarget:options:completionHandler:](self, "_attemptInitialClearWithTarget:options:completionHandler:", v12, v10, v11);
      break;
    case 1:
      -[WBSCyclerTestSuiteBookmarkAuxiliary _attemptResetToDAVModeWithCompletionHandler:](self, "_attemptResetToDAVModeWithCompletionHandler:", v11);
      break;
    case 2:
      -[WBSCyclerTestSuiteBookmarkAuxiliary _attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler:](self, "_attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler:", v11);
      break;
    case 3:
      -[WBSCyclerTestSuiteBookmarkAuxiliary _attemptCloudKitMigrationWithCompletionHandler:](self, "_attemptCloudKitMigrationWithCompletionHandler:", v11);
      break;
    case 4:
      -[WBSCyclerTestSuiteBookmarkAuxiliary _attemptToClearDataWithOptions:completionHandler:](self, "_attemptToClearDataWithOptions:completionHandler:", v10, v11);
      break;
    default:
      break;
  }

}

- (void)resetOperation:(int64_t)a3
{
  Class *v5;
  Class v6;

  if (-[WBSCyclerTestSuiteBookmarkAuxiliary hasPerformedOperation:](self, "hasPerformedOperation:"))
  {
    if ((unint64_t)a3 <= 4)
    {
      v5 = &self->super.isa + a3;
      v6 = v5[1];
      v5[1] = 0;

    }
  }
}

- (id)_descriptionForBookmark:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCyclerTestSuiteBookmarkAuxiliary _attributeStringForBookmark:multiline:](self, "_attributeStringForBookmark:multiline:", v4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<Leaf title=\"%@\" url=\"%@\" attributes=\"%@\">"), v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WBSCyclerTestSuiteBookmarkAuxiliary _attributeStringForBookmark:multiline:](self, "_attributeStringForBookmark:multiline:", v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<List title=\"%@\" attributes=\"%@\">"), v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_attributeStringForBookmark:(id)a3 multiline:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extraAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__WBSCyclerTestSuiteBookmarkAuxiliary__attributeStringForBookmark_multiline___block_invoke;
  v13[3] = &unk_1E4B38BD8;
  v14 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);

  if (v4)
    v10 = CFSTR("\n");
  else
    v10 = CFSTR(", ");
  objc_msgSend(v9, "componentsJoinedByString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __77__WBSCyclerTestSuiteBookmarkAuxiliary__attributeStringForBookmark_multiline___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (id)_expandedDescriptionForBookmark:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(v4, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<Leaf title=\"%@\" url=\"%@\">"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<List title=\"%@\">"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v10, "appendString:", CFSTR("\n"));
  -[WBSCyclerTestSuiteBookmarkAuxiliary _attributeStringForBookmark:multiline:](self, "_attributeStringForBookmark:multiline:", v4, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:", v11);

  return v10;
}

- (id)_formattedStringForBookmark:(id)a3 indentationLevel:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WBSCyclerTestSuiteBookmarkAuxiliary _descriptionForBookmark:](self, "_descriptionForBookmark:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (a4)
  {
    v9 = a4;
    do
    {
      objc_msgSend(v8, "insertString:atIndex:", CFSTR("    "), 0);
      --v9;
    }
    while (v9);
  }
  objc_msgSend(v8, "appendString:", CFSTR("\n"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      v14 = a4 + 1;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          -[WBSCyclerTestSuiteBookmarkAuxiliary _formattedStringForBookmark:indentationLevel:](self, "_formattedStringForBookmark:indentationLevel:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15), v14, (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendString:", v16);

          ++v15;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
  return v8;
}

- (void)_attemptInitialClearWithTarget:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSCyclerOperation *v11;
  double v12;
  WBSCyclerOperation *v13;
  WBSCyclerOperation *initialClearOperation;
  uint64_t v15;
  WBSCyclerOperation *v16;
  id v17;
  id v18;
  WBSCyclerOperation *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_initialClearOperation)
  {
    v11 = [WBSCyclerOperation alloc];
    *(float *)&v12 = self->_operationBackoffRatio;
    v13 = -[WBSCyclerOperation initWithMaximumNumberOfAttempts:backoffRatio:](v11, "initWithMaximumNumberOfAttempts:backoffRatio:", 5, v12);
    initialClearOperation = self->_initialClearOperation;
    self->_initialClearOperation = v13;

  }
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke;
  v23[3] = &unk_1E4B38C00;
  v24 = v9;
  v25 = v8;
  v16 = self->_initialClearOperation;
  v17 = v8;
  v18 = v9;
  -[WBSCyclerOperation setBlock:](v16, "setBlock:", v23);
  v19 = self->_initialClearOperation;
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke_35;
  v21[3] = &unk_1E4B38C28;
  v21[4] = self;
  v22 = v10;
  v20 = v10;
  -[WBSCyclerOperation executeWithResultHandler:](v19, "executeWithResultHandler:", v21);

}

void __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Clearing all local and remote bookmarks before starting cycler", v8, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("forCloudKitTest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", MEMORY[0x1E0C9AAB0]);

  if (v6)
    v7 = 3;
  else
    v7 = 1;
  objc_msgSend(*(id *)(a1 + 40), "clearBookmarksWithOptions:completionHandler:", v7, v3);

}

void __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke_35(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  switch(a2)
  {
    case 2:
      v3 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke_35_cold_2();
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_errorWithCode:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

      break;
    case 1:
      v6 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke_35_cold_1();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      break;
    case 0:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      break;
  }
}

- (void)_attemptResetToDAVModeWithCompletionHandler:(id)a3
{
  id v4;
  WBSCyclerOperation *resetToDAVModeOperation;
  WBSCyclerOperation *v6;
  double v7;
  WBSCyclerOperation *v8;
  WBSCyclerOperation *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  resetToDAVModeOperation = self->_resetToDAVModeOperation;
  if (!resetToDAVModeOperation)
  {
    v6 = [WBSCyclerOperation alloc];
    *(float *)&v7 = self->_operationBackoffRatio;
    v8 = -[WBSCyclerOperation initWithMaximumNumberOfAttempts:backoffRatio:](v6, "initWithMaximumNumberOfAttempts:backoffRatio:", 5, v7);
    v9 = self->_resetToDAVModeOperation;
    self->_resetToDAVModeOperation = v8;

    -[WBSCyclerOperation setBlock:](self->_resetToDAVModeOperation, "setBlock:", &__block_literal_global_41);
    resetToDAVModeOperation = self->_resetToDAVModeOperation;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_40;
  v11[3] = &unk_1E4B38C28;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[WBSCyclerOperation executeWithResultHandler:](resetToDAVModeOperation, "executeWithResultHandler:", v11);

}

void __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_INFO, "Resetting bookmark database back to DAV mode", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_38;
  v6[3] = &unk_1E4B2B8A0;
  v7 = v2;
  v5 = v2;
  objc_msgSend(v4, "resetToDAVDatabaseWithCompletionHandler:", v6);

}

void __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_38(uint64_t a1, void *a2)
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
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_38_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Reset bookmark database to DAV mode successfully", v6, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_40(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  switch(a2)
  {
    case 2:
      v3 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_40_cold_2();
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_errorWithCode:", 3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

      break;
    case 1:
      v6 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_40_cold_1();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      break;
    case 0:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      break;
  }
}

- (void)_attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler:(id)a3
{
  id v4;
  WBSCyclerOperation *generateDAVServerIDsForExistingBookmarksOperation;
  WBSCyclerOperation *v6;
  double v7;
  WBSCyclerOperation *v8;
  WBSCyclerOperation *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  generateDAVServerIDsForExistingBookmarksOperation = self->_generateDAVServerIDsForExistingBookmarksOperation;
  if (!generateDAVServerIDsForExistingBookmarksOperation)
  {
    v6 = [WBSCyclerOperation alloc];
    *(float *)&v7 = self->_operationBackoffRatio;
    v8 = -[WBSCyclerOperation initWithMaximumNumberOfAttempts:backoffRatio:](v6, "initWithMaximumNumberOfAttempts:backoffRatio:", 5, v7);
    v9 = self->_generateDAVServerIDsForExistingBookmarksOperation;
    self->_generateDAVServerIDsForExistingBookmarksOperation = v8;

    -[WBSCyclerOperation setBlock:](self->_generateDAVServerIDsForExistingBookmarksOperation, "setBlock:", &__block_literal_global_41);
    generateDAVServerIDsForExistingBookmarksOperation = self->_generateDAVServerIDsForExistingBookmarksOperation;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_43;
  v11[3] = &unk_1E4B38C28;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[WBSCyclerOperation executeWithResultHandler:](generateDAVServerIDsForExistingBookmarksOperation, "executeWithResultHandler:", v11);

}

void __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_INFO, "Generating DAV server IDs for current bookmarks", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_42;
  v6[3] = &unk_1E4B2B8A0;
  v7 = v2;
  v5 = v2;
  objc_msgSend(v4, "generateDAVServerIDsForExistingBookmarksWithCompletionHandler:", v6);

}

void __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_42(uint64_t a1, void *a2)
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
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_42_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Generated DAV server IDs for existing bookmarks", v6, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_43(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  switch(a2)
  {
    case 2:
      v3 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_43_cold_2();
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_errorWithCode:", 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

      break;
    case 1:
      v6 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_43_cold_1();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      break;
    case 0:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      break;
  }
}

- (void)_attemptCloudKitMigrationWithCompletionHandler:(id)a3
{
  id v4;
  WBSCyclerOperation *cloudKitMigrationOperation;
  WBSCyclerOperation *v6;
  double v7;
  WBSCyclerOperation *v8;
  WBSCyclerOperation *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  cloudKitMigrationOperation = self->_cloudKitMigrationOperation;
  if (!cloudKitMigrationOperation)
  {
    v6 = [WBSCyclerOperation alloc];
    *(float *)&v7 = self->_operationBackoffRatio;
    v8 = -[WBSCyclerOperation initWithMaximumNumberOfAttempts:backoffRatio:](v6, "initWithMaximumNumberOfAttempts:backoffRatio:", 5, v7);
    v9 = self->_cloudKitMigrationOperation;
    self->_cloudKitMigrationOperation = v8;

    -[WBSCyclerOperation setBlock:](self->_cloudKitMigrationOperation, "setBlock:", &__block_literal_global_44);
    cloudKitMigrationOperation = self->_cloudKitMigrationOperation;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_46;
  v11[3] = &unk_1E4B38C28;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[WBSCyclerOperation executeWithResultHandler:](cloudKitMigrationOperation, "executeWithResultHandler:", v11);

}

void __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_INFO, "Migrating from DAV to CloudKit", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_45;
  v6[3] = &unk_1E4B2B8A0;
  v7 = v2;
  v5 = v2;
  objc_msgSend(v4, "migrateToCloudKitWithCompletionHandler:", v6);

}

void __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_45(uint64_t a1, void *a2)
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
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_45_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Migrated from DAV to CloudKit successfully", v6, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_46(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  switch(a2)
  {
    case 2:
      v3 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_46_cold_2();
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_errorWithCode:", 5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

      break;
    case 1:
      v6 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_46_cold_1();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      break;
    case 0:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      break;
  }
}

- (void)_attemptToClearDataWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WBSCyclerOperation *v8;
  double v9;
  WBSCyclerOperation *v10;
  WBSCyclerOperation *clearLocalDataOperation;
  uint64_t v12;
  WBSCyclerOperation *v13;
  id v14;
  WBSCyclerOperation *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  if (!self->_clearLocalDataOperation)
  {
    v8 = [WBSCyclerOperation alloc];
    *(float *)&v9 = self->_operationBackoffRatio;
    v10 = -[WBSCyclerOperation initWithMaximumNumberOfAttempts:backoffRatio:](v8, "initWithMaximumNumberOfAttempts:backoffRatio:", 5, v9);
    clearLocalDataOperation = self->_clearLocalDataOperation;
    self->_clearLocalDataOperation = v10;

  }
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke;
  v19[3] = &unk_1E4B38CD0;
  v20 = v6;
  v13 = self->_clearLocalDataOperation;
  v14 = v6;
  -[WBSCyclerOperation setBlock:](v13, "setBlock:", v19);
  v15 = self->_clearLocalDataOperation;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_48;
  v17[3] = &unk_1E4B38C28;
  v17[4] = self;
  v18 = v7;
  v16 = v7;
  -[WBSCyclerOperation executeWithResultHandler:](v15, "executeWithResultHandler:", v17);

}

void __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("includeMigrationState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", MEMORY[0x1E0C9AAB0]);

  v6 = WBS_LOG_CHANNEL_PREFIXCycler();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if ((_DWORD)v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      v8 = "Asking sync agent to clear local data and migration state";
LABEL_6:
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, v8, buf, 2u);
    }
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    v8 = "Asking sync agent to clear local data";
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_47;
  v11[3] = &unk_1E4B2B8A0;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v9, "clearLocalDataIncludingMigrationState:completionHandler:", v5, v11);

}

void __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_47(uint64_t a1, void *a2)
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
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_47_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Cleared local data successfully", v6, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_48(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  switch(a2)
  {
    case 2:
      v3 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_48_cold_2();
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_errorWithCode:", 6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

      break;
    case 1:
      v6 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_48_cold_1();
      break;
    case 0:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      break;
  }
}

- (id)_errorWithCode:(int64_t)a3
{
  return -[WBSCyclerTestSuiteBookmarkAuxiliary _errorWithCode:userInfo:](self, "_errorWithCode:userInfo:", a3, 0);
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

  -[WBSCyclerTestSuiteBookmarkAuxiliary _descriptionForErrorCode:](self, "_descriptionForErrorCode:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB2D50]);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSCyclerTestSuiteBookmarkAuxiliaryErrorDomain"), a3, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_descriptionForErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return CFSTR("Test target's bookmark state does not match the expected state");
  else
    return off_1E4B38CF0[a3 - 1];
}

- (float)operationBackoffRatio
{
  return self->_operationBackoffRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearLocalDataOperation, 0);
  objc_storeStrong((id *)&self->_cloudKitMigrationOperation, 0);
  objc_storeStrong((id *)&self->_generateDAVServerIDsForExistingBookmarksOperation, 0);
  objc_storeStrong((id *)&self->_resetToDAVModeOperation, 0);
  objc_storeStrong((id *)&self->_initialClearOperation, 0);
}

- (void)validateBookmarks:expectingBookmarks:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Extra attributes also match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)validateBookmarks:expectingBookmarks:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Expected and actual bookmarks' titles and URLs match. Checking extra attributes.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)validateBookmarks:expectingBookmarks:context:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_7(&dword_1A3D90000, v0, v1, "Actual state: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)validateBookmarks:expectingBookmarks:context:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_7(&dword_1A3D90000, v0, v1, "Expected state: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke_35_cold_1()
{
  NSObject *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_11();
  v2 = v1;
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_8(&dword_1A3D90000, v0, v3, "Was not able to clear bookmarks. Will try again after %.2f seconds.", v4);

  OUTLINED_FUNCTION_1();
}

void __96__WBSCyclerTestSuiteBookmarkAuxiliary__attemptInitialClearWithTarget_options_completionHandler___block_invoke_35_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to clear bookmarks too many times. Giving up.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_38_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_8(&dword_1A3D90000, v0, v1, "Failed to reset bookmark database to DAV mode: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_40_cold_1()
{
  NSObject *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_11();
  v2 = v1;
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_8(&dword_1A3D90000, v0, v3, "Was not able to reset bookmark database to DAV mode. Will try again after %.2f seconds.", v4);

  OUTLINED_FUNCTION_1();
}

void __83__WBSCyclerTestSuiteBookmarkAuxiliary__attemptResetToDAVModeWithCompletionHandler___block_invoke_40_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to reset bookmark database to DAV mode too many times. Giving up.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_42_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_8(&dword_1A3D90000, v0, v1, "Failed to generate DAV server IDs for existing bookmarks: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_43_cold_1()
{
  NSObject *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_11();
  v2 = v1;
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_8(&dword_1A3D90000, v0, v3, "Was not able to generate DAV server IDs for existing bookmarks. Will try again after %.2f seconds.", v4);

  OUTLINED_FUNCTION_1();
}

void __111__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToGenerateDAVServerIDsForExistingBookmarksWithCompletionHandler___block_invoke_43_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to generate DAV server IDs for existing bookmarks too many times. Giving up.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_45_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_8(&dword_1A3D90000, v0, v1, "Failed to migrate from DAV to CloudKit: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_46_cold_1()
{
  NSObject *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_11();
  v2 = v1;
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_8(&dword_1A3D90000, v0, v3, "Was not able to migrate from DAV to CloudKit. Will try again after %.2f seconds.", v4);

  OUTLINED_FUNCTION_1();
}

void __86__WBSCyclerTestSuiteBookmarkAuxiliary__attemptCloudKitMigrationWithCompletionHandler___block_invoke_46_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to migrate from DAV to CloudKit too many times. Giving up.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_47_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_8(&dword_1A3D90000, v0, v1, "Failed to clear local data: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_48_cold_1()
{
  NSObject *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_11();
  v2 = v1;
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_8(&dword_1A3D90000, v0, v3, "Was not able to clear local data. Will try again after %.2f seconds.", v4);

  OUTLINED_FUNCTION_1();
}

void __88__WBSCyclerTestSuiteBookmarkAuxiliary__attemptToClearDataWithOptions_completionHandler___block_invoke_48_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to clear local data too many times. Giving up.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
