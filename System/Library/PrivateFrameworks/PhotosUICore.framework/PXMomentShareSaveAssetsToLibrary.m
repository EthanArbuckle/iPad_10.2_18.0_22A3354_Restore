@implementation PXMomentShareSaveAssetsToLibrary

void __PXMomentShareSaveAssetsToLibrary_block_invoke_176(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  int v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _QWORD block[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  _QWORD v42[4];

  v42[1] = *MEMORY[0x1E0C80C00];
  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);
  v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MomentShareSaveAssetsToLibrary", ", buf, 2u);
  }

  if (*(_BYTE *)(a1 + 64))
  {
    PXMap();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d || %K == %d"), CFSTR("additionalAttributes.destinationAssetCopyState"), 0, CFSTR("additionalAttributes.destinationAssetCopyState"), -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInternalPredicate:", v9);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSortDescriptors:", v11);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithObjectIDs:options:", v6, v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = *(id *)(a1 + 32);
  }
  if (objc_msgSend(v12, "count"))
  {
    v13 = *(void **)(a1 + 40);
    v14 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __PXMomentShareSaveAssetsToLibrary_block_invoke_2;
    v33[3] = &unk_1E5148D08;
    v15 = v12;
    v34 = v15;
    v35 = *(id *)(a1 + 48);
    v32 = 0;
    v16 = objc_msgSend(v13, "performChangesAndWait:error:", v33, &v32);
    v17 = v32;
    v18 = v5;
    v19 = v18;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v19, OS_SIGNPOST_INTERVAL_END, v3, "MomentShareSaveAssetsToLibrary", ", buf, 2u);
    }

    PLSharingGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v16)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_msgSend(v15, "count");
        v23 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        v39 = v22;
        v40 = 2112;
        v41 = v23;
        _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_DEFAULT, "PXMomentShareSaveAssetsToLibrary: Did save %lu assets to photo library: %@", buf, 0x16u);
      }

      v24 = (void *)MEMORY[0x1E0D09910];
      v36 = *MEMORY[0x1E0D09830];
      v37 = CFSTR("PXMomentShareAddAssetsToLibrary");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.cmmAddAssetToLibrary"), v21);
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = (uint64_t)v17;
      _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "PXMomentShareSaveAssetsToLibrary: Failed to save assets to photo library: %@", buf, 0xCu);
    }

    v27 = *(void **)(a1 + 56);
    if (v27)
    {
      v30[0] = v14;
      v30[1] = 3221225472;
      v30[2] = __PXMomentShareSaveAssetsToLibrary_block_invoke_188;
      v30[3] = &unk_1E5148A40;
      v31 = v27;
      dispatch_async(MEMORY[0x1E0C80D38], v30);

    }
    goto LABEL_24;
  }
  PLSharingGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_DEFAULT, "PXMomentShareSaveAssetsToLibrary: Re-fetch returned no assets", buf, 2u);
  }

  v26 = *(void **)(a1 + 56);
  if (v26)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __PXMomentShareSaveAssetsToLibrary_block_invoke_189;
    block[3] = &unk_1E5148A40;
    v29 = v26;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v17 = v29;
LABEL_24:

  }
}

void __PXMomentShareSaveAssetsToLibrary_block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CD13F8]);
  objc_msgSend(v2, "setShouldDownloadOrCloudReReferenceMissingResources:", 1);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAssetCopyFromAsset:options:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7), v2, (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (*(_QWORD *)(a1 + 40))
        {
          objc_msgSend(v8, "setImportSessionID:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "UUIDString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setImportSessionID:", v11);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

uint64_t __PXMomentShareSaveAssetsToLibrary_block_invoke_188(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __PXMomentShareSaveAssetsToLibrary_block_invoke_189(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __PXMomentShareSaveAssetsToLibrary_block_invoke_177(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

void __PXMomentShareSaveAssetsToLibrary_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.photos.PXMomentShareUtilitiesQueue", attr);
  v2 = (void *)PXMomentShareSaveAssetsToLibrary_serialQueue;
  PXMomentShareSaveAssetsToLibrary_serialQueue = (uint64_t)v1;

}

@end
