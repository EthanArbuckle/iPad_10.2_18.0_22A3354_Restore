@implementation PLLimitedLibraryFetchFilter

- (void)removeAllAssets
{
  NSMutableOrderedSet *assetUUIDs;
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *v5;
  id v6;

  assetUUIDs = self->_assetUUIDs;
  if (assetUUIDs)
  {
    -[NSMutableOrderedSet removeAllObjects](assetUUIDs, "removeAllObjects");
  }
  else
  {
    v4 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v5 = self->_assetUUIDs;
    self->_assetUUIDs = v4;

  }
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PLLimitedLibraryFetchFilter setFetchFilterData:](self, "setFetchFilterData:", v6);

}

- (void)addAssetsWithUUIDs:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSMutableOrderedSet *assetUUIDs;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PLLimitedLibraryFetchFilter _loadAssetUUIDs](self, "_loadAssetUUIDs");
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v5 = MEMORY[0x1E0C809B0];
    v20 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__PLLimitedLibraryFetchFilter_addAssetsWithUUIDs___block_invoke;
    v14[3] = &unk_1E366C950;
    v14[4] = self;
    v15 = v4;
    v16 = &v17;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v14);
    if (!*((_BYTE *)v18 + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", (16 * -[NSMutableOrderedSet count](self->_assetUUIDs, "count")) | 8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendBytes:length:", "PLUUIDS0", 8);
      assetUUIDs = self->_assetUUIDs;
      v9 = v5;
      v10 = 3221225472;
      v11 = __50__PLLimitedLibraryFetchFilter_addAssetsWithUUIDs___block_invoke_56;
      v12 = &unk_1E366C978;
      v8 = v6;
      v13 = v8;
      -[NSMutableOrderedSet enumerateObjectsUsingBlock:](assetUUIDs, "enumerateObjectsUsingBlock:", &v9);
      -[PLLimitedLibraryFetchFilter setFetchFilterData:](self, "setFetchFilterData:", v8, v9, v10, v11, v12);

    }
    _Block_object_dispose(&v17, 8);
  }

}

