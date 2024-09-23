@implementation XBApplicationSnapshotManifestImpl

+ (id)_snapshotPredicateForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[XBApplicationSnapshotPredicate predicate](XBApplicationSnapshotPredicate, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchInterfaceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setLaunchInterfaceIdentifier:", v5);
  objc_msgSend(v3, "urlSchemeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScheme:", v6);

  objc_msgSend(v4, "setContentTypeMask:", 2);
  objc_msgSend(v3, "referenceSize");
  objc_msgSend(v4, "setReferenceSize:");
  objc_msgSend(v4, "setInterfaceOrientationMask:", XBInterfaceOrientationMaskForInterfaceOrientationPair(objc_msgSend(v3, "interfaceOrientation")));
  objc_msgSend(v4, "setStatusBarStateMask:", XBStatusBarStateMaskForStatusBarState(objc_msgSend(v3, "statusBarState")));
  objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(v3, "userInterfaceStyle"));
  objc_msgSend(v3, "customSafeAreaInsets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomSafeAreaInsets:", v7);

  return v4;
}

- (id)snapshotsForGroupIDs:(id)a3 fetchRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_unfair_lock_s *p_accessLock;
  void *v11;
  void *v12;
  NSObject *v13;
  NSString *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  XBApplicationSnapshotManifestImpl *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  NSString *logIdentifier;
  void *v43;
  void *v44;
  NSString *v45;
  id v46;
  void *v47;
  void *v48;
  XBApplicationSnapshotManifestImpl *v49;
  _QWORD v50[4];
  id v51;
  XBApplicationSnapshotManifestImpl *v52;
  uint8_t buf[4];
  NSString *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  XBLogFetchRequests();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    logIdentifier = self->_logIdentifier;
    *(_DWORD *)buf = 138412802;
    v54 = logIdentifier;
    v55 = 2112;
    v56 = v6;
    v57 = 2112;
    v58 = v7;
    _os_log_debug_impl(&dword_217702000, v9, OS_LOG_TYPE_DEBUG, "[%@] BEGIN snapshotsForGroupIDs:fetchRequest: groupIDs: %@; fetchRequest: %@",
      buf,
      0x20u);
  }

  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  v49 = self;
  if (v8)
  {
    -[XBApplicationSnapshotManifestImpl _access_snapshotsForGroupIDs:matchingPredicate:](self, "_access_snapshotsForGroupIDs:matchingPredicate:", v6, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    XBLogFetchRequests();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = self->_logIdentifier;
      objc_msgSend(v12, "bs_map:", &__block_literal_global_206);
      v15 = v6;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v54 = v14;
      self = v49;
      v55 = 2112;
      v56 = v8;
      v57 = 2112;
      v58 = v16;
      _os_log_debug_impl(&dword_217702000, v13, OS_LOG_TYPE_DEBUG, "[%@] snapshotsForGroupIDs:fetchRequest: fetchRequest has predicate %@; retrieved matchingSnapshots:\n\t%@",
        buf,
        0x20u);

      v6 = v15;
    }
  }
  else
  {
    -[XBApplicationSnapshotManifestImpl _access_snapshotsForGroupIDs:](self, "_access_snapshotsForGroupIDs:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v17, "mutableCopy");

    XBLogFetchRequests();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[XBApplicationSnapshotManifestImpl snapshotsForGroupIDs:fetchRequest:].cold.3((uint64_t)self, v12, v13);
  }

  os_unfair_lock_unlock(p_accessLock);
  objc_msgSend(v7, "fallbackGenerationContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "launchRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "urlSchemeName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "applicationCompatibilityInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v48 = v8;
    if (v21 && v22 && (objc_msgSend(v22, "launchInterfaceExistsForScheme:", v21) & 1) == 0)
    {
      v24 = v6;
      v25 = (void *)objc_msgSend(v20, "copy");

      objc_msgSend(v25, "setUrlSchemeName:", 0);
      XBLogFetchRequests();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[XBApplicationSnapshotManifestImpl snapshotsForGroupIDs:fetchRequest:].cold.2();

      v20 = v25;
      v6 = v24;
      self = v49;
    }
    +[XBApplicationSnapshotManifestImpl _snapshotPredicateForRequest:](XBApplicationSnapshotManifestImpl, "_snapshotPredicateForRequest:", v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __71__XBApplicationSnapshotManifestImpl_snapshotsForGroupIDs_fetchRequest___block_invoke_209;
    v50[3] = &unk_24D7F4AE0;
    v28 = v27;
    v51 = v28;
    v52 = self;
    objc_msgSend(v12, "indexesOfObjectsPassingTest:", v50);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v29, "count"))
    {
      v46 = v6;
      objc_msgSend(v19, "launchRequest");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "groupID");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = self;
      v33 = (void *)v31;
      -[XBApplicationSnapshotManifestImpl _generatableSnapshotForGroupID:generationContext:](v32, "_generatableSnapshotForGroupID:generationContext:", v31, v19);
      v47 = v12;
      v34 = objc_claimAutoreleasedReturnValue();

      v35 = (void *)v34;
      v12 = v47;

      objc_msgSend(v47, "addObject:", v35);
      XBLogFetchRequests();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v45 = v49->_logIdentifier;
        objc_msgSend(v35, "logIdentifier");
        v43 = v35;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v54 = v45;
        v55 = 2112;
        v56 = v28;
        v57 = 2112;
        v58 = v44;
        _os_log_debug_impl(&dword_217702000, v36, OS_LOG_TYPE_DEBUG, "[%@] snapshotsForGroupIDs:fetchRequest: fetchRequest has fallbackPredicate %@, no snapshot matched, so generated and added fallbackSnapshot:\n\t%@", buf, 0x20u);

        v35 = v43;
        v12 = v47;
      }

      v6 = v46;
    }

    v8 = v48;
  }
  objc_msgSend(v7, "sortDescriptors");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");

  if (v38)
  {
    objc_msgSend(v7, "NSSortDescriptors");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortUsingDescriptors:", v39);

    XBLogFetchRequests();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      -[XBApplicationSnapshotManifestImpl snapshotsForGroupIDs:fetchRequest:].cold.1((uint64_t)v49, v12, v40);

  }
  return v12;
}

- (id)_access_snapshotsForGroupIDs:(id)a3 matchingPredicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  id obj;
  XBApplicationSnapshotManifestImpl *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v23 = self;
  os_unfair_lock_assert_owner(&self->_accessLock);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        -[NSMutableDictionary objectForKey:](v23->_snapshotGroupsByID, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "snapshots");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v25 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
              if (objc_msgSend(v7, "evaluateWithObject:", v20))
                objc_msgSend(v8, "addObject:", v20);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v17);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v10);
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 3, CFSTR("version"));
  if (-[NSMutableDictionary count](self->_snapshotGroupsByID, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_snapshotGroupsByID, CFSTR("snapshots"));

}

uint64_t __49__XBApplicationSnapshotManifestImpl__noteDirtied__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 96) = 1;
  return result;
}

- (id)snapshotsForGroupID:(id)a3 matchingPredicate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[XBApplicationSnapshotManifestImpl snapshotsForGroupIDs:matchingPredicate:](self, "snapshotsForGroupIDs:matchingPredicate:", v9, v7, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)snapshotsForGroupIDs:(id)a3 matchingPredicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSString *logIdentifier;
  int v12;
  NSString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  -[XBApplicationSnapshotManifestImpl _access_snapshotsForGroupIDs:matchingPredicate:](self, "_access_snapshotsForGroupIDs:matchingPredicate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_accessLock);
  XBLogFetchRequests();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    logIdentifier = self->_logIdentifier;
    v12 = 138413058;
    v13 = logIdentifier;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_debug_impl(&dword_217702000, v9, OS_LOG_TYPE_DEBUG, "[%@] snapshotsForGroupIDs:matchingPredicate: given groupIDs: %@; predicate: %@; returning matchingSnapshots:\n%@",
      (uint8_t *)&v12,
      0x2Au);
  }

  return v8;
}

uint64_t __63__XBApplicationSnapshotManifestImpl__workloop_checkClientCount__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workloop_reallyCheckClientCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke_2(uint64_t a1)
{
  _QWORD v2[6];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 100));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 100));
  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy__2;
  v7 = __Block_byref_object_dispose__2;
  v8 = 0;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke_3;
  v2[3] = &unk_24D7F4CC8;
  v2[4] = *(_QWORD *)(a1 + 32);
  v2[5] = &v3;
  dispatch_sync((dispatch_queue_t)__ManifestArchiveSchedulingQueue, v2);
  objc_msgSend(*(id *)(a1 + 32), "_access_doArchiveWithCompletions:", v4[5]);
  objc_msgSend(*(id *)(a1 + 32), "_workloop_checkClientCount");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 100));
  _Block_object_dispose(&v3, 8);

}

- (void)_workloop_checkClientCount
{
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)__ManifestWorkloop);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__XBApplicationSnapshotManifestImpl__workloop_checkClientCount__block_invoke;
  block[3] = &unk_24D7F4328;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __81__XBApplicationSnapshotManifestImpl__access_accessSnapshotsWithBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v3 = __ManifestSerialWorkQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __81__XBApplicationSnapshotManifestImpl__access_accessSnapshotsWithBlock_completion___block_invoke_2;
  v4[3] = &unk_24D7F4C80;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  dispatch_async(v3, v4);

}

void __57__XBApplicationSnapshotManifestImpl__access_deletePaths___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__XBApplicationSnapshotManifestImpl__access_deletePaths___block_invoke_2;
  v7[3] = &unk_24D7F4D90;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

