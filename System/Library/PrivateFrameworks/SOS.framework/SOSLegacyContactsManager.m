@implementation SOSLegacyContactsManager

- (SOSLegacyContactsManager)init
{
  SOSLegacyContactsManager *v3;
  uint64_t v4;
  FKFriendsManager *friendsManager;
  __CFNotificationCenter *DarwinNotifyCenter;
  SOSLegacyContactsManager *v7;
  objc_super v9;

  if (+[SOSEntitlement currentProcessHasEntitlement:](SOSEntitlement, "currentProcessHasEntitlement:", CFSTR("com.apple.sos.contacts")))
  {
    v9.receiver = self;
    v9.super_class = (Class)SOSLegacyContactsManager;
    v3 = -[SOSLegacyContactsManager init](&v9, sel_init);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0D227F8], "setGroupSize:domain:", 3, CFSTR("com.apple.mobilephone"));
      objc_msgSend(MEMORY[0x1E0D227F8], "setMaxGroupCount:domain:", 2, CFSTR("com.apple.mobilephone"));
      objc_msgSend(MEMORY[0x1E0D227F8], "setFriendsChangedExternallyNotificationName:domain:", CFSTR("SOSFriendsManagerChangedNotification"), CFSTR("com.apple.mobilephone"));
      objc_msgSend(MEMORY[0x1E0D227F8], "managerForDomain:", CFSTR("com.apple.mobilephone"));
      v4 = objc_claimAutoreleasedReturnValue();
      friendsManager = v3->_friendsManager;
      v3->_friendsManager = (FKFriendsManager *)v4;

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_SOSFriendsChangedExternallyHandler, CFSTR("SOSFriendsManagerChangedNotification"), 0, CFNotificationSuspensionBehaviorDrop);
    }
    self = v3;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SOSFriendsManagerChangedNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)SOSLegacyContactsManager;
  -[SOSLegacyContactsManager dealloc](&v4, sel_dealloc);
}

- (id)SOSLegacyContacts
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  v3 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[SOSLegacyContactsManager _SOSFriends](self, "_SOSFriends");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v25;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(obj);
        v19 = v4;
        v5 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v4);
        -[SOSLegacyContactsManager _SOSDestinationsForFriend:](self, "_SOSDestinationsForFriend:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v21 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
              v12 = (void *)objc_opt_new();
              objc_msgSend(v5, "displayName");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setName:", v13);

              -[SOSLegacyContactsManager _SOSFormattedDestinationForFriend:withDestinationNumber:](self, "_SOSFormattedDestinationForFriend:withDestinationNumber:", v5, v11);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setPhoneNumber:", v14);

              objc_msgSend(v3, "addObject:", v12);
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v8);
        }

        v4 = v19 + 1;
      }
      while (v19 + 1 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v18);
  }

  return v3;
}

- (BOOL)SOSLegacyContactsExist
{
  void *v2;
  BOOL v3;

  -[SOSLegacyContactsManager SOSLegacyContacts](self, "SOSLegacyContacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)_SOSFriends
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[FKFriendsManager allPeople](self->_friendsManager, "allPeople");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[FKFriendsManager friendGroups](self->_friendsManager, "friendGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "friends");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)objc_opt_new();
  }
  return v9;
}

uint64_t __39__SOSLegacyContactsManager__SOSFriends__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)SOSLegacyContactsDestinations
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SOSLegacyContactsManager _SOSFriends](self, "_SOSFriends", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[SOSLegacyContactsManager _SOSDestinationsForFriend:](self, "_SOSDestinationsForFriend:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_SOSDestinationsForFriend:(id)a3
{
  return (id)objc_msgSend(a3, "metadataValueForKey:", CFSTR("SOSFriendsDestinationNumbersArrayMetaKey"));
}

- (id)_SOSFormattedDestinationForFriend:(id)a3 withDestinationNumber:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SOSLegacyContactsManager _contactFromFriend:](self, "_contactFromFriend:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "phoneNumbers");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "value", (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "unformattedInternationalStringValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "isEqualToString:", v6))
          {
            objc_msgSend(v13, "value");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "formattedStringValue");
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }

        }
        v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v10 = 0;
  }
  if (!objc_msgSend(v10, "length", (_QWORD)v19))
  {
    v17 = v6;

    v10 = v17;
  }

  return v10;
}

- (id)_contactFromFriend:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "abRecordGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  objc_msgSend((id)objc_opt_class(), "contactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "unifiedContactWithIdentifier:keysToFetch:error:", v3, v5, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  if (v7)
  {

LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (void)contactStoreDidChange
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SOSLegacyContactsChangedNotification"), 0);

}

+ (void)preloadContactStoreIfNecessary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SOSLegacyContactsManager_preloadContactStoreIfNecessary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (preloadContactStoreIfNecessary_once_0 != -1)
    dispatch_once(&preloadContactStoreIfNecessary_once_0, block);
}

void __58__SOSLegacyContactsManager_preloadContactStoreIfNecessary__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  void *v3;
  _QWORD block[5];

  v2 = dispatch_queue_create("com.apple.sos.contactStoreQueue", 0);
  v3 = (void *)__contactStoreQueue_0;
  __contactStoreQueue_0 = (uint64_t)v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SOSLegacyContactsManager_preloadContactStoreIfNecessary__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)__contactStoreQueue_0, block);
}

void __58__SOSLegacyContactsManager_preloadContactStoreIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "authorizedToUseContactStore"))
  {
    objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", 1);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__contactStore_0;
    __contactStore_0 = v1;

  }
}

+ (id)contactStore
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  objc_msgSend(a1, "preloadContactStoreIfNecessary");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SOSLegacyContactsManager_contactStore__block_invoke;
  block[3] = &unk_1E5F75CA8;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)__contactStoreQueue_0, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __40__SOSLegacyContactsManager_contactStore__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)__contactStore_0);
}

+ (BOOL)authorizedToUseContactStore
{
  if (authorizedToUseContactStore_onceToken_0 != -1)
    dispatch_once(&authorizedToUseContactStore_onceToken_0, &__block_literal_global_20);
  return authorizedToUseContactStore_contactStoreAuthorized_0;
}

void __55__SOSLegacyContactsManager_authorizedToUseContactStore__block_invoke()
{
  uint64_t v0;

  v0 = objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0);
  authorizedToUseContactStore_contactStoreAuthorized_0 = v0 == 3;
  if (v0 != 3)
    NSLog(CFSTR("Not authorized to access contact store (authorization status: %ld)"), v0);
}

- (FKFriendsManager)friendsManager
{
  return self->_friendsManager;
}

- (void)setFriendsManager:(id)a3
{
  objc_storeStrong((id *)&self->_friendsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendsManager, 0);
}

@end
