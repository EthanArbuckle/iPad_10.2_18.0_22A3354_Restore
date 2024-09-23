@implementation PRSExternalSystemService

- (id)service
{
  PRSExternalSystemService *v2;
  PRSService *service;
  uint64_t v4;
  PRSService *v5;
  PRSService *v6;

  v2 = self;
  objc_sync_enter(v2);
  service = v2->_service;
  if (!service)
  {
    v4 = objc_opt_new();
    v5 = v2->_service;
    v2->_service = (PRSService *)v4;

    service = v2->_service;
  }
  v6 = service;
  objc_sync_exit(v2);

  return v6;
}

- (void)fetchEligibleConfigurationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[PRSExternalSystemService service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__PRSExternalSystemService_fetchEligibleConfigurationsWithCompletion___block_invoke;
    v9[3] = &unk_1E4D42908;
    v10 = v5;
    v7 = v5;
    objc_msgSend(v6, "fetchPosterConfigurations:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completionHandler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSExternalSystemService fetchEligibleConfigurationsWithCompletion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __70__PRSExternalSystemService_fetchEligibleConfigurationsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v19 = a1;
  v33 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v20 = a3;
  v21 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "providerBundleIdentifier", v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider")))
        {
          objc_msgSend(v9, "_path");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "contentsURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = 0;
          v29 = &v28;
          v30 = 0x2050000000;
          v13 = (void *)getPFPosterConfigurationClass_softClass;
          v31 = getPFPosterConfigurationClass_softClass;
          if (!getPFPosterConfigurationClass_softClass)
          {
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __getPFPosterConfigurationClass_block_invoke;
            v27[3] = &unk_1E4D42598;
            v27[4] = &v28;
            __getPFPosterConfigurationClass_block_invoke((uint64_t)v27);
            v13 = (void *)v29[3];
          }
          v14 = objc_retainAutorelease(v13);
          _Block_object_dispose(&v28, 8);
          v22 = 0;
          objc_msgSend(v14, "loadFromURL:error:", v12, &v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v22;
          v17 = v16;
          if (v15 && !v16 && !objc_msgSend(v15, "configurationType"))
          {
            objc_msgSend(v9, "serverUUID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "bs_safeAddObject:", v18);

          }
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(v19 + 32) + 16))();
}

- (void)updatePosterMatchingUUID:(id)a3 withConfiguration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  PRSService *service;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  NSClassFromString(CFSTR("WFWallpaperConfiguration"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSExternalSystemService updatePosterMatchingUUID:withConfiguration:completion:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49CBEA8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:WFWallpaperConfigurationClass]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSExternalSystemService updatePosterMatchingUUID:withConfiguration:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49CBF0CLL);
  }

  v12 = v8;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSExternalSystemService updatePosterMatchingUUID:withConfiguration:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49CBF70);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSExternalSystemService updatePosterMatchingUUID:withConfiguration:completion:].cold.2();
    goto LABEL_17;
  }

  +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:](PRSPosterUpdate, "posterUpdatesForWFWallpaperConfiguration:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  service = self->_service;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __82__PRSExternalSystemService_updatePosterMatchingUUID_withConfiguration_completion___block_invoke;
  v19[3] = &unk_1E4D43410;
  v20 = v10;
  v15 = v10;
  -[PRSService updatePosterConfigurationMatchingUUID:updates:completion:](service, "updatePosterConfigurationMatchingUUID:updates:completion:", v12, v13, v19);

}

void __82__PRSExternalSystemService_updatePosterMatchingUUID_withConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void (*v10)(void);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a4)
  {
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v16, "error", (_QWORD)v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v18 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v16, "error");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v19);

            goto LABEL_14;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v13)
          continue;
        break;
      }
    }

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v10();
LABEL_14:

}

- (void)createLockScreenPhotosPosterWithImageAtURL:(id)a3 selectLockScreenPoster:(BOOL)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSExternalSystemService.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  if ((objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSExternalSystemService.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[imageURL checkResourceIsReachableAndReturnError:nil]"));

  }
  -[PRSExternalSystemService service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke;
  v17[3] = &unk_1E4D43488;
  v19 = v9;
  v20 = v10;
  v18 = v11;
  v21 = a4;
  v12 = v9;
  v13 = v11;
  v14 = v10;
  objc_msgSend(v13, "createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:completion:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"), 0, v17);

}

void __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    +[PRSPosterUpdate posterUpdateLockScreenPosterWithImageAtURL:](PRSPosterUpdate, "posterUpdateLockScreenPosterWithImageAtURL:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke_2;
    v8[3] = &unk_1E4D43460;
    v9 = *(id *)(a1 + 32);
    v10 = v5;
    v11 = *(id *)(a1 + 48);
    v12 = *(_BYTE *)(a1 + 56);
    objc_msgSend(v6, "updatePosterConfiguration:update:completion:", v10, v7, v8);

  }
}

void __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "serverUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke_3;
    v17[3] = &unk_1E4D43438;
    v19 = *(id *)(a1 + 48);
    v18 = v9;
    objc_msgSend(v10, "deletePosterConfigurationsMatchingUUID:completion:", v11, v17);

    v12 = v19;
  }
  else
  {
    if (!*(_BYTE *)(a1 + 56))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_6;
    }
    v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke_4;
    v14[3] = &unk_1E4D43438;
    v16 = *(id *)(a1 + 48);
    v15 = v7;
    objc_msgSend(v13, "updateToSelectedConfiguration:completion:", v15, v14);

    v12 = v16;
  }

