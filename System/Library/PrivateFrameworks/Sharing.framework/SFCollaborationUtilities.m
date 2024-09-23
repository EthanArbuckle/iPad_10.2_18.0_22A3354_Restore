@implementation SFCollaborationUtilities

+ (id)baseCollaborationDictionaryFromCollaborationItem:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("CollaborationMetadata"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("CollaborationType"));

  objc_msgSend(v4, "shareOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("CollaborationShareOptions"));

  objc_msgSend(v4, "shareOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "optionsGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("CollaborationOptions"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("CollaborationMode"));
  return v5;
}

+ (BOOL)isCKShareItemProvider:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  get_CKCloudKitPreShareType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasItemConformingToTypeIdentifier:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    get_CKCloudKitPostShareType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "hasItemConformingToTypeIdentifier:", v6);

  }
  return v5;
}

+ (BOOL)isPreCKShareItemProvider:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  get_CKCloudKitPreShareType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hasItemConformingToTypeIdentifier:", v4);

  return v5;
}

+ (BOOL)isPostCKShareItemProvider:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  get_CKCloudKitPostShareType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hasItemConformingToTypeIdentifier:", v4);

  return v5;
}

+ (void)getCKSharingOptionsFromOptions:(id)a3 accessType:(id *)a4 permissionType:(id *)a5 allowOthersToInvite:(id *)a6
{
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v9 = a3;
  if (objc_msgSend(v9, "count"))
  {
    v10 = soft_CKSharingAccessTypeFromOptionsGroups(v9);
    v11 = v9;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v12 = getCKSharingPermissionTypeFromOptionsGroupsSymbolLoc_ptr;
    v22 = getCKSharingPermissionTypeFromOptionsGroupsSymbolLoc_ptr;
    if (!getCKSharingPermissionTypeFromOptionsGroupsSymbolLoc_ptr)
    {
      v13 = (void *)CloudKitLibrary_0();
      v12 = dlsym(v13, "CKSharingPermissionTypeFromOptionsGroups");
      v20[3] = (uint64_t)v12;
      getCKSharingPermissionTypeFromOptionsGroupsSymbolLoc_ptr = v12;
    }
    _Block_object_dispose(&v19, 8);
    if (!v12)
      +[SFCollaborationUtilities getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:].cold.2();
    v14 = ((uint64_t (*)(id))v12)(v11);

    v15 = v11;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v16 = getCKSharingAllowOthersToInviteFromOptionsGroupsSymbolLoc_ptr;
    v22 = getCKSharingAllowOthersToInviteFromOptionsGroupsSymbolLoc_ptr;
    if (!getCKSharingAllowOthersToInviteFromOptionsGroupsSymbolLoc_ptr)
    {
      v17 = (void *)CloudKitLibrary_0();
      v16 = dlsym(v17, "CKSharingAllowOthersToInviteFromOptionsGroups");
      v20[3] = (uint64_t)v16;
      getCKSharingAllowOthersToInviteFromOptionsGroupsSymbolLoc_ptr = v16;
    }
    _Block_object_dispose(&v19, 8);
    if (!v16)
      +[SFCollaborationUtilities getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:].cold.3();
    v18 = ((uint64_t (*))v16)(v15);
  }
  else
  {
    share_sheet_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:].cold.1();
    v10 = 0;
    v14 = 0;
    v18 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
  *a6 = (id)objc_claimAutoreleasedReturnValue();

}

+ (id)ckShareDictionaryFromCKShare:(id)a3 setupInfo:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  gelato_sharing_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_INFO, "Creating dictionary from ckShare: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("share"));
  }
  else if (v10)
  {
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("shareError"));
  }
  v15 = v11;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;

  if (v12)
  {
    objc_msgSend(v8, "setValue:forKey:", v12, CFSTR("setupInfo"));
  }
  else if (v13)
  {
    objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("setupInfoError"));
  }

  return v8;
}

+ (NSString)defaultCKOptionsSummary
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(getCKAllowedSharingOptionsClass(), "standardOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (void)deleteSharingURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1A2830000, v10, OS_LOG_TYPE_DEFAULT, "remove sharingURL:%@ with containerSetupInfo:%@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(getCloudSharingClass(), "removeFromShareURL:containerSetupInfo:completionHandler:", v7, v8, v9);
}

+ (void)_loadShareOptionsForCKShareItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  id CKAllowedSharingOptionsClass;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  os_signpost_id_t v16;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "canLoadObjectOfClass:", getCKAllowedSharingOptionsClass()))
  {
    gelato_sharing_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, v5);

    gelato_sharing_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A2830000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CollaborationLoadShareOptionsForCKShareItemProvider", ", buf, 2u);
    }

    CKAllowedSharingOptionsClass = getCKAllowedSharingOptionsClass();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__SFCollaborationUtilities__loadShareOptionsForCKShareItemProvider_completionHandler___block_invoke;
    v14[3] = &unk_1E48314C8;
    v16 = v8;
    v15 = v6;
    v12 = (id)objc_msgSend(v5, "loadObjectOfClass:completionHandler:", CKAllowedSharingOptionsClass, v14);

  }
  else
  {
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities _loadShareOptionsForCKShareItemProvider:completionHandler:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

void __86__SFCollaborationUtilities__loadShareOptionsForCKShareItemProvider_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  void *v13;
  uint8_t v14[16];

  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (!v7)
  {
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __86__SFCollaborationUtilities__loadShareOptionsForCKShareItemProvider_completionHandler___block_invoke_cold_1();

  }
  gelato_sharing_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 40);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CollaborationLoadShareOptionsForCKShareItemProvider", ", v14, 2u);
  }

  v12 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "shareOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v7);

}

+ (void)loadCKShareItemProvider:(id)a3 completionHandler:(id)a4
{
  +[SFCollaborationUtilities loadCKShareItemProvider:onlyPostShare:completionHandler:](SFCollaborationUtilities, "loadCKShareItemProvider:onlyPostShare:completionHandler:", a3, 0, a4);
}

+ (void)loadCKShareItemProvider:(id)a3 onlyPostShare:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  id CKPostSharingContextClass;
  id *v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  id CKPreSharingContextClass;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  BOOL v31;
  _QWORD aBlock[4];
  id v33;
  os_signpost_id_t v34;
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  gelato_sharing_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, v7);

  gelato_sharing_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CollaborationLoadCKShareItemProvider", ", buf, 2u);
  }

  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke;
  aBlock[3] = &unk_1E48314F0;
  v34 = v10;
  v14 = v8;
  v33 = v14;
  v15 = _Block_copy(aBlock);
  get_CKCloudKitPostShareType();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v7, "hasItemConformingToTypeIdentifier:", v16);

  if (v17)
  {
    CKPostSharingContextClass = getCKPostSharingContextClass();
    v28[0] = v13;
    v28[1] = 3221225472;
    v28[2] = __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_151;
    v28[3] = &unk_1E4831540;
    v31 = a4;
    v19 = &v29;
    v20 = v7;
    v29 = v20;
    v30 = v15;
    v21 = (id)objc_msgSend(v20, "loadObjectOfClass:completionHandler:", CKPostSharingContextClass, v28);

LABEL_8:
    goto LABEL_9;
  }
  get_CKCloudKitPreShareType();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v7, "hasItemConformingToTypeIdentifier:", v22);

  if (v23)
  {
    CKPreSharingContextClass = getCKPreSharingContextClass();
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_153;
    v26[3] = &unk_1E4831518;
    v19 = &v27;
    v27 = v15;
    v25 = (id)objc_msgSend(v7, "loadObjectOfClass:completionHandler:", CKPreSharingContextClass, v26);
    goto LABEL_8;
  }
LABEL_9:

}

void __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v3 = a2;
  NSClassFromString(CFSTR("CKSharingContext"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "share");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerSetupInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  gelato_sharing_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CollaborationLoadCKShareItemProvider", ", v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_151(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id CKPreSharingContextClass;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  if (v5)
    goto LABEL_7;
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_151_cold_1();

  if (*(_BYTE *)(a1 + 48)
    || (v8 = *(void **)(a1 + 32),
        get_CKCloudKitPreShareType(),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v8) = objc_msgSend(v8, "hasItemConformingToTypeIdentifier:", v9),
        v9,
        !(_DWORD)v8))
  {
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    CKPreSharingContextClass = getCKPreSharingContextClass();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_152;
    v13[3] = &unk_1E4831518;
    v14 = *(id *)(a1 + 40);
    v12 = (id)objc_msgSend(v10, "loadObjectOfClass:completionHandler:", CKPreSharingContextClass, v13);

  }
}

void __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_152(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_152_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_153(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_152_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)_loadCKShareWithMetadataForItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id CKPostSharingContextClass;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  os_signpost_id_t v24;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  gelato_sharing_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, v5);

  gelato_sharing_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CollaborationLoadCKShareWithMetadataForItemProvider", ", buf, 2u);
  }

  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __86__SFCollaborationUtilities__loadCKShareWithMetadataForItemProvider_completionHandler___block_invoke;
  v22 = &unk_1E48314C8;
  v23 = v6;
  v24 = v8;
  v11 = v6;
  v12 = _Block_copy(&v19);
  get_CKCloudKitPostShareType();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "hasItemConformingToTypeIdentifier:", v13, v19, v20, v21, v22);

  if (v14)
  {
    CKPostSharingContextClass = getCKPostSharingContextClass();
LABEL_8:
    v18 = (id)objc_msgSend(v5, "loadObjectOfClass:completionHandler:", CKPostSharingContextClass, v12);
    goto LABEL_9;
  }
  get_CKCloudKitPreShareType();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v5, "hasItemConformingToTypeIdentifier:", v16);

  if (v17)
  {
    CKPostSharingContextClass = getCKPreSharingContextClass();
    goto LABEL_8;
  }
LABEL_9:

}

void __86__SFCollaborationUtilities__loadCKShareWithMetadataForItemProvider_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint8_t v16[16];

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_151_cold_1();

  }
  NSClassFromString(CFSTR("CKSharingContext"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v5;
    objc_msgSend(v8, "share");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerSetupInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allowedOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "shareOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
    v10 = 0;
    v12 = 0;
  }
  gelato_sharing_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = *(_QWORD *)(a1 + 40);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v14, OS_SIGNPOST_INTERVAL_END, v15, "CollaborationLoadCKShareWithMetadataForItemProvider", ", v16, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)loadCKContainerForItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  os_signpost_id_t v19;
  uint8_t buf[8];
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a3;
  v6 = a4;
  *(_QWORD *)buf = 0;
  v21 = (uint64_t)buf;
  v22 = 0x2020000000;
  v7 = (_QWORD *)get_CKCloudKitContainerSetupInfoTypeSymbolLoc_ptr;
  v23 = (void *)get_CKCloudKitContainerSetupInfoTypeSymbolLoc_ptr;
  if (!get_CKCloudKitContainerSetupInfoTypeSymbolLoc_ptr)
  {
    v8 = (void *)CloudKitLibrary_0();
    v7 = dlsym(v8, "_CKCloudKitContainerSetupInfoType");
    *(_QWORD *)(v21 + 24) = v7;
    get_CKCloudKitContainerSetupInfoTypeSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(buf, 8);
  if (!v7)
    +[SFCollaborationUtilities loadCKContainerForItemProvider:completionHandler:].cold.1();
  if (objc_msgSend(v5, "hasItemConformingToTypeIdentifier:", *v7))
  {
    gelato_sharing_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_make_with_pointer(v9, v5);

    gelato_sharing_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A2830000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CollaborationLoadCKContainerForItemProvider", ", buf, 2u);
    }

    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v13 = (void *)getCKContainerSetupInfoClass_softClass_0;
    v28 = getCKContainerSetupInfoClass_softClass_0;
    v14 = MEMORY[0x1E0C809B0];
    if (!getCKContainerSetupInfoClass_softClass_0)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = (uint64_t)__getCKContainerSetupInfoClass_block_invoke_0;
      v23 = &unk_1E482D680;
      v24 = &v25;
      __getCKContainerSetupInfoClass_block_invoke_0((uint64_t)buf);
      v13 = (void *)v26[3];
    }
    v15 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v25, 8);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __77__SFCollaborationUtilities_loadCKContainerForItemProvider_completionHandler___block_invoke;
    v17[3] = &unk_1E48314C8;
    v19 = v10;
    v18 = v6;
    v16 = (id)objc_msgSend(v5, "loadObjectOfClass:completionHandler:", v15, v17);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __77__SFCollaborationUtilities_loadCKContainerForItemProvider_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  gelato_sharing_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v5, OS_SIGNPOST_INTERVAL_END, v6, "CollaborationLoadCKContainerForItemProvider", ", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)isServiceManateeCKShareItemProvider:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  char v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__SFCollaborationUtilities_isServiceManateeCKShareItemProvider___block_invoke;
  v9[3] = &unk_1E4831568;
  v11 = &v12;
  v5 = v4;
  v10 = v5;
  +[SFCollaborationUtilities loadCKContainerForItemProvider:completionHandler:](SFCollaborationUtilities, "loadCKContainerForItemProvider:completionHandler:", v3, v9);
  v6 = dispatch_time(0, 200000000);
  dispatch_semaphore_wait(v5, v6);
  v7 = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

