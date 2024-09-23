@implementation PBFGalleryController

- (PBFGalleryController)initWithGalleryCacheURL:(id)a3 runtimeAssertionProvider:(id)a4
{
  id v6;
  id v7;
  PBFProactivePosterGalleryLayoutProvider *v8;
  PBFGalleryController *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(PBFProactivePosterGalleryLayoutProvider);
  v9 = -[PBFGalleryController initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:](self, "initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:", v7, v8, v6);

  return v9;
}

- (PBFGalleryController)initWithGalleryCacheURL:(id)a3 galleryLayoutProvider:(id)a4 runtimeAssertionProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryController initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:].cold.1();
LABEL_23:
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAD7A8CLL);
  }
  v11 = v10;
  if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EF9EC398) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFRuntimeAssertionProviding)]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryController initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:].cold.1();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAD7AF0);
  }

  v12 = v9;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryController initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:].cold.2();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAD7B54);
  }
  v13 = v12;
  if ((objc_msgSend(v12, "conformsToProtocol:", &unk_1EF9E4F48) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFPosterGalleryLayoutProviding)]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryController initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:].cold.2();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAD7BB8);
  }

  if ((objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[URL checkResourceIsReachableAndReturnError:((void *)0)]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryController initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:].cold.3();
    goto LABEL_23;
  }
  v28.receiver = self;
  v28.super_class = (Class)PBFGalleryController;
  v14 = -[PBFGalleryController init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v8, "copy");
    v16 = (void *)*((_QWORD *)v14 + 2);
    *((_QWORD *)v14 + 2) = v15;

    v17 = objc_opt_new();
    v18 = (void *)*((_QWORD *)v14 + 1);
    *((_QWORD *)v14 + 1) = v17;

    objc_storeStrong((id *)v14 + 18, a4);
    *((_DWORD *)v14 + 6) = 0;
    objc_storeWeak((id *)v14 + 17, v11);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)v14 + 14);
    *((_QWORD *)v14 + 14) = v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    v22 = (void *)*((_QWORD *)v14 + 4);
    *((_QWORD *)v14 + 4) = v21;

    *(_OWORD *)(v14 + 120) = xmmword_1CBB8E490;
    os_unfair_lock_lock((os_unfair_lock_t)v14 + 6);
    objc_msgSend(v14, "_stateLock_loadPersistedGalleryConfigurationWithLastUpdateDate:error:", 0, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)v14 + 6);
  }

  return (PBFGalleryController *)v14;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  PBFGalleryController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    PBFLogGallery();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v6 = self;
      _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating gallery controller %p during dealloc", buf, 0xCu);
    }

  }
  v4.receiver = self;
  v4.super_class = (Class)PBFGalleryController;
  -[PBFGalleryController dealloc](&v4, sel_dealloc);
}

- (PRSPosterGalleryLayout)currentGalleryConfiguration
{
  os_unfair_lock_s *p_stateLock;
  PRSPosterGalleryLayout *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_stateLock_lastUsefulGalleryConfiguration;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (NSDate)lastUpdateDate
{
  os_unfair_lock_s *p_stateLock;
  NSDate *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_stateLock_lastUsefulGalleryConfigurationPersistDate;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (double)minimumIntervalBetweenProactivePush
{
  os_unfair_lock_s *p_stateLock;
  double stateLock_minimumIntervalBetweenProactivePush;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  stateLock_minimumIntervalBetweenProactivePush = self->_stateLock_minimumIntervalBetweenProactivePush;
  os_unfair_lock_unlock(p_stateLock);
  return stateLock_minimumIntervalBetweenProactivePush;
}

- (double)maximumIntervalBetweenProactivePush
{
  os_unfair_lock_s *p_stateLock;
  double stateLock_maximumIntervalBetweenProactivePush;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  stateLock_maximumIntervalBetweenProactivePush = self->_stateLock_maximumIntervalBetweenProactivePush;
  os_unfair_lock_unlock(p_stateLock);
  return stateLock_maximumIntervalBetweenProactivePush;
}

- (void)setMinimumIntervalBetweenProactivePush:(double)a3
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_stateLock_minimumIntervalBetweenProactivePush != a3)
    self->_stateLock_minimumIntervalBetweenProactivePush = a3;
  os_unfair_lock_unlock(p_stateLock);
}

- (void)setMaximumIntervalBetweenProactivePush:(double)a3
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_stateLock_maximumIntervalBetweenProactivePush != a3)
    self->_stateLock_maximumIntervalBetweenProactivePush = a3;
  os_unfair_lock_unlock(p_stateLock);
}

- (unint64_t)currentProactiveInfractionCount
{
  os_unfair_lock_s *p_stateLock;
  unint64_t stateLock_proactiveInfractionCount;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  stateLock_proactiveInfractionCount = self->_stateLock_proactiveInfractionCount;
  os_unfair_lock_unlock(p_stateLock);
  return stateLock_proactiveInfractionCount;
}

- (id)runtimeAssertionProviderWithError:(id *)a3
{
  PBFRuntimeAssertionProviding **p_runtimeAssertionProvider;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  p_runtimeAssertionProvider = &self->_runtimeAssertionProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_runtimeAssertionProvider);

  if (a3 && !WeakRetained)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D68];
    v10[0] = CFSTR("runtimeAssertionProvider was nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pbf_generalErrorWithCode:userInfo:", 3, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return objc_loadWeakRetained((id *)p_runtimeAssertionProvider);
}

- (id)galleryLayoutProviderWithError:(id *)a3
{
  PBFPosterGalleryLayoutProviding *galleryLayoutProvider;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  galleryLayoutProvider = self->_galleryLayoutProvider;
  if (a3 && !galleryLayoutProvider)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D68];
    v10[0] = CFSTR("galleryProvider was nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pbf_generalErrorWithCode:userInfo:", 3, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    galleryLayoutProvider = self->_galleryLayoutProvider;
  }
  return galleryLayoutProvider;
}

- (void)enqueueGalleryConfigurationUpdateWithOptions:(unint64_t)a3 powerLogReason:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;
  int64_t v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke;
  v13[3] = &unk_1E86F7548;
  v13[4] = self;
  v14 = v9;
  v18 = (a3 & 4) != 0;
  v19 = (a3 & 8) != 0;
  v20 = (a3 & 2) != 0;
  v15 = v8;
  v16 = a3;
  v17 = a4;
  v11 = v8;
  v12 = v9;
  PBFDispatchAsyncWithString(v10, QOS_CLASS_DEFAULT, v13);

}

