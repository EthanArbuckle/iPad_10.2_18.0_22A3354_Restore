@implementation PBFPosterExtensionDataStoreIntrospector

- (PBFPosterExtensionDataStoreIntrospector)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  NSURL *v7;
  NSURL *dataStoreURL;
  NSURL *v9;
  NSURL *dataStoreExtensionsURL;
  NSURL *v11;
  NSURL *dataStoreDatabaseURL;
  NSArray *v13;
  NSArray *extensionStoreCoordinators;
  void *v15;
  PBFPosterExtensionDataStoreIntrospector *v16;
  objc_super v18;

  v6 = a3;
  if (!objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", a4))
    goto LABEL_6;
  v18.receiver = self;
  v18.super_class = (Class)PBFPosterExtensionDataStoreIntrospector;
  self = -[PBFPosterExtensionDataStoreIntrospector init](&v18, sel_init);
  if (self)
  {
    v7 = (NSURL *)objc_msgSend(v6, "copy");
    dataStoreURL = self->_dataStoreURL;
    self->_dataStoreURL = v7;

    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreExtensionContainerURLForVersionDataStoreURL:", self->_dataStoreURL);
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    dataStoreExtensionsURL = self->_dataStoreExtensionsURL;
    self->_dataStoreExtensionsURL = v9;

    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_dataStoreSQLiteDatabaseURLForDataStoreURL:", self->_dataStoreURL);
    v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
    dataStoreDatabaseURL = self->_dataStoreDatabaseURL;
    self->_dataStoreDatabaseURL = v11;

    _PBFExtensionStoreCoordinatorsForDataStoreExtensionContainerURL(self->_dataStoreExtensionsURL, 1u);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    extensionStoreCoordinators = self->_extensionStoreCoordinators;
    self->_extensionStoreCoordinators = v13;

    self->_dataStoreDatabaseExists = -[NSURL checkResourceIsReachableAndReturnError:](self->_dataStoreDatabaseURL, "checkResourceIsReachableAndReturnError:", 0);
    objc_msgSend(v6, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_dataStoreVersion = objc_msgSend(v15, "integerValue");

    if (-[NSArray count](self->_extensionStoreCoordinators, "count"))
    {
      -[PBFPosterExtensionDataStoreIntrospector _hydrate](self, "_hydrate");
      goto LABEL_5;
    }
LABEL_6:
    v16 = 0;
    goto LABEL_7;
  }
LABEL_5:
  self = self;
  v16 = self;
LABEL_7:

  return v16;
}

- (id)posterWithUUID:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_extensionStoreCoordinators;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "latestPosterConfigurationForUUID:", v4, (_QWORD)v13);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (unint64_t)numberOfPostersForRole:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSArray *obj;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_extensionStoreCoordinators;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "configurationStoreCoordinatorsWithError:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = __66__PBFPosterExtensionDataStoreIntrospector_numberOfPostersForRole___block_invoke;
        v15[3] = &unk_1E86F6698;
        v16 = v4;
        objc_msgSend(v11, "bs_filter:", v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7 += objc_msgSend(v12, "count");

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __66__PBFPosterExtensionDataStoreIntrospector_numberOfPostersForRole___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "role");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)associatedPosterForRole:(id)a3 parentPosterUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    v6 = (id)*MEMORY[0x1E0D7FC58];
  -[PBFPosterExtensionDataStoreIntrospector associatedPosterUUIDForRole:parentPosterUUID:error:](self, "associatedPosterUUIDForRole:parentPosterUUID:error:", v6, a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStoreIntrospector posterWithUUID:](self, "posterWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)legacyAssociatedPosterForParentPosterUUID:(id)a3
{
  void *v4;
  void *v5;

  -[PBFPosterExtensionDataStoreIntrospector legacyAssociatedPosterUUIDForPosterUUID:error:](self, "legacyAssociatedPosterUUIDForPosterUUID:error:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStoreIntrospector posterWithUUID:](self, "posterWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)extensionStoreCoordinatorForProvider:(id)a3
{
  id v4;
  NSArray *extensionStoreCoordinators;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  extensionStoreCoordinators = self->_extensionStoreCoordinators;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__PBFPosterExtensionDataStoreIntrospector_extensionStoreCoordinatorForProvider___block_invoke;
  v9[3] = &unk_1E86F66C0;
  v10 = v4;
  v6 = v4;
  -[NSArray bs_firstObjectPassingTest:](extensionStoreCoordinators, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __80__PBFPosterExtensionDataStoreIntrospector_extensionStoreCoordinatorForProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "extensionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)legacySortedPosterUUIDsWithError:(id *)a3
{
  NSOrderedSet *legacySortedPosterUUIDs;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSOrderedSet *v19;
  NSOrderedSet *v20;
  NSOrderedSet *v21;
  NSOrderedSet *v22;
  NSOrderedSet *v23;
  NSOrderedSet *v24;
  id v25;

  legacySortedPosterUUIDs = self->_legacySortedPosterUUIDs;
  if (legacySortedPosterUUIDs)
    return legacySortedPosterUUIDs;
  objc_msgSend(MEMORY[0x1E0C99E98], "pbf_switcherConfigurationOrderingURLForDataStoreURL:", self->_dataStoreURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0))
  {
    v7 = (void *)MEMORY[0x1E0C99E40];
    v25 = 0;
    objc_msgSend(v6, "pf_loadFromPlistWithError:", &v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v25;
    v10 = objc_opt_class();
    v11 = v8;
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    if (v13)
      v14 = v13;
    else
      v14 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(v7, "orderedSetWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v16 = (void *)MEMORY[0x1E0C99E40];
      objc_msgSend(v15, "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bs_mapNoNulls:", &__block_literal_global_30);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "orderedSetWithArray:", v18);
      v19 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
      v20 = self->_legacySortedPosterUUIDs;
      self->_legacySortedPosterUUIDs = v19;

    }
  }
  v21 = self->_legacySortedPosterUUIDs;
  if (!v21)
  {
    v22 = (NSOrderedSet *)objc_opt_new();
    v23 = self->_legacySortedPosterUUIDs;
    self->_legacySortedPosterUUIDs = v22;

    v21 = self->_legacySortedPosterUUIDs;
  }
  v24 = v21;

  return v24;
}

id __76__PBFPosterExtensionDataStoreIntrospector_legacySortedPosterUUIDsWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (id)legacyAssociatedPosterUUIDForPosterUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PBFPosterExtensionDataStoreIntrospector legacyAssociatedPosterParentUUIDToChildUUIDWithError:](self, "legacyAssociatedPosterParentUUIDToChildUUIDWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)legacyAssociatedPosterParentUUIDToChildUUIDWithError:(id *)a3
{
  NSDictionary *legacyPosterToAssociatedPoster;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  NSDictionary *v21;
  NSDictionary *v22;
  PBFPosterExtensionDataStoreIntrospector *v23;
  NSArray *obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  legacyPosterToAssociatedPoster = self->_legacyPosterToAssociatedPoster;
  if (legacyPosterToAssociatedPoster)
    return legacyPosterToAssociatedPoster;
  v6 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = self;
  obj = self->_extensionStoreCoordinators;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v25 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v10, "configurationStoreCoordinatorsWithError:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v27 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kConfigurationAssociatedPosterUUIDKey"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "posterUUID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                v19 = v17 == 0;
              else
                v19 = 1;
              if (!v19)
                objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, v17);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v13);
        }

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }

  v20 = objc_msgSend(v6, "copy");
  v21 = v23->_legacyPosterToAssociatedPoster;
  v23->_legacyPosterToAssociatedPoster = (NSDictionary *)v20;

  v22 = v23->_legacyPosterToAssociatedPoster;
  return v22;
}

