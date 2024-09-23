@implementation WBSUserMediaPermissionController

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__WBSUserMediaPermissionController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WBSUserMediaPermissionController sharedController]::onceToken != -1)
    dispatch_once(&+[WBSUserMediaPermissionController sharedController]::onceToken, block);
  return (id)+[WBSUserMediaPermissionController sharedController]::controller;
}

void __52__WBSUserMediaPermissionController_sharedController__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)+[WBSUserMediaPermissionController sharedController]::controller;
  +[WBSUserMediaPermissionController sharedController]::controller = v1;

}

- (WBSUserMediaPermissionController)init
{

  return 0;
}

- (WBSUserMediaPermissionController)initWithUserMediaPermissionsFileURL:(id)a3 perSitePreferencesStore:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id *v16;
  WBSPerSitePreference *v17;
  id v18;
  WBSPerSitePreference *v19;
  id v20;
  id *v21;
  _QWORD block[4];
  id *v24;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBSUserMediaPermissionController;
  v9 = -[WBSUserMediaPermissionController init](&v25, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.Safari.UserMediaPermissionsController", v10);
    v12 = (void *)*((_QWORD *)v9 + 6);
    *((_QWORD *)v9 + 6) = v11;

    dispatch_suspend(*((dispatch_object_t *)v9 + 6));
    atomic_store(0, (unint64_t *)v9 + 7);
    objc_storeStrong((id *)v9 + 8, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v9 + 4);
    *((_QWORD *)v9 + 4) = v13;

    v15 = *((_QWORD *)v9 + 6);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__WBSUserMediaPermissionController_initWithUserMediaPermissionsFileURL_perSitePreferencesStore___block_invoke;
    block[3] = &unk_1E4B2A2C8;
    v16 = (id *)v9;
    v24 = v16;
    dispatch_async(v15, block);
    objc_msgSend(v16, "setDefaultsDelegate:", v16);
    objc_storeStrong(v16 + 9, a4);
    v17 = -[WBSPerSitePreference initWithIdentifier:]([WBSPerSitePreference alloc], "initWithIdentifier:", CFSTR("CameraPreference"));
    v18 = v16[10];
    v16[10] = v17;

    v19 = -[WBSPerSitePreference initWithIdentifier:]([WBSPerSitePreference alloc], "initWithIdentifier:", CFSTR("MicrophonePreference"));
    v20 = v16[11];
    v16[11] = v19;

    v21 = v16;
  }

  return (WBSUserMediaPermissionController *)v9;
}

uint64_t __96__WBSUserMediaPermissionController_initWithUserMediaPermissionsFileURL_perSitePreferencesStore___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadSavedPermissions");
}

- (id)_init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  WBSUserMediaPermissionController *v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_settingsDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("UserMediaPermissions.plist"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[WBSPerSitePreferencesSQLiteStore sharedStore](WBSPerSitePreferencesSQLiteStore, "sharedStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBSUserMediaPermissionController initWithUserMediaPermissionsFileURL:perSitePreferencesStore:](self, "initWithUserMediaPermissionsFileURL:perSitePreferencesStore:", v5, v6);

  return v7;
}

- (void)performDelayedLaunchOperations
{
  -[WBSUserMediaPermissionController _dispatchAsyncOnInternalQueue:](self, "_dispatchAsyncOnInternalQueue:", 0);
}

- (void)reloadPreferences
{
  unint64_t v2;
  _QWORD v3[5];

  v2 = atomic_load((unint64_t *)&self->_savedStateLoadStatus);
  if (v2 == 2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __53__WBSUserMediaPermissionController_reloadPreferences__block_invoke;
    v3[3] = &unk_1E4B2A2C8;
    v3[4] = self;
    -[WBSUserMediaPermissionController _dispatchAsyncOnInternalQueue:](self, "_dispatchAsyncOnInternalQueue:", v3);
  }
}

uint64_t __53__WBSUserMediaPermissionController_reloadPreferences__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  atomic_store(1uLL, (unint64_t *)(*(_QWORD *)(a1 + 32) + 56));
  return objc_msgSend(*(id *)(a1 + 32), "_loadSavedPermissions");
}

- (void)savePendingChangesBeforeTermination
{
  _QWORD v3[5];

  if (atomic_load((unint64_t *)&self->_savedStateLoadStatus))
  {
    if (self->_userMediaPermissionsFileURL)
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __71__WBSUserMediaPermissionController_savePendingChangesBeforeTermination__block_invoke;
      v3[3] = &unk_1E4B2A2C8;
      v3[4] = self;
      -[WBSUserMediaPermissionController _dispatchSyncOnInternalQueue:](self, "_dispatchSyncOnInternalQueue:", v3);
    }
  }
}

uint64_t __71__WBSUserMediaPermissionController_savePendingChangesBeforeTermination__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "completePendingWriteSynchronously");
}

- (void)savePendingChangesWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  unint64_t v6;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  v6 = atomic_load((unint64_t *)&self->_savedStateLoadStatus);
  if (v6 && self->_userMediaPermissionsFileURL && self->_saveUserMediaPermissionsWriter)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__WBSUserMediaPermissionController_savePendingChangesWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E4B2A250;
    v7[4] = self;
    v8 = v4;
    -[WBSUserMediaPermissionController _dispatchAsyncOnInternalQueue:](self, "_dispatchAsyncOnInternalQueue:", v7);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