- (BOOL)containsAssetWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
  if (v5)
  {
    -[PLLimitedLibraryFetchFilter _loadAssetUUIDs](self, "_loadAssetUUIDs");
    v10 = 0uLL;
    objc_msgSend(v5, "getUUIDBytes:", &v10);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &v10, 16, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSMutableOrderedSet containsObject:](self->_assetUUIDs, "containsObject:", v6);

  }
  else
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v10) = 138543362;
      *(_QWORD *)((char *)&v10 + 4) = v4;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "LimitedLibrary: invalid UUID string: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)assetUUIDs
{
  uint64_t v3;
  size_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v15;
  char *v16;
  uint64_t i;
  objc_class *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  -[PLLimitedLibraryFetchFilter _loadAssetUUIDs](self, "_loadAssetUUIDs");
  v3 = -[NSMutableOrderedSet count](self->_assetUUIDs, "count");
  if (!v3)
    return MEMORY[0x1E0C9AA60];
  v4 = v3;
  v5 = MEMORY[0x19AEC1554]();
  if ((v4 & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v4);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = (_QWORD *)MEMORY[0x1E0C99750];
    goto LABEL_25;
  }
  v6 = (void *)v5;
  if (v4 >= 0x101)
    v7 = 1;
  else
    v7 = v4;
  v8 = 8 * v7;
  MEMORY[0x1E0C80A78](v5);
  v10 = (char *)v33 - v9;
  bzero((char *)v33 - v9, v8);
  v33[0] = v33;
  if (v4 < 0x101)
  {
    bzero(v10, 8 * v4);
    MEMORY[0x1E0C80A78](v11);
    v12 = (char *)v33 - ((8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v12, v8);
    bzero(v12, 8 * v4);
    v13 = v12;
    goto LABEL_12;
  }
  v15 = (char *)malloc_type_calloc(8uLL, v4, 0xF55C1876uLL);
  if (!v15
    || (v10 = v15,
        MEMORY[0x1E0C80A78](v15),
        v13 = (char *)v32,
        bzero(v32, v8),
        (v16 = (char *)malloc_type_calloc(8uLL, v4, 0xF114E95FuLL)) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** attempt to create a temporary id buffer of length (%lu) failed"), v4);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = (_QWORD *)MEMORY[0x1E0C99850];
LABEL_25:
    objc_msgSend(v29, "exceptionWithName:reason:userInfo:", *v30, v28, 0, v33[0]);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  v12 = v16;
LABEL_12:
  -[NSMutableOrderedSet getObjects:range:](self->_assetUUIDs, "getObjects:range:", v10, 0, v4, v33[0]);
  for (i = 0; i != v4; ++i)
  {
    v18 = (objc_class *)MEMORY[0x1E0CB3A28];
    v19 = *(id *)&v10[8 * i];
    v20 = [v18 alloc];
    v21 = objc_retainAutorelease(v19);
    v22 = (void *)objc_msgSend(v20, "initWithUUIDBytes:", objc_msgSend(v21, "bytes"));
    objc_msgSend(v22, "UUIDString");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(void **)&v12[8 * i];
    *(_QWORD *)&v12[8 * i] = v23;

  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v12, v4);
  if (v4 >= 0x101)
    free(v10);
  for (j = 0; j != v4; ++j)
  {
    v27 = *(void **)&v12[8 * j];
    *(_QWORD *)&v12[8 * j] = 0;

  }
  if (v4 >= 0x101)
    free(v12);
  do
  {

    v8 -= 8;
  }
  while (v8);
  objc_autoreleasePoolPop(v6);
  return v25;
}

- (id)predicateForEntityName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  NSObject *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    -[PLLimitedLibraryFetchFilter assetUUIDs](self, "assetUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3880];
      v9 = CFSTR("uuid");
LABEL_8:
      objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K in %@"), v9, v7);
LABEL_9:
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_10;
  }
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "isEqualToString:", v10);

  if (v11
    || (+[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v4, "isEqualToString:", v12),
        v12,
        v13))
  {
    -[PLLimitedLibraryFetchFilter assetUUIDs](self, "assetUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3880];
      v9 = CFSTR("asset.uuid");
      goto LABEL_8;
    }
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v4, "isEqualToString:", v16);

  if (v17)
  {
LABEL_17:
    v21 = (void *)MEMORY[0x1E0CB3880];
    +[PLLimitedLibraryFetchFilter disallowedAlbumKinds](PLLimitedLibraryFetchFilter, "disallowedAlbumKinds");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("kind"), v7);
    goto LABEL_9;
  }
  +[PLFetchingAlbum entityName](PLFetchingAlbum, "entityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v18))
  {

    goto LABEL_17;
  }
  +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v4, "isEqualToString:", v19);

  if (v20)
    goto LABEL_17;
  PLBackendGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v24 = objc_opt_class();
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "invalid enttity name for %@: %@", buf, 0x16u);
  }

  v14 = 0;
LABEL_12:

  return v14;
}