- (id)legacySelectedPosterUUIDWithError:(id *)a3
{
  NSUUID *legacySelectedPosterUUID;
  NSUUID *v4;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSUUID *v14;
  NSUUID *v15;

  legacySelectedPosterUUID = self->_legacySelectedPosterUUID;
  if (legacySelectedPosterUUID)
  {
    v4 = legacySelectedPosterUUID;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_switcherSelectedConfigurationURLForDataStoreURL:", self->_dataStoreURL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", 0))
    {
      objc_msgSend(v7, "pf_loadFromPlistWithError:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      v10 = v8;
      if (v9)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
      v12 = v11;

      objc_msgSend(v12, "objectForKey:", CFSTR("selectedConfigurationIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "length"))
      {
        v14 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v13);
        v15 = self->_legacySelectedPosterUUID;
        self->_legacySelectedPosterUUID = v14;

      }
    }
    v4 = self->_legacySelectedPosterUUID;

  }
  return v4;
}

- (id)sortedPosterUUIDsForRole:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *roleToSortedPosterUUID;
  id v11;
  void *v13;

  v6 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreIntrospector sortedPosterUUIDsForRole:error:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAA92ACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreIntrospector sortedPosterUUIDsForRole:error:].cold.1();
    goto LABEL_17;
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_roleToSortedPosterUUID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (self->_dataStoreDatabaseExists)
    {
      -[PBFPosterExtensionDataStoreIntrospector _openDatabaseIfPossible:](self, "_openDatabaseIfPossible:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sortedPosterUUIDsForRole:error:", v6, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!self->_roleToSortedPosterUUID)
      {
        v9 = (NSMutableDictionary *)objc_opt_new();
        roleToSortedPosterUUID = self->_roleToSortedPosterUUID;
        self->_roleToSortedPosterUUID = v9;

      }
      if (v7)
        -[NSMutableDictionary setObject:forKey:](self->_roleToSortedPosterUUID, "setObject:forKey:", v7, v6);
      objc_msgSend(v8, "invalidate");

    }
    else
    {
      v7 = 0;
    }
  }
  v11 = v7;

  return v11;
}

