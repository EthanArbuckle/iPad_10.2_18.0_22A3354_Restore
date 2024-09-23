@implementation PBFWallpaperPublisher

- (PBFWallpaperPublisher)init
{
  PBFWallpaperPublisher *v2;
  uint64_t v3;
  PRSWallpaperPublisher *wallpaperPublisher;
  uint64_t v5;
  NSMutableDictionary *pathsByUUID;
  uint64_t v7;
  NSMutableDictionary *isPairedByUUID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PBFWallpaperPublisher;
  v2 = -[PBFWallpaperPublisher init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    wallpaperPublisher = v2->_wallpaperPublisher;
    v2->_wallpaperPublisher = (PRSWallpaperPublisher *)v3;

    -[PRSWallpaperPublisher setDelegate:](v2->_wallpaperPublisher, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 8);
    v5 = objc_claimAutoreleasedReturnValue();
    pathsByUUID = v2->_pathsByUUID;
    v2->_pathsByUUID = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
    v7 = objc_claimAutoreleasedReturnValue();
    isPairedByUUID = v2->_isPairedByUUID;
    v2->_isPairedByUUID = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (BOOL)_updatePath:(id)a3 addingIfNotExists:(BOOL)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL result;
  void *v14;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "identity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "posterUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_pathsByUUID, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "identity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v8, "isNewerVersionOfIdentity:", v12);
      if (v4)
      {
        -[NSMutableDictionary setObject:forKey:](self->_pathsByUUID, "setObject:forKey:", v7, v9);
        -[NSMutableDictionary removeObjectForKey:](self->_isPairedByUUID, "removeObjectForKey:", v9);
      }

    }
    else if (v4)
    {
      -[NSMutableDictionary setObject:forKey:](self->_pathsByUUID, "setObject:forKey:", v7, v9);
      LOBYTE(v4) = 1;
    }

    return v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("path"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFWallpaperPublisher _updatePath:addingIfNotExists:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_compact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSMutableDictionary *pathsByUUID;
  void *v12;
  NSMutableDictionary *isPairedByUUID;
  void *v14;
  id v15;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[NSMutableDictionary allKeys](self->_pathsByUUID, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E20];
  -[NSMutableDictionary allKeys](self->_isPairedByUUID, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; i != 4; ++i)
  {
    -[PFServerPosterPath identity](self->_paths[i], "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "posterUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "removeObject:", v10);
    objc_msgSend(v7, "removeObject:", v10);

  }
  pathsByUUID = self->_pathsByUUID;
  objc_msgSend(v15, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](pathsByUUID, "removeObjectsForKeys:", v12);

  isPairedByUUID = self->_isPairedByUUID;
  objc_msgSend(v7, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](isPairedByUUID, "removeObjectsForKeys:", v14);

}

- (void)_updateSelectedLockPath:(id)a3 selectedHomePath:(id)a4 activeLockPath:(id)a5 activeHomePath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  PFServerPosterPath **paths;
  void *v20;
  NSMutableDictionary *pathsByUUID;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  PFServerPosterPath *v27;
  uint64_t i;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31 = v10;
  v32 = v31;
  v30 = v11;
  v33 = v30;
  v29 = v12;
  v34 = v29;
  v14 = v13;
  v15 = 0;
  v16 = 0;
  v35 = v14;
  do
  {
    v17 = *(uint64_t *)((char *)&v32 + v15);
    if (v17)
      v16 |= -[PBFWallpaperPublisher _updatePath:addingIfNotExists:](self, "_updatePath:addingIfNotExists:", v17, 1, v29, v30, v31, v32, v33, v34, v35, v36);
    v15 += 8;
  }
  while (v15 != 32);
  v18 = 0;
  paths = self->_paths;
  do
  {
    v20 = *(id *)((char *)&v32 + v18 * 8);
    pathsByUUID = self->_pathsByUUID;
    if (v20)
    {
      objc_msgSend(*(id *)((char *)&v32 + v18 * 8), "identity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "posterUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](pathsByUUID, "objectForKey:", v23);
      v24 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[PFServerPosterPath identity](self->_paths[v18], "identity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "posterUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](pathsByUUID, "objectForKey:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
    }

    *(id *)((char *)&v32 + v18 * 8) = (id)v24;
    ++v18;
  }
  while (v18 != 4);
  v25 = 0;
  v26 = 0;
  do
  {
    v27 = (PFServerPosterPath *)*(&v32 + v25);
    if (*paths != v27)
    {
      v26 |= PRSWallpaperObserverLocationsFromIndex();
      objc_storeStrong((id *)paths, v27);
    }
    ++v25;
    ++paths;
  }
  while (v25 != 4);
  if ((v16 & 1) != 0)
    -[PBFWallpaperPublisher _compact](self, "_compact");
  if (v26 && -[PBFWallpaperPublisher _update](self, "_update"))
    -[PRSWallpaperPublisher updatePaths:](self->_wallpaperPublisher, "updatePaths:", self->_lastSentPaths);
  for (i = 24; i != -8; i -= 8)

}

- (unint64_t)_update
{
  uint64_t v2;
  unint64_t v3;
  PFServerPosterPath **paths;
  PFServerPosterPath **lastSentPaths;
  int v6;
  PFServerPosterPath *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  objc_class *v15;
  void *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  PBFWallpaperPublisher *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v2 = 0;
  v3 = 0;
  v29 = *MEMORY[0x1E0C80C00];
  paths = self->_paths;
  lastSentPaths = self->_lastSentPaths;
  do
  {
    v6 = PRSWallpaperObserverLocationsLockIndexIfHomeIndex();
    if ((PRSWallpaperObserverLocationsIndexIsValid() & 1) != 0)
    {
      v7 = paths[v6];
      -[PFServerPosterPath identity](v7, "identity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "posterUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKey:](self->_isPairedByUUID, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v20 = 0;
        objc_msgSend(MEMORY[0x1E0D7FB50], "loadHomeScreenConfigurationForPath:error:", v7, &v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v20;
        if (v12)
        {
          PRSLogObserver();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v15 = (objc_class *)objc_opt_class();
            NSStringFromClass(v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[PFServerPosterPath identity](v7, "identity");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v22 = v18;
            v23 = 2048;
            v24 = self;
            v25 = 2112;
            v26 = v17;
            v27 = 2114;
            v28 = v12;
            _os_log_error_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_ERROR, "<%{public}@:%p> failed to load homeConfig for %@ with error: %{public}@", buf, 0x2Au);

          }
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "selectedAppearanceType", v17) == 3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](self->_isPairedByUUID, "setObject:forKey:", v10, v9);

      }
      if (objc_msgSend(v10, "BOOLValue"))
        v14 = v2;
      else
        v14 = v6;

    }
    else
    {
      v14 = v2;
    }
    if (*lastSentPaths != paths[v14])
    {
      v3 |= PRSWallpaperObserverLocationsFromIndex();
      objc_storeStrong((id *)lastSentPaths, paths[v14]);
    }
    ++v2;
    ++lastSentPaths;
  }
  while (v2 != 4);
  return v3;
}

