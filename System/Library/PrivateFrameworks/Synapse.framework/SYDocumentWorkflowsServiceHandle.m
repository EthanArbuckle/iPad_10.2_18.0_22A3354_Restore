@implementation SYDocumentWorkflowsServiceHandle

- (SYDocumentWorkflowsServiceHandle)initWithRepository:(id)a3
{
  id v5;
  SYDocumentWorkflowsServiceHandle *v6;
  SYDocumentWorkflowsServiceHandle *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYDocumentWorkflowsServiceHandle;
  v6 = -[SYDocumentWorkflowsServiceHandle init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_repository, a3);

  return v7;
}

- (void)fetchAttributesForDocumentsWithIndexKeys:(id)a3 completion:(id)a4
{
  +[SYDocumentAttributesFetchRequest fetchAttributesForDocumentsWithIndexKeys:completion:](SYDocumentAttributesFetchRequest, "fetchAttributesForDocumentsWithIndexKeys:completion:", a3, a4);
}

- (void)fetchUserActivityForDocumentIndexKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;
  SYUserActivityWrapper *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__SYDocumentWorkflowsServiceHandle_fetchUserActivityForDocumentIndexKey_completion___block_invoke;
  v15[3] = &unk_1E757BDD0;
  v8 = v7;
  v16 = v8;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v15);
  v14 = 0;
  -[SYDocumentWorkflowsServiceHandle _fetchUserActivityWithRelatedUniqueIdentifier:error:](self, "_fetchUserActivityWithRelatedUniqueIdentifier:error:", v6, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;
  if (v10)
  {
    v12 = -[SYUserActivityWrapper initWithUserActivity:]([SYUserActivityWrapper alloc], "initWithUserActivity:", v10);
    ((void (**)(_QWORD, SYUserActivityWrapper *, _QWORD))v9)[2](v9, v12, 0);

  }
  else
  {
    v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SYDocumentWorkflowsServiceHandle fetchUserActivityForDocumentIndexKey:completion:].cold.1((uint64_t)v6);

    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v11);
  }

}

uint64_t __84__SYDocumentWorkflowsServiceHandle_fetchUserActivityForDocumentIndexKey_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_fetchUserActivityWithRelatedUniqueIdentifier:(id)a3 error:(id *)a4
{
  return -[SYDocumentWorkflowsRepository fetchUserActivityWithRelatedUniqueIdentifier:error:](self->_repository, "fetchUserActivityWithRelatedUniqueIdentifier:error:", a3, a4);
}

- (void)saveUserActivity:(id)a3 forDocumentIndexKey:(id)a4 sourceBundleIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  SYDocumentWorkflowsRepository *repository;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v10 = a4;
  v11 = a6;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __107__SYDocumentWorkflowsServiceHandle_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke;
  v22[3] = &unk_1E757B5D0;
  v12 = v11;
  v23 = v12;
  v13 = a5;
  v14 = a3;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v22);
  repository = self->_repository;
  objc_msgSend(v14, "userActivity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v18 = -[SYDocumentWorkflowsRepository saveUserActivity:forRelatedUniqueIdentifier:sourceBundleIdentifier:error:](repository, "saveUserActivity:forRelatedUniqueIdentifier:sourceBundleIdentifier:error:", v17, v10, v13, &v21);

  v19 = v21;
  if ((v18 & 1) == 0)
  {
    v20 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SYDocumentWorkflowsServiceHandle saveUserActivity:forDocumentIndexKey:sourceBundleIdentifier:completion:].cold.1((uint64_t)v10);

  }
  ((void (**)(_QWORD, uint64_t, id))v15)[2](v15, v18, v19);

}