- (void)_loadAssetUUIDs
{
  void *v3;
  void *v4;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *assetUUIDs;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *v8;

  if (!self->_assetUUIDs)
  {
    v3 = (void *)objc_opt_class();
    -[PLLimitedLibraryFetchFilter fetchFilterData](self, "fetchFilterData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_decodeFetchFilterData:withUUIDHandler:resultHandler:", v4, &__block_literal_global_66, &__block_literal_global_67);
    v5 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    assetUUIDs = self->_assetUUIDs;
    self->_assetUUIDs = v5;

    if (!self->_assetUUIDs)
    {
      v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      v8 = self->_assetUUIDs;
      self->_assetUUIDs = v7;

    }
  }
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_class();
  -[PLLimitedLibraryFetchFilter fetchFilterData](self, "fetchFilterData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_assetUUIDStringsFromFetchFilterData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLDescriptionBuilder prettyMultiLineDescriptionBuilderWithObject:indent:](PLDescriptionBuilder, "prettyMultiLineDescriptionBuilderWithObject:indent:", self, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLimitedLibraryFetchFilter applicationIdentifier](self, "applicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendName:object:", CFSTR("applicationIdentifier"), v7);

  -[PLLimitedLibraryFetchFilter designatedRequirement](self, "designatedRequirement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendName:object:", CFSTR("designatedRequirement"), v8);

  objc_msgSend(v6, "appendName:object:", CFSTR("assetUUIDs"), v5);
  objc_msgSend(v6, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
}

id __46__PLLimitedLibraryFetchFilter__loadAssetUUIDs__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithObjects:count:", a2, a3);
}

id __46__PLLimitedLibraryFetchFilter__loadAssetUUIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a2, 16);
}

void __50__PLLimitedLibraryFetchFilter_addAssetsWithUUIDs___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  unint64_t v7;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = objc_msgSend(v6, "length");
  if (v7 < 0x25)
  {
    if (v7 != 36)
      goto LABEL_15;
    v8 = v6;
    if (!v8)
      goto LABEL_15;
  }
  else
  {
    objc_msgSend(v6, "substringToIndex:", 36);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_15;
  }
  v9 = (objc_class *)MEMORY[0x1E0CB3A28];
  v10 = v8;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithUUIDString:", v10);

  if (v11)
  {
    v15 = 0uLL;
    objc_msgSend(v11, "getUUIDBytes:", &v15);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v15, 16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  if (objc_msgSend(v12, "length") == 16)
  {
    objc_msgSend(*(id *)(a1[4] + 64), "addObject:", v12);
  }
  else
  {
    PLBackendGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = a1[5];
      LODWORD(v15) = 138543362;
      *(_QWORD *)((char *)&v15 + 4) = v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "LimitedLibrary: uuids contains non-UUIDs: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }

LABEL_15:
}

uint64_t __50__PLLimitedLibraryFetchFilter_addAssetsWithUUIDs___block_invoke_56(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendData:", a2);
}

+ (id)entityName
{
  return CFSTR("LimitedLibraryFetchFilter");
}

+ (id)insertIntoManagedObjectContext:(id)a3 forApplicationIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "setApplicationIdentifier:", v6);
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFetchFilterData:", v10);

  }
  return v9;
}

