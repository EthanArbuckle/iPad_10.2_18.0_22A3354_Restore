@implementation PLPhotoSharingHelper

+ (BOOL)sharedStreamsEnabledForPhotoLibraryURL:(id)a3
{
  int v4;

  v4 = objc_msgSend(MEMORY[0x1E0D73280], "isSystemPhotoLibraryURL:", a3);
  if (v4)
    LOBYTE(v4) = objc_msgSend(a1, "_sharedStreamsEnabled");
  return v4;
}

+ (void)applicationIsInForeground:(BOOL)a3 photoLibraryURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = a4;
  objc_msgSend(a1, "sharingPersonID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend((id)objc_opt_class(), "sharedStreamsEnabledForPhotoLibraryURL:", v5))
  {
    objc_msgSend(a1, "_transactionWithName:", "+[PLPhotoSharingHelper applicationIsInForeground:photoLibraryURL:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    v9 = v7;
    pl_dispatch_async();

  }
}

+ (id)sharingPersonID
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)objc_opt_class(), "_sharedStreamsEnabled") & 1) == 0)
  {
    PLPhotoSharingGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Can't return sharingPersonID because no Apple Account has Photo Sharing enabled", (uint8_t *)&v7, 2u);
    }
    goto LABEL_8;
  }
  +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedPrimaryAppleAccount");
  v3 = objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_8:
    v4 = 0;
    goto LABEL_9;
  }
  -[NSObject aa_personID](v3, "aa_personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, " using sharing person id from Photo Stream account %@", (uint8_t *)&v7, 0xCu);
  }

LABEL_9:
  return v4;
}

+ (BOOL)_sharedStreamsExplicitlyDisabled
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v13;
  NSObject *v14;
  const __CFString *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = _sharedStreamsExplicitlyDisabled;
  if (_sharedStreamsExplicitlyDisabled == -1)
  {
    +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cachedPrimaryAppleAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *MEMORY[0x1E0C8F410];
    v6 = objc_msgSend(v4, "isEnabledForDataclass:", *MEMORY[0x1E0C8F410]);
    v7 = objc_msgSend(v4, "isProvisionedForDataclass:", v5);
    PLPhotoSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "username");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v6)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v17 = 138412802;
      v18 = v9;
      if (v7)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Looking for a Shared Streams account. Found %@ with isEnableForSharedStreams %@ isProvisionedForDataclass %@ ", (uint8_t *)&v17, 0x20u);

    }
    v13 = v7 & v6 ^ 1;
    if (!v4)
      v13 = 0;
    _sharedStreamsExplicitlyDisabled = v13;
    PLPhotoSharingGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      if (_sharedStreamsExplicitlyDisabled)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      v17 = 138412290;
      v18 = (uint64_t)v15;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "sharedStreamsExplicitlyDisabled %@", (uint8_t *)&v17, 0xCu);
    }

    v2 = _sharedStreamsExplicitlyDisabled;
  }
  return v2 != 0;
}

+ (BOOL)_sharedStreamsEnabled
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _PLSharedStreamsEnablementStateObserver *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = _sharedStreamsEnabled;
  if (_sharedStreamsEnabled == -1)
  {
    +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cachedPrimaryAppleAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *MEMORY[0x1E0C8F410];
    v6 = objc_msgSend(v4, "isEnabledForDataclass:", *MEMORY[0x1E0C8F410]);
    v7 = objc_msgSend(v4, "isProvisionedForDataclass:", v5);
    v8 = PLIsEDUMode();
    v9 = PLIsLockdownMode();
    PLPhotoSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "username");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138413314;
      v17 = v11;
      v18 = 1024;
      v19 = v6;
      v20 = 1024;
      v21 = v7;
      v22 = 1024;
      v23 = v8;
      v24 = 1024;
      v25 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Determining if Shared Albums enabled: Found %@ with:\nisEnabledForSharedStreams: %{BOOL}d\nisProvisionedForDataclass: %{BOOL}d\nisEDUMode: %{BOOL}d\nisLockdownMode: %{BOOL}d", (uint8_t *)&v16, 0x24u);

    }
    _sharedStreamsEnabled = v7 & v6 & ~v8 & (v9 ^ 1);
    PLPhotoSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16 = 67109120;
      LODWORD(v17) = _sharedStreamsEnabled;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "sharedStreamsEnabled: %{BOOL}d", (uint8_t *)&v16, 8u);
    }

    if (!_sharedStreamsEnablementStateObserver)
    {
      v13 = objc_alloc_init(_PLSharedStreamsEnablementStateObserver);
      v14 = (void *)_sharedStreamsEnablementStateObserver;
      _sharedStreamsEnablementStateObserver = (uint64_t)v13;

    }
    v2 = _sharedStreamsEnabled;

  }
  return v2 != 0;
}

void __51__PLPhotoSharingHelper__phoneInvitationFailureFile__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoDirectoryWithType:additionalPathComponents:", 22, CFSTR("phoneFailures.plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)_phoneInvitationFailureFile_phoneFailureFile;
  _phoneInvitationFailureFile_phoneFailureFile = v1;

}

void __73__PLPhotoSharingHelper_handlePhoneInvitationFailuresWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 48), "_phoneInvitationFailureFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtPath:error:", v2, 0);

  objc_msgSend(*(id *)(a1 + 32), "stillAlive");
  objc_sync_exit(obj);

}

+ (id)_phoneInvitationFailureFile
{
  pl_dispatch_once();
  return (id)_phoneInvitationFailureFile_phoneFailureFile;
}

void __50__PLPhotoSharingHelper__processPhoneFailuresQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.MobileSlideShow.PLPhotoSharingHelperProcessPhoneFailuresQueue", 0);
  v1 = (void *)_processPhoneFailuresQueue_queue;
  _processPhoneFailuresQueue_queue = (uint64_t)v0;

}

+ (void)handlePhoneInvitationFailuresWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "_transactionWithName:", "+[PLPhotoSharingHelper handlePhoneInvitationFailuresWithCompletionBlock:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_processPhoneFailuresQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v7 = v5;
  v8 = v4;
  pl_dispatch_async();

}

+ (id)_transactionWithName:(const char *)a3
{
  void *v4;

  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)_processPhoneFailuresQueue
{
  pl_dispatch_once();
  return (id)_processPhoneFailuresQueue_queue;
}

+ (BOOL)sharedStreamsExplictlyDisabledForPhotoLibraryURL:(id)a3
{
  int v4;

  v4 = objc_msgSend(MEMORY[0x1E0D73280], "isSystemPhotoLibraryURL:", a3);
  if (v4)
    LOBYTE(v4) = objc_msgSend(a1, "_sharedStreamsExplicitlyDisabled");
  return v4;
}

+ (void)accountSettingsChanged
{
  NSObject *v3;
  uint8_t v4[16];

  PLMyPhotoStreamGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Clearing cached PLPhotoSharingHelper state", v4, 2u);
  }

  __isSharingBreadcrumbDebuggingEnabled = -1;
  _sharedStreamsEnabled = -1;
  _sharedStreamsExplicitlyDisabled = -1;
  objc_msgSend(a1, "_resetServerSideConfigurationDictionary");
}

+ (void)photosPreferencesChanged
{
  __debugDownloadThumbnailsOnly = -1;
  __debugDownloadMetadataOnly = -1;
  __debugDownloadAllDerivatives = -1;
}

+ (void)clearCachedAccountState
{
  void *v3;

  +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearCachedProperties");

  objc_msgSend(a1, "accountSettingsChanged");
}

+ (id)sharingUsername
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "_sharedStreamsEnabled"))
  {
    +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cachedPrimaryAppleAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "aa_formattedUsername");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)sharingFirstName
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "_sharedStreamsEnabled"))
  {
    +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cachedPrimaryAppleAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "aa_firstName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)sharingLastName
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "_sharedStreamsEnabled"))
  {
    +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cachedPrimaryAppleAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "aa_lastName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)sharingDisplayNameIncludingEmail:(BOOL)a3 allowsEmail:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  id v22;

  v4 = a4;
  v5 = a3;
  +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedPrimaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "aa_firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aa_lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userFullName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aa_primaryEmail");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v4)
    v13 = (__CFString *)v11;
  else
    v13 = &stru_1E36789C0;
  v14 = v13;
  if (objc_msgSend(v10, "length"))
  {
    v15 = v10;
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
  {
    v22 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v22, "setGivenName:", v8);
    objc_msgSend(v22, "setFamilyName:", v9);
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v22, 0, 0);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "length"))
  {
    v15 = v8;
LABEL_6:
    v16 = v15;
    if (!v5)
      goto LABEL_9;
LABEL_7:
    if (-[__CFString length](v14, "length"))
    {
      PLServicesLocalizedFrameworkString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PFStringWithValidatedFormat();
      v18 = objc_claimAutoreleasedReturnValue();

      v16 = (__CFString *)v18;
    }
    goto LABEL_9;
  }
  if (!objc_msgSend(v9, "length"))
  {
    v16 = v14;
    goto LABEL_9;
  }
  v16 = v9;
  if (v5)
    goto LABEL_7;
LABEL_9:
  if (v16)
    v19 = v16;
  else
    v19 = &stru_1E36789C0;
  v20 = v19;

  return v20;
}

+ (BOOL)accountMatchesEmail:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "_sharedStreamsEnabled") & 1) != 0)
  {
    +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cachedPrimaryAppleAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aa_primaryEmail");
    v6 = objc_claimAutoreleasedReturnValue();

    if ((-[NSObject isEqualToString:](v6, "isEqualToString:", v3) & 1) != 0)
    {
LABEL_16:
      PLPhotoSharingGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = 1;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v3;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "%@ email matched icloud user email ", buf, 0xCu);
      }
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cachedPrimaryAppleAccount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "aa_appleIDAliases");
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v9);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "isEqualToString:", v3) & 1) != 0)
            {

              goto LABEL_16;
            }
          }
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
          if (v10)
            continue;
          break;
        }
      }
    }

  }
  else
  {
    PLMyPhotoStreamGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Can't return sharingPersonEmailAddress because no Apple Account has Photo Sharing enabled", buf, 2u);
    }
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (void)pollForAlbumListUpdates
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(a1, "sharingPersonID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    PLPhotoSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, " about to call connection refreshResetSync:NO personID:%@ in pollForAlbumListUpdates", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(a1, "sharingPersonID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject refreshResetSync:personID:](v9, "refreshResetSync:personID:", 0, v11);

  }
  else
  {
    PLPhotoSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "no sharingPersonID, skipping polling", (uint8_t *)&v12, 2u);
    }
  }

}

+ (void)pollForAlbumListUpdatesIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kPLSharedAlbumNextPollDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (objc_msgSend(v4, "timeIntervalSinceDate:", v5), v6 > 0.0))
  {
    PLPhotoSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Polling new shared album content", v9, 2u);
    }

    objc_msgSend(a1, "pollForAlbumListUpdates");
    objc_msgSend(v4, "dateByAddingTimeInterval:", (double)objc_msgSend(a1, "_serverLimitValueForKey:withDefaultResult:", CFSTR("com.apple.sharedstreams.config.minIntervalBetweenPollInSeconds"), 864000));
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("kPLSharedAlbumNextPollDate"));
    v5 = (void *)v8;
  }

}

+ (void)retryOutstandingActivities
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(a1, "sharingPersonID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      PLPhotoSharingGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "about to call connection retryOutstandingActivitiesForPersonID:%@", (uint8_t *)&v12, 0xCu);
      }

      -[NSObject retryOutstandingActivitiesForPersonID:](v9, "retryOutstandingActivitiesForPersonID:", v8);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      PLPhotoSharingGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "about to call connection retryOutstandingActivities", (uint8_t *)&v12, 2u);
      }

      -[NSObject retryOutstandingActivities](v9, "retryOutstandingActivities");
    }
  }
  else
  {
    PLPhotoSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "no sharingPersonID, skipping retrying outstanding activities", (uint8_t *)&v12, 2u);
    }
  }

}

+ (void)forgetSharingPersonID:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  PLPhotoSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (__CFString *)objc_opt_class();
    v7 = v6;
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v6;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoSharingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "about to call connection setIsUIForeground:NO personID:%@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(v9, "setIsUIForeground:forPersonID:", 0, v4);
  PLPhotoSharingGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "calling MSASConnection forgetEverythingAboutPersonID %@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(v9, "forgetEverythingAboutPersonID:", v4);
  PLPhotoSharingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = CFSTR("/tmp/_pollStreams.plist");
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "removing %@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeItemAtPath:error:", CFSTR("/tmp/_pollStreams.plist"), 0);

}

+ (void)initializeMSPlatform
{
  pl_dispatch_once();
}

+ (id)_pathToServerConfigurationCache
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoDirectoryWithType:additionalPathComponents:", 22, CFSTR("serverconfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)streamdVideoCache
{
  pl_dispatch_once();
  return (id)streamdVideoCache_cache;
}

+ (void)updateSharedAlbumsCachedServerConfigurationLimits
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = (id)objc_opt_class();
    v4 = v14;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "%@ (server-configuration) updateSharedAlbumsCachedServerConfigurationLimits", buf, 0xCu);

  }
  objc_msgSend(a1, "sharingPersonID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((PLIsAssetsd() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PLPhotoSharingGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "(server-configuration) about to call connection serverSideConfigurationDictionaryForPersonID:%@", buf, 0xCu);
      }

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __73__PLPhotoSharingHelper_updateSharedAlbumsCachedServerConfigurationLimits__block_invoke;
      v10[3] = &unk_1E366E7E0;
      v11 = v5;
      v12 = a1;
      objc_msgSend(v6, "serverSideConfigurationDictionaryForPersonID:completionBlock:", v11, v10);
      v8 = v11;
    }
    else
    {
      +[PLPhotoLibrary cloudSharingPhotoLibrary](PLPhotoLibrary, "cloudSharingPhotoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "assetsdClient");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cloudInternalClient");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateSharedAlbumsCachedServerConfigurationLimits");

    }
  }

}

+ (void)_resetServerSideConfigurationDictionary
{
  void *v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v2 = (void *)_serverSideConfigurationDictionary;
  _serverSideConfigurationDictionary = 0;

  objc_sync_exit(obj);
}

+ (id)serverSideConfigurationDictionary
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t v10[16];

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)_serverSideConfigurationDictionary;
  if (!_serverSideConfigurationDictionary)
  {
    objc_msgSend(v2, "_pathToServerConfigurationCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D732D8], "isEntitledForPhotoKit"))
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v4);
      v6 = (void *)_serverSideConfigurationDictionary;
      _serverSideConfigurationDictionary = v5;

    }
    else
    {
      PLPhotoSharingGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "(server-configuration) ERROR: Unable to read serverconfiguration; missing required entitlement",
          v10,
          2u);
      }

    }
    v3 = (void *)_serverSideConfigurationDictionary;
  }
  v8 = v3;
  objc_sync_exit(v2);

  return v8;
}

+ (int64_t)_serverLimitValueForKey:(id)a3 withDefaultResult:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "serverSideConfigurationDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    a4 = objc_msgSend(v8, "integerValue");
  }
  else
  {
    PLPhotoSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412546;
      v12 = v6;
      v13 = 2048;
      v14 = a4;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "(server-configuration) ERROR: failed to get server limit for %@, returning default value %ld", (uint8_t *)&v11, 0x16u);
    }

    if ((_serverLimitValueForKey_withDefaultResult__hasRequestedServerLimitsAtLeastOnce & 1) == 0)
    {
      objc_msgSend(a1, "updateSharedAlbumsCachedServerConfigurationLimits");
      _serverLimitValueForKey_withDefaultResult__hasRequestedServerLimitsAtLeastOnce = 1;
    }
  }

  return a4;
}

+ (CGSize)videoPosterFrameDimension
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  _BOOL4 v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  objc_msgSend(a1, "serverSideConfigurationDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.sharedstreams.config.dimensions.videoposterframe"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") == 2)
    {
      objc_msgSend(v4, "objectAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "floatValue");
      v7 = v6;

      objc_msgSend(v4, "objectAtIndex:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v10 = v9;

      v11 = v7 > 0.0;
      v12 = v10 > 0.0;
      v13 = v7;
      if (v11 && v12)
        v14 = v10;
      else
        v14 = 720.0;
      if (v11 && v12)
        v15 = v13;
      else
        v15 = 1280.0;
    }
    else
    {
      v15 = 1280.0;
      v14 = 720.0;
    }

  }
  else
  {
    v15 = 1280.0;
    v14 = 720.0;
  }

  v16 = v15;
  v17 = v14;
  result.height = v17;
  result.width = v16;
  return result;
}

+ (int64_t)maxOwnedStreams
{
  return objc_msgSend(a1, "_serverLimitValueForKey:withDefaultResult:", CFSTR("com.apple.sharedstreams.config.maxnum.ownedAlbums"), 100);
}

+ (int64_t)maxSubscribedStreams
{
  return objc_msgSend(a1, "_serverLimitValueForKey:withDefaultResult:", CFSTR("com.apple.sharedstreams.config.maxnum.subscribedAlbums"), 100);
}

+ (int64_t)maxAssetsPerStream
{
  return objc_msgSend(a1, "_serverLimitValueForKey:withDefaultResult:", CFSTR("com.apple.sharedstreams.config.maxnum.photosPerAlbum"), 1000);
}

+ (int64_t)maxSubscribersPerStream
{
  return objc_msgSend(a1, "_serverLimitValueForKey:withDefaultResult:", CFSTR("com.apple.sharedstreams.config.maxnum.subscribersPerAlbum"), 100);
}

+ (int64_t)maxCommentsPerAsset
{
  return objc_msgSend(a1, "_serverLimitValueForKey:withDefaultResult:", CFSTR("com.apple.sharedstreams.config.maxnum.commentsPerPhoto"), 200);
}

+ (int64_t)maxCharactersPerComment
{
  return objc_msgSend(a1, "_serverLimitValueForKey:withDefaultResult:", CFSTR("com.apple.sharedstreams.config.maxnum.charactersPerComment"), 200);
}

+ (int64_t)maxNumDerivativesToDownloadPerPush
{
  return objc_msgSend(a1, "_serverLimitValueForKey:withDefaultResult:", CFSTR("com.apple.sharedstreams.config.maxNumDerivativesToDownloadPerPush"), 30);
}

+ (int64_t)maxNumDerivativesToPrefetchPerDay
{
  return objc_msgSend(a1, "_serverLimitValueForKey:withDefaultResult:", CFSTR("com.apple.sharedstreams.config.maxNumDerivativesToPrefetchPerDay"), 15);
}

+ (int64_t)maxNumThumbnailsToPrefetchPerDay
{
  return objc_msgSend(a1, "_serverLimitValueForKey:withDefaultResult:", CFSTR("com.apple.sharedstreams.config.maxNumThumbnailsToPrefetchPerDay"), 50);
}

+ (int64_t)maxVideoLengthForPublishing
{
  int64_t v2;
  int64_t v3;
  NSObject *v4;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "_serverLimitValueForKey:withDefaultResult:", CFSTR("com.apple.sharedstreams.config.maxVideoDurationInSeconds"), 121);
  v3 = maxVideoLengthForPublishing_debug_max_video_length;
  if (maxVideoLengthForPublishing_debug_max_video_length < 0)
  {
    keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
    maxVideoLengthForPublishing_debug_max_video_length = CFPreferencesGetAppIntegerValue(CFSTR("PLDebugSharedVideoMaxLength"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      PLPhotoSharingGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v8 = maxVideoLengthForPublishing_debug_max_video_length;
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "using PLDebugSharedVideoMaxLength value of %ld", buf, 0xCu);
      }

      v3 = maxVideoLengthForPublishing_debug_max_video_length;
    }
    else
    {
      v3 = 0;
      maxVideoLengthForPublishing_debug_max_video_length = 0;
    }
  }
  if (v3 <= 0)
    return v2;
  else
    return v3;
}

+ (int64_t)maxGIFSizeForPublishing
{
  return objc_msgSend(a1, "_serverLimitValueForKey:withDefaultResult:", CFSTR("com.apple.sharedstreams.config.maxGIFSizeInBytes"), 104857600);
}

