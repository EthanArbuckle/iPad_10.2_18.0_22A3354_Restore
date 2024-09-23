@implementation PLPersonInfoManager

- (PLPersonInfoManager)initWithPathManager:(id)a3 lazyAssetsdClient:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PLPersonInfoManager *v11;
  PLPersonInfoManager *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPersonInfoManager.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPersonInfoManager.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lazyAssetsdClient"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_8;
LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)PLPersonInfoManager;
  v11 = -[PLPersonInfoManager init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_pathManager, a3);
    objc_storeStrong((id *)&v12->_lazyAssetsdClient, a4);
    if ((PLIsAssetsd() & 1) == 0)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v12, (CFNotificationCallback)photosPersonInfoChanged, CFSTR("com.apple.mobileslideshow.PersonInfoChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }

  return v12;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  if ((PLIsAssetsd() & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobileslideshow.PersonInfoChanged"), 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLPersonInfoManager;
  -[PLPersonInfoManager dealloc](&v4, sel_dealloc);
}

- (void)setFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5 email:(id)a6 forPersonID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v16)
  {
    if (v12 || v13 || v14 || v15)
    {
      v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v17 = v19;
      if (v12)
        -[NSObject setObject:forKey:](v19, "setObject:forKey:", v12, PLKPersonInfoFirstNameKey);
      if (v13)
        -[NSObject setObject:forKey:](v17, "setObject:forKey:", v13, PLKPersonInfoLastNameKey);
      if (v14)
        -[NSObject setObject:forKey:](v17, "setObject:forKey:", v14, PLKPersonInfoFullNameKey);
      if (v15)
        -[NSObject setObject:forKey:](v17, "setObject:forKey:", v15, PLKPersonInfoEmailNameKey);
      -[PLPersonInfoManager setPersonInfo:forPersonID:](self, "setPersonInfo:forPersonID:", v17, v16);
    }
    else
    {
      PLPhotoSharingGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = (id)objc_opt_class();
        v18 = v21;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "%@ not updating person info, all fields are nil", (uint8_t *)&v20, 0xCu);

      }
    }

  }
}

- (id)firstNameForPersonID:(id)a3
{
  void *v3;
  void *v4;

  -[PLPersonInfoManager personInfoForPersonID:](self, "personInfoForPersonID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", PLKPersonInfoFirstNameKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lastNameForPersonID:(id)a3
{
  void *v3;
  void *v4;

  -[PLPersonInfoManager personInfoForPersonID:](self, "personInfoForPersonID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", PLKPersonInfoLastNameKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fullNameForPersonID:(id)a3
{
  void *v3;
  void *v4;

  -[PLPersonInfoManager personInfoForPersonID:](self, "personInfoForPersonID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", PLKPersonInfoFullNameKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)emailForPersonID:(id)a3
{
  void *v3;
  void *v4;

  -[PLPersonInfoManager personInfoForPersonID:](self, "personInfoForPersonID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", PLKPersonInfoEmailNameKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setEmails:(id)a3 phones:(id)a4 forInvitationRecordGUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (v9 && (objc_msgSend(v8, "count") || objc_msgSend(v12, "count")))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = v10;
    if (v12)
      objc_msgSend(v10, "setObject:forKey:", v12, PLKInvitationRecordInfoAllEmailsKey);
    if (v8)
      objc_msgSend(v11, "setObject:forKey:", v8, PLKInvitationRecordInfoAllPhonesKey);
    -[PLPersonInfoManager setPersonInfo:forPersonID:](self, "setPersonInfo:forPersonID:", v11, v9);

  }
}

- (void)deleteEmailsAndPhonesForInvitationRecordGUID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99E08];
    v5 = a3;
    v6 = objc_alloc_init(v4);
    -[PLPersonInfoManager setPersonInfo:forPersonID:](self, "setPersonInfo:forPersonID:", v6, v5);

  }
}

- (id)emailsForInvitationRecordGUID:(id)a3
{
  void *v3;
  void *v4;

  -[PLPersonInfoManager personInfoForPersonID:](self, "personInfoForPersonID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", PLKInvitationRecordInfoAllEmailsKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)phonesForInvitationRecordGUID:(id)a3
{
  void *v3;
  void *v4;

  -[PLPersonInfoManager personInfoForPersonID:](self, "personInfoForPersonID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", PLKInvitationRecordInfoAllPhonesKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)assetsdClient
{
  return (id)-[PLLazyObject objectValue](self->_lazyAssetsdClient, "objectValue");
}

- (void)clearCacheForPersonID:(id)a3
{
  id v4;
  PLPersonInfoManager *v5;
  NSObject *v6;
  id v7;
  NSMutableDictionary *personDictsForPersonID;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  PLPhotoSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = (id)objc_opt_class();
    v11 = 2112;
    v12 = v4;
    v7 = v10;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "%@ clearing cache due to photosPersonInfoChanged %@", (uint8_t *)&v9, 0x16u);

  }
  personDictsForPersonID = v5->_personDictsForPersonID;
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](personDictsForPersonID, "removeObjectForKey:", v4);
  }
  else
  {
    v5->_personDictsForPersonID = 0;

  }
  objc_sync_exit(v5);

}