uint64_t __76__WBSUserMediaPermissionController_savePendingChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "startScheduledWriteNowWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_invalidateCachedSettingsForOriginHash:(id)a3
{
  id v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedSettings, "objectForKeyedSubscript:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "setPersistentSalt:", 0);
    objc_msgSend(v4, "setPermission:", 0);
    -[WBSUserMediaPermissionController _cachedSettingsDidChange](self, "_cachedSettingsDidChange");
  }

}

- (unint64_t)permissionForOrigin:(id)a3 topLevelOrigin:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__WBSUserMediaPermissionController_permissionForOrigin_topLevelOrigin___block_invoke;
  v12[3] = &unk_1E4B40748;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v8 = v7;
  v9 = v6;
  -[WBSUserMediaPermissionController _dispatchSyncOnInternalQueue:](self, "_dispatchSyncOnInternalQueue:", v12);
  v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __71__WBSUserMediaPermissionController_permissionForOrigin_topLevelOrigin___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_permissionForOrigin:topLevelOrigin:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)getPermissionForOrigin:(id)a3 topLevelOrigin:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  v8 = a3;
  v9 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__36;
  v16[4] = __Block_byref_object_dispose__36;
  v17 = (id)MEMORY[0x1A8599ED0](a5);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__WBSUserMediaPermissionController_getPermissionForOrigin_topLevelOrigin_completionHandler___block_invoke;
  v12[3] = &unk_1E4B3DFD0;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = v16;
  v10 = v9;
  v11 = v8;
  -[WBSUserMediaPermissionController _dispatchAsyncOnInternalQueue:](self, "_dispatchAsyncOnInternalQueue:", v12);

  _Block_object_dispose(v16, 8);
}

