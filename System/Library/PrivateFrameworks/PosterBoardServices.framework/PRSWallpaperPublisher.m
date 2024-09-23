@implementation PRSWallpaperPublisher

- (PRSWallpaperPublisher)init
{
  PRSWallpaperPublisher *v2;
  PRSWallpaperPublisher *v3;
  void *v4;
  PRSWallpaperPublisher *v5;
  uint64_t v6;
  BSServiceConnectionListener *listener;
  uint64_t v8;
  NSMutableSet *lock_clients;
  int64x2_t v10;
  uint64_t v11;
  NSMutableDictionary *lock_roleToPath;
  uint64_t v13;
  NSMutableDictionary *lock_roleToPosterCollections;
  _QWORD v16[4];
  PRSWallpaperPublisher *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PRSWallpaperPublisher;
  v2 = -[PRSWallpaperPublisher init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0D03460];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __29__PRSWallpaperPublisher_init__block_invoke;
    v16[3] = &unk_1E4D42890;
    v5 = v2;
    v17 = v5;
    objc_msgSend(v4, "listenerWithConfigurator:", v16);
    v6 = objc_claimAutoreleasedReturnValue();
    listener = v5->_listener;
    v5->_listener = (BSServiceConnectionListener *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    lock_clients = v5->_lock_clients;
    v5->_lock_clients = (NSMutableSet *)v8;

    memset_pattern16(v5->_lock_changeVersionTimestamps, &unk_1A49D71C0, 0x20uLL);
    v10 = vdupq_n_s64(1uLL);
    *(int64x2_t *)v5->_lock_changeVersions = v10;
    *(int64x2_t *)&v5->_lock_changeVersions[2] = v10;
    v11 = objc_opt_new();
    lock_roleToPath = v5->_lock_roleToPath;
    v5->_lock_roleToPath = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    lock_roleToPosterCollections = v5->_lock_roleToPosterCollections;
    v5->_lock_roleToPosterCollections = (NSMutableDictionary *)v13;

    -[BSServiceConnectionListener activate](v5->_listener, "activate");
  }
  return v3;
}

void __29__PRSWallpaperPublisher_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setDomain:", CFSTR("com.apple.posterboardservices"));
  PRSWallpaperObserverInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setService:", v4);

  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (PRSWallpaperPublisherDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  PRSWallpaperPublisherDelegate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_delegate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDelegate:(id)a3
{
  PRSWallpaperPublisherDelegate *v4;
  PRSWallpaperPublisherDelegate *lock_delegate;

  v4 = (PRSWallpaperPublisherDelegate *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_delegate = self->_lock_delegate;
  self->_lock_delegate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)_lock_descriptionIfInvalidPaths:(const void *)a3
{
  void *v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  PFServerPosterPath **lock_paths;
  PFServerPosterPath *v16;
  void *v17;
  void *v18;
  PFServerPosterPath *v19;
  PFServerPosterPath *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t i;
  const void *v27;
  uint64_t v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t j;
  PFServerPosterPath *v35;
  uint64_t v36;
  void *v37;
  objc_class *v38;
  void *v39;
  PFServerPosterPath *v40;
  void *v41;
  void *v43;

  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0;
  do
  {
    v8 = (void *)a3[v6];
    if (!v8)
      break;
    objc_msgSend(v8, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "posterUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = a3[v6];
    if (v11)
    {
      if (v11 != v13)
      {

        break;
      }
    }
    else
    {
      objc_msgSend(v5, "setObject:forKey:", v13, v10);
    }

    v7 = v6++ > 2;
  }
  while (v6 != 4);
  v14 = 0;
  lock_paths = self->_lock_paths;
  do
  {
    v16 = lock_paths[v14];
    if (v16)
    {
      -[PFServerPosterPath identity](v16, "identity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "posterUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "objectForKey:", v18);
      v19 = (PFServerPosterPath *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        if (v19 != lock_paths[v14])
        {
          -[PFServerPosterPath identity](v19, "identity");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PFServerPosterPath identity](lock_paths[v14], "identity");
          v22 = v5;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v21, "isNewerVersionOfIdentity:", v23);

          v5 = v22;
          if (!v24)
          {

            goto LABEL_18;
          }
        }
      }

    }
    ++v14;
  }
  while (v14 != 4);
  if (v7)
  {
    v25 = 0;
    goto LABEL_29;
  }
LABEL_18:
  v43 = v5;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("received invalid paths: {"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 4; ++i)
  {
    v27 = a3[i];
    v28 = PRSWallpaperObserverLocationsFromIndex(i);
    PRSWallpaperObserverLocationsDescription(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    if (v27)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)a3[i];
      objc_msgSend(v32, "identity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "appendFormat:", CFSTR("\n %i-%@: <%@:%p %@>"), i, v29, v31, v32, v33);

    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "appendFormat:", CFSTR("\n %i-%@: <%@:nil ->"), i, v29, v31);
    }

  }
  objc_msgSend(v25, "appendString:", CFSTR("\n}\ncompared to previous: {"));
  for (j = 0; j != 4; ++j)
  {
    v35 = lock_paths[j];
    v36 = PRSWallpaperObserverLocationsFromIndex(j);
    PRSWallpaperObserverLocationsDescription(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    if (v35)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = lock_paths[j];
      -[PFServerPosterPath identity](v40, "identity");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "appendFormat:", CFSTR("\n %i-%@: <%@:%p %@>"), j, v37, v39, v40, v41);

    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "appendFormat:", CFSTR("\n %i-%@: <%@:nil ->"), j, v37, v39);
    }

  }
  objc_msgSend(v25, "appendString:", CFSTR("\n}"));
  v5 = v43;
LABEL_29:

  return v25;
}

