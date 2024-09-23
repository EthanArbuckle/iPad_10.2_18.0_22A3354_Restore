@implementation PLPrivacy

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_6668);
  return (id)sharedInstance_sharedInstance;
}

- (void)logPhotosAccessWithSelfAuditToken
{
  __int128 v2;
  kern_return_t v3;
  mach_error_t v4;
  NSObject *v5;
  char *v6;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v9;
  _BYTE buf[32];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v2 = -1;
  *((_QWORD *)&v2 + 1) = -1;
  *(_OWORD *)task_info_out = v2;
  v9 = v2;
  task_info_outCnt = 8;
  v3 = task_info(*MEMORY[0x1E0C83DA0], 0xFu, task_info_out, &task_info_outCnt);
  if (v3)
  {
    v4 = v3;
    PLPrivacyGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = mach_error_string(v4);
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v4;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_ERROR, "logPhotosAccessWithSelfToken: create self token failed: %{public}s (0x%x)", buf, 0x12u);
    }

  }
  else
  {
    *(_OWORD *)buf = *(_OWORD *)task_info_out;
    *(_OWORD *)&buf[16] = v9;
    PLPrivacyAccountingLogPhotosAccess(buf);
  }
}

- (int64_t)photosAccessAllowedWithScope:(int64_t)a3
{
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PLPrivacy_photosAccessAllowedWithScope___block_invoke;
  v5[3] = &unk_1E376C590;
  v5[4] = &v6;
  -[PLPrivacy _isPhotosAccessAllowedWithScope:promptIfUnknown:synchronous:resultHandler:](self, "_isPhotosAccessAllowedWithScope:promptIfUnknown:synchronous:resultHandler:", a3, 0, 1, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_isPhotosAccessAllowedWithScope:(int64_t)a3 promptIfUnknown:(BOOL)a4 synchronous:(BOOL)a5 resultHandler:(id)a6
{
  id v10;
  NSObject *isolationQueue;
  id v12;
  _QWORD block[5];
  id v14;
  int64_t v15;
  BOOL v16;
  BOOL v17;

  v10 = a6;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PLPrivacy__isPhotosAccessAllowedWithScope_promptIfUnknown_synchronous_resultHandler___block_invoke;
  block[3] = &unk_1E376B608;
  v14 = v10;
  v15 = a3;
  v16 = a5;
  v17 = a4;
  block[4] = self;
  v12 = v10;
  dispatch_sync(isolationQueue, block);

}

void __87__PLPrivacy__isPhotosAccessAllowedWithScope_promptIfUnknown_synchronous_resultHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  void *v7;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v16 = objc_msgSend(*(id *)(a1 + 32), "_resolvePreflightStatusForScope:", *(_QWORD *)(a1 + 48));
  PLPrivacyGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    PLStringFromPhotosAccessScope(*(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v14[3];
    *(_DWORD *)buf = 138543618;
    v18 = v3;
    v19 = 1024;
    v20 = v4;
    _os_log_impl(&dword_199DF7000, v2, OS_LOG_TYPE_DEBUG, "_isPhotosAccessAllowedWithScope:%{public}@ resolved preflight status as %d", buf, 0x12u);

  }
  v5 = *(_QWORD **)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v5, "_checkAuthStatusForPhotosAccessScope:preflightStatus:promptIfUnknown:resultHandler:", *(_QWORD *)(a1 + 48), v14[3], *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = v5[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__PLPrivacy__isPhotosAccessAllowedWithScope_promptIfUnknown_synchronous_resultHandler___block_invoke_47;
    block[3] = &unk_1E376B5E0;
    v10 = &v13;
    block[4] = v5;
    v7 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(_BYTE *)(a1 + 57);
    v9 = v7;
    dispatch_async(v6, block);

  }
  _Block_object_dispose(&v13, 8);
}

- (int64_t)_resolvePreflightStatusForScope:(int64_t)a3
{
  int64_t v5;
  unint64_t v6;
  PLPrivacy *v7;
  uint64_t v8;
  int64_t v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v5 = -[PLPrivacy _authStatusForScope:](self, "_authStatusForScope:", a3);
  if (v5 == 1)
  {
    v6 = tcc_authorization_preflight();
    if (v6 >= 5)
      v5 = 1;
    else
      v5 = v6;
  }
  if (a3 != 1 || v5 == 2)
  {
    v7 = self;
    v8 = v5;
    v9 = a3;
  }
  else if (tcc_authorization_preflight() == 2)
  {
    v5 = 2;
    v7 = self;
    v8 = 2;
    v9 = 7;
  }
  else
  {
    v7 = self;
    v8 = v5;
    v9 = 1;
  }
  -[PLPrivacy _setAuthStatus:scope:](v7, "_setAuthStatus:scope:", v8, v9);
  return v5;
}

- (void)_setAuthStatus:(int64_t)a3 scope:(int64_t)a4
{
  os_unfair_lock_s *p_cachedClientAuthLock;

  p_cachedClientAuthLock = &self->_cachedClientAuthLock;
  os_unfair_lock_lock(&self->_cachedClientAuthLock);
  if (a4 == 1 || (self->_cachedClientAuthRightFullAccess = a3, a3 == 2))
    self->_cachedClientAuthRightAddOnly = a3;
  os_unfair_lock_unlock(p_cachedClientAuthLock);
}

- (void)_checkAuthStatusForPhotosAccessScope:(int64_t)a3 preflightStatus:(int64_t)a4 promptIfUnknown:(BOOL)a5 resultHandler:(id)a6
{
  _BOOL4 v6;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  int v12;
  BOOL v13;
  int64_t v14;
  NSObject *v15;
  void *v16;
  dispatch_semaphore_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  intptr_t (*v28)(uint64_t, uint64_t);
  void *v29;
  PLPrivacy *v30;
  NSObject *v31;
  uint64_t *v32;
  int64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int64_t v37;
  __int128 buf;
  uint64_t (*v39)(uint64_t);
  void *v40;
  uint64_t *v41;
  uint64_t v42;

  v6 = a5;
  v42 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = a4;
  if (!a4)
  {
    v13 = TCCAccessRestricted() != 0;
    goto LABEL_19;
  }
  if (a4 != 1)
  {
    if (!v10)
      goto LABEL_29;
    goto LABEL_23;
  }
  v12 = TCCAccessRestricted();
  v13 = v12 != 0;
  if (!v6 || v12)
  {
LABEL_19:
    if (!v11)
      goto LABEL_29;
    if (v13)
    {
      v22 = 3;
LABEL_28:
      v11[2](v11, v22);
      goto LABEL_29;
    }
LABEL_23:
    v23 = v35[3];
    if (v23 > 4)
    {
      v22 = 1;
    }
    else
    {
      v24 = &unk_199EB0C00;
      if (a3 > 1)
        v24 = &unk_199EB0BD8;
      v22 = v24[v23];
    }
    goto LABEL_28;
  }
  v14 = a3;
  if (a3 == 1)
  {
    if (PLHasPhotoLibraryAddUsageDescription_onceToken != -1)
      dispatch_once(&PLHasPhotoLibraryAddUsageDescription_onceToken, &__block_literal_global_119);
    if (PLHasPhotoLibraryAddUsageDescription_hasUsageDescription)
      goto LABEL_9;
    if (PLHasPhotoLibraryUsageDescription_onceToken != -1)
      dispatch_once(&PLHasPhotoLibraryUsageDescription_onceToken, &__block_literal_global_122_3441);
    if (!PLHasPhotoLibraryUsageDescription_hasUsageDescription || TCCAccessRestricted())
    {
LABEL_9:
      v14 = 1;
    }
    else
    {
      PLBackendGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_199DF7000, v25, OS_LOG_TYPE_DEFAULT, "Missing NSPhotoLibraryAddUsageDescription, will try photos access instead of add-only", (uint8_t *)&buf, 2u);
      }

      v14 = 7;
    }
  }
  PLPrivacyGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    PLStringFromPhotosAccessScope(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_DEFAULT, "TCCAccessRequest %{public}@", (uint8_t *)&buf, 0xCu);

  }
  v17 = dispatch_semaphore_create(0);
  v18 = MEMORY[0x1E0C809B0];
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __96__PLPrivacy__checkAuthStatusForPhotosAccessScope_preflightStatus_promptIfUnknown_resultHandler___block_invoke;
  v29 = &unk_1E376B5B8;
  v30 = self;
  v32 = &v34;
  v33 = a3;
  v19 = v17;
  v31 = v19;
  v20 = &v26;
  *(_QWORD *)&buf = v18;
  *((_QWORD *)&buf + 1) = 3221225472;
  v39 = __PLTCCAuthorizationRequest_block_invoke;
  v40 = &unk_1E376B698;
  v41 = v20;
  v21 = v20;
  tcc_authorization_request();

  dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  if (v11)
  {
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
    if (a3 >= 2 && !PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0 && v35[3] == 3)
    {
      -[PLPrivacy setHasHandledLimitedLibraryReprompt:](self, "setHasHandledLimitedLibraryReprompt:", 1, v26, v27, v28, v29, v30);
      PLPresentLimitedLibraryPicker(1);
    }
    goto LABEL_23;
  }
