@implementation WBSCertificateBypassManager

- (void)clearCertificateBypassesCreatedBeforeDate:(id)a3
{
  -[WBSCertificateBypassManager _clearBypassesInRelationToDate:comparison:](self, "_clearBypassesInRelationToDate:comparison:", a3, -1);
}

void __44__WBSCertificateBypassManager_sharedManager__block_invoke()
{
  WBSCertificateBypassManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBSCertificateBypassManager);
  v1 = (void *)+[WBSCertificateBypassManager sharedManager]::manager;
  +[WBSCertificateBypassManager sharedManager]::manager = (uint64_t)v0;

}

- (WBSCertificateBypassManager)init
{
  WBSCertificateBypassManager *v2;
  WBSCertificateBypassManager *v3;
  uint64_t v4;
  NSMutableDictionary *bypassedHostsToCertificateExceptions;
  uint64_t v6;
  NSMutableDictionary *bypassedHostsToCertificateExceptionsInPrivateBrowsing;
  id v8;
  void *v9;
  uint64_t v10;
  WBSCoalescedAsynchronousWriter *plistWriter;
  WBSCertificateBypassManager *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WBSCertificateBypassManager;
  v2 = -[WBSCertificateBypassManager init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WBSCertificateBypassManager _readStateFromStorage](v2, "_readStateFromStorage");
    v4 = objc_claimAutoreleasedReturnValue();
    bypassedHostsToCertificateExceptions = v3->_bypassedHostsToCertificateExceptions;
    v3->_bypassedHostsToCertificateExceptions = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    bypassedHostsToCertificateExceptionsInPrivateBrowsing = v3->_bypassedHostsToCertificateExceptionsInPrivateBrowsing;
    v3->_bypassedHostsToCertificateExceptionsInPrivateBrowsing = (NSMutableDictionary *)v6;

    objc_initWeak(&location, v3);
    v8 = objc_alloc(MEMORY[0x1E0D89BC0]);
    _urlForStorage();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __35__WBSCertificateBypassManager_init__block_invoke;
    v14[3] = &unk_1E4B2A798;
    objc_copyWeak(&v15, &location);
    v10 = objc_msgSend(v8, "initWithName:fileURL:dataSourceQueue:plistFormat:plistDictionarySourceBlock:", CFSTR("CertificateBypassesWriter"), v9, 0, 200, v14);
    plistWriter = v3->_plistWriter;
    v3->_plistWriter = (WBSCoalescedAsynchronousWriter *)v10;

    v12 = v3;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (id)_readStateFromStorage
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;

  _urlForStorage();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfURL:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v5;

  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXCertificates();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WBSCertificateBypassManager _readStateFromStorage].cold.1(v6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_clearBypassesInRelationToDate:(id)a3 comparison:(int64_t)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *bypassedHostsToCertificateExceptions;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;
  int64_t v18;

  v6 = a3;
  v7 = (void *)-[NSMutableDictionary mutableCopy](self->_bypassedHostsToCertificateExceptions, "mutableCopy");
  bypassedHostsToCertificateExceptions = self->_bypassedHostsToCertificateExceptions;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __73__WBSCertificateBypassManager__clearBypassesInRelationToDate_comparison___block_invoke;
  v15 = &unk_1E4B2A7C0;
  v11 = v6;
  v16 = v11;
  v18 = a4;
  v9 = v7;
  v17 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bypassedHostsToCertificateExceptions, "enumerateKeysAndObjectsUsingBlock:", &v12);
  v10 = -[NSMutableDictionary count](self->_bypassedHostsToCertificateExceptions, "count");
  if (v10 != objc_msgSend(v9, "count"))
  {
    objc_storeStrong((id *)&self->_bypassedHostsToCertificateExceptions, v7);
    -[WBSCoalescedAsynchronousWriter scheduleWrite](self->_plistWriter, "scheduleWrite", v11, v12, v13, v14, v15, v16);
  }

}

+ (WBSCertificateBypassManager)sharedManager
{
  if (+[WBSCertificateBypassManager sharedManager]::onceToken != -1)
    dispatch_once(&+[WBSCertificateBypassManager sharedManager]::onceToken, &__block_literal_global_10);
  return (WBSCertificateBypassManager *)(id)+[WBSCertificateBypassManager sharedManager]::manager;
}

id __35__WBSCertificateBypassManager_init__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained[1];

  return v2;
}

- (BOOL)didInvalidCertificateExceptionsApplySuccessfullyForProtectionSpace:(id)a3 inPrivateBrowsing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  v7 = -[WBSCertificateBypassManager _didCertificatExceptionsApplySuccessfully:protectionSpace:](self, "_didCertificatExceptionsApplySuccessfully:protectionSpace:", self->_bypassedHostsToCertificateExceptions, v6);
  if (!v4 || v7)
    v8 = v4 || v7;
  else
    v8 = -[WBSCertificateBypassManager _didCertificatExceptionsApplySuccessfully:protectionSpace:](self, "_didCertificatExceptionsApplySuccessfully:protectionSpace:", self->_bypassedHostsToCertificateExceptionsInPrivateBrowsing, v6);

  return v8;
}

