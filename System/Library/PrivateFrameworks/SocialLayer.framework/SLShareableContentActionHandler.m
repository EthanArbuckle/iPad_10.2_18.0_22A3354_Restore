@implementation SLShareableContentActionHandler

+ (SLShareableContentActionHandler)sharedActionHandler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SLShareableContentActionHandler_sharedActionHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedActionHandler_onceToken != -1)
    dispatch_once(&sharedActionHandler_onceToken, block);
  return (SLShareableContentActionHandler *)(id)sharedActionHandler_sExtractor;
}

void __54__SLShareableContentActionHandler_respondToBSActions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  +[SLShareableContentAction actionWithBSAction:](SLShareableContentAction, "actionWithBSAction:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }

}

- (id)respondToBSActions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __54__SLShareableContentActionHandler_respondToBSActions___block_invoke;
  v16 = &unk_1E3795FB8;
  v17 = v6;
  v18 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v13);
  -[SLShareableContentActionHandler performActions:](self, "performActions:", v9, v13, v14, v15, v16);
  v10 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v10, "minusSet:", v8);
  v11 = (void *)objc_msgSend(v10, "copy");

  return v11;
}

- (void)performActions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SLShareableContentActionHandler performAction:](self, "performAction:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __54__SLShareableContentActionHandler_sharedActionHandler__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedActionHandler_sExtractor;
  sharedActionHandler_sExtractor = (uint64_t)v1;

}

- (id)activityItemsConfigurationForScene:(id)a3
{
  return (id)objc_msgSend(a3, "_activityItemsConfiguration");
}

- (id)sceneWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "_FBSScene", (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v3);

        if ((v14 & 1) != 0)
          break;
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v15 = v11;

    if (!v15)
      goto LABEL_13;
    v16 = v15;
  }
  else
  {
LABEL_10:

LABEL_13:
    SLShareableContentLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SLShareableContentActionHandler sceneWithIdentifier:].cold.1();

    v16 = 0;
  }

  return v16;
}

- (id)activityItemsConfigurationForSceneWithIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[SLShareableContentActionHandler sceneWithIdentifier:](self, "sceneWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLShareableContentActionHandler activityItemsConfigurationForScene:](self, "activityItemsConfigurationForScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id CKPostSharingContextClass;
  id v14;
  void *v15;
  id CKContainerSetupInfoClass;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registeredTypeIdentifiersWithFileOptions:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "canLoadObjectOfClass:", getCKPostSharingContextClass()))
  {
    CKPostSharingContextClass = getCKPostSharingContextClass();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke;
    v41[3] = &unk_1E3795ED0;
    v41[4] = self;
    v42 = v8;
    v43 = v9;
    v44 = v10;
    v14 = (id)objc_msgSend(v11, "loadObjectOfClass:completionHandler:", CKPostSharingContextClass, v41);

    v15 = v42;
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v11, "canLoadObjectOfClass:", getCKContainerSetupInfoClass()))
  {
    CKContainerSetupInfoClass = getCKContainerSetupInfoClass();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_10;
    v37[3] = &unk_1E3795ED0;
    v37[4] = self;
    v38 = v8;
    v39 = v9;
    v40 = v10;
    v17 = (id)objc_msgSend(v11, "loadObjectOfClass:completionHandler:", CKContainerSetupInfoClass, v37);

    v15 = v38;
    goto LABEL_13;
  }
  if (objc_msgSend(v11, "canLoadObjectOfClass:", objc_opt_class()))
  {
    v18 = objc_opt_class();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_13;
    v33[3] = &unk_1E3795ED0;
    v33[4] = self;
    v34 = v8;
    v35 = v9;
    v36 = v10;
    v19 = (id)objc_msgSend(v11, "loadObjectOfClass:completionHandler:", v18, v33);

    v15 = v34;
    goto LABEL_13;
  }
  objc_msgSend(v12, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CD7468]))
  {
    v21 = objc_msgSend(v11, "hasItemConformingToTypeIdentifier:", CFSTR("public.file-url"));

    if (v21)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_17;
      v29[3] = &unk_1E3795EF8;
      v29[4] = self;
      v30 = v8;
      v31 = v9;
      v32 = v10;
      objc_msgSend(v11, "loadItemForTypeIdentifier:options:completionHandler:", CFSTR("public.file-url"), 0, v29);

      v15 = v30;
      goto LABEL_13;
    }
  }
  else
  {

  }
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_20;
    v25[3] = &unk_1E3795F48;
    v25[4] = self;
    v26 = v8;
    v27 = v9;
    v28 = v10;
    v23 = (id)objc_msgSend(v11, "loadInPlaceFileRepresentationForTypeIdentifier:completionHandler:", v22, v25);

    v15 = v26;
    goto LABEL_13;
  }
  SLShareableContentLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v11;
    _os_log_impl(&dword_199EFF000, v24, OS_LOG_TYPE_DEFAULT, "Fulfilling action without initiator request for item provider without any registered collaborations: %@", buf, 0xCu);
  }

  -[SLShareableContentActionHandler fulfillMetadataAction:itemProviders:linkMetadata:highlightURL:initiatorRequest:](self, "fulfillMetadataAction:itemProviders:linkMetadata:highlightURL:initiatorRequest:", v8, v9, v10, 0, 0);