- (id)associatedPosterUUIDForPosterUUIDForRole:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableDictionary *roleToParentToChildPosterUUID;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  PBFPosterExtensionDataStoreIntrospector *v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreIntrospector associatedPosterUUIDForPosterUUIDForRole:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAA9608);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreIntrospector associatedPosterUUIDForPosterUUIDForRole:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAA966CLL);
  }

  roleToParentToChildPosterUUID = self->_roleToParentToChildPosterUUID;
  if (!roleToParentToChildPosterUUID)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_roleToParentToChildPosterUUID;
    self->_roleToParentToChildPosterUUID = v8;

    roleToParentToChildPosterUUID = self->_roleToParentToChildPosterUUID;
  }
  -[NSMutableDictionary objectForKey:](roleToParentToChildPosterUUID, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 && self->_dataStoreDatabaseExists)
  {
    v29 = self;
    -[PBFPosterExtensionDataStoreIntrospector _openDatabaseIfPossible:](self, "_openDatabaseIfPossible:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedPosterUUIDsForRole:error:", v6, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v33;
      v16 = *MEMORY[0x1E0D7FC20];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v11, "attributeForPoster:roleId:attributeId:error:", v18, v6, v16, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "length"))
          {
            v20 = v6;
            PRPosterRoleAttributeForData();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "childPosterUUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v21, "childPosterUUID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v23, v18);

            }
            v6 = v20;
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v14);
    }

    objc_msgSend(v11, "invalidate");
    v24 = (void *)objc_msgSend(v30, "copy");
    self = v29;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v29->_roleToParentToChildPosterUUID, "setObject:forKeyedSubscript:", v24, v6);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_roleToParentToChildPosterUUID, "objectForKeyedSubscript:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)selectedPosterUUIDForRole:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableDictionary *roleToSelectedPosterUUID;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;
  void *v14;

  v6 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreIntrospector selectedPosterUUIDForRole:error:].cold.1();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAA97E0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStoreIntrospector selectedPosterUUIDForRole:error:].cold.1();
    goto LABEL_15;
  }

  -[NSMutableDictionary objectForKey:](self->_roleToSelectedPosterUUID, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (self->_dataStoreDatabaseExists)
    {
      -[PBFPosterExtensionDataStoreIntrospector _openDatabaseIfPossible:](self, "_openDatabaseIfPossible:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectedPosterUUIDForRole:error:", v6, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      roleToSelectedPosterUUID = self->_roleToSelectedPosterUUID;
      if (!roleToSelectedPosterUUID)
      {
        v10 = (NSMutableDictionary *)objc_opt_new();
        v11 = self->_roleToSelectedPosterUUID;
        self->_roleToSelectedPosterUUID = v10;

        roleToSelectedPosterUUID = self->_roleToSelectedPosterUUID;
      }
      -[NSMutableDictionary bs_setSafeObject:forKey:](roleToSelectedPosterUUID, "bs_setSafeObject:forKey:", v7, v6);
      objc_msgSend(v8, "invalidate");

    }
    else
    {
      v7 = 0;
    }
  }
  v12 = v7;

  return v12;
}

