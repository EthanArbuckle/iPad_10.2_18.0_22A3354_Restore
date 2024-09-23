@implementation WBTabGroupManager

- (id)profileWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_profilesByIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_removedProfilesByIdentifier, "objectForKeyedSubscript:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)_tabGroupWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_localTabGroupsByUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_syncableTabGroupsByUUID, "objectForKeyedSubscript:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

uint64_t __35__WBTabGroupManager__namedProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "kind") == 1)
  {
    objc_msgSend(v2, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82E70]) ^ 1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_movePresenceForParticipantToTabWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  WBSPair *v9;
  WBSPair *activeTabGroupAndTabUUIDPair;
  NSDictionary *tabGroupUUIDsToCKShares;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WBParticipantPresenceCoordinator *presenceCoordinator;
  void *v18;
  id v19;

  v4 = a3;
  -[WBTabGroupManager tabWithUUID:](self, "tabWithUUID:", v4);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "tabGroupUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager tabGroupWithUUID:](self, "tabGroupWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x24BE82D08]);
  objc_msgSend(v19, "tabGroupUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (WBSPair *)objc_msgSend(v7, "initWithFirst:second:", v8, v4);

  activeTabGroupAndTabUUIDPair = self->_activeTabGroupAndTabUUIDPair;
  self->_activeTabGroupAndTabUUIDPair = v9;

  tabGroupUUIDsToCKShares = self->_tabGroupUUIDsToCKShares;
  objc_msgSend(v19, "tabGroupUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](tabGroupUUIDsToCKShares, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v6, "bookmark");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serverID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "bookmark");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serverID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  presenceCoordinator = self->_presenceCoordinator;
  -[WBTabGroupManager deviceIdentifier](self, "deviceIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBParticipantPresenceCoordinator moveCurrentParticipantToTabIdentifier:inTabGroupIdentifier:withDeviceIdentifier:](presenceCoordinator, "moveCurrentParticipantToTabIdentifier:inTabGroupIdentifier:withDeviceIdentifier:", v16, v13, v18);

}

- (NSString)deviceIdentifier
{
  return -[WBTabCollection currentDeviceIdentifier](self->_tabCollection, "currentDeviceIdentifier");
}

- (id)_tabWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_localTabsByUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_syncableTabsByUUID, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_removedTabsByUUID, "objectForKeyedSubscript:", v4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v10;

  }
  return v7;
}

- (NSSet)allProfileIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[WBTabGroupManager profiles](self, "profiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_70_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)allNamedProfileIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[WBTabGroupManager namedProfiles](self, "namedProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_71);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (WBProfile)defaultProfile
{
  void *v3;

  os_unfair_lock_lock(&profilesLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_profilesByIdentifier, "objectForKeyedSubscript:", *MEMORY[0x24BE82E70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&profilesLock);
  return (WBProfile *)v3;
}

- (void)_loadDatabase
{
  NSObject *v2;
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  WBTabCollection *tabCollection;
  void *v30;
  NSMutableDictionary *profilesByIdentifier;
  NSMutableDictionary *v32;
  NSMutableDictionary *devicesByUUID;
  NSMutableDictionary *v34;
  void *v35;
  NSMutableDictionary *v36;
  id v37;
  NSMutableDictionary *v38;
  id v39;
  id obj;
  NSMutableDictionary *v42;
  _QWORD block[5];
  id v44;
  _QWORD v45[5];
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void *v57;
  __int128 buf;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_211022000, v2, OS_LOG_TYPE_DEFAULT, "Loading all profiles, tab groups, and tabs records in the database", (uint8_t *)&buf, 2u);
  }
  os_unfair_lock_lock(&tabGroupsLock);
  os_unfair_lock_lock(&profilesLock);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v42 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[WBTabCollection mutableProfiles](self->_tabCollection, "mutableProfiles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v54 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v7, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v7, v8);

        v9 = WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v9;
          objc_msgSend(v7, "privacyPreservingDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v11;
          _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_DEFAULT, "Loaded profile from database: %{public}@", (uint8_t *)&buf, 0xCu);

        }
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v7, "devices");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v50 != v14)
                objc_enumerationMutation(v12);
              v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
              objc_msgSend(v16, "uuid");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, v17);

            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
          }
          while (v13);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
    }
    while (v4);
  }

  v18 = *MEMORY[0x24BE82E70];
  -[NSMutableDictionary objectForKeyedSubscript:](v42, "objectForKeyedSubscript:", *MEMORY[0x24BE82E70]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  v21 = MEMORY[0x24BDAC760];
  if (v20)
  {
    v22 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_211022000, v22, OS_LOG_TYPE_DEFAULT, "Default profile does not exist. Inserting one...", (uint8_t *)&buf, 2u);
    }
    -[WBTabCollection mutableNamedTabGroupsInDefaultProfile](self->_tabCollection, "mutableNamedTabGroupsInDefaultProfile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBMutableProfile createDefaultProfileWithTabGroups:](WBMutableProfile, "createDefaultProfileWithTabGroups:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__7;
    v61 = __Block_byref_object_dispose__7;
    v62 = 0;
    v48[0] = v21;
    v48[1] = 3221225472;
    v48[2] = __34__WBTabGroupManager__loadDatabase__block_invoke;
    v48[3] = &unk_24CB34808;
    v48[4] = &buf;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v42, "enumerateKeysAndObjectsUsingBlock:", v48);
    v25 = (void *)MEMORY[0x24BE830D8];
    v26 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    -[WBTabGroupManager deviceIdentifier](self, "deviceIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", 0, v26, v27, -[WBTabGroupManager _nextInMemoryPositionChangeID](self, "_nextInMemoryPositionChangeID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSyncPosition:", v28);

    tabCollection = self->_tabCollection;
    v57 = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabCollection insertItemsIntoPlace:inParentWithID:completionHandler:](tabCollection, "insertItemsIntoPlace:inParentWithID:completionHandler:", v30, 0, &__block_literal_global_23);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v24, v18);
    _Block_object_dispose(&buf, 8);

  }
  profilesByIdentifier = self->_profilesByIdentifier;
  self->_profilesByIdentifier = v42;
  v32 = v42;

  devicesByUUID = self->_devicesByUUID;
  self->_devicesByUUID = v3;
  v34 = v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = self->_profilesByIdentifier;
  v46[0] = v21;
  v46[1] = 3221225472;
  v46[2] = __34__WBTabGroupManager__loadDatabase__block_invoke_37;
  v46[3] = &unk_24CB34878;
  v46[4] = self;
  v37 = v35;
  v47 = v37;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v36, "enumerateKeysAndObjectsUsingBlock:", v46);
  v38 = self->_devicesByUUID;
  v45[0] = v21;
  v45[1] = 3221225472;
  v45[2] = __34__WBTabGroupManager__loadDatabase__block_invoke_3;
  v45[3] = &unk_24CB348A0;
  v45[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v38, "enumerateKeysAndObjectsUsingBlock:", v45);
  os_unfair_lock_unlock(&profilesLock);
  os_unfair_lock_unlock(&tabGroupsLock);
  block[0] = v21;
  block[1] = 3221225472;
  block[2] = __34__WBTabGroupManager__loadDatabase__block_invoke_4;
  block[3] = &unk_24CB31830;
  block[4] = self;
  v44 = v37;
  v39 = v37;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (NSArray)allNamedTabGroupsUnsorted
{
  void *v3;

  os_unfair_lock_lock(&tabGroupsLock);
  -[WBTabGroupManager _allTabGroupsUnsorted](self, "_allTabGroupsUnsorted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&tabGroupsLock);
  return (NSArray *)v3;
}

- (id)_allTabGroupsUnsorted
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[NSMutableDictionary allValues](self->_syncableTabGroupsByUUID, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:copyItems:", v4, 1);

  return v5;
}

- (NSArray)namedProfiles
{
  void *v3;

  os_unfair_lock_lock(&profilesLock);
  -[WBTabGroupManager _namedProfiles](self, "_namedProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&profilesLock);
  return (NSArray *)v3;
}

- (id)_namedProfiles
{
  void *v2;
  void *v3;

  -[WBTabGroupManager _profiles](self, "_profiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_73);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)profiles
{
  void *v3;

  os_unfair_lock_lock(&profilesLock);
  -[WBTabGroupManager _profiles](self, "_profiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&profilesLock);
  return (NSArray *)v3;
}

- (id)_profiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  os_unfair_lock_assert_owner(&profilesLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_profilesByIdentifier, "objectForKeyedSubscript:", *MEMORY[0x24BE82E70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](self->_profilesByIdentifier, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObject:", v3);
  -[WBTabGroupManager _itemSyncPositionComparator](self, "_itemSyncPositionComparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortUsingComparator:", v6);

  objc_msgSend(v5, "insertObject:atIndex:", v3, 0);
  v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

- (id)_itemSyncPositionComparator
{
  return &__block_literal_global_54_0;
}

- (WBTabGroupManager)initWithCollection:(id)a3
{
  id v5;
  WBTabGroupManager *v6;
  WBTabGroupManager *v7;
  WBTabGroupManager *v8;
  void *v9;
  uint64_t v10;
  WBSDevice *device;
  void *v12;
  WBParticipantPresenceCoordinator *v13;
  WBParticipantPresenceCoordinator *presenceCoordinator;
  uint64_t v15;
  NSCountedSet *activeTabGroupUUIDs;
  NSDictionary *tabGroupUUIDsToCKShares;
  uint64_t v18;
  NSMutableDictionary *broadcastingTabGroupUUIDsToCKShare;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v21;
  NSHashTable *observers;
  uint64_t v23;
  NSHashTable *cloudTabObservers;
  id v25;
  const char *v26;
  NSObject *v27;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *internalQueue;
  uint64_t v31;
  WBSCRDTPositionGenerator *positionGenerator;
  uint64_t v33;
  NSMutableSet *recentlyAddedTabGroupsAwaitingFirstStartPage;
  uint64_t v35;
  NSMutableDictionary *removedTabGroupsByUUID;
  uint64_t v37;
  NSMutableDictionary *removedTabsByUUID;
  uint64_t v39;
  NSMutableDictionary *localTabsByUUID;
  uint64_t v41;
  NSMutableDictionary *localTabGroupsByUUID;
  uint64_t v43;
  NSMutableDictionary *syncableTabsByUUID;
  uint64_t v45;
  NSMutableDictionary *syncableTabGroupsByUUID;
  uint64_t v47;
  NSMutableDictionary *profilesByIdentifier;
  uint64_t v49;
  NSMutableDictionary *removedProfilesByIdentifier;
  uint64_t v51;
  NSMutableDictionary *devicesByUUID;
  uint64_t v53;
  NSMutableDictionary *deviceUUIDByTabGroupUUID;
  uint64_t v55;
  WBSProfileDataManager *profileDataManager;
  uint64_t v57;
  NSMutableSet *insertedItemUUIDsThatWereMissingDuringReload;
  WBTabGroupManager *v59;
  void *v60;
  void *v61;
  _QWORD v63[4];
  WBTabGroupManager *v64;
  objc_super v65;

  v5 = a3;
  v65.receiver = self;
  v65.super_class = (Class)WBTabGroupManager;
  v6 = -[WBTabGroupManager init](&v65, sel_init);
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_tabCollection, a3);
    objc_msgSend(v5, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "device");
    v10 = objc_claimAutoreleasedReturnValue();
    device = v7->_device;
    v7->_device = (WBSDevice *)v10;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_enableSharedTabGroupsFastSyncPresence = objc_msgSend(v12, "BOOLForKey:", CFSTR("EnableSharedTabGroupsFastSyncPresence"));

    if (v7->_enableSharedTabGroupsFastSyncPresence)
    {
      v13 = (WBParticipantPresenceCoordinator *)objc_alloc_init(MEMORY[0x24BEC2738]);
      presenceCoordinator = v7->_presenceCoordinator;
      v7->_presenceCoordinator = v13;

      -[WBParticipantPresenceCoordinator setDelegate:](v7->_presenceCoordinator, "setDelegate:", v7);
      objc_msgSend(MEMORY[0x24BDD14E0], "set");
      v15 = objc_claimAutoreleasedReturnValue();
      activeTabGroupUUIDs = v7->_activeTabGroupUUIDs;
      v7->_activeTabGroupUUIDs = (NSCountedSet *)v15;

      tabGroupUUIDsToCKShares = v7->_tabGroupUUIDsToCKShares;
      v7->_tabGroupUUIDsToCKShares = (NSDictionary *)MEMORY[0x24BDBD1B8];

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v18 = objc_claimAutoreleasedReturnValue();
      broadcastingTabGroupUUIDsToCKShare = v7->_broadcastingTabGroupUUIDsToCKShare;
      v7->_broadcastingTabGroupUUIDsToCKShare = (NSMutableDictionary *)v18;

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_tabGroupManagerProfilesChanged, CFSTR("com.apple.mobilesafari.TabGroupManagerProfilesDidChange"), 0, (CFNotificationSuspensionBehavior)1024);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v21 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v21;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v23 = objc_claimAutoreleasedReturnValue();
    cloudTabObservers = v7->_cloudTabObservers;
    v7->_cloudTabObservers = (NSHashTable *)v23;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.WebBookmarks.WBTabGroupManager.%@.%p.%@"), objc_opt_class(), v7, CFSTR("InternalQueue"));
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = (const char *)objc_msgSend(v25, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_queue_create_with_target_V2(v26, v27, v28);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v29;

    v31 = objc_msgSend(objc_alloc(MEMORY[0x24BE830E0]), "initWithDelegate:", v7);
    positionGenerator = v7->_positionGenerator;
    v7->_positionGenerator = (WBSCRDTPositionGenerator *)v31;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v33 = objc_claimAutoreleasedReturnValue();
    recentlyAddedTabGroupsAwaitingFirstStartPage = v7->_recentlyAddedTabGroupsAwaitingFirstStartPage;
    v7->_recentlyAddedTabGroupsAwaitingFirstStartPage = (NSMutableSet *)v33;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v35 = objc_claimAutoreleasedReturnValue();
    removedTabGroupsByUUID = v7->_removedTabGroupsByUUID;
    v7->_removedTabGroupsByUUID = (NSMutableDictionary *)v35;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v37 = objc_claimAutoreleasedReturnValue();
    removedTabsByUUID = v7->_removedTabsByUUID;
    v7->_removedTabsByUUID = (NSMutableDictionary *)v37;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v39 = objc_claimAutoreleasedReturnValue();
    localTabsByUUID = v7->_localTabsByUUID;
    v7->_localTabsByUUID = (NSMutableDictionary *)v39;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v41 = objc_claimAutoreleasedReturnValue();
    localTabGroupsByUUID = v7->_localTabGroupsByUUID;
    v7->_localTabGroupsByUUID = (NSMutableDictionary *)v41;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v43 = objc_claimAutoreleasedReturnValue();
    syncableTabsByUUID = v7->_syncableTabsByUUID;
    v7->_syncableTabsByUUID = (NSMutableDictionary *)v43;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v45 = objc_claimAutoreleasedReturnValue();
    syncableTabGroupsByUUID = v7->_syncableTabGroupsByUUID;
    v7->_syncableTabGroupsByUUID = (NSMutableDictionary *)v45;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v47 = objc_claimAutoreleasedReturnValue();
    profilesByIdentifier = v7->_profilesByIdentifier;
    v7->_profilesByIdentifier = (NSMutableDictionary *)v47;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v49 = objc_claimAutoreleasedReturnValue();
    removedProfilesByIdentifier = v7->_removedProfilesByIdentifier;
    v7->_removedProfilesByIdentifier = (NSMutableDictionary *)v49;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v51 = objc_claimAutoreleasedReturnValue();
    devicesByUUID = v7->_devicesByUUID;
    v7->_devicesByUUID = (NSMutableDictionary *)v51;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v53 = objc_claimAutoreleasedReturnValue();
    deviceUUIDByTabGroupUUID = v7->_deviceUUIDByTabGroupUUID;
    v7->_deviceUUIDByTabGroupUUID = (NSMutableDictionary *)v53;

    v55 = objc_msgSend(objc_alloc(MEMORY[0x24BE83138]), "initWithProfileProvider:", v7);
    profileDataManager = v7->_profileDataManager;
    v7->_profileDataManager = (WBSProfileDataManager *)v55;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v57 = objc_claimAutoreleasedReturnValue();
    insertedItemUUIDsThatWereMissingDuringReload = v7->_insertedItemUUIDsThatWereMissingDuringReload;
    v7->_insertedItemUUIDsThatWereMissingDuringReload = (NSMutableSet *)v57;

    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __40__WBTabGroupManager_initWithCollection___block_invoke;
    v63[3] = &unk_24CB315A0;
    v59 = v7;
    v64 = v59;
    v60 = (void *)MEMORY[0x212BD4C84](v63);
    -[WBTabGroupManager _loadDatabase](v59, "_loadDatabase");
    -[WBSDevice addObserver:forKeyPath:options:context:](v7->_device, "addObserver:forKeyPath:options:context:", v59, CFSTR("userAssignedName"), 5, &deviceNameObserverContext);
    dispatch_async(MEMORY[0x24BDAC9B8], v60);
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObserver:selector:name:object:", v59, sel__tabGroupSyncDidFinish_, CFSTR("com.apple.SafariTabGroupSync.SyncDidFinish"), 0);

    v8 = v59;
  }

  return v8;
}

- (void)updateTabsInTabGroupWithUUID:(id)a3 persist:(BOOL)a4 usingBlock:(id)a5
{
  -[WBTabGroupManager updateTabsInTabGroupWithUUID:options:usingBlock:](self, "updateTabsInTabGroupWithUUID:options:usingBlock:", a3, a4, a5);
}

- (id)_tabGroupCacheForTabGroup:(id)a3
{
  int v4;
  uint64_t v5;

  v4 = objc_msgSend(a3, "isSyncable");
  v5 = 72;
  if (v4)
    v5 = 88;
  return *(id *)((char *)&self->super.isa + v5);
}

- (id)_tabCacheForTabGroup:(id)a3
{
  int v4;
  uint64_t v5;

  v4 = objc_msgSend(a3, "isSyncable");
  v5 = 64;
  if (v4)
    v5 = 80;
  return *(id *)((char *)&self->super.isa + v5);
}

- (void)_willFlushDeletedTabs:(id)a3 inTabGroup:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableDictionary *removedTabsByUUID;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  os_unfair_lock_assert_owner(&tabGroupsLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[WBTabGroupManager _uncacheTab:](self, "_uncacheTab:", v11, (_QWORD)v14);
        removedTabsByUUID = self->_removedTabsByUUID;
        objc_msgSend(v11, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](removedTabsByUUID, "setObject:forKeyedSubscript:", v11, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)_updatePositionsForTabsInTabGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  WBSCRDTPositionGenerator *positionGenerator;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  void *v26;
  _QWORD v27[3];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isSyncable"))
  {
    objc_msgSend(v4, "tabs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "safari_filterObjectsUsingBlock:", &__block_literal_global_49);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v7;
    v19 = (void *)v6;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSCRDTPositionGenerator generatePositionsForChildRecordNamesGroupedByParentFolders:](self->_positionGenerator, "generatePositionsForChildRecordNamesGroupedByParentFolders:", v9);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          positionGenerator = self->_positionGenerator;
          objc_msgSend(v15, "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSCRDTPositionGenerator positionForBookmarkWithRecordName:](positionGenerator, "positionForBookmarkWithRecordName:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setSyncPosition:", v18);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

  }
}

- (void)_uncacheTab:(id)a3
{
  NSMutableDictionary *localTabsByUUID;
  id v5;
  void *v6;
  NSMutableDictionary *syncableTabsByUUID;
  id v8;

  localTabsByUUID = self->_localTabsByUUID;
  v5 = a3;
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](localTabsByUUID, "setObject:forKeyedSubscript:", 0, v6);

  syncableTabsByUUID = self->_syncableTabsByUUID;
  objc_msgSend(v5, "uuid");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](syncableTabsByUUID, "setObject:forKeyedSubscript:", 0, v8);
}

- (void)movePresenceForParticipantToTabWithUUID:(id)a3
{
  if (self->_enableSharedTabGroupsFastSyncPresence)
    -[WBTabGroupManager _movePresenceForParticipantToTabWithUUID:](self, "_movePresenceForParticipantToTabWithUUID:", a3);
  else
    -[WBTabGroupSyncAgentProtocol movePresenceForParticipantToTabWithUUID:](self->_syncAgentProxy, "movePresenceForParticipantToTabWithUUID:", a3);
}

- (void)registerWindowState:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "localTabGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _cacheTabGroup:creatorDeviceUUID:](self, "_cacheTabGroup:creatorDeviceUUID:", v5, 0);

  objc_msgSend(v4, "privateTabGroup");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[WBTabGroupManager _cacheTabGroup:creatorDeviceUUID:](self, "_cacheTabGroup:creatorDeviceUUID:", v6, 0);
}

uint64_t __42__WBTabGroupManager_allProfileIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (WBTabCollection)tabCollection
{
  return self->_tabCollection;
}

- (void)saveWindowState:(id)a3 completionHandler:(id)a4
{
  -[WBTabCollection saveWindowState:completionHandler:](self->_tabCollection, "saveWindowState:completionHandler:", a3, a4);
}

- (void)removeTabGroupObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (BOOL)hasCompletedMigration
{
  return -[WBTabCollection hasCompletedMigration](self->_tabCollection, "hasCompletedMigration");
}

- (WBBrowserState)browserState
{
  return -[WBTabCollection browserState](self->_tabCollection, "browserState");
}

- (void)addCloudTabsObserver:(id)a3
{
  -[NSHashTable addObject:](self->_cloudTabObservers, "addObject:", a3);
}

- (void)getActiveParticipantsInTab:(id)a3 completionHandler:(id)a4
{
  WBParticipantPresenceCoordinator *presenceCoordinator;
  id v6;
  void *v7;
  WBTabCollection *tabCollection;
  id v9;

  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    presenceCoordinator = self->_presenceCoordinator;
    v6 = a4;
    objc_msgSend(a3, "bookmark");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serverID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBParticipantPresenceCoordinator getActiveParticipantsInTabWithIdentifier:completionHandler:](presenceCoordinator, "getActiveParticipantsInTabWithIdentifier:completionHandler:", v7, v6);

  }
  else
  {
    tabCollection = self->_tabCollection;
    v9 = a4;
    -[WBTabCollection getActiveParticipantsInTab:completionHandler:](tabCollection, "getActiveParticipantsInTab:completionHandler:", a3);
  }

}

uint64_t __34__WBTabGroupManager__loadDatabase__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTabGroupShares:", *(_QWORD *)(a1 + 40));
}

void __55__WBTabGroupManager__updateDeviceNameIfNeededWithName___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)setSyncAgentProxy:(id)a3
{
  WBTabGroupSyncAgentProtocol *v5;
  WBTabGroupSyncAgentProtocol *syncAgentProxy;
  WBTabGroupSyncAgentProtocol *v7;

  v5 = (WBTabGroupSyncAgentProtocol *)a3;
  syncAgentProxy = self->_syncAgentProxy;
  if (syncAgentProxy != v5)
  {
    v7 = v5;
    -[WBTabGroupSyncAgentProtocol removeSyncObserver:](syncAgentProxy, "removeSyncObserver:", self);
    objc_storeStrong((id *)&self->_syncAgentProxy, a3);
    -[WBTabGroupSyncAgentProtocol addSyncObserver:](self->_syncAgentProxy, "addSyncObserver:", self);
    v5 = v7;
  }

}