uint64_t __107__SYDocumentWorkflowsServiceHandle_saveUserActivity_forDocumentIndexKey_sourceBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)returnToSenderDocument:(id)a3 withAttributes:(id)a4 shouldCreateNewMessage:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[5];
  void (**v41)(_QWORD, _QWORD, _QWORD);
  _QWORD v42[5];
  void (**v43)(_QWORD, _QWORD, _QWORD);
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;
  _QWORD v55[4];

  v7 = a5;
  v55[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke;
  v46[3] = &unk_1E757B5D0;
  v13 = v12;
  v47 = v13;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v46);
  objc_msgSend(v11, "sourceBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    v45 = 0;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v15, 1, &v45);
    v17 = v45;
    v18 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    v19 = v18;
    if (!v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SYDocumentWorkflowsServiceHandle returnToSenderDocument:withAttributes:shouldCreateNewMessage:completion:].cold.1((uint64_t)v15);

      ((void (**)(_QWORD, _QWORD, id))v14)[2](v14, 0, v17);
      goto LABEL_26;
    }
    v36 = v7;
    v39 = v10;
    v20 = v18;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "sender");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v49 = v15;
      v50 = 2112;
      v51 = v39;
      v52 = 2112;
      v53 = v21;
      _os_log_impl(&dword_1BCC38000, v20, OS_LOG_TYPE_INFO, "Found record for bundle identifier: %@, to return document: %@, to sender: %@", buf, 0x20u);

    }
    objc_msgSend(v11, "indexKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    -[SYDocumentWorkflowsServiceHandle _fetchUserActivityWithRelatedUniqueIdentifier:error:](self, "_fetchUserActivityWithRelatedUniqueIdentifier:error:", v22, &v44);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v44;

    v37 = v24;
    v38 = (void *)v23;
    if (v23 || !v24)
    {
      v10 = v39;
      if (v38)
      {
        v28 = v38;
        goto LABEL_17;
      }
    }
    else
    {
      v25 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      v10 = v39;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[SYDocumentWorkflowsServiceHandle returnToSenderDocument:withAttributes:shouldCreateNewMessage:completion:].cold.3(v11, (uint64_t)v24, v25);

    }
    -[SYDocumentWorkflowsServiceHandle _fallbackUserActivityForDocumentWithAttributes:](self, "_fallbackUserActivityForDocumentWithAttributes:", v11);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      v34 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[SYDocumentWorkflowsServiceHandle returnToSenderDocument:withAttributes:shouldCreateNewMessage:completion:].cold.2(v11, v34);

      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke_10;
      v42[3] = &unk_1E757BEC0;
      v42[4] = v15;
      v43 = v14;
      objc_msgSend(v35, "openApplicationWithBundleIdentifier:configuration:completionHandler:", v15, 0, v42);

      goto LABEL_25;
    }
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CA5920], "_syReturnToSenderActivityWithOriginalUserActivity:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v10)
      -[NSUserActivity set_syDocument:](v29, v10);
    objc_msgSend(v30, "set_syShouldCreateNewMessage:", v36);
    v31 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v30, "_syLoggableDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v49 = v15;
      v50 = 2112;
      v51 = v32;
      _os_log_impl(&dword_1BCC38000, v31, OS_LOG_TYPE_INFO, "Launching app: %@, with user activity: %@", buf, 0x16u);

      v10 = v39;
    }

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke_12;
    v40[3] = &unk_1E757BEC0;
    v40[4] = v15;
    v41 = v14;
    objc_msgSend(v33, "openUserActivity:usingApplicationRecord:configuration:completionHandler:", v30, v16, 0, v40);

LABEL_25:
LABEL_26:

    goto LABEL_27;
  }
  v26 = (void *)MEMORY[0x1E0CB35C8];
  v54 = *MEMORY[0x1E0CB2D50];
  v55[0] = CFSTR("document source bundle identifier is empty.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.synapse"), -129, v27);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, _QWORD, id))v14)[2](v14, 0, v17);
LABEL_27:

}

uint64_t __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke_10(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke_10_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke_10_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_fallbackUserActivityForDocumentWithAttributes:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "sourceBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SYIsMailBundleId(v4, v5);

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.mail.message"));
    objc_msgSend(v3, "indexKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "set_syRelatedUniqueIdentifier:", v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)hasOriginalDocumentForFileAtURL:(id)a3 withAttributes:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  _QWORD v26[4];
  id v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __94__SYDocumentWorkflowsServiceHandle_hasOriginalDocumentForFileAtURL_withAttributes_completion___block_invoke;
  v26[3] = &unk_1E757B7B0;
  v11 = v9;
  v27 = v11;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v26);
  v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v14;
    _os_log_impl(&dword_1BCC38000, v13, OS_LOG_TYPE_INFO, "Asking for original document of file at url: %@", buf, 0xCu);

  }
  objc_msgSend(v7, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((SYPathIsInMailDownloadsDir(v15) & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v7, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "hasPrefix:", CFSTR("/private/var/mobile/tmp/com.apple.email.maild/")))
  {

LABEL_6:
    goto LABEL_7;
  }
  v19 = objc_msgSend(v16, "hasPrefix:", CFSTR("/var/mobile/tmp/com.apple.email.maild/"));

  if ((v19 & 1) == 0)
  {
    objc_msgSend(v8, "indexKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __94__SYDocumentWorkflowsServiceHandle_hasOriginalDocumentForFileAtURL_withAttributes_completion___block_invoke_17;
    v22[3] = &unk_1E757BD30;
    v23 = v7;
    v24 = v8;
    v25 = v12;
    +[SYDocumentAttributesFetchRequest fetchAttributesForDocumentsWithIndexKeys:completion:](SYDocumentAttributesFetchRequest, "fetchAttributesForDocumentsWithIndexKeys:completion:", v21, v22);

    goto LABEL_10;
  }
LABEL_7:
  v17 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v18;
    _os_log_impl(&dword_1BCC38000, v17, OS_LOG_TYPE_INFO, "Requested original of document considered the original itself, url: %@", buf, 0xCu);

  }
  v12[2](v12, 0, 0);
LABEL_10:

}