- (id)associatedPosterUUIDForRole:(id)a3 parentPosterUUID:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  -[PBFPosterExtensionDataStoreIntrospector associatedPosterUUIDForPosterUUIDForRole:error:](self, "associatedPosterUUIDForPosterUUIDForRole:error:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSSet)snapshotURLs
{
  NSSet *snapshotURLs;
  NSSet *v3;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSSet *v13;
  NSSet *v14;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  snapshotURLs = self->_snapshotURLs;
  if (snapshotURLs)
  {
    v3 = snapshotURLs;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_extensionStoreCoordinators;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      v10 = MEMORY[0x1E0C809B0];
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
          v16[0] = v10;
          v16[1] = 3221225472;
          v16[2] = __55__PBFPosterExtensionDataStoreIntrospector_snapshotURLs__block_invoke;
          v16[3] = &unk_1E86F6708;
          v17 = v5;
          objc_msgSend(v12, "pbf_enumerateSnapshotCoordinators:", v16);

          ++v11;
        }
        while (v8 != v11);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    v13 = (NSSet *)objc_msgSend(v5, "copy");
    v14 = self->_snapshotURLs;
    self->_snapshotURLs = v13;

    v3 = self->_snapshotURLs;
  }
  return v3;
}

void __55__PBFPosterExtensionDataStoreIntrospector_snapshotURLs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "snapshotURLs");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

