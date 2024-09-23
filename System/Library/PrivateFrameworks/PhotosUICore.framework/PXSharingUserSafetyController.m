@implementation PXSharingUserSafetyController

+ (BOOL)userSafetyInterventionCheckRequired
{
  void *v2;
  int v3;
  NSObject *v4;
  uint8_t v6[16];

  if (!PFOSVariantHasInternalUI())
    return objc_msgSend(getUSSensitivityAnalyzerClass(), "isCommunicationSafetyEnabled");
  PXSharedUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("alwaysShowUserSafetyInterventionUI"));

  if (!v3)
    return objc_msgSend(getUSSensitivityAnalyzerClass(), "isCommunicationSafetyEnabled");
  PLSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "[Civic] Force showing safety intervention UI.", v6, 2u);
  }

  return 1;
}

+ (void)userSafetyInterventionCheckRequiredBeforeSharingAssets:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__PXSharingUserSafetyController_userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke;
  v10[3] = &unk_1E51404B8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "_userSafetyInterventionCheckRequiredBeforeSharingAssets:completion:", v9, v10);

}

+ (void)_userSafetyInterventionCheckRequiredBeforeSharingAssets:(id)a3 completion:(id)a4
{
  id v6;
  dispatch_group_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id obj;
  id v30;
  void *v31;
  _QWORD block[4];
  id v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD aBlock[4];
  NSObject *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD v60[5];
  id v61;
  _QWORD v62[5];
  id v63;
  _QWORD v64[3];
  char v65;
  _QWORD v66[3];
  char v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  uint64_t v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v6 = a4;
  if (objc_msgSend(a1, "userSafetyInterventionCheckRequired"))
  {
    v27 = v6;
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x2020000000;
    v67 = 0;
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x2020000000;
    v65 = 0;
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x3032000000;
    v62[3] = __Block_byref_object_copy__257038;
    v62[4] = __Block_byref_object_dispose__257039;
    v63 = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x3032000000;
    v60[3] = __Block_byref_object_copy__257038;
    v60[4] = __Block_byref_object_dispose__257039;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v61 = (id)objc_claimAutoreleasedReturnValue();
    v7 = dispatch_group_create();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke;
    aBlock[3] = &unk_1E51404E0;
    v57 = v66;
    v58 = v64;
    v59 = v62;
    v8 = v7;
    v56 = v8;
    v31 = _Block_copy(aBlock);
    v30 = objc_alloc_init((Class)getUSSensitivityAnalyzerClass());
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v28;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v52 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          dispatch_group_enter(v8);
          PLSharingGetLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "localIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v12, "mediaType");
            *(_DWORD *)buf = 138412546;
            v69 = v14;
            v70 = 2048;
            v71 = v15;
            _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "[Civic] Analyzing %@ with media type: %ld", buf, 0x16u);

          }
          objc_msgSend(v12, "localIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "photoLibrary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "photoLibraryURL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = objc_msgSend(v12, "mediaType");
          if (v19 == 2)
          {
            v38[0] = MEMORY[0x1E0C809B0];
            v38[1] = 3221225472;
            v38[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_85;
            v38[3] = &unk_1E51405E8;
            v38[4] = v12;
            v44 = v60;
            v23 = v30;
            v39 = v23;
            v24 = v16;
            v40 = v24;
            v25 = v18;
            v41 = v25;
            v42 = &__block_literal_global_257042;
            v43 = v31;
            objc_msgSend(v23, "analyzeVideoWithLocalIdentifier:fromPhotoLibraryWithURL:progressHandler:completionHandler:", v24, v25, &__block_literal_global_257042, v38);

          }
          else if (v19 == 1)
          {
            v45[0] = MEMORY[0x1E0C809B0];
            v45[1] = 3221225472;
            v45[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_79;
            v45[3] = &unk_1E5140558;
            v45[4] = v12;
            v50 = v60;
            v20 = v30;
            v46 = v20;
            v21 = v16;
            v47 = v21;
            v22 = v18;
            v48 = v22;
            v49 = v31;
            objc_msgSend(v20, "analyzeImageWithLocalIdentifier:fromPhotoLibraryWithURL:completionHandler:", v21, v22, v45);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Unsupported Media Type"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(void *, void *, _QWORD, void *))v31 + 2))(v31, v12, 0, v26);

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
      }
      while (v9);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_3_91;
    block[3] = &unk_1E5140610;
    v34 = v60;
    v33 = v27;
    v35 = v66;
    v36 = v64;
    v37 = v62;
    dispatch_group_notify(v8, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v60, 8);
    _Block_object_dispose(v62, 8);

    _Block_object_dispose(v64, 8);
    _Block_object_dispose(v66, 8);
    v6 = v27;
  }

}

+ (id)interventionViewControllerWithAction:(id)a3
{
  id v3;
  _PXSharingUserSafetyControllerDelegate *v4;
  uint64_t v5;
  id v6;
  _PXSharingUserSafetyControllerDelegate *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  _PXSharingUserSafetyControllerDelegate *v13;
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  v4 = objc_alloc_init(_PXSharingUserSafetyControllerDelegate);
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PXSharingUserSafetyController_interventionViewControllerWithAction___block_invoke;
  v12[3] = &unk_1E5140638;
  v6 = v3;
  v14 = v6;
  v7 = v4;
  v13 = v7;
  -[_PXSharingUserSafetyControllerDelegate configureAction:](v7, "configureAction:", v12);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v8 = (void *)getSCUIInterventionViewControllerClass_softClass;
  v19 = getSCUIInterventionViewControllerClass_softClass;
  if (!getSCUIInterventionViewControllerClass_softClass)
  {
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __getSCUIInterventionViewControllerClass_block_invoke;
    v15[3] = &unk_1E51482E0;
    v15[4] = &v16;
    __getSCUIInterventionViewControllerClass_block_invoke((uint64_t)v15);
    v8 = (void *)v17[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v16, 8);
  objc_msgSend(v9, "viewControllerWithWorkflow:contextDictionary:", 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setModalInPresentation:", 1);
  objc_msgSend(v10, "setModalPresentationStyle:", 2);
  objc_msgSend(v10, "setInterventionDelegate:", v7);

  return v10;
}

+ (id)interventionAlertControllerWithAction:(id)a3
{
  id v3;
  _PXSharingUserSafetyControllerDelegate *v4;
  uint64_t v5;
  id v6;
  _PXSharingUserSafetyControllerDelegate *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  _PXSharingUserSafetyControllerDelegate *v13;
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  v4 = objc_alloc_init(_PXSharingUserSafetyControllerDelegate);
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PXSharingUserSafetyController_interventionAlertControllerWithAction___block_invoke;
  v12[3] = &unk_1E5140638;
  v6 = v3;
  v14 = v6;
  v7 = v4;
  v13 = v7;
  -[_PXSharingUserSafetyControllerDelegate configureAction:](v7, "configureAction:", v12);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v8 = (void *)getSCUIInterventionAlertControllerClass_softClass;
  v19 = getSCUIInterventionAlertControllerClass_softClass;
  if (!getSCUIInterventionAlertControllerClass_softClass)
  {
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __getSCUIInterventionAlertControllerClass_block_invoke;
    v15[3] = &unk_1E51482E0;
    v15[4] = &v16;
    __getSCUIInterventionAlertControllerClass_block_invoke((uint64_t)v15);
    v8 = (void *)v17[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v16, 8);
  objc_msgSend(v9, "viewControllerWithWorkflow:contextDictionary:", 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInterventionDelegate:", v7);

  return v10;
}

uint64_t __71__PXSharingUserSafetyController_interventionAlertControllerWithAction___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "configureAction:", 0);
}

uint64_t __70__PXSharingUserSafetyController_interventionViewControllerWithAction___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "configureAction:", 0);
}

void __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  __CFString *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  PLSharingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "localIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = v11;
      v25 = 2048;
      v26 = objc_msgSend(v7, "mediaType");
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "[Civic] Failed to analyze %@ with media type: %ld (error: %@)", (uint8_t *)&v23, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = v8;
    v10 = *(NSObject **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "localIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v7, "mediaType");
    v16 = CFSTR("NO");
    if (a3)
      v16 = CFSTR("YES");
    v17 = v16;
    v23 = 138412802;
    v24 = v14;
    v25 = 2048;
    v26 = v15;
    v27 = 2112;
    v28 = v17;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "[Civic] Analysis completed for %@ with media type: %ld (isSensitive: %@)", (uint8_t *)&v23, 0x20u);

  }
  if (PFOSVariantHasInternalUI())
  {
    PXSharedUserDefaults();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("alwaysShowUserSafetyInterventionUI"));

    if (v19)
    {
      PLSharingGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "[Civic] Force showing safety intervention UI.", (uint8_t *)&v23, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = 0;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_79(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PLSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(a1 + 32), "mediaType");
      *(_DWORD *)buf = 138412802;
      v22 = v6;
      v23 = 2048;
      v24 = v7;
      v25 = 2112;
      v26 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "[Civic] Failed to analyze %@ with media type: %ld (error: %@). Will retry after download.", buf, 0x20u);

    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1740]), "initWithAsset:requestType:", *(_QWORD *)(a1 + 32), 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v8);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_81;
    v13[3] = &unk_1E5140530;
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v9 = *(id *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 72);
    v19 = v9;
    v20 = v11;
    v17 = v10;
    v18 = v8;
    v12 = v8;
    objc_msgSend(v12, "retrieveRequiredResourcesWithOptions:completionHandler:", 0, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_85(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PLSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(a1 + 32), "mediaType");
      *(_DWORD *)buf = 138412802;
      v23 = v6;
      v24 = 2048;
      v25 = v7;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "[Civic] Failed to analyze %@ with media type: %ld (error: %@). Will retry after download.", buf, 0x20u);

    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1740]), "initWithAsset:requestType:", *(_QWORD *)(a1 + 32), 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObject:", v8);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_86;
    v13[3] = &unk_1E51405C0;
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 64);
    v9 = *(id *)(a1 + 72);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 80);
    v20 = v9;
    v21 = v11;
    v17 = v10;
    v18 = v8;
    v12 = v8;
    objc_msgSend(v12, "retrieveRequiredResourcesWithOptions:completionHandler:", 0, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

uint64_t __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_3_91(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
}

void __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_3(double a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412546;
    v7 = v4;
    v8 = 2048;
    v9 = a1;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "[Civic] Analyzing %@ with progress: %f", (uint8_t *)&v6, 0x16u);
  }

}

void __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_86(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_2_87;
  v9[3] = &unk_1E5140508;
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(id *)(a1 + 80);
  v7 = *(void **)(a1 + 64);
  v9[4] = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 88);
  v11 = v6;
  v12 = v8;
  v10 = v7;
  objc_msgSend(v2, "analyzeVideoWithLocalIdentifier:fromPhotoLibraryWithURL:progressHandler:completionHandler:", v3, v4, v5, v9);

}

uint64_t __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_2_87(_QWORD *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "removeObject:", a1[5]);
}

void __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_81(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_2;
  v8[3] = &unk_1E5140508;
  v5 = *(id *)(a1 + 72);
  v6 = *(void **)(a1 + 64);
  v8[4] = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 80);
  v10 = v5;
  v11 = v7;
  v9 = v6;
  objc_msgSend(v2, "analyzeImageWithLocalIdentifier:fromPhotoLibraryWithURL:completionHandler:", v3, v4, v8);

}

uint64_t __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_2(_QWORD *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "removeObject:", a1[5]);
}

void __99__PXSharingUserSafetyController_userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_FAULT, "User safety intervention check failed to analyze fetch result (%@): %@", (uint8_t *)&v9, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