- (void)enableDevicePresenceReporting
{
  ++self->_numberOfDevicePresenceReportingRequests;
  -[WBTabGroupManager _beginDevicePresenceReportingIfNeeded](self, "_beginDevicePresenceReportingIfNeeded");
}

- (id)updateProfileWithIdentifier:(id)a3 persist:(BOOL)a4 usingBlock:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  id v12;
  void *v13;
  void *v14;
  WBTabGroupManager *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  WBTabCollection *tabCollection;
  id v25;
  void *v26;
  NSObject *v27;
  BOOL v29;
  void *v30;
  void (**v31)(id, void *);
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  WBTabGroupManager *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (void (**)(id, void *))a5;
  v12 = a6;
  os_unfair_lock_lock(&profilesLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_profilesByIdentifier, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v29 = a4;
    v30 = v12;
    v32 = v10;
    v33 = (void *)objc_msgSend(v13, "copy");
    v31 = v11;
    v11[2](v11, v14);
    os_unfair_lock_unlock(&profilesLock);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v15 = self;
    v16 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v14, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "differenceFromProfile:", v33);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "tabGroupManager:didUpdateProfileWithIdentifier:difference:", v15, v22, v23);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v18);
    }

    if (v29)
    {
      tabCollection = v15->_tabCollection;
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __86__WBTabGroupManager_updateProfileWithIdentifier_persist_usingBlock_completionHandler___block_invoke;
      v34[3] = &unk_24CB34BC8;
      v12 = v30;
      v37 = v30;
      v25 = v14;
      v35 = v25;
      v36 = v15;
      -[WBTabCollection saveItem:completionHandler:](tabCollection, "saveItem:completionHandler:", v25, v34);
      v26 = (void *)objc_msgSend(v25, "copy");

    }
    else
    {
      v26 = (void *)objc_msgSend(v14, "copy");
      v12 = v30;
    }

    v11 = v31;
    v10 = v32;
  }
  else
  {
    v27 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v10;
      _os_log_impl(&dword_211022000, v27, OS_LOG_TYPE_INFO, "Not updating profile with uuid %{public}@ because it does not exist.", buf, 0xCu);
    }
    os_unfair_lock_unlock(&profilesLock);
    v26 = 0;
  }

  return v26;
}

- (void)addTabGroupObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)_beginDevicePresenceReportingIfNeeded
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[WBTabGroupManager _shouldBeginDevicePresenceReporting](self, "_shouldBeginDevicePresenceReporting"))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_211022000, v3, OS_LOG_TYPE_DEFAULT, "Will begin device presence reporting", v4, 2u);
    }
    self->_isBroadcastingPresenceUpdates = 1;
    -[WBParticipantPresenceCoordinator beginDeviceCoordination](self->_presenceCoordinator, "beginDeviceCoordination");
  }
}

- (void)_updateTabGroupShares:(id)a3
{
  NSDictionary *v4;
  NSDictionary *tabGroupUUIDsToCKShares;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  WBParticipantPresenceCoordinator *presenceCoordinator;
  void *v17;
  NSDictionary *v18;
  id obj;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    v4 = (NSDictionary *)objc_msgSend(a3, "copy");
    tabGroupUUIDsToCKShares = self->_tabGroupUUIDsToCKShares;
    self->_tabGroupUUIDsToCKShares = v4;

    if (-[WBTabGroupManager hasSharedTabGroups](self, "hasSharedTabGroups"))
    {
      -[WBTabGroupManager _beginDevicePresenceReportingIfNeeded](self, "_beginDevicePresenceReportingIfNeeded");
      -[WBTabCollection setHasSharedTabGroupsWithCompletionHandler:](self->_tabCollection, "setHasSharedTabGroupsWithCompletionHandler:", 0);
    }
    else
    {
      -[WBTabGroupManager _endDevicePresenceReportingIfNeeded](self, "_endDevicePresenceReportingIfNeeded");
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[NSMutableDictionary allKeys](self->_broadcastingTabGroupUUIDsToCKShare, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_tabGroupUUIDsToCKShares, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_broadcastingTabGroupUUIDsToCKShare, "objectForKeyedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "recordChangeTag");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "recordChangeTag");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqualToString:", v14);

            if ((v15 & 1) == 0)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_broadcastingTabGroupUUIDsToCKShare, "setObject:forKeyedSubscript:", v11, v10);
              -[WBParticipantPresenceCoordinator shareDidUpdate:](self->_presenceCoordinator, "shareDidUpdate:", v11);
            }

          }
          else
          {
            presenceCoordinator = self->_presenceCoordinator;
            -[NSMutableDictionary objectForKeyedSubscript:](self->_broadcastingTabGroupUUIDsToCKShare, "objectForKeyedSubscript:", v10);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBParticipantPresenceCoordinator endCollaborationForShare:](presenceCoordinator, "endCollaborationForShare:", v17);

            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_broadcastingTabGroupUUIDsToCKShare, "setObject:forKeyedSubscript:", 0, v10);
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }

    v18 = self->_tabGroupUUIDsToCKShares;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __43__WBTabGroupManager__updateTabGroupShares___block_invoke;
    v20[3] = &unk_24CB34F90;
    v20[4] = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v18, "enumerateKeysAndObjectsUsingBlock:", v20);
  }
}

- (BOOL)_shouldBeginDevicePresenceReporting
{
  _BOOL4 v3;

  if (!self->_enableSharedTabGroupsFastSyncPresence)
    goto LABEL_5;
  v3 = -[WBTabGroupManager hasSharedTabGroups](self, "hasSharedTabGroups");
  if (v3)
  {
    if (self->_numberOfDevicePresenceReportingRequests)
    {
      LOBYTE(v3) = !self->_isBroadcastingPresenceUpdates;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)hasSharedTabGroups
{
  return -[NSDictionary count](self->_tabGroupUUIDsToCKShares, "count") != 0;
}

- (void)_endDevicePresenceReportingIfNeeded
{
  if (-[WBTabGroupManager _shouldEndDevicePresenceReporting](self, "_shouldEndDevicePresenceReporting"))
  {
    -[WBParticipantPresenceCoordinator endDeviceCoordination](self->_presenceCoordinator, "endDeviceCoordination");
    self->_isBroadcastingPresenceUpdates = 0;
  }
}

- (BOOL)_shouldEndDevicePresenceReporting
{
  if (!self->_isBroadcastingPresenceUpdates)
    return 0;
  if (self->_enableSharedTabGroupsFastSyncPresence && self->_numberOfDevicePresenceReportingRequests)
    return !-[WBTabGroupManager hasSharedTabGroups](self, "hasSharedTabGroups");
  return 1;
}

- (id)namedTabGroupsForProfileWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  os_unfair_lock_lock(&tabGroupsLock);
  -[WBTabGroupManager _tabGroupsForProfileWithIdentifier:](self, "_tabGroupsForProfileWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&tabGroupsLock);
  return v5;
}

- (id)_tabGroupsForProfileWithIdentifier:(id)a3
{
  id v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  char v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x24BE82E70]);
  -[NSMutableDictionary allValues](self->_syncableTabGroupsByUUID, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __56__WBTabGroupManager__tabGroupsForProfileWithIdentifier___block_invoke;
  v15 = &unk_24CB34B50;
  v16 = v4;
  v17 = v5;
  v7 = v4;
  objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBTabGroupManager _itemSyncPositionComparator](self, "_itemSyncPositionComparator", v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __55__WBTabGroupManager__updateDeviceNameIfNeededWithName___block_invoke_2(uint64_t a1, int a2)
{
  _QWORD block[5];

  if (a2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__WBTabGroupManager__updateDeviceNameIfNeededWithName___block_invoke_3;
    block[3] = &unk_24CB315A0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __40__WBTabGroupManager_initWithCollection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 160) = 1;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManagerDidFinishSetup:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  objc_super v8;

  if (a6 == &deviceNameObserverContext)
  {
    objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70], a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&profilesLock);
    -[WBTabGroupManager _updateDeviceNameIfNeededWithName:](self, "_updateDeviceNameIfNeededWithName:", v7);
    os_unfair_lock_unlock(&profilesLock);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WBTabGroupManager;
    -[WBTabGroupManager observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_updateDeviceNameIfNeededWithName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  WBTabCollection *tabCollection;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[NSString isEqualToString:](self->_lastLocalDeviceNameSaved, "isEqualToString:", v5))
  {
    -[NSMutableDictionary allValues](self->_devicesByUUID, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_96);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "setTitle:", v5);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_lastLocalDeviceNameSaved, a3);
    tabCollection = self->_tabCollection;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __55__WBTabGroupManager__updateDeviceNameIfNeededWithName___block_invoke_2;
    v14[3] = &unk_24CB315E8;
    v14[4] = self;
    -[WBTabCollection saveItems:completionHandler:](tabCollection, "saveItems:completionHandler:", v8, v14);

  }
}

+ (id)ephemeralTabGroupManager
{
  WBTabCollection *v2;
  void *v3;
  WBTabCollection *v4;
  WBTabGroupManager *v5;

  v2 = [WBTabCollection alloc];
  +[WBCollectionConfiguration inMemoryTabCollectionConfiguration](WBCollectionConfiguration, "inMemoryTabCollectionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WBTabCollection initWithConfiguration:openDatabase:](v2, "initWithConfiguration:openDatabase:", v3, 1);

  v5 = -[WBTabGroupManager initWithCollection:]([WBTabGroupManager alloc], "initWithCollection:", v4);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[WBSDevice removeObserver:forKeyPath:context:](self->_device, "removeObserver:forKeyPath:context:", self, CFSTR("userAssignedName"), &deviceNameObserverContext);
  v3.receiver = self;
  v3.super_class = (Class)WBTabGroupManager;
  -[WBTabGroupManager dealloc](&v3, sel_dealloc);
}

- (NSSet)recentlyAddedTabGroupsAwaitingFirstStartPage
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_recentlyAddedTabGroupsAwaitingFirstStartPage, "copy");
}

- (void)waitForSetupWithCompletionHandler:(id)a3
{
  void (**v4)(void);
  void *v5;
  id setupCompletionHandler;
  void (**v7)(void);

  v4 = (void (**)(void))a3;
  if (!self->_didFinishSetup)
  {
    v7 = v4;
    v5 = (void *)MEMORY[0x212BD4C84]();
    setupCompletionHandler = self->_setupCompletionHandler;
    self->_setupCompletionHandler = v5;

    goto LABEL_5;
  }
  if (v4)
  {
    v7 = v4;
    v4[2]();
LABEL_5:
    v4 = v7;
  }

}

- (void)disableSuddenTerminationForPendingChanges
{
  -[WBTabCollection disableSuddenTerminationForPendingChanges](self->_tabCollection, "disableSuddenTerminationForPendingChanges");
}

- (void)waitForPendingChanges
{
  -[WBTabCollection waitForPendingChanges](self->_tabCollection, "waitForPendingChanges");
}

void __34__WBTabGroupManager__loadDatabase__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_msgSend(a3, "syncPosition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = v4;
  if (!*(_QWORD *)(v5 + 40))
    goto LABEL_4;
  v6 = objc_msgSend(v4, "compare:");
  v7 = obj;
  if (v6 == -1)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v5 + 40), obj);
    v7 = obj;
  }

}

void __34__WBTabGroupManager__loadDatabase__block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((a2 & 1) == 0)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __34__WBTabGroupManager__loadDatabase__block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __34__WBTabGroupManager__loadDatabase__block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a3, "tabGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_cacheTabGroup:creatorDeviceUUID:", v12, 0);
        objc_msgSend(v12, "bookmark");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v10;
        v14[1] = 3221225472;
        v14[2] = __34__WBTabGroupManager__loadDatabase__block_invoke_2_38;
        v14[3] = &unk_24CB34850;
        v15 = *(id *)(a1 + 40);
        v16 = v5;
        objc_msgSend(v13, "getReadOnlyCachedBookmarkSyncDataUsingBlock:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

void __34__WBTabGroupManager__loadDatabase__block_invoke_2_38(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "shareRecord");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

}

void __34__WBTabGroupManager__loadDatabase__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "unnamedMutableTabGroups", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "_cacheTabGroup:creatorDeviceUUID:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_reloadProfilesAndTabGroupsAndNotify:(BOOL)a3 withCompletionHandler:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  WBTabGroupManager *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  WBTabGroupManager *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  _BOOL4 v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  id obj;
  id obja;
  _QWORD block[5];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  BOOL v69;
  _QWORD v70[4];
  id v71;
  WBTabGroupManager *v72;
  id v73;
  _QWORD v74[4];
  id v75;
  WBTabGroupManager *v76;
  id v77;
  _QWORD v78[4];
  id v79;
  WBTabGroupManager *v80;
  id v81;
  id v82;
  _QWORD v83[5];
  id v84;
  id v85;
  _QWORD v86[5];
  id v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v54 = a3;
  v99 = *MEMORY[0x24BDAC8D0];
  v52 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  -[WBTabCollection mutableProfiles](self->_tabCollection, "mutableProfiles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v94;
    v55 = *(_QWORD *)v94;
    do
    {
      v10 = 0;
      v57 = v8;
      do
      {
        if (*(_QWORD *)v94 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v10);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

        if ((objc_msgSend(v11, "isDefault") & 1) == 0)
        {
          v13 = v5;
          v14 = self;
          v91 = 0u;
          v92 = 0u;
          v89 = 0u;
          v90 = 0u;
          objc_msgSend(v11, "devices");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v90;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v90 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
                objc_msgSend(v20, "uuid");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, v21);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
            }
            while (v17);
          }

          self = v14;
          v5 = v13;
          v9 = v55;
          v8 = v57;
        }
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
    }
    while (v8);
  }

  os_unfair_lock_lock(&tabGroupsLock);
  os_unfair_lock_lock(&profilesLock);
  -[WBTabGroupManager _profiles](self, "_profiles");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->_removedProfilesByIdentifier, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsForKeys:", v22);

  -[WBTabGroupManager _performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier:devicesByUUID:uninsertedSyncableTabsFromSyncableTabsByUUID:](self, "_performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier:devicesByUUID:uninsertedSyncableTabsFromSyncableTabsByUUID:", v5, v6, self->_syncableTabsByUUID);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = MEMORY[0x24BDAC760];
  v25 = MEMORY[0x24BDAC760];
  v86[1] = 3221225472;
  v86[2] = __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke;
  v86[3] = &unk_24CB348C8;
  v86[4] = self;
  v26 = v23;
  v87 = v26;
  v27 = v24;
  v88 = v27;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v86);
  v83[0] = v25;
  v28 = v25;
  v83[1] = 3221225472;
  v83[2] = __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_2;
  v83[3] = &unk_24CB348F0;
  v83[4] = self;
  obja = v26;
  v84 = obja;
  v29 = v27;
  v85 = v29;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v83);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)-[NSMutableDictionary copy](self->_syncableTabGroupsByUUID, "copy");
  v78[0] = v28;
  v78[1] = 3221225472;
  v78[2] = __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_3;
  v78[3] = &unk_24CB34918;
  v49 = v29;
  v79 = v49;
  v80 = self;
  v32 = v50;
  v81 = v32;
  v33 = v30;
  v82 = v33;
  objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v78);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = self;
  v36 = (void *)-[NSMutableDictionary copy](self->_profilesByIdentifier, "copy");
  v37 = MEMORY[0x24BDAC760];
  v74[0] = MEMORY[0x24BDAC760];
  v74[1] = 3221225472;
  v74[2] = __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_4;
  v74[3] = &unk_24CB348C8;
  v38 = v5;
  v75 = v38;
  v76 = v35;
  v39 = v34;
  v77 = v39;
  objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v74);

  v40 = (void *)-[NSMutableDictionary copy](v35->_devicesByUUID, "copy");
  v70[0] = v37;
  v70[1] = 3221225472;
  v70[2] = __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_5;
  v70[3] = &unk_24CB348F0;
  v58 = v6;
  v71 = v58;
  v72 = v35;
  v41 = v32;
  v73 = v41;
  objc_msgSend(v40, "enumerateKeysAndObjectsUsingBlock:", v70);

  -[WBTabGroupManager _unsafeTabGroupUUIDsToCKShares](v35, "_unsafeTabGroupUUIDsToCKShares");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v35->_insertedItemUUIDsThatWereMissingDuringReload, v50);
  v43 = objc_msgSend(v41, "count");
  os_unfair_lock_unlock(&profilesLock);
  os_unfair_lock_unlock(&tabGroupsLock);
  block[0] = v37;
  block[1] = 3221225472;
  block[2] = __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_6;
  block[3] = &unk_24CB34940;
  block[4] = v35;
  v62 = v42;
  v69 = v54;
  v63 = v39;
  v64 = v38;
  v65 = v56;
  v66 = v33;
  v67 = v49;
  v68 = v52;
  v53 = v52;
  v51 = v49;
  v44 = v33;
  v45 = v56;
  v46 = v38;
  v47 = v39;
  v48 = v42;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  if (v43)
    -[WBTabGroupManager _reloadProfilesAndTabGroupsAndNotify:withCompletionHandler:](v35, "_reloadProfilesAndTabGroupsAndNotify:withCompletionHandler:", v54, 0);

}

void __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v18 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v5, "tabGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
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
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v13 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        objc_msgSend(v12, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(*(id *)(a1 + 32), "_updateTabsAndCacheTabGroup:withTabsByParentIdentifiers:creatorDeviceUUID:", v12, *(_QWORD *)(a1 + 40), 0);
          objc_msgSend(v6, "addObject:", v12);
          v16 = *(void **)(a1 + 48);
          v17 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(v16, "addObject:", v17);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "setTabGroups:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", v5, v18);

}

void __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v21 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v5;
  objc_msgSend(v5, "unnamedMutableTabGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v13 = *(void **)(a1[4] + 48);
        objc_msgSend(v12, "uuid", v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v16 = (void *)a1[4];
          v17 = a1[5];
          objc_msgSend(v6, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_updateTabsAndCacheTabGroup:withTabsByParentIdentifiers:creatorDeviceUUID:", v12, v17, v18);

          objc_msgSend(v22, "addObject:", v12);
          v19 = (void *)a1[6];
          v20 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(v19, "addObject:", v20);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "setUnnamedMutableTabGroups:", v22);
  objc_msgSend(*(id *)(a1[4] + 120), "setObject:forKeyedSubscript:", v6, v21);

}

void __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isNamed"))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5);
    objc_msgSend(v5, "bookmark");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "wasLoadedFromDatabase");
    v9 = v6 ^ 1;

    if (v8 && (v9 & 1) != 0)
      goto LABEL_6;
    if ((objc_msgSend(v5, "isInserted") & v9) == 1)
    {
      v10 = *(void **)(*(_QWORD *)(a1 + 40) + 144);
      objc_msgSend(v5, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = objc_msgSend(v10, "containsObject:", v11);

      if ((v10 & 1) == 0)
      {
        v12 = *(void **)(a1 + 48);
        objc_msgSend(v5, "uuid");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
LABEL_6:
      objc_msgSend(*(id *)(a1 + 40), "_uncacheTabGroup:", v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setObject:forKeyedSubscript:", v5, v15);
      v12 = *(void **)(a1 + 56);
      v13 = objc_msgSend(v5, "copy");
LABEL_7:
      v14 = (void *)v13;
      objc_msgSend(v12, "addObject:", v13);

    }
  }

}

void __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bookmark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "wasLoadedFromDatabase");

  if (v8 && !v6 && !WBSIsEqual())
    goto LABEL_7;
  if (objc_msgSend(v5, "isInserted") && !v6)
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 144);
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v9, "containsObject:", v10);

    if ((v9 & 1) == 0)
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 40) + 144);
      objc_msgSend(v5, "identifier");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_7:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setObject:forKeyedSubscript:", 0, v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "setObject:forKeyedSubscript:", v5, v14);
    v11 = *(void **)(a1 + 48);
    v12 = objc_msgSend(v5, "copy");
