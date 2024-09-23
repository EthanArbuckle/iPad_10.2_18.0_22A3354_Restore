@implementation SUPolicyFactory

- (SUPolicyFactory)init
{
  SUPolicyFactory *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *stateQueue;
  NSObject *v6;
  _QWORD block[4];
  SUPolicyFactory *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUPolicyFactory;
  v2 = -[SUPolicyFactory init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.softwareupdateservices.SUPolicyFactoryQueue", v3);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v4;

    v6 = v2->_stateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __23__SUPolicyFactory_init__block_invoke;
    block[3] = &unk_24CE3B5C0;
    v9 = v2;
    dispatch_sync(v6, block);

  }
  return v2;
}

uint64_t __23__SUPolicyFactory_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  SUPolicyGlobalOptions *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

  v6 = objc_alloc_init(SUPolicyGlobalOptions);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v6;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = 0;

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 48);
  *(_QWORD *)(v13 + 48) = 0;

  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 56);
  *(_QWORD *)(v15 + 56) = 0;

  objc_msgSend(*(id *)(a1 + 32), "createCorePolicy");
  return objc_msgSend(*(id *)(a1 + 32), "createRollbackPolicy");
}

- (void)setGlobalOptions:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__SUPolicyFactory_setGlobalOptions___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

uint64_t __36__SUPolicyFactory_setGlobalOptions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "modifyPolicy:forTypes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &unk_24CE6E390);
  return objc_msgSend(*(id *)(a1 + 32), "modifyPolicy:forTypes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), &unk_24CE6E3A8);
}

- (void)setScanOptions:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__SUPolicyFactory_setScanOptions___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

uint64_t __34__SUPolicyFactory_setScanOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "_SUAssetTypeForScanOptions:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_SUAssetTypeForScanOptions:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "createCorePolicy");
  return objc_msgSend(*(id *)(a1 + 32), "modifyPolicy:forTypes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &unk_24CE6E3C0);
}

- (void)setDownloadOptions:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__SUPolicyFactory_setDownloadOptions___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

uint64_t __38__SUPolicyFactory_setDownloadOptions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "modifyPolicy:forTypes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &unk_24CE6E3D8);
}

- (void)setInstallOptions:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__SUPolicyFactory_setInstallOptions___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

uint64_t __37__SUPolicyFactory_setInstallOptions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "modifyPolicy:forTypes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &unk_24CE6E3F0);
}

- (void)setRollbackOptions:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__SUPolicyFactory_setRollbackOptions___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

uint64_t __38__SUPolicyFactory_setRollbackOptions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "modifyPolicy:forTypes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), &unk_24CE6E408);
}

- (SUPolicyGlobalOptions)globalOptions
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__19;
  v11 = __Block_byref_object_dispose__19;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__SUPolicyFactory_globalOptions__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUPolicyGlobalOptions *)v4;
}

void __32__SUPolicyFactory_globalOptions__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (SUScanOptions)scanOptions
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__19;
  v11 = __Block_byref_object_dispose__19;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__SUPolicyFactory_scanOptions__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUScanOptions *)v4;
}

void __30__SUPolicyFactory_scanOptions__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (SUDownloadOptions)downloadOptions
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__19;
  v11 = __Block_byref_object_dispose__19;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__SUPolicyFactory_downloadOptions__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUDownloadOptions *)v4;
}

void __34__SUPolicyFactory_downloadOptions__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (SUInstallOptions)installOptions
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__19;
  v11 = __Block_byref_object_dispose__19;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__SUPolicyFactory_installOptions__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUInstallOptions *)v4;
}

void __33__SUPolicyFactory_installOptions__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (SURollbackOptions)rollbackOptions
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__19;
  v11 = __Block_byref_object_dispose__19;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__SUPolicyFactory_rollbackOptions__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SURollbackOptions *)v4;
}

void __34__SUPolicyFactory_rollbackOptions__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (SUCorePolicy)corePolicy
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__19;
  v11 = __Block_byref_object_dispose__19;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __29__SUPolicyFactory_corePolicy__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUCorePolicy *)v4;
}

