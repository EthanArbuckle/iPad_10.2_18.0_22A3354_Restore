@implementation WFFileArbiter

- (void)extendDocumentURLs:(id)a3 workflowID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a4;
  v12 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__WFFileArbiter_extendDocumentURLs_workflowID_completion___block_invoke;
  v13[3] = &unk_1E7AEE5D8;
  v13[4] = self;
  v14 = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__WFFileArbiter_extendDocumentURLs_workflowID_completion___block_invoke_3;
  v11[3] = &unk_1E7AEE600;
  v9 = v12;
  v10 = v8;
  objc_msgSend(a3, "if_enumerateAsynchronously:completionHandler:", v13, v11);

}

- (void)extendDocumentURL:(id)a3 workflowID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__18495;
  v16[4] = __Block_byref_object_dispose__18496;
  v17 = 0;
  v14[4] = v16;
  v15 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__WFFileArbiter_extendDocumentURL_workflowID_completion___block_invoke;
  v14[3] = &unk_1E7AF0FB0;
  objc_msgSend(v10, "coordinateReadingItemAtURL:options:error:byAccessor:", v7, 0, &v15, v14);
  v11 = v15;
  v13 = v9;
  v12 = v8;
  FPExtendBookmarkForDocumentURL();

  _Block_object_dispose(v16, 8);
}

void __57__WFFileArbiter_extendDocumentURL_workflowID_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __57__WFFileArbiter_extendDocumentURL_workflowID_completion___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[4];
    v17 = 0;
    objc_msgSend(v5, "createBookmarkWithBookmarkableString:path:workflowID:error:", a2, v6, v7, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;

    getWFFilesLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[WFFileArbiter extendDocumentURL:workflowID:completion:]_block_invoke";
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEFAULT, "%s Successfully created bookmark", buf, 0xCu);
      }

      (*(void (**)(void))(a1[5] + 16))();
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[WFFileArbiter extendDocumentURL:workflowID:completion:]_block_invoke";
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Could not create bookmark with error: %@ ", buf, 0x16u);
      }

      v14 = a1[5];
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "wf_fileExists"))
        v15 = 257;
      else
        v15 = 4;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v16);

    }
  }
  else
  {
    getWFFilesLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFFileArbiter extendDocumentURL:workflowID:completion:]_block_invoke_2";
      v20 = 2112;
      v21 = a3;
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Could not extend bookmark with error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
}

void __58__WFFileArbiter_extendDocumentURLs_workflowID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__WFFileArbiter_extendDocumentURLs_workflowID_completion___block_invoke_2;
  v10[3] = &unk_1E7AF8860;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "extendDocumentURL:workflowID:completion:", a2, v7, v10);

}

uint64_t __58__WFFileArbiter_extendDocumentURLs_workflowID_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3 == 0);
}

uint64_t __58__WFFileArbiter_extendDocumentURLs_workflowID_completion___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
    v4 = 0;
  else
    v4 = a3;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

@end
