@implementation PBFPosterSnapshotCoordinator

- (PBFPosterSnapshotCoordinator)initWithPath:(id)a3
{
  id v5;
  PBFPosterSnapshotCoordinator *v6;
  PBFPosterSnapshotCoordinator *v7;
  uint64_t v8;
  NSMapTable *lock_definitionToSnapshotReservationMap;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PBFPosterSnapshotCoordinator;
  v6 = -[PBFPosterSnapshotCoordinator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    lock_definitionToSnapshotReservationMap = v7->_lock_definitionToSnapshotReservationMap;
    v7->_lock_definitionToSnapshotReservationMap = (NSMapTable *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PBFPosterSnapshotCoordinator cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterSnapshotCoordinator;
  -[PBFPosterSnapshotCoordinator dealloc](&v3, sel_dealloc);
}

- (BOOL)hasSnapshots
{
  void *v2;
  void *v3;
  BOOL v4;

  -[NSMapTable objectEnumerator](self->_lock_definitionToSnapshotReservationMap, "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)snapshotReservationForDefinition:(id)a3 configuredProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  NSClassFromString(CFSTR("PBFPosterSnapshotDefinition"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotCoordinator snapshotReservationForDefinition:configuredProperties:context:].cold.1();
LABEL_29:
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA85FB0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterSnapshotDefinitionClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotCoordinator snapshotReservationForDefinition:configuredProperties:context:].cold.1();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA86014);
  }

  v12 = v9;
  -[PFServerPosterPath serverIdentity](self->_path, "serverIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "type");

  if (v12 || v14 != 3)
  {
    NSClassFromString(CFSTR("PRPosterConfiguredProperties"));
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterSnapshotCoordinator snapshotReservationForDefinition:configuredProperties:context:].cold.4();
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA86140);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterSnapshotCoordinator snapshotReservationForDefinition:configuredProperties:context:].cold.4();
      goto LABEL_29;
    }
  }

  v15 = v10;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotCoordinator snapshotReservationForDefinition:configuredProperties:context:].cold.2();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA86078);
  }
  v16 = v15;
  if ((objc_msgSend(v15, "conformsToProtocol:", &unk_1EF9EE588) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFDisplayContext)]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotCoordinator snapshotReservationForDefinition:configuredProperties:context:].cold.2();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA860DCLL);
  }

  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_definitionToSnapshotReservationMap, "objectForKey:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterSnapshotCoordinator snapshotURLForDefinition:configuredProperties:context:](self, "snapshotURLForDefinition:configuredProperties:context:", v11, v12, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    -[PBFPosterSnapshotCoordinator _lock_ingestImageAtURL:forDefinition:configuredProperties:context:](self, "_lock_ingestImageAtURL:forDefinition:configuredProperties:context:", v18, v11, v12, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(&self->_lock);

  return v19;
}

