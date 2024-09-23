@implementation SYDocumentWorkflowsActivityChangeHandler

- (BOOL)canHandleUserActivityChange:(id)a3 appStateObserver:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;

  v5 = a3;
  v6 = a4;
  if ((SYIsMailApp() & 1) == 0)
  {
    v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    v16 = 0;
    v10 = "User activity isn't from Mail";
    v11 = (uint8_t *)&v16;
LABEL_14:
    _os_log_impl(&dword_1BCC38000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
    goto LABEL_15;
  }
  if ((objc_msgSend(v6, "appIsActive") & 1) == 0)
  {
    v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    v15 = 0;
    v10 = "App changed user activity while it is inactive";
    v11 = (uint8_t *)&v15;
    goto LABEL_14;
  }
  if ((SYIsCurrentLocalUserActivity(v5) & 1) == 0)
  {
    v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    v14 = 0;
    v10 = "User activity isn't the current user activity";
    v11 = (uint8_t *)&v14;
    goto LABEL_14;
  }
  +[SYDocumentWorkflowsActivityChangeHandler _indexKeyFromUserActivity:](SYDocumentWorkflowsActivityChangeHandler, "_indexKeyFromUserActivity:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13 = 0;
      v10 = "User activity doesn't have an index key";
      v11 = (uint8_t *)&v13;
      goto LABEL_14;
    }
LABEL_15:

    v8 = 0;
    goto LABEL_16;
  }
  v8 = 1;
LABEL_16:

  return v8;
}

- (SYDocumentWorkflowsActivityChangeHandler)init
{
  SYDocumentWorkflowsActivityChangeHandler *v2;
  SYDocumentWorkflowsClient *v3;
  SYDocumentWorkflowsClient *client;
  dispatch_queue_t v5;
  OS_dispatch_queue *retryQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SYDocumentWorkflowsActivityChangeHandler;
  v2 = -[SYDocumentWorkflowsActivityChangeHandler init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SYDocumentWorkflowsClient);
    client = v2->_client;
    v2->_client = v3;

    v5 = dispatch_queue_create("com.apple.synapse.DocumentWorkflowsActivityChangeHandler.retryQueue", 0);
    retryQueue = v2->_retryQueue;
    v2->_retryQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

+ (id)_indexKeyFromUserActivity:(id)a3
{
  return (id)objc_msgSend(a3, "_syRelatedUniqueIdentifier");
}

- (void)handleActiveUserActivityChange:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  SYDocumentWorkflowsClient *client;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  SYDocumentWorkflowsActivityChangeHandler *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke;
  v27[3] = &unk_1E757B5D0;
  v9 = v7;
  v28 = v9;
  v10 = (void *)MEMORY[0x1BCCFF08C](v27);
  +[SYDocumentWorkflowsActivityChangeHandler _indexKeyFromUserActivity:](SYDocumentWorkflowsActivityChangeHandler, "_indexKeyFromUserActivity:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v11;
    _os_log_impl(&dword_1BCC38000, v12, OS_LOG_TYPE_INFO, "Handle user activity with index key: %@", buf, 0xCu);
  }

  v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[SYDocumentWorkflowsActivityChangeHandler handleActiveUserActivityChange:withCompletion:].cold.1(v6, v13);

  v14 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v11;
    _os_log_impl(&dword_1BCC38000, v14, OS_LOG_TYPE_INFO, "Saving current user activity for message with index key: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (__CFString *)v16;
  else
    v18 = &stru_1E757CA18;
  v19 = v18;

  objc_msgSend(v6, "setTitle:", &stru_1E757CA18);
  client = self->_client;
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_7;
  v23[3] = &unk_1E757BEE8;
  v25 = self;
  v26 = v10;
  v24 = v11;
  v21 = v11;
  v22 = v10;
  -[SYDocumentWorkflowsClient saveUserActivity:forDocumentIndexKey:sourceBundleIdentifier:completion:](client, "saveUserActivity:forDocumentIndexKey:sourceBundleIdentifier:completion:", v6, v21, v19, v23);

}

uint64_t __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  v7 = v6;
  if (!v5 || (a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1BCC38000, v7, OS_LOG_TYPE_INFO, "Fetching attachments for message with index key: %@", buf, 0xCu);
    }

    v9 = *(void **)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_9;
    v11[3] = &unk_1E757C150;
    v12 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v9, "_fetchAttributesForItemsWithIndexKeys:maxRetryCount:completion:", v10, 3, v11);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_7_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t v7;
  os_log_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  v8 = v7;
  if (v5 || !v6)
  {
    v29 = v6;
    v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(v5, "count");
      v11 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v38 = v10;
      v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_1BCC38000, v9, OS_LOG_TYPE_INFO, "Found %ld attachments for message with index key: %@", buf, 0x16u);
    }
    v28 = a1;

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = v5;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (!v13)
    {
LABEL_27:

      (*(void (**)(void))(*(_QWORD *)(v28 + 40) + 16))();
      v6 = v29;
      v5 = v30;
      goto LABEL_28;
    }
    v14 = v13;
    v15 = *(_QWORD *)v33;