LABEL_29:
  _Block_object_dispose(&v34, 8);

}

uint64_t __42__PLPrivacy_photosAccessAllowedWithScope___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)_authStatusForScope:(int64_t)a3
{
  os_unfair_lock_s *p_cachedClientAuthLock;
  int64_t cachedClientAuthRightFullAccess;

  p_cachedClientAuthLock = &self->_cachedClientAuthLock;
  os_unfair_lock_lock(&self->_cachedClientAuthLock);
  cachedClientAuthRightFullAccess = self->_cachedClientAuthRightFullAccess;
  if (a3 == 1 && (unint64_t)(cachedClientAuthRightFullAccess - 2) >= 3)
    cachedClientAuthRightFullAccess = self->_cachedClientAuthRightAddOnly;
  os_unfair_lock_unlock(p_cachedClientAuthLock);
  return cachedClientAuthRightFullAccess;
}

void __27__PLPrivacy_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (PLPrivacy)init
{
  PLPrivacy *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *isolationQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *callbackQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLPrivacy;
  v2 = -[PLPrivacy init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.photos.accessIsolation", v3);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.photos.accessCallbacks", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    v2->_cachedClientAuthLock._os_unfair_lock_opaque = 0;
    *(int64x2_t *)&v2->_cachedClientAuthRightFullAccess = vdupq_n_s64(1uLL);
  }
  return v2;
}