+ (void)_configureSnapshot:(id)a3 withCompatibilityInfo:(id)a4 forLaunchRequest:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL8 v21;
  uint64_t v22;
  XBMutableStatusBarSettings *v23;
  void *v24;
  id v25;

  v25 = a3;
  v7 = a5;
  v8 = a4;
  objc_msgSend(v7, "launchInterfaceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLaunchInterfaceIdentifier:", v9);
  objc_msgSend(v8, "defaultLaunchInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v9);

  if ((v12 & 1) == 0)
    objc_msgSend(v25, "setName:", v9);
  objc_msgSend(v7, "urlSchemeName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setScheme:", v13);

  objc_msgSend(v25, "setContentType:", 1);
  objc_msgSend(v7, "displayConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "referenceSize");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v14, "bounds");
  v21 = v18 == v20 && v16 == v19;
  objc_msgSend(v25, "setFullScreen:", v21);
  objc_msgSend(v7, "referenceSize");
  objc_msgSend(v25, "setReferenceSize:");
  objc_msgSend(v14, "scale");
  objc_msgSend(v25, "setImageScale:");
  objc_msgSend(v25, "setInterfaceOrientation:", objc_msgSend(v7, "interfaceOrientation"));
  v22 = objc_msgSend(v7, "statusBarState");
  v23 = objc_alloc_init(XBMutableStatusBarSettings);
  -[XBMutableStatusBarSettings setHidden:](v23, "setHidden:", v22 == 0);
  -[XBMutableStatusBarSettings setBackgroundActivityEnabled:](v23, "setBackgroundActivityEnabled:", v22 == 2);
  objc_msgSend(v25, "setStatusBarSettings:", v23);
  objc_msgSend(v25, "setUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
  objc_msgSend(v7, "customSafeAreaInsets");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setCustomSafeAreaInsets:", v24);
}

- (id)_generatableSnapshotForGroupID:(id)a3 generationContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSString *logIdentifier;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 1316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("generationContext"));

  }
  -[XBApplicationSnapshotManifestImpl _createSnapshotWithGroupID:generationContext:](self, "_createSnapshotWithGroupID:generationContext:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshotManifestImpl _addSnapshotToGroup:](self, "_addSnapshotToGroup:", v9);
  XBLogFileManifest();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    logIdentifier = self->_logIdentifier;
    objc_msgSend(v9, "logIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = logIdentifier;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_217702000, v10, OS_LOG_TYPE_INFO, "%{public}@ groupID: [%@] Creating temporary snapshot %@ with generation context.", buf, 0x20u);

  }
  objc_msgSend(v8, "launchRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationCompatibilityInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "launchInterfaceIdentifierForRequest:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLaunchInterfaceIdentifier:", v15);

  +[XBApplicationSnapshotManifestImpl _configureSnapshot:withCompatibilityInfo:forLaunchRequest:](XBApplicationSnapshotManifestImpl, "_configureSnapshot:withCompatibilityInfo:forLaunchRequest:", v9, v14, v13);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 2.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExpirationDate:", v16);

  -[XBApplicationSnapshotManifestImpl _reapExpiredAndInvalidSnapshots](self, "_reapExpiredAndInvalidSnapshots");
  return v9;
}

- (void)_reapExpiredAndInvalidSnapshots
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__XBApplicationSnapshotManifestImpl__reapExpiredAndInvalidSnapshots__block_invoke;
  block[3] = &unk_24D7F4328;
  block[4] = self;
  dispatch_async((dispatch_queue_t)__ManifestSerialWorkQueue, block);
}

- (void)_addSnapshotToGroup:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[XBApplicationSnapshotManifestImpl _access_addSnapshotToGroup:](self, "_access_addSnapshotToGroup:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (void)_access_doArchiveWithCompletions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSString *logIdentifier;
  void *v18;
  id v19;
  NSObject *v20;
  NSString *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  NSString *v33;
  __int16 v34;
  XBApplicationSnapshotManifestImpl *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_accessLock);
  -[XBApplicationSnapshotManifestImpl _access_workloop_reapExpiredAndInvalidSnapshots](self, "_access_workloop_reapExpiredAndInvalidSnapshots");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[NSMutableDictionary allValues](self->_snapshotGroupsByID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9), "snapshots");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11)
        {
          v12 = 1;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  -[XBApplicationSnapshotManifestImpl bundleIdentifier](self, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBSnapshotManifestIdentity store](self->_identity, "store");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  XBLogFileManifest();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      logIdentifier = self->_logIdentifier;
      *(_DWORD *)buf = 138543618;
      v33 = logIdentifier;
      v34 = 2048;
      v35 = self;
      _os_log_impl(&dword_217702000, v16, OS_LOG_TYPE_INFO, "%{public}@ Archiving manifest (%p).", buf, 0x16u);
    }

    v27 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v27;
    if (!v18)
    {
      XBLogFileManifest();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[XBApplicationSnapshotManifestImpl _access_doArchiveWithCompletions:].cold.1();

    }
    objc_msgSend(v14, "persistManifestData:forBundleIdentifier:", v18, v13);

  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_logIdentifier;
      *(_DWORD *)buf = 138543362;
      v33 = v21;
      _os_log_impl(&dword_217702000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ We don't have any snapshots, so we're clearing our manifest data.", buf, 0xCu);
    }

    objc_msgSend(v14, "clearManifestDataForBundleIdentifier:", v13);
  }
  if (objc_msgSend(v4, "count"))
  {
    dispatch_get_global_queue(21, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __70__XBApplicationSnapshotManifestImpl__access_doArchiveWithCompletions___block_invoke;
    v23[3] = &unk_24D7F4050;
    v24 = v14;
    v25 = v13;
    v26 = v4;
    dispatch_async(v22, v23);

  }
}

void __68__XBApplicationSnapshotManifestImpl__reapExpiredAndInvalidSnapshots__block_invoke(uint64_t a1)
{
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 100));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 100));
  objc_msgSend(*(id *)(a1 + 32), "_access_workloop_reapExpiredAndInvalidSnapshots");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 100));
}

- (id)_createSnapshotWithGroupID:(id)a3 generationContext:(id)a4
{
  id v6;
  id v7;
  XBApplicationSnapshot *v8;
  XBSnapshotContainerIdentity *containerIdentity;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = [XBApplicationSnapshot alloc];
  containerIdentity = self->_containerIdentity;
  -[XBSnapshotManifestIdentity store](self->_identity, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[XBApplicationSnapshot _initWithContainerIdentity:store:groupID:generationContext:](v8, "_initWithContainerIdentity:store:groupID:generationContext:", containerIdentity, v10, v7, v6);

  return v11;
}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;

  -[XBApplicationSnapshotManifestImpl containerIdentity](self, "containerIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (XBSnapshotContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (void)_access_workloop_reapExpiredAndInvalidSnapshots
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_217702000, v0, v1, "%{public}@ Cancelling reaping timer as we've just reaped", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_access_gatherPaths:(id)a3 forSnapshot:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v11 = a4;
  os_unfair_lock_assert_owner(&self->_accessLock);
  objc_msgSend(v11, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v11, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  objc_msgSend(v11, "variants", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__XBApplicationSnapshotManifestImpl__access_gatherPaths_forSnapshot___block_invoke;
  v13[3] = &unk_24D7F4E30;
  v14 = v6;
  v10 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

}

- (void)_access_deleteSnapshots:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSString *logIdentifier;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  NSString *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_accessLock);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v28;
    *(_QWORD *)&v8 = 138543874;
    v24 = v8;
    do
    {
      v12 = 0;
      v13 = v10;
      v25 = v9;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
        v26 = v13;
        v15 = objc_msgSend(v14, "_shouldDeleteFileOnPurge:", &v26, v24);
        v10 = v26;

        if (v15)
        {
          XBLogFileManifest();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = v11;
            v18 = v6;
            v19 = v5;
            logIdentifier = self->_logIdentifier;
            objc_msgSend(v14, "logIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v24;
            v32 = logIdentifier;
            v5 = v19;
            v6 = v18;
            v11 = v17;
            v9 = v25;
            v33 = 2114;
            v34 = v21;
            v35 = 2114;
            v36 = v10;
            _os_log_impl(&dword_217702000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Deleting snapshot %{public}@ for reason: %{public}@", buf, 0x20u);

          }
          -[XBApplicationSnapshotManifestImpl _access_gatherPaths:forSnapshot:](self, "_access_gatherPaths:forSnapshot:", v5, v14);
        }
        objc_msgSend(v14, "groupID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[XBApplicationSnapshotManifestImpl _access_snapshotGroupForID:creatingIfNeeded:](self, "_access_snapshotGroupForID:creatingIfNeeded:", v22, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "removeSnapshot:", v14))
          -[XBApplicationSnapshotManifestImpl _noteDirtied](self, "_noteDirtied");
        objc_msgSend(v14, "_invalidate");

        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  -[XBApplicationSnapshotManifestImpl _access_deletePaths:](self, "_access_deletePaths:", v5);
}

void __81__XBApplicationSnapshotManifestImpl__access_accessSnapshotsWithBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 100));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 100));
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 80))
  {
    v3 = *(void **)(v2 + 48);
    *(_QWORD *)(v2 + 48) = 0;

  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_scheduleArchivingIfNecessaryWithCompletion:", 0);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 100));
}

- (void)_noteDirtied
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__XBApplicationSnapshotManifestImpl__noteDirtied__block_invoke;
  block[3] = &unk_24D7F4328;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)__ManifestArchiveSchedulingQueue, block);
}

- (void)_scheduleArchivingIfNecessaryWithDelay:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  v7 = __ManifestArchiveSchedulingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke;
  block[3] = &unk_24D7F4CF0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(v7, block);

}

- (void)_scheduleArchivingIfNecessaryWithCompletion:(id)a3
{
  -[XBApplicationSnapshotManifestImpl _scheduleArchivingIfNecessaryWithDelay:completion:](self, "_scheduleArchivingIfNecessaryWithDelay:completion:", a3, 1.0);
}

- (id)_access_snapshotGroupForID:(id)a3 creatingIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  BOOL v8;
  id v9;
  XBApplicationSnapshotGroup *v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  os_unfair_lock_assert_owner(&self->_accessLock);
  -[NSMutableDictionary objectForKey:](self->_snapshotGroupsByID, "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
    v9 = 0;
  else
    v9 = (id)v7;
  if (v8 && v4)
  {
    v10 = [XBApplicationSnapshotGroup alloc];
    -[XBApplicationSnapshotManifestImpl containerIdentity](self, "containerIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[XBApplicationSnapshotGroup _initWithIdentifier:containerIdentity:](v10, "_initWithIdentifier:containerIdentity:", v6, v11);

    -[NSMutableDictionary setObject:forKey:](self->_snapshotGroupsByID, "setObject:forKey:", v9, v6);
  }

  return v9;
}

- (id)defaultGroupIdentifier
{
  void *v2;
  void *v3;

  -[XBApplicationSnapshotManifestImpl identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (XBSnapshotManifestIdentity)identity
{
  return self->_identity;
}

- (void)_access_deletePaths:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *logIdentifier;
  id v7;
  _QWORD v8[4];
  id v9;
  XBApplicationSnapshotManifestImpl *v10;
  uint8_t buf[4];
  NSString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_accessLock);
  if (objc_msgSend(v4, "count"))
  {
    XBLogFileManifest();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      logIdentifier = self->_logIdentifier;
      *(_DWORD *)buf = 138543618;
      v12 = logIdentifier;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_217702000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Deleting paths: %@", buf, 0x16u);
    }

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__XBApplicationSnapshotManifestImpl__access_deletePaths___block_invoke;
  v8[3] = &unk_24D7F4DB8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  -[XBApplicationSnapshotManifestImpl _access_accessSnapshotsWithBlock:completion:](self, "_access_accessSnapshotsWithBlock:completion:", v8, 0);

}

void __84__XBApplicationSnapshotManifestImpl__access_workloop_reapExpiredAndInvalidSnapshots__block_invoke(uint64_t a1)
{
  os_unfair_lock_s **v1;
  NSObject *v2;
  void *v3;
  os_unfair_lock_s *v4;
  _QWORD v5[5];

  v1 = (os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 100));
  os_unfair_lock_lock(*v1 + 25);
  XBLogSnapshotReaper();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __84__XBApplicationSnapshotManifestImpl__access_workloop_reapExpiredAndInvalidSnapshots__block_invoke_cold_1();

  objc_msgSend(*(id *)&(*v1)[14]._os_unfair_lock_opaque, "invalidate");
  v3 = *(void **)&(*v1)[14]._os_unfair_lock_opaque;
  *(_QWORD *)&(*v1)[14]._os_unfair_lock_opaque = 0;

  v4 = *v1;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __84__XBApplicationSnapshotManifestImpl__access_workloop_reapExpiredAndInvalidSnapshots__block_invoke_249;
  v5[3] = &unk_24D7F4328;
  v5[4] = v4;
  -[os_unfair_lock_s _access_accessSnapshotsWithBlock:completion:](v4, "_access_accessSnapshotsWithBlock:completion:", 0, v5);
  os_unfair_lock_unlock(*v1 + 25);
}

