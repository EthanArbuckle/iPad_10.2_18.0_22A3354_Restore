@implementation SFCollaborationItemInspector

+ (id)inspectActivityItemValue:(id)a3 activityItem:(id)a4 service:(id)a5 shouldInspectFiles:(BOOL)a6 managedFileURL:(id)a7 isURLProviderSupported:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v8 = a8;
  v10 = a6;
  v36 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  share_sheet_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138740739;
    v29 = v13;
    v30 = 2114;
    v31 = v19;
    v32 = 2117;
    v33 = v14;
    v34 = 2112;
    v35 = v21;
    _os_log_impl(&dword_1A2830000, v17, OS_LOG_TYPE_DEFAULT, "Inspect activityItemValue:%{sensitive}@, activityItemValueType:%{public}@ activityItem:%{sensitive}@ activityItemType:%@", buf, 0x2Au);

  }
  if (!v13)
    v13 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v13;
    if ((objc_msgSend(v22, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.group-activities.activity")) & 1) != 0)
    {
      v23 = 0;
      goto LABEL_12;
    }
    +[SFCollaborationItemInspector _collaborationItemFromItemProvider:forActivityItem:service:shouldInspectFiles:managedFileURL:isURLProviderSupported:](SFCollaborationItemInspector, "_collaborationItemFromItemProvider:forActivityItem:service:shouldInspectFiles:managedFileURL:isURLProviderSupported:", v22, v14, v15, v10, v16, v8);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v10)
    {
      v23 = 0;
      goto LABEL_15;
    }
    +[SFCollaborationUtilities urlFromActivityItem:allowsLoading:](SFCollaborationUtilities, "urlFromActivityItem:allowsLoading:", v13, 1);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    +[SFCollaborationItemInspector _collaborationItemForFileURL:itemProvider:activityItem:service:managedFileURL:](SFCollaborationItemInspector, "_collaborationItemForFileURL:itemProvider:activityItem:service:managedFileURL:", v22, 0, v14, v15, v16);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (id)v24;
LABEL_12:

  if (v23)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __135__SFCollaborationItemInspector_inspectActivityItemValue_activityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke;
    v26[3] = &unk_1E482FCB8;
    v23 = v23;
    v27 = v23;
    +[SFCollaborationUtilities isShareOwnerOrAdminForCollaborationItem:service:completionHandler:](SFCollaborationUtilities, "isShareOwnerOrAdminForCollaborationItem:service:completionHandler:", v23, v15, v26);

  }
LABEL_15:

  return v23;
}

void __135__SFCollaborationItemInspector_inspectActivityItemValue_activityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke(uint64_t a1, int a2, unsigned int a3)
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2 | a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCanAddPeople:", v4);

}

+ (id)_collaborationItemForFileURL:(id)a3 itemProvider:(id)a4 activityItem:(id)a5 service:(id)a6 managedFileURL:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  const __CFString *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v28[4];
  id v29;
  __int128 *p_buf;
  uint8_t v31[4];
  id v32;
  __int16 v33;
  const __CFString *v34;
  __int128 buf;
  uint64_t v36;
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if ((objc_msgSend(v11, "isFileURL") & 1) != 0)
  {
    gelato_sharing_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_signpost_id_make_with_pointer(v16, v11);

    gelato_sharing_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A2830000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CollaborationItemForFileURL", ", (uint8_t *)&buf, 2u);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v36 = 0x2020000000;
    v37 = 1;
    if ((objc_msgSend(v11, "isiWorkDocument") & 1) == 0)
    {
      share_sheet_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v31 = 138412290;
        v32 = v11;
        _os_log_impl(&dword_1A2830000, v20, OS_LOG_TYPE_DEFAULT, "request default share mode for URL:%@", v31, 0xCu);
      }

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __110__SFCollaborationItemInspector__collaborationItemForFileURL_itemProvider_activityItem_service_managedFileURL___block_invoke;
        v28[3] = &unk_1E482FCE0;
        v29 = v11;
        p_buf = &buf;
        objc_msgSend(v14, "requestDefaultShareModeCollaborationForURL:completionHandler:", v29, v28);

      }
    }
    share_sheet_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      *(_DWORD *)v31 = 138412546;
      v32 = v11;
      v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_1A2830000, v21, OS_LOG_TYPE_DEFAULT, "defaultShareModeCollaboration for fileURL:%@ = %@", v31, 0x16u);
    }

    +[SFCollaborationItem collaborationItemForFileURL:itemProvider:activityItem:defaultCollaboration:managedFileURL:](SFCollaborationItem, "collaborationItemForFileURL:itemProvider:activityItem:defaultCollaboration:managedFileURL:", v11, v12, v13, *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24), v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    gelato_sharing_log();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)v31 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A2830000, v25, OS_SIGNPOST_INTERVAL_END, v17, "CollaborationItemForFileURL", ", v31, 2u);
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    share_sheet_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138477827;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1A2830000, v26, OS_LOG_TYPE_DEFAULT, "URL is not a fileURL: %{private}@", (uint8_t *)&buf, 0xCu);
    }

    v23 = 0;
  }

  return v23;
}