void __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id *v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _PBFGalleryEnqueuedRefreshGalleryRequest *v23;
  int v24;
  NSObject *v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  NSObject *v34;
  _PBFGalleryEnqueuedRefreshGalleryRequest *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  _QWORD aBlock[4];
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  _BYTE v49[10];
  __int16 v50;
  int v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  PBFLogGallery();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(unsigned __int8 *)(a1 + 72);
    v7 = *(unsigned __int8 *)(a1 + 73);
    v8 = *(unsigned __int8 *)(a1 + 74);
    *(_DWORD *)buf = 138544386;
    v47 = v5;
    v48 = 1024;
    *(_DWORD *)v49 = v6;
    *(_WORD *)&v49[4] = 1024;
    *(_DWORD *)&v49[6] = v7;
    v50 = 1024;
    v51 = v8;
    v52 = 2114;
    v53 = v3;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; dontQueryJustUseLocal:%{BOOL}u checkIfGalleryIsStale:%{"
      "BOOL}u persist:%{BOOL}u; lastHydrationDate %{public}@",
      buf,
      0x28u);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "getFlag"))
  {
    PBFLogGallery();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v47 = v10;
      _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; invalidated",
        buf,
        0xCu);
    }

    v11 = *(void **)(a1 + 48);
    if (v11)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_84;
      aBlock[3] = &unk_1E86F5418;
      v12 = &v45;
      v45 = v11;
      v13 = (void (**)(_QWORD))_Block_copy(aBlock);
      goto LABEL_22;
    }
    goto LABEL_37;
  }
  if (*(_BYTE *)(a1 + 72))
  {
    PBFLogGallery();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v47 = v15;
      v48 = 2114;
      *(_QWORD *)v49 = v3;
      _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; returning local gallery; last hydrated %{public}@",
        buf,
        0x16u);
    }

    v16 = *(void **)(a1 + 48);
    if (!v16)
      goto LABEL_37;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_86;
    v40[3] = &unk_1E86F2E08;
    v12 = &v43;
    v43 = v16;
    v41 = v2;
    v42 = v3;
    v13 = (void (**)(_QWORD))_Block_copy(v40);

    v17 = v41;
  }
  else
  {
    v18 = objc_msgSend(*(id *)(a1 + 32), "_stateLock_isGalleryStale");
    if (!*(_BYTE *)(a1 + 73) || !v3 || !v2 || (v18 & 1) != 0)
    {
      v22 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
      if (v22 && (objc_msgSend(v22, "isFinalized") & 1) == 0)
      {
        v23 = (_PBFGalleryEnqueuedRefreshGalleryRequest *)*(id *)(*(_QWORD *)(a1 + 32) + 88);
        v24 = 1;
      }
      else
      {
        v23 = -[_PBFGalleryEnqueuedRefreshGalleryRequest initWithOptions:powerLogReason:sessionId:]([_PBFGalleryEnqueuedRefreshGalleryRequest alloc], "initWithOptions:powerLogReason:sessionId:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
        v24 = 0;
      }
      if (*(_QWORD *)(a1 + 48))
        -[_PBFGalleryEnqueuedRefreshGalleryRequest addCompletionHandler:](v23, "addCompletionHandler:");
      PBFLogGallery();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v24)
      {
        if (v26)
        {
          v27 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          v47 = v27;
          _os_log_impl(&dword_1CB9FA000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; gallery request ongoing, tacking on completion handler",
            buf,
            0xCu);
        }
      }
      else
      {
        if (v26)
        {
          v28 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          v47 = v28;
          _os_log_impl(&dword_1CB9FA000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; kicking off new request",
            buf,
            0xCu);
        }

        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), v23);
        v29 = *(_QWORD *)(a1 + 56);
        v30 = *(_QWORD *)(a1 + 64);
        v32 = *(void **)(a1 + 32);
        v31 = *(void **)(a1 + 40);
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_89;
        v33[3] = &unk_1E86F7520;
        v34 = v31;
        v35 = v23;
        objc_msgSend(v32, "_stateLock_enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:sessionId:completion:", v29, v30, v34, v33);

        v25 = v34;
      }

      goto LABEL_37;
    }
    PBFLogGallery();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v47 = v20;
      v48 = 2114;
      *(_QWORD *)v49 = v3;
      _os_log_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; checked if gallery is stale, it is not stale, returni"
        "ng local gallery; last hydrated %{public}@",
        buf,
        0x16u);
    }

    v21 = *(void **)(a1 + 48);
    if (!v21)
    {
LABEL_37:
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
      goto LABEL_38;
    }
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_87;
    v36[3] = &unk_1E86F2E08;
    v12 = &v39;
    v39 = v21;
    v37 = v2;
    v38 = v3;
    v13 = (void (**)(_QWORD))_Block_copy(v36);

    v17 = v37;
  }

LABEL_22:
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  if (v13)
  {
    v13[2](v13);

  }
LABEL_38:

}

void __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_84(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, 0, v2);

}

uint64_t __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_86(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0, 0);
}

uint64_t __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_87(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0, 0);
}

void __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_89(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  PBFLogGallery();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_89_cold_1();
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = 138543874;
    v16 = v14;
    v17 = 2112;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; update completed.  Gallery received: %@, newLastUpdateDate: %{public}@",
      (uint8_t *)&v15,
      0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "fireCompletionHandlersWithError:faceGalleryConfiguration:lastUpdateDate:didUpdate:", v11, v9, v10, a4);
}

- (void)pushUpdatedPosterDescriptors:(id)a3 reason:(id)a4 force:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  PBFGalleryController *v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] pushUpdatedPosterDescriptors completion"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__PBFGalleryController_pushUpdatedPosterDescriptors_reason_force_completion___block_invoke;
  v19[3] = &unk_1E86F7570;
  v20 = v13;
  v21 = self;
  v22 = v10;
  v23 = v11;
  v25 = a5;
  v24 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  PBFDispatchAsyncWithString(v14, QOS_CLASS_DEFAULT, v19);

}

void __77__PBFGalleryController_pushUpdatedPosterDescriptors_reason_force_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PBFLogGallery();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1CB9FA000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors begin", (uint8_t *)&v4, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(*(id *)(a1 + 40), "_stateLock_enqueuePushUpdatedPosterDescriptors:reason:force:sessionId:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
}

- (void)updateGallery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryController updateGallery:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAD8CF0);
  }
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_keynoteModeEnabled"))
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D68];
    v21[0] = CFSTR("Keynote mode is enabled; we aren't going to accept gallery updates right now.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pbf_generalErrorWithCode:userInfo:", 6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v11);

  }
  else
  {
    if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v8)[2](v8, v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] updateGallery:completion:"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __49__PBFGalleryController_updateGallery_completion___block_invoke;
      v16[3] = &unk_1E86F2FC0;
      v16[4] = self;
      v17 = v13;
      v18 = v6;
      v19 = v8;
      v12 = v13;
      PBFDispatchAsyncWithString(v14, QOS_CLASS_DEFAULT, v16);

    }
  }

}