void __92__WBSUserMediaPermissionController_getPermissionForOrigin_topLevelOrigin_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[6];

  v2 = objc_msgSend(*(id *)(a1 + 32), "_permissionForOrigin:topLevelOrigin:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __92__WBSUserMediaPermissionController_getPermissionForOrigin_topLevelOrigin_completionHandler___block_invoke_2;
  v3[3] = &unk_1E4B40770;
  v3[4] = *(_QWORD *)(a1 + 56);
  v3[5] = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __92__WBSUserMediaPermissionController_getPermissionForOrigin_topLevelOrigin_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (unint64_t)_permissionForOrigin:(id)a3 topLevelOrigin:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  v6 = a3;
  v7 = a4;
  -[WBSUserMediaPermissionController _validPolicyForDomainWithOrigin:topLevelOrigin:](self, "_validPolicyForDomainWithOrigin:topLevelOrigin:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "permission");

  v10 = -[WBSUserMediaPermissionController _permissionByApplyingDefaultsForMissingValuesInPermission:](self, "_permissionByApplyingDefaultsForMissingValuesInPermission:", v9);
  return v10;
}

- (id)_validPolicyForDomainWithOrigin:(id)a3 topLevelOrigin:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[WBSUserMediaPermissionController _standardizedURLForDomain:](self, "_standardizedURLForDomain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
    goto LABEL_4;
  -[WBSUserMediaPermissionController _validPolicyForOrigin:topLevelOrigin:](self, "_validPolicyForOrigin:topLevelOrigin:", v8, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WBSUserMediaPermissionController _captureDevicesAreAllDefaultsGivenPermission:](self, "_captureDevicesAreAllDefaultsGivenPermission:", objc_msgSend(v9, "permission")))
  {

LABEL_4:
    -[WBSUserMediaPermissionController _validPolicyForOrigin:topLevelOrigin:](self, "_validPolicyForOrigin:topLevelOrigin:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_validPolicyForOrigin:(id)a3 topLevelOrigin:(id)a4
{
  NSString *v6;
  NSString *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  -[WBSUserMediaPermissionController _policyForOrigin:topLevelOrigin:](self, "_policyForOrigin:topLevelOrigin:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_5;
  if ((objc_msgSend(v8, "isValid") & 1) == 0)
  {
    originHash(v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSUserMediaPermissionController _invalidateCachedSettingsForOriginHash:](self, "_invalidateCachedSettingsForOriginHash:", v11);

LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v10 = v9;
LABEL_6:

  return v10;
}

- (id)_policyForOrigin:(id)a3 topLevelOrigin:(id)a4
{
  NSMutableDictionary *cachedSettings;
  void *v5;
  void *v6;

  cachedSettings = self->_cachedSettings;
  originHash((NSString *)a3, (NSString *)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedSettings, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)permissionForNonHTTPSOriginFromPermission:(unint64_t)a3
{
  unint64_t v3;

  v3 = a3 & 0xFFFFFFFFFFFFFFFALL | 1;
  if ((a3 & 4) == 0)
    v3 = a3;
  if ((v3 & 0x20) != 0)
    return v3 & 0xFFFFFFFFFFFFFFD7 | 8;
  else
    return v3;
}

- (void)setPermission:(unint64_t)a3 expirationPolicy:(unint64_t)a4 forOrigin:(id)a5 topLevelOrigin:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92__WBSUserMediaPermissionController_setPermission_expirationPolicy_forOrigin_topLevelOrigin___block_invoke;
  v14[3] = &unk_1E4B40798;
  v17 = a3;
  v18 = a4;
  v14[4] = self;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[WBSUserMediaPermissionController _dispatchAsyncOnInternalQueue:](self, "_dispatchAsyncOnInternalQueue:", v14);

}

uint64_t __92__WBSUserMediaPermissionController_setPermission_expirationPolicy_forOrigin_topLevelOrigin___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPermission:expirationPolicy:forOrigin:topLevelOrigin:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_setPermission:(unint64_t)a3 expirationPolicy:(unint64_t)a4 forOrigin:(id)a5 topLevelOrigin:(id)a6
{
  NSString *v10;
  unint64_t v11;
  void *v12;
  WBSUserMediaCapturePolicyEntry *v13;
  WBSUserMediaCapturePolicyEntry *v14;
  NSString *v15;

  v15 = (NSString *)a5;
  v10 = (NSString *)a6;
  v11 = -[WBSUserMediaPermissionController _permissionByRemovingDefaultPermissionFlagsInPermission:](self, "_permissionByRemovingDefaultPermissionFlagsInPermission:", a3);
  originHash(v15, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedSettings, "objectForKeyedSubscript:", v12);
  v13 = (WBSUserMediaCapturePolicyEntry *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    -[WBSUserMediaCapturePolicyEntry updatePermission:expirationPolicy:](v13, "updatePermission:expirationPolicy:", v11, a4);
  }
  else
  {
    v14 = -[WBSUserMediaCapturePolicyEntry initWithPermission:expirationPolicy:forOrigin:topLevelOrigin:]([WBSUserMediaCapturePolicyEntry alloc], "initWithPermission:expirationPolicy:forOrigin:topLevelOrigin:", v11, a4, v15, v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedSettings, "setObject:forKeyedSubscript:");
  }
  -[WBSUserMediaPermissionController _cachedSettingsDidChange](self, "_cachedSettingsDidChange");

}

- (unint64_t)_permissionByRemovingDefaultPermissionFlagsInPermission:(unint64_t)a3
{
  unsigned __int8 v4;
  unint64_t v5;

  v4 = -[WBSUserMediaPermissionController _permissionByApplyingDefaultsForMissingValuesInPermission:](self, "_permissionByApplyingDefaultsForMissingValuesInPermission:", 0);
  if (((v4 ^ a3) & 7) != 0)
    v5 = a3;
  else
    v5 = a3 & 0xFFFFFFFFFFFFFFF8;
  if (((v5 ^ v4) & 0x38) == 0)
    v5 &= 0xFFFFFFFFFFFFFFC7;
  if (((v5 ^ v4) & 0xC0) != 0)
    return v5;
  else
    return v5 & 0xFFFFFFFFFFFFFF3FLL;
}

- (id)saltForOrigin:(id)a3 topLevelOrigin:(id)a4 frameIdentifier:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__WBSUserMediaPermissionController_saltForOrigin_topLevelOrigin_frameIdentifier___block_invoke;
  v14[3] = &unk_1E4B407C0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = &v19;
  v18 = a5;
  v10 = v9;
  v11 = v8;
  -[WBSUserMediaPermissionController _dispatchSyncOnInternalQueue:](self, "_dispatchSyncOnInternalQueue:", v14);
  v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __81__WBSUserMediaPermissionController_saltForOrigin_topLevelOrigin_frameIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_saltForOrigin:topLevelOrigin:frameIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_saltForOrigin:(id)a3 topLevelOrigin:(id)a4 frameIdentifier:(unint64_t)a5
{
  NSString *v8;
  NSString *v9;
  void *v10;
  WBSUserMediaCapturePolicyEntry *v11;
  WBSUserMediaCapturePolicyEntry *v12;
  NSObject *v13;
  __CFString *v14;

  v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  originHash(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedSettings, "objectForKeyedSubscript:", v10);
    v11 = (WBSUserMediaCapturePolicyEntry *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (!-[WBSUserMediaCapturePolicyEntry isValid](v11, "isValid"))
        -[WBSUserMediaPermissionController _invalidateCachedSettingsForOriginHash:](self, "_invalidateCachedSettingsForOriginHash:", v10);
    }
    else
    {
      v12 = -[WBSUserMediaCapturePolicyEntry initWithPermission:expirationPolicy:forOrigin:topLevelOrigin:]([WBSUserMediaCapturePolicyEntry alloc], "initWithPermission:expirationPolicy:forOrigin:topLevelOrigin:", 0, 1, v8, v9);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedSettings, "setObject:forKeyedSubscript:");
    }
    -[WBSUserMediaPermissionController _saltWithPolicyEntry:computedPermission:frameIdentifier:](self, "_saltWithPolicyEntry:computedPermission:frameIdentifier:", v12, -[WBSUserMediaPermissionController _permissionByApplyingDefaultsForMissingValuesInPermission:](self, "_permissionByApplyingDefaultsForMissingValuesInPermission:", -[WBSUserMediaCapturePolicyEntry permission](v12, "permission")), a5);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXUserMediaCapture();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[WBSUserMediaPermissionController _saltForOrigin:topLevelOrigin:frameIdentifier:].cold.1(v13);
    v14 = &stru_1E4B40D18;
  }

  return v14;
}

- (id)_saltWithPolicyEntry:(id)a3 computedPermission:(unint64_t)a4 frameIdentifier:(unint64_t)a5
{
  char v6;
  char v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;

  v6 = a4;
  v8 = ~(_BYTE)a4;
  v9 = a3;
  v10 = v9;
  if ((v8 & 0x12) != 0)
  {
    objc_msgSend(v9, "ephemeralSalts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ((v6 & 0x24) == 0)
    {
      objc_msgSend(v10, "ephemeralSalts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        if (v11)
          goto LABEL_13;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setEphemeralSalts:", v18);

        if (v11)
          goto LABEL_13;
      }
      v19 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v19, "UUIDString");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "ephemeralSalts");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v11, v21);

      goto LABEL_13;
    }
    if (!v11)
    {
      objc_msgSend(v10, "persistentSalt");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPersistentSalt:", v16);

        -[WBSUserMediaPermissionController _cachedSettingsDidChange](self, "_cachedSettingsDidChange");
      }
      objc_msgSend(v10, "persistentSalt");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = &stru_1E4B40D18;
  }
LABEL_13:

  return v11;
}

- (void)removeAllOriginsAddedAfterDate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__WBSUserMediaPermissionController_removeAllOriginsAddedAfterDate___block_invoke;
  v6[3] = &unk_1E4B2B448;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WBSUserMediaPermissionController _dispatchAsyncOnInternalQueue:](self, "_dispatchAsyncOnInternalQueue:", v6);

}