void __110__SFCollaborationItemInspector__collaborationItemForFileURL_itemProvider_activityItem_service_managedFileURL___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __110__SFCollaborationItemInspector__collaborationItemForFileURL_itemProvider_activityItem_service_managedFileURL___block_invoke_cold_1(a1, (uint64_t)v5, v6);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

+ (id)_collaborationItemFromItemProvider:(id)a3 forActivityItem:(id)a4 service:(id)a5 shouldInspectFiles:(BOOL)a6 managedFileURL:(id)a7 isURLProviderSupported:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  dispatch_semaphore_t v22;
  NSObject *v23;
  NSObject *v24;
  dispatch_time_t v25;
  intptr_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  _QWORD v33[4];
  NSObject *v34;
  uint8_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[8];
  uint8_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t v49[4];
  id v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v8 = a8;
  v10 = a6;
  v53 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  gelato_sharing_log();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_id_make_with_pointer(v17, v13);

  gelato_sharing_log();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "CollaborationItemForItemProvider", ", buf, 2u);
  }

  +[SFCollaborationItem collaborationItemForItemProvider:activityItem:isURLProviderSupported:](SFCollaborationItem, "collaborationItemForItemProvider:activityItem:isURLProviderSupported:", v13, v14, v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21 && v10)
  {
    *(_QWORD *)buf = 0;
    v44 = buf;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__2;
    v47 = __Block_byref_object_dispose__2;
    v48 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__2;
    v41 = __Block_byref_object_dispose__2;
    v42 = 0;
    v22 = dispatch_semaphore_create(0);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __148__SFCollaborationItemInspector__collaborationItemFromItemProvider_forActivityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke;
    v33[3] = &unk_1E482FD08;
    v35 = buf;
    v36 = &v37;
    v23 = v22;
    v34 = v23;
    objc_msgSend(v13, "loadFileURLRequiringOpenInPlace:completionHandler:", 1, v33);
    v24 = v23;
    v25 = dispatch_time(0, 2000000000);
    v26 = dispatch_semaphore_wait(v24, v25);

    if (v26)
      __148__SFCollaborationItemInspector__collaborationItemFromItemProvider_forActivityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke_2();
    v27 = *((_QWORD *)v44 + 5);
    if (v27)
    {
      +[SFCollaborationItemInspector _collaborationItemForFileURL:itemProvider:activityItem:service:managedFileURL:](SFCollaborationItemInspector, "_collaborationItemForFileURL:itemProvider:activityItem:service:managedFileURL:", v27, v13, v14, v15, v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      share_sheet_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v38[5];
        *(_DWORD *)v49 = 138412546;
        v50 = v13;
        v51 = 2112;
        v52 = v29;
        _os_log_impl(&dword_1A2830000, v28, OS_LOG_TYPE_DEFAULT, "Couldn't load in-place file URL for Collaboration Item Provider:%@ : %@", v49, 0x16u);
      }

      v21 = 0;
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(buf, 8);

  }
  gelato_sharing_log();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v18 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A2830000, v31, OS_SIGNPOST_INTERVAL_END, v18, "CollaborationItemForItemProvider", ", buf, 2u);
  }

  return v21;
}

void __148__SFCollaborationItemInspector__collaborationItemFromItemProvider_forActivityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v6 = a4;
  v11 = a2;
  if (objc_msgSend(v11, "isFileURL"))
    v7 = v11;
  else
    v7 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;
  v10 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __148__SFCollaborationItemInspector__collaborationItemFromItemProvider_forActivityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke_2()
{
  NSObject *v0;

  share_sheet_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __148__SFCollaborationItemInspector__collaborationItemFromItemProvider_forActivityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke_2_cold_1(v0);

}

void __110__SFCollaborationItemInspector__collaborationItemForFileURL_itemProvider_activityItem_service_managedFileURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1A2830000, log, OS_LOG_TYPE_ERROR, "Failed to request default share mode for fileURL:%@ error:%@", (uint8_t *)&v4, 0x16u);
}

void __148__SFCollaborationItemInspector__collaborationItemFromItemProvider_forActivityItem_service_shouldInspectFiles_managedFileURL_isURLProviderSupported___block_invoke_2_cold_1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = 0x4000000000000000;
  _os_log_error_impl(&dword_1A2830000, log, OS_LOG_TYPE_ERROR, "Could not load URL from the item provider for collaboration even after waiting for %.1f seconds.", (uint8_t *)&v1, 0xCu);
}

@end
