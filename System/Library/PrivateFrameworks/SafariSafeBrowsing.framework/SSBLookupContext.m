@implementation SSBLookupContext

+ (id)sharedLookupContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __39__SSBLookupContext_sharedLookupContext__block_invoke;
  block[3] = &__block_descriptor_33_ea8_32c52_ZTSKZ39__SSBLookupContext_sharedLookupContext_E3__0_e5_v8__0l;
  if (+[SSBLookupContext sharedLookupContext]::onceToken != -1)
    dispatch_once(&+[SSBLookupContext sharedLookupContext]::onceToken, block);
  return (id)+[SSBLookupContext sharedLookupContext]::lookupContext;
}

void __39__SSBLookupContext_sharedLookupContext__block_invoke()
{
  SSBLookupContext *v0;
  void *v1;

  v0 = objc_alloc_init(SSBLookupContext);
  v1 = (void *)+[SSBLookupContext sharedLookupContext]::lookupContext;
  +[SSBLookupContext sharedLookupContext]::lookupContext = (uint64_t)v0;

}

- (SSBLookupContext)init
{
  SSBLookupContext *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  LookupContext *ptr;
  uint64_t (***v7)();
  uint64_t v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v10;
  SSBLookupContext *v11;
  id to;
  __int128 location;
  objc_super v15;
  uint64_t (**v16)();
  id v17;
  uint64_t (***v18)();
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)SSBLookupContext;
  v2 = -[SSBLookupContext init](&v15, sel_init);
  if (v2)
  {
    _ZNSt3__115allocate_sharedB8sn180100IN12SafeBrowsing13LookupContextENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&location);
    std::shared_ptr<ByteProvider>::operator=[abi:sn180100]((uint64_t)&v2->_lookupContext, &location);
    v3 = (std::__shared_weak_count *)*((_QWORD *)&location + 1);
    if (*((_QWORD *)&location + 1))
    {
      v4 = (unint64_t *)(*((_QWORD *)&location + 1) + 8);
      do
        v5 = __ldaxr(v4);
      while (__stlxr(v5 - 1, v4));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    objc_initWeak((id *)&location, v2);
    ptr = v2->_lookupContext.__ptr_;
    objc_copyWeak(&to, (id *)&location);
    v18 = 0;
    v16 = off_1EA3EB220;
    objc_moveWeak(&v17, &to);
    v18 = &v16;
    objc_destroyWeak(&to);
    v2->_observerToken = SafeBrowsing::LookupContext::addDatabaseUpdateObserver(ptr, (uint64_t)&v16);
    v7 = v18;
    if (v18 == &v16)
    {
      v8 = 4;
      v7 = &v16;
    }
    else
    {
      if (!v18)
      {
LABEL_12:
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)safeBrowsingEnabledStateChanged, CFSTR("SafeBrowsingEnabledStateDidChangeNotification"), 0, (CFNotificationSuspensionBehavior)1028);
        objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObserver:", v2);

        v11 = v2;
        objc_destroyWeak((id *)&location);
        goto LABEL_13;
      }
      v8 = 5;
    }
    (*v7)[v8]();
    goto LABEL_12;
  }
LABEL_13:

  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  SafeBrowsing::LookupContext::removeDatabaseUpdateObserver((SafeBrowsing::LookupContext *)self->_lookupContext.__ptr_, self->_observerToken);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SafeBrowsingEnabledStateDidChangeNotification"), 0);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SSBLookupContext;
  -[SSBLookupContext dealloc](&v5, sel_dealloc);
}

- (void)lookUpURL:(id)a3 completionHandler:(id)a4
{
  -[SSBLookupContext _lookUpURL:ignoreEnableState:completionHandler:](self, "_lookUpURL:ignoreEnableState:completionHandler:", a3, 1, a4);
}

- (void)_lookUpURL:(id)a3 ignoreEnableState:(int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  LookupContext *ptr;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint8_t v17[8];
  _QWORD v18[3];
  _QWORD *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = SSBOSLogLookup();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1DBCBE000, v10, OS_LOG_TYPE_INFO, "Look up a url", v17, 2u);
  }
  v11 = SSBOSLogLookup();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SSBLookupContext _lookUpURL:ignoreEnableState:completionHandler:].cold.1((uint64_t)v8, v11);
  ptr = self->_lookupContext.__ptr_;
  v13 = v8;
  v14 = MEMORY[0x1DF0B8E90](v9);
  v18[0] = off_1EA3EB2B0;
  v18[1] = v13;
  v18[2] = v14;
  v19 = v18;
  SafeBrowsing::LookupContext::lookUpURL(ptr, v13, a4, (uint64_t)v18);
  v15 = v19;
  if (v19 == v18)
  {
    v16 = 4;
    v15 = v18;
    goto LABEL_9;
  }
  if (v19)
  {
    v16 = 5;
LABEL_9:
    (*(void (**)(void))(*v15 + 8 * v16))();
  }

}