+ (BOOL)hasReachedLimitOfOwnedStreamsInLibrary:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "maxOwnedStreams");
  objc_msgSend(v4, "albumListForContentMode:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "albums");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 >= v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v6, "albums", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v10);
          v13 += objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "isOwnedCloudSharedAlbum");
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    v9 = v13 >= v5;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)hasReachedLimitOfSubscribedStreamsInLibrary:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "maxSubscribedStreams");
  objc_msgSend(v4, "albumListForContentMode:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "albums");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 >= v5)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v6, "albums", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EE3B1010))
          {
            if (objc_msgSend(v16, "cloudRelationshipStateValue") == 2 && ++v13 >= v5)
            {
              v9 = 1;
              goto LABEL_15;
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_15:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)canCreateStreamInPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  int64_t v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "sharedStreamsEnabledForPhotoLibraryURL:", v8);

  if ((v9 & 1) != 0)
  {
    if (!objc_msgSend(a1, "hasReachedLimitOfOwnedStreamsInLibrary:", v6))
    {
      v20 = 0;
      v21 = 1;
      if (!a4)
        goto LABEL_7;
      goto LABEL_6;
    }
    PLServicesLocalizedFrameworkString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PLServicesLocalizedFrameworkString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = +[PLPhotoSharingHelper maxOwnedStreams](PLPhotoSharingHelper, "maxOwnedStreams");
    PFStringWithValidatedFormat();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D68];
    v24[0] = *MEMORY[0x1E0CB2D50];
    v24[1] = v14;
    v25[0] = v10;
    v25[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    v17 = 1;
  }
  else
  {
    PLServicesLocalizedFrameworkString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PLServicesLocalizedFrameworkString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D68];
    v26[0] = *MEMORY[0x1E0CB2D50];
    v26[1] = v19;
    v27[0] = v10;
    v27[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
    v17 = 0;
  }
  objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photolibraryservices"), v17, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  if (a4)
LABEL_6:
    *a4 = objc_retainAutorelease(v20);
LABEL_7:

  return v21;
}

+ (BOOL)canAcceptPendingInvitationForAlbum:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int64_t v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "photoLibrary");
  else
    +[PLPhotoLibrary cloudSharingPhotoLibrary](PLPhotoLibrary, "cloudSharingPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PLPhotoSharingHelper hasReachedLimitOfSubscribedStreamsInLibrary:](PLPhotoSharingHelper, "hasReachedLimitOfSubscribedStreamsInLibrary:", v7);
  if (!v8)
  {
    v12 = 0;
    if (!a4)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(v6, "localizedTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    PLServicesLocalizedFrameworkString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PFStringWithValidatedFormat();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLServicesLocalizedFrameworkString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  PLServicesLocalizedFrameworkString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[PLPhotoSharingHelper maxSubscribedStreams](PLPhotoSharingHelper, "maxSubscribedStreams");
  PFStringWithValidatedFormat();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB35C8];
  v16 = *MEMORY[0x1E0CB2D68];
  v20[0] = *MEMORY[0x1E0CB2D50];
  v20[1] = v16;
  v21[0] = v11;
  v21[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photolibraryservices"), 3, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
LABEL_11:
    *a4 = objc_retainAutorelease(v12);
LABEL_12:

  return !v8;
}

+ (BOOL)canSetUserCloudSharedLiked:(BOOL)a3 forAssets:(id)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  unint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *i;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  v6 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (v6)
  {
    v9 = +[PLPhotoSharingHelper maxCommentsPerAsset](PLPhotoSharingHelper, "maxCommentsPerAsset");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v8;
    v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "totalCommentsCount") >= v9)
          {
            objc_msgSend(a1, "_localizationKeyForAssets:", v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CANNOT_LIKE_%@_ERROR_DESCRIPTION"), v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            PLServicesLocalizedFrameworkString();
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CANNOT_LIKE_%@_LIMIT_REACHED_DESCRIPTION"), v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            PLServicesLocalizedFrameworkString();
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = (void *)MEMORY[0x1E0CB35C8];
            v21 = *MEMORY[0x1E0CB2D68];
            v28[0] = *MEMORY[0x1E0CB2D50];
            v28[1] = v21;
            v29[0] = v17;
            v29[1] = v19;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photolibraryservices"), 2, v22);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = 0;
            goto LABEL_13;
          }
        }
        v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        if (v11)
          continue;
        break;
      }
    }
    v14 = 1;
LABEL_13:

    if (a5)
      *a5 = objc_retainAutorelease(v11);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

+ (id)_localizationKeyForAssets:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  BOOL v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "count", 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithSet:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLAssetCountsByType();
  if (v4 == 1)
  {
    v6 = CFSTR("PHOTO");
    v7 = CFSTR("VIDEO");
    v8 = 0;
  }
  else
  {
    v6 = CFSTR("ITEMS");
    v7 = CFSTR("PHOTOS");
    v8 = v4 == 0;
  }
  if (v8)
    return (id)v7;
  else
    return (id)v6;
}

+ (void)updateLocalAlbumMetadataForMSASAlbum:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  const void *CMFItemFromString;
  int IsItemBlocked;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLPhotoSharingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v56 = (id)objc_opt_class();
    v57 = 2112;
    v58 = v6;
    v59 = 2112;
    v60 = v7;
    v9 = v56;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "%@ updateLocalAlbumMetadataForMSASAlbum %@ info %@", buf, 0x20u);

  }
  objc_msgSend(v6, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D16CC0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D16CB0]);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "ownerEmail");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13)
      v16 = v13;
    else
      v16 = (void *)v14;
    v17 = v16;
    if (v17)
    {
      PLPhotoSharingGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v17;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Checking blocked state for inviter %@.", buf, 0xCu);
      }

      CMFItemFromString = (const void *)CreateCMFItemFromString();
      IsItemBlocked = CMFBlockListIsItemBlocked();
      CFRelease(CMFItemFromString);
      PLPhotoSharingGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (IsItemBlocked)
      {
        if (v22)
        {
          *(_DWORD *)buf = 138412290;
          v56 = v17;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Ignoring: Not calling updateSharedAlbumMetadata as inviter %@ is blocked.", buf, 0xCu);
        }
LABEL_52:

        goto LABEL_53;
      }
      if (v22)
      {
        *(_DWORD *)buf = 138412290;
        v56 = v17;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "inviter %@ is not blocked.", buf, 0xCu);
      }

    }
    v50 = v17;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    v21 = v23;
    if (v7)
      -[NSObject setObject:forKey:](v23, "setObject:forKey:", v7, CFSTR("mstreamd-info"));
    objc_msgSend(v6, "GUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v6, "GUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v21, "setObject:forKey:", v25, CFSTR("album-guid"));

    }
    objc_msgSend(v6, "metadata");
    v53 = v15;
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      -[NSObject setObject:forKey:](v21, "setObject:forKey:", v54, CFSTR("album-metadata"));
      -[NSObject setObject:forKey:](v21, "setObject:forKey:", v11, CFSTR("album-name"));
      objc_msgSend(v6, "GUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "writeAlbumNameBreadCrumb:forAlbumGUID:isUpload:", v11, v26, 0);

      objc_msgSend(v54, "objectForKey:", *MEMORY[0x1E0D16CB8]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        v29 = objc_msgSend(v27, "isEqualToString:", CFSTR("1"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v21, "setObject:forKey:", v30, CFSTR("album-isPublic"));

        if ((_DWORD)v29)
        {
          objc_msgSend(v6, "publicURLString");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            -[NSObject setObject:forKey:](v21, "setObject:forKey:", v31, CFSTR("album-publicURLString"));

        }
      }
      objc_msgSend(v54, "objectForKey:", *MEMORY[0x1E0D16CA0]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        v34 = objc_msgSend(v32, "isEqualToString:", CFSTR("1"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v21, "setObject:forKey:", v35, CFSTR("album-allowsMultipleContributors"));

      }
      objc_msgSend(v54, "objectForKey:", *MEMORY[0x1E0D16CA8]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
        -[NSObject setObject:forKey:](v21, "setObject:forKey:", v36, CFSTR("album-creationDate"));

      v15 = v53;
    }
    v51 = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "relationshipState"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v21, "setObject:forKey:", v37, CFSTR("album-relationshipState"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isFamilySharedAlbum"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v21, "setObject:forKey:", v38, CFSTR("album-isFamilySharedAlbum"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v15)
      objc_msgSend(v39, "setObject:forKey:", v15, CFSTR("kPLAlbumOwnerEmailKey"));
    objc_msgSend(v6, "ownerFirstName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      objc_msgSend(v40, "setObject:forKey:", v41, CFSTR("kPLAlbumOwnerFirstNameKey"));
    objc_msgSend(v6, "ownerLastName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
      objc_msgSend(v40, "setObject:forKey:", v42, CFSTR("kPLAlbumOwnerLastNameKey"));
    objc_msgSend(v6, "ownerFullName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
      objc_msgSend(v40, "setObject:forKey:", v43, CFSTR("kPLAlbumOwnerFullNameKey"));
    v52 = v7;
    objc_msgSend(v6, "ownerPersonID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
      objc_msgSend(v40, "setObject:forKey:", v44, CFSTR("kPLAlbumOwnerHashedPersonIDKey"));
    v45 = objc_msgSend(v6, "ownerIsWhitelisted");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKey:", v46, CFSTR("kPLAlbumOwnerIsWhitelistedKey"));

    objc_msgSend(v6, "subscriptionDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
      objc_msgSend(v40, "setObject:forKey:", v47, CFSTR("kPLAlbumOwnerSubscriptionDateKey"));
    if (v40)
      -[NSObject setObject:forKey:](v21, "setObject:forKey:", v40, CFSTR("kPLAlbumOwnerDictionaryKey"));
    if (+[PLPhotoSharingHelper debugAutoAcceptInvitation](PLPhotoSharingHelper, "debugAutoAcceptInvitation"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v21, "setObject:forKey:", v48, CFSTR("album-autoAcceptInvitation"));

    }
    PLPhotoSharingGetLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v21;
      _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_INFO, "about to call updateSharedAlbumMetadata with arguments %@", buf, 0xCu);
    }

    +[PLCloudSharedUpdateAlbumMetadataJob updateAlbumMetadata:](PLCloudSharedUpdateAlbumMetadataJob, "updateAlbumMetadata:", v21);
    v11 = v51;
    v7 = v52;
    v15 = v53;
    v17 = v50;
    goto LABEL_52;
  }
  PLPhotoSharingGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "Ignoring: Not calling updateSharedAlbumMetadata as we don't yet have an album name.", buf, 2u);
  }
LABEL_53:

}

+ (void)resetAllLocalState
{
  NSObject *v2;
  uint8_t v3[16];

  PLPhotoSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_INFO, "will call +[PLCloudSharingResetJob resetAllLocalState]", v3, 2u);
  }

  +[PLCloudSharingResetJob resetAllLocalState](PLCloudSharingResetJob, "resetAllLocalState");
}

+ (void)deleteLocalAlbumsForMSASAlbumsWithGUIDs:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "will call +[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs] with albumGUIDS %@", (uint8_t *)&v5, 0xCu);
  }

  +[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs:](PLCloudSharedDeleteAlbumsJob, "deleteLocalAlbumsForMSASAlbumGUIDs:", v3);
}

+ (void)deleteLocalAlbumsForMSASAlbumsWithGUID:(id)a3 inviterAddress:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PLPhotoSharingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "will call +[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumsWithGUID:inviterAddress] with albumGUID %@ inviterAddress %@", (uint8_t *)&v8, 0x16u);
  }

  +[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumForMSASAlbumGUID:inviterAddress:](PLCloudSharedDeleteAlbumsJob, "deleteLocalAlbumForMSASAlbumGUID:inviterAddress:", v5, v6);
}

+ (void)publishCloudSharedAlbumToServer:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  NSObject *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLPhotoSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    NSStringFromSelector(a2);
    v9 = objc_claimAutoreleasedReturnValue();
    v24 = 138412802;
    v25 = v7;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v24, 0x20u);

  }
  if (objc_msgSend(v5, "kindValue") == 1505)
  {
    objc_msgSend(a1, "sharingPersonID");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D16C50], "album");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudGUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGUID:", v12);

    v13 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v5, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryWithObject:forKey:", v14, *MEMORY[0x1E0D16CC0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMetadata:", v15);

    objc_msgSend(v5, "cloudPublicURLEnabledLocal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v16, "BOOLValue");

    if ((_DWORD)v14)
      objc_msgSend(v11, "setMetadataValue:forKey:", CFSTR("1"), *MEMORY[0x1E0D16CB8]);
    objc_msgSend(v5, "cloudMultipleContributorsEnabledLocal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
      objc_msgSend(v11, "setMetadataValue:forKey:", CFSTR("1"), *MEMORY[0x1E0D16CA0]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMetadataValue:forKey:", v19, *MEMORY[0x1E0D16CA8]);

    PLPhotoSharingGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v24 = 138412546;
      v25 = v11;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_INFO, " about to call connection addAlbum:%@ forPersonID:%@", (uint8_t *)&v24, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAlbum:personID:", v11, v10);
    objc_msgSend(v5, "title");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudGUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "writeAlbumNameBreadCrumb:forAlbumGUID:isUpload:", v22, v23, 1);

  }
  else
  {
    PLPhotoSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v24 = 138412290;
      v25 = v5;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Error, album not a shared album %@", (uint8_t *)&v24, 0xCu);
    }
  }

}

+ (void)_userDidDeleteSharedAlbum:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a3;
  if (PLIsAssetsd())
  {
    objc_msgSend(v5, "uuid");
    v3 = objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "noteUserDidDeleteSharedAlbumWithUUID:", v3);

      v5 = (id)v3;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    +[PLUserActivityDaemonJob userDidDeleteSharedAlbum:](PLUserActivityDaemonJob, "userDidDeleteSharedAlbum:", v5);
  }

}

+ (void)deleteCloudSharedAlbumFromServer:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  NSObject *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLPhotoSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    NSStringFromSelector(a2);
    v9 = objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v7;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v15, 0x20u);

  }
  if (objc_msgSend(v5, "kindValue") == 1505)
  {
    objc_msgSend(a1, "sharingPersonID");
    v10 = objc_claimAutoreleasedReturnValue();
    PLPhotoSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "cloudGUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, " about to call connection deleteAlbumWithGUID:%@ personID:%@", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudGUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deleteAlbumWithGUID:personID:", v14, v10);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(a1, "_userDidDeleteSharedAlbum:", v5);

  }
  else
  {
    PLPhotoSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Error, album not a shared album %@", (uint8_t *)&v15, 0xCu);
    }
  }

}

+ (void)updateCloudSharedAlbumMetadataOnServer:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  NSObject *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLPhotoSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    NSStringFromSelector(a2);
    v9 = objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v7;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v18, 0x20u);

  }
  if (objc_msgSend(v5, "kindValue") == 1505)
  {
    objc_msgSend(a1, "sharingPersonID");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D16C50], "album");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudGUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGUID:", v12);

    v13 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v5, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryWithObject:forKey:", v14, *MEMORY[0x1E0D16CC0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMetadata:", v15);

    PLPhotoSharingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = 138412546;
      v19 = v11;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, " about to call connection modifyAlbumMetadata:%@ personID:%@", (uint8_t *)&v18, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "modifyAlbumMetadata:personID:", v11, v10);

  }
  else
  {
    PLPhotoSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v5;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Error, album not a shared album %@", (uint8_t *)&v18, 0xCu);
    }
  }

}

+ (void)updateCloudSharedAlbumPublicURLStateOnServer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  char v19;
  char v20;
  uint8_t buf[4];
  _BYTE v22[24];
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "cloudGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudPublicURLEnabledLocal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "cloudPublicURLEnabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  PLPhotoSharingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "cloudGUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v22 = v11;
    *(_WORD *)&v22[8] = 2112;
    *(_QWORD *)&v22[10] = v12;
    *(_WORD *)&v22[18] = 1024;
    *(_DWORD *)&v22[20] = v7;
    v23 = 1024;
    v24 = v9;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "updateCloudSharedAlbumPublicURLStateOnServer:(%@ guid %@ requestedEnabledValue %i previousEnabledValue %i)", buf, 0x22u);

  }
  objc_msgSend(a1, "sharingPersonID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoSharingGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v22 = v7;
    *(_WORD *)&v22[4] = 2112;
    *(_QWORD *)&v22[6] = v5;
    *(_WORD *)&v22[14] = 2112;
    *(_QWORD *)&v22[16] = v13;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, " about to call connection setPublicAccessEnabled:%i forAlbumWithGUID:%@ personID:%@", buf, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__PLPhotoSharingHelper_updateCloudSharedAlbumPublicURLStateOnServer___block_invoke;
  v17[3] = &unk_1E366E828;
  v19 = v7;
  v20 = v9;
  v18 = v4;
  v16 = v4;
  objc_msgSend(v15, "setPublicAccessEnabled:forAlbumWithGUID:personID:completionBlock:", v7, v5, v13, v17);

}

+ (void)updateCloudSharedAlbumMultipleContributorsStateOnServer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  char v19;
  char v20;
  uint8_t buf[4];
  _BYTE v22[24];
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "cloudGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudMultipleContributorsEnabledLocal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "cloudMultipleContributorsEnabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  PLPhotoSharingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "cloudGUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v22 = v11;
    *(_WORD *)&v22[8] = 2112;
    *(_QWORD *)&v22[10] = v12;
    *(_WORD *)&v22[18] = 1024;
    *(_DWORD *)&v22[20] = v7;
    v23 = 1024;
    v24 = v9;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "updateCloudSharedAlbumMultipleContributorsStateOnServer:(%@ guid %@ requestedEnabledValue %i previousEnabledValue %i)", buf, 0x22u);

  }
  objc_msgSend(a1, "sharingPersonID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoSharingGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v22 = v7;
    *(_WORD *)&v22[4] = 2112;
    *(_QWORD *)&v22[6] = v5;
    *(_WORD *)&v22[14] = 2112;
    *(_QWORD *)&v22[16] = v13;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, " about to call connection setMultipleContributorsEnabled:%i forAlbumWithGUID:%@ personID:%@", buf, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__PLPhotoSharingHelper_updateCloudSharedAlbumMultipleContributorsStateOnServer___block_invoke;
  v17[3] = &unk_1E366E828;
  v19 = v7;
  v20 = v9;
  v18 = v4;
  v16 = v4;
  objc_msgSend(v15, "setMultipleContributorsEnabled:forAlbumWithGUID:personID:completionBlock:", v7, v5, v13, v17);

}

+ (id)photoSharingOriginalFilenameForAsset:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "originalFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isVideo");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v4, "stringByDeletingPathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("JPG"));
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }

  }
  return v4;
}

+ (BOOL)prepareToEnqueueBatchOfOriginalAssetUUIDs:(id)a3 withBatchCommentText:(id)a4 assetsSharingInfos:(id)a5 customExportsInfo:(id)a6 andTrimmedVideoPathInfo:(id)a7 sharedAlbum:(id)a8 isNewAlbum:(BOOL)a9 error:(id *)a10
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t *v54;
  uint64_t *v55;
  _QWORD *v56;
  id v57;
  BOOL v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _QWORD v69[5];
  id v70;

  v16 = a3;
  v31 = a4;
  v34 = a5;
  v36 = a6;
  v37 = a7;
  v17 = a8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "photoLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pathManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "capabilities");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = __Block_byref_object_copy__61317;
  v69[4] = __Block_byref_object_dispose__61318;
  v70 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__61317;
  v67 = __Block_byref_object_dispose__61318;
  v68 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 1;
  v22 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke;
  v44[3] = &unk_1E366E878;
  v45 = v19;
  v54 = &v63;
  v55 = &v59;
  v46 = v17;
  v58 = a9;
  v33 = v16;
  v47 = v33;
  v32 = v31;
  v48 = v32;
  v35 = v34;
  v49 = v35;
  v23 = v36;
  v50 = v23;
  v24 = v37;
  v51 = v24;
  v57 = a1;
  v25 = v21;
  v52 = v25;
  v53 = v18;
  v56 = v69;
  v38[0] = v22;
  v38[1] = 3221225472;
  v38[2] = __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke_528;
  v38[3] = &unk_1E3675D28;
  v26 = v53;
  v39 = v26;
  v27 = v45;
  v40 = v27;
  v43 = a1;
  v28 = v46;
  v41 = v28;
  v42 = v69;
  objc_msgSend(v27, "performTransactionAndWait:completionHandler:", v44, v38);
  if (a10)
    *a10 = objc_retainAutorelease((id)v64[5]);
  v29 = *((_BYTE *)v60 + 24);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(v69, 8);
  return v29;
}

+ (BOOL)_retrieveURLsFromAssetWithUUID:(id)a3 withExportedFileURL:(id)a4 primaryURL:(id *)a5 videoComplementURL:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  PLPhotoSharingGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v39 = v10;
    v40 = 2114;
    v41 = v9;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Determining URLs to share for exported file URL: %@, asset UUID: \"%{public}@\", buf, 0x16u);
  }

  objc_msgSend(v10, "pathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D75488]))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithBundleAtURL:", v10);
    objc_msgSend(v13, "imagePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "videoPath");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v14)
      v17 = v15 == 0;
    else
      v17 = 1;
    v18 = !v17;
    if (v17)
    {
      v31 = (void *)v15;
      v32 = v14;
      v33 = v9;
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v10, 0, 5, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v35 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "pathExtension");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v27);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        }
        while (v24);
      }

      PLPhotoSharingGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v9 = v33;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v39 = v10;
        v40 = 2114;
        v41 = v29;
        v42 = 2114;
        v43 = v33;
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Failed to determine URLs to share for exported file URL: %@, with path extensions: (%{public}@), asset UUID: \"%{public}@\", buf, 0x20u);

      }
      v16 = v31;
      v14 = v32;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v16);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    *a5 = objc_retainAutorelease(v10);
    v18 = 1;
  }

  return v18;
}

