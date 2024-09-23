@implementation VUIAppContext

- (void)_addPrivateInterfaces
{
  VUIJSFoundation *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD aBlock[4];
  id v41;
  id location[2];

  v3 = -[VUIJSFoundation initWithAppContext:]([VUIJSFoundation alloc], "initWithAppContext:", self);
  -[VUIAppContext setJsFoundation:](self, "setJsFoundation:", v3);

  -[VUIAppContext jsContext](self, "jsContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke;
  aBlock[3] = &unk_1E9F99028;
  objc_copyWeak(&v41, location);
  v6 = _Block_copy(aBlock);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("formatLocalizedNumber"));

  v38[0] = v5;
  v38[1] = 3221225472;
  v38[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_2;
  v38[3] = &unk_1E9F99050;
  objc_copyWeak(&v39, location);
  v7 = _Block_copy(v38);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("formatLocalizedLocaleIdentifier"));

  v36[0] = v5;
  v36[1] = 3221225472;
  v36[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_3;
  v36[3] = &unk_1E9F99050;
  objc_copyWeak(&v37, location);
  v8 = _Block_copy(v36);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("joinComponentsWithLocalizedCommaAndSpace"));

  v34[0] = v5;
  v34[1] = 3221225472;
  v34[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_4;
  v34[3] = &unk_1E9F99050;
  objc_copyWeak(&v35, location);
  v9 = _Block_copy(v34);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("joinComponentsWithLocalizedSemicolonAndSpace"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__block_literal_global_2, CFSTR("UUID"));
  v32[0] = v5;
  v32[1] = 3221225472;
  v32[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_6;
  v32[3] = &unk_1E9F990B8;
  objc_copyWeak(&v33, location);
  v10 = _Block_copy(v32);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("setInterval"));

  v30[0] = v5;
  v30[1] = 3221225472;
  v30[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_7;
  v30[3] = &unk_1E9F990E0;
  objc_copyWeak(&v31, location);
  v11 = _Block_copy(v30);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("clearInterval"));

  v28[0] = v5;
  v28[1] = 3221225472;
  v28[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_8;
  v28[3] = &unk_1E9F990B8;
  objc_copyWeak(&v29, location);
  v12 = _Block_copy(v28);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("setTimeout"));

  v26[0] = v5;
  v26[1] = 3221225472;
  v26[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_9;
  v26[3] = &unk_1E9F990E0;
  objc_copyWeak(&v27, location);
  v13 = _Block_copy(v26);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("clearTimeout"));

  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_10;
  v24[3] = &unk_1E9F99108;
  objc_copyWeak(&v25, location);
  v14 = _Block_copy(v24);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("formatDate"));

  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_11;
  v22[3] = &unk_1E9F99108;
  objc_copyWeak(&v23, location);
  v15 = _Block_copy(v22);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("formatDuration"));

  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_12;
  v20[3] = &unk_1E9F99130;
  objc_copyWeak(&v21, location);
  v16 = _Block_copy(v20);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("formatNumber"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__block_literal_global_68, CFSTR("fetchAppAccessStatus"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__block_literal_global_75, CFSTR("canOpenURL"));
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_15;
  v18[3] = &unk_1E9F99200;
  objc_copyWeak(&v19, location);
  v17 = _Block_copy(v18);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("openURL"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__block_literal_global_86, CFSTR("atob"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__block_literal_global_91, CFSTR("btoa"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__block_literal_global_95, CFSTR("localizedUppercaseString"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__block_literal_global_98, CFSTR("localizedLowercaseString"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__block_literal_global_101, CFSTR("localizedCapitalizedString"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__block_literal_global_105, CFSTR("isPPMEnabled"));
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(location);

}

- (void)setJsFoundation:(id)a3
{
  objc_storeStrong((id *)&self->_jsFoundation, a3);
}

- (void)_jsThreadMain
{
  void *v3;
  VUIAppContext *v4;
  CFRunLoopRef Current;
  __CFRunLoopSource *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  CFRunLoopRunResult v11;
  VUIAppContext *v12;
  __CFRunLoopSource *jsThreadRunLoopSource;
  VUIAppContext *v15;
  void *v16;
  CFRunLoopSourceContext v17;

  v3 = (void *)MEMORY[0x1DF0999A8](self, a2);
  v17.version = 0;
  v17.info = self;
  memset(&v17.retain, 0, 40);
  v17.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))VUIRunLoopSourceScheduleCallBack;
  v17.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))VUIRunLoopSourceCancelCallBack;
  v17.perform = (void (__cdecl *)(void *))VUIRunLoopSourcePerformCallBack;
  v4 = self;
  objc_sync_enter(v4);
  Current = CFRunLoopGetCurrent();
  v4->_jsThreadRunLoop = Current;
  CFRetain(Current);
  v6 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v17);
  v4->_jsThreadRunLoopSource = v6;
  v7 = (const __CFString *)*MEMORY[0x1E0C9B280];
  CFRunLoopAddSource(Current, v6, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread", v17.version, v17.info, *(_OWORD *)&v17.retain, *(_OWORD *)&v17.copyDescription, v17.hash, v17.schedule, v17.cancel, v17.perform);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "threadDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("vuiAppContext"));

  objc_sync_exit(v4);
  do
  {
    v10 = (void *)MEMORY[0x1DF0999A8]();
    v11 = CFRunLoopRunInMode(v7, 1.0e10, 1u);
    objc_autoreleasePoolPop(v10);
    v12 = v4;
    objc_sync_enter(v12);
    jsThreadRunLoopSource = v4->_jsThreadRunLoopSource;
    objc_sync_exit(v12);

  }
  while ((v11 - 3) <= 0xFFFFFFFD && jsThreadRunLoopSource == v6);
  v15 = v12;
  objc_sync_enter(v15);
  objc_msgSend(v8, "threadDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectForKey:", CFSTR("vuiAppContext"));
  CFRelease(v6);
  CFRelease(Current);

  objc_sync_exit(v15);
  objc_autoreleasePoolPop(v3);
}

+ (id)currentAppContext
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("vuiAppContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)contextDidStartWithJS:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[VUIAppContext delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "appContext:didStartWithOptions:validatedJSString:", self, v6, v8);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "appContext:didStartWithOptions:", self, v6);
  }
  -[VUIAppContext _drainOnStartQueue](self, "_drainOnStartQueue");

}

- (void)_drainOnStartQueue
{
  VUIAppContext *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[VUIAppContext onStartQueue](v2, "onStartQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[VUIAppContext onStartQueue](v2, "onStartQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  objc_sync_exit(v2);
  if (objc_msgSend(v4, "count"))
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "[StartQueue] Draining start Queue", buf, 2u);
    }

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v7, "count", (_QWORD)v12))
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_INFO, "[StartQueue] Done Draining start Queue!", buf, 2u);
    }

  }
}

