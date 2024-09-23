@implementation NSItemProvider

id __99__NSItemProvider_UIKitAdditions__registerFileProviderItemForTypeIdentifier_visibility_loadHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__NSItemProvider_UIKitAdditions__registerFileProviderItemForTypeIdentifier_visibility_loadHandler___block_invoke_2;
  v10[3] = &unk_1E16D9850;
  v11 = v4;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v4;
  v6(v5, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __99__NSItemProvider_UIKitAdditions__registerFileProviderItemForTypeIdentifier_visibility_loadHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (!v9 || a3)
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB36D0], "resultWithError:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v5);
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0E0]), "initWithFPItem:", v9);
    objc_msgSend(v5, "nsURLWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D0], "resultWithData:urlWrapper:cleanupHandler:error:", 0, v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t __66__NSItemProvider_UIKitAdditions___highestFidelityClassForLoading___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __80__NSItemProvider_UIKitAdditions___loadObjectOfClass_userInfo_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  v9 = v6;
  if (v5 && !v6)
  {
    v10 = *(void **)(a1 + 32);
    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 64);
      v12 = *(_QWORD *)(a1 + 40);
      v19 = 0;
      v13 = (id *)&v19;
      v14 = objc_msgSend(v10, "newObjectOfClass:fromData:ofType:outError:", v11, v5, v12, &v19);
    }
    else
    {
      if (!*(_BYTE *)(a1 + 72))
      {
        v8 = 0;
        v9 = 0;
        goto LABEL_8;
      }
      v15 = *(void **)(a1 + 64);
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      v18 = 0;
      v13 = (id *)&v18;
      objc_msgSend(v15, "_objectWithItemProviderData:typeIdentifier:userInfo:error:", v5, v16, v17, &v18);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v14;
    v9 = *v13;
  }
LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __78__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationIfPossible__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", a2, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC618]))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

id __112__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationForOpenInPlaceWithTypeIdentifier_visibility___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __112__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationForOpenInPlaceWithTypeIdentifier_visibility___block_invoke_2;
    v8[3] = &unk_1E16D9910;
    v9 = v5;
    v10 = WeakRetained;
    v11 = v3;
    objc_msgSend(WeakRetained, "loadInPlaceFileRepresentationForTypeIdentifier:completionHandler:", v9, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
    v6 = 0;
  }

  return v6;
}

void __112__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationForOpenInPlaceWithTypeIdentifier_visibility___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void (*v14)(uint64_t, _QWORD, id);
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (v7)
  {
    if ((a3 & 1) != 0)
    {
      v9 = v7;
      objc_msgSend((id)*MEMORY[0x1E0CEC4E0], "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __112__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationForOpenInPlaceWithTypeIdentifier_visibility___block_invoke_103;
      v18[3] = &unk_1E16C4458;
      v19 = v9;
      v20 = *(id *)(a1 + 48);
      v11 = v9;
      v12 = (id)objc_msgSend(v11, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v10, v18);

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v17 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v22 = v17;
        _os_log_error_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not load item provider file representation for type “%{public}@” in place. Falling back to copying.", buf, 0xCu);
      }
      -[NSItemProvider _generateFileURLDataForCachingFileAtURL:typeIdentifier:completionHandler:](*(_QWORD *)(a1 + 40), v7, *(void **)(a1 + 32), *(void **)(a1 + 48));
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not load item provider file representation for type “%{public}@”. Error: %{public}@", buf, 0x16u);
    }
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(void (**)(uint64_t, _QWORD, id))(v13 + 16);
    v15 = v8;
    v14(v13, 0, v15);

  }
}