- (int64_t)photosAccessAllowedWithScope:(int64_t)a3 auditToken:(id *)a4 clientAuthorization:(id)a5
{
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  int64_t result;
  unint64_t v10;
  uint64_t v11;

  v6 = tcc_authorization_check_audit_token();
  if (v6 >= 5)
    v7 = 1;
  else
    v7 = v6;
  v8 = &unk_199EB0BD8;
  if (a3 <= 1)
    v8 = qword_199EB0C00;
  result = v8[v7];
  if (a3 == 1)
  {
    if ((result & 3) != 0)
    {
      v10 = tcc_authorization_check_audit_token();
      if (v10 >= 5)
        v11 = 1;
      else
        v11 = v10;
      if ((unint64_t)(v11 - 2) < 3)
        v11 = 4;
      return qword_199EB0C00[v11];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)checkPhotosAccessAllowedWithScope:(int64_t)a3 handler:(id)a4
{
  -[PLPrivacy _isPhotosAccessAllowedWithScope:promptIfUnknown:synchronous:resultHandler:](self, "_isPhotosAccessAllowedWithScope:promptIfUnknown:synchronous:resultHandler:", a3, 1, 0, a4);
}

- (int64_t)checkPhotosAccessAllowedWithScope:(int64_t)a3
{
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PLPrivacy_checkPhotosAccessAllowedWithScope___block_invoke;
  v5[3] = &unk_1E376C590;
  v5[4] = &v6;
  -[PLPrivacy _isPhotosAccessAllowedWithScope:promptIfUnknown:synchronous:resultHandler:](self, "_isPhotosAccessAllowedWithScope:promptIfUnknown:synchronous:resultHandler:", a3, 1, 1, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)presentAsyncPromptForLimitedLibraryPickerIfNeeded
{
  NSObject *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  BOOL v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v8 = -[PLPrivacy hasHandledLimitedLibraryReprompt](self, "hasHandledLimitedLibraryReprompt");
  if (!*((_BYTE *)v6 + 24))
  {
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
    if (!PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0)
    {
      dispatch_get_global_queue(0, 0);
      v3 = objc_claimAutoreleasedReturnValue();
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __62__PLPrivacy_presentAsyncPromptForLimitedLibraryPickerIfNeeded__block_invoke;
      v4[3] = &unk_1E376C748;
      v4[4] = self;
      v4[5] = &v5;
      dispatch_async(v3, v4);

    }
  }
  _Block_object_dispose(&v5, 8);
}

- (void)requestLimitedLibraryPromptForApplicationIdentifier:(id)a3
{
  id v5;
  NSObject *isolationQueue;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPrivacy.m"), 697, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationIdentifier"));

  }
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (!PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPrivacy.m"), 698, CFSTR("requestLimitedLibraryPromptForApplicationIdentifier: can only be called within assetsd"));

  }
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PLPrivacy_requestLimitedLibraryPromptForApplicationIdentifier___block_invoke;
  block[3] = &unk_1E376C6E0;
  v11 = v5;
  v9 = v5;
  dispatch_sync(isolationQueue, block);

}