void __29__SUPolicyFactory_corePolicy__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (SUCorePolicy)rollbackPolicy
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__19;
  v11 = __Block_byref_object_dispose__19;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__SUPolicyFactory_rollbackPolicy__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUCorePolicy *)v4;
}

void __33__SUPolicyFactory_rollbackPolicy__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)createCorePolicy
{
  id v3;
  void *v4;
  void *v5;
  SUCorePolicy *v6;
  SUCorePolicy *corePolicy;

  v3 = objc_alloc(MEMORY[0x24BEAE828]);
  -[SUPolicyFactory _SUAssetTypeForScanOptions:](self, "_SUAssetTypeForScanOptions:", self->_scanOption);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEAE848], "getAssetTypeForKind:usingFamily:", 2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (SUCorePolicy *)objc_msgSend(v3, "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:", v4, v5, 0, 0);

  -[SUPolicyFactory augmentPolicy:](self, "augmentPolicy:", v6);
  corePolicy = self->_corePolicy;
  self->_corePolicy = v6;

}

- (void)createRollbackPolicy
{
  id v3;
  void *v4;
  void *v5;
  SUCorePolicy *v6;
  SUCorePolicy *rollbackPolicy;

  v3 = objc_alloc(MEMORY[0x24BEAE828]);
  objc_msgSend(MEMORY[0x24BEAE848], "getAssetTypeForKind:usingFamily:", 7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEAE848], "getAssetTypeForKind:usingFamily:", 2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (SUCorePolicy *)objc_msgSend(v3, "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:", v4, v5, 0, 0);

  -[SUPolicyFactory augmentPolicy:](self, "augmentPolicy:", v6);
  rollbackPolicy = self->_rollbackPolicy;
  self->_rollbackPolicy = v6;

}

- (void)augmentPolicy:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SUPolicyGlobal *v32;
  SUPolicyScanSoftwareUpdate *v33;
  SUPolicyScanSUDocumentation *v34;
  SUPolicyDocumentationDownload *v35;
  SUPolicyScanBrain *v36;
  SUPolicy *v37;
  SUPolicyDownload *v38;
  SUPolicy *v39;
  SUPolicy *v40;
  SUPolicy *v41;
  SUPolicyApply *v42;
  SUPolicyRollback *v43;
  uint64_t v44;
  char v45;

  v4 = a3;
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "queryCustomerBuilds");

  if (v6)
  {
    v7 = v4;
    v8 = 0;
LABEL_6:
    objc_msgSend(v7, "setReleaseType:", v8);
    goto LABEL_8;
  }
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "useEmptyPatches"))
  {
    v10 = +[SUUtility currentReleaseTypeIsInternal](SUUtility, "currentReleaseTypeIsInternal");

    if (!v10)
      goto LABEL_8;
    v8 = CFSTR("Empty");
    v7 = v4;
    goto LABEL_6;
  }

LABEL_8:
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableSplatCombo:", objc_msgSend(v11, "disableSplombo"));

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnablePreSUStaging:", objc_msgSend(v12, "enablePreSUStaging"));

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnablePreSUStagingForOptionalAssets:", objc_msgSend(v13, "enablePreSUStagingForOptionalAssets"));

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ssoUsernameForPersonalization");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
LABEL_11:

    goto LABEL_12;
  }
  v16 = (void *)v15;
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ssoTokenForPersonalization");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    SULogInfo(CFSTR("SSO UserName and Token are set for personalization, setting it in policy"), v19, v20, v21, v22, v23, v24, v25, v44);
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ssoTokenForPersonalization");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dataUsingEncoding:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "ssoUsernameForPersonalization");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dataUsingEncoding:", 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", objc_msgSend(v30, "length") + objc_msgSend(v14, "length") + 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "appendData:", v30);
    objc_msgSend(v31, "appendBytes:length:", &v45, 1);
    objc_msgSend(v31, "appendData:", v14);
    objc_msgSend(v4, "setSsoToken:", v31);

    goto LABEL_11;
  }