- (void).cxx_destruct
{
  std::shared_ptr<Platform::SharedMemory>::~shared_ptr[abi:sn180100]((uint64_t)&self->_lookupContext);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)_forceDatabaseUpdateWithCompletionHandler:(id)a3
{
  LookupContext *ptr;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ptr = self->_lookupContext.__ptr_;
  v6[0] = off_1EA3EB3D0;
  v6[1] = MEMORY[0x1DF0B8E90](a3, a2);
  v7 = v6;
  SafeBrowsing::LookupContext::forceDatabaseUpdate(ptr, (uint64_t)v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (void)_forceDeviceIdentificationTokenUpdateWithCompletionHandler:(id)a3
{
  LookupContext *ptr;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ptr = self->_lookupContext.__ptr_;
  v6[0] = off_1EA3EB4F0;
  v6[1] = MEMORY[0x1DF0B8E90](a3, a2);
  v7 = v6;
  SafeBrowsing::LookupContext::forceDeviceIdentificationTokenUpdate(ptr, (uint64_t)v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (void)_getDatabaseStatusWithCompletionHandler:(id)a3
{
  LookupContext *ptr;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ptr = self->_lookupContext.__ptr_;
  v6[0] = off_1EA3EB340;
  v6[1] = MEMORY[0x1DF0B8E90](a3, a2);
  v7 = v6;
  SafeBrowsing::LookupContext::getDatabaseStatus(ptr, (uint64_t)v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (void)_getServiceStatusWithCompletionHandler:(id)a3
{
  LookupContext *ptr;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ptr = self->_lookupContext.__ptr_;
  v6[0] = off_1EA3EB2F8;
  v6[1] = MEMORY[0x1DF0B8E90](a3, a2);
  v7 = v6;
  SafeBrowsing::LookupContext::getServiceStatus(ptr, (uint64_t)v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (void)_forceLoadRemoteConfigurationFromDiskWithCompletionHandler:(id)a3
{
  LookupContext *ptr;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ptr = self->_lookupContext.__ptr_;
  v6[0] = off_1EA3EB538;
  v6[1] = MEMORY[0x1DF0B8E90](a3, a2);
  v7 = v6;
  SafeBrowsing::LookupContext::forceLoadRemoteConfigurationFromDisk(ptr, (uint64_t)v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (void)_forceUpdateRemoteConfigurationFromServerWithCompletionHandler:(id)a3
{
  LookupContext *ptr;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ptr = self->_lookupContext.__ptr_;
  v6[0] = off_1EA3EB580;
  v6[1] = MEMORY[0x1DF0B8E90](a3, a2);
  v7 = v6;
  SafeBrowsing::LookupContext::forceUpdateRemoteConfigurationFromServer(ptr, (uint64_t)v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (void)_deleteAllDatabasesWithCompletionHandler:(id)a3
{
  LookupContext *ptr;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ptr = self->_lookupContext.__ptr_;
  v6[0] = off_1EA3EB388;
  v6[1] = MEMORY[0x1DF0B8E90](a3, a2);
  v7 = v6;
  SafeBrowsing::LookupContext::deleteAllDatabases(ptr, (uint64_t)v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (void)_fetchCellularDataPlanWithCompletionHandler:(id)a3
{
  LookupContext *ptr;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ptr = self->_lookupContext.__ptr_;
  v6[0] = off_1EA3EB418;
  v6[1] = MEMORY[0x1DF0B8E90](a3, a2);
  v7 = v6;
  SafeBrowsing::LookupContext::fetchCellularDataPlan(ptr, (uint64_t)v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (void)_getLastDatabaseUpdateTimeWithCompletionHandler:(id)a3
{
  LookupContext *ptr;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ptr = self->_lookupContext.__ptr_;
  v6[0] = off_1EA3EB460;
  v6[1] = MEMORY[0x1DF0B8E90](a3, a2);
  v7 = v6;
  SafeBrowsing::LookupContext::getLastDatabaseUpdateTime(ptr, (uint64_t)v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (void)_lookUpURLs:(id)a3 forProtectionType:(int64_t)a4 completionHandler:(id)a5
{
  void (**v6)(id, SSBLookupResult *, _QWORD);
  SSBLookupResult *v7;
  void (**v8)(id, SSBLookupResult *, _QWORD);

  v6 = (void (**)(id, SSBLookupResult *, _QWORD))a5;
  if (a4 == 1)
  {
    v8 = v6;
    v7 = objc_alloc_init(SSBLookupResult);
    v8[2](v8, v7, 0);

    v6 = v8;
  }

}

- (void)_setSafeBrowsingEnabledStateNeedsUpdate
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = SSBOSLogEnabledState();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DBCBE000, v3, OS_LOG_TYPE_INFO, "Set safe browsing enabled state needs update", v4, 2u);
  }
  SafeBrowsing::LookupContext::setSafeBrowsingEnabledStateNeedsUpdate((SafeBrowsing::LookupContext *)self->_lookupContext.__ptr_);
}

- (void)_getSafeBrowsingEnabledState:(id)a3
{
  LookupContext *ptr;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ptr = self->_lookupContext.__ptr_;
  v6[0] = off_1EA3EB268;
  v6[1] = MEMORY[0x1DF0B8E90](a3, a2);
  v7 = v6;
  SafeBrowsing::LookupContext::getSafeBrowsingEnabledState(ptr, (uint64_t)v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (void)_forceLookUpURL:(id)a3 completionHandler:(id)a4
{
  -[SSBLookupContext _lookUpURL:ignoreEnableState:completionHandler:](self, "_lookUpURL:ignoreEnableState:completionHandler:", a3, 0, a4);
}

- (uint64_t)init
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (void)init
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD block[5];
  id v6;

  v2 = *a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = ___ZZ24__SSBLookupContext_init_ENK3__1clEN7Backend6Google21DatabaseConfigurationE_block_invoke;
  block[3] = &__block_descriptor_48_ea8_32c89_ZTSKZZ24__SSBLookupContext_init_ENK3__1clEN7Backend6Google21DatabaseConfigurationEEUlvE__e5_v8__0l;
  v3 = v2;
  objc_copyWeak(&v4, (id *)(a1 + 8));
  block[4] = v3;
  objc_copyWeak(&v6, &v4);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
}

- (id)init
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = off_1EA3EB220;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (uint64_t)_lookUpURL:ignoreEnableState:completionHandler:
{
  uint64_t result;

  *a2 = off_1EA3EB2B0;
  a2[1] = *(id *)(a1 + 8);
  result = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 16));
  a2[2] = result;
  return result;
}

- (void)_lookUpURL:ignoreEnableState:completionHandler:
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  id v9;
  id v10;

  v4 = *(_QWORD **)a2;
  v5 = *(_QWORD **)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  if (*(_QWORD *)&a3->__val_)
  {
    nsErrorFromReplyErrorCode(*a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 != v5)
  {
    v8 = v4;
    do
    {
      v9 = -[SSBServiceLookupResult _initWithLookupResult:]([SSBServiceLookupResult alloc], "_initWithLookupResult:", *v8);
      objc_msgSend(v7, "addObject:", v9);

      ++v8;
    }
    while (v8 != v5);
  }
  v10 = -[SSBLookupResult _initWithServiceLookUpResults:URLContainsUserInfo:]([SSBLookupResult alloc], "_initWithServiceLookUpResults:URLContainsUserInfo:", v7, objc_msgSend(*(id *)(a1 + 8), "ssb_hasUserInfo"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();

  if (v4)
    operator delete(v4);
}

- (_QWORD)_lookUpURL:ignoreEnableState:completionHandler:
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  *v2 = off_1EA3EB2B0;
  v2[1] = *(id *)(a1 + 8);
  v2[2] = MEMORY[0x1DF0B8E90](*(_QWORD *)(a1 + 16));
  return v2;
}

- (void)_lookUpURL:(uint64_t)a1 ignoreEnableState:(NSObject *)a2 completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DBCBE000, a2, OS_LOG_TYPE_DEBUG, "Look up a url %@", (uint8_t *)&v2, 0xCu);
}

@end
