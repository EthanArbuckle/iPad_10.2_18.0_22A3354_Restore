@implementation STCoreDataPersistenceSource

- (void)saveCommunicationSafetySettingsForDSID:(id)a3 checkForUnsafePhotos:(BOOL)a4 communicationSafetyNotificationEnabled:(BOOL)a5 communicationSafetyAnalyticsEnabled:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;

  v11 = a3;
  +[STAdminPersistenceController sharedController](STAdminPersistenceController, "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __184__STCoreDataPersistenceSource_saveCommunicationSafetySettingsForDSID_checkForUnsafePhotos_communicationSafetyNotificationEnabled_communicationSafetyAnalyticsEnabled_completionHandler___block_invoke;
  v14[3] = &unk_1E9371370;
  v14[4] = self;
  v15 = v11;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v13 = v11;
  objc_msgSend(v12, "performBackgroundTaskAndWait:", v14);

}

void __184__STCoreDataPersistenceSource_saveCommunicationSafetySettingsForDSID_checkForUnsafePhotos_communicationSafetyNotificationEnabled_communicationSafetyAnalyticsEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_coreUserForIdentifier:inContext:", *(_QWORD *)(a1 + 40), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setIsCommunicationSafetySendingRestricted:", *(unsigned __int8 *)(a1 + 48));
    objc_msgSend(v5, "setIsCommunicationSafetyReceivingRestricted:", *(unsigned __int8 *)(a1 + 48));
    objc_msgSend(v5, "setIsCommunicationSafetyNotificationEnabled:", *(unsigned __int8 *)(a1 + 49));
    objc_msgSend(v5, "setIsCommunicationSafetyAnalyticsEnabled:", *(unsigned __int8 *)(a1 + 50));
    +[STAdminPersistenceController sharedController](STAdminPersistenceController, "sharedController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v7 = objc_msgSend(v6, "saveContext:error:", v3, &v9);
    v8 = v9;

    if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1D22E7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Could not save Communication Safety settings changes. Error: %@", buf, 0xCu);
    }

  }
}

- (id)userDataWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  +[STAdminPersistenceController sharedController](STAdminPersistenceController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__STCoreDataPersistenceSource_userDataWithIdentifier___block_invoke;
  v9[3] = &unk_1E9371398;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "performBackgroundTaskAndWait:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __54__STCoreDataPersistenceSource_userDataWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  STUserData *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  STUserData *v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "_coreUserForIdentifier:inContext:", *(_QWORD *)(a1 + 40), a2);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v3 = [STUserData alloc];
    v19 = *(_QWORD *)(a1 + 40);
    v20 = v3;
    objc_msgSend(v21, "givenName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v21, "isParent");
    objc_msgSend(v21, "localUserDeviceState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "effectivePasscode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") != 0;
    v7 = objc_msgSend(v21, "screenTimeEnabled");
    v8 = objc_msgSend(v21, "syncingEnabled");
    v9 = objc_msgSend(v21, "isCommunicationSafetySendingRestricted");
    v10 = objc_msgSend(v21, "isCommunicationSafetyNotificationEnabled");
    v11 = objc_msgSend(v21, "isCommunicationSafetyAnalyticsEnabled");
    objc_msgSend(v21, "familyMemberType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE3(v16) = v11;
    BYTE2(v16) = v10;
    BYTE1(v16) = v9;
    LOBYTE(v16) = v8;
    v13 = -[STUserData initWithIdentifier:givenName:isParent:isRemote:hasPasscode:screenTimeEnabled:syncingEnabled:checkForUnsafePhotos:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:familyMemberType:](v20, "initWithIdentifier:givenName:isParent:isRemote:hasPasscode:screenTimeEnabled:syncingEnabled:checkForUnsafePhotos:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:familyMemberType:", v19, v18, v17, v4 == 0, v6, v7, v16, v12);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

- (id)_coreUserForIdentifier:(id)a3 inContext:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setNumberStyle:", 1);
  objc_msgSend(v5, "numberFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[STCoreUser fetchRequestForUsersWithDSID:](STCoreUser, "fetchRequestForUsersWithDSID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "execute:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