LABEL_12:
  v32 = -[SUPolicyGlobal initWithGlobalOptions:]([SUPolicyGlobal alloc], "initWithGlobalOptions:", self->_globalOptions);
  -[SUPolicyFactory augmentCorePolicy:WithGlobalPolicy:](self, "augmentCorePolicy:WithGlobalPolicy:", v4, v32);

  v33 = -[SUPolicyScan initWithScanOptions:]([SUPolicyScanSoftwareUpdate alloc], "initWithScanOptions:", self->_scanOption);
  -[SUPolicyFactory augmentCorePolicy:WithSUScanPolicy:](self, "augmentCorePolicy:WithSUScanPolicy:", v4, v33);

  v34 = -[SUPolicyScan initWithScanOptions:]([SUPolicyScanSUDocumentation alloc], "initWithScanOptions:", 0);
  -[SUPolicyFactory augmentCorePolicy:WithDocumentationScanPolicy:](self, "augmentCorePolicy:WithDocumentationScanPolicy:", v4, v34);

  v35 = objc_alloc_init(SUPolicyDocumentationDownload);
  -[SUPolicyFactory augmentCorePolicy:WithDocumentationDownloadPolicy:](self, "augmentCorePolicy:WithDocumentationDownloadPolicy:", v4, v35);

  v36 = objc_alloc_init(SUPolicyScanBrain);
  -[SUPolicyFactory augmentCorePolicy:WithLoadBrainPolicy:](self, "augmentCorePolicy:WithLoadBrainPolicy:", v4, v36);

  v37 = objc_alloc_init(SUPolicy);
  -[SUPolicyFactory augmentCorePolicy:WithPreflightPolicy:](self, "augmentCorePolicy:WithPreflightPolicy:", v4, v37);

  v38 = -[SUPolicyDownload initWithDownloadOptions:]([SUPolicyDownload alloc], "initWithDownloadOptions:", 0);
  -[SUPolicyFactory augmentCorePolicy:WithSUDownloadPolicy:](self, "augmentCorePolicy:WithSUDownloadPolicy:", v4, v38);

  v39 = objc_alloc_init(SUPolicy);
  -[SUPolicyFactory augmentCorePolicy:WithPreparePolicy:](self, "augmentCorePolicy:WithPreparePolicy:", v4, v39);

  v40 = objc_alloc_init(SUPolicy);
  -[SUPolicyFactory augmentCorePolicy:WithSuspendPolicy:](self, "augmentCorePolicy:WithSuspendPolicy:", v4, v40);

  v41 = objc_alloc_init(SUPolicy);
  -[SUPolicyFactory augmentCorePolicy:WithResumePolicy:](self, "augmentCorePolicy:WithResumePolicy:", v4, v41);

  v42 = -[SUPolicyApply initWithInstallOptions:]([SUPolicyApply alloc], "initWithInstallOptions:", 0);
  -[SUPolicyFactory augmentCorePolicy:WithApplyPolicy:](self, "augmentCorePolicy:WithApplyPolicy:", v4, v42);

  v43 = -[SUPolicyRollback initWithRollbackOptions:]([SUPolicyRollback alloc], "initWithRollbackOptions:", 0);
  -[SUPolicyFactory augmentCorePolicy:WithRollbackPolicy:](self, "augmentCorePolicy:WithRollbackPolicy:", v4, v43);

}