- (id)plistPath
{
  return (id)-[PLPhotoLibraryPathManager photoDirectoryWithType:additionalPathComponents:](self->_pathManager, "photoDirectoryWithType:additionalPathComponents:", 22, CFSTR("cloudSharedPersonInfos.plist"));
}

- (void)_loadDictionariesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *personDictsForPersonID;
  NSObject *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  uint8_t v11[16];

  if (!self->_personDictsForPersonID)
  {
    if (objc_msgSend(MEMORY[0x1E0D732D8], "isEntitledForPhotoKit"))
    {
      v3 = (void *)MEMORY[0x1E0C99D80];
      -[PLPersonInfoManager plistPath](self, "plistPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dictionaryWithContentsOfFile:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (NSMutableDictionary *)objc_msgSend(v5, "mutableCopy");
      personDictsForPersonID = self->_personDictsForPersonID;
      self->_personDictsForPersonID = v6;

    }
    else
    {
      PLPhotoSharingGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Could not read dictionary; missing required entitlement",
          v11,
          2u);
      }

    }
    if (!self->_personDictsForPersonID)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = self->_personDictsForPersonID;
      self->_personDictsForPersonID = v9;

    }
  }
}

- (void)removePersistedInfo
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = (id)objc_opt_class();
    v4 = v8;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "%@ removing persisted person info", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersonInfoManager plistPath](self, "plistPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

}