LABEL_6:
}

uint64_t __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __105__PRSExternalSystemService_createLockScreenPhotosPosterWithImageAtURL_selectLockScreenPoster_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void)updateLockScreenPhotosPoster:(id)a3 withImageAtURL:(id)a4 selectLockScreenPoster:(BOOL)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v13)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSExternalSystemService.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSExternalSystemService.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("poster"));

LABEL_3:
  if ((objc_msgSend(v12, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSExternalSystemService.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[imageURL checkResourceIsReachableAndReturnError:nil]"));

  }
  -[PRSExternalSystemService service](self, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __106__PRSExternalSystemService_updateLockScreenPhotosPoster_withImageAtURL_selectLockScreenPoster_completion___block_invoke;
  v22[3] = &unk_1E4D434D8;
  v23 = v11;
  v24 = v14;
  v25 = v12;
  v26 = v13;
  v27 = a5;
  v15 = v12;
  v16 = v14;
  v17 = v11;
  v18 = v13;
  -[PRSExternalSystemService fetchEligibleConfigurationsWithCompletion:](self, "fetchEligibleConfigurationsWithCompletion:", v22);

}

void __106__PRSExternalSystemService_updateLockScreenPhotosPoster_withImageAtURL_selectLockScreenPoster_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  char v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "serverUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if ((v7 & 1) != 0)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      +[PRSPosterUpdate posterUpdateLockScreenPosterWithImageAtURL:](PRSPosterUpdate, "posterUpdateLockScreenPosterWithImageAtURL:", *(_QWORD *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __106__PRSExternalSystemService_updateLockScreenPhotosPoster_withImageAtURL_selectLockScreenPoster_completion___block_invoke_2;
      v15[3] = &unk_1E4D434B0;
      v17 = *(id *)(a1 + 56);
      v18 = *(_BYTE *)(a1 + 64);
      v16 = *(id *)(a1 + 40);
      objc_msgSend(v8, "updatePosterConfiguration:update:completion:", v9, v10, v15);

    }
    else
    {
      v11 = *(_QWORD *)(a1 + 56);
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2D68];
      v20[0] = CFSTR("Poster is not eligible");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.posterboardservices"), 0, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v14);

    }
  }

}

void __106__PRSExternalSystemService_updateLockScreenPhotosPoster_withImageAtURL_selectLockScreenPoster_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (*v10)(void);
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __106__PRSExternalSystemService_updateLockScreenPhotosPoster_withImageAtURL_selectLockScreenPoster_completion___block_invoke_3;
      v12[3] = &unk_1E4D43438;
      v11 = *(void **)(a1 + 32);
      v14 = *(id *)(a1 + 40);
      v13 = v7;
      objc_msgSend(v11, "updateToSelectedConfiguration:completion:", v13, v12);

      goto LABEL_6;
    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v10();
LABEL_6:

}

uint64_t __106__PRSExternalSystemService_updateLockScreenPhotosPoster_withImageAtURL_selectLockScreenPoster_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void)updateHomeScreenImageForLockScreenPoster:(id)a3 withImageAtURL:(id)a4 selectLockPoster:(BOOL)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  BOOL v24;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v13)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSExternalSystemService.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSExternalSystemService.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("poster"));

LABEL_3:
  if ((objc_msgSend(v12, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSExternalSystemService.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[imageURL checkResourceIsReachableAndReturnError:nil]"));

  }
  -[PRSExternalSystemService service](self, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRSPosterUpdate posterUpdateHomeScreenPosterWithImageAtURL:](PRSPosterUpdate, "posterUpdateHomeScreenPosterWithImageAtURL:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __112__PRSExternalSystemService_updateHomeScreenImageForLockScreenPoster_withImageAtURL_selectLockPoster_completion___block_invoke;
  v21[3] = &unk_1E4D434B0;
  v24 = a5;
  v22 = v14;
  v23 = v13;
  v16 = v14;
  v17 = v13;
  objc_msgSend(v16, "updatePosterConfiguration:update:completion:", v11, v15, v21);

}

void __112__PRSExternalSystemService_updateHomeScreenImageForLockScreenPoster_withImageAtURL_selectLockPoster_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (*v10)(void);
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __112__PRSExternalSystemService_updateHomeScreenImageForLockScreenPoster_withImageAtURL_selectLockPoster_completion___block_invoke_2;
      v12[3] = &unk_1E4D43438;
      v11 = *(void **)(a1 + 32);
      v14 = *(id *)(a1 + 40);
      v13 = v7;
      objc_msgSend(v11, "updateToSelectedConfiguration:completion:", v13, v12);

      goto LABEL_6;
    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v10();
LABEL_6:

}

uint64_t __112__PRSExternalSystemService_updateHomeScreenImageForLockScreenPoster_withImageAtURL_selectLockPoster_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)fetchEligibleConfigurationsWithCompletion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)updatePosterMatchingUUID:withConfiguration:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)updatePosterMatchingUUID:withConfiguration:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