- (void)activateWithSelectedLockPath:(id)a3 selectedHomePath:(id)a4 activeLockPath:(id)a5 activeHomePath:(id)a6 recentlyChanged:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t i;
  NSMutableDictionary *pathsByUUID;
  void *v29;
  void *v30;
  PFServerPosterPath *v31;
  PFServerPosterPath *v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  _BOOL4 v42;
  _BYTE buf[24];
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v42 = a7;
  v53 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("selectedLockPath"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFWallpaperPublisher activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:].cold.1();
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA580BCLL);
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("selectedHomePath"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFWallpaperPublisher activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:].cold.2();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA58120);
  }
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("activeLockPath"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFWallpaperPublisher activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:].cold.3();
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA58184);
  }
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("activeHomePath"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFWallpaperPublisher activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:].cold.4();
    objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA581E8);
  }
  PRSLogObserver();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    PRSWallpaperObserverLocationsDescription();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identity");
    v41 = v13;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    *(_QWORD *)&buf[4] = v40;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    v44 = v39;
    v45 = 2114;
    v46 = v18;
    v47 = 2114;
    v48 = v19;
    v49 = 2114;
    v50 = v20;
    v51 = 2114;
    v52 = v21;
    _os_log_impl(&dword_1CB9FA000, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> received activation with recentlyChanged=(%{public}@) {\n\tsl=%{public}@\n\tsh=%{public}@\n\tal=%{public}@\n\tah=%{public}@\n}", buf, 0x48u);

    v13 = v41;
  }

  v22 = v11;
  *(_QWORD *)buf = v22;
  v23 = v12;
  *(_QWORD *)&buf[8] = v23;
  v24 = v13;
  *(_QWORD *)&buf[16] = v24;
  v25 = v15;
  v26 = 0;
  v44 = v25;
  do
  {
    -[PBFWallpaperPublisher _updatePath:addingIfNotExists:](self, "_updatePath:addingIfNotExists:", *(_QWORD *)&buf[v26], 1);
    v26 += 8;
  }
  while (v26 != 32);
  for (i = 0; i != 4; ++i)
  {
    pathsByUUID = self->_pathsByUUID;
    objc_msgSend(*(id *)&buf[i * 8], "identity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "posterUUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](pathsByUUID, "objectForKey:", v30);
    v31 = (PFServerPosterPath *)objc_claimAutoreleasedReturnValue();
    v32 = self->_paths[i];
    self->_paths[i] = v31;

  }
  -[PBFWallpaperPublisher _update](self, "_update");
  if (v42)
    v33 = 15;
  else
    v33 = 0;
  -[PRSWallpaperPublisher initializeWithPaths:recentlyChanged:](self->_wallpaperPublisher, "initializeWithPaths:recentlyChanged:", self->_lastSentPaths, v33);
  for (j = 24; j != -8; j -= 8)

}