- (void)reportPhotosUseWithClientAuthorization:(id)a3
{
  id v3;
  uint64_t *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[40];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isClientAuthorizedForTCCServicePhotos") & 1) != 0)
  {
    v4 = (uint64_t *)MEMORY[0x1E0DB1188];
  }
  else
  {
    if (!objc_msgSend(v3, "isClientAuthorizedForTCCServicePhotosAdd"))
      goto LABEL_17;
    v4 = (uint64_t *)MEMORY[0x1E0DB1190];
  }
  v5 = *v4;
  if (!TCCLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E376B6B8;
    *(_QWORD *)&buf[16] = 0;
    TCCLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (TCCLibraryCore_frameworkLibrary && gettcc_authorization_audit_token_report_useSymbolLoc())
  {
    PLPrivacyGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "trustedCallerBundleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = (int)objc_msgSend(v3, "clientProcessIdentifier");
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v5;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_DEBUG, "Reporting client %{public}@ (pid: %ld) use of photos service %{public}@", buf, 0x20u);

    }
    memset(buf, 0, 32);
    if (v3)
      objc_msgSend(v3, "clientAuditToken");
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__PLPrivacy_reportPhotosUseWithClientAuthorization___block_invoke;
    v11[3] = &unk_1E376B670;
    v13 = v5;
    v14 = *(_OWORD *)buf;
    v15 = *(_OWORD *)&buf[16];
    v12 = v3;
    dispatch_async(v8, v11);

  }
  else
  {
    PLPrivacyGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "trustedCallerBundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = (int)objc_msgSend(v3, "clientProcessIdentifier");
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v5;
      _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_DEFAULT, "Unable to report client %{public}@ (pid: %ld) use of photos service %{public}@", buf, 0x20u);

    }
  }
LABEL_17:

}

- (void)logPhotosAccessWithClientAuthorization:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  _OWORD v6[2];
  uint8_t buf[40];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isClientAuthorizedForTCCServicePhotos") & 1) != 0)
  {
    PLPrivacyGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "trustedCallerBundleID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = (int)objc_msgSend(v3, "clientProcessIdentifier");
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = CFSTR("read-write");
      _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_DEFAULT, "Logging client %{public}@ (pid: %ld) access to photos (%{public}@)", buf, 0x20u);

    }
    memset(buf, 0, 32);
    if (v3)
      objc_msgSend(v3, "clientAuditToken");
    v6[0] = *(_OWORD *)buf;
    v6[1] = *(_OWORD *)&buf[16];
    PLPrivacyAccountingLogPhotosAccess(v6);

  }
  else
  {
    objc_msgSend(v3, "isClientAuthorizedForTCCServicePhotosAdd");
  }

}