intptr_t __64__SFCollaborationUtilities_isServiceManateeCKShareItemProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "containerOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "isServiceManatee");

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)isCollaborationItemPrivateShare:(id)a3
{
  void *v3;
  BOOL v4;
  NSObject *v5;

  objc_msgSend(a3, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = soft_CKSharingAccessTypeFromOptionsGroups(v3) == 1;
  }
  else
  {
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities isCollaborationItemPrivateShare:].cold.1();

    v4 = 0;
  }

  return v4;
}

+ (id)createLinkMetadataWithCKShareItemProvider:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[8];
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  if (objc_msgSend(a1, "isPostCKShareItemProvider:", v4))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__7;
    v27 = __Block_byref_object_dispose__7;
    v28 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__7;
    v21 = __Block_byref_object_dispose__7;
    v22 = 0;
    v5 = dispatch_semaphore_create(0);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__SFCollaborationUtilities_createLinkMetadataWithCKShareItemProvider___block_invoke;
    v13[3] = &unk_1E4831590;
    v15 = &v23;
    v16 = &v17;
    v6 = v5;
    v14 = v6;
    objc_msgSend(a1, "loadCKShareItemProvider:onlyPostShare:completionHandler:", v4, 1, v13);
    v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v6, v7);
    v8 = v24[5];
    if (v8)
    {
      +[SFCollaborationUtilities createLinkMetadataWithCKShare:containerSetupInfo:](SFCollaborationUtilities, "createLinkMetadataWithCKShare:containerSetupInfo:", v8, v18[5]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      share_sheet_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1A2830000, v10, OS_LOG_TYPE_DEFAULT, "timed out to load post CKShare to provide metadata.", v12, 2u);
      }

      v9 = 0;
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __70__SFCollaborationUtilities_createLinkMetadataWithCKShareItemProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)createLinkMetadataWithCKShare:(id)a3 containerSetupInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  id v28;
  NSObject *v29;
  void *v30;
  objc_class *v31;
  id v32;
  void *v33;
  objc_class *v34;
  id v35;
  void *v36;
  NSObject *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE buf[24];
  void *v44;
  uint64_t *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2050000000;
  v7 = (void *)getLPiCloudSharingMetadataClass_softClass;
  v42 = getLPiCloudSharingMetadataClass_softClass;
  if (!getLPiCloudSharingMetadataClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getLPiCloudSharingMetadataClass_block_invoke;
    v44 = &unk_1E482D680;
    v45 = &v39;
    __getLPiCloudSharingMetadataClass_block_invoke((uint64_t)buf);
    v7 = (void *)v40[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v39, 8);
  v9 = objc_alloc_init(v8);
  getCKShareTitleKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v10, v39);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v11);

  objc_msgSend(v6, "containerOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applicationBundleIdentifierOverrideForContainerAccess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v13, 1, 0);
    -[NSObject URL](v14, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0CB34D0];
      -[NSObject URL](v14, "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bundleWithURL:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[NSObject infoDictionary](v18, "infoDictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CFBundleDisplayName"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setApplication:", v20);
        share_sheet_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v13;
          _os_log_impl(&dword_1A2830000, v21, OS_LOG_TYPE_DEFAULT, "Setting application to:%@ for bundleIdentifier: %@", buf, 0x16u);
        }

LABEL_16:
        goto LABEL_17;
      }
    }
    else
    {
      share_sheet_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        +[SFCollaborationUtilities createLinkMetadataWithCKShare:containerSetupInfo:].cold.5();

    }
    share_sheet_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities createLinkMetadataWithCKShare:containerSetupInfo:].cold.4(v14, v18);
    goto LABEL_16;
  }
  share_sheet_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    +[SFCollaborationUtilities createLinkMetadataWithCKShare:containerSetupInfo:].cold.3();
LABEL_17:

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v23 = (_QWORD *)getCKShareThumbnailImageDataKeySymbolLoc_ptr;
  v44 = (void *)getCKShareThumbnailImageDataKeySymbolLoc_ptr;
  if (!getCKShareThumbnailImageDataKeySymbolLoc_ptr)
  {
    v24 = (void *)CloudKitLibrary_0();
    v23 = dlsym(v24, "CKShareThumbnailImageDataKey");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v23;
    getCKShareThumbnailImageDataKeySymbolLoc_ptr = (uint64_t)v23;
  }
  _Block_object_dispose(buf, 8);
  if (!v23)
    +[SFCollaborationUtilities createLinkMetadataWithCKShare:containerSetupInfo:].cold.1();
  objc_msgSend(v5, "objectForKeyedSubscript:", *v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x2050000000;
    v26 = (void *)getLPImageClass_softClass;
    v42 = getLPImageClass_softClass;
    if (!getLPImageClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getLPImageClass_block_invoke;
      v44 = &unk_1E482D680;
      v45 = &v39;
      __getLPImageClass_block_invoke((uint64_t)buf);
      v26 = (void *)v40[3];
    }
    v27 = objc_retainAutorelease(v26);
    _Block_object_dispose(&v39, 8);
    v28 = [v27 alloc];
    v29 = objc_msgSend(v28, "initWithData:MIMEType:", v25, CFSTR("image/png"), v39);
    objc_msgSend(v9, "setIcon:", v29);
LABEL_24:

    goto LABEL_25;
  }
  share_sheet_log();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v13;
    _os_log_impl(&dword_1A2830000, v38, OS_LOG_TYPE_DEFAULT, "Falling back to using App Icon for bundleIdentifier:%@", buf, 0xCu);
  }

  if (!objc_msgSend(v13, "length"))
  {
    share_sheet_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities createLinkMetadataWithCKShare:containerSetupInfo:].cold.2();
    goto LABEL_24;
  }
  if (objc_msgSend(v13, "containsString:", CFSTR("com.apple.")))
  {
    share_sheet_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_1A2830000, v29, OS_LOG_TYPE_DEFAULT, "Not defaulting an icon for %@. Please file a radar!", buf, 0xCu);
    }
    goto LABEL_24;
  }
LABEL_25:
  v39 = 0;
  v40 = &v39;
  v41 = 0x2050000000;
  v30 = (void *)getLPSharedObjectMetadataClass_softClass;
  v42 = getLPSharedObjectMetadataClass_softClass;
  if (!getLPSharedObjectMetadataClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getLPSharedObjectMetadataClass_block_invoke;
    v44 = &unk_1E482D680;
    v45 = &v39;
    __getLPSharedObjectMetadataClass_block_invoke((uint64_t)buf);
    v30 = (void *)v40[3];
  }
  v31 = objc_retainAutorelease(v30);
  _Block_object_dispose(&v39, 8);
  v32 = objc_alloc_init(v31);
  objc_msgSend(v32, "setSpecialization:", v9, v39);
  v39 = 0;
  v40 = &v39;
  v41 = 0x2050000000;
  v33 = (void *)getLPLinkMetadataClass_softClass;
  v42 = getLPLinkMetadataClass_softClass;
  if (!getLPLinkMetadataClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getLPLinkMetadataClass_block_invoke;
    v44 = &unk_1E482D680;
    v45 = &v39;
    __getLPLinkMetadataClass_block_invoke((uint64_t)buf);
    v33 = (void *)v40[3];
  }
  v34 = objc_retainAutorelease(v33);
  _Block_object_dispose(&v39, 8);
  v35 = objc_alloc_init(v34);
  objc_msgSend(v5, "URL", v39);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setOriginalURL:", v36);

  objc_msgSend(v35, "setSpecialization:", v32);
  return v35;
}

+ (id)optionsFromCKShare:(id)a3 previousCKOptions:(id)a4 newCKOptions:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  objc_msgSend(getCKAllowedSharingOptionsClass(), "resolvedOptionsFromOptions:forExistingShare:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v9);
  objc_msgSend(v9, "shareOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)fileShareDictionaryFromFileURLItems:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  gelato_sharing_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl(&dword_1A2830000, v4, OS_LOG_TYPE_INFO, "Creating dictionary from fileURLs: %@", buf, 0xCu);
  }

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("fileURLs"));
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("files"));
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = v3;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            __64__SFCollaborationUtilities_fileShareDictionaryFromFileURLItems___block_invoke(v8, *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11++), v6);
          }
          while (v9 != v11);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          v9 = v8;
        }
        while (v8);
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __64__SFCollaborationUtilities_fileShareDictionaryFromFileURLItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v10 = 0;
  objc_msgSend(v4, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v6)
  {
    objc_msgSend(v5, "addObject:", v6);
  }
  else
  {
    gelato_sharing_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_INFO, "Failed to create bookmark data for URL: %@ %@", buf, 0x16u);

    }
  }

}

+ (BOOL)isThirdPartyFileProviderBackedURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  int v10;
  NSObject *v11;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v4 = (void *)getFPProviderDomainClass_softClass;
  v18 = getFPProviderDomainClass_softClass;
  if (!getFPProviderDomainClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getFPProviderDomainClass_block_invoke;
    v14[3] = &unk_1E482D680;
    v14[4] = &v15;
    __getFPProviderDomainClass_block_invoke((uint64_t)v14);
    v4 = (void *)v16[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v15, 8);
  v13 = 0;
  objc_msgSend(v5, "providerDomainForURL:error:", v3, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (!v6)
  {
    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities isThirdPartyFileProviderBackedURL:].cold.1((uint64_t)v3);

    goto LABEL_9;
  }
  objc_msgSend(v6, "providerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"));

  if ((v9 & 1) != 0)
  {
LABEL_9:
    LOBYTE(v10) = 0;
    goto LABEL_10;
  }
  v10 = objc_msgSend(v6, "isiCloudDriveProvider") ^ 1;
LABEL_10:

  return v10;
}

+ (BOOL)isSharedFileURL:(id)a3 isLocalStorageFileURL:(BOOL *)a4 isiCloudDriveFileURL:(BOOL *)a5 isInSharedFolder:(BOOL *)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  id v19;

  v9 = a3;
  objc_msgSend(getFPItemManagerClass(), "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v10, "itemForURL:error:", v9, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;

  if (!v11)
  {
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities isSharedFileURL:isLocalStorageFileURL:isiCloudDriveFileURL:isInSharedFolder:].cold.1((uint64_t)v9);

  }
  if (a4)
    *a4 = v11 != 0;
  v14 = objc_msgSend(v11, "isShared");
  if (a5)
  {
    objc_msgSend(v11, "itemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "providerID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = objc_msgSend(v16, "fp_isiCloudDriveOrCloudDocsIdentifier");

  }
  if (a6)
  {
    if (v14)
      v17 = objc_msgSend(v11, "isTopLevelSharedItem") ^ 1;
    else
      v17 = 0;
    *a6 = v17;
  }

  return v14;
}

+ (id)fileCollaborationItemFromActivityItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          if (!objc_msgSend(v9, "type", (_QWORD)v11))
            goto LABEL_12;

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  v9 = 0;
LABEL_12:

  return v9;
}