LABEL_9:
    v13 = (void *)v12;
    objc_msgSend(v11, "addObject:", v12);

  }
}

void __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "wasLoadedFromDatabase");

  if (v7 && !v5)
    goto LABEL_6;
  objc_msgSend(v15, "bookmark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInserted");

  if (v9 && !v5)
  {
    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 144);
    objc_msgSend(v15, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v10, "containsObject:", v11);

    if ((v10 & 1) == 0)
    {
      v14 = *(void **)(a1 + 48);
      objc_msgSend(v15, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v13);
      goto LABEL_7;
    }
LABEL_6:
    v12 = *(void **)(*(_QWORD *)(a1 + 40) + 120);
    objc_msgSend(v15, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v13);
LABEL_7:

  }
}

uint64_t __80__WBTabGroupManager__reloadProfilesAndTabGroupsAndNotify_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateTabGroupShares:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 96))
  {
    v2 = *(void **)(a1 + 32);
    v3 = (void *)MEMORY[0x24BDBCF20];
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_didRemoveProfiles:updateProfiles:previousProfiles:removeTabGroups:updateTabGroups:previousTabGroups:", v4, v6, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), 0);

  }
  result = *(_QWORD *)(a1 + 88);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_mergeTabGroups:(id)a3
{
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = a3;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v5, "uuid");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBTabGroupManager _tabGroupWithUUID:](self, "_tabGroupWithUUID:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          objc_msgSend(v5, "mergeWithTabGroup:", v7);
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v5, "tabs");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v20 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              objc_msgSend(v13, "uuid");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[WBTabGroupManager _tabWithUUID:](self, "_tabWithUUID:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
                objc_msgSend(v13, "mergeWithTab:", v15);

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v10);
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v18);
  }

}

- (id)_performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier:(id)a3 devicesByUUID:(id)a4 uninsertedSyncableTabsFromSyncableTabsByUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  WBTabGroupManager *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  os_unfair_lock_assert_owner(&profilesLock);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __151__WBTabGroupManager__performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier_devicesByUUID_uninsertedSyncableTabsFromSyncableTabsByUUID___block_invoke;
  v30[3] = &unk_24CB34878;
  v30[4] = self;
  v13 = v11;
  v31 = v13;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v30);

  v28[0] = v12;
  v28[1] = 3221225472;
  v28[2] = __151__WBTabGroupManager__performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier_devicesByUUID_uninsertedSyncableTabsFromSyncableTabsByUUID___block_invoke_2;
  v28[3] = &unk_24CB34968;
  v28[4] = self;
  v14 = v13;
  v29 = v14;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v28);

  v15 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v14, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safari_flattenedArray");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safari_mapObjectsUsingBlock:", &__block_literal_global_45_0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __151__WBTabGroupManager__performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier_devicesByUUID_uninsertedSyncableTabsFromSyncableTabsByUUID___block_invoke_4;
  v24[3] = &unk_24CB349B0;
  v25 = v19;
  v26 = self;
  v27 = v14;
  v20 = v14;
  v21 = v19;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v24);

  v22 = (void *)objc_msgSend(v20, "copy");
  return v22;
}

void __151__WBTabGroupManager__performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier_devicesByUUID_uninsertedSyncableTabsFromSyncableTabsByUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = objc_claimAutoreleasedReturnValue();
  v12 = (id)v7;
  if (v7)
  {
    objc_msgSend(v6, "mergeWithProfile:", v7);
  }
  else
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    objc_msgSend(v6, "serverID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ensureProfileDirectoriesExistForProfileWithServerID:profileIdentifier:", v9, v10);

  }
  objc_msgSend(v6, "tabGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_mergeTabGroups:", v11);
  objc_msgSend(*(id *)(a1 + 32), "_addTabsInTabGroups:toParentIdentifierInTabsToParentIdentifiersDictionary:", v11, *(_QWORD *)(a1 + 40));

}

void __151__WBTabGroupManager__performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier_devicesByUUID_uninsertedSyncableTabsFromSyncableTabsByUUID___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  char v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v12, "mergeWithDevice:", v5);
  objc_msgSend(v12, "unnamedMutableTabGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_mergeTabGroups:", v6);
  v7 = objc_msgSend(v12, "isRemoteDevice");
  v8 = *(_QWORD **)(a1 + 32);
  if ((v7 & 1) == 0 && !v8[17])
  {
    objc_msgSend(v12, "title");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 136);
    *(_QWORD *)(v10 + 136) = v9;

    v8 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v8, "_addTabsInTabGroups:toParentIdentifierInTabsToParentIdentifiersDictionary:", v6, *(_QWORD *)(a1 + 40));

}

uint64_t __151__WBTabGroupManager__performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier_devicesByUUID_uninsertedSyncableTabsFromSyncableTabsByUUID___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

void __151__WBTabGroupManager__performCRDTMergeAndMapTabsToParentIdentifiersWithProfilesByIdentifier_devicesByUUID_uninsertedSyncableTabsFromSyncableTabsByUUID___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v13 = v4;
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v13, "bookmark");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "wasLoadedFromDatabase");

    if ((v8 & 1) == 0)
    {
      if (!objc_msgSend(v13, "isInserted")
        || (v9 = *(void **)(*(_QWORD *)(a1 + 40) + 144),
            objc_msgSend(v13, "uuid"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            LOBYTE(v9) = objc_msgSend(v9, "containsObject:", v10),
            v10,
            (v9 & 1) == 0))
      {
        v11 = *(void **)(*(_QWORD *)(a1 + 40) + 144);
        objc_msgSend(v13, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v12);

        objc_msgSend(*(id *)(a1 + 40), "_addTab:toParentIdentifierInTabsToParentIdentifiersDictionary:", v13, *(_QWORD *)(a1 + 48));
      }
    }
  }

}

- (void)_addTabsInTabGroups:(id)a3 toParentIdentifierInTabsToParentIdentifiersDictionary:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableDictionary *removedTabGroupsByUUID;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        removedTabGroupsByUUID = self->_removedTabGroupsByUUID;
        objc_msgSend(v13, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](removedTabGroupsByUUID, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v22 = WBS_LOG_CHANNEL_PREFIXTabGroup();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v23 = v22;
            objc_msgSend(v13, "privacyPreservingDescription");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v35 = v24;
            _os_log_impl(&dword_211022000, v23, OS_LOG_TYPE_INFO, "Filtering tab group %{public}@ because it was removed", buf, 0xCu);

          }
          goto LABEL_19;
        }
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v13, "tabs", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v26 != v20)
                objc_enumerationMutation(v17);
              -[WBTabGroupManager _addTab:toParentIdentifierInTabsToParentIdentifiersDictionary:](self, "_addTab:toParentIdentifierInTabsToParentIdentifiersDictionary:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), v7);
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v19);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_19:

}

- (void)_addTab:(id)a3 toParentIdentifierInTabsToParentIdentifiersDictionary:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *removedTabsByUUID;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  removedTabsByUUID = self->_removedTabsByUUID;
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](removedTabsByUUID, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = v11;
      objc_msgSend(v6, "privacyPreservingDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v13;
      _os_log_impl(&dword_211022000, v12, OS_LOG_TYPE_INFO, "Filtering tab %{public}@ because it was removed", (uint8_t *)&v17, 0xCu);

    }
  }
  else
  {
    if (objc_msgSend(v6, "parentIdentifier") == 0x7FFFFFFF
      || !objc_msgSend(v6, "parentIdentifier"))
    {
      objc_msgSend(v6, "tabGroupUUID");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v6, "parentIdentifier"));
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;
    objc_msgSend(v7, "objectForKeyedSubscript:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v15);
    }
    objc_msgSend(v16, "addObject:", v6);

  }
}

- (void)_updateTabsAndCacheTabGroup:(id)a3 withTabsByParentIdentifiers:(id)a4 creatorDeviceUUID:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v8 = (void *)MEMORY[0x24BDBCEB8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v11, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = (void *)MEMORY[0x24BDBD1A8];
  if (v13)
    v16 = v13;
  else
    v16 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v21, "addObjectsFromArray:", v16);

  objc_msgSend(v11, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v19 = v18;
  else
    v19 = v15;
  objc_msgSend(v21, "addObjectsFromArray:", v19);

  -[WBTabGroupManager _itemSyncPositionComparator](self, "_itemSyncPositionComparator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sortUsingComparator:", v20);

  objc_msgSend(v11, "setTabs:", v21);
  -[WBTabGroupManager _cacheTabGroup:creatorDeviceUUID:](self, "_cacheTabGroup:creatorDeviceUUID:", v11, v9);

}

- (void)_cacheTabGroup:(id)a3 creatorDeviceUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *deviceUUIDByTabGroupUUID;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v21 = a4;
  -[WBTabGroupManager _tabCacheForTabGroup:](self, "_tabCacheForTabGroup:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _tabGroupCacheForTabGroup:](self, "_tabGroupCacheForTabGroup:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v8;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v6, "allTabs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localTabsByUUID, "setObject:forKeyedSubscript:", 0, v16);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_syncableTabsByUUID, "setObject:forKeyedSubscript:", 0, v16);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_removedTabsByUUID, "setObject:forKeyedSubscript:", 0, v16);
        objc_msgSend(v15, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  if (v21)
  {
    deviceUUIDByTabGroupUUID = self->_deviceUUIDByTabGroupUUID;
    objc_msgSend(v6, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](deviceUUIDByTabGroupUUID, "setObject:forKeyedSubscript:", v21, v19);

  }
}

- (void)_uncacheTabGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WBTabGroupManager _tabCacheForTabGroup:](self, "_tabCacheForTabGroup:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _tabGroupCacheForTabGroup:](self, "_tabGroupCacheForTabGroup:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v7);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "allTabs", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (id)removedTabGroupWithUUID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_removedTabGroupsByUUID, "objectForKeyedSubscript:", a3);
}

- (int64_t)_nextInMemoryPositionChangeID
{
  int64_t v2;

  os_unfair_lock_lock(&inMemoryChangeIDLock);
  v2 = nextInMemoryPositionChangeID--;
  os_unfair_lock_unlock(&inMemoryChangeIDLock);
  return v2;
}

- (id)_generatePositionForTabGroup:(id)a3 afterTabGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  if ((objc_msgSend(v7, "isNamed") & 1) != 0)
  {
    objc_msgSend(v7, "profileIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager _tabGroupsForProfileWithIdentifier:](self, "_tabGroupsForProfileWithIdentifier:", v8);
  }
  else
  {
    objc_msgSend(v7, "deviceUUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager _unnamedTabGroupsForDeviceWithUUID:](self, "_unnamedTabGroupsForDeviceWithUUID:", v8);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBTabGroupManager _generatePositionForTabGroup:afterTabGroup:inTabGroups:](self, "_generatePositionForTabGroup:afterTabGroup:inTabGroups:", v7, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_generatePositionForTabGroup:(id)a3 afterTabGroup:(id)a4 inTabGroups:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  -[WBTabGroupManager _tabGroupAfterTabGroup:inTabGroups:](self, "_tabGroupAfterTabGroup:inTabGroups:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((WBSIsEqual() & 1) != 0 || WBSIsEqual())
  {
    objc_msgSend(v8, "syncPosition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x24BE830D8];
    objc_msgSend(v9, "syncPosition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "syncPosition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager deviceIdentifier](self, "deviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", v13, v14, v15, -[WBTabGroupManager _nextInMemoryPositionChangeID](self, "_nextInMemoryPositionChangeID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_tabGroupAfterTabGroup:(id)a3 inTabGroups:(id)a4
{
  if (a3)
    objc_msgSend(a4, "safari_objectAfter:");
  else
    objc_msgSend(a4, "firstObject");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __55__WBTabGroupManager__updatePositionsForTabsInTabGroup___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "wasAdded") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "wasMoved");

  return v3;
}

- (id)_generatePositionForProfile:(id)a3 afterProfile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[WBTabGroupManager _namedProfiles](self, "_namedProfiles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "safari_objectAfter:", v7);
  else
    objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((WBSIsEqual() & 1) != 0 || WBSIsEqual())
  {
    objc_msgSend(v6, "syncPosition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x24BE830D8];
    objc_msgSend(v7, "syncPosition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "syncPosition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager deviceIdentifier](self, "deviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", v13, v14, v15, -[WBTabGroupManager _nextInMemoryPositionChangeID](self, "_nextInMemoryPositionChangeID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_generatePositionForDevice:(id)a3 afterDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "profileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _devicesForProfileWithIdentifier:](self, "_devicesForProfileWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v9, "safari_objectAfter:", v7);
  else
    objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((WBSIsEqual() & 1) != 0 || WBSIsEqual())
  {
    objc_msgSend(v6, "syncPosition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x24BE830D8];
    objc_msgSend(v7, "syncPosition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "syncPosition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager deviceIdentifier](self, "deviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "positionBetweenPosition:andPosition:withDeviceIdentifier:changeID:", v13, v14, v15, -[WBTabGroupManager _nextInMemoryPositionChangeID](self, "_nextInMemoryPositionChangeID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

uint64_t __48__WBTabGroupManager__itemSyncPositionComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bookmark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncPosition");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncPosition");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8 | v9)
  {
    if (v9)
    {
      if (v8)
      {
        v11 = objc_msgSend((id)v8, "compare:", v9);
      }
      else
      {
        v17 = WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          __48__WBTabGroupManager__itemSyncPositionComparator__block_invoke_cold_1(v17);
        v11 = 1;
      }
    }
    else
    {
      v16 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        __48__WBTabGroupManager__itemSyncPositionComparator__block_invoke_cold_1(v16);
      v11 = -1;
    }
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __48__WBTabGroupManager__itemSyncPositionComparator__block_invoke_cold_3(v12, v4);
    objc_msgSend(v6, "serverID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverID");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v11 = 0;
    if (v13 && v14)
      v11 = objc_msgSend(v13, "compare:", v14);

  }
  return v11;
}

- (void)_cacheProfile:(id)a3
{
  id v4;
  NSMutableDictionary *profilesByIdentifier;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    os_unfair_lock_lock(&profilesLock);
    profilesByIdentifier = self->_profilesByIdentifier;
    objc_msgSend(v7, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](profilesByIdentifier, "setObject:forKeyedSubscript:", v7, v6);

    os_unfair_lock_unlock(&profilesLock);
    v4 = v7;
  }

}

- (void)unregisterWindowState:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "localTabGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _uncacheTabGroup:](self, "_uncacheTabGroup:", v5);

  objc_msgSend(v4, "privateTabGroup");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[WBTabGroupManager _uncacheTabGroup:](self, "_uncacheTabGroup:", v6);
}

- (BOOL)saveBrowserState:(id)a3
{
  return -[WBTabCollection saveBrowserState:](self->_tabCollection, "saveBrowserState:", a3);
}

- (void)saveBrowserState:(id)a3 completionHandler:(id)a4
{
  -[WBTabCollection saveBrowserState:completionHandler:](self->_tabCollection, "saveBrowserState:completionHandler:", a3, a4);
}

- (BOOL)saveWindowState:(id)a3
{
  return -[WBTabCollection saveWindowState:](self->_tabCollection, "saveWindowState:", a3);
}

- (void)updateTabsInTabGroup:(id)a3 completionHandler:(id)a4
{
  -[WBTabCollection updateTabsInTabGroup:completionHandler:](self->_tabCollection, "updateTabsInTabGroup:completionHandler:", a3, a4);
}

- (void)deleteWindowStates:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        -[WBTabGroupManager unregisterWindowState:](self, "unregisterWindowState:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
  -[WBTabCollection deleteWindowStates:completionHandler:](self->_tabCollection, "deleteWindowStates:completionHandler:", v6, v7);

}

- (BOOL)insertItems:(id)a3 inParentWithID:(unsigned int)a4 afterItem:(id)a5
{
  return -[WBTabCollection insertItems:inParentWithID:afterItem:](self->_tabCollection, "insertItems:inParentWithID:afterItem:", a3, *(_QWORD *)&a4, a5);
}

- (id)_localTabGroups
{
  return (id)-[NSMutableDictionary allValues](self->_localTabGroupsByUUID, "allValues");
}

- (id)_allSyncedTabGroupsExceptRemoteUnnamedTabGroups
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[NSMutableDictionary allValues](self->_syncableTabGroupsByUUID, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__WBTabGroupManager__allSyncedTabGroupsExceptRemoteUnnamedTabGroups__block_invoke;
  v7[3] = &unk_24CB314B0;
  v7[4] = self;
  objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v4, 1);
  return v5;
}

uint64_t __68__WBTabGroupManager__allSyncedTabGroupsExceptRemoteUnnamedTabGroups__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isNamed") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "_didLocallyCreateUnnamedTabGroup:", v3);

  return v4;
}

- (NSArray)namedTabGroupsInDefaultProfile
{
  void *v3;

  os_unfair_lock_lock(&tabGroupsLock);
  -[WBTabGroupManager _tabGroupsForProfileWithIdentifier:](self, "_tabGroupsForProfileWithIdentifier:", *MEMORY[0x24BE82E70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&tabGroupsLock);
  return (NSArray *)v3;
}

- (id)unnamedTabGroupsForProfileWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  os_unfair_lock_lock(&tabGroupsLock);
  -[WBTabGroupManager _unnamedTabGroupsForProfileWithIdentifier:](self, "_unnamedTabGroupsForProfileWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&tabGroupsLock);
  return v5;
}

- (NSArray)allSyncedTabGroupsExceptRemoteUnnamedTabGroups
{
  void *v3;

  os_unfair_lock_lock(&tabGroupsLock);
  -[WBTabGroupManager _allSyncedTabGroupsExceptRemoteUnnamedTabGroups](self, "_allSyncedTabGroupsExceptRemoteUnnamedTabGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&tabGroupsLock);
  return (NSArray *)v3;
}

- (id)tabGroupWithServerID:(id)a3
{
  id v4;
  NSMutableDictionary *syncableTabGroupsByUUID;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  syncableTabGroupsByUUID = self->_syncableTabGroupsByUUID;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__WBTabGroupManager_tabGroupWithServerID___block_invoke;
  v9[3] = &unk_24CB34A38;
  v10 = v4;
  v6 = v4;
  -[NSMutableDictionary safari_valueOfEntryPassingTest:](syncableTabGroupsByUUID, "safari_valueOfEntryPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __42__WBTabGroupManager_tabGroupWithServerID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "serverID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = WBSIsEqual();

  return v4;
}

- (id)insertTabGroup:(id)a3 afterTabGroup:(id)a4
{
  return -[WBTabGroupManager _insertTabGroup:afterTabGroup:isMove:](self, "_insertTabGroup:afterTabGroup:isMove:", a3, a4, 0);
}

- (id)_insertTabGroup:(id)a3 afterTabGroup:(id)a4 isMove:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  WBTabCollection *tabCollection;
  void *v25;
  WBTabCollection *v26;
  void *v27;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  BOOL v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  os_unfair_lock_lock(&tabGroupsLock);
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  v31 = v8;
  objc_msgSend(v8, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _tabGroupWithUUID:](self, "_tabGroupWithUUID:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v30 = (void *)v11;
  -[WBTabGroupManager _generatePositionForTabGroup:afterTabGroup:](self, "_generatePositionForTabGroup:afterTabGroup:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSyncPosition:", v12);

  -[WBTabGroupManager _cacheTabGroup:creatorDeviceUUID:](self, "_cacheTabGroup:creatorDeviceUUID:", v9, 0);
  if (objc_msgSend(v7, "supportsTabGroupFavorites"))
    -[NSMutableSet addObject:](self->_recentlyAddedTabGroupsAwaitingFirstStartPage, "addObject:", v7);
  os_unfair_lock_unlock(&tabGroupsLock);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v17);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v18, "tabGroupManagerDidUpdateTabGroups:", self);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v15);
  }

  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __58__WBTabGroupManager__insertTabGroup_afterTabGroup_isMove___block_invoke;
  v32[3] = &unk_24CB34A60;
  v35 = a5;
  v32[4] = self;
  v19 = v9;
  v33 = v19;
  v20 = v7;
  v34 = v20;
  v21 = (void *)MEMORY[0x212BD4C84](v32);
  os_unfair_lock_lock(&profilesLock);
  objc_msgSend(v19, "profileIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager profileWithIdentifier:](self, "profileWithIdentifier:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&profilesLock);
  if (v23 && objc_msgSend(v23, "kind") && objc_msgSend(v20, "isNamed"))
  {
    tabCollection = self->_tabCollection;
    v41 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabCollection insertItemsIntoPlace:inParent:completionHandler:](tabCollection, "insertItemsIntoPlace:inParent:completionHandler:", v25, v23, v21);
  }
  else
  {
    v26 = self->_tabCollection;
    v40 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabCollection insertItemsIntoPlace:inParentWithID:completionHandler:](v26, "insertItemsIntoPlace:inParentWithID:completionHandler:", v25, 0, v21);
  }

  v27 = (void *)objc_msgSend(v19, "copy");
  return v27;
}

void __58__WBTabGroupManager__insertTabGroup_afterTabGroup_isMove___block_invoke(uint64_t a1, int a2)
{
  int v3;
  void *v4;
  _QWORD block[5];

  if (a2)
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 248);
    if (v3)
      objc_msgSend(v4, "saveMinimumAPISyncVersionOfDescendantItemsForMovedItem:", *(_QWORD *)(a1 + 48));
    else
      objc_msgSend(v4, "createTopScopedBookmarkListIfNeededForTabGroup:", *(_QWORD *)(a1 + 40));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__WBTabGroupManager__insertTabGroup_afterTabGroup_isMove___block_invoke_2;
    block[3] = &unk_24CB315A0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __58__WBTabGroupManager__insertTabGroup_afterTabGroup_isMove___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)moveTabGroup:(id)a3 afterTabGroup:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "profileIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "profileIdentifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqualToString:", v9),
        v9,
        v8,
        !v10))
  {
    objc_msgSend(v7, "profileIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager moveTabGroup:toProfileWithIdentifier:afterTabGroup:](self, "moveTabGroup:toProfileWithIdentifier:afterTabGroup:", v12, v11, v7);

  }
  else
  {
    -[WBTabGroupManager _reorderTabGroup:afterTabGroup:](self, "_reorderTabGroup:afterTabGroup:", v12, v7);
  }

}

