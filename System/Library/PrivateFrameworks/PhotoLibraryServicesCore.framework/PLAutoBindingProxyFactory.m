@implementation PLAutoBindingProxyFactory

id __46__PLAutoBindingProxyFactory__cachedBindResult__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __66__PLAutoBindingProxyFactory_initWithProxyFactory_photoLibraryURL___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_bindToPhotoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __54__PLAutoBindingProxyFactory__lazilyBindToPhotoLibrary__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

- (id)_bindToPhotoLibrary
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_opt_class(), "maxBindAttemptCount");
  v4 = 0;
  v5 = -1;
  do
  {
    v6 = v4;
    -[PLAutoBindingProxyFactory _attemptBindToPhotoLibrary](self, "_attemptBindToPhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[PLAutoBindingProxyFactory _isResultAnInterruptionError:](self, "_isResultAnInterruptionError:", v4);
    v8 = v5 + 2;
    ++v5;
  }
  while (v7 && v8 < v3);
  if (v5)
  {
    PLGatekeeperXPCGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = v8;
      _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_DEFAULT, "Repeated bind for %lu attempts", (uint8_t *)&v12, 0xCu);
    }

  }
  if (v7)
  {
    PLGatekeeperXPCGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 134217984;
      v13 = v8;
      _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "Failed bind after %lu attempts", (uint8_t *)&v12, 0xCu);
    }

  }
  return v4;
}

- (BOOL)_isResultAnInterruptionError:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "isFailure"))
  {
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = PLIsErrorEqualToCode(v4, (void *)*MEMORY[0x1E0CB28A8], 4097);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __53__PLAutoBindingProxyFactory__updateCachedBindResult___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  PLLazyObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isFailure"))
  {
    PLGatekeeperXPCGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(v3 + 40);
      v6 = *(_QWORD *)(v3 + 24);
      *(_DWORD *)buf = 138412802;
      v19 = v5;
      v20 = 2112;
      v21 = v4;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_199DF7000, v2, OS_LOG_TYPE_ERROR, "Got a bind failure for URL %@, resetting bind state: %@ (previous result: %@)", buf, 0x20u);
    }

    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = 0;

    v9 = *(void **)(a1 + 40);
    v10 = objc_initWeak((id *)buf, v9);

    v11 = [PLLazyObject alloc];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __53__PLAutoBindingProxyFactory__updateCachedBindResult___block_invoke_7;
    v16[3] = &unk_1E376C1C8;
    objc_copyWeak(&v17, (id *)buf);
    v12 = -[PLLazyObject initWithBlock:](v11, "initWithBlock:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(NSObject **)(v13 + 16);
    *(_QWORD *)(v13 + 16) = v12;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), *(id *)(a1 + 32));
    PLGatekeeperXPCGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_199DF7000, v14, OS_LOG_TYPE_DEBUG, "Setting bind result to: %@", buf, 0xCu);
    }
  }

}

+ (unint64_t)maxBindAttemptCount
{
  if (!PFOSVariantHasInternalDiagnostics())
    return 50;
  if ((PFProcessIsLaunchedToExecuteTests() & 1) != 0)
    return 2;
  if (PLMobileSlideShowPhotoLibraryTestingMode_onceToken != -1)
    dispatch_once(&PLMobileSlideShowPhotoLibraryTestingMode_onceToken, &__block_literal_global_3361);
  if (PLMobileSlideShowPhotoLibraryTestingMode_sMobileSlideShowPhotoLibraryTestingMode)
    return 2;
  else
    return -1;
}