+ (id)_videoComplementURLForSharingFromAsset:(id)a3
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  int v6;
  __CFString *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "uuid");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Determining video complement path to use. UUID: \"%@\", buf, 0xCu);

  }
  v18 = 0;
  v6 = objc_msgSend(v3, "isPlayableVideo:", &v18);
  v7 = (__CFString *)v18;
  if (v6)
  {
    v8 = objc_msgSend(v3, "hasAdjustedVideoComplement");
    PLPhotoSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v8)
        v10 = CFSTR("adjusted");
      else
        v10 = CFSTR("original");
      objc_msgSend(v3, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Using the %@ original video component. UUID: \"%@\", buf, 0x16u);

    }
    if ((v8 & 1) != 0)
      objc_msgSend(v3, "pathForFullsizeRenderVideoFile");
    else
      objc_msgSend(v3, "pathForVideoComplementFile");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLPhotoSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v7;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Falling back to medium, since the original video component is unsupported. Codec: \"%@\", UUID: \"%@\", buf, 0x16u);

    }
    objc_msgSend(v3, "pathForMediumVideoFile");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (void)enqueueCloudSharedAssetsForPublishToServer:(id)a3 inSharedAlbum:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  NSObject *v51;
  int v52;
  id v53;
  double v54;
  double v55;
  NSObject *v56;
  double v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  id v105;
  void *v106;
  id obj;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  CMTime v131;
  CMTime time;
  id v133;
  id v134;
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint8_t v140[128];
  uint8_t buf[4];
  void *v142;
  __int16 v143;
  id v144;
  __int16 v145;
  void *v146;
  __int16 v147;
  id v148;
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLPhotoSharingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", CFSTR("uuid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v142 = v10;
    v143 = 2112;
    v144 = v12;
    v145 = 2112;
    v146 = v13;
    v147 = 2112;
    v148 = v8;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "%@ %@ asset uuids %@ album %@", buf, 0x2Au);

  }
  v96 = a1;
  v97 = v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  obj = v7;
  v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v140, 16);
  v14 = 0;
  if (v118)
  {
    v116 = *(_QWORD *)v137;
    v123 = *MEMORY[0x1E0C99998];
    v121 = *MEMORY[0x1E0D16FC0];
    v119 = *MEMORY[0x1E0D16FC8];
    v120 = *MEMORY[0x1E0D16FD0];
    v115 = *MEMORY[0x1E0D16D18];
    v106 = (void *)*MEMORY[0x1E0CEC5B0];
    v15 = *MEMORY[0x1E0C9D820];
    v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v100 = *MEMORY[0x1E0D16CF8];
    v99 = *MEMORY[0x1E0D16D00];
    v98 = *MEMORY[0x1E0D16D08];
    v110 = *MEMORY[0x1E0D16CE8];
    v109 = *MEMORY[0x1E0D16CE0];
    v108 = *MEMORY[0x1E0D16CF0];
    v104 = *MEMORY[0x1E0D16D20];
    v102 = *MEMORY[0x1E0D16D10];
    do
    {
      for (i = 0; i != v118; ++i)
      {
        if (*(_QWORD *)v137 != v116)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * i);
        v19 = objc_alloc_init(MEMORY[0x1E0D16C70]);
        objc_msgSend(v18, "cloudAssetGUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setGUID:", v20);

        objc_msgSend(v18, "uniformTypeIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setType:", v21);
        objc_msgSend(v18, "pathForOriginalFile");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setPath:", v22);

        if (objc_msgSend(v18, "isVideo"))
          objc_msgSend(v19, "setMediaAssetType:", 4);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v18, "pathForOriginalFile");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fileURLWithPath:isDirectory:", v25, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v135 = 0;
        v127 = v26;
        objc_msgSend(v26, "getResourceValue:forKey:error:", &v135, v123, 0);
        v126 = v135;
        objc_msgSend(v23, "setObject:forKey:");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v18, "width"));
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0CB37E8];
        v29 = objc_msgSend(v18, "height");
        v30 = v28;
        v31 = v27;
        objc_msgSend(v30, "numberWithLongLong:", v29);
        v32 = objc_claimAutoreleasedReturnValue();
        v129 = (void *)v31;
        objc_msgSend(v23, "setObject:forKey:", v31, v120);
        v125 = (void *)v32;
        objc_msgSend(v23, "setObject:forKey:", v32, v119);
        v124 = v23;
        objc_msgSend(v19, "setMetadata:", v23);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "addObject:", v19);
        v33 = objc_alloc_init(MEMORY[0x1E0D16C58]);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v18, "playbackVariation"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKey:", v35, v115);

        objc_msgSend(v18, "mediaGroupUUID");
        v36 = objc_claimAutoreleasedReturnValue();
        v128 = (void *)v36;
        if (objc_msgSend(v18, "isPhotoIris") && v36)
        {
          v113 = v21;
          v114 = v14;
          objc_msgSend(v18, "pathForVideoComplementFile");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "pathExtension");
          v38 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = v34;
          v111 = (void *)v38;
          if (v38)
          {
            +[PLManagedAsset uniformTypeIdentifierFromPathExtension:assetType:](PLManagedAsset, "uniformTypeIdentifierFromPathExtension:assetType:", v38, 1);
            v40 = objc_claimAutoreleasedReturnValue();
            v41 = (void *)v40;
            if (v40)
              v42 = (void *)v40;
            else
              v42 = v39;
            v43 = v42;

            v39 = v43;
          }
          v44 = objc_alloc_init(MEMORY[0x1E0D16C70]);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "UUIDString");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setGUID:", v46);

          v112 = v39;
          objc_msgSend(v44, "setType:", v39);
          objc_msgSend(v18, "pathForVideoComplementFile");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setPath:", v47);

          objc_msgSend(v44, "setMediaAssetType:", 4);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37
            && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
                v49 = (void *)objc_claimAutoreleasedReturnValue(),
                v50 = objc_msgSend(v49, "fileExistsAtPath:", v37),
                v49,
                v50))
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v37, 0);
            v51 = objc_claimAutoreleasedReturnValue();
            v133 = 0;
            v134 = 0;
            v52 = -[NSObject getResourceValue:forKey:error:](v51, "getResourceValue:forKey:error:", &v134, v123, &v133);
            v53 = v134;
            v105 = v133;
            v103 = v53;
            if (v52)
            {
              objc_msgSend(v48, "setObject:forKey:", v53, v121);
              +[PLManagedAsset dimensionsForVideoAtURL:](PLManagedAsset, "dimensionsForVideoAtURL:", v51);
              v55 = v54;
              v56 = v51;
              if (v57 == v15 && v54 == v16)
              {
                v58 = v48;
                PLPhotoSharingGetLog();
                v59 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v142 = v37;
                  _os_log_impl(&dword_199541000, v59, OS_LOG_TYPE_ERROR, "ERROR: Unable to get dimensions for Iris video complement file %@", buf, 0xCu);
                }

              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "setObject:forKey:", v61, v120);

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "setObject:forKey:", v62, v119);

                objc_msgSend(v44, "setMetadata:", v48);
                objc_msgSend(v122, "setObject:forKey:", v128, v100);
                v63 = (void *)MEMORY[0x1E0CB37E8];
                v101 = v48;
                if (v18)
                  objc_msgSend(v18, "photoIrisStillDisplayTime");
                else
                  memset(&time, 0, sizeof(time));
                objc_msgSend(v63, "numberWithDouble:", CMTimeGetSeconds(&time));
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v122, "setObject:forKey:", v64, v99);

                v65 = (void *)MEMORY[0x1E0CB37E8];
                if (v18)
                  objc_msgSend(v18, "photoIrisVideoDuration");
                else
                  memset(&v131, 0, sizeof(v131));
                v58 = v101;
                objc_msgSend(v65, "numberWithDouble:", CMTimeGetSeconds(&v131));
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v122, "setObject:forKey:", v66, v98);

                objc_msgSend(v130, "addObject:", v44);
              }
            }
            else
            {
              v58 = v48;
              PLPhotoSharingGetLog();
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v142 = v37;
                v143 = 2112;
                v144 = v105;
                _os_log_impl(&dword_199541000, v60, OS_LOG_TYPE_ERROR, "ERROR: Unable to get Iris video complement file size for %@: %@", buf, 0x16u);
              }

              v56 = v51;
            }

          }
          else
          {
            v58 = v48;
            PLPhotoSharingGetLog();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v142 = v37;
              _os_log_impl(&dword_199541000, v56, OS_LOG_TYPE_ERROR, "ERROR: Iris video complement file path is nil or does not exist: %@", buf, 0xCu);
            }
          }

          v21 = v113;
          v14 = v114;
          v34 = v122;
        }
        objc_msgSend(v33, "setAssets:", v130);
        objc_msgSend(v18, "cloudAssetGUID");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setGUID:", v67);

        objc_msgSend(v18, "originalFilename");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setFileName:", v68);

        objc_msgSend(v33, "setIsDeletable:", objc_msgSend(v18, "cloudIsDeletable"));
        objc_msgSend(v33, "setIsMine:", objc_msgSend(v18, "cloudIsMyAsset"));
        objc_msgSend(v18, "cloudBatchID");
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        if (v69)
        {
          objc_msgSend(v18, "cloudBatchID");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKey:", v70, v110);

        }
        v71 = v19;
        objc_msgSend(v18, "cloudBatchPublishDate");
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
        {
          objc_msgSend(v18, "cloudBatchPublishDate");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKey:", v73, v109);

        }
        objc_msgSend(v18, "dateCreated");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (v74)
          objc_msgSend(v34, "setObject:forKey:", v74, v108);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v34;
        objc_msgSend(v34, "setObject:forKey:", v75, CFSTR("kPLJustEnqueuedAssetCollectionKey"));

        v77 = v124;
        v78 = v129;
        if (objc_msgSend(v18, "isVideo"))
        {
          v79 = v71;
          v80 = v21;
          v81 = v14;
          objc_msgSend(v18, "duration");
          if (v82 != 0.0)
          {
            +[PLSlalomUtilities durationForManagedAsset:applyVideoAdjustments:](PLSlalomUtilities, "durationForManagedAsset:applyVideoAdjustments:", v18, 1);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "setObject:forKey:", v83, v104);

          }
          objc_msgSend(v18, "location");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = v84;
          if (v84)
          {
            objc_msgSend(v84, "iso6709Notation");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = v86;
            if (v86 && objc_msgSend(v86, "length"))
              objc_msgSend(v76, "setObject:forKey:", v87, v102);

          }
          v14 = v81;
          v21 = v80;
          v77 = v124;
          v71 = v79;
          v78 = v129;
        }
        objc_msgSend(v33, "setMetadata:", v76);
        objc_msgSend(v117, "addObject:", v33);
        objc_msgSend(v18, "locationData");
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        if (v88)
          ++v14;

      }
      v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v140, 16);
    }
    while (v118);
  }

  if (objc_msgSend(v117, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
    v89 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "sharingPersonID");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotoSharingGetLog();
    v91 = objc_claimAutoreleasedReturnValue();
    v92 = v97;
    if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v97, "cloudGUID");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v142 = v117;
      v143 = 2112;
      v144 = v93;
      v145 = 2112;
      v146 = v90;
      _os_log_impl(&dword_199541000, v91, OS_LOG_TYPE_INFO, " about to call connection addAssetCollections:%@ toAlbumWithGUID:%@ personID:%@", buf, 0x20u);

    }
    objc_msgSend(v97, "cloudGUID");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addAssetCollections:toAlbumWithGUID:personID:](v89, "addAssetCollections:toAlbumWithGUID:personID:", v117, v94, v90);

    objc_msgSend(v96, "writeUploadDebugBreadcrumbForAssetCollections:state:error:", v117, 100, 0);
  }
  else
  {
    PLPhotoSharingGetLog();
    v89 = objc_claimAutoreleasedReturnValue();
    v92 = v97;
    if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v89, OS_LOG_TYPE_INFO, " no asset collections to add", buf, 2u);
    }
  }

  if (MEMORY[0x19AEC0FFC]())
  {
    if (v14 >= 1)
    {
      objc_msgSend(v92, "title");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      plslogGreenTea();

    }
    if (PLIsForegroundApplication())
      cpllogGreenTeaTransmittingPhotosOrVideos();
  }

}

+ (void)_userDidDeleteSharedAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "uuid", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v4, "count"))
    {
      +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "noteUserDidDeleteSharedAssetsWithUUIDs:", v4);

    }
  }
  else
  {
    +[PLUserActivityDaemonJob userDidDeleteSharedAssets:](PLUserActivityDaemonJob, "userDidDeleteSharedAssets:", v3);
  }

}

+ (void)deleteCloudSharedAssetsFromServer:(id)a3 inSharedAlbum:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLPhotoSharingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", CFSTR("cloudAssetGUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v30 = v10;
    v31 = 2112;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    v35 = 2112;
    v36 = v8;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "%@ %@ cloudAssetGUIDs %@ album %@", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sharingPersonID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "cloudAssetGUID", (_QWORD)v24);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v19);
  }

  PLPhotoSharingGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v16;
    v31 = 2112;
    v32 = v15;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_INFO, " about to call connection deleteAssetCollectionsWithGUIDs:%@ personID:%@", buf, 0x16u);
  }

  objc_msgSend(v14, "deleteAssetCollectionsWithGUIDs:personID:", v16, v15);
  objc_msgSend(a1, "_userDidDeleteSharedAssets:", v17);

}

+ (BOOL)isCellularConnection
{
  const __SCNetworkReachability *v2;
  const __SCNetworkReachability *v3;
  _BOOL4 v4;
  NSObject *v5;
  const __CFString *v6;
  SCNetworkReachabilityFlags v8;
  const __CFString *v9;
  sockaddr address;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  address = (sockaddr)xmmword_199B9FE50;
  v2 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &address);
  if (v2)
  {
    v3 = v2;
    v8 = 0;
    SCNetworkReachabilityGetFlags(v2, &v8);
    v4 = (~v8 & 0x40002) == 0;
    CFRelease(v3);
  }
  else
  {
    v4 = 1;
  }
  PLPhotoSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("wifi");
    if (v4)
      v6 = CFSTR("celluar");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "Using %@ connection", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

+ (void)requestVideoPlaybackURLForAsset:(id)a3 videoType:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if ((objc_msgSend(v7, "isStreamedVideo") & 1) != 0)
  {
    +[PLPhotoSharingHelper sharingPersonID](PLPhotoSharingHelper, "sharingPersonID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cloudAssetGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotoSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v25 = v10;
      v26 = 2112;
      v27 = v9;
      v28 = 2048;
      v29 = a4;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "about to call connection videoURLForAssetCollectionWithGUID:%@ personID:%@ mediaAssetType:%ld", buf, 0x20u);
    }

    objc_msgSend(v7, "cloudAssetGUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __77__PLPhotoSharingHelper_requestVideoPlaybackURLForAsset_videoType_completion___block_invoke;
    v18[3] = &unk_1E366E8A0;
    v19 = v10;
    v20 = v9;
    v21 = v12;
    v22 = v7;
    v23 = v8;
    v15 = v12;
    v16 = v9;
    v17 = v10;
    -[NSObject videoURLsForAssetCollectionWithGUID:forMediaAssetType:personID:completionBlock:](v11, "videoURLsForAssetCollectionWithGUID:forMediaAssetType:personID:completionBlock:", v14, a4, v16, v18);

  }
  else
  {
    PLPhotoSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v7;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, " requestVideoPlaybackURLForAsset called with a non streamed video asset %@", buf, 0xCu);
    }
  }

}

+ (BOOL)removeCloudSharingDirectories:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoDirectoryWithType:", 22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v7 = objc_msgSend(v5, "removeItemAtPath:error:", v6, &v27);
  v8 = v27;

  v9 = (_QWORD *)MEMORY[0x1E0CB3388];
  v10 = (_QWORD *)MEMORY[0x1E0CB2FE0];
  if ((v7 & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v8, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", *v10))
      v11 = objc_msgSend(v13, "code") == 2;
    else
      v11 = 0;

    if (a3 && !v11)
      *a3 = objc_retainAutorelease(v8);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoDirectoryWithType:", 23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v17 = objc_msgSend(v15, "removeItemAtPath:error:", v16, &v26);
  v18 = v26;

  if ((v17 & 1) == 0)
  {
    objc_msgSend(v18, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", *v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEqualToString:", *v10))
    {
      v22 = objc_msgSend(v20, "code");

      if (v22 == 2)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {

    }
    PLMigrationGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "photoDirectoryWithType:", 23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v24;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Unable to delete %@: %@", buf, 0x16u);

    }
    goto LABEL_18;
  }
LABEL_19:

  return v11;
}

+ (void)sendPendingInvitationsForNewlyCreatedAlbum:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotoSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v6;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(v4, "GUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharingInvitationChangeJob sendServerPendingInvitationsForAlbumWithGUID:](PLCloudSharingInvitationChangeJob, "sendServerPendingInvitationsForAlbumWithGUID:", v9);

}

+ (void)sendPendingInvitationsForAlbum:(id)a3 resendInvitationGUIDs:(id)a4
{
  uint64_t (*v7)(uint64_t, uint64_t);
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  id v18;
  id v19;
  _QWORD v20[4];
  uint64_t (*v21)(uint64_t, uint64_t);
  id v22;
  id v23;
  _BYTE *v24;
  id v25;
  _QWORD v26[4];
  uint64_t (*v27)(uint64_t, uint64_t);
  id v28;
  _BYTE *v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v8 = a4;
  PLPhotoSharingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v31 = v7;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "%@ %@ %@", buf, 0x20u);

  }
  if (v8 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__61317;
  v32 = __Block_byref_object_dispose__61318;
  v33 = 0;
  objc_msgSend(v7, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoSharingHelper sharingPersonID](PLPhotoSharingHelper, "sharingPersonID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __77__PLPhotoSharingHelper_sendPendingInvitationsForAlbum_resendInvitationGUIDs___block_invoke;
  v26[3] = &unk_1E3676EA0;
  v27 = v7;
  v28 = v13;
  v29 = buf;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __77__PLPhotoSharingHelper_sendPendingInvitationsForAlbum_resendInvitationGUIDs___block_invoke_553;
  v20[3] = &unk_1E3675D28;
  v24 = buf;
  v25 = a1;
  v17 = v27;
  v21 = v17;
  v18 = v15;
  v22 = v18;
  v19 = v28;
  v23 = v19;
  objc_msgSend(v14, "performBlockAndWait:completionHandler:", v26, v20);

  _Block_object_dispose(buf, 8);
}

+ (void)removeSubscribers:(id)a3 fromOwnedAlbum:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLPhotoSharingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v29 = v10;
    v30 = 2112;
    v31 = v12;
    v32 = 2112;
    v33 = v7;
    v34 = 2112;
    v35 = v8;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "%@ %@ %@ ownedAlbum:%@", buf, 0x2Au);

  }
  v22 = v8;

  objc_msgSend(a1, "sharingPersonID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "cloudGUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        PLPhotoSharingGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v20;
          v30 = 2112;
          v31 = v13;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_INFO, " about to call connection removeAccessControlEntryWithGUID:%@ personID:%@", buf, 0x16u);
        }

        objc_msgSend(v14, "removeAccessControlEntryWithGUID:personID:", v20, v13);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

}

+ (void)unsubscribeFromAlbum:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLPhotoSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v7;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v16, 0x20u);

  }
  PLPhotoSharingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "cloudGUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sharingPersonID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "about to call connection unsubscribeFromAlbumWithGUID:%@ personID %@", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudGUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sharingPersonID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unsubscribeFromAlbumWithGUID:personID:", v14, v15);

}

+ (void)acceptPendingInvitationForAlbum:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __74__PLPhotoSharingHelper_acceptPendingInvitationForAlbum_completionHandler___block_invoke;
  v30[3] = &unk_1E3677AA0;
  v11 = v7;
  v31 = v11;
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __74__PLPhotoSharingHelper_acceptPendingInvitationForAlbum_completionHandler___block_invoke_2;
  v28[3] = &unk_1E3676CD8;
  v12 = v8;
  v29 = v12;
  objc_msgSend(v9, "performTransaction:completionHandler:", v30, v28);
  PLPhotoSharingGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_opt_class();
    v15 = v14;
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v33 = v14;
    v34 = 2112;
    v35 = v16;
    v36 = 2112;
    v37 = v11;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "%@ %@ %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cloudMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0D16CC8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sharingPersonID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "length");
  PLPhotoSharingGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
  if (v21)
  {
    if (v23)
    {
      *(_DWORD *)buf = 138412546;
      v33 = v19;
      v34 = 2112;
      v35 = v20;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "about to call connection acceptInvitationWithToken:%@ personID:%@", buf, 0x16u);
    }

    v26[0] = v10;
    v26[1] = 3221225472;
    v26[2] = __74__PLPhotoSharingHelper_acceptPendingInvitationForAlbum_completionHandler___block_invoke_554;
    v26[3] = &unk_1E3676858;
    v27 = v12;
    objc_msgSend(v17, "acceptInvitationWithToken:personID:completionBlock:", v19, v20, v26);
    v24 = v27;
  }
  else
  {
    if (v23)
    {
      objc_msgSend(v11, "cloudGUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = v25;
      v34 = 2112;
      v35 = v20;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "about to call connection subscribeToAlbumWithGUID:%@ personID:%@", buf, 0x16u);

    }
    objc_msgSend(v11, "cloudGUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "subscribeToAlbumWithGUID:personID:", v24, v20);
  }

}

