@implementation PXSharedLibraryFetchLegacyDevices

void __PXSharedLibraryFetchLegacyDevices_block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void (**v9)(void *, void *, _QWORD);
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD aBlock[4];
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __PXSharedLibraryFetchLegacyDevices_block_invoke_2;
  aBlock[3] = &unk_1E5115C50;
  v26 = *(id *)(a1 + 32);
  v9 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  if (v6)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PXSharedLibraryFetchLegacyDevices(void (^__strong _Nonnull)(NSArray<PXSharedLibraryLegacyDevice *> *__strong, NSError * _Nullable __strong))_block_invoke");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "px_descriptionForAssertionMessage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXSharedLibraryLegacyDevicesUtilities.m"), 333, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("response"), v21, v22);

    }
    objc_msgSend(v11, "devices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PLSharedLibraryGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134217984;
      v28 = v14;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevice: Fetched %lu candidate devices", buf, 0xCu);
    }

    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __PXSharedLibraryFetchLegacyDevices_block_invoke_67;
    v23[3] = &unk_1E5115C78;
    v24 = v10;
    v15 = v10;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v23);
    objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_1317);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v16, 0);

  }
  else
  {
    PLSharedLibraryGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = (uint64_t)v7;
      _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "PXSharedLibraryLegacyDevice: Failed to fetch devices: %@", buf, 0xCu);
    }

    ((void (**)(void *, void *, id))v9)[2](v9, 0, v7);
  }

}

void __PXSharedLibraryFetchLegacyDevices_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  dispatch_time_t v10;
  id *v11;
  id v12;
  id *v13;
  id *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "simulateSlowLegacyDevicesFetchInFallback");

  if (v8)
  {
    PLSharedLibraryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevice: [DEBUG] Simulating slow fetch - delaying completion by 10s", buf, 2u);
    }

    v10 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __PXSharedLibraryFetchLegacyDevices_block_invoke_55;
    block[3] = &unk_1E5145688;
    v11 = &v27;
    v12 = *(id *)(a1 + 32);
    v26 = v6;
    v27 = v12;
    v13 = &v25;
    v14 = &v26;
    v25 = v5;
    v15 = v6;
    v16 = v5;
    dispatch_after(v10, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __PXSharedLibraryFetchLegacyDevices_block_invoke_2_57;
    v20[3] = &unk_1E5145688;
    v11 = &v23;
    v17 = *(id *)(a1 + 32);
    v22 = v6;
    v23 = v17;
    v13 = &v21;
    v14 = &v22;
    v21 = v5;
    v18 = v6;
    v19 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v20);
  }

}

