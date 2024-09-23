@implementation PLManagedObjectContextForMigrationActionWithCoordinator

void __PLManagedObjectContextForMigrationActionWithCoordinator_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("com.apple.photos.PLModelMigratorPathManagerKey"));

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("com.apple.photos.PLMigrationGraphCacheKey"));
    v4 = v6;
  }

}

void __PLManagedObjectContextForMigrationActionWithCoordinator_block_invoke()
{
  PLMergePolicy *v0;
  void *v1;

  v0 = -[NSMergePolicy initWithMergeType:]([PLMergePolicy alloc], "initWithMergeType:", 2);
  v1 = (void *)PLManagedObjectContextForMigrationActionWithCoordinator_pl_once_object_24;
  PLManagedObjectContextForMigrationActionWithCoordinator_pl_once_object_24 = (uint64_t)v0;

}

@end
