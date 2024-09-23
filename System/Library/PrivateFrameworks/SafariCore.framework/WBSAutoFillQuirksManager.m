@implementation WBSAutoFillQuirksManager

- (WBSAutoFillQuirksManager)init
{

  return 0;
}

- (WBSAutoFillQuirksManager)initWithBuiltInQuirksURL:(id)a3 downloadsDirectoryURL:(id)a4 resourceName:(id)a5 resourceVersion:(id)a6 updateDateDefaultsKey:(id)a7 updateInterval:(double)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  WBSAutoFillQuirksManager *v19;
  WBSRemotelyUpdatableDataController *v20;
  uint64_t v21;
  uint64_t v22;
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  WBSAutoFillQuirksManager *v24;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v26.receiver = self;
  v26.super_class = (Class)WBSAutoFillQuirksManager;
  v19 = -[WBSAutoFillQuirksManager init](&v26, sel_init);
  if (v19)
  {
    v20 = [WBSRemotelyUpdatableDataController alloc];
    v21 = objc_opt_class();
    v22 = -[WBSRemotelyUpdatableDataController initWithDataFormat:builtInListURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:snapshotClass:snapshotTransformerClass:](v20, "initWithDataFormat:builtInListURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:snapshotClass:snapshotTransformerClass:", 0, v14, v15, v16, v17, v18, a8, v21, objc_opt_class());
    remotelyUpdatableDataController = v19->_remotelyUpdatableDataController;
    v19->_remotelyUpdatableDataController = (WBSRemotelyUpdatableDataController *)v22;

    -[WBSRemotelyUpdatableDataController setShouldKeepBuiltInSnapshotLoaded:](v19->_remotelyUpdatableDataController, "setShouldKeepBuiltInSnapshotLoaded:", 1);
    -[WBSRemotelyUpdatableDataController setDelegate:](v19->_remotelyUpdatableDataController, "setDelegate:", v19);
    if (a8 != 0.0)
      -[WBSRemotelyUpdatableDataController setShouldAttemptToUpdateConfiguration:](v19->_remotelyUpdatableDataController, "setShouldAttemptToUpdateConfiguration:", 1);
    -[WBSRemotelyUpdatableDataController setDataIsUsedByMultipleProcesses:](v19->_remotelyUpdatableDataController, "setDataIsUsedByMultipleProcesses:", 1);
    v24 = v19;
  }

  return v19;
}

- (void)setShouldAttemptToDownloadConfiguration:(BOOL)a3
{
  self->_shouldAttemptToDownloadConfiguration = a3;
  -[WBSRemotelyUpdatableDataController setShouldAttemptToDownloadConfiguration:](self->_remotelyUpdatableDataController, "setShouldAttemptToDownloadConfiguration:");
}

- (void)beginLoadingQuirksFromDisk
{
  -[WBSRemotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:](self->_remotelyUpdatableDataController, "accessSnapshotLoadingItIfNeeded:", &__block_literal_global_3);
}

- (void)prepareForTermination
{
  -[WBSRemotelyUpdatableDataController prepareForTermination](self->_remotelyUpdatableDataController, "prepareForTermination");
}