void __49__PBFGalleryController_updateGallery_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  long double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[7];
  _QWORD v27[7];
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), v2);
  PBFLogGallery();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v31 = v7;
    v32 = 2048;
    v33 = v5;
    _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] updateGallery; time since last request: %f",
      buf,
      0x16u);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "getFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isEqual:", *(_QWORD *)(a1 + 48)))
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D68];
    v29 = CFSTR("Attempting to update gallery with the current gallery object");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pbf_generalErrorWithCode:userInfo:", 1, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
    goto LABEL_7;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(double *)(v11 + 128);
  if (v12 <= 0.0 || (v13 = *(double *)(v11 + 120), v13 >= v12))
  {
    *(_QWORD *)(v11 + 104) = 0;
    v11 = *(_QWORD *)(a1 + 32);
LABEL_16:
    os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 24));
    goto LABEL_17;
  }
  v14 = pow(v13, (double)*(unint64_t *)(v11 + 104));
  if (v14 < v12)
    v12 = v14;
  if (v5 >= v12)
    goto LABEL_16;
  v26[0] = CFSTR("acceptableMinimumIntervalBetweenRequests");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v15;
  v26[1] = CFSTR("timeIntervalSinceLastRequest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CB2D68];
  v27[1] = v16;
  v27[2] = CFSTR("You have been rate limited! Please stop hammering this interface.");
  v26[2] = v17;
  v26[3] = CFSTR("numberOfRateLimitedAttempts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v18;
  v26[4] = CFSTR("timeWhenceRequestsWillBeAcceptedAgain");
  objc_msgSend(v2, "dateByAddingTimeInterval:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v19;
  v27[5] = v3;
  v26[5] = CFSTR("previousRequestDate");
  v26[6] = CFSTR("sessionId");
  v27[6] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 9, v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);

LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  if (!v8)
  {
LABEL_17:
    +[PBFPowerLogger logUpdate:reason:](PBFPowerLogger, "logUpdate:reason:", 3, 5);
    v21 = *(void **)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __49__PBFGalleryController_updateGallery_completion___block_invoke_118;
    v24[3] = &unk_1E86F7598;
    v23 = *(_QWORD *)(a1 + 48);
    v25 = *(id *)(a1 + 56);
    objc_msgSend(v21, "_pushFaceGalleryConfigurationUpdate:options:fetchError:sessionId:completion:", v23, 2, 0, v22, v24);
    v8 = v25;
    goto LABEL_18;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_18:

}

uint64_t __49__PBFGalleryController_updateGallery_completion___block_invoke_118(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *stateLock_observers;
  NSHashTable *v6;
  NSHashTable *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    os_unfair_lock_lock(&self->_stateLock);
    stateLock_observers = self->_stateLock_observers;
    if (!stateLock_observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_stateLock_observers;
      self->_stateLock_observers = v6;

      stateLock_observers = self->_stateLock_observers;
    }
    -[NSHashTable addObject:](stateLock_observers, "addObject:", v9);
    os_unfair_lock_unlock(&self->_stateLock);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("observer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGalleryController addObserver:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  id v5;
  NSHashTable *stateLock_observers;

  p_stateLock = &self->_stateLock;
  v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  -[NSHashTable removeObject:](self->_stateLock_observers, "removeObject:", v5);

  if (!-[NSHashTable count](self->_stateLock_observers, "count"))
  {
    stateLock_observers = self->_stateLock_observers;
    self->_stateLock_observers = 0;

  }
  os_unfair_lock_unlock(p_stateLock);
}

- (void)invalidate
{
  PBFPosterGalleryLayoutProviding *galleryLayoutProvider;
  NSObject *v4;
  int v5;
  PBFGalleryController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    galleryLayoutProvider = self->_galleryLayoutProvider;
    self->_galleryLayoutProvider = 0;

    objc_storeWeak((id *)&self->_runtimeAssertionProvider, 0);
    PBFLogGallery();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = self;
      _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "PBFGalleryController Invalidated %p", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)_stateLock_enqueuePushUpdatedPosterDescriptors:(id)a3 reason:(id)a4 force:(BOOL)a5 sessionId:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _PBFGalleryEnqueuedPushToProactiveRequest *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  _PBFGalleryEnqueuedPushToProactiveRequest *v23;
  NSObject *v24;
  NSObject *v25;
  _PBFGalleryEnqueuedPushToProactiveRequest *stateLock_enqueuedPushToProactive;
  void *v27;
  int v28;
  NSObject *v29;
  _PBFGalleryEnqueuedPushToProactiveRequest *v30;
  _PBFGalleryEnqueuedPushToProactiveRequest *stateLock_activePushToProactive;
  void *v32;
  int v33;
  NSObject *v34;
  _PBFGalleryEnqueuedPushToProactiveRequest *stateLock_lastSuccessfulPushToProactive;
  void *v36;
  int v37;
  NSObject *v38;
  int v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD, void *))a7;
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, 0, v16);

    }
    PBFLogGallery();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 138543362;
      v40 = v14;
      _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; invalidated",
        (uint8_t *)&v39,
        0xCu);
    }

    goto LABEL_32;
  }
  if (a5)
    goto LABEL_8;
  PBFLogGallery();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v39 = 138543362;
    v40 = v14;
    _os_log_impl(&dword_1CB9FA000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; checking if descriptors have already been sent",
      (uint8_t *)&v39,
      0xCu);
  }

  stateLock_enqueuedPushToProactive = self->_stateLock_enqueuedPushToProactive;
  if (stateLock_enqueuedPushToProactive)
  {
    -[_PBFGalleryEnqueuedPushToProactiveRequest updatedDescriptors](stateLock_enqueuedPushToProactive, "updatedDescriptors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqual:", v12);

    if (v28)
    {
      PBFLogGallery();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v39 = 138543362;
        v40 = v14;
        _os_log_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; descriptors match already enqueued push to proactive.  Bailing.",
          (uint8_t *)&v39,
          0xCu);
      }

      v30 = self->_stateLock_enqueuedPushToProactive;
LABEL_31:
      -[_PBFGalleryEnqueuedPushToProactiveRequest addCompletionHandler:](v30, "addCompletionHandler:", v15);
      goto LABEL_32;
    }
  }
  stateLock_activePushToProactive = self->_stateLock_activePushToProactive;
  if (stateLock_activePushToProactive)
  {
    -[_PBFGalleryEnqueuedPushToProactiveRequest updatedDescriptors](stateLock_activePushToProactive, "updatedDescriptors");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isEqual:", v12);

    if (v33)
    {
      PBFLogGallery();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v39 = 138543362;
        v40 = v14;
        _os_log_impl(&dword_1CB9FA000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; descriptors match already active push to proactive.  Bailing.",
          (uint8_t *)&v39,
          0xCu);
      }

      v30 = self->_stateLock_activePushToProactive;
      goto LABEL_31;
    }
  }
  stateLock_lastSuccessfulPushToProactive = self->_stateLock_lastSuccessfulPushToProactive;
  if (!stateLock_lastSuccessfulPushToProactive
    || (-[_PBFGalleryEnqueuedPushToProactiveRequest updatedDescriptors](stateLock_lastSuccessfulPushToProactive, "updatedDescriptors"), v36 = (void *)objc_claimAutoreleasedReturnValue(), v37 = objc_msgSend(v36, "isEqual:", v12), v36, !v37))
  {
LABEL_8:
    PBFLogGallery();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 138543362;
      v40 = v14;
      _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; Crafting new _PBFGalleryEnqueuedPushToProactiveRequest",
        (uint8_t *)&v39,
        0xCu);
    }

    v19 = -[_PBFGalleryEnqueuedPushToProactiveRequest initWithUpdatedDescriptors:reason:sessionId:]([_PBFGalleryEnqueuedPushToProactiveRequest alloc], "initWithUpdatedDescriptors:reason:sessionId:", v12, v13, v14);
    -[_PBFGalleryEnqueuedPushToProactiveRequest addCompletionHandler:](v19, "addCompletionHandler:", v15);
    if (self->_stateLock_enqueuedPushToProactive)
    {
      PBFLogGallery();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[_PBFGalleryEnqueuedPushToProactiveRequest sessionId](self->_stateLock_enqueuedPushToProactive, "sessionId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543618;
        v40 = v14;
        v41 = 2114;
        v42 = v21;
        _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; stealing completion handlers for existing enqueued request (session"
          "Id %{public}@) and replacing.",
          (uint8_t *)&v39,
          0x16u);

      }
      -[_PBFGalleryEnqueuedPushToProactiveRequest addCompletionHandlersFromEnqueuedPushToProactive:](v19, "addCompletionHandlersFromEnqueuedPushToProactive:", self->_stateLock_enqueuedPushToProactive);
    }
    PBFLogGallery();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 138543362;
      v40 = v14;
      _os_log_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; enqueuing",
        (uint8_t *)&v39,
        0xCu);
    }

    v23 = self->_stateLock_enqueuedPushToProactive;
    self->_stateLock_enqueuedPushToProactive = v19;

    PBFLogGallery();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 138543362;
      v40 = v14;
      _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; flush",
        (uint8_t *)&v39,
        0xCu);
    }

    -[PBFGalleryController _stateLock_flushProactiveUpdateQueue](self, "_stateLock_flushProactiveUpdateQueue");
    goto LABEL_32;
  }
  PBFLogGallery();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = 138543362;
    v40 = v14;
    _os_log_impl(&dword_1CB9FA000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; descriptors have already been sent in prior send.  Bailing.",
      (uint8_t *)&v39,
      0xCu);
  }

  if (v15)
    v15[2](v15, 0, 0);
