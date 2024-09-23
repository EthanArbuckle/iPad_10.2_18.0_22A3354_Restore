@implementation PLShouldShowSharedLibrarySetting

void __PLShouldShowSharedLibrarySetting_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare sharesWithPredicate:fetchLimit:inManagedObjectContext:](PLLibraryScope, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v6, 1, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __PLShouldShowSharedLibrarySetting_block_invoke_257(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBool:forKey:", 1, CFSTR("PLCloudPhotoLibrarySharedLibraryCanEnableKey"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("PLCloudPhotoLibrarySharedLibraryCanEnableTimestampKey"));

    PLBackendSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    LOWORD(v12) = 0;
    v10 = "PLShouldShowSharedLibrarySetting: Returning YES after checking directly with server";
  }
  else
  {
    PLBackendSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    LOWORD(v12) = 0;
    v10 = "PLShouldShowSharedLibrarySetting: Returning NO after checking directly with server";
  }
  _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v12, 2u);
LABEL_7:

  if (v5)
  {
    PLBackendSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "PLShouldShowSharedLibrarySetting: sharedLibraryRampCheckWithCompletionHandler returned error %@", (uint8_t *)&v12, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