- (void)_reorderTabGroup:(id)a3 afterTabGroup:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  WBTabCollection *tabCollection;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(v6, "privacyPreservingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "privacyPreservingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v10;
    v44 = 2114;
    v45 = v11;
    _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Moving tab group %{public}@ after tab group %{public}@", buf, 0x16u);

  }
  os_unfair_lock_lock(&tabGroupsLock);
  objc_msgSend(v6, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _tabGroupWithUUID:](self, "_tabGroupWithUUID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _tabGroupWithUUID:](self, "_tabGroupWithUUID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v6, "profileIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager _tabGroupsForProfileWithIdentifier:](self, "_tabGroupsForProfileWithIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBTabGroupManager _tabGroupAfterTabGroup:inTabGroups:](self, "_tabGroupAfterTabGroup:inTabGroups:", v7, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count") && !WBSIsEqual())
    {
      v33 = v18;
      v34 = v15;
      v35 = v6;
      -[WBTabGroupManager _generatePositionForTabGroup:afterTabGroup:inTabGroups:](self, "_generatePositionForTabGroup:afterTabGroup:inTabGroups:", v13, v15, v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSyncPosition:", v25);

      os_unfair_lock_unlock(&tabGroupsLock);
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v26 = (void *)-[NSHashTable copy](self->_observers, "copy");
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v38 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v31, "tabGroupManagerDidUpdateTabGroups:", self);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v28);
      }

      tabCollection = self->_tabCollection;
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __52__WBTabGroupManager__reorderTabGroup_afterTabGroup___block_invoke;
      v36[3] = &unk_24CB315E8;
      v36[4] = self;
      -[WBTabCollection reorderItemIntoPlace:completionHandler:](tabCollection, "reorderItemIntoPlace:completionHandler:", v13, v36);
      v6 = v35;
      v18 = v33;
      v15 = v34;
    }
    else
    {
      v19 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        objc_msgSend(v6, "privacyPreservingDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v21;
        _os_log_impl(&dword_211022000, v20, OS_LOG_TYPE_INFO, "Not moving tab group %{public}@ because its position did not change.", buf, 0xCu);

      }
      os_unfair_lock_unlock(&tabGroupsLock);
    }

  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      objc_msgSend(v6, "privacyPreservingDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v24;
      _os_log_impl(&dword_211022000, v23, OS_LOG_TYPE_INFO, "Not moving tab group %{public}@ because it no longer exists", buf, 0xCu);

    }
    os_unfair_lock_unlock(&tabGroupsLock);
  }

}

void __52__WBTabGroupManager__reorderTabGroup_afterTabGroup___block_invoke(uint64_t a1, int a2)
{
  _QWORD block[5];

  if (a2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__WBTabGroupManager__reorderTabGroup_afterTabGroup___block_invoke_2;
    block[3] = &unk_24CB315A0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __52__WBTabGroupManager__reorderTabGroup_afterTabGroup___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)moveTabGroup:(id)a3 toProfileWithIdentifier:(id)a4 afterTabGroup:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a5;
  v8 = a4;
  v9 = a3;
  os_unfair_lock_lock(&tabGroupsLock);
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBTabGroupManager _tabGroupWithUUID:](self, "_tabGroupWithUUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setProfileIdentifier:", v8);
  os_unfair_lock_unlock(&tabGroupsLock);
  v12 = -[WBTabGroupManager _insertTabGroup:afterTabGroup:isMove:](self, "_insertTabGroup:afterTabGroup:isMove:", v11, v13, 1);

}

- (void)removeTabGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  NSMutableDictionary *removedTabGroupsByUUID;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  WBTabCollection *tabCollection;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&tabGroupsLock);
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _tabGroupWithUUID:](self, "_tabGroupWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      v9 = v7;
      objc_msgSend(v4, "privacyPreservingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v10;
      _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Removing tab group %{public}@", buf, 0xCu);

    }
    -[WBTabGroupManager _uncacheTabGroup:](self, "_uncacheTabGroup:", v6);
    removedTabGroupsByUUID = self->_removedTabGroupsByUUID;
    objc_msgSend(v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v6;
    -[NSMutableDictionary setObject:forKeyedSubscript:](removedTabGroupsByUUID, "setObject:forKeyedSubscript:", v6, v12);

    os_unfair_lock_unlock(&tabGroupsLock);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v13 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v38;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v17);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v4, "uuid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "tabGroupManager:didRemoveTabGroupWithUUID:", self, v19);

          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v15);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v20 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v34;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v34 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v24);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v25, "tabGroupManagerDidUpdateTabGroups:", self);
          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v22);
    }

    tabCollection = self->_tabCollection;
    v6 = v30;
    v41 = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __36__WBTabGroupManager_removeTabGroup___block_invoke;
    v31[3] = &unk_24CB34A88;
    v31[4] = self;
    v32 = v30;
    -[WBTabCollection deleteItems:leaveTombstones:completionHandler:](tabCollection, "deleteItems:leaveTombstones:completionHandler:", v27, 1, v31);

  }
  else
  {
    if (v8)
    {
      v28 = v7;
      objc_msgSend(v4, "privacyPreservingDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v29;
      _os_log_impl(&dword_211022000, v28, OS_LOG_TYPE_INFO, "Not removing tab group %{public}@ because it no longer exists", buf, 0xCu);

    }
    os_unfair_lock_unlock(&tabGroupsLock);
  }

}

void __36__WBTabGroupManager_removeTabGroup___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  if (a2)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __36__WBTabGroupManager_removeTabGroup___block_invoke_2;
    v3[3] = &unk_24CB31830;
    v2 = *(void **)(a1 + 40);
    v3[4] = *(_QWORD *)(a1 + 32);
    v4 = v2;
    dispatch_async(MEMORY[0x24BDAC9B8], v3);

  }
}

void __36__WBTabGroupManager_removeTabGroup___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[5];
  id v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13[0] = MEMORY[0x24BDAC760];
  v13[2] = __36__WBTabGroupManager_removeTabGroup___block_invoke_3;
  v13[3] = &unk_24CB31830;
  v2 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v13[1] = 3221225472;
  v14 = v2;
  os_unfair_lock_lock(&tabGroupsLock);
  __36__WBTabGroupManager_removeTabGroup___block_invoke_3((uint64_t)v13);
  os_unfair_lock_unlock(&tabGroupsLock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v5);
  }

}

void __36__WBTabGroupManager_removeTabGroup___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", 0, v2);

}

- (void)updateTabGroupWithUUID:(id)a3 persist:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, void *);
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  WBTabCollection *tabCollection;
  NSObject *v34;
  _BOOL4 v35;
  id v36;
  _QWORD v37[4];
  id v38;
  WBTabGroupManager *v39;
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
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  id v56;
  uint64_t v57;

  v6 = a4;
  v57 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v56 = v8;
    _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_INFO, "Updating tab group with uuid %{public}@", buf, 0xCu);
  }
  os_unfair_lock_lock(&tabGroupsLock);
  -[WBTabGroupManager _tabGroupWithUUID:](self, "_tabGroupWithUUID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v35 = v6;
    v36 = v8;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v12 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v49 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v11, "uuid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "tabGroupManager:willPerformBlockUpdatesForTabGroupWithUUID:", self, v18);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v14);
    }

    v9[2](v9, v11);
    objc_msgSend(v11, "updateLastSelectedTab");
    os_unfair_lock_unlock(&tabGroupsLock);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v19 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v45 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v11, "uuid");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "tabGroupManager:didPerformBlockUpdatesForTabGroupWithUUID:", self, v25);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v21);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v26 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v41;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v41 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v11, "uuid");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "tabGroupManager:didUpdateTabGroupWithUUID:", self, v32);

          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      }
      while (v28);
    }

    v8 = v36;
    if (v35)
    {
      tabCollection = self->_tabCollection;
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __63__WBTabGroupManager_updateTabGroupWithUUID_persist_usingBlock___block_invoke;
      v37[3] = &unk_24CB34A88;
      v38 = v11;
      v39 = self;
      -[WBTabCollection saveItem:completionHandler:](tabCollection, "saveItem:completionHandler:", v38, v37);

    }
  }
  else
  {
    v34 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v56 = v8;
      _os_log_impl(&dword_211022000, v34, OS_LOG_TYPE_INFO, "Not updating tab group with uuid %{public}@ because it does not exist.", buf, 0xCu);
    }
    os_unfair_lock_unlock(&tabGroupsLock);
  }

}

void __63__WBTabGroupManager_updateTabGroupWithUUID_persist_usingBlock___block_invoke(uint64_t a1, int a2)
{
  _QWORD block[5];

  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isSyncable"))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__WBTabGroupManager_updateTabGroupWithUUID_persist_usingBlock___block_invoke_2;
      block[3] = &unk_24CB315A0;
      block[4] = *(_QWORD *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
}

void __63__WBTabGroupManager_updateTabGroupWithUUID_persist_usingBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)tabGroupHasDisplayedStartPage:(id)a3
{
  -[NSMutableSet removeObject:](self->_recentlyAddedTabGroupsAwaitingFirstStartPage, "removeObject:", a3);
}

- (void)recentlyAddedTabGroupIsAwaitingFirstStartPage:(id)a3
{
  -[NSMutableSet addObject:](self->_recentlyAddedTabGroupsAwaitingFirstStartPage, "addObject:", a3);
}

- (BOOL)hasMultipleProfiles
{
  void *v2;
  BOOL v3;

  -[WBTabGroupManager profiles](self, "profiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

uint64_t __47__WBTabGroupManager_allNamedProfileIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __56__WBTabGroupManager__tabGroupsForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "isNamed"))
  {
    objc_msgSend(v3, "profileIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((WBSIsEqual() & 1) != 0)
    {
      v5 = 1;
    }
    else if (*(_BYTE *)(a1 + 40))
    {
      v5 = objc_msgSend(v3, "isInDefaultProfile");
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_unnamedTabGroupsForProfileWithIdentifier:(id)a3
{
  id v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  char v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x24BE82E70]);
  -[NSMutableDictionary allValues](self->_syncableTabGroupsByUUID, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__WBTabGroupManager__unnamedTabGroupsForProfileWithIdentifier___block_invoke;
  v10[3] = &unk_24CB34B50;
  v11 = v4;
  v12 = v5;
  v7 = v4;
  objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __63__WBTabGroupManager__unnamedTabGroupsForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if ((objc_msgSend(v3, "isNamed") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "profileIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((WBSIsEqual() & 1) != 0)
    {
      v4 = 1;
    }
    else if (*(_BYTE *)(a1 + 40))
    {
      v4 = objc_msgSend(v3, "isInDefaultProfile");
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (id)_unnamedTabGroupsForDeviceWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[NSMutableDictionary allValues](self->_syncableTabGroupsByUUID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__WBTabGroupManager__unnamedTabGroupsForDeviceWithUUID___block_invoke;
  v11[3] = &unk_24CB34B78;
  v12 = v4;
  v6 = v4;
  objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBTabGroupManager _itemSyncPositionComparator](self, "_itemSyncPositionComparator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __56__WBTabGroupManager__unnamedTabGroupsForDeviceWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  if ((objc_msgSend(v2, "isNamed") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "deviceUUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = WBSIsEqual();

  }
  return v3;
}

- (void)appendProfile:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *profilesByIdentifier;
  void *v12;
  WBSProfileDataManager *profileDataManager;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  WBTabCollection *tabCollection;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  WBTabGroupManager *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v33 = a4;
  os_unfair_lock_lock(&profilesLock);
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[WBTabGroupManager _namedProfiles](self, "_namedProfiles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _generatePositionForProfile:afterProfile:](self, "_generatePositionForProfile:afterProfile:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSyncPosition:", v10);

  profilesByIdentifier = self->_profilesByIdentifier;
  objc_msgSend(v6, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](profilesByIdentifier, "setObject:forKeyedSubscript:", v7, v12);

  os_unfair_lock_unlock(&profilesLock);
  profileDataManager = self->_profileDataManager;
  objc_msgSend(v6, "serverID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v6;
  objc_msgSend(v6, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSProfileDataManager ensureProfileDirectoriesExistForProfileWithServerID:profileIdentifier:](profileDataManager, "ensureProfileDirectoriesExistForProfileWithServerID:profileIdentifier:", v14, v15);

  v45 = 0u;
  v46 = 0u;
  v44 = 0u;
  v43 = 0u;
  v16 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v44;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v44 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v20);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v7, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "tabGroupManager:didInsertProfileWithIdentifier:", self, v22);

        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v18);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v23 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v40;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v27);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v28, "tabGroupManagerDidUpdateProfiles:", self);
        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v25);
  }

  tabCollection = self->_tabCollection;
  v47 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __53__WBTabGroupManager_appendProfile_completionHandler___block_invoke;
  v35[3] = &unk_24CB34BC8;
  v37 = self;
  v38 = v33;
  v36 = v7;
  v31 = v7;
  v32 = v33;
  -[WBTabCollection insertItemsIntoPlace:inParentWithID:completionHandler:](tabCollection, "insertItemsIntoPlace:inParentWithID:completionHandler:", v30, 0, v35);

}

void __53__WBTabGroupManager_appendProfile_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  _QWORD v5[5];
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  v4 = MEMORY[0x24BDAC760];
  if (*(_QWORD *)(a1 + 48))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__WBTabGroupManager_appendProfile_completionHandler___block_invoke_2;
    block[3] = &unk_24CB34BA0;
    v8 = *(id *)(a1 + 48);
    v9 = a2;
    v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  if (a2)
  {
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __53__WBTabGroupManager_appendProfile_completionHandler___block_invoke_3;
    v5[3] = &unk_24CB315A0;
    v5[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], v5);
  }
}

void __53__WBTabGroupManager_appendProfile_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
  {
    v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

void __53__WBTabGroupManager_appendProfile_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __86__WBTabGroupManager_updateProfileWithIdentifier_persist_usingBlock_completionHandler___block_invoke(uint64_t a1, int a2)
{
  _QWORD v4[5];
  _QWORD block[4];
  id v6;
  char v7;

  if (*(_QWORD *)(a1 + 48))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__WBTabGroupManager_updateProfileWithIdentifier_persist_usingBlock_completionHandler___block_invoke_2;
    block[3] = &unk_24CB34BF0;
    v6 = *(id *)(a1 + 48);
    v7 = a2;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isSyncable"))
    {
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = __86__WBTabGroupManager_updateProfileWithIdentifier_persist_usingBlock_completionHandler___block_invoke_3;
      v4[3] = &unk_24CB315A0;
      v4[4] = *(_QWORD *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], v4);
    }
  }
}

uint64_t __86__WBTabGroupManager_updateProfileWithIdentifier_persist_usingBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __86__WBTabGroupManager_updateProfileWithIdentifier_persist_usingBlock_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)removeProfile:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *profilesByIdentifier;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  NSMutableDictionary *removedProfilesByIdentifier;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  id v32;
  WBTabCollection *tabCollection;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&profilesLock);
  profilesByIdentifier = self->_profilesByIdentifier;
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](profilesByIdentifier, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      v13 = v11;
      objc_msgSend(v6, "privacyPreservingDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v14;
      _os_log_impl(&dword_211022000, v13, OS_LOG_TYPE_INFO, "Removing profile %{public}@", buf, 0xCu);

    }
    v38 = v7;
    v15 = self->_profilesByIdentifier;
    objc_msgSend(v6, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v16);

    removedProfilesByIdentifier = self->_removedProfilesByIdentifier;
    objc_msgSend(v10, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v10;
    -[NSMutableDictionary setObject:forKeyedSubscript:](removedProfilesByIdentifier, "setObject:forKeyedSubscript:", v10, v18);

    os_unfair_lock_unlock(&profilesLock);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v19 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v48 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v6, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "tabGroupManager:didRemoveProfileWithIdentifier:", self, v25);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v21);
    }

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v26 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v44 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v31, "tabGroupManagerDidUpdateProfiles:", self);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v28);
    }

    v10 = v37;
    if (!-[WBTabGroupManager hasMultipleProfiles](self, "hasMultipleProfiles"))
      v32 = -[WBTabGroupManager updateProfileWithIdentifier:persist:usingBlock:completionHandler:](self, "updateProfileWithIdentifier:persist:usingBlock:completionHandler:", *MEMORY[0x24BE82E70], 1, &__block_literal_global_84, 0);
    tabCollection = self->_tabCollection;
    v51 = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_2;
    v39[3] = &unk_24CB34C58;
    v7 = v38;
    v42 = v38;
    v39[4] = self;
    v40 = v6;
    v41 = v37;
    -[WBTabCollection deleteItems:leaveTombstones:completionHandler:](tabCollection, "deleteItems:leaveTombstones:completionHandler:", v34, 1, v39);

  }
  else
  {
    if (v12)
    {
      v35 = v11;
      objc_msgSend(v6, "privacyPreservingDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v36;
      _os_log_impl(&dword_211022000, v35, OS_LOG_TYPE_INFO, "Not removing profile %{public}@ because it no longer exists", buf, 0xCu);

    }
    os_unfair_lock_unlock(&profilesLock);
  }

}

void __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", &stru_24CB35168);
  objc_msgSend(MEMORY[0x24BE82CB0], "defaultPersonalProfileSymbolImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSymbolImageName:", v3);

  objc_msgSend(MEMORY[0x24BE82CB0], "defaultPersonalProfileColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setColor:", v4);

}

void __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  _QWORD block[4];
  id v8;
  char v9;

  v4 = MEMORY[0x24BDAC760];
  if (*(_QWORD *)(a1 + 56))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_3;
    block[3] = &unk_24CB34BF0;
    v8 = *(id *)(a1 + 56);
    v9 = a2;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "didRemoveProfile:", *(_QWORD *)(a1 + 40));
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_4;
    v5[3] = &unk_24CB31830;
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

uint64_t __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[5];
  id v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13[0] = MEMORY[0x24BDAC760];
  v13[2] = __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_5;
  v13[3] = &unk_24CB31830;
  v2 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v13[1] = 3221225472;
  v14 = v2;
  os_unfair_lock_lock(&profilesLock);
  __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_5((uint64_t)v13);
  os_unfair_lock_unlock(&profilesLock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v5);
  }

}

void __53__WBTabGroupManager_removeProfile_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", 0, v2);

}

- (void)moveProfile:(id)a3 afterProfile:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *profilesByIdentifier;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  WBTabCollection *tabCollection;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(v6, "privacyPreservingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "privacyPreservingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v10;
    v38 = 2114;
    v39 = v11;
    _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Moving profile %{public}@ after profile %{public}@", buf, 0x16u);

  }
  os_unfair_lock_lock(&profilesLock);
  profilesByIdentifier = self->_profilesByIdentifier;
  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](profilesByIdentifier, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = self->_profilesByIdentifier;
  objc_msgSend(v7, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v29 = v17;
    -[WBTabGroupManager _generatePositionForProfile:afterProfile:](self, "_generatePositionForProfile:afterProfile:", v6, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSyncPosition:", v18);

    os_unfair_lock_unlock(&profilesLock);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v24, "tabGroupManagerDidUpdateProfiles:", self);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v21);
    }

    tabCollection = self->_tabCollection;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __46__WBTabGroupManager_moveProfile_afterProfile___block_invoke;
    v30[3] = &unk_24CB315E8;
    v30[4] = self;
    -[WBTabCollection reorderItemIntoPlace:completionHandler:](tabCollection, "reorderItemIntoPlace:completionHandler:", v14, v30);
    v17 = v29;
  }
  else
  {
    v26 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = v26;
      objc_msgSend(v6, "privacyPreservingDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v28;
      _os_log_impl(&dword_211022000, v27, OS_LOG_TYPE_INFO, "Not moving profile %{public}@ because it no longer exists", buf, 0xCu);

    }
    os_unfair_lock_unlock(&profilesLock);
  }

}

