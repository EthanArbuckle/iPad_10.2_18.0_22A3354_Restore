@implementation PXSharedLibraryCreatePreview

void __PXSharedLibraryCreatePreview_block_invoke(void **a1, int a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (a2 && (objc_msgSend(a1[4], "isCancelled", v5) & 1) == 0)
    _PXSharedLibraryCreatePreview(a1[5], a1[4], a1[6], a1[7]);
  else
    (*((void (**)(void))a1[7] + 2))();

}

void ___PXSharedLibraryCreatePreview_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void (*v12)(void);
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    PLSharedLibraryGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Failed to create Shared Library preview: %@", buf, 0xCu);
    }

    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryCreateSharedLibraryPreviewFailureAlertTitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryGenericFailureAlertMessage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = ___PXSharedLibraryCreatePreview_block_invoke_518;
    v19[3] = &unk_1E5148CE0;
    v15 = *(void **)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    v20 = v6;
    PXPresentFailureWithLocalizedTitle(v11, v14, 0, v20, v15, v19);

    goto LABEL_16;
  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  PLSharedLibraryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      objc_msgSend(v5, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v16;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Did create Shared Library preview: %{public}@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "sharedLibraryRule");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "assetLocalIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(*(id *)(a1 + 40), "autoSharePolicy") && objc_msgSend(v11, "count"))
    {
      objc_msgSend(v5, "moveAssetsWithLocalIdentifiersToSharedLibrary:completion:", v11, *(_QWORD *)(a1 + 56));
      goto LABEL_16;
    }
    v18 = *(_QWORD *)(a1 + 56);
    if (!v18)
    {
LABEL_16:

      goto LABEL_17;
    }
    v12 = *(void (**)(void))(v18 + 16);
LABEL_15:
    v12();
    goto LABEL_16;
  }
  if (v9)
  {
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v10;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "User canceled creation of Shared Library preview: %{public}@", buf, 0xCu);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Create Preview"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_15;
  }
LABEL_17:

}

uint64_t ___PXSharedLibraryCreatePreview_block_invoke_518(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

@end