uint64_t __94__SYDocumentWorkflowsServiceHandle_hasOriginalDocumentForFileAtURL_withAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __94__SYDocumentWorkflowsServiceHandle_hasOriginalDocumentForFileAtURL_withAttributes_completion___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("/var/tmp/com.apple.email.maild/"));

  objc_msgSend(*(id *)(a1 + 40), "originalFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("/var/mobile/Library/Mail/AttachmentData/"));

  v12 = v8 & v11;
  v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "indexKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "originalFileURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412802;
    v20 = v14;
    v21 = 2112;
    v22 = v17;
    v23 = 1024;
    v24 = v12;
    _os_log_impl(&dword_1BCC38000, v13, OS_LOG_TYPE_INFO, "Original document version of file with id: %@, found at: %@, suppressed: %{BOOL}d", (uint8_t *)&v19, 0x1Cu);

  }
  if ((v12 & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)hasLastModifiedDocument:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__SYDocumentWorkflowsServiceHandle_hasLastModifiedDocument_completion___block_invoke;
  v14[3] = &unk_1E757BFD8;
  v15 = v6;
  v8 = v6;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __71__SYDocumentWorkflowsServiceHandle_hasLastModifiedDocument_completion___block_invoke_2;
  v11[3] = &unk_1E757BF88;
  v12 = v5;
  v13 = (id)MEMORY[0x1BCCFF08C](v14);
  v9 = v5;
  v10 = v13;
  +[SYLastModifiedDocumentFetchRequest fetchLastModifiedDocument:completion:](SYLastModifiedDocumentFetchRequest, "fetchLastModifiedDocument:completion:", v9, v11);

}

uint64_t __71__SYDocumentWorkflowsServiceHandle_hasLastModifiedDocument_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __71__SYDocumentWorkflowsServiceHandle_hasLastModifiedDocument_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    a3;
    objc_msgSend(v5, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = SYPathIsInMailDownloadsDir(v7);

    objc_msgSend(v5, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v13, "URLByAppendingPathComponent:", CFSTR("Containers/com.apple.Preview/Data/tmp/"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v13) = objc_msgSend(v10, "hasPrefix:", v15);
    v16 = v8 | v13;
    v17 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "fileURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v18;
      v23 = 2112;
      v24 = v20;
      v25 = 1024;
      v26 = v16;
      _os_log_impl(&dword_1BCC38000, v17, OS_LOG_TYPE_INFO, "Last document version of file with id: %@, found at: %@, suppressed: %{BOOL}d", buf, 0x1Cu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, a3);
  }

}

- (void)openLastModifiedDocument:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__SYDocumentWorkflowsServiceHandle_openLastModifiedDocument_completion___block_invoke;
  v13[3] = &unk_1E757B5D0;
  v14 = v6;
  v8 = v6;
  v9 = a3;
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __72__SYDocumentWorkflowsServiceHandle_openLastModifiedDocument_completion___block_invoke_2;
  v11[3] = &unk_1E757BF88;
  v11[4] = self;
  v12 = (id)MEMORY[0x1BCCFF08C](v13);
  v10 = v12;
  +[SYLastModifiedDocumentFetchRequest fetchLastModifiedDocument:completion:](SYLastModifiedDocumentFetchRequest, "fetchLastModifiedDocument:completion:", v9, v11);

}