+ (id)fetchOrCreateLimitedLibraryFetchFilterWithApplicationIdentifier:(id)a3 auditToken:(id *)a4 inManagedObjectContext:(id)a5
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  +[PLLimitedLibraryFetchFilter fetchLimitedLibraryFetchFilterWithApplicationIdentifier:inManagedObjectContext:](PLLimitedLibraryFetchFilter, "fetchLimitedLibraryFetchFilterWithApplicationIdentifier:inManagedObjectContext:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Creating limited library fetch filter for %@ since one does not exist", (uint8_t *)&v11, 0xCu);
    }

    +[PLLimitedLibraryFetchFilter insertIntoManagedObjectContext:forApplicationIdentifier:](PLLimitedLibraryFetchFilter, "insertIntoManagedObjectContext:forApplicationIdentifier:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)fetchLimitedLibraryFetchFilterWithApplicationIdentifier:(id)a3 inManagedObjectContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("applicationIdentifier == %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fetchFiltersMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:", v8, 0, 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_fetchFiltersMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(int64_t)a5 inManagedObjectContext:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0C97B48];
  v13 = a3;
  objc_msgSend(a1, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchRequestWithEntityName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setFetchBatchSize:", 100);
  objc_msgSend(v15, "setPredicate:", v13);

  if (v10)
    objc_msgSend(v15, "setSortDescriptors:", v10);
  if (a5 >= 1)
    objc_msgSend(v15, "setFetchLimit:", a5);
  v22 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v15, &v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v22;
  if (v16)
  {
    v19 = v16;
  }
  else
  {
    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "LimitedLibrary: failed to fetch suggestions: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  return v20;
}

+ (id)_assetUUIDStringsFromFetchFilterData:(id)a3
{
  return (id)objc_msgSend(a1, "_decodeFetchFilterData:withUUIDHandler:resultHandler:", a3, &__block_literal_global_55152, &__block_literal_global_32_55153);
}

+ (id)entityNameToPredicateMapWithApplicationIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PLLimitedLibraryFetchFilter disallowedAlbumKinds](PLLimitedLibraryFetchFilter, "disallowedAlbumKinds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ OR NOT (%K IN %@)"), CFSTR("importedByBundleIdentifier"), v3, CFSTR("kind"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v12[0] = v5;
  +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  v12[1] = v5;
  +[PLFetchingAlbum entityName](PLFetchingAlbum, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entityNameToPredicateMapFromFetchFilterData:(id)a3 withApplicationIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a4;
  objc_msgSend(v7, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityNameToPredicateMapWithApplicationIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addEntriesFromDictionary:", v10);
  if (v6)
  {
    objc_msgSend(a1, "_assetUUIDStringsFromFetchFilterData:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && objc_msgSend(v11, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("uuid"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedAsset entityName](PLManagedAsset, "entityName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v14);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("asset.uuid"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLInternalResource entityName](PLInternalResource, "entityName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("asset.uuid"), v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v18);

    }
  }

  return v9;
}

+ (id)_decodeFetchFilterData:(id)a3 withUUIDHandler:(id)a4 resultHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  void (**v9)(id, void *, size_t);
  id v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  void *v37;
  uint8_t buf[8];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v9 = (void (**)(id, void *, size_t))a5;
  if (!v7)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v7)
    goto LABEL_10;
  v11 = objc_msgSend(v7, "length");
  v12 = objc_retainAutorelease(v7);
  v13 = objc_msgSend(v12, "bytes");
  v14 = v11 >= 8;
  v15 = v11 - 8;
  if (!v14
    || (v16 = v13, *(_QWORD *)objc_msgSend(objc_retainAutorelease(v12), "bytes") != 0x3053444955554C50)
    || (v15 & 0xF) != 0)
  {
    PLBackendGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "LimitedLibrary: data does not contain current valid PLLimitedLibraryFetchFilterData", buf, 2u);
    }

    goto LABEL_10;
  }
  if (v15 < 0x10)
  {
LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  v20 = v15 >> 4;
  v36 = &v34;
  v37 = (void *)MEMORY[0x19AEC1554]();
  if (v15 >> 4 >= 0x101)
    v21 = 1;
  else
    v21 = v15 >> 4;
  v35 = v21;
  v22 = 8 * v21;
  v23 = (char *)&v34 - ((8 * v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v23, 8 * v21);
  if (v20 > 0x100)
  {
    v24 = (char *)malloc_type_calloc(8uLL, v20, 0xF15A9C1DuLL);
    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** attempt to create a temporary id buffer of length (%lu) failed"), v20);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], objc_claimAutoreleasedReturnValue(), 0);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v33);
    }
  }
  else
  {
    bzero(v23, 8 * v20);
    v24 = v23;
  }
  v25 = 0;
  v26 = v16 + 8;
  if (v20 <= 1)
    v27 = 1;
  else
    v27 = v20;
  v28 = 8 * v27;
  do
  {
    v8[2](v8, v26);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(void **)&v24[v25];
    *(_QWORD *)&v24[v25] = v29;

    v26 += 16;
    v25 += 8;
  }
  while (v28 != v25);
  v9[2](v9, v24, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  do
  {
    v32 = *(void **)&v24[v31];
    *(_QWORD *)&v24[v31] = 0;

    v31 += 8;
  }
  while (v28 != v31);
  if (v20 >= 0x101)
    free(v24);
  if (v35)
  {
    do
    {

      v22 -= 8;
    }
    while (v22);
  }
  objc_autoreleasePoolPop(v37);
LABEL_11:

  return v18;
}

+ (void)deleteLimitedLibraryFetchFilterWithApplicationIdentifier:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PLLimitedLibraryFetchFilter fetchLimitedLibraryFetchFilterWithApplicationIdentifier:inManagedObjectContext:](PLLimitedLibraryFetchFilter, "fetchLimitedLibraryFetchFilterWithApplicationIdentifier:inManagedObjectContext:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "LimitedLibrary: deleting LimitedLibraryFetchFilter for applicationIdentifier: %@", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __111__PLLimitedLibraryFetchFilter_deleteLimitedLibraryFetchFilterWithApplicationIdentifier_inManagedObjectContext___block_invoke;
    v9[3] = &unk_1E3677C18;
    v10 = v6;
    v11 = v7;
    objc_msgSend(v10, "performBlockAndWait:", v9);

  }
}