- (void)updateSelectedLockPath:(id)a3 selectedHomePath:(id)a4 activeLockPath:(id)a5 activeHomePath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PBFWallpaperPublisher *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  PBFWallpaperPublisher *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  PRSLogObserver();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identity");
    v21 = self;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v23 = v16;
    v24 = 2048;
    v25 = v21;
    v26 = 2114;
    v27 = v17;
    v28 = 2114;
    v29 = v18;
    v30 = 2114;
    v31 = v19;
    v32 = 2114;
    v33 = v20;
    _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> received multi-update {\n\tsl=%{public}@\n\tsh=%{public}@\n\tal=%{public}@\n\tah=%{public}@\n}", buf, 0x3Eu);

    self = v21;
  }

  -[PBFWallpaperPublisher _updateSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:](self, "_updateSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:", v10, v11, v12, v13);
}

- (void)updatePath:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *pathsByUUID;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  PFServerPosterPath **paths;
  void *v19;
  int v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  PBFWallpaperPublisher *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("path"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFWallpaperPublisher updatePath:].cold.1();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA58610);
  }
  v5 = v4;
  PRSLogObserver();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v8;
    v24 = 2048;
    v25 = self;
    v26 = 2114;
    v27 = v9;
    _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> received single-update with %{public}@", buf, 0x20u);

  }
  pathsByUUID = self->_pathsByUUID;
  objc_msgSend(v5, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "posterUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pathsByUUID, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (!-[PBFWallpaperPublisher _updatePath:addingIfNotExists:](self, "_updatePath:addingIfNotExists:", v5, 0))
    {
      v14 = v13;

      v5 = v14;
    }
    objc_msgSend(v5, "identity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = 0;
    paths = self->_paths;
    do
    {
      -[PFServerPosterPath identity](*paths, "identity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v15, "isNewerVersionOfIdentity:", v19);

      if (v20)
      {
        v17 |= PRSWallpaperObserverLocationsFromIndex();
        objc_storeStrong((id *)paths, v5);
      }
      ++v16;
      ++paths;
    }
    while (v16 != 4);
    if (v17 && -[PBFWallpaperPublisher _update](self, "_update"))
      -[PRSWallpaperPublisher updatePaths:](self->_wallpaperPublisher, "updatePaths:", self->_lastSentPaths);

  }
}

- (void)updateHomePath:(id)a3 matchingLockPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  PBFWallpaperPublisher *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("lockPath"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFWallpaperPublisher updateHomePath:matchingLockPath:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA58874);
  }
  v8 = v7;
  PRSLogObserver();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v29 = v11;
    v30 = 2048;
    v31 = self;
    v32 = 2114;
    v33 = v12;
    v34 = 2114;
    v35 = v13;
    _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> received pairing-update {\n\thomePath=%{public}@\n\tmatchingLockPath=%{public}@\n}", buf, 0x2Au);

  }
  objc_msgSend(v8, "identity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "posterUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFServerPosterPath identity](self->_paths[0], "identity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "posterUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "isEqual:", v17);

  -[PFServerPosterPath identity](self->_paths[2], "identity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "posterUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v15, "isEqual:", v20);

  if ((v18 & 1) != 0 || v21)
  {
    if (v6)
      v22 = v6;
    else
      v22 = v8;
    if (v18)
      v23 = v8;
    else
      v23 = 0;
    if (v18)
      v24 = v22;
    else
      v24 = 0;
    if (v21)
      v25 = v8;
    else
      v25 = 0;
    if (v21)
      v26 = v22;
    else
      v26 = 0;
    -[PBFWallpaperPublisher _updateSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:](self, "_updateSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:", v23, v24, v25, v26);
  }

}