- (NSMutableArray)onStartQueue
{
  return self->_onStartQueue;
}

- (void)evaluate:(id)a3
{
  -[VUIAppContext evaluate:completionBlock:completionQueue:](self, "evaluate:completionBlock:completionQueue:", a3, 0, 0);
}

- (BOOL)_prepareStartWithURL:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  VUIAppContext *v15;
  void *v16;
  void *v17;
  id v18;
  VUIRunLoopSourceRecord *v19;
  VUIRunLoopSourceRecord *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id location;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  VUIAppContext *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = -[VUIAppContext mode](self, "mode");
  v6 = v4;
  if (!v6)
    goto LABEL_15;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = -[VUIAppContext mode](self, "mode");
    *(_DWORD *)buf = 138413058;
    v31 = v9;
    v32 = 2048;
    v33 = v10;
    v34 = 2048;
    v35 = self;
    v36 = 2112;
    v37 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_INFO, "VUIAppContext - <%@ (%lu): %p> Launching JavaScript app from URL: %@", buf, 0x2Au);

  }
  objc_msgSend(v6, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToString:", CFSTR("https")))
  {
    -[VUIAppContext app](self, "app");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "shouldIgnoreJSValidation");

    if ((v14 & 1) != 0)
      goto LABEL_8;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DC6BA8], 101, 0);
    v15 = (VUIAppContext *)objc_claimAutoreleasedReturnValue();
    -[VUIAppContext contextDidFailWithError:](self, "contextDidFailWithError:", v15);
    LOBYTE(self) = 0;
    goto LABEL_16;
  }

LABEL_8:
  v15 = self;
  objc_sync_enter(v15);
  -[VUIAppContext pendingQueue](v15, "pendingQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = v16 == 0;

  if ((_DWORD)self)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VUIAppContext setPendingQueue:](v15, "setPendingQueue:", v18);

    -[VUIAppContext setCanAccessPendingQueue:](v15, "setCanAccessPendingQueue:", 1);
    v19 = [VUIRunLoopSourceRecord alloc];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __38__VUIAppContext__prepareStartWithURL___block_invoke;
    v26[3] = &unk_1E9F9A938;
    objc_copyWeak(&v28, &location);
    v27 = v6;
    v20 = -[VUIRunLoopSourceRecord initWithEvaluateBlock:completionBlock:completionQueue:](v19, "initWithEvaluateBlock:completionBlock:completionQueue:", v26, 0, 0);
    -[VUIAppContext pendingQueue](v15, "pendingQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v20);

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", v15, sel__jsThreadMain, 0);
    v23 = v22;
    if (v5 == 1000)
      v24 = 9;
    else
      v24 = 25;
    objc_msgSend(v22, "setQualityOfService:", v24);
    objc_msgSend(v23, "setName:", CFSTR("VUICoreThread"));
    objc_msgSend(v23, "start");

    objc_destroyWeak(&v28);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DC6BA8], 100, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppContext contextDidFailWithError:](v15, "contextDidFailWithError:", v17);

  }
  objc_sync_exit(v15);
LABEL_16:

  objc_destroyWeak(&location);
  return (char)self;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)_sourcePerform
{
  VUIAppContext *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void (**v6)(void);
  uint64_t v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  void *v11;
  NSObject *v12;
  void (**v13)(_QWORD, _QWORD);
  uint64_t v14;
  _QWORD block[4];
  id v16;
  _QWORD aBlock[5];
  id v18;

  v2 = self;
  objc_sync_enter(v2);
  -[VUIAppContext pendingQueue](v2, "pendingQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__VUIAppContext__sourcePerform__block_invoke;
  aBlock[3] = &unk_1E9FA52D8;
  aBlock[4] = v2;
  v5 = v3;
  v18 = v5;
  v6 = (void (**)(void))_Block_copy(aBlock);
  v6[2]();
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      objc_msgSend(v8, "evaluateBlock");
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v9[2]();

      objc_msgSend(v8, "completionBlock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v8, "completionQueue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v8, "completionQueue");
          v12 = objc_claimAutoreleasedReturnValue();
          block[0] = v4;
          block[1] = 3221225472;
          block[2] = __31__VUIAppContext__sourcePerform__block_invoke_2;
          block[3] = &unk_1E9F98DF0;
          v16 = v8;
          dispatch_async(v12, block);

          v13 = (void (**)(_QWORD, _QWORD))v16;
        }
        else
        {
          objc_msgSend(v8, "completionBlock");
          v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v13[2](v13, 1);
        }

      }
      ((void (*)(void (**)(void)))v6[2])(v6);
      v14 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v14;
    }
    while (v14);
  }

}

id __31__VUIAppContext__sourcePerform__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", 0);
  objc_sync_exit(v2);

  return v3;
}

- (void)evaluate:(id)a3 completionBlock:(id)a4 completionQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  VUIAppContext *v11;
  VUIRunLoopSourceRecord *v12;
  VUIRunLoopSourceRecord *v13;
  void *v14;
  __CFRunLoopSource *jsThreadRunLoopSource;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  if (-[VUIAppContext canAccessPendingQueue](v11, "canAccessPendingQueue"))
  {
    objc_initWeak(&location, v11);
    v12 = [VUIRunLoopSourceRecord alloc];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__VUIAppContext_evaluate_completionBlock_completionQueue___block_invoke;
    v16[3] = &unk_1E9F9A060;
    objc_copyWeak(&v18, &location);
    v17 = v8;
    v13 = -[VUIRunLoopSourceRecord initWithEvaluateBlock:completionBlock:completionQueue:](v12, "initWithEvaluateBlock:completionBlock:completionQueue:", v16, v9, v10);
    -[VUIAppContext pendingQueue](v11, "pendingQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v13);

    if (v11->_jsThreadRunLoop)
    {
      jsThreadRunLoopSource = v11->_jsThreadRunLoopSource;
      if (jsThreadRunLoopSource)
      {
        CFRunLoopSourceSignal(jsThreadRunLoopSource);
        CFRunLoopWakeUp(v11->_jsThreadRunLoop);
      }
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v11);

}

- (NSMutableArray)pendingQueue
{
  return self->_pendingQueue;
}

- (BOOL)canAccessPendingQueue
{
  return self->_canAccessPendingQueue;
}

void __58__VUIAppContext_evaluate_completionBlock_completionQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_evaluate:", *(_QWORD *)(a1 + 32));

}