- (void)ingestSnapshotsByDefinition:(id)a3 path:(id)a4 configuredProperties:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v12;
  -[PFServerPosterPath serverIdentity](self->_path, "serverIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "type");

  if (v14 || v16 != 3)
  {
    NSClassFromString(CFSTR("PRPosterConfiguredProperties"));
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterSnapshotCoordinator ingestSnapshotsByDefinition:path:configuredProperties:context:].cold.4();
      objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA86574);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterSnapshotCoordinator ingestSnapshotsByDefinition:path:configuredProperties:context:].cold.4();
      objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA865D8);
    }
  }

  v17 = v13;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotCoordinator ingestSnapshotsByDefinition:path:configuredProperties:context:].cold.1();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA86448);
  }
  v18 = v17;
  if ((objc_msgSend(v17, "conformsToProtocol:", &unk_1EF9EE588) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFDisplayContext)]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotCoordinator ingestSnapshotsByDefinition:path:configuredProperties:context:].cold.1();
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA864ACLL);
  }

  objc_msgSend(v11, "identity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFServerPosterPath identity](self->_path, "identity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  if ((v21 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[path identity] isEqual:[_path identity]]"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotCoordinator ingestSnapshotsByDefinition:path:configuredProperties:context:].cold.2();
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA86510);
  }
  v35 = v11;
  os_unfair_lock_lock(&self->_lock);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = v10;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v22, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "checkResourceIsReachableAndReturnError:", 0))
          v29 = -[PBFPosterSnapshotCoordinator _lock_ingestImageAtURL:forDefinition:configuredProperties:context:](self, "_lock_ingestImageAtURL:forDefinition:configuredProperties:context:", v28, v27, v14, v18);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v24);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)ingestSnapshotsFromCoordinator:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "instanceURL");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v15 = (void *)v4;
  objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 21, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "pbf_isPosterSnapshot"))
        {
          -[PFServerPosterPath instanceURL](self->_path, "instanceURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "lastPathComponent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "URLByAppendingPathComponent:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "copyItemAtURL:toURL:error:", v11, v14, 0);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)snapshotExistsForDefinition:(id)a3 configuredProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  BOOL v24;
  BOOL v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  NSClassFromString(CFSTR("PBFPosterSnapshotDefinition"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotCoordinator snapshotExistsForDefinition:configuredProperties:context:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_42:
    JUMPOUT(0x1CBA869C8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFPosterSnapshotDefinitionClass]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotCoordinator snapshotExistsForDefinition:configuredProperties:context:].cold.1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA86A2CLL);
  }

  v12 = v9;
  -[PFServerPosterPath serverIdentity](self->_path, "serverIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "type");

  if (v12 || v14 != 3)
  {
    NSClassFromString(CFSTR("PRPosterConfiguredProperties"));
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterSnapshotCoordinator snapshotExistsForDefinition:configuredProperties:context:].cold.5();
      objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA86B58);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterSnapshotCoordinator snapshotExistsForDefinition:configuredProperties:context:].cold.5();
      objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA86BBCLL);
    }
  }

  v15 = v10;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotCoordinator snapshotExistsForDefinition:configuredProperties:context:].cold.2();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA86A90);
  }
  v16 = v15;
  if ((objc_msgSend(v15, "conformsToProtocol:", &unk_1EF9EE588) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFDisplayContext)]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotCoordinator snapshotExistsForDefinition:configuredProperties:context:].cold.2();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA86AF4);
  }

  -[PBFPosterSnapshotCoordinator snapshotReservationForDefinition:configuredProperties:context:](self, "snapshotReservationForDefinition:configuredProperties:context:", v11, v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18
    || (objc_msgSend(v17, "URL"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "checkResourceIsReachableAndReturnError:", 0),
        v19,
        !v20))
  {
    v25 = 0;
    goto LABEL_20;
  }
  v34 = 0;
  objc_msgSend(v17, "fetchImageWithError:", &v34);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v34;
  if ((v21 == 0) != (v22 != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("(fetchedImage && !error) || (!fetchedImage && error)"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotCoordinator snapshotExistsForDefinition:configuredProperties:context:].cold.3();
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_42;
  }
  v23 = v22;
  if (v22)
    v24 = 1;
  else
    v24 = v21 == 0;
  v25 = !v24;

LABEL_20:
  return v25;
}

- (id)snapshotURLForDefinition:(id)a3 configuredProperties:(id)a4 context:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "pbf_snapshotURLForPath:definition:configuredProperties:context:", self->_path, a3, a4, a5);
}

- (void)removeAllSnapshots
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PBFPosterSnapshotCoordinator _lock_snapshotURLs:](self, "_lock_snapshotURLs:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PBFPosterSnapshotCoordinator _lock_removeSnapshotsAtURLs:checkIfOwner:](self, "_lock_removeSnapshotsAtURLs:checkIfOwner:", v4, 0);

  os_unfair_lock_unlock(p_lock);
}

- (id)removeSnapshotsAtURLs:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PBFPosterSnapshotCoordinator _lock_removeSnapshotsAtURLs:checkIfOwner:](self, "_lock_removeSnapshotsAtURLs:checkIfOwner:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (NSSet)snapshotURLs
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PBFPosterSnapshotCoordinator _lock_snapshotURLs:](self, "_lock_snapshotURLs:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSSet *)v5;
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable removeAllObjects](self->_lock_definitionToSnapshotReservationMap, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (id)_lock_ingestImageAtURL:(id)a3 forDefinition:(id)a4 configuredProperties:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PBFPosterSnapshotReservation *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[PBFPosterSnapshotCoordinator snapshotURLForDefinition:configuredProperties:context:](self, "snapshotURLForDefinition:configuredProperties:context:", v11, a5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if (objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", 0))
  {
    -[NSMapTable objectForKey:](self->_lock_definitionToSnapshotReservationMap, "objectForKey:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PBFPosterSnapshotReservation initWithURL:displayContext:image:error:]([PBFPosterSnapshotReservation alloc], "initWithURL:displayContext:image:error:", v10, v12, 0, 0);
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](self->_lock_definitionToSnapshotReservationMap, "setObject:forKey:", v15, v11);
    }
    objc_msgSend(v15, "setObject:forKey:", v14, v13);

  }
  return v14;
}

- (id)_lock_snapshotURLs:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFServerPosterPath instanceURL](self->_path, "instanceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C99968];
  v27[0] = *MEMORY[0x1E0C99968];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, v8, 20, &__block_literal_global_20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    v14 = *MEMORY[0x1E0C99978];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
        v21 = 0;
        objc_msgSend(v16, "getResourceValue:forKey:error:", &v21, v7, 0);
        v17 = v21;
        if (objc_msgSend(v17, "isEqualToString:", v14)
          && objc_msgSend(v16, "pbf_isPosterSnapshot"))
        {
          objc_msgSend(v16, "URLByStandardizingPath");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v18);

        }
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  v19 = (void *)objc_msgSend(v4, "copy");
  return v19;
}