+ (void)deleteAllLimitedLibraryFetchFiltersInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_fetchFiltersMatchingPredicate:sortDescriptors:limit:inManagedObjectContext:", 0, 0, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  PLBackendGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      v23 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "LimitedLibrary: batch deleting %lu LimitedLibraryFetchFilters", buf, 0xCu);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v16 = v5;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          PLBackendGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "applicationIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v23 = (uint64_t)v15;
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "LimitedLibrary: deleting LimitedLibraryFetchFilter for applicationIdentifier: %@", buf, 0xCu);

          }
          objc_msgSend(v4, "deleteObject:", v13);
        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
      v5 = v16;
    }
  }
  else if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "LimitedLibrary: no LimitedLibraryFetchFilters to delete", buf, 2u);
  }

}

+ (id)disallowedAlbumKinds
{
  return &unk_1E3763C98;
}

+ (id)fetchFilterIdentifierForApplicationIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;

  v3 = a3;
  v11 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v3, &v11);
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "containingBundleRecord"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "bundleIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    objc_msgSend(v5, "containingBundleRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v3;
  }

  return v9;
}

+ (id)fetchFilterIdentifierForConnectionAuthorization:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "trustedCallerContainingBundleRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "trustedCallerContainingBundleRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5;
  }
  else
  {
    objc_msgSend(v3, "trustedCallerBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)debugDescriptionOfCurrentLimitedLibraryFetchFiltersInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || v7)
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "LimitedLibrary: fetch request for fetch filters failed with error: %@", buf, 0xCu);
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __105__PLLimitedLibraryFetchFilter_debugDescriptionOfCurrentLimitedLibraryFetchFiltersInManagedObjectContext___block_invoke;
    v11[3] = &unk_1E3677C18;
    v12 = v6;
    v13 = v8;
    objc_msgSend(v4, "performBlockAndWait:", v11);

    v9 = v12;
  }

  return v8;
}

void __105__PLLimitedLibraryFetchFilter_debugDescriptionOfCurrentLimitedLibraryFetchFiltersInManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __105__PLLimitedLibraryFetchFilter_debugDescriptionOfCurrentLimitedLibraryFetchFiltersInManagedObjectContext___block_invoke_2;
  v2[3] = &unk_1E366C9E0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

void __105__PLLimitedLibraryFetchFilter_debugDescriptionOfCurrentLimitedLibraryFetchFiltersInManagedObjectContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "debugDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __111__PLLimitedLibraryFetchFilter_deleteLimitedLibraryFetchFilterWithApplicationIdentifier_inManagedObjectContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObject:", *(_QWORD *)(a1 + 40));
}

id __68__PLLimitedLibraryFetchFilter__assetUUIDStringsFromFetchFilterData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", a2, a3);
}

id __68__PLLimitedLibraryFetchFilter__assetUUIDStringsFromFetchFilterData___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a2);
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