- (void)_evaluate:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppContext setPostEvaluationBlocks:](self, "setPostEvaluationBlocks:", v4);

  -[VUIAppContext _doEvaluate:](self, "_doEvaluate:", v16);
  -[VUIAppContext postEvaluationBlocks](self, "postEvaluationBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    do
    {
      -[VUIAppContext postEvaluationBlocks](self, "postEvaluationBlocks");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectAtIndex:", 0);

      -[VUIAppContext jsContext](self, "jsContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v8);

      -[VUIAppContext jsContext](self, "jsContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "exception");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[VUIAppContext jsContext](self, "jsContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "exception");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIAppContext _dispatchError:](self, "_dispatchError:", v12);

        -[VUIAppContext jsContext](self, "jsContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setException:", 0);

      }
      -[VUIAppContext postEvaluationBlocks](self, "postEvaluationBlocks");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (void (**)(_QWORD, _QWORD))v15;
    }
    while (v15);
  }
  -[VUIAppContext setPostEvaluationBlocks:](self, "setPostEvaluationBlocks:", 0);

}

- (void)setPostEvaluationBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_postEvaluationBlocks, a3);
}

- (NSMutableArray)postEvaluationBlocks
{
  return self->_postEvaluationBlocks;
}

void __38__VUIAppContext__prepareStartWithURL___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_startWithURL:", *(_QWORD *)(a1 + 32));

}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *WeakRetained;
  void *v22;
  void *v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(a2, "toObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isString"))
  {
    objc_msgSend(v11, "toString");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  if (objc_msgSend(v12, "isString"))
  {
    objc_msgSend(v12, "toString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  if (objc_msgSend(v13, "isString"))
  {
    objc_msgSend(v13, "toString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  v24 = v11;
  if (objc_msgSend(v14, "isString"))
  {
    objc_msgSend(v14, "toString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)v16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[VUIFormatting sharedInstance](VUIFormatting, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "formatLocalizedNumber:style:postiveFormat:negativeFormat:currencyCode:", v15, v20, v17, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("formatLocalizedNumber expects a Number object"));
    v22 = 0;
  }

  return v22;
}

- (void)_doEvaluate:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void (**)(id, void *))a3;
  if (!-[VUIAppContext isValid](self, "isValid"))
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[VUIAppContext _doEvaluate:].cold.1();

  }
  -[VUIAppContext jsContext](self, "jsContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6);

  -[VUIAppContext jsContext](self, "jsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exception");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[VUIAppContext jsContext](self, "jsContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exception");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppContext _dispatchError:](self, "_dispatchError:", v10);

    -[VUIAppContext jsContext](self, "jsContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setException:", 0);

  }
}

- (JSContext)jsContext
{
  return self->_jsContext;
}

- (BOOL)isValid
{
  return self->_isValid;
}

void __31__VUIAppContext__startWithURL___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v8;
  id v9;

  v9 = a2;
  v8 = a3;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a4;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)launchAppWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUISignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.LaunchApp", ", (uint8_t *)&v11, 2u);
  }

  -[VUIAppContext jsContext](self, "jsContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_INFO, "VUIAppContext - Starting context with options: %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("App"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toObjectOfClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "launchAppWithOptions:", v4);
  VUISignpostLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.LaunchApp", ", (uint8_t *)&v11, 2u);
  }

}

- (void)setPendingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pendingQueue, a3);
}

- (void)setCanAccessPendingQueue:(BOOL)a3
{
  self->_canAccessPendingQueue = a3;
}

- (void)_startWithURL:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  dispatch_semaphore_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  objc_class *v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD block[6];
  _QWORD v24[4];
  NSObject *v25;
  _BYTE *v26;
  uint64_t *v27;
  _QWORD *v28;
  _QWORD v29[4];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t v36[4];
  id v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  VUIAppContext *v41;
  __int16 v42;
  uint64_t v43;
  _BYTE buf[24];
  VUIAppContext *v45;
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[VUIPreference ignoreHTTPCache](VUIPreference, "ignoreHTTPCache"))
  {
    v5 = 1;
  }
  else
  {
    -[VUIAppContext reloadContext](self, "reloadContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = -[VUIAppContext mode](self, "mode");
    *(_WORD *)&buf[22] = 2048;
    v45 = self;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "<%@ (%lu): %p> Attempting to start context with script", buf, 0x20u);

  }
  -[VUIAppContext delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_INFO, "Fetch application script using App Script Loader", buf, 2u);
    }

    v12 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v45 = (VUIAppContext *)__Block_byref_object_copy__38;
    v46 = __Block_byref_object_dispose__38;
    v47 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__38;
    v34 = __Block_byref_object_dispose__38;
    v35 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0;
    v13 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __31__VUIAppContext__startWithURL___block_invoke;
    v24[3] = &unk_1E9FA5260;
    v26 = buf;
    v27 = &v30;
    v28 = v29;
    v14 = v12;
    v25 = v14;
    objc_msgSend(v10, "appContext:scriptForURL:cachePolicy:completion:", self, v4, v5, v24);
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    if (v31[5] || !objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "length"))
    {
      -[VUIAppContext _invalidateJSThread](self, "_invalidateJSThread");
      VUIDefaultLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = -[VUIAppContext mode](self, "mode");
        v21 = v31[5];
        *(_DWORD *)v36 = 138413058;
        v37 = v19;
        v38 = 2048;
        v39 = v20;
        v40 = 2048;
        v41 = self;
        v42 = 2112;
        v43 = v21;
        _os_log_error_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> Failed to load launch URL with error: %@", v36, 0x2Au);

      }
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = __31__VUIAppContext__startWithURL___block_invoke_79;
      block[3] = &unk_1E9F99D88;
      block[4] = self;
      block[5] = v29;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {
      VUIDefaultLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_INFO, "Downloaded application script sussessfully. Starting script...", v36, 2u);
      }

      -[VUIAppContext _startWithScript:scriptUrl:](self, "_startWithScript:scriptUrl:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v4);
    }

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    -[VUIAppContext _invalidateJSThread](self, "_invalidateJSThread");
    VUIDefaultLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[VUIAppContext _startWithURL:].cold.1();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __31__VUIAppContext__startWithURL___block_invoke_80;
    v22[3] = &unk_1E9F98DF0;
    v22[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], v22);
  }

}

