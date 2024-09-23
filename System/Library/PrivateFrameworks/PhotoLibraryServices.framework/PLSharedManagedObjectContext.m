@implementation PLSharedManagedObjectContext

- (void)setupLocalChangeNotifications
{
  void *v3;
  void *v4;
  id changeNotificationObserver;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLSharedManagedObjectContext;
  -[PLManagedObjectContext setupLocalChangeNotifications](&v6, sel_setupLocalChangeNotifications);
  if (-[PLSharedManagedObjectContext isUserInterfaceContext](self, "isUserInterfaceContext"))
  {
    if (!self->_changeNotificationObserver)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0C978B0], self, 0, &__block_literal_global_455);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      changeNotificationObserver = self->_changeNotificationObserver;
      self->_changeNotificationObserver = v4;

    }
  }
}

- (BOOL)isUserInterfaceContext
{
  return PLIsAssetsd() ^ 1;
}

- (void)_pl_setupStalenessInterval
{
  -[PLSharedManagedObjectContext setStalenessInterval:](self, "setStalenessInterval:", 4.0);
}

- (BOOL)_hasChangesForCloudShared:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  void *v7;
  char v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v3 = a3;
  pl_dispatch_once();
  v4 = (id)_hasChangesForCloudShared__pl_once_object_44;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__PLSharedManagedObjectContext__hasChangesForCloudShared___block_invoke_2;
  v14[3] = &unk_1E36642D8;
  v15 = v4;
  v5 = v4;
  v6 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v14);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C97870]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = ((uint64_t (**)(_QWORD, void *))v6)[2](v6, v7);

  if ((v8 & 1) != 0
    || (objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A18]),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = ((uint64_t (**)(_QWORD, void *))v6)[2](v6, v9),
        v9,
        (v10 & 1) != 0))
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C97838]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = ((uint64_t (**)(_QWORD, void *))v6)[2](v6, v12);

  }
  return v11;
}

- (BOOL)shouldMergeFromRemoteContextWithChanges:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[PLSharedManagedObjectContext isUserInterfaceContext](self, "isUserInterfaceContext"))
    v5 = -[PLSharedManagedObjectContext _hasChangesForCloudShared:](self, "_hasChangesForCloudShared:", v4);
  else
    v5 = 1;

  return v5;
}

- (void)tearDownLocalChangeNotifications
{
  void *v3;
  void *v4;
  id changeNotificationObserver;
  id v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  changeNotificationObserver = self->_changeNotificationObserver;
  if (changeNotificationObserver)
  {
    objc_msgSend(v3, "removeObserver:name:object:", changeNotificationObserver, *MEMORY[0x1E0C978B0], self);
    v6 = self->_changeNotificationObserver;
    self->_changeNotificationObserver = 0;

    v7.receiver = self;
    v7.super_class = (Class)PLSharedManagedObjectContext;
    -[PLManagedObjectContext tearDownLocalChangeNotifications](&v7, sel_tearDownLocalChangeNotifications);
  }

}

- (void)_mergeChangesFromDidSaveDictionary:(id)a3 usingObjectIDs:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  unsigned int v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  PLSharedManagedObjectContext *v27;
  void *v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  objc_super v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x19AEC1554]();
  if (-[PLSharedManagedObjectContext isUserInterfaceContext](self, "isUserInterfaceContext"))
  {
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)self, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v26 = v4;
      v27 = self;
      v28 = v7;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      +[PLManagedObjectContext changeNotificationObjectIDMutationKeys](PLManagedObjectContext, "changeNotificationObjectIDMutationKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      v10 = 0;
      if (v31)
      {
        v30 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v39 != v30)
              objc_enumerationMutation(obj);
            v12 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v13 = v6;
            objc_msgSend(v6, "objectForKey:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v35;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v35 != v17)
                    objc_enumerationMutation(v14);
                  objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "entity");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v19, "isKindOfEntity:", v9);

                  v10 += v20;
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              }
              while (v16);
            }

            v6 = v13;
          }
          v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v31);
      }

      v21 = -[PLManagedObjectContext _tooManyAssetChangesToHandle:](v27, "_tooManyAssetChangesToHandle:", v10);
      +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v21)
      {
        objc_msgSend(v22, "managedObjectContextWillBeOverloaded:withNotificationData:usingObjectIDs:", v27, v6, v26);

        v33.receiver = v27;
        v33.super_class = (Class)PLSharedManagedObjectContext;
        -[PLManagedObjectContext _mergeChangesFromDidSaveDictionary:usingObjectIDs:](&v33, sel__mergeChangesFromDidSaveDictionary_usingObjectIDs_, v6, v26);
        +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "managedObjectContextWasOverloaded:withNotificationData:usingObjectIDs:", v27, v6, v26);
      }
      else
      {
        objc_msgSend(v22, "managedObjectContext:willProcessRemoteContextSave:usingObjectIDs:isCoalescedEvent:", v27, v6, v26, -[PLChangeHandlingContainer isMergingCoalescedSaveNotification](v27->super._changeHandlingContainer, "isMergingCoalescedSaveNotification"));

        v32.receiver = v27;
        v32.super_class = (Class)PLSharedManagedObjectContext;
        -[PLManagedObjectContext _mergeChangesFromDidSaveDictionary:usingObjectIDs:](&v32, sel__mergeChangesFromDidSaveDictionary_usingObjectIDs_, v6, v26);
        +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "managedObjectContext:didProcessRemoteContextSave:usingObjectIDs:", v27, v6, v26);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "postNotificationName:object:", CFSTR("PLManagedObjectContextFinishedRemoteMergeNotification"), v27);

      v7 = v28;
    }
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)PLSharedManagedObjectContext;
    -[PLManagedObjectContext _mergeChangesFromDidSaveDictionary:usingObjectIDs:](&v32, sel__mergeChangesFromDidSaveDictionary_usingObjectIDs_, v6, v4);
  }
  objc_autoreleasePoolPop(v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeNotificationObserver, 0);
}

void __61__PLSharedManagedObjectContext_setupLocalChangeNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[PLChangeNotificationCenter defaultCenter](PLChangeNotificationCenter, "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processContextDidChangeNotification:", v2);

}

uint64_t __58__PLSharedManagedObjectContext__hasChangesForCloudShared___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "entity", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v10);

        if ((v8 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

void __58__PLSharedManagedObjectContext__hasChangesForCloudShared___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[PLCloudSharedAlbum entityName](PLCloudSharedAlbum, "entityName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PLCloudFeedEntry entityName](PLCloudFeedEntry, "entityName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudFeedAssetsEntry entityName](PLCloudFeedAssetsEntry, "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudFeedCommentsEntry entityName](PLCloudFeedCommentsEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharedComment entityName](PLCloudSharedComment, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharedAlbumInvitationRecord entityName](PLCloudSharedAlbumInvitationRecord, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v0, "initWithObjects:", v8, v1, v2, v3, v4, v5, 0);
  v7 = (void *)_hasChangesForCloudShared__pl_once_object_44;
  _hasChangesForCloudShared__pl_once_object_44 = v6;

}

@end