- (void)initializeWithPaths:(const void *)a3 recentlyChanged:(unint64_t)a4
{
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), a4, CFSTR("paths"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperPublisher initializeWithPaths:recentlyChanged:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B1828);
  }
  os_unfair_lock_lock(&self->_lock);
  -[PRSWallpaperPublisher _lock_descriptionIfInvalidPaths:](self, "_lock_descriptionIfInvalidPaths:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = v7;
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperPublisher initializeWithPaths:recentlyChanged:].cold.2();
    goto LABEL_11;
  }
  -[PRSWallpaperPublisher _lock_activateClientsIfNeeded](self, "_lock_activateClientsIfNeeded");
  for (i = 0; i != 4; ++i)
    objc_storeStrong((id *)&self->_lock_paths[i], (id)a3[i]);
  -[PRSWallpaperPublisher _lock_noteChanged:](self, "_lock_noteChanged:", a4);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)initializeRoles:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    os_unfair_lock_lock(&self->_lock);
    -[PRSWallpaperPublisher _lock_activateClientsIfNeeded](self, "_lock_activateClientsIfNeeded");
    -[NSMutableDictionary removeAllObjects](self->_lock_roleToPath, "removeAllObjects");
    -[PRSWallpaperPublisher _lock_issueUpdateForRoles:](self, "_lock_issueUpdateForRoles:", v6);
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roles"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperPublisher initializeRoles:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)updatePaths:(const void *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  PFServerPosterPath **lock_paths;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("paths"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperPublisher updatePaths:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B1A88);
  }
  os_unfair_lock_lock(&self->_lock);
  -[PRSWallpaperPublisher _lock_descriptionIfInvalidPaths:](self, "_lock_descriptionIfInvalidPaths:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10 = v5;
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperPublisher updatePaths:].cold.3();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B1AF0);
  }
  if (!self->_lock_activated)
  {
    os_unfair_lock_unlock(&self->_lock);
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@:%p> received multi-update before activation"), v14, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperPublisher updatePaths:].cold.2();
    goto LABEL_19;
  }
  v6 = 0;
  v7 = 0;
  lock_paths = self->_lock_paths;
  do
  {
    if (*lock_paths != a3[v6])
    {
      v7 |= PRSWallpaperObserverLocationsFromIndex(v6);
      objc_storeStrong((id *)lock_paths, (id)a3[v6]);
    }
    ++v6;
    ++lock_paths;
  }
  while (v6 != 4);
  if (v7)
    -[PRSWallpaperPublisher _lock_noteChanged:](self, "_lock_noteChanged:", v7);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)issueUpdateForRoles:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PRSWallpaperPublisher _lock_activateClientsIfNeeded](self, "_lock_activateClientsIfNeeded");
  -[PRSWallpaperPublisher _lock_issueUpdateForRoles:](self, "_lock_issueUpdateForRoles:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)noteSnapshotUpdateForPath:(id)a3 snapshotType:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    os_unfair_lock_lock(&self->_lock);
    -[PRSWallpaperPublisher _lock_activateClientsIfNeeded](self, "_lock_activateClientsIfNeeded");
    -[PRSWallpaperPublisher _lock_noteSnapshotUpdateForPath:snapshotType:](self, "_lock_noteSnapshotUpdateForPath:snapshotType:", v8, v6);
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("snapshotUpdatedForPath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperPublisher noteSnapshotUpdateForPath:snapshotType:].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)initializePosterCollectionForRoles:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    os_unfair_lock_lock(&self->_lock);
    -[PRSWallpaperPublisher _lock_activateClientsIfNeeded](self, "_lock_activateClientsIfNeeded");
    -[NSMutableDictionary removeAllObjects](self->_lock_roleToPosterCollections, "removeAllObjects");
    -[PRSWallpaperPublisher _lock_issuePosterCollectionUpdate:](self, "_lock_issuePosterCollectionUpdate:", v6);
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("posterCollectionToRole"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperPublisher initializePosterCollectionForRoles:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)issuePosterCollectionUpdate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PRSWallpaperPublisher _lock_activateClientsIfNeeded](self, "_lock_activateClientsIfNeeded");
  -[PRSWallpaperPublisher _lock_issuePosterCollectionUpdate:](self, "_lock_issuePosterCollectionUpdate:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD *v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  PRSWallpaperPublisherDelegate *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  PRSWallpaperPublisher *v44;
  id v45;
  id v46;
  id location;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  PRSWallpaperPublisher *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "remoteProcess");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "hasEntitlement:", CFSTR("com.apple.posterboardservices.data-store.accessSwitcherConfiguration")))
  {
    objc_initWeak(&location, self);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_new();
    objc_storeWeak((id *)(v11 + 8), self);
    objc_storeStrong((id *)(v11 + 16), a4);
    *(_BYTE *)(v11 + 113) = objc_msgSend(v9, "decodeBoolForKey:", CFSTR("needsSandboxExtensions"));
    *(_QWORD *)(v11 + 104) = objc_msgSend(v9, "decodeUInt64ForKey:", CFSTR("observedLocations")) & 0xF;
    *(_BYTE *)(v11 + 114) = objc_msgSend(v9, "decodeBoolForKey:", CFSTR("snapshotObservation"));
    *(_BYTE *)(v11 + 115) = *(_QWORD *)(v11 + 104) != 0;
    v12 = objc_msgSend(v9, "decodeBoolForKey:", CFSTR("collectionObserving"));
    *(_BYTE *)(v11 + 153) = v12;
    if (v12)
    {
      *(_BYTE *)(v11 + 152) = objc_msgSend(v9, "decodeBoolForKey:", CFSTR("collectionObservingNeedsSandboxExtensions"));
      objc_opt_self();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "decodeObjectOfClass:forKey:", v13, CFSTR("collectionObservingRole"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(v11 + 144);
      *(_QWORD *)(v11 + 144) = v14;

    }
    v16 = objc_msgSend(v9, "decodeBoolForKey:", CFSTR("roleObservation"));
    *(_BYTE *)(v11 + 129) = v16;
    if (v16)
    {
      *(_BYTE *)(v11 + 128) = objc_msgSend(v9, "decodeBoolForKey:", CFSTR("observedRolesNeedSandboxExtensions"));
      objc_opt_self();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "decodeCollectionOfClass:containingClass:forKey:", v17, v18, CFSTR("observedRoles"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(v11 + 120);
      *(_QWORD *)(v11 + 120) = v19;

    }
    objc_msgSend(v9, "decodeStringForKey:", CFSTR("explanation"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    __clientDescription(v40, v21, v8, *(_QWORD *)(v11 + 104));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(void **)(v11 + 32);
    *(_QWORD *)(v11 + 32) = v22;

    v24 = v22;
    if (*(_BYTE *)(v11 + 115) || *(_BYTE *)(v11 + 114) || *(_BYTE *)(v11 + 129) || *(_BYTE *)(v11 + 153))
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __67__PRSWallpaperPublisher_listener_didReceiveConnection_withContext___block_invoke;
      v41[3] = &unk_1E4D42C58;
      v25 = (id)v11;
      v42 = v25;
      objc_copyWeak(&v46, &location);
      v26 = v38;
      v43 = v26;
      v44 = self;
      v27 = v24;
      v28 = v24;
      v45 = v28;
      objc_msgSend(v8, "configureConnection:", v41);
      PRSLogObserver();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v49 = v26;
        v50 = 2048;
        v51 = self;
        v52 = 2114;
        v53 = v28;
        _os_log_impl(&dword_1A4996000, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> client %{public}@ connected", buf, 0x20u);
      }

      v24 = v27;
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableSet addObject:](self->_lock_clients, "addObject:", v25);
      if (self->_lock_activated)
      {
        objc_msgSend(v8, "activate");
        objc_msgSend(v8, "remoteTarget");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v25[3];
        v25[3] = v30;

      }
      v32 = self->_lock_delegate;
      os_unfair_lock_unlock(&self->_lock);
      -[PRSWallpaperPublisherDelegate wallpaperPublisherDidReceiveObserverConnection](v32, "wallpaperPublisherDidReceiveObserverConnection");

      objc_destroyWeak(&v46);
    }
    else
    {
      PRSLogObserver();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v49 = v38;
        v50 = 2048;
        v51 = self;
        v52 = 2114;
        v53 = v24;
        _os_log_impl(&dword_1A4996000, v37, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> rejecting client %{public}@ that doesn't want to observe anything", buf, 0x20u);
      }

      objc_msgSend(v8, "invalidate");
    }

    objc_destroyWeak(&location);
  }
  else
  {
    PRSLogObserver();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      __clientDescription(v40, CFSTR("?"), v8, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v35;
      v50 = 2048;
      v51 = self;
      v52 = 2114;
      v53 = v36;
      _os_log_impl(&dword_1A4996000, v33, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> rejecting client %{public}@ that isn't entitled", buf, 0x20u);

    }
    objc_msgSend(v8, "invalidate");
  }

}

void __67__PRSWallpaperPublisher_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  PRSDefaultServiceQuality();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  PRSWallpaperObserverInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__PRSWallpaperPublisher_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E4D42C30;
  objc_copyWeak(&v14, (id *)(a1 + 64));
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v9);

  objc_destroyWeak(&v14);
}