+ (id)urlFromActivityItem:(id)a3 allowsLoading:(BOOL)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "scheme");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
LABEL_18:

          goto LABEL_19;
        }
        objc_msgSend(v9, "host");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v7 = v9;
          goto LABEL_18;
        }
      }
      v7 = 0;
      goto LABEL_18;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || a4)
      {
        objc_msgSend(v5, "shareItemURL");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
      share_sheet_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v5;
        _os_log_impl(&dword_1A2830000, v11, OS_LOG_TYPE_DEFAULT, "Activity item %@ is an item provider, skipping load for URL since we only want placeholder values", (uint8_t *)&v13, 0xCu);
      }

    }
LABEL_16:
    v7 = 0;
    goto LABEL_19;
  }
  v6 = v5;
LABEL_4:
  v7 = v6;
LABEL_19:

  return v7;
}

+ (id)createItemProviderForFileURL:(id)a3
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  __CFString *v8;
  void *PreferredIdentifierForTag;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  os_signpost_id_t v15;
  uint8_t buf[16];

  v3 = a3;
  gelato_sharing_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, v3);

  gelato_sharing_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CollaborationCreateItemProviderForFileURL", ", buf, 2u);
  }

  objc_msgSend(v3, "pathExtension");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (PreferredIdentifierForTag = (void *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CEC400], v8, 0)) == 0)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
    PreferredIdentifierForTag = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__SFCollaborationUtilities_createItemProviderForFileURL___block_invoke;
  v13[3] = &unk_1E48315B8;
  v14 = v3;
  v15 = v5;
  v11 = v3;
  objc_msgSend(v10, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", PreferredIdentifierForTag, 1, 0, v13);

  return v10;
}

uint64_t __57__SFCollaborationUtilities_createItemProviderForFileURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v8[16];

  v3 = a2;
  gelato_sharing_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v5, OS_SIGNPOST_INTERVAL_END, v6, "CollaborationCreateItemProviderForFileURL", ", v8, 2u);
  }

  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 32), 0, 0);
  return 0;
}

+ (void)requestSharedURLForCollaborationItem:(id)a3 collaborationService:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD aBlock[4];
  id v36;
  os_signpost_id_t v37;
  uint8_t buf[8];
  uint64_t v39;
  Class (*v40)(uint64_t);
  void *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  gelato_sharing_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, v7);

  gelato_sharing_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CollaborationRequestSharedURLForCollaborationItem", ", buf, 2u);
  }

  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke;
  aBlock[3] = &unk_1E48315E0;
  v37 = v11;
  v15 = v9;
  v36 = v15;
  v16 = _Block_copy(aBlock);
  if (!objc_msgSend(v7, "type"))
  {
    v17 = v7;
    objc_msgSend(v17, "fileURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isiCloudDrive"))
    {
      if (v8)
      {
        v33[0] = v14;
        v33[1] = 3221225472;
        v33[2] = __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke_180;
        v33[3] = &unk_1E4831608;
        v34 = v16;
        objc_msgSend(v8, "requestSharedURLForFileOrFolderURL:completionHandler:", v18, v33);

      }
      else
      {
        share_sheet_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          +[SFCollaborationUtilities requestSharedURLForCollaborationItem:collaborationService:completionHandler:].cold.1();

        (*((void (**)(void *, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
      }
    }
    else
    {
      v43 = 0;
      v44 = &v43;
      v45 = 0x2050000000;
      v21 = (void *)get_SWStartCollaborationActionClass_softClass;
      v46 = get_SWStartCollaborationActionClass_softClass;
      if (!get_SWStartCollaborationActionClass_softClass)
      {
        *(_QWORD *)buf = v14;
        v39 = 3221225472;
        v40 = __get_SWStartCollaborationActionClass_block_invoke;
        v41 = &unk_1E482D680;
        v42 = &v43;
        __get_SWStartCollaborationActionClass_block_invoke((uint64_t)buf);
        v21 = (void *)v44[3];
      }
      v22 = objc_retainAutorelease(v21);
      _Block_object_dispose(&v43, 8);
      objc_msgSend(v17, "metadata");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "actionWithMetadata:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (SharedWithYouCoreLibrary())
      {
        v25 = (void *)SharedWithYouCoreLibrary();
        if (dlsym(v25, "SWPerformActionForDocumentURL"))
        {
          v31[0] = v14;
          v31[1] = 3221225472;
          v31[2] = __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke_182;
          v31[3] = &unk_1E4831630;
          v32 = v16;
          ((void (*)(void *, void *, void *))softLinkSWPerformActionForDocumentURL[0])(v18, v24, v31);

        }
      }

    }
    goto LABEL_29;
  }
  if (objc_msgSend(v7, "type") == 1)
  {
    objc_msgSend(v7, "itemProvider");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (+[SFCollaborationUtilities isPostCKShareItemProvider:](SFCollaborationUtilities, "isPostCKShareItemProvider:", v17))
    {
      v29[0] = v14;
      v29[1] = 3221225472;
      v29[2] = __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke_2;
      v29[3] = &unk_1E4831658;
      v30 = v16;
      +[SFCollaborationUtilities loadCKShareItemProvider:onlyPostShare:completionHandler:](SFCollaborationUtilities, "loadCKShareItemProvider:onlyPostShare:completionHandler:", v17, 1, v29);

    }
    else
    {
      share_sheet_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        +[SFCollaborationUtilities requestSharedURLForCollaborationItem:collaborationService:completionHandler:].cold.2();

      (*((void (**)(void *, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
    }
LABEL_29:

    goto LABEL_30;
  }
  if (objc_msgSend(v7, "type") == 2)
  {
    objc_msgSend(v7, "cloudSharingResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sharingURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void *, void *, _QWORD))v16 + 2))(v16, v20, 0);
  }
  else
  {
    share_sheet_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities requestSharedURLForCollaborationItem:collaborationService:completionHandler:].cold.3(v7, v27);

    (*((void (**)(void *, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
  }
LABEL_30:

}

void __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = a2;
  gelato_sharing_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CollaborationRequestSharedURLForCollaborationItem", ", v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke_180(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke_182(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v8, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v7, v6);

}

void __104__SFCollaborationUtilities_requestSharedURLForCollaborationItem_collaborationService_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "URL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

}

+ (void)requestSharedURLForURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id CloudSharingClass;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[4];
  id v19;
  os_signpost_id_t v20;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  gelato_sharing_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, v5);

  gelato_sharing_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CollaborationRequestSharedURLForURL", ", buf, 2u);
  }

  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__SFCollaborationUtilities_requestSharedURLForURL_completionHandler___block_invoke;
  aBlock[3] = &unk_1E48315E0;
  v19 = v6;
  v20 = v8;
  v12 = v6;
  v13 = _Block_copy(aBlock);
  CloudSharingClass = getCloudSharingClass();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __69__SFCollaborationUtilities_requestSharedURLForURL_completionHandler___block_invoke_184;
  v16[3] = &unk_1E4831680;
  v17 = v13;
  v15 = v13;
  objc_msgSend(CloudSharingClass, "existingShareForFileOrFolderURL:completionHandler:", v5, v16);

}

void __69__SFCollaborationUtilities_requestSharedURLForURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = a2;
  gelato_sharing_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CollaborationRequestSharedURLForURL", ", v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__SFCollaborationUtilities_requestSharedURLForURL_completionHandler___block_invoke_184(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)findOriginatingSharedItemForSubitemURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(getFPItemManagerClass(), "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v8, "itemForURL:error:", v6, &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;

  if (v9)
  {
    location = 0;
    objc_initWeak(&location, a1);
    objc_msgSend(getFPItemManagerClass(), "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__SFCollaborationUtilities_findOriginatingSharedItemForSubitemURL_completionHandler___block_invoke;
    v14[3] = &unk_1E48316A8;
    v15 = v6;
    v17 = v7;
    objc_copyWeak(&v18, &location);
    v16 = v9;
    objc_msgSend(v11, "fetchParentsForItemID:recursively:completionHandler:", v12, 1, v14);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities isSharedFileURL:isLocalStorageFileURL:isiCloudDriveFileURL:isInSharedFolder:].cold.1((uint64_t)v6);

    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v10);
  }

}

void __85__SFCollaborationUtilities_findOriginatingSharedItemForSubitemURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_findOriginatingSharedItemInParentItems:forSubitem:completionHandler:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __85__SFCollaborationUtilities_findOriginatingSharedItemForSubitemURL_completionHandler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

+ (void)_findOriginatingSharedItemInParentItems:(id)a3 forSubitem:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v10 = v8;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v22;
    v15 = v10;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v7);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v17, "isShared") & 1) != 0)
        {
          v18 = v17;
          v19 = v15;
          v15 = v18;
        }
        else
        {
          objc_msgSend(v15, "fileURL");
          v20 = objc_claimAutoreleasedReturnValue();
          v19 = v13;
          v13 = (void *)v20;
        }

      }
      v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
    v15 = v10;
  }
  v9[2](v9, v13, 0);

}

+ (BOOL)hasiWorkSendCopyRepresentationForItemProvider:(id)a3
{
  id v3;
  NSString *v4;
  char v5;

  v3 = a3;
  v4 = +[SFCollaborationUtilities _copyRepresentationTypeIdentifier](SFCollaborationUtilities, "_copyRepresentationTypeIdentifier");
  if (v4)
    v5 = objc_msgSend(v3, "hasItemConformingToTypeIdentifier:", v4);
  else
    v5 = 0;

  return v5;
}

+ (void)loadiWorkCopyRepresentationURLForItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSString *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  os_signpost_id_t v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (+[SFCollaborationUtilities hasiWorkSendCopyRepresentationForItemProvider:](SFCollaborationUtilities, "hasiWorkSendCopyRepresentationForItemProvider:", v5))
  {
    gelato_sharing_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, v5);

    gelato_sharing_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A2830000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SendCopyRepresentationLoadForItemProvider", ", buf, 2u);
    }

    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_1A2830000, v11, OS_LOG_TYPE_DEFAULT, "Loading send copy representation for item provider %@", buf, 0xCu);
    }

    v12 = +[SFCollaborationUtilities _copyRepresentationTypeIdentifier](SFCollaborationUtilities, "_copyRepresentationTypeIdentifier");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke;
    v14[3] = &unk_1E48316F8;
    v16 = v8;
    v15 = v6;
    v13 = (id)objc_msgSend(v5, "loadInPlaceFileRepresentationForTypeIdentifier:completionHandler:", v12, v14);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

void __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (v7)
  {
    if ((a3 & 1) == 0)
    {
      share_sheet_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v7;
        _os_log_impl(&dword_1A2830000, v9, OS_LOG_TYPE_DEFAULT, "Send copy representation was not loaded in place. Current URL: %@", buf, 0xCu);
      }

    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke_187;
    v17[3] = &unk_1E48316D0;
    v10 = v7;
    v12 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v18 = v10;
    v20 = v11;
    v19 = v12;
    objc_msgSend(v10, "coordinateReadingWithSaveToTempDir:options:completionHandler:", 1, 8, v17);

  }
  else
  {
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke_cold_1();

    gelato_sharing_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 40);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A2830000, v15, OS_SIGNPOST_INTERVAL_END, v16, "SendCopyRepresentationLoadForItemProvider", ", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke_187(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (!v5)
  {
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke_187_cold_1();

    v7 = (void *)a1[4];
  }
  v9 = v7;
  share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v9;
    _os_log_impl(&dword_1A2830000, v10, OS_LOG_TYPE_DEFAULT, "Loaded send copy representation at URL %@", (uint8_t *)&v14, 0xCu);
  }

  gelato_sharing_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = a1[6];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v12, OS_SIGNPOST_INTERVAL_END, v13, "SendCopyRepresentationLoadForItemProvider", ", (uint8_t *)&v14, 2u);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