- (WBSPasswordGenerationManager)passwordGenerationManager
{
  WBSPasswordGenerationManager *passwordGenerationManager;
  WBSPasswordGenerationManager *v4;
  void *v5;
  WBSPasswordGenerationManager *v6;
  WBSPasswordGenerationManager *v7;

  passwordGenerationManager = self->_passwordGenerationManager;
  if (!passwordGenerationManager)
  {
    v4 = [WBSPasswordGenerationManager alloc];
    -[WBSAutoFillQuirksManager _passwordRequirementsByDomainFromCurrentSnapshot](self, "_passwordRequirementsByDomainFromCurrentSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WBSPasswordGenerationManager initWithPasswordRequirementsByDomain:](v4, "initWithPasswordRequirementsByDomain:", v5);
    v7 = self->_passwordGenerationManager;
    self->_passwordGenerationManager = v6;

    passwordGenerationManager = self->_passwordGenerationManager;
  }
  return passwordGenerationManager;
}

- (WBSAutoFillAssociatedDomainsManager)associatedDomainsManager
{
  WBSAutoFillAssociatedDomainsManager *associatedDomainsManager;
  WBSAutoFillAssociatedDomainsManager *v4;
  void *v5;
  void *v6;
  WBSAutoFillAssociatedDomainsManager *v7;
  WBSAutoFillAssociatedDomainsManager *v8;

  associatedDomainsManager = self->_associatedDomainsManager;
  if (!associatedDomainsManager)
  {
    v4 = [WBSAutoFillAssociatedDomainsManager alloc];
    -[WBSAutoFillQuirksManager _domainsWithAssociatedCredentialsFromCurrentSnapshot](self, "_domainsWithAssociatedCredentialsFromCurrentSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSAutoFillQuirksManager _domainsToConsiderIdenticalFromCurrentSnapshot](self, "_domainsToConsiderIdenticalFromCurrentSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WBSAutoFillAssociatedDomainsManager initWithDomainsWithAssociatedCredentials:domainsToConsiderIdentical:](v4, "initWithDomainsWithAssociatedCredentials:domainsToConsiderIdentical:", v5, v6);
    v8 = self->_associatedDomainsManager;
    self->_associatedDomainsManager = v7;

    associatedDomainsManager = self->_associatedDomainsManager;
  }
  return associatedDomainsManager;
}

- (WBSPasswordAuditingEligibleDomainsManager)passwordAuditingEligibleDomainsManager
{
  WBSPasswordAuditingEligibleDomainsManager *passwordAuditingEligibleDomainsManager;
  WBSPasswordAuditingEligibleDomainsManager *v4;
  void *v5;
  WBSPasswordAuditingEligibleDomainsManager *v6;
  WBSPasswordAuditingEligibleDomainsManager *v7;

  passwordAuditingEligibleDomainsManager = self->_passwordAuditingEligibleDomainsManager;
  if (!passwordAuditingEligibleDomainsManager)
  {
    v4 = [WBSPasswordAuditingEligibleDomainsManager alloc];
    -[WBSAutoFillQuirksManager _domainsIneligibleForPasswordAuditingFromCurrentSnapshot](self, "_domainsIneligibleForPasswordAuditingFromCurrentSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WBSPasswordAuditingEligibleDomainsManager initWithDomainsIneligibleForPasswordAuditing:](v4, "initWithDomainsIneligibleForPasswordAuditing:", v5);
    v7 = self->_passwordAuditingEligibleDomainsManager;
    self->_passwordAuditingEligibleDomainsManager = v6;

    passwordAuditingEligibleDomainsManager = self->_passwordAuditingEligibleDomainsManager;
  }
  return passwordAuditingEligibleDomainsManager;
}

- (WBSChangePasswordURLManager)changePasswordURLManager
{
  WBSChangePasswordURLManager *changePasswordURLManager;
  WBSChangePasswordURLManager *v4;
  void *v5;
  WBSChangePasswordURLManager *v6;
  WBSChangePasswordURLManager *v7;

  changePasswordURLManager = self->_changePasswordURLManager;
  if (!changePasswordURLManager)
  {
    v4 = [WBSChangePasswordURLManager alloc];
    -[WBSAutoFillQuirksManager _changePasswordURLStringsFromCurrentSnapshot](self, "_changePasswordURLStringsFromCurrentSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WBSChangePasswordURLManager initWithChangePasswordURLStrings:](v4, "initWithChangePasswordURLStrings:", v5);
    v7 = self->_changePasswordURLManager;
    self->_changePasswordURLManager = v6;

    changePasswordURLManager = self->_changePasswordURLManager;
  }
  return changePasswordURLManager;
}

- (WBSAppIDsToDomainsAssociationManager)appToWebsiteAssociationManager
{
  WBSAppIDsToDomainsAssociationManager *appToWebsiteAssociationManager;
  WBSAppIDsToDomainsAssociationManager *v4;
  void *v5;
  WBSAppIDsToDomainsAssociationManager *v6;
  WBSAppIDsToDomainsAssociationManager *v7;

  appToWebsiteAssociationManager = self->_appToWebsiteAssociationManager;
  if (!appToWebsiteAssociationManager)
  {
    v4 = [WBSAppIDsToDomainsAssociationManager alloc];
    -[WBSAutoFillQuirksManager _appIDsToDomainsAssociationsFromCurrentSnapshot](self, "_appIDsToDomainsAssociationsFromCurrentSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WBSAppIDsToDomainsAssociationManager initWithAppIDsToDomains:](v4, "initWithAppIDsToDomains:", v5);
    v7 = self->_appToWebsiteAssociationManager;
    self->_appToWebsiteAssociationManager = v6;

    appToWebsiteAssociationManager = self->_appToWebsiteAssociationManager;
  }
  return appToWebsiteAssociationManager;
}

- (id)domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices
{
  NSSet *domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
  NSSet *v4;
  NSSet *v5;

  domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices = self->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
  if (!domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices)
  {
    -[WBSAutoFillQuirksManager _domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServicesFromCurrentSnapshot](self, "_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServicesFromCurrentSnapshot");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
    self->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices = v4;

    domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices = self->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
  }
  return domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
}

- (void)didDownloadDataForRemotelyUpdatableDataController:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__WBSAutoFillQuirksManager_didDownloadDataForRemotelyUpdatableDataController___block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __78__WBSAutoFillQuirksManager_didDownloadDataForRemotelyUpdatableDataController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "_passwordRequirementsByDomainFromCurrentSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setPasswordRequirementsByDomain:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_domainsWithAssociatedCredentialsFromCurrentSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDomainsWithAssociatedCredentials:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_domainsToConsiderIdenticalFromCurrentSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDomainsToConsiderIdentical:", v4);

  objc_msgSend(*(id *)(a1 + 32), "_domainsIneligibleForPasswordAuditingFromCurrentSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDomainsIneligibleForPasswordAuditing:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_changePasswordURLStringsFromCurrentSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setChangePasswordURLStrings:", v6);

  objc_msgSend(*(id *)(a1 + 32), "_appIDsToDomainsAssociationsFromCurrentSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAppIDsToDomains:", v7);

  objc_msgSend(*(id *)(a1 + 32), "_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServicesFromCurrentSnapshot");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 56);
  *(_QWORD *)(v9 + 56) = v8;

}

- (id)_passwordRequirementsByDomainFromCurrentSnapshot
{
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__WBSAutoFillQuirksManager__passwordRequirementsByDomainFromCurrentSnapshot__block_invoke;
  v5[3] = &unk_1E649B790;
  v5[4] = &v6;
  -[WBSRemotelyUpdatableDataController accessCurrentSnapshot:](remotelyUpdatableDataController, "accessCurrentSnapshot:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __76__WBSAutoFillQuirksManager__passwordRequirementsByDomainFromCurrentSnapshot__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "passwordRequirementsByDomain");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_domainsWithAssociatedCredentialsFromCurrentSnapshot
{
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__WBSAutoFillQuirksManager__domainsWithAssociatedCredentialsFromCurrentSnapshot__block_invoke;
  v5[3] = &unk_1E649B790;
  v5[4] = &v6;
  -[WBSRemotelyUpdatableDataController accessCurrentSnapshot:](remotelyUpdatableDataController, "accessCurrentSnapshot:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __80__WBSAutoFillQuirksManager__domainsWithAssociatedCredentialsFromCurrentSnapshot__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "domainsWithAssociatedCredentials");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_domainsToConsiderIdenticalFromCurrentSnapshot
{
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__WBSAutoFillQuirksManager__domainsToConsiderIdenticalFromCurrentSnapshot__block_invoke;
  v5[3] = &unk_1E649B790;
  v5[4] = &v6;
  -[WBSRemotelyUpdatableDataController accessCurrentSnapshot:](remotelyUpdatableDataController, "accessCurrentSnapshot:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __74__WBSAutoFillQuirksManager__domainsToConsiderIdenticalFromCurrentSnapshot__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "domainsToConsiderIdentical");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_domainsIneligibleForPasswordAuditingFromCurrentSnapshot
{
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__WBSAutoFillQuirksManager__domainsIneligibleForPasswordAuditingFromCurrentSnapshot__block_invoke;
  v5[3] = &unk_1E649B790;
  v5[4] = &v6;
  -[WBSRemotelyUpdatableDataController accessCurrentSnapshot:](remotelyUpdatableDataController, "accessCurrentSnapshot:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __84__WBSAutoFillQuirksManager__domainsIneligibleForPasswordAuditingFromCurrentSnapshot__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "domainsIneligibleForPasswordAuditing");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_changePasswordURLStringsFromCurrentSnapshot
{
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__WBSAutoFillQuirksManager__changePasswordURLStringsFromCurrentSnapshot__block_invoke;
  v5[3] = &unk_1E649B790;
  v5[4] = &v6;
  -[WBSRemotelyUpdatableDataController accessCurrentSnapshot:](remotelyUpdatableDataController, "accessCurrentSnapshot:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __72__WBSAutoFillQuirksManager__changePasswordURLStringsFromCurrentSnapshot__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "changePasswordURLsByDomain");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_appIDsToDomainsAssociationsFromCurrentSnapshot
{
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__WBSAutoFillQuirksManager__appIDsToDomainsAssociationsFromCurrentSnapshot__block_invoke;
  v5[3] = &unk_1E649B7B8;
  v5[4] = &v6;
  -[WBSRemotelyUpdatableDataController accessBuiltInAndRemotelyLoadedSnapshots:](remotelyUpdatableDataController, "accessBuiltInAndRemotelyLoadedSnapshots:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __75__WBSAutoFillQuirksManager__appIDsToDomainsAssociationsFromCurrentSnapshot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "appIDsToDomainsAssociations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(v7, "appIDsToDomainsAssociations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
  if (!v5)

}

- (id)_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServicesFromCurrentSnapshot
{
  WBSRemotelyUpdatableDataController *remotelyUpdatableDataController;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __114__WBSAutoFillQuirksManager__domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServicesFromCurrentSnapshot__block_invoke;
  v5[3] = &unk_1E649B7B8;
  v5[4] = &v6;
  -[WBSRemotelyUpdatableDataController accessBuiltInAndRemotelyLoadedSnapshots:](remotelyUpdatableDataController, "accessBuiltInAndRemotelyLoadedSnapshots:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __114__WBSAutoFillQuirksManager__domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServicesFromCurrentSnapshot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(v7, "domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
  if (!v5)

}

- (BOOL)isAutomaticLoginDisallowedOnURL:(id)a3
{
  return -[WBSAutoFillQuirksManager _isURL:containedInQuirks:](self, "_isURL:containedInQuirks:", a3, &__block_literal_global_12);
}

uint64_t __60__WBSAutoFillQuirksManager_isAutomaticLoginDisallowedOnURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "domainsIneligibleForAutomaticLogin");
}

- (BOOL)isStreamlinedLoginDisallowedOnURL:(id)a3
{
  return -[WBSAutoFillQuirksManager _isURL:containedInQuirks:](self, "_isURL:containedInQuirks:", a3, &__block_literal_global_13);
}

uint64_t __62__WBSAutoFillQuirksManager_isStreamlinedLoginDisallowedOnURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "domainsIneligibleForStreamlinedLogin");
}

- (BOOL)arePasskeysDisallowedForRelyingParty:(id)a3
{
  void *v4;
  BOOL v5;

  -[WBSAutoFillQuirksManager _urlFromRelyingParty:](self, "_urlFromRelyingParty:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[WBSAutoFillQuirksManager _isURL:containedInQuirks:](self, "_isURL:containedInQuirks:", v4, &__block_literal_global_14);
  else
    v5 = 0;

  return v5;
}

uint64_t __65__WBSAutoFillQuirksManager_arePasskeysDisallowedForRelyingParty___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "domainsIneligibleForPasskeys");
}

- (BOOL)shouldUseFallbackUIForRelyingParty:(id)a3
{
  void *v4;
  BOOL v5;

  -[WBSAutoFillQuirksManager _urlFromRelyingParty:](self, "_urlFromRelyingParty:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[WBSAutoFillQuirksManager _isURL:containedInQuirks:](self, "_isURL:containedInQuirks:", v4, &__block_literal_global_15);
  else
    v5 = 0;

  return v5;
}

uint64_t __63__WBSAutoFillQuirksManager_shouldUseFallbackUIForRelyingParty___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "domainsForPasskeyFallbackUI");
}

- (BOOL)isDomainKnownToAskForCredentialsForOtherServicesWhenEmbeddedAsThirdParty:(id)a3
{
  void *v4;
  BOOL v5;

  -[WBSAutoFillQuirksManager _urlFromRelyingParty:](self, "_urlFromRelyingParty:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[WBSAutoFillQuirksManager _isURL:containedInQuirks:](self, "_isURL:containedInQuirks:", v4, &__block_literal_global_16);
  else
    v5 = 0;

  return v5;
}

uint64_t __101__WBSAutoFillQuirksManager_isDomainKnownToAskForCredentialsForOtherServicesWhenEmbeddedAsThirdParty___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices");
}

- (BOOL)_isURL:(id)a3 containedInQuirks:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  -[WBSRemotelyUpdatableDataController fetchDataFromCurrentSnapshot:](self->_remotelyUpdatableDataController, "fetchDataFromCurrentSnapshot:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__WBSAutoFillQuirksManager__isURL_containedInQuirks___block_invoke;
  v10[3] = &unk_1E649B8A0;
  v11 = v6;
  v8 = v6;
  LOBYTE(v6) = objc_msgSend(v7, "safari_containsObjectPassingTest:", v10);

  return (char)v6;
}

uint64_t __53__WBSAutoFillQuirksManager__isURL_containedInQuirks___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_isSubdomainOfDomain:", a2);
}

- (id)_urlFromRelyingParty:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setHost:", v4);

  objc_msgSend(v5, "setScheme:", CFSTR("https"));
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldAttemptToDownloadConfiguration
{
  return self->_shouldAttemptToDownloadConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices, 0);
  objc_storeStrong((id *)&self->_changePasswordURLManager, 0);
  objc_storeStrong((id *)&self->_appToWebsiteAssociationManager, 0);
  objc_storeStrong((id *)&self->_passwordAuditingEligibleDomainsManager, 0);
  objc_storeStrong((id *)&self->_remotelyUpdatableDataController, 0);
  objc_storeStrong((id *)&self->_associatedDomainsManager, 0);
  objc_storeStrong((id *)&self->_passwordGenerationManager, 0);
}

@end
