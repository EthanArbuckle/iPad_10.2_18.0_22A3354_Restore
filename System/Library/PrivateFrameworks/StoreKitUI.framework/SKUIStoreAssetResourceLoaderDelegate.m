@implementation SKUIStoreAssetResourceLoaderDelegate

+ (id)storeAssetResourceLoaderDelegateForPlayableAsset:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKUIStoreAssetResourceLoaderDelegate *v15;
  SKUIStoreAssetResourceLoaderDelegate *v16;
  NSURL *clientContext;
  uint64_t v18;
  NSURL *v19;
  SKUIStoreAssetResourceLoaderDelegate *v20;
  NSURL *keyCertificateURL;
  NSURL *v22;
  NSURL *keyServerURL;
  SKUIClientContext *v24;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUIStoreAssetResourceLoaderDelegate storeAssetResourceLoaderDelegateForPlayableAsset:clientContext:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  if (!objc_msgSend(v5, "shouldUseITunesStoreSecureKeyDelivery"))
  {
    objc_msgSend(v5, "keyCertificateURL");
    clientContext = (NSURL *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyServerURL");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (NSURL *)v18;
    if (!clientContext || !v18 || (v20 = objc_alloc_init(SKUIStoreAssetResourceLoaderDelegate)) == 0)
    {

      v16 = 0;
      goto LABEL_14;
    }
    v16 = v20;
    keyCertificateURL = v20->_keyCertificateURL;
    v20->_keyCertificateURL = clientContext;
    v22 = clientContext;

    keyServerURL = v16->_keyServerURL;
    v16->_keyServerURL = v19;

    v16->_isITunesStream = objc_msgSend(v5, "isITunesStream");
LABEL_12:
    v24 = (SKUIClientContext *)v6;
    clientContext = (NSURL *)v16->_clientContext;
    v16->_clientContext = v24;
LABEL_14:

    goto LABEL_15;
  }
  v15 = objc_alloc_init(SKUIStoreAssetResourceLoaderDelegate);
  v16 = v15;
  if (v15)
  {
    v15->_shouldUseITunesStoreSecureKeyDelivery = 1;
    goto LABEL_12;
  }
LABEL_15:

  return v16;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  NSOperationQueue *v17;
  NSOperationQueue *operationQueue;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  _QWORD aBlock[4];
  id v32;
  SKUIStoreAssetResourceLoaderDelegate *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  id *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIStoreAssetResourceLoaderDelegate resourceLoader:shouldWaitForLoadingOfRequestedResource:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = SSVAssetResourceLoadingRequestContainsSecureKeyDeliveryRequest();
  if (v16)
  {
    if (!self->_operationQueue)
    {
      v17 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
      operationQueue = self->_operationQueue;
      self->_operationQueue = v17;

      -[NSOperationQueue setName:](self->_operationQueue, "setName:", CFSTR("com.apple.StoreKitUI.SKUIStoreAssetResourceLoaderDelegate.operationQueue"));
      -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 3);
    }
    v47 = 0;
    v48 = (id *)&v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__4;
    v51 = __Block_byref_object_dispose__4;
    v52 = 0;
    v41 = 0;
    v42 = (id *)&v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__4;
    v45 = __Block_byref_object_dispose__4;
    v46 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v19 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __95__SKUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke;
    aBlock[3] = &unk_1E73A12F8;
    v34 = &v47;
    v35 = &v41;
    v36 = &v37;
    v32 = v7;
    v33 = self;
    v20 = _Block_copy(aBlock);
    if (self->_shouldUseITunesStoreSecureKeyDelivery)
    {
      *((_BYTE *)v38 + 24) = 1;
      -[SKUIClientContext URLBag](self->_clientContext, "URLBag");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = v21;
      }
      else
      {
        v24 = (void *)MEMORY[0x1E0DAF658];
        objc_msgSend(MEMORY[0x1E0DAF660], "contextWithBagType:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "URLBagForContext:", v25);
        v23 = (id)objc_claimAutoreleasedReturnValue();

      }
      v27[0] = v19;
      v27[1] = 3221225472;
      v27[2] = __95__SKUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3;
      v27[3] = &unk_1E73A1320;
      v29 = &v41;
      v30 = &v47;
      v28 = v20;
      objc_msgSend(v23, "loadWithCompletionBlock:", v27);

    }
    else
    {
      objc_storeStrong(v48 + 5, self->_keyCertificateURL);
      objc_storeStrong(v42 + 5, self->_keyServerURL);
      *((_BYTE *)v38 + 24) = self->_isITunesStream;
      (*((void (**)(void *, _QWORD))v20 + 2))(v20, 0);
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(&v47, 8);
  }

  return v16;
}

void __95__SKUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishLoadingWithError:", v3);
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
      && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      v4 = objc_alloc_init(MEMORY[0x1E0DAF6C8]);
      objc_msgSend(v4, "setITunesStoreRequest:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      objc_msgSend(v4, "setCertificateURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v4, "setKeyServerURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      objc_msgSend(v4, "setResourceLoadingRequest:", *(_QWORD *)(a1 + 32));
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __95__SKUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2;
      v6[3] = &unk_1E73A12D0;
      v7 = *(id *)(a1 + 32);
      objc_msgSend(v4, "setResponseBlock:", v6);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addOperation:", v4);

    }
    else
    {
      v5 = *(void **)(a1 + 32);
      SSError();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "finishLoadingWithError:", v4);
    }

  }
}

uint64_t __95__SKUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishLoadingWithError:", a2);
  else
    return objc_msgSend(v2, "finishLoading");
}

void __95__SKUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  if (!v14)
  {
    v5 = (objc_class *)MEMORY[0x1E0DAF6D8];
    v6 = a2;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithURLBagDictionary:", v6);

    objc_msgSend(v7, "pastisKeyServerURL");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[5] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(v7, "pastisCertificateURL");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  (*(void (**)(void))(a1[4] + 16))();

}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
}

+ (void)storeAssetResourceLoaderDelegateForPlayableAsset:(uint64_t)a3 clientContext:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)resourceLoader:(uint64_t)a3 shouldWaitForLoadingOfRequestedResource:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