- (id)personInfoForPersonID:(id)a3
{
  id v4;
  PLPersonInfoManager *v5;
  void *v6;
  PLPersonInfoManager *v7;
  NSMutableDictionary *personDictsForPersonID;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[PLPersonInfoManager _loadDictionariesIfNeeded](v5, "_loadDictionariesIfNeeded");
    -[NSMutableDictionary objectForKey:](v5->_personDictsForPersonID, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

    if (!v6)
    {
      if ((objc_msgSend(MEMORY[0x1E0D732D8], "isEntitledForPhotoKit") & 1) == 0)
      {
        -[PLPersonInfoManager assetsdClient](v5, "assetsdClient");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cloudInternalClient");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0;
        objc_msgSend(v11, "personInfoDictionaryForPersonID:error:", v4, &v14);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v14;

        if (v6)
        {
          v12 = v5;
          objc_sync_enter(v12);
          -[NSMutableDictionary setObject:forKey:](v5->_personDictsForPersonID, "setObject:forKey:", v6, v4);
          objc_sync_exit(v12);
LABEL_12:

          goto LABEL_13;
        }
LABEL_9:
        PLPhotoSharingGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v16 = v4;
          v17 = 2112;
          v18 = v9;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Error getting person info with personID: %@, error: %@", buf, 0x16u);
        }
        v6 = 0;
        goto LABEL_12;
      }
      v7 = v5;
      objc_sync_enter(v7);
      personDictsForPersonID = v5->_personDictsForPersonID;
      v5->_personDictsForPersonID = 0;

      -[PLPersonInfoManager _loadDictionariesIfNeeded](v7, "_loadDictionariesIfNeeded");
      -[NSMutableDictionary objectForKey:](v5->_personDictsForPersonID, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_exit(v7);

      if (!v6)
      {
        v9 = 0;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_13:

  return v6;
}

- (void)setPersonInfo:(id)a3 forPersonID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  PLPersonInfoManager *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSMutableDictionary *personDictsForPersonID;
  PLPersonInfoManager *v16;
  NSObject *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  id v22;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLPhotoSharingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v39 = (id)objc_opt_class();
    v40 = 2112;
    v41 = v7;
    v42 = 2112;
    v43 = v6;
    v9 = v39;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "%@ setPersonInfo %@ %@", buf, 0x20u);

  }
  if (v7)
  {
    v10 = self;
    objc_sync_enter(v10);
    -[PLPersonInfoManager _loadDictionariesIfNeeded](v10, "_loadDictionariesIfNeeded");
    -[NSMutableDictionary objectForKey:](v10->_personDictsForPersonID, "objectForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "isEqualToDictionary:", v6) ^ 1;
      if (v6)
        goto LABEL_6;
    }
    else
    {
      v13 = 1;
      if (v6)
      {
LABEL_6:
        v14 = objc_msgSend(v6, "count");
        personDictsForPersonID = v10->_personDictsForPersonID;
        if (v14)
        {
          -[NSMutableDictionary setObject:forKey:](personDictsForPersonID, "setObject:forKey:", v6, v7);
          goto LABEL_11;
        }
LABEL_10:
        -[NSMutableDictionary removeObjectForKey:](personDictsForPersonID, "removeObjectForKey:", v7);
LABEL_11:

        objc_sync_exit(v10);
        if ((PLIsAssetsd() & 1) == 0)
        {
          -[PLPersonInfoManager assetsdClient](v10, "assetsdClient");
          v16 = (PLPersonInfoManager *)objc_claimAutoreleasedReturnValue();
          -[PLPersonInfoManager cloudInternalClient](v16, "cloudInternalClient");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v6)
            v26 = v6;
          else
            v26 = (id)MEMORY[0x1E0C9AA70];
          objc_msgSend(v24, "setPersonInfoDictionary:forPersonID:", v26, v7);

          goto LABEL_29;
        }
        v16 = v10;
        objc_sync_enter(v16);
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10->_personDictsForPersonID, 100, 0, 0);
          v17 = objc_claimAutoreleasedReturnValue();
          -[PLPersonInfoManager plistPath](v16, "plistPath");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[NSObject writeToFile:options:error:](v17, "writeToFile:options:error:", v18, 1073741825, 0);

          if ((v19 & 1) != 0)
          {
LABEL_14:

            PLPhotoSharingGetLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412290;
              v39 = v21;
              v22 = v21;
              _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "%@ posting photosPersonInfoChanged", buf, 0xCu);

            }
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.PersonInfoChanged"), 0, 0, 0);
            goto LABEL_28;
          }
          v29 = (void *)objc_opt_new();
          -[PLPersonInfoManager plistPath](v16, "plistPath");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringByDeletingLastPathComponent");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 0;
          v32 = objc_msgSend(v29, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v31, 1, 0, &v37);
          v33 = v37;

          if (v32)
          {
            -[PLPersonInfoManager plistPath](v16, "plistPath");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[NSObject writeToFile:options:error:](v17, "writeToFile:options:error:", v34, 1073741825, 0);

            if (v35)
            {

              goto LABEL_14;
            }
          }
          -[PLPersonInfoManager plistPath](v16, "plistPath");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("##### Failed to write personInfo to %@ : %@"), v36, v33);

        }
        else
        {
          PLPhotoSharingGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v27 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v39 = v27;
            v28 = v27;
            _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "%@ skipping posting photosPersonInfoChanged", buf, 0xCu);

          }
        }

LABEL_28:
        objc_sync_exit(v16);
LABEL_29:

        goto LABEL_30;
      }
    }
    personDictsForPersonID = v10->_personDictsForPersonID;
    goto LABEL_10;
  }
LABEL_30:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyAssetsdClient, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_personDictsForPersonID, 0);
}

@end