+ (void)declinePendingInvitationForAlbum:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "unsubscribeFromAlbum:", v4);
  v5 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v4, "cloudGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PLPhotoSharingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "will call -[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs:albumGUIDs:] with arguments %@", (uint8_t *)&v9, 0xCu);
  }

  +[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs:](PLCloudSharedDeleteAlbumsJob, "deleteLocalAlbumsForMSASAlbumGUIDs:", v7);
}

+ (void)markPendingInvitationAsSpamForAlbum:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  id *v21;
  id *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  void *v28;
  id v29;
  _QWORD v30[4];
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLPhotoSharingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v34 = v10;
    v35 = 2112;
    v36 = v12;
    v37 = 2112;
    v38 = v7;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "%@ %@ %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D16CC8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sharingPersonID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudGUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "length");
  PLPhotoSharingGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v20)
    {
      *(_DWORD *)buf = 138412546;
      v34 = v15;
      v35 = 2112;
      v36 = v16;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "about to call connection markAsSpamInvitationWithToken:%@ personID:%@", buf, 0x16u);
    }

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __78__PLPhotoSharingHelper_markPendingInvitationAsSpamForAlbum_completionHandler___block_invoke;
    v30[3] = &unk_1E3674E40;
    v21 = &v32;
    v22 = &v31;
    v31 = v17;
    v32 = v8;
    v23 = v17;
    v24 = v8;
    objc_msgSend(v13, "markAsSpamInvitationWithToken:personID:completionBlock:", v15, v16, v30);
  }
  else
  {
    if (v20)
    {
      *(_DWORD *)buf = 138412546;
      v34 = v17;
      v35 = 2112;
      v36 = v16;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "about to call connection markAsSpamAlbumWithGUID:%@ personID:%@", buf, 0x16u);
    }

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __78__PLPhotoSharingHelper_markPendingInvitationAsSpamForAlbum_completionHandler___block_invoke_556;
    v27[3] = &unk_1E3674E40;
    v21 = &v29;
    v22 = &v28;
    v28 = v17;
    v29 = v8;
    v25 = v17;
    v26 = v8;
    objc_msgSend(v13, "markAsSpamAlbumWithGUID:personID:completionBlock:", v25, v16, v27);
  }

}

+ (void)refreshSubscriberListForAlbumGUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "sharingPersonID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotoSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v7)
      {
        v8 = 138412546;
        v9 = v4;
        v10 = 2112;
        v11 = v5;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "Refreshing access control list for albumGUID:%@ personID:%@", (uint8_t *)&v8, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject refreshAccessControlListForAlbumWithGUID:personID:](v6, "refreshAccessControlListForAlbumWithGUID:personID:", v4, v5);
    }
    else if (v7)
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "Cannot refresh access control list for albumGUID:%@ as sharing is not enabled", (uint8_t *)&v8, 0xCu);
    }

  }
}

+ (BOOL)hasPhoneInvitationForAlbum:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "cloudMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D16CC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "length") != 0;
  return (char)v3;
}

+ (void)savePhoneInvitationFailuresForPhoneNumber:(id)a3 inAlbum:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_opt_class();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend(a1, "_phoneInvitationFailureFile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if (!v10
    || (objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v8),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "GUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "addObject:", v15);
    objc_msgSend(v11, "setObject:forKey:", v13, v12);
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 100, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "writeToFile:options:error:", v8, 1073741825, 0);

  }
  objc_sync_exit(v7);

}

+ (void)publishCloudSharedCommentToServer:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  NSObject *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLPhotoSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_opt_class();
    v8 = v7;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412802;
    v26 = v7;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v25, 0x20u);

  }
  if (v5)
  {
    objc_msgSend(v5, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cloudAssetGUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D16C60], "comment");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cloudGUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setGUID:](v12, "setGUID:", v13);

      objc_msgSend(v5, "commentDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setTimestamp:](v12, "setTimestamp:", v14);

      objc_msgSend(v5, "isCaption");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setIsCaption:](v12, "setIsCaption:", objc_msgSend(v15, "BOOLValue"));

      objc_msgSend(v5, "isBatchComment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setIsBatchComment:](v12, "setIsBatchComment:", objc_msgSend(v16, "BOOLValue"));

      objc_msgSend(v5, "isLike");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      if (v18)
      {
        -[NSObject setIsLike:](v12, "setIsLike:", 1);
      }
      else
      {
        objc_msgSend(v5, "commentText");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setContent:](v12, "setContent:", v19);

      }
      objc_msgSend(v5, "isMyComment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setIsMine:](v12, "setIsMine:", objc_msgSend(v20, "BOOLValue"));

      -[NSObject setIsDeletable:](v12, "setIsDeletable:", 1);
      objc_msgSend(a1, "sharingPersonID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PLPhotoSharingGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v25 = 138412802;
        v26 = v12;
        v27 = 2112;
        v28 = v11;
        v29 = 2112;
        v30 = v21;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_INFO, "about to call connection addComments:%@ toAssetCollectionWithGUID:%@ personID:%@", (uint8_t *)&v25, 0x20u);
      }

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addComments:toAssetCollectionWithGUID:personID:", v24, v11, v21);

    }
    else
    {
      PLPhotoSharingGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "ERROR: couldn't find asset cloud GUID for comment, skipping comment deletion on server", (uint8_t *)&v25, 2u);
      }
    }

  }
}

+ (void)deleteCommentWithGUIDFromServer:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLPhotoSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v7;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v13, 0x20u);

  }
  if (v5)
  {
    objc_msgSend(a1, "sharingPersonID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotoSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "about to call connection deleteCommentWithGUID:%@ personID:%@", (uint8_t *)&v13, 0x16u);
    }

    objc_msgSend(v11, "deleteCommentWithGUID:personID:", v5, v10);
  }

}

+ (id)videoDerivativesForAssetCollection:(id)a3 withSpecifications:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  int v25;
  int v26;
  __CFString *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  double v35;
  double v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  char v53;
  id v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  char v67;
  id v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  id v81;
  id v82;
  int v83;
  id v84;
  id v85;
  id v86;
  __CFString *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  _QWORD v94[4];
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  NSObject *v101;
  id v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint8_t buf[4];
  id v109;
  __int16 v110;
  id v111;
  __int16 v112;
  id v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLPhotoSharingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v109 = v6;
    v110 = 2112;
    v111 = v7;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "videoDerivativesForAssetCollection %@ with specifications %@", buf, 0x16u);
  }

  objc_msgSend(v6, "GUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v106 = 0u;
    v107 = 0u;
    v105 = 0u;
    v104 = 0u;
    objc_msgSend(v6, "assets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v105;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v105 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
          if (objc_msgSend(v16, "isVideo"))
          {
            objc_msgSend(v16, "path");
            v17 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v17;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    +[PLPhotoSharingHelper temporaryVideoPathForCollectionGUID:](PLPhotoSharingHelper, "temporaryVideoPathForCollectionGUID:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0;
    v23 = objc_msgSend(v21, "copyItemAtURL:toURL:error:", v22, v20, &v103);
    v91 = v103;

    if ((v23 & 1) == 0)
    {
      PLPhotoSharingGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v109 = v13;
        v110 = 2112;
        v111 = v19;
        v112 = 2112;
        v113 = v91;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "could not copy %@ to %@ error %@", buf, 0x20u);
      }

    }
    if ((objc_msgSend(v21, "fileExistsAtPath:", v19) & 1) == 0)
    {
      PLPhotoSharingGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v109 = v19;
        v110 = 2112;
        v111 = v6;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "could not access masterVideoPath %@ for collection %@", buf, 0x16u);
      }
      v18 = 0;
      goto LABEL_69;
    }
    v85 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v6, "isPhotoIris");
    v26 = v25;
    v27 = CFSTR("MP4");
    if (v25)
      v27 = CFSTR("MOV");
    v79 = *MEMORY[0x1E0C8A2E0];
    if (v25)
      v28 = (void *)*MEMORY[0x1E0C8A2E8];
    else
      v28 = (void *)*MEMORY[0x1E0C8A2E0];
    v87 = v27;
    v86 = v28;
    v88 = v21;
    v89 = v20;
    v83 = v26;
    if ((v26 & 1) == 0)
    {
      +[PLPhotoSharingHelper temporaryVideoPosterFramePathForCollectionGUID:](PLPhotoSharingHelper, "temporaryVideoPosterFramePathForCollectionGUID:", v9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "fileExistsAtPath:", v29))
      {
        v102 = 0;
        v30 = objc_msgSend(v21, "removeItemAtPath:error:", v29, &v102);
        v31 = v102;
        v77 = v31;
        if ((v30 & 1) == 0)
        {
          v32 = v31;
          PLPhotoSharingGetLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v109 = v19;
            v110 = 2112;
            v111 = v6;
            v112 = 2112;
            v113 = v32;
            _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "could not remove masterVideoPath %@ for collection %@ error %@", buf, 0x20u);
          }

        }
      }
      else
      {
        v77 = 0;
      }
      objc_msgSend(a1, "videoPosterFrameDimension");
      v75 = (uint64_t)(v35 * v36);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v29, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = dispatch_group_create();
      dispatch_group_enter(v38);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Shared albums posterframe extraction for %@"), v9);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)MEMORY[0x1E0D11618];
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __78__PLPhotoSharingHelper_videoDerivativesForAssetCollection_withSpecifications___block_invoke;
      v94[3] = &unk_1E366E8E8;
      v95 = v29;
      v20 = v89;
      v96 = v89;
      v97 = v6;
      v98 = v88;
      v99 = v37;
      v100 = v90;
      v101 = v38;
      v40 = v38;
      v41 = v37;
      v42 = v29;
      objc_msgSend(v39, "generatePosterFrameForVideoAtURL:maximumPixelCount:destinationURL:reason:completionHandler:", v96, v75, v41, v74, v94);
      dispatch_group_wait(v40, 0xFFFFFFFFFFFFFFFFLL);

      v21 = v88;
      v26 = v83;
    }
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
    v43 = (void *)CFPreferencesCopyAppValue(CFSTR("PLDebugVideoTranscodingPresetName"), CFSTR("com.apple.mobileslideshow"));
    if ((v26 & 1) != 0)
    {
LABEL_54:
      if (v43)
      {
LABEL_68:
        v18 = v90;

        v7 = v85;
        v34 = v87;
LABEL_69:

        goto LABEL_70;
      }
      v82 = a1;
      v61 = (id *)MEMORY[0x1E0C89E40];
      if (!v26)
        v61 = (id *)MEMORY[0x1E0C89EA8];
      v84 = *v61;
      +[PLPhotoSharingHelper temporaryLargeVideoDerivativePathForCollectionGUID:](PLPhotoSharingHelper, "temporaryLargeVideoDerivativePathForCollectionGUID:", v9);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)MEMORY[0x1E0C99E98];
      v80 = v62;
      objc_msgSend(v62, "stringByAppendingPathExtension:", v87);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "fileURLWithPath:isDirectory:", v64, 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v65, "path");
      v66 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "fileExistsAtPath:", v66))
      {
        v92 = 0;
        v67 = objc_msgSend(v21, "removeItemAtURL:error:", v65, &v92);
        v68 = v92;

        if ((v67 & 1) != 0)
        {
LABEL_63:
          PLPhotoSharingGetLog();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v109 = v65;
            v110 = 2112;
            v111 = v84;
            _os_log_impl(&dword_199541000, v69, OS_LOG_TYPE_INFO, "will generate video derivative to %@ with videoPresetName %@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Shared albums large video derivative for asset collection %@"), v9);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v89;
          objc_msgSend(v82, "_videoDerivativeForVideoAtURL:outputURL:withPreset:reason:outputFileType:", v89, v65, v84, v70, v86);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v71;
          if (v71)
          {
            objc_msgSend(v71, "setMediaAssetType:", 7);
            objc_msgSend(v90, "addObject:", v72);
          }

          v21 = v88;
          goto LABEL_68;
        }
        PLPhotoSharingGetLog();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v109 = v65;
          v110 = 2112;
          v111 = v6;
          v112 = 2112;
          v113 = v68;
          _os_log_impl(&dword_199541000, v66, OS_LOG_TYPE_ERROR, "could not remove largeDerivativeURL %@ for collection %@ error %@", buf, 0x20u);
        }
      }
      else
      {
        v68 = 0;
      }

      goto LABEL_63;
    }
    v44 = (id)*MEMORY[0x1E0C89EA0];
    v45 = v44;
    if (v43)
    {
      v81 = v43;

      PLPhotoSharingGetLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v109 = v81;
        _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_ERROR, "will use PLDebugVideoTranscodingPresetName %@", buf, 0xCu);
      }
      v47 = a1;

    }
    else
    {
      v47 = a1;
      v81 = v44;
    }
    +[PLPhotoSharingHelper temporarySmallVideoDerivativePathForCollectionGUID:](PLPhotoSharingHelper, "temporarySmallVideoDerivativePathForCollectionGUID:", v9);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)MEMORY[0x1E0C99E98];
    v78 = v48;
    objc_msgSend(v48, "stringByAppendingPathExtension:", CFSTR("MP4"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "fileURLWithPath:isDirectory:", v50, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v51, "path");
    v52 = objc_claimAutoreleasedReturnValue();
    v76 = v43;
    if (objc_msgSend(v21, "fileExistsAtPath:", v52))
    {
      v93 = 0;
      v53 = objc_msgSend(v21, "removeItemAtURL:error:", v51, &v93);
      v54 = v93;

      if ((v53 & 1) != 0)
      {
LABEL_49:
        v55 = v54;
        PLPhotoSharingGetLog();
        v56 = objc_claimAutoreleasedReturnValue();
        a1 = v47;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v109 = v51;
          v110 = 2112;
          v111 = v81;
          _os_log_impl(&dword_199541000, v56, OS_LOG_TYPE_INFO, "will generate video derivative to %@ with videoPresetName %@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Shared albums small video derivative for asset collection %@"), v9);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v47;
        v20 = v89;
        objc_msgSend(v58, "_videoDerivativeForVideoAtURL:outputURL:withPreset:reason:outputFileType:", v89, v51, v81, v57, v79);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v59;
        if (v59)
        {
          objc_msgSend(v59, "setMediaAssetType:", 6);
          objc_msgSend(v90, "addObject:", v60);
        }

        v21 = v88;
        v26 = v83;
        v43 = v76;
        goto LABEL_54;
      }
      PLPhotoSharingGetLog();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v109 = v51;
        v110 = 2112;
        v111 = v6;
        v112 = 2112;
        v113 = v54;
        _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_ERROR, "could not remove smallDerivativeURL %@ for collection %@ error %@", buf, 0x20u);
      }
    }
    else
    {
      v54 = 0;
    }

    goto LABEL_49;
  }
  v18 = 0;
LABEL_70:

  return v18;
}

+ (id)_videoDerivativeForVideoAtURL:(id)a3 outputURL:(id)a4 withPreset:(id)a5 reason:(id)a6 outputFileType:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__61317;
  v38 = __Block_byref_object_dispose__61318;
  v39 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D11608]);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D11610]);
  v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  v18 = (void *)MEMORY[0x1E0D11618];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __97__PLPhotoSharingHelper__videoDerivativeForVideoAtURL_outputURL_withPreset_reason_outputFileType___block_invoke;
  v27[3] = &unk_1E366E910;
  v19 = v11;
  v28 = v19;
  v20 = v12;
  v29 = v20;
  v33 = &v34;
  v21 = v15;
  v30 = v21;
  v22 = v13;
  v31 = v22;
  v23 = v17;
  v32 = v23;
  v24 = (id)objc_msgSend(v18, "transcodeVideoAtURL:withAdjustments:destinationURL:options:reason:isCancellable:completionHandler:", v19, 0, v20, v16, v14, 0, v27);
  dispatch_group_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  v25 = (id)v35[5];

  _Block_object_dispose(&v34, 8);
  return v25;
}

+ (id)derivativesForMasterAsset:(id)a3 withSpecifications:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  float v44;
  float v45;
  float v46;
  float v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  NSObject *v59;
  id obj;
  uint64_t v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  double v69;
  __int16 v70;
  double v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    v36 = 0;
    v37 = 0;
    v20 = 0;
    v38 = 0;
    v21 = 0;
    goto LABEL_46;
  }
  objc_msgSend(v5, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D16FD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D16FC8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  PLPhotoSharingGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v69 = v11;
    v70 = 2048;
    v71 = v14;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "calling MSImageScalingSpecification assetsToGenerateFromImageWithInputSize:(%f,%f)", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D16C78], "assetsToGenerateFromImageWithInputSize:toConformToSpecifications:", v6, v11, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "count"))
  {
    v36 = 0;
    v59 = 0;
    v20 = 0;
    v38 = 0;
    v21 = 0;
    goto LABEL_45;
  }
  v55 = v7;
  PLPhotoSharingGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v69 = *(double *)&v16;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, "assetsToGenerateFromImageWithInputSize returned %@", buf, 0xCu);
  }
  v54 = v8;
  v56 = v6;
  v57 = v5;

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v16;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (!v18)
  {
    v58 = 0;
    v59 = 0;
    v20 = 0;
    v21 = 0;
    goto LABEL_33;
  }
  v19 = v18;
  v58 = 0;
  v59 = 0;
  v20 = 0;
  v21 = 0;
  v22 = *(_QWORD *)v64;
  v23 = *MEMORY[0x1E0D16F60];
  v61 = *MEMORY[0x1E0D16FA0];
  do
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v64 != v22)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
      objc_msgSend(v25, "objectForKey:", v23, v54);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        objc_msgSend(v25, "objectForKey:", v61);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          if ((-[NSObject intValue](v27, "intValue") & 2) == 0)
          {
            v29 = v20;
            if ((-[NSObject intValue](v28, "intValue") & 1) == 0)
            {
              PLPhotoSharingGetLog();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v69 = *(double *)&v25;
                v31 = v30;
                v32 = "unexpected specification result %@, didn't find a derivative or thumbnail asset type";
                goto LABEL_22;
              }
              goto LABEL_25;
            }
LABEL_24:
            v35 = v25;

            v30 = v59;
            v58 = v35;
            v59 = v26;
            goto LABEL_25;
          }
          v33 = v25;
          v34 = v21;
          v21 = v33;

          v29 = v26;
          if ((-[NSObject intValue](v28, "intValue") & 1) != 0)
            goto LABEL_24;
        }
        else
        {
          v29 = v20;
          PLPhotoSharingGetLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v69 = *(double *)&v25;
            v31 = v30;
            v32 = "ERROR: missing asset type flags in specification result %@";
LABEL_22:
            _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);
          }
LABEL_25:

        }
        v20 = v29;
        goto LABEL_27;
      }
      PLPhotoSharingGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v69 = *(double *)&v25;
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "ERROR: missing scale factor in specification result %@", buf, 0xCu);
      }
LABEL_27:

    }
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  }
  while (v19);
LABEL_33:

  if (v21)
  {
    v5 = v57;
    objc_msgSend(v57, "GUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLPhotoDerivativeUtilities generateDerivativeForMSAsset:derivativeType:withSpecificationInfo:collectionGUID:](PLPhotoDerivativeUtilities, "generateDerivativeForMSAsset:derivativeType:withSpecificationInfo:collectionGUID:", v57, 0, v21, v39);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v55;
    v6 = v56;
    v37 = v59;
    if (v36)
      objc_msgSend(v55, "addObject:", v36);
  }
  else
  {
    v36 = 0;
    v6 = v56;
    v5 = v57;
    v7 = v55;
    v37 = v59;
  }
  v38 = v58;
  if (v58)
  {
    v40 = v21;
    v41 = v5;
    v42 = v58;
    v38 = v42;
    v43 = v41;
    v16 = v42;
    v62 = v20;
    if (v36)
    {
      v43 = v41;
      v16 = v42;
      if (v20)
      {
        v43 = v41;
        v16 = v42;
        if (v59)
        {
          v43 = v36;

          -[NSObject floatValue](v59, "floatValue");
          v45 = v44;
          objc_msgSend(v20, "floatValue");
          v47 = v45 / v46;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v38);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v48, *MEMORY[0x1E0D16F60]);

        }
      }
    }
    objc_msgSend(v41, "GUID", v54);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v43;
    +[PLPhotoDerivativeUtilities generateDerivativeForMSAsset:derivativeType:withSpecificationInfo:collectionGUID:](PLPhotoDerivativeUtilities, "generateDerivativeForMSAsset:derivativeType:withSpecificationInfo:collectionGUID:", v43, 1, v16, v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
      objc_msgSend(v7, "addObject:", v51);

    v8 = v50;
    v20 = v62;
    v21 = v40;
LABEL_45:

    v37 = v59;
  }