- (void)modifyPolicy:(id)a3 forTypes:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SUPolicyGlobal *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
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
        switch(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "intValue", (_QWORD)v14))
        {
          case 0u:
            v13 = -[SUPolicyGlobal initWithGlobalOptions:]([SUPolicyGlobal alloc], "initWithGlobalOptions:", self->_globalOptions);
            -[SUPolicyFactory augmentCorePolicy:WithGlobalPolicy:](self, "augmentCorePolicy:WithGlobalPolicy:", v6, v13);
            goto LABEL_14;
          case 1u:
            v13 = -[SUPolicyScan initWithScanOptions:]([SUPolicyScanSoftwareUpdate alloc], "initWithScanOptions:", self->_scanOption);
            -[SUPolicyFactory augmentCorePolicy:WithSUScanPolicy:](self, "augmentCorePolicy:WithSUScanPolicy:", v6, v13);
            goto LABEL_14;
          case 2u:
            v13 = -[SUPolicyScan initWithScanOptions:]([SUPolicyScanSUDocumentation alloc], "initWithScanOptions:", self->_scanOption);
            -[SUPolicyFactory augmentCorePolicy:WithDocumentationScanPolicy:](self, "augmentCorePolicy:WithDocumentationScanPolicy:", v6, v13);
            goto LABEL_14;
          case 4u:
            v13 = -[SUPolicyScan initWithScanOptions:]([SUPolicyScanBrain alloc], "initWithScanOptions:", self->_scanOption);
            -[SUPolicyFactory augmentCorePolicy:WithLoadBrainPolicy:](self, "augmentCorePolicy:WithLoadBrainPolicy:", v6, v13);
            goto LABEL_14;
          case 6u:
            v13 = -[SUPolicyDownload initWithDownloadOptions:]([SUPolicyDownload alloc], "initWithDownloadOptions:", self->_downloadOptions);
            -[SUPolicyFactory augmentCorePolicy:WithSUDownloadPolicy:](self, "augmentCorePolicy:WithSUDownloadPolicy:", v6, v13);
            goto LABEL_14;
          case 0xAu:
            v13 = -[SUPolicyApply initWithInstallOptions:]([SUPolicyApply alloc], "initWithInstallOptions:", self->_installOptions);
            -[SUPolicyFactory augmentCorePolicy:WithApplyPolicy:](self, "augmentCorePolicy:WithApplyPolicy:", v6, v13);
            goto LABEL_14;
          case 0xCu:
            v13 = -[SUPolicyRollback initWithRollbackOptions:]([SUPolicyRollback alloc], "initWithRollbackOptions:", self->_rollbackOptions);
            -[SUPolicyFactory augmentCorePolicy:WithRollbackPolicy:](self, "augmentCorePolicy:WithRollbackPolicy:", v6, v13);
LABEL_14:

            break;
          default:
            continue;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)setPolicyExtension:(id)a3 forPolicy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v8 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v7, "policyExtensions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v7, "policyExtensions", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "removeObject:", v16);
          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v10, "addObject:", v6);
  objc_msgSend(v7, "setPolicyExtensions:", v10);

}

- (void)removePolicyExtensionOfClass:(Class)a3 forPolicy:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v4, "policyExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "policyExtensions", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "removeObject:", v13);
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v4, "setPolicyExtensions:", v7);
}

- (id)existingExtensionOfClass:(Class)a3 inPolicy:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v5, "policyExtensions", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)augmentCorePolicy:(id)a3 WithGlobalPolicy:(id)a4
{
  NSObject *stateQueue;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  stateQueue = self->_stateQueue;
  v7 = a4;
  dispatch_assert_queue_V2(stateQueue);
  objc_msgSend(v11, "setCacheDeleteUrgency:", objc_msgSend(v7, "cacheDeleteUrgency"));
  objc_msgSend(v11, "setCheckAvailableSpace:", objc_msgSend(v7, "checkAvailableSpace"));
  objc_msgSend(v7, "updateMetricContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUpdateMetricContext:", v8);

  objc_msgSend(v7, "updateMetricEventFields");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v11, "setUpdateMetricEventFieldsFromDictionary:", v9);
}