void __67__WBSUserMediaPermissionController_removeAllOriginsAddedAfterDate___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[2] = __67__WBSUserMediaPermissionController_removeAllOriginsAddedAfterDate___block_invoke_2;
  v14[3] = &unk_1E4B407E8;
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v14[1] = 3221225472;
  v15 = v3;
  v5 = v2;
  v16 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v14);
  if (objc_msgSend(v5, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(a1 + 32), "_cachedSettingsDidChange");
  }

}

void __67__WBSUserMediaPermissionController_removeAllOriginsAddedAfterDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "permissionGrantDate");
  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 32)) == 1)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

- (void)resetOriginPermissions
{
  -[WBSUserMediaPermissionController resetOriginPermissionsWithCompletionHandler:](self, "resetOriginPermissionsWithCompletionHandler:", 0);
}

- (void)resetOriginPermissionsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__WBSUserMediaPermissionController_resetOriginPermissionsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E4B2A250;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WBSUserMediaPermissionController _dispatchAsyncOnInternalQueue:](self, "_dispatchAsyncOnInternalQueue:", v6);

}

void __80__WBSUserMediaPermissionController_resetOriginPermissionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__WBSUserMediaPermissionController_resetOriginPermissionsWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E4B39B88;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_cachedSettingsDidChangeAndWriteImmediately:completionHandler:", 1, v3);

}

uint64_t __80__WBSUserMediaPermissionController_resetOriginPermissionsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_loadSavedPermissions
{
  id v3;
  _QWORD v4[5];

  if (self->_userMediaPermissionsFileURL)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:");
    v4[1] = 3221225472;
    v4[2] = __57__WBSUserMediaPermissionController__loadSavedPermissions__block_invoke;
    v4[3] = &unk_1E4B39688;
    v4[4] = self;
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);
    atomic_store(2uLL, (unint64_t *)&self->_savedStateLoadStatus);

  }
  else
  {
    atomic_store(2uLL, (unint64_t *)&self->_savedStateLoadStatus);
  }
}

void __57__WBSUserMediaPermissionController__loadSavedPermissions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  WBSUserMediaCapturePolicyEntry *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v7, "length"))
      {
        v6 = -[WBSUserMediaCapturePolicyEntry initWithDictionaryRepresentation:]([WBSUserMediaCapturePolicyEntry alloc], "initWithDictionaryRepresentation:", v5);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v6, v7);

      }
    }
  }

}

- (void)didCommitLoadForFrameWithIdentifier:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__WBSUserMediaPermissionController_didCommitLoadForFrameWithIdentifier___block_invoke;
  v3[3] = &unk_1E4B2AA60;
  v3[4] = self;
  v3[5] = a3;
  -[WBSUserMediaPermissionController _dispatchAsyncOnInternalQueue:](self, "_dispatchAsyncOnInternalQueue:", v3);
}

void __72__WBSUserMediaPermissionController_didCommitLoadForFrameWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__6;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __72__WBSUserMediaPermissionController_didCommitLoadForFrameWithIdentifier___block_invoke_2;
  v7[3] = &unk_1E4B40810;
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v7[1] = 3221225472;
  v7[4] = &v8;
  v7[5] = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);
  if (v9[5])
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "_captureDevicesAreAllDefaultsGivenPermission:", objc_msgSend(v4, "permission")))
    {
      objc_msgSend(v4, "ephemeralSalts");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {

      }
      else
      {
        objc_msgSend(v4, "persistentSalt");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v6)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", v9[5]);
      }
    }

  }
  _Block_object_dispose(&v8, 8);

}

void __72__WBSUserMediaPermissionController_didCommitLoadForFrameWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v8 = a3;
  objc_msgSend(v8, "ephemeralSalts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "ephemeralSalts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v13);

    *a4 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (id)_dictionaryRepresentation
{
  void *v3;
  NSMutableDictionary *cachedSettings;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_cachedSettings, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  cachedSettings = self->_cachedSettings;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__WBSUserMediaPermissionController__dictionaryRepresentation__block_invoke;
  v9[3] = &unk_1E4B407E8;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cachedSettings, "enumerateKeysAndObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __61__WBSUserMediaPermissionController__dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "isValid") & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 32), "_captureDevicesAreAllDefaultsGivenPermission:", objc_msgSend(v5, "permission")) & 1) == 0)
  {
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v7);

  }
}

- (BOOL)_captureDevicesAreAllDefaultsGivenPermission:(unint64_t)a3
{
  return a3 == 0;
}

- (void)_cachedSettingsDidChange
{
  -[WBSUserMediaPermissionController _cachedSettingsDidChangeAndWriteImmediately:completionHandler:](self, "_cachedSettingsDidChangeAndWriteImmediately:completionHandler:", 0, 0);
}