LABEL_32:

}

- (void)_stateLock_flushProactiveUpdateQueue
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _PBFGalleryEnqueuedPushToProactiveRequest *stateLock_enqueuedPushToProactive;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    if (self->_stateLock_activePushToProactive || !self->_stateLock_enqueuedPushToProactive)
    {
      PBFLogGallery();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        -[_PBFGalleryEnqueuedPushToProactiveRequest sessionId](self->_stateLock_activePushToProactive, "sessionId");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PBFGalleryEnqueuedPushToProactiveRequest sessionId](self->_stateLock_enqueuedPushToProactive, "sessionId");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543618;
        v10 = v4;
        v11 = 2114;
        v12 = v5;
        _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_DEFAULT, "_flushProactiveUpdateQueue; nothing to do; active session id %{public}@; enqueued session id %{public}@",
          (uint8_t *)&v9,
          0x16u);

      }
    }
    else
    {
      PBFLogGallery();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[_PBFGalleryEnqueuedPushToProactiveRequest sessionId](self->_stateLock_enqueuedPushToProactive, "sessionId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v7;
        _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "_flushProactiveUpdateQueue; moving session id %{public}@ to active",
          (uint8_t *)&v9,
          0xCu);

      }
      objc_storeStrong((id *)&self->_stateLock_activePushToProactive, self->_stateLock_enqueuedPushToProactive);
      stateLock_enqueuedPushToProactive = self->_stateLock_enqueuedPushToProactive;
      self->_stateLock_enqueuedPushToProactive = 0;

      -[PBFGalleryController _stateLock_executeEnqueuedPushToProactive:](self, "_stateLock_executeEnqueuedPushToProactive:", self->_stateLock_activePushToProactive);
    }
  }
}

- (BOOL)_stateLock_executeEnqueuedPushToProactive:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  NSDictionary *stateLock_lastSentPosterDescriptorsForExtensionBundleIdentifier;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  __CFString *v31;
  id v32;
  dispatch_time_t v33;
  NSObject *v34;
  id v36;
  id v37;
  void *v38;
  __CFString *v39;
  id v40;
  void *v41;
  id v42;
  _QWORD block[4];
  id v44;
  id v45;
  __CFString *v46;
  id v47;
  _BYTE *v48;
  _QWORD v49[4];
  id v50;
  __CFString *v51;
  id v52;
  _BYTE *v53;
  _QWORD v54[4];
  id v55;
  _QWORD aBlock[4];
  id v57;
  id v58;
  __CFString *v59;
  PBFGalleryController *v60;
  id v61;
  id v62;
  id v63;
  __int128 *p_buf;
  id v65;
  id v66;
  uint8_t v67[4];
  id v68;
  __int16 v69;
  __CFString *v70;
  _BYTE v71[24];
  void *(*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _QWORD v75[3];
  _QWORD v76[3];
  __int128 buf;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  objc_msgSend(v4, "sessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    v66 = 0;
    -[PBFGalleryController runtimeAssertionProviderWithError:](self, "runtimeAssertionProviderWithError:", &v66);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v66;
    if (v7)
    {
      PBFLogGallery();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[PBFGalleryController _stateLock_executeEnqueuedPushToProactive:].cold.2();

      objc_msgSend(v4, "fireCompletionHandlersWithError:didUpdate:", v7, 0);
      v8 = 0;
      goto LABEL_35;
    }
    v65 = 0;
    -[PBFGalleryController galleryLayoutProviderWithError:](self, "galleryLayoutProviderWithError:", &v65);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v65;
    if (v42)
    {
      PBFLogGallery();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[PBFGalleryController _stateLock_executeEnqueuedPushToProactive:].cold.1();

      objc_msgSend(v4, "fireCompletionHandlersWithError:didUpdate:", v42, 0);
      v8 = 0;
      goto LABEL_34;
    }
    objc_msgSend(v4, "reason");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updatedDescriptors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__17;
    v80 = __Block_byref_object_dispose__17;
    objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:", CFSTR("Push To Proactive"), v14, 0);
    v81 = (id)objc_claimAutoreleasedReturnValue();

    PBFLogGallery();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v71 = 138543618;
      *(_QWORD *)&v71[4] = v5;
      *(_WORD *)&v71[12] = 2114;
      *(_QWORD *)&v71[14] = v12;
      _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_executeEnqueuedPushToProactive:reason:'%{public}@'; begin",
        v71,
        0x16u);
    }

    v16 = *MEMORY[0x1E0CB2D68];
    v76[0] = CFSTR("Proactive indicated it was not successful in receiving our updatedPosterDescriptorsForExtensionBundleIdentifier");
    v75[0] = v16;
    v75[1] = CFSTR("updatedPosterDescriptorsForExtensionBundleIdentifier");
    objc_msgSend(v13, "description");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = CFSTR("(NULL)");
    if (v17)
      v19 = (const __CFString *)v17;
    v75[2] = CFSTR("reason");
    v20 = CFSTR("(null)");
    if (v12)
      v20 = v12;
    v76[1] = v19;
    v76[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v13;
    v22 = (void *)objc_opt_new();
    *(_QWORD *)v71 = 0;
    *(_QWORD *)&v71[8] = v71;
    *(_QWORD *)&v71[16] = 0x3032000000;
    v72 = __Block_byref_object_copy__137;
    v73 = __Block_byref_object_dispose__138;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke;
    aBlock[3] = &unk_1E86F75E8;
    v36 = v5;
    v57 = v36;
    v37 = v22;
    v58 = v37;
    v39 = v12;
    v59 = v39;
    v60 = self;
    v61 = v4;
    v40 = v21;
    v62 = v40;
    p_buf = &buf;
    v23 = v41;
    v63 = v23;
    v74 = _Block_copy(aBlock);
    if (objc_msgSend(v40, "count"))
    {
      stateLock_lastSentPosterDescriptorsForExtensionBundleIdentifier = self->_stateLock_lastSentPosterDescriptorsForExtensionBundleIdentifier;
      if (!stateLock_lastSentPosterDescriptorsForExtensionBundleIdentifier
        || !-[NSDictionary isEqualToDictionary:](stateLock_lastSentPosterDescriptorsForExtensionBundleIdentifier, "isEqualToDictionary:", v40))
      {
        PBFLogGallery();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v67 = 138543618;
          v68 = v36;
          v69 = 2114;
          v70 = v39;
          _os_log_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_executeEnqueuedPushToProactive:'%{public}@'; dumping payload...",
            v67,
            0x16u);
        }

        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_143;
        v54[3] = &unk_1E86F3810;
        v28 = v36;
        v55 = v28;
        objc_msgSend(v40, "enumerateKeysAndObjectsUsingBlock:", v54);
        PBFLogGallery();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v67 = 138543618;
          v68 = v28;
          v69 = 2114;
          v70 = v39;
          _os_log_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_executeEnqueuedPushToProactive:'%{public}@'; firing request...",
            v67,
            0x16u);
        }

        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_147;
        v49[3] = &unk_1E86F7638;
        v30 = v28;
        v50 = v30;
        v31 = v39;
        v51 = v31;
        v53 = v71;
        v32 = v38;
        v52 = v32;
        objc_msgSend(v23, "handlePosterDescriptorsDidChange:withCompletion:", v40, v49);
        v33 = dispatch_time(0, 10000000000);
        dispatch_get_global_queue(21, 0);
        v34 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_148;
        block[3] = &unk_1E86F7660;
        v44 = v37;
        v45 = v30;
        v46 = v31;
        v48 = v71;
        v47 = v32;
        dispatch_after(v33, v34, block);

        v8 = 1;
        goto LABEL_33;
      }
      PBFLogGallery();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v67 = 138543618;
        v68 = v36;
        v69 = 2114;
        v70 = v39;
        v26 = "[%{public}@] _stateLock_executeEnqueuedPushToProactive:'%{public}@' -- Bailed; this has already been sent "
              "to proactive successfully.";
