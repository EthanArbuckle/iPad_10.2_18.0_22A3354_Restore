@implementation WBSUISafariSandboxBroker

- (void)loadLinkPresentationMetdataForMessageWithGUID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke;
    v8[3] = &unk_1E5443108;
    v9 = v5;
    v10 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v7);

  }
}

void __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  IMSPIQueryMessageWithGUIDAndLoadAttachments();

}

void __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A85D4428]();
  if (objc_msgSend(v3, "count"))
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__29;
    v26 = __Block_byref_object_dispose__29;
    v27 = 0;
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "richLinkMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_23;
    v21[3] = &unk_1E5447FA0;
    v21[4] = &v22;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_27;
    v19 = &unk_1E5443B08;
    v7 = (id)MEMORY[0x1A85D45E4](v21);
    v20 = v7;
    v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D45E4](&v16);
    objc_msgSend(v6, "image", v16, v17, v18, v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v9);

    objc_msgSend(v6, "alternateImages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v10);

    objc_msgSend(v6, "icon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v11);

    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, _QWORD))(v12 + 16))(v12, v13, v23[5], 0);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 5, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v14 + 16))(v14, 0, 0, v15);

  }
  objc_autoreleasePoolPop(v4);

}

void __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_23(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  uint64_t v14;

  objc_msgSend(a2, "platformImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "size");
    v6 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "size");
    if (v6 > v7)
    {
      objc_msgSend(v4, "size");
      v9 = v8;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "size");
      if (v9 > v10)
      {
        objc_msgSend(v4, "size");
        if (v11 <= 8192.0 && (objc_msgSend(v4, "size"), v12 <= 8192.0))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v4);
        }
        else
        {
          v13 = WBS_LOG_CHANNEL_PREFIXStartPage();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_23_cold_1(v13, v4, &v14);
        }
      }
    }
  }

}

void __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)getLinkMetadataForMessageWithGUID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__WBSUISafariSandboxBroker_getLinkMetadataForMessageWithGUID_completionHandler___block_invoke;
    v8[3] = &unk_1E5443108;
    v9 = v5;
    v10 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v7);

  }
}

void __80__WBSUISafariSandboxBroker_getLinkMetadataForMessageWithGUID_completionHandler___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  IMSPIQueryMessageWithGUIDAndLoadAttachments();

}

void __80__WBSUISafariSandboxBroker_getLinkMetadataForMessageWithGUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)MEMORY[0x1A85D4428]();
  v4 = objc_msgSend(v8, "count");
  v5 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v8, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "richLinkMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v7, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);
  }

  objc_autoreleasePoolPop(v3);
}

void __92__WBSUISafariSandboxBroker_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_23_cold_1(void *a1, void *a2, _QWORD *a3)
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3B18];
  v6 = a1;
  objc_msgSend(a2, "size");
  *a3 = v7;
  a3[1] = v8;
  objc_msgSend(v5, "valueWithBytes:objCType:", a3, "{CGSize=dd}");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138543362;
  v11 = v9;
  _os_log_fault_impl(&dword_1A840B000, v6, OS_LOG_TYPE_FAULT, "IMCore platform image too large: %{public}@", (uint8_t *)&v10, 0xCu);

}

@end