- (void)_cachedSettingsDidChangeAndWriteImmediately:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  WBSCoalescedAsynchronousWriter *saveUserMediaPermissionsWriter;
  id v8;
  NSURL *userMediaPermissionsFileURL;
  OS_dispatch_queue *internalQueue;
  WBSCoalescedAsynchronousWriter *v11;
  WBSCoalescedAsynchronousWriter *v12;
  WBSCoalescedAsynchronousWriter *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  v6 = a4;
  if (self->_userMediaPermissionsFileURL)
  {
    saveUserMediaPermissionsWriter = self->_saveUserMediaPermissionsWriter;
    if (!saveUserMediaPermissionsWriter)
    {
      objc_initWeak(&location, self);
      v8 = objc_alloc(MEMORY[0x1E0D89BC0]);
      userMediaPermissionsFileURL = self->_userMediaPermissionsFileURL;
      internalQueue = self->_internalQueue;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __98__WBSUserMediaPermissionController__cachedSettingsDidChangeAndWriteImmediately_completionHandler___block_invoke;
      v16[3] = &unk_1E4B3E670;
      objc_copyWeak(&v17, &location);
      v11 = (WBSCoalescedAsynchronousWriter *)objc_msgSend(v8, "initWithName:fileURL:dataSourceQueue:dataSourceBlock:", CFSTR("UserMediaPermissions"), userMediaPermissionsFileURL, internalQueue, v16);
      v12 = self->_saveUserMediaPermissionsWriter;
      self->_saveUserMediaPermissionsWriter = v11;

      -[WBSCoalescedAsynchronousWriter setDelegate:](self->_saveUserMediaPermissionsWriter, "setDelegate:", self);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
      saveUserMediaPermissionsWriter = self->_saveUserMediaPermissionsWriter;
    }
    -[WBSCoalescedAsynchronousWriter scheduleWrite](saveUserMediaPermissionsWriter, "scheduleWrite");
    if (v4)
    {
      v13 = self->_saveUserMediaPermissionsWriter;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __98__WBSUserMediaPermissionController__cachedSettingsDidChangeAndWriteImmediately_completionHandler___block_invoke_2;
      v14[3] = &unk_1E4B2B038;
      v15 = v6;
      -[WBSCoalescedAsynchronousWriter startScheduledWriteNowWithCompletionHandler:](v13, "startScheduledWriteNowWithCompletionHandler:", v14);

    }
    else if (v6)
    {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
  }

}

id __98__WBSUserMediaPermissionController__cachedSettingsDidChangeAndWriteImmediately_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0CB38B0];
  objc_msgSend(WeakRetained, "_dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __98__WBSUserMediaPermissionController__cachedSettingsDidChangeAndWriteImmediately_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)checkUserMediaPermissionForURL:(id)a3 mainFrameURL:(id)a4 frameIdentifier:(unint64_t)a5 decisionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  WBSUserMediaPermissionController *v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __112__WBSUserMediaPermissionController_checkUserMediaPermissionForURL_mainFrameURL_frameIdentifier_decisionHandler___block_invoke;
  v16[3] = &unk_1E4B39248;
  v17 = v10;
  v18 = v11;
  v20 = v12;
  v21 = a5;
  v19 = self;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[WBSUserMediaPermissionController _dispatchAsyncOnInternalQueue:](self, "_dispatchAsyncOnInternalQueue:", v16);

}

void __112__WBSUserMediaPermissionController_checkUserMediaPermissionForURL_mainFrameURL_frameIdentifier_decisionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_validPolicyForDomainWithOrigin:topLevelOrigin:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 48), "_permissionByApplyingDefaultsForMissingValuesInPermission:", objc_msgSend(v4, "permission"));
  objc_msgSend(*(id *)(a1 + 48), "_saltWithPolicyEntry:computedPermission:frameIdentifier:", v4, v5, *(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__WBSUserMediaPermissionController_checkUserMediaPermissionForURL_mainFrameURL_frameIdentifier_decisionHandler___block_invoke_2;
  block[3] = &unk_1E4B3B430;
  v7 = *(id *)(a1 + 56);
  v10 = v6;
  v11 = v7;
  v12 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __112__WBSUserMediaPermissionController_checkUserMediaPermissionForURL_mainFrameURL_frameIdentifier_decisionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, BOOL))(a1[5] + 16))(a1[5], a1[4], (a1[6] & 0x24) != 0);
}

- (int64_t)_mediaCaptureTypeForPreference:(id)a3
{
  return self->_microphoneMediaCapturePreference == a3 || self->_cameraMediaCapturePreference != a3;
}

- (unint64_t)_permissionMaskForMediaCaptureType:(int64_t)a3
{
  if (a3 == 1)
    return 7;
  else
    return 56;
}