void __67__PRSWallpaperPublisher_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  PRSLogObserver();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 138543874;
    v8 = v4;
    v9 = 2048;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1A4996000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> client %{public}@ invalidated remotely", (uint8_t *)&v7, 0x20u);
  }

  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 36);
    objc_msgSend(*((id *)WeakRetained + 14), "removeObject:", *(_QWORD *)(a1 + 56));
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 36);
  }

}

- (void)_initializeClient:(id)a3 withKnownIdentities:(id)a4 knownRoles:(id)a5 knownCollection:(id)a6
{
  id *v10;
  id v11;
  PRSWallpaperPublisher *v12;
  id v13;
  id v14;
  id *v15;
  id v16;
  id v17;
  os_unfair_lock_s *p_lock;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  uint8x8_t v28;
  int v29;
  unint64_t v30;
  double v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id *v49;
  uint64_t v50;
  id v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  uint64_t v59;
  NSObject *v60;
  _BOOL4 v61;
  objc_class *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  objc_class *v67;
  void *v68;
  id v69;
  uint64_t v70;
  NSObject *v71;
  _BOOL4 v72;
  objc_class *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  objc_class *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  os_unfair_lock_s *v83;
  id v84;
  id *v85;
  void *v86;
  PRSWallpaperPublisher *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[2];
  void (*v93)(_QWORD *);
  void *v94;
  id v95;
  PRSWallpaperPublisher *v96;
  char *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  PRSWallpaperPublisher *v105;
  __int16 v106;
  id v107;
  __int16 v108;
  void *v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v10 = (id *)a3;
  v11 = a4;
  v12 = self;
  v13 = v11;
  v14 = a5;
  v15 = v10;
  v16 = v14;
  v17 = a6;
  p_lock = &self->_lock;
  os_unfair_lock_lock(p_lock);
  if (!-[NSMutableSet containsObject:](v12->_lock_clients, "containsObject:", v10))
    goto LABEL_72;
  v84 = v17;
  v85 = v10;
  v87 = v12;
  v81 = v16;
  v82 = v13;
  v83 = p_lock;
  if (*((_BYTE *)v10 + 115))
  {
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v19 = v13;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v99;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v99 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
          objc_msgSend(v24, "identity");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = (unint64_t)v15[13] & objc_msgSend(v24, "locations");
            if (v26)
            {
              v92[0] = MEMORY[0x1E0C809B0];
              v92[1] = 3221225472;
              v93 = (void (*)(_QWORD *))__90__PRSWallpaperPublisher__initializeClient_withKnownIdentities_knownRoles_knownCollection___block_invoke;
              v94 = &unk_1E4D42C80;
              v95 = v25;
              v96 = v12;
              v97 = v15;
              v27 = v92;
              buf[0] = 0;
              v28 = (uint8x8_t)vcnt_s8((int8x8_t)v26);
              v28.i16[0] = vaddlv_u8(v28);
              v29 = v28.i32[0];
              if (v28.i32[0])
              {
                v30 = 0;
                do
                {
                  if (((1 << v30) & v26) != 0)
                  {
                    v93(v27);
                    if (buf[0])
                      break;
                    --v29;
                  }
                  if (v30 > 0x3E)
                    break;
                  ++v30;
                }
                while (v29 > 0);
              }

              v15 = v85;
              v12 = v87;
            }
          }

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
      }
      while (v21);
    }

    BSAbsoluteMachTimeNow();
    v32 = 0;
    v16 = v81;
    v13 = v82;
    v17 = v84;
    do
    {
      v15[v32 + 9] = (id)(v12->_lock_changeVersions[v32] - (v31 <= v12->_lock_changeVersionTimestamps[v32] + 1.0));
      ++v32;
    }
    while (v32 != 4);
  }
  if (*((_BYTE *)v15 + 129))
  {
    if (objc_msgSend(v16, "count"))
    {
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v33 = v16;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
      if (v34)
      {
        v35 = v34;
        v86 = 0;
        v36 = *(_QWORD *)v89;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v89 != v36)
              objc_enumerationMutation(v33);
            v38 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
            objc_msgSend(v38, "role");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "activePath");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](v12->_lock_roleToPath, "objectForKey:", v39);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "identity");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "identity");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v42, "isEqual:", v43);

            if ((v44 & 1) != 0)
            {
              v12 = v87;
            }
            else
            {
              v45 = v86;
              if (!v86)
                v45 = (void *)objc_opt_new();
              v12 = v87;
              -[NSMutableDictionary objectForKey:](v87->_lock_roleToPath, "objectForKey:", v39);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = v45;
              objc_msgSend(v45, "setObject:forKeyedSubscript:", v46, v39);

            }
          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
        }
        while (v35);
      }
      else
      {
        v86 = 0;
      }

      v17 = v84;
      v15 = v85;
      v16 = v81;
      v13 = v82;
      p_lock = v83;
    }
    else
    {
      v86 = (void *)-[NSMutableDictionary mutableCopy](v12->_lock_roleToPath, "mutableCopy");
    }
  }
  else
  {
    v86 = 0;
  }
  if (*((_BYTE *)v15 + 153))
  {
    if (v17)
    {
      objc_msgSend(v17, "posterCollection");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");
      v49 = v15;
      v50 = objc_msgSend(v15[17], "count");

      if (v48 != v50)
      {
        v15 = v49;
        if (!objc_msgSend(v49[17], "count"))
        {
LABEL_51:
          v51 = 0;
          goto LABEL_52;
        }
        v52 = 0;
        while (1)
        {
          objc_msgSend(v15[17], "objectAtIndexedSubscript:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "posterCollection");
          v49 = v15;
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectAtIndex:", v52);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v53, "serverIdentity");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "serverIdentity");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v56, "isEqual:", v57);

          v12 = v87;
          if ((v58 & 1) == 0)
            break;
          ++v52;
          v15 = v49;
          if (v52 >= objc_msgSend(v49[17], "count"))
            goto LABEL_51;
        }
      }
      v51 = v49[17];
      v15 = v49;
LABEL_52:
      p_lock = v83;
      goto LABEL_53;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](v12->_lock_roleToPosterCollections, "objectForKeyedSubscript:", v15[18]);
    v51 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v51 = 0;
  }
LABEL_53:
  *((_BYTE *)v15 + 112) = 1;
  if (*((_BYTE *)v15 + 115))
    -[PRSWallpaperPublisher _lock_sendStateToClient:](v12, "_lock_sendStateToClient:", v15);
  if (*((_BYTE *)v15 + 129))
  {
    v59 = objc_msgSend(v86, "count");
    PRSLogObserver();
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
    if (v59)
    {
      if (v61)
      {
        v62 = (objc_class *)objc_opt_class();
        NSStringFromClass(v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v85[4];
        objc_msgSend(v86, "allKeys");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v103 = v63;
        v104 = 2048;
        v105 = v87;
        v106 = 2114;
        v107 = v64;
        v12 = v87;
        v108 = 2114;
        v109 = v65;
        _os_log_impl(&dword_1A4996000, v60, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> issuing initial update to client %{public}@; data was stale for roles %{public}@",
          buf,
          0x2Au);

      }
      v66 = v85[3];
      -[PRSWallpaperPublisher _lock_buildActivePosterObserverUpdatesForClient:updatedRoles:](v12, "_lock_buildActivePosterObserverUpdatesForClient:updatedRoles:");
      v60 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "notifyRoleActivePosterUpdates:", v60);
    }
    else if (v61)
    {
      v67 = (objc_class *)objc_opt_class();
      NSStringFromClass(v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v85[4];
      *(_DWORD *)buf = 138543874;
      v103 = v68;
      v104 = 2048;
      v105 = v12;
      v106 = 2114;
      v107 = v69;
      _os_log_impl(&dword_1A4996000, v60, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> bailing on initial update to client %{public}@; data was up-to-date",
        buf,
        0x20u);

    }
  }
  if (*((_BYTE *)v85 + 153))
  {
    v70 = objc_msgSend(v51, "count");
    PRSLogObserver();
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT);
    if (v70)
    {
      if (v72)
      {
        v73 = (objc_class *)objc_opt_class();
        NSStringFromClass(v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v85[4];
        v76 = v85[18];
        *(_DWORD *)buf = 138544130;
        v103 = v74;
        v104 = 2048;
        v105 = v12;
        v106 = 2114;
        v107 = v75;
        v108 = 2114;
        v109 = v76;
        _os_log_impl(&dword_1A4996000, v71, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> issuing initial update to client %{public}@; data was stale for poster collection role %{public}@",
          buf,
          0x2Au);

      }
      v77 = v85[3];
      -[PRSWallpaperPublisher _lock_buildPosterCollectionUpdatesForClient:role:updatedPosterCollection:](v12, "_lock_buildPosterCollectionUpdatesForClient:role:updatedPosterCollection:", v85, v85[18], v51);
      v71 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "notifyRolePosterCollectionUpdates:", v71);
    }
    else if (v72)
    {
      v78 = (objc_class *)objc_opt_class();
      NSStringFromClass(v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v85[4];
      *(_DWORD *)buf = 138543874;
      v103 = v79;
      v104 = 2048;
      v105 = v12;
      v106 = 2114;
      v107 = v80;
      _os_log_impl(&dword_1A4996000, v71, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> bailing on initial update to client %{public}@ for known poster collection; data was up-to-date",
        buf,
        0x20u);

    }
  }

  v17 = v84;
  v15 = v85;
LABEL_72:
  os_unfair_lock_unlock(p_lock);

}

void __90__PRSWallpaperPublisher__initializeClient_withKnownIdentities_knownRoles_knownCollection___block_invoke(_QWORD *a1, uint64_t a2)
{
  int v3;
  void *v4;
  void *v5;

  v3 = PRSWallpaperObserverLocationsToIndex(a2);
  v4 = (void *)a1[4];
  objc_msgSend(*(id *)(a1[5] + 8 * v3 + 40), "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isEqual:", v5);

  if ((_DWORD)v4)
    objc_storeStrong((id *)(a1[6] + 8 * v3 + 40), *(id *)(a1[5] + 8 * v3 + 40));
}

- (void)_initializeClient:(id)a3
{
  _BYTE *v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableSet containsObject:](self->_lock_clients, "containsObject:", v4))
    v4[112] = 1;
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_lock_sendStateToClient:(id)a3
{
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  Class *v9;
  Class v10;
  Class *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PFServerPosterPath *v19;
  id *v20;
  uint64_t v21;
  void **v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  unsigned int v48;
  id obj;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  PRSWallpaperPublisher *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  id v69[5];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!v4[115])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client is not observing changes for this; abort"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperPublisher _lock_sendStateToClient:].cold.1();
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B35ECLL);
  }
  v5 = 0;
  v50 = 0;
  v6 = 0;
  v7 = 4;
  do
  {
    v8 = PRSWallpaperObserverLocationsFromIndex(v5);
    if ((v8 & ~*((_QWORD *)v4 + 13)) != 0)
      goto LABEL_8;
    v9 = &self->super.isa + v5;
    v10 = v9[9];
    v11 = (Class *)&v4[8 * v5];
    if (v10 == v11[9])
    {
      if (v11[5] == v9[5])
        goto LABEL_8;
      if (!v6)
      {
LABEL_11:
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v11[9] = v10;
      v50 |= v8;
      if (!v6)
        goto LABEL_11;
    }
    objc_msgSend(v6, "addObject:", self->_lock_paths[v5]);
LABEL_8:
    ++v5;
    --v7;
  }
  while (v5 != 4);
  if (objc_msgSend(v6, "count"))
  {
    v12 = 0;
    v48 = 0;
    memset(v69, 0, 32);
    do
    {
      v13 = *(void **)&v4[v12 + 40];
      if (v13)
        objc_storeStrong(&v69[v48++], v13);
      v12 += 8;
    }
    while (v12 != 32);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v43 = v6;
    obj = v6;
    v15 = v48;
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    if (v52)
    {
      v51 = *(_QWORD *)v55;
      v47 = v14;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v55 != v51)
            objc_enumerationMutation(obj);
          v17 = 0;
          v18 = 0;
          v19 = *(PFServerPosterPath **)(*((_QWORD *)&v54 + 1) + 8 * v16);
          v20 = (id *)(v4 + 40);
          do
          {
            v21 = PRSWallpaperObserverLocationsFromIndex(v17);
            if ((v21 & ~*((_QWORD *)v4 + 13)) == 0 && self->_lock_paths[v17] == v19)
            {
              v18 |= v21;
              objc_storeStrong(v20, v19);
            }
            ++v17;
            ++v20;
          }
          while (v17 != 4);
          if (v15 < 1)
          {
LABEL_31:
            v24 = (void *)objc_opt_new();
            if (v4[113])
            {
              objc_msgSend(*((id *)v4 + 2), "remoteProcess");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "auditToken");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v26;
              if (v26 && (objc_msgSend(v26, "isInvalid") & 1) == 0)
              {
                v53 = 0;
                -[PFServerPosterPath extendContentsReadAccessToAuditToken:error:](v19, "extendContentsReadAccessToAuditToken:error:", v27, &v53);
                v29 = objc_claimAutoreleasedReturnValue();
                v46 = v53;
                if (v29)
                {
                  v30 = (void *)v29;
                  objc_msgSend(v24, "setPath:", v29);
                }
                else
                {
                  PRSLogObserver();
                  v31 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                  {
                    v35 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v35);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PFServerPosterPath identity](v19, "identity");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = (void *)*((_QWORD *)v4 + 4);
                    *(_DWORD *)buf = 138544386;
                    v59 = v45;
                    v60 = 2048;
                    v61 = self;
                    v62 = 2114;
                    v63 = v44;
                    v64 = 2114;
                    v65 = v36;
                    v66 = 2114;
                    v67 = v27;
                    _os_log_error_impl(&dword_1A4996000, v31, OS_LOG_TYPE_ERROR, "<%{public}@:%p> failed to prepare update of %{public}@ for client %{public}@ due to bad auditToken %{public}@", buf, 0x34u);

                  }
                  v32 = v31;
                  v30 = 0;

                }
                objc_msgSend(v24, "path");
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v33)
                  objc_msgSend(v24, "setPath:", v19);

              }
              else
              {
                objc_msgSend(v24, "setPath:", v19);
              }

              v14 = v47;
              v15 = v48;
            }
            objc_msgSend(v24, "setChanged:", v18 & v50);
            objc_msgSend(v24, "path");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v34)
              objc_msgSend(v24, "setPath:", v19);
          }
          else
          {
            v22 = v69;
            v23 = v48;
            while (v19 != *v22)
            {
              ++v22;
              if (!--v23)
                goto LABEL_31;
            }
            v24 = (void *)objc_opt_new();
            -[PFServerPosterPath identity](v19, "identity");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setIdentity:", v28);

          }
          objc_msgSend(v24, "setLocations:", v18);
          objc_msgSend(v14, "addObject:", v24);

          ++v16;
        }
        while (v16 != v52);
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      }
      while (v52);
    }

    PRSLogObserver();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)*((_QWORD *)v4 + 4);
      *(_DWORD *)buf = 138544130;
      v59 = v39;
      v60 = 2048;
      v61 = self;
      v62 = 2114;
      v63 = v40;
      v64 = 2114;
      v65 = v14;
      _os_log_impl(&dword_1A4996000, v37, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> notifying client %{public}@ of updates=%{public}@", buf, 0x2Au);

    }
    objc_msgSend(*((id *)v4 + 3), "notifyWallpaperUpdates:", v14);

    v41 = 3;
    v6 = v43;
    do

    while (v41 != -1);
  }

}

