@implementation PXItemProviderFromAsset

id __PXItemProviderFromAsset_block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0CD1418]);
  objc_msgSend(v4, "setTreatLivePhotoAsStill:", 0);
  objc_msgSend(a1[4], "objectForKeyedSubscript:", &unk_1E53EB580);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 2;
  else
    v6 = 1;
  objc_msgSend(v4, "setVariant:", v6);

  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __PXItemProviderFromAsset_block_invoke_186;
  v14 = &unk_1E511A4C8;
  v7 = a1[5];
  v15 = a1[6];
  v16 = v3;
  v8 = v3;
  objc_msgSend(v7, "exportWithOptions:completionHandler:", v4, &v11);
  objc_msgSend(a1[5], "progress", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __PXItemProviderFromAsset_block_invoke_192(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "registeredTypeIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if ((v9 & 1) == 0)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __PXItemProviderFromAsset_block_invoke_2_193;
      v13[3] = &unk_1E511A518;
      v14 = *(id *)(a1 + 40);
      v10 = v6;
      v12 = *(void **)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 56);
      v15 = v10;
      v17 = v11;
      v16 = v12;
      objc_msgSend(v5, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v7, 0, 0, v13);

    }
  }

}

id __PXItemProviderFromAsset_block_invoke_2_193(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CD1410], "exportRequestForAsset:error:", *(_QWORD *)(a1 + 32), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CD1418]);
  objc_msgSend(v5, "setTreatLivePhotoAsStill:", 1);
  objc_msgSend(v5, "setFlattenSlomoVideos:", 1);
  objc_msgSend(v5, "setVariant:", objc_msgSend(*(id *)(a1 + 40), "PHAssetExportRequestVariantValue"));
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __PXItemProviderFromAsset_block_invoke_3;
  v13 = &unk_1E5146330;
  v6 = *(_QWORD *)(a1 + 56);
  v14 = v3;
  v15 = v6;
  v7 = v3;
  objc_msgSend(v4, "exportWithOptions:completionHandler:", v5, &v10);
  objc_msgSend(*(id *)(a1 + 48), "progress", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __PXItemProviderFromAsset_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if ((unint64_t)(v7 - 1) < 3)
  {
    v8 = (_QWORD *)MEMORY[0x1E0CD18B0];
LABEL_5:
    objc_msgSend(v5, "objectForKeyedSubscript:", *v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_15;
    goto LABEL_12;
  }
  if ((unint64_t)(v7 - 4) < 2)
  {
    v8 = (_QWORD *)MEMORY[0x1E0CD18B8];
    goto LABEL_5;
  }
  if (!v7)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Trying to drag unsupported playback style", (uint8_t *)&v12, 2u);
    }

  }
  v9 = 0;
  if (v6)
  {
LABEL_12:
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Export request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

  }
LABEL_15:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __PXItemProviderFromAsset_block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0CD18B0];
  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD18B8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = *(void **)(a1 + 32);
    v12 = v8;
    objc_msgSend(v11, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pathManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    _PXItemProviderTemporaryURL(v12, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v14;
    _PXItemProviderTemporaryURL(v9, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v5;
    v36 = v12;
    v18 = objc_msgSend(v17, "copyItemAtURL:toURL:error:", v12, v8, &v43);
    v19 = v43;

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v19;
      v21 = objc_msgSend(v20, "copyItemAtURL:toURL:error:", v9, v16, &v42);
      v5 = v42;

      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByAppendingPathExtension:", *MEMORY[0x1E0D75488]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x1E0C99E98];
        v25 = v15;
        objc_msgSend(v15, "temporaryDragAndDropDirectoryCreateIfNeeded:error:", 1, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fileURLWithPath:isDirectory:", v26, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "URLByAppendingPathComponent:", v34);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_alloc(MEMORY[0x1E0CD1610]);
        v46[0] = v8;
        v46[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v28, "initWithResourceFileURLs:", v29);

        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __PXItemProviderFromAsset_block_invoke_2;
        v37[3] = &unk_1E511A4A0;
        v41 = *(id *)(a1 + 40);
        v38 = v8;
        v39 = v16;
        v40 = v27;
        v31 = v27;
        v32 = (id)objc_msgSend(v30, "writeToFileURL:options:completionHandler:", v31, 0, v37);

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      v5 = v19;
    }
    v25 = v15;
    PLUIGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v5;
      _os_log_impl(&dword_1A6789000, v33, OS_LOG_TYPE_ERROR, "Resource cloning failed with error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_14;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v16 = v9;
LABEL_15:

}

void __PXItemProviderFromAsset_block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1CA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Live Photo export session failed with error: %@", buf, 0xCu);
    }

  }
  v6 = a1[7];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD, void *))(v6 + 16))(v6, v7, 0, v4);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a1[4];
  v20 = 0;
  objc_msgSend(v8, "removeItemAtURL:error:", v9, &v20);
  v10 = v20;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a1[5];
  v19 = v10;
  objc_msgSend(v11, "removeItemAtURL:error:", v12, &v19);
  v13 = v19;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = a1[6];
  v18 = v13;
  objc_msgSend(v14, "removeItemAtURL:error:", v15, &v18);
  v16 = v18;

  if (v16)
  {
    PLUIGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Error cleaning up resources: %@", buf, 0xCu);
    }

  }
}

@end