LABEL_14:

}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2;
  v11[3] = &unk_1E3795EA8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v11[1] = 3221225472;
  v12 = v5;
  v15 = v8;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2(uint64_t a1)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  getCKPostSharingContextClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 48), "fulfillMetadataAction:itemProviders:linkMetadata:sharingContext:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
  SLShareableContentLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);

  return objc_msgSend(*(id *)(a1 + 48), "fulfillMetadataAction:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_11;
  v11[3] = &unk_1E3795EA8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v11[1] = 3221225472;
  v12 = v5;
  v15 = v8;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_11(uint64_t a1)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  getCKContainerSetupInfoClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 48), "fulfillMetadataAction:itemProviders:linkMetadata:containerSetupInfo:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
  SLShareableContentLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_11_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);

  return objc_msgSend(*(id *)(a1 + 48), "fulfillMetadataAction:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_14;
  v11[3] = &unk_1E3795EA8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v11[1] = 3221225472;
  v12 = v5;
  v15 = v8;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_14(uint64_t a1)
{
  NSObject *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 48), "fulfillMetadataAction:itemProviders:linkMetadata:pendingCollaboration:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
  SLShareableContentLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_14_cold_1(a1, v3);

  return objc_msgSend(*(id *)(a1 + 48), "fulfillMetadataAction:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_18;
  v11[3] = &unk_1E3795EA8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v11[1] = 3221225472;
  v12 = v5;
  v15 = v8;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_18(uint64_t a1)
{
  NSObject *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFileURL") & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 48), "fulfillMetadataAction:itemProviders:linkMetadata:inPlaceFileURL:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
  SLShareableContentLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_18_cold_1();

  return objc_msgSend(*(id *)(a1 + 48), "fulfillMetadataAction:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_20(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v7 = a2;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_21;
  block[3] = &unk_1E3795F20;
  v19 = a3;
  v13 = v7;
  v14 = v8;
  v9 = *(void **)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_21(uint64_t a1)
{
  NSObject *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isFileURL") && *(_BYTE *)(a1 + 80))
    return objc_msgSend(*(id *)(a1 + 48), "fulfillMetadataAction:itemProviders:linkMetadata:inPlaceFileURL:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
  SLShareableContentLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_21_cold_1();

  return objc_msgSend(*(id *)(a1 + 48), "fulfillMetadataAction:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 sharingContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SLShareableContentInitiatorRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  SLShareableContentInitiatorRequest *v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [SLShareableContentInitiatorRequest alloc];
  objc_msgSend(v10, "containerSetupInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SLShareableContentInitiatorRequest initWithContainerSetupInfo:](v14, "initWithContainerSetupInfo:", v15);

  objc_msgSend(v10, "share");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLShareableContentActionHandler fulfillMetadataAction:itemProviders:linkMetadata:highlightURL:initiatorRequest:](self, "fulfillMetadataAction:itemProviders:linkMetadata:highlightURL:initiatorRequest:", v13, v12, v11, v17, v18);

}

- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 containerSetupInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SLShareableContentInitiatorRequest *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[SLShareableContentInitiatorRequest initWithContainerSetupInfo:]([SLShareableContentInitiatorRequest alloc], "initWithContainerSetupInfo:", v10);

  -[SLShareableContentActionHandler fulfillMetadataAction:itemProviders:linkMetadata:highlightURL:initiatorRequest:](self, "fulfillMetadataAction:itemProviders:linkMetadata:highlightURL:initiatorRequest:", v13, v12, v11, 0, v14);
}

- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 pendingCollaboration:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SLShareableContentInitiatorRequest *v15;
  void *v16;
  NSObject *v17;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  objc_msgSend(v12, "collaborationMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = -[SLShareableContentInitiatorRequest initWithCollaborationMetadata:]([SLShareableContentInitiatorRequest alloc], "initWithCollaborationMetadata:", v14);
    objc_msgSend(v12, "fileURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLShareableContentActionHandler fulfillMetadataAction:itemProviders:linkMetadata:highlightURL:initiatorRequest:](self, "fulfillMetadataAction:itemProviders:linkMetadata:highlightURL:initiatorRequest:", v13, v10, v11, v16, v15);

  }
  else
  {
    SLShareableContentLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SLShareableContentActionHandler fulfillMetadataAction:itemProviders:linkMetadata:pendingCollaboration:].cold.1(v17);

    +[SLShareableContentActionResponse response](SLFetchShareableContentMetadataActionResponse, "response");
    v15 = (SLShareableContentInitiatorRequest *)objc_claimAutoreleasedReturnValue();
    -[SLShareableContentActionHandler fulfillMetadataAction:response:](self, "fulfillMetadataAction:response:", v13, v15);

  }
}

- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 inPlaceFileURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SLShareableContentInitiatorRequest *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[SLShareableContentInitiatorRequest initWithFileURL:]([SLShareableContentInitiatorRequest alloc], "initWithFileURL:", v10);
  -[SLShareableContentActionHandler fulfillMetadataAction:itemProviders:linkMetadata:highlightURL:initiatorRequest:](self, "fulfillMetadataAction:itemProviders:linkMetadata:highlightURL:initiatorRequest:", v13, v12, v11, v10, v14);

}

- (void)fulfillMetadataAction:(id)a3 itemProviders:(id)a4 linkMetadata:(id)a5 highlightURL:(id)a6 initiatorRequest:(id)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  SLShareableContentRepresentationCollection *v24;
  void *v25;
  void *v26;
  SLShareableContentRepresentationCollection *v27;
  SLShareableContentMetadata *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  id v34;
  id v35;
  __CFString *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  SLShareableContentMetadata *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v35 = a5;
  v34 = a6;
  v32 = a7;
  objc_msgSend(v11, "sceneIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = &stru_1E3797070;
  if (v14)
    v16 = (__CFString *)v14;
  v36 = v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v24 = [SLShareableContentRepresentationCollection alloc];
        objc_msgSend(v23, "sl_representations");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "suggestedName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[SLShareableContentRepresentationCollection initWithRepresentations:suggestedFileName:](v24, "initWithRepresentations:suggestedFileName:", v25, v26);

        objc_msgSend(v17, "addObject:", v27);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v20);
  }

  v28 = -[SLShareableContentMetadata initWithSceneIdentifier:bundleIdentifier:representations:metadata:highlightURL:]([SLShareableContentMetadata alloc], "initWithSceneIdentifier:bundleIdentifier:representations:metadata:highlightURL:", v31, v36, v17, v35, v34);
  SLShareableContentLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v42 = v28;
    v43 = 2112;
    v44 = v32;
    _os_log_impl(&dword_199EFF000, v29, OS_LOG_TYPE_DEFAULT, "Fulfilling action with metadata: %@ initiatorRequest: %@", buf, 0x16u);
  }

  +[SLFetchShareableContentMetadataActionResponse responseWithMetadata:initiatorRequest:](SLFetchShareableContentMetadataActionResponse, "responseWithMetadata:initiatorRequest:", v28, v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLShareableContentActionHandler fulfillMetadataAction:response:](self, "fulfillMetadataAction:response:", v11, v30);

}

