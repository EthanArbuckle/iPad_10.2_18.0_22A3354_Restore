@implementation RefetchLibraryScope

void ___RefetchLibraryScope_block_invoke_473(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CD15E0];
  v21[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchLibraryScopesWithLocalIdentifiers:options:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLSharedLibraryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "localIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Did refetch library scope with identifier: %{public}@", buf, 0xCu);

    }
    v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Failed to refetch library scope with identifier: %{public}@", buf, 0xCu);

    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, 0, CFSTR("Failed to refetch library scope with identifier: %@"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v14 = *(void **)(a1 + 48);
  if (v14)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___RefetchLibraryScope_block_invoke_476;
    block[3] = &unk_1E5145688;
    v18 = v14;
    v16 = v7;
    v17 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t ___RefetchLibraryScope_block_invoke_476(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void ___RefetchLibraryScope_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("PXSharedLibraryPhotoKitUtilitiesRefetchQueue", v0);
  v2 = (void *)_RefetchLibraryScope__refetchQueue;
  _RefetchLibraryScope__refetchQueue = (uint64_t)v1;

}

@end
