@implementation PLPTPUtilities

+ (id)pathForSidecar:(id)a3 onAsset:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(a4, "pathForOriginalFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v6 && v7 && v9)
  {
    objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (void)enumerateAvailableSidecarFilesOnAsset:(id)a3 usingBlock:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB3620];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "enumerateAvailableSidecarFilesOnAsset:withFileManager:usingBlock:", v8, v9, v7);

}

+ (void)enumerateAvailableSidecarFilesOnAsset:(id)a3 withFileManager:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, void *, char *);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, void *, char *))a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v8, "ptpSidecarFiles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(a1, "pathForSidecar:onAsset:", v16, v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          if (objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v17, 0))
          {
            v18 = 0;
            v10[2](v10, v16, v17, &v18);
            if (v18)
            {

              goto LABEL_13;
            }
          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_13:

}

+ (BOOL)shouldExpungeAsset:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3620];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "shouldExpungeAsset:withFileManager:", v5, v6);

  return (char)a1;
}

+ (BOOL)shouldExpungeAsset:(id)a3 withFileManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  int v15;
  NSObject *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  int v22;
  NSObject *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  NSObject *v28;
  __CFString *v29;
  __CFString *v30;
  _BOOL4 v31;
  NSObject *v32;
  __CFString *v33;
  __CFString *v34;
  _QWORD v36[5];
  uint8_t v37[4];
  __CFString *v38;
  _BYTE buf[24];
  char v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "ptpAdditionalAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ptpTrashedState");

  PLPTPGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Asset %@ trashed state: 0x%llx", buf, 0x16u);

  }
  PLPTPGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = CFSTR("NO");
    if ((v8 & 1) != 0)
      v12 = CFSTR("YES");
    v13 = v12;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v13;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "isOriginalTrashed: %@", buf, 0xCu);

  }
  objc_msgSend(v5, "pathForFullsizeRenderImageFile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v14, 0);
  PLPTPGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if (v15)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    v18 = v17;
    if ((v8 & 4) != 0)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    v20 = v19;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v20;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "hasAdjustedImage: %@, isAdjustedImageTrashed: %@", buf, 0x16u);

  }
  objc_msgSend(v5, "pathForFullsizeRenderVideoFile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v21, 0);
  PLPTPGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = CFSTR("NO");
    if (v22)
      v24 = CFSTR("YES");
    v25 = v24;
    v26 = CFSTR("NO");
    if ((v8 & 8) != 0)
      v26 = CFSTR("YES");
    v27 = v26;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v27;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "hasAdjustedVideo: %@, isAdjustedVideoTrashed: %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v40 = 1;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __53__PLPTPUtilities_shouldExpungeAsset_withFileManager___block_invoke;
  v36[3] = &unk_1E3673D00;
  v36[4] = buf;
  +[PLPTPUtilities enumerateAvailableSidecarFilesOnAsset:withFileManager:usingBlock:](PLPTPUtilities, "enumerateAvailableSidecarFilesOnAsset:withFileManager:usingBlock:", v5, v6, v36);
  PLPTPGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      v29 = CFSTR("YES");
    else
      v29 = CFSTR("NO");
    v30 = v29;
    *(_DWORD *)v37 = 138412290;
    v38 = v30;
    _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "areAllAvailableSidecarsTrashed: %@", v37, 0xCu);

  }
  v31 = 0;
  if ((v8 & 1 & (v15 ^ 1 | (v8 >> 2) & 1)) == 1 && v22 ^ 1 | (v8 >> 3) & 1)
    v31 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  PLPTPGetLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    v33 = CFSTR("NO");
    if (v31)
      v33 = CFSTR("YES");
    v34 = v33;
    *(_DWORD *)v37 = 138412290;
    v38 = v34;
    _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEBUG, "shouldExpunge: %@", v37, 0xCu);

  }
  _Block_object_dispose(buf, 8);

  return v31;
}

void __53__PLPTPUtilities_shouldExpungeAsset_withFileManager___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  PLPTPGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2048;
    v12 = objc_msgSend(v6, "ptpTrashedState");
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Sidecar %@ trashed state: 0x%llx", (uint8_t *)&v9, 0x16u);

  }
  if (objc_msgSend(v6, "resourceType") != 5 && objc_msgSend(v6, "ptpTrashedState") != 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

@end