- (void)fulfillMetadataAction:(id)a3 response:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = a3;
  +[SLShareableContentObserver sharedObserver](SLShareableContentObserver, "sharedObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsRefresh");

  objc_msgSend(v7, "fulfillWithResponse:", v5);
}

- (void)fulfillMetadataAction:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = a3;
  +[SLShareableContentObserver sharedObserver](SLShareableContentObserver, "sharedObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsRefresh");

  objc_msgSend(v7, "failWithError:", v5);
}

- (void)fulfillAsynchronousMetadataAction:(id)a3 linkMetadata:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  SLShareableContentLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_199EFF000, v8, OS_LOG_TYPE_DEFAULT, "Fulfilling action with metadata: %@", (uint8_t *)&v10, 0xCu);
  }

  +[SLFetchAsynchronousLPMetadataActionResponse responseWithMetadata:](SLFetchAsynchronousLPMetadataActionResponse, "responseWithMetadata:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLShareableContentActionHandler fulfillAsynchronousMetadataAction:response:](self, "fulfillAsynchronousMetadataAction:response:", v7, v9);

}

- (void)fulfillAsynchronousMetadataAction:(id)a3 response:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = a3;
  +[SLShareableContentObserver sharedObserver](SLShareableContentObserver, "sharedObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsRefresh");

  objc_msgSend(v7, "fulfillWithResponse:", v5);
}

- (void)performFetchShareableContentMetadataAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SLShareableContentLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "sceneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v6;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_DEFAULT, "Fetching on screen content for scene identifier: %@", (uint8_t *)&v18, 0xCu);

  }
  objc_msgSend(v4, "sceneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLShareableContentActionHandler activityItemsConfigurationForSceneWithIdentifier:](self, "activityItemsConfigurationForSceneWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "itemProvidersForActivityItemsConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9 || !objc_msgSend(v9, "count"))
    {
      SLShareableContentLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "sceneIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v14;
        _os_log_impl(&dword_199EFF000, v13, OS_LOG_TYPE_DEFAULT, "Could not find content attached to the given scene with identifier: %@", (uint8_t *)&v18, 0xCu);

      }
      +[SLShareableContentActionResponse response](SLFetchShareableContentMetadataActionResponse, "response");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[SLShareableContentActionHandler fulfillMetadataAction:response:](self, "fulfillMetadataAction:response:", v4, v12);
      goto LABEL_19;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "activityItemsConfigurationMetadataForKey:", *MEMORY[0x1E0DC4700]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_opt_class();
        v12 = v11;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_18;
      }
    }
    else
    {
      v11 = 0;
    }
    v12 = objc_alloc_init(MEMORY[0x1E0CC11A8]);

    -[SLShareableContentActionHandler titleForActivityItemsConfiguration:](self, "titleForActivityItemsConfiguration:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v17);

LABEL_18:
    -[SLShareableContentActionHandler fulfillMetadataAction:itemProviders:linkMetadata:](self, "fulfillMetadataAction:itemProviders:linkMetadata:", v4, v10, v12);
LABEL_19:

    goto LABEL_20;
  }
  SLShareableContentLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "sceneIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v16;
    _os_log_impl(&dword_199EFF000, v15, OS_LOG_TYPE_DEFAULT, "Could not find an activity items configuration for the requested scene: %@", (uint8_t *)&v18, 0xCu);

  }
  +[SLShareableContentActionResponse response](SLFetchShareableContentMetadataActionResponse, "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLShareableContentActionHandler fulfillMetadataAction:response:](self, "fulfillMetadataAction:response:", v4, v10);
LABEL_20:

}

- (void)performFetchAsynchronousLPMetadataAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  SLShareableContentActionHandler *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SLShareableContentLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "sceneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_DEFAULT, "Fetching asynchronous metdata for on screen content for scene identifier: %@", buf, 0xCu);

  }
  objc_msgSend(v4, "sceneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLShareableContentActionHandler activityItemsConfigurationForSceneWithIdentifier:](self, "activityItemsConfigurationForSceneWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SLShareableContentActionHandler lpMetadataForActivityItemsConfiguration:](self, "lpMetadataForActivityItemsConfiguration:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SLShareableContentLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_DEFAULT, "Fetched synchronous previewMetadata %@", buf, 0xCu);
    }

    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v11 = v9;
    }
    else
    {
      v11 = objc_alloc_init(MEMORY[0x1E0CC11A8]);

      -[SLShareableContentActionHandler titleForActivityItemsConfiguration:](self, "titleForActivityItemsConfiguration:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitle:", v12);

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v8, "activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:", 0, *MEMORY[0x1E0DC4720], 64.0, 64.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setIconProvider:", v13);

        objc_msgSend(v8, "activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:", 0, *MEMORY[0x1E0DC4718], 512.0, 512.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setImageProvider:", v14);

      }
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __76__SLShareableContentActionHandler_performFetchAsynchronousLPMetadataAction___block_invoke;
    v18[3] = &unk_1E3795DC8;
    v19 = v11;
    v20 = self;
    v21 = v4;
    v15 = v11;
    objc_msgSend(v15, "_loadAsynchronousFieldsWithUpdateHandler:", v18);

  }
  else
  {
    SLShareableContentLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "sceneIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl(&dword_199EFF000, v16, OS_LOG_TYPE_DEFAULT, "Could not find an activity items configuration for the requested scene: %@", buf, 0xCu);

    }
    +[SLShareableContentActionResponse response](SLFetchAsynchronousLPMetadataActionResponse, "response");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[SLShareableContentActionHandler fulfillAsynchronousMetadataAction:response:](self, "fulfillAsynchronousMetadataAction:response:", v4, v15);
  }

}

uint64_t __76__SLShareableContentActionHandler_performFetchAsynchronousLPMetadataAction___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v2 = result;
    SLShareableContentLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(v2 + 32);
      objc_msgSend(v4, "image");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "Completed loading asynchronous fields for previewMetadata %@ %@", (uint8_t *)&v6, 0x16u);

    }
    return objc_msgSend(*(id *)(v2 + 40), "fulfillAsynchronousMetadataAction:linkMetadata:", *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 32));
  }
  return result;
}

- (void)fulfillContentAction:(id)a3 itemProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "requestedTypeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__SLShareableContentActionHandler_fulfillContentAction_itemProvider___block_invoke;
  v9[3] = &unk_1E3795F70;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "sl_loadRepresentationForTypeIdentifier:completionHandler:", v7, v9);

}

void __69__SLShareableContentActionHandler_fulfillContentAction_itemProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[SLFetchShareableContentActionResponse responseWithResult:](SLFetchShareableContentActionResponse, "responseWithResult:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fulfillWithResponse:", v3);

}