- (NSSet)roles
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_roleToSortedPosterUUID, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)snapshotsExist
{
  NSNumber *snapshotsExistSentinel;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSNumber *v12;
  NSNumber *v13;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  snapshotsExistSentinel = self->_snapshotsExistSentinel;
  if (snapshotsExistSentinel)
    return -[NSNumber BOOLValue](snapshotsExistSentinel, "BOOLValue");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", self->_dataStoreExtensionsURL, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "pbf_isPosterSnapshot", (_QWORD)v15))
        {
          v12 = self->_snapshotsExistSentinel;
          self->_snapshotsExistSentinel = (NSNumber *)MEMORY[0x1E0C9AAB0];

          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  v13 = self->_snapshotsExistSentinel;
  if (!v13)
  {
    self->_snapshotsExistSentinel = (NSNumber *)MEMORY[0x1E0C9AAA0];

    v13 = self->_snapshotsExistSentinel;
  }
  v14 = -[NSNumber BOOLValue](v13, "BOOLValue", (_QWORD)v15);

  return v14;
}

- (BOOL)descriptorsExist
{
  NSNumber *descriptorsExistSentinel;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSNumber *v14;
  NSNumber *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  descriptorsExistSentinel = self->_descriptorsExistSentinel;
  if (descriptorsExistSentinel)
    return -[NSNumber BOOLValue](descriptorsExistSentinel, "BOOLValue");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_extensionStoreCoordinators;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "dynamicDescriptorStoreCoordinatorsWithError:", 0, (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {

LABEL_14:
          v14 = self->_descriptorsExistSentinel;
          self->_descriptorsExistSentinel = (NSNumber *)MEMORY[0x1E0C9AAB0];

          goto LABEL_15;
        }
        objc_msgSend(v10, "staticDescriptorStoreCoordinatorsWithError:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13)
          goto LABEL_14;
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_15:

  v15 = self->_descriptorsExistSentinel;
  if (!v15)
  {
    self->_descriptorsExistSentinel = (NSNumber *)MEMORY[0x1E0C9AAA0];

    v15 = self->_descriptorsExistSentinel;
  }
  return -[NSNumber BOOLValue](v15, "BOOLValue", (_QWORD)v16);
}

- (BOOL)userConfigurationDataExists
{
  NSNumber *userConfigurationDataExistsSentinel;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  NSNumber *v23;
  NSNumber *v24;
  NSNumber *v25;
  NSArray *obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  userConfigurationDataExistsSentinel = self->_userConfigurationDataExistsSentinel;
  if (userConfigurationDataExistsSentinel)
    return -[NSNumber BOOLValue](userConfigurationDataExistsSentinel, "BOOLValue");
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = self->_extensionStoreCoordinators;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v48;
LABEL_5:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v27)
      {
        v6 = v5;
        objc_enumerationMutation(obj);
        v5 = v6;
      }
      v29 = v5;
      v7 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v5);
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v7, "configurationStoreCoordinatorsWithError:", 0);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      if (v32)
      {
        v31 = *(_QWORD *)v44;
LABEL_10:
        v8 = 0;
        while (1)
        {
          if (*(_QWORD *)v44 != v31)
            objc_enumerationMutation(v30);
          v33 = v8;
          v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v8);
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          objc_msgSend(v9, "allPosterPaths");
          v34 = (id)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v40;
LABEL_15:
            v13 = 0;
            while (1)
            {
              if (*(_QWORD *)v40 != v12)
                objc_enumerationMutation(v34);
              v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v13);
              objc_msgSend(MEMORY[0x1E0D7FB50], "expectedConfigurationFilesForPath:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "contentsURL");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              v38 = 0u;
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v16, 0, 0, 0);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v36;
                while (2)
                {
                  for (i = 0; i != v20; ++i)
                  {
                    if (*(_QWORD *)v36 != v21)
                      objc_enumerationMutation(v18);
                    if ((objc_msgSend(v15, "containsObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i)) & 1) == 0)
                    {
                      v23 = self->_userConfigurationDataExistsSentinel;
                      self->_userConfigurationDataExistsSentinel = (NSNumber *)MEMORY[0x1E0C9AAB0];

                      goto LABEL_28;
                    }
                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
                  if (v20)
                    continue;
                  break;
                }
              }
LABEL_28:

              v24 = self->_userConfigurationDataExistsSentinel;
              if (v24)
                break;
              if (++v13 == v11)
              {
                v11 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
                if (v11)
                  goto LABEL_15;
                break;
              }
            }
          }

          if (self->_userConfigurationDataExistsSentinel)
            break;
          v8 = v33 + 1;
          if (v33 + 1 == v32)
          {
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
            if (v32)
              goto LABEL_10;
            break;
          }
        }
      }

      if (self->_userConfigurationDataExistsSentinel)
        break;
      v5 = v29 + 1;
      if (v29 + 1 == v28)
      {
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
        if (v28)
          goto LABEL_5;
        break;
      }
    }
  }

  v25 = self->_userConfigurationDataExistsSentinel;
  if (!v25)
  {
    self->_userConfigurationDataExistsSentinel = (NSNumber *)MEMORY[0x1E0C9AAA0];

    v25 = self->_userConfigurationDataExistsSentinel;
  }
  return -[NSNumber BOOLValue](v25, "BOOLValue");
}

