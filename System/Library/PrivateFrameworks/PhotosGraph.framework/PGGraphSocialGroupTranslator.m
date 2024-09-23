@implementation PGGraphSocialGroupTranslator

+ (Class)entityClass
{
  return (Class)objc_opt_class();
}

- (id)graphChangesForInsertedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  id v4;
  void *v5;
  PGGraphSocialGroupsInsertion *v6;
  void *v7;
  PGGraphSocialGroupsInsertion *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Insert %ld new social groups", buf, 0xCu);
  }
  objc_msgSend((id)objc_opt_class(), "uuidsFromLocalIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGGraphSocialGroupsInsertion initWithSocialGroupUUIDs:]([PGGraphSocialGroupsInsertion alloc], "initWithSocialGroupUUIDs:", v5);
  v9 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  id v4;
  void *v5;
  PGGraphSocialGroupsDeletion *v6;
  void *v7;
  PGGraphSocialGroupsDeletion *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Delete %ld social groups", buf, 0xCu);
  }
  objc_msgSend((id)objc_opt_class(), "uuidsFromLocalIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGGraphSocialGroupsDeletion initWithSocialGroupUUIDs:]([PGGraphSocialGroupsDeletion alloc], "initWithSocialGroupUUIDs:", v5);
  v9 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  __CFString *v20;
  id v21;
  PGGraphSocialGroupTranslator *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = a3;
  objc_msgSend(v8, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __106__PGGraphSocialGroupTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke;
  v19 = &unk_1E8432740;
  v20 = CFSTR("socialGroupVerifiedType");
  v21 = v7;
  v22 = self;
  v11 = v10;
  v23 = v11;
  v12 = v7;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &v16);

  if (objc_msgSend(v11, "count", v16, v17, v18, v19))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 134217984;
      v25 = v13;
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Update %ld social groups", buf, 0xCu);
    }
    v14 = v11;
  }
  else
  {
    v14 = (id)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

void __106__PGGraphSocialGroupTranslator_graphChangesForChangedPropertyNamesByLocalIdentifier_change_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  PGGraphSocialGroupChange *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 40), "membersOrAssetContainmentForSocialGroupChangedWithLocalIdentifier:", v8))
  {
    objc_msgSend((id)objc_opt_class(), "uuidFromLocalIdentifier:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PGGraphSocialGroupChange initWithSocialGroupUUID:propertyNames:]([PGGraphSocialGroupChange alloc], "initWithSocialGroupUUID:propertyNames:", v6, v5);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);

  }
}

@end
