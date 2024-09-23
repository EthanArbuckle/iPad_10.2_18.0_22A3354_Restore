@implementation UISceneOpenItemProvidersBSActionsHandler

uint64_t __107___UISceneOpenItemProvidersBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __116___UISceneOpenItemProvidersBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __116___UISceneOpenItemProvidersBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (v6)
    {
      objc_msgSend(v6, "setObject:forKey:", v10, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v10, v5);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
  }

}

uint64_t __116___UISceneOpenItemProvidersBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFinishSendingRequests");
}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_2;
  v9[3] = &unk_1E16D84C0;
  v7 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v6;
  v12 = *(_QWORD *)(a1 + 48);
  v13 = a4;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a2;
  v6 = (void *)*MEMORY[0x1E0CA59C8];
  v13 = v5;
  objc_msgSend(v5, "handlerRank");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqualToString:", v7);

  if ((_DWORD)v6)
  {
    objc_msgSend(v13, "typeIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByExcludingObjectsInArray:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_3;
    v14[3] = &unk_1E16D8498;
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v15 = v10;
    v16 = v11;
    v17 = a3;
    v18 = v12;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

  }
}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  _BYTE *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v6, "conformsToType:", v8))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
    v7 = *(_BYTE **)(a1 + 48);
    **(_BYTE **)(a1 + 56) = 1;
    *v7 = 1;
    *a4 = 1;
  }

}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_5;
  v9[3] = &unk_1E16D84C0;
  v7 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v6;
  v12 = *(_QWORD *)(a1 + 48);
  v13 = a4;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a2, "typeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByExcludingObjectsInArray:", *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_6;
  v10[3] = &unk_1E16D8498;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v11 = v6;
  v12 = v7;
  v13 = a3;
  v14 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _BYTE *v6;

  if (objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
    v6 = *(_BYTE **)(a1 + 48);
    **(_BYTE **)(a1 + 56) = 1;
    *v6 = 1;
    *a4 = 1;
  }
}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_8;
  v9[3] = &unk_1E16D84C0;
  v7 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v6;
  v12 = *(_QWORD *)(a1 + 48);
  v13 = a4;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a2, "typeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByExcludingObjectsInArray:", *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_9;
  v10[3] = &unk_1E16D8498;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v11 = v6;
  v12 = v7;
  v13 = a3;
  v14 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

void __96___UISceneOpenItemProvidersBSActionsHandler_bestUTIForAppFromProviderRegisteredTypeIdentifiers___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  _BYTE *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v6, "conformsToType:", v8))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
    v7 = *(_BYTE **)(a1 + 48);
    **(_BYTE **)(a1 + 56) = 1;
    *v7 = 1;
    *a4 = 1;
  }

}

void __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  __int128 v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a2;
  v8 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__138;
  v27 = __Block_byref_object_dispose__138;
  v9 = v7;
  v28 = v9;
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
    v11 = v24[5];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke_2;
    v14[3] = &unk_1E16D8510;
    v22 = a3;
    v15 = *(_OWORD *)(a1 + 32);
    v16 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    v20 = &v23;
    v12 = *(id *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 88);
    v18 = v12;
    v21 = v13;
    v19 = *(id *)(a1 + 72);
    objc_msgSend(v10, "coordinateReadingItemAtURL:options:error:byAccessor:", v11, 1, 0, v14);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
  _Block_object_dispose(&v23, 8);

}

void __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  UIOpenURLContext *v23;
  id v24;

  if (*(_BYTE *)(a1 + 96))
    goto LABEL_12;
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a2;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_sanitizedSuggestedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    if ((objc_msgSend(v10, "isEqualToString:", v8) & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (objc_msgSend(v10, "length"))
  {
    v11 = v10;

    v8 = v11;
LABEL_7:
    objc_msgSend(v9, "stringByDeletingPathExtension");
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 40), "uniqueFileNameWithStakedClaims:hint:extension:", *(_QWORD *)(a1 + 48), v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dropped Document Session %@"), *(_QWORD *)(a1 + 56));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingPathComponent:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, 0);
  objc_msgSend(v16, "stringByAppendingPathComponent:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v5, "removeItemAtPath:error:", v17, 0);
    v24 = 0;
    objc_msgSend(v5, "copyItemAtPath:toPath:error:", v6, v17, &v24);
    v18 = v24;
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

LABEL_12:
  objc_msgSend(*(id *)(a1 + 40), "openURLOptionsFromBasePayload:sourceProcessHandle:dragContentOwner:", *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 88));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[UIOpenURLContext initWithURL:options:]([UIOpenURLContext alloc], "initWithURL:options:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v22);
  objc_msgSend(*(id *)(a1 + 72), "addObject:", v23);

}

uint64_t __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __123___UISceneOpenItemProvidersBSActionsHandler_URLContextsFetchedFromItemProviders_collectionIdentifier_contentOwner_payload___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88___UISceneOpenItemProvidersBSActionsHandler_itemProvidersFromPBItemCollection_userInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setMetadataValue:forKey:", a3, a2);
}

void __74___UISceneOpenItemProvidersBSActionsHandler_dragContinuationFromEndpoint___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("error: %@"), a2);
}

void __80___UISceneOpenItemProvidersBSActionsHandler_itemCollectionFromDragContinuation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setDataProviderEndpoint:", v7);

}

@end