- (BOOL)multipleVersionsForConfigurationDataExists
{
  NSNumber *multipleVersionsForConfigurationDataExistsSentinel;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  unint64_t v16;
  NSNumber *v17;
  NSNumber *v18;
  NSArray *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  multipleVersionsForConfigurationDataExistsSentinel = self->_multipleVersionsForConfigurationDataExistsSentinel;
  if (multipleVersionsForConfigurationDataExistsSentinel)
    return -[NSNumber BOOLValue](multipleVersionsForConfigurationDataExistsSentinel, "BOOLValue");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_extensionStoreCoordinators;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
LABEL_5:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(v9, "configurationStoreCoordinatorsWithError:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "allPosterPaths");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "count");

            if (v16 >= 2)
            {
              v17 = self->_multipleVersionsForConfigurationDataExistsSentinel;
              self->_multipleVersionsForConfigurationDataExistsSentinel = (NSNumber *)MEMORY[0x1E0C9AAB0];

              goto LABEL_18;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_18:

      if (self->_multipleVersionsForConfigurationDataExistsSentinel)
        break;
      if (++v8 == v6)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v6)
          goto LABEL_5;
        break;
      }
    }
  }

  v18 = self->_multipleVersionsForConfigurationDataExistsSentinel;
  if (!v18)
  {
    self->_multipleVersionsForConfigurationDataExistsSentinel = (NSNumber *)MEMORY[0x1E0C9AAA0];

    v18 = self->_multipleVersionsForConfigurationDataExistsSentinel;
  }
  return -[NSNumber BOOLValue](v18, "BOOLValue");
}

- (BOOL)legacyAssocPostersExist
{
  NSDictionary *legacyPosterToAssociatedPoster;
  void *v4;
  id v5;

  legacyPosterToAssociatedPoster = self->_legacyPosterToAssociatedPoster;
  if (!legacyPosterToAssociatedPoster)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PBFPosterExtensionDataStoreIntrospector legacyAssociatedPosterUUIDForPosterUUID:error:](self, "legacyAssociatedPosterUUIDForPosterUUID:error:", v4, 0);

    legacyPosterToAssociatedPoster = self->_legacyPosterToAssociatedPoster;
  }
  return -[NSDictionary count](legacyPosterToAssociatedPoster, "count") != 0;
}