- (VUIAppContextDelegate)delegate
{
  return (VUIAppContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (VUIAppReloadContext)reloadContext
{
  return self->_reloadContext;
}

- (void)_startWithScript:(id)a3 scriptUrl:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  unint64_t v33;
  objc_class *v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  os_signpost_id_t v43;
  _QWORD block[4];
  id v45;
  VUIAppContext *v46;
  _QWORD v47[5];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  VUIAppContext *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VUISignpostLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  VUISignpostLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "JS.Evaluate", ", buf, 2u);
  }

  if (objc_msgSend(v6, "length"))
  {
    -[VUIAppContext delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v13, "appContext:shouldStartWithScript:scriptURL:", self, v6, v7) & 1) == 0)
    {
      VUIDefaultLogObject();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[VUIAppContext mode](self, "mode");
        *(_DWORD *)buf = 138413058;
        v49 = v32;
        v50 = 2048;
        v51 = v33;
        v52 = 2048;
        v53 = self;
        v54 = 2112;
        v55 = v7;
        _os_log_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_INFO, "VUIAppContext - <%@ (%lu): %p> Delegate opted to stop script loading from %@", buf, 0x2Au);

      }
      -[VUIAppContext stop](self, "stop");
    }
    else
    {
      -[VUIAppContext app](self, "app");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[VUIAppContext remoteInspectionEnabled](self, "remoteInspectionEnabled");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = objc_msgSend(v14, "shouldAllowRemoteInspection");
      v17 = objc_alloc_init(MEMORY[0x1E0CBE0F0]);
      if (objc_msgSend(v15, "length"))
        objc_msgSend(v17, "setName:", v15);
      objc_msgSend(v17, "_setITMLDebuggableType");
      objc_msgSend(v17, "_setDebuggerRunLoop:", self->_jsThreadRunLoop);
      JSGlobalContextSetInspectable((JSGlobalContextRef)objc_msgSend(v17, "JSGlobalContextRef"), v16);
      -[VUIAppContext setJsContext:](self, "setJsContext:", v17);
      -[VUIAppContext evaluateFoundationJS](self, "evaluateFoundationJS");
      VUISignpostLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D96EE000, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.Evaluate.JSContextEvaluateScript", ", buf, 2u);
      }

      v19 = (id)objc_msgSend(v17, "evaluateScript:withSourceURL:", v6, v7);
      VUISignpostLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D96EE000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.Evaluate.JSContextEvaluateScript", ", buf, 2u);
      }

      objc_msgSend(v17, "exception");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v17, "exception");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        VUIDefaultLogObject();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -[VUIAppContext mode](self, "mode");
          objc_msgSend(v22, "toDictionary");
          v35 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413570;
          v49 = v38;
          v50 = 2048;
          v51 = v37;
          v52 = 2048;
          v53 = self;
          v54 = 2112;
          v55 = v7;
          v56 = 2112;
          v57 = v22;
          v58 = 2112;
          v59 = v35;
          v36 = (void *)v35;
          _os_log_error_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> Unable to start script (%@) because of %@: %@", buf, 0x3Eu);

        }
        objc_msgSend(v17, "setException:", 0);
        -[VUIAppContext _invalidateJSThread](self, "_invalidateJSThread");
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __44__VUIAppContext__startWithScript_scriptUrl___block_invoke_87;
        block[3] = &unk_1E9F98FD8;
        v45 = v22;
        v46 = self;
        v24 = v22;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
      else
      {
        -[VUIAppContext setIsValid:](self, "setIsValid:", 1);
        VUISignpostLogObject();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D96EE000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v9, "JS.Evaluate.AppContextEvaluateScript", ", buf, 2u);
        }

        VUISignpostLogObject();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D96EE000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v9, "JS.Evaluate.AppContextEvaluateScript.Evaluate", ", buf, 2u);
        }

        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __44__VUIAppContext__startWithScript_scriptUrl___block_invoke_88;
        v39[3] = &unk_1E9FA5288;
        v43 = v9;
        v39[4] = self;
        v40 = v14;
        v41 = v7;
        v42 = v6;
        -[VUIAppContext _evaluate:](self, "_evaluate:", v39);

      }
    }

  }
  else
  {
    VUIDefaultLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[VUIAppContext _startWithScript:scriptUrl:].cold.1();

    -[VUIAppContext _invalidateJSThread](self, "_invalidateJSThread");
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __44__VUIAppContext__startWithScript_scriptUrl___block_invoke;
    v47[3] = &unk_1E9F98DF0;
    v47[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], v47);
  }

}

- (void)evaluateFoundationJS
{
  NSObject *v3;
  void *v4;
  VUIJSDevice *v5;
  void *v6;
  void *v7;
  VUIJSDeviceSettings *v8;
  void *v9;
  void *v10;
  VUIJSUserDefaults *v11;
  VUIJSApplication *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  VUISignpostLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.Evaluate.Foundation", ", buf, 2u);
  }

  kdebug_trace();
  -[VUIAppContext jsContext](self, "jsContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VUIJSDevice initWithAppContext:]([VUIJSDevice alloc], "initWithAppContext:", self);
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC69D0], "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("guid"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Device"));
  v8 = -[VUIJSObject initWithAppContext:]([VUIJSDeviceSettings alloc], "initWithAppContext:", self);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("Settings"));

  -[VUIAppContext app](self, "app");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "userDefaultsStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[VUIJSUserDefaults initWithAppContext:userDefaultsStorage:]([VUIJSUserDefaults alloc], "initWithAppContext:userDefaultsStorage:", self, v10);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("userDefaults"));

    }
  }
  v12 = -[VUIJSObject initWithAppContext:]([VUIJSApplication alloc], "initWithAppContext:", self);
  -[VUIAppContext setJsApp:](self, "setJsApp:", v12);

  -[VUIAppContext jsApp](self, "jsApp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("App"));

  -[VUIAppContext _addPrivateInterfaces](self, "_addPrivateInterfaces");
  -[VUIAppContext delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "appContext:evaluateAppJavaScriptInContext:", self, v4);
  VUISignpostLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.Evaluate.Foundation", ", v16, 2u);
  }

  kdebug_trace();
}

- (VUIApplication)app
{
  return (VUIApplication *)objc_loadWeakRetained((id *)&self->_app);
}

- (void)setJsContext:(id)a3
{
  objc_storeStrong((id *)&self->_jsContext, a3);
}

- (void)setJsApp:(id)a3
{
  objc_storeStrong((id *)&self->_jsApp, a3);
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)remoteInspectionEnabled
{
  return self->_remoteInspectionEnabled;
}

- (VUIJSApplication)jsApp
{
  return self->_jsApp;
}

BOOL __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_22()
{
  return +[VUIPPMExtensions isPPMEnabled](VUIPPMExtensions, "isPPMEnabled");
}