LABEL_46:
  v52 = v7;

  return v52;
}

+ (double)derivedAssetSmallDimensionLimitForType:(int)a3
{
  double result;

  result = 1536.0;
  if (a3 == 1)
    return 256.0;
  return result;
}

+ (id)temporaryUploadDerivativesPathForCollectionGUID:(id)a3 pathExtension:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (temporaryUploadDerivativesPathForCollectionGUID_pathExtension__onceToken != -1)
    dispatch_once(&temporaryUploadDerivativesPathForCollectionGUID_pathExtension__onceToken, &__block_literal_global_582_61305);
  v7 = 0;
  if (v5 && temporaryUploadDerivativesPathForCollectionGUID_pathExtension__temporaryUploadDerivativesPath)
  {
    objc_msgSend((id)temporaryUploadDerivativesPathForCollectionGUID_pathExtension__temporaryUploadDerivativesPath, "stringByAppendingPathComponent:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathExtension:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)temporaryDerivativePathForCollectionGUID:(id)a3 uti:(id)a4
{
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = CFSTR("derivative.JPG");
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0CEC4F8]))
      v7 = CFSTR("derivative.GIF");

  }
  objc_msgSend(a1, "temporaryUploadDerivativesPathForCollectionGUID:pathExtension:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)temporaryThumbnailPathForCollectionGUID:(id)a3
{
  return (id)objc_msgSend(a1, "temporaryUploadDerivativesPathForCollectionGUID:pathExtension:", a3, CFSTR("thumbnail.JPG"));
}

+ (id)temporaryVideoPathForCollectionGUID:(id)a3
{
  return (id)objc_msgSend(a1, "temporaryUploadDerivativesPathForCollectionGUID:pathExtension:", a3, CFSTR("derivative.MOV"));
}

+ (id)temporaryVideoPosterFramePathForCollectionGUID:(id)a3
{
  return (id)objc_msgSend(a1, "temporaryUploadDerivativesPathForCollectionGUID:pathExtension:", a3, CFSTR("posterFrame.JPG"));
}

+ (id)temporarySmallVideoDerivativePathForCollectionGUID:(id)a3
{
  return (id)objc_msgSend(a1, "temporaryUploadDerivativesPathForCollectionGUID:pathExtension:", a3, CFSTR("smallvideo"));
}

+ (id)temporaryLargeVideoDerivativePathForCollectionGUID:(id)a3
{
  return (id)objc_msgSend(a1, "temporaryUploadDerivativesPathForCollectionGUID:pathExtension:", a3, CFSTR("largevideo"));
}

+ (CGSize)derivedAssetSizeForMasterSizeWidth:(double)a3 height:(double)a4 derivativeType:(int)a5 withSpecificationInfo:(id)a6
{
  uint64_t v6;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  float v16;
  double v17;
  double v18;
  float v19;
  double v20;
  int v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;
  CGSize result;

  v6 = *(_QWORD *)&a5;
  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a6, "objectForKey:", *MEMORY[0x1E0D16F60]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    v12 = ceil(v11 * a3);
    objc_msgSend(v10, "doubleValue");
    v14 = ceil(v13 * a4);
    PLPhotoSharingGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "floatValue");
      v21 = 134219008;
      v22 = a3;
      v23 = 2048;
      v24 = a4;
      v25 = 2048;
      v26 = v16;
      v27 = 2048;
      v28 = v12;
      v29 = 2048;
      v30 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "derivedAssetSizeForMasterSize %f,%f scaling with factor %f to return %f,%f", (uint8_t *)&v21, 0x34u);
    }

  }
  else
  {
    v19 = a3 / a4;
    +[PLPhotoSharingHelper derivedAssetSmallDimensionLimitForType:](PLPhotoSharingHelper, "derivedAssetSmallDimensionLimitForType:", v6);
    if (a3 >= a4)
    {
      v14 = a4;
      v12 = a3;
      if (v20 < a4)
      {
        v12 = rint(v20 * v19);
        v14 = v20;
      }
    }
    else
    {
      v14 = a4;
      v12 = a3;
      if (v20 < a3)
      {
        v14 = rint(v20 / v19);
        v12 = v20;
      }
    }
  }

  v17 = v12;
  v18 = v14;
  result.height = v18;
  result.width = v17;
  return result;
}

+ (void)markAlbumGUIDAsViewed:(id)a3 clearUnseenAssetsCount:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PLPhotoSharingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_opt_class();
    v9 = CFSTR("NO");
    v15 = 138412802;
    v16 = v8;
    v17 = 2112;
    if (v4)
      v9 = CFSTR("YES");
    v18 = v6;
    v19 = 2112;
    v20 = v9;
    v10 = v8;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "%@ markAlbumGUIDAsViewed:%@ clearUnseenAssetsCount:%@", (uint8_t *)&v15, 0x20u);

  }
  if (v6)
  {
    objc_msgSend(a1, "sharingPersonID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PLPhotoSharingGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = CFSTR("NO");
        v15 = 138412802;
        v16 = v6;
        v17 = 2112;
        if (v4)
          v14 = CFSTR("YES");
        v18 = v11;
        v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "about to call connection markAlbumGUIDAsViewed:%@ personID:%@ moveLastViewedAssetCollectionMarker:%@ info:nil", (uint8_t *)&v15, 0x20u);
      }

      objc_msgSend(v12, "markAlbumGUIDAsViewed:personID:moveLastViewedAssetCollectionMarker:info:", v6, v11, v4, 0);
    }

  }
}

+ (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLPhotoSharingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 138412802;
    v14 = (id)objc_opt_class();
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v9 = v14;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "%@ markCommentsForAssetCollectionWithGUID:%@ asViewedWithLastViewedDate:%@", (uint8_t *)&v13, 0x20u);

  }
  if (v6)
  {
    objc_msgSend(a1, "sharingPersonID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PLPhotoSharingGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = 138412802;
        v14 = v6;
        v15 = 2112;
        v16 = v7;
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "about to call connection markCommentsForAssetCollectionWithGUID:%@ asViewedWithLastViewedDate:%@ personID:%@", (uint8_t *)&v13, 0x20u);
      }

      objc_msgSend(v11, "markCommentsForAssetCollectionWithGUID:asViewedWithLastViewedDate:personID:", v6, v7, v10);
    }

  }
}

+ (void)checkServerModelRelationshipsForPhotoLibrary:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  __CFString *v24;
  void *v25;
  void *v26;
  id obj;
  id v28;
  _QWORD v29[4];
  id v30;
  __CFString *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  objc_msgSend(a1, "sharingPersonID");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", CFSTR("/tmp/_pollRelationships.plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("pollRelationshipsNextDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v6, "compare:", v7),
          v7,
          v8 == -1))
    {
      v9 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(a1, "intervalBetweenRelationshipPolls");
      objc_msgSend(v9, "dateWithTimeIntervalSinceNow:");
      v10 = objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("pollRelationshipsNextDate"));
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 100, 0, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "writeToFile:options:error:", CFSTR("/tmp/_pollRelationships.plist"), 1073741825, 0);
        PLPhotoSharingGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v39 = v5;
          v40 = 2112;
          v41 = CFSTR("/tmp/_pollRelationships.plist");
          v42 = 1024;
          v43 = v12;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, " saved pollRelationshipsDate %@ to path %@ success %d", buf, 0x1Cu);
        }

      }
      objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection", v10, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCloudSharedAlbum allCloudSharedAlbumsInLibrary:](PLCloudSharedAlbum, "allCloudSharedAlbumsInLibrary:", v28);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v34 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            PLPhotoSharingGetLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v19, "cloudGUID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v39 = v21;
              v40 = 2112;
              v41 = v4;
              _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_INFO, "about to call connection accessControlGUIDsForAlbumWithGUID:%@ personID:%@", buf, 0x16u);

            }
            objc_msgSend(v19, "cloudGUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __69__PLPhotoSharingHelper_checkServerModelRelationshipsForPhotoLibrary___block_invoke;
            v29[3] = &unk_1E366E980;
            v23 = v14;
            v30 = v23;
            v24 = v4;
            v31 = v24;
            v32 = v28;
            objc_msgSend(v23, "accessControlGUIDsForAlbumWithGUID:personID:completionBlock:", v22, v24, v29);

          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v16);
      }

      v6 = v25;
      v5 = v26;
    }

  }
}

+ (void)checkServerModelForAlbum:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "sharingPersonID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "cloudGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", CFSTR("/tmp/_pollStreams.plist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11
      || (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v11, "compare:", v12),
          v12,
          v13 == -1))
    {
      v15 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(a1, "intervalBetweenAlbumPolls");
      objc_msgSend(v15, "dateWithTimeIntervalSinceNow:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v10, "setObject:forKey:", v14, v9);
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 100, 0, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "writeToFile:options:error:", CFSTR("/tmp/_pollStreams.plist"), 1073741825, 0);
        PLPhotoSharingGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v28 = v10;
          v29 = 2112;
          v30 = CFSTR("/tmp/_pollStreams.plist");
          v31 = 1024;
          v32 = v17;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, " saved pollStreamsDate %@ to path %@ success %d", buf, 0x1Cu);
        }

      }
      objc_msgSend(a1, "_transactionWithName:", "+[PLPhotoSharingHelper checkServerModelForAlbum:photoLibrary:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v9;
      v23 = v8;
      v24 = v7;
      v25 = v6;
      v26 = v19;
      v21 = v19;
      pl_dispatch_async();

    }
    else
    {
      v14 = v11;
    }

  }
}

+ (void)prioritizeDownloadsForAlbumGUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "sharingPersonID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    PLPhotoSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v15 = (id)objc_opt_class();
      v16 = 2112;
      v17 = v4;
      v7 = v15;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "%@ prioritizeDownloadsForAlbumGUID:%@", buf, 0x16u);

    }
    objc_msgSend(a1, "_transactionWithName:", "+[PLPhotoSharingHelper prioritizeDownloadsForAlbumGUID:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v4;
    v12 = v5;
    v13 = v8;
    v10 = v8;
    pl_dispatch_async();

  }
}

+ (BOOL)_recentlyRequestedDownloadAsset:(id)a3 cloudPlaceholderKind:(signed __int16)a4
{
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a4;
  v5 = a3;
  pl_dispatch_once();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "cloudAssetGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%d"), v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend((id)_recentlyRequestedDownloadAsset_cloudPlaceholderKind__recentlyRequestedIdentifiers, "containsObject:", v8);
  if ((v9 & 1) == 0)
    objc_msgSend((id)_recentlyRequestedDownloadAsset_cloudPlaceholderKind__recentlyRequestedIdentifiers, "addObject:", v8);

  return v9;
}

+ (id)_downloadRequestQueue
{
  pl_dispatch_once();
  return (id)_downloadRequestQueue_queue;
}

+ (BOOL)_derivativeExistsForAsset:(id)a3 cloudPlaceholderKind:(signed __int16)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "cloudSharedAssetPathForPlaceholderKind:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((_DWORD)v4 == 3)
  {
    v8 = objc_msgSend(v5, "hasMasterThumb");
  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "fileExistsAtPath:", v7);

  }
  else
  {
    PLPhotoSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109378;
      v12[1] = v4;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Unsupported cloudPlaceholderKind %d to download for cloudSharedAsset %@", (uint8_t *)v12, 0x12u);
    }

    v8 = 0;
  }

  return v8;
}

+ (id)downloadNotificationForAssetwithUUID:(id)a3 cloudPlaceholderKind:(signed __int16)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.assetsd.cloudsharedassetdownloaddone.%@.%d"), a3, a4);
}

+ (void)downloadAsset:(id)a3 cloudPlaceholderKind:(signed __int16)a4 shouldPrioritize:(BOOL)a5 shouldExtendTimer:(BOOL)a6
{
  uint64_t v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  id v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v6 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoSharingHelper.m"), 2976, CFSTR("downloadAsset: can only run from within assets"));

  }
  objc_msgSend(a1, "sharingPersonID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cloudAssetGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cloudShareAlbum");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cloudGUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    PLPhotoSharingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 138412290;
    v32 = v9;
    v17 = "No Apple Account, skip downloading cloud shared asset %@";
LABEL_15:
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
    goto LABEL_16;
  }
  if ((objc_msgSend(v9, "isCloudSharedAsset") & 1) == 0)
  {
    PLPhotoSharingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 138412290;
    v32 = v9;
    v17 = "Asset %@ is not a cloud shared asset, skip downloading from cloud";
    goto LABEL_15;
  }
  if (!v11)
  {
    PLPhotoSharingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 138412290;
    v32 = v9;
    v17 = "Unable to find a cloudAssetGUID for %@, skip downloading from cloud";
    goto LABEL_15;
  }
  if (v13)
  {
    if (objc_msgSend(a1, "_derivativeExistsForAsset:cloudPlaceholderKind:", v9, v6))
    {
      objc_msgSend(v9, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "downloadNotificationForAssetwithUUID:cloudPlaceholderKind:", v14, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_retainAutorelease(v15);
      notify_post((const char *)-[NSObject UTF8String](v16, "UTF8String"));
LABEL_16:

      goto LABEL_17;
    }
    v20 = objc_msgSend(a1, "_recentlyRequestedDownloadAsset:cloudPlaceholderKind:", v9, v6);
    PLPhotoSharingGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (!v20)
    {
      if (v22)
      {
        v23 = (void *)objc_opt_class();
        v27 = v23;
        *(_DWORD *)buf = 138413058;
        v32 = v23;
        v33 = 2112;
        v34 = v11;
        v35 = 1024;
        v36 = objc_msgSend(v9, "cloudPlaceholderKind");
        v37 = 1024;
        v38 = v6;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_INFO, "%@ downloadAsset:%@ current placeHolderKind %i request placeHolderkind %d", buf, 0x22u);

      }
      objc_msgSend(a1, "_transactionWithName:", "+[PLPhotoSharingHelper downloadAsset:cloudPlaceholderKind:shouldPrioritize:shouldExtendTimer:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_downloadRequestQueue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v11;
      v29 = v10;
      v30 = v13;
      v16 = v24;
      pl_dispatch_async();

      goto LABEL_16;
    }
    if (v22)
    {
      *(_DWORD *)buf = 138412546;
      v32 = v9;
      v33 = 1024;
      LODWORD(v34) = v6;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_INFO, "asset %@ with cloudPlaceholderkind %d has been recently requsted to be downloaded, skip duplicate request.", buf, 0x12u);
    }

  }
  else
  {
    PLPhotoSharingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v32 = (id)objc_opt_class();
      v33 = 2112;
      v34 = v9;
      v19 = v32;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "%@ unable to find albumGUID for cloudSharedAsset %@", buf, 0x16u);

    }
  }
LABEL_17:

}

+ (double)intervalBetweenPolls
{
  return 86400.0;
}

+ (double)intervalBetweenAlbumPolls
{
  return 3600.0;
}

+ (double)intervalBetweenRelationshipPolls
{
  return 3600.0;
}

+ (void)pruneCloudSharingContentIfNecessaryInLibrary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoSharingHelper.m"), 3085, CFSTR("Method can only be run in assetsd"));

  }
  objc_msgSend(v5, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoDirectoryWithType:", 22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D731D8], "freeSpaceBelowDesiredSpaceThresholdForPath:", v7))
  {
    +[PLPhotoSharingHelper sharingPersonID](PLPhotoSharingHelper, "sharingPersonID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v5, "pathManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "libraryURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[PLPhotoSharingHelper sharedStreamsEnabledForPhotoLibraryURL:](PLPhotoSharingHelper, "sharedStreamsEnabledForPhotoLibraryURL:", v10);

      if (v11)
      {
        PLBackendGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v8;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "About to call connection refreshResetSync:NO personID:%@ in nightly maintenance task", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "refreshResetSync:personID:", 0, v8);

        PLBackendGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Purging non-recently viewed cloud sharing assets", buf, 2u);
        }

        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __69__PLPhotoSharingHelper_pruneCloudSharingContentIfNecessaryInLibrary___block_invoke;
        v17[3] = &unk_1E3677AA0;
        v18 = v5;
        objc_msgSend(v18, "performTransactionAndWait:", v17);
        PLBackendGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Completed purging non-recently viewed cloud sharing assets", buf, 2u);
        }

      }
    }

  }
  objc_msgSend(a1, "_markStreamVideosAsPurgeable");

}

+ (id)customSharedAlbumsExportsOutputDirectoryParent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("TemporaryItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.photos.cloud-shared-custom-exports-%d-%@"), getpid(), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_customSharedAlbumExportsOutputDirectoryForAssetWithUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "customSharedAlbumsExportsOutputDirectoryParent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)processExportedFileURL:(id)a3 assetUUID:(id)a4 customExportsInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  NSObject *v18;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  NSObject *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PLPhotoSharingHelper _customSharedAlbumExportsOutputDirectoryForAssetWithUUID:](PLPhotoSharingHelper, "_customSharedAlbumExportsOutputDirectoryForAssetWithUUID:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v12 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v21);
    v13 = v21;
    if (v12)
    {
      objc_msgSend(v7, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject URLByAppendingPathComponent:](v10, "URLByAppendingPathComponent:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v20 = 0;
      v16 = objc_msgSend(v11, "copyItemAtURL:toURL:error:", v7, v15, &v20);
      v17 = v20;
      if (v16)
      {
        -[NSObject absoluteString](v15, "absoluteString");
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v8);
      }
      else
      {
        PLSharingGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v23 = (uint64_t)v7;
          v24 = 2112;
          v25 = v15;
          v26 = 2112;
          v27 = v17;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Could not copy file from exported source: %@ to temporary location: %@, error: %@", buf, 0x20u);
        }
      }

    }
    else
    {
      PLSharingGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = (uint64_t)v7;
        v24 = 2112;
        v25 = v13;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Could not create a directory for copying the exported source: %@. Error: %@", buf, 0x16u);
      }
      LOBYTE(v16) = 0;
    }

  }
  else
  {
    PLSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v23 = objc_opt_class();
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Skipping exported item of unexpected class: %{public}@", buf, 0xCu);
    }
    LOBYTE(v16) = 0;
  }

  return v16;
}

+ (void)_markStreamVideosAsPurgeable
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[5];

  v38[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "streamdVideoCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C99A90];
    v6 = *MEMORY[0x1E0C998D8];
    v38[0] = *MEMORY[0x1E0C99A90];
    v38[1] = v6;
    v30 = v6;
    v7 = *MEMORY[0x1E0C99A18];
    v38[2] = *MEMORY[0x1E0C99A18];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v4;
    v29 = v3;
    objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, v8, 5, &__block_literal_global_628);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v10)
    {
      v11 = v10;
      v32 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v34 != v32)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v13, "resourceValuesForKeys:error:", v8, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("CachedMedia-"));

          if (v16)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", v7);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "BOOLValue");

            if (v18)
            {
              objc_msgSend(v14, "objectForKeyedSubscript:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "timeIntervalSinceDate:", v31);
              v20 = v11;
              v21 = v9;
              v22 = v8;
              v23 = v5;
              v24 = v7;
              v26 = v25 < 604800.0;

              v27 = 2 * v26;
              v7 = v24;
              v5 = v23;
              v8 = v22;
              v9 = v21;
              v11 = v20;
              +[PLCacheDeleteSupport markPurgeableForFileAtURL:withUrgency:outInode:](PLCacheDeleteSupport, "markPurgeableForFileAtURL:withUrgency:outInode:", v13, v27, 0);

            }
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v11);
    }

    v3 = v29;
  }

}

+ (unint64_t)purgeableSpace
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  uint8_t v8[8];
  uint64_t v9;

  +[PLPhotoLibrary cloudSharingPhotoLibrary](PLPhotoLibrary, "cloudSharingPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetsdClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudInternalClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v5 = objc_msgSend(v4, "cloudSharingSpaceManagementRequestWithType:optionalBytesToPurge:error:", 0, 0, &v9);
  if (v9)
  {
    PLPhotoSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Error getting purgeable space", v8, 2u);
    }

  }
  return v5;
}

+ (unint64_t)purgeSpace:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v10;
  uint8_t buf[4];
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[PLPhotoLibrary cloudSharingPhotoLibrary](PLPhotoLibrary, "cloudSharingPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetsdClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudInternalClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v7 = objc_msgSend(v6, "cloudSharingSpaceManagementRequestWithType:optionalBytesToPurge:error:", 1, a3, &v10);
  if (v10)
  {
    PLPhotoSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v12 = a3;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Error purging space with spaceNeeded %lld", buf, 0xCu);
    }

  }
  return v7;
}