LABEL_31:
        _os_log_impl(&dword_1CB9FA000, v25, OS_LOG_TYPE_DEFAULT, v26, v67, 0x16u);
      }
    }
    else
    {
      PBFLogGallery();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v67 = 138543618;
        v68 = v36;
        v69 = 2114;
        v70 = v39;
        v26 = "[%{public}@] _stateLock_executeEnqueuedPushToProactive:'%{public}@' -- Bailed; nothing to send.";
        goto LABEL_31;
      }
    }

    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)&v71[8] + 40) + 16))();
    v8 = 0;
LABEL_33:
    _Block_object_dispose(v71, 8);

    _Block_object_dispose(&buf, 8);
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }
  PBFLogGallery();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_executeEnqueuedPushToProactive; invalidated",
      (uint8_t *)&buf,
      0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fireCompletionHandlersWithError:didUpdate:", v7, 0);
  v8 = 0;
LABEL_36:

  return v8;
}

void __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  char v22;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] _stateLock_executeEnqueuedPushToProactive completion"), *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_2;
  v13[3] = &unk_1E86F75C0;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(void **)(a1 + 64);
  v16 = v7;
  v17 = v8;
  v18 = v5;
  v19 = v9;
  v20 = *(id *)(a1 + 72);
  v22 = a2;
  v12 = *(_OWORD *)(a1 + 80);
  v10 = (id)v12;
  v21 = v12;
  v11 = v5;
  PBFDispatchAsyncWithString(v6, QOS_CLASS_DEFAULT, v13);

}

uint64_t __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "signal");
  if ((_DWORD)result)
  {
    PBFLogGallery();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      v13 = 138543618;
      v14 = v4;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_executeEnqueuedPushToProactive:'%{public}@'; finished",
        (uint8_t *)&v13,
        0x16u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 56) + 24));
    if (!*(_QWORD *)(a1 + 64))
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 56) + 80), *(id *)(a1 + 72));
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", *(_QWORD *)(a1 + 80), 1);
      v7 = *(_QWORD *)(a1 + 56);
      v8 = *(void **)(v7 + 56);
      *(_QWORD *)(v7 + 56) = v6;

    }
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(void **)(v9 + 72);
    *(_QWORD *)(v9 + 72) = 0;

    objc_msgSend(*(id *)(a1 + 56), "_stateLock_flushProactiveUpdateQueue");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 56) + 24));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "invalidate");
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

    objc_msgSend(*(id *)(a1 + 72), "fireCompletionHandlersWithError:didUpdate:", *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 104));
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      result = objc_msgSend(*(id *)(a1 + 88), "wantsFetchGalleryLayoutAfterHandlePosterDescriptorsDidChange");
      if ((_DWORD)result)
        return objc_msgSend(*(id *)(a1 + 56), "enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:", 2, 6, 0);
    }
  }
  return result;
}

void __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_143(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PBFLogGallery();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] \textension '%{public}@'", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_144;
  v9[3] = &unk_1E86F7610;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_144(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PBFLogGallery();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] \t\tdescriptor identifier '%{public}@'", (uint8_t *)&v7, 0x16u);

  }
}

void __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_147(_QWORD *a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PBFLogGallery();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v9 = 138543874;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    v13 = 1024;
    v14 = a2;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_executeEnqueuedPushToProactive:'%{public}@' -- Success? %{BOOL}u", (uint8_t *)&v9, 0x1Cu);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (a2)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_dataStoreErrorWithCode:userInfo:", -2222, a1[6]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
}