- (void)logPhotosAccessWithPhotoPickerClientIdentification:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v9[2];
  uint8_t buf[40];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLPrivacyGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "trustedCallerBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = (int)objc_msgSend(v3, "clientProcessIdentifier");
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_DEFAULT, "Logging client %{public}@ (pid: %ld) access to photos via picker", buf, 0x16u);

  }
  memset(buf, 0, 32);
  if (v3)
    objc_msgSend(v3, "clientAuditToken");
  v9[0] = *(_OWORD *)buf;
  v9[1] = *(_OWORD *)&buf[16];
  objc_msgSend(MEMORY[0x1E0D80C58], "applicationWithAuditToken:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80C70], "accessWithAccessor:forType:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80C48], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "log:", v7);

}

- (void)logPhotosPickerPresentedLibraryForClient:(id)a3 usingOptions:(int64_t)a4
{
  __CFString *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  char v20;
  id v21;
  NSObject *v22;
  const __CFString *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  NSObject *v33;
  __int16 v34;
  NSObject *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  if (-[__CFString length](v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    PLPhotosPickerLogDateFormatter();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v5, CFSTR("bundleIdentifier"));
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, CFSTR("timestamp"));
    if (a4 == 1)
    {
      v10 = MEMORY[0x1E0C9AAB0];
    }
    else
    {
      if (a4 != 2)
      {
LABEL_9:
        +[PLPhotoLibraryPathManager systemLibraryPathManager](PLPhotoLibraryPathManager, "systemLibraryPathManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        objc_msgSend(v11, "privateCacheDirectoryWithSubType:createIfNeeded:error:", 14, 1, &v29);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v29;
        v14 = v13;
        if (v12)
        {
          v24 = v13;
          objc_msgSend(v12, "stringByAppendingPathComponent:", v5);
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_logDictionaryFromPhotosPickerClientLogFile:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            -[NSObject addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v16);
          v25 = v9;
          v26 = v7;
          PLPrivacyGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v31 = v5;
            v32 = 2114;
            v33 = v6;
            _os_log_impl(&dword_199DF7000, v17, OS_LOG_TYPE_DEFAULT, "Logging photos picker presented library for client %{public}@: %{public}@", buf, 0x16u);
          }

          v28 = 0;
          objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 100, 0, &v28);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v28;
          v19 = v28;
          v20 = objc_msgSend(v18, "writeToFile:options:error:", v15, 1073741825, &v27);
          v21 = v27;

          if ((v20 & 1) == 0)
          {
            PLPrivacyGetLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = CFSTR("write");
              *(_DWORD *)buf = 138544130;
              if (!v18)
                v23 = CFSTR("encode");
              v31 = v23;
              v32 = 2114;
              v33 = v6;
              v34 = 2114;
              v35 = v15;
              v36 = 2112;
              v37 = v21;
              _os_log_impl(&dword_199DF7000, v22, OS_LOG_TYPE_ERROR, "Failed to %{public}@ photos picker client log %{public}@ to %{public}@: %@", buf, 0x2Au);
            }

          }
          v9 = v25;
          v7 = v26;
          v14 = v24;
        }
        else
        {
          PLPrivacyGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v31 = v5;
            v32 = 2112;
            v33 = v14;
            _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_ERROR, "Failed to create photos picker client log directory for client %{public}@: %@", buf, 0x16u);
          }
        }

        goto LABEL_24;
      }
      v10 = MEMORY[0x1E0C9AAA0];
    }
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, CFSTR("pickerUsesOptions"));
    goto LABEL_9;
  }
  PLPrivacyGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v5;
    _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_ERROR, "Failed to create photos picker client log for client with empty bundle identifier: %{public}@", buf, 0xCu);
  }
LABEL_24:

}