+ (NSString)_copyRepresentationTypeIdentifier
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v2 = (void *)_copyRepresentationTypeIdentifier_copyRepresentationTypeIdentifier;
  if (_copyRepresentationTypeIdentifier_copyRepresentationTypeIdentifier)
    return (NSString *)objc_msgSend(v2, "copy", v10);
  if (SharedWithYouCoreLibrary())
  {
    v3 = (void *)SharedWithYouCoreLibrary();
    if (dlsym(v3, "SWCopyRepresentationTypeIdentifier"))
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v4 = (id *)getSWCopyRepresentationTypeIdentifierSymbolLoc_ptr;
      v13 = getSWCopyRepresentationTypeIdentifierSymbolLoc_ptr;
      if (!getSWCopyRepresentationTypeIdentifierSymbolLoc_ptr)
      {
        v5 = (void *)SharedWithYouCoreLibrary();
        v4 = (id *)dlsym(v5, "SWCopyRepresentationTypeIdentifier");
        v11[3] = (uint64_t)v4;
        getSWCopyRepresentationTypeIdentifierSymbolLoc_ptr = (uint64_t)v4;
      }
      _Block_object_dispose(&v10, 8);
      if (!v4)
        +[SFCollaborationUtilities _copyRepresentationTypeIdentifier].cold.3();
LABEL_13:
      objc_storeStrong((id *)&_copyRepresentationTypeIdentifier_copyRepresentationTypeIdentifier, *v4);
      goto LABEL_14;
    }
  }
  if (SharedWithYouCoreLibrary())
  {
    v6 = (void *)SharedWithYouCoreLibrary();
    if (dlsym(v6, "UTCopyRepresentationTypeIdentifier"))
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v4 = (id *)getUTCopyRepresentationTypeIdentifierSymbolLoc_ptr;
      v13 = getUTCopyRepresentationTypeIdentifierSymbolLoc_ptr;
      if (!getUTCopyRepresentationTypeIdentifierSymbolLoc_ptr)
      {
        v7 = (void *)SharedWithYouCoreLibrary();
        v4 = (id *)dlsym(v7, "UTCopyRepresentationTypeIdentifier");
        v11[3] = (uint64_t)v4;
        getUTCopyRepresentationTypeIdentifierSymbolLoc_ptr = (uint64_t)v4;
      }
      _Block_object_dispose(&v10, 8);
      if (!v4)
        +[SFCollaborationUtilities _copyRepresentationTypeIdentifier].cold.2();
      goto LABEL_13;
    }
  }
LABEL_14:
  v2 = (void *)_copyRepresentationTypeIdentifier_copyRepresentationTypeIdentifier;
  if (!_copyRepresentationTypeIdentifier_copyRepresentationTypeIdentifier)
  {
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities _copyRepresentationTypeIdentifier].cold.1();

    v2 = (void *)_copyRepresentationTypeIdentifier_copyRepresentationTypeIdentifier;
  }
  return (NSString *)objc_msgSend(v2, "copy", v10);
}

+ (BOOL)isSWYActivityItemProvider:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  get_SWPendingCollaborationTypeIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hasItemConformingToTypeIdentifier:", v4);

  return v5;
}

+ (void)_loadShareOptionsForSWYItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  os_signpost_id_t v24;
  _QWORD v25[4];
  id v26;
  os_signpost_id_t v27;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  getUTCollaborationOptionsTypeIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "hasItemConformingToTypeIdentifier:", v7);

  if (v8)
  {
    gelato_sharing_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_make_with_pointer(v9, v5);

    gelato_sharing_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A2830000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CollaborationLoadShareOptionsForSWYItemProvider", ", buf, 2u);
    }

    getUTCollaborationOptionsTypeIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke;
    v25[3] = &unk_1E4831720;
    v27 = v10;
    v26 = v6;
    objc_msgSend(v5, "loadItemForTypeIdentifier:options:completionHandler:", v13, 0, v25);

    v14 = v26;
LABEL_11:

    goto LABEL_15;
  }
  get_SWPendingCollaborationTypeIdentifier();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v5, "hasItemConformingToTypeIdentifier:", v15);

  if (v16)
  {
    gelato_sharing_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_id_make_with_pointer(v17, v5);

    gelato_sharing_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A2830000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "CollaborationLoadShareOptionsForSWYItemProvider", ", buf, 2u);
    }

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke_192;
    v22[3] = &unk_1E4831748;
    v24 = v18;
    v23 = v6;
    +[SFCollaborationUtilities loadPendingCollaborationForItemProvider:completionHandler:](SFCollaborationUtilities, "loadPendingCollaborationForItemProvider:completionHandler:", v5, v22);
    v14 = v23;
    goto LABEL_11;
  }
  share_sheet_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    +[SFCollaborationUtilities _loadShareOptionsForSWYItemProvider:completionHandler:].cold.1();

  (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
LABEL_15:

}

void __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (!v7)
  {
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke_cold_1();

  }
  gelato_sharing_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 40);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v10, OS_SIGNPOST_INTERVAL_END, v11, "CollaborationLoadShareOptionsForSWYItemProvider", ", v12, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke_192(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v3 = a2;
  objc_msgSend(v3, "collaborationMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultShareOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke_192_cold_1(v3, v6);

  }
  gelato_sharing_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CollaborationLoadShareOptionsForSWYItemProvider", ", v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)loadSendCopyRepresentationIfNeededForItemProvider:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id *v19;
  _QWORD *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD aBlock[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!+[SFCollaborationUtilities hasiWorkSendCopyRepresentationForItemProvider:](SFCollaborationUtilities, "hasiWorkSendCopyRepresentationForItemProvider:", v5))
  {
    if (+[SFCollaborationUtilities isCKShareItemProvider:](SFCollaborationUtilities, "isCKShareItemProvider:", v5)|| +[SFCollaborationUtilities isSWYActivityItemProvider:](SFCollaborationUtilities, "isSWYActivityItemProvider:", v5))
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v5, "registeredTypeIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v38;
        v11 = *MEMORY[0x1E0CEC590];
        v12 = *MEMORY[0x1E0CEC528];
LABEL_7:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "conformsToType:", v11) & 1) != 0
            || (objc_msgSend(v14, "conformsToType:", v12) & 1) != 0)
          {
            break;
          }

          if (v9 == ++v13)
          {
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            if (v9)
              goto LABEL_7;
            goto LABEL_14;
          }
        }

        if (!v14)
          goto LABEL_19;
        v15 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_195;
        aBlock[3] = &unk_1E4831770;
        v16 = v6;
        v36 = v16;
        v17 = _Block_copy(aBlock);
        if (objc_msgSend(v14, "conformsToType:", v11))
        {
          if (objc_msgSend(v5, "canLoadObjectOfClass:", objc_opt_class()))
          {
            v18 = objc_opt_class();
            v33[0] = v15;
            v33[1] = 3221225472;
            v33[2] = __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_198;
            v33[3] = &unk_1E4831798;
            v19 = &v34;
            v34 = v17;
            v20 = v33;
          }
          else
          {
            if (!objc_msgSend(v5, "canLoadObjectOfClass:", objc_opt_class()))
            {
              objc_msgSend(v14, "identifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v29[0] = v15;
              v29[1] = 3221225472;
              v29[2] = __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_3;
              v29[3] = &unk_1E48317E8;
              v19 = &v30;
              v30 = v17;
              objc_msgSend(v5, "loadItemForTypeIdentifier:options:completionHandler:", v25, 0, v29);

              goto LABEL_28;
            }
            v18 = objc_opt_class();
            v31[0] = v15;
            v31[1] = 3221225472;
            v31[2] = __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_2;
            v31[3] = &unk_1E48317C0;
            v19 = &v32;
            v32 = v17;
            v20 = v31;
          }
          v24 = (id)objc_msgSend(v5, "loadObjectOfClass:completionHandler:", v18, v20);
        }
        else
        {
          v26[0] = v15;
          v26[1] = 3221225472;
          v26[2] = __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_4;
          v26[3] = &unk_1E4831838;
          v19 = &v27;
          v27 = v17;
          v28 = v16;
          v23 = (id)objc_msgSend(v5, "loadFileRepresentationForContentType:openInPlace:completionHandler:", v14, 0, v26);

        }
LABEL_28:

        goto LABEL_29;
      }
LABEL_14:

LABEL_19:
      share_sheet_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "registeredTypeIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v44 = v22;
        _os_log_impl(&dword_1A2830000, v21, OS_LOG_TYPE_DEFAULT, "Could not find send copy type in item provider with type identifiers: %@", buf, 0xCu);

      }
    }
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    goto LABEL_29;
  }
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke;
  v41[3] = &unk_1E4831608;
  v42 = v6;
  +[SFCollaborationUtilities loadiWorkCopyRepresentationURLForItemProvider:completionHandler:](SFCollaborationUtilities, "loadiWorkCopyRepresentationURLForItemProvider:completionHandler:", v5, v41);

LABEL_29:
}

uint64_t __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_195(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_195_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_198(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_4(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_5;
    v7[3] = &unk_1E4831810;
    v8 = v5;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v8, "coordinateReadingWithSaveToTempDir:completionHandler:", a3 ^ 1u, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke_187_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)loadSendCopyRepresentationIfNeededForActivityItems:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  dispatch_queue_t v20;
  id v21;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = objc_msgSend(v6, "count");

  objc_msgSend(v8, "arrayWithCapacity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("com.apple.sharing.collaborationUtilities.loadItems", v11);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForActivityItems_completion___block_invoke;
  v17[3] = &unk_1E482E508;
  v18 = v7;
  v19 = v10;
  v20 = v12;
  v21 = v5;
  v13 = v5;
  v14 = v12;
  v15 = v10;
  v16 = v7;
  dispatch_async(v14, v17);

}

uint64_t __90__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForActivityItems_completion___block_invoke(_QWORD *a1)
{
  return +[SFCollaborationUtilities _processRemainingActivityItems:toFinalActivityItems:onQueue:completion:](SFCollaborationUtilities, "_processRemainingActivityItems:toFinalActivityItems:onQueue:completion:", a1[4], a1[5], a1[6], a1[7]);
}

+ (void)_processRemainingActivityItems:(id)a3 toFinalActivityItems:(id)a4 onQueue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "firstObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    while (1)
    {
      objc_msgSend(v9, "removeObjectAtIndex:", 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v10, "addObject:", v14);
      objc_msgSend(v9, "firstObject");
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
      if (!v15)
        goto LABEL_5;
    }
    v17 = v14;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke;
    v22[3] = &unk_1E4831888;
    v23 = v11;
    v24 = v10;
    v25 = v17;
    v26 = v9;
    v27 = v12;
    v18 = v12;
    v16 = v10;
    +[SFCollaborationUtilities loadSendCopyRepresentationIfNeededForItemProvider:completion:](SFCollaborationUtilities, "loadSendCopyRepresentationIfNeededForItemProvider:completion:", v17, v22);

  }
  else
  {
LABEL_5:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke_204;
    block[3] = &unk_1E482E0F0;
    v20 = v10;
    v21 = v12;
    v16 = v12;
    v17 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v18 = v21;
  }

}

void __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke_2;
  v6[3] = &unk_1E4831860;
  v7 = v3;
  v4 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v11 = a1[4];
  v12 = a1[8];
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
  {
    objc_msgSend(v2, "addObject:");
  }
  else
  {
    objc_msgSend(v2, "addObject:", a1[6]);
    share_sheet_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke_2_cold_1(a1 + 6, v4, v5);

  }
  return +[SFCollaborationUtilities _processRemainingActivityItems:toFinalActivityItems:onQueue:completion:](SFCollaborationUtilities, "_processRemainingActivityItems:toFinalActivityItems:onQueue:completion:", a1[7], a1[5], a1[8], a1[9]);
}

uint64_t __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke_204(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)loadShareOptionsForItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a4;
  if (+[SFCollaborationUtilities isSWYActivityItemProvider:](SFCollaborationUtilities, "isSWYActivityItemProvider:", v5))
  {
    +[SFCollaborationUtilities _loadShareOptionsForSWYItemProvider:completionHandler:](SFCollaborationUtilities, "_loadShareOptionsForSWYItemProvider:completionHandler:", v5, v6);
  }
  else if (+[SFCollaborationUtilities isCKShareItemProvider:](SFCollaborationUtilities, "isCKShareItemProvider:", v5))
  {
    +[SFCollaborationUtilities _loadShareOptionsForCKShareItemProvider:completionHandler:](SFCollaborationUtilities, "_loadShareOptionsForCKShareItemProvider:completionHandler:", v5, v6);
  }
  else
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities loadShareOptionsForItemProvider:completionHandler:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

+ (BOOL)isHeroCollaborationActivityType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Message")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.InCallService.ShareExtension"));

  return v4;
}