- (void)noteSnapshotUpdateForPath:(id)a3 snapshotType:(id)a4
{
  -[PRSWallpaperPublisher noteSnapshotUpdateForPath:snapshotType:](self->_wallpaperPublisher, "noteSnapshotUpdateForPath:snapshotType:", a3, a4);
}

- (void)issueUpdateForRoles:(id)a3
{
  -[PRSWallpaperPublisher issueUpdateForRoles:](self->_wallpaperPublisher, "issueUpdateForRoles:", a3);
}

- (void)activatePublishingOfRoles:(id)a3
{
  -[PRSWallpaperPublisher initializeRoles:](self->_wallpaperPublisher, "initializeRoles:", a3);
}

- (void)activatePublishingOfCollectionsForRole:(id)a3
{
  -[PRSWallpaperPublisher initializePosterCollectionForRoles:](self->_wallpaperPublisher, "initializePosterCollectionForRoles:", a3);
}

- (void)issuePosterCollectionUpdate:(id)a3
{
  -[PRSWallpaperPublisher issuePosterCollectionUpdate:](self->_wallpaperPublisher, "issuePosterCollectionUpdate:", a3);
}

- (void)wallpaperPublisherDidReceiveObserverConnection
{
  -[PBFWallpaperPublisherDelegate wallpaperPublisherDidReceiveObserverConnection](self->_delegate, "wallpaperPublisherDidReceiveObserverConnection");
}

- (PBFWallpaperPublisherDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_isPairedByUUID, 0);
  objc_storeStrong((id *)&self->_pathsByUUID, 0);
  for (i = 72; i != 40; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i != 8);
  objc_storeStrong((id *)&self->_wallpaperPublisher, 0);
}

- (void)_updatePath:addingIfNotExists:.cold.1()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:.cold.1()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:.cold.2()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:.cold.3()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:.cold.4()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)updatePath:.cold.1()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)updateHomePath:matchingLockPath:.cold.1()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