- (void)start
{
  NSObject *v3;
  void *v4;
  id v5;
  uint8_t buf[16];

  if (-[VUIAppContext isRunning](self, "isRunning"))
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "VUIAppContext - We are already preparing to start...", buf, 2u);
    }

  }
  else
  {
    -[VUIAppContext setRunning:](self, "setRunning:", 1);
    kdebug_trace();
    -[VUIAppContext app](self, "app");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appJSURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppContext _prepareStartWithURL:](self, "_prepareStartWithURL:", v4);

  }
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (VUIAppContext)initWithApplication:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  id v9;
  VUIAppContext *v10;
  VUIAppContext *v11;
  uint64_t v12;
  NSMutableArray *onStartQueue;
  dispatch_source_t v14;
  OS_dispatch_source *lowMemoryWarningSource;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v8 = a3;
  v9 = a5;
  +[VUIPreference setupJSCoreConsoleLogging](VUIPreference, "setupJSCoreConsoleLogging");
  v21.receiver = self;
  v21.super_class = (Class)VUIAppContext;
  v10 = -[VUIAppContext init](&v21, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_app, v8);
    v11->_respondsToTraitCollection = objc_opt_respondsToSelector() & 1;
    v11->_remoteInspectionEnabled = 1;
    v11->_running = 0;
    v11->_mode = a4;
    objc_storeWeak((id *)&v11->_delegate, v9);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    onStartQueue = v11->_onStartQueue;
    v11->_onStartQueue = (NSMutableArray *)v12;

    v11->_appScriptTimeoutInterval = 30.0;
    v14 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 7uLL, MEMORY[0x1E0C80D38]);
    lowMemoryWarningSource = v11->_lowMemoryWarningSource;
    v11->_lowMemoryWarningSource = (OS_dispatch_source *)v14;

    if (v11->_lowMemoryWarningSource)
    {
      objc_initWeak(&location, v11);
      v16 = v11->_lowMemoryWarningSource;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __51__VUIAppContext_initWithApplication_mode_delegate___block_invoke;
      v18[3] = &unk_1E9F99C98;
      objc_copyWeak(&v19, &location);
      dispatch_source_set_event_handler(v16, v18);
      dispatch_resume((dispatch_object_t)v11->_lowMemoryWarningSource);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }

  return v11;
}

- (void)_sourceScheduledOnRunLoop:(__CFRunLoop *)a3
{
  CFRunLoopSourceSignal(self->_jsThreadRunLoopSource);
  CFRunLoopWakeUp(self->_jsThreadRunLoop);
}

intptr_t __43__VUIAppContext_evaluateDelegateBlockSync___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_appTraitCollection
{
  id WeakRetained;
  void *v3;

  if (self->_respondsToTraitCollection)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_app);
    objc_msgSend(WeakRetained, "appTraitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v3;
}

- (void)evaluateDelegateBlockSync:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  dispatch_semaphore_t v9;
  id v10;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VUIAppContext_evaluateDelegateBlockSync___block_invoke;
  block[3] = &unk_1E9F9C588;
  v9 = v5;
  v10 = v4;
  block[4] = self;
  v6 = v5;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)_dispatchError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  VUIAppContext *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorDispatched"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "toBool");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "toString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("line"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "toString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("column"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "toString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      VUIDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v23 = v21;
        v24 = 2048;
        v25 = -[VUIAppContext mode](self, "mode");
        v26 = 2048;
        v27 = self;
        v28 = 2112;
        v29 = v8;
        v30 = 2112;
        v31 = v10;
        v32 = 2112;
        v33 = v15;
        _os_log_error_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> Error: %@ - %@ - line:%@", buf, 0x3Eu);

      }
      -[VUIAppContext jsContext](self, "jsContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("App"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "toObjectOfClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "dispatchErrorWithMessage:sourceURL:line:", v8, v10, v15);
    }

  }
}

- (void)exitAppWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[VUIAppContext jsContext](self, "jsContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("App"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toObjectOfClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "exitAppWithOptions:", v4);
  -[VUIAppContext jsFoundation](self, "jsFoundation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopTimers");

}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *WeakRetained;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "isString"))
  {
    objc_msgSend(v3, "toString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[VUIFormatting sharedInstance](VUIFormatting, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "formatLocalizedLocaleIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("formatLocalizedLocaleIdentifier expects a String object"));
    v6 = 0;
  }

  return v6;
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *WeakRetained;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "isArray"))
  {
    objc_msgSend(v3, "toArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[VUIFormatting sharedInstance](VUIFormatting, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "joinComponentsWithLocalizedCommaAndSpace:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("joinComponentsWithLocalizedCommaAndSpace expects a String object"));
    v6 = 0;
  }

  return v6;
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *WeakRetained;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "isArray"))
  {
    objc_msgSend(v3, "toArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[VUIFormatting sharedInstance](VUIFormatting, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "joinComponentsWithLocalizedSemicolonAndSpace:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("joinComponentsWithLocalizedSemicolonAndSpace expects a String object"));
    v6 = 0;
  }

  return v6;
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_5()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "jsFoundation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterval:time:", v5, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_7(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "jsFoundation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearInterval:", v3);

}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "jsFoundation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeout:time:", v5, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_9(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "jsFoundation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearTimeout:", v3);

}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *WeakRetained;
  void *v9;

  v5 = a3;
  objc_msgSend(a2, "toObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isString"))
  {
    objc_msgSend(v5, "toString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[VUIFormatting sharedInstance](VUIFormatting, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "formatDate:format:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("formatDate expects a Date object"));
    v9 = 0;
  }

  return v9;
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *WeakRetained;
  void *v9;

  v5 = a3;
  objc_msgSend(a2, "toObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isString"))
  {
    objc_msgSend(v5, "toString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[VUIFormatting sharedInstance](VUIFormatting, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "formatDuration:format:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("formatDuration expects a Number object"));
    v9 = 0;
  }

  return v9;
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *WeakRetained;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(a2, "toObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isString"))
  {
    objc_msgSend(v9, "toString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  if (objc_msgSend(v10, "isString"))
  {
    objc_msgSend(v10, "toString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(v11, "isString"))
  {
    objc_msgSend(v11, "toString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[VUIFormatting sharedInstance](VUIFormatting, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "formatNumber:style:postiveFormat:negativeFormat:", v12, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setException:withErrorMessage:", 0, CFSTR("formatNumber expects a Number object"));
    v17 = 0;
  }

  return v17;
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  if (objc_msgSend(v2, "isString")
    && (objc_msgSend(v2, "toString"), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settingsForChannelID:externalID:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v6, "accessStatus"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v6, "accessStatus"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_14(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!a2)
    return 1;
  v2 = (objc_class *)MEMORY[0x1E0C99E98];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithString:", v3);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canOpenURL:", v4);

  return v6;
}

void __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id WeakRetained;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  if (a2)
  {
    v6 = (objc_class *)MEMORY[0x1E0C99E98];
    v7 = a2;
    v8 = (void *)objc_msgSend([v6 alloc], "initWithString:", v7);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_16;
    v11[3] = &unk_1E9F991D8;
    v12 = v8;
    v13 = v5;
    v10 = v8;
    objc_msgSend(WeakRetained, "evaluateDelegateBlockSync:", v11);

  }
}

void __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_16(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openURL:configuration:completionHandler:", *(_QWORD *)(a1 + 32), 0, 0);

  }
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_17(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (objc_class *)MEMORY[0x1E0C99D50];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithBase64EncodedString:options:", v3, 0);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  return v5;
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  if (objc_msgSend(v2, "isString"))
  {
    objc_msgSend(v2, "toString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataUsingEncoding:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v2, "isInstanceOf:", objc_opt_class()))
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "toObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v5;
}

uint64_t __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_19(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedUppercaseString");
}

uint64_t __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedLowercaseString");
}

uint64_t __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_21(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCapitalizedString");
}

void __51__VUIAppContext_initWithApplication_mode_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "isValid");
    v2 = v4;
    if (v3)
    {
      objc_msgSend(v4, "evaluate:", &__block_literal_global_162);
      v2 = v4;
    }
  }

}

void __51__VUIAppContext_initWithApplication_mode_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  JSGarbageCollect((JSContextRef)objc_msgSend(a2, "JSGlobalContextRef"));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIAppContext;
  -[VUIAppContext dealloc](&v4, sel_dealloc);
}