uint64_t __72__SYDocumentWorkflowsServiceHandle_openLastModifiedDocument_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __72__SYDocumentWorkflowsServiceHandle_openLastModifiedDocument_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createOpenLastModifiedDocumentImpl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__SYDocumentWorkflowsServiceHandle_openLastModifiedDocument_completion___block_invoke_3;
    v6[3] = &unk_1E757B5D0;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v4, "revealDocumentAtURL:completion:", v5, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __72__SYDocumentWorkflowsServiceHandle_openLastModifiedDocument_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_createOpenLastModifiedDocumentImpl
{
  return objc_alloc_init(SYOpenLastModifiedDocumentImplUIKit);
}

- (void)updateLinkedDocumentsWithCompletion:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke;
  v9[3] = &unk_1E757B5D0;
  v10 = v3;
  v5 = v3;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E757BE48;
  v8 = (id)MEMORY[0x1BCCFF08C](v9);
  v6 = v8;
  +[SYDocumentFetchRequest fetchAllDocumentsMatchingAnyIndexIdWithCompletion:](SYDocumentFetchRequest, "fetchAllDocumentsMatchingAnyIndexIdWithCompletion:", v7);

}

uint64_t __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v22 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1BCC38000, v7, OS_LOG_TYPE_INFO, "Found %ld linked document(s) matching any index key", buf, 0xCu);
  }

  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_28;
    v19[3] = &unk_1E757C648;
    v10 = v8;
    v20 = v10;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v19);
    v11 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134218242;
      v22 = v12;
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_1BCC38000, v11, OS_LOG_TYPE_INFO, "Found %ld linked document(s) with index keys: %@", buf, 0x16u);
    }

    objc_msgSend(v10, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_30;
    v15[3] = &unk_1E757C670;
    v16 = v10;
    v18 = *(id *)(a1 + 32);
    v17 = v5;
    v14 = v10;
    +[SYDocumentAttributesFetchRequest fetchAttributesForDocumentsWithIndexKeys:completion:](SYDocumentAttributesFetchRequest, "fetchAttributesForDocumentsWithIndexKeys:completion:", v13, v15);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_28(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "documentId");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  id v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v26 = v6;
    v33 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v27 = v5;
    obj = v5;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    v8 = 0;
    if (v31)
    {
      v29 = *(_QWORD *)v42;
      v9 = 1;
      v30 = a1;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v42 != v29)
            objc_enumerationMutation(obj);
          v32 = v10;
          v34 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v10);
          objc_msgSend(v34, "indexKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v35 = *(id *)(a1 + 40);
          v12 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v38 != v14)
                  objc_enumerationMutation(v35);
                v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                objc_msgSend(v16, "documentId");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "isEqualToString:", v11);

                if (v18)
                {
                  v19 = os_log_create("com.apple.synapse", "DocumentWorkflows");
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v16, "fileURL");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "path");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v46 = v21;
                    _os_log_impl(&dword_1BCC38000, v19, OS_LOG_TYPE_INFO, "Linking: %@", buf, 0xCu);

                  }
                  objc_msgSend(v16, "fileURL");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = 0;
                  v23 = objc_msgSend(v34, "saveToFileURL:error:", v22, &v36);

                  v8 += v23;
                  v9 &= v23;
                  objc_msgSend(v33, "removeObject:", v11);
                }
              }
              v13 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
            }
            while (v13);
          }

          v10 = v32 + 1;
          a1 = v30;
        }
        while (v32 + 1 != v31);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v31);
    }

    v25 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v46 = v8;
      _os_log_impl(&dword_1BCC38000, v25, OS_LOG_TYPE_INFO, "Linked %ld documents.", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v7 = v26;
    v5 = v27;
  }
  else
  {
    v24 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_30_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)unlinkDocumentsWithRelatedUniqueIdentifiers:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v5;
    _os_log_impl(&dword_1BCC38000, v7, OS_LOG_TYPE_INFO, "Unlinking documents with ids: %{public}@", buf, 0xCu);
  }

  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__SYDocumentWorkflowsServiceHandle_unlinkDocumentsWithRelatedUniqueIdentifiers_completion___block_invoke;
  v15[3] = &unk_1E757B5D0;
  v16 = v6;
  v9 = v6;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __91__SYDocumentWorkflowsServiceHandle_unlinkDocumentsWithRelatedUniqueIdentifiers_completion___block_invoke_2;
  v12[3] = &unk_1E757C150;
  v13 = v5;
  v14 = (id)MEMORY[0x1BCCFF08C](v15);
  v10 = v14;
  v11 = v5;
  +[SYDocumentFetchRequest fetchDocumentsWithIndexIds:completion:](SYDocumentFetchRequest, "fetchDocumentsWithIndexIds:completion:", v11, v12);

}