void __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_148(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled") & 1) == 0)
  {
    PBFLogGallery();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_148_cold_1();

    v3 = *(_QWORD *)(a1 + 56);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_dataStoreErrorWithCode:userInfo:", -2221, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

- (BOOL)_stateLock_isGalleryStale
{
  NSDate *stateLock_lastUsefulGalleryConfigurationPersistDate;
  void *v4;
  NSDate *v5;
  void *v6;
  double v7;
  double v8;

  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  stateLock_lastUsefulGalleryConfigurationPersistDate = self->_stateLock_lastUsefulGalleryConfigurationPersistDate;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = stateLock_lastUsefulGalleryConfigurationPersistDate;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v5);
  v8 = v7;

  return v8 >= 14400.0;
}

- (void)_stateLock_enqueueGalleryConfigurationUpdateWithOptions:(unint64_t)a3 powerLogReason:(int64_t)a4 sessionId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  BOOL v18;
  char v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  double v23;
  double v24;
  _BOOL4 v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  NSObject *v29;
  NSDate *stateLock_lastUsefulGalleryConfigurationPersistDate;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  id v39;
  dispatch_time_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSDate *v44;
  PRSPosterGalleryLayout *v45;
  void *v46;
  id v47;
  _QWORD block[4];
  id v49;
  id v50;
  _QWORD *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  PBFGalleryController *v55;
  _QWORD *v56;
  unint64_t v57;
  _QWORD aBlock[4];
  id v59;
  id v60;
  id v61;
  _BYTE *v62;
  _QWORD v63[5];
  id v64;
  id v65;
  id v66;
  uint8_t v67[4];
  id v68;
  _BYTE buf[24];
  uint64_t v70;
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  _QWORD v74[4];

  v74[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    v66 = 0;
    -[PBFGalleryController runtimeAssertionProviderWithError:](self, "runtimeAssertionProviderWithError:", &v66);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v66;
    if (v13)
    {
      PBFLogGallery();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[PBFGalleryController _stateLock_enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:sessionId:completion:].cold.2();

      if (v11)
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, 0, v13);
      goto LABEL_47;
    }
    v65 = 0;
    -[PBFGalleryController galleryLayoutProviderWithError:](self, "galleryLayoutProviderWithError:", &v65);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v65;
    if (v47)
    {
      PBFLogGallery();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[PBFGalleryController _stateLock_enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:sessionId:completion:].cold.1();

      if (v11)
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, 0, v47);
      goto LABEL_46;
    }
    v45 = self->_stateLock_lastUsefulGalleryConfiguration;
    v44 = self->_stateLock_lastUsefulGalleryConfigurationPersistDate;
    +[PBFPowerLogger logUpdate:reason:](PBFPowerLogger, "logUpdate:reason:", 3, a4);
    v43 = (void *)objc_opt_new();
    v42 = (void *)objc_opt_new();
    PBFLogGallery();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; begin",
        buf,
        0xCu);
    }

    if ((a3 & 8) == 0)
      goto LABEL_35;
    if (v44)
      v18 = v45 == 0;
    else
      v18 = 1;
    v19 = !v18;
    PBFLogGallery();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if ((v19 & 1) != 0)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v10;
        _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; Checking if gallery is stale... ",
          buf,
          0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "date", v42);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceDate:", v44);
      v24 = v23;

      PBFLogGallery();
      v20 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v24 < 14400.0)
      {
        if (v25)
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v43;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v44;
          *(_WORD *)&buf[22] = 2048;
          v70 = 0x40CC200000000000;
          _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; gallery was last refreshed at @ %{pub"
            "lic}@, which means it is younger than %f seconds, so we're going to not update.",
            buf,
            0x20u);
        }

        (*((void (**)(id, PRSPosterGalleryLayout *, NSDate *, _QWORD, _QWORD))v11 + 2))(v11, v45, v44, 0, 0);
        goto LABEL_45;
      }
      if (!v25)
        goto LABEL_34;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v44;
      *(_WORD *)&buf[22] = 2048;
      v70 = 0x40CC200000000000;
      v26 = "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; gallery was last refreshed at @ %{pub"
            "lic}@, which means it is OLDER than %f seconds, so we're going to proceed";
      v27 = v20;
      v28 = 32;
    }
    else
    {
      if (!v21)
      {
LABEL_34:

LABEL_35:
        if (objc_msgSend(MEMORY[0x1E0C99EA0], "pbf_keynoteModeEnabled", v42))
        {
          PBFLogGallery();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v10;
            _os_log_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; not querying, just using local (keynote mode)",
              buf,
              0xCu);
          }

          stateLock_lastUsefulGalleryConfigurationPersistDate = self->_stateLock_lastUsefulGalleryConfigurationPersistDate;
          v31 = (void *)MEMORY[0x1E0CB35C8];
          v73 = *MEMORY[0x1E0CB2D68];
          v74[0] = CFSTR("Keynote mode has been engaged; disabled fetching new gallery configuration.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "pbf_generalErrorWithCode:userInfo:", 6, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, PRSPosterGalleryLayout *, NSDate *, _QWORD, void *))v11 + 2))(v11, v45, stateLock_lastUsefulGalleryConfigurationPersistDate, 0, v33);

        }
        else
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v70 = (uint64_t)__Block_byref_object_copy__17;
          v71 = __Block_byref_object_dispose__17;
          objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "acquirePrewarmRuntimeAssertionForReason:target:invalidationHandler:", CFSTR("Gallery Async Fetch"), v34, 0);
          v72 = (id)objc_claimAutoreleasedReturnValue();

          v63[0] = 0;
          v63[1] = v63;
          v63[2] = 0x3032000000;
          v63[3] = __Block_byref_object_copy__137;
          v63[4] = __Block_byref_object_dispose__138;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke;
          aBlock[3] = &unk_1E86F76B0;
          v35 = v10;
          v59 = v35;
          v36 = v42;
          v60 = v36;
          v61 = v11;
          v62 = buf;
          v64 = _Block_copy(aBlock);
          PBFLogGallery();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v67 = 138543362;
            v68 = v35;
            _os_log_impl(&dword_1CB9FA000, v37, OS_LOG_TYPE_DEFAULT, "(%{public}@)_stateLock_enqueueGalleryConfigurationUpdateWithOptions:; querying",
              v67,
              0xCu);
          }

          v38 = MEMORY[0x1E0C809B0];
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_155;
          v52[3] = &unk_1E86F7728;
          v39 = v35;
          v53 = v39;
          v54 = v43;
          v55 = self;
          v56 = v63;
          v57 = a3;
          objc_msgSend(v46, "fetchGalleryLayoutWithCompletion:", v52);
          v40 = dispatch_time(0, 10000000000);
          objc_msgSend(MEMORY[0x1E0D7F8F0], "sharedWorkloop");
          v41 = objc_claimAutoreleasedReturnValue();
          block[0] = v38;
          block[1] = 3221225472;
          block[2] = __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_162;
          block[3] = &unk_1E86F4250;
          v49 = v36;
          v50 = v39;
          v51 = v63;
          dispatch_after(v40, v41, block);

          _Block_object_dispose(v63, 8);
          _Block_object_dispose(buf, 8);

        }
LABEL_45:

LABEL_46:
LABEL_47:

        goto LABEL_48;
      }
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v10;
      v26 = "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; Checked if gallery is stale... but we"
            " don't have a gallery, so we're going to proceed.";
      v27 = v20;
      v28 = 12;
    }
    _os_log_impl(&dword_1CB9FA000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    goto LABEL_34;
  }
  PBFLogGallery();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions; invalidated",
      buf,
      0xCu);
  }

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, 0, v13);
LABEL_48:

  }
}

void __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  char v24;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions completion"), *(_QWORD *)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2;
  v17[3] = &unk_1E86F7688;
  v18 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v19 = v9;
  v20 = v10;
  v24 = a4;
  v21 = v11;
  v22 = v13;
  v23 = *(_QWORD *)(a1 + 56);
  v14 = v11;
  v15 = v10;
  v16 = v9;
  PBFDispatchAsyncWithString(v12, QOS_CLASS_DEFAULT, v17);

}

void __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "signal"))
  {
    v2 = *(_QWORD *)(a1 + 64);
    if (v2)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "invalidate");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] _pushFaceGalleryConfigurationUpdate"), *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_158;
  v13[3] = &unk_1E86F7700;
  v14 = v6;
  v15 = *(id *)(a1 + 40);
  v16 = v5;
  v8 = *(_QWORD *)(a1 + 64);
  v17 = *(_QWORD *)(a1 + 48);
  v20 = v8;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 56);
  v18 = v9;
  v19 = v10;
  v11 = v5;
  v12 = v6;
  PBFDispatchAsyncWithString(v7, QOS_CLASS_DEFAULT, v13);

}

uint64_t __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_158(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 4;
  v3 = a1[4];
  PBFLogGallery();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_158_cold_1((uint64_t)a1, v2, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[5];
    v7 = a1[6];
    *(_DWORD *)buf = 138543618;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; received response '%@'",
      buf,
      0x16u);
  }

  v9 = a1[6];
  v8 = (void *)a1[7];
  v10 = a1[4];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_159;
  v14[3] = &unk_1E86F76D8;
  v11 = a1[8];
  v12 = a1[10];
  v14[4] = a1[9];
  return objc_msgSend(v8, "_pushFaceGalleryConfigurationUpdate:options:fetchError:sessionId:completion:", v9, v12, v10, v11, v14);
}

uint64_t __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_159(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
}

void __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_162(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled") & 1) == 0)
  {
    PBFLogGallery();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_162_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D68];
    v14[0] = CFSTR("Proactive timed out calling fetchFaceGalleryConfigurationWithCompletion:");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pbf_generalErrorWithCode:userInfo:", 2, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, 0, 0, v12);

  }
}