- (void)_access_accessSnapshotsWithBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t pendingOperations;
  NSFileManager *v10;
  NSFileManager *imageAccessFileManger;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v8 = _os_activity_create(&dword_217702000, "XBCapture", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  os_unfair_lock_assert_owner(&self->_accessLock);
  pendingOperations = self->_pendingOperations;
  if (!pendingOperations)
  {
    v10 = (NSFileManager *)objc_alloc_init(MEMORY[0x24BDD1580]);
    imageAccessFileManger = self->_imageAccessFileManger;
    self->_imageAccessFileManger = v10;

    pendingOperations = self->_pendingOperations;
  }
  self->_pendingOperations = pendingOperations + 1;
  v12 = __ManifestImageAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__XBApplicationSnapshotManifestImpl__access_accessSnapshotsWithBlock_completion___block_invoke;
  block[3] = &unk_24D7F4D68;
  block[4] = self;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

  os_activity_scope_leave(&state);
}

- (void)_access_addSnapshotToGroup:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 1352, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot"));

    v5 = 0;
  }
  objc_msgSend(v5, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 1353, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[snapshot groupID]"));

  }
  os_unfair_lock_assert_owner(&self->_accessLock);
  objc_msgSend(v11, "groupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshotManifestImpl _access_snapshotGroupForID:creatingIfNeeded:](self, "_access_snapshotGroupForID:creatingIfNeeded:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addSnapshot:", v11);
}

uint64_t __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  double v5;
  dispatch_time_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 97) && *(_BYTE *)(v2 + 96))
  {
    *(_BYTE *)(v2 + 97) = 1;
    v3 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke_2;
    v21[3] = &unk_24D7F4328;
    v21[4] = *(_QWORD *)(a1 + 32);
    v4 = (void *)MEMORY[0x219A10DF4](v21);
    v5 = *(double *)(a1 + 48);
    if (v5 == 0.0)
    {
      dispatch_sync((dispatch_queue_t)__ManifestSerialWorkQueue, v4);
    }
    else
    {
      v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
      v7 = __ManifestSerialWorkQueue;
      v16 = v3;
      v17 = 3221225472;
      v18 = __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke_4;
      v19 = &unk_24D7F4C58;
      v20 = v4;
      dispatch_after(v6, v7, &v16);

    }
  }
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v9 + 97))
    {
      if (!*(_QWORD *)(v9 + 88))
      {
        v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(v11 + 88);
        *(_QWORD *)(v11 + 88) = v10;

        v8 = *(void **)(a1 + 40);
      }
      v13 = objc_msgSend(v8, "copy", v16, v17, v18, v19);
      v14 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
      v15 = (void *)MEMORY[0x219A10DF4]();
      objc_msgSend(v14, "addObject:", v15);

    }
    else
    {
      dispatch_get_global_queue(21, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v13, v8);
    }

  }
}

void __63__XBApplicationSnapshotManifestImpl__workloop_checkClientCount__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__XBApplicationSnapshotManifestImpl__workloop_checkClientCount__block_invoke_2;
  block[3] = &unk_24D7F4328;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)__ManifestSerialWorkQueue, block);
}

void __87__XBApplicationSnapshotManifestImpl__scheduleArchivingIfNecessaryWithDelay_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 80))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v1 + 88));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 88);
    *(_QWORD *)(v3 + 88) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 0;
    v1 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v1 + 97) = 0;
}

- (void)_workloop_reallyCheckClientCount
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_217702000, v0, v1, "%{public}@ Cancelling reaping timer as we're invalidating (no clients or work remaining)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)initialize
{
  dispatch_source_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    __memoryPressureStatus = 1;
    v2 = dispatch_source_create(MEMORY[0x24BDAC9F0], 0, 7uLL, (dispatch_queue_t)__ManifestSerialWorkQueue);
    v3 = (void *)__memoryPressureSource;
    __memoryPressureSource = (uint64_t)v2;

    if (__memoryPressureSource)
    {
      dispatch_source_set_event_handler((dispatch_source_t)__memoryPressureSource, &__block_literal_global_172);
      dispatch_resume((dispatch_object_t)__memoryPressureSource);
    }
  }
}

uintptr_t __47__XBApplicationSnapshotManifestImpl_initialize__block_invoke()
{
  int v0;
  uintptr_t result;

  v0 = __memoryPressureStatus;
  result = dispatch_source_get_data((dispatch_source_t)__memoryPressureSource);
  __memoryPressureStatus = result;
  if (v0 != (_DWORD)result && ((_DWORD)result == 4 || (_DWORD)result == 2))
    return objc_msgSend((id)__ManifestsByIdentity, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_173);
  return result;
}

uint64_t __47__XBApplicationSnapshotManifestImpl_initialize__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_handleMemoryPressure");
}

+ (id)acquireManifestForContainerIdentity:(id)a3 store:(id)a4 creatingIfNecessary:(BOOL)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  void *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  id v21;
  uint64_t *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("XBApplicationSnapshotManifest.m"), 473, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerIdentity"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("XBApplicationSnapshotManifest.m"), 474, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v12 = __ManifestSerialWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__XBApplicationSnapshotManifestImpl_acquireManifestForContainerIdentity_store_creatingIfNecessary___block_invoke;
  block[3] = &unk_24D7F4A30;
  v20 = v9;
  v21 = v11;
  v23 = a5;
  v22 = &v24;
  v13 = v11;
  v14 = v9;
  dispatch_sync(v12, block);
  v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __99__XBApplicationSnapshotManifestImpl_acquireManifestForContainerIdentity_store_creatingIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[XBSnapshotManifestIdentity identityWithBundleIdentifier:store:](XBSnapshotManifestIdentity, "identityWithBundleIdentifier:store:", v2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__ManifestsByIdentity, "objectForKey:", v3);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_29;
  if (!v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "beginAccessBlockForBundleIdentifier:", v2);
    objc_msgSend(*(id *)(a1 + 40), "loadManifestDataForBundleIdentifier:", v2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v34 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v34);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v34;
      v15 = v14;
      if (v13)
      {

        v12 = v13;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v12, "_allSnapshotGroups", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v31 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "_manifestQueueDecode_setStore:", *(_QWORD *)(a1 + 40));
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
          }
          while (v18);
        }

        XBLogFileManifest();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v12, "succinctDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v22;
          v41 = 2112;
          v42 = v3;
          _os_log_impl(&dword_217702000, v21, OS_LOG_TYPE_INFO, "acquireManifestForContainerIdentity:store:creatingIfNecessary: Unarchived manifest %{public}@ for %@.", buf, 0x16u);

        }
        v5 = v12;
LABEL_27:

        v25 = objc_msgSend(v3, "copy");
        v26 = (void *)v5[4];
        v5[4] = v25;

        objc_msgSend((id)__ManifestsByIdentity, "setObject:forKey:", v5, v3);
LABEL_28:

        v27 = (void *)MEMORY[0x219A10C5C]();
        objc_msgSend(v5, "_validateWithContainerIdentity:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v5, "_noteDirtied");
        objc_msgSend(v5, "_scheduleArchivingIfNecessaryWithCompletion:", 0);
        objc_autoreleasePoolPop(v27);
        goto LABEL_29;
      }
      XBLogFileManifest();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __99__XBApplicationSnapshotManifestImpl_acquireManifestForContainerIdentity_store_creatingIfNecessary___block_invoke_cold_1();

    }
    v5 = -[XBApplicationSnapshotManifestImpl _initWithContainerIdentity:]([XBApplicationSnapshotManifestImpl alloc], "_initWithContainerIdentity:", *(_QWORD *)(a1 + 32));
    XBLogFileManifest();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "succinctDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v24;
      _os_log_impl(&dword_217702000, v21, OS_LOG_TYPE_INFO, "acquireManifestForContainerIdentity:store:creatingIfNecessary: Created manifest: %{public}@.", buf, 0xCu);

    }
    v12 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v4, "containerIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v5, "succinctDescriptionBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __99__XBApplicationSnapshotManifestImpl_acquireManifestForContainerIdentity_store_creatingIfNecessary___block_invoke_2;
    v35[3] = &unk_24D7F4050;
    v9 = v8;
    v36 = v9;
    v5 = v5;
    v37 = v5;
    v38 = *(id *)(a1 + 32);
    objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, v35);
    XBLogFileManifest();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "build");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v11;
      _os_log_impl(&dword_217702000, v10, OS_LOG_TYPE_INFO, "acquireManifestForContainerIdentity:store:creatingIfNecessary: Manifest containerIdentity has changed: %{public}@", buf, 0xCu);

    }
    v12 = v36;
    goto LABEL_28;
  }
LABEL_29:
  objc_msgSend(v5, "_workloop_incrementClientCount");
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v5;

}

id __99__XBApplicationSnapshotManifestImpl_acquireManifestForContainerIdentity_store_creatingIfNecessary___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "containerIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("old"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(a1 + 48), CFSTR("new"));
}

+ (void)relinquishManifest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  SEL v13;
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "identity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = __ManifestSerialWorkQueue;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __56__XBApplicationSnapshotManifestImpl_relinquishManifest___block_invoke;
      v10[3] = &unk_24D7F4A58;
      v11 = v7;
      v12 = v6;
      v13 = a2;
      v14 = a1;
      dispatch_async(v9, v10);

    }
  }

}

void __56__XBApplicationSnapshotManifestImpl_relinquishManifest___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)__ManifestsByIdentity, "objectForKey:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (v2 != (void *)a1[5])
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[7], CFSTR("XBApplicationSnapshotManifest.m"), 547, CFSTR("manifestToRelinquish does not match the manifest that we think we have : %@ != %@"), a1[5], v4);

    v2 = v4;
  }
  objc_msgSend(v2, "_workloop_decrementClientCount");

}

+ (void)_workloop_noteManifestInvalidated:(id)a3
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)__ManifestWorkloop);
  objc_msgSend(v5, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend((id)__ManifestsByIdentity, "objectForKey:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 != v5)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("XBApplicationSnapshotManifest.m"), 560, CFSTR("invalidatedManifest does not match the manifest that we think we have : %@ != %@"), v5, v7);

    }
    XBLogFileManifest();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "succinctDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_217702000, v8, OS_LOG_TYPE_INFO, "Removing manifest: %{public}@", buf, 0xCu);

    }
    objc_msgSend((id)__ManifestsByIdentity, "removeObjectForKey:", v6);

  }
}