- (PLAutoBindingProxyFactory)initWithProxyFactory:(id)a3 photoLibraryURL:(id)a4
{
  id v7;
  id v8;
  PLAutoBindingProxyFactory *v9;
  NSObject *v10;
  NSURL *photoLibraryURL;
  uint64_t v12;
  NSURL *v13;
  id v14;
  PLLazyObject *v15;
  uint64_t v16;
  PLLazyObject *lazyBindToPhotoLibrary;
  void *v18;
  _QWORD v20[4];
  id v21;
  objc_super v22;
  uint8_t buf[4];
  NSURL *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PLAutoBindingProxyFactory;
  v9 = -[PLAutoBindingProxyFactory init](&v22, sel_init);
  if (v9)
  {
    if (!v7)
    {
      PLGatekeeperXPCGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        photoLibraryURL = v9->_photoLibraryURL;
        *(_DWORD *)buf = 138412290;
        v24 = photoLibraryURL;
        _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "Creating an autobinding proxy factory from a nil proxy factor for library URL: %@", buf, 0xCu);
      }

    }
    objc_storeStrong((id *)&v9->_proxyFactory, a3);
    v12 = objc_msgSend(v8, "copy");
    v13 = v9->_photoLibraryURL;
    v9->_photoLibraryURL = (NSURL *)v12;

    v9->_bindLock._os_unfair_lock_opaque = 0;
    v14 = objc_initWeak((id *)buf, v9);

    v15 = [PLLazyObject alloc];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __66__PLAutoBindingProxyFactory_initWithProxyFactory_photoLibraryURL___block_invoke;
    v20[3] = &unk_1E376C1C8;
    objc_copyWeak(&v21, (id *)buf);
    v16 = -[PLLazyObject initWithBlock:](v15, "initWithBlock:", v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
    lazyBindToPhotoLibrary = v9->_lazyBindToPhotoLibrary;
    v9->_lazyBindToPhotoLibrary = (PLLazyObject *)v16;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v9, sel__connectionInterrupted_, CFSTR("PLAssetsdClientXPCConnectionInterruptedInternalNotificationName"), v9->_proxyFactory);

  }
  return v9;
}

