@implementation PXSharedLibraryCreateOrPublishLibraryScope

void __PXSharedLibraryCreateOrPublishLibraryScope_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int IsUserCanceledError;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  IsUserCanceledError = PXSharedLibraryIsUserCanceledError(v8);
  PLSharedLibraryGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (IsUserCanceledError)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v9;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "User canceled %{public}@", buf, 0xCu);
    }

    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v8);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v9;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Failed to %{public}@, error: %@", buf, 0x16u);
    }

    v23 = 0;
    v24 = 0;
    v14 = objc_msgSend(v7, "presentCustomInformationForError:customTitle:customMessage:", v8, &v24, &v23);
    v15 = v24;
    v16 = v23;
    if ((v14 & 1) == 0)
    {
      PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryCreateSharedLibraryFailureAlertTitle"));
      v17 = objc_claimAutoreleasedReturnValue();

      PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryGenericFailureAlertMessage"));
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (id)v17;
      v16 = (id)v18;
    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __PXSharedLibraryCreateOrPublishLibraryScope_block_invoke_396;
    v20[3] = &unk_1E5148CE0;
    v19 = *(void **)(a1 + 32);
    v22 = *(id *)(a1 + 40);
    v21 = v8;
    PXPresentFailureWithLocalizedTitle(v15, v16, 0, v21, v19, v20);

  }
}

void __PXSharedLibraryCreateOrPublishLibraryScope_block_invoke_398(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    PLSharedLibraryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v8;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Did publish Shared Library preview: %{public}@", buf, 0xCu);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Create Preview"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 40), "autoSharePolicy"))
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "sharedLibraryRule");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "assetLocalIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if ((objc_msgSend(v5, "isInPreview") & 1) == 0
        && objc_msgSend(v9, "count")
        && (objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __PXSharedLibraryCreateOrPublishLibraryScope_block_invoke_401;
        v16[3] = &unk_1E5148348;
        v18 = *(id *)(a1 + 64);
        v17 = v5;
        objc_msgSend(v17, "moveAssetsWithLocalIdentifiersToSharedLibrary:completion:", v9, v16);

        goto LABEL_15;
      }
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    }
    v10();
LABEL_15:

    goto LABEL_16;
  }
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("publish Shared Library preview: "), "stringByAppendingString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, void *))(v11 + 16))(v11, v12, v6, v14);

LABEL_16:
}

void __PXSharedLibraryCreateOrPublishLibraryScope_block_invoke_405(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLSharedLibraryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v5;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "Did create and publish Shared Library: %{public}@", buf, 0xCu);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "autoSharePolicy"))
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "sharedLibraryRule");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "assetLocalIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v6, "count"))
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __PXSharedLibraryCreateOrPublishLibraryScope_block_invoke_406;
      v8[3] = &unk_1E5148348;
      v10 = *(id *)(a1 + 48);
      v9 = v3;
      objc_msgSend(v9, "moveAssetsWithLocalIdentifiersToSharedLibrary:completion:", v6, v8);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __PXSharedLibraryCreateOrPublishLibraryScope_block_invoke_406(uint64_t a1, int a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
}

uint64_t __PXSharedLibraryCreateOrPublishLibraryScope_block_invoke_401(uint64_t a1, int a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
}

uint64_t __PXSharedLibraryCreateOrPublishLibraryScope_block_invoke_396(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

@end