- (id)preferences
{
  WBSPerSitePreference *microphoneMediaCapturePreference;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  microphoneMediaCapturePreference = self->_microphoneMediaCapturePreference;
  v4[0] = self->_cameraMediaCapturePreference;
  v4[1] = microphoneMediaCapturePreference;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valuesForPreference:(id)a3
{
  if ((unint64_t)-[WBSUserMediaPermissionController _mediaCaptureTypeForPreference:](self, "_mediaCaptureTypeForPreference:", a3) >= 2)return 0;
  else
    return &unk_1E4B87748;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "localizedStringForPerSitePreferenceValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__WBSUserMediaPermissionController_setValue_ofPreference_forDomain_completionHandler___block_invoke;
  v18[3] = &unk_1E4B40838;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[WBSUserMediaPermissionController _dispatchAsyncOnInternalQueue:](self, "_dispatchAsyncOnInternalQueue:", v18);

}

void __86__WBSUserMediaPermissionController_setValue_ofPreference_forDomain_completionHandler___block_invoke(uint64_t a1)
{
  char v2;
  char v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_setValue:ofPreference:forDomain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (*(_QWORD *)(a1 + 64))
  {
    v3 = v2;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __86__WBSUserMediaPermissionController_setValue_ofPreference_forDomain_completionHandler___block_invoke_2;
    v4[3] = &unk_1E4B39220;
    v5 = *(id *)(a1 + 64);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __86__WBSUserMediaPermissionController_setValue_ofPreference_forDomain_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WBSUserMediaPermissionController _standardizedURLForDomain:](self, "_standardizedURLForDomain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSUserMediaPermissionController _validPolicyForDomainWithOrigin:topLevelOrigin:](self, "_validPolicyForDomainWithOrigin:topLevelOrigin:", v11, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "permission");

  v14 = -[WBSUserMediaPermissionController _mediaCaptureTypeForPreference:](self, "_mediaCaptureTypeForPreference:", v9);
  v15 = -[WBSUserMediaPermissionController _permissionMaskForMediaCaptureType:](self, "_permissionMaskForMediaCaptureType:", v14);
  v16 = objc_msgSend(v8, "integerValue");
  v17 = v13 & ~v15;
  if (v16)
  {
    if (v16 == 1)
    {
      if (v14)
      {
        if (v14 == 1)
          v17 |= 2uLL;
      }
      else
      {
        v17 |= 0x10uLL;
      }
    }
    else if (v16 == 2)
    {
      if (v14)
      {
        if (v14 == 1)
          v17 |= 4uLL;
      }
      else
      {
        v17 |= 0x20uLL;
      }
    }
  }
  else
  {
    v18 = v17 | 1;
    if (v14 != 1)
      v18 = v17;
    if (v14)
      v17 = v18;
    else
      v17 |= 8uLL;
  }
  if (v17 != v13)
  {
    -[WBSUserMediaPermissionController _invalidateAllPermissionsForDomain:](self, "_invalidateAllPermissionsForDomain:", v10);
    -[WBSUserMediaPermissionController _setPermission:expirationPolicy:forOrigin:topLevelOrigin:](self, "_setPermission:expirationPolicy:forOrigin:topLevelOrigin:", v17, 2, v11, v11);
    -[WBSPerSitePreferenceManager delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v19, "perSitePreferenceManager:didUpdateValueForPreference:onDomain:toValue:", self, v9, v10, v8);

  }
  return 1;
}

- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__WBSUserMediaPermissionController_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke;
  v15[3] = &unk_1E4B39360;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  -[WBSUserMediaPermissionController _dispatchAsyncOnInternalQueue:](self, "_dispatchAsyncOnInternalQueue:", v15);

}

void __90__WBSUserMediaPermissionController_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  id *v10;
  _QWORD block[4];
  _QWORD v12[2];
  _QWORD v13[4];
  id v14;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_mediaCaptureTypeForPreference:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_standardizedURLForDomain:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_validPolicyForDomainWithOrigin:topLevelOrigin:", v3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "_mediaCaptureSettingForMediaCaptureType:userMediaPermission:", v2, objc_msgSend(v4, "permission"));
  v6 = objc_msgSend(v4, "isValid");
  if (v5 == -1)
    v7 = 0;
  else
    v7 = v6;
  if (v7 == 1 && !objc_msgSend(v4, "permissionExpiresWithinOneDay"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__WBSUserMediaPermissionController_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_3;
    block[3] = &unk_1E4B39270;
    v10 = (id *)v12;
    v12[0] = *(id *)(a1 + 56);
    v12[1] = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __90__WBSUserMediaPermissionController_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2;
    v13[3] = &unk_1E4B29E68;
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v8, "getDefaultPreferenceValueForPreference:completionHandler:", v9, v13);
    v10 = &v14;
  }

}

uint64_t __90__WBSUserMediaPermissionController_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__WBSUserMediaPermissionController_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (int64_t)_mediaCaptureSettingForMediaCaptureType:(int64_t)a3 userMediaPermission:(unint64_t)a4
{
  int64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;

  v4 = 1;
  v5 = 2;
  if ((a4 & 4) == 0)
    v5 = (a4 & 1) - 1;
  if ((a4 & 2) == 0)
    v4 = v5;
  v6 = 1;
  v7 = 2;
  if ((a4 & 0x20) == 0)
    v7 = ((a4 >> 3) & 1) - 1;
  if ((a4 & 0x10) == 0)
    v6 = v7;
  if (a3)
    v6 = v4;
  if (a3 == 1)
    return v4;
  else
    return v6;
}

- (unint64_t)_userMediaPermissionForMediaCaptureType:(int64_t)a3 mediaCaptureSetting:(int64_t)a4
{
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      if (!a3)
        return 16;
      if (a3 == 1)
        return 2;
    }
    else
    {
      if (a4)
        return self;
      if (!a3)
        return 8;
      if (a3 == 1)
        return 1;
    }
  }
  if (a3)
    return 4;
  else
    return 32;
}

- (unint64_t)userMediaPermissionForDefaultPreferenceValues
{
  return -[WBSUserMediaPermissionController _permissionByApplyingDefaultsForMissingValuesInPermission:](self, "_permissionByApplyingDefaultsForMissingValuesInPermission:", 0);
}