- (id)_attemptBindToPhotoLibrary
{
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *Name;
  PLXPCProxyCreating *proxyFactory;
  uint64_t v13;
  void *v14;
  NSURL *photoLibraryURL;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const char *v21;
  _QWORD v23[6];
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  SEL sel[2];
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  *(_OWORD *)sel = 0u;
  v25 = 0u;
  v4 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled");
  LOBYTE(v25) = v4;
  if (v4)
  {
    v5 = _os_activity_create(&dword_199DF7000, "PLXPC Client: _attemptBindToPhotoLibrary", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v6 = (void *)*((_QWORD *)&v25 + 1);
    *((_QWORD *)&v25 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  PLRequestGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v8 = os_signpost_id_generate(v7);
  *(_QWORD *)&v26 = v8;
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__9795;
  v31 = __Block_byref_object_dispose__9796;
  v32 = 0;
  proxyFactory = self->_proxyFactory;
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __55__PLAutoBindingProxyFactory__attemptBindToPhotoLibrary__block_invoke;
  v24[3] = &unk_1E376C268;
  v24[4] = self;
  v24[5] = &buf;
  -[PLXPCProxyCreating synchronousRemoteObjectProxyWithErrorHandler:](proxyFactory, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  photoLibraryURL = self->_photoLibraryURL;
  objc_msgSend((id)objc_opt_class(), "clientToServiceSandboxExtensionForURL:", photoLibraryURL);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __55__PLAutoBindingProxyFactory__attemptBindToPhotoLibrary__block_invoke_11;
  v23[3] = &unk_1E376C268;
  v23[4] = self;
  v23[5] = &buf;
  objc_msgSend(v14, "bindToPhotoLibraryURL:sandboxExtension:clientOptions:withReply:", photoLibraryURL, v16, 0, v23);

  v17 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v25)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  if ((_QWORD)v26)
  {
    PLRequestGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      v21 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v21;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  return v17;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[PLAutoBindingProxyFactory _bindToPhotoLibraryIfNecessaryWithErrorHandler:](self, "_bindToPhotoLibraryIfNecessaryWithErrorHandler:", v4);
  -[PLXPCProxyCreating synchronousRemoteObjectProxyWithErrorHandler:](self->_proxyFactory, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PLAutoBindingProxyFactory _blackholeProxyForProxy:](self, "_blackholeProxyForProxy:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (BOOL)_bindToPhotoLibraryIfNecessaryWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  char v6;
  void *v7;

  v4 = (void (**)(id, void *))a3;
  -[PLAutoBindingProxyFactory _bindToPhotoLibraryIfNecessary](self, "_bindToPhotoLibraryIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSuccess");
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v5, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);

  }
  return v6;
}

- (id)_bindToPhotoLibraryIfNecessary
{
  void *v3;

  -[PLAutoBindingProxyFactory _cachedBindResult](self, "_cachedBindResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PLAutoBindingProxyFactory _bindToPhotoLibraryAndCacheResult](self, "_bindToPhotoLibraryAndCacheResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_cachedBindResult
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__PLAutoBindingProxyFactory__cachedBindResult__block_invoke;
  v3[3] = &unk_1E376C218;
  v3[4] = self;
  PLResultWithUnfairLock(&self->_bindLock, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_bindToPhotoLibraryAndCacheResult
{
  void *v3;

  -[PLAutoBindingProxyFactory _lazilyBindToPhotoLibrary](self, "_lazilyBindToPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAutoBindingProxyFactory _updateCachedBindResult:](self, "_updateCachedBindResult:", v3);
  return v3;
}

- (void)_updateCachedBindResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PLAutoBindingProxyFactory *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PLAutoBindingProxyFactory__updateCachedBindResult___block_invoke;
  v6[3] = &unk_1E376C718;
  v7 = v4;
  v8 = self;
  v5 = v4;
  PLRunWithUnfairLock(&self->_bindLock, v6);

}

- (id)_lazilyBindToPhotoLibrary
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PLAutoBindingProxyFactory__lazilyBindToPhotoLibrary__block_invoke;
  v5[3] = &unk_1E376C240;
  v5[4] = self;
  PLResultWithUnfairLock(&self->_bindLock, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)clientToServiceSandboxExtensionForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLGetSandboxExtensionTokenWithFlags(v5, *MEMORY[0x1E0C80008], *MEMORY[0x1E0C806E0], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLSandboxExtensionTokenAsData(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PLGatekeeperXPCGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLFileUtilities redactedDescriptionForPath:](PLFileUtilities, "redactedDescriptionForPath:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("YES");
    v15 = 138544130;
    v17 = 2112;
    v16 = v9;
    if (!v7)
      v13 = CFSTR("NO");
    v18 = v4;
    v19 = 2114;
    v20 = v11;
    v21 = 2114;
    v22 = v13;
    _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %@ (%{public}@) hasExtension:%{public}@", (uint8_t *)&v15, 0x2Au);

  }
  return v7;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[PLAutoBindingProxyFactory _bindToPhotoLibraryIfNecessaryWithErrorHandler:](self, "_bindToPhotoLibraryIfNecessaryWithErrorHandler:", v4);
  -[PLXPCProxyCreating remoteObjectProxyWithErrorHandler:](self->_proxyFactory, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PLAutoBindingProxyFactory _blackholeProxyForProxy:](self, "_blackholeProxyForProxy:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (id)_blackholeProxyForProxy:(id)a3
{
  PLXPCProxyCreating *v4;
  NSObject *v5;
  _BOOL4 v6;
  PLXPCProxyCreating *proxyFactory;
  NSURL *photoLibraryURL;
  PLAutoBindingBlackholeProxy *v9;
  PLXPCProxyCreating *v10;
  NSURL *v11;
  int v13;
  PLXPCProxyCreating *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  NSURL *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (PLXPCProxyCreating *)a3;
  PLGatekeeperXPCGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      proxyFactory = self->_proxyFactory;
      photoLibraryURL = self->_photoLibraryURL;
      v13 = 138412802;
      v14 = v4;
      v15 = 2112;
      v16 = proxyFactory;
      v17 = 2112;
      v18 = photoLibraryURL;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "Creating blackhole proxy for %@ from proxy factory %@ for library URL: %@", (uint8_t *)&v13, 0x20u);
    }

    v9 = -[PLAutoBindingBlackholeProxy initWithTargetObject:]([PLAutoBindingBlackholeProxy alloc], "initWithTargetObject:", v4);
  }
  else
  {
    if (v6)
    {
      v10 = self->_proxyFactory;
      v11 = self->_photoLibraryURL;
      v13 = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "Got a nil proxy from proxy factory %@ for library URL: %@", (uint8_t *)&v13, 0x16u);
    }

    v9 = 0;
  }

  return v9;
}

- (id)_unboostingRemoteObjectProxy
{
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PLAutoBindingProxyFactory__unboostingRemoteObjectProxy__block_invoke;
  v5[3] = &unk_1E376C1F0;
  v5[4] = self;
  if (-[PLAutoBindingProxyFactory _bindToPhotoLibraryIfNecessaryWithErrorHandler:](self, "_bindToPhotoLibraryIfNecessaryWithErrorHandler:", v5))
  {
    -[PLXPCProxyCreating _unboostingRemoteObjectProxy](self->_proxyFactory, "_unboostingRemoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)addBarrierBlock:(id)a3
{
  -[PLXPCProxyCreating addBarrierBlock:](self->_proxyFactory, "addBarrierBlock:", a3);
}

- (void)_connectionInterrupted:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__PLAutoBindingProxyFactory__connectionInterrupted___block_invoke;
  v3[3] = &unk_1E376C6E0;
  v3[4] = self;
  PLSafeRunWithUnfairLock(&self->_bindLock, v3);
}

- (PLXPCProxyCreating)proxyFactory
{
  return (PLXPCProxyCreating *)objc_getProperty(self, a2, 32, 1);
}

- (NSURL)photoLibraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
  objc_storeStrong((id *)&self->_proxyFactory, 0);
  objc_storeStrong((id *)&self->_cachedBindResult, 0);
  objc_storeStrong((id *)&self->_lazyBindToPhotoLibrary, 0);
}

void __52__PLAutoBindingProxyFactory__connectionInterrupted___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  PLLazyObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  PLGatekeeperXPCGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 40);
    v5 = *(_QWORD *)(v3 + 24);
    *(_DWORD *)buf = 138412546;
    v17 = v4;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_199DF7000, v2, OS_LOG_TYPE_DEFAULT, "Client connection interrupted for URL %@, resetting bind state (previous result: %@)", buf, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = 0;

  v8 = *(void **)(a1 + 32);
  v9 = objc_initWeak((id *)buf, v8);

  v10 = [PLLazyObject alloc];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__PLAutoBindingProxyFactory__connectionInterrupted___block_invoke_13;
  v14[3] = &unk_1E376C1C8;
  objc_copyWeak(&v15, (id *)buf);
  v11 = -[PLLazyObject initWithBlock:](v10, "initWithBlock:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v11;

}

id __52__PLAutoBindingProxyFactory__connectionInterrupted___block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_bindToPhotoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __55__PLAutoBindingProxyFactory__attemptBindToPhotoLibrary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v9 = 136315650;
    v10 = "-[PLAutoBindingProxyFactory _attemptBindToPhotoLibrary]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy to open photo library with URL %s: %@ %@", (uint8_t *)&v9, 0x20u);
  }

  +[PLResult failureWithError:](PLResult, "failureWithError:", v3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __55__PLAutoBindingProxyFactory__attemptBindToPhotoLibrary__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLGatekeeperXPCGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v13 = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Failed to open photo library %@, %@", (uint8_t *)&v13, 0x16u);
    }

    +[PLResult failureWithError:](PLResult, "failureWithError:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLResult successWithResult:](PLResult, "successWithResult:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

id __53__PLAutoBindingProxyFactory__updateCachedBindResult___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_bindToPhotoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __57__PLAutoBindingProxyFactory__unboostingRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLGatekeeperXPCGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_ERROR, "Unable to bind to photo library URL %@: %@", (uint8_t *)&v6, 0x16u);
  }

}

@end