+ (BOOL)isUnderMemoryPressure
{
  return __memoryPressureStatus != 1;
}

- (void)_setContainerIdentity:(id)a3
{
  char v4;
  void *v5;
  XBSnapshotContainerIdentity *v6;
  XBSnapshotContainerIdentity *containerIdentity;
  XBSnapshotContainerIdentity *v8;
  NSString *baseLogIdentifier;
  void *v10;
  NSString *v11;
  NSString *logIdentifier;
  NSString *v13;
  id v14;

  v14 = a3;
  v4 = BSEqualObjects();
  v5 = v14;
  if ((v4 & 1) == 0)
  {
    v6 = (XBSnapshotContainerIdentity *)objc_msgSend(v14, "copy");
    containerIdentity = self->_containerIdentity;
    self->_containerIdentity = v6;

    v8 = self->_containerIdentity;
    baseLogIdentifier = self->_baseLogIdentifier;
    if (v8)
    {
      -[XBSnapshotContainerIdentity bundleIdentifier](v8, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingFormat:](baseLogIdentifier, "stringByAppendingFormat:", CFSTR(" [%@]"), v10);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      logIdentifier = self->_logIdentifier;
      self->_logIdentifier = v11;

    }
    else
    {
      v13 = baseLogIdentifier;
      v10 = self->_logIdentifier;
      self->_logIdentifier = v13;
    }

    v5 = v14;
  }

}

- (void)_commonInit
{
  NSMutableDictionary *v3;
  NSMutableDictionary *snapshotGroupsByID;
  BSAtomicSignal *v5;
  BSAtomicSignal *invalidatedSignal;
  void *v7;
  objc_class *v8;
  void *v9;
  NSString *v10;
  NSString *baseLogIdentifier;
  void *v13;

  if (!self)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("XBApplicationSnapshotManifest.m"), 583, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self"));

  }
  self->_logContainerIdentifierDirty = 1;
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  snapshotGroupsByID = self->_snapshotGroupsByID;
  self->_snapshotGroupsByID = v3;

  v5 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x24BE38360]);
  invalidatedSignal = self->_invalidatedSignal;
  self->_invalidatedSignal = v5;

  self->_accessLock._os_unfair_lock_opaque = 0;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p>"), v9, self);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  baseLogIdentifier = self->_baseLogIdentifier;
  self->_baseLogIdentifier = v10;

  objc_storeStrong((id *)&self->_logIdentifier, self->_baseLogIdentifier);
}

- (XBApplicationSnapshotManifestImpl)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 593, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NO"));

  return self;
}

- (id)_initWithContainerIdentity:(id)a3
{
  id v4;
  XBApplicationSnapshotManifestImpl *v5;
  XBApplicationSnapshotManifestImpl *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)XBApplicationSnapshotManifestImpl;
  v5 = -[XBApplicationSnapshotManifestImpl init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[XBApplicationSnapshotManifestImpl _commonInit](v5, "_commonInit");
    -[XBApplicationSnapshotManifestImpl _setContainerIdentity:](v6, "_setContainerIdentity:", v4);
  }

  return v6;
}

- (void)dealloc
{
  BSAtomicSignal *invalidatedSignal;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  invalidatedSignal = self->_invalidatedSignal;
  if (invalidatedSignal)
  {
    if ((-[BSAtomicSignal hasBeenSignalled](invalidatedSignal, "hasBeenSignalled") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_class();
      -[XBSnapshotContainerIdentity bundleIdentifier](self->_containerIdentity, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 609, CFSTR("<%@:%p bundleIdentifier=%@> was not properly invalidated before dealloc"), v8, self, v9);

    }
    if (-[NSMutableArray count](self->_archiveSchedulingQueue_synchronizeCompletions, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_class();
      -[XBSnapshotContainerIdentity bundleIdentifier](self->_containerIdentity, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 610, CFSTR("<%@:%p bundleIdentifier=%@> failed to fire all synchronize completions before dealloc"), v11, self, v12);

    }
  }
  -[XBSnapshotManifestIdentity store](self->_identity, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[XBSnapshotContainerIdentity bundleIdentifier](self->_containerIdentity, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endAccessBlockForBundleIdentifier:", v6);

  }
  v13.receiver = self;
  v13.super_class = (Class)XBApplicationSnapshotManifestImpl;
  -[XBApplicationSnapshotManifest dealloc](&v13, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[XBApplicationSnapshotManifestImpl descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)beginTrackingImageDeletions
{
  uint64_t v3;
  int *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 112);
  v4 = __error();
  v6 = 138412546;
  v7 = v3;
  v8 = 2080;
  v9 = OUTLINED_FUNCTION_14(v4);
  OUTLINED_FUNCTION_0_2(&dword_217702000, a2, v5, "[%@] beginTrackingImageDeletions: Unable to start FSEventStream: %s", (uint8_t *)&v6);
}

- (void)endTrackingImageDeletions
{
  NSObject *v3;
  NSString *logIdentifier;
  os_unfair_lock_s *p_accessLock;
  void *v6;
  void *v7;
  void *v8;
  __FSEventStream *v9;
  __FSEventStream *v10;
  void *v11;
  void *v12;
  int v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  XBLogFileManifest();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    v13 = 138412290;
    v14 = logIdentifier;
    _os_log_impl(&dword_217702000, v3, OS_LOG_TYPE_DEFAULT, "[%@] endTrackingImageDeletions", (uint8_t *)&v13, 0xCu);
  }

  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  v6 = (void *)__trackersByIdentity;
  -[XBApplicationSnapshotManifestImpl identity](self, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (__FSEventStream *)objc_msgSend(v8, "stream");
  if (v9)
  {
    v10 = v9;
    FSEventStreamStop(v9);
    FSEventStreamInvalidate(v10);
    FSEventStreamRelease(v10);
    v11 = (void *)__trackersByIdentity;
    -[XBApplicationSnapshotManifestImpl identity](self, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v12);

  }
  os_unfair_lock_unlock(p_accessLock);

}

- (id)containerPath
{
  void *v2;
  void *v3;

  -[XBApplicationSnapshotManifestImpl containerIdentity](self, "containerIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotContainerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)snapshotsForGroupID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[XBApplicationSnapshotManifestImpl snapshotsForGroupIDs:](self, "snapshotsForGroupIDs:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)snapshotsForGroupID:(id)a3 fetchRequest:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[XBApplicationSnapshotManifestImpl snapshotsForGroupIDs:fetchRequest:](self, "snapshotsForGroupIDs:fetchRequest:", v9, v7, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)snapshotsForGroupIDs:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSString *logIdentifier;
  int v9;
  NSString *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  -[XBApplicationSnapshotManifestImpl _access_snapshotsForGroupIDs:](self, "_access_snapshotsForGroupIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_accessLock);
  XBLogFetchRequests();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    logIdentifier = self->_logIdentifier;
    v9 = 138412802;
    v10 = logIdentifier;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_217702000, v6, OS_LOG_TYPE_DEBUG, "[%@] snapshotsForGroupIDs given groupIDs: %@; returning snapshots:\n\t%@",
      (uint8_t *)&v9,
      0x20u);
  }

  return v5;
}

uint64_t __71__XBApplicationSnapshotManifestImpl_snapshotsForGroupIDs_fetchRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logIdentifier");
}

uint64_t __71__XBApplicationSnapshotManifestImpl_snapshotsForGroupIDs_fetchRequest___block_invoke_207(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logIdentifier");
}

uint64_t __71__XBApplicationSnapshotManifestImpl_snapshotsForGroupIDs_fetchRequest___block_invoke_209(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", v6)
    && objc_msgSend(v6, "isValid"))
  {
    *a4 = 1;
    XBLogFetchRequests();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112);
      objc_msgSend(v6, "logIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v11;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v12;
      _os_log_debug_impl(&dword_217702000, v7, OS_LOG_TYPE_DEBUG, "[%@] snapshotsForGroupIDs:fetchRequest: fetchRequest has fallbackPredicate %@ and found matching snapshot %@; will not generate",
        (uint8_t *)&v13,
        0x20u);

    }
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __71__XBApplicationSnapshotManifestImpl_snapshotsForGroupIDs_fetchRequest___block_invoke_211(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logIdentifier");
}

- (id)createSnapshotWithGroupID:(id)a3
{
  id v4;
  XBApplicationSnapshot *v5;
  XBSnapshotContainerIdentity *containerIdentity;
  void *v7;
  id v8;

  v4 = a3;
  v5 = [XBApplicationSnapshot alloc];
  containerIdentity = self->_containerIdentity;
  -[XBSnapshotManifestIdentity store](self->_identity, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[XBApplicationSnapshot _initWithContainerIdentity:store:groupID:generationContext:](v5, "_initWithContainerIdentity:store:groupID:generationContext:", containerIdentity, v7, v4, 0);

  return v8;
}

- (id)createVariantForSnapshot:(id)a3 withIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  os_unfair_lock_s *p_accessLock;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 888, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 889, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variantID"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  objc_msgSend(v7, "_createVariantWithIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_accessLock);

  return v11;
}

- (void)_didGenerateImage:(BOOL)a3 imageGenerationSignal:(id)a4 logIdentifier:(id)a5 imageGeneratedHandler:(id)a6 qos:(unsigned int)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  os_unfair_lock_s *p_accessLock;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  XBLogCapture();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[XBApplicationSnapshotManifestImpl _didGenerateImage:imageGenerationSignal:logIdentifier:imageGeneratedHandler:qos:].cold.3();

  if ((objc_msgSend(v10, "hasBeenSignalled") & 1) != 0)
  {
    XBLogCapture();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[XBApplicationSnapshotManifestImpl _didGenerateImage:imageGenerationSignal:logIdentifier:imageGeneratedHandler:qos:].cold.1();

  }
  else
  {
    objc_msgSend(v10, "signal");
    p_accessLock = &self->_accessLock;
    os_unfair_lock_assert_not_owner(p_accessLock);
    os_unfair_lock_lock(p_accessLock);
    XBLogCapture();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[XBApplicationSnapshotManifestImpl _didGenerateImage:imageGenerationSignal:logIdentifier:imageGeneratedHandler:qos:].cold.2();

    if (v12)
    {
      v17 = __ManifestCallOutQueue;
      v19 = v12;
      v18 = (void *)BSDispatchBlockCreateWithQualityOfService();
      dispatch_async(v17, v18);

    }
    os_unfair_lock_unlock(p_accessLock);
  }

}