- (id)photosPickerPresentedLibraryLogsByClient
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  NSObject *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoLibraryPathManager systemLibraryPathManager](PLPhotoLibraryPathManager, "systemLibraryPathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateCacheDirectoryWithSubType:", 14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, &v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;

    if (v6)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = v6;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
      if (v9)
      {
        v10 = v9;
        v16 = v6;
        v11 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(v4, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)objc_opt_class(), "_logDictionaryFromPhotosPickerClientLogFile:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              objc_msgSend(v2, "addObject:", v14);

          }
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
        }
        while (v10);
        v6 = v16;
      }
    }
    else
    {
      if ((PLIsErrorFileNotFound(v7) & 1) != 0)
        goto LABEL_14;
      PLPrivacyGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v23 = v4;
        v24 = 2114;
        v25 = v7;
        _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_ERROR, "Failed to read contents of picker client log directory %{public}@: %{public}@", buf, 0x16u);
      }
    }

LABEL_14:
    goto LABEL_17;
  }
  PLPrivacyGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Failed to get photos picker client log directory", buf, 2u);
  }
LABEL_17:

  return v2;
}

- (id)photosPickerPresentedLibraryLogForClient:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    +[PLPhotoLibraryPathManager systemLibraryPathManager](PLPhotoLibraryPathManager, "systemLibraryPathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateCacheDirectoryWithSubType:", 14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "stringByAppendingPathComponent:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_logDictionaryFromPhotosPickerClientLogFile:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PLPrivacyGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "Failed to get photos picker client log directory", (uint8_t *)&v12, 2u);
      }

      v7 = 0;
    }
    v8 = v7;

    v9 = v8;
  }
  else
  {
    PLPrivacyGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 138543362;
      v13 = v3;
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_ERROR, "Failed to access photos picker client log for client with invalid bundle identifier: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)hasHandledLimitedLibraryReprompt
{
  return self->_hasHandledLimitedLibraryReprompt;
}

- (void)setHasHandledLimitedLibraryReprompt:(BOOL)a3
{
  self->_hasHandledLimitedLibraryReprompt = a3;
}

- (BOOL)isLimitedLibrarySupported
{
  return self->_limitedLibrarySupported;
}

- (void)setLimitedLibrarySupported:(BOOL)a3
{
  self->_limitedLibrarySupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacySupportClient, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

void __52__PLPrivacy_reportPhotosUseWithClientAuthorization___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t (*v4)(uint64_t, _BYTE *, _QWORD);
  int v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BYTE buf[32];
  __int16 v13;
  int v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 64);
  v15 = *(_OWORD *)(a1 + 48);
  v16 = v3;
  v4 = (uint64_t (*)(uint64_t, _BYTE *, _QWORD))gettcc_authorization_audit_token_report_useSymbolLoc();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool pl_tcc_authorization_audit_token_report_use(CFStringRef _Nonnull, audit_token_t, CFDictionaryRef _Nullable)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PLPrivacy.m"), 32, CFSTR("%s"), dlerror());

    __break(1u);
  }
  *(_OWORD *)buf = v15;
  *(_OWORD *)&buf[16] = v16;
  v5 = v4(v2, buf, 0);
  PLPrivacyGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "trustedCallerBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "clientProcessIdentifier");
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    *(_QWORD *)&buf[24] = v9;
    v13 = 1024;
    v14 = v5;
    _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_DEFAULT, "Reported client %{public}@ (pid: %ld) use of photos service %{public}@ (rv=%d)", buf, 0x26u);

  }
}

void __65__PLPrivacy_requestLimitedLibraryPromptForApplicationIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("PLLimitedLibraryApplicationEntries"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v3 = (void *)objc_msgSend(v6, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("ForcePrompt"), *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("PLLimitedLibraryApplicationEntries"));

}

void __62__PLPrivacy_presentAsyncPromptForLimitedLibraryPickerIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  PLNonBindingAssetsdClient *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[6];
  uint8_t buf[16];

  if (PLShouldPreventAutomaticLimitedAccessAlert_onceToken != -1)
    dispatch_once(&PLShouldPreventAutomaticLimitedAccessAlert_onceToken, &__block_literal_global_108_3426);
  if (PLShouldPreventAutomaticLimitedAccessAlert_shouldPreventAlert)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHasHandledLimitedLibraryReprompt:", 1);