- (void)_lock_noteChanged:(unint64_t)a3
{
  objc_class *v5;
  objc_class *v6;
  uint64_t i;
  Class *v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (a3)
  {
    BSAbsoluteMachTimeNow();
    v6 = v5;
    for (i = 0; i != 4; ++i)
    {
      if ((PRSWallpaperObserverLocationsFromIndex(i) & ~a3) == 0)
      {
        v8 = &self->super.isa + i;
        v8[9] = (Class)((char *)v8[9] + 1);
        v8[1] = v6;
      }
    }
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_lock_clients;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j);
        if (*(_BYTE *)(v14 + 112) && *(_BYTE *)(v14 + 115))
          -[PRSWallpaperPublisher _lock_sendStateToClient:](self, "_lock_sendStateToClient:", (_QWORD)v15);
      }
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)_lock_noteSnapshotUpdateForPath:(id)a3 snapshotType:(id)a4
{
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  PRSWallpaperObserverSnapshotUpdate *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  PRSWallpaperObserverSnapshotUpdate *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  PRSWallpaperPublisher *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  PRSWallpaperObserverSnapshotUpdate *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v19 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_lock_clients;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (*(_BYTE *)(v12 + 112) && *(_BYTE *)(v12 + 114))
        {
          if (!v9)
            v9 = -[PRSWallpaperObserverSnapshotUpdate initWithPath:snapshotType:]([PRSWallpaperObserverSnapshotUpdate alloc], "initWithPath:snapshotType:", v20, v19);
          PRSLogObserver();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = *(_QWORD *)(v12 + 32);
            *(_DWORD *)buf = 138544130;
            v27 = v15;
            v28 = 2048;
            v29 = self;
            v30 = 2114;
            v31 = v16;
            v32 = 2114;
            v33 = v9;
            _os_log_impl(&dword_1A4996000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> notifying client %{public}@ of snapshot updates=%{public}@", buf, 0x2Au);

          }
          v17 = *(void **)(v12 + 24);
          v25 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "notifySnapshotUpdates:", v18);

        }
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

}