uint64_t __51__PBFPosterSnapshotCoordinator__lock_snapshotURLs___block_invoke()
{
  return 1;
}

- (id)_lock_removeSnapshotsAtURLs:(id)a3 checkIfOwner:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void (**v7)(void *, _QWORD);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  PBFPosterSnapshotCoordinator *v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  void *v27;
  id v28;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  PBFPosterSnapshotCoordinator *v34;
  void *v35;
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
  _QWORD aBlock[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v4 = a4;
  v58 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  if (objc_msgSend(v30, "count"))
  {
    v34 = self;
    -[PFServerPosterPath instanceURL](self->_path, "instanceURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__7;
    v53 = __Block_byref_object_dispose__7;
    v54 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PBFPosterSnapshotCoordinator__lock_removeSnapshotsAtURLs_checkIfOwner___block_invoke;
    aBlock[3] = &unk_1E86F5948;
    aBlock[4] = &v49;
    v7 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v8 = v30;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v45 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (v4)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "path");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "hasPrefix:", v35);

            if ((v14 & 1) == 0)
              continue;
          }
          v7[2](v7, v12);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      }
      while (v9);
    }

    if (objc_msgSend((id)v50[5], "count"))
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v15 = (void *)-[NSMapTable copy](v34->_lock_definitionToSnapshotReservationMap, "copy");
      objc_msgSend(v15, "keyEnumerator");
      obj = (id)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
      v17 = v34;
      if (v16)
      {
        v32 = *(_QWORD *)v41;
        do
        {
          v33 = v16;
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v41 != v32)
              objc_enumerationMutation(obj);
            v19 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
            -[NSMapTable objectForKey:](v17->_lock_definitionToSnapshotReservationMap, "objectForKey:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v21 = (void *)objc_msgSend(v20, "copy");
            objc_msgSend(v21, "keyEnumerator");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v55, 16);
            if (v23)
            {
              v24 = *(_QWORD *)v37;
              do
              {
                for (k = 0; k != v23; ++k)
                {
                  if (*(_QWORD *)v37 != v24)
                    objc_enumerationMutation(v22);
                  v26 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k);
                  if (objc_msgSend((id)v50[5], "containsObject:", v26))
                  {
                    objc_msgSend(v20, "objectForKey:", v26);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "cancel");
                    objc_msgSend(v20, "removeObjectForKey:", v26);

                  }
                }
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v55, 16);
              }
              while (v23);
            }

            if (!objc_msgSend(v20, "count"))
              -[NSMapTable removeObjectForKey:](v34->_lock_definitionToSnapshotReservationMap, "removeObjectForKey:", v19);

            v17 = v34;
          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
        }
        while (v16);
      }

    }
    v28 = (id)v50[5];

    _Block_object_dispose(&v49, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

uint64_t __73__PBFPosterSnapshotCoordinator__lock_removeSnapshotsAtURLs_checkIfOwner___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v13);
  v6 = v13;

  +[PBFPosterSnapshotReservation noteSnapshotWasReaped:](PBFPosterSnapshotReservation, "noteSnapshotWasReaped:", v3);
  if ((_DWORD)v5)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v7)
    {
      v8 = objc_opt_new();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v7, "addObject:", v3);
    PBFLogReaper();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v3;
      _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_DEFAULT, "Reaped snapshot: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    PBFLogReaper();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __73__PBFPosterSnapshotCoordinator__lock_removeSnapshotsAtURLs_checkIfOwner___block_invoke_cold_1((uint64_t)v3, (uint64_t)v6, v11);
  }

  return v5;
}

- (PFServerPosterPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_definitionToSnapshotReservationMap, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)snapshotReservationForDefinition:configuredProperties:context:.cold.1()
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

- (void)snapshotReservationForDefinition:configuredProperties:context:.cold.2()
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

- (void)snapshotReservationForDefinition:configuredProperties:context:.cold.4()
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

- (void)ingestSnapshotsByDefinition:path:configuredProperties:context:.cold.1()
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

- (void)ingestSnapshotsByDefinition:path:configuredProperties:context:.cold.2()
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

- (void)ingestSnapshotsByDefinition:path:configuredProperties:context:.cold.4()
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

- (void)snapshotExistsForDefinition:configuredProperties:context:.cold.1()
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

- (void)snapshotExistsForDefinition:configuredProperties:context:.cold.2()
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

- (void)snapshotExistsForDefinition:configuredProperties:context:.cold.3()
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

- (void)snapshotExistsForDefinition:configuredProperties:context:.cold.5()
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

void __73__PBFPosterSnapshotCoordinator__lock_removeSnapshotsAtURLs_checkIfOwner___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_ERROR, "Failed to reap snapshot '%{public}@': %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