- (void)_pushFaceGalleryConfigurationUpdate:(id)a3 options:(unint64_t)a4 fetchError:(id)a5 sessionId:(id)a6 completion:(id)a7
{
  char v10;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, PRSPosterGalleryLayout *, NSDate *, _QWORD, id);
  NSObject *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  int v22;
  id v23;
  id v24;
  PRSPosterGalleryLayout *v25;
  id v26;
  NSDate *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  id v39;
  int v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  _BYTE v47[18];
  uint64_t v48;
  _QWORD v49[2];

  v10 = a4;
  v49[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, PRSPosterGalleryLayout *, NSDate *, _QWORD, id))a7;
  PBFLogGallery();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "locale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v15;
    v46 = 2112;
    *(_QWORD *)v47 = v19;
    _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] _pushFaceGalleryConfigurationUpdate: received gallery w/ locale %@", buf, 0x16u);

  }
  if (v13)
  {
    v20 = v10 & 2;
    PBFLogGallery();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v45 = v15;
      v46 = 1024;
      *(_DWORD *)v47 = v20 >> 1;
      *(_WORD *)&v47[4] = 2114;
      *(_QWORD *)&v47[6] = v13;
      _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] _pushFaceGalleryConfigurationUpdate: should Persist? %{BOOL}u '%{public}@'", buf, 0x1Cu);
    }

    os_unfair_lock_lock(&self->_stateLock);
    v22 = -[PRSPosterGalleryLayout isEqual:](self->_stateLock_lastUsefulGalleryConfiguration, "isEqual:", v13);
    v23 = v14;
    v24 = v23;
    v41 = v15;
    v40 = v22;
    if (!v20 || v23 || (v22 & 1) != 0)
    {
      v27 = self->_stateLock_lastUsefulGalleryConfigurationPersistDate;
      v25 = self->_stateLock_lastUsefulGalleryConfiguration;
      PBFLogGallery();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v45 = v41;
        v46 = 2114;
        *(_QWORD *)v47 = v13;
        *(_WORD *)&v47[8] = 2114;
        *(_QWORD *)&v47[10] = v27;
        _os_log_impl(&dword_1CB9FA000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] _pushFaceGalleryConfigurationUpdate: received new gallery but not persisting '%{public}@'/%{public}@", buf, 0x20u);
      }

    }
    else
    {
      v39 = v14;
      v25 = (PRSPosterGalleryLayout *)v13;
      v42 = 0;
      v43 = 0;
      -[PBFGalleryController _stateLock_persistGalleryConfiguration:lastUpdateDate:sessionId:error:](self, "_stateLock_persistGalleryConfiguration:lastUpdateDate:sessionId:error:", v25, &v43, v15, &v42);
      v26 = v43;
      v27 = (NSDate *)v43;
      v24 = v42;
      PBFLogGallery();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v24)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v45 = v41;
          v46 = 2114;
          *(_QWORD *)v47 = v25;
          *(_WORD *)&v47[8] = 2114;
          *(_QWORD *)&v47[10] = v24;
          _os_log_error_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_ERROR, "[%{public}@] _pushFaceGalleryConfigurationUpdate: persisting %{public}@ -- error: %{public}@", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v45 = v41;
        v46 = 2114;
        *(_QWORD *)v47 = v25;
        *(_WORD *)&v47[8] = 2114;
        *(_QWORD *)&v47[10] = v27;
        _os_log_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] _pushFaceGalleryConfigurationUpdate: persisting %{public}@ -- last update date? %{public}@", buf, 0x20u);
      }

      -[PBFGalleryController _stateLock_notifyGalleryControllerWillUpdateGalleryConfiguration](self, "_stateLock_notifyGalleryControllerWillUpdateGalleryConfiguration");
      objc_storeStrong((id *)&self->_stateLock_lastUsefulGalleryConfigurationPersistDate, v26);
      objc_storeStrong((id *)&self->_stateLock_lastUsefulGalleryConfiguration, a3);
      -[PBFGalleryController _stateLock_notifyGalleryControllerDidUpdateCurrentGalleryConfiguration:](self, "_stateLock_notifyGalleryControllerDidUpdateCurrentGalleryConfiguration:", v25);
      v14 = v39;
    }
    os_unfair_lock_unlock(&self->_stateLock);
    if (v16)
      v16[2](v16, v25, v27, v40 ^ 1u, v24);

    goto LABEL_25;
  }
  PBFLogGallery();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    -[PBFGalleryController _pushFaceGalleryConfigurationUpdate:options:fetchError:sessionId:completion:].cold.1((uint64_t)v15, v30, v31, v32, v33, v34, v35, v36);

  if (v16)
  {
    v41 = v15;
    v37 = (void *)MEMORY[0x1E0CB35C8];
    v48 = *MEMORY[0x1E0CB2D68];
    v49[0] = CFSTR("Nil gallery was rejected.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v25 = (PRSPosterGalleryLayout *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "pbf_generalErrorWithCode:userInfo:", 1, v25);
    v27 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, 0, 0, v27);
LABEL_25:

    v15 = v41;
  }

}

- (BOOL)_stateLock_persistGalleryConfiguration:(id)a3 lastUpdateDate:(id *)a4 sessionId:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  NSFileManager *fileManager;
  void *v14;
  BOOL v15;
  NSObject *v16;
  PBFPosterGalleryLayoutPersistence *v17;
  _BOOL4 v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  -[PBFGalleryController galleryCacheURL](self, "galleryCacheURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (a6)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *MEMORY[0x1E0CB2D68];
      v39[0] = CFSTR("Gallery cache URL is invalid.  Bailing.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v24);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    PBFLogGallery();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PBFGalleryController _stateLock_persistGalleryConfiguration:lastUpdateDate:sessionId:error:].cold.1((uint64_t)v11, v16, v25, v26, v27, v28, v29, v30);
    goto LABEL_19;
  }
  fileManager = self->_fileManager;
  PFFileProtectionNoneAttributes();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v15 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](fileManager, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, v14, &v35);
  v16 = v35;

  if (!v15)
  {
    PBFLogGallery();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[PBFGalleryController _stateLock_persistGalleryConfiguration:lastUpdateDate:sessionId:error:].cold.2();

    if (a6)
    {
      v16 = objc_retainAutorelease(v16);
      LOBYTE(v18) = 0;
      *a6 = v16;
      goto LABEL_23;
    }
LABEL_19:
    LOBYTE(v18) = 0;
    goto LABEL_23;
  }
  v17 = -[PBFPosterGalleryLayoutPersistence initWithURL:]([PBFPosterGalleryLayoutPersistence alloc], "initWithURL:", v12);
  v33 = 0;
  v34 = 0;
  v18 = -[PBFPosterGalleryLayoutPersistence saveGalleryLayout:returningPersistenceDate:error:](v17, "saveGalleryLayout:returningPersistenceDate:error:", v10, &v34, &v33);
  v19 = v34;
  v20 = v33;
  if (a4 && v18)
    *a4 = objc_retainAutorelease(v19);
  if (a6)
    *a6 = objc_retainAutorelease(v20);
  PBFLogGallery();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PBFGalleryController _stateLock_persistGalleryConfiguration:lastUpdateDate:sessionId:error:].cold.2();
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v11;
    _os_log_impl(&dword_1CB9FA000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_persistGalleryConfiguration: successfully persisted gallery", buf, 0xCu);
  }

LABEL_23:
  return v18;
}