- (void)_lock_issueUpdateForRoles:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSMutableSet *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  id v31;
  void *obj;
  void *v33;
  PRSWallpaperPublisher *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  PRSWallpaperPublisher *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v34 = self;
  if (!self->_lock_activated)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@:%p> received multi-update before role activation"), v29, self);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperPublisher _lock_issueUpdateForRoles:].cold.1();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B3D20);
  }
  v33 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v4, "keyEnumerator");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        v10 = v4;
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v34->_lock_roleToPath, "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serverIdentity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "serverIdentity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if ((v15 & 1) == 0)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v34->_lock_roleToPath, "setObject:forKeyedSubscript:", v11, v9);
          objc_msgSend(v33, "setObject:forKey:", v11, v9);
        }

        v4 = v10;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v33, "count"))
  {
    v31 = v4;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v16 = v34->_lock_clients;
    v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v36 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
          -[PRSWallpaperPublisher _lock_buildActivePosterObserverUpdatesForClient:updatedRoles:](v34, "_lock_buildActivePosterObserverUpdatesForClient:updatedRoles:", v21, v33);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "count"))
          {
            PRSLogObserver();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v24 = (objc_class *)objc_opt_class();
              NSStringFromClass(v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = *(_QWORD *)(v21 + 32);
              *(_DWORD *)buf = 138544130;
              v44 = v25;
              v45 = 2048;
              v46 = v34;
              v47 = 2114;
              v48 = v26;
              v49 = 2114;
              v50 = v22;
              _os_log_impl(&dword_1A4996000, v23, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> notifying client %{public}@ of role observer updates=%{public}@", buf, 0x2Au);

            }
            objc_msgSend(*(id *)(v21 + 24), "notifyRoleActivePosterUpdates:", v22);
          }

        }
        v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
      }
      while (v18);
    }

    v4 = v31;
  }

}