- (void)performFetchShareableContentAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SLShareableContentLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "sceneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestedTypeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_DEFAULT, "Fetching on screen content representation for scene identifier: %@ requested type identifier: %@", buf, 0x16u);

  }
  objc_msgSend(v4, "requestedTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "sceneIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLShareableContentActionHandler activityItemsConfigurationForSceneWithIdentifier:](self, "activityItemsConfigurationForSceneWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      SLShareableContentLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SLShareableContentActionHandler performFetchShareableContentAction:].cold.2(v4);

      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2FE0];
      v21 = *MEMORY[0x1E0CB2938];
      v22 = CFSTR("Could not find an activity items configuration for the requested scene.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 2, v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "failWithError:", v12);
      goto LABEL_21;
    }
    objc_msgSend(v10, "itemProvidersForActivityItemsConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && objc_msgSend(v11, "count"))
    {
      v13 = objc_msgSend(v4, "requestedItemProviderIndex");
      if (v13 < objc_msgSend(v12, "count"))
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLShareableContentActionHandler fulfillContentAction:itemProvider:](self, "fulfillContentAction:itemProvider:", v4, v14);
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      SLShareableContentLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SLShareableContentActionHandler performFetchShareableContentAction:].cold.4(v4, v13, v16);
    }
    else
    {
      SLShareableContentLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SLShareableContentActionHandler performFetchShareableContentAction:].cold.3(v4);
    }

    +[SLShareableContentActionResponse response](SLFetchShareableContentActionResponse, "response");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fulfillWithResponse:", v14);
    goto LABEL_20;
  }
  SLShareableContentLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[SLShareableContentActionHandler performFetchShareableContentAction:].cold.1(v4);

  +[SLShareableContentActionResponse response](SLFetchShareableContentActionResponse, "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fulfillWithResponse:", v10);
LABEL_22:

}

- (void)performSendShareableContentAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SLShareableContentLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "sceneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v6;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_DEFAULT, "Presenting message compose sheet to send on screen content for scene identifier: %@", (uint8_t *)&v24, 0xCu);

  }
  objc_msgSend(v4, "sceneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLShareableContentActionHandler sceneWithIdentifier:](self, "sceneWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "sceneIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLShareableContentActionHandler activityItemsConfigurationForSceneWithIdentifier:](self, "activityItemsConfigurationForSceneWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "itemProvidersForActivityItemsConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD7400]), "initWithCollaborationIdentifier:title:defaultShareOptions:", &stru_1E3797070, &stru_1E3797070, 0);
        v14 = +[SLSoftLinks newComposeViewControllerInstance](SLSoftLinks, "newComposeViewControllerInstance");
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "insertCollaborationItemProvider:collaborationOptions:collaborationMetadata:isCollaboration:", v12, v15, v13, 1);

        objc_msgSend(v14, "setSl_messageComposeResultHandler:", &__block_literal_global_18);
        objc_msgSend(v8, "keyWindow");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3F20], "_viewControllerForFullScreenPresentationFromView:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "presentViewController:animated:completion:", v14, 1, 0);
        }
        else
        {
          SLShareableContentLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v24 = 138412290;
            v25 = v8;
            _os_log_impl(&dword_199EFF000, v21, OS_LOG_TYPE_DEFAULT, "Could not find a suitable presenting view controller for scene: %@. Content will be presented from a fallback view controller", (uint8_t *)&v24, 0xCu);
          }

          v22 = objc_alloc_init(MEMORY[0x1E0DC4150]);
          objc_msgSend(v22, "_presentViewController:sendingView:animated:", v14, v16, 1);

        }
        +[SLShareableContentActionResponse response](SLShareableContentActionResponse, "response");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fulfillWithResponse:", v23);

      }
      else
      {
        SLShareableContentLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[SLShareableContentActionHandler performFetchShareableContentAction:].cold.3(v4);

        +[SLShareableContentActionResponse response](SLShareableContentActionResponse, "response");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fulfillWithResponse:", v13);
      }

    }
    else
    {
      SLShareableContentLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[SLShareableContentActionHandler performFetchShareableContentAction:].cold.2(v4);

      +[SLShareableContentActionResponse response](SLShareableContentActionResponse, "response");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fulfillWithResponse:", v12);
    }

  }
  else
  {
    +[SLShareableContentActionResponse response](SLShareableContentActionResponse, "response");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fulfillWithResponse:", v10);
  }

}