- (void)_stateLock_loadPersistedGalleryConfigurationWithLastUpdateDate:(id *)a3 error:(id *)a4
{
  void *v6;
  PBFPosterGalleryLayoutPersistence *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  PBFPosterGalleryLayoutPersistence *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  -[PBFGalleryController galleryCacheURL](self, "galleryCacheURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[PBFPosterGalleryLayoutPersistence initWithURL:]([PBFPosterGalleryLayoutPersistence alloc], "initWithURL:", v6);
    v36 = 0;
    v37 = 0;
    v35 = 0;
    -[PBFPosterGalleryLayoutPersistence loadNewestUsableGalleryLayoutReturningPersistenceDate:purgeableGalleryLayoutURLs:error:](v7, "loadNewestUsableGalleryLayoutReturningPersistenceDate:purgeableGalleryLayoutURLs:error:", &v37, &v36, &v35);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v37;
    v28 = v37;
    v10 = v36;
    v11 = v35;
    v27 = v8;
    objc_storeStrong((id *)&self->_stateLock_lastUsefulGalleryConfiguration, v8);
    objc_storeStrong((id *)&self->_stateLock_lastUsefulGalleryConfigurationPersistDate, v9);
    v29 = v7;
    v30 = v6;
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      PBFLogGallery();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[PBFGalleryController _stateLock_loadPersistedGalleryConfigurationWithLastUpdateDate:error:].cold.1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
    }
    else
    {
      PBFLogGallery();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_DEFAULT, "_stateLock_loadPersistedGalleryConfigurationWithLastUpdateDate successfully loaded gallery!", buf, 2u);
      }
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = v10;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          PBFLogReaper();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v39 = v24;
            _os_log_impl(&dword_1CB9FA000, v25, OS_LOG_TYPE_DEFAULT, "Cleaning up old gallery configurations: %{public}@", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "removeItemAtURL:error:", v24, a4);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v21);
    }

    v6 = v30;
  }

}

- (void)_stateLock_notifyGalleryControllerWillUpdateGalleryConfiguration
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_stateLock_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "galleryControllerWillUpdateGalleryConfiguration:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_stateLock_notifyGalleryControllerDidUpdateCurrentGalleryConfiguration:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_stateLock_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "galleryController:didUpdateCurrentGalleryConfiguration:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)determineRefreshStateWithContext:(id)a3
{
  id v4;
  void *v5;
  NSDate *stateLock_lastUsefulGalleryConfigurationPersistDate;
  NSDate *v7;
  PBFDataRefreshState *v8;
  NSDate *v9;
  PRSPosterGalleryLayout *stateLock_lastUsefulGalleryConfiguration;
  PRSPosterGalleryLayout *v11;
  PRSPosterGalleryLayout *v12;
  PBFDataComponentObjectEntity *v13;
  PBFDataRefreshContext *v14;
  void *v15;
  PBFDataRefreshContext *v16;
  PBFDataComponentObjectEntity *v17;

  v4 = a3;
  objc_msgSend(v4, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", CFSTR("PBFDataComponentGallery")))
  {
    stateLock_lastUsefulGalleryConfigurationPersistDate = self->_stateLock_lastUsefulGalleryConfigurationPersistDate;
    if (stateLock_lastUsefulGalleryConfigurationPersistDate)
    {
      v7 = stateLock_lastUsefulGalleryConfigurationPersistDate;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;
    stateLock_lastUsefulGalleryConfiguration = self->_stateLock_lastUsefulGalleryConfiguration;
    if (stateLock_lastUsefulGalleryConfiguration)
    {
      v11 = stateLock_lastUsefulGalleryConfiguration;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (PRSPosterGalleryLayout *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    v13 = [PBFDataComponentObjectEntity alloc];
    v14 = [PBFDataRefreshContext alloc];
    objc_msgSend(v4, "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PBFDataRefreshContext initWithComponent:now:lastRefreshDate:userInfo:](v14, "initWithComponent:now:lastRefreshDate:userInfo:", CFSTR("PBFDataComponentGallery"), v15, v9, 0);
    v17 = -[PBFDataComponentObjectEntity initWithComponent:object:context:](v13, "initWithComponent:object:context:", CFSTR("PBFDataComponentGallery"), v12, v16);

    -[PBFDataComponentObjectEntity determineRefreshState](v17, "determineRefreshState");
    v8 = (PBFDataRefreshState *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = -[PBFDataRefreshState initWithNeedsRefresh:reason:]([PBFDataRefreshState alloc], "initWithNeedsRefresh:reason:", 1, CFSTR("Unable to ascertain status; just reload anyway..."));
  }

  return v8;
}

- (NSURL)galleryCacheURL
{
  return self->_galleryCacheURL;
}

- (PBFRuntimeAssertionProviding)runtimeAssertionProvider
{
  return (PBFRuntimeAssertionProviding *)objc_loadWeakRetained((id *)&self->_runtimeAssertionProvider);
}

- (PBFPosterGalleryLayoutProviding)galleryLayoutProvider
{
  return self->_galleryLayoutProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryLayoutProvider, 0);
  objc_destroyWeak((id *)&self->_runtimeAssertionProvider);
  objc_storeStrong((id *)&self->_stateLock_timestampOfLastGalleryPushRequestFromProactive, 0);
  objc_storeStrong((id *)&self->_stateLock_observers, 0);
  objc_storeStrong((id *)&self->_stateLock_activeRefreshGalleryRequest, 0);
  objc_storeStrong((id *)&self->_stateLock_lastSuccessfulPushToProactive, 0);
  objc_storeStrong((id *)&self->_stateLock_activePushToProactive, 0);
  objc_storeStrong((id *)&self->_stateLock_enqueuedPushToProactive, 0);
  objc_storeStrong((id *)&self->_stateLock_lastSentPosterDescriptorsForExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_stateLock_lastUsefulGalleryConfigurationPersistDate, 0);
  objc_storeStrong((id *)&self->_stateLock_lastUsefulGalleryConfiguration, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_galleryCacheURL, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (void)initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:.cold.2()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:.cold.3()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_89_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; update completed.  Error: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)updateGallery:completion:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)addObserver:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_stateLock_executeEnqueuedPushToProactive:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "[%{public}@] _stateLock_executeEnqueuedPushToProactive; unable to acquire gallery provider: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_executeEnqueuedPushToProactive:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "[%{public}@] _stateLock_executeEnqueuedPushToProactive; unable to acquire runtime assertion provider: %{public}@");
  OUTLINED_FUNCTION_7();
}

void __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_148_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_11_4();
  v3 = v0;
  _os_log_error_impl(&dword_1CB9FA000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] _stateLock_executeEnqueuedPushToProactive:'%{public}@' -- Failed; proactive timed out.  Please file a radar.",
    v2,
    0x16u);
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:sessionId:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions; unable to acquire gallery provider: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:sessionId:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions; unable to acquire runtime assertion provider: %{public}@");
  OUTLINED_FUNCTION_7();
}

void __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_158_cold_1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, (uint64_t)a2, a3, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; received error '%@'",
    *(_QWORD *)v3,
    *(_QWORD *)&v3[8],
    *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_7();
}

void __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_162_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, a2, a3, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; timed out contacting proactive",
    a5,
    a6,
    a7,
    a8,
    2u);
  OUTLINED_FUNCTION_7();
}

- (void)_pushFaceGalleryConfigurationUpdate:(uint64_t)a3 options:(uint64_t)a4 fetchError:(uint64_t)a5 sessionId:(uint64_t)a6 completion:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, a2, a3, "[%{public}@] _pushFaceGalleryConfigurationUpdate: no gallery received? Erroring out...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_persistGalleryConfiguration:(uint64_t)a3 lastUpdateDate:(uint64_t)a4 sessionId:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, a2, a3, "[%{public}@] _stateLock_persistGalleryConfiguration: gallery cache url is unavailable.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_persistGalleryConfiguration:lastUpdateDate:sessionId:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "[%{public}@] _stateLock_persistGalleryConfiguration: gallery cache directory could not be created -- error: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)_stateLock_loadPersistedGalleryConfigurationWithLastUpdateDate:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, a2, a3, "_stateLock_loadPersistedGalleryConfigurationWithLastUpdateDate failed to load gallery: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

@end