uint64_t __117__XBApplicationSnapshotManifestImpl__didGenerateImage_imageGenerationSignal_logIdentifier_imageGeneratedHandler_qos___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_didGenerateImageData:(id)a3 forSnapshot:(id)a4 imageWasGenerated:(BOOL)a5 imageDataGenerationSignal:(id)a6 logIdentifier:(id)a7 didSaveHandler:(id)a8 qos:(unsigned int)a9 writeToFileIfSupported:(BOOL)a10
{
  _BOOL4 v13;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  os_unfair_lock_s *p_accessLock;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v13 = a5;
  v47 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v29 = a8;
  objc_msgSend(v17, "logIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  XBLogCapture();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[XBApplicationSnapshotManifestImpl _didGenerateImageData:forSnapshot:imageWasGenerated:imageDataGenerationSignal:logIdentifier:didSaveHandler:qos:writeToFileIfSupported:].cold.2();

  if ((objc_msgSend(v18, "hasBeenSignalled") & 1) == 0)
  {
    objc_msgSend(v18, "signal");
    p_accessLock = &self->_accessLock;
    os_unfair_lock_assert_not_owner(&self->_accessLock);
    os_unfair_lock_lock(&self->_accessLock);
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v24 = MEMORY[0x24BDAC760];
    if (v16 && (objc_msgSend(v17, "_isInvalidated") & 1) == 0)
    {
      v26 = __ManifestImageAccessQueue;
      block[0] = v24;
      block[1] = 3221225472;
      block[2] = __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke;
      block[3] = &unk_24D7F4B50;
      v38 = &v39;
      block[4] = self;
      v34 = v16;
      v35 = v17;
      v36 = v19;
      v37 = v20;
      dispatch_sync(v26, block);

    }
    else
    {
      if (objc_msgSend(v17, "_isInvalidated"))
      {
        XBLogFileManifest();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v44 = v19;
          v45 = 2114;
          v46 = v20;
          _os_log_impl(&dword_217702000, v25, OS_LOG_TYPE_INFO, "%{public}@ Snapshot was invalidated between imageGenerationHandler and imageDataGenerationHandler. Skipping saving. %{public}@", buf, 0x16u);
        }

      }
      if (!v16)
        goto LABEL_18;
    }
    if (*((_BYTE *)v40 + 24))
    {
      -[XBApplicationSnapshotManifestImpl _noteDirtied](self, "_noteDirtied");
LABEL_20:
      v27 = __ManifestCallOutQueue;
      v32 = v29;
      v30 = v19;
      v31 = v17;
      v28 = (void *)BSDispatchBlockCreateWithQualityOfService();
      dispatch_async(v27, v28);

      os_unfair_lock_unlock(p_accessLock);
      _Block_object_dispose(&v39, 8);
      goto LABEL_21;
    }
LABEL_18:
    if (v13)
      -[XBApplicationSnapshotManifestImpl _reapExpiredAndInvalidSnapshots](self, "_reapExpiredAndInvalidSnapshots");
    goto LABEL_20;
  }
  XBLogCapture();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[XBApplicationSnapshotManifestImpl _didGenerateImageData:forSnapshot:imageWasGenerated:imageDataGenerationSignal:logIdentifier:didSaveHandler:qos:writeToFileIfSupported:].cold.1();

LABEL_21:
}

void __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_imageAccessQueue_saveData:forSnapshot:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  XBLogFileManifest();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 56);
      v5 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 48), "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v6;
      v11 = 2114;
      v12 = v5;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_217702000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Snapshot data for %{public}@ written to file: %{public}@", (uint8_t *)&v9, 0x20u);

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke_cold_1(a1, v4, v8);
  }

}

uint64_t __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke_220(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  NSObject *v4;
  uint64_t result;

  if (*(_QWORD *)(a1 + 56))
  {
    XBLogCapture();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke_220_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  v3 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "clearImageGenerator");
  objc_msgSend(*(id *)(a1 + 40), "endImageAccess");
  if (*(_BYTE *)(a1 + 72)
    && (objc_msgSend(*v3, "hasProtectedContent") & 1) == 0
    && (objc_msgSend(*v3, "_isInvalidated") & 1) == 0
    && (objc_msgSend(*v3, "fileExists") & 1) == 0)
  {
    XBLogSnapshot();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke_220_cold_1(a1, (id *)(a1 + 40), v4);

    objc_msgSend(*v3, "_invalidate");
  }
  result = objc_msgSend(*v3, "_isInvalidated");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 48), "deleteSnapshot:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 options:(unint64_t)a5 imageGeneratedHandler:(id)a6 imageDataSavedHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  NSString *v27;
  int v28;
  uint64_t v29;
  NSString *v30;
  void *v31;
  id v32;
  id v33;
  NSString *v34;
  id v35;
  void *v36;
  XBApplicationSnapshotImageGenerator *v37;
  void *v38;
  XBApplicationSnapshotImageGenerator *v39;
  objc_class *v40;
  void *v41;
  XBApplicationSnapshotImageGenerator *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  XBApplicationSnapshotManifestImpl *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  XBApplicationSnapshotImageGenerator *v54;
  _QWORD v55[5];
  id v56;
  id v57;
  NSString *v58;
  id v59;
  int v60;
  char v61;
  _QWORD v62[5];
  id v63;
  NSString *v64;
  id v65;
  int v66;
  os_activity_scope_state_s state;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v17 = _os_activity_create(&dword_217702000, "XBCapture", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v17, &state);

  objc_msgSend(v13, "groupID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 1026, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[snapshot groupID]"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 1027, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataProvider"));

LABEL_3:
  objc_msgSend(v14, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 1028, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dataProvider context]"));

  }
  objc_msgSend(v14, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  v22 = v21;
  -[XBApplicationSnapshotManifestImpl bundleIdentifier](self, "bundleIdentifier");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a5 & 2) != 0)
    v23 = 2;
  else
    v23 = 1;
  objc_msgSend(v13, "setImageScale:", v22);
  objc_msgSend(v13, "setImageOpaque:", objc_msgSend(v20, "isOpaque"));
  objc_msgSend(v13, "beginImageAccess");
  v24 = objc_alloc_init(MEMORY[0x24BE38360]);
  v49 = v20;
  v50 = v23;
  v25 = objc_alloc_init(MEMORY[0x24BE38360]);
  v26 = v15;
  v51 = v16;
  v27 = self->_logIdentifier;
  v28 = BSPthreadCurrentEffectiveQualityOfService();
  v29 = MEMORY[0x24BDAC760];
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = __127__XBApplicationSnapshotManifestImpl_generateImageForSnapshot_dataProvider_options_imageGeneratedHandler_imageDataSavedHandler___block_invoke;
  v62[3] = &unk_24D7F4BA0;
  v62[4] = self;
  v46 = v24;
  v63 = v46;
  v30 = v27;
  v64 = v30;
  v47 = v26;
  v65 = v47;
  v66 = v28;
  v55[0] = v29;
  v31 = (void *)MEMORY[0x219A10DF4](v62);
  v55[1] = 3221225472;
  v55[2] = __127__XBApplicationSnapshotManifestImpl_generateImageForSnapshot_dataProvider_options_imageGeneratedHandler_imageDataSavedHandler___block_invoke_2;
  v55[3] = &unk_24D7F4BC8;
  v48 = self;
  v55[4] = self;
  v32 = v13;
  v56 = v32;
  v33 = v25;
  v57 = v33;
  v34 = v30;
  v58 = v34;
  v35 = v51;
  v59 = v35;
  v60 = v28;
  v61 = a5 & 1;
  v36 = (void *)MEMORY[0x219A10DF4](v55);
  v37 = [XBApplicationSnapshotImageGenerator alloc];
  +[XBApplicationSnapshotGenerationScheduler sharedInstance](XBApplicationSnapshotGenerationScheduler, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[XBApplicationSnapshotImageGenerator initWithScheduler:snapshot:dataProvider:imageDataRequest:loggingPrefix:imageGenerationHandler:imageDataGenerationHandler:](v37, "initWithScheduler:snapshot:dataProvider:imageDataRequest:loggingPrefix:imageGenerationHandler:imageDataGenerationHandler:", v38, v32, v14, ((uint64_t)(a5 << 63) >> 63) & v50, v52, v31, v36);

  if ((a5 & 4) == 0)
    -[XBApplicationSnapshotImageGenerator scheduleGeneration](v39, "scheduleGeneration");
  v40 = (objc_class *)objc_opt_class();
  NSStringFromClass(v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __127__XBApplicationSnapshotManifestImpl_generateImageForSnapshot_dataProvider_options_imageGeneratedHandler_imageDataSavedHandler___block_invoke_3;
  v53[3] = &unk_24D7F4BF0;
  v42 = v39;
  v54 = v42;
  objc_msgSend(v32, "setImageGeneratingByProvider:withBlockingImageGenerator:", v41, v53);

  -[XBApplicationSnapshotManifestImpl _addSnapshotToGroup:](v48, "_addSnapshotToGroup:", v32);
  os_activity_scope_leave(&state);

}

uint64_t __127__XBApplicationSnapshotManifestImpl_generateImageForSnapshot_dataProvider_options_imageGeneratedHandler_imageDataSavedHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didGenerateImage:imageGenerationSignal:logIdentifier:imageGeneratedHandler:qos:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64));
}

uint64_t __127__XBApplicationSnapshotManifestImpl_generateImageForSnapshot_dataProvider_options_imageGeneratedHandler_imageDataSavedHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  BYTE4(v4) = *(_BYTE *)(a1 + 76);
  LODWORD(v4) = *(_DWORD *)(a1 + 72);
  return objc_msgSend(*(id *)(a1 + 32), "_didGenerateImageData:forSnapshot:imageWasGenerated:imageDataGenerationSignal:logIdentifier:didSaveHandler:qos:writeToFileIfSupported:", a2, *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v4);
}

uint64_t __127__XBApplicationSnapshotManifestImpl_generateImageForSnapshot_dataProvider_options_imageGeneratedHandler_imageDataSavedHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "generate");
}

- (void)saveSnapshot:(id)a3 atPath:(id)a4 withContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  os_unfair_lock_s *p_accessLock;
  NSObject *v13;
  NSString *logIdentifier;
  void *v15;
  void *v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 1104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  -[XBApplicationSnapshotManifestImpl _access_addSnapshotToGroup:](self, "_access_addSnapshotToGroup:", v9);
  objc_msgSend(v9, "_configureWithPath:", v10);
  objc_msgSend(v11, "scale");
  objc_msgSend(v9, "setImageScale:");
  objc_msgSend(v9, "setImageOpaque:", objc_msgSend(v11, "isOpaque"));
  -[XBApplicationSnapshotManifestImpl _noteDirtied](self, "_noteDirtied");
  XBLogFileManifest();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    logIdentifier = self->_logIdentifier;
    objc_msgSend(v9, "succinctDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = logIdentifier;
    v19 = 2114;
    v20 = v15;
    _os_log_impl(&dword_217702000, v13, OS_LOG_TYPE_INFO, "%{public}@ Saved snapshot: %{public}@", buf, 0x16u);

  }
  os_unfair_lock_unlock(p_accessLock);

}

- (void)deleteSnapshot:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[XBApplicationSnapshotManifestImpl deleteSnapshots:](self, "deleteSnapshots:", v6, v7, v8);
  }
}