- (unint64_t)_permissionByApplyingDefaultsForMissingValuesInPermission:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  WBSPerSitePreference *cameraMediaCapturePreference;
  WBSPerSitePreference *microphoneMediaCapturePreference;
  unint64_t v9;
  _QWORD v11[5];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v5 = dispatch_group_create();
  v6 = v5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if ((a3 & 0x38) == 0)
  {
    dispatch_group_enter(v5);
    cameraMediaCapturePreference = self->_cameraMediaCapturePreference;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __94__WBSUserMediaPermissionController__permissionByApplyingDefaultsForMissingValuesInPermission___block_invoke;
    v18[3] = &unk_1E4B40860;
    v20 = &v21;
    v18[4] = self;
    v19 = v6;
    -[WBSPerSitePreferenceManager getDefaultPreferenceValueForPreference:completionHandler:](self, "getDefaultPreferenceValueForPreference:completionHandler:", cameraMediaCapturePreference, v18);

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if ((a3 & 7) == 0)
  {
    dispatch_group_enter(v6);
    microphoneMediaCapturePreference = self->_microphoneMediaCapturePreference;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94__WBSUserMediaPermissionController__permissionByApplyingDefaultsForMissingValuesInPermission___block_invoke_2;
    v11[3] = &unk_1E4B40860;
    v13 = &v14;
    v11[4] = self;
    v12 = v6;
    -[WBSPerSitePreferenceManager getDefaultPreferenceValueForPreference:completionHandler:](self, "getDefaultPreferenceValueForPreference:completionHandler:", microphoneMediaCapturePreference, v11);

  }
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v9 = v22[3] | v15[3] | a3;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __94__WBSUserMediaPermissionController__permissionByApplyingDefaultsForMissingValuesInPermission___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_userMediaPermissionForMediaCaptureType:mediaCaptureSetting:", 0, objc_msgSend(v3, "integerValue"));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __94__WBSUserMediaPermissionController__permissionByApplyingDefaultsForMissingValuesInPermission___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_userMediaPermissionForMediaCaptureType:mediaCaptureSetting:", 1, objc_msgSend(v3, "integerValue"));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (unint64_t)permissionForDomain:(id)a3
{
  void *v4;
  unint64_t v5;

  -[WBSUserMediaPermissionController _standardizedURLForDomain:](self, "_standardizedURLForDomain:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WBSUserMediaPermissionController permissionForOrigin:topLevelOrigin:](self, "permissionForOrigin:topLevelOrigin:", v4, v4);

  return v5;
}

- (void)getAllDomainsConfiguredForPreference:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__WBSUserMediaPermissionController_getAllDomainsConfiguredForPreference_usingBlock___block_invoke;
  v10[3] = &unk_1E4B40888;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[WBSPerSitePreferenceManager getDefaultPreferenceValueForPreference:completionHandler:](self, "getDefaultPreferenceValueForPreference:completionHandler:", v9, v10);

}

void __84__WBSUserMediaPermissionController_getAllDomainsConfiguredForPreference_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__WBSUserMediaPermissionController_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_2;
  v6[3] = &unk_1E4B39360;
  v4 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v4;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v5 = v3;
  objc_msgSend(v7, "_dispatchAsyncOnInternalQueue:", v6);

}

void __84__WBSUserMediaPermissionController_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_2(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD block[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "_mediaCaptureTypeForPreference:", *(_QWORD *)(a1 + 40));
  v4 = objc_msgSend(v2[2], "integerValue");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(*((id *)*v2 + 4), "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v9, "permissionExpiresWithinOneDay") & 1) == 0)
        {
          v10 = objc_msgSend(*(id *)(a1 + 32), "_mediaCaptureSettingForMediaCaptureType:userMediaPermission:", v3, objc_msgSend(v9, "permission"));
          if (v10 != -1 && v10 != v4)
          {
            v12 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v9, "topLevelOrigin");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "URLWithString:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "safari_userVisibleHostWithoutWWWSubdomain");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v15);

          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__WBSUserMediaPermissionController_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_3;
  block[3] = &unk_1E4B29E18;
  v16 = *(id *)(a1 + 56);
  v20 = v18;
  v21 = v16;
  v17 = v18;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __84__WBSUserMediaPermissionController_getAllDomainsConfiguredForPreference_usingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__WBSUserMediaPermissionController_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke;
  v14[3] = &unk_1E4B39360;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[WBSUserMediaPermissionController _dispatchAsyncOnInternalQueue:](self, "_dispatchAsyncOnInternalQueue:", v14);

}

void __102__WBSUserMediaPermissionController_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke(uint64_t a1)
{
  char v2;
  char v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_removePreferenceValuesForDomains:fromPreference:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56))
  {
    v3 = v2;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __102__WBSUserMediaPermissionController_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke_2;
    v4[3] = &unk_1E4B39220;
    v5 = *(id *)(a1 + 56);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __102__WBSUserMediaPermissionController_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *cachedSettings;
  id v19;
  NSString *v20;
  NSString *v21;
  void *v22;
  id v24;
  id v25;
  void *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v24 = a4;
  v6 = -[WBSUserMediaPermissionController _permissionMaskForMediaCaptureType:](self, "_permissionMaskForMediaCaptureType:", -[WBSUserMediaPermissionController _mediaCaptureTypeForPreference:](self, "_mediaCaptureTypeForPreference:"));
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v25;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v34;
    v9 = ~v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(obj);
        -[WBSUserMediaPermissionController _standardizedURLForDomain:](self, "_standardizedURLForDomain:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSUserMediaPermissionController _policyForOrigin:topLevelOrigin:](self, "_policyForOrigin:topLevelOrigin:", v11, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = objc_msgSend(v12, "permission") & v9;
          if (v14)
            objc_msgSend(v13, "setPermission:", v14);
          else
            objc_msgSend(v26, "addObject:", v13);
        }

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v7);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = v26;
  v15 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v30;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v27);
        cachedSettings = self->_cachedSettings;
        v19 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * v17);
        objc_msgSend(v19, "origin");
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "topLevelOrigin");
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        originHash(v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary removeObjectForKey:](cachedSettings, "removeObjectForKey:", v22);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v15);
  }

  -[WBSUserMediaPermissionController _cachedSettingsDidChange](self, "_cachedSettingsDidChange");
  return 1;
}

