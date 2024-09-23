@implementation NSExtension

void __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  id v9;
  uint64_t v10;
  id *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_2;
    block[3] = &unk_1E16C4F28;
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = &v16;
    v9 = v5;
    v20 = *(_BYTE *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 56);
    v16 = v9;
    v19 = v10;
    v11 = &v17;
    v17 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_5;
    v12[3] = &unk_1E16BAD68;
    v12[4] = *(_QWORD *)(a1 + 32);
    v8 = &v13;
    v13 = v6;
    v11 = &v14;
    v14 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v12);
  }

}

void __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  _UIRemoteViewService *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = NSExtensionHostAccessoryViewControllerClass_block_invoke___s_category;
  if (!NSExtensionHostAccessoryViewControllerClass_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&NSExtensionHostAccessoryViewControllerClass_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v30 = v4;
    v31 = 2114;
    v32 = v5;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "Request completed for extension: %{public}@; contextToken: %{public}@",
      buf,
      0x16u);
  }
  v6 = -[_UIRemoteViewService initWithExtension:andContextToken:]([_UIRemoteViewService alloc], "initWithExtension:andContextToken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v7 = *(unsigned __int8 *)(a1 + 72);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v8, "infoDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("NSExtension"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v7)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("NSExtensionViewControllerHostClass"));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v8, "infoDictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", CFSTR("NSExtensionHostViewControllerClass"));
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(v8, "infoDictionary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", CFSTR("NSExtension"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", CFSTR("NSExtensionHostViewControllerClass"));
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          goto LABEL_9;
        goto LABEL_13;
      }
    }
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("NSExtensionHostAccessoryViewControllerClass"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_12;
  objc_msgSend(v8, "infoDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("NSExtensionHostAccessoryViewControllerClass"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("NSExtension accessory was requested, but no host class was specified. NSExtension: %@"), *(_QWORD *)(a1 + 32));
LABEL_9:
    v14 = (void *)objc_opt_class();
    v12 = 0;
    v15 = 1;
    goto LABEL_14;
  }
LABEL_13:
  v14 = NSClassFromString(v12);
  v15 = 0;
LABEL_14:
  if (v14)
  {
    if ((v15 & 1) != 0)
      goto LABEL_18;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v24 = CFSTR("_UIRemoteViewController");
  if (!v15)
    v24 = (const __CFString *)v12;
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("NSExtension_UIKitAdditions.m"), 79, CFSTR("Unable to instantiate class named %@ for host connection!"), v24);

  if ((v15 & 1) == 0)
  {
LABEL_16:
    if ((objc_msgSend(v14, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("NSExtension_UIKitAdditions.m"), 80, CFSTR("Class %@ is not a subclass of _UIRemoteViewController!"), v12);

    }
  }
LABEL_18:
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_21;
  v26[3] = &unk_1E16C4F00;
  v17 = *(void **)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v26[4] = *(_QWORD *)(a1 + 32);
  v27 = v17;
  v28 = *(id *)(a1 + 56);
  v19 = (id)objc_msgSend(v14, "requestViewControllerWithService:traitCollection:connectionHandler:", v6, v18, v26);

}

void __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id location;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_initWeak(&location, v5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_2_22;
    v9[3] = &unk_1E16BE700;
    v7 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v7;
    objc_copyWeak(&v11, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v9);
    (*(void (**)(_QWORD, _QWORD, id, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v5, 0, v8);
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelExtensionRequestWithIdentifier:", *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_2_22(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_3;
  v3[3] = &unk_1E16B3F40;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_extensionContextForUUID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setRequestCleanUpBlock:", v3);

  objc_destroyWeak(&v4);
}

void __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_4;
  block[3] = &unk_1E16B3F40;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_4(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "disconnect");

}

uint64_t __146__NSExtension_UIViewControllerAdditions___instantiateViewControllerWithInputItems_asAccessory_traitCollection_listenerEndpoint_connectionHandler___block_invoke_5(_QWORD *a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = NSExtensionHostAccessoryViewControllerClass_block_invoke_2___s_category;
  if (!NSExtensionHostAccessoryViewControllerClass_block_invoke_2___s_category)
  {
    v2 = __UILogCategoryGetNode("ViewServices", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&NSExtensionHostAccessoryViewControllerClass_block_invoke_2___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    v5 = a1[5];
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "Request completed for extension: %{public}@; with error: %{public}@",
      (uint8_t *)&v7,
      0x16u);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

@end