- (void)deleteSnapshots:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *logIdentifier;
  void *v7;
  int v8;
  NSString *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  if (objc_msgSend(v4, "count"))
  {
    XBLogFileManifest();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      logIdentifier = self->_logIdentifier;
      objc_msgSend(v4, "arrayByApplyingSelector:", sel_succinctDescription);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = logIdentifier;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_217702000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Deleting snapshots: %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }
  -[XBApplicationSnapshotManifestImpl _access_deleteSnapshots:](self, "_access_deleteSnapshots:", v4);
  os_unfair_lock_unlock(&self->_accessLock);

}

- (void)deleteSnapshotsMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSString *logIdentifier;
  void *v8;
  int v9;
  NSString *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  -[XBApplicationSnapshotManifestImpl _access_snapshotsMatchingPredicate:](self, "_access_snapshotsMatchingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    XBLogFileManifest();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      logIdentifier = self->_logIdentifier;
      objc_msgSend(v5, "arrayByApplyingSelector:", sel_succinctDescription);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = logIdentifier;
      v11 = 2114;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_217702000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Deleting snapshots: %{public}@ matching predicate: %@", (uint8_t *)&v9, 0x20u);

    }
  }
  -[XBApplicationSnapshotManifestImpl _access_deleteSnapshots:](self, "_access_deleteSnapshots:", v5);
  os_unfair_lock_unlock(&self->_accessLock);

}

- (void)deleteSnapshotsUsingPredicateBuilder:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  +[XBApplicationSnapshotPredicate predicate](XBApplicationSnapshotPredicate, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v5[2](v5, v4);
  -[XBApplicationSnapshotManifestImpl deleteSnapshotsMatchingPredicate:](self, "deleteSnapshotsMatchingPredicate:", v4);

}

- (void)deleteSnapshotsForGroupID:(id)a3 predicateBuilder:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, void *))a4;
  +[XBApplicationSnapshotPredicate predicate](XBApplicationSnapshotPredicate, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v6[2](v6, v7);
  -[XBApplicationSnapshotManifestImpl deleteSnapshotsForGroupID:matchingPredicate:](self, "deleteSnapshotsForGroupID:matchingPredicate:", v8, v7);

}

- (void)deleteSnapshotsForGroupID:(id)a3 matchingPredicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSString *logIdentifier;
  void *v12;
  int v13;
  NSString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  v19[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshotManifestImpl _access_snapshotsForGroupIDs:matchingPredicate:](self, "_access_snapshotsForGroupIDs:matchingPredicate:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    XBLogFileManifest();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      logIdentifier = self->_logIdentifier;
      objc_msgSend(v9, "arrayByApplyingSelector:", sel_succinctDescription);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = logIdentifier;
      v15 = 2114;
      v16 = v12;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_217702000, v10, OS_LOG_TYPE_INFO, "%{public}@ Deleting snapshots: %{public}@ matching predicate: %@", (uint8_t *)&v13, 0x20u);

    }
  }
  -[XBApplicationSnapshotManifestImpl _access_deleteSnapshots:](self, "_access_deleteSnapshots:", v9);
  os_unfair_lock_unlock(&self->_accessLock);

}

- (void)deleteSnapshotsForGroupID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSString *logIdentifier;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  NSString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  -[XBApplicationSnapshotManifestImpl _access_snapshotGroupForID:creatingIfNeeded:](self, "_access_snapshotGroupForID:creatingIfNeeded:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    XBLogFileManifest();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      logIdentifier = self->_logIdentifier;
      *(_DWORD *)buf = 138543618;
      v12 = logIdentifier;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_217702000, v6, OS_LOG_TYPE_INFO, "%{public}@ Deleting all snapshots for group: %{public}@.", buf, 0x16u);
    }

    objc_msgSend(v5, "_invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_snapshotGroupsByID, "removeObjectForKey:", v4);
    -[XBApplicationSnapshotManifestImpl _noteDirtied](self, "_noteDirtied");
    objc_msgSend(v5, "containerPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[XBApplicationSnapshotManifestImpl _access_deletePaths:](self, "_access_deletePaths:", v9);

  }
  os_unfair_lock_unlock(&self->_accessLock);

}

- (void)purgeSnapshotsWithProtectedContent
{
  os_unfair_lock_s *p_accessLock;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[XBApplicationSnapshotManifestImpl _access_purgeSnapshotsWithProtectedContent](self, "_access_purgeSnapshotsWithProtectedContent");
  os_unfair_lock_unlock(p_accessLock);
}

- (void)updateSnapshotsAPFSPurgability:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_accessLock;

  v3 = a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[XBApplicationSnapshotManifestImpl _access_updateSnapshotsAPFSPurgability:](self, "_access_updateSnapshotsAPFSPurgability:", v3);
  os_unfair_lock_unlock(p_accessLock);
}

- (BOOL)snapshotsConsideredUnpurgableByAPFS
{
  XBApplicationSnapshotManifestImpl *v2;
  os_unfair_lock_s *p_accessLock;

  v2 = self;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  LOBYTE(v2) = -[XBApplicationSnapshotManifestImpl _access_snapshotsConsideredUnpurgableByAPFS](v2, "_access_snapshotsConsideredUnpurgableByAPFS");
  os_unfair_lock_unlock(p_accessLock);
  return (char)v2;
}

- (void)deleteAllSnapshots
{
  os_unfair_lock_s *p_accessLock;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  XBLogFileManifest();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[XBApplicationSnapshotManifestImpl bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_impl(&dword_217702000, v4, OS_LOG_TYPE_INFO, "%{public}@ Deleting all snapshots.", buf, 0xCu);

  }
  -[XBApplicationSnapshotManifestImpl _noteDirtied](self, "_noteDirtied");
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_snapshotGroupsByID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_236);
  -[NSMutableDictionary removeAllObjects](self->_snapshotGroupsByID, "removeAllObjects");
  -[XBApplicationSnapshotManifestImpl containerPath](self, "containerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshotManifestImpl _access_deletePaths:](self, "_access_deletePaths:", v7);

  os_unfair_lock_unlock(p_accessLock);
}

uint64_t __55__XBApplicationSnapshotManifestImpl_deleteAllSnapshots__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_invalidate");
}

- (void)beginSnapshotAccessTransaction:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
  +[XBApplicationSnapshotGenerationScheduler sharedInstance](XBApplicationSnapshotGenerationScheduler, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke;
  v9[3] = &unk_24D7F4C80;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performImageGenerationAsync:", v9);

}

void __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  _QWORD v3[5];
  id v4;

  v1 = __ManifestSerialWorkQueue;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke_2;
  v3[3] = &unk_24D7F4C80;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(v1, v3);

}

void __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 100));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 100));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke_3;
  v3[3] = &unk_24D7F4C58;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_access_accessSnapshotsWithBlock:completion:", 0, v3);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 100));

}

void __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = __ManifestCallOutQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke_4;
  block[3] = &unk_24D7F4C58;
  v3 = *(id *)(a1 + 32);
  dispatch_async(v1, block);

}

uint64_t __79__XBApplicationSnapshotManifestImpl_beginSnapshotAccessTransaction_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_snapshotGroupsByID
{
  return self->_snapshotGroupsByID;
}

- (BOOL)_invalidate
{
  return -[BSAtomicSignal signal](self->_invalidatedSignal, "signal");
}

- (id)_allSnapshotGroups
{
  os_unfair_lock_s *p_accessLock;
  void *v4;
  void *v5;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[XBApplicationSnapshotManifestImpl _access_allSnapshotGroups](self, "_access_allSnapshotGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_accessLock);
  return v5;
}

- (id)_access_allSnapshotGroups
{
  os_unfair_lock_assert_owner(&self->_accessLock);
  return (id)-[NSMutableDictionary allValues](self->_snapshotGroupsByID, "allValues");
}

- (void)_synchronizeDataStoreWithCompletion:(id)a3
{
  if (!a3)
    a3 = &__block_literal_global_241;
  -[XBApplicationSnapshotManifestImpl _scheduleArchivingIfNecessaryWithCompletion:](self, "_scheduleArchivingIfNecessaryWithCompletion:", a3);
}

- (void)archive
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  _QWORD v5[4];
  dispatch_semaphore_t v6;

  v3 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__XBApplicationSnapshotManifestImpl_archive__block_invoke;
  v5[3] = &unk_24D7F4328;
  v6 = v3;
  v4 = v3;
  -[XBApplicationSnapshotManifestImpl _scheduleArchivingIfNecessaryWithDelay:completion:](self, "_scheduleArchivingIfNecessaryWithDelay:completion:", v5, 0.0);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __44__XBApplicationSnapshotManifestImpl_archive__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_handleMemoryPressure
{
  os_unfair_lock_s *p_accessLock;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[XBApplicationSnapshotManifestImpl _access_purgeSnapshotsWithProtectedContent](self, "_access_purgeSnapshotsWithProtectedContent");
  os_unfair_lock_unlock(p_accessLock);
}

void __70__XBApplicationSnapshotManifestImpl__access_doArchiveWithCompletions___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__XBApplicationSnapshotManifestImpl__access_doArchiveWithCompletions___block_invoke_2;
  v3[3] = &unk_24D7F4328;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "synchronizeForBundleIdentifier:withCompletion:", v2, v3);

}

void __70__XBApplicationSnapshotManifestImpl__access_doArchiveWithCompletions___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (BOOL)_validateWithContainerIdentity:(id)a3
{
  id v5;
  os_unfair_lock_s *p_accessLock;
  BOOL v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 1493, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerIdentity"));

  }
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  v7 = -[XBApplicationSnapshotManifestImpl _access_validateWithContainerIdentity:](self, "_access_validateWithContainerIdentity:", v5);
  os_unfair_lock_unlock(p_accessLock);

  return v7;
}

- (BOOL)_access_validateWithContainerIdentity:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  BOOL v18;
  NSString *logIdentifier;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  XBApplicationSnapshotManifestImpl *v25;
  uint8_t buf[4];
  NSString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 1504, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerIdentity"));

  }
  os_unfair_lock_assert_owner(&self->_accessLock);
  -[XBApplicationSnapshotManifestImpl _setContainerIdentity:](self, "_setContainerIdentity:", v5);
  v6 = (void *)-[NSMutableDictionary copy](self->_snapshotGroupsByID, "copy");
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __75__XBApplicationSnapshotManifestImpl__access_validateWithContainerIdentity___block_invoke;
  v23[3] = &unk_24D7F4D18;
  v7 = v5;
  v24 = v7;
  v25 = self;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v23);
  objc_msgSend(v7, "snapshotContainerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableDictionary count](self->_snapshotGroupsByID, "count"))
    v9 = 1;
  else
    v9 = v8 == 0;
  if (!v9)
  {
    XBLogFileManifest();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[XBApplicationSnapshotManifestImpl bundleIdentifier](self, "bundleIdentifier");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v11;
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_217702000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Manifest is empty; purging everything at %@",
        buf,
        0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v13 = objc_msgSend(v12, "removeItemAtPath:error:", v8, &v22);
    v14 = v22;

    if ((v13 & 1) != 0)
      goto LABEL_17;
    objc_msgSend(v14, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      v16 = objc_msgSend(v14, "code");

      if (v16 == 4)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {

    }
    XBLogFileManifest();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      logIdentifier = self->_logIdentifier;
      *(_DWORD *)buf = 138543874;
      v27 = logIdentifier;
      v28 = 2114;
      v29 = v8;
      v30 = 2114;
      v31 = v14;
      _os_log_error_impl(&dword_217702000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Error removing snapshotContainer for purge at %{public}@: %{public}@", buf, 0x20u);
    }

    goto LABEL_17;
  }
LABEL_18:
  v18 = -[NSMutableDictionary count](self->_snapshotGroupsByID, "count") != 0;

  return v18;
}

void __75__XBApplicationSnapshotManifestImpl__access_validateWithContainerIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v6, "_validateWithContainerIdentity:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    XBLogFileManifest();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112);
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_217702000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ group isn't valid. removing from snapshotGroupsByID and will be culled later: %@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObjectForKey:", v5);
  }

}

