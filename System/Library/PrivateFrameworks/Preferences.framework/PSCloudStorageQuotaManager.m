@implementation PSCloudStorageQuotaManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PSCloudStorageQuotaManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)gSharedQuotaManager;
}

void __43__PSCloudStorageQuotaManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)gSharedQuotaManager;
  gSharedQuotaManager = v0;

}

- (void)getQuotaInfoForPrimaryAccountCompletion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v4 = (void *)getQuotaRequestManagerClass_softClass;
  v15 = getQuotaRequestManagerClass_softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getQuotaRequestManagerClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getQuotaRequestManagerClass_block_invoke;
    v11[3] = &unk_1E4A65650;
    v11[4] = &v12;
    __getQuotaRequestManagerClass_block_invoke((uint64_t)v11);
    v4 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v6, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __70__PSCloudStorageQuotaManager_getQuotaInfoForPrimaryAccountCompletion___block_invoke;
  v9[3] = &unk_1E4A68500;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "getQuotaInfoDetailed:handler:", 1, v9);

}

void __70__PSCloudStorageQuotaManager_getQuotaInfoForPrimaryAccountCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "quotaInfo");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

@end
