@implementation UISharingControllerActivityItemProvider

uint64_t __110___UISharingControllerActivityItemProvider_registerCloudKitShareWithPreparationHandler_allowedSharingOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

uint64_t __110___UISharingControllerActivityItemProvider_registerCloudKitShareWithPreparationHandler_allowedSharingOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *);
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __110___UISharingControllerActivityItemProvider_registerCloudKitShareWithPreparationHandler_allowedSharingOptions___block_invoke_3;
  v8[3] = &unk_1E16ED450;
  v4 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v5 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
  v6 = v3;
  v5(v4, v8);

  return 0;
}

void __110___UISharingControllerActivityItemProvider_registerCloudKitShareWithPreparationHandler_allowedSharingOptions___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7 && v8)
  {
    objc_msgSend(v8, "setupInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    objc_msgSend(v12, "containerOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applicationBundleIdentifierOverrideForContainerAccess");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(v12, "containerOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "primaryIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setApplicationBundleIdentifierOverride:", v16);

    }
    v17 = (void *)objc_msgSend(objc_alloc((Class)getCKPreSharingContextClass()), "initWithShare:containerSetupInfo:allowedOptions:", v7, v12, *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    goto LABEL_10;
  }
  v18 = *(_QWORD *)(a1 + 40);
  v19 = v9;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v20 = getCKXPCSuitableErrorSymbolLoc_ptr;
  v28 = getCKXPCSuitableErrorSymbolLoc_ptr;
  if (!getCKXPCSuitableErrorSymbolLoc_ptr)
  {
    v21 = CloudKitLibrary();
    v20 = dlsym(v21, "CKXPCSuitableError");
    v26[3] = (uint64_t)v20;
    getCKXPCSuitableErrorSymbolLoc_ptr = v20;
  }
  _Block_object_dispose(&v25, 8);
  if (v20)
  {
    ((void (*)(id))v20)(v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v22);
LABEL_10:

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSError *_CKXPCSuitableError(NSError * _Nullable __strong)");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("UICloudSharingController.m"), 67, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