uint64_t __84__XBApplicationSnapshotManifestImpl__access_workloop_reapExpiredAndInvalidSnapshots__block_invoke_249(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteDirtied");
}

void __57__XBApplicationSnapshotManifestImpl__access_deletePaths___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v12 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v12);
  v6 = v12;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      v9 = objc_msgSend(v7, "code");

      if (v9 == 4)
        goto LABEL_9;
    }
    else
    {

    }
    XBLogFileManifest();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112);
      *(_DWORD *)buf = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = v3;
      v17 = 2114;
      v18 = v7;
      _os_log_error_impl(&dword_217702000, v10, OS_LOG_TYPE_ERROR, "%{public}@ error deleting path %@: %{public}@", buf, 0x20u);
    }

  }
LABEL_9:

}

- (void)_access_purgeSnapshotsWithProtectedContent
{
  void *v3;
  NSMutableDictionary *snapshotGroupsByID;
  uint64_t v5;
  _QWORD block[6];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  os_unfair_lock_assert_owner(&self->_accessLock);
  -[XBApplicationSnapshotManifestImpl _noteDirtied](self, "_noteDirtied");
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  snapshotGroupsByID = self->_snapshotGroupsByID;
  v5 = MEMORY[0x24BDAC760];
  v13 = v3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__XBApplicationSnapshotManifestImpl__access_purgeSnapshotsWithProtectedContent__block_invoke;
  v7[3] = &unk_24D7F4DE0;
  v7[4] = &v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](snapshotGroupsByID, "enumerateKeysAndObjectsUsingBlock:", v7);
  if (objc_msgSend((id)v9[5], "count"))
  {
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __79__XBApplicationSnapshotManifestImpl__access_purgeSnapshotsWithProtectedContent__block_invoke_2;
    block[3] = &unk_24D7F4CC8;
    block[4] = self;
    block[5] = &v8;
    dispatch_async((dispatch_queue_t)__ManifestCallOutQueue, block);
  }
  _Block_object_dispose(&v8, 8);

}

void __79__XBApplicationSnapshotManifestImpl__access_purgeSnapshotsWithProtectedContent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "snapshots");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v14, "hasProtectedContent", (_QWORD)v15))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
          objc_msgSend(v6, "removeSnapshot:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

void __79__XBApplicationSnapshotManifestImpl__access_purgeSnapshotsWithProtectedContent__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manifest:didPurgeProtectedContentSnapshotsWithGroupIdentifiers:", v2, v3);

}

- (void)_access_updateSnapshotsAPFSPurgability:(BOOL)a3
{
  NSMutableDictionary *snapshotGroupsByID;
  _QWORD v6[5];
  BOOL v7;

  os_unfair_lock_assert_owner(&self->_accessLock);
  snapshotGroupsByID = self->_snapshotGroupsByID;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__XBApplicationSnapshotManifestImpl__access_updateSnapshotsAPFSPurgability___block_invoke;
  v6[3] = &unk_24D7F4E08;
  v7 = a3;
  v6[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](snapshotGroupsByID, "enumerateKeysAndObjectsUsingBlock:", v6);
}

void __76__XBApplicationSnapshotManifestImpl__access_updateSnapshotsAPFSPurgability___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  int *v21;
  char *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "snapshots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v29;
    *(_QWORD *)&v5 = 138544386;
    v24 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v8);
        if (objc_msgSend(v9, "fileLocation", v24) != 3)
        {
          v10 = XBApplicationSnapshotContentTypeMaskForContentType(objc_msgSend(v9, "contentType"));
          objc_msgSend(v9, "path");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "path");
          v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v13 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");

          if (v13)
          {
            v14 = (v10 & 6) != 0 ? 0 : 67588;
            v15 = (v10 & 6) != 0 ? 67588 : 66564;
            v16 = *(_BYTE *)(a1 + 40) ? v14 : v15;
            v26 = 0;
            v27 = v16;
            if (!fsctl(v13, 0x40084A47uLL, &v26, 0) && (unsigned __int16)v27 != (unsigned __int16)v26)
            {
              v17 = fsctl(v13, 0xC0084A44uLL, &v27, 0);
              if (v17)
              {
                v18 = v17;
                XBLogPurge();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
                  v21 = __error();
                  v22 = strerror(*v21);
                  *(_DWORD *)buf = v24;
                  v33 = v20;
                  v34 = 2112;
                  v35 = v11;
                  v36 = 1024;
                  v37 = v18;
                  v38 = 2080;
                  v39 = v22;
                  v40 = 2048;
                  v41 = v27;
                  _os_log_error_impl(&dword_217702000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to mark %@ as purgeable %d (%s) (flags 0x%llx)", buf, 0x30u);
                }

              }
            }
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v23 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
      v6 = v23;
    }
    while (v23);
  }

}

- (BOOL)_access_snapshotsConsideredUnpurgableByAPFS
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_accessLock);
  -[XBApplicationSnapshotManifestImpl defaultGroupIdentifier](self, "defaultGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshotManifestImpl _access_snapshotsForGroupIDs:](self, "_access_snapshotsForGroupIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "fileLocation") != 3)
        {
          objc_msgSend(v10, "path");
          v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v12 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");

          if (v12)
          {
            v14 = 0;
            if (!fsctl(v12, 0x40084A47uLL, &v14, 0) && (v14 & 0xC00) == 0)
            {
              LOBYTE(v7) = 1;
              goto LABEL_14;
            }
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

  return v7;
}

void __69__XBApplicationSnapshotManifestImpl__access_gatherPaths_forSnapshot___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

- (id)_access_snapshotsForGroupIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_accessLock);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKey:](self->_snapshotGroupsByID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "snapshots");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_access_snapshotsMatchingPredicate:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  void *v6;
  void *v7;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_accessLock);
  -[NSMutableDictionary allKeys](self->_snapshotGroupsByID, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshotManifestImpl _access_snapshotsForGroupIDs:matchingPredicate:](self, "_access_snapshotsForGroupIDs:matchingPredicate:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_imageAccessQueue_saveData:(id)a3 forSnapshot:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  unsigned int (**v15)(_QWORD, _QWORD);
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  NSString *logIdentifier;
  int *v28;
  char *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  XBApplicationSnapshotManifestImpl *v34;
  id v35;
  uint8_t buf[4];
  NSString *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  int v41;
  __int16 v42;
  char *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  BSDispatchQueueAssert();
  v9 = objc_msgSend(v7, "length");
  v10 = 0;
  if (v8 && v9)
  {
    objc_msgSend(v8, "_configureDefaultPathWithinGroupForFormat:", objc_msgSend((id)objc_opt_class(), "_outputFormatForSnapshot:", v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 1856, CFSTR("generated nil path for snapshot %@"), v8);

    }
    objc_msgSend(v11, "stringByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!XBEnsureDirectoryExistsAtPath(v12))
    {
      XBLogFileManifest();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[XBApplicationSnapshotManifestImpl _imageAccessQueue_saveData:forSnapshot:].cold.2();

    }
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __76__XBApplicationSnapshotManifestImpl__imageAccessQueue_saveData_forSnapshot___block_invoke;
    v32[3] = &unk_24D7F4E58;
    v33 = v7;
    v34 = self;
    v14 = v11;
    v35 = v14;
    v15 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x219A10DF4](v32);
    if (!v11
      || (v16 = objc_retainAutorelease(v14),
          v17 = open((const char *)objc_msgSend(v16, "fileSystemRepresentation"), 1793, 438),
          (v17 & 0x80000000) != 0))
    {
      v10 = 0;
LABEL_28:

      goto LABEL_29;
    }
    v18 = v17;
    v19 = XBApplicationSnapshotContentTypeMaskForContentType(objc_msgSend(v8, "contentType")) & 6;
    v20 = 2;
    if (v19)
      v20 = 3;
    if (fcntl(v18, 64, v20) == -1)
    {
      XBLogFileManifest();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[XBApplicationSnapshotManifestImpl _imageAccessQueue_saveData:forSnapshot:].cold.1();

    }
    else if (v15[2](v15, v18))
    {
      v21 = 67588;
      if (v19)
        v21 = 0;
      v31 = v21;
      v22 = ffsctl(v18, 0xC0084A44uLL, &v31, 0);
      if (v22)
      {
        v23 = v22;
        XBLogFileManifest();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          logIdentifier = self->_logIdentifier;
          v28 = __error();
          v29 = strerror(*v28);
          *(_DWORD *)buf = 138544386;
          v37 = logIdentifier;
          v38 = 2112;
          v39 = v16;
          v40 = 1024;
          v41 = v23;
          v42 = 2080;
          v43 = v29;
          v44 = 2048;
          v45 = v31;
          _os_log_error_impl(&dword_217702000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Failed to mark %@ as purgeable %d (%s) (flags 0x%llx)", buf, 0x30u);
        }

      }
      v10 = 1;
      goto LABEL_27;
    }
    v10 = 0;
LABEL_27:
    close(v18);
    goto LABEL_28;
  }
LABEL_29:

  return v10;
}

BOOL __76__XBApplicationSnapshotManifestImpl__imageAccessQueue_saveData_forSnapshot___block_invoke(uint64_t a1, int a2)
{
  ssize_t v2;
  NSObject *v3;

  v2 = write(a2, (const void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"));
  if (v2 == -1)
  {
    XBLogFileManifest();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __76__XBApplicationSnapshotManifestImpl__imageAccessQueue_saveData_forSnapshot___block_invoke_cold_1();

  }
  return v2 != -1;
}

- (void)_workloop_incrementClientCount
{
  NSObject *v3;
  NSString *logIdentifier;
  unint64_t clientCount;
  int v6;
  NSString *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)__ManifestWorkloop);
  ++self->_clientCount;
  XBLogFileManifest();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    logIdentifier = self->_logIdentifier;
    clientCount = self->_clientCount;
    v6 = 138543618;
    v7 = logIdentifier;
    v8 = 1024;
    v9 = clientCount;
    _os_log_impl(&dword_217702000, v3, OS_LOG_TYPE_INFO, "%{public}@ Incrementing client count: %u", (uint8_t *)&v6, 0x12u);
  }

}

