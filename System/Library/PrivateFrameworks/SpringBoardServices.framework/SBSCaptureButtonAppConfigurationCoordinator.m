@implementation SBSCaptureButtonAppConfigurationCoordinator

- (SBSCaptureButtonAppConfigurationCoordinator)init
{
  SBSCaptureButtonAppConfigurationCoordinator *v2;
  SBSCaptureButtonAppConfigurationClient *v3;
  SBSCaptureButtonAppConfigurationClient *client;
  NSMapTable *v5;
  NSMapTable *associatedAppObserversToBlocks;
  NSMapTable *v7;
  NSMapTable *eligibleAppsObserversToBlocks;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSCaptureButtonAppConfigurationCoordinator;
  v2 = -[SBSCaptureButtonAppConfigurationCoordinator init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SBSCaptureButtonAppConfigurationClient);
    client = v2->_client;
    v2->_client = v3;

    -[SBSCaptureButtonAppConfigurationClient setDelegate:](v2->_client, "setDelegate:", v2);
    v5 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E0CB3748]);
    associatedAppObserversToBlocks = v2->_associatedAppObserversToBlocks;
    v2->_associatedAppObserversToBlocks = v5;

    v7 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E0CB3748]);
    eligibleAppsObserversToBlocks = v2->_eligibleAppsObserversToBlocks;
    v2->_eligibleAppsObserversToBlocks = v7;

    *(_WORD *)&v2->_isAssociatedAppKnown = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMapTable removeAllObjects](self->_associatedAppObserversToBlocks, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_eligibleAppsObserversToBlocks, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)SBSCaptureButtonAppConfigurationCoordinator;
  -[SBSCaptureButtonAppConfigurationCoordinator dealloc](&v3, sel_dealloc);
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  if (!v4 || -[NSSet containsObject:](self->_currentEligibleAppsBundleIdentifiers, "containsObject:", v4))
  {
    -[SBSCaptureButtonAppConfigurationClient establishConnectionIfNeeded](self->_client, "establishConnectionIfNeeded");
    -[SBSCaptureButtonAppConfigurationClient setCurrentAssociatedAppUsingBundleIdentifier:](self->_client, "setCurrentAssociatedAppUsingBundleIdentifier:", v4);
  }

}

- (id)addObserverForAssociatedAppUpdatesUsingBlock:(id)a3
{
  void (**v5)(id, NSString *);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMapTable *associatedAppObserversToBlocks;
  void *v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;

  v5 = (void (**)(id, NSString *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSCaptureButtonAppConfigurationCoordinator.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x1E0D01868]);
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("(Active App Observer) %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __92__SBSCaptureButtonAppConfigurationCoordinator_addObserverForAssociatedAppUpdatesUsingBlock___block_invoke;
  v16[3] = &unk_1E288D440;
  objc_copyWeak(&v17, &location);
  v11 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:invalidationBlock:", v10, CFSTR("Add observer for active app updates"), v16);

  associatedAppObserversToBlocks = self->_associatedAppObserversToBlocks;
  v13 = (void *)MEMORY[0x193FF87DC](v5);
  -[NSMapTable setObject:forKey:](associatedAppObserversToBlocks, "setObject:forKey:", v13, v11);

  if (self->_isAssociatedAppKnown)
    v5[2](v5, self->_currentAssociatedAppBundleIdentifier);
  -[SBSCaptureButtonAppConfigurationClient establishConnectionIfNeeded](self->_client, "establishConnectionIfNeeded");
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

void __92__SBSCaptureButtonAppConfigurationCoordinator_addObserverForAssociatedAppUpdatesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[2], "removeObjectForKey:", v5);

}

- (id)addObserverForEligibleAppsUpdatesUsingBlock:(id)a3
{
  void (**v5)(id, NSSet *);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMapTable *eligibleAppsObserversToBlocks;
  void *v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;

  v5 = (void (**)(id, NSSet *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSCaptureButtonAppConfigurationCoordinator.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x1E0D01868]);
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("(Eligible Apps Observer) %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__SBSCaptureButtonAppConfigurationCoordinator_addObserverForEligibleAppsUpdatesUsingBlock___block_invoke;
  v16[3] = &unk_1E288D440;
  objc_copyWeak(&v17, &location);
  v11 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:invalidationBlock:", v10, CFSTR("Add observer for eligible apps updates"), v16);

  eligibleAppsObserversToBlocks = self->_eligibleAppsObserversToBlocks;
  v13 = (void *)MEMORY[0x193FF87DC](v5);
  -[NSMapTable setObject:forKey:](eligibleAppsObserversToBlocks, "setObject:forKey:", v13, v11);

  if (self->_isEligibleAppsKnown)
    v5[2](v5, self->_currentEligibleAppsBundleIdentifiers);
  -[SBSCaptureButtonAppConfigurationClient establishConnectionIfNeeded](self->_client, "establishConnectionIfNeeded");
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

void __91__SBSCaptureButtonAppConfigurationCoordinator_addObserverForEligibleAppsUpdatesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[3], "removeObjectForKey:", v5);

}

- (void)captureButtonAppConfigurationClient:(id)a3 receiveInitialOrUpdatedAssociatedAppBundleIdentifier:(id)a4
{
  id v5;
  NSString *v6;
  NSString *currentAssociatedAppBundleIdentifier;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  BSDispatchQueueAssertMain();
  v6 = (NSString *)objc_msgSend(v5, "copy");
  currentAssociatedAppBundleIdentifier = self->_currentAssociatedAppBundleIdentifier;
  self->_currentAssociatedAppBundleIdentifier = v6;

  self->_isAssociatedAppKnown = 1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMapTable objectEnumerator](self->_associatedAppObserversToBlocks, "objectEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)captureButtonAppConfigurationClient:(id)a3 receiveInitialOrUpdatedEligibleAppsBundleIdentifiers:(id)a4
{
  id v5;
  NSSet *v6;
  NSSet *currentEligibleAppsBundleIdentifiers;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (NSSet *)objc_msgSend(v5, "copy");
  currentEligibleAppsBundleIdentifiers = self->_currentEligibleAppsBundleIdentifiers;
  self->_currentEligibleAppsBundleIdentifiers = v6;

  self->_isEligibleAppsKnown = 1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMapTable objectEnumerator](self->_eligibleAppsObserversToBlocks, "objectEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEligibleAppsBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentAssociatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_eligibleAppsObserversToBlocks, 0);
  objc_storeStrong((id *)&self->_associatedAppObserversToBlocks, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