- (void)suspendWithOptions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__VUIAppContext_suspendWithOptions___block_invoke;
  v6[3] = &unk_1E9F9A938;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[VUIAppContext _enqueueOnStartOrExecute:](self, "_enqueueOnStartOrExecute:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __36__VUIAppContext_suspendWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__VUIAppContext_suspendWithOptions___block_invoke_2;
  v3[3] = &unk_1E9F9B278;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "evaluate:", v3);

}

void __36__VUIAppContext_suspendWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  const OpaqueJSContext *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("App"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toObjectOfClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
    v5 = *(_QWORD *)(a1 + 32);
  else
    v5 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v7, "suspendAppWithOptions:", v5);
  v6 = (const OpaqueJSContext *)objc_msgSend(v3, "JSGlobalContextRef");

  JSGarbageCollect(v6);
}

- (void)resumeWithOptions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__VUIAppContext_resumeWithOptions___block_invoke;
  v6[3] = &unk_1E9F99000;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  -[VUIAppContext _enqueueOnStartOrExecute:](self, "_enqueueOnStartOrExecute:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __35__VUIAppContext_resumeWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[5];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__VUIAppContext_resumeWithOptions___block_invoke_2;
  v4[3] = &unk_1E9FA5210;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(WeakRetained, "evaluate:", v4);

}

void __35__VUIAppContext_resumeWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t buf[16];

  v3 = a2;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "[StartQueue] resumeWithOptions evaluated", buf, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "isValid"))
    v5 = "yes";
  else
    v5 = "no";
  v6 = *(_QWORD *)(a1 + 40);
  v7 = objc_opt_class();
  NSLog(CFSTR("Valid Context? %s. Resume options: %@, class: %@"), v5, v6, v7);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("App"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "toObjectOfClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
    v10 = *(_QWORD *)(a1 + 40);
  else
    v10 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v9, "resumeAppWithOptions:", v10);

}

- (void)openURLWithOptions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__VUIAppContext_openURLWithOptions___block_invoke;
  v6[3] = &unk_1E9F9A938;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[VUIAppContext _enqueueOnStartOrExecute:](self, "_enqueueOnStartOrExecute:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __36__VUIAppContext_openURLWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__VUIAppContext_openURLWithOptions___block_invoke_2;
  v3[3] = &unk_1E9F9B278;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "evaluate:", v3);

}

void __36__VUIAppContext_openURLWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("App"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toObjectOfClass:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v5, "openURLWithOptions:", v4);

}

- (void)reload
{
  -[VUIAppContext _addStopRecordToPendingQueueWithReload:](self, "_addStopRecordToPendingQueueWithReload:", 1);
}

- (void)stop
{
  -[VUIAppContext _addStopRecordToPendingQueueWithReload:](self, "_addStopRecordToPendingQueueWithReload:", 0);
}

- (void)evaluate:(id)a3 completionBlock:(id)a4
{
  -[VUIAppContext evaluate:completionBlock:completionQueue:](self, "evaluate:completionBlock:completionQueue:", a3, a4, 0);
}

- (void)addPostEvaluateBlock:(id)a3
{
  id v4;
  void *v5;
  VUIAppContext *v6;
  void *v7;
  VUIRunLoopSourceRecord *v8;
  VUIRunLoopSourceRecord *v9;
  void *v10;
  __CFRunLoopSource *jsThreadRunLoopSource;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  -[VUIAppContext postEvaluationBlocks](self, "postEvaluationBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VUIAppContext postEvaluationBlocks](self, "postEvaluationBlocks");
    v6 = (VUIAppContext *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "copy");
    -[VUIAppContext addObject:](v6, "addObject:", v7);

  }
  else
  {
    v6 = self;
    objc_sync_enter(v6);
    if (-[VUIAppContext canAccessPendingQueue](v6, "canAccessPendingQueue"))
    {
      objc_initWeak(&location, v6);
      v8 = [VUIRunLoopSourceRecord alloc];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __38__VUIAppContext_addPostEvaluateBlock___block_invoke;
      v12[3] = &unk_1E9F9A060;
      objc_copyWeak(&v14, &location);
      v13 = v4;
      v9 = -[VUIRunLoopSourceRecord initWithEvaluateBlock:completionBlock:](v8, "initWithEvaluateBlock:completionBlock:", v12, 0);
      -[VUIAppContext pendingQueue](v6, "pendingQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertObject:atIndex:", v9, 0);

      if (v6->_jsThreadRunLoop)
      {
        jsThreadRunLoopSource = v6->_jsThreadRunLoopSource;
        if (jsThreadRunLoopSource)
        {
          CFRunLoopSourceSignal(jsThreadRunLoopSource);
          CFRunLoopWakeUp(v6->_jsThreadRunLoop);
        }
      }

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v6);
  }

}

void __38__VUIAppContext_addPostEvaluateBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_doEvaluate:", *(_QWORD *)(a1 + 32));

}