- (void)_workloop_decrementClientCount
{
  NSObject *v3;
  NSString *logIdentifier;
  unint64_t clientCount;
  int v6;
  NSString *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)__ManifestWorkloop);
  --self->_clientCount;
  XBLogFileManifest();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    logIdentifier = self->_logIdentifier;
    clientCount = self->_clientCount;
    v6 = 138543618;
    v7 = logIdentifier;
    v8 = 1024;
    v9 = clientCount;
    _os_log_impl(&dword_217702000, v3, OS_LOG_TYPE_INFO, "%{public}@ Decrementing client count: %u", (uint8_t *)&v6, 0x12u);
  }

  -[XBApplicationSnapshotManifestImpl _workloop_checkClientCount](self, "_workloop_checkClientCount");
}

_BYTE *__69__XBApplicationSnapshotManifestImpl__workloop_reallyCheckClientCount__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[96])
  {
    result = (_BYTE *)objc_msgSend(result, "_invalidate");
    if ((_DWORD)result)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

+ (int64_t)_outputFormatForSnapshot:(id)a3
{
  id v3;
  BOOL v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  if (_outputFormatForSnapshot__onceToken != -1)
    dispatch_once(&_outputFormatForSnapshot__onceToken, &__block_literal_global_259);
  if (_outputFormatForSnapshot__wideColorDisplay)
    v4 = _outputFormatForSnapshot__supportsASTC == 0;
  else
    v4 = 1;
  v5 = !v4;
  if (v4 && _outputFormatForSnapshot__supportsASTC)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 || objc_msgSend(v3, "contentType"))
    {
      v5 = 1;
    }
    else if (objc_msgSend(v3, "isImageOpaque"))
    {
      v5 = 3;
    }
    else
    {
      v5 = 1;
    }
  }

  return v5;
}

uint64_t __62__XBApplicationSnapshotManifestImpl__outputFormatForSnapshot___block_invoke()
{
  uint64_t result;

  _outputFormatForSnapshot__supportsASTC = MGGetBoolAnswer();
  result = MGGetBoolAnswer();
  _outputFormatForSnapshot__wideColorDisplay = result;
  return result;
}

- (XBApplicationSnapshotManifestImpl)initWithCoder:(id)a3
{
  id v4;
  XBApplicationSnapshotManifestImpl *v5;
  XBApplicationSnapshotManifestImpl *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  NSString *logIdentifier;
  objc_super v20;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)XBApplicationSnapshotManifestImpl;
  v5 = -[XBApplicationSnapshotManifestImpl init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    -[XBApplicationSnapshotManifestImpl _commonInit](v5, "_commonInit");
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    if (v7 < 3)
    {
      v16 = v7;
      XBLogFileManifest();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        logIdentifier = v6->_logIdentifier;
        *(_DWORD *)buf = 138543874;
        v22 = logIdentifier;
        v23 = 1024;
        v24 = v16;
        v25 = 1024;
        v26 = 3;
        _os_log_impl(&dword_217702000, v17, OS_LOG_TYPE_INFO, "%{public}@ Snapshot manifest out of date (currVers=%d, newVers=%d).", buf, 0x18u);
      }

      -[XBApplicationSnapshotManifestImpl _invalidate](v6, "_invalidate");
      v6 = 0;
    }
    else
    {
      v8 = (void *)MEMORY[0x219A10C5C]();
      v9 = (void *)MEMORY[0x24BDBCF20];
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("snapshots"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        XBLogFileManifest();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[XBApplicationSnapshotManifestImpl initWithCoder:].cold.1();

        -[XBApplicationSnapshotManifestImpl _invalidate](v6, "_invalidate");
        v6 = 0;
      }
      else
      {
        objc_storeStrong((id *)&v6->_snapshotGroupsByID, v13);
      }

      objc_autoreleasePoolPop(v8);
    }
  }

  return v6;
}

- (id)_descriptionForStateCaptureWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[XBApplicationSnapshotManifestImpl succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__XBApplicationSnapshotManifestImpl__descriptionForStateCaptureWithMultilinePrefix___block_invoke;
  v9[3] = &unk_24D7F4638;
  v9[4] = self;
  v6 = v5;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  if (*((_BYTE *)v13 + 24))
  {
    objc_msgSend(v6, "build");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __84__XBApplicationSnapshotManifestImpl__descriptionForStateCaptureWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "_allSnapshotGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __84__XBApplicationSnapshotManifestImpl__descriptionForStateCaptureWithMultilinePrefix___block_invoke_2;
  v5[3] = &unk_24D7F4EA0;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

}

void __84__XBApplicationSnapshotManifestImpl__descriptionForStateCaptureWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "activeMultilinePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionForStateCaptureWithMultilinePrefix:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v8, 0);
    v6 = v8;
  }

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[XBApplicationSnapshotManifestImpl succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBApplicationSnapshotManifestImpl bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("bundleID"), 1);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[XBApplicationSnapshotManifestImpl descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  XBApplicationSnapshotManifestImpl *v12;

  v4 = a3;
  -[XBApplicationSnapshotManifestImpl succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendUnsignedInteger:withName:", self->_clientCount, CFSTR("clientCount"));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__XBApplicationSnapshotManifestImpl_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_24D7F45F0;
  v7 = v5;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v8 = v7;
  return v8;
}

void __75__XBApplicationSnapshotManifestImpl_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "containerIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("containerIdentity"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_allSnapshotGroups");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:skipIfEmpty:", v6, CFSTR("snapshots"), 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_baseLogIdentifier, 0);
  objc_storeStrong((id *)&self->_archiveSchedulingQueue_synchronizeCompletions, 0);
  objc_storeStrong((id *)&self->_invalidatedSignal, 0);
  objc_storeStrong((id *)&self->_reapingTimer, 0);
  objc_storeStrong((id *)&self->_imageAccessFileManger, 0);
  objc_storeStrong((id *)&self->_snapshotGroupsByID, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

void __99__XBApplicationSnapshotManifestImpl_acquireManifestForContainerIdentity_store_creatingIfNecessary___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_2(&dword_217702000, v0, (uint64_t)v0, "acquireManifestForContainerIdentity:store:creatingIfNecessary: [%{public}@] Unable to unarchive manifest from store: %@", v1);
  OUTLINED_FUNCTION_5();
}

- (void)snapshotsForGroupIDs:(NSObject *)a3 fetchRequest:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "bs_map:", &__block_literal_global_212);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_217702000, a3, v5, "[%@] END snapshotsForGroupIDs:fetchRequest: returning matchingSnapshots:\n\t%@", v6);

  OUTLINED_FUNCTION_1_0();
}

- (void)snapshotsForGroupIDs:fetchRequest:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_217702000, v0, v1, "[%@] snapshotsForGroupIDs:fetchRequest: scheme %@ requested but there's no launch interface representing it");
  OUTLINED_FUNCTION_5();
}

- (void)snapshotsForGroupIDs:(NSObject *)a3 fetchRequest:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "bs_map:", &__block_literal_global_208);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_217702000, a3, v5, "[%@] snapshotsForGroupIDs:fetchRequest: fetchRequest has no predicate; retrieved matchingSnapshots:\n\t%@",
    v6);

  OUTLINED_FUNCTION_1_0();
}

- (void)_didGenerateImage:imageGenerationSignal:logIdentifier:imageGeneratedHandler:qos:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_217702000, v0, v1, "%{public}@ ignoring redundant imageDataGenerationHandler callback as we've already processed one. didGenerateImage: %@");
  OUTLINED_FUNCTION_5();
}

- (void)_didGenerateImage:imageGenerationSignal:logIdentifier:imageGeneratedHandler:qos:.cold.2()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_217702000, v1, OS_LOG_TYPE_DEBUG, "%{public}@ processing imageGenerationHandler callback with didGenerateImage: %d", v2, 0x12u);
  OUTLINED_FUNCTION_5();
}

- (void)_didGenerateImage:imageGenerationSignal:logIdentifier:imageGeneratedHandler:qos:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2(&dword_217702000, v0, v1, "%{public}@ inside imageGenerationHandler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_didGenerateImageData:forSnapshot:imageWasGenerated:imageDataGenerationSignal:logIdentifier:didSaveHandler:qos:writeToFileIfSupported:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_217702000, v0, v1, "%{public}@ ignoring redundant imageDataGenerationHandler callback as we've already processed one. imageData: %p");
  OUTLINED_FUNCTION_5();
}

- (void)_didGenerateImageData:forSnapshot:imageWasGenerated:imageDataGenerationSignal:logIdentifier:didSaveHandler:qos:writeToFileIfSupported:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2(&dword_217702000, v0, v1, "%{public}@ inside imageDataGenerationHandler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  OUTLINED_FUNCTION_0_2(&dword_217702000, a2, a3, "%{public}@ Error writing snapshot %{public}@ to file", (uint8_t *)&v5);
  OUTLINED_FUNCTION_5();
}

void __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke_220_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*a2, "logIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_0_2(&dword_217702000, a3, v6, "%{public}@ we expected to receive and save image data for snapshot but failed. invalidating. snapshot: %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_0();
}

void __171__XBApplicationSnapshotManifestImpl__didGenerateImageData_forSnapshot_imageWasGenerated_imageDataGenerationSignal_logIdentifier_didSaveHandler_qos_writeToFileIfSupported___block_invoke_220_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_217702000, v0, v1, "%{public}@ calling didSaveHandler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_access_doArchiveWithCompletions:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_217702000, v0, (uint64_t)v0, "%{public}@ Unable to archive manifest: %{public}@", v1);
  OUTLINED_FUNCTION_5();
}

void __84__XBApplicationSnapshotManifestImpl__access_workloop_reapExpiredAndInvalidSnapshots__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_217702000, v0, v1, "%{public}@ Reaping timer fired! Cancelling timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_imageAccessQueue_saveData:forSnapshot:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = __error();
  OUTLINED_FUNCTION_14(v0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_217702000, v1, v2, "%{public}@ Failed to call fcntl on fd for %@: (%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_12();
}

- (void)_imageAccessQueue_saveData:forSnapshot:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_217702000, v0, (uint64_t)v0, "%{public}@ XBEnsureDirectoryExistsAtPath() check failed for: %{public}@", v1);
  OUTLINED_FUNCTION_5();
}

void __76__XBApplicationSnapshotManifestImpl__imageAccessQueue_saveData_forSnapshot___block_invoke_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = __error();
  OUTLINED_FUNCTION_14(v0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_217702000, v1, v2, "%{public}@ Failed to write to %@: (%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_12();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_217702000, v0, (uint64_t)v0, "%{public}@ Failed to decode from decoder with error: %{public}@", v1);
  OUTLINED_FUNCTION_5();
}

@end