- (BOOL)_didCertificatExceptionsApplySuccessfully:(id)a3 protectionSpace:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFData *v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  -[WBSCertificateBypassManager _hostAndPortForProtectionSpace:](self, "_hostAndPortForProtectionSpace:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_dataForKey:", CFSTR("BypassedInvalidCertificateExceptionData"));
    v11 = (const __CFData *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = SecTrustSetExceptions((SecTrustRef)objc_msgSend(v7, "serverTrust"), v11);
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)rememberCertificateBypassForProtectionSpace:(id)a3 inPrivateBrowsing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  __SecTrust *v7;
  CFDataRef v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[2];
  _QWORD v18[3];

  v4 = a4;
  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__SecTrust *)objc_msgSend(v6, "serverTrust");
  if (v7)
  {
    v8 = SecTrustCopyExceptions(v7);
    -[WBSCertificateBypassManager _hostAndPortForProtectionSpace:](self, "_hostAndPortForProtectionSpace:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v17[0] = CFSTR("BypassedInvalidCertificateExceptionData");
      v17[1] = CFSTR("BypassedInvalidCertificateHost");
      v18[0] = v8;
      objc_msgSend(v6, "host");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bypassedHostsToCertificateExceptionsInPrivateBrowsing, "setObject:forKeyedSubscript:", v11, v9);

    }
    else
    {
      v15[0] = CFSTR("BypassedInvalidCertificateDate");
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v12;
      v16[1] = v8;
      v15[1] = CFSTR("BypassedInvalidCertificateExceptionData");
      v15[2] = CFSTR("BypassedInvalidCertificateHost");
      objc_msgSend(v6, "host");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bypassedHostsToCertificateExceptions, "setObject:forKeyedSubscript:", v14, v9);

      -[WBSCoalescedAsynchronousWriter scheduleWrite](self->_plistWriter, "scheduleWrite");
    }

  }
}

- (void)clearCertificateBypassesForHostIfNecessary:(id)a3 withTrust:(__SecTrust *)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *bypassedHostsToCertificateExceptions;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __SecTrust *v15;

  v6 = a3;
  if (a4)
  {
    v11 = v6;
    v7 = (void *)-[NSMutableDictionary mutableCopy](self->_bypassedHostsToCertificateExceptions, "mutableCopy");
    bypassedHostsToCertificateExceptions = self->_bypassedHostsToCertificateExceptions;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__WBSCertificateBypassManager_clearCertificateBypassesForHostIfNecessary_withTrust___block_invoke;
    v12[3] = &unk_1E4B2A7C0;
    v15 = a4;
    v13 = v11;
    v9 = v7;
    v14 = v9;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bypassedHostsToCertificateExceptions, "enumerateKeysAndObjectsUsingBlock:", v12);
    v10 = -[NSMutableDictionary count](self->_bypassedHostsToCertificateExceptions, "count");
    if (v10 != objc_msgSend(v9, "count"))
    {
      objc_storeStrong((id *)&self->_bypassedHostsToCertificateExceptions, v7);
      -[WBSCoalescedAsynchronousWriter scheduleWrite](self->_plistWriter, "scheduleWrite");
    }

    v6 = v11;
  }

}

void __84__WBSCertificateBypassManager_clearCertificateBypassesForHostIfNecessary_withTrust___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  CFDataRef v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "safari_stringForKey:", CFSTR("BypassedInvalidCertificateHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_dataForKey:", CFSTR("BypassedInvalidCertificateExceptionData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SecTrustCopyExceptions(*(SecTrustRef *)(a1 + 48));
  if (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32))
    && (objc_msgSend(v7, "isEqualToData:", v8) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v9);
  }

}

- (void)clearCertificateBypassesCreatedAfterDate:(id)a3
{
  -[WBSCertificateBypassManager _clearBypassesInRelationToDate:comparison:](self, "_clearBypassesInRelationToDate:comparison:", a3, 1);
}

void __73__WBSCertificateBypassManager__clearBypassesInRelationToDate_comparison___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "safari_dateForKey:", CFSTR("BypassedInvalidCertificateDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "compare:", *(_QWORD *)(a1 + 32)) == *(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", 0, v6);

}

- (void)savePendingChangesBeforeTermination
{
  -[WBSCoalescedAsynchronousWriter completePendingWriteSynchronously](self->_plistWriter, "completePendingWriteSynchronously");
}

- (id)_hostAndPortForProtectionSpace:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "port"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistWriter, 0);
  objc_storeStrong((id *)&self->_bypassedHostsToCertificateExceptionsInPrivateBrowsing, 0);
  objc_storeStrong((id *)&self->_bypassedHostsToCertificateExceptions, 0);
}

- (void)_readStateFromStorage
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Could not get certificate bypass plist URL", v1, 2u);
}

@end