- (void)setException:(id)a3 withErrorMessage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[VUIAppContext jsContext](self, "jsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", v11, v7);
  else
    objc_msgSend(MEMORY[0x1E0CBE108], "valueWithNewErrorFromMessage:inContext:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithBool:inContext:", 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("errorDispatched"));

  objc_msgSend(v7, "setException:", v8);
  -[VUIAppContext _errorWithMessage:](self, "_errorWithMessage:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppContext _dispatchError:](self, "_dispatchError:", v10);

}

- (void)handleReloadWithUrgencyType:(unint64_t)a3 minInterval:(double)a4 data:(id)a5
{
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12[3];
  id location;

  v8 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__VUIAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke;
  block[3] = &unk_1E9FA5238;
  objc_copyWeak(v12, &location);
  v11 = v8;
  v12[1] = (id)a3;
  v12[2] = *(id *)&a4;
  v9 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __62__VUIAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setReloadData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "setReloadContext:", v3);
    v5 = *(_QWORD *)(a1 + 48);
    v8 = CFSTR("VUIAppReloadUrgencyMinSuspensionTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appContext:needsReloadWithUrgency:options:", WeakRetained, v5, v7);
  }
  else
  {
    objc_msgSend(WeakRetained, "app");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__VUIAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke_cold_1((uint64_t)WeakRetained, v6);
  }

}

void __31__VUIAppContext__startWithURL___block_invoke_79(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0DC6BA8];
  v7 = *MEMORY[0x1E0DC6BB0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 101, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "contextDidFailWithError:", v6);
}

void __31__VUIAppContext__startWithURL___block_invoke_80(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0DC6BA8];
  v6 = *MEMORY[0x1E0DC6BB0];
  v7[0] = &unk_1EA0BAAC8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 101, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "contextDidFailWithError:", v5);
}

void __44__VUIAppContext__startWithScript_scriptUrl___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DC6BA8], 101, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contextDidFailWithError:", v2);

}

void __44__VUIAppContext__startWithScript_scriptUrl___block_invoke_87(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0DC6BA8];
  objc_msgSend(*(id *)(a1 + 32), "toDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 101, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "contextDidFailWithError:", v5);
}

void __44__VUIAppContext__startWithScript_scriptUrl___block_invoke_88(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  uint64_t v19;
  void *v20;
  _QWORD block[5];
  id v22;
  uint64_t v23;
  uint8_t buf[16];

  VUISignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v3, OS_SIGNPOST_INTERVAL_END, v4, "JS.Evaluate.AppContextEvaluateScript.Evaluate", ", buf, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "mode") != 1000)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(*(id *)(a1 + 40), "appLaunchParams"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = (void *)objc_msgSend(v5, "mutableCopy"),
          v5,
          !v6))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("location"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (*(_QWORD *)(a1 + 48) && !v7 && objc_msgSend(v8, "length"))
      objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("location"));
    objc_msgSend(*(id *)(a1 + 32), "reloadContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "reloadContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reloadData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("reloadData"));

    }
    v14 = *(void **)(a1 + 32);
    v15 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v14, "launchAppWithOptions:", v15);

  }
  VUISignpostLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = *(_QWORD *)(a1 + 64);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v17, OS_SIGNPOST_INTERVAL_END, v18, "JS.Evaluate.AppContextEvaluateScript", ", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VUIAppContext__startWithScript_scriptUrl___block_invoke_94;
  block[3] = &unk_1E9FA22E0;
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(a1 + 56);
  v23 = *(_QWORD *)(a1 + 64);
  block[4] = v19;
  v22 = v20;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __44__VUIAppContext__startWithScript_scriptUrl___block_invoke_94(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  VUISignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v3, OS_SIGNPOST_INTERVAL_END, v4, "JS.Evaluate", ", buf, 2u);
  }

  VUISignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "JS.contextDidStartWithJS", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "contextDidStartWithJS:options:", *(_QWORD *)(a1 + 40), 0);
  VUISignpostLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 48);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v9, OS_SIGNPOST_INTERVAL_END, v10, "JS.contextDidStartWithJS", ", v11, 2u);
  }

}

- (void)_addStopRecordToPendingQueueWithReload:(BOOL)a3
{
  VUIAppContext *v4;
  VUIRunLoopSourceRecord *v5;
  VUIRunLoopSourceRecord *v6;
  void *v7;
  __CFRunLoopSource *jsThreadRunLoopSource;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  id location;

  v4 = self;
  objc_sync_enter(v4);
  if (-[VUIAppContext canAccessPendingQueue](v4, "canAccessPendingQueue"))
  {
    -[VUIAppContext setCanAccessPendingQueue:](v4, "setCanAccessPendingQueue:", 0);
    objc_initWeak(&location, v4);
    v5 = [VUIRunLoopSourceRecord alloc];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__VUIAppContext__addStopRecordToPendingQueueWithReload___block_invoke;
    v9[3] = &unk_1E9F9A758;
    objc_copyWeak(&v10, &location);
    v11 = a3;
    v6 = -[VUIRunLoopSourceRecord initWithEvaluateBlock:completionBlock:](v5, "initWithEvaluateBlock:completionBlock:", v9, 0);
    -[VUIAppContext pendingQueue](v4, "pendingQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v6);

    if (v4->_jsThreadRunLoop)
    {
      jsThreadRunLoopSource = v4->_jsThreadRunLoopSource;
      if (jsThreadRunLoopSource)
      {
        CFRunLoopSourceSignal(jsThreadRunLoopSource);
        CFRunLoopWakeUp(v4->_jsThreadRunLoop);
      }
    }

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v4);

}

void __56__VUIAppContext__addStopRecordToPendingQueueWithReload___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stopAndReload:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_stopAndReload:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  VUIAppContext *v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD v14[5];
  BOOL v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  VUIAppContext *v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("VUINetworkPropertiesChangedNotification"), 0);

  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v17 = v8;
    v18 = 2048;
    v19 = -[VUIAppContext mode](self, "mode");
    v20 = 2048;
    v21 = self;
    v22 = 1024;
    v23 = v3;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "<%@ (%lu): %p> Stop and reload %d", buf, 0x26u);

  }
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __32__VUIAppContext__stopAndReload___block_invoke;
  v14[3] = &unk_1E9FA52B0;
  v14[4] = self;
  v15 = v3;
  -[VUIAppContext _evaluate:](self, "_evaluate:", v14);
  -[VUIAppContext setIsValid:](self, "setIsValid:", 0);
  -[VUIAppContext setJsContext:](self, "setJsContext:", 0);
  if (v3)
  {
    -[VUIAppContext _invalidateJSThread](self, "_invalidateJSThread");
  }
  else
  {
    -[VUIAppContext setNextJSChecksum:](self, "setNextJSChecksum:", 0);
    v10 = self;
    objc_sync_enter(v10);
    -[VUIAppContext onStartQueue](v10, "onStartQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObjects");

    objc_sync_exit(v10);
    -[VUIAppContext _invalidateJSThread](v10, "_invalidateJSThread");
    -[VUIAppContext setReloadContext:](v10, "setReloadContext:", 0);
  }
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __32__VUIAppContext__stopAndReload___block_invoke_2;
  v12[3] = &unk_1E9F9A5F8;
  v12[4] = self;
  v13 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v12);
}