+ (void)loadMetadataForItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  os_signpost_id_t v15;
  uint8_t buf[16];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  v22 = 0;
  if (+[SFCollaborationUtilities isCKShareItemProvider:](SFCollaborationUtilities, "isCKShareItemProvider:", v5))
  {
    gelato_sharing_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, v5);

    gelato_sharing_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A2830000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CollaborationLoadMetadataForItemProvider", ", buf, 2u);
    }

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke;
    v12[3] = &unk_1E48318B0;
    v14 = &v17;
    v15 = v8;
    v13 = v6;
    +[SFCollaborationUtilities _loadCKShareWithMetadataForItemProvider:completionHandler:](SFCollaborationUtilities, "_loadCKShareWithMetadataForItemProvider:completionHandler:", v5, v12);

  }
  else
  {
    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities loadMetadataForItemProvider:completionHandler:].cold.1();

    (*((void (**)(id, uint64_t))v6 + 2))(v6, v18[5]);
  }
  _Block_object_dispose(&v17, 8);

}

void __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  id v35;
  void *v36;
  uint8_t buf[8];
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fragment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13
    && (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%@"), v13),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", v14, &stru_1E483B8E8),
        v15 = objc_claimAutoreleasedReturnValue(),
        v14,
        v15))
  {
    getCKShareTitleKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    v38 = (uint64_t)buf;
    v39 = 0x2020000000;
    v18 = (_QWORD *)getCKShareTypeKeySymbolLoc_ptr;
    v40 = (void *)getCKShareTypeKeySymbolLoc_ptr;
    if (!getCKShareTypeKeySymbolLoc_ptr)
    {
      v19 = (void *)CloudKitLibrary_0();
      v18 = dlsym(v19, "CKShareTypeKey");
      *(_QWORD *)(v38 + 24) = v18;
      getCKShareTypeKeySymbolLoc_ptr = (uint64_t)v18;
    }
    _Block_object_dispose(buf, 8);
    if (!v18)
      __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke_cold_2();
    v35 = v8;
    v36 = v11;
    objc_msgSend(v7, "objectForKeyedSubscript:", *v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)v17;
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v9, "optionsGroups");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (!v24)
    {
      share_sheet_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke_cold_3();

    }
    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v26 = (void *)get_SWCollaborationMetadataClass_softClass;
    v45 = get_SWCollaborationMetadataClass_softClass;
    v27 = v21;
    v11 = v36;
    if (!get_SWCollaborationMetadataClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v38 = 3221225472;
      v39 = (uint64_t)__get_SWCollaborationMetadataClass_block_invoke;
      v40 = &unk_1E482D680;
      v41 = &v42;
      __get_SWCollaborationMetadataClass_block_invoke((uint64_t)buf);
      v26 = (void *)v43[3];
    }
    v28 = objc_retainAutorelease(v26);
    _Block_object_dispose(&v42, 8);
    v29 = objc_msgSend([v28 alloc], "initWithCollaborationIdentifier:title:defaultShareOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:", v15, v27, v9, 0, v22, 0, 0);
    v30 = *(_QWORD *)(a1[5] + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

    v8 = v35;
  }
  else
  {
    share_sheet_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke_cold_1(v7, v15);
  }

  gelato_sharing_log();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32;
  v34 = a1[6];
  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v33, OS_SIGNPOST_INTERVAL_END, v34, "CollaborationLoadMetadataForItemProvider", ", buf, 2u);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

+ (void)loadPendingCollaborationForItemProvider:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_signpost_id_t v14;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (+[SFCollaborationUtilities isSWYActivityItemProvider:](SFCollaborationUtilities, "isSWYActivityItemProvider:", v5))
  {
    gelato_sharing_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, v5);

    gelato_sharing_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A2830000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CollaborationLoadPendingForItemProvider", ", buf, 2u);
    }

    get_SWPendingCollaborationTypeIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __86__SFCollaborationUtilities_loadPendingCollaborationForItemProvider_completionHandler___block_invoke;
    v12[3] = &unk_1E48318D8;
    v14 = v8;
    v13 = v6;
    objc_msgSend(v5, "loadItemForTypeIdentifier:options:completionHandler:", v11, 0, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __86__SFCollaborationUtilities_loadPendingCollaborationForItemProvider_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  gelato_sharing_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CollaborationLoadPendingForItemProvider", ", (uint8_t *)&v12, 2u);
  }

  share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1A2830000, v11, OS_LOG_TYPE_DEFAULT, "Loaded pending collaboration: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __86__SFCollaborationUtilities_loadPendingCollaborationForItemProvider_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)loadMetadataForFileURL:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  SFCollaborationFileMetadataLoader *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  SFCollaborationFileMetadataLoader *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[4];
  SFCollaborationFileMetadataLoader *v19;
  id v20;
  os_signpost_id_t v21;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SFCollaborationUtilities.m"), 1255, CFSTR("fileURL is nil."));

  }
  v9 = -[SFCollaborationFileMetadataLoader initWithFileURL:]([SFCollaborationFileMetadataLoader alloc], "initWithFileURL:", v7);
  gelato_sharing_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, v7);

  gelato_sharing_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CollaborationLoadMetadataForFileURL", ", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__SFCollaborationUtilities_loadMetadataForFileURL_completionHandler___block_invoke;
  aBlock[3] = &unk_1E4831900;
  v20 = v8;
  v21 = v11;
  v19 = v9;
  v14 = v8;
  v15 = v9;
  v16 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", v15);
  -[SFCollaborationFileMetadataLoader loadMetadataWithCompletionHandler:](v15, "loadMetadataWithCompletionHandler:", v16);

}

void __69__SFCollaborationUtilities_loadMetadataForFileURL_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = a2;
  gelato_sharing_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v8, OS_SIGNPOST_INTERVAL_END, v9, "CollaborationLoadMetadataForFileURL", ", v10, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", a1[4]);
  (*(void (**)(void))(a1[5] + 16))();

}

+ (void)addParticipantsAllowedForCollaborationItem:(id)a3 collaborationService:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, uint64_t, _QWORD);
  id v19;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (objc_msgSend(v8, "type") != 1)
  {
    if (!objc_msgSend(v8, "type"))
    {
      objc_msgSend(v8, "fileURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_addParticipantsAllowedForURL:share:collaborationService:completionHandler:", v15, 0, v9, v10);

      goto LABEL_10;
    }
    share_sheet_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A2830000, v14, OS_LOG_TYPE_DEFAULT, "SWY add participants allowed check is not supported", (uint8_t *)location, 2u);
    }

    goto LABEL_8;
  }
  objc_msgSend(v8, "itemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[SFCollaborationUtilities isPostCKShareItemProvider:](SFCollaborationUtilities, "isPostCKShareItemProvider:", v11);

  if (!v12)
  {
LABEL_8:
    v10[2](v10, 1, 0);
    goto LABEL_10;
  }
  location[0] = 0;
  objc_initWeak(location, a1);
  objc_msgSend(v8, "itemProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __110__SFCollaborationUtilities_addParticipantsAllowedForCollaborationItem_collaborationService_completionHandler___block_invoke;
  v16[3] = &unk_1E4831928;
  v18 = v10;
  objc_copyWeak(&v19, location);
  v17 = v9;
  +[SFCollaborationUtilities loadCKShareItemProvider:onlyPostShare:completionHandler:](SFCollaborationUtilities, "loadCKShareItemProvider:onlyPostShare:completionHandler:", v13, 1, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(location);
LABEL_10:

}

void __110__SFCollaborationUtilities_addParticipantsAllowedForCollaborationItem_collaborationService_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_addParticipantsAllowedForURL:share:collaborationService:completionHandler:", 0, v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

+ (void)addParticipantsAllowedForURL:(id)a3 share:(id)a4 completionHandler:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  id v10;
  id CloudSharingClass;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  if (v8 | v9)
  {
    if (v8)
    {
      location = 0;
      objc_initWeak(&location, a1);
      CloudSharingClass = getCloudSharingClass();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __81__SFCollaborationUtilities_addParticipantsAllowedForURL_share_completionHandler___block_invoke;
      v16[3] = &unk_1E4831950;
      v17 = v10;
      objc_copyWeak(&v18, &location);
      objc_msgSend(CloudSharingClass, "existingShareForFileOrFolderURL:completionHandler:", v8, v16);
      objc_destroyWeak(&v18);

      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(a1, "_addParticipantsAllowedForShare:completionHandler:", v9, v10);
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("Called _addParticipantsAllowedForURL:share:completionHandler: with nil URL and nil CKShare");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sharesheet.addParticipantsAllowed"), 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    share_sheet_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities addParticipantsAllowedForURL:share:completionHandler:].cold.1(v14, v15);

    (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 1, v14);
  }

}

void __81__SFCollaborationUtilities_addParticipantsAllowedForURL_share_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  void (*v14)(void);
  id v15;

  v15 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    if (v8)
    {
      objc_msgSend(v8, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      getCKErrorDomain();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
      {
        v13 = objc_msgSend(v9, "code");

        if (v13 == 12)
          goto LABEL_6;
      }
      else
      {

      }
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_9;
    }
LABEL_6:
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_9:
    v14();
    goto LABEL_10;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_addParticipantsAllowedForShare:completionHandler:", v7, *(_QWORD *)(a1 + 32));

LABEL_10:
}

+ (void)_addParticipantsAllowedForURL:(id)a3 share:(id)a4 collaborationService:(id)a5 completionHandler:(id)a6
{
  unint64_t v9;
  unint64_t v10;
  id v11;
  void (**v12)(id, uint64_t, void *);
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = (unint64_t)a3;
  v10 = (unint64_t)a4;
  v11 = a5;
  v12 = (void (**)(id, uint64_t, void *))a6;
  if (!(v9 | v10))
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = CFSTR("Called _addParticipantsAllowedForURL:share:collaborationService:completionHandler: with nil URL and nil CKShare");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sharesheet.addParticipantsAllowed"), 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    share_sheet_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities _addParticipantsAllowedForURL:share:collaborationService:completionHandler:].cold.1(v15, v16);
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR("requestAddParticipantsAllowedForURL:share:completionHandler: has not yet been implemented");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sharesheet.addParticipantsAllowed"), 0, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    share_sheet_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities _addParticipantsAllowedForURL:share:collaborationService:completionHandler:].cold.1(v15, v16);
LABEL_8:

    v12[2](v12, 1, v15);
    goto LABEL_9;
  }
  objc_msgSend(v11, "requestAddParticipantsAllowedForURL:share:completionHandler:", v9, v10, v12);
LABEL_9:

}

+ (void)_addParticipantsAllowedForShare:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id CloudSharingClass;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    CloudSharingClass = getCloudSharingClass();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__SFCollaborationUtilities__addParticipantsAllowedForShare_completionHandler___block_invoke;
    v12[3] = &unk_1E4831978;
    v13 = v6;
    objc_msgSend(CloudSharingClass, "sharingStatusForShare:completionHandler:", v5, v12);
    v8 = v13;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = CFSTR("Called _addParticipantsAllowedForShare:completionHandler: with nil CKShare");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sharesheet.addParticipantsAllowed"), 0, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities _addParticipantsAllowedForURL:share:collaborationService:completionHandler:].cold.1(v8, v11);

    (*((void (**)(id, uint64_t, void *))v6 + 2))(v6, 1, v8);
  }

}

void __78__SFCollaborationUtilities__addParticipantsAllowedForShare_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)_dataForFilepath:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isFileURL"))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)canShowShareOptionsForCollaborationItem:(id)a3 service:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "itemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[SFCollaborationUtilities isPostCKShareItemProvider:](SFCollaborationUtilities, "isPostCKShareItemProvider:", v10);

  if (objc_msgSend(v7, "type"))
  {
    if (v11)
    {
      objc_msgSend(v7, "itemProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_3;
      v15[3] = &unk_1E4831658;
      v16 = v9;
      +[SFCollaborationUtilities loadCKShareItemProvider:onlyPostShare:completionHandler:](SFCollaborationUtilities, "loadCKShareItemProvider:onlyPostShare:completionHandler:", v12, 1, v15);

    }
    else
    {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    }
  }
  else
  {
    v13 = v7;
    if (objc_msgSend(v13, "isShared"))
    {
      objc_msgSend(v13, "fileURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke;
      v17[3] = &unk_1E48319C8;
      v18 = v9;
      objc_msgSend(v8, "isShareOwnerOrAdminForFileURL:completionHandler:", v14, v17);

    }
    else
    {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    }

  }
}

void __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_2;
  v3[3] = &unk_1E48319A0;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_4;
  v3[3] = &unk_1E48319C8;
  v4 = *(id *)(a1 + 32);
  +[SFCollaborationUtilities isShareOwnerOrAdminForShare:completionHandler:](SFCollaborationUtilities, "isShareOwnerOrAdminForShare:completionHandler:", a2, v3);

}