LABEL_10:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v16);
      objc_msgSend(v17, "originalFileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[SYDocumentAttributes documentAttributesForFileAtURL:](SYDocumentAttributes, "documentAttributesForFileAtURL:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v17, "originalFileURL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v38 = (uint64_t)v21;
          _os_log_impl(&dword_1BCC38000, v20, OS_LOG_TYPE_INFO, "Skip attachment with existing document attributes, URL: %@", buf, 0xCu);

        }
        v22 = v20;
        goto LABEL_23;
      }
      objc_msgSend(v17, "originalFileURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v24 = objc_msgSend(v17, "saveToFileURL:error:", v23, &v31);
      v22 = v31;

      v25 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      v20 = v25;
      if ((v24 & 1) == 0)
        break;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v17, "originalFileURL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = (uint64_t)v26;
        _os_log_impl(&dword_1BCC38000, v20, OS_LOG_TYPE_INFO, "Extended attributes added to URL: %@", buf, 0xCu);
LABEL_20:

      }
LABEL_22:

LABEL_23:
      if (v14 == ++v16)
      {
        v27 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        v14 = v27;
        if (!v27)
          goto LABEL_27;
        goto LABEL_10;
      }
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    objc_msgSend(v17, "originalFileURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v38 = (uint64_t)v26;
    v39 = 2112;
    v40 = v22;
    _os_log_error_impl(&dword_1BCC38000, v20, OS_LOG_TYPE_ERROR, "Unable to save extended attributes to URL: %@, error: %@", buf, 0x16u);
    goto LABEL_20;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_9_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_28:

}

- (void)_fetchAttributesForItemsWithIndexKeys:(id)a3 maxRetryCount:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v8;
    v19 = 2048;
    v20 = a4;
    _os_log_impl(&dword_1BCC38000, v10, OS_LOG_TYPE_INFO, "Fetching attributes for items with index keys: %@, retryCount: %ld", buf, 0x16u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__SYDocumentWorkflowsActivityChangeHandler__fetchAttributesForItemsWithIndexKeys_maxRetryCount_completion___block_invoke;
  v13[3] = &unk_1E757C1A0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  +[SYDocumentAttributesFetchRequest fetchAttributesForDocumentsWithIndexKeys:completion:](SYDocumentAttributesFetchRequest, "fetchAttributesForDocumentsWithIndexKeys:completion:", v12, v13);

}

void __107__SYDocumentWorkflowsActivityChangeHandler__fetchAttributesForItemsWithIndexKeys_maxRetryCount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v5 = a2;
  v6 = a3;
  if (v6 || objc_msgSend(v5, "count") || *(uint64_t *)(a1 + 56) < 1)
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v8 = dispatch_time(0, 1500000000);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __107__SYDocumentWorkflowsActivityChangeHandler__fetchAttributesForItemsWithIndexKeys_maxRetryCount_completion___block_invoke_2;
    block[3] = &unk_1E757C178;
    objc_copyWeak(v16, &location);
    v10 = *(id *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v11 = *(void **)(a1 + 56);
    v14 = v10;
    v16[1] = v11;
    v15 = v12;
    dispatch_after(v8, v9, block);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }

}

void __107__SYDocumentWorkflowsActivityChangeHandler__fetchAttributesForItemsWithIndexKeys_maxRetryCount_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_fetchAttributesForItemsWithIndexKeys:maxRetryCount:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56) - 1, *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_retryQueue, 0);
}

- (void)handleActiveUserActivityChange:(void *)a1 withCompletion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_syLoggableDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v4, 0xCu);

}

void __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_7_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_1(&dword_1BCC38000, v0, v1, "Unable to save user activity for index key: %@, error: %@");
}

void __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_9_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_1(&dword_1BCC38000, v0, v1, "Unable to fetch attachments for message with index key: %@, error: %@");
}

@end