void __PXSharedLibraryFetchLegacyDevices_block_invoke_67(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  __CFString *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  PXSharedLibraryLegacyDevice *v38;
  const __CFString *v39;
  PXSharedLibraryLegacyDevice *v40;
  __CFString *v41;
  __CFString *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  __CFString *v46;
  __CFString *v47;
  unint64_t v48;
  id v50;
  __int128 v51;
  uint64_t v52;
  _BYTE buf[24];
  __CFString *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  NSObject *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  _BOOL4 v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "name");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "swVersion");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[__CFString length](v3, "length");
  v7 = CFSTR("-");
  if (v6)
    v7 = v3;
  v8 = v7;
  v9 = _DeviceFamilyForProductType(v4);
  if (v9)
  {
    v10 = v9;
    v11 = qword_1A7C08ED8[v9 - 1];
    v51 = 0uLL;
    v52 = 0;
    if ((PXSharedLibraryVersionForSpecifier(v5, (uint64_t *)&v51) & 1) == 0)
    {
      PLSharedLibraryGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v25 = objc_opt_class();
        PXSharedLibraryLegacyDeviceOperatingSystemDescription(v11);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v2;
        *(_WORD *)&buf[22] = 2112;
        v54 = v8;
        v55 = 2114;
        v56 = (uint64_t)v4;
        v57 = 2114;
        v58 = v5;
        v59 = 2114;
        v60 = v26;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "PXSharedLibraryLegacyDevice: Skipping candidate device with unknown os version: <%@:%p, name: \"%@\", model: \"%{public}@\", swVersion: \"%{public}@\", os: %{public}@>", buf, 0x3Eu);

      }
      goto LABEL_40;
    }
    *(_OWORD *)buf = v51;
    *(_QWORD *)&buf[16] = v52;
    v48 = v11;
    if (!PXSharedLibraryIsLegacyDevice(v11, buf))
    {
      +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "includeNonLegacyDevicesInFallback");

      PLSharedLibraryGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (!v13)
      {
        if (v15)
        {
          v28 = objc_opt_class();
          PXSharedLibraryLegacyDeviceOperatingSystemDescription(v48);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu.%lu.%lu"), v51, v52);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413826;
          *(_QWORD *)&buf[4] = v28;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v2;
          *(_WORD *)&buf[22] = 2112;
          v54 = v8;
          v55 = 2114;
          v56 = (uint64_t)v4;
          v57 = 2114;
          v58 = v5;
          v59 = 2114;
          v60 = v29;
          v61 = 2114;
          v62 = v30;
          _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevice: Skipping supported device: <%@:%p, name: \"%@\", model: \"%{public}@\", swVersion: \"%{public}@\", os: %{public}@, version: %{public}@>", buf, 0x48u);

        }
        goto LABEL_40;
      }
      if (v15)
      {
        v16 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v2;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevice: [DEBUG] Including supported device: <%@:%p>", buf, 0x16u);
      }

    }
    objc_msgSend(v2, "modelSmallPhotoURL1x");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "modelSmallPhotoURL2x");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "modelSmallPhotoURL3x");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v18)
      v20 = v18;
    else
      v20 = (uint64_t)v17;
    v45 = v19;
    if (v19)
      v21 = v19;
    else
      v21 = v20;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v46 = (__CFString *)v22;
    v47 = v8;
    v44 = (void *)v18;
    if (!v22)
    {
      PLSharedLibraryGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v27 = objc_opt_class();
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v2;
        *(_WORD *)&buf[22] = 2114;
        v54 = v17;
        v55 = 2114;
        v56 = v18;
        v57 = 2114;
        v58 = v45;
        _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "PXSharedLibraryLegacyDevice: No icon URL for legacy device: <%@:%p>, 1x:\"%{public}@\", 2x:\"%{public}@\", 3x:\"%{public}@\", buf, 0x34u);
      }
      v14 = 0;
      goto LABEL_34;
    }
    v50 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v22, 0, &v50);
    v14 = objc_claimAutoreleasedReturnValue();
    v23 = v50;
    if (v14)
    {
      if (-[NSObject length](v14, "length"))
      {
LABEL_34:

        PLSharedLibraryGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v43 = v5;
          v34 = v17;
          v35 = objc_opt_class();
          PXSharedLibraryLegacyDeviceOperatingSystemDescription(v48);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu.%lu.%lu"), v51, v52);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138414082;
          *(_QWORD *)&buf[4] = v35;
          v17 = v34;
          v5 = v43;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v2;
          *(_WORD *)&buf[22] = 2112;
          v54 = v47;
          v55 = 2114;
          v56 = (uint64_t)v4;
          v57 = 2114;
          v58 = v43;
          v59 = 2114;
          v60 = v36;
          v61 = 2114;
          v62 = v37;
          v63 = 1024;
          v64 = v10 != 10;
          _os_log_impl(&dword_1A6789000, v33, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevice: Found legacy device: <%@:%p, name: \"%@\", model: \"%{public}@\", swVersion: \"%{public}@\", os: %{public}@, version: %{public}@, upgradeable: %d>", buf, 0x4Eu);

        }
        v38 = [PXSharedLibraryLegacyDevice alloc];
        if (v3)
          v39 = v3;
        else
          v39 = &stru_1E5149688;
        v40 = -[PXSharedLibraryLegacyDevice initWithName:iconData:operatingSystem:upgradeable:](v38, "initWithName:iconData:operatingSystem:upgradeable:", v39, v14, v48, v10 != 10);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v40);

        v8 = v47;
LABEL_40:

        goto LABEL_41;
      }
      v41 = v17;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[NSObject length](v14, "length"));
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = v17;
      v42 = CFSTR("-");
    }
    PLSharedLibraryGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = objc_opt_class();
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v32;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v2;
      *(_WORD *)&buf[22] = 2114;
      v54 = v46;
      v55 = 2114;
      v56 = (uint64_t)v42;
      v57 = 2112;
      v58 = v23;
      _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "PXSharedLibraryLegacyDevice: No icon for legacy device: <%@:%p>, url: \"%{public}@\", data: \"%{public}@\", error: %@", buf, 0x34u);
    }

    v17 = v41;
    goto LABEL_34;
  }
  PLSharedLibraryGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v2;
    *(_WORD *)&buf[22] = 2112;
    v54 = v8;
    v55 = 2114;
    v56 = (uint64_t)v4;
    v57 = 2114;
    v58 = v5;
    _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevice: Skipping candidate device with unknown or ignored device family: <%@:%p, name: \"%@\", model: \"%{public}@\", swVersion: \"%{public}@\">", buf, 0x34u);
  }

LABEL_41:
}

uint64_t __PXSharedLibraryFetchLegacyDevices_block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

uint64_t __PXSharedLibraryFetchLegacyDevices_block_invoke_55(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __PXSharedLibraryFetchLegacyDevices_block_invoke_2_57(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end