- (void)augmentCorePolicy:(id)a3 WithSUScanPolicy:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  objc_msgSend(v32, "softwareUpdateScanPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsCellular:", objc_msgSend(v6, "allowsCellular"));
  objc_msgSend(v7, "setDiscretionary:", objc_msgSend(v6, "discretionary"));
  objc_msgSend(v7, "setRequiresPowerPluggedIn:", objc_msgSend(v6, "requiresPowerPluggedIn"));
  objc_msgSend(v7, "setRestrictToIncremental:", objc_msgSend(v6, "restrictToIncremental"));
  objc_msgSend(v7, "setRestrictToFull:", objc_msgSend(v6, "restrictToFull"));
  objc_msgSend(v7, "setAllowSameVersion:", objc_msgSend(v6, "allowSameVersion"));
  objc_msgSend(v7, "setDownloadTimeoutSecs:", objc_msgSend(v6, "downloadTimeoutSecs"));
  objc_msgSend(v6, "scanType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRampingScanType:", v8);

  objc_msgSend(v6, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSessionId:", v9);

  objc_msgSend(v6, "scanOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedScanOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x24BEAE838]);
    objc_msgSend(v12, "setSupervised:", 1);
    objc_msgSend(v12, "setMDMUseDelayPeriod:", objc_msgSend(v11, "useDelayPeriod") == 1);
    objc_msgSend(v11, "requestedProductMarketingVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRequestedPMV:", v13);

    objc_msgSend(v12, "setDelayPeriodSecs:", objc_msgSend(v11, "delayPeriodSeconds"));
    objc_msgSend(v12, "setMdmSoftwareUpdatePath:", -[SUPolicyFactory coreMDMPathForSUSPath:](self, "coreMDMPathForSUSPath:", objc_msgSend(v11, "MDMSoftwareUpdatePath")));
    -[SUPolicyFactory setPolicyExtension:forPolicy:](self, "setPolicyExtension:forPolicy:", v12, v32);
    SULogDebug(CFSTR("%s: managed scan options = %@, mdmExtension = %@"), v14, v15, v16, v17, v18, v19, v20, (uint64_t)"-[SUPolicyFactory augmentCorePolicy:WithSUScanPolicy:]");

  }
  if (objc_msgSend(v6, "isSplatOnlyScan"))
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowSameVersion:", objc_msgSend(v21, "allowSameRestoreVersionSplatUpdate"));

    v22 = objc_alloc_init(MEMORY[0x24BEAE840]);
    objc_msgSend(MEMORY[0x24BEAEA48], "sharedDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "splatRestoreVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setInstalledSplatRestoreVersion:", v24);

    objc_msgSend(MEMORY[0x24BEAEA48], "sharedDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "splatBuildVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setInstalledSplatBuildVersion:", v26);

    objc_msgSend(MEMORY[0x24BEAEA48], "sharedDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "splatProductVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setInstalledSplatProductVersion:", v28);

    objc_msgSend(MEMORY[0x24BEAEA48], "sharedDevice");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "splatReleaseType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setInstalledSplatReleaseType:", v30);

    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAllowSameRestoreVersion:", objc_msgSend(v31, "allowSameRestoreVersionSplatUpdate"));

    -[SUPolicyFactory setPolicyExtension:forPolicy:](self, "setPolicyExtension:forPolicy:", v22, v32);
  }

}

- (void)augmentCorePolicy:(id)a3 WithDocumentationScanPolicy:(id)a4
{
  NSObject *stateQueue;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  stateQueue = self->_stateQueue;
  v7 = a4;
  dispatch_assert_queue_V2(stateQueue);
  objc_msgSend(v20, "documentationScanPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsCellular:", objc_msgSend(v7, "allowsCellular"));
  objc_msgSend(v8, "setDiscretionary:", objc_msgSend(v7, "discretionary"));
  objc_msgSend(v8, "setRequiresPowerPluggedIn:", objc_msgSend(v7, "requiresPowerPluggedIn"));
  objc_msgSend(v8, "setDownloadTimeoutSecs:", objc_msgSend(v7, "downloadTimeoutSecs"));
  objc_msgSend(v7, "scanOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "managedScanOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BEAE838]);
    objc_msgSend(v11, "setSupervised:", 1);
    objc_msgSend(v11, "setMDMUseDelayPeriod:", objc_msgSend(v10, "useDelayPeriod") == 1);
    objc_msgSend(v10, "requestedProductMarketingVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRequestedPMV:", v12);

    objc_msgSend(v11, "setDelayPeriodSecs:", objc_msgSend(v10, "delayPeriodSeconds"));
    objc_msgSend(v11, "setMdmSoftwareUpdatePath:", -[SUPolicyFactory coreMDMPathForSUSPath:](self, "coreMDMPathForSUSPath:", objc_msgSend(v10, "MDMSoftwareUpdatePath")));
    -[SUPolicyFactory setPolicyExtension:forPolicy:](self, "setPolicyExtension:forPolicy:", v11, v20);
    SULogDebug(CFSTR("%s: managed scan options = %@, mdmExtension = %@"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUPolicyFactory augmentCorePolicy:WithDocumentationScanPolicy:]");

  }
}