- (id)_lock_buildActivePosterObserverUpdatesForClient:(id)a3 updatedRoles:(id)a4
{
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PRSRoleActivePosterObserverUpdate *v18;
  uint64_t v19;
  PRSRoleActivePosterObserverUpdate *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  void *v28;
  void *v29;
  PRSWallpaperPublisher *v30;
  id v31;
  id v32;
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  PRSWallpaperPublisher *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (*((_BYTE *)v6 + 112) && *((_BYTE *)v6 + 129))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v32, "keyEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    if (!v7)
    {
      v10 = 0;
      goto LABEL_30;
    }
    v9 = v7;
    v30 = self;
    v10 = 0;
    v11 = *(_QWORD *)v36;
    *(_QWORD *)&v8 = 138544642;
    v27 = v8;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v12);
        if (objc_msgSend(*((id *)v6 + 15), "containsObject:", v13, v27))
        {
          objc_msgSend(v32, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!*((_BYTE *)v6 + 128))
            goto LABEL_13;
          objc_msgSend(*((id *)v6 + 2), "remoteProcess");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "auditToken");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (!v16 || (objc_msgSend(v16, "isInvalid") & 1) != 0)
          {

            goto LABEL_13;
          }
          v34 = 0;
          objc_msgSend(v14, "extendContentsReadAccessToAuditToken:error:", v17, &v34);
          v19 = objc_claimAutoreleasedReturnValue();
          v31 = v34;
          if (v19)
          {
            v20 = -[PRSRoleActivePosterObserverUpdate initWithRole:activePath:]([PRSRoleActivePosterObserverUpdate alloc], "initWithRole:activePath:", v13, v19);
            v21 = (void *)v19;
            v18 = v20;
          }
          else
          {
            PRSLogObserver();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = (objc_class *)objc_opt_class();
              NSStringFromClass(v23);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "identity");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = *((_QWORD *)v6 + 4);
              *(_DWORD *)buf = v27;
              v40 = v29;
              v41 = 2048;
              v42 = v30;
              v43 = 2114;
              v44 = v28;
              v45 = 2114;
              v46 = v13;
              v47 = 2114;
              v48 = v24;
              v49 = 2114;
              v50 = v17;
              _os_log_error_impl(&dword_1A4996000, v22, OS_LOG_TYPE_ERROR, "<%{public}@:%p> failed to prepare role update of %{public}@/%{public}@ for client %{public}@ due to bad auditToken %{public}@", buf, 0x3Eu);

            }
            v18 = 0;
            v21 = 0;
          }

          if (!v18)