void __69__SLShareableContentActionHandler_performSendShareableContentAction___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)performAction:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SLShareableContentActionHandler performFetchShareableContentMetadataAction:](self, "performFetchShareableContentMetadataAction:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SLShareableContentActionHandler performFetchShareableContentAction:](self, "performFetchShareableContentAction:", v4);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SLShareableContentActionHandler performSendShareableContentAction:](self, "performSendShareableContentAction:", v4);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SLShareableContentActionHandler performFetchAsynchronousLPMetadataAction:](self, "performFetchAsynchronousLPMetadataAction:", v4);
      }
    }
  }

}

- (id)titleForActivityItemsConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "activityItemsConfigurationMetadataForKey:", *MEMORY[0x1E0DC4710]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v3, "itemProvidersForActivityItemsConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0 || !v6)
      goto LABEL_13;
    v8 = 0;
    v9 = *MEMORY[0x1E0DC4710];
    while (1)
    {
      objc_msgSend(v3, "activityItemsConfigurationMetadataForItemAtIndex:key:", v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
        break;
      if (v6 == ++v8)
      {
        v4 = 0;
        goto LABEL_13;
      }
    }
    v4 = (void *)v10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "string");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
LABEL_13:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v4;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)lpMetadataForActivityItemsConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "activityItemsConfigurationMetadataForKey:", *MEMORY[0x1E0DC4700]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v3, "itemProvidersForActivityItemsConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v4 && (objc_opt_respondsToSelector() & 1) != 0 && v6)
  {
    v10 = 0;
    v11 = *MEMORY[0x1E0DC4700];
    while (1)
    {
      objc_msgSend(v3, "activityItemsConfigurationMetadataForItemAtIndex:key:", v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
        break;
      if (v6 == ++v10)
      {
        v4 = 0;
        goto LABEL_5;
      }
    }
    v4 = (void *)v12;
  }
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v4;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)sceneWithIdentifier:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_15(&dword_199EFF000, v1, (uint64_t)v1, "Could not find the requested scene with identifier: %@ in connected scenes: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_199EFF000, a2, a3, "Unexpectedly failed to load CKPostSharingContext from item provider: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_11_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_199EFF000, a2, a3, "Unexpectedly failed to load CKContainerSetupInfo from item provider: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_14_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  v7 = 2112;
  v8 = v5;
  _os_log_fault_impl(&dword_199EFF000, a2, OS_LOG_TYPE_FAULT, "Unexpectedly failed to load a %@ from item provider: %@", v6, 0x16u);

  OUTLINED_FUNCTION_9();
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_18_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_4(&dword_199EFF000, v0, v1, "Unexpectedly failed to load item for type public.file-url of %@: %@");
  OUTLINED_FUNCTION_5();
}

void __84__SLShareableContentActionHandler_fulfillMetadataAction_itemProviders_linkMetadata___block_invoke_2_21_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_4(&dword_199EFF000, v0, v1, "Unexpectedly failed to load in-place file representation of %@: %@");
  OUTLINED_FUNCTION_5();
}

- (void)fulfillMetadataAction:(os_log_t)log itemProviders:linkMetadata:pendingCollaboration:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_199EFF000, log, OS_LOG_TYPE_ERROR, "Pending collaboration contains no metadata", v1, 2u);
}

- (void)performFetchShareableContentAction:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "sceneIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_199EFF000, v2, v3, "No requested type identifier to fetch content from scene: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)performFetchShareableContentAction:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "sceneIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_199EFF000, v2, v3, "Could not find an activity items configuration for the requested scene: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)performFetchShareableContentAction:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "sceneIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3_0(&dword_199EFF000, v2, v3, "Could not find content attached to the given scene with identifier: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)performFetchShareableContentAction:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = a2;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_15(&dword_199EFF000, a3, v6, "Could not find requested item provider for index:%ld to the given scene with identifier: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_9();
}

@end