void __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_4(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_5;
  v3[3] = &unk_1E48319A0;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __94__SFCollaborationUtilities_canShowShareOptionsForCollaborationItem_service_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (void)isShareOwnerOrAdminForCollaborationItem:(id)a3 service:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "type"))
  {
    objc_msgSend(v7, "itemProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[SFCollaborationUtilities isPostCKShareItemProvider:](SFCollaborationUtilities, "isPostCKShareItemProvider:", v10);

    if (v11)
    {
      objc_msgSend(v7, "itemProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_3;
      v15[3] = &unk_1E4831658;
      v16 = v9;
      +[SFCollaborationUtilities loadCKShareItemProvider:onlyPostShare:completionHandler:](SFCollaborationUtilities, "loadCKShareItemProvider:onlyPostShare:completionHandler:", v12, 1, v15);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
    }
  }
  else
  {
    v13 = v7;
    if (objc_msgSend(v13, "isShared") && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "fileURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke;
      v17[3] = &unk_1E48319C8;
      v18 = v9;
      objc_msgSend(v8, "isShareOwnerOrAdminForFileURL:completionHandler:", v14, v17);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
    }

  }
}

void __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke(uint64_t a1, char a2, char a3)
{
  _QWORD v5[4];
  id v6;
  char v7;
  char v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_2;
  v5[3] = &unk_1E48319F0;
  v6 = *(id *)(a1 + 32);
  v7 = a2;
  v8 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

void __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_4;
  v3[3] = &unk_1E48319C8;
  v4 = *(id *)(a1 + 32);
  +[SFCollaborationUtilities isShareOwnerOrAdminForShare:completionHandler:](SFCollaborationUtilities, "isShareOwnerOrAdminForShare:completionHandler:", a2, v3);

}

void __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_4(uint64_t a1, char a2, char a3)
{
  _QWORD v5[4];
  id v6;
  char v7;
  char v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_5;
  v5[3] = &unk_1E48319F0;
  v6 = *(id *)(a1 + 32);
  v7 = a2;
  v8 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __94__SFCollaborationUtilities_isShareOwnerOrAdminForCollaborationItem_service_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

+ (void)isShareOwnerOrAdminForFileURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id CloudSharingClass;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    CloudSharingClass = getCloudSharingClass();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__SFCollaborationUtilities_isShareOwnerOrAdminForFileURL_completionHandler___block_invoke;
    v9[3] = &unk_1E4831A18;
    v10 = v5;
    v11 = v6;
    objc_msgSend(CloudSharingClass, "existingShareForFileOrFolderURL:completionHandler:", v10, v9);

  }
  else
  {
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities isShareOwnerOrAdminForFileURL:completionHandler:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

void __76__SFCollaborationUtilities_isShareOwnerOrAdminForFileURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __76__SFCollaborationUtilities_isShareOwnerOrAdminForFileURL_completionHandler___block_invoke_cold_1();

  }
  +[SFCollaborationUtilities isShareOwnerOrAdminForShare:completionHandler:](SFCollaborationUtilities, "isShareOwnerOrAdminForShare:completionHandler:", v6, *(_QWORD *)(a1 + 40));

}

