@implementation NSManagedObjectContext

void __75__NSManagedObjectContext_PLManagedObjectContext__pl_resultWithError_block___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)MEMORY[0x19AEC1554]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_autoreleasePoolPop(v2);
}

uint64_t __83__NSManagedObjectContext_PLManagedObjectContext__deleteObjectsWithIncrementalSave___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
}

void __124__NSManagedObjectContext_PLManagedObjectContext__enumerateWithIncrementalSaveUsingObjects_shouldRefreshAfterSave_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v10 = 0;
  v3 = objc_msgSend(v2, "save:", &v10);
  v4 = v10;
  v5 = v10;
  if ((v3 & 1) == 0)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Unable to save incrementally: %@", buf, 0xCu);
    }

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(_QWORD *)(v7 + 40);
    v8 = (id *)(v7 + 40);
    if (!v9)
      objc_storeStrong(v8, v4);
  }

}

uint64_t __110__NSManagedObjectContext_PLManagedObjectContext__enumerateObjectsFromFetchRequest_count_batchSize_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__NSManagedObjectContext_PLManagedObjectContext__pl_graphCache__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.photos.PLMigrationGraphCacheKey"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61__NSManagedObjectContext_PLManagedObjectContext__pathManager__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.photos.PLModelMigratorPathManagerKey"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