uint64_t __91__SYDocumentWorkflowsServiceHandle_unlinkDocumentsWithRelatedUniqueIdentifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __91__SYDocumentWorkflowsServiceHandle_unlinkDocumentsWithRelatedUniqueIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t v7;
  os_log_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t v24;
  const char *v25;
  const char *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  v8 = v7;
  if (v5)
  {
    v33 = v6;
    v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(v5, "count");
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v43 = v10;
      v44 = 2114;
      v45 = v11;
      _os_log_impl(&dword_1BCC38000, v9, OS_LOG_TYPE_INFO, "Found %ld documents to unlink for ids: %{public}@", buf, 0x16u);
    }
    v32 = a1;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v34 = v5;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v38;
      v17 = "com.apple.synapse";
      v18 = "DocumentWorkflows";
      v19 = 0x1E757A000uLL;
      do
      {
        v20 = 0;
        v35 = v14;
        do
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v20), "fileURL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = os_log_create(v17, v18);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v21, "path");
            v23 = v16;
            v24 = v19;
            v25 = v18;
            v26 = v17;
            v27 = v12;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            v43 = (uint64_t)v28;
            _os_log_impl(&dword_1BCC38000, v22, OS_LOG_TYPE_INFO, "Unlinking: %{private}@", buf, 0xCu);

            v12 = v27;
            v17 = v26;
            v18 = v25;
            v19 = v24;
            v16 = v23;
            v14 = v35;
          }

          v29 = *(void **)(v19 + 2560);
          v36 = 0;
          v15 += objc_msgSend(v29, "_removeDocumentAttributesForFileAtURL:keepDocumentRelatedUniqueIdentifierKey:error:", v21, 1, &v36);

          ++v20;
        }
        while (v14 != v20);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }

    v30 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134218240;
      v43 = (uint64_t)v15;
      v44 = 2048;
      v45 = v31;
      _os_log_impl(&dword_1BCC38000, v30, OS_LOG_TYPE_INFO, "Unlinked %ld/%ld documents.", buf, 0x16u);
    }

    objc_msgSend(v12, "count");
    (*(void (**)(void))(*(_QWORD *)(v32 + 40) + 16))();
    v6 = v33;
    v5 = v34;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_30_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (SYDocumentWorkflowsRepository)repository
{
  return self->_repository;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repository, 0);
}

- (void)fetchUserActivityForDocumentIndexKey:(uint64_t)a1 completion:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1BCC38000, v1, v2, "Unable to fetch user activity for index key: %@, error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)saveUserActivity:(uint64_t)a1 forDocumentIndexKey:sourceBundleIdentifier:completion:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1BCC38000, v1, v2, "Unable to save user activity for document index key: %@, error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)returnToSenderDocument:(uint64_t)a1 withAttributes:shouldCreateNewMessage:completion:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1BCC38000, v1, v2, "Unable to find record for bundle identifier: %@, to return document back to sender, error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)returnToSenderDocument:(void *)a1 withAttributes:(NSObject *)a2 shouldCreateNewMessage:completion:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "indexKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_ERROR, "Unable to find original user activity for document with index key: %@", (uint8_t *)&v4, 0xCu);

}

- (void)returnToSenderDocument:(NSObject *)a3 withAttributes:shouldCreateNewMessage:completion:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "indexKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1BCC38000, a3, OS_LOG_TYPE_ERROR, "Unable to fetch original user activity for index key: %@, error: %@", (uint8_t *)&v6, 0x16u);

}

void __108__SYDocumentWorkflowsServiceHandle_returnToSenderDocument_withAttributes_shouldCreateNewMessage_completion___block_invoke_10_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_1(&dword_1BCC38000, v0, v1, "Unable to launch app with bundle identifier: %@, error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __72__SYDocumentWorkflowsServiceHandle_updateLinkedDocumentsWithCompletion___block_invoke_30_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_1(&dword_1BCC38000, v0, v1, "Unable to fetch documents with index keys: %@, error: %@");
  OUTLINED_FUNCTION_1_0();
}

@end