void __32__VUIAppContext__stopAndReload___block_invoke(uint64_t a1)
{
  void *v1;
  const __CFString *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = CFSTR("true");
  if (!*(_BYTE *)(a1 + 40))
    v2 = CFSTR("false");
  v4 = CFSTR("reloading");
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "exitAppWithOptions:", v3);

}

uint64_t __32__VUIAppContext__stopAndReload___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "contextDidStopWithOptions:", 0);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "start");
  return result;
}

void __31__VUIAppContext__sourcePerform__block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  v2 = (void *)MEMORY[0x1DF0999A8]();
  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, 1);

  objc_autoreleasePoolPop(v2);
}

- (void)_sourceCanceledOnRunLoop:(__CFRunLoop *)a3
{
  VUIAppContext *obj;

  obj = self;
  objc_sync_enter(obj);
  CFRunLoopRemoveSource(obj->_jsThreadRunLoop, obj->_jsThreadRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  CFRunLoopStop(obj->_jsThreadRunLoop);
  objc_sync_exit(obj);

}

- (void)_invalidateJSThread
{
  void *v2;
  VUIAppContext *obj;

  obj = self;
  objc_sync_enter(obj);
  CFRunLoopSourceInvalidate(obj->_jsThreadRunLoopSource);
  CFRunLoopWakeUp(obj->_jsThreadRunLoop);
  obj->_jsThreadRunLoop = 0;
  obj->_jsThreadRunLoopSource = 0;
  -[VUIAppContext pendingQueue](obj, "pendingQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  -[VUIAppContext setPendingQueue:](obj, "setPendingQueue:", 0);
  -[VUIAppContext setCanAccessPendingQueue:](obj, "setCanAccessPendingQueue:", 0);
  -[VUIAppContext setRunning:](obj, "setRunning:", 0);
  objc_sync_exit(obj);

}

- (id)_errorWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIAppContext jsContext](self, "jsContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constructWithArguments:", MEMORY[0x1E0C9AA60]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("message"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("stack"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("[native code]")) & 1) == 0)
        {
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("sourceURL"));
          objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(":"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");
          if (v17 >= 3)
          {
            v18 = v17;
            objc_msgSend(v16, "objectAtIndex:", v17 - 2);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectAtIndex:", v18 - 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("line"));
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("column"));
            }

          }
          goto LABEL_16;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_16:

  return v7;
}

- (void)_enqueueOnStartOrExecute:(id)a3
{
  VUIAppContext *v4;
  void *v5;
  void *v6;
  void (**aBlock)(void);

  aBlock = (void (**)(void))a3;
  if (-[VUIAppContext isValid](self, "isValid"))
  {
    aBlock[2]();
  }
  else
  {
    v4 = self;
    objc_sync_enter(v4);
    -[VUIAppContext onStartQueue](v4, "onStartQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _Block_copy(aBlock);
    objc_msgSend(v5, "addObject:", v6);

    objc_sync_exit(v4);
  }

}

- (void)contextDidStopWithOptions:(id)a3
{
  id v4;

  -[VUIAppContext delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "appContext:didStopWithOptions:", self, 0);

}

- (void)contextDidFailWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VUIAppContext setRunning:](self, "setRunning:", 0);
  -[VUIAppContext delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "appContext:didFailWithError:", self, v5);

}

- (VUIJSFoundation)jsFoundation
{
  return self->_jsFoundation;
}

- (double)appScriptTimeoutInterval
{
  return self->_appScriptTimeoutInterval;
}

- (void)setAppScriptTimeoutInterval:(double)a3
{
  self->_appScriptTimeoutInterval = a3;
}

- (void)setRemoteInspectionEnabled:(BOOL)a3
{
  self->_remoteInspectionEnabled = a3;
}

- (NSString)nextJSChecksum
{
  return self->_nextJSChecksum;
}

- (void)setNextJSChecksum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)responseScript
{
  return self->_responseScript;
}

- (void)setResponseScript:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSError)responseError
{
  return self->_responseError;
}

- (void)setResponseError:(id)a3
{
  objc_storeStrong((id *)&self->_responseError, a3);
}

- (void)setReloadContext:(id)a3
{
  objc_storeStrong((id *)&self->_reloadContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postEvaluationBlocks, 0);
  objc_storeStrong((id *)&self->_pendingQueue, 0);
  objc_storeStrong((id *)&self->_reloadContext, 0);
  objc_storeStrong((id *)&self->_responseError, 0);
  objc_storeStrong((id *)&self->_responseScript, 0);
  objc_storeStrong((id *)&self->_onStartQueue, 0);
  objc_storeStrong((id *)&self->_nextJSChecksum, 0);
  objc_storeStrong((id *)&self->_jsContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_jsFoundation, 0);
  objc_storeStrong((id *)&self->_jsApp, 0);
  objc_destroyWeak((id *)&self->_app);
  objc_storeStrong((id *)&self->_lowMemoryWarningSource, 0);
}

void __62__VUIAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_24();
  objc_msgSend(a2, "appIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_1_26(&dword_1D96EE000, v6, v7, "VUIAppContext - <%@ (%lu): %p> %@ hasn't implemented reload API", v8, v9, v10, v11, v12);

}

- (void)_startWithURL:.cold.1()
{
  void *v0;
  objc_class *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_25();
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_2_36(&dword_1D96EE000, v2, v3, "<%@ (%lu): %p> Failed to load launch URL due to no app loader provided", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)_startWithScript:scriptUrl:.cold.1()
{
  void *v0;
  objc_class *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_24();
  OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_6_19();
  OUTLINED_FUNCTION_1_26(&dword_1D96EE000, v2, v3, "<%@ (%lu): %p> Trying to load a script with zero length from %@", v4, v5, v6, v7, v8);

}

- (void)_doEvaluate:.cold.1()
{
  void *v0;
  objc_class *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_25();
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_2_36(&dword_1D96EE000, v2, v3, "<%@ (%lu): %p> Evaluating block without JSContext", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

@end