+ (BOOL)isBreadcrumbDebugEnabled
{
  int AppIntegerValue;
  Boolean keyExistsAndHasValidFormat;

  AppIntegerValue = __isSharingBreadcrumbDebuggingEnabled;
  if (__isSharingBreadcrumbDebuggingEnabled == -1)
  {
    keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("PSDebugLevel"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
    __isSharingBreadcrumbDebuggingEnabled = AppIntegerValue;
  }
  return AppIntegerValue != 0;
}

+ (id)directoryPathForUploadActivityForAlbumGUID:(id)a3 create:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = a4;
    v5 = a3;
    pl_dispatch_once();
    objc_msgSend((id)directoryPathForUploadActivityForAlbumGUID_create__activityPath, "stringByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)directoryPathForDownloadActivityForAlbumGUID:(id)a3 create:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = a4;
    v5 = a3;
    pl_dispatch_once();
    objc_msgSend((id)directoryPathForDownloadActivityForAlbumGUID_create__activityPath, "stringByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (void)writeAlbumNameBreadCrumb:(id)a3 forAlbumGUID:(id)a4 isUpload:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  if (objc_msgSend(a1, "isBreadcrumbDebugEnabled"))
  {
    if (v5)
      objc_msgSend(a1, "directoryPathForUploadActivityForAlbumGUID:create:", v8, 1);
    else
      objc_msgSend(a1, "directoryPathForDownloadActivityForAlbumGUID:create:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"albumName %@\"), v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "writeToFile:options:error:", v11, 1073741825, 0);

  }
}

+ (id)prefixForBreadcrumbState:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;

  v5 = 0;
  if (a3 > 219)
  {
    v6 = CFSTR("complete_replaced_original");
    v7 = CFSTR("deleted");
    if (a3 != 300)
      v7 = 0;
    if (a3 != 292)
      v6 = v7;
    v8 = CFSTR("complete_thumbnail");
    v9 = CFSTR("complete");
    if (a3 != 291)
      v9 = 0;
    if (a3 != 290)
      v8 = v9;
    if (a3 <= 291)
      v6 = v8;
    v10 = CFSTR("received_assetsd_thumbnail");
    v11 = CFSTR("received_assetsd");
    if (a3 != 231)
      v11 = 0;
    if (a3 != 230)
      v10 = v11;
    if (a3 == 221)
      v5 = CFSTR("received");
    if (a3 == 220)
      v5 = CFSTR("received_thumbnail");
    if (a3 > 229)
      v5 = v10;
    if (a3 > 289)
      v5 = v6;
  }
  else if (a3 <= 198)
  {
    if (a3 == 120)
      v5 = CFSTR("submitted");
    if (a3 == 110)
      v5 = CFSTR("requested");
    if (a3 == 100)
      v5 = CFSTR("enqueued");
  }
  else
  {
    switch(a3)
    {
      case 199:
        v5 = CFSTR("complete");
        break;
      case 200:
        v5 = CFSTR("metadata");
        break;
      case 205:
        v5 = CFSTR("metadata_assetsd");
        break;
      case 210:
        v5 = CFSTR("requested_thumbnail");
        break;
      case 211:
        v5 = CFSTR("requested");
        break;
      case 212:
        v5 = CFSTR("requested_video_posterframe");
        break;
      default:
        return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i_%@"), *(_QWORD *)&a3, v5, v3, v4);
    }
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i_%@"), *(_QWORD *)&a3, v5, v3, v4);
}

+ (void)writeUploadDebugBreadcrumbForAssetCollections:(id)a3 state:(int)a4 error:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  NSObject *v31;
  id v32;
  id obj;
  _BOOL4 v34;
  id v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v6 = *(_QWORD *)&a4;
  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v39 = a1;
  if (objc_msgSend(a1, "isBreadcrumbDebugEnabled"))
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v32 = v8;
    obj = v8;
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    if (!v38)
      goto LABEL_35;
    v34 = v9 != 0;
    v37 = *(_QWORD *)v44;
    v36 = v6;
    v35 = v9;
    while (1)
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v44 != v37)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v11, "albumGUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v39, "directoryPathForUploadActivityForAlbumGUID:create:", v12, 1);
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "GUID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 0;
          if ((int)v6 > 119)
          {
            if ((_DWORD)v6 == 120)
            {
              v17 = 110;
              goto LABEL_19;
            }
            v15 = v34;
            v16 = 0;
            if ((_DWORD)v6 == 199)
            {
              v17 = 120;
              goto LABEL_19;
            }
          }
          else
          {
            if ((_DWORD)v6 == 100)
            {
              objc_msgSend(v39, "prefixForBreadcrumbState:", 100);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = 0;
              goto LABEL_22;
            }
            v15 = v34;
            v16 = 0;
            if ((_DWORD)v6 == 110)
            {
              v17 = 100;
LABEL_19:
              objc_msgSend(v39, "prefixForBreadcrumbState:", v17);
              v16 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "prefixForBreadcrumbState:", v6);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v9 && v16)
              {
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject stringByAppendingPathComponent:](v13, "stringByAppendingPathComponent:", v16);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "stringByAppendingPathExtension:", v41);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v18, "removeItemAtPath:error:", v20, 0);
                v15 = 0;
                goto LABEL_23;
              }
LABEL_22:
              v15 = v34;
            }
          }
LABEL_23:
          v40 = (void *)v16;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ \n"), v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v14, "stringByAppendingPathExtension:", CFSTR("ERROR"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CONTENT:%@ ERROR:%@ \n"), v21, v9);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v24 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v9, "MSVerboseDescription");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "stringWithFormat:", CFSTR("%@\n MSVerboseDescription:%@ \n"), v23, v25);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v21 = v23;
            }
          }
          else
          {
            v22 = v14;
          }
          -[NSObject stringByAppendingPathComponent:](v13, "stringByAppendingPathComponent:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringByAppendingPathExtension:", v41);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "dataUsingEncoding:", 4);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          v29 = objc_msgSend(v28, "writeToFile:options:error:", v27, 1073741825, &v42);
          v30 = v42;
          if ((v29 & 1) == 0)
          {
            PLPhotoSharingGetLog();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138413314;
              v48 = v11;
              v49 = 1024;
              v50 = v36;
              v51 = 2112;
              v52 = v35;
              v53 = 2112;
              v54 = v27;
              v55 = 2112;
              v56 = v30;
              _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "writeUploadDebugBreadcrumbForAssetCollection %@ step:%i error:%@ failed to write upload breadcrumb at path %@ error %@", buf, 0x30u);
            }

          }
          v6 = v36;
          v9 = v35;
          goto LABEL_33;
        }
        PLPhotoSharingGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v48 = v11;
          v49 = 1024;
          v50 = v6;
          v51 = 2112;
          v52 = v9;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "writeUploadDebugBreadcrumbForAssetCollection %@ step:%i error:%@ does not have an album GUID to proceed", buf, 0x1Cu);
        }
LABEL_33:

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
      if (!v38)
      {
LABEL_35:

        v8 = v32;
        break;
      }
    }
  }

}

+ (void)writeDownloadDebugBreadcrumbForAsset:(id)a3 albumGUID:(id)a4 content:(id)a5 state:(int)a6 error:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  id v22;
  uint64_t v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  int v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v8 = *(_QWORD *)&a6;
  v58 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (objc_msgSend(a1, "isBreadcrumbDebugEnabled"))
  {
    if (v12)
    {
      if (v13)
      {
        objc_msgSend(a1, "directoryPathForDownloadActivityForAlbumGUID:create:", v13, 1);
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "prefixForBreadcrumbState:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if ((int)v8 <= 220)
        {
          if ((int)v8 <= 209)
          {
            if ((_DWORD)v8 != 200)
            {
              if ((_DWORD)v8 == 205)
              {
                v22 = a1;
                v23 = 200;
                goto LABEL_33;
              }
              goto LABEL_27;
            }
LABEL_28:
            v44 = 0;
            v41 = 0;
            v24 = v15 != 0;
LABEL_39:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ \n"), v14);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              objc_msgSend(v18, "stringByAppendingPathExtension:", CFSTR("ERROR"));
              v30 = objc_claimAutoreleasedReturnValue();
              v31 = v18;
              v18 = (void *)v30;

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CONTENT:%@ ERROR:%@ \n"), v29, v15);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v33 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v15, "MSVerboseDescription");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "stringWithFormat:", CFSTR("%@\n MSVerboseDescription:%@ \n"), v32, v34);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v29 = v32;
              }
            }
            v42 = v18;
            v43 = v16;
            -[NSObject stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:", v18);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringByAppendingPathExtension:", v12);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v29, "dataUsingEncoding:", 4);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = 0;
            v38 = objc_msgSend(v37, "writeToFile:options:error:", v36, 1073741825, &v45);
            v39 = v45;
            if ((v38 & 1) == 0)
            {
              PLPhotoSharingGetLog();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138413570;
                v47 = v12;
                v48 = 2112;
                v49 = v13;
                v50 = 1024;
                v51 = v8;
                v52 = 2112;
                v53 = v15;
                v54 = 2112;
                v55 = v36;
                v56 = 2112;
                v57 = v39;
                _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_ERROR, "writeDownloadDebugBreadcrumbForAsset:%@ album:%@ step:%i error:%@ failed to write download breadcrumb at path %@ error %@", buf, 0x3Au);
              }

            }
            v20 = v43;
            goto LABEL_48;
          }
          if ((v8 - 210) >= 3)
          {
            if ((_DWORD)v8 == 220)
            {
              v22 = a1;
              v23 = 210;
              goto LABEL_33;
            }
            goto LABEL_27;
          }
        }
        else
        {
          if ((int)v8 <= 289)
          {
            switch((_DWORD)v8)
            {
              case 0xDD:
                v22 = a1;
                v23 = 211;
                goto LABEL_33;
              case 0xE6:
                v22 = a1;
                v23 = 220;
                goto LABEL_33;
              case 0xE7:
                v22 = a1;
                v23 = 221;
                goto LABEL_33;
            }
            goto LABEL_27;
          }
          if ((int)v8 <= 291)
          {
            if ((_DWORD)v8 != 290)
            {
              objc_msgSend(a1, "prefixForBreadcrumbState:", 231);
              v19 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "prefixForBreadcrumbState:", 290);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:
              v24 = v15 != 0;
              v41 = (void *)v19;
              if (!v15 && v19)
              {
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:", v19);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "stringByAppendingPathExtension:", v12);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v25, "removeItemAtPath:error:", v27, 0);
                if (v44)
                {
                  -[NSObject stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v28, "stringByAppendingPathExtension:", v12);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v25, "removeItemAtPath:error:", v27, 0);
                }

                v24 = 0;
              }
              goto LABEL_39;
            }
            v22 = a1;
            v23 = 230;
LABEL_33:
            objc_msgSend(v22, "prefixForBreadcrumbState:", v23);
            v19 = objc_claimAutoreleasedReturnValue();
            v44 = 0;
            goto LABEL_34;
          }
          if ((_DWORD)v8 != 292)
          {
            if ((_DWORD)v8 != 300)
            {
LABEL_27:

              v18 = 0;
              goto LABEL_28;
            }
            goto LABEL_28;
          }
        }
        v22 = a1;
        v23 = 205;
        goto LABEL_33;
      }
      PLPhotoSharingGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v47 = v12;
        v48 = 2112;
        v49 = 0;
        v50 = 1024;
        v51 = v8;
        v52 = 2112;
        v53 = v15;
        v21 = "writeDownloadDebugBreadcrumbForAsset:%@ album:%@ step:%i error:%@ does not have an album GUID to proceed";
        goto LABEL_13;
      }
    }
    else
    {
      PLPhotoSharingGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v47 = 0;
        v48 = 2112;
        v49 = v13;
        v50 = 1024;
        v51 = v8;
        v52 = 2112;
        v53 = v15;
        v21 = "writeDownloadDebugBreadcrumbForAsset:%@ album:%@ step:%i error:%@ does not have an asset GUID to proceed";
LABEL_13:
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x26u);
      }
    }
LABEL_48:

  }
}

+ (void)deleteDebugBreadcrumbsForAlbumGUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3620];
    v5 = a3;
    objc_msgSend(v4, "defaultManager");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "directoryPathForUploadActivityForAlbumGUID:create:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtPath:error:", v6, 0);
    objc_msgSend(a1, "directoryPathForDownloadActivityForAlbumGUID:create:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "removeItemAtPath:error:", v7, 0);
  }
}

+ (BOOL)debugAlwaysStreamSharedVideos
{
  int v2;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  v2 = __debugAlwaysStreamSharedVideos;
  if (__debugAlwaysStreamSharedVideos == -1)
  {
    keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
    if (CFPreferencesGetAppBooleanValue(CFSTR("PSAlwaysStreamSharedVideos"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat))
    {
      v3 = keyExistsAndHasValidFormat == 0;
    }
    else
    {
      v3 = 1;
    }
    v2 = !v3;
    __debugAlwaysStreamSharedVideos = v2;
  }
  return v2 == 1;
}

+ (BOOL)debugDownloadThumbnailsOnly
{
  int v2;
  Boolean keyExistsAndHasValidFormat;

  v2 = __debugDownloadThumbnailsOnly;
  if (__debugDownloadThumbnailsOnly == -1)
  {
    keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
    v2 = CFPreferencesGetAppBooleanValue(CFSTR("PSDownloadThumbnailsOnly"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat) != 0;
    __debugDownloadThumbnailsOnly = v2;
  }
  return v2 == 1;
}

+ (BOOL)debugDownloadMetadataOnly
{
  int v2;
  Boolean keyExistsAndHasValidFormat;

  v2 = __debugDownloadMetadataOnly;
  if (__debugDownloadMetadataOnly == -1)
  {
    keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
    v2 = CFPreferencesGetAppBooleanValue(CFSTR("PSDownloadMetadataOnly"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat) != 0;
    __debugDownloadMetadataOnly = v2;
  }
  return v2 == 1;
}

+ (BOOL)debugDownloadAllDerivatives
{
  int v2;
  Boolean keyExistsAndHasValidFormat;

  v2 = __debugDownloadAllDerivatives;
  if (__debugDownloadAllDerivatives == -1)
  {
    keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
    v2 = CFPreferencesGetAppBooleanValue(CFSTR("PSDownloadAllDerivatives"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat) != 0;
    __debugDownloadAllDerivatives = v2;
  }
  return v2 == 1;
}

+ (BOOL)debugAutoAcceptInvitation
{
  int v2;
  Boolean keyExistsAndHasValidFormat;

  v2 = __debugAutoAcceptInvitation;
  if (__debugAutoAcceptInvitation == -1)
  {
    keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
    v2 = CFPreferencesGetAppBooleanValue(CFSTR("AutoAcceptInvitation"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat) != 0;
    __debugAutoAcceptInvitation = v2;
  }
  return v2 == 1;
}

void __76__PLPhotoSharingHelper_directoryPathForDownloadActivityForAlbumGUID_create___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "photoDirectoryWithType:additionalPathComponents:", 22, CFSTR("DEBUG"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Downloads"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)directoryPathForDownloadActivityForAlbumGUID_create__activityPath;
  directoryPathForDownloadActivityForAlbumGUID_create__activityPath = v2;

}

void __74__PLPhotoSharingHelper_directoryPathForUploadActivityForAlbumGUID_create___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "photoDirectoryWithType:additionalPathComponents:", 22, CFSTR("DEBUG"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Uploads"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)directoryPathForUploadActivityForAlbumGUID_create__activityPath;
  directoryPathForUploadActivityForAlbumGUID_create__activityPath = v2;

}

uint64_t __52__PLPhotoSharingHelper__markStreamVideosAsPurgeable__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Failed to enumerate %@: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  return 1;
}

unint64_t __69__PLPhotoSharingHelper_pruneCloudSharingContentIfNecessaryInLibrary___block_invoke(uint64_t a1)
{
  return +[PLDiskSpaceManagement performCloudSharingSpaceManagementWithBytesToPurge:shouldFreeSpace:shouldKeepRecentlyViewedAssets:fromPhotoLibrary:](PLDiskSpaceManagement, "performCloudSharingSpaceManagementWithBytesToPurge:shouldFreeSpace:shouldKeepRecentlyViewedAssets:fromPhotoLibrary:", -1, 1, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __66__PLPhotoSharingHelper_applicationIsInForeground_photoLibraryURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  int v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_INFO, "about to call connection setIsUIForeground:%@ personID:%@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsUIForeground:forPersonID:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

void __94__PLPhotoSharingHelper_downloadAsset_cloudPlaceholderKind_shouldPrioritize_shouldExtendTimer___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  __int16 v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 74))
  {
    PLPhotoSharingGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "prioritize downloadAsset:%@", buf, 0xCu);
    }

    objc_msgSend(v2, "setFocusAssetCollectionGUID:forPersonID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  if (*(_BYTE *)(a1 + 75))
    objc_msgSend(v2, "setIsUIForeground:forPersonID:", 1, *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__PLPhotoSharingHelper_downloadAsset_cloudPlaceholderKind_shouldPrioritize_shouldExtendTimer___block_invoke_619;
  v10[3] = &unk_1E366EA88;
  v17 = *(_WORD *)(a1 + 72);
  v11 = v2;
  v12 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 64);
  v13 = v7;
  v16 = v8;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 56);
  v9 = v2;
  objc_msgSend(v9, "assetCollectionWithGUID:personID:completionBlock:", v5, v6, v10);

}

void __94__PLPhotoSharingHelper_downloadAsset_cloudPlaceholderKind_shouldPrioritize_shouldExtendTimer___block_invoke_619(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  NSObject *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v3, "assets", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
LABEL_4:
      v9 = 0;
      while (2)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        switch(objc_msgSend(v10, "mediaAssetType"))
        {
          case 2:
            if (*(_WORD *)(a1 + 80) == 3)
              goto LABEL_15;
            goto LABEL_16;
          case 3:
            if (*(_WORD *)(a1 + 80) != 4)
              goto LABEL_16;
            goto LABEL_15;
          case 5:
            if (*(_WORD *)(a1 + 80) != 7)
              goto LABEL_16;
            goto LABEL_15;
          case 7:
            if ((*(_WORD *)(a1 + 80) & 0xFFFE) != 8)
              goto LABEL_16;
LABEL_15:
            v11 = v10;
            if (v11)
            {
              v12 = v11;

              v21 = *(void **)(a1 + 32);
              v33 = v12;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "retrieveAssets:inAlbumWithGUID:personID:", v22, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

              goto LABEL_24;
            }
LABEL_16:
            if (v7 != ++v9)
              continue;
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
            if (!v7)
              goto LABEL_18;
            goto LABEL_4;
          default:
            goto LABEL_16;
        }
      }
    }
LABEL_18:

    PLPhotoSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_opt_class();
      v14 = *(__int16 *)(a1 + 80);
      *(_DWORD *)buf = 138412802;
      v28 = v13;
      v29 = 2112;
      v30 = v4;
      v31 = 1024;
      v32 = v14;
      v15 = v13;
      v16 = "%@ unable to find an asset in assetCollection %@ matching cloudPlaceholderKind %d";
      v17 = v12;
      v18 = 28;
LABEL_22:
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);

    }
  }
  else
  {
    PLPhotoSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_opt_class();
      v20 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      v15 = v19;
      v16 = "%@ unable to find assetCollection with GUID %@, skipping downloading";
      v17 = v12;
      v18 = 22;
      goto LABEL_22;
    }
  }
LABEL_24:

  objc_msgSend(*(id *)(a1 + 64), "stillAlive");
}

void __45__PLPhotoSharingHelper__downloadRequestQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.MobileSlideShow.PLPhotoSharingHelperDownloadRequestQueue", 0);
  v1 = (void *)_downloadRequestQueue_queue;
  _downloadRequestQueue_queue = (uint64_t)v0;

}

void __77__PLPhotoSharingHelper__recentlyRequestedDownloadAsset_cloudPlaceholderKind___block_invoke()
{
  _PLExpirableSet *v0;
  void *v1;

  v0 = -[_PLExpirableSet initWithSecondsToExpire:]([_PLExpirableSet alloc], "initWithSecondsToExpire:", 6.0);
  v1 = (void *)_recentlyRequestedDownloadAsset_cloudPlaceholderKind__recentlyRequestedIdentifiers;
  _recentlyRequestedDownloadAsset_cloudPlaceholderKind__recentlyRequestedIdentifiers = (uint64_t)v0;

}

void __56__PLPhotoSharingHelper_prioritizeDownloadsForAlbumGUID___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "about to call connection setFocusAlbum:%@ personID:%@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D16C50], "album");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGUID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setFocusAlbum:forPersonID:", v6, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "stillAlive");

}

void __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke(id *a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = a1[4];
    v5 = a1[5];
    *(_DWORD *)buf = 138412546;
    v17 = v4;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "about to call connection assetCollectionGUIDsInAlbumWithGUID:%@ personID:%@", buf, 0x16u);
  }

  v6 = a1[4];
  v7 = a1[5];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_602;
  v9[3] = &unk_1E366E9D0;
  v10 = a1[6];
  v11 = a1[7];
  v12 = v2;
  v13 = a1[5];
  v14 = a1[4];
  v15 = a1[8];
  v8 = v2;
  objc_msgSend(v8, "assetCollectionGUIDsInAlbumWithGUID:personID:completionBlock:", v6, v7, v9);

}