void __46__WBTabGroupManager_moveProfile_afterProfile___block_invoke(uint64_t a1, int a2)
{
  _QWORD block[5];

  if (a2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__WBTabGroupManager_moveProfile_afterProfile___block_invoke_2;
    block[3] = &unk_24CB315A0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __46__WBTabGroupManager_moveProfile_afterProfile___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)insertUnnamedTabGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *deviceUUIDByTabGroupUUID;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  WBTabCollection *tabCollection;
  void *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  WBTabGroupManager *v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&profilesLock);
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "profileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager profileWithIdentifier:](self, "profileWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _findOrCreateLocalDeviceForProfileWithIdentifier:](self, "_findOrCreateLocalDeviceForProfileWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  deviceUUIDByTabGroupUUID = self->_deviceUUIDByTabGroupUUID;
  objc_msgSend(v5, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](deviceUUIDByTabGroupUUID, "setObject:forKeyedSubscript:", v10, v12);

  os_unfair_lock_unlock(&profilesLock);
  v13 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __43__WBTabGroupManager_insertUnnamedTabGroup___block_invoke;
  v22[3] = &unk_24CB324C0;
  v23 = v5;
  v24 = self;
  v25 = v9;
  v14 = v9;
  v15 = v5;
  os_unfair_lock_lock(&tabGroupsLock);
  __43__WBTabGroupManager_insertUnnamedTabGroup___block_invoke((id *)v22);
  os_unfair_lock_unlock(&tabGroupsLock);
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __43__WBTabGroupManager_insertUnnamedTabGroup___block_invoke_2;
  v21[3] = &unk_24CB315E8;
  v21[4] = self;
  v16 = (void *)MEMORY[0x212BD4C84](v21);
  tabCollection = self->_tabCollection;
  v26[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabCollection insertItemsIntoPlace:inParent:completionHandler:](tabCollection, "insertItemsIntoPlace:inParent:completionHandler:", v18, v14, v16);

  v19 = (void *)objc_msgSend(v15, "copy");
  return v19;
}

void __43__WBTabGroupManager_insertUnnamedTabGroup___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(a1[5], "_generatePositionForTabGroup:afterTabGroup:", a1[4], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setSyncPosition:", v2);

  objc_msgSend(a1[6], "profileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setDeviceUUIDString:", v3);

  v5 = a1[4];
  v4 = a1[5];
  objc_msgSend(a1[6], "profileIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cacheTabGroup:creatorDeviceUUID:", v5, v6);

}

void __43__WBTabGroupManager_insertUnnamedTabGroup___block_invoke_2(uint64_t a1, int a2)
{
  _QWORD block[5];

  if (a2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__WBTabGroupManager_insertUnnamedTabGroup___block_invoke_3;
    block[3] = &unk_24CB315A0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __43__WBTabGroupManager_insertUnnamedTabGroup___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)_tabGroupsWithTabsToBeClosedForProfilesWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = *MEMORY[0x24BE82E70];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        if (*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11) == v10)
          -[NSMutableDictionary allValues](self->_localTabGroupsByUUID, "allValues", (_QWORD)v14);
        else
          -[WBTabGroupManager _unnamedTabGroupsForProfileWithIdentifier:](self, "_unnamedTabGroupsForProfileWithIdentifier:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12, (_QWORD)v14);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (unint64_t)numberOfTabsToBeClosedForProfilesWithIdentifiers:(id)a3
{
  return -[WBTabCollection numberOfLocalTabsToBeClosed](self->_tabCollection, "numberOfLocalTabsToBeClosed", a3);
}

- (void)closeAllTabsInProfilesWithIdentifiers:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[WBTabGroupManager _tabGroupsWithTabsToBeClosedForProfilesWithIdentifiers:](self, "_tabGroupsWithTabsToBeClosedForProfilesWithIdentifiers:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBTabGroupManager updateTabsInTabGroupWithUUID:persist:usingBlock:](self, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v9, 1, &__block_literal_global_89);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

uint64_t __59__WBTabGroupManager_closeAllTabsInProfilesWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearTabs");
}

- (BOOL)isTab:(id)a3 childOfPinnedTabGroupOfNamedProfileOfUnnamedTabGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  WBTabCollection *tabCollection;
  void *v12;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isNamed") & 1) != 0
    || (objc_msgSend(v7, "profileIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE82E70]),
        v8,
        (v9 & 1) != 0))
  {
    v10 = 0;
  }
  else
  {
    tabCollection = self->_tabCollection;
    objc_msgSend(v7, "profileIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(tabCollection) = -[WBTabCollection pinnedTabsFolderIDForProfileWithIdentifier:](tabCollection, "pinnedTabsFolderIDForProfileWithIdentifier:", v12);

    v10 = objc_msgSend(v6, "parentIdentifier") == (_DWORD)tabCollection;
  }

  return v10;
}

- (NSString)defaultProfileIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BE82E70];
}

- (id)profileWithServerID:(id)a3
{
  id v4;
  NSMutableDictionary *profilesByIdentifier;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  os_unfair_lock_lock(&profilesLock);
  profilesByIdentifier = self->_profilesByIdentifier;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__WBTabGroupManager_profileWithServerID___block_invoke;
  v9[3] = &unk_24CB34CC0;
  v10 = v4;
  v6 = v4;
  -[NSMutableDictionary safari_valueOfEntryPassingTest:](profilesByIdentifier, "safari_valueOfEntryPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&profilesLock);

  return v7;
}

uint64_t __41__WBTabGroupManager_profileWithServerID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "serverID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = WBSIsEqual();

  return v4;
}

- (id)syncedRemoteCloudTabDevicesForProfileWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  os_unfair_lock_lock(&profilesLock);
  -[WBTabGroupManager _remoteDevicesForProfileWithIdentifier:](self, "_remoteDevicesForProfileWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&profilesLock);
  return v5;
}

- (BOOL)closeTab:(id)a3 onDevice:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a3, "uuidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _tabWithUUID:](self, "_tabWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "tabGroupUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__WBTabGroupManager_closeTab_onDevice___block_invoke;
  v10[3] = &unk_24CB31568;
  v11 = v6;
  v8 = v6;
  -[WBTabGroupManager updateTabsInTabGroupWithUUID:persist:usingBlock:](self, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v7, 1, v10);

  return 1;
}

void __39__WBTabGroupManager_closeTab_onDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x24BDBCE30];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteTabs:", v4, v5, v6);

}

- (BOOL)closeAllTabsOnDevice:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];

  objc_msgSend(a3, "tabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __42__WBTabGroupManager_closeAllTabsOnDevice___block_invoke;
  v13[3] = &unk_24CB34CE8;
  v13[4] = self;
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tabGroupUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __42__WBTabGroupManager_closeAllTabsOnDevice___block_invoke_2;
    v11[3] = &unk_24CB31568;
    v12 = v6;
    -[WBTabGroupManager updateTabsInTabGroupWithUUID:persist:usingBlock:](self, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v9, 1, v11);

  }
  return v7 != 0;
}

id __42__WBTabGroupManager_closeAllTabsOnDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuidString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_tabWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __42__WBTabGroupManager_closeAllTabsOnDevice___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteTabs:", *(_QWORD *)(a1 + 32));
}

- (BOOL)cloudTabsAreEnabled
{
  return 1;
}

- (id)devicesForProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  os_unfair_lock_lock(&profilesLock);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBTabGroupManager _devicesForProfileWithIdentifier:](self, "_devicesForProfileWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&profilesLock);
  return v6;
}

- (id)_devicesForProfileWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[NSMutableDictionary allValues](self->_devicesByUUID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__WBTabGroupManager__devicesForProfileWithIdentifier___block_invoke;
  v11[3] = &unk_24CB34D10;
  v12 = v4;
  v6 = v4;
  objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBTabGroupManager _itemSyncPositionComparator](self, "_itemSyncPositionComparator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __54__WBTabGroupManager__devicesForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "profileIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  return v3;
}

- (id)_remoteDevicesForProfileWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[NSMutableDictionary allValues](self->_devicesByUUID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__WBTabGroupManager__remoteDevicesForProfileWithIdentifier___block_invoke;
  v11[3] = &unk_24CB34D10;
  v12 = v4;
  v6 = v4;
  objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBTabGroupManager _itemSyncPositionComparator](self, "_itemSyncPositionComparator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL __60__WBTabGroupManager__remoteDevicesForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = a2;
  objc_msgSend(v2, "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "subtype") == 4)
  {
    objc_msgSend(v2, "profileIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (WBSIsEqual())
    {
      objc_msgSend(v2, "tabs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count") != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_insertDevice:(id)a3 inProfile:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSMutableDictionary *devicesByUUID;
  void *v13;
  WBTabCollection *tabCollection;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  os_unfair_lock_assert_owner(&profilesLock);
  -[WBTabGroupManager _generatePositionForDevice:afterDevice:](self, "_generatePositionForDevice:afterDevice:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSyncPosition:", v11);

  devicesByUUID = self->_devicesByUUID;
  objc_msgSend(v8, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](devicesByUUID, "setObject:forKeyedSubscript:", v8, v13);

  tabCollection = self->_tabCollection;
  v21[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __63__WBTabGroupManager__insertDevice_inProfile_completionHandler___block_invoke;
  v19[3] = &unk_24CB34D38;
  v19[4] = self;
  v20 = v9;
  v16 = v9;
  -[WBTabCollection insertItemsIntoPlace:inParent:completionHandler:](tabCollection, "insertItemsIntoPlace:inParent:completionHandler:", v15, v10, v19);

  v17 = v8;
  return v17;
}

void __63__WBTabGroupManager__insertDevice_inProfile_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  _QWORD v5[5];
  _QWORD block[4];
  id v7;
  char v8;

  v4 = MEMORY[0x24BDAC760];
  if (*(_QWORD *)(a1 + 40))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__WBTabGroupManager__insertDevice_inProfile_completionHandler___block_invoke_2;
    block[3] = &unk_24CB34BF0;
    v7 = *(id *)(a1 + 40);
    v8 = a2;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  if (a2)
  {
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __63__WBTabGroupManager__insertDevice_inProfile_completionHandler___block_invoke_3;
    v5[3] = &unk_24CB315A0;
    v5[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v5);
  }
}

uint64_t __63__WBTabGroupManager__insertDevice_inProfile_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __63__WBTabGroupManager__insertDevice_inProfile_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)_findOrCreateLocalDeviceForProfileWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *lastLocalDeviceNameSaved;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[WBTabGroupManager _findLocalDeviceForProfileWithIdentifier:](self, "_findLocalDeviceForProfileWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_profilesByIdentifier, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    lastLocalDeviceNameSaved = self->_lastLocalDeviceNameSaved;
    -[WBSDevice userUniqueDeviceIdentifier](self->_device, "userUniqueDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager deviceIdentifier](self, "deviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBDeviceParameters localDeviceWithTitle:creationDeviceIdentifier:deviceIdentifier:](WBDeviceParameters, "localDeviceWithTitle:creationDeviceIdentifier:deviceIdentifier:", lastLocalDeviceNameSaved, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSDevice deviceTypeIdentifier](self->_device, "deviceTypeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeviceTypeIdentifier:", v11);

    +[WBDevice deviceWithParameters:unnamedTabGroups:profileIdentifier:](WBDevice, "deviceWithParameters:unnamedTabGroups:profileIdentifier:", v10, MEMORY[0x24BDBD1A8], v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager _insertDevice:inProfile:completionHandler:](self, "_insertDevice:inProfile:completionHandler:", v12, v6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_findLocalDeviceForProfileWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[WBTabGroupManager _devicesForProfileWithIdentifier:](self, "_devicesForProfileWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_95);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __62__WBTabGroupManager__findLocalDeviceForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRemoteDevice") ^ 1;
}

- (void)_didModifyUnnamedTabGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  WBTabCollection *tabCollection;
  _QWORD v12[5];

  v4 = a3;
  objc_msgSend(v4, "deviceUUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _didModifyUnnamedTabGroupInDeviceWithUUID:](self, "_didModifyUnnamedTabGroupInDeviceWithUUID:", v5);

  os_unfair_lock_lock(&tabGroupsLock);
  objc_msgSend(v4, "deviceUUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _unnamedTabGroupsForDeviceWithUUID:](self, "_unnamedTabGroupsForDeviceWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqual:", v8);

  if (v9)
  {
    os_unfair_lock_unlock(&tabGroupsLock);
  }
  else
  {
    -[WBTabGroupManager _generatePositionForTabGroup:afterTabGroup:](self, "_generatePositionForTabGroup:afterTabGroup:", v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSyncPosition:", v10);

    os_unfair_lock_unlock(&tabGroupsLock);
    tabCollection = self->_tabCollection;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __47__WBTabGroupManager__didModifyUnnamedTabGroup___block_invoke;
    v12[3] = &unk_24CB315E8;
    v12[4] = self;
    -[WBTabCollection reorderItemIntoPlace:completionHandler:](tabCollection, "reorderItemIntoPlace:completionHandler:", v4, v12);
  }

}

void __47__WBTabGroupManager__didModifyUnnamedTabGroup___block_invoke(uint64_t a1, int a2)
{
  _QWORD block[5];

  if (a2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__WBTabGroupManager__didModifyUnnamedTabGroup___block_invoke_2;
    block[3] = &unk_24CB315A0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __47__WBTabGroupManager__didModifyUnnamedTabGroup___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_didModifyUnnamedTabGroupInDeviceWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  WBTabCollection *tabCollection;
  _QWORD v12[5];

  v4 = a3;
  os_unfair_lock_lock(&tabGroupsLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devicesByUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "profileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _devicesForProfileWithIdentifier:](self, "_devicesForProfileWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if (v9)
  {
    os_unfair_lock_unlock(&tabGroupsLock);
  }
  else
  {
    -[WBTabGroupManager _generatePositionForDevice:afterDevice:](self, "_generatePositionForDevice:afterDevice:", v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSyncPosition:", v10);

    os_unfair_lock_unlock(&tabGroupsLock);
    tabCollection = self->_tabCollection;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __63__WBTabGroupManager__didModifyUnnamedTabGroupInDeviceWithUUID___block_invoke;
    v12[3] = &unk_24CB315E8;
    v12[4] = self;
    -[WBTabCollection reorderItemIntoPlace:completionHandler:](tabCollection, "reorderItemIntoPlace:completionHandler:", v5, v12);
  }

}

void __63__WBTabGroupManager__didModifyUnnamedTabGroupInDeviceWithUUID___block_invoke(uint64_t a1, int a2)
{
  _QWORD block[5];

  if (a2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__WBTabGroupManager__didModifyUnnamedTabGroupInDeviceWithUUID___block_invoke_2;
    block[3] = &unk_24CB315A0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __63__WBTabGroupManager__didModifyUnnamedTabGroupInDeviceWithUUID___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __55__WBTabGroupManager__updateDeviceNameIfNeededWithName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRemoteDevice") ^ 1;
}

- (BOOL)_didLocallyCreateUnnamedTabGroup:(id)a3
{
  NSMutableDictionary *deviceUUIDByTabGroupUUID;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  deviceUUIDByTabGroupUUID = self->_deviceUUIDByTabGroupUUID;
  objc_msgSend(a3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](deviceUUIDByTabGroupUUID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_devicesByUUID, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "isRemoteDevice") ^ 1;
    else
      LOBYTE(v9) = 1;

  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)updateTabWithUUID:(id)a3 persist:(BOOL)a4 notify:(BOOL)a5 usingBlock:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void (**v11)(id, void *);
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  WBTabCollection *tabCollection;
  uint64_t v29;
  void *v30;
  int v31;
  char v32;
  void *v33;
  _BOOL4 v34;
  id v35;
  _QWORD v36[5];
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v7 = a5;
  v8 = a4;
  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (void (**)(id, void *))a6;
  v12 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v10;
    _os_log_impl(&dword_211022000, v12, OS_LOG_TYPE_INFO, "Updating tabs with uuid %{public}@", buf, 0xCu);
  }
  os_unfair_lock_lock(&tabGroupsLock);
  -[WBTabGroupManager _tabWithUUID:](self, "_tabWithUUID:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      v16 = v14;
      objc_msgSend(v13, "privacyPreservingDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v17;
      _os_log_impl(&dword_211022000, v16, OS_LOG_TYPE_INFO, "Updating tab %{public}@", buf, 0xCu);

    }
    v11[2](v11, v13);
    objc_msgSend(v13, "tabGroupUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager _tabGroupWithUUID:](self, "_tabGroupWithUUID:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v18) = objc_msgSend(v13, "wasModified");
    v20 = objc_msgSend(v13, "isSyncable");
    os_unfair_lock_unlock(&tabGroupsLock);
    if ((_DWORD)v18)
    {
      if (v7)
      {
        v32 = v20;
        v33 = v19;
        v34 = v8;
        v35 = v10;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v21 = (void *)-[NSHashTable copy](self->_observers, "copy");
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v39 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v13, "uuid");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "tabGroupManager:didUpdateTabWithUUID:userDriven:", self, v27, 1);

              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          }
          while (v23);
        }

        v10 = v35;
        v8 = v34;
        v19 = v33;
        v20 = v32;
      }
      if (v8)
      {
        tabCollection = self->_tabCollection;
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __65__WBTabGroupManager_updateTabWithUUID_persist_notify_usingBlock___block_invoke;
        v36[3] = &unk_24CB34DC0;
        v37 = v20;
        v36[4] = self;
        -[WBTabCollection saveItem:completionHandler:](tabCollection, "saveItem:completionHandler:", v13, v36);
        objc_msgSend(v13, "markClean");
        if ((objc_msgSend(v19, "isNamed") & 1) == 0)
        {
          objc_msgSend(v19, "deviceUUIDString");
          v29 = objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v30 = (void *)v29;
            v31 = objc_msgSend(MEMORY[0x24BE82CC8], "isSafariProfilesEnabled");

            if (v31)
              -[WBTabGroupManager _didModifyUnnamedTabGroup:](self, "_didModifyUnnamedTabGroup:", v19);
          }
        }
      }
    }

  }
  else
  {
    if (v15)
    {
      *(_DWORD *)buf = 138543362;
      v44 = v10;
      _os_log_impl(&dword_211022000, v14, OS_LOG_TYPE_INFO, "Not updating tab with uuid %{public}@ because it does not exist.", buf, 0xCu);
    }
    os_unfair_lock_unlock(&tabGroupsLock);
  }

}

void __65__WBTabGroupManager_updateTabWithUUID_persist_notify_usingBlock___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  if (*(_BYTE *)(a1 + 40))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__WBTabGroupManager_updateTabWithUUID_persist_notify_usingBlock___block_invoke_2;
    block[3] = &unk_24CB315A0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __65__WBTabGroupManager_updateTabWithUUID_persist_notify_usingBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)moveTabs:(id)a3 toTabGroup:(id)a4 afterTab:(id)a5 withoutPersistingTabGroupsWithUUIDStrings:(id)a6
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  WBMutableTab *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  int v22;
  WBMutableTab *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  int v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD v52[4];
  id v53;
  WBTabGroupManager *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  WBTabGroupManager *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v45 = a4;
  v42 = a5;
  v43 = a6;
  v10 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = objc_msgSend(v9, "count");
    objc_msgSend(v45, "privacyPreservingDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v72 = v12;
    v73 = 2114;
    v74 = v13;
    _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_INFO, "Moving %zu tabs to tab group %{public}@", buf, 0x16u);

  }
  os_unfair_lock_lock(&reloadAfterSyncLock);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v9;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v66;
    do
    {
      v50 = 0;
      do
      {
        if (*(_QWORD *)v66 != v47)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v50);
        objc_msgSend(v14, "tabGroupUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 == 0;

        if (!v16)
        {
          objc_msgSend(v14, "tabGroupUUID");
          v17 = (WBMutableTab *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            v20 = v18;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v20 = (id)objc_claimAutoreleasedReturnValue();
          }
          v25 = v20;

          objc_msgSend(v25, "addObject:", v14);
          objc_msgSend(v49, "setObject:forKeyedSubscript:", v25, v17);
LABEL_26:

          goto LABEL_27;
        }
        v21 = WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_211022000, v21, OS_LOG_TYPE_INFO, "Moving tab with no tab group", buf, 2u);
        }
        v22 = objc_msgSend(v14, "isSyncable");
        if (v22 != objc_msgSend(v45, "isSyncable"))
        {
          v23 = [WBMutableTab alloc];
          objc_msgSend(v14, "deviceIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[WBTab initWithUUID:deviceIdentifier:](v23, "initWithUUID:deviceIdentifier:", 0, v24);

          -[WBMutableTab adoptAttributesFromTab:](v17, "adoptAttributesFromTab:", v14);
          objc_msgSend(v44, "addObject:", v17);
          v63 = 0u;
          v64 = 0u;
          v62 = 0u;
          v61 = 0u;
          v25 = (void *)-[NSHashTable copy](self->_observers, "copy");
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v62;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v62 != v27)
                  objc_enumerationMutation(v25);
                v29 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v14, "uuid");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WBTab uuid](v17, "uuid");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "tabGroupManager:willReplaceTabWithUUID:withTabWithUUID:", self, v30, v31);

                }
              }
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
            }
            while (v26);
          }
          goto LABEL_26;
        }
        v17 = (WBMutableTab *)objc_msgSend(v14, "mutableCopy");
        objc_msgSend(v44, "addObject:", v17);