LABEL_9:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_10;
  }
  if ((PLIsClientApplicationStateReadyForLimitedLibraryPickerReprompt() & 1) == 0)
  {
    PLPrivacyGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199DF7000, v2, OS_LOG_TYPE_DEFAULT, "Application state is not ready for limited library picker re-prompt", buf, 2u);
    }

    goto LABEL_9;
  }
LABEL_10:
  v3 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(*(_QWORD *)(v3 + 8) + 24))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 8);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__PLPrivacy_presentAsyncPromptForLimitedLibraryPickerIfNeeded__block_invoke_48;
    v12[3] = &unk_1E376C748;
    v12[4] = v4;
    v12[5] = v3;
    dispatch_sync(v5, v12);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
        goto LABEL_14;
      v6 = objc_alloc_init(PLNonBindingAssetsdClient);
      -[PLNonBindingAssetsdClient privacySupportClient](v6, "privacySupportClient");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 48);
      *(_QWORD *)(v8 + 48) = v7;

      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
      {
LABEL_14:
        PLPrivacyGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_DEFAULT, "Presenting limited library picker re-prompt", buf, 2u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "presentLimitedLibraryPickerRepromptWithCompletionHandler:", &__block_literal_global_52_6643);
      }
      else
      {
        PLPrivacyGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_ERROR, "Failed to message privacy support client to reprompt alert", buf, 2u);
        }

      }
    }
  }
}

uint64_t __62__PLPrivacy_presentAsyncPromptForLimitedLibraryPickerIfNeeded__block_invoke_48(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasHandledLimitedLibraryReprompt");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_authStatusForScope:", 7);
    if (result == 3)
      return objc_msgSend(*(id *)(a1 + 32), "setHasHandledLimitedLibraryReprompt:", 1);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void __62__PLPrivacy_presentAsyncPromptForLimitedLibraryPickerIfNeeded__block_invoke_50(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];
  uint64_t v6;
  uint64_t v7;

  if (a2)
  {
    PLPresentLimitedLibraryPicker(0);
  }
  else
  {
    v6 = v2;
    v7 = v3;
    PLPrivacyGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_DEBUG, "Skipping limited library picker, will keep current selection", v5, 2u);
    }

  }
}

uint64_t __47__PLPrivacy_checkPhotosAccessAllowedWithScope___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __87__PLPrivacy__isPhotosAccessAllowedWithScope_promptIfUnknown_synchronous_resultHandler___block_invoke_47(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v2 == 1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_authStatusForScope:", *(_QWORD *)(a1 + 56));
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_checkAuthStatusForPhotosAccessScope:preflightStatus:promptIfUnknown:resultHandler:", *(_QWORD *)(a1 + 56), v2, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40));
}

intptr_t __96__PLPrivacy__checkAuthStatusForPhotosAccessScope_preflightStatus_promptIfUnknown_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_setAuthStatus:scope:", a2, *(_QWORD *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  PLPrivacyGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_DEFAULT, "TCCAccessRequest returned %d", (uint8_t *)v6, 8u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)_logDictionaryFromPhotosPickerClientLogFile:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  id v12;
  id v14;
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v3, 0, &v15);
  v5 = v15;
  v6 = v5;
  if (v4)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;

    if (v7)
    {
      _ValidatedClientLogFromDictionary(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else
  {
    v8 = v5;
  }
  PLPrivacyGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = CFSTR("read");
    *(_DWORD *)buf = 138543874;
    if (!v4)
      v11 = CFSTR("decode");
    v17 = v11;
    v18 = 2114;
    v19 = v3;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "Failed to %{public}@ photos picker client log from %{public}@: %@", buf, 0x20u);
  }

  v7 = 0;
  v9 = 0;
LABEL_10:
  v12 = v9;

  return v12;
}

@end