- (BOOL)assocPostersExist
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_dataStoreDatabaseExists)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  PFPosterRolesSupportedForCurrentDeviceClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[PBFPosterExtensionDataStoreIntrospector associatedPosterUUIDForPosterUUIDForRole:error:](self, "associatedPosterUUIDForPosterUUIDForRole:error:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), 0, (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9)
        {
          v10 = 1;
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (id)_openDatabaseIfPossible:(id *)a3
{
  PBFPosterExtensionDataStoreSQLiteDatabase *v5;
  PBFPosterExtensionDataStoreSQLiteDatabase *v6;
  PBFPosterExtensionDataStoreSQLiteDatabase *v7;

  if (-[NSURL checkResourceIsReachableAndReturnError:](self->_dataStoreDatabaseURL, "checkResourceIsReachableAndReturnError:"))
  {
    v5 = -[PBFPosterExtensionDataStoreSQLiteDatabase initWithURL:options:error:]([PBFPosterExtensionDataStoreSQLiteDatabase alloc], "initWithURL:options:error:", self->_dataStoreDatabaseURL, 4, a3);
    v6 = v5;
    if (v5
      && -[PBFPosterExtensionDataStoreSQLiteDatabase validateDatabaseWithError:](v5, "validateDatabaseWithError:", a3))
    {
      v7 = v6;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_hydrate
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[PBFPosterExtensionDataStoreIntrospector legacySortedPosterUUIDsWithError:](self, "legacySortedPosterUUIDsWithError:", 0);
  v4 = -[PBFPosterExtensionDataStoreIntrospector legacySelectedPosterUUIDWithError:](self, "legacySelectedPosterUUIDWithError:", 0);
  v5 = -[PBFPosterExtensionDataStoreIntrospector legacyAssociatedPosterParentUUIDToChildUUIDWithError:](self, "legacyAssociatedPosterParentUUIDToChildUUIDWithError:", 0);
  if (self->_dataStoreDatabaseExists)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    PFPosterRolesSupportedForCurrentDeviceClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          v12 = -[PBFPosterExtensionDataStoreIntrospector sortedPosterUUIDsForRole:error:](self, "sortedPosterUUIDsForRole:error:", v11, 0, (_QWORD)v16);
          v13 = -[PBFPosterExtensionDataStoreIntrospector selectedPosterUUIDForRole:error:](self, "selectedPosterUUIDForRole:error:", v11, 0);
          v14 = -[PBFPosterExtensionDataStoreIntrospector associatedPosterUUIDForPosterUUIDForRole:error:](self, "associatedPosterUUIDForPosterUUIDForRole:error:", v11, 0);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
  -[PBFPosterExtensionDataStoreIntrospector snapshotsExist](self, "snapshotsExist", (_QWORD)v16);
  -[PBFPosterExtensionDataStoreIntrospector descriptorsExist](self, "descriptorsExist");
  -[PBFPosterExtensionDataStoreIntrospector userConfigurationDataExists](self, "userConfigurationDataExists");
  -[PBFPosterExtensionDataStoreIntrospector multipleVersionsForConfigurationDataExists](self, "multipleVersionsForConfigurationDataExists");
  v15 = -[PBFPosterExtensionDataStoreIntrospector snapshotURLs](self, "snapshotURLs");
  -[PBFPosterExtensionDataStoreIntrospector assocPostersExist](self, "assocPostersExist");
  -[PBFPosterExtensionDataStoreIntrospector legacyAssocPostersExist](self, "legacyAssocPostersExist");
}

- (NSSet)providers
{
  return self->_providers;
}

- (unint64_t)dataStoreVersion
{
  return self->_dataStoreVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_multipleVersionsForConfigurationDataExistsSentinel, 0);
  objc_storeStrong((id *)&self->_userConfigurationDataExistsSentinel, 0);
  objc_storeStrong((id *)&self->_descriptorsExistSentinel, 0);
  objc_storeStrong((id *)&self->_snapshotsExistSentinel, 0);
  objc_storeStrong((id *)&self->_posterToAssociatedPoster, 0);
  objc_storeStrong((id *)&self->_latestPathsForProviders, 0);
  objc_storeStrong((id *)&self->_snapshotURLs, 0);
  objc_storeStrong((id *)&self->_roleToParentToChildPosterUUID, 0);
  objc_storeStrong((id *)&self->_roleToSortedPosterUUID, 0);
  objc_storeStrong((id *)&self->_roleToSelectedPosterUUID, 0);
  objc_storeStrong((id *)&self->_legacyPosterToAssociatedPoster, 0);
  objc_storeStrong((id *)&self->_legacySelectedPosterUUID, 0);
  objc_storeStrong((id *)&self->_legacySortedPosterUUIDs, 0);
  objc_storeStrong((id *)&self->_dataStoreDatabaseURL, 0);
  objc_storeStrong((id *)&self->_dataStoreExtensionsURL, 0);
  objc_storeStrong((id *)&self->_dataStoreURL, 0);
  objc_storeStrong((id *)&self->_extensionStoreCoordinators, 0);
}

- (void)sortedPosterUUIDsForRole:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)associatedPosterUUIDForPosterUUIDForRole:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)selectedPosterUUIDForRole:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