LABEL_13:
            v18 = -[PRSRoleActivePosterObserverUpdate initWithRole:activePath:]([PRSRoleActivePosterObserverUpdate alloc], "initWithRole:activePath:", v13, v14);
          if (!v10)
            v10 = (void *)objc_opt_new();
          objc_msgSend(v10, "addObject:", v18);

        }
        ++v12;
      }
      while (v9 != v12);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
      v9 = v25;
      if (!v25)
      {
LABEL_30:

        goto LABEL_31;
      }
    }
  }
  v10 = 0;
LABEL_31:

  return v10;
}

- (void)_lock_issuePosterCollectionUpdate:(id)a3
{
  id v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSMutableSet *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  id obj;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  PRSWallpaperPublisher *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  PRSWallpaperPublisher *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v42 = self;
  if (!self->_lock_activated)
  {
    v33 = (void *)MEMORY[0x1E0CB3940];
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("<%@:%p> received multi-update before role activation"), v35, self);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSWallpaperPublisher _lock_issuePosterCollectionUpdate:].cold.1();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B4528);
  }
  v38 = (void *)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v4, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = v4;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v49 != v39)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v42->_lock_roleToPosterCollections, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "count");
        if (v9 == objc_msgSend(v8, "count"))
        {
          if (!objc_msgSend(v7, "count"))
            goto LABEL_14;
          v10 = 0;
          while (1)
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "serverIdentity");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "serverIdentity");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqual:", v14);

            if ((v15 & 1) == 0)
              break;
            if (++v10 >= (unint64_t)objc_msgSend(v7, "count"))
              goto LABEL_14;
          }
        }
        v16 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v16, v6);