- (id)preferenceNameForPreference:(id)a3
{
  __CFString *v3;
  __CFString **v4;

  v3 = -[WBSUserMediaPermissionController _mediaCaptureTypeForPreference:](self, "_mediaCaptureTypeForPreference:", a3);
  if (v3 == (__CFString *)1)
  {
    v4 = WBSPerSitePreferenceNameMicrophone;
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = WBSPerSitePreferenceNameCamera;
LABEL_5:
    v3 = *v4;
  }
  return v3;
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  return &unk_1E4B87CA0;
}

- (BOOL)_isPreferenceValid:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", self->_cameraMediaCapturePreference) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqual:", self->_microphoneMediaCapturePreference);

  return v5;
}

+ (id)localizedStringForPerSitePreferenceValue:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "integerValue") <= 2)
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_standardizedURLForDomain:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend(v5, "length"))
    v7 = v5;
  else
    v7 = v3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("mediacapture://%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_invalidateAllPermissionsForDomain:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSString *v14;
  NSString *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary allValues](self->_cachedSettings, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v8, "topLevelOrigin");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "URLWithString:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "safari_userVisibleHostWithoutWWWSubdomain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v8, "origin");
          v14 = (NSString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "topLevelOrigin");
          v15 = (NSString *)objc_claimAutoreleasedReturnValue();
          originHash(v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSUserMediaPermissionController _invalidateCachedSettingsForOriginHash:](self, "_invalidateCachedSettingsForOriginHash:", v16);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

}

- (void)_dispatchAsyncOnInternalQueue:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  dispatch_block_t block;

  v4 = a3;
  v5 = v4;
  v6 = atomic_load((unint64_t *)&self->_savedStateLoadStatus);
  block = v4;
  if (!v6)
  {
    atomic_store(1uLL, (unint64_t *)&self->_savedStateLoadStatus);
    dispatch_resume((dispatch_object_t)self->_internalQueue);
    v5 = block;
    if (!block)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    dispatch_async((dispatch_queue_t)self->_internalQueue, block);
    v5 = block;
  }
LABEL_4:

}

- (void)_dispatchSyncOnInternalQueue:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  dispatch_block_t block;

  v4 = a3;
  v5 = v4;
  v6 = atomic_load((unint64_t *)&self->_savedStateLoadStatus);
  block = v4;
  if (!v6)
  {
    atomic_store(1uLL, (unint64_t *)&self->_savedStateLoadStatus);
    dispatch_resume((dispatch_object_t)self->_internalQueue);
    v5 = block;
    if (!block)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    dispatch_sync((dispatch_queue_t)self->_internalQueue, block);
    v5 = block;
  }
LABEL_4:

}

- (void)removeAllPermissionsWithCompletionHandler:(id)a3
{
  id v4;
  WBSPerSitePreference *microphoneMediaCapturePreference;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  microphoneMediaCapturePreference = self->_microphoneMediaCapturePreference;
  v12[0] = self->_cameraMediaCapturePreference;
  v12[1] = microphoneMediaCapturePreference;
  v13[0] = &unk_1E4B87CA0;
  v13[1] = &unk_1E4B87CA0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__WBSUserMediaPermissionController_removeAllPermissionsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4B408B0;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  -[WBSPerSitePreferenceManager setDefaultPreferenceValues:completionHandler:](self, "setDefaultPreferenceValues:completionHandler:", v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __78__WBSUserMediaPermissionController_removeAllPermissionsWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __78__WBSUserMediaPermissionController_removeAllPermissionsWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_1E4B29DC8;
    v6 = *(id *)(a1 + 32);
    v7 = a2;
    objc_msgSend(WeakRetained, "resetOriginPermissionsWithCompletionHandler:", v5);

  }
}

uint64_t __78__WBSUserMediaPermissionController_removeAllPermissionsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (*(_BYTE *)(a1 + 40))
      a2 = a2;
    else
      a2 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (WBSPerSitePreference)cameraMediaCapturePreference
{
  return self->_cameraMediaCapturePreference;
}

- (WBSPerSitePreference)microphoneMediaCapturePreference
{
  return self->_microphoneMediaCapturePreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microphoneMediaCapturePreference, 0);
  objc_storeStrong((id *)&self->_cameraMediaCapturePreference, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
  objc_storeStrong((id *)&self->_userMediaPermissionsFileURL, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_saveUserMediaPermissionsWriter, 0);
  objc_storeStrong((id *)&self->_cachedSettings, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

- (void)_saltForOrigin:(os_log_t)log topLevelOrigin:frameIdentifier:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Attempting to check media capture permission without an origin and top level origin", v1, 2u);
}

@end