- (void)augmentCorePolicy:(id)a3 WithDocumentationDownloadPolicy:(id)a4
{
  NSObject *stateQueue;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  stateQueue = self->_stateQueue;
  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2(stateQueue);
  objc_msgSend(v7, "documentationDownloadPolicy");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAllowsCellular:", objc_msgSend(v6, "allowsCellular"));
  objc_msgSend(v9, "setDiscretionary:", objc_msgSend(v6, "discretionary"));
  objc_msgSend(v9, "setRequiresPowerPluggedIn:", objc_msgSend(v6, "requiresPowerPluggedIn"));
  objc_msgSend(v9, "setRequiresInexpensiveAccess:", objc_msgSend(v6, "allowExpensiveNetwork") ^ 1);
  v8 = objc_msgSend(v6, "downloadTimeoutSecs");

  objc_msgSend(v9, "setDownloadTimeoutSecs:", v8);
}

- (void)augmentCorePolicy:(id)a3 WithLoadBrainPolicy:(id)a4
{
  NSObject *stateQueue;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  stateQueue = self->_stateQueue;
  v7 = a4;
  dispatch_assert_queue_V2(stateQueue);
  objc_msgSend(v20, "loadBrainPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsCellular:", objc_msgSend(v7, "allowsCellular"));
  objc_msgSend(v8, "setDiscretionary:", objc_msgSend(v7, "discretionary"));
  objc_msgSend(v8, "setSkipPhase:", objc_msgSend(v7, "skipPhase"));
  objc_msgSend(v7, "scanOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "managedScanOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BEAE838]);
    objc_msgSend(v11, "setSupervised:", 1);
    objc_msgSend(v11, "setMDMUseDelayPeriod:", objc_msgSend(v10, "useDelayPeriod") == 1);
    objc_msgSend(v10, "requestedProductMarketingVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRequestedPMV:", v12);

    objc_msgSend(v11, "setDelayPeriodSecs:", objc_msgSend(v10, "delayPeriodSeconds"));
    objc_msgSend(v11, "setMdmSoftwareUpdatePath:", -[SUPolicyFactory coreMDMPathForSUSPath:](self, "coreMDMPathForSUSPath:", objc_msgSend(v10, "MDMSoftwareUpdatePath")));
    -[SUPolicyFactory setPolicyExtension:forPolicy:](self, "setPolicyExtension:forPolicy:", v11, v20);
    SULogDebug(CFSTR("%s: managed scan options = %@, mdmExtension = %@"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUPolicyFactory augmentCorePolicy:WithLoadBrainPolicy:]");

  }
}

- (void)augmentCorePolicy:(id)a3 WithPreflightPolicy:(id)a4
{
  NSObject *stateQueue;
  id v5;
  id v6;

  stateQueue = self->_stateQueue;
  v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  objc_msgSend(v5, "downloadPreflightPolicy");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSkipPhase:", 0);
}

- (void)augmentCorePolicy:(id)a3 WithSUDownloadPolicy:(id)a4
{
  NSObject *stateQueue;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  stateQueue = self->_stateQueue;
  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2(stateQueue);
  objc_msgSend(v7, "softwareUpdateDownloadPolicy");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAllowsCellular:", objc_msgSend(v6, "allowsCellular"));
  objc_msgSend(v9, "setDiscretionary:", objc_msgSend(v6, "discretionary"));
  objc_msgSend(v9, "setRequiresPowerPluggedIn:", objc_msgSend(v6, "requiresPowerPluggedIn"));
  objc_msgSend(v9, "setDownloadTimeoutSecs:", objc_msgSend(v6, "downloadTimeoutSecs"));
  objc_msgSend(v9, "setRequiresInexpensiveAccess:", objc_msgSend(v6, "allowExpensiveNetwork") ^ 1);
  v8 = objc_msgSend(v6, "skipPhase");

  objc_msgSend(v9, "setSkipPhase:", v8);
}