+ (void)isShareOwnerOrAdminForShare:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, uint64_t, _QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = v12;
  if (!v12)
  {
    v5[2](v5, 1, 0);
    v6 = 0;
  }
  objc_msgSend(v6, "currentUserParticipant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "role");

  LODWORD(v9) = objc_msgSend(v12, "publicPermission") == 2 || objc_msgSend(v12, "publicPermission") == 3;
  v10 = v8 == 1;
  objc_msgSend(v12, "currentUserParticipant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "role") == 2)
    v9 = 1;
  else
    v9 = v9;

  v5[2](v5, v10, v9);
}

+ (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id CloudSharingClass;
  void *v16;
  SFCollaborationCloudSharingResult *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  NSObject *v31;
  SFCollaborationCloudSharingResult *v32;
  void *v33;
  SFCollaborationCloudSharingResult *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  SFCollaborationCloudSharingResult *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[4];
  SFCollaborationCloudSharingResult *v53;
  id v54;
  _QWORD v55[4];
  SFCollaborationCloudSharingResult *v56;
  id v57;
  _QWORD v58[4];
  SFCollaborationCloudSharingResult *v59;
  id v60;
  _QWORD aBlock[4];
  id v62;
  os_signpost_id_t v63;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  gelato_sharing_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, v5);

  gelato_sharing_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CollaborationCreateSharingURL", ", buf, 2u);
  }

  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E4831A40;
  v63 = v8;
  v12 = v6;
  v62 = v12;
  v13 = _Block_copy(aBlock);
  objc_msgSend(v5, "fileOrFolderURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    CloudSharingClass = getCloudSharingClass();
    objc_msgSend(v5, "fileOrFolderURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v11;
    v58[1] = 3221225472;
    v58[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_237;
    v58[3] = &unk_1E4831A90;
    v59 = (SFCollaborationCloudSharingResult *)v5;
    v60 = v13;
    objc_msgSend(CloudSharingClass, "sharingStatusForFileOrFolderURL:completionHandler:", v16, v58);

    v17 = v59;
    goto LABEL_6;
  }
  objc_msgSend(v5, "share");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v5, "share");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URL");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
LABEL_13:

      goto LABEL_14;
    }
    v21 = (void *)v20;
    objc_msgSend(v5, "share");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "participants");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v23, "count") < 2)
    {
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(v5, "emailAddresses");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
    {

      goto LABEL_12;
    }
    objc_msgSend(v5, "phoneNumbers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v41, "count");

    if (v51)
    {
LABEL_14:
      objc_msgSend(v5, "share");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "participants");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27 > 1)
      {
        v35 = getCloudSharingClass();
        objc_msgSend(v5, "share");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setupInfo");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "emailAddresses");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "phoneNumbers");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "permissionType");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (int)objc_msgSend(v38, "intValue");
        objc_msgSend(v5, "allowOthersToInvite");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "BOOLValue");
        v52[0] = v11;
        v52[1] = 3221225472;
        v52[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_2;
        v52[3] = &unk_1E4831A18;
        v53 = (SFCollaborationCloudSharingResult *)v5;
        v54 = v13;
        objc_msgSend(v35, "addParticipantsToShare:containerSetupInfo:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:completionHandler:", v50, v49, v36, v37, v48, v40, v52);

        v17 = v53;
      }
      else
      {
        share_sheet_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A2830000, v28, OS_LOG_TYPE_DEFAULT, "Getting status for share", buf, 2u);
        }

        v29 = getCloudSharingClass();
        objc_msgSend(v5, "share");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = v11;
        v55[1] = 3221225472;
        v55[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_245;
        v55[3] = &unk_1E4831A90;
        v56 = (SFCollaborationCloudSharingResult *)v5;
        v57 = v13;
        objc_msgSend(v29, "sharingStatusForShare:completionHandler:", v30, v55);

        v17 = v56;
      }
      goto LABEL_6;
    }
    share_sheet_log();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2830000, v42, OS_LOG_TYPE_DEFAULT, "Share exists and we are not intending to add participants, using existing share URL", buf, 2u);
    }

    v43 = [SFCollaborationCloudSharingResult alloc];
    objc_msgSend(v5, "collaborationItemIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "share");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "URL");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "share");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SFCollaborationCloudSharingResult initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:](v43, "initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:", v44, v46, v47, 1, 0, 0);

    (*((void (**)(void *, SFCollaborationCloudSharingResult *))v13 + 2))(v13, v17);
  }
  else
  {
    share_sheet_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      +[SFCollaborationUtilities createSharingURLForCollaborationRequest:completionHandler:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sharesheet.sharingURLCreation"), 0, 0);
    v17 = (SFCollaborationCloudSharingResult *)objc_claimAutoreleasedReturnValue();
    v32 = [SFCollaborationCloudSharingResult alloc];
    objc_msgSend(v5, "collaborationItemIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[SFCollaborationCloudSharingResult initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:](v32, "initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:", v33, 0, 0, v17, 0);

    (*((void (**)(void *, SFCollaborationCloudSharingResult *))v13 + 2))(v13, v34);
  }
LABEL_6:

}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  gelato_sharing_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v5, OS_SIGNPOST_INTERVAL_END, v6, "CollaborationCreateSharingURL", ", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_237(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id *v10;
  id *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id CloudSharingClass;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[16];

  if (a2 == 6)
  {
    share_sheet_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Sharing an unshared folder with shared subitems. First we need to override the share", buf, 2u);
    }

    CloudSharingClass = getCloudSharingClass();
    objc_msgSend(*(id *)(a1 + 32), "fileOrFolderURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "emailAddresses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "phoneNumbers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (int)objc_msgSend(v5, "intValue");
    objc_msgSend(*(id *)(a1 + 32), "permissionType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (int)objc_msgSend(v6, "intValue");
    objc_msgSend(*(id *)(a1 + 32), "allowOthersToInvite");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_238;
    v20[3] = &unk_1E4831A18;
    v10 = &v21;
    v21 = *(id *)(a1 + 32);
    v11 = &v22;
    v22 = *(id *)(a1 + 40);
    objc_msgSend(CloudSharingClass, "shareFolderRemovingSubshares:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:completionHandler:", v4, v15, v14, v13, v7, v9, v20);

  }
  else
  {
    v12 = getCloudSharingClass();
    objc_msgSend(*(id *)(a1 + 32), "fileOrFolderURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_240;
    v17[3] = &unk_1E4831A18;
    v10 = &v18;
    v18 = *(id *)(a1 + 32);
    v11 = &v19;
    v19 = *(id *)(a1 + 40);
    objc_msgSend(v12, "existingShareForFileOrFolderURL:completionHandler:", v4, v17);
  }

}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_238(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  SFCollaborationCloudSharingResult *v13;
  void *v14;
  SFCollaborationCloudSharingResult *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  v9 = a2;
  share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v11)
    {
      objc_msgSend(v7, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v12;
      _os_log_impl(&dword_1A2830000, v10, OS_LOG_TYPE_DEFAULT, "Failed to override folder subitems' shares with error: %@", (uint8_t *)&v16, 0xCu);

    }
  }
  else if (v11)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1A2830000, v10, OS_LOG_TYPE_DEFAULT, "Created an empty share for the folder which overrode the shared subitems", (uint8_t *)&v16, 2u);
  }

  v13 = [SFCollaborationCloudSharingResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "collaborationItemIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SFCollaborationCloudSharingResult initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:](v13, "initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:", v14, v9, v8, v7, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_240(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  SFCollaborationCloudSharingResult *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  SFCollaborationCloudSharingResult *v28;
  void *v29;
  id CloudSharingClass;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  SFCollaborationCloudSharingResult *v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  SFCollaborationCloudSharingResult *v40;
  id v41;
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8 || v9)
  {
    v31 = v9;
    v32 = v8;
    v33 = v7;
    share_sheet_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2830000, v12, OS_LOG_TYPE_DEFAULT, "File is unshared, sharing as owner", buf, 2u);
    }

    CloudSharingClass = getCloudSharingClass();
    objc_msgSend(*(id *)(a1 + 32), "fileOrFolderURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "emailAddresses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "phoneNumbers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (int)objc_msgSend(v16, "intValue");
    objc_msgSend(*(id *)(a1 + 32), "permissionType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (int)objc_msgSend(v18, "intValue");
    objc_msgSend(*(id *)(a1 + 32), "allowOthersToInvite");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_241;
    v39[3] = &unk_1E4831A18;
    v40 = (SFCollaborationCloudSharingResult *)*(id *)(a1 + 32);
    v41 = *(id *)(a1 + 40);
    objc_msgSend(CloudSharingClass, "shareFileOrFolderURL:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:completionHandler:", v13, v14, v15, v17, v19, v21, v39);

    v22 = v40;
    v8 = v32;
    v7 = v33;
    v10 = v31;
  }
  else
  {
    if (!v7)
    {
LABEL_10:
      share_sheet_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2830000, v25, OS_LOG_TYPE_DEFAULT, "File is shared, getting share status", buf, 2u);
      }

      v26 = getCloudSharingClass();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_242;
      v34[3] = &unk_1E4831A68;
      v35 = (SFCollaborationCloudSharingResult *)v8;
      v36 = *(id *)(a1 + 32);
      v38 = *(id *)(a1 + 40);
      v37 = v7;
      objc_msgSend(v26, "sharingStatusForShare:completionHandler:", v35, v34);

      v22 = v35;
      goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 32), "emailAddresses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {

      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 32), "phoneNumbers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
      goto LABEL_10;
    share_sheet_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2830000, v27, OS_LOG_TYPE_DEFAULT, "File is shared and we are not intending to add participants, using existing share URL", buf, 2u);
    }

    v28 = [SFCollaborationCloudSharingResult alloc];
    objc_msgSend(*(id *)(a1 + 32), "collaborationItemIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SFCollaborationCloudSharingResult initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:](v28, "initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:", v29, v7, v8, 1, 0, 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
LABEL_13:

}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_241(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  SFCollaborationCloudSharingResult *v10;
  void *v11;
  SFCollaborationCloudSharingResult *v12;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = [SFCollaborationCloudSharingResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "collaborationItemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SFCollaborationCloudSharingResult initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:](v10, "initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:", v11, v9, v8, v7, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_242(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id CloudSharingClass;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  SFCollaborationCloudSharingResult *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  SFCollaborationCloudSharingResult *v25;
  void *v26;
  _QWORD v27[4];
  SFCollaborationCloudSharingResult *v28;
  id v29;
  _QWORD v30[4];
  SFCollaborationCloudSharingResult *v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v34 = a2;
    _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, "Shared file status is %ld", buf, 0xCu);
  }

  if (a2)
  {
    if (a2 == 1)
    {
      CloudSharingClass = getCloudSharingClass();
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "emailAddresses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "phoneNumbers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "permissionType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (int)objc_msgSend(v11, "intValue");
      objc_msgSend(*(id *)(a1 + 40), "allowOthersToInvite");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_243;
      v30[3] = &unk_1E4831A18;
      v31 = (SFCollaborationCloudSharingResult *)*(id *)(a1 + 40);
      v32 = *(id *)(a1 + 56);
      objc_msgSend(CloudSharingClass, "addParticipantsToShare:containerSetupInfo:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:completionHandler:", v8, 0, v9, v10, v12, v14, v30);

      v15 = v31;
    }
    else
    {
      v25 = [SFCollaborationCloudSharingResult alloc];
      objc_msgSend(*(id *)(a1 + 40), "collaborationItemIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SFCollaborationCloudSharingResult initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:](v25, "initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:", v26, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), 1, 0, 0);

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
  else
  {
    share_sheet_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_242_cold_1();

    v17 = getCloudSharingClass();
    v18 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "emailAddresses");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "phoneNumbers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "permissionType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (int)objc_msgSend(v21, "intValue");
    objc_msgSend(*(id *)(a1 + 40), "allowOthersToInvite");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_244;
    v27[3] = &unk_1E4831A18;
    v28 = (SFCollaborationCloudSharingResult *)*(id *)(a1 + 40);
    v29 = *(id *)(a1 + 56);
    objc_msgSend(v17, "addParticipantsToShare:containerSetupInfo:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:completionHandler:", v18, 0, v19, v20, v22, v24, v27);

    v15 = v28;
  }

}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_243(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  SFCollaborationCloudSharingResult *v10;
  void *v11;
  SFCollaborationCloudSharingResult *v12;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = [SFCollaborationCloudSharingResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "collaborationItemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SFCollaborationCloudSharingResult initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:](v10, "initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:", v11, v9, v8, 1, v7, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_244(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  SFCollaborationCloudSharingResult *v10;
  void *v11;
  SFCollaborationCloudSharingResult *v12;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = [SFCollaborationCloudSharingResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "collaborationItemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SFCollaborationCloudSharingResult initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:](v10, "initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:", v11, v9, v8, 1, v7, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_245(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  SFCollaborationCloudSharingResult *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  SFCollaborationCloudSharingResult *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id CloudSharingClass;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  SFCollaborationCloudSharingResult *v40;
  id v41;
  _QWORD v42[4];
  SFCollaborationCloudSharingResult *v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v46 = a2;
    _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, "Share status is %ld", buf, 0xCu);
  }

  if (a2)
  {
    if (a2 == 1)
    {
      CloudSharingClass = getCloudSharingClass();
      objc_msgSend(*(id *)(a1 + 32), "share");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setupInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "emailAddresses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "phoneNumbers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessType");
      v37 = v5;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (int)objc_msgSend(v10, "intValue");
      objc_msgSend(*(id *)(a1 + 32), "permissionType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (int)objc_msgSend(v12, "intValue");
      objc_msgSend(*(id *)(a1 + 32), "allowOthersToInvite");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_246;
      v42[3] = &unk_1E4831A18;
      v43 = (SFCollaborationCloudSharingResult *)*(id *)(a1 + 32);
      v44 = *(id *)(a1 + 40);
      LOBYTE(v32) = v15;
      objc_msgSend(CloudSharingClass, "completeShare:containerSetupInfo:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:completionHandler:", v33, v7, v8, v9, v11, v13, v32, v42);

      v5 = v37;
      v16 = v43;
    }
    else
    {
      v27 = [SFCollaborationCloudSharingResult alloc];
      objc_msgSend(*(id *)(a1 + 32), "collaborationItemIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "share");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "URL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "share");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[SFCollaborationCloudSharingResult initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:](v27, "initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:", v28, v30, v31, 0, 0);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    share_sheet_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_245_cold_1(v5, v17);

    v36 = getCloudSharingClass();
    objc_msgSend(*(id *)(a1 + 32), "share");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setupInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "emailAddresses");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "phoneNumbers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessType");
    v38 = v5;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (int)objc_msgSend(v21, "intValue");
    objc_msgSend(*(id *)(a1 + 32), "permissionType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (int)objc_msgSend(v23, "intValue");
    objc_msgSend(*(id *)(a1 + 32), "allowOthersToInvite");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_247;
    v39[3] = &unk_1E4831A18;
    v40 = (SFCollaborationCloudSharingResult *)*(id *)(a1 + 32);
    v41 = *(id *)(a1 + 40);
    LOBYTE(v32) = v26;
    objc_msgSend(v36, "completeShare:containerSetupInfo:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:completionHandler:", v34, v18, v19, v20, v22, v24, v32, v39);

    v5 = v38;
    v16 = v40;
  }

}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_246(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  SFCollaborationCloudSharingResult *v10;
  void *v11;
  SFCollaborationCloudSharingResult *v12;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = [SFCollaborationCloudSharingResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "collaborationItemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SFCollaborationCloudSharingResult initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:](v10, "initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:", v11, v9, v8, v7, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_247(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  SFCollaborationCloudSharingResult *v10;
  void *v11;
  SFCollaborationCloudSharingResult *v12;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = [SFCollaborationCloudSharingResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "collaborationItemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SFCollaborationCloudSharingResult initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:](v10, "initWithCollaborationItemIdentifier:sharingURL:share:error:mailResult:", v11, v9, v8, v7, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  SFCollaborationCloudSharingResult *v10;
  void *v11;
  SFCollaborationCloudSharingResult *v12;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = [SFCollaborationCloudSharingResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "collaborationItemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SFCollaborationCloudSharingResult initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:](v10, "initWithCollaborationItemIdentifier:sharingURL:share:existingShare:error:mailResult:", v11, v9, v8, 1, v7, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)createMailContentForRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id CloudSharingClass;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD aBlock[4];
  id v32;
  os_signpost_id_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  gelato_sharing_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, v5);

  gelato_sharing_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CollaborationCreateMailContent", ", buf, 2u);
  }

  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__SFCollaborationUtilities_createMailContentForRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E4831AB8;
  v32 = v6;
  v33 = v8;
  v12 = v6;
  v13 = _Block_copy(aBlock);
  share_sheet_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "sharingURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileOrFolderURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "share");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v35 = v15;
    v36 = 2112;
    v37 = v16;
    v38 = 2112;
    v39 = v17;
    v40 = 2112;
    v41 = 0;
    v42 = 2112;
    v43 = 0;
    v44 = 2112;
    v45 = 0;
    v46 = 2112;
    v47 = v18;
    _os_log_impl(&dword_1A2830000, v14, OS_LOG_TYPE_DEFAULT, "Calling messageContentForMail SPI with sharingURL:%@, fileURL:%@, appName:%@, canEdit:%@, allowOthersToInvite:%@, containerID:%@, share:%@", buf, 0x48u);

  }
  CloudSharingClass = getCloudSharingClass();
  objc_msgSend(v5, "sharingURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "share");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileOrFolderURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appIconData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __74__SFCollaborationUtilities_createMailContentForRequest_completionHandler___block_invoke_251;
  v26[3] = &unk_1E4831AE0;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v30 = v13;
  v25 = v13;
  objc_msgSend(CloudSharingClass, "messageContentForMail:share:fileURL:appName:appIconData:completionHandler:", v20, v21, v22, v23, v24, v26);

}

void __74__SFCollaborationUtilities_createMailContentForRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  gelato_sharing_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v5, OS_SIGNPOST_INTERVAL_END, v6, "CollaborationCreateMailContent", ", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__SFCollaborationUtilities_createMailContentForRequest_completionHandler___block_invoke_251(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  SFCollaborationCloudSharingMailResult *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412802;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1A2830000, v10, OS_LOG_TYPE_DEFAULT, "Call to messageContentForMail SPI returned subject:%@, body:%@, error:%@", (uint8_t *)&v12, 0x20u);
  }

  v11 = -[SFCollaborationCloudSharingMailResult initWithSubject:body:containerID:canEdit:allowOthersToInvite:error:]([SFCollaborationCloudSharingMailResult alloc], "initWithSubject:body:containerID:canEdit:allowOthersToInvite:error:", v7, v8, a1[4], a1[5], a1[6], v9);
  (*(void (**)(void))(a1[7] + 16))();

}