void __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_602(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_2;
  v6[3] = &unk_1E366EA20;
  v7 = v3;
  v4 = a1[4];
  v8 = a1[5];
  v9 = a1[4];
  v10 = a1[6];
  v11 = a1[7];
  v12 = a1[8];
  v13 = a1[9];
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

void __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id obj;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v2 != objc_msgSend(*(id *)(a1 + 40), "assetsCount"))
  {
    objc_msgSend(*(id *)(a1 + 40), "assets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", CFSTR("cloudAssetGUID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v4;
    objc_msgSend(v4, "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minusSet:", v6);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v31;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v10);
          objc_msgSend(MEMORY[0x1E0D16C50], "album");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "cloudGUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setGUID:", v13);

          objc_msgSend(*(id *)(a1 + 48), "libraryServicesManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(void **)(a1 + 56);
          v15 = *(void **)(a1 + 64);
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_3;
          v22[3] = &unk_1E366E9F8;
          v23 = v12;
          v17 = v15;
          v24 = v17;
          v25 = v14;
          v26 = *(id *)(a1 + 56);
          v27 = v11;
          v28 = *(id *)(a1 + 72);
          v29 = *(id *)(a1 + 80);
          v18 = v14;
          v19 = v12;
          objc_msgSend(v16, "assetCollectionWithGUID:personID:completionBlock:", v11, v17, v22);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v8);
    }

  }
}

void __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharedAssetSaveJob assetsdProcessMetadataForAssetCollections:inAlbum:personID:info:libraryServicesManager:](PLCloudSharedAssetSaveJob, "assetsdProcessMetadataForAssetCollections:inAlbum:personID:info:libraryServicesManager:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));

  v4 = *(void **)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_4;
  v10[3] = &unk_1E366E9D0;
  v11 = v4;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(void **)(a1 + 72);
  v12 = v7;
  v13 = v8;
  v14 = v9;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 80);
  objc_msgSend(v11, "commentGUIDsForAssetCollectionWithGUID:personID:completionBlock:", v5, v6, v10);

}

void __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD v13[5];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        v9 = *(void **)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        v13[0] = v6;
        v13[1] = 3221225472;
        v13[2] = __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_5;
        v13[3] = &unk_1E366E9A8;
        v11 = *(void **)(a1 + 56);
        v13[4] = *(_QWORD *)(a1 + 48);
        v14 = v11;
        v15 = *(id *)(a1 + 64);
        objc_msgSend(v9, "commentWithGUID:personID:completionBlock:", v8, v10, v13);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }
  objc_msgSend(*(id *)(a1 + 72), "stillAlive");

}

void __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_5(_QWORD *a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharedCommentsJob assetsdLocallyProcessAddedComments:assetGUID:albumGUID:info:libraryServicesManager:](PLCloudSharedCommentsJob, "assetsdLocallyProcessAddedComments:assetGUID:albumGUID:info:libraryServicesManager:", v3, a1[4], a1[5], 0, a1[6]);

}

void __69__PLPhotoSharingHelper_checkServerModelRelationshipsForPhotoLibrary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id obj;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = *(void **)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        v12[0] = v6;
        v12[1] = 3221225472;
        v12[2] = __69__PLPhotoSharingHelper_checkServerModelRelationshipsForPhotoLibrary___block_invoke_2;
        v12[3] = &unk_1E366E958;
        v13 = *(id *)(a1 + 48);
        objc_msgSend(v9, "accessControlWithGUID:personID:completionBlock:", v8, v10, v12);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

void __69__PLPhotoSharingHelper_checkServerModelRelationshipsForPhotoLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "personInfoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phones");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "GUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEmails:phones:forInvitationRecordGUID:", v6, v7, v8);

  objc_msgSend(*(id *)(a1 + 32), "personInfoManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "email");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setFirstName:lastName:fullName:email:forPersonID:", v9, v10, v11, v12, v13);
}

void __86__PLPhotoSharingHelper_temporaryUploadDerivativesPathForCollectionGUID_pathExtension___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "photoDirectoryWithType:additionalPathComponents:", 22, CFSTR("derivatives"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)temporaryUploadDerivativesPathForCollectionGUID_pathExtension__temporaryUploadDerivativesPath;
  temporaryUploadDerivativesPathForCollectionGUID_pathExtension__temporaryUploadDerivativesPath = v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", temporaryUploadDerivativesPathForCollectionGUID_pathExtension__temporaryUploadDerivativesPath, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v4 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v13, *MEMORY[0x1E0C99968], 0);
  v5 = v13;
  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v7 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v12);
    v8 = v12;

    if ((v7 & 1) == 0)
    {
      PLPhotoSharingGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = v10;
        v16 = 2112;
        v17 = v8;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "ERROR: Unable to create directory \"%@\": %@", buf, 0x16u);

      }
      v11 = (void *)temporaryUploadDerivativesPathForCollectionGUID_pathExtension__temporaryUploadDerivativesPath;
      temporaryUploadDerivativesPathForCollectionGUID_pathExtension__temporaryUploadDerivativesPath = 0;

    }
  }

}

void __97__PLPhotoSharingHelper__videoDerivativeForVideoAtURL_outputURL_withPreset_reason_outputFileType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  double v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PLPhotoSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v31 = v6;
      v32 = 2112;
      v33 = v7;
      v34 = 2112;
      v35 = v4;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "could not generate video derivative for %@ to %@: %@", buf, 0x20u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v8, "attributesOfItemAtPath:error:", v9, &v29);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v29;

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v10, "fileSize"));
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v5, "setObject:forKey:", v12, *MEMORY[0x1E0D16FC0]);
    }
    else
    {
      PLPhotoSharingGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v31 = v13;
        v32 = 2112;
        v33 = v11;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "could not get file attributes for %@: %@", buf, 0x16u);
      }
    }

    objc_msgSend(MEMORY[0x1E0D16C70], "asset");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPath:", v18);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setType:", *(_QWORD *)(a1 + 48));
    +[PLManagedAsset dimensionsForVideoAtURL:](PLManagedAsset, "dimensionsForVideoAtURL:", *(_QWORD *)(a1 + 40));
    v20 = v19;
    v22 = v21;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v5, "setObject:forKey:", v23, *MEMORY[0x1E0D16FD0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v5, "setObject:forKey:", v24, *MEMORY[0x1E0D16FC8]);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setMetadata:", v5);
    PLPhotoSharingGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = *(_QWORD *)(a1 + 40);
      v27 = *(void **)(a1 + 56);
      v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138413314;
      v31 = v26;
      v32 = 2112;
      v33 = v27;
      v34 = 2048;
      v35 = v20;
      v36 = 2048;
      v37 = v22;
      v38 = 2112;
      v39 = v28;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_INFO, "generated video derivative to %@ with videoPresetName %@ dimensions (%f,%f) for MSAsset %@", buf, 0x34u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __78__PLPhotoSharingHelper_videoDerivativesForAssetCollection_withSpecifications___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  double v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PLPhotoSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      v8 = *(double *)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      v26 = v6;
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "could not generate video posterframe at %@ for video URL %@ collection %@ error %@", buf, 0x2Au);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v24 = 0;
    objc_msgSend(v9, "attributesOfItemAtPath:error:", v10, &v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v24;
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v11, "fileSize"));
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v5, "setObject:forKey:", v13, *MEMORY[0x1E0D16FC0]);
    }
    else
    {
      PLPhotoSharingGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v26 = v14;
        v27 = 2112;
        v28 = v12;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "could not get file attributes for %@: %@", buf, 0x16u);
      }
    }

    objc_msgSend(MEMORY[0x1E0D16C70], "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPath:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v15, "setType:", CFSTR("public.jpeg"));
    objc_msgSend(v15, "setMediaAssetType:", 5);
    objc_msgSend(MEMORY[0x1E0D11620], "sizeOfImageAtURL:orientationOut:", *(_QWORD *)(a1 + 64), 0);
    v17 = v16;
    v19 = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v5, "setObject:forKey:", v20, *MEMORY[0x1E0D16FD0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v5, "setObject:forKey:", v21, *MEMORY[0x1E0D16FC8]);

    objc_msgSend(v15, "setMetadata:", v5);
    objc_msgSend(*(id *)(a1 + 72), "addObject:", v15);
    PLPhotoSharingGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      v26 = v23;
      v27 = 2048;
      v28 = v17;
      v29 = 2048;
      v30 = v19;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "generated video poster frame to %@ dimensions (%f,%f) with MSAsset %@", buf, 0x2Au);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));

}

void __78__PLPhotoSharingHelper_markPendingInvitationAsSpamForAlbum_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  if (!v3)
  {
    v6[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs:](PLCloudSharedDeleteAlbumsJob, "deleteLocalAlbumsForMSASAlbumGUIDs:", v5);

  }
}

void __78__PLPhotoSharingHelper_markPendingInvitationAsSpamForAlbum_completionHandler___block_invoke_556(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  if (!v3)
  {
    PLPhotoSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "will call -[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs:albumGUIDs:] with arguments %@", buf, 0xCu);

    }
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs:](PLCloudSharedDeleteAlbumsJob, "deleteLocalAlbumsForMSASAlbumGUIDs:", v7);

  }
}

void __74__PLPhotoSharingHelper_acceptPendingInvitationForAlbum_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCloudRelationshipState:", v2);

}

uint64_t __74__PLPhotoSharingHelper_acceptPendingInvitationForAlbum_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __74__PLPhotoSharingHelper_acceptPendingInvitationForAlbum_completionHandler___block_invoke_554(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __77__PLPhotoSharingHelper_sendPendingInvitationsForAlbum_resendInvitationGUIDs___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "invitationRecords");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v38 = v3;
    v39 = 2048;
    v40 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_INFO, "found plAlbum %@ with invitationRecords %lu", buf, 0x16u);

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "invitationRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v33;
    *(_QWORD *)&v7 = 138412290;
    v31 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        PLPhotoSharingGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v31;
          v38 = v11;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "invitation record %@", buf, 0xCu);
        }

        objc_msgSend(v11, "invitationState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "intValue") == 1)
        {

        }
        else
        {
          v14 = *(_QWORD *)(a1 + 40);

          if (!v14)
            continue;
        }
        v15 = *(void **)(a1 + 40);
        if (v15)
        {
          objc_msgSend(v11, "cloudGUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "containsObject:", v16);

          if (!v17)
            continue;
        }
        PLPhotoSharingGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "record state is kMSASRelationshipStatePending, will send invitation", buf, 2u);
        }

        v19 = objc_alloc_init(MEMORY[0x1E0D16C68]);
        objc_msgSend(v11, "cloudGUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setGUID:", v20);

        objc_msgSend(v11, "inviteeEmails");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setEmails:", v21);

        objc_msgSend(v11, "inviteePhones");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setPhones:", v22);

        objc_msgSend(v11, "inviteeFirstName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setFirstName:", v23);

        objc_msgSend(v11, "inviteeLastName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setLastName:", v24);

        objc_msgSend(v11, "inviteeFullName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setFullName:", v25);

        objc_msgSend(v11, "inviteeHashedPersonID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setPersonID:", v26);

        objc_msgSend(v19, "setState:", 1);
        v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (!v27)
        {
          v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v29 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v30 = *(void **)(v29 + 40);
          *(_QWORD *)(v29 + 40) = v28;

          v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        }
        objc_msgSend(v27, "addObject:", v19, v31);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v8);
  }

}

void __77__PLPhotoSharingHelper_sendPendingInvitationsForAlbum_resendInvitationGUIDs___block_invoke_553(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      v5 = (void *)objc_opt_class();
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v7 = *(void **)(a1 + 32);
      v8 = v5;
      objc_msgSend(v7, "cloudGUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v18 = 138413058;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "%@: about to call connection addAccessControlEntries: %@ toAlbumWithGUID: %@ forPersonID %@", (uint8_t *)&v18, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "cloudGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addAccessControlEntries:toAlbumWithGUID:personID:](v11, "addAccessControlEntries:toAlbumWithGUID:personID:", v12, v13, *(_QWORD *)(a1 + 40));

LABEL_5:
    return;
  }
  if (v4)
  {
    v18 = 138412290;
    v19 = (id)objc_opt_class();
    v14 = v19;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "%@: no sharing invitations to send", (uint8_t *)&v18, 0xCu);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    PLPhotoSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class();
      v16 = *(_QWORD *)(a1 + 48);
      v18 = 138412546;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      v17 = v15;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "%@: failed to find invitation GUIDs %@ to resend", (uint8_t *)&v18, 0x16u);

    }
    goto LABEL_5;
  }
}

void __77__PLPhotoSharingHelper_requestVideoPlaybackURLForAsset_videoType_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  PLPhotoSharingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138413314;
    v26 = v11;
    v27 = 2112;
    v28 = v12;
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v9;
    v33 = 2112;
    v34 = v7;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "completion block for videoURLForAssetCollectionWithGUID:%@ personID:%@ result %@ expiration %@ error %@", buf, 0x34u);
  }

  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __77__PLPhotoSharingHelper_requestVideoPlaybackURLForAsset_videoType_completion___block_invoke_548;
  v20[3] = &unk_1E3677998;
  v14 = *(void **)(a1 + 48);
  v21 = *(id *)(a1 + 56);
  v22 = v8;
  v23 = v9;
  v24 = v7;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __77__PLPhotoSharingHelper_requestVideoPlaybackURLForAsset_videoType_completion___block_invoke_2;
  v18[3] = &unk_1E3676CD8;
  v19 = *(id *)(a1 + 64);
  v15 = v7;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v14, "performBlock:completionHandler:", v20, v18);

}

uint64_t __77__PLPhotoSharingHelper_requestVideoPlaybackURLForAsset_videoType_completion___block_invoke_548(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCachedNonPersistedVideoPlaybackURL:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setCachedNonPersistedVideoPlaybackURLExpiration:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setCachedNonPersistedVideoPlaybackURLError:", *(_QWORD *)(a1 + 56));
}

uint64_t __77__PLPhotoSharingHelper_requestVideoPlaybackURLForAsset_videoType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  id v37;
  int v38;
  NSObject *v39;
  id v40;
  dispatch_semaphore_t v41;
  void *v42;
  id v43;
  NSObject *v44;
  BOOL v45;
  NSObject *v46;
  uint64_t v47;
  char v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  char v59;
  _BOOL4 v60;
  NSObject *v61;
  uint64_t v62;
  int v63;
  id v64;
  id v65;
  uint64_t v66;
  void *v67;
  id v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73;
  void *v74;
  char v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  int v92;
  NSObject *v93;
  NSObject *v94;
  NSObject *v95;
  const char *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  NSObject *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  NSObject *v119;
  void *v120;
  void *v121;
  NSObject *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  int v133;
  void *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  id v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  __CFString *v162;
  id v163;
  id obj;
  unsigned int v165;
  _BOOL4 v166;
  uint64_t v167;
  uint64_t v168;
  void *context;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  id v180;
  _BYTE v182[24];
  _BYTE v183[24];
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  __int128 v190;
  uint64_t v191;
  __int128 v192;
  uint64_t v193;
  _QWORD v194[4];
  id v195;
  id v196;
  NSObject *v197;
  __int128 v198;
  _BYTE *v199;
  id v200;
  id v201;
  id v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  _QWORD v207[4];
  id v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  uint64_t v213;
  void *v214;
  uint64_t v215;
  void *v216;
  _QWORD v217[2];
  _QWORD v218[2];
  _QWORD v219[2];
  _QWORD v220[2];
  _QWORD v221[2];
  _QWORD v222[2];
  _BYTE buf[24];
  void *v224;
  uint64_t v225;
  void *v226;
  _BYTE v227[128];
  _BYTE v228[128];
  uint64_t v229;
  void *v230;
  uint64_t v231;
  _QWORD v232[4];

  v232[1] = *MEMORY[0x1E0C80C00];
  +[PLPhotoSharingHelper sharingPersonID](PLPhotoSharingHelper, "sharingPersonID");
  v162 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isUnitTesting"))
  {

    v162 = CFSTR("UnitTestID");
  }
  else if (!v162)
  {
    v148 = (void *)MEMORY[0x1E0CB35C8];
    v231 = *MEMORY[0x1E0CB2938];
    v232[0] = CFSTR("sharingPersonID is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v232, &v231, 1);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photolibraryservices"), 4, v149);
    v150 = objc_claimAutoreleasedReturnValue();
    v151 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v152 = *(void **)(v151 + 40);
    *(_QWORD *)(v151 + 40) = v150;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
    return;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 136))
      +[PLPhotoSharingHelper publishCloudSharedAlbumToServer:](PLPhotoSharingHelper, "publishCloudSharedAlbumToServer:");
    +[PLManagedAsset assetsWithUUIDs:options:inLibrary:](PLManagedAsset, "assetsWithUUIDs:options:inLibrary:", *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 32));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "count");
    if (v2 != objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      PLPhotoSharingGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = objc_msgSend(v1, "count");
        v5 = objc_msgSend(*(id *)(a1 + 48), "count");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v4;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v5;
        _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "ERROR: Only found %lu originalAssets, expected %lu", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v211 = 0u;
    v212 = 0u;
    v209 = 0u;
    v210 = 0u;
    obj = v1;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v209, v228, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v210;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v210 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * i);
          objc_msgSend(v9, "uuid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v177, "setObject:forKey:", v9, v10);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v209, v228, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "mutableAssets");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = objc_msgSend(*(id *)(a1 + 56), "length");
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 64);
    v207[0] = MEMORY[0x1E0C809B0];
    v207[1] = 3221225472;
    v207[2] = __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke_501;
    v207[3] = &unk_1E366F438;
    v153 = v11;
    v208 = v153;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v207);
    v13 = *(id *)(a1 + 48);
    v203 = 0u;
    v204 = 0u;
    v205 = 0u;
    v206 = 0u;
    v163 = v13;
    v168 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v203, v227, 16);
    if (v168)
    {
      v167 = *(_QWORD *)v204;
      v161 = *MEMORY[0x1E0CB2938];
      v155 = (void *)*MEMORY[0x1E0C89EA8];
      v154 = *MEMORY[0x1E0C8A2E0];
      v160 = *MEMORY[0x1E0CB3388];
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v204 != v167)
          {
            v15 = v14;
            objc_enumerationMutation(v163);
            v14 = v15;
          }
          v176 = v14;
          v16 = *(_QWORD *)(*((_QWORD *)&v203 + 1) + 8 * v14);
          objc_msgSend(v177, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            context = (void *)MEMORY[0x19AEC1554]();
            v18 = objc_msgSend(v17, "isVideo");
            v165 = objc_msgSend(v17, "playbackVariation");
            v19 = *(void **)(a1 + 72);
            objc_msgSend(v17, "uuid");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKey:", v20);
            v170 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = *(void **)(a1 + 80);
            objc_msgSend(v17, "uuid");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKey:", v22);
            v178 = (void *)objc_claimAutoreleasedReturnValue();

            if (v178)
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
              v180 = (id)objc_claimAutoreleasedReturnValue();
              PLPhotoSharingGetLog();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v180;
                _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Original video is trimmed, use the trimmed file %@", buf, 0xCu);
              }
              v179 = 0;
              v173 = 0;
              v166 = 0;
LABEL_28:
              v24 = 1;