LABEL_14:
        v4 = v40;
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v41);
  }

  v17 = v38;
  if (objc_msgSend(v38, "count"))
  {
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __59__PRSWallpaperPublisher__lock_issuePosterCollectionUpdate___block_invoke;
    v47[3] = &unk_1E4D42CA8;
    v47[4] = v42;
    objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v47);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v18 = v42->_lock_clients;
    v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
    v20 = v38;
    if (v19)
    {
      v21 = v19;
      v22 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v44 != v22)
            objc_enumerationMutation(v18);
          v24 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
          v25 = *(id *)(v24 + 144);
          objc_msgSend(v20, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v20, "objectForKeyedSubscript:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[PRSWallpaperPublisher _lock_buildPosterCollectionUpdatesForClient:role:updatedPosterCollection:](v42, "_lock_buildPosterCollectionUpdatesForClient:role:updatedPosterCollection:", v24, v25, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v28, "count"))
            {
              PRSLogObserver();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                v30 = (objc_class *)objc_opt_class();
                NSStringFromClass(v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = *(_QWORD *)(v24 + 32);
                *(_DWORD *)buf = 138544130;
                v53 = v31;
                v54 = 2048;
                v55 = v42;
                v20 = v38;
                v56 = 2114;
                v57 = v32;
                v58 = 2114;
                v59 = v28;
                _os_log_impl(&dword_1A4996000, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> notifying client %{public}@ of poster collection role observer updates=%{public}@", buf, 0x2Au);

              }
              objc_msgSend(*(id *)(v24 + 24), "notifyRolePosterCollectionUpdates:", v28);
            }

          }
        }
        v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
      }
      while (v21);
    }

    v17 = v20;
    v4 = v40;
  }

}

uint64_t __59__PRSWallpaperPublisher__lock_issuePosterCollectionUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setObject:forKeyedSubscript:", a3, a2);
}

- (id)_lock_buildPosterCollectionUpdatesForClient:(id)a3 role:(id)a4 updatedPosterCollection:(id)a5
{
  id *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  id v26;
  PRSPosterRoleCollectionObserverUpdate *v27;
  void *v28;
  void *v30;
  id v31;
  id v32;
  void *v33;
  PRSWallpaperPublisher *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  PRSPosterRoleCollectionObserverUpdate *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  PRSWallpaperPublisher *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = (id *)a3;
  v9 = a4;
  v10 = a5;
  v34 = self;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(v8[2], "remoteProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "auditToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*((_BYTE *)v8 + 112) || !*((_BYTE *)v8 + 153))
  {
    v28 = 0;
    goto LABEL_23;
  }
  v30 = v11;
  v32 = v9;
  v13 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v31 = v10;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
  if (!v15)
    goto LABEL_21;
  v16 = v15;
  v17 = *(_QWORD *)v38;
  do
  {
    v18 = 0;
    do
    {
      if (*(_QWORD *)v38 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v18);
      if (*((_BYTE *)v8 + 152))
        v20 = v12 == 0;
      else
        v20 = 1;
      if (!v20 && (objc_msgSend(v12, "isInvalid") & 1) == 0)
      {
        v36 = 0;
        objc_msgSend(v19, "extendContentsReadAccessToAuditToken:error:", v12, &v36);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v22 = v36;
        v23 = v22;
        if (v21)
        {

          goto LABEL_19;
        }
        PRSLogObserver();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identity");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v8[4];
          *(_DWORD *)buf = 138544642;
          v43 = v35;
          v44 = 2048;
          v45 = v34;
          v46 = 2114;
          v47 = v33;
          v48 = 2114;
          v49 = v32;
          v50 = 2114;
          v51 = v26;
          v52 = 2114;
          v53 = v12;
          _os_log_error_impl(&dword_1A4996000, v24, OS_LOG_TYPE_ERROR, "<%{public}@:%p> failed to prepare role update of %{public}@/%{public}@ for client %{public}@ due to bad auditToken %{public}@", buf, 0x3Eu);

        }
      }
      v21 = v19;
LABEL_19:
      objc_msgSend(v13, "addObject:", v21, v30);

      ++v18;
    }
    while (v16 != v18);
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
  }
  while (v16);
LABEL_21:

  v9 = v32;
  v27 = -[PRSPosterRoleCollectionObserverUpdate initWithRole:posterCollection:]([PRSPosterRoleCollectionObserverUpdate alloc], "initWithRole:posterCollection:", v32, v13);
  v41 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v30;
  v10 = v31;
LABEL_23:

  return v28;
}

- (void)_lock_activateClientsIfNeeded
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  PRSWallpaperPublisher *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_lock_activated)
  {
    PRSLogObserver();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[NSMutableSet count](self->_lock_clients, "count");
      *(_DWORD *)buf = 138543874;
      v25 = v5;
      v26 = 2048;
      v27 = self;
      v28 = 2048;
      v29 = v6;
      _os_log_impl(&dword_1A4996000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Activating %lu clients", buf, 0x20u);

    }
    self->_lock_activated = 1;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_lock_clients;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (!*(_QWORD *)(v12 + 24))
          {
            PRSLogObserver();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = (objc_class *)objc_opt_class();
              NSStringFromClass(v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = *(_QWORD *)(v12 + 32);
              *(_DWORD *)buf = 138543874;
              v25 = v15;
              v26 = 2048;
              v27 = self;
              v28 = 2112;
              v29 = v16;
              _os_log_impl(&dword_1A4996000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Activating client that connected earlier: %@", buf, 0x20u);

            }
            objc_msgSend(*(id *)(v12 + 16), "activate");
            objc_msgSend(*(id *)(v12 + 16), "remoteTarget");
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = *(void **)(v12 + 24);
            *(_QWORD *)(v12 + 24) = v17;

          }
        }
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

  }
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_lock_roleToPosterCollections, 0);
  objc_storeStrong((id *)&self->_lock_roleToPath, 0);
  objc_storeStrong((id *)&self->_lock_delegate, 0);
  objc_storeStrong((id *)&self->_lock_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  for (i = 64; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
}

- (void)initializeWithPaths:recentlyChanged:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initializeWithPaths:recentlyChanged:.cold.2()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initializeRoles:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)updatePaths:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)updatePaths:.cold.2()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)updatePaths:.cold.3()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)noteSnapshotUpdateForPath:snapshotType:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initializePosterCollectionForRoles:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_lock_sendStateToClient:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_lock_issueUpdateForRoles:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_lock_issuePosterCollectionUpdate:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
