@implementation APNSURLSessionDemultiplexerManager

- (APNSURLSessionDemultiplexerManager)initWithProxySessionConfigProvider:(id)a3
{
  id v5;
  APNSURLSessionDemultiplexerManager *v6;
  APUnfairRecursiveLock *v7;
  APUnfairRecursiveLock *lock;
  APOrderedMutableDictionary *v9;
  APOrderedMutableDictionary *sessionDemultiplexerForIdentifier;
  NSOperationQueue *v11;
  NSOperationQueue *sessionSharedDelegateQueue;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)APNSURLSessionDemultiplexerManager;
  v6 = -[APNSURLSessionDemultiplexerManager init](&v20, sel_init);
  if (v6)
  {
    v7 = (APUnfairRecursiveLock *)objc_alloc_init(MEMORY[0x24BDFD4C8]);
    lock = v6->_lock;
    v6->_lock = v7;

    v9 = (APOrderedMutableDictionary *)objc_alloc_init(MEMORY[0x24BDFD4A0]);
    sessionDemultiplexerForIdentifier = v6->_sessionDemultiplexerForIdentifier;
    v6->_sessionDemultiplexerForIdentifier = v9;

    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    sessionSharedDelegateQueue = v6->_sessionSharedDelegateQueue;
    v6->_sessionSharedDelegateQueue = v11;

    objc_msgSend_setMaxConcurrentOperationCount_(v6->_sessionSharedDelegateQueue, v13, 1, v14, v15);
    objc_msgSend_setName_(v6->_sessionSharedDelegateQueue, v16, (uint64_t)CFSTR("com.apple.ap.pc.proxy.session-shared-delegate"), v17, v18);
    objc_storeStrong((id *)&v6->_sessionConfigProvider, a3);
  }

  return v6;
}

- (id)sessionDemultiplexerForAdByIdentifier:(id)a3 maximumRequestCount:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (a3)
  {
    v6 = a3;
    objc_msgSend_lock(self, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v11, v12, v13, v14, v15);
    objc_msgSend__getSessionDemultiplexerForId_maximumRequestCount_(self, v16, (uint64_t)v6, a4, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_unlock(v11, v19, v20, v21, v22);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (id)_getSessionDemultiplexerForId:(id)a3 maximumRequestCount:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  APNSURLSessionDemultiplexer *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v74;
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend_sessionDemultiplexerForIdentifier(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)v6, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v20 = v15;
  }
  else
  {
    objc_msgSend_sessionConfigProvider(self, v16, v17, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_connectProxyConfig(v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = [APNSURLSessionDemultiplexer alloc];
    objc_msgSend_sessionSharedDelegateQueue(self, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend_initWithConfiguration_forIdentifier_withMaximumRequestCount_delegateQueue_(v27, v33, (uint64_t)v26, (uint64_t)v6, a4, v32);

    objc_msgSend_sessionDemultiplexerForIdentifier(self, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend_count(v39, v40, v41, v42, v43);

    if (v44 == 49)
    {
      APLogForCategory();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        v74 = 134217984;
        v75 = 50;
        _os_log_impl(&dword_22ACB2000, v49, OS_LOG_TYPE_INFO, "Reached cap %lu of demultiplexer sessions.", (uint8_t *)&v74, 0xCu);
      }

    }
    objc_msgSend_sessionDemultiplexerForIdentifier(self, v45, v46, v47, v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v34, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v50, v56, (uint64_t)v34, (uint64_t)v55, v57);

    APLogForCategory();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_sessionDemultiplexerForIdentifier(self, v59, v60, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend_count(v63, v64, v65, v66, v67);
      v74 = 134217984;
      v75 = v68;
      _os_log_impl(&dword_22ACB2000, v58, OS_LOG_TYPE_DEBUG, "Current demultiplexers count is %lu.", (uint8_t *)&v74, 0xCu);

    }
    objc_msgSend__unregisterOldSessionIfRequired(self, v69, v70, v71, v72);
    v20 = v34;

  }
  return v20;
}

- (void)_unregisterOldSessionIfRequired
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  objc_msgSend_sessionDemultiplexerForIdentifier(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v6, v7, v8, v9, v10);

  if (v11 >= 0x33)
  {
    objc_msgSend_sessionDemultiplexerForIdentifier(self, v12, v13, v14, v15);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstKey(v24, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__unregisterSessionDemultiplexerWithIdentifier_(self, v21, (uint64_t)v20, v22, v23);

  }
}

- (void)_unregisterSessionDemultiplexerWithIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_sessionDemultiplexerForIdentifier(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_22ACB3C90;
    v18[3] = &unk_24F4E1898;
    v18[4] = self;
    v19 = v4;
    objc_msgSend_invalidateAndCancelSessionWithCompletionHandler_(v13, v14, (uint64_t)v18, v15, v16);

  }
  else
  {
    APLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v4;
      _os_log_impl(&dword_22ACB2000, v17, OS_LOG_TYPE_INFO, "Demultiplexer session '%{public}@' was not found in a list of active sessions. Can't invalidate session.", buf, 0xCu);
    }

  }
}

- (void)unregisterSessionDemultiplexerWithIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  if (a3)
  {
    v4 = a3;
    objc_msgSend_lock(self, v5, v6, v7, v8);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v20, v9, v10, v11, v12);
    objc_msgSend__unregisterSessionDemultiplexerWithIdentifier_(self, v13, (uint64_t)v4, v14, v15);

    objc_msgSend_unlock(v20, v16, v17, v18, v19);
  }
}

- (int64_t)pretapRequestCountForIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;

  if (!a3)
    return 0;
  v4 = a3;
  objc_msgSend_lock(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v9, v10, v11, v12, v13);
  objc_msgSend_sessionDemultiplexerForIdentifier(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)v4, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_unlock(v9, v23, v24, v25, v26);
  if (v22)
    v31 = objc_msgSend_requestCount(v22, v27, v28, v29, v30);
  else
    v31 = 0;

  return v31;
}

- (APOrderedMutableDictionary)sessionDemultiplexerForIdentifier
{
  return self->_sessionDemultiplexerForIdentifier;
}

- (void)setSessionDemultiplexerForIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionDemultiplexerForIdentifier, a3);
}

- (NSOperationQueue)sessionSharedDelegateQueue
{
  return self->_sessionSharedDelegateQueue;
}

- (void)setSessionSharedDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sessionSharedDelegateQueue, a3);
}

- (APProxySessionConfigurationProvider)sessionConfigProvider
{
  return self->_sessionConfigProvider;
}

- (void)setSessionConfigProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sessionConfigProvider, a3);
}

- (APUnfairRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_sessionConfigProvider, 0);
  objc_storeStrong((id *)&self->_sessionSharedDelegateQueue, 0);
  objc_storeStrong((id *)&self->_sessionDemultiplexerForIdentifier, 0);
}

@end