+ (BOOL)canDeleteShareForCollaborationItem:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 1)
  {
    objc_msgSend(v3, "itemProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = +[SFCollaborationUtilities isPreCKShareItemProvider:](SFCollaborationUtilities, "isPreCKShareItemProvider:", v4);

  }
  else if (objc_msgSend(v3, "type"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = objc_msgSend(v3, "isShared") ^ 1;
  }

  return v5;
}

+ (id)descriptionForShareOptions:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optionsGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ summary: %@, options: %@>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)getFailureTitle:(id *)a3 message:(id *)a4 error:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  id v25;

  v7 = a5;
  SFLocalizedStringForKey(CFSTR("ERROR_TITLE_COULD_NOT_ADD_PARTICIPANTS"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  SFLocalizedStringForKey(CFSTR("ERROR_MESSAGE_COULD_NOT_ADD_PARTICIPANTS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFCollaborationUtilities underlyingCKErrorForError:](SFCollaborationUtilities, "underlyingCKErrorForError:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  getCKErrorDomain();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (!v12)
  {
    objc_msgSend(v9, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

    if (!v21)
      goto LABEL_19;
    v22 = (void *)MEMORY[0x1E0CB3940];
    SFLocalizedStringForKey(CFSTR("ERROR_MESSAGE_COULD_NOT_ADD_PARTICIPANTS_WITH_ERROR_INFO"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedDescription");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v14, v23, v25);
    v19 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v23;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "processName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v9, "code");
  if (v15 > 28)
  {
    switch(v15)
    {
      case 29:
        SFLocalizedStringForKey(CFSTR("ERROR_TITLE_TOO_MANY_PARTICIPANTS"));
        v16 = objc_claimAutoreleasedReturnValue();

        v24 = CFSTR("ERROR_MESSAGE_TOO_MANY_PARTICIPANTS");
        break;
      case 30:
        SFLocalizedStringForKey(CFSTR("ERROR_TITLE_FILE_ALREADY_SHARED"));
        v16 = objc_claimAutoreleasedReturnValue();

        v24 = CFSTR("ERROR_MESSAGE_FILE_ALREADY_SHARED");
        break;
      case 32:
        SFLocalizedStringForKey(CFSTR("ERROR_TITLE_MAID"));
        v16 = objc_claimAutoreleasedReturnValue();

        v24 = CFSTR("ERROR_MESSAGE_MAID");
        break;
      default:
        goto LABEL_18;
    }
    SFLocalizedStringForKey(v24);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((unint64_t)(v15 - 3) < 2)
  {
    SFLocalizedStringForKey(CFSTR("ERROR_TITLE_NETWORK_UNAVAILABLE_OR_FAILURE"));
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB3940];
    SFLocalizedStringForKey(CFSTR("ERROR_MESSAGE_NETWORK_UNAVAILABLE_OR_FAILURE"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringWithFormat:", v18, v14);
    v19 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v18;
LABEL_16:
    v25 = (id)v16;
    goto LABEL_17;
  }
  if (v15 == 14)
  {
    SFLocalizedStringForKey(CFSTR("ERROR_MESSAGE_COULD_NOT_ADD_PARTICIPANTS_WITH_TRY_AGAIN"));
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_17:

    v8 = (void *)v19;
  }
LABEL_18:

LABEL_19:
  if (a3)
    *a3 = objc_retainAutorelease(v25);
  if (a4)
    *a4 = objc_retainAutorelease(v8);

}

+ (BOOL)isOplockError:(id)a3 updatedShare:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a3;
  if (v5)
  {
    +[SFCollaborationUtilities underlyingCKErrorForError:](SFCollaborationUtilities, "underlyingCKErrorForError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    getCKErrorDomain();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      v9 = objc_msgSend(v6, "code");

      if (v9 == 14)
      {
        objc_msgSend(v6, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        v18 = &v17;
        v19 = 0x2020000000;
        v11 = (id *)getCKRecordChangedErrorServerRecordKeySymbolLoc_ptr;
        v20 = getCKRecordChangedErrorServerRecordKeySymbolLoc_ptr;
        if (!getCKRecordChangedErrorServerRecordKeySymbolLoc_ptr)
        {
          v12 = (void *)CloudKitLibrary_0();
          v11 = (id *)dlsym(v12, "CKRecordChangedErrorServerRecordKey");
          v18[3] = (uint64_t)v11;
          getCKRecordChangedErrorServerRecordKeySymbolLoc_ptr = (uint64_t)v11;
        }
        _Block_object_dispose(&v17, 8);
        if (!v11)
          +[SFCollaborationUtilities isOplockError:updatedShare:].cold.1();
        v13 = *v11;
        objc_msgSend(v10, "objectForKeyedSubscript:", v13, v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (a4)
          *a4 = objc_retainAutorelease(v14);

        v15 = 1;
        goto LABEL_13;
      }
    }
    else
    {

    }
    v15 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

+ (id)underlyingCKErrorForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getCKErrorDomain();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5)
    || (objc_msgSend(v3, "userInfo"), (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    v12 = v3;
  }
  else
  {
    v7 = (void *)v6;
    objc_msgSend(v3, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v12 = v3;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v3, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2F70]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      getCKErrorDomain();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToString:", v18);

      if (v19)
      {
        v12 = v14;

      }
      else
      {
        v12 = v3;
        if (v16)
        {
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v21 = v16;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          v12 = v3;
          if (v22)
          {
            v23 = v22;
            v30 = v16;
            v24 = *(_QWORD *)v32;
            while (2)
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v32 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
                objc_msgSend(v26, "domain");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                getCKErrorDomain();
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v27, "isEqualToString:", v28);

                if (v29)
                {
                  v12 = v26;

                  goto LABEL_19;
                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
              if (v23)
                continue;
              break;
            }
            v12 = v3;
LABEL_19:
            v16 = v30;
          }

        }
      }

    }
  }

  return v12;
}

+ (void)shareStatusForURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id CloudSharingClass;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  CloudSharingClass = getCloudSharingClass();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__SFCollaborationUtilities_shareStatusForURL_completionHandler___block_invoke;
  v9[3] = &unk_1E4831978;
  v10 = v5;
  v8 = v5;
  objc_msgSend(CloudSharingClass, "sharingStatusForFileOrFolderURL:completionHandler:", v6, v9);

}

uint64_t __64__SFCollaborationUtilities_shareStatusForURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)urlRequestsForCollaborationItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!objc_msgSend(v9, "type"))
        {
          if (!v6)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v9, "fileURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_setNonAppInitiated:", 1);
          objc_msgSend(v6, "addObject:", v11);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "No options were found, providing default values for permissions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CKShareParticipantPermission soft_CKSharingPermissionTypeFromOptionsGroups(NSArray<_SWCollaborationOptionsGroup *> *__strong)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFCollaborationUtilities.m"), 84, CFSTR("%s"), OUTLINED_FUNCTION_7_1());

  __break(1u);
}

+ (void)getCKSharingOptionsFromOptions:accessType:permissionType:allowOthersToInvite:.cold.3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL soft_CKSharingAllowOthersToInviteFromOptionsGroups(NSArray<_SWCollaborationOptionsGroup *> *__strong)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFCollaborationUtilities.m"), 85, CFSTR("%s"), OUTLINED_FUNCTION_7_1());

  __break(1u);
}

+ (void)_loadShareOptionsForCKShareItemProvider:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, v0, v1, "itemProvider:%@ cannot load object of class CKAllowedSharingOptions.", v2);
  OUTLINED_FUNCTION_3();
}

void __86__SFCollaborationUtilities__loadShareOptionsForCKShareItemProvider_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, v0, v1, "Loading CKShare Options failed with error:%@", v2);
  OUTLINED_FUNCTION_3();
}

void __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_151_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, v0, v1, "failed to load CKPostSharingContext:%@", v2);
  OUTLINED_FUNCTION_3();
}

void __84__SFCollaborationUtilities_loadCKShareItemProvider_onlyPostShare_completionHandler___block_invoke_152_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, v0, v1, "failed to load CKPreSharingContext:%@", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)loadCKContainerForItemProvider:completionHandler:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *get_CKCloudKitContainerSetupInfoType(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFCollaborationUtilities.m"), 76, CFSTR("%s"), OUTLINED_FUNCTION_7_1());

  __break(1u);
}

+ (void)isCollaborationItemPrivateShare:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "No options were found, providing default value for access type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)createLinkMetadataWithCKShare:containerSetupInfo:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCKShareThumbnailImageDataKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFCollaborationUtilities.m"), 102, CFSTR("%s"), OUTLINED_FUNCTION_7_1());

  __break(1u);
}

+ (void)createLinkMetadataWithCKShare:containerSetupInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Failed to set icon on LP since we failed to get a bundleID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)createLinkMetadataWithCKShare:containerSetupInfo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, v0, v1, "Failed to get a bundleID from containerSetupInfo:%@", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)createLinkMetadataWithCKShare:(void *)a1 containerSetupInfo:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, a2, v4, "Failed to get a bundle from appRecord.URL: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

+ (void)createLinkMetadataWithCKShare:containerSetupInfo:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, v0, v1, "Failed to get a URL appRecord : %@", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)isThirdPartyFileProviderBackedURL:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1(&dword_1A2830000, v1, v2, "error fetching file provider domain for URL:%@ : %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

+ (void)isSharedFileURL:(uint64_t)a1 isLocalStorageFileURL:isiCloudDriveFileURL:isInSharedFolder:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1(&dword_1A2830000, v1, v2, "error fetching item for URL:%@ : %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

+ (void)requestSharedURLForCollaborationItem:collaborationService:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, v0, v1, "Can't request SharedURL for URL:%@ because the service is nil.", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)requestSharedURLForCollaborationItem:collaborationService:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Can't get shared URL for Pre-CKShare type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)requestSharedURLForCollaborationItem:(void *)a1 collaborationService:(NSObject *)a2 completionHandler:.cold.3(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "type");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, a2, v3, "Can't get shared URL for type:%ld", v4);
  OUTLINED_FUNCTION_6_1();
}

void __85__SFCollaborationUtilities_findOriginatingSharedItemForSubitemURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1(&dword_1A2830000, v1, v2, "error fetching parent items for URL:%@ : %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

void __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, v0, v1, "Failed to load copy representation URL with error: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __92__SFCollaborationUtilities_loadiWorkCopyRepresentationURLForItemProvider_completionHandler___block_invoke_187_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1(&dword_1A2830000, v1, v2, "Failed to coordinate read for copy representation URL for file at URL %@ with error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

+ (void)_copyRepresentationTypeIdentifier
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSWCopyRepresentationTypeIdentifier(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFCollaborationUtilities.m"), 126, CFSTR("%s"), OUTLINED_FUNCTION_7_1());

  __break(1u);
}

+ (void)_loadShareOptionsForSWYItemProvider:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, v0, v1, "itemProvider:%@ isn't conformed to UTCollaborationOptionsTypeIdentifier.", v2);
  OUTLINED_FUNCTION_3();
}

void __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, v0, v1, "Loading SWYShare Options failed with error:%@", v2);
  OUTLINED_FUNCTION_3();
}

void __82__SFCollaborationUtilities__loadShareOptionsForSWYItemProvider_completionHandler___block_invoke_192_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "collaborationMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, a2, v4, "Loading SWYShare Options failed. Pending collaboration's metadata object is %@", v5);

  OUTLINED_FUNCTION_6_1();
}

void __89__SFCollaborationUtilities_loadSendCopyRepresentationIfNeededForItemProvider_completion___block_invoke_195_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, v0, v1, "Could not load send copy representation: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __99__SFCollaborationUtilities__processRemainingActivityItems_toFinalActivityItems_onQueue_completion___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, a2, a3, "Failed to load item provider %@, falling back to original item provider", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

+ (void)loadShareOptionsForItemProvider:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Only support loading options for CKShare and SWY types.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)loadMetadataForItemProvider:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, v0, v1, "Can't load metadata: item provider is not CKShare based : %@", v2);
  OUTLINED_FUNCTION_3();
}

void __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, a2, v4, "Could not find identifier from the share URL: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

void __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCKShareTypeKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFCollaborationUtilities.m"), 103, CFSTR("%s"), OUTLINED_FUNCTION_7_1());

  __break(1u);
}

void __74__SFCollaborationUtilities_loadMetadataForItemProvider_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "CKShare options are empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __86__SFCollaborationUtilities_loadPendingCollaborationForItemProvider_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, v0, v1, "Failed to get pending collaboration: %@", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)addParticipantsAllowedForURL:(void *)a1 share:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, a2, v4, "%@", v5);

  OUTLINED_FUNCTION_6_1();
}

+ (void)_addParticipantsAllowedForURL:(void *)a1 share:(NSObject *)a2 collaborationService:completionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, a2, v4, "%@", v5);

  OUTLINED_FUNCTION_6_1();
}

+ (void)isShareOwnerOrAdminForFileURL:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "no fileURL provided to figure out if it's the owner or an admin.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __76__SFCollaborationUtilities_isShareOwnerOrAdminForFileURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1(&dword_1A2830000, v1, v2, "error to get existing share for fileURL:%@ %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

+ (void)createSharingURLForCollaborationRequest:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Received collaboration request with neither file URL nor share", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_242_cold_1()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  OUTLINED_FUNCTION_5_1();
  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v2 + 40), "fileOrFolderURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v3;
  v8 = 2112;
  v9 = v4;
  OUTLINED_FUNCTION_0_2(&dword_1A2830000, v0, v5, "Attempt to get sharing status for file URL %@ failed, falling back on assumption of ownership. Error: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_5_0();
}

void __86__SFCollaborationUtilities_createSharingURLForCollaborationRequest_completionHandler___block_invoke_245_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_1A2830000, a2, v4, "Attempt to get sharing status failed, falling back on assumption of ownership. Error: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

+ (void)isOplockError:updatedShare:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCKRecordChangedErrorServerRecordKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SFCollaborationUtilities.m"), 78, CFSTR("%s"), OUTLINED_FUNCTION_7_1());

  __break(1u);
}

@end