LABEL_27:

        ++v50;
      }
      while (v50 != v48);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      v48 = v32;
    }
    while (v32);
  }

  v33 = MEMORY[0x24BDAC760];
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __92__WBTabGroupManager_moveTabs_toTabGroup_afterTab_withoutPersistingTabGroupsWithUUIDStrings___block_invoke;
  v56[3] = &unk_24CB34E10;
  v34 = v43;
  v57 = v34;
  v35 = v45;
  v58 = v35;
  v59 = self;
  v36 = v44;
  v60 = v36;
  objc_msgSend(v49, "enumerateKeysAndObjectsUsingBlock:", v56);
  objc_msgSend(v35, "uuid");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v34, "containsObject:", v37);

  objc_msgSend(v35, "uuid");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v33;
  v52[1] = 3221225472;
  v52[2] = __92__WBTabGroupManager_moveTabs_toTabGroup_afterTab_withoutPersistingTabGroupsWithUUIDStrings___block_invoke_3;
  v52[3] = &unk_24CB34E38;
  v40 = v36;
  v53 = v40;
  v54 = self;
  v41 = v42;
  v55 = v41;
  -[WBTabGroupManager updateTabsInTabGroupWithUUID:persist:usingBlock:](self, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v39, v38 ^ 1u, v52);

  os_unfair_lock_unlock(&reloadAfterSyncLock);
}

void __92__WBTabGroupManager_moveTabs_toTabGroup_afterTab_withoutPersistingTabGroupsWithUUIDStrings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  int8x16_t v16;
  _QWORD v17[4];
  id v18;
  int8x16_t v19;
  id v20;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  v8 = objc_msgSend(v6, "containsObject:", v7);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  v11 = 2;
  if (!v10)
    v11 = 0;
  v12 = v11 | v8 ^ 1u;
  v13 = *(void **)(a1 + 48);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __92__WBTabGroupManager_moveTabs_toTabGroup_afterTab_withoutPersistingTabGroupsWithUUIDStrings___block_invoke_2;
  v17[3] = &unk_24CB34DE8;
  v18 = v5;
  v16 = *(int8x16_t *)(a1 + 40);
  v14 = (id)v16.i64[0];
  v19 = vextq_s8(v16, v16, 8uLL);
  v20 = *(id *)(a1 + 56);
  v15 = v5;
  objc_msgSend(v13, "updateTabsInTabGroupWithUUID:options:usingBlock:", v7, v12, v17);

}

void __92__WBTabGroupManager_moveTabs_toTabGroup_afterTab_withoutPersistingTabGroupsWithUUIDStrings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  WBMutableTab *v15;
  void *v16;
  void *v17;
  WBMutableTab *v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = *(id *)(a1 + 32);
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v6 = *(void **)(a1 + 40);
        objc_msgSend(v5, "uuid");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_tabWithUUID:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v3, "isSyncable");
        v10 = objc_msgSend(*(id *)(a1 + 48), "isSyncable");
        objc_msgSend(v3, "profileIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "profileIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = WBSIsEqual();

        if (v9 == v10 && v13)
        {
          objc_msgSend(v3, "removeTab:", v8);
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);
        }
        else
        {
          v26 = v8;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "deleteTabs:", v14);

          v15 = [WBMutableTab alloc];
          objc_msgSend(v5, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "deviceIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[WBTab initWithUUID:deviceIdentifier:](v15, "initWithUUID:deviceIdentifier:", v16, v17);

          -[WBMutableTab adoptAttributesFromTab:](v18, "adoptAttributesFromTab:", v5);
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v18);

        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v21);
  }

}

void __92__WBTabGroupManager_moveTabs_toTabGroup_afterTab_withoutPersistingTabGroupsWithUUIDStrings___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = (void *)a1[6];
  v5 = a2;
  objc_msgSend(v4, "uuid");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_tabWithUUID:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertTabs:afterTab:", v2, v6);

}

- (BOOL)_needsInitialBlankTabInTabGroup:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "firstUnpinnedTab");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "pinnedStartPage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 == 0;

  }
  return v5;
}

- (void)updateTabsInTabGroupWithUUID:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v6;
  id v8;
  void (**v9)(id, void *);
  NSObject *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *devicesByUUID;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSHashTable *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  void *v50;
  void *v51;
  WBTabCollection *tabCollection;
  int v53;
  void *v54;
  void (**v55)(id, void *);
  id v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  WBTabGroupManager *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  void *v80;
  uint8_t v81[128];
  uint8_t buf[4];
  id v83;
  uint64_t v84;

  v6 = a4;
  v84 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v83 = v8;
    _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_INFO, "Updating tabs in tab group with uuid %{public}@", buf, 0xCu);
  }
  os_unfair_lock_lock(&tabGroupsLock);
  -[WBTabGroupManager _tabGroupWithUUID:](self, "_tabGroupWithUUID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    devicesByUUID = self->_devicesByUUID;
    objc_msgSend(v11, "deviceUUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](devicesByUUID, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = v15;
    v16 = objc_msgSend(v15, "isRemoteDevice");
    v17 = v16;
    v55 = v9;
    v56 = v8;
    if ((v16 & 1) == 0)
    {
      v53 = v16;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v18 = (void *)-[NSHashTable copy](self->_observers, "copy");
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v74;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v74 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v12, "uuid");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "tabGroupManager:willPerformBlockUpdatesForTabGroupWithUUID:", self, v24);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
        }
        while (v20);
      }

      v9 = v55;
      v17 = v53;
    }
    if (v9)
      v9[2](v9, v12);
    if ((v6 & 2) == 0
      && -[WBTabGroupManager _needsInitialBlankTabInTabGroup:](self, "_needsInitialBlankTabInTabGroup:", v12))
    {
      objc_msgSend(v12, "deviceIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBTab startPageTabWithDeviceIdentifier:](WBMutableTab, "startPageTabWithDeviceIdentifier:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v80 = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v80, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendTabs:", v27);

      objc_msgSend(v26, "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLastSelectedTabUUID:", v28);

    }
    objc_msgSend(v57, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager _cacheTabGroup:creatorDeviceUUID:](self, "_cacheTabGroup:creatorDeviceUUID:", v12, v29);

    -[WBTabGroupManager _updatePositionsForTabsInTabGroup:](self, "_updatePositionsForTabsInTabGroup:", v12);
    objc_msgSend(v12, "deletedTabs");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager _willFlushDeletedTabs:inTabGroup:](self, "_willFlushDeletedTabs:inTabGroup:", v30, v12);
    os_unfair_lock_unlock(&tabGroupsLock);
    if (v17)
    {
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v31 = self->_cloudTabObservers;
      v32 = -[NSHashTable countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
      if (!v32)
      {
LABEL_53:

        if ((v6 & 1) != 0)
        {
          tabCollection = self->_tabCollection;
          v58[0] = MEMORY[0x24BDAC760];
          v58[1] = 3221225472;
          v58[2] = __69__WBTabGroupManager_updateTabsInTabGroupWithUUID_options_usingBlock___block_invoke;
          v58[3] = &unk_24CB31830;
          v59 = v12;
          v60 = self;
          -[WBTabCollection updateTabsInTabGroup:completionHandler:](tabCollection, "updateTabsInTabGroup:completionHandler:", v59, v58);

        }
        goto LABEL_56;
      }
      v33 = v32;
      v54 = v30;
      v34 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v70 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v12, "profileIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "cloudTabDeviceProvider:didUpdateCloudTabsInProfileWithIdentifier:", self, v37);

          }
        }
        v33 = -[NSHashTable countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
      }
      while (v33);
    }
    else
    {
      v54 = v30;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v39 = (void *)-[NSHashTable copy](self->_observers, "copy");
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v66;
        do
        {
          for (k = 0; k != v41; ++k)
          {
            if (*(_QWORD *)v66 != v42)
              objc_enumerationMutation(v39);
            v44 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v12, "uuid");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "tabGroupManager:didPerformBlockUpdatesForTabGroupWithUUID:", self, v45);

            }
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
        }
        while (v41);
      }

      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v31 = (NSHashTable *)-[NSHashTable copy](self->_observers, "copy");
      v46 = -[NSHashTable countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v62;
        do
        {
          for (m = 0; m != v47; ++m)
          {
            if (*(_QWORD *)v62 != v48)
              objc_enumerationMutation(v31);
            v50 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * m);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v12, "uuid");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "tabGroupManager:didUpdateTabsInTabGroupWithUUID:", self, v51);

            }
          }
          v47 = -[NSHashTable countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
        }
        while (v47);
      }
    }
    v9 = v55;
    v8 = v56;
    v30 = v54;
    goto LABEL_53;
  }
  v38 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v83 = v8;
    _os_log_impl(&dword_211022000, v38, OS_LOG_TYPE_INFO, "Not updating tabs because the tab group with uuid %{public}@ does not exist.", buf, 0xCu);
  }
  os_unfair_lock_unlock(&tabGroupsLock);
LABEL_56:

}

void __69__WBTabGroupManager_updateTabsInTabGroupWithUUID_options_usingBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__WBTabGroupManager_updateTabsInTabGroupWithUUID_options_usingBlock___block_invoke_2;
  v4[3] = &unk_24CB31830;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

void __69__WBTabGroupManager_updateTabsInTabGroupWithUUID_options_usingBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "isNamed") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceUUIDString");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      v4 = objc_msgSend(MEMORY[0x24BE82CC8], "isSafariProfilesEnabled");

      if (v4)
        objc_msgSend(*(id *)(a1 + 40), "_didModifyUnnamedTabGroup:", *(_QWORD *)(a1 + 32));
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isSyncable"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "copy", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 40));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)flushDeletedTabsInTabGroup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  os_unfair_lock_assert_owner(&tabGroupsLock);
  objc_msgSend(v4, "deletedTabs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _willFlushDeletedTabs:inTabGroup:](self, "_willFlushDeletedTabs:inTabGroup:", v5, v4);
  -[WBTabCollection flushDeletedTabsInTabGroup:completionHandler:](self->_tabCollection, "flushDeletedTabsInTabGroup:completionHandler:", v4, 0);

}

- (void)registerPinnedTab:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *localTabsByUUID;
  void *v7;

  v4 = a3;
  os_unfair_lock_lock(&tabGroupsLock);
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  localTabsByUUID = self->_localTabsByUUID;
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](localTabsByUUID, "setObject:forKeyedSubscript:", v5, v7);
  os_unfair_lock_unlock(&tabGroupsLock);
}

- (int)pinnedTabsFolderID
{
  return -[WBTabCollection pinnedTabsFolderID](self->_tabCollection, "pinnedTabsFolderID");
}

- (int)privatePinnedTabsFolderID
{
  return -[WBTabCollection privatePinnedTabsFolderID](self->_tabCollection, "privatePinnedTabsFolderID");
}

- (unint64_t)maximumTabsPerGroup
{
  return -[WBTabCollection maximumTabsPerGroup](self->_tabCollection, "maximumTabsPerGroup");
}

- (void)setMaximumTabsPerGroup:(unint64_t)a3
{
  -[WBTabCollection setMaximumTabsPerGroup:](self->_tabCollection, "setMaximumTabsPerGroup:", a3);
}

- (id)tabsForTabGroup:(id)a3
{
  return -[WBTabCollection tabsForTabGroup:](self->_tabCollection, "tabsForTabGroup:", a3);
}

- (BOOL)isPersistent
{
  return -[WBTabCollection isPersistent](self->_tabCollection, "isPersistent");
}

- (WBBrowserState)lastSessionBrowserState
{
  return -[WBTabCollection lastSessionBrowserState](self->_tabCollection, "lastSessionBrowserState");
}

- (NSArray)windowStates
{
  return -[WBTabCollection windowStates](self->_tabCollection, "windowStates");
}

- (id)windowStateWithUUID:(id)a3
{
  return -[WBTabCollection windowStateWithUUID:](self->_tabCollection, "windowStateWithUUID:", a3);
}

- (id)positionGenerator:(id)a3 positionForRecordName:(id)a4
{
  void *v4;
  void *v5;

  -[WBTabGroupManager _tabWithUUID:](self, "_tabWithUUID:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)positionGenerator:(id)a3 recordNameOfBookmarksBeforeRecordWithName:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[WBTabGroupManager _tabWithUUID:](self, "_tabWithUUID:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabGroupUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _tabGroupWithUUID:](self, "_tabGroupWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "tabs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_objectBefore:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)positionGenerator:(id)a3 recordNameOfBookmarksAfterRecordWithName:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[WBTabGroupManager _tabWithUUID:](self, "_tabWithUUID:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabGroupUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager _tabGroupWithUUID:](self, "_tabGroupWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "tabs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_objectAfter:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)topScopedBookmarkListForTabGroup:(id)a3
{
  WBTabCollection *tabCollection;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  tabCollection = self->_tabCollection;
  v5 = a3;
  os_unfair_lock_lock(&tabGroupsLock);
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBTabGroupManager tabGroupWithUUID:](self, "tabGroupWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&tabGroupsLock);
  -[WBTabCollection topScopedBookmarkListForTabGroup:](tabCollection, "topScopedBookmarkListForTabGroup:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)scopedBookmarkListWithID:(int)a3 filteredUsingString:(id)a4
{
  return -[WBTabCollection scopedBookmarkListWithID:filteredUsingString:](self->_tabCollection, "scopedBookmarkListWithID:filteredUsingString:", *(_QWORD *)&a3, a4);
}

- (void)insertScopedBookmark:(id)a3 inScopedBookmarkFolderWithID:(int)a4 afterBookmarkWithUUID:(id)a5 notify:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  WBTabCollection *tabCollection;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v6 = a6;
  v8 = *(_QWORD *)&a4;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  if (objc_msgSend(v10, "subtype") == 1)
  {
    -[WBTabCollection scopedBookmarkWithUUID:](self->_tabCollection, "scopedBookmarkWithUUID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    tabCollection = self->_tabCollection;
    v24[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(tabCollection) = -[WBTabCollection insertItems:inParentWithID:afterItem:](tabCollection, "insertItems:inParentWithID:afterItem:", v14, v8, v12);

    if ((tabCollection & 1) == 0)
    {
      v15 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[WBTabGroupManager insertScopedBookmark:inScopedBookmarkFolderWithID:afterBookmarkWithUUID:notify:].cold.1(v12, v8, v15);

    }
    if (v6)
      -[WBTabGroupManager _notifyScopedBookmarkChangesInFolderWithID:](self, "_notifyScopedBookmarkChangesInFolderWithID:", v8);

  }
  else
  {
    v16 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[WBTabGroupManager insertScopedBookmark:inScopedBookmarkFolderWithID:afterBookmarkWithUUID:notify:].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
  }

}

- (void)reorderScopedBookmarkWithUUID:(id)a3 afterBookmarkWithUUID:(id)a4 notify:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  int v14;
  _DWORD v15[2];
  __int16 v16;
  int v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  -[WBTabCollection scopedBookmarkWithUUID:](self->_tabCollection, "scopedBookmarkWithUUID:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[WBTabCollection scopedBookmarkWithUUID:](self->_tabCollection, "scopedBookmarkWithUUID:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (!v8 || v10)
    {
      if (!-[WBTabCollection reorderItem:afterItem:](self->_tabCollection, "reorderItem:afterItem:", v9, v10))
      {
        v12 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = objc_msgSend(v9, "identifier");
          if (v11)
            v14 = objc_msgSend(v11, "identifier");
          else
            v14 = -1;
          v15[0] = 67109376;
          v15[1] = v13;
          v16 = 1024;
          v17 = v14;
          _os_log_error_impl(&dword_211022000, v12, OS_LOG_TYPE_ERROR, "Failed to reorder scoped bookmark(%d) behind anchor(%d).", (uint8_t *)v15, 0xEu);
        }

      }
      if (v5)
        -[WBTabGroupManager _notifyScopedBookmarkChangesInFolderWithID:](self, "_notifyScopedBookmarkChangesInFolderWithID:", objc_msgSend(v9, "parentID"));
    }

  }
}

- (void)updateScopedBookmarkWithUUID:(id)a3 title:(id)a4 address:(id)a5 notify:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  -[WBTabCollection scopedBookmarkWithUUID:](self->_tabCollection, "scopedBookmarkWithUUID:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setTitle:", v10);
    objc_msgSend(v13, "setAddress:", v11);
    if (!-[WBTabCollection saveItem:](self->_tabCollection, "saveItem:", v13))
    {
      v14 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[WBTabGroupManager updateScopedBookmarkWithUUID:title:address:notify:].cold.1(v14);
        if (!v6)
          goto LABEL_6;
        goto LABEL_5;
      }
    }
    if (v6)
LABEL_5:
      -[WBTabGroupManager _notifyScopedBookmarkChangesInFolderWithID:](self, "_notifyScopedBookmarkChangesInFolderWithID:", objc_msgSend(v13, "parentID"));
  }
LABEL_6:

}

- (void)deleteScopedBookmarkWithUUID:(id)a3 notify:(BOOL)a4
{
  -[WBTabGroupManager deleteScopedBookmarkWithUUID:notify:completionHandler:](self, "deleteScopedBookmarkWithUUID:notify:completionHandler:", a3, a4, 0);
}

- (void)deleteScopedBookmarkWithUUID:(id)a3 notify:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  void (**v8)(id, _QWORD);
  uint64_t v9;
  void *v10;
  WBTabCollection *tabCollection;
  void *v12;
  BOOL v13;
  NSObject *v14;
  char v15;
  _QWORD v16[2];

  v5 = a4;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, _QWORD))a5;
  -[WBTabCollection scopedBookmarkWithUUID:](self->_tabCollection, "scopedBookmarkWithUUID:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    if (!v8)
      goto LABEL_12;
    goto LABEL_11;
  }
  tabCollection = self->_tabCollection;
  v16[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WBTabCollection deleteItems:leaveTombstones:](tabCollection, "deleteItems:leaveTombstones:", v12, 1);

  if (!v13)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (!v8)
        goto LABEL_6;
      goto LABEL_5;
    }
    -[WBTabGroupManager deleteScopedBookmarkWithUUID:notify:completionHandler:].cold.1(v14);
    if (v8)
LABEL_5:
      v8[2](v8, 0);
  }
LABEL_6:
  if (v5)
    -[WBTabGroupManager _notifyScopedBookmarkChangesInFolderWithID:](self, "_notifyScopedBookmarkChangesInFolderWithID:", objc_msgSend(v10, "parentID"));
  v15 = !v13;
  if (!v8)
    v15 = 1;
  if ((v15 & 1) == 0)
LABEL_11:
    v8[2](v8, 1);
LABEL_12:

}

- (void)_notifyScopedBookmarkChangesInFolderWithID:(int)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;

  -[WBTabCollection scopedBookmarkListWithID:](self->_tabCollection, "scopedBookmarkListWithID:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __64__WBTabGroupManager__notifyScopedBookmarkChangesInFolderWithID___block_invoke;
    v9[3] = &unk_24CB31830;
    v9[4] = self;
    v10 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WBTabGroupManager _notifyScopedBookmarkChangesInFolderWithID:].cold.1(a3, v7, v8);
  }

}

void __64__WBTabGroupManager__notifyScopedBookmarkChangesInFolderWithID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManager:didUpdateScopedBookmarkList:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "tabGroupManagerDidUpdateSyncableContent:", *(_QWORD *)(a1 + 32));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

}

