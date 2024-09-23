@implementation PLPersonContactInfoMigrator

- (PLPersonContactInfoMigrator)init
{
  PLPersonContactInfoMigrator *v2;
  CNContactStore *v3;
  CNContactStore *contactStore;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *keysToFetch;
  PLPersonContactInfoMigrator *v9;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)PLPersonContactInfoMigrator;
  v2 = -[PLPersonContactInfoMigrator init](&v11, sel_init);
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;

    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    -[CNContactStore descriptorForRequiredKeysForMatchingDictionary](v2->_contactStore, "descriptorForRequiredKeysForMatchingDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v7 = objc_claimAutoreleasedReturnValue();
    keysToFetch = v2->_keysToFetch;
    v2->_keysToFetch = (NSArray *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)migratePersonContactInfoInPhotoLibrary:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PLPersonContactInfoMigrator_migratePersonContactInfoInPhotoLibrary___block_invoke;
  v6[3] = &unk_1E3677C18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performTransactionAndWait:", v6);

}

- (void)migratePersonContactInfoInContext:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  void *v18;
  int updateNameCount;
  int populateMatchingDictionaryCount;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C97B48];
  v6 = a3;
  +[PLPerson entityName](PLPerson, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("verifiedType == %d && personUri != nil"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  objc_msgSend(v8, "setFetchBatchSize:", 100);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__PLPersonContactInfoMigrator_migratePersonContactInfoInContext___block_invoke;
  v21[3] = &unk_1E366FED0;
  v21[4] = self;
  -[PLPersonContactInfoMigrator enumerateResultsWithIncrementalSaveUsingFetchRequest:inContext:withBlock:](self, "enumerateResultsWithIncrementalSaveUsingFetchRequest:inContext:withBlock:", v8, v6, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PLMigrationGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v13;
      v24 = 2112;
      v25 = v10;
      v14 = "%@ failed to migrate person contacts info: %@";
      v15 = v12;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 22;
LABEL_8:
      _os_log_impl(&dword_199541000, v15, v16, v14, buf, v17);

    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      updateNameCount = self->_updateNameCount;
      *(_DWORD *)buf = 138412546;
      v23 = v18;
      v24 = 1024;
      LODWORD(v25) = updateNameCount;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "%@ update names for %d people", buf, 0x12u);

    }
    PLMigrationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      populateMatchingDictionaryCount = self->_populateMatchingDictionaryCount;
      *(_DWORD *)buf = 138412546;
      v23 = v13;
      v24 = 1024;
      LODWORD(v25) = populateMatchingDictionaryCount;
      v14 = "%@ populate matching dictionary for %d people";
      v15 = v12;
      v16 = OS_LOG_TYPE_DEFAULT;
      v17 = 18;
      goto LABEL_8;
    }
  }

}

- (id)enumerateResultsWithIncrementalSaveUsingFetchRequest:(id)a3 inContext:(id)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v14;

  v7 = a4;
  v8 = a5;
  v14 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", a3, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v9)
  {
    objc_msgSend(v7, "enumerateWithIncrementalSaveUsingObjects:shouldRefreshAfterSave:withBlock:", v9, 1, v8);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v11;
  }
  v12 = v10;

  return v12;
}

- (void)migratePerson:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "personUri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:](self->_contactStore, "unifiedContactWithIdentifier:keysToFetch:error:", v4, self->_keysToFetch, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PLPersonContactInfoMigrator updateNameOfPerson:withContact:](self, "updateNameOfPerson:withContact:", v6, v5);
    -[PLPersonContactInfoMigrator populateMatchingDictionaryOfPerson:withContact:](self, "populateMatchingDictionaryOfPerson:withContact:", v6, v5);
  }
  else
  {
    objc_msgSend(v6, "setPersonUri:", 0);
  }

}

- (void)updateNameOfPerson:(id)a3 withContact:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "fullName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v12, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[PLPerson fullNameFromContact:](PLPerson, "fullNameFromContact:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLPerson displayNameFromContact:](PLPerson, "displayNameFromContact:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFullName:", v10);
      objc_msgSend(v12, "setDisplayName:", v11);
      ++self->_updateNameCount;

    }
  }

}

- (void)populateMatchingDictionaryOfPerson:(id)a3 withContact:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "contactMatchingDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[PLContactStoreUtilitiesWorkaround matchingDictionaryForContact:contactStore:](PLContactStoreUtilitiesWorkaround, "matchingDictionaryForContact:contactStore:", v6, self->_contactStore);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContactMatchingDictionary:", v8);
    ++self->_populateMatchingDictionaryCount;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

uint64_t __65__PLPersonContactInfoMigrator_migratePersonContactInfoInContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "migratePerson:", a2);
}

void __70__PLPersonContactInfoMigrator_migratePersonContactInfoInPhotoLibrary___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "migratePersonContactInfoInContext:", v2);

}

{
  int v2;
  PLPersonContactInfoMigrator *v3;
  _BOOL4 v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = sDidMigrate;
  PLMigrationGetLog();
  v3 = (PLPersonContactInfoMigrator *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEFAULT);
  if (v2 == 1)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, &v3->super, OS_LOG_TYPE_DEFAULT, "Already migrated person contacts info", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_199541000, &v3->super, OS_LOG_TYPE_DEFAULT, "Migrating person contacts info", v5, 2u);
    }

    v3 = objc_alloc_init(PLPersonContactInfoMigrator);
    -[PLPersonContactInfoMigrator migratePersonContactInfoInPhotoLibrary:](v3, "migratePersonContactInfoInPhotoLibrary:", *(_QWORD *)(a1 + 32));
    sDidMigrate = 1;
  }

}

+ (id)migrationQueue
{
  pl_dispatch_once();
  return (id)migrationQueue_pl_once_object_1;
}

+ (void)migratePersonContactInfoInPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "migrationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v6 = v4;
  pl_dispatch_sync();

}

void __45__PLPersonContactInfoMigrator_migrationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.photos.personContactInfoMigrator", 0);
  v1 = (void *)migrationQueue_pl_once_object_1;
  migrationQueue_pl_once_object_1 = (uint64_t)v0;

}

@end