- (void)augmentCorePolicy:(id)a3 WithPreparePolicy:(id)a4
{
  NSObject *stateQueue;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  stateQueue = self->_stateQueue;
  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2(stateQueue);
  objc_msgSend(v7, "preparePolicy");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "skipPhase");
  objc_msgSend(v9, "setSkipPhase:", v8);

}

- (void)augmentCorePolicy:(id)a3 WithSuspendPolicy:(id)a4
{
  NSObject *stateQueue;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  stateQueue = self->_stateQueue;
  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2(stateQueue);
  objc_msgSend(v7, "suspendPolicy");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "skipPhase");
  objc_msgSend(v9, "setSkipPhase:", v8);

}

- (void)augmentCorePolicy:(id)a3 WithResumePolicy:(id)a4
{
  NSObject *stateQueue;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  stateQueue = self->_stateQueue;
  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2(stateQueue);
  objc_msgSend(v7, "resumePolicy");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "skipPhase");
  objc_msgSend(v9, "setSkipPhase:", v8);

}

- (void)augmentCorePolicy:(id)a3 WithApplyPolicy:(id)a4
{
  NSObject *stateQueue;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  id v14;

  v14 = a3;
  stateQueue = self->_stateQueue;
  v7 = a4;
  dispatch_assert_queue_V2(stateQueue);
  objc_msgSend(v14, "applyPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSkipPhase:", objc_msgSend(v7, "skipPhase"));
  objc_msgSend(v7, "installOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v9, "isManaged");
  if ((_DWORD)v7)
  {
    -[SUDownloadOptions descriptor](self->_downloadOptions, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "updateType");

    v12 = objc_opt_class();
    if (v11 == 4)
    {
      -[SUPolicyFactory removePolicyExtensionOfClass:forPolicy:](self, "removePolicyExtensionOfClass:forPolicy:", v12, v14);
    }
    else
    {
      -[SUPolicyFactory existingExtensionOfClass:inPolicy:](self, "existingExtensionOfClass:inPolicy:", v12, v14);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
        v13 = objc_alloc_init(MEMORY[0x24BEAE838]);
      objc_msgSend(v13, "setSupervised:", 1);
      -[SUPolicyFactory setPolicyExtension:forPolicy:](self, "setPolicyExtension:forPolicy:", v13, v14);

    }
  }

}

- (void)augmentCorePolicy:(id)a3 WithRollbackPolicy:(id)a4
{
  NSObject *stateQueue;
  id v6;
  id v7;
  id v8;

  stateQueue = self->_stateQueue;
  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2(stateQueue);
  objc_msgSend(v7, "rollbackPolicy");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPerformPhase:", objc_msgSend(v6, "skipPhase") ^ 1);
  LODWORD(v7) = objc_msgSend(v6, "cancelActiveUpdate");

  objc_msgSend(v8, "setSkipCancelPreviousUpdate:", v7 ^ 1);
  objc_msgSend(v8, "setAdditionalOptions:", 0);
  objc_msgSend(v8, "setBaseRollbackOptions:", 0);

}

- (unint64_t)coreMDMPathForSUSPath:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;

  result = a3;
  if (a3 >= 3)
  {
    SULogInfo(CFSTR("Unable to map SUS MDM SU path to SUCore MDM SU path (%lu). Returning SUCoreMDMSoftwareUpdatePathDefault"), (uint64_t)a2, a3, v3, v4, v5, v6, v7, a3);
    return 0;
  }
  return result;
}

- (id)_SUAssetTypeForScanOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3
    && objc_msgSend(v3, "containsType:", 4)
    && (objc_msgSend(v4, "types"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 == 1))
  {
    v7 = 7;
  }
  else
  {
    v7 = 1;
  }
  objc_msgSend(MEMORY[0x24BEAE848], "getAssetTypeForKind:usingFamily:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_rollbackOptions, 0);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_downloadOptions, 0);
  objc_storeStrong((id *)&self->_scanOption, 0);
  objc_storeStrong((id *)&self->_globalOptions, 0);
  objc_storeStrong((id *)&self->_rollbackPolicy, 0);
  objc_storeStrong((id *)&self->_corePolicy, 0);
}

@end