- (id)shareRecordForTabGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isSyncable"))
  {
    -[WBTabCollection shareRecordForTabGroup:](self->_tabCollection, "shareRecordForTabGroup:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)acceptTabGroupShareWithMetadata:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  WBTabGroupManager *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  NSMutableArray *pendingShareAcceptancePairQueue;
  uint64_t v34;
  NSMutableArray *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  WBTabGroupManager *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "safari_supportsSharedTabGroups") & 1) != 0)
  {
    objc_msgSend(v6, "share");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSPair second](self->_currentShareAcceptancePair, "second");
    v10 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "share");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "isEqual:", v13);

    v50 = v10;
    if (v14)
    {
      v15 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        objc_msgSend(v8, "recordID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "zoneID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "ckShortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDB8F58]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDB8F50]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "ownerIdentity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "safari_handle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544131;
        v57 = v17;
        v58 = 2114;
        v59 = v18;
        v60 = 2117;
        v61 = v19;
        v62 = 2117;
        v63 = v21;
        _os_log_impl(&dword_211022000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring accept CloudKit share metadata because it is already being processed, with zone %{public}@, type: %{public}@, title: %{sensitive}@, owner: %{sensitive}@", buf, 0x2Au);

      }
      -[WBTabGroupManager _sendAcceptanceResult:forShareMetadata:toHandler:](v10, "_sendAcceptanceResult:forShareMetadata:toHandler:", 1, v6, v7);
    }
    else
    {
      v47 = v7;
      v49 = v6;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v22 = v10->_pendingShareAcceptancePairQueue;
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v52;
        while (2)
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v52 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v8, "recordID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "second");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "share");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "recordID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v28, "isEqual:", v31);

            if (v32)
            {
              v37 = WBS_LOG_CHANNEL_PREFIXTabGroup();
              v6 = v49;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                v38 = v37;
                objc_msgSend(v8, "recordID");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "zoneID");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "ckShortDescription");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDB8F58]);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDB8F50]);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "ownerIdentity");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "safari_handle");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544131;
                v57 = v40;
                v58 = 2114;
                v59 = v41;
                v60 = 2117;
                v61 = v42;
                v62 = 2117;
                v63 = v44;
                _os_log_impl(&dword_211022000, v38, OS_LOG_TYPE_DEFAULT, "Ignoring accept CloudKit share metadata because it is already pending processing, with zone %{public}@, type: %{public}@, title: %{sensitive}@, owner: %{sensitive}@", buf, 0x2Au);

              }
              v7 = v47;
              -[WBTabGroupManager _sendAcceptanceResult:forShareMetadata:toHandler:](v50, "_sendAcceptanceResult:forShareMetadata:toHandler:", 1, v49, v47);

              goto LABEL_21;
            }
          }
          v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
          if (v24)
            continue;
          break;
        }
      }

      pendingShareAcceptancePairQueue = v50->_pendingShareAcceptancePairQueue;
      if (!pendingShareAcceptancePairQueue)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v50->_pendingShareAcceptancePairQueue;
        v50->_pendingShareAcceptancePairQueue = (NSMutableArray *)v34;

        pendingShareAcceptancePairQueue = v50->_pendingShareAcceptancePairQueue;
      }
      v7 = v47;
      v6 = v49;
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D08]), "initWithFirst:second:", v47, v49);
      -[NSMutableArray addObject:](pendingShareAcceptancePairQueue, "addObject:", v36);

      -[WBTabGroupManager _dequeueNextAcceptCloudKitShareMetadataIfNeeded](v50, "_dequeueNextAcceptCloudKitShareMetadataIfNeeded");
    }
LABEL_21:

  }
  else
  {
    -[WBTabGroupManager _sendAcceptanceResult:forShareMetadata:toHandler:](self, "_sendAcceptanceResult:forShareMetadata:toHandler:", 3, v6, v7);
  }

}

- (void)_dequeueNextAcceptCloudKitShareMetadataIfNeeded
{
  WBSPair **p_currentShareAcceptancePair;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  WBSPair *currentShareAcceptancePair;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  WBTabGroupManager *v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  p_currentShareAcceptancePair = &self->_currentShareAcceptancePair;
  if (!self->_currentShareAcceptancePair)
  {
    -[NSMutableArray firstObject](self->_pendingShareAcceptancePairQueue, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_pendingShareAcceptancePairQueue, "removeObjectAtIndex:", 0);
      objc_storeStrong((id *)p_currentShareAcceptancePair, v4);
      objc_msgSend(v4, "second");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "share");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBTabGroupManager tabGroupMatchingShare:](self, "tabGroupMatchingShare:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          v10 = v8;
          objc_msgSend(v6, "recordID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "zoneID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "ckShortDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDB8F58]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDB8F50]);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "ownerIdentity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "safari_handle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544131;
          v44 = v11;
          v45 = 2114;
          v46 = v12;
          v47 = 2117;
          v48 = v13;
          v49 = 2117;
          v50 = v15;
          _os_log_impl(&dword_211022000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring accept CloudKit share metadata because it was already accepted, with zone %{public}@, type: %{public}@, title: %{sensitive}@, owner: %{sensitive}@", buf, 0x2Au);

        }
        objc_msgSend(v4, "first");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBTabGroupManager _sendAcceptanceResult:forShareMetadata:toHandler:](self, "_sendAcceptanceResult:forShareMetadata:toHandler:", 2, v5, v16);

        currentShareAcceptancePair = self->_currentShareAcceptancePair;
        self->_currentShareAcceptancePair = 0;

        -[WBTabGroupManager _dequeueNextAcceptCloudKitShareMetadataIfNeeded](self, "_dequeueNextAcceptCloudKitShareMetadataIfNeeded");
      }
      else
      {
        if (v9)
        {
          v18 = v8;
          objc_msgSend(v6, "recordID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "zoneID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "ckShortDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDB8F58]);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDB8F50]);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "ownerIdentity");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "safari_handle");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544131;
          v44 = v19;
          v45 = 2114;
          v46 = v20;
          v47 = 2117;
          v48 = v21;
          v49 = 2117;
          v50 = v23;
          _os_log_impl(&dword_211022000, v18, OS_LOG_TYPE_DEFAULT, "Will accept CloudKit Share metadata with zone %{public}@, type: %{public}@, title: %{sensitive}@, owner: %{sensitive}@", buf, 0x2Au);

        }
        v24 = MEMORY[0x24BDAC760];
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __68__WBTabGroupManager__dequeueNextAcceptCloudKitShareMetadataIfNeeded__block_invoke;
        v39[3] = &unk_24CB34E60;
        v25 = v5;
        v40 = v25;
        v41 = self;
        v26 = v4;
        v42 = v26;
        v27 = (void *)MEMORY[0x212BD4C84](v39);
        objc_msgSend(v26, "first");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBTabGroupManager profiles](self, "profiles");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v29, "count") >= 2 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v34[0] = v24;
          v34[1] = 3221225472;
          v34[2] = __68__WBTabGroupManager__dequeueNextAcceptCloudKitShareMetadataIfNeeded__block_invoke_116;
          v34[3] = &unk_24CB34E88;
          v34[4] = self;
          v35 = v6;
          v36 = v28;
          v37 = v25;
          v38 = v27;
          objc_msgSend(v36, "tabGroupManager:selectProfileIdentifierForShareMetadata:completionHandler:", self, v37, v34);

        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v28, "tabGroupManager:didBeginAcceptingTabGroupShareWithMetadata:", self, v25);
          -[WBTabGroupManager _userDidAcceptTabGroupShareWithMetadata:inProfileWithIdentifier:completionHandler:](self, "_userDidAcceptTabGroupShareWithMetadata:inProfileWithIdentifier:completionHandler:", v25, *MEMORY[0x24BE82E70], v27);
        }

      }
    }

  }
}

void __68__WBTabGroupManager__dequeueNextAcceptCloudKitShareMetadataIfNeeded__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v24 = v8;
      objc_msgSend(v5, "recordID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "zoneID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "ckShortDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDB8F58]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDB8F50]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "ownerIdentity");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "safari_handle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safari_privacyPreservingError");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544387;
      v35 = v25;
      v36 = 2114;
      v37 = v26;
      v38 = 2117;
      v39 = v27;
      v40 = 2117;
      v41 = v29;
      v42 = 2114;
      v43 = v30;
      _os_log_error_impl(&dword_211022000, v24, OS_LOG_TYPE_ERROR, "Did fail to accept CloudKit Share metadata with zone %{public}@, type: %{public}@, title: %{sensitive}@, owner: %{sensitive}@, error: %{public}@", buf, 0x34u);

    }
    v10 = a1[4];
    v9 = a1[5];
    objc_msgSend(a1[6], "first");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    v13 = 4;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v8;
      objc_msgSend(v5, "recordID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "zoneID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ckShortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDB8F58]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDB8F50]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "ownerIdentity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "safari_handle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544131;
      v35 = v16;
      v36 = 2114;
      v37 = v17;
      v38 = 2117;
      v39 = v18;
      v40 = 2117;
      v41 = v20;
      _os_log_impl(&dword_211022000, v14, OS_LOG_TYPE_DEFAULT, "Did accept CloudKit Share metadata with zone %{public}@, type: %{public}@, title: %{sensitive}@, owner: %{sensitive}@", buf, 0x2Au);

    }
    v10 = a1[4];
    v21 = a1[5];
    objc_msgSend(a1[6], "first");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    v13 = 0;
  }
  objc_msgSend(v12, "_sendAcceptanceResult:forShareMetadata:toHandler:", v13, v10, v11);

  v22 = a1[5];
  v23 = (void *)v22[22];
  v22[22] = 0;

  objc_msgSend(a1[5], "_dequeueNextAcceptCloudKitShareMetadataIfNeeded");
}

void __68__WBTabGroupManager__dequeueNextAcceptCloudKitShareMetadataIfNeeded__block_invoke_116(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v6 = *(void **)(a1 + 40);
      v7 = v4;
      objc_msgSend(v6, "recordID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "zoneID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ckShortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v3;
      _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "Will accept tab group share with zone %{public}@, in profile with UUID: %{public}@", (uint8_t *)&v13, 0x16u);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 48), "tabGroupManager:didBeginAcceptingTabGroupShareWithMetadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "_userDidAcceptTabGroupShareWithMetadata:inProfileWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 56), v3, *(_QWORD *)(a1 + 64));
  }
  else
  {
    if (v5)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "Did cancel accepting tab group share by cancelling profile selection", (uint8_t *)&v13, 2u);
    }
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 176);
    *(_QWORD *)(v11 + 176) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_dequeueNextAcceptCloudKitShareMetadataIfNeeded");
  }

}

- (void)_sendAcceptanceResult:(int64_t)a3 forShareMetadata:(id)a4 toHandler:(id)a5
{
  id v8;
  id v9;

  v9 = a4;
  v8 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "tabGroupManager:didFinishAcceptingTabGroupShareWithMetadata:result:", self, v9, a3);

}

- (void)_userDidAcceptTabGroupShareWithMetadata:(id)a3 inProfileWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_24CB34ED8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = a4;
  v13 = (void *)MEMORY[0x212BD4C84](v14);
  -[WBTabGroupSyncAgentProtocol userDidAcceptTabGroupShareWithMetadata:inProfileWithIdentifier:completionHandler:](self->_syncAgentProxy, "userDidAcceptTabGroupShareWithMetadata:inProfileWithIdentifier:completionHandler:", v11, v12, v13);

}

void __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_24CB34EB0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v14 = v8;
  v15 = v6;
  v16 = *(id *)(a1 + 48);
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void **v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void **)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 248);
    objc_msgSend(v2, "recordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_tabGroupRootRecordName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tabGroupUUIDForServerID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "length");
    v10 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *v3;
        v13 = v11;
        objc_msgSend(v12, "recordID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "zoneID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ckShortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v16;
        v21 = 2114;
        v22 = v8;
        _os_log_impl(&dword_211022000, v13, OS_LOG_TYPE_DEFAULT, "Did successfully join share %{public}@ with tab group UUID: %{public}@", (uint8_t *)&v19, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "_didReceiveShare:forTabGroupUUID:", *(_QWORD *)(a1 + 32), v8);
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke_2_cold_2((uint64_t)v3, v11);
    }

  }
  else
  {
    v17 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke_2_cold_1(a1, v17);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)beginSharingTabGroupWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WBTabGroupSyncAgentProtocol *syncAgentProxy;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  WBTabGroupManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  syncAgentProxy = self->_syncAgentProxy;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__WBTabGroupManager_beginSharingTabGroupWithUUID_completionHandler___block_invoke;
  v11[3] = &unk_24CB34ED8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  -[WBTabGroupSyncAgentProtocol beginSharingTabGroupWithUUID:completionHandler:](syncAgentProxy, "beginSharingTabGroupWithUUID:completionHandler:", v10, v11);

}

void __68__WBTabGroupManager_beginSharingTabGroupWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__WBTabGroupManager_beginSharingTabGroupWithUUID_completionHandler___block_invoke_2;
  block[3] = &unk_24CB34EB0;
  v13 = v5;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v14 = v7;
  v15 = v8;
  v16 = v6;
  v17 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __68__WBTabGroupManager_beginSharingTabGroupWithUUID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = v4;
      objc_msgSend(v5, "recordID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "zoneID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ckShortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v6;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_DEFAULT, "Did successfully begin sharing tab group with UUID: %{public}@, share: %{public}@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "_didReceiveShare:forTabGroupUUID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __68__WBTabGroupManager_beginSharingTabGroupWithUUID_completionHandler___block_invoke_2_cold_1(a1, v4);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)shareRecordForTabGroup:(id)a3 completionHandler:(id)a4
{
  -[WBTabCollection shareRecordForTabGroup:completionHandler:](self->_tabCollection, "shareRecordForTabGroup:completionHandler:", a3, a4);
}

- (id)tabGroupMatchingShare:(id)a3
{
  WBTabCollection *tabCollection;
  id v5;
  void *v6;
  void *v7;

  tabCollection = self->_tabCollection;
  v5 = a3;
  -[WBTabGroupManager allNamedTabGroupsUnsorted](self, "allNamedTabGroupsUnsorted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabCollection tabGroupMatchingShare:inTabGroups:](tabCollection, "tabGroupMatchingShare:inTabGroups:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)getActiveParticipantsInTabGroup:(id)a3 completionHandler:(id)a4
{
  WBParticipantPresenceCoordinator *presenceCoordinator;
  id v7;
  void *v8;
  void *v9;
  WBTabCollection *tabCollection;
  id v11;
  id v12;

  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    presenceCoordinator = self->_presenceCoordinator;
    v7 = a4;
    objc_msgSend(a3, "bookmark");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serverID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBParticipantPresenceCoordinator getActiveParticipantsInTabGroupWithIdentifier:completionHandler:](presenceCoordinator, "getActiveParticipantsInTabGroupWithIdentifier:completionHandler:", v8, v7);
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBCF20];
    tabCollection = self->_tabCollection;
    v11 = a4;
    -[WBTabCollection activeParticipantsInTabGroup:](tabCollection, "activeParticipantsInTabGroup:", a3);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a4 + 2))(v11, v8);
  }

}

- (void)getPresenceTabUUIDForParticipantIdentifier:(id)a3 inTabGroup:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  WBParticipantPresenceCoordinator *presenceCoordinator;
  void *v11;
  _QWORD v12[4];
  id v13;
  WBTabGroupManager *v14;
  id v15;

  v8 = a4;
  v9 = a5;
  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    presenceCoordinator = self->_presenceCoordinator;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __93__WBTabGroupManager_getPresenceTabUUIDForParticipantIdentifier_inTabGroup_completionHandler___block_invoke;
    v12[3] = &unk_24CB34F00;
    v13 = v8;
    v14 = self;
    v15 = v9;
    -[WBParticipantPresenceCoordinator getCurrentLocationIdentifiersForParticipantIdentifier:completionHandler:](presenceCoordinator, "getCurrentLocationIdentifiersForParticipantIdentifier:completionHandler:", a3, v12);

  }
  else
  {
    -[WBTabCollection presenceTabUUIDForParticipantIdentifier:inTabGroup:](self->_tabCollection, "presenceTabUUIDForParticipantIdentifier:inTabGroup:", a3, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v11);

  }
}

void __93__WBTabGroupManager_getPresenceTabUUIDForParticipantIdentifier_inTabGroup_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "bookmark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = WBSIsEqual();

  v10 = a1[6];
  if ((v9 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[5] + 248), "tabUUIDForServerID:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v10 + 16))(a1[6], 0);
  }

}

- (id)_unsafeTabGroupUUIDsToCKShares
{
  void *v3;

  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    os_unfair_lock_assert_owner(&tabGroupsLock);
    -[NSMutableDictionary safari_mapAndFilterKeysAndObjectsUsingBlock:](self->_syncableTabGroupsByUUID, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_122);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1B8];
  }
  return v3;
}

id __51__WBTabGroupManager__unsafeTabGroupUUIDsToCKShares__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isNamed"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__7;
    v14 = __Block_byref_object_dispose__7;
    v15 = 0;
    objc_msgSend(v5, "bookmark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __51__WBTabGroupManager__unsafeTabGroupUUIDsToCKShares__block_invoke_2;
    v9[3] = &unk_24CB34F68;
    v9[4] = &v10;
    objc_msgSend(v6, "getReadOnlyCachedBookmarkSyncDataUsingBlock:", v9);

    v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __51__WBTabGroupManager__unsafeTabGroupUUIDsToCKShares__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "shareRecord");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __43__WBTabGroupManager__updateTabGroupShares___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "objectForKeyedSubscript:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "containsObject:", v11))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "setObject:forKeyedSubscript:", v5, v11);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "beginCollaborationForShare:", v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "first");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", v11);

      if (v8)
      {
        v9 = *(id **)(a1 + 32);
        objc_msgSend(v9[27], "second");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_movePresenceForParticipantToTabWithUUID:", v10);

      }
    }
  }

}

- (void)_didReceiveShare:(id)a3 forTabGroupUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSDictionary *tabGroupUUIDsToCKShares;
  void *v14;
  NSDictionary *v15;
  NSDictionary *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6 && self->_enableSharedTabGroupsFastSyncPresence)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_tabGroupUUIDsToCKShares, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "recordChangeTag");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordChangeTag");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if ((v12 & 1) == 0)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_broadcastingTabGroupUUIDsToCKShare, "setObject:forKeyedSubscript:", v6, v7);
        -[WBParticipantPresenceCoordinator shareDidUpdate:](self->_presenceCoordinator, "shareDidUpdate:", v6);
      }
    }
    else
    {
      tabGroupUUIDsToCKShares = self->_tabGroupUUIDsToCKShares;
      v20 = v7;
      v21[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary safari_dictionaryByMergingWithDictionary:](tabGroupUUIDsToCKShares, "safari_dictionaryByMergingWithDictionary:", v14);
      v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v16 = self->_tabGroupUUIDsToCKShares;
      self->_tabGroupUUIDsToCKShares = v15;

      if (-[NSCountedSet containsObject:](self->_activeTabGroupUUIDs, "containsObject:", v7))
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_broadcastingTabGroupUUIDsToCKShare, "setObject:forKeyedSubscript:", v6, v7);
        -[WBParticipantPresenceCoordinator beginCollaborationForShare:](self->_presenceCoordinator, "beginCollaborationForShare:", v6);
        -[WBSPair first](self->_activeTabGroupAndTabUUIDPair, "first");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v7);

        if (v18)
        {
          -[WBSPair second](self->_activeTabGroupAndTabUUIDPair, "second");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBTabGroupManager _movePresenceForParticipantToTabWithUUID:](self, "_movePresenceForParticipantToTabWithUUID:", v19);

        }
      }
    }

  }
}

- (void)beginParticipantPresenceReportingForTabGroupWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    v7 = v4;
    -[WBTabGroupManager tabGroupWithUUID:](self, "tabGroupWithUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSCountedSet addObject:](self->_activeTabGroupUUIDs, "addObject:", v7);
      -[WBTabGroupManager _shareRecordIfNeededToBeginCollaborationForTabGroup:](self, "_shareRecordIfNeededToBeginCollaborationForTabGroup:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_broadcastingTabGroupUUIDsToCKShare, "setObject:forKeyedSubscript:", v6, v7);
        -[WBParticipantPresenceCoordinator beginCollaborationForShare:](self->_presenceCoordinator, "beginCollaborationForShare:", v6);
      }

    }
    v4 = v7;
  }

}

- (id)_shareRecordIfNeededToBeginCollaborationForTabGroup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    objc_msgSend(a3, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSCountedSet containsObject:](self->_activeTabGroupUUIDs, "containsObject:", v4)
      && (-[NSMutableDictionary objectForKeyedSubscript:](self->_broadcastingTabGroupUUIDsToCKShare, "objectForKeyedSubscript:", v4), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v5))
    {
      -[NSDictionary objectForKeyedSubscript:](self->_tabGroupUUIDsToCKShares, "objectForKeyedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_broadcastingTabGroupUUIDsToCKShare, "setObject:forKeyedSubscript:", v6, v4);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)endParticipantPresenceReportingForTabGroupWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    v7 = v4;
    -[WBTabGroupManager tabGroupWithUUID:](self, "tabGroupWithUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSCountedSet removeObject:](self->_activeTabGroupUUIDs, "removeObject:", v7);
      -[WBTabGroupManager _shareRecordIfNeededToEndCollaborationForTabGroup:](self, "_shareRecordIfNeededToEndCollaborationForTabGroup:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[WBParticipantPresenceCoordinator endCollaborationForShare:](self->_presenceCoordinator, "endCollaborationForShare:", v6);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_broadcastingTabGroupUUIDsToCKShare, "setObject:forKeyedSubscript:", 0, v7);
      }

    }
    v4 = v7;
  }

}

- (id)_shareRecordIfNeededToEndCollaborationForTabGroup:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    objc_msgSend(a3, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_broadcastingTabGroupUUIDsToCKShare, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (-[NSCountedSet containsObject:](self->_activeTabGroupUUIDs, "containsObject:", v4) & 1) == 0)
      v6 = v5;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)disableDevicePresenceReporting
{
  NSObject *v2;
  uint8_t v3[16];

  --self->_numberOfDevicePresenceReportingRequests;
  -[WBTabGroupManager _endDevicePresenceReportingIfNeeded](self, "_endDevicePresenceReportingIfNeeded");
  v2 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_211022000, v2, OS_LOG_TYPE_DEFAULT, "Did end device presence reporting", v3, 2u);
  }
}

- (void)getCurrentConnectionStateWithCompletionHandler:(id)a3
{
  -[WBParticipantPresenceCoordinator getCurrentConnectionStateWithCompletionHandler:](self->_presenceCoordinator, "getCurrentConnectionStateWithCompletionHandler:", a3);
}