LABEL_29:

              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "UUIDString");
              v175 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v180, "pathExtension");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "cloudGUID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "pathManager");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLCloudSharedAssetSaveJob nextDCIMSaveFileURLForCloudPersonID:cloudAlbumGUID:pathManager:fileExtension:assetUUID:](PLCloudSharedAssetSaveJob, "nextDCIMSaveFileURLForCloudPersonID:cloudAlbumGUID:pathManager:fileExtension:assetUUID:", v162, v26, v27, v171, v175);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v179)
              {
                objc_msgSend(v28, "URLByDeletingLastPathComponent");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "lastPathComponent");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "stringByDeletingPathExtension");
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v179, "pathExtension");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "uppercaseString");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "stringByAppendingPathExtension:", v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v29, "URLByAppendingPathComponent:", v34);
                v172 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v172 = 0;
              }
              if (v178)
                v38 = 1;
              else
                v38 = v18 ^ 1;
              if (((v24 | v38) & 1) != 0
                || !objc_msgSend(v17, "isDefaultAdjustedSlomo")
                || !objc_msgSend(v17, "isPlayableVideo:", 0))
              {
                if (v24)
                {
                  PLPhotoSharingGetLog();
                  v46 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v180;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v28;
                    _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_DEFAULT, "Moving result from %@ to %@", buf, 0x16u);
                  }

                  v47 = *(_QWORD *)(a1 + 88);
                  v189 = 0;
                  v48 = objc_msgSend(MEMORY[0x1E0D73208], "secureMoveItemAtURL:toURL:capabilities:error:", v180, v28, v47, &v189);
                  v49 = v189;
                  if ((v48 & 1) == 0)
                  {
                    v50 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v180, "path");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "path");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "stringWithFormat:", CFSTR("Unable to move \"%@\" to \"%@\": %@"), v51, v52, v49);
                    v53 = (void *)objc_claimAutoreleasedReturnValue();

                    v54 = (void *)MEMORY[0x1E0CB35C8];
                    v221[0] = v161;
                    v221[1] = v160;
                    v222[0] = v53;
                    v222[1] = v49;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v222, v221, 2);
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photolibraryservices"), 8, v55);
                    v56 = objc_claimAutoreleasedReturnValue();
                    v57 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
                    v58 = *(void **)(v57 + 40);
                    *(_QWORD *)(v57 + 40) = v56;

                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
                    goto LABEL_96;
                  }
                }
                else
                {
                  v188 = 0;
                  v59 = objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v180, v28, &v188);
                  v49 = v188;
                  if ((v59 & 1) == 0)
                  {
                    v83 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v180, "path");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "path");
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v83, "stringWithFormat:", CFSTR("Unable to copy \"%@\" to \"%@\": %@"), v84, v85, v49);
                    v86 = (void *)objc_claimAutoreleasedReturnValue();

                    v87 = (void *)MEMORY[0x1E0CB35C8];
                    v219[0] = v161;
                    v219[1] = v160;
                    v220[0] = v86;
                    v220[1] = v49;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v220, v219, 2);
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photolibraryservices"), 8, v88);
                    v89 = objc_claimAutoreleasedReturnValue();
                    v90 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
                    v91 = *(void **)(v90 + 40);
                    *(_QWORD *)(v90 + 40) = v89;

                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
                    goto LABEL_96;
                  }
                }

                goto LABEL_52;
              }
              PLPhotoSharingGetLog();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v28;
                _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "Original is a slow-mo, flatten the video to %@", buf, 0xCu);
              }

              v40 = v155;
              v41 = dispatch_semaphore_create(0);
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              LOBYTE(v224) = 0;
              +[PLSlalomUtilities videoAVObjectBuilderForManagedAsset:applyVideoAdjustments:](PLSlalomUtilities, "videoAVObjectBuilderForManagedAsset:applyVideoAdjustments:", v17, 1);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v194[0] = MEMORY[0x1E0C809B0];
              v194[1] = 3221225472;
              v194[2] = __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke_512;
              v194[3] = &unk_1E366E850;
              v195 = v180;
              v43 = v28;
              v196 = v43;
              v198 = *(_OWORD *)(a1 + 104);
              v199 = buf;
              v44 = v41;
              v197 = v44;
              v192 = *MEMORY[0x1E0CA2E68];
              v193 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
              v190 = v192;
              v191 = v193;
              +[PLVideoTranscoder transcodeVideoWithObjectBuilder:outputURL:startTime:endTime:presetName:outputFileType:metadata:completionHandler:](PLVideoTranscoder, "transcodeVideoWithObjectBuilder:outputURL:startTime:endTime:presetName:outputFileType:metadata:completionHandler:", v42, v43, &v192, &v190, v40, v154, 0, v194);
              dispatch_semaphore_wait(v44, 0xFFFFFFFFFFFFFFFFLL);
              v45 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) == 0;

              _Block_object_dispose(buf, 8);
              if (v45)
              {
LABEL_52:
                v60 = v166;
                if (!v172)
                  v60 = 0;
                if (v60)
                {
                  PLPhotoSharingGetLog();
                  v61 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v179;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v172;
                    _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_DEFAULT, "Moving video complement from %@ to %@, for an in-place video complement creation later", buf, 0x16u);
                  }

                  v62 = *(_QWORD *)(a1 + 88);
                  v187 = 0;
                  v63 = objc_msgSend(MEMORY[0x1E0D73208], "secureMoveItemAtURL:toURL:capabilities:error:", v179, v172, v62, &v187);
                  v64 = v187;
                  if (v63)
                  {
                    v65 = v172;

                    v179 = v65;
                    v66 = 2;
                    goto LABEL_60;
                  }
                  v104 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v179, "path");
                  v105 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v172, "path");
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v104, "stringWithFormat:", CFSTR("Unable to move \"%@\" to \"%@\": %@"), v105, v106, v64);
                  v107 = (void *)objc_claimAutoreleasedReturnValue();

                  v108 = (void *)MEMORY[0x1E0CB35C8];
                  v217[0] = v161;
                  v217[1] = v160;
                  v218[0] = v107;
                  v218[1] = v64;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v218, v217, 2);
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v108, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photolibraryservices"), 8, v109);
                  v110 = objc_claimAutoreleasedReturnValue();
                  v111 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
                  v112 = *(void **)(v111 + 40);
                  *(_QWORD *)(v111 + 40) = v110;

                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
                  goto LABEL_96;
                }
                v66 = 0;
LABEL_60:
                if (v173)
                {
                  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  v186 = 0;
                  objc_msgSend(v67, "removeItemAtURL:error:", v173, &v186);
                  v68 = v186;

                  if (v68)
                  {
                    PLPhotoSharingGetLog();
                    v69 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)&buf[4] = v173;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v68;
                      _os_log_impl(&dword_199541000, v69, OS_LOG_TYPE_DEFAULT, "Unable to opportunistically clean up temporary directory: \"%@\" Error: %@", buf, 0x16u);
                    }

                  }
                }
                *(_QWORD *)&v192 = 0;
                v70 = *(_QWORD *)(a1 + 32);
                v71 = objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForCloudSharedAsset");
                v185 = 0;
                +[PLManagedAsset insertAssetIntoPhotoLibrary:mainFileURL:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:](PLManagedAsset, "insertAssetIntoPhotoLibrary:mainFileURL:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:", v70, v28, v71, 2, v175, 0, &v192, &v185);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = v185;
                +[PLPhotoSharingHelper photoSharingOriginalFilenameForAsset:](PLPhotoSharingHelper, "photoSharingOriginalFilenameForAsset:", v17);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "setOriginalFilename:", v74);

                if (v72)
                {
                  if (objc_msgSend(v72, "isVideo"))
                  {
                    v184 = 0;
                    v75 = objc_msgSend(v72, "isPlayableVideo:", &v184);
                    v76 = v184;
                    v174 = v76;
                    if ((v75 & 1) == 0)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't play new asset for file at %@, with codec: %@"), v28, v76);
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      v78 = (void *)MEMORY[0x1E0CB35C8];
                      v213 = v161;
                      v214 = v77;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v214, &v213, 1);
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v78, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photolibraryservices"), 9, v79);
                      v80 = objc_claimAutoreleasedReturnValue();
                      v81 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
                      v82 = *(void **)(v81 + 40);
                      *(_QWORD *)(v81 + 40) = v80;

                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
LABEL_95:

                      v173 = 0;
                      goto LABEL_96;
                    }
                  }
                  else
                  {
                    v174 = 0;
                  }
                  objc_msgSend(v72, "setVisibilityState:", 2);
                  PLPhotoSharingGetLog();
                  v113 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v16;
                    _os_log_impl(&dword_199541000, v113, OS_LOG_TYPE_DEFAULT, "Generating new thumbnails for asset with UUID %@", buf, 0xCu);
                  }

                  objc_msgSend(v72, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, (_QWORD)v192, v73, 1);
                  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "additionalAttributes");
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v115, "originalFilename");
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v72, "additionalAttributes");
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v117, "setOriginalFilename:", v116);

                  objc_msgSend(v72, "setCloudAssetGUID:", v114);
                  objc_msgSend(v72, "setCloudBatchID:", v158);
                  objc_msgSend(v72, "setCloudBatchPublishDate:", v159);
                  objc_msgSend(v72, "setCloudPlaceholderKind:", 5);
                  objc_msgSend(v72, "setCloudIsMyAsset:", 1);
                  objc_msgSend(v72, "setCloudIsDeletable:", 1);
                  objc_msgSend(v72, "setPlaybackVariationAndLoopingPlaybackStyleWithPlaybackVariation:", v165);
                  if ((v38 & 1) == 0)
                  {
                    objc_msgSend(v17, "uuid");
                    v118 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v72, "setOriginalAssetsUUID:", v118);

                    PLPhotoSharingGetLog();
                    v119 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v72, "originalAssetsUUID");
                      v120 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v120;
                      _os_log_impl(&dword_199541000, v119, OS_LOG_TYPE_DEFAULT, "Saved original video uuid %@ for later playback", buf, 0xCu);

                    }
                  }
                  if (v179)
                  {
                    objc_msgSend(v17, "mediaGroupUUID");
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "photoIrisVideoDuration");
                    objc_msgSend(v17, "photoIrisStillDisplayTime");
                    objc_msgSend(v72, "becomePhotoIrisWithMediaGroupUUID:mainFileMetadata:videoURL:videoDuration:stillDisplayTime:options:", v121, 0, v179, v183, v182, v66);

                  }
                  objc_msgSend(v157, "addObject:", v72);
                  PLPhotoSharingGetLog();
                  v122 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v28, "path");
                    v123 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    *(_QWORD *)&buf[4] = v180;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v123;
                    *(_WORD *)&buf[22] = 2112;
                    v224 = v114;
                    _os_log_impl(&dword_199541000, v122, OS_LOG_TYPE_DEFAULT, "Created copy of original asset at %@ to %@ and assigned it new cloudAssetGUID %@", buf, 0x20u);

                  }
                  objc_msgSend(*(id *)(a1 + 96), "addObject:", v72);
                  if (v156 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40))
                  {
                    +[PLCloudSharedComment insertNewCommentIntoAsset:commentDate:withText:isLike:isMyComment:inLibrary:](PLCloudSharedComment, "insertNewCommentIntoAsset:commentDate:withText:isLike:isMyComment:inLibrary:", v72, 0, *(_QWORD *)(a1 + 56), 0, 1, *(_QWORD *)(a1 + 32));
                    v124 = objc_claimAutoreleasedReturnValue();
                    v125 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
                    v126 = *(void **)(v125 + 40);
                    *(_QWORD *)(v125 + 40) = v124;

                    v127 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
                    v128 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v127, "setIsCaption:", v128);

                    v129 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
                    v130 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v129, "setIsBatchComment:", v130);

                  }
                  +[PLResourceInstaller installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:](PLResourceInstaller, "installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:", v72, 1, 0, 0);

                  goto LABEL_95;
                }
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't insert new asset for file at %@"), v28);
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = (void *)MEMORY[0x1E0CB35C8];
                v215 = v161;
                v216 = v174;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v216, &v215, 1);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photolibraryservices"), 9, v100);
                v101 = objc_claimAutoreleasedReturnValue();
                v102 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
                v103 = *(void **)(v102 + 40);
                *(_QWORD *)(v102 + 40) = v101;

                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
                goto LABEL_95;
              }
LABEL_96:

              v98 = v173;
LABEL_97:

              objc_autoreleasePoolPop(context);
              goto LABEL_98;
            }
            if (v170)
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
              v23 = objc_claimAutoreleasedReturnValue();
              v35 = *(void **)(a1 + 128);
              v202 = 0;
              v201 = 0;
              v36 = objc_msgSend(v35, "_retrieveURLsFromAssetWithUUID:withExportedFileURL:primaryURL:videoComplementURL:", v16, v23, &v202, &v201);
              v180 = v202;
              v37 = v201;
              if (v36)
              {
                v179 = v37;
                v166 = v37 != 0;
                -[NSObject URLByDeletingLastPathComponent](v23, "URLByDeletingLastPathComponent");
                v173 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_28;
              }
              v97 = v37;

              v98 = v180;
              goto LABEL_97;
            }
            v92 = objc_msgSend(v17, "isLoopingVideo");
            if (v92)
            {
              PLPhotoSharingGetLog();
              v93 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v165;
                _os_log_impl(&dword_199541000, v93, OS_LOG_TYPE_DEFAULT, "Sharing looping video with playback variation %ld", buf, 0xCu);
              }

              if (v18)
              {
                objc_msgSend(v17, "pathForVideoFile");
                v23 = objc_claimAutoreleasedReturnValue();
                PLPhotoSharingGetLog();
                v94 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v23;
                  v95 = v94;
                  v96 = "Original is a looping video, use the original file %@";
                  goto LABEL_110;
                }
LABEL_111:

                if (v23)
                {
                  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v23, 0);
                  v180 = (id)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v17, "canPlayPhotoIris")
                    && (objc_msgSend(v17, "uuid"),
                        v132 = (void *)objc_claimAutoreleasedReturnValue(),
                        v133 = objc_msgSend(v153, "containsObject:", v132),
                        v132,
                        ((v92 | v133) & 1) == 0))
                  {
                    objc_msgSend(*(id *)(a1 + 128), "_videoComplementURLForSharingFromAsset:", v17);
                    v179 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v179 = 0;
                  }
                  v173 = 0;
                  v166 = 0;
                  v24 = 0;
                  goto LABEL_29;
                }
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No local file path on disk to support sharing asset %@"), v16);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v134 = (void *)MEMORY[0x1E0CB35C8];
                v225 = v161;
                v226 = v98;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v226, &v225, 1);
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v134, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photolibraryservices"), 6, v135);
                v136 = objc_claimAutoreleasedReturnValue();
                v137 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
                v138 = *(void **)(v137 + 40);
                *(_QWORD *)(v137 + 40) = v136;

                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
                goto LABEL_97;
              }
              objc_msgSend(v17, "pathForFullsizeRenderVideoFile");
              v23 = objc_claimAutoreleasedReturnValue();
              PLPhotoSharingGetLog();
              v94 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                goto LABEL_111;
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v23;
              v95 = v94;
              v96 = "Original is a regular photo, use the full size render video file %@";
            }
            else if ((v18 & 1) != 0)
            {
              if ((objc_msgSend(v17, "isPlayableVideo:", 0) & 1) != 0)
                objc_msgSend(v17, "pathForVideoFile");
              else
                objc_msgSend(v17, "pathForMediumVideoFile");
              v23 = objc_claimAutoreleasedReturnValue();
              PLPhotoSharingGetLog();
              v94 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                goto LABEL_111;
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v23;
              v95 = v94;
              v96 = "Original is a video, use the video file %@";
            }
            else
            {
              v200 = 0;
              v131 = +[PLResourceChooser fileReservationForLargeDisplayableImageFileForAsset:format:allowMetadataSnapshot:forceLarge:outFilePath:outImageType:](PLResourceChooser, "fileReservationForLargeDisplayableImageFileForAsset:format:allowMetadataSnapshot:forceLarge:outFilePath:outImageType:", v17, 0, 0, 1, &v200, 0);
              v23 = v200;
              PLPhotoSharingGetLog();
              v94 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                goto LABEL_111;
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v23;
              v95 = v94;
              v96 = "Original is not a video, use the large displayable image file %@";
            }
LABEL_110:
            _os_log_impl(&dword_199541000, v95, OS_LOG_TYPE_DEFAULT, v96, buf, 0xCu);
            goto LABEL_111;
          }
LABEL_98:

          v14 = v176 + 1;
        }
        while (v168 != v176 + 1);
        v139 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v203, v227, 16);
        v168 = v139;
      }
      while (v139);
    }

    objc_msgSend(*(id *)(a1 + 40), "updateCloudLastInterestingChangeDateWithDate:", v159);
    objc_msgSend(*(id *)(a1 + 40), "updateCloudLastContributionDateWithDate:", v159);

  }
  else
  {
    v140 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(0, "cloudGUID");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "stringWithFormat:", CFSTR("Couldn't find album with cloud GUID %@ to publish assets from"), v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();

    v143 = (void *)MEMORY[0x1E0CB35C8];
    v229 = *MEMORY[0x1E0CB2938];
    v230 = v142;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v230, &v229, 1);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photolibraryservices"), 5, v144);
    v145 = objc_claimAutoreleasedReturnValue();
    v146 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v147 = *(void **)(v146 + 40);
    *(_QWORD *)(v146 + 40) = v145;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
  }
}

uint64_t __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke_528(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "isUnitTesting");
    if ((result & 1) == 0)
    {
      result = objc_msgSend(*(id *)(a1 + 64), "enqueueCloudSharedAssetsForPublishToServer:inSharedAlbum:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        return objc_msgSend(*(id *)(a1 + 64), "publishCloudSharedCommentToServer:");
    }
  }
  return result;
}

void __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke_501(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("useStillImageOnly"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

void __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke_512(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Could not generate trimmed video for %@ to %@ error %@"), v6, v7, v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB3388];
    v21[0] = *MEMORY[0x1E0CB2938];
    v21[1] = v10;
    v22[0] = v8;
    v22[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photolibraryservices"), 7, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  else
  {
    PLPhotoSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "generated trimmed video of %@ to %@ ", buf, 0x16u);

    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __80__PLPhotoSharingHelper_updateCloudSharedAlbumMultipleContributorsStateOnServer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  int v7;
  char v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  char v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "setMultipleContributorsEnabled completionBlock error:%@", buf, 0xCu);
  }

  v5 = (char *)(a1 + 40);
  if (v3)
  {
    PLPhotoSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *v5;
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "ERROR: couldn't set multipleContributors to %i", buf, 8u);
    }

    v5 = (char *)(a1 + 41);
  }
  v8 = *v5;
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__PLPhotoSharingHelper_updateCloudSharedAlbumMultipleContributorsStateOnServer___block_invoke_488;
  v10[3] = &unk_1E36762F8;
  v11 = *(id *)(a1 + 32);
  v12 = v8;
  objc_msgSend(v9, "performTransaction:completionHandler:", v10, &__block_literal_global_489);

}

void __80__PLPhotoSharingHelper_updateCloudSharedAlbumMultipleContributorsStateOnServer___block_invoke_488(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCloudMultipleContributorsEnabled:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudMultipleContributorsEnabledLocal:", v5);

}

void __69__PLPhotoSharingHelper_updateCloudSharedAlbumPublicURLStateOnServer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  int v7;
  char v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  char v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "setPublicAccessEnabled completionBlock error:%@", buf, 0xCu);
  }

  v5 = (char *)(a1 + 40);
  if (v3)
  {
    PLPhotoSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *v5;
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "ERROR: couldn't set publicAccess to %i", buf, 8u);
    }

    v5 = (char *)(a1 + 41);
  }
  v8 = *v5;
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PLPhotoSharingHelper_updateCloudSharedAlbumPublicURLStateOnServer___block_invoke_485;
  v10[3] = &unk_1E36762F8;
  v11 = *(id *)(a1 + 32);
  v12 = v8;
  objc_msgSend(v9, "performTransaction:completionHandler:", v10, &__block_literal_global_486);

}

void __69__PLPhotoSharingHelper_updateCloudSharedAlbumPublicURLStateOnServer___block_invoke_485(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCloudPublicURLEnabled:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudPublicURLEnabledLocal:", v5);

}

void __73__PLPhotoSharingHelper_updateSharedAlbumsCachedServerConfigurationLimits__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v23 = v5;
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "(server-configuration) serverSideConfigurationDictionaryForPersonID:%@ returned %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_pathToServerConfigurationCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtPath:error:", v6, 0);
  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoDirectoryWithType:", 22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:isDirectory:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v12 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v21, *MEMORY[0x1E0C99968], 0);
  v13 = v21;
  v14 = 0;
  if ((v12 & 1) == 0)
  {
    v20 = 0;
    v15 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v20);
    v14 = v20;
    if ((v15 & 1) == 0)
    {
      PLPhotoSharingGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v17;
        v24 = 2112;
        v25 = v14;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "(server-configuration) ERROR: Unable to create directory \"%@\": %@", buf, 0x16u);

      }
    }
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 100, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  if ((objc_msgSend(v18, "writeToFile:options:error:", v6, 1073741825, 0) & 1) == 0)
  {
    PLPhotoSharingGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v23 = v3;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v14;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "(server-configuration) ERROR: Unable to write serverconfiguration %@ to file %@: %@", buf, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "_resetServerSideConfigurationDictionary");

}

void __41__PLPhotoSharingHelper_streamdVideoCache__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v0, "photoDirectoryWithType:createIfNeeded:error:", 24, 1, &v9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v9;

  if (v2)
  {
    PLPhotoSharingGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v1;
      v12 = 2112;
      v13 = v2;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Failed to create streamdVideoCache %@: %@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v1;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "Setting AVAsset cache to %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C8AF98], "assetCacheForProgressiveDownloadAndHTTPLiveStreamingWithURL:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)streamdVideoCache_cache;
  streamdVideoCache_cache = v6;

  v8 = objc_msgSend(MEMORY[0x1E0D731D8], "diskSpaceAvailableForPath:", v1);
  objc_msgSend((id)streamdVideoCache_cache, "setMaxSize:", (uint64_t)fmin((double)v8 * 0.1, 1073741820.0));
  objc_msgSend((id)streamdVideoCache_cache, "enableAutomaticCacheSizeManagement");
  objc_msgSend((id)streamdVideoCache_cache, "setMaxEntrySize:", 52428800);

}

id __44__PLPhotoSharingHelper_initializeMSPlatform__block_invoke()
{
  NSObject *v0;
  uint8_t v2[16];

  PLPhotoSharingGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_199541000, v0, OS_LOG_TYPE_INFO, "initializeMSPlatform", v2, 2u);
  }

  return (id)objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
}

@end