- (void)_generateFileURLDataForCachingFileAtURL:(void *)a3 typeIdentifier:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  _QWORD *v38;
  _BYTE *v39;
  _QWORD v40[4];
  id v41;
  _QWORD *v42;
  uint64_t *v43;
  _QWORD block[5];
  id v45;
  _QWORD *v46;
  uint64_t *v47;
  _QWORD v48[5];
  id v49;
  uint64_t v50;
  id *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _BYTE buf[24];
  void *(*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if (qword_1ECD7F4C0 != -1)
      dispatch_once(&qword_1ECD7F4C0, &__block_literal_global_107_0);
    v50 = 0;
    v51 = (id *)&v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__143;
    v54 = __Block_byref_object_dispose__143;
    v55 = 0;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x3032000000;
    v48[3] = __Block_byref_object_copy__143;
    v48[4] = __Block_byref_object_dispose__143;
    v49 = 0;
    v10 = qword_1ECD7F4B0;
    v11 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_111;
    block[3] = &unk_1E16D9968;
    v46 = v48;
    block[4] = a1;
    v12 = v8;
    v45 = v12;
    v47 = &v50;
    dispatch_sync(v10, block);
    v13 = v51[5];
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v13;
        _os_log_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Returning cached url for sharing: %@", buf, 0xCu);
      }
    }
    else if (v7)
    {
      _UITemporaryFolderURL((uint64_t)CFSTR("com.apple.uikit.itemprovider.temporary"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v7, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URLByAppendingPathComponent:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 && !_UICloneFile(v7, v16))
        {
          objc_storeStrong(v51 + 5, v16);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v14;
            _os_log_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Caching temporary files for sharing at %@", buf, 0xCu);
          }
          v18 = qword_1ECD7F4B0;
          v40[0] = v11;
          v40[1] = 3221225472;
          v40[2] = __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_116;
          v40[3] = &unk_1E16D9990;
          v42 = v48;
          v43 = &v50;
          v41 = v12;
          dispatch_sync(v18, v40);
          dispatch_get_global_queue(9, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v57 = __Block_byref_object_copy__117;
          v58 = __Block_byref_object_dispose__118;
          v59 = 0;
          aBlock[0] = v11;
          aBlock[1] = 3221225472;
          aBlock[2] = __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_119;
          aBlock[3] = &unk_1E16D99E0;
          v38 = v48;
          v39 = buf;
          v36 = v19;
          v37 = v14;
          v20 = v19;
          v21 = _Block_copy(aBlock);
          v22 = _Block_copy(v21);
          v23 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v22;

          v24 = dispatch_time(0, (uint64_t)(*(double *)&qword_1ECD7F4B8 * 1000000000.0));
          dispatch_after(v24, v20, v21);

          _Block_object_dispose(buf, 8);
          v17 = v41;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeItemAtURL:error:", v14, 0);
        }

      }
    }
    v25 = v51[5];
    if (v25)
    {
      v34 = 0;
      v26 = (id)objc_msgSend(v25, "ui_issueReadSandboxExtensionWithError:", &v34);
      v27 = v34;
      if (v27 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v31 = v51[5];
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v27;
        _os_log_error_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot issue sandbox extension to temporary file at %@ Error: %@. Sharing anwyay.", buf, 0x16u);
      }
      v28 = v51[5];
      objc_msgSend((id)*MEMORY[0x1E0CEC4E0], "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v11;
      v32[1] = 3221225472;
      v32[2] = __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_121;
      v32[3] = &unk_1E16D9A08;
      v33 = v9;
      v30 = (id)objc_msgSend(v28, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v29, v32);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    }

    _Block_object_dispose(v48, 8);
    _Block_object_dispose(&v50, 8);

  }
}

void __112__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationForOpenInPlaceWithTypeIdentifier_visibility___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  LODWORD(v5) = objc_msgSend(v5, "startAccessingSecurityScopedResource");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
}

void __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("UIKit file url representation cache queue", v0);
  v2 = (void *)qword_1ECD7F4B0;
  qword_1ECD7F4B0 = (uint64_t)v1;

  _UIKitUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("TemporaryFileURLCacheDeletionTimeInterval"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v8;
  v5 = 0x4072C00000000000;
  if (v8)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v8;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      v4 = v8;
      v5 = v7;
    }
  }
  qword_1ECD7F4B8 = v5;

}

void __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_111(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  objc_getAssociatedObject(*(id *)(a1 + 32), &_generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___cacheStateKey);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v5)
  {
    v6 = objc_opt_new();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_setAssociatedObject(*(id *)(a1 + 32), &_generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___cacheStateKey, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), (void *)0x301);
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  objc_msgSend(v5, "typeIdentifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "url");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", *(double *)&qword_1ECD7F4B8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setExpirationDate:", v12);

  }
}

uint64_t __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_116(_QWORD *a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setUrl:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setTypeIdentifier:", a1[4]);
}

void __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_119(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[4];
  id v5;
  id v6;
  __int128 v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v2 = qword_1ECD7F4B0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_1E16D99B8;
  v7 = *(_OWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v8 = &v9;
  v6 = *(id *)(a1 + 40);
  dispatch_sync(v2, block);
  if (*((_BYTE *)v10 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);

  }
  _Block_object_dispose(&v9, 8);
}

void __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  dispatch_time_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "timeIntervalSinceNow");
    if (v4 > 0.0)
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
        dispatch_after(v5, *(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Deleting temporary files for sharing at %@", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setUrl:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setTypeIdentifier:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setExpirationDate:", 0);
  }

}

uint64_t __116__NSItemProvider_UIKitAdditions_Internal___generateFileURLDataForCachingFileAtURL_typeIdentifier_completionHandler___block_invoke_121(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __131__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationByCopyingAndCachingRepresentationWithTypeIdentifier_visibility___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __131__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationByCopyingAndCachingRepresentationWithTypeIdentifier_visibility___block_invoke_2;
    v9[3] = &unk_1E16D9A30;
    v9[4] = WeakRetained;
    v10 = v6;
    v11 = v3;
    objc_msgSend(v5, "loadFileRepresentationForTypeIdentifier:completionHandler:", v10, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
    v7 = 0;
  }

  return v7;
}

void __131__NSItemProvider_UIKitAdditions_Internal___addFileURLRepresentationByCopyingAndCachingRepresentationWithTypeIdentifier_visibility___block_invoke_2(uint64_t a1, void *a2)
{
  -[NSItemProvider _generateFileURLDataForCachingFileAtURL:typeIdentifier:completionHandler:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
}

@end