- (void)participantPresenceCoordinator:(id)a3 didUpdateActiveParticipants:(id)a4 inTabGroupWithIdentifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[WBTabCollection tabGroupUUIDForServerID:](self->_tabCollection, "tabGroupUUIDForServerID:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "tabGroupManager:didUpadateActiveParticipants:inTabGroupWithUUID:", self, v7, v8);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)participantPresenceCoordinator:(id)a3 didUpdateActiveParticipants:(id)a4 inTabWithIdentifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[WBTabCollection tabUUIDForServerID:](self->_tabCollection, "tabUUIDForServerID:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "tabGroupManager:didUpadateActiveParticipants:inTabWithUUID:", self, v7, v8);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)shareDidUpdateForTabGroupWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (self->_enableSharedTabGroupsFastSyncPresence)
  {
    v4 = a3;
    -[WBTabGroupManager tabGroupWithUUID:](self, "tabGroupWithUUID:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager shareRecordForTabGroup:](self, "shareRecordForTabGroup:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroupManager _didReceiveShare:forTabGroupUUID:](self, "_didReceiveShare:forTabGroupUUID:", v5, v4);

  }
}

- (void)activeParticipantsDidUpdateInTabGroupWithUUID:(id)a3
{
  id v4;
  WBTabCollection *tabCollection;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_enableSharedTabGroupsFastSyncPresence)
  {
    tabCollection = self->_tabCollection;
    -[WBTabGroupManager tabGroupWithUUID:](self, "tabGroupWithUUID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabCollection activeParticipantsInTabGroup:](tabCollection, "activeParticipantsInTabGroup:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "tabGroupManager:didUpadateActiveParticipants:inTabGroupWithUUID:", self, v14, v4);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
}

- (void)activeParticipantsDidUpdateInTabWithUUID:(id)a3
{
  id v4;
  WBTabCollection *tabCollection;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_enableSharedTabGroupsFastSyncPresence)
  {
    tabCollection = self->_tabCollection;
    -[WBTabGroupManager tabWithUUID:](self, "tabWithUUID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabCollection activeParticipantsInTab:](tabCollection, "activeParticipantsInTab:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "tabGroupManager:didUpadateActiveParticipants:inTabWithUUID:", self, v7, v4);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)_tabGroupSyncDidFinish:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[16];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "Tab group sync did finish", buf, 2u);
  }
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_numberForKey:", CFSTR("syncResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (v9)
  {
    -[WBTabGroupManager syncDidFinishWithResult:](self, "syncDidFinishWithResult:", 0);
  }
  else
  {
    v10 = v8;
    v17 = v4;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v16, "tabGroupManager:didReloadAferSyncWithResult:", self, v10);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v13);
    }

    v4 = v17;
  }

}

- (void)syncDidFinishWithResult:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *internalQueue;
  _QWORD v6[8];

  if (!a3)
  {
    v6[6] = v3;
    v6[7] = v4;
    internalQueue = self->_internalQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__WBTabGroupManager_syncDidFinishWithResult___block_invoke;
    v6[3] = &unk_24CB32360;
    v6[4] = self;
    v6[5] = 0;
    dispatch_async(internalQueue, v6);
  }
}

void __45__WBTabGroupManager_syncDidFinishWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  os_unfair_lock_lock(&reloadAfterSyncLock);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__WBTabGroupManager_syncDidFinishWithResult___block_invoke_2;
  v3[3] = &unk_24CB32360;
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  objc_msgSend(v4, "_reloadProfilesAndTabGroupsAndNotify:withCompletionHandler:", 1, v3);
  objc_msgSend(*(id *)(a1 + 32), "_notifySyncDidFinishedForScopedBookmarks");
  os_unfair_lock_unlock(&reloadAfterSyncLock);
}

void __45__WBTabGroupManager_syncDidFinishWithResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManager:didReloadAferSyncWithResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_notifySyncDidFinishedForScopedBookmarks
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  _QWORD v9[5];

  -[WBTabGroupManager allSyncedTabGroupsExceptRemoteUnnamedTabGroups](self, "allSyncedTabGroupsExceptRemoteUnnamedTabGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__WBTabGroupManager__notifySyncDidFinishedForScopedBookmarks__block_invoke;
  v9[3] = &unk_24CB34FB8;
  v9[4] = self;
  objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __61__WBTabGroupManager__notifySyncDidFinishedForScopedBookmarks__block_invoke_2;
  block[3] = &unk_24CB31830;
  block[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

id __61__WBTabGroupManager__notifySyncDidFinishedForScopedBookmarks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(v3, "isNamed"))
  {
    objc_msgSend(*(id *)(a1 + 32), "topScopedBookmarkListForTabGroup:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __61__WBTabGroupManager__notifySyncDidFinishedForScopedBookmarks__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tabGroupManager:didFinishSyncForScopedBookmarkLists:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)reloadTabGroupsFromDatabaseWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "Reloading tab groups from database", v14, 2u);
  }
  if (self->_tabCollection)
  {
    -[WBTabGroupManager _reloadProfilesAndTabGroupsAndNotify:withCompletionHandler:](self, "_reloadProfilesAndTabGroupsAndNotify:withCompletionHandler:", 1, v4);
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WBTabGroupManager reloadTabGroupsFromDatabaseWithCompletionHandler:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

- (void)_didRemoveProfiles:(id)a3 updateProfiles:(id)a4 previousProfiles:(id)a5 removeTabGroups:(id)a6 updateTabGroups:(id)a7 previousTabGroups:(id)a8
{
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSHashTable *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t n;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t ii;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t jj;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t kk;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t mm;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t nn;
  void *v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id obj;
  id v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  id v113;
  id v114;
  id v115;
  id v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _QWORD v146[2];
  void (*v147)(uint64_t);
  void *v148;
  WBTabGroupManager *v149;
  void *v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _QWORD v175[2];
  void (*v176)(uint64_t);
  void *v177;
  WBTabGroupManager *v178;
  void *v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  uint64_t v202;

  v202 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v106 = a4;
  v94 = a5;
  v99 = a6;
  v101 = a7;
  v117 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v184 = 0u;
  v185 = 0u;
  v186 = 0u;
  v187 = 0u;
  obj = v13;
  v113 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v184, v201, 16);
  if (v113)
  {
    v109 = *(_QWORD *)v185;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v185 != v109)
          objc_enumerationMutation(obj);
        v118 = v14;
        v15 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * v14);
        v180 = 0u;
        v181 = 0u;
        v182 = 0u;
        v183 = 0u;
        v16 = v117;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v180, v200, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v181;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v181 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v15, "identifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "tabGroupManager:didRemoveProfileWithIdentifier:", self, v22);

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v180, v200, 16);
          }
          while (v18);
        }

        -[WBSProfileDataManager didRemoveProfile:](self->_profileDataManager, "didRemoveProfile:", v15);
        v175[0] = MEMORY[0x24BDAC760];
        v175[1] = 3221225472;
        v176 = __122__WBTabGroupManager__didRemoveProfiles_updateProfiles_previousProfiles_removeTabGroups_updateTabGroups_previousTabGroups___block_invoke;
        v177 = &unk_24CB31830;
        v178 = self;
        v179 = v15;
        os_unfair_lock_lock(&profilesLock);
        v176((uint64_t)v175);
        os_unfair_lock_unlock(&profilesLock);
        v14 = v118 + 1;
      }
      while ((id)(v118 + 1) != v113);
      v113 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v184, v201, 16);
    }
    while (v113);
  }

  objc_msgSend(v106, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "differenceFromArray:withOptions:", v23, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v93 = v24;
  if (objc_msgSend(v24, "hasChanges"))
  {
    v173 = 0u;
    v174 = 0u;
    v171 = 0u;
    v172 = 0u;
    v25 = v117;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v171, v199, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v172;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v172 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v30, "tabGroupManagerDidUpdateProfiles:", self);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v171, v199, 16);
      }
      while (v27);
    }

  }
  v31 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(v94, "valueForKey:", CFSTR("identifier"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dictionaryWithObjects:forKeys:", v94, v32);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  v97 = v106;
  v107 = (id)objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v167, v198, 16);
  if (v107)
  {
    v103 = *(_QWORD *)v168;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v168 != v103)
          objc_enumerationMutation(v97);
        v110 = v33;
        v119 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * v33);
        v163 = 0u;
        v164 = 0u;
        v165 = 0u;
        v166 = 0u;
        v114 = v117;
        v34 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v163, v197, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v164;
          do
          {
            for (k = 0; k != v35; ++k)
            {
              if (*(_QWORD *)v164 != v36)
                objc_enumerationMutation(v114);
              v38 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * k);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v119, "identifier");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "identifier");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v105, "objectForKeyedSubscript:", v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "differenceFromProfile:", v41);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "tabGroupManager:didUpdateProfileWithIdentifier:difference:", self, v39, v42);

              }
            }
            v35 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v163, v197, 16);
          }
          while (v35);
        }

        v161 = 0u;
        v162 = 0u;
        v159 = 0u;
        v160 = 0u;
        v43 = self->_cloudTabObservers;
        v44 = -[NSHashTable countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v159, v196, 16);
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v160;
          do
          {
            for (m = 0; m != v45; ++m)
            {
              if (*(_QWORD *)v160 != v46)
                objc_enumerationMutation(v43);
              v48 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * m);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v119, "identifier");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "cloudTabDeviceProvider:didUpdateCloudTabsInProfileWithIdentifier:", self, v49);

              }
            }
            v45 = -[NSHashTable countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v159, v196, 16);
          }
          while (v45);
        }

        v33 = v110 + 1;
      }
      while ((id)(v110 + 1) != v107);
      v107 = (id)objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v167, v198, 16);
    }
    while (v107);
  }

  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v96 = v99;
  v115 = (id)objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v155, v195, 16);
  if (v115)
  {
    v111 = *(_QWORD *)v156;
    do
    {
      v50 = 0;
      do
      {
        if (*(_QWORD *)v156 != v111)
          objc_enumerationMutation(v96);
        v120 = v50;
        v51 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * v50);
        v151 = 0u;
        v152 = 0u;
        v153 = 0u;
        v154 = 0u;
        v52 = v117;
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v151, v194, 16);
        if (v53)
        {
          v54 = v53;
          v55 = *(_QWORD *)v152;
          do
          {
            for (n = 0; n != v54; ++n)
            {
              if (*(_QWORD *)v152 != v55)
                objc_enumerationMutation(v52);
              v57 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * n);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v51, "uuid");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "tabGroupManager:didRemoveTabGroupWithUUID:", self, v58);

              }
            }
            v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v151, v194, 16);
          }
          while (v54);
        }

        v146[0] = MEMORY[0x24BDAC760];
        v146[1] = 3221225472;
        v147 = __122__WBTabGroupManager__didRemoveProfiles_updateProfiles_previousProfiles_removeTabGroups_updateTabGroups_previousTabGroups___block_invoke_2;
        v148 = &unk_24CB31830;
        v149 = self;
        v150 = v51;
        os_unfair_lock_lock(&tabGroupsLock);
        v147((uint64_t)v146);
        os_unfair_lock_unlock(&tabGroupsLock);
        v50 = v120 + 1;
      }
      while ((id)(v120 + 1) != v115);
      v115 = (id)objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v155, v195, 16);
    }
    while (v115);
  }

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v95 = v101;
  v102 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v142, v193, 16);
  if (v102)
  {
    v100 = *(_QWORD *)v143;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v143 != v100)
          objc_enumerationMutation(v95);
        v104 = v59;
        v60 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * v59);
        os_unfair_lock_lock(&tabGroupsLock);
        v116 = v60;
        objc_msgSend(v60, "uuid");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBTabGroupManager _tabGroupWithUUID:](self, "_tabGroupWithUUID:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "tabs");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        os_unfair_lock_unlock(&tabGroupsLock);
        v140 = 0u;
        v141 = 0u;
        v138 = 0u;
        v139 = 0u;
        v108 = v63;
        v121 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v138, v192, 16);
        if (v121)
        {
          v112 = *(_QWORD *)v139;
          do
          {
            for (ii = 0; ii != v121; ++ii)
            {
              if (*(_QWORD *)v139 != v112)
                objc_enumerationMutation(v108);
              v65 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * ii);
              v134 = 0u;
              v135 = 0u;
              v136 = 0u;
              v137 = 0u;
              v66 = v117;
              v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v134, v191, 16);
              if (v67)
              {
                v68 = v67;
                v69 = *(_QWORD *)v135;
                do
                {
                  for (jj = 0; jj != v68; ++jj)
                  {
                    if (*(_QWORD *)v135 != v69)
                      objc_enumerationMutation(v66);
                    v71 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * jj);
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                    {
                      objc_msgSend(v65, "uuid");
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v71, "tabGroupManager:didUpdateTabWithUUID:userDriven:", self, v72, 0);

                    }
                  }
                  v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v134, v191, 16);
                }
                while (v68);
              }

            }
            v121 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v138, v192, 16);
          }
          while (v121);
        }

        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        v73 = v117;
        v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v130, v190, 16);
        if (v74)
        {
          v75 = v74;
          v76 = *(_QWORD *)v131;
          do
          {
            for (kk = 0; kk != v75; ++kk)
            {
              if (*(_QWORD *)v131 != v76)
                objc_enumerationMutation(v73);
              v78 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * kk);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v116, "uuid");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "tabGroupManager:didUpdateTabsInTabGroupWithUUID:", self, v79);

              }
            }
            v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v130, v190, 16);
          }
          while (v75);
        }

        v128 = 0u;
        v129 = 0u;
        v126 = 0u;
        v127 = 0u;
        v80 = v73;
        v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v126, v189, 16);
        if (v81)
        {
          v82 = v81;
          v83 = *(_QWORD *)v127;
          do
          {
            for (mm = 0; mm != v82; ++mm)
            {
              if (*(_QWORD *)v127 != v83)
                objc_enumerationMutation(v80);
              v85 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * mm);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v116, "uuid");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "tabGroupManager:didUpdateTabGroupWithUUID:", self, v86);

              }
            }
            v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v126, v189, 16);
          }
          while (v82);
        }

        v59 = v104 + 1;
      }
      while (v104 + 1 != v102);
      v102 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v142, v193, 16);
    }
    while (v102);
  }

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v87 = v117;
  v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v122, v188, 16);
  if (v88)
  {
    v89 = v88;
    v90 = *(_QWORD *)v123;
    do
    {
      for (nn = 0; nn != v89; ++nn)
      {
        if (*(_QWORD *)v123 != v90)
          objc_enumerationMutation(v87);
        v92 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * nn);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v92, "tabGroupManagerDidUpdateTabGroups:", self);
      }
      v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v122, v188, 16);
    }
    while (v89);
  }

}

void __122__WBTabGroupManager__didRemoveProfiles_updateProfiles_previousProfiles_removeTabGroups_updateTabGroups_previousTabGroups___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", 0, v2);

}

void __122__WBTabGroupManager__didRemoveProfiles_updateProfiles_previousProfiles_removeTabGroups_updateTabGroups_previousTabGroups___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", 0, v2);

}

- (id)tabCollectionDataSummaryLogHidingSensitiveData:(BOOL)a3
{
  return -[WBTabCollection tabCollectionDataSummaryLogHidingSensitiveData:](self->_tabCollection, "tabCollectionDataSummaryLogHidingSensitiveData:", a3);
}

- (BOOL)copyTabsDatabase:(id)a3 hidingSensitiveData:(BOOL)a4 error:(id *)a5
{
  return -[WBTabCollection copyTabsDatabase:hidingSensitiveData:error:](self->_tabCollection, "copyTabsDatabase:hidingSensitiveData:error:", a3, a4, a5);
}

- (WBTabGroupSyncAgentProtocol)syncAgentProxy
{
  return self->_syncAgentProxy;
}

- (BOOL)enableSharedTabGroupsFastSyncPresence
{
  return self->_enableSharedTabGroupsFastSyncPresence;
}

- (BOOL)isBroadcastingPresenceUpdates
{
  return self->_isBroadcastingPresenceUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncAgentProxy, 0);
  objc_storeStrong((id *)&self->_tabCollection, 0);
  objc_storeStrong((id *)&self->_broadcastingTabGroupUUIDsToCKShare, 0);
  objc_storeStrong((id *)&self->_tabGroupUUIDsToCKShares, 0);
  objc_storeStrong((id *)&self->_activeTabGroupAndTabUUIDPair, 0);
  objc_storeStrong((id *)&self->_activeTabGroupUUIDs, 0);
  objc_storeStrong((id *)&self->_presenceCoordinator, 0);
  objc_storeStrong((id *)&self->_pendingShareAcceptancePairQueue, 0);
  objc_storeStrong((id *)&self->_currentShareAcceptancePair, 0);
  objc_storeStrong(&self->_setupCompletionHandler, 0);
  objc_storeStrong((id *)&self->_profileDataManager, 0);
  objc_storeStrong((id *)&self->_insertedItemUUIDsThatWereMissingDuringReload, 0);
  objc_storeStrong((id *)&self->_lastLocalDeviceNameSaved, 0);
  objc_storeStrong((id *)&self->_deviceUUIDByTabGroupUUID, 0);
  objc_storeStrong((id *)&self->_devicesByUUID, 0);
  objc_storeStrong((id *)&self->_removedProfilesByIdentifier, 0);
  objc_storeStrong((id *)&self->_profilesByIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_syncableTabGroupsByUUID, 0);
  objc_storeStrong((id *)&self->_syncableTabsByUUID, 0);
  objc_storeStrong((id *)&self->_localTabGroupsByUUID, 0);
  objc_storeStrong((id *)&self->_localTabsByUUID, 0);
  objc_storeStrong((id *)&self->_removedTabsByUUID, 0);
  objc_storeStrong((id *)&self->_removedTabGroupsByUUID, 0);
  objc_storeStrong((id *)&self->_recentlyAddedTabGroupsAwaitingFirstStartPage, 0);
  objc_storeStrong((id *)&self->_positionGenerator, 0);
  objc_storeStrong((id *)&self->_cloudTabObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __34__WBTabGroupManager__loadDatabase__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Unable to insert default profile in tab collection.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __48__WBTabGroupManager__itemSyncPositionComparator__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_211022000, v3, v4, "Item does not have a sync position %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __48__WBTabGroupManager__itemSyncPositionComparator__block_invoke_cold_3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = OUTLINED_FUNCTION_7(a1);
  objc_msgSend(a2, "privacyPreservingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = a2;
  OUTLINED_FUNCTION_7_0();
  _os_log_fault_impl(&dword_211022000, v3, OS_LOG_TYPE_FAULT, "Items do not have sync positions: %{public}@, %{public}@", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_1_2();
}

- (void)insertScopedBookmark:(os_log_t)log inScopedBookmarkFolderWithID:afterBookmarkWithUUID:notify:.cold.1(void *a1, int a2, os_log_t log)
{
  int v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a1)
    v5 = objc_msgSend(a1, "identifier");
  else
    v5 = -1;
  v6[0] = 67109376;
  v6[1] = a2;
  v7 = 1024;
  v8 = v5;
  _os_log_error_impl(&dword_211022000, log, OS_LOG_TYPE_ERROR, "Failed to insert scoped bookmark into parent(%d) after anchor(%d).", (uint8_t *)v6, 0xEu);
  OUTLINED_FUNCTION_3_0();
}

- (void)insertScopedBookmark:(uint64_t)a3 inScopedBookmarkFolderWithID:(uint64_t)a4 afterBookmarkWithUUID:(uint64_t)a5 notify:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Aborted inserting non-scoped bookmark into a scoped folder.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)updateScopedBookmarkWithUUID:(void *)a1 title:address:notify:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v4[0] = 67109120;
  v4[1] = OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_3_2(&dword_211022000, v1, v3, "Failed to update scoped bookmark(%d).", (uint8_t *)v4);

  OUTLINED_FUNCTION_11_0();
}

- (void)deleteScopedBookmarkWithUUID:(void *)a1 notify:completionHandler:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v4[0] = 67109120;
  v4[1] = OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_3_2(&dword_211022000, v1, v3, "Failed to delete scoped bookmark(%d).", (uint8_t *)v4);

  OUTLINED_FUNCTION_11_0();
}

- (void)_notifyScopedBookmarkChangesInFolderWithID:(uint64_t)a3 .cold.1(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_3_2(&dword_211022000, a2, a3, "Could not load scoped bookmark folder(%d) when notifying changes.", (uint8_t *)v3);
  OUTLINED_FUNCTION_1();
}

void __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 48);
  v4 = a2;
  objc_msgSend(v3, "share");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ckShortDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "safari_privacyPreservingDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138543618;
  v12 = v8;
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9(&dword_211022000, v4, v10, "Failed to join shared tab group %{public}@ with error: %{public}@", (uint8_t *)&v11);

}

void __103__WBTabGroupManager__userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ckShortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_211022000, v6, v7, "tabGroupUUID is nil despite successfully accepting share %{public}@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_1_2();
}

void __68__WBTabGroupManager_beginSharingTabGroupWithUUID_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v3;
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9(&dword_211022000, v2, v6, "Failed to begin sharing tab group with UUID: %{public}@, error: %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_2();
}

- (void)reloadTabGroupsFromDatabaseWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Unable to read tab group changes after sync because the database cannot be opened", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
